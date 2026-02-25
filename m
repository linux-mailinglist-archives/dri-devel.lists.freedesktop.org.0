Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANqAMUq4nmnwWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:52:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF11946C8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E28510E233;
	Wed, 25 Feb 2026 08:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="idn3slbM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k74s+oIu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="idn3slbM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k74s+oIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD98810E233
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:52:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 69DE75BD6A;
 Wed, 25 Feb 2026 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772009540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=h7G0A9jd0ir2uSn0Pqn7ZUVS1AKDI0rMpui5OipyEeo=;
 b=idn3slbMSAPIGfbu1ycUAZ+bZikmjZaKMsVJ4TtXboO4pnnxhYkNGtNE814QJOVrJLsyoW
 6P+tm31w11WG4x03gJTtGTpnhndtfENhP/46KkQ31a4fR4cPsARX31Clm9WW3641lYc51H
 03z2oZ/8gnqDnS3iu3Sxb344eRZzrp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772009540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=h7G0A9jd0ir2uSn0Pqn7ZUVS1AKDI0rMpui5OipyEeo=;
 b=k74s+oIuTNEN/1hUABuAxmRlJ5jx1H3sAs58fPVoDgx1sR6pJTjShH2xNzRMebno9fkaXr
 upzxxti2hhduidBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=idn3slbM;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=k74s+oIu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772009540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=h7G0A9jd0ir2uSn0Pqn7ZUVS1AKDI0rMpui5OipyEeo=;
 b=idn3slbMSAPIGfbu1ycUAZ+bZikmjZaKMsVJ4TtXboO4pnnxhYkNGtNE814QJOVrJLsyoW
 6P+tm31w11WG4x03gJTtGTpnhndtfENhP/46KkQ31a4fR4cPsARX31Clm9WW3641lYc51H
 03z2oZ/8gnqDnS3iu3Sxb344eRZzrp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772009540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=h7G0A9jd0ir2uSn0Pqn7ZUVS1AKDI0rMpui5OipyEeo=;
 b=k74s+oIuTNEN/1hUABuAxmRlJ5jx1H3sAs58fPVoDgx1sR6pJTjShH2xNzRMebno9fkaXr
 upzxxti2hhduidBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 142CC3EA65;
 Wed, 25 Feb 2026 08:52:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xxt1A0S4nmkscgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Feb 2026 08:52:20 +0000
Message-ID: <1ffb000d-8189-405d-861b-6eb449773f56@suse.de>
Date: Wed, 25 Feb 2026 09:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/gud: fix NULL crtc dereference on display disable
To: Shenghao Yang <me@shenghaoyang.info>, Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260222054551.80864-1-me@shenghaoyang.info>
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
In-Reply-To: <20260222054551.80864-1-me@shenghaoyang.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:me@shenghaoyang.info,m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[shenghaoyang.info,aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,suse.com:url,intel.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 2CDF11946C8
X-Rspamd-Action: no action

Hi

Am 22.02.26 um 06:45 schrieb Shenghao Yang:
> gud_plane_atomic_update() currently handles both crtc state and
> framebuffer updates - the complexity has led to a few accidental
> NULL pointer dereferences.
>
> Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
> on USB disconnect") [1] fixed an earlier dereference but planes
> can also be disabled in non-hotplug paths (e.g. display disables
> via the desktop environment). The drm_dev_enter() call would not
> cause an early return in those and subsequently oops on
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
> Split out crtc handling from gud_plane_atomic_update() into
> atomic_enable() and atomic_disable() functions to delegate
> crtc state transitioning work to the DRM helpers.
>
> To preserve the gud state commit sequence [2], switch to
> the runtime PM version of drm_atomic_helper_commit_tail() which
> ensures that crtcs are enabled (hence sending the
> GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
> requests) before a framebuffer update is sent.
>
> [1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.info/
> [2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
> Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM atomic helpers")
> Signed-off-by: Shenghao Yang <me@shenghaoyang.info>

AFAICT this looks good.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> ---
> v5: Send SET_CONTROLLER_ENABLE and SET_STATE_COMMIT unconditionally on
>      crtc enable
> v4: Send SET_DISPLAY_ENABLE=1 unconditionally on crtc enable
> v3: Dropped stable AUTOSEL opt out
> v2: Moved controller and display control commands to crtc
>      enable / disable functions.
>
> [v4]: https://lore.kernel.org/lkml/20260218054711.63982-1-me@shenghaoyang.info/
> [v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shenghaoyang.info/
> [v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shenghaoyang.info/
> [v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shenghaoyang.info/
>
>   drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
>   drivers/gpu/drm/gud/gud_internal.h |  4 +++
>   drivers/gpu/drm/gud/gud_pipe.c     | 54 ++++++++++++++++++++----------
>   3 files changed, 48 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index d0122d477610..17c2dead2c13 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -339,7 +339,9 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
>   }
>   
>   static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
> -	.atomic_check = drm_crtc_helper_atomic_check
> +	.atomic_check = drm_crtc_helper_atomic_check,
> +	.atomic_enable = gud_crtc_atomic_enable,
> +	.atomic_disable = gud_crtc_atomic_disable,
>   };
>   
>   static const struct drm_crtc_funcs gud_crtc_funcs = {
> @@ -364,6 +366,10 @@ static const struct drm_plane_funcs gud_plane_funcs = {
>   	DRM_GEM_SHADOW_PLANE_FUNCS,
>   };
>   
> +static const struct drm_mode_config_helper_funcs gud_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
>   static const struct drm_mode_config_funcs gud_mode_config_funcs = {
>   	.fb_create = drm_gem_fb_create_with_dirty,
>   	.atomic_check = drm_atomic_helper_check,
> @@ -499,6 +505,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
>   	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
>   	drm->mode_config.funcs = &gud_mode_config_funcs;
> +	drm->mode_config.helper_private = &gud_mode_config_helpers;
>   
>   	/* Format init */
>   	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
> diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
> index d27c31648341..a5b7e53cf79c 100644
> --- a/drivers/gpu/drm/gud/gud_internal.h
> +++ b/drivers/gpu/drm/gud/gud_internal.h
> @@ -62,6 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
>   
>   void gud_clear_damage(struct gud_device *gdrm);
>   void gud_flush_work(struct work_struct *work);
> +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> +			   struct drm_atomic_state *state);
> +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> +			   struct drm_atomic_state *state);
>   int gud_plane_atomic_check(struct drm_plane *plane,
>   			   struct drm_atomic_state *state);
>   void gud_plane_atomic_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 4b77be94348d..587d6dd2b32e 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -580,6 +580,39 @@ int gud_plane_atomic_check(struct drm_plane *plane,
>   	return ret;
>   }
>   
> +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> +			   struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = crtc->dev;
> +	struct gud_device *gdrm = to_gud_device(drm);
> +	int idx;
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return;
> +
> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> +	gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 1);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> +			   struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = crtc->dev;
> +	struct gud_device *gdrm = to_gud_device(drm);
> +	int idx;
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return;
> +
> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 0);
> +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> +
> +	drm_dev_exit(idx);
> +}
> +
>   void gud_plane_atomic_update(struct drm_plane *plane,
>   			     struct drm_atomic_state *atomic_state)
>   {
> @@ -607,24 +640,12 @@ void gud_plane_atomic_update(struct drm_plane *plane,
>   		mutex_unlock(&gdrm->damage_lock);
>   	}
>   
> -	if (!drm_dev_enter(drm, &idx))
> +	if (!crtc || !drm_dev_enter(drm, &idx))
>   		return;
>   
> -	if (!old_state->fb)
> -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> -
> -	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
> -		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> -
> -	if (crtc->state->active_changed)
> -		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
> -
> -	if (!fb)
> -		goto ctrl_disable;
> -
>   	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>   	if (ret)
> -		goto ctrl_disable;
> +		goto out;
>   
>   	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
>   	drm_atomic_for_each_plane_damage(&iter, &damage)
> @@ -632,9 +653,6 @@ void gud_plane_atomic_update(struct drm_plane *plane,
>   
>   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>   
> -ctrl_disable:
> -	if (!crtc->state->enable)
> -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> -
> +out:
>   	drm_dev_exit(idx);
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


