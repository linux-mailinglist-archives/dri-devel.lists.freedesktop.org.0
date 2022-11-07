Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2872861F100
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 11:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC2010E2C9;
	Mon,  7 Nov 2022 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E2F10E2C9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 10:46:30 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id c25so15558473ljr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 02:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5MDDAXa8IRw5p9rl+GiC7riEtVmh8Gwkk4sc9znBsQ=;
 b=yjhKeDwzkK7xlEhAN3vJRmSnRn5UsFC0h2qMfFeq7gjYgomws/qFZMamo/TOaD0coK
 jwh7A77oKSRWD0e5edIfuA1zJiWxUqD3JNoy/9erdccKWhLBTNLHTQqiA0JmNnn46WGF
 1QVba+arjBlTCBr3pD2WxfSuyrI2FQPBDxnoJVtuNMC/CUAeJjFXWxnm4Lq5IQ9zDyaa
 ZqqU75SbLONPVqjevkwjeIchO2UEJ57K4wk3Az/zs1iDWdZdt8VS5XUMrD+3y35iASHF
 IrYpMJVoNmwTqyc/lVdYekKSJc7v0eEQXly1oGydiLZzJrWWCeJKRHiEUB6zxF8flWkR
 SBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s5MDDAXa8IRw5p9rl+GiC7riEtVmh8Gwkk4sc9znBsQ=;
 b=K4cbEx4F0LfF9BO5kBii81I45E1n4mUhZMbLewZEaQHsKQT3kLcmIBTpjk3f6SM3z0
 tMbmmdyAK8gkE7bDjF6StLKf4uxB445jmpQptPl9nNRXjK2/0hur+YaT0fYfhhSu1Ri9
 jpXnPCoWcYjF+MM3zXX6ih+CKirGsJdZgd83WahdkFYT3mUTuVy4p1sAR2v1e17ZJrtZ
 tFXoO3wyP/lvt5zL9O7GZ2RT+qb+3haN0jtUhSktIhEy0q/6tP6Y5K7fuc0tvdJEpFfK
 JpFCDYSG0eagOSQSTSBx+XKBkC5BUlqM5LJZXnEOsl2Wu076ftkNFH5e2bbPFiVj4ndh
 ZdRg==
X-Gm-Message-State: ACrzQf1hHbayoYMUeYwMExd4sb7i47yhgyIQ/I+lHclK6XQUKN9rtm9C
 bSo3sm3DzKp6BQl82lxlF1cjhQ==
X-Google-Smtp-Source: AMsMyM4Kvpme3xgciEbA2G0h5fSNqcNALszrO4u+9XgylLUtLBOKkQxUaWnDHLFPPOa3sHtHQqCAYA==
X-Received: by 2002:a2e:a30d:0:b0:277:1c75:b73f with SMTP id
 l13-20020a2ea30d000000b002771c75b73fmr18044987lje.458.1667817988463; 
 Mon, 07 Nov 2022 02:46:28 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a2ea0d2000000b0027776efa48csm1145125ljm.91.2022.11.07.02.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 02:46:27 -0800 (PST)
Message-ID: <dc19c341-c653-c60e-dd45-5c87ed4c6811@linaro.org>
Date: Mon, 7 Nov 2022 11:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
To: Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
 <20221106043011.pw5fqeame7otzdcn@builder.lan>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221106043011.pw5fqeame7otzdcn@builder.lan>
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
Cc: devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06/11/2022 05:30, Bjorn Andersson wrote:
> On Fri, Nov 04, 2022 at 04:13:56PM +0300, Dmitry Baryshkov wrote:
>> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
>> configuration (yet).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index 38ccd44620d0..e1a4cf1ee51d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>>   	vdda-pll-supply = <&vreg_l1b_0p91>;
>>   };
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_mdp {
>> +	status = "okay";
>> +};
>> +
>> +&dsi0 {
> 
> Please prefix the labels with "mdss_" so that you can keep them sorted
> alphabetically.
Why such a change all of a sudden? Only downstream (and sc7280 upstream) 
has mdss_ prefixes for dsi. Plain 'dsiN' is more generic.

Konrad
> 
> THanks,
> Bjorn
> 
>> +	status = "okay";
>> +	vdda-supply = <&vreg_l6b_1p2>;
>> +};
>> +
>> +&dsi0_phy {
>> +	status = "okay";
>> +	vdds-supply = <&vreg_l5b_0p88>;
>> +};
>> -- 
>> 2.35.1
>>
