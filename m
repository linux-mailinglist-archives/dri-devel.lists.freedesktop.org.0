Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B7A41F04F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2EC6EE14;
	Fri,  1 Oct 2021 15:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CC46EE19
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:03:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v25so5351369wra.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KWmQXpLHkhyGLgFEQEFT8AbrwfuWm4NU/3P6wqUzTH8=;
 b=i1jFcfzbhpQoY5s3SBOsylE4AD6ip5tVwNR9uaRaMg9fjtImiP3DmwLmRMDSFreyer
 nFbsji3vwYbEAVouE8YZsRd/q+WXJhhNzTHcJm7VciqUpT/q0/wBprW++9tmPA7YDRf+
 0DIpT5u3FgBj/PTVMF4eaqoP/zPKEde3hyYgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KWmQXpLHkhyGLgFEQEFT8AbrwfuWm4NU/3P6wqUzTH8=;
 b=LWjNnpPqLiV6cIDHXIvx7uyILH1V3Sl4SowsvKw4470OmpqHIg1j/srcRC8QfPtp6U
 3+YIok4vQOAePcVpUoKQ0FIU8PfK5/MxEP6zCDB2Kq+b2atgTStYAoaf2xshmk5gjXDj
 RWmoDXGmbfhH2Y3hq2/O6X9qMF1C/J8cdXmAWIDdQh4/R9og30m4khJiv34v7XGHjYzf
 xN9hAbK1kf6+ZxZ8SAE7HIRDNWZBmqEj0B9Czhv5l7H4qQjhUXZYrauha5RyJ4Ea6bgh
 65WxvsiWZu28nPnAwFGboSIOuFbuM6XUWNYKMcuxORk53V/Oh0+pnR+mIC45JX16Web/
 wE+g==
X-Gm-Message-State: AOAM533dePG6VFQo7kLogImzRramU8118r4PyzB4aaH4aIl5fjdGZlLF
 BsiCLvoDT5cau4ca/7LdkeGAXQ==
X-Google-Smtp-Source: ABdhPJz3WGG2lTH8HBNLyxhI45br2zjZJ/VxzsL6MekKCDZIpSgZzvJVNdw8C/knu7gtNEFq/Topbw==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr12849639wre.387.1633100591355; 
 Fri, 01 Oct 2021 08:03:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o1sm6029547wru.91.2021.10.01.08.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:03:10 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:03:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: Re: [pull] amdgpu drm-fixes-5.15
Message-ID: <YVcjLX87xQPrXh2N@phenom.ffwll.local>
References: <20210930023013.5207-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930023013.5207-1-alexander.deucher@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 29, 2021 at 10:30:13PM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> Fixes for 5.15.
> 
> The following changes since commit 05812b971c6d605c00987750f422918589aa4486:
> 
>   Merge tag 'drm/tegra/for-5.15-rc3' of ssh://git.freedesktop.org/git/tegra/linux into drm-fixes (2021-09-28 17:08:44 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.15-2021-09-29
> 
> for you to fetch changes up to 26db706a6d77b9e184feb11725e97e53b7a89519:
> 
>   drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix (2021-09-28 14:40:27 -0400)

Pulled into drm-fixes, thanks.
-Daniel

> 
> ----------------------------------------------------------------
> amd-drm-fixes-5.15-2021-09-29:
> 
> amdgpu:
> - gart pin count fix
> - eDP flicker fix
> - GFX9 MQD fix
> - Display fixes
> - Tiling flags fix for pre-GFX9
> - SDMA resume fix for S0ix
> 
> ----------------------------------------------------------------
> Charlene Liu (1):
>       drm/amd/display: Pass PCI deviceid into DC
> 
> Hawking Zhang (1):
>       drm/amdgpu: correct initial cp_hqd_quantum for gfx9
> 
> Josip Pavic (1):
>       drm/amd/display: initialize backlight_ramping_override to false
> 
> Leslie Shi (1):
>       drm/amdgpu: fix gart.bo pin_count leak
> 
> Praful Swarnakar (1):
>       drm/amd/display: Fix Display Flicker on embedded panels
> 
> Prike Liang (1):
>       drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix
> 
> Simon Ser (1):
>       drm/amdgpu: check tiling flags when creating FB on GFX8-
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 31 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             |  2 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c            |  8 ++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c  | 15 +++++------
>  7 files changed, 53 insertions(+), 11 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
