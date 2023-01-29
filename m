Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5867FC4A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 03:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7746710E050;
	Sun, 29 Jan 2023 02:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FAF10E050
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 02:13:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65F7CB80BEA
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 02:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB84C4339C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 02:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674958380;
 bh=bDBCMu/zp8KjdqS3kbfEEJifaegCwLaj9SYK4obytd4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IO5XW3WULpEnzd4xFl9C0XW1AThAkrj3dsblKaf5+atHlkwaAzHJter9AKUKFPJX2
 /JRAtIpxSoZaMxMp+b9wFdLnTyIKQAVHgRwVqEUKr56HjFH9tr8M8Cy6dnImwVctGa
 krhNjbI21aohw0IufJ6X0mCnKlMUgIwIPFFlH5ePp1KEIyNopVd4WsLz5lI3arsKFx
 DeDlyzBiXvI3Qz+h4jraJZvow2tofh36qELB0cm0WPhNsBDamZoZeBBe41uaicDicX
 O24ez/nFrxyGXl5EssymlMLJbfqu1d4BPjQ0yMvJOjyFIPt+XnxCu2uJcn7atOj58S
 1WS/YKZ2EvC2g==
Received: by mail-lj1-f178.google.com with SMTP id u27so2930726ljo.12
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 18:12:59 -0800 (PST)
X-Gm-Message-State: AFqh2kp9qctxQKN6GqK4LjJ9qgABqxEXtLu5n82l2+xD6ZRICJS4LJ/0
 4Om4boXEqsop1qt5ox9BorXPQK72/SGa9epjlQ==
X-Google-Smtp-Source: AMrXdXshUXXA9XhEjUJCThTvj3W2ig/URidG30bwfoNNiTptwiWYB7juno5yIjwBpSxxDjxTUvjSkRcPFqRJH6TADrA=
X-Received: by 2002:a2e:a80b:0:b0:28b:802d:ecee with SMTP id
 l11-20020a2ea80b000000b0028b802deceemr2952306ljq.259.1674958378087; Sat, 28
 Jan 2023 18:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20230127165409.3512501-1-robdclark@gmail.com>
In-Reply-To: <20230127165409.3512501-1-robdclark@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 29 Jan 2023 10:12:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-fCTpZs9-LU+MaMd0EMrQQW51OLjQwnixupEVu-Vr5Ug@mail.gmail.com>
Message-ID: <CAAOTY_-fCTpZs9-LU+MaMd0EMrQQW51OLjQwnixupEVu-Vr5Ug@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove unused GEM DMA header include
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rob:

Rob Clark <robdclark@gmail.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8828=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:54=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Rob Clark <robdclark@chromium.org>
>
> No longer needed since the removal of dependency on DMA helper.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 2ea8aec56bf1 ("drm/mediatek: Remove dependency on GEM DMA helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index cd5b18ef7951..7e2fad8e8444 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -20,8 +20,8 @@
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
> -#include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_ioctl.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> --
> 2.38.1
>
