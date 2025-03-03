Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70774A4B9D4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C8B10E37F;
	Mon,  3 Mar 2025 08:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kv4MUR+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0575310E37F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:50:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so25702575e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740991807; x=1741596607; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qZdu6KpTyckEllv7JF1hPQ7bOXBdnXW3T0hcvXgW7pg=;
 b=Kv4MUR+f5B51ZFseti+ZOn1X39w3zXqvxuCWn2gG6Oxo+Z734W4va2IHuPcFhZiFJT
 vIorCCybTHb6Eg9mxeaeN2JLsJK6uwSwGJqiePtE5Vzxx2fFg6PMGWVHTkDnfJVZ9hxy
 5RyPSpm4jq5586HK4DGAPoWYTV4H3Ds6dqDSGweBNpAG3xiZCBA1LHVxW71yJKv3PbO5
 7xAjy82U4aPNct6bgB/z8adE5q0kisZOxNSmANCxiTkh2G4reU5Gcxcuv19RpqXkHBAl
 GP44KcmagW4UZXYqa+K+fJNyocwROnRtbXRy3xoJR7zbWgBqDQ57WvcaDbogEA1oL/J7
 d2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991807; x=1741596607;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZdu6KpTyckEllv7JF1hPQ7bOXBdnXW3T0hcvXgW7pg=;
 b=BsY6WW24JW2r6RIMjPF392P7kwKqtAPquCggKY+c0VQeDj0yCuSGp/66tE/PoKhc6z
 3Eit+H31hf4L41ctGEMqg1slGz0f2YYLpGY9k3/jfivOVyAOTff9Wfy4JLO3WwtwGn9Q
 WHkkJqPMYQc8LUTFK9IHFNlbGqKBJz429PtMUd3dBnMJQvQRqMWbUaFkTdzA1GnNpyM3
 zbnM3CTy2hp4FJmBzsWBYRXl5tpaEmfdzQJ2TGV+rlhGcqNjeSRAMIajOV0ZfJJz3TOj
 7qTH4sDYTNzDmHhkvdhsZK5wFl4h7wni7OBIAhJKB2ihN9OiCypB+wyzbKJXYQ8HGr3B
 SnSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE6dv1vDVIQaS6Rkod7dwbFIHJ3nV6qb82sGhyc2d/xGkQzbwNf/cukASYsHtqZi8F8YJra9yqVQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZgX+mdk28O32ump26lC/bnA0KoElNkkfjWbT2vvGSkfx1uukm
 dsT3hOOCnL17/tT7hTssebVcRq0yX/6oO73yizLDkh3dbb1A4Vbz
X-Gm-Gg: ASbGncuyh0woePljNO52YHH7x8Gyi78ZBJyGPrfF4LnklUyGrkMHLhl4H8ehV7V32zI
 wdr6yOx6Z5L4IASDtgMrNQqxPjMPG0M6Swm0lNfX5ZYkzrN+Guw7nbpckYIHYQ8oTucEZj5pOdD
 pNUvuYxw6L8ogW6wS4DsOoMws8khEmGUa9RJ7sbD+hRG4OBO55wqiuqwyQR7hyIJ7KXFJqdbGSR
 6frhc97RuckSaKG8mhax4WK9BSxcNwhMIsp2U7rjo1CjHt+7fJCM9QRaTCyr3zwDQu2Fm0cpXLw
 4KxMu5pEn67rAbiTGSxBe8wlo/2b3VOEk/xIFqTW7TRU
X-Google-Smtp-Source: AGHT+IFp8zeZFS+eosFaNtDEwWL1ljXKipPC9K2EPzzTWHRdNbSNMhLfBAGYV5aLZ/82bCSmHMJC8A==
X-Received: by 2002:a05:600c:5123:b0:439:9274:81ed with SMTP id
 5b1f17b1804b1-43ba66da789mr81399965e9.1.1740991806388; 
 Mon, 03 Mar 2025 00:50:06 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5711fcsm187140325e9.28.2025.03.03.00.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 00:50:05 -0800 (PST)
Date: Mon, 3 Mar 2025 09:50:04 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/16] drm/vkms: Allow to configure multiple planes
 via configfs
Message-ID: <Z8VtPMzuZOYqjraQ@fedora>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
 <20250225175936.7223-4-jose.exposito89@gmail.com>
 <52bc3f15-28da-4b40-917f-981f1f10d9b8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52bc3f15-28da-4b40-917f-981f1f10d9b8@bootlin.com>
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

Hi Louis,

On Fri, Feb 28, 2025 at 03:43:25PM +0100, Louis Chauvet wrote:
> 
> 
> Le 25/02/2025 à 18:59, José Expósito a écrit :
> > Create a default subgroup at /config/vkms/planes to allow to create as
> > many planes as required.
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > [...]
> > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> > index 92512d52ddae..4f9d3341e6c0 100644
> > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > [...]
> > +static void plane_release(struct config_item *item)
> > +{
> > +	struct vkms_configfs_plane *plane;
> > +	struct mutex *lock;
> > +
> > +	plane = plane_item_to_vkms_configfs_plane(item);
> > +	lock = &plane->dev->lock;
> > +
> > +	guard(mutex)(lock);
> > +	vkms_config_destroy_plane(plane->config);
> > +	kfree(plane);
> > +}
> 
> I just found a flaw in our work: there is currently no way to forbid the
> deletion of item/symlinks...
> 
> If you do:
> 
> modprobe vkms
> cd /sys/kernel/config/vkms/
> mkdir DEV
> mkdir DEV/connectors/CON
> mkdir DEV/planes/PLA
> mkdir DEV/crtcs/CRT
> mkdir DEV/encoders/ENC
> ln -s DEV/crtcs/CRT DEV/planes/PLA/possible_crtcs/
> ln -s DEV/crtcs/CRT DEV/encoders/ENC/possible_crtcs
> ln -s DEV/encoders/ENC DEV/connectors/CON/possible_encoders
> echo 1 > DEV/planes/PLA/type
> tree
> echo 1 > DEV/enabled
> modetest -M vkms
> => everything fine
> 
> rm DEV/connectors/CON/possible_encoders/ENC
> rmdir DEV/connectors/CON
> modetest -M vkms
> => BUG: KASAN: slab-use-after-free
> 
> 
> I see two solutions:
> - we don't care and keep as is: if the device is enabled, and you delete
> link/groups, it is your fault. As shown above: it can crash the kernel, so
> it is a no-go.

I was aware of this limitation and, since the configfs is clear about
deleting items: [1]

    Important:
    drop_item() is void, and as such cannot fail. When rmdir(2) is called,
    configfs WILL remove the item from the filesystem tree (assuming that
    it has no children to keep it busy).
    The subsystem is responsible for responding to this. [...]

I decided to follow this approach, i.e., allowing the user to delete the items.

However, that use-after-free is a bug I need to fix. I was wondering how I didn't
catch it with IGT... Turns out, I didn't enable Kasan in my QEMU .config (ops!).

Do you agree on folowing this solution? If so, I'll send v3 fixing the memory
issues.

Best wishes,
Jose

[1] https://docs.kernel.org/filesystems/configfs.html

> - we care and we don't want to touch configfs: we need to implement a kind
> of refcount for all vkms_config elements. Issue: non-trivial work, may allow
> memory leaks/use after free...
> 
> - we care and we want to touch configfs: see my two patches (they apply on
> the v1 of this series). This solution allows adding a check before removing
> configfs item/group/link. I found it cleaner and way easier to understand.
> 
> What do you think about my proposition? Do you have another idea?
> 
> > +static struct configfs_item_operations plane_item_operations = {
> > +	.release	= &plane_release,
> > +};
> > +
> > +static const struct config_item_type plane_item_type = {
> > +	.ct_item_ops	= &plane_item_operations,
> > +	.ct_owner	= THIS_MODULE,
> > +};
> > +
> > +static struct config_group *make_plane_group(struct config_group *group,
> > +					     const char *name)
> > +{
> > +	struct vkms_configfs_device *dev;
> > +	struct vkms_configfs_plane *plane;
> > +
> > +	dev = child_group_to_vkms_configfs_device(group);
> > +
> > +	guard(mutex)(&dev->lock);
> > +
> > +	if (dev->enabled)
> > +		return ERR_PTR(-EBUSY);
> > +
> > +	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
> > +	if (!plane)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	plane->dev = dev;
> > +
> > +	plane->config = vkms_config_create_plane(dev->config);
> > +	if (IS_ERR(plane->config)) {
> > +		kfree(plane);
> > +		return ERR_CAST(plane->config);
> > +	}
> > +
> > +	config_group_init_type_name(&plane->group, name, &plane_item_type);
> > +
> > +	return &plane->group;
> > +}
> > +
> > +static struct configfs_group_operations planes_group_operations = {
> > +	.make_group	= &make_plane_group,
> > +};
> > +
> > +static const struct config_item_type plane_group_type = {
> > +	.ct_group_ops	= &planes_group_operations,
> > +	.ct_owner	= THIS_MODULE,
> > +};
> > +
> >   static ssize_t device_enabled_show(struct config_item *item, char *page)
> >   {
> >   	struct vkms_configfs_device *dev;
> > @@ -125,6 +208,10 @@ static struct config_group *make_device_group(struct config_group *group,
> >   	config_group_init_type_name(&dev->group, name, &device_item_type);
> >   	mutex_init(&dev->lock);
> > +	config_group_init_type_name(&dev->planes_group, "planes",
> > +				    &plane_group_type);
> > +	configfs_add_default_group(&dev->planes_group, &dev->group);
> > +
> >   	return &dev->group;
> >   }
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
