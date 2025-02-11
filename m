Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14839A308C2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 11:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8887C10E21D;
	Tue, 11 Feb 2025 10:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NdnWyrge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232D510E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:39:29 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38dcb7122c1so3390853f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739270368; x=1739875168; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kyX5GliCGkS9GXhUP/lDAmt14UlfBAJ4be7edHjNLVk=;
 b=NdnWyrgeJyOELzqeHIGXq29Cosk6iTaGhEDxMFf6T7ARFcVlA4ORwnknuWw5tp7Mk3
 GHD1Ig8KCWbOgRJkcgy0rA4Kc9dLeNd2Z0lU4bY70LFd7eYyVtr7g/I+ZRe1w1OSDrbC
 7xkMQdu9d7E4906Mcb/2idjOCcr5aOyJhGhggb65f82BEZHqYZh5GuFyOHXfUsMkxrfR
 T4UQMzNg6qf/Ku1h47gDa2iZ+CrDb5gsk7MJMpJ0OvmsmzZZlZMSX3aQYx8bRrXUL6fk
 iNHAQdQVDBDCqgA+bZqOXjvueJuHiEw56m08/XT131mXPRWbpefDrna3jkeSTJ0t3869
 prmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270368; x=1739875168;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kyX5GliCGkS9GXhUP/lDAmt14UlfBAJ4be7edHjNLVk=;
 b=VyRsBGBkyu+oWaVjdWZmx++PJ8zu73f/dwl7QF6v9q41veSdZD3Mob03bw2QPQ7QBj
 b1wO8bUWvMg5EQ4NhvZgCRp2d9oGzJHuoo2zC1Dcb+KAzrO6FNXg/tpgpWkw+W+avjC4
 5OlcJjWXmqt/AgjEhtsXIBekbwzkz2/vHiAx5qS41whMFD+nFcYlDL1PMy0DWGe+5Z+C
 MRp5cxnd32wZF4cGBTQIKPbTbssdTu5SeOsHTvfzzPx/94Zo/v2N15H0rwsd7kjLkFY2
 m6mPG6uNeWa25yRGLlVkKCpXtyzO8JYaHXAkb4pnWvfeB+PuKVpK+xwM6n7oNB3Db3f9
 BnCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQN25Ma5rvSkl5q31tL8hDBNxj40MOmnquf+Ax78M82F1UOOULX3UJdD4Na3mavOQCGvo5NzwBU+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWvFUIA1uhywbq1be7GJdcoG/hkgVugF1FUULJFYAUPsAQzNCb
 GtDJizLnugBJ7e39Ngw5+89xlAAqDXqP4F2PuCmvyn+q9niLv8t9
X-Gm-Gg: ASbGncueB26prkBwuP0Xg61e7HeHykBx9mL8reKT9AsEKNq0DyP3Je34dElGtYNX6ox
 Im4UGE9gGIaRnBEn7otTm2eiaNAfUeS0mqm+rYlwTyCtSpYxIl0Ivxs+adXZsn09czX9pwU7LoJ
 9TS8DFQ8MmecpyKBLhYmVpnO1TWIAzNanwzsYMnNNy9KhAsxsVbRimOYlXxDn4U3ulj4TsVbJIU
 E9QHxNnUfS5AYo+tkaENpJccfQpC/LZlUIumU7nnxmjUGKRbbidKC4x0STNx9b7JYnWmBjyPBQP
 X2BW3udeWqk+pg==
X-Google-Smtp-Source: AGHT+IH46PQbD0D61i3GoKYMxvqIWjEWYfzUm3CKBKsXv98Ie3+SgFLpZGdUw6lQZaDZWnKOz8er0Q==
X-Received: by 2002:a5d:59a5:0:b0:38d:e15e:17e1 with SMTP id
 ffacd0b85a97d-38de15e1bd0mr5476380f8f.10.1739270367263; 
 Tue, 11 Feb 2025 02:39:27 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbf2ed900sm14354832f8f.53.2025.02.11.02.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:39:26 -0800 (PST)
Date: Tue, 11 Feb 2025 11:39:25 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] drm/vkms: Extract vkms_config header
Message-ID: <Z6so3Xpd-z5zQJEK@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-4-jose.exposito89@gmail.com>
 <Z5uDHcCmAwiTsGte@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDHcCmAwiTsGte@louis-chauvet-laptop>
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

On Thu, Jan 30, 2025 at 02:48:13PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Creating a new vkms_config structure will be more complex once we
> > start adding more options.
> > 
> > Extract the vkms_config structure to its own header and source files
> > and add functions to create and delete a vkms_config and to initialize
> > debugfs.
> > 
> > Refactor, no functional changes.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -208,8 +189,7 @@ static int vkms_create(struct vkms_config *config)
> >  	if (ret)
> >  		goto out_devres;
> >  
> > -	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
> > -			      ARRAY_SIZE(vkms_config_debugfs_list));
> > +	vkms_config_register_debugfs(vkms_device);
> >  
> >  	ret = drm_dev_register(&vkms_device->drm, 0);
> >  	if (ret)
> > @@ -231,9 +211,9 @@ static int __init vkms_init(void)
> >  	int ret;
> >  	struct vkms_config *config;
> >  
> > -	config = kmalloc(sizeof(*config), GFP_KERNEL);
> > -	if (!config)
> > -		return -ENOMEM;
> > +	config = vkms_config_create();
> > +	if (IS_ERR(config))
> > +		return PTR_ERR(config);
> >  
> >  	default_config = config;
> >  
> > @@ -243,7 +223,7 @@ static int __init vkms_init(void)
> >  
> >  	ret = vkms_create(config);
> >  	if (ret)
> > -		kfree(config);
> > +		vkms_config_destroy(config);
> 
> I just have a question here: is it not a problem to kfree config (and 
> default_config) here? There is not risk to have a 
> use-after-free/double-free in vkms_exit?
> 
> >	return ret;
> >  }
> > @@ -272,7 +252,7 @@ static void __exit vkms_exit(void)
> >	if (default_config->dev)
> 
> The use-after-free may be here?
> 
> >		vkms_destroy(default_config);
> >  
> > -	kfree(default_config);
> > +	vkms_config_destroy(default_config);
> 
> And maybe double-free?
> 
> >  }
> 
> If this is not an issue (ie we have a garantee that vkms_exit is never
> called if vkms_init fails), you can add my

Good catch! This is a potential use after free/double free or, even worst,
on "if (default_config->dev)" default_config could be NULL.

Even though the bug is unrelated to this series (it was already there) I'll
include a fix in v2.
It'll be the first patch of the series and it could be merged independently.

Thanks,
Jose

> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> [...]
