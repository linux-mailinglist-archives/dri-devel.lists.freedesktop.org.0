Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071AEA2F139
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 16:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0684D10E099;
	Mon, 10 Feb 2025 15:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RKPNDebW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A8610E099
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:17:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBC4E5C58EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8BDC4CEE8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739200624;
 bh=npeySrQDIdbjEdWZVestUdgkXFxlJePjegTD/zD7+4o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RKPNDebWhhpwvKqjqW0ZGYy2i9RFGbmOiJxfDtYaeFkAZhCdmYg4IfVHBPM3PYq2A
 Pv8XhLTurgzqwzqS8XuuyX0Ud63vM8qkbGB+NOfa1R6rbto4KSr3hvcHQ4ulGmZU/b
 9VpBP9YLJhH1cUj+GsIVq07/hnAUiBN8Pxpn0Y5u0LXZ8HvG6R9ln7wMOjtlihTrgz
 EVVw7wo/b2j7wpVcTYd7V8vyf/Z6+6ZXsJp+04PxeRxXsSqMgAhFEXad9D4TLdWd9f
 pWvQi9qPjagGtNXq+jnbaopIdlMo9xapllwlInZVjut2DZznR3H3MHQpODZtmx1clW
 PqQfVZe3uJCrw==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6f77b9e0a34so32825797b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:17:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUD0KEfKbMKstcusqfpnbpAh3cF1mFVxQkqd2PDgLkC+UtgDS+LBCRBWoJ+waz66Ban5e87ItpSiC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC9V7+ah19Rzch/v0qBGGWMB6DrBPJV/+rmBSYIarwU9D8KJCA
 kGD/ou/ftVBtCFdFh3CUE1a7r//eOYJIRkabYxP8QSj4tQyLUQiA8k6CjpxRXFnkTdbhUTPtE+O
 sN+MXYYWhDQFi6WaQ8c5O0YYywcrIEPcwBTZbag==
X-Google-Smtp-Source: AGHT+IEuxtsc0xzO9mi3+kRlVNXktUIEV7jpqquejdLvRYC7jrhyqriJbq41PImEwZesVxGBItLG1KHJKThIAsdcER4=
X-Received: by 2002:a05:690c:4513:b0:6f7:598d:34a3 with SMTP id
 00721157ae682-6f9b2349b17mr126196697b3.0.1739200624069; Mon, 10 Feb 2025
 07:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20250128065645.27140-1-oushixiong1025@163.com>
In-Reply-To: <20250128065645.27140-1-oushixiong1025@163.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Feb 2025 16:16:53 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4xwkfZgmJimDvoWUNY0qXJDAhzfXsKG5zcdGN_yv7pZg@mail.gmail.com>
X-Gm-Features: AWEUYZmoZttsZcq5UnGDn813LzZbaiRa_k-lQdQRVeYMxL2zrCT83V22t3LHnhc
Message-ID: <CAN6tsi4xwkfZgmJimDvoWUNY0qXJDAhzfXsKG5zcdGN_yv7pZg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use
 devm_platform_ioremap_resource()
To: oushixiong1025@163.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Shixiong Ou <oushixiong@kylinos.cn>
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

On Tue, Jan 28, 2025 at 7:57=E2=80=AFAM <oushixiong1025@163.com> wrote:
>
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource().
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index bfa88409a7ff..f6e4bdc05ba0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1553,7 +1553,6 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct analogix_dp_device *dp;
> -       struct resource *res;
>         unsigned int irq_flags;
>         int ret;
>
> @@ -1605,9 +1604,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>                 return ERR_CAST(dp->clock);
>         }
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -       dp->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +       dp->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(dp->reg_base)) {
>                 ret =3D PTR_ERR(dp->reg_base);
>                 goto err_disable_clk;
> --
> 2.43.0
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
