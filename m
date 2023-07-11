Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BE74FA12
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 23:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5E710E440;
	Tue, 11 Jul 2023 21:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553DB10E42B;
 Tue, 11 Jul 2023 21:48:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36BLaSHl000918; Tue, 11 Jul 2023 21:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=s+8TfXAPCloCWHz1QvUN7+u6RvdaswZz73hLREaiTmQ=;
 b=CjejtFsIyBRcB4ikaPk3c+KhifFEbluhn9RXSi/Vw/K6aqGtOKnaKMHVzVeZFkEd2SZW
 LlPk6hpcOALbFTZ/P5Ui4MGyZX3IuOCrTE/SlVATeMqbWv8I/1AFHUVTKFGaIiMBacHV
 h0EWwP2LRAlFwdwEC92+6fxk2tfshFBO3qx05fw/s/Fm19V68UzUqmnaNRLeDspTjuhQ
 cHkFT7FtF7CQGW7rffjifhIXNxf8p66dZrimJRf8RpoQhcxrac8jRbOXaynt3Afw8wbR
 P2p2HeNjMc8TYr7p29oCOakqPDMhtWMfM2p0vVHHzCFOTuIqBErKIKNzrx7XV+8skMqW ng== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rseewr3t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 21:48:10 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36BLm8IX015461
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 21:48:08 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 11 Jul
 2023 14:48:08 -0700
Message-ID: <87f5f56e-aa91-da87-b549-0f3a044d54b6@quicinc.com>
Date: Tue, 11 Jul 2023 14:47:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Freedreno] [PATCH RFC v4 1/7] drm: Introduce solid fill DRM
 plane property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
 <20230630112700.53d79343@eldfell>
 <d29645bd-4f60-be6c-9f34-ef6ffc343f44@quicinc.com>
 <20230711104245.2be648a9@eldfell>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230711104245.2be648a9@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7UdpqfyocigKM69Se47s2GREpMXNsjYK
X-Proofpoint-ORIG-GUID: 7UdpqfyocigKM69Se47s2GREpMXNsjYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_12,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307110198
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



On 7/11/2023 12:42 AM, Pekka Paalanen wrote:
> On Mon, 10 Jul 2023 16:12:06 -0700
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
>> On 6/30/2023 1:27 AM, Pekka Paalanen wrote:
>>> On Thu, 29 Jun 2023 17:25:00 -0700
>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>    
>>>> Document and add support for solid_fill property to drm_plane. In
>>>> addition, add support for setting and getting the values for solid_fill.
>>>>
>>>> To enable solid fill planes, userspace must assign a property blob to
>>>> the "solid_fill" plane property containing the following information:
>>>>
>>>> struct drm_solid_fill_info {
>>>> 	u8 version;
>>>> 	u32 r, g, b;
>>>> };
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>
>>> Hi Jessica,
>>>
>>> I've left some general UAPI related comments here.
>>>    
>>>> ---
>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>>>>    drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
>>>>    include/drm/drm_blend.h                   |  1 +
>>>>    include/drm/drm_plane.h                   | 43 ++++++++++++++++++++++++
>>>>    5 files changed, 141 insertions(+)
> 
> ...
> 
>>>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>>>> index 88bdfec3bd88..0338a860b9c8 100644
>>>> --- a/include/drm/drm_blend.h
>>>> +++ b/include/drm/drm_blend.h
>>>> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>>>    			      struct drm_atomic_state *state);
>>>>    int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>>    					 unsigned int supported_modes);
>>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>>>>    #endif
>>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>>> index 51291983ea44..f6ab313cb83e 100644
>>>> --- a/include/drm/drm_plane.h
>>>> +++ b/include/drm/drm_plane.h
>>>> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>>>>    	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>>>>    };
>>>>    
>>>> +/**
>>>> + * struct drm_solid_fill_info - User info for solid fill planes
>>>> + */
>>>> +struct drm_solid_fill_info {
>>>> +	__u8 version;
>>>> +	__u32 r, g, b;
>>>> +};
>>>
>>> Shouldn't UAPI structs be in UAPI headers?
>>
>> Acked, will move this to uapi/drm_mode.h
>>
>>>
>>> Shouldn't UAPI structs use explicit padding to not leave any gaps when
>>> it's unavoidable? And the kernel to check that the gaps are indeed
>>> zeroed?
>>
>> I don't believe so... From my understanding, padding will be taken care
>> of by the compiler by default. Looking at the drm_mode_modeinfo UAPI
>> struct [1], it also doesn't seem to do explicit padding. And the
>> corresponding set_property() code doesn't seem check the gaps either.
>>
>> That being said, it's possible that I'm missing something here, so
>> please let me know if that's the case.
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.5-rc1/source/include/uapi/drm/drm_mode.h#L242
> 
> I suspect that drm_mode_modeinfo predates the lessons learnt about
> "botching up ioctls" by many years:
> https://www.kernel.org/doc/Documentation/ioctl/botching-up-ioctls.rst
> 
> drm_mode_modeinfo goes all the way back to
> 
> commit f453ba0460742ad027ae0c4c7d61e62817b3e7ef
> Date:   Fri Nov 7 14:05:41 2008 -0800
> 
>      DRM: add mode setting support
> 
> and
> 
> commit e0c8463a8b00b467611607df0ff369d062528875
> Date:   Fri Dec 19 14:50:50 2008 +1000
> 
>      drm: sanitise drm modesetting API + remove unused hotplug
> 
> and it got the proper types later in
> 
> commit 1d7f83d5ad6c30b385ba549c1c3a287cc872b7ae
> Date:   Thu Feb 26 00:51:42 2009 +0100
> 
>      make drm headers use strict integer types
> 
> 
> My personal feeling is that if you cannot avoid padding in a struct,
> convert it into explicit fields anyway and require them to be zero.
> That way if you ever need to extend or modify the struct, you already
> have an "unused" field that old userspace guarantees to be zero, so you
> can re-purpose it when it's not zero.
> 
> A struct for blob contents is maybe needing slightly less forward
> planning than ioctl struct, because KMS properties are cheap compared
> to ioctl numbers, I believe.
> 
> Maybe eliminating compiler induced padding in structs is not strictly
> necessary, but it seems like a good idea to me, because compilers are
> allowed to leave the padding bits undefined. If a struct was filled in
> by the kernel and delivered to userspace, undefined padding could even
> be a security leak, theoretically.
> 
> Anyway, don't take my word for it. Maybe kernel devs have a different
> style.

Ah, got it. Thanks for the info! Looking over more recent 
implementations of blob properties, I do see that there's a precedent 
for explicit padding [1].

I think I could also just make `version` a __u32 instead. Either way, 
that seems to be how other structs declare `version`.

Thanks,

Jessica Zhang

[1] 
https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/virtgpu_drm.h#L178

> 
> 
> Thanks,
> pq
> 
>>>
>>> It also needs more UAPI doc, like a link to the property doc that uses
>>> this and an explanation of what the values mean.
>>
>> Acked.
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>
>>> Thanks,
>>> pq
>>>    
>>>> +
>>>> +/**
>>>> + * struct solid_fill_property - RGB values for solid fill plane
>>>> + *
>>>> + * Note: This is the V1 for this feature
>>>> + */
>>>> +struct drm_solid_fill {
>>>> +	uint32_t r;
>>>> +	uint32_t g;
>>>> +	uint32_t b;
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct drm_plane_state - mutable plane state
>>>>     *
>>>> @@ -116,6 +135,23 @@ struct drm_plane_state {
>>>>    	/** @src_h: height of visible portion of plane (in 16.16) */
>>>>    	uint32_t src_h, src_w;
>>>>    
>>>> +	/**
>>>> +	 * @solid_fill_blob:
>>>> +	 *
>>>> +	 * Blob containing relevant information for a solid fill plane
>>>> +	 * including pixel format and data. See
>>>> +	 * drm_plane_create_solid_fill_property() for more details.
>>>> +	 */
>>>> +	struct drm_property_blob *solid_fill_blob;
>>>> +
>>>> +	/**
>>>> +	 * @solid_fill:
>>>> +	 *
>>>> +	 * Pixel data for solid fill planes. See
>>>> +	 * drm_plane_create_solid_fill_property() for more details.
>>>> +	 */
>>>> +	struct drm_solid_fill solid_fill;
>>>> +
>>>>    	/**
>>>>    	 * @alpha:
>>>>    	 * Opacity of the plane with 0 as completely transparent and 0xffff as
>>>> @@ -699,6 +735,13 @@ struct drm_plane {
>>>>    	 */
>>>>    	struct drm_plane_state *state;
>>>>    
>>>> +	/*
>>>> +	 * @solid_fill_property:
>>>> +	 * Optional solid_fill property for this plane. See
>>>> +	 * drm_plane_create_solid_fill_property().
>>>> +	 */
>>>> +	struct drm_property *solid_fill_property;
>>>> +
>>>>    	/**
>>>>    	 * @alpha_property:
>>>>    	 * Optional alpha property for this plane. See
>>>>   
>>>    
> 
