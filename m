Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05180198A
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 02:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF9B10E9AE;
	Sat,  2 Dec 2023 01:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8725910E17E;
 Sat,  2 Dec 2023 01:36:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B21a5fl025609; Sat, 2 Dec 2023 01:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i7I7XGucOF/UMb4FBmMaffU1ye/P+zq9tpWz0KRglKo=;
 b=QaeDmueDWU2YZkGNHJwNdUM4IfnlRC3cC8CUE5LYIH7TIeGd+1LZuu0G/uq5GoBFRI3D
 ypJDCazXlmoxzdUeg3I7WHk4I9JIZ+T8f8YuNLSI3u12IMaDGQ6e9oemKUJFYCIQtM3B
 7OsAVtgq4rA5tCprqDC5/yvYJba1OB64AY+AQuN1AVoytIawRHIdurcnEQKWJ3urSkLF
 R9zRUKMSWm/PIl5mBXU2j1DfN3i9FGsl9mJFZ0Yb+fWXkL7+Iwk0+wlIHV0HJI/9KIBd
 5IfZCmzU4ebp0mQ0NMT5tyT21eIdTrv/Ji4QIsvpdFb+Ggh2KLzHPg7ehI4nXBbVq7Rt Bw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqsveg3t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:36:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B21aKLF024930
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 2 Dec 2023 01:36:20 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 17:36:19 -0800
Message-ID: <47635658-6424-7f95-97e8-0955e262fec1@quicinc.com>
Date: Fri, 1 Dec 2023 17:36:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/17] drm/msm: add arrays listing formats supported by
 MDP4/MDP5 hardware
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
 <20230708010407.3871346-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230708010407.3871346-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: X76Zml2TezpK-Rf_iR-szxfMlBCYk_TI
X-Proofpoint-GUID: X76Zml2TezpK-Rf_iR-szxfMlBCYk_TI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020009
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



On 7/7/2023 6:03 PM, Dmitry Baryshkov wrote:
> MDP4 and MDP5 drivers enumerate supported formats each time the plane is
> created. As the list of supported image formats is constant, create
> corresponding data arrays to be used by MDP4 and MDP5 drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 49 +++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/disp/mdp_kms.h    |  5 +++
>   2 files changed, 52 insertions(+), 2 deletions(-)
> 

After going through the patch series, as commented in patch 17 I am 
totally fine with migrating to drmm-managed APIs but I dont like to 
maintain 3 format arrays.

Can we keep the existing format mechanism to avoid having two more arrays?

> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 025595336f26..ba9abe8b3acc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -81,8 +81,8 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   #define BPC0A 0
>   
>   /*
> - * Note: Keep RGB formats 1st, followed by YUV formats to avoid breaking
> - * mdp_get_rgb_formats()'s implementation.
> + * Note: Keep mdp_rgb_formats and mdp_rgb_yuv_formats in sync when adding
> + * entries to this array.
>    */
>   static const struct mdp_format formats[] = {
>   	/*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt ... */
> @@ -138,6 +138,51 @@ static const struct mdp_format formats[] = {
>   			MDP_PLANE_PLANAR, CHROMA_420, true),
>   };
>   
> +const uint32_t mdp_rgb_formats[] = {
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
> +};
> +
> +size_t mdp_rgb_num_formats = ARRAY_SIZE(mdp_rgb_formats);
> +
> +const uint32_t mdp_rgb_yuv_formats[] = {
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
> +
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_VYUY,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_YUYV,
> +	DRM_FORMAT_YVYU,
> +	DRM_FORMAT_YUV420,
> +	DRM_FORMAT_YVU420,
> +};
> +
> +size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
> +
>   /*
>    * Note:
>    * @rgb_only must be set to true, when requesting
> diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
> index b0286d5d5130..11402a859574 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
> @@ -94,6 +94,11 @@ struct mdp_format {
>   uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
>   const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
>   
> +extern const uint32_t mdp_rgb_formats[];
> +extern size_t mdp_rgb_num_formats;
> +extern const uint32_t mdp_rgb_yuv_formats[];
> +extern size_t mdp_rgb_yuv_num_formats;
> +
>   /* MDP capabilities */
>   #define MDP_CAP_SMP		BIT(0)	/* Shared Memory Pool                 */
>   #define MDP_CAP_DSC		BIT(1)	/* VESA Display Stream Compression    */
