Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJUVNeFqqWnH7AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:37:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE9210A88
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C2310E1F2;
	Thu,  5 Mar 2026 11:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="a6rSGJCC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B5Gf7Jie";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGZL1j4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TXDx58x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C60610E1F2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 11:37:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0A0D3F802;
 Thu,  5 Mar 2026 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772710620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bwST3sE+5H9nFGA0DwHvdBkskZ7KEGkiTel0eGW0mSM=;
 b=a6rSGJCC/ma4+NrEltmT5DmRp4GcL8G5uGBLKUzaTuJAJsC1rR8eIoqEZ1tCyBHBOsblYm
 SqKkGT75hBlhsnftpxufP5g0EA7GQISQl312MbatK2+Ad2+rMTnhyJ6GCKcvGrPmGA6KxG
 IlIj/sTzD0UqajbUnZrxjU2hyJu+S0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772710620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bwST3sE+5H9nFGA0DwHvdBkskZ7KEGkiTel0eGW0mSM=;
 b=B5Gf7JieDcvOtvA0fLisSnDvRn/8A1Tt3hOtYOvesZrDyK+xna6FLsIGr2vMl0UgE81Xy6
 dj9LOlmBWgwPUACw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772710619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bwST3sE+5H9nFGA0DwHvdBkskZ7KEGkiTel0eGW0mSM=;
 b=DGZL1j4sclRr/NYk6ia80LBuZqbZgkVuvY99/atdpTpz/4WWmpVSV+hYVB71/75DiKTip5
 THM3U67zUzdGnXLrzZ9KphjJuTSjoRdHRTa+hsvIUZBEE5OlVgJRnyCaqtBEIemglZT+AI
 0uJRSPwAba9U03+DlieeVkn1qfgaWdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772710619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bwST3sE+5H9nFGA0DwHvdBkskZ7KEGkiTel0eGW0mSM=;
 b=TXDx58x7oDTOPbJS4WaehQLWTwVs/l7gq+yOpxiwBoNHZHA5rbQfBy03hW4IqRvpX2/Zzz
 bPFXxhE99WicAZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAA073EA68;
 Thu,  5 Mar 2026 11:36:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OIYlLNtqqWkzOgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Mar 2026 11:36:59 +0000
Message-ID: <adb00ce3-1959-44d1-b41f-34d04f15e51e@suse.de>
Date: Thu, 5 Mar 2026 12:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v2 3/3] drm: verisilicon: fill plane's
 vs_format in atomic_check
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
References: <20260305075926.3642501-1-zhengxingda@iscas.ac.cn>
 <20260305080947.3656864-1-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20260305080947.3656864-1-zhengxingda@iscas.ac.cn>
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
X-Rspamd-Queue-Id: 40BE9210A88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.com:url,suse.de:dkim,suse.de:mid,iscas.ac.cn:email]
X-Rspamd-Action: no action

Hi

Am 05.03.26 um 09:09 schrieb Icenowy Zheng:
> Move the conversion from drm_format to vs_format to atomic_check, which
> is before the point of no return and can properly bail out.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v2:
> - Add non-NULL check for drm_plane_state->fb.
>
>   drivers/gpu/drm/verisilicon/vs_plane.h        |  2 ++
>   .../gpu/drm/verisilicon/vs_primary_plane.c    | 21 ++++++++++++-------
>   2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
> index 12848a72af576..df4b248b52954 100644
> --- a/drivers/gpu/drm/verisilicon/vs_plane.h
> +++ b/drivers/gpu/drm/verisilicon/vs_plane.h
> @@ -65,6 +65,8 @@ struct vs_format {
>   
>   struct vs_plane_state {
>   	struct drm_plane_state base;
> +
> +	struct vs_format format;

In case you implement my comment about kzalloc vs kmemdup, don't forget 
to assign it in the plane-duplicate helper.

>   };
>   
>   static inline struct vs_plane_state *state_to_vs_plane_state(struct drm_plane_state *state)
> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> index bad0bc5e3242d..ca41c8053ae12 100644
> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> @@ -25,12 +25,20 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
>   {
>   	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>   										 plane);
> +	struct vs_plane_state *new_vs_plane_state = state_to_vs_plane_state(new_plane_state);
>   	struct drm_crtc *crtc = new_plane_state->crtc;
> +	struct drm_framebuffer *fb = new_plane_state->fb;
>   	struct drm_crtc_state *crtc_state;
> +	int ret;
>   
> -	if (!crtc)
> +	if (!crtc || !fb)
>   		return 0;

I see that even the original code was not correct.

You have to call drm_atomic_helper_check_plane_state() in any case. If 
there's no CRTC, use NULL for the CRTC state. See [1] for an example.

>   
> +	ret = drm_format_to_vs_format(fb->format->format,
> +				      &new_vs_plane_state->format);
> +	if (ret)
> +		return ret;
> +

That should also only happen after 
drm_atomic_helper_check_plane_state().  You can again take the code 
around [1] for an example.

[1] 
https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/gpu/drm/ast/ast_mode.c#L504


I think it makes sense to warn once if the conversion fails. After all, 
the driver should only export DRM formats that it can program to hardware.

   if (drm_WARN_ON_ONCE(plane->dev, ret))
     return ret;


>   	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
> @@ -88,11 +96,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
>   {
>   	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
>   								       plane);
> +	struct vs_plane_state *vs_state = state_to_vs_plane_state(state);
>   	struct drm_framebuffer *fb = state->fb;
>   	struct drm_crtc *crtc = state->crtc;
>   	struct vs_dc *dc;
>   	struct vs_crtc *vcrtc;
> -	struct vs_format fmt;
>   	unsigned int output;
>   	dma_addr_t dma_addr;
>   
> @@ -105,16 +113,15 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
>   	output = vcrtc->id;
>   	dc = vcrtc->dc;
>   
> -	drm_format_to_vs_format(state->fb->format->format, &fmt);

Removing another possible failure from the atomic commit is really nice.

Best regards
Thomas

> -
>   	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
>   			   VSDC_FB_CONFIG_FMT_MASK,
> -			   VSDC_FB_CONFIG_FMT(fmt.color));
> +			   VSDC_FB_CONFIG_FMT(vs_state->format.color));
>   	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
>   			   VSDC_FB_CONFIG_SWIZZLE_MASK,
> -			   VSDC_FB_CONFIG_SWIZZLE(fmt.swizzle));
> +			   VSDC_FB_CONFIG_SWIZZLE(vs_state->format.swizzle));
>   	regmap_assign_bits(dc->regs, VSDC_FB_CONFIG(output),
> -			   VSDC_FB_CONFIG_UV_SWIZZLE_EN, fmt.uv_swizzle);
> +			   VSDC_FB_CONFIG_UV_SWIZZLE_EN,
> +			   vs_state->format.uv_swizzle);
>   
>   	dma_addr = vs_fb_get_dma_addr(fb, &state->src);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


