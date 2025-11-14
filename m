Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A56C5D5E1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 14:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7FE10E107;
	Fri, 14 Nov 2025 13:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LBINsM/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Grc/gALO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LBINsM/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Grc/gALO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312D710E107
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 13:34:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 990E62128E;
 Fri, 14 Nov 2025 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763127297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0wV7uYyCyWmmmHE2k6IvxKD4INfxcdI0v5lxdO2gO5A=;
 b=LBINsM/jKYzzCB1AEqdObWyKiCX7XRrUJd504fTpLiR5RhSqdhGTXOgVDxLUHVrqy2iM/7
 Fh4kCjJhy7e3GuT9F5F9HZEAwU6JIsSpNr9Al5f7GCcYm7u5DcmxDgYIawz5385qb6tmul
 j3etLhkCf2zR7eCBjhgWivjRypI97Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763127297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0wV7uYyCyWmmmHE2k6IvxKD4INfxcdI0v5lxdO2gO5A=;
 b=Grc/gALOfnI78A7/SeIshMSSfPFtnpdV3bcN1tct0jBza8ZL5psrJyg9rdaRzBXCP9CfS5
 l2mqEJ2AzRZELsDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="LBINsM/j";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Grc/gALO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763127297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0wV7uYyCyWmmmHE2k6IvxKD4INfxcdI0v5lxdO2gO5A=;
 b=LBINsM/jKYzzCB1AEqdObWyKiCX7XRrUJd504fTpLiR5RhSqdhGTXOgVDxLUHVrqy2iM/7
 Fh4kCjJhy7e3GuT9F5F9HZEAwU6JIsSpNr9Al5f7GCcYm7u5DcmxDgYIawz5385qb6tmul
 j3etLhkCf2zR7eCBjhgWivjRypI97Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763127297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0wV7uYyCyWmmmHE2k6IvxKD4INfxcdI0v5lxdO2gO5A=;
 b=Grc/gALOfnI78A7/SeIshMSSfPFtnpdV3bcN1tct0jBza8ZL5psrJyg9rdaRzBXCP9CfS5
 l2mqEJ2AzRZELsDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43C1C3EA61;
 Fri, 14 Nov 2025 13:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vG6lDgEwF2lRRQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Nov 2025 13:34:57 +0000
Message-ID: <dbf71996-c470-4875-82e0-19f139fb830a@suse.de>
Date: Fri, 14 Nov 2025 14:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gud: move format init from gud_probe()
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251110160428.2456-1-rubenru09.ref@aol.com>
 <20251110160428.2456-1-rubenru09@aol.com>
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
In-Reply-To: <20251110160428.2456-1-rubenru09@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 990E62128E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
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

sorry for being late with the review.

Am 10.11.25 um 17:03 schrieb Ruben Wauters:
> As part of the cleanup of gud_probe(), this patch splits off format init
> code from gud_probe into it's own function. This makes the code more
> compartmentalised and easier to follow, and makes gud_probe() smaller
> and also easier to read.
>
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
>   drivers/gpu/drm/gud/gud_drv.c | 167 +++++++++++++++++++---------------
>   1 file changed, 93 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index 42135a48d92e..22524601d463 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -427,84 +427,18 @@ static void gud_free_buffers_and_mutex(void *data)
>   	mutex_destroy(&gdrm->ctrl_lock);
>   }
>   
> -static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
> +static int gud_get_formats(struct gud_device *gdrm, struct device *usb_device, u32 *formats,
> +			   size_t *max_buffer_size, unsigned int *num_formats_ret)

Please don't pass the usb device here. You can get the device from 
gdrm->drm.dev.

>   {
>   	const struct drm_format_info *xrgb8888_emulation_format = NULL;
>   	bool rgb565_supported = false, xrgb8888_supported = false;
>   	unsigned int num_formats_dev, num_formats = 0;
> -	struct usb_endpoint_descriptor *bulk_out;
> -	struct gud_display_descriptor_req desc;
> -	struct device *dev = &intf->dev;
> -	size_t max_buffer_size = 0;
> -	struct gud_device *gdrm;
> -	struct drm_device *drm;
> -	struct device *dma_dev;
>   	u8 *formats_dev;
> -	u32 *formats;
> +	struct drm_device *drm = &gdrm->drm;
>   	int ret, i;
>   
> -	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
> -	if (ret)
> -		return ret;
> -
> -	ret = gud_get_display_descriptor(intf, &desc);
> -	if (ret) {
> -		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=%d\n", ret);
> -		return -ENODEV;
> -	}
> -
> -	if (desc.version > 1) {
> -		dev_err(dev, "Protocol version %u is not supported\n", desc.version);
> -		return -ENODEV;
> -	}
> -
> -	gdrm = devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_device, drm);
> -	if (IS_ERR(gdrm))
> -		return PTR_ERR(gdrm);
> -
> -	drm = &gdrm->drm;
> -
> -	gdrm->flags = le32_to_cpu(desc.flags);
> -	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
> -
> -	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compression)
> -		return -EINVAL;
> -
> -	mutex_init(&gdrm->ctrl_lock);
> -	mutex_init(&gdrm->damage_lock);
> -	INIT_WORK(&gdrm->work, gud_flush_work);
> -	gud_clear_damage(gdrm);
> -
> -	ret = devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
> -	if (ret)
> -		return ret;
> -
> -	usb_set_intfdata(intf, gdrm);
> -
> -	dma_dev = usb_intf_get_dma_device(intf);
> -	if (dma_dev) {
> -		drm_dev_set_dma_dev(drm, dma_dev);
> -		put_device(dma_dev);
> -	} else {
> -		dev_warn(dev, "buffer sharing not supported"); /* not an error */
> -	}
> -
> -	/* Mode config init */
> -	ret = drmm_mode_config_init(drm);
> -	if (ret)
> -		return ret;
> -
> -	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
> -	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
> -	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
> -	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
> -	drm->mode_config.funcs = &gud_mode_config_funcs;
> -
> -	/* Format init */
> -	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
> -	/* Add room for emulated XRGB8888 */
> -	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
> -	if (!formats_dev || !formats)
> +	formats_dev = devm_kmalloc(usb_device, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
> +	if (!formats_dev)
>   		return -ENOMEM;
>   
>   	ret = gud_usb_get(gdrm, GUD_REQ_GET_FORMATS, 0, formats_dev, GUD_FORMATS_MAX_NUM);
> @@ -555,7 +489,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   
>   		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
>   			       drm->mode_config.max_height;
> -		max_buffer_size = max(max_buffer_size, fmt_buf_size);
> +		*max_buffer_size = max(*max_buffer_size, fmt_buf_size);

Rather do this in a separate helper, where you pass in the array of 
supported formats and it computes max_buffer_size. This way you don't 
need an output parameter for max_buffer_size.

>   
>   		if (format == GUD_DRM_FORMAT_R1 || format == GUD_DRM_FORMAT_XRGB1111)
>   			continue; /* Internal not for userspace */
> @@ -564,7 +498,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   	}
>   
>   	if (!num_formats && !xrgb8888_emulation_format) {
> -		dev_err(dev, "No supported pixel formats found\n");
> +		dev_err(usb_device, "No supported pixel formats found\n");
>   		return -EINVAL;
>   	}
>   
> @@ -577,6 +511,92 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   		formats[num_formats++] = DRM_FORMAT_XRGB8888;
>   	}
>   
> +	devm_kfree(usb_device, formats_dev);
> +	*num_formats_ret = num_formats;
> +
> +	return 0;

Instead of 0, you can return num_formats on success.  Together with the 
change to max_buffer_size, no output parameters will be required.

Best regards
Thomas

> +}
> +
> +static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
> +{
> +	unsigned int num_formats = 0;
> +	struct usb_endpoint_descriptor *bulk_out;
> +	struct gud_display_descriptor_req desc;
> +	struct device *dev = &intf->dev;
> +	size_t max_buffer_size = 0;
> +	struct gud_device *gdrm;
> +	struct drm_device *drm;
> +	struct device *dma_dev;
> +	u32 *formats;
> +	int ret;
> +
> +	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
> +	if (ret)
> +		return ret;
> +
> +	ret = gud_get_display_descriptor(intf, &desc);
> +	if (ret) {
> +		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=%d\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	if (desc.version > 1) {
> +		dev_err(dev, "Protocol version %u is not supported\n", desc.version);
> +		return -ENODEV;
> +	}
> +
> +	gdrm = devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_device, drm);
> +	if (IS_ERR(gdrm))
> +		return PTR_ERR(gdrm);
> +
> +	drm = &gdrm->drm;
> +
> +	gdrm->flags = le32_to_cpu(desc.flags);
> +	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
> +
> +	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compression)
> +		return -EINVAL;
> +
> +	mutex_init(&gdrm->ctrl_lock);
> +	mutex_init(&gdrm->damage_lock);
> +	INIT_WORK(&gdrm->work, gud_flush_work);
> +	gud_clear_damage(gdrm);
> +
> +	ret = devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
> +	if (ret)
> +		return ret;
> +
> +	usb_set_intfdata(intf, gdrm);
> +
> +	dma_dev = usb_intf_get_dma_device(intf);
> +	if (dma_dev) {
> +		drm_dev_set_dma_dev(drm, dma_dev);
> +		put_device(dma_dev);
> +	} else {
> +		dev_warn(dev, "buffer sharing not supported"); /* not an error */
> +	}
> +
> +	/* Mode config init */
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
> +	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
> +	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
> +	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
> +	drm->mode_config.funcs = &gud_mode_config_funcs;
> +
> +	/* Format init */
> +	/* Add room for emulated XRGB8888 */
> +	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
> +	if (!formats)
> +		return -ENOMEM;
> +
> +	ret = gud_get_formats(gdrm, dev, formats, &max_buffer_size, &num_formats);
> +	if (ret)
> +		return ret;
> +
>   	if (desc.max_buffer_size)
>   		max_buffer_size = le32_to_cpu(desc.max_buffer_size);
>   	/* Prevent a misbehaving device from allocating loads of RAM. 4096x4096@XRGB8888 = 64 MB */
> @@ -641,7 +661,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   		return ret;
>   
>   	devm_kfree(dev, formats);
> -	devm_kfree(dev, formats_dev);
>   
>   	drm_client_setup(drm, NULL);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


