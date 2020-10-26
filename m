Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC580298E29
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 14:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC08B6E9F9;
	Mon, 26 Oct 2020 13:37:53 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BE36E141
 for <dri-devel@freedesktop.org>; Mon, 26 Oct 2020 13:37:52 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k3so7416766otp.1
 for <dri-devel@freedesktop.org>; Mon, 26 Oct 2020 06:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t64kmtN/HDyxP4t5ivuGyA/qPv7YzZlRpPGh3lKtqTI=;
 b=AP+6qgLjQW5jy7ew/qKL/CfVUpTq4zQx45c0FNuT05EikuUFTb/8xEi1oLgTszUX4s
 86viin6jp8xyP2LIjI7cpk1umr3+Hga+tHo7xOkohFv3Vacg21L9q/LG+8ViNGLUU83w
 NsCEMtleTE/RuSRX0SQ1iSQhaxxWaK4OmlKNp84cEMvT09uHa9EjQiaMywJKkNmaCJOQ
 kKEkvgIYGIOhKU8MRZZbl3fbjCTFsDzRap5o6UMCiRQiNz9nhXjujRn71cRQlDr81tD7
 2KznRlLtfSLes6Zl/MWcvFp6q2InZ0V+VpN7YDlMZR3tixhn9ZuAzxmnbeT0OhdpdV01
 pxFw==
X-Gm-Message-State: AOAM533XDfKp9JtQhxBrW2Kllp+eb23gW+WlhY1DhLJOYKoMEVDRun0Z
 8bPMd2ZRvN2RyUiecIcSAQ==
X-Google-Smtp-Source: ABdhPJwFWowVXR46tpcBVBTc1a9/5mTGJ/6c9gdWvieDSmH6ZIEqs+3E3MTlTuX3IKjN2c0Qav7dfg==
X-Received: by 2002:a9d:3e54:: with SMTP id h20mr11224458otg.236.1603719471915; 
 Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w9sm1502116otm.47.2020.10.26.06.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
Received: (nullmailer pid 42863 invoked by uid 1000);
 Mon, 26 Oct 2020 13:37:50 -0000
Date: Mon, 26 Oct 2020 08:37:50 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: drm/msm/gpu: Add cooling device
 support
Message-ID: <20201026133750.GA41262@bogus>
References: <1603113268-21161-1-git-send-email-akhilpo@codeaurora.org>
 <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 06:44:28PM +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 1af0ff1..a496381 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -39,6 +39,10 @@ Required properties:
>          a4xx Snapdragon SoCs. See
>          Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
>  
> +Optional properties:
> +- #cooling-cells: The value must be 2. Please refer
> +	Documentation/devicetree/bindings/thermal/thermal.txt for detail.

This file doesn't exist anymore.

> +
>  Example 3xx/4xx:
>  
>  / {
> @@ -61,6 +65,7 @@ Example 3xx/4xx:
>  		power-domains = <&mmcc OXILICX_GDSC>;
>  		operating-points-v2 = <&gpu_opp_table>;
>  		iommus = <&gpu_iommu 0>;
> +		#cooling-cells = <2>;
>  	};
>  
>  	gpu_sram: ocmem@fdd00000 {
> @@ -98,6 +103,8 @@ Example a6xx (with GMU):
>  		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
>  		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
>  
> +		#cooling-cells = <2>;
> +
>  		/*
>  		 * Look ma, no clocks! The GPU clocks and power are
>  		 * controlled entirely by the GMU
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
