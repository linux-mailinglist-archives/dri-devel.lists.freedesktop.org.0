Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B141CAC7FF
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 09:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C668210E3D0;
	Mon,  8 Dec 2025 08:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sd4PnFVt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BgRPLTt5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sd4PnFVt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BgRPLTt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83CB10E111
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 08:29:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BDD933849;
 Mon,  8 Dec 2025 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765182594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=txAEDolAm+qx9EKDUzNM1Dzpyph1t3vIgVGEU6Q1+bg=;
 b=sd4PnFVtjLoipHwrQInn64sDZyCc3Rx32hdJ9VaMnz1oIHO3QM6Hr2IoydCH6upI/th/gm
 IasXaHUB+EqlGhGu4HazbnhTJGAbSiw0Mr0609TTw/aBeGDXm9fbpk3CXFypjUHbsWjU6w
 96Ps+j7JSmD0VhMtSS7JQZMzluaeJpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765182594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=txAEDolAm+qx9EKDUzNM1Dzpyph1t3vIgVGEU6Q1+bg=;
 b=BgRPLTt5tAppddr9Yy16j3m4n10KFPluLp0pR+govG6emQPsGUXWzvyz9mjGE/SHVrYdR8
 8YPKHKXuemnl/+Cw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sd4PnFVt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BgRPLTt5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765182594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=txAEDolAm+qx9EKDUzNM1Dzpyph1t3vIgVGEU6Q1+bg=;
 b=sd4PnFVtjLoipHwrQInn64sDZyCc3Rx32hdJ9VaMnz1oIHO3QM6Hr2IoydCH6upI/th/gm
 IasXaHUB+EqlGhGu4HazbnhTJGAbSiw0Mr0609TTw/aBeGDXm9fbpk3CXFypjUHbsWjU6w
 96Ps+j7JSmD0VhMtSS7JQZMzluaeJpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765182594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=txAEDolAm+qx9EKDUzNM1Dzpyph1t3vIgVGEU6Q1+bg=;
 b=BgRPLTt5tAppddr9Yy16j3m4n10KFPluLp0pR+govG6emQPsGUXWzvyz9mjGE/SHVrYdR8
 8YPKHKXuemnl/+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9D3D3EA63;
 Mon,  8 Dec 2025 08:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 24FbMYGMNmnrXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Dec 2025 08:29:53 +0000
Message-ID: <816e40d2-e451-4d70-bc44-e07562138b1b@suse.de>
Date: Mon, 8 Dec 2025 09:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/mgag200: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20251205.182405.876575799174263183.rene@exactco.de>
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
In-Reply-To: <20251205.182405.876575799174263183.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 0BDD933849
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MID_RHS_MATCH_FROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,bootlin.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,exactco.de:email,suse.com:url];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,bootlin.com:url,suse.de:dkim,suse.de:mid];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Hi,

thanks for the update.

Am 05.12.25 um 18:24 schrieb René Rebe:
> Unlike the original, deleted Matrox mga driver, the new mgag200 driver
> has the XRGB frame-buffer byte swapped on big-endian "RISC"
> systems. Fix by enabling byte swapping "PowerPC" OPMODE for any
> __BIG_ENDIAN config.
>
> Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
> Signed-off-by: René Rebe <rene@exactco.de>
> Cc: stable@kernel.org
> ---
> V2: move to atomic_update
> Tested on IBM 43p Model 150 (7043-150) running T2/Linux.
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 951d715dea30..d40434ec68ab 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -496,6 +496,20 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	struct drm_atomic_helper_damage_iter iter;
>   	struct drm_rect damage;
>   
> +#ifdef __BIG_ENDIAN
> +	/* Big-endian byte-swapping */
> +	switch (fb->format->format) {
> +	case DRM_FORMAT_RGB565:
> +		WREG32(MGAREG_OPMODE, 0x10100);
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		WREG32(MGAREG_OPMODE, 0x20200);
> +		break;
> +	default:
> +		break;

No need for a default branch IIRC.

> +	}

This is the right place to set up the write mode.

But looking at the G200 docs, I found that the reset value for OPMODE 
has bit 18 set to 1. These writes clear the value. If that intentional?

For better style and compatibility, I suggest to first read the value 
and keep the reserved bit as-is.

u32 opmode

opmode = RREG32(MGAREG_OPMODE)
opmode &= ~GENMASK(17, 16)
opmode &= ~GENMASK(9, 8)
opmode &= ~GENMASK(3, 2)

switch (format) {
         opmode |= ...;
}

WREG32(OPMODE, opmode);

You can put that in a helper near set_startadd [1]

void mgag200_set_datasiz(struct mga_device *mdev, u32 format)
{
#if __BIG_ENDIAN
...
#endif
}

Then call that from atomic_update and it should be fine.

[1] 
https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L117

Best regards
Thomas


> +#endif
> +
>   	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>   	drm_atomic_for_each_plane_damage(&iter, &damage) {
>   		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


