Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49926B1455C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 02:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C328910E18C;
	Tue, 29 Jul 2025 00:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Dw+9cwbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E99910E18C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 00:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pRk2fyCDyZx5gPYPB0wJzgS/Jl89GG2lzFDMkwucWZQ=; b=Dw+9cwbtwkgP4be0O3Z3sv/AFn
 HN+FWJpjJZfL9SNJ38SYnQjtJNlOB56SVZHz0w0ASooDsprr7l3K0brn3rQZY2OBxZ+0LACz1STEU
 HllkwmgZ8cmutXHOo+ekh8JTgXmwmCEL0npfXG4wJFbK7FvbxresHG2ltFR3A8BRmIlhAET36yDw/
 +wAKCZty68kE021wK6PYkoVUvIZxQ7fixnAMd5Tki4Qf+G1Re45y6r5LzMfc/W8khFFi1JZMu7rHB
 khu8MH8GNp2etaG6n3s4d4cywGTtL6md6ERfa4RR5Cj+czaUugNpRaOw9Co9IBv/1gtCWy/g9pqEf
 NiYZWgKg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ugYEs-005AkZ-Sx; Tue, 29 Jul 2025 02:30:43 +0200
Message-ID: <9b3c2cb3-736c-46a0-a734-f17ed4bc0170@igalia.com>
Date: Mon, 28 Jul 2025 21:30:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Power Management for Raspberry Pi V3D GPU
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <e18ed574-e84e-4812-86c0-5cfd14860030@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <e18ed574-e84e-4812-86c0-5cfd14860030@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Stefan,

On 28/07/25 18:00, Stefan Wahren wrote:
> Hi,
> 
> Am 28.07.25 um 14:35 schrieb Maíra Canal:
>> This series introduces Runtime PM for Raspberry Pi's GPU, V3D.
>> Currently, the GPU clock stays up during the whole operation, even if
>> the GPU is idle. By introducing Runtime PM, we can now turn off the
>> clock completely during idle. For example, with this series, when
>> checking `vcgencmd measure_clock v3d` in the Raspberry Pi 5, we get:
>>
>> (idle)
>>
>> $ vcgencmd measure_clock v3d
>> frequency(0)=0
>>
>> (running glmark2)
>>
>> $ vcgencmd measure_clock v3d
>> frequency(0)=960016128
>>
>> To implement PM for V3D, it was needed to add a prepare and unprepare
>> hook to RPi's firmware clocks. Currently, they don't turn on and off,
>> nor lower the clock rate. Therefore, PATCH 1/3 addresses this issue in
>> clk/bcm/clk-raspberrypi.c.
>>
>> The other two patches are related to PM enablement in the V3D driver.
> Maybe you want to cherry-pick this older patch and integrate it into 
> your series? [2]

Yeah, sure! I'll add your patch to v2.

Best Regards,
- Maíra

> 
> [2] - https://github.com/lategoodbye/linux-dev/ 
> commit/2ee5e1205922b06100206e760ed8aefe0b6d322f
>>
>> To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
>> backporting this series to rpi-6.12.y [1].
>>
>> [1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power- 
>> management-v2
>>
>> Best Regards,
>> - Maíra
>>
>> ---
>> Maíra Canal (3):
>>        clk: bcm: rpi: Turn firmware clock on/off when preparing/ 
>> unpreparing
>>        drm/v3d: Allocate all resources before enabling the clock
>>        drm/v3d: Introduce Runtime Power Management
>>
>>   drivers/clk/bcm/clk-raspberrypi.c |  41 ++++++++-
>>   drivers/gpu/drm/v3d/Makefile      |   3 +-
>>   drivers/gpu/drm/v3d/v3d_debugfs.c |  23 ++++-
>>   drivers/gpu/drm/v3d/v3d_drv.c     | 171 ++++++++++++++++++ 
>> +-------------------
>>   drivers/gpu/drm/v3d/v3d_drv.h     |  21 ++++-
>>   drivers/gpu/drm/v3d/v3d_gem.c     |  18 +++-
>>   drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
>>   drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
>>   drivers/gpu/drm/v3d/v3d_power.c   |  79 ++++++++++++++++++
>>   drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
>>   10 files changed, 291 insertions(+), 111 deletions(-)
>> ---
>> base-commit: a7352c849492a30b5d8491fcb9314ab376a3942f
>> change-id: 20250728-v3d-power-management-eebb2024dc96
>>
> 

