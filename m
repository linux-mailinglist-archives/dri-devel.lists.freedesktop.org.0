Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789F3B1662
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 11:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6DE6E840;
	Wed, 23 Jun 2021 09:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536AF6E507
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:01:41 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id c23so3265403qkc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13Gr0i1MTKRVJOLYjbaQS0t+sJQavN2HZYVSf9igv0I=;
 b=SA9G17LOrb34DyVZWPMTTHIONdcJ/5ZbZWqssqBb4aWqa4vseTx3+V6CkFU4RvePBr
 YNNS8jqCGxfTDXRduKfQQMwLt3JL1m3nr4PNVWIksCr6YiJm78aGWUxZDo4V4hXGS1bN
 zAH4ZuRlx4WIbGetsYgzQvT1yucBC3KtrF3U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13Gr0i1MTKRVJOLYjbaQS0t+sJQavN2HZYVSf9igv0I=;
 b=CsohsdbbIqkrEP3fbViJ7yjs+hg/2ciBM69iUEkp8QkKJCwiv9ar1SmDRZ2SkUElNx
 UdpeFr54v4E+Rxz2zWN2htwPuwOnulsgfUSn7mS5xgQemb7U6mCfrO+VGe9cz9gbHWMm
 oB3e9IsYvkdE/zNpdII2zgojRa4HP3yJYSlOKLjOjPsa1SECpjCc5rgn9Czq7pk0UN7L
 RNia8bq2w4r0AB6Dr7g6SRIi1dCTOobhZo3HXZC7C/ZUEAykcPMjDdYW+fq6phOb6BPb
 AFigJbsQhZiN1xP42TnyPvKXIOIPJfsO0ElzhknIuIgx2nBKEqTBpovGPlLEwZt2ux/v
 FHNw==
X-Gm-Message-State: AOAM5321Mnqoj2swXtuRISfKWMRm+El77antR7WSv5ALFIwQQlANqrDo
 shEGsUPwMBbPU3tID6ceW8qQV4B691UETQ==
X-Google-Smtp-Source: ABdhPJyWbRn2vbUuZYtHJRIUWj3X6WrNwGSmOqC7POvH2fOE4aICceAuYVZgalVS9o5073CsFlo0pg==
X-Received: by 2002:a05:620a:5ad:: with SMTP id
 q13mr6946769qkq.275.1624438900254; 
 Wed, 23 Jun 2021 02:01:40 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172])
 by smtp.gmail.com with ESMTPSA id h2sm15515293qkf.106.2021.06.23.02.01.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 02:01:38 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id w21so3274262qkb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 02:01:37 -0700 (PDT)
X-Received: by 2002:a02:4b46:: with SMTP id q67mr7991027jaa.84.1624438886886; 
 Wed, 23 Jun 2021 02:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210619034043.199220-1-tientzu@chromium.org>
 <YNLy7z0Zq1AXKLng@char.us.oracle.com>
In-Reply-To: <YNLy7z0Zq1AXKLng@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 23 Jun 2021 17:01:16 +0800
X-Gmail-Original-Message-ID: <CALiNf28U9xaqth99u=hB45b=qWMYaSoe2DGgNVFrHXze6wNmdQ@mail.gmail.com>
Message-ID: <CALiNf28U9xaqth99u=hB45b=qWMYaSoe2DGgNVFrHXze6wNmdQ@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] Restricted DMA
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 4:38 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Sat, Jun 19, 2021 at 11:40:31AM +0800, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> >
> > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> > not behind an IOMMU. As PCI-e, by design, gives the device full access to
> > system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > full chain of exploits; [2], [3]).
> >
> > To mitigate the security concerns, we introduce restricted DMA. Restricted
> > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> > specially allocated region and does memory allocation from the same region.
> > The feature on its own provides a basic level of protection against the DMA
> > overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system needs
> > to provide a way to restrict the DMA to a predefined memory region (this is
> > usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> >
> > [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> > [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> > [2] https://blade.tencent.com/en/advisories/qualpwn/
> > [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> > [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
>
> Heya Claire,
>
> I put all your patches on
> https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/log/?h=devel/for-linus-5.14
>
> Please double-check that they all look ok.
>
> Thank you!

They look fine. Thank you!
