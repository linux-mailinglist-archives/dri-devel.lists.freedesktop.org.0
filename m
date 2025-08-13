Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE33B254F6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 23:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335E010E02F;
	Wed, 13 Aug 2025 21:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cdPGPxSN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NuBoddv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F82910E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:06:36 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c2LXB3dC4z9t9l;
 Wed, 13 Aug 2025 23:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755119194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXUYdiyOFdWb2xcTIWDWLT2Bvo7KGxD/FsHoRDWMjLQ=;
 b=cdPGPxSN2bER0nXzKHvZgZefGZWQgoAbHSxl8ASZl+c8udBVeCwBg7oKcUKa4Zjx12bLQO
 CuYa67LCGUYzEryg0gAoGR9mb0Wb69v3BINLBUPZvxcLVa1f8OXrLL4S6Q8U7rMKwxs6kW
 j2r+uHU/JEavJrbmHBOcGSny7UOqS/GcufH6xOWI/ZCKUrg1s8kc6PwXjDM4tGJQc06fd8
 nLYeptwsne2ygZHj481tUtCnpRzUZjya5LNbSczQ0PFG21AnHhVW8KezybrtDHQppd4ZFt
 lT58LxyFsiV6XxDu+/iRyArPOdFXdhQ1tP5u01RyWF69DlVXEeX1KQDGTzDefg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=NuBoddv9;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <58109767-145b-414f-a20e-aee651e9e4d5@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755119192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXUYdiyOFdWb2xcTIWDWLT2Bvo7KGxD/FsHoRDWMjLQ=;
 b=NuBoddv9AmQnPes2jc96mrnsseP+r/5e9ocN8z9av21vKWoJzMeY16g6hn867p1gLz02L9
 0r9F6E1vp46jzcQ02gA/5UmLrxTRIMrQ3QihBEVRkIGy4b0achV8a2HPaVk2L2KzbNLRcx
 XFyeN/7ZNJFdmWRcHfNcdpq+VnOFcNWHANtDo7IESjT3cq7BaX43BDstVmYm71XZUiERtE
 XsjDXrUVOliJELUOESeXh0c5GoBcyR0nTTlmHpqhTRqr7mcwAqzXJFeeHAaSY8Nh6SvGKU
 jBSZ9TIFLsVUhwvjc37jyENQIYNs4AraOVWHFEoIym/do7XVAsJ6R/uVhwiWeA==
Date: Wed, 13 Aug 2025 23:06:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] drm/rcar-du: dsi: Remove fixed PPI lane count setup
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
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-3-marek.vasut+renesas@mailbox.org>
 <64b49da6-15ae-45e1-a4af-c1f08f80cf3a@ideasonboard.com>
 <87cc32a7-fe1d-4d8d-b793-e3bb7e12fb7d@ideasonboard.com>
 <1ae735be-3d07-4520-8013-c4b7a1b1c26a@mailbox.org>
 <c83317d5-53f1-440e-b854-c75d283ed746@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c83317d5-53f1-440e-b854-c75d283ed746@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: b8gk49p5fhsj1kx4fjuty8it7smzhqd3
X-MBO-RS-ID: 5623dcfe4c04eeb44dd
X-Rspamd-Queue-Id: 4c2LXB3dC4z9t9l
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

On 8/13/25 9:34 AM, Tomi Valkeinen wrote:

Hi,

>>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/
>>>>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>> index b3e57217ae63..cefa7e92b5b8 100644
>>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>> @@ -80,10 +80,7 @@
>>>>>     * PHY-Protocol Interface (PPI) Registers
>>>>>     */
>>>>>    #define PPISETR                0x700
>>>>> -#define PPISETR_DLEN_0            (0x1 << 0)
>>>>> -#define PPISETR_DLEN_1            (0x3 << 0)
>>>>> -#define PPISETR_DLEN_2            (0x7 << 0)
>>>>> -#define PPISETR_DLEN_3            (0xf << 0)
>>>>> +#define PPISETR_DLEN_MASK        (0xf << 0)
>>>>>    #define PPISETR_CLEN            BIT(8)
>>>>
>>>> Looks fine, but do you know what the TXSETR register does? It also has
>>>> LANECNT, but I don't see the driver touching that register at all.
>>>> TXSETR:LANECNT default value is 3 (4 lanes), which matches with the old
>>>> hardcoded behavior for PPISETR... So I wonder if that register should
>>>> also be set?
>>>
>>> Ah, never mind, I now saw the patch 3 =). But should it be before patch
>>> 2? Hmm, I guess that ordering is no better. Should they be combined into
>>> "support 1,2,3 datalanes" patch?
>> I think each patch fixes slighly different issue, even if the issues are
>> related. I tried to keep the issue description in each patch commit
>> message for posterity. I can squash them if you think that's better, I
>> don't mind either way.
> 
> I was thinking about this the user's or backporting point of view.
> Neither of the commits (clearly) say that they add support for 1/2/3
> lane modes.

The 1/2/3 lane mode was already implemented in the driver, except it was 
broken.

> You say they "fix", but they're not quite fixes either. The
> patch 3 could be considered a fix, but at the moment it just writes the
> default value to the register, so no point in marking it as a fix to be
> backported.

3/4 does write the DSI lane count into TXSETR , not the default value.

> So... I don't have a strong opinion, but I think a single patch that
> adds support to 1, 2,3 lanes makes most sense.

Lemme send a single patch with Fixes tag then. The combined patch does 
not look too great though.
