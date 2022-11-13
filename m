Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1DB62738D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 00:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EC210E251;
	Sun, 13 Nov 2022 23:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C826A10E251
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 23:43:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56B86B80C69
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 23:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A409C43148
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 23:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668382979;
 bh=YhBmoJClwwLaG6pFbcXCvtNj02bEMXAJKc5YoyE2/Jc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HxCqNJWzpYW1U+TSAAQAX+WeVsEjCgsDGJdviA3dQ7LpSjrAIzBy5rzGRjUk7Dw0M
 Va40tirMy4+1T5yBgECF5+g4FIEY5F/FTmhpPdB34IQAeP0t8WLjfNX8CJpl9tBO1C
 fijT/pOL/34tI7KVgtHiykEMFio65Z71Hx88JRClkKDtRLUtydSaPzYPrMiLwdsPl0
 y6VsEwsKg56PqHTFQ+cTwmRs6TAgWYjFNAhRMTmRpwgXjSu4HKta1XT31RxIoqEOum
 nqmxiEl3BdeagjFxLAH4IIx8jwJ2hw/bCOfGpOGHubZafbRXYLyShxu146WaF7utal
 vGmqFG3g+cgug==
Received: by mail-ot1-f41.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso5830225otb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 15:42:59 -0800 (PST)
X-Gm-Message-State: ANoB5pkv7C04QZnty+kzmx3299jmuICCSP911x4Q2IBBEwd/skHQKiq0
 uHziZEWOLuQv5vHPLTWbzwvlkvay+y+6uAicRg==
X-Google-Smtp-Source: AA0mqf4dw9k7/aX3sr0Epp+vMlFAUJPtXt/UgGNulv9B+nEzFDMr/G+7MbLXsPPm/jw0m3bmJ3ETUacg8e5jpvNkA3w=
X-Received: by 2002:a9d:4b02:0:b0:661:b04c:41d9 with SMTP id
 q2-20020a9d4b02000000b00661b04c41d9mr5389182otf.92.1668382978648; Sun, 13 Nov
 2022 15:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20221110184852.1848917-1-gildekel@chromium.org>
In-Reply-To: <20221110184852.1848917-1-gildekel@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 14 Nov 2022 07:42:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY__b1uOkX9Tb--tq7YwjgZHftNxUUMZe1op6HiKjb2qXWg@mail.gmail.com>
Message-ID: <CAAOTY__b1uOkX9Tb--tq7YwjgZHftNxUUMZe1op6HiKjb2qXWg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: make eDP panel as the first connected
 connector
To: Gil Dekel <gildekel@chromium.org>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 seanpaul@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gil:

Gil Dekel <gildekel@chromium.org> =E6=96=BC 2022=E5=B9=B411=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> [Why]
> Some userspaces assume that the first connected connector is the "main"
> display, which supposed to display, for example, the login screen.
> For laptops, this should be the internal connector.
>
> [How]
> This patch calls drm_helper_move_panel_connectors_to_head() right before
> crtc creation to ensure internal connectors are at the top of the
> connector list.
>
> Tested by ensuring the internal panels are at the top of the connector
> list via modetest -c.
>
> This patch does to mediatek what the following patch
> https://www.spinics.net/lists/stable/msg590605.html
> did for qualcomm.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> Tested-by: Gil Dekel <gildekel@chromium.org>
> ---
> v2: Fix copy-paste errors in commit message so it's relevant for this
>     patch and the mediatek driver.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 91f58db5915f..76daaf6a0945 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         if (ret)
>                 goto put_mutex_dev;
>
> +       /*
> +        * Ensure internal panels are at the top of the connector list be=
fore
> +        * crtc creation.
> +        */
> +       drm_helper_move_panel_connectors_to_head(drm);
> +
>         /*
>          * We currently support two fixed data streams, each optional,
>          * and each statically assigned to a crtc:
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
