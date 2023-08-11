Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B07793EF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6013B10E6AD;
	Fri, 11 Aug 2023 16:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ED310E6AD;
 Fri, 11 Aug 2023 16:10:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so4482344a12.0; 
 Fri, 11 Aug 2023 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691770205; x=1692375005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym004eIRmvmMFQo8mUbbqDbth7KmZWTntlVbAplj16M=;
 b=iD5mOfGxgwYbY4SoQbmOj0BMdVHU4yRk7G3NLwTQquvdrbyWGeUX9haPDSdK5LogCl
 9vvVug8VoC6A2cRxOyi9yn0HHK9MSitEZKaNBzS58kno/La6t8knzqqDWfZkwM78ac3p
 hcl2bS8TO9I/xQSXreNkna2iTPdSqVSNL6XnSbmtMNN8a4DpTlconPn8WzccE7Zgfv3Z
 0b0NKr6kjxTAWJqtAni/G8GCexoKnUbRpwc5SNl1HjN06FCGIw50SxW5nstDsL4QclgN
 icMBcCDFaICHZlpciGDBdv82vNk01z40ABV5nGfAvkrD1ZNhzFQnoXCNbo6H8Ioak3+B
 4UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770205; x=1692375005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym004eIRmvmMFQo8mUbbqDbth7KmZWTntlVbAplj16M=;
 b=SCiciJ2nr2myv/cNBt7bxFDmNW0ADfkAnxb3Rg6XT6L/3f0sU0UiAFFz4Q6Y4nzGAe
 jaxBaDbZLKEHM9GUzdw3pN6h/RgSiKXvspqECbXrInID++TU5vZAnKlZ2jnvWuCESXqP
 9SVy3e2xGIEnUY7nF7t85MjmBtgrrgBGpWw5TkeduGYBqfYPElGYpoW+GCapYarGyQ5W
 rNT4vVWoGf/1oIBslV2lSgI5g6MyrEp7uZuKK9LuicY54ARVeU4PXFouib5Hk0CsCVtP
 hCEnCFoKAn3rfGBff5a7dSHIqVbsO/yRogBmTg0IXTQOCFTyGY8Rnt2o20egJVcE2VTR
 vA+g==
X-Gm-Message-State: AOJu0YxBDmNb+Qh8vkItw2NjdaH1DFzUrDL8PYfVZMIDN3bJWv+bgnLN
 lYvk0kXJRlqEbD/9Bw8e1YreChsnJTNEUicvjSoNg9L94Wg=
X-Google-Smtp-Source: AGHT+IHFkb/ctd4mXB81bdEaX7yilHpZjHUErqKs2itmxeawzkk3HbLSyuejRPO1s9uFEBweGkHUzrCThnuI87955+M=
X-Received: by 2002:aa7:c683:0:b0:523:3e27:caa7 with SMTP id
 n3-20020aa7c683000000b005233e27caa7mr2262400edq.20.1691770204710; Fri, 11 Aug
 2023 09:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230811160505.174574-1-robdclark@gmail.com>
In-Reply-To: <20230811160505.174574-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 11 Aug 2023 09:09:51 -0700
Message-ID: <CAF6AEGtNgCxsOLyF31=WCdag4Gb7+2FvFEvOWDcqd_TxiTeE3w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a690: Switch to a660_gmu.bin
To: dri-devel@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 9:05=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> There isn't actually a a690_gmu.bin.  But it appears that the normal
> a660_gmu.bin works fine.  Normally all the devices within a sub-
> generation (or "family") will use the same fw, and a690 is in the a660
> family.
>

possibly this could be considered as:

Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 1ed270dae148..756a9cfe1cbf 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -478,7 +478,7 @@ static const struct adreno_info gpulist[] =3D {
>                 .family =3D ADRENO_6XX_GEN4,
>                 .fw =3D {
>                         [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> -                       [ADRENO_FW_GMU] =3D "a690_gmu.bin",
> +                       [ADRENO_FW_GMU] =3D "a660_gmu.bin",
>                 },
>                 .gmem =3D SZ_4M,
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> --
> 2.41.0
>
