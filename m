Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45261F220
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571B510E2EB;
	Mon,  7 Nov 2022 11:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A855610E2EB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:46:26 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id c25so15799337ljr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 03:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JKZi6enSst2kWBJr01vLjOt2FvneWEg8LFzz5LHGB0=;
 b=jRVQIfmhXkPyQnD1t0mtaV1FdLeZIGj3gSbWh1rV/Z4ZOVlfY1/hK0O5VkF0xmCWOp
 Oi/hUjXVsGyFoWijFXycIFRbt8rXdq6HltPG7+Q3sfTeKCnglMKmU/1dv0XliC+qLYp8
 KnbVu3PoifP80c87ciD4PHRNArjB9XIUQ4GcFBcQgyf8q23ONyTdnrK0AjdFf9R47Z2X
 hu+i+p1M+qlgmEluomPb91cwXF/CwqUx2bkHAkgs4/nKLFRT07XnQSsDc9DnlpKA7bF2
 aQnHXZPKtkCh0nf51yYKDew4qY8SNHunHgCiK5BA6dPQSCPkZCn66qqo073FJNZxpcEo
 UqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+JKZi6enSst2kWBJr01vLjOt2FvneWEg8LFzz5LHGB0=;
 b=TuJ+eTr905lNQ+SgGzVPjg2oltzPIrxdBK2RzOimKaqx54/xxpSi8qkxZvJkHjjjko
 oRNXuC71kzXBwsu6Zt7uGqxJOzkSuYGrjucMKcRWITckMM/2gPYcN1+v1GNBfCEQ7RUS
 aszId3MCai4PIdtNWPd6lH7rjUOU2Sw7fk6H80RCG+YR/clyADuvuMveppdC0l1g7qv+
 DzjLGBG8aCdwvG9hrDIe0hlOTQ7ms04Aq/WrHdLFEeom3mCKQtIgI1rYbf5iu6Qj9uFf
 SYE39jjW/ZOaRxcq/wMQBF4lLEKXhHKT4ByUw5p9MnmuhfFSI4lqAM6+QZSH+cstkRf/
 6OeQ==
X-Gm-Message-State: ACrzQf1pDvsgR/nlzVTP+8tFGCc7XR+gGlmjPyNzxsGYDNMvQ1q2zSUG
 D3ti6ui/OONb1TxNQr+vZ1+7sw==
X-Google-Smtp-Source: AMsMyM5mKL7r8syre1BT4ctSIJFcHz6VTdD+N62rT1HzWdp50D84I5g9TtrE6H6vZRgIfavxv+ReSw==
X-Received: by 2002:a2e:a367:0:b0:277:7daa:cec6 with SMTP id
 i7-20020a2ea367000000b002777daacec6mr7265039ljn.265.1667821585056; 
 Mon, 07 Nov 2022 03:46:25 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056512324a00b004afc1607130sm1204444lfr.8.2022.11.07.03.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 03:46:24 -0800 (PST)
Message-ID: <819dc2f9-c1f2-201d-d611-f8b2a323473d@linaro.org>
Date: Mon, 7 Nov 2022 12:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
 <20221106043011.pw5fqeame7otzdcn@builder.lan>
 <dc19c341-c653-c60e-dd45-5c87ed4c6811@linaro.org>
 <163d117e-e519-e86d-b052-e4a2a53388d7@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <163d117e-e519-e86d-b052-e4a2a53388d7@linaro.org>
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


On 07/11/2022 12:36, Krzysztof Kozlowski wrote:
> On 07/11/2022 11:46, Konrad Dybcio wrote:
>>
>> On 06/11/2022 05:30, Bjorn Andersson wrote:
>>> On Fri, Nov 04, 2022 at 04:13:56PM +0300, Dmitry Baryshkov wrote:
>>>> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
>>>> configuration (yet).
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>>> index 38ccd44620d0..e1a4cf1ee51d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>>> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>>>>    	vdda-phy-supply = <&vreg_l6b_1p2>;
>>>>    	vdda-pll-supply = <&vreg_l1b_0p91>;
>>>>    };
>>>> +
>>>> +&mdss {
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_mdp {
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&dsi0 {
>>> Please prefix the labels with "mdss_" so that you can keep them sorted
>>> alphabetically.
>> Why such a change all of a sudden? Only downstream (and sc7280 upstream)
>> has mdss_ prefixes for dsi.
> For keeping the nodes together - this makes review of code and patches
> easier.

Ok, I can see the reasoning.


>> Plain 'dsiN' is more generic.
> And why the label should be generic? Label should be useful and
> descriptive, although not too much, so mdss_dsi still fits in reasonable
> choice.

I was under the impression that it should be. But you're right.


Konrad

>
> Best regards,
> Krzysztof
>
