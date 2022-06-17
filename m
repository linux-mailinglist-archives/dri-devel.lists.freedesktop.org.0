Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4175F550014
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 00:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37010EBB5;
	Fri, 17 Jun 2022 22:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FA510EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 22:43:34 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id d123so5882156iof.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 15:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Zh/0Zx5VR9OkdNl9GEaMHnSoW3UuL0RxbuRlgNOyx3U=;
 b=Iez8jd2dxxH9vWHui1mZnUAFwBqDRrw82I+3RCvYLXti5RryOl9K+IEJ7kT4xr9CgR
 NRdKP9l8nvubUPxObHknbtRaAAhdbZ470iqgp6DwDZgVVlFxvtIVsDHc9DqRWTP/whW8
 PChgu7Tbx83xdxd/RP0ihV78Xza4yRRHOFGay2/sBDawFGWdI1j85NAG+2NnxBzqAQdH
 a6Mzq0Ola5mwXUoHsyJDpidu4AWE1cFeFGT56FbGn+h8EADgda2yc/7kfTpNUnbM/usY
 IsFUP0LZAXfIvQxgV9SaAEFJ7RtkD1ro2YnmbwRGm6y2rR8ePWKJxjHfh27dPNt+3teP
 VIUg==
X-Gm-Message-State: AJIora/EwSuveM5crv9wCaCHceLFGgvjMerioYm/IL27vIf5Fq4Hn9A1
 Bvsci6QXdgD3RaKx9PQO7Q==
X-Google-Smtp-Source: AGRyM1tvyT1XZEsULmIOGU/hr9lRpu/t3yqYEU1/GhEsnQese2mFTYGyCi7NOLnTQaaRUC8jarJyVw==
X-Received: by 2002:a05:6638:d8c:b0:332:15ef:657f with SMTP id
 l12-20020a0566380d8c00b0033215ef657fmr6523987jaj.146.1655505814198; 
 Fri, 17 Jun 2022 15:43:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a023b5a000000b0032b3a781781sm2734205jaf.69.2022.06.17.15.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 15:43:33 -0700 (PDT)
Received: (nullmailer pid 2574515 invoked by uid 1000);
 Fri, 17 Jun 2022 22:43:32 -0000
Date: Fri, 17 Jun 2022 16:43:32 -0600
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
Message-ID: <20220617224332.GA2570673-robh@kernel.org>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-7-peterwu.pub@gmail.com>
 <1655127197.567546.3564136.nullmailer@robh.at.kernel.org>
 <CABtFH5JPu5tOg4wGJf5ay1-NJHLcPTK4XxADGTksHW1-6wjMRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtFH5JPu5tOg4wGJf5ay1-NJHLcPTK4XxADGTksHW1-6wjMRQ@mail.gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, szunichen@gmail.com,
 pavel@ucw.cz, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>, linux-mediatek@lists.infradead.org,
 jic23@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 07:15:49PM +0800, ChiaEn Wu wrote:
> Hi Rob,
> 
> Rob Herring <robh@kernel.org> 於 2022年6月13日 週一 晚上9:33寫道：
> >
> > On Mon, 13 Jun 2022 19:11:37 +0800, ChiaEn Wu wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add Mediatek MT6370 binding documentation.
> > >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > >  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
> > >  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
> > >  2 files changed, 297 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > ./Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: backlight: False schema does not allow {'compatible': ['mediatek,mt6370-backlight'], 'mediatek,bled-channel-use': b'\x0f'}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: charger: False schema does not allow {'compatible': ['mediatek,mt6370-charger'], 'interrupts': [[48], [68], [6]], 'interrupt-names': ['attach_i', 'uvp_d_evt', 'mivr'], 'io-channels': [[1, 5]], 'usb-otg-vbus-regulator': {'regulator-name': ['mt6370-usb-otg-vbus'], 'regulator-min-microvolt': [[4350000]], 'regulator-max-microvolt': [[5800000]], 'regulator-min-microamp': [[500000]], 'regulator-max-microamp': [[3000000]], 'phandle': [[2]]}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: tcpc: False schema does not allow {'compatible': ['mediatek,mt6370-tcpc'], 'interrupts-extended': [[4294967295, 4, 8]], 'connector': {'compatible': ['usb-c-connector'], 'label': ['USB-C'], 'vbus-supply': [[2]], 'data-role': ['dual'], 'power-role': ['dual'], 'try-power-role': ['sink'], 'source-pdos': [[570527844]], 'sink-pdos': [[570527944]], 'op-sink-microwatt': [[10000000]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator: False schema does not allow {'compatible': ['mediatek,mt6370-indicator'], '#address-cells': [[1]], '#size-cells': [[0]], 'multi-led@0': {'reg': [[0]], 'function': ['indicator'], 'color': [[9]], 'led-max-microamp': [[24000]], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'color': [[1]]}, 'led@1': {'reg': [[1]], 'color': [[2]]}, 'led@2': {'reg': [[2]], 'color': [[3]]}}, 'led@3': {'reg': [[3]], 'function': ['indicator'], 'color': [[0]], 'led-max-microamp': [[6000]]}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: flashlight: False schema does not allow {'compatible': ['mediatek,mt6370-flashlight'], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'led-sources': [[0]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[1]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}, 'led@1': {'reg': [[1]], 'led-sources': [[1]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[2]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: backlight: mediatek,bled-channel-use: b'\x0f' is not of type 'object', 'array', 'boolean', 'null'
> >         From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/backlight: failed to match any schema with compatible: ['mediatek,mt6370-backlight']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/charger: failed to match any schema with compatible: ['mediatek,mt6370-charger']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/indicator: failed to match any schema with compatible: ['mediatek,mt6370-indicator']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/flashlight: failed to match any schema with compatible: ['mediatek,mt6370-flashlight']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/tcpc: failed to match any schema with compatible: ['mediatek,mt6370-tcpc']
> >
> 
> Before we submitted these patches, we had already checked by running
> this command below,
> "make DT_CHECKER_FLAGS=-m dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml".
> But we could not find any errors like your error msg after the checking process.
> 
> Our mfd dt-binding patch is dependent on "backlight dt-binding",
> "charger dt-binding", "tcpc dt-binding", "indicator dt-binding" and
> "flashlight dt-binding" patches.
> Would you please apply them before you check mfd dt-binding patch?

That is what is done. Not sure what happened here though.

Rob
