Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC61B1A4F8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAD510E57F;
	Mon,  4 Aug 2025 14:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dhmqjOn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41E310E573;
 Mon,  4 Aug 2025 14:32:54 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b34dde96cbfso694170a12.2; 
 Mon, 04 Aug 2025 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754317974; x=1754922774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3VwQYHiITIJoPNIH3t9+T75Uq05OHfjWXaf+GOec9BM=;
 b=dhmqjOn6N+wpXgKXIDSQXH3prMo+RD8d5zUMZwvSf2wugcycWeJHlLLNiRicCalDjt
 HcaUpKuHDj22j2kCIG4kZ4P9jNG1pKC1sxzxUOG51R3c0NAqWYa6L50kiY4ATMg3v3RK
 /UDoHf2tLcfSOjL384EfPgnWREUGZLnieY1zSPxBmgpUijjWoFWH4rlaiYFrm9s1Zzwz
 3tbFXEOIRJVdr/fLYTfwG2ibwf4q5m34JjG7NyzlOjx+WbAvt3Ne046Ti+esl30k6E2u
 rzDYYMcuWlFtOybFbPveRpZrUksub7kLPu3doDywrI17bNw+a2JXelMeERsPNcoqlqu8
 z0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754317974; x=1754922774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3VwQYHiITIJoPNIH3t9+T75Uq05OHfjWXaf+GOec9BM=;
 b=QzRlP4aARQ5MUlrC9FrlDdpacPMHBKdjPs14hqo0+4tKxW84MTQ2/vn3750Fy2Z432
 cS913/iXm+d3BWPzxnw5bricIQfWnfgx8WWULNNW5aXQC6ZcI8YuWyYlrY8XlMaudgKQ
 Ua1gX5n4NGbve61AsNlyJM3OBHkErhKrvRrR9pMLzbFB9QOSWXGun7K/WaCVv8eCAmaG
 nCjeucyOKvGVSGyzvOLt2Ew+fYxCc7BynDGFGrk7VvhapAYLY6eljFJmiOodfujXxiiR
 hT2qhqPgIK0U5jP4bSiGpTDTE/2GVl5r0YqZ1wRxekpKvhM9JVHKoR1s+5HWwNIytkyT
 qStQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9lTuzxZdweoA72VuR2Hs1KWEgHSodoJOeoELMAPvWTmR6XzvE4G6j17Yii9Afc02sHVXwEhdg@lists.freedesktop.org,
 AJvYcCW4pEM6iYFJonvBz4XXwmJdA8oEpe3FM4eiMmtz2OJQ9YETB++kylkKOQHP17+643RLmx8dzIv4MFeR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRS+xev0ltF1CTgWuLzCfL0IdySLK4Ku8mXCs8lI23mvvWajFi
 w5iP+aUhqLFsBtVHzjJf7BNwkCw0mJ201AHtfQa2B4qRkvYypdU/jsFpGMaAecq2QIpfdVpCVAk
 CoRYXo1S+43eGOU4jvhdlNvgVgc/LSvk=
X-Gm-Gg: ASbGncvhN0uxOO1XVYuM97MXeo1z/V9OF8o42lTTjUj18nRxJeJ13WIToASbPSYBYFD
 t3EwVeOzfxSJ5ekucohjeB1J3NYxiyWnsHbOyjpMBp25X/WdUzWH0I3AUFcG8h+ZLHKXZWMHpxI
 FMcyrRfpejVHuSSs/3YSEDPkIt/Kw/+foqdzKENyR9s5S248YeCA1NCkqL/PQvaaBIwd71pgnvR
 8DJ03QC
X-Google-Smtp-Source: AGHT+IFU8SQn+t9P5YQiglKfiFVWoRrg0f+OYP5ZENWD+GqnAinpFBixGqrr/sdqrwCYurLyvZoUZ/+IOIbC+g9fHlg=
X-Received: by 2002:a05:6a20:7289:b0:240:1a3a:d7d4 with SMTP id
 adf61e73a8af0-2401a3adbd2mr720316637.2.1754317974392; Mon, 04 Aug 2025
 07:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
In-Reply-To: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Aug 2025 10:32:43 -0400
X-Gm-Features: Ac12FXw4Ip0lDCJ5FVa-kIabSeRpvVdWcCZBk7u-5qBZ0hGaf7CXjMiAEelQ6SQ
Message-ID: <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Sat, Aug 2, 2025 at 4:22=E2=80=AFAM Ethan Carter Edwards
<ethan@ethancedwards.com> wrote:
>
> The repeated checks on grbm_soft_reset are unnecessary. Remove them.
>

These are not NULL checks and they are necessary.  The code is
checking if any bits are set in that register.  If not, then we can
skip that code as there is nothing to do.

Alex

> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index 7bd506f06eb155de7f2edb2c1c9d5ed7232b16fc..264183ab24ec299425e6a6d05=
39339ee69f60c24 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -7668,19 +7668,17 @@ static int gfx_v10_0_soft_reset(struct amdgpu_ip_=
block *ip_block)
>                 /* Disable MEC parsing/prefetching */
>                 gfx_v10_0_cp_compute_enable(adev, false);
>
> -               if (grbm_soft_reset) {
> -                       tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> -                       tmp |=3D grbm_soft_reset;
> -                       dev_info(adev->dev, "GRBM_SOFT_RESET=3D0x%08X\n",=
 tmp);
> -                       WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> -                       tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> -
> -                       udelay(50);
> -
> -                       tmp &=3D ~grbm_soft_reset;
> -                       WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> -                       tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> -               }
> +               tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> +               tmp |=3D grbm_soft_reset;
> +               dev_info(adev->dev, "GRBM_SOFT_RESET=3D0x%08X\n", tmp);
> +               WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> +               tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> +
> +               udelay(50);
> +
> +               tmp &=3D ~grbm_soft_reset;
> +               WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> +               tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
>
>                 /* Wait a little for things to settle down */
>                 udelay(50);
>
> ---
> base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
> change-id: 20250801-amdgfx10-f96c43cb0c59
>
> Best regards,
> --
> Ethan Carter Edwards <ethan@ethancedwards.com>
>
