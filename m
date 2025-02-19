Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963CBA3BFC5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C69510E7F2;
	Wed, 19 Feb 2025 13:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BEmNPkw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB8510E2F6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:24:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4399deda4bfso3575555e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739971446; x=1740576246; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k6cGsw4jqrcJ6wKuFhhp6XRGQKCyudNO1D27r9k9Kyk=;
 b=BEmNPkw0enM8QDNUaet2iefWpa012XKO8GQTqjhSp3BPrFAParzJbJWKsYZGf/DM2j
 wTZCp7Qj9+X3CWj868UYZ8uMgrG4YnffrLDv4+oFrgL/5FoJjwa3NjCyAOu8yywOB7Zr
 qZytJhkMKOU4DKrW8zF2Y/ufgIqhpenbyqotw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739971446; x=1740576246;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6cGsw4jqrcJ6wKuFhhp6XRGQKCyudNO1D27r9k9Kyk=;
 b=odvOFZBr/gPFfkeCwXIqUY5DUskKKXsCH1z40gdBcFEjzArKoWfSHIN429wqIWDYIb
 M4Cgr437ABCc1KmTWs/L+2iuUUlqcSPwiLG6ETxZcEsu+M/eQb+E8tzZ+EDCdNb8jyIF
 7Ov3TP0kKG0ul1ksuBc0At01FeovBklVjpxYHXREawAyeWOEpBhNxRC6iW1WvWZUOhjx
 saPp5MezieqjbzjhfDCKrLJ4RzuQIe/soRlSGvDLTaX7uaLAYdJLwGp1w7Y/IVgkcdtj
 eZVdinq+okZrpRqyTAUvYc9UWDIhWdKw+sA+twxkubqH6lRVVbCxe5bxdlSZ2BILWyZo
 kaBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVNo86au+Cw9nooRvTXp6BQKmMtULspdBTQUHJIuikGzuFg6/W13UvTIYAQXWn2bWbqIei2deRaIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvKsbzygbDfp4ZaX0YsYUNmGS5Pirt/v/KxuZCtUoyjN2VJDdD
 5WafokdyMk04UWwYVJSKQrNOJHuVMAiwDsFQ6aYldD5vPeh2lVvvyGBvM6vITt8=
X-Gm-Gg: ASbGncvgmuef6WG8Szm6+n/VaKik6yF9hbEwXciAvfqJ3i0mcJawau3LIWT8QOHGyOW
 kY1tbt+ZBqoCUKlHP/Y/HmwFVwRjm+SjkvhDcabbY/8iz5RSuaT70+WoLDI/+ysdevrsSisQkqG
 lsD5ArCX5evgAV6ajwkjrMdQqgMoHkLK4HuN8qXAyQH6vbhhIMj6wTHRmEkNhlDbkVt5EKZZCOZ
 GBbIRFjZo4uuSx7bfTzq6X7ET9o1XCjSzXs+4raMPLtLZqjduSU+2xM1VIdJ1GqhzXVFZHl4NsF
 Fe7jJfHXF3y8opWkp0mvy4eI6qk=
X-Google-Smtp-Source: AGHT+IEMkiRLE303PY2VGK8dIbQqcHCo9kxRkhxSrS/G0HEqk/Ff0iwNgVtV9uMGa6/lqXwbklDsqg==
X-Received: by 2002:adf:cc8f:0:b0:38f:31fe:6d37 with SMTP id
 ffacd0b85a97d-38f33f4e465mr15485877f8f.44.1739971445945; 
 Wed, 19 Feb 2025 05:24:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f2591570esm18080577f8f.59.2025.02.19.05.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:24:05 -0800 (PST)
Date: Wed, 19 Feb 2025 14:24:03 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 cgroups@vger.kernel.org
Subject: Re: [PULL] dmem cgroup
Message-ID: <Z7Xbc2vkFejhZSFS@phenom.ffwll.local>
References: <20250106-shaggy-solid-dogfish-e88ebc@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-shaggy-solid-dogfish-e88ebc@houat>
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

On Mon, Jan 06, 2025 at 05:49:19PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's a drm-next PR for the new "dmem" cgroup Maarten and I worked on.
> Given that it's only user for now is DRM, Tejun agreed to merge it
> through DRM.
> 
> This is based on the series sent by Maarten here:
> https://lore.kernel.org/all/20241204134410.1161769-1-dev@lankhorst.se/
> 
> The three last patches are not part of it, for different reasons:
> 
>   - patch 5: we haven't had the acks from the amdgpu maintainers
>   - patch 6: I didn't feel comfortable merging a patch defined as a "hack"
>   - patch 7: it's not clear yet how GEM is going to be supported, so we
>     need to have further discussion on this one.

Already discussed on irc, but I guess time to add a MAINTAINERS entry for
dmem so dri-devel gets cc'ed and we just managed it through drm-misc?
Tejun and cgroups folks overall will still get cc'ed, but it sounds like
this is the approach Tejun prefers?

Cheers, Sima

> 
> Thanks!
> Maxime
> 
> The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:
> 
>   Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git cgroup-dmem-drm
> 
> for you to fetch changes up to aa4f9d7f77836d5a48daaa99479c2603e9a548ed:
> 
>   drm/xe: Implement cgroup for vram (2025-01-06 17:25:36 +0100)
> 
> ----------------------------------------------------------------
> Maarten Lankhorst (3):
>       kernel/cgroup: Add "dmem" memory accounting cgroup
>       drm/ttm: Handle cgroup based eviction in TTM
>       drm/xe: Implement cgroup for vram
> 
> Maxime Ripard (1):
>       drm/drv: Add drmm managed registration helper for dmem cgroups.
> 
>  Documentation/admin-guide/cgroup-v2.rst          |  58 +-
>  Documentation/core-api/cgroup.rst                |   9 +
>  Documentation/core-api/index.rst                 |   1 +
>  Documentation/gpu/drm-compute.rst                |  54 ++
>  drivers/gpu/drm/drm_drv.c                        |  32 +
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c          |  18 +-
>  drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c |   4 +-
>  drivers/gpu/drm/ttm/tests/ttm_resource_test.c    |   2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                     |  54 +-
>  drivers/gpu/drm/ttm/ttm_resource.c               |  23 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c             |   8 +
>  include/drm/drm_drv.h                            |   5 +
>  include/drm/ttm/ttm_resource.h                   |  12 +-
>  include/linux/cgroup_dmem.h                      |  66 ++
>  include/linux/cgroup_subsys.h                    |   4 +
>  include/linux/page_counter.h                     |   2 +-
>  init/Kconfig                                     |  10 +
>  kernel/cgroup/Makefile                           |   1 +
>  kernel/cgroup/dmem.c                             | 861 +++++++++++++++++++++++
>  mm/page_counter.c                                |   4 +-
>  20 files changed, 1195 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/core-api/cgroup.rst
>  create mode 100644 Documentation/gpu/drm-compute.rst
>  create mode 100644 include/linux/cgroup_dmem.h
>  create mode 100644 kernel/cgroup/dmem.c



-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
