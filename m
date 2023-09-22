Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1AE7AB493
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727010E68C;
	Fri, 22 Sep 2023 15:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D18F10E692
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:17:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MFEX26013093; Fri, 22 Sep 2023 15:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WB/Ji+LN6VjxFOymW5ZN3TCAHyBXVjoKZ9aL45LsUco=;
 b=PT6ILpLJEUbepTUMxKYyY0YVgYhtVFzB4qbsqE3JhYNY8gUwkzKJXI3B20a/+DY1Fhh+
 iP9cGQiMsCk6OArwlVyJT/UMkyTU8XHaE3HDSs0LiM6k6wHCX7hiui+6MEJ0z2QLNuXF
 CMUdVBm0RiHm1oMaFyqq3gFStQWRYqgTpzfH6JoGbYztAG7tdVUlbu0bbdqC1Z6HAB/U
 V1EBkBMeSQbNbp/mJ+tMmhSihbYgs8cKgwowZfllk4G9rLQexq6MLrwIkDbNGVkQKLj8
 Dhz8yO0SAb6Ij2Q7VBKT9qr9xzh9EirFAgVeSY470T6MGghwBKg7pjJwmZTYOKnXbzih Ew== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8um1t4y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:17:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MFHF9S007397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:17:15 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 08:17:14 -0700
Message-ID: <a6929ae5-8732-01dd-81cf-6565379b4bdb@quicinc.com>
Date: Fri, 22 Sep 2023 09:17:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/7] accel/qaic: Extend uAPI to support undoing
 ATTACH_SLICE_BO
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
 <20230917085838.GC441281@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230917085838.GC441281@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tJ9AQyWnxKlb_XsvGCLez4IfQtuz6_Vr
X-Proofpoint-GUID: tJ9AQyWnxKlb_XsvGCLez4IfQtuz6_Vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_13,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=891 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309220131
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, ogabbay@kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/17/2023 2:58 AM, Stanislaw Gruszka wrote:
> On Fri, Sep 01, 2023 at 11:22:40AM -0600, Jeffrey Hugo wrote:
>> A BO for a QAIC device has two states -
>> 1. Allocated
>> 2. Sliced
>>
>> A BO can be allocated at any time, and is initialized in the allocated state.
>> A BO can transition to the sliced state via ATTACH_SLICE_BO.  This prepares the
>> BO for use with an active workload.  Currently a BO in the sliced state can
>> only be used with a single workload, and will only transition back to the
>> allocated state once the workload is deactivated.
>>
>> Userspace would like the ability to trigger a BO transition from the sliced
>> state to the allocated state. This would support the usecase of a userspace
>> client that has two active workloads, where the output of the first workload
>> becomes the input of the second workload. Currently, the client would need
>> two BOs, once for each workload, and copy from one BO to the other.
>>
>> To support this usecase, we create the detach slice concept which is the
>> inverse operation of ATTACH_SLICE_BO.  We extend the uAPI with a new
>> DETACH_SLICE_BO ioctl that allows userspace to perform this operation.
>>
>> Since ATTACH_SLICE_BO and DETACH_SLICE_BO are related operations, they share
>> a decent amount of code. This series starts with restructuring the common code
>> for use in both ioctls before finally adding the DETACH_SLICE_BO.
>>
>> Pranjal Ramajor Asha Kanojiya (7):
>>    accel/qaic: Remove ->size field from struct qaic_bo
>>    accel/qaic: Update BO metadata in a central location
>>    accel/qaic: Declare BO 'sliced' after all the operations are complete
>>    accel/qaic: Undo slicing setup done in qaic_attach_slicing_bo()
>>    accel/qaic: Clean up BO during flushing of transfer list
>>    accel/qaic: Create a function to initialize BO
>>    accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL
>>
>>   Documentation/accel/qaic/qaic.rst |  10 ++
>>   drivers/accel/qaic/qaic.h         |   6 +-
>>   drivers/accel/qaic/qaic_data.c    | 187 +++++++++++++++++++++++-------
>>   drivers/accel/qaic/qaic_drv.c     |   1 +
>>   include/uapi/drm/qaic_accel.h     |  24 +++-
>>   5 files changed, 175 insertions(+), 53 deletions(-)
> 
> 
> Do not see any serious issues with the set.
> 
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> for the whole series.

Thanks!

-Jeff

