Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EEF493E06
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BF310E32A;
	Wed, 19 Jan 2022 16:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF9210E2FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:11:37 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 f4-20020a4ac484000000b002e3e221d769so878710ooq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qeGs2znfOYUJDV20djJhQbgb6BR7nof7Sr6XBdv7Rks=;
 b=0cZ9qPpaRl+8wsjoQYIN1eU4BEiuGsxgkmd5sS5BG73WXPU3XyQ+WzLzE6VFk3ZpSE
 JzraBMzbdCtQtmPiCaRaP1dZP6UNVfotNg9RVeHztmJqSO/U/Rqg9+g7biOU/jnbFCQF
 xBLMt4NUoJJickmU0DngjzwppSXTINIbRmJGQVCrhg+Bl1rI2eJqRmfulPfrMqT+E1cC
 huHMEjiuhPnSVc5g6EpIWAGO2CmtpRJPtWzppjCyaRu3+7jhPfcogBNjoH4FzA6Dmfg3
 Fj0jIHrEP9X1IgapdDzvM59E7l4GKDa1hY0jO85meotTVgCVPzMC9+hPl8L4Q4w5fIsB
 Frow==
X-Gm-Message-State: AOAM5319JD/EcNl5CO0Wjfpd9AhQANNMh/7+t3ALMDXmO8jLL0d6xTV2
 Fd5qyNzrbEO/zdOwp3/jOp7H5B79Cw==
X-Google-Smtp-Source: ABdhPJzI0d/xiZlJQGmn9s9YeQRGKDW0dZ/Xm2jNe7Av5k8UsWH1q5GQDLviqTYIHwryxVeRqKq4Ow==
X-Received: by 2002:a4a:d116:: with SMTP id k22mr18660045oor.80.1642608696519; 
 Wed, 19 Jan 2022 08:11:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q15sm137490oiv.6.2022.01.19.08.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 08:11:35 -0800 (PST)
Received: (nullmailer pid 3681612 invoked by uid 1000);
 Wed, 19 Jan 2022 16:11:34 -0000
Date: Wed, 19 Jan 2022 10:11:34 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add SPI peripheral schema to SPI
 based displays
Message-ID: <Yeg4NoFqgPIhbZov@robh.at.kernel.org>
References: <20211221125209.1195932-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221125209.1195932-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonathan Bakker <xc-racer2@live.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Dec 2021 08:52:09 -0400, Rob Herring wrote:
> With 'unevaluatedProperties' support enabled, several SPI based display
> binding examples have warnings:
> 
> Documentation/devicetree/bindings/display/panel/samsung,ld9040.example.dt.yaml: lcd@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-3wire' were unexpected)
> Documentation/devicetree/bindings/display/panel/ilitek,ili9322.example.dt.yaml: display@0: Unevaluated properties are not allowed ('reg' was unexpected)
> Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.example.dt.yaml: display@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> Documentation/devicetree/bindings/display/panel/abt,y030xx067a.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> Documentation/devicetree/bindings/display/panel/sony,acx565akm.example.dt.yaml: panel@2: Unevaluated properties are not allowed ('spi-max-frequency', 'reg' were unexpected)
> Documentation/devicetree/bindings/display/panel/tpo,td.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('reg', 'spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> Documentation/devicetree/bindings/display/panel/innolux,ej030na.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('spi-max-frequency', 'spi-cpol', 'spi-cpha' were unexpected)
> 
> Fix all of these by adding a reference to spi-peripheral-props.yaml.
> With this, the description that the binding must follow
> spi-controller.yaml is both a bit out of date and redundant, so remove
> it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This is dependent on spi-peripheral-props.yaml landing in 5.17-rc1.
> ---
>  .../devicetree/bindings/display/panel/abt,y030xx067a.yaml  | 5 +----
>  .../devicetree/bindings/display/panel/ilitek,ili9322.yaml  | 4 +---
>  .../devicetree/bindings/display/panel/innolux,ej030na.yaml | 5 +----
>  .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml   | 5 +----
>  .../bindings/display/panel/lgphilips,lb035q02.yaml         | 5 +----
>  .../devicetree/bindings/display/panel/samsung,ld9040.yaml  | 7 +------
>  .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml | 1 +
>  .../bindings/display/panel/sitronix,st7789v.yaml           | 5 +----
>  .../devicetree/bindings/display/panel/sony,acx565akm.yaml  | 5 +----
>  .../devicetree/bindings/display/panel/tpo,td.yaml          | 5 +----
>  10 files changed, 10 insertions(+), 37 deletions(-)
> 

Applied, thanks!
