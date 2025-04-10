Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A197A83813
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 07:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A85610E0C1;
	Thu, 10 Apr 2025 05:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="BPJepXSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5639910E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 05:09:18 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2c2bb447e5eso215324fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 22:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1744261757; x=1744866557;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G16oVcschOk1bCBWwdD3ZsJUcsex2zjDzFXRZC7O9eo=;
 b=BPJepXSx0plAkYIUI5kJzM7a+2Qpp3oTpViNUuj5cbi1Zc9mFtLzvrtDYL2IXd0xor
 5mvrMPiECAm33KWGn8pwsiahTrXS5sViWCGp7Ufrxc0mn4SkBGKj9SALlmCFHBYeV3cw
 VwdQJChwjnuiTdtfw6i+3jHtIIwX35PYSlBtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744261757; x=1744866557;
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G16oVcschOk1bCBWwdD3ZsJUcsex2zjDzFXRZC7O9eo=;
 b=R0drwWpFoQr3S1RtQwLdV0icFgiwQR6i29acnfQLVoKwDn4jU/uY08m1wfcC9eFFjm
 0ySHi5/ZaXrrIwjDNsoIKQGt+subVSfmw4vAJdpjGxD9ToKl5WnvJLxSSOnhqVc+IZDW
 ucJG0JXQfxABQ952lFKpxg/U+1TNxCDSpjQns2RoQk2aZHWnPiYz94AyBf4ZOeOR/mqQ
 PHVeEuWOfQBcNiZ/apHqVJPnqmvHqUKg5ZwkCoSpDqO+s++zt90nwxVwvXeGYPo13Tm2
 oilHnRNBw7uHo/2r1YUTZL1tMvLwMMKuAc0tOH8nneJpAYTKIYkueCFScLdRx/nFFRqM
 YK5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Yy+OYJU40/HcRWgTp80rLpBlT9g7MWOoTURzwK9P1TZoMlMYo3SBLTUw5WZMSBfX8ueGwWcqgQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR+dvObPelBbG/BVww7xJfXXiSKFhED3n3XJLPQlc9K7eBT4an
 7ryZzwZopWcq5NUoGhyQ3AkJyfkpdWYwbmWLRm7idaLXs0C6bMX4s9CP4zVJJQ==
X-Gm-Gg: ASbGncucynKcEzJ2J+jo40hS8DhJss6ywnqUW42Lydef7i14dDEI0pr4oej9TDiLZ7o
 RQ1skhwFheDh/n1bDhCmDJuxfrwlgl/KnBzRyoyjbbueB+jk+jvUyNOA8Wui/aHHB8EbM/2H/RZ
 EThuVQY6NlINeNhWOTlxdRfkTv2imMd1EwYSUp/nEKIS51emKSOe0lVT5UwkawcOCCuKMUP+X6u
 eCIbXMBUlsKFgUEvgqgzNDeYAHbNYGTtSdErsEUT2NawxrKbt0Y7h9VjJtFvoEBCnKMkdBFJmgB
 kAgqjpVuwyaozlOhuwWjZbhoA/ukTAdfDzilsKo9mPalFmeL0w3ZZz+WudweW7AEtZ72d8Pg6W9
 TtMQ=
X-Google-Smtp-Source: AGHT+IHf2dIBsgMwlqUxzHqfg0izmCh/XeIh4+y37IHWa4xRZwCt6+2s0H2VCnvp55v7eCTsGxhXjQ==
X-Received: by 2002:a05:6871:3320:b0:27b:61df:2160 with SMTP id
 586e51a60fabf-2d0b383616dmr840067fac.31.1744261757422; 
 Wed, 09 Apr 2025 22:09:17 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d096cd3764sm534917fac.31.2025.04.09.22.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 22:09:16 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>,
 "Kuan-Wei Chiu" <visitorckw@gmail.com>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>,
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
 <pgaj@cadence.com>
CC: <hpa@zytor.com>, <alistair@popple.id.au>, <linux@rasmusvillemoes.dk>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsi@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <oss-drivers@corigine.com>,
 <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
 <linux-serial@vger.kernel.org>, <bpf@vger.kernel.org>,
 <jserv@ccns.ncku.edu.tw>, <Frank.Li@nxp.com>, <linux-hwmon@vger.kernel.org>,
 <linux-i3c@lists.infradead.org>, <david.laight.linux@gmail.com>,
 <andrew.cooper3@citrix.com>, "Yu-Chun Lin" <eleanor15x@gmail.com>
Date: Thu, 10 Apr 2025 07:08:58 +0200
Message-ID: <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
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

On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:

> On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>>
>> This is orthogonal to the change to parity_odd() though. More specific
>> to the new parity_odd() you can now do following as parity_odd()
>> argument is u64:
>>
>> err = !parity_odd(*(u16 *)p);
>
> Can it though? Need to be careful with alignment with that, I'd think.

My bad. You are absolutely right.

Gr. AvS
>


