Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54769616E2D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 21:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE00810E5F0;
	Wed,  2 Nov 2022 20:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EBF10E5EA;
 Wed,  2 Nov 2022 20:01:20 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2IGRv4010825;
 Wed, 2 Nov 2022 20:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZEYHGwsVZ9i/ZMrlW5q0nkckbHNYGw87m2YtJ0AKGxQ=;
 b=SXQ6VNpBNqZccLcMEzpdnny3NQLI105hgcR4DrBs/B//53X3no+zl9A0Jm012IoyLGY1
 DS8OdPIG20oiGDEfEVCCzw0JgLjbWQVRdzOo4WynVDVw4LSgpZwCb7j5GAHd7rmybdIB
 gJ2eWJ6nEKpZyw6fZlzCL1OfckGzioarDT/G+QHBAmEpzISRk45wptQbib2lDBXvXtML
 pgOtAtrRdR2MdaSe5xBdrQHLlEGnElo9HmxpjJs+5FjYjn4UtP3vqbhtC5cj3Ww1ouGO
 GAtAgve4864DPAmw/vj9KowwwHBPmiE5Od3nB2zr6rO9699u2mbtE1MvzUI4VxYbbYoX vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkvbydnfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 20:00:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2Jeqvv013125;
 Wed, 2 Nov 2022 20:00:50 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkvbydneg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 20:00:50 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2JolxS021521;
 Wed, 2 Nov 2022 20:00:49 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3kgutabwbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 20:00:49 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A2K0lv166650482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Nov 2022 20:00:47 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCF7258054;
 Wed,  2 Nov 2022 20:00:46 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E5B458070;
 Wed,  2 Nov 2022 20:00:43 +0000 (GMT)
Received: from [9.160.116.108] (unknown [9.160.116.108])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  2 Nov 2022 20:00:42 +0000 (GMT)
Message-ID: <431304f4-cbe9-6453-cd3a-0843972ca368@linux.ibm.com>
Date: Wed, 2 Nov 2022 16:00:42 -0400
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
 <df037cd2e564acaa14c5a3358fd3386df29ad61e.camel@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <df037cd2e564acaa14c5a3358fd3386df29ad61e.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3fpTBz1LZ22r3buesVDvJ_LOREDV8ITb
X-Proofpoint-ORIG-GUID: 5kUYJ_dzxBTVeb9OuF-AJbfKjVSjRI8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_14,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020128
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

On 11/2/22 3:29 PM, Eric Farman wrote:
> On Wed, 2022-11-02 at 16:01 +0100, Eric Farman wrote:
>> Move the stuff associated with the mdev parent (and thus the
>> subchannel struct) into its own struct, and leave the rest in
>> the existing private structure.
>>
>> The subchannel will point to the parent, and the parent will point
>> to the private, for the areas where one or both are needed. Further
>> separation of these structs will follow.
>>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> ---
>>  drivers/s390/cio/vfio_ccw_drv.c     | 96 ++++++++++++++++++++++++---
>> --
>>  drivers/s390/cio/vfio_ccw_ops.c     |  8 ++-
>>  drivers/s390/cio/vfio_ccw_private.h | 20 ++++--
>>  3 files changed, 100 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/s390/cio/vfio_ccw_drv.c
>> b/drivers/s390/cio/vfio_ccw_drv.c
>> index 7f5402fe857a..06022fb37b9d 100644
>> --- a/drivers/s390/cio/vfio_ccw_drv.c
>> +++ b/drivers/s390/cio/vfio_ccw_drv.c

...

>>  static int vfio_ccw_sch_probe(struct subchannel *sch)
>>  {
>>         struct pmcw *pmcw = &sch->schib.pmcw;
>>         struct vfio_ccw_private *private;
>> +       struct vfio_ccw_parent *parent;
>>         int ret = -ENOMEM;
>>  
>>         if (pmcw->qf) {
>> @@ -213,41 +246,62 @@ static int vfio_ccw_sch_probe(struct subchannel
>> *sch)
>>                 return -ENODEV;
>>         }
>>  
>> +       parent = kzalloc(sizeof(*parent), GFP_KERNEL);
>> +       if (IS_ERR(parent))
>> +               return PTR_ERR(parent);
>> +
>> +       dev_set_name(&parent->dev, "parent");
>> +       parent->dev.parent = &sch->dev;
>> +       parent->dev.release = &vfio_ccw_free_parent;
>> +       ret = device_register(&parent->dev);
>> +       if (ret)
>> +               goto out_free;
>> +
>>         private = vfio_ccw_alloc_private(sch);
>> -       if (IS_ERR(private))
>> +       if (IS_ERR(private)) {
>> +               put_device(&parent->dev);
> 
> This should've been device_unregister. (I could rearrange the code a
> bit to avoid the mix of returns/gotos around here, but since the whole
> series is trying to separate these two structs that seems unnecessary.)
> 
>>                 return PTR_ERR(private);
>> +       }
>>  
>> -       dev_set_drvdata(&sch->dev, private);
>> +       dev_set_drvdata(&sch->dev, parent);
>> +       dev_set_drvdata(&parent->dev, private);
>>  
>> -       private->mdev_type.sysfs_name = "io";
>> -       private->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
>> -       private->mdev_types[0] = &private->mdev_type;
>> -       ret = mdev_register_parent(&private->parent, &sch->dev,
>> +       parent->mdev_type.sysfs_name = "io";
>> +       parent->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
>> +       parent->mdev_types[0] = &parent->mdev_type;
>> +       ret = mdev_register_parent(&parent->parent, &sch->dev,
>>                                    &vfio_ccw_mdev_driver,
>> -                                  private->mdev_types, 1);
>> +                                  parent->mdev_types, 1);
>>         if (ret)
>> -               goto out_free;
>> +               goto out_unreg;
>>  
>>         VFIO_CCW_MSG_EVENT(4, "bound to subchannel %x.%x.%04x\n",
>>                            sch->schid.cssid, sch->schid.ssid,
>>                            sch->schid.sch_no);
>>         return 0;
>>  
>> +out_unreg:
>> +       device_unregister(&parent->dev);
>>  out_free:
>> +       dev_set_drvdata(&parent->dev, NULL);
>>         dev_set_drvdata(&sch->dev, NULL);
>>         vfio_ccw_free_private(private);
>> +       put_device(&parent->dev);
> 
> While this...
> 
>>         return ret;
>>  }
>>  
>>  static void vfio_ccw_sch_remove(struct subchannel *sch)
>>  {
>> -       struct vfio_ccw_private *private = dev_get_drvdata(&sch-
>>> dev);
>> +       struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
>> +       struct vfio_ccw_private *private = dev_get_drvdata(&parent-
>>> dev);
>>  
>> -       mdev_unregister_parent(&private->parent);
>> +       mdev_unregister_parent(&parent->parent);
>>  
>> +       device_unregister(&parent->dev);
>>         dev_set_drvdata(&sch->dev, NULL);
>>  
>>         vfio_ccw_free_private(private);
>> +       put_device(&parent->dev);
> 
> ...and this shouldn't even be there. Sorry for the brain fog.
> 

Thanks, with these changes I no longer see refcount underflows.  I'll continue reviewing with those changes presumed for v3.

