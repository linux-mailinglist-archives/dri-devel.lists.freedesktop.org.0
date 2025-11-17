Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E93DC63605
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D537F10E31F;
	Mon, 17 Nov 2025 09:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fwsOViIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E9A10E314
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:56:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B34271A1B6A;
 Mon, 17 Nov 2025 09:56:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 853FB606B9;
 Mon, 17 Nov 2025 09:56:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4444610371CF1; Mon, 17 Nov 2025 10:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763373409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=N93QnAOp/+Ulcj05q2iTIq2QyDQKGiHJoy+Qk31s7ww=;
 b=fwsOViIp1XMGYwAG5xJQXLMRhJErZ3J5eLcAnguCtbUhO3mkB5u7gQPxqsEy8zPN5SwRjZ
 9WqFKojzhg1fKVnfpzYrTJ/D0fYE4fsd4CVZgpRoEYlSMI+2T36nJ622YWleEHOoserQn2
 4KhSN/apOtgiOc41CDQTQjxbBJqwd+zFOaqRO6PgtV5D3ffDILx8QGG8yldo29jyg6bjWA
 npsD50KY4H6YN+O9BweLXQa+ujgjz2g/WomI0UeoKT8DI3WlNTf/kqvY0JSwbp5IdacERm
 thSMhPffMD7m0Fxomde08nQzHMliQdDSJR0/y2kdjSOty65/jwKQcWcYTaHevQ==
Message-ID: <f2ee5ce4-418a-4170-9b0f-26bac570e72e@bootlin.com>
Date: Mon, 17 Nov 2025 09:56:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 06/32] drm/vkms: Introduce configfs for plane
 name
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
 <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>
 <aRXpeE2fCRj4uyBY@fedora>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <aRXpeE2fCRj4uyBY@fedora>
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



On 11/13/25 14:21, José Expósito wrote:
> On Wed, Oct 29, 2025 at 03:36:43PM +0100, Louis Chauvet wrote:
>> Planes can have name, create a plane attribute to configure it. Currently
>> plane name is mainly used in logs.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   Documentation/gpu/vkms.rst           |  3 ++-
>>   drivers/gpu/drm/vkms/vkms_configfs.c | 32 ++++++++++++++++++++++++++++++++
>>   2 files changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>> index 3574e01b928d..1fe6e420c963 100644
>> --- a/Documentation/gpu/vkms.rst
>> +++ b/Documentation/gpu/vkms.rst
>> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>>   
>>     sudo mkdir /config/vkms/my-vkms/planes/plane0
>>   
>> -Planes have 1 configurable attribute:
>> +Planes have 2 configurable attributes:
>>   
>>   - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>>     exposed by the "type" property of a plane)
>> +- name: Name of the plane
> 
> I'd like to mention again my comment on limiting the name to a set of
> well-known characters [1].
> 
> The reason is that, in libinput, we had a format string vulnerability
> due to the kernel exposing devices with names containing strings like
> "%s" in the name (CVE-2022-1215):
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/752
> 
> In my opinion, we should avoid surprising user-space too much and allow
> only a set of "safe" characters.
> 
> Maybe I'm too cautious, as this is valid code, but I'd like to bring up
> the discussion again to see if someone else agrees or disagrees.
> 
> [1] https://lore.kernel.org/all/aPtgCUX5kixTh2ua@fedora/

Sorry, I completely forgot to send my mail drafts for your comments... 
It was mainly "Will do for v2" except here:


For me this should not be a kernel concern, when the userspace read a 
file/folder name, it can be anything, so the userspace should do the 
proper sanitization.

For libinput it was "easy" to exploit because unauthenticated users can 
create any device name, but for VKMS, you must already be a 
"privilegied" user (can write to configfs). I don't see the added value 
for a kernel-side limitation, it will be more code for almost no 
security improvement.

If you really think this is important, do you know if the kernel have a 
helper to do this kind of checks? I did not found anything in strings.h 
and I don't want to implement it in VKMS.

>>   Continue by creating one or more CRTCs::
>>   
>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>> index 07ab794e1052..be6c3ba998b9 100644
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>> @@ -322,10 +322,42 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
>>   	return (ssize_t)count;
>>   }
>>   
>> +static ssize_t plane_name_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +	const char *name;
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
>> +
>> +	scoped_guard(mutex, &plane->dev->lock)
>> +		name = vkms_config_plane_get_name(plane->config);
>> +
>> +	return sprintf(page, "%s\n", name);
>> +}
>> +
>> +static ssize_t plane_name_store(struct config_item *item, const char *page,
>> +				size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		if (plane->dev->enabled)
>> +			return -EBUSY;
>> +
>> +		vkms_config_plane_set_name(plane->config, page);
>> +	}
>> +
>> +	return (ssize_t)count;
>> +}
>> +
>>   CONFIGFS_ATTR(plane_, type);
>> +CONFIGFS_ATTR(plane_, name);
>>   
>>   static struct configfs_attribute *plane_item_attrs[] = {
>>   	&plane_attr_type,
>> +	&plane_attr_name,
>>   	NULL,
>>   };
>>   
>>
>> -- 
>> 2.51.0
>>

