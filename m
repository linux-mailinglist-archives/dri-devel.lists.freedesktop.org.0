Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577956C145
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460A010E7D5;
	Fri,  8 Jul 2022 20:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601DC10E7C2;
 Fri,  8 Jul 2022 20:29:22 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268JfemT020238;
 Fri, 8 Jul 2022 20:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=a27LFD0XUCFeWBki/GWAYUBj2rC1S/PoZhyoZvy6Tz4=;
 b=FsVFaLucNTeXl9rJlgyKRSdKFdOgoRjVQ7+u0qV0ZYKPC7Rtz3vl/WjKMOojzQWUzBbV
 SOCGKIcWnL/k3rLSN89d95aK0qTjq59NBaQ2ifJcEOAjM+kFeGXx3ymN+Da5HjnBlagK
 i6cnZYPHMBpRcRLdgFc3KJcD1aBTV9pjW58cvo2GO4oKQhaGj+XYd/+DF1vrWRgdR5LY
 uroCO6AXYSgKU9dxZwiQUp1NxFUzL1ROG1pk2sqm3IhN5QrrRfeGAGQpK19wIy0qynqA
 IEyGLbdMpUz9aAnkBXTFf7rLS7MfrmHGqStgn5qbY1BQTouw+hiI6xoQpK5WcM5rY2VM Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6q9upkse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:28:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 268KKJNa014428;
 Fri, 8 Jul 2022 20:28:16 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6q9upkry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:28:16 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 268KLaB4032586;
 Fri, 8 Jul 2022 20:28:14 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3h4ud5dbr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:28:14 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 268KSEeT32768392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Jul 2022 20:28:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B874124054;
 Fri,  8 Jul 2022 20:28:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3620A124052;
 Fri,  8 Jul 2022 20:28:06 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.38.121])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  8 Jul 2022 20:28:05 +0000 (GMT)
Message-ID: <c53ab47af42136fe632f428f18a88fada1f5f48e.camel@linux.ibm.com>
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
From: Eric Farman <farman@linux.ibm.com>
To: Nicolin Chen <nicolinc@nvidia.com>, kwankhede@nvidia.com, corbet@lwn.net, 
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, daniel@ffwll.ch, mjrosato@linux.ibm.com,
 pasic@linux.ibm.com, vneethv@linux.ibm.com, oberpar@linux.ibm.com,
 freude@linux.ibm.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
Date: Fri, 08 Jul 2022 16:27:59 -0400
In-Reply-To: <20220706062759.24946-5-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3sHgomJZFAJsHeLxq2S4Z_ADYhGoDoTC
X-Proofpoint-ORIG-GUID: s9hvQ7ld_fTm9mHwOUSSt9Ii6-rIRcB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_17,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080079
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-05 at 23:27 -0700, Nicolin Chen wrote:
> The vfio_pin/unpin_pages() so far accepted arrays of PFNs of user
> IOVA.
> Among all three callers, there was only one caller possibly passing
> in
> a non-contiguous PFN list, which is now ensured to have contiguous
> PFN
> inputs too.
> 
> Pass in the starting address with "iova" alone to simplify things, so
> callers no longer need to maintain a PFN list or to pin/unpin one
> page
> at a time. This also allows VFIO to use more efficient
> implementations
> of pin/unpin_pages.
> 
> For now, also update vfio_iommu_type1 to fit this new parameter too,
> while keeping its input intact (being user_iova) since we don't want
> to spend too much effort swapping its parameters and local variables
> at that level.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../driver-api/vfio-mediated-device.rst       |  4 +--
>  drivers/gpu/drm/i915/gvt/kvmgt.c              | 24 ++++++-----------
>  drivers/s390/cio/vfio_ccw_cp.c                |  4 +--

Acked-by: Eric Farman <farman@linux.ibm.com>

>  drivers/s390/crypto/vfio_ap_ops.c             |  9 +++----
>  drivers/vfio/vfio.c                           | 27 +++++++++------
> ----
>  drivers/vfio/vfio.h                           |  4 +--
>  drivers/vfio/vfio_iommu_type1.c               | 17 ++++++------
>  include/linux/vfio.h                          |  5 ++--
>  8 files changed, 40 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> b/Documentation/driver-api/vfio-mediated-device.rst
> index b0fdf76b339a..ea32a0f13ddb 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -262,10 +262,10 @@ Translation APIs for Mediated Devices
>  The following APIs are provided for translating user pfn to host pfn
> in a VFIO
>  driver::
>  
> -	int vfio_pin_pages(struct vfio_device *device, unsigned long
> *user_pfn,
> +	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>  				  int npage, int prot, unsigned long
> *phys_pfn);
>  
> -	void vfio_unpin_pages(struct vfio_device *device, unsigned long
> *user_pfn,
> +	void vfio_unpin_pages(struct vfio_device *device, dma_addr_t
> iova,
>  				    int npage);
>  
>  These functions call back into the back-end IOMMU module by using
> the pin_pages
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 8c67c9aba82d..ea6041fa48ac 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -231,16 +231,8 @@ static void
> intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
>  static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned
> long gfn,
>  		unsigned long size)
>  {
> -	int total_pages;
> -	int npage;
> -
> -	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
> -
> -	for (npage = 0; npage < total_pages; npage++) {
> -		unsigned long cur_gfn = gfn + npage;
> -
> -		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
> -	}
> +	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
> +			 roundup(size, PAGE_SIZE) / PAGE_SIZE);
>  }
>  
>  /* Pin a normal or compound guest page for dma. */
> @@ -258,14 +250,14 @@ static int gvt_pin_guest_page(struct intel_vgpu
> *vgpu, unsigned long gfn,
>  	 * on stack to hold pfns.
>  	 */
>  	for (npage = 0; npage < total_pages; npage++) {
> -		unsigned long cur_gfn = gfn + npage;
> +		dma_addr_t cur_iova = (gfn + npage) << PAGE_SHIFT;
>  		unsigned long pfn;
>  
> -		ret = vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
> +		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
>  				     IOMMU_READ | IOMMU_WRITE, &pfn);
>  		if (ret != 1) {
> -			gvt_vgpu_err("vfio_pin_pages failed for gfn
> 0x%lx, ret %d\n",
> -				     cur_gfn, ret);
> +			gvt_vgpu_err("vfio_pin_pages failed for iova
> %pad, ret %d\n",
> +				     &cur_iova, ret);
>  			goto err;
>  		}
>  
> @@ -309,7 +301,7 @@ static int gvt_dma_map_page(struct intel_vgpu
> *vgpu, unsigned long gfn,
>  	if (dma_mapping_error(dev, *dma_addr)) {
>  		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret
> %d\n",
>  			     page_to_pfn(page), ret);
> -		gvt_unpin_guest_page(vgpu, gfn, size);
> +		gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
>  		return -ENOMEM;
>  	}
>  
> @@ -322,7 +314,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu
> *vgpu, unsigned long gfn,
>  	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
>  
>  	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
> -	gvt_unpin_guest_page(vgpu, gfn, size);
> +	gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
>  }
>  
>  static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu
> *vgpu,
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c
> b/drivers/s390/cio/vfio_ccw_cp.c
> index 3b94863ad24e..a739262f988d 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -114,7 +114,7 @@ static void pfn_array_unpin(struct pfn_array *pa,
>  			continue;
>  		}
>  
> -		vfio_unpin_pages(vdev, first, npage);
> +		vfio_unpin_pages(vdev, *first << PAGE_SHIFT, npage);
>  		unpinned += npage;
>  		npage = 1;
>  	}
> @@ -146,7 +146,7 @@ static int pfn_array_pin(struct pfn_array *pa,
> struct vfio_device *vdev)
>  			continue;
>  		}
>  
> -		ret = vfio_pin_pages(vdev, first, npage,
> +		ret = vfio_pin_pages(vdev, *first << PAGE_SHIFT, npage,
>  				     IOMMU_READ | IOMMU_WRITE,
>  				     &pa->pa_pfn[pinned]);
>  		if (ret < 0) {
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index bb869b28cebd..8a2018ab3cf0 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct
> vfio_ap_queue *q)
>  		q->saved_isc = VFIO_AP_ISC_INVALID;
>  	}
>  	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn,
> 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn <<
> PAGE_SHIFT, 1);
>  		q->saved_pfn = 0;
>  	}
>  }
> @@ -258,7 +258,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  		return status;
>  	}
>  
> -	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
> +	ret = vfio_pin_pages(&q->matrix_mdev->vdev, g_pfn <<
> PAGE_SHIFT, 1,
>  			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
>  	switch (ret) {
>  	case 1:
> @@ -301,7 +301,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  		break;
>  	case AP_RESPONSE_OTHERWISE_CHANGED:
>  		/* We could not modify IRQ setings: clear new
> configuration */
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, g_pfn <<
> PAGE_SHIFT, 1);
>  		kvm_s390_gisc_unregister(kvm, isc);
>  		break;
>  	default:
> @@ -1248,9 +1248,8 @@ static int vfio_ap_mdev_iommu_notifier(struct
> notifier_block *nb,
>  
>  	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
>  		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
>  
> -		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
> +		vfio_unpin_pages(&matrix_mdev->vdev, unmap->iova, 1);
>  		return NOTIFY_OK;
>  	}
>  
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 01f45ec70a3d..813b517c973e 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1910,17 +1910,17 @@ int vfio_set_irqs_validate_and_prepare(struct
> vfio_irq_set *hdr, int num_irqs,
>  EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
>  
>  /*
> - * Pin a set of guest PFNs and return their associated host PFNs for
> local
> + * Pin contiguous guest pages and return their associated host pages
> for local
>   * domain only.
>   * @device [in]  : device
> - * @user_pfn [in]: array of user/guest PFNs to be pinned.
> - * @npage [in]   : count of elements in user_pfn array.  This count
> should not
> + * @iova [in]    : starting IOVA of user/guest pages to be pinned.
> + * @npage [in]   : count of pages to be pinned.  This count should
> not
>   *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
>   * @prot [in]    : protection flags
>   * @phys_pfn[out]: array of host PFNs
>   * Return error or number of pages pinned.
>   */
> -int vfio_pin_pages(struct vfio_device *device, unsigned long
> *user_pfn,
> +int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>  		   int npage, int prot, unsigned long *phys_pfn)
>  {
>  	struct vfio_container *container;
> @@ -1928,8 +1928,7 @@ int vfio_pin_pages(struct vfio_device *device,
> unsigned long *user_pfn,
>  	struct vfio_iommu_driver *driver;
>  	int ret;
>  
> -	if (!user_pfn || !phys_pfn || !npage ||
> -	    !vfio_assert_device_open(device))
> +	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
>  		return -EINVAL;
>  
>  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> @@ -1943,7 +1942,7 @@ int vfio_pin_pages(struct vfio_device *device,
> unsigned long *user_pfn,
>  	driver = container->iommu_driver;
>  	if (likely(driver && driver->ops->pin_pages))
>  		ret = driver->ops->pin_pages(container->iommu_data,
> -					     group->iommu_group,
> user_pfn,
> +					     group->iommu_group, iova,
>  					     npage, prot, phys_pfn);
>  	else
>  		ret = -ENOTTY;
> @@ -1953,20 +1952,18 @@ int vfio_pin_pages(struct vfio_device
> *device, unsigned long *user_pfn,
>  EXPORT_SYMBOL(vfio_pin_pages);
>  
>  /*
> - * Unpin set of host PFNs for local domain only.
> + * Unpin contiguous host pages for local domain only.
>   * @device [in]  : device
> - * @user_pfn [in]: array of user/guest PFNs to be unpinned. Number
> of user/guest
> - *		   PFNs should not be greater than
> VFIO_PIN_PAGES_MAX_ENTRIES.
> - * @npage [in]   : count of elements in user_pfn array.  This count
> should not
> + * @iova [in]    : starting address of user/guest pages to be
> unpinned.
> + * @npage [in]   : count of pages to be unpinned.  This count should
> not
>   *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>   */
> -void vfio_unpin_pages(struct vfio_device *device, unsigned long
> *user_pfn,
> -		      int npage)
> +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
> int npage)
>  {
>  	struct vfio_container *container;
>  	struct vfio_iommu_driver *driver;
>  
> -	if (WARN_ON_ONCE(!user_pfn || !npage ||
> !vfio_assert_device_open(device)))
> +	if (WARN_ON_ONCE(!npage || !vfio_assert_device_open(device)))
>  		return;
>  
>  	if (WARN_ON_ONCE(npage > VFIO_PIN_PAGES_MAX_ENTRIES))
> @@ -1979,7 +1976,7 @@ void vfio_unpin_pages(struct vfio_device
> *device, unsigned long *user_pfn,
>  	if (WARN_ON_ONCE(unlikely(!driver || !driver->ops-
> >unpin_pages)))
>  		return;
>  
> -	driver->ops->unpin_pages(container->iommu_data, user_pfn,
> npage);
> +	driver->ops->unpin_pages(container->iommu_data, iova, npage);
>  }
>  EXPORT_SYMBOL(vfio_unpin_pages);
>  
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index bef4edf58138..dbcd0e8c031b 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -50,11 +50,11 @@ struct vfio_iommu_driver_ops {
>  					struct iommu_group *group);
>  	int		(*pin_pages)(void *iommu_data,
>  				     struct iommu_group *group,
> -				     unsigned long *user_pfn,
> +				     dma_addr_t user_iova,
>  				     int npage, int prot,
>  				     unsigned long *phys_pfn);
>  	void		(*unpin_pages)(void *iommu_data,
> -				       unsigned long *user_pfn, int
> npage);
> +				       dma_addr_t user_iova, int
> npage);
>  	int		(*register_notifier)(void *iommu_data,
>  					     unsigned long *events,
>  					     struct notifier_block
> *nb);
> diff --git a/drivers/vfio/vfio_iommu_type1.c
> b/drivers/vfio/vfio_iommu_type1.c
> index 08613edaf722..f10d0c4b1f26 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -828,7 +828,7 @@ static int vfio_unpin_page_external(struct
> vfio_dma *dma, dma_addr_t iova,
>  
>  static int vfio_iommu_type1_pin_pages(void *iommu_data,
>  				      struct iommu_group *iommu_group,
> -				      unsigned long *user_pfn,
> +				      dma_addr_t user_iova,
>  				      int npage, int prot,
>  				      unsigned long *phys_pfn)
>  {
> @@ -840,7 +840,7 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  	bool do_accounting;
>  	dma_addr_t iova;
>  
> -	if (!iommu || !user_pfn || !phys_pfn)
> +	if (!iommu || !phys_pfn)
>  		return -EINVAL;
>  
>  	/* Supported for v2 version only */
> @@ -856,7 +856,7 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  again:
>  	if (iommu->vaddr_invalid_count) {
>  		for (i = 0; i < npage; i++) {
> -			iova = user_pfn[i] << PAGE_SHIFT;
> +			iova = user_iova + PAGE_SIZE * i;
>  			ret = vfio_find_dma_valid(iommu, iova,
> PAGE_SIZE, &dma);
>  			if (ret < 0)
>  				goto pin_done;
> @@ -881,7 +881,7 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  	for (i = 0; i < npage; i++) {
>  		struct vfio_pfn *vpfn;
>  
> -		iova = user_pfn[i] << PAGE_SHIFT;
> +		iova = user_iova + PAGE_SIZE * i;
>  		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>  		if (!dma) {
>  			ret = -EINVAL;
> @@ -938,7 +938,7 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  	for (j = 0; j < i; j++) {
>  		dma_addr_t iova;
>  
> -		iova = user_pfn[j] << PAGE_SHIFT;
> +		iova = user_iova + PAGE_SIZE * j;
>  		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>  		vfio_unpin_page_external(dma, iova, do_accounting);
>  		phys_pfn[j] = 0;
> @@ -949,13 +949,13 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  }
>  
>  static void vfio_iommu_type1_unpin_pages(void *iommu_data,
> -					 unsigned long *user_pfn, int
> npage)
> +					dma_addr_t user_iova, int
> npage)
>  {
>  	struct vfio_iommu *iommu = iommu_data;
>  	bool do_accounting;
>  	int i;
>  
> -	if (WARN_ON_ONCE(!iommu || !user_pfn || npage <= 0))
> +	if (WARN_ON_ONCE(!iommu || npage <= 0))
>  		return;
>  
>  	/* Supported for v2 version only */
> @@ -966,10 +966,9 @@ static void vfio_iommu_type1_unpin_pages(void
> *iommu_data,
>  
>  	do_accounting = list_empty(&iommu->domain_list);
>  	for (i = 0; i < npage; i++) {
> +		dma_addr_t iova = user_iova + PAGE_SIZE * i;
>  		struct vfio_dma *dma;
> -		dma_addr_t iova;
>  
> -		iova = user_pfn[i] << PAGE_SHIFT;
>  		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>  		if (!dma)
>  			break;
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index d0844ecdc961..c3e441c0bf4b 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -147,10 +147,9 @@ bool vfio_file_has_dev(struct file *file, struct
> vfio_device *device);
>  
>  #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned
> long))
>  
> -int vfio_pin_pages(struct vfio_device *device, unsigned long
> *user_pfn,
> +int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>  		   int npage, int prot, unsigned long *phys_pfn);
> -void vfio_unpin_pages(struct vfio_device *device, unsigned long
> *user_pfn,
> -		      int npage);
> +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
> int npage);
>  int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>  		void *data, size_t len, bool write);
>  

