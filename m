Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3EAE2A18
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 18:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF9010E2DA;
	Sat, 21 Jun 2025 16:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oskZNe05";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ArQN0kW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21AE10E2F7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 16:03:34 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bPfJr5Rbkz9t7q;
 Sat, 21 Jun 2025 18:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1750521804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzyJH1ntb+VLEfnIUWzQcRIuZ1D4PCyEOfdCS6emkzQ=;
 b=oskZNe05bcEy7P1+umE9dY2Tc+Lw4GX2Xi3/RSgjmnHB/xlt8uVF/CCSzZ3xauHok7mHfH
 AXp3aBaeprkPOnRgcSl+KTEAqtnTk2Ohp5xqaD036DKeuDTXnkB9qEf/wzDHndDx2VHC1y
 VbLBlW3efunTiFePewtPxoiA+J9TkWzElN4IOmC7Hru83kz+PgFyiH8T/l3J6ZB84KQ2nb
 ukZ6xyRDxj3N2vHZdRy9sOpkcuyPyVNXahBEX/bTRedt351Kg+V1xl8uO54/3JPDWClDq+
 Dob/aK6RtipoFEhIZHwB3Jvy8siZWzscifgzgG4EzwurFFJ03rTstLiPCwZfZA==
Message-ID: <32d302d6-b404-4814-9f17-fda5fe0d3391@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1750521802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzyJH1ntb+VLEfnIUWzQcRIuZ1D4PCyEOfdCS6emkzQ=;
 b=ArQN0kW0Ty9E+mG10hkk5kpnC1ZFqxARa2+iyA3aLdaHp3B2i3FYBsACd6VMKlUkiGkVa5
 Y/3cTHvTT16Lufp8xO6WDBrCeo84p9BhBMxYO/QfeSA6SBjiwm20LLh12SEIlWAEQfxEGK
 V6Jul7y2pi3rtpkqoM9m0ByijR0GiVov6auvtsurrdBguy3F/E8FO5rh2ul4Tqb5ScCBgM
 xpFSLMG3SvQMU+ARASG7o9nieQue8qcqjaWt36mCvD0BclES++N24Sw67BS2m2vX1Aumbe
 qVJyvNLCE3nfE4MhuFWeehOGjT1s9DBaAjXWvPoQnZB6J5A6gEwcX3ZLyxhByA==
Date: Sat, 21 Jun 2025 18:03:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
 <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
 <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
 <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org>
 <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
 <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: c6kef4io7w1tjt9rjehs4ujy6xiu4gg7
X-MBO-RS-ID: 8aaea9198d2fbf8141d
X-Rspamd-Queue-Id: 4bPfJr5Rbkz9t7q
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

On 6/16/25 6:26 PM, Neil Armstrong wrote:
> On 16/06/2025 18:05, Marek Vasut wrote:
>> On 6/16/25 1:45 PM, Neil Armstrong wrote:
>>> On 13/06/2025 12:54, Marek Vasut wrote:
>>>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>>>>> On 12/06/2025 01:49, Marek Vasut wrote:
>>>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>>>>> alignment gap between default_address_mode and lanes members.
>>>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>>>>> there is no chance this value can ever be larger than 4. No
>>>>>> functional change.
>>>>>
>>>>> The u8 will still take at least 4 bytes and cpu will still
>>>>> do at least a 32bit memory access, so there's no point to change
>>>>> it to u8.
>>>> Assuming this layout:
>>>>
>>>>    40 struct ili9881c_desc {
>>>>    41         const struct ili9881c_instr *init;
>>>>    42         const size_t init_length;
>>>>    43         const struct drm_display_mode *mode;
>>>>    44         const unsigned long mode_flags;
>>>>    45         u8 default_address_mode;
>>>>    46         u8 lanes;
>>>>    47 };
>>>>
>>>> I wrote a quick test:
>>>>
>>>> $ cat test.c
>>>> #include <stdio.h>
>>>> #include <stdint.h>
>>>>
>>>> struct foo {
>>>>      void *a;
>>>>      size_t b;
>>>>      void *c;
>>>>      unsigned long d;
>>>>
>>>>      uint8_t x;
>>>>      unsigned long y; // ~= lanes
>>>> };
>>>>
>>>> struct bar {
>>>>      void *a;
>>>>      size_t b;
>>>>      void *c;
>>>>      unsigned long d;
>>>>
>>>>      uint8_t x;
>>>>      uint8_t y; // ~= lanes
>>>> };
>>>>
>>>> int main(void)
>>>> {
>>>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>>>>      return 0;
>>>> }
>>>>
>>>> With which I get these results on x86-64:
>>>>
>>>> $ gcc -o test test.c && ./test
>>>> 48 40
>>>>
>>>> And on x86 32bit:
>>>>
>>>> $ i686-linux-gnu-gcc -o test test.c && ./test
>>>> 24 20
>>>>
>>>> Maybe there is some improvement ?
>>>
>>> Try again with code size included, and other archs since 99% of the 
>>> users would be an arm/riscv based boards.
>> Doesn't that mean, that one some systems it wins us a bit of memory 
>> utilization improvement, and on other systems it has no impact ?
> 
> 4 or 8 bytes less in a dynamically allocated struct which is by default 
> aligned
> on 64 bytes by default on x86, 128 on aarch64, 32/64/128 on arm32, 64 on 
> riscv, sorry this is negligible.
It is still not zero, so why tolerate the inefficiency when it can be 
improved ?

Is this change rejected ?
