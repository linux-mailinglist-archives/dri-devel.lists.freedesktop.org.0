Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809E604F37
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2CB10E01F;
	Wed, 19 Oct 2022 17:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC85B10E01F;
 Wed, 19 Oct 2022 17:58:54 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JHK4BW028697;
 Wed, 19 Oct 2022 17:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wZzMm1jtxHr+WaUIZ4Y63cRmn37N5D0/4CBTCQveU6w=;
 b=JQ0O+II8QvaXO/4UtzqTF9r2/eJEwZi3jPXrE0+cM1KIUMAEfri6XVkVJz3CV8iRP4y8
 UALFzbQKJnMvm9c6XjWgoOFC6M2xc1ko7LZwRJrxL0ZfQpC316Pl40lL4wyNaFKjye6p
 FqX/jXIlsGlUzyC1l7xvHuty2oWEnfQuBgjh1B5m2P1au9wXxv3X9ttkdEn/wc8pDjib
 PGpvRRICt6dp2NyNMhWmIabXJqtAtj1CD8VD0LRyP7rKIsgk3v4mDl/bAOykROAfgH7T
 MwOAQwsroTrLYFsUQVSUrivlCTFSn6MWJ1KpHbU67MqQ0BRyCPZCL9KP2B3naNGD8XpB qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kan7e1gqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 17:57:50 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JHf5U1015979;
 Wed, 19 Oct 2022 17:57:49 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kan7e1gqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 17:57:49 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JHtl61002643;
 Wed, 19 Oct 2022 17:57:48 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3k7mga7v7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 17:57:48 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29JHvlT46619706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 17:57:47 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67B6158063;
 Wed, 19 Oct 2022 17:57:46 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 389EB58052;
 Wed, 19 Oct 2022 17:57:42 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.160.41.243]) by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 19 Oct 2022 17:57:42 +0000 (GMT)
Message-ID: <44b6c9d164b1ba02483ed23a89ec843f18f1cd63.camel@linux.ibm.com>
Subject: Re: [PATCH v1 6/7] vfio/ccw: replace vfio_init_device with _alloc_
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Date: Wed, 19 Oct 2022 13:57:41 -0400
In-Reply-To: <Y1Awsh56Ur/cDrHh@nvidia.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-7-farman@linux.ibm.com>
 <Y1Awsh56Ur/cDrHh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q2mvKpVcdgQlwFBaW1mfglcq_AZETqcy
X-Proofpoint-ORIG-GUID: g1ueXzvxe0ge2ZRClxxJJQOvrPAfn-Qw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_10,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190099
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-10-19 at 14:15 -0300, Jason Gunthorpe wrote:
> On Wed, Oct 19, 2022 at 06:21:34PM +0200, Eric Farman wrote:
>=20
> > =C2=A0/*
> > =C2=A0 * Initialize a vfio_device so it can be registered to vfio core.
> > - *
> > - * Only vfio-ccw driver should call this interface.
> > =C2=A0 */
> > =C2=A0int vfio_init_device(struct vfio_device *device, struct device
> > *dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct vfio_devic=
e_ops *ops)
> > @@ -422,7 +420,6 @@ int vfio_init_device(struct vfio_device
> > *device, struct device *dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ida_free(&vfio.device_i=
da, device->index);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > =C2=A0}
> > -EXPORT_SYMBOL_GPL(vfio_init_device);
>=20
> Should be made static as well

Agreed. Only reason I didn't was there's a prototype in
include/linux/vfio.h to satisfy the call to vfio_init_device from
_vfio_alloc_device, and I didn't want to get into moving things around
if I didn't need to. I can do that on top, if you'd like.

Eric
