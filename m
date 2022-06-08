Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FD05431C0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 15:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D18112011;
	Wed,  8 Jun 2022 13:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F0A10FFBF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 13:45:18 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id z197so14689999iof.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 06:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=W8KqLdaB/w/YGRDGH2n8sRCUDF1uSkNdTgkHzNsZwJc=;
 b=6sI5Mwpdtf4S70Zso9v6KXvvvQTE0tJ+Syv3G1tSgTN41KfIT4aV6E2FXGo+16qZ04
 +9+vU+P6IqZIbYvrpY6MhqBQsdDR1evKnzG0moEgVOhO6UVHeNUm9M5Ss1Cj6eQQr6t5
 Z2+Q9VaqFBdjPumnYeig4sMkDRlSf5VA2E5ynOmWuZ1c3lUcSi8XngH5KX7wInox3yaJ
 gEHtQ7O5HW56ltMxptFIGHuBv2/aCBXjUCBq9+vWnTLMFEjW+u5N6N2CG0jOVtEhwZHm
 crWZOG7UYxCeEeqbhWiBDysCtdnMr0SMjKLuBGwV14wYLGzdFzsLHSIxVglQI0I2vPLd
 ld4g==
X-Gm-Message-State: AOAM5337V/XFgCULvHzSBK+LE9GehUVQkZt8hAYQYpgJ3cjnHqA7HlaH
 O9vu1XE+SFy1R8aewtVQwg==
X-Google-Smtp-Source: ABdhPJx5s0ccjVbdJZaMMM/QC0HXDyokEKnHKgCKaaXwNUwaytQlXG9SpY/n8lgwAAdFIB6/yFyxcQ==
X-Received: by 2002:a02:8609:0:b0:330:e92c:2cc4 with SMTP id
 e9-20020a028609000000b00330e92c2cc4mr19375084jai.95.1654695917923; 
 Wed, 08 Jun 2022 06:45:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 cx4-20020a056638490400b0033126faae3asm8080774jab.116.2022.06.08.06.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 06:45:17 -0700 (PDT)
Received: (nullmailer pid 1272086 invoked by uid 1000);
 Wed, 08 Jun 2022 13:45:07 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220608043852.4980-4-rex-bc.chen@mediatek.com>
References: <20220608043852.4980-1-rex-bc.chen@mediatek.com>
 <20220608043852.4980-4-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v5 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Wed, 08 Jun 2022 07:45:07 -0600
Message-Id: <1654695907.376302.1272085.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, pavel@ucw.cz,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Jun 2022 12:38:52 +0800, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:71.40-41 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

