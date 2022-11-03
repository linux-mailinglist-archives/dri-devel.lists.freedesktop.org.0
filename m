Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EFF618CC1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 00:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807A410E6E0;
	Thu,  3 Nov 2022 23:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B7D10E6DB;
 Thu,  3 Nov 2022 23:24:42 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3MfwEj005445;
 Thu, 3 Nov 2022 23:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zc5rWZXfabFGEmpTGDrrbFhRCq21QWjf98G9wRD8a+o=;
 b=ACQHQbwzF2h5IWMzbQTSexey2IwQwn74p3QsORivxyOE9SElzqQGgRIcPEGBrJKfkuBa
 nNxN0ydg+44Cm7q/srZX8ZNzJ2NHjvN6jM1hr+/qhGP77RwIdzrLTCppp49mEsM/LqFj
 H5325hjYpMPASpDVO4CiDW/5LlwsBpnpmqq/siFS7/ay/KanFzW44RG1RInK5n2I6kJT
 pJ1rsAQUiPEqd26szH91FcUBj5a6eYkNq0o8KV9U8u2MotA63KQjjQnrcozjmwYIg7CX
 0NAWR64fV5M4OHtv4i0mAf1YadiKadwy/nxodosTgLnwA3eVb9UQoPGEN+Oka16e02uN pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpjes7va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:24:30 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A3N9mSX034523;
 Thu, 3 Nov 2022 23:24:29 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpjes7ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:24:29 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3NKtPG022782;
 Thu, 3 Nov 2022 23:24:28 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3kgutawqb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:24:28 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3NORZv16646704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 23:24:27 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB82C58054;
 Thu,  3 Nov 2022 23:24:26 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2F3C5805C;
 Thu,  3 Nov 2022 23:24:17 +0000 (GMT)
Received: from [9.65.206.126] (unknown [9.65.206.126])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  3 Nov 2022 23:24:17 +0000 (GMT)
Message-ID: <f6ce5f07-2154-2ca2-3438-5fdf5318cea5@linux.ibm.com>
Date: Thu, 3 Nov 2022 19:24:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 5/7] vfio/ccw: remove release completion
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
References: <20221102150152.2521475-1-farman@linux.ibm.com>
 <20221102150152.2521475-6-farman@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20221102150152.2521475-6-farman@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -wTOhDecpS5g10_GbHPYxmTJsMDTDmyP
X-Proofpoint-ORIG-GUID: s59WmrhYiAOJDFqwEf_ScvSAq_oTnikl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030158
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
> There's enough separation between the parent and private structs now,
> that it is fine to remove the release completion hack.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

> ---
>  drivers/s390/cio/vfio_ccw_ops.c     | 14 +-------------
>  drivers/s390/cio/vfio_ccw_private.h |  3 ---
>  2 files changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index e45d4acb109b..8a929a9cf3c6 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -54,7 +54,6 @@ static int vfio_ccw_mdev_init_dev(struct vfio_device *vdev)
>  	INIT_LIST_HEAD(&private->crw);
>  	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
>  	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
> -	init_completion(&private->release_comp);
>  
>  	private->cp.guest_cp = kcalloc(CCWCHAIN_LEN_MAX, sizeof(struct ccw1),
>  				       GFP_KERNEL);
> @@ -137,7 +136,7 @@ static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
>  	struct vfio_ccw_private *private =
>  		container_of(vdev, struct vfio_ccw_private, vdev);
>  
> -	complete(&private->release_comp);
> +	vfio_ccw_free_private(private);
>  }
>  
>  static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
> @@ -155,17 +154,6 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
>  
>  	dev_set_drvdata(&parent->dev, NULL);
>  	vfio_put_device(&private->vdev);
> -	/*
> -	 * Wait for all active references on mdev are released so it
> -	 * is safe to defer kfree() to a later point.
> -	 *
> -	 * TODO: the clean fix is to split parent/mdev info from ccw
> -	 * private structure so each can be managed in its own life
> -	 * cycle.
> -	 */
> -	wait_for_completion(&private->release_comp);
> -
> -	vfio_ccw_free_private(private);
>  }
>  
>  static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
> diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
> index 747aba5f5272..2278fd38d34e 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -102,7 +102,6 @@ struct vfio_ccw_parent {
>   * @req_trigger: eventfd ctx for signaling userspace to return device
>   * @io_work: work for deferral process of I/O handling
>   * @crw_work: work for deferral process of CRW handling
> - * @release_comp: synchronization helper for vfio device release
>   */
>  struct vfio_ccw_private {
>  	struct vfio_device vdev;
> @@ -126,8 +125,6 @@ struct vfio_ccw_private {
>  	struct eventfd_ctx	*req_trigger;
>  	struct work_struct	io_work;
>  	struct work_struct	crw_work;
> -
> -	struct completion	release_comp;
>  } __aligned(8);
>  
>  int vfio_ccw_sch_quiesce(struct subchannel *sch);

