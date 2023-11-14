Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7DE7EB17D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 15:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5A910E1E4;
	Tue, 14 Nov 2023 14:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6669D10E1E4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 14:06:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40853c639abso44300115e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699970776; x=1700575576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=jrai/sdbc7ZGz/hysCFLS6pOSapKhsTENd3DlRn0qxg=;
 b=TqD8Wa0e5/MBO00u+RVQKndtn8+AyIaw5hOUhzkDj5NBEIrGsUxHuoz9oN63MVAVaS
 Ow6maIgWiTbbDgzZpdGizXEXRlsMTsXiq89zLHQxCcK1A07R9jX3weA76TCG9tyHIMjB
 6eiAcv7Ga+0vvIZFiqnwJUwmX/TuZDh2chnNDhlrwkrCQWjPUbiLj8d0zD5itQ3eb4Tz
 /IYzap192m1P7269SMUdpgtiFkrT1ioM7wjvXtZBjzrkUuW5GAKLXhkG64OiyxB8p/iR
 Lwq8IhZikEFq1TWObYosutxnIJlNjoH1uSS45il65y20ZI2m7dWC22STfeHLxUWhFMcj
 cnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699970776; x=1700575576;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jrai/sdbc7ZGz/hysCFLS6pOSapKhsTENd3DlRn0qxg=;
 b=Ng1iVufpetU+qh1KJCmimW9/LO7eF5Bo3ZvjQio16VgUqNIlac1yICaj8Jj81qNia4
 L0DihtRDgZZj8iG48B0R6Rf3hNOkHGZoQUQtojLkKVEhRfJtnSGIrfustrkZKnzq5FsJ
 i2kgwRYJoHnwzdChQ1CM4kBJG67cGjP218Wtu67n4QfmUXm9vSaWNYCvbEFdl/AppD01
 9FOMjjDxb9BOhtH4cdmlss2/NdWStUH5iuoaTUABKPHWGy0emA7wbvlYM4yiTp1/Tw3j
 rqdXdnWuqY0bf2/cG9ZaYxqaZLdeqFENY5puzzVIdxV3ldidzf2IGVgcQ0rYUG2oU8ok
 ceRg==
X-Gm-Message-State: AOJu0YwMC/wWsYJrjPSwqLA9tPlzyzxVXf0jTmpI/w2Wb0vo5LjmkhU3
 YrSuWWY/PnB40NL+1BAJ75xJEg==
X-Google-Smtp-Source: AGHT+IGlem3kpd2X8ZlXv4Krn4u2fmtehWx3hmyYlycOZ7Roa+TUkZU62aQgD9nsCpgXZU089vjG5g==
X-Received: by 2002:a05:600c:474e:b0:401:b2c7:34a8 with SMTP id
 w14-20020a05600c474e00b00401b2c734a8mr8235339wmo.7.1699970775714; 
 Tue, 14 Nov 2023 06:06:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf?
 ([2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a05600c330900b0040a3f9862e3sm627965wmp.1.2023.11.14.06.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 06:06:15 -0800 (PST)
Message-ID: <1fd6bc47-0044-44c8-ac53-b9b7262606b1@linaro.org>
Date: Tue, 14 Nov 2023 15:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 02/12] dt-bindings: soc: amlogic, meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Content-Language: en-US, fr
To: Rob Herring <robh@kernel.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
 <20231110201223.GA347493-robh@kernel.org>
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
In-Reply-To: <20231110201223.GA347493-robh@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2023 21:12, Rob Herring wrote:
> On Thu, Nov 09, 2023 at 10:00:03AM +0100, Neil Armstrong wrote:
>> Add a thirst example covering the meson-axg-hhi-sysctrl variant and more
>> importantly the phy subnode.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>> index 16977e4e4357..2edf4ccea845 100644
>> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
>> @@ -158,3 +158,44 @@ examples:
>>               };
>>           };
>>       };
>> +
> 
> New example should be separate starting with a '-|'.
> 
>> +    bus@ff63c000 {
>> +        compatible = "simple-bus";
>> +        reg = <0xff63c000 0x1c00>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0xff63c000 0x1c00>;
> 
> Why do you need all this? 1 cell is the default for examples.

Bad copy-pasta from previous examples, I'll fix all that and separate examples with '-|'

> 
>> +
>> +        system-controller@0 {
>> +            compatible = "amlogic,meson-axg-hhi-sysctrl", "simple-mfd", "syscon";
>> +            reg = <0 0x400>;
>> +
>> +            clock-controller {
>> +                compatible = "amlogic,axg-clkc";
>> +                #clock-cells = <1>;
>> +                clocks = <&xtal>;
>> +                clock-names = "xtal";
>> +            };
>> +
>> +            power-controller {
>> +                compatible = "amlogic,meson-axg-pwrc";
>> +                #power-domain-cells = <1>;
>> +                amlogic,ao-sysctrl = <&sysctrl_AO>;
>> +
>> +                resets = <&reset_viu>,
>> +                         <&reset_venc>,
>> +                         <&reset_vcbus>,
>> +                         <&reset_vencl>,
>> +                         <&reset_vid_lock>;
>> +                reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
>> +                clocks = <&clk_vpu>, <&clk_vapb>;
>> +                clock-names = "vpu", "vapb";
>> +            };
>> +
>> +            phy {
>> +                compatible = "amlogic,axg-mipi-pcie-analog-phy";
>> +                #phy-cells = <0>;
>> +                status = "disabled";
> 
> Examples should not be disabled.

Err, thx I 'll fix this

> 
>> +            };
>> +        };
>> +    };
>>
>> -- 
>> 2.34.1
>>

