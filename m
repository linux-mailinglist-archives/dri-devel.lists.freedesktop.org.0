Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD0A190F0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA9A10E3AB;
	Wed, 22 Jan 2025 11:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Sa9amHUq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ojdj/iP2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M+8VRQ8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fFzMfX3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC0E10E3AB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 11:52:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA283216E6;
 Wed, 22 Jan 2025 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737546722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AvW0TUqMHJbcKF0KjMVkCoIk2XakAqrPjMPoFsBjrO8=;
 b=Sa9amHUqrm11c+qFXBZ6et2ipiM9yPn0FweMzA9YjFaZZ13QLqKJWdVrQQ4Ucq+y5w/BVC
 LPq8AhHzt/5WlFYmbOhAqR/wUhrceYIb5WbI89ElkT15tDb2coOR7gAvUY5DfyVOsH7LFb
 jMiZAOv6C07wlzK+Fw8XZEFZpMm/zl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737546722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AvW0TUqMHJbcKF0KjMVkCoIk2XakAqrPjMPoFsBjrO8=;
 b=Ojdj/iP22ewZ9gOT/o96qpmJqdmpTLWE79wskTQZTktjGdvhk37OSTipPKUB7ypAYcDlCQ
 xXC/3wK9yzmqP4Cw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M+8VRQ8L;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fFzMfX3z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737546721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AvW0TUqMHJbcKF0KjMVkCoIk2XakAqrPjMPoFsBjrO8=;
 b=M+8VRQ8LlxrUNBQeGCneFf7jVzLUxGAB8JMYUiNTrTZq51aF2JtZKBPnOrs417y7lR0J2B
 zCmYYRsyvc909IWVFj01TbjHt/v9ZZq0gnOcHqFLQhjN4X07SibipwQHe+GP5zm+9JHWwO
 w9itHHMxI0pT0iCmkxbtQy3hxR8//wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737546721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AvW0TUqMHJbcKF0KjMVkCoIk2XakAqrPjMPoFsBjrO8=;
 b=fFzMfX3zlS4KSEp3jxpE9W7D3aKCruwUNGX2e1OAx2ZAQUrh5DBLulV36n2FfsL5cKrzxC
 rClbqDg/N325jdAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8181A1397D;
 Wed, 22 Jan 2025 11:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oI0vHuHbkGedIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Jan 2025 11:52:01 +0000
Message-ID: <0192fc3b-0800-4dee-903d-189a61e6e1ee@suse.de>
Date: Wed, 22 Jan 2025 12:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250122090211.3161186-1-arnd@kernel.org>
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
In-Reply-To: <20250122090211.3161186-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *
X-Spamd-Result: default: False [1.79 / 50.00];
 RSPAMD_URIBL(4.50)[arndb.de:email]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; BAD_REP_POLICIES(0.10)[];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_DKIM_ALLOW(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[12]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[renesas];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: 1.79
X-Spamd-Bar: +
X-Rspamd-Queue-Id: DA283216E6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Hi,

merged into drm-misc-fixes. Should reach upstream by next week. Thanks 
for the patch.

Best regards
Thomas


Am 22.01.25 um 10:02 schrieb Arnd Bergmann:
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
> only if FBDEV emulation is also enabled. DRM_TTM_HELPER and DRM_GEM_DMA_HELPER
> look like they have the same problem in theory even if there is no possible
> configuration that shows it. For consistency, do the same change to those.
>
> Closes: https://lore.kernel.org/all/20250121-greedy-flounder-of-abundance-4d2ee8-mkl@pengutronix.de
> Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0fe99d440bfa..805c6c78498f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -293,6 +293,7 @@ config DRM_TTM_HELPER
>   	tristate
>   	depends on DRM
>   	select DRM_TTM
> +	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>   	select FB_CORE if DRM_FBDEV_EMULATION
>   	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
> @@ -301,6 +302,7 @@ config DRM_TTM_HELPER
>   config DRM_GEM_DMA_HELPER
>   	tristate
>   	depends on DRM
> +	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>   	select FB_CORE if DRM_FBDEV_EMULATION
>   	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
> @@ -309,6 +311,7 @@ config DRM_GEM_DMA_HELPER
>   config DRM_GEM_SHMEM_HELPER
>   	tristate
>   	depends on DRM && MMU
> +	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>   	select FB_CORE if DRM_FBDEV_EMULATION
>   	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

