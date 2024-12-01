Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6109DF681
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 17:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6401810E3FB;
	Sun,  1 Dec 2024 16:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kSqbNXNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB0710E13A;
 Sun,  1 Dec 2024 16:36:35 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-84197b4e61aso131056139f.3; 
 Sun, 01 Dec 2024 08:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733070995; x=1733675795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+35eOzfvYajKV3Nm3HQixZpInvCrAeOE/bEVYUk458g=;
 b=kSqbNXNtilSGqZR3iG/UtMW51O2AMlT0tQPuOxKDDF59FasgWfwSCNZsFHkaCz60/3
 2q3+xBwalimehxU+FRuPL0KiAgfWxXjSV+jlat9s/eKLzwEvaqNdJo0jwzXmQDcueCj2
 ATAwC9p2HXTtlr+eHC1+77s/LaaX6g2x40PLolxuSpBr1UrZMHYro4KSmYizEPiA/45F
 /attmGLrk0WVt0Jw8oB44hSVrS2zk8p6e3bcrLqTP6IEDmEjlUT/Kb96OjE2WQ3HxyHC
 lEktP/Fs7sE/Cj3TZk/GEwFzVTAVn8NCsP6OwpJQPgW3B4yueGD5PouFHPYYvpg/kMfq
 I+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733070995; x=1733675795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+35eOzfvYajKV3Nm3HQixZpInvCrAeOE/bEVYUk458g=;
 b=J7YIkew+mkuUmANDl5/7MxwgPCRg213gEOQvtUV+a351O5PMDKuO4M/9DXcQJ/E2BE
 3/BQO4oC7ChlP9tsPBl73NYuyu9BCIckJ3y4dhFh7Vm45R+Qp+dOkDeDED70b3Wp2vMA
 siGBhda7uNurh1ESttJRquj6WZWsBfYA23FX9s6LU/vaVIMGUxylpjapBq1ep1nFeSS1
 iO/9PhSVx4+9whaFVoesV18v3B0vJZZfIufihCL5YHyttuWR9vF8UECdXy0HXiBpWyp0
 OOcMlTEdaLwn+RCiFbLvkmK9i3o2hNmNI0StIN9nm0TaO2Ib2EDkkmezmFul99a386qd
 bWxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuc+G3IP4aTPjCZ67PFQs2hMobrMbiv0omGK4iw5GZfnfsZhwfRkAcp6Z8kvm5ihDnSTErysmDaY4=@lists.freedesktop.org,
 AJvYcCVYHHvpMj9HyWhMV4z6VO7+IVzrJremIiYPxv5U5Tls4owzqegfASfsNKNrA85XklhkFxaJ5bQlcpz/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNxnqj34bQR+wzb7VOgeCabmWogVydjK+Q2O03bX5NCrnnxkvT
 M06qpAISha4RdyDY0mEiKj/URQZjxl4LKID/wb3j1HtNPPoFO/k/cexLKW7xrpMUlx6/Wms4bJD
 vp8kV1n4R34iNfIJsLDgfMcdH18M=
X-Gm-Gg: ASbGncu8eiECmzPQUSVSKVl3IG4AI5DFzhHH0Yz3mnmH1VzVl10zygugbZCElPQisuE
 2hvWS6f32ydrPKZrMYaFA8znQ/behUIQ=
X-Google-Smtp-Source: AGHT+IGAFxd+VmGnfW2AJOQn/sdbZ1aJbEv+tkoCAMmunmiIAyzosR/XXQh7YEEUfl26fOoBWaBNVr43pumc1fETHe4=
X-Received: by 2002:a05:6602:2d84:b0:834:f2d5:c758 with SMTP id
 ca18e2360f4ac-843ed01ca9amr1900930739f.13.1733070995124; Sun, 01 Dec 2024
 08:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
 <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
 <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com>
In-Reply-To: <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 1 Dec 2024 08:36:23 -0800
Message-ID: <CAF6AEGvqPEFN+j0Txa5KPmxF8tXCn_uUsM86i4uo+tc2mTWYgg@mail.gmail.com>
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

On Sat, Nov 30, 2024 at 12:30=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 11/30/2024 7:01 PM, Konrad Dybcio wrote:
> > On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
> >> There are a few chipsets which don't have system cache a.k.a LLC.
> >> Currently, the assumption in the driver is that the system cache
> >> availability correlates with the presence of GMU or RPMH, which
> >> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> >> with a full blown GMU, but doesnot have a system cache. So,
> >> introduce an Adreno Quirk flag to check support for system cache
> >> instead of using gmu_wrapper flag.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
> >>  3 files changed, 4 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/d=
rm/msm/adreno/a6xx_catalog.c
> >> index 0c560e84ad5a..5e389f6b8b8a 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >>              },
> >>              .gmem =3D (SZ_128K + SZ_4K),
> >>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >> +            .quirks =3D ADRENO_QUIRK_NO_SYSCACHE,
> >>              .init =3D a6xx_gpu_init,
> >>              .zapfw =3D "a610_zap.mdt",
> >>              .a6xx =3D &(const struct a6xx_info) {
> >> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] =3D =
{
> >>              },
> >>              .gmem =3D SZ_128K,
> >>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >> -            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> >> +            .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_S=
YSCACHE,
> >>              .init =3D a6xx_gpu_init,
> >>              .zapfw =3D "a702_zap.mbn",
> >>              .a6xx =3D &(const struct a6xx_info) {
> >
> > +a619_holi
> >
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 019610341df1..a8b928d0f320 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *=
a6xx_gpu)
> >>
> >>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
> >>  {
> >> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >> -            return;
> >> -
> >>      llcc_slice_putd(a6xx_gpu->llc_slice);
> >>      llcc_slice_putd(a6xx_gpu->htw_llc_slice);
> >>  }
> >> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform=
_device *pdev,
> >>  {
> >>      struct device_node *phandle;
> >>
> >> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >> +    if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
> >>              return;
> >
> > I think A612 is the "quirky" one here.. it has some sort of a GMU,
> > but we're choosing not to implement it. maybe a check for
> >
> > if (adreno_has_gmu_wrapper && !adreno_is_a612)
> >
> > would be clearer here, with a comment that RGMU support is not
> > implemented
> >
> >
> >
> > But going further, I'm a bit concerned about dt-bindings.. If we
> > implement RGMU on the driver side in the future, that will require
> > DT changes which will make the currently proposed description invalid.
> >
> > I think a better angle would be to add a adreno_has_rgmu() func with
> > a qcom,adreno-rgmu compatible and plumb it correctly from the get-go.
> >
> > This way, we can avoid this syscache quirk as well.
> >
>
> I am aware of at least Adreno 710 which doesn't have syscache, but has
> proper GMU. And I don't see any reason why there couldn't be another one
> in future to save silicon area. So, a quirk flag doesn't seem so bad in
> this case.
>
> The correct way to avoid this quirk flag is by making LLCC driver return
> a proper error to detect the absence of syscache. Currently, it just
> returns EPROBE_DEFER which put driver in an infinite probe loop.

Hmm, this seems solvable?  llcc has a node in the dt, so it seems like
it should be able to tell the difference between not existing and not
being probed yet.  Something maybe like, initialize drv_data to NULL
instead of -EPROBE_DEFER, and then in the various entry points, if
(!drv_data) return not_probed_helper(); which would check if a
compatible node exists in dt?

BR,
-R

> Agree about the dt binding suggestion. I will define a new compatible
> string for rgmu.
>
> -Akhil.
>
> > Konrad
>
