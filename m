Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8888D101
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 23:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C685E10F411;
	Tue, 26 Mar 2024 22:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jehUXpAQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5696010F410;
 Tue, 26 Mar 2024 22:34:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QMVhLj022755; Tue, 26 Mar 2024 22:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=GgdI2a2c4H12DVqkWEtteh7c794DibNYVkYH1swXpdU=; b=je
 hUXpAQaQQkRkHIeUakP1cFoaF+NlQ+uEsZlTC3SQ5qH3qEx/c9smo2rTneSjbI7w
 We0GTyDmo7BhZ/ieth2FFOGHms1Jhox6gbFO5hP1bkygItFN335pcREixc1NCq1B
 mgwa4/MX9WVvtSdreFebM88/W8mp4WK4rh5/wAymqBT44jS1LicDYkOYUlrhqskH
 Tm0z/bK9Vp6ZAVCPeluLXsQv0LtqqncpkgDpbFYSiJQ2oQGH/gNkv3jUJ2H/CbzE
 d6OttwwVqHAWLO+1dczu2zkToYMuV6QLB4tVEMDFie8kJzzwY5x3XFYf5Jmvzh9N
 hW2ZV68C2g6778JsMo5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x477yr05w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 22:34:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QMY6dI027891
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 22:34:06 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 15:34:02 -0700
Message-ID: <464ff2ec-b023-4485-0565-ccc63f951088@quicinc.com>
Date: Tue, 26 Mar 2024 15:34:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
 <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
 <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
 <CAA8EJpry2dHyBF4wyXeFAyLu+9_tYg3xyP6eAM7RzJzOiOqypA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpry2dHyBF4wyXeFAyLu+9_tYg3xyP6eAM7RzJzOiOqypA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yd8cPp2klAfFUKXZ2Wb471wgBO9sXq9B
X-Proofpoint-ORIG-GUID: yd8cPp2klAfFUKXZ2Wb471wgBO9sXq9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_09,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403260162
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



On 3/26/2024 3:25 PM, Dmitry Baryshkov wrote:
> On Wed, 27 Mar 2024 at 00:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
>>> Import the gen_headers.py script from Mesa, commit FIXME. This script
>>> will be used to generate MSM register files on the fly during
>>> compilation.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
>>>    1 file changed, 957 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
>>> new file mode 100644
>>> index 000000000000..ae39b7e6cde8
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
>>> @@ -0,0 +1,957 @@
>>> +#!/usr/bin/python3
>>> +
>>
>> We need a licence and copyright here.
> 
> Yes, this is going to be fixed in the next revision. Mesa already got
> the proper SPDX header here.
> 
>>
>> Also is something like a "based on" applicable here?
>>
>> <snip>
>>
>>> +import xml.parsers.expat
>>> +import sys
>>> +import os
>>> +import collections
>>> +import argparse
>>> +import time
>>> +import datetime
>>> +
>>> +class Error(Exception):
>>> +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
>>> +http://gitlab.freedesktop.org/mesa/mesa/
>>> +git clone https://gitlab.freedesktop.org/mesa/mesa.git
>>> +
>>> +The rules-ng-ng source files this header was generated from are:
>>
>> Is this still applicable ?
>>
>> Now gen_header.py is moved to kernel.
>>
> 
> Copied, not moved. So Mesa remains the primary source for Adreno
> headers and gen_header.py
> 

But all future development and code review on gen_header.py will be done 
in kernel itself OR periodically we will sync it up with mesa?

> 
