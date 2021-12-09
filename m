Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726646EF09
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1E010EA43;
	Thu,  9 Dec 2021 16:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3729F89E52
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 16:47:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x15so21900455edv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUAsoZN2GGfXs7xQeUpyANUvSViGhaNjFhPoPPs6f6w=;
 b=RpGzTAlgLa3PO+98+sxBAbJQER/+75BJLrqyfbj/7lQCThJk8X1lniI4djnUqtNlYu
 80sTAOOhS+raFRuicrgI0z7zBxkKAV/xSc03ImNww6wNqn0MUk2hp6LCQuOsvpPvlZSX
 zgMEummyAHUQoVNwNw6swxxwAaWXSLnT9OHEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUAsoZN2GGfXs7xQeUpyANUvSViGhaNjFhPoPPs6f6w=;
 b=43u+q8koKY6jiPG0AvEvm51jIG73BH9MX+oIaBK3lCZP/s2bq1aYwy/uO3ljAg/hwe
 fmY08Vcg/cOfmUn6nyow1rF6CBjMgg76yR8en9bKkFqIc9LsH2k5ittIz497GWXV5pfm
 ucRaNsiHFJ4UXBtcu1JkUebVGe0V67N7pM9OFpJzLemJHiyYCEvOiEb6Bn3SQIISTbMz
 vCAfF0/l5wb3zwmP8mWMgsD+MkrqlQwbFM18Ddr+y0ATmw9eRDtf+voQT18qAfoan7qP
 Z2NkoRERt05mrg89EhFqaxz4dIxrlohADCpV0zr3pUMWE9e8SbAt5DPsnEjjSrVKN2pj
 Yd/g==
X-Gm-Message-State: AOAM532dwmPSEvQI6fXcbRPEUi5N+CoXd3M3ddM1IHbptXzHLlDfkzff
 lt9EMLn9u1hHBXMhzquqU3ssP3vcV8hTPuHnvSTogg==
X-Google-Smtp-Source: ABdhPJyZzquwre+pYVHYp87LvqgSYqSMCpLuONQzj5RR6wgSoijqysjMjPU/d1+HrNnE2sU69dCeTVN4iRq0C4XuGoY=
X-Received: by 2002:a17:907:6d28:: with SMTP id
 sa40mr16885730ejc.201.1639068308655; 
 Thu, 09 Dec 2021 08:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
 <20211118091955.3009900-5-alexander.stein@ew.tq-group.com>
 <CAMty3ZCQ+JDvojX0QiLEJLSA=J+kzi9kY1QE+dzf35fgO3T4aQ@mail.gmail.com>
 <YbIxGc8faqUQhUWP@pendragon.ideasonboard.com>
In-Reply-To: <YbIxGc8faqUQhUWP@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 9 Dec 2021 22:14:57 +0530
Message-ID: <CAMty3ZA+BwtGLhFM8gS5f_=j4JnMrvnqf01bTW4mbe0ddyiG-Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply regulator
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Dec 9, 2021 at 10:09 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Thu, Dec 09, 2021 at 12:34:49PM +0530, Jagan Teki wrote:
> > On Thu, Nov 18, 2021 at 2:50 PM Alexander Stein wrote:
> > >
> > > VCC needs to be enabled before releasing the enable GPIO.
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 065610edc37a..54d18e82ed74 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > @@ -33,6 +33,7 @@
> > >  #include <linux/of_device.h>
> > >  #include <linux/of_graph.h>
> > >  #include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > >
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_bridge.h>
> > > @@ -143,6 +144,7 @@ struct sn65dsi83 {
> > >         struct mipi_dsi_device          *dsi;
> > >         struct drm_bridge               *panel_bridge;
> > >         struct gpio_desc                *enable_gpio;
> > > +       struct regulator                *vcc;
> > >         int                             dsi_lanes;
> > >         bool                            lvds_dual_link;
> > >         bool                            lvds_dual_link_even_odd_swap;
> > > @@ -337,6 +339,12 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> > >         u16 val;
> > >         int ret;
> > >
> > > +       ret = regulator_enable(ctx->vcc);
> > > +       if (ret) {
> > > +               dev_err(ctx->dev, "Failed to enable vcc\n");
> > > +               return;
> > > +       }
> >
> > Better check the vcc and enable it since it is an optional one.
>
> Won't the regulator core create a dummy regulator if none is specified
> in DT ?

Agreed, thanks (Usually I do check to avoid NULL pointer if any).

Jagan.
