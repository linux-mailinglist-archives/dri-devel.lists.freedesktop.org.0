Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F45A655A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 15:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748C310E0E5;
	Tue, 30 Aug 2022 13:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC9710E0E5;
 Tue, 30 Aug 2022 13:43:44 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UDRwnW023927;
 Tue, 30 Aug 2022 13:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YFAKHxu5wcKQ3UK0MPzzxJnNMBONFL5WOcAvofUE3bw=;
 b=n6TYPcc2EEb678JhhWrpENhKY5a0ZXNQzGelXBS+3+lCPr6s82vmVAGoVmPROY9DPi4l
 DpcmzJAoBJhHFKuWICXIo9zWlU3MC6AX4hY+dbOPzbkKzrOxqLakgTYWHn+o4QaMyx5e
 FK1y098IJYEdFQQyoxp+2gha+P5MBYxRltL2UUwVeJv1Jduz6rkz7jt4ph4T9hW2KrFM
 n1m+w65c70EdD06MRVgNz3GLhSSpQKf8yEtj29UIHN43WMl3OdHGhros9gfhp2LGpuIQ
 unNhz9NT3XzwovWR6Iv9oG2WSL4WdfBcZSJMUXOhoqA/gM1qKJfY6xqzbOXgl5BGMblE Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9kf68qdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 13:43:30 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27UDSdlX026996;
 Tue, 30 Aug 2022 13:43:29 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9kf68qce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 13:43:29 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UDaBTF031062;
 Tue, 30 Aug 2022 13:43:27 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3j7awas13e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 13:43:27 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27UDhQia5178046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 13:43:26 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9321F28059;
 Tue, 30 Aug 2022 13:43:26 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B326028058;
 Tue, 30 Aug 2022 13:43:24 +0000 (GMT)
Received: from [9.160.64.167] (unknown [9.160.64.167])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Aug 2022 13:43:24 +0000 (GMT)
Message-ID: <e81f5b86-f5ce-2a2b-bc05-5ef73fc318b5@linux.ibm.com>
Date: Tue, 30 Aug 2022 09:43:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/15] vfio/ap: Use the new device life cycle helpers
Content-Language: en-US
To: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Abhishek Sahu <abhsahu@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-10-kevin.tian@intel.com>
From: Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20220827171037.30297-10-kevin.tian@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IdluEtB4hu3CV0euTFXaRaPw-5HY7ylp
X-Proofpoint-GUID: eVg-uI5lnP3oaIxLLf2Oml3yenLlz5VK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_08,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300067
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
Cc: Yi Liu <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>

On 8/27/22 1:10 PM, Kevin Tian wrote:
> From: Yi Liu <yi.l.liu@intel.com>
>
> and manage available_instances inside @init/@release.
>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> ---
>   drivers/s390/crypto/vfio_ap_ops.c | 50 ++++++++++++++++++-------------
>   1 file changed, 29 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 6c8c41fac4e1..803aadfd0876 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -684,42 +684,44 @@ static bool vfio_ap_mdev_filter_matrix(unsigned long *apm, unsigned long *aqm,
>   			     AP_DOMAINS);
>   }
>   
> -static int vfio_ap_mdev_probe(struct mdev_device *mdev)
> +static int vfio_ap_mdev_init_dev(struct vfio_device *vdev)
>   {
> -	struct ap_matrix_mdev *matrix_mdev;
> -	int ret;
> +	struct ap_matrix_mdev *matrix_mdev =
> +		container_of(vdev, struct ap_matrix_mdev, vdev);
>   
>   	if ((atomic_dec_if_positive(&matrix_dev->available_instances) < 0))
>   		return -EPERM;
>   
> -	matrix_mdev = kzalloc(sizeof(*matrix_mdev), GFP_KERNEL);
> -	if (!matrix_mdev) {
> -		ret = -ENOMEM;
> -		goto err_dec_available;
> -	}
> -	vfio_init_group_dev(&matrix_mdev->vdev, &mdev->dev,
> -			    &vfio_ap_matrix_dev_ops);
> -
> -	matrix_mdev->mdev = mdev;
> +	matrix_mdev->mdev = to_mdev_device(vdev->dev);
>   	vfio_ap_matrix_init(&matrix_dev->info, &matrix_mdev->matrix);
>   	matrix_mdev->pqap_hook = handle_pqap;
>   	vfio_ap_matrix_init(&matrix_dev->info, &matrix_mdev->shadow_apcb);
>   	hash_init(matrix_mdev->qtable.queues);
>   
> +	return 0;
> +}
> +
> +static int vfio_ap_mdev_probe(struct mdev_device *mdev)
> +{
> +	struct ap_matrix_mdev *matrix_mdev;
> +	int ret;
> +
> +	matrix_mdev = vfio_alloc_device(ap_matrix_mdev, vdev, &mdev->dev,
> +					&vfio_ap_matrix_dev_ops);
> +	if (IS_ERR(matrix_mdev))
> +		return PTR_ERR(matrix_mdev);
> +
>   	ret = vfio_register_emulated_iommu_dev(&matrix_mdev->vdev);
>   	if (ret)
> -		goto err_list;
> +		goto err_put_vdev;
>   	dev_set_drvdata(&mdev->dev, matrix_mdev);
>   	mutex_lock(&matrix_dev->mdevs_lock);
>   	list_add(&matrix_mdev->node, &matrix_dev->mdev_list);
>   	mutex_unlock(&matrix_dev->mdevs_lock);
>   	return 0;
>   
> -err_list:
> -	vfio_uninit_group_dev(&matrix_mdev->vdev);
> -	kfree(matrix_mdev);
> -err_dec_available:
> -	atomic_inc(&matrix_dev->available_instances);
> +err_put_vdev:
> +	vfio_put_device(&matrix_mdev->vdev);
>   	return ret;
>   }
>   
> @@ -766,6 +768,12 @@ static void vfio_ap_mdev_unlink_fr_queues(struct ap_matrix_mdev *matrix_mdev)
>   	}
>   }
>   
> +static void vfio_ap_mdev_release_dev(struct vfio_device *vdev)
> +{
> +	vfio_free_device(vdev);
> +	atomic_inc(&matrix_dev->available_instances);
> +}
> +
>   static void vfio_ap_mdev_remove(struct mdev_device *mdev)
>   {
>   	struct ap_matrix_mdev *matrix_mdev = dev_get_drvdata(&mdev->dev);
> @@ -779,9 +787,7 @@ static void vfio_ap_mdev_remove(struct mdev_device *mdev)
>   	list_del(&matrix_mdev->node);
>   	mutex_unlock(&matrix_dev->mdevs_lock);
>   	mutex_unlock(&matrix_dev->guests_lock);
> -	vfio_uninit_group_dev(&matrix_mdev->vdev);
> -	kfree(matrix_mdev);
> -	atomic_inc(&matrix_dev->available_instances);
> +	vfio_put_device(&matrix_mdev->vdev);
>   }
>   
>   static ssize_t name_show(struct mdev_type *mtype,
> @@ -1794,6 +1800,8 @@ static const struct attribute_group vfio_queue_attr_group = {
>   };
>   
>   static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
> +	.init = vfio_ap_mdev_init_dev,
> +	.release = vfio_ap_mdev_release_dev,
>   	.open_device = vfio_ap_mdev_open_device,
>   	.close_device = vfio_ap_mdev_close_device,
>   	.ioctl = vfio_ap_mdev_ioctl,
