Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DEA67FC15
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 02:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3CA10E01F;
	Sun, 29 Jan 2023 01:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31F510E01F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 01:27:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23FE760C69
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 01:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87239C433D2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674955677;
 bh=mIyF7jlWADkWw9AY8oz5e0Hg7GQ/xOB3nucuRUy5HDM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ujw0AAvn3nhSz0pjY8obTtRU8u3SlS31u9V32QJI5IrFf7b8zy2BG74kDzvZWbnFI
 Bh2ok86s6aBmi34Fysi5RwdnRQ0KMepnzh7xS9x5RXv9ns79G6n4UHBcht5JazzJL6
 0TMGFQqeANrF5u1WdCtCtkAha6g+KnzFs3P6YAoaS9ctXUzvt/rva6oHOaRrKF5ljk
 V/nC/iP/3jNlJg1NkRfirmgv4y+0o+0SVmGIXPeUUzclrmQlLfYf0v1a2Az1afpCbS
 xSMg5xBaAAMf/mDQXm52WLBos3li9K2P92ZrWtg5dSG32kB4NHD2W8UTpj2IX8GG8m
 bCuq0IXMeW+rg==
Received: by mail-lf1-f43.google.com with SMTP id y25so14064842lfa.9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 17:27:57 -0800 (PST)
X-Gm-Message-State: AFqh2kqcLx1ONo0y3WOpIPdzbGCvQrDjqB5nHYp6IX+rlHxPz9uC2CNR
 spuEPrqRmXL4Z3Pkp2f2uXLswap8AySVnH8ylQ==
X-Google-Smtp-Source: AMrXdXvwYhYIje9oY6RR+/yUIKdNsbwcgB8kH63XKH4ThRsuXe9Yblb+SgpYteGwcOABD+DQnVzUyfOpuQg1MQrqk+Q=
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2aed:39be with SMTP id
 y12-20020a0565123f0c00b004b52aed39bemr5530009lfa.195.1674955675573; Sat, 28
 Jan 2023 17:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20221128-mtk-drm-v1-0-409e7f2352e4@chromium.org>
In-Reply-To: <20221128-mtk-drm-v1-0-409e7f2352e4@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 29 Jan 2023 09:27:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=87WTtsYhjMKi+t8-ffu0FTw2vokzeVBOSsGsWCznjA@mail.gmail.com>
Message-ID: <CAAOTY_9=87WTtsYhjMKi+t8-ffu0FTw2vokzeVBOSsGsWCznjA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Implement shutdown
To: Ricardo Ribalda <ribalda@chromium.org>
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Ricardo:

Ricardo Ribalda <ribalda@chromium.org> =E6=96=BC 2022=E5=B9=B411=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:42=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Poweroff the device properly, otherwise the device will not come back
> from kexec().
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 91f58db5915f..51dbd85796e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -829,6 +829,12 @@ static int mtk_drm_remove(struct platform_device *pd=
ev)
>         return 0;
>  }
>
> +static void mtk_drm_shutdown(struct platform_device *pdev)
> +{
> +       component_master_del(&pdev->dev, &mtk_drm_ops);
> +       pm_runtime_disable(&pdev->dev);
> +}

Would it be better to implement like rockchip [1]?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/rockchip/rockchip_drm_drv.c?h=3Dv6.2-rc5#n462

Regards,
Chun-Kuang.

> +
>  static int mtk_drm_sys_prepare(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> @@ -856,6 +862,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
>  static struct platform_driver mtk_drm_platform_driver =3D {
>         .probe  =3D mtk_drm_probe,
>         .remove =3D mtk_drm_remove,
> +       .shutdown =3D mtk_drm_shutdown,
>         .driver =3D {
>                 .name   =3D "mediatek-drm",
>                 .pm     =3D &mtk_drm_pm_ops,
>
> ---
> base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
> change-id: 20221128-mtk-drm-ca6c5ac6b389
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
