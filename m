Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C3E706678
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 13:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C71510E3ED;
	Wed, 17 May 2023 11:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32BE10E3ED
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 11:17:57 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-55a5a830238so4572237b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684322276; x=1686914276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WCELhKKHIosJqimbc1keXrYAK+9jP7I652VYp3oomc=;
 b=Sr9bMRUCBLk/cK5Y7vzL4ws/XWFokZJidhi87yFG15dr/w+u5nV4QmLODp5NEJWKNC
 CeHP1/f250JUltkvHI7jQwbt/S2BQ+NqyFXz6rusUXTqnT45YM0SfMjQvtueDZ61c/he
 fcGVN/It/8I3WPEBWy7fTmxpT3TgphO4/+y6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684322276; x=1686914276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WCELhKKHIosJqimbc1keXrYAK+9jP7I652VYp3oomc=;
 b=lKAovQZ/LzTunOjF/svUU8VTyeQrc1PnrAPsTKTs7IWeK4l5ho1s1VJNWzljNHJ6hf
 dVw6ogxawVl5JbABopzcsLuI2ko+HA3JOiNewVPYDq1qsQISlEAqYcA3QE7qnRjlIHG5
 e+V9UTizh62UGz+AQ5ENeupfEKH6HJRmn72cN5xkxgxSpA0OL8QF1EZVzDb16BfYiV9/
 Tuf0R+h+EDiBvPYHdr6I9dr7y6ZaD/RceaFbTuLNVobpv+XMAXUF+f0K0ktvsTS9IMrU
 k1dVhLlf8/+FqYJB/bSUDqKlaoelyYXsNwT4ZM0Ne03YO7C/8gu7i+TnbbNx5s2rLz2o
 0JHA==
X-Gm-Message-State: AC+VfDxxxXNErRR0BNpQYdkhBlmv4M/D4jheCWGpDuQHkqhKuCKPX1lK
 48FfhUAL2AImveGqHaOQ0mn5CB/N3Q9pChbNmYUxaQ==
X-Google-Smtp-Source: ACHHUZ7ho45fN+FqzJuMIFp6n4beIoWDVJzPSkpc/MqVOHha2wui277QosfgqSZKcOiFyTT21OZ00RXZ08i0odI/RxE=
X-Received: by 2002:a0d:d54d:0:b0:55a:7722:1401 with SMTP id
 x74-20020a0dd54d000000b0055a77221401mr36177609ywd.31.1684322276576; Wed, 17
 May 2023 04:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-5-aford173@gmail.com>
 <CAMty3ZAU3NG8yk1dFB4Y3QtCZ7j7XUTqKHkJVKhhOduc4V5XpQ@mail.gmail.com>
In-Reply-To: <CAMty3ZAU3NG8yk1dFB4Y3QtCZ7j7XUTqKHkJVKhhOduc4V5XpQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 17 May 2023 16:47:44 +0530
Message-ID: <CAMty3ZAd1EWAfZ6d3TndapSLp7CgY8XRc8JfYt532gsGrgUNiQ@mail.gmail.com>
Subject: Re: [PATCH V6 4/6] drm: bridge: samsung-dsim: Select
 GENERIC_PHY_MIPI_DPHY
To: Adam Ford <aford173@gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 4:34=E2=80=AFPM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> Hi Adam,
>
> On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > In order to support variable DPHY timings, it's necessary
> > to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
> > can be used to determine the nominal values for a given resolution
> > and refresh rate.
> >
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
> >         select DRM_KMS_HELPER
> >         select DRM_MIPI_DSI
> >         select DRM_PANEL_BRIDGE
> > +       select GENERIC_PHY_MIPI_DPHY
>
> Is it really required? phy is optional as it is not required for
> imx8mm/n/p as of now. May be we can add it while supporting it.

Haa, look like the next patch is using it. sorry.

Thanks,
Jagan.
