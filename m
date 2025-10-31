Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A9C26860
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 19:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3E410EC0A;
	Fri, 31 Oct 2025 18:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b/kwE4Ae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DFB10EC10
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 18:08:28 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b6d53684cfdso546765966b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761934107; x=1762538907; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k8d3ECFMhnrvwiqROxc/5OIhq95iyP7zpdKInqKWJBA=;
 b=b/kwE4Aef4hw+MIJ4+nMFUvgCubx3RdyOLQh5aCJmwm71WtvXSRH9WlR3WoZw/MKSN
 isLauRxJz3hiPUWa/l8QROC4C6BB3xQR68Wt56OksBrb0abJMo2ZfxL5r+BACfcUXfz+
 ysGEPN/TEAY8e9PWlCQyNkuHOZBanlgOTsQzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934107; x=1762538907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8d3ECFMhnrvwiqROxc/5OIhq95iyP7zpdKInqKWJBA=;
 b=tljTGQ3Puhf8Pd1GMRhdruGkLzx5Xkenmf1YXalWaZ8Swm/xfJR7D3ZryJvkwFq4Qa
 fv9NAzexckMeX65iZlRz9g7N62NTJh/I7jalzPXi4ahTDsz7Bf76swHNhHjKKzdMKbkf
 ZKpHclNjjba+hP0CbJaxFZCyw1iI00fKK9IUM3t9Fk/RwRPJo1tOq9BMiQdUnL+uMjyB
 DwtY8xWkdFlTyuVAzctgoft/t2TpHf4SQYTfVIjJdEMGrBVop2FJqLgeHif99NFgT2jL
 XrbW9jRle61pVg1pWTjyW0TLaFI2/fS9ggir9vRBjOBXB/oByDtiJWWjqBcTvCit1VAF
 +rmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2jtjVOwjIS/gYTsCctr5+6XZMm3FfzvWDQztPzS46XiCRpwh1wL3Feo4QOCuAcd1C0vxMvqevJpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQd10hk6NFWxaX7HkRAJXOn4SMXTqUPoxQQdi+a1WdIa1IiZXl
 FrP6YK2BQDhu9JmEG3wAYmo2fqjOWiYSq9bFAlcE5XRtbJXWybQUDnMBtImcR8aEmu4=
X-Gm-Gg: ASbGncu5P0b0MRC9e86R6rovZw0FDufcsCvBsRM+8rtIOrOgniRg/fxOTeQTlHjVQaN
 E9WbRKfka71zmq0hIbBWqudPS8/HFDr1HhAxACGBib5WUs+Hh7wDpYtdYJoeTdTlrlsVi/IjIE+
 GNDNBOpghC5Vs7rvZCP5aseuYhdQs0DjM5Siaj5jcTdSb8Qg2Nde7/4Vh0JurV+0y4/EnAXUiGG
 K6zXQlbzZa7B96SgO93o7AciW7AgZixCffO4N3I/+LLzSkoftcsTyyFwlHmejx2j1+8pTjuHkXI
 Hqqv/0X2L+j1nl8zBJuzMlrBa5n0q8qziSndZwPAc1TKbuDv/8Nsm5JRED69gk+Pks3QpOhp25Q
 ZtOfdudrC2RVgaHBbNJdtaHnpH/2Wi/paUtHPC5XEF67M5v0EE8xt2E57eRFXKm2de7jfGEIcZL
 WR+qBPyvywGpw=
X-Google-Smtp-Source: AGHT+IGqIcTutuaI6gZsnpUKDuo7K+T8kt8BjV1yz4nEoXEK2pIhTNz970Lt/A0xE/Jshiw649tVtA==
X-Received: by 2002:a17:907:d7cb:b0:b3b:9832:f9b with SMTP id
 a640c23a62f3a-b7070191794mr462444466b.25.1761934106546; 
 Fri, 31 Oct 2025 11:08:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077ce927csm235947166b.63.2025.10.31.11.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:08:25 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:08:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2025-10-29 for v6.18-rc4
Message-ID: <aQT7GMYPkgALgJ5q@phenom.ffwll.local>
References: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64
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

On Wed, Oct 29, 2025 at 03:39:06PM -0700, Rob Clark wrote:
> Hi Dave,
> 
> Fixes for v6.18-rc4
> 
> The following changes since commit b5bad77e1e3c7249e4c0c88f98477e1ee7669b63:
> 
>   drm/msm/registers: Sync GPU registers from mesa (2025-09-10 14:48:12 -0700)
> 
> are available in the Git repository at:
> 
>   drm-msm-fixes-2025-10-29

This is not really a git repo, there is something busted with your
scripting. I just used the url from the last pr, which seems to have
worked, but please fix this.

Anyway, pulled into drm-fixes, thanks!
-Sima

> 
> for you to fetch changes up to f5d079564c44baaeedf5e25f4b943aa042ea0eb1:
> 
>   drm/msm/dpu: Fix adjusted mode clock check for 3d merge (2025-10-29
> 00:20:47 +0200)
> 
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>       drm/msm/a6xx: Fix GMU firmware parser
> 
> Anna Maniscalco (1):
>       drm/msm: make sure last_fence is always updated
> 
> Jessica Zhang (1):
>       drm/msm/dpu: Fix adjusted mode clock check for 3d merge
> 
> Neil Armstrong (1):
>       drm/msm: dsi: fix PLL init in bonded mode
> 
> Rob Clark (4):
>       drm/msm: Fix GEM free for imported dma-bufs
>       drm/msm: Fix pgtable prealloc error path
>       drm/msm: Reject MAP_NULL op if no PRR
>       drm/msm: Ensure vm is created in VM_BIND ioctl
> 
> Vignesh Raman (1):
>       drm/ci: disable broken MR check in sanity job
> 
> Vladimir Lypak (6):
>       drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
>       drm/msm/dpu: Propagate error from dpu_assign_plane_resources
>       drm/msm/dpu: Disable scaling for unsupported scaler types
>       drm/msm/dpu: Fix pixel extension sub-sampling
>       drm/msm/dpu: Require linear modifier for writeback framebuffers
>       drm/msm/dpu: Disable broken YUV on QSEED2 hardware
> 
>  drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c          |  5 ++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  7 -------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 18 ++----------------
>  drivers/gpu/drm/msm/msm_gem.c                  | 10 +++++++---
>  drivers/gpu/drm/msm/msm_gem_submit.c           |  9 +++++----
>  drivers/gpu/drm/msm/msm_gem_vma.c              |  8 +++++++-
>  drivers/gpu/drm/msm/msm_gpu.h                  | 11 +++++++++++
>  drivers/gpu/drm/msm/msm_iommu.c                |  5 +++++
>  15 files changed, 59 insertions(+), 43 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
