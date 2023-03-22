Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326786C4D23
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CEB10E366;
	Wed, 22 Mar 2023 14:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E3A10E366
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:11:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MCpcVi011279; Wed, 22 Mar 2023 14:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Vemu7qiT1mPDOUsmvY7OHgh2fRESakJx8u/T0nigTwM=;
 b=h+72E3Xy+IIwQQwLd7/sTlat2yyE97W+nW9utCFBr7FH04I4sfEYKvGai8fIoKH2bKpz
 VZmilUkOUNMC2sRHhUII+eiawZ6dI/DE6BeFcU19NBlKlIT4zZoQtni1668pzuN7MPlt
 1hr0Rr2i2UzSIIylI0O9d0KOkGaAKsS9dFJfEXQDxpoqpyhjuV7bJW6UT85vSugg/20w
 FbOUpXiLP79RP8/l90x2R2U11X7dmhcsNK5ssLeLHN+aIm4Em1RtPm54+KrsoE31UsJK
 MvK3MJpV9S9mrg+zlKr41aUejKrvbcdJgq/GUZRWr4xfDgBP2WUrOcdgiG9FljcBRqd2 0Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfhntjarv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:11:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32MEBT8B028110
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:11:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 07:11:28 -0700
Message-ID: <e9b9bd7e-89d8-9a95-a6b5-0a4c82b609bb@quicinc.com>
Date: Wed, 22 Mar 2023 08:11:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 6/8] accel/qaic: Add mhi_qaic_cntl
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <stanislaw.gruszka@linux.intel.com>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-7-git-send-email-quic_jhugo@quicinc.com>
 <8571460d-17eb-bc76-6d07-58bd036ff0d0@quicinc.com>
 <d79799c4-6ed3-c7ec-8061-3e5a6bf42d43@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <d79799c4-6ed3-c7ec-8061-3e5a6bf42d43@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _YjYmSZ8OSYB2Xmy4dGxp1s3f9cIFKDi
X-Proofpoint-ORIG-GUID: _YjYmSZ8OSYB2Xmy4dGxp1s3f9cIFKDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220104
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

On 3/22/2023 2:11 AM, Jacek Lawrynowicz wrote:
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Hi,
> 
> On 20.03.2023 20:06, Jeffrey Hugo wrote:
>> On 3/20/2023 9:11 AM, Jeffrey Hugo wrote:
>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>
>>> Some of the MHI channels for an AIC100 device need to be routed to
>>> userspace so that userspace can communicate directly with QSM. The MHI
>>> bus does not support this, and while the WWAN subsystem does (for the same
>>> reasons), AIC100 is not a WWAN device. Also, MHI is not something that
>>> other accelerators are expected to share, thus an accel subsystem function
>>> that meets this usecase is unlikely.
>>>
>>> Create a QAIC specific MHI userspace shim that exposes these channels.
>>>
>>> Start with QAIC_SAHARA which is required to boot AIC100 and is consumed by
>>> the kickstart application as documented in aic100.rst
>>>
>>> Each AIC100 instance (currently, up to 16) in a system will create a
>>> chardev for QAIC_SAHARA. This chardev will be found as
>>> /dev/<mhi instance>_QAIC_SAHARA
>>> For example - /dev/mhi0_QAIC_SAHARA
>>>
>>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>> ---
>>>    drivers/accel/qaic/mhi_qaic_ctrl.c | 571 +++++++++++++++++++++++++++++++++++++
>>>    drivers/accel/qaic/mhi_qaic_ctrl.h |  12 +
>>>    2 files changed, 583 insertions(+)
>>>    create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
>>>    create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
>>>
>>> diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.c b/drivers/accel/qaic/mhi_qaic_ctrl.c
>>> new file mode 100644
>>> index 0000000..a46ba1d
>>> --- /dev/null
>>> +++ b/drivers/accel/qaic/mhi_qaic_ctrl.c
>>> @@ -0,0 +1,571 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/* Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/mhi.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/poll.h>
>>> +#include <linux/version.h>
>>
>> Will remove this.
>>
>> Jacek, I think I've got all of your comments addressed.  Do you see anything more?  I'm hopeful that we are just looking at one more spin.
> 
> Yeah, I don't have any additional comments.
> The whole patchset looks OK to me :)

Thanks for the review.  I appreciate the constructive feedback.

-Jeff


