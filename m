Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA516A7097
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 17:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB3A10E2F6;
	Wed,  1 Mar 2023 16:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A89010E2F6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 16:10:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321F03BS027405; Wed, 1 Mar 2023 16:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lxzdVO6e5uOHUQ9IHfrqQIF16tpj53k7PXc6bfMmSUU=;
 b=MYhKFOWF/hphqjXdLF5UhDPKnL3d8CgflXHRiAV25ygVI1YGUB3NtWKfIm4ksvtKanKw
 CckwOwfxNEZaQi7KnxQRIEYYMq+ikzM//r1wTKcHXpRLkQHlO2VbnSen0+iv51qo0QpQ
 TRGVKL/aIHThG4h5iUV+Bm6r5Zb8xhV66t6XUFo/po+dk9jFuqH1p0D15SCC9KUJ6R52
 Mq1/DIbH9GDdkivnwQFUFrN1Fi0uUgQTsugUwlqenxh3Mzymz1P+MGD6D4odtCpEVDQG
 SE2LNb3E58ANSrkP7wYp2geaP3b6hHxbwdJZFMQkMSYnS1/veoqZV6lynwVK0f6LO+qJ Ig== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1vgejcdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 16:10:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321GAUDI031291
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 16:10:30 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 08:10:29 -0800
Message-ID: <95507b00-af58-0f20-a227-69a5e016ba81@quicinc.com>
Date: Wed, 1 Mar 2023 09:10:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 7/8] accel/qaic: Add qaic driver to the build system
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-8-git-send-email-quic_jhugo@quicinc.com>
 <20230301130245.GA3815307@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230301130245.GA3815307@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HUM3dmzJGP8pq3uA2zHMoYiSEoSQfyX8
X-Proofpoint-ORIG-GUID: HUM3dmzJGP8pq3uA2zHMoYiSEoSQfyX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_12,2023-03-01_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=890 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010131
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/1/2023 6:02 AM, Stanislaw Gruszka wrote:
> On Mon, Feb 06, 2023 at 08:41:44AM -0700, Jeffrey Hugo wrote:
>> Now that we have all the components of a minimum QAIC which can boot and
>> run an AIC100 device, add the infrastructure that allows the QAIC driver
>> to be built.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
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
>> index 8348639..56d0d01 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -25,3 +25,4 @@ menuconfig DRM_ACCEL
>>   
>>   source "drivers/accel/habanalabs/Kconfig"
>>   source "drivers/accel/ivpu/Kconfig"
>> +source "drivers/accel/qaic/Kconfig"
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 07aa77a..3cb6f14 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -2,3 +2,4 @@
>>   
>>   obj-y	+= habanalabs/
>>   obj-y	+= ivpu/
>> +obj-y	+= qaic/
> 
> All should be changed to obj-$(CONFIG_DRM_ACCEL_DRIVER)
> to avoid inspecting sub-directories. I'll send patch for this.
> Then you can adjust accordingly for qaic.

Sounds good.

-Jeff
