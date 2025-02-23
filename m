Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390DA4217F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC9410E525;
	Mon, 24 Feb 2025 13:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PX+DSyGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A2C10E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 20:25:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-abb8045c3f3so463274966b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 12:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740342346; x=1740947146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KO/NRoKuG8XetnuWE85hFK1fCgTrWENxYrVqAq/LSbo=;
 b=PX+DSyGobkPxHvbkbvlotKrJQJw9vPYheFIwtwebalRDn0toMnRGVZJQ5VBpFiGcy8
 Qpdx8MZumMeu+R9u1LmOraAS1XCLRx5D/6V+s6s/ErpjE5O4fPwFsnkdHO6RgsaEDbpk
 yk34sl12H6T80vWL2Sd5UYj+0aNCGahcpt4ngtQr89P8MWX1BtKkhWfErpc6BtQw+yUv
 VVpfbsc7G54qXus5v756pOYp5bwKfsHeGmJt5wAjYtsIr6spYpjYO/ojpezEmvykyhoJ
 MzxzWdPMJhmyZ5F37H3Wde9HsTaJL/0zvVnEOAm9wOjXwXe16YEst88i2OnlAztbYb1n
 vYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740342346; x=1740947146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KO/NRoKuG8XetnuWE85hFK1fCgTrWENxYrVqAq/LSbo=;
 b=jFAYx2A+B0LZ4jwx+iIlMFSZmOLfos7pTlI5lkfLljZk7oEBlwxeUCTm0hN85ne81a
 xEO5LANZ1fSqnsRj+/c06ZJmE5t7ukV9afO6wW6QTlTVRCDvyUGsooQIUlZCmY5ZbOYd
 MYlCu47fbea5K22aS5ByPnrFlT5SaM4zOJHXlTyv4PGghNW1MK4/7IKghk4TBTPHUvi6
 XHORAzk56Ge69tPP+hoK1VdI1pdCeNRwfNIgnHreECfim2PuYxVQtjkgM4F45k2V2XAS
 x5uZmLdQ8Zdov3K8DAsoKoF7/kCdN22u+b3NifA3XVvjW1yWuD7V0iw9YNzWAzGu//yr
 dwDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZkVDeI91w1JCiqERiMJLYlQ1dmL4a/mVqSfmXE/ycWT0wB23Z/4OfuYdwK7S6SEnX6MnI4nk3M40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv8Bkmbnw3jK4Hr/EgHbxONHYxvwpqLOWz+IoF6rLDdZmWhLYQ
 4rx45o4runfjKjKDTKGkcVK7/ZHNWAeoHUZzW3X9jg9onACI4p+B
X-Gm-Gg: ASbGnctbUA2+adHzhWn0F6S0FE6Y555A54dbecfrohnAnVRhZmXQo6c/lfaMCQlEwhD
 HPSwPk+lMae4BqXniLaXxSyVUU3HSVlBmcSEAkSM81GHigQdJzrT3GraGUNyySiIHfujd7iEUBA
 B1LRrRDl5tIeQXHRgqgnithD023yTeApP9OyReDEbclU+5fnh1QJYM/V+UDT3NMezCOP+ZxPuEb
 HCLjqrg2301TsjRo9dvW1DaZ3PZBMxx9FNL/7Qg5jj6GwH4CpnsndsGfFG5EJetk/NWASnJWPqN
 MA9EicpGy45wRnR8nTJrJv+4lvs=
X-Google-Smtp-Source: AGHT+IEASkBZDUs2HV66FfbppKxrXfiPEOQdWl35/1TkX9MbOUwdnZRhQOYUiSPPWnjZ/EnkcBUtNQ==
X-Received: by 2002:a17:907:1b26:b0:ab7:be81:8944 with SMTP id
 a640c23a62f3a-abc099b88ccmr1174431166b.6.1740342346244; 
 Sun, 23 Feb 2025 12:25:46 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbbe74100asm1142813766b.95.2025.02.23.12.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Feb 2025 12:25:45 -0800 (PST)
Message-ID: <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
Date: Sun, 23 Feb 2025 21:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> Several parts of the kernel contain redundant implementations of parity
> calculations for 32-bit and 64-bit values. Introduces generic
> parity32() and parity64() helpers in bitops.h, providing a standardized
> and optimized implementation.
> 
> Subsequent patches refactor various kernel components to replace
> open-coded parity calculations with the new helpers, reducing code
> duplication and improving maintainability.

Please note that GCC (and clang) provide __builtin_parity{,l,ll}() 
family of builtin functions. Recently, I have tried to use this builtin 
in a couple of places [1], [2], but I had to retract the patches, 
because __builtin functions aren't strictly required to be inlined and 
can generate a library call [3].

As explained in [2], the compilers are able to emit optimized 
target-dependent code (also automatically using popcnt insn when 
avaialble), so ideally the generic parity64() and parity32() would be 
implemented using __builtin_parity(), where the generic library would 
provide a fallback __paritydi2() and __paritysi2() functions, otherwise 
provided by the compiler support library.

For x86, we would like to exercise the hardware parity calculation or 
optimized code sequences involving HW parity calculation, as shown in 
[1] and [2].

[1] https://lore.kernel.org/lkml/20250129205746.10963-1-ubizjak@gmail.com/

[2] https://lore.kernel.org/lkml/20250129154920.6773-2-ubizjak@gmail.com/

[3] 
https://lore.kernel.org/linux-mm/CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com/

Thanks,
Uros.
