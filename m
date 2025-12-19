Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30E8CD1004
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 17:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A40410E004;
	Fri, 19 Dec 2025 16:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G/hmILSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4CB10E004
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:55:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 478AEC1B20B;
 Fri, 19 Dec 2025 16:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EFF8A6071D;
 Fri, 19 Dec 2025 16:55:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5ED6110AA95A8; Fri, 19 Dec 2025 17:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766163314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=4nHU9XmgDwXcH4eBRcNAYGOBdRZWdKYOayQoIo8y2/c=;
 b=G/hmILSXfOSizlvwNV+mhGwYT6j/GEdeSgbN0mavlCeuX2rmz35vPM+n67rk7YHCIGxolW
 vNsvH3n0S9wiklZa7tsYwYUQtLnZZnaGpyX60QmpygCCbDiBQuWe17tYIPCXdTbHc0vdc2
 yC6B2U+Zxx+4HIoYRmr9LslNGPHwfGOScgFgT8fZNFvgbwW6zaWN+yD80cBp7qz2F94DX0
 nqN77i0HCpVa8I+X8t7T3fA9ZC9UWbrIFTO/PkqoGlCLYzpmD2c2r+2iDlnkT3roYzgH2q
 VqSN+tTh8K6fT8tH0vjrBGavnUxcYNfGsAWWjCTuCESBod128p8Gh520YB2Hlg==
Message-ID: <5eeedbf9-7ca0-4e5b-9db0-616866af4ac8@bootlin.com>
Date: Fri, 19 Dec 2025 17:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 15/32] drm/vkms: Introduce configfs for plane
 color range
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
 <20251029-vkms-all-config-v2-15-a49a2d4cba26@bootlin.com>
 <DF1JETBGEUFA.EK2SDN9BJMB6@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF1JETBGEUFA.EK2SDN9BJMB6@bootlin.com>
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



On 12/18/25 19:00, Luca Ceresoli wrote:
> On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
>> To allows the userspace to test many hardware configuration, introduce a
>> new interface to configure the available color ranges per planes. VKMS
>> supports multiple color ranges, so the userspace can choose any
>> combination.
>>
>> The supported color ranges are configured by writing a color range bitmask
>> to the file `supported_color_ranges` and the default color range is
>> chosen by writing a color encoding bitmask to `default_color_range`.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>> index ee2e8d141f9e..3f658dd41272 100644
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>> @@ -439,6 +439,91 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
>>   	return count;
>>   }
>>
>> +static ssize_t plane_supported_color_ranges_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +	unsigned int supported_color_range;
>                       supported_color_ranges
> 
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
> 
> As for previous patches, set this on declaration for consistency (same below).
> 
>> +static ssize_t plane_supported_color_ranges_store(struct config_item *item,
>> +						  const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>> +	int ret, val = 0;
>> +
>> +	ret = kstrtouint(page, 10, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Should be a supported value */
>> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
>> +		return -EINVAL;
>> +	/* Should at least provide one color range */
>> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
>> +		return -EINVAL;
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		/* Ensures that the default rotation is included in supported rotation */
> 
> Oh no, that comment again! :-)
> 
>> +static ssize_t plane_default_color_range_store(struct config_item *item,
>> +					       const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>> +	int ret, val = 0;
>> +
>> +	ret = kstrtouint(page, 10, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Should be a supported value */
>> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
>> +		return -EINVAL;
>> +	/* Should at least provide one color range */
>> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
>> +		return -EINVAL;
> 
> As in patch 12, replace this with is_power_of_2() to check that exactly one
> bit is set.

And as the previous patch, this code is simply wrong...
I shoud check if val is one of DRM_COLOR_YCBCR_LIMITED_RANGE / 
DRM_COLOR_YCBCR_FULL_RANGE

Thanks

> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

