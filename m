Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C98769B6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2111392F;
	Fri,  8 Mar 2024 17:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SS0W6aKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890B6113840;
 Fri,  8 Mar 2024 17:21:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso20307165ad.0; 
 Fri, 08 Mar 2024 09:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709918494; x=1710523294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFFqbUaUZ91/redb4BpojzOLms6LZJHbUlerYTkapPM=;
 b=SS0W6aKsls+49cWZ63EbjIvl+6ImRaorXRX2Crcv6QYyFa5SqqVYNnrizVHmKXrygW
 GL6SmSgNWdUE8rEpxWUhWOdkgtajy6Vk/zCOPzmKJdr8i8Ls12pzeRTtFTS2xA/MtCn9
 0Uu//lWEPOvCrcIvDEjJlHWDd0KblfD7V2uqeht8uuTZB8AS2QlsWZz5zs++DntNdUiu
 UMiloQm3D4exB4P4mkTzUWCsZku4qSAOf7T5ddXSg4PNCk5RrvlzCM3GtsXYNFPsZ6ot
 z3YZqFxX/1kiq34gkGWm59q6FONpuGjizCxQqJj4zg/a0J5ynJeUDGjINVZUfHxFm0Oe
 o6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709918494; x=1710523294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFFqbUaUZ91/redb4BpojzOLms6LZJHbUlerYTkapPM=;
 b=Py3Kui3WrsbFPrZjV0XdP3L9Up9MhhjT6woyW9tDrmoyg6hvTkJ0HUc/ne21C2cJQz
 OlG3yIjH5XxYoxHR0hFoVhunerRgYunFiSHPYEfIFRrEIHXxPd4gZ5uXEFLqMSB8XwPK
 nVreCj2sVAo2bCwa8P79KlM08G4y+r5C9sAF6Y8quG/pn/Fw8lPiIDGEGoq/sN3W2KtB
 SN7t19E4ys9J2RMHwVttqBtsxoq000Ivc9KEnF3x6WvORny4dG/bgWtuB454HNIUewoG
 Gd6y4UD7dWyGU+AFqQdnUYEha0BJHBJGA6+qdFPpzlxxyHsDNQH238xXMmxh4l+0bibG
 hk7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz4ksJFmGIGqH6I1biqxsvAwaXh2oRb7YaG0u15bkzM6xEcLLbAhicACrJMAtd0/4TfdJrVyiEbzSp3peaILhGyks3h2FJ7bqFbdpuLELAwGJPA99KBmiV1Xka5gZFo+f96RFzzZSSmugOmu13diY=
X-Gm-Message-State: AOJu0YypPVO/phEqkclDjBvmCpLC8GWjqXkt32+5Ga6th/84YVb8jJxq
 yDqJk5OXmBwHgDYwz51SdojdDChdaxzHOQFgyWsPbmjQNN0Ptb8hitscoh9ArGAxwhCS0oMc3ct
 GlFa5cK5QUyW0f9TAL4/IM06ynLg=
X-Google-Smtp-Source: AGHT+IE23dKbLQdzd5dRA3NjCWcXgMyZNisauEi4jzpLzrrZ5ASD7lUVadhQMkL4o8WfUTNZpHE9ZgPdPt29WcQb0G8=
X-Received: by 2002:a17:90a:d255:b0:29b:ae11:7da6 with SMTP id
 o21-20020a17090ad25500b0029bae117da6mr675120pjw.16.1709918493930; Fri, 08 Mar
 2024 09:21:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709898638.git.jani.nikula@intel.com>
 <b5020cdc2ff6d2f4992ea25cf88d528e4738d700.1709898638.git.jani.nikula@intel.com>
In-Reply-To: <b5020cdc2ff6d2f4992ea25cf88d528e4738d700.1709898638.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Mar 2024 12:21:22 -0500
Message-ID: <CADnq5_P+drjzACKvwfx3j_E81iqpEiJiayAEbazABiG=L+u0Tw@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] drm: add missing header guards to
 drm_crtc_helper_internal.h
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
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
> Including the file twice can lead to errors.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm=
/drm_crtc_helper_internal.h
> index 28e04e750130..ed4deed07abd 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -26,6 +26,9 @@
>   * implementation details and are not exported to drivers.
>   */
>
> +#ifndef __DRM_CRTC_HELPER_INTERNAL_H__
> +#define __DRM_CRTC_HELPER_INTERNAL_H__
> +
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
> @@ -44,3 +47,5 @@ drm_connector_mode_valid(struct drm_connector *connecto=
r,
>
>  struct drm_encoder *
>  drm_connector_get_single_encoder(struct drm_connector *connector);
> +
> +#endif /* __DRM_CRTC_HELPER_INTERNAL_H__ */
> --
> 2.39.2
>
