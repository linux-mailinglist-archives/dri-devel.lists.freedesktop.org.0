Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47BC72855
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC9210E6EB;
	Thu, 20 Nov 2025 07:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XLFUhixT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440F410E6EB;
 Thu, 20 Nov 2025 07:11:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK50FQ24104949; Thu, 20 Nov 2025 07:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KNaP7Q607cOb5siBQiPOtij0E1NZqriqXz41/3/+zaY=; b=XLFUhixT9zXAcK5o
 5Z2MS9Xqa99cgm6RYzIt058QfZUsSWw6ti311uFB0JRSejf6tHz+GauARdZUWzXa
 W9BuCecuWEudNJil9Tguj3EyyhwnHrthz6pjBaU/RNv86Azh1hWppI9TAtm1bdDp
 14/PVNnbZpK0FH5dvZAG0GTeMZf5FBbdpNqvxKJc+3oMnLcjcG1FVjWhGRw24r4o
 4eW4SPTf59ONB9KrkRjilciyMToo/fe6rdIYCGMmhFXsjd4ON5VG40cdeEB4yvPG
 IHDatZVrwZtYByEGGv6jMa1mn9wzs0xNAwb/R7Dp/dSFcxk1en1+Bou0XUnjefs6
 HGtZ4g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahver0b06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Nov 2025 07:11:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK7BMg2028326
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Nov 2025 07:11:22 GMT
Received: from [10.204.78.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 23:11:14 -0800
Message-ID: <e6e081b5-4a7a-425f-af24-98e93cd1a60a@quicinc.com>
Date: Thu, 20 Nov 2025 12:41:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <marijn.suijten@somainline.org>, <swboyd@chromium.org>,
 <mripard@kernel.org>, <abel.vesa@linaro.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <robin.clark@oss.qualcomm.com>,
 <jessica.zhang@oss.qualcomm.com>, <abhinav.kumar@linux.dev>,
 <sean@poorly.run>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <alex.vinarskis@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
 <quic_riteshk@quicinc.com>, <quic_amitsi@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
 <c4o6bcvl7cgmvklvnwj7togokawvaiqmiye3sgdlugwftz45bh@g7vfktowo5hj>
Content-Language: en-US
From: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
In-Reply-To: <c4o6bcvl7cgmvklvnwj7togokawvaiqmiye3sgdlugwftz45bh@g7vfktowo5hj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZvPg6t7G c=1 sm=1 tr=0 ts=691ebf1b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=xgBnMW_o2ljmifkhbjUA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KZGMStxDDC_AK_i7TTseNbxFFiy92cxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0MCBTYWx0ZWRfX3WeHMYDE2USM
 EJN2ixcz2qWLs4gMqd3DQHMSkOMr3rzhtrJrdhzJlpxQiOdGlwG/a1HUrSM325UCVRVbVTv5jsa
 YT9At5LyJjR5uZLhr2kh6mKDJrss3tDQZCvaa/z8qUY9Ob2MnZTC+ju2PzaEE91dlcCKkGFSbNe
 3PXuqhyk8FJebRLXYAtY/HsdHExDbJhZi2Cl+MUxwUtRfedd4bHlfztzoXdYdDyfXaU9vVjEDeQ
 eI5SyydXRS0g9rbxsI6P5HZC8Y+yKwk1ecJo5c1Uvgfa01N7oEOF8lRHKFuA7xeRjvkdNiGQioZ
 Q0SttKOIcUtCevHKwEbraaNDED6NY0IOHlZlvL8g4u1bi82RY0AKl1vZq/6AnspF1D7cfcSx3Ep
 Zey+KvkrE24oUirt20iRw5FzRn9/kA==
X-Proofpoint-GUID: KZGMStxDDC_AK_i7TTseNbxFFiy92cxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200040
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



On 9/26/2025 7:21 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:29:53PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
>> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Missing Fixes tag.
> 

Sure.

