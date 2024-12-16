Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411299F3DB0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1B410E7D3;
	Mon, 16 Dec 2024 22:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Km8BpZP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D111610E7D3;
 Mon, 16 Dec 2024 22:43:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGH9U2P016945;
 Mon, 16 Dec 2024 22:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H2L8uVyKd4qvBkJbrYXcMZ2oODeoHo/p2so9JSQLiHU=; b=Km8BpZP87w8cOaeD
 lKNUocOIKw585GAP3iMvcP0klGWDTepIqVYgedxH475QJbvtarzIVuxCQ2ljimr8
 kPFlf6eXRKQNCH6ZrvpbEJ5TPIM5dD7CXgm14+fAt7TRO+na6tQqTWzAv6F9t6Nl
 Fo7fm2wU/WxJovo6wHxPdFmSvNbhwpZsy15mHLXT6cOdEvy0hx6cIu0xB4/oo5aG
 58zRYlzrcyWjQovBJhLCWu8o0vZ6jPK9yAf8yg2Y0yosnq+lya90tRjhTEzi9qnH
 174Jsj2tESdNYMjv2cjsEZweeFSqbdfmGyvx9Nna7x/9zXYLpgijP6PYPkn9VCzL
 kkP3Pg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jrc1rqcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 22:42:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGMgvIL001796
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 22:42:57 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 14:42:56 -0800
Message-ID: <dadf64ae-348c-49bf-b5cd-6b37a81ecf20@quicinc.com>
Date: Mon, 16 Dec 2024 14:42:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>
CC: Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dK4aoDXc8E2edzBaK6_YWLW8j7Og53v0
X-Proofpoint-ORIG-GUID: dK4aoDXc8E2edzBaK6_YWLW8j7Og53v0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=881 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160186
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



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
