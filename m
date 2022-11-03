Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E568618CCE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 00:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A2910E6EC;
	Thu,  3 Nov 2022 23:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA83310E703;
 Thu,  3 Nov 2022 23:32:22 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3MfvV6013809;
 Thu, 3 Nov 2022 23:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Hd8lSwxwlK7HM4IzVeypMmGfqjcH+u9Jg5Zy3uC3Adk=;
 b=gJo5g4kJk5v04at/s20eY4wLwJeSGjKEzo2lMxbUvpQ87WuAmeApBQCK0074YVYq59pD
 AfdLKOYNitQvG8jSGA9jW06Xtl7Nnx8f8LA2sEgsMArBDM9wS4/bJwqplmeCL4KfUVlJ
 +v2J4lpSr96xRo4CbVUENpu8twxqdRPEiQhlnjBm4yG8vCeb2J8U37Kz1HMLP6uiK4DX
 1jpC7r273GiVHobkEv6z8pr3gv0kf6OTglBebuIyJOjtufyDFXSr9NVsW2GgvGBkWFz/
 i+V/4Il1lP90Ki0gpuYRFw2So3L0UUNzTr+8XZTVPVpbuNpl0dYSeXy8RxN5k7ymZVRB 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmphcse98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:32:20 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A3NMr2t019167;
 Thu, 3 Nov 2022 23:32:20 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmphcse8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:32:19 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3NKFeq013896;
 Thu, 3 Nov 2022 23:32:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 3kguta4qmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:32:18 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3NWGkl7799416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 23:32:17 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A01C458058;
 Thu,  3 Nov 2022 23:32:16 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B7B95805D;
 Thu,  3 Nov 2022 23:32:09 +0000 (GMT)
Received: from [9.65.206.126] (unknown [9.65.206.126])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  3 Nov 2022 23:32:09 +0000 (GMT)
Message-ID: <01901cda-ec1d-bdd2-4b0f-95ee372136b8@linux.ibm.com>
Date: Thu, 3 Nov 2022 19:32:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 6/7] vfio/ccw: replace vfio_init_device with _alloc_
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
References: <20221102150152.2521475-1-farman@linux.ibm.com>
 <20221102150152.2521475-7-farman@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20221102150152.2521475-7-farman@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VQwyVYCNSljC-7wAYhpPYTtdNnyaivAb
X-Proofpoint-ORIG-GUID: -oovFYQTH-gFlxW1Bo6bX3QfSC7EXS1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030161
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
 Jason Herne <jjherne@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/2/22 11:01 AM, Eric Farman wrote:
> Now that we have a reasonable separation of structs that follow
> the subchannel and mdev lifecycles, there's no reason we can't
> call the official vfio_alloc_device routine for our private data,
> and behave like everyone else.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/s390/cio/vfio_ccw_drv.c     | 18 ------------------
>  drivers/s390/cio/vfio_ccw_ops.c     | 28 ++++++++++++++++++----------
>  drivers/s390/cio/vfio_ccw_private.h |  2 --
>  drivers/vfio/vfio_main.c            | 10 +++++-----
>  include/linux/vfio.h                |  2 --
>  5 files changed, 23 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
> index 041cc0860f0e..fd58c0f4f8cc 100644
> --- a/drivers/s390/cio/vfio_ccw_drv.c
> +++ b/drivers/s390/cio/vfio_ccw_drv.c
> @@ -151,24 +151,6 @@ static void vfio_ccw_sch_irq(struct subchannel *sch)
>  	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
>  }
>  
> -void vfio_ccw_free_private(struct vfio_ccw_private *private)
> -{
> -	struct vfio_ccw_crw *crw, *temp;
> -
> -	list_for_each_entry_safe(crw, temp, &private->crw, next) {
> -		list_del(&crw->next);
> -		kfree(crw);
> -	}
> -
> -	kmem_cache_free(vfio_ccw_crw_region, private->crw_region);
> -	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
> -	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
> -	kmem_cache_free(vfio_ccw_io_region, private->io_region);
> -	kfree(private->cp.guest_cp);
> -	mutex_destroy(&private->io_mutex);
> -	kfree(private);
> -}
> -
>  static void vfio_ccw_free_parent(struct device *dev)
>  {
>  	struct vfio_ccw_parent *parent = container_of(dev, struct vfio_ccw_parent, dev);
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index 8a929a9cf3c6..1155f8bcedd9 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -102,15 +102,10 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
>  	struct vfio_ccw_private *private;
>  	int ret;
>  
> -	private = kzalloc(sizeof(*private), GFP_KERNEL);
> -	if (!private)
> -		return -ENOMEM;
> -
> -	ret = vfio_init_device(&private->vdev, &mdev->dev, &vfio_ccw_dev_ops);
> -	if (ret) {
> -		kfree(private);
> -		return ret;
> -	}
> +	private = vfio_alloc_device(vfio_ccw_private, vdev, &mdev->dev,
> +				    &vfio_ccw_dev_ops);
> +	if (IS_ERR(private))
> +		return PTR_ERR(private);

OK, and now it makes sense to switch to IS_ERR since _vfio_alloc_device uses ERR_PTR.  

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

