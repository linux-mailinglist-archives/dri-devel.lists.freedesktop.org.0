Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D972A39EAA2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 02:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD1E6E04E;
	Tue,  8 Jun 2021 00:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ED96E04E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 00:18:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8B3061249
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 00:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623111519;
 bh=NBPR/t6DpZyrcU0kswew7pL5+ZXvRXVXN2mhIR75M3A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RYjlClA4V2R9D7bZqlw2hdpZ/Yixnl+fHOYsSexS0UpHyn4UlrgdUsUQqBbnyPVc3
 ieYMJyI+lnIeqw7SK0xDNFvMDKbBwTP8FcS3DauoJi2wyDym2V6l7iH21+XNd6PBgj
 qun4woR4S7VWxwW7wENyW9FJNLc7mxchf3Z/Tt1kUjP5PFy+EF5xr14cS14mSxIlpA
 WLK39d75GrmAg9+hlEGW++7Ay2THyiVQFHjFh4UALwGyfUDv/9DnxhqdOmuMb1QQTw
 HhIXCLu7aL9251rW7/oXNT4f7a2c47Xb7cF0vKybiqytmVzDG0miorod+r3ReVhH6O
 cvHAJaQTLkFTg==
Received: by mail-ej1-f42.google.com with SMTP id h24so29610034ejy.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 17:18:39 -0700 (PDT)
X-Gm-Message-State: AOAM532+IzpoGZmAm3oMcGUMgiG4d513pbacM/O0MUtKB48OjYzqhhoM
 ekelKVaidYsX90vbkEQOmEKSKZdIt1KdOjRcKA==
X-Google-Smtp-Source: ABdhPJzndobiLhNjhOA4a7KXYaL6sXYZqGPxAn2dbv51QSkEkDv6RsyhwbgaVH6hMrbCM0A78i6voDNrMTPycwcs2lQ=
X-Received: by 2002:a17:906:b0cb:: with SMTP id
 bk11mr20679861ejb.310.1623111518484; 
 Mon, 07 Jun 2021 17:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210603111455.5963-1-bernard@vivo.com>
In-Reply-To: <20210603111455.5963-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Jun 2021 08:18:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-QpO1d6+jnQsun8htG8sGqrVVA3Jy1kvLqOZC+CExxTQ@mail.gmail.com>
Message-ID: <CAAOTY_-QpO1d6+jnQsun8htG8sGqrVVA3Jy1kvLqOZC+CExxTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: remove redundant error log print
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bernard:

Bernard Zhao <bernard@vivo.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=883=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Fix coccicheck warning:
> drivers/gpu/drm/mediatek/mtk_dsi.c:1074:2-9: line 1074 is
> redundant because platform_get_irq() already prints an error.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index ae403c67cbd9..e2e4fc8b1360 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1082,10 +1082,8 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>
>         ret =3D devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
>                                IRQF_TRIGGER_NONE, dev_name(&pdev->dev), d=
si);

devm_request_irq() would have below call stack to allocate memory.
When allocate memory fail, it would not print any error message,
doesn't it?

devm_request_irq() -> devm_request_threaded_irq() -> devres_alloc() ->
devres_alloc_node() -> alloc_dr() -> kmalloc_node_track_caller()

Regards,
Chun-Kuang.

> -       if (ret) {
> -               dev_err(&pdev->dev, "failed to request mediatek dsi irq\n=
");
> +       if (ret)
>                 goto err_unregister_host;
> -       }
>
>         init_waitqueue_head(&dsi->irq_wait_queue);
>
> --
> 2.31.0
>
