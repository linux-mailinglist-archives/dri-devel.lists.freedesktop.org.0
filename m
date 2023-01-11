Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C056666EB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 00:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AA410E837;
	Wed, 11 Jan 2023 23:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0C010E839
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 23:02:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso15401384wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5DAHiUXNSqP8lsMat4V7Y9pDYdgiNXYeg0YIR9t8tw=;
 b=ijgJVYN6mmNTbTPFO5OqRoZJG72dUQWCDuNXxKwYGwTa0H+jMvm9BpIyRHatxnCL+G
 H98LSjPJpsNaGcsjI/aze5PgnnoHRW8kyHFa6VjVASmpy7N+Pq2lh2SPkWtTXdQsZZVJ
 4IHyqrcso5C29wuZwnx/ROG5bnhHvvZpFV+r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5DAHiUXNSqP8lsMat4V7Y9pDYdgiNXYeg0YIR9t8tw=;
 b=3LX9INojdWZSIA9vgJlGLZQmGODp+J8W8pNgqMKt3C+UdWqHAVwtiXxD8Si+4pv9rI
 E/dg9rMwfaz4raXWKgxzX5jYUDp/0hmTy3M7qmNk6uX/aR4rTeZO15vK8nY8D+1E9kIJ
 gCIplfiM3z7dgOty0QDz1SW+rEOcoQmN2IJvp/UzihmlLtBLqRrKDCe7ihVvf5k237uY
 uWSxm7j9K8pj4rPSvVsPVLXs8T6Sxdf50/7GydfUyEzlJZrtopfokfyV8YsSlcT7u+o3
 LH5lvqInSSaprZYWjuiO+CpordmzAvshAnzB3WpRA409W8dPegwaAR3ke9Zn5H2CDs4E
 lDyQ==
X-Gm-Message-State: AFqh2kr4gGr9fHMYluS7mQjdIGW8fxLfXgB0e5RDHkESfmjXzYlPlwHK
 wx397AVw/raxEXQQmvPgvnTx6g==
X-Google-Smtp-Source: AMrXdXu42yEstUzQrpMN6ziaFxtpQwABY5sjgNZ43ZWdGx9iwmPJ1+C7GDfu3P+KAaFELhdK5tZrJg==
X-Received: by 2002:a05:600c:3d91:b0:3d9:103d:9078 with SMTP id
 bi17-20020a05600c3d9100b003d9103d9078mr52671943wmb.22.1673478155135; 
 Wed, 11 Jan 2023 15:02:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003d9b89a39b2sm22004350wms.10.2023.01.11.15.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 15:02:34 -0800 (PST)
Date: Thu, 12 Jan 2023 00:02:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [RFC PATCH 13/17] drm_print: fix stale macro-name in comment
Message-ID: <Y79ACEDu4ePaWMQr@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org,
 robdclark@gmail.com, jbaron@akamai.com, gregkh@linuxfoundation.org
References: <20221206003424.592078-1-jim.cromie@gmail.com>
 <20221206003424.592078-14-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206003424.592078-14-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, jbaron@akamai.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 05, 2022 at 05:34:20PM -0700, Jim Cromie wrote:
> Cited commit uses stale macro name, fix this, and explain better.
> 
> When DRM_USE_DYNAMIC_DEBUG=y, DYNDBG_CLASSMAP_DEFINE() maps DRM_UT_*
> onto BITs in drm.debug.  This still uses enum drm_debug_category, but
> it is somewhat indirect, with the ordered set of DRM_UT_* enum-vals.
> This requires that the macro args: DRM_UT_* list must be kept in sync
> and in order.
> 
> Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Should I land this already?
-Daniel

> ---
> . emphasize ABI non-change despite enum val change - Jani Nikula
> . reorder to back of patchset to follow API name changes.
> ---
>  include/drm/drm_print.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 6a27e8f26770..7695ba31b3a4 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -276,7 +276,10 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *
>   */
>  enum drm_debug_category {
> -	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
> +	/*
> +	 * Keep DYNDBG_CLASSMAP_DEFINE args in sync with changes here,
> +	 * the enum-values define BIT()s in drm.debug, so are ABI.
> +	 */
>  	/**
>  	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
>  	 * drm_memory.c, ...
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
