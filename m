Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718A696B30F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86A210E69D;
	Wed,  4 Sep 2024 07:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PJGYy7dd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9i543Su+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PJGYy7dd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9i543Su+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5685310E69D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:41:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2151219BD;
 Wed,  4 Sep 2024 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725435672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oWsJdBqZnVu/HmXnRzddfP6fnABRLn84cEdAu4ysC+s=;
 b=PJGYy7ddvKWjPn86E8qBsQFKYhv3D3R/exTLlG9CBHrytImxVumrCURzkQYblfZ4gAs/b0
 gvqwV6CJg6M0NNqOUCDtfjty/1jdmueVMGeGIUaPX3i99WGZBZAgedPX6L18zsSP+yNiYc
 JqKYfJDzC1J3swFapXbFhKKYEzQdCEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725435672;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oWsJdBqZnVu/HmXnRzddfP6fnABRLn84cEdAu4ysC+s=;
 b=9i543Su+K9WLgzRSpB46UA/nUnMtTpyo8lrH9BUJcqQhIeSjtE7o19NR4Wh6rYn39OCaZb
 UiWutnfnAODrcQDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PJGYy7dd;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9i543Su+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725435672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oWsJdBqZnVu/HmXnRzddfP6fnABRLn84cEdAu4ysC+s=;
 b=PJGYy7ddvKWjPn86E8qBsQFKYhv3D3R/exTLlG9CBHrytImxVumrCURzkQYblfZ4gAs/b0
 gvqwV6CJg6M0NNqOUCDtfjty/1jdmueVMGeGIUaPX3i99WGZBZAgedPX6L18zsSP+yNiYc
 JqKYfJDzC1J3swFapXbFhKKYEzQdCEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725435672;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oWsJdBqZnVu/HmXnRzddfP6fnABRLn84cEdAu4ysC+s=;
 b=9i543Su+K9WLgzRSpB46UA/nUnMtTpyo8lrH9BUJcqQhIeSjtE7o19NR4Wh6rYn39OCaZb
 UiWutnfnAODrcQDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89409139E2;
 Wed,  4 Sep 2024 07:41:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qmSuHxgP2GbMcgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Sep 2024 07:41:12 +0000
Content-Type: multipart/mixed; boundary="------------h6o39sUUpo7A0OGksfrR0pwO"
Message-ID: <2846e207-43d5-4164-8a2e-5ce9d2aaab38@suse.de>
Date: Wed, 4 Sep 2024 09:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/43] drm/fbdev-dma: Implement damage handling and
 deferred I/O
To: Linus Walleij <linus.walleij@linaro.org>
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240419083331.7761-1-tzimmermann@suse.de>
 <20240419083331.7761-22-tzimmermann@suse.de>
 <CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com>
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
In-Reply-To: <CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com>
X-Rspamd-Queue-Id: C2151219BD
X-Spam-Level: 
X-Spamd-Result: default: False [-5.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; HAS_ATTACHMENT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email, suse.de:dkim, suse.de:mid,
 linaro.org:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.41
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

This is a multi-part message in MIME format.
--------------h6o39sUUpo7A0OGksfrR0pwO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus, Alexander,

Attached is a patch to mitigate the problem and go back to the old 
behavior for pl111. Can you please test it on affected and unaffected 
systems and report the results?

Best regards
Thomas

Am 04.09.24 um 00:53 schrieb Linus Walleij:
> On Fri, Apr 19, 2024 at 10:35 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Add support for damage handling and deferred I/O to fbdev-dma. This
>> enables fbdev-dma to support all DMA-memory-based DRM drivers, even
>> such with a dirty callback in their framebuffers.
>>
>> The patch adds the code for deferred I/O and also sets a dedicated
>> helper for struct fb_ops.fb_mmap that support coherent mappings.
>>
>> v3:
>> - init fb_ops with FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() (Javier)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> For some reason this makes the Versatile Express crash in QEMU
> (I can retest on real hardware if necessary):
>
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address 18095000 when write
> [18095000] *pgd=00000000
> Internal error: Oops: 805 [#1] SMP ARM
> CPU: 0 PID: 75 Comm: S08_ledflash Not tainted 6.9.0-rc6+ #44
> Hardware name: ARM-Versatile Express
> PC is at mmioset+0x34/0xac
> LR is at 0x0
> pc : [<809c2a54>]    lr : [<00000000>]    psr: 20000013
> sp : f8dddc38  ip : 18095000  fp : 00000000
> r10: 81109a18  r9 : 81238b04  r8 : 00000000
> r7 : 00440dc0  r6 : ed4f32a0  r5 : ed4f32a0  r4 : 00000001
> r3 : 00000000  r2 : 00000fc0  r1 : 00000000  r0 : 18095000
> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 81d6406a  DAC: 00000051
> Register r0 information: non-paged memory
> Register r1 information: NULL pointer
> Register r2 information: non-paged memory
> Register r3 information: NULL pointer
> Register r4 information: non-paged memory
> Register r5 information: non-slab/vmalloc memory
> Register r6 information: non-slab/vmalloc memory
> Register r7 information: non-paged memory
> Register r8 information: NULL pointer
> Register r9 information: non-slab/vmalloc memory
> Register r10 information: non-slab/vmalloc memory
> Register r11 information: NULL pointer
> Register r12 information: non-paged memory
> Process S08_ledflash (pid: 75, stack limit = 0x(ptrval))
> Stack: (0xf8dddc38 to 0xf8dde000)
> dc20:                                                       00000801 802af888
> dc40: 80a0fb80 00440dc0 00000801 811fad80 00000000 f8dddd28 ed4f32a0 811fa680
> dc60: 00000000 802b0c30 ee1d2140 ee1d215c 95ff4385 00000001 00000001 00000001
> dc80: 00000000 00000000 ffffffff 8196a70b 000000b0 00000064 0000006c 00000000
> dca0: 00000001 00000002 00000001 811fa798 00000801 811fa940 80a0fb80 00000cc0
> dcc0: 00000001 00000001 00000000 f8dddd28 811fa93c 811fa680 00000002 802b0c30
> dce0: ee1d2140 00440dc0 00000000 00000000 00000001 00000000 811fad80 00440dc0
> dd00: 00000001 00000000 00000000 83201100 00440dc0 00000000 00000000 802afa18
> dd20: 00000bdc 00000bd8 811fad80 00000000 811fad80 00000000 00000000 00000000
> dd40: adf00ec5 816d5fa8 816d5fa8 821c3c00 00000000 7ebc2000 7ebe3000 00000000
> dd60: f8ddde44 8028cfa0 816d5fa8 8288df50 8169cf00 821c3c00 7ebc2000 7ebe3000
> dd80: f8ddde44 8028e1e8 00000001 80bbe932 f8ddde44 f8dddde8 f8ddde44 8288df50
> dda0: 83201100 809cf474 f8ddde44 8169cf00 00000020 8169cf94 821c3c94 7ebe3000
> ddc0: 7ebe2fff fffffff4 00000000 816d5fa8 821c3c00 8169cf00 81d65fa8 809cdbb0
> dde0: 8288df50 81ffa910 7ebe3000 82890b00 00000000 00000000 00000000 00000000
> de00: 00000000 00000000 adf00ec5 00000000 00000000 8169cf00 8288df50 83201100
> de20: 821c3c00 81ffa910 f8ddde44 8011f6e4 00000000 00000000 821c3c7c 8169cf7c
> de40: 83200880 821c3c40 7ebc2000 7ebe2fff 82890b0c 76ea4000 ffffffff 00000000
> de60: 00000000 0f000a01 f8ddde68 f8ddde68 adf00ec5 00000000 00000000 00000000
> de80: 00000000 01200000 83201100 00000000 00000000 8011e2ac 00000000 83200d7c
> dea0: 83201020 83200e70 83200e80 00000000 f8dddf30 83200880 00000000 00000000
> dec0: 00000000 00000000 00000000 82182f38 adf00ec5 00000000 01200000 f8dddf30
> dee0: 00000000 00000000 00000000 00000078 000cb21c 8011fe24 00000020 00000000
> df00: 828a5d80 80a10140 adf00ec5 01200011 00000000 00000000 00000000 f8dddf30
> df20: 00000000 00000078 000cb21c 801203d4 01200000 00000000 00000000 76f46468
> df40: 00000000 00000000 00000011 00000000 00000000 00000000 00000000 00000000
> df60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> df80: 00000003 adf00ec5 76f46468 00000000 76f468c0 00000078 80100290 83201100
> dfa0: 000cb21c 80100060 76f46468 00000000 01200011 00000000 00000000 00000000
> dfc0: 76f46468 00000000 76f468c0 00000078 00000000 76e81000 76f46400 000cb21c
> dfe0: 00000078 7ebe2938 76e0854d 76dae7e6 20000030 01200011 00000000 00000000
> Call trace:
>   mmioset from prep_new_page+0x160/0x194
>   prep_new_page from get_page_from_freelist+0x10f4/0x110c
>   get_page_from_freelist from __alloc_pages+0x15c/0x280
>   __alloc_pages from __pte_alloc+0x28/0x1bc
>   __pte_alloc from copy_page_range+0xc10/0xd28
>   copy_page_range from copy_mm+0x5cc/0x850
>   copy_mm from copy_process+0x508/0xd8c
>   copy_process from kernel_clone+0x94/0x338
>   kernel_clone from sys_clone+0x94/0xb0
>   sys_clone from ret_fast_syscall+0x0/0x1c
> Exception stack(0xf8dddfa8 to 0xf8dddff0)
> dfa0:                   76f46468 00000000 01200011 00000000 00000000 00000000
> dfc0: 76f46468 00000000 76f468c0 00000078 00000000 76e81000 76f46400 000cb21c
> dfe0: 00000078 7ebe2938 76e0854d 76dae7e6
> Code: e92d4100 e1a08001 e1a0e003 e2522040 (a8ac410a)
> ---[ end trace 0000000000000000 ]---
>
> I bisected down to this commit and reverting the commit solves the issue.
>
> What is special about the Versatile Express graphics is that it uses a special
> dedicated video RAM, looks like this in the device tree
>
>
>          reserved-memory {
>                  #address-cells = <1>;
>                  #size-cells = <1>;
>                  ranges;
>
>                  /* Chipselect 3 is physically at 0x4c000000 */
>                  vram: vram@4c000000 {
>                          /* 8 MB of designated video RAM */
>                          compatible = "shared-dma-pool";
>                          reg = <0x4c000000 0x00800000>;
>                          no-map;
>                  };
>          };
> (...)
>           clcd@1f000 {
>                        compatible = "arm,pl111", "arm,primecell";
> (...)
>                        memory-region = <&vram>;
>
> This gets picked up in the driver
> drivers/gpu/drm/pl111/pl111_drv.c
> like this:
>
>          ret = of_reserved_mem_device_init(dev);
>          if (!ret) {
>                  dev_info(dev, "using device-specific reserved memory\n");
>                  priv->use_device_memory = true;
>          }
>
> Yours,
> Linus Walleij

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------h6o39sUUpo7A0OGksfrR0pwO
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-fbdev-dma-Only-install-deferred-I-O-if-necessary.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-fbdev-dma-Only-install-deferred-I-O-if-necessary.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA2NGRlNzBkYzIzYTY2ZGU4YjdmZDNlMzQxMTM2YWMyNzRkYTAxZTY1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogV2VkLCA0IFNlcCAyMDI0IDA5OjI5OjQxICswMjAwClN1YmplY3Q6
IFtQQVRDSF0gZHJtL2ZiZGV2LWRtYTogT25seSBpbnN0YWxsIGRlZmVycmVkIEkvTyBpZiBu
ZWNlc3NhcnkKCkRlZmVycmVkIEkvTyByZXF1aXJlcyBzdHJ1Y3QgcGFnZSBmb3IgZnJhbWVi
dWZmZXIgbWVtb3J5LCB3aGljaCBpcwpub3QgZ3VhcmFudGVlZCBmb3IgYWxsIERNQSByYW5n
ZXMuIFdlIHRodXMgb25seSBpbnN0YWxsIGRlZmVycmVkIEkvTwppZiB3ZSBoYXZlIGEgZnJh
bWVidWZmZXIgdGhhdCByZXF1aXJlcyBpdC4KCkEgcmVwb3J0ZWQgYnVnIGFmZmVjdGVkIHRo
ZSBwbDExMSBkcml2ZXJzLCB3aGljaCBoYXMgdmlkZW8gbWVtb3J5IGluCmVpdGhlciBOb3Jt
YWwgb3IgSGlnaE1lbSB6b25lcwoKWyAgICAwLjAwMDAwMF0gWm9uZSByYW5nZXM6ClsgICAg
MC4wMDAwMDBdICAgTm9ybWFsICAgW21lbSAweDAwMDAwMDAwMTAwMDAwMDAtMHgwMDAwMDAw
MDNmZmZmZmZmXQpbICAgIDAuMDAwMDAwXSAgIEhpZ2hNZW0gIFttZW0gMHgwMDAwMDAwMDQw
MDAwMDAwLTB4MDAwMDAwMDA0ZmZmZmZmZl0KCndoZXJlIGRlZmVycmVkIEkvTyBvbmx5IHdv
cmtzIGNvcnJlY3RseSB3aXRoIEhpZ2hNZW0uIFNlZSB0aGUgQ2xvc2VzCnRhZ3MgZm9yIGJ1
ZyByZXBvcnRzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+CkZpeGVzOiA4MDhhNDBiNjk0NjggKCJkcm0vZmJkZXYtZG1hOiBJbXBs
ZW1lbnQgZGFtYWdlIGhhbmRsaW5nIGFuZCBkZWZlcnJlZCBJL08iKQpSZXBvcnRlZC1ieTog
QWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPgpDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMzYzNjk1My42RW1oazVxV0FnQHN0
ZWluYS13LwpSZXBvcnRlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9DQUNS
cGtkYitoYjlBR2F2YldwWS09dVFRMGFwWTllbl90V0ppb1BLZl9mQWJYTVA0SGdAbWFpbC5n
bWFpbC5jb20vCkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4K
Q2M6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPgpDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
Q2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiZGV2X2RtYS5jIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9kbWEuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZG1hLmMKaW5kZXggN2VmNWE0OGM4MDI5Li40NTVk
YzQ4ZDE3YTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZG1hLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9kbWEuYwpAQCAtMzYsMjAgKzM2LDEx
IEBAIHN0YXRpYyBpbnQgZHJtX2ZiZGV2X2RtYV9mYl9yZWxlYXNlKHN0cnVjdCBmYl9pbmZv
ICppbmZvLCBpbnQgdXNlcikKIAlyZXR1cm4gMDsKIH0KIAotRkJfR0VOX0RFRkFVTFRfREVG
RVJSRURfRE1BTUVNX09QUyhkcm1fZmJkZXZfZG1hLAotCQkJCSAgIGRybV9mYl9oZWxwZXJf
ZGFtYWdlX3JhbmdlLAotCQkJCSAgIGRybV9mYl9oZWxwZXJfZGFtYWdlX2FyZWEpOwotCiBz
dGF0aWMgaW50IGRybV9mYmRldl9kbWFfZmJfbW1hcChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7CiAJc3RydWN0IGRybV9mYl9oZWxwZXIg
KmZiX2hlbHBlciA9IGluZm8tPnBhcjsKLQlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9
IGZiX2hlbHBlci0+ZmI7Ci0Jc3RydWN0IGRybV9nZW1fZG1hX29iamVjdCAqZG1hID0gZHJt
X2ZiX2RtYV9nZXRfZ2VtX29iaihmYiwgMCk7CiAKLQlpZiAoIWRtYS0+bWFwX25vbmNvaGVy
ZW50KQotCQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1hLT52
bV9wYWdlX3Byb3QpOwotCi0JcmV0dXJuIGZiX2RlZmVycmVkX2lvX21tYXAoaW5mbywgdm1h
KTsKKwlyZXR1cm4gZHJtX2dlbV9wcmltZV9tbWFwKGZiX2hlbHBlci0+YnVmZmVyLT5nZW0s
IHZtYSk7CiB9CiAKIHN0YXRpYyB2b2lkIGRybV9mYmRldl9kbWFfZmJfZGVzdHJveShzdHJ1
Y3QgZmJfaW5mbyAqaW5mbykKQEAgLTcwLDEzICs2MSw0MCBAQCBzdGF0aWMgdm9pZCBkcm1f
ZmJkZXZfZG1hX2ZiX2Rlc3Ryb3koc3RydWN0IGZiX2luZm8gKmluZm8pCiB9CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGRybV9mYmRldl9kbWFfZmJfb3BzID0geworCS5vd25l
ciA9IFRISVNfTU9EVUxFLAorCS5mYl9vcGVuID0gZHJtX2ZiZGV2X2RtYV9mYl9vcGVuLAor
CS5mYl9yZWxlYXNlID0gZHJtX2ZiZGV2X2RtYV9mYl9yZWxlYXNlLAorCV9fRkJfREVGQVVM
VF9ETUFNRU1fT1BTX1JEV1IsCisJRFJNX0ZCX0hFTFBFUl9ERUZBVUxUX09QUywKKwlfX0ZC
X0RFRkFVTFRfRE1BTUVNX09QU19EUkFXLAorCS5mYl9tbWFwID0gZHJtX2ZiZGV2X2RtYV9m
Yl9tbWFwLAorCS5mYl9kZXN0cm95ID0gZHJtX2ZiZGV2X2RtYV9mYl9kZXN0cm95LAorfTsK
KworRkJfR0VOX0RFRkFVTFRfREVGRVJSRURfRE1BTUVNX09QUyhkcm1fZmJkZXZfZG1hLAor
CQkJCSAgIGRybV9mYl9oZWxwZXJfZGFtYWdlX3JhbmdlLAorCQkJCSAgIGRybV9mYl9oZWxw
ZXJfZGFtYWdlX2FyZWEpOworCitzdGF0aWMgaW50IGRybV9mYmRldl9kbWFfZGVmZXJyZWRf
ZmJfbW1hcChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpCit7CisJc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciA9IGluZm8tPnBhcjsK
KwlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IGZiX2hlbHBlci0+ZmI7CisJc3RydWN0
IGRybV9nZW1fZG1hX29iamVjdCAqZG1hID0gZHJtX2ZiX2RtYV9nZXRfZ2VtX29iaihmYiwg
MCk7CisKKwlpZiAoIWRtYS0+bWFwX25vbmNvaGVyZW50KQorCQl2bWEtPnZtX3BhZ2VfcHJv
dCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1hLT52bV9wYWdlX3Byb3QpOworCisJcmV0dXJu
IGZiX2RlZmVycmVkX2lvX21tYXAoaW5mbywgdm1hKTsKK30KKworc3RhdGljIGNvbnN0IHN0
cnVjdCBmYl9vcHMgZHJtX2ZiZGV2X2RtYV9kZWZlcnJlZF9mYl9vcHMgPSB7CiAJLm93bmVy
ID0gVEhJU19NT0RVTEUsCiAJLmZiX29wZW4gPSBkcm1fZmJkZXZfZG1hX2ZiX29wZW4sCiAJ
LmZiX3JlbGVhc2UgPSBkcm1fZmJkZXZfZG1hX2ZiX3JlbGVhc2UsCiAJX19GQl9ERUZBVUxU
X0RFRkVSUkVEX09QU19SRFdSKGRybV9mYmRldl9kbWEpLAogCURSTV9GQl9IRUxQRVJfREVG
QVVMVF9PUFMsCiAJX19GQl9ERUZBVUxUX0RFRkVSUkVEX09QU19EUkFXKGRybV9mYmRldl9k
bWEpLAotCS5mYl9tbWFwID0gZHJtX2ZiZGV2X2RtYV9mYl9tbWFwLAorCS5mYl9tbWFwID0g
ZHJtX2ZiZGV2X2RtYV9kZWZlcnJlZF9mYl9tbWFwLAogCS5mYl9kZXN0cm95ID0gZHJtX2Zi
ZGV2X2RtYV9mYl9kZXN0cm95LAogfTsKIApAQCAtODksNiArMTA3LDcgQEAgc3RhdGljIGlu
dCBkcm1fZmJkZXZfZG1hX2hlbHBlcl9mYl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAq
ZmJfaGVscGVyLAogewogCXN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50ID0gJmZiX2hl
bHBlci0+Y2xpZW50OwogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBmYl9oZWxwZXItPmRl
djsKKwlib29sIHVzZV9kZWZlcnJlZF9pbyA9IGZhbHNlOwogCXN0cnVjdCBkcm1fY2xpZW50
X2J1ZmZlciAqYnVmZmVyOwogCXN0cnVjdCBkcm1fZ2VtX2RtYV9vYmplY3QgKmRtYV9vYmo7
CiAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmI7CkBAIC0xMTEsNiArMTMwLDE1IEBAIHN0
YXRpYyBpbnQgZHJtX2ZiZGV2X2RtYV9oZWxwZXJfZmJfcHJvYmUoc3RydWN0IGRybV9mYl9o
ZWxwZXIgKmZiX2hlbHBlciwKIAogCWZiID0gYnVmZmVyLT5mYjsKIAorCS8qCisJICogRGVm
ZXJyZWQgSS9PIHJlcXVpcmVzIHN0cnVjdCBwYWdlIGZvciBmcmFtZWJ1ZmZlciBtZW1vcnks
CisJICogd2hpY2ggaXMgbm90IGd1YXJhbnRlZWQgZm9yIGFsbCBETUEgcmFuZ2VzLiBXZSB0
aHVzIG9ubHkKKwkgKiBpbnN0YWxsIGRlZmVycmVkIEkvTyBpZiB3ZSBoYXZlIGEgZnJhbWVi
dWZmZXIgdGhhdCByZXF1aXJlcworCSAqIGl0LgorCSAqLworCWlmIChmYi0+ZnVuY3MtPmRp
cnR5KQorCQl1c2VfZGVmZXJyZWRfaW8gPSB0cnVlOworCiAJcmV0ID0gZHJtX2NsaWVudF9i
dWZmZXJfdm1hcChidWZmZXIsICZtYXApOwogCWlmIChyZXQpIHsKIAkJZ290byBlcnJfZHJt
X2NsaWVudF9idWZmZXJfZGVsZXRlOwpAQCAtMTMwLDcgKzE1OCwxMCBAQCBzdGF0aWMgaW50
IGRybV9mYmRldl9kbWFfaGVscGVyX2ZiX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpm
Yl9oZWxwZXIsCiAKIAlkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhpbmZvLCBmYl9oZWxwZXIs
IHNpemVzKTsKIAotCWluZm8tPmZib3BzID0gJmRybV9mYmRldl9kbWFfZmJfb3BzOworCWlm
ICh1c2VfZGVmZXJyZWRfaW8pCisJCWluZm8tPmZib3BzID0gJmRybV9mYmRldl9kbWFfZGVm
ZXJyZWRfZmJfb3BzOworCWVsc2UKKwkJaW5mby0+ZmJvcHMgPSAmZHJtX2ZiZGV2X2RtYV9m
Yl9vcHM7CiAKIAkvKiBzY3JlZW4gKi8KIAlpbmZvLT5mbGFncyB8PSBGQklORk9fVklSVEZC
OyAvKiBzeXN0ZW0gbWVtb3J5ICovCkBAIC0xNDUsMTMgKzE3NiwxNSBAQCBzdGF0aWMgaW50
IGRybV9mYmRldl9kbWFfaGVscGVyX2ZiX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpm
Yl9oZWxwZXIsCiAJaW5mby0+Zml4LnNtZW1fbGVuID0gaW5mby0+c2NyZWVuX3NpemU7CiAK
IAkvKiBkZWZlcnJlZCBJL08gKi8KLQlmYl9oZWxwZXItPmZiZGVmaW8uZGVsYXkgPSBIWiAv
IDIwOwotCWZiX2hlbHBlci0+ZmJkZWZpby5kZWZlcnJlZF9pbyA9IGRybV9mYl9oZWxwZXJf
ZGVmZXJyZWRfaW87Ci0KLQlpbmZvLT5mYmRlZmlvID0gJmZiX2hlbHBlci0+ZmJkZWZpbzsK
LQlyZXQgPSBmYl9kZWZlcnJlZF9pb19pbml0KGluZm8pOwotCWlmIChyZXQpCi0JCWdvdG8g
ZXJyX2RybV9mYl9oZWxwZXJfcmVsZWFzZV9pbmZvOworCWlmICh1c2VfZGVmZXJyZWRfaW8p
IHsKKwkJZmJfaGVscGVyLT5mYmRlZmlvLmRlbGF5ID0gSFogLyAyMDsKKwkJZmJfaGVscGVy
LT5mYmRlZmlvLmRlZmVycmVkX2lvID0gZHJtX2ZiX2hlbHBlcl9kZWZlcnJlZF9pbzsKKwor
CQlpbmZvLT5mYmRlZmlvID0gJmZiX2hlbHBlci0+ZmJkZWZpbzsKKwkJcmV0ID0gZmJfZGVm
ZXJyZWRfaW9faW5pdChpbmZvKTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZXJyX2RybV9mYl9o
ZWxwZXJfcmVsZWFzZV9pbmZvOworCX0KIAogCXJldHVybiAwOwogCi0tIAoyLjQ2LjAKCg==


--------------h6o39sUUpo7A0OGksfrR0pwO--
