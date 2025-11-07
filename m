Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0182C417EE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 21:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ABC10EB66;
	Fri,  7 Nov 2025 20:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="QxUKiz8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F7910EB66;
 Fri,  7 Nov 2025 20:03:26 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7IRRCJ017849;
 Fri, 7 Nov 2025 20:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=MlwdCn
 aFGrktPrZkCNQFrbLua2RkYHdPYziD8x0BYR4=; b=QxUKiz8ArQqLoUh4q7CjxS
 UYqvzizlRfauJRpekMYUPkUfP7b5P9Cw2UXE5WN0sOJxhHRia6Dm0q2DbGe5yEQP
 5EnHQMBdSPIesSpLd7WJkc492Awt1lTF4BXBBQxkoTRCT9G01T2yqToBcKnywdmA
 YBYPkdRcIHMVw4Z+yVZn+ML9jOVpcz2v44oLb/GuGOlUzNbt4/drRSmRXPaE4ekw
 WPi9ILcXb6zyFwwsfgRRNa8gCYy9YBIaopDCmzJfuY7mjWr/y934UUIoI00K4PAP
 pvdtWthGnnVyskq+Im2quAVr2VQGT494ViI4YxMG/+julqO0z57YF+CMNT01f4Lg
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuy1xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Nov 2025 20:03:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7K3GED017710;
 Fri, 7 Nov 2025 20:03:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuy1xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Nov 2025 20:03:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7J1iiv009877;
 Fri, 7 Nov 2025 20:03:14 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kvh7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Nov 2025 20:03:14 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 5A7K3DRM20775544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Nov 2025 20:03:13 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8178258056;
 Fri,  7 Nov 2025 20:03:13 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45AFE58062;
 Fri,  7 Nov 2025 20:03:11 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.61.62.231]) by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  7 Nov 2025 20:03:11 +0000 (GMT)
Message-ID: <ef6ccb9f1028a76d69d5769fe69c3632fb91e650.camel@linux.ibm.com>
Subject: Re: [PATCH v2 12/22] vfio/ccw: Provide a get_region_info op
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Alex
 Williamson <alex.williamson@redhat.com>, Ankit Agrawal	
 <ankita@nvidia.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti Wankhede
 <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Longfang Liu
 <liulongfang@huawei.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Nikhil
 Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta	 <nipun.gupta@amd.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic	 <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Sven
 Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, Pranjal
 Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Date: Fri, 07 Nov 2025 15:03:10 -0500
In-Reply-To: <12-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: <12-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: twd3gPasuG5jlJ51jwgaLipWtZjUa-uR
X-Proofpoint-GUID: v5Az1Fgvwvgwv-bJir5W4BMaY1htAMJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX9CKkJT6eq6in
 RCRVM5UkfqXoCe4HDSuk2u0V9ZZdJVT5Ksc8BO5kPa6Ivy1OpN4/4Q3KqcwLeNtz2OFdJfU8mvt
 1rSoL378cKtKlEddDTPrGVZE47TqRykJeekFmM6M6S5I2Zd8tcU5olJUfdrLgj3bQ/6FXUEuT4I
 ZhD33vi2at4z8QKdxXo4AcE2SPTivGlJk1dIU3XIOWF6yE6Mowx0HaqL939adbqU3reISqpW+6m
 sepSmSlEof8aDfsvE8Q7C9Hh9kQLvo4fbPbdiovaj4bytBJ56sZb7qN4EmrB3wfn83IPcaanOD7
 SdckGFjvqaR2DXLLS0nsjzroSrxs1XITCkzg66vAhRJ3vnHua7TvSrEvQZyzyZm0nVjPWnbEYgS
 fS2DIjLbf7MxJwWjjMF2TRdRztyFDw==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=690e5085 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8 a=JUX33S1rtR8i9qNFNIIA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
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

On Fri, 2025-11-07 at 13:41 -0400, Jason Gunthorpe wrote:
> Move it out of vfio_ccw_mdev_ioctl() and re-indent it.
>=20
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_ops.c | 44 +++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 18 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>
