Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E90B9E9006
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D23610E12E;
	Mon,  9 Dec 2024 10:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dBBmmOYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CCE10E12E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 10:22:25 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-725ea1e19f0so628454b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 02:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733739744; x=1734344544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
 b=dBBmmOYKui2bYd2JY4gfuLlrvWMBRIMpQQfFDijAemJ+w+9juOSVp/VAUIhf123vn6
 6es9maHHD/WUDpYIu2EQKhZDTlQsk9XxrOW4zEUbA0+K6/wkMfC89J84M5OBePgbMI4G
 RF299sM6DKQhsQdTz1SZWHFC2QggJY8DTtVOthX6PnmMNIlnrMLWAxOrem/dKX5Jte71
 z4IM77GEd0m+ZJ6fCSoY5sX1LSu7GRSmaJnQHuHb958LPDJiLU7YsB/d+FepX4wPNlpE
 XPZOz1mHeEg+volLAFNT6aDdHrvj5OXUVT5sa16wH5l29avMURf4j3gwc991cTIQEUmM
 +Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733739744; x=1734344544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
 b=J7tf+R0//gQNUWxQTJpymMMTlNPo4E/q+bZ2izcVfukMsxkvrqtFdH61iVwivRzu/Q
 SlCWyueSyqCjvGhfA4RIUvSXooO43jssMFrku9fuLYFqD8hAmwHtBnzmvQKfN++8bEN6
 YVwTOpTqLjWpQlveYIcdrdGuVlRd4Dw8rMzTZ+eZI0nBWUm81WQRbMeEGHidSzjY6Djq
 pKABameQQ5O0wzUY+/9SdVwMgTOq+5RHKeUcPXc9mXvQ/qC/G3SCl92NvOER0KUvTM3o
 RwKsEl7v/2a2jnxektF3WRLRnVbGubGwuHOhCTBH0vkaZcC63l0dEC3E+cWZ1zi5wmvy
 anQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH4Gn6NpvK8tSL51CCG4p8kNAYrqtXtwBsjjBOT9l1yiCdHM+yGYd4qnFO2+c3d3zeZIX/HEL1GQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLQn8UZlAIx4If1EjWRbNG9sMKs0Efviub/LYp5UeZrZ6neKuL
 p8Z1o1Lh8TRpGvv/jwhrzatiBaIa9FWUuEs+XdMo4FKu2x/Qkl+N
X-Gm-Gg: ASbGncsd3c8gpdtIDI9ei/UKfu5CKyWAN1gNuZMiZ1F+Xn13hfZpz+DfprpnZLP1CAs
 Ts3w85uCDPMqwDjgZwn6BUBWUkml9jzbT2G8eaern9ydNV3zC6gt942vu5pHCiV8lb//QwfyoVy
 p6rWP+hI+mqPxXx/znzWa+TAMzwFUmx+vczZRcJpA3AFpL+qDRT+CeU9pGlLbgfJqicCjpuWcAx
 VSwS/+zmRF8UAOeNCfYVVvzgi5m6Rv6Vqi4NdbpMFis2AU1Dtt9yI3txeRsldCf4eXu
X-Google-Smtp-Source: AGHT+IGIMaQLW4wct1dsitCDskJol1qDWg2mfuDdPh8GMuIT847eTTcppJMdsxFJj7Ut8lRt0yTYLQ==
X-Received: by 2002:a05:6a00:4fcc:b0:71d:e93e:f542 with SMTP id
 d2e1a72fcca58-725b820b43fmr19800743b3a.21.1733739744446; 
 Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725d6856bf7sm3620294b3a.192.2024.12.09.02.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Message-ID: <e06c5d7c-de3c-46ff-b2ee-8ed794577e70@gmail.com>
Date: Mon, 9 Dec 2024 18:22:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>, y@krzk-bin
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
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



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
[...]
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)

Ack this change as well for v4.

> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
[...]

Nick Chan
