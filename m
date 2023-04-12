Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89766E005B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FF210E982;
	Wed, 12 Apr 2023 21:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA010E979
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:03:55 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id z16so8350881oib.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333435; x=1683925435;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+Q95Knbpjeo78pZINMZAvNZ8f1W6NvaHbQpZHgZ+DhU=;
 b=L06Z4nzpiBmzsK5PrkiNbxJU4Uu8M+xfidEbQNUxtNfNVlZ2F5Nd8wmBEczzU1Lab3
 QvslbuT/9ZBLlXv7fTksApU66hZT1xYrAIu5LDj7lD4gv5h8QpD39HNYq7HsvJdq8iof
 JgiO6cJ3vQ2Wtks8Gdx/3VR2bHpXTU5pRHX0xl3P3Db8JsMLdpwVhehAfw1/0qXGRBPC
 1V8awoCtCcFqRud+HvnZ7FGB1/r0afxY95WGgKHZQNz44twurMpSWXsROqza+lB8Y/I2
 ceb+ca4iCQypEAy9cMARpgcOScv2EDm4yPhKcgWDCnGF0SnuorIHMiDQ3a89OqeiKtox
 B2tA==
X-Gm-Message-State: AAQBX9eQm6r1lmjxV+qQjkpS7gjMD0FCX2M7/T57upPfe3xymoq1/8tY
 tE2tE+JzdTgiQBg0BhO3eg==
X-Google-Smtp-Source: AKy350ZAQUKENqZQK/BkT1GzRkK8etcW3v2rWKWM1oDiBBATLa6RSgxvv4SclTk2dvtCGsASeNojAw==
X-Received: by 2002:a05:6808:4b:b0:387:12e5:543a with SMTP id
 v11-20020a056808004b00b0038712e5543amr7422991oic.29.1681333434837; 
 Wed, 12 Apr 2023 14:03:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i128-20020acaea86000000b00386eff32f58sm7148418oih.13.2023.04.12.14.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:03:54 -0700 (PDT)
Received: (nullmailer pid 3200537 invoked by uid 1000);
 Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319583.3191294.4759319842761199183.robh@kernel.org>
Subject: Re: [PATCH 09/27] dt-bindings: display: mediatek: color: Add
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, phone-devel@vger.kernel.org, kishon@kernel.org,
 kernel@collabora.com, jassisinghbrar@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-pwm@vger.kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 chunkuang.hu@kernel.org, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, houlong.wei@mediatek.com, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 13:27:21 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's COLOR block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-10-angelogioacchino.delregno@collabora.com


color@1400b000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

