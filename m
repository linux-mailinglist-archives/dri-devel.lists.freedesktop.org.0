Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550146BD6B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 18:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7981310EDA9;
	Thu, 16 Mar 2023 17:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4278F10EDA8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 17:04:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GGRwA6022698; Thu, 16 Mar 2023 17:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wgb8rv8KbzFYSeqAkvAMuG9pk38MZUdLqwMuuhTKKBg=;
 b=EdH5Zp2daYm1GEsrKsgGT8jex1kO4KGLTCB6Fvvkd+618YWhRYG8jSG+tA+w+nqp1NlY
 Enm7hIGaSaAvH4YZzxvf3YvDpYbLuO9PofgUpR9scjCiXpwCnbKlb8oPU7va8lxNeMhD
 YH5cGypae597y5jRcuvdwF+mEZExg0i70iKnNRS0q88vCPvXPHw0LwDExnA0ill2+9zb
 8w4+SeAzNqpR0tYhOuQPfwoKdMOWgAbREa74CNdbD371x8hLQZFOMlx9H2Ho3/ppqom6
 /ewqeGP7Gw/xfE+pwmWAnRscwjHlAAQWYo018aH1U1NNkBXAsGUewHcK2tLXeNcC2661 ew== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pc3yp8qav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:04:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32GH463w008774
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:04:06 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 16 Mar
 2023 10:04:05 -0700
Message-ID: <daa3100e-8f5b-8dbb-297f-ca3a87b44a97@quicinc.com>
Date: Thu, 16 Mar 2023 11:04:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dafna@fastmail.com>, <ogabbay@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
 <5e912413-eee4-5b25-5f6d-00ccc7501b9d@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <5e912413-eee4-5b25-5f6d-00ccc7501b9d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mAJ2KITASk0FsZJeRfyJQRX-kbvMUAhl
X-Proofpoint-ORIG-GUID: mAJ2KITASk0FsZJeRfyJQRX-kbvMUAhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303160132
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/14/2023 3:59 AM, Jacek Lawrynowicz wrote:
> Hi
> 
> On 06.03.2023 22:34, Jeffrey Hugo wrote:
>> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> ---
>>   MAINTAINERS | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b0db911..feb2974 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17253,6 +17253,15 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
>>   F:	drivers/clk/qcom/
>>   F:	include/dt-bindings/clock/qcom,*
>>   
>> +QUALCOMM CLOUD AI (QAIC) DRIVER
>> +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +F:	Documentation/accel/qaic/
>> +F:	drivers/accel/qaic/
>> +F:	include/uapi/drm/qaic_accel.h
> 
> Aren't you missing repo link?
> T:	git git://anongit.freedesktop.org/drm/drm-misc

Maarten/Maxime/Thomas are we ok to follow the iVPU example and use 
drm-misc for this, or would a separate tree be preferred?

-Jeff

