Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136538B785
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8266F512;
	Thu, 20 May 2021 19:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D86F512;
 Thu, 20 May 2021 19:26:25 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso15878298otn.3; 
 Thu, 20 May 2021 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L/aKDgdFp8azkNRPkBfwbGry+KpDDgeXnCjUZiXUHAk=;
 b=Iw2EOxuFQfHZ+eCHYMxU66KVGsltX5SDbaLnDelNONGLKRdnxrXhfh6GppGwh9hF03
 zNvDroo3j7IUMxWxmZItxH2vSffYWDPnXuVYVtLzvighVR1J1ro5K5lH4V4PSepWV0G4
 gvXSbivlFa1OnRM2D+IU6gdjLxPfcOtdfwX5/T6rhck+gIPtsOygu76ZuH1axb5/d0fc
 IBMpwixmy7uqUA5RhLSu+puEmdboK+4ah5hkBntYbSM0xU8NxvJmiwnGzmOfqMwPu1RB
 twbrTkQ+A+Dtnwhoe3AAYNOOdzIONhJ6vseidUA3CV9HPcPV0t6tz8Q/xDC7s7YVh947
 A1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L/aKDgdFp8azkNRPkBfwbGry+KpDDgeXnCjUZiXUHAk=;
 b=jjKRiIw5L14+bl+24O6UM1fCCKd63mHbe5H/HTchHrVMuITu9nyMGbRk6Ri0x3tH9H
 paXdq8rES2qNwYWXqgJrLaeVnmfsIBgZvgGwdDoHGlwImvYW4HK13svfTVTvJjoiKMBr
 auXBwbd87aXKzk4VF2z5xqzkVfzIYDfqGNbplrVlz/Y02quXmcISrbZJW8FAzdvnNl00
 P8jTXFIY5JDsOz18L9nUF6E4JEcP/7/2ZX6JcB0fdewOntYD9QUcHfalhyWF9Q4sur/G
 h8SWiBWM5UAZGc/ixmROAhoLsStav8Fvp6rWhU12IYVZrUBG7ILQK3ki2ZZ9W6ZBu2Eg
 TM7Q==
X-Gm-Message-State: AOAM531Zm+NFaMuNFxRKiKfE+qwtvPOxVUsGydxK0Ccma1VZROKhYqCY
 upq0Ef13FtlDo9OvmAqAn0rD/frhdLuymprJtHY=
X-Google-Smtp-Source: ABdhPJx0fYn3UtO85WnCHYo3oCG9Ca6arkIE1QlALKzujCj8PWSdmjcwps+puWxR/yT2HWQLUUkvJ/ALvmm3ZQZ3twg=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5160706otl.132.1621538784761; 
 Thu, 20 May 2021 12:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-38-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-38-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:26:13 -0400
Message-ID: <CADnq5_OuzthTQOUkYRSPz0coL1-xgpfzMq57=9SzW3WDSrY_uA@mail.gmail.com>
Subject: Re: [PATCH 37/38] drm/amd/amdgpu/gfx_v10_0: Demote kernel-doc abuse
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:51: warning: This comment starts =
with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/k=
ernel-doc.rst
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index fc12e3c3e9cae..c833be31e4ae6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -47,7 +47,7 @@
>  #include "gfx_v10_0.h"
>  #include "nbio_v2_3.h"
>
> -/**
> +/*
>   * Navi10 has two graphic rings to share each graphic pipe.
>   * 1. Primary ring
>   * 2. Async ring
> --
> 2.31.1
>
