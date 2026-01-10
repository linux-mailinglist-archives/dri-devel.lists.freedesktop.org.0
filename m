Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA571D0D45F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 10:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1070A10E023;
	Sat, 10 Jan 2026 09:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jMo9mU0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A810E023
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768039090;
 bh=UVASJL81PowX/kBILLs/GepNKULzc3OT5vcMjYhxSzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jMo9mU0zqWVb95Hbt7Oa3iM2pMSIjazU7WDi0tpFLuPQZha76KQXD/V5PbebaXSXD
 LQbFoFQO0+yE+YrMxBaUZ9kvDQOP+S6rEcbmfwm36R6TnP97/v3H+72Lpg8i2B0Qjs
 jgpuhdES3o95D+yfdkBxykdLT09nnpKwcP6wZ6796NrMfibM9LIHL1nXzxP75rJDT5
 YQqOMbjm84PR3Vc9wW4/rgx5ybU7nFF2VSgXzpywUUCDOcm6GJ69yKqJATMl+hgMg2
 oIDhC15CHF/uuwvdrDoY3kDxAkJdEkEeX65Q08HpMKkT6HIEhUgPLgKc9RFZL5PTr9
 ckY76nUwXjpGw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 754FB17E0CB0;
 Sat, 10 Jan 2026 10:58:09 +0100 (CET)
Message-ID: <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
Date: Sat, 10 Jan 2026 11:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2750b73.10b0.19ba61052c8.Coremail.andyshrk@163.com>
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

On 1/10/26 6:00 AM, Andy Yan wrote:
> 
> 
> Hello Cristian,
> At 2025-12-20 05:47:01, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> The Rockchip VOP2 display controller allows configuring the background
>> color of each video output port.
>>
>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>> which defaults to solid black, make use of it when programming the
>> hardware.
>>
>> Note the maximum precision allowed by the display controller is 10bpc,
>> while the alpha component is not supported, hence ignored.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>> 2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 498df0ce4680..3a232d0d4acb 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc *crtc)
>> 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>> 	struct vop2 *vop2 = vp->vop2;
>> 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>> +	u64 bgcolor = crtc->state->background_color;
>> 	u16 vtotal = mode->crtc_vtotal;
>> 	u16 hdisplay = mode->crtc_hdisplay;
>> 	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
>> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc *crtc)
>> 		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1, val);
>> 	}
>>
>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
>> +	/* Background color is programmed with 10 bits of precision */
>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor) >> 6);
> 
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB(bgcolor) >> 6);
> 
> 
> the bit31 of  RK3568_VP_DSP_BG  is bg_display_en， that means when we set a 
> background color, we should set this bg_display_en bit.

Oh yes, good catch!

> The default value of this bit is 1, which explains why the patch currently works 
> properly even though it doesn't set bit31.

For some reason, the RK3588 TRM indicates 0x0 for the reset value.  I assume
that's a mistake, as RK3576 TRM shows 0x1.

Thanks,
Cristian
