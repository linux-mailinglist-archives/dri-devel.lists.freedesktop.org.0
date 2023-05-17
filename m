Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A4706CCE
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3749B10E448;
	Wed, 17 May 2023 15:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D1210E448
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:28:21 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6ab2d14e999so693415a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684337300; x=1686929300;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RASfi4C6iFM4Ndi70/5KgD6n2tXBLGdQMzw0G7ZIRkw=;
 b=ASeVrVsHP/IcHg2PaZeDS+TpWK8y19bLbBF8WlNef0s8MLlYNCdN7dIvFJbWK5Eo3U
 sML7uUJ3CxUQuAxspvhHA0Sd92P8j7jhL0m0sQcbkPAfo4WZFB/RnJPP1YrCRib6GLVd
 LamrRm5vheP+H7J25780yof6JWAWsDnzsi7/JmIF7RZ06PZeol73TIxjOAp+phEmlzUG
 13B2kEkYTDGxSMuPYrBt6n4omHzrMDHwFLaAjtvXIXyp8iJFYP/hqLZojhC9CwtOkH8C
 9lKWwnv4ernhop6pgxZV7QICMb4iLtBKqrBxnnNbTC8Wc9uESTVYvQL38OlcltFcuA59
 WEZw==
X-Gm-Message-State: AC+VfDyzyBZcY5N/8p4urrIQZkwrJjHSTfkWi8EQxQRzbR/5sk04JesF
 tROfp20iHWOjDXuPGeMiLA==
X-Google-Smtp-Source: ACHHUZ6ijD9N5SseCCQ1cWe5HZUVSbftXF5bMVUuAmhW+DgCGKOm3XkKpKsWZ5OlaP5anPyYkVoUGA==
X-Received: by 2002:a05:6830:14c9:b0:6ab:840:c498 with SMTP id
 t9-20020a05683014c900b006ab0840c498mr15482515otq.33.1684337300240; 
 Wed, 17 May 2023 08:28:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 di10-20020a0568303a0a00b006a5db4474c8sm13400347otb.33.2023.05.17.08.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 08:28:19 -0700 (PDT)
Received: (nullmailer pid 894363 invoked by uid 1000);
 Wed, 17 May 2023 15:28:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
In-Reply-To: <20230517145237.295461-8-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
Message-Id: <168433729744.894347.3314650002007733913.robh@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Date: Wed, 17 May 2023 10:28:17 -0500
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, bero@baylibre.com, khilman@baylibre.com,
 nbelin@baylibre.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jstephan@baylibre.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 17 May 2023 16:52:37 +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/mtk,apu-drm.yaml#
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dts:18.15-22.11: Warning (unit_address_vs_reg): /example-0/apu@0: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dtb: apu@0: remoteproc: [[4294967295, 4294967295]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230517145237.295461-8-abailon@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

