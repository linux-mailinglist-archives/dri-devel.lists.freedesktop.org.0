Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7964269E3C0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306F310E82B;
	Tue, 21 Feb 2023 15:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A83F10E82B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:41:27 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 b10-20020a4aba0a000000b005200c0d4a2aso550965oop.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 07:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAmFGspOZMSPZfnaoWYmVR2MjZajqXp66cfwHSIQL14=;
 b=MRe0Uoz6yp4clNqs/JKZO30h9Cml/DltB0Hj99ESNp/UxvngfBwYwDAxjf4G+MdEdW
 Qir8BINgEpo8D7IfLdJdvFZRGnns3AEfj/5SOnlI8N0qtbTliVyrfPsg5NlhQ5YcPXgB
 1KiGk1c2upbQFzRI8WGq6Ke34mE5JWIoSdbRe/jYlNXKI5cz2FgV7XYaiBUmfQjMbj/9
 2GZbDAobUbnISQQr8Z9swokU24hmZL2zUJKM0bC483Da2FSeIvtpO3murXpq7sC2ttlK
 9HRThMRFmthRQHqcEPu89p/iu1BMPhvgqRsNg66RgbB+551jUoFq7mcRNsOONrz2Fu5K
 1x6w==
X-Gm-Message-State: AO0yUKV7tYn6wgVYiuKaJdKsjRvD8LvW1hT/MBWxHnZOxuLP5KHLznWm
 VN4MbR6fi/PuolIQ5ySnrw==
X-Google-Smtp-Source: AK7set85VAFntiNHIDjGtfCC2oOT1/ixiwDzGmV6KZlRV3vcVPs11dYw0ZIvaGYFHStwN8BXxG0AZg==
X-Received: by 2002:a4a:b6c3:0:b0:51f:e966:e3b7 with SMTP id
 w3-20020a4ab6c3000000b0051fe966e3b7mr1792287ooo.3.1676994086229; 
 Tue, 21 Feb 2023 07:41:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bf7-20020a056820174700b0051ff746e2b2sm293867oob.8.2023.02.21.07.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:41:25 -0800 (PST)
Received: (nullmailer pid 2586813 invoked by uid 1000);
 Tue, 21 Feb 2023 15:41:24 -0000
Date: Tue, 21 Feb 2023 09:41:24 -0600
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for
 anx7688
Message-ID: <20230221154124.GA2584323-robh@kernel.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
 <20230218111712.2380225-2-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218111712.2380225-2-treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Benson Leung <bleung@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, chrome-platform@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 18, 2023 at 07:17:08PM +0800, Pin-yen Lin wrote:
> Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
> allows the bridge to register a .get_edid callback.

What's .get_edid? This is a binding and is independent of Linux.

> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v3:
> - New in v3
> 
>  .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> index a44d025d33bd..9d5ce8172e88 100644
> --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> @@ -25,6 +25,10 @@ properties:
>      maxItems: 1
>      description: I2C address of the device.
>  
> +  ddc-i2c-bus:
> +    description: phandle link to the I2C controller used for DDC EDID probing
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +

No, this belongs in the connector node. The DDC signals are routed to 
the connector, not the bridge chip.

Rob
