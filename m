Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2908BA153A9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE5D10EB38;
	Fri, 17 Jan 2025 16:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WWeLGTUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8059610EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:05:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HE64lf010971;
 Fri, 17 Jan 2025 16:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LlLrV9zsl/cmOZQManuScHFe4Wefzm0aALs9f9G647Q=; b=WWeLGTUdBz/oqc8x
 EJ6Zoh1zlM2LZ8kzuERPKsNwBCNLRhJgsVpHskYAYqNTb2TDmZgHwQc0etbpwjAC
 w5w8LbzNu1XFjjzrnKKzAaDl58k/FuD0MU1xrev5ouQqltIHc0hXlFg30sRgQRxS
 OwmYK3vSPVsOIHehoE8pyq6M5bZOXj2//7M2AYVcjN0mrU2RpvTOUK0ut8YdVhbK
 L2alrYjPjOKjVerZm5GKxsFKJ0QrfW3QBFjphylpZFiJcPZQCWdtRRvR13vWZb+B
 L3aInVz6yW9kEhSdSIcBnqw3UZ3cCbakI2ex294Vndt5azdEgOQDpIpekVSwyxYm
 km78aw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447rnx09vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 16:05:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HG5H5t010003
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 16:05:17 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 08:05:16 -0800
Message-ID: <7d90f745-3d07-eea8-999c-6914a25c9fd5@quicinc.com>
Date: Fri, 17 Jan 2025 09:05:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Change aic100_image_table definition
Content-Language: en-US
To: <quic_yabdulra@quicinc.com>, <quic_carlv@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20241213185110.2469159-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241213185110.2469159-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jH610K8MtmQ23y3sBLQVNoqisTxHU4_B
X-Proofpoint-GUID: jH610K8MtmQ23y3sBLQVNoqisTxHU4_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxlogscore=703 mlxscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501170127
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

On 12/13/2024 11:51 AM, Jeffrey Hugo wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> aic100_image_table is currently defined as a "const char *" array,
> this can potentially lead to the accidental modification of the
> pointers inside. Also, checkpatch.pl gives a warning about it.
> 
> Change the type to a "const char * const" array to make the pointers
> immutable, preventing accidental modification of the images' paths.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Applied to drm-misc-next
