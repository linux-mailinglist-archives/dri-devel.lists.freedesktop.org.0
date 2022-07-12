Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA2571C5A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF44994B6E;
	Tue, 12 Jul 2022 14:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C794B6E;
 Tue, 12 Jul 2022 14:26:04 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CDci74002818;
 Tue, 12 Jul 2022 14:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HgJT6Y2RbRY+lttGf0HJ6EOk4poibJeDz9t1DzIoO0o=;
 b=T0cMbqqORhw2hb5EQSqlvz/70eGEzm9EGQaqgc4py77Ug7wMaAF6Da95IqkOrr3kpxXi
 4ktYMZxz11BMBtI+HEnEhV7ouCWNWcDuRnPw2YPVO+PcBbnzynvkFUvgjspDEbFkS6Sb
 fRJjf3TX5RCRfQP3duQy64jMgP4zy+rYE6Rza6wjTcoj1y8d3m3rGSeUJGNJ7wOdShKy
 tphJuXKOXRcV69ivrC5luDBA3mdq/iXUiULB2lpTfGM/hDqXMZ3PAbKCiNZve2w0Qf2a
 6+SjOBAEo88LFFDcE1uz9sBc7QJt+9UnqmdWRe5Qov5hurTIRbc7R2QknBFophODlxsP Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9642yydw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 14:25:56 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CBkULd007876;
 Tue, 12 Jul 2022 14:25:55 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9642yyd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 14:25:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CEKAHr004402;
 Tue, 12 Jul 2022 14:25:53 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3h71a9upbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 14:25:53 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26CEPqrv21234000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 14:25:52 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB52F28058;
 Tue, 12 Jul 2022 14:25:52 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB64B28066;
 Tue, 12 Jul 2022 14:25:50 +0000 (GMT)
Received: from [9.65.200.23] (unknown [9.65.200.23])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 14:25:50 +0000 (GMT)
Message-ID: <88849909-5a27-77c2-f0cf-31e95278720d@linux.ibm.com>
Date: Tue, 12 Jul 2022 10:25:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 05/10] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, kwankhede@nvidia.com, corbet@lwn.net, 
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, daniel@ffwll.ch, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, pasic@linux.ibm.com, vneethv@linux.ibm.com,
 oberpar@linux.ibm.com, freude@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220708224427.1245-6-nicolinc@nvidia.com>
From: Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20220708224427.1245-6-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2KE3a1OKvxx59M4K9VQjPKxtTSDqoxpK
X-Proofpoint-GUID: D_PQP2pC0jSCLVFEeS89NydaoXZ1053X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207120055
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

Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>

On 7/8/22 6:44 PM, Nicolin Chen wrote:
> The vfio_pin/unpin_pages() so far accepted arrays of PFNs of user IOVA.
> Among all three callers, there was only one caller possibly passing in
> a non-contiguous PFN list, which is now ensured to have contiguous PFN
> inputs too.
>
> Pass in the starting address with "iova" alone to simplify things, so
> callers no longer need to maintain a PFN list or to pin/unpin one page
> at a time. This also allows VFIO to use more efficient implementations
> of pin/unpin_pages.
>
> For now, also update vfio_iommu_type1 to fit this new parameter too,
> while keeping its input intact (being user_iova) since we don't want
> to spend too much effort swapping its parameters and local variables
> at that level.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Eric Farman <farman@linux.ibm.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Eric Farman <farman@linux.ibm.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   .../driver-api/vfio-mediated-device.rst       |  4 +--
>   drivers/gpu/drm/i915/gvt/kvmgt.c              | 22 ++++++---------
>   drivers/s390/cio/vfio_ccw_cp.c                |  4 +--
>   drivers/s390/crypto/vfio_ap_ops.c             |  9 +++----
>   drivers/vfio/vfio.c                           | 27 +++++++++----------
>   drivers/vfio/vfio.h                           |  4 +--
>   drivers/vfio/vfio_iommu_type1.c               | 15 +++++------
>   include/linux/vfio.h                          |  5 ++--
>   8 files changed, 39 insertions(+), 51 deletions(-)
>
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> index 4307421dcaa0..af31eaf836e8 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -260,10 +260,10 @@ Translation APIs for Mediated Devices
>   The following APIs are provided for translating user pfn to host pfn in a VFIO
>   driver::
>   
> -	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>   				  int npage, int prot, unsigned long *phys_pfn);
>   
> -	void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +	void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
>   				    int npage);
>   
>   These functions call back into the back-end IOMMU module by using the pin_pages
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 7ce7b09aa5b2..d3ac8383d759 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -231,14 +231,8 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
>   static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   		unsigned long size)
>   {
> -	int total_pages = DIV_ROUND_UP(size, PAGE_SIZE);
> -	int npage;
> -
> -	for (npage = 0; npage < total_pages; npage++) {
> -		unsigned long cur_gfn = gfn + npage;
> -
> -		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
> -	}
> +	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
> +			 DIV_ROUND_UP(size, PAGE_SIZE));
>   }
>   
>   /* Pin a normal or compound guest page for dma. */
> @@ -255,14 +249,14 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   	 * on stack to hold pfns.
>   	 */
>   	for (npage = 0; npage < total_pages; npage++) {
> -		unsigned long cur_gfn = gfn + npage;
> +		dma_addr_t cur_iova = (gfn + npage) << PAGE_SHIFT;
>   		unsigned long pfn;
>   
> -		ret = vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
> +		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
>   				     IOMMU_READ | IOMMU_WRITE, &pfn);
>   		if (ret != 1) {
> -			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
> -				     cur_gfn, ret);
> +			gvt_vgpu_err("vfio_pin_pages failed for iova %pad, ret %d\n",
> +				     &cur_iova, ret);
>   			goto err;
>   		}
>   
> @@ -306,7 +300,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   	if (dma_mapping_error(dev, *dma_addr)) {
>   		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
>   			     page_to_pfn(page), ret);
> -		gvt_unpin_guest_page(vgpu, gfn, size);
> +		gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
>   		return -ENOMEM;
>   	}
>   
> @@ -319,7 +313,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
>   
>   	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
> -	gvt_unpin_guest_page(vgpu, gfn, size);
> +	gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
>   }
>   
>   static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
> index 3b94863ad24e..a739262f988d 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -114,7 +114,7 @@ static void pfn_array_unpin(struct pfn_array *pa,
>   			continue;
>   		}
>   
> -		vfio_unpin_pages(vdev, first, npage);
> +		vfio_unpin_pages(vdev, *first << PAGE_SHIFT, npage);
>   		unpinned += npage;
>   		npage = 1;
>   	}
> @@ -146,7 +146,7 @@ static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
>   			continue;
>   		}
>   
> -		ret = vfio_pin_pages(vdev, first, npage,
> +		ret = vfio_pin_pages(vdev, *first << PAGE_SHIFT, npage,
>   				     IOMMU_READ | IOMMU_WRITE,
>   				     &pa->pa_pfn[pinned]);
>   		if (ret < 0) {
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index bb869b28cebd..8a2018ab3cf0 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
>   		q->saved_isc = VFIO_AP_ISC_INVALID;
>   	}
>   	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn << PAGE_SHIFT, 1);
>   		q->saved_pfn = 0;
>   	}
>   }
> @@ -258,7 +258,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   		return status;
>   	}
>   
> -	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
> +	ret = vfio_pin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1,
>   			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
>   	switch (ret) {
>   	case 1:
> @@ -301,7 +301,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   		break;
>   	case AP_RESPONSE_OTHERWISE_CHANGED:
>   		/* We could not modify IRQ setings: clear new configuration */
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1);
>   		kvm_s390_gisc_unregister(kvm, isc);
>   		break;
>   	default:
> @@ -1248,9 +1248,8 @@ static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
>   
>   	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
>   		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
>   
> -		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
> +		vfio_unpin_pages(&matrix_mdev->vdev, unmap->iova, 1);
>   		return NOTIFY_OK;
>   	}
>   
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index ad90adbfddc8..ee4d45c2f210 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1915,17 +1915,17 @@ int vfio_set_irqs_validate_and_prepare(struct vfio_irq_set *hdr, int num_irqs,
>   EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
>   
>   /*
> - * Pin a set of guest PFNs and return their associated host PFNs for local
> + * Pin contiguous user pages and return their associated host pages for local
>    * domain only.
>    * @device [in]  : device
> - * @user_pfn [in]: array of user/guest PFNs to be pinned.
> - * @npage [in]   : count of elements in user_pfn array.  This count should not
> - *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
> + * @iova [in]    : starting IOVA of user pages to be pinned.
> + * @npage [in]   : count of pages to be pinned.  This count should not
> + *		   be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>    * @prot [in]    : protection flags
>    * @phys_pfn[out]: array of host PFNs
>    * Return error or number of pages pinned.
>    */
> -int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>   		   int npage, int prot, unsigned long *phys_pfn)
>   {
>   	struct vfio_container *container;
> @@ -1933,8 +1933,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   	struct vfio_iommu_driver *driver;
>   	int ret;
>   
> -	if (!user_pfn || !phys_pfn || !npage ||
> -	    !vfio_assert_device_open(device))
> +	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
>   		return -EINVAL;
>   
>   	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> @@ -1948,7 +1947,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   	driver = container->iommu_driver;
>   	if (likely(driver && driver->ops->pin_pages))
>   		ret = driver->ops->pin_pages(container->iommu_data,
> -					     group->iommu_group, user_pfn,
> +					     group->iommu_group, iova,
>   					     npage, prot, phys_pfn);
>   	else
>   		ret = -ENOTTY;
> @@ -1958,15 +1957,13 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   EXPORT_SYMBOL(vfio_pin_pages);
>   
>   /*
> - * Unpin set of host PFNs for local domain only.
> + * Unpin contiguous host pages for local domain only.
>    * @device [in]  : device
> - * @user_pfn [in]: array of user/guest PFNs to be unpinned. Number of user/guest
> - *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
> - * @npage [in]   : count of elements in user_pfn array.  This count should not
> + * @iova [in]    : starting address of user pages to be unpinned.
> + * @npage [in]   : count of pages to be unpinned.  This count should not
>    *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>    */
> -void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		      int npage)
> +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage)
>   {
>   	struct vfio_container *container;
>   	struct vfio_iommu_driver *driver;
> @@ -1981,7 +1978,7 @@ void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   	container = device->group->container;
>   	driver = container->iommu_driver;
>   
> -	driver->ops->unpin_pages(container->iommu_data, user_pfn, npage);
> +	driver->ops->unpin_pages(container->iommu_data, iova, npage);
>   }
>   EXPORT_SYMBOL(vfio_unpin_pages);
>   
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index bef4edf58138..dbcd0e8c031b 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -50,11 +50,11 @@ struct vfio_iommu_driver_ops {
>   					struct iommu_group *group);
>   	int		(*pin_pages)(void *iommu_data,
>   				     struct iommu_group *group,
> -				     unsigned long *user_pfn,
> +				     dma_addr_t user_iova,
>   				     int npage, int prot,
>   				     unsigned long *phys_pfn);
>   	void		(*unpin_pages)(void *iommu_data,
> -				       unsigned long *user_pfn, int npage);
> +				       dma_addr_t user_iova, int npage);
>   	int		(*register_notifier)(void *iommu_data,
>   					     unsigned long *events,
>   					     struct notifier_block *nb);
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index cfeea4efd625..c5ff9970edc4 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -828,7 +828,7 @@ static int vfio_unpin_page_external(struct vfio_dma *dma, dma_addr_t iova,
>   
>   static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   				      struct iommu_group *iommu_group,
> -				      unsigned long *user_pfn,
> +				      dma_addr_t user_iova,
>   				      int npage, int prot,
>   				      unsigned long *phys_pfn)
>   {
> @@ -840,7 +840,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	bool do_accounting;
>   	dma_addr_t iova;
>   
> -	if (!iommu || !user_pfn || !phys_pfn)
> +	if (!iommu || !phys_pfn)
>   		return -EINVAL;
>   
>   	/* Supported for v2 version only */
> @@ -856,7 +856,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   again:
>   	if (iommu->vaddr_invalid_count) {
>   		for (i = 0; i < npage; i++) {
> -			iova = user_pfn[i] << PAGE_SHIFT;
> +			iova = user_iova + PAGE_SIZE * i;
>   			ret = vfio_find_dma_valid(iommu, iova, PAGE_SIZE, &dma);
>   			if (ret < 0)
>   				goto pin_done;
> @@ -881,7 +881,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	for (i = 0; i < npage; i++) {
>   		struct vfio_pfn *vpfn;
>   
> -		iova = user_pfn[i] << PAGE_SHIFT;
> +		iova = user_iova + PAGE_SIZE * i;
>   		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>   		if (!dma) {
>   			ret = -EINVAL;
> @@ -938,7 +938,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	for (j = 0; j < i; j++) {
>   		dma_addr_t iova;
>   
> -		iova = user_pfn[j] << PAGE_SHIFT;
> +		iova = user_iova + PAGE_SIZE * j;
>   		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>   		vfio_unpin_page_external(dma, iova, do_accounting);
>   		phys_pfn[j] = 0;
> @@ -949,7 +949,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   }
>   
>   static void vfio_iommu_type1_unpin_pages(void *iommu_data,
> -					 unsigned long *user_pfn, int npage)
> +					 dma_addr_t user_iova, int npage)
>   {
>   	struct vfio_iommu *iommu = iommu_data;
>   	bool do_accounting;
> @@ -963,10 +963,9 @@ static void vfio_iommu_type1_unpin_pages(void *iommu_data,
>   
>   	do_accounting = list_empty(&iommu->domain_list);
>   	for (i = 0; i < npage; i++) {
> +		dma_addr_t iova = user_iova + PAGE_SIZE * i;
>   		struct vfio_dma *dma;
> -		dma_addr_t iova;
>   
> -		iova = user_pfn[i] << PAGE_SHIFT;
>   		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>   		if (!dma)
>   			break;
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 5348ef353029..2cefb63751f9 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -157,10 +157,9 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
>   
>   #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
>   
> -int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>   		   int npage, int prot, unsigned long *phys_pfn);
> -void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		      int npage);
> +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage);
>   int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>   		void *data, size_t len, bool write);
>   
