Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE0506602
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1596F10E777;
	Tue, 19 Apr 2022 07:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2567 seconds by postgrey-1.36 at gabe;
 Mon, 18 Apr 2022 16:11:28 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9EB10E154;
 Mon, 18 Apr 2022 16:11:28 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23IDQVwU007067; 
 Mon, 18 Apr 2022 15:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mXyV8zBO0d7NK+u2E09/wjZ4ZPRhf8/bUCmA/aKkUVA=;
 b=Tp7DUlnQZ/eBXjoSa9D0vXPOIQzKBjQZl/SKCBzXOX+wRe1hqr9TSJ48LOHRKU9rr4I8
 ngas/aBK9zqZDjm9Z7cpUHampv4SOdtkiG7rvtf3gv+fXQHXKrE3Atk/EZuLgw/D0spC
 gTOjHsqYJiFhXP8rPQcfMLNKDq5S9nGtbQJYkMBJDFyqcfIUzJriaPMFN6vmk8kBBKLE
 zIjDn+LMHKAO67qvOpixVV826QZn8AaxxuyVOj0avVQ4hg9tJdgD/UE6hVJUZZuzvliW
 vyMsRjz8+V9+0Fqe7AI317qtR1cVoCDDeVCci+Ma2+JPEayJXTieMNaxp0hoFYyfE/u/ sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fg77j7swq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:28:36 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23IFHbVW021846;
 Mon, 18 Apr 2022 15:28:36 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fg77j7swg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:28:35 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23IFKp43025583;
 Mon, 18 Apr 2022 15:28:35 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 3fg2xvkbta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:28:35 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23IFSXsU36569348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 15:28:34 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0D89BE056;
 Mon, 18 Apr 2022 15:28:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 361BDBE054;
 Mon, 18 Apr 2022 15:28:31 +0000 (GMT)
Received: from [9.65.204.148] (unknown [9.65.204.148])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 15:28:31 +0000 (GMT)
Message-ID: <aa721d27-9622-5d47-2671-a503ba6cf2ef@linux.ibm.com>
Date: Mon, 18 Apr 2022 11:28:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
From: Tony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CW51WGGH1p_elZ8hWZBK9X2lbbjcUqa0
X-Proofpoint-ORIG-GUID: JXvh0oN3Bu8uyGw4E5OeVPkEz07EM0kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=917 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180089
X-Mailman-Approved-At: Tue, 19 Apr 2022 07:34:04 +0000
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/12/22 11:53 AM, Jason Gunthorpe wrote:
> All callers have a struct vfio_device trivially available, pass it in
> directly and avoid calling the expensive vfio_group_get_from_dev().
>
> To support the unconverted kvmgt mdev driver add
> mdev_legacy_get_vfio_device() which will return the vfio_device pointer
> vfio_mdev.c puts in the drv_data.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/gpu/drm/i915/gvt/kvmgt.c  | 15 +++++++++------
>   drivers/s390/cio/vfio_ccw_ops.c   |  7 +++----
>   drivers/s390/crypto/vfio_ap_ops.c | 14 +++++++-------
>   drivers/vfio/mdev/vfio_mdev.c     | 12 ++++++++++++
>   drivers/vfio/vfio.c               | 25 +++++++------------------
>   include/linux/mdev.h              |  1 +
>   include/linux/vfio.h              |  4 ++--
>   7 files changed, 41 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 057ec449010458..bb59d21cf898ab 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -904,6 +904,7 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
>   
>   static int intel_vgpu_open_device(struct mdev_device *mdev)
>   {
> +	struct vfio_device *vfio_dev = mdev_legacy_get_vfio_device(mdev);
>   	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
>   	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
>   	unsigned long events;
> @@ -914,7 +915,7 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
>   	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
>   
>   	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY, &events,
> +	ret = vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
>   				&vdev->iommu_notifier);
>   	if (ret != 0) {
>   		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
> @@ -923,7 +924,7 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
>   	}
>   
>   	events = VFIO_GROUP_NOTIFY_SET_KVM;
> -	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
> +	ret = vfio_register_notifier(vfio_dev, VFIO_GROUP_NOTIFY, &events,
>   				&vdev->group_notifier);
>   	if (ret != 0) {
>   		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
> @@ -961,11 +962,11 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
>   	vdev->vfio_group = NULL;
>   
>   undo_register:
> -	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
> +	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
>   					&vdev->group_notifier);
>   
>   undo_iommu:
> -	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
> +	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
>   					&vdev->iommu_notifier);
>   out:
>   	return ret;
> @@ -988,6 +989,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
>   	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
>   	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
>   	struct kvmgt_guest_info *info;
> +	struct vfio_device *vfio_dev;
>   	int ret;
>   
>   	if (!handle_valid(vgpu->handle))
> @@ -998,12 +1000,13 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
>   
>   	intel_gvt_ops->vgpu_release(vgpu);
>   
> -	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_IOMMU_NOTIFY,
> +	vfio_dev = mdev_legacy_get_vfio_device(vdev->mdev);
> +	ret = vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
>   					&vdev->iommu_notifier);
>   	drm_WARN(&i915->drm, ret,
>   		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
>   
> -	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_GROUP_NOTIFY,
> +	ret = vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
>   					&vdev->group_notifier);
>   	drm_WARN(&i915->drm, ret,
>   		 "vfio_unregister_notifier for group failed: %d\n", ret);
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index d8589afac272f1..e1ce24d8fb2555 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -183,7 +183,7 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
>   
>   	private->nb.notifier_call = vfio_ccw_mdev_notifier;
>   
> -	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> +	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
>   				     &events, &private->nb);
>   	if (ret)
>   		return ret;
> @@ -204,8 +204,7 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
>   
>   out_unregister:
>   	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> -				 &private->nb);
> +	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>   	return ret;
>   }
>   
> @@ -223,7 +222,7 @@ static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
>   
>   	cp_free(&private->cp);
>   	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY, &private->nb);
> +	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
>   }
>   
>   static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 6e08d04b605d6e..69768061cd7bd9 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -1406,21 +1406,21 @@ static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
>   	matrix_mdev->group_notifier.notifier_call = vfio_ap_mdev_group_notifier;
>   	events = VFIO_GROUP_NOTIFY_SET_KVM;
>   
> -	ret = vfio_register_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
> -				     &events, &matrix_mdev->group_notifier);
> +	ret = vfio_register_notifier(vdev, VFIO_GROUP_NOTIFY, &events,
> +				     &matrix_mdev->group_notifier);
>   	if (ret)
>   		return ret;
>   
>   	matrix_mdev->iommu_notifier.notifier_call = vfio_ap_mdev_iommu_notifier;
>   	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
> -	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> -				     &events, &matrix_mdev->iommu_notifier);
> +	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
> +				     &matrix_mdev->iommu_notifier);
>   	if (ret)
>   		goto out_unregister_group;
>   	return 0;
>   
>   out_unregister_group:
> -	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
> +	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
>   				 &matrix_mdev->group_notifier);
>   	return ret;
>   }
> @@ -1430,9 +1430,9 @@ static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
>   	struct ap_matrix_mdev *matrix_mdev =
>   		container_of(vdev, struct ap_matrix_mdev, vdev);
>   
> -	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> +	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
>   				 &matrix_mdev->iommu_notifier);
> -	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
> +	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
>   				 &matrix_mdev->group_notifier);
>   	vfio_ap_mdev_unset_kvm(matrix_mdev);
>   }
> diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
> index a90e24b0c851d3..91605c1e8c8f94 100644
> --- a/drivers/vfio/mdev/vfio_mdev.c
> +++ b/drivers/vfio/mdev/vfio_mdev.c
> @@ -17,6 +17,18 @@
>   
>   #include "mdev_private.h"
>   
> +/*
> + * Return the struct vfio_device for the mdev when using the legacy
> + * vfio_mdev_dev_ops path. No new callers to this function should be added.
> + */
> +struct vfio_device *mdev_legacy_get_vfio_device(struct mdev_device *mdev)
> +{
> +	if (WARN_ON(mdev->dev.driver != &vfio_mdev_driver.driver))
> +		return NULL;
> +	return dev_get_drvdata(&mdev->dev);
> +}
> +EXPORT_SYMBOL_GPL(mdev_legacy_get_vfio_device);
> +
>   static int vfio_mdev_open_device(struct vfio_device *core_vdev)
>   {
>   	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index a4555014bd1e72..8a5c46aa2bef61 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -2484,19 +2484,15 @@ static int vfio_unregister_group_notifier(struct vfio_group *group,
>   	return ret;
>   }
>   
> -int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
> +int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_type type,
>   			   unsigned long *events, struct notifier_block *nb)
>   {
> -	struct vfio_group *group;
> +	struct vfio_group *group = dev->group;

Is there a guarantee that dev != NULL? The original code below checks
the value of dev, so why is that check eliminated here?

>   	int ret;
>   
> -	if (!dev || !nb || !events || (*events == 0))
> +	if (!nb || !events || (*events == 0))
>   		return -EINVAL;
>   
> -	group = vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
>   	switch (type) {
>   	case VFIO_IOMMU_NOTIFY:
>   		ret = vfio_register_iommu_notifier(group, events, nb);
> @@ -2507,25 +2503,20 @@ int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
>   	default:
>   		ret = -EINVAL;
>   	}
> -
> -	vfio_group_put(group);
>   	return ret;
>   }
>   EXPORT_SYMBOL(vfio_register_notifier);
>   
> -int vfio_unregister_notifier(struct device *dev, enum vfio_notify_type type,
> +int vfio_unregister_notifier(struct vfio_device *dev,
> +			     enum vfio_notify_type type,
>   			     struct notifier_block *nb)
>   {
> -	struct vfio_group *group;
> +	struct vfio_group *group = dev->group;

Same comment as above, not NULL check here.

>   	int ret;
>   
> -	if (!dev || !nb)
> +	if (!nb)
>   		return -EINVAL;
>   
> -	group = vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
>   	switch (type) {
>   	case VFIO_IOMMU_NOTIFY:
>   		ret = vfio_unregister_iommu_notifier(group, nb);
> @@ -2536,8 +2527,6 @@ int vfio_unregister_notifier(struct device *dev, enum vfio_notify_type type,
>   	default:
>   		ret = -EINVAL;
>   	}
> -
> -	vfio_group_put(group);
>   	return ret;
>   }
>   EXPORT_SYMBOL(vfio_unregister_notifier);
> diff --git a/include/linux/mdev.h b/include/linux/mdev.h
> index 15d03f6532d073..67d07220a28f29 100644
> --- a/include/linux/mdev.h
> +++ b/include/linux/mdev.h
> @@ -29,6 +29,7 @@ static inline struct mdev_device *to_mdev_device(struct device *dev)
>   unsigned int mdev_get_type_group_id(struct mdev_device *mdev);
>   unsigned int mtype_get_type_group_id(struct mdev_type *mtype);
>   struct device *mtype_get_parent_dev(struct mdev_type *mtype);
> +struct vfio_device *mdev_legacy_get_vfio_device(struct mdev_device *mdev);
>   
>   /**
>    * struct mdev_parent_ops - Structure to be registered for each parent device to
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 66dda06ec42d1b..748ec0e0293aea 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -178,11 +178,11 @@ enum vfio_notify_type {
>   /* events for VFIO_GROUP_NOTIFY */
>   #define VFIO_GROUP_NOTIFY_SET_KVM	BIT(0)
>   
> -extern int vfio_register_notifier(struct device *dev,
> +extern int vfio_register_notifier(struct vfio_device *dev,
>   				  enum vfio_notify_type type,
>   				  unsigned long *required_events,
>   				  struct notifier_block *nb);
> -extern int vfio_unregister_notifier(struct device *dev,
> +extern int vfio_unregister_notifier(struct vfio_device *dev,
>   				    enum vfio_notify_type type,
>   				    struct notifier_block *nb);
>   

