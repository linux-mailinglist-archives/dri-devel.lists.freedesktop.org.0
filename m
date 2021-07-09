Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5433C29EF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 22:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9D56EA87;
	Fri,  9 Jul 2021 20:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878E26EA87
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 20:04:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id nd37so18352275ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 13:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gNUEx8m5Ci3AhkJ9L85gRhMaE2ah4j4mk7binwFYxo4=;
 b=feaJUqYM5Sxctzs1DGVom2moLjXlXCOJnFk+tnjkuHgsCuUjXTEQgQcTFfvCsiQX2Q
 XYfm3MrC6umSCmuh/TMX+tzTTdAH1qS93xAxfXPmqFXkzd6baiXP5DT5mXkpTXG+uYJT
 Trmkbfpq7fSUjc+BjgJgVMyWCAISdfZrEy90SykR0fLFy3/t1YfvvMROiUlWTIRz6htn
 +srkHJHBdZfOKl7sn1dAJIO2P6BPYj6YUZBWWtYemOQkZJZmS6zEUoqG6ogjcocabXPd
 5HRIprqNz6A2ifw5YdOaBte1NU8PSjsM7dYsLtuncyOBUSl8XzUtShhX9injxNWDnB7K
 bi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gNUEx8m5Ci3AhkJ9L85gRhMaE2ah4j4mk7binwFYxo4=;
 b=YaHAW/1ao/kqitBbYnUDf7iSIMXF7qn110Y34kCcSJXKMTPwfpDx3j819I2/ODCyKc
 ccuY4sDo/vvn/J8Ld+i0Eg3OHxDNwJ5da7kTub63q9M1crxtpp7wid0733ZygHLwKkD0
 thLYJyteLMrPkn0iupsAF3Xxm1SrRKceTrHSN/fNJiiwlL3Z/bCHHJzMfX8WA0aXWKN/
 nXYg9IrU1SULFMKA1N42rFJI6AjFM+Cv1LOYUxOnBfhYz2oU31SkfdbCxt4LwWbCfmEX
 /aKXAqLW+wSwjaS9YZK7bSiKUMEEqLKACfHCrbBXuNvo5FxaOckEb7OvNMuVSOMqvTkx
 1odQ==
X-Gm-Message-State: AOAM531awyw1C3y1y+HfvyYfsLxpypoaSL8dNXDo8gy85froDRMQYOMk
 yo0tZIV5Sc9vMQ3po0xd+f/8e0pItDGG9rx9iEg=
X-Google-Smtp-Source: ABdhPJwabA+5JoiSPX7Y86UOc7pc7ms437M7LQTTS/JGSK0ldmB5G2pLr+Gco/VPKuylibl/OD/5HFw+lv7xKwphgrY=
X-Received: by 2002:a17:906:b051:: with SMTP id
 bj17mr34448190ejb.317.1625861052102; 
 Fri, 09 Jul 2021 13:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210709180944.2533114-1-ztong0001@gmail.com>
In-Reply-To: <20210709180944.2533114-1-ztong0001@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 Jul 2021 06:04:00 +1000
Message-ID: <CAPM=9twS2B-bY8_AxB0mEVtr_2N3y3AyWjL2SNvOHA8tSMRSMQ@mail.gmail.com>
Subject: Re: [PATCH v1] fix vmwgfx compilation error due to a missing include
To: Tong Zhang <ztong0001@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cc'ing Christian to fix this I assume it was ttm refactor?

>
> This patch fixes vmwgfx driver compilation error due to a missing include
>
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function =E2=80=98vmw_vram_manage=
r_init=E2=80=99:
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:678:8: error: implicit declaration of=
 function =E2=80=98ttm_range_man_init=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
>   678 |  ret =3D ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
>       |        ^~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function =E2=80=98vmw_vram_manage=
r_fini=E2=80=99:
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:2: error: implicit declaration of=
 function =E2=80=98ttm_range_man_fini=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
>   690 |  ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
>       |  ^~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
>
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 6f5ea00973e0..6eb93aa2f311 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -37,6 +37,7 @@
>  #include <drm/drm_sysfs.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_range_manager.h>
>  #include <generated/utsrelease.h>
>
>  #include "ttm_object.h"
> --
> 2.25.1
>
