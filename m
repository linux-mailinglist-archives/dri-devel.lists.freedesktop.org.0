Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4119C7AB4AD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3E810E68F;
	Fri, 22 Sep 2023 15:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526DF10E68F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:21:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MAkQe3008239; Fri, 22 Sep 2023 15:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mn7KN/kx8wid8p0S8CjD6U2R6gEbQ9C0PdN78Jh5elU=;
 b=gmtwWObBiRh7U+uBRddCCudNkiLFiaKt576YH6esvRhABLJjZScRLvUEXH9GkigDx2as
 OpCfRiuztBHDr8Nr+u6UQu7rhHFQalkcbXcSBnk2MtoQMCsvEce1DChHBLL7Pw5O0Kcl
 T3WzNONyVo6iVBdUtStuBuzgFfnGMEHEpn7qeq4v0aVfIkuZp9FiiVB7KJJW45Q3IRQq
 9abs/NDPxHO7JNC1Lo++umAyqTR74gWyiCzA1IuzZ2/W7cde9zDG14pg9vg6tnSWO408
 SpFnTCuGBN3zA6dsmbehUIS0OvdgnMyXrAHdqu2DuaDsmKm9zUd6l+VUVN6hstTq/1we RQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8um1t57w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:21:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MFLhqE006521
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:21:43 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 08:21:42 -0700
Message-ID: <10d5d0a6-bfa3-1d7f-9edf-680d97e705d6@quicinc.com>
Date: Fri, 22 Sep 2023 09:21:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC 3/4] accel/ivpu: Remove support for uncached buffers
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
 <20230901164842.178654-4-stanislaw.gruszka@linux.intel.com>
 <9925ef5c-f4f9-6553-f720-35fb0b1a5aa1@quicinc.com>
 <20230919094930.GB563961@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230919094930.GB563961@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CkDGaEZViWoDc6QQkYdNPAWPhcOTEPd7
X-Proofpoint-GUID: CkDGaEZViWoDc6QQkYdNPAWPhcOTEPd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_13,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309220132
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/2023 3:49 AM, Stanislaw Gruszka wrote:
> On Mon, Sep 11, 2023 at 09:24:42AM -0600, Jeffrey Hugo wrote:
>> On 9/1/2023 10:48 AM, Stanislaw Gruszka wrote:
>>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>
>>> Usages of DRM_IVPU_BO_UNCACHED should be replaced by DRM_IVPU_BO_WC.
>>> There is no functional benefit from DRM_IVPU_BO_UNCACHED if these
>>> buffers are never mapped to host VM.
>>>
>>> This allows to cut the buffer handling code in the kernel driver
>>> by half.
>>>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_fw.c  | 2 +-
>>>    drivers/accel/ivpu/ivpu_gem.c | 3 ---
>>>    include/uapi/drm/ivpu_accel.h | 2 +-
>>>    3 files changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>>> index 2fef9fe154aa..8ab0f3225205 100644
>>> --- a/drivers/accel/ivpu/ivpu_fw.c
>>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>>> @@ -248,7 +248,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
>>>    	if (fw->shave_nn_size) {
>>>    		fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.shave.start,
>>> -							  fw->shave_nn_size, DRM_IVPU_BO_UNCACHED);
>>> +							  fw->shave_nn_size, DRM_IVPU_BO_WC);
>>>    		if (!fw->mem_shave_nn) {
>>>    			ivpu_err(vdev, "Failed to allocate shavenn buffer\n");
>>>    			ret = -ENOMEM;
>>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>>> index 915c53d7bb97..2a91eb1e3627 100644
>>> --- a/drivers/accel/ivpu/ivpu_gem.c
>>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>>> @@ -89,8 +89,6 @@ static int __must_check shmem_alloc_pages_locked(struct ivpu_bo *bo)
>>>    	if (bo->flags & DRM_IVPU_BO_WC)
>>>    		set_pages_array_wc(pages, npages);
>>> -	else if (bo->flags & DRM_IVPU_BO_UNCACHED)
>>> -		set_pages_array_uc(pages, npages);
>>>    	bo->pages = pages;
>>>    	return 0;
>>> @@ -366,7 +364,6 @@ ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, const struct ivpu_b
>>>    	switch (flags & DRM_IVPU_BO_CACHE_MASK) {
>>>    	case DRM_IVPU_BO_CACHED:
>>> -	case DRM_IVPU_BO_UNCACHED:
>>>    	case DRM_IVPU_BO_WC:
>>>    		break;
>>>    	default:
>>> diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
>>> index 262db0c3beee..de1944e42c65 100644
>>> --- a/include/uapi/drm/ivpu_accel.h
>>> +++ b/include/uapi/drm/ivpu_accel.h
>>> @@ -196,7 +196,7 @@ struct drm_ivpu_bo_create {
>>>    	 *
>>>    	 * %DRM_IVPU_BO_UNCACHED:
>>>    	 *
>>> -	 * Allocated BO will not be cached on host side nor snooped on the VPU side.
>>> +	 * Not supported. Use DRM_IVPU_BO_WC instead.
>>>    	 *
>>>    	 * %DRM_IVPU_BO_WC:
>>>    	 *
>>
>> Feels like this will break existing userspace.  You could see if userspace
>> specified UNCACHED and change it to WC before processing the request.  Maybe
>> also use WARN_ONCE to indicate that userspace should be updated.
>>
>> Or is it the case that userspace never actually used this?
> 
> Usage of those buffers was removed some time ago:
> https://github.com/intel/linux-vpu-driver/commit/c473c9826cb28fa3dcf8883fc804b1e84c6b5fb1
> 
> And will not be part of first user-mode driver release. I think we can
> safely do the change.

Fair enough.  Thanks for the clarification.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
