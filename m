Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F11A3C65A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D68710E354;
	Wed, 19 Feb 2025 17:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jPS0Plwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C88B10E878
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 17:39:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so77117f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739986782; x=1740591582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8wYliwl6UOtHCOysjfqNPSlzww+g9jxkMxRAdHQVyY=;
 b=jPS0PlwbHuPKjdOfCe/mtsWTnH/3vQ7s2wCTzzFIFf9KZPZqjMvwRGSut5yx8rsMEi
 71rNW2TmHk3sxzrD0mMdfuXwnfUVtBgRz11SVBOCGOvFgUjlk0ddkYTlukG7AgQ2rgaO
 0Cr3Qs28ZhKMzTNWJ/UH28+jMuZqDQ1QSvFUDbQwsRTMUJU1OtlJEv69tAFrmO86kPF/
 t9XDH3S6pGcSJ6TkdyKjwY6tITSdiT/CWUYVWUjCQbjaCsRrAD3J4Ub9jiN+FV8+y6YC
 BXkr54f+qYtLXxwax7pt3rwF7UIC9tQAXRF3aGUD9WG/nlr2yi4JbqqwrPG+ssHXudOO
 RiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739986782; x=1740591582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8wYliwl6UOtHCOysjfqNPSlzww+g9jxkMxRAdHQVyY=;
 b=UHKjXq1Kc/r9+O/Skp4dB3cBdBYFY9usEeJmOQkgK61JhstoIkCpRF1QDUMF9AKscP
 1CvE79siqdyeCCScdB8M5tQQogQRPhKFhTJNH+JlqtR8SnLp4E6w+QDf0GGfgK2y0NMQ
 +HaqNZmZ3vbhFsZB+mvfQwNOX9s1VQQtjJ9d9uPb8lNerACHHEfbWsKcXf2Fb38dmBf/
 Xtf02w/iHgFJYJyotbaxFKGHjc6Jj2Pq3i5swozf/LIposxAHPGZ5CH0fIpsclPQBuBy
 gbjOnV2fJK7b27Wu7jAT0YE5w783YXihp3cY3Hkj3YLMcZAVxjgKOnHXJsvDdWmtEPi+
 83cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd34BPUOQviT13gkPg3rFZS01TczOp1J9M5PKjVX9aJQq5qHhvpP7uoNaDQNV7TgnQeczcS0GDgH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR4skilugXR/KuxZDv4ZhaZhbl7JhEuzOoVxWCfh0RzmJZEzTj
 fvyyIqPsf8q5Lyj5azPlmcE/Uumv2274OofovYpYJ6FQeNN2lphSXNymRMbZCe+mAWoyQfeE+fk
 mQX8KYpc0pv372URjwaJzxj6v6Ws=
X-Gm-Gg: ASbGncur499cyREQupn3wFuZ2CAVkmGMDb2Row7Psy0L4FF/nk8QityIqvGlhti8/QN
 mPBY49tq5xhT/D5aTLwBaAp9Ai+oJ5yEqY0PJ5PCjH13C9TwuSUUJLAa4M+OJsolUgeTwjJHnRg
 ==
X-Google-Smtp-Source: AGHT+IEyS3n7gqj0ex4KbPOptDtwVLwjsOmfhhv3WWfLv9zPiV55DmsbGLPpAuqV+3ItRvWlkBKbfteXPmxuNkeSagE=
X-Received: by 2002:a05:6000:2c1:b0:38f:474f:f3f3 with SMTP id
 ffacd0b85a97d-38f474ff5bdmr13969667f8f.13.1739986781750; Wed, 19 Feb 2025
 09:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-3-clamor95@gmail.com>
 <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
 <CAPVz0n1_WQyOHhtEVAh53uhEUhZvqqZSEJh6XALtSrVfkMSLYw@mail.gmail.com>
 <Z7XzgfHcjyK_UZKv@smile.fi.intel.com>
 <CAPVz0n2WwAOb1UU7J7aDTdhXXCaAZkCpYjW_nc_CBRgkGWdEOw@mail.gmail.com>
 <Z7X3ZvQbSe75U-AR@smile.fi.intel.com>
In-Reply-To: <Z7X3ZvQbSe75U-AR@smile.fi.intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Feb 2025 19:39:29 +0200
X-Gm-Features: AWEUYZlErtPnGBIjsmHfQD2f3-JQKBhMt1WzPgDf8uSaX-tKvCIgiy9477XzETE
Message-ID: <CAPVz0n19D1mS_prvMo-HD3m7U9+iknm49JSj5ydNUHoqjK7gZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
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

=D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:56 Andy=
 Shevchenko
<andriy.shevchenko@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 19, 2025 at 05:13:15PM +0200, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:07 =
Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Wed, Feb 19, 2025 at 04:36:38PM +0200, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16=
:27 Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> ...
>
> > > > MFD part is removed since MFD cells binding is unconditional, while
> > > > the device supports any amount of children grater then one. For
> > > > example, my  device uses only backlight at bank A, while all other
> > > > subdevices are not present and used. This patch switches to dynamic
> > > > bind of children.
> > >
> > > MFD does the same. Please, take your time and get familiar with how M=
FD works.
> >
> > It does not. I have tried. If mfd cell binding is missing, driver will
> > complain and fail.
>
> I really don't know what exactly is going on here, you can check it later=
, but
> I'm 100% sure that MFD works for only driver that are present. What you a=
re
> describing is how component framework is designed.
>
> To proove my words you can check drivers/mfd/intel_soc_pmic_*.c and find =
listed
> cells that never had a driver in the Linux kernel. They are just placehol=
ders.
>

This example is not valid since those drivers do not use device tree.

> ...
>
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
>
> Please, when answering, remove unrelated context from the replies.
>
> ...
>
> > Let this driver rot for now, I might return to it. At some point
>
> Up to you. But thanks for trying!
>

Thank you for suggestions. Once I complete more urgent tasks, I might
do some tinkering with this driver.

> --
> With Best Regards,
> Andy Shevchenko
>
>
