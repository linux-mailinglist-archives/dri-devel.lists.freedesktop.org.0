Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FDE8C024B
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 18:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0633F10EE39;
	Wed,  8 May 2024 16:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YxUXP+Tg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327D410E4B1;
 Wed,  8 May 2024 16:52:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448Baj8e004590;
 Wed, 8 May 2024 16:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=sE0LqZWV3gwZbXfblDbklDN+yoPcsfBA3AQZLjHvvno=; b=Yx
 UXP+TgDa/sgK1FHJNFugFRrQUSWk3Q9VE83FummGCSpTFzHXD8hozee3ehRd5dy7
 qZ+Y5FpgRBLUVRh1oUnAgXSOroqAFwtssmV3XCq9drdgmVBVjYzv3gdpCZ3SMmDR
 w7YuPJQm3aoZjYFDkPu01aWrEZspxw5xfT04Cbym6E1zi1ChHhhlU7ZBmDzXEq+2
 9ezBvfG6UTl0HuKFE8HK0VO11Mfr+STKjx6FKNeDJ01Sakts6Z3/whUY8qGeCYmv
 zOvcqFPuUPxUEVwJoDUrrOCnyrTPxB+gA4hrI41QjSzmpcPdkW64ToobmUAIjJM7
 4kz7h7VmyroyEc1r4Z/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y08ne0sdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 May 2024 16:52:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448GqWiT007223
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 May 2024 16:52:32 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 09:52:31 -0700
Message-ID: <0cf9d1ba-2c4f-0863-6f51-e76ee7846471@quicinc.com>
Date: Wed, 8 May 2024 09:52:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
 <swboyd@chromium.org>, <quic_jesszhan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Masahiro
 Yamada" <masahiroy@kernel.org>
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
 <87a5l0lmlv.fsf@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <87a5l0lmlv.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: p0YarwhYdHPcd0vHkL1pPlx1RUwiw5wh
X-Proofpoint-ORIG-GUID: p0YarwhYdHPcd0vHkL1pPlx1RUwiw5wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080122
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



On 5/8/2024 1:43 AM, Jani Nikula wrote:
> On Tue, 07 May 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
>> compilation is broken on machines having python versions older than 3.9
>> due to dependency on argparse.BooleanOptionalAction.
> 
> Is it now okay to require Python for the build? Not listed in
> Documentation/process/changes.rst.
> 
> BR,
> Jani.
> 

The change to move gen_header.py to kernel is already part of the v6.10 
pull request.

This change only fixes the version dependency.

But, I agree we should update the changes.rst (better late than never).

Dmitry, can you pls suggest which version we want to list there?

I am hoping that after this change there are no further dependencies on 
python versions, so anything > EOL should be fine.

I am leaning towards v3.8

> 
> 
>>
>> Switch to use simple bool for the validate flag to remove the dependency.
>>
>> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
>> index fc3bfdc991d2..3926485bb197 100644
>> --- a/drivers/gpu/drm/msm/registers/gen_header.py
>> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
>> @@ -538,7 +538,7 @@ class Parser(object):
>>   		self.variants.add(reg.domain)
>>   
>>   	def do_validate(self, schemafile):
>> -		if self.validate == False:
>> +		if not self.validate:
>>   			return
>>   
>>   		try:
>> @@ -948,7 +948,8 @@ def main():
>>   	parser = argparse.ArgumentParser()
>>   	parser.add_argument('--rnn', type=str, required=True)
>>   	parser.add_argument('--xml', type=str, required=True)
>> -	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
>> +	parser.add_argument('--validate', default=False, action='store_true')
>> +	parser.add_argument('--no-validate', dest='validate', action='store_false')
>>   
>>   	subparsers = parser.add_subparsers()
>>   	subparsers.required = True
> 
