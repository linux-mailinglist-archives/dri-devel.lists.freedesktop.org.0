Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F7A82EF4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A7810E034;
	Wed,  9 Apr 2025 18:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fifuykxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE36910E034
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:39:27 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2241053582dso93310805ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744223967; x=1744828767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=heFgvknjtFAVnh5LT07oSDFMGA94yfUYilk4Quncd6Y=;
 b=fifuykxo5W93zJO7NhK7kYL7n7+im/1nVI5HbrxB5/cAq8eVy6WjJ7+oMGpg/KaCw9
 r5S8f1XlI6KK6xT+DJ8Cs3lH5KRXdbytK5BVVp5PpOtD90jy06x2wrRvr7Ux3+3ZDH5G
 RjxmJF68f+m6CaTSKA4u3DNQoxHLSmBW7l6EREqMP9M2HWvtW3Bx7se0WnUX+W4LRvkW
 1UyyzGgTahbKHO4RY4v2cGvK990EfJgjd2+FBkSwEXk/uvOwWxH3ECFdsEU7wPUv16V9
 CIIMLoQ+QNan9d5y4bikCM32i3gEjDNC15+T2HqNFtoaSISvxfAX2+Q8Fgnc80ZErU4q
 Twjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744223967; x=1744828767;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heFgvknjtFAVnh5LT07oSDFMGA94yfUYilk4Quncd6Y=;
 b=Yh14JarTqSWqZhnmDb1M9fGhu6+fC014Tez82N21bLrMmcnCx+bJHgZcAFlEpkZOM/
 vK/FWtailrkty56HUdjePtzof6ySujwtEyPatqTBdgvbg7/LgADH3DoowdocyzJlqmGE
 fs1xdPeH6KetEWBaxiloVHULmXFRBUBQHJjKQlnpPjjsOAYsIKtykQlsxb/VQeuL6D5B
 A+McAYkNZWw0E3gg9h+kzxsOmKQsF/kMwKNPkuxLcEj6XoK0lPlgsWyw/X1OOl5hmnFk
 T849jntamfT1uBvuioy8p0vuGR4QngVd66O3xgyRG+rc+ROuDG0dWTMWUnpf1Zl9icL5
 dpxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUShrg05eEGeYNiFd7VPfWTuykl+uHhQTyPr4FCpM9QkY7rZE8eFt36L9YfZq8qVndtAM2lCZY8ECA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ/AeVJnu91PIIs/cq3Cxg9sTyp3mr/QjoOuWDc3FkQHYEAecd
 ug6m0KXHDogsOIeDuZ2IvCKuVQiLybqZ9uUvJJsWEjGo/qn07haL
X-Gm-Gg: ASbGncuqIwVCpNVYfR+wwO4JD0zbpyECAsR6k2jZwedqgRoMa3PhPLnJmEUMEoBskD/
 Tvpo626/fAdTkpX5B90Enz0U4x9Q2aoVSQi/IJSGyTHQjQDaggehvJ8w0oQ3tnroweMPGnMqWEM
 l0cXjcRN33TNWFPRdI3WfB/8E+Qjxf/2tithBvEdI+dYzfmYn3tnDRk4pLxYrVbfOhqPrPmqA87
 8DpZC4bRBq6YyaGUf7o1v7VW/Jl3wFES8LR/ehlA/scXXyKQh3InIUod1MSePLVDBPDd6UjCJrp
 b17b9k3zI/0R3UXsRQCfZgEZPG+1T3pboWS+VJ6lp95d1qtVVT+hcswm3C2kUkaxdQXzaAdKGlS
 Mg7oc+/gX6YvqrQ==
X-Google-Smtp-Source: AGHT+IGbAcYQ28Tr8ToejeUQ3g8eFYPCcQiv8sSHIhkpS6MKA0JGv+p0sl3c5TBTYw+D7H2xHKtHYw==
X-Received: by 2002:a17:903:2ec8:b0:220:efc8:60b1 with SMTP id
 d9443c01a7336-22ac3fe6081mr53698205ad.39.1744223967213; 
 Wed, 09 Apr 2025 11:39:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7b62959sm15480135ad.6.2025.04.09.11.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 11:39:26 -0700 (PDT)
Message-ID: <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
Date: Wed, 9 Apr 2025 11:39:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 akpm@linux-foundation.org, jdelvare@suse.com, alexandre.belloni@bootlin.com,
 pgaj@cadence.com, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com> <Z_anYpZw_E8ehN21@yury>
 <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
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

On 4/9/25 11:25, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 12:59:14PM -0400, Yury Norov wrote:
>> On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
>>> Redesign the parity8() helper as parity_odd(), changing its input type
>>> from u8 to u64 to support broader use cases and its return type from
>>> int to bool to clearly reflect the function's binary output. The
>>> function now returns true for odd parity and false for even parity,
>>> making its behavior more intuitive based on the name.
>>>
>>> Also mark the function with __attribute_const__ to enable better
>>> compiler optimization, as the result depends solely on its input and
>>> has no side effects.
>>>
>>> While more efficient implementations may exist, further optimization is
>>> postponed until a use case in performance-critical paths arises.
>>>
>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>> ---
>>>   arch/x86/kernel/bootflag.c               |  4 ++--
>>>   drivers/hwmon/spd5118.c                  |  2 +-
>>>   drivers/i3c/master/dw-i3c-master.c       |  2 +-
>>>   drivers/i3c/master/i3c-master-cdns.c     |  2 +-
>>>   drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
>>>   include/linux/bitops.h                   | 19 ++++++++++++-------
>>>   6 files changed, 18 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
>>> index 73274d76ce16..86aae4b2bfd5 100644
>>> --- a/arch/x86/kernel/bootflag.c
>>> +++ b/arch/x86/kernel/bootflag.c
>>> @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
>>>   	unsigned long flags;
>>>   
>>>   	if (sbf_port != -1) {
>>> -		if (!parity8(v))
>>> +		if (!parity_odd(v))

What is the benefit of this change all over the place instead of
adding parity_odd() as new API and keeping the old one (just letting
it call the new API) ?

A simple

static inline int parity8(u8 val)
{
	return parity_odd(val);
}

would have done the trick and be much less invasive.

Guenter

