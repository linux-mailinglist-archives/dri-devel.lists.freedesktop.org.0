Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13F9E9193
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 12:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF9410E6C0;
	Mon,  9 Dec 2024 11:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y6ClI+kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3904F10E6C0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 11:07:41 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso18014615ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733742461; x=1734347261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
 b=Y6ClI+kQh7StaLlaAUD4FF7ZbnW3ges1WhriM9HIjwn7oSa5zi/1AyJ2jTosQKsAbg
 aiJS/3uJiw68UWbEQjO7RBTAoPC0pLOGdzX/HHzcs3eR7x2sSz2BZvjOKE+HFUDtpvNH
 oLO+zEBcmirWvqcp/miBU/Zqn7v9uuUhE/tI+EjURIjtwBTpWcOCfU0+ZlKZElT5k1yK
 KOGhyYg1lT7XcHOVJd1udSizYrT8W5UHTJ6g6NgaZDLn8uItlATKhoHjJ7k/pFt+Npkw
 H8xuqpHdURUj6RupSrs+2SzOHjJXtoturP0MtA6LUBV13RnIt6/RObGAZk+4DWQBCdMy
 X8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733742461; x=1734347261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
 b=fjCWpA4steRnbxn10iKyS44pVJ6b6I2JmgBSQo0vIturSLRm2sEQ7wF1HMXr+46xrH
 frcNns/0RTsRuWGNCUwGgMZNMwoxyAtc0FnunfBeZaK4/wDoIwtBToiKosPFE54YnJQj
 t6eF3TwirIuR7j82Pve2TfKLYrc2nYbi6orwvt8MU1Q0f1IyFsuqd47VPNavOFctB/39
 36c+QQTLY23LepYm0z9w6OvnFWFiocBF4RUGC9REe5dnzmyBr/8Q+RxafbB3tS5VY5mz
 tncq7fdStoWpJC2y7WIb9dMNw8HQLkDjHUvCf9YM8hgelVRMa84rxPhW2fopOFhQN9Sm
 xPag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrnmhYMuBf8VhCdxJOtLETx+vI/Kqs4QLfiYfsgyvyx0B9DUoZrc59BXZQrYf2JcUmCKVL+TaGNvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfxy4+iTzYlVWP7I2QTXLw5fCk5ZY/iDICIWg5nq098GfWGZj4
 VS49k5DTCUrmnMb1vGFO+1itlY+q2zHu1N5KrJzH1n6XqT9/cpgEO+u1SQ==
X-Gm-Gg: ASbGncsZBqVaCR9zHA7b+qlbWiVgcPwQb8tON4oLAMzOWcoCLr9NxyaqP948Ce2TfuP
 cl8JGQsB9Du5Ov8u7Py7nX0kc+MXWooL1/REYvglnysWMBa4iTBcWlDzZ6zs+Bqo1ceV0JDDDx1
 aIA5NszfldzI3CqBQlpNmtbZTsyPNly848C2NL/npenb6sJNcrPr1DcWK8AzzEaRgnAyDZDiM7i
 GIylHg51bxIY4aivuedJZXJNfnmStKuAbqZRoXHd98JoaDfcwXpkyy6gw==
X-Google-Smtp-Source: AGHT+IHE+t2Du1WqC/+jnVLPWSG0jQUPMDd8/py9w7+kgKS309UwwhMmDAhAU/gz6Yfj4oBXSzHyqA==
X-Received: by 2002:a17:902:f607:b0:216:4883:fb43 with SMTP id
 d9443c01a7336-216488401a3mr47732355ad.32.1733742460654; 
 Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Received: from [192.168.0.122] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8f3188fsm70017745ad.265.2024.12.09.03.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Message-ID: <494a944e-4088-463a-abbb-c0a8cf4455ec@gmail.com>
Date: Mon, 9 Dec 2024 19:07:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <20241207130433.30351-2-towinchenmi@gmail.com>
 <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
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



On 9/12/2024 17:16, Krzysztof Kozlowski wrote:
> On Sat, Dec 07, 2024 at 09:03:14PM +0800, Nick Chan wrote:
>> Add the device tree bindings for backlight controllers attached via Apple
>> DWI 2-wire interface.
[...]

Ack all the changes, will be in v4.

Nick Chan
