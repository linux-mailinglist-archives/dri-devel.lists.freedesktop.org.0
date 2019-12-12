Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028BB11C8A8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892206ECDE;
	Thu, 12 Dec 2019 08:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395166EC63
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 07:14:26 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id h14so260131pfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 23:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UM9s++t70j7Y7bhdUOf1V6X/EWBiJPENZLLU9vngZ8U=;
 b=mUXcCxZaCrXhrYZXOXSZZrz7FP6QAzw5h1YlXmxZgFNrPPX6ifBFB07Eyy6fIybNX1
 CeDq2DJ4HAlO/RVBkGXKtEMgXT6k+uRJAbpcUU+RZU/jh36ORpWFS88Eqkw9K2HuijkA
 /kpbPwjWFg/u4OIag4yFbjtlqtgnxzVkqoNPR2NK1AltoT/KlFwoP8lm9VQG3gA9Nz5w
 nfibCRxZh5t846fyCKB2pH6ShdttgGKekh/9YynSpZuftZs+KearB+jZEL/Vb0VStYp8
 aZmUHH9ggbinBZ+OOG1sZYXdSVspE50Fyu77e7HPIs9FZf0CEXAIgaB5lZjtw8eHdetz
 jsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UM9s++t70j7Y7bhdUOf1V6X/EWBiJPENZLLU9vngZ8U=;
 b=flO6TPeSjtrL4SJhH6XFNtP6r3dDb/e5XLomLxNLh/0KY6XxVWBeAKNT8Nck+PtBwE
 2jr5Gg6wX+gNLmMGuyqtBNHd17DlvQpKD3O3DQaguQNNTp4UF4R8IA62xmN6LBjFzqDe
 Gp+K43wTh/gX1APv9dsJ3mMWeGkjGIFs/hUUN/1CMxtOOoPPfYONW55jMQ+LzFx36TMW
 kJVP9BPIm5PqJmam0uHAFDCFYTB1uO/M8XdolMrtHKsw5OOmxQQfbKUP1ZRYM6xrSIN7
 0CFc747of+4y2onng2MQfpyERE/WD9ZXCQu092D44qpQhN+FuXxvvGOVnsUwaKrhr/pT
 xlMQ==
X-Gm-Message-State: APjAAAUuny4k+qmNDk+t1otq8xJtiOc5sf0ZSm3vdzCAZogSTGcwM3iX
 iqHlcsRXERV1VDQvFBKzN5FRhw==
X-Google-Smtp-Source: APXvYqxEhDt6TR1zRqNDj0IsSQyAd5Pugqzryb7zLf+dCbFy9ycoYI7ZMOwvSQuHBNF1O0ExRGyhkg==
X-Received: by 2002:a63:6e0e:: with SMTP id j14mr8713365pgc.361.1576134865659; 
 Wed, 11 Dec 2019 23:14:25 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id bo9sm4620133pjb.21.2019.12.11.23.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 23:14:24 -0800 (PST)
Date: Wed, 11 Dec 2019 23:14:22 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: drm/msm/gpu: document second
 interconnect
Message-ID: <20191212071422.GL3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-2-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 21 Nov 17:26 PST 2019, Brian Masney wrote:

> Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
> and must use the On Chip MEMory (OCMEM) in order to be functional.
> There's a separate interconnect path that needs to be setup to OCMEM.
> Let's document this second interconnect path that's available. Since
> there's now two available interconnects, let's add the
> interconnect-names property.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 2b8fd26c43b0..3e6cd3f64a78 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -23,7 +23,10 @@ Required properties:
>  - iommus: optional phandle to an adreno iommu instance
>  - operating-points-v2: optional phandle to the OPP operating points
>  - interconnects: optional phandle to an interconnect provider.  See
> -  ../interconnect/interconnect.txt for details.
> +  ../interconnect/interconnect.txt for details. Some A3xx and all A4xx platforms
> +  will have two paths; all others will have one path.
> +- interconnect-names: The names of the interconnect paths that correspond to the
> +  interconnects property. Values must be gfx-mem and ocmem.
>  - qcom,gmu: For GMU attached devices a phandle to the GMU device that will
>    control the power for the GPU. Applicable targets:
>      - qcom,adreno-630.2
> @@ -76,6 +79,7 @@ Example a6xx (with GMU):
>  		operating-points-v2 = <&gpu_opp_table>;
>  
>  		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
> +		interconnect-names = "gfx-mem";
>  
>  		qcom,gmu = <&gmu>;
>  
> -- 
> 2.21.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
