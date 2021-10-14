Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634A42DE77
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C2E6E17D;
	Thu, 14 Oct 2021 15:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6602F6E183
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 15:42:22 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id g125so8974963oif.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ibfKdmBbKs8YG5Js109buSon4Qmub7UDY394dDMAH4w=;
 b=KgheEG/UXv0HI/BNZQhaEAEJT9Z5nbSCPmo6ZGo9h0lo6G4uzkobeo3/v8zD4qCRFJ
 Bncmx5JHh/YIxusm6Qxj3lv9L85DmKu7ugYRDBh7RUHkxSjJBFGlFnEOjie6fuoKTQ0d
 WB2zu+ZkQe7/aRf6vvTdQvxSKgiYNmod4P5d4b8L4wG0b+/kfQS/jfcvRyfaXKOvH+rq
 C5BtswYfDNrJo9f3tP+2CCGM0AfTCt/ZNvhS9nnHHWfst9u5eQM7mAeCNJhyKZpTU0dE
 CgKDdEqRRbDGGRRamKiZZ6bjUDoS8TJ88LuxVlyWWvmFYGnlaKOCpxXJB3qw4OQ2PwnE
 R/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ibfKdmBbKs8YG5Js109buSon4Qmub7UDY394dDMAH4w=;
 b=5a/XN0EMgg8GZFlb2Jc4nUl4npXwIRCT4hUmcUXT79dNfHOjkWVRwmSE7kRC1LxWRV
 W9ckZ5EmD6EZG1l8Hs+UTjuk+GczoFP00mmHjHNkAviYe9WWKkSivdsq8PfIVcovVnoj
 Yf78Zj0CGii1qcAOlSbJBsJNaE3d0TLx9I+annfJMlly7b3q/C7XF/EtJ4+PuaqZOo/8
 Iic4wmSOU2QjLufkS/XATY37iys6YIIyqwiKNrxBotMmGrHuMGdpU2xHql1BkW+Fs0Yy
 5BGZB/ENreCQUMncRV63ATeIarb3TS+ZIK4TY66YcxAxnfTXmNQamqsnC5ajo20Wj23d
 GLzg==
X-Gm-Message-State: AOAM531xSLQklnR3eb/dN/xjORKibsflwMpFdqizviywWp7InZsY47nY
 ZLoJyLmQhJrG/8oBrbR0XWfWOg==
X-Google-Smtp-Source: ABdhPJxI/fQjmhOiApXHpCZCw74jpPRDxZuw3p2+huSdF08a3MhSWCMRvxGCNobnB5MlHlo8kOIukg==
X-Received: by 2002:a54:401a:: with SMTP id x26mr4514908oie.117.1634226141500; 
 Thu, 14 Oct 2021 08:42:21 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id m13sm497647oou.25.2021.10.14.08.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:42:21 -0700 (PDT)
Message-ID: <298400eb-fe8d-6a92-6ff4-6188a8f3161a@kali.org>
Date: Thu, 14 Oct 2021 10:42:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss
 node for sm8250 target"
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>
References: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/14/21 8:54 AM, Dmitry Baryshkov wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
>
> This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.
>
> This upstream commit broke AOSP (post Android 12 merge) build
> on RB5. The device either silently crashes into USB crash mode
> after android boot animation or we see a blank blue screen
> with following dpu errors in dmesg:
>
> [  T444] hw recovery is not complete for ctl:3
> [  T444] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:539] [dpu error]enc31 intf1 ctl 3 reset failure: -22
> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> [    C7] [drm:dpu_encoder_frame_done_timeout:2127] [dpu error]enc31 frame done timeout
> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 8c15d9fed08f..d12e4cbfc852 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2590,9 +2590,10 @@
>   			power-domains = <&dispcc MDSS_GDSC>;
>   
>   			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
>   				 <&gcc GCC_DISP_SF_AXI_CLK>,
>   				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "nrt_bus", "core";
> +			clock-names = "iface", "bus", "nrt_bus", "core";
>   
>   			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>   			assigned-clock-rates = <460000000>;


Is this the correct fix for the issue?  I see those same messages on the 
Lenovo Yoga C630 every so often as well as the blue screen, however I 
see them on both 5.14 (which does not have the related commit to this), 
and in 5.15-rcX, which does.  Or does this just revert it enough that it 
doesn't occur as often?

