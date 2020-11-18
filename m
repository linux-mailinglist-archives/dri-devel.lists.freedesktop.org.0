Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A92B8686
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 22:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B911789F71;
	Wed, 18 Nov 2020 21:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D653889F71
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 21:23:41 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t16so3838219oie.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VwNLniwC05uRP38qLvBvwBl3DAlw0ptrgVFyzGmX8aE=;
 b=DTQAcD3ZINODmfHloBm0OFn7uHHSe6P5Kfk1xCNTi4/ErRMLbjDx2tXetCHbcaaJHh
 QdwebmtkoekaLbOEmiyO5WHcQEjlAbI4AbdzPCazTdVy7i388ydApETN9PbPNMHgr4pb
 IV908lpKkcaT4kFclcxgDznveR5BSy8ttN6RdjueGBc4OKlLnHc0Q9JP6zPwYbSZaomM
 XRLRKfmId+lfcUPmoKJWDKeVCmU/tDHw7hDqy5d8vTqSzlobNvY53T6TgSxfCK9CXRfA
 HOcBnvHxboNhsgUmTe5Mq9FHEcC6s0CihTpVcUYKiQSG5RtNqAGX405Aj0fBvsYjIdY/
 G8lg==
X-Gm-Message-State: AOAM532du4A/oC904H0rsDMvZtAcNtQOXFqmB3NGJ1OXIMNexEImjqKt
 /GIEmFRAnlV75zN0uWKI8g==
X-Google-Smtp-Source: ABdhPJxGFTjxG7CJuPxoqdLsQg9S19jIx83S+QcoWMEsUa1EVmhqHhY1J3hxYWHsPEsETeEM72gnGg==
X-Received: by 2002:aca:c502:: with SMTP id v2mr728700oif.93.1605734619925;
 Wed, 18 Nov 2020 13:23:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u138sm8120293oie.33.2020.11.18.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:23:39 -0800 (PST)
Received: (nullmailer pid 1839273 invoked by uid 1000);
 Wed, 18 Nov 2020 21:23:37 -0000
Date: Wed, 18 Nov 2020 15:23:37 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: usb: convert usb-device.txt to
 YAML schema
Message-ID: <20201118212337.GA1838662@bogus>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Min Guo <min.guo@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Nov 2020 16:21:16 +0800, Chunfeng Yun wrote:
> Convert usb-device.txt to YAML schema usb-device.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. remove $nodenmae and items key word for compatilbe;
>   2. add additionalProperties;
> 
>   The followings are suggested by Rob:
>   3. merge the following patch
>     [v2,1/4] dt-bindings: usb: convert usb-device.txt to YAML schema
>     [v2,2/4] dt-bindings: usb: add properties for hard wired devices
>   4. define the unit-address for hard-wired device in usb-hcd.yaml,
>      also define its 'reg' and 'compatible';
>   5. This series is base on Serge's series:
>     https://patchwork.kernel.org/project/linux-usb/cover/20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru/
>     [v4,00/18] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v2 changes suggested by Rob:
>   1. modify pattern to support any USB class
>   2. convert usb-device.txt into usb-device.yaml
> ---
>  .../devicetree/bindings/usb/usb-device.txt    | 102 --------------
>  .../devicetree/bindings/usb/usb-device.yaml   | 125 ++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  33 +++++
>  3 files changed, 158 insertions(+), 102 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.example.dt.yaml: usb: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.example.dt.yaml: usb: dwc3@34000000:compatible:0: 'snps,dwc3' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: #address-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: dwc3@a600000:compatible:0: 'snps,dwc3' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff400000:compatible:0: 'amlogic,meson-g12a-usb' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff400000:compatible: ['amlogic,meson-g12a-usb', 'snps,dwc2'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff400000:compatible: Additional items are not allowed ('snps,dwc2' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff500000:compatible:0: 'snps,dwc3' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb2-phy.example.dt.yaml: usb-controller: phy@0: 'compatible' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb2-phy.example.dt.yaml: usb-controller: phy@1: 'compatible' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb2-phy.example.dt.yaml: usb-controller: phy@2: 'compatible' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3ss-phy.example.dt.yaml: usb-glue@65b00000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3ss-phy.example.dt.yaml: usb-glue@65b00000: ss-phy@300:compatible:0: 'socionext,uniphier-ld20-usb3-ssphy' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3hs-phy.example.dt.yaml: usb-glue@65b00000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3hs-phy.example.dt.yaml: usb-glue@65b00000: hs-phy@200:compatible:0: 'socionext,uniphier-ld20-usb3-hsphy' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml


See https://patchwork.ozlabs.org/patch/1402017

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
