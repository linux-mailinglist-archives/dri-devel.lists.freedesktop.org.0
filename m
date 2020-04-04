Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5383819F0FF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0294E6E2CF;
	Mon,  6 Apr 2020 07:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 545 seconds by postgrey-1.36 at gabe;
 Sat, 04 Apr 2020 13:36:22 UTC
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751296E21E
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 13:36:22 +0000 (UTC)
Received: from bell.riseup.net (unknown [10.0.1.178])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 48vczS5CNZzFf7L;
 Sat,  4 Apr 2020 06:27:16 -0700 (PDT)
X-Riseup-User-ID: F8F57A2DDE432EE31E84DE8D17AF1C72D44BF04F35BE92F4EE594C81FF024D1C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by bell.riseup.net (Postfix) with ESMTPSA id 48vczN0GsGzJvNh;
 Sat,  4 Apr 2020 06:27:11 -0700 (PDT)
To: Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <CGME20190921125017epcas3p2f5661cca04f0959f9707f6111102435d@epcas3p2.samsung.com>
 <20190921124843.6967-1-joonas.kylmala@iki.fi>
 <d8a8bf25-0c5e-8d94-9406-b1f74e3edfac@samsung.com>
From: =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala@iki.fi>
Autocrypt: addr=joonas.kylmala@iki.fi; prefer-encrypt=mutual; keydata=
 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
 gKPkEg==
Subject: Re: [PATCH] drm/panel: samsung: s6e8aa0: Add backlight control support
Message-ID: <53385e44-1847-ace0-cd87-5571f6acd3f2@iki.fi>
Date: Sat, 4 Apr 2020 16:27:02 +0300
MIME-Version: 1.0
In-Reply-To: <d8a8bf25-0c5e-8d94-9406-b1f74e3edfac@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: paul.kocialkowski@bootlin.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, GNUtoo@cyberdimension.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

addressing this email to you all since there might be widespread race
condition issue in the DRM panel drivers that are using MIPI DSI. See
below for my message.

Andrzej Hajda:
>> +static int s6e8aa0_set_brightness(struct backlight_device *bd)
>> +{
>> +	struct s6e8aa0 *ctx = bl_get_data(bd);
>> +	const u8 *gamma;
>> +
>> +	if (ctx->error)
>> +		return;
>> +
>> +	gamma = ctx->variant->gamma_tables[bd->props.brightness];
>> +
>> +	if (ctx->version >= 142)
>> +		s6e8aa0_elvss_nvm_set(ctx);
>> +
>> +	s6e8aa0_dcs_write(ctx, gamma, GAMMA_TABLE_LEN);
>> +
>> +	/* update gamma table. */
>> +	s6e8aa0_dcs_write_seq_static(ctx, 0xf7, 0x03);
>> +
>> +	return s6e8aa0_clear_error(ctx);
>> +}
>> +
>> +static const struct backlight_ops s6e8aa0_backlight_ops = {
>> +	.update_status	= s6e8aa0_set_brightness,
> 
> 
> This is racy, update_status can be called in any time between probe and
> remove, particularly:
> 
> a) before panel enable,
> 
> b) during panel enable,
> 
> c) when panel is enabled,
> 
> d) during panel disable,
> 
> e) after panel disable,
> 
> 
> b and d are racy for sure - backlight and drm callbacks are async.
> 
> IMO the best solution would be to register backlight after attaching
> panel to drm, but for this drm_panel_funcs should have attach/detach
> callbacks (like drm_bridge_funcs),
> 
> then update_status callback should take some drm_connector lock to
> synchronize with drm, and write to hw only when pipe is enabled.

I have done now research and if I understand right one issue here might
be with setting the backlight brightness if the DSI device is not
attached before calling update_status() since calling it would call
subsequently s6e8aa0_set_brightness() -> s6e8aa0_dcs_write() ->
mipi_dsi_dcs_write_buffer(), which then requires DSI to be attached.

But now to the part that affects many of the panel drivers using MIPI
DSI, like panel-samsung-s6e63j0x03.c, panel-simple.c, etc.:
mipi_dsi_attach(dsi) seems to be always called only after the DRM panel
helper drm_panel_add(). Now I think this is problematic since
drm_panel_add() makes the panel available for use in userspace but if
the user tries to actually do something with the panel before
mipi_dsi_attach(dsi) is called it would not work.

So for some reason the mipi_dsi_attach() is called in all those drivers
after drm_panel_add() and at least to the problem I pointed out above
moving the call there before drm_panel_add() would fix the issue but
then I don't know if it causes some other issue.

Also I don't know if Andrzej had some other issues in mind that could be
caused by this race condition, so if there are multiple instead of just
that one issue with DSI not being attached then we might want to have
all these issues fixed by for example the solution Andrzej proposed
where we have attach/detach callbacks in drm_bridge_funcs.

Please let me know if anything I write above doesn't make sense, I'm
still trying to understand the DRM subsystem better.

Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
