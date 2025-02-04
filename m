Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787DBA26E13
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 10:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAEA10E2C7;
	Tue,  4 Feb 2025 09:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bdxplgx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FF210E2C7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 09:20:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3862e570832so326329f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738660854; x=1739265654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pjOn8HlqiUp9imgeIwX/Vs1stgG6CCtQrFtgz5ne2w0=;
 b=bdxplgx3tq2hOSKAAfUMphuCJVtfabNR4NOMnHq/Dx9suey+Ri3EAZWf+TScZtCpJg
 ThhwI9ZFDuOblhL2x+uo5RajuBJI5Laff2ZVnZ+MTsmVIbviGENqvZKowkVsYZopLS6X
 CK512RE7XFrkpeImZHFx0A133LSgi1kpQLb7xU05uOc6uDn0t05HK2ylD74SYx11ZnYf
 5sIvCNNWyeVf+6Y8cfVCBEDMPC62nV74mP3rUm4e9xpXJW7DQyZdkB33RxMGd4hMDEcg
 2GpQZrMa/3KJdaFxzaRsmExAAtZFHLm1Zra70cPd1Nvf/9vHRu033RrkR9UPyIKcjCsp
 aghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738660854; x=1739265654;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pjOn8HlqiUp9imgeIwX/Vs1stgG6CCtQrFtgz5ne2w0=;
 b=nnh9G/IWLiY4iPjSYmFe12VHIdqzsfXYLvxmkaG4jMyJijgF36Xhgl2VYr+mHi9qMc
 VKYiV7c3tLgAFDN0INqQuigmRSBloibBR1vfvCG9RhmSGGCsFkksq0xeBVqukxflDCaW
 gpQHqi+EUCafSUcBId4g0h8fQlm0H6vYM+2embjaoMJgVmHTOyhURHnWXhGNrGlwyL9p
 z3KKK4bo+oDpTzDLCMsbZ022Hj4tLjtrK1C7fzg5QaOFJPaounDE736deuy6nPthkME8
 BIItcfOkYNVFLo0PIC5swL7GEWuoaAOl+pD337MicQKbA4hI5okyIrzAD3bpqeHNa1FG
 FEbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP2IjO43lurn1mItbxKEOCpsdEUv7nAz2LsPJMkSworMrnDkca5ZUCT5W3p19TSo8ivW4cT6MStzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXtgtFutItqMpUFBAfOZG0pr0gW8lcE4lvgKWqTgDiHZosL649
 MfGH8f8noaMfXydeDlfIjP/j0OZSFIOXuUsBfB6i+fPmvbMavEqvCEUcViXpccE=
X-Gm-Gg: ASbGncvNQMVE2T5Z0dcsFyXZMG1V9zC9yAR3u8Hf7JJ+ukxQAIP9ZeORRCBCcze1eRh
 RD96GvunsAf9XL2Y998AbJUps3W4uWorsk40X54a5qZo1Gl0hVYftsreBZpGOZ/e9Wro3vgsHnr
 od7H1XOxM23Ii1Cj7uD03bb2hakivckcmCTKU06y4orVTvZzxPI1HNryrwPUYESeIanhZjCI21J
 TDrS8UxwXoMVfhFZkdMW7i3BUqyrXW6min479Fr5oBso7IaiFe3hd85KuxFmKtQQMNRW/WG4cg/
 d6oFFyBKhqSswuJ5KTMRbbdazCcyk+prpoY=
X-Google-Smtp-Source: AGHT+IFloUpSZQql46Cok/SCgcqCNh/GvapYs4i6t5zqyN7Opagv1IM4g04vLOIGgxfILq4uWlvkXw==
X-Received: by 2002:a05:600c:3ba6:b0:434:a339:ec67 with SMTP id
 5b1f17b1804b1-43905ac256fmr8627075e9.3.1738660853880; 
 Tue, 04 Feb 2025 01:20:53 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42c7sm187223825e9.3.2025.02.04.01.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 01:20:53 -0800 (PST)
Message-ID: <cc63872f-3ad5-479e-bfff-8d62478e446e@linaro.org>
Date: Tue, 4 Feb 2025 10:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
 <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
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

On 03/02/2025 18:42, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
>> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
>> divider clocks from Common Clock Framework:
>> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
>> clocks side is protected with spinlock, however driver's side in
>> restoring state is not.  Restoring state is called from
>> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
>> conflicting updates with clock framework.
>>
>> Add missing lock usage on the PHY driver side, encapsulated in its own
>> function so the code will be still readable.
>>
>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>>  	ndelay(250);
>>  }
>>  
>> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
>> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>> +}
>> +
>>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>  {
>>  	u32 data;
>> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>>  	val |= cached->pll_out_div;
>>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>>  
>> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
>> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> 
> Ideally this would be FIELD_PREP or a special function generated for you
> in the header.

There is no header. That's patch #1 and I do not see how changing this
to FIELDPREP is anyhow related to the actual problem being solved here.

Best regards,
Krzysztof
