Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47BC483118
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 13:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9D010E125;
	Mon,  3 Jan 2022 12:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBC210E125
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 12:39:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F0E3DB80DB8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 12:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8DFC36AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641213572;
 bh=HA5+7zlAQulQBX2cVKSU6TdiKadRflwBDFVjRsvDYVs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y0ULpnBT0g0UDp17/4EORGndRjm7el0EeYgKUeSEw83DwfhCNt1nMc1+vddEL5Ou7
 bPzt+l5Ubr4AcXtgbzR2BlVthJjHVIbjjiKVBipgSb/0/FHfUCBDf82E7v8kyjDZBE
 ZcAgfMZU7Rl9uu+KJt47Ia2y7TwZlhVvinjZFcNyEOGEzbHhuRs5I/GYS0bkHd2qGD
 QYC9v0gfS4sRqkaSPTb3u7JMcgYCecaocxSiV/Zz8/8hWZvtbp3CHPfXljS2yppNS9
 36MXQ0CNl6QApNUwd2jlQ/nf0pUHXluqKjC4asuvc/RdqAEofQgt5AEGU7t8AJdD6A
 D4KMOLZIpkoyw==
Received: by mail-ed1-f49.google.com with SMTP id u25so14112264edf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 04:39:32 -0800 (PST)
X-Gm-Message-State: AOAM531U+LxBSxv99/isbiclYJhNXZmJZjM96NDF4nhhDEmWnemHHRha
 sRUMvri8aY+1DXHh5n8zxNbG1mTaNQWSI/Gofw==
X-Google-Smtp-Source: ABdhPJwwZ/3BPywQvW5Rrs1+664TaJh3FdH4vjHV6vG9LTySPj2+KPJh8eExMszOptrw3vU1ySFcU2qa6PxV5c3PjyU=
X-Received: by 2002:a17:907:629a:: with SMTP id
 nd26mr37424097ejc.680.1641213570556; 
 Mon, 03 Jan 2022 04:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211229184420.793234-1-markyacoub@chromium.org>
In-Reply-To: <20211229184420.793234-1-markyacoub@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Jan 2022 20:39:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9E71AfKy_poZMA7s++TvzM4=VH0H1o8ZBmDphcz9iXDw@mail.gmail.com>
Message-ID: <CAAOTY_9E71AfKy_poZMA7s++TvzM4=VH0H1o8ZBmDphcz9iXDw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Set default value for Panel Orientation
 connector prop.
To: Mark Yacoub <markyacoub@chromium.org>
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
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Mark:

Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=882:44=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> [Why]
> Creating the prop uses UNKNOWN as the initial value, which is not a
> supported value if the prop is to be supported.
>
> [How]
> Set the panel orientation default value to NORMAL right after creating
> the prop if no DSI panel exists.
> Panels have their own orientations, and panel orientation can't be
> overriden once initialized to a value.
>
> v1:
> Set panel orientation only if DSI panel does not exist.
>
> Tested on Jacuzzi(MTK)
> Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 0ad7157660afa..9d33dd93118e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1040,6 +1040,13 @@ static int mtk_dsi_encoder_init(struct drm_device =
*drm, struct mtk_dsi *dsi)
>                 goto err_cleanup_encoder;
>         }
>
> +       /* A drm_panel can have its own orientation. If there is no panel=
, set the
> +        * orientation to NORMAL. */
> +       if (!dsi->panel) {

Please send patch based on latest kernel version. In latest kernel
version, struct mtk_dsi{} has no member 'panel'.

Regards,
Chun-Kuang.

> +               drm_connector_set_panel_orientation(
> +                       dsi->connector, DRM_MODE_PANEL_ORIENTATION_NORMAL=
);
> +       }
> +
>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;
> --
> 2.34.1.448.ga2b2bfdf31-goog
>
