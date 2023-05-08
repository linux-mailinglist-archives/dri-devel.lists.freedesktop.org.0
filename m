Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 116AA6F9FD2
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 08:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE2C10E11A;
	Mon,  8 May 2023 06:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FBF10E11A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 06:26:59 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-196035d9d28so655007fac.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 23:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683527218; x=1686119218;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zA2dOrgpR+LAShw4lI3fM62PxuKc8EjiFypsxPezBTE=;
 b=Nz1Ajmy+5PKawxjL2jUJI+P0Bfruup1L/m5jqZbmpaemet3kxBnHHtDDdq2HeP87Fy
 Rza+bWk0iG8ZTxM4tCNER23836qtK+bDHQMBsKyxvTsmMNvESa4ATQ9rEsdzbPl0GGQf
 +ZhcyCVh0dWjb6dm5QGUUsEdt53W+5c7AKnddYtpV32dfLhmtNoI4mNngZAFviKSWPp9
 kHwx8AcKxvpalxbSy57yuAZHckj3qqt4gBH7PNxGxiLT17yMYiuBUbUnDRg+L0hLxeH3
 gxVnH3/q3fLiC9FuR6AZZo+K807GQyUWwMtQYqNX8EdgBNyC1ncAUN2qqOJUQuX9RzVM
 fVhw==
X-Gm-Message-State: AC+VfDzOU9maYSVeizgVh/NWUrwN5kKO4l6rzbd7GDJMmB4kl11TawVZ
 Fkb9oU099cLMhwMOEwoldA==
X-Google-Smtp-Source: ACHHUZ79sO6V/lar1ARUIsYqRQiGqHQtNQzJC5YOgirC6ArGbU6WU1wCuu4pynsdBPC15daXAVoiyw==
X-Received: by 2002:a05:6870:2201:b0:192:b536:259 with SMTP id
 i1-20020a056870220100b00192b5360259mr4424969oaf.19.1683527218009; 
 Sun, 07 May 2023 23:26:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a19-20020a056870e35300b0018456166c7asm4635438oae.39.2023.05.07.23.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 23:26:57 -0700 (PDT)
Received: (nullmailer pid 213417 invoked by uid 1000);
 Mon, 08 May 2023 06:26:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230508055740.635256-2-victor.liu@nxp.com>
References: <20230508055740.635256-1-victor.liu@nxp.com>
 <20230508055740.635256-2-victor.liu@nxp.com>
Message-Id: <168352721348.213381.2072764987425735233.robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Mon, 08 May 2023 01:26:53 -0500
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 08 May 2023 13:57:35 +0800, Liu Ying wrote:
> There is one LCDIF embedded in i.MX93 SoC to connect with
> MIPI DSI controller through LCDIF cross line pattern(controlled
> by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
> directly or connect with a parallel display through parallel
> display format(also controlled by mediamix blk-ctrl).  i.MX93
> LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
> tree binding for i.MX93 LCDIF.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * No change.
> 
> v3->v4:
> * Add Alexander's R-b tag.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * Add Krzysztof's A-b and Marek's R-b tags.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml

doc reference errors (make refcheckdocs):
Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230508055740.635256-2-victor.liu@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

