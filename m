Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13489845D8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 14:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6C310E6F4;
	Tue, 24 Sep 2024 12:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E6bejxMQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="reJh85lX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZXMQbUXr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aoY2/MUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1310E6CB;
 Tue, 24 Sep 2024 12:20:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 624271F792;
 Tue, 24 Sep 2024 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727180457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/RdI90hqbd+U+GKYnDCuab+NMyzd7Sw92pEn9ihmru8=;
 b=E6bejxMQd16DcVqoSdl0OPcMqUQUF7pPVKWlWHMT3n+Zy7hFSMQSO+ni4wSmDiP0NURdq4
 Xz9lC8fVle+tw4JTUqbabURUxZV8GS0P7Ah8zpSR8CBLUb7KWvfOUiFGW/Kew3VwEzyvvK
 ogViJ9UiHcDSxl8RVj99bU/ms1/jy8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727180457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/RdI90hqbd+U+GKYnDCuab+NMyzd7Sw92pEn9ihmru8=;
 b=reJh85lXZ9nL9RlLDKC/wy7MZYu5PH9Nss1Fa2IYwrTL1yridZLUcNL6u+6nHB2SZuY7Vx
 jo1WawPUky91rcAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZXMQbUXr;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="aoY2/MUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727180456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/RdI90hqbd+U+GKYnDCuab+NMyzd7Sw92pEn9ihmru8=;
 b=ZXMQbUXrfx6iOJ7JdCNEP8q8y1jq1hja6NfeFhqQgJOLI2Wgmrs7q5ZdXz/QrCdrjvAMlG
 XGTU7iflFqG4Shai+Jg9jJc3uls0gsbV+VzHeaeoQNqlfO/wStIVagnXz3mBy/J0+rl0/M
 NlSNbk+4m16Vx0lCGxus6iwC/P3goTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727180456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/RdI90hqbd+U+GKYnDCuab+NMyzd7Sw92pEn9ihmru8=;
 b=aoY2/MUVKy6P8biYbvxCHUK/LggGaLEZDpuWI7RoTkfZYZLRlFtUDO6ATn88LGjrMC65u/
 SpI5SyQGzgrF4eBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0375F13AA8;
 Tue, 24 Sep 2024 12:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uKguO6eu8mbTQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 12:20:55 +0000
Message-ID: <8eb45005-c6fb-4baa-a44a-243958a3a1ba@suse.de>
Date: Tue, 24 Sep 2024 14:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: radeon ARUBA NULL pointer dereference
To: Arthur Marsh <arthur.marsh@internode.on.net>
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wuhoipok@gmail.com, iommu@lists.linux.dev,
 the arch/x86 maintainers <x86@kernel.org>
References: <20240919165641.4632-1-user@am64> <20240924020824.6264-1-user@am64>
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
In-Reply-To: <20240924020824.6264-1-user@am64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 624271F792
X-Spam-Score: -6.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[internode.on.net];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,internode.on.net];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,vger.kernel.org,lists.linux.dev,kernel.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,bootlin.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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

(cc: DMA and x86 folks)

Hi

Am 24.09.24 um 04:08 schrieb Arthur Marsh:
> Using current Linus git head kernel, I was able to save the dmesg output:
>
> [   17.218724] [drm] radeon kernel modesetting enabled.
> [   17.218778] radeon 0000:00:01.0: vgaarb: deactivate vga console
> [   17.219509] Console: switching to colour dummy device 80x25
> [   17.219700] [drm] initializing kernel modesetting (ARUBA 0x1002:0x990C 0x1002:0x0123 0x00).
> [   17.219773] ATOM BIOS: 113
> [   17.219838] radeon 0000:00:01.0: VRAM: 768M 0x0000000000000000 - 0x000000002FFFFFFF (768M used)
> [   17.219841] radeon 0000:00:01.0: GTT: 1024M 0x0000000030000000 - 0x000000006FFFFFFF
> [   17.219844] [drm] Detected VRAM RAM=768M, BAR=256M
> [   17.219845] [drm] RAM width 64bits DDR
> [   17.219851] BUG: kernel NULL pointer dereference, address: 00000000000000a0

This is 160 bytes behind NULL, which indicates a field within a struct.

> [   17.219852] #PF: supervisor read access in kernel mode
> [   17.219853] #PF: error_code(0x0000) - not-present page
> [   17.219854] PGD 0 P4D 0
> [   17.219856] Oops: Oops: 0000 [#1] PREEMPT_RT SMP NOPTI
> [   17.219858] CPU: 0 UID: 0 PID: 451 Comm: udevd Not tainted 6.11.0+ #6121
> [   17.219860] Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./F2A78M-HD2, BIOS F2 05/28/2014
> [   17.219862] RIP: 0010:dma_get_required_mask+0x11/0x50
> [   17.219868] Code: 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 48 8b 87 68 02 00 00 48 85 c0 74 11 <48> 8b 80 a0 00 00 00 48 85 c0 74 1f e9 ee ed 94 00 f6 87 2c 03 00
> [   17.219870] RSP: 0018:ffffa54bc13a7b00 EFLAGS: 00010202
> [   17.219871] RAX: 0000000000000000 RBX: 000000ffffffffff RCX: 0000000000000000
> [   17.219872] RDX: 0000000000000000 RSI: 0000000000000027 RDI: ffff976f44e720c8
> [   17.219873] RBP: ffff976f44e720c8 R08: 00000000ffffefff R09: ffffffffab2aab08
> [   17.219874] R10: 00000000fffff000 R11: 0000000000000002 R12: 0000000000000000
> [   17.219875] R13: ffff976f48a4aa30 R14: 0000000000000000 R15: 0000000000000028
> [   17.219876] FS:  00007f59a070d840(0000) GS:ffff97726f800000(0000) knlGS:0000000000000000
> [   17.219878] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   17.219879] CR2: 00000000000000a0 CR3: 00000001053b4000 CR4: 00000000000406f0
> [   17.219880] Call Trace:
> [   17.219881]  <TASK>
> [   17.219882]  ? __die_body.cold+0x19/0x1e
> [   17.219885]  ? page_fault_oops+0xa8/0x230
> [   17.219889]  ? search_module_extables+0x4f/0x90
> [   17.219891]  ? fixup_exception+0x36/0x2f0
> [   17.219894]  ? exc_page_fault+0x88/0x1b0
> [   17.219897]  ? asm_exc_page_fault+0x22/0x30
> [   17.219900]  ? dma_get_required_mask+0x11/0x50

This is not in the radeon driver but the DMA code. I'd say it's at [1], 
as get_required_mask is 160 bytes within struct drm_map_ops. The call to 
get_arch_dma_ops() probably returns NULL.

Best regards
Thomas

[1] https://elixir.bootlin.com/linux/v6.11/source/kernel/dma/mapping.c#L523
[2] 
https://elixir.bootlin.com/linux/v6.11/source/include/linux/dma-map-ops.h#L98

> [   17.219902]  dma_addressing_limited+0x6c/0xb0
> [   17.219905]  radeon_ttm_init+0x3f/0x210 [radeon]
> [   17.219977]  cayman_init+0x97/0x290 [radeon]
> [   17.220057]  radeon_device_init+0x5e9/0xb40 [radeon]
> [   17.220115]  radeon_driver_load_kms+0xb0/0x260 [radeon]
> [   17.220174]  radeon_pci_probe+0xff/0x170 [radeon]
> [   17.220231]  pci_device_probe+0xbe/0x1a0
> [   17.220234]  really_probe+0xde/0x350
> [   17.220237]  ? pm_runtime_barrier+0x61/0xb0
> [   17.220240]  ? __pfx___driver_attach+0x10/0x10
> [   17.220242]  __driver_probe_device+0x78/0x110
> [   17.220245]  driver_probe_device+0x2d/0xc0
> [   17.220247]  __driver_attach+0xc9/0x1c0
> [   17.220249]  bus_for_each_dev+0x6a/0xb0
> [   17.220251]  ? migrate_enable+0xbf/0xf0
> [   17.220254]  bus_add_driver+0x139/0x220
> [   17.220256]  driver_register+0x6e/0xc0
> [   17.220258]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
> [   17.220315]  do_one_initcall+0x42/0x210
> [   17.220318]  ? __kmalloc_cache_noprof+0x89/0x230
> [   17.220321]  do_init_module+0x60/0x210
> [   17.220324]  init_module_from_file+0x89/0xc0
> [   17.220326]  __x64_sys_finit_module+0x142/0x390
> [   17.220329]  do_syscall_64+0x47/0x110
> [   17.220331]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   17.220334] RIP: 0033:0x7f59a0625279
> [   17.220336] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 77 6b 0d 00 f7 d8 64 89 01 48
> [   17.220337] RSP: 002b:00007ffd15ee7df8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [   17.220339] RAX: ffffffffffffffda RBX: 00005578ae660840 RCX: 00007f59a0625279
> [   17.220340] RDX: 0000000000000000 RSI: 00005578ae677fc0 RDI: 0000000000000011
> [   17.220341] RBP: 0000000000000000 R08: 00007f59a06fcb20 R09: 00005578ae640550
> [   17.220342] R10: 0000000000000040 R11: 0000000000000246 R12: 00005578ae677fc0
> [   17.220342] R13: 0000000000020000 R14: 00005578ae651750 R15: 0000000000000000
> [   17.220344]  </TASK>
> [   17.220345] Modules linked in: radeon(+) snd_hda_codec_hdmi snd_seq_midi snd_seq_midi_event snd_seq snd_hda_intel snd_intel_dspcfg snd_emu10k1 snd_hda_codec drm_ttm_helper ttm snd_util_mem drm_suballoc_helper snd_ac97_codec snd_hda_core drm_display_helper ac97_bus snd_rawmidi snd_hwdep snd_seq_device snd_pcm drm_kms_helper edac_mce_amd sha512_ssse3 sha512_generic k10temp sha256_ssse3 sha1_ssse3 drm aesni_intel snd_timer gf128mul crypto_simd cryptd acpi_cpufreq evdev pcspkr serio_raw emu10k1_gp gameport at24 regmap_i2c i2c_algo_bit snd video soundcore wmi button sp5100_tco ext4 crc32c_generic crc16 mbcache jbd2 uas usb_storage hid_generic usbhid hid sg sr_mod sd_mod cdrom ata_generic firewire_ohci crc32_pclmul crc32c_intel firewire_core crc_itu_t pata_atiixp i2c_piix4 i2c_smbus ahci r8169 libahci xhci_pci ohci_pci realtek libata mdio_devres ehci_pci ohci_hcd xhci_hcd scsi_mod ehci_hcd scsi_common usbcore libphy usb_common
> [   17.220388] CR2: 00000000000000a0
> [   17.220390] ---[ end trace 0000000000000000 ]---
>
> Happy to provide additional information and run tests.
>
> Regards,
>
> Arthur Marsh.

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

