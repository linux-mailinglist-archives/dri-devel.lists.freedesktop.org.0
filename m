Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED41A33C0F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 11:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2105110EA3A;
	Thu, 13 Feb 2025 10:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zt4jUXDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1C910EA3A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 10:07:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38dc33a4426so115815f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 02:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739441255; x=1740046055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3HpnRFaO6LyDrB0tNs4qU/vnoM0HaZ5yBSFhhlK6Y8o=;
 b=Zt4jUXDjRmN8U7EeRxjmXkfqUOPbkc7FqeJBpjfAMhix2kI9UPCl+BGhFc9JPc8BYd
 Oidyn8CUNhKhgOzdKp0/8KpywMJ7VgNEalTb74BJBKF9pnREHjw9Q2aCiMXpBR9Q2YuO
 pkidcA6aHOJsuF3PYfbGXhFiUEQGvrx3J7HXAK+Urkllwm0Ck0mUgpz/5AWWwjtZqGm+
 VhTKnWPr8QWYP2S0yVTeg63vK/bkTRlVLx8ZUUhjlnDARfWWXxrSANmM6U+xg3GgtoSZ
 GTkXBJm+m/fBNKQPMlqd93cvO8g/l1cAM1oBdqnWvIPf8fN/gD4+Rs7LdeMhqpXSd2CP
 /WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739441255; x=1740046055;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3HpnRFaO6LyDrB0tNs4qU/vnoM0HaZ5yBSFhhlK6Y8o=;
 b=SlSGvrQ2pm+h13sRX3mn7rbFdxJJZOAqz7w7JLYyp+zeHRKb2ksnfr+Dig+HXbrNea
 tfiE7FlOXBfFDaChLTXSPwEZstLtJfOJG80+zAzRv2E4Ez9EVpKDd99tGzttWubGujQd
 JoSVEJCEwHnTLzJT5sctJxFdGecueFfmQhXSM56ip2mihhpM1axWGiHWRkRm7fortKyj
 KYMzXxmqpbpjjKJQkkhmsXORZJeUPopAjbfd7/pLsbrT7bS6YwFat1+OFCjoWJhhhZ6v
 MCNUA3gRtXwE2JI9oH0cnQITIoUozskaBqcvTg+BClLbq23O3e8nSKS0Nbjs4UQjf28D
 06rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpxUWOdH7HBOpbl+AugavYnXpLqCHrBYHfMeEhrQ3jB5oIw+R5JMmcWybCRFD9wZu5E/ovCMWtTPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzftUomV2RI46FPkOOEbBdcCPU6GLkSoN1bRlgUEaxn14owGtnW
 Oqf+lMKI7vw+xPNWU67qXZP++KC4mHaX3gQ98K/sdW8KrhU2+e+he60JJ5os4AY=
X-Gm-Gg: ASbGncvUA84n8yvyyzm06cJhAlSb8tfz1hpOT8kXKMIQl/a1D62j/lhDquPhXAwp26g
 plEZIsEXwG39nFkJnm/FaQXaIeA/EYb6DcUKpBFEYNpURUGRy+cj54kX2pJkoXkD1fEfwtQocwJ
 sdsS6GExadcH59bb1OaSFee+UQY4R8SjJcnJXfanjS4TtlmRwsCpWOX32I9ddyqDSKPW6qb3J9v
 KnGKnlmh6muXCsix/sSPUxBL8qmwQBE2camsecZcrezO9BjD7eQLUTyVGS8IiGv4ygdrIRIk3A4
 QaJY67U7+2hUcYUyiGQp2f+qeCNeIJzrN90=
X-Google-Smtp-Source: AGHT+IEGBSMos4dnXH8Z9e/r2DkaLMZeByaK6cdnxiNACJ6A5ennEr+gFHmT8jQk5lXlL0LNQfy0WA==
X-Received: by 2002:a5d:648a:0:b0:38f:2113:fb66 with SMTP id
 ffacd0b85a97d-38f21144679mr2168260f8f.9.1739441254758; 
 Thu, 13 Feb 2025 02:07:34 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d65dfsm1423241f8f.64.2025.02.13.02.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 02:07:34 -0800 (PST)
Message-ID: <a65b01d8-3716-40bb-9171-ad6ed3121a89@linaro.org>
Date: Thu, 13 Feb 2025 11:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
 <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
 <59f8a02e-a716-40a8-bf73-111ad2a7af79@linaro.org>
 <8e8e3eca-dee0-43ab-95d9-aebd636245c7@collabora.com>
 <7341db6b-aed0-4da0-a5b2-6992d86ffaf3@linaro.org>
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
In-Reply-To: <7341db6b-aed0-4da0-a5b2-6992d86ffaf3@linaro.org>
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

On 12/02/2025 21:33, Krzysztof Kozlowski wrote:
> On 13/01/2025 14:48, AngeloGioacchino Del Regno wrote:
>> Il 13/01/25 14:07, Krzysztof Kozlowski ha scritto:
>>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>>> Use dev_err_probe() to make error code and deferred probe handling
>>>>> simpler.
>>>>>
>>>>
>>>> That's already done in [1] so you can drop this commit.
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>>>>
>>> Eh, this was first in v3 in the middle of Dec, so why you cannot get it
>>> merged first? Creating such 34-behemoths causes simple cleanups to
>>> unnecessarily wait.
>>>
>>
>> Getting the series partially merged is okay for me, no complaints about that,
>> but then ... in v4, there are two minor comments to address (one of which
>> is a one-char nitpick!) that might as well be done while applying, depending
>> on what CK thinks about that, so there's no real benefit in getting 28 commits
>> out of 34 picked instead of, well, just everything...
>>
> 
> OK, month passed, I waited, so is your big patchset merged? If it is,
> then this will effectively rebase my patch, as you requested.

I think I missed that you took the patch to your patchset, so sorry for
the noise.

Best regards,
Krzysztof
