Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BB1258922
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930AC6E5BE;
	Tue,  1 Sep 2020 07:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72EA6E180
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 05:00:50 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 185so40816oie.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 22:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yS6GI89LI/f0FNWAupbk3KUTtqw1Z/rOa16+RpMuRmA=;
 b=KkTkOtpb155K2KuZCtBzjJYA591c+C7gNJIzWBRPD6NFNJTdClG28hsfJFj3UJ3sAx
 sHnH55pKW+wjdveHMCrtGj76TRtZ4iEJBc88P42HhoBOmRRdgbLoXBU952TSkx5T7ZiG
 8XIts/Uopwy1Oq7yJ1IXf56a+zWf5yohjJvEzkE0UaVx1lB3XgxWycFvxtFqvD6V+Wgw
 MVit4PM/EUHFfJha8cuPCYtWvYPOxlJ8zEi7BsJSqZ+UJIFaW3kfo3Pxm20O8TuGlPxg
 ymoa+Ho2KMXimSYuBOErbEwFeI0CwOBal+89a99M7xhg4stZrDht2IzsQed+5UQySQDg
 KOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yS6GI89LI/f0FNWAupbk3KUTtqw1Z/rOa16+RpMuRmA=;
 b=Drn9kvNEt/zSEKGgyzzJHFmdoQAKLW05mNGNZVOfaA3dZha4yyZ6cLAclpgoyr7VPe
 A3kT1pbUpIL+JWrcRJ3TiRgvtHE7+qWLiCY/LKKN3qi4noJCZsXmbESCasZa4f+0GE5y
 j5skYbk0QeFMQdANTYmJIg4z9czmNOsNynGFuNv1goN2OM4uZCnJveqhhnSoh8N6wRxe
 tGjTUnIG87XXNaNUsJ47zkRweQjLYyjQOJbkrA2V2sIEAMcteK4Uc/smfvM4sPADwENy
 HF8/zavq6RMgHIPSJF53VNoXdwGZ7ujge7Trjg/AHxGKfFK6dFoC4TMc6Q+F1hvgLsmA
 u+aQ==
X-Gm-Message-State: AOAM533GkoAiMu6TBY52/jRx/owyqSiL9lUwav3CTc2nujqGU05pe6Vl
 O4YRzsQBVxV/pH91HHxEpD/hhQ==
X-Google-Smtp-Source: ABdhPJw49W2MfiCQSAmX6Y0Pae9n6VKgj97b2xwM4u73son8yqzElosho5iEd0Mm4wvTQCxEWQ41mA==
X-Received: by 2002:a54:4388:: with SMTP id u8mr72201oiv.1.1598936449699;
 Mon, 31 Aug 2020 22:00:49 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id m5sm4933ote.27.2020.08.31.22.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:00:49 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:00:46 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 10/19] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
Message-ID: <20200901050046.GR3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-11-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-11-robdclark@gmail.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 503160a7b9a0..5ec5d0d691f6 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -40,6 +40,10 @@ properties:
>                - qcom,sm8150-smmu-500
>                - qcom,sm8250-smmu-500
>            - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2
>        - description: Marvell SoCs implementing "arm,mmu-500"
>          items:
>            - const: marvell,ap806-smmu-500
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
