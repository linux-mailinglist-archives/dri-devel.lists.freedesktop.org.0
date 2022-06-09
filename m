Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0464545418
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C6112B6AD;
	Thu,  9 Jun 2022 18:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01C212A77F;
 Thu,  9 Jun 2022 13:21:37 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259BEm16031511;
 Thu, 9 Jun 2022 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rzzGwaoVnomT+36F3T6Eg34krRVGt2KBckhOCUSR8I8=;
 b=WE/0j0ajoZ5vC1HPKUvEKNWIlT1aGv807hK+qoVRX+dyHGzuB/XHymxb6ZwGW8MIPANb
 ZDhsNJcGbVrmzo4HMRiGigMDEbQCR4xbVoaQpCqvc7PCc1LwGT0ikChgCA6WqKRGmSTS
 KhSR3Qj2ZS/P9iG7L5AXzTkh2O6FusNvECo3OG20q6jbB3eo5II3AluwkApDOA6OWV9i
 /7gCwC8cFwUPLDr5K1euoXP93maHLas8YZtqaYeHeCM8jf8Zt/eF7VkKBiPxzodx52Kf
 2WwLgV7BHAcClNsqj8FdKDJjTMtOiWndoonnK2btMYF3JZmU+KiiuowkOGKm0iECeQFp LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkcuj6evj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 13:21:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 259DA1ki023713;
 Thu, 9 Jun 2022 13:21:16 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkcuj6euy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 13:21:16 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 259DKVbF009375;
 Thu, 9 Jun 2022 13:21:14 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3gfy1a29pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 13:21:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 259DLDRI23462216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jun 2022 13:21:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C36ABE051;
 Thu,  9 Jun 2022 13:21:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26189BE054;
 Thu,  9 Jun 2022 13:21:11 +0000 (GMT)
Received: from [9.160.55.57] (unknown [9.160.55.57])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jun 2022 13:21:11 +0000 (GMT)
Message-ID: <afed2d74-3416-b92a-20b6-2c58504091cd@linux.ibm.com>
Date: Thu, 9 Jun 2022 09:21:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
From: Tony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A74R8vrssxzDbi9mAIs2DHjt6psXSMeM
X-Proofpoint-ORIG-GUID: pMkEAiYiaWt9kjGeilmjbKb3xCTKXe92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_10,2022-06-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090053
X-Mailman-Approved-At: Thu, 09 Jun 2022 18:26:01 +0000
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>

On 6/7/22 7:02 PM, Jason Gunthorpe wrote:
> Instead of having drivers register the notifier with explicit code just
> have them provide a dma_unmap callback op in their driver ops and rely on
> the core code to wire it up.
>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
>   drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 ++++-----------
>   drivers/s390/cio/vfio_ccw_ops.c       |  41 ++-------
>   drivers/s390/cio/vfio_ccw_private.h   |   1 -
>   drivers/s390/crypto/vfio_ap_ops.c     |  53 ++---------
>   drivers/s390/crypto/vfio_ap_private.h |   3 -
>   drivers/vfio/vfio.c                   | 126 +++++++++-----------------
>   drivers/vfio/vfio.h                   |   5 +
>   include/linux/vfio.h                  |  21 +----
>   9 files changed, 87 insertions(+), 239 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> index aee1a45da74bcb..705689e6401197 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -226,7 +226,6 @@ struct intel_vgpu {
>   	unsigned long nr_cache_entries;
>   	struct mutex cache_lock;
>   
> -	struct notifier_block iommu_notifier;
>   	atomic_t released;
>   
>   	struct kvm_page_track_notifier_node track_node;
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index e2f6c56ab3420c..ecd5bb37b63a2a 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -729,34 +729,25 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num)
>   	return ret;
>   }
>   
> -static int intel_vgpu_iommu_notifier(struct notifier_block *nb,
> -				     unsigned long action, void *data)
> +static void intel_vgpu_dma_unmap(struct vfio_device *vfio_dev, u64 iova,
> +				 u64 length)
>   {
> -	struct intel_vgpu *vgpu =
> -		container_of(nb, struct intel_vgpu, iommu_notifier);
> -
> -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -		struct gvt_dma *entry;
> -		unsigned long iov_pfn, end_iov_pfn;
> +	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
> +	struct gvt_dma *entry;
> +	u64 iov_pfn = iova >> PAGE_SHIFT;
> +	u64 end_iov_pfn = iov_pfn + length / PAGE_SIZE;
>   
> -		iov_pfn = unmap->iova >> PAGE_SHIFT;
> -		end_iov_pfn = iov_pfn + unmap->size / PAGE_SIZE;
> +	mutex_lock(&vgpu->cache_lock);
> +	for (; iov_pfn < end_iov_pfn; iov_pfn++) {
> +		entry = __gvt_cache_find_gfn(vgpu, iov_pfn);
> +		if (!entry)
> +			continue;
>   
> -		mutex_lock(&vgpu->cache_lock);
> -		for (; iov_pfn < end_iov_pfn; iov_pfn++) {
> -			entry = __gvt_cache_find_gfn(vgpu, iov_pfn);
> -			if (!entry)
> -				continue;
> -
> -			gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
> -					   entry->size);
> -			__gvt_cache_remove_entry(vgpu, entry);
> -		}
> -		mutex_unlock(&vgpu->cache_lock);
> +		gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
> +				   entry->size);
> +		__gvt_cache_remove_entry(vgpu, entry);
>   	}
> -
> -	return NOTIFY_OK;
> +	mutex_unlock(&vgpu->cache_lock);
>   }
>   
>   static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
> @@ -783,36 +774,20 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu)
>   static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
>   {
>   	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
> -	unsigned long events;
> -	int ret;
> -
> -	vgpu->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
>   
> -	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret = vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
> -				     &vgpu->iommu_notifier);
> -	if (ret != 0) {
> -		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
> -			ret);
> -		goto out;
> -	}
> -
> -	ret = -EEXIST;
>   	if (vgpu->attached)
> -		goto undo_iommu;
> +		return -EEXIST;
>   
> -	ret = -ESRCH;
>   	if (!vgpu->vfio_device.kvm ||
>   	    vgpu->vfio_device.kvm->mm != current->mm) {
>   		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
> -		goto undo_iommu;
> +		return -ESRCH;
>   	}
>   
>   	kvm_get_kvm(vgpu->vfio_device.kvm);
>   
> -	ret = -EEXIST;
>   	if (__kvmgt_vgpu_exist(vgpu))
> -		goto undo_iommu;
> +		return -EEXIST;
>   
>   	vgpu->attached = true;
>   
> @@ -831,12 +806,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
>   
>   	atomic_set(&vgpu->released, 0);
>   	return 0;
> -
> -undo_iommu:
> -	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
> -				 &vgpu->iommu_notifier);
> -out:
> -	return ret;
>   }
>   
>   static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
> @@ -853,8 +822,6 @@ static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
>   static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
>   {
>   	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
> -	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
> -	int ret;
>   
>   	if (!vgpu->attached)
>   		return;
> @@ -864,11 +831,6 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
>   
>   	intel_gvt_release_vgpu(vgpu);
>   
> -	ret = vfio_unregister_notifier(&vgpu->vfio_device, VFIO_IOMMU_NOTIFY,
> -				       &vgpu->iommu_notifier);
> -	drm_WARN(&i915->drm, ret,
> -		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
> -
>   	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
>   
>   	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
> @@ -1610,6 +1572,7 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
>   	.write		= intel_vgpu_write,
>   	.mmap		= intel_vgpu_mmap,
>   	.ioctl		= intel_vgpu_ioctl,
> +	.dma_unmap	= intel_vgpu_dma_unmap,
>   };
>   
>   static int intel_vgpu_probe(struct mdev_device *mdev)
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index b49e2e9db2dc6f..09e0ce7b72324c 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
>   	return ret;
>   }
>   
> -static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
> -				  unsigned long action,
> -				  void *data)
> +static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 length)
>   {
>   	struct vfio_ccw_private *private =
> -		container_of(nb, struct vfio_ccw_private, nb);
> -
> -	/*
> -	 * Vendor drivers MUST unpin pages in response to an
> -	 * invalidation.
> -	 */
> -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -
> -		if (!cp_iova_pinned(&private->cp, unmap->iova))
> -			return NOTIFY_OK;
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>   
> -		if (vfio_ccw_mdev_reset(private))
> -			return NOTIFY_BAD;
> +	/* Drivers MUST unpin pages in response to an invalidation. */
> +	if (!cp_iova_pinned(&private->cp, iova))
> +		return;
>   
> -		cp_free(&private->cp);
> -		return NOTIFY_OK;
> -	}
> +	if (vfio_ccw_mdev_reset(private))
> +		return;
>   
> -	return NOTIFY_DONE;
> +	cp_free(&private->cp);
>   }
>   
>   static ssize_t name_show(struct mdev_type *mtype,
> @@ -178,19 +166,11 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
>   {
>   	struct vfio_ccw_private *private =
>   		container_of(vdev, struct vfio_ccw_private, vdev);
> -	unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
>   	int ret;
>   
> -	private->nb.notifier_call = vfio_ccw_mdev_notifier;
> -
> -	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
> -				     &events, &private->nb);
> -	if (ret)
> -		return ret;
> -
>   	ret = vfio_ccw_register_async_dev_regions(private);
>   	if (ret)
> -		goto out_unregister;
> +		return ret;
>   
>   	ret = vfio_ccw_register_schib_dev_regions(private);
>   	if (ret)
> @@ -204,7 +184,6 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
>   
>   out_unregister:
>   	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>   	return ret;
>   }
>   
> @@ -222,7 +201,6 @@ static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
>   
>   	cp_free(&private->cp);
>   	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>   }
>   
>   static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
> @@ -645,6 +623,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
>   	.write = vfio_ccw_mdev_write,
>   	.ioctl = vfio_ccw_mdev_ioctl,
>   	.request = vfio_ccw_mdev_request,
> +	.dma_unmap = vfio_ccw_dma_unmap,
>   };
>   
>   struct mdev_driver vfio_ccw_mdev_driver = {
> diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
> index 7272eb78861244..2627791c9006d4 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -98,7 +98,6 @@ struct vfio_ccw_private {
>   	struct completion	*completion;
>   	atomic_t		avail;
>   	struct mdev_device	*mdev;
> -	struct notifier_block	nb;
>   	struct ccw_io_region	*io_region;
>   	struct mutex		io_mutex;
>   	struct vfio_ccw_region *region;
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index a7d2a95796d360..bb1a1677c5c230 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -1226,34 +1226,14 @@ static int vfio_ap_mdev_set_kvm(struct ap_matrix_mdev *matrix_mdev,
>   	return 0;
>   }
>   
> -/**
> - * vfio_ap_mdev_iommu_notifier - IOMMU notifier callback
> - *
> - * @nb: The notifier block
> - * @action: Action to be taken
> - * @data: data associated with the request
> - *
> - * For an UNMAP request, unpin the guest IOVA (the NIB guest address we
> - * pinned before). Other requests are ignored.
> - *
> - * Return: for an UNMAP request, NOFITY_OK; otherwise NOTIFY_DONE.
> - */
> -static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
> -				       unsigned long action, void *data)
> +static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
> +				   u64 length)
>   {
> -	struct ap_matrix_mdev *matrix_mdev;
> -
> -	matrix_mdev = container_of(nb, struct ap_matrix_mdev, iommu_notifier);
> -
> -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
> -
> -		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
> -		return NOTIFY_OK;
> -	}
> +	struct ap_matrix_mdev *matrix_mdev =
> +		container_of(vdev, struct ap_matrix_mdev, vdev);
> +	unsigned long g_pfn = iova >> PAGE_SHIFT;
>   
> -	return NOTIFY_DONE;
> +	vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
>   }
>   
>   /**
> @@ -1380,27 +1360,11 @@ static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
>   {
>   	struct ap_matrix_mdev *matrix_mdev =
>   		container_of(vdev, struct ap_matrix_mdev, vdev);
> -	unsigned long events;
> -	int ret;
>   
>   	if (!vdev->kvm)
>   		return -EINVAL;
>   
> -	ret = vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
> -	if (ret)
> -		return ret;
> -
> -	matrix_mdev->iommu_notifier.notifier_call = vfio_ap_mdev_iommu_notifier;
> -	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
> -				     &matrix_mdev->iommu_notifier);
> -	if (ret)
> -		goto err_kvm;
> -	return 0;
> -
> -err_kvm:
> -	vfio_ap_mdev_unset_kvm(matrix_mdev);
> -	return ret;
> +	return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
>   }
>   
>   static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
> @@ -1408,8 +1372,6 @@ static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
>   	struct ap_matrix_mdev *matrix_mdev =
>   		container_of(vdev, struct ap_matrix_mdev, vdev);
>   
> -	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
> -				 &matrix_mdev->iommu_notifier);
>   	vfio_ap_mdev_unset_kvm(matrix_mdev);
>   }
>   
> @@ -1461,6 +1423,7 @@ static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
>   	.open_device = vfio_ap_mdev_open_device,
>   	.close_device = vfio_ap_mdev_close_device,
>   	.ioctl = vfio_ap_mdev_ioctl,
> +	.dma_unmap = vfio_ap_mdev_dma_unmap,
>   };
>   
>   static struct mdev_driver vfio_ap_matrix_driver = {
> diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
> index a26efd804d0df3..abb59d59f81b20 100644
> --- a/drivers/s390/crypto/vfio_ap_private.h
> +++ b/drivers/s390/crypto/vfio_ap_private.h
> @@ -81,8 +81,6 @@ struct ap_matrix {
>    * @node:	allows the ap_matrix_mdev struct to be added to a list
>    * @matrix:	the adapters, usage domains and control domains assigned to the
>    *		mediated matrix device.
> - * @iommu_notifier: notifier block used for specifying callback function for
> - *		    handling the VFIO_IOMMU_NOTIFY_DMA_UNMAP even
>    * @kvm:	the struct holding guest's state
>    * @pqap_hook:	the function pointer to the interception handler for the
>    *		PQAP(AQIC) instruction.
> @@ -92,7 +90,6 @@ struct ap_matrix_mdev {
>   	struct vfio_device vdev;
>   	struct list_head node;
>   	struct ap_matrix matrix;
> -	struct notifier_block iommu_notifier;
>   	struct kvm *kvm;
>   	crypto_hook pqap_hook;
>   	struct mdev_device *mdev;
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 61e71c1154be67..f005b644ab9e69 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1077,8 +1077,20 @@ static void vfio_device_unassign_container(struct vfio_device *device)
>   	up_write(&device->group->group_rwsem);
>   }
>   
> +static int vfio_iommu_notifier(struct notifier_block *nb, unsigned long action,
> +			       void *data)
> +{
> +	struct vfio_device *vfio_device =
> +		container_of(nb, struct vfio_device, iommu_nb);
> +	struct vfio_iommu_type1_dma_unmap *unmap = data;
> +
> +	vfio_device->ops->dma_unmap(vfio_device, unmap->iova, unmap->size);
> +	return NOTIFY_OK;
> +}
> +
>   static struct file *vfio_device_open(struct vfio_device *device)
>   {
> +	struct vfio_iommu_driver *iommu_driver;
>   	struct file *filep;
>   	int ret;
>   
> @@ -1109,6 +1121,18 @@ static struct file *vfio_device_open(struct vfio_device *device)
>   			if (ret)
>   				goto err_undo_count;
>   		}
> +
> +		iommu_driver = device->group->container->iommu_driver;
> +		if (device->ops->dma_unmap && iommu_driver &&
> +		    iommu_driver->ops->register_notifier) {
> +			unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> +
> +			device->iommu_nb.notifier_call = vfio_iommu_notifier;
> +			iommu_driver->ops->register_notifier(
> +				device->group->container->iommu_data, &events,
> +				&device->iommu_nb);
> +		}
> +
>   		up_read(&device->group->group_rwsem);
>   	}
>   	mutex_unlock(&device->dev_set->lock);
> @@ -1143,8 +1167,16 @@ static struct file *vfio_device_open(struct vfio_device *device)
>   err_close_device:
>   	mutex_lock(&device->dev_set->lock);
>   	down_read(&device->group->group_rwsem);
> -	if (device->open_count == 1 && device->ops->close_device)
> +	if (device->open_count == 1 && device->ops->close_device) {
>   		device->ops->close_device(device);
> +
> +		iommu_driver = device->group->container->iommu_driver;
> +		if (device->ops->dma_unmap && iommu_driver &&
> +		    iommu_driver->ops->register_notifier)
> +			iommu_driver->ops->unregister_notifier(
> +				device->group->container->iommu_data,
> +				&device->iommu_nb);
> +	}
>   err_undo_count:
>   	device->open_count--;
>   	if (device->open_count == 0 && device->kvm)
> @@ -1339,12 +1371,20 @@ static const struct file_operations vfio_group_fops = {
>   static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>   {
>   	struct vfio_device *device = filep->private_data;
> +	struct vfio_iommu_driver *iommu_driver;
>   
>   	mutex_lock(&device->dev_set->lock);
>   	vfio_assert_device_open(device);
>   	down_read(&device->group->group_rwsem);
>   	if (device->open_count == 1 && device->ops->close_device)
>   		device->ops->close_device(device);
> +
> +	iommu_driver = device->group->container->iommu_driver;
> +	if (device->ops->dma_unmap && iommu_driver &&
> +	    iommu_driver->ops->register_notifier)
> +		iommu_driver->ops->unregister_notifier(
> +			device->group->container->iommu_data,
> +			&device->iommu_nb);
>   	up_read(&device->group->group_rwsem);
>   	device->open_count--;
>   	if (device->open_count == 0)
> @@ -2027,90 +2067,6 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
>   }
>   EXPORT_SYMBOL(vfio_dma_rw);
>   
> -static int vfio_register_iommu_notifier(struct vfio_group *group,
> -					unsigned long *events,
> -					struct notifier_block *nb)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	lockdep_assert_held_read(&group->group_rwsem);
> -
> -	container = group->container;
> -	driver = container->iommu_driver;
> -	if (likely(driver && driver->ops->register_notifier))
> -		ret = driver->ops->register_notifier(container->iommu_data,
> -						     events, nb);
> -	else
> -		ret = -ENOTTY;
> -
> -	return ret;
> -}
> -
> -static int vfio_unregister_iommu_notifier(struct vfio_group *group,
> -					  struct notifier_block *nb)
> -{
> -	struct vfio_container *container;
> -	struct vfio_iommu_driver *driver;
> -	int ret;
> -
> -	lockdep_assert_held_read(&group->group_rwsem);
> -
> -	container = group->container;
> -	driver = container->iommu_driver;
> -	if (likely(driver && driver->ops->unregister_notifier))
> -		ret = driver->ops->unregister_notifier(container->iommu_data,
> -						       nb);
> -	else
> -		ret = -ENOTTY;
> -
> -	return ret;
> -}
> -
> -int vfio_register_notifier(struct vfio_device *device,
> -			   enum vfio_notify_type type, unsigned long *events,
> -			   struct notifier_block *nb)
> -{
> -	struct vfio_group *group = device->group;
> -	int ret;
> -
> -	if (!nb || !events || (*events == 0) ||
> -	    !vfio_assert_device_open(device))
> -		return -EINVAL;
> -
> -	switch (type) {
> -	case VFIO_IOMMU_NOTIFY:
> -		ret = vfio_register_iommu_notifier(group, events, nb);
> -		break;
> -	default:
> -		ret = -EINVAL;
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_register_notifier);
> -
> -int vfio_unregister_notifier(struct vfio_device *device,
> -			     enum vfio_notify_type type,
> -			     struct notifier_block *nb)
> -{
> -	struct vfio_group *group = device->group;
> -	int ret;
> -
> -	if (!nb || !vfio_assert_device_open(device))
> -		return -EINVAL;
> -
> -	switch (type) {
> -	case VFIO_IOMMU_NOTIFY:
> -		ret = vfio_unregister_iommu_notifier(group, nb);
> -		break;
> -	default:
> -		ret = -EINVAL;
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(vfio_unregister_notifier);
> -
>   /*
>    * Module/class support
>    */
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index a6713022115155..cb2e4e9baa8fe8 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -33,6 +33,11 @@ enum vfio_iommu_notify_type {
>   	VFIO_IOMMU_CONTAINER_CLOSE = 0,
>   };
>   
> +/* events for register_notifier() */
> +enum {
> +	VFIO_IOMMU_NOTIFY_DMA_UNMAP = 1,
> +};
> +
>   /**
>    * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
>    */
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index aa888cc517578e..b76623e3b92fca 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -44,6 +44,7 @@ struct vfio_device {
>   	unsigned int open_count;
>   	struct completion comp;
>   	struct list_head group_next;
> +	struct notifier_block iommu_nb;
>   };
>   
>   /**
> @@ -60,6 +61,8 @@ struct vfio_device {
>    * @match: Optional device name match callback (return: 0 for no-match, >0 for
>    *         match, -errno for abort (ex. match with insufficient or incorrect
>    *         additional args)
> + * @dma_unmap: Called when userspace unmaps IOVA from the container
> + *             this device is attached to.
>    * @device_feature: Optional, fill in the VFIO_DEVICE_FEATURE ioctl
>    * @migration_set_state: Optional callback to change the migration state for
>    *         devices that support migration. It's mandatory for
> @@ -85,6 +88,7 @@ struct vfio_device_ops {
>   	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
>   	void	(*request)(struct vfio_device *vdev, unsigned int count);
>   	int	(*match)(struct vfio_device *vdev, char *buf);
> +	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
>   	int	(*device_feature)(struct vfio_device *device, u32 flags,
>   				  void __user *arg, size_t argsz);
>   	struct file *(*migration_set_state)(
> @@ -154,23 +158,6 @@ extern int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>   		       void *data, size_t len, bool write);
>   
> -/* each type has independent events */
> -enum vfio_notify_type {
> -	VFIO_IOMMU_NOTIFY = 0,
> -};
> -
> -/* events for VFIO_IOMMU_NOTIFY */
> -#define VFIO_IOMMU_NOTIFY_DMA_UNMAP	BIT(0)
> -
> -extern int vfio_register_notifier(struct vfio_device *device,
> -				  enum vfio_notify_type type,
> -				  unsigned long *required_events,
> -				  struct notifier_block *nb);
> -extern int vfio_unregister_notifier(struct vfio_device *device,
> -				    enum vfio_notify_type type,
> -				    struct notifier_block *nb);
> -
> -
>   /*
>    * Sub-module helpers
>    */

