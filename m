Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BD269921
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FCB6E7E5;
	Mon, 14 Sep 2020 22:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE8E6E7E5;
 Mon, 14 Sep 2020 22:44:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z25so1913384iol.10;
 Mon, 14 Sep 2020 15:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ylUrEEmYi1EaiuhHEqxtgMvlCDH6vw+JSMpMqyXXaxw=;
 b=Cxa2SR5VxP3TPO8X/VSYLErIJEhPli89qNxarIN+zBVBHzqGwyuAWb4X5QJ6rHJ2Cz
 ISfZ81Zr690bxVUl//IF9JS70ln9RVJNGClN3BvH2Y20L+VAP4Loi8FZmdktMdRUjxmz
 Y/LtaL53T7FOQllW47LRHpL8uJTZprjI9HsI36rw4wjUW4gbyRN7VjdIbti1bVszoBqx
 xaKsdgLzPO4xmVTu/mHsGEIc1wzgpE1kCu6NDoQXSgDipcMQqQ6hZi5mHUz3OiyVvDhH
 2ihWAW5v/C2FDGkZQhQORQNnjQ8J62KdyQgFj91UgloDWjW/vse6vkn2Wid2hz8lJnmX
 Akqg==
X-Gm-Message-State: AOAM533uc+xc0CkCRCDzanFPmiXdsZ9H+kzSIWWwh285nqrLu4HvofYU
 SJEfWNQZYB3uPA0evl6xfA==
X-Google-Smtp-Source: ABdhPJy0EiT7MplPn0+3By2fzZNnP/u2zfQZ44vJh5JI0TZD6SDZoEgp/wP3JFumGKjEqcEvAf3tFA==
X-Received: by 2002:a02:11c2:: with SMTP id 185mr14783901jaf.35.1600123451958; 
 Mon, 14 Sep 2020 15:44:11 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w15sm7629263ilq.46.2020.09.14.15.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:44:11 -0700 (PDT)
Received: (nullmailer pid 404103 invoked by uid 1000);
 Mon, 14 Sep 2020 22:44:07 -0000
Date: Mon, 14 Sep 2020 16:44:07 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 06/13] dt-bindings: mfd: rohm,bd71837-pmic: Add common
 properties
Message-ID: <20200914224407.GA388924@bogus>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-7-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, etnaviv@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 04, 2020 at 04:53:05PM +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (clock-names,
> clock-output-names) to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml:
>     pmic@4b: 'clock-names', 'clock-output-names', do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/mfd/rohm,bd71837-pmic.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml
> index 65018a019e1d..ecce0d5e3a95 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml
> @@ -32,9 +32,15 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  clock-names:
> +    maxItems: 1

Needs to define what the name is.

> +
>    "#clock-cells":
>      const: 0
>  
> +  clock-output-names:
> +    maxItems: 1

Ideally this one too, but we've been more flexible on it.

> +
>  # The BD718x7 supports two different HW states as reset target states. States
>  # are called as SNVS and READY. At READY state all the PMIC power outputs go
>  # down and OTP is reload. At the SNVS state all other logic and external
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
