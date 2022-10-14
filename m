Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C445FE919
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 08:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DBC10E430;
	Fri, 14 Oct 2022 06:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344BC10E430;
 Fri, 14 Oct 2022 06:50:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E4rGIZ017587;
 Fri, 14 Oct 2022 06:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1aPiuWnwrNRS80PAw+LqPtVsj20pvfMR3mu5w9PJrfI=;
 b=LdLIStacS1+b/6v/P31FL0QO9kh1BB1dYAxGyVbQsgpRCvz6tZZWFMNjEOYlwginW/Ul
 wL94+32CZnSvjqu/SWoYA1dPGZ/HHRqhsUYCqibU5ry52UglCpjMwO48sE/mHzMBWMnD
 6YYeA5ACwL7Xd+wY8UH/H3P2xUc+b/7b9Ey+Pi1w9QRUHxnRDzAOivMUFLnxqqWmSgwL
 msk8IlovYEzNGthpxZ06AXBrBEBsLkcEZcDJ1XPra5vd/ohgQaRTgdGN+I+YQxp+JOuL
 C9PwloGVotMkCXq+h25WKxYr2po/Q4P6k9mPIaypoAxMI6XcVm2BXCgygwoN8RQWQFsj Dg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k6mkdt5e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 06:50:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29E6o8Oq011651
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 06:50:08 GMT
Received: from [10.216.46.129] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 13 Oct
 2022 23:50:04 -0700
Message-ID: <4c0509a3-0bb6-9615-61cb-d9003f8fc168@quicinc.com>
Date: Fri, 14 Oct 2022 12:20:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/3] drm/msm/a6xx: devcore dump fixes
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20221013225520.371226-1-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221013225520.371226-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Kh_dvyycQXOQvD7Ihzp34TLhej_FHZke
X-Proofpoint-ORIG-GUID: Kh_dvyycQXOQvD7Ihzp34TLhej_FHZke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_03,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=951 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140039
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/14/2022 4:25 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> First patch fixes a recently introduced memory corruption, the remaining
> two are cleanups.
>
> Rob Clark (3):
>    drm/msm/a6xx: Fix kvzalloc vs state_kcalloc usage
>    drm/msm/a6xx: Skip snapshotting unused GMU buffers
>    drm/msm/a6xx: Remove state objects from list before freeing
>
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 18 ++++++++++++++++--
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  7 ++++++-
>   2 files changed, 22 insertions(+), 3 deletions(-)
For the entire series:

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil


