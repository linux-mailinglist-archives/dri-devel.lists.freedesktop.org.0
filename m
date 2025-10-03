Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE4BB7E7C
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 20:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0259F10E078;
	Fri,  3 Oct 2025 18:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eznsK8oC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED95F10E078
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 18:44:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-57933d3e498so3480520e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759517052; x=1760121852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
 b=eznsK8oC7cLnlP4BSKK30Jhs+bnlT98TOPJGLDBTk52jye5/LjtD8/sU1MMrTdqr93
 6SDlkuYKhXSjsCy/Y0vqd9G9c8Dl0Yg1q0clxTTVhCOjmDOdSjj2ApnFtzoj/YoHYTTL
 kLTpb8KRONSIFIklVphV7b9k32cWBEImLI5nOr7Zmey7TsK4YwoR0E2NCpMhQ4Q9l6o7
 tPgCPPJqeq8RhkIm2WYdyCezjwMC4RWHbgP2mj8DhX3MpdwxxUvLVvQHWNF8H4GhsSE+
 RiiqSGbFMA8BVUY3deMgSRA4vIPxgNqtNdL6tTcJny9bMqtyQpl6UmIj/WS+f7nIfYVu
 Td1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759517052; x=1760121852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
 b=oCaPzC4x/7S/kIqEP0v+Ru0fI9Y8cV2fDLjgXvxMVKO8uuGS9OCqUPPN2Mt8IEDTHS
 Z+uo19zMMdMVVP+0iYjjieUiK3OoWnJ9BhRoc4lmaenFtTLSxKdp/LkorQv76CZxjsQh
 4mkNdFqIFYxgp96aysUvo5vxn8oyZzZS7pCuwPZm0MuCbf3QhfTDLqwk/eTKL+RUFWFH
 ChC8+b3TiFs2OyOVVCiFw4r1VDd1J2DEk/+pO+Dewy09VMZYBgNOeS/2+Mp46jOedKMc
 fKLTQK2zeUDcq5gY9sAVQ/hNs7aFmIgAfIneFOAzeCpartR0m1k3Y+n54MIXWwZ5DXad
 UEJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgXk8ph3nMUS8ukznF/Xy/NxPvL/yCpPhqTxXJlGBEmwGgohHSE3Nw37A3CxO7/Vc1KVY7uOIxnik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4CXFyz08gElLaRLUVgSz01szLCocYHzKXcqdUQlsMxjpXWV+l
 MF1qpRHyL6IskTUumyyRwhLqMyCE+zJ/TZ5eGTLDvOUN8PEtA+Qkvnm7vcQHJ0B3FbJ0zf0W1Rf
 bMqF31pFaV/0sFpmRlC1kDg6OVOJ21DQ=
X-Gm-Gg: ASbGncuibD9x3KluUF9xaOju7IfEO5ZIQVgs4pO2Cu+Lhp63IVkUmN47mUG+WWGg1U5
 PvTJ2fpV1f3lVz/P4+7x9HTRkl3SjC2c6Y7yedA/RdkrydJ2v56uUjQD8Zo+xp8ltxCMQ19xPo+
 hIV0xwUa5Lb9wDU/tj/zK6viYDWIjwsFR+WI4MLC+C0duTVs/frnb2+8NO/j6VkHaDPKK0jZM0G
 XbD+3kr0AW26G3L2BdzqpBwA7QtuPVFGHT/DSfu9j+o1FkFY7G2te72lanR3LZHuC0lCe2l+Sss
X-Google-Smtp-Source: AGHT+IFGjI23yu+zZGYIIYp5GAvADK1Td8K5f92lbt6d4punv+uO2Xi2qzgSwr+Eyr8h+dgbxKZKruLqIS6Oqk0H0Go=
X-Received: by 2002:a05:6512:1245:b0:560:9993:f154 with SMTP id
 2adb3069b0e04-58cbbdd8224mr1238522e87.35.1759517051928; Fri, 03 Oct 2025
 11:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
 <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
 <edccab86-321b-4e6e-998f-3ce320ee0193@gmx.de>
 <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
In-Reply-To: <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Fri, 3 Oct 2025 20:43:59 +0200
X-Gm-Features: AS18NWCgP_BX7ybrXY0sJ6ucNdQs1TMwDO0SWiLqnHgEzd_63diU8v-qea2nPRE
Message-ID: <CAHCkknrAKGxzAYE-R3QX20W4faR9Wfjgn37peyHRJcZ6PRLENA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: David Hunter <david.hunter.linux@gmail.com>,
 kernel test robot <lkp@intel.com>, 
 Bernie Thompson <bernie@plugable.com>, Arnd Bergmann <arnd@arndb.de>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>, 
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
 skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi

On Thu, Oct 2, 2025 at 8:52=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 02.10.25 um 08:41 schrieb Helge Deller:
> >>>> kernel test robot noticed the following build errors:
> >>>
> >>> Did you compile and test this code before submitting this patch?
> >>
> >> Yes, I had compiled & loaded the udlfb module with no errors. Please
> >> let me know how to proceed in this case.
> >
> > Look at the reported build error, which seems to happen in dev_dbg().
> > So, maybe in your testing you did not have debugging enabled?
> > The report contains the .config file with which you can test.
>
> Can we rather make an effort to remove the udlfb driver entirely? A few
> years back, there was one user who was still using it because of some
> problems with the DRM udl driver. But I think we've addressed them. The
> discussion is at [1].
Should I send a patch series to completely remove udlfb, since [1] echoed t=
hat
DRM udl driver is good enough?
>
> [1]
> https://lore.kernel.org/dri-devel/20201130125200.10416-1-tzimmermann@suse=
.de/
>
> Best regards
> Thomas
>
> >
> > Helge
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>
