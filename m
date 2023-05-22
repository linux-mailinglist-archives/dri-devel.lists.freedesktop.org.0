Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E1370BB15
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF30B10E2C2;
	Mon, 22 May 2023 11:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8316E10E2C2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684753548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MX/s9CqqCW6cH2AMqyMMQv3ISbYNht7FksP6LmQ8hqw=;
 b=aUxgbkwRKcWnknD2Umr8UN8IvAicIl/CGTQcOcmUl31i0MlJ2T3bdTf8dTVHjkLKjOCZYT
 KKb60QfAClhGX6nu93cWya5bhxFNlmvOZqvr2CsXCokrd/sg0rbztX00l96VZUoJ5R0eRK
 2arJCHdhFH0oQrIa6oxCA3Q3qDQg4sk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-I4Ks0TnyMEiQ0ab8VtPbgg-1; Mon, 22 May 2023 07:05:39 -0400
X-MC-Unique: I4Ks0TnyMEiQ0ab8VtPbgg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f37c278008so233587e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 04:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684753537; x=1687345537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MX/s9CqqCW6cH2AMqyMMQv3ISbYNht7FksP6LmQ8hqw=;
 b=JAtrOMAqO0oi23plLyR6BanGSwa+QrTWP0n+Z/wTK9r8vIshEx8Qfy1jPwMMHhmOIl
 ELIZnhb2iZxFBNvbf9hi2qDDzvZy/mZZYPIrZF3UfQlXXnNXqZ+8cX3zkTNAqdjUo6io
 n4exIvI0MpiXmm4Sln4kmYumI+6jSA911HtkKCx1aNSywBd2qkPzGqF/o7hIFpQkwUlr
 OjlEl8xgbeOnZU5/DbCTlJnJNGbwNDfrmaoB1D39RHWhGJd4XMU/+voKvvMQ9SRdXfy+
 CRCRpAemoWm+nNxR9Ak5Od+WkcVS3lJ58UgB9WjBiqwEYOpLRbW2uJVQ7kDvjA8KtMJZ
 tR7A==
X-Gm-Message-State: AC+VfDxxq5X5Ba8WLKjCyLPMju02o33071QBt6dVxABjhATDckSVTWTc
 O3QHIGLl23r82ORwHbTsaDEYeOpcFFoVbK+WIa9xexrVI371UfFZHst0npAtomRjjFq1B/0PTQ7
 dwD7M4qZ6f4+kI8yHmd8fqAADvu03jhkS4RDMVmmDbssB
X-Received: by 2002:a2e:a4ba:0:b0:2af:237c:c335 with SMTP id
 g26-20020a2ea4ba000000b002af237cc335mr3549907ljm.3.1684753537760; 
 Mon, 22 May 2023 04:05:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6x3VG32WQUaO2EyREF1ehIOVQgkJqkNFu6Egwvvu/4sFAXjJoytU/NPjAcnvx2WnEdpXLHgR+ABojRY1WCGjE=
X-Received: by 2002:a2e:a4ba:0:b0:2af:237c:c335 with SMTP id
 g26-20020a2ea4ba000000b002af237cc335mr3549902ljm.3.1684753537479; Mon, 22 May
 2023 04:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230417210329.2469722-1-arnd@kernel.org>
In-Reply-To: <20230417210329.2469722-1-arnd@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 22 May 2023 13:05:26 +0200
Message-ID: <CACO55tuL06jff8WnvU5e-rjwWx+smyYriET7DZDPgNM5e-0UFw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: dispnv50: fix missing-prototypes warning
To: Arnd Bergmann <arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will merge soon

On Mon, Apr 17, 2023 at 11:03=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> nv50_display_create() is declared in another header, along with
> a couple of declarations that are now outdated:
>
> drivers/gpu/drm/nouveau/dispnv50/disp.c:2517:1: error: no previous protot=
ype for 'nv50_display_create'
>
> Fixes: ba801ef068c1 ("drm/nouveau/kms: display destroy/init/fini hooks ca=
n be static")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 1 +
>  drivers/gpu/drm/nouveau/nv50_display.h  | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 5bb777ff1313..9b6824f6b9e4 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -64,6 +64,7 @@
>  #include "nouveau_connector.h"
>  #include "nouveau_encoder.h"
>  #include "nouveau_fence.h"
> +#include "nv50_display.h"
>
>  #include <subdev/bios/dp.h>
>
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nou=
veau/nv50_display.h
> index fbd3b15583bc..60f77766766e 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.h
> +++ b/drivers/gpu/drm/nouveau/nv50_display.h
> @@ -31,7 +31,5 @@
>  #include "nouveau_reg.h"
>
>  int  nv50_display_create(struct drm_device *);
> -void nv50_display_destroy(struct drm_device *);
> -int  nv50_display_init(struct drm_device *);
> -void nv50_display_fini(struct drm_device *);
> +
>  #endif /* __NV50_DISPLAY_H__ */
> --
> 2.39.2
>

