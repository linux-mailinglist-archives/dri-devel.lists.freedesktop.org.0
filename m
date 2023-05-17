Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A87068D0
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 15:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CA110E413;
	Wed, 17 May 2023 13:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14010E122
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:02:17 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24df4ecdb87so591057a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684328537; x=1686920537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5AxAeCdhuBvApaM2VNWNpR5KDUG0yf5YyED4YO+eQA=;
 b=oOzu2jaD9jkQxFp/C6pdw/65JxoJTdqqUn1IncbHbJJnSqOvS3XDF8ki9Bxc0VELhl
 2vu8ShEJFZcH3m7N5hIz9qxjX/JaCY5/b7wDutu+gWVtl+nO8sxU5PuHiCu564O+ZUw3
 1V5G2t5yUXe+MJNjdh/0vjOmhHHiMWVbrGaFs3IRQ8149RJWXVZQbLohaTIlNpgbylHK
 T+AMpbEIiejf0rj0KSkV7Zidngkxt08yJotwRxkO6m8HN7NB+pcb2BZIolkgCZNNnEls
 TN+VjPiaptl+3yYvtHH7gTESFvrLrOowhWtCtLWw/mO0H0munPE62+EUHplhSy8Dr3w+
 ComQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684328537; x=1686920537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5AxAeCdhuBvApaM2VNWNpR5KDUG0yf5YyED4YO+eQA=;
 b=YAlivkGJ8du66lmiWQMlvQeYL3YgrF1X+p+sUZaQtknzwsmJmn7kkSYxLq5TjCQhyM
 MDaRMHQOM5tQ+UpwXgBJtKIKLeMiRIKj0q50Bc5a+1Oh+mP0YXaAlujosCojhx5T2VwO
 cqmOVeQmWspjac/+MQP+3VklDTFEXhtJ9GNpkQkGvyzXQtbVuBQKzupSjJzkDTxKHAgi
 Ial6qvlZsn9b0V++Z6aPNWNrfrmTpndgyy02mtfO83wgyX2VMVBfiDujloMd49nKJE+u
 vFrebKjpK34TBjgkoXsSt3J3hhn4ZgvSHqBtqS2p+MP2PLpAUq5sco6Jps9sNpleqk5I
 BAVw==
X-Gm-Message-State: AC+VfDz4mh7+pIWx30A4f/pB7uI3PF3mueJoTCphAa9vKfShx9Yv5lRb
 5mh0fDW0Clj7s3cKc2A81QfUR7gL2ZQLNeQ2xds=
X-Google-Smtp-Source: ACHHUZ7QNLHezJKKgugcDY76WqtFsyRDPUdrP3VNrAmxpGJnnItHVANA8FASckIlsufnD4WgvoVUwVdScRLgfreQMIw=
X-Received: by 2002:a17:90a:f30d:b0:253:2c9b:2523 with SMTP id
 ca13-20020a17090af30d00b002532c9b2523mr4971288pjb.46.1684328536918; Wed, 17
 May 2023 06:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-5-aford173@gmail.com>
 <a0debcb9251aa99326aec44235d39f84c6086096.camel@pengutronix.de>
In-Reply-To: <a0debcb9251aa99326aec44235d39f84c6086096.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 17 May 2023 08:02:05 -0500
Message-ID: <CAHCN7xJZMu2u2gydmL9gF16Sd6wVX62kJRpzvZnhQLCtRm-zrQ@mail.gmail.com>
Subject: Re: [PATCH V6 4/6] drm: bridge: samsung-dsim: Select
 GENERIC_PHY_MIPI_DPHY
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 7:58=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Am Montag, dem 15.05.2023 um 18:57 -0500 schrieb Adam Ford:
> > In order to support variable DPHY timings, it's necessary
> > to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
> > can be used to determine the nominal values for a given resolution
> > and refresh rate.
> >
> I would just squash this one into the patch introducing the dependency.

I thought Kconfig updates were supposed to be on their own.  Is that
not correct?

adam
>
> Regards,
> Lucas
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index f076a09afac0..82c68b042444 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -227,6 +227,7 @@ config DRM_SAMSUNG_DSIM
> >       select DRM_KMS_HELPER
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL_BRIDGE
> > +     select GENERIC_PHY_MIPI_DPHY
> >       help
> >         The Samsung MIPI DSIM bridge controller driver.
> >         This MIPI DSIM bridge can be found it on Exynos SoCs and
>
