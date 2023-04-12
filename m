Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 505866E004C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB2110E1BC;
	Wed, 12 Apr 2023 21:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D161B10E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:03:47 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 x22-20020a9d6296000000b006a42c37ddcdso877150otk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333426; x=1683925426;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TfFMpWgQMG0IdQ2eBeXK2Tul1Mki7+boKfuvZh6DHJo=;
 b=UfwWuNFb1dTum8mQkUixGhqWaKROBpZzmGVF05b4GPPeWGObFh4k0MeK1Xz0V8dY4t
 F+3BVbhnoPpuGMjD/nzitqU5FJ2xI/v7bJAyDUwSZL+QlZ36+yia01rwUuxixhMzmFs7
 io+Xh03PvK/p0RacIjmAaNsd7UyiaKGYls7g9LdlEwCSRYPnd//mimKSO0tVqEcCrANN
 d/VxqqORXZOAw+rAKlHw5cWJZzBgBdVKnJiFqZymlqm+JJCP8exvc3gQtNOwGTlqs37M
 ych+dtzKTpt0b0x2KSsIwatonwWRUgmVl+V5LFsx6aRnyAh+lM3q7qLinSId2OGmIx5q
 N3Dg==
X-Gm-Message-State: AAQBX9cs/yGo2vqYxGiaiEqrvjJcsQ/d62OL4YicrkImQVq0SjTGn7JU
 y29MSaq3GrsbqCcrS7rYtA==
X-Google-Smtp-Source: AKy350YLhEpo7rXHjTV6gXj47sYFzm89X6rddWa9+uaqMiDd86/UG5bnCUKz49WwfP/Noj0SnCMTXg==
X-Received: by 2002:a05:6830:1d78:b0:69f:a557:fa01 with SMTP id
 l24-20020a0568301d7800b0069fa557fa01mr7090154oti.9.1681333426607; 
 Wed, 12 Apr 2023 14:03:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l10-20020a0568301d6a00b006a14579a8besm41057oti.43.2023.04.12.14.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:03:45 -0700 (PDT)
Received: (nullmailer pid 3200526 invoked by uid 1000);
 Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
Message-Id: <168133318912.3190428.16120880490622098945.robh@kernel.org>
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
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
 devicetree@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 phone-devel@vger.kernel.org, xinlei.lee@mediatek.com, kishon@kernel.org,
 kernel@collabora.com, jassisinghbrar@gmail.com, u.kleine-koenig@pengutronix.de,
 chunfeng.yun@mediatek.com, linux-pwm@vger.kernel.org, jitao.shi@mediatek.com,
 houlong.wei@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 13:27:13 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-2-angelogioacchino.delregno@collabora.com


pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb

pwm@1400a000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

