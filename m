Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6749D3728
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 10:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416D610E3B6;
	Wed, 20 Nov 2024 09:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Dvrn7Xh5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tP+1mkLn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dvrn7Xh5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tP+1mkLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA07710E3B6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 09:38:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76BFB219E3;
 Wed, 20 Nov 2024 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732095503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TXJR9OxZQZBwqCj+rcqlX10VNOixNkgu3Y7sCmz+NcY=;
 b=Dvrn7Xh5o8WZ4X9x66lDM1dOfw3ttwksqjUaRit14MKGOCENFgiQ3RGn6qNzaYHruaoDu4
 WnLROp96A3A7DfEMYDY7Rs0BUFXCbvVYz6G+/hcCWKbxYPXJ+fSJ741fU6KiRrbCHwv3AU
 eD0DrPk9isCvS1nNlUYTJ+BXRYEwMUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732095503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TXJR9OxZQZBwqCj+rcqlX10VNOixNkgu3Y7sCmz+NcY=;
 b=tP+1mkLnbzUGkWPvsw3laqFZz2yOyAnnC1DPUpz5N6FtwXrx/NiRA8D0nDbNFAhGaOrDFo
 KWdKza1vQE2452Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732095503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TXJR9OxZQZBwqCj+rcqlX10VNOixNkgu3Y7sCmz+NcY=;
 b=Dvrn7Xh5o8WZ4X9x66lDM1dOfw3ttwksqjUaRit14MKGOCENFgiQ3RGn6qNzaYHruaoDu4
 WnLROp96A3A7DfEMYDY7Rs0BUFXCbvVYz6G+/hcCWKbxYPXJ+fSJ741fU6KiRrbCHwv3AU
 eD0DrPk9isCvS1nNlUYTJ+BXRYEwMUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732095503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TXJR9OxZQZBwqCj+rcqlX10VNOixNkgu3Y7sCmz+NcY=;
 b=tP+1mkLnbzUGkWPvsw3laqFZz2yOyAnnC1DPUpz5N6FtwXrx/NiRA8D0nDbNFAhGaOrDFo
 KWdKza1vQE2452Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A73713297;
 Wed, 20 Nov 2024 09:38:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id v5rzDA+uPWfdVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Nov 2024 09:38:23 +0000
Message-ID: <40815234-baa2-4990-9f30-0a0632871a0c@suse.de>
Date: Wed, 20 Nov 2024 10:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
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
In-Reply-To: <20241119194038.530779-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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


Am 19.11.24 um 20:40 schrieb Ian Forbes:
> Most compositors are using a change in EDID as an indicator to
> refresh their connector information on hotplug regardless of whether the
> connector was previously connected. Originally the hotplug_mode_update
> property was supposed to provide a hint to userspace to always refresh
> connector info on hotplug as virtual devices such as vmwgfx and QXL
> changed the connector without disconnecting it first. This was done to
> implement Autofit. Unfortunately hotplug_mode_update was not widely
> adopted and compositors used other heuristics to determine whether to
> refresh the connector info.
>
> Currently a change in EDID is the one heuristic that seems to be universal.
> No compositors currently implement hotplug_mode_update correctly or at all.
> By implementing a fake EDID blob we can ensure that our EDID changes on
> hotplug and therefore userspace will refresh the connector info so that
> Autofit will work. This is the approach that virtio takes.
>
> This also removes the need to add hotplug_mode_update support for all
> compositors as traditionally this niche feature has fallen on
> virtualized driver developers to implement.

Why don't you fix the compositors instead?

I feel like NAK'ing this patch. The code itself is not so much a 
problem, but the commit message. Maybe it resolves problems with 
compositors, but it is a step backwards for the overall ecosystem. If 
the connector changes, your driver should increment the epoch counter. 
[1] That will send a hotplug event to userspace. The EDID alone does not 
say anything about connector status.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.11.8/source/include/drm/drm_connector.h#L1994



>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 172 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |   3 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   2 +
>   3 files changed, 176 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 5a1192496d49..9d9d0b8539dd 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -37,7 +37,6 @@
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_rect.h>
>   #include <drm/drm_sysfs.h>
> -#include <drm/drm_edid.h>
>   
>   void vmw_du_init(struct vmw_display_unit *du)
>   {
> @@ -2662,6 +2661,175 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>   
> +/*
> + * Average pixels per millimeter and centimeter for a circa 2020 display
> + */
> +#define VMW_FAKE_PPMM 4
> +#define VMW_FAKE_PPCM 40
> +
> +static void vmw_mode_to_timing(const struct drm_display_mode *mode,
> +			       struct detailed_timing *timing)
> +{
> +	struct detailed_pixel_timing *dpt = &timing->data.pixel_data;
> +
> +	const u8 hblank = (mode->htotal - mode->hdisplay);
> +	const u8 hfront = (mode->hsync_start - mode->hdisplay);
> +	const u8 hsync  = (mode->hsync_end - mode->hsync_start);
> +
> +	const u8 vblank = (mode->vtotal - mode->vdisplay);
> +	const u8 vfront = (mode->vsync_start - mode->vdisplay);
> +	const u8 vsync  = (mode->vsync_end - mode->vsync_start);
> +
> +	const unsigned int wmm = mode->hdisplay / VMW_FAKE_PPMM;
> +	const unsigned int hmm = mode->vdisplay / VMW_FAKE_PPMM;
> +
> +	timing->pixel_clock = mode->clock / 10;
> +	memset(dpt, 0, sizeof(*dpt));
> +
> +	// horizontal
> +	dpt->hactive_lo = mode->hdisplay & 0xFF;
> +	dpt->hblank_lo = hblank & 0xFF;
> +
> +	dpt->hactive_hblank_hi |= (mode->hdisplay >> 4) & 0xF0;
> +	dpt->hactive_hblank_hi |= (hblank >> 8) & 0x0F;
> +
> +	dpt->hsync_offset_lo      = hfront & 0xFF;
> +	dpt->hsync_pulse_width_lo =  hsync & 0xFF;
> +
> +	dpt->hsync_vsync_offset_pulse_width_hi |= (hfront >> 2) & 0xC0;
> +	dpt->hsync_vsync_offset_pulse_width_hi |= (hsync  >> 4) & 0x30;
> +
> +	// vertical
> +	dpt->vactive_lo = mode->vdisplay & 0xFF;
> +	dpt->vactive_vblank_hi |= (mode->vdisplay >> 4) & 0xF0;
> +
> +	dpt->vblank_lo = vblank & 0xFF;
> +	dpt->vactive_vblank_hi |= (vblank >> 8) & 0x0F;
> +
> +	dpt->vsync_offset_pulse_width_lo |= (vfront & 0x0F) << 4;
> +	dpt->vsync_offset_pulse_width_lo |= (vsync  & 0x0F) << 0;
> +
> +	dpt->hsync_vsync_offset_pulse_width_hi |= (vfront >> 4) & 0x0C;
> +	dpt->hsync_vsync_offset_pulse_width_hi |= (vsync  >> 8) & 0x03;
> +
> +	// physical sizes
> +	dpt->width_mm_lo  = wmm & 0xFF;
> +	dpt->height_mm_lo = hmm & 0xFF;
> +	dpt->width_height_mm_hi |= (wmm >> 4) & 0xF0;
> +	dpt->width_height_mm_hi |= (hmm >> 8) & 0x0F;
> +
> +	dpt->hborder = 0;
> +	dpt->vborder = 0;
> +	dpt->misc |= 0x18;
> +	dpt->misc |= (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0x2 : 0;
> +	dpt->misc |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0x4 : 0;
> +}
> +
> +/* Our encoded Plug & Play ID
> + * See: https://uefi.org/PNP_ACPI_Registry and https://uefi.org/PNP_ID_List
> + */
> +static inline __be16 vmw_pnp_id(void)
> +{
> +	return cpu_to_be16((('V' - '@') << 10) |
> +			   (('M' - '@') <<  5) |
> +			   (('W' - '@') <<  0));
> +}
> +
> +/*
> + * Fills in the fake EDID using the preferred mode.
> + * See 'Vesa Enhanced EDID Standard Release A Revision 2' and
> + * 'VESA DMT Standard Version 1.0 Revision 13'.
> + */
> +static void vmw_fill_fake_edid(const struct drm_display_mode *pref_mode,
> +			       unsigned int unit, struct edid *e)
> +{
> +	int checksum = 0;
> +
> +	/*
> +	 * Bump the manufacture week ever time we fill the edid so that
> +	 * it will change on every hotplug. This way even if the screen
> +	 * size does not change userspace will rescan the connector. A
> +	 * hotplug with no changes in resolution is likely a multi-mon change
> +	 * and the suggested_X/Y will have changed and we want userspace to
> +	 * pick up this. Use this field to only fill the constant data once
> +	 * by checking for zero.
> +	 */
> +	if (e->mfg_week++ == 0) {
> +		memset(e->header + 1, 0xFF, 6);
> +
> +		e->product_id.manufacturer_name = vmw_pnp_id();
> +		e->mfg_year = 32; // 2022
> +
> +		e->prod_code[0] = 'V';
> +		e->prod_code[1] = 'M';
> +		e->serial = 0xABC0 | unit;
> +
> +		e->version = 1;
> +		e->revision = 4;
> +
> +		e->input = 0xA0;
> +		e->gamma = 120; // 2.20
> +		e->features = 0x26;
> +
> +		// Standard sRGB color space
> +		e->red_green_lo = 0xEE;
> +		e->blue_white_lo = 0x91;
> +		e->red_x = 0xA3;
> +		e->red_y = 0x54;
> +		e->green_x = 0x4C;
> +		e->green_y = 0x99;
> +		e->blue_x  = 0x26;
> +		e->blue_y  = 0x0F;
> +		e->white_x = 0x50;
> +		e->white_y = 0x54;
> +
> +		e->established_timings.t1 = 0x21;
> +		e->established_timings.t2 = 0x08;
> +
> +		e->standard_timings[0].hsize = 0x81;
> +		e->standard_timings[0].vfreq_aspect =  0xC0; // 720p60
> +
> +		e->standard_timings[1].hsize = 0xD1;
> +		e->standard_timings[1].vfreq_aspect =  0xC0; // 1080p60
> +
> +		e->standard_timings[2].hsize = 0x81;
> +		e->standard_timings[2].vfreq_aspect =  0x80; // 1280x1024@60
> +
> +		e->standard_timings[3].hsize = 0xD1;
> +		e->standard_timings[3].vfreq_aspect =  0x40; // 1920x1440@60
> +
> +		e->standard_timings[4].hsize = 0xE1;
> +		e->standard_timings[4].vfreq_aspect =  0xC0; // 2048x1152@60
> +
> +		e->standard_timings[5].hsize = 0xA9;
> +		e->standard_timings[5].vfreq_aspect =  0x40; // 1600x1200@60
> +
> +		e->standard_timings[6].hsize = 0xB3;
> +		e->standard_timings[6].vfreq_aspect =  0x00; // 2048x1152@60
> +
> +		e->standard_timings[7].hsize = 0x95;
> +		e->standard_timings[7].vfreq_aspect =  0x00; // 1440x900@60
> +
> +		e->detailed_timings[1].data.other_data.type = EDID_DETAIL_MONITOR_NAME;
> +		memcpy(e->detailed_timings[1].data.other_data.data.str.str,
> +		       "VMware Screen", 13);
> +
> +		e->detailed_timings[2].data.other_data.type = 0x10;
> +		e->detailed_timings[3].data.other_data.type = 0x10;
> +
> +		e->extensions = 0;
> +	}
> +	e->width_cm = DIV_ROUND_CLOSEST(pref_mode->hdisplay, VMW_FAKE_PPCM);
> +	e->height_cm = DIV_ROUND_CLOSEST(pref_mode->vdisplay, VMW_FAKE_PPCM);
> +	// This is the preferred/native mode
> +	vmw_mode_to_timing(pref_mode, &e->detailed_timings[0]);
> +
> +	for (int i = 0; i < sizeof(struct edid) - 1; i++)
> +		checksum += ((u8 *)e)[i];
> +
> +	e->checksum = 0x100 - checksum;
> +}
> +
>   /*
>    * Common modes not present in the VESA DMT standard or assigned a VIC.
>    */
> @@ -2699,6 +2867,8 @@ int vmw_connector_get_modes(struct drm_connector *connector)
>   	drm_mode_probed_add(connector, mode);
>   	num_modes++;
>   	drm_dbg_kms(dev, "preferred mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> +	vmw_fill_fake_edid(mode, du->unit, &du->fake_edid);
> +	drm_connector_update_edid_property(connector, &du->fake_edid);
>   
>   	/* Probe connector for all modes not exceeding our geom limits */
>   	max_width  = dev_priv->texture_max_width;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> index 6a8bb60c507d..56c739d78582 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -32,6 +32,7 @@
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_edid.h>
>   
>   #include "vmwgfx_drv.h"
>   
> @@ -363,6 +364,8 @@ struct vmw_display_unit {
>   	unsigned pref_height;
>   	bool pref_active;
>   
> +	struct edid fake_edid;
> +
>   	/*
>   	 * Gui positioning
>   	 */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index 82d18b88f4a7..3defdf00a975 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -1631,6 +1631,8 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
>   	drm_object_attach_property(&connector->base,
>   				   dev->mode_config.suggested_y_property, 0);
>   
> +	drm_connector_attach_edid_property(connector);
> +
>   	vmw_du_init(&stdu->base);
>   
>   	return 0;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

