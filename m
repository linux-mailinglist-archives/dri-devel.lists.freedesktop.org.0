Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D29EA186
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 22:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E4610E35D;
	Mon,  9 Dec 2024 21:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/FwsSje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEC410E034;
 Mon,  9 Dec 2024 21:56:56 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3a8ed4c8647so17242905ab.1; 
 Mon, 09 Dec 2024 13:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733781416; x=1734386216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUNHDJ6ILFxdRFiTOkLTRDjyDsyOaooQYqwkxtWBOZs=;
 b=m/FwsSjenXj6Hw/fmr1ujJ8tGnYK8zZu5iJ0BwgiUVD7HTz5VxbY2VQu4Fk60mEx2I
 b6dCw79IQZ/w2r7AAp40TcDAUVXtLuTSw5y1OYxLlEF3oyaoKsmSr1vDBFHw/Dk8Ymet
 I+ea/OVVO7fUJuEXaI7EXU37/jT1XfLa+3ZNj70tcpQxmn8JQlaYJSPuuHnWecS3DCRz
 hkWg3Q83ekFYO0n1l1dnckCwUzOnyy7NOD1zlKox7dSYKYQArkzrTO//VbeyZHAC+GVH
 0CiubjFW8hmhAomka8/77UswMgP6Oj/EFzXUkvVb7HAv0smvQ7X3nNl4MKUFR/wHjbst
 0Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733781416; x=1734386216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nUNHDJ6ILFxdRFiTOkLTRDjyDsyOaooQYqwkxtWBOZs=;
 b=Mo/o45u5w55GJLWXIY5lKkXoviUQm9GRvoKokIKZ5My+iYYFWo9xyJsf90xr52ZxLr
 roehxOa2U0CS9t0RA/JpJRfn1p/XV2j1jG6y9gjAaZnBVHIjQ+c8BV8tLvS7eRXYc/i8
 3ndBUbUxBzFpF3xanyPt209l3u7ZLTGc3+8e+i3m+58RWxee1hRr/c0uimBjbHunagcj
 rExbhzGPkhlfAkddGh8YtKFpOi1n06JB3lJLN8WLLJYEzXplmAbb5Sv5NduA8OSrIqc2
 T8fb6fIBxu4NF9k+t+wY6P5NyNy0JsyfRRGw+/fMVLwCFcXZqQN/R73eeafmodUHI+Py
 dnog==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4jUfdpIK9iAKAhFIYf41M7EbzpjKqTX0a9Gs46MIlNQ+A3lYZA5O3Y4Fz3zwl/fzjxujCUv0jGczL@lists.freedesktop.org,
 AJvYcCWCWvX/HZ7J9vAarz+oUVLcUuNRrMl3rVgoKFgf3CCoCpC9xWu0Kkjr9pN+6YWtUi5RaphIxrBpacM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjUYanh3meoyC+tfFvMaUHGshYsvkSsHwJWtzqgBpqgI/66hX9
 lWBXQPWS1r9WwHE6ri3uRcBLdiZvSaopNLFfW1y3Icv6LUw23wTUnJF3SeOnGpHvV0/J7/jt9cZ
 yfqwouPuvvn/GslFDFswOYV0x2H0=
X-Gm-Gg: ASbGncviAZpRI49R9G7EI+0cxUItnRLf7+7Pz1mgc27DttJ0G670X2GBIHs27jtm3x0
 w4UVjC8MKOw1tXdi4yLs6kUUyQz9q83TyULk3ifLSkPWvwz/W7KlimZ4jDEeO6I41Ug==
X-Google-Smtp-Source: AGHT+IH7i9zLT2/3HS5RsXkA25gYc8CnkPrXffiXodQojiAfgigEq875VdgnrRDYd+CYD90qZDMyy0maoJBm25wbQSE=
X-Received: by 2002:a05:6e02:3707:b0:3a7:9670:7abb with SMTP id
 e9e14a558f8ab-3a811e073a4mr155617215ab.15.1733781415758; Mon, 09 Dec 2024
 13:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
In-Reply-To: <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Dec 2024 13:56:44 -0800
Message-ID: <CAF6AEGvBU8mB5HHNK4nP5h9ouKfLNhCMFgF+PhrC77ZMfSOTkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Mon, Dec 9, 2024 at 12:52=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> When kernel is booted in EL2, SECVID registers are accessible to the
> >> KMD. So we can use that to switch GPU's secure mode to avoid dependenc=
y
> >> on Zap firmware. Also, we can't load a secure firmware without a
> >> hypervisor that supports it.
> >
> > Shouldn't we do this based on whether zap node is in dtb (and not disab=
led)?
>
> This is better, isn't it? Otherwise, multiple overlays should be
> maintained for each soc/board since EL2 can be toggled from bootloader.
> And this feature is likely going to be more widely available.

I guess the first question is what the dt should look like.  I think
it makes sense to not have a zap node when booting in EL2 (or at least
disabling it) because that describes the hw+fw situation.  And in any
case, so far it seems like we often need unrelated changes[1].  But
maybe others have differing opinions.

And depending on how much cooperation we get from the bootloader, it
could be that our hand is forced.  I figured I should at least point
out how we currently handle this.

A further point, I suppose it is in theory possible that a device
could have no secure playback support, despite booting in EL1?  So
tying this to EL2 seems a bit contrived.

BR,
-R

[1] https://github.com/TravMurav/slbounce/blob/main/dtbo/x1e-el2.dtso

> -Akhil.
>
> >
> > slbounce applies some dtb overlays to disable the zap node when
> > booting in EL2 (and make some other changes due to kernel being in
> > control of the pci smmuv3, or something along those lines).
> >
> > BR,
> > -R
> >
> >>
> >> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> >>
> >> 1. Gunyah (No KVM) - Loads zap shader based on DT
> >> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> >> 3. KVM in nVHE - Loads zap shader based on DT
> >> 4. Kernel in EL2 with CONFIG_KVM=3Dn - Skips zap shader load and
> >>         programs SECVID register
> >>
> >> For (1) and (3) configuration, this patch doesn't have any impact.
> >> Driver loads secure firmware based on other existing hints.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++---=
---------
> >>  1 file changed, 54 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 019610341df1..9dcaa8472430 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -14,6 +14,10 @@
> >>  #include <linux/pm_domain.h>
> >>  #include <linux/soc/qcom/llcc-qcom.h>
> >>
> >> +#ifdef CONFIG_ARM64
> >> +#include <asm/virt.h>
> >> +#endif
> >> +
> >>  #define GPU_PAS_ID 13
> >>
> >>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> >> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *=
gpu)
> >>         return ret;
> >>  }
> >>
> >> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> >> +{
> >> +       int ret;
> >> +
> >> +#ifdef CONFIG_ARM64
> >> +       /*
> >> +        * We can access SECVID_TRUST_CNTL register when kernel is boo=
ted in EL2 mode. So, use it
> >> +        * to switch the secure mode to avoid the dependency on zap sh=
ader.
> >> +        */
> >> +       if (is_kernel_in_hyp_mode())
> >> +               goto direct_switch;
> >> +#endif
> >> +
> >> +       /*
> >> +        * Try to load a zap shader into the secure world. If successf=
ul
> >> +        * we can use the CP to switch out of secure mode. If not then=
 we
> >> +        * have no resource but to try to switch ourselves out manuall=
y. If we
> >> +        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL reg=
ister will
> >> +        * be blocked and a permissions violation will soon follow.
> >> +        */
> >> +       ret =3D a6xx_zap_shader_init(gpu);
> >> +       if (ret =3D=3D -ENODEV) {
> >> +               /*
> >> +                * This device does not use zap shader (but print a wa=
rning
> >> +                * just in case someone got their dt wrong.. hopefully=
 they
> >> +                * have a debug UART to realize the error of their way=
s...
> >> +                * if you mess this up you are about to crash horribly=
)
> >> +                */
> >> +               dev_warn_once(gpu->dev->dev,
> >> +                       "Zap shader not enabled - using SECVID_TRUST_C=
NTL instead\n");
> >> +               goto direct_switch;
> >> +       } else if (ret)
> >> +               return ret;
> >> +
> >> +       OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> >> +       OUT_RING(gpu->rb[0], 0x00000000);
> >> +
> >> +       a6xx_flush(gpu, gpu->rb[0]);
> >> +       if (!a6xx_idle(gpu, gpu->rb[0]))
> >> +               return -EINVAL;
> >> +
> >> +       return 0;
> >> +
> >> +direct_switch:
> >> +       gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> >> +       return 0;
> >> +}
> >> +
> >>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
> >>                        A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLO=
W | \
> >>                        A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
> >> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
> >>         if (ret)
> >>                 goto out;
> >>
> >> -       /*
> >> -        * Try to load a zap shader into the secure world. If successf=
ul
> >> -        * we can use the CP to switch out of secure mode. If not then=
 we
> >> -        * have no resource but to try to switch ourselves out manuall=
y. If we
> >> -        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL reg=
ister will
> >> -        * be blocked and a permissions violation will soon follow.
> >> -        */
> >> -       ret =3D a6xx_zap_shader_init(gpu);
> >> -       if (!ret) {
> >> -               OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> >> -               OUT_RING(gpu->rb[0], 0x00000000);
> >> -
> >> -               a6xx_flush(gpu, gpu->rb[0]);
> >> -               if (!a6xx_idle(gpu, gpu->rb[0]))
> >> -                       return -EINVAL;
> >> -       } else if (ret =3D=3D -ENODEV) {
> >> -               /*
> >> -                * This device does not use zap shader (but print a wa=
rning
> >> -                * just in case someone got their dt wrong.. hopefully=
 they
> >> -                * have a debug UART to realize the error of their way=
s...
> >> -                * if you mess this up you are about to crash horribly=
)
> >> -                */
> >> -               dev_warn_once(gpu->dev->dev,
> >> -                       "Zap shader not enabled - using SECVID_TRUST_C=
NTL instead\n");
> >> -               gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> >> -               ret =3D 0;
> >> -       } else {
> >> +       ret =3D a6xx_switch_secure_mode(gpu);
> >> +       if (!ret)
> >>                 return ret;
> >> -       }
> >>
> >>  out:
> >>         if (adreno_has_gmu_wrapper(adreno_gpu))
> >>
> >> ---
> >> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
> >> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
> >>
> >> Best regards,
> >> --
> >> Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>
>
