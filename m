Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3685E6FE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 20:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079610E16F;
	Wed, 21 Feb 2024 19:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YW4lAoCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB07B10E082;
 Wed, 21 Feb 2024 19:12:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4126f486429so16143435e9.0; 
 Wed, 21 Feb 2024 11:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708542757; x=1709147557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdMTQBKI2yKY2jABhK10F1qxiB1GKnnPjOlYF9Y2al4=;
 b=YW4lAoCQ+dsZkCrRMM8dEoycny6ZUyHrfPL6X9nkfoSx02detVHd9xY/VRAFkV+2yf
 Dgn244tXB/jzaQmO5iRaY9g2Q3t0AyKHJqGhaUTVdwEikWCuUvz/8OnUxrqJFrWPLBje
 J5d8CGuqCye6nwquZC5p9EaEPbFm5Iwlenfs9V8tPjmkxfqJ8BvUUK3YxOK57uR7XvCw
 FkxfFuIASkd388pLItPOvUZjsk2DFe9AU6An//wR5GsD7BPDhbzFXhX5saGeQjpdQzmV
 nZ7zYLUkrVGFQHph+3l5j7rEjmsSEED86yO21l2i5Ofu34U1FAWSSs7VNVnPE8ySlpPa
 piRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708542757; x=1709147557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fdMTQBKI2yKY2jABhK10F1qxiB1GKnnPjOlYF9Y2al4=;
 b=nRtl4lNXLqCt1UzCWmGGJon6f2Xzj3+66HiSFVkibJlfRX25Z6b1lHafoSG09k45CV
 2ZhPDsbt91FKmt43ifji6fJtKYxTk8SR+fTZMjNHiEGfrp/TYs0ejQuxk1UQaqHDB/8/
 P96lm3LngEiPIEXvYqu9SxxgWeIrVYFa2HOJEZd+h3G4UREopk0EZjiSGq9ERf32Cneo
 MyH/lv1kR3dAHKZeR/vBIzhd0IDy1jSTDMMN6kepNb/SyNZGgNjPnp1Jyydpdbc8qmN0
 kM7m5O5V4oPBJRJ/8kDpzB8hQZD149/9iDKwWo6AhNvQbG/3iK4cF57wzhA7epdhgSwk
 oIpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIpUGqOaPXTBBsBY/LDn7mlvQRMUJNIFiovQSn25Mlp+KDbv/OdlatpYuB3wUSdaji6pb7IWDjZBHT1h3H4iDOiRF4X4nc7NcsxbZZbFtpPt2G2GMzqPHBgtZ0kE9JxZYPnhuCiOx0qaS5aX1eDeeG
X-Gm-Message-State: AOJu0YwHtR70KEq/RRRGDD9sdkrD0Xqzxko7BfanPxNi+YXdcPkkK6NG
 YMHTA/e6tRFxQrwAOV1BUoWTl8skL323e4ecFgBG6hzjv2bVNzNCavbrNg8g5F+EqhDJC8hEdhj
 k8Jf5HcMIHVZ1jsStMhNes69/Xww=
X-Google-Smtp-Source: AGHT+IGD7ehTmv5eFbRAQGIiNkkDuDo7MnHWuKvd9ELBymc/9wxgFnsfKcZhnfnKyI5cHiG44phK22cbnVo2wRf+Nv0=
X-Received: by 2002:a05:600c:3788:b0:410:c148:2a4b with SMTP id
 o8-20020a05600c378800b00410c1482a4bmr15875081wmr.37.1708542756436; Wed, 21
 Feb 2024 11:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20240220-fd-sc7180-explicit-ubwc-v1-1-611a58091724@linaro.org>
In-Reply-To: <20240220-fd-sc7180-explicit-ubwc-v1-1-611a58091724@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 21 Feb 2024 19:12:25 +0000
Message-ID: <CACu1E7Gi_-a4u_B7NmKAX70OgWwVBe1CMpSSGKwdUtAS1v5hdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: specify UBWC config for sc7180
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Leonard Lausen <leonard@lausen.nl>
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

On Tue, Feb 20, 2024 at 5:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Historically the Adreno driver has not been updating memory
> configuration registers on a618 (SC7180 platform) implying that the
> default configuration is fine. After the rework performed in the commit
> 8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
> a6xx_calc_ubwc_config() still contained this shortcut and did not
> calculate UBWC configuration. However the function which now actually
> updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
> check.
>
> Rather than adding the check to a6xx_set_ubwc_config(), fill in the
> UBWC config for a618 (based on readings from SC7180).
>
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
> Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
> Cc: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

Reviewed-by: Connor Abbott <cwabbott0@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c9c55e2ea584..dc80e5940f51 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1292,9 +1292,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>                 gpu->ubwc_config.ubwc_mode =3D 1;
>         }
>
> -       /* a618 is using the hw default values */
>         if (adreno_is_a618(gpu))
> -               return;
> +               gpu->ubwc_config.highest_bank_bit =3D 14;
>
>         if (adreno_is_a619_holi(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 13;
>
> ---
> base-commit: 41c177cf354126a22443b5c80cec9fdd313e67e1
> change-id: 20240220-fd-sc7180-explicit-ubwc-40953fa55947
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
