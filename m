Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1433C672BCA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 23:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603DC10E866;
	Wed, 18 Jan 2023 22:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA5B10E866;
 Wed, 18 Jan 2023 22:54:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IMosHY014895; Wed, 18 Jan 2023 22:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wZmdRT3g2yWWuS6SqRce31r+eZ+vEGhrd8/7m7lSmNA=;
 b=fUJX7hLDKz1O9BVVHwx9HgNGrvf4F++lxiUXZFKLd/5DKuF3QaWqxCc6H21Jbzbgtv88
 SDbSyuJNJsBM27yWgE6Smw4z9svbLZLTKpWVcWlbSWUKzaJUGU6FrT1Zx3r4IP+U7L2s
 xzQI8OxpeBpnZVqVPXNDJbl3vRhx5LHuAmcX4YLAHUNxZaBNzTGFGAQOTKoz0BboAAm0
 vVqyZ63II2U0tdcvTlawI7D8f7GQPEealAY+hyBN3SCz+35ul1H9a0xjvWNq7HJtGBjS
 CLThJF85FUv9VTFe3B1BWrCLFPwMdZiyocyZaoi9vjJotkoz6guMCCVZFJR75xJVy79h Ng== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6debsmv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 22:53:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30IMrvqX031615
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 22:53:57 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 14:53:56 -0800
Message-ID: <512bf32f-b8d2-91b7-a23c-1905354ff0e9@quicinc.com>
Date: Wed, 18 Jan 2023 14:53:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm
 plane
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, <freedreno@lists.freedesktop.org>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-2-quic_jesszhan@quicinc.com>
 <c380bb1b-6e65-23c4-6e6b-29ce410b6baa@amd.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <c380bb1b-6e65-23c4-6e6b-29ce410b6baa@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Y4AkXQX9vdMUJAtPgN_pf48hKEzoqwHV
X-Proofpoint-ORIG-GUID: Y4AkXQX9vdMUJAtPgN_pf48hKEzoqwHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180190
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, ppaalanen@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch,
 dmitry.baryshkov@linaro.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/18/2023 10:57 AM, Harry Wentland wrote:
> On 1/4/23 18:40, Jessica Zhang wrote:
>> Add support for solid_fill property to drm_plane. In addition, add
>> support for setting and getting the values for solid_fill.
>>
>> solid_fill holds data for supporting solid fill planes. The property
>> accepts an RGB323232 value and the driver data is formatted as such:
>>
>> struct drm_solid_fill {
>> 	u32 r;
>> 	u32 g;
>> 	u32 b;
>> };
> 
> Rather than special-casing this would it make sense to define this
> as a single pixel of a FOURCC property?
> 
> I.e., something like this:
> 
> struct drm_solid_fill_info {
> 	u32 format; /* FOURCC value */
> 	u64 value; /* FOURCC pixel value */
> }
> 
> That removes some ambiguity how the value should be interpreted, i.e.,
> it can be interpreted like a single pixel of the specified FOURCC format.
> 
> It might also make sense to let drivers advertise the supported
> FOURCC formats for solid_fill planes.

Hi Harry,

The initial v1 of this RFC had support for taking in a format and such, 
but it was decided that just supporting RGB323232 would work too.

Here's the original thread discussing it [1], but to summarize, the work 
needed to convert the solid fill color to RGB is trivial (as it's just a 
single pixel of data). In addition, supporting various formats for 
solid_fill would add complexity as we'd have to communicate which 
formats are supported.

[1] 
https://lists.freedesktop.org/archives/dri-devel/2022-November/379148.html

> 
> Is there an implementation for this in a corresponding canonical
> upstream userspace project, to satisfy [1]? If not, what is the plan
> for this? If so, please point to the corresponding patches.

The use case we're trying to support here is the Android HWC SOLID_FILL 
hint [1], though it can also be used to address the Wayland single pixel 
FB protocol [2]. I'm also planning to add an IGT test to show an example 
of end to end usage.

[1] 
https://android.googlesource.com/platform/hardware/interfaces/+/refs/heads/master/graphics/composer/aidl/android/hardware/graphics/composer3/Composition.aidl#52

[2] 
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104

Thanks,

Jessica Zhang

> 
> [1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> Harry
> 
>>
>> To enable solid fill planes, userspace must assigned solid_fill to a
>> property blob containing the following information:
>>
>> struct drm_solid_fill_info {
>> 	u8 version;
>> 	u32 r, g, b;
>> };
>>
>> Changes in V2:
>> - Changed solid_fill property to a property blob (Simon, Dmitry)
>> - Added drm_solid_fill struct (Simon)
>> - Added drm_solid_fill_info struct (Simon)
>>
>> Changes in V3:
>> - Corrected typo in drm_solid_fill struct documentation
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>>   drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>>   drivers/gpu/drm/drm_blend.c               | 17 +++++++
>>   include/drm/drm_blend.h                   |  1 +
>>   include/drm/drm_plane.h                   | 43 +++++++++++++++++
>>   5 files changed, 129 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>> index dfb57217253b..c96fd1f2ad99 100644
>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>> @@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>   	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>   	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>   
>> +	if (plane_state->solid_fill_blob) {
>> +		drm_property_blob_put(plane_state->solid_fill_blob);
>> +		plane_state->solid_fill_blob = NULL;
>> +	}
>> +
>>   	if (plane->color_encoding_property) {
>>   		if (!drm_object_property_get_default_value(&plane->base,
>>   							   plane->color_encoding_property,
>> @@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>>   	if (state->fb)
>>   		drm_framebuffer_get(state->fb);
>>   
>> +	if (state->solid_fill_blob)
>> +		drm_property_blob_get(state->solid_fill_blob);
>> +
>>   	state->fence = NULL;
>>   	state->commit = NULL;
>>   	state->fb_damage_clips = NULL;
>> @@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>>   		drm_crtc_commit_put(state->commit);
>>   
>>   	drm_property_blob_put(state->fb_damage_clips);
>> +	drm_property_blob_put(state->solid_fill_blob);
>>   }
>>   EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>>   
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index c06d0639d552..8a1d2fb7a757 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -316,6 +316,55 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>>   
>> +static void drm_atomic_convert_solid_fill_info(struct drm_solid_fill *out,
>> +		struct drm_solid_fill_info *in)
>> +{
>> +	out->r = in->r;
>> +	out->g = in->g;
>> +	out->b = in->b;
>> +}
>> +
>> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
>> +		struct drm_property_blob *blob)
>> +{
>> +	int ret = 0;
>> +	int blob_version;
>> +
>> +	if (blob == state->solid_fill_blob)
>> +		return 0;
>> +
>> +	drm_property_blob_put(state->solid_fill_blob);
>> +	state->solid_fill_blob = NULL;
>> +
>> +	memset(&state->solid_fill, 0, sizeof(state->solid_fill));
>> +
>> +	if (blob) {
>> +		if (blob->length != sizeof(struct drm_solid_fill_info)) {
>> +			drm_dbg_atomic(state->plane->dev,
>> +					"[PLANE:%d:%s] bad solid fill blob length: %zu\n",
>> +					state->plane->base.id, state->plane->name,
>> +					blob->length);
>> +			return -EINVAL;
>> +		}
>> +
>> +		blob_version = ((struct drm_solid_fill_info *)blob->data)->version;
>> +
>> +		/* Append with more versions if necessary */
>> +		if (blob_version == 1) {
>> +			drm_atomic_convert_solid_fill_info(&state->solid_fill, blob->data);
>> +		} else {
>> +			drm_dbg_atomic(state->plane->dev,
>> +					"[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
>> +					state->plane->base.id, state->plane->name,
>> +					ret);
>> +			return -EINVAL;
>> +		}
>> +		state->solid_fill_blob = drm_property_blob_get(blob);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>>   				   struct drm_crtc *crtc, s32 __user *fence_ptr)
>>   {
>> @@ -544,6 +593,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>   		state->src_w = val;
>>   	} else if (property == config->prop_src_h) {
>>   		state->src_h = val;
>> +	} else if (property == plane->solid_fill_property) {
>> +		struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
>> +
>> +		ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
>> +		drm_property_blob_put(solid_fill);
>> +
>> +		return ret;
>>   	} else if (property == plane->alpha_property) {
>>   		state->alpha = val;
>>   	} else if (property == plane->blend_mode_property) {
>> @@ -616,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>   		*val = state->src_w;
>>   	} else if (property == config->prop_src_h) {
>>   		*val = state->src_h;
>> +	} else if (property == plane->solid_fill_property) {
>> +		*val = state->solid_fill_blob ?
>> +			state->solid_fill_blob->base.id : 0;
>>   	} else if (property == plane->alpha_property) {
>>   		*val = state->alpha;
>>   	} else if (property == plane->blend_mode_property) {
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>> index b4c8cab7158c..17ab645c8309 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -616,3 +616,20 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>> +
>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>> +{
>> +	struct drm_property *prop;
>> +
>> +	prop = drm_property_create(plane->dev,
>> +			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
>> +			"solid_fill", 0);
>> +	if (!prop)
>> +		return -ENOMEM;
>> +
>> +	drm_object_attach_property(&plane->base, prop, 0);
>> +	plane->solid_fill_property = prop;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>> index 88bdfec3bd88..0338a860b9c8 100644
>> --- a/include/drm/drm_blend.h
>> +++ b/include/drm/drm_blend.h
>> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>   			      struct drm_atomic_state *state);
>>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>   					 unsigned int supported_modes);
>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>>   #endif
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 447e664e49d5..3b9da06f358b 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>>   	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>>   };
>>   
>> +/**
>> + * struct drm_solid_fill_info - User info for solid fill planes
>> + */
>> +struct drm_solid_fill_info {
>> +	__u8 version;
>> +	__u32 r, g, b;
>> +};
>> +
>> +/**
>> + * struct solid_fill_property - RGB values for solid fill plane
>> + *
>> + * Note: This is the V1 for this feature
>> + */
>> +struct drm_solid_fill {
>> +	uint32_t r;
>> +	uint32_t g;
>> +	uint32_t b;
>> +};
>> +
>>   /**
>>    * struct drm_plane_state - mutable plane state
>>    *
>> @@ -116,6 +135,23 @@ struct drm_plane_state {
>>   	/** @src_h: height of visible portion of plane (in 16.16) */
>>   	uint32_t src_h, src_w;
>>   
>> +	/**
>> +	 * @solid_fill_blob:
>> +	 *
>> +	 * Blob containing relevant information for a solid fill plane
>> +	 * including pixel format and data. See
>> +	 * drm_plane_create_solid_fill_property() for more details.
>> +	 */
>> +	struct drm_property_blob *solid_fill_blob;
>> +
>> +	/**
>> +	 * @solid_fill:
>> +	 *
>> +	 * Pixel data for solid fill planes. See
>> +	 * drm_plane_create_solid_fill_property() for more details.
>> +	 */
>> +	struct drm_solid_fill solid_fill;
>> +
>>   	/**
>>   	 * @alpha:
>>   	 * Opacity of the plane with 0 as completely transparent and 0xffff as
>> @@ -699,6 +735,13 @@ struct drm_plane {
>>   	 */
>>   	struct drm_plane_state *state;
>>   
>> +	/*
>> +	 * @solid_fill_property:
>> +	 * Optional solid_fill property for this plane. See
>> +	 * drm_plane_create_solid_fill_property().
>> +	 */
>> +	struct drm_property *solid_fill_property;
>> +
>>   	/**
>>   	 * @alpha_property:
>>   	 * Optional alpha property for this plane. See
> 
