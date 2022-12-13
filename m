Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C702964B692
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEEA10E312;
	Tue, 13 Dec 2022 13:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0497F10E312
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 13:46:39 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id v82so14222444oib.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 05:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JAKfpQI94u4O3fzNRcS1x/zjTFY7SnBfxQhQI8l4qJw=;
 b=ek9eeU048xPMJ1sH4DCWW7/2DVOtKGd3jHBqw2Kt8XcaIFe7374Oj5T2yhnjZAWK8x
 aP9aX7jeWBUs+rkU91MM/xC3QAT6/Yd9bOB8qCrwC7B4aE6YrRfSiSWrvUKp3qJLTdnJ
 b7e6IKZGcpp5Rk51zEcJxOJflUiMq8aVhJJT1tR1DrUIPCuf35QTFjnxUtUI9ABzvDzN
 0/wyI5pf8YnojRrxdFpRJoEnn3Bv5eDF/jptiMxWB7GCT0Pa4YvsXwGsKk4Akgwry9+2
 9dRCb5RNiKnexzWhmYnhaYvswGCrcIHgP5c14BxdcqxSvMNctbpXLJV9U6axPQJnn3mn
 6sZQ==
X-Gm-Message-State: ANoB5pm8mDg+mK0e4kdXLtf/h0HCam+u2p0sUvcEH8aWNdIRm9a6SW1h
 lvQ46D+xGActYG7f81+XQQ==
X-Google-Smtp-Source: AA0mqf7Z6iH0NWdTwB6HrfGWODAGx5AXNddNroS4mQTq1LVQY7eYQiEdrMCfZSGxdHcUDNJGM+v96Q==
X-Received: by 2002:aca:5e06:0:b0:35b:ab3c:cb7f with SMTP id
 s6-20020aca5e06000000b0035bab3ccb7fmr10108028oib.54.1670939193255; 
 Tue, 13 Dec 2022 05:46:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0568301e8200b006708d2cd8bcsm1167616otr.65.2022.12.13.05.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 05:46:32 -0800 (PST)
Received: (nullmailer pid 914671 invoked by uid 1000);
 Tue, 13 Dec 2022 13:46:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
In-Reply-To: <20221213081034.14226-2-cbranchereau@gmail.com>
References: <20221213081034.14226-1-cbranchereau@gmail.com>
 <20221213081034.14226-2-cbranchereau@gmail.com>
Message-Id: <167093911506.912834.5336090745245447936.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Date: Tue, 13 Dec 2022 07:46:32 -0600
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 13 Dec 2022 09:10:34 +0100, Christophe Branchereau wrote:
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/panel/auo,a030jtn01.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221213081034.14226-2-cbranchereau@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

