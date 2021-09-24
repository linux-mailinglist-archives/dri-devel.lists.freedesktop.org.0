Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47558417C68
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 22:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C696E23B;
	Fri, 24 Sep 2021 20:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1006E23B;
 Fri, 24 Sep 2021 20:37:57 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OIe81S020426; 
 Fri, 24 Sep 2021 16:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=6/nUw5At1aN1CT7b27JpFvMKOk4+CitUZqiAFwOaYWY=;
 b=ETiVHkINm08KvWlpWSzR7vkWNKlGBOuTf44DqGOdzP7RNL7TgwTQ8zvWEypOcAWYQoRf
 XU5dsSAFhYctzBfEJ5n3gCqUW7x0201NzHpenN+0TmC/H/nnb/Sh5tpMYKq3kZh650W3
 uNuF3y1XG43Kh6StejOk1/+NGsCXh/R0CfEKZk/+u3LIiLKNp5MVORCgFZW2qxhHH50X
 mYEG8K0kthfHYSz2RM4mIWOVb4ezgSLfM2dMDAeXo54mthJqLg6pwD+Sx4e18Z+0G+Ku
 75Q3Qgeqf1OtNZXPz/bIa6uoqZ0p/03wWbMb3QX8//wZYafb7UmAG/FjUSyluq2hBhSu 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b991et954-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:37:52 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18OKbqxu023722;
 Fri, 24 Sep 2021 16:37:52 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b991et94s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:37:51 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OKSM8A030037;
 Fri, 24 Sep 2021 20:37:51 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3b93g7mm1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 20:37:51 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OKbocD27918732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 20:37:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 292AC12405A;
 Fri, 24 Sep 2021 20:37:50 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46A25124054;
 Fri, 24 Sep 2021 20:37:44 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.34.14])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 20:37:44 +0000 (GMT)
Message-ID: <9c1f3f9321f595e6d42dab1413637ad927b6bf2d.camel@linux.ibm.com>
Subject: Re: [PATCH v2 3/9] vfio/ccw: Convert to use vfio_register_group_dev()
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Date: Fri, 24 Sep 2021 16:37:43 -0400
In-Reply-To: <3-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: <3-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Pe-5TWfx0OkA7Xf0fxmKLuWfEvxU88oH
X-Proofpoint-GUID: XJdgXexPzpEuKd86av5RkT9tD0GdhQ34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240124
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-09-09 at 16:38 -0300, Jason Gunthorpe wrote:
> This is a more complicated conversion because vfio_ccw is sharing the
> vfio_device between both the mdev_device, its vfio_device and the
> css_driver.
> 
> The mdev is a singleton, and the reason for this sharing is so the
> extra
> css_driver function callbacks to be delivered to the vfio_device
> implementation.
> 
> This keeps things as they are, with the css_driver allocating the
> singleton, not the mdev_driver. Following patches work to clean this
> further.
> 
> Embed the vfio_device in the vfio_ccw_private and instantiate it as a
> vfio_device when the mdev probes. The drvdata of both the css_device
> and
> the mdev_device point at the private, and container_of is used to get
> it
> back from the vfio_device.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_drv.c     |  21 ++++--
>  drivers/s390/cio/vfio_ccw_ops.c     | 107 +++++++++++++++++---------
> --
>  drivers/s390/cio/vfio_ccw_private.h |   5 ++
>  3 files changed, 85 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_drv.c
> b/drivers/s390/cio/vfio_ccw_drv.c
> index 1e8d3151e5480e..396e815f81f8a4 100644
> --- a/drivers/s390/cio/vfio_ccw_drv.c
> +++ b/drivers/s390/cio/vfio_ccw_drv.c
> @@ -469,7 +469,7 @@ static int __init vfio_ccw_sch_init(void)
>  	vfio_ccw_work_q = create_singlethread_workqueue("vfio-ccw");
>  	if (!vfio_ccw_work_q) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_io_region =
> kmem_cache_create_usercopy("vfio_ccw_io_region",
> @@ -478,7 +478,7 @@ static int __init vfio_ccw_sch_init(void)
>  					sizeof(struct ccw_io_region),
> NULL);
>  	if (!vfio_ccw_io_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_cmd_region =
> kmem_cache_create_usercopy("vfio_ccw_cmd_region",
> @@ -487,7 +487,7 @@ static int __init vfio_ccw_sch_init(void)
>  					sizeof(struct ccw_cmd_region),
> NULL);
>  	if (!vfio_ccw_cmd_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_schib_region =
> kmem_cache_create_usercopy("vfio_ccw_schib_region",
> @@ -497,7 +497,7 @@ static int __init vfio_ccw_sch_init(void)
>  
>  	if (!vfio_ccw_schib_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_crw_region =
> kmem_cache_create_usercopy("vfio_ccw_crw_region",
> @@ -507,19 +507,25 @@ static int __init vfio_ccw_sch_init(void)
>  
>  	if (!vfio_ccw_crw_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
> +	ret = mdev_register_driver(&vfio_ccw_mdev_driver);
> +	if (ret)
> +		goto out_regions;
> +
>  	isc_register(VFIO_CCW_ISC);
>  	ret = css_driver_register(&vfio_ccw_sch_driver);
>  	if (ret) {
>  		isc_unregister(VFIO_CCW_ISC);
> -		goto out_err;
> +		goto out_driver;
>  	}
>  
>  	return ret;
>  
> -out_err:
> +out_driver:
> +	mdev_unregister_driver(&vfio_ccw_mdev_driver);
> +out_regions:
>  	vfio_ccw_destroy_regions();
>  	destroy_workqueue(vfio_ccw_work_q);
>  	vfio_ccw_debug_exit();
> @@ -528,6 +534,7 @@ static int __init vfio_ccw_sch_init(void)
>  
>  static void __exit vfio_ccw_sch_exit(void)
>  {
> +	mdev_unregister_driver(&vfio_ccw_mdev_driver);

Wouldn't it be better to mirror the unwind-init case, such that the
above goes...

>  	css_driver_unregister(&vfio_ccw_sch_driver);
>  	isc_unregister(VFIO_CCW_ISC);

...here?

>  	vfio_ccw_destroy_regions();
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c 

...snip...

Besides that, looks fine to me.

