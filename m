Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235DA6B9A8A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C3F10E81A;
	Tue, 14 Mar 2023 16:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0410E81A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 16:03:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EEapN9017544; Tue, 14 Mar 2023 16:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CYgHvaw7BhPqjETrroZe3oIcYWpvV9TZDAqwCRgmVgo=;
 b=mTu0sR+2b5PzTvegzmXNJ/8Fm8D339R61zeGSA+zhJ+UzXllYtcAF/koC1xNZ09e0nUc
 LU6AmfKNGCbAOWycZJXidPCdLoUvGI3eoIq/3MkEJugkZOv3DKx8Hbs8u6Y1qep9MKkq
 Lvd22QFqcamjVOGoS3HhC3dtyGLrDb4U8oM4bU6/GdNIbohfjZ+h6yW4iPS9ybNdlNgj
 F4Vku+00abSSS3P4Rv/eCd9Mjdmi0xvpNWjdhLeKRYGFsnLvhQGkxXz0x/up4dLA6K+G
 /SWZ1hZXQRPpAEwpUTTn+KBoQIH//pkUMjnUhtv4Ij8+Vy7LpargRz7OL+6wRck/Kin1 HA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3panvj14pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 16:03:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32EG2xQh029676
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 16:02:59 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 14 Mar
 2023 09:02:58 -0700
Message-ID: <1ebb050e-0b16-71df-9c3c-06456af52e7c@quicinc.com>
Date: Tue, 14 Mar 2023 10:02:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dafna@fastmail.com>, <ogabbay@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
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
X-Proofpoint-ORIG-GUID: 6fWxee92dHeksSvlSmC9I-jlM_MT68T4
X-Proofpoint-GUID: 6fWxee92dHeksSvlSmC9I-jlM_MT68T4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_08,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140133
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

The long term repo is a bit of an open question.  I don't have access to 
that right now.

I'll try to get a conclusion on that for the next rev.
