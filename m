Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198348A4DF5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BBA112470;
	Mon, 15 Apr 2024 11:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="N/daYe0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hCbThtKa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N/daYe0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hCbThtKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F0112470
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:45:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A6755CEEA;
 Mon, 15 Apr 2024 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713181507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c8ZbICDBV/VWSyvx9qGOW0N4rXGDuH+dPBPz4KudWUg=;
 b=N/daYe0tlJqWOeiFwhSkV/VTilvRtEYOOSo6fp70RqLrtcIzS1AD3F0HzJP/GCO/ULoWUZ
 YTWY1uI0xnNL0oLi357tzR+w1IySWlLlsXUXcB1jByojBcFOIpKULS1/dJBH4xxteltNWR
 UWiENPbLujis239xVtBSJ01aqeQXDSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713181507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c8ZbICDBV/VWSyvx9qGOW0N4rXGDuH+dPBPz4KudWUg=;
 b=hCbThtKarGS+AdBXWcIlOSHER9in3kDlltJO224EpIflzHAaKaP50fsDYDC1Q3cSjb9c9M
 UJgfBAlhYsTo1+Cg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="N/daYe0t";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hCbThtKa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713181507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c8ZbICDBV/VWSyvx9qGOW0N4rXGDuH+dPBPz4KudWUg=;
 b=N/daYe0tlJqWOeiFwhSkV/VTilvRtEYOOSo6fp70RqLrtcIzS1AD3F0HzJP/GCO/ULoWUZ
 YTWY1uI0xnNL0oLi357tzR+w1IySWlLlsXUXcB1jByojBcFOIpKULS1/dJBH4xxteltNWR
 UWiENPbLujis239xVtBSJ01aqeQXDSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713181507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c8ZbICDBV/VWSyvx9qGOW0N4rXGDuH+dPBPz4KudWUg=;
 b=hCbThtKarGS+AdBXWcIlOSHER9in3kDlltJO224EpIflzHAaKaP50fsDYDC1Q3cSjb9c9M
 UJgfBAlhYsTo1+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E157B1368B;
 Mon, 15 Apr 2024 11:45:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vq1oNUITHWY6bQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Apr 2024 11:45:06 +0000
Message-ID: <e13df911-c91d-491a-97d8-ca0e1cd0eed0@suse.de>
Date: Mon, 15 Apr 2024 13:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gma500: Remove lid code
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: Enrico Bartky <enrico.bartky@gmail.com>
References: <20240415112731.31841-1-patrik.r.jakobsson@gmail.com>
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
In-Reply-To: <20240415112731.31841-1-patrik.r.jakobsson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FREEMAIL_CC(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCPT_COUNT_THREE(0.00)[3];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0A6755CEEA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Am 15.04.24 um 13:27 schrieb Patrik Jakobsson:
> Due to a change in the order of initialization, the lid timer got
> started before proper setup was made. This resulted in a crash during
> boot.
>
> The lid switch is handled by gma500 through a timer that periodically
> polls the opregion for changes. These types of ACPI events shouldn't be
> handled by the graphics driver so let's get rid of the lid code.  This
> fixes the crash during boot.
>
> Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev emulation")
> Cc: Enrico Bartky <enrico.bartky@gmail.com>

The patch deserves a Reported-by: from Enrico.

With this fixed:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
>   drivers/gpu/drm/gma500/Makefile     |  1 -
>   drivers/gpu/drm/gma500/psb_device.c |  5 +-
>   drivers/gpu/drm/gma500/psb_drv.h    |  9 ----
>   drivers/gpu/drm/gma500/psb_lid.c    | 80 -----------------------------
>   4 files changed, 1 insertion(+), 94 deletions(-)
>   delete mode 100644 drivers/gpu/drm/gma500/psb_lid.c
>
> diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
> index 4f302cd5e1a6..58fed80c7392 100644
> --- a/drivers/gpu/drm/gma500/Makefile
> +++ b/drivers/gpu/drm/gma500/Makefile
> @@ -34,7 +34,6 @@ gma500_gfx-y += \
>   	  psb_intel_lvds.o \
>   	  psb_intel_modes.o \
>   	  psb_intel_sdvo.o \
> -	  psb_lid.o \
>   	  psb_irq.o
>   
>   gma500_gfx-$(CONFIG_ACPI) +=  opregion.o
> diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
> index dcfcd7b89d4a..6dece8f0e380 100644
> --- a/drivers/gpu/drm/gma500/psb_device.c
> +++ b/drivers/gpu/drm/gma500/psb_device.c
> @@ -73,8 +73,7 @@ static int psb_backlight_setup(struct drm_device *dev)
>   	}
>   
>   	psb_intel_lvds_set_brightness(dev, PSB_MAX_BRIGHTNESS);
> -	/* This must occur after the backlight is properly initialised */
> -	psb_lid_timer_init(dev_priv);
> +
>   	return 0;
>   }
>   
> @@ -259,8 +258,6 @@ static int psb_chip_setup(struct drm_device *dev)
>   
>   static void psb_chip_teardown(struct drm_device *dev)
>   {
> -	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -	psb_lid_timer_takedown(dev_priv);
>   	gma_intel_teardown_gmbus(dev);
>   }
>   
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index c5edfa4aa4cc..83c17689c454 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -162,7 +162,6 @@
>   #define PSB_NUM_VBLANKS 2
>   
>   #define PSB_WATCHDOG_DELAY (HZ * 2)
> -#define PSB_LID_DELAY (HZ / 10)
>   
>   #define PSB_MAX_BRIGHTNESS		100
>   
> @@ -491,11 +490,7 @@ struct drm_psb_private {
>   	/* Hotplug handling */
>   	struct work_struct hotplug_work;
>   
> -	/* LID-Switch */
> -	spinlock_t lid_lock;
> -	struct timer_list lid_timer;
>   	struct psb_intel_opregion opregion;
> -	u32 lid_last_state;
>   
>   	/* Watchdog */
>   	uint32_t apm_reg;
> @@ -591,10 +586,6 @@ struct psb_ops {
>   	int i2c_bus;		/* I2C bus identifier for Moorestown */
>   };
>   
> -/* psb_lid.c */
> -extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
> -extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
> -
>   /* modesetting */
>   extern void psb_modeset_init(struct drm_device *dev);
>   extern void psb_modeset_cleanup(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/gma500/psb_lid.c
> deleted file mode 100644
> index 58a7fe392636..000000000000
> --- a/drivers/gpu/drm/gma500/psb_lid.c
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/**************************************************************************
> - * Copyright (c) 2007, Intel Corporation.
> - *
> - * Authors: Thomas Hellstrom <thomas-at-tungstengraphics-dot-com>
> - **************************************************************************/
> -
> -#include <linux/spinlock.h>
> -
> -#include "psb_drv.h"
> -#include "psb_intel_reg.h"
> -#include "psb_reg.h"
> -
> -static void psb_lid_timer_func(struct timer_list *t)
> -{
> -	struct drm_psb_private *dev_priv = from_timer(dev_priv, t, lid_timer);
> -	struct drm_device *dev = (struct drm_device *)&dev_priv->dev;
> -	struct timer_list *lid_timer = &dev_priv->lid_timer;
> -	unsigned long irq_flags;
> -	u32 __iomem *lid_state = dev_priv->opregion.lid_state;
> -	u32 pp_status;
> -
> -	if (readl(lid_state) == dev_priv->lid_last_state)
> -		goto lid_timer_schedule;
> -
> -	if ((readl(lid_state)) & 0x01) {
> -		/*lid state is open*/
> -		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) | POWER_TARGET_ON);
> -		do {
> -			pp_status = REG_READ(PP_STATUS);
> -		} while ((pp_status & PP_ON) == 0 &&
> -			 (pp_status & PP_SEQUENCE_MASK) != 0);
> -
> -		if (REG_READ(PP_STATUS) & PP_ON) {
> -			/*FIXME: should be backlight level before*/
> -			psb_intel_lvds_set_brightness(dev, 100);
> -		} else {
> -			DRM_DEBUG("LVDS panel never powered up");
> -			return;
> -		}
> -	} else {
> -		psb_intel_lvds_set_brightness(dev, 0);
> -
> -		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) & ~POWER_TARGET_ON);
> -		do {
> -			pp_status = REG_READ(PP_STATUS);
> -		} while ((pp_status & PP_ON) == 0);
> -	}
> -	dev_priv->lid_last_state =  readl(lid_state);
> -
> -lid_timer_schedule:
> -	spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
> -	if (!timer_pending(lid_timer)) {
> -		lid_timer->expires = jiffies + PSB_LID_DELAY;
> -		add_timer(lid_timer);
> -	}
> -	spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
> -}
> -
> -void psb_lid_timer_init(struct drm_psb_private *dev_priv)
> -{
> -	struct timer_list *lid_timer = &dev_priv->lid_timer;
> -	unsigned long irq_flags;
> -
> -	spin_lock_init(&dev_priv->lid_lock);
> -	spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
> -
> -	timer_setup(lid_timer, psb_lid_timer_func, 0);
> -
> -	lid_timer->expires = jiffies + PSB_LID_DELAY;
> -
> -	add_timer(lid_timer);
> -	spin_unlock_irqrestore(&dev_priv->lid_lock, irq_flags);
> -}
> -
> -void psb_lid_timer_takedown(struct drm_psb_private *dev_priv)
> -{
> -	del_timer_sync(&dev_priv->lid_timer);
> -}
> -

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

