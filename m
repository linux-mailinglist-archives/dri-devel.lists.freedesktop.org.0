Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A4618C9B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 00:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F261E10E197;
	Thu,  3 Nov 2022 23:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137E10E068;
 Thu,  3 Nov 2022 23:11:05 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3Mg2JB013581;
 Thu, 3 Nov 2022 23:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xB856Lu7diRKCjl5rnj5/O7cdEYdY6h3ekCJEnbbrrQ=;
 b=Ynd0eLQJ8RZihEyqfNdw0UF3hAm1BpaX38YsZ6hFhEoQTRmYrc8MKQLuXctEdZhyoJlc
 +u+zZpb78eoaeCujYsTp/I98zJVOgIjZMCEhqlttE/Ad+c/4GPzr9dcKhybIpwK10D75
 YcXXg2VXtOORYUjaLMaoftS/DygnXzk/AN4VbgyHnT7Vol25ojZbNJQxyp2HGaP5M1CL
 gXtG+SXERdN44LquSou1TDYfk3x7IyrxQw5VuMHoczngr/qsBDts/MFT209qwn/oARGK
 45jAyZp0RSa5uIQhVO8hT/aR1aPrNGuRVwW3QOcda5ZW9XEuUqrr424Fiah1kwVNmhKm Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmphf116x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:10:46 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A3Mg33a013848;
 Thu, 3 Nov 2022 23:10:45 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmphf115n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:10:45 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3N4pel009486;
 Thu, 3 Nov 2022 23:10:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3kgutanh4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 23:10:44 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3NAgG314025316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 23:10:43 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E2285805D;
 Thu,  3 Nov 2022 23:10:42 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BD8358054;
 Thu,  3 Nov 2022 23:10:35 +0000 (GMT)
Received: from [9.65.206.126] (unknown [9.65.206.126])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  3 Nov 2022 23:10:34 +0000 (GMT)
Message-ID: <b0642bbc-b660-eb08-b965-d454053d59c3@linux.ibm.com>
Date: Thu, 3 Nov 2022 19:10:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/7] vfio/ccw: create a parent struct
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
References: <20221102150152.2521475-1-farman@linux.ibm.com>
 <20221102150152.2521475-2-farman@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20221102150152.2521475-2-farman@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xC6XjxJiLVveCShhM6cFbqayvK08JurO
X-Proofpoint-ORIG-GUID: xIazrtp8bBIDi6S_XTTPvQJjoqJbZUGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=973
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Move the stuff associated with the mdev parent (and thus the
> subchannel struct) into its own struct, and leave the rest in
> the existing private structure.
> 
> The subchannel will point to the parent, and the parent will point
> to the private, for the areas where one or both are needed. Further
> separation of these structs will follow.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  drivers/s390/cio/vfio_ccw_drv.c     | 96 ++++++++++++++++++++++++-----
>  drivers/s390/cio/vfio_ccw_ops.c     |  8 ++-
>  drivers/s390/cio/vfio_ccw_private.h | 20 ++++--
>  3 files changed, 100 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
> index 7f5402fe857a..06022fb37b9d 100644
> --- a/drivers/s390/cio/vfio_ccw_drv.c
> +++ b/drivers/s390/cio/vfio_ccw_drv.c
> @@ -36,10 +36,19 @@ debug_info_t *vfio_ccw_debug_trace_id;
>   */
>  int vfio_ccw_sch_quiesce(struct subchannel *sch)
>  {
> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	int iretry, ret = 0;
>  
> +	/*
> +	 * Probably an impossible situation, after being called through
> +	 * FSM callbacks. But in the event it did, register a warning
> +	 * and return as if things were fine.
> +	 */
> +	if (WARN_ON(!private))
> +		return 0;
> +
>  	iretry = 255;
>  	do {
>  
> @@ -121,7 +130,22 @@ static void vfio_ccw_crw_todo(struct work_struct *work)
>   */
>  static void vfio_ccw_sch_irq(struct subchannel *sch)
>  {
> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
> +
> +	/*
> +	 * The subchannel should still be disabled at this point,
> +	 * so an interrupt would be quite surprising. As with an
> +	 * interrupt while the FSM is closed, let's attempt to
> +	 * disable the subchannel again.
> +	 */
> +	if (!private) {
> +		VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: unexpected interrupt\n",
> +			sch->schid.cssid, sch->schid.ssid, sch->schid.sch_no);
> +
> +		cio_disable_subchannel(sch);
> +		return;
> +	}
>  
>  	inc_irq_stat(IRQIO_CIO);
>  	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
> @@ -201,10 +225,19 @@ static void vfio_ccw_free_private(struct vfio_ccw_private *private)
>  	mutex_destroy(&private->io_mutex);
>  	kfree(private);
>  }
> +
> +static void vfio_ccw_free_parent(struct device *dev)
> +{
> +	struct vfio_ccw_parent *parent = container_of(dev, struct vfio_ccw_parent, dev);
> +
> +	kfree(parent);
> +}
> +
>  static int vfio_ccw_sch_probe(struct subchannel *sch)
>  {
>  	struct pmcw *pmcw = &sch->schib.pmcw;
>  	struct vfio_ccw_private *private;
> +	struct vfio_ccw_parent *parent;
>  	int ret = -ENOMEM;
>  
>  	if (pmcw->qf) {
> @@ -213,41 +246,62 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
>  		return -ENODEV;
>  	}
>  
> +	parent = kzalloc(sizeof(*parent), GFP_KERNEL);
> +	if (IS_ERR(parent))
> +		return PTR_ERR(parent);
The error here would be a null ptr due to failed alloc, how about:

if (!parent)
	return -ENOMEM;

> +
> +	dev_set_name(&parent->dev, "parent");
> +	parent->dev.parent = &sch->dev;
> +	parent->dev.release = &vfio_ccw_free_parent;
> +	ret = device_register(&parent->dev);
> +	if (ret)
> +		goto out_free;
> +
>  	private = vfio_ccw_alloc_private(sch);
> -	if (IS_ERR(private))
> +	if (IS_ERR(private)) {
> +		put_device(&parent->dev);

As you said earlier, unregister_device()

>  		return PTR_ERR(private);
> +	}
>  
> -	dev_set_drvdata(&sch->dev, private);
> +	dev_set_drvdata(&sch->dev, parent);
> +	dev_set_drvdata(&parent->dev, private);
>  
> -	private->mdev_type.sysfs_name = "io";
> -	private->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
> -	private->mdev_types[0] = &private->mdev_type;
> -	ret = mdev_register_parent(&private->parent, &sch->dev,
> +	parent->mdev_type.sysfs_name = "io";
> +	parent->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
> +	parent->mdev_types[0] = &parent->mdev_type;
> +	ret = mdev_register_parent(&parent->parent, &sch->dev,
>  				   &vfio_ccw_mdev_driver,
> -				   private->mdev_types, 1);
> +				   parent->mdev_types, 1);
>  	if (ret)
> -		goto out_free;
> +		goto out_unreg;
>  
>  	VFIO_CCW_MSG_EVENT(4, "bound to subchannel %x.%x.%04x\n",
>  			   sch->schid.cssid, sch->schid.ssid,
>  			   sch->schid.sch_no);
>  	return 0;
>  
> +out_unreg:
> +	device_unregister(&parent->dev);
>  out_free:
> +	dev_set_drvdata(&parent->dev, NULL);
>  	dev_set_drvdata(&sch->dev, NULL);
>  	vfio_ccw_free_private(private);

if device_register(&parent->dev) failed above, you will goto out_free and call vfio_ccw_free_private before having done vfio_ccw_alloc_private (e.g. private==NULL).  Doesn't look like vfio_ccw_free_private handles that --  Either check !parent here or add a check to vfio_ccw_free_private.

> +	put_device(&parent->dev);

As you said in your other reply, this goes away

>  	return ret;
>  }
>  
>  static void vfio_ccw_sch_remove(struct subchannel *sch)
>  {
> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
>  
> -	mdev_unregister_parent(&private->parent);
> +	mdev_unregister_parent(&parent->parent);
>  
> +	device_unregister(&parent->dev);
>  	dev_set_drvdata(&sch->dev, NULL);
>  
>  	vfio_ccw_free_private(private);
> +	put_device(&parent->dev);

As you said in your other reply, this goes away

The rest looks fine, with these changes you can have:

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
