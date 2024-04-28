Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947F48B4A9E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C5010FA73;
	Sun, 28 Apr 2024 08:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FsHdVYn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6284810F9B4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 03:44:26 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-5d3912c9a83so2217076a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 20:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714275866; x=1714880666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OBiP6VVtZadZOlLmcPG9euKbSsAbzPKPZpDA/s04QyY=;
 b=FsHdVYn4BKEwLwb03jk/7T8jpvVpCySxHBorvWXFdd/XtrakRxIE5++6wlSWWNKtSe
 eRqAxf5X9xSn/EScFocC14G9fjdZAa6YX9JOrMUAq6k1+LYM9qCKeEcrrM6w2hZ6Zy0o
 Y/PKDd+C0mKUfMu5mBMBKEsBVC3Cu9cqyVuGoij9EAiEhLypx4z/IFBT7CgVRjGOOCMb
 3pXfPixwjbLFcSAIZtsMBVnP0zEuwIYhKYcrhxIOQlzB11emeUdex6+JjyTdeNQSBznJ
 8wOBcT7V39HJmZpSzwUL9cpby3tA1jDqmgS5TbW+GOQosuTJgJadUFKsaczq2+NybwR3
 tPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714275866; x=1714880666;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OBiP6VVtZadZOlLmcPG9euKbSsAbzPKPZpDA/s04QyY=;
 b=Iim/bevk8TLxRsH0yzKYgYsKIF8+InPRx3qV722gdWTKCG5zsk7yao3zeDtkvZoM4/
 XOQNhRN+cSsTAl4wKS5Xrk0ojqMsbM+LoJNcmB/Z/yFxR7YtWxuqiAj1VDUzdHDxj8/a
 5ft1V2C5CuzZUriZRf6/rYvtDDIaA+x2UPHML3W1UTZpk1FMf8pCg/IpR86YwJlW3e/P
 41UpBSU8RJSj0jM0ow5cFJ3LWzktPk1UJmQ5wyyr1wweJn4xU9KA2HgOXL+8GCVRK3St
 DDppu2FT6dyOefAFeOe4aAiAuCS6oSllzdoTzztahhIuCBECubpkGq1koyii/HZ0qijJ
 YSjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWESNQOQZP38H6i4aBpkSw6YYIvbEthA408g1t3TzR4vIy4JFMMqmIDOaVWBjSEbH81qTBOFiHLzqn9wtI5hrdse+w7H2zsdPtBk8kzoaTZ
X-Gm-Message-State: AOJu0Yxh8DHlbLf56gphYLTiTKE7hNwk04Dz87YZryRzSizf2z8lfkpg
 EZng1aq7mpQzPeIBJY8m6BAAH8xQanZbfLw6P03Rq9qWaRHbwtW+
X-Google-Smtp-Source: AGHT+IHB9vLCZcmksld3ZxwFbUVxFZhmSy2xPGeAFP1pdPi1V9V6/BYyQmycpFtt0RVlyyZVsnhEfg==
X-Received: by 2002:a05:6a21:3e07:b0:1a9:ffa0:d007 with SMTP id
 bk7-20020a056a213e0700b001a9ffa0d007mr6319960pzc.58.1714275865710; 
 Sat, 27 Apr 2024 20:44:25 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170903028300b001eb15178370sm3366459plr.130.2024.04.27.20.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 20:44:24 -0700 (PDT)
Message-ID: <a14fd65e-188a-4f24-90ef-366e405832b7@gmail.com>
Date: Sun, 28 Apr 2024 11:44:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: vendor-prefixes: Add AYN Technologies
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-8-e0aa05c991fd@gmail.com>
 <20240425161356.GA2729350-robh@kernel.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <20240425161356.GA2729350-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 08:07:30 +0000
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

On 2024/4/26 0:13, Rob Herring wrote:
> On Wed, Apr 24, 2024 at 11:29:13PM +0800, Xilin Wu wrote:
>> Add an entry for AYN Technologies (https://www.ayntec.com/)
>>
>> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index e4aeeb5fe4d1..c2365b0f4184 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -194,6 +194,8 @@ patternProperties:
>>       description: Axentia Technologies AB
>>     "^axis,.*":
>>       description: Axis Communications AB
>> +  "^ayn,.*":
> 
> It is somewhat preferred to use the domain name (ayntec).
> 

Ack. Will fix in v2.

>> +    description: AYN Technologies Co., Ltd.
>>     "^azoteq,.*":
>>       description: Azoteq (Pty) Ltd
>>     "^azw,.*":
>>
>> -- 
>> 2.44.0
>>

-- 
Thanks,
Xilin Wu

