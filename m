Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A96F939B
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 20:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B519A10E05B;
	Sat,  6 May 2023 18:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ADE10E05B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 18:27:59 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24eab83867dso2717703a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 May 2023 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683397677; x=1685989677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/WwOrZJ5JRzyY6p6wiuOMAhVag97atAR6Wjafb+S2A=;
 b=Ed0WNNwC5JVc/UevED/FuEHi+jsrMHibsAXB7n0Hv6KblssEN8GuVTTkx3Jbl8zlne
 ifBfne1EIZ0L2ZEaowjD216ZVUWg8L4ItBmrxzS6sEbA31bCOzRvOMKRXshU3SiUU57N
 UJKp8EOaPvg4hrgAnrbeRf4yMMdbPlqTyghbQwrx/7GK62MefqKXuuaSs91fwA32Yjeq
 v4182toBBPBGXBJ+A+fes6LALCH2gP8JpwJdZ0I5CtVI8/Kr11V7B3BVeyn9jlW/Qpwt
 Tpk++Jr5DlDwk4y+EjpiKpd7BIALwuIsTUDP5MOSe8T+Qurrmr8Tfy08BZ1lCsBoYyoJ
 0MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683397677; x=1685989677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/WwOrZJ5JRzyY6p6wiuOMAhVag97atAR6Wjafb+S2A=;
 b=ErQnSt0KYYqHzI+/k9S6I4Carr5A5Xly2xMXt2N+RfC9/TDg00grqoiMPv4EKViXKG
 lxUSiAGep98gJgmsOg9w/9WSWawhMfpRowReK1weA1mMK5cL2FsuevbZgA7jT8rr+qH2
 hkgqNwSEoImDDfbKQtD8f+Yf/UocI0ohVfFHfl14gKkateDj+Nq/ehSfloV+9f4/GouC
 3/YwIcJoU1IAhISWwKpqvQL0tErggVXrc/mNU9eHgh8yMPL/d+WFLn9G+AL9QfmSP4h5
 0WTLb+SaYdGyz7cYzieN+ffzvl5i1KTYMSYO4ZsiUppdr6Rym0dLv4AynDfKNrCfZlwn
 dMDw==
X-Gm-Message-State: AC+VfDxEOcCrpzx8NWwc1k/zsovRCCrnAV4g2kxN7u7iywV6s9H3LUWq
 iPLpd3ILxU5vHTD+qw484gxSqI4Fm5vDEZuMhKVHPRkliL8=
X-Google-Smtp-Source: ACHHUZ4dhBfjviOJchXZhn3Bir28JhXsuvyGtA7iNiGJcSNaCo4NTvQnwHDdb/5h9wBmDdh6jHp/AFrFotWfZQm4Pd8=
X-Received: by 2002:a17:90a:9307:b0:24d:ef6a:dd0a with SMTP id
 p7-20020a17090a930700b0024def6add0amr5444552pjo.5.1683397677239; Sat, 06 May
 2023 11:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230506010933.170939-1-aford173@gmail.com>
 <20230506010933.170939-4-aford173@gmail.com>
In-Reply-To: <20230506010933.170939-4-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 6 May 2023 13:27:45 -0500
Message-ID: <CAHCN7xLQaqP19zeMy27uUjFxgigKgh8vDRRM1P_uEXzuw5bN=g@mail.gmail.com>
Subject: Re: [PATCH V4 3/6] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
To: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 5, 2023 at 8:09=E2=80=AFPM Adam Ford <aford173@gmail.com> wrote=
:
>
> Make the pll-clock-frequency optional.  If it's present, use it
> to maintain backwards compatibility with existing hardware.  If it
> is absent, read clock rate of "sclk_mipi" to determine the rate.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>


Sorry for the noise.  I forgot to merge in the suggested updates for
the messages so they don't look like errors.  A V5 is coming once I
merge and test the changes.

adam
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index bf4b33d2de76..2dc02a9e37c0 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct samsung_d=
sim *dsi)
>  {
>         struct device *dev =3D dsi->dev;
>         struct device_node *node =3D dev->of_node;
> +       struct clk *pll_clk;
>         int ret;
>
>         ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequen=
cy",
>                                        &dsi->pll_clk_rate);
> -       if (ret < 0)
> -               return ret;
> +
> +       /* If it doesn't exist, read it from the clock instead of failing=
 */
> +       if (ret < 0) {
> +               pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> +               if (!IS_ERR(pll_clk))
> +                       dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> +               else
> +                       return PTR_ERR(pll_clk);
> +       }
>
>         ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequ=
ency",
>                                        &dsi->burst_clk_rate);
> --
> 2.39.2
>
