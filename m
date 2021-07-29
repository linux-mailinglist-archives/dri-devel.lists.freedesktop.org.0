Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB13D9E24
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A906EC99;
	Thu, 29 Jul 2021 07:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38476EC99
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:13:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b11so218802wrx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XKTmp2BjlaIr87ckUfRqle/VWMn8gi8O/5KnqPiPgkg=;
 b=gnVQLWwjTIDB4n0RTLbHFDZTJ3Il72HNNte/oyI26tSHD5kF7hR01fRoVk5G76gbtB
 D9fSH9m3z6glPMu/oIFMZzHatpI+DEd7JDNPYp3IRCcegvYbdCu78detM/dxzrpt+hm8
 jCe2J0C8bYoUwkHK7/miMw9wy5sRHxyVRME08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XKTmp2BjlaIr87ckUfRqle/VWMn8gi8O/5KnqPiPgkg=;
 b=FciRpS5a6dmHBquzIurT9407062IxBXelZugf2VS2NwCLFThePOu4us8ILcgU9ZWQt
 TQLmOaoHudKqizgfxAklEgufLmkSo+iGTf8FVYZv/PRTP9C3B4H/KHLsfI5XU/PQDEV4
 ZnISlpX6UXMUfRwlW+68GsI4yY19u/8A7mVccHYacI9vRSAbuzQJldEh8gAvpNsg43uP
 +t9yODc7YzIOWhauhsOCwjsAekfoFG/IGEXOH/YCBKkyYtQCjnx2XlGOQi0RsrkzncRF
 3tfsM8dN0GJkqgXwy8hJKDWzplbjDgzH4TIOmJYF3kN+5ShM+xEF+Gqnbj6o81V62wbe
 zWlQ==
X-Gm-Message-State: AOAM533OWvQFju2q1jrnaXhLrKAtXZ9J+c/qGRkPuNzqbz8B71r52RrC
 5UBlmCeU2fMM3Q5wnWe0FCx2UQ==
X-Google-Smtp-Source: ABdhPJxVe3J1Rxvy3GVcIQAMEDxyKw+/TX7ixTj4mwp9eXwkfffl87GdtaWJWuY0nLJ6jnnCBLoDPg==
X-Received: by 2002:a05:6000:1818:: with SMTP id
 m24mr3138418wrh.49.1627542785405; 
 Thu, 29 Jul 2021 00:13:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t23sm6760949wmi.32.2021.07.29.00.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:13:04 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:13:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
Message-ID: <YQJU/vGDpLIpf+2p@phenom.ffwll.local>
References: <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 01:52:42PM -0700, Rob Clark wrote:
> Hi Dave & Daniel,
> 
> An early pull for v5.15 (there'll be more coming in a week or two),
> consisting of the drm/scheduler conversion and a couple other small
> series that one was based one.  Mostly sending this now because IIUC
> danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
> you disagree then speak up, and I'll instead include this in the main
> pull request once that is ready.)

I like, but might be some time until I managed to rebase it all and adjust
msm too. Thanks for doing the early pull.
-Daniel

> 
> This also has a core patch to drop drm_gem_object_put_locked() now
> that the last use of it is removed.
> 
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28
> 
> for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:
> 
>   drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)
> 
> ----------------------------------------------------------------
> Rob Clark (18):
>       drm/msm: Let fences read directly from memptrs
>       drm/msm: Signal fences sooner
>       drm/msm: Split out devfreq handling
>       drm/msm: Split out get_freq() helper
>       drm/msm: Devfreq tuning
>       drm/msm: Docs and misc cleanup
>       drm/msm: Small submitqueue creation cleanup
>       drm/msm: drop drm_gem_object_put_locked()
>       drm: Drop drm_gem_object_put_locked()
>       drm/msm/submit: Simplify out-fence-fd handling
>       drm/msm: Consolidate submit bo state
>       drm/msm: Track "seqno" fences by idr
>       drm/msm: Return ERR_PTR() from submit_create()
>       drm/msm: Conversion to drm scheduler
>       drm/msm: Drop submit bo_list
>       drm/msm: Drop struct_mutex in submit path
>       drm/msm: Utilize gpu scheduler priorities
>       drm/msm/gem: Mark active before pinning
> 
>  drivers/gpu/drm/drm_gem.c                   |  22 --
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/Makefile                |   1 +
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>  drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
>  drivers/gpu/drm/msm/msm_fence.c             |  53 +----
>  drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
>  drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
>  drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
>  drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
>  drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
>  drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
>  drivers/gpu/drm/msm/msm_rd.c                |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
>  drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>  drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
>  include/drm/drm_gem.h                       |   2 -
>  include/uapi/drm/msm_drm.h                  |  14 +-
>  26 files changed, 865 insertions(+), 536 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
