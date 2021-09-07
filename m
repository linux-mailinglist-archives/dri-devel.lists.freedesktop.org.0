Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F009402BB0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACF889259;
	Tue,  7 Sep 2021 15:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FD589259
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:23:48 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id bd1so11249404oib.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+c/sTeWyX786+Vs1NIE9klJ3V9MhP1nJ6lNyPGoEJ/8=;
 b=MshsR5EJzCE5nEX7McKHjgtEeuYbRrTbVQHnLXXgagwlA12pojg3P2sYO05SHZ/D7z
 y6v2vvhvVIBqehgCw5f2d1hnoqCv543dtE484F78PjywXXzluiEw02NOe6J+bvmqNOEW
 FGxld2ycQUlivUzggGl0ZltNUAHlbohzuYaFoPfWU/B2Xn7r2/12iWrXiC63Xo/K5Tz2
 E/zgQwTw4OUjgdveVGYClDP/51fYW4ZCu3tS+7NFrt8YffnxT7/RLzUFp3d9EkFJFgYY
 yleNXqB47T0EReKC49iZZTltFYaiLXB8FCGvSDAMbk23WAZ5Gb9ZHLYTXiIRBF8wMT2j
 4n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+c/sTeWyX786+Vs1NIE9klJ3V9MhP1nJ6lNyPGoEJ/8=;
 b=jAGeqC/y10QjyhSzmlNwC51vPfDKN7d35dkh5cH7NNfEqC0aIJOhWwXLX5F32Urw/K
 UHx5NSr7KVzu/wMWv6caYjnxfxJBktUzWE6KC1G0u4BGK2DKr7JEB/3B6o4RmiW9fhNo
 oGlZnq2WPV6eMGNhmshZ0bZdou4l6ox8zgzabiGGaQkeMe0Q2HNv3/zqcVr+As5VfCQn
 2VYCGpx8BFnVXphGNhXXpYkvMdvAfTbjcn6O2TNIDzb+vHOwyz07d1QrsjlvnM+s2uPd
 S0FkwdiCrCYQqA1kOUGHIDE6l6XZIBRVTB5J5giW2pVXiT2DY/iqtzmb9xDbcaOWslVL
 3oBg==
X-Gm-Message-State: AOAM531FT8/YfnuxqhQRuqB8LQ9vxGXAp7IqPS9tKD3JWzvrnYCAnmuM
 CuCEtpn6MQoSwynPVAKm40v0lr63iANi7UN54tg=
X-Google-Smtp-Source: ABdhPJwakRhiUgUfqnhbFFvsi6HYQ6GgU+ejBN2rZqvEJpPS2BcE6zg/vzOqtM4h7uul8ZY71voSiS1hdEOJr7Jy6nY=
X-Received: by 2002:a05:6808:1310:: with SMTP id
 y16mr3360183oiv.123.1631028227679; 
 Tue, 07 Sep 2021 08:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210907080135.101452-1-christian.koenig@amd.com>
 <20210907080135.101452-2-christian.koenig@amd.com>
In-Reply-To: <20210907080135.101452-2-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 11:23:36 -0400
Message-ID: <CADnq5_NWyA7zS1rt4898qNukjJKCi17h02ZkkYNRv+rg1+PukA@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/ttm: add some general module kerneldoc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 matthew.william.auld@gmail.com
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

On Tue, Sep 7, 2021 at 4:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> For now just a brief description of what TTM is all about.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  Documentation/gpu/drm-mm.rst     |  3 ++-
>  drivers/gpu/drm/ttm/ttm_module.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 8ca981065e1a..6b7717af4f88 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -28,7 +28,8 @@ UMA devices.
>  The Translation Table Manager (TTM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -TTM design background and information belongs here.
> +.. kernel-doc:: drivers/gpu/drm/ttm/ttm_module.c
> +   :doc: TTM
>
>  The Graphics Execution Manager (GEM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_m=
odule.c
> index 997c458f68a9..11b59cf03ec3 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.c
> +++ b/drivers/gpu/drm/ttm/ttm_module.c
> @@ -39,6 +39,18 @@
>
>  #include "ttm_module.h"
>
> +/**
> + * DOC: TTM
> + *
> + * TTM is a memory manager for graphics devices with dedicated video mem=
ory.

Maybe say "accelerator devices with dedicated memory" since this could
just as easily be applicable to compute only devices.

Alex


> + *
> + * The basic idea is that resources are grouped together in buffer objec=
ts of
> + * certain size and TTM handles lifetime, movement and CPU mappings of t=
hose
> + * objects.
> + *
> + * TODO: Add more design background and information here.
> + */
> +
>  /**
>   * ttm_prot_from_caching - Modify the page protection according to the
>   * ttm cacing mode
> --
> 2.25.1
>
