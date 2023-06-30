Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A07441A3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C5210E4D9;
	Fri, 30 Jun 2023 17:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636A410E4D9;
 Fri, 30 Jun 2023 17:55:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35UCsMPZ027478; Fri, 30 Jun 2023 17:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bGI605Yt1acHOhpiHV9hMd/eNOoz9Ob1L6r5EwqcJd0=;
 b=ktMOgEzJKI41XwcxXnfnPymO4Bj+cr/9e24D20egnAru9iPgTzKjF7M56zjE6qv4IiRt
 Bil078oBvU1bWAN3agzYVdNKR/oYA2QH8G35Ayy1W47FhM3yVLeAkeCEnrK4tltY39xW
 QO/X/otHrgbNHbc85mbdx96WUo/SFMhNMuw3zaAewmlT1KqHXz3ZClnt7jDhBUJF3qlu
 O4hRfwg/VR+zG67EwFT6d5O4I/LECY3u09f3PpjgSBYnW9Zy3StpX3wUUKGw2bvJKNKg
 G5+u29jXAc75zSY4O6FWxc8yMnyUyoqUZ2Rf/5q7pIPudx7ZC3NJUBZpTdZ/zhRSDzMn mA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhwutrwhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 17:54:53 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35UHsr4E014727
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 17:54:53 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 30 Jun
 2023 10:54:52 -0700
Message-ID: <d9fa6c9c-d592-658d-404f-47067c70c1e5@quicinc.com>
Date: Fri, 30 Jun 2023 10:54:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC v4 1/7] drm: Introduce solid fill DRM plane property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
 <972b7cc7-77de-e332-ba41-b96c01dc7939@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <972b7cc7-77de-e332-ba41-b96c01dc7939@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NXrrFklbUG3ASfSlULzowNIhZFqjz-QV
X-Proofpoint-GUID: NXrrFklbUG3ASfSlULzowNIhZFqjz-QV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_10,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 bulkscore=0 mlxlogscore=901 lowpriorityscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306300155
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/30/2023 3:33 AM, Dmitry Baryshkov wrote:
> On 30/06/2023 03:25, Jessica Zhang wrote:
>> Document and add support for solid_fill property to drm_plane. In
>> addition, add support for setting and getting the values for solid_fill.
>>
>> To enable solid fill planes, userspace must assign a property blob to
>> the "solid_fill" plane property containing the following information:
>>
>> struct drm_solid_fill_info {
>>     u8 version;
>>     u32 r, g, b;
>> };
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 
>> +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
>>   include/drm/drm_blend.h                   |  1 +
>>   include/drm/drm_plane.h                   | 43 ++++++++++++++++++++++++
>>   5 files changed, 141 insertions(+)
> 
> Also, I think the point which we missed up to now. Could you please add 
> both new properties to dri/N/state debugfs?

Hi Dmitry,

Good catch -- acked.

Thanks,

Jessica Zhang

> 
> -- 
> With best wishes
> Dmitry
> 
