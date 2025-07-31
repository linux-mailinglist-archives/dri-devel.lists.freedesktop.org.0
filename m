Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E0B17064
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 13:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D2E10E77F;
	Thu, 31 Jul 2025 11:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="GKkWobGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CBE10E776;
 Thu, 31 Jul 2025 11:32:22 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 8D51F33B04D;
 Thu, 31 Jul 2025 12:32:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1753961541; bh=XAS/4qXM24hKKERbo9u9vaqK7dhA946UtwGIRYc1Qxs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GKkWobGPmyESTC+RdugnWTJpBQbzhhVIO8FYejYW2TXpOfl3NR8GfgRGD0VizvO6Z
 ot7EscSe4RntzsTAQsRr8lQG1RVjgNN9RWBVt6QrcWj79Mx1ErGuEa6VFkd4XNfhdZ
 GPUH+I2QigK5r648fr6hmWqwZNqbx8ELcTgrMDak/xDKsv8uvctyAwmzLsWEXqAkS/
 zRlHGFSw3+uxeQs+V5P54KBcRMwn22x/J3/hJ96AsGXdR9yeOdsW508b/xIvhjsMlr
 4EIjb7roM47Hmi8tYN12dtmljmbEcJGUK4/Kezo5gIHzMC7qPtC9VmfJHCCnr+RzqR
 G0rnKGj39VggA==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so143563766b.3; 
 Thu, 31 Jul 2025 04:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8OUnSAj3jic7PLoz9BiCJR3by184fjldbDGDbi4mRJP08XPEnwD9eEWlBJ181jsNY5sml1oV3G2k=@lists.freedesktop.org,
 AJvYcCWuBWbpUYsD1prdjZCDB/+V5OaZZLJtm5INStUvT+9e1QefbJdxlN4UXFjxVBJ9X/c8CjCENKLXe1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLjtabPeuzh6wAre8NQZpj807DAJ5NlEdpNL5YQVtS22/Qub32
 w/BJ/vRJHE7GC0m6HcH0ZIySnNCAaGTERmfaJacNIxYd2wuvIQEPpu0Pts2Wo/6b1hxnUuQLckl
 S2uI2Z1mzi8Ms1Htpq4MfqJk/KbO2d04=
X-Google-Smtp-Source: AGHT+IEPio9VzBrQ7Sy5U1x60dlAcQA+EEeZtHODUL5N9ynbirVa9jO12ddrXuPZY5/kRNi4EQlY6nsOLmOwqqUBTQM=
X-Received: by 2002:a17:906:af13:b0:af9:1062:3dd6 with SMTP id
 a640c23a62f3a-af910623fecmr352340466b.17.1753961541062; Thu, 31 Jul 2025
 04:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
 <20250730-atomic-v2-1-cc02ce0263dd@intel.com>
In-Reply-To: <20250730-atomic-v2-1-cc02ce0263dd@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 31 Jul 2025 13:32:09 +0200
X-Gmail-Original-Message-ID: <CAFZQkGzUjv761X+A0ctwhxvpFmqHwSMFbAEhurixo20w6Sxhvw@mail.gmail.com>
X-Gm-Features: Ac12FXzYTRxakijVE81GzzfV3ifW84-QC6J7spdaBUpRbb2AtWcXGiO0YUAgEfc
Message-ID: <CAFZQkGzUjv761X+A0ctwhxvpFmqHwSMFbAEhurixo20w6Sxhvw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com, 
 uma.shankar@intel.com, harry.wentland@amd.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mi., 30. Juli 2025 um 12:36 Uhr schrieb Arun R Murthy
<arun.r.murthy@intel.com>:
>
> There can be multiple reasons for a failure in atomic_ioctl. Most often
> in these error conditions -EINVAL is returned. User/Compositor would
> have to blindly take a call on failure of this ioctl so as to use
> ALLOW_MODESET or any. It would be good if user/compositor gets a
> readable error code on failure so they can take proper corrections in
> the next commit.
> The struct drm_mode_atomic is being passed by the user/compositor which
> holds the properties for modeset/flip. Reusing the same struct for
> returning the error code in case of failure can save by creating a new
> uapi/interface for returning the error code.
> The element 'reserved' in the struct drm_mode_atomic is used for
> returning the user readable error code.Its a 64bit variable and
> should suffice 64 error codes that should be sufficient.
Hi, and thanks for working on this. Harry already mentioned what we
discussed at the hackfest, so I won't repeat that again :)

> +/* atomic not set in the drm_file */
> +#define DRM_MODE_ATOMIC_CAP_NOT_ENABLED                        BIT(0)
> +/* atomic flag passed not in DRM_MODE_ATOMIC_FLAGS list */
> +#define DRM_MODE_ATOMIC_INVALID_FLAG                   BIT(1)
> +/* DRM_MODE_PAGE_FLIP_LEGACY not supported with atomic ioctl  */
This should be DRM_MODE_PAGE_FLIP_ASYNC I think?
> +#define DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC                        BIT(2)
> +/* flip event with atomic check only not supported */
> +#define DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY      BIT(3)
> +/* atomic property change requested need full crtc modeset */
> +#define DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET         BIT(4)
> +/* atomic property change requested has impact on all connected crtc */
> +#define DRM_MODE_ATOMIC_NEED_FULL_MODESET              BIT(5)
> +/* async flip supported on only primary plane */
> +#define DRM_MODE_ATOMIC_ASYNC_NOT_PRIMARY              BIT(6)
This is a bit limiting when some but not all non-primary planes support async.
> +/* modifier not supported by async flip */
> +#define DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED   BIT(7)
> +/* async flip with pipe joiner not allowed */
> +#define DRM_MODE_ATOMIC_ASYNC_PIPEJOINER_NOTALLOWED    BIT(8)
I feel like this error is a bit too specific, or at least it needs
some more explanation - what will compositors do with it?

In general I want to mention that some of these errors are pretty
specific and not actionable for compositor code. Ideally the enum
would just be more generic things like
- invalid API usage
- needs modeset
- plane can't do async
- format/modifier can't do async (though with IN_FORMATS_ASYNC it's
kind of just "invalid API usage")
- scanout bandwidth
- connector bandwidth
- memory domain
- scanin bandwidth

which (except for "invalid API usage") compositor code can
automatically do something about, and the string that's passed to the
compositor can give more information for debugging and logging.

- Xaver
