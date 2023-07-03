Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D49746591
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FFC10E240;
	Mon,  3 Jul 2023 22:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182D10E23F;
 Mon,  3 Jul 2023 22:01:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363LiHcl029908; Mon, 3 Jul 2023 22:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ljB1KVebSsPGN7wNBk3bPHPPeM6lXr+P+i19DKZSqww=;
 b=bVVivjApYQjBmLzXyZeKsj/ddft44LQ+R4UcIKb66oRbL+ycP00K23NREVybsXToEEai
 8DAKMysrgZIu7dv1uHHmuVt8ro5XeW8BQSwqcPg/UFk8Gkh1NOK6MSRIgsNoSS0xpTVp
 49CgyVwf22t3swFlbBfC1gRDYeJyYFJcU4F+GbAU5pyOuElprn9AYhsvWquUrvD0Ct5q
 7cB0cRvftC0th7iaJh9oPsFVlm7rsk+BUfnfvMe9hBbC1O4nH79/Ldo/pRAW3h7G8HGb
 16fwwjEQs1NR7C2CJVxS/V0MXzKfEm3lxoWLWxyn/+VwAxTVTTjMcCqOQbsldMFVUhe8 sw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm0060u6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 22:01:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363M1HQ1014305
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 22:01:17 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 15:01:17 -0700
Message-ID: <9188dfda-19ab-536a-540b-a7c7f753f69c@quicinc.com>
Date: Mon, 3 Jul 2023 15:01:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/8] drm/msm/dpu: rework indentation in dpu_core_perf
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MFvUmrGIHkq-g3hJh5nwzOCH-DhVmVDc
X-Proofpoint-GUID: MFvUmrGIHkq-g3hJh5nwzOCH-DhVmVDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_15,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=939 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030201
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> dpu_core_perf.c contains several multi-line conditions which are hard to
> comprehent because of the indentation. Rework the identation of these
> conditions to make it easier to understand them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I think some of the checks were like this due to checkpatch's earlier 
limit being 80 chars.

With that relaxed, this should be fine. Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I am unable to apply this in my branch for some reason but, hope this 
doesnt break checkpatch now :)
