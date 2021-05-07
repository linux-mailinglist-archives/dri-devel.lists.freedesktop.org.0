Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D9376A87
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 21:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433756E3D2;
	Fri,  7 May 2021 19:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D496E3D2;
 Fri,  7 May 2021 19:12:12 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 o202-20020a4a2cd30000b02901fcaada0306so2184117ooo.7; 
 Fri, 07 May 2021 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XeL4I50hqUyVbIDtTzKYPooLICg3o2JC1HsNPtm1C/A=;
 b=Msdelnp54kvLuBeF25N4s7UFPDrqmX+0fMuvwCrqPvpBgDF0IfwvM+wlHhnZZUZTI1
 Enlrbqkkh58ATWna9OrR9fkI8qmtHbgyR4JWmCkoO1/iXn4OGfdkAVztacQIQ3tw7SqK
 T0wd5+SH41r+LApxAfEmpb7gXx/r+QtWoF/MrexoW4r7fWuv3vtwVxRsBtVuQ1EY4mQm
 P3pzHcP8WlTYb7sKTyZNzjFku5AaUqf6UJP2sVOReZFYjWM64pHLWaM12POshTTjDtLg
 vZY9lwA7hiQTwypVxULwCXKykfqYR5wSBrIvEJSJYn+sQNhNPK2lSFPihwNkR9d6KeeA
 +jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XeL4I50hqUyVbIDtTzKYPooLICg3o2JC1HsNPtm1C/A=;
 b=QIIaER99/+I3JBAJ+/RbwQN84A/S/7Cqs0an0zSjfAe0tP80G87eJxUlMDxq3uWyus
 AoAp5kZUWdG7qa6Tfyco8SpbxXq2wxCjkxobmmXSVwYkYM3BfKi3j9TUWMIjzKwL3kdB
 jp01NcEd2jqucpCFGm3MafA2n6eZyrsGj2hwjfOXvVh7RhRSVKqkAJ5zoofWhPJnxZD2
 GmBS4tS/PLxFhkyTsiMtbDd4JOYwo6tisPGCLTYuXKWBxjUhFYTE0FMdf06XRic8km2f
 0EFJ5rBYbyqR/3DhRjngaD2Cx/SDEfuaMxOyOQnTt7QSHRl5Um1nkcSj3fEkCgRpaXnd
 fpVQ==
X-Gm-Message-State: AOAM531h8bHCHeJ2DIWwJKDha/yn1Z1nH4iogKJJw/xIB05W/xbq5TJl
 ZIPEvX3dWWlbSUxXRxfyUcR2v8vboWSyQGdAWOg=
X-Google-Smtp-Source: ABdhPJxZQ+cZ3GXQSym33RYG0j5lMsU1yNOA2pxbu5rVpDGXlOuls53nidMDforjz0gUxvTwgMFEUMXQPix7VcBnrmk=
X-Received: by 2002:a4a:d543:: with SMTP id q3mr8899784oos.72.1620414731558;
 Fri, 07 May 2021 12:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210507185709.22797-1-tzimmermann@suse.de>
In-Reply-To: <20210507185709.22797-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 May 2021 15:12:00 -0400
Message-ID: <CADnq5_MgNT99=tNSXfN=OPkfa=fXKszyrZEEgsbNAW02ntFaOA@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm: Mark DRM's AGP code as legacy
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 7, 2021 at 2:57 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> This patch moves the DRM core's AGP code behind CONFIG_DRM_LEGACY. The
> only use besides legacy, UMS drivers is radeon, which can implement the
> required functionality by itself.
>
> This patchset has no impact on the AGP support of existing drivers.
>
> Patches 1 and 2 move some AGP code from DRM core into radeon. Radeon
> uses some of the AGP code for its internal purposes. But being a KMS
> driver, there's no reason why radeon should provide the rsp AGP ioctls.
> So duplicate the implementation in radeon and thus uncould it from
> the legacy code.
>
> Patch 3 moves some AGP-related PCI helpers behind CONFIG_DRM_LEGACY.
>
> Patch 4 moves DRM's AGP code behind CONFIG_DRM_LEGACY. The files are
> then only build when legacy drivers are active.
>
> Built-tested with different config options selected.
>
> Thomas Zimmermann (4):
>   drm/radeon: Move AGP helpers into radeon driver
>   drm/radeon: Move AGP data structures into radeon
>   drm: Mark PCI AGP helpers as legacy
>   drm: Mark AGP implementation and ioctls as legacy

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

I'm fine to have this merged through drm-misc.

Alex


>
>  drivers/gpu/drm/Makefile            |   6 +-
>  drivers/gpu/drm/drm_agpsupport.c    |  99 ++++++++++++-----------
>  drivers/gpu/drm/drm_bufs.c          |   1 -
>  drivers/gpu/drm/drm_drv.c           |   4 +-
>  drivers/gpu/drm/drm_internal.h      |   5 --
>  drivers/gpu/drm/drm_ioc32.c         |  19 +++--
>  drivers/gpu/drm/drm_ioctl.c         |  24 +++---
>  drivers/gpu/drm/drm_legacy.h        |  30 +++++++
>  drivers/gpu/drm/drm_legacy_misc.c   |   1 -
>  drivers/gpu/drm/drm_memory.c        |   1 -
>  drivers/gpu/drm/drm_pci.c           |  23 +++---
>  drivers/gpu/drm/drm_vm.c            |   2 -
>  drivers/gpu/drm/i810/i810_dma.c     |   3 +-
>  drivers/gpu/drm/mga/mga_dma.c       |  16 ++--
>  drivers/gpu/drm/mga/mga_drv.h       |   1 -
>  drivers/gpu/drm/r128/r128_cce.c     |   2 +-
>  drivers/gpu/drm/radeon/radeon.h     |  42 ++++++++++
>  drivers/gpu/drm/radeon/radeon_agp.c | 118 ++++++++++++++++++++++++----
>  drivers/gpu/drm/radeon/radeon_drv.c |  13 ---
>  drivers/gpu/drm/radeon/radeon_kms.c |  18 +++--
>  drivers/gpu/drm/radeon/radeon_ttm.c |   6 +-
>  drivers/gpu/drm/via/via_dma.c       |   1 -
>  include/drm/drm_agpsupport.h        | 117 ---------------------------
>  include/drm/drm_device.h            |   6 +-
>  include/drm/drm_legacy.h            |  82 +++++++++++++++++++
>  25 files changed, 375 insertions(+), 265 deletions(-)
>  delete mode 100644 include/drm/drm_agpsupport.h
>
> --
> 2.31.1
>
