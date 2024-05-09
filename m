Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481598C151A
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 21:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4708310EF61;
	Thu,  9 May 2024 19:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Y0RCS5xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF6310EF5F;
 Thu,  9 May 2024 19:00:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449B7BB4006645;
 Thu, 9 May 2024 18:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=TGevrFxx2sEOPvGB+uwSE8YqKDHduVwVRYRlUxcJcic=; b=Y0
 RCS5xi8DUFJJFXkFIvslJpUQrX4N2B3rw2xR16vtDShPPd+qYZIuNsuxZ8i6m4fc
 7sv6KhcKZSZi7c7QPjJ9wFHg9qg7QGVQt/snMIATkReTj2iuIbCpa3/ALDME/h2B
 CU7nyRmq6odr22bXb3x44XSJ0rPwr9nR7AxroyipgFa+PXmO9HUJNZ1CM0yxMbFX
 duZCvXpDtkiw1xsot3uNogv4dk35QIk1CJFL2qZ/2v/glgh5QRyU3/dDK6KTsk8B
 +YnTz2quCwc3krndrS/xLXeunhRMKGwonDR7tfPtXM+ymDcBxxXnyH9HAl60UaVR
 id5pYbUb6pp0XEgHAJgA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wfup54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 May 2024 18:59:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449IxsG5018864
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 May 2024 18:59:54 GMT
Received: from [10.110.104.129] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 11:59:53 -0700
Message-ID: <1e043ff3-58e0-7fd0-00b6-9117bc81e9ff@quicinc.com>
Date: Thu, 9 May 2024 11:59:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] docs: document python version used for compilation
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
CC: <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <87o79faq4a.fsf@meer.lwn.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UTN9o-NiCFp8SHChNih0iPS8RnlyCSRO
X-Proofpoint-ORIG-GUID: UTN9o-NiCFp8SHChNih0iPS8RnlyCSRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_10,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090133
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



On 5/9/2024 9:48 AM, Jonathan Corbet wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
>> The drm/msm driver had adopted using Python3 script to generate register
>> header files instead of shipping pre-generated header files. Document
>> the minimal Python version supported by the script.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/process/changes.rst | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
>> index 5685d7bfe4d0..8d225a9f65a2 100644
>> --- a/Documentation/process/changes.rst
>> +++ b/Documentation/process/changes.rst
>> @@ -63,6 +63,7 @@ cpio                   any              cpio --version
>>   GNU tar                1.28             tar --version
>>   gtags (optional)       6.6.5            gtags --version
>>   mkimage (optional)     2017.01          mkimage --version
>> +Python (optional)      3.5.x            python3 --version
>>   ====================== ===============  ========================================
> 
> Is it really optional - can you build the driver without it?
> 

True, we cannot build the driver now without it. So we should be 
dropping the optional tag.

With that addressed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> This document needs some help... I'm missing a number of things that are
> *not* marked as "optional" (jfsutils, reiserfsprogs, pcmciautils, ppp,
> ...) and somehow my system works fine :)  It would be nice to document
> *why* users might need a specific tool.
> 
> But I guess we aren't going to do that now.  I can apply this, but I do
> wonder about the "optional" marking.
> 
> Thanks,
> 
> jon
