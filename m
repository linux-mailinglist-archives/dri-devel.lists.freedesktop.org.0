Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE7FD38A66
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 00:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244110E0F1;
	Fri, 16 Jan 2026 23:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SzmPgWNC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7899310E0F1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 23:51:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3005044491
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 23:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0389CC2BC86
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 23:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768607507;
 bh=78HHIyQq6HtcRgDAUe6py2URYh8Ya0TVMzsC4zKJWow=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SzmPgWNCCsSi+phi8oxPp+adInnEOL/OLW4XQhPqwhoXz6xKVBvhz0ese2ODer8B6
 g3D0HwWT2sYYrcj8RHHNiV4EDQHJFQ7n1JcTdAgFyqC2T6QpvlwlRRzm9AU2Hr1jf+
 koOKF3F9wNrg65Hj2JxU74WIflgDOHxK6Oi98v1/VZddVbbsbstDmGGAsPlg2U6vnj
 99uD9Xv1iw3PWoisBqOOVGIAv8433IPvBvliG7i/5yCeLHu8Co1aL0InU+uMl/xnv4
 e04jYDtyDUnIoS23DVnh21Vvo5a7xNu5+uxkET9+KRIaGQpa+tBbWRXn/po+Vtl9rt
 zL8e+k45fOJ6g==
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-121a0bcd364so3300923c88.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 15:51:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUNQDGnTQT4yZMtnjbizPt5eZlH9lGOVVMWc31shAOqfp4RICPPTUCDK9XiLA7rQiuU4zS47FDGJD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhlwtvDv4Su+OYtA8KvzHiQgig4cgdDlaCA4AdwzvMRA4gLu7q
 g9byABpmcWB5N3wrmlo88jFi6JI35N7L6jBvpasA9Z35LpQ64BsbIPbw3dJBzC76PZc2HZkrJQ/
 vYwmhRjkXTC4hhilKiy2PCq4jH4nVZw==
X-Received: by 2002:a05:7022:2394:b0:122:8d:3680 with SMTP id
 a92af1059eb24-1244a78c9e4mr3776921c88.40.1768607506346; Fri, 16 Jan 2026
 15:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 16 Jan 2026 23:51:34 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8roBx1nPqvaon6F-ittiotJfi_aZu-1jgwHZVbQ_uh0A@mail.gmail.com>
X-Gm-Features: AZwV_Qi3iCIeuX-2hrfld-Xfuvsl-3MOiLUpbyuk08dDI1xKsK1Z_v1DM9NSnaE
Message-ID: <CAAOTY_8roBx1nPqvaon6F-ittiotJfi_aZu-1jgwHZVbQ_uh0A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, bisson.gary@gmail.com, 
 kernel@collabora.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2026=E5=B9=B41=E6=9C=888=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:20=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Up until now, the MediaTek DSI Controller has always been working
> in Low Power Mode (LPM), as this driver has always ignored the
> MIPI_DSI_MSG_USE_LPM flag hence never setting HS mode.
>
> In the current state of the driver the only thing that is needed
> to add support for DSI High Speed (HS) transmit is to simply set
> the "HSTX" config bit in the configuration register.
>
> Check if flag MIPI_DSI_MSG_USE_LPM is set and, if not, set HSTX.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index e4953d5cb6a8..a90cae9512c5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -155,6 +155,7 @@
>  #define SHORT_PACKET                   0
>  #define LONG_PACKET                    2
>  #define BTA                            BIT(2)
> +#define HSTX                           BIT(3)
>  #define DATA_ID                                GENMASK(15, 8)
>  #define DATA_0                         GENMASK(23, 16)
>  #define DATA_1                         GENMASK(31, 24)
> @@ -1177,6 +1178,9 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const=
 struct mipi_dsi_msg *msg)
>         else
>                 config =3D (msg->tx_len > 2) ? LONG_PACKET : SHORT_PACKET=
;
>
> +       if (!(msg->flags & MIPI_DSI_MSG_USE_LPM))
> +               config |=3D HSTX;
> +
>         if (msg->tx_len > 2) {
>                 cmdq_size =3D 1 + (msg->tx_len + 3) / 4;
>                 cmdq_off =3D 4;
> --
> 2.52.0
>
