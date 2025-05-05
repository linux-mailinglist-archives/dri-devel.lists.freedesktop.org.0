Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96989AA9175
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 12:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE4910E076;
	Mon,  5 May 2025 10:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="maF+NlbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6009E10E076
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 10:59:23 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NLVAx032287;
 Mon, 5 May 2025 10:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NMGMuOMP0NOStNdPXxMCsLdoVkdF+VlLfbEBaduUM3c=; b=maF+NlbWY9nk/Yew
 ro6ddW/oBlEwYYu7iVQG1wXAtd+fefPu+TYPVrzsXbsKNDWEvQHb/ykSBmQpZMAz
 6iI3+XOj5Cme5y1cKHv0EEGnfGqONJy325wqCbKJLXhSeGqxE78v8tt6e5BrEcVp
 9+r92OFHhzKFbbFko37hcq8R+ToEI2llyLpF6lHD45spgEGCwwumoq3/1B+VtHLu
 jcidX2dE80gLEyEXzZi12GqfAiwaDbOfLTrvLwDZ6UGbAONQS44mbOOsnqEaJprP
 xRq/T55q67nmuxVr8ACjkGzry7ieWUNgqqVecpt8aM7YXoZG9QtoD5GuoG9sBNHZ
 nHRhnA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9brj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 10:59:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 545AxHxZ002374
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 May 2025 10:59:17 GMT
Received: from [10.218.44.178] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 03:59:12 -0700
Message-ID: <246da659-2add-4ccf-b914-f737fb93f3f2@quicinc.com>
Date: Mon, 5 May 2025 16:28:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander
 <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu
 <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-doc@vger.kernel.org>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-6-6a143640a6cb@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-6-6a143640a6cb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEwNCBTYWx0ZWRfX5wp0kqaare0R
 +pntLJOWwO+utGzzTx42W3hgP9uuXtlrAdyezkvc7+TlcItOvMZgPYJcVg6ebpAEWjvxx5kA6aN
 jZGLBCAdT8wkakazGXs/leuWIRMfg7rCMFM+LLAxpUOwYMBQGNcxFhbhjEB95EfSQkLP22aKt6O
 wb1BS5uLR3ryeZT95EFrhfrzH4E3Mgk5WlKzF96Q0sigKTX+px1RRAQer4vDa+LUeKXlHgMxVYx
 b24B8+TSKL+dRcQUEB0lxjwUpwMLJOCTqfTpsxB7yiQnigbe62WCCwjiI3oxGV+xtVSIizoocfd
 Jmd9UDTCTG27ZHGKtGvwUXaMpqNPhP6MZSLBLsfiZImaQ8nYUzr5gMIbgvuhLKiENstzp9tq2DM
 4fEJGGgtv44YP6G8KVKS0+PSCg5Afmohc1tHDmgvEF88uX1OTyXLYlSo0dp0HurZS+OnpRWw
X-Proofpoint-ORIG-GUID: jDqxW_-Q_cnftiAtwzc2XbtlK_MxbWAN
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68189a06 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=JvMDD0_PEK43moPAXCcA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: jDqxW_-Q_cnftiAtwzc2XbtlK_MxbWAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050104
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



On 4/29/2025 11:36 AM, Amirreza Zarrabi wrote:
> shm_bridge create/delete functions always use the scm device.
> There is no need to pass it as an argument.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


There are 2 type of APIs exposed by tzmem driver for pool creation.
devm_qcom_tzmem_pool_new and qcom_tzmem_pool_new.

Device managed pool is created with devm_qcom_tzmem_pool_new but
currently qcom_scm is using it's own dev to create/delete bridge which
is problamatic here.

https://elixir.bootlin.com/linux/v6.14.5/source/drivers/firmware/qcom/qcom_scm.c#L1653

If pool is device managed, same dev should be used in qcom_scm to
create/delete bridge rather than using qcom_scm dev.
The dev passed as an argument to function should be used instead of
__scm->dev.
https://elixir.bootlin.com/linux/v6.14.5/source/drivers/firmware/qcom/qcom_scm.c#L1634

To summarize, I believe correct solution should be to pass corresponding
dev to bridge create/delete APIs instead of always assuming to be
qcom_scm dev for devm_qcom_tzmem_pool_new scenarios.
For qcom_tzmem_pool_new, qcom_scm/qcom_tzmem_dev can be used.

Bartosz/Amirreza, please share your thoughts as well.

-- 
Regards
Kuldeep

