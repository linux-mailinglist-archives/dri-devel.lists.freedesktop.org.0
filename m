Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D524EA4B2CA
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 17:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AA410E1C2;
	Sun,  2 Mar 2025 16:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RfwkhNjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B6A10E1C2;
 Sun,  2 Mar 2025 16:02:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D5A25C5623;
 Sun,  2 Mar 2025 16:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8201C4CEE6;
 Sun,  2 Mar 2025 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740931356;
 bh=IXhkIvpU+Vx0ykxl7LXdSi8cY8sm/76OdV3Goprjou0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RfwkhNjfgGpUqTHhP+lwbRK3eJ/b0ST9O2dzL69q2zgJ9iLeFQtoCb76of3Q7Dlri
 5OBkeciYD6z0GC1B5rEEFPJpLYYKn+XVxnszvLfU0fVeaf013R4/2huKRNO1F8iIXg
 g9mmPruYyrZSPjEpF1qpbI0TOHS0ymWGbFWTKD4aaxHJq/YnALaJJkDwGmrJQ5IFN0
 /U+PYPe+3AHssaOnG3nz2wXvfbb0nFXXx5NufHKHDus1yrgXcBZODvkSZ7ky9ws2L8
 67URbhOXEJtri0PvyikLEkqP79BY6s8MukZ39jIwweKhuuf2Z81HN7dJA3bTldaxgW
 y1wIdHHKSumMQ==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5452c29bacfso3877775e87.3; 
 Sun, 02 Mar 2025 08:02:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6aqNm7BL+s6ztbv4kDveJUe6qw180PfthCx/O+BvlIP1bOjHXSJWpOxEfjemPkuN8nknu8p3JTz0=@lists.freedesktop.org,
 AJvYcCW61f4S+rB7Ef+vTaOOYRWGl5u+I2w5Ho9ORO5nkFuthDv7ZY4zdeyUI+8WKcGDp9mUFsVKiw7kwdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeY1ArAh4YY0b8AK7T3dWQWW38Z2Ktdu2I2f9UDU04SJbGLz6W
 Tav9XeaU8UGxzihJ07BekDdUlt3CX1g2ms/+ys/+7prYF8MBBn2QiEtiyLJLo2dm09bRSD1XIWR
 4jcsoNsrjrOI5k7AUctbIU4cNtlQ=
X-Google-Smtp-Source: AGHT+IHYvJe+qApYS2+5LIWu4//GRS8AGGEQTac3sH+4UQmOGdeQ7T3e0VpLwivQRZr9TJkGHrfmzW/pfy8zI0xl9oE=
X-Received: by 2002:a19:380a:0:b0:546:2f7a:38bf with SMTP id
 2adb3069b0e04-5494c1168a3mr2821689e87.1.1740931355549; Sun, 02 Mar 2025
 08:02:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
In-Reply-To: <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 01:01:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
X-Gm-Features: AQ5f1JrGbKJFRYR-Y6y77nA0lEIpMz2uDwEsMvCmLCf3FGL-2Sc7WQK3aCYehM4
Message-ID: <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

+CC: Linus

On Wed, Jan 22, 2025 at 11:41=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> Ensure drm headers build, are self-contained, have header guards, and
> have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=3Dy.
>
> The mechanism follows similar patters used in i915, xe, and usr/include.
>
> To cover include/drm, we need to recurse there using the top level
> Kbuild and the new include/Kbuild files.

NACK.

I replied here:
https://lore.kernel.org/all/CAK7LNARJgqADxnOXAX49XzDFD4zT=3D7i8yTB0o=3DEmNt=
xmScq8jA@mail.gmail.com/T/#u


I CCed Linus to avoid him accidentally pulling this.
He disliked this misfeature.




>
> v4: check for CONFIG_WERROR in addition to CONFIG_DRM_WERROR
>
> v3: adapt to upstream build changes
>
> v2: make DRM_HEADER_TEST depend on DRM
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  Kbuild                   |  1 +
>  drivers/gpu/drm/Kconfig  | 11 +++++++++++
>  drivers/gpu/drm/Makefile | 18 ++++++++++++++++++
>  include/Kbuild           |  1 +
>  include/drm/Makefile     | 18 ++++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 include/Kbuild
>  create mode 100644 include/drm/Makefile
>
> diff --git a/Kbuild b/Kbuild
> index 464b34a08f51..f327ca86990c 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES) +=3D samples/
>  obj-$(CONFIG_NET)      +=3D net/
>  obj-y                  +=3D virt/
>  obj-y                  +=3D $(ARCH_DRIVERS)
> +obj-$(CONFIG_DRM_HEADER_TEST)  +=3D include/
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index fbef3f471bd0..f9b3ebf63fa9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -494,6 +494,17 @@ config DRM_WERROR
>
>           If in doubt, say N.
>
> +config DRM_HEADER_TEST
> +       bool "Ensure DRM headers are self-contained and pass kernel-doc"
> +       depends on DRM && EXPERT
> +       default n
> +       help
> +         Ensure the DRM subsystem headers both under drivers/gpu/drm and
> +         include/drm compile, are self-contained, have header guards, an=
d have
> +         no kernel-doc warnings.
> +
> +         If in doubt, say N.
> +
>  endif
>
>  # Separate option because drm_panel_orientation_quirks.c is shared with =
fbdev
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 85af94bb907d..42901f877bf2 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -222,3 +222,21 @@ obj-y                      +=3D solomon/
>  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
>  obj-$(CONFIG_DRM_LOONGSON) +=3D loongson/
>  obj-$(CONFIG_DRM_POWERVR) +=3D imagination/
> +
> +# Ensure drm headers are self-contained and pass kernel-doc
> +hdrtest-files :=3D \
> +       $(shell cd $(src) && find . -maxdepth 1 -name 'drm_*.h') \
> +       $(shell cd $(src) && find display lib -name '*.h')
> +
> +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
> +       $(patsubst %.h,%.hdrtest, $(hdrtest-files))
> +
> +# Include the header twice to detect missing include guard.
> +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
> +      cmd_hdrtest =3D \
> +               $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $<=
 -include $<; \
> +               $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)=
$(CONFIG_DRM_WERROR),-Werror) $<; \
> +               touch $@
> +
> +$(obj)/%.hdrtest: $(src)/%.h FORCE
> +       $(call if_changed_dep,hdrtest)
> diff --git a/include/Kbuild b/include/Kbuild
> new file mode 100644
> index 000000000000..5e76a599e2dd
> --- /dev/null
> +++ b/include/Kbuild
> @@ -0,0 +1 @@
> +obj-$(CONFIG_DRM_HEADER_TEST)  +=3D drm/
> diff --git a/include/drm/Makefile b/include/drm/Makefile
> new file mode 100644
> index 000000000000..a7bd15d2803e
> --- /dev/null
> +++ b/include/drm/Makefile
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Ensure drm headers are self-contained and pass kernel-doc
> +hdrtest-files :=3D \
> +       $(shell cd $(src) && find * -name '*.h' 2>/dev/null)
> +
> +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
> +       $(patsubst %.h,%.hdrtest, $(hdrtest-files))
> +
> +# Include the header twice to detect missing include guard.
> +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
> +      cmd_hdrtest =3D \
> +               $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $<=
 -include $<; \
> +               $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)=
$(CONFIG_DRM_WERROR),-Werror) $<; \
> +               touch $@
> +
> +$(obj)/%.hdrtest: $(src)/%.h FORCE
> +       $(call if_changed_dep,hdrtest)
> --
> 2.39.5
>


--=20
Best Regards
Masahiro Yamada
