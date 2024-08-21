Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5795A5C3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8508C10E692;
	Wed, 21 Aug 2024 20:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MfwbTz/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3507B10E692;
 Wed, 21 Aug 2024 20:22:23 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2d3e6fd744fso4463a91.3; 
 Wed, 21 Aug 2024 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724271742; x=1724876542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4N/0smalG5TPn1izfalz/IyqY1wsey3JgqZf+z0B8E=;
 b=MfwbTz/jmUp9ll2iA0rSd+qeVD3EHSjzZ+do9fTPEmjcO6GNNnaH+htISTfHfLZXqM
 pC3zpIl4MVuxnqZPaYsS7gl9oNw0kgo4LmLtpsI8qyA5K7h/LxvZgS2aMsaiAwAzF4ll
 KiZ6ON9G3YihlDi23qOHBGbqcJyYkoLj+0HTxvu/EXVJRawHLCfKU498DIU9vwRtcWnY
 jEJ35WXXRuEpkmNJNHN2AP3n7v2iphb1VMOV85fdvAFTuFlDGvvOY1eBz24zgCnAcqkd
 r4tuizJtYcTORzZytpV7H2AHZYzxmgxKad9mJ2pdYFaAxF0qMnFrfVOhSOkPrFurMUlR
 NHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724271742; x=1724876542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4N/0smalG5TPn1izfalz/IyqY1wsey3JgqZf+z0B8E=;
 b=c+KeeDDEO0NEvuPp1Hil0p1ALG7ZZt3jpJj+0DoFeEBHkhlnO0kO9ORVni60/sCdkj
 16mVFsoDWTlSrFxgLZ6jnogxe8vuxkWU2xmV2vNRwilUHwuqngJSCj+LPkLgvpaAnccC
 gPLAG9R9RsPGGx5kWbaJvcIiNeDuXfwVe00OBCOB7Z6UfSz7xWDTMwoM/ddF8yCxAf4D
 frcdv6apvXO+vk4JGfknntaeP76WynBse/mydkDGak8HKlNHb4UYu64ErjUXH7oVNwO5
 nehWmnf9geLnIpQV2pXDA5t77i42YQ4ykdsGJZ0qoYkdjfvcVsTkq5eKUjSIeSh7ivBQ
 gSfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVZfh0zGt+R2nJTT3qoWp4q/4EBzr9lJ1yR7uH/o9z/MLNwUAQHGnvhxEyjxDBqLgPlBU8AFbE@lists.freedesktop.org,
 AJvYcCXAbI2tip6TQGVoJRgBYfTfC3u02iJ1cMMNLnBrlmVQWjRH21ZzrWO//mTdeZUBCt06eTBkmO+F4a1R@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpAjSI+WzMv/ixfyugS1gYi3o70usT7Zpu3QOefQOaJXIsdf/b
 PYNpCrvloLRi6raM7nS7sob6/9o9u3Ni+uBGoCLbkaY+Yd+rAPz27x9PpyiXh4e2KM6lCIRSPRS
 9SusWIfvtqITgQUb6cbIMyoa2R5IQFw==
X-Google-Smtp-Source: AGHT+IGp6zlTSzpJYGatswz8fjy7/F9DjWBDw37uYGLUIWLeRFH6TaaSw5b4r+XPPtBbtx14A9e4Nji6NABBydevvmo=
X-Received: by 2002:a17:90b:50c8:b0:2c9:863c:604 with SMTP id
 98e67ed59e1d1-2d5e9ece4admr2241412a91.3.1724271742315; Wed, 21 Aug 2024
 13:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240821042724.1391169-1-make24@iscas.ac.cn>
In-Reply-To: <20240821042724.1391169-1-make24@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2024 16:22:10 -0400
Message-ID: <CADnq5_OzY97etD0LW5Tw-xCnnTYonGkvxA875xdAfMgxAtu_DQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/amd/display: avoid using null object of
 framebuffer
To: Ma Ke <make24@iscas.ac.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, mwen@igalia.com,
 aurabindo.pillai@amd.com, 
 joshua@froggi.es, hamza.mahfooz@amd.com, marek.olsak@amd.com, 
 HaoPing.Liu@amd.com, akpm@linux-foundation.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Wed, Aug 21, 2024 at 3:45=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:
>
> Instead of using state->fb->obj[0] directly, get object from framebuffer
> by calling drm_gem_fb_get_obj() and return error code when object is
> null to avoid using null object of framebuffer.
>
> Cc: stable@vger.kernel.org
> Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes"=
)
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index a83bd0331c3b..5cb11cc2d063 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_blend.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_fourcc.h>
>
>  #include "amdgpu.h"
> @@ -935,10 +936,14 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct=
 drm_plane *plane,
>         }
>
>         afb =3D to_amdgpu_framebuffer(new_state->fb);
> -       obj =3D new_state->fb->obj[0];
> +       obj =3D drm_gem_fb_get_obj(new_state->fb, 0);

Is it possible for obj to be NULL here?

Alex

> +       if (!obj) {
> +               DRM_ERROR("Failed to get obj from framebuffer\n");
> +               return -EINVAL;
> +       }
> +
>         rbo =3D gem_to_amdgpu_bo(obj);
>         adev =3D amdgpu_ttm_adev(rbo->tbo.bdev);
> -
>         r =3D amdgpu_bo_reserve(rbo, true);
>         if (r) {
>                 dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
> --
> 2.25.1
>
