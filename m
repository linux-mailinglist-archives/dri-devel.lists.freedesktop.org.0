Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3428F7E3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 19:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2A6ED91;
	Thu, 15 Oct 2020 17:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBAD6ED91
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602784566;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dL/NZ047giKsFZ7DoPgrjeSkRHN9SR/DfJ3uO7/07o8=;
 b=P1/vjSTFQzUjAonG2c+Qhv3S7oMfaHe+s4v40x+MJCM1dy5Z43Urifz/GU/GuRmIe3epum
 7PfhS6NFFaidFgvRPP1WFf6MDZ/jzX1JX0lJ0Rw9Pw/04jl7Yte+1XhSpKBBgxHg5QCUPx
 cDiRsFXqmYIEb3d7tC0JmU0U2DiDDmk=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-WPnLeXCqPp-wiWroL1SrcQ-1; Thu, 15 Oct 2020 13:56:02 -0400
X-MC-Unique: WPnLeXCqPp-wiWroL1SrcQ-1
Received: by mail-il1-f198.google.com with SMTP id p17so2760556ilb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 10:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dL/NZ047giKsFZ7DoPgrjeSkRHN9SR/DfJ3uO7/07o8=;
 b=QkitTt2SJyXirAqIoaik0YapY3F99NFs1fsK000vCtw1iqtGkv3Gx9XAd0CSqRad18
 5Gdqm32o8NGRy+5YcSpC9LSV3OcIgrgnwPf+oy1Vf8Ua3ZImIlAQx5D/v0Nd667u0kbA
 0dIUYOLCaOKFwPTZX3HiO024aW+Dr5kAdYoHzZQ1RotdfhafKkP2y4f9blVcpjSR+3h9
 YTWehwWQag+HP6iavJauU79qLyKtVa9ww5AGptmpADu5ggkcdkcldo4lAEeqpmm3VvkI
 vNCsKCdFuZfaDfaQh8FEc6sLhR/N1hCpOxC4sDzbZgdH8Vu/n8zsINsxjrk5u8xVlbSD
 kWuQ==
X-Gm-Message-State: AOAM532IBbmaGu/P9snNndFDpxY+mz3OLUkvu+4joRwRjGKH+suStefP
 d5/PZtK9u85TLZ8jE1705hJwDNvOeQiLTto3OgvgAy86bHc6ipOWuUNtV/alonsYIkV3bieAiVc
 L0JS5pvDXhsyqTAq8g5nrVHhKPIla
X-Received: by 2002:a92:de0a:: with SMTP id x10mr4273212ilm.13.1602784561742; 
 Thu, 15 Oct 2020 10:56:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyC8pWapulYqOVa1U1iKZ6WdplMetEzp+NlcnL2CuWIvUL2BDWrIQ2J4tKEaUg7Cn9qi+Slg==
X-Received: by 2002:a92:de0a:: with SMTP id x10mr4273118ilm.13.1602784560355; 
 Thu, 15 Oct 2020 10:56:00 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id q196sm3141813iod.17.2020.10.15.10.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 10:55:59 -0700 (PDT)
Message-ID: <3f66e34bacdbc802b16b7cad24d048e4c6e27fd7.camel@redhat.com>
Subject: Re: [PATCH v2] drm/dp check aux_dev before use in
 drm_dp_aux_dev_get_by_minor()
From: Lyude Paul <lyude@redhat.com>
To: zwane@yosper.io, dri-devel@lists.freedesktop.org
Date: Thu, 15 Oct 2020 13:55:58 -0400
In-Reply-To: <alpine.DEB.2.21.2010122231070.38717@montezuma.home>
References: <alpine.DEB.2.21.2010122231070.38717@montezuma.home>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

JFYI - since the commit this fixes has been in the kernel for a while, we should
definitely Cc this to stable@vger.kernel.org so that it gets backported. In the
future, the dim tools have a command called "fixes" that can figure this out for
you:

https://drm.pages.freedesktop.org/maintainer-tools/dim.html

I'll make sure to do that when I push your patch to drm-misc-next today, thanks!

On Mon, 2020-10-12 at 22:59 -0700, zwane@yosper.io wrote:
> I observed this when unplugging a DP monitor whilst a computer is asleep 
> and then waking it up. This left DP chardev nodes still being present on 
> the filesystem and accessing these device nodes caused an oops because 
> drm_dp_aux_dev_get_by_minor() assumes a device exists if it is opened. 
> This can also be reproduced by creating a device node with mknod(1) and 
> issuing an open(2)
> 
> [166164.933198] BUG: kernel NULL pointer dereference, address:
> 0000000000000018
> [166164.933202] #PF: supervisor read access in kernel mode
> [166164.933204] #PF: error_code(0x0000) - not-present page
> [166164.933205] PGD 0 P4D 0 
> [166164.933208] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [166164.933211] CPU: 4 PID: 99071 Comm: fwupd Tainted: G        W         
> 5.8.0-rc6+ #1
> [166164.933213] Hardware name: LENOVO 20RD002VUS/20RD002VUS, BIOS R16ET25W 
> (1.11 ) 04/21/2020
> [166164.933232] RIP: 0010:drm_dp_aux_dev_get_by_minor+0x29/0x70 
> [drm_kms_helper]
> [166164.933234] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 54 41 89 fc 48 c7 
> c7 60 01 a4 c0 e8 26 ab 30 d7 44 89 e6 48 c7 c7 80 01 a4 c0 e8 47 94 d6 d6 
> <8b> 50 18 49 89 c4 48 8d 78 18 85 d2 74 33 8d 4a 01 89 d0 f0 0f b1
> [166164.933236] RSP: 0018:ffffb7d7c41cbbf0 EFLAGS: 00010246
> [166164.933237] RAX: 0000000000000000 RBX: ffff8a90001fe900 RCX:
> 0000000000000000
> [166164.933238] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
> ffffffffc0a40180
> [166164.933239] RBP: ffffb7d7c41cbbf8 R08: 0000000000000000 R09:
> ffff8a93e157d6d0
> [166164.933240] R10: 0000000000000000 R11: ffffffffc0a40188 R12:
> 0000000000000003
> [166164.933241] R13: ffff8a9402200e80 R14: ffff8a90001fe900 R15:
> 0000000000000000
> [166164.933244] FS:  00007f7fb041eb00(0000) GS:ffff8a9411500000(0000) 
> knlGS:0000000000000000
> [166164.933245] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [166164.933246] CR2: 0000000000000018 CR3: 00000000352c2003 CR4:
> 00000000003606e0
> [166164.933247] Call Trace:
> [166164.933264]  auxdev_open+0x1b/0x40 [drm_kms_helper]
> [166164.933278]  chrdev_open+0xa7/0x1c0
> [166164.933282]  ? cdev_put.part.0+0x20/0x20
> [166164.933287]  do_dentry_open+0x161/0x3c0
> [166164.933291]  vfs_open+0x2d/0x30
> [166164.933297]  path_openat+0xb27/0x10e0
> [166164.933306]  ? atime_needs_update+0x73/0xd0
> [166164.933309]  do_filp_open+0x91/0x100
> [166164.933313]  ? __alloc_fd+0xb2/0x150
> [166164.933316]  do_sys_openat2+0x210/0x2d0
> [166164.933318]  do_sys_open+0x46/0x80
> [166164.933320]  __x64_sys_openat+0x20/0x30
> [166164.933328]  do_syscall_64+0x52/0xc0
> [166164.933336]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> 
> (gdb) disassemble drm_dp_aux_dev_get_by_minor+0x29
> Dump of assembler code for function drm_dp_aux_dev_get_by_minor:
>    0x0000000000017b10 <+0>:     callq  0x17b15 <drm_dp_aux_dev_get_by_minor+5>
>    0x0000000000017b15 <+5>:     push   %rbp
>    0x0000000000017b16 <+6>:     mov    %rsp,%rbp
>    0x0000000000017b19 <+9>:     push   %r12
>    0x0000000000017b1b <+11>:    mov    %edi,%r12d
>    0x0000000000017b1e <+14>:    mov    $0x0,%rdi
>    0x0000000000017b25 <+21>:    callq  0x17b2a
> <drm_dp_aux_dev_get_by_minor+26>
>    0x0000000000017b2a <+26>:    mov    %r12d,%esi
>    0x0000000000017b2d <+29>:    mov    $0x0,%rdi
>    0x0000000000017b34 <+36>:    callq  0x17b39
> <drm_dp_aux_dev_get_by_minor+41>
>    0x0000000000017b39 <+41>:    mov    0x18(%rax),%edx <=========
>    0x0000000000017b3c <+44>:    mov    %rax,%r12
>    0x0000000000017b3f <+47>:    lea    0x18(%rax),%rdi
>    0x0000000000017b43 <+51>:    test   %edx,%edx
>    0x0000000000017b45 <+53>:    je     0x17b7a
> <drm_dp_aux_dev_get_by_minor+106>
>    0x0000000000017b47 <+55>:    lea    0x1(%rdx),%ecx
>    0x0000000000017b4a <+58>:    mov    %edx,%eax
>    0x0000000000017b4c <+60>:    lock cmpxchg %ecx,(%rdi)
>    0x0000000000017b50 <+64>:    jne    0x17b76
> <drm_dp_aux_dev_get_by_minor+102>
>    0x0000000000017b52 <+66>:    test   %edx,%edx
>    0x0000000000017b54 <+68>:    js     0x17b6d
> <drm_dp_aux_dev_get_by_minor+93>
>    0x0000000000017b56 <+70>:    test   %ecx,%ecx
>    0x0000000000017b58 <+72>:    js     0x17b6d
> <drm_dp_aux_dev_get_by_minor+93>
>    0x0000000000017b5a <+74>:    mov    $0x0,%rdi
>    0x0000000000017b61 <+81>:    callq  0x17b66
> <drm_dp_aux_dev_get_by_minor+86>
>    0x0000000000017b66 <+86>:    mov    %r12,%rax
>    0x0000000000017b69 <+89>:    pop    %r12
>    0x0000000000017b6b <+91>:    pop    %rbp
>    0x0000000000017b6c <+92>:    retq   
>    0x0000000000017b6d <+93>:    xor    %esi,%esi
>    0x0000000000017b6f <+95>:    callq  0x17b74
> <drm_dp_aux_dev_get_by_minor+100>
>    0x0000000000017b74 <+100>:   jmp    0x17b5a
> <drm_dp_aux_dev_get_by_minor+74>
>    0x0000000000017b76 <+102>:   mov    %eax,%edx
>    0x0000000000017b78 <+104>:   jmp    0x17b43
> <drm_dp_aux_dev_get_by_minor+51>
>    0x0000000000017b7a <+106>:   xor    %r12d,%r12d
>    0x0000000000017b7d <+109>:   jmp    0x17b5a
> <drm_dp_aux_dev_get_by_minor+74>
> End of assembler dump.
> 
> (gdb) list *drm_dp_aux_dev_get_by_minor+0x29
> 0x17b39 is in drm_dp_aux_dev_get_by_minor
> (drivers/gpu/drm/drm_dp_aux_dev.c:65).
> 60      static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned
> index)
> 61      {
> 62              struct drm_dp_aux_dev *aux_dev = NULL;
> 63
> 64              mutex_lock(&aux_idr_mutex);
> 65              aux_dev = idr_find(&aux_idr, index);
> 66              if (!kref_get_unless_zero(&aux_dev->refcount))
> 67                      aux_dev = NULL;
> 68              mutex_unlock(&aux_idr_mutex);
> 69
> (gdb) p/x &((struct drm_dp_aux_dev *)(0x0))->refcount
> $8 = 0x18
> 
> Looking at the caller, checks on the minor are pushed down to 
> drm_dp_aux_dev_get_by_minor()
> 
> static int auxdev_open(struct inode *inode, struct file *file)
> {
>     unsigned int minor = iminor(inode);
>     struct drm_dp_aux_dev *aux_dev;
> 
>     aux_dev = drm_dp_aux_dev_get_by_minor(minor); <====
>     if (!aux_dev)
>         return -ENODEV;
> 
>     file->private_data = aux_dev;
>     return 0;
> }
> 
> 
> Fixes: e94cb37b34eb8 ("Add a drm_aux-dev module for reading/writing dpcd
> registers")
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
> ---
> v2 patch re-generated from drm-next branch
> 0d2e90f47c4f80a5dcf10f5fe57b5e692e62b48f
> 
> diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c
> b/drivers/gpu/drm/drm_dp_aux_dev.c
> index 2510717d5a08..e25181bf2c48 100644
> --- a/drivers/gpu/drm/drm_dp_aux_dev.c
> +++ b/drivers/gpu/drm/drm_dp_aux_dev.c
> @@ -63,7 +63,7 @@ static struct drm_dp_aux_dev
> *drm_dp_aux_dev_get_by_minor(unsigned index)
>  
>  	mutex_lock(&aux_idr_mutex);
>  	aux_dev = idr_find(&aux_idr, index);
> -	if (!kref_get_unless_zero(&aux_dev->refcount))
> +	if (aux_dev && !kref_get_unless_zero(&aux_dev->refcount))
>  		aux_dev = NULL;
>  	mutex_unlock(&aux_idr_mutex);
>  
> 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
