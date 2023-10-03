Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E57B6CC6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 17:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D7010E2A9;
	Tue,  3 Oct 2023 15:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27E610E2A9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 15:14:45 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-49b289adca9so461861e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696346084; x=1696950884;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G502n/pwsi2xTvXRats/u+gp/KdtO1vpg74dn53OTQA=;
 b=Jf13adBsr0sGshwleMBJaE9XRpm2gQjUzCs+8hLW5r+JVsQ7mEpspZ1dCwWKgEAMW8
 qFMiOPnPsNJiqM2rdQtGdMfN/xQ7oNFez/W+D44Yq8Om5p1L58tDhRa96bEEsf8SC9sq
 2KQZ6KDrCV6UVUCyabWLxLHMmQ/tPk/9PMjsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696346084; x=1696950884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G502n/pwsi2xTvXRats/u+gp/KdtO1vpg74dn53OTQA=;
 b=Xq+GKHYONLFxrWqVcuV+MlwR+3/Vkjt6408Jq46clARXorXft89ZvLzYZp66WR7OHE
 eKPpI1gytgz7C55BYCgxD1YUD6aRIfCqAqRKoLr0z2SoFufTBcRSvlo3+D9Nvaj0VYlw
 ru5bE5r+aIVt0s0Th/aiIudpZDrFNV/TYLOd9Wye0u8EVtBz/Y/NYONgOZo8V8mhvgRc
 ZQoMbO4unfEzvEszEDFWV6DcGzDt2H7OCk0SJBm4eIGXWBHo4paY+s/AbgAhLOo2gyJt
 s/iXwwmOKUd69VPreClFm0hQdFkz9G7taOwUXS7kE4N0+8GiqWfH6lJ39Im2GCBX/gld
 dHfQ==
X-Gm-Message-State: AOJu0Yy5dFdOZ7Mg2FVCBVzBfIyp+PioORuA35jPnoc1wrzsoYsjE2EO
 3KlR1tft4GvQ9jgep+KSQLY+b6HzgCQwmZTbRmCLrQ==
X-Google-Smtp-Source: AGHT+IE/6Au/gznWe0uscOHVdLMkX8BB30auBURWqNJQkqlDdcHAYId8L5b/3Rv4xpPT82JY5VHI6w==
X-Received: by 2002:a1f:c305:0:b0:495:c10c:ec39 with SMTP id
 t5-20020a1fc305000000b00495c10cec39mr11435560vkf.2.1696346084296; 
 Tue, 03 Oct 2023 08:14:44 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43]) by smtp.gmail.com with ESMTPSA id
 k5-20020a056122106500b0049a9ad3336dsm184172vko.25.2023.10.03.08.14.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Oct 2023 08:14:43 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-452749f6c47so577305137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 08:14:42 -0700 (PDT)
X-Received: by 2002:a05:6102:274c:b0:452:9384:139a with SMTP id
 p12-20020a056102274c00b004529384139amr13589952vsu.22.1696346082550; Tue, 03
 Oct 2023 08:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231002092051.555479-1-wenst@chromium.org>
In-Reply-To: <20231002092051.555479-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 3 Oct 2023 23:14:06 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
Message-ID: <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Correctly free sg_table in gem prime vmap
To: Chen-Yu Tsai <wenst@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 2, 2023 at 5:21=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The MediaTek DRM driver implements GEM PRIME vmap by fetching the
> sg_table for the object, iterating through the pages, and then
> vmapping them. In essence, unlike the GEM DMA helpers which vmap
> when the object is first created or imported, the MediaTek version
> does it on request.
>
> Unfortunately, the code never correctly frees the sg_table contents.
> This results in a kernel memory leak. On a Hayato device with a text
> console on the internal display, this results in the system running
> out of memory in a few days from all the console screen cursor updates.
>
> Add sg_free_table() to correctly free the contents of the sg_table. This
> was missing despite explicitly required by mtk_gem_prime_get_sg_table().
>
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap funct=
ion")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Please merge for v6.6 fixes.
>
> Also, I was wondering why the MediaTek DRM driver implements a lot of
> the GEM functionality itself, instead of using the GEM DMA helpers.
> From what I could tell, the code closely follows the DMA helpers, except
> that it vmaps the buffers only upon request.
>
>
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9f364df52478..297ee090e02e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -239,6 +239,7 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj=
, struct iosys_map *map)
>         npages =3D obj->size >> PAGE_SHIFT;
>         mtk_gem->pages =3D kcalloc(npages, sizeof(*mtk_gem->pages), GFP_K=
ERNEL);
>         if (!mtk_gem->pages) {
> +               sg_free_table(sgt);
>                 kfree(sgt);
>                 return -ENOMEM;
>         }
> @@ -248,11 +249,13 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj, struct iosys_map *map)
>         mtk_gem->kvaddr =3D vmap(mtk_gem->pages, npages, VM_MAP,
>                                pgprot_writecombine(PAGE_KERNEL));
>         if (!mtk_gem->kvaddr) {
> +               sg_free_table(sgt);
>                 kfree(sgt);
>                 kfree(mtk_gem->pages);
>                 return -ENOMEM;
>         }
>  out:
> +       sg_free_table(sgt);

I think this will cause invalid access from the "goto out" path -
sg_free_table() accesses the provided sg table pointer, but it doesn't
handle NULL pointers like kfree() does.

Regards,
Fei


>         kfree(sgt);
>         iosys_map_set_vaddr(map, mtk_gem->kvaddr);
>
> --
> 2.42.0.582.g8ccd20d70d-goog
>
>
