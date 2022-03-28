Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6624E9C4B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7517710E700;
	Mon, 28 Mar 2022 16:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D58410E700
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 16:33:20 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id q189so16134416oia.9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 09:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bIvjLAN1WghVKdHbiAwbpiS4KUlO9J5lK2uou4RVILk=;
 b=Ma3j8lnmukyIIRk8hUFmhT6sYPb0YJ1OwNW4eJJhviEM5c0lrX/Vblbo3LT17U+et6
 8HU+WmJJJnQv1NH54pXKTB2qSLgMSWOTTTI8dkv+T7+gKlh2Ea4XXolIDSxquG8grea+
 qnHRpD+w1qzs8MebSmZEUGYIpTdN+1YlL+aWP5dRRbRyI7q1Q6XhftgZObjtjUl/xDJ7
 tlP5jtnvOyAMJdU02hSA31oGPyxeaTkx9e87JkpKPvxBy2D1e3yCYMlnQIE7NR14cmFp
 8HVJSFOgpn7hvivGwEsdwBozHC/Y/R9IzV9r5C0GgyLXtvEOiKk6df8JjTZ3DcbmW/7Y
 l1cA==
X-Gm-Message-State: AOAM531a72YI5OEscfjuSu3dOePTg1LCg/XqpIt5wpZii4O6RYK6mkE8
 Ll984M2b6UvPALcc2kd/mw==
X-Google-Smtp-Source: ABdhPJwNVh5RZ1sp9MXlR5GlreRlGRTmHJKVh03oTfj9pol2juq4vLORJb84KwOjAAWD3ibi6+xCCg==
X-Received: by 2002:a05:6808:1059:b0:2ed:b699:7f2e with SMTP id
 c25-20020a056808105900b002edb6997f2emr909oih.240.1648485197630; 
 Mon, 28 Mar 2022 09:33:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056808158f00b002e331356c87sm7218218oiw.39.2022.03.28.09.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:33:16 -0700 (PDT)
Received: (nullmailer pid 2515489 invoked by uid 1000);
 Mon, 28 Mar 2022 16:33:15 -0000
Date: Mon, 28 Mar 2022 11:33:15 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v9 02/22] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <YkHjS9ToXqyliItf@robh.at.kernel.org>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-3-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220327223927.20848-3-granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, Markus Schneider-Pargmann <msp@baylibre.com>,
 chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, krzk+dt@kernel.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 12:39:07AM +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..802cc406c72b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Display Port Controller
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the Mediatek (embedded) Display Port controller
> +  present on some Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-dp-tx
> +      - const: syscon

Add something to the above description to convince me this is a syscon. 

If you need a regmap, the driver can create one. 'syscon' is really only 
needed if there's not a specific driver.

Rob
