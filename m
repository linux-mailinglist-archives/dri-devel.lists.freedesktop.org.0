Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049C6E005D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8710E986;
	Wed, 12 Apr 2023 21:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A0E10E97D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:03:54 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 i10-20020a4ad68a000000b0053b8aa32089so1942038oot.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333433; x=1683925433;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6vQDOyuL4ygu5OBRBw9x0Lns1GFB34OJmrSDqZyDSWY=;
 b=g9w7zpbM4fGGOTG/J0BpEYMVZ7b0y2YJK1ABRi148mFFUPiWBIXTe24Gf3i08b0vuS
 2XpjCE/LDLI3TbuC62xPs4d83SnOUr4bCrqYgekNYjpNaGqmkg3OMsUZ/Apif6DzzhDW
 Fo4xVb10TRnozncnj1ahFmmARpIMqFSC4OVejQdoq43XKTWg1nWCMPm83A30Pl3yoTCW
 rg9MILQMpNJr6QrZwKfKTfGdWEPVzMiYoAbTJOPCW4Gf00ZpcqJge7h7fwMKEjSpjV8g
 H4uCcwhyjdOXfXUzcZ7KjEi4GBtJYL0gBBVfJa5nuCOMnUQwUcrfF6CSEMcpO0WavMQH
 QCSA==
X-Gm-Message-State: AAQBX9cWPHwCEl+enXpslhnhb4ms0Iu/bQ/l5krMli54IIdBM0fxqzrg
 kLnT9FY+NMVdl2RFBq9DDg==
X-Google-Smtp-Source: AKy350aBfPKBwNkQTAKX6pidG5KWNDP9kOhzMY+0ltkEGSly040cf+gAtSbh55AqCxwHEjPwevEIEQ==
X-Received: by 2002:a4a:454b:0:b0:53e:5698:c0d2 with SMTP id
 y72-20020a4a454b000000b0053e5698c0d2mr1614999ooa.7.1681333433174; 
 Wed, 12 Apr 2023 14:03:53 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 185-20020a4a01c2000000b0051aa196ac82sm7508974oor.14.2023.04.12.14.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:03:52 -0700 (PDT)
Received: (nullmailer pid 3200529 invoked by uid 1000);
 Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319106.3190682.10651793127592676554.robh@kernel.org>
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
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
Cc: chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
 xinlei.lee@mediatek.com, kishon@kernel.org, kernel@collabora.com,
 jassisinghbrar@gmail.com, linux-pwm@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, chunfeng.yun@mediatek.com,
 devicetree@vger.kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 13:27:15 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-4-angelogioacchino.delregno@collabora.com


dpi@14014000: Additional properties are not allowed ('ports' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: 'port' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@1401d000: Additional properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

dp-intf@1c015000: clock-names:0: 'pixel' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c015000: clock-names:1: 'engine' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c113000: clock-names:0: 'pixel' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c113000: clock-names:1: 'engine' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

