Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EACFA4BC62
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF3810E3C4;
	Mon,  3 Mar 2025 10:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bE0bV/gs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5673210E3C1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:34:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5A1243191;
 Mon,  3 Mar 2025 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740998091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IUSI0WcDK8FSslF87VpE4rMWh/20O7wwdKjSWR62U8E=;
 b=bE0bV/gsW+jVpACEJsol793OrYmAZ3BGfJXtRW5l4PeBJTX6V4YIxu4lut8XqH2BP8oukY
 AqOl3HUX0VYoJxgWOkUV1K/8L8hPwBu1JtIrtlTZpVyGKYqT820/JB1LgNlRbpKsdrVBdq
 yP7n0vblXJslMIZ3MNKDky1EiEjU2iSaSnq/QmjqqRLHrKutArLJmhHDFXUlUitALrgtwR
 LKCox7FFyYh85gdOvo2HhPwB+S3w5sr2XWP3HqgIAQNiyq37GEbC+w52npWERq/8Fu8CdH
 Byv6Gnkhlyn7fzLquY+w762clkyn33556dTqKK+jdFevlDv0k4gwZWPHlUHIYw==
Message-ID: <e813ac5b-298c-4863-b0b6-e9ac7fec1da0@bootlin.com>
Date: Mon, 3 Mar 2025 11:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/vkms: Allow to configure multiple planes via
 configfs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
 <20250225175936.7223-4-jose.exposito89@gmail.com>
 <52bc3f15-28da-4b40-917f-981f1f10d9b8@bootlin.com> <Z8VtPMzuZOYqjraQ@fedora>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <Z8VtPMzuZOYqjraQ@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeegjeeguddtkefhfffggeduuedttefgueevgeetfedttdefveeufffgvefgveeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgto
 hhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 03/03/2025 à 09:50, José Expósito a écrit :
> Hi Louis,
> 
> On Fri, Feb 28, 2025 at 03:43:25PM +0100, Louis Chauvet wrote:
>>
>>
>> Le 25/02/2025 à 18:59, José Expósito a écrit :
>>> Create a default subgroup at /config/vkms/planes to allow to create as
>>> many planes as required.
>>>
>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>> [...]
>>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>>> index 92512d52ddae..4f9d3341e6c0 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>>> [...]
>>> +static void plane_release(struct config_item *item)
>>> +{
>>> +	struct vkms_configfs_plane *plane;
>>> +	struct mutex *lock;
>>> +
>>> +	plane = plane_item_to_vkms_configfs_plane(item);
>>> +	lock = &plane->dev->lock;
>>> +
>>> +	guard(mutex)(lock);
>>> +	vkms_config_destroy_plane(plane->config);
>>> +	kfree(plane);
>>> +}
>>
>> I just found a flaw in our work: there is currently no way to forbid the
>> deletion of item/symlinks...
>>
>> If you do:
>>
>> modprobe vkms
>> cd /sys/kernel/config/vkms/
>> mkdir DEV
>> mkdir DEV/connectors/CON
>> mkdir DEV/planes/PLA
>> mkdir DEV/crtcs/CRT
>> mkdir DEV/encoders/ENC
>> ln -s DEV/crtcs/CRT DEV/planes/PLA/possible_crtcs/
>> ln -s DEV/crtcs/CRT DEV/encoders/ENC/possible_crtcs
>> ln -s DEV/encoders/ENC DEV/connectors/CON/possible_encoders
>> echo 1 > DEV/planes/PLA/type
>> tree
>> echo 1 > DEV/enabled
>> modetest -M vkms
>> => everything fine
>>
>> rm DEV/connectors/CON/possible_encoders/ENC
>> rmdir DEV/connectors/CON
>> modetest -M vkms
>> => BUG: KASAN: slab-use-after-free
>>
>>
>> I see two solutions:
>> - we don't care and keep as is: if the device is enabled, and you delete
>> link/groups, it is your fault. As shown above: it can crash the kernel, so
>> it is a no-go.
> 
> I was aware of this limitation and, since the configfs is clear about
> deleting items: [1]
> 
>      Important:
>      drop_item() is void, and as such cannot fail. When rmdir(2) is called,
>      configfs WILL remove the item from the filesystem tree (assuming that
>      it has no children to keep it busy).
>      The subsystem is responsible for responding to this. [...]

Thanks for pointing out. I read it and I think you're right, they 
clearly want the user space to be able to delete any item at any time.

> I decided to follow this approach, i.e., allowing the user to delete the items.

I think a simple fix would be to have something like that:

int device_enabled_store(...) {
	if enabled == True:
		for item in configfs_items:
			configfs_get_item(item);
		vkms_device_enable(...)
	else:
		vkms_device_disable(...)
		for item in configfs_items:
			configfs_put_item(item)
}

void device_release(...) {
	if enable == True:
		vkms_device_disable(...)
		for item in configfs_items:
			configfs_put_item(item)
}

This way:
- no change in VKMS code
- no ConfigFS change
- we never have use-after-free (at least in my head)
- we never "lose" a DRM device

I did not test it, there is maybe some issue in this implementation (the 
"for item in configfs_items" may be a bit complex to write for example).

> However, that use-after-free is a bug I need to fix. I was wondering how I didn't
> catch it with IGT... Turns out, I didn't enable Kasan in my QEMU .config (ops!).
> 
> Do you agree on folowing this solution? If so, I'll send v3 fixing the memory
> issues.

Indeed yes! If possible, I would like to avoid "complex" refcount/mutex 
in vkms_config structure, but if my proposition does not work, feel free 
to add whatever you think relevant!

Thanks a lot,
Louis Chauvet

> Best wishes,
> Jose
> 
> [1] https://docs.kernel.org/filesystems/configfs.html
> 
>> - we care and we don't want to touch configfs: we need to implement a kind
>> of refcount for all vkms_config elements. Issue: non-trivial work, may allow
>> memory leaks/use after free...
>>
>> - we care and we want to touch configfs: see my two patches (they apply on
>> the v1 of this series). This solution allows adding a check before removing
>> configfs item/group/link. I found it cleaner and way easier to understand.
>>
>> What do you think about my proposition? Do you have another idea?
>>
>>> +static struct configfs_item_operations plane_item_operations = {
>>> +	.release	= &plane_release,
>>> +};
>>> +
>>> +static const struct config_item_type plane_item_type = {
>>> +	.ct_item_ops	= &plane_item_operations,
>>> +	.ct_owner	= THIS_MODULE,
>>> +};
>>> +
>>> +static struct config_group *make_plane_group(struct config_group *group,
>>> +					     const char *name)
>>> +{
>>> +	struct vkms_configfs_device *dev;
>>> +	struct vkms_configfs_plane *plane;
>>> +
>>> +	dev = child_group_to_vkms_configfs_device(group);
>>> +
>>> +	guard(mutex)(&dev->lock);
>>> +
>>> +	if (dev->enabled)
>>> +		return ERR_PTR(-EBUSY);
>>> +
>>> +	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
>>> +	if (!plane)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	plane->dev = dev;
>>> +
>>> +	plane->config = vkms_config_create_plane(dev->config);
>>> +	if (IS_ERR(plane->config)) {
>>> +		kfree(plane);
>>> +		return ERR_CAST(plane->config);
>>> +	}
>>> +
>>> +	config_group_init_type_name(&plane->group, name, &plane_item_type);
>>> +
>>> +	return &plane->group;
>>> +}
>>> +
>>> +static struct configfs_group_operations planes_group_operations = {
>>> +	.make_group	= &make_plane_group,
>>> +};
>>> +
>>> +static const struct config_item_type plane_group_type = {
>>> +	.ct_group_ops	= &planes_group_operations,
>>> +	.ct_owner	= THIS_MODULE,
>>> +};
>>> +
>>>    static ssize_t device_enabled_show(struct config_item *item, char *page)
>>>    {
>>>    	struct vkms_configfs_device *dev;
>>> @@ -125,6 +208,10 @@ static struct config_group *make_device_group(struct config_group *group,
>>>    	config_group_init_type_name(&dev->group, name, &device_item_type);
>>>    	mutex_init(&dev->lock);
>>> +	config_group_init_type_name(&dev->planes_group, "planes",
>>> +				    &plane_group_type);
>>> +	configfs_add_default_group(&dev->planes_group, &dev->group);
>>> +
>>>    	return &dev->group;
>>>    }
>>
>> -- 
>> Louis Chauvet, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

