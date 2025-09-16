Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C874B590A2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D2D10E71A;
	Tue, 16 Sep 2025 08:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="C4V47FkI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Lx/ha4c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C4V47FkI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Lx/ha4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F268310E71A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:30:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 915A1220B6;
 Tue, 16 Sep 2025 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758011443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Im2F9BIbBXZDPiTPY4P3Wih0O04uIRbJgzUW86uJT9U=;
 b=C4V47FkImmoKWOoLUircE2i1fgjMpNMDn81UzevR9sf/M/FaX5caNSeMUEAV+VF2OuYmml
 Dr8r5b9dIjqgBLEKXKTs0+iZ6w8LiNftxpsUfrD+4JYvLI64uwTdl96sBzoERUtJDPHh0m
 19jdn5QFyZ2cF5LRpehITu0Is0I6peA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758011443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Im2F9BIbBXZDPiTPY4P3Wih0O04uIRbJgzUW86uJT9U=;
 b=2Lx/ha4c05R2V67RcYlKLPm2+Ake9xzESAXtazP8XECEvwZ0Eyw8FR+rQ4pqTj+CNJGvZ5
 bN95gQaenXlAQ5CA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C4V47FkI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="2Lx/ha4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758011443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Im2F9BIbBXZDPiTPY4P3Wih0O04uIRbJgzUW86uJT9U=;
 b=C4V47FkImmoKWOoLUircE2i1fgjMpNMDn81UzevR9sf/M/FaX5caNSeMUEAV+VF2OuYmml
 Dr8r5b9dIjqgBLEKXKTs0+iZ6w8LiNftxpsUfrD+4JYvLI64uwTdl96sBzoERUtJDPHh0m
 19jdn5QFyZ2cF5LRpehITu0Is0I6peA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758011443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Im2F9BIbBXZDPiTPY4P3Wih0O04uIRbJgzUW86uJT9U=;
 b=2Lx/ha4c05R2V67RcYlKLPm2+Ake9xzESAXtazP8XECEvwZ0Eyw8FR+rQ4pqTj+CNJGvZ5
 bN95gQaenXlAQ5CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 445AA13A63;
 Tue, 16 Sep 2025 08:30:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wNZADzMgyWitIAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 08:30:43 +0000
Message-ID: <c6ef1912-84b8-4f01-85cc-2fb18f1ad1ed@suse.de>
Date: Tue, 16 Sep 2025 10:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
To: Michael Kelley <mhklinux@outlook.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "melissa.srw@gmail.com" <melissa.srw@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "lyude@redhat.com" <lyude@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
References: <20250904145806.430568-1-tzimmermann@suse.de>
 <SN6PR02MB4157E793515BE2B63615AD92D403A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BN7PR02MB4148E80C13605F6EAD2B0A03D40FA@BN7PR02MB4148.namprd02.prod.outlook.com>
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
In-Reply-To: <BN7PR02MB4148E80C13605F6EAD2B0A03D40FA@BN7PR02MB4148.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 915A1220B6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[outlook.com,bootlin.com,gmail.com,ffwll.ch,linux.intel.com,redhat.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 TO_DN_EQ_ADDR_SOME(0.00)[]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo, outlook.com:email,
 suse.com:url]
X-Spam-Score: -3.01
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

Am 09.09.25 um 05:29 schrieb Michael Kelley:
> From: Michael Kelley Sent: Thursday, September 4, 2025 10:36 PM
>> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, September 4, 2025 7:56 AM
>>> Compositors often depend on vblanks to limit their display-update
>>> rate. Without, they see vblank events ASAP, which breaks the rate-
>>> limit feature. This creates high CPU overhead. It is especially a
>>> problem with virtual devices with fast framebuffer access.
>>>
>>> The series moves vkms' vblank timer to DRM and converts the hyperv
>>> DRM driver. An earlier version of this series contains examples of
>>> other updated drivers. In principle, any DRM driver without vblank
>>> hardware can use the timer.
>> I've tested this patch set in a Hyper-V guest against the linux-next20250829
>> kernel. All looks good. Results and perf are the same as reported here [4].
>> So far I haven't seen the "vblank timer overrun" error, which is consistent
>> with the changes you made since my earlier testing. I'll keep running this
>> test kernel for a while to see if anything anomalous occurs.
> As I continued to run with this patch set, I got a single occurrence of this
> WARN_ON. I can't associate it with any particular action as I didn't notice
> it until well after it occurred.

I've investigated. The stack trace comes from the kernel console's 
display update. It runs concurrently to the vblank timeout. What likely 
happens here is that the update code reads two values and in between, 
the vblank timeout updates them. So the update then compares an old and 
a new value; leading to an incorrect result with triggers the warning.

I'll include a fix in the series' next iteration. But I also think that 
it's not critical. DRM's vblank helpers can usually deal with such problems.

Best regards
Thomas


>
> [213730.719364] ------------[ cut here ]------------
> [213730.719423] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] drm_WARN_ON(!ktime_compare(*vblank_time, vblank->time))
> [213730.719522] WARNING: drivers/gpu/drm/drm_vblank.c:2309 at drm_crtc_vblank_get_vblank_timeout+0x90/0xb0 [drm], CPU#4: kworker/4:0/7172
> [213730.719871] Modules linked in: nls_iso8859_1(E) dm_multipath(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) binfmt_misc(E) intel_rapl_msr(E) intel_rapl_common(E) rapl(E) hyperv_fb(E) cfbfillrect(E) cfbimgblt(E) fb_io_fops(E) serio_raw(E) cfbcopyarea(E) hv_balloon(E) joydev(E) mac_hid(E) sch_fq_codel(E) msr(E) ramoops(E) reed_solomon(E) efi_pstore(E) autofs4(E) btrfs(E) blake2b_generic(E) raid10(E) raid456(E) async_raid6_recov(E) async_memcpy(E) async_pq(E) async_xor(E) async_tx(E) xor(E) raid6_pq(E) raid1(E) raid0(E) hyperv_drm(E) drm_client_lib(E) drm_shmem_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) drm_kms_helper(E) drm(E) drm_panel_orientation_quirks(E) fb(E) hid_generic(E) hid_hyperv(E) lcd(E) hid(E) hv_storvsc(E) ledtrig_backlight(E) hyperv_keyboard(E) hv_netvsc(E) hv_utils(E) scsi_transport_fc(E) ghash_clmulni_intel(E) hv_vmbus(E) aesni_intel(E)
> [213730.720514] CPU: 4 UID: 0 PID: 7172 Comm: kworker/4:0 Kdump: loaded Tainted: G            E       6.17.0-rc3-next-20250829+ #3 PREEMPT(voluntary)
> [213730.723220] Tainted: [E]=UNSIGNED_MODULE
> [213730.724452] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 11/21/2024
> [213730.724993] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> [213730.725491] RIP: 0010:drm_crtc_vblank_get_vblank_timeout+0x90/0xb0 [drm]
> [213730.726082] Code: 8b 7f 08 4c 8b 67 50 4d 85 e4 74 33 e8 99 b6 7f c7 48 c7 c1 60 e8 93 c0 4c 89 e2 48 c7 c7 b5 25 94 c0 48 89 c6 e8 00 06 e3 c6 <0f> 0b eb c0 e8 07 f6 f1 c6 48 89 03 5b 41 5c 5d c3 cc cc cc cc 4c
> [213730.726506] RSP: 0018:ffffbba54e0efc00 EFLAGS: 00010282
> [213730.726692] RAX: 0000000000000000 RBX: ffffbba54e0efc78 RCX: 0000000000000027
> [213730.726899] RDX: ffff954f07d1cec8 RSI: 0000000000000001 RDI: ffff954f07d1cec0
> [213730.727094] RBP: ffffbba54e0efc10 R08: 0000000000000000 R09: ffffbba54e0efa70
> [213730.727280] R10: ffffbba54e0efa68 R11: ffffffff88d4c748 R12: ffff954e010a4cc0
> [213730.727456] R13: 0000000000000000 R14: ffff954e20070d80 R15: ffff954e251002c8
> [213730.727636] FS:  0000000000000000(0000) GS:ffff954f7e938000(0000) knlGS:0000000000000000
> [213730.727834] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [213730.728009] CR2: 00007fe11629d010 CR3: 000000011f843004 CR4: 0000000000b70ef0
> [213730.728186] Call Trace:
> [213730.728359]  <TASK>
> [213730.728511]  drm_crtc_vblank_helper_get_vblank_timestamp_from_timer+0x15/0x20 [drm_kms_helper]
> [213730.728674]  drm_crtc_get_last_vbltimestamp+0x55/0x90 [drm]
> [213730.728864]  drm_crtc_next_vblank_start+0x4e/0x90 [drm]
> [213730.729043]  drm_atomic_helper_wait_for_fences+0x7c/0x1e0 [drm_kms_helper]
> [213730.729196]  drm_atomic_helper_commit+0xa1/0x160 [drm_kms_helper]
> [213730.729335]  drm_atomic_commit+0xb0/0xe0 [drm]
> [213730.729481]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [213730.729643]  drm_atomic_helper_dirtyfb+0x1aa/0x280 [drm_kms_helper]
> [213730.729800]  drm_fbdev_shmem_helper_fb_dirty+0x4c/0xb0 [drm_shmem_helper]
> [213730.729939]  drm_fb_helper_damage_work+0x8d/0x170 [drm_kms_helper]
> [213730.730071]  process_one_work+0x19c/0x3f0
> [213730.730204]  worker_thread+0x2c3/0x3d0
> [213730.730332]  kthread+0x116/0x230
> [213730.730459]  ? __pfx_worker_thread+0x10/0x10
> [213730.730580]  ? _raw_spin_unlock_irq+0x12/0x40
> [213730.730744]  ? __pfx_kthread+0x10/0x10
> [213730.730898]  ret_from_fork+0xec/0x130
> [213730.731027]  ? __pfx_kthread+0x10/0x10
> [213730.731152]  ret_from_fork_asm+0x1a/0x30
> [213730.731277]  </TASK>
> [213730.731396] ---[ end trace 0000000000000000 ]---
>
>> For Patches 1, 2, and 4 of the series on a Hyper-V guest,
>>
>> Tested-by: Michael Kelley <mhklinux@outlook.com>
>>
>> [4] https://lore.kernel.org/dri-devel/20250523161522.409504-1-
>> mhklinux@outlook.com/T/#m2e288dddaf7b3c025bbbf88da4b4c39e7aa950a7
>>
>>> The series has been motivated by a recent discussion about hypervdrm [1]
>>> and other long-standing bug reports. [2][3]
>>>
>>> v3:
>>> - fix deadlock (Ville, Lyude)
>>> v2:
>>> - rework interfaces
>>>
>>> [1] https://lore.kernel.org/dri-devel/20250523161522.409504-1-
>> mhklinux@outlook.com/T/#ma2ebb52b60bfb0325879349377738fadcd7cb7ef
>>> [2] https://bugzilla.suse.com/show_bug.cgi?id=1189174
>>> [3] https://invent.kde.org/plasma/kwin/-/merge_requests/1229#note_284606
>>>
>>> Thomas Zimmermann (4):
>>>    drm/vblank: Add vblank timer
>>>    drm/vblank: Add CRTC helpers for simple use cases
>>>    drm/vkms: Convert to DRM's vblank timer
>>>    drm/hypervdrm: Use vblank timer
>>>
>>>   Documentation/gpu/drm-kms-helpers.rst       |  12 ++
>>>   drivers/gpu/drm/Makefile                    |   3 +-
>>>   drivers/gpu/drm/drm_vblank.c                | 161 +++++++++++++++++-
>>>   drivers/gpu/drm/drm_vblank_helper.c         | 176 ++++++++++++++++++++
>>>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  11 ++
>>>   drivers/gpu/drm/vkms/vkms_crtc.c            |  83 +--------
>>>   drivers/gpu/drm/vkms/vkms_drv.h             |   2 -
>>>   include/drm/drm_modeset_helper_vtables.h    |  12 ++
>>>   include/drm/drm_vblank.h                    |  32 ++++
>>>   include/drm/drm_vblank_helper.h             |  56 +++++++
>>>   10 files changed, 467 insertions(+), 81 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
>>>   create mode 100644 include/drm/drm_vblank_helper.h
>>>
>>> --
>>> 2.50.1

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


