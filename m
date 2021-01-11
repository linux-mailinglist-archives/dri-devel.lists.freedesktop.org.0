Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516C2F2280
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 23:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D5989D57;
	Mon, 11 Jan 2021 22:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374BE89D57
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 22:14:38 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id n42so368001ota.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EUpURo/tqlO11d0ZWh9pJqmfT9/Dqh7vfkqpzFQuRyw=;
 b=AUGwJUf7KbDI6mc77uYbf/YYO4w/1576ZjRYHlf7Ywvyq1la4uPmRlm3iKBBMNM8mc
 NQZUVQJqqD190Fim73kWj0D4nw/gUaiiCRa0B7nwaCERujM0+ruoPXuel4H8Mkbm61oD
 2lIhgaQp/xPtpWf8sCobYKSFwxhEwR5XNQXkUp5zcWa/xBUK6dcXtybz+pordiyzXZ/p
 nz7R5IhCzqJY6uRVaJVF6nGjbhH08a+hJgtGtJzIohAADql6afPrdh9Fi/ab0nYEvAjW
 r1mO2qIvRyvJ3TCa7QspBuFFf9l+QvKnGbLwS/R2kD54RRgA+YB+1HdHRxFe6llBEty5
 5dMA==
X-Gm-Message-State: AOAM532GjUS4QboiSGi4d8ilZNl5o71VjWZFYaHRBUowuNZN1y1zqWmg
 aBd7yNHz9BpScStUaUVt4g==
X-Google-Smtp-Source: ABdhPJynZmBNaJWokVqNq/yz3Znmx7KTAFKORtHEJxCrTr9eUh0wfnSWBI4rB+vdbBzij68rJVWmtw==
X-Received: by 2002:a9d:2248:: with SMTP id o66mr847503ota.236.1610403277462; 
 Mon, 11 Jan 2021 14:14:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w9sm236310otq.44.2021.01.11.14.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 14:14:36 -0800 (PST)
Received: (nullmailer pid 3152734 invoked by uid 1000);
 Mon, 11 Jan 2021 22:14:35 -0000
Date: Mon, 11 Jan 2021 16:14:35 -0600
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag
 and swing setting
Message-ID: <20210111221435.GA3138373@robh.at.kernel.org>
References: <cover.1609380663.git.xji@analogixsemi.com>
 <d13442f84fefccc992d6c5e48ac1e6129882af31.1609380663.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d13442f84fefccc992d6c5e48ac1e6129882af31.1609380663.git.xji@analogixsemi.com>
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 31, 2020 at 10:21:12AM +0800, Xin Ji wrote:
> Add DPI flag for distinguish MIPI input signal type, DSI or DPI. Add
> swing setting for adjusting DP tx PHY swing
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 25 ++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 60585a4..4eb0ea3 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -34,6 +34,16 @@ properties:
>      description: used for reset chip control, RESET_N pin B7.
>      maxItems: 1
>  
> +  analogix,swing-setting:
> +    type: uint8-array

Humm, this should have be rejected by the meta-schema.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array

This is how types are defined other than boolean or nodes (object).

> +    description: an array of swing register setting for DP tx PHY
> +
> +  analogix,mipi-dpi-in:
> +    type: int
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: indicate the MIPI rx signal type is DPI or DSI

Why does this need to be in DT, you should be able to determine this 
based on what you are connected to.

> +
>    ports:
>      type: object
>  
> @@ -49,8 +59,8 @@ properties:
>            Video port for panel or connector.
>  
>      required:
> -        - port@0
> -        - port@1
> +      - port@0
> +      - port@1
>  
>  required:
>    - compatible
> @@ -72,6 +82,17 @@ examples:
>              reg = <0x58>;
>              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
>              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> +            analogix,swing-setting = <0x00 0x14>, <0x01 0x54>,
> +                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
> +                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
> +                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
> +                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
> +                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
> +                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
> +                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
> +                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
> +                <0x26 0x40>, <0x27 0x60>;

This is a matrix, which is different from an array type.

> +            analogix,mipi-dpi-in = <0>;
>  
>              ports {
>                  #address-cells = <1>;
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
