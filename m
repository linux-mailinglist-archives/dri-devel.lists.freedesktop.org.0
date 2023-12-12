Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6180EF48
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABF910E623;
	Tue, 12 Dec 2023 14:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB3E10E636;
 Tue, 12 Dec 2023 14:49:27 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1feeea75fbfso3832716fac.3; 
 Tue, 12 Dec 2023 06:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702392566; x=1702997366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgTjeJvWVAAyCDCbyX/bwHn2R9G65E0KphCM1IqMCd4=;
 b=c4yW0DuaM+NvwTYzip2owAUtjF+k2dlCp7DKYE1Mi0jRZVUzdLwBQWHmrYd7qEg6gx
 6WXI4j/uLcXku3Io2xGCRdm78Rk8WP/0fxA+O7mgVkaffL/f8YKAQHkQU8BjoRGjP7h5
 hrzBLqPQEYkJxEnOfUVgU48WxBfl5tSqTxsnzI2NgTLG4J0nWL6bna6iP1x75Yc/pHNX
 /cWYmrXRfX58umGZAZs7e7Laat3XaR8KySFFudtYTVJgYqiyk5MOQstQdhX1/sJbqtjR
 gr7FSws8RRtBirlR1lL0H60zXaRXNjrHYu3zEH2ipY2isC3czrOq31ETB3/tyjERZmAj
 YRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702392566; x=1702997366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgTjeJvWVAAyCDCbyX/bwHn2R9G65E0KphCM1IqMCd4=;
 b=YUTdjI0YJU6sDVEZkASTebyhszVEHnUAlil7J8nXdg34vJr4ZM92/VP0g1snH4UAA1
 7viQNMASGfrHBxQ5oSbCIhlIVIgQvKFVvksPhxISbJymGM09BGfgWHnmHNrFAhNt9B6K
 zasbkFcIBU4y6ciUpMdHOSANXsHKbE7eoRSylvJNaqIzlhtGeLTOehCBsx/I3e1vEGM9
 hrVxXEWPxt96UCcly/eChnk4S1ShC4/oo6PmssE6nfkgjhqo2TgcF+/vQKRFfk/KQmVM
 56kq4QN+re8ZCaBfjNT8qcnSVGPE62PxUdqvE/lptajRlcoX6HqTThmC8kwmV7eFEhFv
 Oo2w==
X-Gm-Message-State: AOJu0YyFLxYxossrQW+ZzlIQqfNp6X9ciwFQjV6AXowasvr5rWzBFJTl
 PWdKg4gAlX+nH/945y1Xkqj0KCwgPSP77ZgZ3jnUnApY
X-Google-Smtp-Source: AGHT+IHDe08mrta9MqfG8PLSGxgOf1rYe4vW3KtVg6E89kn4J33kjleioJ8keDjg+uHcfgPqP8adfvclN2RGvxxRz9M=
X-Received: by 2002:a05:6870:164d:b0:1fb:75a:c43d with SMTP id
 c13-20020a056870164d00b001fb075ac43dmr6265445oae.102.1702392565918; Tue, 12
 Dec 2023 06:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20231212135309.3816484-1-jani.nikula@intel.com>
In-Reply-To: <20231212135309.3816484-1-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Dec 2023 09:49:14 -0500
Message-ID: <CADnq5_MXryfUJpwgosfHCY4Z-Fd1mmDq8apr8BW5tJBMRzCcRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: include drm/drm_edid.h only where needed
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with some minor fixups for our -next tree.

Thanks!

Alex

On Tue, Dec 12, 2023 at 9:10=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Including drm_edid.h from amdgpu_mode.h causes the rebuild of literally
> hundreds of files when drm_edid.h is modified, while there are only a
> handful of files that actually need to include drm_edid.h.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h                    | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                    | 1 +
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c              | 1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c                      | 1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c                      | 1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 1 +
>  6 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_mode.h
> index 32fe05c810c6..3802ccdf6f55 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -32,7 +32,6 @@
>
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_framebuffer.h>
> @@ -51,6 +50,7 @@ struct amdgpu_device;
>  struct amdgpu_encoder;
>  struct amdgpu_router;
>  struct amdgpu_hpd;
> +struct edid;
>
>  #define to_amdgpu_crtc(x) container_of(x, struct amdgpu_crtc, base)
>  #define to_amdgpu_connector(x) container_of(x, struct amdgpu_connector, =
base)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vkms.c
> index db6fc0cb18eb..453a4b786cfc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu=
/drm/amd/amdgpu/atombios_encoders.c
> index 3ee219aa2891..7672abe6c140 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -28,6 +28,7 @@
>
>  #include <acpi/video.h>
>
> +#include <drm/drm_edid.h>
>  #include <drm/amdgpu_drm.h>
>  #include "amdgpu.h"
>  #include "amdgpu_connectors.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v10_0.c
> index bb666cb7522e..587ee632a3b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -21,6 +21,7 @@
>   *
>   */
>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v11_0.c
> index 7af277f61cca..f22ec27365bd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -21,6 +21,7 @@
>   *
>   */
>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index b599efda3b19..6f8128130b62 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -27,6 +27,7 @@
>  #include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fixed.h>
>  #include "dm_services.h"
>  #include "amdgpu.h"
> --
> 2.39.2
>
