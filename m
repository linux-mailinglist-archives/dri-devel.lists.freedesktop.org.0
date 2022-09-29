Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB285EFE63
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B4710ECAC;
	Thu, 29 Sep 2022 20:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9DB10ECAC;
 Thu, 29 Sep 2022 20:05:38 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-131b7bb5077so3129835fac.2; 
 Thu, 29 Sep 2022 13:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=sA27QbckL8YX/4PuWUZpxGzCM4ZqQIfIZ0bwz0dvdwk=;
 b=mwtMf9pv1nYFPGksVIRUYNhKDCVF3XpLN/UEQKrKD5S1Cb4T56x/uSd6c8FbmYaAE5
 heqiEUXAMheHXYXsXZkusCBdmFfPKJQAt+6br29B3iMduWThsU/kLRGP/4XosQv8A3/D
 YhmAVPspfBimQ5wz/4kIs+kRH/yUBBmGGliRjouEML/3MQiJDRepoyPuVAJiICk/MsHJ
 bZrcfrv9M1p5rdf1h2fQQ9NUTXXmeWelwdQKgXBioeJvN8KkuNx68UySIrXLTjsOg/qY
 8EF408RZnOW1+bMDji0jkrXmPQjE1m6V6gf801oU33R9h+jTy02j9zUkYd1ODyzjbGCQ
 pwNw==
X-Gm-Message-State: ACrzQf1f/L42tKSDnMJIXI3rCgznbvDdFxUVoQJX3ecVPRxone6a/vWZ
 Q6C3IRIkBUIJDSUXPUpdGA==
X-Google-Smtp-Source: AMsMyM7gfDWPTI/ADhk9VSHSTmoYtLAHstSEuuh4NRIutqRnF379aU0zv17NFs1IMg/+FC4o13VjYQ==
X-Received: by 2002:a05:6871:5c9:b0:12b:b4fc:471c with SMTP id
 v9-20020a05687105c900b0012bb4fc471cmr9142113oan.104.1664481937939; 
 Thu, 29 Sep 2022 13:05:37 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020a056870738900b000f5e89a9c60sm191770oam.3.2022.09.29.13.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:05:37 -0700 (PDT)
Received: (nullmailer pid 2654126 invoked by uid 1000);
 Thu, 29 Sep 2022 20:05:36 -0000
Date: Thu, 29 Sep 2022 15:05:36 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 10/12] dt-bindings: display/msm: split dpu-qcm2290
 into DPU and MDSS parts
Message-ID: <166448193581.2654066.15728350591102767785.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-11-dmitry.baryshkov@linaro.org>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:09 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-qcm2290 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 148 ------------------
>  .../display/msm/qcom,qcm2290-dpu.yaml         |  84 ++++++++++
>  .../display/msm/qcom,qcm2290-mdss.yaml        | 117 ++++++++++++++
>  3 files changed, 201 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
