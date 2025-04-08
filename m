Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330AAA7FD5F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956A10E644;
	Tue,  8 Apr 2025 11:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bAbPaFzD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yDplW1iu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bAbPaFzD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yDplW1iu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63A910E644
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:01:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53E651F388;
 Tue,  8 Apr 2025 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744110114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ywc27iSwIC4EnbPxOMxz7hD70DTqHsguQev0GCVuwAw=;
 b=bAbPaFzD0gi4Bf8Q9I+SKTqTOzcBuv0/zwxJLNMH+WplJ0Rn0ObH3t4TC5JPuTaKDNrN8v
 v65iEvXx/B8850cth6aT33I7BJLXOGslAGVhS3VotW4hI923pwIqUh+hY3NCmuEdXsVw4A
 SSnlBN19CbVyq0oqmmROTD+1WAQ60e8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744110114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ywc27iSwIC4EnbPxOMxz7hD70DTqHsguQev0GCVuwAw=;
 b=yDplW1iu2X7YWRLkpSP6e03u4ile3KPeJgaQ3ShSt1Wus4FPCoxU54ARxW5tH0gJL2cHQY
 b/Cq/Wrje7drFqDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bAbPaFzD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yDplW1iu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744110114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ywc27iSwIC4EnbPxOMxz7hD70DTqHsguQev0GCVuwAw=;
 b=bAbPaFzD0gi4Bf8Q9I+SKTqTOzcBuv0/zwxJLNMH+WplJ0Rn0ObH3t4TC5JPuTaKDNrN8v
 v65iEvXx/B8850cth6aT33I7BJLXOGslAGVhS3VotW4hI923pwIqUh+hY3NCmuEdXsVw4A
 SSnlBN19CbVyq0oqmmROTD+1WAQ60e8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744110114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ywc27iSwIC4EnbPxOMxz7hD70DTqHsguQev0GCVuwAw=;
 b=yDplW1iu2X7YWRLkpSP6e03u4ile3KPeJgaQ3ShSt1Wus4FPCoxU54ARxW5tH0gJL2cHQY
 b/Cq/Wrje7drFqDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF9F313691;
 Tue,  8 Apr 2025 11:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wqc0NSEC9Wd+AgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 11:01:53 +0000
Message-ID: <c4669293-0d56-4bdd-9075-01281042b002@suse.de>
Date: Tue, 8 Apr 2025 13:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 53E651F388
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 TAGGED_RCPT(0.00)[dt]; MID_RHS_MATCH_FROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid, suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

lots of good points in the review.

Am 08.04.25 um 12:44 schrieb Javier Martinez Canillas:
[...]
>> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> ---
>>   drivers/gpu/drm/tiny/Kconfig      |  11 +
>>   drivers/gpu/drm/tiny/Makefile     |   1 +
>>   drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++++++++++
> I personally think that the tiny sub-directory is slowly becoming a
> dumping ground for small drivers. Instead, maybe we should create a
> drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?
>
> So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
> your driver. And also have a few more Sitronix drivers in the panel
> sub-directory (although those likely should remain there).
>
> I have a ST7565S and plan to write a driver for it. And I know someone
> who is working on a ST7920 driver. That would be 5 Sitronix drivers and
> the reason why I think that a dedicated sub-dir would be more organized.
>
> Maybe there's even common code among these drivers and could be reused?
>
> Just a thought though, it's OK to keep your driver as-is and we could do
> refactor / move drivers around as follow-up if agreed that is desirable.

That sounds like a good idea. But the other existing drivers are based 
on mipi-dbi helpers, while this one isn't. Not sure if that's important 
somehow.

>
>>   3 files changed, 733 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
>> index 94cbdb1337c07f1628a33599a7130369b9d59d98..33a69aea4232c5ca7a04b1fe18bb424e0fded697 100644
>> --- a/drivers/gpu/drm/tiny/Kconfig
>> +++ b/drivers/gpu/drm/tiny/Kconfig
>> @@ -232,6 +232,17 @@ config TINYDRM_ST7586
>>   
[...]
>> +
>> +static const uint32_t st7571_primary_plane_formats[] = {
>> +	DRM_FORMAT_C1,
>> +	DRM_FORMAT_C2,
>> +};
>> +
> I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
> be compatible with any user-space. Your st7571_fb_blit_rect() can then do
> a pixel format conversion from XRGB8888 to the native pixel format.

It would be a starting point for XRGB8888 on C1/R1. I always wanted to 
reimplement drm_fb_xrgb8888_to_mono() [1] with the generic _xfrm_ 
helpers. Once the generic helpers can do such low-bit formats, C2 would 
also work easily.

[1] 
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/gpu/drm/drm_format_helper.c#L1114

Best regards
Thomas

>
> ...
>
>> +static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
>> +						   struct drm_atomic_state *state)
>> +{
>> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>> +	struct drm_framebuffer *fb = plane_state->fb;
>> +	struct drm_atomic_helper_damage_iter iter;
>> +	struct drm_device *dev = plane->dev;
>> +	struct drm_rect damage;
>> +	struct st7571_device *st7571 = drm_to_st7571(plane->dev);
>> +	int ret, idx;
>> +
>> +	if (!fb)
>> +		return; /* no framebuffer; plane is disabled */
>> +
>> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>> +	if (ret)
>> +		return;
>> +
>> +	if (!drm_dev_enter(dev, &idx))
> Should do a drm_gem_fb_end_cpu_access() here before returning.
>
>> +		return;
>> +
>> +	ret = st7571_set_pixel_format(st7571, fb->format->format);
>> +	if (ret) {
>> +		dev_err(dev->dev, "Failed to set pixel format: %d\n", ret);
> And here I think you need to do both drm_gem_fb_end_cpu_access() and drm_dev_exit().
>
>> +		return;
>> +	}
>> +
>> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
>> +		st7571_fb_blit_rect(fb, &shadow_plane_state->data[0], &damage);
>> +	}
>> +
>> +	drm_dev_exit(idx);
>> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>> +}
>> +
>> +static const struct drm_plane_helper_funcs st7571_primary_plane_helper_funcs = {
>> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>> +	.atomic_check = st7571_primary_plane_helper_atomic_check,
>> +	.atomic_update = st7571_primary_plane_helper_atomic_update,
>> +};
> Maybe you want an .atomic_disable callback that clears your screen ?
>
>
>> +
>> +/*
>> + * CRTC
>> + */
>> +
>> +static const struct drm_crtc_helper_funcs st7571_crtc_helper_funcs = {
>> +	.atomic_check = drm_crtc_helper_atomic_check,
> I think you could have an .mode_valid callback that just checks the fixed mode.
>
>> +/*
>> + * Encoder
>> + */
>> +
>> +static const struct drm_encoder_funcs st7571_encoder_funcs = {
>> +	.destroy = drm_encoder_cleanup,
>> +};
> I recommend to have an encoder .atomic_{en,dis}able callbacks to init and turn
> off your display respectively. That way, the driver can call st7571_lcd_init()
> only when the display is going to be used instead of at probe time.
>
> ...
>
>> +static enum drm_mode_status st7571_mode_config_mode_valid(struct drm_device *dev,
>> +						       const struct drm_display_mode *mode)
>> +{
>> +	struct st7571_device *st7571 = drm_to_st7571(dev);
>> +
>> +	return drm_crtc_helper_mode_valid_fixed(&st7571->crtc, mode, &st7571->mode);
>> +}
> The fact that you are calling a drm_crtc_helper here is an indication that probably
> this should be done in a struct drm_crtc_helper_funcs .mode_valid callback instead,
> as mentioned above.
>
>> +
>> +static const struct drm_mode_config_funcs st7571_mode_config_funcs = {
>> +	.fb_create = drm_gem_fb_create_with_dirty,
>> +	.mode_valid = st7571_mode_config_mode_valid,
> And that way you could just drop this handler.
>
>> +	.atomic_check = drm_atomic_helper_check,
>> +	.atomic_commit = drm_atomic_helper_commit,
>> +};
>> +
> ...
>
>> +static int st7571_probe(struct i2c_client *client)
>> +{
>> +	struct st7571_device *st7571;
>> +	struct drm_device *dev;
>> +	int ret;
>> +
>> +	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
>> +				    struct st7571_device, dev);
>> +	if (IS_ERR(st7571))
>> +		return PTR_ERR(st7571);
>> +
>> +	dev = &st7571->dev;
>> +	st7571->client = client;
>> +	i2c_set_clientdata(client, st7571);
>> +
>> +	ret = st7571_parse_dt(st7571);
>> +	if (ret)
>> +		return ret;
>> +
>> +	st7571->mode = st7571_mode(st7571);
>> +
>> +	/*
>> +	 * The chip nacks some messages but still works as expected.
>> +	 * If the adapter does not support protocol mangling do
>> +	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
>> +	 * cruft in the logs.
>> +	 */
>> +	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
>> +		st7571->ignore_nak = true;
>> +
>> +	st7571->regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
>> +					   client, &st7571_regmap_config);
>> +	if (IS_ERR(st7571->regmap)) {
>> +		dev_err(&client->dev, "Failed to initialize regmap\n");
> If you use dev_err_probe(), you can give some indication to users about
> what failed. It prints messages in the /sys/kernel/debug/devices_deferred
> debugfs entry.
>
>> +
>> +static void st7571_remove(struct i2c_client *client)
>> +{
>> +	struct st7571_device *st7571 = i2c_get_clientdata(client);
>> +
>> +	drm_dev_unplug(&st7571->dev);
> I think you are missing a drm_atomic_helper_shutdown() here.
>
> And also a struct i2c_driver .shutdown callback to call to
> drm_atomic_helper_shutdown() as well.
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

