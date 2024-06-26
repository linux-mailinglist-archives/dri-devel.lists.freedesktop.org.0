Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A211C9199D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41ED10E268;
	Wed, 26 Jun 2024 21:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qn+eEkJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E62210E1CC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:39:22 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso1008805a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719437961; x=1720042761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7L7e5C1/vFl5s/Wn77Ses23ies+BIoOorCDyigrw8VM=;
 b=Qn+eEkJLhaeHwjXW4ytQve1nKodTMSHXJ0ImlmFTwg5Rh4Qu31wAWtzv3cZrJIhnJe
 YW8eGbiboUDl1gWjagPFt0K2+x8/wt1c7ZQdRBb9zu3RD/NCgqm7w5KPVYidcNwUxA5t
 mJVUSr/EK0UETkJBVPPZm5jrzbLLw1we119ioNLQ8X+Jo0zplH9v0XSyNSBo+T0ouBKc
 xtbys0gJIiTZSMe27UmqMJ5jAOB+08QnAXCe5vLneRD9Ix4VYiNbXgF0NKVd2DUmdAzF
 y+QbdpUoKbCaCRGZMs+wBfCaxig2BrRuRFxwVzGZ3nNDhj9d3SIrCRtEKaVSut7EcV4o
 6xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719437961; x=1720042761;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7L7e5C1/vFl5s/Wn77Ses23ies+BIoOorCDyigrw8VM=;
 b=vC9XoMHWrvIwC725j+rjBAExkvbSWzVcSgqGHFZdgfBGw2/kdsrsEc5ZRvVW/84hVL
 q18aUip8tkG71aWaXI2xOf+E9P//6dpv7cSl6WhyvgvYX+ieErV2DcSNHJv/2TXhW5eh
 hDjeaiDHi5niKNjtXm3v8NCMwfakh+jZ1xrXo3r6HV7hkm7aRM0fCfTbVQaFJJzAvqTQ
 mldQOofw9+l3Ubjithk6UR3SPCAnxxV5JF4eMFNbUCBXeSFH1xs0Zfb79D16ckvHK5c2
 hpSYc503migXl2CK/iXG9qF6EhgAn1AhFyRLro4U21g76Pc2BDFFWml5AX7X0QnS8+GQ
 P9sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVENbUsUt0sURCdc/8lJtkf/x7uMO9CrP7dDOERuPLReHQS1jZhIzEdwwlQyIy8Pl+qC500i5HmBdA7mob3LABoNuXIYbazoym4j2BHO2tu
X-Gm-Message-State: AOJu0YzRsFnmvzVmny9JEI7i+cBXmHTW1YhVo8iXVpqZRysGgLGcw3xv
 ER8qt9+fgPChL61v/k/sZi50HirEZAlSxpce6SAHI2CE/oX9rSUmbHT4ymOukAI=
X-Google-Smtp-Source: AGHT+IGvq7E13DV9iNnVcdPiYH+SNAfpHIkr3zyoKHgWKaXG17u39y1+WTSsnYZulR9cqSdqq4pACg==
X-Received: by 2002:a50:cc85:0:b0:57c:70b0:d541 with SMTP id
 4fb4d7f45d1cf-57d4a28e5bcmr9805574a12.20.1719437960467; 
 Wed, 26 Jun 2024 14:39:20 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-584d0c9dbe6sm15489a12.16.2024.06.26.14.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 14:39:19 -0700 (PDT)
Message-ID: <20b5533a-25e9-447d-8138-7328088f8efe@linaro.org>
Date: Wed, 26 Jun 2024 23:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <f5ef4e3c-66e8-4833-86bb-c38658b923ae@linaro.org>
 <20240626210420.uapn2dauiskluidq@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20240626210420.uapn2dauiskluidq@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.06.2024 11:04 PM, Akhil P Oommen wrote:
> On Mon, Jun 24, 2024 at 03:57:35PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 6/23/24 13:06, Akhil P Oommen wrote:
>>> Add the necessary dt nodes for gpu support in X1E80100.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +				opp-1100000000 {
>>> +					opp-hz = /bits/ 64 <1100000000>;
>>> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>>> +					opp-peak-kBps = <16500000>;
>>
>> No speedbins?
> 
> Coming soon! I am waiting for some confirmations on some SKU related
> data. This is the lowest Fmax among all SKUs which we can safely enable
> for now.

Sounds good, thanks

Konrad
