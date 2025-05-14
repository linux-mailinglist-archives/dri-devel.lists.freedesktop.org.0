Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C1AB7652
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AFA10E63B;
	Wed, 14 May 2025 20:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TlSOT3Al";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CD110E710;
 Wed, 14 May 2025 20:03:09 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d91db4f0c3so960895ab.3; 
 Wed, 14 May 2025 13:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747252988; x=1747857788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1E2sT5R2SmFJKKgIXZwDEjvPjG1MOjyIT8KeOeX6Ys=;
 b=TlSOT3AlDhKkfSyYAgg1SUWYF/DjDY7Rf/c6Tm9dJT/KWDSpY1l/sAA60bJULwZln5
 kteXBAvATWzdbXMWv3IZb5m6sHM78rJ2JhWAQYwOBWMmVgUBf9pbdYgq8RFvsnOb5YVo
 IFWsGtmIstapj+vpne+HhaznIGY48bAjoDlgyg5SlHoDIxSG6xt7JUOx5GpjkCqOYZDr
 uGi9b3/1O4FTo7mYZ41w02eQycq6JhpSxDbELl9sOjRQsUw3qCT6iryCv1EV45mOMm36
 dKaJA9Si2uL98TOeDii0sw5TXYBoPJD1UH8qitRwezFJrOXZ+2IcJdxgi64w4uwMbgN0
 Q2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747252988; x=1747857788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f1E2sT5R2SmFJKKgIXZwDEjvPjG1MOjyIT8KeOeX6Ys=;
 b=fiG0VtaSoODRe4fpf5hnGEkru9JVEK15oZyXFixSDcUoqclhZ1OpJRzaA6q6GcaUXA
 FaKmOXoiwWre0OlQ2XcMTiSuVyeuZz0j59RQ7PBEBOP+tfRQVWJZDI1aZE4lMe9bOpP/
 YVp7LZizJf4ZtN6QIYTp8o9cK+AmpYo1i+qdJDzAut6GkM/OhmpcQcfP0gLxSZtvANd4
 NOz6Ye1gamt2RR+C9zyXmuRUIV8uzUiDyS/BcOM7klx0NXTa7P70EJwKE+x2BhT2NOie
 ehP4gpLjK9EYSUGRjhfRvsz0uLC8yRxYJnOd+T4DJzfL0WZO2Camjjr45I5abnZ/btuN
 phbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS9fJnssHn6+tSdUr+e7sdZja04ytHHtq04iCAbnLBzDZMsW+lIfoUKdS2wYjtvhATIcj69S3LJuXd@lists.freedesktop.org,
 AJvYcCXP+NilxfCu1QR9daG973RpLfKCWPFlboDyIeR2gO2KGJAf8JRWhtgE8NRMz00vVBcu4H4OpWjBjUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZtoSA9H50diWJ932PQMk5Tus8TyoLrSlYGaiMoEjSaLU3D6Fh
 jZI4ot3EaXH8vtk1c5oeExNbxabFIi9wqp8vbBjExtL/hDcMlpFgg2GRFpSdEiJvSHIhliUX0MW
 rHEeUdEZB4TdV7p/8v6WeBPtyjp4=
X-Gm-Gg: ASbGncv59ZsoSOA/QM+jKtOBiQEzreSjfp4/YGVrUeRWwb7/CEBZIlMPAV86Vj5DfDl
 7tBGV0PGIzlaAjd1XEPhWaFWUTDeccejXqhAqerKeZWbDj5GxnVQ715P45d/yQ9FmLZMIdfLJtm
 ZSNwMO4iSECi69w43aO9fiBZBcjxQxCKmt1sEZigOcKItECpqkn4JSphF3w0V71Q==
X-Google-Smtp-Source: AGHT+IF1g7w//ZlnlwapkYnOdaFxYkXwOpQfaU8H1YRFOI08stCn05hzEkMX+xpM9tacO9lTlvp9BUPHgpCDRjYnKhU=
X-Received: by 2002:a05:6e02:1909:b0:3d4:3fbf:967d with SMTP id
 e9e14a558f8ab-3db6f79feefmr55448475ab.7.1747252988035; Wed, 14 May 2025
 13:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
 <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
In-Reply-To: <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 May 2025 13:02:56 -0700
X-Gm-Features: AX0GCFvdoWfmNFmJ9co0T0z7-_QRhBMytxeVDMg9fsi5B81FFmjxiQU2kryYTjI
Message-ID: <CAF6AEGu45fsHVxDa5s0Q2XiaYBBaD14nJq3e0UYr3EpOn+188g@mail.gmail.com>
Subject: Re: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
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

On Wed, May 14, 2025 at 12:15=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, May 14, 2025 at 05:10:27PM +0200, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > This bit is set iff the UBWC version is 1.0. That notably does not
> > include QCM2290's "no UBWC".
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd=
49f2889be13c9780d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *=
gpu)
> >        */
> >       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> >       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> > +     bool ubwc_mode =3D qcom_ubwc_get_ubwc_mode(cfg);
>
> I'd really prefer if the function came in this patch rather than being
> added at some earlier point. I understand that you want to simplify
> cross-tree merging, but I think we should also simplify reviewing.

Also, since it is so far just used by display and gpu, we probably
don't need to care about cross tree too much... we could just land via
drm

BR,
-R

> >       bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
> >       u32 hbb_hi =3D hbb >> 2;
> >       u32 hbb_lo =3D hbb & 3;
> > -     u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
> >
> >       gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> >
> > --
> > 2.49.0
> >
>
> --
> With best wishes
> Dmitry
