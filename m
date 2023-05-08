Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387B06FA79F
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7577910E203;
	Mon,  8 May 2023 10:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E6F10E203
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:33:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f24d4900bbso1281277e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683541992; x=1686133992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ouHo7zR5/nEeID59MhsBNJUWJPBlxiSaILyid7Xi4po=;
 b=IrBMZQZQsf6YLTPsDLSPu6hI8VzWC0QkePEAUIIUI3vxrblNKGa+eewh7BPkynhhiD
 mlBFubuQqhOC9sWaJJFDBXxzV9dr6IfTLfufPm1f150hLrroXgJmn3VDC4Gm9uXq8Vp0
 hdALtoG5lbrNoQQ2JjvbjFNc6Fm3DIkPN7560jg+Iyt2EtAA+pcpBYEGLR8d5Cu/ef+d
 L+AWQb1MHdl6Xe/c9tMvp220ySbm1cK/owaGE4Ss5ntCVZmbmph2h9lkynXMyPN+Ka3M
 fQ0Alea88Jt72lwRNJoTPZXzSigCfQGFMZVK4gIKO0Jaa/RcVuCl+bXG+t11/mhZVuTr
 syUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541992; x=1686133992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ouHo7zR5/nEeID59MhsBNJUWJPBlxiSaILyid7Xi4po=;
 b=AUmZ6o4yCqKpTeJGrnLEewnSBr/ndFdDaBh4OVCezaU92uy5BtxG0EJjK6/bv2V0u5
 FrmNnLcMmTysNxx51lQ4WGzDDHOQMogfhXVfaRSdZMByduzbesV99P8pHZyEc0twoGn0
 PANCHjsQn0+5ZcG4KzfWfL6q/N/47Xh3b4z0SAzr35WCqM7eUKPw85ZaFI0/GE6ouhoB
 AftfVrXxo6iTeoD0Wp2FHWsBWZXdWYU2hLl5siHo+/YiAHr6Zk/lQLZD5LZ/0jycP88O
 7vvAjDXNxcHZS5mEzIJsjsOgL/FGOTC2b2BYPRq3WdZBjJUwiMyu8DVnZwLJmQLatUPD
 xhZQ==
X-Gm-Message-State: AC+VfDyAJdM97Pl9yjZ9KlK0gD9MDi/1X5r/JvrZpklZc5fvqgxT2EZX
 TS0d6urJgG0+51HMUUrdNkeREw==
X-Google-Smtp-Source: ACHHUZ4brFre2/8Y6K2a+AaHZm9B3InvOm7DPzyVMAY0+cNjjeeh6Ymi01ItA9JNbfwZCSNwGHW6OQ==
X-Received: by 2002:a19:ad45:0:b0:4f1:4300:80e2 with SMTP id
 s5-20020a19ad45000000b004f1430080e2mr2493651lfd.32.1683541992278; 
 Mon, 08 May 2023 03:33:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e24-20020ac25478000000b004f1482d9db6sm1247211lfn.155.2023.05.08.03.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:33:11 -0700 (PDT)
Message-ID: <ca274ec9-81bf-c426-6ad6-93eb34b52b05@linaro.org>
Date: Mon, 8 May 2023 13:33:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and
 MSS
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
 <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 11:33, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
>> differs from the one defined in the msm8974, so it overriden locally.
>>
>> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
>> similarity with other platforms). This requires a patch for remoteproc
>> to be applied [1].
>>
>> [1] https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> index 6b047c679370..c893afc00eb4 100644
>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> @@ -4,6 +4,8 @@
>>   #include "qcom-pm8841.dtsi"
>>   #include "qcom-pm8941.dtsi"
>>   
>> +/delete-node/ &mpss_region;
>> +
>>   / {
>>   	model = "Qualcomm APQ8074 Dragonboard";
>>   	compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
>> @@ -17,6 +19,13 @@ aliases {
>>   	chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>> +
>> +	reserved-memory {
>> +		mpss_region: mpss@ac00000 {
>> +			reg = <0x0ac00000 0x2500000>;
>> +			no-map;
>> +		};
>> +	};
>>   };
>>   
>>   &blsp1_uart2 {
>> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
>>   	};
>>   };
>>   
>> +&remoteproc_adsp {
>> +	cx-supply = <&pm8841_s2>;
>> +
>> +	firmware-name = "qcom/apq8074/adsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mss {
>> +	cx-supply = <&pm8841_s2>;
>> +	mss-supply = <&pm8841_s3>;
>> +	mx-supply = <&pm8841_s1>;
>> +	pll-supply = <&pm8941_l12>;
> High time to move this to rpmpd!
> I won't object to adding this though, as it obviously works
> and is already used on other boards..

I think the problem is that they are not level-voted on this platform, 
so they are regulators, not PDs.

> 
>> +
>> +	firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
> Could you please keep it one entry per line?

Sure.

> 
> Otherwise,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>> +
>> +	status = "okay";
>> +};
>> +
>>   &rpm_requests {
>>   	regulators-0 {
>>   		compatible = "qcom,rpm-pm8841-regulators";

-- 
With best wishes
Dmitry

