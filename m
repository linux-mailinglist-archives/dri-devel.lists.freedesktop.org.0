Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B210A43C96
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709EA10E18A;
	Tue, 25 Feb 2025 11:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DPyX+sBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDF710E18A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:02:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72FA943421;
 Tue, 25 Feb 2025 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740481321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXt3c9CVQvc7CzFxOrTxOQEN6Im/PPW6FaJxrF+m1AE=;
 b=DPyX+sBVMp+g9487x4P+sLGs5jxe8ouxsisTngx5NWK/Kt51jZ4XPLhTvxnHcoBtAALIM9
 rMoeBRytLVoIKbcSQbo+kCFeyNZ1maG53PpOCImCJcFyXRi6cNWpn7wH4vKbDIW49axvrr
 GATKPcH+k0wsnn6Bu3T02CiyIdn7gdDLYI4sZBaXBNHUTXMXu2YxP750iGWkxQxhz6rA1M
 VDZFnI8Mmq1020pDOfWDtuxe5A86S7rTUYDJrgxbCTPG93mpnjgI9RxgQ+srY7/I9+RxdB
 wQb2r4rpOZPGcwwb7O/VNKcJMUwCBtiGgFUAyqwCbQDn2kjeSm70RPhxkdqpTg==
Date: Tue, 25 Feb 2025 12:01:59 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/16] drm/vkms: Allow to configure multiple planes via
 configfs
Message-ID: <Z72jJxrUyegPhesH@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
 <20250218170808.9507-4-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218170808.9507-4-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtkeeitdehvdeggfevvdevledvleevvdeggeeufeefgedtledujedtteeghfeinecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrs
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
> Create a default subgroup at /config/vkms/planes to allow to create as
> many planes as required.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  16 ++++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 101 +++++++++++++++++++++++++++
>  2 files changed, 116 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 423bdf86b5b1..bf23d0da33fe 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -71,6 +71,19 @@ By default, the instance is disabled::
>    cat /config/vkms/my-vkms/enabled
>    0
>  
> +And directories are created for each configurable item of the display pipeline::
> +
> +  tree /config/vkms/my-vkms
> +  ├── enabled
> +  └── planes
> +
> +To add items to the display pipeline, create one or more directories under the
> +available paths.
> +
> +Start by creating one or more planes::
> +
> +  sudo mkdir /config/vkms/my-vkms/planes/plane0
> +
>  Once you are done configuring the VKMS instance, enable it::
>  
>    echo "1" | sudo tee /config/vkms/my-vkms/enabled
> @@ -79,8 +92,9 @@ Finally, you can remove the VKMS instance disabling it::
>  
>    echo "0" | sudo tee /config/vkms/my-vkms/enabled
>  
> -And removing the top level directory::
> +And removing the top level directory and its subdirectories::
>  
> +  sudo rmdir /config/vkms/my-vkms/planes/*
>    sudo rmdir /config/vkms/my-vkms
>  
>  Testing With IGT
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 306f571559b7..dd9dfe51eb3a 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -15,6 +15,7 @@ static bool is_configfs_registered;
>   *
>   * @group: Top level configuration group that represents a VKMS device.
>   * Initialized when a new directory is created under "/config/vkms/"
> + * @planes_group: Default subgroup of @group at "/config/vkms/planes"
>   * @lock: Lock used to project concurrent access to the configuration attributes
>   * @config: Protected by @lock. Configuration of the VKMS device
>   * @enabled: Protected by @lock. The device is created or destroyed when this
> @@ -22,16 +23,112 @@ static bool is_configfs_registered;
>   */
>  struct vkms_configfs_device {
>  	struct config_group group;
> +	struct config_group planes_group;
>  
>  	struct mutex lock;
>  	struct vkms_config *config;
>  	bool enabled;
>  };
>  
> +/**
> + * struct vkms_configfs_plane - Configfs representation of a plane
> + *
> + * @group: Top level configuration group that represents a plane.
> + * Initialized when a new directory is created under "/config/vkms/planes"
> + * @dev: The vkms_configfs_device this plane belongs to
> + * @config: Configuration of the VKMS plane
> + */
> +struct vkms_configfs_plane {
> +	struct config_group group;
> +	struct vkms_configfs_device *dev;
> +	struct vkms_config_plane *config;
> +};
> +
>  #define device_item_to_vkms_configfs_device(item) \
>  	container_of(to_config_group((item)), struct vkms_configfs_device, \
>  		     group)
>  
> +#define child_group_to_vkms_configfs_device(group) \
> +	device_item_to_vkms_configfs_device((&(group)->cg_item)->ci_parent)
> +
> +#define plane_item_to_vkms_configfs_plane(item) \
> +	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
> +
> +static void plane_release(struct config_item *item)
> +{
> +	struct vkms_configfs_plane *plane;
> +	struct mutex *lock;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +	lock = &plane->dev->lock;
> +
> +	mutex_lock(lock);
> +	vkms_config_destroy_plane(plane->config);
> +	kfree(plane);
> +	mutex_unlock(lock);

scoped_guard here?

> +}
> +
> +static struct configfs_item_operations plane_item_operations = {
> +	.release	= &plane_release,
> +};
> +
> +static const struct config_item_type plane_item_type = {
> +	.ct_item_ops	= &plane_item_operations,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static struct config_group *make_plane_group(struct config_group *group,
> +					     const char *name)
> +{
> +	struct vkms_configfs_device *dev;
> +	struct vkms_configfs_plane *plane;
> +	int ret;
> +
> +	dev = child_group_to_vkms_configfs_device(group);
> +
> +	mutex_lock(&dev->lock);
> +
> +	if (dev->enabled) {
> +		ret = -EINVAL;

Why not -EPERM/-EBUSY?

> +		goto err_unlock;
> +	}
> +
> +	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
> +	if (!plane) {
> +		ret = -ENOMEM;
> +		goto err_unlock;
> +	}
> +
> +	plane->dev = dev;
> +
> +	plane->config = vkms_config_create_plane(dev->config);
> +	if (IS_ERR(plane->config)) {
> +		ret = PTR_ERR(plane->config);
> +		goto err_free;
> +	}
> +
> +	config_group_init_type_name(&plane->group, name, &plane_item_type);
> +
> +	mutex_unlock(&dev->lock);
> +
> +	return &plane->group;
> +
> +err_free:
> +	kfree(plane);
> +err_unlock:
> +	mutex_unlock(&dev->lock);
> +	return ERR_PTR(ret);
> +}

scoped_guard?

> +
> +static struct configfs_group_operations planes_group_operations = {
> +	.make_group	= &make_plane_group,
> +};
> +
> +static const struct config_item_type plane_group_type = {
> +	.ct_group_ops	= &planes_group_operations,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
>  static ssize_t device_enabled_show(struct config_item *item, char *page)
>  {
>  	struct vkms_configfs_device *dev;
> @@ -137,6 +234,10 @@ static struct config_group *make_device_group(struct config_group *group,
>  	config_group_init_type_name(&dev->group, name, &device_item_type);
>  	mutex_init(&dev->lock);
>  
> +	config_group_init_type_name(&dev->planes_group, "planes",
> +				    &plane_group_type);
> +	configfs_add_default_group(&dev->planes_group, &dev->group);
> +
>  	return &dev->group;
>  }
>  
> -- 
> 2.48.1
> 
