Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F49A4212F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD8810E435;
	Mon, 24 Feb 2025 13:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ApH7raDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8482710E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:25:35 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30613802a59so37672811fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 10:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740335133; x=1740939933; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mtNMK+QZB8Ju1QcEFH1uDPKTHzJj1OW/FdNy3G2F6jE=;
 b=ApH7raDWilPekOt+EPcNP+x040N88rzmZ8O6iEco0cFgR+bh57cWYfVNycMBRa9hUZ
 9UDU44bSq51c8rDAJpG4SvmfVT/SKyLz1INiq9muXWC4Lhp4W0vydfkszhOK/GhPN590
 4RdTv6hS+p7C30J/19hH/BJkraPNzmo4+1ix9IjY50TcZmNEZ8xp07l5F4PiW1slfiPp
 JDNoMl5+L4r1LQLCUnCCNCdM34351wpo7ymomgQWudDWclO2NC+FfAYQpUvh/jDW8Eiv
 FSurL0GO83YmHKpSt+bsEjWDWvb4CMjc9OvUTrCz0vtKXWw0xUSMyDCt0JFdobXOak1J
 BWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740335133; x=1740939933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtNMK+QZB8Ju1QcEFH1uDPKTHzJj1OW/FdNy3G2F6jE=;
 b=xFsINyl5Qy6Pd4sjM9TzFNDfxLKbRO3NDRwoIU4Fy7LRcGSoMtLaZOuUhztCtfoiXw
 75oI4UgcjmHTKyMeHjZhKTBzvG9/2uUBKq7W5andZW8qzJRDMW3fHkh0wys2mP8z2MZH
 sMoZeQJHtTEq/d/zAghBntw2Lmh5tQK+2sXajwjAa276uqo+uNkChrZ9i+KQ8SzfD0OH
 cb1nz4WpVRqoMp6PxoJi5vOpOPCPx9muoasfppJd+d/rJQv9eziibKsIC7lRfd+NBzM6
 NlYmwx8DWHitaD6GKh+nIOOMX3qeaHXTB0g/RMdilMWGetODpRLbBKjW1oMnyQB6gh42
 WyFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4gKIzzIe2j+mdjILQEeVWrqmBB6/dbMxaJSq5lFyDMxBRFao8m0dxDZg0TxXqK7ZlJt1fE6huYrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcxAECjx04spSMjI3SrHQW0W6/EpTbuGSaH46ytEbXVhG7oCJP
 FywEOpIoN49v9d070brlAGX7i71VQF0byYekdNPUY6QceQAqD6I9/C/yy5/yJsM=
X-Gm-Gg: ASbGncvbAFPKw7y5+aMdIIZ3706mn8aEJraNdeWstXRX241XCHtx+69wp9KICGq6q8s
 D5ZNPLx/wj4IHVrUp35P7TKeOjdLLbt5IFUmn8grgjV+pzFmAw+cajIql244UdPM9Clb7sO/6wj
 +Caenf9Qo636EU3gvMRupHp+5bfwSPuh43/G3OVbzxlNCUBRDLuxg1eAz60YbJnyKpW9eSA2BdC
 oOJSyy/NVaIcFuRq4LyXryGz3AX5jyBcLvZsN/Ox6KBoGGDhxWGfYJIdo16NowrxVWxUJ8X5sqx
 AluuwtYyAfXZv77YNiGZeAwhxTLOX7lzHw6BDnl4SlCeu6taC8Egue/U9MYqQfn7egsP9uCTJ1b
 cD16TWA==
X-Google-Smtp-Source: AGHT+IGKB1vocXj8KVqyAz4vvD7IpDGljmlluQ7IMEzMaAFJ3qaRjIbImaAgV9NSc9jWouTyZFOjIg==
X-Received: by 2002:a2e:80d3:0:b0:302:4a61:8b85 with SMTP id
 38308e7fff4ca-30a599951ebmr34295601fa.37.1740335132749; 
 Sun, 23 Feb 2025 10:25:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3097b6584efsm26654891fa.33.2025.02.23.10.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 10:25:31 -0800 (PST)
Date: Sun, 23 Feb 2025 20:25:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> Describe it and the Fairphone 3 panel from DJN using it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX83112B-based DSI display panels
> +
> +maintainers:
> +  - Luca Weiss <luca@lucaweiss.eu>
> +
> +description:
> +  The Himax HX83112B is a generic DSI Panel IC used to control
> +  LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: djn,fairphone-fp3-panel

Would you know a better name or ID for a panel?

> +
> +  reg:
> +    maxItems: 1
> +
> +  iovcc-supply:
> +    description: I/O voltage rail
> +
> +  vsn-supply:
> +    description: Positive source voltage rail
> +
> +  vsp-supply:
> +    description: Negative source voltage rail
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - iovcc-supply
> +  - vsn-supply
> +  - vsp-supply
> +  - port
> +
> +unevaluatedProperties: false
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
> +            compatible = "djn,fairphone-fp3-panel";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +
> +            iovcc-supply = <&pm8953_l6>;
> +            vsn-supply = <&pmi632_lcdb_ncp>;
> +            vsp-supply = <&pmi632_lcdb_ldo>;
> +
> +            port {
> +                panel_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
