Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4B3D2632
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 16:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9362A6E995;
	Thu, 22 Jul 2021 14:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F98E6E908
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:51:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EC716135B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626965462;
 bh=rDztPuOCPFJ2+9Ze3k5dwFEynafTrGKeqobicVKw0AE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FItAMBymdxGzE4ZHnb6y7paPVcwIvjAQoCODh7Z7Y9b2pREP3xZLYJVFFc8i6JaI6
 NKwsseq8ZxOu0uGb2GWdT5RT8ytt3z6CxOfxoujOICsIByCHCntEwzUsd+9UZf7yRP
 Pz/cjokpbvQJJ/VkRqc77RDTmz5QwQrifU0+ssD70ahtWjKp+fPFhaQp0IwzRHe/uc
 1cCFxb4mIZDDGWcqpMvelgnPv04SD1FwFyl84Thqyrbg8Fsmj0V++uYSJi8TyHJ+wx
 NlIp7b80918wMbpVsNOqfXFa7KhNM1r39xSFDW4ajWj3eB1BmAmcf/Xp3SLm4y3ahk
 3SZpZ7AE4L0fA==
Received: by mail-ej1-f41.google.com with SMTP id go30so8749071ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM53037ZuLqvGkasKOwt88g79xJquWYxnCJhojoqEgjASTHiSjtFbf
 SPRWFC3NIr60+JXBVyAO5MySSDT+qUy474v8IA==
X-Google-Smtp-Source: ABdhPJz5/mZnlsGNENhdYohpLuYZ4p4GiuUxXURD2qTRYS9LvglwExorQzU2DBR/RKJAnW7NgpdmBLF7z8dFTiQQSug=
X-Received: by 2002:a17:906:c097:: with SMTP id
 f23mr293790ejz.194.1626965460605; 
 Thu, 22 Jul 2021 07:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210712094657.1159299-1-hsinyi@chromium.org>
In-Reply-To: <20210712094657.1159299-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Jul 2021 22:50:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8b7KjPG+MarO8Z74FqpCOyDwnHmON2xMUvc6pub6Mjjg@mail.gmail.com>
Message-ID: <CAAOTY_8b7KjPG+MarO8Z74FqpCOyDwnHmON2xMUvc6pub6Mjjg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk-dpi: Set out_fmt from config if not the
 last bridge
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-yi:

Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2021=E5=B9=B47=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=EF=BC=9A
>
> atomic_get_output_bus_fmts() is only called when the bridge is the last
> element in the bridge chain.
>
> If mtk-dpi is not the last bridge, the format of output_bus_cfg is
> MEDIA_BUS_FMT_FIXED, and mtk_dpi_dual_edge() will fail to write correct
> value to regs.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index bced555648b01..25c565f9179cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -610,6 +610,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_br=
idge *bridge,
>
>         out_bus_format =3D bridge_state->output_bus_cfg.format;
>
> +       if (out_bus_format =3D=3D MEDIA_BUS_FMT_FIXED)
> +               if (dpi->conf->num_output_fmts)
> +                       out_bus_format =3D dpi->conf->output_fmts[0];
> +
>         dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
>                 bridge_state->input_bus_cfg.format,
>                 bridge_state->output_bus_cfg.format);
> --
> 2.32.0.93.g670b81a890-goog
>
