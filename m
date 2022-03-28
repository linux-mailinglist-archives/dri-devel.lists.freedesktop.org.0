Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60F54E96FD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F34D10E43A;
	Mon, 28 Mar 2022 12:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB5410E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:51:08 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-dacc470e03so15065081fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 05:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=YKxyUK+Nou4xViHDx8TkfPYtGoA/VwvXE7HQXU1aq8I=;
 b=H5giTpP5/vIP3dmM2XSvHMBPzhL5qTqfUVII3st5axDKhdNdfhkTE0EPSaVDSa88TE
 hLawT/k/1ZJB7BM0q/ZGLTL5iWJitxPR0ngmSsbiJKtsIAVGesviSxfCAAhLXARXIFta
 QVtS8KnAFaqxPzgjfS6t+wyuAAVs6ze/StYcZc5FeoFmwvUJfkwA/PhiuVuKzpdjbx5h
 IAYGhpNQ4R54Uck9xplTJns9kY+hCzJ2Lycm7FQ5MOZd4kZLkyBM0Q605WQ4WbQ5kUE3
 B6pxcxVReG308qhfPSsYoLt2CmmKklnbNabZLmsD/slFOBxSo9xiOp9jBjgFRmOblzMs
 1Irw==
X-Gm-Message-State: AOAM530iGychJSzD8+eZ57Jekjku0V5uQmBv+lAXk9FG8YZuTz8iqQop
 yVx3eLZV7KGWV8wXnHUwlw==
X-Google-Smtp-Source: ABdhPJx44lE4vp2aYCeZ7I/lyjmousbKuU1sEX5HIWJFpKqkaVPGdwLqNEmBm4TX4iixQSE+3S145A==
X-Received: by 2002:a05:6871:694:b0:dd:a43e:fca4 with SMTP id
 l20-20020a056871069400b000dda43efca4mr15486919oao.77.1648471867780; 
 Mon, 28 Mar 2022 05:51:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y67-20020a4a4546000000b0032476e1cb40sm6811033ooa.25.2022.03.28.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 05:51:07 -0700 (PDT)
Received: (nullmailer pid 2153569 invoked by uid 1000);
 Mon, 28 Mar 2022 12:51:05 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
In-Reply-To: <20220327223927.20848-3-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-3-granquet@baylibre.com>
Subject: Re: [PATCH v9 02/22] dt-bindings: mediatek,
 dp: Add Display Port binding
Date: Mon, 28 Mar 2022 07:51:05 -0500
Message-Id: <1648471865.772251.2153568.nullmailer@robh.at.kernel.org>
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
 kishon@ti.com, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org,
 jitao.shi@mediatek.com, tzimmermann@suse.de,
 Markus Schneider-Pargmann <msp@baylibre.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 00:39:07 +0200, Guillaume Ranquet wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:24:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
   24 |         #include <dt-bindings/power/mt8195-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1609955

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

