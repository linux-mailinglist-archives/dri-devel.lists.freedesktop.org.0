Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1543662884
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A879610E1E7;
	Mon,  9 Jan 2023 14:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A567E10E05C;
 Mon,  9 Jan 2023 14:30:39 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-150debe2b7cso8847115fac.0; 
 Mon, 09 Jan 2023 06:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Dw1mx8WSg2YN8QfEa/EeEF+6wNa6Dwq8nHk5GLyrbCA=;
 b=hy28LOJesp0bINI3cMZn/qVpwkIaS5D2Hg/dNL3uOyt7jHP/NF08cfQmHS06G68s6l
 e0s4+2I/cf0RbpZCh7uRVImCR8Tf+KY0AN1lj9s4JEJFLMaB1z8ZZKJ+nosGPyg5tIqt
 5OYUVLTcTXkA0W6VZ+aZ4LeRS54eQuDS4hp3yozSsXg71KrwADIfgQRnhY0LIBxPvsAG
 9QEYruZtrPKqvTGQyyrx1aPtI8SIJPKRSmtMpqITfAm3spup9yvKbP2apZjYUyeDcS8p
 0+HgZub9GkG79im3T2CkUW7Q9kLPd0/5AZsMZptIr4JI6NN0SP8uSt0mquOrX38HbWoQ
 SWjg==
X-Gm-Message-State: AFqh2kpJ+GshwGfjKyzLWpAzAyTMGD0GP2y5j9f/yg9JlwvjZG7ETfqy
 D2aRVHgT1YjS0LdpD6HVLg==
X-Google-Smtp-Source: AMrXdXuhXryTUekpsWEZueO52n4IgWGu3chWGQzHGt/JQgLTSQ+mhMBV+oqTEtDmzBPk3PRplCEiHw==
X-Received: by 2002:a05:6871:4497:b0:151:89b:a657 with SMTP id
 ne23-20020a056871449700b00151089ba657mr9629377oab.19.1673274638814; 
 Mon, 09 Jan 2023 06:30:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 eq2-20020a056870a90200b0014fb4bdc746sm4235849oab.8.2023.01.09.06.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 06:30:38 -0800 (PST)
Received: (nullmailer pid 237515 invoked by uid 1000);
 Mon, 09 Jan 2023 14:30:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-2-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v3-2-660c3bcb127f@linaro.org>
Message-Id: <167327376724.61122.3156617498910384494.robh@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: display/msm: document DPU on SM8550
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
 freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 11:15:18 +0100, Neil Armstrong wrote:
> Document the DPU hardware found on the Qualcomm SM8550 platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 134 +++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dts:21:18: fatal error: dt-bindings/clock/qcom,sm8550-dispcc.h: No such file or directory
   21 |         #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230103-topic-sm8550-upstream-mdss-dsi-v3-2-660c3bcb127f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

