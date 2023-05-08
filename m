Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97F6FA33E
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 11:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDE910E1C7;
	Mon,  8 May 2023 09:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8021710E1BB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 09:27:19 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6ab087111faso188710a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 02:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683538038; x=1686130038;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DguH7yd98IO9no2ougJQcRCCw8JxeycA5jMXenEALPQ=;
 b=jmn2HuSfsvlNVRtSzH5tUVExYbWKGJfZzv8eRZoNPK3tVz+GnqSf7tDuMthNQDe6Xc
 sUqTMRUQREr1Eaju0xPLU8/5gbWjPUiP/LziN7kpQGWHpCSHApj4oyQ+bCrauLznH6He
 /o+0aTEVk4DaqQQ32Y9+jCcHekkuEIABq5Q/ifGEU7UJi/EqL2fDEfh/KPwmvovnNtwD
 ZKc62m/T3SyfJ56ehSQXUn9qY3hDoVwUTbW3ovhBIAZfjbC2xDCjvZd5iudNWv6uRyw2
 Xg8meRaImV8eBHys7Yk8TTxVqOW+F5fShlPhOG0zSmUOiNKT8ODaEf/h9qBYWO5DcH62
 1Edw==
X-Gm-Message-State: AC+VfDzbPryaFhDmmoDsB927apeKLjytcWnkkye47gbyG82FLQYyJhG3
 zj/KBHbTPTGwUG+2zIVLgA==
X-Google-Smtp-Source: ACHHUZ4aCjwS3clxMxZaGq8mqr3vyeaqLy0a5Z1wm8QlVNY4m6uxyOmhNS1CHyug8eYUUbVMjFrUlg==
X-Received: by 2002:a9d:6443:0:b0:6a1:1bd4:d8c8 with SMTP id
 m3-20020a9d6443000000b006a11bd4d8c8mr4421158otl.26.1683538038151; 
 Mon, 08 May 2023 02:27:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c5-20020a9d6845000000b006aaf62e838dsm1798202oto.53.2023.05.08.02.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 02:27:17 -0700 (PDT)
Received: (nullmailer pid 575486 invoked by uid 1000);
 Mon, 08 May 2023 09:27:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230508083826.1016206-2-victor.liu@nxp.com>
References: <20230508083826.1016206-1-victor.liu@nxp.com>
 <20230508083826.1016206-2-victor.liu@nxp.com>
Message-Id: <168353803230.575435.10408042054525345719.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add BOE
 EV121WXM-N10-1850 panel
Date: Mon, 08 May 2023 04:27:12 -0500
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 08 May 2023 16:38:25 +0800, Liu Ying wrote:
> Add BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
> compatible string.  The panel has a LVDS display interface.
> 
> The panel's product specification can be found at:
> http://www.onetech.com.tw/files/EV121WXM-N10-1850ProductSpecification_20180801.pdf
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Add Krzysztof's A-b tag.
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml

doc reference errors (make refcheckdocs):
Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230508083826.1016206-2-victor.liu@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

