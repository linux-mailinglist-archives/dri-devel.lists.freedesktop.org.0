Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C059652218
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 15:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D939510E03F;
	Tue, 20 Dec 2022 14:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89AC10E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 14:10:14 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id t62so10621622oib.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 06:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q75TNysuWYdbrSwdpHQtu6i6oJmeIz4E8jf1765dsqs=;
 b=12GVHckezWNOKcaZFp7RwY8q2wm1McVV4XEdUxlYETm/tfXVn9A7Ag7UtIrHsLshh5
 K9Q4dOxA6sWOA4LUKtuvFpChYNdEpTFNBKZwbyLEdi1CHX4+RjSj9nydMBJag/bjJhEG
 j04jSkGwtR4x3DmP1DKtS7lUYALeopfTuaTbMaCFodRdAsurAS28xjPfU7euq+3Wuigz
 +FrxzEVHZWu6an5wOPEQRTj/cAQ2uReZK4+g6h5JOM8vM2wFhRKIuruXVoohOPkbVXuD
 rvrSTrA98K9HsXtrUHbGidJVsGo9MXMSK+gfxH55rAOARz+drFw3Fy0pvHSj9czT/DgL
 XrmA==
X-Gm-Message-State: ANoB5plEEgEL9Bjk+GX+t9u9Nd5h2bnbHBWUAscwffypXTBrdachdV6N
 oU5nvXfOHrh8telurxurTw==
X-Google-Smtp-Source: AA0mqf7YKNW87OKBXduuqmn4LNzeBskcnSsOxdV/gztUOSashZWYlk7FGwyb/DE5yS4klj4E0qhqlA==
X-Received: by 2002:a54:4701:0:b0:35e:bb7f:81b1 with SMTP id
 k1-20020a544701000000b0035ebb7f81b1mr11312413oik.6.1671545413112; 
 Tue, 20 Dec 2022 06:10:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 be4-20020a056808218400b0035418324b78sm5556714oib.11.2022.12.20.06.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 06:10:12 -0800 (PST)
Received: (nullmailer pid 226277 invoked by uid 1000);
 Tue, 20 Dec 2022 14:10:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
In-Reply-To: <20221220120108.481554-3-cbranchereau@gmail.com>
References: <20221220120108.481554-1-cbranchereau@gmail.com>
 <20221220120108.481554-3-cbranchereau@gmail.com>
Message-Id: <167154529027.200950.10451078081499230843.robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Date: Tue, 20 Dec 2022 08:10:10 -0600
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 20 Dec 2022 13:01:08 +0100, Christophe Branchereau wrote:
> From: Paul Cercueil <paul@crapouillou.net>
> 
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/panel/auo,a030jtn01.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dts:22.11-21: Warning (reg_format): /example-0/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221220120108.481554-3-cbranchereau@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

