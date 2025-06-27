Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE7AEAFC4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82E310E96B;
	Fri, 27 Jun 2025 07:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="N4clLfve";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9e0Qp7+3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N4clLfve";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9e0Qp7+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0598D10E31B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:07:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6DB72115E;
 Fri, 27 Jun 2025 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751008044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AdkxMVDSJWtTtdI/CdPCfFHzTDWWuafm4IIC63NXAiE=;
 b=N4clLfveVEntVpYQmS7c0Hjt0mfpoCR0618wRQYDmzU3rgWHhmJzS0kFlg8HXR/1xeKZiG
 yMm3CU6C9eHzFVMmCYbnpQ1KZU5G58Ki4HCiczx0xJLN93mGexxBikbSWjJXoZl5gyOPNQ
 JxjsLZNXtN1xf4iA2bcwN8xzc9qdjiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751008044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AdkxMVDSJWtTtdI/CdPCfFHzTDWWuafm4IIC63NXAiE=;
 b=9e0Qp7+3qCk9LerBZH9omPu8JAOkFWwCpo9iEX/PBWEzaD3dbr385UXCzQTp9SxacTlcRm
 X1DQ4p+2S2CeqbCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751008044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AdkxMVDSJWtTtdI/CdPCfFHzTDWWuafm4IIC63NXAiE=;
 b=N4clLfveVEntVpYQmS7c0Hjt0mfpoCR0618wRQYDmzU3rgWHhmJzS0kFlg8HXR/1xeKZiG
 yMm3CU6C9eHzFVMmCYbnpQ1KZU5G58Ki4HCiczx0xJLN93mGexxBikbSWjJXoZl5gyOPNQ
 JxjsLZNXtN1xf4iA2bcwN8xzc9qdjiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751008044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AdkxMVDSJWtTtdI/CdPCfFHzTDWWuafm4IIC63NXAiE=;
 b=9e0Qp7+3qCk9LerBZH9omPu8JAOkFWwCpo9iEX/PBWEzaD3dbr385UXCzQTp9SxacTlcRm
 X1DQ4p+2S2CeqbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EE24138A7;
 Fri, 27 Jun 2025 07:07:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id saxrAixDXmjQQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jun 2025 07:07:24 +0000
Message-ID: <41587824-4a05-4ead-b24c-4729007cd663@suse.de>
Date: Fri, 27 Jun 2025 09:07:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] PCI: Add a new 'boot_display' attribute
To: Mario Limonciello <superm1@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250627043108.3141206-1-superm1@kernel.org>
 <20250627043108.3141206-10-superm1@kernel.org>
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
In-Reply-To: <20250627043108.3141206-10-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,wunner.de,linux.intel.com,kernel.org,infradead.org,8bytes.org,arm.com,redhat.com,perex.cz,suse.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,nvidia.com];
 RCPT_COUNT_TWELVE(0.00)[25]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_ALL(0.00)[]; DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 27.06.25 um 06:31 schrieb Mario Limonciello:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> On systems with multiple GPUs there can be uncertainty which GPU is the
> primary one used to drive the display at bootup. In order to disambiguate
> this add a new sysfs attribute 'boot_display' that uses the output of
> video_is_primary_device() to populate whether a PCI device was used for
> driving the display.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v6:
>   * Only show for the device that is boot display
>   * Only create after PCI device sysfs files are initialized to ensure
>     that resources are ready.
> v4:
>   * new patch
> ---
>   Documentation/ABI/testing/sysfs-bus-pci |  8 +++++
>   drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++++++

The code looks good. Just one more question: could this be added 
independently from the PCI bus (at a reasonable cost)? There are other 
busses that can host the boot display. Alternatively, we'd add this 
attribute per bus as needed.

Best regards
Thomas

>   2 files changed, 54 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
> index 69f952fffec72..8b455b1a58852 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci
> +++ b/Documentation/ABI/testing/sysfs-bus-pci
> @@ -612,3 +612,11 @@ Description:
>   
>   		  # ls doe_features
>   		  0001:01        0001:02        doe_discovery
> +
> +What:		/sys/bus/pci/devices/.../boot_display
> +Date:		October 2025
> +Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
> +Description:
> +		This file indicates the device was used as a boot
> +		display. If the device was used as the boot display, the file
> +		will be present and contain "1".
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 268c69daa4d57..cc766461de1da 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -30,6 +30,7 @@
>   #include <linux/msi.h>
>   #include <linux/of.h>
>   #include <linux/aperture.h>
> +#include <asm/video.h>
>   #include "pci.h"
>   
>   #ifndef ARCH_PCI_DEV_GROUPS
> @@ -679,6 +680,13 @@ const struct attribute_group *pcibus_groups[] = {
>   	NULL,
>   };
>   
> +static ssize_t boot_display_show(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +static DEVICE_ATTR_RO(boot_display);
> +
>   static ssize_t boot_vga_show(struct device *dev, struct device_attribute *attr,
>   			     char *buf)
>   {
> @@ -1246,6 +1254,37 @@ static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
>   	return 0;
>   }
>   
> +/**
> + * pci_create_boot_display_file - create a file in sysfs for @dev
> + * @pdev: dev in question
> + *
> + * Creates a file `boot_display` in sysfs for the PCI device @pdev
> + * if it is the boot display device.
> + */
> +static int pci_create_boot_display_file(struct pci_dev *pdev)
> +{
> +#ifdef CONFIG_VIDEO
> +	if (video_is_primary_device(&pdev->dev))
> +		return sysfs_create_file(&pdev->dev.kobj, &dev_attr_boot_display.attr);
> +#endif
> +	return 0;
> +}
> +
> +/**
> + * pci_remove_boot_display_file - remove the boot display file for @dev
> + * @pdev: dev in question
> + *
> + * Removes the file `boot_display` in sysfs for the PCI device @pdev
> + * if it is the boot display device.
> + */
> +static void pci_remove_boot_display_file(struct pci_dev *pdev)
> +{
> +#ifdef CONFIG_VIDEO
> +	if (video_is_primary_device(&pdev->dev))
> +		sysfs_remove_file(&pdev->dev.kobj, &dev_attr_boot_display.attr);
> +#endif
> +}
> +
>   /**
>    * pci_create_resource_files - create resource files in sysfs for @dev
>    * @pdev: dev in question
> @@ -1654,9 +1693,15 @@ static const struct attribute_group pci_dev_resource_resize_group = {
>   
>   int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev)
>   {
> +	int retval;
> +
>   	if (!sysfs_initialized)
>   		return -EACCES;
>   
> +	retval = pci_create_boot_display_file(pdev);
> +	if (retval)
> +		return retval;
> +
>   	return pci_create_resource_files(pdev);
>   }
>   
> @@ -1671,6 +1716,7 @@ void pci_remove_sysfs_dev_files(struct pci_dev *pdev)
>   	if (!sysfs_initialized)
>   		return;
>   
> +	pci_remove_boot_display_file(pdev);
>   	pci_remove_resource_files(pdev);
>   }
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

