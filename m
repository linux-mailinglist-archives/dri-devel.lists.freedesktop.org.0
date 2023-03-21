Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617956C31CE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 13:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7AC10E0AE;
	Tue, 21 Mar 2023 12:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929A110E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 12:38:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b20so26114259edd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679402288;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fAHU5kqXRYKOLBxaAoswUkMHVemnT1L6PZ6oDpy10Og=;
 b=MpW1PxAiokgthWrvl0fAhVprwNnKMOzVF5kPm8DWuvwwuYdC/IZu/5/sJlhOcR9MLL
 9k1Ll2OzrGnEPdO12o5Not8Ij7zDVDNULBaQaI3oLJxXf2EEFoAci7QfsNB158/P96JH
 O894ra4J1L+2MIi4pJg2BCEkV1QSvMEX0wdZJXlYbdhn1byEljr/2jAxvgUEwCZa3qy5
 LFA8eWEXe4WrJ5nGq9RiIFQnPHsbPqWR9XHxiUhl+iWqAsUffZvXR1y9z9dLbMBcwSnm
 DSKF0EI8mkgjeaREKfVET7gFLUD4JOU54ASbSsUejmCTAtO058LNyXEntJM07Ao3Upmt
 wa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679402288;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fAHU5kqXRYKOLBxaAoswUkMHVemnT1L6PZ6oDpy10Og=;
 b=AJ0hf70p2u/wbaM1+DPRrPMRAbsyJ/y+xgoplUpDMLGdJkr4dM8AlxqrvwzYMO3Ws6
 BbjsNswUg3ts301cGkMHiMby0bBMh6VKCcN9fYvKeqvpp9BKL3QMjtQ6F6+C2LLpE0AG
 WJtSwotSLpfb3muaFsXw0SaS/87oXt0zAWMJlyBnBMW3EWPKGwDNy6S7d57vXGgfAeSp
 p03E/su7IbIE06j5qRdryCMoO+yDv2hLVwcTGTtGPu5JKSPS182aEW6+Z6MhqgXGgyrG
 TQ1mCL6hLLu6jQzzkqHvfBbEhMywh0xEf5kTnqVrlbdZHHLCVhRsYZFtynAMoTYbLMtn
 hGbw==
X-Gm-Message-State: AO0yUKWeTelw2qV3iKaNF1FTuAyYGfWY5htKnN9Dc46ymkG0jnUXlxV0
 mBk658XJ3h2RacI0SWyITCRRxA==
X-Google-Smtp-Source: AK7set+vNaEbl3l1Z6hbghc31W3om2GAvq3BZt9/SEGY2N7Ry7e+QAITpS/ixh1bfJlmj1UWuz7y3Q==
X-Received: by 2002:a17:906:7249:b0:895:58be:957 with SMTP id
 n9-20020a170906724900b0089558be0957mr2691044ejk.2.1679402287907; 
 Tue, 21 Mar 2023 05:38:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817?
 ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a1709063bce00b0093344ef3764sm3865240ejf.57.2023.03.21.05.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 05:38:07 -0700 (PDT)
Message-ID: <55cfacf6-03e0-b9bc-83f3-3e9f2d7b2d4d@linaro.org>
Date: Tue, 21 Mar 2023 13:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: Add no-hpd property
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230316140823.234263-1-j-choudhary@ti.com>
 <20230316140823.234263-2-j-choudhary@ti.com>
 <dbc43c09-f8ec-f877-598a-adff47d44b0e@linaro.org>
 <79ce5fe8-9fb0-5caa-67a0-87dee7867856@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <79ce5fe8-9fb0-5caa-67a0-87dee7867856@ti.com>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, jani.nikula@intel.com,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 a-bhatia1@ti.com, alexander.deucher@amd.com, yamonkar@cadence.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sjakhade@cadence.com, tzimmermann@suse.de, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2023 13:02, Jayesh Choudhary wrote:
>>
>>> +    type: boolean
>>> +    description:
>>> +      Set if the HPD line on the bridge isn't hooked up to anything or is
>>> +      otherwise unusable.
>>
>> It's the property of the panel, not bridge. Unless you want to say that
>> bridge physically does not have HPD? Does it follow the standard in such
>> case?
> 
> MHDP does have hpd. But the mhdp driver should handle the cases when the

This is about bindings, not driver. Your driver can still handle this as
it wishes.

> hpd pin of bridge is not connected to that of the DP-connector. This is 
> to add support for that. (optional property)

Which is indicated by panel no-hpd, right? Or you mean now that HPD
physically cannot go to panel because it is cut on the bridge side? But
isn't this the same case (from hardware/bindings point, not driver) as
panel would not have HPD?


Best regards,
Krzysztof

