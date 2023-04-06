Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97CD6D8F4D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 08:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D408710EAE2;
	Thu,  6 Apr 2023 06:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2610EAE2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 06:20:53 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id m5so27158660uae.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680762052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Kz8SNhi1cpYQJqD/AT3lCWMWGthZUaWRueclcoldFw=;
 b=mPvWNRiVsTupIoec66q+0JGs7s/4YhEwZZ04g/jmghXnDUFI/6nyTIM1XQon4YhQ+d
 sUeW9y2q+BiIUCu5oCuJ39jm6hTaGPLWUN9o/Hyw+LUaoZQ6CaysXslzfjHm/cOGUY3J
 luBsHTXmU8iyVg2z19eX9ALbgMcoSCgUvfohw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680762052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Kz8SNhi1cpYQJqD/AT3lCWMWGthZUaWRueclcoldFw=;
 b=WX8cQwSjfbqbIuPQvFdq1gMdtYiouD3M+LnO47MLUa81aI4e+qL0dLdjhabF7h4bh+
 9XhGT+CCXwvi44hA0WZU4DavS7ByvIMRxgJchi9isDbzjtfK7sNZ3ux3TJ8r6mep4xbY
 XwudCwdVOWjrYSRU6kwHsghEfJ/ynvT7nRGzIsoqyhTG9O+6Yp2hRXXEGo/riynjFCHM
 3p28P2vx26i/kK5ZfEwzwf/OGpK2udQ0ej8hrF5ZzuMqXKO1dvWpbgV4iqe7zJWHeG5n
 ubg4g5+JP+DKWEc8kh/+Ee2tn67Cvu0jkgElIygpaUXGxJwblvbM8dHp5ehGOQu1ALSA
 tQew==
X-Gm-Message-State: AAQBX9c7aqXO26ZXx950cIGdkhO6Z5LhKDVl6lOX+n88uqNe0swzlDRE
 +mR/SUddcgqM6nnRXzRO+e953ugS+sOgvhs4+5tgKA==
X-Google-Smtp-Source: AKy350Yp2FIaz+ilkqlK7ibx9rFilAky16tPkK48Dbsh+GzGOd0UvkGhSb+M4eo0JEvts5cE5ZH/AYrK9lJqHNhSarI=
X-Received: by 2002:a9f:3110:0:b0:68a:a9d:13f5 with SMTP id
 m16-20020a9f3110000000b0068a0a9d13f5mr6292638uab.1.1680762052315; Wed, 05 Apr
 2023 23:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <20230404104800.301150-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230404104800.301150-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Apr 2023 14:20:41 +0800
Message-ID: <CAGXv+5HTPd_2r0Bb2nY94gUwWzpn_wvU_ZMYu6u9hWBeaVzrwA@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] drm/mediatek: dp: Change logging to dev for
 mtk_dp_aux_transfer()
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

On Tue, Apr 4, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change logging from drm_{err,info}() to dev_{err,info}() in functions
> mtk_dp_aux_transfer() and mtk_dp_aux_do_transfer(): this will be
> essential to avoid getting NULL pointer kernel panics if any kind
> of error happens during AUX transfers happening before the bridge
> is attached.
>
> This may potentially start happening in a later commit implementing
> aux-bus support, as AUX transfers will be triggered from the panel
> driver (for EDID) before the mtk-dp bridge gets attached, and it's
> done in preparation for the same.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index ac21eca0e20e..19b145cf2e05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -849,7 +849,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_=
dp, bool is_read, u8 cmd,
>                 u32 phy_status =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628=
) &
>                                  AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
>                 if (phy_status !=3D AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
> -                       drm_err(mtk_dp->drm_dev,
> +                       dev_err(mtk_dp->dev,
>                                 "AUX Rx Aux hang, need SW reset\n");
>                         return -EIO;
>                 }
> @@ -2061,7 +2061,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_au=
x *mtk_aux,
>                 is_read =3D true;
>                 break;
>         default:
> -               drm_err(mtk_aux->drm_dev, "invalid aux cmd =3D %d\n",
> +               dev_err(mtk_dp->dev, "invalid aux cmd =3D %d\n",
>                         msg->request);
>                 ret =3D -EINVAL;
>                 goto err;
> @@ -2077,7 +2077,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_au=
x *mtk_aux,
>                                              to_access);
>
>                 if (ret) {
> -                       drm_info(mtk_dp->drm_dev,
> +                       dev_info(mtk_dp->dev,
>                                  "Failed to do AUX transfer: %d\n", ret);

This part no longer applies cleanly due to

    drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER

Also I think all these calls could be collapsed into one line?

ChenYu

>                         goto err;
>                 }
> --
> 2.40.0
>
