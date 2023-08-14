Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0F77B9EC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E3210E1EC;
	Mon, 14 Aug 2023 13:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7698E10E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692019536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10SRC4uX0ISoj6AdkcIedKFDRL9k0UplGf75TwL4RrM=;
 b=iXDbyKl6hzy0Zif4c51dQyiDHuTmLMLdra43+o/VY7LSDsqUfXh0XDcuNCQX/xB+nzFebx
 4kdfDhu4AkQFapgHVrOAE5O3zvQr7hOarS+PoOZyO1e6cpvNPH4xqaU1D62Cnz9/fG/Ywm
 MLF37V7BNl/a9M5MXZr1cdkFWj/X+8k=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-LhBXsMffN5K0woOWIzxoyw-1; Mon, 14 Aug 2023 09:25:35 -0400
X-MC-Unique: LhBXsMffN5K0woOWIzxoyw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so7654611fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 06:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019534; x=1692624334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10SRC4uX0ISoj6AdkcIedKFDRL9k0UplGf75TwL4RrM=;
 b=UgUmyttksJQpW/irVyhhlKh+VL/7/ZSW59Sl5+rbe7uMHF+rXJ0jeti0XOP4ek+H7c
 DmsY8jCQtcO5tmAeX04Zjwc4qRyaiKUKTTGTET5SDs0YT5x4A39/GZvTZ2SLVOcEn/nC
 Q4s+B+uqWz0gJgYSL21O8+kW5phuRGXLwTIzPk46nGIndEAh5uIwEU5F8E1/Qcu5a+aA
 0RtDFttXF5VYTcTcP8Q0ZXHmfQFO6gXVlykCYP2v+7oZJjV2geSPqKppLtxK8uCHqXiG
 P71yFHmzHirslmnO4mdaLSNUQXiGis47fmByc3tV92gwrNcJG+4ZT0oBsOdpYn7a2zj1
 OB3g==
X-Gm-Message-State: AOJu0Yz6Vp238m0j0Okv04ulCMoPwaSATr4uJgCUpH+LM9h/VLYWhQl8
 AydbjRodhq1420ThPuDVVRhdGpGjgAXeb+oADR9iqjJHbFNF9mbPwao94WRnbYTYf6aIV0bFyLX
 slcsF77p/OnYqbW87L6BtPACRWmItESwbDHiMXpf0v5ki
X-Received: by 2002:a05:651c:b06:b0:2b6:9969:d0ab with SMTP id
 b6-20020a05651c0b0600b002b69969d0abmr7920311ljr.4.1692019533881; 
 Mon, 14 Aug 2023 06:25:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKAosj9NxSpTKC+Hzc2R7+uuai3jnp29FYvF7ytzQT62f3hLAVetdn9h6S4MY14oETdMQO1pwrNZvFhX+G+2s=
X-Received: by 2002:a05:651c:b06:b0:2b6:9969:d0ab with SMTP id
 b6-20020a05651c0b0600b002b69969d0abmr7920294ljr.4.1692019533512; Mon, 14 Aug
 2023 06:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
 <20230808134726.GBZNJHbovV87w/5t/d@fat_crate.local>
In-Reply-To: <20230808134726.GBZNJHbovV87w/5t/d@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 14 Aug 2023 15:25:21 +0200
Message-ID: <CACO55tufM8msjqyjoTaSxgcEwF_uxf2KJfj=DQ90SU-M1EHcXg@mail.gmail.com>
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 8, 2023 at 3:47=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Tue, Aug 08, 2023 at 12:39:32PM +0200, Karol Herbst wrote:
> > ahh, that would have been good to know :)
>
> Yeah, I didn't see it before - it would only freeze. Only after I added
> the printk you requested.
>
> > Mind figuring out what's exactly NULL inside nvif_object_mthd? Or
> > rather what line `nvif_object_mthd+0x136` belongs to, then it should
> > be easy to figure out what's wrong here.
>
> That looks like this:
>
> ffffffff816ddfee:       e8 8d 04 4e 00          callq  ffffffff81bbe480 <=
__memcpy>
> ffffffff816ddff3:       41 8d 56 20             lea    0x20(%r14),%edx
> ffffffff816ddff7:       49 8b 44 24 08          mov    0x8(%r12),%rax
> ffffffff816ddffc:       83 fa 17                cmp    $0x17,%edx
> ffffffff816ddfff:       76 7d                   jbe    ffffffff816de07e <=
nvif_object_mthd+0x1ae>
> ffffffff816de001:       49 39 c4                cmp    %rax,%r12
> ffffffff816de004:       74 45                   je     ffffffff816de04b <=
nvif_object_mthd+0x17b>
>
> <--- RIP points here.
>
> The 0x20 also fits the deref address: 0000000000000020.
>
> Which means %rax is 0. Yap.
>
> ffffffff816de006:       48 8b 78 20             mov    0x20(%rax),%rdi
> ffffffff816de00a:       4c 89 64 24 10          mov    %r12,0x10(%rsp)
> ffffffff816de00f:       48 8b 40 38             mov    0x38(%rax),%rax
> ffffffff816de013:       c6 44 24 06 ff          movb   $0xff,0x6(%rsp)
> ffffffff816de018:       31 c9                   xor    %ecx,%ecx
> ffffffff816de01a:       48 89 e6                mov    %rsp,%rsi
> ffffffff816de01d:       48 8b 40 28             mov    0x28(%rax),%rax
> ffffffff816de021:       e8 3a 0c 4f 00          callq  ffffffff81bcec60 <=
__x86_indirect_thunk_array>
>
>
> Now, the preprocessed asm version of nvif/object.c says around here:
>
>
>         call    memcpy  #
> # drivers/gpu/drm/nouveau/nvif/object.c:160:    ret =3D nvif_object_ioctl=
(object, args, sizeof(*args) + size, NULL);
>         leal    32(%r14), %edx  #, _108
> # drivers/gpu/drm/nouveau/nvif/object.c:33:     struct nvif_client *clien=
t =3D object->client;
>         movq    8(%r12), %rax   # object_19(D)->client, client
> # drivers/gpu/drm/nouveau/nvif/object.c:38:     if (size >=3D sizeof(*arg=
s) && args->v0.version =3D=3D 0) {
>         cmpl    $23, %edx       #, _108
>         jbe     .L69    #,
> # drivers/gpu/drm/nouveau/nvif/object.c:39:             if (object !=3D &=
client->object)
>         cmpq    %rax, %r12      # client, object
>         je      .L70    #,
> # drivers/gpu/drm/nouveau/nvif/object.c:47:     return client->driver->io=
ctl(client->object.priv, data, size, hack);
>         movq    32(%rax), %rdi  # client_109->object.priv, client_109->ob=
ject.priv
>
>
> So I'd say that client is NULL. IINM.
>
>
>         movq    %r12, 16(%rsp)  # object, MEM[(union  *)&stack].v0.object
> # drivers/gpu/drm/nouveau/nvif/object.c:47:     return client->driver->io=
ctl(client->object.priv, data, size, hack);
>         movq    56(%rax), %rax  # client_109->driver, client_109->driver
> # drivers/gpu/drm/nouveau/nvif/object.c:43:             args->v0.owner =
=3D NVIF_IOCTL_V0_OWNER_ANY;
>         movb    $-1, 6(%rsp)    #, MEM[(union  *)&stack].v0.owner
> .L64:
> # drivers/gpu/drm/nouveau/nvif/object.c:47:     return client->driver->io=
ctl(client->object.priv, data, size, hack);
>         xorl    %ecx, %ecx      #
>         movq    %rsp, %rsi      #,
>         movq    40(%rax), %rax  #, _77->ioctl
>         call    __x86_indirect_thunk_rax
> # drivers/gpu/drm/nouveau/nvif/object.c:161:    memcpy(data, args->mthd.d=
ata, size);
>
> > > [    4.144676] #PF: supervisor read access in kernel mode
> > > [    4.144676] #PF: error_code(0x0000) - not-present page
> > > [    4.144676] PGD 0 P4D 0
> > > [    4.144676] Oops: 0000 [#1] PREEMPT SMP PTI
> > > [    4.144676] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc5-di=
rty #1
> > > [    4.144676] Hardware name: Dell Inc. Precision T3600/0PTTT9, BIOS =
A13 05/11/2014
> > > [    4.144676] RIP: 0010:nvif_object_mthd+0x136/0x1e0
> > > [    4.144676] Code: f2 4c 89 ee 48 8d 7c 24 20 66 89 04 24 c6 44 24 =
18 00 e8 8d 04 4e 00 41 8d 56 20 49 8b 44 24 08 83 fa 17 76 7d 49 39 c4 74 =
45 <48> 8b 78 20 4c 89 64 24 10 48 8b 40 38 c6 44 24 06 ff 31 c9 48 89
>
> Opcode bytes around RIP look correct too:
>
> ./scripts/decodecode < /tmp/oops
> [ 4.144676] Code: f2 4c 89 ee 48 8d 7c 24 20 66 89 04 24 c6 44 24 18 00 e=
8 8d 04 4e 00 41 8d 56 20 49 8b 44 24 08 83 fa 17 76 7d 49 39 c4 74 45 <48>=
 8b 78 20 4c 89 64 24 10 48 8b 40 38 c6 44 24 06 ff 31 c9 48 89
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   f2 4c 89 ee             repnz mov %r13,%rsi
>    4:   48 8d 7c 24 20          lea    0x20(%rsp),%rdi
>    9:   66 89 04 24             mov    %ax,(%rsp)
>    d:   c6 44 24 18 00          movb   $0x0,0x18(%rsp)
>   12:   e8 8d 04 4e 00          callq  0x4e04a4
>   17:   41 8d 56 20             lea    0x20(%r14),%edx
>   1b:   49 8b 44 24 08          mov    0x8(%r12),%rax
>   20:   83 fa 17                cmp    $0x17,%edx
>   23:   76 7d                   jbe    0xa2
>   25:   49 39 c4                cmp    %rax,%r12
>   28:   74 45                   je     0x6f
>   2a:*  48 8b 78 20             mov    0x20(%rax),%rdi          <-- trapp=
ing instruction
>   2e:   4c 89 64 24 10          mov    %r12,0x10(%rsp)
>   33:   48 8b 40 38             mov    0x38(%rax),%rax
>   37:   c6 44 24 06 ff          movb   $0xff,0x6(%rsp)
>   3c:   31 c9                   xor    %ecx,%ecx
>   3e:   48                      rex.W
>   3f:   89                      .byte 0x89
>

mind compiling your kernel with KASAN and see if you hit the same
error as reported on this thread?

>
> HTH.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

