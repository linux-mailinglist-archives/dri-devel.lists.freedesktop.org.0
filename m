Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06AE2A59B3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 23:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21146E903;
	Tue,  3 Nov 2020 22:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E884289C6E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 22:09:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a15so11363337edy.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 14:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WO1e+L++wPESWfr9nzOE54SCt7afrEsmsB9fEuoYvbI=;
 b=T+/A6+J62VDvQMKYPtVg2CtBW5xawhHVZqWOERIyixTczN4MfytqxhoJQJOcs2790L
 sj4ZJgiKijp3n63RZQtMlQ3es9rYo1weSDlwxcJm5Ag+lH4tps5I28z8LxvfwKmYtzJJ
 /7ODS6RyMh7GrhkYAYzKWrZUgtjo08ShY2d8lFIlqSiQY56zEC4lJ332rH1cpQ0Jikk9
 7t5YiToX4pGXA3cBIa8hr/lWANYeeU9HgWErCB0IiUFAAt6bSVSfurD3RBJy3BliIelp
 YL3WFMt/TsTNhYtMeHyiS4JaRXQkTDS7Em1++6Jk3gmVGF0kwFa501K00ou4nDd0zP9v
 pO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WO1e+L++wPESWfr9nzOE54SCt7afrEsmsB9fEuoYvbI=;
 b=ROBXMcGX+g9xw/FQMqHNRrczi6/Z3r1aKJoV9R5EWr31NZasopmd/A1oS/BpTr25aF
 gNah7bcJZk4OpfeYwEG8Oz6EMxk7BmjeWxsKeScAQCdkHfapN+NMmHwwnOW8dY0F4iFe
 pUFosBEc9jRhAXo2lIws8iBDW30t0iBCSrERTPurjoHazrz9mJZpIfbEwTQ0idxrgpU8
 dxh0iQzOpZ76qyNCvAB4Z7cs2t7udaNjxtzpc0BmCkAh3W1nheYfZB8ccWQ+0XNmdIZN
 XM+WynPDVVQlgzHIpFnLF9mJSrdrigXhOrz/5RVPL2AuaUpUpzCBcsHzcbki1Z/nqach
 wwPw==
X-Gm-Message-State: AOAM533JFs9+gniwxg5VuhqZpW4/HAsC9s3kYwH9Xbr8t58GzIeVG2uT
 nPqxkMeZ/psEv6Pl8Y1UkHyqn0FID2SsCLc1P9+c7Q==
X-Google-Smtp-Source: ABdhPJz1NDE7PM2O7672wRWt1a0mL/+PL68eDdfq2Oj69hckQbQldL+V0lbGY3zFDyAcHIRlbnAQxlg/ZySh5dCl9Ns=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr24583081eds.354.1604441386651; 
 Tue, 03 Nov 2020 14:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-12-daniel.vetter@ffwll.ch>
 <20201103212840.GA266427@bjorn-Precision-5520>
In-Reply-To: <20201103212840.GA266427@bjorn-Precision-5520>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 3 Nov 2020 14:09:35 -0800
Message-ID: <CAPcyv4jCGxWG0opLv4VzBRk5iLwu6CRse4DwF-otWkfXoGWe6A@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 1:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Oct 30, 2020 at 11:08:11AM +0100, Daniel Vetter wrote:
> > There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> > files, and the old proc interface. Two check against
> > iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> > this starts to matter, since we don't want random userspace having
> > access to PCI BARs while a driver is loaded and using it.
> >
> > Fix this by adding the same iomem_is_exclusive() check we already have
> > on the sysfs side in pci_mmap_resource().
> >
> > References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
> This is OK with me but it looks like IORESOURCE_EXCLUSIVE is currently
> only used in a few places:
>
>   e1000_probe() calls pci_request_selected_regions_exclusive(),
>   ne_pci_probe() calls pci_request_regions_exclusive(),
>   vmbus_allocate_mmio() calls request_mem_region_exclusive()
>
> which raises the question of whether it's worth keeping
> IORESOURCE_EXCLUSIVE at all.  I'm totally fine with removing it
> completely.

Now that CONFIG_IO_STRICT_DEVMEM upgrades IORESOURCE_BUSY to
IORESOURCE_EXCLUSIVE semantics the latter has lost its meaning so I'd
be in favor of removing it as well.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
