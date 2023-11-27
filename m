Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F087D7FA911
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 19:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FCE10E0DE;
	Mon, 27 Nov 2023 18:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C9610E0DE;
 Mon, 27 Nov 2023 18:40:16 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-58d4e32ea2fso1554275eaf.3; 
 Mon, 27 Nov 2023 10:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701110416; x=1701715216;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NK5WhS88OI6KCb7Lk1NPWEaX1+G+RAfAiUrHgwT/t+E=;
 b=vGD13qC2xh2KdWOZTKEaZ7ap7pTwly8PscIoVILsvetnaP+pYx76iMh/gmFlEk1E5J
 kMfrQQVIl/RBulkvtAACOy8XoCl+lJ+l4io/HmyHtX63leAPJv43/MRdAKGxYoteUM4M
 LoWysXNfOCayMYJNqhNZlCNNhF6JoBsmHcgOnaXwyz86fCFPEIaeHxRdvJq45s9mWhLk
 6DO26ENoCiKcO0Hvat1Tb5jeXoGht/ZwYJj0KrzisYTQpAPg44pCqcsUbItMSyPSMC5H
 nCA4Vs+rntVvKPlDZmCuVr/DSXbvIyge3GjD1/IXWCETO/Icw/oGrytsx6XWgKVV6IwC
 gy+w==
X-Gm-Message-State: AOJu0YwCJD5pVub9k8RtVn/F7mnsDmLAO2gM+SXGIUrdHAXdPjpQuWUL
 YfRAjqaQnKkuDR1q2ZhkPw==
X-Google-Smtp-Source: AGHT+IFryMql4axrRLjSO6lgZP7+RrOYihlOCdtksjZ7JOF1OJch6kZaFVxi0oP2Hqvh20Dhi6avdA==
X-Received: by 2002:a05:6820:16aa:b0:58d:981e:bc5c with SMTP id
 bc42-20020a05682016aa00b0058d981ebc5cmr2953014oob.7.1701110415941; 
 Mon, 27 Nov 2023 10:40:15 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e4-20020a056820060400b00573a0631d98sm381569oow.34.2023.11.27.10.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 10:40:14 -0800 (PST)
Received: (nullmailer pid 2283499 invoked by uid 1000);
 Mon, 27 Nov 2023 18:40:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-3-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
 <20231125-topic-rb1_feat-v1-3-11d71b12b058@linaro.org>
Message-Id: <170111041242.2283353.8776249687864558738.robh@kernel.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: msm: qcm2290-mdss: Allow 2
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
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Loic Poulain <loic.poulain@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 25 Nov 2023 15:17:31 +0100, Konrad Dybcio wrote:
> In addition to MDP0, the cpu-cfg interconnect is also necessary.
> Allow it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000: interconnects: [[4294967295, 1, 4294967295, 6]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000: interconnect-names: ['mdp0-mem'] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231125-topic-rb1_feat-v1-3-11d71b12b058@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

