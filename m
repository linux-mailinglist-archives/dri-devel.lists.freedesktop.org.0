Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57421AB8F4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAABC6EAE2;
	Thu, 16 Apr 2020 06:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068396E28E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 19:50:12 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id a22so309494pjk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=V6l2X70ea3XCzQRMPtn3nNECLb1DlkpL6KAzQKMivmc=;
 b=QDHfG7KGee7J1KR47wIe2BcCVaIwOUy359B1jIpJK6V6RZdEZTsG1tC/zWVGD6eoAy
 zqXsKEdsGmvzvqZ/h5rNFAlGDTU5LGgrT2ZlkqHpVKAIH7CwFw8824U2wR7hNIGtXebO
 lhm2pA1hLKA8lC23UcRJlY1avXPMOsYoEwweY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=V6l2X70ea3XCzQRMPtn3nNECLb1DlkpL6KAzQKMivmc=;
 b=SFs9TBwcfLw6yA61OoJ2/ozfN4YK0CXxsevk7wWp6DeqI9DhY/cXmHaTtxk/Q+GHuJ
 c6ZF/6aRF4pvN4giCsjotihtmzlX/kNXYcQgBcZJbI9wOzJIIbt2BKu5LIWBwIPrjUO0
 EySpSuemQAicUbWujsWZ39giXJBrqtVH3nvvqTlcDW3RlceIO/pPckMF9NhfgkxTU7cZ
 w5cB3HR3XsQ1y/ELJ17KAABcIHpX2Qaoj2fe41s1C0WnCzRjZ1b/VUDCE7hyLByZtR98
 0B2VuR0r2LyIm4JON/z05uIUZKvILM2Q5rQrNDkFPD5i1tkXFsMTjAbWxVZbOJRJyAw6
 0w9A==
X-Gm-Message-State: AGi0PuaIxEGIH8VD8vLU7RyJfWGSdpgLCYftkfAUiW1RedzJDIkWZ0+o
 Tq4EoI8nK/x8x2u7wkQ4vpB03g==
X-Google-Smtp-Source: APiQypKKY/tI8Uw1isr1iQMILFKeueLoYBL4RBrGVZULxPvpuI/+LxZFeV9xNIXzn0OzVsvK+vHMbw==
X-Received: by 2002:a17:902:a40f:: with SMTP id
 p15mr1132482plq.154.1586980212402; 
 Wed, 15 Apr 2020 12:50:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id r189sm13505392pgr.31.2020.04.15.12.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 12:50:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 narmstrong@baylibre.com, robh+dt@kernel.org, spanda@codeaurora.org
Date: Wed, 15 Apr 2020 12:50:10 -0700
Message-ID: <158698021097.105027.12960498982161983978@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-04-15 08:48:39)
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Awesome!

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> new file mode 100644
> index 000000000000..8cacc6db33a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI86 DSI to eDP bridge chip
> +
> +maintainers:
> +  - Sandeep Panda <spanda@codeaurora.org>
> +
> +description: |
> +  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
> +  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
> +
> +properties:
> +  compatible:
> +    const: ti,sn65dsi86
> +
> +  reg:
> +    const: 0x2d
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specification for bridge_en pin (active high).

s/specification/specifier/ ? I know the previous binding said
specification but I don't know what that is. It's a specifier.

> +
> +  vccio-supply:
> +    description: A 1.8V supply that powers up the digital IOs.
> +
> +  vpll-supply:
> +    description: A 1.8V supply that powers up the DisplayPort PLL.
> +
> +  vcca-supply:
> +    description: A 1.2V supply that powers up the analog circuits.
> +
> +  vcc-supply:
> +    description: A 1.2V supply that powers up the digital core.

Nitpick: Can we remove 'up' from these descriptions?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Specification for input reference clock. The reference clock rate must

Clock specifier for input reference clock?

> +      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> +
> +  clock-names:
> +    const: refclk
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
