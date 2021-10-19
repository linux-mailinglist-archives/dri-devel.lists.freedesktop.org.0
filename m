Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8A433188
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 10:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403F288F78;
	Tue, 19 Oct 2021 08:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD1388F78
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 08:47:40 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id gn3so8640175pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=znWZG2M98SQpNWFciGHdUDcSpYrmNay3HXZ/Xgvx0nQ=;
 b=hEkwiTfRoPxhHXNChWGHFpjXsRoCzFgOhcDJVcFb2EUxBXvPL7YNM8vzDqEaxifEWt
 XyRsaOLf513n3Hm4cwHeZ3PNg1jzY05CvpllA4duP87gf31xWcixHlMPT1KNTTUSklSo
 TxKcopEN7uwFOndGqsIxBJvcAZsL0LPoc84zRBq28ske+f60EbSlDD7vieQOOA84dtO3
 AjyF/oEsSWufzljc/T1xKLjQwfiPSEFkDlSg+HkfoMzQE6/ItzxefQSjo7m/1Kjsr2k9
 iHKJK3rtoZp7ygnxscq++fK5OCElm4OJPbqnvGI92ogkFL9tHfMFSJc2Gt/gQh34Fzw0
 8PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=znWZG2M98SQpNWFciGHdUDcSpYrmNay3HXZ/Xgvx0nQ=;
 b=Kv81VEM5h8NuFZybBgUAr9lZDFebrY+gOunvYMEB/IiOfVY3VxFXwu5Eo3K/+ruRDU
 llkmSmwIRdxxyh7Pyz8Y3+/fi+CAy6Nm62dDHDVgIfPdQNuE4E/G0sTgoKNnMtYl0qDs
 FU8CWo73XyBFUjpENYWF61/FXlE7HYon5I0ynwlqEKryBg8/lxqzTSJt8tPBBBxFpZaZ
 48Dv+dwuE+0QKgPiIbXshwkpLykhBUz3b4NWG7wipiep+ulRm+p4xLXmMXeNebMhycGQ
 g6Jm43wMwuEAg6KeOpAP/01gbkFNztsS7mpOB8/qUxzsJwNHzm7eJ+rLery0TzVyAl4v
 fMiA==
X-Gm-Message-State: AOAM532cgjz76/jFDJhrdJkBrvEB9SELT6x/PruLqlRtJpB9V5R7lt2D
 UIct8OVxD4fSP+ifzXNFD18U9/PG4I4WkVidjegPgA==
X-Google-Smtp-Source: ABdhPJwJ5xzkp1s6vmtXEwTN3PMELy5xyWA5fOFd8eRIT/kgvNpG/hpMer48La8Bi54Wv63ViFaFTb4JBmjnj9bdod0=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr5003522pjb.232.1634633259748; 
 Tue, 19 Oct 2021 01:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com>
 <20211002233447.1105-2-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-2-digetx@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Oct 2021 10:47:28 +0200
Message-ID: <CAG3jFyuYjCgUZWbksYvfw0iSOi-hTuFqvbwSamU+9HFG5MxHBQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] drm/bridge: tc358768: Enable reference clock
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hey Dmitry,

Thanks for submitting this series.

On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The driver assumes that reference clock is always-enabled, but this is
> hardware-dependent and not true for ASUS Transformer TF700T. Make driver
> enable / disable the reference clock.
>
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index a3db532bbdd1..18ae6605a803 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -237,6 +237,10 @@ static void tc358768_hw_enable(struct tc358768_priv *priv)
>         if (priv->enabled)
>                 return;
>
> +       ret = clk_prepare_enable(priv->refclk);
> +       if (ret < 0)
> +               dev_err(priv->dev, "error enabling refclk (%d)\n", ret);
> +
>         ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
>         if (ret < 0)
>                 dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
> @@ -274,6 +278,8 @@ static void tc358768_hw_disable(struct tc358768_priv *priv)
>         if (ret < 0)
>                 dev_err(priv->dev, "error disabling regulators (%d)\n", ret);
>
> +       clk_disable_unprepare(priv->refclk);
> +
>         priv->enabled = false;
>  }
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
