Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7BA7464E1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 23:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DDE10E236;
	Mon,  3 Jul 2023 21:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E060610E236;
 Mon,  3 Jul 2023 21:30:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363LUPVk012337; Mon, 3 Jul 2023 21:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ibtyike+aRH8wHDOPJPc8XmNTEtnNaoV6MdVjRUkDa0=;
 b=IqR5R4zoyhuDRjj3NrlJTFuFNyulqKRg/EFNJ2QgGp3OLmhcO5vxJo7iTTj5NBOLWnFH
 0WFbRzCDOT63vOXltLaER7WIOtB5rs2xPDWlctOwAGQodv/V/NBSFONyey88Hbb9Jj9O
 p8ZCFsvU+hWcBXXIT0iJ2JIlTftPCZABtW5JIqPmxdSyUJheTV8ktwrg6pqlX8lyQPwF
 i1fi61/BKB75kNuBrQPQwZR07sgzQV6qhcyB7BqR75Bjx10MvoqxBtxf9dB7ks2FfP8F
 LZwS+QurHgNEHlPwSS+s+o4AqMGB4pe+AbH6l+gBPKwKkMMncfD92kEuxVuuItyJIcK/ Gg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rky5mgw5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 21:30:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363LUOkZ014071
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 21:30:24 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 14:30:23 -0700
Message-ID: <ac377aae-eaa6-6952-7385-face81558cf1@quicinc.com>
Date: Mon, 3 Jul 2023 14:30:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/8] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FyxKFfPxapYzVIyqfFjDBYXE6wALy6lI
X-Proofpoint-GUID: FyxKFfPxapYzVIyqfFjDBYXE6wALy6lI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_15,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030197
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
> Drop the leftover of bus-client -> interconnect conversion, the enum
> dpu_core_perf_data_bus_id.
> 
> Fixes: cb88482e2570 ("drm/msm/dpu: clean up references of DPU custom bus scaling")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

It seems unused, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Since its just dropping unused enum, will see if I can combine with some 
other more critical fixes into a MR but not one on its own.
