Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5984F8FF3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AB010E150;
	Fri,  8 Apr 2022 07:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F74610E150
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 07:56:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 v20-20020a05600c15d400b0038e9a88aee7so1851434wmf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 00:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HkwAZrZkgdAd7oUeozmd8jGTYEPERVima1zq6qajlcs=;
 b=BCrKF9Ou2215znjQcGSzzhlZT3w7dEnneJi4hVbheyCco/7uMfEWSeCoC5wfjbe+Hd
 rrnnkDYhmWlNQ0y5L0LSnNR9ZK49HL2P8T8xtsJ9JcPXhzWJLC/NUG/+mnTLVXt/STQX
 YeMyTlqIe4oADo0ViWusKjx5MqHCVK3Q8ZfAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HkwAZrZkgdAd7oUeozmd8jGTYEPERVima1zq6qajlcs=;
 b=xVn54RREPguG/L5P4rKKLoDJ7NEsFBICScyWaslsDk2xrvedvk8hqCumqLYwUYeFPp
 qYWY9mqO8FnkcSU115ETll4gQz+MBGdr62HkAqo6DhMkco/mkmKZ+PVMHYh/XDWpKJOt
 hCHkuxhBhTuCg/wZzqqm3N5zFdMotFXOQddeMI6QWCPgIiaoszAXr2PzM0MS4ysUXq1v
 LlTEOsvLaFhSNGR0XEiUR8Cy1bC1i7t8NYjf4ccD778AeJ7BrrbIWWuMkEcBkqe8Wzdj
 Cwb6sy705iut/JRJwj6FPj7THGL0kUhsYcBG3qF/5r0hYNoOouLfLyVCKquleAKLX9Ne
 6OJA==
X-Gm-Message-State: AOAM5305FFRbNZAPn2G9aeSw8Yq/fOZU3WHOWFh/k9fr8FCHDz1uyIP7
 54tHLgLqGFDwLjkuOUOY/u9Z+w==
X-Google-Smtp-Source: ABdhPJzIfR6qSJA5Mfc0/HU09modYG3w4R5JNxPjAtQi5VwmQqy0xK/JHX+pCYcgquWG/HQm1rvLqQ==
X-Received: by 2002:a05:600c:34d5:b0:38e:68ad:24b1 with SMTP id
 d21-20020a05600c34d500b0038e68ad24b1mr15930286wmq.52.1649404577035; 
 Fri, 08 Apr 2022 00:56:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056000186b00b0020799d3d416sm551448wri.55.2022.04.08.00.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 00:56:16 -0700 (PDT)
Date: Fri, 8 Apr 2022 09:56:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 1/5] drm/ttm: Add common debugfs code for resource managers
Message-ID: <Yk/qnkpXjDnO3Wr3@phenom.ffwll.local>
References: <20220407025652.146426-1-zack@kde.org>
 <20220407025652.146426-2-zack@kde.org>
 <b84b40b8-fa7f-efa3-5c5e-2596d80bb94c@amd.com>
 <ba7ade96600cf480e929f58f30ea4cf964b94e4e.camel@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba7ade96600cf480e929f58f30ea4cf964b94e4e.camel@vmware.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>, "ray.huang@amd.com" <ray.huang@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 02:15:52PM +0000, Zack Rusin wrote:
> On Thu, 2022-04-07 at 08:01 +0200, Christian König wrote:
> > Am 07.04.22 um 04:56 schrieb Zack Rusin:
> > > From: Zack Rusin <zackr@vmware.com>
> > > 
> > > Drivers duplicate the code required to add debugfs entries for
> > > various
> > > ttm resource managers. To fix it add common TTM resource manager
> > > code that each driver can reuse.
> > > 
> > > Because TTM resource managers can be initialized and set a lot
> > > later
> > > than TTM device initialization a seperate init function is
> > > required.
> > > Specific resource managers can overwrite
> > > ttm_resource_manager_func::debug to get more information from those
> > > debugfs entries.
> > > 
> > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > Cc: Christian Koenig <christian.koenig@amd.com>
> > > Cc: Huang Rui <ray.huang@amd.com>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > 
> > Ah, yes that was on my TODO list for quite a while as well.
> > 
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_resource.c | 65
> > > ++++++++++++++++++++++++++++++
> > >   include/drm/ttm/ttm_resource.h     |  4 ++
> > >   2 files changed, 69 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > > b/drivers/gpu/drm/ttm/ttm_resource.c
> > > index 492ba3157e75..6392ad3e9a88 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > > @@ -29,6 +29,8 @@
> > >   #include <drm/ttm/ttm_resource.h>
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > > 
> > > +#include "ttm_module.h"
> > > +
> > >   /**
> > >    * ttm_lru_bulk_move_init - initialize a bulk move structure
> > >    * @bulk: the structure to init
> > > @@ -644,3 +646,66 @@ ttm_kmap_iter_linear_io_fini(struct
> > > ttm_kmap_iter_linear_io *iter_io,
> > > 
> > >       ttm_mem_io_free(bdev, mem);
> > >   }
> > > +
> > > +#if defined(CONFIG_DEBUG_FS)
> > > +
> > > +#define TTM_RES_MAN_SHOW(i) \
> > > +     static int ttm_resource_manager##i##_show(struct seq_file *m,
> > > void *unused) \
> > > +     { \
> > > +             struct ttm_device *bdev = (struct ttm_device *)m-
> > > >private; \
> > > +             struct ttm_resource_manager *man =
> > > ttm_manager_type(bdev, i); \
> > > +             struct drm_printer p = drm_seq_file_printer(m); \
> > > +             ttm_resource_manager_debug(man, &p); \
> > > +             return 0; \
> > > +     }\
> > > +     DEFINE_SHOW_ATTRIBUTE(ttm_resource_manager##i)
> > > +
> > > +TTM_RES_MAN_SHOW(0);
> > > +TTM_RES_MAN_SHOW(1);
> > > +TTM_RES_MAN_SHOW(2);
> > > +TTM_RES_MAN_SHOW(3);
> > > +TTM_RES_MAN_SHOW(4);
> > > +TTM_RES_MAN_SHOW(5);
> > > +TTM_RES_MAN_SHOW(6);
> > 
> > Uff, please not a static array.
> > 
> > > +
> > > +#endif
> > > +
> > > +/**
> > > + * ttm_resource_manager_debugfs_init - Setup debugfs entries for
> > > specified
> > > + * resource managers.
> > > + * @bdev: The TTM device
> > > + * @file_names: A mapping between TTM_TT placements and the
> > > debugfs file
> > > + * names
> > > + * @num_file_names: The array size of @file_names.
> > > + *
> > > + * This function setups up debugfs files that can be used to look
> > > + * at debug statistics of the specified ttm_resource_managers.
> > > + * @file_names array is used to figure out which ttm placements
> > > + * will get debugfs files created for them.
> > > + */
> > > +void
> > > +ttm_resource_manager_debugfs_init(struct ttm_device *bdev,
> > > +                               const char * const file_names[],
> > > +                               uint32_t num_file_names)
> > > +{
> > > +#if defined(CONFIG_DEBUG_FS)
> > > +     uint32_t i;
> > > +     const struct file_operations *fops[] = {
> > > +             &ttm_resource_manager0_fops,
> > > +             &ttm_resource_manager1_fops,
> > > +             &ttm_resource_manager2_fops,
> > > +             &ttm_resource_manager3_fops,
> > > +             &ttm_resource_manager4_fops,
> > > +             &ttm_resource_manager5_fops,
> > > +             &ttm_resource_manager6_fops,
> > > +     };
> > > +
> > > +     WARN_ON(num_file_names > ARRAY_SIZE(fops));
> > > +
> > > +     for (i = 0; i < num_file_names; ++i)
> > > +             if (file_names[i] && fops[i])
> > > +                     debugfs_create_file(file_names[i], 0444,
> > > +                                         ttm_debugfs_root, bdev,
> > > fops[i]);
> > 
> > You can give the ttm_resource_manager directly as parameter here
> > instead
> > of the bdev and avoid the whole handling with the macro and global
> > arrays.
> 
> We could but that does change the behaviour. I was trying to preserve
> the old semantics. Because the lifetimes of driver specific managers
> are not handled by ttm, there's nothing preventing the drivers from,
> e.g. during reset, deleting the old and setting up new resource
> managers. By always using ttm_manager_type() we make sure that we're
> always using the current one. Passing ttm_resource_manager directly
> makes it impossible to validate that at _show() time
> ttm_resource_manager is still valid. It's not a problem for vmwgfx
> because we never reset the resource managers but I didn't feel
> comfortable changing the semantics like that for all drivers. It could
> lead to weird crashes, but if you prefer that approach I'm happy to
> change it.

Uh resetting resource managers during the lifetime of a drm_device sounds
very broken. I guess it's somewhat ok over suspend/resume or so when
userspace cannot access the driver, but even then it smells fishy.

Unless we have a driver doing that I don't think this is a use-case we
should support.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
