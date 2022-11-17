Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6662D9B7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2910E58C;
	Thu, 17 Nov 2022 11:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E1810E58C;
 Thu, 17 Nov 2022 11:43:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bp15so2321214lfb.13;
 Thu, 17 Nov 2022 03:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Srd+LTqTLL/XxaJ56ZY9MBE7Pidqv2Oc/p1kAIi4H+c=;
 b=KuyqE/oktnvBhn2d6Vx0+5lgpyaZLSDWeqLdlTxxzFwkbVX0f3o7piI0TlOG2XPC5D
 vX4ciLy/22hM2XqsRnDE+m4SLsU6BlYFxZ++B9tlb6wuW72BfYzwYB5M1ZlQNVdkWI6Q
 k0BAR2hNQFKZ1v9HjYBSri28ebwtAIyWJBGOxGfprwb2Mbox0wfkIrD4+N/tQ+BR3JUn
 Kk1KDCJGPJEFqfRdSyQNm0+2MmC0JUvzooZnnsfySa2700GcY8daw2wSs3YZ7MhFaEjn
 PiKeOO66F98MfNLD/TvS7bd6c8owCZE/sC7sjqUYUGtV5XwmyNEaLvWDWVek0nZuRh2F
 M+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Srd+LTqTLL/XxaJ56ZY9MBE7Pidqv2Oc/p1kAIi4H+c=;
 b=vR13Ax+yJf/HaxNqhUIIuX7yKP6FRvRfTsINizljJ/FzYnGvUoxBKo6gStqaHpVDDI
 +krCgPzpuN8674DALddj0ldNa9iFsnxoaTwOc4oOlZe3y77/H7RwB4oeipluxqjufYhv
 BTEeXEEInLnL+Nn70R68X7dOKNzMYlP/sCWLkeuS4nSViTeemhz761OiScjLwp0r8EhO
 9S/pz7plQt7AUJ/33QHcZSVHeEuEFa8PI1XJNq/+/rjvM7kJESgIK/dP2lZG9zJrg9b6
 VmtNq88REyrLmeIh1ddL5we6rxeuaWz0GC0huIcU75SbGXVSmDy6LKIp3gJgnh9qbTyR
 Zczg==
X-Gm-Message-State: ANoB5pnK4xoKkciqvXXImCJdLC4rr36Vue2MW3vLPPlgkIX49QaAmXos
 DrZwSRZM//K2FL7y4Df0DhfmHoYsS3Eld3o3OR4=
X-Google-Smtp-Source: AA0mqf7p3oLCVwVWQh8RvQHsy4BwjtCYwSLrhE758CTwYX/+Uv2S3I/we02HA5THFPcGzBLRBIoRfxqRaIiEoJ2dG7w=
X-Received: by 2002:a05:6512:1051:b0:4b0:a51e:2b3 with SMTP id
 c17-20020a056512105100b004b0a51e02b3mr866724lfb.636.1668685412679; Thu, 17
 Nov 2022 03:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20221013084007.19843-1-nirmoy.das@intel.com>
In-Reply-To: <20221013084007.19843-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 17 Nov 2022 11:43:05 +0000
Message-ID: <CAM0jSHM_o9nbPmvfqiJxa2xOYfAerHNsfoGspTvMHZX5CtLavw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
To: Nirmoy Das <nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Oct 2022 at 09:40, Nirmoy Das <nirmoy.das@intel.com> wrote:
>
> Add a function for ratelimitted debug print.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  include/drm/drm_print.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 22fabdeed297..1e2e26378570 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -562,6 +562,9 @@ void __drm_err(const char *format, ...);
>                 drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);       \
>  })
>
> +#define drm_dbg_ratelimited(drm, fmt, ...) \
> +       __DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
> +
>  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>         __DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>
> --
> 2.37.3
>
