Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511F14CB912
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411A110EF3A;
	Thu,  3 Mar 2022 08:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283E110F30A;
 Wed,  2 Mar 2022 09:31:31 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id p8so1397304pfh.8;
 Wed, 02 Mar 2022 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yRnvPGVK9XQdKYPg/H0ecgdZJeSxpiKw/X1pv37GC+w=;
 b=FSwFYVuD0cAwR74FpWh/UVnJlZEuhHuzmEJF2CmWuTU5VQk08y1iQ6Cm+4Kk/IHZ7f
 ykn4dSn+LtVJ/QNPcAOF0Kr9OP0uyQbpGUjZhyE2BsGEuIYzlTgMZwHl/BYpjMpkMG0+
 P9mnuSE0YONb1xqLwPVeO/elgzKWhvv7I7OGEBThyQYghI00EIr5RS9MGp7GsCYrqLUi
 wR7dcG4fdae3Ke7WyU9tBlNyUPSMcC8RmnmBsmKYAmxRcsIUhLqhpYW4uCJTlnf3AogC
 YxEVbABh4/fwCz1Lhf2xi5Cnii6w5cwNjqEkAadiEwyP0C/cLXPnnAaLLll6ns+CdAHq
 Ceuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yRnvPGVK9XQdKYPg/H0ecgdZJeSxpiKw/X1pv37GC+w=;
 b=AVn/+dEhaFp5DeCDbTgrvMHGGvighq1Z1GogIu1oG/RCpCHIMy1XeChOlDHTBicerw
 UDj7iJbyvWjgcQnqsdcPERpQIeYgmNJ+vH5R/pMmBcNiAmJ3aV6zXWHXDXMU6VySksEv
 JiSUGweBL2vwxbLaOnFA14dpAbkty5venJdMjhhYYPR6jtL8/BX2b2Ry97Na0rBnoGM3
 jtcbxjEgi9jAMi3aFm7jZz1c+M+Y2Z/1UnrJiXBfkrRb5jwkgX5xwGp8VmSak8FEHHiG
 XCrRaGocxCsS6Fm9D17SKZcNJ+NbkzkYWmX7QVTklnBxjWAWqE1Wq8YYcc3txekUBXY9
 di+A==
X-Gm-Message-State: AOAM533K8NAd3vxBl7hDUJeypX6fcVP+yNUxYdvtdbZXdLoH5e6XOUx2
 YRJotdM1A0Voqj5/Ew876TU=
X-Google-Smtp-Source: ABdhPJxxYDNcbSMxl56+YduSTiv9ULKN3/PKEO9PEtlxvCfSyuhc7esxotc8paaSBF6ReGk5V/MJxQ==
X-Received: by 2002:a05:6a00:244b:b0:4c9:319e:ecb7 with SMTP id
 d11-20020a056a00244b00b004c9319eecb7mr31990006pfj.58.1646213490674; 
 Wed, 02 Mar 2022 01:31:30 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.20])
 by smtp.googlemail.com with ESMTPSA id
 y74-20020a62644d000000b004f129e94f40sm19496506pfb.131.2022.03.02.01.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 01:31:30 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: torvalds@linux-foundation.org
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Wed,  2 Mar 2022 17:31:06 +0800
Message-Id: <20220302093106.8402-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
References: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, h.j.bos@vu.nl,
 jgg@ziepe.ca, intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 christian.koenig@amd.com, rppt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 16:41:04 -0800, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But basically to _me_, the important part is that the end result is
> maintainable longer-term.

I couldn't agree more. And because of that, I stick with the following
approach because it's maintainable longer-term than "type(pos) pos" one:
 Implements a new macro for each list_for_each_entry* with _inside suffix.
  #define list_for_each_entry_inside(pos, type, head, member)

I have posted a patch series here to demonstrate this approach:
https://lore.kernel.org/lkml/20220301075839.4156-3-xiam0nd.tong@gmail.com/

Although we need replace all the use of list_for_each_entry* (15000+)
with list_for_each_entry*_inside, the work can be done gradually rather
than all at once. We can incrementally replace these callers until
all these in the kernel are completely updated with *_inside* one. At
that time, we can just remove the implements of origin macros and rename
the *_inside* macro back to the origin name just in one single patch.

And the "type(pos) pos" approach need teach developers to "not initialize
the iterator variable, otherwise the use-after-loop will not be reported by
compiler", which is unreasonable and impossible for all developers. 

And it will mess up the following code logic and no warnning reported by
compiler, even without initializing "ext" at the beginning:
void foo(struct mem_extent *arg) {
  struct mem_extent *ext;  // used both for iterator and normal ptr
  ...
  ext = arg;  // this assignment can alse be done in another bar() func
  ...
  list_for_each_entry(ext, head, member) {
    if (found(ext))
       break;
  }
  ...
  // use ext after the loop
  ret = ext;
}
If the loop hit the break, the last "ret" will be the found ext iterator.
However, if the "type(pos) pos" approach applied, the last "ret" will be
"arg" which is not the intention of the developers, because the "ext" is
two different variables inside and outside the loop.

Thus, my idea is *better a finger off than always aching*, let's choose
the "list_for_each_entry_inside(pos, type, head, member)" approach.

> It turns out that just syntactically, it's really nice to give the
> type of the iterator from outside the way we do now. Yeah, it may be a
> bit odd, and maybe it's partly because I'm so used to the
> "list_for_each_list_entry()" syntax, but moving the type into the loop
> construct really made it nasty - either one very complex line, or
> having to split it over two lines which was even worse.
>
> Maybe the place I looked at just happened to have a long typename, but
> it's basically always going to be a struct, so it's never a _simple_
> type. And it just looked very odd adn unnatural to have the type as
> one of the "arguments" to that list_for_each_entry() macro.

we can pass a shorter type name to list_for_each_entry_inside, thus no
need to split it over two lines. Actually it is not a big problem.
+ #define t struct sram_bank_info
- list_for_each_entry(pos, head, member) {
+ list_for_each_entry_inside(pos, t, head, member) {

I put the type at the second argument not the first to avoid messing up
the pattern match in some coccinelle scripts.

>  (b) gives us a nice warning for any normal use-after-loop case
> (unless you explicitly initialized it like that
> sgx_mmu_notifier_release() function did for no good reason

sometimes developers can be confused by the reported warnning:
"used without having been initialized", and can not figure out immediately
that "oh, now i am using another different variable but with the same name
of the loop iterator variable", which has changed the programming habits
of developers.

>  (c) also guarantees that even if you don't get a warning,
> non-converted (or newly written) bad code won't actually _work_
>
> so you end up getting the new rules without any ambiguity or mistaken

It will lead to a wrong/NULL pointer dereference if the pointer is used
anywhere else, depend on which value is used to initialized with.

Best regard,
--
Xiaomeng Tong
