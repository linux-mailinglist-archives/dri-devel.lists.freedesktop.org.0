Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4D95C0D0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 00:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0EE10EBED;
	Thu, 22 Aug 2024 22:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NXP/gCKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF76210EBE8;
 Thu, 22 Aug 2024 22:24:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M9sd89008705;
 Thu, 22 Aug 2024 22:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 43ZNuD8VGArpbez9Eab7zob+cv8LsGnQFgn6VlWoBNU=; b=NXP/gCKq+IPss3AK
 thrjkRGd1j/iDmpWVCIJNcckSOmLKaSJEP20+GlSNncAFpFXSFAqTsAKP5ENsPRD
 +ColfNn+1C0Igr2vzjEFM1ycshfIxSN93v+1zqor5/eanrihTCqJMIArydwGHIWn
 DM0SnOfCpBw/5qXmT0yQy+kVZdqhW9TCKofe6rb2ykqk9aHhO0AjvWkvBDOtEVM2
 bbi+83j8l2K7EN3EI3aAmhYPfWvRhn5PBVWffmI46jcQXYl1KzRvSzf1v/w35P+Q
 24e9qyJjkSIlw/OXJbGpP1TTZSL2w1XR6JWD+DdLGOWr1XaeZ3waFEED6glZC88S
 7LJ6Ig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415gsd4m0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 22:24:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MMO3Zn019208
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 22:24:03 GMT
Received: from [10.110.91.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 15:24:03 -0700
Message-ID: <731d4e55-2ec7-4878-b14c-60b72d1f7f37@quicinc.com>
Date: Thu, 22 Aug 2024 15:23:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Remove prototypes for non-existing functions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
CC: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>
References: <20240822222046.8686-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240822222046.8686-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2WkY-t4eCAveyGyncTySA1fNR4zxJQsI
X-Proofpoint-ORIG-GUID: 2WkY-t4eCAveyGyncTySA1fNR4zxJQsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_15,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=764 clxscore=1011 lowpriorityscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408220168
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



On 8/22/2024 3:20 PM, Laurent Pinchart wrote:
> The msm_atomic_state_clear() and msm_atomic_state_free() functions are
> declared but never defined. Remove their prototypes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.h | 2 --
>   1 file changed, 2 deletions(-)
> 

Thanks for the patch

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
