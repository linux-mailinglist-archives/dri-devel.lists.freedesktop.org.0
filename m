Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16497611A58
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F2C10E8B7;
	Fri, 28 Oct 2022 18:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF4F10E8B1;
 Fri, 28 Oct 2022 18:43:44 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SHnXR2028950;
 Fri, 28 Oct 2022 18:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SO4VW/8VmydBmQcvcXcbIveGkrMLYL3hskWB6VxXLow=;
 b=dbydvazLhzgAOT26kQOJg6tpJTihp8Se8b5SXRDODD3NMnc4a1YqfA3Eee+BzzHGyMB6
 859awMpUfWW0MJyzadb6IIsGWWtR6+E45CjzOjwUBlr4Gx8k7ozsJsSdO/QzVzIulR9N
 cxEc48630QAbOyrCOLy0esXdNP/wYsPkIaRz+FvTfaswhkrfVcIGTBlGJWAgV5M/QZ+z
 dsHSbDhwirVkcKQfsU3L8bZObRlYO8OqKf+iAB4S+oIK3Lm9JzA4nsBeJ3vbOe7WUXy2
 TPgufyFdeAv6EVq5wTT4418Iem7yD+SpNgZdshnFdFwhNjd4OFR4pTmlJ8/mk0Oq31Ho ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgktthru0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 18:43:11 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SHoHcs030205;
 Fri, 28 Oct 2022 18:43:09 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgktthrr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 18:43:08 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SIaB7c020594;
 Fri, 28 Oct 2022 18:43:07 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3kfahenqpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 18:43:07 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SIh6vL6881864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 18:43:06 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0FD15805A;
 Fri, 28 Oct 2022 18:43:05 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60CCA58058;
 Fri, 28 Oct 2022 18:43:02 +0000 (GMT)
Received: from [9.160.93.208] (unknown [9.160.93.208])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 18:43:02 +0000 (GMT)
Message-ID: <6ab3ceb4-37fa-a879-2db0-a59acacbdabd@linux.ibm.com>
Date: Fri, 28 Oct 2022 14:43:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 2/7] vfio/ccw: remove private->sch
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-3-farman@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20221019162135.798901-3-farman@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QpgekcK-lB5oIfRTGRyS05JBVjDSEnMY
X-Proofpoint-ORIG-GUID: JrmbtmFXU58Hkg5rBVXRqcrAbi_RHRSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280113
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

On 10/19/22 12:21 PM, Eric Farman wrote:
> These places all rely on the ability to jump from a private
> struct back to the subchannel struct. Rather than keeping a
> copy in our back pocket, let's use the relationship provided
> by the vfio_device embedded within the private.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  drivers/s390/cio/vfio_ccw_chp.c     |  5 +++--
>  drivers/s390/cio/vfio_ccw_drv.c     |  3 +--
>  drivers/s390/cio/vfio_ccw_fsm.c     | 27 ++++++++++++---------------
>  drivers/s390/cio/vfio_ccw_ops.c     | 12 ++++++------
>  drivers/s390/cio/vfio_ccw_private.h |  7 ++++---
>  5 files changed, 26 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_chp.c b/drivers/s390/cio/vfio_ccw_chp.c
> index 13b26a1c7988..d3f3a611f95b 100644
> --- a/drivers/s390/cio/vfio_ccw_chp.c
> +++ b/drivers/s390/cio/vfio_ccw_chp.c
> @@ -16,6 +16,7 @@ static ssize_t vfio_ccw_schib_region_read(struct vfio_ccw_private *private,
>  					  char __user *buf, size_t count,
>  					  loff_t *ppos)
>  {
> +	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);

I'm not a big fan of the amount of indirection there, but I prefer this over back-pocketing the subchannel in vfio_ccw_private anyway

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

