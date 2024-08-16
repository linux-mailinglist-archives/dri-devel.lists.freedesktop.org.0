Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9936955966
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 21:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2493510E0E5;
	Sat, 17 Aug 2024 19:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="E0bkcHva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40510E841
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 20:24:03 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Wltk76Mlqz9smd;
 Fri, 16 Aug 2024 22:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1723839839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2a5uwxoWmK4hGq387/Bj9tHFW7u7XNQSFK7pAHa9AI=;
 b=E0bkcHvajiOa+ioQ9d6R959bOkg5yCiLLrj9cjdg22FWipTMe/cDKtzPFs0GeP26UVcMgX
 ziqA8k/nCKxqCXVYu+rc39h9GqoEmH9UOWiL4bL8Oo0TcWCHyafPo1RdhHlGRiTNZwQlSr
 SFAkQqhX24A8N1xSK6VhLU4h6RQQjSPjfQTPYdB6PUxPnczeMTTFNN3HVHJy6y8pgGUjH1
 mppCFhVBQ2AX6Fes1RKvRKiHE04DD6YiQ7mdZ8DqeAuBQg0EAtIpW5hp1X2qTOalhv/Rhf
 Tpf67i9nUlR7y9LUS19Y0HhIxQKtpbkCZ9c4s0T7BqFTCxEvLZjE3mLbW9X0wg==
Message-ID: <e345252b-9370-4491-ac5d-d2dbe1005451@mailbox.org>
Date: Fri, 16 Aug 2024 22:23:54 +0200
MIME-Version: 1.0
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, christian@heusel.eu,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com,
 rdkehn@gmail.com, regressions@lists.linux.dev, spender@grsecurity.net
References: <CABQX2QM09V=+G=9T6Ax8Ad3F85hU0Cg4WqD82hTN=yhktXNDaQ@mail.gmail.com>
 <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
 <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
Content-Language: en-US
From: Andreas Piesk <a.piesk@mailbox.org>
In-Reply-To: <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jjckur8ysfr994hsbwpexesbwirt7yay
X-MBO-RS-ID: 970057b013337eca572
X-Mailman-Approved-At: Sat, 17 Aug 2024 19:28:20 +0000
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

Am 16.08.24 um 20:56 schrieb Zack Rusin:
> 
> Thanks! I see. I have a patch out that fixes it, but in general I
> think those vm's with 16mb for graphics are very risky and I'd suggest
> bumping them to at least 32mb. The vram portion can stay at 16mb, but
> the graphicsMemoryKB can be safely set to fourth or even half of
> memsize (in your config 256mb or even 512mb), which will make the vm's
> a lot safer and allow actual ui usage because with console being
> pinned we just don't have a lot of wiggle room otherwise and we just
> can't migrate pinned framebuffers.
> The patch that "regressed" this makes dumb buffers surface that
> actually respect pinning, but as long as you don't have gpu host side
> things will be ok. Otherwise we can't make a config with 16mb of
> available graphics memory and graphics acceleration work.

Thanks for the looking into it and fixing it.
The explanation with details is much appreciated and I will keep your suggestions in mind.
I just used the VMware defaults for Linux 6.x+ in ESXi 8, maybe they should be bumped up a little bit.

Best,
-ap

