Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D0C616AEB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5943910E52D;
	Wed,  2 Nov 2022 17:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99D110E52D;
 Wed,  2 Nov 2022 17:38:15 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2GkWwa016761;
 Wed, 2 Nov 2022 17:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=POyXG4IlPm7jFx0Q3uWwEGhl5QQ7jk6OxguwZ8ZA4tY=;
 b=s8a8jqhsF3HQPAMYsT7L5qFRWtZxgtttvcU6nISmwAZ5ayhpcZo8hVwaOQNTney41B5Y
 YyCt1Hgm88yPxMt25ksaZHtuD8BMpsS/vvuNGp6644VD2KOjqWwVdMn4zRl0MbUi2ofz
 fjh5xcvb4jktiesw/kRO1TYiw85+QQs9vLiy3Q0w7jgx4W9cEEY7BlhJ1SZesNkbK3kA
 beT4JGJr1vpKuJeM+SpEK6LYDor+goWr8CFIelH45vnE+yiLyxt61788GlUcYfnXHFOa
 SS67aRGGOLZ+vC66Nj1aVbxoaO/0IRIS7pspv7wa3V8RtOk2lTL9ZjrWBC1nRz7NTJqH 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kktn0dwgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 17:37:03 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2FijWj003373;
 Wed, 2 Nov 2022 17:37:02 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kktn0dwfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 17:37:02 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2HaOsU023671;
 Wed, 2 Nov 2022 17:37:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 3kgut9v73u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 17:37:00 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A2HaxKn63767026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Nov 2022 17:37:00 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 420F95803F;
 Wed,  2 Nov 2022 17:36:59 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CFF858067;
 Wed,  2 Nov 2022 17:36:55 +0000 (GMT)
Received: from [9.160.188.120] (unknown [9.160.188.120])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  2 Nov 2022 17:36:55 +0000 (GMT)
Message-ID: <4a39ccf9-4201-47eb-fb4a-94a9b8b29312@linux.ibm.com>
Date: Wed, 2 Nov 2022 13:36:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/7] vfio: Remove vfio_free_device
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
References: <20221102150152.2521475-1-farman@linux.ibm.com>
 <20221102150152.2521475-8-farman@linux.ibm.com>
From: Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20221102150152.2521475-8-farman@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5KNPJY1ojqecQcp7Ux1-t0mABaq5DMaH
X-Proofpoint-ORIG-GUID: hHPReoa9HfHIQdJ1gnG2bgJ3zM36pog3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_13,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020114
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com> : vfio_ap part

On 11/2/22 11:01 AM, Eric Farman wrote:
> With the "mess" sorted out, we should be able to inline the
> vfio_free_device call introduced by commit cb9ff3f3b84c
> ("vfio: Add helpers for unifying vfio_device life cycle")
> and remove them from driver release callbacks.
>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/kvmgt.c      |  1 -
>   drivers/s390/cio/vfio_ccw_ops.c       |  2 --
>   drivers/s390/crypto/vfio_ap_ops.c     |  6 ------
>   drivers/vfio/fsl-mc/vfio_fsl_mc.c     |  1 -
>   drivers/vfio/pci/vfio_pci_core.c      |  1 -
>   drivers/vfio/platform/vfio_amba.c     |  1 -
>   drivers/vfio/platform/vfio_platform.c |  1 -
>   drivers/vfio/vfio_main.c              | 22 ++++------------------
>   include/linux/vfio.h                  |  1 -
>   samples/vfio-mdev/mbochs.c            |  1 -
>   samples/vfio-mdev/mdpy.c              |  1 -
>   samples/vfio-mdev/mtty.c              |  1 -
>   12 files changed, 4 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 7a45e5360caf..eee6805e67de 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1461,7 +1461,6 @@ static void intel_vgpu_release_dev(struct vfio_device *vfio_dev)
>   	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
>   
>   	intel_gvt_destroy_vgpu(vgpu);
> -	vfio_free_device(vfio_dev);
>   }
>   
>   static const struct vfio_device_ops intel_vgpu_dev_ops = {
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index 1155f8bcedd9..598a3814d428 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -143,8 +143,6 @@ static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
>   	kmem_cache_free(vfio_ccw_io_region, private->io_region);
>   	kfree(private->cp.guest_cp);
>   	mutex_destroy(&private->io_mutex);
> -
> -	vfio_free_device(vdev);
>   }
>   
>   static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 0b4cc8c597ae..f108c0f14712 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -765,11 +765,6 @@ static void vfio_ap_mdev_unlink_fr_queues(struct ap_matrix_mdev *matrix_mdev)
>   	}
>   }
>   
> -static void vfio_ap_mdev_release_dev(struct vfio_device *vdev)
> -{
> -	vfio_free_device(vdev);
> -}
> -
>   static void vfio_ap_mdev_remove(struct mdev_device *mdev)
>   {
>   	struct ap_matrix_mdev *matrix_mdev = dev_get_drvdata(&mdev->dev);
> @@ -1784,7 +1779,6 @@ static const struct attribute_group vfio_queue_attr_group = {
>   
>   static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
>   	.init = vfio_ap_mdev_init_dev,
> -	.release = vfio_ap_mdev_release_dev,
>   	.open_device = vfio_ap_mdev_open_device,
>   	.close_device = vfio_ap_mdev_close_device,
>   	.ioctl = vfio_ap_mdev_ioctl,
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index b16874e913e4..7b8889f55007 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -568,7 +568,6 @@ static void vfio_fsl_mc_release_dev(struct vfio_device *core_vdev)
>   
>   	vfio_fsl_uninit_device(vdev);
>   	mutex_destroy(&vdev->igate);
> -	vfio_free_device(core_vdev);
>   }
>   
>   static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index badc9d828cac..9be2d5be5d95 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -2109,7 +2109,6 @@ void vfio_pci_core_release_dev(struct vfio_device *core_vdev)
>   	mutex_destroy(&vdev->vma_lock);
>   	kfree(vdev->region);
>   	kfree(vdev->pm_save);
> -	vfio_free_device(core_vdev);
>   }
>   EXPORT_SYMBOL_GPL(vfio_pci_core_release_dev);
>   
> diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> index eaea63e5294c..18faf2678b99 100644
> --- a/drivers/vfio/platform/vfio_amba.c
> +++ b/drivers/vfio/platform/vfio_amba.c
> @@ -95,7 +95,6 @@ static void vfio_amba_release_dev(struct vfio_device *core_vdev)
>   
>   	vfio_platform_release_common(vdev);
>   	kfree(vdev->name);
> -	vfio_free_device(core_vdev);
>   }
>   
>   static void vfio_amba_remove(struct amba_device *adev)
> diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
> index 82cedcebfd90..9910451dc341 100644
> --- a/drivers/vfio/platform/vfio_platform.c
> +++ b/drivers/vfio/platform/vfio_platform.c
> @@ -83,7 +83,6 @@ static void vfio_platform_release_dev(struct vfio_device *core_vdev)
>   		container_of(core_vdev, struct vfio_platform_device, vdev);
>   
>   	vfio_platform_release_common(vdev);
> -	vfio_free_device(core_vdev);
>   }
>   
>   static int vfio_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 2901b8ad5be9..9835757e2bee 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -339,13 +339,10 @@ static void vfio_device_release(struct device *dev)
>   	vfio_release_device_set(device);
>   	ida_free(&vfio.device_ida, device->index);
>   
> -	/*
> -	 * kvfree() cannot be done here due to a life cycle mess in
> -	 * vfio-ccw. Before the ccw part is fixed all drivers are
> -	 * required to support @release and call vfio_free_device()
> -	 * from there.
> -	 */
> -	device->ops->release(device);
> +	if (device->ops->release)
> +		device->ops->release(device);
> +
> +	kvfree(device);
>   }
>   
>   static int vfio_init_device(struct vfio_device *device, struct device *dev,
> @@ -424,17 +421,6 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
>   	return ret;
>   }
>   
> -/*
> - * The helper called by driver @release callback to free the device
> - * structure. Drivers which don't have private data to clean can
> - * simply use this helper as its @release.
> - */
> -void vfio_free_device(struct vfio_device *device)
> -{
> -	kvfree(device);
> -}
> -EXPORT_SYMBOL_GPL(vfio_free_device);
> -
>   static struct vfio_group *vfio_noiommu_group_alloc(struct device *dev,
>   		enum vfio_group_type type)
>   {
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index ba809268a48e..e7480154825e 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -176,7 +176,6 @@ struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
>   					dev, ops),				\
>   		     struct dev_struct, member)
>   
> -void vfio_free_device(struct vfio_device *device);
>   static inline void vfio_put_device(struct vfio_device *device)
>   {
>   	put_device(&device->device);
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index 117a8d799f71..8b5a3a778a25 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -594,7 +594,6 @@ static void mbochs_release_dev(struct vfio_device *vdev)
>   	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
>   	kfree(mdev_state->pages);
>   	kfree(mdev_state->vconfig);
> -	vfio_free_device(vdev);
>   }
>   
>   static void mbochs_remove(struct mdev_device *mdev)
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index 946e8cfde6fd..721fb06c6413 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -283,7 +283,6 @@ static void mdpy_release_dev(struct vfio_device *vdev)
>   
>   	vfree(mdev_state->memblk);
>   	kfree(mdev_state->vconfig);
> -	vfio_free_device(vdev);
>   }
>   
>   static void mdpy_remove(struct mdev_device *mdev)
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index e72085fc1376..3c2a421b9b69 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -784,7 +784,6 @@ static void mtty_release_dev(struct vfio_device *vdev)
>   
>   	atomic_add(mdev_state->nr_ports, &mdev_avail_ports);
>   	kfree(mdev_state->vconfig);
> -	vfio_free_device(vdev);
>   }
>   
>   static void mtty_remove(struct mdev_device *mdev)
