Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE45065FC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13510E775;
	Tue, 19 Apr 2022 07:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2022 seconds by postgrey-1.36 at gabe;
 Mon, 18 Apr 2022 16:26:29 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3410E695;
 Mon, 18 Apr 2022 16:26:29 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23IFf4Rt001424; 
 Mon, 18 Apr 2022 15:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1wjrGt+jz3gay8kmdqW05asTN6hbLBWSKqdUxv2BzzU=;
 b=VPDCtMG3WqRBaYP2VMEBeUDp4yldL9pYZ9X04i13ESLadydLV/cKsHBG+TbM3F9JUpSo
 TTRFhgpKWANUO+PJ1Lezb98ndwBvSDC3nIVyOTHqvRUggumLnKEws9xlQJiAKx768kdM
 ah+SC/a23IHqrx68LN9kDi+DUN3SqmjI2M0lHd0fcpGHIf0qv75u1dgSpXciiiKk96Rh
 AduavrLDw4o/eGrDqw5oy0LwPoWU0SgDQZ9baZjy4mUm058U2L4F7NvL9th/8g+hc3IQ
 WR45rGb71yXxHbP3XL77slO6ukGsTkgulCatgtapN62s5V3iPBjUhoEAq9WBy2AkVeSk sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7d6qs63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:52:43 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23IFpFZK003744;
 Mon, 18 Apr 2022 15:52:43 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7d6qs5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:52:43 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23IFkmQj017331;
 Mon, 18 Apr 2022 15:52:41 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3ffne9tnqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 15:52:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23IFqeCl11731344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 15:52:40 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72016BE051;
 Mon, 18 Apr 2022 15:52:40 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBEF0BE04F;
 Mon, 18 Apr 2022 15:52:37 +0000 (GMT)
Received: from [9.65.204.148] (unknown [9.65.204.148])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 15:52:37 +0000 (GMT)
Message-ID: <93b098e6-d04d-ac82-7761-317c16c5d401@linux.ibm.com>
Date: Mon, 18 Apr 2022 11:52:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <aa721d27-9622-5d47-2671-a503ba6cf2ef@linux.ibm.com>
 <20220418154400.GR2120790@nvidia.com>
From: Tony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20220418154400.GR2120790@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rgJy0e0kYk3do_dlfwnwymnKwBS-qH3B
X-Proofpoint-GUID: anGGdsUpI220lEQdo-lRtgbIpTjO4dnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=648 phishscore=0
 clxscore=1011 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204180091
X-Mailman-Approved-At: Tue, 19 Apr 2022 07:34:04 +0000
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/18/22 11:44 AM, Jason Gunthorpe wrote:
> On Mon, Apr 18, 2022 at 11:28:30AM -0400, Tony Krowiak wrote:
>>> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
>>> index a4555014bd1e72..8a5c46aa2bef61 100644
>>> +++ b/drivers/vfio/vfio.c
>>> @@ -2484,19 +2484,15 @@ static int vfio_unregister_group_notifier(struct vfio_group *group,
>>>    	return ret;
>>>    }
>>> -int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
>>> +int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_type type,
>>>    			   unsigned long *events, struct notifier_block *nb)
>>>    {
>>> -	struct vfio_group *group;
>>> +	struct vfio_group *group = dev->group;
>> Is there a guarantee that dev != NULL? The original code below checks
>> the value of dev, so why is that check eliminated here?
> Yes, no kernel driver calls this with null dev. The original code
> should have been a WARN_ON as it is just protecting against a buggy
> driver. In this case if the driver is buggy we simply generate a
> backtrace through a null deref panic.
>
> Jason

Regarding the vfio_ap parts:
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>


