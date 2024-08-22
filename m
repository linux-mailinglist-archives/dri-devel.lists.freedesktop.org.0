Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B2E95BDCA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EF910EBBA;
	Thu, 22 Aug 2024 17:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JLoEm61a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CD110EBB8;
 Thu, 22 Aug 2024 17:55:58 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-201f577d35aso868725ad.1; 
 Thu, 22 Aug 2024 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724349358; x=1724954158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhXu1/y7UKtVxtPjaKnW4gHUfJYvKyvM1SAHsg1HIWY=;
 b=JLoEm61afuzCncSBiPdGUr/EYBDQQ8MoermwJ6pFLWq1z1SuYDFZEOEkmhZQfKgIvR
 cL0kUGvEX3UJR9r/YHmfyAmThmLP7mBP4ci28fFuzggCYsfEIVJq+JSSsH8VPXmvQPin
 Z/XeOY997QPsCAxJ0ZmhfHwzCuuBmT8/latOYbvptdoF7AqAJlg8uYPdpnXjCOozqVhq
 EAr6c4VPreY+lJigTCo7WrXyTRg5yqTtEB9v3C+zDUoU1MuJClX9ybC3vbnONlEp9rAw
 TO7SPZdZzC2ccOMp876PJsxyvf62zQIkBKQUl3p10qJUlO841hNZxzhLQdBI4ItNzzfR
 OOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724349358; x=1724954158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhXu1/y7UKtVxtPjaKnW4gHUfJYvKyvM1SAHsg1HIWY=;
 b=jQ88yKlJ0qiSGg79nYWk+6g2+r88gUHIJgreuaK4KeFRlgqCtuukcGQixzuw7wQHjX
 jV51gcLC22zMZYyALump0kkVcpQb4DFxSKqtR8GYLTs2Lg9a9g0rdXISBxTCLTMXFI2U
 4xBcUanEYf0SRjDPgCjztmxBjv5BLmlUK98CwZFJim+0MYrywz1HP5Otzr1Q1a/XUIkR
 nuCWvgvTo0GOKSn9MUZEzgx4ybukKtDHrmVoX1ZjUG/AMs4Y9AoGPu95rlkU+h3wi1p0
 eb2xc4Qv8D8eU7LXSBAY095mkMugfpCIElJ6YNUgjPgV2CyPSVxOT/OHT4J9V7iTYjWX
 hAsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOdT6PlyantL1dKWIajWoN9QNH0GRy4Ev9f1YI3lQOoW9I9Kqbu9KZeSPoqom00FForU+KdkkW@lists.freedesktop.org,
 AJvYcCV5/W2KoEyimiJwZ3WX/BiTUg0xFyHYVpbkCcD21jJoFAT9oF2zU9xc1eNJTkHMCmci7p9plDCM3A+Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEny1dS42JPc3tsgcUKp49doHreXw7Qmw2JGM1H+bh3K8k44Cx
 hwyOf7mulzAIB1VU5aMyLWUYWeMNqjogocZXnwUM3elmGXwAQIWdGCeeFv8JszeQpjATDUMJAAL
 ji64z5BJyqW06J7IFYYfb60DdH7g=
X-Google-Smtp-Source: AGHT+IETlDVRl8j8jbZqDqUvSIioAvhet305MNQITQRtCniCu61LWrGuZC6R67R9iHP+nA+QKCEStVE/J8zJyaAFQls=
X-Received: by 2002:a17:902:c406:b0:1fa:a9f5:64b1 with SMTP id
 d9443c01a7336-20367d0d354mr44078375ad.3.1724349357971; Thu, 22 Aug 2024
 10:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240821042724.1391169-1-make24@iscas.ac.cn>
In-Reply-To: <20240821042724.1391169-1-make24@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2024 13:55:46 -0400
Message-ID: <CADnq5_Orq-RkKxOeG9UMnnJGodsB-9Tek0_NyYNP3EGaiEXpGQ@mail.gmail.com>
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

Applied.  Thanks!

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
