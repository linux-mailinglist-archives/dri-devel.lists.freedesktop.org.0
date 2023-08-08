Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23758773A90
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 15:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DB210E3E3;
	Tue,  8 Aug 2023 13:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9326C10E098;
 Tue,  8 Aug 2023 13:47:47 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1B47940E01A0; 
 Tue,  8 Aug 2023 13:47:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SCgo-ykV10ou; Tue,  8 Aug 2023 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1691502461; bh=lRDxW5/CLjXom3lTf/cLHkx3v/Wb2nUur8TRjHNGba0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DfDKntE/CJsfBKI9yO49raeXHw4VbhvBhDnuSBG17IDEo5OOIqxMxZ7WX8uRWxDQf
 44H64WHLrus/EiRz1i4pr8oBf9F/sCsENagO6W0YAhk1vbOrxAfGofakkTd7SeBR9A
 WYh2qL5YJ9Pi8lI9qQPtsmBYXtUfXgsKhmQ9N0C8//+sIBN/Tr6NiqBjpv33BnogKs
 zj5B6EPlkpmE01UFq8rM73M+QNuyFuU0DWpvGLbRqUmMh5chKuDAmQOJ6IzU+vE8FG
 Y+i/ZXNjHBplUN0I6YO5SYfU0p5l6++U7n8LKyZIncUrW5TB6GNRIjrBFamr7aZQ4V
 Dn25NNDk9IfwHIiNBywX+oW4BixNhwHcDUp69sgCn8WzWiwhNDFjCjPSvEJSuOFfuQ
 7pii6aLfv8eIGIrjca8KtDhbPKBmVrgVrTzA844qjfgRtuAgObXsZP0Bi/TxYBOTx6
 jZzU4uiaK9kNZh0/Cir1gLJPyBVEDcgf0OO6h+UmTTJlPL5BJi8oQvgNiFqT9OCQ3S
 c0iKe77F48+vsEty23id17LFQOrmn/1SKv+VisB9wbwplYzQryp2MyTHFJhKjGcB2x
 IBUFnddOQk13hOF+9VZbfmvS8hAwAA8DO3s1rUI94FzOzZ3o5gePRStXPMXgTxBnWV
 2MesaIWMYqGggIVIY5dEx+SA=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AA91A40E0195;
 Tue,  8 Aug 2023 13:47:32 +0000 (UTC)
Date: Tue, 8 Aug 2023 15:47:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
Message-ID: <20230808134726.GBZNJHbovV87w/5t/d@fat_crate.local>
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
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

On Tue, Aug 08, 2023 at 12:39:32PM +0200, Karol Herbst wrote:
> ahh, that would have been good to know :)

Yeah, I didn't see it before - it would only freeze. Only after I added
the printk you requested.

> Mind figuring out what's exactly NULL inside nvif_object_mthd? Or
> rather what line `nvif_object_mthd+0x136` belongs to, then it should
> be easy to figure out what's wrong here.

That looks like this:

ffffffff816ddfee:       e8 8d 04 4e 00          callq  ffffffff81bbe480 <__memcpy>
ffffffff816ddff3:       41 8d 56 20             lea    0x20(%r14),%edx
ffffffff816ddff7:       49 8b 44 24 08          mov    0x8(%r12),%rax
ffffffff816ddffc:       83 fa 17                cmp    $0x17,%edx
ffffffff816ddfff:       76 7d                   jbe    ffffffff816de07e <nvif_object_mthd+0x1ae>
ffffffff816de001:       49 39 c4                cmp    %rax,%r12
ffffffff816de004:       74 45                   je     ffffffff816de04b <nvif_object_mthd+0x17b>

<--- RIP points here.

The 0x20 also fits the deref address: 0000000000000020.

Which means %rax is 0. Yap.

ffffffff816de006:       48 8b 78 20             mov    0x20(%rax),%rdi
ffffffff816de00a:       4c 89 64 24 10          mov    %r12,0x10(%rsp)
ffffffff816de00f:       48 8b 40 38             mov    0x38(%rax),%rax
ffffffff816de013:       c6 44 24 06 ff          movb   $0xff,0x6(%rsp)
ffffffff816de018:       31 c9                   xor    %ecx,%ecx
ffffffff816de01a:       48 89 e6                mov    %rsp,%rsi
ffffffff816de01d:       48 8b 40 28             mov    0x28(%rax),%rax
ffffffff816de021:       e8 3a 0c 4f 00          callq  ffffffff81bcec60 <__x86_indirect_thunk_array>


Now, the preprocessed asm version of nvif/object.c says around here:


	call	memcpy	#
# drivers/gpu/drm/nouveau/nvif/object.c:160: 	ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
	leal	32(%r14), %edx	#, _108
# drivers/gpu/drm/nouveau/nvif/object.c:33: 	struct nvif_client *client = object->client;
	movq	8(%r12), %rax	# object_19(D)->client, client
# drivers/gpu/drm/nouveau/nvif/object.c:38: 	if (size >= sizeof(*args) && args->v0.version == 0) {
	cmpl	$23, %edx	#, _108
	jbe	.L69	#,
# drivers/gpu/drm/nouveau/nvif/object.c:39: 		if (object != &client->object)
	cmpq	%rax, %r12	# client, object
	je	.L70	#,
# drivers/gpu/drm/nouveau/nvif/object.c:47: 	return client->driver->ioctl(client->object.priv, data, size, hack);
	movq	32(%rax), %rdi	# client_109->object.priv, client_109->object.priv


So I'd say that client is NULL. IINM.


	movq	%r12, 16(%rsp)	# object, MEM[(union  *)&stack].v0.object
# drivers/gpu/drm/nouveau/nvif/object.c:47: 	return client->driver->ioctl(client->object.priv, data, size, hack);
	movq	56(%rax), %rax	# client_109->driver, client_109->driver
# drivers/gpu/drm/nouveau/nvif/object.c:43: 		args->v0.owner = NVIF_IOCTL_V0_OWNER_ANY;
	movb	$-1, 6(%rsp)	#, MEM[(union  *)&stack].v0.owner
.L64:
# drivers/gpu/drm/nouveau/nvif/object.c:47: 	return client->driver->ioctl(client->object.priv, data, size, hack);
	xorl	%ecx, %ecx	#
	movq	%rsp, %rsi	#,
	movq	40(%rax), %rax	#, _77->ioctl
	call	__x86_indirect_thunk_rax
# drivers/gpu/drm/nouveau/nvif/object.c:161: 	memcpy(data, args->mthd.data, size);

> > [    4.144676] #PF: supervisor read access in kernel mode
> > [    4.144676] #PF: error_code(0x0000) - not-present page
> > [    4.144676] PGD 0 P4D 0
> > [    4.144676] Oops: 0000 [#1] PREEMPT SMP PTI
> > [    4.144676] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc5-dirty #1
> > [    4.144676] Hardware name: Dell Inc. Precision T3600/0PTTT9, BIOS A13 05/11/2014
> > [    4.144676] RIP: 0010:nvif_object_mthd+0x136/0x1e0
> > [    4.144676] Code: f2 4c 89 ee 48 8d 7c 24 20 66 89 04 24 c6 44 24 18 00 e8 8d 04 4e 00 41 8d 56 20 49 8b 44 24 08 83 fa 17 76 7d 49 39 c4 74 45 <48> 8b 78 20 4c 89 64 24 10 48 8b 40 38 c6 44 24 06 ff 31 c9 48 89

Opcode bytes around RIP look correct too:

./scripts/decodecode < /tmp/oops
[ 4.144676] Code: f2 4c 89 ee 48 8d 7c 24 20 66 89 04 24 c6 44 24 18 00 e8 8d 04 4e 00 41 8d 56 20 49 8b 44 24 08 83 fa 17 76 7d 49 39 c4 74 45 <48> 8b 78 20 4c 89 64 24 10 48 8b 40 38 c6 44 24 06 ff 31 c9 48 89
All code
========
   0:   f2 4c 89 ee             repnz mov %r13,%rsi
   4:   48 8d 7c 24 20          lea    0x20(%rsp),%rdi
   9:   66 89 04 24             mov    %ax,(%rsp)
   d:   c6 44 24 18 00          movb   $0x0,0x18(%rsp)
  12:   e8 8d 04 4e 00          callq  0x4e04a4
  17:   41 8d 56 20             lea    0x20(%r14),%edx
  1b:   49 8b 44 24 08          mov    0x8(%r12),%rax
  20:   83 fa 17                cmp    $0x17,%edx
  23:   76 7d                   jbe    0xa2
  25:   49 39 c4                cmp    %rax,%r12
  28:   74 45                   je     0x6f
  2a:*  48 8b 78 20             mov    0x20(%rax),%rdi          <-- trapping instruction
  2e:   4c 89 64 24 10          mov    %r12,0x10(%rsp)
  33:   48 8b 40 38             mov    0x38(%rax),%rax
  37:   c6 44 24 06 ff          movb   $0xff,0x6(%rsp)
  3c:   31 c9                   xor    %ecx,%ecx
  3e:   48                      rex.W
  3f:   89                      .byte 0x89


HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
