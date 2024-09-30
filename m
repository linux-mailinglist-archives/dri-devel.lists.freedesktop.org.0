Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6598A94B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 18:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6609710E2EC;
	Mon, 30 Sep 2024 16:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kg2Y0qdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7563B10E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 16:04:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UCDm0p018454;
 Mon, 30 Sep 2024 16:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QR8itl04MvmIWzwFMJXfA3OI3m3iyY0VLK6Mss0+0lM=; b=kg2Y0qdljURuXDzc
 YX+1XKzCwevz2+6nGBRk5dqCP4bZWp9aRhCt1QsjVnGZBzibp+FxzEyJ8dfvf4S3
 G0CbJwvVGHHWWGJCSIy6V/KFvgCVRRLmMheTgwdNdznGARoJu2Gbl4ByNHOyK4Qx
 wG8T4KWAgV4eCrcRaBHuHGzGhWKp2hAuNxva6KfTk3YYj8ql/SI7CBX37glomDDY
 7c/S8N16xNWIzaBw2QPRlOniKvInQhdyCr0B90hIIRoaZo/sQLnIshRg3FyGcOO4
 NGn2iDQYNE9c3eRAtUT9mgGqHYG1QKjGXxEH7h+aR3+PYdrIvMbumgBFnj0qql9w
 v8oaTw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa12nb32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2024 16:04:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UG4cO6005273
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2024 16:04:38 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 09:04:38 -0700
Message-ID: <38ab0abb-6580-b64d-62cb-79a3eaf33cff@quicinc.com>
Date: Mon, 30 Sep 2024 10:04:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 17/29] accel/ivpu: Add test_mode bit to force turbo
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-18-jacek.lawrynowicz@linux.intel.com>
 <94b9a0e4-7cbb-31e0-7973-92242ee9a4d5@quicinc.com>
 <d6152b59-2566-4f3c-8d4b-a72e7cccfafc@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <d6152b59-2566-4f3c-8d4b-a72e7cccfafc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6ourgWbzwAoWZJVk-goLMBybnTDKrE9E
X-Proofpoint-GUID: 6ourgWbzwAoWZJVk-goLMBybnTDKrE9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300115
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

On 9/30/2024 5:01 AM, Jacek Lawrynowicz wrote:
> On 9/27/2024 11:25 PM, Jeffrey Hugo wrote:
>> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>
>>> Add new test_mode BIT(9) that forces firmware to
>>> enable turbo burst mode.
>>>
>>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_drv.h | 1 +
>>>    drivers/accel/ivpu/ivpu_job.c | 5 +++++
>>>    2 files changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>>> index 9acef14deab57..151ab9f2ddc9b 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.h
>>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>>> @@ -197,6 +197,7 @@ extern bool ivpu_force_snoop;
>>>    #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
>>>    #define IVPU_TEST_MODE_HWS_EXTRA_EVENTS      BIT(7)
>>>    #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
>>> +#define IVPU_TEST_MODE_TURBO          BIT(9)
>>>    extern int ivpu_test_mode;
>>>      struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
>>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>>> index 8798fb2046abc..dc5cf7ded9439 100644
>>> --- a/drivers/accel/ivpu/ivpu_job.c
>>> +++ b/drivers/accel/ivpu/ivpu_job.c
>>> @@ -202,6 +202,11 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
>>>        jobq_header->engine_idx = engine;
>>>        jobq_header->head = 0;
>>>        jobq_header->tail = 0;
>>> +    if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
>>> +        ivpu_dbg(vdev, JOB, "Turbo mode enabled");
>>> +        jobq_header->flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
>>
>> I don't see VPU_JOB_QUEUE_FLAGS_TURBO_MODE defined.  What am I missing?
>>
> 
> VPU_JOB_QUEUE_FLAGS_TURBO_MODE is defined in FW headers.
> It was added to the FW years ago and now we've started using it in the Linux driver.

Err, I missed that this is defined back in patch 1 of the series.  I'm 
good now.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
