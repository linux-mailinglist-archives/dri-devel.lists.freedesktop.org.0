Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385499E473A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C55210E366;
	Wed,  4 Dec 2024 21:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XeBpWy3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C8110E358;
 Wed,  4 Dec 2024 21:50:48 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3a777fd574bso718335ab.1; 
 Wed, 04 Dec 2024 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733349048; x=1733953848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0hg9lZJZN9avUvJdZ9Zeao5cWyz1cd0v08GATDUcUo=;
 b=XeBpWy3okbaEbeN7OdvDosxuqqiO5+QgIaA8TvnajYO242nNsMB+TRVc82snHXmq9K
 G509YSzaZwFpJHj0vz65PRGCp4hYsOUWIbVEicHiVL2a46rVoksVwuNOZHkngMUTEyXw
 smTKlujx2hASV+6cXmuIxqOB8/z9kqNdlSW/o5Wo/RYH34X7I9qDHbAjwp34KEaQwJsm
 J6GIN/0CfoF2mOQ8pLeKBWP+171T982YBVskm4d69B+2M1yve8XYQRXKqNsoVImBxYLQ
 vy8RIhDZn26Sos1rHmebylp9B05va0PKnMC1ltZ5Gw1DMV86WNfaKvhKxSJmpi1x6Qxt
 1C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733349048; x=1733953848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0hg9lZJZN9avUvJdZ9Zeao5cWyz1cd0v08GATDUcUo=;
 b=QgtfaiLZFYdooh4CrkpBa2jPRFr7EHHkUOnekkPIuuunKTK2VWNRvkoP+cPk3fLuD4
 3Yy4nqjLCnYZVba0B+ZMwA1goFP29Ci6v+Xfq5pSAbzjcyiSVeFU1REaErtZjAEivozL
 9k6jQjvLJyuK0BeSDyXBPCmypeXL6aSf7tBykrKsNbLYHuwIiszYSDaeBXlz80hnRgDm
 XYy1jRR/xMgub38SP2Qd0VY27+icgcm6JmKV+5xeowkNs0tZF+Z5UD2KW6/YMoVNtcj6
 H/9aStnRnMA/pV0K3cRMrcXHpA42Os2KMFYnzPAZG/MnIvPqIWIYIC6jzhWmuTRgBu1Z
 NuLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUomCjcJkBwHr8ifTkgR+938YwiVxu00oOyEX2+B9icsCxRgDX/C+UKEOad3O80XSQt79RTTTQv5oI=@lists.freedesktop.org,
 AJvYcCXb8vsiBQL1aUqrU0tIjaQXOOBOFwxBGmotE7NlliRY9Drn9Y+CGp2viFdkS8KW0w3G0kduKNGcMAqg@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx9pL3Vc9EjbTDPe4RMRw+VTK3C+y0ErzZZHRaSci4l9RiHLm9
 kdheK3Wmnk5EVelPX2ezenKbFzMONAfBTBquCgOunktUXRLLznDKT98ejPiicyZqS4XZCHAFX+R
 kZVujs6zY6iy0Me5+2ZCIMn7rT08=
X-Gm-Gg: ASbGncuBu287lPAItbS9mBY/ZCjOKGsz0sgb7UUE04bxRjtCwqhE+vLvPS1rAtRwHll
 F7GjfDm5HG1EG2Q0HbX1BLBhWPVb/Nr1PcTtldDaj2lzGah8w0u92NHMptwXJGA6FGQ==
X-Google-Smtp-Source: AGHT+IEN22zZO17beulhc91zwdhUV4FuS5A/AGEPOGDx/jgh8nXD72t6NrVHshchMWIfdwnMPRMw2pDkgVwvxaSGD24=
X-Received: by 2002:a05:6e02:1c43:b0:3a7:819c:5129 with SMTP id
 e9e14a558f8ab-3a7f9a8d86fmr107044695ab.18.1733349047572; Wed, 04 Dec 2024
 13:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
 <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
 <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com>
 <CAF6AEGvqPEFN+j0Txa5KPmxF8tXCn_uUsM86i4uo+tc2mTWYgg@mail.gmail.com>
 <f603f71c-64f4-4f29-b8b9-430d758a738b@quicinc.com>
 <CAF6AEGt-wojTde=OfqSyez3fD1jiyUTP08TWxNQMgkoWhF-MVA@mail.gmail.com>
In-Reply-To: <CAF6AEGt-wojTde=OfqSyez3fD1jiyUTP08TWxNQMgkoWhF-MVA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Dec 2024 13:50:36 -0800
Message-ID: <CAF6AEGuedG4j0no=9GYK=y2HZHVVporDfkpL9y9dg8H5PhZdKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
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

On Wed, Dec 4, 2024 at 1:47=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> On Wed, Dec 4, 2024 at 11:04=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >
> > On 12/1/2024 10:06 PM, Rob Clark wrote:
> > > On Sat, Nov 30, 2024 at 12:30=E2=80=AFPM Akhil P Oommen
> > > <quic_akhilpo@quicinc.com> wrote:
> > >>
> > >> On 11/30/2024 7:01 PM, Konrad Dybcio wrote:
> > >>> On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
> > >>>> There are a few chipsets which don't have system cache a.k.a LLC.
> > >>>> Currently, the assumption in the driver is that the system cache
> > >>>> availability correlates with the presence of GMU or RPMH, which
> > >>>> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> > >>>> with a full blown GMU, but doesnot have a system cache. So,
> > >>>> introduce an Adreno Quirk flag to check support for system cache
> > >>>> instead of using gmu_wrapper flag.
> > >>>>
> > >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > >>>> ---
> > >>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
> > >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
> > >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
> > >>>>  3 files changed, 4 insertions(+), 7 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/g=
pu/drm/msm/adreno/a6xx_catalog.c
> > >>>> index 0c560e84ad5a..5e389f6b8b8a 100644
> > >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > >>>> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] =
=3D {
> > >>>>              },
> > >>>>              .gmem =3D (SZ_128K + SZ_4K),
> > >>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > >>>> +            .quirks =3D ADRENO_QUIRK_NO_SYSCACHE,
> > >>>>              .init =3D a6xx_gpu_init,
> > >>>>              .zapfw =3D "a610_zap.mdt",
> > >>>>              .a6xx =3D &(const struct a6xx_info) {
> > >>>> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] =
=3D {
> > >>>>              },
> > >>>>              .gmem =3D SZ_128K,
> > >>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > >>>> -            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > >>>> +            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_=
NO_SYSCACHE,
> > >>>>              .init =3D a6xx_gpu_init,
> > >>>>              .zapfw =3D "a702_zap.mbn",
> > >>>>              .a6xx =3D &(const struct a6xx_info) {
> > >>>
> > >>> +a619_holi
> > >>>
> > >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/d=
rm/msm/adreno/a6xx_gpu.c
> > >>>> index 019610341df1..a8b928d0f320 100644
> > >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_g=
pu *a6xx_gpu)
> > >>>>
> > >>>>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
> > >>>>  {
> > >>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> > >>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> > >>>> -            return;
> > >>>> -
> > >>>>      llcc_slice_putd(a6xx_gpu->llc_slice);
> > >>>>      llcc_slice_putd(a6xx_gpu->htw_llc_slice);
> > >>>>  }
> > >>>> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct plat=
form_device *pdev,
> > >>>>  {
> > >>>>      struct device_node *phandle;
> > >>>>
> > >>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> > >>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> > >>>> +    if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
> > >>>>              return;
> > >>>
> > >>> I think A612 is the "quirky" one here.. it has some sort of a GMU,
> > >>> but we're choosing not to implement it. maybe a check for
> > >>>
> > >>> if (adreno_has_gmu_wrapper && !adreno_is_a612)
> > >>>
> > >>> would be clearer here, with a comment that RGMU support is not
> > >>> implemented
> > >>>
> > >>>
> > >>>
> > >>> But going further, I'm a bit concerned about dt-bindings.. If we
> > >>> implement RGMU on the driver side in the future, that will require
> > >>> DT changes which will make the currently proposed description inval=
id.
> > >>>
> > >>> I think a better angle would be to add a adreno_has_rgmu() func wit=
h
> > >>> a qcom,adreno-rgmu compatible and plumb it correctly from the get-g=
o.
> > >>>
> > >>> This way, we can avoid this syscache quirk as well.
> > >>>
> > >>
> > >> I am aware of at least Adreno 710 which doesn't have syscache, but h=
as
> > >> proper GMU. And I don't see any reason why there couldn't be another=
 one
> > >> in future to save silicon area. So, a quirk flag doesn't seem so bad=
 in
> > >> this case.
> > >>
> > >> The correct way to avoid this quirk flag is by making LLCC driver re=
turn
> > >> a proper error to detect the absence of syscache. Currently, it just
> > >> returns EPROBE_DEFER which put driver in an infinite probe loop.
> > >
> > > Hmm, this seems solvable?  llcc has a node in the dt, so it seems lik=
e
> > > it should be able to tell the difference between not existing and not
> > > being probed yet.  Something maybe like, initialize drv_data to NULL
> > > instead of -EPROBE_DEFER, and then in the various entry points, if
> > > (!drv_data) return not_probed_helper(); which would check if a
> > > compatible node exists in dt?
> >
> > Sounds like that would work. Can we explore that separately?
> >
> > I am a bit worried about adding another subsystem's patch to this
> > series. That might delay this series by weeks.
>
> I don't think there is a dependency between the two, so it shouldn't
> delay anything.  We can just merge the first patch in this series as
> it is and drop the second.  And the llcc change is a legit bug fix,
> IMO, -EPROBE_DEFER is the incorrect return value when the device is
> not present.

Actually, that wasn't _quite_ correct, but the idea still stands.
Re-send second patch, but without the ADRENO_QUIRK_NO_SYSCACHE parts,
and drop the first.

In parallel send the llcc fix.  There is no compile time dependency,
so they can go thru different trees.

BR,
-R

>
> BR,
> -R
>
> > -Akhil
> >
> > >
> > > BR,
> > > -R
> > >
> > >> Agree about the dt binding suggestion. I will define a new compatibl=
e
> > >> string for rgmu.
> > >>
> > >> -Akhil.
> > >>
> > >>> Konrad
> > >>
> >
