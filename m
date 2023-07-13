Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52972751BA6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785710E5F8;
	Thu, 13 Jul 2023 08:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886BA10E5F8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:34:53 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-78362f57500so13207039f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689237292; x=1691829292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SyEkQpgIXNpGAjYikyKRrMbeGwRnjSnhMc5RNVKg7IY=;
 b=SuN0gI3WYHAX8shoQNwqeFprlVQ8IlcjG4+vVg3/k+WlhXvoKWl8Oyqp7BzSja8Ovm
 rflXUmOOO+A+Cbj3R1HjaMCxbrjQP8ZDFsfHR2jV5q3MQTS/n1V0JUV4KbPwR7GEzZZE
 mzHZd9R7IuWNDglILxglP65SjFO31Vrc0dfrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689237292; x=1691829292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SyEkQpgIXNpGAjYikyKRrMbeGwRnjSnhMc5RNVKg7IY=;
 b=LwORn8uiWDWSPLqmhyRkBdeogRaqxq38gJI5/kXEBluGJ51STQgYKuHcAxKTZ2TMrQ
 tmLwnuHg/8nGmCiA+21w1bZBe+DhVlo5lkzryPoWJ/pf5X+QpYn4Yky88fuGWde7nGv2
 X58YBe8A+J7+6+oHhJXAPNZxx2Yjoytlv8eqqnC6+s5zPdWvBEpTcVTvIkzk8XRDMVF8
 eLNJ/Hl2IHsGhBmd/IMSFbYk8ZAPWP0QFpzsMx+yzsFDh2xgwXHE1ggwmDKmUMJjuvY0
 57igDuVMzruyWdcvH2wYZFDB0fgYMZ/lCNfdhYshW5MuAtsJ+tKGJBOb62FiT9dWeg5u
 G+SA==
X-Gm-Message-State: ABy/qLa5yQUwnWPinbTRXBfbmfa3LO4LFZHJQmJYQCRcK0gLsjVCzgqV
 IpcR8Fm7w+mkzWwFibuM0HKVYW6cCy64Tv1La5g=
X-Google-Smtp-Source: APBJJlHr8CeI1isYTRQT3akjUPfUUaqQPAk902ODeTrey+kQG/xchNyuIQpPDHAoK+JvZA7SWtZbNQ==
X-Received: by 2002:a05:6602:1c4:b0:784:e618:e6cd with SMTP id
 w4-20020a05660201c400b00784e618e6cdmr1282946iot.20.1689237292491; 
 Thu, 13 Jul 2023 01:34:52 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41]) by smtp.gmail.com with ESMTPSA id
 t9-20020a02ab89000000b0042af7792d7dsm1682877jan.97.2023.07.13.01.34.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 01:34:51 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7836164a08aso13443839f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:34:51 -0700 (PDT)
X-Received: by 2002:a5e:c918:0:b0:786:f10e:a473 with SMTP id
 z24-20020a5ec918000000b00786f10ea473mr1591076iol.16.1689237291411; Thu, 13
 Jul 2023 01:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-5-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 16:34:15 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
Message-ID: <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/mediatek: mtk_dpi: Use
 devm_platform_get_and_ioremap_resource()
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
> Instead of the open-coded platform_get_resource, devm_ioremap_resource
> switch to devm_platform_get_and_ioremap_resource(), doing exactly the
> same.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 9025111013d3..45535dc7970f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1038,8 +1038,7 @@ static int mtk_dpi_probe(struct platform_device *pd=
ev)
>                         dev_dbg(&pdev->dev, "Cannot find pinctrl active!\=
n");
>                 }
>         }
> -       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       dpi->regs =3D devm_ioremap_resource(dev, mem);
> +       dpi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &me=
m);

"mem" appears to be unused elsewhere, so I assume
devm_platform_ioremap_resource() would be a better fit.

Regards,
Fei

>         if (IS_ERR(dpi->regs))
>                 return dev_err_probe(dev, PTR_ERR(dpi->regs),
>                                      "Failed to ioremap mem resource\n");
> --
> 2.40.0
>
>
