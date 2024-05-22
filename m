Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B68CBA25
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 06:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0AC10E262;
	Wed, 22 May 2024 04:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="LHd+Jvjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D788110E262
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 04:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=t/UDeE8Cad8Z+8paF4xeyiMUCLQbywiFVoqScgnFMkI=; b=LHd+JvjxcACKxVQRI0KuWYz9Vb
 +pzdZeRuUVLfFyelr13Y6N/1rxlKO1RFDdy0moMB2rokcFku6/xCxew1rc/1vLS41P5M/1quBHOt2
 cPT6rpi5gnu8WQb69uhI+4c447NsFuALzJjWTn7KDvGDdUzis0fG5/TVR1gK6l4KgDwgJDZqmqJ0s
 79efMjmZhgeyd21rUzfIrb2UHO6u5Ce5YsC58pUY/nqfD7M7fhFj2dbSTxbs14hWR0BKZSKezqIom
 E6QZbYDeLgZfTKWe0vgNzfx4nT130ewYCngfIFBpheoyznMt05e/x6sa1OqYQ5XrJzSogMm8+dJ67
 UhFlxPoQ==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1s9d9L-00000001viv-1P7v; Wed, 22 May 2024 04:00:23 +0000
Message-ID: <6f3380ef-d0c2-45e4-a9f9-af238e2321e8@infradead.org>
Date: Tue, 21 May 2024 21:00:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mode: fix all kernel-doc warnings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240516002652.6674-1-rdunlap@infradead.org>
 <lxwelnavt5cbrqyasdl4jlzig4ib34pf6retwwxxpzyy5l3bap@l5gp2ydqrudy>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <lxwelnavt5cbrqyasdl4jlzig4ib34pf6retwwxxpzyy5l3bap@l5gp2ydqrudy>
Content-Type: text/plain; charset=UTF-8
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

On 5/20/24 3:39 AM, Dmitry Baryshkov wrote:
> On Wed, May 15, 2024 at 05:26:52PM -0700, Randy Dunlap wrote:
>> Add @width and @height descriptions for &struct drm_plane_size_hint
>> along with a reference to more info.
>>
>> Add a short description for &struct drm_mode_closefb.
>>
>> Change 7 macros not to be marked as kernel-doc notation to prevent
>> warnings.
>>
>> Fixes these kernel-doc warnings:
>>
>> drm_mode.h:877: warning: Function parameter or struct member 'width' not described in 'drm_plane_size_hint'
>> drm_mode.h:877: warning: Function parameter or struct member 'height' not described in 'drm_plane_size_hint'
>> drm_mode.h:969: warning: missing initial short description on line:
>>  * DRM_MODE_PAGE_FLIP_EVENT
>> drm_mode.h:977: warning: missing initial short description on line:
>>  * DRM_MODE_PAGE_FLIP_ASYNC
>> drm_mode.h:998: warning: missing initial short description on line:
>>  * DRM_MODE_PAGE_FLIP_FLAGS
>> drm_mode.h:1108: warning: missing initial short description on line:
>>  * DRM_MODE_ATOMIC_TEST_ONLY
>> drm_mode.h:1118: warning: missing initial short description on line:
>>  * DRM_MODE_ATOMIC_NONBLOCK
>> drm_mode.h:1127: warning: missing initial short description on line:
>>  * DRM_MODE_ATOMIC_ALLOW_MODESET
>> drm_mode.h:1149: warning: missing initial short description on line:
>>  * DRM_MODE_ATOMIC_FLAGS
>> drm_mode.h:1358: warning: missing initial short description on line:
>>  * struct drm_mode_closefb
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>
>>  include/uapi/drm/drm_mode.h |   21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff -- a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -867,9 +867,12 @@ struct drm_color_lut {
>>  
>>  /**
>>   * struct drm_plane_size_hint - Plane size hints
>> + * @width: recommended plane width (no scaling)
>> + * @height: recommended plane height (no scaling)
>>   *
>>   * The plane SIZE_HINTS property blob contains an
>> - * array of struct drm_plane_size_hint.
>> + * array of struct drm_plane_size_hint as described in
>> + * "DOC: standard plane properties".
>>   */
>>  struct drm_plane_size_hint {
>>  	__u16 width;
>> @@ -962,7 +965,7 @@ struct hdr_output_metadata {
>>  	};
>>  };
>>  
>> -/**
>> +/*
>>   * DRM_MODE_PAGE_FLIP_EVENT
> 
> What about convering to the proper kerneldoc instead of dropping the
> kerneldoc part?

If someone with knowledge of these macros can provide the text that should
be there, I can add that info.

>>   *
>>   * Request that the kernel sends back a vblank event (see
>> @@ -970,7 +973,7 @@ struct hdr_output_metadata {
>>   * page-flip is done.
>>   */
>>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>> -/**
>> +/*
>>   * DRM_MODE_PAGE_FLIP_ASYNC
>>   *
>>   * Request that the page-flip is performed as soon as possible, ie. with no
>> @@ -991,7 +994,7 @@ struct hdr_output_metadata {
>>  #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
>>  #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
>>  				   DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
>> -/**
>> +/*
>>   * DRM_MODE_PAGE_FLIP_FLAGS
>>   *
>>   * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
>> @@ -1101,7 +1104,7 @@ struct drm_mode_destroy_dumb {
>>  	__u32 handle;
>>  };
>>  
>> -/**
>> +/*
>>   * DRM_MODE_ATOMIC_TEST_ONLY
>>   *
>>   * Do not apply the atomic commit, instead check whether the hardware supports
>> @@ -1111,7 +1114,7 @@ struct drm_mode_destroy_dumb {
>>   * commits.
>>   */
>>  #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
>> -/**
>> +/*
>>   * DRM_MODE_ATOMIC_NONBLOCK
>>   *
>>   * Do not block while applying the atomic commit. The &DRM_IOCTL_MODE_ATOMIC
>> @@ -1120,7 +1123,7 @@ struct drm_mode_destroy_dumb {
>>   * applied before retuning.
>>   */
>>  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
>> -/**
>> +/*
>>   * DRM_MODE_ATOMIC_ALLOW_MODESET
>>   *
>>   * Allow the update to result in temporary or transient visible artifacts while
>> @@ -1142,7 +1145,7 @@ struct drm_mode_destroy_dumb {
>>   */
>>  #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
>>  
>> -/**
>> +/*
>>   * DRM_MODE_ATOMIC_FLAGS
>>   *
>>   * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
>> @@ -1352,7 +1355,7 @@ struct drm_mode_rect {
>>  };
>>  
>>  /**
>> - * struct drm_mode_closefb
>> + * struct drm_mode_closefb - ioctl struct to close a framebuffer
>>   * @fb_id: Framebuffer ID.
>>   * @pad: Must be zero.
>>   */
> 

Thanks.
-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
