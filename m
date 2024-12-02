Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56249E0003
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9085B10E031;
	Mon,  2 Dec 2024 11:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="T4nblVZl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qox4qYdM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C7Frzynh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4vmgLa1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C8B10E031
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 11:18:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6DF1A1F444;
 Mon,  2 Dec 2024 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733138285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W+IXiFp+/rsFqNO9VlZhth/sSXGYvaX5zlaXVFR31aQ=;
 b=T4nblVZl9/euR3YwC6EOccI+6VfKxRUQwzH4AlybHqdkVM5m5DegCyXZ8x8hzMP+/uN0mf
 +Q214n8NBA7zHml0NvNPazJPtLuSzMtyYkLPNfjW784tQ/wv1Ze5SSuDqhXssYV2XzDOiw
 W/suOyzJ+uXfbH/1APQ63k+nDpScSSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733138285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W+IXiFp+/rsFqNO9VlZhth/sSXGYvaX5zlaXVFR31aQ=;
 b=Qox4qYdM24dvIveGG+ZHR80rK3s0YaeJWlppYZUk0+okXTJLA3bH9mk8l9buLDjEhRNE7I
 vMTpdSayVk8hypDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C7Frzynh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P4vmgLa1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733138284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W+IXiFp+/rsFqNO9VlZhth/sSXGYvaX5zlaXVFR31aQ=;
 b=C7Frzynh++CmhQjgo5utIps8SNBY5f0tTfEPr6fQsTz+8XEyXVxDAM0gOHCrD6NXs2EVqP
 lKHcYp5rrotXqurmY7Feec1FGamgrU1y76VXlaXhUZC6j/vpQNyNMab0B5VLOiHatEssyq
 yc6zvMBFG9KFVX3xqBrLaWkYdWR0JYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733138284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W+IXiFp+/rsFqNO9VlZhth/sSXGYvaX5zlaXVFR31aQ=;
 b=P4vmgLa1K3N4PhkZFMPYaQOfdQBNBwG9PyDQDJ3Ph5maTc/UzzvCXcHvaq5EEiYqIP6NQt
 E/lozZglq6uc8KDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37EC6139C2;
 Mon,  2 Dec 2024 11:18:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5z+/C2yXTWeiXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Dec 2024 11:18:04 +0000
Content-Type: multipart/mixed; boundary="------------GbLaq8CXTuuMdOErgUblW0r0"
Message-ID: <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de>
Date: Mon, 2 Dec 2024 12:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/fbdev-dma: regression
To: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de>
 <CAEXMXLQw1yqUGbWcrKZdOuGvA4eZMG0utiyQ2PVRvTeuFedGbA@mail.gmail.com>
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
In-Reply-To: <CAEXMXLQw1yqUGbWcrKZdOuGvA4eZMG0utiyQ2PVRvTeuFedGbA@mail.gmail.com>
X-Rspamd-Queue-Id: 6DF1A1F444
X-Spam-Score: -3.41
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; HAS_ATTACHMENT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

This is a multi-part message in MIME format.
--------------GbLaq8CXTuuMdOErgUblW0r0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi


Am 29.11.24 um 00:37 schrieb Nuno Gonçalves:
>> Here's a first attempt to address this bug. Could you please apply the
>> attached patch and report on the results? It should work against the
>> upcoming v6.13-rc1 or against a recent drm-misc-next.
> Hi. No luck yet.

Thanks for testing. Attached is another patch. It attempts to restore 
the fbdev handling as before the regression. Please give it a try.

Best regards
Thomas

>
> I collected crashes before the patch:
>
> BUG: Bad page map in process husband  pte:60000001b46fcb pmd:800000002736403
> page: refcount:1 mapcount:-1 mapping:000000005cb4182c index:0x6 pfn:0x1b46
> aops:0xffff8000807722e0 ino:15 dentry name(?):"fb0"
> flags: 0x14(referenced|dirty|zone=0)
> raw: 0000000000000014 dead000000000100 dead000000000122 ffff0000018cf348
> raw: 0000000000000006 0000000000000000 00000001fffffffe 0000000000000000
> page dumped because: bad pte
> addr:0000ffff87b4e000 vm_flags:040400fb anon_vma:0000000000000000
> mapping:ffff0000018cf348 index:6
> file:fb0 fault:fb_deferred_io_fault mmap:fb_mmap read_folio:0x0
> CPU: 2 UID: 0 PID: 313 Comm: husband Not tainted 6.12.0 #1
> Hardware name: Raspberry Pi Compute Module 3 Rev 1.0 (DT)
> Call trace:
>   show_stack+0x18/0x30 (C)
>   dump_stack_lvl+0x60/0x80
>   dump_stack+0x18/0x24
>   print_bad_pte+0x174/0x1d0
>   unmap_page_range+0x47c/0xc90
>   unmap_vmas+0xa4/0x100
>   exit_mmap+0xbc/0x2c0
>   mmput+0x70/0x190
>   do_exit+0x248/0x8f0
>   do_group_exit+0x34/0x90
>   get_signal+0x834/0x860
>   do_signal+0xf4/0x330
>   do_notify_resume+0xc0/0x140
>   el0_svc+0xb8/0xd0
>   el0t_64_sync_handler+0x10c/0x140
>   el0t_64_sync+0x198/0x19c
> Disabling lock debugging due to kernel taint
>
> And after the patch:
>
> lk_smartMem abort info:
>   /tmp/0c  ESR = 0x0000000096000044
> 8081f6-1  EC = 0x25: DABT (current EL), IL = 32 bits
> 165-4fd2  SET = 0, FnV = 0
> -5e4e03b  EA = 0, S1PTW = 0
> e-57fa8e  FSC = 0x04: level 0 translation fault
> 22.dmp
> Data abort info:
>    ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
>    CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [ffbf801f8e7bf010] address between user and kernel address ranges
> Internal error: Oops: 0000000096000044 [#1] SMP
> CPU: 1 UID: 0 PID: 260 Comm: husband Not tainted 6.12.0 #1
> Hardware name: Raspberry Pi Compute Module 3 Rev 1.0 (DT)
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : tlb_remove_table+0xc8/0x1c0
> lr : tlb_remove_table+0xc0/0x1c0
> sp : ffff80008117b9d0
> x29: ffff80008117b9d0 x28: ffff80008117bb98 x27: 0000aaaad1df8000
> x26: 0000aaaad1df7fff x25: ffff0000044f4468 x24: 00000000ffffffdb
> x23: fffffdffc008f2c0 x22: ffff8000808a1860 x21: 0000aaaad1c00000
> x20: fffffdffc008f2c0 x19: ffff80008117bb98 x18: ffff80008117bb50
> x17: ffffffffffffffff x16: 0000000000000000 x15: ffff8000807b62a8
> x14: 0000ffffb7640fff x13: 0000000000000000 x12: 0000000000000000
> x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000037b6f
> x8 : ffff80008094a0e7 x7 : 0000000000000800 x6 : 0000000000000000
> x5 : 0000000000000801 x4 : dead000000000122 x3 : 0000000000000000
> x2 : 0000020040000000 x1 : ffff000000000000 x0 : ffbf801f8e7bf000
> Call trace:
>   tlb_remove_table+0xc8/0x1c0 (P)
>   tlb_remove_table+0xc0/0x1c0 (L)
>   free_pgd_range+0x228/0x5d0
>   free_pgtables+0x1c4/0x270
>   exit_mmap+0x130/0x2c0
>   mmput+0x70/0x190
>   do_exit+0x248/0x8f0
>   do_group_exit+0x34/0x90
>   get_signal+0x834/0x860
>   do_signal+0x118/0x330
>   do_notify_resume+0xc0/0x140
>   el0_svc+0xb8/0xd0
>   el0t_64_sync_handler+0x10c/0x140
>   el0t_64_sync+0x198/0x19c
> Code: 52850000 94006fdd f9000660 b4000080 (b900101f)
> ---[ end trace 0000000000000000 ]---
> Fixing recursive fault but reboot is needed!
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000008
> Mem abort info:
>    ESR = 0x0000000096000044
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x04: level 0 translation fault
> Data abort info:
>    ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
>    CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=000000000238c000
> [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
> Internal error: Oops: 0000000096000044 [#2] SMP
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G      D            6.12.0 #1
> Tainted: [D]=DIE
> Hardware name: Raspberry Pi Compute Module 3 Rev 1.0 (DT)
> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : free_unref_page_commit+0x70/0x2c0
> lr : free_unref_page+0x17c/0x400
> sp : ffff800080003da0
> x29: ffff800080003da0 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff00003e39e0b8 x24: 0000000000000000
> x23: 0000000000000000 x22: 00000000ffffffff x21: ffff00003e39efc0
> x20: 0000000000000000 x19: ffff800080add340 x18: ffff800081163c40
> x17: ffff7fffbda55000 x16: ffff800080000000 x15: 0000000000001900
> x14: 00000f423fffe700 x13: 0000000000000000 x12: ffff00003e39efc0
> x11: 0000000000000001 x10: 0000000000000001 x9 : ffff7fffbda55000
> x8 : fffffdffc00e81c8 x7 : ffff00003e39efe0 x6 : 0000000000000020
> x5 : ffff00003e39efc0 x4 : 00000000ffffffff x3 : 0000000000000000
> x2 : fffffdffc00e81c0 x1 : 0000000000000000 x0 : ffff800080add340
> Call trace:
>   free_unref_page_commit+0x70/0x2c0 (P)
>   free_unref_page+0x17c/0x400 (L)
>   free_unref_page+0x17c/0x400
>   __folio_put+0x50/0xb0
>   tlb_remove_table_rcu+0xb0/0xc0
>   rcu_core+0x1f4/0x520
>   rcu_core_si+0x10/0x20
>   handle_softirqs+0xf4/0x230
>   __do_softirq+0x14/0x20
>   ____do_softirq+0x10/0x20
>   call_on_irq_stack+0x24/0x54
>   do_softirq_own_stack+0x1c/0x30
>   __irq_exit_rcu+0xc8/0x100
>   irq_exit_rcu+0x10/0x20
>   el1_interrupt+0x38/0x60
>   el1h_64_irq_handler+0x18/0x30
>   el1h_64_irq+0x6c/0x70
>   default_idle_call+0x28/0x3c (P)
>   default_idle_call+0x24/0x3c (L)
>   do_idle+0x9c/0xf0
>   cpu_startup_entry+0x34/0x40
>   rest_init+0xb8/0xc0
>   do_one_initcall+0x0/0x16c
>   __primary_switched+0x88/0x90
> Code: 8b2ac0e7 f8296827 8b0600a7 f9401181 (f9000428)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops: Fatal exception in interrupt
> SMP: stopping secondary CPUs
> Kernel Offset: disabled
> CPU features: 0x000,00000c00,00800000,0200420b
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---
>
> Thanks,
> Nuno

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------GbLaq8CXTuuMdOErgUblW0r0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fbdev-dma-Add-shadow-buffering-for-deferred-I-O.patch"
Content-Disposition: attachment;
 filename*0="0001-fbdev-dma-Add-shadow-buffering-for-deferred-I-O.patch"
Content-Transfer-Encoding: base64

RnJvbSBlNGU5MWRiZWU2YjQ5YzY4ODdhNWI4MjEwMGU0MzkwMGIyNGZlMGE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAyOCBOb3YgMjAyNCAxMToxMToyNSArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGZiZGV2LWRtYTogQWRkIHNoYWRvdyBidWZmZXJpbmcgZm9yIGRlZmVycmVk
IEkvTwoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9kbWEuYyB8IDIxMyArKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1MyBpbnNl
cnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiZGV2X2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9kbWEuYwpp
bmRleCBiMTRiNTgxYzA1OWQuLjVkNGM1ZjVkMDgyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mYmRldl9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2
X2RtYS5jCkBAIC0xLDYgKzEsNyBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1J
VAogCiAjaW5jbHVkZSA8bGludXgvZmIuaD4KKyNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+
CiAKICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJkZXZf
ZG1hLmg+CkBAIC03NCwzMyArNzUsOTggQEAgRkJfR0VOX0RFRkFVTFRfREVGRVJSRURfRE1B
TUVNX09QUyhkcm1fZmJkZXZfZG1hLAogCQkJCSAgIGRybV9mYl9oZWxwZXJfZGFtYWdlX3Jh
bmdlLAogCQkJCSAgIGRybV9mYl9oZWxwZXJfZGFtYWdlX2FyZWEpOwogCi1zdGF0aWMgaW50
IGRybV9mYmRldl9kbWFfZGVmZXJyZWRfZmJfbW1hcChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCitzdGF0aWMgdm9pZCBkcm1fZmJkZXZfZG1h
X2RlZmVycmVkX2ZiX2Rlc3Ryb3koc3RydWN0IGZiX2luZm8gKmluZm8pCiB7CiAJc3RydWN0
IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciA9IGluZm8tPnBhcjsKLQlzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiA9IGZiX2hlbHBlci0+ZmI7Ci0Jc3RydWN0IGRybV9nZW1fZG1hX29i
amVjdCAqZG1hID0gZHJtX2ZiX2RtYV9nZXRfZ2VtX29iaihmYiwgMCk7CisJdm9pZCAqc2hh
ZG93ID0gaW5mby0+c2NyZWVuX2J1ZmZlcjsKKworCWlmICghZmJfaGVscGVyLT5kZXYpCisJ
CXJldHVybjsKIAotCWlmICghZG1hLT5tYXBfbm9uY29oZXJlbnQpCi0JCXZtYS0+dm1fcGFn
ZV9wcm90ID0gcGdwcm90X3dyaXRlY29tYmluZSh2bWEtPnZtX3BhZ2VfcHJvdCk7CisJaWYg
KGluZm8tPmZiZGVmaW8pCisJCWZiX2RlZmVycmVkX2lvX2NsZWFudXAoaW5mbyk7CisJZHJt
X2ZiX2hlbHBlcl9maW5pKGZiX2hlbHBlcik7CisJdmZyZWUoc2hhZG93KTsKIAotCXJldHVy
biBmYl9kZWZlcnJlZF9pb19tbWFwKGluZm8sIHZtYSk7CisJZHJtX2NsaWVudF9idWZmZXJf
dnVubWFwKGZiX2hlbHBlci0+YnVmZmVyKTsKKwlkcm1fY2xpZW50X2ZyYW1lYnVmZmVyX2Rl
bGV0ZShmYl9oZWxwZXItPmJ1ZmZlcik7CisJZHJtX2NsaWVudF9yZWxlYXNlKCZmYl9oZWxw
ZXItPmNsaWVudCk7CisJZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoZmJfaGVscGVyKTsKKwlr
ZnJlZShmYl9oZWxwZXIpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29wcyBkcm1f
ZmJkZXZfZG1hX2RlZmVycmVkX2ZiX29wcyA9IHsKIAkub3duZXIgPSBUSElTX01PRFVMRSwK
IAkuZmJfb3BlbiA9IGRybV9mYmRldl9kbWFfZmJfb3BlbiwKIAkuZmJfcmVsZWFzZSA9IGRy
bV9mYmRldl9kbWFfZmJfcmVsZWFzZSwKLQlfX0ZCX0RFRkFVTFRfREVGRVJSRURfT1BTX1JE
V1IoZHJtX2ZiZGV2X2RtYSksCisJRkJfREVGQVVMVF9ERUZFUlJFRF9PUFMoZHJtX2ZiZGV2
X2RtYSksCiAJRFJNX0ZCX0hFTFBFUl9ERUZBVUxUX09QUywKLQlfX0ZCX0RFRkFVTFRfREVG
RVJSRURfT1BTX0RSQVcoZHJtX2ZiZGV2X2RtYSksCi0JLmZiX21tYXAgPSBkcm1fZmJkZXZf
ZG1hX2RlZmVycmVkX2ZiX21tYXAsCi0JLmZiX2Rlc3Ryb3kgPSBkcm1fZmJkZXZfZG1hX2Zi
X2Rlc3Ryb3ksCisJLmZiX2Rlc3Ryb3kgPSBkcm1fZmJkZXZfZG1hX2RlZmVycmVkX2ZiX2Rl
c3Ryb3ksCiB9OwogCiAvKgogICogc3RydWN0IGRybV9mYl9oZWxwZXIKICAqLwogCitzdGF0
aWMgdm9pZCBkcm1fZmJkZXZfZG1hX2RhbWFnZV9ibGl0X3JlYWwoc3RydWN0IGRybV9mYl9o
ZWxwZXIgKmZiX2hlbHBlciwKKwkJCQkJICAgc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXAs
CisJCQkJCSAgIHN0cnVjdCBpb3N5c19tYXAgKmRzdCkKK3sKKwlzdHJ1Y3QgZHJtX2ZyYW1l
YnVmZmVyICpmYiA9IGZiX2hlbHBlci0+ZmI7CisJc2l6ZV90IG9mZnNldCA9IGNsaXAtPnkx
ICogZmItPnBpdGNoZXNbMF07CisJc2l6ZV90IGxlbiA9IGNsaXAtPngyIC0gY2xpcC0+eDE7
CisJdW5zaWduZWQgaW50IHk7CisJdm9pZCAqc3JjOworCisJc3dpdGNoIChkcm1fZm9ybWF0
X2luZm9fYnBwKGZiLT5mb3JtYXQsIDApKSB7CisJY2FzZSAxOgorCQlvZmZzZXQgKz0gY2xp
cC0+eDEgLyA4OworCQlsZW4gPSBESVZfUk9VTkRfVVAobGVuICsgY2xpcC0+eDEgJSA4LCA4
KTsKKwkJYnJlYWs7CisJY2FzZSAyOgorCQlvZmZzZXQgKz0gY2xpcC0+eDEgLyA0OworCQls
ZW4gPSBESVZfUk9VTkRfVVAobGVuICsgY2xpcC0+eDEgJSA0LCA0KTsKKwkJYnJlYWs7CisJ
Y2FzZSA0OgorCQlvZmZzZXQgKz0gY2xpcC0+eDEgLyAyOworCQlsZW4gPSBESVZfUk9VTkRf
VVAobGVuICsgY2xpcC0+eDEgJSAyLCAyKTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJb2Zm
c2V0ICs9IGNsaXAtPngxICogZmItPmZvcm1hdC0+Y3BwWzBdOworCQlsZW4gKj0gZmItPmZv
cm1hdC0+Y3BwWzBdOworCQlicmVhazsKKwl9CisKKwlzcmMgPSBmYl9oZWxwZXItPmluZm8t
PnNjcmVlbl9idWZmZXIgKyBvZmZzZXQ7CisJaW9zeXNfbWFwX2luY3IoZHN0LCBvZmZzZXQp
OyAvKiBnbyB0byBmaXJzdCBwaXhlbCB3aXRoaW4gY2xpcCByZWN0ICovCisKKwlmb3IgKHkg
PSBjbGlwLT55MTsgeSA8IGNsaXAtPnkyOyB5KyspIHsKKwkJaW9zeXNfbWFwX21lbWNweV90
byhkc3QsIDAsIHNyYywgbGVuKTsKKwkJaW9zeXNfbWFwX2luY3IoZHN0LCBmYi0+cGl0Y2hl
c1swXSk7CisJCXNyYyArPSBmYi0+cGl0Y2hlc1swXTsKKwl9Cit9CisKK3N0YXRpYyBpbnQg
ZHJtX2ZiZGV2X2RtYV9kYW1hZ2VfYmxpdChzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVs
cGVyLAorCQkJCSAgICAgc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXApCit7CisJc3RydWN0
IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIgPSBmYl9oZWxwZXItPmJ1ZmZlcjsKKwlzdHJ1
Y3QgaW9zeXNfbWFwIGRzdDsKKworCS8qCisJICogRm9yIGZiZGV2IGVtdWxhdGlvbiwgd2Ug
b25seSBoYXZlIHRvIHByb3RlY3QgYWdhaW5zdCBmYmRldiBtb2Rlc2V0CisJICogb3BlcmF0
aW9ucy4gTm90aGluZyBlbHNlIHdpbGwgaW52b2x2ZSB0aGUgY2xpZW50IGJ1ZmZlcidzIEJP
LiBTbyBpdAorCSAqIGlzIHN1ZmZpY2llbnQgdG8gYWNxdWlyZSBzdHJ1Y3QgZHJtX2ZiX2hl
bHBlci5sb2NrIGhlcmUuCisJICovCisJbXV0ZXhfbG9jaygmZmJfaGVscGVyLT5sb2NrKTsK
KworCWRzdCA9IGJ1ZmZlci0+bWFwOworCWRybV9mYmRldl9kbWFfZGFtYWdlX2JsaXRfcmVh
bChmYl9oZWxwZXIsIGNsaXAsICZkc3QpOworCisJbXV0ZXhfdW5sb2NrKCZmYl9oZWxwZXIt
PmxvY2spOworCisJcmV0dXJuIDA7Cit9CiBzdGF0aWMgaW50IGRybV9mYmRldl9kbWFfaGVs
cGVyX2ZiX2RpcnR5KHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIsCiAJCQkJCSBzdHJ1
Y3QgZHJtX2NsaXBfcmVjdCAqY2xpcCkKIHsKQEAgLTExMiw2ICsxNzgsMTAgQEAgc3RhdGlj
IGludCBkcm1fZmJkZXZfZG1hX2hlbHBlcl9mYl9kaXJ0eShzdHJ1Y3QgZHJtX2ZiX2hlbHBl
ciAqaGVscGVyLAogCQlyZXR1cm4gMDsKIAogCWlmIChoZWxwZXItPmZiLT5mdW5jcy0+ZGly
dHkpIHsKKwkJcmV0ID0gZHJtX2ZiZGV2X2RtYV9kYW1hZ2VfYmxpdChoZWxwZXIsIGNsaXAp
OworCQlpZiAoZHJtX1dBUk5fT05DRShkZXYsIHJldCwgIkRhbWFnZSBibGl0dGVyIGZhaWxl
ZDogcmV0PSVkXG4iLCByZXQpKQorCQkJcmV0dXJuIHJldDsKKwogCQlyZXQgPSBoZWxwZXIt
PmZiLT5mdW5jcy0+ZGlydHkoaGVscGVyLT5mYiwgTlVMTCwgMCwgMCwgY2xpcCwgMSk7CiAJ
CWlmIChkcm1fV0FSTl9PTkNFKGRldiwgcmV0LCAiRGlydHkgaGVscGVyIGZhaWxlZDogcmV0
PSVkXG4iLCByZXQpKQogCQkJcmV0dXJuIHJldDsKQEAgLTEyOCwxNCArMTk4LDgwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9mdW5jcyBkcm1fZmJkZXZfZG1hX2hl
bHBlcl9mdW5jcyA9IHsKICAqIHN0cnVjdCBkcm1fZmJfaGVscGVyCiAgKi8KIAorc3RhdGlj
IGludCBkcm1fZmJkZXZfZG1hX2RyaXZlcl9mYmRldl9wcm9iZV90YWlsKHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpmYl9oZWxwZXIsCisJCQkJCQkgc3RydWN0IGRybV9mYl9oZWxwZXJfc3Vy
ZmFjZV9zaXplICpzaXplcykKK3sKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZmJfaGVs
cGVyLT5kZXY7CisJc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIgPSBmYl9oZWxw
ZXItPmJ1ZmZlcjsKKwlzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0ICpkbWFfb2JqID0gdG9f
ZHJtX2dlbV9kbWFfb2JqKGJ1ZmZlci0+Z2VtKTsKKwlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiA9IGZiX2hlbHBlci0+ZmI7CisJc3RydWN0IGZiX2luZm8gKmluZm8gPSBmYl9oZWxw
ZXItPmluZm87CisJc3RydWN0IGlvc3lzX21hcCBtYXAgPSBidWZmZXItPm1hcDsKKworCWlu
Zm8tPmZib3BzID0gJmRybV9mYmRldl9kbWFfZmJfb3BzOworCisJLyogc2NyZWVuICovCisJ
aW5mby0+ZmxhZ3MgfD0gRkJJTkZPX1ZJUlRGQjsgLyogc3lzdGVtIG1lbW9yeSAqLworCWlm
IChkbWFfb2JqLT5tYXBfbm9uY29oZXJlbnQpCisJCWluZm8tPmZsYWdzIHw9IEZCSU5GT19S
RUFEU19GQVNUOyAvKiBzaWduYWwgY2FjaGluZyAqLworCWluZm8tPnNjcmVlbl9zaXplID0g
c2l6ZXMtPnN1cmZhY2VfaGVpZ2h0ICogZmItPnBpdGNoZXNbMF07CisJaW5mby0+c2NyZWVu
X2J1ZmZlciA9IG1hcC52YWRkcjsKKwlpZiAoIShpbmZvLT5mbGFncyAmIEZCSU5GT19ISURF
X1NNRU1fU1RBUlQpKSB7CisJCWlmICghZHJtX1dBUk5fT04oZGV2LCBpc192bWFsbG9jX2Fk
ZHIoaW5mby0+c2NyZWVuX2J1ZmZlcikpKQorCQkJaW5mby0+Zml4LnNtZW1fc3RhcnQgPSBw
YWdlX3RvX3BoeXModmlydF90b19wYWdlKGluZm8tPnNjcmVlbl9idWZmZXIpKTsKKwl9CisJ
aW5mby0+Zml4LnNtZW1fbGVuID0gaW5mby0+c2NyZWVuX3NpemU7CisKKwlyZXR1cm4gMDsK
K30KKworc3RhdGljIGludCBkcm1fZmJkZXZfZG1hX2RyaXZlcl9mYmRldl9wcm9iZV90YWls
X2RlZmVycmVkKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsCisJCQkJCQkJICBz
dHJ1Y3QgZHJtX2ZiX2hlbHBlcl9zdXJmYWNlX3NpemUgKnNpemVzKQoreworCXN0cnVjdCBk
cm1fY2xpZW50X2J1ZmZlciAqYnVmZmVyID0gZmJfaGVscGVyLT5idWZmZXI7CisJc3RydWN0
IGZiX2luZm8gKmluZm8gPSBmYl9oZWxwZXItPmluZm87CisJc2l6ZV90IHNjcmVlbl9zaXpl
ID0gYnVmZmVyLT5nZW0tPnNpemU7CisJdm9pZCAqc2NyZWVuX2J1ZmZlcjsKKwlpbnQgcmV0
OworCisJLyoKKwkgKiBEZWZlcnJlZCBJL08gcmVxdWlyZXMgc3RydWN0IHBhZ2UgZm9yIGZy
YW1lYnVmZmVyIG1lbW9yeSwKKwkgKiB3aGljaCBpcyBub3QgZ3VhcmFudGVlZCBmb3IgYWxs
IERNQSByYW5nZXMuIFdlIHRodXMgY3JlYXRlCisJICogYSBzaGFkb3cgYnVmZmVyIGluIHN5
c3RlbSBtZW1vcnkuCisJICovCisJc2NyZWVuX2J1ZmZlciA9IHZ6YWxsb2Moc2NyZWVuX3Np
emUpOworCWlmICghc2NyZWVuX2J1ZmZlcikKKwkJcmV0dXJuIC1FTk9NRU07CisKKwlpbmZv
LT5mYm9wcyA9ICZkcm1fZmJkZXZfZG1hX2RlZmVycmVkX2ZiX29wczsKKworCS8qIHNjcmVl
biAqLworCWluZm8tPmZsYWdzIHw9IEZCSU5GT19WSVJURkI7IC8qIHN5c3RlbSBtZW1vcnkg
Ki8KKwlpbmZvLT5mbGFncyB8PSBGQklORk9fUkVBRFNfRkFTVDsgLyogc2lnbmFsIGNhY2hp
bmcgKi8KKwlpbmZvLT5zY3JlZW5fYnVmZmVyID0gc2NyZWVuX2J1ZmZlcjsKKwlpbmZvLT5m
aXguc21lbV9sZW4gPSBzY3JlZW5fc2l6ZTsKKworCWZiX2hlbHBlci0+ZmJkZWZpby5kZWxh
eSA9IEhaIC8gMjA7CisJZmJfaGVscGVyLT5mYmRlZmlvLmRlZmVycmVkX2lvID0gZHJtX2Zi
X2hlbHBlcl9kZWZlcnJlZF9pbzsKKworCWluZm8tPmZiZGVmaW8gPSAmZmJfaGVscGVyLT5m
YmRlZmlvOworCXJldCA9IGZiX2RlZmVycmVkX2lvX2luaXQoaW5mbyk7CisJaWYgKHJldCkK
KwkJZ290byBlcnJfdmZyZWU7CisKKwlyZXR1cm4gMDsKKworZXJyX3ZmcmVlOgorCXZmcmVl
KHNjcmVlbl9idWZmZXIpOworCXJldHVybiByZXQ7Cit9CisKIGludCBkcm1fZmJkZXZfZG1h
X2RyaXZlcl9mYmRldl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLAog
CQkJCSAgICAgc3RydWN0IGRybV9mYl9oZWxwZXJfc3VyZmFjZV9zaXplICpzaXplcykKIHsK
IAlzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCA9ICZmYl9oZWxwZXItPmNsaWVudDsK
IAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZmJfaGVscGVyLT5kZXY7Ci0JYm9vbCB1c2Vf
ZGVmZXJyZWRfaW8gPSBmYWxzZTsKIAlzdHJ1Y3QgZHJtX2NsaWVudF9idWZmZXIgKmJ1ZmZl
cjsKLQlzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0ICpkbWFfb2JqOwogCXN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiOwogCXN0cnVjdCBmYl9pbmZvICppbmZvOwogCXUzMiBmb3JtYXQ7
CkBAIC0xNTIsMTkgKzI4OCw5IEBAIGludCBkcm1fZmJkZXZfZG1hX2RyaXZlcl9mYmRldl9w
cm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLAogCQkJCQkgICAgICAgc2l6
ZXMtPnN1cmZhY2VfaGVpZ2h0LCBmb3JtYXQpOwogCWlmIChJU19FUlIoYnVmZmVyKSkKIAkJ
cmV0dXJuIFBUUl9FUlIoYnVmZmVyKTsKLQlkbWFfb2JqID0gdG9fZHJtX2dlbV9kbWFfb2Jq
KGJ1ZmZlci0+Z2VtKTsKIAogCWZiID0gYnVmZmVyLT5mYjsKIAotCS8qCi0JICogRGVmZXJy
ZWQgSS9PIHJlcXVpcmVzIHN0cnVjdCBwYWdlIGZvciBmcmFtZWJ1ZmZlciBtZW1vcnksCi0J
ICogd2hpY2ggaXMgbm90IGd1YXJhbnRlZWQgZm9yIGFsbCBETUEgcmFuZ2VzLiBXZSB0aHVz
IG9ubHkKLQkgKiBpbnN0YWxsIGRlZmVycmVkIEkvTyBpZiB3ZSBoYXZlIGEgZnJhbWVidWZm
ZXIgdGhhdCByZXF1aXJlcwotCSAqIGl0LgotCSAqLwotCWlmIChmYi0+ZnVuY3MtPmRpcnR5
KQotCQl1c2VfZGVmZXJyZWRfaW8gPSB0cnVlOwotCiAJcmV0ID0gZHJtX2NsaWVudF9idWZm
ZXJfdm1hcChidWZmZXIsICZtYXApOwogCWlmIChyZXQpIHsKIAkJZ290byBlcnJfZHJtX2Ns
aWVudF9idWZmZXJfZGVsZXRlOwpAQCAtMTg1LDQ1ICszMTEsMTIgQEAgaW50IGRybV9mYmRl
dl9kbWFfZHJpdmVyX2ZiZGV2X3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxw
ZXIsCiAKIAlkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhpbmZvLCBmYl9oZWxwZXIsIHNpemVz
KTsKIAotCWlmICh1c2VfZGVmZXJyZWRfaW8pCi0JCWluZm8tPmZib3BzID0gJmRybV9mYmRl
dl9kbWFfZGVmZXJyZWRfZmJfb3BzOworCWlmIChmYi0+ZnVuY3MtPmRpcnR5KQorCQlyZXQg
PSBkcm1fZmJkZXZfZG1hX2RyaXZlcl9mYmRldl9wcm9iZV90YWlsX2RlZmVycmVkKGZiX2hl
bHBlciwgc2l6ZXMpOwogCWVsc2UKLQkJaW5mby0+ZmJvcHMgPSAmZHJtX2ZiZGV2X2RtYV9m
Yl9vcHM7Ci0KLQkvKiBzY3JlZW4gKi8KLQlpbmZvLT5mbGFncyB8PSBGQklORk9fVklSVEZC
OyAvKiBzeXN0ZW0gbWVtb3J5ICovCi0JaWYgKGRtYV9vYmotPm1hcF9ub25jb2hlcmVudCkK
LQkJaW5mby0+ZmxhZ3MgfD0gRkJJTkZPX1JFQURTX0ZBU1Q7IC8qIHNpZ25hbCBjYWNoaW5n
ICovCi0JaW5mby0+c2NyZWVuX3NpemUgPSBzaXplcy0+c3VyZmFjZV9oZWlnaHQgKiBmYi0+
cGl0Y2hlc1swXTsKLQlpbmZvLT5zY3JlZW5fYnVmZmVyID0gbWFwLnZhZGRyOwotCWlmICgh
KGluZm8tPmZsYWdzICYgRkJJTkZPX0hJREVfU01FTV9TVEFSVCkpIHsKLQkJaWYgKCFkcm1f
V0FSTl9PTihkZXYsIGlzX3ZtYWxsb2NfYWRkcihpbmZvLT5zY3JlZW5fYnVmZmVyKSkpCi0J
CQlpbmZvLT5maXguc21lbV9zdGFydCA9IHBhZ2VfdG9fcGh5cyh2aXJ0X3RvX3BhZ2UoaW5m
by0+c2NyZWVuX2J1ZmZlcikpOwotCX0KLQlpbmZvLT5maXguc21lbV9sZW4gPSBpbmZvLT5z
Y3JlZW5fc2l6ZTsKLQotCS8qCi0JICogT25seSBzZXQgdXAgZGVmZXJyZWQgSS9PIGlmIHRo
ZSBzY3JlZW4gYnVmZmVyIHN1cHBvcnRzCi0JICogaXQuIElmIHRoaXMgZGlzYWdyZWVzIHdp
dGggdGhlIHByZXZpb3VzIHRlc3QgZm9yIC0+ZGlydHksCi0JICogbW1hcCBvbiB0aGUgL2Rl
di9mYiBmaWxlIG1pZ2h0IG5vdCB3b3JrIGNvcnJlY3RseS4KLQkgKi8KLQlpZiAoIWlzX3Zt
YWxsb2NfYWRkcihpbmZvLT5zY3JlZW5fYnVmZmVyKSAmJiBpbmZvLT5maXguc21lbV9zdGFy
dCkgewotCQl1bnNpZ25lZCBsb25nIHBmbiA9IGluZm8tPmZpeC5zbWVtX3N0YXJ0ID4+IFBB
R0VfU0hJRlQ7Ci0KLQkJaWYgKGRybV9XQVJOX09OKGRldiwgIXBmbl90b19wYWdlKHBmbikp
KQotCQkJdXNlX2RlZmVycmVkX2lvID0gZmFsc2U7Ci0JfQotCi0JLyogZGVmZXJyZWQgSS9P
ICovCi0JaWYgKHVzZV9kZWZlcnJlZF9pbykgewotCQlmYl9oZWxwZXItPmZiZGVmaW8uZGVs
YXkgPSBIWiAvIDIwOwotCQlmYl9oZWxwZXItPmZiZGVmaW8uZGVmZXJyZWRfaW8gPSBkcm1f
ZmJfaGVscGVyX2RlZmVycmVkX2lvOwotCi0JCWluZm8tPmZiZGVmaW8gPSAmZmJfaGVscGVy
LT5mYmRlZmlvOwotCQlyZXQgPSBmYl9kZWZlcnJlZF9pb19pbml0KGluZm8pOwotCQlpZiAo
cmV0KQotCQkJZ290byBlcnJfZHJtX2ZiX2hlbHBlcl9yZWxlYXNlX2luZm87Ci0JfQorCQly
ZXQgPSBkcm1fZmJkZXZfZG1hX2RyaXZlcl9mYmRldl9wcm9iZV90YWlsKGZiX2hlbHBlciwg
c2l6ZXMpOworCWlmIChyZXQpCisJCWdvdG8gZXJyX2RybV9mYl9oZWxwZXJfcmVsZWFzZV9p
bmZvOwogCiAJcmV0dXJuIDA7CiAKLS0gCjIuNDcuMAoK

--------------GbLaq8CXTuuMdOErgUblW0r0--
