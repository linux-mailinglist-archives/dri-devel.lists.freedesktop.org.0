Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DEAA8557F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 09:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3282710EB1D;
	Fri, 11 Apr 2025 07:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o0yAVaBd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QxlL7jiB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lx+veJFx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zvHbhKxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34910EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 07:31:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EAC5F21163;
 Fri, 11 Apr 2025 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744356714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hrx+Vq7ejqeZ3A9R1/sRgzx2oxZedsWt7+uSMdGex5c=;
 b=o0yAVaBdvuDkXMwGE166fMT3+2kVxE9d7IvSusz/9I6gdn3rRSP/QTcbgqrSFUTLpYy4Fo
 4ylfXPeuzqGTYScY5cE1cI+AYeMqN0tJgEQ64OHkOXA2qE1yeHQ54zmMBNk/CN4mHHAPR7
 feu+16/bhUF6zmxltbSD0RlS4BxClCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744356714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hrx+Vq7ejqeZ3A9R1/sRgzx2oxZedsWt7+uSMdGex5c=;
 b=QxlL7jiBBSa3wuWGpHGHhkYOmlq5QVwC8KJsqUpPEElgYBGgfo4tNLKya5VK2IZt7thyK+
 s31l9syhPOkukjBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Lx+veJFx;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zvHbhKxo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744356713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hrx+Vq7ejqeZ3A9R1/sRgzx2oxZedsWt7+uSMdGex5c=;
 b=Lx+veJFxRqJfPynk53Q95/I1hTWrerf17ZqWnDj145GMx6eyI7NHeD0vX/3aAk313hERqX
 weA6nYOEOF7pkxauM6LWOBUkMAK70c1y4Cmvv9ZYxVc+Wq5D70fmStql1Ur2YAvmy2ckH6
 19+30cIrdwVF9cQVFj0zeC2rW1VQ4vU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744356713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hrx+Vq7ejqeZ3A9R1/sRgzx2oxZedsWt7+uSMdGex5c=;
 b=zvHbhKxo7dt/OEqRmjhnCAJLJlFxCgve9m34SEOgm1n6KvD97T81A+EW+R9oA04bMBBCGn
 T6UxSs2jDqgHePAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B83DF13886;
 Fri, 11 Apr 2025 07:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F997K2nF+GeXAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Apr 2025 07:31:53 +0000
Message-ID: <14937c45-efcb-4e5e-8180-562c6abca199@suse.de>
Date: Fri, 11 Apr 2025 09:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sysfb: efidrm: Avoid clang
 -Wsometimes-uninitialized in efidrm_device_create()
To: Nathan Chancellor <nathan@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20250410-efidrm-avoid-uninit-screen_info-warning-v2-1-b79646f58c24@kernel.org>
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
In-Reply-To: <20250410-efidrm-avoid-uninit-screen_info-warning-v2-1-b79646f58c24@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EAC5F21163
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_TRACE(0.00)[suse.de:+]
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

thanks for the updated patch.

Am 10.04.25 um 19:43 schrieb Nathan Chancellor:
> Clang warns (or errors with CONFIG_WERROR=y):
>
>    drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      353 |         else if (mem_flags & EFI_MEMORY_WB)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/sysfb/efidrm.c:356:7: note: uninitialized use occurs here
>      356 |         if (!screen_base)
>          |              ^~~~~~~~~~~
>    drivers/gpu/drm/sysfb/efidrm.c:353:7: note: remove the 'if' if its condition is always true
>      353 |         else if (mem_flags & EFI_MEMORY_WB)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      354 |                 screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
>    drivers/gpu/drm/sysfb/efidrm.c:261:27: note: initialize the variable 'screen_base' to silence this warning
>      261 |         void __iomem *screen_base;
>          |                                  ^
>          |                                   = NULL
>
> efidrm_get_mem_flags() can only return a mask that has at least one of
> the tested values set so the else case is impossible but clang's static
> analysis runs before inlining so it cannot know that.
>
> Initialize screen_base to NULL and add a defensive error message in case
> mem_flags were ever returned without one of the four valid values.
>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> ---
> Changes in v2:
> - Upgrade drm_warn() to drm_err() and adjust message (Thomas).
> - Carry forward Thomas's reviewed-by.
> - Link to v1: https://lore.kernel.org/r/20250409-efidrm-avoid-uninit-screen_info-warning-v1-1-67babb19d831@kernel.org
> ---
>   drivers/gpu/drm/sysfb/efidrm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
> index af90064a4c04..3cfd5d2cbf48 100644
> --- a/drivers/gpu/drm/sysfb/efidrm.c
> +++ b/drivers/gpu/drm/sysfb/efidrm.c
> @@ -258,7 +258,7 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
>   	struct drm_sysfb_device *sysfb;
>   	struct drm_device *dev;
>   	struct resource *mem = NULL;
> -	void __iomem *screen_base;
> +	void __iomem *screen_base = NULL;
>   	struct drm_plane *primary_plane;
>   	struct drm_crtc *crtc;
>   	struct drm_encoder *encoder;
> @@ -353,6 +353,8 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
>   	else if (mem_flags & EFI_MEMORY_WB)
>   		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
>   					    MEMREMAP_WB);
> +	else
> +		drm_err(dev, "invalid mem_flags: 0x%llx\n", mem_flags);
>   	if (!screen_base)
>   		return ERR_PTR(-ENOMEM);
>   	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
>
> ---
> base-commit: e8bf4a1bdaeadb28d13b9a2bcfd5910fda06eede
> change-id: 20250409-efidrm-avoid-uninit-screen_info-warning-d62ef67ce3c5
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

