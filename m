Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709935065F9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB6D10E75B;
	Tue, 19 Apr 2022 07:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1021 seconds by postgrey-1.36 at gabe;
 Mon, 18 Apr 2022 15:42:25 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C5F10E5C8;
 Mon, 18 Apr 2022 15:42:25 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23IEchH7016120; 
 Mon, 18 Apr 2022 15:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : reply-to : subject : to : cc : references : from :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=4qCS7go1QL022udA2KhFYoAMPtNP6go1Iv3nZtvPb6c=;
 b=a51n4I8TcTAjcmtwolkaREI+ePRDRsDm0vuoG2HyXi0Oc7RG/i+Mn2FnqJGrL3ZAO+tx
 h7uzQCKQUUM8KwoGeJILabnMMUC3v42eSVTWkLZ7Y6kp4Ib8L775jnhtpVrrjT5QIJ39
 boWR9q2iAOh/0sSjD7Jqk0Hjag9Go608InZq3UHxVIxiOzpSzUzXMtCMmJSy4BbXt/eT
 Q4Yh0YhiXGmg6s+YdkIo6Oxmh7+UwJSTWa1ZB7z134dt8HoLPJwFcNhnJ3yc5E70sEic
 pk8Ezs4nx+y+TsaE1xUcwtkWi0L84mBx5LUUQvBgVKK5AijGhe0wz8R4ITQj02oj6KOo VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7d6qamw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:29:41 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23IFTeY2009111;
 Mon, 18 Apr 2022 15:29:40 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7d6qamm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:29:40 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23IFKnVl026794;
 Mon, 18 Apr 2022 15:29:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3ffne9jhva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:29:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23IFTcgq32702894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 15:29:38 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B845AE05F;
 Mon, 18 Apr 2022 15:29:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F991AE05C;
 Mon, 18 Apr 2022 15:29:37 +0000 (GMT)
Received: from [9.65.235.174] (unknown [9.65.235.174])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 15:29:37 +0000 (GMT)
Message-ID: <07f39f6b-1dc9-64e4-12c0-928ecb7878ed@linux.ibm.com>
Date: Mon, 18 Apr 2022 11:29:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
From: "Jason J. Herne" <jjherne@linux.ibm.com>
Organization: IBM
In-Reply-To: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1C_EF63D7M_kVDmEa1kK0eANH0md6ZpB
X-Proofpoint-GUID: lcjgntORAoHeJQ6qPIIGxZlPToOBj9r0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204180089
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
Reply-To: jjherne@linux.ibm.com
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 11:53, Jason Gunthorpe wrote:
> All callers have a struct vfio_device trivially available, pass it in
> directly and avoid calling the expensive vfio_group_get_from_dev().
> 
> To support the unconverted kvmgt mdev driver add
> mdev_legacy_get_vfio_device() which will return the vfio_device pointer
> vfio_mdev.c puts in the drv_data.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ...
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
looks good for vfio_ap.
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>


-- 
-- Jason J. Herne (jjherne@linux.ibm.com)
