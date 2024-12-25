Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392849FC554
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 14:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C98110E1B5;
	Wed, 25 Dec 2024 13:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lkiK3PMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FC610E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:31:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D02DEA403C8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77450C4CECD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735133488;
 bh=OgqqX+lTvRboKaPgE6eQ6OjOpOsQrtzv/dr+HjHyqpQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lkiK3PMUVPIq/5GhJ011cFCXZr/DkzkF9G2hv1r+LRdxrZXKEPEJO8HN6bK3WTJOI
 i0zlTfUoJTBEIGWMVpvXGvNLkplpCddspt5wyBdCHJSfZrVTVZaV/D0aYVLhUndVeU
 HLZHQTSXm2XoDPcKK3DWSNHo+yYwt3YR/Ic+4x/Pt+Mlz0Gj+5RLwOfZucwVfCVEwS
 DT4Lpna4/fNXa25BsWb3mRn6LjAlUm9/XY8YqAL6K75PAAekkh0Ya3sG3taVrYWSJt
 pdaIVlW+Vn12wz5AgXMo7GIIRjP3MYdQeCQOf1nwkU+HF3frR6Yyltlxv7qi5VcA+p
 4F3VpihmPHqWA==
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ee67e9287fso6333639a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 05:31:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWn6aVl8+pTG39QLj4QEmdPtPjajCs/HQ3OmERx4ZIy3ZeIEE6hQpzvHJqBMV9fgT1mpdiAvyiifeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHMXutsWRbbNpBzLEYGF1chDxSqmCjWKyyR30+o70UuIN8cFmm
 1IaYlKWpiUtO+9B49jTCKJMId52gbGC0eKYJTUJvj5CD19DygJHwT96IAtMT5nCoBE1Mf2UnsJL
 IM0xNI7SuBAxZbwzcl3UB35JHug==
X-Google-Smtp-Source: AGHT+IFjj5jLYnjM8STERl/xOhWv/K+zpDyfBlAfUpu18zlAIKlD62TX8OT29AP4UAQj6CvJ00PaXEonxrkWtDpMq5s=
X-Received: by 2002:a17:90b:2f0e:b0:2f4:4003:f3d4 with SMTP id
 98e67ed59e1d1-2f452ee5e54mr31287625a91.30.1735133488062; Wed, 25 Dec 2024
 05:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 21:31:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-GvQL7ROZ_P5kT0xCYB9iLnHe4L69ay_RDj4sjbGkwoQ@mail.gmail.com>
Message-ID: <CAAOTY_-GvQL7ROZ_P5kT0xCYB9iLnHe4L69ay_RDj4sjbGkwoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Fei Shao <fshao@chromium.org>
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B411=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:51=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> mediatek-drm driver reported the capability of 180-degree rotation by
> adding `DRM_MODE_ROTATE_180` to the plane property, as flip-x combined
> with flip-y equals a 180-degree rotation. However, we did not handle
> the rotation property in the driver and lead to rotation issues.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 74608d8feefd ("drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation pro=
perty")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index e0c0bb01f65a..cc825c4f2e09 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -472,6 +472,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>         unsigned int hdr_pitch =3D pending->hdr_pitch;
>         unsigned int fmt =3D pending->format;
>         unsigned int offset =3D (pending->y << 16) | pending->x;
> +       unsigned int rotation =3D pending->rotation;
>         unsigned int src_size =3D (pending->height << 16) | pending->widt=
h;
>         unsigned int blend_mode =3D state->base.pixel_blend_mode;
>         unsigned int ignore_pixel_alpha =3D 0;
> @@ -513,12 +514,19 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
>                         ignore_pixel_alpha =3D OVL_CONST_BLEND;
>         }
>
> -       if (pending->rotation & DRM_MODE_REFLECT_Y) {
> +       /*
> +        * Treat rotate 180 as flip x + flip y, and XOR the original rota=
tion value
> +        * to flip x + flip y to support both in the same time.
> +        */
> +       if (rotation & DRM_MODE_ROTATE_180)
> +               rotation ^=3D DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
> +
> +       if (rotation & DRM_MODE_REFLECT_Y) {
>                 con |=3D OVL_CON_VIRT_FLIP;
>                 addr +=3D (pending->height - 1) * pending->pitch;
>         }
>
> -       if (pending->rotation & DRM_MODE_REFLECT_X) {
> +       if (rotation & DRM_MODE_REFLECT_X) {
>                 con |=3D OVL_CON_HORZ_FLIP;
>                 addr +=3D pending->pitch - 1;
>         }
> --
> 2.43.0
>
