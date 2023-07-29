Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8307682BA
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 01:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8C910E03E;
	Sat, 29 Jul 2023 23:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C09910E03E;
 Sat, 29 Jul 2023 23:45:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36TNevCm011920; Sat, 29 Jul 2023 23:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ts0t/Mnm8P1Xr0k9TThn434FsJrgUvWS7Ix/Wvcf22k=;
 b=Fh2ZW6dU0IOErYZhxnTqRGwsw1CaWe8AZ0jfgjC0QcZIjKQE2isAnvcVttWN5KCy3LwJ
 aAxy/XKKVuKs/7hthZGVLBvHJq9KwwzOX/GC3ENgtnw2TtQAYmj+ge3/wm8imoURIkrc
 cN6hYC1Hz3gb8G7fSL4Y+5cTF7O+xFVt9lhdc2cGQuPnybchvnLmsWEkqDyf4RYr2hln
 +KYmX1/ulO0s/0F/8UaB23A2aIacySR/rCvEujUTq0+SpmvobsO+ejeIK5TLtTzh/CcE
 lGrJwD0hW2PtD3pR3upb7Sg6Y+KO2UoPws+ehdCRwXBVhvIpFs0PRMBkF0EZ/CxowNWC vQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4usrh31c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jul 2023 23:45:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36TNjI6c015791
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jul 2023 23:45:18 GMT
Received: from [10.110.77.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sat, 29 Jul
 2023 16:45:17 -0700
Message-ID: <79ff4dce-1dc3-f142-0372-1b0fffa0904d@quicinc.com>
Date: Sat, 29 Jul 2023 16:45:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/7] drm/msm/dpu: drop BWC features from DPU_MDP_foo
 namespace
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
 <20230728213320.97309-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230728213320.97309-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: t-VMCwMNAv6hsuJs5NgpjwUhAqszpc_5
X-Proofpoint-ORIG-GUID: t-VMCwMNAv6hsuJs5NgpjwUhAqszpc_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=393 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290225
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



On 7/28/2023 2:33 PM, Dmitry Baryshkov wrote:
> The feature bits DPU_MDP_BWC, DPU_MDP_UBWC_1_0, and DPU_MDP_UBWC_1_5 are
> not used by the driver, drop them completely as a followup cleanup.
> 

"as a followup cleanup" is meaning you will do it later. But you are 
doing it in this patch. You can stop at "Drop them completely"

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 7 -------
>   1 file changed, 7 deletions(-)
> 

With that fixed,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

