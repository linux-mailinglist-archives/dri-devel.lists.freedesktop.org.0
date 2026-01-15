Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C4D22F4B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFA210E6DB;
	Thu, 15 Jan 2026 07:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="STyAFe2Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="duq7QlO6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="STyAFe2Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="duq7QlO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1B810E6DB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:55:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0354D5BCE8;
 Thu, 15 Jan 2026 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768463714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uu2xYv9TK65U2dNAnIb1F5lVgy1KSPMAxFLRTYqu7ds=;
 b=STyAFe2ZxpkOz0PrmlEzJUn6DlhI1xjx0wzGlg2v6pTD7poAfSNsMmZOj2DXNh7L7rbJD7
 chOBjdDu+ag5zUMnhi2b7AVgC+MmTJJ/FNCMVtMtPLSnphXgz/oLcqmeqtDttH2O69Qnv4
 175sBcnKX6NFTezuiWWx/bNSckPN3Gk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768463714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uu2xYv9TK65U2dNAnIb1F5lVgy1KSPMAxFLRTYqu7ds=;
 b=duq7QlO6nKze6B+NcdR5EfVCwS/M9q6P6F+L7FOmgn+gm3Mni2vNPVo17vYBsVFe0zyLhn
 00MHk/1bGkGSbCCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=STyAFe2Z;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=duq7QlO6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768463714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uu2xYv9TK65U2dNAnIb1F5lVgy1KSPMAxFLRTYqu7ds=;
 b=STyAFe2ZxpkOz0PrmlEzJUn6DlhI1xjx0wzGlg2v6pTD7poAfSNsMmZOj2DXNh7L7rbJD7
 chOBjdDu+ag5zUMnhi2b7AVgC+MmTJJ/FNCMVtMtPLSnphXgz/oLcqmeqtDttH2O69Qnv4
 175sBcnKX6NFTezuiWWx/bNSckPN3Gk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768463714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uu2xYv9TK65U2dNAnIb1F5lVgy1KSPMAxFLRTYqu7ds=;
 b=duq7QlO6nKze6B+NcdR5EfVCwS/M9q6P6F+L7FOmgn+gm3Mni2vNPVo17vYBsVFe0zyLhn
 00MHk/1bGkGSbCCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE1D33EA63;
 Thu, 15 Jan 2026 07:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id reRbKGCdaGmRagAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 07:55:12 +0000
Message-ID: <1b83803a-b51f-4cc0-a836-b4417bfd6537@suse.de>
Date: Thu, 15 Jan 2026 08:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
 kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
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
In-Reply-To: <20260113045909.336931-1-chintanlike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmx.de,linuxfoundation.org,intel.com];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.com:url,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 0354D5BCE8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Hi

Am 13.01.26 um 05:59 schrieb Chintan Patel:
> Replace direct accesses to info->dev with fb_dbg() and fb_info()
> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
>
> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>
> Changes in v6:
> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
>    handle the debug/info context.
> - Drop __func__ usage per review feedback(suggested by greg k-h)
> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
>    (suggested by Andy Shevchenko)
>
> Changes in v5:
> - Initial attempt to replace info->dev accesses using
>    dev_of_fbinfo() helper
> ---
>   drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8a5ccc8ae0a1..1b3b62950205 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>   	unsigned int val;
>   	int ret = 1;
>   
> -	dev_dbg(info->dev,
> -		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
> -		__func__, regno, red, green, blue, transp);
> +	fb_dbg(info,
> +	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
> +	       regno, red, green, blue, transp);
>   
>   	switch (info->fix.visual) {
>   	case FB_VISUAL_TRUECOLOR:
> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
>   	struct fbtft_par *par = info->par;
>   	int ret = -EINVAL;
>   
> -	dev_dbg(info->dev, "%s(blank=%d)\n",
> -		__func__, blank);
> +	fb_dbg(info, "blank=%d\n", blank);
>   
>   	if (!par->fbtftops.blank)
>   		return ret;
> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>   	if (spi)
>   		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>   			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
> -	dev_info(fb_info->dev,
> -		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> -		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> -		 fb_info->fix.smem_len >> 10, text1,
> -		 HZ / fb_info->fbdefio->delay, text2);
> +	fb_info(fb_info,
> +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> +		fb_info->fix.smem_len >> 10, text1,
> +		HZ / fb_info->fbdefio->delay, text2);

As discussed before, this should become fb_dbg().  Drivers should not 
print status reports unless they do not work as expected.

Best regards
Thomas

>   
>   	/* Turn on backlight if available */
>   	if (fb_info->bl_dev) {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


