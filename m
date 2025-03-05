Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FFBA50EF9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 23:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C7210E83D;
	Wed,  5 Mar 2025 22:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="I2IJ7WoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E0E10E839;
 Wed,  5 Mar 2025 22:46:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LhohL028207;
 Wed, 5 Mar 2025 22:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /+PSw0qvB/W8fKpy4PMRcWsMSIMOhwf5q/v1ZQL/lrY=; b=I2IJ7WoZF7e9pg5V
 b3FtX6kFLTOcJ1xoa2qMSzBW4A9k74JxcBTTDf6m1xz8EGPciBe378oKDsjD0puQ
 q3g5bNfnK1dNvLXq0SWrMWwu0+VLyh2kITF2vD1VTBTI5FFgEwPz9kFIw138h0Hb
 nxAHsCHG2Sqlr21sdQFjFSALSS4RGXj7Q5JBoYXwtzgPGDrJktK52/4ldKJ5WmaO
 Z0MzSfLZuLebTY03iKWMqDGMsOptcZ/rQipT+OCxvEcqZrP8wH5MkV5WLfdQkMa4
 TrS3y0EjF/hsIP3U8GB19J6vTwFJnbg4mkAB3p1MGLOw/Sx6KsJEcZZz8/WNnn96
 uwsJlg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vex9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Mar 2025 22:46:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525MkOfO014259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Mar 2025 22:46:24 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 14:46:23 -0800
Message-ID: <d0448a8f-8592-4414-9af7-c0ef528c2bb5@quicinc.com>
Date: Wed, 5 Mar 2025 14:46:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: use kernel.org alias
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
CC: <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
 <20250306-update-email-v1-1-9a231571e905@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250306-update-email-v1-1-9a231571e905@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZQEz5YSe_4B5utvCiLHvMgIAZPEQS07t
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c8d441 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=VwQbUJbxAAAA:8
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8 a=7segCkSFUhES_0U3-ikA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: ZQEz5YSe_4B5utvCiLHvMgIAZPEQS07t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_09,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0 mlxlogscore=880
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050175
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



On 3/5/2025 2:44 PM, Dmitry Baryshkov wrote:
> My Linaro email will stop working soon. Use @kernel.org email instead.
> 
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..b3a67e278a839fa14d1329a249ecf4bbec00c26c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7459,7 +7459,7 @@ F:	include/uapi/drm/msm_drm.h
>   DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robdclark@gmail.com>
>   M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
> -M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> 

Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

