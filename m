Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ACC911C9E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F225B10EB01;
	Fri, 21 Jun 2024 07:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="odhO3TIL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7s7wXJ+G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="odhO3TIL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7s7wXJ+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9661510EB01;
 Fri, 21 Jun 2024 07:16:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A59A219F5;
 Fri, 21 Jun 2024 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718954161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ExVyzA5GAO2npJoQfvbpADzRgbzVvwPjVtHhZayvxV0=;
 b=odhO3TILTHE9sO8BQdiHRVZF1J3pGg8dO/Vh8z0w9TR1PibqOwivJpqglRjLMhdjUjAngG
 rMy4/BureZSb9NMNNX19l9KfDrU2yXJPqJ0W6KGN16C6loovLji0P/39uldw2VfCjuXueN
 QGNHRuSdjTI7eIg93SaTo9fSxDr7Ogw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718954161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ExVyzA5GAO2npJoQfvbpADzRgbzVvwPjVtHhZayvxV0=;
 b=7s7wXJ+Gx8QxO/OZtiMhCjOFSQtEaVzjGMbmZ7tIEP0TAbJPp6NlPbQgEcg0KCrrn+ZMqD
 OEdtA0yuB4k3uvDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=odhO3TIL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7s7wXJ+G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718954161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ExVyzA5GAO2npJoQfvbpADzRgbzVvwPjVtHhZayvxV0=;
 b=odhO3TILTHE9sO8BQdiHRVZF1J3pGg8dO/Vh8z0w9TR1PibqOwivJpqglRjLMhdjUjAngG
 rMy4/BureZSb9NMNNX19l9KfDrU2yXJPqJ0W6KGN16C6loovLji0P/39uldw2VfCjuXueN
 QGNHRuSdjTI7eIg93SaTo9fSxDr7Ogw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718954161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ExVyzA5GAO2npJoQfvbpADzRgbzVvwPjVtHhZayvxV0=;
 b=7s7wXJ+Gx8QxO/OZtiMhCjOFSQtEaVzjGMbmZ7tIEP0TAbJPp6NlPbQgEcg0KCrrn+ZMqD
 OEdtA0yuB4k3uvDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D5BC13AAA;
 Fri, 21 Jun 2024 07:16:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gN4/EbEodWbIEQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Jun 2024 07:16:01 +0000
Message-ID: <7c9d045f-6adc-4e99-9ae3-1e98d1952523@suse.de>
Date: Fri, 21 Jun 2024 09:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: remove load callback
To: Hoi Pok Wu <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240607011413.8839-1-wuhoipok@gmail.com>
 <060bcbb2-0b93-49af-ad17-e84ecd4da4fd@suse.de>
 <CANyH0kBTsfMoTM3vksW=dS8bxPNxZHjJFRji6eBEmzt=NRXf_w@mail.gmail.com>
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
In-Reply-To: <CANyH0kBTsfMoTM3vksW=dS8bxPNxZHjJFRji6eBEmzt=NRXf_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9A59A219F5
X-Spam-Score: -4.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FREEMAIL_TO(0.00)[gmail.com];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
 TO_DN_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 20.06.24 um 16:30 schrieb Hoi Pok Wu:
> Dear Thomas,
>
> Thank you for testing my patch. The dev->dev_private is indeed the problem.
>
> However, most of the functions that uses dev->dev_private is passing
> drm_device as parameter, and then uses dev->dev_private to retrieve
> radeon_device,
> contradicting what the patch intended. It should use radeon_device directly.
> Should I send a follow up patch with the updated patch?

Simply assign the radeon_device to dev_private as before and you'll be 
fine. Reworking all function calls would be a patchset of its own.

Best regards
Thomas

>
> Thank you.
>
> Best Regards
> Wu
>
> On Wed, Jun 19, 2024 at 10:28 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 07.06.24 um 03:14 schrieb wu hoi pok:
>>> this patch is to remove the load callback from the kms_driver,
>>> following closly to amdgpu, radeon_driver_load_kms and devm_drm_dev_alloc
>>> are used, most of the changes here are rdev->ddev to rdev_to_drm,
>>> which maps to adev_to_drm in amdgpu. however this patch is not tested on
>>> hardware, so if you are free and have a gcn1 gcn2 card please do so.
>>>
>>> Signed-off-by: wu hoi pok <wuhoipok@gmail.com>
>> I volunteer for testing. The test device is
>>
>> 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
>> [AMD/ATI] Turks PRO [Radeon HD 6570/7570/8550 / R5 230] (prog-if 00 [VGA
>> controller])
>>           Subsystem: PC Partner Limited / Sapphire Technology Device e193
>>           Flags: bus master, fast devsel, latency 0, IRQ 147
>>           Memory at c0000000 (64-bit, prefetchable) [size=256M]
>>           Memory at dfe20000 (64-bit, non-prefetchable) [size=128K]
>>           I/O ports at e000 [size=256]
>>           Expansion ROM at 000c0000 [disabled] [size=128K]
>>           Capabilities: <access denied>
>>           Kernel driver in use: radeon
>>           Kernel modules: radeon, amdgpu
>>
>>
>> With the current patch, the driver crashes upon booting. Here is your
>> backtrace:
>>
>> [   24.013524] Console: switching to colour dummy device 80x25
>> [   24.021093] radeon 0000:01:00.0: vgaarb: deactivate vga console
>> [   24.031806] [drm] initializing kernel modesetting (TURKS
>> 0x1002:0x6759 0x174B:0xE193 0x00).
>> [   24.041066] ATOM BIOS: YODA
>> [   24.043930]
>> ==================================================================
>> [   24.051195] BUG: KASAN: user-memory-access in
>> radeon_atom_initialize_bios_scratch_regs+0x33/0x110 [radeon]
>> [   24.061287] Read of size 4 at addr 0000000000001058 by task
>> (udev-worker)/349
>> [   24.061292]
>> [   24.061295] CPU: 3 PID: 349 Comm: (udev-worker) Tainted: G U
>> E      6.10.0-rc4-1-default+ #2977
>> [   24.061301] Hardware name: System manufacturer System Product
>> Name/Z170-A, BIOS 3802 03/15/2018
>> [   24.061305] Call Trace:
>> [  OK     24.061308]  <TASK>
>> [   24.061313]  dump_stack_lvl+0x68/0x90
>> [   24.061322]  ? radeon_atom_initialize_bios_scratch_regs+0x33/0x110
>> [radeon]
>> 0m] Finished    24.105026]  kasan_report+0xcf/0x1a0
>> [   24.105039]  ? radeon_atom_initialize_bios_scratch_regs+0x33/0x110
>> [radeon]
>> ;1;39mCreate Vol[   24.117055]  ? __pfx_cail_ioreg_read+0x10/0x10 [radeon]
>> atile Files and [   24.123698]
>> radeon_atom_initialize_bios_scratch_regs+0x33/0x110 [radeon]
>> Directories.[   24.131933]  radeon_atombios_init+0x192/0x220 [radeon]
>>
>> [   24.138506]  evergreen_init+0x57/0x400 [radeon]
>> [   24.143473]  radeon_device_init+0x8f2/0x1040 [radeon]
>> [   24.148897]  ? down_read_failed+0x7/0x410
>> [   24.152936]  ? ksm_might_need_to_copy+0x10/0x280
>> [   24.157594]  radeon_driver_load_kms+0xe3/0x330 [radeon]
>> [   24.163198]  radeon_pci_probe+0x117/0x180 [radeon]
>> [   24.168431]  ? __pfx_radeon_pci_probe+0x10/0x10 [radeon]
>> [   24.174161]  local_pci_probe+0x74/0xc0
>> [   24.177945]  pci_call_probe+0xc6/0x260
>> [   24.181727]  ? __pfx_pci_call_probe+0x10/0x10
>> [   24.186118]  ? do_raw_spin_trylock+0xb0/0xf0
>> [   24.190439]  ? pci_match_device+0x1c5/0x240
>> [   24.194651]  ? pci_match_id+0x102/0x150
>> [   24.198522]  ? pci_match_device+0x1dd/0x240
>> [   24.202752]  pci_device_probe+0x9d/0x150
>> [   24.206705]  ? driver_sysfs_add+0xb0/0x130
>> [   24.210838]  really_probe+0x13b/0x490
>> [   24.214547]  __driver_probe_device+0xca/0x1b0
>> [   24.218943]  driver_probe_device+0x4a/0xf0
>> [   24.223073]  __driver_attach+0x136/0x290
>> [   24.227032]  ? __pfx___driver_attach+0x10/0x10
>> [   24.231508]  bus_for_each_dev+0xc0/0x110
>> [   24.235465]  ? __pfx_bus_for_each_dev+0x10/0x10
>> [   24.240032]  ? bus_add_driver+0x17a/0x2b0
>> [   24.244079]  bus_add_driver+0x19a/0x2b0
>> [   24.247950]  driver_register+0xc5/0x140
>> [   24.251817]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
>> [   24.257674]  do_one_initcall+0xbc/0x390
>> [   24.261542]  ? __pfx_do_one_initcall+0x10/0x10
>> [   24.266022]  ? kasan_unpoison+0x40/0x70
>> [   24.269891]  ? rcu_is_watching+0x34/0x60
>> [   24.273849]  ? kmalloc_trace_noprof+0x286/0x320
>> [   24.278415]  ? do_init_module+0x38/0x3a0
>> [   24.282387]  ? kasan_unpoison+0x40/0x70
>> [   24.286264]  do_init_module+0x13a/0x3a0
>> [   24.290133]  init_module_from_file+0xc0/0x100
>> [   24.294523]  ? __pfx_init_module_from_file+0x10/0x10
>> [   24.299522]  ? __lock_release.isra.0+0x132/0x4f0
>> [   24.304185]  ? do_raw_spin_unlock+0x83/0xe0
>> [   24.304209]  idempotent_init_module+0x1b7/0x3e0
>> [   24.304217]  ? __pfx_idempotent_init_module+0x10/0x10
>> [   24.304244]  ? security_capable+0x2e/0x80
>> [   24.322122]  __x64_sys_finit_module+0x78/0xd0
>> [   24.326527]  do_syscall_64+0x69/0x140
>> [   24.330223]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   24.335316] RIP: 0033:0x7f23d81e0bcd
>> [   24.338937] Code: 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 90 90
>> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
>> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1b d2 0d 00 f7 d8 64 89 01 48
>> [   24.357784] RSP: 002b:00007ffc0ab94858 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000139
>> [   24.365430] RAX: ffffffffffffffda RBX: 0000556312b67370 RCX:
>> 00007f23d81e0bcd
>> [   24.372610] RDX: 0000000000000000 RSI: 00007f23d82ea061 RDI:
>> 0000000000000025
>> [   24.379787] RBP: 00007f23d82ea061 R08: 0000000000000001 R09:
>> 0000556312b65820
>> [   24.386960] R10: 0000000000000050 R11: 0000000000000246 R12:
>> 0000000000020000
>> [   24.394138] R13: 0000000000000000 R14: 0000556312b70880 R15:
>> 0000000000000000
>> [   24.401323]  </TASK>
>> [   24.403530]
>> ==================================================================
>> [   24.410813] Disabling lock debugging due to kernel taint
>> [   24.416165] BUG: unable to handle page fault for address:
>> 0000000000001058
>> [   24.423072] #PF: supervisor read access in kernel mode
>> [   24.428245] #PF: error_code(0x0000) - not-present page
>> [   24.433416] PGD 0 P4D 0
>> [   24.435984] Oops: Oops: 0000 [#1] PREEMPT SMP KASAN PTI
>> [   24.441240] CPU: 3 PID: 349 Comm: (udev-worker) Tainted: G BU
>> E      6.10.0-rc4-1-default+ #2977
>> [   24.450775] Hardware name: System manufacturer System Product
>> Name/Z170-A, BIOS 3802 03/15/2018
>> [   24.459512] RIP:
>> 0010:radeon_atom_initialize_bios_scratch_regs+0x33/0x110 [radeon]
>> [   24.467461] Code: 41 54 55 53 48 89 fb 48 83 c7 78 e8 e7 17 cd e7 48
>> 8b 5b 78 4c 8d b3 58 10 00 00 4c 8d ab 08 14 00 00 4c 89 f7 e8 9d 16 cd
>> e7 <8b> ab 58 10 00 00 4c 89 ef e8 bf 17 cd e7 48 8b 83 08 14 00 00 83
>> [   24.486310] RSP: 0018:ffffc90001bdf748 EFLAGS: 00010282
>> [   24.491565] RAX: 0000000000000001 RBX: 0000000000000000 RCX:
>> ffffffffa8116556
>> [   24.498736] RDX: fffffbfff584b7d5 RSI: 0000000000000008 RDI:
>> ffffffffac25bea0
>> [   24.505934] RBP: ffff8881398b8000 R08: 0000000000000001 R09:
>> fffffbfff584b7d4
>> [   24.513105] R10: ffffffffac25bea7 R11: 0000000000000001 R12:
>> ffff8881398b8008
>> [   24.520284] R13: 0000000000001408 R14: 0000000000001058 R15:
>> ffffffffc08ffb00
>> [   24.527458] FS:  00007f23d7627900(0000) GS:ffff88841d800000(0000)
>> knlGS:0000000000000000
>> [   24.535591] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   24.541396] CR2: 0000000000001058 CR3: 0000000104e24003 CR4:
>> 00000000003706f0
>> [   24.548568] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>> 0000000000000000
>> [   24.555741] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
>> 0000000000000400
>> [   24.562916] Call Trace:
>> [   24.565390]  <TASK>
>> [   24.567511]  ? show_trace_log_lvl+0x1af/0x2c0
>> [   24.571896]  ? show_trace_log_lvl+0x1af/0x2c0
>> [   24.576281]  ? show_trace_log_lvl+0x1af/0x2c0
>> [   24.580679]  ? radeon_atombios_init+0x192/0x220 [radeon]
>> [   24.586355]  ? __die_body.cold+0x8/0x12
>> [   24.590220]  ? page_fault_oops+0xed/0x190
>> [   24.594258]  ? __pfx_page_fault_oops+0x10/0x10
>> [   24.598736]  ? do_user_addr_fault+0x44f/0x710
>> [   24.603129]  ? rcu_is_watching+0x34/0x60
>> [   24.607088]  ? exc_page_fault+0x65/0xf0
>> [   24.610956]  ? asm_exc_page_fault+0x22/0x30
>> [   24.615174]  ? __pfx_cail_ioreg_read+0x10/0x10 [radeon]
>> [   24.620831]  ? add_taint+0x26/0x70
>> [   24.624246]  ? radeon_atom_initialize_bios_scratch_regs+0x33/0x110
>> [radeon]
>> [   24.631556]  ? radeon_atom_initialize_bios_scratch_regs+0x33/0x110
>> [radeon]
>> [   24.638844]  radeon_atombios_init+0x192/0x220 [radeon]
>> [   24.644309]  evergreen_init+0x57/0x400 [radeon]
>> [   24.649237]  radeon_device_init+0x8f2/0x1040 [radeon]
>> [   24.654662]  ? down_read_failed+0x7/0x410
>> [   24.658670]  ? ksm_might_need_to_copy+0x10/0x280
>> [   24.663309]  radeon_driver_load_kms+0xe3/0x330 [radeon]
>> [   24.668892]  radeon_pci_probe+0x117/0x180 [radeon]
>> [   24.674012]  ? __pfx_radeon_pci_probe+0x10/0x10 [radeon]
>> [   24.679651]  local_pci_probe+0x74/0xc0
>> [   24.683405]  pci_call_probe+0xc6/0x260
>> [   24.687158]  ? __pfx_pci_call_probe+0x10/0x10
>> [   24.691512]  ? do_raw_spin_trylock+0xb0/0xf0
>> [   24.695789]  ? pci_match_device+0x1c5/0x240
>> [   24.699974]  ? pci_match_id+0x102/0x150
>> [   24.703809]  ? pci_match_device+0x1dd/0x240
>> [   24.708000]  pci_device_probe+0x9d/0x150
>> [   24.711924]  ? driver_sysfs_add+0xb0/0x130
>> [   24.716029]  really_probe+0x13b/0x490
>> [   24.719700]  __driver_probe_device+0xca/0x1b0
>> [   24.724059]  driver_probe_device+0x4a/0xf0
>> [   24.728162]  __driver_attach+0x136/0x290
>> [   24.732106]  ? __pfx___driver_attach+0x10/0x10
>> [   24.736551]  bus_for_each_dev+0xc0/0x110
>> [   24.740481]  ? __pfx_bus_for_each_dev+0x10/0x10
>> [   24.745013]  ? bus_add_driver+0x17a/0x2b0
>> [   24.749033]  bus_add_driver+0x19a/0x2b0
>> [   24.752875]  driver_register+0xc5/0x140
>> [   24.756713]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
>> [   24.762519]  do_one_initcall+0xbc/0x390
>> [   24.766357]  ? __pfx_do_one_initcall+0x10/0x10
>> [   24.770806]  ? kasan_unpoison+0x40/0x70
>> [   24.774650]  ? rcu_is_watching+0x34/0x60
>> [   24.778589]  ? kmalloc_trace_noprof+0x286/0x320
>> [   24.783118]  ? do_init_module+0x38/0x3a0
>> [   24.787048]  ? kasan_unpoison+0x40/0x70
>> [   24.790894]  do_init_module+0x13a/0x3a0
>> [   24.794737]  init_module_from_file+0xc0/0x100
>> [   24.799095]  ? __pfx_init_module_from_file+0x10/0x10
>> [   24.804060]  ? __lock_release.isra.0+0x132/0x4f0
>> [   24.808687]  ? do_raw_spin_unlock+0x83/0xe0
>> [   24.812875]  idempotent_init_module+0x1b7/0x3e0
>> [   24.817425]  ? __pfx_idempotent_init_module+0x10/0x10
>> [   24.822493]  ? security_capable+0x2e/0x80
>> [   24.826514]  __x64_sys_finit_module+0x78/0xd0
>> [   24.830870]  do_syscall_64+0x69/0x140
>> [   24.834539]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   24.839591] RIP: 0033:0x7f23d81e0bcd
>> [   24.843171] Code: 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 90 90
>> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
>> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1b d2 0d 00 f7 d8 64 89 01 48
>> [   24.861883] RSP: 002b:00007ffc0ab94858 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000139
>> [   24.869444] RAX: ffffffffffffffda RBX: 0000556312b67370 RCX:
>> 00007f23d81e0bcd
>> [   24.876569] RDX: 0000000000000000 RSI: 00007f23d82ea061 RDI:
>> 0000000000000025
>> [   24.883693] RBP: 00007f23d82ea061 R08: 0000000000000001 R09:
>> 0000556312b65820
>> [   24.890819] R10: 0000000000000050 R11: 0000000000000246 R12:
>> 0000000000020000
>> [   24.897943] R13: 0000000000000000 R14: 0000556312b70880 R15:
>> 0000000000000000
>> [   24.905085]  </TASK>
>> [   24.907299] Modules linked in: radeon(E+) crct10dif_pclmul(E)
>> crc32_pclmul(E) ghash_clmulni_intel(E) sha512_ssse3(E) drm_ttm_helper(E)
>> sha256_ssse3(E) ttm(E) sha1_ssse3(E) video(E) hid_generic(E)
>> aesni_intel(E) crypto_simd(E) cryptd(E)
>> [   24.942885] CR2: 0000000000001058
>> [   24.946201] ---[ end trace 0000000000000000 ]---
>> [   24.950810] RIP:
>> 0010:radeon_atom_initialize_bios_scratch_regs+0x33/0x110 [radeon]
>> [   24.958700] Code: 41 54 55 53 48 89 fb 48 83 c7 78 e8 e7 17 cd e7 48
>> 8b 5b 78 4c 8d b3 58 10 00 00 4c 8d ab 08 14 00 00 4c 89 f7 e8 9d 16 cd
>> e7 <8b> ab 58 10 00 00 4c 89 ef e8 bf 17 cd e7 48 8b 83 08 14 00 00 83
>> [   24.977427] RSP: 0018:ffffc90001bdf748 EFLAGS: 00010282
>> [   24.982648] RAX: 0000000000000001 RBX: 0000000000000000 RCX:
>> ffffffffa8116556
>> [   24.989769] RDX: fffffbfff584b7d5 RSI: 0000000000000008 RDI:
>> ffffffffac25bea0
>> [   24.996891] RBP: ffff8881398b8000 R08: 0000000000000001 R09:
>> fffffbfff584b7d4
>> [   25.004016] R10: ffffffffac25bea7 R11: 0000000000000001 R12:
>> ffff8881398b8008
>> [   25.011140] R13: 0000000000001408 R14: 0000000000001058 R15:
>> ffffffffc08ffb00
>> [   25.018265] FS:  00007f23d7627900(0000) GS:ffff88841d800000(0000)
>> knlGS:0000000000000000
>> [   25.026339] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   25.032076] CR2: 0000000000001058 CR3: 0000000104e24003 CR4:
>> 00000000003706f0
>> [   25.039209] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>> 0000000000000000
>> [   25.046329] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
>> 0000000000000400
>>
>>
>> Building with W=1 also shows the following warnings:
>>
>>
>> drivers/gpu/drm/radeon/radeon_kms.c:105: warning: Function parameter or
>> struct member 'rdev' not described in 'radeon_driver_load_kms'
>> drivers/gpu/drm/radeon/radeon_kms.c:105: warning: Excess function
>> parameter 'dev' description in 'radeon_driver_load_kms'
>> drivers/gpu/drm/radeon/radeon_device.c:1280: warning: Excess function
>> parameter 'ddev' description in 'radeon_device_init'
>> drivers/gpu/drm/radeon/radeon_device.c:1280: warning: Excess function
>> parameter 'pdev' description in 'radeon_device_init'
>>
>>
>> I suggest to turn this patch into a little series. First do the trival
>> conversion from rdev->dev to rdev_to_drm() without any internal changes.
>> Then do the rest in a separate patch.
>>
>>
>> [...]
>>> @@ -569,7 +578,7 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
>>>    static const struct drm_driver kms_driver = {
>>>        .driver_features =
>>>            DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
>>> -     .load = radeon_driver_load_kms,
>>> +     // .load = radeon_driver_load_kms,
>> Please remove this line instead of out-commenting it.
>>
>>>        .open = radeon_driver_open_kms,
>>>        .postclose = radeon_driver_postclose_kms,
>>>        .unload = radeon_driver_unload_kms,
>>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
>>> index 02a65971d140..6c1eb75a951b 100644
>> [...]
>>> -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>>> +int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long flags)
>>>    {
>>> -     struct pci_dev *pdev = to_pci_dev(dev->dev);
>>> -     struct radeon_device *rdev;
>>> +     struct pci_dev *pdev = rdev->pdev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        int r, acpi_status;
>>>
>>> -     rdev = kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
>>> -     if (rdev == NULL) {
>>> -             return -ENOMEM;
>>> -     }
>>> -     dev->dev_private = (void *)rdev;
>> You still need to set dev->dev_private = rdev or the driver will crash.
>> I'd assume that this is the cause for the stack trace.
>>
>> If you have an updated patchset, I can test again.
>>
>> Best regards
>> Thomas
>>
>>> -
>>>    #ifdef __alpha__
>>>        rdev->hose = pdev->sysdata;
>>>    #endif
>>>
>>>        if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
>>> -             rdev->agp = radeon_agp_head_init(dev);
>>> +             rdev->agp = radeon_agp_head_init(rdev_to_drm(rdev));
>>>        if (rdev->agp) {
>>>                rdev->agp->agp_mtrr = arch_phys_wc_add(
>>>                        rdev->agp->agp_info.aper_base,
>>> @@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>>>         * properly initialize the GPU MC controller and permit
>>>         * VRAM allocation
>>>         */
>>> -     r = radeon_device_init(rdev, dev, pdev, flags);
>>> +     r = radeon_device_init(rdev, flags);
>>>        if (r) {
>>>                dev_err(dev->dev, "Fatal error during GPU init\n");
>>>                goto out;
>>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
>>> index a955f8a2f7fe..450ff7daa46c 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>>> @@ -150,7 +150,7 @@ int radeon_bo_create(struct radeon_device *rdev,
>>>        bo = kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
>>>        if (bo == NULL)
>>>                return -ENOMEM;
>>> -     drm_gem_private_object_init(rdev->ddev, &bo->tbo.base, size);
>>> +     drm_gem_private_object_init(rdev_to_drm(rdev), &bo->tbo.base, size);
>>>        bo->rdev = rdev;
>>>        bo->surface_reg = -1;
>>>        INIT_LIST_HEAD(&bo->list);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
>>> index 2d9d9f46f243..b4fb7e70320b 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_pm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
>>> @@ -282,7 +282,7 @@ static void radeon_pm_set_clocks(struct radeon_device *rdev)
>>>
>>>        if (rdev->irq.installed) {
>>>                i = 0;
>>> -             drm_for_each_crtc(crtc, rdev->ddev) {
>>> +             drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
>>>                        if (rdev->pm.active_crtcs & (1 << i)) {
>>>                                /* This can fail if a modeset is in progress */
>>>                                if (drm_crtc_vblank_get(crtc) == 0)
>>> @@ -299,7 +299,7 @@ static void radeon_pm_set_clocks(struct radeon_device *rdev)
>>>
>>>        if (rdev->irq.installed) {
>>>                i = 0;
>>> -             drm_for_each_crtc(crtc, rdev->ddev) {
>>> +             drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
>>>                        if (rdev->pm.req_vblank & (1 << i)) {
>>>                                rdev->pm.req_vblank &= ~(1 << i);
>>>                                drm_crtc_vblank_put(crtc);
>>> @@ -671,7 +671,7 @@ static ssize_t radeon_hwmon_show_temp(struct device *dev,
>>>                                      char *buf)
>>>    {
>>>        struct radeon_device *rdev = dev_get_drvdata(dev);
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        int temp;
>>>
>>>        /* Can't get temperature when the card is off */
>>> @@ -715,7 +715,7 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
>>>                                      struct device_attribute *attr, char *buf)
>>>    {
>>>        struct radeon_device *rdev = dev_get_drvdata(dev);
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        u32 sclk = 0;
>>>
>>>        /* Can't get clock frequency when the card is off */
>>> @@ -740,7 +740,7 @@ static ssize_t radeon_hwmon_show_vddc(struct device *dev,
>>>                                      struct device_attribute *attr, char *buf)
>>>    {
>>>        struct radeon_device *rdev = dev_get_drvdata(dev);
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        u16 vddc = 0;
>>>
>>>        /* Can't get vddc when the card is off */
>>> @@ -1692,7 +1692,7 @@ void radeon_pm_fini(struct radeon_device *rdev)
>>>
>>>    static void radeon_pm_compute_clocks_old(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>
>>> @@ -1765,7 +1765,7 @@ static void radeon_pm_compute_clocks_old(struct radeon_device *rdev)
>>>
>>>    static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        struct radeon_connector *radeon_connector;
>>> @@ -1826,7 +1826,7 @@ static bool radeon_pm_in_vbl(struct radeon_device *rdev)
>>>         */
>>>        for (crtc = 0; (crtc < rdev->num_crtc) && in_vbl; crtc++) {
>>>                if (rdev->pm.active_crtcs & (1 << crtc)) {
>>> -                     vbl_status = radeon_get_crtc_scanoutpos(rdev->ddev,
>>> +                     vbl_status = radeon_get_crtc_scanoutpos(rdev_to_drm(rdev),
>>>                                                                crtc,
>>>                                                                USE_REAL_VBLANKSTART,
>>>                                                                &vpos, &hpos, NULL, NULL,
>>> @@ -1918,7 +1918,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
>>>    static int radeon_debugfs_pm_info_show(struct seq_file *m, void *unused)
>>>    {
>>>        struct radeon_device *rdev = m->private;
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>
>>>        if  ((rdev->flags & RADEON_IS_PX) &&
>>>             (ddev->switch_power_state != DRM_SWITCH_POWER_ON)) {
>>> @@ -1955,7 +1955,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_pm_info);
>>>    static void radeon_debugfs_pm_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("radeon_pm_info", 0444, root, rdev,
>>>                            &radeon_debugfs_pm_info_fops);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
>>> index 8d1d458286a8..581ae20c46e4 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_ring.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
>>> @@ -550,7 +550,7 @@ static void radeon_debugfs_ring_init(struct radeon_device *rdev, struct radeon_r
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>>        const char *ring_name = radeon_debugfs_ring_idx_to_name(ring->idx);
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        if (ring_name)
>>>                debugfs_create_file(ring_name, 0444, root, ring,
>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> index 5c65b6dfb99a..69d0c12fa419 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> @@ -682,8 +682,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
>>>
>>>        /* No others user of address space so set it to 0 */
>>>        r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
>>> -                            rdev->ddev->anon_inode->i_mapping,
>>> -                            rdev->ddev->vma_offset_manager,
>>> +                            rdev_to_drm(rdev)->anon_inode->i_mapping,
>>> +                            rdev_to_drm(rdev)->vma_offset_manager,
>>>                               rdev->need_swiotlb,
>>>                               dma_addressing_limited(&rdev->pdev->dev));
>>>        if (r) {
>>> @@ -890,7 +890,7 @@ static const struct file_operations radeon_ttm_gtt_fops = {
>>>    static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct drm_minor *minor = rdev->ddev->primary;
>>> +     struct drm_minor *minor = rdev_to_drm(rdev)->primary;
>>>        struct dentry *root = minor->debugfs_root;
>>>
>>>        debugfs_create_file("radeon_vram", 0444, root, rdev,
>>> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
>>> index d4d1501e6576..d6c18fd740ec 100644
>>> --- a/drivers/gpu/drm/radeon/rs400.c
>>> +++ b/drivers/gpu/drm/radeon/rs400.c
>>> @@ -379,7 +379,7 @@ DEFINE_SHOW_ATTRIBUTE(rs400_debugfs_gart_info);
>>>    static void rs400_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("rs400_gart_info", 0444, root, rdev,
>>>                            &rs400_debugfs_gart_info_fops);
>>> @@ -474,7 +474,7 @@ int rs400_resume(struct radeon_device *rdev)
>>>                        RREG32(R_0007C0_CP_STAT));
>>>        }
>>>        /* post */
>>> -     radeon_combios_asic_init(rdev->ddev);
>>> +     radeon_combios_asic_init(rdev_to_drm(rdev));
>>>        /* Resume clock after posting */
>>>        r300_clock_startup(rdev);
>>>        /* Initialize surface registers */
>>> @@ -552,7 +552,7 @@ int rs400_init(struct radeon_device *rdev)
>>>                return -EINVAL;
>>>
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize memory controller */
>>>        rs400_mc_init(rdev);
>>>        /* Fence driver */
>>> diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
>>> index 5c162778899b..88c8e91ea651 100644
>>> --- a/drivers/gpu/drm/radeon/rs600.c
>>> +++ b/drivers/gpu/drm/radeon/rs600.c
>>> @@ -321,7 +321,7 @@ void rs600_pm_misc(struct radeon_device *rdev)
>>>
>>>    void rs600_pm_prepare(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -339,7 +339,7 @@ void rs600_pm_prepare(struct radeon_device *rdev)
>>>
>>>    void rs600_pm_finish(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -408,7 +408,7 @@ void rs600_hpd_set_polarity(struct radeon_device *rdev,
>>>
>>>    void rs600_hpd_init(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned enable = 0;
>>>
>>> @@ -435,7 +435,7 @@ void rs600_hpd_init(struct radeon_device *rdev)
>>>
>>>    void rs600_hpd_fini(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned disable = 0;
>>>
>>> @@ -797,7 +797,7 @@ int rs600_irq_process(struct radeon_device *rdev)
>>>                /* Vertical blank interrupts */
>>>                if (G_007EDC_LB_D1_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
>>>                        if (rdev->irq.crtc_vblank_int[0]) {
>>> -                             drm_handle_vblank(rdev->ddev, 0);
>>> +                             drm_handle_vblank(rdev_to_drm(rdev), 0);
>>>                                rdev->pm.vblank_sync = true;
>>>                                wake_up(&rdev->irq.vblank_queue);
>>>                        }
>>> @@ -806,7 +806,7 @@ int rs600_irq_process(struct radeon_device *rdev)
>>>                }
>>>                if (G_007EDC_LB_D2_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
>>>                        if (rdev->irq.crtc_vblank_int[1]) {
>>> -                             drm_handle_vblank(rdev->ddev, 1);
>>> +                             drm_handle_vblank(rdev_to_drm(rdev), 1);
>>>                                rdev->pm.vblank_sync = true;
>>>                                wake_up(&rdev->irq.vblank_queue);
>>>                        }
>>> @@ -1133,7 +1133,7 @@ int rs600_init(struct radeon_device *rdev)
>>>                return -EINVAL;
>>>
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize memory controller */
>>>        rs600_mc_init(rdev);
>>>        r100_debugfs_rbbm_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/rs690.c b/drivers/gpu/drm/radeon/rs690.c
>>> index 14fb0819b8c1..016eb4992803 100644
>>> --- a/drivers/gpu/drm/radeon/rs690.c
>>> +++ b/drivers/gpu/drm/radeon/rs690.c
>>> @@ -845,7 +845,7 @@ int rs690_init(struct radeon_device *rdev)
>>>                return -EINVAL;
>>>
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize memory controller */
>>>        rs690_mc_init(rdev);
>>>        rv515_debugfs(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
>>> index bbc6ccabf788..1b4dfb645585 100644
>>> --- a/drivers/gpu/drm/radeon/rv515.c
>>> +++ b/drivers/gpu/drm/radeon/rv515.c
>>> @@ -255,7 +255,7 @@ DEFINE_SHOW_ATTRIBUTE(rv515_debugfs_ga_info);
>>>    void rv515_debugfs(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
>>>                            &rv515_debugfs_pipes_info_fops);
>>> @@ -636,7 +636,7 @@ int rv515_init(struct radeon_device *rdev)
>>>        if (radeon_boot_test_post_card(rdev) == false)
>>>                return -EINVAL;
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize AGP */
>>>        if (rdev->flags & RADEON_IS_AGP) {
>>>                r = radeon_agp_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
>>> index 9ce12fa3c356..7d4b0bf59109 100644
>>> --- a/drivers/gpu/drm/radeon/rv770.c
>>> +++ b/drivers/gpu/drm/radeon/rv770.c
>>> @@ -1935,7 +1935,7 @@ int rv770_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);
>>>        /* initialize AGP */
>>> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
>>> index 15759c8ca5b7..6c95575ce109 100644
>>> --- a/drivers/gpu/drm/radeon/si.c
>>> +++ b/drivers/gpu/drm/radeon/si.c
>>> @@ -6277,7 +6277,7 @@ int si_irq_process(struct radeon_device *rdev)
>>>                                event_name = "vblank";
>>>
>>>                                if (rdev->irq.crtc_vblank_int[crtc_idx]) {
>>> -                                     drm_handle_vblank(rdev->ddev, crtc_idx);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -6839,7 +6839,7 @@ int si_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

