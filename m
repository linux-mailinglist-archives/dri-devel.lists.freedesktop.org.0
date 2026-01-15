Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD1D222E6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 03:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293AD10E070;
	Thu, 15 Jan 2026 02:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Mt5MVZ8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AAE10E070
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:47:43 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ds6ph1n1qz9tR9;
 Thu, 15 Jan 2026 03:47:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768445260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80JGlExrtvjtNMYhQZr3+IVGfbgWQXnBe/kFnPwN3mY=;
 b=Mt5MVZ8rffif9xZf8CPJK1n5PgSiCMnxyofEvQIJtavtvNL/vFeotEO7xX55HmFD+B52VQ
 S7YOAX26FFWcHKNeKny2O+uqn7sJBNbUVIjyNADlA9rWMGOVkhHMEy1GdMBDC5k5fu/SBr
 CaSgjE11wKl3I3ZmppxvXfybDhwd9img7m2TED4KaLP8cLLCpzJ3X/QIB4WnFcVk9jN7tw
 M2UT+pvk1RiOIxtfW/SBdj2xJ/oXQ2knoISjvmrvcvmMrjXne1NNmxdhKiBo4RgHNBKDi7
 a2fcGW5Geva/k+NFyZ8G33MeM7KtsXESs9Gakm4oTcYN2LW/aTgSl2qD+lMErQ==
Message-ID: <0b029410-d960-42a8-9d2a-e731234598fe@mailbox.org>
Date: Thu, 15 Jan 2026 03:47:35 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI
 data lanes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Joseph Guo <qijian.guo@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
 <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUJBKnqU_HtF1KpZY-75iTWjZwedLbFSYLpgDfVHGsW1g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUJBKnqU_HtF1KpZY-75iTWjZwedLbFSYLpgDfVHGsW1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: sgar6do66mkip7ahr4a67x6pamtme99x
X-MBO-RS-ID: af6e9444839cb156e47
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

On 1/14/26 10:32 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
>> @@ -66,7 +66,11 @@ static int ws_bridge_attach_dsi(struct ws_bridge *ws)
>>          dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
>>                            MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>          dsi->format = MIPI_DSI_FMT_RGB888;
>> -       dsi->lanes = 2;
>> +       dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
>> +       if (dsi->lanes < 0) {
>> +               dev_warn(dev, "Invalid DSI lane count %d, falling back to 2 lanes\n", dsi->lanes);
> 
> "Invalid or missing"?

Fixed in V2

> BTW, I doubt the kerneldoc for drm_of_get_data_lanes_count_ep()
> is correct:
Nice find, fixed in

[PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return value 
documentation

Thanks !
