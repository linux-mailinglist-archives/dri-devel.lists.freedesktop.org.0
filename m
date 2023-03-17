Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A816BED44
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 16:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B242A10E3D7;
	Fri, 17 Mar 2023 15:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03DD10E3CA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 15:46:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32H7XDuu008545; Fri, 17 Mar 2023 15:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8AcIYKeQG6v69pjuFOl6upkYnoD8e1+UbD7At/+bHKw=;
 b=n/zNEYis7FQY2D4s/CVfQvZyW3onJe5r2IRtXwcaBq1Hwlw1+xgyU8xTz4v4cxd8anXf
 pMJiTlhUy9W5SJewGDtBIJWY4qLJBRKL6U+xiSfaBBpLSH3VVjjk/PUurb3mQj8Q9t9x
 eaGgPWgG7sQYkbxe01zDd5EHTQSw2r6J41uVuHP6mzJg33s5U1U4G4Y7Gkbpr4YbybD1
 kkEKe/KM+0UxjUCuNyMVWwgpeFJHVZ2MKsor9OPoB2hcMdbcB77dlS5uwPw5YY9yICyu
 Q6PzE+VWVQUB9Twr1nLRg/M/5i2iF82zoMIblkXWN5ktkf0CuSU8SueE3Z9hMs/pTVOZ 8w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pcayeay7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Mar 2023 15:46:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32HFkT4e012574
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Mar 2023 15:46:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 17 Mar
 2023 08:46:28 -0700
Message-ID: <d46b8f76-ce60-1c01-edc7-ec227315faf9@quicinc.com>
Date: Fri, 17 Mar 2023 09:46:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
 <5e912413-eee4-5b25-5f6d-00ccc7501b9d@linux.intel.com>
 <daa3100e-8f5b-8dbb-297f-ca3a87b44a97@quicinc.com>
 <20230317140451.uywz7szrzvusyrjy@houat>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230317140451.uywz7szrzvusyrjy@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1rGsMj7FbbY-8aRzSatMJSyQs7QbdUg1
X-Proofpoint-GUID: 1rGsMj7FbbY-8aRzSatMJSyQs7QbdUg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_10,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170106
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dafna@fastmail.com,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/17/2023 8:04 AM, Maxime Ripard wrote:
> On Thu, Mar 16, 2023 at 11:04:05AM -0600, Jeffrey Hugo wrote:
>> On 3/14/2023 3:59 AM, Jacek Lawrynowicz wrote:
>>> Hi
>>>
>>> On 06.03.2023 22:34, Jeffrey Hugo wrote:
>>>> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
>>>>
>>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>> ---
>>>>    MAINTAINERS | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index b0db911..feb2974 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -17253,6 +17253,15 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
>>>>    F:	drivers/clk/qcom/
>>>>    F:	include/dt-bindings/clock/qcom,*
>>>> +QUALCOMM CLOUD AI (QAIC) DRIVER
>>>> +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
>>>> +L:	linux-arm-msm@vger.kernel.org
>>>> +L:	dri-devel@lists.freedesktop.org
>>>> +S:	Supported
>>>> +F:	Documentation/accel/qaic/
>>>> +F:	drivers/accel/qaic/
>>>> +F:	include/uapi/drm/qaic_accel.h
>>>
>>> Aren't you missing repo link?
>>> T:	git git://anongit.freedesktop.org/drm/drm-misc
>>
>> Maarten/Maxime/Thomas are we ok to follow the iVPU example and use drm-misc
>> for this, or would a separate tree be preferred?
> 
> Yeah, please go ahead with drm-misc
> 
> Do you have commit rights?

No.  My operating assumption is this series will get merged first, which 
will then justify having commit rights.  I'm new to DRM, so please 
educate me if I'm missing something.

Thanks

-Jeff
