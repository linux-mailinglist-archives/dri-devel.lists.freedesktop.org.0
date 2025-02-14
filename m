Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74801A35BE1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB78410EC51;
	Fri, 14 Feb 2025 10:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tA/NJTgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9474110EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:52:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f240ec571so96202f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739530337; x=1740135137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=D1E3shrmqji3p4SiOZzcDMZ6w2eLRKPdrleu9Kc2MMQ=;
 b=tA/NJTgx9Ayohr2fpLr93bbZ27ffIgWkvJMyYn4ZVTrXAXE7UjgWB+GfHwnbOzJiNc
 3nNo1Pjm8LXPfmlUzATvWksCTmNz44g9tkeuYc/CQm9l4Fcygd3nkuzuHlxpTKuOZpPa
 emTCU0mkfE2+aCmMmGgtPiPuXntHzzhO3Rdleri+Pewm8i9X0at0zDBeZM0EGC/sdjUK
 Q9UxbNhW5k3R+n/FvLXNV3by+5RidOtoevXwOgzRufqL1AFgAzGGmfxCm+R21+IHhEmV
 rymkQGYIukdRmUCWxCm16VuKU0+4BNzS1wz2dCX81OQRy+kBuzUfdp5JZhZ1SUNdDTNF
 gFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739530337; x=1740135137;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1E3shrmqji3p4SiOZzcDMZ6w2eLRKPdrleu9Kc2MMQ=;
 b=EL6KEh+rPwbi1ANQt2gQKG9zz2e+8YDBLHhyp7+79h3M4sdFbU3x7lzjJl5cXe184U
 Yjs/8Vj7hKFQhM69tMNM6HbYB6Kal0HvenSeplODUL/Gdkes4m2cYX0EjpfpWWfhFso1
 xgd1EacGDaVooV7+QARaF59Ve0dx+633ev2QkietWudn4dqSRS6KDp4p5QmGTYqLOUQ1
 15Lq8tYjaqG8QbwYMLAmW6Qk1EmG65uqmyhz8QL0lrSgbGjsuADUqXRL4N1GtcS/lbTq
 7pvJw5rBXBhavawfYQ0FGeCmUYmM4Q/3gF4xMT+bXa8rRbgVB+CFtHydpXHOnK5RU8Sc
 fN5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU24H28ouPvDrYLFWAjRgjHi9MFXECbhWYl1ANpoMAJFnOtQETt/5rc78glhmYjybXXYbcrnDm/BYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywppwoa/8hYy5PbUROlDxJRSH8M5IjA1GEHGW5w3tBqXNXz2Bqt
 wQlUQhKcEdft/ljf+WgpLfVfS/6GH+WrQ+Ukqni7sBe0RAemsIrdnj4RR+HqZXQ=
X-Gm-Gg: ASbGncuT48rkZguDb6nyEqX6ht5I5oaKCdTb0mJtlCUiTAfLLFCXwxeJIw1STwVEGWy
 6F70SeeJmOS+TSa2aIF6RdNDbDtaB0gToY6fTtK/f13jBY7ON15adpw/9NifnIz92DYe3ufd7Fn
 zOn5UvMtX6uyS9u9Eae+u1/kC2Ep9MZM7hKfygh4zDFqcU0oUWap5HBOGXcQFh6NDnT/y0C1nIJ
 3WX6Ve6EnJxX24eHxJFDQhHSF5Y0n6X2SIkCsxoD5MRq183ky/YwFQhVvNTBjjT0CfZDQ8FIA+r
 bXW4/fP0MkM8e9kxFW0QSYY0O/agyNxj8XI=
X-Google-Smtp-Source: AGHT+IElbdA1TctbgcOQxOJNbBvE2aiJ5mWn0ZJu/ogZAqW3AeynhVle2H+4Tay7CqBnSPs/pB2euA==
X-Received: by 2002:a05:6000:4012:b0:38d:e33d:d0e2 with SMTP id
 ffacd0b85a97d-38f2c7657d0mr1047399f8f.5.1739530337167; 
 Fri, 14 Feb 2025 02:52:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fa38sm4359920f8f.98.2025.02.14.02.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 02:52:16 -0800 (PST)
Message-ID: <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
Date: Fri, 14 Feb 2025 11:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
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
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
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

On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> Few minor improvements/cleanups why browsing the code.
> 
> Best regards,
> Krzysztof
> 

5 weeks on the list. Any more comments from DRM side? Can it be merged?

Best regards,
Krzysztof
