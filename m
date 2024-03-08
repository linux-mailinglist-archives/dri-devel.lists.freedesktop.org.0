Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B1F8769C7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D5C113938;
	Fri,  8 Mar 2024 17:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hBBnGYV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DDD113937;
 Fri,  8 Mar 2024 17:22:48 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5d8b519e438so1972919a12.1; 
 Fri, 08 Mar 2024 09:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709918568; x=1710523368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMzHkz1+8JAPuu6nKp0GFPz112XaEOG/sl4XlMYAbmg=;
 b=hBBnGYV03ds6CFdHFhWFn70a9pbxbFW0RWTYsTHuc94Piqx7AtLW78mK3fdWAcX5X+
 /ZlnuPWGd41AnCCJBLeA37UgaRVBoGnqa0qFBj0CRbOnnKYPpFEt1cpKcp1ywgeq1XIc
 TMkb1H75/FmaGy499qJFsedvgnU0Hanz8X/fcXWLqqPO+b0CdpFKr4N+eplYRvhkW0em
 2gI+nauJe4F3djyvIdZ2AbRAInLr01AoQTt/kGqyDL/J9/JlSZoyyGMlUyrijW2Vx/DP
 V65ytRahOgymtDRISljMA6rd/Q4V96DIGoIDJSnJa3xw9WPp3oSlltx0Xr6zKHEYNFm3
 3i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709918568; x=1710523368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMzHkz1+8JAPuu6nKp0GFPz112XaEOG/sl4XlMYAbmg=;
 b=jXdJjlb+nKiGHcvNSFWiANbidVqn1zOAhOppo10COGvfyBHTnzQBMDaLzPs+4TV6r5
 BwR6f7UMYr3qDXRoKNSHn7lB/wxv8UBUYxM9kRoFbnTHQXYMyi8Rgvo1oGhRYtClBSEs
 5f2KYSdwAoQmQeoETe+u8jc72GSDxZg+gPU1tB79fWF7Jini/Eo4y7U/IYBV5VP5fU+Q
 2OeyannD6NZbN6bDbOc1iFpleg9xDDt2e2xXxj/GMaC7iKRftAlztz51vCfGhUl5CPZI
 w439qpauj/dVNUzDZAv5bh5jdcvguzh9ld78mKW5MeHX0aw8rtzJy3t1W5PQt0DdlF7r
 c70A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwbt3VzCnegL4GjlOk1U8+SxWZEnGd/q7Dv1xMb4MqTTs+1OyLAVRXAYzioS013aqz1/d82914KPfmoUzYZj6BnFaF2MqhuLIWIeFvb+9nWi3/aea5Q/2bLMJnuMWCUmFLK6UCV1J12kyyOwiRVZc=
X-Gm-Message-State: AOJu0Yytq0Wt4iYckyOgqiFmT7ar8FVCHjPNJG/SQG2mhUBbM2FPXxeE
 Z6BCxyziY0SnqL3C1jTaRUcRv7zZfW2WA4+oanG2wJiWZi6UsjGtYmQy2+nqlIPIj5VJiWzP6ez
 XKPPa/n60U3ff5UDs6qSOGy+PETY=
X-Google-Smtp-Source: AGHT+IEF/WqJFfJFH+THZAa9w1kpEUz3QSVHwZsN3fSU9G59OSeCitgEZZv38ZAnNG/9tE1Q+siM+VTHLI6P2tXkDY4=
X-Received: by 2002:a17:90a:17a7:b0:29b:9c90:46ec with SMTP id
 q36-20020a17090a17a700b0029b9c9046ecmr723785pja.9.1709918567807; Fri, 08 Mar
 2024 09:22:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709898638.git.jani.nikula@intel.com>
 <b92373759bba305ddf8d24fdca345f195400e206.1709898638.git.jani.nikula@intel.com>
In-Reply-To: <b92373759bba305ddf8d24fdca345f195400e206.1709898638.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Mar 2024 12:22:36 -0500
Message-ID: <CADnq5_OUjkuzwHiUM1naaaq+nNxtZk8bzOQ9fKYf-OCq+Dqj=w@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] drm/ttm: make ttm_pool.h self-contained
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 8, 2024 at 7:23=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> struct seq_file needs a forward declaration in some configs. Sort the
> forward declarations while at it.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403072259.EEC2Vf1X-lkp@i=
ntel.com/
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/drm/ttm/ttm_pool.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 4490d43c63e3..160d954a261e 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -32,9 +32,10 @@
>  #include <drm/ttm/ttm_caching.h>
>
>  struct device;
> -struct ttm_tt;
> -struct ttm_pool;
> +struct seq_file;
>  struct ttm_operation_ctx;
> +struct ttm_pool;
> +struct ttm_tt;
>
>  /**
>   * struct ttm_pool_type - Pool for a certain memory type
> --
> 2.39.2
>
