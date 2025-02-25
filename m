Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E64CA43CA0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A010E4A9;
	Tue, 25 Feb 2025 11:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Hu0wK+0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E14510E395
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:02:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB02644281;
 Tue, 25 Feb 2025 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740481323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYSXPUF+vwG7JYwVP70OXbYIMYvlKCPGBdyYlGkM1+w=;
 b=Hu0wK+0bP9gbqnR9T4OMixBkC+byhZxvwFxpxlyLIymf6y/HvzHrsTAZixkB6vm2YGAOEv
 zJAScJepvqZK/k0FE30eAQyCl2Stkdh3eWWyDn6wyYlVW1/SFAV8LRMNNEYZfgkqK2H/bu
 ICgPrU7OullWZSFg1SSUGy88VgHrY6U1oAHngs8sN6urZxFOTdWYehAnLs5HLwyWZay5qo
 JJ8nTJi9VUmG0hJh8HBXBlI19kef65oU6YZk6RG5d7muwD9OXowCPEHTDsNxWRSLMVGAtV
 JOkb8T/rKaH6JSN/liRQnDUHzIFU+NdI7mlhCfmwaM6H0zmbbQO3nHT5+SLK6Q==
Date: Tue, 25 Feb 2025 12:02:01 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] drm/vkms: Allow to configure multiple CRTCs via
 configfs
Message-ID: <Z72jKZs3fPUBgwL6@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
 <20250218170808.9507-6-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218170808.9507-6-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtkeeitdehvdeggfevvdevledvleevvdeggeeufeefgedtledujedtteeghfeinecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrs
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
> Create a default subgroup at /config/vkms/crtcs to allow to create as
> many CRTCs as required.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  6 ++
>  drivers/gpu/drm/vkms/vkms_configfs.c | 98 ++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index d95f228de05b..da5157adfd79 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -74,6 +74,7 @@ By default, the instance is disabled::
>  And directories are created for each configurable item of the display pipeline::
>  
>    tree /config/vkms/my-vkms
> +  ├── crtcs
>    ├── enabled
>    └── planes
>  
> @@ -88,6 +89,10 @@ Planes have 1 configurable attribute:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor
>  
> +Continue by creating one or more CRTCs::
> +
> +  sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
> +
>  Once you are done configuring the VKMS instance, enable it::
>  
>    echo "1" | sudo tee /config/vkms/my-vkms/enabled
> @@ -99,6 +104,7 @@ Finally, you can remove the VKMS instance disabling it::
>  And removing the top level directory and its subdirectories::
>  
>    sudo rmdir /config/vkms/my-vkms/planes/*
> +  sudo rmdir /config/vkms/my-vkms/crtcs/*
>    sudo rmdir /config/vkms/my-vkms
>  
>  Testing With IGT
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 093735f47858..52205a8a9cb4 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -16,6 +16,7 @@ static bool is_configfs_registered;
>   * @group: Top level configuration group that represents a VKMS device.
>   * Initialized when a new directory is created under "/config/vkms/"
>   * @planes_group: Default subgroup of @group at "/config/vkms/planes"
> + * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
>   * @lock: Lock used to project concurrent access to the configuration attributes
>   * @config: Protected by @lock. Configuration of the VKMS device
>   * @enabled: Protected by @lock. The device is created or destroyed when this
> @@ -24,6 +25,7 @@ static bool is_configfs_registered;
>  struct vkms_configfs_device {
>  	struct config_group group;
>  	struct config_group planes_group;
> +	struct config_group crtcs_group;
>  
>  	struct mutex lock;
>  	struct vkms_config *config;
> @@ -44,6 +46,20 @@ struct vkms_configfs_plane {
>  	struct vkms_config_plane *config;
>  };
>  
> +/**
> + * struct vkms_configfs_crtc - Configfs representation of a CRTC
> + *
> + * @group: Top level configuration group that represents a CRTC.
> + * Initialized when a new directory is created under "/config/vkms/crtcs"
> + * @dev: The vkms_configfs_device this CRTC belongs to
> + * @config: Configuration of the VKMS CRTC
> + */
> +struct vkms_configfs_crtc {
> +	struct config_group group;
> +	struct vkms_configfs_device *dev;
> +	struct vkms_config_crtc *config;
> +};
> +
>  #define device_item_to_vkms_configfs_device(item) \
>  	container_of(to_config_group((item)), struct vkms_configfs_device, \
>  		     group)
> @@ -54,6 +70,84 @@ struct vkms_configfs_plane {
>  #define plane_item_to_vkms_configfs_plane(item) \
>  	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
>  
> +#define crtc_item_to_vkms_configfs_crtc(item) \
> +	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
> +
> +static void crtc_release(struct config_item *item)
> +{
> +	struct vkms_configfs_crtc *crtc;
> +	struct mutex *lock;
> +
> +	crtc = crtc_item_to_vkms_configfs_crtc(item);
> +	lock = &crtc->dev->lock;
> +
> +	mutex_lock(lock);
> +	vkms_config_destroy_crtc(crtc->dev->config, crtc->config);
> +	kfree(crtc);
> +	mutex_unlock(lock);
> +}
> +
> +static struct configfs_item_operations crtc_item_operations = {
> +	.release	= &crtc_release,
> +};
> +
> +static const struct config_item_type crtc_item_type = {
> +	.ct_item_ops	= &crtc_item_operations,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static struct config_group *make_crtc_group(struct config_group *group,
> +					    const char *name)
> +{
> +	struct vkms_configfs_device *dev;
> +	struct vkms_configfs_crtc *crtc;
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
> +	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
> +	if (!crtc) {
> +		ret = -ENOMEM;
> +		goto err_unlock;
> +	}
> +
> +	crtc->dev = dev;
> +
> +	crtc->config = vkms_config_create_crtc(dev->config);
> +	if (IS_ERR(crtc->config)) {
> +		ret = PTR_ERR(crtc->config);
> +		goto err_free;
> +	}
> +
> +	config_group_init_type_name(&crtc->group, name, &crtc_item_type);
> +
> +	mutex_unlock(&dev->lock);
> +
> +	return &crtc->group;
> +
> +err_free:
> +	kfree(crtc);
> +err_unlock:
> +	mutex_unlock(&dev->lock);
> +	return ERR_PTR(ret);
> +}
> +
> +static struct configfs_group_operations crtcs_group_operations = {
> +	.make_group	= &make_crtc_group,
> +};
> +
> +static const struct config_item_type crtc_group_type = {
> +	.ct_group_ops	= &crtcs_group_operations,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
>  static ssize_t plane_type_show(struct config_item *item, char *page)
>  {
>  	struct vkms_configfs_plane *plane;
> @@ -289,6 +383,10 @@ static struct config_group *make_device_group(struct config_group *group,
>  				    &plane_group_type);
>  	configfs_add_default_group(&dev->planes_group, &dev->group);
>  
> +	config_group_init_type_name(&dev->crtcs_group, "crtcs",
> +				    &crtc_group_type);
> +	configfs_add_default_group(&dev->crtcs_group, &dev->group);
> +
>  	return &dev->group;
>  }
>  
> -- 
> 2.48.1
> 
