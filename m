Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD048EF49
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 18:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39610E208;
	Fri, 14 Jan 2022 17:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4083 seconds by postgrey-1.36 at gabe;
 Fri, 14 Jan 2022 17:39:08 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BED10E208;
 Fri, 14 Jan 2022 17:39:08 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20EGMNq0016698; 
 Fri, 14 Jan 2022 16:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=/QOqJYrAkqkDoyl5f/SXVlq9sIDfJ1+JRVFrbSbkUek=;
 b=UTJMsSpo8gxO9yGnP8PjdzMSPsk9KcYpT8xBBRspCuVdL+sn963Fb4qC9E7G+HAB8ktK
 x6odgssV+/wQrVaa4oqp+JCfVgk/GqN1hGKl/OxVTohtVjnOy/itHSWFFojSClWB+zP4
 tY/6GQ3/mzvh/MNFT0IlXelFoxXrFg0JsJf3aXK58P7k5UclUa0Szqls30/sFtBPcFFE
 5Tirz6dvcOpiy3I0RiR/uDmc8DhgsPfUWcUqiU7qRw8HoJpdePKfVJWV0b/nT5aC96PV
 NtbJXdrgeY7Fd/DibcvylZYqD2pt2czpb5Rf2TsmyZXiRRGExHhhb88asjJyVheNCxUe oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dkcmy0691-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 16:30:59 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20EGPkOj028484;
 Fri, 14 Jan 2022 16:30:52 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dkcmy068k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 16:30:52 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20EGNnQ3024754;
 Fri, 14 Jan 2022 16:30:51 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3df28d9hkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 16:30:51 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20EGUnm414877088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 16:30:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FE53B2068;
 Fri, 14 Jan 2022 16:30:49 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FC1DB2073;
 Fri, 14 Jan 2022 16:30:38 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.138.251])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jan 2022 16:30:38 +0000 (GMT)
Message-ID: <9866678ecaafffebbfad8493e192e248b8be8f27.camel@linux.ibm.com>
Subject: Re: [RE]: [PATCH v3 10/10] vfio/ccw: Move the lifecycle of the
 struct vfio_ccw_private to the mdev
From: Eric Farman <farman@linux.ibm.com>
To: Liu Yi L <yi.l.liu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Date: Fri, 14 Jan 2022 11:30:36 -0500
In-Reply-To: <24628dc7-c6b2-1287-b435-e12e7b3d59a8@intel.com>
References: <PH0PR11MB5658A7BB11922E5B6267892AC3619@PH0PR11MB5658.namprd11.prod.outlook.com>
 <595bba117f20742dd581fd951555b0e1f630264e.camel@linux.ibm.com>
 <PH0PR11MB565874CB787A1ACFB12CFF6CC3679@PH0PR11MB5658.namprd11.prod.outlook.com>
 <24628dc7-c6b2-1287-b435-e12e7b3d59a8@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JtOSlz1aMVMg-G8TAmlfqJw65u9tdlzJ
X-Proofpoint-ORIG-GUID: suqxGqL0RSsyoW7E2GMw_gYCHR1_IPcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201140108
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-14 at 20:28 +0800, Liu Yi L wrote:
> Hi Eric,
> 
> Hope you are back from new year holiday.:-) Have you got chane to
> consider
> this patch?

Hi Yi Liu,

It's coming up the list, but it's not there yet. Haven't forgotten. :)

Eric

> 
> Regards,
> Yi Liu
> 
> On 2021/11/30 19:32, Liu, Yi L wrote:
> > > From: Eric Farman <farman@linux.ibm.com>
> > > Sent: Tuesday, November 30, 2021 1:18 AM
> > > 
> > > On Wed, 2021-11-24 at 12:25 +0000, Liu, Yi L wrote:
> > > > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > > > Sent: Fri, 1 Oct 2021 14:52:51 -0300
> > > > > 
> > > > > The css_driver's main purpose is to create/destroy the mdev
> > > > > and
> > > > > relay the
> > > > > shutdown, irq, sch_event, and chp_event css_driver ops to the
> > > > > single
> > > > > created vfio_device, if it exists.
> > > > > 
> > > > > Reframe the boundary where the css_driver domain switches to
> > > > > the
> > > > > vfio
> > > > > domain by using rcu to read and refcount the vfio_device out
> > > > > of the
> > > > > sch's
> > > > > drvdata. The mdev probe/remove will manage the drvdata of the
> > > > > parent.
> > > > > 
> > > > > The vfio core code refcounting thus guarantees that when a
> > > > > css_driver
> > > > > callback is running the vfio_device is registered,
> > > > > simplifying the
> > > > > understanding of the whole lifecycle.
> > > > > 
> > > > > Finally the vfio_ccw_private is allocated/freed during
> > > > > probe/remove
> > > > > of the
> > > > > mdev like any other vfio_device struct.
> > > > 
> > > > Hi Eric,
> > > > 
> > > > how about the status of this patch?
> > > 
> > > Hi YiLiu,
> > > 
> > > To be honest I never got this far in the series, as the middle of
> > > the
> > > series got into some more involved rework than I had the
> > > bandwidth to
> > > consider. Not sure I'll be able to do anything with it before the
> > > year
> > > end holiday, but I've noted your interest in getting this in line
> > > with
> > > the rest of vfio_device so I don't drop it too far down the list.
> > 
> > thanks. look forward to your further thoughts on it. e.g. the
> > rework
> > things and gaps in this cleanup.
> > 
> > Regards,
> > Yi Liu
> > 
> > > Thanks,
> > > Eric
> > > 
> > > > I found it is a good clean up to make
> > > > vfio ccw behave same with other vfio_device users. Also, I'd
> > > > like to
> > > > do a clean up to consolidate the vfio_device allocation which
> > > > needs the
> > > > vfio ccw private allocation happen in the mdev probe. So it
> > > > would be nice
> > > > to build the cleanup based on this patch.
> > > > 
> > > > Regards,
> > > > Yi Liu
> > > > 
> > > > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > > > ---
> > > > >   drivers/s390/cio/vfio_ccw_drv.c     | 67 ++++++++++++++--
> > > > > ---------
> > > > > ----
> > > > >   drivers/s390/cio/vfio_ccw_ops.c     | 40 +++++++----------
> > > > >   drivers/s390/cio/vfio_ccw_private.h | 23 +++++++++-
> > > > >   3 files changed, 69 insertions(+), 61 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/s390/cio/vfio_ccw_drv.c
> > > > > b/drivers/s390/cio/vfio_ccw_drv.c
> > > > > index 18ad047811d111..c5582fc9c46c9e 100644
> > > > > --- a/drivers/s390/cio/vfio_ccw_drv.c
> > > > > +++ b/drivers/s390/cio/vfio_ccw_drv.c
> > > > > @@ -86,13 +86,19 @@ static void vfio_ccw_crw_todo(struct
> > > > > work_struct *work)
> > > > >    */
> > > > >   static void vfio_ccw_sch_irq(struct subchannel *sch)
> > > > >   {
> > > > > -	struct vfio_ccw_private *private =
> > > > > dev_get_drvdata(&sch->dev);
> > > > > +	struct vfio_ccw_private *private =
> > > > > vfio_ccw_get_priv(sch);
> > > > > +
> > > > > +	/* IRQ should not be delivered after the mdev is
> > > > > destroyed */
> > > > > +	if (WARN_ON(!private))
> > > > > +		return;
> > > > > 
> > > > >   	inc_irq_stat(IRQIO_CIO);
> > > > >   	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
> > > > > +	vfio_device_put(&private->vdev);
> > > > >   }
> > > > > 
> > > > > -static struct vfio_ccw_private
> > > > > *vfio_ccw_alloc_private(struct
> > > > > subchannel *sch)
> > > > > +struct vfio_ccw_private *vfio_ccw_alloc_private(struct
> > > > > mdev_device
> > > > > *mdev,
> > > > > +						struct
> > > > > subchannel *sch)
> > > > >   {
> > > > >   	struct vfio_ccw_private *private;
> > > > > 
> > > > > @@ -100,6 +106,8 @@ static struct vfio_ccw_private
> > > > > *vfio_ccw_alloc_private(struct subchannel *sch)
> > > > >   	if (!private)
> > > > >   		return ERR_PTR(-ENOMEM);
> > > > > 
> > > > > +	vfio_init_group_dev(&private->vdev, &mdev->dev,
> > > > > +			    &vfio_ccw_dev_ops);
> > > > >   	private->sch = sch;
> > > > >   	mutex_init(&private->io_mutex);
> > > > >   	private->state = VFIO_CCW_STATE_CLOSED;
> > > > > @@ -145,11 +153,12 @@ static struct vfio_ccw_private
> > > > > *vfio_ccw_alloc_private(struct subchannel *sch)
> > > > >   	kfree(private->cp.guest_cp);
> > > > >   out_free_private:
> > > > >   	mutex_destroy(&private->io_mutex);
> > > > > +	vfio_uninit_group_dev(&private->vdev);
> > > > >   	kfree(private);
> > > > >   	return ERR_PTR(-ENOMEM);
> > > > >   }
> > > > > 
> > > > > -static void vfio_ccw_free_private(struct vfio_ccw_private
> > > > > *private)
> > > > > +void vfio_ccw_free_private(struct vfio_ccw_private *private)
> > > > >   {
> > > > >   	struct vfio_ccw_crw *crw, *temp;
> > > > > 
> > > > > @@ -164,14 +173,14 @@ static void
> > > > > vfio_ccw_free_private(struct
> > > > > vfio_ccw_private *private)
> > > > >   	kmem_cache_free(vfio_ccw_io_region, private-
> > > > > >io_region);
> > > > >   	kfree(private->cp.guest_cp);
> > > > >   	mutex_destroy(&private->io_mutex);
> > > > > -	kfree(private);
> > > > > +	vfio_uninit_group_dev(&private->vdev);
> > > > > +	kfree_rcu(private, rcu);
> > > > >   }
> > > > > 
> > > > >   static int vfio_ccw_sch_probe(struct subchannel *sch)
> > > > >   {
> > > > >   	struct pmcw *pmcw = &sch->schib.pmcw;
> > > > > -	struct vfio_ccw_private *private;
> > > > > -	int ret = -ENOMEM;
> > > > > +	int ret;
> > > > > 
> > > > >   	if (pmcw->qf) {
> > > > >   		dev_warn(&sch->dev, "vfio: ccw: does not
> > > > > support QDIO:
> > > > > %s\n",
> > > > > @@ -179,15 +188,9 @@ static int vfio_ccw_sch_probe(struct
> > > > > subchannel *sch)
> > > > >   		return -ENODEV;
> > > > >   	}
> > > > > 
> > > > > -	private = vfio_ccw_alloc_private(sch);
> > > > > -	if (IS_ERR(private))
> > > > > -		return PTR_ERR(private);
> > > > > -
> > > > > -	dev_set_drvdata(&sch->dev, private);
> > > > > -
> > > > > -	ret = vfio_ccw_mdev_reg(sch);
> > > > > +	ret = mdev_register_device(&sch->dev,
> > > > > &vfio_ccw_mdev_ops);
> > > > >   	if (ret)
> > > > > -		goto out_free;
> > > > > +		return ret;
> > > > > 
> > > > >   	if (dev_get_uevent_suppress(&sch->dev)) {
> > > > >   		dev_set_uevent_suppress(&sch->dev, 0);
> > > > > @@ -198,22 +201,11 @@ static int vfio_ccw_sch_probe(struct
> > > > > subchannel *sch)
> > > > >   			   sch->schid.cssid, sch->schid.ssid,
> > > > >   			   sch->schid.sch_no);
> > > > >   	return 0;
> > > > > -
> > > > > -out_free:
> > > > > -	dev_set_drvdata(&sch->dev, NULL);
> > > > > -	vfio_ccw_free_private(private);
> > > > > -	return ret;
> > > > >   }
> > > > > 
> > > > >   static void vfio_ccw_sch_remove(struct subchannel *sch)
> > > > >   {
> > > > > -	struct vfio_ccw_private *private =
> > > > > dev_get_drvdata(&sch->dev);
> > > > > -
> > > > > -	vfio_ccw_mdev_unreg(sch);
> > > > > -
> > > > > -	dev_set_drvdata(&sch->dev, NULL);
> > > > > -
> > > > > -	vfio_ccw_free_private(private);
> > > > > +	mdev_unregister_device(&sch->dev);
> > > > > 
> > > > >   	VFIO_CCW_MSG_EVENT(4, "unbound from
> > > subchannel %x.%x.%04x\n",
> > > > >   			   sch->schid.cssid, sch->schid.ssid,
> > > > > @@ -222,10 +214,14 @@ static void vfio_ccw_sch_remove(struct
> > > > > subchannel *sch)
> > > > > 
> > > > >   static void vfio_ccw_sch_shutdown(struct subchannel *sch)
> > > > >   {
> > > > > -	struct vfio_ccw_private *private =
> > > > > dev_get_drvdata(&sch->dev);
> > > > > +	struct vfio_ccw_private *private =
> > > > > vfio_ccw_get_priv(sch);
> > > > > +
> > > > > +	if (!private)
> > > > > +		return;
> > > > > 
> > > > >   	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
> > > > >   	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
> > > > > +	vfio_device_put(&private->vdev);
> > > > >   }
> > > > > 
> > > > >   /**
> > > > > @@ -240,14 +236,14 @@ static void
> > > > > vfio_ccw_sch_shutdown(struct
> > > > > subchannel *sch)
> > > > >    */
> > > > >   static int vfio_ccw_sch_event(struct subchannel *sch, int
> > > > > process)
> > > > >   {
> > > > > -	struct vfio_ccw_private *private =
> > > > > dev_get_drvdata(&sch->dev);
> > > > > +	struct vfio_ccw_private *private =
> > > > > vfio_ccw_get_priv(sch);
> > > > >   	unsigned long flags;
> > > > >   	int rc = -EAGAIN;
> > > > > 
> > > > > -	spin_lock_irqsave(sch->lock, flags);
> > > > > -	if (!device_is_registered(&sch->dev))
> > > > > -		goto out_unlock;
> > > > > +	if (!private)
> > > > > +		return -EAGAIN;
> > > > > 
> > > > > +	spin_lock_irqsave(sch->lock, flags);
> > > > >   	if (work_pending(&sch->todo_work))
> > > > >   		goto out_unlock;
> > > > > 
> > > > > @@ -260,7 +256,7 @@ static int vfio_ccw_sch_event(struct
> > > > > subchannel
> > > > > *sch, int process)
> > > > > 
> > > > >   out_unlock:
> > > > >   	spin_unlock_irqrestore(sch->lock, flags);
> > > > > -
> > > > > +	vfio_device_put(&private->vdev);
> > > > >   	return rc;
> > > > >   }
> > > > > 
> > > > > @@ -294,7 +290,7 @@ static void vfio_ccw_queue_crw(struct
> > > > > vfio_ccw_private *private,
> > > > >   static int vfio_ccw_chp_event(struct subchannel *sch,
> > > > >   			      struct chp_link *link, int event)
> > > > >   {
> > > > > -	struct vfio_ccw_private *private =
> > > > > dev_get_drvdata(&sch->dev);
> > > > > +	struct vfio_ccw_private *private =
> > > > > vfio_ccw_get_priv(sch);
> > > > >   	int mask = chp_ssd_get_mask(&sch->ssd_info, link);
> > > > >   	int retry = 255;
> > > > > 
> > > > > @@ -307,8 +303,10 @@ static int vfio_ccw_chp_event(struct
> > > > > subchannel *sch,
> > > > >   			   sch->schid.ssid, sch->schid.sch_no,
> > > > >   			   mask, event);
> > > > > 
> > > > > -	if (cio_update_schib(sch))
> > > > > +	if (cio_update_schib(sch)) {
> > > > > +		vfio_device_put(&private->vdev);
> > > > >   		return -ENODEV;
> > > > > +	}
> > > > > 
> > > > >   	switch (event) {
> > > > >   	case CHP_VARY_OFF:
> > > > > @@ -338,6 +336,7 @@ static int vfio_ccw_chp_event(struct
> > > > > subchannel
> > > > > *sch,
> > > > >   		break;
> > > > >   	}
> > > > > 
> > > > > +	vfio_device_put(&private->vdev);
> > > > >   	return 0;
> > > > >   }
> > > > > 
> > > > > diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> > > > > b/drivers/s390/cio/vfio_ccw_ops.c
> > > > > index 68aae25a0a4be0..414b11ea7eebf9 100644
> > > > > --- a/drivers/s390/cio/vfio_ccw_ops.c
> > > > > +++ b/drivers/s390/cio/vfio_ccw_ops.c
> > > > > @@ -17,8 +17,6 @@
> > > > > 
> > > > >   #include "vfio_ccw_private.h"
> > > > > 
> > > > > -static const struct vfio_device_ops vfio_ccw_dev_ops;
> > > > > -
> > > > >   static int vfio_ccw_mdev_reset(struct vfio_ccw_private
> > > > > *private)
> > > > >   {
> > > > >   	/*
> > > > > @@ -88,26 +86,27 @@ static struct attribute_group
> > > > > *mdev_type_groups[] = {
> > > > > 
> > > > >   static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
> > > > >   {
> > > > > -	struct vfio_ccw_private *private =
> > > > > dev_get_drvdata(mdev-
> > > > > > dev.parent);
> > > > > +	struct subchannel *sch = to_subchannel(mdev-
> > > > > >dev.parent);
> > > > > +	struct vfio_ccw_private *private;
> > > > >   	int ret;
> > > > > 
> > > > > -	memset(&private->vdev, 0, sizeof(private->vdev));
> > > > > -	vfio_init_group_dev(&private->vdev, &mdev->dev,
> > > > > -			    &vfio_ccw_dev_ops);
> > > > > +	private = vfio_ccw_alloc_private(mdev, sch);
> > > > > +	if (IS_ERR(private))
> > > > > +		return PTR_ERR(private);
> > > > > 
> > > > >   	VFIO_CCW_MSG_EVENT(2, "mdev %s, sch %x.%x.%04x:
> > > > > create\n",
> > > > > -			   dev_name(private->vdev.dev),
> > > > > -			   private->sch->schid.cssid, private-
> > > > > >sch-
> > > > > > schid.ssid,
> > > > > -			   private->sch->schid.sch_no);
> > > > > +			   dev_name(private->vdev.dev), sch-
> > > > > > schid.cssid,
> > > > > +			   sch->schid.ssid, sch->schid.sch_no);
> > > > > 
> > > > >   	ret = vfio_register_emulated_iommu_dev(&private->vdev);
> > > > >   	if (ret)
> > > > > -		goto err_init;
> > > > > +		goto err_alloc;
> > > > >   	dev_set_drvdata(&mdev->dev, private);
> > > > > +	dev_set_drvdata(&sch->dev, private);
> > > > >   	return 0;
> > > > > 
> > > > > -err_init:
> > > > > -	vfio_uninit_group_dev(&private->vdev);
> > > > > +err_alloc:
> > > > > +	vfio_ccw_free_private(private);
> > > > >   	return ret;
> > > > >   }
> > > > > 
> > > > > @@ -120,8 +119,9 @@ static void vfio_ccw_mdev_remove(struct
> > > > > mdev_device *mdev)
> > > > >   			   private->sch->schid.cssid, private-
> > > > > >sch-
> > > > > > schid.ssid,
> > > > >   			   private->sch->schid.sch_no);
> > > > > 
> > > > > +	dev_set_drvdata(&private->sch->dev, NULL);
> > > > >   	vfio_unregister_group_dev(&private->vdev);
> > > > > -	vfio_uninit_group_dev(&private->vdev);
> > > > > +	vfio_ccw_free_private(private);
> > > > >   }
> > > > > 
> > > > >   static int vfio_ccw_mdev_open_device(struct vfio_device
> > > > > *vdev)
> > > > > @@ -595,7 +595,7 @@ static unsigned int
> > > > > vfio_ccw_get_available(struct mdev_type *mtype)
> > > > >   	return 1;
> > > > >   }
> > > > > 
> > > > > -static const struct vfio_device_ops vfio_ccw_dev_ops = {
> > > > > +const struct vfio_device_ops vfio_ccw_dev_ops = {
> > > > >   	.open_device = vfio_ccw_mdev_open_device,
> > > > >   	.close_device = vfio_ccw_mdev_close_device,
> > > > >   	.read = vfio_ccw_mdev_read,
> > > > > @@ -615,19 +615,9 @@ struct mdev_driver vfio_ccw_mdev_driver
> > > > > = {
> > > > >   	.get_available = vfio_ccw_get_available,
> > > > >   };
> > > > > 
> > > > > -static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
> > > > > +const struct mdev_parent_ops vfio_ccw_mdev_ops = {
> > > > >   	.owner			= THIS_MODULE,
> > > > >   	.device_driver		= &vfio_ccw_mdev_driver,
> > > > >   	.device_api		= VFIO_DEVICE_API_CCW_STRING,
> > > > >   	.supported_type_groups  = mdev_type_groups,
> > > > >   };
> > > > > -
> > > > > -int vfio_ccw_mdev_reg(struct subchannel *sch)
> > > > > -{
> > > > > -	return mdev_register_device(&sch->dev,
> > > > > &vfio_ccw_mdev_ops);
> > > > > -}
> > > > > -
> > > > > -void vfio_ccw_mdev_unreg(struct subchannel *sch)
> > > > > -{
> > > > > -	mdev_unregister_device(&sch->dev);
> > > > > -}
> > > > > diff --git a/drivers/s390/cio/vfio_ccw_private.h
> > > > > b/drivers/s390/cio/vfio_ccw_private.h
> > > > > index 67ee9c624393b0..852ff94fc107d6 100644
> > > > > --- a/drivers/s390/cio/vfio_ccw_private.h
> > > > > +++ b/drivers/s390/cio/vfio_ccw_private.h
> > > > > @@ -24,6 +24,8 @@
> > > > >   #include "css.h"
> > > > >   #include "vfio_ccw_cp.h"
> > > > > 
> > > > > +struct mdev_device;
> > > > > +
> > > > >   #define VFIO_CCW_OFFSET_SHIFT   10
> > > > >   #define VFIO_CCW_OFFSET_TO_INDEX(off)	(off >>
> > > > > VFIO_CCW_OFFSET_SHIFT)
> > > > >   #define VFIO_CCW_INDEX_TO_OFFSET(index)	((u64)(index)
> > > > > <<
> > > > > VFIO_CCW_OFFSET_SHIFT)
> > > > > @@ -69,6 +71,7 @@ struct vfio_ccw_crw {
> > > > >   /**
> > > > >    * struct vfio_ccw_private
> > > > >    * @vdev: Embedded VFIO device
> > > > > + * @rcu: head for kfree_rcu()
> > > > >    * @sch: pointer to the subchannel
> > > > >    * @state: internal state of the device
> > > > >    * @completion: synchronization helper of the I/O
> > > > > completion
> > > > > @@ -91,6 +94,7 @@ struct vfio_ccw_crw {
> > > > >    */
> > > > >   struct vfio_ccw_private {
> > > > >   	struct vfio_device vdev;
> > > > > +	struct rcu_head rcu;
> > > > >   	struct subchannel	*sch;
> > > > >   	int			state;
> > > > >   	struct completion	*completion;
> > > > > @@ -115,10 +119,25 @@ struct vfio_ccw_private {
> > > > >   	struct work_struct	crw_work;
> > > > >   } __aligned(8);
> > > > > 
> > > > > -extern int vfio_ccw_mdev_reg(struct subchannel *sch);
> > > > > -extern void vfio_ccw_mdev_unreg(struct subchannel *sch);
> > > > > +struct vfio_ccw_private *vfio_ccw_alloc_private(struct
> > > > > mdev_device
> > > > > *mdev,
> > > > > +						struct
> > > > > subchannel
> > > > > *sch);
> > > > > +void vfio_ccw_free_private(struct vfio_ccw_private
> > > > > *private);
> > > > > 
> > > > >   extern struct mdev_driver vfio_ccw_mdev_driver;
> > > > > +extern const struct mdev_parent_ops vfio_ccw_mdev_ops;
> > > > > +extern const struct vfio_device_ops vfio_ccw_dev_ops;
> > > > > +
> > > > > +static inline struct vfio_ccw_private
> > > > > *vfio_ccw_get_priv(struct
> > > > > subchannel *sch)
> > > > > +{
> > > > > +	struct vfio_ccw_private *private;
> > > > > +
> > > > > +	rcu_read_lock();
> > > > > +	private = dev_get_drvdata(&sch->dev);
> > > > > +	if (private && !vfio_device_try_get(&private->vdev))
> > > > > +		private = NULL;
> > > > > +	rcu_read_unlock();
> > > > > +	return private;
> > > > > +}
> > > > > 
> > > > >   /*
> > > > >    * States of the device statemachine.
> > > > > --
> > > > > 2.33.0

