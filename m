Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B0B0D1BC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 08:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6A610E083;
	Tue, 22 Jul 2025 06:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oNLRZH83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0C210E083
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753164987;
 bh=hQmYNw1nxxnjx5AEwNuBdEzfygugW6y3m3bQETQLK1A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oNLRZH830rm/on4tkN3zXpzMq0pa4V7HFVCHhV+cb5mNxE5g84KOmLHpDLkzEroQX
 +olYVd9AZj6OIj+GO5ETwk/R34sIhslu+G57OM03t1nOL4FIYTKo0UxIrVh4PrxeT8
 5426rc6mK3G1PE+4HLHi5RLL7W9+LKjuSxWeBWpYZsIRJ6o1sP0o1po2+55EhCfpro
 ymeA9lxg/w4n9gglwocZs6bqKz+dY7pk4cukbRtX5cQnycKHinZEvr+JqbAqXJnaQ2
 tQY9xoK//oO9DHgu9nonm6PRg2fCxhuGqKiBG9Lwsgi/Q7WnXyCHD31Mn/fkFxi017
 bkSfPZ1/PoXvg==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BB2AC17E0F66;
 Tue, 22 Jul 2025 08:16:26 +0200 (CEST)
Message-ID: <c5624dad-93cb-4cc3-88ad-808dcc43274d@collabora.com>
Date: Tue, 22 Jul 2025 09:16:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/rockchip: vop2: Add high color depth support
To: Andy Yan <andyshrk@163.com>, Algea Cao <algea.cao@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
 <20250721-rk3588-10bpc-v1-1-e95a4abcf482@collabora.com>
 <3ceb2c70.2145.1982ff28b9c.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3ceb2c70.2145.1982ff28b9c.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Andy,

On 7/22/25 5:24 AM, Andy Yan wrote:
> 
> Hello Cristian，
> 
> At 2025-07-22 01:39:04, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> Take the bits per color channel into consideration when computing DCLK
>> rate.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 186f6452a7d359f079662bc580850929632ea8fe..a714bcbb02de16267e7febbaeb1eb270c70aaef2 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1731,6 +1731,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>> 		clock *= 2;
>> 	}
>>
>> +	if (vcstate->output_bpc > 8)
>> +		clock = DIV_ROUND_CLOSEST(clock * vcstate->output_bpc, 8);
> 
> 
> This seems not right,  regardless of the value of bpc, the dclk of VOP must be
> consistent with mode->crtc_clock.
> If the dclk of VOP is increased in accordance with the BPC ratio here, then the refresh rate of VOP will also increase proportionally.
> This would be inconsistent with the timing described in the mode.
> For a hight color depth,  the frequency needs to be increased for the HDMI PHY's clock.

The HDMI PHY's clock is actually computed at HDMI connector framework level
[1], taking into account the current bpc value, which is determined as part
of hdmi_compute_config() [2].

That means conn_state->hdmi.tmds_char_rate in
dw_hdmi_qp_rockchip_encoder_atomic_check() does already include the bpc
related adjustment, and we pass that directly to the PHY via
phy_configure().  Note there's still the need to handle bpc separately via
phy_configure_opts in order to setup CMN_REG(0086) [3].

Since VOP2 switches to PHY PLL as DCLK source for modes up to 4K@60Hz, it
needs to take color depth into account, to keep them in sync.  As a matter
of fact, the clock adjustment in VOP2 is mainly necessary for legacy
reasons, since HDPTX PHY allowed changing TMDS char rate via the Common
Clock Framework API.  We landed a proper solution for that via the HDMI PHY
API, hence the plan would be to make CCF API readonly after the switch to
PHY API is completed, which means VOP2 shouldn't deal anymore with clock
calculations when using the PHY PLL as DCLK source.

Regardless, I should probably move this clock adjustment to the conditional
block handling DCLK source switch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/display/drm_hdmi_state_helper.c?h=v6.16-rc7#n525
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/display/drm_hdmi_state_helper.c?h=v6.16-rc7#n608
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c?h=v6.16-rc7#n1034
