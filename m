Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B423814F11
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 18:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A3810E00C;
	Fri, 15 Dec 2023 17:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741810E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 17:43:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BFGkJF1027580; Fri, 15 Dec 2023 17:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=cXbZa8efFm3aeEMjJRZLlbJF16a5mFPnNNHnJ/I47/M=; b=hF
 J+tMuthd/+VoE34f79nW7NQoIhkYvcl5CjEyjUG/ct3gbpRISSYLZf7CpkhHhgUd
 wSsiFQCEUZtGpe8gM7h/8v/SoQgzSJwp1I+NioL+IJg0no5WxRV9RyxVvu2PoaIz
 +TbWI+r+WV9labLRqjsW+0r9x0B45gMocDVk2TPeEGFq/lG4dglNCMPvE9RBUkgQ
 z0tG7RfmTvBzAQJpzEJV6ofVAjpSbCWiZTyzXWJlJ0Jy8YuXoWnpcmW1qY/QzklT
 EGh+ljpOMbMA5yXIPNRmFi+09Ff/f5ZAPDfghXLB6i22iUP90MQnmHz4O8mXtEzz
 4H8UXKdWjIss1nqSXYOA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0a37jtux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 17:43:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BFHh64x020922
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 17:43:06 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Dec
 2023 09:43:05 -0800
Message-ID: <e21d7426-3e3a-2c57-90de-a38960296773@quicinc.com>
Date: Fri, 15 Dec 2023 10:43:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/2] qaic fixes for 6.7
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
References: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NZvqUVkFIqjHTJn1TG0oXWCJHH2ckAaO
X-Proofpoint-ORIG-GUID: NZvqUVkFIqjHTJn1TG0oXWCJHH2ckAaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=906
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150123
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/2023 9:30 AM, Jeffrey Hugo wrote:
> A pair of fixes to the driver. First one is an improvement to dma_buf
> handling based on a greater understanding of that framework. The second
> is a reliability fix that allows some cards to boot.
> 
> Jeffrey Hugo (1):
>    accel/qaic: Implement quirk for SOC_HW_VERSION
> 
> Pranjal Ramajor Asha Kanojiya (1):
>    accel/qaic: Fix GEM import path code
> 
>   drivers/accel/qaic/mhi_controller.c | 15 ++++++++++++++-
>   drivers/accel/qaic/qaic_data.c      |  6 ++----
>   2 files changed, 16 insertions(+), 5 deletions(-)
> 

Applied to drm-misc-fixes

-Jeff
