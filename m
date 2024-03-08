Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762E87699D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D23D10E960;
	Fri,  8 Mar 2024 17:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H3VB6ZJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D70A10E960;
 Fri,  8 Mar 2024 17:19:47 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2997cb49711so1593548a91.3; 
 Fri, 08 Mar 2024 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709918387; x=1710523187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p5i2JD/4lXt10DsMgtgNpYdEdATY1DWU2a+p3xbr180=;
 b=H3VB6ZJzkOdPI7YEls8ItIRiof+C1gekW8H30GBqkAJr6udtuyL6IbPrQ6B+Whk+AT
 BN3MMR+T+4jeY48E4GKiCWLEq86rsdlhIaBAOy5vOygJVGD+FiDMVzJF28E8oUMU7kwm
 zSZXiQrhTm8SCcOSg7umvofAhwZxdeY4AmOaEKuiQdLrawa1TNQiSWsZofVHB/15XL12
 af6Nning+3xWj7y+hM7zwCtdxqV99sgqjdQPvEPnQfSSoKe5HXASzNRKTKTLInE2sgNs
 NJdnOHcBh0abdgaLDU7bYzI0B525+o5PLjqlcAeKSxm8foQuIW/Cnyvx+h3hJfUbEXt3
 3A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709918387; x=1710523187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p5i2JD/4lXt10DsMgtgNpYdEdATY1DWU2a+p3xbr180=;
 b=RkDfw2rFsw54Bmpxc6TQm95Atvhcr+ypgJboLXKDvr9MZT3g3NzvOevawaIV9zYSTZ
 XluryBkOl4gpl+eRMzYa9u7Ld9gKb2WfaW8tKXxsjGfzGrnteJ5U6nyADjcQV4Ha/+r4
 yUCfjki9Gmt3cdgo2bJjJQ+oJsCb6VER4J0JvOooEubd2LkGkedIo1xtKkRSo2EmQdnB
 7LiOZDrm/XXnZ6cjuPD/+IcIf8/nmp+wCcwxsaByENc4ORdS+aK/gUkPPlseVQmNjAha
 s3qNCvkSK9DzypUz70kDaBiQ9dpJsRMlwEvF7DQRle7F9ZrTLQRsNYiELs9keNSThvCF
 AOag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5htjXgxq0eN7Utfc9x/2tBbFSGO9NZ40emJ52mFz0mthOqfPOySP3NNO0BHrA1LKl2Evtaosb8nRZ8q7+o+POtlpCS8/zwdAdBCLbe5ZKvrumokRhJ5WWcRlThjZ3QyxDpBx5D8HP4gTXoadwp9A=
X-Gm-Message-State: AOJu0YyWHYx7M4bSCY0QqiMRyW3CTZIHhQRAlkS3rQvPTI4/Hm0+J25f
 tHwLv/cXfceB/UQQ88Jcl98ZK8TSXQz9XmCeaSO+upRMsrVQevEcLSIgYptTgfdeWAzTOD4JXmA
 YlXMgxCxUc/8EAGB7vZNmzl80Thw=
X-Google-Smtp-Source: AGHT+IHpLAuKB9LdSum6AVBptpr3fjwzxWFN3YLPXfjYoUqiFiZXt87u+NRs6mHMWa+plMTGanim+hD0/ZmV66BywzY=
X-Received: by 2002:a17:90a:e38e:b0:29b:c306:11bc with SMTP id
 b14-20020a17090ae38e00b0029bc30611bcmr372123pjz.5.1709918386656; Fri, 08 Mar
 2024 09:19:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709898638.git.jani.nikula@intel.com>
 <7ad51d9fb9c42c9901c5c1d5d16e32e857da9758.1709898638.git.jani.nikula@intel.com>
In-Reply-To: <7ad51d9fb9c42c9901c5c1d5d16e32e857da9758.1709898638.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Mar 2024 12:19:34 -0500
Message-ID: <CADnq5_MkedOutm-z-U3+HTUB5a=1susjJUcUAdvBoRPy5T8+pA@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] drm: add missing header guards to
 drm_crtc_internal.h
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

On Fri, Mar 8, 2024 at 7:03=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Including the file twice can lead to errors.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_crtc_internal.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index c0c5d79ed4c9..0c693229a1c9 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -32,6 +32,9 @@
>   * and are not exported to drivers.
>   */
>
> +#ifndef __DRM_CRTC_INTERNAL_H__
> +#define __DRM_CRTC_INTERNAL_H__
> +
>  #include <linux/err.h>
>  #include <linux/types.h>
>
> @@ -305,3 +308,5 @@ drm_edid_load_firmware(struct drm_connector *connecto=
r)
>         return ERR_PTR(-ENOENT);
>  }
>  #endif
> +
> +#endif /* __DRM_CRTC_INTERNAL_H__ */
> --
> 2.39.2
>
