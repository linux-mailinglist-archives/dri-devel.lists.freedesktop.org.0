Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E765C2B962
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 13:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0836C10E3C0;
	Mon,  3 Nov 2025 12:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1lrI0UKt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MU50EIZr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aJJzng+V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w5ntRnCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5428110E3C0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 12:15:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C819721C58;
 Mon,  3 Nov 2025 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762172143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3ri9BSk3eT6SSyGh5p3ni6Ffc5m3Og2UJXko5axiUwc=;
 b=1lrI0UKt6EDL4/KQGFSYPmYa384/qZJUIkSVJocI+bjO6Z3QYDYWy7wXsOhXtspSLgylX+
 h2J21eYN5mMH6XuqJ8/bQkDa1LMaJygujZpT2OWwp/xFt1JoEOLisYPqoDmOfbnNIZlthr
 r9Czn2OE8PVGF1fY2MX5NdTDpOHg/x0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762172143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3ri9BSk3eT6SSyGh5p3ni6Ffc5m3Og2UJXko5axiUwc=;
 b=MU50EIZrwsYgRBf4M3OuYPK5EZJhA7SRe/M8nYPeTqj8PVMR8Qy5rwkJnEbUXQ2+rfS2Fg
 FWDj+W7O3+5+HoAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aJJzng+V;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w5ntRnCa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762172142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3ri9BSk3eT6SSyGh5p3ni6Ffc5m3Og2UJXko5axiUwc=;
 b=aJJzng+V0J4GRITd5cK3PSpVtzGPpnIRqqDosaGantnt6LnxPnIvMWCqlI2gPD6glZ5pqn
 Q8BQdRCkiyFTq++V3ihxqnMB/JVyY8GrzCBuWH+SH7F4ndGGVuj7CnbnC/o3CmZ7vADDKj
 6zh58lOBPjtVrcLzCDrICoK1OIHkaIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762172142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3ri9BSk3eT6SSyGh5p3ni6Ffc5m3Og2UJXko5axiUwc=;
 b=w5ntRnCat3Df1KrPoQ001K9FlRzVgqkTSf/+5OJQ6cIdtvVEH2zgiDFjeu2XUDVuGiT9dD
 hU1g5pI3OuRCMPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 769DF1364F;
 Mon,  3 Nov 2025 12:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DBuEG+6cCGm/UQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Nov 2025 12:15:42 +0000
Message-ID: <5b7b4a3c-9207-4a46-b1ad-44146503b4b9@suse.de>
Date: Mon, 3 Nov 2025 13:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][ASAN] drm/client: Deprecate struct
 drm_client_buffer.gem
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 rrameshbabu@nvidia.com, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 francesco@valla.it, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20251027121042.143588-1-tzimmermann@suse.de>
 <20251027121042.143588-5-tzimmermann@suse.de>
 <CAO6MGtjg8PiRiSLomJQRBduTBSC0WkqX67tEZwA9qwOgRzchpw@mail.gmail.com>
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
In-Reply-To: <CAO6MGtjg8PiRiSLomJQRBduTBSC0WkqX67tEZwA9qwOgRzchpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C819721C58
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,valla.it,gmail.com,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 URIBL_BLOCKED(0.00)[bootlin.com:url,suse.com:url];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
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

Hi

Am 31.10.25 um 16:49 schrieb Ian Forbes:
> On Mon, Oct 27, 2025 at 7:11 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> The client buffer's framebuffer holds a reference and pointer on
>> each of its GEM buffer objects. Thus the field gem in the client-
>> buffer struct is not necessary. Deprecated the field and convert
>> the client-buffer helpers to use the framebuffer's objects.
>>
>> In drm_client_buffer_delete(), do a possible vunmap before releasing
>> the framebuffer. Otherwise we'd eventually release the framebuffer
>> before unmaping its buffer objects.
>>
>> v2:
>> - avoid dependency on CONFIG_DRM_KMS_HELPER
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
> This patch has caused a crash on vmwgfx with ASAN enabled.

I haven't tried, but I think we need to set obj[0] in struct 
drm_framebuffer near [1]. It's done in another case already [2].

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.17.6/source/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c#L555
[2] 
https://elixir.bootlin.com/linux/v6.17.6/source/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c#L638

>
> [   22.286155] Console: switching to colour dummy device 80x25
> [   22.359287] vmwgfx 0000:00:0f.0: vgaarb: deactivate vga console
> [   22.388482] vmwgfx 0000:00:0f.0: [drm] FIFO at 0x00000000fb800000
> size is 8192 KiB
> [   22.390036] vmwgfx 0000:00:0f.0: [drm] VRAM at 0x00000000f0000000
> size is 131072 KiB
> [   22.391255] vmwgfx 0000:00:0f.0: [drm] Running on SVGA version 2.
> [   22.392209] vmwgfx 0000:00:0f.0: [drm] Capabilities: rect copy,
> cursor, cursor bypass, cursor bypass 2, 8bit emulation, alpha cursor,
> 3D, extended fifo, multimon, pitchlock, irq mask, display topology,
> gmr, traces, gmr2, screen object 2, command buffers, command buffers
> 2, gbobject, dx, hp cmd queue, no bb restriction, cap2 register,
> [   22.396463] vmwgfx 0000:00:0f.0: [drm] Capabilities2: grow otable,
> intra surface copy, dx2, gb memsize 2, screendma reg, otable ptdepth2,
> non ms to ms stretchblt, cursor mob, mshint, cb max size 4mb, dx3,
> frame type, trace full fb, extra regs, lo staging,
> [   22.400175] vmwgfx 0000:00:0f.0: [drm] DMA map mode: Caching DMA mappings.
> [   22.400224] audit: type=1130 audit(1761925118.444:63): pid=1 uid=0
> auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0
> msg='unit=systemd-fsck@dev-disk-by\x2duuid-AFBE\x2d8A94 comm="systemd"
> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> res=success'
> [   22.401320] vmwgfx 0000:00:0f.0: [drm] Legacy memory limits: VRAM =
> 4096 KiB, FIFO = 256 KiB, surface = 0 KiB
> [   22.406225] vmwgfx 0000:00:0f.0: [drm] MOB limits: max mob size =
> 1048576 KiB, max mob pages = 524288
> [   22.407602] vmwgfx 0000:00:0f.0: [drm] Max GMR ids is 64
> [   22.408398] vmwgfx 0000:00:0f.0: [drm] Max number of GMR pages is 65536
> [   22.409393] vmwgfx 0000:00:0f.0: [drm] Maximum display memory size
> is 262144 KiB
> [   22.419541] vmwgfx 0000:00:0f.0: [drm] Screen Target display unit initialized
> [   22.422876] vmwgfx 0000:00:0f.0: [drm] Fifo max 0x00040000 min
> 0x00001000 cap 0x0000077f
> [   22.426030] vmwgfx 0000:00:0f.0: [drm] Using command buffers with DMA pool.
> [   22.427664] vmwgfx 0000:00:0f.0: [drm] Available shader model: SM_5_1X.
> [   22.621336] [drm] Initialized vmwgfx 2.21.0 for 0000:00:0f.0 on minor 0
> [   22.627782] fbcon: vmwgfxdrmfb (fb0) is primary device
> [   22.640191] Console: switching to colour frame buffer device 160x50
> [   22.641788] Oops: general protection fault, probably for
> non-canonical address 0xdffffc000000001f: 0000 [#1] SMP KASAN NOPTI
> [   22.641795] KASAN: null-ptr-deref in range
> [0x00000000000000f8-0x00000000000000ff]
> [   22.641802] CPU: 6 UID: 0 PID: 134 Comm: kworker/6:1 Not tainted
> 6.18.0-rc2+ #63 PREEMPT(lazy)
> [   22.641809] Hardware name: VMware, Inc. VMware20,1/440BX Desktop
> Reference Platform, BIOS VMW201.00V.24928539.B64.2508260915 08/26/2025
> [   22.641812] Workqueue: events drm_fb_helper_damage_work
> [   22.641824] RIP: 0010:drm_gem_lock+0x25/0x50
> [   22.641831] Code: 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 b8
> 00 00 00 00 00 fc ff df 53 48 89 fb 48 81 c7 f8 00 00 00 48 89 fa 48
> c1 ea 03 <80> 3c 02 00 75 0f 48 8b bb f8 00 00 00 31 f6 5b e9 16 2e 15
> 01 e8
> [   22.641835] RSP: 0018:ffff88810638fb78 EFLAGS: 00010202
> [   22.641838] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff9e694d16
> [   22.641841] RDX: 000000000000001f RSI: ffff88810638fbf0 RDI: 00000000000000f8
> [   22.641844] RBP: ffff88810638fbb0 R08: 0000000000000001 R09: ffffed1020c71f6d
> [   22.641847] R10: ffff88810638fb6f R11: 0000000000000006 R12: 0000000000000000
> [   22.641849] R13: ffff88810bfc6710 R14: ffff88810638fbf0 R15: ffff88810638fbf0
> [   22.641852] FS:  0000000000000000(0000) GS:ffff8882b6b3b000(0000)
> knlGS:0000000000000000
> [   22.641855] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   22.641858] CR2: 00007f7357b568a1 CR3: 0000000106a70006 CR4: 00000000007706f0
> [   22.641887] PKRU: 55555554
> [   22.641889] Call Trace:
> [   22.641891]  <TASK>
> [   22.641894]  drm_client_buffer_vmap_local+0x78/0x140
> [   22.641903]  drm_fbdev_ttm_helper_fb_dirty+0x20c/0x510 [drm_ttm_helper]
> [   22.641913]  ? __pfx_drm_fbdev_ttm_helper_fb_dirty+0x10/0x10 [drm_ttm_helper]
> [   22.641918]  ? __raw_spin_lock_irqsave+0x8c/0xf0
> [   22.641924]  ? __pfx___raw_spin_lock_irqsave+0x10/0x10
> [   22.641928]  ? __pfx_mutex_lock+0x10/0x10
> [   22.641936]  drm_fb_helper_fb_dirty+0x29a/0x5e0
> [   22.641942]  ? __pfx_drm_fb_helper_fb_dirty+0x10/0x10
> [   22.641946]  ? _raw_spin_lock_irq+0x8a/0xe0
> [   22.641950]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [   22.641955]  process_one_work+0x668/0xeb0
> [   22.641962]  worker_thread+0x5f6/0x1060
> [   22.641967]  ? __kthread_parkme+0x8d/0x170
> [   22.641972]  ? __pfx_worker_thread+0x10/0x10
> [   22.641976]  kthread+0x36f/0x710
> [   22.641980]  ? __pfx_kthread+0x10/0x10
> [   22.641983]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [   22.641987]  ? __pfx_kthread+0x10/0x10
> [   22.641990]  ret_from_fork+0x1c9/0x260
> [   22.641995]  ? __pfx_kthread+0x10/0x10
> [   22.641999]  ret_from_fork_asm+0x1a/0x30
> [   22.642004]  </TASK>
> [   22.642006] Modules linked in: vfat(+) snd_ac97_codec(+) vmxnet3(+)
> ac97_bus fat snd_seq snd_pcm gameport vmwgfx(+) snd_rawmidi
> snd_seq_device snd_timer drm_ttm_helper snd i2c_piix4 ttm i2c_smbus
> joydev soundcore loop nfnetlink vsock_loopback
> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zram
> vmw_vmci lz4hc_compress lz4_compress polyval_clmulni
> ghash_clmulni_intel ata_generic pata_acpi serio_raw fuse
> [   22.642056] ---[ end trace 0000000000000000 ]---
> [   22.642059] RIP: 0010:drm_gem_lock+0x25/0x50
> [   22.642063] Code: 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 b8
> 00 00 00 00 00 fc ff df 53 48 89 fb 48 81 c7 f8 00 00 00 48 89 fa 48
> c1 ea 03 <80> 3c 02 00 75 0f 48 8b bb f8 00 00 00 31 f6 5b e9 16 2e 15
> 01 e8
> [   22.642066] RSP: 0018:ffff88810638fb78 EFLAGS: 00010202
> [   22.642069] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff9e694d16
> [   22.642072] RDX: 000000000000001f RSI: ffff88810638fbf0 RDI: 00000000000000f8
> [   22.642074] RBP: ffff88810638fbb0 R08: 0000000000000001 R09: ffffed1020c71f6d
> [   22.642077] R10: ffff88810638fb6f R11: 0000000000000006 R12: 0000000000000000
> [   22.642079] R13: ffff88810bfc6710 R14: ffff88810638fbf0 R15: ffff88810638fbf0
> [   22.642082] FS:  0000000000000000(0000) GS:ffff8882b6b3b000(0000)
> knlGS:0000000000000000
> [   22.642085] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   22.642087] CR2: 00007f7357b568a1 CR3: 0000000106a70006 CR4: 00000000007706f0
> [   22.642112] PKRU: 55555554

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


