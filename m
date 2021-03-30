Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FF734F489
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9219F6E989;
	Tue, 30 Mar 2021 22:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38C6E98A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 22:47:16 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so17151189otr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 15:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xp8v9tK7FMchdLUHp1qm1McxtDpjxe0iZcKoBEQvIVY=;
 b=g3FwW/gZn8WgYRPnNb8u1EsZw+eQ0H88cJ9Ii9zRqnh+qFCQBG60PXnX6P3XpNAw2I
 dvN7dTMW9E/oD7/gKsMe22SWdecadDt7lCoFNif4VakB6Ho56HdT65bN8S3qmS4acJOa
 Gwxu3tXKDEtl8qxZUMcIkNAgWNjqU7bwRiCrcEPmmdh+pDwhZXtiH2DFtI3c4cQY86rn
 V9ZxemGB7Soq01HRqc7wJsy7M5zvjiruEocTZxgd7yLTI2mqsz92XfOEKGQpCKhRdoDL
 cWiykrBdzxDHXnjgUGr6pMJRxQMsXTLOlq7grgItZfWv188yvmgF2moEXDNDdXalUT1m
 GhJg==
X-Gm-Message-State: AOAM532lANT51GfdEm58zWfQ7d7RcVnWeF9D4dt6ICJ54IHRtK+2WlHF
 uaXhBe/3xcafNBMo2yr0oA==
X-Google-Smtp-Source: ABdhPJxjAU/vi+mBlEkENwxqdbFJasSATHF82kYB09FqeGnTnIZ7Xiy0yMcX3ws6gDh3GuILSRc0jg==
X-Received: by 2002:a05:6830:34a2:: with SMTP id
 c34mr175590otu.52.1617144435348; 
 Tue, 30 Mar 2021 15:47:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n17sm89326oic.8.2021.03.30.15.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:47:14 -0700 (PDT)
Received: (nullmailer pid 852948 invoked by uid 1000);
 Tue, 30 Mar 2021 22:47:13 -0000
Date: Tue, 30 Mar 2021 17:47:13 -0500
From: Rob Herring <robh@kernel.org>
To: Yunus Bas <y.bas@phytec.de>
Subject: Re: [PATCH 1/2] drm/panel: simple: Add support for EDT ETMV570G2DHU
 panel
Message-ID: <20210330224713.GA852261@robh.at.kernel.org>
References: <20210330070907.11587-1-y.bas@phytec.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330070907.11587-1-y.bas@phytec.de>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 09:09:06AM +0200, Yunus Bas wrote:
> From: Stefan Riedmueller <s.riedmueller@phytec.de>
> 
> This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
> to DRM simple panel driver.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Signed-off-by: Yunus Bas <y.bas@phytec.de>
> ---
>  .../bindings/display/panel/panel-simple.yaml  |  3 ++

Bindings should be their own patch.

>  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 62b0d54d87b7..57be1fa39728 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -114,6 +114,9 @@ properties:
>        - edt,etm043080dh6gp
>          # Emerging Display Technology Corp. 480x272 TFT Display
>        - edt,etm0430g0dh6
> +        # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
> +        # capacitive touch
> +      - edt,etmv570g2dhu
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>          # Same as ETM0700G0DH6 but with inverted pixel clock.
>        - edt,etm070080bdh6
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..283c17a75376 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1926,6 +1926,32 @@ static const struct panel_desc edt_et057090dhu = {
>  	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  };
>  
> +static const struct drm_display_mode edt_etmv570g2dhu_mode = {
> +	.clock = 25175,
> +	.hdisplay = 640,
> +	.hsync_start = 640,
> +	.hsync_end = 640 + 16,
> +	.htotal = 640 + 16 + 30 + 114,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 10,
> +	.vsync_end = 480 + 10 + 3,
> +	.vtotal = 480 + 10 + 3 + 35,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc edt_etmv570g2dhu = {
> +	.modes = &edt_etmv570g2dhu_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 115,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct drm_display_mode edt_etm0700g0dh6_mode = {
>  	.clock = 33260,
>  	.hdisplay = 800,
> @@ -4226,6 +4252,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "edt,et057090dhu",
>  		.data = &edt_et057090dhu,
> +	}, {
> +		.compatible = "edt,etmv570g2dhu",
> +		.data = &edt_etmv570g2dhu,
>  	}, {
>  		.compatible = "edt,et070080dh6",
>  		.data = &edt_etm0700g0dh6,
> -- 
> 2.30.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
