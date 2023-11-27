Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74917FAC43
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C694710E159;
	Mon, 27 Nov 2023 21:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E8110E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:07:39 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1f055438492so2829057fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119258; x=1701724058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ka5EeQVDN/Jlcn0Lz2/QX3h5Ys9xBllvOkBXn1iMhRg=;
 b=bLd1nN+KfgptFr3UomRBOMjcoAk0deDg8njkrmJzmGFbzTQiz85gtmftrShUUEoOHF
 2CDP8C42Cx/MBjPya9Ak1t6VNm9+gmO9crIqJt+yw7Pw1tYjsGn+/TWcuE7mwZbKerth
 zn78vJmdc/7vkgku7/43d80AaXtWzI1RXU+9V+OURpvEMvobFvZ8xeKo7F5TAp2aSGMJ
 uz04csM6jm/r0uHghmAaWYG/JB5sVeGaODFYQ60cGshVXiUbT2VwFhXD0qvvzMGJq/vL
 drJhN+63xHUebA4Ic/8878NI57asBO7P3RU4UG376S35jylSeQjQVJgZJjUNioBW3JEg
 7Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119258; x=1701724058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ka5EeQVDN/Jlcn0Lz2/QX3h5Ys9xBllvOkBXn1iMhRg=;
 b=Havx1L/0/A1Vs9sfLU11tewPmk2zP8wsTyobvzp2LomMN7px5NXIq+WM4T/87P9sfs
 14Ve6FizQlDFHehXqvei5j2zLrmMUiJHyRu9w3fPinFiVVm3s+Vkdp/3d65jZqSBfrJ6
 Bn/fS2LUE0kFoUQ69CD86jL2HwQr3bzjPNUQpLaCkI096BJeHRt1vishoJTUNCO4bazb
 R+ZR6WSA43IfwTNvbFbJJTQP5hl5FMyTOD81zxMaMGtryrP31lg3yA5voaEgc3xV3yID
 FrvpsilX0uI+maMKbRyRxaLIjqlMQODU4DfpK8JwP2LZ0U7wbsxWgsWl9C9Z9rb1LMAz
 bsOg==
X-Gm-Message-State: AOJu0YzcikR6/pg0n40E+wXDlIy8LeKCFoNCdD0D/2wcjk9RFhMvCscx
 PBU1MgVUpypXPPLH9VIG/l1KRPzmuQj/ew6kbXU=
X-Google-Smtp-Source: AGHT+IEsNQMQw4leqrtWvZtcGKlfikEMhDqtKDeR7rkgGGgnmZ7izqnnZd+PmqpBjkdxXbG+wEBoLhU49wGnFAIty94=
X-Received: by 2002:a05:6870:390b:b0:1fa:3e47:5a8e with SMTP id
 b11-20020a056870390b00b001fa3e475a8emr7444429oap.5.1701119258687; Mon, 27 Nov
 2023 13:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-15-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-15-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:07:27 -0500
Message-ID: <CADnq5_OzdC_vjB-8XV5XHFq7qRv_WRr9x-UNthwzYc5z90k1pw@mail.gmail.com>
Subject: Re: [PATCH 14/14] drm: Remove Kconfig option for legacy support
 (CONFIG_DRM_LEGACY)
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Remove CONFIG_DRM_LEGACY from Kconfig. Nothing depends on the option.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/Kconfig | 21 ---------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index cdbc56e076498..5150c8699a8b5 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -407,27 +407,6 @@ config DRM_HYPERV
>
>          If M is selected the module will be called hyperv_drm.
>
> -# Keep legacy drivers last
> -
> -menuconfig DRM_LEGACY
> -       bool "Enable legacy drivers (DANGEROUS)"
> -       depends on DRM && MMU
> -       help
> -         Enable legacy DRI1 drivers. Those drivers expose unsafe and dan=
gerous
> -         APIs to user-space, which can be used to circumvent access
> -         restrictions and other security measures. For backwards compati=
bility
> -         those drivers are still available, but their use is highly
> -         inadvisable and might harm your system.
> -
> -         You are recommended to use the safe modeset-only drivers instea=
d, and
> -         perform 3D emulation in user-space.
> -
> -         Unless you have strong reasons to go rogue, say "N".
> -
> -if DRM_LEGACY
> -# leave here to list legacy drivers
> -endif # DRM_LEGACY
> -
>  config DRM_EXPORT_FOR_TESTS
>         bool
>
> --
> 2.42.1
>
