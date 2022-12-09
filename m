Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608EF648243
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 13:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6310E52F;
	Fri,  9 Dec 2022 12:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750110E52F;
 Fri,  9 Dec 2022 12:14:52 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id m204so4331029oib.6;
 Fri, 09 Dec 2022 04:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kI7BbdyAUV/eNarvTgWcZoX1xauTnHS7x8JJjE7aAYY=;
 b=xsdiFy0r0IeL8AiFyYo4S/uheZOfI8bFxEfknVXWmsWDIP3rxio3q7MRryOLeqPtcF
 EXNGV61ofiupS8nb42hw2DE1jEMVielIEaZZalO/YfVyMDaALgi0wQHvc3AgorffzLuo
 +KLO9WFTUxiTHGVHKK7/WiR3EUYwVZf6Ofi/+45BKTA/UxJHm6xZRV8ShYXPG3FuI7Ip
 XauPOAZpeWI9BJ7mF8+cD5Z5XseKlmyOa5FTBGULAMuk966vDReka4fabQOxsL5Yy0jC
 UDBd5As+mVUK9g7aA/byeuszmDwI/O9LAElpAjv5r5EXhfCjxFzb8PxTWfetd1PQtKco
 Ec5Q==
X-Gm-Message-State: ANoB5pkSDHaRZJL+8LYC49UZXH60gXLqetSJQjSAx2gaD1oxYu//VDpd
 GbHX7ONAuc9FnWViCp3xjQ==
X-Google-Smtp-Source: AA0mqf4FRI86zMRlAtzC+h2pF/uE9HwQGgMNCY3G4dmWrGrHC4nf3HUzituKruhqW4XxFd90+aIcLQ==
X-Received: by 2002:aca:3dd5:0:b0:35a:3c3d:34d5 with SMTP id
 k204-20020aca3dd5000000b0035a3c3d34d5mr2111798oia.14.1670588091153; 
 Fri, 09 Dec 2022 04:14:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b23-20020aca2217000000b0035b99bbe30bsm447422oic.54.2022.12.09.04.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 04:14:50 -0800 (PST)
Received: (nullmailer pid 2822350 invoked by uid 1000);
 Fri, 09 Dec 2022 12:14:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
Message-Id: <167058798233.2819544.12292613321491007286.robh@kernel.org>
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Date: Fri, 09 Dec 2022 06:14:49 -0600
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
Cc: sean@poorly.run, quic_sbillaka@quicinc.com,
 krzysztof.kozlowski+dt@linaro.org, quic_abhinavk@quicinc.com,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 08 Dec 2022 14:36:52 -0800, Kuogee Hsieh wrote:
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
> Changes in v10:
> -- add menu item to data-lanes and link-frequecnis
> 
> Changes in v11:
> -- add endpoint property at port@1
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: properties:required: ['port@0', 'port@1'] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: properties: 'required' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
	hint: A json-schema keyword was found instead of a DT property name.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: ignoring, error in schema: properties: required
Documentation/devicetree/bindings/display/msm/dp-controller.example.dtb:0:0: /example-0/displayport-controller@ae90000: failed to match any schema with compatible: ['qcom,sc7180-dp']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

