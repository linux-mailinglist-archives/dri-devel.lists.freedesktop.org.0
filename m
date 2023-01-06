Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA965F836
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 01:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF2210E0F2;
	Fri,  6 Jan 2023 00:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB8C10E065;
 Fri,  6 Jan 2023 00:38:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305Maj3C017984; Fri, 6 Jan 2023 00:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8MnO5LKnGXyOh3r2gvQJz5eW936KrvN13lmARg/MQlY=;
 b=AZ3ftcxg6kfbrQIBH++dWSQ65X1TadZ2RFaVU9jgfSvHBFFwfSWqbt46gQkkRtLlwM0q
 7fsNtNO+qT6fngcBF6yjOW06vO6cyxruQZe27lVVK/rhhd3LbKT/USCsbAjwWOGrYpph
 2YPM4TXSRIE4t0DAmEip3E7pjt5hXiwm0bb9Pkmn+Q6aYiEMAze42FsYIwBAIDPkw5HP
 l9+heHiIMsmfPneOQ83WCIXdYZD+Jm877PYfFEqc4XfrfIiuJKmiv6LrEmE2LE9ukNUP
 E8h5rM6pBdXAbhkV9vK79rdu647zNSS62MmAOfH9iJeFMLd2t+VpCZ06qWPbvGNMDrqT hw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mx3f30p68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 00:38:11 +0000
Received: from nasanex01b.na.qualcomm.com (corens_vlan604_snip.qualcomm.com
 [10.53.140.1])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3060cA4c028306
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Jan 2023 00:38:10 GMT
Received: from [10.110.20.194] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 5 Jan 2023
 16:38:08 -0800
Message-ID: <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
Date: Thu, 5 Jan 2023 16:37:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0c_L9KDKb3tkV8WUcYv3lnNK0ScRYop7
X-Proofpoint-ORIG-GUID: 0c_L9KDKb3tkV8WUcYv3lnNK0ScRYop7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_13,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060002
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
>> Introduce and add support for a solid_fill property. When the solid_fill
>> property is set, and the framebuffer is set to NULL, memory fetch will be
>> disabled.
>>
>> In addition, loosen the NULL FB checks within the atomic commit callstack
>> to allow a NULL FB when the solid_fill property is set and add FB checks
>> in methods where the FB was previously assumed to be non-NULL.
>>
>> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
>> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
>> callstack to account for a NULL FB in cases where solid_fill is set.
>>
>> Some drivers support hardware that have optimizations for solid fill
>> planes. This series aims to expose these capabilities to userspace as
>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
>> hardware composer HAL) that can be set by apps like the Android Gears
>> app.
>>
>> Userspace can set the solid_fill property to a blob containing the
>> appropriate version number and solid fill color (in RGB323232 format) and
>> setting the framebuffer to NULL.
>>
>> Note: Currently, there's only one version of the solid_fill blob property.
>> However if other drivers want to support a similar feature, but require
>> more than just the solid fill color, they can extend this feature by
>> creating additional versions of the drm_solid_fill struct.
>>
>> Changes in V2:
>> - Dropped SOLID_FILL_FORMAT property (Simon)
>> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
>> - Changed to checks for if solid_fill_blob is set (Dmitry)
>> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>>    (Dmitry)
>> - Removed DPU_PLANE_COLOR_FILL_FLAG
>> - Fixed whitespace and indentation issues (Dmitry)
> 
> Now that this is a blob, I do wonder again whether it's not cleaner to set
> the blob as the FB pointer. Or create some kind other kind of special data
> source objects (because solid fill is by far not the only such thing).
> 
> We'd still end up in special cases like when userspace that doesn't
> understand solid fill tries to read out such a framebuffer, but these
> cases already exist anyway for lack of priviledges.
> 
> So I still think that feels like the more consistent way to integrate this
> feature. Which doesn't mean it has to happen like that, but the
> patches/cover letter should at least explain why we don't do it like this.

Hi Daniel,

IIRC we were facing some issues with this check [1] when trying to set 
FB to a PROP_BLOB instead. Which is why we went with making it a 
separate property instead. Will mention this in the cover letter.

[1] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71

Thanks,

Jessica Zhang

> -Daniel
> 
>>
>> Changes in V3:
>> - Fixed some logic errors in atomic checks (Dmitry)
>> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
>>    methods (Dmitry)
>>
>> Jessica Zhang (3):
>>    drm: Introduce solid fill property for drm plane
>>    drm: Adjust atomic checks for solid fill color
>>    drm/msm/dpu: Use color_fill property for DPU planes
>>
>>   drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
>>   drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
>>   drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
>>   drivers/gpu/drm/drm_blend.c               |  17 +++
>>   drivers/gpu/drm/drm_plane.c               |   8 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
>>   include/drm/drm_atomic_helper.h           |   5 +-
>>   include/drm/drm_blend.h                   |   1 +
>>   include/drm/drm_plane.h                   |  62 ++++++++++
>>   11 files changed, 302 insertions(+), 103 deletions(-)
>>
>> -- 
>> 2.38.1
>>
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
