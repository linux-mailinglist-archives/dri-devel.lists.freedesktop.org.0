Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FE3A19634
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 17:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F64510E15E;
	Wed, 22 Jan 2025 16:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jLAo8kkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4EE10E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 16:12:36 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5f6497fbccbso583792eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 08:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737562356; x=1738167156; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/9jtQGhGzfUUBpDpoTIqjDA1rkZ3nGNJjvwgw5e22m0=;
 b=jLAo8kkbjMMLfQ+57dnLr2rcGBBh7I1ua9zsO3gtzZi53HTLTSCtyjfuK4VfzA/DL2
 Hu8dkC7+fIBvci8Q6bnve0zAmh7r1Pd7VTA85A9C7wuTIeeM4/BjUkwaw70nNZNsvg9c
 AcCCGCf9+VYzkTT46SX+q5wPXW/E7mYFCbrpIyOf3J7adXYTifJZVWyU/82Z5e3/YT9x
 mICuqr0Vv6YE6d9kw5NFQkcPYYGEMgmpqdmTaZyADvdE74zfjAXxt06DLf4q5vh8MZmV
 aw8ICCDuhLGUJ84xxk60z92THBdCcu0t43N1/g1FAaMr+hcb0hnrkMyjOarbiEmM3Jvh
 GlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737562356; x=1738167156;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9jtQGhGzfUUBpDpoTIqjDA1rkZ3nGNJjvwgw5e22m0=;
 b=Nkmyqzw1+bQDhsZzqAZ+kl0NIez/7s+NfES7m8cAglESbG4/VxQNmzzID0JePfXlWB
 9icb8JvISfvOmBSdd3qs77H4vcPYp+pEd7OJOWnb1SVoWJ9t4VMZsA1euKeVA0jvev5m
 WiDflRRm5CxW/V6d256dLDM5c0sr9BFRJc9xb8oitdYbcFtPS0aGx+wyCrpM2rOmObyS
 V1CABwYtQnONp9+vXzjVdhA9wh5kfLKCKhUZpovz32zPe8B8Ln+wnavLNxsldwngq7Bk
 xp5ynwlZiVWW2hEaeUYc+MMsBMQdAOkvUpS8W570YdtFNtGL1xhqGufRyyao2CphW2bk
 0Hfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT9a2xvVKOZX5zsxTxbf5kUu6c7OFBvP741p2ATJh1pBraOIBUtgGUDxyCQjfPaq52JdWk9x+4cL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+X+iPWUx69n6RMuVRX41/mAbYLDXkXldFQGMfuKwa9q2/pT65
 UWEuPKJazK/KgyadQwqefaCL1eaB9ai10CXZpyue+SaqpFCs6nCt
X-Gm-Gg: ASbGncuHahvbp+FH8ZXSFSAvVBpi09ISkmcE39g+W3PvFFC9qGwD5EQY9x5qeinpvKA
 IXCnbso6mtGOlq4ogwGnAXJbR0/KYBUo4b6FB0hb3dQPkYX9j7LqTBdd0zhvSifIw1A8KpkTGPF
 8fv+5juinuoCBA+Fbu6UYBnZh9dQxQGl31Nnzf4L3/KGRiQTqrVKAE9tr87tXWw6bwk74gLRBoP
 vr4U5fmqPxsu4BVSZRxWISZL2auBIOScx/N1u/aCfCHw850L/RKqL7dWy4n0ATAvS0Ip9YHuRuo
X-Google-Smtp-Source: AGHT+IHE2b8ugHOaPnXUAF+Kz71s8KV9Kpi4/z9mUrzVbipQA0iNJO+L+jfYIyVhvtmJE3ckimaFxQ==
X-Received: by 2002:a05:6871:d109:b0:29e:5152:dab1 with SMTP id
 586e51a60fabf-2b1c29238f3mr12647287fac.13.1737562355721; 
 Wed, 22 Jan 2025 08:12:35 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:9e8:bbcb:5f73:f84b])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b1b8f767e6sm4482612fac.35.2025.01.22.08.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 08:12:35 -0800 (PST)
Message-ID: <679118f3.050a0220.3628fd.4a9f@mx.google.com>
X-Google-Original-Message-ID: <Z5EY8bVoaxi2MBVe@neuromancer.>
Date: Wed, 22 Jan 2025 10:12:33 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add another panel for
 RG35XX Plus (Rev6)
References: <20241124080220.1657238-1-kikuchan98@gmail.com>
 <20241124080220.1657238-2-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124080220.1657238-2-kikuchan98@gmail.com>
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

On Sun, Nov 24, 2024 at 05:02:12PM +0900, Hironori KIKUCHI wrote:
> This is a display panel used in the recent revision of the Anbernic
> RG35XX Plus, a handheld gaming device from Anbernic.
> It is 3.45 inches in size (diagonally) with a resolution of 640x480.
> 
> It has the same interface (pins and connector) as the panel of the former
> revision of RG35XX Plus, but they differ in their init-sequence. So add
> it as a new panel.
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>  .../anbernic,rg35xx-plus-rev6-panel.yaml      | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml
> new file mode 100644
> index 00000000000..b60a4cf00f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Anbernic RG35XX series (YLM-LBV0345001H-V2) 3.45" 640x480 24-bit IPS LCD panel
> +
> +maintainers:
> +  - Hironori KIKUCHI <kikuchan98@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: anbernic,rg35xx-plus-rev6-panel
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-3wire: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +  - power-supply
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "anbernic,rg35xx-plus-rev6-panel";
> +            reg = <0>;
> +
> +            spi-3wire;
> +            spi-max-frequency = <3125000>;
> +
> +            reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
> +
> +            backlight = <&backlight>;
> +            power-supply = <&reg_lcd>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&tcon_lcd0_out_lcd>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.47.0
> 

Though the documentation file will likely change (to newvision,nv3052c.yaml
if I understand correctly) do we know if "anbernic,rg35xx-plus-rev6-panel" is
an acceptable compatible string for this panel? I'd like to add it to a fixup
in U-Boot but can't proceed until the string is defined.

Thank you,
Chris
