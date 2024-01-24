Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0A83B434
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 22:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019FF10E373;
	Wed, 24 Jan 2024 21:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B9E10E373;
 Wed, 24 Jan 2024 21:41:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40ODvcWA010402; Wed, 24 Jan 2024 21:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=uQX9xuShpgOtVrWiP3OZBHiY1ykF6TDzrzZZ7r10cOM=; b=Ta
 5qce0HNX3SFBPsbw2pePbOVJusLvRjnvfXl189XHnSo/ZhOkxVM8YEJ+ELORhE4H
 InJRuD7kQH4gvy3zZ/deOsHya6lXzkXErWOhPyoeKa+7+26iQO3zwWspaPO8VPjF
 zTTaLv4S1kcz/PpnLW3IJQF3yDMm6iJAbxMlrgz2Y012WxETdUByIfvbq98v0XGr
 RcREem2fpTDO0QOBKwcew5aos8uEiC/lbCTmI1O1H/F3gk9S/OgVKxdcHXylPOWA
 dT97yaY4/boPUXUC7rcqvpFs6Bazg0dkRijHVZgwfwERTKC1Awi7OXJqtUWy3eDJ
 F3tWnHEbF6I2sMsYNYXg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vu1cche7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 21:41:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40OLfdkH003049
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 21:41:39 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 13:41:39 -0800
Message-ID: <5835e242-ea32-7d94-6247-6bfd236424cd@quicinc.com>
Date: Wed, 24 Jan 2024 13:41:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: drop obsolete documentation for
 dpu_encoder_virt
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
 <64967f7a-8c7d-ca63-c126-e187905d3470@quicinc.com>
In-Reply-To: <64967f7a-8c7d-ca63-c126-e187905d3470@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: S41NaIM1uzw9Px3fsm1VpdamCOCwiPwz
X-Proofpoint-GUID: S41NaIM1uzw9Px3fsm1VpdamCOCwiPwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_10,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=504
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240157
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/18/2023 9:57 AM, Abhinav Kumar wrote:
> 
> 
> On 12/16/2023 4:01 PM, Dmitry Baryshkov wrote:
>> Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
>> Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard 
>> encoder debugfs dir")
>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

Have picked up https://patchwork.freedesktop.org/patch/572962/ instead 
of this one as it also cleans up another doc error in addition to the 
ones here.
