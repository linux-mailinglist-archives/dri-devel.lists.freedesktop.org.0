Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EA75500B7
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1663610EEAE;
	Fri, 17 Jun 2022 23:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544F010E062
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:25:30 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id b138so5953669iof.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9t+RTHlMGnTIMzkuniBS/cRBo0RFDQfHVRvCE6rQ+lk=;
 b=CJCnhwXGd63OtqI6RFKGkj2pjzhgY3kvDLwizTntr6dV3Xl9NtbykFm6BIHYoF/ca4
 iyKclmo2Et0fvsjkAgB5SX+8pK1STh/qEwmJfSZJt8gPhMP5qITQxh055KytdKPzWAEa
 XuNfWjFwnt8ynMWbxVssLTZg100zfYuhssDxYW0H2L9xygh3/LchGtviQOeZaIH9GvG9
 JKySOXXtQpXmY9pU40QwVWTWKMp+TukSQkrJ9gwmV/WLn90mS5kcHR5fzUvaXUuquwyw
 fDirAmIbNoOb5iQZ2ADfB54P0XaTNZfeROusjp7ZiMXMvB68aAdKepO6/L3IOxPP/JMz
 x66g==
X-Gm-Message-State: AJIora+OAq+BQkwYAb0tbsqofVKqLTLUFA1uO1t2kqMyPCGmy4LtCk1+
 wlzUXFmvb9mW1YNHy84z+Q==
X-Google-Smtp-Source: AGRyM1vv8dGfZ8d6eH4xBrD0ZZY9f3vkhZfNHWKMYkfzEMy6bJj+y3ZJxm4fbfo0jwgLRRJDIs3GWg==
X-Received: by 2002:a05:6638:481c:b0:336:2f15:70fc with SMTP id
 cp28-20020a056638481c00b003362f1570fcmr3976515jab.163.1655508329524; 
 Fri, 17 Jun 2022 16:25:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a6bbe02000000b00669de60a268sm3128595iof.21.2022.06.17.16.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:25:29 -0700 (PDT)
Received: (nullmailer pid 2632617 invoked by uid 1000);
 Fri, 17 Jun 2022 23:25:28 -0000
Date: Fri, 17 Jun 2022 17:25:28 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH] dt-bindings: display: delete ilitek,ili9341.txt
Message-ID: <20220617232528.GA2628998-robh@kernel.org>
References: <20220617213706.376730-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617213706.376730-1-mail@conchuod.ie>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 10:37:07PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> ilitek,ili9341.txt was replaced by ilitek,ili9341.yaml but the txt

panel/ilitek,ili9341.yaml


> binding was not deleted. Do so.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/display/ilitek,ili9341.txt       | 27 -------------------
>  1 file changed, 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> deleted file mode 100644
> index 169b32e4ee4e..000000000000
> --- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Ilitek ILI9341 display panels
> -
> -This binding is for display panels using an Ilitek ILI9341 controller in SPI
> -mode.
> -
> -Required properties:
> -- compatible:	"adafruit,yx240qv29", "ilitek,ili9341"

"adafruit,yx240qv29" is not in the schema.

> -- dc-gpios:	D/C pin
> -- reset-gpios:	Reset pin

Neither is this. It is in panel-common.yaml, but 'unevaluatedProperties' 
needs to be used instead to allow it. Or add 'reset-gpios: true'.

> -
> -The node for this driver must be a child node of a SPI controller, hence
> -all mandatory properties described in ../spi/spi-bus.txt must be specified.
> -
> -Optional properties:
> -- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> -- backlight:	phandle of the backlight device attached to the panel
> -
> -Example:
> -	display@0{
> -		compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> -		reg = <0>;
> -		spi-max-frequency = <32000000>;
> -		dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
> -		rotation = <270>;
> -		backlight = <&backlight>;
> -	};
> -- 
> 2.36.1
> 
> 
