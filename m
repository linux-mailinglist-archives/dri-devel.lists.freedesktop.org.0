Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C83416A35
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 04:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2A6E183;
	Fri, 24 Sep 2021 02:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558B26E17F;
 Fri, 24 Sep 2021 02:54:44 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18O02VFJ017299; 
 Thu, 23 Sep 2021 22:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=zoqu0xjY8xvBr+WpJGH45TyxUeL+ccy34ZawDizGpFM=;
 b=MS1RYQqNh5MZNGpPu8ooZ+n+rwb6xjS5YnNgpjkZkgR2qu0f6CAqq7J5YLOV6XtYbYKu
 c7W63DC+KByz7rZxmeJyIdZakNY4JYAf47iSg3A8XsdxDrQ2l+zHUEtZNlK1/lWK4ihB
 cYbCU3BAss7FrYKb6fdrPOZb3SEwkd+0OT/jG1hiuOR3Ydp7L43r00VKJE3bMlc6xeW2
 hGHHBIRQbueZecv2v5lyGkNnvs3xMfwfPlMx7pOZkZ90wQ6qa5XNbj0vU8ik29jNdJeq
 FPXXjYcqKfaox/NSS+LnKABaLngBqvLpVZzApq1RIw80Wo/6spJRrWfAPTuwQncJajHS 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b93snawsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 22:54:41 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18O2dT9n018221;
 Thu, 23 Sep 2021 22:54:40 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b93snaws3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 22:54:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18O2lZsr002446;
 Fri, 24 Sep 2021 02:54:39 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3b93g1u8yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 02:54:39 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18O2sc8144433820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 02:54:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87BEB112067;
 Fri, 24 Sep 2021 02:54:38 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 507CF112064;
 Fri, 24 Sep 2021 02:54:32 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.34.14])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 02:54:32 +0000 (GMT)
Message-ID: <40149f01475f5a68bbd92d560cd97f9d4ce4e581.camel@linux.ibm.com>
Subject: Re: [PATCH v2 6/9] vfio/mdev: Add mdev available instance checking
 to the core
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Cornelia Huck <cohuck@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Christoph
 Hellwig <hch@lst.de>
Date: Thu, 23 Sep 2021 22:54:30 -0400
In-Reply-To: <20210921131908.GK327412@nvidia.com>
References: <6-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <87tuiff7m2.fsf@redhat.com> <20210921131908.GK327412@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B8BC6k_a_B_997uB0jzc3T2U0q5Lmp5u
X-Proofpoint-ORIG-GUID: HB6TdxZZw3JHEK9Ne1Vst8GTlGdjJFQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_07,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109240011
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

On Tue, 2021-09-21 at 10:19 -0300, Jason Gunthorpe wrote:
> On Mon, Sep 20, 2021 at 08:02:29PM +0200, Cornelia Huck wrote:
> > On Thu, Sep 09 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > 
> > > Many of the mdev drivers use a simple counter for keeping track
> > > of the
> > > available instances. Move this code to the core code and store
> > > the counter
> > > in the mdev_type. Implement it using correct locking, fixing
> > > mdpy.
> > > 
> > > Drivers provide a get_available() callback to set the number of
> > > available
> > > instances for their mtypes which is fixed at registration time.
> > > The core
> > > provides a standard sysfs attribute to return the
> > > available_instances.
> > 
> > So, according to the documentation, available_instances is
> > mandatory. This means that drivers either need to provide
> > get_available
> > or implement their own version of the attribute. I think we want to
> > update vfio-mediated-device.rst as well?
> 
> I added this, and something similar for the device_api patch too,
> thanks
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> b/Documentation/driver-api/vfio-mediated-device.rst
> index 9f26079cacae35..0a130d76b33a48 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -106,6 +106,7 @@ structure to represent a mediated device's
> driver::
>  	     int  (*probe)  (struct mdev_device *dev);
>  	     void (*remove) (struct mdev_device *dev);
>  	     struct device_driver    driver;
> +	     unsigned int (*get_available)(struct mdev_type *mtype);
>       };
>  
>  A mediated bus driver for mdev should use this structure in the
> function calls
> @@ -230,7 +231,8 @@ Directories and files under the sysfs for Each
> Physical Device
>  * available_instances
>  
>    This attribute should show the number of devices of type <type-id> 
> that can be
> -  created.
> +  created. Drivers can supply a get_availble() function pointer to 

s/availble/available/

> have the core
> +  code create and maintain this sysfs automatically.
>  
>  * [device]
>  

