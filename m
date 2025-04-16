Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28203A906E6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 16:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238EB10E0E1;
	Wed, 16 Apr 2025 14:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QE5u6qJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32EA10E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:48:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C496A5C0173
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFD9C4CEE2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744814910;
 bh=JDV0aZmLpKhamx6ABdVktv5X6IcQxFLMwisZNz0CLvg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QE5u6qJeR7TRKSMANkwDFBCaNM1dWHnbunlYUjvdtcIkcL3BkF6n1eHKUHHqcpID4
 k/o2DpLENg2vaTpfXeAakthdEH13BfnN7+i8yyxu/m2tl1+wjtFHCoK5kTx8FHYoAm
 EmBjlFVD+zGoz2a+B34iF9JKTT+8g0Pqzgh9e1S1IE9mxUrxjHbR/SBrBuClLF5MVX
 x8wKpKQBRlsMNe1kY/jubKckiwJsPCU4LtNahJ/6Jppm608fybGkOAu2ztg1MyAxBK
 JGAYTLzTeqSKPSTCT7STz8pi4hBLuynvGl73zqvq1UHZpJypgt7qIeBNj1dWbnvjs/
 Us8HhSDBqoBsA==
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2d0920c6f96so4193643fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 07:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUscjiY9kO0X4W9bHplVD842lp9nryNTVL3jHQNB1yqcWhwtIuIcrQt/hdpK9FvBGUmPZ+Mgh7iL2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbOakzegMgkdVR8g2DZ0wi3CVTSjfzLJGDBMXPoeCI8amCwA8W
 e/Nonq80fgtV3uYkzv1SYyMNFrAEiDanVLp7JQM0y4gOT9ZJBARsFom0QW8rizxNSzULGOgdGWt
 iNKscwrPSn9X89LNNJaBQubsg3s8=
X-Google-Smtp-Source: AGHT+IFdOsYf3iLaqn2AOVXB9JgmqvlR+FlopMhZdQ/oyI1KkOKZUA99g88s0TEkNSW1AHhhviEm86XcXoV4znOgyQg=
X-Received: by 2002:a05:6871:7245:b0:29e:3921:b1ea with SMTP id
 586e51a60fabf-2d4d2d1c621mr1206668fac.30.1744814909669; Wed, 16 Apr 2025
 07:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
 <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
 <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
In-Reply-To: <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Apr 2025 16:48:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
X-Gm-Features: ATxdqUHImP3IxzcDVOQelXbHBno9Ueli1k7m_bFezgDgj8FwN4tMxWCc_OjKQlw
Message-ID: <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Wed, Apr 16, 2025 at 3:32=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> On 4/15/25 18:42, Rafael J. Wysocki wrote:
> > On Mon, Apr 14, 2025 at 8:53=E2=80=AFPM Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> Introduce a new dev_pm_info flag - platform_resources_managed, to
> >> indicate whether platform PM resources such as clocks or resets are
> >> managed externally (e.g. by a generic power domain driver) instead of
> >> directly by the consumer device driver.
> >
> > I think that this is genpd-specific and so I don't think it belongs in
> > struct dev_pm_info.
> >
> > There is dev->power.subsys_data->domain_data, why not use it for this?
>
> Hi Rafael,
>
> Thanks for the feedback.
>
> You're right =E2=80=94 this behavior is specific to genpd, so embedding t=
he flag
> directly in struct dev_pm_info may not be the best choice. Using
> dev->power.subsys_data->domain_data makes more sense and avoids bloating
> the core PM structure.
>
> >
> > Also, it should be documented way more comprehensively IMV.
> >
> > Who is supposed to set it and when?  What does it mean when it is set?
>
> To clarify the intended usage, I would propose adding the following
> explanation to the commit message:
>
> "This flag is intended to be set by a generic PM domain driver (e.g.,
> from within its attach_dev callback) to indicate that it will manage
> platform specific runtime power management resources =E2=80=94 such as cl=
ocks
> and resets =E2=80=94 on behalf of the consumer device. This implies a del=
egation
> of runtime PM control to the PM domain, typically implemented through
> its start and stop callbacks.
>
> When this flag is set, the consumer driver (e.g., drm/imagination) can
> check it and skip managing such resources in its runtime PM callbacks
> (runtime_suspend, runtime_resume), avoiding conflicts or redundant
> operations."

This sounds good and I would also put it into a code comment somewhere.

I guess you'll need helpers for setting and testing this flag, so
their kerneldoc comments can be used for that.

> This could also be included as a code comment near the flag definition
> if you think that=E2=80=99s appropriate.
>
> Also, as discussed earlier with Maxime and Matt [1], this is not about
> full "resource ownership," but more about delegating runtime control of
> PM resources like clocks/resets to the genpd. That nuance may be worth
> reflecting in the flag name as well, I would rename it to let's say
> 'runtime_pm_platform_res_delegated', or more concise
> 'runtime_pm_delegated'.

Or just "rpm_delegated" I suppose.

But if the genpd driver is going to set that flag, it will rather mean
that this driver will now control the resources in question, so the
driver should not attempt to manipulate them directly.  Is my
understanding correct?

Assuming that it is correct, how is the device driver going to know
which resources in particular are now controlled by the genpd driver?

Also "rpm_takeover" may be a better name for the flag in that case.

> [1] - https://lore.kernel.org/all/a3142259-1c72-45b9-b148-5e5e6bef87f9@sa=
msung.com/
>
> >
> >> This flag enables device drivers to cooperate with SoC-specific PM
> >> domains by conditionally skipping management of clocks and resets when
> >> the platform owns them.
> >>
> >> This idea was discussed on the mailing list [1].
> >>
> >> [1] - https://lore.kernel.org/all/CAPDyKFq=3DBF5f2i_Sr1cmVqtVAMgr=3D0F=
qsksL7RHZLKn++y0uwg@mail.gmail.com/
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  include/linux/device.h | 11 +++++++++++
> >>  include/linux/pm.h     |  1 +
> >>  2 files changed, 12 insertions(+)
> >>
> >> diff --git a/include/linux/device.h b/include/linux/device.h
> >> index 79e49fe494b7c4c70d902886db63c4cfe5b4de4f..3e7a36dd874cfb6b98e245=
1c7a876989aa9f1913 100644
> >> --- a/include/linux/device.h
> >> +++ b/include/linux/device.h
> >> @@ -881,6 +881,17 @@ static inline bool device_async_suspend_enabled(s=
truct device *dev)
> >>         return !!dev->power.async_suspend;
> >>  }
> >>
> >> +static inline bool device_platform_resources_pm_managed(struct device=
 *dev)
> >
> > Could this function name be shorter?
>
> Maybe:
>
> static inline bool dev_is_runtime_pm_delegated(struct device *dev);
> static inline void dev_set_runtime_pm_delegated(struct device *dev, bool =
val);

What about

dev_pm_genpd_rpm_delegated()
dev_pm_genpd_set_rpm_delegated()

respectively (or analogously with the "takeover" variant)?
