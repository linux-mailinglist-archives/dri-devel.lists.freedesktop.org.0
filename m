Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0E1EE2ED
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 13:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E8A6E32B;
	Thu,  4 Jun 2020 11:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D466E32B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 11:06:37 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 054B2Wbt048434;
 Thu, 4 Jun 2020 11:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=4RO7Xefwz2W19qFTEWX/FwDp9Pn7/hDI6Vo3GbQ0CHw=;
 b=BZk1ybsvNLTvYo2DQYRFC3lHTXpBcrbcCK3KUNW4uhzqEmb63kpA0BJNGTr1XJoXWVzy
 47oJRnzV8uezdi2hottXpDrm/PvgIokjcdrWlR8NtYzBMdOwtGM7crgkFweOmU8DcPtm
 dad9etzRvx9cEkL6vdRFN/crRWnOXi6po9dZyO84H7v4IzNIG69slY9XW7THskfj7bMn
 5OhDtSs205OME8L5I3iE0kGeyXsjAPmhU/L7sNIJlz93WVGfRrkojjZfl4OKcWYisLQ2
 3fYpH84ScdroRpxGAUKNZu6hWqHzYFrQOJLomtItZ2z78ZoSilpTZJPB5k0tphYobIol nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 31evap11xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 04 Jun 2020 11:05:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 054AxXU3143958;
 Thu, 4 Jun 2020 11:05:49 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 31ej107v9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jun 2020 11:05:49 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 054B5M5d015957;
 Thu, 4 Jun 2020 11:05:22 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 04 Jun 2020 04:05:22 -0700
Date: Thu, 4 Jun 2020 14:04:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
Message-ID: <20200604110455.GO30374@kadam>
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603192058.35296-10-james.quinlan@broadcom.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006040075
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, Alan Stern <stern@rowland.harvard.edu>,
 Len Brown <lenb@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 03:20:41PM -0400, Jim Quinlan wrote:
> @@ -786,7 +787,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
>  	const struct sun4i_backend_quirks *quirks;
>  	struct resource *res;
>  	void __iomem *regs;
> -	int i, ret;
> +	int i, ret = 0;

No need for this.

>  
>  	backend = devm_kzalloc(dev, sizeof(*backend), GFP_KERNEL);
>  	if (!backend)
> @@ -812,7 +813,9 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
>  		 * on our device since the RAM mapping is at 0 for the DMA bus,
>  		 * unlike the CPU.
>  		 */
> -		drm->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
> +		ret = attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	backend->engine.node = dev->of_node;
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 04fbd4bf0ff9..e9cc1c2d47cd 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -754,7 +754,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
>  		return NULL;
>  
> -	if (!selftest_running && cfg->iommu_dev->dma_pfn_offset) {
> +	if (!selftest_running && cfg->iommu_dev->dma_pfn_offset_map) {
>  		dev_err(cfg->iommu_dev, "Cannot accommodate DMA offset for IOMMU page tables\n");
>  		return NULL;
>  	}
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index eff34ded6305..7212da5e1076 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -183,7 +184,9 @@ static int sun4i_csi_probe(struct platform_device *pdev)
>  			return ret;
>  	} else {
>  #ifdef PHYS_PFN_OFFSET
> -		csi->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
> +		ret = attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
> +		if (ret)
> +			return ret;
>  #endif
>  	}
>  
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 055eb0b8e396..2d66d415b6c3 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -898,7 +898,10 @@ static int sun6i_csi_probe(struct platform_device *pdev)
>  
>  	sdev->dev = &pdev->dev;
>  	/* The DMA bus has the memory mapped at 0 */
> -	sdev->dev->dma_pfn_offset = PHYS_OFFSET >> PAGE_SHIFT;
> +	ret = attach_uniform_dma_pfn_offset(sdev->dev,
> +					    PHYS_OFFSET >> PAGE_SHIFT);
> +	if (ret)
> +		return ret;
>  
>  	ret = sun6i_csi_resource_request(sdev, pdev);
>  	if (ret)
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 96d8cfb14a60..c89333b0a5fb 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -918,6 +918,70 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
>  }
>  EXPORT_SYMBOL(of_io_request_and_map);
>  
> +static int attach_dma_pfn_offset_map(struct device *dev,
> +				     struct device_node *node, int num_ranges)
> +{
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	struct dma_pfn_offset_region *r;
> +
> +	r = devm_kcalloc(dev, num_ranges + 1,
> +			 sizeof(struct dma_pfn_offset_region), GFP_KERNEL);
> +	if (!r)
> +		return -ENOMEM;
> +	dev->dma_pfn_offset_map = r;
> +	of_dma_range_parser_init(&parser, node);
> +
> +	/*
> +	 * Record all info for DMA ranges array.  We could
> +	 * just use the of_range struct, but if we did that it
> +	 * would require more calculations for phys_to_dma and
> +	 * dma_to_phys conversions.
> +	 */
> +	for_each_of_range(&parser, &range) {
> +		r->cpu_start = range.cpu_addr;
> +		r->cpu_end = r->cpu_start + range.size - 1;
> +		r->dma_start = range.bus_addr;
> +		r->dma_end = r->dma_start + range.size - 1;
> +		r->pfn_offset = PFN_DOWN(range.cpu_addr)
> +			- PFN_DOWN(range.bus_addr);
> +		r++;
> +	}
> +	return 0;
> +}
> +
> +
> +
> +/**
> + * attach_dma_pfn_offset - Assign scalar offset for all addresses.
> + * @dev:	device pointer; only needed for a corner case.
> + * @dma_pfn_offset:	offset to apply when converting from phys addr
      ^^^^^^^^^^^^^^^
This parameter name does not match.

> + *			to dma addr and vice versa.
> + *
> + * It returns -ENOMEM if out of memory, otherwise 0.

It can also return -ENODEV.  Why are we passing NULL dev pointers to
all these functions anyway?

> + */
> +int attach_uniform_dma_pfn_offset(struct device *dev, unsigned long pfn_offset)
> +{
> +	struct dma_pfn_offset_region *r;
> +
> +	if (!dev)
> +		return -ENODEV;
> +
> +	if (!pfn_offset)
> +		return 0;
> +
> +	r = devm_kcalloc(dev, 1, sizeof(struct dma_pfn_offset_region),
> +			 GFP_KERNEL);

Use:	r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);


> +	if (!r)
> +		return -ENOMEM;
> +
> +	r->uniform_offset = true;
> +	r->pfn_offset = pfn_offset;
> +
> +	return 0;
> +}

This function doesn't seem to do anything useful.  Is part of it
missing?

> +EXPORT_SYMBOL_GPL(attach_uniform_dma_pfn_offset);
> +

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
