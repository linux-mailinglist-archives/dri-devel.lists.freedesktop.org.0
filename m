Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B033A921AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F71310EB4E;
	Thu, 17 Apr 2025 15:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fPl8SwOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509210EB4D;
 Thu, 17 Apr 2025 15:32:39 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-736abdac347so63873b3a.2; 
 Thu, 17 Apr 2025 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744903958; x=1745508758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hjUaDefyEQ6W4VYwAVRnmpwPnaJPpd/esXUe2Z+J9U0=;
 b=fPl8SwOBZiTDKwxeNBFjOS1h/niII8W7CPIqcLbA1Pk8WP/1WJqTN3Nz1fIrI/C5Pi
 9/I81MXD8ylWLIOdJkbzf0c+9/p6m0E1JQjQX+2zh/Er5uUpQZJ9pjP7668vQgp4KpNZ
 K3MDrYV09hbgwhFkoe7o7Teen/BRZc3JBrqhQMs8AbQdwOVJcXtgsisJ2RTNpbTwbfT2
 IgP0BJqFfnHrbMRyFQ1JdM+oMvmKsG0es495oKNi3xGYPZ5hzF6icV2RDVccMokV4cTE
 b6MRzSBqqmugZRFWWv2u+jotboL8EPlQh29OQOM3ddmSkkyVW4s+pFN4LxyVZWQykXZi
 hEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744903958; x=1745508758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjUaDefyEQ6W4VYwAVRnmpwPnaJPpd/esXUe2Z+J9U0=;
 b=H6kJoA6iA/pL2aqW0X+d03ywuqn+k2rpn70x5eBUPgjJV9bkw86NMJzVXTcvRuSPY6
 VvrqEu4Pe/NiMOXOlKWvp7zur0F/IdMECaC3R0yCzaNxCw05gZWwQE9woDgYERTOJZgu
 79chHtPurfh5F8hIN1l9pN6N2cr2zEMDu1IbW9OT0aorQbcFWZoFsGDyo4OEKuuPEwWc
 MDVD33RDOXE4s0GsVdobUKA1ircYLqKzCfzTenW/FWLvUQTagNd2+nlXejCvMy62aNm1
 Uhv1gYFWeHt6gZQabNDUGpsnUwbtL7vtclL6yshmL74KrrvdH4AUmk3/Dh80z/g5Gq6E
 iVdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuNFX46rTexxtI73i9O6oNZKNn52Je9sWVCAZXFwa/iK5yoicV5cvIuWE8tEYpktjurMjyJ25pjwla@lists.freedesktop.org,
 AJvYcCWuIJ3r0IBzkPLxTc8zHG+boc5vrcV0L4RjbQ5oDFalPNJdhFvCwK/Bkujo4oH4zIX3kaw5fV/Boqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjV5aHDqrFF6qmW/cfQzZAcKhwFKeSTNUSPxg7uMdlezX4Sz63
 hrEvabPt/9hMFX+VVzA7YGMzKQT8CbyXdxvyCJrjVJ3hmhICAw4osRa6V57ejncvbAT8UHCwjkg
 9+Fks0sBAJtjzhBf99giImtDOpp17Mw==
X-Gm-Gg: ASbGnctr2zqdbdA8vPNtu+780U8HFik9mnPgDyVtQOoCxWETsna2+wSbj7iZuOB1yQ9
 rDnSMe9/b9wjBtHQp2xI3t2016jN3qLdL86enX52eVmjsQVzsyBJTEVARjazPGf5zWq3KRkm57K
 632EaF+vEq19PajwkLRT9mPA==
X-Google-Smtp-Source: AGHT+IE6OhXZMCc9wpiri+W4GcoHWYxzV1G7qF+USV2g8DAn6FuLuDMgrsi+iGOQM3HWGaFndQOBglxe7DtHrJLrQFg=
X-Received: by 2002:a05:6a00:a94:b0:737:6589:81e5 with SMTP id
 d2e1a72fcca58-73c31bb50edmr2482676b3a.2.1744903957824; Thu, 17 Apr 2025
 08:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
In-Reply-To: <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 17 Apr 2025 11:32:26 -0400
X-Gm-Features: ATxdqUFdx8uZJbCBVyTuqT8Yis-K6K8ZkpwgS9WYh0KUtOUx2ershvG0Vfr4j4E
Message-ID: <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
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
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > The Highest Bank address Bit value can change based on memory type used=
.
> >
> > Attempt to retrieve it dynamically, and fall back to a reasonable
> > default (the one used prior to this change) on error.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f=
8f5e57f38ecc62d9f 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/firmware/qcom/qcom_scm.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/soc/qcom/llcc-qcom.h>
> > +#include <linux/soc/qcom/smem.h>
> >
> >  #define GPU_PAS_ID 13
> >
> > @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu=
)
> >
> >  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >  {
> > +     int hbb;
> > +
> >       gpu->ubwc_config.rgb565_predicator =3D 0;
> >       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >       gpu->ubwc_config.min_acc_len =3D 0;
> > @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
> >           adreno_is_a690(gpu) ||
> >           adreno_is_a730(gpu) ||
> >           adreno_is_a740_family(gpu)) {
> > -             /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
> >               gpu->ubwc_config.highest_bank_bit =3D 16;
> >               gpu->ubwc_config.amsbc =3D 1;
> >               gpu->ubwc_config.rgb565_predicator =3D 1;
> > @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gp=
u *gpu)
> >               gpu->ubwc_config.highest_bank_bit =3D 14;
> >               gpu->ubwc_config.min_acc_len =3D 1;
> >       }
> > +
> > +     /* Attempt to retrieve the data from SMEM, keep the above default=
s in case of error */
> > +     hbb =3D qcom_smem_dram_get_hbb();
> > +     if (hbb < 0)
> > +             return;
> > +
> > +     gpu->ubwc_config.highest_bank_bit =3D hbb;
>
> I am worried about blindly relying on SMEM data directly for HBB for
> legacy chipsets. There is no guarantee it is accurate on every chipset
> and every version of firmware. Also, until recently, this value was
> hardcoded in Mesa which matched the value in KMD.

To be clear about this, from the moment we introduced host image
copies in Mesa we added support for querying the HBB from the kernel,
explicitly so that we could do what this series does without Mesa ever
breaking. Mesa will never assume the HBB unless the kernel is too old
to support querying it. So don't let Mesa be the thing that stops us
here.

Connor

> So it is better to
> make this opt in, for newer chipsets or those which somebody can verify.
> We can invert this logic to something like this:
>
> if (!gpu->ubwc_config.highest_bank_bit)
>     gpu->ubwc_config.highest_bank_bit =3D qcom_smem_dram_get_hbb();
>
> >  }
> >
> >  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> > @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device =
*dev)
> >       bool is_a7xx;
> >       int ret;
> >
> > +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config() *=
/
> > +     if (!qcom_smem_is_available())
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +
>
> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device present
> in all Qcom SoC devicetrees? I wonder if there is a scenario where there
> might be an infinite EPROBE_DEFER here.
>
> -Akhil.
>
> >       a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
> >       if (!a6xx_gpu)
> >               return ERR_PTR(-ENOMEM);
> >
>
