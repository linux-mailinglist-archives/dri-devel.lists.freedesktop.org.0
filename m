Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6670A298
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 00:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B975910E071;
	Fri, 19 May 2023 22:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEBE10E071;
 Fri, 19 May 2023 22:01:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JLvbYi032293; Fri, 19 May 2023 22:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2M8Qy/bGAgxLNT+04Owjjr5jUyJqYgJChjPSDnOvG3U=;
 b=nq13IB1crg9fM9BXi3478aY8LGzKVxkL+XIFOyVUoTphnKIGlWauVLoxHGcDNsRpRAfD
 MDvgFKB7uFsigADdgVxsDxsnOqYnvwEV7jTjwlIZCXLw8iwUgkj13uwxGisqy83K38tB
 5JV2wj8DLlezMGb5LX0lStdV738874vagDRXmy/4prcycXhfxrbyrtpMsc0REJBTUVCx
 kxtDpOfa8AlwWhRScdTV/txOACcDco0H/bex7V3c6bS2d75Bwri5FG5XDVbs5UwqE8pq
 4Y+84uOFYm0b28iKMdOZF+R6DPpm/l1s7pWIrxkHCIopJQBbZiO5OnfKWz8al0VkA9mS mQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qpad1h8nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 22:00:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JM0qlm007656
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 22:00:52 GMT
Received: from [10.110.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 15:00:51 -0700
Message-ID: <56ac76e8-e5ac-3712-1e07-ad6c5b96c77c@quicinc.com>
Date: Fri, 19 May 2023 15:00:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dpu: Set DPU_DATA_HCTL_EN for in
 INTF_SC7180_MASK
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Kalyan Thota" <quic_kalyant@quicinc.com>,
 Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, Krishna Manikandan
 <quic_mkrishn@quicinc.com>
References: <20230508-topic-hctl_en-v2-1-e7bea9f1f5dd@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230508-topic-hctl_en-v2-1-e7bea9f1f5dd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dlWzTMD1K9sgige-225FzMntVgVNF14M
X-Proofpoint-ORIG-GUID: dlWzTMD1K9sgige-225FzMntVgVNF14M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 spamscore=0 mlxlogscore=736 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190190
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Marijn
 Suijten <marijn.suijten@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/19/2023 11:49 AM, Konrad Dybcio wrote:
> DPU5 and newer targets enable this unconditionally. Move it from the
> SC7280 mask to the SC7180 one.
> 

You mean DPU 5.0.0 right?

> Fixes: 7e6ee55320f0 ("drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

I have cross-checked all the chipsets affected by this and confirmed 
DATA_HCTL is present and those 3 registers programmed with that feature 
bit are valid, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

