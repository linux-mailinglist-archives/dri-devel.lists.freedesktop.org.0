Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBDC63CED
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D45410E372;
	Mon, 17 Nov 2025 11:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dv8SFzc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5A510E372
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:28:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 520F11A1B5A;
 Mon, 17 Nov 2025 11:28:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 25BAC606B9;
 Mon, 17 Nov 2025 11:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF37510371D28; Mon, 17 Nov 2025 12:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763378917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=o5ZIOrn34xY/reGD4ngIHNFr1Jm3RGPHLJgLLBQrQRg=;
 b=dv8SFzc/QVUsQEE96c9wwkwkBgp1uWNVxbrrLINXBIzKpNWa2TuQD+WLTZq8t0HnaMGHgL
 ln4mQ7RryEzZy/2PHJqYIwzQP9yD7UsmEB/E+wMKlfhbiY/BO/pS6B3QlYkjCSF5ns5E/j
 XBoTiDU2hlM6/pPJ6xsoUzYrMcvJSmQn3DbNH4+HojDzyoHsgKK7xDj9gQzvB2esOaiK2e
 3nJPiDovhGTPslSHgQ8vTbfORNRMkfh6yrhCgVxXgYnhE/vzLj8n6/e2HnKnJqvm+vKX20
 uVWto99gt9AtmGmrVJVsh7oR9JfPxDe5aKXi+si10eduzejqcABKjP+2+mUpmw==
Message-ID: <4eb6d187-e06e-4485-b1d0-6ff3a854be3f@bootlin.com>
Date: Mon, 17 Nov 2025 11:28:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 01/32] drm/drm_mode_config: Add helper to get
 plane type name
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
 <aRXl0jt2_rmXFRUW@fedora>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <aRXl0jt2_rmXFRUW@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 11/13/25 14:06, José Expósito wrote:
> Hey Louis,
> 
> On Wed, Oct 29, 2025 at 03:36:38PM +0100, Louis Chauvet wrote:
>> Create and export an helper to display plane type using the
>> property string. This could be used to display debug
>> information in VKMS.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   drivers/gpu/drm/drm_mode_config.c | 13 +++++++++++++
>>   include/drm/drm_mode_config.h     |  3 +++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 25f376869b3a..1a1a3f43db4d 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -226,6 +226,19 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
>>   	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>>   };
>>   
>> +/**
>> + * drm_get_plane_type_name - return a string for plane name
>> + * @type: plane type to compute name of
> 
> Maybe we could document here what happens when the plane type is
> not valid.
> 
> Returns: The name of the plane type. "(unknown)" if type is not a
> known plane type.

Ack, I will integrate it for v3

> Other than that:
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> 
>> + */
>> +const char *drm_get_plane_type_name(enum drm_plane_type type)
>> +{
>> +	if (type < ARRAY_SIZE(drm_plane_type_enum_list))
>> +		return drm_plane_type_enum_list[type].name;
>> +	else
>> +		return "(unknown)";
>> +}
>> +EXPORT_SYMBOL(drm_get_plane_type_name);
>> +
>>   static int drm_mode_create_standard_properties(struct drm_device *dev)
>>   {
>>   	struct drm_property *prop;
>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
>> index 2e848b816218..89f3dd46178d 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -30,6 +30,7 @@
>>   #include <linux/llist.h>
>>   
>>   #include <drm/drm_modeset_lock.h>
>> +#include <drm/drm_plane.h>
>>   
>>   struct drm_file;
>>   struct drm_device;
>> @@ -983,4 +984,6 @@ static inline int drm_mode_config_init(struct drm_device *dev)
>>   void drm_mode_config_reset(struct drm_device *dev);
>>   void drm_mode_config_cleanup(struct drm_device *dev);
>>   
>> +const char *drm_get_plane_type_name(enum drm_plane_type type);
>> +
>>   #endif
>>
>> -- 
>> 2.51.0
>>

