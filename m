Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD3A2419A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 18:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE0810E091;
	Fri, 31 Jan 2025 17:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jOBW4E26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A8A10E091
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 17:12:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGvTs3012737;
 Fri, 31 Jan 2025 17:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xa33Uki9JwMISfJXTyskf/bagu1pRj2S+WNwAyM6Xko=; b=jOBW4E26VYbjCjmj
 pPZypvt0yvvFM5XzKHE99/dSDc26BET2mBUjeXG3o/tJDBZUW2hvKTtlmUIdojzD
 CtgMR+rjI6vyuX1EyCZsV+9hweNBYvyLvxY1AZ7VXY/mP2Jq5eAOwonEzzKlIdeE
 0HwEeoJgjDEN5POosEM971T72jBXIPk6MD8YzWRZtFLfMwR8U6qIDSn3jc5oXWaB
 f+tAgAJto5a47bzXNcBVc7DCj/+CHrbzvpvk//asvJvCAomDwqjAHYTEvH+ziYTM
 hHJoRidV40TxtQPPOumP99PyVi0VvxGUopAE0tphBlwAGjMvpwUL1OOqAbDPVCwO
 FnLhIQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44h2gd81dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 17:12:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50VHCibE009199
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 17:12:44 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 Jan
 2025 09:12:43 -0800
Message-ID: <9fd4a356-6a4f-714e-2b14-dafd20d703ab@quicinc.com>
Date: Fri, 31 Jan 2025 10:12:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/7] accel/qaic: Initial AIC200 support
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QEKdxOym9gRQgj4N-A2AajIVjFvGOhF4
X-Proofpoint-GUID: QEKdxOym9gRQgj4N-A2AajIVjFvGOhF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310131
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

On 1/17/2025 10:09 AM, Jeffrey Hugo wrote:
> Initial support to the driver to boot up AIC200. AIC200 uses BHIe
> without BHI, which is something that the MHI bus has not supported until
> now. While the MHI changes are listed first to facilitate cross-tree
> merging, they are not needed until the last change in the series.
> 
> Also, AIC200 is a different product from AIC100 with MSI-X, different
> BARs, and different MHI configuration so we finally need some
> infrastructure in the driver to be able to handle product differences.
> This is expected to evolve more over time.
> 
> v2:
> -Remove inline on mhi_fw_load_error_dump() and shorten stack variable
> lines
> -Simplify kcalloc from mhi_alloc_bhi_buffer()
> -Inline mhi_firmware_copy_bhi() and drop the function
> -Fix spelling of MHI/BHIe in commit text of patch 2
> -Drop MHI_FW_LOAD_UNKNOWN
> -Simplify mhi_fw_load_type_get()
> -Rename mhi_send_image_bhi() to mhi_load_image_bhi()
> -Rename mhi_send_image_bhie() to mhi_load_image_bhie()
> -Adjust the order of mhi_cntrl init in qaic_mhi_register_controller()
> 
> Jeffrey Hugo (2):
>    accel/qaic: Add config structs for supported cards
>    accel/qaic: Add AIC200 support
> 
> Matthew Leung (2):
>    bus: mhi: host: Refactor BHI/BHIe based firmware loading
>    bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL
> 
> Youssef Samir (3):
>    accel/qaic: Allocate an exact number of MSIs
>    accel/qaic: Add support for MSI-X
>    accel/qaic: Mask out SR-IOV PCI resources
> 
>   drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
>   drivers/accel/qaic/mhi_controller.h |   2 +-
>   drivers/accel/qaic/qaic.h           |  14 +-
>   drivers/accel/qaic/qaic_drv.c       |  97 +++++---
>   drivers/accel/qaic/qaic_timesync.c  |   2 +-
>   drivers/accel/qaic/sahara.c         |  39 ++-
>   drivers/bus/mhi/host/boot.c         | 203 ++++++++++++----
>   drivers/bus/mhi/host/init.c         |   2 +-
>   drivers/bus/mhi/host/internal.h     |   7 +
>   9 files changed, 620 insertions(+), 106 deletions(-)

Pushed to drm-misc-next

