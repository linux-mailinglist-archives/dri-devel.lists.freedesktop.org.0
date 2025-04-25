Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FBCA9C4D0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492C110E900;
	Fri, 25 Apr 2025 10:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gm18137b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9E610E900
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:11:22 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6ff0c9d1761so21680687b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745575881; x=1746180681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6prVsylQnKDMIBjZXP4uOELttil8ar/HvFRq0ET36k=;
 b=Gm18137bi96pbaO6pi9F9UoE8JH66o9THD/ojzuVWqM7qTAYdWhBxNIfq0z7gwuEnA
 Xy6ATwDEIOtLyjwBkRq3bcztM1n+a3pv9abnksIADSoPkTXfvMT6ooGZ45QPHaO9ihSU
 cGpr/YzwMG5fkq9lCVrzeOe8+Ru+iiultSGl0pgq+c5EtLc3V3utIFpyekoMcovdQFTq
 RY5kNrrD71eKaZZ3cJopXTN5tZFPCx+ICk3fm52Jm68jt79kOZafiQyqE6ntl7Oh2FUs
 tcuRi12x9g88wbtwaRuO35Tls2r9C96iebQf2ewZvC8Oclf/FGBIIDwice4tGHzjzPfU
 Ip5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745575881; x=1746180681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6prVsylQnKDMIBjZXP4uOELttil8ar/HvFRq0ET36k=;
 b=URSzor/yH1sB9z4ca22SW/tRmO6BFnf7Amx+cpkGwJ/5y4ybg2T+kW2/adR74Oq0Hq
 2HhalZfKKLP9GReDPX2MZM4wdX6TowLDDsdn6rNMlR6zDc7Y6G10Uf1MmDL+TRhjJlM9
 So3pKTmjLcOX+Dmwx6iVRYmMY/ZebbUzWtyqAEEo6Ee1CtM38D2NtToZLc+RgVjPQokO
 l+xLnFd/EdNRPU7kwtGzvES7GuYe7X6PB9zfqxA4YnivNhZiQFcS25Ezsn39+7s4SMtS
 9GzFYFNFlI55xjybB22mN91obqFUTobEN6TFB3UeZNfZj3jFWQDwrVTGGx/A+eunaph0
 426w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkscAOJq5XuVC7KiQ7gyjvgNp5QL/Kjb7lZDUU2guRQAPOB8URwllmc6eGZhzxq1GP9X6/TihLNpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqb1PoKhcK3K+C0EqWEDHgHK9PvOvC2rNjEB1srf6mQRKoIFYY
 lQ0WgwJ/LRKlshJi8kanOWEOlAVVT8GGUFMzA+DlU96acY6hdSI3SX4jkO++zVHnZjWAhp6h2YF
 +sO61YPl7tsY+RHY49OMn7TWkhdKr10HvVHGVjQ==
X-Gm-Gg: ASbGncsgLyDc1fECz5hD4509mC2YRp5y51ak/3hCsCUt1V9ScbfLFldpoToucv2KUti
 8E1A3H/dkImLSh45YcYZ43uKUlTA/8CcfwcSUZH/upUn5uUmIrRX8oiVU/A7nIDAWokvGeCfrTB
 FdSstlNvzkeQcEtxyetL/qEo4=
X-Google-Smtp-Source: AGHT+IGurFHGYwar2TKD3VtJNgOfTgLYu73UwsY3fMeiKx/80V1BEROWuydsOdDJ1TKv9Y5NtKhSq17Sa7k73YOZM/k=
X-Received: by 2002:a05:690c:4b0a:b0:708:3a47:3d2c with SMTP id
 00721157ae682-70854107cf6mr20217487b3.13.1745575881129; Fri, 25 Apr 2025
 03:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
 <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
 <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
 <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
 <cbf20469-02ab-403a-8db7-2b66e9936b4f@samsung.com>
 <CAPDyKFqND2JrH8nLUzAqwWgHkwia6M9XOJoY6AqxtR0t120JUA@mail.gmail.com>
 <20250425-lumpy-marmot-of-popularity-cdbbcd@houat>
In-Reply-To: <20250425-lumpy-marmot-of-popularity-cdbbcd@houat>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 12:10:45 +0200
X-Gm-Features: ATxdqUE_JbjUe45S3EVZ15Z84FoHvfu8q4ysbH-yq1WIOchBVAmKx33KA3qSxvM
Message-ID: <CAPDyKFp-Bguqukn0my9mVDdSyG2eQ3EPP+diD-BBg-P_E8S9=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
To: Maxime Ripard <mripard@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 m.szyprowski@samsung.com, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, 25 Apr 2025 at 09:09, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Thu, Apr 24, 2025 at 06:51:00PM +0200, Ulf Hansson wrote:
> > On Thu, 17 Apr 2025 at 18:19, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> > > On 4/16/25 16:48, Rafael J. Wysocki wrote:
> > > > On Wed, Apr 16, 2025 at 3:32=E2=80=AFPM Michal Wilczynski
> > > > <m.wilczynski@samsung.com> wrote:
> > > >>
> > > >> On 4/15/25 18:42, Rafael J. Wysocki wrote:
> > > >>> On Mon, Apr 14, 2025 at 8:53=E2=80=AFPM Michal Wilczynski
> > > >>> <m.wilczynski@samsung.com> wrote:
> > > >>>>
> > > >>>> Introduce a new dev_pm_info flag - platform_resources_managed, t=
o
> > > >>>> indicate whether platform PM resources such as clocks or resets =
are
> > > >>>> managed externally (e.g. by a generic power domain driver) inste=
ad of
> > > >>>> directly by the consumer device driver.
> > > >>>
> > > >>> I think that this is genpd-specific and so I don't think it belon=
gs in
> > > >>> struct dev_pm_info.
> > > >>>
> > > >>> There is dev->power.subsys_data->domain_data, why not use it for =
this?
> > > >>
> > > >> Hi Rafael,
> > > >>
> > > >> Thanks for the feedback.
> > > >>
> > > >> You're right =E2=80=94 this behavior is specific to genpd, so embe=
dding the flag
> > > >> directly in struct dev_pm_info may not be the best choice. Using
> > > >> dev->power.subsys_data->domain_data makes more sense and avoids bl=
oating
> > > >> the core PM structure.
> > > >>
> > > >>>
> > > >>> Also, it should be documented way more comprehensively IMV.
> > > >>>
> > > >>> Who is supposed to set it and when?  What does it mean when it is=
 set?
> > > >>
> > > >> To clarify the intended usage, I would propose adding the followin=
g
> > > >> explanation to the commit message:
> > > >>
> > > >> "This flag is intended to be set by a generic PM domain driver (e.=
g.,
> > > >> from within its attach_dev callback) to indicate that it will mana=
ge
> > > >> platform specific runtime power management resources =E2=80=94 suc=
h as clocks
> > > >> and resets =E2=80=94 on behalf of the consumer device. This implie=
s a delegation
> > > >> of runtime PM control to the PM domain, typically implemented thro=
ugh
> > > >> its start and stop callbacks.
> > > >>
> > > >> When this flag is set, the consumer driver (e.g., drm/imagination)=
 can
> > > >> check it and skip managing such resources in its runtime PM callba=
cks
> > > >> (runtime_suspend, runtime_resume), avoiding conflicts or redundant
> > > >> operations."
> > > >
> > > > This sounds good and I would also put it into a code comment somewh=
ere.
> > > >
> > > > I guess you'll need helpers for setting and testing this flag, so
> > > > their kerneldoc comments can be used for that.
> > > >
> > > >> This could also be included as a code comment near the flag defini=
tion
> > > >> if you think that=E2=80=99s appropriate.
> > > >>
> > > >> Also, as discussed earlier with Maxime and Matt [1], this is not a=
bout
> > > >> full "resource ownership," but more about delegating runtime contr=
ol of
> > > >> PM resources like clocks/resets to the genpd. That nuance may be w=
orth
> > > >> reflecting in the flag name as well, I would rename it to let's sa=
y
> > > >> 'runtime_pm_platform_res_delegated', or more concise
> > > >> 'runtime_pm_delegated'.
> > > >
> > > > Or just "rpm_delegated" I suppose.
> > > >
> > > > But if the genpd driver is going to set that flag, it will rather m=
ean
> > > > that this driver will now control the resources in question, so the
> > > > driver should not attempt to manipulate them directly.  Is my
> > > > understanding correct?
> > >
> > > Yes, your understanding is correct =E2=80=94 with one minor clarifica=
tion.
> > >
> > > When the genpd driver sets the flag, it indicates that it will take o=
ver
> > > control of the relevant PM resources in the context of runtime PM, i.=
e.,
> > > via its start() and stop() callbacks. As a result, the device driver
> > > should not manipulate those resources from within its RUNTIME_PM_OPS
> > > (e.g., runtime_suspend, runtime_resume) to avoid conflicts.
> > >
> > > However, outside of the runtime PM callbacks, the consumer device dri=
ver
> > > may still access or use those resources if needed e.g for devfreq.
> > >
> > > >
> > > > Assuming that it is correct, how is the device driver going to know
> > > > which resources in particular are now controlled by the genpd drive=
r?
> > >
> > > Good question =E2=80=94 to allow finer-grained control, we could repl=
ace the
> > > current single boolean flag with a u32 bitmask field. Each bit would
> > > correspond to a specific category of platform managed resources. For
> > > example:
> > >
> > > #define RPM_TAKEOVER_CLK        BIT(0)
> > > #define RPM_TAKEOVER_RESET      BIT(1)
> > >
> > > This would allow a PM domain driver to selectively declare which
> > > resources it is taking over and let the consumer driver query only th=
e
> > > relevant parts.
> >
> > Assuming we are targeting device specific resources for runtime PM;
> > why would we want the driver to be responsible for some resources and
> > the genpd provider for some others? I would assume we want to handle
> > all these RPM-resources from the genpd provider, if/when possible,
> > right?
> >
> > The tricky part though (maybe Stephen had some ideas in his talk [a]
> > at OSS), is to teach the genpd provider about what resources it should
> > handle. In principle the genpd provider will need some kind of device
> > specific knowledge, perhaps based on the device's compatible-string
> > and description in DT.
> >
> > My point is, using a bitmask doesn't scale as it would end up having
> > one bit for each clock (a device may have multiple clocks), regulator,
> > pinctrl, phy, etc. In principle, reflecting the description in DT.
>
> My understanding is that it's to address a situation where a "generic"
> driver interacts with some platform specific code. I think it's tied to
> the discussion with the imagination GPU driver handling his clocks, and
> the platform genpd clocks overlapping a bit.
>
> But then, my question is: does it matter? clocks are refcounted, and
> resets are as well iirc, so why do we need a transition at all? Can't we
> just let the platform genpd code take a reference on the clock, the GPU
> driver take one as well, and it's all good, right?

The problem is the power-sequencing that is needed to initialize the
GPU. Have a look at patch3's commit message - and I think it will be
clearer what is needed.

In my last reply for patch 3/4, I am suggesting this whole thing may
be better modeled as a real power-sequence, using the new subsystem in
drivers/power/sequencing/*

Kind regards
Uffe
