Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4D643655
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3643110E2A0;
	Mon,  5 Dec 2022 21:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1AF10E29C;
 Mon,  5 Dec 2022 21:04:56 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id s187so8317638oie.10;
 Mon, 05 Dec 2022 13:04:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9CwjQnBpZhR3hfYFhEevn5e7QNaIh1B5bLQAi43lcrk=;
 b=7PfqCE5JZZP/5LVRNW4fvd0+XyucOHgtXcei5RNDMBWT/gmEhR+9q/JJfOYikDs8SS
 74SkPmi7LztSns3qYBkyt0SZXxnGyT4ACTyyalxUF+MzfGMUXo0f8guvE4+2EMbUD3/x
 GMfZwjPMjfopCDKGtjcdmQvOPZ1zn0J2e8mVoMff0Fmh8GnyEXDkBZ8AESGf6iuFaoFl
 0K5ZEnei4RkEqmM1ARMR6KZc5BRUA1SAG2t0JUWXKsUUbZTBmlD/4Hc6VxvTlkah2mF8
 4pK6PG+HpsEn+D18HrdC48gxVWe0xTmyUaJ5XmkvHXhhrjoASb+Gu5C2k73onjRZPZcu
 lc/Q==
X-Gm-Message-State: ANoB5pnuTw7fC5u2rmXcu/TcPU4btgcbBNfZNrNm0nLdJMP0V0N9TmOm
 uR+oHGEkvdCIViA6Y+nU8w==
X-Google-Smtp-Source: AA0mqf6PNt36qq3YHqydspUbJJ2YLYagwBsN9fSedf6ZJgKdnwon8TbkB7Y9jzHiw1tuBJG4lDUmwA==
X-Received: by 2002:a54:478d:0:b0:35a:582b:e0f5 with SMTP id
 o13-20020a54478d000000b0035a582be0f5mr30964775oic.164.1670274295497; 
 Mon, 05 Dec 2022 13:04:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z10-20020a056870c20a00b0013b911d5960sm9684219oae.49.2022.12.05.13.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 13:04:55 -0800 (PST)
Received: (nullmailer pid 2619485 invoked by uid 1000);
 Mon, 05 Dec 2022 21:04:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1670267670-15832-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
 <1670267670-15832-3-git-send-email-quic_khsieh@quicinc.com>
Message-Id: <167027422734.2617917.15803998013731491196.robh@kernel.org>
Subject: Re: [PATCH v8 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Date: Mon, 05 Dec 2022 15:04:51 -0600
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 krzysztof.kozlowski+dt@linaro.org, quic_abhinavk@quicinc.com, vkoul@kernel.org,
 airlied@linux.ie, freedreno@lists.freedesktop.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 05 Dec 2022 11:14:27 -0800, Kuogee Hsieh wrote:
> Add both data-lanes and link-frequencies property into endpoint
> 
> Changes in v7:
> -- split yaml out of dtsi patch
> -- link-frequencies from link rate to symbol rate
> -- deprecation of old data-lanes property
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: properties:ports:properties:port@1:properties: 'properties' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
	hint: A json-schema keyword was found instead of a DT property name.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: properties:ports:properties:port@1:properties: 'additionalProperties' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
	hint: A json-schema keyword was found instead of a DT property name.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: properties:ports:properties:port@1:properties:properties: 'anyOf' conditional failed, one must be fixed:
	'data-lanes' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: properties:ports:properties:port@1:properties:properties: 'anyOf' conditional failed, one must be fixed:
	'link-frequencies' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.example.dtb: displayport-controller@ae90000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes', 'link-frequencies' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1670267670-15832-3-git-send-email-quic_khsieh@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

