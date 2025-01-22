Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D37A18D23
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 08:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BFD10E67C;
	Wed, 22 Jan 2025 07:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="f0I1r83q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="axbHEUTX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f0I1r83q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="axbHEUTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0910E67C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 07:53:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F22651F7C2;
 Wed, 22 Jan 2025 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737532421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mJxyTI1uxfmrGacQs7PEyX+wwkkDQ1O+BX+VfWzyBHM=;
 b=f0I1r83q8ba9TAuVSywZ9EcwjTStP5zFjAD7tcdbrPGZW8llvgm8UDXtFUbqESUSiSp333
 1HxcfD8FHA+yzwDI/VSIF8MnszQ+zFXH9TCRd+EoTvUcZaJ9HBUww2Hfz6Rb+a/ZndOyvR
 uMzt1DPTGrg5jzZfPeRKjSSQfK+Z1iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737532421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mJxyTI1uxfmrGacQs7PEyX+wwkkDQ1O+BX+VfWzyBHM=;
 b=axbHEUTXTc0X+KuAiWlatUc7kU5wRBlu8o5F0NQ9hIT8HnW71+vWp0j72aLjeajnxV0vUU
 r4pRQ9byKEPvawAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737532421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mJxyTI1uxfmrGacQs7PEyX+wwkkDQ1O+BX+VfWzyBHM=;
 b=f0I1r83q8ba9TAuVSywZ9EcwjTStP5zFjAD7tcdbrPGZW8llvgm8UDXtFUbqESUSiSp333
 1HxcfD8FHA+yzwDI/VSIF8MnszQ+zFXH9TCRd+EoTvUcZaJ9HBUww2Hfz6Rb+a/ZndOyvR
 uMzt1DPTGrg5jzZfPeRKjSSQfK+Z1iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737532421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mJxyTI1uxfmrGacQs7PEyX+wwkkDQ1O+BX+VfWzyBHM=;
 b=axbHEUTXTc0X+KuAiWlatUc7kU5wRBlu8o5F0NQ9hIT8HnW71+vWp0j72aLjeajnxV0vUU
 r4pRQ9byKEPvawAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC0871397D;
 Wed, 22 Jan 2025 07:53:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c4Z8KASkkGfYagAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Jan 2025 07:53:40 +0000
Message-ID: <2a62b147-4ce2-485e-ba51-421c82decc81@suse.de>
Date: Wed, 22 Jan 2025 08:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250122064655.1095176-1-arnd@kernel.org>
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
In-Reply-To: <20250122064655.1095176-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Result: default: False [1.70 / 50.00];
 RSPAMD_URIBL(4.50)[arndb.de:email]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[renesas]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: 1.70
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

thanks for the patch.

Am 22.01.25 um 07:46 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> In the combination of DRM_KMS_HELPER=m, DRM_GEM_SHMEM_HELPER=y, DRM_FBDEV_EMULATION=y,
> The shmem code fails to link against the KMS helpers:
>
> x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_driver_fbdev_probe':
> (.text+0xeec601): undefined reference to `drm_fb_helper_alloc_info'
> x86_64-linux-ld: (.text+0xeec633): undefined reference to `drm_fb_helper_fill_info'
> x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_get_page':
> drm_fbdev_shmem.c:(.text+0xeec7d2): undefined reference to `drm_gem_fb_get_obj'
> x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_fb_mmap':
> drm_fbdev_shmem.c:(.text+0xeec9f6): undefined reference to `drm_gem_fb_get_obj'
> x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_defio_imageblit':
> (.rodata+0x5b2288): undefined reference to `drm_fb_helper_check_var'
> x86_64-linux-ld: (.rodata+0x5b2290): undefined reference to `drm_fb_helper_set_par'
>
> This can happen for a number of device drivers that select DRM_GEM_SHMEM_HELPER
> without also selecting DRM_KMS_HELPER. To work around this, add another select
> that forces DRM_KMS_HELPER to be built-in rather than a loadable module, but
> only if FBDEV emulation is also enabled.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

with comments below.

> ---
>   drivers/gpu/drm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0fe99d440bfa..a8d2dffbc82f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -311,6 +311,7 @@ config DRM_GEM_SHMEM_HELPER

I expect that DRM_GEM_DMA_HELPER and DRM_GEM_VRAM_HELPER are also affected.

>   	depends on DRM && MMU
>   	select FB_CORE if DRM_FBDEV_EMULATION
>   	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
> +	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION

Maybe move the new line before the lines with FB_ to keep it sorted 
alphabetically.

I think this patch fixes

  https://lore.kernel.org/dri-devel/a5a98971-405e-496b-89a4-75a61fd6d898@suse.de/T/#mcc9fa26b2980b93dc688061884119a3dd0277dc5

Could you please add Closes and Reported-by tags?

Best regards
Thomas

>   	help
>   	  Choose this if you need the GEM shmem helper functions
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

