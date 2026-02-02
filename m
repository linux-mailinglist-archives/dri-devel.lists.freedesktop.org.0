Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM8rN6RXgGkd6gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:52:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA2C95A0
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B81410E1AD;
	Mon,  2 Feb 2026 07:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TxeyI/mw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mRNkDeTI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TxeyI/mw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mRNkDeTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5A210E181
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 07:51:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04A905BD47;
 Mon,  2 Feb 2026 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770018717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dR0a1TQOVvJGkjewikXQoOURT4fk/S6D7pyOnZkWEtY=;
 b=TxeyI/mw6sVnEvhtKpzq+HbxTLhFLMSqspTCLA33c5j+3Pg403sSazx+F8q3Yqg/xMyAFv
 TdslKOl7AYL4zkW5VKJcgFR5p1tQxla6NxmvfPLWmaV6Ku2lbRudBGWvils/lIIGXQy5sJ
 hmsNLrfBhXRftSbe1wVrea7l/EPwgVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770018717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dR0a1TQOVvJGkjewikXQoOURT4fk/S6D7pyOnZkWEtY=;
 b=mRNkDeTIzeCWOAyFZL78Uk75GaTJBi949GGwe1Ge7BfBePr9OWncEKby2QrgAVaQN6oxj9
 bqfsTOHUC/uNa9Ag==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="TxeyI/mw";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mRNkDeTI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770018717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dR0a1TQOVvJGkjewikXQoOURT4fk/S6D7pyOnZkWEtY=;
 b=TxeyI/mw6sVnEvhtKpzq+HbxTLhFLMSqspTCLA33c5j+3Pg403sSazx+F8q3Yqg/xMyAFv
 TdslKOl7AYL4zkW5VKJcgFR5p1tQxla6NxmvfPLWmaV6Ku2lbRudBGWvils/lIIGXQy5sJ
 hmsNLrfBhXRftSbe1wVrea7l/EPwgVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770018717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dR0a1TQOVvJGkjewikXQoOURT4fk/S6D7pyOnZkWEtY=;
 b=mRNkDeTIzeCWOAyFZL78Uk75GaTJBi949GGwe1Ge7BfBePr9OWncEKby2QrgAVaQN6oxj9
 bqfsTOHUC/uNa9Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA44B3EA62;
 Mon,  2 Feb 2026 07:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tFCXL5xXgGnjGAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Feb 2026 07:51:56 +0000
Message-ID: <247377f2-c080-43b0-89ac-a645386815f0@suse.de>
Date: Mon, 2 Feb 2026 08:51:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/gma500: use drm_crtc_vblank_crtc()"
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20260130151319.31264-1-jani.nikula@intel.com>
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
In-Reply-To: <20260130151319.31264-1-jani.nikula@intel.com>
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@intel.com,m:patrik.r.jakobsson@gmail.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 49FA2C95A0
X-Rspamd-Action: no action



Am 30.01.26 um 16:13 schrieb Jani Nikula:
> This reverts commit d930ffa5d6e8867a290db9c6aad1c62731aeb2c3.
>
> According to Thomas, commit d930ffa5d6e8 ("drm/gma500: use
> drm_crtc_vblank_crtc()") breaks the driver with a NULL-ptr oops on
> startup. This is because the IRQ initialization in gma_irq_install() now
> uses CRTCs that are only allocated later in psb_modeset_init(). Stack
> trace is below. Revert. Go back to the drawing board.
>
> [   65.831766] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000021: 0000 [#1] SMP KASAN NOPTI
> [   65.832114] KASAN: null-ptr-deref in range [0x0000000000000108-0x000000000000010f]
> [   65.832232] CPU: 1 UID: 0 PID: 296 Comm: (udev-worker) Tainted: G         E       6.19.0-rc6-1-default+ #4622 PREEMPT(voluntary)
> [   65.832376] Tainted: [E]=UNSIGNED_MODULE
> [   65.832448] Hardware name:  /DN2800MT, BIOS MTCDT10N.86A.0164.2012.1213.1024 12/13/2012
> [   65.832543] RIP: 0010:drm_crtc_vblank_crtc+0x24/0xd0
> [   65.832652] Code: 90 90 90 90 90 90 0f 1f 44 00 00 48 89 f8 48 81 c7
> 18 01 00 00 48 83 ec 10 48 ba 00 00 00 00 00 fc ff df 48 89 f9 48 c1 e9
> 03 <0f> b6 14 11 84 d2 74 05 80 fa 03 7e 58 48 89 c6 8b 90 18 01 00
> 00
> [   65.832820] RSP: 0018:ffff88800c8f7688 EFLAGS: 00010006
> [   65.832919] RAX: fffffffffffffff0 RBX: ffff88800fff4928 RCX: 0000000000000021
> [   65.833011] RDX: dffffc0000000000 RSI: ffffc90000978130 RDI: 0000000000000108
> [   65.833107] RBP: ffffed1001ffea03 R08: 0000000000000000 R09: ffffed100191eec7
> [   65.833199] R10: 0000000000000001 R11: 0000000000000001 R12: ffff8880014480c8
> [   65.833289] R13: dffffc0000000000 R14: fffffffffffffff0 R15: ffff88800fff4000
> [   65.833380] FS:  00007fe53d4d5d80(0000) GS:ffff888148dd8000(0000) knlGS:0000000000000000
> [   65.833488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   65.833575] CR2: 00007fac707420b8 CR3: 000000000ebd1000 CR4: 00000000000006f0
> [   65.833668] Call Trace:
> [   65.833735]  <TASK>
> [   65.833808]  gma_irq_preinstall+0x190/0x3e0 [gma500_gfx]
> [   65.834054]  gma_irq_install+0xb2/0x240 [gma500_gfx]
> [   65.834282]  psb_driver_load+0x7b2/0x1090 [gma500_gfx]
> [   65.834516]  ? __pfx_psb_driver_load+0x10/0x10 [gma500_gfx]
> [   65.834726]  ? ksize+0x1d/0x40
> [   65.834817]  ? drmm_add_final_kfree+0x3b/0xb0
> [   65.834935]  ? __pfx_psb_pci_probe+0x10/0x10 [gma500_gfx]
> [   65.835164]  psb_pci_probe+0xc8/0x150 [gma500_gfx]
> [   65.835384]  local_pci_probe+0xd5/0x190
> [   65.835492]  pci_call_probe+0x167/0x4b0
> [   65.835594]  ? __pfx_pci_call_probe+0x10/0x10
> [   65.835693]  ? local_clock+0x11/0x30
> [   65.835808]  ? __pfx___driver_attach+0x10/0x10
> [   65.835915]  ? do_raw_spin_unlock+0x55/0x230
> [   65.836014]  ? pci_match_device+0x303/0x790
> [   65.836124]  ? pci_match_device+0x386/0x790
> [   65.836226]  ? __pfx_pci_assign_irq+0x10/0x10
> [   65.836320]  ? kernfs_create_link+0x16a/0x230
> [   65.836418]  ? do_raw_spin_unlock+0x55/0x230
> [   65.836526]  ? __pfx___driver_attach+0x10/0x10
> [   65.836626]  pci_device_probe+0x175/0x2c0
> [   65.836735]  call_driver_probe+0x64/0x1e0
> [   65.836842]  really_probe+0x194/0x740
> [   65.836951]  ? __pfx___driver_attach+0x10/0x10
> [   65.837053]  __driver_probe_device+0x18c/0x3a0
> [   65.837163]  ? __pfx___driver_attach+0x10/0x10
> [   65.837262]  driver_probe_device+0x4a/0x120
> [   65.837369]  __driver_attach+0x19c/0x550
> [   65.837474]  ? __pfx___driver_attach+0x10/0x10
> [   65.837575]  bus_for_each_dev+0xe6/0x150
> [   65.837669]  ? local_clock+0x11/0x30
> [   65.837770]  ? __pfx_bus_for_each_dev+0x10/0x10
> [   65.837891]  bus_add_driver+0x2af/0x4f0
> [   65.838000]  ? __pfx_psb_init+0x10/0x10 [gma500_gfx]
> [   65.838236]  driver_register+0x19f/0x3a0
> [   65.838342]  ? rcu_is_watching+0x11/0xb0
> [   65.838446]  do_one_initcall+0xb5/0x3a0
> [   65.838546]  ? __pfx_do_one_initcall+0x10/0x10
> [   65.838644]  ? __kasan_slab_alloc+0x2c/0x70
> [   65.838741]  ? rcu_is_watching+0x11/0xb0
> [   65.838837]  ? __kmalloc_cache_noprof+0x3e8/0x6e0
> [   65.838937]  ? klp_module_coming+0x1a0/0x2e0
> [   65.839033]  ? do_init_module+0x85/0x7f0
> [   65.839126]  ? kasan_unpoison+0x40/0x70
> [   65.839230]  do_init_module+0x26e/0x7f0
> [   65.839341]  ? __pfx_do_init_module+0x10/0x10
> [   65.839450]  init_module_from_file+0x13f/0x160
> [   65.839549]  ? __pfx_init_module_from_file+0x10/0x10
> [   65.839651]  ? __lock_acquire+0x578/0xae0
> [   65.839791]  ? do_raw_spin_unlock+0x55/0x230
> [   65.839886]  ? idempotent_init_module+0x585/0x720
> [   65.839993]  idempotent_init_module+0x1ff/0x720
> [   65.840097]  ? __pfx_cred_has_capability.isra.0+0x10/0x10
> [   65.840211]  ? __pfx_idempotent_init_module+0x10/0x10
>
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Closes: https://lore.kernel.org/r/5aec1964-072c-4335-8f37-35e6efb4910e@suse.de
> Fixes: d930ffa5d6e8 ("drm/gma500: use drm_crtc_vblank_crtc()")
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/gma500/psb_irq.c | 36 ++++++++++++--------------------
>   1 file changed, 13 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> index 3a946b472064..c224c7ff353c 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -250,7 +250,6 @@ static irqreturn_t gma_irq_handler(int irq, void *arg)
>   void gma_irq_preinstall(struct drm_device *dev)
>   {
>   	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -	struct drm_crtc *crtc;
>   	unsigned long irqflags;
>   
>   	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
> @@ -261,15 +260,10 @@ void gma_irq_preinstall(struct drm_device *dev)
>   	PSB_WSGX32(0x00000000, PSB_CR_EVENT_HOST_ENABLE);
>   	PSB_RSGX32(PSB_CR_EVENT_HOST_ENABLE);
>   
> -	drm_for_each_crtc(crtc, dev) {
> -		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> -
> -		if (vblank->enabled) {
> -			u32 mask = drm_crtc_index(crtc) ? _PSB_VSYNC_PIPEB_FLAG :
> -				_PSB_VSYNC_PIPEA_FLAG;
> -			dev_priv->vdc_irq_mask |= mask;
> -		}
> -	}
> +	if (dev->vblank[0].enabled)
> +		dev_priv->vdc_irq_mask |= _PSB_VSYNC_PIPEA_FLAG;
> +	if (dev->vblank[1].enabled)
> +		dev_priv->vdc_irq_mask |= _PSB_VSYNC_PIPEB_FLAG;
>   
>   	/* Revisit this area - want per device masks ? */
>   	if (dev_priv->ops->hotplug)
> @@ -284,8 +278,8 @@ void gma_irq_preinstall(struct drm_device *dev)
>   void gma_irq_postinstall(struct drm_device *dev)
>   {
>   	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -	struct drm_crtc *crtc;
>   	unsigned long irqflags;
> +	unsigned int i;
>   
>   	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
>   
> @@ -298,13 +292,11 @@ void gma_irq_postinstall(struct drm_device *dev)
>   	PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
>   	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>   
> -	drm_for_each_crtc(crtc, dev) {
> -		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> -
> -		if (vblank->enabled)
> -			gma_enable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
> +	for (i = 0; i < dev->num_crtcs; ++i) {
> +		if (dev->vblank[i].enabled)
> +			gma_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
>   		else
> -			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
> +			gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
>   	}
>   
>   	if (dev_priv->ops->hotplug_enable)
> @@ -345,8 +337,8 @@ void gma_irq_uninstall(struct drm_device *dev)
>   {
>   	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>   	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	struct drm_crtc *crtc;
>   	unsigned long irqflags;
> +	unsigned int i;
>   
>   	if (!dev_priv->irq_enabled)
>   		return;
> @@ -358,11 +350,9 @@ void gma_irq_uninstall(struct drm_device *dev)
>   
>   	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>   
> -	drm_for_each_crtc(crtc, dev) {
> -		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> -
> -		if (vblank->enabled)
> -			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
> +	for (i = 0; i < dev->num_crtcs; ++i) {
> +		if (dev->vblank[i].enabled)
> +			gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
>   	}
>   
>   	dev_priv->vdc_irq_mask &= _PSB_IRQ_SGX_FLAG |

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


