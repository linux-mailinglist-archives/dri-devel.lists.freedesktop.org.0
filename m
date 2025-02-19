Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73017A3C09B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F7710E803;
	Wed, 19 Feb 2025 13:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jS+qh9w5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5823810E7FC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:53:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so5491275e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739973195; x=1740577995; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FyEka5hJeoXHg0os4K6Y2PLLWFiuCF9r77npcdvsS+8=;
 b=jS+qh9w5X+Ye5jNFASHtCHUYSw11p/biOBFy8EMYccejGvBuqKVr63q97cK3id4yCC
 tIYp9PWeZCoLFqyDa7SP1vme1swO11MzT0XpXDE54g+ALoXTzod6zH1B2PXwOWzKypP6
 1iEbYC1+HRWNp5ooViv6Zl1nZz542OOcQfCts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739973195; x=1740577995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FyEka5hJeoXHg0os4K6Y2PLLWFiuCF9r77npcdvsS+8=;
 b=uy82ILKsTL/9xtorobawLqAl1ufBhRuwq/7y8cl9tdnqWFsGEdoNqDq87ZxhOP+bvP
 xIuxeYGR1x8S/wSNmQNjNrPt1c/D5pFf8z5axqglHPB/vt7VuKPHBC0ZhUZ304OvcSc6
 ItW7Te5L/3zc/FoUcpB9FXdhq6Gbn7bGurq0Z02E1PmdG1e6VK5HNyn/3BYRkC5q/5ZN
 aC4kbljnDnfvVyFzM2xORqZ4ACPj0LiiyccVIzRaqbxTclyCmv1cnhVvYOm510UcoOW6
 3pV7pK2zZ9cMMyeTP2L8V7gZahgPkf6WyWDKOwe+6efMnxLdKe2+vpU3QMIM2bEW9bwi
 I8RQ==
X-Gm-Message-State: AOJu0YyNjb5a+OBqKAyO8GQAOExhwBXorc2ZFE38YkkTZ2AWMvRTXKjg
 eh1z72pwpY0KlI3lzwKsLYVRL5BhaxBY3bT3X/iLeuX0Hop68cRPS/qtmqoxVawCusxCW48dIsk
 p
X-Gm-Gg: ASbGncu/EhET6WSXy0xrA9xBN/YeJ9JHag/kTYxDI3TNKqU5B4QBl2txEHqxXgxqXJp
 tq/TyvINOv/revlh8iO7aAmcgooyMtaSGAbYALBN6PJbl4Klax1ZhuvdrH5g3/v/xuedMkvIGw0
 KZ9WfvBB9EaSxiPW6fSjQCViP9OWT3YfmqbDHTnegYGzK0VP2SnIEhxpH2FaBx1NSL3N2lVMNhV
 1CVzclgdChMCaYWR9V9ZG/VJNQ9DJYSznTmlmVW+XkSNJDzZbn6emDVfXUQtD03+YZ+kwAwOe8S
 VqMcwNceZByrK4ypHwiDicy8g9k=
X-Google-Smtp-Source: AGHT+IHhxL7NdXguAsHBVaP1UvYcb8rpQV9UAn0iPu3pZhbjhRGsonzEzPwRA956d+9JVoraHQ0pbA==
X-Received: by 2002:a5d:47c6:0:b0:38b:d807:f3be with SMTP id
 ffacd0b85a97d-38f57bd9182mr3175939f8f.3.1739973194736; 
 Wed, 19 Feb 2025 05:53:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5923sm18084914f8f.74.2025.02.19.05.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:53:14 -0800 (PST)
Date: Wed, 19 Feb 2025 14:53:12 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, chaitanya.kumar.borah@intel.com,
 Naveen Kumar <naveen1.kumar@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v6 0/3] Expose modifiers/formats supported by async flips
Message-ID: <Z7XiSGwsPntwP7bd@phenom.ffwll.local>
References: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Feb 19, 2025 at 02:47:22PM +0530, Arun R Murthy wrote:
> All of the formats/modifiers supported by the plane during synchronous
> flips are nor supported by asynchronous flips. The formats/modifiers
> exposed to user by IN_FORMATS exposes all formats/modifiers supported by
> plane and this list varies for async flips. If the async flip supported
> formats/modifiers are exposed to the user, user based on this list can
> take decision to proceed or not and avoid flip failures during async
> flips.
> Discussion around this can be located @
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123
> Userspace implementation for IN_FORMARTS_ASYNC under review @
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
> 
> TODO: Upon merge of the patch related to async flip
> https://patchwork.freedesktop.org/patch/626849/?series=139807&rev=6
> the patch 5 in this series will have to make use of the new function
> pointer can_async_flip().
> 
> v3: Add new plane->funcs format_mod_supported_async (Ville)
> 
> Arun R Murthy (3):
>   drm/plane: Add new plane property IN_FORMATS_ASYNC
>   drm/plane: Expose function to create format/modifier blob
>   drm/i915/display: Populate list of async supported formats/modifiers

Somewhat orthogonal, but in a different atomic kms discussion the much
bigger question of what are compositors supposed to figure out with
TEST_ONLY and what are they supposed to figure out through special
properties cropped up. Might be really good to document that, so that we
can have some design consistency here.

I think this patch series should also document why we need this and
compositors can't figure this out on their own, ideally by linking/quoting
the relevant discussions in the compositor enabling PR.

Thanks, Sima

> 
>  drivers/gpu/drm/drm_mode_config.c             |  7 +++
>  drivers/gpu/drm/drm_plane.c                   | 50 ++++++++++++------
>  .../drm/i915/display/skl_universal_plane.c    | 51 +++++++++++++++++++
>  include/drm/drm_mode_config.h                 |  6 +++
>  include/drm/drm_plane.h                       |  4 ++
>  5 files changed, 103 insertions(+), 15 deletions(-)
> 
> --
> 2.25.1
> 
> ---
> Arun R Murthy (5):
>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>       drm/plane: Expose function to create format/modifier blob
>       drm/plane: Function to check async supported modifier/format
>       drm/i915/display: Populate list of async supported formats/modifiers
>       drm/i915/display: Add function for format_mod_supported_async
> 
>  drivers/gpu/drm/drm_mode_config.c                  |   7 ++
>  drivers/gpu/drm/drm_plane.c                        |  72 +++++++++----
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 113 ++++++++++++++++++---
>  include/drm/drm_mode_config.h                      |   6 ++
>  include/drm/drm_plane.h                            |  24 +++++
>  5 files changed, 188 insertions(+), 34 deletions(-)
> ---
> base-commit: 08bd590935a5258ffd79355c59adffd72fb2c642
> change-id: 20250102-asyn-bf76730501cc
> 
> Best regards,
> --
> Arun R Murthy <arun.r.murthy@intel.com>
> 
> ---
> Changes in v6:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v5: https://lore.kernel.org/r/20250218-asyn-v5-0-7ac5ac4abd4a@intel.com
> 
> ---
> Arun R Murthy (3):
>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>       drm/plane: modify create_in_formats to accommodate async
>       drm/i915/display: Add i915 hook for format_mod_supported_async
> 
>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
>  drivers/gpu/drm/drm_plane.c                        | 53 +++++++++++++++-----
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
>  include/drm/drm_mode_config.h                      |  6 +++
>  include/drm/drm_plane.h                            | 17 +++++++
>  5 files changed, 112 insertions(+), 27 deletions(-)
> ---
> base-commit: bc7a84cbc968ce97e581e9e3c2d26fb0ac106482
> change-id: 20250102-asyn-bf76730501cc
> 
> Best regards,
> -- 
> Arun R Murthy <arun.r.murthy@intel.com>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
