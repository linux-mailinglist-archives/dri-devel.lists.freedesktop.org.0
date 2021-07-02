Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8623B9ACD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 05:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3330D6EC83;
	Fri,  2 Jul 2021 03:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3B6E05D;
 Fri,  2 Jul 2021 03:08:09 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id o6so9764795oic.9;
 Thu, 01 Jul 2021 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vnC0TqPJlyIMqLOncGpr5zl9pmbmcIIyiC4phT6PUIQ=;
 b=rcatVMwnoboRAVBm6z7P2HYmOyqx+HWthzA0HOg5zSVWMr7WIAx3ZVtmMQBABS3jSs
 ll3cBrlaV5N4g4Rvy938v3Mka2o7BKSsLAnp0j9BVKtd6G0HRyhUAM117EPetSB6PYk4
 aIzksvokAZwg7oj60y4L3zka5GOYTYtCADcKKqh9eOpTeqFos+tdtKUeh13pl/ncaATb
 z+gsly2qHHMFdyn0yxdy8vih0i6Y3VD1swKheCHmBE++JlII4Ajp+FJ6942Kfxfr0p9t
 PlSPUBKWfUPw26fCx2/8jDss0gWJ7ZhSbqGnHJzN7Y9CqXNOHLSOGPQ6Z7xfZJI1OXzp
 hIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=vnC0TqPJlyIMqLOncGpr5zl9pmbmcIIyiC4phT6PUIQ=;
 b=YKKDXqbuNJW6JblO7gK1MdWO27Z/hgVjhdJ8G369WACSfgBjEE6nymMPtKCYcSRdlb
 IBuADe2DyQMSJs7+hTbgX4VFMBkMMK9/qJz82gxUWQ9lKRpAZzmPcRstgkLuNSoY0CcB
 6yUWo2lSWHCLSqLKW6BMOebCsjuQDDlduQrU7c2NUWAUayTtj2DrRmLsiz7u7AzUq0L/
 cpKV1cQf+34rtxuvvWbw98H3EADWDvwzIXg+nCCEMBRb8gDCFrKOaDZDytWfYuuS6Tbf
 5OsYkPMUPWnWqzkU7Y1djAQoq1laHXRXjO+TVmzam9F+Wjiz+DgAVsq2XhFW6S7FCHby
 LhhQ==
X-Gm-Message-State: AOAM530qzVEqt/S2X7I9CiH9d5pZXLJ139gCmZZYyfE94ZlE+EcPOewo
 DTT+hiZSZyfj9yYrM6Kzgjs=
X-Google-Smtp-Source: ABdhPJxROyx59a65CULGKnIjDKL6LEkceViIozGHO/6JCiILIO/ostWPfjk3TYymGpFPnNGZwku3+w==
X-Received: by 2002:a54:4187:: with SMTP id 7mr2101677oiy.127.1625195289117;
 Thu, 01 Jul 2021 20:08:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l2sm374555otl.27.2021.07.01.20.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 20:08:08 -0700 (PDT)
Date: Thu, 1 Jul 2021 20:08:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v15 12/12] of: Add plumbing for restricted DMA pool
Message-ID: <20210702030807.GA2685166@roeck-us.net>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-13-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624155526.2775863-13-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 matthew.auld@intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 thomas.hellstrom@linux.intel.com, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 quic_qiancai@quicinc.com, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 24, 2021 at 11:55:26PM +0800, Claire Chang wrote:
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>

With this patch in place, all sparc and sparc64 qemu emulations
fail to boot. Symptom is that the root file system is not found.
Reverting this patch fixes the problem. Bisect log is attached.

Guenter

---
# bad: [fb0ca446157a86b75502c1636b0d81e642fe6bf1] Add linux-next specific files for 20210701
# good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
git bisect start 'HEAD' 'v5.13'
# bad: [f63c4fda987a19b1194cc45cb72fd5bf968d9d90] Merge remote-tracking branch 'rdma/for-next'
git bisect bad f63c4fda987a19b1194cc45cb72fd5bf968d9d90
# good: [46bb5dd1d2a63e906e374e97dfd4a5e33934b1c4] Merge remote-tracking branch 'ipsec/master'
git bisect good 46bb5dd1d2a63e906e374e97dfd4a5e33934b1c4
# good: [43ba6969cfb8185353a7a6fc79070f13b9e3d6d3] Merge remote-tracking branch 'clk/clk-next'
git bisect good 43ba6969cfb8185353a7a6fc79070f13b9e3d6d3
# good: [1ca5eddcf8dca1d6345471c6404e7364af0d7019] Merge remote-tracking branch 'fuse/for-next'
git bisect good 1ca5eddcf8dca1d6345471c6404e7364af0d7019
# good: [8f6d7b3248705920187263a4e7147b0752ec7dcf] Merge remote-tracking branch 'pci/next'
git bisect good 8f6d7b3248705920187263a4e7147b0752ec7dcf
# good: [df1885a755784da3ef285f36d9230c1d090ef186] RDMA/rtrs_clt: Alloc less memory with write path fast memory registration
git bisect good df1885a755784da3ef285f36d9230c1d090ef186
# good: [93d31efb58c8ad4a66bbedbc2d082df458c04e45] Merge remote-tracking branch 'cpufreq-arm/cpufreq/arm/linux-next'
git bisect good 93d31efb58c8ad4a66bbedbc2d082df458c04e45
# good: [46308965ae6fdc7c25deb2e8c048510ae51bbe66] RDMA/irdma: Check contents of user-space irdma_mem_reg_req object
git bisect good 46308965ae6fdc7c25deb2e8c048510ae51bbe66
# good: [6de7a1d006ea9db235492b288312838d6878385f] thermal/drivers/int340x/processor_thermal: Split enumeration and processing part
git bisect good 6de7a1d006ea9db235492b288312838d6878385f
# good: [081bec2577cda3d04f6559c60b6f4e2242853520] dt-bindings: of: Add restricted DMA pool
git bisect good 081bec2577cda3d04f6559c60b6f4e2242853520
# good: [bf95ac0bcd69979af146852f6a617a60285ebbc1] Merge remote-tracking branch 'thermal/thermal/linux-next'
git bisect good bf95ac0bcd69979af146852f6a617a60285ebbc1
# good: [3d8287544223a3d2f37981c1f9ffd94d0b5e9ffc] RDMA/core: Always release restrack object
git bisect good 3d8287544223a3d2f37981c1f9ffd94d0b5e9ffc
# bad: [cff1f23fad6e0bd7d671acce0d15285c709f259c] Merge remote-tracking branch 'swiotlb/linux-next'
git bisect bad cff1f23fad6e0bd7d671acce0d15285c709f259c
# bad: [b655006619b7bccd0dc1e055bd72de5d613e7b5c] of: Add plumbing for restricted DMA pool
git bisect bad b655006619b7bccd0dc1e055bd72de5d613e7b5c
# first bad commit: [b655006619b7bccd0dc1e055bd72de5d613e7b5c] of: Add plumbing for restricted DMA pool
