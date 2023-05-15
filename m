Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897677039FA
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 19:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2107E10E0FC;
	Mon, 15 May 2023 17:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1578610E0E6;
 Mon, 15 May 2023 17:47:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FHCnhK010977; Mon, 15 May 2023 17:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AKq3OA68Xdh2Pwr0i6y5rLL9DOMYklqjB584l2l1Ee8=;
 b=otVEz15wmw2pcJ2YRHfZi7mxB5/+FXPTsgzER9jF21mPskXshj6McZFJgMbv8e6qfW9m
 z4oktvKsbVHSsG3Yl3y7wsbR/LrskDhbieu+dwcf18IykeZyAogxTCWX26cnJ5kmTZor
 6BIgpqsXL+xcpS0UYeV39S0ZbACqY6ZC5YTFzi33MeyecdD2Hzx1H4v4ysk+w+lIsptw
 t/mRxLFH9ye8sHt7Z92gGfDelUCPro4gz/QYculUZ7MDyATD7ImQlRfqxlHZQmvXbM4P
 VcpGWaoHGwDdXqGYvHTpDnq5uwQoWDF8Pvr8si6N8p1FrJufjf/O3SS47VpiHt3bGCuv Uw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkjwds83k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 17:46:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FHksn8021026
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 17:46:54 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 10:46:53 -0700
Message-ID: <1fd8fd48-9a0a-774c-1366-ea4c893f3b25@quicinc.com>
Date: Mon, 15 May 2023 10:46:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
 <41243dc6-eb9d-dea6-f945-cb1f6594a2a4@linaro.org>
 <w6uswjuf7fiorrplqzhrpg3vrjbbdd3bgaxej5l6ez3pebn3d5@ytuxhim25j6q>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <w6uswjuf7fiorrplqzhrpg3vrjbbdd3bgaxej5l6ez3pebn3d5@ytuxhim25j6q>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PigQ09qt6WdvzSy-Qk0yH7QxqHjPzdTp
X-Proofpoint-GUID: PigQ09qt6WdvzSy-Qk0yH7QxqHjPzdTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150149
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/14/2023 2:46 PM, Marijn Suijten wrote:
> On 2023-05-12 21:19:19, Dmitry Baryshkov wrote:
> <snip.
>>> +static inline void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
>>> +						    const enum dpu_pingpong pp)
>>> +{
>>> +	struct dpu_hw_blk_reg_map *hw;
>>> +	const struct dpu_dsc_sub_blks *sblk;
>>> +	int mux_cfg = 0xf; /* Disabled */
>>> +
>>> +	hw = &hw_dsc->hw;
>>> +
>>> +	sblk = hw_dsc->caps->sblk;
>>> +
>>> +	if (pp)
>>> +		mux_cfg = (pp - PINGPONG_0) & 0x7;
>> Do we need an unbind support here like we do for the DSC 1.1?
>>
>>> +
>>> +	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
>>> +}
> <snip>
>
> Friendly request to strip/snip unneeded context (as done in this reply)
> to make it easier to spot the conversation, and replies to it.
>
> - Marijn

Thanks for suggestion.

How can I do that?

just manually delete unneeded context?

Or are they other way (tricks) to do it automatically?


