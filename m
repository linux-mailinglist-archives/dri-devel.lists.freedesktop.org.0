Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A292870C6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 10:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18D56EA4B;
	Thu,  8 Oct 2020 08:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108BC6EA4B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 08:35:54 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id x1so4985055eds.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJ+2+sl7v16ZFQwrrbmFXcTV3fSlDqvjbzZU8FH7J0k=;
 b=YbQ4JKBcC915g3FwIkD4kMLjfA+HVo2VeyW7+RDRzBMyT6+pZrez6yFdxS1JVF+MCw
 I9fi5xpJkCMQ1MZFTgUNhIEalXi4O0KwTMs6M55IBSfgwcTCW7bCzjzwadX5IHs01Ys+
 QUkVJA+YFpvasOLS9njwPhCahsqEDmCIU3hjqiJOLg6eOuSAtlQRKOhBK1ipMWiljZWh
 bYsA4n/IJXJ6UoXazYhMMo1uHPy0DHAjqas/E118aED/AKQSL4ZqYOLHJELydII57n0C
 lMedTQeMsrYtUwkqt58wwsiqUj0n2XZJEoEzBMy4uQlfr4hZt8lgFUBScrlQH+fPt2h/
 k/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJ+2+sl7v16ZFQwrrbmFXcTV3fSlDqvjbzZU8FH7J0k=;
 b=GFQuGPjksQYcvc2a1GmUlq5MurVDKJqIX6vEr/NHsdVcQfWf9ynpNAT5ztscNDtz9L
 +BFG7OQ/uS0/1wiz3kLOZNP7L91T6hYU30DqNHSTcRxo1fZSxaFBDbJflDraDghFoqsg
 rda0CWas0t3v7gL3tyrC2jcpzrsRYI0CjboA6TQM5MhwizIwfGd4rZvNTr+os0M+WEc9
 96CpPewJZcoR/JbhyvxsOem7LxjQ7u1tLNKTu8FAP00SzI+qjl1MjxIcQ1ZyExuaGwWX
 0raxRZ+lzKLd5HxPtoT83peLyzs6a39Qxyyu9Jpm02ClYLkteEaAd5S5fR6wWd8zF13L
 FyPA==
X-Gm-Message-State: AOAM531R3IOmOB1n+fipuD3RBLLdP/UBgSdE3+a9ESLt30HdBpD8hTxq
 7O1iEFs0LqYPgv2dqAvpzHT9c3T8YsvXVA6kutiBrg==
X-Google-Smtp-Source: ABdhPJzrgg4QxWXsEzPYzTcGzHWRGJzutSHzxf7MyS7jl8fXaPnvZsxbr7tbXLGs65s2GKo7inPQ7k7YwejU0k9swws=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr8193746edf.52.1602146152651; 
 Thu, 08 Oct 2020 01:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
 <20201007232448.GC5177@ziepe.ca>
 <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
 <CAKMK7uHg48-fTR1L78p7q5vxD=Kgr_fBEj1pDLaYeuvTGSSFig@mail.gmail.com>
In-Reply-To: <CAKMK7uHg48-fTR1L78p7q5vxD=Kgr_fBEj1pDLaYeuvTGSSFig@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 8 Oct 2020 01:35:41 -0700
Message-ID: <CAPcyv4gK82tpNWqwF-CFGPWU99WU-Sd84Y79zuQxMfZh1efoMQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 8, 2020 at 1:13 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Thu, Oct 8, 2020 at 9:50 AM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > On Wed, Oct 7, 2020 at 4:25 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Oct 07, 2020 at 12:33:06PM -0700, Dan Williams wrote:
> > > > On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > >
> > > > > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > > > > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > > > > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > > > > the default for all driver uses.
> > > > >
> > > > > Except there's two more ways to access pci bars: sysfs and proc mmap
> > > > > support. Let's plug that hole.
> > > >
> > > > Ooh, yes, lets.
> > > >
> > > > >
> > > > > For revoke_devmem() to work we need to link our vma into the same
> > > > > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > > > > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > > > > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > > > > at ->open time, but that's a bit tricky here with all the entry points
> > > > > and arch code. So instead create a fake file and adjust vma->vm_file.
> > > >
> > > > I don't think you want to share the devmem inode for this, this should
> > > > be based off the sysfs inode which I believe there is already only one
> > > > instance per resource. In contrast /dev/mem can have multiple inodes
> > > > because anyone can just mknod a new character device file, the same
> > > > problem does not exist for sysfs.
> > >
> > > The inode does not come from the filesystem char/mem.c creates a
> > > singular anon inode in devmem_init_inode()
> >
> > That's not quite right, An inode does come from the filesystem I just
> > arranged for that inode's i_mapping to be set to a common instance.
> >
> > > Seems OK to use this more widely, but it feels a bit weird to live in
> > > char/memory.c.
> >
> > Sure, now that more users have arrived it should move somewhere common.
> >
> > > This is what got me thinking maybe this needs to be a bit bigger
> > > generic infrastructure - eg enter this scheme from fops mmap and
> > > everything else is in mm/user_iomem.c
> >
> > It still requires every file that can map physical memory to have its
> > ->open fop do
> >
> >        inode->i_mapping = devmem_inode->i_mapping;
> >        filp->f_mapping = inode->i_mapping;
> >
> > I don't see how you can centralize that part.
>
> btw, why are you setting inode->i_mapping? The inode is already
> published, changing that looks risky. And I don't think it's needed,
> vma_link() only looks at filp->f_mapping, and in our drm_open() we
> only set that one.

I think you're right it is unnecessary for devmem, but I don't think
it's dangerous to do it from the very first open before anything is
using the address space. It's copy-paste from what all the other
"shared address space" implementers do. For example, block-devices in
bd_acquire(). However, the rationale for block_devices to do it is so
that page cache pages can be associated with the address space in the
absence of an f_mapping. Without filesystem page writeback to
coordinate I don't see any devmem code paths that would operate on the
inode->i_mapping.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
