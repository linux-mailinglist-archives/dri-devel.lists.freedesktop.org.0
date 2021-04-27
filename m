Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323B36C07D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 10:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76F16E91B;
	Tue, 27 Apr 2021 08:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1688 seconds by postgrey-1.36 at gabe;
 Tue, 27 Apr 2021 08:02:16 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A086E90D;
 Tue, 27 Apr 2021 08:02:16 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13R7XHHA076633; Tue, 27 Apr 2021 03:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dbwUouL94Tn6aMK5okMNidltYNKsURrD9rSSG24y+N8=;
 b=JlBYcGRZinkJQ1yL6heRHD3pud7q+grVvAnrNoVMNLWaK2KZOTrg7ISOe0e2zyBTewO2
 1Yq5+jH8spWiL4RGCY0ebeZKRkhbBBTXz4nJSrs+4HDL2ehS3Alpkd7dHPaV452wSF18
 4U191PPSIXGQuzZVE+ZQxTjDszgR1OSTHt9VdxybVLkWGnA34Ah1KytfPWIoKiGwbB5n
 gWjLyztpo8shuUBK+uxW2ZC2Qm5AhLBHuUpwHG47IoVT2LTt8DtersFVqNovqz0g00Kj
 TmnvSAAw+bGvEpM9NlyCwZdiiwvruwrXZ+jdNQkYd8uWLFU4McOxdbjRtbCDD8/NeVMR Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386cf2txe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 03:34:05 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13R7XlU4078010;
 Tue, 27 Apr 2021 03:34:05 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386cf2txc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 03:34:05 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13R7Rane009579;
 Tue, 27 Apr 2021 07:34:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 384ay88nbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 07:34:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13R7XYL128049826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 07:33:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0CDF4C046;
 Tue, 27 Apr 2021 07:33:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA4A24C040;
 Tue, 27 Apr 2021 07:33:56 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.69.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 07:33:56 +0000 (GMT)
Subject: Re: [PATCH 00/12] Remove vfio_mdev.c, mdev_parent_ops and more
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <5def83bb-599c-27fa-9daa-efa27b5ac1d4@de.ibm.com>
 <20210426174250.GW1370958@nvidia.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <2ca13efa-3876-9496-edbf-4b12b93d721c@de.ibm.com>
Date: Tue, 27 Apr 2021 09:33:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210426174250.GW1370958@nvidia.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u76BFO76MsdtScWYP9TmTAIjYZRDCeQ_
X-Proofpoint-ORIG-GUID: E3SdCeQ-8MC1eEvgYB2mhBcR57fsEB6B
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_02:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104270055
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26.04.21 19:42, Jason Gunthorpe wrote:
> On Mon, Apr 26, 2021 at 06:43:14PM +0200, Christian Borntraeger wrote:
>> On 24.04.21 01:02, Jason Gunthorpe wrote:
>>> Prologue
>>> ========
>>>
>>> This is series #3 in part of a larger work that arose from the minor
>>> remark that the mdev_parent_ops indirection shim is useless and
>>> complicates things.
>>>
>>> It applies on top of Alex's current tree and requires the prior two
>>> series.
>>
>> Do you have a tree somewhere?
> 
> [..]
>>> A preview of the future series's is here:
>>>     https://github.com/jgunthorpe/linux/pull/3/commits
> 
> Has everything, you'll want to go to:
>    cover-letter: Remove vfio_mdev.c, mdev_parent_ops and more
> 
> As there are additional WIPs in that tree.

I gave this a quick spin on s390x vfio-ap and it seems to work ok.
This is really just a quick test, but no obvious problem.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
