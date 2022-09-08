Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A525B27EA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5641A10E66C;
	Thu,  8 Sep 2022 20:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C570410E5CF;
 Thu,  8 Sep 2022 20:50:58 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288KKs9I027114;
 Thu, 8 Sep 2022 20:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+XL0OsCTyPo3KtrxghYjtT5oebYnjdUPYrKYApBZAio=;
 b=ZjGO66/T7Fli1IL8VImBRhMoCJWDO9sBOtjfQPloD+gNF6B2et/nuFABLsGIGX95a5h2
 0D0eb3iUc1Jael4KytOcjgbNzj4Yf0Mr1AhxNaQJvoHsQ6DcqEKYYEoRwiyxK9wthW+w
 vt8XIfKw7SArfaS27k2jnJXlsU9F9t9hfrbhGwEubScrWDSWKHG8cBXLRZmPjF29D+Vy
 1U1iIfrcKhTKWN+n/rCGvNuhXo6NriYe1PI6rhxK/MH9LlxYpHE6tpIXG2onbuS+Go14
 fQ81eEFcVzRCHTVVdfImNf2cowRH2sQ4XPLdFAClfRH4urlOG6TAiFAu2QvBO1S5/YAR Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfqbq0u1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 20:50:48 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 288KoleE027242;
 Thu, 8 Sep 2022 20:50:47 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfqbq0u0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 20:50:47 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 288KLT9B004719;
 Thu, 8 Sep 2022 20:50:45 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3jbxj9tmxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 20:50:45 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 288KoiLm11141672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Sep 2022 20:50:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB4BC112062;
 Thu,  8 Sep 2022 20:50:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0164B112061;
 Thu,  8 Sep 2022 20:50:42 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.160.58.117]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  8 Sep 2022 20:50:42 +0000 (GMT)
Message-ID: <847e98a82d8027ea9c6060467157fc697e1df7ce.camel@linux.ibm.com>
Subject: Re: [PATCH v2 13/15] vfio/ccw: Use the new device life cycle helpers
From: Eric Farman <farman@linux.ibm.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Vineeth
 Vijayan <vneethv@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne
 <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Longfang
 Liu <liulongfang@huawei.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Abhishek Sahu <abhsahu@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Date: Thu, 08 Sep 2022 16:50:42 -0400
In-Reply-To: <BN9PR11MB527631B53DF92D47B18F42448C409@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-14-kevin.tian@intel.com>
 <BN9PR11MB527631B53DF92D47B18F42448C409@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Aa0l0ppb7D2ChJgFMCnegFvsjWTbRnjb
X-Proofpoint-GUID: rxXxdbWcCOPYp5gt9d9pD0KpfD9TDu2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_12,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1011 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080073
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-09-08 at 07:19 +0000, Tian, Kevin wrote:
> ping @Eric Farman.
>=20
> ccw is the only tricky player in this series. Please help take a look
> in case of
> any oversight here.

Apologies, I had started looking at v1 before I left on holiday, and
only returned today.

>=20
> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Thursday, September 1, 2022 10:38 PM
> >=20
> > ccw is the only exception which cannot use vfio_alloc_device()
> > because
> > its private device structure is designed to serve both mdev and
> > parent.
> > Life cycle of the parent is managed by css_driver so
> > vfio_ccw_private
> > must be allocated/freed in css_driver probe/remove path instead of
> > conforming to vfio core life cycle for mdev.
> >=20
> > Given that use a wait/completion scheme so the mdev remove path
> > waits
> > after vfio_put_device() until receiving a completion notification
> > from
> > @release. The completion indicates that all active references on
> > vfio_device have been released.
> >=20
> > After that point although free of vfio_ccw_private is delayed to
> > css_driver it's at least guaranteed to have no parallel reference
> > on
> > released vfio device part from other code paths.
> >=20
> > memset() in @probe is removed. vfio_device is either already
> > cleared
> > when probed for the first time or cleared in @release from last
> > probe.
> >=20
> > The right fix is to introduce separate structures for mdev and
> > parent,
> > but this won't happen in short term per prior discussions.

I did start looking at the above, while the mdev series is outstanding.
Will try to get back to that sooner rather than later, but for the
purposes of this series this patch looks/works fine to me.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> >=20
> > Remove vfio_init/uninit_group_dev() as no user now.
> >=20
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> > =C2=A0drivers/s390/cio/vfio_ccw_ops.c=C2=A0=C2=A0=C2=A0=C2=A0 | 52
> > +++++++++++++++++++++++++----
> > =C2=A0drivers/s390/cio/vfio_ccw_private.h |=C2=A0 3 ++
> > =C2=A0drivers/vfio/vfio_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +++----------
> > =C2=A0include/linux/vfio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 --
> > =C2=A04 files changed, 53 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> > b/drivers/s390/cio/vfio_ccw_ops.c
> > index 4a806a2273b5..9f8486c0d3d3 100644
> > --- a/drivers/s390/cio/vfio_ccw_ops.c
> > +++ b/drivers/s390/cio/vfio_ccw_ops.c
> > @@ -87,6 +87,15 @@ static struct attribute_group
> > *mdev_type_groups[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL,
> > =C2=A0};
> >=20
> > +static int vfio_ccw_mdev_init_dev(struct vfio_device *vdev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vfio_ccw_private *pri=
vate =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0container_of(vdev, struct vfio_ccw_private, vdev);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0init_completion(&private->re=
lease_comp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > +}
> > +
> > =C2=A0static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vfio_ccw_private=
 *private =3D dev_get_drvdata(mdev-
> > > dev.parent);
> > @@ -98,9 +107,9 @@ static int vfio_ccw_mdev_probe(struct
> > mdev_device
> > *mdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (atomic_dec_if_posit=
ive(&private->avail) < 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EPERM;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memset(&private->vdev, 0, si=
zeof(private->vdev));
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_init_group_dev(&private=
->vdev, &mdev->dev,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &vfio_ccw_dev_ops);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D vfio_init_device(&pr=
ivate->vdev, &mdev->dev,
> > &vfio_ccw_dev_ops);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ret;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VFIO_CCW_MSG_EVENT(2, "=
sch %x.%x.%04x: create\n",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 private->sch->schid.cssid,
> > @@ -109,16 +118,33 @@ static int vfio_ccw_mdev_probe(struct
> > mdev_device *mdev)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D vfio_register_e=
mulated_iommu_dev(&private->vdev);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_atomic;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_put_vdev;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_set_drvdata(&mdev->=
dev, private);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> >=20
> > -err_atomic:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_uninit_group_dev(&priva=
te->vdev);
> > +err_put_vdev:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_put_device(&private->vd=
ev);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_inc(&private->av=
ail);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > =C2=A0}
> >=20
> > +static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vfio_ccw_private *pri=
vate =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0container_of(vdev, struct vfio_ccw_private, vdev);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We cannot free vfio_ccw_p=
rivate here because it includes
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * parent info which must be=
 free'ed by css driver.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Use a workaround by memse=
t'ing the core device part and
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * then notifying the remove=
 path that all active
> > references
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to this device have been =
released.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memset(vdev, 0, sizeof(*vdev=
));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0complete(&private->release_c=
omp);
> > +}
> > +
> > =C2=A0static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vfio_ccw_private=
 *private =3D dev_get_drvdata(mdev-
> > > dev.parent);
> > @@ -130,7 +156,17 @@ static void vfio_ccw_mdev_remove(struct
> > mdev_device *mdev)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_unregister_group_d=
ev(&private->vdev);
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_uninit_group_dev(&priva=
te->vdev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_put_device(&private->vd=
ev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Wait for all active refer=
ences on mdev are released so
> > it
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is safe to defer kfree() =
to a later point.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * TODO: the clean fix is to=
 split parent/mdev info from
> > ccw
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * private structure so each=
 can be managed in its own life
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * cycle.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wait_for_completion(&private=
->release_comp);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_inc(&private->av=
ail);
> > =C2=A0}
> >=20
> > @@ -592,6 +628,8 @@ static void vfio_ccw_mdev_request(struct
> > vfio_device
> > *vdev, unsigned int count)
> > =C2=A0}
> >=20
> > =C2=A0static const struct vfio_device_ops vfio_ccw_dev_ops =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.init =3D vfio_ccw_mdev_init=
_dev,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.release =3D vfio_ccw_mdev_r=
elease_dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.open_device =3D vfio_c=
cw_mdev_open_device,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.close_device =3D vfio_=
ccw_mdev_close_device,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read =3D vfio_ccw_mdev=
_read,
> > diff --git a/drivers/s390/cio/vfio_ccw_private.h
> > b/drivers/s390/cio/vfio_ccw_private.h
> > index cd24b7fada91..63d9202b29c7 100644
> > --- a/drivers/s390/cio/vfio_ccw_private.h
> > +++ b/drivers/s390/cio/vfio_ccw_private.h
> > @@ -88,6 +88,7 @@ struct vfio_ccw_crw {
> > =C2=A0 * @req_trigger: eventfd ctx for signaling userspace to return
> > device
> > =C2=A0 * @io_work: work for deferral process of I/O handling
> > =C2=A0 * @crw_work: work for deferral process of CRW handling
> > + * @release_comp: synchronization helper for vfio device release
> > =C2=A0 */
> > =C2=A0struct vfio_ccw_private {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vfio_device vdev=
;
> > @@ -113,6 +114,8 @@ struct vfio_ccw_private {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct eventfd_ctx=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*req_trigger;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct work_struct=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0io_work;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct work_struct=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0crw_work;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct completion=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0release_comp;
> > =C2=A0} __aligned(8);
> >=20
> > =C2=A0int vfio_ccw_sch_quiesce(struct subchannel *sch);
> > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > index c9d982131265..957d9f286550 100644
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -481,28 +481,13 @@ static struct vfio_device
> > *vfio_group_get_device(struct vfio_group *group,
> > =C2=A0/*
> > =C2=A0 * VFIO driver API
> > =C2=A0 */
> > -void vfio_init_group_dev(struct vfio_device *device, struct device
> > *dev,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
 struct vfio_device_ops *ops)
> > -{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0init_completion(&device->com=
p);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0device->dev =3D dev;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0device->ops =3D ops;
> > -}
> > -EXPORT_SYMBOL_GPL(vfio_init_group_dev);
> > -
> > -void vfio_uninit_group_dev(struct vfio_device *device)
> > -{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_release_device_set(devi=
ce);
> > -}
> > -EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
> > -
> > =C2=A0/* Release helper called by vfio_put_device() */
> > =C2=A0void vfio_device_release(struct kref *kref)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vfio_device *dev=
ice =3D
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
container_of(kref, struct vfio_device,
> > kref);
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_uninit_group_dev(device=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_release_device_set(devi=
ce);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * kvfree() cannot be d=
one here due to a life cycle mess in
> > @@ -560,7 +545,9 @@ int vfio_init_device(struct vfio_device
> > *device, struct
> > device *dev,
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_init_group_dev(device, =
dev, ops);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0init_completion(&device->com=
p);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0device->dev =3D dev;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0device->ops =3D ops;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ops->init) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D ops->init(device);
> > @@ -572,7 +559,7 @@ int vfio_init_device(struct vfio_device
> > *device, struct
> > device *dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> >=20
> > =C2=A0out_uninit:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_uninit_group_dev(device=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vfio_release_device_set(devi=
ce);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(vfio_init_device);
> > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > index e1e9e8352903..f03447c8774d 100644
> > --- a/include/linux/vfio.h
> > +++ b/include/linux/vfio.h
> > @@ -160,9 +160,6 @@ static inline void vfio_put_device(struct
> > vfio_device
> > *device)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kref_put(&device->kref,=
 vfio_device_release);
> > =C2=A0}
> >=20
> > -void vfio_init_group_dev(struct vfio_device *device, struct device
> > *dev,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
 struct vfio_device_ops *ops);
> > -void vfio_uninit_group_dev(struct vfio_device *device);
> > =C2=A0int vfio_register_group_dev(struct vfio_device *device);
> > =C2=A0int vfio_register_emulated_iommu_dev(struct vfio_device *device);
> > =C2=A0void vfio_unregister_group_dev(struct vfio_device *device);
> > --
> > 2.21.3
>=20

