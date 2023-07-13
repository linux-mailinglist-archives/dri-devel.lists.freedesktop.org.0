Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CE751A79
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682E910E5FC;
	Thu, 13 Jul 2023 07:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9010E5FC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:56:38 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3459baa237bso1590675ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689234997; x=1691826997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWwEsAQnXaQRkW6Shvt1/+D7e1Ci6uGSzgoWth1dUeg=;
 b=n0SzY4H4kCH+4yBRfg+Ryn5JJzBOHQwYfP72Z54T9imN35vX4sSyky7tpSC/O7+Bvw
 u2owW/HzgWThDmMAkkfjheDgSCjycdrGijw3uWC9m1+gWLj8WDh7nTFpMMqE/qTmJP7a
 9wnJQAHSKZd82Q1YFCWTYhYL5wAqjupkpPVnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689234997; x=1691826997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWwEsAQnXaQRkW6Shvt1/+D7e1Ci6uGSzgoWth1dUeg=;
 b=fOTPTStGOSgVsS1ynpS8azSLedbCQ7Zu72iMY0ejATAmrFui3stguTlungjgX1nezi
 BFSweHyrPUlcks0ce29sowuKjP14xgYZ5m3cP06I47nUjJASqiWsLWcvBcxF3On9ui2n
 O5tBME4ic/WVE/Eac/ajRuAq9MnP1ErlaGRODFF5AjIafpLSiskd6JwJNu4vUJvCXeXG
 nIdau/5FNg8g5WFzMRpU7x1SoJ3URVoHFX7WPFm9Dk6BminRXyXw08u7cl5Gjs0lrvLg
 fGXnJ3XmMEMo1Fw3Wvdt6VSnHY0oFzEGAp/ggYAWE3koFLGICK0H1FevO7UmmoFp9ug+
 F9qQ==
X-Gm-Message-State: ABy/qLaBXF25UTO71Vi5bDXuJ+gIs9d6+u/4xTgZV/DiNou4p9Np7hIA
 WkJzfxNh4pylB3p54uUEccnST7Oi2dZsx6xv/6Q=
X-Google-Smtp-Source: APBJJlHyHhKs0gNIsZYuEz3+afA6yxVt0W7HpL16oVr/z1Pfj63QVqWaNZc46w66cY/3L2kHYQv7eA==
X-Received: by 2002:a92:dcc7:0:b0:347:7286:af43 with SMTP id
 b7-20020a92dcc7000000b003477286af43mr443992ilr.10.1689234996940; 
 Thu, 13 Jul 2023 00:56:36 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54]) by smtp.gmail.com with ESMTPSA id
 b9-20020a92ce09000000b00345c92c86casm1882872ilo.33.2023.07.13.00.56.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 00:56:36 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-78362f57500so12316539f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:56:36 -0700 (PDT)
X-Received: by 2002:a5d:850f:0:b0:786:6180:76f6 with SMTP id
 q15-20020a5d850f000000b00786618076f6mr1349053ion.12.1689234995825; Thu, 13
 Jul 2023 00:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 15:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
Message-ID: <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
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
> Change drm_bridge_add() to its devm variant to slightly simplify the
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 948a53f1f4b3..2d5f3fc34f61 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1090,11 +1090,12 @@ static int mtk_dpi_probe(struct platform_device *=
pdev)
>         dpi->bridge.of_node =3D dev->of_node;
>         dpi->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>
> -       drm_bridge_add(&dpi->bridge);
> +       ret =3D devm_drm_bridge_add(dev, &dpi->bridge);
> +       if (ret)
> +               return ret;

And also drop the drm_bridge_remove() call in mtk_dpi_remove()?

Regards,
Fei

>
>         ret =3D component_add(dev, &mtk_dpi_component_ops);
>         if (ret) {
> -               drm_bridge_remove(&dpi->bridge);
>                 dev_err(dev, "Failed to add component: %d\n", ret);
>                 return ret;
>         }
> --
> 2.40.0
>
>
