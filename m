Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2C662887
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F197B10E430;
	Mon,  9 Jan 2023 14:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B95910E42B;
 Mon,  9 Jan 2023 14:30:45 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so5251893oto.6; 
 Mon, 09 Jan 2023 06:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lnvWjGkJXKCbxJNpIXGvIrUGwer2KE72GLT13UzJPJM=;
 b=DRqP6nzDrXaa2/2i9TdXTpYe+l8yDDkBhrdIm5WxGdzzsQJBtutqUljgcV7wAZ29i4
 86PvI1UpGETO6MDhAzHzZAHbH+HU86YSqkfXHjKNuGKemLw8NY0FvScmmB3ByA9F5l1o
 hhx6RmpryZt0bYjHX0UwR2KzAi5ICKNvypYwhApRRyF/N7MSqB6H8hsaRfJ75YhJ0LPE
 EEEsByUvD6LahwlwYffvfdU0A7AeKg9CBmQd1Ciq/GVmuXtcRlz6iG9pfdBNUkRgDPcE
 DYuadSmm5tUAqkqzjXEKBoG86547qYdI5bxAk52+f4TFJwZg4xrGcBhg2UOE6IfcY1nY
 BpZQ==
X-Gm-Message-State: AFqh2kq4rTozRNkswD+W5O52J6LlwOSQ1zQfwLBLL1XRJpu+mLw+SCbG
 6GL4NAclFOHLNZ6bpIjDRg==
X-Google-Smtp-Source: AMrXdXsbnWLocs9cJBrnQ0sJkMZX7KSKHILdb1IwjdJTuilsjNdiW3psm5xNI4+SRYShJnGsLC5OAg==
X-Received: by 2002:a9d:69c4:0:b0:66e:a5db:c553 with SMTP id
 v4-20020a9d69c4000000b0066ea5dbc553mr35961709oto.19.1673274644592; 
 Mon, 09 Jan 2023 06:30:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b19-20020a9d6b93000000b0066ca61230casm4615429otq.8.2023.01.09.06.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 06:30:43 -0800 (PST)
Received: (nullmailer pid 237517 invoked by uid 1000);
 Mon, 09 Jan 2023 14:30:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-3-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v3-3-660c3bcb127f@linaro.org>
Message-Id: <167327376817.61320.5444570222214850129.robh@kernel.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: display/msm: document MDSS on SM8550
Date: Mon, 09 Jan 2023 08:30:36 -0600
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 11:15:19 +0100, Neil Armstrong wrote:
> Document the MDSS hardware found on the Qualcomm SM8550 platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
>  1 file changed, 331 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:21:18: fatal error: dt-bindings/clock/qcom,sm8550-dispcc.h: No such file or directory
   21 |         #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230103-topic-sm8550-upstream-mdss-dsi-v3-3-660c3bcb127f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

