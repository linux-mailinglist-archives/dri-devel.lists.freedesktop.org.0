Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DFB3B4336
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 14:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB586ED93;
	Fri, 25 Jun 2021 12:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25A36ED93;
 Fri, 25 Jun 2021 12:30:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4C9361463;
 Fri, 25 Jun 2021 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624624216;
 bh=236dSGX7ExOVPv4h0UeOksGQ8SgYCOQ7aXD3NGK83S0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCaWwZtC9a0kNjsO191mUbtUcojnviRFMJnXBZ/UQc+wZDgM8hUcreC3qNCEkirNE
 bbLWlaMbJfBXlg05V08tS0sV+lbJ6mjPNoN7Y8AT15UfxghYQbA3zVDmQkdENHWUeg
 aoWWbni5r3mbAZmV1yWyb6Qtn3Rm3bH4e4imD6DcErBaFTOVYzmckxYQM6wCi00qxL
 IKspsHt2W8+A5P7LrhMSB0wLC0J5AtiueFbpUWEKsYqOURtPkRdQJiwA+N05SkMbY0
 yNml1K+qGwoAZk+3C0lKdhaf1wsPR1zKe7fVETOXT9FqPpHlh5Z2ca5kWomvg9Dx6c
 8Pdmk/dzJ5M/g==
Date: Fri, 25 Jun 2021 13:30:05 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v15 00/12] Restricted DMA
Message-ID: <20210625123004.GA3170@willie-the-truck>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <YNTa1C5uvz+qWryf@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNTa1C5uvz+qWryf@char.us.oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, quic_qiancai@quicinc.com,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 03:19:48PM -0400, Konrad Rzeszutek Wilk wrote:
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

Thanks Konrad!

Will
