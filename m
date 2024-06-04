Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE718FB35A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 15:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E2110E453;
	Tue,  4 Jun 2024 13:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gRRDUH6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5067D10E453
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 13:18:59 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-35dc0472b7eso4814239f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717507137; x=1718111937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vxxPZGK4N7FH675h5UvhDSxQDNXkA2SPyTbrfOjz6R0=;
 b=gRRDUH6SdkrkdDE5FehNnEej9bLfFdbFWNICw9ZoqGeNv+4tuWa1gsF82MOk/FUoqh
 QUy3p8tHyjIcZeFfVHn4GI4Sz9wf/J8Vv9JjentvGBJE/WnikR//jHpQDjkQuMDCSWg7
 BpPJB8wGkEckYn6qHvh957YY1gj0gMSCFKNoPF7Ry+5sPU6FcsIv3w9IZzxv8BMIDmjo
 trVKqwD/FmqBzYJzU9LdrlLoqaIz8ozVjZDUC/ft1TU1JZowDha9HvU6jOGkOyJoXzi4
 U7qvla0bNiosh31s9qjunYFzmlGvo/VWdAwmuzFlFbsoC3Wq0ZRDhFYW4K1u7a8mhFiZ
 nF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717507137; x=1718111937;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vxxPZGK4N7FH675h5UvhDSxQDNXkA2SPyTbrfOjz6R0=;
 b=fSAAkbZeOMrWmlAWMi17KhB6bNh+9kHMOGXIVmQmVSasDhoa+qS+lxQfS4SSI1zc5V
 idqxYwHxOdl/aHzWPYFnxtTMODXqeVnAcEjiumepPiSy5eRc9pxE7ITJpReUD8VwZUDl
 0SQ+OZRx23C9wV2A3jhl/FlJeqZJtVFAtvRUWmA1ek5gckIHqvYNvznw45t66ZqsozUV
 gI13g61jYUhwSIn+1bkk3zoMO8lo6LQZtpKCmp9K//GyBEcRJSx7FAmZ7Kdj1lQmtzTA
 u6pFL3H0T3ZObUY8D8vZpCR/BwW+jtknNnEAwH9fUB2peLKw32l/cHYtg9Csd096eyuw
 aNsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSLsODNQ3Vu4N06i0o/aYRWa/oix0NKt8BqpnfEN4XrMWBRbfJLQ6xRJ9SoOdOiSLDD5CX9st35bT94xiz3qI+t1xf0v4Sjjte/lhLAVB9
X-Gm-Message-State: AOJu0Yw/G7o8y6NquDr2ChJtw+0McnAzfvd03Y7WIj9ftsmU5s83B9/y
 NglDpCy5in3YLINcZ8q5UYu+Drbg9VXPRSY0Rm5PM4JfLgRla7g15Shaf8jBDmo=
X-Google-Smtp-Source: AGHT+IHRUTwkd3NndNZZp5AF0c9Oma54SOAugt68lloFKUPmyKxuzejddDN4Z26Nvf8rYJDB4fTK7w==
X-Received: by 2002:adf:f6c9:0:b0:354:e729:c0f0 with SMTP id
 ffacd0b85a97d-35e0f25e3bdmr8545268f8f.2.1717507137476; 
 Tue, 04 Jun 2024 06:18:57 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e535567e9sm7345101f8f.21.2024.06.04.06.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 06:18:56 -0700 (PDT)
Message-ID: <77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org>
Date: Tue, 4 Jun 2024 15:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/sti: hdmi: drop driver owner assignment
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
 <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
 <20240527144700.GC713992@gnbcxd0016.gnb.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240527144700.GC713992@gnbcxd0016.gnb.st.com>
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

On 27/05/2024 16:47, Alain Volmat wrote:
> Hi Krzysztof,
> 
> thanks for your patch, sorry for the delay.
> 
> On Sat, Mar 30, 2024 at 09:57:21PM +0100, Krzysztof Kozlowski wrote:
>> Core in platform_driver_register() already sets the .owner, so driver
>> does not need to.  Whatever is set here will be anyway overwritten by
>> main driver calling platform_driver_register().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> I forgot two drivers.
>>  drivers/gpu/drm/sti/sti_hdmi.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
>> index 500936d5743c..b0d84440a87b 100644
>> --- a/drivers/gpu/drm/sti/sti_hdmi.c
>> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
>> @@ -1485,7 +1485,6 @@ static void sti_hdmi_remove(struct platform_device *pdev)
>>  struct platform_driver sti_hdmi_driver = {
>>  	.driver = {
>>  		.name = "sti-hdmi",
>> -		.owner = THIS_MODULE,
>>  		.of_match_table = hdmi_of_match,
>>  	},
>>  	.probe = sti_hdmi_probe,
>> -- 
>> 2.34.1
>>
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>

What does this ack mean? You are the maintainer, so what is supposed to
happen now? If maintainer does not take patches, then the DRM STI looks
orphaned.

Best regards,
Krzysztof

