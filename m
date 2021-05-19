Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C263891FA
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6736EDE0;
	Wed, 19 May 2021 14:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF006EDE0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:51:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so3476140wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nvJsZjtlKlLIH6fdR/8rxsvo7mslRnhXMBMDcMwpR/k=;
 b=Gf+NBbClaX3c/oHpNH/owQaNKi5li/Aj7dV8g56asHuHG8FuUYgXdJJ0WQkYs7Zuab
 8YBTtfKAXsyXbD1S74Ly5jUECBkhRLs/GEStkBFfgTriUGMItv82pNpCfb695A+PDuwC
 FTCJgQFfa0o4psLOe/ShI0f3WMxXEH+AZnXF2+dR+iDDzhHyTY1lokDpxTmBLZ1G6qYx
 jPiCaW0C9Fua7d3QJ+81N8s2E0ey6cUSj8q84G9YvZgVpcmQ7jUnKPTeCplK2kAYUDhY
 JOhGRDNerL0KmPZzd18OpFLAr9gHJ3y9zgi7DbpTWxmbGbHIdaHtbTD+aRNlOzK/BefW
 VVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nvJsZjtlKlLIH6fdR/8rxsvo7mslRnhXMBMDcMwpR/k=;
 b=dgT+4sA6Au4KQsT/Mzyg5dPrE+ggcuW8stKgLaK7Q84tFCTTAtbhClUMhBrnV2tBar
 kupzjT4UAsH+uI1bIQv3U2ae5LiGgR8qOgqrA62tGY1NFInTG8g0eYTKyw5j6zoZmDUA
 0qNIDi01kzdKTthsiao4k/cal3r59BQ7avkFUD6b5m14Q/jqUJJH1pljTfm27YK+sxaG
 /IYD7Koxl9EXc9au9ZgNUnUV5y9sWigHzvyv/aafz4Eh8Fxz/ey/YZ/SdFEP/00RmrEy
 9aFq5EhKKji6BvqqReRPXMWMOpFR8AO025VvApMyvLHnBArypqjwOTPXQZSvGqJJBYQE
 O2Zg==
X-Gm-Message-State: AOAM531Qh4ARf7QvueRiibsMT/h5j2hHTLfryphpqsp9GDO1Oi1o7MEv
 g5ftDSR7fVAa4vU4KU2C+mO0yQ==
X-Google-Smtp-Source: ABdhPJzw2ZX1L7rkBrbwUJlJD+6pDoXl8RrmUaoL4wF6IzOTk9tjI5t1y2Exc8dabwsaE4wIB0Qnmw==
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr3775449wmj.131.1621435874758; 
 Wed, 19 May 2021 07:51:14 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id t16sm17810288wrb.66.2021.05.19.07.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:51:14 -0700 (PDT)
Date: Wed, 19 May 2021 15:51:12 +0100
From: Lee Jones <lee.jones@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v7 4/4] backlight: rt4831: Adds support for Richtek
 RT4831 backlight
Message-ID: <20210519145112.GG2549456@dell>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
 <1621262161-9972-4-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621262161-9972-4-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-fbdev@vger.kernel.org, cy_huang@richtek.com,
 broonie@kernel.org, dri-devel@lists.freedesktop.org, pavel@ucw.cz,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 May 2021, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds support for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> since v7
> - Fix typo 'common' to 'commonly' in Kconfig description.
> ---
>  drivers/video/backlight/Kconfig            |   8 ++
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/rt4831-backlight.c | 203 +++++++++++++++++++++++++++++
>  3 files changed, 212 insertions(+)
>  create mode 100644 drivers/video/backlight/rt4831-backlight.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
