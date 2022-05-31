Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA09D5399AE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 00:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EFB10E738;
	Tue, 31 May 2022 22:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4BB10E72A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 22:47:02 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so355684fac.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 15:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=aprzOwmeu9ofv4NArUYUbqpCw1+7K1N79lDMatDRSxY=;
 b=QAXzQ0vB03FcFT/zhgZGAWO4zN3MYHpKC2y+twtcCYb8b7vNmB07TkZ1+lagMpNIsQ
 KHbIgqrVx+sYwG+rRpQxBPVyyvSCLqToKfLF5xofpUU6J6rIDZVE6BRMbeDth+3nCnjG
 9OJB8xZKeXHJiP4wO3X3bdxqIT8qJL5E7gmYPElEwHJj1cgNlck1X9va8JcmGB55y7QW
 TUItJ4J24CzahNupqmI2yppR4n3r+E9B579DihMEDWU6zNQb8ABWBxYWz3hFreGqFA0T
 rEDiqAYkBKh+iYr9mvegdBVqHJKmVu8fnmpg9PXZVENs5no0WtRV4g7WlWHxYYBOdD41
 FYIg==
X-Gm-Message-State: AOAM530nrr+FtO7DjfLI1lBZBfCmt2Pxk9lewea41zQiPth65V9lOg+q
 4yKpBiaV7odGiohsRmP4fgTSax56cQ==
X-Google-Smtp-Source: ABdhPJzrxihBjK98eUTkfRJDT5Ew9e/c5AjwMgz/IhfhSleaQEJbbkcrawGZcg5v4oRO3DRzsYRYvw==
X-Received: by 2002:a05:6870:8985:b0:da:b3f:3253 with SMTP id
 f5-20020a056870898500b000da0b3f3253mr14896611oaq.259.1654037221882; 
 Tue, 31 May 2022 15:47:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bo44-20020a05680822ac00b0032af1c6bf02sm84725oib.45.2022.05.31.15.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 15:47:01 -0700 (PDT)
Received: (nullmailer pid 2476562 invoked by uid 1000);
 Tue, 31 May 2022 22:46:54 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
In-Reply-To: <20220531111900.19422-7-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-7-peterwu.pub@gmail.com>
Subject: Re: [RESEND 06/14] dt-bindings: mfd: Add Mediatek MT6370 binding
Date: Tue, 31 May 2022 17:46:54 -0500
Message-Id: <1654037214.477381.2476559.nullmailer@robh.at.kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com, pavel@ucw.cz,
 alice_chen@richtek.com, lgirdwood@gmail.com, linux-iio@vger.kernel.org,
 broonie@kernel.org, dri-devel@lists.freedesktop.org, sre@kernel.org,
 cy_huang@richtek.com, krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 jingoohan1@gmail.com, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 19:18:52 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/mfd/mediatek,mt6370.yaml         | 282 ++++++++++++++++++
>  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
>  include/dt-bindings/mfd/mediatek,mt6370.h     |  83 ++++++
>  3 files changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
>  create mode 100644 include/dt-bindings/mfd/mediatek,mt6370.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: charger: False schema does not allow {'compatible': ['mediatek,mt6370-charger'], 'interrupts': [[48], [68], [6]], 'interrupt-names': ['attach_i', 'uvp_d_evt', 'mivr'], 'io-channels': [[1, 5]], 'usb-otg-vbus': {'regulator-compatible': ['mt6370,otg-vbus'], 'regulator-name': ['usb-otg-vbus'], 'regulator-min-microvolt': [[4350000]], 'regulator-max-microvolt': [[5800000]], 'regulator-min-microamp': [[500000]], 'regulator-max-microamp': [[3000000]], 'phandle': [[2]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: tcpc: False schema does not allow {'compatible': ['mediatek,mt6370-tcpc'], 'interrupts-extended': [[4294967295, 4, 8]], 'connector': {'compatible': ['usb-c-connector'], 'label': ['USB-C'], 'vbus-supply': [[2]], 'data-role': ['dual'], 'power-role': ['dual'], 'try-power-role': ['sink'], 'source-pdos': [[570527844]], 'sink-pdos': [[570527944]], 'op-sink-microwatt': [[10000000]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: indicator: False schema does not allow {'compatible': ['mediatek,mt6370-indicator'], '#address-cells': [[1]], '#size-cells': [[0]], 'multi-led@0': {'reg': [[0]], 'function': ['indicator'], 'color': [[9]], 'led-max-microamp': [[24000]], '#address-cells': [[1]], '#size-cells': [[0]], 'mediatek,soft-start': [[3]], 'led@0': {'reg': [[0]], 'color': [[1]]}, 'led@1': {'reg': [[1]], 'color': [[2]]}, 'led@2': {'reg': [[2]], 'color': [[3]]}}, 'led@3': {'reg': [[3]], 'function': ['indicator'], 'color': [[0]], 'led-max-microamp': [[6000]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: flashlight: False schema does not allow {'compatible': ['mediatek,mt6370-flashlight'], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'led-sources': [[0]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[1]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}, 'led@1': {'reg': [[1]], 'led-sources': [[1]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[2]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/charger: failed to match any schema with compatible: ['mediatek,mt6370-charger']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/indicator: failed to match any schema with compatible: ['mediatek,mt6370-indicator']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/flashlight: failed to match any schema with compatible: ['mediatek,mt6370-flashlight']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/tcpc: failed to match any schema with compatible: ['mediatek,mt6370-tcpc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

