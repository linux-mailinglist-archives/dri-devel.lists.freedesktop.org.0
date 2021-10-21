Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE77436C78
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 23:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB026E4B6;
	Thu, 21 Oct 2021 21:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84D6E4B6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 21:11:30 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id g6so2341986ybb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSqNmBmwNnZiz7NUUt6h5WqgJhP/Ov1sKBBTlbjHzNY=;
 b=XRsGY/xy50TtHIKbHoxMdCj0ZTTbuI00ENgALELUtUY5fWYRIggNJL5E9D5BcumiGv
 Ei4UdmBQiheCtzLfGJlbaFYE5i12T1IQTwLpPvfigWcSqRkugP1/kX/Pjq2XsNGTSP44
 PFr1T8N2/vslAGg9WT7uTPZ59vePFQjJmmHNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSqNmBmwNnZiz7NUUt6h5WqgJhP/Ov1sKBBTlbjHzNY=;
 b=IsgO8zy5LyAJNY6sY8eWPH5lY+NFcTuS9y4BtETvxMkJzNl8kSmcQgU/PQFfE2pIK+
 eCvCn/irEPfIJy07eBks4GUvIEN4kiQN4M4aMtxApFTFQJ19SFTR+dpz04Zr3VniL66S
 zRvdWIrttSCHpXvGGvQP5hBUEU/rY/eCDY6kFK5th+dHses92VRnhjxmCF2S4liRFfcT
 aL04s+f2cUvx86rYkNwt2iJGHzzXR7444hS1frVJKKFYc07jEHNth0tlT4y7kLKzJ+dB
 rwdYHSa0nv7sQT7SajoikQwx6CSFBpdwjMao0MeIMV7EDuEsuk9OlePrDacrLdKgX9bR
 VQ6A==
X-Gm-Message-State: AOAM533PgNmylqzHsCbq8iAPwNhxqbChjVHvbmMieknSjFDS1qO1saI3
 NpPFGDE+fTOS4tKfekBbgszGiPdz5oINa/pBxYtUFQ==
X-Google-Smtp-Source: ABdhPJw0QcM0HApDBgJuV+OEUNHeWA+ga7NCtmdlz6dOcp04yOURrxn6vryKN9YFFkgXuaysz4ZPOkJdVmJ3cN8N41g=
X-Received: by 2002:a25:5044:: with SMTP id e65mr8298612ybb.57.1634850689972; 
 Thu, 21 Oct 2021 14:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211016095644.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <20211016095644.2.I44ee57ef73528243acf8f29af8d2416b810e1a9d@changeid>
 <CAD=FV=XXOY_Rded_j6oysDkZ=e7_Gc1SPKPbkLK2DBdoKHWuKA@mail.gmail.com>
In-Reply-To: <CAD=FV=XXOY_Rded_j6oysDkZ=e7_Gc1SPKPbkLK2DBdoKHWuKA@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Thu, 21 Oct 2021 14:11:19 -0700
Message-ID: <CA+cxXh=R3U2uz2x0Mef3LZ-mta-+F9TXD0F+RGd5mDTWQOgZvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: parade-ps8640: Populate devices on aux-bus
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi Doug,

On Mon, Oct 18, 2021 at 1:43 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, Oct 16, 2021 at 9:57 AM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Conventionally, panel is listed under the root in the device tree.
> > When userland asks for display mode, ps8640 bridge is responsible
> > for returning EDID when ps8640_bridge_get_edid() is called.
> >
> > Now enable a new option of listing the panel under "aux-bus" of ps8640
> > bridge node in the device tree. In this case, panel driver can retrieve
> > EDID by triggering AUX transactions, without ps8640_bridge_get_edid()
> > calls at all.
> >
> > To prevent the "old" and "new" options from interfering with each
> > other's logic flow, disable DRM_BRIDGE_OP_EDID when the new option
> > is taken.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 52 ++++++++++++++++++++------
> >  1 file changed, 40 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index acfe1bf0f936..98884f799ea8 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/regulator/consumer.h>
> >
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_dp_aux_bus.h>
>
> You need a `select DRM_DP_AUX_BUS` in the Kconfig to avoid the errors
> that the build robot found for you.
Thanks for the tip!
I also found "select REGMAP_I2C" seems to be missing for ps8640.
although the build robot didn't complain.
Should I post a fix-up?

>
>
> >  #include <drm/drm_dp_helper.h>
> >  #include <drm/drm_mipi_dsi.h>
> >  #include <drm/drm_of.h>
> > @@ -149,6 +150,24 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
> >         return container_of(aux, struct ps8640, aux);
> >  }
> >
> > +static bool ps8640_of_panel_on_aux_bus(struct device *dev)
> > +{
> > +       struct device_node *bus, *panel;
> > +
> > +       if (!dev->of_node)
> > +               return false;
>
> You probably don't need the above check. I think things would be
> pretty broken if we didn't have an "of_node".
Removed in v2.
PTAL.
>
>
> > +       bus = of_get_child_by_name(dev->of_node, "aux-bus");
> > +       if (!bus)
> > +               return false;
> > +
> > +       panel = of_get_child_by_name(bus, "panel");
>
> of_node_put(bus);
Added in v2.
PTAL.

>
>
> > +       if (!panel)
> > +               return false;
>
> of_node_put(panel);
Added in v2.
PTAL.
>
>
> Other than the above, this looks reasonable to me.
>
> -Doug
