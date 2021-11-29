Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A0461CFF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 18:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C636E842;
	Mon, 29 Nov 2021 17:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A705E6E842
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 17:49:18 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id t19so36135814oij.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 09:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=125G6pSLkhHeNbfcESeeusBQfkQ59CWsjGBxyS76b3s=;
 b=L9zO2eN04fZtVIVlcocKw4guTgFDfZ+B9UIrlLlzHvZ30xrI6TP7bBo5BVOvzrkEZF
 oQ/l0Fr/2HuGTP/6G2bYmo+BXqZrSccwJ4/mC6LjvVoTrZKR1h2n1g2BE2vQ/Xq0Xxhg
 NsbpK4VH7HvMH+/BsjvI0cWBQ9ksXoBB/6uMkf0S4REPvkwl/cR2B54nITjpA3mFiAM6
 f+O3yQf33tedo21fRdtIXJTuPa0YV36BymcfCNngrnpeI9zjQn+fOG5rwoCiOx5WrZb2
 eZaGSiv3ALntm7DzXgsCQlQQgJlGCGRFaa7VP6gqCB+2VZC7jgkliHKgMB0qbcn3y+i5
 2AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=125G6pSLkhHeNbfcESeeusBQfkQ59CWsjGBxyS76b3s=;
 b=ahIE3YJQZx3nuJEW5pNLi/gZ4WFOGfk06eZ5qYhv8tuhnX3tJ+I6KVbDeuAreTPUa8
 NpyrLnC6ifhFj2YrjvNi7dOylsgSPMkGnj4TyMqzf6iVWx2tK3yB1HopIYdNsVlH5QoC
 oMr6smC8EA7feZh7PquLrqwYUWxacoUrkZwr0724h7RWIw7oSgZ7aWUOdMSy/1KcxYPa
 SWRTmjyz4JPef1qhUAT8oKWcT1kHwxOsRfpa2sipBxCvYHOpO2JWx8lRedGSn3HEODya
 hHNtk+VoKL+nOQNJh23YOSObOpoODRhVIplXjHw/gc5joQV1H8qGzaasdW63HGIbLbvz
 a9ag==
X-Gm-Message-State: AOAM531pOAYVVUgJrkiJg/VwQurd9Xb+fj4O95m8Ari16v83W4tu83Dt
 VWdwAdWELGM4eHTO8947AGUqof8L//yxAJik0Feufg0q
X-Google-Smtp-Source: ABdhPJxR2c/GXb+1NXibZP+emU3jrV2myXYXfyWppI0+KyEtxteQ+SMA80bGvH2zG+SwoMnmEb8yIcs9km/mWcB5wgM=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr42343858oib.120.1638207775490; 
 Mon, 29 Nov 2021 09:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20211129094841.22499-1-tzimmermann@suse.de>
In-Reply-To: <20211129094841.22499-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Nov 2021 12:42:44 -0500
Message-ID: <CADnq5_Oetd6zvFy0Z6k7uOth7_W1sPTmaqFZKh42RgjmmU1hzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: Make DRM hashtable legacy
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
Cc: Dave Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 4:48 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Clean up the last non-legacy users of DRM's hashtable code and put
> the code behind CONFIG_DRM_LEGACY.
>
> TTM only includes the header file, but does not use the hashtable.
> The vmwgfx driver uses the hashtable internally. Copy the DRM code
> into the driver. A later patchset should probably update vmwgfx to
> use Linux' hashtable. Finally, make the core hashtable code legacy.
>
> Built with/without CONFIG_DRM_LEGACY set.
>
> v2:
>         * add TODO item for updating vmwgfx (Sam)
>
> Thomas Zimmermann (3):
>   drm/ttm: Don't include drm_hashtab.h
>   drm/vmwgfx: Copy DRM hash-table code into driver
>   drm: Declare hashtable as legacy

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>  Documentation/gpu/todo.rst                    |  11 +
>  drivers/gpu/drm/Makefile                      |   6 +-
>  drivers/gpu/drm/drm_hashtab.c                 |  10 +-
>  drivers/gpu/drm/drm_legacy.h                  |  40 +++-
>  drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
>  drivers/gpu/drm/vmwgfx/ttm_object.c           |  52 ++---
>  drivers/gpu/drm/vmwgfx/ttm_object.h           |   3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c    |  24 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |   6 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c       | 199 ++++++++++++++++++
>  .../gpu/drm/vmwgfx/vmwgfx_hashtab.h           |  54 ++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  22 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    |   7 +-
>  include/drm/drm_device.h                      |   5 +-
>  include/drm/drm_legacy.h                      |  15 +-
>  include/drm/ttm/ttm_bo_api.h                  |   1 -
>  18 files changed, 358 insertions(+), 103 deletions(-)
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
>  rename include/drm/drm_hashtab.h => drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h (58%)
>
>
> base-commit: 6a8f90ec433e2f5de5fc16d7a4839771b7027cc0
> --
> 2.34.0
>
