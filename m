Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A31F64643E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 23:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44D410E431;
	Wed,  7 Dec 2022 22:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AE410E42E;
 Wed,  7 Dec 2022 22:47:21 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id t62so22384800oib.12;
 Wed, 07 Dec 2022 14:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5cRmcqMTQRbqCVVPhtzGwVwk+S86YVEqZnamcUPsWuw=;
 b=5z3NinMSM5t1QzGAqYFDvc4V8C3kj0I26bojFJ7ef6pZc4biB3Q6+d89cDCw6qg9dJ
 X69b2mxU54opP5S1U8uIBX0fGfaAUNzJFuMlStrXgI4Ctmm3ZkQtqdc3OWfFws+pGPoV
 xcJHOcqpgXrHOSAmDx3F3pGACV9hoXNsiOnQUKE456NymPrAXxcV2JBucSanF4so7OoJ
 0hx8/B9Ew4l4SwmW3+FkUgoyKW9k1MvBE6te1HLOag+u3FIDPYSTz6Ud78wX0vbYY4+0
 Ik4yWVsltoA5qdHYGFiaHBoO1f45SMYCX3e5aH67JxmGWjwGmUdsywYn1f9pozhl5+Cb
 ujxg==
X-Gm-Message-State: ANoB5pn2NNC+XTSf7RmAgfZ18gytnoTP2k0tXfUEr/uD3oc2IyvhBVM9
 23ubNvaTw35WNhTRYNk0aV46HZCapQ==
X-Google-Smtp-Source: AA0mqf5UlSOz+vfnlBDLHjJdPNx/RAAKOFNV0hMbjpB8wdnbtdb+4ZbqIsJvE/QfEIFpIlrXEl8IaQ==
X-Received: by 2002:a54:4506:0:b0:35b:9cc2:bfa7 with SMTP id
 l6-20020a544506000000b0035b9cc2bfa7mr26513888oil.263.1670453240350; 
 Wed, 07 Dec 2022 14:47:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d15-20020a056830138f00b0066e64c59bbcsm10705775otq.6.2022.12.07.14.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 14:47:19 -0800 (PST)
Received: (nullmailer pid 3099979 invoked by uid 1000);
 Wed, 07 Dec 2022 22:47:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1670432278-30643-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670432278-30643-1-git-send-email-quic_khsieh@quicinc.com>
 <1670432278-30643-3-git-send-email-quic_khsieh@quicinc.com>
Message-Id: <167045316457.3098064.10722096707360943971.robh@kernel.org>
Subject: Re: [PATCH v10 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Date: Wed, 07 Dec 2022 16:47:18 -0600
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 dianders@chromium.org, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Dec 2022 08:57:55 -0800, Kuogee Hsieh wrote:
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
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/msm/dp-controller.yaml:108:21: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/msm/dp-controller.example.dts'
Documentation/devicetree/bindings/display/msm/dp-controller.yaml:108:21: mapping values are not allowed in this context
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/msm/dp-controller.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/display/msm/dp-controller.yaml:108:21: mapping values are not allowed in this context
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: ignoring, error parsing file
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1670432278-30643-3-git-send-email-quic_khsieh@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

