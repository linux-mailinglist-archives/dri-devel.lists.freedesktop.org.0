Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55DDAEB253
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1002810E993;
	Fri, 27 Jun 2025 09:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0r2AvZzQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cw7qgBzE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0r2AvZzQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cw7qgBzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C640F10E993
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:13:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 543A521168;
 Fri, 27 Jun 2025 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751015591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mHSKn2TBs2JAIZha6EG+kAH1cFbN9zY+1x5JS8zFklo=;
 b=0r2AvZzQO+EesVNyZmAbZL48pPDcKRDe0qETAcjRENL8jdAYwWuZeDIxGhEmUOkEDEUUSI
 n87b1AlkzTNBlYgGoQdwPa3VAqzry0sQbSIwUF/xQW+54MqBEx1cVMLQX1X7TvaAlN+uNM
 Iuv9avTlB9Qjn8h3k6X1mGccHPOnsXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751015591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mHSKn2TBs2JAIZha6EG+kAH1cFbN9zY+1x5JS8zFklo=;
 b=Cw7qgBzEz688YWnXaN/BY/xv2HAmrBXkvDSObChPx3ej0+rIZYrajq6cNYsqFnzz4Bbs24
 toQboJhVYpN+J/Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751015591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mHSKn2TBs2JAIZha6EG+kAH1cFbN9zY+1x5JS8zFklo=;
 b=0r2AvZzQO+EesVNyZmAbZL48pPDcKRDe0qETAcjRENL8jdAYwWuZeDIxGhEmUOkEDEUUSI
 n87b1AlkzTNBlYgGoQdwPa3VAqzry0sQbSIwUF/xQW+54MqBEx1cVMLQX1X7TvaAlN+uNM
 Iuv9avTlB9Qjn8h3k6X1mGccHPOnsXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751015591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mHSKn2TBs2JAIZha6EG+kAH1cFbN9zY+1x5JS8zFklo=;
 b=Cw7qgBzEz688YWnXaN/BY/xv2HAmrBXkvDSObChPx3ej0+rIZYrajq6cNYsqFnzz4Bbs24
 toQboJhVYpN+J/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22031138A7;
 Fri, 27 Jun 2025 09:13:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qW/TBqdgXmh6aAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jun 2025 09:13:11 +0000
Message-ID: <3b3feb03-c417-4569-b7b0-44565d7cce4f@suse.de>
Date: Fri, 27 Jun 2025 11:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed
 but not fixuped
To: oushixiong1025@163.com, Helge Deller <deller@gmx.de>
Cc: Peter Jones <pjones@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250626094937.515552-1-oushixiong1025@163.com>
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
In-Reply-To: <20250626094937.515552-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[163.com,gmx.de]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Am 26.06.25 um 11:49 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> [WHY]
> On an ARM machine, the following log is present:
> [    0.900884] efifb: framebuffer at 0x1020000000, using 3072k, total 3072k
> [    2.297884] amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 0: 0x1000000000 -> 0x100fffffff
> [    2.297886] amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 2: 0x1010000000 -> 0x10101fffff
> [    2.297888] amdgpu 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 5: 0x58200000 -> 0x5823ffff
>
> It show that the efifb framebuffer base is out of PCI BAR, and this
> results in both efi-framebuffer and amdgpudrmfb co-existing.
>
> The fbcon will be bound to efi-framebuffer by default and cannot be used.
>
> [HOW]
> Do not load efifb driver if PCI BAR has changed but not fixuped.
> In the following cases:
> 	1. screen_info_lfb_pdev is NULL.
> 	2. __screen_info_relocation_is_valid return false.

Apart from ruling out invalid screen_info, did you figure out why the 
relocation tracking didn't work? It would be good to fix this if possible.

Best regards
Thomas

>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/video/fbdev/efifb.c     |  4 ++++
>   drivers/video/screen_info_pci.c | 24 ++++++++++++++++++++++++
>   include/linux/screen_info.h     |  5 +++++
>   3 files changed, 33 insertions(+)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index 0e1bd3dba255..de8d016c9a66 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -303,6 +303,10 @@ static void efifb_setup(struct screen_info *si, char *options)
>   
>   static inline bool fb_base_is_valid(struct screen_info *si)
>   {
> +	/* check whether fb_base has changed but not fixuped */
> +	if (!screen_info_is_useful())
> +		return false;
> +
>   	if (si->lfb_base)
>   		return true;
>   
> diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
> index 66bfc1d0a6dc..ac57dcaf0cac 100644
> --- a/drivers/video/screen_info_pci.c
> +++ b/drivers/video/screen_info_pci.c
> @@ -9,6 +9,8 @@ static struct pci_dev *screen_info_lfb_pdev;
>   static size_t screen_info_lfb_bar;
>   static resource_size_t screen_info_lfb_res_start; // original start of resource
>   static resource_size_t screen_info_lfb_offset; // framebuffer offset within resource
> +static bool screen_info_changed;
> +static bool screen_info_fixuped;
>   
>   static bool __screen_info_relocation_is_valid(const struct screen_info *si, struct resource *pr)
>   {
> @@ -24,6 +26,24 @@ static bool __screen_info_relocation_is_valid(const struct screen_info *si, stru
>   	return true;
>   }
>   
> +bool screen_info_is_useful(void)
> +{
> +	unsigned int type;
> +	const struct screen_info *si = &screen_info;
> +
> +	type = screen_info_video_type(si);
> +	if (type != VIDEO_TYPE_EFI)
> +		return true;
> +
> +	if (screen_info_changed && !screen_info_fixuped) {
> +		pr_warn("The screen_info has changed but not fixuped");
> +		return false;
> +	}
> +
> +	pr_info("The screen_info is useful");
> +	return true;
> +}
> +
>   void screen_info_apply_fixups(void)
>   {
>   	struct screen_info *si = &screen_info;
> @@ -32,18 +52,22 @@ void screen_info_apply_fixups(void)
>   		struct resource *pr = &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
>   
>   		if (pr->start != screen_info_lfb_res_start) {
> +			screen_info_changed = true;
>   			if (__screen_info_relocation_is_valid(si, pr)) {
>   				/*
>   				 * Only update base if we have an actual
>   				 * relocation to a valid I/O range.
>   				 */
>   				__screen_info_set_lfb_base(si, pr->start + screen_info_lfb_offset);
> +				screen_info_fixuped = true;
>   				pr_info("Relocating firmware framebuffer to offset %pa[d] within %pr\n",
>   					&screen_info_lfb_offset, pr);
>   			} else {
>   				pr_warn("Invalid relocating, disabling firmware framebuffer\n");
>   			}
>   		}
> +	} else {
> +		screen_info_changed = true;
>   	}
>   }
>   
> diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
> index 923d68e07679..632cdbb1adbe 100644
> --- a/include/linux/screen_info.h
> +++ b/include/linux/screen_info.h
> @@ -138,9 +138,14 @@ ssize_t screen_info_resources(const struct screen_info *si, struct resource *r,
>   u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si);
>   
>   #if defined(CONFIG_PCI)
> +bool screen_info_is_useful(void);
>   void screen_info_apply_fixups(void);
>   struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
>   #else
> +bool screen_info_is_useful(void)
> +{
> +	return true;
> +}
>   static inline void screen_info_apply_fixups(void)
>   { }
>   static inline struct pci_dev *screen_info_pci_dev(const struct screen_info *si)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

