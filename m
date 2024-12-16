Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ABD9F3778
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 18:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224F110E72B;
	Mon, 16 Dec 2024 17:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MK/Do9Jv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDNU2YEx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MK/Do9Jv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDNU2YEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5E610E73E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 17:24:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08A8C1F395;
 Mon, 16 Dec 2024 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734369883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L/wnwBU8efWfxmSKNHd6Tne3yallkC2V2Ex7nTViKSg=;
 b=MK/Do9JvohCcnjwLB5yyq2+4HBYOzLNJ+FtEaxbDI+UaFmhOlNGo/NQzhKFl21/9OQ7PsZ
 0/b0Lf9ImCYtRc1qLx8pIpIhY3m14pJHsuf+ZwvkwXqLxBsXFFB0yfiFGKes+jAS7qgZKU
 YucSfjlWOAlSTRhgYGkr9WYq8t5cC4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734369883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L/wnwBU8efWfxmSKNHd6Tne3yallkC2V2Ex7nTViKSg=;
 b=xDNU2YExvz2LhbSQq+TUbcCnwhFsKN9z0wjr3jyHqdr0ZjIHpc1h1QeV9DdeMKUeqv4yRE
 YaH6qQ3FTFbtvKCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734369883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L/wnwBU8efWfxmSKNHd6Tne3yallkC2V2Ex7nTViKSg=;
 b=MK/Do9JvohCcnjwLB5yyq2+4HBYOzLNJ+FtEaxbDI+UaFmhOlNGo/NQzhKFl21/9OQ7PsZ
 0/b0Lf9ImCYtRc1qLx8pIpIhY3m14pJHsuf+ZwvkwXqLxBsXFFB0yfiFGKes+jAS7qgZKU
 YucSfjlWOAlSTRhgYGkr9WYq8t5cC4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734369883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L/wnwBU8efWfxmSKNHd6Tne3yallkC2V2Ex7nTViKSg=;
 b=xDNU2YExvz2LhbSQq+TUbcCnwhFsKN9z0wjr3jyHqdr0ZjIHpc1h1QeV9DdeMKUeqv4yRE
 YaH6qQ3FTFbtvKCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE127139D4;
 Mon, 16 Dec 2024 17:24:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FLEJMVpiYGd7LwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 17:24:42 +0000
Message-ID: <51a183c7-de10-4419-b540-b7c2ab23520a@suse.de>
Date: Mon, 16 Dec 2024 18:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: a bochs-drm (?) oops on head
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kraxel@redhat.com, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
References: <Z18dbfDAiFadsSdg@gallifrey>
 <b2e2a217-dced-472f-9084-9822f7e6803c@suse.de> <Z2AvS_8xgBhnF4CW@gallifrey>
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
In-Reply-To: <Z2AvS_8xgBhnF4CW@gallifrey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,linux.dev:email,suse.de:email,suse.de:mid];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,linux.dev:email,bootlin.com:url,qemu.org:url,treblig.org:email];
 SUBJECT_HAS_QUESTION(0.00)[]
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


Am 16.12.24 um 14:46 schrieb Dr. David Alan Gilbert:
[...]
>
>> The attached patch fixes the problem for me. Could you please test and
>> report back the results.
> That gets me a different oops; this was run with:
> qemu-system-x86_64  -M pc -cpu host --enable-kvm -smp 4 -m 2G -kernel /discs/fast/kernel/arch/x86/boot/bzImage -append "console=tty0 console=ttyS0 root=/dev/vdb1 single" -drive if=virtio,file=/discs/more/images/debian12-64scan.qcow2
>
> It looks to me if it made the mistake of trying to print something in the middle of being removed:

 From the stack trace below, I'd say it is the one at [1]. But I fail to 
reproduce the problem.

Could you please send me the complete output of dmesg after the system 
finished booting?

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.12.5/source/drivers/pci/vgaarb.c#L173


>
> [   73.569852][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> [   73.571802][    T1] [drm] Found bochs VGA, ID 0xb0c5.
> [   73.572787][    T1] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebf0000.
> [   73.581626][    T1] [drm] Initialized bochs-drm 1.0.0 for 0000:00:02.0 on minor 2
> [   73.650048][    T1] fbcon: bochs-drmdrmfb (fb1) is primary device
> [   73.650134][    T1] fbcon: Remapping primary device, fb1, to tty 1-63
> [   79.276550][    T1] bochs-drm 0000:00:02.0: [drm] fb1: bochs-drmdrmfb frame buffer device
> [   79.346726][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> [   79.348731][    T1] BUG: kernel NULL pointer dereference, address: 000000000000020c
> [   79.348799][    T1] #PF: supervisor write access in kernel mode
> [   79.348857][    T1] #PF: error_code(0x0002) - not-present page
> [   79.348913][    T1] PGD 0 P4D 0
> [   79.348999][    T1] Oops: Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
> [   79.349107][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   79.349268][    T1] Tainted: [W]=WARN, [N]=TEST
> [   79.349313][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   79.349377][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> [   79.349524][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> [   79.349628][    T1] RSP: 0018:ffffb927800136c0 EFLAGS: 00010046
> [   79.349716][    T1] RAX: 0000000000000000 RBX: ffff9835810a8800 RCX: 0000000000000000
> [   79.349808][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   79.349879][    T1] RBP: ffff983585d07000 R08: 0000000000000000 R09: 0000000000000000
> [   79.349952][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [   79.350024][    T1] R13: 0000000000000000 R14: ffff983585d075e8 R15: 0000000000000032
> [   79.350101][    T1] FS:  0000000000000000(0000) GS:ffff9835fd200000(0000) knlGS:0000000000000000
> [   79.350196][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   79.350278][    T1] CR2: 000000000000020c CR3: 000000004d920000 CR4: 0000000000350ef0
> [   79.350344][    T1] Call Trace:
> [   79.350373][    T1]  <TASK>
> [   79.350413][    T1]  ? __die+0x23/0x80
> [   79.350540][    T1]  ? page_fault_oops+0x21c/0x240
> [   79.350675][    T1]  ? do_user_addr_fault+0x893/0x1180
> [   79.350798][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.350904][    T1]  ? exc_page_fault+0x3f/0x180
> [   79.351066][    T1]  ? exc_page_fault+0x87/0x180
> [   79.351211][    T1]  ? asm_exc_page_fault+0x26/0x40
> [   79.351379][    T1]  ? fbcon_cursor+0xa9/0x3c0
> [   79.351542][    T1]  hide_cursor+0x66/0x1c0
> [   79.351656][    T1]  vt_console_print+0x9b1/0xa40
> [   79.351813][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.351920][    T1]  ? irq_trace+0x84/0xc0
> [   79.352029][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.352153][    T1]  ? console_emit_next_record+0x1fe/0x440
> [   79.352254][    T1]  console_emit_next_record+0x232/0x440
> [   79.352333][    T1]  ? console_emit_next_record+0x1fe/0x440
> [   79.352450][    T1]  console_flush_all+0x590/0x7c0
> [   79.352531][    T1]  ? console_flush_all+0x26/0x7c0
> [   79.352601][    T1]  console_unlock+0xf9/0x280
> [   79.352601][    T1]  vprintk_emit+0x572/0x5c0
> [   79.352601][    T1]  dev_vprintk_emit+0x70/0xc0
> [   79.352601][    T1]  ? __mutex_lock+0x380/0xd40
> [   79.352601][    T1]  dev_printk_emit+0x7f/0xc0
> [   79.352601][    T1]  __dev_printk+0x89/0x100
> [   79.352601][    T1]  _dev_info+0xba/0xf5
> [   79.352601][    T1]  vga_remove_vgacon.cold+0x18/0xc0
> [   79.352601][    T1]  aperture_remove_conflicting_pci_devices+0x142/0x1c0
> [   79.352601][    T1]  ? __pfx_bochs_pci_probe+0x40/0x40
> [   79.352601][    T1]  bochs_pci_probe+0x30/0x380
> [   79.352601][    T1]  local_pci_probe+0x88/0x100
> [   79.352601][    T1]  pci_call_probe+0x126/0x340
> [   79.352601][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.352601][    T1]  ? pci_match_device+0x287/0x380
> [   79.352601][    T1]  pci_device_probe+0x154/0x280
> [   79.352601][    T1]  ? __pfx_pci_device_probe+0x40/0x40
> [   79.352601][    T1]  really_probe+0x411/0x780
> [   79.352601][    T1]  __driver_probe_device+0x194/0x280
> [   79.352601][    T1]  driver_probe_device+0x6f/0x1c0
> [   79.352601][    T1]  __driver_attach+0x204/0x380
> [   79.352601][    T1]  ? __pfx___driver_attach+0x40/0x40
> [   79.352601][    T1]  bus_for_each_dev+0xe3/0x180
> [   79.352601][    T1]  driver_attach+0x3a/0x80
> [   79.352601][    T1]  bus_add_driver+0x1fd/0x3c0
> [   79.352601][    T1]  driver_register+0x11d/0x1c0
> [   79.352601][    T1]  __pci_register_driver+0x105/0x140
> [   79.352601][    T1]  bochs_pci_driver_init+0x8a/0xc0
> [   79.352601][    T1]  ? __pfx_bochs_pci_driver_init+0x40/0x40
> [   79.352601][    T1]  do_one_initcall+0xa7/0x500
> [   79.352601][    T1]  do_initcalls+0x1d5/0x240
> [   79.352601][    T1]  kernel_init_freeable+0x1e4/0x280
> [   79.352601][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   79.352601][    T1]  kernel_init+0x2a/0x280
> [   79.352601][    T1]  ret_from_fork+0x4d/0x80
> [   79.352601][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   79.352601][    T1]  ret_from_fork_asm+0x22/0x80
> [   79.352601][    T1]  </TASK>
> [   79.352601][    T1] Modules linked in:
> [   79.352601][    T1] CR2: 000000000000020c
> [   79.352601][    T1] ---[ end trace 0000000000000000 ]---
> [   79.352601][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> [   79.352601][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> [   79.352601][    T1] RSP: 0018:ffffb927800136c0 EFLAGS: 00010046
> [   79.352601][    T1] RAX: 0000000000000000 RBX: ffff9835810a8800 RCX: 0000000000000000
> [   79.352601][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   79.352601][    T1] RBP: ffff983585d07000 R08: 0000000000000000 R09: 0000000000000000
> [   79.352601][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [   79.352601][    T1] R13: 0000000000000000 R14: ffff983585d075e8 R15: 0000000000000032
> [   79.352601][    T1] FS:  0000000000000000(0000) GS:ffff9835fd200000(0000) knlGS:0000000000000000
> [   79.352601][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   79.352601][    T1] CR2: 000000000000020c CR3: 000000004d920000 CR4: 0000000000350ef0
> [   79.352601][    T1] Kernel panic - not syncing: Fatal exception
> [   79.352601][    T1] Kernel Offset: 0xf800000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> [   79.352601][    T1] ---[ end Kernel panic - not syncing: Fatal exception ]---
>
>> Best regards
>> Thomas
>>
>>
>>> Dave
>>>
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>  From bebba3b34d5df5aa7c882f080633b43ddb87f4ad Mon Sep 17 00:00:00 2001
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Date: Mon, 16 Dec 2024 09:21:46 +0100
>> Subject: [PATCH] drm/bochs: Do not put DRM device in PCI remove callback
>>
>> Removing the bochs PCI device should mark the DRM device as unplugged
>> without removing it. Hence clear the respective call to drm_dev_put()
>> from bochs_pci_remove().
>>
>> Fixes a double unref in devm_drm_dev_init_release(). An example error
>> message is shown below:
>>
>> [   32.958338] BUG: KASAN: use-after-free in drm_dev_put.part.0+0x1b/0x90
>> [   32.958850] Write of size 4 at addr ffff888152134004 by task (udev-worker)/591
>> [   32.959574] CPU: 3 UID: 0 PID: 591 Comm: (udev-worker) Tainted: G            E      6.13.0-rc2-1-default+ #3417
>> [   32.960316] Tainted: [E]=UNSIGNED_MODULE
>> [   32.960637] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
>> [   32.961429] Call Trace:
>> [   32.961433]  <TASK>
>> [   32.961439]  dump_stack_lvl+0x68/0x90
>> [   32.961452]  print_address_description.constprop.0+0x88/0x330
>> [   32.961461]  ? preempt_count_sub+0x14/0xc0
>> [   32.961473]  print_report+0xe2/0x1d0
>> [   32.961479]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   32.963725]  ? __virt_addr_valid+0x143/0x320
>> [   32.964077]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   32.964463]  ? drm_dev_put.part.0+0x1b/0x90
>> [   32.964817]  kasan_report+0xce/0x1a0
>> [   32.965123]  ? drm_dev_put.part.0+0x1b/0x90
>> [   32.965474]  kasan_check_range+0xff/0x1c0
>> [   32.965806]  drm_dev_put.part.0+0x1b/0x90
>> [   32.966138]  release_nodes+0x84/0xc0
>> [   32.966447]  devres_release_all+0xd2/0x110
>> [   32.966788]  ? __pfx_devres_release_all+0x10/0x10
>> [   32.967177]  ? preempt_count_sub+0x14/0xc0
>> [   32.967523]  device_unbind_cleanup+0x16/0xc0
>> [   32.967886]  really_probe+0x1b7/0x570
>> [   32.968207]  __driver_probe_device+0xca/0x1b0
>> [   32.968568]  driver_probe_device+0x4a/0xf0
>> [   32.968907]  __driver_attach+0x10b/0x290
>> [   32.969239]  ? __pfx___driver_attach+0x10/0x10
>> [   32.969598]  bus_for_each_dev+0xc0/0x110
>> [   32.969923]  ? __pfx_bus_for_each_dev+0x10/0x10
>> [   32.970291]  ? bus_add_driver+0x17a/0x2b0
>> [   32.970622]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [   32.971011]  bus_add_driver+0x19a/0x2b0
>> [   32.971335]  driver_register+0xd8/0x160
>> [   32.971671]  ? __pfx_bochs_pci_driver_init+0x10/0x10 [bochs]
>> [   32.972130]  do_one_initcall+0xba/0x390
>> [...]
>>
>> After unplugging the DRM device, clients will close their references.
>> Closing the final reference will also release the DRM device.
>>
>> Reported-by: Dr. David Alan Gilbert <dave@treblig.org>
>> Closes: https://lore.kernel.org/lkml/Z18dbfDAiFadsSdg@gallifrey/
>> Fixes: 04826f588682 ("drm/bochs: Allocate DRM device in struct bochs_device")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: virtualization@lists.linux.dev
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/tiny/bochs.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
>> index 89a699370a59..c67e1f906785 100644
>> --- a/drivers/gpu/drm/tiny/bochs.c
>> +++ b/drivers/gpu/drm/tiny/bochs.c
>> @@ -757,7 +757,6 @@ static void bochs_pci_remove(struct pci_dev *pdev)
>>   
>>   	drm_dev_unplug(dev);
>>   	drm_atomic_helper_shutdown(dev);
>> -	drm_dev_put(dev);
>>   }
>>   
>>   static void bochs_pci_shutdown(struct pci_dev *pdev)
>> -- 
>> 2.47.1
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

