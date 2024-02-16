Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2276085791B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2C310EACA;
	Fri, 16 Feb 2024 09:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vlkPL87I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E132A10EACA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 09:43:08 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso230310966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708076582; x=1708681382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=50f7zKmZnRI9LrVHCKInlnIFfogg3BhO8mJWvUu8tZs=;
 b=vlkPL87IABP51Wvebq1ott9SckUYKcoUGCLJwicoKV/jkrxkIEYjDUKlmrynUvgeDV
 Aex7mIlYx3tz6uj6Q06Kh2J2j7k5tk7GK6cdqlQPOO7eHDoqEkEBB1tUyT3lB7lJblO7
 LeCYJfyJ9sUx9dcaU2ZyeCXpObweufTLVqB9FjQJkGReSHchEeydYvusliO9KVEecgOd
 aDEWvq/7hCiM0manJdb36OHs7mYMmW/tCqWc2ngh4/SxPvHrh5CchWvwMOdHPnxPsY1E
 Fk0Y/L2PyRR0yKMuNthzkGGuQJgvfONelxJ/THD0UXqPoh/O+4Kk5kehEM5MO/Hy2GPC
 ZH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708076582; x=1708681382;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=50f7zKmZnRI9LrVHCKInlnIFfogg3BhO8mJWvUu8tZs=;
 b=pTlScNJte5Q4qEa2SmDk5qr42wPPEhj2Nrv+p9cds9namJaGJzzip90ofSVVKlGV7K
 fmUwEk1vYD+CXIvHl5TIlBN9Xac5LwXEEviZDo64xcDxw4r5J1UQZWpuRJFpDjTnCr72
 QXkDNNfrI0Ek5JUoCL2zrK53sd5mEJGCEH548oSBVk/XIiUXxjWC4/L5akuaAAAPdPed
 R1IhoSUT5Y/uT8BGQLVztRdaq9yOFBCE8p8UVOuLKn4GowY/t5o3W65L+DTVASGX4bo0
 W4dQAUhArbl6JLfljWIozWpuhZkdWz0dbU1ZGRTt89NeNFf1Di0JrSD4O7iBIbJyduZS
 egNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXthUDyTLLscIQWKlfpwxoUgttWQntzHpOgt1zZRrZBEQwK9+rQy50LiE7d8V09AvT+wiNDkk0dIxf68qO3wILXAF5I3tMAPTeSe/hg56jw
X-Gm-Message-State: AOJu0Yx6syCyZOpW8CsOXKEOa2cgBvI36LPLY1RC+p24oK/aQnnKFu9y
 Gm+TbDyWuP1OnnJff8P7ei9tZwc5a7FzzZwKqtH9CQCeK3Pek34td2W9K4u+8CI=
X-Google-Smtp-Source: AGHT+IE1PPpt5WXjLMqsV+j10ORMRQbg86LRvVNhA6Wu9P6fc3uH1nDSTRPe/hwaqeL9gfQQqKyPDA==
X-Received: by 2002:a17:906:9a8d:b0:a3d:5db0:120d with SMTP id
 ag13-20020a1709069a8d00b00a3d5db0120dmr3006253ejc.23.1708076582527; 
 Fri, 16 Feb 2024 01:43:02 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
 by smtp.gmail.com with ESMTPSA id
 br21-20020a170906d15500b00a3d64b37a35sm1380977ejb.137.2024.02.16.01.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 01:43:02 -0800 (PST)
Message-ID: <df33fe7c-8732-4e30-8e9e-0c74252c8c76@linaro.org>
Date: Fri, 16 Feb 2024 10:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
Content-Language: en-US
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>,
 Rob Herring <robh@kernel.org>
Cc: chromeos-krk-upstreaming@google.com, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, hverkuil-cisco@xs4all.nl,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mchehab@kernel.org, ribalda@chromium.org, robh+dt@kernel.org,
 mripard@kernel.org, airlied@gmail.com, linux-media@vger.kernel.org,
 akpm@linux-foundation.org, dinguyen@kernel.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-8-panikiel@google.com>
 <170774854498.294434.14234480400138512065.robh@kernel.org>
 <CAM5zL5qx1sw=NSWE7gv3E80MCMJ4=tvc44WDAnBrfsJ2qQB3iw@mail.gmail.com>
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
In-Reply-To: <CAM5zL5qx1sw=NSWE7gv3E80MCMJ4=tvc44WDAnBrfsJ2qQB3iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 12/02/2024 16:51, Paweł Anikiel wrote:
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
> 
> I was missing a '#include
> <dt-bindings/interrupt-controller/arm-gic.h>' in the dt binding
> example. I ran dt_binding_check after adding it and it reports no
> errors. I will include the fix in v2.

Please test the patch before sending...

Best regards,
Krzysztof

