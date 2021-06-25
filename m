Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8633B3A32
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 02:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA23C6E9D2;
	Fri, 25 Jun 2021 00:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A332D6E9D2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 00:42:00 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i17so8194568ilj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EqlrFHdkETA6GW6RTp23OD25mZ9+t6ZRMvVFoaOPoUc=;
 b=bWcnQFoaV8XnWx2CmMqEub8uZpXzFMse4FkKs/6K7fAcmnfM33tj2MQVZVMqk8lHor
 cnCu5fEy9K2Coqappl8ZOF4ctPyliF3MamPmCDoyKpou7w8OAoAQjHS8393soCVU2vwe
 MHeea8kRyeqRwy1slhC35EkQWOKLuZs+gqotQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EqlrFHdkETA6GW6RTp23OD25mZ9+t6ZRMvVFoaOPoUc=;
 b=kZ2pqvwiJrLIOXwWthBN2wAIH9/5B3rqPv2jpDu9LN1CAsxWK9U/6Tr8JymF3r7PtU
 zXcqiamVqk3SNEhOe1IKGLVEZ6opDU2aL1IA2yv8/N3Vpjf06Q9qLhcurTyUsXPNTghI
 sgJAuaw7jZ10TQ8cdGKi3Vyu/nFRM8fLhWKHfzhW+6yZCQgxSrruxzNHRo+lWVWojeOn
 BhRg+wh2IdDw+59aHor2rzUYYXDuJjGkFe54EIoGdLyXS+kU3u3GuPONSPSIXOORhunA
 9mXfxqJwfpsa+51z1iRXrnRPodRERBr+X7KgL++e6M8+zFk0PCQpbsjxq+EG2u1YVTSL
 yzCQ==
X-Gm-Message-State: AOAM533AVRHnTKN9G9d/pCUNo9qjMGmEQQUYSFUZwhtmnW64ScHADvgx
 hhjGjxCb7dKus67OxqVDSYzep9m3gBBgNg==
X-Google-Smtp-Source: ABdhPJy39t8t/0rcyOKYFw93nzqO1ibFOZV4CK1bIdWK+BuF6USZ6ETrci+QPPKi1HwflhLPBLlGzA==
X-Received: by 2002:a05:6e02:4a1:: with SMTP id
 e1mr5369809ils.133.1624581719775; 
 Thu, 24 Jun 2021 17:41:59 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id b25sm2411746ios.36.2021.06.24.17.41.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 17:41:59 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id z1so8268408ils.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:41:58 -0700 (PDT)
X-Received: by 2002:a05:6602:1546:: with SMTP id
 h6mr6334034iow.34.1624581707960; 
 Thu, 24 Jun 2021 17:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <YNTa1C5uvz+qWryf@char.us.oracle.com>
In-Reply-To: <YNTa1C5uvz+qWryf@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 25 Jun 2021 08:41:37 +0800
X-Gmail-Original-Message-ID: <CALiNf297ep9C8-3s=F-xRDud=QB9geMfCMKTqLzPJKEdYnfbXQ@mail.gmail.com>
Message-ID: <CALiNf297ep9C8-3s=F-xRDud=QB9geMfCMKTqLzPJKEdYnfbXQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/12] Restricted DMA
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
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 25, 2021 at 3:20 AM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Thu, Jun 24, 2021 at 11:55:14PM +0800, Claire Chang wrote:
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
> >
> > v15:
> > - Apply Will's diff (https://lore.kernel.org/patchwork/patch/1448957/#1647521)
> >   to fix the crash reported by Qian.
> > - Add Stefano's Acked-by tag for patch 01/12 from v14
>
> That all should be now be on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/
> devel/for-linus-5.14 (and linux-next)
>

devel/for-linus-5.14 looks good. Thanks!
