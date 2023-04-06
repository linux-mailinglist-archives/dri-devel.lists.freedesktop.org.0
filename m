Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196CF6D97A7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467EC10E0F9;
	Thu,  6 Apr 2023 13:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D82210E0F9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:09:55 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5002f12ccfeso127923a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680786593; x=1683378593;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ek3MSzMffUK0LQGwkcsCVPMXylhoY8wd6Dt/mkIvUWs=;
 b=byOpgdQeT1k9CxXCXWWmtD0/NXms4fhcHcn2NWedYFWfWmzfbb8Pnp/wxioLCVQCKk
 3Vu/rhAzb7ugwp4DYOBzu29Dwbtp3tHZHwBbvVQGwZrICbq42u7yyG2mnmReWlz2xeRw
 YruKYdbFNOHWT8hs9jkUZvnqNKiIdjh3BCoGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680786593; x=1683378593;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ek3MSzMffUK0LQGwkcsCVPMXylhoY8wd6Dt/mkIvUWs=;
 b=wnlIqjKA5Ypwb6KMjJk/nQjqzUaOHYGQ5JgrN6hGpjgGdbxeFH2sjbAxZmzjqCzvqL
 z32F9MxiIZFa6mlgYKw8nWsm1zkSP6221nw0JYaP/B5fcwrU2d48f1pNXNBMctECVylj
 OHWLhwF477tiSmafS/E5IHH/j7/ogiodHtUzuOpav/xaYbSdkDOsxQnaS7gUkfCZ/4lm
 RhriEt3So9bnXYnoijllFXWyP8frGfibhWZ6/xR0zR6RmfHzOaaN/2a9YCPhIhvOM/XX
 C2Ob6iOvYvONeZTUj82GOP5sCW3jRY0lFJ2LS8mHeSsNCqqSlErXrlzcDIsx/A6R2CN9
 N/TQ==
X-Gm-Message-State: AAQBX9fOg4hx55LHy/o1zIIElXdVUKhdAzSx8m61ul1f2uL6HPI3FKk2
 KW0Ab3J9XYciv+5j97fWPY1XdcyiG1eDuEQteOs=
X-Google-Smtp-Source: AKy350Y+X+QEiWJ5qrl0lfuY92/86vOurnVTJ5o14ZCpmPk3dDrzXXHiUKQoK8sRJm1/Jhia35ixKg==
X-Received: by 2002:a17:906:3f12:b0:93b:dddf:4be2 with SMTP id
 c18-20020a1709063f1200b0093bdddf4be2mr4756458ejj.3.1680786593246; 
 Thu, 06 Apr 2023 06:09:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s27-20020a1709060c1b00b009475bd8f441sm805956ejf.60.2023.04.06.06.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:09:52 -0700 (PDT)
Date: Thu, 6 Apr 2023 15:09:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Changes for v6.4-rc1
Message-ID: <ZC7EnnQZ0LBpC/cV@phenom.ffwll.local>
References: <20230406121404.967704-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406121404.967704-1-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 02:14:04PM +0200, Thierry Reding wrote:
> Hi Dave, Daniel,
> 
> The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:
> 
>   Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.4-rc1
> 
> for you to fetch changes up to 2429b3c529da29d4277d519bd66d034842dcd70c:
> 
>   drm/tegra: Avoid potential 32-bit integer overflow (2023-04-06 14:02:33 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> drm/tegra: Changes for v6.4-rc1
> 
> The majority of this is minor cleanups and fixes. Other than those, this
> contains Uwe's conversion to the new driver remove callback and Thomas'
> fbdev DRM client conversion. The driver can now also be built on other
> architectures to easy compile coverage.

Neat cleanup on top might be too look at the generic fbdev stuff, just as
an idea.

> Finally, this adds Mikko as a second maintainer for the driver. As a
> next step we also want Tegra DRM to move into drm-misc to streamline the
> maintenance process.

Amusingly the one patch that dim flagged as lacking a 2nd set of eyes (no
a-b/rb or committer!=author) is the MAINTAINERS patch, would have been
good to record Mikko's ack for getting volunteered :-)

Anyway all good, pulled, thanks!

> 
> ----------------------------------------------------------------
> Cai Huoqing (3):
>       drm/tegra: sor: Make use of the helper function dev_err_probe()
>       drm/tegra: dsi: Make use of the helper function dev_err_probe()
>       drm/tegra: plane: Improve use of dev_err_probe()
> 
> Christian König (2):
>       drm/tegra: Allow compile test on !ARM v2
>       drm/tegra: Fix another missing include
> 
> Deepak R Varma (1):
>       drm/tegra: sor: Remove redundant error logging
> 
> Diogo Ivo (1):
>       drm/tegra: dsi: Clear enable register if powered by bootloader
> 
> Lee Jones (1):
>       drm/tegra: dc: Remove set but unused variable 'state'
> 
> Mikko Perttunen (1):
>       gpu: host1x: Don't rely on dma_fence_wait_timeout return value
> 
> Nur Hussein (1):
>       drm/tegra: Avoid potential 32-bit integer overflow
> 
> Thierry Reding (1):
>       MAINTAINERS: Add Mikko as backup maintainer for Tegra DRM
> 
> Thomas Zimmermann (7):
>       drm/tegra: Include <linux/of.h>
>       drm/tegra: Include <linux/i2c.h>
>       drm/tegra: Removed fb from struct tegra_fbdev
>       drm/tegra: Remove struct tegra_fbdev
>       drm/tegra: Hide fbdev support behind config option
>       drm/tegra: Initialize fbdev DRM client
>       drm/tegra: Implement fbdev emulation as in-kernel client
> 
> Uwe Kleine-König (12):
>       gpu: host1x: Make host1x_client_unregister() return void
>       drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
>       drm/tegra: dc: Convert to platform remove callback returning void
>       drm/tegra: dpaux: Convert to platform remove callback returning void
>       drm/tegra: dsi: Convert to platform remove callback returning void
>       drm/tegra: gr2d: Convert to platform remove callback returning void
>       drm/tegra: gr3d: Convert to platform remove callback returning void
>       drm/tegra: hdmi: Convert to platform remove callback returning void
>       drm/tegra: hub: Convert to platform remove callback returning void
>       drm/tegra: nvdec: Convert to platform remove callback returning void
>       drm/tegra: sor: Convert to platform remove callback returning void
>       drm/tegra: vic: Convert to platform remove callback returning void
> 
> Yang Yingliang (2):
>       gpu: host1x: Fix potential double free if IOMMU is disabled
>       gpu: host1x: Fix memory leak of device names
> 
> Ye Xingchen (1):
>       gpu: host1x: mipi: Use devm_platform_get_and_ioremap_resource()
> 
>  MAINTAINERS                             |   1 +
>  drivers/gpu/drm/tegra/Kconfig           |   2 +-
>  drivers/gpu/drm/tegra/Makefile          |   2 +
>  drivers/gpu/drm/tegra/dc.c              |  22 +--
>  drivers/gpu/drm/tegra/dc.h              |   2 +-
>  drivers/gpu/drm/tegra/dpaux.c           |   6 +-
>  drivers/gpu/drm/tegra/drm.c             |  23 +--
>  drivers/gpu/drm/tegra/drm.h             |  27 ++--
>  drivers/gpu/drm/tegra/dsi.c             |  51 ++++---
>  drivers/gpu/drm/tegra/fb.c              | 242 +-------------------------------
>  drivers/gpu/drm/tegra/fbdev.c           | 241 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/gem.c             |   1 +
>  drivers/gpu/drm/tegra/gr2d.c            |  14 +-
>  drivers/gpu/drm/tegra/gr3d.c            |  14 +-
>  drivers/gpu/drm/tegra/hdmi.c            |  14 +-
>  drivers/gpu/drm/tegra/hub.c             |  13 +-
>  drivers/gpu/drm/tegra/nvdec.c           |  14 +-
>  drivers/gpu/drm/tegra/output.c          |   3 +
>  drivers/gpu/drm/tegra/plane.c           |  16 +--
>  drivers/gpu/drm/tegra/rgb.c             |   7 +-
>  drivers/gpu/drm/tegra/sor.c             |  44 ++----
>  drivers/gpu/drm/tegra/vic.c             |  14 +-
>  drivers/gpu/host1x/Kconfig              |   2 +-
>  drivers/gpu/host1x/bus.c                |   6 +-
>  drivers/gpu/host1x/context.c            |  24 ++--
>  drivers/gpu/host1x/mipi.c               |   4 +-
>  drivers/gpu/host1x/syncpt.c             |   8 +-
>  drivers/staging/media/tegra-video/csi.c |   8 +-
>  drivers/staging/media/tegra-video/vi.c  |   8 +-
>  include/linux/host1x.h                  |   2 +-
>  30 files changed, 370 insertions(+), 465 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/fbdev.c

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
