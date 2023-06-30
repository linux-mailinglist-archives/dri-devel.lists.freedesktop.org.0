Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3410743FEE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABB10E4BC;
	Fri, 30 Jun 2023 16:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D4610E4BC;
 Fri, 30 Jun 2023 16:40:06 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3426e9a9c3eso5129955ab.0; 
 Fri, 30 Jun 2023 09:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688143205; x=1690735205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EeB/bfHSBcU9maXUNIluojjzFlamBE8CEArcolnrob8=;
 b=kf3UcmNjC2sOETsE9jbv7Uz70iRFOXRqzDeCp/PKE+riGMcVbLc2o+CmRTi4/CjwQB
 AJkW0SP0GAWlxncVl93CXGX2gXu001JRsMUyM7kA1Zi/pCipaFH8rHAb+AwTHinylxsX
 mTDSDnU81KKyqTWHTijqZ0pm4hJ/+K41Rg7s0xuA9GJIGCoOQU1r0RQjXTwzzHIYf+DI
 O1isYruxKJJnEbd4aCM3pxkTgoTECrOual+0SQBVAEufY97N3j6eUptmyKQDYGE0897b
 Xv6F22oDNnfwLVOoidPDeyhWukvhqopc4tRrhk/da7kXYMqeLLx77XOe7C3zBCpOgXbx
 H66g==
X-Gm-Message-State: AC+VfDy6RxGhKi8HXFirtUqjNVqU1fiLLgSig4VZ8GrulvfaByrdkC7h
 cemX3RPnNyplbUwmxHvjHg==
X-Google-Smtp-Source: ACHHUZ4DLZ3IurzatjPxbZeoavj6m0W8wqNX8o02xrmVCC4dlOC415Oo8kXvv2bRAOJgcoQ2rt3L/g==
X-Received: by 2002:a05:6e02:f91:b0:345:ad29:1f84 with SMTP id
 v17-20020a056e020f9100b00345ad291f84mr5878456ilo.3.1688143204998; 
 Fri, 30 Jun 2023 09:40:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a056638000d00b0042b1354452csm811726jao.83.2023.06.30.09.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:40:04 -0700 (PDT)
Received: (nullmailer pid 1877025 invoked by uid 1000);
 Fri, 30 Jun 2023 16:40:01 -0000
Date: Fri, 30 Jun 2023 10:40:01 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: regulator: Describe Qualcomm REFGEN
 regulator
Message-ID: <168814320140.1876966.17866889850041692910.robh@kernel.org>
References: <20230628-topic-refgen-v2-0-6136487c78c5@linaro.org>
 <20230628-topic-refgen-v2-1-6136487c78c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628-topic-refgen-v2-1-6136487c78c5@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, freedreno@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 29 Jun 2023 22:35:41 +0200, Konrad Dybcio wrote:
> Modern Qualcomm SoCs have a REFGEN (reference voltage generator)
> regulator, providing reference voltage to on-chip IP, like PHYs.
> It's controlled through MMIO and we can toggle it or read its state back.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../regulator/qcom,sdm845-refgen-regulator.yaml    | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

