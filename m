Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0F4362F9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E899D6EC6B;
	Thu, 21 Oct 2021 13:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735A66EC6B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:30:12 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 w12-20020a056830410c00b0054e7ceecd88so447153ott.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 06:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0zF0CVmeaIG2Lt62vaRjUU2fLmKXJyBGdl9zYadt9rk=;
 b=aHHzuw4nLcy6zz8qy946jFHEwUuCNgIRX/uT/EVbJLOTCzgH19binn9hFvKsL7NJuw
 8dUp6SboShD2xTcHb4H+REp7KCUp422PiBqpmNHy0mqMlQQtlaHgBLpSME0gMDtqQqZX
 1nDJTaGR1JtXLQAnaOSpSi+xH4nLn44C2j6WwSWTTNJq+oy98wDuP4yGM+xatSADOmvG
 GIn2FI1aPhdXIgGLjwd093OnOh+uORlMtT9YWTWlSIOMuJchWTfkM4LldzA9xxH16pIG
 on/ZuWoIIvtbUHZdOJszGu+bHpb1+jOanLOmOtZJonFqWe5M5ZBbiI5oZLG6pFO+pUaV
 P+iw==
X-Gm-Message-State: AOAM533lhJNQW+X+iUB8AuP4jS7LJ3rZZjEfCSdCO6GVJheFOQxK3XqL
 unPdcLo1Br5l4xW+dWg6Qg==
X-Google-Smtp-Source: ABdhPJzRAjLuHwIJ9mvQFOPzhmIpXAT6cNcKlAhYHOhqHGtrndKW6FroqvYm4rd8UFGr80VHBXiICA==
X-Received: by 2002:a9d:764c:: with SMTP id o12mr4966078otl.129.1634823011712; 
 Thu, 21 Oct 2021 06:30:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t8sm1070167otc.74.2021.10.21.06.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:30:10 -0700 (PDT)
Received: (nullmailer pid 353184 invoked by uid 1000);
 Thu, 21 Oct 2021 13:30:05 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org
In-Reply-To: <20211021092707.3562523-2-msp@baylibre.com>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-2-msp@baylibre.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Thu, 21 Oct 2021 08:30:05 -0500
Message-Id: <1634823005.130125.353182.nullmailer@robh.at.kernel.org>
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

On Thu, 21 Oct 2021 11:27:01 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v4 -> v5:
>     - Newly created patch after realizing that the specific clocks for dpintf were
>       the same as engine and pixel clocks.
> 
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1544237


dpi@14014000: Additional properties are not allowed ('ports' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@14014000: compatible: Additional items are not allowed ('mediatek,mt2701-dpi' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@14014000: compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi'] is too long
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@14014000: 'port' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@1401d000: Additional properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml

