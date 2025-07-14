Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5AB03E5E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6A010E477;
	Mon, 14 Jul 2025 12:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xy7AZ4Vr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/xjZnDmt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NbJpbCq/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Bej/XaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3271B10E477
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:11:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A63501F395;
 Mon, 14 Jul 2025 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752495070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jgOP6Xyux4nNXovH0aclHvSXmWKY/Y6kHyN0Dn0IOoQ=;
 b=xy7AZ4VrwZcZyxME47Illvt39XcAZLhASGQ5hvjUlgV6DNdVWYXX3XDx8Hx9uCLvl9bpms
 xDDO027dgCoz/MiH+QxbusEj1F5pmG5XoYIoV2m488vCWZ7S5NBlOjKatAsDNDrJ7xjA/j
 /opZWqNHuebiUOLH5FKZBnjyUJ/N3Xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752495070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jgOP6Xyux4nNXovH0aclHvSXmWKY/Y6kHyN0Dn0IOoQ=;
 b=/xjZnDmtpXRO7aNHsud5A5x79wRiLowQuXvyr3ztc67xukzTeSFEQeGqy6KCtSFYaxuT/9
 Zb8lsXcqoTwqDIAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752495068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jgOP6Xyux4nNXovH0aclHvSXmWKY/Y6kHyN0Dn0IOoQ=;
 b=NbJpbCq/PszFIu+FIDHShaAg/KjFi/qYxbkFU0OWANgn7Td25NzKM6WKY7g0VWEkx0XvRk
 pDNmsZ614MBg16k3PAWD/33aOvfyP1U6dzE9kPG9hZcDY6x/cjYvKH1NNkgFujhhpaZe1V
 F5aIAoYm8g+zzLhHjMCcq1j+rYh38QA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752495068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jgOP6Xyux4nNXovH0aclHvSXmWKY/Y6kHyN0Dn0IOoQ=;
 b=1Bej/XaQkS446HZuz595iiNWb7h3Ggj9KgY5MFvjys9RSbSjzG0rfY6xGlo5IxFz99e0q5
 STiFzd7Nmb0oGwCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63CA713306;
 Mon, 14 Jul 2025 12:11:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id s23CFtzzdGjHdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 12:11:08 +0000
Message-ID: <678d7564-3736-4c5e-9d32-d107eb76af28@suse.de>
Date: Mon, 14 Jul 2025 14:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/sitronix/st7571-i2c: Add support for the
 ST7567 Controller
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250714104421.323753-1-javierm@redhat.com>
 <20250714104421.323753-6-javierm@redhat.com>
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
In-Reply-To: <20250714104421.323753-6-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_CC(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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



Am 14.07.25 um 12:44 schrieb Javier Martinez Canillas:
> The Sitronix ST7567 is a monochrome Dot Matrix LCD Controller that has SPI,
> I2C and parallel interfaces. The st7571-i2c driver only has support for I2C
> so displays using other transport interfaces are currently not supported.
>
> The DRM_FORMAT_R1 pixel format and data commands are the same than what
> is used by the ST7571 controller, so only is needed a different callback
> that implements the expected initialization sequence for the ST7567 chip.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>
> Changes in v2:
> - Use a different parse DT function (Thomas Zimmermann).
>
>   drivers/gpu/drm/sitronix/st7571-i2c.c | 74 +++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
>
> diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
> index f9c4fedb3cca..1b820ff6a9dd 100644
> --- a/drivers/gpu/drm/sitronix/st7571-i2c.c
> +++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
> @@ -68,6 +68,9 @@
>   #define ST7571_SET_COLOR_MODE(c)		(0x10 | FIELD_PREP(GENMASK(0, 0), (c)))
>   #define ST7571_COMMAND_SET_NORMAL		(0x00)
>   
> +/* ST7567 commands */
> +#define ST7567_SET_LCD_BIAS(m) (0xa2 | FIELD_PREP(GENMASK(0, 0), (m)))
> +
>   #define ST7571_PAGE_HEIGHT 8
>   
>   #define DRIVER_NAME "st7571"
> @@ -774,6 +777,32 @@ static int st7571_validate_parameters(struct st7571_device *st7571)
>   	return 0;
>   }
>   
> +static int st7567_parse_dt(struct st7571_device *st7567)
> +{
> +	struct device *dev = &st7567->client->dev;
> +	struct device_node *np = dev->of_node;
> +	struct display_timing dt;
> +	int ret;
> +
> +	ret = of_get_display_timing(np, "panel-timing", &dt);
> +	if (ret) {
> +		dev_err(dev, "Failed to get display timing from DT\n");
> +		return ret;
> +	}
> +
> +	of_property_read_u32(np, "width-mm", &st7567->width_mm);
> +	of_property_read_u32(np, "height-mm", &st7567->height_mm);
> +
> +	st7567->pformat = &st7571_monochrome;
> +	st7567->bpp = 1;
> +
> +	st7567->startline = dt.vfront_porch.typ;
> +	st7567->nlines = dt.vactive.typ;
> +	st7567->ncols = dt.hactive.typ;
> +
> +	return 0;
> +}
> +
>   static int st7571_parse_dt(struct st7571_device *st7571)
>   {
>   	struct device *dev = &st7571->client->dev;
> @@ -819,6 +848,37 @@ static void st7571_reset(struct st7571_device *st7571)
>   	gpiod_set_value_cansleep(st7571->reset, 0);
>   }
>   
> +static int st7567_lcd_init(struct st7571_device *st7567)
> +{
> +	/*
> +	 * Most of the initialization sequence is taken directly from the
> +	 * referential initial code in the ST7567 datasheet.
> +	 */
> +	u8 commands[] = {
> +		ST7571_DISPLAY_OFF,
> +
> +		ST7567_SET_LCD_BIAS(1),
> +
> +		ST7571_SET_SEG_SCAN_DIR(0),
> +		ST7571_SET_COM_SCAN_DIR(1),
> +
> +		ST7571_SET_REGULATOR_REG(4),
> +		ST7571_SET_CONTRAST_MSB,
> +		ST7571_SET_CONTRAST_LSB(0x20),
> +
> +		ST7571_SET_START_LINE_MSB,
> +		ST7571_SET_START_LINE_LSB(st7567->startline),
> +
> +		ST7571_SET_POWER(0x4),	/* Power Control, VC: ON, VR: OFF, VF: OFF */
> +		ST7571_SET_POWER(0x6),	/* Power Control, VC: ON, VR: ON, VF: OFF */
> +		ST7571_SET_POWER(0x7),	/* Power Control, VC: ON, VR: ON, VF: ON */
> +
> +		ST7571_SET_ENTIRE_DISPLAY_ON(0),
> +	};
> +
> +	return st7571_send_command_list(st7567, commands, ARRAY_SIZE(commands));
> +}
> +
>   static int st7571_lcd_init(struct st7571_device *st7571)
>   {
>   	/*
> @@ -963,6 +1023,18 @@ static void st7571_remove(struct i2c_client *client)
>   	drm_dev_unplug(&st7571->dev);
>   }
>   
> +struct st7571_panel_data st7567_config = {
> +	.init = st7567_lcd_init,
> +	.parse_dt = st7567_parse_dt,
> +	.constraints = {
> +		.min_nlines = 1,
> +		.max_nlines = 64,
> +		.min_ncols = 128,
> +		.max_ncols = 128,
> +		.support_grayscale = false,
> +	},
> +};
> +
>   struct st7571_panel_data st7571_config = {
>   	.init = st7571_lcd_init,
>   	.parse_dt = st7571_parse_dt,
> @@ -976,12 +1048,14 @@ struct st7571_panel_data st7571_config = {
>   };
>   
>   static const struct of_device_id st7571_of_match[] = {
> +	{ .compatible = "sitronix,st7567", .data = &st7567_config },
>   	{ .compatible = "sitronix,st7571", .data = &st7571_config },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, st7571_of_match);
>   
>   static const struct i2c_device_id st7571_id[] = {
> +	{ "st7567", 0 },
>   	{ "st7571", 0 },
>   	{ }
>   };

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

