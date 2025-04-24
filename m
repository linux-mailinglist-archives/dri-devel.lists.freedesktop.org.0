Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C8A9B47A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 18:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDFA10E461;
	Thu, 24 Apr 2025 16:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aebkVyRe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F9B10E461
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 16:49:53 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B2279CE;
 Thu, 24 Apr 2025 18:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745513386;
 bh=UXHeI1kWPFttuZ2UV7MVyVP0y0OvC/b9BFNK4ZJ9INs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aebkVyRerZeqxElnpU6QKmoVvjfejHJ9aRsAkpbOM0O5bMgpvQ6TD4eOTsJUZErPD
 zASB3y9Q3O70vVtVsdZQP1XihECNXgAxJzPvS9FasKA+Q3wcFjQ75eDjf3/PhPM14A
 QoRDArGmfCy5RiAyzG5KSdjy9jD8KK5rFc0MChRw=
Message-ID: <22eba1dc-8b98-47cd-bdf4-37a75f6aadfc@ideasonboard.com>
Date: Thu, 24 Apr 2025 19:49:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_fourcc: add 10/12bit software decoder YCbCr
 formats
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Christopher Obbard <chris.obbard@collabora.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20250407191314.500601-1-robert.mader@collabora.com>
 <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
 <20250424133130.GD18085@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250424133130.GD18085@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 24/04/2025 16:31, Laurent Pinchart wrote:
> On Thu, Apr 24, 2025 at 02:53:18PM +0200, Robert Mader wrote:
>> Chris, Javier, Laurent - sorry for the noise, but given you reviewed
>> changes in the respective files before, maybe you can help me moving
>> this forward? I'd be very happy for any feedback to get this landed,
>> thanks! :)
> 
> I don't have spare bandwidth at the moment, sorry :-( One comment below
> though.
> 
> Tomi, can you check if there's any overlap with the formats you're
> adding for the Xilinx FPGA drivers ?

No overlap, they are quite different.

>> On 07.04.25 21:13, Robert Mader wrote:
>>> This adds FOURCCs for 10/12bit YCbCr formats used by software decoders
>>> like ffmpeg, dav1d and libvpx. The intended use-case is buffer sharing
>>> between SW-decoders and GPUs by allocating buffers with udmabuf or
>>> dma-heaps, avoiding unnecessary copies or format conversions.
>>>
>>> Unlike formats typically used by hardware decoders these formats
>>> use a LSB alignment. In order to allow fast implementations in GL
>>> and Vulkan the padding must contain only zeros, so the float
>>> representation can calculated by simple multiplicating with 2^6=64

"can be"

>>> or 2^4=16.
> 
> This needs to be documented somewhere.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

>>>
>>> WIP MRs for Mesa, Vulkan and Gstreamer can be found at:
>>>    - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
>>>    - https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
>>>    - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540
>>>
>>> The values where inspired by the corresponding VA_FOURCC_I010, however
>>> suggestions are very welcome.
>>>
>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>> ---
>>>    drivers/gpu/drm/drm_fourcc.c  | 18 ++++++++++++++++++
>>>    include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
>>>    2 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
>>> index 3a94ca211f9c..917f77703645 100644
>>> --- a/drivers/gpu/drm/drm_fourcc.c
>>> +++ b/drivers/gpu/drm/drm_fourcc.c
>>> @@ -346,6 +346,24 @@ const struct drm_format_info *__drm_format_info(u32 format)
>>>    		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
>>>    		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>>>    		  .hsub = 2, .vsub = 2, .is_yuv = true},
>>> +		{ .format = DRM_FORMAT_I010,            .depth = 0,  .num_planes = 3,
>>> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
>>> +		  .hsub = 2, .vsub = 2, .is_yuv = true},
>>> +		{ .format = DRM_FORMAT_I210,            .depth = 0,  .num_planes = 3,
>>> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
>>> +		  .hsub = 2, .vsub = 1, .is_yuv = true},
>>> +		{ .format = DRM_FORMAT_I410,            .depth = 0,  .num_planes = 3,
>>> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
>>> +		  .hsub = 1, .vsub = 1, .is_yuv = true},
>>> +		{ .format = DRM_FORMAT_I012,            .depth = 0,  .num_planes = 3,
>>> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
>>> +		  .hsub = 2, .vsub = 2, .is_yuv = true},
>>> +		{ .format = DRM_FORMAT_I212,            .depth = 0,  .num_planes = 3,
>>> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
>>> +		  .hsub = 2, .vsub = 1, .is_yuv = true},
>>> +		{ .format = DRM_FORMAT_I412,            .depth = 0,  .num_planes = 3,
>>> +		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
>>> +		  .hsub = 1, .vsub = 1, .is_yuv = true},
>>>    	};
>>>    
>>>    	unsigned int i;
>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>>> index e41a3cec6a9e..f22c80031595 100644
>>> --- a/include/uapi/drm/drm_fourcc.h
>>> +++ b/include/uapi/drm/drm_fourcc.h
>>> @@ -397,6 +397,26 @@ extern "C" {
>>>    #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>>>    #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>>>    
>>> +/*
>>> + * 3 plane YCbCr LSB aligned
>>> + * index 0 = Y plane, [15:0] x:Y [6:10] little endian
>>> + * index 1 = Cr plane, [15:0] x:Cr [6:10] little endian
>>> + * index 2 = Cb plane, [15:0] x:Cb [6:10] little endian
>>> + */
>>> +#define DRM_FORMAT_I010	fourcc_code('I', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
>>> +#define DRM_FORMAT_I210	fourcc_code('I', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
>>> +#define DRM_FORMAT_I410	fourcc_code('I', '4', '1', '0') /* non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */
>>> +
>>> +/*
>>> + * 3 plane YCbCr LSB aligned
>>> + * index 0 = Y plane, [15:0] x:Y [4:12] little endian
>>> + * index 1 = Cr plane, [15:0] x:Cr [4:12] little endian
>>> + * index 2 = Cb plane, [15:0] x:Cb [4:12] little endian
>>> + */
>>> +#define DRM_FORMAT_I012	fourcc_code('I', '0', '1', '2') /* 2x2 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
>>> +#define DRM_FORMAT_I212	fourcc_code('I', '2', '1', '2') /* 2x1 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
>>> +#define DRM_FORMAT_I412	fourcc_code('I', '4', '1', '2') /* non-subsampled Cb (1) and Cr (2) planes 12 bits per channel */
>>> +
>>>    
>>>    /*
>>>     * Format Modifiers:
> 

