Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD6548570
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 15:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719AC10E7C3;
	Mon, 13 Jun 2022 13:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007D410E7C3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:33:22 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id y17so4232124ilj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=n5jciRFgHV7TEd2xOcxd5PlRxTUMR+//Y01eSUV2T1g=;
 b=Hj4xt2oDMmCZuQRzsPyVRgf72H59ZUbAE4UWDtgKdhEomRg3gJcJcletLiI2iaXo67
 oYsIuNzA0xox5veXK83WPo22Bv1GMyskz6HyZ3szWQliXUo/kX90XYpAHsKMv11Fq7qn
 ysr64eQBf33Dhf6aWFTGHSJfpc29VRJFlx4jnJHQlbIAYfjCTMKT0xroWOkCk3E9GXdv
 tl6RvLtADzqUZGKI6enm4BWkaW6YdPUjKUXTXjVc2Ys5AK3yACsxbVHRjClE8epbDH/j
 ngpGow6mkrmbOq+LxhVjPEkfS+VVCi8j3AAAvAVTcGL08xpNeAWYcnLscJ/q+gut7ArI
 8GyA==
X-Gm-Message-State: AOAM531JW/e/AriVyAp9kM6RuQatToz2P0MVx2XHhyBNVPl8p4HkiCeh
 KpMQ/Ri9vfXs8UvGXsjkPg==
X-Google-Smtp-Source: ABdhPJwPF2UYqCLy0MjugVo/d0pZuzKLj39QY8kf66rRczmdaVGt+15ynEKyrpTTZPzJBoKuuGYMHw==
X-Received: by 2002:a05:6e02:1b04:b0:2d1:af55:eb92 with SMTP id
 i4-20020a056e021b0400b002d1af55eb92mr33611511ilv.227.1655127201997; 
 Mon, 13 Jun 2022 06:33:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a02ca02000000b0032e79d23f8fsm3510831jak.156.2022.06.13.06.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 06:33:21 -0700 (PDT)
Received: (nullmailer pid 3564135 invoked by uid 1000);
 Mon, 13 Jun 2022 13:33:17 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220613064841.10481-2-rex-bc.chen@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v11 01/12] dt-bindings: mediatek,
 dpi: Add DP_INTF compatible
Date: Mon, 13 Jun 2022 07:33:17 -0600
Message-Id: <1655127197.559996.3564134.nullmailer@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 14:48:30 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> In this patch, we also do these string replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dtb: dpi@1401d000: clocks: [[4294967295, 40], [4294967295, 41], [4294967295, 8]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dtb: dpi@1401d000: clock-names: ['pixel', 'engine', 'pll'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

