Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39771265CE9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCFA6E9BA;
	Fri, 11 Sep 2020 09:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D7A6E249
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 22:00:40 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t20so6140419qtr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PT5fNi7xEflk8GkI4Xi2kkoOSPhyGZTLMGtsTW99lM8=;
 b=UFahawZL4avRAiB31WSjU4euU3yRJTvrwhgJJi+Qn9x5fE7mBIWZH9kFeYWriHmGo0
 8DHjQ50B0xl5dOak65fkLcV7yN5nOj1VsXQgQL4pnpjyXKeRmShEKNeJfTtR0mesghnq
 1CvMe0xbWvYL/GH0IlhuCHB3VedkLXkWosVaUZVL1AbvGCkv73Vg4ZUIg+1YfY2orVY4
 ibgOpRDf2ulUeLZOiriIIhngYnlgiH1Ul0bXET7r0sUeUwXoYVnH3b1erPyJJ+CTh/gW
 7BPZdJCEA0WMx6E0iFl0XvHMlzIpVULhWwJ3piwrrgfe0RTT3ZLO3kQzq2D2JvEyh2f7
 1g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PT5fNi7xEflk8GkI4Xi2kkoOSPhyGZTLMGtsTW99lM8=;
 b=pE0Qwl3jFL2qUr5wo7FiFCc0ifpzzplBko37lRRcOXAVTJKby6kPlpNIhwhdglTVTY
 sL0UiLk9O5Fb61B4eqXW4wMOs2YCVPlymyo9Vlo/jehng+SIqmWiaRltoAEK6VXmhwPs
 k/GqwM3nvvqXDdc4GNzIdxogLxKigDEQDI1ZJaMZWfIPF2aLuvAGLiuDsf31AiY/kbN9
 ytt/9t2BYh8oyFc3fWom2njxQbuWrteKIx6JCyCmAZly5UkSxGqROAwU4+ZRg9f4hrEp
 ocz4YETAp8SYLQ+zGaJAyk15E3ByvuqtrU7nBJP1RHAZQL7YBGBLSMq47whqOSffdpDr
 0hRA==
X-Gm-Message-State: AOAM5334rztaQcTlJ5+BknuG5EnvRPXAfD/UgRYVqXcv4Keudt34DZaN
 Tg5D3Jc2C0vtH3kHJDpAN8PklQ==
X-Google-Smtp-Source: ABdhPJzkV98KqvV9kj+Vq3Fl6B3U5epSGI8O2umuU/HuE10PsA2MfBhWuzMuy+vaiCys73JsOVxnXA==
X-Received: by 2002:ac8:376d:: with SMTP id p42mr10057359qtb.288.1599775239625; 
 Thu, 10 Sep 2020 15:00:39 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id u66sm406702qka.136.2020.09.10.15.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 15:00:39 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:00:37 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [PATCH 2/3] arm64: dts: sc7180: add bus clock to mdp node for
 sc7180 target
Message-ID: <20200910220037.GA472@uller>
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, travitej@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 16 Jul 11:35 UTC 2020, Kalyan Thota wrote:

> From: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Move the bus clock to mdp device node,in order
> to facilitate bus band width scaling on sc7180
> target.
> 
> The parent device MDSS will not vote for bus bw,
> instead the vote will be triggered by mdp device
> node. Since a minimum vote is required to turn
> on bus clock, move the clock node to mdp device
> from where the votes are requested.
> 
> This patch has dependency on the below series
> https://patchwork.kernel.org/patch/11468783/
> 

Isn't this dependency on an old revision of patch 3/3 in this series?

Regardless, I don't see either the linked patch or patch 3 merged in
linux-next, so I presume I should not merge this?

Regards,
Bjorn

> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 4f2c0d1..31fed6d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1510,10 +1510,9 @@
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
>  			clocks = <&gcc GCC_DISP_AHB_CLK>,
> -				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "bus", "ahb", "core";
> +			clock-names = "iface", "ahb", "core";
>  
>  			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  			assigned-clock-rates = <300000000>;
> @@ -1539,12 +1538,13 @@
>  				      <0 0x0aeb0000 0 0x2008>;
>  				reg-names = "mdp", "vbif";
>  
> -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>  					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
>  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -				clock-names = "iface", "rot", "lut", "core",
> +				clock-names = "bus", "iface", "rot", "lut", "core",
>  					      "vsync";
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>  						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -- 
> 1.9.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
