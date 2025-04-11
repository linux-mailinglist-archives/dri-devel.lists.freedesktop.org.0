Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE83A863F4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 19:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3B710EC38;
	Fri, 11 Apr 2025 17:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="dbzdK/xB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2634E10EC38
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 17:05:06 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2243803b776so32895295ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1744391106; x=1744995906;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
 b=dbzdK/xB6J0m4BsNjj4aWGhuicp5cCtDwq2Bk0YAHxhz0AChnfMTdl283HyN2UMHlE
 D1ES1yLgMfnX9Ah8TdgBcKEwTs8KeZwcim8v/U+K7BCyQz4ZtE2sVxMl/C1PEZ9O4aD4
 5zQXANolUXCZyJ1A5WO6Obn+xmcs660vR9wVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744391106; x=1744995906;
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
 b=TA9OMNdvxfFVsDLKBuAkr8iDPxz2YnuExMXcZjqk0JbyyqS5YAc0JN9t/eN16eOnph
 LauJq8VDMzvhqxklCIzb4KvG8nul8ICgAFlONq/z+L9CUDfsOrN/QxtyKqQe0S4vN+ve
 3NrtrodAT59bVz6Q/KOL2YcM4VZCFguQGsLYuyEqpxkQ9/ppLetGe1cRDH/x5Ia6pI/d
 ALTp6zwWEHOYSP6smxtjmt+23WdbKEKu+PLNoTDUPrleJP0BU57EGSXgeJRZOLX/GD5Y
 NLRJxCuJG5EOP/F2ZDv+wQWwEhqolzBlNxaiKJSjHFgVxTsc/KEpNhxVRYm7CT/YIKW+
 wfew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG35xJqpJMg8knDrj9+f6qWu06sfM0pd0rj7aaG0qrBdgud2CV8M4Ecqa+xIYpzlmtRQKW6Sw3Beg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4TGHVU5+PJ+piW5ao43n7HPPR57WevE9ZtGv1Cjbiw/9CSb+U
 aQm02t/b6qzzSm4O4BhdOFj2kn5KHPS4+HjAgoN5YlAbTOFGrywcQOXpbSzbqg==
X-Gm-Gg: ASbGncvlqrPm/WmLKja8tq/hIKs8JLjLncF1PJZyfoKZJBGbDxxMTWNTR77juCTePgD
 aDk/iTDLWQlo4zQHWGrQATzTYOZV4D/P2HS7RGpTdwaRLNzg/8iveYKGxpJCTqZ1onMmknPJdsp
 WavIOpvIqi0n2y3EGChZSh+3wCXXpamZXhJyq9fqfmvqfPR20HPo3tLR/HQO69mEs/sSCE4j2E7
 JWVfdtsfQB3HxAGl4767pZoSKwDBDT0A6xSI7XPvCJ5n2MP9j6yvOOtZ30AmAOcycGWm8Mt03Tv
 tM5IiHUXGypdhY0bHj6jDgrSORbllGz59Cxc5Ec9x24YZNHJuqvcIueKyWA4147VtR4NAC6MdcM
 NMCs=
X-Google-Smtp-Source: AGHT+IFsxw8IYiWvCcCfohL9OR/GeWdiXtYFPHAC7JyqV95Ksyc9aMccKi6WlaMRFkxD3Uw+BXU/BA==
X-Received: by 2002:a17:902:e5cf:b0:215:94eb:adb6 with SMTP id
 d9443c01a7336-22bea4efe58mr64393975ad.40.1744391105389; 
 Fri, 11 Apr 2025 10:05:05 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c93aa3sm52081595ad.149.2025.04.11.10.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 10:05:04 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>
CC: Johannes Berg <johannes@sipsolutions.net>, <tglx@linutronix.de>,
 <mingo@redhat.com>, 
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
 <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, 
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, 
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, 
 <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, 
 <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, 
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, 
 <parthiban.veerasooran@microchip.com>, <gregkh@linuxfoundation.org>, 
 <jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>, 
 <jdelvare@suse.com>, <linux@roeck-us.net>, <alexandre.belloni@bootlin.com>, 
 <pgaj@cadence.com>, <hpa@zytor.com>, <alistair@popple.id.au>, 
 <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, 
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, 
 <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, 
 <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, 
 <oss-drivers@corigine.com>, <netdev@vger.kernel.org>, 
 <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, 
 <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, 
 <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, <Frank.Li@nxp.com>, 
 <linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>, 
 <david.laight.linux@gmail.com>, <andrew.cooper3@citrix.com>, 
 Yu-Chun Lin <eleanor15x@gmail.com>
Date: Fri, 11 Apr 2025 19:04:43 +0200
Message-ID: <19625cf93f8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
 <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
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

On April 11, 2025 6:37:35 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On Thu, Apr 10, 2025 at 07:08:58AM +0200, Arend Van Spriel wrote:
>> On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>>> On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>>>>
>>>> This is orthogonal to the change to parity_odd() though. More specific
>>>> to the new parity_odd() you can now do following as parity_odd()
>>>> argument is u64:
>>>>
>>>> err = !parity_odd(*(u16 *)p);
>>>
>>> Can it though? Need to be careful with alignment with that, I'd think.
>>
>> My bad. You are absolutely right.
> Then maybe we can still go with:
>
> err = !parity_odd(p[0] ^ p[1]);
>
> I believe this should still be a fairly safe approach?

Yes. Or whatever the name will be ;-)

Regards,
Arend


