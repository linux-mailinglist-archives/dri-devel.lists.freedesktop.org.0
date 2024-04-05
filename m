Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943D589A1C5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E05113A82;
	Fri,  5 Apr 2024 15:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZGnGq+Yk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F1A1120D5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:50:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435FRRYI007141; Fri, 5 Apr 2024 15:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=3PF67GI6RTEIBY/iZVdGKXkQGcZ08KHF+ILHF43osYY=; b=ZG
 nGq+YkBh8lHW0sTPNURttlVfhFiGp1uarI157thw2NcHmcmrODefK97SV6jwl7T2
 /Ouh4lL2qpAXlvTmdwasv+FoNEV/lo/7lspIdhLg/qdLqfOrHxrZc8fIBozhehNT
 YfNLLnMLV7nesGUqc/l181+5y/iCmNWkXxItDYv3Fi5qPzlTQCZh/EYaGIdanTBS
 oQhbsmX8DFQ9cDRXCEQFo2NJyGssj0ipr3MfgETM7iLNcK1F/lP/8acxcQiqVVii
 lJhsYOBwWcNFkat/K7C+0zfvJUU9YlBk779e/c1AgYtwrEqX+nKeAOkkrIn244oB
 O55WoQaXoPNu2Oyu5lCg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa7snsm5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 15:49:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435Fnu7S012398
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 15:49:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 08:49:55 -0700
Message-ID: <617de7de-2628-214f-2793-55912b48da75@quicinc.com>
Date: Fri, 5 Apr 2024 09:49:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/3] accel/qaic: Add debugfs entries
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>
References: <20240322175730.3855440-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240322175730.3855440-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _EYhjM9R7CmShTJ5oZjmyqRVNtt9MXZq
X-Proofpoint-ORIG-GUID: _EYhjM9R7CmShTJ5oZjmyqRVNtt9MXZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_17,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=943
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050112
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

On 3/22/2024 11:57 AM, Jeffrey Hugo wrote:
> Add 3 debugfs entries that can be useful in debugging a variety of
> issues.
> 
> bootlog - output the device bootloader log
> 
> fifo_size - output the configured dbc fifo size
> 
> queued - output how many requests are queued in the dbc fifo
> 
> Bootlog is unique to the device, where as fifo_size/queued is per-dbc.
> 
> v2:
> -Use size_add() for bounds check
> -Move locking into reset_bootlog()
> -Clamp num dbcs supported to 256 to address a sprintf warning
> 
> Jeffrey Hugo (3):
>    accel/qaic: Add bootlog debugfs
>    accel/qaic: Add fifo size debugfs
>    accel/qaic: Add fifo queued debugfs
> 
>   drivers/accel/qaic/Makefile       |   2 +
>   drivers/accel/qaic/qaic.h         |   9 +
>   drivers/accel/qaic/qaic_data.c    |   9 +
>   drivers/accel/qaic/qaic_debugfs.c | 338 ++++++++++++++++++++++++++++++
>   drivers/accel/qaic/qaic_debugfs.h |  20 ++
>   drivers/accel/qaic/qaic_drv.c     |  16 +-
>   6 files changed, 393 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/accel/qaic/qaic_debugfs.c
>   create mode 100644 drivers/accel/qaic/qaic_debugfs.h
> 

Pushed to drm-misc-next.
