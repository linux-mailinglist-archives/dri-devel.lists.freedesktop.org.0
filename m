Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E6510DD9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 03:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13BD10E102;
	Wed, 27 Apr 2022 01:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B279310E102
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 01:22:32 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id l6so97138uar.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=1VUIDvi6mV5fLS87XUBQfx4Us1/5TFXFGhFDSm8yI/8=;
 b=UYm+FDdYNos0tBuEmVO4RpBl2Bt/lo7RkASyMWJwbdjvhuDMDjA+ncoH/sJ1cbji64
 3kFtdvlTYSVe+DqUOY1X4Qeewg5+GE2Yn/dA52WgheE01P23Ru9fSxt8UQkShyaHKOT2
 lJU8U262n5jLOGmZygev+aC++QFUPbT8QdJewTZ1r731XgtaYeKSQ2rp70SdaeHaNRzu
 ZAOqYAGHC6GEjrmEgRG95GQGEWND1bJX9V923bTaR7fUxLw2ju9jrL6yHj3ZawkFYC8/
 GhlqhwJkk9z1l+WyqOigS4wUP4z3Q9sG7riv+vAX4N7HjoTB/VUpKh8ImariEmVAJx+c
 E5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=1VUIDvi6mV5fLS87XUBQfx4Us1/5TFXFGhFDSm8yI/8=;
 b=NfcmtGjcybAeZ5sp/1kllR4N9WHTJKpW/+SAtrZXS6qIEMpLR1FHcOTGsO9yfzCukm
 geFNxEqb6UQ2UDUc0h3gN/9/qAMssjUej5yTCdE+crFIiJLKR7VimObnGduS6kKmixeL
 z9yII8YC4YR3wLjTznBJhIu9Py14VSpLaZkPsCVukOC/sAA4khPRyDHk+1u5sysVcUki
 Ns0Cm0eHcVXsmf8bl7jC5rBj2YAJxbjScrVllslHfYcIATnT0fc4jwuz0uVoSjVbKH5+
 v2eVEKfypKv56U6igA3+9MSX/9hnj9BnP3Dbz/BmGNa9BGQlWa6S0+r7bWLXi0WsqbIe
 LGng==
X-Gm-Message-State: AOAM53297pCdWc88z7vuCzSoopVNvygJu2NuKFlQHzPeIFQIHAetU5Gt
 FXsXyciaizFyWNy5Ot2GvE4=
X-Google-Smtp-Source: ABdhPJxR3FMt2kBuhDbwB/rX70KdivSFMqOjkJBgXbicFxS9CFns+E0ypH3KaIGWZm9Cr/AQwpF/JA==
X-Received: by 2002:a9f:2046:0:b0:35d:bfc:2c9 with SMTP id
 64-20020a9f2046000000b0035d0bfc02c9mr7807572uam.119.1651022551536; 
 Tue, 26 Apr 2022 18:22:31 -0700 (PDT)
Received: from ?IPv6:::1? ([2804:431:c7f5:ffc4:69a6:52a0:9728:241a])
 by smtp.gmail.com with ESMTPSA id
 z4-20020ab03884000000b003616f8111a8sm5354uav.1.2022.04.26.18.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:22:30 -0700 (PDT)
Date: Tue, 26 Apr 2022 22:22:22 -0300
From: Igor Torrente <igormtorrente@gmail.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_6/9=5D_drm=3A_vkms=3A_Refactor_?=
 =?US-ASCII?Q?the_plane_composer_to_accept_new_formats?=
User-Agent: K-9 Mail for Android
In-Reply-To: <5c2a80f5-5107-4fab-4df9-b0be633fd576@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-7-igormtorrente@gmail.com>
 <20220420153628.0a91fcb6@eldfell>
 <6d9acb8b-8b1c-957e-8dd1-1d5ed99b08a6@gmail.com>
 <03105fb1-4f4c-9f8a-f99a-045458ba4e37@gmail.com>
 <20220425111026.485cba66@eldfell>
 <caa885ed-208a-3810-bd3e-e497e2c9ba93@gmail.com>
 <5c2a80f5-5107-4fab-4df9-b0be633fd576@gmail.com>
Message-ID: <4313DC33-E81A-4972-90AD-7B9DD42145B8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On April 26, 2022 10:03:09 PM GMT-03:00, Igor Torrente <igormtorrente@gmai=
l=2Ecom> wrote:
>
>
>On 4/25/22 22:54, Igor Torrente wrote:
>> Hi Pekka,
>>=20
>> On 4/25/22 05:10, Pekka Paalanen wrote:
>>> On Sat, 23 Apr 2022 15:53:20 -0300
>>> Igor Torrente <igormtorrente@gmail=2Ecom> wrote:
>>>=20
>>>> I forgot to respond some points from your review=2E
>>>>=20
>>>> On 4/23/22 13:04, Igor Torrente wrote:
>>>>> Hi Pekka,
>>>>>=20
>>>>> On 4/20/22 09:36, Pekka Paalanen wrote:
>>>>>> On Mon,  4 Apr 2022 17:45:12 -0300
>>>>>> Igor Torrente <igormtorrente@gmail=2Ecom> wrote:
>>>>>>   =20
>>>>>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>>>>>>> as a color input=2E
>>>>>>>=20
>>>>>>> This patch refactors all the functions related to the plane compos=
ition
>>>>>>> to overcome this limitation=2E
>>>>>>>=20
>>>>>>> A new internal format(`struct pixel`) is introduced to deal with a=
ll
>>>>>>=20
>>>>>> Hi,
>>>>>>=20
>>>>>> struct pixel_argb_u16 was added in the previous patch=2E
>>>>>=20
>>>>> I will fix it=2E Thanks!
>>>=20
>>> =2E=2E=2E
>>>=20
>>>>>>> +static int compose_active_planes(struct vkms_writeback_job *activ=
e_wb,
>>>>>>> +				 struct vkms_crtc_state *crtc_state,
>>>>>>> +				 u32 *crc32)
>>>>>>>      {
>>>>>>> +	int line_width, ret =3D 0, pixel_size =3D sizeof(struct pixel_ar=
gb_u16);
>>>>>>> +	struct vkms_frame_info *primary_plane_info =3D NULL;
>>>>>>> +	struct line_buffer output_buffer, stage_buffer;
>>>>>>> +	struct vkms_plane_state *act_plane =3D NULL;
>>>>>>> +	u32 wb_format;
>>>>>>>      +	if (WARN_ON(pixel_size !=3D 8))
>>>>>>=20
>>>>>> Isn't there a compile-time assert macro for this? Having to actuall=
y
>>>>>> run VKMS to check for this reduces the chances of finding it early=
=2E
>>>>>> What's the reason for this check anyway?
>>>>=20
>>>> Yes, it exists=2E
>>>>=20
>>>> include/linux/build_bug=2Eh:1:#define static_assert(expr, =2E=2E=2E)
>>>> __static_assert(expr, ##__VA_ARGS__, #expr)
>>>>=20
>>>> I didn't add it because I can imagine some people very mad if the ker=
nel
>>>> did not compile because of vkms=2E
>>>=20
>>> But that would mean that VKMS is broken on those platforms=2E You'd
>>> better know which platforms VKMS is broken, so the Kconfig can stop
>>> VKMS from being built there at all=2E Or better, fix it before anyone
>>> needs VKMS there=2E
>>=20
>> Right=2E Makes sense=2E I will add it then=2E
>>=20
>>>=20
>>>> This check exists so we can call `crc32_le` for the entire line inste=
ad
>>>> doing it for each channel of each pixel in case `struct `pixel_argb_u=
16`
>>>> had any gap added by the compiler between the struct fields=2E
>>>=20
>>> Oh the CRC computation=2E Good point=2E
>>>=20
>>> Can you add a comment about that with the check?
>>=20
>> Yeah, np=2E
>>=20
>> I will copy the explanation above :)
>>=20
>>>=20
>>>>>>   =20
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	if (crtc_state->num_active_planes >=3D 1) {
>>>>>>> +		act_plane =3D crtc_state->active_planes[0];
>>>>>>> +		if (act_plane->base=2Ebase=2Eplane->type =3D=3D DRM_PLANE_TYPE_=
PRIMARY)
>>>>>>> +			primary_plane_info =3D act_plane->frame_info;
>>>>>>=20
>>>>>> After the next patch, do you even need the primary plane for anythi=
ng
>>>>>> specifically?
>>>>=20
>>>> Yeah, I will not need it anymore=2E
>>>>=20
>>>>>> There is the map_is_null check below, but that should be
>>>>>> done on all planes in the array, right?
>>>>=20
>>>> Yes, I guess so=2E And I don't know why it only checks for the
>>>> primary_plane TBH=2E
>>>=20
>>> Maybe a left-over from times when it didn't have anything but a primar=
y
>>> plane?
>>=20
>> Maybe=2E
>>=20
>> Anyway, I have added this verification to all active planes in the  nex=
t
>> version=2E
>>=20
>>>=20
>>>>>>=20
>>>>>> I suspect the next patch, or another patch in this series, should j=
ust
>>>>>> delete this chunk=2E
>>>> I should, and I will in the V6 of next patch=2E
>>>>=20
>>>>>=20
>>>>>=20
>>>>>    =20
>>>>>>   =20
>>>>>>>      	}
>>>>>>>      +	if (!primary_plane_info)
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>>      	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])=
))
>>>>>>>      		return -EINVAL;
>>>>>>>      +	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>>>>>>> +		return -EINVAL;
>>>>>>>      +	line_width =3D drm_rect_width(&primary_plane_info->dst);
>>>>>>> +	stage_buffer=2En_pixels =3D line_width;
>>>>>>> +	output_buffer=2En_pixels =3D line_width;
>>>>>>>      +	stage_buffer=2Epixels =3D kvmalloc(line_width * pixel_size,=
 GFP_KERNEL);
>>>>>>> +	if (!stage_buffer=2Epixels) {
>>>>>>> +		DRM_ERROR("Cannot allocate memory for the output line buffer");
>>>>>>> +		return -ENOMEM;
>>>>>>> +	}
>>>>>>>      +	output_buffer=2Epixels =3D kvmalloc(line_width * pixel_size=
, GFP_KERNEL);
>>>>>>> +	if (!output_buffer=2Epixels) {
>>>>>>> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer"=
);
>>>>>>> +		ret =3D -ENOMEM;
>>>>>>> +		goto free_stage_buffer;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	if (active_wb) {
>>>>>>> +		struct vkms_frame_info *wb_frame_info =3D &active_wb->frame_inf=
o;
>>>>>>> +
>>>>>>> +		wb_format =3D wb_frame_info->fb->format->format;
>>>>>>=20
>>>>>> I don't see wb_format being used, is it?
>>>>>=20
>>>>> This is probably a leftover from the last versions=2E Thanks for cat=
ching
>>>>> it=2E
>>>>>    =20
>>>>>>   =20
>>>>>>> +		wb_frame_info->src =3D primary_plane_info->src;
>>>>>>> +		wb_frame_info->dst =3D primary_plane_info->dst;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	blend(active_wb, crtc_state, crc32, &stage_buffer,
>>>>>>> +	      &output_buffer, (s64)line_width * pixel_size);
>>>>>>=20
>>>>>> What's the (s64) doing here?
>>>>>>=20
>>>>>> Are byte sizes not usually expressed with size_t or ssize_t types, =
or
>>>>>> is the kernel convention to use u64 and s64?
>>>>>>=20
>>>>>> This makes me suspect that pixel_offset() and friends in vkms_forma=
t=2Ec
>>>>>> are going to need fixing as well=2E int type overflows at 2G=2E
>>>>>=20
>>>>>=20
>>>>> Yeah, I should be using size_t in all these places=2E
>>>>>    =20
>>>>>>   =20
>>>>>>> +
>>>>>>> +	kvfree(output_buffer=2Epixels);
>>>>>>> +free_stage_buffer:
>>>>>>> +	kvfree(stage_buffer=2Epixels);
>>>>>>> +can
>>>>>>> +	return ret;
>>>>>>>      }
>>>>>>>           /**
>>>>>>> @@ -222,13 +204,11 @@ void vkms_composer_worker(struct work_struct=
 *work)
>>>>>>>      						struct vkms_crtc_state,
>>>>>>>      						composer_work);
>>>>>>>      	struct drm_crtc *crtc =3D crtc_state->base=2Ecrtc;
>>>>>>> +	struct vkms_writeback_job *active_wb =3D crtc_state->active_writ=
eback;
>>>>>>>      	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
>>>>>>>      	bool crc_pending, wb_pending;
>>>>>>>      	u64 frame_start, frame_end;
>>>>>>> +	u32 crc32 =3D 0;
>>>>>>>      	int ret;
>>>>>>>           	spin_lock_irq(&out->composer_lock);
>>>>>>> @@ -248,35 +228,19 @@ void vkms_composer_worker(struct work_struct=
 *work)
>>>>>>>      	if (!crc_pending)
>>>>>>>      		return;
>>>>>>>           	if (wb_pending)
>>>>>>> +		ret =3D compose_active_planes(active_wb, crtc_state, &crc32);
>>>>>>> +	else
>>>>>>> +		ret =3D compose_active_planes(NULL, crtc_state, &crc32);
>>>>>>>      +	if (ret)
>>>>>>>      		return;
>>>>>>>           	if (wb_pending) {
>>>>>>>      		drm_writeback_signal_completion(&out->wb_connector, 0);
>>>>>>>      		spin_lock_irq(&out->composer_lock);
>>>>>>>      		crtc_state->wb_pending =3D false;
>>>>>>>      		spin_unlock_irq(&out->composer_lock);
>>>>>>>      	}
>>>>>>>           	/*
>>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats=2Ec b/drivers/gpu/d=
rm/vkms/vkms_formats=2Ec
>>>>>>> new file mode 100644
>>>>>>> index 000000000000=2E=2E931a61405d6a
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats=2Ec
>>>>>>> @@ -0,0 +1,151 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2=2E0+
>>>>>>> +
>>>>>>> +#include <drm/drm_rect=2Eh>
>>>>>>> +#include <linux/minmax=2Eh>
>>>>>>> +
>>>>>>> +#include "vkms_formats=2Eh"
>>>>>>> +
>>>>>>> +static int pixel_offset(const struct vkms_frame_info *frame_info,=
 int x, int y)
>>>>>>> +{
>>>>>>> +	return frame_info->offset + (y * frame_info->pitch)
>>>>>>> +				  + (x * frame_info->cpp);
>>>>>>> +}
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * packed_pixels_addr - Get the pointer to pixel of a given pair =
of coordinates
>>>>>>> + *
>>>>>>> + * @frame_info: Buffer metadata
>>>>>>> + * @x: The x(width) coordinate of the 2D buffer
>>>>>>> + * @y: The y(Heigth) coordinate of the 2D buffercan
>>>>>>> + *
>>>>>>> + * Takes the information stored in the frame_info, a pair of coor=
dinates, and
>>>>>>> + * returns the address of the first color channel=2E
>>>>>>> + * This function assumes the channels are packed together, i=2Ee=
=2E a color channel
>>>>>>> + * comes immediately after another in the memory=2E And therefore=
, this function
>>>>>>> + * doesn't work for YUV with chroma subsampling (e=2Eg=2E YUV420 =
and NV21)=2E
>>>>>>> + */
>>>>>>> +static void *packed_pixels_addr(const struct vkms_frame_info *fra=
me_info,
>>>>>>> +				int x, int y)
>>>>>>> +{
>>>>>>> +	int offset =3D pixel_offset(frame_info, x, y);
>>>>>>> +
>>>>>>> +	return (u8 *)frame_info->map[0]=2Evaddr + offset;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void *get_packed_src_addr(const struct vkms_frame_info *fr=
ame_info, int y)
>>>>>>> +{
>>>>>>> +	int x_src =3D frame_info->src=2Ex1 >> 16;
>>>>>>> +	int y_src =3D y - frame_info->dst=2Ey1 + (frame_info->src=2Ey1 >=
> 16);
>>>>>>> +
>>>>>>> +	return packed_pixels_addr(frame_info, x_src, y_src);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer=
,
>>>>>>> +				 const struct vkms_frame_info *frame_info, int y)
>>>>>>> +{
>>>>>>> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
>>>>>>> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
>>>>>>> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst=
),
>>>>>>> +			       stage_buffer->n_pixels);
>>>>>>> +
>>>>>>> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
>>>>>>> +		/*
>>>>>>> +		 * The 257 is the "conversion ratio"=2E This number is obtained=
 by the
>>>>>>> +		 * (2^16 - 1) / (2^8 - 1) division=2E Which, in this case, trie=
s to get
>>>>>>> +		 * the best color value in a pixel format with more possibiliti=
es=2E
>>>>>>> +		 * A similar idea applies to others RGB color conversions=2E
>>>>>>> +		 */
>>>>>>> +		out_pixels[x]=2Ea =3D (u16)src_pixels[3] * 257;
>>>>>>> +		out_pixels[x]=2Er =3D (u16)src_pixels[2] * 257;
>>>>>>> +		out_pixels[x]=2Eg =3D (u16)src_pixels[1] * 257;
>>>>>>> +		out_pixels[x]=2Eb =3D (u16)src_pixels[0] * 257;
>>>>>>> +	}
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer=
,
>>>>>>> +				 const struct vkms_frame_info *frame_info, int y)
>>>>>>> +{
>>>>>>> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
>>>>>>> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
>>>>>>> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst=
),
>>>>>>> +			       stage_buffer->n_pixels);
>>>>>>> +
>>>>>>> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
>>>>>>> +		out_pixels[x]=2Ea =3D (u16)0xffff;
>>>>>>> +		out_pixels[x]=2Er =3D (u16)src_pixels[2] * 257;
>>>>>>> +		out_pixels[x]=2Eg =3D (u16)src_pixels[1] * 257;
>>>>>>> +		out_pixels[x]=2Eb =3D (u16)src_pixels[0] * 257;
>>>>>>> +	}
>>>>>>> +}
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * The following  functions take an line of argb_u16 pixels from =
the
>>>>>>> + * src_buffer, convert them to a specific format, and store them =
in the
>>>>>>> + * destination=2E
>>>>>>> + *
>>>>>>> + * They are used in the `compose_active_planes` to convert and st=
ore a line
>>>>>>> + * from the src_buffer to the writeback buffer=2E
>>>>>>> + */
>>>>>>> +static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_in=
fo,
>>>>>>> +				 const struct line_buffer *src_buffer, int y)
>>>>>>> +{
>>>>>>> +	int x, x_dst =3D frame_info->dst=2Ex1;
>>>>>>> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
>>>>>>> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
>>>>>>> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
>>>>>>> +			    src_buffer->n_pixels);
>>>>>>> +
>>>>>>> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
>>>>>>> +		/*
>>>>>>> +		 * This sequence below is important because the format's byte o=
rder is
>>>>>>> +		 * in little-endian=2E In the case of the ARGB8888 the memory i=
s
>>>>>>> +		 * organized this way:
>>>>>>> +		 *
>>>>>>> +		 * | Addr     | =3D blue channel
>>>>>>> +		 * | Addr + 1 | =3D green channel
>>>>>>> +		 * | Addr + 2 | =3D Red channel
>>>>>>> +		 * | Addr + 3 | =3D Alpha channel
>>>>>>> +		 */
>>>>>>> +		dst_pixels[3] =3D DIV_ROUND_CLOSEST(in_pixels[x]=2Ea, 257);
>>>>>>> +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x]=2Er, 257);
>>>>>>> +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x]=2Eg, 257);
>>>>>>> +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x]=2Eb, 257);
>>>>>>> +	}
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_in=
fo,
>>>>>>> +				 const struct line_buffer *src_buffer, int y)
>>>>>>> +{
>>>>>>> +	int x, x_dst =3D frame_info->dst=2Ex1;
>>>>>>> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
>>>>>>> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
>>>>>>> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
>>>>>>> +			    src_buffer->n_pixels);
>>>>>>> +
>>>>>>> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
>>>>>>> +		dst_pixels[3] =3D (u8)0xff;
>>>>>>=20
>>>>>> When writing to XRGB, it's not necessary to ensure the X channel ha=
s
>>>>>> any sensible value=2E Anyone reading from XRGB must ignore that val=
ue
>>>>>> anyway=2E So why not write something wacky here, like 0xa1, that is=
 far
>>>>>> enough from both 0x00 or 0xff to not be confused with them even
>>>>>> visually? Also not 0x7f or 0x80 which are close to half of 0xff=2E
>>>>>>=20
>>>>>> Or, you could save a whole function and just use argb_u16_to_ARGBxx=
xx()
>>>>>> instead, even for XRGB destination=2E
>>>>>=20
>>>>>=20
>>>>> Right=2E Maybe I could just leave the channel untouched=2E
>>>=20
>>> Untouched may not be a good idea=2E Leaving anything untouched always =
has
>>> the risk of leaking information through uninitialized memory=2E Maybe =
not
>>> in this case because the destination is allocated by userspace already=
,
>>> but nothing beats being obviously correct=2E
>>=20
>> Makes sense=2E
>>=20
>>>=20
>>> Whatever you decide here, be prepared for it becoming de-facto kernel
>>> UABI, because it is easy for userspace to (accidentally) rely on the
>>> value, no matter what you pick=2E
>>=20
>> I hope to make the right decision then=2E
>
>The de-facto UABI seems to be already in place for {A, X}RGB8888=2E

"Only XRGB_8888

>
>I changed from 0xff to 0xbe and the `writeback-check-output` started to f=
ail=2E
>
>>=20
>>>=20
>>>=20
>>> Thanks,
>>> pq
>>>=20
>>>=20
>>>>>    =20
>>>>>>   =20
>>>>>>> +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x]=2Er, 257);
>>>>>>> +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x]=2Eg, 257);
>>>>>>> +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x]=2Eb, 257);
>>>>>>> +	}
>>>>>>> +}
>>>>>>> +
>>>>>>> +plane_format_transform_func get_plane_fmt_transform_function(u32 =
format)
>>>>>>> +{
>>>>>>> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
>>>>>>> +		return &ARGB8888_to_argb_u16;
>>>>>>> +	else if (format =3D=3D DRM_FORMAT_XRGB8888)
>>>>>>> +		return &XRGB8888_to_argb_u16;
>>>>>>> +	else
>>>>>>> +		return NULL;
>>>>>>=20
>>>>>> This works for now, but when more formats are added, I'd think a sw=
itch
>>>>>> statement would look better=2E
>>>>>=20
>>>>> ok=2E
>>>>>    =20
>>>>>>   =20
>>>>>>> +}
>>>>>>> +
>>>>>>> +wb_format_transform_func get_wb_fmt_transform_function(u32 format=
)
>>>>>>> +{
>>>>>>> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
>>>>>>> +		return &argb_u16_to_ARGB8888;
>>>>>>> +	else if (format =3D=3D DRM_FORMAT_XRGB8888)
>>>>>>> +		return &argb_u16_to_XRGB8888;
>>>>>>> +	else
>>>>>>> +		return NULL;
>>>>>>> +}
