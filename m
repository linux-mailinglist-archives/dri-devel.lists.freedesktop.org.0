Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A751D8A2F7C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 15:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE76410E3FE;
	Fri, 12 Apr 2024 13:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nI7R/RYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717B110E3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 13:33:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-417f80e94a1so5746465e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712928817; x=1713533617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nH1sWLIGA864erlhW3b/updKEM+chUr8JvtD9qfNRS0=;
 b=nI7R/RYW5k0Tgi+Dw9fL9A/BcLvCMsFMWsPnwLTnoyQUmlbWHPtXkAHKDhxp88f3Vg
 3fx0AL9A+C058bkCAXXsAMrcOWc1A0iBVGebVOiob6MsBcFlRrYV03Y/O93uMOQykHVU
 l4KcEJXkhs0T8pYaTw0V4pOxPEF/BtxsyZ7qosJZSIutQNhqJp4omwIkjEUCjbl5qhlQ
 hStIQ2G8NkNV3KZF8D9QUvc2FfviyRtYHdPdOtmd+PvaeZ15sdTQS3d33as1E97Y3+cp
 Su79ksKVzziWrwoVFHofauG4wpgiFR4bZBJb+VlXYDSbe/ZlMGU4rtFsbHdgx9VIeEHQ
 +v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928817; x=1713533617;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nH1sWLIGA864erlhW3b/updKEM+chUr8JvtD9qfNRS0=;
 b=lhMP+x0TS3AsjmGjpzb0rGfQLPEdeQflUjDVUNKUNp45rLKgZ8QQXEpjx6mo4AYZjc
 bCZ1zTEovDQ5XCtk1Hb5kSoHCvm5rj+fUif/Oz2Ne0hYQ0Ahn9rqWf6AVEEJQm4AJ+E1
 Vul77aSAtX+K7Eyx0p0mJ8cmxVE98seKWlR7qZkxIusFrNdgmxXRU4Faw3yJ6jQ47Kj1
 YaQuzfv/mAVl9XcECFflIRBIt7bOSsUA14HFYI6txdBvN00T+n6Zu4A+Kg51+3yQ78f9
 61aVU1LNFIBaKVgdQH3yDjrj4Yd/9kX/LJPoWcS5DnegiyaamP8cTOsQ+6+1L20vV9tn
 ddHg==
X-Gm-Message-State: AOJu0YzOwPvDLyetmcfelpyVkESjW3FunGCRv7y+5wdJvG0yczgBVUWi
 Mv4hcLWNlngMZ3VaGK2/+mqrmkBlEbUBu2uSW8l/XwyF7gbTqblX/fEhPVaWeBs=
X-Google-Smtp-Source: AGHT+IFJ3Xd7NEoepXjbYMnDD6LxfHdlgRUnLee1O7ULfObyPtkPUf0nBwS35MfqAksh1kh3VAR5DQ==
X-Received: by 2002:a05:600c:1910:b0:417:d4f5:6501 with SMTP id
 j16-20020a05600c191000b00417d4f56501mr2211794wmq.27.1712928817361; 
 Fri, 12 Apr 2024 06:33:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b004180df6e774sm838322wmq.29.2024.04.12.06.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 06:33:36 -0700 (PDT)
Message-ID: <9647e461-a299-41fe-a078-5bbfffcc985c@linaro.org>
Date: Fri, 12 Apr 2024 15:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: bcm2835: Enable 3D rendering through V3D
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Romain Perier <romain.perier@gmail.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20240412132559.2365947-1-mcanal@igalia.com>
Content-Language: en-US
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
In-Reply-To: <20240412132559.2365947-1-mcanal@igalia.com>
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

On 12/04/2024 15:25, Maíra Canal wrote:
> RPi 0-3 is packed with a GPU that provides 3D rendering capabilities to
> the RPi. Currently, the downstream kernel uses an overlay to enable the
> GPU and use GPU hardware acceleration. When deploying a mainline kernel
> to the RPi 0-3, we end up without any GPU hardware acceleration
> (essentially, we can't use the OpenGL driver).
> 
> Therefore, enable the V3D core for the RPi 0-3 in the mainline kernel.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
> 
> I decided to add the status property to the `bcm2835-common.dtsi`, but
> there are two other options:
> 
> 1. To add the status property to the `bcm2835-rpi-common.dtsi` file
> 2. To add the status property to each individual RPi model, e.g.
> `bcm2837-rpi-3-b.dts`.
> 
> Let me know which option is more suitable, and if `bcm2835-common.dtsi`
> is not the best option, I can send a v2.
> 
> Best Regards,
> - Maíra
> 
>  arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> index 9261b67dbee1..851a6bce1939 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> @@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
>  			compatible = "brcm,bcm2835-v3d";
>  			reg = <0x7ec00000 0x1000>;
>  			interrupts = <1 10>;
> +			status = "okay";

Please point me where this is being disabled? Could not find.

Anyway, enabling should be done in last place of override/extend, which
provides additional properties. I believe it is being extend further, so
that's not the place.

Best regards,
Krzysztof

