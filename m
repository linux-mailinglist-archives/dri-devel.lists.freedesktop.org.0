Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3554CB51696
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4343C10E90B;
	Wed, 10 Sep 2025 12:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="coLWEfQD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RyV7cZg/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RfTf8OSN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fKNFrAng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3931210E90B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:13:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D020B37D09;
 Wed, 10 Sep 2025 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757506430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XYwAkKX+fl6ayhAOtR6UK3xhLhDrTnjYN0qEyFto1zw=;
 b=coLWEfQDXgKiVJYE3bM0RmncY7XE5LeXcmsW1dw6GqgedUr8hR21pLVKiN9POWnU9S/lY5
 OCluDHATw2PP50er4GK1bDQChDFmyPge67PipupRGxQn9gOpINuAmQQYJt1ivqLShx0gvn
 Dwtj1KZvCjhrL8Ax8Mmol4lacgffyNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757506430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XYwAkKX+fl6ayhAOtR6UK3xhLhDrTnjYN0qEyFto1zw=;
 b=RyV7cZg/qsUemWum1WVXdsvjnRG41JVAHFH251kAA6ks42pWEvactFSSPjfO62crdy8Bid
 ASSUbVhET4JUboAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RfTf8OSN;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fKNFrAng
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757506429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XYwAkKX+fl6ayhAOtR6UK3xhLhDrTnjYN0qEyFto1zw=;
 b=RfTf8OSNLV24MWTWuBhm+azm4s5qgbL/Q36mexG2Frx8tZw/FLed4l14f4dEKIEwPqHO/c
 Abtn9w8yOVAShwylnF/iseA6+JwwU1Y2ZBtuDL/2rUJP4oFNNW3BfZ20hw5bI5iwpSXJXf
 IMiO/aydUwdqwk98RazYs/7+Ld1k5bQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757506429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XYwAkKX+fl6ayhAOtR6UK3xhLhDrTnjYN0qEyFto1zw=;
 b=fKNFrAngJp6pootj3qyXHClk9CdNX3N+FrLqJpgsRSb6L5pKixjllLfsWKYDUSiUv/4EXh
 DsTg2zNMWcCynxCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A270113310;
 Wed, 10 Sep 2025 12:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IAZnJn1rwWgrdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Sep 2025 12:13:49 +0000
Message-ID: <d3f47a4e-0692-4f0f-9092-cb109fc805fd@suse.de>
Date: Wed, 10 Sep 2025 14:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/pixpaper: Fix return type of pixpaper_mode_valid()
To: Nathan Chancellor <nathan@kernel.org>,
 LiangCheng Wang <zaq14760@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-drm-pixpaper-fix-mode_valid-return-type-v1-1-705ceaf03757@kernel.org>
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
In-Reply-To: <20250908-drm-pixpaper-fix-mode_valid-return-type-v1-1-705ceaf03757@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D020B37D09
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,linux.intel.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
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



Am 08.09.25 um 22:24 schrieb Nathan Chancellor:
> When building with -Wincompatible-function-pointer-types-strict, a
> warning designed to catch kernel control flow integrity (kCFI) issues at
> build time, there is an instance in the new tiny DRM pixpaper driver:
>
>    drivers/gpu/drm/tiny/pixpaper.c:982:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_crtc *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_crtc *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>      982 |         .mode_valid = pixpaper_mode_valid,
>          |                       ^~~~~~~~~~~~~~~~~~~
>
> While 'int' and 'enum drm_mode_status' are ABI compatible, hence no
> regular warning from -Wincompatible-function-pointer-types, the mismatch
> will trigger a kCFI violation when pixpaper_mode_valid() is called
> indirectly.
>
> Update the return type of pixpaper_mode_valid() to be
> 'enum drm_mode_status' to clear up the warning and kCFI violation.
>
> Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the fix.

> ---
>   drivers/gpu/drm/tiny/pixpaper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
> index b1379cb5f030..32598fb2fee7 100644
> --- a/drivers/gpu/drm/tiny/pixpaper.c
> +++ b/drivers/gpu/drm/tiny/pixpaper.c
> @@ -968,8 +968,8 @@ static const struct drm_crtc_funcs pixpaper_crtc_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
>   };
>   
> -static int pixpaper_mode_valid(struct drm_crtc *crtc,
> -			       const struct drm_display_mode *mode)
> +static enum drm_mode_status
> +pixpaper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
>   {
>   	if (mode->hdisplay == PIXPAPER_WIDTH &&
>   	    mode->vdisplay == PIXPAPER_HEIGHT) {
>
> ---
> base-commit: 490b30fbaca2abbd6afa8bdc7e2df329b5d82412
> change-id: 20250908-drm-pixpaper-fix-mode_valid-return-type-4228e531193b
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


