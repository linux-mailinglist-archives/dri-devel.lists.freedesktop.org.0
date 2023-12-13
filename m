Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3665810CDC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 10:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CBF10E718;
	Wed, 13 Dec 2023 09:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112DF10E729
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 09:01:34 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d3448937ddso7764915ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 01:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702458093; x=1703062893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=53Yx2oyNvccls8Q69HZyTUsKG1EVUBhUWv/h4RTQOE8=;
 b=gDyC8pGRilqCL46bNLs6jxzv/v5rCCukDSLBP7uo37fHmnocqz4BsyTCTFkbVpLrOa
 0GEputXHDLuR3LJsn8xwWFv2ANxJpgmDRfuckny9tARjU4AKr0IOa+ITXkPSn0wg/kDQ
 hGzdZr9JSmAL990CEkdO5llEOhemFWBGqUMJjTLTbCFjSvq19xSVm5KprmBYd6wUmmH8
 QevZVFuiI5zmqI0GaLHl3M7dBNJIEpB4g5Aghhw9aq6pAdaVPvXljFCd9GSbPcH+QCoA
 BzmfKdPplne5gKJHA++rnLGobPcLS7VVU4xiY8+kX3Wevt/Ub3ZhSpzxU1Z+uvillJR2
 cPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702458093; x=1703062893;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=53Yx2oyNvccls8Q69HZyTUsKG1EVUBhUWv/h4RTQOE8=;
 b=qlQBBriNMTwP6a7+UL1EsVEu8ODdA/utjvAmw36xA2xrZKpuLZcDUCi2x4ltF8xxse
 HqyJFRgl66yxldgx1ZKBkvufeUWoJRmIYpr14khNXeuCZnqh8raTAnEHkXenhFtUjsXT
 9A/GIZdityh1kUUQu8V21/898/hJ25puK4Fu9298uwzHKV2+MknV43GokDiOvqsJ91EH
 v57lTbp023YBl53i61WJnitFqX/xoIfzXBqmK+zABXM2iRYuYDaHYl4N3f83CginIMNP
 xA2xP/7oFwBUdoZ8UP5MndvVMUwUZxPf0FtjPcX6KPuNWTFDEiBxIF2W7SMmwTqZvTn/
 mEWg==
X-Gm-Message-State: AOJu0YxpiBFqnkx5mwkozrmQuKTFZ6fpDXa8xuQlxYaHqYzJQpeGNSxS
 Uww/3SEl3P+psn0SlzuZzGDNzw==
X-Google-Smtp-Source: AGHT+IG4QyI7RGxXk3kSpPRgRBNiVvXnrI7fkjweoJj3AbhsPhMFNkFCfei8CH8UIUS9hpxYTJbA0w==
X-Received: by 2002:a17:902:650e:b0:1d0:6ffd:f22c with SMTP id
 b14-20020a170902650e00b001d06ffdf22cmr4207798plk.130.1702458092071; 
 Wed, 13 Dec 2023 01:01:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:596e:6d4f:fc0a:ec65?
 ([2a01:e0a:982:cbb0:596e:6d4f:fc0a:ec65])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902748900b001d33e6521c1sm2516143pll.102.2023.12.13.01.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 01:01:31 -0800 (PST)
Message-ID: <e45e4887-9a28-4f58-8c1b-247ae6d2ca67@linaro.org>
Date: Wed, 13 Dec 2023 10:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add USB-C ports to the
 USB+DP QMP PHY
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-8-dmitry.baryshkov@linaro.org>
 <5025892d-0cbc-462a-b7d8-95828680dd8b@linaro.org>
 <CAA8EJprp+Rf5BKEnaoCooWVKGfg6SRg-uc=NRywc10qy=Yj2Xw@mail.gmail.com>
 <f0f40f33-ebcd-4d68-86b2-3839bb8e49a3@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <f0f40f33-ebcd-4d68-86b2-3839bb8e49a3@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/2023 10:50, Konrad Dybcio wrote:
> On 11.12.2023 10:46, Dmitry Baryshkov wrote:
>> On Mon, 11 Dec 2023 at 11:33, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
>>>> Expand Combo USB+DP QMP PHY device node with the OF ports required to
>>>> support USB-C / DisplayPort switching.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 23 +++++++++++++++++++++++
>>>>   1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>>> index ea7c92c0e405..38423a9f8408 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>>> @@ -3447,6 +3447,29 @@ usb_1_qmpphy: phy@88e8000 {
>>>>                        #phy-cells = <1>;
>>>>
>>>>                        status = "disabled";
>>>> +
>>>> +                     ports {
>>>> +                             #address-cells = <1>;
>>>> +                             #size-cells = <0>;
>>>> +
>>>> +                             port@0 {
>>>> +                                     reg = <0>;
>>>> +                                     usb_1_qmpphy_out: endpoint {};
>>> style 1
>>>> +                             };
>>>> +
>>>> +                             port@1 {
>>>> +                                     reg = <1>;
>>>> +
>>>> +                                     usb_1_qmpphy_usb_ss_in: endpoint {
>>>> +                                     };
>>> style 2
>>>> +                             };
>>>> +
>>>> +                             port@2 {
>>>> +                                     reg = <2>;
>>>> +
>>>> +                                     usb_1_qmpphy_dp_in: endpoint {};
>>> style 3
>>>
>>> :(
>>
>> Which one should I stick to?
> style 2 seems to be used in 8650

I used style 2 for 8450/8550/8650 usb & dp ports, but the 3 styles are present in the qcom dts.

Neil

> 
> Konrad
> 

