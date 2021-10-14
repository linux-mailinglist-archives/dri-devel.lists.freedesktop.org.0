Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411442E161
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C089B6EC17;
	Thu, 14 Oct 2021 18:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7526E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 16:54:35 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i24so28728480lfj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FB7jURQ/cloxZX95b1lZK2eA7ZD1Fvj6ppcELfN+v1Y=;
 b=Fva9P2qYbLMXvPYYCUTLzGQVBRium3jhyc/Vv5l8krP4vjJdvYXkE7bn49sOnLidY7
 EhIpcHZPJqGAdSZ860b58YbSqb0K7oSR4zUYfUF7RFlK8zPrJ9ZQzoejl1ttjuwlT9wZ
 ehEZ8Jm6pYVhDh1KoMwD460X2rxoXq91Chtd4zyy3yYNqYSpUMKPTTkQZspa1s/iJ69D
 TMcdTy8fm0obj9E20VLM6GEHyCEkGBbJ0HN8ySi9YcnLwVRzCG+HNwK8rKEtXQE7O22Y
 KUZycXk/IZAfV2gOieqT1m7wzIeiouQL+gzeZr+sTDnHDM6wrX04aXcvw+luBY5m3mNE
 U79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FB7jURQ/cloxZX95b1lZK2eA7ZD1Fvj6ppcELfN+v1Y=;
 b=IrKLX4/rvJfZYkDQRDHiEMc8/euGGUmRwgJTrH0IX23Vrxkd0k34AqrjClxEdtEFmu
 sFX0L8Pb2uP717dqIunmr3mI9xwL6ETUfomGloh17YsRlWZ/Q9K9+ljYULXxrsmnm+MG
 5P31oOO1APi7OQLUJkUGNyS/1EF067eCXHPSQUo0Wn55SoY1/3QR+6qApe6Z7ho4khjw
 L9r0E7CVPARq/z/zFfyeohnT75K1Vz2Tqdv1rIcUokbLitDO49e8nUtdQ0gbFWBV6pjk
 0e0PBJrJsjnciZB2bMY0Htd2EhNRhngg5zJmOaUdxmg2xwyyGTCqfnpgqHHLoHRrW1Ma
 W9Vg==
X-Gm-Message-State: AOAM530Tw1XZQyHU21X9BbRJbSgLZA3U/jwrsJgO2dGxYb4CT9AQbQbw
 51bCnedYxIVKeUUQu4IQG5vyVg==
X-Google-Smtp-Source: ABdhPJxF+akf386pidSJ6bww34Ya7ziich6BCGwkslriO2XJi8SbN0D5iMJNBzDIq7se8Wcrm9rKHA==
X-Received: by 2002:ac2:5627:: with SMTP id b7mr6096938lff.670.1634230471954; 
 Thu, 14 Oct 2021 09:54:31 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi.
 [62.248.207.242])
 by smtp.gmail.com with ESMTPSA id b9sm302732ljq.137.2021.10.14.09.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 09:54:31 -0700 (PDT)
Subject: Re: Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss
 node for sm8250 target"
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <3af41112-7ccd-5da8-c189-3ed8d22273c0@linaro.org>
Date: Thu, 14 Oct 2021 19:54:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 18:34:00 +0000
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

Hi Dmitry,

On 10/14/21 4:54 PM, Dmitry Baryshkov wrote:
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

your sob tag is missing.

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
> 

--
Best wishes,
Vladimir
