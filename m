Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5076AA43C9D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C89C10E4B1;
	Tue, 25 Feb 2025 11:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cbuYPLED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA83310E4A9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:02:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F960432E9;
 Tue, 25 Feb 2025 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740481324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTZveGdwdo+h3hfTN92OPsM+DyaPDfGvt6U7A0Tjx7E=;
 b=cbuYPLEDB2LNYMmTHPnlN9QT81SoJnA4AOrMR7lmVFIjeVnR1G64h0XJU3nckYQwCCk6cn
 wAHlBQzEdvVtfwrXzxJ+yV+kcw4u44iFq1nDWtHIOBnY2SLxiic1caDJYyqpH+9tcJCBBk
 290oLtZfUyJ44c2ONYFPosSeFdfTfjCtssQkZinQzp+McUwpsrxZzxiHPkswMx5mWMWhEO
 f/M+ZbuVJ/cXiHAj0EqRMgL+dI/Cqtc1EYXmzGtu9K4R0ztNEb8K1+zaAw3Es0LvxC+KVs
 6nYRkXRyHMlLBFOdO6as/ltwEq/s7e+lO/zNkv1hDPSovWJhC+lgQ89n3PO3aQ==
Date: Tue, 25 Feb 2025 12:02:02 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] drm/vkms: Add and remove VKMS instances via configfs
Message-ID: <Z72jKsEcBas3b5jF@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
 <20250218170808.9507-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218170808.9507-3-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfejveetkedvleetudeuudegfeejheeujeefkefgtdeugfetfeeutdevieekvdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrs
 hhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
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

On 18/02/25 - 18:07, José Expósito wrote:
> Allow to create, enable, disable and destroy VKMS instances using
> configfs.
> 
> For the moment, it is not possible to add pipeline items, so trying to
> enable the device will fail printing an informative error to the log.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>  Documentation/gpu/vkms.rst           |  32 +++++
>  drivers/gpu/drm/vkms/Kconfig         |   1 +
>  drivers/gpu/drm/vkms/Makefile        |   3 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 181 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.h |   8 ++
>  drivers/gpu/drm/vkms/vkms_drv.c      |   7 ++
>  6 files changed, 231 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167..423bdf86b5b1 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -51,6 +51,38 @@ To disable the driver, use ::
>  
>    sudo modprobe -r vkms
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
>  Testing With IGT
>  ================
>  
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index 3c02f928ffe6..3977bbb99f7d 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -7,6 +7,7 @@ config DRM_VKMS
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_SHMEM_HELPER
>  	select CRC32
> +	select CONFIGFS_FS
>  	default n
>  	help
>  	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index d657865e573f..939991fc8233 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -8,7 +8,8 @@ vkms-y := \
>  	vkms_composer.o \
>  	vkms_writeback.o \
>  	vkms_connector.o \
> -	vkms_config.o
> +	vkms_config.o \
> +	vkms_configfs.o
>  
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
>  obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> new file mode 100644
> index 000000000000..306f571559b7
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0+
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
> +	bool enabled;
> +
> +	dev = device_item_to_vkms_configfs_device(item);
> +
> +	mutex_lock(&dev->lock);
> +	enabled = dev->enabled;
> +	mutex_unlock(&dev->lock);
> +
> +	return sprintf(page, "%d\n", enabled);
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
> +	mutex_lock(&dev->lock);
> +
> +	if (!dev->enabled && enabled) {
> +		if (!vkms_config_is_valid(dev->config)) {
> +			ret = -EINVAL;
> +			goto err_unlock;
> +		}
> +
> +		ret = vkms_create(dev->config);
> +	} else if (dev->enabled && !enabled) {
> +		vkms_destroy(dev->config);
> +	}
> +
> +	if (ret)
> +		goto err_unlock;
> +
> +	dev->enabled = enabled;
> +
> +	mutex_unlock(&dev->lock);
> +
> +	return (ssize_t)count;
> +
> +err_unlock:
> +	mutex_unlock(&dev->lock);
> +	return ret;
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
>  #include <drm/drm_vblank.h>
>  
>  #include "vkms_config.h"
> +#include "vkms_configfs.h"
>  #include "vkms_drv.h"
>  
>  #define DRIVER_NAME	"vkms"
> @@ -214,6 +215,10 @@ static int __init vkms_init(void)
>  	int ret;
>  	struct vkms_config *config;
>  
> +	ret = vkms_configfs_register();
> +	if (ret)
> +		return ret;
> +
>  	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
>  	if (IS_ERR(config))
>  		return PTR_ERR(config);
> @@ -250,6 +255,8 @@ void vkms_destroy(struct vkms_config *config)
>  
>  static void __exit vkms_exit(void)
>  {
> +	vkms_configfs_unregister();
> +
>  	if (!default_config)
>  		return;
>  
> -- 
> 2.48.1
> 
