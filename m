Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBDFCE7359
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 16:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED85810E508;
	Mon, 29 Dec 2025 15:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wrxCxVUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C7710E508
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 15:29:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D90DBC1D721;
 Mon, 29 Dec 2025 15:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5590860725;
 Mon, 29 Dec 2025 15:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 43905102F07F9; Mon, 29 Dec 2025 16:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767022152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ns87cvfZC7osxMy+j8c/24Nq9nnBVV+dSciH/hT+Kcs=;
 b=wrxCxVUL4cgFs6aeHugOjrjcTljG/wmIgkjUmJ3ULnnQbobY/5F+047JCuQ3Eaa4TTlAWD
 X3bBgRczBfQQcms03Rbkse67gbGt5IUDjl1dX3EokmESnwxERpufHmdYn1bullEZJfdFBF
 WBHZ7fkIcizhHSdcQP2r/hbi7PwxpJUQWXJH9Do31+/LVqS7slr+umW7Ob2Ak3VeTev8wJ
 3lEputd3DMlapF0c0E4OxpKR2IEvWIzlInQw9p5mn06mocapUGFafRknKXWGn0ntuMh+X9
 rc9UBH4g3326QbyRZ8yqZ1BaX5JKpLbd5xSpqRHkqpMUwQMz2NpI1qNZV5ejNQ==
Message-ID: <0886f178-1935-4f37-8d0b-48274245f57e@bootlin.com>
Date: Mon, 29 Dec 2025 16:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] drm/vkms: Introduce config for plane format
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-17-ba42dc3fb9ff@bootlin.com>
 <DF5NE3Y8O21F.1KKJWMX9JVXUP@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF5NE3Y8O21F.1KKJWMX9JVXUP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 12/23/25 14:58, Luca Ceresoli wrote:
> On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
>> VKMS driver supports all the pixel formats for planes, but for testing it
>> can be useful to only advertise few of them. This new configuration
>> interface will allow configuring the pixel format per planes.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>> --- a/drivers/gpu/drm/vkms/vkms_config.c
>> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> 
>> +void vkms_config_plane_remove_all_formats(struct vkms_config_plane *plane_cfg)
>> +{
>> +	plane_cfg->supported_formats_count = 0;
> 
> Why not kfree(plane_cfg->supported_formats) too? You will be (re)allocating
> anyway if adding one or all formats later on, so the buffer you're not
> freeing won't be reused anyway.

IIRC realloc reuse the existing allocated buffer if it is big enough to fit the new
size. But I think this is probably an oversight here and I will add the free to clarify the situation :-)

>> +}
>> +
>> +void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
>> +{
>> +	for (unsigned int i = 0; i < plane_cfg->supported_formats_count; i++) {
>> +		if (plane_cfg->supported_formats[i] == drm_format) {
>> +			plane_cfg->supported_formats[i] = plane_cfg->supported_formats[plane_cfg->supported_formats_count - 1];
> 
> I doubt these are less than 100 chars. ;-)

yes, 127, but I don't know how to format it so it is readable.

I tried

plane_cfg->supported_formats[i] =
	plane_cfg->supported_formats[plane_cfg->supported_formats_count - 1];

But the second line is 101 chars...

Checkpatch don't complain if I do:

plane_cfg->supported_formats[i] =
	plane_cfg->supported_formats[
		plane_cfg->supported_formats_count - 1];

or

plane_cfg->supported_formats[i] =
	plane_cfg->supported_formats[plane_cfg->supported_formats_count-
		1];

But that very ugly and not readable...

>> --- a/drivers/gpu/drm/vkms/vkms_config.h
>> +++ b/drivers/gpu/drm/vkms/vkms_config.h
>> @@ -49,6 +49,8 @@ struct vkms_config {
>>    * @supported_color_encodings: Color encodings that this plane will support
>>    * @default_color_range: Default color range that should be used by this plane
>>    * @supported_color_ranges: Color ranges that this plane will support
>> + * @supported_formats: List of supported formats
>> + * @supported_formats_count: Length of @supported_formats
> 
> Nitpick: this description is not adding much. "Number of elements in
> @supported_formats" would be more useful, as it would clarify it's number
> of (4-bytes) elements and not size in bytes.
> 
>> +int __must_check vkms_config_plane_add_format(struct vkms_config_plane *plane_cfg, u32 drm_format);
>> +
>> +/**
>> + * vkms_config_plane_add_all_formats - Helper to quickly add all the supported formats
>> + * @plane_cfg: Plane to add the formats to
>> + *
>> + * Returns: 0 on success, -ENOMEM if array allocation fails, -EINVAL if the format is not supported
>> + * by VKMS
> 
> The "-EINVAL ... VKMS" part of the sentence does not apply here.

True!

>> +/**
>> + * vkms_config_plane_remove_format - Remove a specific format from a plane
>> + * @plane_cfg: Plane to remove the format to
>                                               ^^ from
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

