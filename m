Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2D39678F
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 20:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA966E42F;
	Mon, 31 May 2021 18:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88E46E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 18:03:55 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v8so17906031lft.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G6HGOX0Ipm1y9b+ZAda56dcVeACSyNSMODF3keW9xc0=;
 b=thkVknCrH/3gud2ZgNRdotryy473i4TU+0rCrB/puNykbYtxdrVq1fp+HB0/cXafom
 qOODTNKelsEq+ZtJvlRBr9tqFKiqKgZcSboRRBtK1LbGvj0reX6dRTvs23lPB4g+ZgOk
 SWxqaX6qu1Dpfng6cEMjeggT54GL+2QmwyFX+YqH+acKO2wbTxEjQjtKZae6WaijtL1o
 B8nMYsFlTQ+ViJsLHlMddIzwuPv02N//3h4UPSi9y6neMbEuYzFvgAxpl9ktbB6Bakuu
 3EYYyausto/85iRKeWY1rsdc2LUz8jRcvqz3mXJuHUmAKPeU8AdqCooKAo+2Q1o59wsq
 2JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6HGOX0Ipm1y9b+ZAda56dcVeACSyNSMODF3keW9xc0=;
 b=iyhEiz8Cd6xl2jyZigiHBxp/1/dhUzUrMOn5RTNQYeHKHa65M2bNGQMe4qb9tHKLzk
 HjMuxHb0P4LZsoHcel+KwrrNBVbVrW8AzQQNoojLKLKhh3dRH+orZ9eKpp6a/xd6R0/E
 XqiKiEpDMG8JPBstCTrXoU7GMXyfFy6z9pHgZK3/mwAnvb7NS6cldGCIJpnlLKlHwWdq
 IiMO54e7DPUU70YQ5VD+GdXCddZ3EQGEuPYAzIY5zyumAj94+qD+6QP4pY3lazEWxCjQ
 pzB92XdAL5l9b7db9uQf72XCblnbK6p9C0rYl/NYo+jISfRJaG3uBpGRE8S7bvLAZSGO
 ku2w==
X-Gm-Message-State: AOAM531dDfKeZ2wyMiC61stn8XoSR5dMJBRjvlkrtYkEyTuHAlFtTKVT
 sCFrDj/QwLFBsegb5gbkBMoOlw==
X-Google-Smtp-Source: ABdhPJyTt88Y4i2NAmmTuqgOByFFUH3ZIdEIdM5Ps1vyyUh+uap6N73Pa6+SJG5DjR39l0R8w5GoTg==
X-Received: by 2002:a05:6512:21c:: with SMTP id
 a28mr15579931lfo.298.1622484234170; 
 Mon, 31 May 2021 11:03:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g28sm54494lfv.142.2021.05.31.11.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 11:03:53 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] arm64: dts: sdm845: move bus clock to mdp node for
 sdm845 target
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
 <20210407150157.801210-4-dmitry.baryshkov@linaro.org>
 <2dc79aad-33cd-7b17-368f-d52d60d46811@linaro.org>
 <YLT1ziKiesQHEw1B@builder.lan>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <1481ca73-fff8-e98b-2334-be56e19e6c66@linaro.org>
Date: Mon, 31 May 2021 21:03:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YLT1ziKiesQHEw1B@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2021 17:42, Bjorn Andersson wrote:
> On Fri 28 May 10:33 CDT 2021, Dmitry Baryshkov wrote:
> 
>> On 07/04/2021 18:01, Dmitry Baryshkov wrote:
>>> Move the bus clock to mdp device node,in order to facilitate bus band
>>> width scaling on sdm845 target.
>>>
>>> The parent device MDSS will not vote for bus bw, instead the vote will
>>> be triggered by mdp device node. Since a minimum vote is required to
>>> turn on bus clock, move the clock node to mdp device from where the
>>> votes are requested.
>>
>> drm/msm patches were merged through the msm tree (targeting 5.13). Shouldn't
>> we also merge these two patches (targeting 5.13 as fixes or 5.14)?
>>
> 
> Does the vote for the bus clock result in an improvement or is the
> device simply not working without it?

This was requested by Kalyan Thota [1]. If I understand correctly, if 
the bootloader does not setup the bus vote, clock might not be enabled. 
Thus it has to be used from the device which handles bus voting. Kalyan 
might be in better position to comment on this.

Compare with 
https://lore.kernel.org/linux-arm-msm/1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org/


[1]: 
https://lore.kernel.org/linux-arm-msm/04b4612dfd3f651ead068725409211a0@codeaurora.org/

> 
> Regards,
> Bjorn
> 
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index 7395ef20b90e..55704804c2ca 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -4136,9 +4136,8 @@ mdss: mdss@ae00000 {
>>>    			power-domains = <&dispcc MDSS_GDSC>;
>>>    			clocks = <&gcc GCC_DISP_AHB_CLK>,
>>> -				 <&gcc GCC_DISP_AXI_CLK>,
>>>    				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>>> -			clock-names = "iface", "bus", "core";
>>> +			clock-names = "iface", "core";
>>>    			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>>>    			assigned-clock-rates = <300000000>;
>>> @@ -4166,11 +4165,12 @@ mdss_mdp: mdp@ae01000 {
>>>    				      <0 0x0aeb0000 0 0x2008>;
>>>    				reg-names = "mdp", "vbif";
>>> -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>> +				clocks = <&gcc GCC_DISP_AXI_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>>    					 <&dispcc DISP_CC_MDSS_AXI_CLK>,
>>>    					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>>    					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>> -				clock-names = "iface", "bus", "core", "vsync";
>>> +				clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
>>>    				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>>    						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
