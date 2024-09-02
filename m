Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2D968667
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F7810E2A8;
	Mon,  2 Sep 2024 11:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fq6UHlB7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h/ftKBZl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fq6UHlB7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h/ftKBZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ECE10E2A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 11:41:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A70021B28;
 Mon,  2 Sep 2024 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725277294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Kmq/khHwzhDWpb30ji07toCrKswxh+ogfXu7DygWTQ=;
 b=fq6UHlB7m8dgVOyw+EkizPrq5m3SKPW8ICn/MLrlImH0PYYHoVGYaLqGvI6pkMVbBdfG71
 XljS6LoUtfXV0pBw21lz+c/vePq0AveH2Rp8qz5uL+ngk86h8QphsIXd0DghGWmK/pGhCR
 UdLDfX7Mi/cyoOnBQV6mQhJLE3VDDIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725277294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Kmq/khHwzhDWpb30ji07toCrKswxh+ogfXu7DygWTQ=;
 b=h/ftKBZlv07FzWt+nnTOiabNT7Mj47fkoA7b9pZnJdf3ZgCJuO/qqfECtu4lU6pWjnQr48
 GsjfUfKv7d3sEoCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fq6UHlB7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="h/ftKBZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725277294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Kmq/khHwzhDWpb30ji07toCrKswxh+ogfXu7DygWTQ=;
 b=fq6UHlB7m8dgVOyw+EkizPrq5m3SKPW8ICn/MLrlImH0PYYHoVGYaLqGvI6pkMVbBdfG71
 XljS6LoUtfXV0pBw21lz+c/vePq0AveH2Rp8qz5uL+ngk86h8QphsIXd0DghGWmK/pGhCR
 UdLDfX7Mi/cyoOnBQV6mQhJLE3VDDIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725277294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Kmq/khHwzhDWpb30ji07toCrKswxh+ogfXu7DygWTQ=;
 b=h/ftKBZlv07FzWt+nnTOiabNT7Mj47fkoA7b9pZnJdf3ZgCJuO/qqfECtu4lU6pWjnQr48
 GsjfUfKv7d3sEoCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E76213A7C;
 Mon,  2 Sep 2024 11:41:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WoS0EW6k1WYGfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Sep 2024 11:41:34 +0000
Message-ID: <7cf68133-e6f5-4fef-92ae-7a8c30631fb5@suse.de>
Date: Mon, 2 Sep 2024 13:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467
 unregister_framebuffer+0x45/0x160
To: Borislav Petkov <bp@alien8.de>, "V, Narasimhan" <Narasimhan.V@amd.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
References: <DM4PR12MB5086C89FD0EAF070D167733389912@DM4PR12MB5086.namprd12.prod.outlook.com>
 <20240902084546.GAZtV7Ot58w7D90fwQ@fat_crate.local>
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
In-Reply-To: <20240902084546.GAZtV7Ot58w7D90fwQ@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A70021B28
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,ffwll.ch,gmx.de,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 02.09.24 um 10:45 schrieb Borislav Petkov:
> Fixing subject and recipients and leaving the whole mail untouched.
>
> On Sun, Sep 01, 2024 at 05:01:28PM +0200, V, Narasimhan wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi,
>>
>> Seeing the following warning and bug on boot with linux-next-20240829
>>
>> WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregister_framebuffer+0x45/0x160
>> BUG: kernel NULL pointer dereference, address: 0000000000000000

Does it work if you revert one of these commits?

   b49420d6a1ae ("video/aperture: optionally match the device in 
sysfb_disable()")

   c2fe0480cd77 ("fbdev/efifb: Use devm_register_framebuffer()")

For the latter, there might be a fix at

https://patchwork.freedesktop.org/patch/611902/?series=138008&rev=1

Best regards
Thomas

>>
>>
>>
>> 19:07:54  [   18.395285] WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.406264] Modules linked in: ast(+) i2c_algo_bit drm_shmem_helper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel sha256_ssse3 drm tg3 nvme sha1_ssse3 ahci i2c_piix4 libahci i2c_smbus nvme_core aesni_intel crypto_simd cryptd
>> 19:07:54  [   18.430347] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.11.0-rc5-next-20240830-1725196918033 #1
>> 19:07:54  [   18.440929] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
>> 19:07:54  [   18.449572] Workqueue: events work_for_cpu_fn
>> 19:07:54  [   18.454435] RIP: 0010:unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.460267] Code: 83 ec 08 e8 7d 4a 76 00 49 63 44 24 04 83 f8 1f 77 18 48 83 f8 1f 0f 87 d6 00 00 00 4c 3b 24 c5 80 76 a7 83 0f 84 85 00 00 00 <0f> 0b 49 8b bc 24 d0 01 00 00 48 85 ff 74 0b 41 f6 84 24 ec 01 00
>> 19:07:54  [   18.481224] RSP: 0018:ff56f06f800efb50 EFLAGS: 00010286
>> 19:07:54  [   18.487058] RAX: 0000000000000000 RBX: ff2d2a8913c77a40 RCX: ff2d2a8913c77400
>> 19:07:54  [   18.495023] RDX: ff2d2a8900956000 RSI: ff2d2a8913c77428 RDI: ffffffff83918360
>> 19:07:54  [   18.502987] RBP: ff56f06f800efb68 R08: ffffffff82dce06a R09: 0000000000000010
>> 19:07:54  [   18.510950] R10: ff2d2a8913cfc2b0 R11: 0000000000000004 R12: ff2d2a8913cffc00
>> 19:07:54  [   18.518911] R13: ff56f06f800efbd0 R14: ff2d2a8913cfc010 R15: 0000000000000202
>> 19:07:54  [   18.526873] FS:  0000000000000000(0000) GS:ff2d2a980ba00000(0000) knlGS:0000000000000000
>> 19:07:54  [   18.535903] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> 19:07:54  [   18.542312] CR2: 0000558d19347c98 CR3: 000000011827a006 CR4: 0000000000771ef0
>> 19:07:54  [   18.550275] PKRU: 55555554
>> 19:07:54  [   18.553293] Call Trace:
>> 19:07:54  [   18.556016]  <TASK>
>> 19:07:54  [   18.558354]  ? show_regs+0x6d/0x80
>> 19:07:54  [   18.562153]  ? __warn+0x91/0x140
>> 19:07:54  [   18.565756]  ? unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.570917]  ? report_bug+0x193/0x1a0
>> 19:07:54  [   18.575008]  ? handle_bug+0x63/0xa0
>> 19:07:54  [   18.578901]  ? exc_invalid_op+0x1d/0x80
>> 19:07:54  [   18.583181]  ? asm_exc_invalid_op+0x1f/0x30
>> 19:07:54  [   18.587842]  ? unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.592994]  devm_unregister_framebuffer+0x12/0x20
>> 19:07:54  [   18.598338]  devm_action_release+0x16/0x20
>> 19:07:54  [   18.602910]  release_nodes+0x47/0xc0
>> 19:07:54  [   18.606898]  devres_release_all+0x9f/0xe0
>> 19:07:54  [   18.611371]  device_unbind_cleanup+0x12/0x80
>> 19:07:54  [   18.616136]  device_release_driver_internal+0x20c/0x250
>> 19:07:54  [   18.621967]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 19:07:54  [   18.627315]  device_release_driver+0x16/0x20
>> 19:07:54  [   18.632079]  bus_remove_device+0xcf/0x130
>> 19:07:54  [   18.636551]  device_del+0x16a/0x3c0
>> 19:07:54  [   18.640444]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 19:07:54  [   18.645791]  platform_device_del.part.0+0x18/0x90
>> 19:07:54  [   18.651042]  platform_device_unregister+0x24/0x40
>> 19:07:54  [   18.656303]  sysfb_disable+0x5c/0xa0
>> 19:07:54  [   18.660296]  aperture_remove_conflicting_pci_devices+0x33/0x140
>> 19:07:54  [   18.666907]  drm_aperture_remove_conflicting_pci_framebuffers+0x19/0x20 [drm]
>> 19:07:54  [   18.674886]  ast_pci_probe+0x2c/0x540 [ast]
>> 19:07:54  [   18.679556]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 19:07:54  [   18.684904]  local_pci_probe+0x4c/0xb0
>> 19:07:54  [   18.689087]  work_for_cpu_fn+0x1b/0x30
>> 19:07:54  [   18.693271]  process_one_work+0x17a/0x3b0
>> 19:07:54  [   18.697745]  worker_thread+0x2a0/0x3a0
>> 19:07:54  [   18.701927]  ? __pfx_worker_thread+0x10/0x10
>> 19:07:54  [   18.706688]  kthread+0xe5/0x120
>> 19:07:54  [   18.710192]  ? __pfx_kthread+0x10/0x10
>> 19:07:54  [   18.714375]  ret_from_fork+0x3d/0x60
>> 19:07:54  [   18.718363]  ? __pfx_kthread+0x10/0x10
>> 19:07:54  [   18.722544]  ret_from_fork_asm+0x1a/0x30
>> 19:07:54  [   18.726923]  </TASK>
>> 19:07:54  [   18.729359] ---[ end trace 0000000000000000 ]---
>> 09:13:40  [   18.100937] BUG: kernel NULL pointer dereference, address: 0000000000000000
>> 09:13:40  [   18.108694] #PF: supervisor read access in kernel mode
>> 09:13:40  [   18.114424] #PF: error_code(0x0000) - not-present page
>> 09:13:40  [   18.120153] PGD 1156fa067 P4D 0
>> 09:13:40  [   18.123751] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>> 09:13:40  [   18.129194] CPU: 0 UID: 0 PID: 458 Comm: kworker/0:2 Tainted: G        W          6.11.0-rc5-next-20240829-1725075030567 #1
>> 09:13:40  [   18.141618] Tainted: [W]=WARN
>> 09:13:40  [   18.144922] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
>> 09:13:40  [   18.153551] Workqueue: events work_for_cpu_fn
>> 09:13:40  [   18.158412] RIP: 0010:fb_destroy_modelist+0x1a/0x70
>> 09:13:40  [   18.163853] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 56 41 55 41 54 49 89 fc 53 48 8b 3f <48> 8b 1f 49 39 fc 74 36 49 be 00 01 00 00 00 00 ad de 49 bd 22 01
>> 09:13:40  [   18.184809] RSP: 0018:ff42b545c14e7b20 EFLAGS: 00010246
>> 09:13:40  [   18.190638] RAX: 0000000000000000 RBX: ff2cd8a142f7ce00 RCX: ff2cd8a142f7cf00
>> 09:13:40  [   18.198597] RDX: ff2cd8b088b74000 RSI: ff2cd8a142f7cf28 RDI: 0000000000000000
>> 09:13:40  [   18.206557] RBP: ff42b545c14e7b40 R08: ffffffff907cca2c R09: 0000000000000010
>> 09:13:40  [   18.214520] R10: ff2cd8a142fb06b0 R11: 0000000000000004 R12: ff2cd8a142fb5288
>> 09:13:40  [   18.222480] R13: ff42b545c14e7bd0 R14: ff2cd8a142fb0410 R15: 0000000000000283
>> 09:13:40  [   18.230440] FS:  0000000000000000(0000) GS:ff2cd8b046600000(0000) knlGS:0000000000000000
>> 09:13:40  [   18.239466] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> 09:13:40  [   18.245874] CR2: 0000000000000000 CR3: 00000001156cc005 CR4: 0000000000771ef0
>> 09:13:40  [   18.253836] PKRU: 55555554
>> 09:13:40  [   18.256851] Call Trace:
>> 09:13:40  [   18.259573]  <TASK>
>> 09:13:40  [   18.261901]  ? show_regs+0x6d/0x80
>> 09:13:40  [   18.265695]  ? __die+0x29/0x70
>> 09:13:40  [   18.269098]  ? page_fault_oops+0x15c/0x550
>> 09:13:40  [   18.273664]  ? unregister_framebuffer+0x45/0x160
>> 09:13:40  [   18.278813]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.284157]  ? vprintk+0x3f/0x70
>> 09:13:40  [   18.287755]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.293097]  ? _printk+0x5c/0x80
>> 09:13:40  [   18.296699]  ? do_user_addr_fault+0x47a/0x7e0
>> 09:13:40  [   18.301559]  ? __warn+0xbc/0x140
>> 09:13:40  [   18.305158]  ? unregister_framebuffer+0x45/0x160
>> 09:13:40  [   18.310307]  ? exc_page_fault+0x7c/0x1b0
>> 09:13:40  [   18.314680]  ? asm_exc_page_fault+0x2b/0x30
>> 09:13:40  [   18.319347]  ? fb_destroy_modelist+0x1a/0x70
>> 09:13:40  [   18.324107]  unregister_framebuffer+0x6c/0x160
>> 09:13:40  [   18.329063]  devm_unregister_framebuffer+0x12/0x20
>> 09:13:40  [   18.334408]  devm_action_release+0x16/0x20
>> 09:13:40  [   18.338978]  release_nodes+0x47/0xc0
>> 09:13:40  [   18.342965]  devres_release_all+0x9f/0xe0
>> 09:13:40  [   18.347436]  device_unbind_cleanup+0x12/0x80
>> 09:13:40  [   18.352196]  device_release_driver_internal+0x20c/0x250
>> 09:13:40  [   18.358024]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.363367]  device_release_driver+0x16/0x20
>> 09:13:40  [   18.368128]  bus_remove_device+0xcf/0x130
>> 09:13:40  [   18.372599]  device_del+0x16a/0x3c0
>> 09:13:40  [   18.376488]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.381837]  platform_device_del.part.0+0x18/0x90
>> 09:13:40  [   18.387086]  platform_device_unregister+0x24/0x40
>> 09:13:40  [   18.392330]  sysfb_disable+0x5c/0xa0
>> 09:13:40  [   18.396316]  aperture_remove_conflicting_pci_devices+0x33/0x140
>> 09:13:40  [   18.402921]  drm_aperture_remove_conflicting_pci_framebuffers+0x19/0x20 [drm]
>> 09:13:40  [   18.410899]  ast_pci_probe+0x2c/0x540 [ast]
>> 09:13:40  [   18.415566]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.420914]  local_pci_probe+0x4c/0xb0
>> 09:13:40  [   18.425095]  work_for_cpu_fn+0x1b/0x30
>> 09:13:40  [   18.429277]  process_one_work+0x17a/0x3b0
>> 09:13:40  [   18.433746]  ? __pfx_worker_thread+0x10/0x10
>> 09:13:40  [   18.438507]  worker_thread+0x2a0/0x3a0
>> 09:13:40  [   18.442685]  ? __pfx_worker_thread+0x10/0x10
>> 09:13:40  [   18.447445]  kthread+0xe5/0x120
>> 09:13:40  [   18.450946]  ? __pfx_kthread+0x10/0x10
>> 09:13:40  [   18.455125]  ret_from_fork+0x3d/0x60
>> 09:13:40  [   18.459112]  ? __pfx_kthread+0x10/0x10
>> 09:13:40  [   18.463293]  ret_from_fork_asm+0x1a/0x30
>> 09:13:44  [   18.467673]  </TASK>
>> 09:13:44  [   18.470106] Modules linked in: ast(+) i2c_algo_bit drm_shmem_helper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel sha256_ssse3 drm sha1_ssse3 nvme i2c_piix4 tg3 ahci nvme_core i2c_smbus libahci aesni_intel crypto_simd cryptd
>> 09:13:44  [   18.494181] CR2: 0000000000000000
>> 09:13:44  [   18.497876] ---[ end trace 0000000000000000 ]---
>>
>> --
>> Regards
>> Narasimhan V
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

