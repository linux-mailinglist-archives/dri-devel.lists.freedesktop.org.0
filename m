Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02843962E5
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 17:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0C96E940;
	Mon, 31 May 2021 15:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F786E4D0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 15:00:50 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id v9so12195974ion.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wYKtm4IVSfVTnhnKghH2jNnLIsKH6Y+eNOaILu7ARSY=;
 b=AqMEgYi53g30HYY0imJtzNViu05fOgAo/xQtrrm9XrM3n3KYgdCy6sM36TaTmgv0v6
 XvIYBkRFfNiS9tcDp32kkkQRj9L5R+h86b+EJM1hUjC5ImiLdtusiOsddmyVTjrm3mI6
 HVyluqo0OJwH1PN9FVBpuFPsEkrQe6YRuMK7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYKtm4IVSfVTnhnKghH2jNnLIsKH6Y+eNOaILu7ARSY=;
 b=FS6J7GjJbkDaCmAFVu5OqemAt6X6poFis+Hnhubozrdkc2t0oRnd4VGOF/HcQDM0PV
 XO0i0gp9eTrSTV4pytMRZ7ucERJf6FJbg5FKBeWIVdccie/PIeYeg2TIEA9SCRwVm8XN
 71yz/qruSa0ybfad7USRvY3P/WBVzxGwxLOuXwc9wXOeyzZzLH1129Os2/rRYsk4e9+i
 +IQwI1rcsqKYTeFdE5MouBBR8I/+bT1I5rteeIQQflJqo6fXx+wTJmqZUCe0yLQHvO7p
 8OJO9fsRDKdWu9Zi4R21kw2iEYRY/OMON+qIZfPFfTYnL4CunyGegs8jIBel/dB828i9
 MHSg==
X-Gm-Message-State: AOAM533AVnZwHCFgS+IvE0SpGDUU+ScY0K9pvUGCPT0s178bKMGlOyMt
 2Afl9I9a6dmP/vaNO4uguhfXX4j04rSDMw==
X-Google-Smtp-Source: ABdhPJwt8xCVixWkmxBlbxPe5fO9VVwKZPrahZyMe7C0NxOxW1O7YYYTQci5S4IW05Z1yUDbkvnmFQ==
X-Received: by 2002:a05:6638:3445:: with SMTP id
 q5mr21257173jav.120.1622473249463; 
 Mon, 31 May 2021 08:00:49 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id i13sm7867834ila.46.2021.05.31.08.00.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 08:00:48 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id r6so2834120ilj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 08:00:48 -0700 (PDT)
X-Received: by 2002:a6b:690c:: with SMTP id e12mr17489820ioc.69.1622473237437; 
 Mon, 31 May 2021 08:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
 <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
 <20210527130211.GA24344@lst.de> <bab261b4-f801-05af-8fd9-c440ed219591@amd.com>
 <e59d4799-a6ff-6d13-0fed-087fc3482587@amd.com>
In-Reply-To: <e59d4799-a6ff-6d13-0fed-087fc3482587@amd.com>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 31 May 2021 23:00:26 +0800
X-Gmail-Original-Message-ID: <CALiNf29=suiQbDL28tBUXt6-E+-JJC_76X9Uxcdk2s+MSXrp2g@mail.gmail.com>
Message-ID: <CALiNf29=suiQbDL28tBUXt6-E+-JJC_76X9Uxcdk2s+MSXrp2g@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
To: Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
 xypron.glpk@gmx.de, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 12:32 AM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 5/27/21 9:41 AM, Tom Lendacky wrote:
> > On 5/27/21 8:02 AM, Christoph Hellwig wrote:
> >> On Wed, May 19, 2021 at 11:50:07AM -0700, Florian Fainelli wrote:
> >>> You convert this call site with swiotlb_init_io_tlb_mem() which did not
> >>> do the set_memory_decrypted()+memset(). Is this okay or should
> >>> swiotlb_init_io_tlb_mem() add an additional argument to do this
> >>> conditionally?
> >>
> >> The zeroing is useful and was missing before.  I think having a clean
> >> state here is the right thing.
> >>
> >> Not sure about the set_memory_decrypted, swiotlb_update_mem_attributes
> >> kinda suggests it is too early to set the memory decrupted.
> >>
> >> Adding Tom who should now about all this.
> >
> > The reason for adding swiotlb_update_mem_attributes() was because having
> > the call to set_memory_decrypted() in swiotlb_init_with_tbl() triggered a
> > BUG_ON() related to interrupts not being enabled yet during boot. So that
> > call had to be delayed until interrupts were enabled.
>
> I pulled down and tested the patch set and booted with SME enabled. The
> following was seen during the boot:
>
> [    0.134184] BUG: Bad page state in process swapper  pfn:108002
> [    0.134196] page:(____ptrval____) refcount:0 mapcount:-128 mapping:0000000000000000 index:0x0 pfn:0x108002
> [    0.134201] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
> [    0.134208] raw: 0017ffffc0000000 ffff88847f355e28 ffff88847f355e28 0000000000000000
> [    0.134210] raw: 0000000000000000 0000000000000001 00000000ffffff7f 0000000000000000
> [    0.134212] page dumped because: nonzero mapcount
> [    0.134213] Modules linked in:
> [    0.134218] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.0-rc2-sos-custom #3
> [    0.134221] Hardware name: ...
> [    0.134224] Call Trace:
> [    0.134233]  dump_stack+0x76/0x94
> [    0.134244]  bad_page+0xa6/0xf0
> [    0.134252]  __free_pages_ok+0x331/0x360
> [    0.134256]  memblock_free_all+0x158/0x1c1
> [    0.134267]  mem_init+0x1f/0x14c
> [    0.134273]  start_kernel+0x290/0x574
> [    0.134279]  secondary_startup_64_no_verify+0xb0/0xbb
>
> I see this about 40 times during the boot, each with a different PFN. The
> system boots (which seemed odd), but I don't know if there will be side
> effects to this (I didn't stress the system).
>
> I modified the code to add a flag to not do the set_memory_decrypted(), as
> suggested by Florian, when invoked from swiotlb_init_with_tbl(), and that
> eliminated the bad page state BUG.

Thanks. Will add a flag to skip set_memory_decrypted() in v9.

>
> Thanks,
> Tom
>
> >
> > Thanks,
> > Tom
> >
> >>
