Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0274FB09
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 00:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D7010E454;
	Tue, 11 Jul 2023 22:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0663810E453
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 22:39:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fba74870abso9535067e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689115147; x=1691707147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P0bn8rwIJ27GiGioGfo1byioWdbBdTl+i2BZlsOSFxk=;
 b=oqe+r0GguKOzk9SdLcGLtkzAWK44wdBNDH850OzjfBTeEpjFuuYb8nyigVZJEODyuG
 jsODqFEJUULdQqDaccq3k64GF9UhAfg7dytLCdno62UL/WL7wwk8xZ7ok4EmVDOTNM5C
 pb/6u96oyjNiBXEX0ACoyB9s3JwvUqn5xnj6KWUX5LgkH9zN+Wo7Z2ZwkDp04lrOlwGQ
 +hftQPg2hw8oGmIuyQoem2ashypkl2uNPX5XhORGEpuh/Es8r10wVN3ecwKzZt0TCPMa
 QItYuwHbSV2rrv4+UMQ3mZEvzPdYgCYzpfB/+WOUGJ8KXZdPFg5hgjSr+xhmel5EtfUP
 IFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689115147; x=1691707147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P0bn8rwIJ27GiGioGfo1byioWdbBdTl+i2BZlsOSFxk=;
 b=MXuuIkVPOGU40a96N9dQ20jnVCqpMyJSaAYXrN2/8RJAJg3LVgRF3L+d/eKti7Gbce
 htY472riWzpsPNaTgsZA+Fv18+T/0klbZrIcm6UmbomJzm484apCmSHBWymHC9q/RhLt
 jayCXzN78lGAjqpVX2cGuX7fqYNneAQmxPIiS6ATF/thB/B8GxncZV7bywXDUbIkld9v
 xEJNjUpY4qctls570d8zy7eNcKfU1tMQcUvD6uCjq9eB32qe2yLiAT3Vn111kevOaOYO
 shDS0ylqIwRa+vACNptg6tl4t8po5QLwDp8BkbnK0wNCvFCnSxY3SaolMrEoy6/QCEFU
 mlYA==
X-Gm-Message-State: ABy/qLajYIFCYCv5YR8TNvVMPh/Md7k6El9t4sBqjtEkeH3e63+7nWIh
 iG/N/BSH9Tw7a+qmTBYeJwacgw==
X-Google-Smtp-Source: APBJJlGKbiNBJNdCieqpqx2ESCXbMqLf0EQvxyZdBv07b1AeCFWbrat1ZnIw+t6HvTanUHdGD13aDw==
X-Received: by 2002:a19:e054:0:b0:4f8:7055:6f7e with SMTP id
 g20-20020a19e054000000b004f870556f7emr13511852lfj.44.1689115147257; 
 Tue, 11 Jul 2023 15:39:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a19f60e000000b004fbae60b970sm468143lfe.68.2023.07.11.15.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 15:39:06 -0700 (PDT)
Message-ID: <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
Date: Wed, 12 Jul 2023 01:39:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
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

On 12/07/2023 00:36, Konrad Dybcio wrote:
> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> [...]
> 
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				redriver_phy_con_ss: endpoint {
>> +					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>> +					data-lanes = <0 1 2 3>;
> That's USB+DP lines combined, or how does it work? I'm confused :/

4 generic purpose SS lanes, which can be purposed for USB or for DP.

> 
> Konrad
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				redriver_usb_con_sbu: endpoint {
>> +					remote-endpoint = <&pm8150b_typec_sbu_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &mdss {
>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>>   };
>>   
>>   &usb_1_qmpphy_typec_mux_in {
>> -	remote-endpoint = <&pm8150b_typec_mux_out>;
>> +	remote-endpoint = <&redriver_phy_con_ss>;
>>   };
>>   
>>   &usb_2 {
>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>>   			port@1 {
>>   				reg = <1>;
>>   				pm8150b_typec_mux_out: endpoint {
>> -					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>> +					remote-endpoint = <&redriver_usb_con_ss>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				pm8150b_typec_sbu_out: endpoint {
>> +					remote-endpoint = <&redriver_usb_con_sbu>;
>>   				};
>>   			};
>>   		};

-- 
With best wishes
Dmitry

