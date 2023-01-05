Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2165E8A8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CA010E6E3;
	Thu,  5 Jan 2023 10:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF79310E6E4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:10:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s9so3589991wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 02:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4m7Y1s94kgAPUcUdp5h11Z9DHNnKQurlv6ak2yowHjs=;
 b=R0uXYiLwKSXOcR0DKAlH0FMa0APRfzZDFoqhx+0DFVI3zhwAl1pfaR+JtzIAgUfami
 2GP9dVb/OG2cIn2YhvNrWycWnCMdlqPHNbC1c5yl334O6+TgjdbnZ7UClNb9GwM22eCq
 fL12JAJoTw1cweQyIZCeiaGLDrPL4NU/VG15Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4m7Y1s94kgAPUcUdp5h11Z9DHNnKQurlv6ak2yowHjs=;
 b=KlrxMGHe+11G1H9mN9+Dg9L0xpa82FkKlZA+wnjDOpC1aIptCa/uuDV1axnRkRxlZd
 t6xW6px7MEb2hKft/rom8WDI5NKHHmm9XA2GbG0CnNowfZp/Wk0yAgUgcEfoXV/PgaOK
 G8wf4Glh/NzxY4n7KkmOqnovTHJTCBX97q5zDigXa1meI1ay+JDmxY4frtOisFeQnog2
 9vYX/XKhTKnewdxHEo6jspKE3jCs25w3wHaTLDp+cybeTYuJ2O0lTTm8TtVo6c6cIjew
 yfO7JRHh3AgSNka8ZCh829HOp5W2MY29RC1Lcgv9Xvn1Z1/4n9E5q0oCzHpfdE2i5LRL
 9qlQ==
X-Gm-Message-State: AFqh2kr2YdVlGqFFAZ5ZD8EiPh1lygxlD91kE6wUL/h9XOA09BUPHGYW
 0HBJB4BaNEsEIne2GC4kgmzIIw==
X-Google-Smtp-Source: AMrXdXv3rYhOw3jTnPpGDoJn2ZZLNhkkxRPeCO28fLZUCUWTWzVP8qtiGLjbodu5BNhH4JzWDkQCSg==
X-Received: by 2002:adf:db12:0:b0:242:203c:9ed4 with SMTP id
 s18-20020adfdb12000000b00242203c9ed4mr33125952wri.55.1672913423129; 
 Thu, 05 Jan 2023 02:10:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n14-20020adfe34e000000b002366dd0e030sm36410769wrj.68.2023.01.05.02.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 02:10:22 -0800 (PST)
Date: Thu, 5 Jan 2023 11:10:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <Y7aiC/5eJBKhDjGx@phenom.ffwll.local>
References: <20230105074909.qd2h23hpxac4lxi7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105074909.qd2h23hpxac4lxi7@houat>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 08:49:09AM +0100, Maxime Ripard wrote:
> Hi Dave, Daniel,
> 
> Here's this week drm-misc-fixes PR
> 
> Maxime
> 
> drm-misc-fixes-2023-01-05:
> Several fixes to fix the error path of dma_buf_export, add a missing
> structure declaration resulting in a compiler warning, fix the GEM
> handle refcounting in panfrost, fix a corrupted image with AFBC on
> meson, a memleak in virtio, improper plane width for imx, and a lockup
> in drm_sched_entity_kill()
> The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:
> 
>   Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-01-05
> 
> for you to fetch changes up to 69555549cfa42e10f2fdd2699ed4e34d9d4f392b:

Pülled, danke vielmals.
-Daniel

> 
>   drm/scheduler: Fix lockup in drm_sched_entity_kill() (2023-01-03 14:49:59 +0300)
> 
> ----------------------------------------------------------------
> Several fixes to fix the error path of dma_buf_export, add a missing
> structure declaration resulting in a compiler warning, fix the GEM
> handle refcounting in panfrost, fix a corrupted image with AFBC on
> meson, a memleak in virtio, improper plane width for imx, and a lockup
> in drm_sched_entity_kill()
> 
> ----------------------------------------------------------------
> Carlo Caione (1):
>       drm/meson: Reduce the FIFO lines held when AFBC is not used
> 
> Christian König (1):
>       dma-buf: fix dma_buf_export init order v2
> 
> Dmitry Osipenko (1):
>       drm/scheduler: Fix lockup in drm_sched_entity_kill()
> 
> Ma Jun (1):
>       drm/plane-helper: Add the missing declaration of drm_atomic_state
> 
> Maxime Ripard (1):
>       Merge drm/drm-fixes into drm-misc-fixes
> 
> Philipp Zabel (1):
>       drm/imx: ipuv3-plane: Fix overlay plane width
> 
> Steven Price (1):
>       drm/panfrost: Fix GEM handle creation ref-counting
> 
> Xiu Jianfeng (1):
>       drm/virtio: Fix memory leak in virtio_gpu_object_create()
> 
>  drivers/dma-buf/dma-buf-sysfs-stats.c    |  7 +--
>  drivers/dma-buf/dma-buf-sysfs-stats.h    |  4 +-
>  drivers/dma-buf/dma-buf.c                | 82 +++++++++++++++-----------------
>  drivers/gpu/drm/imx/ipuv3-plane.c        | 14 +++---
>  drivers/gpu/drm/meson/meson_viu.c        |  5 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c  | 27 +++++++----
>  drivers/gpu/drm/panfrost/panfrost_gem.c  | 16 +------
>  drivers/gpu/drm/panfrost/panfrost_gem.h  |  5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c   |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_object.c  |  6 ++-
>  include/drm/drm_plane_helper.h           |  1 +
>  12 files changed, 80 insertions(+), 93 deletions(-)



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
