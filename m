Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBEA74BB39
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB03410E63A;
	Sat,  8 Jul 2023 01:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6E510E63A;
 Sat,  8 Jul 2023 01:58:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3681ta4t004076; Sat, 8 Jul 2023 01:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eeUH/nmI79dOUPcJ3kTAppnbqbmbdI0HKLu5luMdeQU=;
 b=ly066dcuTkyieJr7nN3K3uoAXh5jzm5Pzb03a8d3srjYaeNJa+wLwWNmi9v6MJGS4LHD
 alEolXRFinqEIoNIWQY8xEonYaVzOTyniHHZSLutY/ZpvIKlekJ2Hb2cRECSh5NdfAyU
 EDkhI1EjNv7nMDef0w2Pn4qtoo4Is61zRMKdPJJjkFG/pNjzxC/aUt145qhSicEuvv/t
 159BAL7EU+tHv8mVWHppNaXXqkTfz42daKh3KimmgljeyoHw3OMLIRdkA1UDGzGIXTGW
 JwZBnqsHOpF8VBMvN6z7rETeMU+hfY3y0AZefsUgBCVgyIEzD2txS+h1VORi9DSAtGVe 9Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rp96vtu8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Jul 2023 01:58:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3681wWcT005966
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 8 Jul 2023 01:58:32 GMT
Received: from [10.110.118.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 18:58:31 -0700
Message-ID: <bbcf0b87-f41d-e34d-0821-4ad69016131d@quicinc.com>
Date: Fri, 7 Jul 2023 18:58:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 6/6] drm/msm/dpu: Update dev core dump to dump
 registers of sub-blocks
Content-Language: en-US
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
 <20230622-devcoredump_patch-v5-6-67e8b66c4723@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v5-6-67e8b66c4723@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pVFZQNw9QnFT27OSd45KGo_UqMwL-3bS
X-Proofpoint-GUID: pVFZQNw9QnFT27OSd45KGo_UqMwL-3bS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=940
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307080016
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2023 6:24 PM, Ryan McCann wrote:
> Currently, the device core dump mechanism does not dump registers of
> sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
> dpu_kms_mdp_snapshot function to account for sub-blocks.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 66 +++++++++++++++++++++++++++------
>   1 file changed, 54 insertions(+), 12 deletions(-)
> 

Overall, I like this one.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
