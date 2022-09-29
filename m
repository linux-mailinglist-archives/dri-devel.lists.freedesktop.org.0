Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C045EFE4D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7777A10ECA5;
	Thu, 29 Sep 2022 20:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AE710EC9C;
 Thu, 29 Sep 2022 20:04:23 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id j188so2753847oih.0;
 Thu, 29 Sep 2022 13:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=nZeIRLfu17llTKpdbsCCjUY7kgNnNST8HF+Cjh84iZc=;
 b=Dq2vKehwllQGvZlytEd4Hx1123FIeB9CIngeE9oTkChJs1xTscasDmJWM/tFP6BWmb
 6MSHiFFKRaG7zlM4autoYNf1QYl63a4ZkMdGjfyXUlIpDvMnz8Vm2N552XTe6Q6uSveO
 +lzL6EfW+r4isfTB/paDHFQtzMvu40f5cVkIAS8HK7XudmMUjOZLkV5xnpzh6AW2H3a8
 XafaCWRQqZozRGttUDu5lZx7fPf+YWld0QGi8eJtfDK5tDc8Ko8g56VFqh2/zF73fD0M
 U5yraLs4ll94z3SjYmn/fsBAotzAneaK6LO0khznU16XmnDE8fbr7VpwAejlcHJ621RC
 JiqQ==
X-Gm-Message-State: ACrzQf0i2tgLK1UGY5sFDExFcBYSUUESzfjbXmLCaW4J4gggfKMedq21
 YIcXaVsqIx6Y0BZyG97jTg==
X-Google-Smtp-Source: AMsMyM4zEXYymY6EliE8ri9ZHKGmgtQjgS/Yc/qDM/kYQrvqd/7NUYMcmv+/RXt1Juqb5bO2Uc1GlQ==
X-Received: by 2002:a05:6808:198e:b0:34f:f114:8921 with SMTP id
 bj14-20020a056808198e00b0034ff1148921mr2386076oib.1.1664481862255; 
 Thu, 29 Sep 2022 13:04:22 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 cy22-20020a056870b69600b0012c4bff351asm157221oab.43.2022.09.29.13.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:04:21 -0700 (PDT)
Received: (nullmailer pid 2652359 invoked by uid 1000);
 Thu, 29 Sep 2022 20:04:21 -0000
Date: Thu, 29 Sep 2022 15:04:21 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 07/12] dt-bindings: display/msm: split dpu-sc7280 into
 DPU and MDSS parts
Message-ID: <166448185987.2652299.15874860633759045019.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-8-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 15:36:06 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sc7280 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7280.yaml      | 162 ------------------
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml |  98 +++++++++++
>  .../display/msm/qcom,sc7280-mdss.yaml         | 130 ++++++++++++++
>  3 files changed, 228 insertions(+), 162 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
