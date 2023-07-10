Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F16774E215
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 01:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B90E10E0C6;
	Mon, 10 Jul 2023 23:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1353710E0C6;
 Mon, 10 Jul 2023 23:12:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36AN1MiH009577; Mon, 10 Jul 2023 23:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=v8jJvX9Ik4O3IoBb/PgeQpq7Wx68EcN3jLBfQ92IfMw=;
 b=De3YcsEhWtAH+/F2OVC0pdkB92vGwnEZXKO69OVHScrpsh12FPRSlo7s8cHoBTHfCleQ
 TVRQjAfzSSPeStLKYRI+ndH76/5QvHNoZRUwVA70d/DQfjdZ++jUWLZrN3pexwI2byOh
 rpVygDEvOawEqP6531Du83e/I2usMrKYqIX/UmIF+rdnMUfgRti2VyXMkfRgHRZz34qN
 KpYqUetuZUoCMsfElAWPYIqw8sZbTtMZ+t1P/soXs+Ibbs0+YTUYXbwfaqNaRW8GGlu/
 h0Qn3w2VL4045iTZqWPDlc83SShWwsis625sXtZ6GIF7zClQpdoLaYztJGhNqjSrZk7X 8w== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rrg5mhpfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 23:12:08 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36ANC6ZE020878
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 23:12:06 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 10 Jul
 2023 16:12:06 -0700
Message-ID: <d29645bd-4f60-be6c-9f34-ef6ffc343f44@quicinc.com>
Date: Mon, 10 Jul 2023 16:12:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [Freedreno] [PATCH RFC v4 1/7] drm: Introduce solid fill DRM
 plane property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
 <20230630112700.53d79343@eldfell>
Content-Language: en-US
In-Reply-To: <20230630112700.53d79343@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fbmOdsZ29nbaNCZNzqQe3NlUuL3BIFZR
X-Proofpoint-ORIG-GUID: fbmOdsZ29nbaNCZNzqQe3NlUuL3BIFZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100210
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
Cc: freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, Sean
 Paul <sean@poorly.run>, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/30/2023 1:27 AM, Pekka Paalanen wrote:
> On Thu, 29 Jun 2023 17:25:00 -0700
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
>> Document and add support for solid_fill property to drm_plane. In
>> addition, add support for setting and getting the values for solid_fill.
>>
>> To enable solid fill planes, userspace must assign a property blob to
>> the "solid_fill" plane property containing the following information:
>>
>> struct drm_solid_fill_info {
>> 	u8 version;
>> 	u32 r, g, b;
>> };
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Hi Jessica,
> 
> I've left some general UAPI related comments here.
> 
>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
>>   include/drm/drm_blend.h                   |  1 +
>>   include/drm/drm_plane.h                   | 43 ++++++++++++++++++++++++
>>   5 files changed, 141 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>> index 784e63d70a42..fe14be2bd2b2 100644
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
>> index d867e7f9f2cd..a28b4ee79444 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -316,6 +316,51 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>>   
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
> 
> Is it ok to destroy old state before it is guaranteed that the new
> state is accepted?

Hi Pekka,

Good point. I'll change this behavior so that an error case will keep 
the old solid_fill_blob value.

> 
>> +
>> +	memset(&state->solid_fill, 0, sizeof(state->solid_fill));
>> +
>> +	if (blob) {
>> +		struct drm_solid_fill_info *user_info = (struct drm_solid_fill_info *)blob->data;
>> +
>> +		if (blob->length != sizeof(struct drm_solid_fill_info)) {
>> +			drm_dbg_atomic(state->plane->dev,
>> +				       "[PLANE:%d:%s] bad solid fill blob length: %zu\n",
>> +				       state->plane->base.id, state->plane->name,
>> +				       blob->length);
>> +			return -EINVAL;
>> +		}
>> +
>> +		blob_version = user_info->version;
>> +
>> +		/* Add more versions if necessary */
>> +		if (blob_version == 1) {
>> +			state->solid_fill.r = user_info->r;
>> +			state->solid_fill.g = user_info->g;
>> +			state->solid_fill.b = user_info->b;
>> +		} else {
>> +			drm_dbg_atomic(state->plane->dev,
>> +				       "[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
>> +				       state->plane->base.id, state->plane->name,
>> +				       ret);
>> +			return -EINVAL;
> 
> Btw. how does the atomic check machinery work here?
> 
> I expect that a TEST_ONLY atomic commit will do all the above checks
> and return failure if anything is not right. Right?

Correct, drm_atomic_set_property() will still be called for a TEST_ONLY 
commit, so these checks will still happen and return an error (or set 
the property) when appropriate.

> 
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
>> @@ -544,6 +589,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
>> @@ -616,6 +668,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
>> index 6e74de833466..38c3c5d6453a 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -185,6 +185,10 @@
>>    *		 plane does not expose the "alpha" property, then this is
>>    *		 assumed to be 1.0
>>    *
>> + * solid_fill:
>> + *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
>> + *	contains pixel data that drivers can use to fill a plane.
> 
> This is a nice start, but I feel it needs to explain much more about
> how userspace should go about making use of this.
> 
> Yeah, the pixel_source property comes in the next patch, but I feel
> that it is harder to review if the doc is built over multiple patches.
> My personal approach would be to write the doc in full and referring to
> pixel_source property already, and explain in the commit message that
> the next patch will add pixel_source so people don't wonder about
> referring to a non-existing property.
> 
> I mean just a reference to pixel_source, and leave the actual
> pixel_source doc for the patch adding the property like it already is.
> 
> Dmitry's suggestion of swapping the patch order is good too.

Makes sense. I'll switch the patch order, but will keep this in mind.

> 
>> + *
>>    * Note that all the property extensions described here apply either to the
>>    * plane or the CRTC (e.g. for the background color, which currently is not
>>    * exposed and assumed to be black).
>> @@ -615,3 +619,32 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>> +
>> +/**
>> + * drm_plane_create_solid_fill_property - create a new solid_fill property
>> + * @plane: drm plane
>> + *
>> + * This creates a new property that holds pixel data for solid fill planes. This
>> + * property is exposed to userspace as a property blob called "solid_fill".
>> + *
>> + * For information on what the blob contains, see `drm_solid_fill_info`.
> 
> I think you should be more explicit here. For example: the blob must
> contain exactly one struct drm_solid_fill_info.
> 
> It's better to put this content spec with the UAPI doc rather than in this
> kerner-internal function doc that userspace programmers won't know to
> look at.

Acked.

> 
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
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
>> index 51291983ea44..f6ab313cb83e 100644
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
> 
> Shouldn't UAPI structs be in UAPI headers?

Acked, will move this to uapi/drm_mode.h

> 
> Shouldn't UAPI structs use explicit padding to not leave any gaps when
> it's unavoidable? And the kernel to check that the gaps are indeed
> zeroed?

I don't believe so... From my understanding, padding will be taken care 
of by the compiler by default. Looking at the drm_mode_modeinfo UAPI 
struct [1], it also doesn't seem to do explicit padding. And the 
corresponding set_property() code doesn't seem check the gaps either.

That being said, it's possible that I'm missing something here, so 
please let me know if that's the case.

[1] 
https://elixir.bootlin.com/linux/v6.5-rc1/source/include/uapi/drm/drm_mode.h#L242

> 
> It also needs more UAPI doc, like a link to the property doc that uses
> this and an explanation of what the values mean.

Acked.

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
> 
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
>>
> 
