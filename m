Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9CA160D14
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDD16E8CE;
	Mon, 17 Feb 2020 08:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74836FBAE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 21:57:00 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z193so12190607iof.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 13:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1PA1kP0Xz589wmg2zHjrpiwU87UdZjJrCtqyOsFzXpo=;
 b=PPxHAKJ5l6o0WOWqFV+IhQhx0nRSZ4jCWhgkCXggtSpnNXkOcnre3+AJjA6j6T1C1B
 xyuDXuT5F5uScex12T5FQGrkDI4OL4PcSs9mljuF4G6xEppfHMArG8avsbw2XHus+iW7
 OU4yrP7I68CH8Ll/0PTSbbSTFYthQF/omCNgc3MqnYpvJ2841fSmEzeTIK5FMaFHYO1R
 fq/PZFqGvKxu4LDoGKu6yEF/Su9wkTt61rBMjozYndfTrA34ACTqowRDkm98HjBGevq6
 3xdR0ba1fZG4oHPCOZXxTucz6f/xTQJdDYjlXpHtjKELLYZYtLAXRza4a3NNoDMy3h8W
 JErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PA1kP0Xz589wmg2zHjrpiwU87UdZjJrCtqyOsFzXpo=;
 b=OPHM0AuM6JsQjUrcSzkEy3fDYWZzoNLZZqkzjiyYlgFhccJnpMHtwuGjogr+Og5CFD
 emet5QUvkjW8l91RlWl3Nau5dRcT5s/YOTLqJncBQN+bDTIMJp3TvnJ7IrP4uERr+7fX
 waqEeaUuAvR2diRajoMoma2NNLp6fNlF6uAq8octEfSenH8HK0dgYTCSiBz4mFblzU2W
 1DzG9FYMCcZ3cv1JCgl80paCAKeTNMFLs9TdGATdBjljvNzaISXHdCdJtMQy79rGb44u
 A9b30Tqob1KOJwP4vik6nZTihF84Kh9c5YHa76ZWDwu7JR3vLy0lLnR4dF+qco5oBIua
 V2hA==
X-Gm-Message-State: APjAAAUBEihFGS1bAqeB3uREfHlbyCQSKGYWmBURxEo5Oz4+0wdjm4ug
 Z+UaxyruDD1eC7c6qlQIA2j6k73MwGaPpRbM9AY0yA==
X-Google-Smtp-Source: APXvYqxmbEDsw3y1HMEDCJX3GrbJH5bKgojg1u4BCEEeXlFQ0gDdkvT7pJ5ZZN7C0FxkmtfKVtmPCaP24jPDo5bcOPw=
X-Received: by 2002:a5e:8e4c:: with SMTP id r12mr3862733ioo.119.1581717419703; 
 Fri, 14 Feb 2020 13:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <20200214195229.GF20690@linux.intel.com>
 <CAPaKu7Q4gehyhEgG_Nw=tiZiTh+7A8-uuXq1w4he6knp6NWErQ@mail.gmail.com>
In-Reply-To: <CAPaKu7Q4gehyhEgG_Nw=tiZiTh+7A8-uuXq1w4he6knp6NWErQ@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 14 Feb 2020 13:56:48 -0800
Message-ID: <CALMp9eRwTxdqxAcobZ7sYbD=F8Kga=jR3kaz-OEYdA9fV0AoKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: Chia-I Wu <olvaffe@gmail.com>
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Wanpeng Li <wanpengli@tencent.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, kvm list <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 1:47 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Fri, Feb 14, 2020 at 11:52 AM Sean Christopherson
> <sean.j.christopherson@intel.com> wrote:
> >
> > On Fri, Feb 14, 2020 at 11:26:06AM +0100, Paolo Bonzini wrote:
> > > On 13/02/20 23:18, Chia-I Wu wrote:
> > > >
> > > > The bug you mentioned was probably this one
> > > >
> > > >   https://bugzilla.kernel.org/show_bug.cgi?id=104091
> > >
> > > Yes, indeed.
> > >
> > > > From what I can tell, the commit allowed the guests to create cached
> > > > mappings to MMIO regions and caused MCEs.  That is different than what
> > > > I need, which is to allow guests to create uncached mappings to system
> > > > ram (i.e., !kvm_is_mmio_pfn) when the host userspace also has uncached
> > > > mappings.  But it is true that this still allows the userspace & guest
> > > > kernel to create conflicting memory types.
> >
> > This is ok.
> >
> > > Right, the question is whether the MCEs were tied to MMIO regions
> > > specifically and if so why.
> >
> > 99.99999% likelihood the answer is "yes".  Cacheable accesses to non-existent
> > memory and most (all?) MMIO regions will cause a #MC.  This includes
> > speculative accesses.
> >
> > Commit fd717f11015f ("KVM: x86: apply guest MTRR virtualization on host
> > reserved pages") explicitly had a comment "1. MMIO: trust guest MTRR",
> > which is basically a direct avenue to generating #MCs.
> >
> > IIRC, WC accesses to non-existent memory will also cause #MC, but KVM has
> > bigger problems if it has PRESENT EPTEs pointing at garbage.
> >
> > > An interesting remark is in the footnote of table 11-7 in the SDM.
> > > There, for the MTRR (EPT for us) memory type UC you can read:
> > >
> > >   The UC attribute comes from the MTRRs and the processors are not
> > >   required to snoop their caches since the data could never have
> > >   been cached. This attribute is preferred for performance reasons.
> > >
> > > There are two possibilities:
> > >
> > > 1) the footnote doesn't apply to UC mode coming from EPT page tables.
> > > That would make your change safe.
> > >
> > > 2) the footnote also applies when the UC attribute comes from the EPT
> > > page tables rather than the MTRRs.  In that case, the host should use
> > > UC as the EPT page attribute if and only if it's consistent with the host
> > > MTRRs; it would be more or less impossible to honor UC in the guest MTRRs.
> > > In that case, something like the patch below would be needed.
> >
> > (2), the EPTs effectively replace the MTRRs.  The expectation being that
> > the VMM will use always use EPT memtypes consistent with the MTRRs.
> This is my understanding as well.
>
> > > It is not clear from the manual why the footnote would not apply to WC; that
> > > is, the manual doesn't say explicitly that the processor does not do snooping
> > > for accesses to WC memory.  But I guess that must be the case, which is why I
> > > used MTRR_TYPE_WRCOMB in the patch below.
> >
> > A few paragraphs below table 11-12 states:
> >
> >   In particular, a WC page must never be aliased to a cacheable page because
> >   WC writes may not check the processor caches.
> >
> > > Either way, we would have an explanation of why creating cached mapping to
> > > MMIO regions would, and why in practice we're not seeing MCEs for guest RAM
> > > (the guest would have set WB for that memory in its MTRRs, not UC).
> >
> > Aliasing (physical) RAM with different memtypes won't cause #MC, just
> > memory corruption.
>
> What we need potentially gives the userspace (the guest kernel, to be
> exact) the ability to create conflicting memory types.  If we can be
> sure that the worst scenario is for a guest to corrupt its own memory,
> by only allowing aliases on physical ram, that seems alright.
>
> AFAICT, it is currently allowed on ARM (verified) and AMD (not
> verified, but svm_get_mt_mask returns 0 which supposedly means the NPT
> does not restrict what the guest PAT can do).  This diff would do the
> trick for Intel without needing any uapi change:

I would be concerned about Intel CPU errata such as SKX40 and SKX59.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
