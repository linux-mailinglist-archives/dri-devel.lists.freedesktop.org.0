Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C20CD15D2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E411210E096;
	Fri, 19 Dec 2025 18:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NdkqlNto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E0C10E096
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 18:31:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E0E011A22F9;
 Fri, 19 Dec 2025 18:31:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A00776071D;
 Fri, 19 Dec 2025 18:31:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AD65102F0BC0; Fri, 19 Dec 2025 19:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766169064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=25PC+Z8r5p3zE+A2ATvPqxVyRWbAfZQmfEOAn40nLD4=;
 b=NdkqlNtoCoNZIUYmvp4ykAC+MGJ3fR/WNx+uMWpiibzwipjZzNhKGm3Ltd8xscNWUi6KKa
 JcFabalxWNsVMF44PW+GYuvqM4E0qvuZxJC1Dd42JlGcG46jbgQZ15qEv++V8MLQbKbyyp
 +ZxQRkj+KmySJeHEwgLU4kJ3FqXBhkaq5baQQ9ZpJx7+TxRQ63cTzw7IUbp6Iaa2zqVVO0
 /zJRwxkdzAjlMVaxbXpoTEXTTHHkAUh6jpIBfU1RrYeDamHOz8rpQYl/6QFSQ6HeGOS/LG
 xe4ND4tt4jX9rtzIT1ydAt5gA/n7aZE81UdhZVz+kemD819dQTPieK/igVRAqQ==
Message-ID: <1abba8b4-4eba-4a38-bb99-33c6181f9ff2@bootlin.com>
Date: Fri, 19 Dec 2025 19:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 16/32] drm/vkms: Introduce config for plane
 format
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
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-16-a49a2d4cba26@bootlin.com>
 <DF2A35683YPN.2TH0WT8JJAJ70@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF2A35683YPN.2TH0WT8JJAJ70@bootlin.com>
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



On 12/19/25 15:55, Luca Ceresoli wrote:
> Hi Louis,
> 
> On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
>> VKMS driver supports all the pixel formats for planes, but for testing it
>> can be useful to only advertise few of them. This new configuration
>> interface will allow configuring the pixel format per planes.
> 
> [...]
> 
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> +int __must_check vkms_config_plane_add_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
>> +{
>> +	bool found = false;
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(vkms_supported_plane_formats); i++) {
>> +		if (vkms_supported_plane_formats[i] == drm_format) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!found)
>> +		return -EINVAL;
>> +	for (unsigned int i = 0; i < plane_cfg->supported_formats_count; i++) {
>> +		if (plane_cfg->supported_formats[i] == drm_format)
>> +			return 0;
>> +	}
>> +	u32 *new_ptr = krealloc_array(plane_cfg->supported_formats,
>> +				      plane_cfg->supported_formats_count + 1,
>> +				      sizeof(*plane_cfg->supported_formats), GFP_KERNEL);
>> +	if (!new_ptr)
>> +		return -ENOMEM;
>> +
>> +	plane_cfg->supported_formats = new_ptr;
>> +	plane_cfg->supported_formats[plane_cfg->supported_formats_count] = drm_format;
>> +	plane_cfg->supported_formats_count++;
>> +
>> +	return 0;
>> +}
> 
> This whole logic appears quite complex for what you need here. I suspect
> using the facilities in linux/bitmap.h would make your code simpler by
> allocating a (multi-)ulong array of
> ARRAY_SIZE(vkms_supported_plane_formats) bits. This would surely use less
> memory and avoid all reallocations, too.

I agree this look complex, but I need an array anyway to interface with 
DRM core. If I use a bitmap, I would have to manage a mapping bit <=> 
fourcc value, which would not be really simpler I think.

I will simplify it a little bit by extracting some helpers for v2:

int __must_check vkms_config_plane_add_format(struct vkms_config_plane 
*plane_cfg, u32 drm_format) {
	if (!supported_format(drm_format))
		return -EINVAL;
	if (already_present(drm_format))
		return 0;
	new_ptr = krealloc
	[...]
}

If this is not sufficient, I will take a look at bitfield next year.

>> --- a/drivers/gpu/drm/vkms/vkms_config.h
>> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> 
>> +/**
>> + * vkms_config_plane_remove_format - Remove a specific format from a plane
>> + * @plane_cfg: Plane to remove the format to
>> + * @drm_format: Format to remove
>> + */
>> +void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg, u32 drm_format);
>> +
>> +/**
>> + * vkms_config_plane_remove_all_formats - Remove all formast from a plane
>                                                          formats
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

