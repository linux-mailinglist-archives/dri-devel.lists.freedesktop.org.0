Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B8C691DCE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F91410ECEA;
	Fri, 10 Feb 2023 11:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B98210ECEE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:12:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v13so4415702eda.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 03:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MqqdeGeSDOP29ts8ZSXxn8P/fMFUJG2jOdDCPZL2sFU=;
 b=rSv7YC1f5xTpNXRb4obgqDngu8l3anLhPNDYGIcR/vrl82EmfI22S5ymgED6jT9Shk
 jFTryOaFC7CgsrzJP/gpPA7G9fwrczGjbWrBcGMEV3tJLybMQw6bRzknqjT7R0lTLPF1
 +y6ubtyU1BTi1h6YORk41jwU9CLuWtFNUSklPaI+eIMthz3gTMnrLgDi/gG9qkZACeGT
 +evGaU5UROzgcCLrodO3QkhpUxK6WwiyPTSra9eTriGwSO2wvx+gdfDuq/A0NJ7ncIdC
 fB1XPSsqZ/e+9Q9+++gAcGpHfJz6nSbAPvFDl+kUuf5H9Yl6K9tssHfHRnQ9IlBbJYK+
 lN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MqqdeGeSDOP29ts8ZSXxn8P/fMFUJG2jOdDCPZL2sFU=;
 b=EuEd2dg/w4s1AyJbjVaKYu41ZVucMViR/tXtwTOp9gJnXKQykjYcmlp3hGQk9GStwk
 UmH7STBMTl8n48lkl3+jIaNTpi6q205xzgR3S4GB/TX0rUCcynEnQWfkZfmK0O96YsBP
 cqJDLTwlz0jeV1hq5RiuroPc/zByxN4AbqdTu0E4mqpoPEk3cGFsoo+8rkX1ua2Sipba
 hMG2Pb95mEsZFy719l8d2LCxJFvNaz6YecOcqiNKsdEVYSDQl3ikWAyaFXRpC/mCwQ3O
 Phoc2VtR4UZCr2XEdg/tjFW8vrKlDcIfwBww8tdqlF9bQS3H/kO8k/DgPWdZnfMkTZa+
 rH3Q==
X-Gm-Message-State: AO0yUKWyyT8iNvXiTOBlQtCqwI6cGfY3KBTi1ErcTcHULbcSgNriyzh1
 E1sw/ql8XE+zJwlhteSKXkXUZQ==
X-Google-Smtp-Source: AK7set9QQ46UipbOQC1YYnmQvsAOXxecYxPv0DaiSHoq0lAeBY4V2HJNguMpMqEOMApNZnJF+mWipA==
X-Received: by 2002:a50:8e57:0:b0:499:8849:5fac with SMTP id
 23-20020a508e57000000b0049988495facmr15849783edx.40.1676027556681; 
 Fri, 10 Feb 2023 03:12:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 18-20020a508e12000000b004aacac472f7sm2037849edw.27.2023.02.10.03.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:12:36 -0800 (PST)
Message-ID: <7f85af25-efc5-6907-70ac-b264f110918d@linaro.org>
Date: Fri, 10 Feb 2023 13:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm8350: finish reordering nodes
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-5-dmitry.baryshkov@linaro.org>
 <a8bb4bf1-c4b6-ff02-d2e6-1407900bb006@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a8bb4bf1-c4b6-ff02-d2e6-1407900bb006@linaro.org>
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

On 10/02/2023 13:09, Konrad Dybcio wrote:
> 
> 
> On 9.02.2023 14:38, Dmitry Baryshkov wrote:
>> Finish reordering DT nodes by their address. Move PDC, tsens, AOSS,
>> SRAM, SPMI and TLMM nodes to the proper position.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> [...]
> 
>> +				phys = <&mdss_dsi1_phy>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				dsi1_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					/* TODO: opp-187500000 should work with
>> +					 * &rpmhpd_opp_low_svs, but one some of
>> +					 * sm8350_hdk boards reboot using this
>> +					 * opp.
>> +					 */
> It's not a part of this patch, but an idea came into my
> head.. could you check with socid that your HDK has an
> 8350v2.1?

I checked with the bootloader instead, if you don't mind:

Platform Init  [ 2701] BDS
UEFI Ver   : 6.0.210914.BOOT.MXF.1.0-00848-LAHAINA-1
Platform           : HDK
Subtype            : 0
Boot Device        : UFS
Chip Name          : SMP_LAHAINA
Chip Ver           : 2.1

-- 
With best wishes
Dmitry

