Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2756988BC2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 23:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1576C10ED2A;
	Fri, 27 Sep 2024 21:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AkkvWqRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DA010E353
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 21:25:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RFl6oF020966;
 Fri, 27 Sep 2024 21:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kG0ACaLxXpmZ1hSoUleEMECvdC3yMz+ZTw0aSXscIB8=; b=AkkvWqRXPLEIdvK3
 GGKXgDMhOxvuQrgSNkOlZE+Yrhm2cO7cM7rv1eqLr1TJ3nWJa6nHhI3Rx2Qb4U57
 CGbaKxKTxS0u4+FK+Gz46v7QagR1cKDkqpOyIHA4aSyiFiadZYrGi4QiCvXZ86vh
 8b5xoTv9LMhfhxMDvjSykcD5Uy+Qa2U1K1ElpCS22vQZC2NocYcOAkGa9QT8RRtx
 FMNKEHrQdg7YDXuPYt4p/SpMS5I81nIzlfjVQfrnthsDMRBupzWydbJtc4wdGVD7
 JUXT4lnK12sHVUEcRh1s3XMq6Lj3zXtLpha/AvABd/GJ3NEYZCgVjKX1r1Zfz+Tm
 8CULJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7uvbrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 21:25:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RLPVlO019362
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 21:25:31 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 14:25:31 -0700
Message-ID: <94b9a0e4-7cbb-31e0-7973-92242ee9a4d5@quicinc.com>
Date: Fri, 27 Sep 2024 15:25:30 -0600
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
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240924081754.209728-18-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OaGJvxDDaD7hlJKDDVeLUYNpIMHLnMSC
X-Proofpoint-ORIG-GUID: OaGJvxDDaD7hlJKDDVeLUYNpIMHLnMSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409270157
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

On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Add new test_mode BIT(9) that forces firmware to
> enable turbo burst mode.
> 
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.h | 1 +
>   drivers/accel/ivpu/ivpu_job.c | 5 +++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 9acef14deab57..151ab9f2ddc9b 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -197,6 +197,7 @@ extern bool ivpu_force_snoop;
>   #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
>   #define IVPU_TEST_MODE_HWS_EXTRA_EVENTS	  BIT(7)
>   #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
> +#define IVPU_TEST_MODE_TURBO		  BIT(9)
>   extern int ivpu_test_mode;
>   
>   struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 8798fb2046abc..dc5cf7ded9439 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -202,6 +202,11 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
>   	jobq_header->engine_idx = engine;
>   	jobq_header->head = 0;
>   	jobq_header->tail = 0;
> +	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
> +		ivpu_dbg(vdev, JOB, "Turbo mode enabled");
> +		jobq_header->flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;

I don't see VPU_JOB_QUEUE_FLAGS_TURBO_MODE defined.  What am I missing?

> +	}
> +
>   	wmb(); /* Flush WC buffer for jobq->header */
>   
>   	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {

