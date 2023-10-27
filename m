Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619207D9DDF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9E410EA0A;
	Fri, 27 Oct 2023 16:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B5310EA0E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 16:19:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RF2DtG026778; Fri, 27 Oct 2023 16:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+65s+TLTQHcXQHIJuH5za54yBEVt6lyig0nLzB7//0A=;
 b=fBufskL7u9jbdezCNLRp+uh8gkN04pkE+mLMonM3qcDGJW3ZXKHpa0+e4ehqoHE9XYiN
 90KuxsKgzl7/IobIS1Mx8aKpAeOqa1nwkg7/f6f4TQWxAP/I6RVax+CkBigFZUr7r8+q
 rr0pPf72GgaHjAY1yclxr0/1fXmpBMA4JWb7trUXOr5xfumiNjIJAcap4xNauAhtiqbd
 6B/gYtk1w8RHrEeMMkE3ocSOEF0Rdy8hEkpF1nQJ+ECKXJSX5K/WUBFrdbTTTtJkW1nv
 gaIN0zYFO6ggim8V4GvWSDz7H9DrAU2MafKdba1PTNxTILIAg/WAXnI85P93QlJfT4Zu 4A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyx3uah88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:19:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RGIpLf015338
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:18:51 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 27 Oct
 2023 09:18:50 -0700
Message-ID: <fc10a575-0bab-b25b-07f8-e5b8724bf252@quicinc.com>
Date: Fri, 27 Oct 2023 10:18:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/2] accel/qaic: Add support for host/device timesync
Content-Language: en-US
To: <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <ogabbay@kernel.org>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231016170114.5446-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uQQ-2wHpBNcJ80QhjL9rHLbUKqFG2NPE
X-Proofpoint-GUID: uQQ-2wHpBNcJ80QhjL9rHLbUKqFG2NPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_15,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270141
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/2023 11:01 AM, Jeffrey Hugo wrote:
> AIC100 supports a timesync mechanism that allows AIC100 to timestamp
> device logs with a host based time. This becomes useful for putting host
> logs in a unified timeline with device logs for debugging and performance
> profiling. The mechanism consists of a boot-time initialization and a
> runtime perodic resync to counteract the effects of time source drift
> over time between the host and device.
> 
> v2:
> - Fix readq usage on 32-bit powerpc
> - Fix doc warning due to trailing "_"
> 
> Ajit Pal Singh (1):
>    accel/qaic: Add support for periodic timesync
> 
> Pranjal Ramajor Asha Kanojiya (1):
>    accel/qaic: Support MHI QAIC_TIMESYNC channel
> 
>   Documentation/accel/qaic/aic100.rst |   6 +-
>   Documentation/accel/qaic/qaic.rst   |   5 +
>   drivers/accel/qaic/Makefile         |   3 +-
>   drivers/accel/qaic/mhi_controller.c |  36 ++-
>   drivers/accel/qaic/qaic.h           |   4 +
>   drivers/accel/qaic/qaic_drv.c       |  17 ++
>   drivers/accel/qaic/qaic_timesync.c  | 395 ++++++++++++++++++++++++++++
>   drivers/accel/qaic/qaic_timesync.h  |  11 +
>   8 files changed, 473 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/accel/qaic/qaic_timesync.c
>   create mode 100644 drivers/accel/qaic/qaic_timesync.h
> 

Pushed to drm-misc-next
