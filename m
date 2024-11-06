Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A5A9BDB25
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 02:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7073B10E11A;
	Wed,  6 Nov 2024 01:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P965halm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A08A10E11A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 01:27:22 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3a5e0a3ac48so21141175ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 17:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730856441; x=1731461241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcxC+ORh9eBt+jOnM96T6OTZbBwlinEiMNH6d9wvoUs=;
 b=P965halmTepzYe+uHm0w5XGoLivHH4BpdaWOlFUlniNp2kTu9xB2PbxEeY/f4uHwJD
 npSTDPCHL6gR5CSPUnUMSVueBwkc4PmHzAbOGPfirbs3nQPLc+nz2TBSDRrzX90UKG+N
 o6Fib91edQ4CtjF+bhTFOzGcLjNIr0mg47ENYHPoCBbYUj4OL+s6qXDfH0lK2NSE0frg
 KEBKuIGAbNOQrEEluc9IVhvXDr7sFSZZWrTdmk0YOS6R+ZWo+pXOzrs6X/BuiTk6n1Ky
 Sc+ltnr7E1pekdjt7IQj4OnIAw+XHeEFW1iS1G/Ahg6kUMrNzVevq/LOlUk/WrGkX3j/
 zsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730856441; x=1731461241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcxC+ORh9eBt+jOnM96T6OTZbBwlinEiMNH6d9wvoUs=;
 b=HHbIAZVBF2p1+4GNoVGVrPNbNOuW5oZYGc11moAJGNeJz9QOBqKbD3hMcDBuAKliXm
 CCCyDReW+Hy/mEDa9ei75soMznaJzBxGNTYD8rxKEW+8oyEz/8rF84FQnWawyJXRaC9C
 D9+iB7CKAiVzQf7+QDsMc49falIAbZ7tiSIoY7TGKQZFkhyqYXiUV+hua0m57Hr/rrPk
 nWlrZ5USiOk6hoVTdXZaSVGs7siG1KI8GKxNn/jnxSU+VzosrT1Y+ulhl3PwjXdO8OBA
 KCfZ/WFBMimSa3MM0gPk1ksHm0JOx8SgmEI+3PHjxZ1X7ht5Z1IiQSlWMBaGt/Q/enQ8
 HTiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk2tOGtiBX4DqWUHjFdD8yVkgQeq2yb1KXSL/wZ9cR+XtaOU/yoE6TLP2eQ6gJYB7+TqPaDX9Ne/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx03MERlOdaQxjp8fT0aXk/XN7lU4ga5tacNbCIYmLcc1svf+iJ
 Tctx0g2U8g+y9lExyyPDxoW/YLSZ5dVx62WdjAqJ7OpCe12YSuh0pJQ8tnr9WXdBBvVnn+4AgxK
 ehQLosOCPeHwkHRge26SKWHYXDPU=
X-Google-Smtp-Source: AGHT+IHK8YfN0cWKU5EzbpIzvioDDX+4UjhafdKqkGFG/9144aWhyTmx/bwu2zbbifHRZEYV7AUaD/0tSb65EKVTtMs=
X-Received: by 2002:a05:6e02:1d11:b0:3a0:bd91:3842 with SMTP id
 e9e14a558f8ab-3a6b0393b63mr187747875ab.24.1730856441515; Tue, 05 Nov 2024
 17:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 5 Nov 2024 17:27:09 -0800
Message-ID: <CAF6AEGv73+k4fNm-5ZXTyf5jizx=Yq=HeA5AC7K-DrDA1Edn2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/virtio: Use drm_gem_plane_helper_prepare_fb()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Kim Dongwon <dongwon.kim@intel.com>, 
 Kasireddy Vivek <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
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

On Sun, Oct 20, 2024 at 4:08=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> From: Dongwon Kim <dongwon.kim@intel.com>
>
> Use drm_gem_plane_helper_prepare_fb() helper for explicit framebuffer
> synchronization. We need to wait for explicit fences in a case of
> Venus and native contexts when guest user space uses explicit fencing.
>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> [dmitry.osipenko@collabora.com>: Edit commit message]
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/vir=
tio/virtgpu_plane.c
> index a72a2dbda031..ab7232921cb7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>
>  #include "virtgpu_drv.h"
>
> @@ -254,6 +255,9 @@ static int virtio_gpu_plane_prepare_fb(struct drm_pla=
ne *plane,
>
>         vgfb =3D to_virtio_gpu_framebuffer(new_state->fb);
>         bo =3D gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> +
> +       drm_gem_plane_helper_prepare_fb(plane, new_state);
> +
>         if (!bo || (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY && !bo->gue=
st_blob))
>                 return 0;
>
> --
> 2.47.0
>
