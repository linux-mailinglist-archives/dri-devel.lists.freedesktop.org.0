Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25291B139
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 23:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EEF10EB50;
	Thu, 27 Jun 2024 21:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DxG8BSnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC1810EB66;
 Thu, 27 Jun 2024 21:13:52 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so3252394a12.1; 
 Thu, 27 Jun 2024 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719522831; x=1720127631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdyLy6/EC6n+nWMktm84sF7VQwRPczuMD4vDAUu/UKA=;
 b=DxG8BSnNY3MZ55GZ86QKaRKG4MFOY/3Us4DK2abOv0WrWngGpo2H7CgtuGoQoMkiUJ
 lgpcRR4mdV8I/MWC95sVw+KywAiSZMmjfJG1IC0ynhJGVpsi5Kgp46fp+sH4eZA4XwGn
 qvH9CY5yAJgDwEqo6NeEpxGMXxezgrOnb338eCNuPDnhYvVUkv+H0LKOQUuShkFxdT2Q
 17l15PobEQqa2RcbqlK1t71Me4pvD2nhkDU8d9oDxwpcZEwTCJqH/tY0lefpGczithbg
 98/X9R264SIOwd3qBVhBSAHIe5R61a70DCohh1O4+bzJWR2RP6VEn/hDl8NGMJQZH9rO
 dopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719522831; x=1720127631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SdyLy6/EC6n+nWMktm84sF7VQwRPczuMD4vDAUu/UKA=;
 b=FhRUo/3ARiGDNPyKJq/jmwFPCdIABgoIYRqoSkaNzspSJXPIfOS+0xDJmCOr8mP40T
 mxrSg55PBO4/lPfnEzd4UDQ319SFngXSf/QCt2RhNQLyc0WOgn8wShUk7LYORHuL3fBi
 cNT54VIKFGsDVghhFxPgXpYIJKe2gg3YaUks43B5zr1pClOk79/MS+oNTq7PuktvHqi8
 OOEoHcsEgzAmbgADKHAsjMJa//KRWyrLbTu3B8qdytidQtSQk3w1cO5GRz1SxDnOG/0/
 ufDbFAeoZqixZpHCSME8Uth1Bp7Vx4+ka0LZeoicPXHH1RQDu7f9ju6p8ftzjTs2+DFT
 I4RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrASuKJDLx8hSNk2Rodre6f/Ty15kDUnb7b0623/C/NpvAk07FvOMASi6SrjtQBRcGdEJy9rDiu/53aRi4pdwnDWjPh9pzPYeQ9y+KIK+H
X-Gm-Message-State: AOJu0Yx8jjQeRyKmGxkWLWLUkIfg+7zqOR/YG+bAeKnZYeQR4h09JVb+
 66ZHLqaF727NrMACV/vnWNoLwt+bMwcAMQlub882GYG+zkLyZLSHuvHMQIMmyWpWJgNPgNCzhyS
 HsacGQV6rAM/Bt2LgLsrPWAGj9Mo=
X-Google-Smtp-Source: AGHT+IF1DmPpmZoGMqNyD84MEzafXnIe+fh//3HqVzkuJ6xtrDVjUhmfm2mBoN/JpPHZG6+S6iR8Ztks9DhAPiT79Zc=
X-Received: by 2002:a05:6402:12c5:b0:584:66eb:7e76 with SMTP id
 4fb4d7f45d1cf-584bbbf39bdmr2468214a12.8.1719522830484; Thu, 27 Jun 2024
 14:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Jun 2024 14:13:38 -0700
Message-ID: <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dpu: check ubwc support before adding
 compressed formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, konrad.dybcio@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Jun 27, 2024 at 1:53=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> On QCM2290 chipset DPU does not support UBWC.
>
> Add a dpu cap to indicate this and do not expose compressed formats
> in this case.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c               | 5 ++++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/dr=
ivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 3cbb2fe8aba2..6671f798bacc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -12,6 +12,7 @@ static const struct dpu_caps qcm2290_dpu_caps =3D {
>         .max_mixer_blendstages =3D 0x4,
>         .has_dim_layer =3D true,
>         .has_idle_pc =3D true,
> +       .has_no_ubwc =3D true,
>         .max_linewidth =3D 2160,
>         .pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index af2ead1c4886..676d0a283922 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -342,6 +342,7 @@ struct dpu_rotation_cfg {
>   * @has_dim_layer      dim layer feature status
>   * @has_idle_pc        indicate if idle power collapse feature is suppor=
ted
>   * @has_3d_merge       indicate if 3D merge is supported
> + * @has_no_ubwc        indicate if UBWC is supported
>   * @max_linewidth      max linewidth for sspp
>   * @pixel_ram_size     size of latency hiding and de-tiling buffer in by=
tes
>   * @max_hdeci_exp      max horizontal decimation supported (max is 2^val=
ue)
> @@ -354,6 +355,7 @@ struct dpu_caps {
>         bool has_dim_layer;
>         bool has_idle_pc;
>         bool has_3d_merge;
> +       bool has_no_ubwc;

has_no_ubwc sounds kinda awkward compared to has_ubwc.  But I guess
you wanted to avoid all that churn..

How about instead, if msm_mdss_data::ubwc_{enc,dec}_version are zero,
then we know there is no ubwc support in the display.

BR,
-R


>         /* SSPP limits */
>         u32 max_linewidth;
>         u32 pixel_ram_size;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 6000e84598c2..31fe0fc4c02e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1341,10 +1341,13 @@ void dpu_plane_danger_signal_ctrl(struct drm_plan=
e *plane, bool enable)
>  static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>                 uint32_t format, uint64_t modifier)
>  {
> +       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> +       const struct dpu_caps *caps =3D pdpu->catalog->caps;
> +
>         if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
>                 return true;
>
> -       if (modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +       if (modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED && !caps->has_=
no_ubwc)
>                 return dpu_find_format(format, qcom_compressed_supported_=
formats,
>                                 ARRAY_SIZE(qcom_compressed_supported_form=
ats));
>
> --
> 2.44.0
>
