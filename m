Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA93702E5A
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9F710E1DF;
	Mon, 15 May 2023 13:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F019B10E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 13:37:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3090408e09bso1989693f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684157819; x=1686749819; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=siTWifPxX1aManif72YDrV0r+hmOKzstfDGYR/mGvqU=;
 b=rLHZSu5M7RzoKDhFsx1ys87yhSCrDbWTxAgMMuBUgps5wawJ0qQvajd4EV/blhJUvk
 mf5SlkcbLuA8LQevhATGAuZ6wjKw0sknNT/LGwNU5+EfeNKDoO8I3NjrWVIy5NChlcuS
 9Lbiuf195fFKr6LR39RnmNs01s5xd/KUVGZRE+n9trEW2NK2OXJLc8KoU7wDZGa/G9Pb
 psPo42k4wG7g5mczy7duZj9mXmPUeOu5pmaTEENyjhV176o+wMZ/TH9J18i8HfN+rxZp
 Dw1w6WJ9FPpJIGhAiNvGnIB0JqtPz4Ue8rpbx4/nqbRZUXbxK29X0s5Ea9XMNHS67GoL
 bPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684157819; x=1686749819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siTWifPxX1aManif72YDrV0r+hmOKzstfDGYR/mGvqU=;
 b=UFf87WS+QtunxVxJKD4Yu+8ALE1ztK9K+KwJ6BZ51q1cyvIAEJd8k50UxTEJHSuyvb
 YgIKPLHv3PfPTYqg+i1l/plZ8c/dR2nd0HPGNvXIzjGKUI9bDTnyzLKQd9mUcVB0x/ty
 hbxKLVFyrxMNsGdqXuRycFMeao6hkG5y2y04WMZF74Jkd9g+jCHeB+mclcLrJoFSWGgn
 kiur4MvQXIpv3Cyc3R8H8R04fZOHyj5fi+uYz1svAqoRn+oAXufQdTIMhz+2VR9nRhXh
 Le7JbiMfNm9gtrsojBqxg1u2KYc1gxXUb58cNSDwDe3o8j20NYzMUX36bRI2aFbPr1Wc
 yDJA==
X-Gm-Message-State: AC+VfDzNXYxqq7gM/S8CJ+xW6D+apueza9NftCsnN+t5UZjyEGOY7Qlp
 6OspuYxHp5oIZ10OispcX4tFmQ==
X-Google-Smtp-Source: ACHHUZ4Rdql4HTts8WmrVYcQw4kCaOVth/28CmVLcDZlzwc9HN6Pxehp2ST/CdMixqBydRN1GYH6FQ==
X-Received: by 2002:a5d:4b91:0:b0:306:2a1a:d265 with SMTP id
 b17-20020a5d4b91000000b003062a1ad265mr23135895wrt.58.1684157818781; 
 Mon, 15 May 2023 06:36:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a05600018c300b002fe96f0b3acsm32786586wrq.63.2023.05.15.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:36:58 -0700 (PDT)
Date: Mon, 15 May 2023 15:36:57 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <ynrvqt24hjgng25r2xa3hxj35cvgotx7sdfrbqfjcvj3foegmr@4lqhen5yu6fh>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, chunkuang.hu@kernel.org,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/23 11:05, Julien Stephan ha scritto:
 ..snip..
> > +	port->is_cdphy = of_property_read_bool(dev->of_node, "mediatek,is_cdphy");
>
> This driver doesn't support C-PHY mode, so you either add support for that, or in
> my opinion you should simply refuse to probe it, as it is *dysfunctional* for the
> unsupported case (and might even introduce unstabilities).
>
> 	/* At the moment, only D-PHY mode is supported */
> 	if (!port->is_cdphy)
> 		return -EINVAL;
>
> Also, please don't use underscores for devicetree properties: "mediatek,is-cdphy"
> is fine.
>
Hi Angelo,
You are right this driver does not support C-PHY mode, but some of the
PHYs themselves support BOTH C-PHY AND D-PHY. The idea of `is_cdphy` variable
is to know if the CSI port supports BOTH C-PHY AND D-PHY or only DPHY.
For example mt8365 has 2 PHYs: CSI0 and CSI1. CSI1 support only D-PHY,
while CSI0 can be configured in C-PHY or D-PHY. Registers for CD-PHY and
D-PHY are almost identical, except that CD-PHY compatible has some extra
bitfields to configure properly the mode and the lanes (because supporting
trios for CD-PHY).
If C-PHY support is eventually added into the driver, I think we will need
another variable such as `mode` to know the mode. I was also thinking
of adding a phy argument to determine if the mode is C-PHY or D-PHY.

So here, I don't want to stop the probe if `is_cdphy` variable is set to
true. Does it make sense ?

Regards
Julien

.. snip..
> > +
> > +	phy = devm_phy_create(dev, NULL, &mtk_dphy_ops);
> > +	if (IS_ERR(phy)) {
> > +		dev_err(dev, "Failed to create PHY: %ld\n", PTR_ERR(phy));
> > +		return PTR_ERR(phy);
> > +	}
>
> Regards,
> Angelo
>
