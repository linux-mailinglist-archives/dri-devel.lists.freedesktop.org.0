Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B96F955BBA1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 20:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C371136BB;
	Mon, 27 Jun 2022 18:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397521136BB;
 Mon, 27 Jun 2022 18:35:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EA6C61578;
 Mon, 27 Jun 2022 18:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D52C3411D;
 Mon, 27 Jun 2022 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656354918;
 bh=lSduwLf0URPGJXhzE2uMPDSka0BN2NuObX6s6wiVjLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1wgnhWIBSxTWZs7oVLQcgu6ow7j/nvOHPvXzsT1Nn9X7hdwGhqh7NAL8uHaamcIf
 IY07sAxOhUQqndCnsaxA3ScC1kTdg2Yn9hsnKIlxq8rxFKlV7RaY+NRmyVh3m75Tb8
 ZpcqX4hfVCDBy0N1EVQnXiwwX9rIvnnkMDcCS04gZPnAV3H3k5TZVX9FzOMlpLx209
 8O1zovzb/AU8MtbMYOdG7MyCPnmJKw+tFasJC0wEQpVPIKC5aCfVMO84EEc2E/4TTl
 9dxSDJTazopgz1hOdfhMFc0UNVAF149+GJwdJJ2/y5zxk6J7RR9WnMOk8pk02PIKf/
 G0d/RZr8PVXzA==
Date: Mon, 27 Jun 2022 20:35:13 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220627183513.GA137875@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
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
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 v9fs-developer@lists.sourceforge.net, Kees Cook <keescook@chromium.org>,
 intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-sctp@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 08:27:37PM +0200, Daniel Borkmann wrote:
> On 6/27/22 8:04 PM, Gustavo A. R. Silva wrote:
> > There is a regular need in the kernel to provide a way to declare
> > having a dynamically sized set of trailing elements in a structure.
> > Kernel code should always use “flexible array members”[1] for these
> > cases. The older style of one-element or zero-length arrays should
> > no longer be used[2].
> > 
> > This code was transformed with the help of Coccinelle:
> > (linux-5.19-rc2$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> > 
> > @@
> > identifier S, member, array;
> > type T1, T2;
> > @@
> > 
> > struct S {
> >    ...
> >    T1 member;
> >    T2 array[
> > - 0
> >    ];
> > };
> > 
> > -fstrict-flex-arrays=3 is coming and we need to land these changes
> > to prevent issues like these in the short future:
> > 
> > ../fs/minix/dir.c:337:3: warning: 'strcpy' will always overflow; destination buffer has size 0,
> > but the source string has length 2 (including NUL byte) [-Wfortify-source]
> > 		strcpy(de3->name, ".");
> > 		^
> > 
> > Since these are all [0] to [] changes, the risk to UAPI is nearly zero. If
> > this breaks anything, we can use a union with a new member name.
> > 
> > [1] https://en.wikipedia.org/wiki/Flexible_array_member
> > [2] https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-length-and-one-element-arrays
> > 
> > Link: https://github.com/KSPP/linux/issues/78
> > Build-tested-by: https://lore.kernel.org/lkml/62b675ec.wKX6AOZ6cbE71vtF%25lkp@intel.com/
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> > Hi all!
> > 
> > JFYI: I'm adding this to my -next tree. :)
> 
> Fyi, this breaks BPF CI:

Thanks for the report! It seems the 0-day robot didn't catch that one.
I'll fix it up right away. :)

--
Gustavo

> 
> https://github.com/kernel-patches/bpf/runs/7078719372?check_suite_focus=true
> 
>   [...]
>   progs/map_ptr_kern.c:314:26: error: field 'trie_key' with variable sized type 'struct bpf_lpm_trie_key' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>           struct bpf_lpm_trie_key trie_key;
>                                   ^
>   1 error generated.
>   make: *** [Makefile:519: /tmp/runner/work/bpf/bpf/tools/testing/selftests/bpf/map_ptr_kern.o] Error 1
>   make: *** Waiting for unfinished jobs....
>   Error: Process completed with exit code 2.
