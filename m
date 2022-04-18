Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E9506601
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD56210E289;
	Tue, 19 Apr 2022 07:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A07C10E695;
 Mon, 18 Apr 2022 16:27:23 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23IDZS9f023024; 
 Mon, 18 Apr 2022 15:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HqQciTar/dr6XQaGag4BrX8X9OeIsbpgI5h9o2qOgg8=;
 b=Ubmf8doaXyPNt6S90i748iQ1lCbVXFJ/DyAJ8bf8HWZeBumVNjxXP3m+523H3dS64AV0
 ctCFNnErBnaHk27UWIhyCWoOqhTqqgtipp3blEJIlXn0bDl5beScrOq4H+Ek0XaanKgs
 XyiTcYVinH9dGJqsKXB7kTI9aBmuLbKnISFGcb9kdY+8k9D+dKInnCEy6YHDGy0++1hr
 v8O/o4bUBwYd9LnspnykyQP23YNzVRBYUuV7s6H3V7lEaWAE+NBF1JsNExO9gX9MnSe2
 4Jkax4xukPbp6HTZxKdmx+HnrUYa0cqWyaTmKJ/lmJwYgG6SQesGc0LlQ0w7u9+bEXy9 fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg79e0f0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:56:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23IFpBdH003472;
 Mon, 18 Apr 2022 15:56:23 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg79e0f02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:56:23 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23IFqmlb023970;
 Mon, 18 Apr 2022 15:56:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3ffne9tpb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:56:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23IFuLLI33227178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 15:56:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22968BE05A;
 Mon, 18 Apr 2022 15:56:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ABB1BE04F;
 Mon, 18 Apr 2022 15:56:18 +0000 (GMT)
Received: from [9.65.204.148] (unknown [9.65.204.148])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 15:56:18 +0000 (GMT)
Message-ID: <3231af63-4d36-f8bd-e8d7-426222a883d9@linux.ibm.com>
Date: Mon, 18 Apr 2022 11:56:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/9] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
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
References: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
From: Tony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KCIN7UZDZuCEvtHigmg5n1CB9zndGDrN
X-Proofpoint-ORIG-GUID: qjhturDoRjoL-gez5Wt0TNIVHwtnmzm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180091
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
> Every caller has a readily available vfio_device pointer, use that instead
> of passing in a generic struct device. The struct vfio_device already
> contains the group we need so this avoids complexity, extra refcountings,
> and a confusing lifecycle model.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   .../driver-api/vfio-mediated-device.rst       |  4 +-
>   drivers/s390/cio/vfio_ccw_cp.c                |  6 +--
>   drivers/s390/crypto/vfio_ap_ops.c             |  8 ++--
>   drivers/vfio/vfio.c                           | 40 ++++++-------------
>   include/linux/vfio.h                          |  4 +-
>   5 files changed, 24 insertions(+), 38 deletions(-)
>
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> index 9f26079cacae35..6aeca741dc9be1 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -279,10 +279,10 @@ Translation APIs for Mediated Devices
>   The following APIs are provided for translating user pfn to host pfn in a VFIO
>   driver::
>   
> -	extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
> +	extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
>   				  int npage, int prot, unsigned long *phys_pfn);
>   
> -	extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
> +	extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
>   				    int npage);
>   
>   These functions call back into the back-end IOMMU module by using the pin_pages
>
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 69768061cd7bd9..a10b3369d76c41 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
>   		q->saved_isc = VFIO_AP_ISC_INVALID;
>   	}
>   	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> -		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
> +		vfio_unpin_pages(&q->matrix_mdev->vdev,
>   				 &q->saved_pfn, 1);
>   		q->saved_pfn = 0;
>   	}
> @@ -258,7 +258,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   		return status;
>   	}
>   
> -	ret = vfio_pin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1,
> +	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
>   			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
>   	switch (ret) {
>   	case 1:
> @@ -301,7 +301,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   		break;
>   	case AP_RESPONSE_OTHERWISE_CHANGED:
>   		/* We could not modify IRQ setings: clear new configuration */
> -		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
>   		kvm_s390_gisc_unregister(kvm, isc);
>   		break;
>   	default:
> @@ -1250,7 +1250,7 @@ static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
>   		struct vfio_iommu_type1_dma_unmap *unmap = data;
>   		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
>   
> -		vfio_unpin_pages(mdev_dev(matrix_mdev->mdev), &g_pfn, 1);
> +		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
>   		return NOTIFY_OK;
>   	}

The vfio_ap snippet:
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>

>   
>

