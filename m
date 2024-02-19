Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79585A6BA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 16:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22AC10E3D9;
	Mon, 19 Feb 2024 15:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CRckxIK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4934110E190
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 15:01:30 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-512b25893c9so1212328e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 07:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354888; x=1708959688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fyijmgv5Xc4qQW7NoJwHILZpg0h1x8EzSZbjwL/lNv4=;
 b=CRckxIK+HpDbg6Kl0HpZryKIJtwDvx3W5NuCtshgjmJ7zZA2fz1wg7Q0cPkRgCNdjM
 SKvJpPS3ATqIQZv43p+Wrp9OuzqifsR9+diUBAKE2omkIpOwUSCnw7afagdfhn0NXJnQ
 cCigF4hoGhDLcus6DcKKG6VhofZ0fBrsM1gRj7M17FgL2Bh2d8t9FYbj6hv02Rb2izHB
 uLqNNyG4Y0aosT9Bbi+hP8GAdFunIPsLzd+77VOyaDv1vdZKAtYTmVdYGdkcrYa/1tHT
 T6g13w0fQ2/Cadhwsvx5UZtFvlwypDVIl8vPULL66O94uMj13IQHJJlJOWo6enxZ+5Jf
 vUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354888; x=1708959688;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fyijmgv5Xc4qQW7NoJwHILZpg0h1x8EzSZbjwL/lNv4=;
 b=pkE8B02nbOEVY+i3RYVvnmoCDOulwhGyXdFCXxmr9XaU/xOxwEor575BSFeg2tq+GX
 ORjvFJnf3ugE4YzyELaf9EEJ5UzcqVATm649JpLBd8yZDcvoLXP71ip72WVn49QobQJ3
 1AGrdv//sx6gpDP8wEUJXbQqLs8xNyaFzgc0rKRzkBiqZJIBMd0YFKJ/QQGlkIAuIQDs
 7gDC8Eiu3DgqBrASMLvpNAQ6skRcGNdj8QZdgrtfaDXZGzPbrN6iAsEovoNzAQWAb+11
 4tv7Yg2g7EY5DKYbDmbMEyAX4NZch+XDNWAgT2d13qvvg4I+Y5jtC2JB6XlSZLkU++tG
 uDLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlNF3d60s0oG1ficzV6TZ4cFtYR3SaW8vk5b8poibvBhA19VJl002LUgY+QNf614m7eNBi5JeFfXajNsM/fS+66I2PuUQXvBzme6nAg1cZ
X-Gm-Message-State: AOJu0Yy5OVPeXM3ES4usY2mPV1gxhCujNG7iWb1Tr2+PXmsnCl2VoWkc
 7+hT+33n5RCMkuy/nqrKtq5BNbbviiF0vMKktvALGnbHHaA5fcMoXmeJnr68QWE=
X-Google-Smtp-Source: AGHT+IEDIsdQG1UPM3EDDLCecc5t85EINjACXNa3VncuUkRCHIvhrLnC9PhHvBMOJnz+odgxDTjuCw==
X-Received: by 2002:a05:6512:2385:b0:512:a9af:8c5e with SMTP id
 c5-20020a056512238500b00512a9af8c5emr5129683lfv.8.1708354887871; 
 Mon, 19 Feb 2024 07:01:27 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 ek23-20020a056402371700b0055edfb81384sm2716963edb.60.2024.02.19.07.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 07:01:27 -0800 (PST)
Message-ID: <d212b700-aedb-4653-80e4-36320b33e51e@linaro.org>
Date: Mon, 19 Feb 2024 16:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-3-d260fa854707@linaro.org>
 <u7beg6ui3i6nxoaulc3o7ghfkvcsy46ps53k3jynrurdwn6o7o@ppyqoz4jsotc>
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
In-Reply-To: <u7beg6ui3i6nxoaulc3o7ghfkvcsy46ps53k3jynrurdwn6o7o@ppyqoz4jsotc>
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

On 19.02.2024 15:54, Andrew Halaney wrote:
> On Mon, Feb 19, 2024 at 02:35:48PM +0100, Konrad Dybcio wrote:
>> Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
>> introduced an entry to the alpha offsets array, but diving into QCM2290
>> downstream and some documentation, it turned out that the name Huayra
>> apparently has been used quite liberally across many chips, even with
>> noticeably different hardware.
>>
>> Introduce another set of offsets and a new configure function for the
>> Huayra PLL found on QCM2290. This is required e.g. for the consumers
>> of GPUCC_PLL0 to properly start.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 45 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>>  2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 8a412ef47e16..61b5abd13782 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -244,6 +244,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>>  		[PLL_OFF_OPMODE] = 0x30,
>>  		[PLL_OFF_STATUS] = 0x3c,
>>  	},
>> +	[CLK_ALPHA_PLL_TYPE_HUAYRA_2290] =  {
>> +		[PLL_OFF_L_VAL] = 0x04,
>> +		[PLL_OFF_ALPHA_VAL] = 0x08,
>> +		[PLL_OFF_USER_CTL] = 0x0c,
>> +		[PLL_OFF_CONFIG_CTL] = 0x10,
>> +		[PLL_OFF_CONFIG_CTL_U] = 0x14,
>> +		[PLL_OFF_CONFIG_CTL_U1] = 0x18,
>> +		[PLL_OFF_TEST_CTL] = 0x1c,
>> +		[PLL_OFF_TEST_CTL_U] = 0x20,
>> +		[PLL_OFF_TEST_CTL_U1] = 0x24,
>> +		[PLL_OFF_OPMODE] = 0x28,
>> +		[PLL_OFF_STATUS] = 0x38,
>> +	},
>>  };
>>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>>  
>> @@ -779,6 +792,38 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>>  	return clamp(rate, min_freq, max_freq);
>>  }
>>  
>> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>> +				   const struct alpha_pll_config *config)
>> +{
>> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
>> +	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
>> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
>> +
>> +	/* Set PLL_BYPASSNL */
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
>> +
>> +	/* Wait 5 us between setting BYPASS and deasserting reset */
>> +	mb();
>> +	udelay(5);
>> +
>> +	/* Take PLL out from reset state */
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
>> +
>> +	/* Wait 50us for PLL_LOCK_DET bit to go high */
>> +	mb();
>> +	usleep_range(50, 55);
> 
> I *think* you'd want to use a read to ensure your write goes through
> prior to your sleep... from memory-barriers.txt:
> 
> 	5. A readX() by a CPU thread from the peripheral will complete before
> 	   any subsequent delay() loop can begin execution on the same thread.
> 	   This ensures that two MMIO register writes by the CPU to a peripheral
> 	   will arrive at least 1us apart if the first write is immediately read
> 	   back with readX() and udelay(1) is called prior to the second
> 	   writeX():
> 
> 		writel(42, DEVICE_REGISTER_0); // Arrives at the device...
> 		readl(DEVICE_REGISTER_0);
> 		udelay(1);
> 		writel(42, DEVICE_REGISTER_1); // ...at least 1us before this.
> 
> also https://youtu.be/i6DayghhA8Q?si=7lp0be35q1HRmlnV&t=1677
> for more references on this topic.

I mentioned this feels very iffy in the cover letter, but it's a combination
of two things:

1. i followed what qualcomm downstream code did

2. qualcomm downstream code is not known for being always correct



I suppose a readback would be the correct solution, but then it should be
done for all similar calls in this driver.

Although this code has shipped in literally hundreds of millions of devices
and it didn't explode badly :P (i'm not defending it, though)

Konrad
