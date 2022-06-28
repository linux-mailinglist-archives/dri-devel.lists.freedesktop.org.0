Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEE55BD58
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC11410EFCC;
	Tue, 28 Jun 2022 02:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD4910F012;
 Tue, 28 Jun 2022 02:21:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11460617BC;
 Tue, 28 Jun 2022 02:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3298C341CB;
 Tue, 28 Jun 2022 02:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382894;
 bh=pqPD6qoEi8JT199in7jg5DAol4iF8DjKFPgIGYlvQoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GyqsByaDXQg5yOq6smuSw5cw5zuxTHl+rHrYo/OlHMZ1OuAvd9ONI8/jqrzLdImbD
 VTWK7UP5itlkHBzyKuMpIHQb6qIkgBzcX3Jxv+GaaOi42Ij7zVfd0aNVRCj/2kEQLZ
 O6R0SdzzjedD8BThjNur1AhOSXcjIOf8wUfiJdziqd597shekW5NqBhdePKYvvXsYS
 oJiSFkiCFnaZl7loW+605mJuFv8NTwWJO3O6z94S5MRsftmK5FPbSEThNMZ5b+uoVL
 ifMihZ1oD6Ug5EuhwczB9HuCayJu7LpnnMklqlMLvNn/Nf3BKVwwKkKVP3/5TDDlCW
 d3gJG/ZMvv/2g==
Date: Tue, 28 Jun 2022 04:21:29 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220628022129.GA8452@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
 <20220628005825.GA161566@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628005825.GA161566@embeddedor>
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 x86@kernel.org, kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, v9fs-developer@lists.sourceforge.net,
 Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, virtualization@lists.linux-foundation.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 02:58:25AM +0200, Gustavo A. R. Silva wrote:
> On Mon, Jun 27, 2022 at 09:40:52PM -0300, Jason Gunthorpe wrote:
> > On Mon, Jun 27, 2022 at 08:27:37PM +0200, Daniel Borkmann wrote:
> > > On 6/27/22 8:04 PM, Gustavo A. R. Silva wrote:
> > > > There is a regular need in the kernel to provide a way to declare
> > > > having a dynamically sized set of trailing elements in a structure.
> > > > Kernel code should always use “flexible array members”[1] for these
> > > > cases. The older style of one-element or zero-length arrays should
> > > > no longer be used[2].
> > > > 
> > > > This code was transformed with the help of Coccinelle:
> > > > (linux-5.19-rc2$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> > > > 
> > > > @@
> > > > identifier S, member, array;
> > > > type T1, T2;
> > > > @@
> > > > 
> > > > struct S {
> > > >    ...
> > > >    T1 member;
> > > >    T2 array[
> > > > - 0
> > > >    ];
> > > > };
> > > > 
> > > > -fstrict-flex-arrays=3 is coming and we need to land these changes
> > > > to prevent issues like these in the short future:
> > > > 
> > > > ../fs/minix/dir.c:337:3: warning: 'strcpy' will always overflow; destination buffer has size 0,
> > > > but the source string has length 2 (including NUL byte) [-Wfortify-source]
> > > > 		strcpy(de3->name, ".");
> > > > 		^
> > > > 
> > > > Since these are all [0] to [] changes, the risk to UAPI is nearly zero. If
> > > > this breaks anything, we can use a union with a new member name.
> > > > 
> > > > [1] https://en.wikipedia.org/wiki/Flexible_array_member
> > > > [2] https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-length-and-one-element-arrays
> > > > 
> > > > Link: https://github.com/KSPP/linux/issues/78
> > > > Build-tested-by: https://lore.kernel.org/lkml/62b675ec.wKX6AOZ6cbE71vtF%25lkp@intel.com/
> > > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > > > ---
> > > > Hi all!
> > > > 
> > > > JFYI: I'm adding this to my -next tree. :)
> > > 
> > > Fyi, this breaks BPF CI:
> > > 
> > > https://github.com/kernel-patches/bpf/runs/7078719372?check_suite_focus=true
> > > 
> > >   [...]
> > >   progs/map_ptr_kern.c:314:26: error: field 'trie_key' with variable sized type 'struct bpf_lpm_trie_key' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> > >           struct bpf_lpm_trie_key trie_key;
> > >                                   ^
> > 
> > This will break the rdma-core userspace as well, with a similar
> > error:
> > 
> > /usr/bin/clang-13 -DVERBS_DEBUG -Dibverbs_EXPORTS -Iinclude -I/usr/include/libnl3 -I/usr/include/drm -g -O2 -fdebug-prefix-map=/__w/1/s=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -Wmissing-prototypes -Wmissing-declarations -Wwrite-strings -Wformat=2 -Wcast-function-type -Wformat-nonliteral -Wdate-time -Wnested-externs -Wshadow -Wstrict-prototypes -Wold-style-definition -Werror -Wredundant-decls -g -fPIC   -std=gnu11 -MD -MT libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o -MF libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o.d -o libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o   -c ../libibverbs/cmd_flow.c
> > In file included from ../libibverbs/cmd_flow.c:33:
> > In file included from include/infiniband/cmd_write.h:36:
> > In file included from include/infiniband/cmd_ioctl.h:41:
> > In file included from include/infiniband/verbs.h:48:
> > In file included from include/infiniband/verbs_api.h:66:
> > In file included from include/infiniband/ib_user_ioctl_verbs.h:38:
> > include/rdma/ib_user_verbs.h:436:34: error: field 'base' with variable sized type 'struct ib_uverbs_create_cq_resp' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >         struct ib_uverbs_create_cq_resp base;
> >                                         ^
> > include/rdma/ib_user_verbs.h:644:34: error: field 'base' with variable sized type 'struct ib_uverbs_create_qp_resp' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >         struct ib_uverbs_create_qp_resp base;
> > 
> > Which is why I gave up trying to change these..
> > 
> > Though maybe we could just switch off -Wgnu-variable-sized-type-not-at-end  during configuration ?
> 
> No. I think now we can easily workaround these sorts of problems with
> something like this:
> 
> 	struct flex {
> 		any_type any_member;
> 		union {
> 			type array[0];
> 			__DECLARE_FLEX_ARRAY(type, array_flex);
> 		};
> 	};

Mmmh... nope; this doesn't work[1].

We need to think in a different strategy.

--
Gustavo

[1] https://godbolt.org/z/av79Pqbfz
