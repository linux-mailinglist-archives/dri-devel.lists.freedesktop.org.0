Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9078FEEC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9B110E7E8;
	Fri,  1 Sep 2023 14:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B9F10E7E8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 14:22:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381CbtwF002930; Fri, 1 Sep 2023 14:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6f9GKBBg5hoCR4ido2PDP6dd8FDbubys5EurRtWJzew=;
 b=ofLM6RPF7E131ZNCMOsjGV7lhpNirqEQ1ODyv9+BHc3/FuQ6V2AIv+9NrQRtaypUc4MK
 NPwd8JS3YfYIEJ0tbSFLNIbcETmumMQuQ2UBG3kIelViskeHNiHb6jAXiwNPNJTAdx8I
 8THVpn9Au+/TzS/5FnmFm967Ke1V1WPsrJWVHdzTXFUphOzDYsG9fNUbV6YgUcmgTOQV
 mJ3XRE8tbsGZuCGaMwB2Z5S3ZCw3qco+oCuCz79St/FT9K0TgoaDDwLGaAhVEDTfe2XM
 jM8BykOCnGR+GMltJBokZcc40H6hvU0BlS2q9XK29bqYvSxrhK7oenjHv40+eMTMx8mo Ew== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stxru2kqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 14:22:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381EM9Cv025100
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 14:22:09 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 1 Sep
 2023 07:22:08 -0700
Message-ID: <9cbef01f-9887-d7ed-b351-f3fef79bf1fb@quicinc.com>
Date: Fri, 1 Sep 2023 08:22:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 03/11] accel/ivpu: Make ivpu_pm_init() void
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
 <20230901094957.168898-4-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230901094957.168898-4-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cZupFz_NfQgyG8yyskTr5yHuEXfED0mM
X-Proofpoint-ORIG-GUID: cZupFz_NfQgyG8yyskTr5yHuEXfED0mM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_11,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010134
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2023 3:49 AM, Stanislaw Gruszka wrote:
> ivpu_pm_init() does not return any error, make it void.
> 
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 4 +---
>   drivers/accel/ivpu/ivpu_fw.c  | 2 +-
>   drivers/accel/ivpu/ivpu_pm.c  | 4 +---
>   drivers/accel/ivpu/ivpu_pm.h  | 2 +-
>   4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 4b344ab614f6..b10b2909f05f 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -551,9 +551,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   	if (ret)
>   		goto err_fw_fini;
>   
> -	ret = ivpu_pm_init(vdev);
> -	if (ret)
> -		goto err_ipc_fini;
> +	ivpu_pm_init(vdev);
>   
>   	ret = ivpu_job_done_thread_init(vdev);
>   	if (ret)
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 9827ea4d7b83..9b6ecd3e9537 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -78,7 +78,7 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
>   		}
>   	}
>   
> -	ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
> +	ivpu_err(vdev, "Failed to load firmware: %d\n", ret);

I feel that this is unrelated to $SUBJECT.  With this dropped or moved 
to where it fits -

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

