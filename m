Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F5F5EFE51
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1EB10ECA6;
	Thu, 29 Sep 2022 20:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F315610EC9C;
 Thu, 29 Sep 2022 20:04:50 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-13189cd5789so3094400fac.11; 
 Thu, 29 Sep 2022 13:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=UOb2OpT+RmVgYvUl1vJinRQ2SLSghdo0bfKmgz0QTUg=;
 b=Xv3gW6sjPfL/BPedw+qcc2nOSE1QHcYguA350Kabk6QK4HPzOID8TsN8IajiNiqYPJ
 hO6HKZUFDdyYP7zuNPmaxGAh0FgP0jcXup3m2ahOY8ZFaf2xwNh6kJK4twTKMzHbRIj8
 TFQHXbF5YtiEWvfRwYve2vnWH08mlDLO6GeOFM4kv1IBpZbT8AOlWy8VV3XjxLODtxG8
 KBMhohnotERhi5iZAS5n4bsmHCxIaYeScjB42v7yuM2QAZkssqur8QveA69McZm1mvyg
 1pOE2pJNPlQk/l9bXiJ1x6jL5q/cibUdAtZj1wttMFy12x1i2kAzlRQzqscCZrGx7Spe
 7NMA==
X-Gm-Message-State: ACrzQf1jSjz5j9PHf6Q7RUofvKcU58LvrdXc05//pEF2RiF9xPkpJvs0
 ocx6kBvE4sJGq4+1FHbYmQ==
X-Google-Smtp-Source: AMsMyM6iOD6lOvLB454gWm8TA6RsYfA8tIZxlW9vJiH96267EzqdfWPIM9JMoRmq/zzfNkOr/SFFBA==
X-Received: by 2002:a05:6870:c59b:b0:131:8d2e:e808 with SMTP id
 ba27-20020a056870c59b00b001318d2ee808mr8047505oab.280.1664481890061; 
 Thu, 29 Sep 2022 13:04:50 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 30-20020a9d04a1000000b0063b2875246dsm141051otm.49.2022.09.29.13.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:04:49 -0700 (PDT)
Received: (nullmailer pid 2653001 invoked by uid 1000);
 Thu, 29 Sep 2022 20:04:48 -0000
Date: Thu, 29 Sep 2022 15:04:48 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 08/12] dt-bindings: display/msm: split dpu-sdm845 into
 DPU and MDSS parts
Message-ID: <166448188823.2652936.7167488373212756986.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-9-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 15:36:07 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sdm845 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sdm845.yaml      | 148 ------------------
>  .../bindings/display/msm/qcom,sdm845-dpu.yaml |  90 +++++++++++
>  .../display/msm/qcom,sdm845-mdss.yaml         | 117 ++++++++++++++
>  3 files changed, 207 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
