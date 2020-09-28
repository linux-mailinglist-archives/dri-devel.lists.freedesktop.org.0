Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D527BDC3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296036E44E;
	Tue, 29 Sep 2020 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2FE8986D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 17:14:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c18so2185107wrm.9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAW6dcCoUbddPaYdr5/lbjgYoSVn9vUyYWWh66IQR2M=;
 b=nkFN+z9v1kUNrol7AqK7Z6xx6MoDko4TE7Cw30iHBx68So86SMFHvxbK9rNAYyLh8O
 kJomHCfJB+poR3gVVUrh7734yNNn0CCyVz2lwjDs7LVEoYYFIpH0xHXz0moihZ2JcOQ1
 uacch0SprOmJexYeiwRvnwkhF2iEnvEWLeUdzbGpTH8wbfBzCT75o9+WyEP07HT5bXsA
 Y5M5XGLcKMIOcnWaX+0e5Mfx00oZZpVMok6cBnqY/UPWM1Gh6Xtz65EGxMygG/Sbg7MI
 hGd8wOBw5MEXXEojX9/J/IiOQYUiisVOwVtlc/nUmfEdqNG0OWcw5pUQHx3vEc7GbAhp
 m6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZAW6dcCoUbddPaYdr5/lbjgYoSVn9vUyYWWh66IQR2M=;
 b=RxY/fCTx2rWMQ6AhdNHzjhhOIjuQC7DJx66jBiSj1/5afqISOGzXZCt9tx64MLKtji
 rjMUNPoJ3X6UZqfXpOncBKJCXvvj2hWH/gX+5TUigSNVAlo5XC0X6tBAdefqteY90BJ0
 lu6vhX/niTJFDgU1Fqj5odmz1d3ouOQPIRVbxT+fCMjukJ52dDBk3iB74AwDG5WxiHbB
 x0+RhJqA8/yP8l4/CVUFt8n4oZcySd9fBg0QD02BqooOkdy9VzoiJeGxDY5XAXQUqDln
 E0dBuP/e2mltj1r2cRVLKv7LkwWM26jeEPQ0CLG5x8RtuQ27QDlCcr3CjD2kZXWb78gB
 d/Jg==
X-Gm-Message-State: AOAM5322hv1iDYNCGIna6U/tYM375HYsTy0HGpCJa6SjiTiTju6GITZD
 wPGk6ewh8/h4vst/PQacA7s=
X-Google-Smtp-Source: ABdhPJxzDWkSo4Db8lLVYiLe3RVkBDu7Qbr3OCQEll/PrffgJ7nvwrBvb7FsZx00rdn33neO2ikp2g==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr2818976wrp.370.1601313261840; 
 Mon, 28 Sep 2020 10:14:21 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id q20sm2010984wmj.5.2020.09.28.10.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 10:14:21 -0700 (PDT)
Date: Mon, 28 Sep 2020 22:14:14 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3 PATCH] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
Message-ID: <20200928221414.5cb079a9@a-VirtualBox>
In-Reply-To: <20200917033009.24799-1-jitao.shi@mediatek.com>
References: <20200917033009.24799-1-jitao.shi@mediatek.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao, 

On Thu, 17 Sep 2020 11:30:09 +0800
Jitao Shi <jitao.shi@mediatek.com> wrote:

> Replace horizontal_backporch_byte with vm->hback_porch * bpp to aovid
> flowing judgement negative number.
> 
> if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
> 	data_phy_cycles * dsi->lanes + delta)
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 54
> ++++++++++++++------------------------ 1 file changed, 19
> insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c index 16fd99dcdacf..ddddf69ebeaf
> 100644 --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -445,6 +445,7 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) u32 horizontal_backporch_byte;
>  	u32 horizontal_frontporch_byte;
>  	u32 dsi_tmp_buf_bpp, data_phy_cycles;
> +	u32 delta;
>  	struct mtk_phy_timing *timing = &dsi->phy_timing;
>  
>  	struct videomode *vm = &dsi->vm;
> @@ -475,42 +476,25 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) data_phy_cycles = timing->lpx + timing->da_hs_prepare +
>  			  timing->da_hs_zero + timing->da_hs_exit +
> 3; 
> -	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> -		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >
> -		    data_phy_cycles * dsi->lanes + 18) {
> -			horizontal_frontporch_byte =
> -				vm->hfront_porch * dsi_tmp_buf_bpp -
> -				(data_phy_cycles * dsi->lanes + 18) *
> -				vm->hfront_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -
> -			horizontal_backporch_byte =
> -				horizontal_backporch_byte -
> -				(data_phy_cycles * dsi->lanes + 18) *
> -				vm->hback_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -		} else {
> -			DRM_WARN("HFP less than d-phy, FPS will
> under 60Hz\n");
> -			horizontal_frontporch_byte =
> vm->hfront_porch *
> -						     dsi_tmp_buf_bpp;
> -		}
> +	delta = (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) ? 18 :
> 12; +
> +	if ((vm->hfront_porch * dsi_tmp_buf_bpp +
> horizontal_backporch_byte) >
> +	    data_phy_cycles * dsi->lanes + delta) {
> +		horizontal_frontporch_byte =
> +			vm->hfront_porch * dsi_tmp_buf_bpp -
> +			(data_phy_cycles * dsi->lanes + delta) *
> +			vm->hfront_porch /
> +			(vm->hfront_porch + vm->hback_porch);
> +
> +		horizontal_backporch_byte =
> +			horizontal_backporch_byte -
> +			(data_phy_cycles * dsi->lanes + delta) *
> +			vm->hback_porch /
> +			(vm->hfront_porch + vm->hback_porch);
>  	} else {
> -		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >
> -		    data_phy_cycles * dsi->lanes + 12) {
> -			horizontal_frontporch_byte =
> -				vm->hfront_porch * dsi_tmp_buf_bpp -
> -				(data_phy_cycles * dsi->lanes + 12) *
> -				vm->hfront_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -			horizontal_backporch_byte =
> horizontal_backporch_byte -
> -				(data_phy_cycles * dsi->lanes + 12) *
> -				vm->hback_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -		} else {
> -			DRM_WARN("HFP less than d-phy, FPS will
> under 60Hz\n");
> -			horizontal_frontporch_byte =
> vm->hfront_porch *
> -						     dsi_tmp_buf_bpp;
> -		}
> +		DRM_WARN("HFP + HBP less than d-phy, FPS will under
> 60Hz\n");
> +		horizontal_frontporch_byte = vm->hfront_porch *
> +					     dsi_tmp_buf_bpp;
>  	}
>  
>  	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);

Can you explain how this patch is relevant to
https://patchwork.kernel.org/patch/11718191/? It was sent out on
17/Sept while the v2 was merged before that. 

As the v2 patch (https://patchwork.kernel.org/patch/11718191/) breaks
HDMI (eDP) on my Chromebook Elm (starting from 5.9-rc6), I'm guessing
that that was a bad patch, and should be reverted? Instead, this v3
should be applied? Is this correct? 

If so, can you kindly send a new patch which reverts v2 and applies
this one, as application of this patch on rc7 fails.

Thanks,
Bilal

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
