Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE94692BD1
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 01:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A0210E0A6;
	Sat, 11 Feb 2023 00:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C84010E0A6;
 Sat, 11 Feb 2023 00:13:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31B0CT2M009512; Sat, 11 Feb 2023 00:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xENFj6HB6ark6IN3iEi2OK48ZvVNMg8HurrgPVnyJ4s=;
 b=huAjWcvyElV+ZIEMhxmV4Rs6olNrNB7Dsit+mBK+6vnyKOq+CZVp1xdt7MmXCSf0WauA
 pVLLMAjOM8Ot2YEu0KR6L7bF/hDpcu2fPeSmuJCutMN6UHs8LEBAf88BtWOVjMNtlGR7
 t1/Dj8iMpQcTylbF7GZ3D+cFwpmvhI4YKRc5IUXDoIX59D1RmHMQ4AQAciMMXf8DVQO8
 0060Qn+qmtVswndn2Py7XbB59Z2eiTp/cWRqpYX3NMTKcq6Y3atnCtHnwtVy9q51b5a+
 df0BukFJSK4hLsyOJin/h9u3ufcWua3NScEMKx5jEUi8sMTCIsGDqwrxGroOb2xffnT1 WQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nnrxdrwge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Feb 2023 00:13:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31B0DfjS011769
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Feb 2023 00:13:41 GMT
Received: from [10.110.17.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 10 Feb
 2023 16:13:39 -0800
Message-ID: <f6e228af-430e-1d29-db87-e13c29f31ac0@quicinc.com>
Date: Fri, 10 Feb 2023 16:13:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Y1WTdicAWqHdeX0AoOuiAg_bnQvQQ4ji
X-Proofpoint-ORIG-GUID: Y1WTdicAWqHdeX0AoOuiAg_bnQvQQ4ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_17,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=755 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100209
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/10/2023 6:15 AM, Dmitry Baryshkov wrote:
> The SC8280XP also has a black hole at the top of MDP_TOP region. Set
> corresponding bit to disable access to that region.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Will pick this up for -fixes,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
