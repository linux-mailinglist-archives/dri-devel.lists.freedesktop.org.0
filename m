Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFCAE16A3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 10:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C01D10E00F;
	Fri, 20 Jun 2025 08:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ps+yobF3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2KO7IdIn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ps+yobF3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2KO7IdIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEDC10E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 08:47:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF4E01F7E5;
 Fri, 20 Jun 2025 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750409230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZLa5X7wxdWQ6+syLonbvAplc7z5SeBdYIpHos8aUDtw=;
 b=ps+yobF3zHkdTu2iEURYTuyXHsEoh31LJwYLDN9XYUu48IK5m4q6Dcc3x89jQCPg3Unhzs
 2TA2XFexBPzNnrW4GY9PifIZzgyxVSCrRvl4Y+flsWUlLjjC6mFvsj25qI4ptf3U19FNiT
 24CYC/UYDphLDDTYrnYu7iFdYz/iKTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750409230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZLa5X7wxdWQ6+syLonbvAplc7z5SeBdYIpHos8aUDtw=;
 b=2KO7IdInN0irDXfRf4Vpbto9kS7Zto6G3esKyFOGYB9R4CIUQGuLK2uaGT51Lt62ErQ3cz
 Ic1TLnqB+9sXGrAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ps+yobF3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2KO7IdIn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750409230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZLa5X7wxdWQ6+syLonbvAplc7z5SeBdYIpHos8aUDtw=;
 b=ps+yobF3zHkdTu2iEURYTuyXHsEoh31LJwYLDN9XYUu48IK5m4q6Dcc3x89jQCPg3Unhzs
 2TA2XFexBPzNnrW4GY9PifIZzgyxVSCrRvl4Y+flsWUlLjjC6mFvsj25qI4ptf3U19FNiT
 24CYC/UYDphLDDTYrnYu7iFdYz/iKTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750409230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZLa5X7wxdWQ6+syLonbvAplc7z5SeBdYIpHos8aUDtw=;
 b=2KO7IdInN0irDXfRf4Vpbto9kS7Zto6G3esKyFOGYB9R4CIUQGuLK2uaGT51Lt62ErQ3cz
 Ic1TLnqB+9sXGrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E91EC136BA;
 Fri, 20 Jun 2025 08:47:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XizANg0gVWjSZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Jun 2025 08:47:09 +0000
Message-ID: <a22ecd33-460d-41bf-920c-529645d173e3@suse.de>
Date: Fri, 20 Jun 2025 10:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] fbcon: Make a symlink to the device selected as
 primary
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
References: <20250620024943.3415685-1-superm1@kernel.org>
 <20250620024943.3415685-8-superm1@kernel.org>
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
In-Reply-To: <20250620024943.3415685-8-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[25]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,wunner.de,linux.intel.com,kernel.org,infradead.org,8bytes.org,arm.com,redhat.com,perex.cz,suse.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,nvidia.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, amd.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AF4E01F7E5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi

Am 20.06.25 um 04:49 schrieb Mario Limonciello:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Knowing which device is the primary device can be useful for userspace
> to make decisions on which device to start a display server.
>
> Create a link to that device called 'primary_device'.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/video/fbdev/core/fbcon.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 2df48037688d1..46f21570723e5 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c

You cannot rely on this, as fbcon might be disabled entirely.

Best regards
Thomas

> @@ -2934,7 +2934,7 @@ static void fbcon_select_primary(struct fb_info *info)
>   {
>   	if (!map_override && primary_device == -1 &&
>   	    video_is_primary_device(info->device)) {
> -		int i;
> +		int i, r;
>   
>   		printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
>   		       info->fix.id, info->node);
> @@ -2949,6 +2949,10 @@ static void fbcon_select_primary(struct fb_info *info)
>   			       first_fb_vc + 1, last_fb_vc + 1);
>   			info_idx = primary_device;
>   		}
> +		r = sysfs_create_link(&fbcon_device->kobj, &info->device->kobj,
> +				      "primary_device");
> +		if (r)
> +			pr_err("fbcon: Failed to link to primary device: %d\n", r);
>   	}
>   
>   }
> @@ -3376,6 +3380,10 @@ void __init fb_console_init(void)
>   
>   void __exit fb_console_exit(void)
>   {
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
> +	if (primary_device != -1)
> +		sysfs_remove_link(&fbcon_device->kobj, "primary_device");
> +#endif
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>   	console_lock();
>   	if (deferred_takeover)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

