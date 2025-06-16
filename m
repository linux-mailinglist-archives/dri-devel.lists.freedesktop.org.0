Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9CDADB61C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724F010E345;
	Mon, 16 Jun 2025 16:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="NEGfm5OI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wiv79ZhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6086E10E345
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 16:05:32 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bLZbZ1X6Cz9tZT;
 Mon, 16 Jun 2025 18:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1750089930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUyKn+KNUkQsExEifEck7guNUldalSigDR2Ao58orTk=;
 b=NEGfm5OIWtpYvf2lCnLXIDqrsQUAawHzxNq0rjjuIV/96LEaw5AJEktYyk3+tBvitSM/yc
 5aDJrDzOZeAx386XsMiSTCfSmU8CyAZGddXbYPvM+ZpxgPWVQzbclAIb2fprJQByFsmPx5
 IuvQHCn5xs72tQUCQQxG939fzp20gqSTK8cJxGQeH2wnw+gWsZj6PE0f2hiblXKBfMxWgm
 WYqv+cMZulxcmpektkSYFBsd1YH25cgbpjnJqkf8ol6aB8Io6Bkyf9LbhPdoVh/9y2pWX8
 QA9tL4K/cJVlClQItLIwK/8c9dD/Wtqn9L5cV7XQ1h7E2ieQhJ5+JxZELnur1w==
Message-ID: <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1750089928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUyKn+KNUkQsExEifEck7guNUldalSigDR2Ao58orTk=;
 b=wiv79ZhWmZTqxkJVt2kC7Mzxws0LvgFVPjzcRdMIO+e/hrv4IKpfv4RBc9mBwkHIAA7cqK
 8ekxsppOELlHLLwmZhEJ7aJNZxCxolXF+xXm6ImwkywXIP4bILO9Nof9/MtVlX9ddR0DKV
 QCCG+WIkwT6NxJVIwWuSCpZaIFYtVZDda8Tc2vQ0DEAmCRP8zRIhcVtowBfeT9GyIu/niR
 O+5sHwx3N4+ZHOtvCU9/FLnG87Udk2vg+nxVsVgOT2IVPezWfi7Gvu1RQl9Ek8fcQT+wYZ
 wcFI5MeGQE2G0YXLj3PKOD2tc1aYW4Q6eKHFDHdNntVcIOZ3G45cZMPjw5bQow==
Date: Mon, 16 Jun 2025 18:05:25 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ymmzxqrt38hfyau94duu1s7y3efjq78n
X-MBO-RS-ID: be874eff82ee2f5c952
X-Rspamd-Queue-Id: 4bLZbZ1X6Cz9tZT
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

On 6/16/25 1:45 PM, Neil Armstrong wrote:
> On 13/06/2025 12:54, Marek Vasut wrote:
>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>>> On 12/06/2025 01:49, Marek Vasut wrote:
>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>>> alignment gap between default_address_mode and lanes members.
>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>>> there is no chance this value can ever be larger than 4. No
>>>> functional change.
>>>
>>> The u8 will still take at least 4 bytes and cpu will still
>>> do at least a 32bit memory access, so there's no point to change
>>> it to u8.
>> Assuming this layout:
>>
>>    40 struct ili9881c_desc {
>>    41         const struct ili9881c_instr *init;
>>    42         const size_t init_length;
>>    43         const struct drm_display_mode *mode;
>>    44         const unsigned long mode_flags;
>>    45         u8 default_address_mode;
>>    46         u8 lanes;
>>    47 };
>>
>> I wrote a quick test:
>>
>> $ cat test.c
>> #include <stdio.h>
>> #include <stdint.h>
>>
>> struct foo {
>>      void *a;
>>      size_t b;
>>      void *c;
>>      unsigned long d;
>>
>>      uint8_t x;
>>      unsigned long y; // ~= lanes
>> };
>>
>> struct bar {
>>      void *a;
>>      size_t b;
>>      void *c;
>>      unsigned long d;
>>
>>      uint8_t x;
>>      uint8_t y; // ~= lanes
>> };
>>
>> int main(void)
>> {
>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>>      return 0;
>> }
>>
>> With which I get these results on x86-64:
>>
>> $ gcc -o test test.c && ./test
>> 48 40
>>
>> And on x86 32bit:
>>
>> $ i686-linux-gnu-gcc -o test test.c && ./test
>> 24 20
>>
>> Maybe there is some improvement ?
> 
> Try again with code size included, and other archs since 99% of the 
> users would be an arm/riscv based boards.
Doesn't that mean, that one some systems it wins us a bit of memory 
utilization improvement, and on other systems it has no impact ?
