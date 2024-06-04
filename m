Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254668FB78D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E07C10E52E;
	Tue,  4 Jun 2024 15:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bpnD4v30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9059410E52D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 15:37:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454BuHZO028942;
 Tue, 4 Jun 2024 15:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y6gETlu7f5dKxifVOSv/zKkJhlaYM/3Wj/YcQKndnSU=; b=bpnD4v30Phd72tX/
 IWK/wm4N8NB7FmMO1RVKG16LHUyRgiZEWOPn+stpVvwahaTFUCkUdLE+n7AhwEBY
 7YgOMM0m6ekBGJ//SJPCCpNTNI5YdII/YiCUr0776bfssa2o2Hi/z5zkgW5SNGuz
 YfeiJsiupdDfsOfoJRJs4DiKzE7Mz2G/WsN+o2wfOl8RewxvRbTZ5mf8SCg4Y8ql
 8CSLcYckv0fGhoWNh87zIH/1XYd1q2M0jafZqHA9lbJoDl5DXO3tY0KuIeXqW/CW
 E1jahGhYz+fNYc5S1YPnF3UF6VdFrpfyH0uc6mTisijlAOZXE1iDc3pYykNOwsvC
 NTxGcA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6qq6ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 15:36:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454Famfb008098
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jun 2024 15:36:48 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 08:36:46 -0700
Message-ID: <459ef672-82c8-abcd-5c7a-5c1b4db7e1e3@quicinc.com>
Date: Tue, 4 Jun 2024 09:36:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] Documentation/accel/qaic: Fix typo
Content-Language: en-US
To: Danish Prakash <contact@danishpraka.sh>
CC: Shuah Khan <skhan@linuxfoundation.org>, Carl Vanderlip
 <quic_carlv@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <linux-arm-msm@vger.kernel.org>,
 "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <dri-devel@lists.freedesktop.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
 <20240601145216.32232-1-contact@danishpraka.sh>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240601145216.32232-1-contact@danishpraka.sh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RA-9bEaNRUYS_YgtWAAZOy4iUliYcgXV
X-Proofpoint-ORIG-GUID: RA-9bEaNRUYS_YgtWAAZOy4iUliYcgXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040125
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

For future reference, since this is the second revision of this change, 
the subject should have "[PATCH v2]".

On 6/1/2024 8:51 AM, Danish Prakash wrote:
> Fixed a typo in the docs where 'phsyical' > was corrected to 'physical'.

Commit text should be in the present simple tense.  You currently are 
using past tense here.  "Fixed" -> "Fix", etc.

> Signed-off-by: Danish Prakash <contact@danishpraka.sh>
> ---

Since this is a single change and not a series, you should have a change 
log here which identifies what is different in this revision.

>   Documentation/accel/qaic/qaic.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
> index efb7771273bb..628bf2f7a416 100644
> --- a/Documentation/accel/qaic/qaic.rst
> +++ b/Documentation/accel/qaic/qaic.rst
> @@ -93,7 +93,7 @@ commands (does not impact QAIC).
>   uAPI
>   ====
>   
> -QAIC creates an accel device per phsyical PCIe device. This accel device exists
> +QAIC creates an accel device per physical PCIe device. This accel device exists
>   for as long as the PCIe device is known to Linux.
>   
>   The PCIe device may not be in the state to accept requests from userspace at

