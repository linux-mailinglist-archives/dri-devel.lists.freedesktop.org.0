Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857957F5E74
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 12:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A47610E052;
	Thu, 23 Nov 2023 11:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A247E10E052
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 11:57:17 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c8790474d5so9875451fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 03:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700740636; x=1701345436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PQEsbXeAYimqkmWhXRudvZkzCfXqDH0+MOnC7UUP82I=;
 b=Kqme+lPzkwzlo/VEVcpXCgL11nDqx8tYi+z3/bDhxFZMK6FR5LcBkUIEkONB6PdI20
 Mt1h2rW+WfqIchkI+bKnrSgqg4c//vp1ooMADyZCpyOQnVW20+97i4aWZ3eoFxauWF8l
 PCbP+EUt6XvgDDAGuxq2kFpgXQGntSHlPZ5QafzXuPQ0a68jZgRqMyzIXngpl4CUXCJl
 k2EbaM5dz+m0AgNFVr3LMFg2MmW7fl0x8xm5e9TSJyAaqSD3pYzGPKSS4Y9PJUhrWokR
 xtW/RDhWx3Sb77DvuL3TNf0r54X9XpeRPlXqjyK6zI0zkZE9yoiLCjlHULKKsY0u8Z5F
 f1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700740636; x=1701345436;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQEsbXeAYimqkmWhXRudvZkzCfXqDH0+MOnC7UUP82I=;
 b=TSxV4ATM37J7bMM0Mqns2P0eCATjyODuN7ukPYquU/BsyB+kR1O4UhgGlIBUYoghse
 dGD03SGKzVJgjt+Jxylbp0YszIXD7rDFGSk1P/LbBatlRNU4Tv2hfwJMqDOW5TDBzeDi
 Rb2/hppzBMn/JE7Se5O/fs5X0+ORfy99ggx8wX8pGzYvuHYd8SNSqgDQFptIDHMvEYAq
 fzV500EIkg2v5Pd1CWyQme7Bv0fyyF7riwZCpZKtW8kWK+ZW7NZVd1xUYfoUSyWXdooH
 VJ90p8IevX75dQmP+N/oBFdmvi6Cs5U5UCjZOm5jNFZOV4ly/0DOhc8y8AIhvVMb5bKR
 ILiw==
X-Gm-Message-State: AOJu0YyBDHmD5iTYmek43L8oS7NciJbjKfvSQnC/iVMBqVrvr9NQrnxn
 ArC1wUNYdvQuuGfyRL4UXNffWQ==
X-Google-Smtp-Source: AGHT+IFViVby8v5iHLBcwqM38tnUJAWtGryoSaANfBVrqD/K2QUAUQ5EndZ6R2B4voMAGWSVRPpO1Q==
X-Received: by 2002:a2e:8853:0:b0:2c8:721a:ec37 with SMTP id
 z19-20020a2e8853000000b002c8721aec37mr3610588ljj.46.1700740635816; 
 Thu, 23 Nov 2023 03:57:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
 by smtp.gmail.com with ESMTPSA id
 fc18-20020a05600c525200b0040472ad9a3dsm1766039wmb.14.2023.11.23.03.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:57:15 -0800 (PST)
Message-ID: <2bd59614-49d8-4829-861e-3b95c44008df@linaro.org>
Date: Thu, 23 Nov 2023 12:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 steven.price@arm.com
References: <20231123115029.68422-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231123115029.68422-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org,
 boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2023 12:50, AngeloGioacchino Del Regno wrote:
> Some SoCs may be equipped with a GPU containing two core groups
> and this is exactly the case of Samsung's Exynos 5422 featuring
> an ARM Mali-T628 MP6 GPU: the support for this GPU in Panfrost
> is partial, as this driver currently supports using only one
> core group and that's reflected on all parts of it, including
> the power on (and power off, previously to this patch) function.
> 
> The issue with this is that even though executing the soft reset
> operation should power off all cores unconditionally, on at least
> one platform we're seeing a crash that seems to be happening due
> to an interrupt firing which may be because we are calling power
> transition only on the first core group, leaving the second one
> unchanged, or because ISR execution was pending before entering
> the panfrost_gpu_power_off() function and executed after powering
> off the GPU cores, or all of the above.
> 
> Finally, solve this by introducing a new panfrost_gpu_suspend_irq()
> helper function and changing the panfrost_device_suspend() flow to
>  1. Mask and clear all interrupts: we don't need nor want any, as
>     for power_off() we are polling PWRTRANS, but we anyway don't
>     want GPU IRQs to fire while it is suspended/powered off;
>  2. Call synchronize_irq() after that to make sure that any pending
>     ISR is executed before powering off the GPU Shaders/Tilers/L2
>     hence avoiding unpowered registers R/W; and
>  3. Ignore the core_mask and ask the GPU to poweroff both core groups
> 
> Of course it was also necessary to add a `irq` variable to `struct
> panfrost_device` as we need to get that in panfrost_gpu_power_off()
> for calling synchronize_irq() on it.
> 
> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
> [Regression detected on Odroid HC1, Exynos5422, Mali-T628 MP6]
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Changes in v2:
>  - Fixed the commit hash of "Really power off [...]"
>  - Actually based on a clean next-20231121
>  - Renamed "irq" to "gpu_irq" as per Boris' suggestion
>  - Moved the IRQ mask/clear/sync to a helper function and added
>    a call to that in panfrost_device.c instead of doing that in
>    panfrost_gpu_power_off().
> 
> NOTE: I didn't split 1+2 from 3 as suggested by Boris, and I'm sending
> this one without waiting for feedback on my reasons for that which I
> explained as a reply to v1 because the former couldn't be applied to
> linux-next, and I want to unblock Krzysztof ASAP to get this tested.
> 

This does not compile.

Best regards,
Krzysztof

