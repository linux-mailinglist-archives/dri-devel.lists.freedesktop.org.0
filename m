Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63B6C8380
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 18:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E96010E176;
	Fri, 24 Mar 2023 17:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FB310E176;
 Fri, 24 Mar 2023 17:42:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC91562C15;
 Fri, 24 Mar 2023 17:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391B9C433EF;
 Fri, 24 Mar 2023 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679679730;
 bh=sk7R+qaRnvRoyWIxFll8DPdn5wqX+Pp6np8xpvBRcZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxj9WV/IaFFX4jIdJ3milBTT3JlHExArc/Z4f+1/UtC229TqKbL1rMNHcYqoOtdNl
 pa853S/83SrYck1OLSCcvRigaFXNcSTyV+46DNrUChjEwGCYgtZkj8oA8Q8aBjZg7S
 dWuLlazxLkjXjVeQehHkjpkT5uG2gHlBNL95QLA2Gt2FeHcq5GdGrhg85tUrdKFdJy
 kFO/71V+xeVB4euOy6/Y73GROGYcDgzxLD1zdkvvmKO4tXQ0xjmcsTMI2UFWnucy4W
 fZUqdBh8GDsSfKUc7HA0wQnh0nmz6VSgjMxbzYAbvPgr/15QoktLoe4iDUCV/oSSRQ
 hBocaR0TrMPJA==
Date: Fri, 24 Mar 2023 10:45:18 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove invalid
 properties in cluster-sleep nodes
Message-ID: <20230324174518.2arvdglqqixmxqcp@ripper>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 10:28:47AM +0100, Neil Armstrong wrote:
> Fixes the following DT bindings check error:

Is that because idle-state-name and local-timer-stop should not be
defined for domain-idle-states or are you just clearing out the
dtbs_check warning?

According to cpu-capacity.txt local-timer-stop seems to have been a
property relevant for clusters in the past, was this a mistake in the
binding or did something change when this was moved to
domain-idle-states?

Regards,
Bjorn

> domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
> 'pinctrl-[0-9]+'
> domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
> 'pinctrl-[0-9]+'
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 78fb65bd15cc..ff55fcfdd676 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -255,22 +255,18 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>  		domain-idle-states {
>  			CLUSTER_SLEEP_0: cluster-sleep-0 {
>  				compatible = "domain-idle-state";
> -				idle-state-name = "cluster-l3-off";
>  				arm,psci-suspend-param = <0x41000044>;
>  				entry-latency-us = <1050>;
>  				exit-latency-us = <2500>;
>  				min-residency-us = <5309>;
> -				local-timer-stop;
>  			};
>  
>  			CLUSTER_SLEEP_1: cluster-sleep-1 {
>  				compatible = "domain-idle-state";
> -				idle-state-name = "cluster-power-collapse";
>  				arm,psci-suspend-param = <0x4100c344>;
>  				entry-latency-us = <2700>;
>  				exit-latency-us = <3500>;
>  				min-residency-us = <13959>;
> -				local-timer-stop;
>  			};
>  		};
>  	};
> 
> -- 
> 2.34.1
> 
