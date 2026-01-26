Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Me5AwS4d2nKkQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:52:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74F8C39E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16B110E465;
	Mon, 26 Jan 2026 18:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iKRb7ZDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D32510E465
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769453565;
 bh=h8IB/J037qzfODb/AKC4Cviqt5GuYeUYBXKiOfbv9X8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iKRb7ZDXk27k1R3CpuO6ivYT4IXiFvBbnWpQX+Ad12rE11s4qMSHr1Vb6PEIQA3hK
 SZO8+hUnkff/ndlJuoXtxPlZQvHW/3MIoo3891YyT70Py833ryXyh1358QOc8S03Te
 occ+5JoSA/YQFwAJEvR3G/Cq/wBRQLRzKVkAuCLVrba6qmXSWlX+bYr2fS2T0OBE3e
 v7Kn+usA8ImRxqXhe729EE5WIKH27QepcHrXH6SnViIv6HInNoOVt04WICvw3E2BGy
 joPCGnCh8m0hw9+moQ4lVIr4pPzcQYJCKyb5IAhIZ9e3hQSYYr+3cRf+sFgFNhM79H
 B6ZxqyoQfOnqA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D3F17E0342;
 Mon, 26 Jan 2026 19:52:45 +0100 (CET)
Message-ID: <6de0071f-a442-44b3-9ba2-13271cb1f246@collabora.com>
Date: Mon, 26 Jan 2026 20:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
 <d85cf4b299e929770a1b7f5be7ae61d76306e7d1.camel@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <d85cf4b299e929770a1b7f5be7ae61d76306e7d1.camel@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nfraprado@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 6E74F8C39E
X-Rspamd-Action: no action

Hi Nícolas,

On 1/26/26 8:30 PM, Nícolas F. R. A. Prado wrote:
> On Fri, 2025-12-19 at 23:47 +0200, Cristian Ciocaltea wrote:
>> The Rockchip VOP2 display controller allows configuring the
>> background
>> color of each video output port.
>>
>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>> which defaults to solid black, make use of it when programming the
>> hardware.
>>
>> Note the maximum precision allowed by the display controller is
>> 10bpc,
>> while the alpha component is not supported, hence ignored.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>  2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 498df0ce4680..3a232d0d4acb 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc
>> *crtc)
>>  	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>>  	struct vop2 *vop2 = vp->vop2;
>>  	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>> +	u64 bgcolor = crtc->state->background_color;
>>  	u16 vtotal = mode->crtc_vtotal;
>>  	u16 hdisplay = mode->crtc_hdisplay;
>>  	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
>> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc
>> *crtc)
>>  		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1,
>> val);
>>  	}
>>  
>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
>> +	/* Background color is programmed with 10 bits of precision
>> */
>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED,
>> DRM_ARGB64_GETR(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN,
>> DRM_ARGB64_GETG(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE,
>> DRM_ARGB64_GETB(bgcolor) >> 6);
> 
> Why aren't the DRM_ARGB64_GET*_BPC() helpers used here to get the
> values with a custom precision?

That's for performance reasons, please see "Changes in v4" section in the cover
letter.  I should have probably added a comment here (noted for v5).

Thanks for the review!

Regards,
Cristian 
