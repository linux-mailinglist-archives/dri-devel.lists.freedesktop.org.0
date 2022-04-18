Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45D5065F8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E6610E752;
	Tue, 19 Apr 2022 07:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB6B10E154;
 Mon, 18 Apr 2022 16:07:30 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23ICqA2P005763; 
 Mon, 18 Apr 2022 15:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : reply-to : subject : to : cc : references : from :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=evwWpk1Dm5bcc6QEDuXhMspZWK6TKCHyVA1qTLrlimg=;
 b=JZ6jbQE3dxDOMfvOcU84vAXoKI/qfewfyg26AMwOhOnit6QwwFvrN5l1m8MtJ771adL/
 LB1h1YGzrNrYb7DS5f5N5Y6YkmLQbiHMi1m8SstMUuYdIMzp5zQnEaOQL43m34Fw15ZW
 DpuW8YQM1f5kDQn3MGQMfJhHRJUyBkcjsY1BHVS9KSssUOatCCjSQaqEvmBdB8bPbL8M
 7QAjGWJBsckn5kneVvw0Irz6E0pmmV8/aTETdGPoDqG7D7oulkKjwQVvJDt5LjWkueQ3
 qQGAqYYCj5usUczuQJHffUWU+DkINoG7nEgypflCEbELqqgn6bplDJwayqyNbjoIgOD+ iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg79dyvsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:25:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23IFJIvp031153;
 Mon, 18 Apr 2022 15:25:19 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg79dyvs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:25:19 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23IFKltc016286;
 Mon, 18 Apr 2022 15:25:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 3ffne9etgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:25:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23IFPHEr26083802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 15:25:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38C8CAE060;
 Mon, 18 Apr 2022 15:25:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD393AE05F;
 Mon, 18 Apr 2022 15:25:15 +0000 (GMT)
Received: from [9.65.235.174] (unknown [9.65.235.174])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 15:25:15 +0000 (GMT)
Message-ID: <9cebd8fb-e7c2-690f-90f5-be84f9a9d6b1@linux.ibm.com>
Date: Mon, 18 Apr 2022 11:25:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/9] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
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
References: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
From: "Jason J. Herne" <jjherne@linux.ibm.com>
Organization: IBM
In-Reply-To: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xLFIuplWrGMb4izzQTVWhsbDAV-A_T-r
X-Proofpoint-ORIG-GUID: fd5UQ2plZHcyE-AzEOHOpSz_FcgI0X6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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
Reply-To: jjherne@linux.ibm.com
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 11:53, Jason Gunthorpe wrote:
> Every caller has a readily available vfio_device pointer, use that instead
> of passing in a generic struct device. The struct vfio_device already
> contains the group we need so this avoids complexity, extra refcountings,
> and a confusing lifecycle model.
> ...
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

Could be contracted to a single line. If you feel like it :)

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
>   

Looks good to me.
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>

-- 
-- Jason J. Herne (jjherne@linux.ibm.com)
