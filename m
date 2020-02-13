Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F715CE02
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 23:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E716E03C;
	Thu, 13 Feb 2020 22:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9976E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 22:18:53 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id x1so8341633iop.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 14:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgJetIujIpTH3S+W9TWGosMzVWu5sFXVz/DtyknH4BM=;
 b=JV0MoYAV9Ah9y9mX6EMwYfgBuYYaPUY4Vtgdhk8pNUAzi5XfgOtdMRFoJSw5da+g7b
 ScmRhWwnph6Ew2mwFfq+tAVGzATIM90EXhnKIuXiZWmS7hihYQlUOfpUAuK9zxWf62jW
 BZ80VR/ltodBW0LXnRCVlyfCawA+IA4dIDqcxb+qump0199JdLKenSLGK3kWCOk9+zqk
 02kh8AtBuG5Er22Kae0kVN8qdm8p9RaYoaZ1kQyskApQQsh/DpHuCzfOqjFhllrop5YM
 CoyYtJQKtVxc/cdF81c070GpMpJRe7SaM6kS3OLsSCEv1gAWKwWFYIJN03oMO68KBUJx
 lEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgJetIujIpTH3S+W9TWGosMzVWu5sFXVz/DtyknH4BM=;
 b=Lkc9z0vg9o0UYOxijty1VKPIxfkWwKJylqPaXQGV/9gXJN39v1ra8cwVN/heYI5PVj
 7Ve2vZqSvDk4fD24zofTi4nQTrWYjj9xiW8R6qSETjRKbUMuLftjK2W/kmDetO723rRG
 B0KD0M/iuZVHaT1Ud2CR1nGbhhht0MSxIIDzsVHT/KQHF/otVh7sK3MRENUv8SIp8ouC
 t3idcMEPOMrMt60VeOnCPYG5zNl1nDGTOCTuQXhHYV399t/KvKW6YcPjyC9QD/Oa0Iv4
 btzzbGQEb+ZeQae+z93eXyQmyrxuTy9HyE9QxuHNFjnwFc4gOGODUQP3iePar+bun6RW
 BVJg==
X-Gm-Message-State: APjAAAU2h6RW8maPcWk5flGSQAj8N2FK3r5GWlzQVChWoR9pQN40Gz39
 bXNVJMrLEh2Risd/vkmHkp6AahArENEOAbFVsUg=
X-Google-Smtp-Source: APXvYqyJjYPcylq2tJdi+XpmWzTzJo74Hv8POtQ7C61FrOILZGSI/nkmlgldQs/32rRcnnTdMjVQ5SggqocZH2gYXoI=
X-Received: by 2002:a5d:8555:: with SMTP id b21mr23821852ios.200.1581632332393; 
 Thu, 13 Feb 2020 14:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
In-Reply-To: <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 13 Feb 2020 14:18:41 -0800
Message-ID: <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, joro@8bytes.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, vkuznets@redhat.com, jmattson@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/02/20 22:30, Chia-I Wu wrote:
> > Hi,
> >
> > Host GPU drivers like to give userspace WC mapping.  When the userspace makes
> > the mapping available to a guest, it also tells the guest to create a WC
> > mapping.  However, even when the guest kernel picks the correct memory type,
> > it gets ignored because of VMX_EPT_IPAT_BIT on Intel.
> >
> > This series adds a new flag to KVM_SET_USER_MEMORY_REGION, which tells the
> > host kernel to honor the guest memory type for the memslot.  An alternative
> > fix is for KVM to unconditionally honor the guest memory type (unless it is
> > MMIO, to avoid MCEs on Intel).  I believe the alternative fix is how things
> > are on ARM, and probably also how things are on AMD.
> >
> > I am new to KVM and HW virtualization technologies.  This series is meant as
> > an RFC.
> >
>
> When we tried to do this in the past, we got machine checks everywhere
> unfortunately due to the same address being mapped with different memory
> types.  Unfortunately I cannot find the entry anymore in bugzilla, but
> this was not fixed as far as I know.
Yeah, I did a bit of history digging here

  https://gitlab.freedesktop.org/virgl/virglrenderer/issues/151#note_372594

The bug you mentioned was probably this one

  https://bugzilla.kernel.org/show_bug.cgi?id=104091

which was caused by

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd717f11015f673487ffc826e59b2bad69d20fe5

From what I can tell, the commit allowed the guests to create cached
mappings to MMIO regions and caused MCEs.  That is different than what
I need, which is to allow guests to create uncached mappings to system
ram (i.e., !kvm_is_mmio_pfn) when the host userspace also has uncached
mappings.  But it is true that this still allows the userspace & guest
kernel to create conflicting memory types.

Implementation-wise, the current implementation uses
kvm_arch_register_noncoherent_dma.  It essentially treats a memslot
with the new flag as a non-coherent vfio device as far as mmu is
concerned.

>
> Paolo
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
