Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A338ACDA61
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7876E10E8B6;
	Wed,  4 Jun 2025 08:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zyf/l6L7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lJnhLoWD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zyf/l6L7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lJnhLoWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEDF10E7CA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:58:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 533473E721;
 Wed,  4 Jun 2025 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749027380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iqgZ8xPpJ3EsotfPgJZu6XfZF4dEZTN6chU7R4xgPFI=;
 b=zyf/l6L7UnAMb0Dpnr/7OVV4DJaZLO+ULCvTWXb+sjTl//Q5t26FyjO53SAQeXdt4B+F/4
 7XhtjkaxDpDVJajn2t6Na8Ums2pJkohYX+XXj8a/D2cYnnHESZkmXW+GC7ye12gxR+XdBU
 OclyZASmy7sKURr3b2B2SWbYLL1N9RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749027380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iqgZ8xPpJ3EsotfPgJZu6XfZF4dEZTN6chU7R4xgPFI=;
 b=lJnhLoWDrMdseb6xeK/Ox7hJcvwGblc16TF1+EtYAaKmMPf/pGq6vTiWh3+NkUXFnjPySB
 Ysy/xdNYTrLVpYBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="zyf/l6L7";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lJnhLoWD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749027380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iqgZ8xPpJ3EsotfPgJZu6XfZF4dEZTN6chU7R4xgPFI=;
 b=zyf/l6L7UnAMb0Dpnr/7OVV4DJaZLO+ULCvTWXb+sjTl//Q5t26FyjO53SAQeXdt4B+F/4
 7XhtjkaxDpDVJajn2t6Na8Ums2pJkohYX+XXj8a/D2cYnnHESZkmXW+GC7ye12gxR+XdBU
 OclyZASmy7sKURr3b2B2SWbYLL1N9RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749027380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iqgZ8xPpJ3EsotfPgJZu6XfZF4dEZTN6chU7R4xgPFI=;
 b=lJnhLoWDrMdseb6xeK/Ox7hJcvwGblc16TF1+EtYAaKmMPf/pGq6vTiWh3+NkUXFnjPySB
 Ysy/xdNYTrLVpYBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6E0C1369A;
 Wed,  4 Jun 2025 08:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id C0NkJzIKQGiWCAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jun 2025 08:56:18 +0000
Message-ID: <b5c43a16-4f8a-480e-9c99-f984dc0697f7@suse.de>
Date: Wed, 4 Jun 2025 10:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/5] drm/bridge: Update the bridge enable/disable doc
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
 <20250406131642.171240-5-aradhya.bhatia@linux.dev>
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
In-Reply-To: <20250406131642.171240-5-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[linux.dev,ideasonboard.com,oss.qualcomm.com,intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[22]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:mid, suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 533473E721
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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



Am 06.04.25 um 15:16 schrieb Aradhya Bhatia:
> Now that the bridges get pre-enabled before the CRTC is enabled, and get
> post-disabled after the CRTC is disabled, update the function
> descriptions to accurately reflect the updated scenario.
>
> The enable sequence for the display pipeline looks like:
>
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
>
> 	crtc_enable
> 	encoder_enable
>
> 	bridge[1]_enable
> 	...
> 	bridge[n]_enable
>
> And, the disable sequence for the display pipeline looks like:
>
> 	bridge[n]_disable
> 	...
> 	bridge[1]_disable
>
> 	encoder_disable
> 	crtc_disable
>
> 	bridge[1]_post_disable
> 	...
> 	bridge[n]_post_disable
>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I think this patch could be merged with patch 3.

> ---
>   include/drm/drm_bridge.h | 249 ++++++++++++++++++++++++++++-----------
>   1 file changed, 183 insertions(+), 66 deletions(-)
>
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index cdad3b78a195..e5ccbefa60a8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -164,17 +164,33 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right before
> -	 * the preceding element in the display pipe is disabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @disable vfunc. If the preceding element is a &drm_encoder
> -	 * it's called right before the &drm_encoder_helper_funcs.disable,
> -	 * &drm_encoder_helper_funcs.prepare or &drm_encoder_helper_funcs.dpms
> -	 * hook.
> +	 * The @disable callback should disable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is still running when this callback is called.
>   	 *
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is disabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.disable
> +	 * - &drm_bridge_funcs.atomic_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms.
> +	 *
>   	 * The @disable callback is optional.
>   	 *
>   	 * NOTE:
> @@ -187,17 +203,34 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @post_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right after the
> -	 * preceding element in the display pipe is disabled. If the preceding
> -	 * element is a bridge this means it's called after that bridge's
> -	 * @post_disable function. If the preceding element is a &drm_encoder
> -	 * it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.disable, &drm_encoder_helper_funcs.prepare
> -	 * or &drm_encoder_helper_funcs.dpms hook.
> -	 *
>   	 * The bridge must assume that the display pipe (i.e. clocks and timing
> -	 * signals) feeding it is no longer running when this callback is
> -	 * called.
> +	 * signals) feeding this bridge is no longer running when the
> +	 * @post_disable is called.
> +	 *
> +	 * This callback should perform all the actions required by the hardware
> +	 * after it has stopped receiving signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is post-disabled (unless marked otherwise by the
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.post_disable
> +	 * - &drm_bridge_funcs.atomic_post_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms
>   	 *
>   	 * The @post_disable callback is optional.
>   	 *
> @@ -240,18 +273,30 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @pre_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right before
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @pre_enable function. If the preceding element is a
> -	 * &drm_encoder it's called right before the encoder's
> -	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
> -	 * &drm_encoder_helper_funcs.dpms hook.
> -	 *
>   	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> -	 * will not yet be running when this callback is called. The bridge must
> -	 * not enable the display link feeding the next bridge in the chain (if
> -	 * there is one) when this callback is called.
> +	 * will not yet be running when the @pre_enable is called.
> +	 *
> +	 * This callback should perform all the necessary actions to prepare the
> +	 * bridge to accept signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is pre-enabled (unless marked otherwise by
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.pre_enable
> +	 * - &drm_bridge_funcs.atomic_pre_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - &drm_encoder_helper_funcs.commit
>   	 *
>   	 * The @pre_enable callback is optional.
>   	 *
> @@ -265,19 +310,31 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right after
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called after that
> -	 * bridge's @enable function. If the preceding element is a
> -	 * &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
> -	 * &drm_encoder_helper_funcs.dpms hook.
> +	 * The @enable callback should enable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is running when this callback is called. This
>   	 * callback must enable the display link feeding the next bridge in the
>   	 * chain if there is one.
>   	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is enabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.enable
> +	 * - &drm_bridge_funcs.atomic_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - drm_encoder_helper_funcs.commit
> +	 *
>   	 * The @enable callback is optional.
>   	 *
>   	 * NOTE:
> @@ -290,17 +347,30 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_pre_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right before
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
> -	 * element is a &drm_encoder it's called right before the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_enable hook.
> -	 *
>   	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> -	 * will not yet be running when this callback is called. The bridge must
> -	 * not enable the display link feeding the next bridge in the chain (if
> -	 * there is one) when this callback is called.
> +	 * will not yet be running when the @atomic_pre_enable is called.
> +	 *
> +	 * This callback should perform all the necessary actions to prepare the
> +	 * bridge to accept signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is pre-enabled (unless marked otherwise by
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.pre_enable
> +	 * - &drm_bridge_funcs.atomic_pre_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - &drm_encoder_helper_funcs.commit
>   	 *
>   	 * The @atomic_pre_enable callback is optional.
>   	 */
> @@ -310,18 +380,31 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right after
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called after that
> -	 * bridge's @atomic_enable or @enable function. If the preceding element
> -	 * is a &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_enable hook.
> +	 * The @atomic_enable callback should enable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is running when this callback is called. This
>   	 * callback must enable the display link feeding the next bridge in the
>   	 * chain if there is one.
>   	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is enabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.enable
> +	 * - &drm_bridge_funcs.atomic_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - drm_encoder_helper_funcs.commit
> +	 *
>   	 * The @atomic_enable callback is optional.
>   	 */
>   	void (*atomic_enable)(struct drm_bridge *bridge,
> @@ -329,16 +412,32 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right before
> -	 * the preceding element in the display pipe is disabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
> -	 * is a &drm_encoder it's called right before the
> -	 * &drm_encoder_helper_funcs.atomic_disable hook.
> +	 * The @atomic_disable callback should disable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is still running when this callback is called.
>   	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is disabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.disable
> +	 * - &drm_bridge_funcs.atomic_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms.
> +	 *
>   	 * The @atomic_disable callback is optional.
>   	 */
>   	void (*atomic_disable)(struct drm_bridge *bridge,
> @@ -347,16 +446,34 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_post_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right after the
> -	 * preceding element in the display pipe is disabled. If the preceding
> -	 * element is a bridge this means it's called after that bridge's
> -	 * @atomic_post_disable or @post_disable function. If the preceding
> -	 * element is a &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_disable hook.
> -	 *
>   	 * The bridge must assume that the display pipe (i.e. clocks and timing
> -	 * signals) feeding it is no longer running when this callback is
> -	 * called.
> +	 * signals) feeding this bridge is no longer running when the
> +	 * @atomic_post_disable is called.
> +	 *
> +	 * This callback should perform all the actions required by the hardware
> +	 * after it has stopped receiving signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is post-disabled (unless marked otherwise by the
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.post_disable
> +	 * - &drm_bridge_funcs.atomic_post_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms
>   	 *
>   	 * The @atomic_post_disable callback is optional.
>   	 */

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

