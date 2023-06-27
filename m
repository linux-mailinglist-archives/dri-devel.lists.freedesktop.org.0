Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309587405F9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 23:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AD510E064;
	Tue, 27 Jun 2023 21:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA29A10E064;
 Tue, 27 Jun 2023 21:56:35 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3420dccf277so18580115ab.2; 
 Tue, 27 Jun 2023 14:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687902994; x=1690494994;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=64oZsUuru0HA89uc2YjHgtD5IZLSgmyXIIjxqeMMqhk=;
 b=YbV/1kJkUzQZ0dPrIpRKHYeiDr2MG+akJzePjjJq308brLTkAqml/swwDZgWeAyjYP
 5T6x9KDZ3BJhHcq/V8PTfHyM+NV3FF+vuOxbYvC5E0sRtiVmXYErVxLJ006Ho68FgzwI
 j9KTk9iSkvdPux4cwxGlPCgH7IZICpRMXRkTFL6el0ok2jXsWIHhPnH1PzamDf4VjamQ
 swXJGM5xYpAZmASAKWJ3vhDa6rlHtaGk+xXU76w2prfOJ5dyjq6z6dO1zPVrzalOZh9y
 vnzAy5eUbqS0mOORXjb5SsUXYrSf1YxzklBYVoZloLGRxtlDrr0adfsEPMIi7uYY/40k
 94WA==
X-Gm-Message-State: AC+VfDz40AT/UI/dDJmM0JVLG/g0VKpP2HVYD+CCA3LIwhbquXeGHKqL
 rksOlEZlLk+E25ujKscN/A==
X-Google-Smtp-Source: ACHHUZ7DUHS4TrojiJZ3NsBw35j/fMK1gmtN5i++5TIkcjGsL3oli58Kt42Pzl3zrM/8ZzqRDjcw8A==
X-Received: by 2002:a6b:6604:0:b0:785:d017:c16f with SMTP id
 a4-20020a6b6604000000b00785d017c16fmr1419772ioc.14.1687902994173; 
 Tue, 27 Jun 2023 14:56:34 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a02a71a000000b004182f88c368sm37736jam.67.2023.06.27.14.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 14:56:33 -0700 (PDT)
Received: (nullmailer pid 3087346 invoked by uid 1000);
 Tue, 27 Jun 2023 21:56:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20230627-sm6125-dpu-v2-7-03e430a2078c@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-7-03e430a2078c@somainline.org>
Message-Id: <168790299021.3087309.11039202845199087454.robh@kernel.org>
Subject: Re: [PATCH v2 07/15] dt-bindings: display/msm: Add SM6125 MDSS
Date: Tue, 27 Jun 2023 15:56:30 -0600
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 27 Jun 2023 22:14:22 +0200, Marijn Suijten wrote:
> Document the SM6125 MDSS.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 217 +++++++++++++++++++++
>  1 file changed, 217 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.example.dtb: dsi@5e94000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm6125-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sm6125-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl']
	'qcom,sm6125-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230627-sm6125-dpu-v2-7-03e430a2078c@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

