Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3DEA78D27
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 13:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B0210E0F3;
	Wed,  2 Apr 2025 11:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Rcq3WvBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F8D10E75D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 11:35:21 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6febbd3b75cso60739157b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1743593719; x=1744198519;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s1/KlpYm3UM4GjlGHXNbUdwP3FIBF3TOQzxxk/M8qKo=;
 b=Rcq3WvBz5/mW9yZLNun8DWdBZ8GrT7SfjZPxeL0OhuauBusQN3ZaxO+RB/8kgJZMQh
 bIUjKKy1+BTdUrAaR+vqXJX6xs+gw4R4X06sMfdM+cqEbXNMOI0jP9GxU/AFiWeZznOA
 D349Swu6+lEohG2/UQNaInTUrXBowwF5KoxPq2Vquh2MkSlovpTdygFGEfr8ECMIklRc
 VxHPwTqtw4RjQOY9g9MX2CKzYiZ+9GEMulQqQCc60vFkOgSqD8PErOjaduXvsZG8KGX8
 tu1TVPAYTyVy2RcuycbnfyEGu3e04ZIIopCzeb4dV0eV+fDAnU90WILGAAq4sm86cz2P
 4/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743593719; x=1744198519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1/KlpYm3UM4GjlGHXNbUdwP3FIBF3TOQzxxk/M8qKo=;
 b=eYG4eMDmsmT52BX/T4Bvv8tFPONyfhvh/+W79ICdioAFUtRUPfk3g43ZzhutnIR+eX
 Vz4JOCROhGA5sTfoeVa+rrDj1emiyxgklGIcf5BCfvYR2J9SN6QmYWhSgQfPb38SXvD1
 silL3InmQ08zm9ovoco+kVLksAo/0QMt1U783d+oZvIfMSvxy4KLVvilQ7q5efTcTijQ
 7jp2A16o2UE3KrlqE8/v8zwkVfoKsi/cbwcNu2B3jEz7FVvRdAisqgby4jSoDO2da+Oj
 oglxCTuQXWhHtYisXrFM/Lw0yh2Md52JOWbTU1SYPg2ffnGOVQN3BoHumsGO/a60JQfm
 p44w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgWVFgWctMCmeEkJ3AAHITXLP+JErccuKXzWBe5503tIWtE+/ZoYDFUs/TVZxkCvaEYgpj/1ARoIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAJeZNh2yhldRxZC9KJnZr4w5qsLy42pdqzS4fpr2QbH5HVf3+
 3EoBujA0xKfQsOJsffn5hLI+XO03JcjfK6XgG9HgqH721j0OuOyhSrpYN1Dxz1kUq036GVpafMq
 dNSNF0OjX3EuHpMykJO1l1npTYnfjw2MXQ0tmCg==
X-Gm-Gg: ASbGnctzTKfrTzd92wC8DDYgniGdxZA4aarbUD7RY3naF1otU5U7/zX3Ik5UkDCbrYI
 SxpOPG2ujmK4kteVi3pBOfX6ALAScQi5t+qO/cp+SZAcrlPRpjuwooUBQZtkNp0gJOFouetGcoX
 hZ92BmYd3/bKs5a+8AOcjfunn8Sj1a0gdJyIyg1Roa0Nspr8+b9fLsA6fO7GtW1jgQI5mA
X-Google-Smtp-Source: AGHT+IGr8Yxz3zfQtp5zVjqj96xcJ11TwxaJBj5hp4ypVaFwNYzSnui2oiuDQ1M/uFDaiwTUhmCsnNbBU6oKxM6+wWo=
X-Received: by 2002:a05:690c:4d82:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-702571161cfmr249550377b3.15.1743593719430; Wed, 02 Apr 2025
 04:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
In-Reply-To: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 2 Apr 2025 11:34:58 +0000
X-Gm-Features: AQ5f1JrgSH9_HopXXMS8ZOVaiXusrf2OzR6y0mAxNfEdCRKuLRfnxeiLZ3pZEkA
Message-ID: <CAPY8ntCtAdWg1yN+DgxRe3np4Nu3aDUrrdqe4Q9WeqJMtbrrAg@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: release firmware on error paths in vc4_hvs_bind()
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

Hi Dan

On Wed, 2 Apr 2025 at 12:00, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Call rpi_firmware_put() on these two error paths before returning.

Ack that there is an issue here, but it seems easier to me to move the block

        max_rate = rpi_firmware_clk_get_max_rate(firmware,
                             RPI_FIRMWARE_CORE_CLK_ID);
        rpi_firmware_put(firmware);
        if (max_rate >= 550000000)
            hvs->vc5_hdmi_enable_hdmi_20 = true;

        if (max_rate >= 600000000)
            hvs->vc5_hdmi_enable_4096by2160 = true;

        hvs->max_core_rate = max_rate;

to before we make the devm_clk_get calls. It has no dependencies on
having retrieved the clocks, and hopefully means we don't get the same
type of leaks creeping back in in future.

Thanks
  Dave

> Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4811d794001f..41e9d0aff757 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 hvs->core_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
>                 if (IS_ERR(hvs->core_clk)) {
> +                       rpi_firmware_put(firmware);
>                         dev_err(&pdev->dev, "Couldn't get core clock\n");
>                         return PTR_ERR(hvs->core_clk);
>                 }
> @@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 hvs->disp_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
>                 if (IS_ERR(hvs->disp_clk)) {
> +                       rpi_firmware_put(firmware);
>                         dev_err(&pdev->dev, "Couldn't get disp clock\n");
>                         return PTR_ERR(hvs->disp_clk);
>                 }
> --
> 2.47.2
>
