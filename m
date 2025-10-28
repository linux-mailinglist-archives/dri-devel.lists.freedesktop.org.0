Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E53C17539
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5D010E6A6;
	Tue, 28 Oct 2025 23:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sG3bzq6r";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZJ+eQl5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A1D10E6A6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:18:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cx5sp4T0vz9tDq;
 Wed, 29 Oct 2025 00:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761693534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGEzJTZwXjohvldoWCwc0kmYf463XoC4zA6p6FCOMxg=;
 b=sG3bzq6r9IJF7C8DMGJRnwxLgyVMJFD/MukTipaXKQpX+SU9lG44oFHwmpqWE+hupPfGdp
 NeqWd74TGVGK5PDn2Jq0MJziWNR7t1BfhgtEx/559uO7PG/Fsdufr8cJfd6Sxz2oljthek
 go1eI2u9ZWMquuV8yJIxXjLaJDgAZD5AWrWsS7P6Ht8VokGljfdMAoPkpM+XNZiZLV9qca
 g/tZGq7IgtXEty3VZLm3+OHL+Qd8aEgd2jnXcYneEs7a/t+LOVcs1XCT4dHUz1kPbXjq26
 xaae93czkgy41aeZvW1M4FLuR/kkW9Y2jSfVJbilZfx0py+MHmCQhrb5AlXomw==
Message-ID: <8b4dd48c-ffcf-4e5c-9b31-073c9414176a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761693532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGEzJTZwXjohvldoWCwc0kmYf463XoC4zA6p6FCOMxg=;
 b=ZJ+eQl5hosv/v/+CZBiuc/aMAwEPeZ3HLW2TdvjWLsepttjyUbxnF8IwUYGoCzitkmpRMg
 pCasZ+R6+4c7aFaN0Sy5OaBev4ixAIH/HtHDqYWbiho+awUKsFbMkVl86YxmmUujathVBc
 myS8RXDm8X0ust1EHYTCELStbrNi+R803ObdD18fSqi2Jj3gMcNkX0And8Th6cF+HU0ib+
 0xDTG0zQ+7NpJnf0oNfl2gENxVoh+yo2fo2Go+yiIi3qUJEsyk232qLRYt6pBzfAgwtUuQ
 raHHi7X4BoN+RfBUvdO0Irgcdp8pEanaXVcfTeP6VoGAe+3o/JpdUJZVn5AFIw==
Date: Wed, 29 Oct 2025 00:18:48 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register
 macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
 <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4ieiudtsqbd3ng1izg13thzfd5iug8zd
X-MBO-RS-ID: 1019e97b1a3e2075f79
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

On 10/28/25 6:15 PM, Tomi Valkeinen wrote:

Hello Tomi,

>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> index 90e8e3de3e580..468f84cd1325e 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> @@ -246,14 +246,14 @@
>>   
>>   #define VCLKSET				0x100c
>>   #define VCLKSET_CKEN			(1 << 16)
>> -#define VCLKSET_COLOR_RGB		(0 << 8)
>> -#define VCLKSET_COLOR_YCC		(1 << 8)
>> +#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
>>   #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
>>   #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
>> -#define VCLKSET_BPP_16			(0 << 2)
>> -#define VCLKSET_BPP_18			(1 << 2)
>> -#define VCLKSET_BPP_18L			(2 << 2)
>> -#define VCLKSET_BPP_24			(3 << 2)
>> +#define VCLKSET_BPP_MASK		(3 << 2)
>> +#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
>> +#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
>> +#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
>> +#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
>>   #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
> It probably doesn't matter, but just wanted to mention: here FIELD_PREP
> is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
> (3 << 2) is signed.

For bitfields, I think unsigned is the correct option.

-- 
Best regards,
Marek Vasut
