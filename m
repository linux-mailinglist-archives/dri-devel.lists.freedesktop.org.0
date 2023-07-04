Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5319F747650
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E558810E2F5;
	Tue,  4 Jul 2023 16:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E8510E2F5;
 Tue,  4 Jul 2023 16:18:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36461AEF018704; Tue, 4 Jul 2023 16:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ljzIr1GvFkA2L7mrh7r0rOyoGjyhjOhywAgfd8Edlz0=;
 b=hWESQYzJOuXN2zVOv/nQ3MFnLLrnLlaaG6eOSt3YNQ6BI7goy/nDMNskwSlawp0WnFMh
 vsYpJMor9p7QiWXZxHP8vsG5kmn6vIBjpJekT2ypRE/IzH4ET/3DPUhfXvfz0zHkOIum
 jzEJh6KNswnOiVGdijQNTV4QuEpGhAW4OvNzhOKcz8YO80ZoVjEH0FWrseOUf/nvjK+5
 xAhHjMTKlzpzaeeGWPcL6duldH/e59LL+x4FbwsbkFR/OfBMM83iTDtWhy3jYjTTLPmX
 0vZAl3aFRzjmUH9R53pKtJbpyFisNQp3ByVHKwjxqdHVBK3/pPcIbkG0kH6kLNrGC/OT Aw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm1sb2rea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 16:18:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 364GIRTX004772
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 16:18:27 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Tue, 4 Jul 2023
 09:18:25 -0700
Message-ID: <3cc71fbc-c8f6-cff4-adf3-19013bedc98e@quicinc.com>
Date: Tue, 4 Jul 2023 09:18:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: add missing flush and fetch bits for
 DMA4/DMA5 planes
Content-Language: en-US
To: Jonathan Marek <jonathan@marek.ca>, <freedreno@lists.freedesktop.org>
References: <20230704160106.26055-1-jonathan@marek.ca>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230704160106.26055-1-jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hK60cDD_ckLgNX1mXqggon0APgjcb59-
X-Proofpoint-ORIG-GUID: hK60cDD_ckLgNX1mXqggon0APgjcb59-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_10,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=695 clxscore=1011 spamscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040141
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sean Paul <sean@poorly.run>, open
 list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, "open
 list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/4/2023 9:01 AM, Jonathan Marek wrote:
> Note that with this, DMA4/DMA5 are still non-functional, but at least
> display *something* in modetest instead of nothing or underflow.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Will pick this up for -fixes
