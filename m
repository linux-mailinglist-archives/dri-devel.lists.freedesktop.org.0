Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDA560566
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2E110E10A;
	Wed, 29 Jun 2022 16:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4347510E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:09:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id mf9so33660213ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JDZdXHc/WphZg80zTh85LyzZS5T7NHb+tCoW2mm59OU=;
 b=J9HxEwV3n+R04yS/42UfmWmxhW+k5z5P8BuhtL4w53/Nl5JV6km2qp6KrCt4X7eGx2
 67xG74PT4oJtkgzPJ3GlNoYKFINs1daCGdR0q2yyKAELO5jwm9nDPmXyxEWYGaUpUm76
 rzVb0HTiuU+JlLEuJEESm9M/c3xQFxHgJ1y7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JDZdXHc/WphZg80zTh85LyzZS5T7NHb+tCoW2mm59OU=;
 b=s89sZvoIXpVrRMbkfYyHQBXLR8+i6WobkfzhNA4zmfDiL1OH3nviGPDZnIvTue3h0L
 jt3Wclxvr5aRx6rqoVvo9FRFaBsRIWZEItL8w2h0ra0A5Jxri0wfK6WNT5lCol07y244
 3Oz5gj/IMRCm7whTevt5KETjirxidnD2oA3inYd5dtbmDrS4TnzVek1fAbvka+tYNN0z
 YgcByo/fISZs1HjlwJlP5bFKjs8yYcKqorzk0kSiw9gBkZ8SDMyqP0JAdHkZ3tT3k7DL
 OYlHouoJaZ5jbREEYrcc3oq93gl8L8a6sk66Uo2gWPeMYjHok32EGZ/0Ti8lxEQhm3fj
 kDeA==
X-Gm-Message-State: AJIora8kA4htT8keFJTYqTw1LUccwNcafmIHeTmhTd0WuaNFa5A60fcJ
 a/j02scaMA9dVHdCj41R1V+Ee6TS1werem+/W9WZrw==
X-Google-Smtp-Source: AGRyM1szLBHVbi6zOMzheJPJbhBaypovfe5Tpwg0NHcZ0Qb5aSvDOhIremhJNjtUHHe+ifmv75aalV85sZjzYtAkVe0=
X-Received: by 2002:a17:906:9b92:b0:722:f705:759d with SMTP id
 dd18-20020a1709069b9200b00722f705759dmr4069538ejc.745.1656518957624; Wed, 29
 Jun 2022 09:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220628104650.2239191-1-hsinyi@chromium.org>
In-Reply-To: <20220628104650.2239191-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 Jun 2022 00:08:51 +0800
Message-ID: <CAJMQK-j6VMBrt+31ozUw7V50SFn-PXQWtO1jq+b05TTCNToiAg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: use pm_runtime_force_suspend(resume)
To: Robert Foss <robert.foss@linaro.org>, Xin Ji <xji@analogixsemi.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 6:46 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> There's no need to check for IRQ or disable it in suspend.
>
> Use pm_runtime_force_suspend(resume) to make sure anx7625 is powered off
> correctly. Make the system suspend/resume and pm runtime suspend/resume
> more consistant.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
The patch is re-sent again with other anx7625 patches in this series:
https://lore.kernel.org/lkml/20220629160550.433980-1-hsinyi@chromium.org/


>  drivers/gpu/drm/bridge/analogix/anx7625.c | 33 ++---------------------
>  1 file changed, 2 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 3710fa9ee0acd..09688a1076037 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2542,38 +2542,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
>         return 0;
>  }
>
> -static int __maybe_unused anx7625_resume(struct device *dev)
> -{
> -       struct anx7625_data *ctx = dev_get_drvdata(dev);
> -
> -       if (!ctx->pdata.intp_irq)
> -               return 0;
> -
> -       if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> -               enable_irq(ctx->pdata.intp_irq);
> -               anx7625_runtime_pm_resume(dev);
> -       }
> -
> -       return 0;
> -}
> -
> -static int __maybe_unused anx7625_suspend(struct device *dev)
> -{
> -       struct anx7625_data *ctx = dev_get_drvdata(dev);
> -
> -       if (!ctx->pdata.intp_irq)
> -               return 0;
> -
> -       if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> -               anx7625_runtime_pm_suspend(dev);
> -               disable_irq(ctx->pdata.intp_irq);
> -       }
> -
> -       return 0;
> -}
> -
>  static const struct dev_pm_ops anx7625_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>         SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
>                            anx7625_runtime_pm_resume, NULL)
>  };
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
