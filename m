Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6236BE4E9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC75B10EEA5;
	Fri, 17 Mar 2023 09:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9873C10EEA5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:07:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so2820064wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 02:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679044021;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FkEW8ZYuZi33cVLz405PPEYTVS02b7guai4VJnc/u0s=;
 b=Q6GGawkHUaBC3zY4KVyRU2zkTV8I/A3fQwxW7vTpJrTozVht9LImkNfbBCRCosXa0m
 pd7TBNyANDkYveJ2bhPyAp4KF6gKFGL5nSe71B61hyNABpnJuYVwciehnVTke16XsHkt
 FsBJJhM40ydNvoYFsecqfm0EzfkcQunE5FgD8M6ukgPmOfmmmPgu/4NlxdQjJpj+hPYJ
 axfR6dGJrSVb3HtEHlPHaxD2AyWfNzbMa4+JeWw0nvc6HsJ085fcxmt3vgf5tLRbSyby
 YeUW4PmcBtee2DYPwXFAwToI8SgWqv+LAG8OKBai099FX6K2zS8T9UqV+0L1tZUy9wWV
 d3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679044021;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FkEW8ZYuZi33cVLz405PPEYTVS02b7guai4VJnc/u0s=;
 b=0cf7GphdqJV1BWAxK8wz+HzGA//hY3HenJyKxRp4zJHscEkVi2mqRTCoxcZrn5wxFB
 0/Mmh7vIP/n+U5SXRwj02BcPefHTzF+h/JQqeGxsiqOHnaK28mIfFyPYmNeSHb5PqTb5
 cWddvy+ONjWNLK+gIb3MYISwuFbbIaBFSs2jPa7ki2/x9sYSTXqbNDoNpG9wUuDMduRb
 E8ybouAifthu1Cqo0Kt61LW96NQaEVdQxUofmAqc5DiR/zhxb1gmKmQlPxMUWGpHhFrs
 TQgB9reTCLUxQNRS/vpw5VIrDv3oSZi2zST/Zlw0KIpY81DZgBl11Akgdpn7c2yDWujX
 DWKQ==
X-Gm-Message-State: AO0yUKWVH605KZc4lz2cyFPeVTpLtmrlPnTWlyVm/eKDs3dS2CUvWEza
 7RLw9NAMoXs34OQLqIduTklqvg==
X-Google-Smtp-Source: AK7set+A4ni6dKWDcGtNRjRWaK1QKtVa/vvIX67r+ZAtb/CzWUnqPiOUWmFYG5d7yJ93VdhYmJaZlw==
X-Received: by 2002:a05:600c:450c:b0:3ea:e7e7:95d9 with SMTP id
 t12-20020a05600c450c00b003eae7e795d9mr25428831wmo.32.1679044021068; 
 Fri, 17 Mar 2023 02:07:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9ed5:bad0:e925:7938?
 ([2a01:e0a:982:cbb0:9ed5:bad0:e925:7938])
 by smtp.gmail.com with ESMTPSA id
 ay38-20020a05600c1e2600b003df7b40f99fsm7331479wmb.11.2023.03.17.02.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 02:07:00 -0700 (PDT)
Message-ID: <8a6ecd92-ff4f-e72f-457e-4061546dc46f@linaro.org>
Date: Fri, 17 Mar 2023 10:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sm8450: add dp controller
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v4-5-dca33f531e0d@linaro.org>
 <c63ecdc2-11e0-79d2-8647-284913f0c0da@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <c63ecdc2-11e0-79d2-8647-284913f0c0da@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 23:12, Konrad Dybcio wrote:
> 
> 
> On 9.03.2023 10:19, Neil Armstrong wrote:
>> Add the Display Port controller subnode to the MDSS node.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> [...]
>> +
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
> Downstream seems to use 19200000 here

Ack, will update.

Thx,
Neil

> 
> Otherwise,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
> 
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-810000000 {
>> +						opp-hz = /bits/ 64 <810000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +				};
>> +			};
>> +
>>   			mdss_dsi0: dsi@ae94000 {
>>   				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>>   				reg = <0 0x0ae94000 0 0x400>;
>>

