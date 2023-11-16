Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5B7EE922
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 23:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFEC10E709;
	Thu, 16 Nov 2023 22:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77610E6FB;
 Thu, 16 Nov 2023 22:16:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGLmSsC025859; Thu, 16 Nov 2023 22:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=udrlRUhGIWei3ZoxXuZ9bw5IxFgDlm68pfm4u4ibcGo=;
 b=h/GP3dLZb3iqLTDy9PC+NgEl9dWlHsMx2xbAQHduGO64luJdk0eZvOHoGy4tcZSIIuF8
 ty1Ed0sEoqe6BYOx7LAfCKlQ8XiTroSrS6IPsSW6FXzvKSgiTT0Ay6SvjLprfcO/do6J
 b9F72GrtmTOoR6NO5/CmYodjSQJunIcSkUBbd5YOa3JHbAUopOq88lddpMWEc8anzKTI
 Mw0pE+8/MKyIfD3MPY1T6xHnA1qJbXEYK3TXMyxSDCMki4Scid+lN5UqmCYobQpWKCFZ
 SzBVG4EKmO/hLfknKlQePQQc7WGlzptvKg4AhxKHaWp7TMKKDsqeLabJ7btzMs6oftYo fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udkkusage-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 22:15:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGMFtdj018864
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 22:15:55 GMT
Received: from [10.110.71.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 14:15:54 -0800
Message-ID: <c81d2ae7-34e7-a9fe-658a-a73ea14bc0dc@quicinc.com>
Date: Thu, 16 Nov 2023 14:15:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 01/32] drm/drm_mode_object: increase max objects to
 accommodate new color props
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, <amd-gfx@lists.freedesktop.org>, Harry
 Wentland <harry.wentland@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, <sunpeng.li@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>,
 <dri-devel@lists.freedesktop.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
References: <20231116195812.906115-1-mwen@igalia.com>
 <20231116195812.906115-2-mwen@igalia.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231116195812.906115-2-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Wwb2y2oV7h--e4QzZlj9lnxq1VajmCfy
X-Proofpoint-ORIG-GUID: Wwb2y2oV7h--e4QzZlj9lnxq1VajmCfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_23,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160172
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2023 11:57 AM, Melissa Wen wrote:
> DRM_OBJECT_MAX_PROPERTY limits the number of properties to be attached
> and we are increasing that value all time we add a new property (generic
> or driver-specific).
> 
> In this series, we are adding 13 new KMS driver-specific properties for
> AMD color manage:
> - CRTC Gamma enumerated Transfer Function
> - Plane: Degamma LUT+size+TF, HDR multiplier, shaper LUT+size+TF, 3D
>    LUT+size, blend LUT+size+TF (12)
> 
> Therefore, just increase DRM_OBJECT_MAX_PROPERTY to a number (64) that
> accomodates these new properties and gives some room for others,
> avoiding change this number everytime we add a new KMS property.
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Melissa Wen <mwen@igalia.com>


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


> ---
>   include/drm/drm_mode_object.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
> index 912f1e415685..08d7a7f0188f 100644
> --- a/include/drm/drm_mode_object.h
> +++ b/include/drm/drm_mode_object.h
> @@ -60,7 +60,7 @@ struct drm_mode_object {
>   	void (*free_cb)(struct kref *kref);
>   };
>   
> -#define DRM_OBJECT_MAX_PROPERTY 24
> +#define DRM_OBJECT_MAX_PROPERTY 64
>   /**
>    * struct drm_object_properties - property tracking for &drm_mode_object
>    */
