Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822ACAC65C6
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94C310E5CA;
	Wed, 28 May 2025 09:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YJe7Ng9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFBA10E5CA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:24:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-442ea341570so30936735e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748424267; x=1749029067; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eTrQh9g5BCCMkWrTK1ykKREPEZGbfPx4fWWA5+zWO+g=;
 b=YJe7Ng9HfAWkjCLAG8/nDZNta9Y917L3B6lCL4pAP8vfjUthiCJJT+nUQa5CrqBVWg
 7OViiJSDSu55f+CYgMYuXDvv39po4RiiUyMCUs3lDCd0ACakmhktXPc2jNLOhrB/NJ6H
 AWpyu4BG1WSsc58i2QNuFDGktmIfe4wTzlEfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748424267; x=1749029067;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eTrQh9g5BCCMkWrTK1ykKREPEZGbfPx4fWWA5+zWO+g=;
 b=JMSPMZCmIyLp37CSg16a2XM9l9K1MfMmLhvJYluAtRu3UIRkKFzNddxSJsRkOgPNJW
 aMDXoRLJssHvgmlvMuEwlOBw5cBiThw/qSDzovNeNowq/oIsnEOosIMNN7Ed66fr/YAs
 JT2MLn7t32FLV/dWCKJYVG2sIO1w6yWO+Ky28WgehzNeh3x+Ow9673rjhbJRv2hHpsJd
 aAHs6XfMV6+6v4TKwKgmCZzE4QLlfnx4f/SLaDCaOsH1o1ga75yK0k2flv2rHwXMEa9B
 VWxZD+oFKtGidV6rMwgbmgIXGpy2h3xWvZRFv6xHdiGu5AxSmZAwZmtE8mS8222pB1+0
 TtZg==
X-Gm-Message-State: AOJu0YyFK/gyB+RabjchAs1T8EdwBmZbHrOoZeDDrJdl7/CKZxX+1sNJ
 xooAggpEir7vMqSxFY8JiYjiY/H3K8c2iP7KXWz0hmG7Yd9o66Gwe4oOfCvzIqs/wUMw0BN4Stv
 0pokz
X-Gm-Gg: ASbGnctHXdjwf+MOil+fskOgVlCNn3YQgiQ9YsUGgufC1l0+VjuVkZz1QWmhVL9jMFO
 rUOmz+px+qPMGlNtFhhFUyYiWWPK7isR7fFK10NEc/UqkIFSsJMuV7skVFGnbejtKnDRADXMM6t
 IDFC8v4RYpYyCvQVJqD7TelktjJGJPGsjQlg8m6a1Erf8UYh3JdlHj12Ze366ATwmtpkvvebhkj
 kGgC3TGfi0cA7UhEKmbnmvrUtN2B2xE2MJEtAY4MEespr37w4VjWrE4NzdukAwBF9Fm/MtYJxaf
 W1Tq+kEAbRohRVLsvZFSaMsT/DBgQ6X0H+6KSdH119RtftFDhJMzeY+Md1vtrWY=
X-Google-Smtp-Source: AGHT+IEeduBJMqQLdTJjiJSw02+TAnnvGs6wApk3JX5opMeqkdwXgt5TrvlQeENkiE/Dkg3wcdtZ/A==
X-Received: by 2002:a05:600c:6296:b0:440:6a79:6df0 with SMTP id
 5b1f17b1804b1-44c9493e347mr129041885e9.22.1748424267530; 
 Wed, 28 May 2025 02:24:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45006499b3dsm15355915e9.8.2025.05.28.02.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:24:27 -0700 (PDT)
Date: Wed, 28 May 2025 11:24:25 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 8/8] drm/xe: Add comments about drm_file.object_idr issues
Message-ID: <aDbWSawqZfOonYer@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-9-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528091307.1894940-9-simona.vetter@ffwll.ch>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 11:13:06AM +0200, Simona Vetter wrote:
> idr_for_each_entry() is fine, but will prematurely terminate on
> transient NULL entries. It should be switched over to idr_for_each,
> which allows you to handle this explicitly.
> 
> Note that transient NULL pointers in drm_file.object_idr have been a
> thing since f6cd7daecff5 ("drm: Release driver references to handle
> before making it available again"), this is a really old issue.
> 
> Since it's just a premature loop terminate the impact should be fairly
> benign, at least for any debugfs or fdinfo code.
> 
> On top of that this code also drops the drm_file.table_lock lock while
> iterating, which can mess up the iterator state. And that's actually
> bad.

So I re-read idr_get_next and all that, and I think it should be all fine
- it handles both NULL entries and I think does recover from simply the
most recent id. Might miss some that have been concurrently added, but
that should be fine.

Sorry for the noise.
-Sima

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 31f688e953d7..2542f265a221 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -205,6 +205,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Public objects. */
>  	spin_lock(&file->table_lock);
> +	/* FIXME: Use idr_for_each to handle transient NULL pointers */
>  	idr_for_each_entry(&file->object_idr, obj, id) {
>  		struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> @@ -213,6 +214,8 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  			xe_bo_unlock(bo);
>  		} else {
>  			xe_bo_get(bo);
> +			/* FIXME: dropping the lock can mess the idr iterator
> +			 * state up */
>  			spin_unlock(&file->table_lock);
>  
>  			xe_bo_lock(bo, false);
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
