Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECB3962A0
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 16:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA576E93C;
	Mon, 31 May 2021 14:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7546E93C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 14:58:11 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id z3so12523883oib.5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SknFJ3pQdKucMRHgV1sQyN7dFPet0HuZCehCboQA0AY=;
 b=A5WFHkEP14fFB5I+cbnJMBAg50o9+oCkyD7OC+ezgsSlYqN113tjqNbWlEbw9hjYaR
 IwaMuPuoCMvGi/FdtO8CvqpMJ+yzNXY6iTXAli3unRd9J2KKsH2VWmh1qUOjez326WJg
 tmD5/GEcNvGA/PXgpUIrUaRlgz29mHXjZxbI4AYk8ZlzS2NAcqUosIhAkgptMwK8kING
 Zx4QzVllmm2lATyhR9jsBXgypP9b8pm+GKwYZs10pbzXFVAMElQuMTWHojpqpBu4VIlO
 EkXSw6+MiAiMdyATJ6FSYZAyMu15x6EFb7kL6C9nkn8dOje84NVTHeKWWOa4+/QalmGh
 tgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SknFJ3pQdKucMRHgV1sQyN7dFPet0HuZCehCboQA0AY=;
 b=IXlxkz7xOvpeH8q4SsFDCp1wTmwXwsSyF1tvh9aIWR63YNKTY70TSxhXuLcrh0w20z
 PqywnqLLT7WDu1m9f4hgkjHuwjfY5Ybab7hJafVXZ6TpPMu/CdYGP5JOQV6vQJ15kJMc
 v+u0fgCY4vWuTqZZShjEwh+2fsu1fnxoUp+wNY1vv5/jDew/PMiOQBdNzN6hKeDci8pi
 FNQDAH5OA7Ss3QAg1NmxrEE6pZobjk0nl4YkDeWZDPO/xTu5QXX//GQAKiwmDxiuj+F/
 h2BPtgPa5e1iInvlmalsyPX89Ucao+3S76xAgAwddl7TNCWHI4PJhayKnRvuMouh/LvZ
 tqXA==
X-Gm-Message-State: AOAM530vnFweYyieEVThbDN3hYhIg0XFwYMwElAmK0tkQIlfNZH7p54F
 0mkQDU2ymbnKNGt+PciE/bKhlw==
X-Google-Smtp-Source: ABdhPJwHZUdNkJg14uls6i/Ap6IYxZyXJWwt7uA1mAadjaCVt0HA9y67LACxjJDBXdg11yuPqdXXZg==
X-Received: by 2002:aca:6501:: with SMTP id m1mr17843119oim.0.1622473090719;
 Mon, 31 May 2021 07:58:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g26sm1488378ooe.15.2021.05.31.07.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 07:58:10 -0700 (PDT)
Date: Mon, 31 May 2021 09:58:08 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: sm8250: move bus clock to mdp node
 for sm8250 target
Message-ID: <YLT5gGKP3lUkpmG8@builder.lan>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
 <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 07 Apr 10:01 CDT 2021, Dmitry Baryshkov wrote:

> Move the bus clock to mdp device node,in order to facilitate bus band
> width scaling on sm8250 target.
> 
> The parent device MDSS will not vote for bus bw, instead the vote will
> be triggered by mdp device node. Since a minimum vote is required to
> turn on bus clock, move the clock node to mdp device from where the
> votes are requested.
> 

This commit message makes sense for the other commit, where you move the
"bus" into the mdp. Do you mind me changing this to:

The bus clock is voted by the DPU, so remove it from the MDSS node.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 394973e778f7..60fe2eaf06c5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2294,10 +2294,9 @@ mdss: mdss@ae00000 {
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
>  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&gcc GCC_DISP_SF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "bus", "nrt_bus", "core";
> +			clock-names = "iface", "nrt_bus", "core";
>  
>  			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  			assigned-clock-rates = <460000000>;
> -- 
> 2.30.2
> 
