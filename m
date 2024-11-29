Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A49DC1E0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 11:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02C210EDC8;
	Fri, 29 Nov 2024 10:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="psnOZsWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877AE10E085;
 Fri, 29 Nov 2024 10:01:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMP29P008881;
 Fri, 29 Nov 2024 10:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aKEI52qlbfI6in9JOn2bWiNi9/fIjx1dJ3/1LCgUjak=; b=psnOZsWZynkznY7L
 9YjSYUtXLcwMgNZJ5EW6Q8aZZpe9SGf+2Mr97FjuFxnNPD80SSP+bf21VN9ovRYL
 3Gjh4Y2ImSwmAXvFBzvlLbC78MOXIA5s0vWasnnm8g8C5r0nHFO1KLAwjA/jSOqB
 L+3zlY4wQIuFTR8Kvi0+B6XbROTMZUFQsiy8UjpgH8UjHrGuYNiogXn/pbPkFito
 jgHMxD4IIVFb2WsPkM5QrZ00k9j6QaqNX6cjJFk2fTQQF5wZ/IslbdjsbX49f2eA
 qByDCoMbcWYS+rm6ZdcoDerbaV/L3TgrmglOO4c7AnBq8fDFXaL0sH8IJdIW/2lg
 F0c7pA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xy5345-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 10:01:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATA1cTY020983
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 10:01:38 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 02:01:31 -0800
Message-ID: <9821c4d5-8d1d-4bed-b3e0-879d0aeba017@quicinc.com>
Date: Fri, 29 Nov 2024 18:01:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add QCS8300 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
 <f5kqdxkhniwwxu6wm2q323vvlsfn3yyig7mfg3h5ctqo7jjxc7@7g32tirseuqs>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <f5kqdxkhniwwxu6wm2q323vvlsfn3yyig7mfg3h5ctqo7jjxc7@7g32tirseuqs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aYb8h_jMXsYvHi4_8G2fFQlzTxTgfpEt
X-Proofpoint-ORIG-GUID: aYb8h_jMXsYvHi4_8G2fFQlzTxTgfpEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=997
 mlxscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290080
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



On 2024/11/27 21:49, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 03:05:04PM +0800, Yongxing Mou wrote:
>> Add definitions for the display hardware used on the
>> Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   .../drm/msm/disp/dpu1/catalog/dpu_8_4_qcs8300.h    | 485 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>   4 files changed, 488 insertions(+)
>>
>>
> 
> NAK, there is no need for this.
Got it,thanks. will modify it in next patchset.Compared to sa8775p, they 
use same dpu but qcs8300 has one less intf and two fewer dp intfs. Other 
configurations are the same.can we reuse it or a new catalog file to 
show it.
> 
> 

