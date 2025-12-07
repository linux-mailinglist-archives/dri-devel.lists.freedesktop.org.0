Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A316CABA3C
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 22:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4A110E17A;
	Sun,  7 Dec 2025 21:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pdUqK692";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42AF10E17A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765144188;
 bh=lGSQe1hNsxMo5+ScV6iLISXRl05Eazg/0vp+AcPBWAU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=pdUqK692dyAKExY3DbNbaZvv7Pm2+t+AqoZEq0PA/mClXJcL3QQzTNkQB2HtzbfcH
 sTa/vsNpxrYRPCg9gqsvnLBvP1UysBAhngjHkP5buh9AWHSf+9OQv15xQdmzxDHvDj
 k2C/LifvtXqkkgugseDbwVBPaY6XIegQSfiRJ1LU0reaA874SCeg1G1j4y2cNXssDZ
 osMzxiu7UjTtMMY+7y0V+ZI59Dmste15jlvC2I2xVbJEUZvC0d/XI8UHm0aP+8jvFF
 hld1ijpqHtkd7ebQO2pBrJUZUl/2fLO298anicdYQ03Vm40e6kTlt0f8AftfWh4RGD
 I2fdeHtihzeeQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BA34F17E1146;
 Sun,  7 Dec 2025 22:49:47 +0100 (CET)
Message-ID: <156efe34-93f6-4055-864c-29706088e63c@collabora.com>
Date: Sun, 7 Dec 2025 23:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add HDMI 2.0 support to DW HDMI QP TX
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
Content-Language: en-US
In-Reply-To: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/3/25 8:27 PM, Cristian Ciocaltea wrote:
> This patch series provides the missing support for high TMDS clock ratio
> and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
> display modes on RK3576 & RK3588 SoCs.

Please also try the following PHY patch if you encounter issues while testing
1080p@120Hz with 10-bit RGB:

https://lore.kernel.org/all/20251204-phy-hdptx-pll-fix-v1-1-d94fd6cfd59b@collabora.com/
