Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF26397F7
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DC110E178;
	Sat, 26 Nov 2022 19:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0E010E175
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 19:03:59 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g12so11549596lfh.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 11:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xJpb+WkZomiEzVr3FB9WEc1c2EffiMVPclC8fGlh3s8=;
 b=dJgBE61y1TEmCKX4hb3KjCC5icYw0Rjg5nXCZ8mYvHKGctBqvJN8rZATLAR1yQEnjC
 Sj2cN7RDvYRRE/War1xcr8lYTXHbs3Psnuq/vWD5tE4I8eI6dgfpi8E0lfomzrmWU6sZ
 2dE6Nbr5P2Tc92US/3araYp2EOh42i9T2C4t+AD2IS58hrmctQN+Cfg35OhC89KV6nuq
 sOEHmvct96WKxyM7JvA4rYNGLNZZwaWB0SScG44WRu2nS+kE7KPhUZz+TLijpLGD0T6I
 5OOPFMmGhZDcXOQo4q5FmqQ0YpZUpflmtaLvpkhGR0b1q81ZCj1EcLNMD5binun0hcxX
 XomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xJpb+WkZomiEzVr3FB9WEc1c2EffiMVPclC8fGlh3s8=;
 b=TnF7to5gIZYA6yuYbM9AuHMUxNbOBKuoMQF8IjS6FPQ/CMSddpnx7IKKfEy4ZUwa3L
 8td/VIAhOHYfRupO+0X39aqPZxpeWJwcXjUJ4mcGk5+acb+xIXvxvDtd/kldHyHUQ6H4
 rCU3HPVp6HyOJ0bZ80tqnWiQyDIy4DAzUTE1GZMNErn96j7kAJhrXhYeyPeL6nW7M3y0
 q6Ndib+XT9OLi5T+MFWFTQWGzVyI5lUOKRlcdO+VkZiyH+ND2PEeqjDY44ZtBpqxunwZ
 yChHisFo5BXgl03TCmOCIOE0cze4mUaLfx+ZF1wjjEduRBqt1o0a/6N88TwWGJAExcjf
 bNcA==
X-Gm-Message-State: ANoB5pnTrBdFug+xAW5l1J9d/+8v/coTlS+Jcbhef4ImVEHRnzehXmy8
 pnNONEBDLrj2ZyM+f+twclyzrA==
X-Google-Smtp-Source: AA0mqf513EmQbR4frhOdq/bbbyDNS7W6KiUDqApBp0la6BHiUOGHcbkMtbdFVBN2q5QtFbEZzZ00vQ==
X-Received: by 2002:ac2:4d44:0:b0:4b1:2aab:7cc0 with SMTP id
 4-20020ac24d44000000b004b12aab7cc0mr9740288lfp.553.1669489437839; 
 Sat, 26 Nov 2022 11:03:57 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 b29-20020a0565120b9d00b004946e72711bsm998920lfv.76.2022.11.26.11.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 11:03:57 -0800 (PST)
Message-ID: <4a2a36ee-85d3-bf6d-ec19-87a89831f67e@linaro.org>
Date: Sat, 26 Nov 2022 21:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sdm660: Add compat
 qcom,sdm660-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-17-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-17-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sdm660-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sdm660 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index 10bf1c45cf6ec..f8ec728e67f3d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
>   
>   &mdss {
>   	dsi1: dsi@c996000 {
> -		compatible = "qcom,mdss-dsi-ctrl";
> +		compatible = "qcom,sdm660-dsi-ctrl",
> +			     "qcom,mdss-dsi-ctrl";

So, we'd end up with two identical DSI hosts, but one has compatible 
'qcom,sdm660-dsi-ctrl' and another one 'qcom,sdm630-dsi-ctrl'.

I think, use sdm660 for both of them (for both sdm630 and sdm660)

>   		reg = <0x0c996000 0x400>;
>   		reg-names = "dsi_ctrl";
>   

-- 
With best wishes
Dmitry

