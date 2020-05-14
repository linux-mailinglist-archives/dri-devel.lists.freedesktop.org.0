Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6B1D41D2
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 01:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89886E0C4;
	Thu, 14 May 2020 23:45:08 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452F76E3B0
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 23:45:08 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x13so81683pfn.11
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 16:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TS6m3tA7iP1dUmXkdet+rM4d6JbY2zF/WsqwIammF8E=;
 b=YjE6uPBGNr4Xe2rTD6hCoXF0Vo9fHrPRc8MeseKVAqIDzm93Jk/d4QULhMOfJ8ilHN
 Zi+1iu5vNwfDcdCueh1FAVNZq4QKsfXe4HeVxZ3O4Sm3d4u9KQh5EYd4GWvVNH8cfzkT
 qmyscxwZ7Tq16XPqH5qqJR6toOuYAZyl+KBnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TS6m3tA7iP1dUmXkdet+rM4d6JbY2zF/WsqwIammF8E=;
 b=TsjqesEBua4e+BcR1Zy16W1y5hXgA1DuK481RPRMxI2/G8N6qFCbyqpJuUKPhleaQU
 E1ZGK3On6KLMUM9QWg6xSGVhU0fUbm8UqacKf+nsWwAnkweno1wIReUmDp8/sXOFZvE+
 LqUYs3qHnwM2V+hN272qVH9fuNLjHXUMM2NjvKBVVs0xZwy7MU1OFb2xIG4AhvF5sGNW
 HQO7P4K7UEL4tX/2Zs7m0lFeegpGsXe5BIxcFqjlemUCZzv3X2n08bWbzpiL5s+G/dOT
 yES67giWeqv4xZeaWW7/IMBw7h6Wvg2bJWFMdVvXC2np502IYu9lIRkzEHq5RaGxTGaS
 QbOg==
X-Gm-Message-State: AOAM533QMc7CWMG71N5Jhm+qPIs5Ce7V4qfTIfmTv0X0e48+Ou2SsNap
 p3hUde6DDQQ/R+Cnz3KPJn8VHg==
X-Google-Smtp-Source: ABdhPJx4mHQv2BFmu1UqFEL0Rzavx5iPrdT2xRUY4noa8VccK+9T65lv35xK9Ign6IhTDiC7W+uE/Q==
X-Received: by 2002:a63:1845:: with SMTP id 5mr519761pgy.69.1589499907739;
 Thu, 14 May 2020 16:45:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id w84sm265543pfc.116.2020.05.14.16.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 16:45:07 -0700 (PDT)
Date: Thu, 14 May 2020 16:45:06 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp
Message-ID: <20200514234506.GS4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-3-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-3-git-send-email-smasetty@codeaurora.org>
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
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:24:15PM +0530, Sharat Masetty wrote:

> Subject: arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

nit: s/opp/OPPs/

>
> Add opp-peak-kBps bindings to the GPU opp table, listing the peak
> GPU -> DDR bandwidth requirement for each opp level. This will be
> used to scale the DDR bandwidth along with the GPU frequency dynamically.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 0ce9921..89f7767 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1392,36 +1392,43 @@
>  				opp-800000000 {
>  					opp-hz = /bits/ 64 <800000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <8532000>;
>  				};
> 
>  				opp-650000000 {
>  					opp-hz = /bits/ 64 <650000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <7216000>;
>  				};
> 
>  				opp-565000000 {
>  					opp-hz = /bits/ 64 <565000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <5412000>;
>  				};
> 
>  				opp-430000000 {
>  					opp-hz = /bits/ 64 <430000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <5412000>;

I suppose it's intentional that the bandwidth is the same as for opp-565000000,
just want to mention it for if it's a C&P error.


>  				};
> 
>  				opp-355000000 {
>  					opp-hz = /bits/ 64 <355000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <3072000>;
>  				};
> 
>  				opp-267000000 {
>  					opp-hz = /bits/ 64 <267000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <3072000>;
>  				};

ditto

>  				opp-180000000 {
>  					opp-hz = /bits/ 64 <180000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					opp-peak-kBps = <1804000>;
>  				};
>  			};
>  		};

assuming the repeated bandwidths are indeed intentional:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
