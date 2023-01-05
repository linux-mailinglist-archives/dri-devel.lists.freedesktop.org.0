Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDBD65EAE2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C0D10E6FE;
	Thu,  5 Jan 2023 12:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2806910E709
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:46:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id ja17so27912705wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9xXl14PCVE29MkdwtvkTcX1xvCBJefYJ2FTCbbS6Hg=;
 b=gq3PmjMXQdLNMZ10lm5bQgk7hLavAgr9iaWM9vrmdnielcaJg2rcuS1cxhOVSwFG6w
 bRQHl3cYv6lKMHB1Oc+xUNZb49/kNEivUcnofGo2rEnDqWVo0eBcuzi81FRQ5OyiTE/g
 RTB2v0vp6J8deZTYchJKVbyBORcSHn2TG6yps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9xXl14PCVE29MkdwtvkTcX1xvCBJefYJ2FTCbbS6Hg=;
 b=Lk4a5QeTPS28DchILiBrCMwQUMBZJDrCMVgLNfXA6dCQQOd487UD2rht/xN44vw5pX
 PiWFZyrzStWLUn3kcxZSMLSsTwDXcOLWJ7uI17lRi+cVxNRi0eUqzTshYF7tNH8mepGI
 YjGTilc1T1QxPp3CSuh94qcBPS5rEC2P0jvbxpwSJrouDnEBnw4mLjjRuvJaIbyj+HiO
 uq2nsbbK5b8w3AriHS+4ZZfb5AMEL+IuW3M36W7q0ncwNJgQXcHjehns62MhkKLwxN4O
 HEOrM1O2w/h9Sn700bpo2pypfh9qJ8R4ZnuLq424PWh48OI4rIdtiVgSUidcH6Hn1vTM
 WRvA==
X-Gm-Message-State: AFqh2kq5rjCowqnZkG8dRER59T1rVZzptdO2VXoqWl3lQM4gLOFEOnuW
 1HZ5yAewPSIfKDFhouPBRanVtQ==
X-Google-Smtp-Source: AMrXdXuqSw1FVHs5PwiAM9n3YvkppTDiHVB/7BeoCZ4NppJTjmSCLUJB1wIJqtttsELRlIeBuBA0+Q==
X-Received: by 2002:a05:600c:510b:b0:3d2:392e:905f with SMTP id
 o11-20020a05600c510b00b003d2392e905fmr37059958wms.24.1672922763553; 
 Thu, 05 Jan 2023 04:46:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c4d1200b003c21ba7d7d6sm2131795wmp.44.2023.01.05.04.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:46:02 -0800 (PST)
Date: Thu, 5 Jan 2023 13:46:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH 2/2] drm_print: fix stale macro-name in comment
Message-ID: <Y7bGiLRanR3Y7tXM@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org,
 robdclark@gmail.com
References: <20221205161005.222274-1-jim.cromie@gmail.com>
 <20221205161005.222274-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205161005.222274-3-jim.cromie@gmail.com>
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
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 05, 2022 at 09:10:05AM -0700, Jim Cromie wrote:
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

What's the status of this series?

Greg, you landed the original entire pile that wasn't quite ready yet? Or
should I apply these two?
-Daniel

> ---
> . emphasize ABI non-change despite enum val change - Jani Nikula
> . reorder to back of patchset to follow API name changes.
> ---
>  include/drm/drm_print.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a44fb7ef257f..e4c0c7e6d49d 100644
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
