Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DAB754931
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 16:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE4010E093;
	Sat, 15 Jul 2023 14:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C8310E093;
 Sat, 15 Jul 2023 14:12:53 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a41da34780so1806944b6e.0; 
 Sat, 15 Jul 2023 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689430373; x=1692022373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTHIurDy6gvGsTnE5nzog+Umudwtg/UCtyZzHm5BLaQ=;
 b=iWhE8lFEziu8ThlgqXgS0ZMU2b440yAokQPM4ejUOUMnLGe7UW+OEGxLdqQgqxK9Xf
 Ik+ubVkxHZ+2BH0/c4/QqSyhSffKB3TnWgpNzkhI8EKnRoSOvruuC8Ov8NJWo5zS0CHT
 hdXqybJryJGv3kEKRVwc5Cuu01L347xzjBV+bNb6SbsfVc1VvV/piU4thZ0w7f+zEFAy
 raYYnVT82HM9PfrguuFo3SGVJVBwGhYLbA2JEzOeNYIh4geZUdwj/PTAN8q6dET0G4Y9
 h9g1GiJ8KAB4dkpjD62CCBlZc1PgNUKSSsuT63Vna6FWFZY7YNSZpVT2CJlVMc6CR2AR
 BC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689430373; x=1692022373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTHIurDy6gvGsTnE5nzog+Umudwtg/UCtyZzHm5BLaQ=;
 b=RQomScjIsp10CUJ2h7XoHWilI4norxiAvLMIQOyX5Fbq0hSYVwKdDOEDM5ixu8w0+F
 33VqK6fGyzaK7UkMlojLYiovWyoAaX4SHKMhUMLY8EhWx+VUHH3K0GeYnZrLNNZTi5iI
 QJYk9FTqsBxl0B0wo+VGmYo0/R7RYTZh+7fftE2sMFKhnuqsBSwJucc66FNzO8ug9o9L
 jddT+W0RYieTQ7cg1gZIOWsiVHWRlWaacwqFaCvtA9SCxGP6MPxy4pGpkQBhCzZ0A8JH
 qyT95DHjrN5YHP0xQIfevChmr2Y1J4O1mS4GYR9zucaDUPO1tcKs/A65js/pVDMiq9lo
 KsgQ==
X-Gm-Message-State: ABy/qLbawGNBNFleLhOT/0tccznlBwsZiTzDyd82bKDUs+JWWMAiRdIL
 Wzt0IiF1h/KNU4EcdaQF9wy2QDrL5UCuJz5KZQ8=
X-Google-Smtp-Source: APBJJlGukieqSedPfaXxROehySYI55LMV7KSoAeHgvT/HCubI9rbmsYY5ld/YdlgSkr96f9cIVvx5ywB1o3ngfw/auc=
X-Received: by 2002:a05:6808:3b0:b0:3a3:e769:44a3 with SMTP id
 n16-20020a05680803b000b003a3e76944a3mr3343104oie.12.1689430372643; Sat, 15
 Jul 2023 07:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
 <4cdceddb-033a-6301-163e-89d27152e242@linaro.org>
 <CAF6AEGvtMRnWBQz_KOi5b1p40HjvAAHYdd64kiR3KsKWPBO+bg@mail.gmail.com>
 <0e805cae-d311-2b8c-cead-62621288a34f@linaro.org>
In-Reply-To: <0e805cae-d311-2b8c-cead-62621288a34f@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 15 Jul 2023 07:12:41 -0700
Message-ID: <CAF6AEGuBsfuCOzteqqvutRs7oBMhqF9q_HEKj1aLEC7aWZw0sg@mail.gmail.com>
Subject: Re: [PATCH 12/12] drm/msm/adreno: Switch to chip-id for identifying
 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 15, 2023 at 6:38=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 7.07.2023 18:08, Rob Clark wrote:
> > On Thu, Jul 6, 2023 at 5:25=E2=80=AFPM Konrad Dybcio <konrad.dybcio@lin=
aro.org> wrote:
> >>
> >> On 6.07.2023 23:10, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Since the revision becomes an opaque identifier with future GPUs, mov=
e
> >>> away from treating different ranges of bits as having a given meaning=
.
> >>> This means that we need to explicitly list different patch revisions =
in
> >>> the device table.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> [...]
>
> >>>  static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
> >>>  {
> >>> -     /* The order of args is important here to handle ANY_ID correct=
ly */
> >>> -     return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
> >>> +     return gpu->info->chip_ids[0] =3D=3D 0x06030500;
> >>>  }
> >> I'm sorry, but this screams trouble.. and doesn't sound very maintaina=
ble :/
> >>
> >
> > why? It is intentionally checking the first chip-id so that nothing
> > breaks if later chip-ids are added
> checking for magic numbers and magic array indices at the same time is
> very prone to breaking, as breaking this check would not at all be easy
> to spot in code review.

It isn't like we can arbitrarily change the chip-id's.. they are abi
between dt/kernel/userspace.  If they aren't changing, there isn't
anything to break.

> >
> >> Apart from all these comments, I don't really see the point of this pa=
tch,
> >> other than trying to tie together Qualcomm's almost-meaningless chipid=
s on
> >> a7xx into the picture..
> >>
> >> Since they can't even be read back from the hardware, I don't think tr=
ying
> >> to force them into the upstream kernel makes any sense.
> >
> > Sure, we _could_ pick our own arbitrary identifiers, we don't have to
> > align with kgsl.  But that would be a super huge PITA for mesa, which
> > has support for both kernels.
> Perhaps I'm biased towards keeping this kind of stuff out of the kernel,
> but I'd say that Linux should decide on one logical path.

The kernel is the small part of the driver stack, and we have two
drivers above in userspace (vk and gallium) which can work on top of
three different kernels (msm, kgsl, and virtgpu).  So what sounds like
an easy/clean answer to you, is not necessarily easy/clean in the big
picture.

So wherever it comes from (and dt is fine, or socid or whatever, and
it's fine for it to just be an opaque 32b value as long as we don't
get conflicting values, I don't mind explicitly listing all of the
possible patch-id's for the legacy scheme) we need to stick with
CHIP_ID.

> In between us starting this discussion, Qualcomm managed to introduce
> yet another way of deciding what GPU is present on the system in their
> downstream driver[1]. We're at like 5 now. Do we wanna keep up each time?
> New ID rework for A8xx when that comes out one day?

What matters is how they expose it to userspace, not where they get
the value from.

BR,
-R

> >
> >> On a different note, I think we could try to blockify Adreno definitio=
ns a
> >> bit by splitting things into:
> >>
> >> - Core GPU propeties (revision, fw name, GMEM size)
> >>
> >> - G(P)MU properties
> >>
> >> - Family data (quirks, reg presets in some config struct which could b=
e a
> >>   union of config structs per generation, hwcg, maybe protected regs p=
tr
> >>   should also be moved there)
> >
> > We do something like this on the mesa side.  But we also get to use
> > python tricks to generate code as part of the build process which
> > makes things a bit more elegant.
> >
> > Fwiw, I was already thinking about splitting the gpu "hw catalog" from
> > a flat table, to probably something more like a table of tables, so
> > that we can split a2xx/a3xx/a4xx/a5xx/a6xx tables into separate files.
> > And then we could move hwcg/protect/etc tables into the same file.
> > But I thought that might be a bit too conflicty for the a7xx series so
> > was thinking to wait until after that landed.. unless you don't think
> > it will be a problem.
> Yeah I'd like to get a7xx landed this season..
>
> Konrad
>
> [1] they now read parts of socinfo from smem and decide the CHIPID and
>     speedbin based on that, but it's not available on most existing SoCs,
>     that was thrown in with SOCID v17
> >
> > BR,
> > -R
> >
> >> - Generation data (init function, a2xx and a6xx specifics)
> >>
> >> - Speedbin LUTs matched against socid
> >>
> >>
> >> or something like that.. there's a whole lot of duplicated data atm
> >>
> >> Konrad
> >>>
> >>>  static inline int adreno_is_a660(const struct adreno_gpu *gpu)
> >>> @@ -358,8 +364,7 @@ static inline int adreno_is_a680(const struct adr=
eno_gpu *gpu)
> >>>
> >>>  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
> >>>  {
> >>> -     /* The order of args is important here to handle ANY_ID correct=
ly */
> >>> -     return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
> >>> +     return gpu->info->chip_ids[0] =3D=3D 0x06090000;
> >>>  };
> >>>  /* check for a615, a616, a618, a619 or any a630 derivatives */
> >>>  static inline int adreno_is_a630_family(const struct adreno_gpu *gpu=
)
