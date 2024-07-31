Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA49433D4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 18:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E71210E674;
	Wed, 31 Jul 2024 16:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BAKtCT/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695F10E67F;
 Wed, 31 Jul 2024 16:05:27 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5a2a90243c9so7191194a12.0; 
 Wed, 31 Jul 2024 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722441925; x=1723046725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0PK3XROm8AdCzvoF33BbXJKpI9sLb7+6gEw3RJDbeG8=;
 b=BAKtCT/NVpRFL5AxxiqjAHI20FU9nEqp3y1GqsYm3nqVVd/hKk+U3OMT1jebbotjRH
 EFBBSnOaVbhvSLUVHZ7/edKZMpSh8ZyHs90fm10w9Nieh1XFjwsDehC97Vxzg9BluzO8
 Aymnuxe5KXcVuDGRc37jHU3PaWdbTeEsH8xfNg0aYl3YQjWQrJl8lfxlOJClg99mBScl
 spYDajxPK5+Z3i8dgDvBcugGJ98p/Yi0kBPEvmJSF4ABIsIhhTLYz9vbjbxnkSU3U2D/
 m9KQJSpf/sPZ8/L/eIyFvxpBjrYWiMwPo/Mc9uT0Tis+P7qSHawtkx8C5AjILYVrmBqc
 fi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722441925; x=1723046725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0PK3XROm8AdCzvoF33BbXJKpI9sLb7+6gEw3RJDbeG8=;
 b=caB3YP3fHWbVHwogjaKSNK/M6UFYgQ0R3lfmPdFY556oM3O1uLJ4NdjoLihT3c15pg
 go0fW2aFkNxpbpj8IxoCRwkVl5aETDb+4UETem7LVl4gbNnJb9Xn9W7WTWXUSrLC7Deh
 FK3CJe7Gwgf9uNn5kd8hRH0ujCFrl2X0ITJehfl8j/5BjV91AsBvprmU9srSWEl4AqVo
 F9IOsf8THvI1OQtbQoA+Ai3EJFy+mnZ0SMxT9mAdQWkwArqA/f8LvVgm1TVl19K3sr+y
 C6GQX2EZP161DeHBAyv1ObdlzBZL0ITDqoG/7WulxjpjSCwyg7VuUfvVs2RvD/8Gak8s
 PzDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfp91hY4miXDz9xtty8sKPP/wa3DH1fPl9DXLcOUHtkVrFvfLF5Tpw1yaXYXcmWUqx3F3R2fGWeE6xgPeb5PBFNmytqa+bzFQyGG1bjY/ZEb8wB2tOU6MV2h2UpVJ3PiKnujGHxvuym60/xiiTc7PC
X-Gm-Message-State: AOJu0YzTZIWVk74JMHiURRAehjimKB2xJdzIXAIKedWKoWFhuuN83ZTD
 NYsrQklJt6B8CY4VUxMmJA4Yt+ASru76d6UGc6MZetfFSoKwcH1kRrPZryQG8A09L7mqy1KCr5W
 KlLXLTzuOsojbbgFCTToH5B1Lv5o=
X-Google-Smtp-Source: AGHT+IGIujU5BUmectRaXmqxV7kvHeg9YagD7Xq3hkgu9fb0INf/OlW+SsbFPBQWXRkrAlltMQY/ZujPn5Cf9ImCObg=
X-Received: by 2002:a05:6402:4301:b0:5a3:27bd:e264 with SMTP id
 4fb4d7f45d1cf-5b0204e024bmr14456021a12.9.1722441925094; Wed, 31 Jul 2024
 09:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
In-Reply-To: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 31 Jul 2024 09:05:12 -0700
Message-ID: <CAF6AEGtr70TqFRDS3U9fEJ_vWHC53BC9G4tqgSJbsCD1H92qFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm: Further expose UBWC tiling parameters
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Wed, Jul 3, 2024 at 3:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> After testing, there are more parameters that we're programming which
> affect how UBWC tiles are laid out in memory and therefore affect
> the Mesa implementation of VK_EXT_host_image_copy [1], which includes a
> CPU implementation of tiling and detiling images. In particular we have:
>
> 1. ubwc_mode, which is used to enable level 1 bank swizzling to go back
>    to UBWC 1.0 when the implementation supports UBWC 2.0. a610 sets
>    this.
> 2. macrotile_mode, which we previously left as default but according to
>    downstream we shouldn't for a680.
> 3. level2_swizzling_dis, which according to downstream has to be set
>    differently for a663.
>
> I want as much as possible to avoid problems from people trying to
> upstream Mesa/kernel support not knowing what they're doing and blindly
> copying things, so let's make this very explicit that you must set the
> correct parameters in the kernel and then make sure that Mesa always
> gets the right parameters from the "source of truth" in the kernel by
> adding two new UAPI parameters. The Mesa MR has already been updated to
> use this if available.
>
> A secondary goal is to make the adreno settings look more like the MDSS
> settings, by combining ubwc_mode and level2_swizzling_dis into a single
> ubwc_swizzle parameter that matches the MDSS one. This will help with
> creating a single source of truth for all drivers later. The UAPI also
> matches this, and it makes the Mesa tiling and detiling implementation
> simpler/more straightforward.
>
> For more information on what all these parameters mean, see the comments
> I've added in the first commit and the giant comment in
> src/freedreno/fdl/fd6_tiled_memcpy.c I've added in [1].
>
> Testing of the Mesa MR both with and without this series is appreciated,
> there are many different SoCs out there with different UBWC
> configurations and I cannot test them all.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

for the series,

Reviewed-by: Rob Clark <robdclark@gmail.com>

But could you resend with updated a6xx.xml now that the perf cntrs
have been corrected (to avoid further churn later)

BR,
-R

> ---
> Changes in v2:
> - Move ubwc_config field descriptions to kerneldoc comments on the struct
> - Link to v1: https://lore.kernel.org/r/20240702-msm-tiling-config-v1-0-a=
daa6a6e4523@gmail.com
>
> ---
> Connor Abbott (3):
>       drm/msm: Update a6xx register XML
>       drm/msm: Expand UBWC config setting
>       drm/msm: Expose expanded UBWC config uapi
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   34 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   32 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1617 +++++++++++++++++++=
+++++-
>  include/uapi/drm/msm_drm.h                    |    2 +
>  6 files changed, 1664 insertions(+), 31 deletions(-)
> ---
> base-commit: 269b88cb92e62e52718cd44c07b7517265193157
> change-id: 20240701-msm-tiling-config-c5f222f5db1c
>
> Best regards,
> --
> Connor Abbott <cwabbott0@gmail.com>
>
