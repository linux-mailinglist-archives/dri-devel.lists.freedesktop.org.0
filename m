Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7394402B17
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 16:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078289950;
	Tue,  7 Sep 2021 14:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49F189915
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 14:51:49 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso13113398otu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 07:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K9C/kpdJSeTdk8CqRsAWClMUWdhDIHFpApAyFUpF2cQ=;
 b=RJwtrQWqOK/V+5oq7X8BCkU+nBYda7R3Fv5olqPqvV4a6B4cO9uHgpnUkNW0dzcfxE
 2quRbe3+/9h9Nfgbo5Db6axN3URQtJd9OA+kOgYobULDNNLo7txjLtbg+fTKrjv6QqFL
 BuuKaSrbUxt/h0oWeJTcP0RK+8zIEvXG3CrKFdia0i99LcjU/Mv8+bTWjB0UCpp/Qbgt
 hn3Sn0etGdxH4hw4Qt1gFADS9xhIQlE5VX1XtUAdH/h6zCd/mM5Fu8x8NZ0JIiPnkF/U
 V5EzDaQPc5OC/bHM/RbHZRQqS5UohysBLMPcQtMUs+2mx1f9lXsfQwDufLP0xsAz1BhC
 wsKg==
X-Gm-Message-State: AOAM530XaVfmtDVlw+YFY6XJKwm+ZYYfWwZNkSpU7vQc27Tk/9yhQmlB
 hB50szBoLWkXMY4yb29ODA==
X-Google-Smtp-Source: ABdhPJy/y9KHvC7bV7t4BanxnDIknT6RYDMbRM9hh+0+KhTh72koKcnANQlNWDO/8dqBciBXZJaQGw==
X-Received: by 2002:a05:6830:3144:: with SMTP id
 c4mr14826951ots.153.1631026308866; 
 Tue, 07 Sep 2021 07:51:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s17sm2436686otr.51.2021.09.07.07.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 07:51:48 -0700 (PDT)
Received: (nullmailer pid 3958450 invoked by uid 1000);
 Tue, 07 Sep 2021 14:51:44 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org,
 CK Hu <ck.hu@mediatek.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jitao shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20210907083723.7725-5-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-5-granquet@baylibre.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Date: Tue, 07 Sep 2021 09:51:44 -0500
Message-Id: <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
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

On Tue, 07 Sep 2021 10:37:21 +0200, Guillaume Ranquet wrote:
> Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 46 +++++++++
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 99 +++++++++++++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1438: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1525170

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

