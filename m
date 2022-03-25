Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E64E7A45
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 19:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787C610E149;
	Fri, 25 Mar 2022 18:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AD010E149
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 18:43:25 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id b188so9066621oia.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 11:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=TD21QR0lMMXUO0nMDIjOEtGgypHb96HYAdoM26wDIGs=;
 b=zB3gCNBPpXL2yHlE6qTc35o2mcLzV9/iQBZuQJOzZPkuAHhX9uZWykmo3dw2stv2qP
 R1vNpZnWd6pmYY0AI0DJU8GGgkPeJbLgysoirhaYiXK2FOdezp9f1joNaDU5HuHSdmIU
 k1z+GmHaBfqAPBMNYkChFewdTla05jiZ7E2AfAFScrnlCJQTxtGYeXCRAmWQUCbKpB2+
 oF1LJs7U50THNx/iNvFSVoKnW52NNU4DU1gXWKkeqVYL7Ax6n3tIkDYWwdby40oMCVI7
 phUObrw/+slTX26YccRhvZ6DsALwg5lVthp27hO28LI8MxtjQpWK0h+eAKeGJLVSaj7T
 N6lg==
X-Gm-Message-State: AOAM531gCxH8O8gzGD3skacM6sNFJQ2p6CBxAdZwRg10LkhYVfVLTkKY
 06RVrhF4MHzom0TPq223mw==
X-Google-Smtp-Source: ABdhPJxRhOXEGGu66qd3lltmMOUhaUE/Q4GESm8rEHbUQJkl8rylAaxB9T48w92FhlgVax8cPtc3MA==
X-Received: by 2002:a54:480b:0:b0:2ef:8e00:155b with SMTP id
 j11-20020a54480b000000b002ef8e00155bmr7912769oij.164.1648233804356; 
 Fri, 25 Mar 2022 11:43:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k4-20020a9d4b84000000b005b2310ebdffsm3052644otf.54.2022.03.25.11.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 11:43:23 -0700 (PDT)
Received: (nullmailer pid 210218 invoked by uid 1000);
 Fri, 25 Mar 2022 18:43:22 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
In-Reply-To: <20220325171511.23493-3-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
 <20220325171511.23493-3-granquet@baylibre.com>
Subject: Re: [PATCH 02/22] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 25 Mar 2022 13:43:22 -0500
Message-Id: <1648233802.138910.210217.nullmailer@robh.at.kernel.org>
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
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, chunfeng.yun@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, tzimmermann@suse.de,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Mar 2022 18:14:51 +0100, Guillaume Ranquet wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1609494

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

