Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F38A7A7EE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 18:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B6010E289;
	Thu,  3 Apr 2025 16:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AlRIBuJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C25710E289
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 16:26:21 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6ef60e500d7so10316937b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1743697580; x=1744302380;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gm8Etobzk8cCk6jshrfzA7BBUoXgq8Cf4UsElyUuFB0=;
 b=AlRIBuJ2OcpBH6g20+TAYp60LHGh6koI0bYDn5HCZLsxrMANGGWUfq+u+kq7XMA8J/
 IU8Q/ruYYfPvAWpbKiIHcmAlAoIM4Xv1DPbgfF8N1Xy2s7WYIOR1PrnwO/Ee1GmBhIwQ
 8SSdLoRAgtfk84xG6Ir59Hx0cHBszg4tZskfyf/kEC1epbuZF5fCLbJ7n991abTVuFlz
 JIwTOETqR3UAGCLE15q1RQikxu4tCBVzPuz7yt/mNdx41O8SyGJFwphE+74/hqLi31W3
 ufSZgEpkelRpJz07hZIHV37cWI//Ed/p7E64u0DGm6CsSY5r+ZBM8gbyq53VjUKvKcW5
 K18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743697580; x=1744302380;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gm8Etobzk8cCk6jshrfzA7BBUoXgq8Cf4UsElyUuFB0=;
 b=js3LAD6pXpdJ4W1z4gTVMD/Sf9lNKwE1bjFGVYYqIfr8nqqLDDHznhbgLgaojb7wt8
 SG3REQx8bOFYzmymVFLJJYrN+tIXZ7eQ1lAz4HBf40/IyM6nheoWUek30P+JTi28zopt
 mu6yC0bQqk+PklPbZI9ywKW7HacxHavFIKF8bGPPMpS/abNSHOqkYTUEXmZ0EPu08kr6
 +DQtzpeMcxqDJFN78Sufhoeqr+mu02N2f65mbOuhwFxvO9ZA1O7mJYW7Y0lMwmp6mCYm
 WgB3BGSZ0uzAbOvaCUs0iTtRN7P0SBPmsTVe6opUE7GPehl46E5AP0jgfURHyHGJFWy+
 LGdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/UQxKgJajIPOQbwYDfdbS3ckDpYd+P62orF6deAMLjt1tUvXfd1wfh/oAepsQKurtI3kppG5nTfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2MDTZgl+MBSncaluus4pTd9V8gJX+N2ZivCGLIpuy0vtLsaXi
 IKRR4Tm7YUSLVCiN4+lNesOmQoP2SWuU5Xthbw705x7gQxLh61L+sylB2JBmHjHHkXNtLnaCnEs
 ndJRaG/2PQUB0R0sKltSJzLjzTEBxqwCnWRsqkA==
X-Gm-Gg: ASbGncsGcmLdjDsRjv++s0iPZP4rkAx+syalRxcZ8lJEsc88n23eYgMnTZ/Mpudqhz5
 qS+nSPVRzH3ehwTxJWmMve1Jf5QmaaAMuQGrgwRXbcvQRj9Fgf9OUrgD6ONOn1W7wjfCamfEm7M
 yVqOeOB9/XHz3B60yMv+EjETUdFTbsTDht+LPHWyaxvJ2e8oInDv2QJLCOz0GOZnUk2S36
X-Google-Smtp-Source: AGHT+IGs/lOpJlBNxZfkClJkSSGiTQDpBO7ne5t+K8sFSvFVEpfHXiFzI6JjuxfYULF42IuuaAUSHa6+5r5ZRFQKL/0=
X-Received: by 2002:a05:690c:a8b:b0:6fd:4849:62da with SMTP id
 00721157ae682-703e1581140mr850257b3.22.1743697580267; Thu, 03 Apr 2025
 09:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
In-Reply-To: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Apr 2025 16:25:55 +0000
X-Gm-Features: AQ5f1JpvJpXj_gh69LgHu7W2pAa3-WCUx4V9ie5tB7F6PHPJUleIgDiNR0yj7Fo
Message-ID: <CAPY8ntCCvXObQ_7GNwjqNMB-=1ucy9WsipvptgvPxk3p2R3Ryg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vc4: release firmware on error paths in
 vc4_hvs_bind()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 3 Apr 2025 at 13:14, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> There was a bug where we should have called rpi_firmware_put(firmware)
> if devm_clk_get() failed.  Really, it's better and more readable to
> move all the firmware code together so that we can release it one
> time.
>
> Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the respin

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> v2: Use a cleaner solution
>
>  drivers/gpu/drm/vc4/vc4_hvs.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4811d794001f..06aedd906d74 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -1675,6 +1675,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 if (!firmware)
>                         return -EPROBE_DEFER;
>
> +               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> +                                                        RPI_FIRMWARE_CORE_CLK_ID);
> +               rpi_firmware_put(firmware);
> +               if (max_rate >= 550000000)
> +                       hvs->vc5_hdmi_enable_hdmi_20 = true;
> +
> +               if (max_rate >= 600000000)
> +                       hvs->vc5_hdmi_enable_4096by2160 = true;
> +
> +               hvs->max_core_rate = max_rate;
> +
>                 hvs->core_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
>                 if (IS_ERR(hvs->core_clk)) {
> @@ -1689,17 +1700,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                         return PTR_ERR(hvs->disp_clk);
>                 }
>
> -               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> -                                                        RPI_FIRMWARE_CORE_CLK_ID);
> -               rpi_firmware_put(firmware);
> -               if (max_rate >= 550000000)
> -                       hvs->vc5_hdmi_enable_hdmi_20 = true;
> -
> -               if (max_rate >= 600000000)
> -                       hvs->vc5_hdmi_enable_4096by2160 = true;
> -
> -               hvs->max_core_rate = max_rate;
> -
>                 ret = clk_prepare_enable(hvs->core_clk);
>                 if (ret) {
>                         dev_err(&pdev->dev, "Couldn't enable the core clock\n");
> --
> 2.47.2
>
