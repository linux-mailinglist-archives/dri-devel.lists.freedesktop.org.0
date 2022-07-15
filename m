Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F139B576EC0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967CC10F2B9;
	Sat, 16 Jul 2022 14:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522D610E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 14:48:39 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id y9so537787qtv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 07:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=03wcnwqW6SswNVSW3NYFh+nPKkFyDcywCPMc3nrTTzo=;
 b=6ewBe4WdcUfQZ6E2CICRlwLi95tJstZXZF/EnN+oe3nPEpLOzs36bTyT60xr6CiofM
 npRdmSeQJAWMwxYpZn0Ry+PXuVPSBu5cDnGYbSvmWxlfaV6IMSula6cODnPJyEe03YtD
 VeWtQ7EOcz2U9NR2tZKlkqofAd5T9Lu+6oHlYBDfm36TccLCyyB5kz+QVc8Svo05tKmZ
 jJ7r/+gK22X6wW1Unuq6OnO2AE3/dXzi6Mz+BOyaFswuEgz8vbk8vqLZ+83fQp1X4SHc
 nEowGo5p2Ai54WF5lJtpAeZd0MZknSi9c6HofIH/9yR+WD2JLEO85Uewo+4CsTQcOUhd
 3AmA==
X-Gm-Message-State: AJIora81UHypuYmOBJPtoSgWV1TYylzs12UQyVBdAj5lyPtgnrwxI7wG
 D/Ig5tpR3EfCsBx3Adq9tn3IlS7rlg==
X-Google-Smtp-Source: AGRyM1uzHWN8yj4iBWno2bNl4tSBHdD45HjKJL19BAJUQTQyoHWpBthV9k3/tF7H+HVOqQ0U4hzPtA==
X-Received: by 2002:a02:ac0a:0:b0:33f:713a:9589 with SMTP id
 a10-20020a02ac0a000000b0033f713a9589mr7633647jao.289.1657892580691; 
 Fri, 15 Jul 2022 06:43:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a92dd87000000b002dc789a3dddsm1703976iln.5.2022.07.15.06.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 06:43:00 -0700 (PDT)
Received: (nullmailer pid 520291 invoked by uid 1000);
 Fri, 15 Jul 2022 13:42:55 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-7-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-7-peterwu.pub@gmail.com>
Subject: Re: [PATCH v5 06/13] dt-bindings: mfd: Add MediaTek MT6370
Date: Fri, 15 Jul 2022 07:42:55 -0600
Message-Id: <1657892575.865405.520290.nullmailer@robh.at.kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, szunichen@gmail.com, chiaen_wu@richtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, sre@kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Jul 2022 19:26:00 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add MediaTek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
>  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
>  2 files changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator:multi-led@0:led@0: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator:multi-led@0:led@1: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator:multi-led@0:led@2: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: indicator: multi-led@0:led@0: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: indicator: multi-led@0:led@1: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: indicator: multi-led@0:led@2: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

