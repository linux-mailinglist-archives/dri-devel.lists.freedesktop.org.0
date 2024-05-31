Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F88D6B2B
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 23:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D3710E2EF;
	Fri, 31 May 2024 21:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ya2NF/vA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8FC10E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 21:05:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VJka2H032204;
 Fri, 31 May 2024 21:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yk7VA+HEcR20gkB/6v5vEyWOz+IIKZizxHjGWlqg/mc=; b=Ya2NF/vAgtLEhDjX
 cY9FbhhnG31R0U6rbXYIV4zBouEELY8aDk0S1tLPZzn9StxnZpoNPvyfLBs7d/jA
 e8WtI2kmni3+fPBGieuNUJrKETzFZMiGbtArrVGvlm0wVAaDqaBZxncB5XssNYSi
 cDqUyXUFIhd6WF87FOD7mSymBV9KDR9IH1ZZSJ3nuYnqaLiC3CMtw3GmH2Us0JGN
 hjIBsnyg4qFAPMBrKUCSQKeLBSCPMYkDxrKEPEI2TcUBsWSOAlKtTpo2lb7gxgyo
 MOkwEo8SA9ZuBfsuKUX8NirBXiGDwqt6YmYEVulWPXDh7ygwd2+m/CPVmmT0YWay
 XoHG2g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0ggg1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 21:05:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VL5ZoT008118
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 21:05:35 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 14:05:34 -0700
Message-ID: <f78a5c96-6a4e-f13f-c17a-984ddd8617c5@quicinc.com>
Date: Fri, 31 May 2024 15:05:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] Documentation/accel/qaic: Fix typo 'phsyical'
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>, Danish Prakash
 <contact@danishpraka.sh>
CC: Carl Vanderlip <quic_carlv@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <linux-arm-msm@vger.kernel.org>,
 "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <dri-devel@lists.freedesktop.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20240531060929.5281-1-contact@danishpraka.sh>
 <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RTucxBVNOIh-q8QTwaHEvvKuJPmq8RKO
X-Proofpoint-ORIG-GUID: RTucxBVNOIh-q8QTwaHEvvKuJPmq8RKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_14,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310161
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

On 5/31/2024 8:20 AM, Shuah Khan wrote:
> On 5/31/24 00:09, Danish Prakash wrote:
>> (as part of LFX Linux Mentorship program)
>>
> 
> Please add proper commit log for this change.

Looks like a good fix, and I'd love to take it, but the commit log needs 
some content.

> 
>> Signed-off-by: Danish Prakash <contact@danishpraka.sh>
> 
>> ---
>>   Documentation/accel/qaic/qaic.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/accel/qaic/qaic.rst 
>> b/Documentation/accel/qaic/qaic.rst
>> index efb7771273bb..628bf2f7a416 100644
>> --- a/Documentation/accel/qaic/qaic.rst
>> +++ b/Documentation/accel/qaic/qaic.rst
>> @@ -93,7 +93,7 @@ commands (does not impact QAIC).
>>   uAPI
>>   ====
>> -QAIC creates an accel device per phsyical PCIe device. This accel 
>> device exists
>> +QAIC creates an accel device per physical PCIe device. This accel 
>> device exists
>>   for as long as the PCIe device is known to Linux.
>>   The PCIe device may not be in the state to accept requests from 
>> userspace at
> 
> thanks,
> -- Shuah

