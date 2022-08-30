Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3A95A6DAA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 21:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D510E098;
	Tue, 30 Aug 2022 19:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC48F10E098;
 Tue, 30 Aug 2022 19:43:39 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UIVl7k008865;
 Tue, 30 Aug 2022 19:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nvlS2VMNsmy2wY435KnShBDYElsWCPC73ASoLmOHEMg=;
 b=Nb8L8Cp4KAHCTal/vuwjPpH9Ubi0o+qLKIMBmWwNidpI7ZC2Ka3AgfZoBy4lmulwYp9K
 oFRNocY7nDDce38NUGbXmBWMV3N9tLgP0mEbIISvvzThhyO9ZOdq7kjYU5FdKGMqEAxL
 mlgPC/Fsr22Tfd9HnByFtLaJaPTgMne/vOcoXeDF6JcFFKSNf33Sj9hMw8/f9ZuXKrl8
 bFtgoxTYAhZAV5/ndXul0sxNfzwZiH+TKzREQDV0yK32mKjhXI9yxGPkJ+tlKWS1kCdU
 i2K+w/qwpWOY1t6P445W/uD/nNyjxmCLjDmeAa3EccPDUbUyQizN5DMeANlV1Cu3HTj0 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9qwm1s4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 19:43:25 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27UJQeVB002546;
 Tue, 30 Aug 2022 19:43:24 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9qwm1s3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 19:43:24 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UJZwRa028948;
 Tue, 30 Aug 2022 19:43:23 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3j7aw9nv30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 19:43:23 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27UJhMf638732266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 19:43:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82ED72805A;
 Tue, 30 Aug 2022 19:43:22 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69F6E28058;
 Tue, 30 Aug 2022 19:43:20 +0000 (GMT)
Received: from [9.160.64.167] (unknown [9.160.64.167])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Aug 2022 19:43:20 +0000 (GMT)
Message-ID: <857ca47a-e37a-450d-385f-8bdd3fbd2ed9@linux.ibm.com>
Date: Tue, 30 Aug 2022 15:43:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-2-kevin.tian@intel.com>
 <907c54c6-7f5b-77f3-c284-45604c60c12e@linux.ibm.com>
 <Yw4oUL33TbJK6inc@ziepe.ca>
From: Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <Yw4oUL33TbJK6inc@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aRCafsSVB4WDgZKQoAh5T0ZD6U8Lpe4c
X-Proofpoint-GUID: iUNzE8Y1B8EAR70qXetOvkvDM2I5g5Bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_10,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208300088
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Eric Farman <farman@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/30/22 11:10 AM, Jason Gunthorpe wrote:
> On Tue, Aug 30, 2022 at 09:42:42AM -0400, Anthony Krowiak wrote:
>
>>> +/*
>>> + * Alloc and initialize vfio_device so it can be registered to vfio
>>> + * core.
>>> + *
>>> + * Drivers should use the wrapper vfio_alloc_device() for allocation.
>>> + * @size is the size of the structure to be allocated, including any
>>> + * private data used by the driver.
>>
>> It seems the purpose of the wrapper is to ensure that the object being
>> allocated has as its first field a struct vfio_device object and to return
>> its container. Why not just make that a requirement for this function -
>> which I would rename vfio_alloc_device - and document it in the prologue?
>> The caller can then cast the return pointer or use container_of.
> There are three fairly common patterns for this kind of thing
>
> 1) The caller open codes everything:
>
>     driver_struct = kzalloc()
>     core_init(&driver_struct->core)
>
> 2) Some 'get priv' / 'get data' is used instead of container_of():
>
>     core_struct = core_alloc(sizeof(*driver_struct))
>     driver_struct = core_get_priv(core_struct)
>
> 3) The allocations and initialization are consolidated in the core,
>     but we continue to use container_of()
>
>     driver_struct = core_alloc(typeof(*driver_struct))
>
> #1 has a general drawback that people routinely mess up the lifecycle
> model and get really confused about when to do kfree() vs put(),
> creating bugs.
>
> #2 has a general drawback of not using container_of() at all, and being
> a bit confusing in some cases
>
> #3 has the general drawback of being a bit magical, but solves 1 and
> 2's problems.
>
> I would not fix the struct layout without the BUILD_BUG_ON because
> someone will accidently change the order and that becomes a subtle
> runtime error - so at a minimum the wrapper macro has to exist to
> check that.
>
> If you want to allow a dynamic struct layout and avoid the pitfall of
> exposing the user to kalloc/kfree, then you still need the macro, and
> it does some more complicated offset stuff.
>
> Having the wrapper macro be entirely type safe is appealing and
> reduces code in the drivers, IMHO. Tell it what type you are initing
> and get back init'd memory for that type that you always, always free
> with a put operation.


Sounds reasonable, okay I'm buying.


>
> Jason
