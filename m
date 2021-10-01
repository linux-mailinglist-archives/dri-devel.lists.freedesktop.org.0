Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A0341F281
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CFF6E52C;
	Fri,  1 Oct 2021 16:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83876E52C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:51:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v17so16436233wrv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aWc04FVFbnD+y7yRpbWGtfVv1ySLSPX/fcKqMjm+70A=;
 b=bPqlDe4wsW8lHXd/0s10l2Io6hrThjzp4TnGqp9iiUwYX6JjL/attmbSCl7A9FhxWO
 NOYHGLS2T4cNLD71i6K2ag9GcSlVLRFeOxVASsyN4owZR4M1RwcTDUIBE30onAU0YMiS
 vyaAMDZ9EVFl7Y2uvHoSxdVTGQoERu3cu/+z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aWc04FVFbnD+y7yRpbWGtfVv1ySLSPX/fcKqMjm+70A=;
 b=p8+hkfInZFOSSSlk5npSdQsg0hTRyEErRG3zkPQoBx7gxYs2zKFZHu0G1zuVlNwbMI
 4GdGF3B5ffZuUR+lw0IVLI970LBP34oIZzt6Zr50UXzc0rXyG4ib0Y6f4MtW+6qX4Y9S
 fJGwEfDNL9+XxeVrX1dctO3bAPdNcJtT4u3JTZNNTUKMtw3j2YgbYhGfzuVjrouRCMZd
 ggspm6MqCm8IgjrFbiiuwXzgQqP0Zu0pucp41WN9J8Dr6caq2dOJm8NhV62mFMkTW9ho
 9x0Z1eSG/4zfXA/t7RMtKae52oAn6gC4XthoIY5a/iKFO7DyFRBHI1m/l9UqjPC3rfS9
 J05g==
X-Gm-Message-State: AOAM533IoWc2nPdkawrFmMRU8x/ECJPdEmkgRsMuTrPr/U6cZUw2orxb
 GCKX2mT0EfwwgF3vv/QiKhltsQ==
X-Google-Smtp-Source: ABdhPJwI4mtzsvYvvWE8R9a1y2Vo044CIzcQjA4RApUgW8v+gnQdNMp1eCx9WzsusQHO7YqVi3/Xjw==
X-Received: by 2002:a5d:4243:: with SMTP id s3mr14706090wrr.216.1633107072172; 
 Fri, 01 Oct 2021 09:51:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k17sm8401523wmj.0.2021.10.01.09.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 09:51:11 -0700 (PDT)
Date: Fri, 1 Oct 2021 18:51:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL] exynos-drm-fixes
Message-ID: <YVc8fXoVf0gMlT2V@phenom.ffwll.local>
References: <20210928074158.2942-1-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928074158.2942-1-inki.dae@samsung.com>
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

On Tue, Sep 28, 2021 at 04:41:58PM +0900, Inki Dae wrote:
> Hi Dave,
> 
>    Just one clean up to use helper function.
> 
> Please kindly let me know if there is any problem.
> 
> Thanks,
> Inki Dae
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.15-rc4
> 
> for you to fetch changes up to 17ac76e050c51497e75871a43aa3328ba54cdafd:
> 
>   drm/exynos: Make use of the helper function devm_platform_ioremap_resource() (2021-09-16 14:05:07 +0900)
> 
> ----------------------------------------------------------------
> One cleanup
> - Use devm_platform_ioremap_resource() helper function instead of old
>   one.

Pulled into drm-fixes, thanks.
-Daniel

> 
> ----------------------------------------------------------------
> Cai Huoqing (1):
>       drm/exynos: Make use of the helper function devm_platform_ioremap_resource()
> 
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 5 +----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 5 +----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 +-----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 4 +---
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 4 +---
>  9 files changed, 9 insertions(+), 31 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
