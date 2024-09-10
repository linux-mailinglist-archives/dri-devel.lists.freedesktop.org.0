Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892EC974AAD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 08:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A825010E9E7;
	Wed, 11 Sep 2024 06:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RS6VGqhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ABF10E8F2;
 Tue, 10 Sep 2024 18:48:27 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6d49cec2a5dso54860657b3.3; 
 Tue, 10 Sep 2024 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725994107; x=1726598907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/xjSlwYNHaCmAEJ52/LetuJr/79SrxTHSb7l1iYHbQ=;
 b=RS6VGqhT7OoLet7ZDMgI6UkUMV9+VZOOJWa/A/Rt+80sSPdfbENqvArTmxJebbIjur
 sgDPle1JEB6dHL5CI62C7o+zXDuGHuWi5El5NHf2F5n+DqgbrDKqg4pHxCiteOe28lRp
 xIXrKti362s0YwurE97q3alPcA3AQGWLm9PrJCSYwoj2iQlTVFuPcZHrYn/LzDu27qEj
 +jah11ZXATynkbOXSR/RnSp5Y2pHsSI9F89H5J7CE+2go0cp8oWgdD9m0axMX1Ot6Yc7
 plgvKu+VMAFGYfriSECFMnIds5KR3rKV6H5hpLruMJwbn77FMffst7U0+V6DUc758HjP
 InzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725994107; x=1726598907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/xjSlwYNHaCmAEJ52/LetuJr/79SrxTHSb7l1iYHbQ=;
 b=LAsDqzJLEXoxIS0pTxzDOjOTd7dj9ZQwaeTBD1CYoRQThNMqAgbX2T8vW+D7SO0Q7P
 uvVF6JWGHpnd2UIzC121/5L/ZNWAbaBFO7sMdYim3H3a1hzXzvAy1qyF6XGmhg3tlAQZ
 2l1N101a+cjG+sa2+jc8zrNJucB43QPD9DegCd3habnhDktJdb6Fnz8O/YKF67BIt3Hm
 wo01tJc8f1DXmukpKbpUloUZzQSIyz2GkdpW45dIfLdV/GykEFGrA0NTbR6TOjKqaD4X
 j6d7VUcQV/HjksGskTImTc3dYQkZQm9UTNKK11XQ/++yv+aqQMcQn6wPOLEhtJDdMSQx
 lOdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVazwLyZJntowGFpnLHxCQz8r0RBebX10vDNpsP9rKsWn7NJOfe2rV3EJ/53vHqlGJKLvrvmKHIW4=@lists.freedesktop.org,
 AJvYcCX6Q5N40CpYEw80DgF5xQlpCS/HZ/dJJUm2VQDbNnJst9ln9+jJwop6vZyi+RzTKyjllNxrMfQoPEdq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrmGc90DeaCdmW6sM6fJUdZEKEsgMwVyDdumdICtlWiCB0QNY/
 z0d+XsKmIQ5rtmI6jGlET72r7b6fEiK33satl2+RI6ifCE9eZKJxeLuv+IDLGMX++VGehdt0qn3
 Q6mjkeaVCbJ1C3jpmWxuGcJB8Iyw=
X-Google-Smtp-Source: AGHT+IFAr+8UZL5HRuL9rkDVnK7n4fTwY7nIMZfqU/kfjldcZ7+fHI5Jwzd1hLqSNjwRpN6xh0YAP7kz2ZQjZ4kX+4A=
X-Received: by 2002:a05:690c:dc6:b0:6b0:52a6:6515 with SMTP id
 00721157ae682-6db44d6c4a8mr192458857b3.6.1725994106631; Tue, 10 Sep 2024
 11:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
 <SJ1PR11MB60831AF34B75030EBA3D5721FC992@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB60831AF34B75030EBA3D5721FC992@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Hugues Bruant <hugues.bruant@gmail.com>
Date: Tue, 10 Sep 2024 11:48:15 -0700
Message-ID: <CALvjV28edz1zzFeduytOMoVDyeXOKoxPiwcFp6Mbxz1ODSq17g@mail.gmail.com>
Subject: Re: [REGRESSION] soft lockup on boot starting with kernel 6.10 /
 commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yu,
 Fenghua" <fenghua.yu@intel.com>, 
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 11 Sep 2024 06:55:37 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 9, 2024 at 9:10=E2=80=AFAM Luck, Tony <tony.luck@intel.com> wro=
te:
>
> > I have discovered a 100% reliable soft lockup on boot on my laptop:
> > Purism Librem 14, Intel Core i7-10710U, 48Gb RAM, Samsung Evo Plus 970
> > SSD, CoreBoot BIOS, grub bootloader, Arch Linux.
> >
> > The last working release is kernel 6.9.10, every release from 6.10
> > onwards reliably exhibit the issue, which, based on journalctl logs,
> > seems to be triggered somewhere in systemd-udev:
> > https://gitlab.archlinux.org/-/project/42594/uploads/04583baf22189a0a8b=
b2f8773096e013/lockup.log
> >
> > Bisect points to commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
>
> Does that Intel Core i7-10710U even execute the RDT code? Most client par=
ts
> don't support RDT. You can check if yours does by looking for "rdt_a" in
> /proc/cpuinfo.
Thanks for the suggestion. You're right, I do not see `rdt_a` in `/proc/cpu=
info`
