Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592077FA918
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 19:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16E410E3C2;
	Mon, 27 Nov 2023 18:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B67110E3C0;
 Mon, 27 Nov 2023 18:40:19 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6d8162ca490so951308a34.0; 
 Mon, 27 Nov 2023 10:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701110418; x=1701715218;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YVywRnjvKfc8s710BUTyZQrNkS90y58RpBYg6vLXBw8=;
 b=ToVo2ZCiPLC+X9HpvW+SllDeTpqtcQUmpFS6v+ldApJz2XV67LA5KZHKi7gUH3dLNp
 bbTB7c/wUxkNWbZbZuh22pXrXsbYWy519R6RPi4FSDYB7EkjzqJFfovf1Qrg6fmhe4J9
 Jhg3Xr7jAK6704Mvqmaex4DxFLGRaA4CoxOeqOFDbM3mSfoth4uxoHRJKS6/LZs4h+YE
 HRQn4CoctsEezL2vZ/yRewZuMq094E00evlAZQthsusGgWwjF4r+YQXHXMTzrFkPEnZF
 EgHwT3GNrQ+IW+3vIyJZHQM1upuLVJ+T0ZAdDLSu8kLT0d6dJ7LtGkfafAQ0IGmqERZ+
 Fvtg==
X-Gm-Message-State: AOJu0Yxscr7lIt5XCkSxawn39EJYIzRIZ/Q78URQaGcvzk1r086jD0sh
 u/ihsDaw3qMpb0lwsF/L+g==
X-Google-Smtp-Source: AGHT+IGHvWxLgKw7dql3sJyA5cZNuv1wzTmsB/VlB7zUtFnIdhq8vigkguuW5My1RrnY70l0VypYTQ==
X-Received: by 2002:a05:6830:7183:b0:6cd:9b5:f07f with SMTP id
 el3-20020a056830718300b006cd09b5f07fmr9899391otb.8.1701110418184; 
 Mon, 27 Nov 2023 10:40:18 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z18-20020a9d7a52000000b006cd09ba046fsm1415622otm.61.2023.11.27.10.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 10:40:17 -0800 (PST)
Received: (nullmailer pid 2283504 invoked by uid 1000);
 Mon, 27 Nov 2023 18:40:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-4-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
 <20231125-topic-rb1_feat-v1-4-11d71b12b058@linaro.org>
Message-Id: <170111041311.2283445.17798398754881124107.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: display: msm: sm8450-mdss: Allow 3
 interconnects
Date: Mon, 27 Nov 2023 12:40:13 -0600
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
Cc: Das Srinagesh <quic_gurus@quicinc.com>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, iommu@lists.linux.dev,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robert Marko <robimarko@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Loic Poulain <loic.poulain@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 25 Nov 2023 15:17:32 +0100, Konrad Dybcio wrote:
> In addition to MDP01, the cpu-cfg interconnect is also necessary.
> Allow it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: interconnects: [[4294967295, 14, 0, 4294967295, 3, 0], [4294967295, 14, 0, 4294967295, 3, 0]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem'] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231125-topic-rb1_feat-v1-4-11d71b12b058@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

