Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE39B51957
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B833410E927;
	Wed, 10 Sep 2025 14:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xV2KzPTR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fVU4KNuQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xV2KzPTR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fVU4KNuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3221610E927
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 14:29:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7EA734F76;
 Wed, 10 Sep 2025 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757514539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=STEYXq0PiTKCTbYq+9bwR8FuphZ7UPvu2jna0DsGEw4=;
 b=xV2KzPTRVVNzC6JCCySbL+g7FSoQ93jem2phEHSK2Zg06B31CXhuMNw3E4mBXwX1YW+fYw
 KtXL3FubtbfWxu4+MB5qmKZwxge24zPss0cnWnJ9kSerhGvOPCrD7LgdNEljH9CUe0dTtN
 g3VtMSGZQQOSIQNxvFJq3sRmc1deSzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757514539;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=STEYXq0PiTKCTbYq+9bwR8FuphZ7UPvu2jna0DsGEw4=;
 b=fVU4KNuQWZyZ8VW7qTgSGxcnVEld56dVZmrrcmM4+C4TVjuM1bCOwkAjO1+FbxWPcC0mbI
 yLB7d1e5JgInH3Dg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xV2KzPTR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fVU4KNuQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757514539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=STEYXq0PiTKCTbYq+9bwR8FuphZ7UPvu2jna0DsGEw4=;
 b=xV2KzPTRVVNzC6JCCySbL+g7FSoQ93jem2phEHSK2Zg06B31CXhuMNw3E4mBXwX1YW+fYw
 KtXL3FubtbfWxu4+MB5qmKZwxge24zPss0cnWnJ9kSerhGvOPCrD7LgdNEljH9CUe0dTtN
 g3VtMSGZQQOSIQNxvFJq3sRmc1deSzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757514539;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=STEYXq0PiTKCTbYq+9bwR8FuphZ7UPvu2jna0DsGEw4=;
 b=fVU4KNuQWZyZ8VW7qTgSGxcnVEld56dVZmrrcmM4+C4TVjuM1bCOwkAjO1+FbxWPcC0mbI
 yLB7d1e5JgInH3Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C92013310;
 Wed, 10 Sep 2025 14:28:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iRCaDCuLwWieIwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Sep 2025 14:28:59 +0000
Message-ID: <02f7455e-d1b3-414b-a4cb-27b9353a4034@suse.de>
Date: Wed, 10 Sep 2025 16:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] DRM: Add a new 'boot_display' attribute
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-5-superm1@kernel.org>
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
In-Reply-To: <20250811162606.587759-5-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[13]; MIME_TRACE(0.00)[0:+];
 TO_DN_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, gitlab.freedesktop.org:url, suse.de:mid,
 suse.de:dkim, suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B7EA734F76
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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



Am 11.08.25 um 18:26 schrieb Mario Limonciello (AMD):
> On systems with multiple GPUs there can be uncertainty which GPU is the
> primary one used to drive the display at bootup. In some desktop
> environments this can lead to increased power consumption because
> secondary GPUs may be used for rendering and never go to a low power
> state. In order to disambiguate this add a new sysfs attribute
> 'boot_display' that uses the output of video_is_primary_device() to
> populate whether the PCI device was used for driving the display.
>
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/issues/23
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> v10:
>   * Rebase on 6.17-rc1
>   * Drop Thomas' tag, as this is now in a totally different subsystem
>     (although same code)
>   * Squash "Adjust visibility of boot_display attribute instead of creation"
>   * Squash "PCI: Move boot display attribute to DRM"
> ---
>   Documentation/ABI/testing/sysfs-class-drm |  8 +++++
>   drivers/gpu/drm/drm_sysfs.c               | 41 +++++++++++++++++++++++
>   2 files changed, 49 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-drm
>
> diff --git a/Documentation/ABI/testing/sysfs-class-drm b/Documentation/ABI/testing/sysfs-class-drm
> new file mode 100644
> index 0000000000000..d23fed5e29a74
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-drm
> @@ -0,0 +1,8 @@
> +What:		/sys/class/drm/.../boot_display
> +Date:		January 2026
> +Contact:	Linux DRI developers <dri-devel@vger.kernel.org>
> +Description:
> +		This file indicates that displays connected to the device were
> +		used to display the boot sequence.  If a display connected to
> +		the device was used to display the boot sequence the file will
> +		be present and contain "1".
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index a455c56dbbeb7..b01ffa4d65098 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -18,6 +18,7 @@
>   #include <linux/gfp.h>
>   #include <linux/i2c.h>
>   #include <linux/kdev_t.h>
> +#include <linux/pci.h>
>   #include <linux/property.h>
>   #include <linux/slab.h>
>   
> @@ -30,6 +31,8 @@
>   #include <drm/drm_property.h>
>   #include <drm/drm_sysfs.h>
>   
> +#include <asm/video.h>
> +
>   #include "drm_internal.h"
>   #include "drm_crtc_internal.h"
>   
> @@ -508,6 +511,43 @@ void drm_sysfs_connector_property_event(struct drm_connector *connector,
>   }
>   EXPORT_SYMBOL(drm_sysfs_connector_property_event);
>   
> +static ssize_t boot_display_show(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +static DEVICE_ATTR_RO(boot_display);
> +
> +static struct attribute *display_attrs[] = {
> +	&dev_attr_boot_display.attr,
> +	NULL
> +};
> +
> +static umode_t boot_display_visible(struct kobject *kobj,
> +				    struct attribute *a, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj)->parent;
> +
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +
> +		if (video_is_primary_device(&pdev->dev))
> +			return a->mode;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group display_attr_group = {
> +	.attrs = display_attrs,
> +	.is_visible = boot_display_visible,
> +};
> +
> +static const struct attribute_group *card_dev_groups[] = {
> +	&display_attr_group,
> +	NULL
> +};
> +
>   struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>   {
>   	const char *minor_str;
> @@ -531,6 +571,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>   
>   		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
>   		kdev->class = drm_class;
> +		kdev->groups = card_dev_groups;
>   		kdev->type = &drm_sysfs_device_minor;
>   	}
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


