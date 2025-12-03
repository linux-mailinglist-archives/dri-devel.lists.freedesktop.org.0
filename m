Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88671CA04D1
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3323B10E802;
	Wed,  3 Dec 2025 17:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0RON9zjQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6E4NoMFW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zIZbpQdU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="03816KMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5144810E7FB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 17:15:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 047F85BDC4;
 Wed,  3 Dec 2025 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764782138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qfaRP1TVSlb2FrbK+FspbEIhwCAz7AGdQqxTllry70g=;
 b=0RON9zjQQUcyXkzcSd6PcezDf1yKgK/Ut8/ALOylDcZudnwhE5ZMLgJZymPwMHJXs0tYby
 7sNIznibOSxqKloedwLgr8mTAGhy19x18EPgxi3L38sAOU1dyo5Y+gonSwlAvYjhRMXTTQ
 LQev7uTJR0W/2+/UG32QtTXm4WU6JOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764782138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qfaRP1TVSlb2FrbK+FspbEIhwCAz7AGdQqxTllry70g=;
 b=6E4NoMFWK/Q7NquC4XU+Dte2OMgsAnbLIfujK8CZexshhlu0GrI3oz+gqAL0KuQSOS4q/y
 TviK4z0Dr0+xrKCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zIZbpQdU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=03816KMm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764782137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qfaRP1TVSlb2FrbK+FspbEIhwCAz7AGdQqxTllry70g=;
 b=zIZbpQdUqtP8kTwuXgwTUatYT4Tmdiq76Nq7HtrkjnfndThzVjgmcyTyRz/XUUWTP/U6DA
 S1/EaH727Ps+2emEri2IVTszHSjPM+9+baoDbWroYI57CIMt4da3sn9Zhg/KIlN3k0pNYd
 Up4+JXt7lKphpKPsz7ILVjTw7MyhAQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764782137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qfaRP1TVSlb2FrbK+FspbEIhwCAz7AGdQqxTllry70g=;
 b=03816KMmF5c5LOgA6u+PX//aDEaeuQLO7R7Z7tH5LY27zJRTzrC0pQCW/GNXgAvVP+LnGC
 EjjYdDFZIZPz6iBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAB453EA63;
 Wed,  3 Dec 2025 17:15:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8AvlJzhwMGmBPgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Dec 2025 17:15:36 +0000
Message-ID: <64a09b88-5fe2-46ab-861e-9330a66a0459@suse.de>
Date: Wed, 3 Dec 2025 18:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 126/132] drm, fbcon, vga_switcheroo: Avoid race
 condition in fbcon setup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Sasha Levin <sashal@kernel.org>
References: <20251203152343.285859633@linuxfoundation.org>
 <20251203152347.982336576@linuxfoundation.org>
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
In-Reply-To: <20251203152347.982336576@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[suse.com:url,bootlin.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,amd.com:email,lists.freedesktop.org:email,suse.de:email,suse.de:dkim,suse.de:mid,linuxfoundation.org:email];
 FROM_HAS_DN(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, linuxfoundation.org:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, msgid.link:url]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 047F85BDC4
X-Spam-Flag: NO
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

Hi,

thank you for making the updated patch.

Am 03.12.25 um 16:30 schrieb Greg Kroah-Hartman:
> 6.12-stable review patch.  If anyone has any objections, please let me know.
>
> ------------------
>
> From: Thomas Zimmermann <tzimmermann@suse.de>
>
> [ Upstream commit eb76d0f5553575599561010f24c277cc5b31d003 ]
>
> Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
> access in fbcon_remap_all(). Without holding the console lock the call
> races with switching outputs.
>
> VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
> function uses struct fb_info.node, which is set by register_framebuffer().
> As the fb-helper code currently sets up VGA switcheroo before registering
> the framebuffer, the value of node is -1 and therefore not a legal value.
> For example, fbcon uses the value within set_con2fb_map() [1] as an index
> into an array.
>
> Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
> result in VGA switching that does not switch fbcon correctly.
>
> Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
> which already holds the console lock. Fbdev calls fbcon_fb_registered()
> from within register_framebuffer(). Serializes the helper with VGA
> switcheroo's call to fbcon_remap_all().
>
> Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
> as parameter, it really only needs the contained fbcon state. Moving the
> call to fbcon initialization is therefore cleaner than before. Only amdgpu,
> i915, nouveau and radeon support vga_switcheroo. For all other drivers,
> this change does nothing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
> Fixes: 6a9ee8af344e ("vga_switcheroo: initial implementation (v15)")
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v2.6.34+
> Link: https://patch.msgid.link/20251105161549.98836-1-tzimmermann@suse.de
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_fb_helper.c            |    6 ------
>   drivers/gpu/drm/i915/display/intel_fbdev.c |    6 ------
>   drivers/gpu/drm/radeon/radeon_fbdev.c      |    5 -----
>   drivers/video/fbdev/core/fbcon.c           |    9 +++++++++
>   4 files changed, 9 insertions(+), 17 deletions(-)
>
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -30,9 +30,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include <linux/console.h>
> -#include <linux/pci.h>
>   #include <linux/sysrq.h>
> -#include <linux/vga_switcheroo.h>
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_drv.h>
> @@ -1637,10 +1635,6 @@ static int drm_fb_helper_single_fb_probe
>   
>   	strcpy(fb_helper->fb->comm, "[fbcon]");
>   
> -	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
> -	if (dev_is_pci(dev->dev))
> -		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
> -
>   	return 0;
>   }
>   
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -589,11 +589,8 @@ static int intel_fbdev_restore_mode(stru
>   static void intel_fbdev_client_unregister(struct drm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = fb_helper->dev;
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
>   
>   	if (fb_helper->info) {
> -		vga_switcheroo_client_fb_set(pdev, NULL);
>   		drm_fb_helper_unregister_info(fb_helper);
>   	} else {
>   		drm_fb_helper_unprepare(fb_helper);
> @@ -620,7 +617,6 @@ static int intel_fbdev_client_hotplug(st
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   	struct drm_device *dev = client->dev;
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
>   	int ret;
>   
>   	if (dev->fb_helper)
> @@ -634,8 +630,6 @@ static int intel_fbdev_client_hotplug(st
>   	if (ret)
>   		goto err_drm_fb_helper_fini;
>   
> -	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
> -
>   	return 0;
>   
>   err_drm_fb_helper_fini:
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -300,10 +300,8 @@ static void radeon_fbdev_client_unregist
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   	struct drm_device *dev = fb_helper->dev;
> -	struct radeon_device *rdev = dev->dev_private;
>   
>   	if (fb_helper->info) {
> -		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
>   		drm_helper_force_disable_all(dev);
>   		drm_fb_helper_unregister_info(fb_helper);
>   	} else {
> @@ -325,7 +323,6 @@ static int radeon_fbdev_client_hotplug(s
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   	struct drm_device *dev = client->dev;
> -	struct radeon_device *rdev = dev->dev_private;
>   	int ret;
>   
>   	if (dev->fb_helper)
> @@ -342,8 +339,6 @@ static int radeon_fbdev_client_hotplug(s
>   	if (ret)
>   		goto err_drm_fb_helper_fini;
>   
> -	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
> -
>   	return 0;
>   
>   err_drm_fb_helper_fini:
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -65,6 +65,7 @@
>   #include <linux/string.h>
>   #include <linux/kd.h>
>   #include <linux/panic.h>
> +#include <linux/pci.h>
>   #include <linux/printk.h>
>   #include <linux/slab.h>
>   #include <linux/fb.h>
> @@ -77,6 +78,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/crc32.h> /* For counting font checksums */
>   #include <linux/uaccess.h>
> +#include <linux/vga_switcheroo.h>
>   #include <asm/irq.h>
>   
>   #include "fbcon.h"
> @@ -2894,6 +2896,9 @@ void fbcon_fb_unregistered(struct fb_inf
>   
>   	console_lock();
>   
> +	if (info->device && dev_is_pci(info->device))
> +		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
> +
>   	fbcon_registered_fb[info->node] = NULL;
>   	fbcon_num_registered_fb--;
>   
> @@ -3027,6 +3032,10 @@ static int do_fb_registered(struct fb_in
>   		}
>   	}
>   
> +	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
> +	if (info->device && dev_is_pci(info->device))
> +		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
> +
>   	return ret;
>   }
>   
>
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


