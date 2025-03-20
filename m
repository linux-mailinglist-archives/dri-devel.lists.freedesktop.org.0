Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E575A6A6E0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B0B10E39F;
	Thu, 20 Mar 2025 13:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HyU1GVqm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+OiMCGon";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HyU1GVqm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+OiMCGon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B21C10E39F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:08:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D5BB1F388;
 Thu, 20 Mar 2025 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742476137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AA3fSZzTMyClFf196LP7i5hu2aMtdsRCXs1lMOOLSw8=;
 b=HyU1GVqmyxuiXmMpcCYdf9G0FnGJQHxY4FWMRC+LlYHvhWf8nzAWaE9IvE6nrfGT5UFOQ5
 rI1kLSS58faeuddOOQj5lMJ4tu9SGfSzpejsiUP4IJxCAQfsg+nFiKRZP6opNmIheT8gkT
 9oODmhOFXctd6550vo+XFgHpB0sF3ZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742476137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AA3fSZzTMyClFf196LP7i5hu2aMtdsRCXs1lMOOLSw8=;
 b=+OiMCGon+ZM6z9UhfFSKAe3K76Mg5xpLEd4RlgUX1+Vdrr6FXfQNX52YPJlqf/PN4qjFQL
 4BGzSIWXPfU7qIAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742476137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AA3fSZzTMyClFf196LP7i5hu2aMtdsRCXs1lMOOLSw8=;
 b=HyU1GVqmyxuiXmMpcCYdf9G0FnGJQHxY4FWMRC+LlYHvhWf8nzAWaE9IvE6nrfGT5UFOQ5
 rI1kLSS58faeuddOOQj5lMJ4tu9SGfSzpejsiUP4IJxCAQfsg+nFiKRZP6opNmIheT8gkT
 9oODmhOFXctd6550vo+XFgHpB0sF3ZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742476137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AA3fSZzTMyClFf196LP7i5hu2aMtdsRCXs1lMOOLSw8=;
 b=+OiMCGon+ZM6z9UhfFSKAe3K76Mg5xpLEd4RlgUX1+Vdrr6FXfQNX52YPJlqf/PN4qjFQL
 4BGzSIWXPfU7qIAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D687B139D2;
 Thu, 20 Mar 2025 13:08:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9PLwMmgT3Gc7QwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Mar 2025 13:08:56 +0000
Message-ID: <52c88e06-9a13-4784-89b1-3d0037872054@suse.de>
Date: Thu, 20 Mar 2025 14:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] drm/sysfb: ofdrm: Add EDID support
To: Jani Nikula <jani.nikula@linux.intel.com>, javierm@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-13-tzimmermann@suse.de> <87a59fdfx5.fsf@intel.com>
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
In-Reply-To: <87a59fdfx5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,redhat.com,ffwll.ch,gmail.com,kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
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

Am 20.03.25 um 13:50 schrieb Jani Nikula:
> On Wed, 19 Mar 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Add EDID support to sysfb connector helpers. Read the EDID property
>> from the OF node in ofdrm. Without EDID, this does nothing.
>>
>> Some systems with OF display, such as 32-bit PPC Macintoshs, provide
>> the system display's EDID data as node property in their DT. Exporting
>> this information allows compositors to implement correct DPI and
>> meaningful color management.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 29 ++++++++++++++++++++++++
>>   drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  2 ++
>>   drivers/gpu/drm/sysfb/ofdrm.c            | 20 ++++++++++++++++
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
>> index b48e06b25305..cb65c618f8d3 100644
>> --- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
>> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
>> @@ -9,6 +9,7 @@
>>   #include <drm/drm_atomic_state_helper.h>
>>   #include <drm/drm_damage_helper.h>
>>   #include <drm/drm_drv.h>
>> +#include <drm/drm_edid.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> @@ -281,10 +282,38 @@ EXPORT_SYMBOL(drm_sysfb_crtc_atomic_destroy_state);
>>    * Connector
>>    */
>>   
>> +static int drm_sysfb_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>> +{
>> +	const u8 *edid = data;
>> +	size_t off = block * EDID_LENGTH;
>> +	size_t end = off + len;
>> +
>> +	if (!edid)
>> +		return -1;
>> +	if (end > EDID_LENGTH)
>> +		return -1;
> Nitpick, I guess -1 is used elsewhere, but I think I'd prefer actual
> error codes even if they're not currently propagated. It's just cleaner.

Sure. Somehow I was under the impression that errno codes wouldn't be 
welcome here.

>
>> +	memcpy(buf, &edid[off], len);
>> +
>> +	return 0;
>> +}
>> +
>>   int drm_sysfb_connector_helper_get_modes(struct drm_connector *connector)
>>   {
>>   	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
>> +	const struct drm_edid *drm_edid;
>> +
>> +	if (sysfb->edid) {
>> +		drm_edid = drm_edid_read_custom(connector, drm_sysfb_get_edid_block,
>> +						(void *)sysfb->edid);
> Nitpick, the (void *) cast is superfluous.

This is a const cast.

>
>> +		if (drm_edid) {
>> +			drm_edid_connector_update(connector, drm_edid);
>> +			drm_edid_free(drm_edid);
>> +		} else {
>> +			drm_edid_connector_update(connector, NULL);
>> +		}
> Nitpick, the above could just be
>
> 		drm_edid_connector_update(connector, drm_edid);
> 		drm_edid_free(drm_edid);
>
> without the if.

Make sense.

>
>
> Despite the nitpicks, overall LGTM.

Thanks for reviewing.

Since I have your attention and you're knowledgeable wrt EDID: byte 20 
of the EDID header indicates the type of output (analog, HDMI, DP, etc). 
I intent to use this for setting the connector type to something better 
then UNKNOWN. Does that make sense?

Best regards
Thomas

>
> BR,
> Jani.
>
>
>> +	}
>>   
>> +	/* Return the fixed mode even with EDID */
>>   	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
>>   }
>>   EXPORT_SYMBOL(drm_sysfb_connector_helper_get_modes);
>> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
>> index 45e396bf74b7..3684bd0ef085 100644
>> --- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
>> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
>> @@ -24,6 +24,8 @@ struct drm_display_mode drm_sysfb_mode(unsigned int width,
>>   struct drm_sysfb_device {
>>   	struct drm_device dev;
>>   
>> +	const u8 *edid; /* can be NULL */
>> +
>>   	/* hardware settings */
>>   	struct drm_display_mode fb_mode;
>>   	const struct drm_format_info *fb_format;
>> diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
>> index 71e661ba9329..86c1a0c80ceb 100644
>> --- a/drivers/gpu/drm/sysfb/ofdrm.c
>> +++ b/drivers/gpu/drm/sysfb/ofdrm.c
>> @@ -12,6 +12,7 @@
>>   #include <drm/drm_damage_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_drv.h>
>> +#include <drm/drm_edid.h>
>>   #include <drm/drm_fbdev_shmem.h>
>>   #include <drm/drm_format_helper.h>
>>   #include <drm/drm_framebuffer.h>
>> @@ -227,6 +228,16 @@ static u64 display_get_address_of(struct drm_device *dev, struct device_node *of
>>   	return address;
>>   }
>>   
>> +static const u8 *display_get_edid_of(struct drm_device *dev, struct device_node *of_node,
>> +				     u8 buf[EDID_LENGTH])
>> +{
>> +	int ret = of_property_read_u8_array(of_node, "EDID", buf, EDID_LENGTH);
>> +
>> +	if (ret)
>> +		return NULL;
>> +	return buf;
>> +}
>> +
>>   static bool is_avivo(u32 vendor, u32 device)
>>   {
>>   	/* This will match most R5xx */
>> @@ -298,6 +309,8 @@ struct ofdrm_device {
>>   	/* colormap */
>>   	void __iomem *cmap_base;
>>   
>> +	u8 edid[EDID_LENGTH];
>> +
>>   	/* modesetting */
>>   	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
>>   	struct drm_plane primary_plane;
>> @@ -840,6 +853,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>>   	int width, height, depth, linebytes;
>>   	const struct drm_format_info *format;
>>   	u64 address;
>> +	const u8 *edid;
>>   	resource_size_t fb_size, fb_base, fb_pgbase, fb_pgsize;
>>   	struct resource *res, *mem;
>>   	void __iomem *screen_base;
>> @@ -989,6 +1003,9 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>>   		}
>>   	}
>>   
>> +	/* EDID is optional */
>> +	edid = display_get_edid_of(dev, of_node, odev->edid);
>> +
>>   	/*
>>   	 * Firmware framebuffer
>>   	 */
>> @@ -999,6 +1016,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>>   	sysfb->fb_pitch = linebytes;
>>   	if (odev->cmap_base)
>>   		sysfb->fb_gamma_lut_size = OFDRM_GAMMA_LUT_SIZE;
>> +	sysfb->edid = edid;
>>   
>>   	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
>>   	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte\n",
>> @@ -1072,6 +1090,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>>   	drm_connector_set_panel_orientation_with_quirk(connector,
>>   						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
>>   						       width, height);
>> +	if (edid)
>> +		drm_connector_attach_edid_property(connector);
>>   
>>   	ret = drm_connector_attach_encoder(connector, encoder);
>>   	if (ret)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

