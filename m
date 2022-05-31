Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894C5399A7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 00:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDB510E720;
	Tue, 31 May 2022 22:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEC410E720
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 22:46:58 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-f314077115so405130fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 15:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AE9Fbrj6BPIXSH+6mmzzM5HJbPbBIVW+lbxzy622FhY=;
 b=KlzBhEZJc6Y1Q5z9Eqa6IkNkhNTA0PY3dHIJyjpfKV5VyQf7GFto7mL27Hf5TTLL4W
 xsp5SRCAemoBKlZXavaBkm7bvpShpJNpTEOG3IYqT6aTiPhzQ1rQt5mTaaL/J/ey534G
 PQXQYfrgPkwRMBjC+AzEAzillI5ErdtlcOC7/ZTG4F9wj5olKNqWt7XKdKBvSyUR+nor
 iGe+MeJ+WvgUFEm0Il0c5tpSqO+TPVYctQmSvCyQLAMniy72scdqjQPCvJMP2Se06BR8
 SUPEfohoLJR/25RTk2a3lXzIYUM9WSZERlyBs/+Dk8a9DepDVB8sUCnkO3JwibAjaywy
 ZAyg==
X-Gm-Message-State: AOAM533+2/GhUiHjkfmQ4tAIssm5zC+hsuJNkYnbL4kQtLl8PKPz9x2M
 SJdsz46uFupslSnruLbVJA==
X-Google-Smtp-Source: ABdhPJz9hzTJNp12uYZ4vHIk6ZhMev4DpgOt2zBvhqRIr7g1l5auyN0vlOttAqh+FCiKDf2dw2zOIw==
X-Received: by 2002:a05:6870:b254:b0:ec:6ca4:c89f with SMTP id
 b20-20020a056870b25400b000ec6ca4c89fmr15083367oam.272.1654037217725; 
 Tue, 31 May 2022 15:46:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u3-20020a056830248300b0060603221247sm7000503ots.23.2022.05.31.15.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 15:46:57 -0700 (PDT)
Received: (nullmailer pid 2476555 invoked by uid 1000);
 Tue, 31 May 2022 22:46:54 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
In-Reply-To: <20220531111900.19422-5-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-5-peterwu.pub@gmail.com>
Subject: Re: [RESEND 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
 binding
Date: Tue, 31 May 2022 17:46:54 -0500
Message-Id: <1654037214.468113.2476554.nullmailer@robh.at.kernel.org>
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
 alice_chen@richtek.com, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, chiaen_wu@richtek.com,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, sre@kernel.org, deller@gmx.de, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 19:18:50 +0800, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---
>  .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mt6370.yaml
Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml: Documentation/devicetree/bindings/mfd/mt6370.yaml

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

