Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7ABA92F0F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 03:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5D610E3ED;
	Fri, 18 Apr 2025 01:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XcOQJsfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB7E10E3EC;
 Fri, 18 Apr 2025 01:10:49 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-736abdac347so92758b3a.2; 
 Thu, 17 Apr 2025 18:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744938649; x=1745543449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kat+yfTKYwZ6k+JAfYuf2ANUkCsrf1mfMFdkVb9Kwho=;
 b=XcOQJsfR3xrOpemdKXtQQ0sJHxXKxiRO/F9dIq6GA/vWYL7SyxEsRZ5Qil2Tha8DTg
 FwhKrgK5VloobcVmH2bn/P72JLELExjxEcxLo/eqBQ7L0kvdXTfjupoyWpLetbXNsEBm
 MjQfqw+8uLlHqgJXysGQmJU10jYUJJnKQXjKW9Y4DzGpf6pJHzNSp4/SYE+cJGGnpMc3
 XXa2cmwmYG7vv6I2tMNJsZS0HjLBEwy6LmP/e1Wtw0jLRZtBCVMmIyyMK4BlV9AHMCM6
 jx+YpVoGEo5YOY+ZBh4ExzH6tWkraSqRUyrxDP4QfgnMWQOo6O3WQ+EP5m6Ikx3wT723
 SlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744938649; x=1745543449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kat+yfTKYwZ6k+JAfYuf2ANUkCsrf1mfMFdkVb9Kwho=;
 b=MSng2EPPGeHz8/8kcS0wP0n+7pehGh1FuogczCuY2sJn2qPFbiE0moC7yMgUmafwLk
 EnxOPSKsxTq0jAgOf7yI5A8+3fYMHBRGyvwzysJSriOvwiDYwbPEu+W5SrZ0TNSY6Fpy
 DjOroitBmBTJ4LUaMOQrjXtD9cJJH3NUG8Xdqh0XyteVisPaFWyJaUUJBvo5hEYs33Oa
 B3xgE+n6C6ffoLYEoLvOaIv9QX2CAs/bLHAZlf1Si8lkSEzP2LLJaPtLU3Pd+GySXidd
 /bOEoHwcmVDtNmO0eJ4Vfrr5MsxJ8oMdt0TxZmd5fkhlgs0wb/CnkBTmRidSmp9DU8cW
 Vn2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqnSu8wx4hr2k5w0tuepdlqJrsum8YCBx5YgqY1aAltw15Gnff7cXXBIrI5paI0RUHRSxoDwwA7Vw=@lists.freedesktop.org,
 AJvYcCWtbW4bLOCCHsxQwhUBbuUzJppXB1APYoTJ7I+xdPNq3O/HvtX8n9b52DTzDsJ8HIaM8BPvj4Vl/P3y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQiz+A4xO+fClhGFS5LPwCAZYx4RUqoc6ShlCEwcAdwnUA76+w
 MCwcCnse6ttw+ACeiAarNSMRP7L2xnvsphrhzwRsHD6ap3ftoETXRiRn821FAV3RFXIJ8+DWXTA
 Te/siTiFy8MlwBcU8wcIficnLBo4=
X-Gm-Gg: ASbGnctYFuM9BSj1r0sRO+0/NDAwsU0P7aSaAhWV9AkuA6wk0AB9XmCG7EuihuNuumB
 YfKzpTzWnvW+j/L69Ez8XJAUTozI9RB6nCTmYNnEYphgtcfAWzeT/Khvr4gXrzs4kXdGN8nfxb1
 WqmQ/jx6DFhN5T4jv4ZWZLEA==
X-Google-Smtp-Source: AGHT+IGVHe0CCUPFVQsJ0aWOZEwqj7UP7h6CJNGT/eTYTOOCB4kGqLoEA94LehtUfpsVsP2AsVFwTQjFQjgmIYvl7i0=
X-Received: by 2002:aa7:8895:0:b0:737:6589:81e5 with SMTP id
 d2e1a72fcca58-73dc1448873mr446887b3a.2.1744938648737; Thu, 17 Apr 2025
 18:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
In-Reply-To: <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 17 Apr 2025 21:10:37 -0400
X-Gm-Features: ATxdqUGYdy5x4IIY0W9fkNUkfoD5MMd7bZ37IvqDV_dB3fjGQ5gkqQcuScdMKCc
Message-ID: <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-hardening@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicinc.=
com> wrote:
>
> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> > On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> The Highest Bank address Bit value can change based on memory type us=
ed.
> >>>
> >>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>> default (the one used prior to this change) on error.
> >>>
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae=
5f8f5e57f38ecc62d9f 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -13,6 +13,7 @@
> >>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>  #include <linux/pm_domain.h>
> >>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>> +#include <linux/soc/qcom/smem.h>
> >>>
> >>>  #define GPU_PAS_ID 13
> >>>
> >>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *g=
pu)
> >>>
> >>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>  {
> >>> +     int hbb;
> >>> +
> >>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_g=
pu *gpu)
> >>>           adreno_is_a690(gpu) ||
> >>>           adreno_is_a730(gpu) ||
> >>>           adreno_is_a740_family(gpu)) {
> >>> -             /* TODO: get ddr type from bootloader and use 2 for LPD=
DR4 */
> >>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>               gpu->ubwc_config.amsbc =3D 1;
> >>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_=
gpu *gpu)
> >>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>       }
> >>> +
> >>> +     /* Attempt to retrieve the data from SMEM, keep the above defau=
lts in case of error */
> >>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>> +     if (hbb < 0)
> >>> +             return;
> >>> +
> >>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>
> >> I am worried about blindly relying on SMEM data directly for HBB for
> >> legacy chipsets. There is no guarantee it is accurate on every chipset
> >> and every version of firmware. Also, until recently, this value was
> >> hardcoded in Mesa which matched the value in KMD.
> >
> > To be clear about this, from the moment we introduced host image
> > copies in Mesa we added support for querying the HBB from the kernel,
> > explicitly so that we could do what this series does without Mesa ever
> > breaking. Mesa will never assume the HBB unless the kernel is too old
> > to support querying it. So don't let Mesa be the thing that stops us
> > here.
>
> Thanks for clarifying about Mesa. I still don't trust a data source that
> is unused in production.

Fair enough, I'm not going to argue with that part. Just wanted to
clear up any confusion about Mesa.

Although, IIRC kgsl did set different values for a650 depending on
memory type... do you know what source that used?

>
> I have a related question about HBB. Blob driver doesn't support
> host_image_copy, but it still use HBB configuration. I was under the
> impression this was required for UMD for compression related
> configurations. Is that not true for turnip/freedreno?
>
> -Akhil.

AFAIK the HBB (as well as other UBWC config parameters) doesn't have
any impact on layout configuration, so the UMD can ignore it except
when it's doing CPU texture uploads/downloads. We certainly do in
freedreno/turnip. You'd have to ask that team what they use HBB for,
but my best guess is that the GLES driver uses it for CPU texture
uploads sometimes. That is, the GLES driver might be using
functionality similar to host_image_copy "under the hood". It's
something we'd probably want for freedreno too.

Connor

>
> >
> > Connor
> >
> >> So it is better to
> >> make this opt in, for newer chipsets or those which somebody can verif=
y.
> >> We can invert this logic to something like this:
> >>
> >> if (!gpu->ubwc_config.highest_bank_bit)
> >>     gpu->ubwc_config.highest_bank_bit =3D qcom_smem_dram_get_hbb();
> >>
> >>>  }
> >>>
> >>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>> @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_devic=
e *dev)
> >>>       bool is_a7xx;
> >>>       int ret;
> >>>
> >>> +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config()=
 */
> >>> +     if (!qcom_smem_is_available())
> >>> +             return ERR_PTR(-EPROBE_DEFER);
> >>> +
> >>
> >> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device presen=
t
> >> in all Qcom SoC devicetrees? I wonder if there is a scenario where the=
re
> >> might be an infinite EPROBE_DEFER here.
> >>
> >> -Akhil.
> >>
> >>>       a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
> >>>       if (!a6xx_gpu)
> >>>               return ERR_PTR(-ENOMEM);
> >>>
> >>
>
