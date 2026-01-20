Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJzNKgKub2k7GgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F147993
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB62110E5DE;
	Tue, 20 Jan 2026 12:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="P5yMkq8K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bpi4Eyq2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SlwMQumc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CQyBSX4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B238110E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:52:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5E6FC5BCC3;
 Tue, 20 Jan 2026 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768913552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
 b=P5yMkq8K3xAVbBVI4bWeEHk+nF7HFwHCIHdoBHL5OCZtM4zLmsitrPcoMCNhL06AoLyZn6
 OxJF0TNWLzjvBtfptB/oYpDInMn0mNFlhaK3PNawxmECboS0R0oJ2aE0ZcGOpxnfBJd7r0
 hSgRi2Pg/VKSUcSOcZVh/OL0fHUYIzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768913552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
 b=Bpi4Eyq2eHGByTg1r9V8H0GbIRWGjNpvsNO8bu6yOq3u0b0xJ3qFr4X/9OEda7ZHEydq8e
 QcShn3sp7lWenQDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768913551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
 b=SlwMQumc/WUECMGZTW8FgUO4fbUBxO0UTTHQFH6oQTM1Gm12JdgLd3E4RM3Lnq9I0x9E1p
 J1pHw+YBzt5h/blo3YocWn7+oj0hL5fN7r57zPZ3SCHyQSVwQTfOqgPIITFa6250Ntk9e0
 WFLHkopyW8U4oSUPzmxSVwBgdKbOcqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768913551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
 b=CQyBSX4m+bg0expyQM1xEj2Mbft+3Vby7tOWmLQYEuRgOEEfioX0aY9jKWr+UECFvN/FN8
 sUUpREyE2U7+wqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02D113EA63;
 Tue, 20 Jan 2026 12:52:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id alxvOY56b2kGfgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jan 2026 12:52:30 +0000
Message-ID: <956a5ead-cc3b-41de-8431-2f03aaee3c71@suse.de>
Date: Tue, 20 Jan 2026 13:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <20251206-vop2-atomic-fixups-v2-2-7fb45bbfbebd@collabora.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20251206-vop2-atomic-fixups-v2-2-7fb45bbfbebd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:daniels@collabora.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,rock-chips.com,sntech.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,suse.com:url,suse.de:mid,suse.de:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 164F147993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

Am 06.12.25 um 21:45 schrieb Nicolas Frattaroli:
> From: Daniel Stone <daniels@collabora.com>
>
> We already clip the plane to the display bounds in atomic_check, and
> ensure that it is sufficiently sized. Instead of trying to catch this
> and adjust for it in atomic_update, just assert that atomic_check has
> done its job.
>
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 29 +++++++++-------------------
>   1 file changed, 9 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 20b49209ddcd..81b3eba07095 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1214,28 +1214,17 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>   	src_w = drm_rect_width(src) >> 16;
>   	src_h = drm_rect_height(src) >> 16;
>   	dsp_w = drm_rect_width(dest);
> -
> -	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
> -		dsp_w = adjusted_mode->hdisplay - dest->x1;
> -		if (dsp_w < 4)
> -			dsp_w = 4;
> -		src_w = dsp_w * src_w / drm_rect_width(dest);
> -	}
> -
>   	dsp_h = drm_rect_height(dest);
>   
> -	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
> -		dsp_h = adjusted_mode->vdisplay - dest->y1;
> -		if (dsp_h < 4)
> -			dsp_h = 4;
> -		src_h = dsp_h * src_h / drm_rect_height(dest);
> -	}
> +	/* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
> +	 * us, which keeps our planes bounded within the CRTC active area
> +	 */
> +	WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay);
> +	WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay);
> +	WARN_ON(dsp_w < 4);
> +	WARN_ON(dsp_h < 4);
> +	WARN_ON(src_w < 4);
> +	WARN_ON(src_h < 4);

This should also use drm_WARN_ON().  But maybe rather leave it out 
entirely? I don't remember having seen other drivers to re-test in 
atomic_update.

Best regards
Thomas


>   
>   	/*
>   	 * This is workaround solution for IC design:
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


