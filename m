Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D446CDB7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 07:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4E6E825;
	Wed,  8 Dec 2021 06:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084D86E825
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 06:26:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e3so4829924edu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 22:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JDOyr+F9YK+WldbZFLV08gsVPZC6GDloFu/EtSqXU8s=;
 b=gJ5KzNYh3GeuKAN/Li1gWkIkBM72iAQTEnS8YcttO5U7xeFcCryDGjycIYA3M5ET5B
 MQDrHXzEwYWUtvdsGK2mr30pKX+SKiZUiHlB+DU28/VScGvD1SYhela1XEwMlEjE11JV
 SNH1U90P0YqVQYcFJ2O7o8WQ/7myncG3QV4Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JDOyr+F9YK+WldbZFLV08gsVPZC6GDloFu/EtSqXU8s=;
 b=bgB3GdvU2UjU8/7J4nsOx5Tq1IkyPekFQKmPvhROi8v9wAkPX1wmv3HUerKuDpn7m7
 75rSMcckQau3NywepJ2nx41c8q1to4V6IAz/nSkkuQ7TAD/nLAPjqNn/Vtu8JfyOHIY4
 C9jEUR14pVPqgn/O4DHBx117xeJmlZoef9epT/GemY9yOEpBR+HlloKNevsmmLUk8hmW
 mhnCkaHydjKx7OSmCFMCTKdILFTpIAZa5RHhV+lhatZGynr0cw0gL19M/H9+vUlrQUW8
 Uqmf+3u3UBiN8yTr6rHi78KHDIyFDC5QwBLTP524QIlMvSXSIF7Y0OAfQeFSB+BW96Bq
 Qq5A==
X-Gm-Message-State: AOAM531DoVdGpE3szZhJjtkacrzZZh9JZSPQK8Q5+k6AgMde2ff0T7IK
 tjvGWKtBHlsjyqpP/mjU5isuuoX98gA+tW1eUPYPyQ==
X-Google-Smtp-Source: ABdhPJyDJiW45X33EnCeIgOElIPrAA45rk8jwtzJh/1J7ctIB/q4SOcISVO8qCUn5LDbikO3e0xUrh6fYuIjAnIj4ZE=
X-Received: by 2002:a05:6402:1768:: with SMTP id
 da8mr16837011edb.252.1638944775240; 
 Tue, 07 Dec 2021 22:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20211207054747.461029-1-jagan@amarulasolutions.com>
 <20211207054747.461029-2-jagan@amarulasolutions.com>
 <CAL_JsqKj_ToLpoGR6XLgAu=+THit6jhdzAvxMiCCNmWg5zbQ0A@mail.gmail.com>
In-Reply-To: <CAL_JsqKj_ToLpoGR6XLgAu=+THit6jhdzAvxMiCCNmWg5zbQ0A@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 8 Dec 2021 11:56:04 +0530
Message-ID: <CAMty3ZCO3yYcZhggorPBhywBs8=KjE3Mrv7573TrPQyzfPPiaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: Add helper to lookup non port child node
To: Rob Herring <robh+dt@kernel.org>
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
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 8, 2021 at 2:20 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Dec 6, 2021 at 11:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Add of_get_non_port_child() helper that can be used to lookup
> > non port child nodes.
> >
> > Some OF graphs don't require 'ports' to represent the next output
> > instead, it simply adds a child node on a given parent node. This
> > helper lookup that child node, however that child node is not a
> > 'port' on given parent as 'port' based nodes are looked up via
> > of_graph_get_remote_node().
> >
> > Example OF graph representation of DSI host, which doesn't
> > have 'ports'.
>
> This seems pretty specific to DSI and also can't handle there being
> more than 1 non-port node. That's allowed for DSI too, but I don't
> think I've ever seen a case. Anyways, I'd just move this to DRM rather
> than common DT code. One comment on the implementation that will
> shrink it.

I think it can be possible to OF graph even for non-DSI, however if
the end-node outputs to a panel or bridge. At the moment, I can one
use case on the non-DSI side is rcar du encoder.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/rcar-du/rcar_du_encoder.c#n68

I'm not sure this can be done existing of_graph_get_remote_node, but an example.

>
> >
> > dsi {
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >
> >         port {
> >                 dsi_in_tcon0: endpoint {
> >                         remote-endpoint = <tcon0_out_dsi>;
> >         };
> >
> >         panel@0 {
> >                 reg = <0>;
> >         };
> > };
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/of/base.c  | 29 +++++++++++++++++++++++++++++
> >  include/linux/of.h |  6 ++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 61de453b885c..31bbf885b0f8 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -854,6 +854,35 @@ struct device_node *of_get_compatible_child(const struct device_node *parent,
> >  }
> >  EXPORT_SYMBOL(of_get_compatible_child);
> >
> > +/**
> > + * of_get_non_port_child - Find the non port child node for a given parent
> > + * @node:      parent node
> > + *
> > + * This function looks for child node which is not port child for given parent.
> > + *
> > + * Return: A node pointer if found, with refcount incremented, use
> > + * of_node_put() on it when done.
> > + * Returns NULL if node is not found.
> > + */
> > +struct device_node *of_get_non_port_child(const struct device_node *parent)
> > +{
> > +       struct device_node *child;
> > +
> > +       for_each_child_of_node(parent, child) {
>
> for_each_available_child_of_node

Look like this simplifies not required to use of_device_is_available,
I will use it in v2.

Thanks,
Jagan.
