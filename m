Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D9A1099A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFDA10E36B;
	Tue, 14 Jan 2025 14:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X7qk9ZD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD44410E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:43:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3862c78536bso303081f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 06:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736865830; x=1737470630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zmVgAqwpleZB6pp1+6CDvtK8CAUdTfhLfFqUVd0G6lM=;
 b=X7qk9ZD23tMM3f9Ua79nsRYNMjW4se4tiaCvn1xGSffF3gox8TM19uEq6i23psY90N
 Tb5Wmdug2ePvJCFzPnWuYALpBdyJ2n8FMILTzMHMLa/Hm//xCfLHhXEAUQsbvihbQcTJ
 vGlAObc1zjqvRvBy04FCNlkz9159sqnm4W8a9stuMyx2P2C8YsgUyEIEpU4rnBrUX+Hs
 W8vTYw+6ITu7TM4sFPbBbxLqi9DEEYHcWqdL/WWqBEnWrNSFX85jURwYMzF2OBTMSv3m
 oYAv4Wyc5kPitas/B7sdcNn7bGOuDuCm/rM3YrpioNEfGWeZT2w6ssPbTu75Lm6N9Uhe
 FqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736865830; x=1737470630;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmVgAqwpleZB6pp1+6CDvtK8CAUdTfhLfFqUVd0G6lM=;
 b=vTO8KujiLsVeqUkiYKVtx5EtycdygeGkQT5YQDREWALNdBi/dILs+p7ys2m8FCpmRf
 7w5kX+W082DSUSjvRejBkA3zqyVRnj1JTxJity864nF+kJAM/LizAw6ACUVkB9fzTxaz
 wJYxESfqlxxEdKcwNRoIOSFGBqxp09TeMCoBQdKzmqMSopB2XmrZubDeXRz6W2u4CeJl
 98/ayJkAatPq20z47umm3BXtShJXIHuHsUQ3AU9nPUIDIPox5r2G5wGk1qJmYaOVzk2p
 OsqAKg2EZmFdy577x6lg7Da6kqKKJ50RcvZMcegheBo0HLlqJ9hFlzGr076dHnAGIsAC
 irCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX2OvwCiUHc8G3m6nmRPKFHSHmDz56J/cVJ8BXB7v8KtqVyg8kgmF2pt8//juy7YAszxqV23Xce44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyayU7F1FwobQeyh3wFyaq5QGpFjMcGMxu4mHVGv4e40ZPk1+e+
 bTCEfbGVc5WAXrlFm9HcGPdDh8b8YPawFcmnA6mpMGDiQNzxm7FMzFxcNCeLzfc=
X-Gm-Gg: ASbGncuwTZXdctcrJe6HvXLXMSYROKHLc0pr3FLc8y0UBh1OUUhfZiEY5oQrTObcFEh
 H+C7hKDXRXUrg7CYmulAoFdyv3tD8uukYLxIlLFfqXl0zZ/Sr5mHTtVpd6FAX5KpptQJvrUytlF
 PAeC5FcZtwxohv2j2WntAXDCw9OhGmvIzxu/sjFjGXBT/EX84CizyXAqm58+sDAVlu5anan/XF4
 hD81R/2iGw8J8osF3prawdKiWhVTPzkDhRQc5mAzPJdI+qiLFleFtLpEjBSOJa4xser56ei1Jf+
X-Google-Smtp-Source: AGHT+IGsnoqHMcWktSOZPQqvd28iN0YmRihdDITJqjMYdK4KveTM0SjKIdWKPJnVqOXaQSAn+AiUtw==
X-Received: by 2002:a5d:47c4:0:b0:385:dc3b:da71 with SMTP id
 ffacd0b85a97d-38a872e5facmr9946739f8f.8.1736865828871; 
 Tue, 14 Jan 2025 06:43:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80b2sm14829023f8f.80.2025.01.14.06.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 06:43:48 -0800 (PST)
Message-ID: <d0fdf2c5-402d-49c1-a524-76943a24ecda@linaro.org>
Date: Tue, 14 Jan 2025 15:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/omap/dss: Use syscon_regmap_lookup_by_phandle_args
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250112134656.46069-1-krzysztof.kozlowski@linaro.org>
 <9b54bb98-0d96-4c48-9500-4e754889d795@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9b54bb98-0d96-4c48-9500-4e754889d795@ideasonboard.com>
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

On 14/01/2025 15:23, Tomi Valkeinen wrote:
> Hi,
> 
> On 12/01/2025 15:46, Krzysztof Kozlowski wrote:
>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>> argument.  Except simpler code this annotates within one line that given
>> phandle has arguments, so grepping for code would be easier.
>>
>> There is also no real benefit in printing errors on missing syscon
>> argument, because this is done just too late: runtime check on
>> static/build-time data.  Dtschema and Devicetree bindings offer the
>> static/build-time check for this already.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   drivers/gpu/drm/omapdrm/dss/dss.c | 14 ++++----------
>>   1 file changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
>> index 7b2df3185de4..692df747e2ae 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
>> @@ -1236,21 +1236,15 @@ static int dss_video_pll_probe(struct dss_device *dss)
>>   	if (!np)
>>   		return 0;
>>   
>> -	if (of_property_read_bool(np, "syscon-pll-ctrl")) {
>> -		dss->syscon_pll_ctrl = syscon_regmap_lookup_by_phandle(np,
>> -			"syscon-pll-ctrl");
>> +	if (of_property_present(np, "syscon-pll-ctrl")) {

I see now that I combined two changes I wanted to split. This should be
a separate commit.

>> +		dss->syscon_pll_ctrl =
>> +			syscon_regmap_lookup_by_phandle_args(np, "syscon-pll-ctrl",
>> +							     1, &dss->syscon_pll_ctrl_offset);
>>   		if (IS_ERR(dss->syscon_pll_ctrl)) {
>>   			dev_err(&pdev->dev,
>>   				"failed to get syscon-pll-ctrl regmap\n");
>>   			return PTR_ERR(dss->syscon_pll_ctrl);
>>   		}
>> -
>> -		if (of_property_read_u32_index(np, "syscon-pll-ctrl", 1,
>> -				&dss->syscon_pll_ctrl_offset)) {
>> -			dev_err(&pdev->dev,
>> -				"failed to get syscon-pll-ctrl offset\n");
>> -			return -EINVAL;
>> -		}
>>   	}
>>   
>>   	pll_regulator = devm_regulator_get(&pdev->dev, "vdda_video");
> 
> Looks reasonable to me. Tested on dra76 evm.
> 
> I can push this to drm-misc-next later if I see no other comments.
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Let me send a v2 with your tag.

Best regards,
Krzysztof
