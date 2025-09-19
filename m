Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFDB8A007
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732F510EA07;
	Fri, 19 Sep 2025 14:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QFThGcFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A889410EA07
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:36:26 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso23630925e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758292585; x=1758897385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Ki7qAfO4qaImjGJ2JfSFUybYdIzI88oPzTIZNv7oRHU=;
 b=QFThGcFdXMLln6Wq7Wk8SryjCYUT2hrsNxDeXXp7l96lUyKl7pk/WsSlGnGJ+qgcvm
 O9zJMTlw0AAofRbv+ft4zx0utuiWsjybpPwOz9ES0BD3w3o/xklCSl0iWKXLvaAFLWGu
 tzotWUZrjafeqGS0mawQM2jfErBCw+cXnkX7i9pyyLuR+oIRGOnizMBi/6nykEuR+u/r
 TVdAVNMU72/3N6qhM8v9G5XjgK0HgPMI3fwYNi3jGHoUklRTZIVaP8LuPqwUK/PP8ze1
 zfpRHee+s38QFGwVyI6Pbc43o61pmU2eXpRNHkfdQxR7nhZR+SmppeEo/wBgwlvny/C2
 olKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758292585; x=1758897385;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ki7qAfO4qaImjGJ2JfSFUybYdIzI88oPzTIZNv7oRHU=;
 b=SNbBPorePuMmbklqeEtpgblx+4OMCdAvVXUdrqc9A8otKlb8oxipvVAFdOuo2rkePv
 1rLmNNSzntGGL/ndBJQYXClWMcTgFPAiX4Nyj2WZI0fpNvT4B3ataJ6GTfaa1jgY3YyA
 2mAFB9zyWFAap3lE7kZUSAM2h91T71RJ3KttjZ2R4ULc/I88UnqwvGjUUkV7/JWEpGae
 gVpZgbexhO8q8KmRSkKRWVO92iiYm5aoqrcaY1sHZMljshFs9xjwf+s0QicLMPftQUsr
 cYXqM85s9xj0Ir8lffyGEhKZajR+4Lk91UUl/CLak+J7AhRCDYjMvrhC6b3ebhCQOS2U
 TwsQ==
X-Gm-Message-State: AOJu0YwoEdWkXmtP3TednaObvICEdESBM/DETm3hch5v9ioQAONDNoyo
 AioW4+Jnrit2eYBAJ9aWLSECTBZyPkub1KMOi5c1O1zEzV9GAr4oOF7y/ltMRN51wWQ=
X-Gm-Gg: ASbGncuWp9pT7x8ExvQBp1+39vGko6c1ZofpkF52dLsIHWXR/9X973Eo1vMQLTkYxHV
 5VktCn4zfYc/diS+bAChHYMWfjjlgN0uhVjkD3grhqhl0jNgFGjdhiq7NVennFxPDyF6Gn+T83p
 1dU0CeACErM2zS0bDRHWQyI4g7+Yp/wYkVz0Xn+fcCrTxLOzG8NPGmrA30zRnmb+oIRlICSwTy3
 jXh2UafR5Dgx+zT9SThY0xB7I7Y0hyARfxHQGMz/W67XNrC65zvauAc1qBS3dRkIelNQCjD0XZZ
 FDs1lHuDxwyDfP1gKj3p197aRlOVndHwfUgXOB0tcH04xTGrUK2eapSBWvTRhwmr+fJznDnunlE
 hcGTTImmbET3DyCzbOeg+uFAmTtl9h4BurdsntiFjTYD1e5kdkjjuIRIRXzLwhNevGvz7cJay
X-Google-Smtp-Source: AGHT+IH5vrQPKYerDhA6I6iQ9DqZ/m8nF6zTFVhUr5PFv+QEeSA57WDealwtSdVJmyo8SQmPDRYqgA==
X-Received: by 2002:a05:600c:19cf:b0:459:dde3:1a56 with SMTP id
 5b1f17b1804b1-467eaa881e0mr30634565e9.28.1758292584629; 
 Fri, 19 Sep 2025 07:36:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f?
 ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f0e28c83d6sm2164989f8f.56.2025.09.19.07.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 07:36:24 -0700 (PDT)
Message-ID: <bdd942ef-1ede-4f9f-ab90-ea7ac8995b92@linaro.org>
Date: Fri, 19 Sep 2025 16:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250912064253.26346-1-clamor95@gmail.com>
 <20250912064253.26346-2-clamor95@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250912064253.26346-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/09/2025 08:42, Svyatoslav Ryhel wrote:
> Document Sharp LQ079L1SX01 panel found in Xiaomi Mi Pad.

The patch doesn't apply on drm-misc-next, please rebase.

Neil

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   .../display/panel/sharp,lq079l1sx01.yaml      | 99 +++++++++++++++++++
>   1 file changed, 99 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
> new file mode 100644
> index 000000000000..08a35ebbbb3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sharp,lq079l1sx01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Microelectronics 7.9" WQXGA TFT LCD panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description: >
> +  This panel requires a dual-channel DSI host to operate and it supports
> +  only left-right split mode, where each channel drives the left or right
> +  half of the screen and only video mode.
> +
> +  Each of the DSI channels controls a separate DSI peripheral.
> +  The peripheral driven by the first link (DSI-LINK1), left one, is
> +  considered the primary peripheral and controls the device.
> +
> +allOf:
> +  - $ref: panel-common-dual.yaml#
> +
> +properties:
> +  compatible:
> +    const: sharp,lq079l1sx01
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: regulator that supplies the analog voltage
> +
> +  vddio-supply:
> +    description: regulator that supplies the I/O voltage
> +
> +  vsp-supply:
> +    description: positive boost supply regulator
> +
> +  vsn-supply:
> +    description: negative boost supply regulator
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  backlight: true
> +  ports: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - vddio-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "sharp,lq079l1sx01";
> +            reg = <0>;
> +
> +            reset-gpios = <&gpio 59 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&avdd_lcd>;
> +            vddio-supply = <&vdd_lcd_io>;
> +            vsp-supply = <&vsp_5v5_lcd>;
> +            vsn-supply = <&vsn_5v5_lcd>;
> +
> +            backlight = <&backlight>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    panel_in0: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    panel_in1: endpoint {
> +                        remote-endpoint = <&dsi1_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...

