Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9467DC8E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 04:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF9F10E3DD;
	Fri, 27 Jan 2023 03:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C0610E3DD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:18:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E214CB81F85
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9025AC433D2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674789530;
 bh=yMqlqxCiTXbV0sP0tQtRNJGlz4yIWf+ozTmq0CkGlQQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P6jgqiXM8BVBHL56uLfm1UkhlNvMqPIi/hT1o64MO9DXD1PjyMy8pGKoP0EDvnWrF
 1VLtOfjs68otRVoa8oq6ur8Ff3exwsg24OWOwiCEPfXYKBFtua/i+VrH+xWmOiB9aF
 4NGLqOzt6Alr2+NLlq7/sqSeltc8dPCcNYe77tp92UHdm6PN1EGePXpuG3+crZFGgY
 fC5+CuskVGFNu3UeErdf6CoNy47PZnl3gclDBaEclmEVJGEMbrl78lWRZ6oAqHhgIU
 d+gGOheYNK6AQWq8DT2ykPw+xxOzDk+eyRczvDwshqvZNXLWNslZno5FkWDJ9UzAt2
 TFWAaYxHgUcPw==
Received: by mail-lj1-f179.google.com with SMTP id a37so4218554ljq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:18:50 -0800 (PST)
X-Gm-Message-State: AFqh2krewB8qcS6qy50iaSVdGCH0dWFGfY8L4c6MdNjFMmowra+0OKQ5
 Ik+DmrNkG7g57LfVVLpiH0IBEu1uc5OIeCuElQ==
X-Google-Smtp-Source: AMrXdXuKl/XfTZtyJDk7sSww33tWah9JPd78aB+WMh0SYqRDti1pFGSaFGG6NZv1jxA2fNc7q0W0F+cePoApqEB7OBM=
X-Received: by 2002:a2e:82cf:0:b0:28b:bde3:7871 with SMTP id
 n15-20020a2e82cf000000b0028bbde37871mr1699213ljh.269.1674789528603; Thu, 26
 Jan 2023 19:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20230119231255.2883365-1-robdclark@gmail.com>
In-Reply-To: <20230119231255.2883365-1-robdclark@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 11:18:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_81bQaU0CqavppEuXk9ZCr_V136KU_NURTGfmszz38FwQ@mail.gmail.com>
Message-ID: <CAAOTY_81bQaU0CqavppEuXk9ZCr_V136KU_NURTGfmszz38FwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop unbalanced obj unref
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Mao Huang <littlecvr@chromium.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Daniel Kurtz <djkurtz@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rob:

Rob Clark <robdclark@gmail.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=887:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Rob Clark <robdclark@chromium.org>
>
> In the error path, mtk_drm_gem_object_mmap() is dropping an obj
> reference that it doesn't own.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9b3d15d3a983..f961c7c7456b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -169,8 +169,6 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_obj=
ect *obj,
>
>         ret =3D dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
>                              mtk_gem->dma_addr, obj->size, mtk_gem->dma_a=
ttrs);
> -       if (ret)
> -               drm_gem_vm_close(vma);
>
>         return ret;
>  }
> --
> 2.38.1
>
