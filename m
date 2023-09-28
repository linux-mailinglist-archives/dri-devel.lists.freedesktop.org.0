Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B3A7B23C8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 19:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492C810E04D;
	Thu, 28 Sep 2023 17:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ABA10E04D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 17:24:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so16094514a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695921871; x=1696526671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sf5OH6kBmJyPwDhUW7u4YAzeX5WNRzEQ/aLpmeyGPhg=;
 b=LGC2GQz27bPQrqxMeotJP/7E/H66VAINIGiwFhr6idnmmyDlESwJlQer9pK2pe36f4
 5eQsgTtyM+I7OxpckirfGJrGv1vWZZBu4OqQBmv4x89g5nF8ZnR3/MwTGDzddHeGbG/z
 9poaMZmBNINe6mYL87K4dNpAY3ZkLvSs1TjkiHqymmWVDhLTHa7V1//RiSu76lp/GZlY
 veAIe+6mVGBOcBrYucaJDwI9MKHm/zCqsx5CCXeQD4LqtFsrow3QNPB9Fpz2LK6JGKFy
 1zcQfhqfQWJDPLEbdMgM8HulNhXf2ef6N48B4M3E66jDTfXswyj3YJMekOmqTsPrpb1+
 T0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695921871; x=1696526671;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sf5OH6kBmJyPwDhUW7u4YAzeX5WNRzEQ/aLpmeyGPhg=;
 b=PLfv0fHfCuaLlsf/D8rSWxrJZ84C342I4yWoSSR7v7BDRuVaDuEQEdwpqIO9wDEny6
 CSnPVzPmbEC44F10pvdbqCAVrENV61+fyGtFKhaN1AyFuXR9n2QdwdLtkViyuMhSPMmB
 xV3IMJC9x4YfeKd/cWqK+ep0HdEFwpWOSo/dTP7SBdtBWEQZ3tCAp6rXSa9B2Ecjq3QJ
 V7LCJ/zMTpaZR79+U34nWhn7CJw6uMdxQ/Y4O5RstU7pA1l9fskcY0hEBI9ZygsXuePe
 dtKMdGlA4NS0jFK72Yp4OFPsb1EDsulmvwFSjFWDKv3e92NTziNO2IIKgVz1voGnHYoB
 pdcw==
X-Gm-Message-State: AOJu0YyLA6qpnsgrxCkabuUx+e2XV87JNKJz/wfXKyz69+R9f8nrjZHI
 w7nw4TP/MloxDBNdLGTn02pKxQ==
X-Google-Smtp-Source: AGHT+IGWKtMktEDNyzj+OCWOdCcZomnjz/lXLLhTbRKdOalIdw1wC+nGR2ivss8BaYTvYNlS+UR9cA==
X-Received: by 2002:a17:906:8a7a:b0:9ae:3d75:4c83 with SMTP id
 hy26-20020a1709068a7a00b009ae3d754c83mr1884348ejc.0.1695921871577; 
 Thu, 28 Sep 2023 10:24:31 -0700 (PDT)
Received: from [192.168.33.189]
 (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
 by smtp.gmail.com with ESMTPSA id
 bu24-20020a170906a15800b0098669cc16b2sm11048763ejb.83.2023.09.28.10.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 10:24:31 -0700 (PDT)
Message-ID: <a5f9e39d-7815-49ef-9279-c7c98a01aff3@linaro.org>
Date: Thu, 28 Sep 2023 19:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Raydium RM692E5
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20230927-topic-fp5_disp-v1-0-a6aabd68199f@linaro.org>
 <20230927-topic-fp5_disp-v1-1-a6aabd68199f@linaro.org>
 <20230928-tightrope-other-c460f227577c@spud>
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
In-Reply-To: <20230928-tightrope-other-c460f227577c@spud>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.09.2023 19:09, Conor Dooley wrote:
> On Wed, Sep 27, 2023 at 03:19:01PM +0200, Konrad Dybcio wrote:
>> Raydium RM692E5 is a display driver IC used to drive AMOLED DSI panels.
>> Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/panel/raydium,rm692e5.yaml    | 73 ++++++++++++++++++++++
>>  1 file changed, 73 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
>> new file mode 100644
>> index 000000000000..423a85616c1c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/raydium,rm692e5.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Raydium RM692E5 based DSI display Panels
> 
> The capitalisation here drives me crazy, but I can live with it...
Oh that's what I get for copypasting a different yaml as template :D
willfix

> 
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konradybcio@kernel.org>
> 
> In case it's a typo, you sharing the d between first and surnames in
> your email addr?
Intentional design decision!

> 
>> +
>> +description: |
> 
> This | should not be needed.
Ack

> 
> Otherwise, this seems fine to me.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Thanks!

Konrad
