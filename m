Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154AD530EAD
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 14:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04710EE44;
	Mon, 23 May 2022 12:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33D010EA8D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:33:35 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-e5e433d66dso18231842fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 05:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=X6MWkN+MXwESjJ8VLjim2DGGoViFUAGh9+IlVSr0qvY=;
 b=qetDP2/O+dZ+lo6KmqKwOs8ewmOpzBOrrsEjHGWkZxKBF8o4sLMpGEEB4CrIdOWtxh
 wzR/i8Kiq5KkGo7lR2EV5pKu2AzQbia++uY4DCt2SfGadCxr1A1jxgPD83rzWPdGWI0e
 uW0OWHY6bKE7rIbLO6Y6rcIn843DXTufIhNgFqfmQGRQRRrpr930HZp1szC5oPDTBV0l
 owwPmdoA8vl7TecXxKh4ajng9SQkm6EKL+2pi15zQRkt3txKnfMXeZI7OM2pOhi7FIGd
 CUdGT7uOoAv/ndnIYRrXQSq6ZdKef8rx3GWfAQBD1uSIp7brYtV5Sostus/SxxhRMbRy
 VSOA==
X-Gm-Message-State: AOAM5303AF1WoBNR0qi7m1u4jvNp/5qbFaHVsMozPgxb97uSoxdQSDFu
 cFFFxi7WM33qnIm28Uhl4g==
X-Google-Smtp-Source: ABdhPJwOO+O7zT8r+lLhmyii8LgBtwlqTtnM90LxBsJkZOoKNqifzuh0NKNv8CMKNI9UWvO60BSKmA==
X-Received: by 2002:a05:6870:d581:b0:f1:82de:958c with SMTP id
 u1-20020a056870d58100b000f182de958cmr12298708oao.27.1653309214834; 
 Mon, 23 May 2022 05:33:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z1-20020a9d7a41000000b0060603221264sm3898554otm.52.2022.05.23.05.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 05:33:34 -0700 (PDT)
Received: (nullmailer pid 1378078 invoked by uid 1000);
 Mon, 23 May 2022 12:33:31 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
In-Reply-To: <20220523104758.29531-2-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-2-granquet@baylibre.com>
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,
 dpi: Add DPINTF compatible
Date: Mon, 23 May 2022 07:33:31 -0500
Message-Id: <1653309211.141261.1378077.nullmailer@robh.at.kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Helge Deller <deller@gmx.de>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, devicetree@vger.kernel.org,
 Jitao shi <jitao.shi@mediatek.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 May 2022 12:47:34 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DPINTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DPINTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


dpi@14014000: Additional properties are not allowed ('ports' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: clock-names: ['pixel', 'engine', 'pll'] is too short
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: clocks: [[59, 26], [59, 27], [3, 6]] is too short
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb

dpi@14014000: clocks: [[61, 26], [61, 27], [3, 6]] is too short
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi'] is too long
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

dpi@1401d000: clock-names: ['pixel', 'engine', 'pll'] is too short
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

dpi@1401d000: clocks: [[57, 40], [57, 41], [8, 8]] is too short
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

dpi@1401d000: clocks: [[68, 40], [68, 41], [8, 8]] is too short
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb

