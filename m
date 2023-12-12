Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183F80EF03
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EA010E5FF;
	Tue, 12 Dec 2023 14:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298CD10E1F3;
 Tue, 12 Dec 2023 14:41:05 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6d9f069e9b0so3408101a34.3; 
 Tue, 12 Dec 2023 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702392064; x=1702996864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKzQ2msQ9JsQFbq2shJBH473E1/Mt274oYTqz2qlwqo=;
 b=m7JEfve/BU3Rz+/NBLn+8R+RL/J6mEkm0/HPBcbYGSL25fNUX36wGmVXXWyjjRgWos
 LnGDH9a0u3C1P867cSJd3hltynkrKDuKyexE7aHmRy3i8n5A8RmKJj8RMlj++3Sq6UYl
 yoNZ3l3U17iSc3WG8q39WAmPJqOcSJ8ZIsGkFWYaOSiiqNHpC6tWBiBoKP4dqVI9JB6j
 JQ5YrGGUmBYtE6kNFBIWaV1OystOpxCMKH9rhUmIMhhfMJAW5rS9xUrpBBhT9VupG0mh
 KXwHbaRH7GHWHK+/fJUF1Kinp8vTaUVPIda3DED+VCgZGc8Cn5tMAYiGmvoErKXg8wK0
 4rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702392064; x=1702996864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKzQ2msQ9JsQFbq2shJBH473E1/Mt274oYTqz2qlwqo=;
 b=NwrgGhMKXBVhyCOy3mLqksYN9Ua8HEMVN8Y5EglfD2yQzMymcnu0+lxHKz3XI6BzII
 /UD2C6cc9bOX1v+Q58Fh2bK/7KghRHsXT1w6NqB1PbwVUsnUloJfi3XibW2qkU0vVsss
 poYO7FdOt9ueF0Hvrg8GC2Lo6rV21R9vpOsEE48FqbD6z6wPu8YrADYEuu+B7gVkS5TY
 qG1+slchCqJvsfemulYYSCtw0cP3RhIvwzaFdfevA/lp1JU6GXQ/zVlwfUcidyFLG5n+
 aCErXxnXqKXDt8Vs5zR27Zf4CQMxCoMOYMtOxIeiy5ATXoIjPT9Pi6v5i85ejtBuZU3R
 da7Q==
X-Gm-Message-State: AOJu0YwZ+s1eI6Fl2SiYDiWSkGb3vNhMv8jC6/LCWTHRDG/2h3V2xQYt
 VO3+uszYGRnJ3MXlcnIpnrofGQcLrSWYYiRSjSLiC1U6
X-Google-Smtp-Source: AGHT+IHqRTKGMOJW73XiLW3Vi6WxU7l6fK/EsKuj25NtRfyWPUO+EdjLqi/XDTjI32PSIe84nHwtERuB946KWnOFuAs=
X-Received: by 2002:a05:6871:2306:b0:1fa:fe07:527f with SMTP id
 sf6-20020a056871230600b001fafe07527fmr7051185oab.11.1702392064206; Tue, 12
 Dec 2023 06:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20231212135338.3816669-1-jani.nikula@intel.com>
In-Reply-To: <20231212135338.3816669-1-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Dec 2023 09:40:53 -0500
Message-ID: <CADnq5_N=pMJk1JrdjFP8-+UCsv0ky5RYKBGk95Hb2zvDyZCREw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: include drm/drm_edid.h only where needed
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

Applied.  Thanks!

Alex

On Tue, Dec 12, 2023 at 9:10=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Including drm_edid.h from radeon_mode.h causes the rebuild of more than
> a hundred files when drm_edid.h is modified, while there are only a
> handful of files that actually need to include drm_edid.h.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/radeon/atombios_encoders.c | 1 +
>  drivers/gpu/drm/radeon/dce3_1_afmt.c       | 1 +
>  drivers/gpu/drm/radeon/dce6_afmt.c         | 1 +
>  drivers/gpu/drm/radeon/evergreen.c         | 1 +
>  drivers/gpu/drm/radeon/evergreen_hdmi.c    | 1 +
>  drivers/gpu/drm/radeon/radeon_atombios.c   | 1 +
>  drivers/gpu/drm/radeon/radeon_audio.c      | 1 +
>  drivers/gpu/drm/radeon/radeon_audio.h      | 4 +++-
>  drivers/gpu/drm/radeon/radeon_combios.c    | 1 +
>  drivers/gpu/drm/radeon/radeon_encoders.c   | 1 +
>  drivers/gpu/drm/radeon/radeon_mode.h       | 2 +-
>  11 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm=
/radeon/atombios_encoders.c
> index 4aca09cab4b8..6e537c5bd295 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -29,6 +29,7 @@
>  #include <linux/pci.h>
>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/radeon_drm.h>
> diff --git a/drivers/gpu/drm/radeon/dce3_1_afmt.c b/drivers/gpu/drm/radeo=
n/dce3_1_afmt.c
> index e8fe239b9d79..324e9b765098 100644
> --- a/drivers/gpu/drm/radeon/dce3_1_afmt.c
> +++ b/drivers/gpu/drm/radeon/dce3_1_afmt.c
> @@ -21,6 +21,7 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  #include <linux/hdmi.h>
> +#include <drm/drm_edid.h>
>
>  #include "radeon.h"
>  #include "radeon_asic.h"
> diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/radeon/=
dce6_afmt.c
> index 4a1d5447eac1..4c06f47453fd 100644
> --- a/drivers/gpu/drm/radeon/dce6_afmt.c
> +++ b/drivers/gpu/drm/radeon/dce6_afmt.c
> @@ -21,6 +21,7 @@
>   *
>   */
>  #include <linux/hdmi.h>
> +#include <drm/drm_edid.h>
>
>  #include "dce6_afmt.h"
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/=
evergreen.c
> index f0ae087be914..a424b86008b8 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -26,6 +26,7 @@
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/radeon_drm.h>
>  #include <drm/drm_fourcc.h>
> diff --git a/drivers/gpu/drm/radeon/evergreen_hdmi.c b/drivers/gpu/drm/ra=
deon/evergreen_hdmi.c
> index 5f3078f8ab95..681119c91d94 100644
> --- a/drivers/gpu/drm/radeon/evergreen_hdmi.c
> +++ b/drivers/gpu/drm/radeon/evergreen_hdmi.c
> @@ -26,6 +26,7 @@
>   */
>  #include <linux/hdmi.h>
>
> +#include <drm/drm_edid.h>
>  #include <drm/radeon_drm.h>
>  #include "evergreen_hdmi.h"
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/r=
adeon/radeon_atombios.c
> index 85c4bb186203..3596ea4a8b60 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -27,6 +27,7 @@
>  #include <linux/pci.h>
>
>  #include <drm/drm_device.h>
> +#include <drm/drm_edid.h>
>  #include <drm/radeon_drm.h>
>
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
> index 279bf130a18c..053058c5c1fa 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -26,6 +26,7 @@
>  #include <linux/component.h>
>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
>  #include "dce6_afmt.h"
>  #include "evergreen_hdmi.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.h b/drivers/gpu/drm/rade=
on/radeon_audio.h
> index 05e67867469b..dacaaa007051 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.h
> +++ b/drivers/gpu/drm/radeon/radeon_audio.h
> @@ -27,7 +27,9 @@
>
>  #include <linux/types.h>
>
> -#define RREG32_ENDPOINT(block, reg)            \
> +struct cea_sad;
> +
> +#define RREG32_ENDPOINT(block, reg)                            \
>         radeon_audio_endpoint_rreg(rdev, (block), (reg))
>  #define WREG32_ENDPOINT(block, reg, v) \
>         radeon_audio_endpoint_wreg(rdev, (block), (reg), (v))
> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/ra=
deon/radeon_combios.c
> index 2620efc7c675..6952b1273b0f 100644
> --- a/drivers/gpu/drm/radeon/radeon_combios.c
> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> @@ -28,6 +28,7 @@
>  #include <linux/pci.h>
>
>  #include <drm/drm_device.h>
> +#include <drm/drm_edid.h>
>  #include <drm/radeon_drm.h>
>
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/r=
adeon/radeon_encoders.c
> index 9cb6401fe97e..3de3dce9e89d 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -26,6 +26,7 @@
>
>  #include <linux/pci.h>
>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_device.h>
>  #include <drm/radeon_drm.h>
>
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index 1decdcec0264..59c4db13d90a 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -32,13 +32,13 @@
>
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-algo-bit.h>
>
> +struct edid;
>  struct radeon_bo;
>  struct radeon_device;
>
> --
> 2.39.2
>
