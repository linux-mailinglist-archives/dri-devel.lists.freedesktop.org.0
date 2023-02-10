Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC8692057
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 14:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066F410ED28;
	Fri, 10 Feb 2023 13:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CEF10ED28
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 13:58:36 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id cz14so4454697oib.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 05:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SdF7IjwVWEryt8TEzv+aDOxdwYEmUMSt2CzE37oNJPU=;
 b=n9d9nxbhlzBMe0gwodzqyfQGCwVuK3zcSEyZ7r2O6zFdSixX+RBeec6tmbz5Y+qinS
 QVAp3su2H28WhYznyu/lTg+aLxKv9NGZO2eRFs5JUjmkb/XwLv4voBfmvb0DFaoQcl4c
 nFHmrXgku65cqw2gog+lGwsKsaaBF1u5ZqvtIDLR4RP379R04KVu+pXS5Z2q6WX9Rscy
 yslvwiw4cGhXrqFKwHUS6rAJTqM88DhMv5UYfg/5T3gbf113v3ZnEQonhv6GGeEZOAPX
 m7vCjEtlSUfZNoacx+P/8RT0RZZw7hHjOI4pYJtfUX6mvLVfy8grDxx8oX9W9GeBrUXK
 4TAA==
X-Gm-Message-State: AO0yUKUVVGusd3lSmOZoGbMfwCc1yQC2i2vUnyR6pGCPFJuSkTVajyv5
 02TA4Lr6+OgIF/REmM1hhQ==
X-Google-Smtp-Source: AK7set+LxaqBSLF07hlU2q0YNSjGca6vF1vGfkoe5LxLRchYcgOk9FugTzcqrgX+YZEPSRvodU6FjQ==
X-Received: by 2002:a05:6808:6285:b0:367:281:d2a5 with SMTP id
 du5-20020a056808628500b003670281d2a5mr6545918oib.30.1676037515750; 
 Fri, 10 Feb 2023 05:58:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n7-20020aca4007000000b0037d6f6d01d8sm229520oia.12.2023.02.10.05.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:58:35 -0800 (PST)
Received: (nullmailer pid 2493635 invoked by uid 1000);
 Fri, 10 Feb 2023 13:58:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230210113116.404773-2-u.kleine-koenig@pengutronix.de>
References: <20230210113116.404773-1-u.kleine-koenig@pengutronix.de>
 <20230210113116.404773-2-u.kleine-koenig@pengutronix.de>
Message-Id: <167603709389.2486198.11711191457514951514.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: imx: Describe drm binding
 for fsl,imx-lcdc
Date: Fri, 10 Feb 2023 07:58:31 -0600
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 10 Feb 2023 12:31:15 +0100, Uwe Kleine-König wrote:
> Modify the existing (fb-like) binding to support the drm-like binding in
> parallel.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  .../bindings/display/imx/fsl,imx-lcdc.yaml    | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml: allOf: {'if': {'properties': {'compatible': {'contains': {'enum': ['fsl,imx1-lcdc', 'fsl,imx21-lcdc']}}}}, 'then': {'properties': {'display': False, 'fsl,dmacr': False, 'fsl,lpccr': False, 'fsl,lscr1': False}, 'required': ['port']}, 'else': {'properties': {'port': False}, 'required': ['display']}} is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml: ignoring, error in schema: allOf
Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: /example-0/lcdc@53fbc000: failed to match any schema with compatible: ['fsl,imx25-lcdc', 'fsl,imx21-lcdc']
Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: /example-0/lcdc@53fbc000: failed to match any schema with compatible: ['fsl,imx25-lcdc', 'fsl,imx21-lcdc']
Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: /example-1/fb@10021000: failed to match any schema with compatible: ['fsl,imx21-fb']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230210113116.404773-2-u.kleine-koenig@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

