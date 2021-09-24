Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC7417C72
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 22:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5815F6E250;
	Fri, 24 Sep 2021 20:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFE86E250;
 Fri, 24 Sep 2021 20:45:17 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OHugnb012036; 
 Fri, 24 Sep 2021 16:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Qbl1jgNBLU/RW3f0mOWsJN8VIAmFbigzPQMZsq4WgSU=;
 b=qvx2HmJQc+aX1Sbsb69NPsWd/qXBwlSftEdazgLK+AGDFPVCl3ROr0iFAGOaTC69W8aM
 40ll+caY4/aqk+XFkIJm0XAr8Dv2pGwJhYwsW6sGNgr/TV50MBW9LDQkIfGZepPi+i90
 PCY8DWTSbHhSuWMRiZSwBYCXzhDoUiqiPn29p2dEikZaCgg7BxjstpUzEDekNa37Hl2T
 lSrXMk7FbthWIyQ5PutjBkfDtJmPOkyH/zkWJUFBx4H1gbDk+oKSDjExh117qsYNbnA6
 OhDnxYrJv+MQRVlFX0JW/sGocG5+KSFX6l5iqkCsV/qq1TikH/OAK0ZYL7jj8mvTy1CQ aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b93sths8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:45:14 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18OJlME8020899;
 Fri, 24 Sep 2021 16:45:13 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b93sths7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:45:13 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OKS806002744;
 Fri, 24 Sep 2021 20:45:12 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3b93g9mnhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 20:45:12 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OKjAEV51118436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 20:45:10 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2A1F6E058;
 Fri, 24 Sep 2021 20:45:10 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7376A6E05B;
 Fri, 24 Sep 2021 20:45:03 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.34.14])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 20:45:03 +0000 (GMT)
Message-ID: <f887a563e688057d6759e6de65d480326f502331.camel@linux.ibm.com>
Subject: Re: [PATCH v2 7/9] vfio/ccw: Remove private->mdev
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
Date: Fri, 24 Sep 2021 16:45:02 -0400
In-Reply-To: <7-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: <7-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b2_yHavk4FB7ohGDjl3D7NrdyfGtthIz
X-Proofpoint-GUID: XXc8zInA60qVYvXS8o2fAP6z_DnB2Knj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=830 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Having a mdev pointer floating about in addition to a struct
> vfio_device
> is confusing. It is only used for three things:
> 
> - Getting the mdev 'struct device *' - this is the same as
>      private->vdev.dev
> 
> - Printing the uuid of the mdev in logging. The uuid is also the
> dev_name
>   of the mdev so this is the same string as
>      dev_name(private->vdev.dev)
> 
> - A weird attempt to fence the vfio_ccw_sch_io_todo() work. This work
> is
>   only queued during states IDLE/PROCESSING/PENDING and flushed when
>   entering CLOSED. Thus the work already cannot run when the mdev is
> NULL.
>   Remove it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_drv.c     |  6 ++--
>  drivers/s390/cio/vfio_ccw_fsm.c     | 48 +++++++++++++------------
> ----
>  drivers/s390/cio/vfio_ccw_ops.c     | 16 ++++------
>  drivers/s390/cio/vfio_ccw_private.h |  2 --
>  include/linux/mdev.h                |  4 ---
>  5 files changed, 30 insertions(+), 46 deletions(-)

I like this patch. Unfortunately it depends on the removal of a hunk in
patch 4, which sets the FSM state to different values based on whether
private->mdev is NULL or not, so can't go on its own. Need to spend
more time thinking about that patch.

Eric

