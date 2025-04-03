Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E465A79C80
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 09:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A91110E0B0;
	Thu,  3 Apr 2025 07:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HyMI5ZVC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oWQ1tBVQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HyMI5ZVC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oWQ1tBVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAB410E0B0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 07:03:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BB1F21180;
 Thu,  3 Apr 2025 07:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743663825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qWUXZlns8wK6Yy/2YTDMOM0tFvpWwWjKHsqGMrmvUw0=;
 b=HyMI5ZVC1tDuhF6ihciW1NdUdEBPSTgpiemgFPW+REAr3/PpMAJhFD8nyIWW0XZo4YmWv0
 UB09iBSA/rx2kCkPiXjOys4msT4UHx5B9jrDtxejrOt159wl730Pf7f2KH//AYmGVtaIWK
 +5GllV10B6hDr1OmEMexOc/JWa3uNR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743663825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qWUXZlns8wK6Yy/2YTDMOM0tFvpWwWjKHsqGMrmvUw0=;
 b=oWQ1tBVQ3j6i8rm5+QW9poGHIj077LX5rQAVVVIAm0upIc24irN5lLu98EiaQ55xNRcJMA
 pnGC9ECKvxhb6uAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743663825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qWUXZlns8wK6Yy/2YTDMOM0tFvpWwWjKHsqGMrmvUw0=;
 b=HyMI5ZVC1tDuhF6ihciW1NdUdEBPSTgpiemgFPW+REAr3/PpMAJhFD8nyIWW0XZo4YmWv0
 UB09iBSA/rx2kCkPiXjOys4msT4UHx5B9jrDtxejrOt159wl730Pf7f2KH//AYmGVtaIWK
 +5GllV10B6hDr1OmEMexOc/JWa3uNR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743663825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qWUXZlns8wK6Yy/2YTDMOM0tFvpWwWjKHsqGMrmvUw0=;
 b=oWQ1tBVQ3j6i8rm5+QW9poGHIj077LX5rQAVVVIAm0upIc24irN5lLu98EiaQ55xNRcJMA
 pnGC9ECKvxhb6uAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1594713A2C;
 Thu,  3 Apr 2025 07:03:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id epgFBNEy7mfZPgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Apr 2025 07:03:45 +0000
Message-ID: <4a32a492-0ff7-49fc-b208-0ae8b4d2369d@suse.de>
Date: Thu, 3 Apr 2025 09:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part 1)
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, chaitanya.kumar.borah@intel.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <yt2vhw5pkhivn27johxyskpmcobika6ze3undthzdxfcy6yaac@t5u72u4auisi>
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
In-Reply-To: <yt2vhw5pkhivn27johxyskpmcobika6ze3undthzdxfcy6yaac@t5u72u4auisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.993]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[17]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,amd.com,redhat.com,arm.com,collabora.com,imgtec.com,lists.freedesktop.org,vger.kernel.org,intel.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
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

Hi

Am 03.04.25 um 02:37 schrieb Lucas De Marchi:
> On Sun, Mar 23, 2025 at 12:25:58AM +0300, Dmitry Osipenko wrote:
>> Hi,
>>
>> This a continuation of a year-old series that adds generic DRM-shmem
>> shrinker [1]. The old series became too big with too many patches, more
>> reasonable to split it up into multiple smaller patchsets. Here is
>> the firtst part that makes preparatory DRM changes.
>>
>> [1] 
>> https://lore.kernel.org/dri-devel/20240105184624.508603-1-dmitry.osipenko@collabora.com/
>
> After these patches got merged I started seeing this on ast driver
> and a similar one qemu-cirrus:

Same here with simpledrm. I wanted to bisect today.

Best regards
Thomas

>
> [   88.731560] fbcon: astdrmfb (fb0) is primary device
> [   88.767100] Console: switching to colour frame buffer device 128x48
> [   88.768982] ------------[ cut here ]------------
> [   88.768989] ast 0000:02:00.0: [drm] Dirty helper failed: ret=-12
> [   88.769016] WARNING: CPU: 0 PID: 10 at 
> drivers/gpu/drm/drm_fbdev_shmem.c:118 
> drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 [drm_shmem_helper]
> ...
> [   88.769092] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 
> 6.14.0-xe+ #2
> ...
> [   88.769095] Workqueue: events drm_fb_helper_damage_work 
> [drm_kms_helper]
> [   88.769109] RIP: 0010:drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 
> [drm_shmem_helper]
> [   88.769112] Code: 4d 8b 6c 24 50 4d 85 ed 75 04 4d 8b 2c 24 4c 89 
> e7 e8 98 36 a9 e0 89 d9 4c 89 ea 48 c7 c7 d8 65 54 a1 48 89 c6 e8 64 
> f4 ee df <0f> 0b eb 8b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 
> 0f 1f
> [   88.769113] RSP: 0018:ffa00000003e7da0 EFLAGS: 00010246
> [   88.769115] RAX: 0000000000000000 RBX: 00000000fffffff4 RCX: 
> 0000000000000000
> [   88.769117] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000000
> [   88.769117] RBP: ffa00000003e7db8 R08: 0000000000000000 R09: 
> 0000000000000000
> [   88.769118] R10: 0000000000000000 R11: 0000000000000000 R12: 
> ff11000122c190c8
> [   88.769119] R13: ff11000118588a10 R14: ff1100010f4a04c0 R15: 
> ff1100019750b588
> [   88.769120] FS:  0000000000000000(0000) GS:ff11007e7d000000(0000) 
> knlGS:0000000000000000
> [   88.769121] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   88.769122] CR2: 00007e43af4056f0 CR3: 00000080c89f0003 CR4: 
> 0000000000f73ef0
> [   88.769123] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
> 0000000000000000
> [   88.769124] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 
> 0000000000000400
> [   88.769125] PKRU: 55555554
> [   88.769126] Call Trace:
> [   88.769127]  <TASK>
> [   88.769129]  ? show_regs.cold+0x19/0x20
> [   88.769132]  ? drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 
> [drm_shmem_helper]
> [   88.769134]  ? __warn.cold+0xd2/0x17f
> [   88.769136]  ? drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 
> [drm_shmem_helper]
> [   88.769139]  ? report_bug+0x114/0x160
> [   88.769143]  ? handle_bug+0x6e/0xb0
> [   88.769146]  ? exc_invalid_op+0x18/0x80
> [   88.769147]  ? asm_exc_invalid_op+0x1b/0x20
> [   88.769153]  ? drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 
> [drm_shmem_helper]
> [   88.769156]  drm_fb_helper_damage_work+0x8a/0x190 [drm_kms_helper]
> [   88.769164]  process_one_work+0x224/0x5f0
> [   88.769170]  worker_thread+0x1d4/0x3e0
> [   88.769173]  ? __pfx_worker_thread+0x10/0x10
> [   88.769175]  kthread+0x10b/0x260
> [   88.769178]  ? __pfx_kthread+0x10/0x10
> [   88.769181]  ret_from_fork+0x44/0x70
> [   88.769184]  ? __pfx_kthread+0x10/0x10
> [   88.769186]  ret_from_fork_asm+0x1a/0x30
> [   88.769193]  </TASK>
> [   88.769194] irq event stamp: 430275
> [   88.769195] hardirqs last  enabled at (430281): 
> [<ffffffff81505836>] vprintk_emit+0x416/0x470
> [   88.769198] hardirqs last disabled at (430286): 
> [<ffffffff81505868>] vprintk_emit+0x448/0x470
> [   88.769200] softirqs last  enabled at (428924): 
> [<ffffffff8143977d>] __irq_exit_rcu+0x12d/0x150
> [   88.769203] softirqs last disabled at (428861): 
> [<ffffffff8143977d>] __irq_exit_rcu+0x12d/0x150
> [   88.769205] ---[ end trace 0000000000000000 ]---
> [   88.769375] ast 0000:02:00.0: [drm] fb0: astdrmfb frame buffer device
> [   88.802554] ast 0000:02:00.0: [drm:drm_fb_helper_hotplug_event 
> [drm_kms_helper]]
> I confirmed that reverting the series (together with 2 patches for 
> accel/ivpu on top)
> makes the warning go away. Any idea what's going on?
>
>
> Lucas De Marchi

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

