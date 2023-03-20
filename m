Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC576C20DD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E71E10E300;
	Mon, 20 Mar 2023 19:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A79B10E300
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 19:06:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KDjuGZ008126; Mon, 20 Mar 2023 19:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GTnqvZsKwZqH0R6Ivk3ZmNQmj0dkr7Y0GqhzkkSvHUU=;
 b=BDoDqU/1tl7vhbcVPGrImvPJqct/nrZsewVhHncUnOdeLTPatmcz2aoOdVM2aebOuQIg
 BYq/ke3Dw37ZLv3VyEy+6E5z13uWgBPgeUS+kup8zsjMgTm24GXjIkkdrUx3R8ozPCSb
 dUY3ZnU02jWQX6T8YnEtr0q/VuOEmUUpLFvtxtKQ5YmaUMM8+ed9Skb+cPrr/8MUMgq6
 qvVFqFrtfwVj0uaZpaolgC81+F8N67cxbzZZd4Z/mndjeH1cDytVycy4e4FWDS9fIA/R
 1wzbGO5cRBzJLupWtJPW/a1x+PVXDomXnIPnWzQ2A9hYFs/WsiFYGDqvZlvh80aty71X vA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pernkgueg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 19:06:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32KJ6JWV008147
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 19:06:19 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 20 Mar
 2023 12:06:18 -0700
Message-ID: <8571460d-17eb-bc76-6d07-58bd036ff0d0@quicinc.com>
Date: Mon, 20 Mar 2023 13:06:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 6/8] accel/qaic: Add mhi_qaic_cntl
Content-Language: en-US
To: <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <jacek.lawrynowicz@linux.intel.com>, <stanislaw.gruszka@linux.intel.com>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-7-git-send-email-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <1679325074-5494-7-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: b1tJ2nBWm2JDa4pHRLDFun0cqKcVmqUe
X-Proofpoint-GUID: b1tJ2nBWm2JDa4pHRLDFun0cqKcVmqUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_16,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200160
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
Cc: dafna@fastmail.com, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/20/2023 9:11 AM, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Some of the MHI channels for an AIC100 device need to be routed to
> userspace so that userspace can communicate directly with QSM. The MHI
> bus does not support this, and while the WWAN subsystem does (for the same
> reasons), AIC100 is not a WWAN device. Also, MHI is not something that
> other accelerators are expected to share, thus an accel subsystem function
> that meets this usecase is unlikely.
> 
> Create a QAIC specific MHI userspace shim that exposes these channels.
> 
> Start with QAIC_SAHARA which is required to boot AIC100 and is consumed by
> the kickstart application as documented in aic100.rst
> 
> Each AIC100 instance (currently, up to 16) in a system will create a
> chardev for QAIC_SAHARA. This chardev will be found as
> /dev/<mhi instance>_QAIC_SAHARA
> For example - /dev/mhi0_QAIC_SAHARA
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/qaic/mhi_qaic_ctrl.c | 571 +++++++++++++++++++++++++++++++++++++
>   drivers/accel/qaic/mhi_qaic_ctrl.h |  12 +
>   2 files changed, 583 insertions(+)
>   create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
>   create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
> 
> diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.c b/drivers/accel/qaic/mhi_qaic_ctrl.c
> new file mode 100644
> index 0000000..a46ba1d
> --- /dev/null
> +++ b/drivers/accel/qaic/mhi_qaic_ctrl.c
> @@ -0,0 +1,571 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
> +
> +#include <linux/kernel.h>
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +#include <linux/version.h>

Will remove this.

Jacek, I think I've got all of your comments addressed.  Do you see 
anything more?  I'm hopeful that we are just looking at one more spin.

-Jeff
