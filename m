Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246A5BA04A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 19:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98310EB94;
	Thu, 15 Sep 2022 17:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE2610EAD2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 09:26:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bo13so13363275wrb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date;
 bh=oZcHLP4HdtR1v6BTWYj2XPRoK5siEVv1DYPhLj/hidc=;
 b=cONemxuhxWJMQH4WpbMvaGKwDDh4gIAk76NP0g4nDCA3tstm3EL4xD44d2qcxdAlkX
 B39HdGRxDNuZX3ktCsG3whTIwHCK+HlUz3A7uROi/5sg01STJcRS7NwWiW9HqP/zM6P6
 olYkV6nf9ZvDtGDsc2i4ZmpYywGrSic+1yeluNOHvtnzc6Qy7M9jpkK9YLfvSje1d2eQ
 ev29p2u8jfnyuguwbqzagr3E49jWKe2Zz6ymtMueMWiDv5JaI42zbJHDFaRL6X5dFrP/
 +tJFxSJO2DFVaIDhZc+Jn5yyZlHjNkD9uz62A0wNU+tLbwxNPphFaKWZb/KkWkt6BBQS
 B3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
 bh=oZcHLP4HdtR1v6BTWYj2XPRoK5siEVv1DYPhLj/hidc=;
 b=2xmuyVT1U/Kyjr8GZa3xUiRIVZ9cfuteltuyO6dVuDCT+jsGso0UnshMJyi37YpQIM
 skP2Imuz0dZvGcTUXAovuU6IUiiXVgHJcDHIZ5qm7CiShsy+xeCoF+XDYZ2TVoXvNMbW
 X57O21mvm8QqmE8bLBfzIunieg837uE1MrEFuqhOlt6D/+CaFW9Q3UOxgoFbmKW5s8PY
 /rNsPRgYnp2uQhJZMwIBM18QfPLR10wMjHd3XBneAIZ3GkQLmdIcrtHnEYf1QyGl2A54
 xXo5PhN1qXAmtRWDBhpIC4YgKXdPxC9+vYyK0ZyxHWKjYcgAI8gP1g6nAnGfpC08YDgd
 +iFQ==
X-Gm-Message-State: ACrzQf3+Otm5wRVae+dHMArvbzLfQE0ValZEo295sW5/4jm7myEwo1Yi
 i02UgRccLPfPTiHOpwm9mus=
X-Google-Smtp-Source: AMsMyM4Gj6tjcURPzhPJ93mzX9WbNhqvc9BcYOHLmidI51KP9CoUdS3FIJWsT7lf7SvYfg8axnvrtw==
X-Received: by 2002:adf:b1d2:0:b0:22a:d6cd:63cc with SMTP id
 r18-20020adfb1d2000000b0022ad6cd63ccmr782474wra.483.1663234012261; 
 Thu, 15 Sep 2022 02:26:52 -0700 (PDT)
Received: from krzk-bin ([89.101.193.73])
 by smtp.googlemail.com with ESMTPSA id
 bg39-20020a05600c3ca700b003b47b913901sm1875153wmb.1.2022.09.15.02.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 02:26:51 -0700 (PDT)
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
X-Google-Original-From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 15 Sep 2022 10:26:49 +0100
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
References: <cover.1663165552.git.geert+renesas@glider.be>
 <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
X-Mailman-Approved-At: Thu, 15 Sep 2022 17:18:22 +0000
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Sep 2022 16:33:22 +0200, Geert Uytterhoeven wrote:
> Convert the NXP TDA998x HDMI transmitter Device Tree binding
> documentation to json-schema.
> 
> Add missing "#sound-dai-cells" property.
> Add ports hierarchy, as an alternative to port.
> Drop pinctrl properties, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Add maximum to video-ports,
>   - Drop unneeded maxItems for audio-ports,
>   - Complete port descriptions.
> ---
>  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
>  .../bindings/display/bridge/tda998x.txt       |  54 ---------
>  2 files changed, 109 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb
	arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb
	arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb
	arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb

tda19988@70: ports: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/am335x-boneblack.dtb
	arch/arm/boot/dts/am335x-boneblack-wireless.dtb
	arch/arm/boot/dts/am335x-sancloud-bbe.dtb

tda19988@70: ports:port@0: 'reg' is a required property
	arch/arm/boot/dts/am335x-boneblack.dtb
	arch/arm/boot/dts/am335x-boneblack-wireless.dtb
	arch/arm/boot/dts/am335x-sancloud-bbe.dtb

tda9988@70: ports: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/am335x-myirtech-myd.dtb

tda9988@70: ports:port@0: 'reg' is a required property
	arch/arm/boot/dts/am335x-myirtech-myd.dtb
