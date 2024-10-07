Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D69925EC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 09:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E33E10E30A;
	Mon,  7 Oct 2024 07:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="z9sG4du5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0hX7je+I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z9sG4du5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0hX7je+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6910E30A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 07:19:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 653091FD12;
 Mon,  7 Oct 2024 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728285556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UawE5IaZhH+nBsddJnD8RyGq+p3Jsd2GXC7wWG4082w=;
 b=z9sG4du5JvepLEwQaMP01R3+xlkBd0h4dzfqmO/hgN02ooTEB0PfSkgiWXjVXiKT+cypyD
 O3EhA0NgjlOiZdKqeQ3FrS/m5K5bMYPXFxLuGi48i+Ag2nK+qXrtlR+L8JhDMsDXrQg4KH
 4gd8pQsuWKcFk758mpZVGYfTF8KQ4Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728285556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UawE5IaZhH+nBsddJnD8RyGq+p3Jsd2GXC7wWG4082w=;
 b=0hX7je+IrNEE3uawqwxnzDqwLEANPDwUNRanT74vtLvnhfMR7TJw2u+k2tCuxFzs5zNICq
 Px3loVOA6C3btfCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z9sG4du5;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0hX7je+I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728285556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UawE5IaZhH+nBsddJnD8RyGq+p3Jsd2GXC7wWG4082w=;
 b=z9sG4du5JvepLEwQaMP01R3+xlkBd0h4dzfqmO/hgN02ooTEB0PfSkgiWXjVXiKT+cypyD
 O3EhA0NgjlOiZdKqeQ3FrS/m5K5bMYPXFxLuGi48i+Ag2nK+qXrtlR+L8JhDMsDXrQg4KH
 4gd8pQsuWKcFk758mpZVGYfTF8KQ4Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728285556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UawE5IaZhH+nBsddJnD8RyGq+p3Jsd2GXC7wWG4082w=;
 b=0hX7je+IrNEE3uawqwxnzDqwLEANPDwUNRanT74vtLvnhfMR7TJw2u+k2tCuxFzs5zNICq
 Px3loVOA6C3btfCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14A9713786;
 Mon,  7 Oct 2024 07:19:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oa8eA3SLA2ezYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Oct 2024 07:19:16 +0000
Message-ID: <6d3aa140-347e-482a-93d2-0e2d1325339b@suse.de>
Date: Mon, 7 Oct 2024 09:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-dma: Only cleanup deferred I/O if necessary
To: Janne Grunau <j@jannau.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <ZwLNuZL-8Gh5UUQb@robin>
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
In-Reply-To: <ZwLNuZL-8Gh5UUQb@robin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 653091FD12
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[jannau.net,linux.intel.com,kernel.org,gmail.com,linaro.org,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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



Am 06.10.24 um 19:49 schrieb Janne Grunau:
> Commit 5a498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if
> necessary") initializes deferred I/O only if it is used.
> drm_fbdev_dma_fb_destroy() however calls fb_deferred_io_cleanup()
> unconditionally with struct fb_info.fbdefio == NULL. KASAN with the
> out-of-tree Apple silicon display driver posts following warning from
> __flush_work() of a random struct work_struct instead of the expected
> NULL pointer derefs.
>
> [   22.053799] ------------[ cut here ]------------
> [   22.054832] WARNING: CPU: 2 PID: 1 at kernel/workqueue.c:4177 __flush_work+0x4d8/0x580
> [   22.056597] Modules linked in: uhid bnep uinput nls_ascii ip6_tables ip_tables i2c_dev loop fuse dm_multipath nfnetlink zram hid_magicmouse btrfs xor xor_neon brcmfmac_wcc raid6_pq hci_bcm4377 bluetooth brcmfmac hid_apple brcmutil nvmem_spmi_mfd simple_mfd_spmi dockchannel_hid cfg80211 joydev regmap_spmi nvme_apple ecdh_generic ecc macsmc_hid rfkill dwc3 appledrm snd_soc_macaudio macsmc_power nvme_core apple_isp phy_apple_atc apple_sart apple_rtkit_helper apple_dockchannel tps6598x macsmc_hwmon snd_soc_cs42l84 videobuf2_v4l2 spmi_apple_controller nvmem_apple_efuses videobuf2_dma_sg apple_z2 videobuf2_memops spi_nor panel_summit videobuf2_common asahi videodev pwm_apple apple_dcp snd_soc_apple_mca apple_admac spi_apple clk_apple_nco i2c_pasemi_platform snd_pcm_dmaengine mc i2c_pasemi_core mux_core ofpart adpdrm drm_dma_helper apple_dart apple_soc_cpufreq leds_pwm phram
> [   22.073768] CPU: 2 UID: 0 PID: 1 Comm: systemd-shutdow Not tainted 6.11.2-asahi+ #asahi-dev
> [   22.075612] Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
> [   22.077032] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   22.078567] pc : __flush_work+0x4d8/0x580
> [   22.079471] lr : __flush_work+0x54/0x580
> [   22.080345] sp : ffffc000836ef820
> [   22.081089] x29: ffffc000836ef880 x28: 0000000000000000 x27: ffff80002ddb7128
> [   22.082678] x26: dfffc00000000000 x25: 1ffff000096f0c57 x24: ffffc00082d3e358
> [   22.084263] x23: ffff80004b7862b8 x22: dfffc00000000000 x21: ffff80005aa1d470
> [   22.085855] x20: ffff80004b786000 x19: ffff80004b7862a0 x18: 0000000000000000
> [   22.087439] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000005
> [   22.089030] x14: 1ffff800106ddf0a x13: 0000000000000000 x12: 0000000000000000
> [   22.090618] x11: ffffb800106ddf0f x10: dfffc00000000000 x9 : 1ffff800106ddf0e
> [   22.092206] x8 : 0000000000000000 x7 : aaaaaaaaaaaaaaaa x6 : 0000000000000001
> [   22.093790] x5 : ffffc000836ef728 x4 : 0000000000000000 x3 : 0000000000000020
> [   22.095368] x2 : 0000000000000008 x1 : 00000000000000aa x0 : 0000000000000000
> [   22.096955] Call trace:
> [   22.097505]  __flush_work+0x4d8/0x580
> [   22.098330]  flush_delayed_work+0x80/0xb8
> [   22.099231]  fb_deferred_io_cleanup+0x3c/0x130
> [   22.100217]  drm_fbdev_dma_fb_destroy+0x6c/0xe0 [drm_dma_helper]
> [   22.101559]  unregister_framebuffer+0x210/0x2f0
> [   22.102575]  drm_fb_helper_unregister_info+0x48/0x60
> [   22.103683]  drm_fbdev_dma_client_unregister+0x4c/0x80 [drm_dma_helper]
> [   22.105147]  drm_client_dev_unregister+0x1cc/0x230
> [   22.106217]  drm_dev_unregister+0x58/0x570
> [   22.107125]  apple_drm_unbind+0x50/0x98 [appledrm]
> [   22.108199]  component_del+0x1f8/0x3a8
> [   22.109042]  dcp_platform_shutdown+0x24/0x38 [apple_dcp]
> [   22.110357]  platform_shutdown+0x70/0x90
> [   22.111219]  device_shutdown+0x368/0x4d8
> [   22.112095]  kernel_restart+0x6c/0x1d0
> [   22.112946]  __arm64_sys_reboot+0x1c8/0x328
> [   22.113868]  invoke_syscall+0x78/0x1a8
> [   22.114703]  do_el0_svc+0x124/0x1a0
> [   22.115498]  el0_svc+0x3c/0xe0
> [   22.116181]  el0t_64_sync_handler+0x70/0xc0
> [   22.117110]  el0t_64_sync+0x190/0x198
> [   22.117931] ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Fixes: 5a498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if necessary")

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_fbdev_dma.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index b0602c4f3628..51c2d742d199 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -50,7 +50,8 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
>   	if (!fb_helper->dev)
>   		return;
>   
> -	fb_deferred_io_cleanup(info);
> +	if (info->fbdefio)
> +		fb_deferred_io_cleanup(info);
>   	drm_fb_helper_fini(fb_helper);
>   
>   	drm_client_buffer_vunmap(fb_helper->buffer);
>
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
> change-id: 20241006-drm_fbdev_dma_deferred_io_cleanup-de87ee345dbc
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

