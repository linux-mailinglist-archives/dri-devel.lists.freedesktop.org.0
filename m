Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B655F66EC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 14:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B2D10E3A7;
	Thu,  6 Oct 2022 12:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808D410E3A7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 12:54:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 03C1ECE16B7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 12:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B76C43141
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665060857;
 bh=MsIFn/B1+08rEbLiGduxeXGRhxZBa1pWHKmWKGsKPmw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HjKhW+QmffhhWWlm6qsN4Uz81lr19nxM/HJdG4wEwq9L9XPaX0J1su1KEdDq5zX+H
 jacDe1k2Jy9HTQTm01rhLr7k9z2kwwBcBGt44UQDYGfLTA97W4C44qlc3jpNPCoWZh
 UGbkop6EcgE13ItegzofWa3I06I+hIw0LBCMlH33lVJh+I/5m1tXviTau8LDsl1JmN
 vOIcsXa0JJXK8w1E5YhF3m0/eX53oT7l2+ouFSGmlonsKXcxx1rlRXR4LnVJIqY9Pd
 Ic1lBDcP2KQtNep343ytuBnfWaKHAbvHaNS7uiXmrkjTi1sMvz9km42+Vdt+kc8fIz
 Z2kzXwqZInzsg==
Received: by mail-vk1-f180.google.com with SMTP id i5so753094vka.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 05:54:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf29F0oz5AF24C6P6mAlufPWsiv9LzWT5obmcPSTUllP5V1LHHh+
 +4d867NWv7tIEX9ghmmLJpOOrllKiU7FIhqMbg==
X-Google-Smtp-Source: AMsMyM5YQNA460THnTExkzg+jr8ivd5DgaPTjt3P6pRYVuUbdtP71PS4b31kGlnH8wJCcBae3wbGM0+goQ7pfoEgZas=
X-Received: by 2002:a1f:3285:0:b0:3a9:ebd7:db97 with SMTP id
 y127-20020a1f3285000000b003a9ebd7db97mr2401790vky.14.1665060856647; Thu, 06
 Oct 2022 05:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221006020444.15823-1-allen.chen@ite.com.tw>
 <20221006020444.15823-2-allen.chen@ite.com.tw>
In-Reply-To: <20221006020444.15823-2-allen.chen@ite.com.tw>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 6 Oct 2022 07:54:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJvwi5wL9_POvPcQASXDzrcw0CQ2T7Xig0hCHjiSaQ7Tw@mail.gmail.com>
Message-ID: <CAL_JsqJvwi5wL9_POvPcQASXDzrcw0CQ2T7Xig0hCHjiSaQ7Tw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
To: allen <allen.chen@ite.com.tw>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 5, 2022 at 9:05 PM allen <allen.chen@ite.com.tw> wrote:
>
> From: allen chen <allen.chen@ite.com.tw>
>
> Add properties to restrict dp output data-lanes and clock.
>
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a..f5482a614d05 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,6 +52,16 @@ properties:
>      maxItems: 1
>      description: extcon specifier for the Power Delivery
>
> +  ite,dp-output-data-lane-count:
> +    description: restrict the dp output data-lanes with value of 1-4
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 2, 4 ]

We have a standard property for lanes: data-lanes

It goes in the endpoint.

> +
> +  ite,dp-output-max-pixel-clock-mhz:
> +    description: restrict max pixel clock
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 150

Also have a common property for this: 'link-frequencies'
