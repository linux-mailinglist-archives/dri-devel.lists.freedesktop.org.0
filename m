Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCD6C4D15
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B432210E952;
	Wed, 22 Mar 2023 14:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C9910E95C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:08:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32M5Di7Z006527; Wed, 22 Mar 2023 14:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XyC8Vg8Vddv01CmDJkL51n+6GguQndl0CbYryLQ2s/0=;
 b=Yk8YO2CLwdIbcjGh3XoiwPSuKuMqVXTASblAf5fEk6Z9/ALhwhczEonkRo9EzPyDekzb
 n2DVsEdjDwpR0KQ3RRQaCV+TNgItSMp2oE4+q+OKEU54AScqRaoHNfUAC1aeFfX/dvDu
 AOMQTNOksmf3vm5aLlXhefd5F0Lh4WRfhmR/rvsN8+M6G+q53Osr0OtGTJO9rsRxFeeu
 BUxtmP6lQ6WFqzZkhwzpRzltCk2ONjk8AnX5eDkE8inFzsJHFPAbS8WlXvZbVNXS741v
 /y7KQA32koVjki7Sp+HOAgFz3CPzwwMwR6khvWoc+ofwg8VxC2t/qIERNo1FgOh/ynnq fw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfdm4k5y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:08:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32ME8ij0018980
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:08:44 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 07:08:43 -0700
Message-ID: <9ecfcdc2-71cb-4149-a05c-69947f255720@quicinc.com>
Date: Wed, 22 Mar 2023 08:08:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 7/8] accel/qaic: Add qaic driver to the build system
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <stanislaw.gruszka@linux.intel.com>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-8-git-send-email-quic_jhugo@quicinc.com>
 <f4e01050-ecaa-75e3-92f4-e2b71702cc52@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <f4e01050-ecaa-75e3-92f4-e2b71702cc52@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KKjN7n1FXYZWVrJvU4-PSbWKHS8JBm_N
X-Proofpoint-GUID: KKjN7n1FXYZWVrJvU4-PSbWKHS8JBm_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220103
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

On 3/22/2023 2:03 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 20.03.2023 16:11, Jeffrey Hugo wrote:
>> Now that we have all the components of a minimum QAIC which can boot and
>> run an AIC100 device, add the infrastructure that allows the QAIC driver
>> to be built.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/Kconfig       |  1 +
>>   drivers/accel/Makefile      |  1 +
>>   drivers/accel/qaic/Kconfig  | 23 +++++++++++++++++++++++
>>   drivers/accel/qaic/Makefile | 13 +++++++++++++
>>   4 files changed, 38 insertions(+)
>>   create mode 100644 drivers/accel/qaic/Kconfig
>>   create mode 100644 drivers/accel/qaic/Makefile
>>
>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index c437206..64065fb 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -26,5 +26,6 @@ menuconfig DRM_ACCEL
>>   
>>   source "drivers/accel/habanalabs/Kconfig"
>>   source "drivers/accel/ivpu/Kconfig"
>> +source "drivers/accel/qaic/Kconfig"
>>   
>>   endif
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 07aa77a..26caf43 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -2,3 +2,4 @@
>>   
>>   obj-y	+= habanalabs/
>>   obj-y	+= ivpu/
>> +obj-$(CONFIG_DRM_ACCEL_QAIC)  += qaic/
> 
> Use two tabs instead of two spaces here to align with the current version of this file on drm-misc-next.

Will do.

-Jeff

