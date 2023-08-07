Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9424772D4D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F0310E374;
	Mon,  7 Aug 2023 17:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7252310E02C;
 Mon,  7 Aug 2023 17:52:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377Hp2m7004859; Mon, 7 Aug 2023 17:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wGnefafxofA/RVQ+OffCzfRbL3qD9TS2E/5iOEgKjVI=;
 b=LhgBwzcz08mzMWy/osBRlzAXy6nsEWKO9+n8kYrBABipg8e+cWE7bAG3RY4phehz7Isj
 BhBE98DxmBSOqj0bISa2+J+0HHBW2PGwZxGnoODiKZd6GlGhn1bXpJOpXsycm0w+dqeR
 /76t/OdySSkgO//LeXQTLsUDI1xp/6z8D8cgm/ovjjp/yvnUvC4ZiwBzDnUB0F5/cqnC
 dIOcNwKxcpRZ6iXv0orajWtLbGF0ZBqcUgFDlL7P4pWfk5y9uwgtH/fI3beDjrua68tz
 +rawpSLbuWUQHkF4w0hFAA0knEskIrB8Fje0uSYsHKnH2pdVQ5suRYoHQra/SGy9Q+6Z IQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3saw0r97qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 17:51:51 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377HpotR027651
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 17:51:50 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 10:51:49 -0700
Message-ID: <71e9cc67-3aed-f1b7-33b7-1bf9faa0d6ae@quicinc.com>
Date: Mon, 7 Aug 2023 10:51:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 01/10] drm: Introduce pixel_source DRM plane
 property
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-1-053dbefa909c@quicinc.com>
 <CA+hFU4ywNbK77Nj+AVkRbgnomyP-YHhP6pKvNhFG-6HXwAY=Yw@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CA+hFU4ywNbK77Nj+AVkRbgnomyP-YHhP6pKvNhFG-6HXwAY=Yw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Q7sAW3KP6Or0ZrdsZP-Lur5ymK01wbPl
X-Proofpoint-ORIG-GUID: Q7sAW3KP6Or0ZrdsZP-Lur5ymK01wbPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_19,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070163
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 ppaalanen@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>, Sean
 Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/4/2023 6:15 AM, Sebastian Wick wrote:
> On Fri, Jul 28, 2023 at 7:03 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Add support for pixel_source property to drm_plane and related
>> documentation. In addition, force pixel_source to
>> DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
>> legacy userspace.
>>
>> This enum property will allow user to specify a pixel source for the
>> plane. Possible pixel sources will be defined in the
>> drm_plane_pixel_source enum.
>>
>> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_NONE and
>> DRM_PLANE_PIXEL_SOURCE_FB with *_PIXEL_SOURCE_FB being the default value.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>   drivers/gpu/drm/drm_blend.c               | 85 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_plane.c               |  3 ++
>>   include/drm/drm_blend.h                   |  2 +
>>   include/drm/drm_plane.h                   | 21 ++++++++
>>   6 files changed, 116 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>> index 784e63d70a42..01638c51ce0a 100644
>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>
>>          plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>          plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>> +       plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>>
>>          if (plane->color_encoding_property) {
>>                  if (!drm_object_property_get_default_value(&plane->base,
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index d867e7f9f2cd..454f980e16c9 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -544,6 +544,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>                  state->src_w = val;
>>          } else if (property == config->prop_src_h) {
>>                  state->src_h = val;
>> +       } else if (property == plane->pixel_source_property) {
>> +               state->pixel_source = val;
>>          } else if (property == plane->alpha_property) {
>>                  state->alpha = val;
>>          } else if (property == plane->blend_mode_property) {
>> @@ -616,6 +618,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>                  *val = state->src_w;
>>          } else if (property == config->prop_src_h) {
>>                  *val = state->src_h;
>> +       } else if (property == plane->pixel_source_property) {
>> +               *val = state->pixel_source;
>>          } else if (property == plane->alpha_property) {
>>                  *val = state->alpha;
>>          } else if (property == plane->blend_mode_property) {
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>> index 6e74de833466..c500310a3d09 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -185,6 +185,21 @@
>>    *              plane does not expose the "alpha" property, then this is
>>    *              assumed to be 1.0
>>    *
>> + * pixel_source:
>> + *     pixel_source is set up with drm_plane_create_pixel_source_property().
>> + *     It is used to toggle the active source of pixel data for the plane.
>> + *     The plane will only display data from the set pixel_source -- any
>> + *     data from other sources will be ignored.
>> + *
>> + *     Possible values:
>> + *
>> + *     "NONE":
>> + *             No active pixel source.
>> + *             Committing with a NONE pixel source will disable the plane.
>> + *
>> + *     "FB":
>> + *             Framebuffer source set by the "FB_ID" property.
>> + *
>>    * Note that all the property extensions described here apply either to the
>>    * plane or the CRTC (e.g. for the background color, which currently is not
>>    * exposed and assumed to be black).
>> @@ -615,3 +630,73 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>          return 0;
>>   }
>>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>> +
>> +/**
>> + * drm_plane_create_pixel_source_property - create a new pixel source property
>> + * @plane: DRM plane
>> + * @extra_sources: Bitmask of additional supported pixel_sources for the driver.
>> + *                DRM_PLANE_PIXEL_SOURCE_FB always be enabled as a supported
>> + *                source.
>> + *
>> + * This creates a new property describing the current source of pixel data for the
>> + * plane. The pixel_source will be initialized as DRM_PLANE_PIXEL_SOURCE_FB by default.
>> + *
>> + * Drivers can set a custom default source by overriding the pixel_source value in
>> + * drm_plane_funcs.reset()
>> + *
>> + * The property is exposed to userspace as an enumeration property called
>> + * "pixel_source" and has the following enumeration values:
>> + *
>> + * "NONE":
>> + *      No active pixel source
>> + *
>> + * "FB":
>> + *     Framebuffer pixel source
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>> +                                          unsigned long extra_sources)
>> +{
>> +       struct drm_device *dev = plane->dev;
>> +       struct drm_property *prop;
>> +       static const struct drm_prop_enum_list enum_list[] = {
>> +               { DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
>> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
>> +       };
>> +       static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB);
>> +       int i;
>> +
>> +       /* FB is supported by default */
>> +       unsigned long supported_sources = extra_sources | BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> 
> The DRM_PLANE_PIXEL_SOURCE_NONE property should also be enabled by
> default and in the valid_source_mask. 

Hi Sebastian,

Acked.


> In a later patch you implement
> the DRM_PLANE_PIXEL_SOURCE_NONE logic in drm core so everyone gets the
> enum value for free. Might want to pull that logic into its own patch
> and move it before this one.

Can you elaborate on this? Are you referring to the "Loosen FB atomic 
checks" patch?

Not sure why it would make sense to loosen the checks before non-FB 
pixel sources are introduced.

Thanks,

Jessica Zhang

> 
>> +
>> +       if (WARN_ON(supported_sources & ~valid_source_mask))
>> +               return -EINVAL;
>> +
>> +       prop = drm_property_create(dev, DRM_MODE_PROP_ENUM | DRM_MODE_PROP_ATOMIC, "pixel_source",
>> +                       hweight32(supported_sources));
>> +
>> +       if (!prop)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(enum_list); i++) {
>> +               int ret;
>> +
>> +               if (!test_bit(enum_list[i].type, &supported_sources))
>> +                       continue;
>> +
>> +               ret = drm_property_add_enum(prop, enum_list[i].type, enum_list[i].name);
>> +               if (ret) {
>> +                       drm_property_destroy(dev, prop);
>> +
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE_FB);
>> +       plane->pixel_source_property = prop;
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 24e7998d1731..f342cf15412b 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -987,6 +987,9 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
>>                  return -ENOENT;
>>          }
>>
>> +       if (plane->state && plane->state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB)
>> +               plane->state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>> +
>>          if (plane_req->fb_id) {
>>                  fb = drm_framebuffer_lookup(dev, file_priv, plane_req->fb_id);
>>                  if (!fb) {
>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>> index 88bdfec3bd88..122bbfbaae33 100644
>> --- a/include/drm/drm_blend.h
>> +++ b/include/drm/drm_blend.h
>> @@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>                                struct drm_atomic_state *state);
>>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>                                           unsigned int supported_modes);
>> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>> +                                          unsigned long extra_sources);
>>   #endif
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 51291983ea44..89508b4dea4a 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -40,6 +40,12 @@ enum drm_scaling_filter {
>>          DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>>   };
>>
>> +enum drm_plane_pixel_source {
>> +       DRM_PLANE_PIXEL_SOURCE_NONE,
>> +       DRM_PLANE_PIXEL_SOURCE_FB,
>> +       DRM_PLANE_PIXEL_SOURCE_MAX
>> +};
>> +
>>   /**
>>    * struct drm_plane_state - mutable plane state
>>    *
>> @@ -116,6 +122,14 @@ struct drm_plane_state {
>>          /** @src_h: height of visible portion of plane (in 16.16) */
>>          uint32_t src_h, src_w;
>>
>> +       /**
>> +        * @pixel_source:
>> +        *
>> +        * Source of pixel information for the plane. See
>> +        * drm_plane_create_pixel_source_property() for more details.
>> +        */
>> +       enum drm_plane_pixel_source pixel_source;
>> +
>>          /**
>>           * @alpha:
>>           * Opacity of the plane with 0 as completely transparent and 0xffff as
>> @@ -699,6 +713,13 @@ struct drm_plane {
>>           */
>>          struct drm_plane_state *state;
>>
>> +       /*
>> +        * @pixel_source_property:
>> +        * Optional pixel_source property for this plane. See
>> +        * drm_plane_create_pixel_source_property().
>> +        */
>> +       struct drm_property *pixel_source_property;
>> +
>>          /**
>>           * @alpha_property:
>>           * Optional alpha property for this plane. See
>>
>> --
>> 2.41.0
>>
> 
