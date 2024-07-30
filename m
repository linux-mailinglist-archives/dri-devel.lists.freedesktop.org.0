Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E794211E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 21:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C7E10E313;
	Tue, 30 Jul 2024 19:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ti+L7wJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AF110E313;
 Tue, 30 Jul 2024 19:54:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UFbjMG030394;
 Tue, 30 Jul 2024 19:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +ELkOigseQEngOATb2U9ltK82gUkK4Gww+K4FCsaDfY=; b=Ti+L7wJBF6ihbn46
 8KYrsYVCKiEa6HzLM8BJVfaVxmGCYLa9QXzYZ9Y+AjXq4RjEE/H+/tJd/z26Y5zM
 8yjCjPjYTnF215PS+WE8CDMNj48NbISNYIcSmtny13R4ta8WZukzVBkhDE+ZFlc9
 Y3J9zMrmuADvGugcVvxzXhwjb0DOCmwnNzcfRNE5Rip25MtMbX1XPuM3Axxd73s3
 lwvKiJ4QZf2Euah3JJvQvVYtiRFhbeOVRHfzU/+R8oc0VJwDe2jrFYj5f4tXzTZk
 kZEX1lsxqCPYIhPjYRtE20rmAll1RKDrHhmanhOFnZuYRxZqQdb/QIwOBFgae01h
 8Mjrwg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw4422r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 19:54:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46UJsTHV002333
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 19:54:29 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 12:54:28 -0700
Message-ID: <872449ad-987a-4e15-bfb0-bf5572cf9302@quicinc.com>
Date: Tue, 30 Jul 2024 12:54:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: enable widebus on all relevant chipsets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <swboyd@chromium.org>, <dianders@chromium.org>,
 <neil.armstrong@linaro.org>, <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240711224850.1672662-1-quic_abhinavk@quicinc.com>
 <xmkcy7xjoaodxnyzbskjb7y5xne444qx4jdrtcgoqwh45aqjn2@4rnbkhr5uuby>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <xmkcy7xjoaodxnyzbskjb7y5xne444qx4jdrtcgoqwh45aqjn2@4rnbkhr5uuby>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jgj4PaGdt0hKLr8Iux_JKqeOYeqrUfRR
X-Proofpoint-ORIG-GUID: jgj4PaGdt0hKLr8Iux_JKqeOYeqrUfRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_15,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300136
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



On 7/13/2024 3:55 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 11, 2024 at 03:48:50PM GMT, Abhinav Kumar wrote:
>> Hardware document indicates that widebus is recommended on DP on all
>> MDSS chipsets starting version 5.x.x and above.
>>
>> Follow the guideline and mark widebus support on all relevant
>> chipsets for DP.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
> 
> Although it doesn't seem to fix the 4k screen corruption, I think it's
> still a proper patch (and we should be following hardware
> documentation).
> 
> With the Fixes tags in place:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

Thanks, I have added the Fixes tags and re-pushed.

I have added only sm8650's tag and another change which re-used sc7180's 
dp_descs without retaining the widebus_supported bit.

The reason I didnt add others is because widebus support itself was 
added only later to DP driver compared to the other ones.

If I am missing any Fixes tag, pls let me know and I can fix it while 
applying.
