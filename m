Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D48F2BBF0E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 13:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE80890A2;
	Sat, 21 Nov 2020 12:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD65890A2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 12:50:47 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id f15so5782419qto.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 04:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0eLODkRpKbmFULO0YO5o421ANqpWCtV3ViGaBwX9fGk=;
 b=Rg9q7cpWpXatWO7vHcYVcTGFfG6AtFEuc0BCMpHEVFtawv7FEKc5wOn7yUXiRFtEzt
 cqXzBz8nRvIxZ6esFeDcitAgrY7O6n6K0yPclZT5/9gcOHBF+08kjNP6ciymId7iVIAY
 Mpj98gfPwdL+KPQKP2uSUJhuYUwwrmwYFeEAY+QZitEt8/NRvX5RSx9v1nZfbd+2zlx4
 5vjLdxGe39ht+e36bhGUNAz69xOj+m7msXzLfB0933EMBmQC7zwdRznZKsyD/ZBWTk5D
 Ea8YL1G2PgXT3pSo8KAc5WxbWFa/ZBfdqjgismqQ6ysswNwhqnDNY2B3muu5LO6rFA9I
 +9Qg==
X-Gm-Message-State: AOAM531SOkKt8aQFyxP8zi3OMjTKojHAKEwcWQEkqlXY3qKWxH6GrhUe
 YL4RiFXTkxR98WB4+MFP7w==
X-Google-Smtp-Source: ABdhPJyUJ7IlSagRKbzuDzYgX/hB+zYDKd2lKwox5U7luJqaS/fiFLVH8Q0NOUOK/Z3bx90u8wuJ0g==
X-Received: by 2002:a05:622a:1cd:: with SMTP id
 t13mr20450545qtw.39.1605963046240; 
 Sat, 21 Nov 2020 04:50:46 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
 by smtp.gmail.com with ESMTPSA id e6sm2224127qtb.57.2020.11.21.04.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:50:45 -0800 (PST)
Received: (nullmailer pid 2076002 invoked by uid 1000);
 Sat, 21 Nov 2020 12:50:40 -0000
Date: Sat, 21 Nov 2020 06:50:40 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add power supplies
Message-ID: <20201121125040.GA2074808@robh.at.kernel.org>
References: <20201112083704.1173908-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112083704.1173908-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 04:37:03PM +0800, Hsin-Yi Wang wrote:
> anx7625 requires 3 power supply regulators.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../display/bridge/analogix,anx7625.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 60585a4fc22b..1aa08f10d894 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -34,6 +34,18 @@ properties:
>      description: used for reset chip control, RESET_N pin B7.
>      maxItems: 1
>  
> +  vdd10-supply:
> +    description: Regulator that provides the supply 1.0V power.
> +    maxItems: 1
> +
> +  vdd18-supply:
> +    description: Regulator that provides the supply 1.8V power.
> +    maxItems: 1
> +
> +  vdd33-supply:
> +    description: Regulator that provides the supply 3.3V power.
> +    maxItems: 1

Supplies are always a single item, so you can drop maxItems.

> +
>    ports:
>      type: object
>  
> @@ -55,6 +67,9 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd10-supply
> +  - vdd18-supply
> +  - vdd33-supply
>    - ports
>  
>  additionalProperties: false
> @@ -72,6 +87,9 @@ examples:
>              reg = <0x58>;
>              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
>              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> +            vdd10-supply = <&pp1000_mipibrdg>;
> +            vdd18-supply = <&pp1800_mipibrdg>;
> +            vdd33-supply = <&pp3300_mipibrdg>;
>  
>              ports {
>                  #address-cells = <1>;
> -- 
> 2.29.2.222.g5d2a92d10f8-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
