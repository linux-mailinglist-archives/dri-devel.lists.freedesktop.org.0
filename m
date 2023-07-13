Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B3751B6C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7122310E1A0;
	Thu, 13 Jul 2023 08:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B70A10E191
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:24:45 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-345d3c10bdfso1738725ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689236684; x=1691828684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SC8wLptS4WXWt8bW8YWC7ooVYG9MHbSN/yLxSgqam3k=;
 b=OG+cmDQ9vAuwCIb4A70FoqcL/dGFjXJGwUAeRUHDub7+E9E50ulm8eNhwS3f1ite0M
 Z5P0Y9vVlBEED+T8dA8EzXAxWoKCGvswnN70yAnH42b1NqxzjjLSNwzKII/n+6qF6Lyn
 IoS12nMis2tiwaXVNnrUbkZWJxiluxvn78Tuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689236684; x=1691828684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SC8wLptS4WXWt8bW8YWC7ooVYG9MHbSN/yLxSgqam3k=;
 b=USRBLADNUBCk9fwlzL7aR9zfcFNHGXX/MiJr3d6IT9R0eBE9Nr//tjJc5br5gk/t+S
 ST23uxC9KmMm9JJPXeNU8YhSuEcozdPmKeuiuTb4dPHO2WVM8Vqqal3/P+7wdyUg1Qct
 cJKo140p1Mz0Ln1RvV5f7boh6y1i2M5viq8bWINPlUi5n6eMINeLvnLIvYcCrlHr9VFx
 gR7S8UyYe/27ya0FI6Ke/0S3LuQywyeVAoj6tHyNwD+6gVzhM7epyQ5CVBDL8Cp7nPBq
 Btwt9z89gw7SuLySeacA7KxIXLfDw5Lr3X6tOauSE2lZwGv3fUQEIYGwxwut35NkQR9p
 MEHA==
X-Gm-Message-State: ABy/qLYPFh5OtKuMkLolf8oh7AMUA/MzDNCLvty4wmOpIbW4boW2djzS
 vA0rxGO0XNQlirMfwSHtKFZdwn6RbaMwqkpuVic=
X-Google-Smtp-Source: APBJJlHj2zGLFnoiXMXiW/B/BSEwQAg/ekuv6S2o5o6kWFMGQ8Yy0QafgA7MWGWMRXwU4nMwsEK1Mg==
X-Received: by 2002:a92:d68c:0:b0:346:3eec:c893 with SMTP id
 p12-20020a92d68c000000b003463eecc893mr1022429iln.0.1689236684274; 
 Thu, 13 Jul 2023 01:24:44 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 f8-20020a056638022800b0042b2959e6dcsm1750686jaq.87.2023.07.13.01.24.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 01:24:43 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-78654448524so9227439f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:24:43 -0700 (PDT)
X-Received: by 2002:a6b:e70c:0:b0:777:8e86:7702 with SMTP id
 b12-20020a6be70c000000b007778e867702mr1334033ioh.16.1689236683371; Thu, 13
 Jul 2023 01:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 16:24:07 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
Message-ID: <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On Wed, Apr 12, 2023 at 7:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Function drm_of_find_panel_or_bridge() is marked as deprecated: since
> the usage of that in this driver exactly corresponds to the new function
> devm_drm_of_get_bridge(), switch to it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 6be65ea21f8f..9025111013d3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1063,10 +1063,9 @@ static int mtk_dpi_probe(struct platform_device *p=
dev)
>         if (dpi->irq <=3D 0)
>                 return -EINVAL;
>
> -       ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -                                         NULL, &dpi->next_bridge);
> -       if (ret)
> -               return ret;
> +       dpi->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0,=
 0);
> +       if (IS_ERR(dpi->next_bridge))
> +               return PTR_ERR(dpi->next_bridge);

The original code doesn't print any log so it's probably fine, but
given you're already at it, perhaps you want to also make use of
dev_err_probe() here?
devm_drm_of_get_bridge() can also pass -EPROBE_DEFER from its wrapped
drm_of_find_panel_or_bridge(). Furthermore, that will make the code
visually align with your previous patch.

But that's just optional, and since this patch works anyway,

Reviewed-by: Fei Shao <fshao@chromium.org>

>
>         dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_n=
ode);
>
> --
> 2.40.0
>
>
