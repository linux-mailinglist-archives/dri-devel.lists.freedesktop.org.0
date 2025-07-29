Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540CAB15059
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 17:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62B310E653;
	Tue, 29 Jul 2025 15:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="iZQ1tSWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D00B10E034
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 15:44:06 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 9266420231;
 Tue, 29 Jul 2025 17:44:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVLsDY5o5ZQS; Tue, 29 Jul 2025 17:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1753803843; bh=S3+XNf1yB0GDaxhHAShTKUqmAkpZEnuxO7naqLjaIp0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=iZQ1tSWYX5L6Yo1i6M+b1Tm3/khKQdTTo1AkT+gqo0UvP8q0D0/XAKFELWuBZ0A5U
 cxunVuSc1jFRgl7lTjZA4lHi0ebzENkCXF4zD5BNTtL5rY/xm8yGg4fL4WHIFwTt1/
 4PYG0blQXlUpcNA5bR6tVoEGTizlXc02GI5ISZ8NurKzjobaBO65D5gJfgJARGOaKD
 E0AO5fEbhDT3Tur00p7H74RwpQohy3iSWq0jGqbS9Ph82/Bz3QG/Q4PtbpnW96pNP+
 ZQDHwPJuy38mM3y999pZDeU36pa/Pd4Gvz3c0Xu6FpB7Nw7BvEmTIbLG3IDymWrVAC
 8gmGiZmTNo/nQ==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 15:44:03 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
In-Reply-To: <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
 <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
Message-ID: <b732d2588112932ab399df47fb58e3f5@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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

On 2025-07-29 05:44, Inki Dae wrote:
> 2025년 7월 7일 (월) 오전 3:28, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> Exynos7870's DSIM requires more time to stabilize its PLL. The current
>> timeout value, 1000, doesn't suffice. Increase the value to 3000, 
>> which
>> is just about enough as observed experimentally.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 
>> fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9..4b49707730db76aa8fd3ab973b02507436750889 
>> 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -755,7 +755,7 @@ static unsigned long samsung_dsim_set_pll(struct 
>> samsung_dsim *dsi,
>> 
>>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>> 
>> -       timeout = 1000;
>> +       timeout = 3000;
> 
> Relying on an implicit loop to wait for PLL stabilization is not an
> ideal solution.
> According to the datasheet, this can be addressed more explicitly by
> using the DSIM_PLLTMR (PLL timer) register instead.
> 
> By configuring the pll timer field in DSIM_PLLTMR appropriately, we
> can avoid arbitrary loops.
> For example according to data sheet:
> If the APB clock is 80 MHz and the desired delay is 20 µs,
> the pll timer field should be set to:
> delay_time * apb_clock = 20 * 80 = 1600 (0x3E80)
> 
> Once this value is set and the MskPllStable field in the DSIM_INTMSK
> register is unmasked,
> the pll_stable field in the DSIM_INTSRC register will be set after the
> specified delay (20 µs in this example).
> We can then check this field to determine whether the PLL has 
> stabilized.
> 
> While the current patch relies on an implicit method, I’m fine with
> merging it as-is for now.
> However, since this patch series likely has sufficient time to
> mainline, I believe this is a good opportunity to improve the related
> logic.
> 
> Would you be open to trying the approach described above?

Interesting. I will try implementing it sometime in the near future.
(can't commit to it at the moment, preoccupied)

> 
> Thanks,
> Inki Dae
> 
>>         do {
>>                 if (timeout-- == 0) {
>>                         dev_err(dsi->dev, "PLL failed to 
>> stabilize\n");
>> 
>> --
>> 2.49.0
>> 
>> 
