Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DDD3C46E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49CA10E5A5;
	Tue, 20 Jan 2026 10:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Qtk1k5b3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82A910E194
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:01:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dwNBs6cMWz9v0b;
 Tue, 20 Jan 2026 11:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768903286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKfE1HagS5zYjDz3V0NjsZ5zkfW7JXAOUyzpd++NnY0=;
 b=Qtk1k5b3KnAA/8INIZcES60MabXbu9GWnCj/bVKXTNIirJsxIc45R410nnkxcaLDY7tX2m
 msBx5XbN89BWIx/G6asUqmGSSBqY1mSDlrQGaVRzH84L3Oxey29PyBLEDa2ZPKFsAOKwCg
 MOr1yDiYmpApX6mM2kN2Em90o3JLHjIp/EbBq9O3I/vwfsi9hUd4WnFkaYfRQNeP52RewL
 ZeUzu/IN/DLT3yEL1r4hpyyGBnVUgI8tzonScZTQD6V0Xx0YuhBqUMA5Ujv1WBnu4GWPVB
 O2l8hldV0T//t4VSO9ziqm/v9zAUwjMKBYDPKJeBLqQN3UhLndh9iYbO1VPWlA==
Message-ID: <4db9e78d-ec91-4ff1-a395-cdd2d08225bd@mailbox.org>
Date: Tue, 20 Jan 2026 11:01:21 +0100
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
 <926a0b23-5159-4f4e-b278-b545ae281410@mailbox.org>
 <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: esnahd1odebpirxkdfyrm89nieiddxnx
X-MBO-RS-ID: f259ff1c79d53f602e1
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

On 1/20/26 10:33 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>> That looks like the plain standard 60Hz Full HD mode.
>>> Is there really no other copy of that structure available in the kernel?
>>>
>>> auo_t215hvn01_mode is almost the same, except for .clock and .flags.
>>> drivers/video/fbdev/core/modedb.c has the same mode, but in a different
>>> structure.
>>
>> The panel-simple.c is full of similar-ish panel timings . The timings
>> above are adapted from the waveshare DTO for this panel. What else would
>> you suggest I do/use for this device ?
> 
> I am just wondering if there is a better way for panels that use
> standard timings.

I sent a support request to waveshare to get hw details, but I am not 
holding my breath.

I don't think this panel should use standard timings in the first place, 
it should use timings which match the panel, but those are unknown, 
because the content of the metal case is unknown. For now, the timings 
come from the waveshare DTO, which only by coincidence matches the 
standard timings, but that may have to be updated in the future, at 
which point the use of standard timings would have to be removed anyway.

I don't think we should press for standard timings for this particular 
panel. For other panels, the timings come from their EDID/DPCD/... so 
that is already a solved problem.
