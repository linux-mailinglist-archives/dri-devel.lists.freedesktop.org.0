Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9504A43CA5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24A910E4BC;
	Tue, 25 Feb 2025 11:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CRD/Sx42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA2910E18C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:02:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CB1843301;
 Tue, 25 Feb 2025 11:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740481324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5sWEpE4uOKT4TprGad6WnC/VIKjHhmFSa2c30FZG1I=;
 b=CRD/Sx42PpoYeWAVMq38b4T0uqevKqvIp4QpEXT3dJ0jAb8x1sTGk0lCJ3TSFB4nky9VLV
 VcdorUZKd4uuPB6JSTr4TWfPOK8un+6P5bk2cGpvrwZqIhLR//og9+EaB2s1b2pTKtK4NJ
 07AFK7NQJbCXvnnBSee1sAW8KBKfbLgj/RozfzbJEUsBS8Ycz7G9jfOawKWm5MeZe/6GM5
 hM2td1+IqVtTu8p3BgOihXl1sWj3dh1xBLb+hjXnuwPd9I5Kj+RJ2s1Vx7DjRrhuWwvp/A
 +7LfWQoPrEneGXdQQhjpTrkWdnw+gb2tQweWaWuuiZoHD7JDXBQU7m/IRYf36g==
Date: Tue, 25 Feb 2025 12:02:02 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/16] drm/vkms: Allow to configure the plane type via
 configfs
Message-ID: <Z72jKlNJDCisHvfO@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
 <20250218170808.9507-5-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218170808.9507-5-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfejveetkedvleetudeuudegfeejheeujeefkefgtdeugfetfeeutdevieekvdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrs
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
> When a plane is created, add a `type` file to allow to set the type:
> 
>  - 0 overlay
>  - 1 primary
>  - 2 cursor
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  4 +++
>  drivers/gpu/drm/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index bf23d0da33fe..d95f228de05b 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -84,6 +84,10 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> +Planes have 1 configurable attribute:
> +
> +- type: Plane type: 0 overlay, 1 primary, 2 cursor
> +

Maybe we can say:

- type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
  exposed by the "type" property of a plane)

>  Once you are done configuring the VKMS instance, enable it::
>  
>    echo "1" | sudo tee /config/vkms/my-vkms/enabled
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index dd9dfe51eb3a..093735f47858 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -54,6 +54,56 @@ struct vkms_configfs_plane {
>  #define plane_item_to_vkms_configfs_plane(item) \
>  	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
>  
> +static ssize_t plane_type_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	enum drm_plane_type type;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	mutex_lock(&plane->dev->lock);
> +	type = vkms_config_plane_get_type(plane->config);
> +	mutex_unlock(&plane->dev->lock);

I think we should consider using scoped_gard instead of mutex_lock/unlock. 
This may avoid issues (in many other functions there are early returns, 
where a scoped_guard may help).

I am not against "pure" mutex_lock/unlock (I am not 100% sure that 
scoped_guard really improve the readability), but I think we should be 
consistent: if we want to profit from scoped_guard in some functions, we 
should use it everywhere in this file.

(all my R-by are valid with or without scoped_guard)

> +
> +	return sprintf(page, "%u", type);
> +}
> +
> +static ssize_t plane_type_store(struct config_item *item, const char *page,
> +				size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	enum drm_plane_type type;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	if (kstrtouint(page, 10, &type))
> +		return -EINVAL;
> +
> +	if (type != DRM_PLANE_TYPE_OVERLAY && type != DRM_PLANE_TYPE_PRIMARY &&
> +	    type != DRM_PLANE_TYPE_CURSOR)
> +		return -EINVAL;
> +
> +	mutex_lock(&plane->dev->lock);
> +
> +	if (plane->dev->enabled) {
> +		mutex_unlock(&plane->dev->lock);
> +		return -EPERM;

I just tough about it, but is -EPERM also the return value when you don't
have the right to write on the file? What do you think about -EBUSY? It 
also describe a bit better the situation (Device or resource busy vs 
Operation not permitted).

Thanks,
Louis Chauvet

> +	}
> +
> +	vkms_config_plane_set_type(plane->config, type);
> +
> +	mutex_unlock(&plane->dev->lock);
> +
> +	return (ssize_t)count;
> +}
> +
> +CONFIGFS_ATTR(plane_, type);
> +
> +static struct configfs_attribute *plane_item_attrs[] = {
> +	&plane_attr_type,
> +	NULL,
> +};
> +
>  static void plane_release(struct config_item *item)
>  {
>  	struct vkms_configfs_plane *plane;
> @@ -73,6 +123,7 @@ static struct configfs_item_operations plane_item_operations = {
>  };
>  
>  static const struct config_item_type plane_item_type = {
> +	.ct_attrs	= plane_item_attrs,
>  	.ct_item_ops	= &plane_item_operations,
>  	.ct_owner	= THIS_MODULE,
>  };
> -- 
> 2.48.1
> 
