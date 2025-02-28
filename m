Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E740FA49D1E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0243010ECD3;
	Fri, 28 Feb 2025 15:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p4MTwS14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C4410ECD3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:19:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E80D9443B4;
 Fri, 28 Feb 2025 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740755954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6PsdEcGr91rbEcTkQHklpm6Jk5oSqLiuDoL+gKClvh8=;
 b=p4MTwS14vrC9dsLEgdm258mnlVN8k6xN2B1BS9a3ez3Xwwl+wG68vP+NIrl+ClZxONRdlC
 Xk8Do3hvheA8miUFhLXlI0C4iCAoQZ/GckYQTt6bGZjd0IqYPD3olugFBRzqmaQP93RUUH
 DEdRD8LdG6ZgS/YUg60t9tFSYqPLlD1/GecAK1E1bxeKutsWjY8qJvjl328wri5Syw8U2U
 3zhu76U6smpHfOs60kA4TwZIw7EAgQ5Z5h61gZEVpMty3jN0LhBefaqVlRnvicb41R774q
 Udz2jNtfoNzACFIWI2JR8GPUtKbuZPDluOQkapSW4csZy+dHEDZ779NMPn5h4Q==
Message-ID: <16d2f49f-02f6-44dd-91f2-05b2e5d598da@bootlin.com>
Date: Fri, 28 Feb 2025 16:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] drm/vkms: Add and remove VKMS instances via
 configfs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
 <20250225175936.7223-3-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250225175936.7223-3-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmo
 hhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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



Le 25/02/2025 à 18:59, José Expósito a écrit :
> Allow to create, enable, disable and destroy VKMS instances using
> configfs.
> 
> For the moment, it is not possible to add pipeline items, so trying to
> enable the device will fail printing an informative error to the log.
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   Documentation/gpu/vkms.rst           |  32 +++++
>   drivers/gpu/drm/vkms/Kconfig         |   1 +
>   drivers/gpu/drm/vkms/Makefile        |   3 +-
>   drivers/gpu/drm/vkms/vkms_configfs.c | 169 +++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_configfs.h |   8 ++
>   drivers/gpu/drm/vkms/vkms_drv.c      |   7 ++
>   6 files changed, 219 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167..423bdf86b5b1 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -51,6 +51,38 @@ To disable the driver, use ::
>   
>     sudo modprobe -r vkms
>   
> +Configuring With Configfs
> +=========================
> +
> +It is possible to create and configure multiple VKMS instances via configfs.
> +
> +Start by mounting configfs and loading VKMS::
> +
> +  sudo mount -t configfs none /config
> +  sudo modprobe vkms
> +
> +Once VKMS is loaded, ``/config/vkms`` is created automatically. Each directory
> +under ``/config/vkms`` represents a VKMS instance, create a new one::
> +
> +  sudo mkdir /config/vkms/my-vkms
> +
> +By default, the instance is disabled::
> +
> +  cat /config/vkms/my-vkms/enabled
> +  0
> +
> +Once you are done configuring the VKMS instance, enable it::
> +
> +  echo "1" | sudo tee /config/vkms/my-vkms/enabled
> +
> +Finally, you can remove the VKMS instance disabling it::
> +
> +  echo "0" | sudo tee /config/vkms/my-vkms/enabled
> +
> +And removing the top level directory::
> +
> +  sudo rmdir /config/vkms/my-vkms
> +
>   Testing With IGT
>   ================
>   
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index 3c02f928ffe6..3977bbb99f7d 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -7,6 +7,7 @@ config DRM_VKMS
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_SHMEM_HELPER
>   	select CRC32
> +	select CONFIGFS_FS
>   	default n
>   	help
>   	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index d657865e573f..939991fc8233 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -8,7 +8,8 @@ vkms-y := \
>   	vkms_composer.o \
>   	vkms_writeback.o \
>   	vkms_connector.o \
> -	vkms_config.o
> +	vkms_config.o \
> +	vkms_configfs.o
>   
>   obj-$(CONFIG_DRM_VKMS) += vkms.o
>   obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> new file mode 100644
> index 000000000000..92512d52ddae
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/cleanup.h>
> +#include <linux/configfs.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +
> +#include "vkms_drv.h"
> +#include "vkms_config.h"
> +#include "vkms_configfs.h"
> +
> +/* To avoid registering configfs more than once or unregistering on error */
> +static bool is_configfs_registered;
> +
> +/**
> + * struct vkms_configfs_device - Configfs representation of a VKMS device
> + *
> + * @group: Top level configuration group that represents a VKMS device.
> + * Initialized when a new directory is created under "/config/vkms/"
> + * @lock: Lock used to project concurrent access to the configuration attributes
> + * @config: Protected by @lock. Configuration of the VKMS device
> + * @enabled: Protected by @lock. The device is created or destroyed when this
> + * option changes
> + */
> +struct vkms_configfs_device {
> +	struct config_group group;
> +
> +	struct mutex lock;
> +	struct vkms_config *config;
> +	bool enabled;
> +};
> +
> +#define device_item_to_vkms_configfs_device(item) \
> +	container_of(to_config_group((item)), struct vkms_configfs_device, \
> +		     group)
> +
> +static ssize_t device_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_device *dev;
> +
> +	dev = device_item_to_vkms_configfs_device(item);
> +
> +	guard(mutex)(&dev->lock);
> +	return sprintf(page, "%d\n", dev->enabled);
> +}
> +
> +static ssize_t device_enabled_store(struct config_item *item, const char *page,
> +				    size_t count)
> +{
> +	struct vkms_configfs_device *dev;
> +	bool enabled;
> +	int ret = 0;
> +
> +	dev = device_item_to_vkms_configfs_device(item);
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (!dev->enabled && enabled) {
> +		if (!vkms_config_is_valid(dev->config))
> +			return -EINVAL;
> +
> +		ret = vkms_create(dev->config);
> +		if (ret)
> +			return ret;
> +	} else if (dev->enabled && !enabled) {
> +		vkms_destroy(dev->config);
> +	}
> +
> +	dev->enabled = enabled;

Sorry, I was maybe not clear enough, and you may hate me: I don't like 
`guard(mutex)` :‑(. I proposed scoped_guard because it makes very clear 
when the mutex is taken/released.

For me guard(mutex) is almost the same as mutex_lock/unlock. Yes, your 
mutex is always released, but:
- without reading the code carefully, you don't know you have a mutex 
(even worse than a mutex_lock because you don't have a bunch of 
mutex_unlock to remind you)
- you keep it until the end of the function, which may lock your mutex 
for too long

The scoped_guard solves the two issues:
- you are in a dedicated block + indentation, so it is very easy to see 
that you currently have a mutex
- you know exactly when the mutex is released: leaving the block

I am very sorry to make you work twice on this

> +
> +	return (ssize_t)count;
> +}
> +
> +CONFIGFS_ATTR(device_, enabled);
> +
> +static struct configfs_attribute *device_item_attrs[] = {
> +	&device_attr_enabled,
> +	NULL,
> +};
> +
> +static void device_release(struct config_item *item)
> +{
> +	struct vkms_configfs_device *dev;
> +
> +	dev = device_item_to_vkms_configfs_device(item);
> +
> +	if (dev->enabled)
> +		vkms_destroy(dev->config);
> +
> +	mutex_destroy(&dev->lock);
> +	vkms_config_destroy(dev->config);
> +	kfree(dev);
> +}
> +
> +static struct configfs_item_operations device_item_operations = {
> +	.release	= &device_release,
> +};
> +
> +static const struct config_item_type device_item_type = {
> +	.ct_attrs	= device_item_attrs,
> +	.ct_item_ops	= &device_item_operations,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static struct config_group *make_device_group(struct config_group *group,
> +					      const char *name)
> +{
> +	struct vkms_configfs_device *dev;
> +
> +	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->config = vkms_config_create(name);
> +	if (IS_ERR(dev->config)) {
> +		kfree(dev);
> +		return ERR_CAST(dev->config);
> +	}
> +
> +	config_group_init_type_name(&dev->group, name, &device_item_type);
> +	mutex_init(&dev->lock);
> +
> +	return &dev->group;
> +}
> +
> +static struct configfs_group_operations device_group_ops = {
> +	.make_group = &make_device_group,
> +};
> +
> +static const struct config_item_type device_group_type = {
> +	.ct_group_ops	= &device_group_ops,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static struct configfs_subsystem vkms_subsys = {
> +	.su_group = {
> +		.cg_item = {
> +			.ci_name = "vkms",
> +			.ci_type = &device_group_type,
> +		},
> +	},
> +	.su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
> +};
> +
> +int vkms_configfs_register(void)
> +{
> +	int ret;
> +
> +	if (is_configfs_registered)
> +		return 0;
> +
> +	config_group_init(&vkms_subsys.su_group);
> +	ret = configfs_register_subsystem(&vkms_subsys);
> +
> +	is_configfs_registered = ret == 0;
> +
> +	return ret;
> +}
> +
> +void vkms_configfs_unregister(void)
> +{
> +	if (is_configfs_registered)
> +		configfs_unregister_subsystem(&vkms_subsys);
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
> new file mode 100644
> index 000000000000..e9020b0043db
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef _VKMS_CONFIGFS_H_
> +#define _VKMS_CONFIGFS_H_
> +
> +int vkms_configfs_register(void);
> +void vkms_configfs_unregister(void);
> +
> +#endif /* _VKMS_CONFIGFS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 23817c7b997e..5bcfbcb6c0c5 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -28,6 +28,7 @@
>   #include <drm/drm_vblank.h>
>   
>   #include "vkms_config.h"
> +#include "vkms_configfs.h"
>   #include "vkms_drv.h"
>   
>   #define DRIVER_NAME	"vkms"
> @@ -214,6 +215,10 @@ static int __init vkms_init(void)
>   	int ret;
>   	struct vkms_config *config;
>   
> +	ret = vkms_configfs_register();
> +	if (ret)
> +		return ret;
> +
>   	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
>   	if (IS_ERR(config))
>   		return PTR_ERR(config);
> @@ -250,6 +255,8 @@ void vkms_destroy(struct vkms_config *config)
>   
>   static void __exit vkms_exit(void)
>   {
> +	vkms_configfs_unregister();
> +
>   	if (!default_config)
>   		return;
>   

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

