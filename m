Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2BD33259
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0748A10E8C4;
	Fri, 16 Jan 2026 15:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V0E6xz9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3CB10E8C6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768576932;
 bh=nMzG4VYsPxThyemGmauGTpz3/79R6uHQXsAVyIDCY68=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=V0E6xz9bBqQb0j5WBYTwr3DT1kb3tap53bVIQAYhjbhs3C6uXAfqno/ktp1Dw/IBf
 IjvqzclP4eyH1K3oLBvSMGDiFvXeB4OZqKl4sn5IdwrLjzmxsILUjI6lij215+FbEC
 ibHgQlRgvXCfkVIvHYx5Yl7ixIgXYMuVJM1FPjDedXrMM/3f4fXHiBA54tMw+Q9mES
 RJVFznGjlZ6dukcNpwA9jpF3iGrf6sEgcSh7Ow38uLn7/gKs7Au9p9rP5T3w7THdWE
 zRy3SVtUd6MfUCYiVd1st5X1HYSvzvVJa0Pyc2LQJdqj3tkwmJKqXn8EDrNOZYUEen
 9obLkDk8JeFYQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AD26817E0456;
 Fri, 16 Jan 2026 16:22:11 +0100 (CET)
Message-ID: <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
Date: Fri, 16 Jan 2026 17:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
 <2750b73.10b0.19ba61052c8.Coremail.andyshrk@163.com>
 <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
Content-Language: en-US
In-Reply-To: <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
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

On 1/10/26 11:58 AM, Cristian Ciocaltea wrote:
> Hi Andy,
> 
> On 1/10/26 6:00 AM, Andy Yan wrote:
>>
>>
>> Hello Cristian,
>> At 2025-12-20 05:47:01, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>>> The Rockchip VOP2 display controller allows configuring the background
>>> color of each video output port.
>>>
>>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>>> which defaults to solid black, make use of it when programming the
>>> hardware.
>>>
>>> Note the maximum precision allowed by the display controller is 10bpc,
>>> while the alpha component is not supported, hence ignored.
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>> 2 files changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> index 498df0ce4680..3a232d0d4acb 100644
>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc *crtc)
>>> 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>>> 	struct vop2 *vop2 = vp->vop2;
>>> 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>>> +	u64 bgcolor = crtc->state->background_color;
>>> 	u16 vtotal = mode->crtc_vtotal;
>>> 	u16 hdisplay = mode->crtc_hdisplay;
>>> 	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
>>> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc *crtc)
>>> 		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1, val);
>>> 	}
>>>
>>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
>>> +	/* Background color is programmed with 10 bits of precision */
>>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6);
>>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor) >> 6);
>>
>>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB(bgcolor) >> 6);
>>
>>
>> the bit31 of  RK3568_VP_DSP_BG  is bg_display_en， that means when we set a 
>> background color, we should set this bg_display_en bit.

I performed several tests on my ROCK 3A (RK3568), ROCK 4D (RK3576) and ROCK 5B
(RK3588) boards and noticed that by setting bg_display_en bit to 1 or 0 doesn't
have any influence on RK3568 and RK3576, the background color is always active
and cannot be disabled.

However, flipping the bit to 1 on RK3588 has the unexpected effect of covering
the whole screen with the configured color, even when there's an active plane
displayed on top. Switching back to 0 makes it work as expected.

Therefore I think we should keep this patch as is, unless there's something else
we're missing here.

>> The default value of this bit is 1, which explains why the patch currently works 
>> properly even though it doesn't set bit31.
> 
> For some reason, the RK3588 TRM indicates 0x0 for the reset value.  I assume
> that's a mistake, as RK3576 TRM shows 0x1.

Considering the observation above, it kinda makes sense now for RK3588 to
default to 0.

