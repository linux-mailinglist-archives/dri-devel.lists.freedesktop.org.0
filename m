Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23973D3A136
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A8C10E3AB;
	Mon, 19 Jan 2026 08:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rmfUJ5af";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rw2BUtVg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rmfUJ5af";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rw2BUtVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1241210E3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 422F0336A9;
 Mon, 19 Jan 2026 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768810652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OF24GIZfgAEAtH4tb1EQjsdh1I6soNfkGFCbhQLVbR8=;
 b=rmfUJ5afnxxOwpFaD9bybq8CypFKjvMIWHA3oRZbrmJuchm6Ft66bfsft0bknZhl/h6Jsq
 KMRgqHvtlGgRlRcYTwqnJdOBS/5j3J5g8fwiMu8o/a0M28XhMOcfo3Pfm+FEaZ4GQCt2co
 XM3RvW2/cIYB2iupjiTAwvSWk1G99Dc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768810652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OF24GIZfgAEAtH4tb1EQjsdh1I6soNfkGFCbhQLVbR8=;
 b=Rw2BUtVgwfDkIRnjYj46e5H+gtvZ5FVNKLCqHt/0Am79M8B1Sbf9KseRmXb3CAPY6g9Xe6
 LnHA2C/7jgM8N9Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768810652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OF24GIZfgAEAtH4tb1EQjsdh1I6soNfkGFCbhQLVbR8=;
 b=rmfUJ5afnxxOwpFaD9bybq8CypFKjvMIWHA3oRZbrmJuchm6Ft66bfsft0bknZhl/h6Jsq
 KMRgqHvtlGgRlRcYTwqnJdOBS/5j3J5g8fwiMu8o/a0M28XhMOcfo3Pfm+FEaZ4GQCt2co
 XM3RvW2/cIYB2iupjiTAwvSWk1G99Dc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768810652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OF24GIZfgAEAtH4tb1EQjsdh1I6soNfkGFCbhQLVbR8=;
 b=Rw2BUtVgwfDkIRnjYj46e5H+gtvZ5FVNKLCqHt/0Am79M8B1Sbf9KseRmXb3CAPY6g9Xe6
 LnHA2C/7jgM8N9Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E67963EA63;
 Mon, 19 Jan 2026 08:17:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gVjRNpvobWlxCwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jan 2026 08:17:31 +0000
Message-ID: <fa36159a-fa41-4066-abea-60a439e944b3@suse.de>
Date: Mon, 19 Jan 2026 09:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gud: fix NULL crtc dereference on display disable
To: Shenghao Yang <me@shenghaoyang.info>, Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20260118125044.54467-1-me@shenghaoyang.info>
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
In-Reply-To: <20260118125044.54467-1-me@shenghaoyang.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[shenghaoyang.info,aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, intel.com:email,
 imap1.dmz-prg2.suse.org:helo, bootlin.com:url, suse.com:url]
X-Spam-Level: 
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

thanks for the patch.


Am 18.01.26 um 13:50 schrieb Shenghao Yang:
> Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
> on USB disconnect") [1] only fixed the initial NULL crtc dereference
> in gud_plane_atomic_update().
>
> However, planes can also be disabled in non-hotplug paths (e.g.
> display disables via the DE). The drm_dev_enter() call would not

'DE' ?

> cause an early return in those and we'll subsequently oops on
> dereferencing crtc:
>
> BUG: kernel NULL pointer dereference, address: 00000000000005c8
> CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-200.vanilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
> RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
>   <TASK>
>   drm_atomic_helper_commit_planes+0x28e/0x310
>   drm_atomic_helper_commit_tail+0x2a/0x70
>   commit_tail+0xf1/0x150
>   drm_atomic_helper_commit+0x13c/0x180
>   drm_atomic_commit+0xb1/0xe0
> info ? __pfx___drm_printfn_info+0x10/0x10
>   drm_mode_atomic_ioctl+0x70f/0x7c0
>   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>   drm_ioctl_kernel+0xae/0x100
>   drm_ioctl+0x2a8/0x550
>   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>   __x64_sys_ioctl+0x97/0xe0
>   do_syscall_64+0x7e/0x7f0
>   ? __ct_user_enter+0x56/0xd0
>   ? do_syscall_64+0x158/0x7f0
>   ? __ct_user_enter+0x56/0xd0
>   ? do_syscall_64+0x158/0x7f0
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Add an early exit and disable the display controller if crtc is NULL.

It seems to me that all these calls to GUD_REQ_SET_CONTROLLER_ENABLE(^1) 
and GUD_REQ_SET_DISPLAY_ENABLEshould rather go to the CRTC's 
atomic_enable/atomic_disable functions. Those currently seem missing 
from [1]. The atomic_update helper would then be reduced to damage 
handling. Best regards Thomas [1] 
https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/gud/gud_drv.c#L341 

^1: SET_CONTROLLER_ENABLE sounds like it could even be part of device 
probing and runtime PM management, but that is a more invasive change.
>
> [1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.info/
>
> Cc: <stable@vger.kernel.org> # 6.18.x
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
> Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM atomic helpers")
> Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
> ---
>   drivers/gpu/drm/gud/gud_pipe.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 4b77be94348d..a69dee71490f 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -610,6 +610,9 @@ void gud_plane_atomic_update(struct drm_plane *plane,
>   	if (!drm_dev_enter(drm, &idx))
>   		return;
>   
> +	if (!crtc)
> +		goto ctrl_disable;
> +
>   	if (!old_state->fb)
>   		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
>   
> @@ -633,7 +636,7 @@ void gud_plane_atomic_update(struct drm_plane *plane,
>   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>   
>   ctrl_disable:
> -	if (!crtc->state->enable)
> +	if (!crtc || !crtc->state->enable)
>   		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
>   
>   	drm_dev_exit(idx);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


