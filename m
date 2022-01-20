Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7785494C72
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EE610E319;
	Thu, 20 Jan 2022 11:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEAC10E319
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:03:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cx27so27193018edb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n97jOmH1Hh/lQ5JREIu8WWpMZHA+pObxbgnKcQKqkdY=;
 b=OfgVg4++cjXVJlgE4V6UGTv+/DRslYaxUQwp42wmoRX703kLnHT6ZI42wX0OmSiDlZ
 SDwD6u+GkbkGAFUtJaJksGgW3PqmKgpnh610LHWTZa19Y68u4qy6t+4ixut+aX9mwwDf
 ovfVjhquX3wpszfrRqxTnakSBbHc8lkEazXCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n97jOmH1Hh/lQ5JREIu8WWpMZHA+pObxbgnKcQKqkdY=;
 b=HQgoCBqfHPMTjbqauKSmDhXTaiYMyEtOlJfftwyzBMBiiRggkppBNJr73LcVkBKpoV
 9xQH1gWVj7oaFhVzADhamJJTR7fO/AjOAP2pnCAnSBPqCdwL5UUmjpWf4g+/VHO1kt/a
 GM7LkQss3ZhbzETACVLgaPvh8I/1azg5pTlT26yxGtRJp9nRDutQXoc+RXaKWQ/RnGDl
 U2mN6y03dVyWDya7pkhHEyvj3c29iUvCkh0J47hTCpJk4r3xpfvrGu0N9kHFNqt69iII
 9+uftENTJ8dOEmjCzwbwQgKTwwbxQl6G2lDu/DR6+tHi0OvQS32twumrS1wDK2Lq2OUd
 T4XA==
X-Gm-Message-State: AOAM532p/tQQ8eU7O0B/fRKzfG8vSzjOuFQ5v6hoPtjbvEnr6+TX09nm
 XHBIGHr2eVE0oBHYArwgsTkFiHyjtpVgEq10ubdjpg==
X-Google-Smtp-Source: ABdhPJzNGcaoNoLJ9DIV2wfpr4vlmfC3H1ldbuvo6eEiv6LUJOZKv5Nk9JAXwwWgrS0AxorLH7OJbyk5bNnDlGJejCI=
X-Received: by 2002:a17:906:2e81:: with SMTP id
 o1mr9130992eji.760.1642676613863; 
 Thu, 20 Jan 2022 03:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-7-narmstrong@baylibre.com>
 <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
 <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
In-Reply-To: <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 20 Jan 2022 16:33:22 +0530
Message-ID: <CAMty3ZC9Cp=8=iF=KYCWjwb-wk+VrPBzH+6L14H6iZcSm3CZjA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 12, 2022 at 1:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 12/01/2022 08:24, Jagan Teki wrote:
> > Hi Neil,
> >
> > On Mon, Sep 7, 2020 at 1:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
> >> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
> >> Amlogic SoCs.
> >>
> >> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> >> by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
> >> Analog PHY in the proper way.
> >>
> >> The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
> >> is derived and feeds the ENCL encoder and the VIU pixel reader.
> >>
> >> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> >> DW-MIPI-DSI transceiver.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
>
> [..]
>
> >> +
> >> +static const struct component_ops meson_dw_mipi_dsi_ops = {
> >> +       .bind   = meson_dw_mipi_dsi_bind,
> >> +       .unbind = meson_dw_mipi_dsi_unbind,
> >> +};
> >
> > Do you thought of non-component based meson DSI like STM DSI? It
> > require changes from meson drm but just to understand if you have any
> > such plan.
>
> I have no such plans for now, note this serie has been rewritten at [1] but still
> with based with components.
>
> If worth it, the plan is to get it with components and than yes if it's simpler
> drop components completely.

Dropping components make the pipeline well suited for bridges as we
are moving bridge-driven pipelines in other areas.

>
> I'll have a look at how ST does

ST has no components. As I said above, eventually there would be
common bridge driver for dw-mipi-dsi if meson and rockchip moving away
from components.

Thanks,
Jagan.
