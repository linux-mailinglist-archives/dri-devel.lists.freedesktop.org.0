Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5231B8C0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943B6E1F2;
	Mon, 15 Feb 2021 12:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC33C6E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:08:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id do6so268008ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 04:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bPb8pCUxI0r+QEvK3yWSBZjQ0Qvr7qfy1eHqEVbEFVE=;
 b=mjF2/dTDYzNdw4PENz6ACddiKtM2t8FGI2FHEx2WqSW+c+NLx8pGDGSBWKrU8B2+OF
 zGuZ6Xyza8gzdqqNlU89MduqwBUwLaS0NfIUU+L5TptDaBUh8ARAZ9NTBvh2Ok9an1xJ
 p4kGX2nh0tMLSWkhUVK1/tmmiXvQm4oI6zlIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPb8pCUxI0r+QEvK3yWSBZjQ0Qvr7qfy1eHqEVbEFVE=;
 b=g/R1Xek+8NsCWlmxz+97iePpguryi+RrfeaiovpnjTfh7ydVtCHAobt0Vkat3aE62q
 dTdUaqxHfEU9xkzkrs51TEi6DCFA5lwtXXKmQwBVWRLV77EjA1lbsuM3kC5FrETcGwOQ
 /5A96Fyuz67mQcbUO+peWl31BuO6WNctcsCz6WiyQibKYT9jYM8xgP8p266tMwXMCIqa
 f4ECAoqHmGBRAd2dj2mI7PpM8bZDGG5UoN5MTP5d9MjHUEuBl1QlmT2qIsxdfE9sUPKn
 r90FbtqVHJurQWAPwvWnbdl37xYQQdHjxRXhHR8HVMAxC+Jz6TcJly9L4R8DgzKimuNv
 kv/Q==
X-Gm-Message-State: AOAM5326OSfH4yURHk/OVOpCn6zouqR0pWohoXzOnnbbh9mDPZZwdR3y
 H2715tyjyJWMMExWXfMp0jff8xTHKYP3Aj3+YwBf2DCDv8lt20K2
X-Google-Smtp-Source: ABdhPJxulpG94j5gqYFYTXkjqDBqhFcfbphzRi9wi7xdhRdh6Eq26k5RRzSumtPITQ220NwxQ1rpjV9gEgRzrWlrnog=
X-Received: by 2002:a17:906:4e45:: with SMTP id
 g5mr505637ejw.186.1613390907532; 
 Mon, 15 Feb 2021 04:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
 <CAG3jFysAq0rSVRgjDSu6gF4kHcqOGAZt+b0Rz_reHgQr3Scy6A@mail.gmail.com>
In-Reply-To: <CAG3jFysAq0rSVRgjDSu6gF4kHcqOGAZt+b0Rz_reHgQr3Scy6A@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 15 Feb 2021 17:38:16 +0530
Message-ID: <CAMty3ZAk0W8KbFPo3fo3NavEvveRfptovOeaWA_hh0rXVYhDnw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 Chipone ICN6211
To: Robert Foss <robert.foss@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 5:28 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Jagan,
>
> Thanks for submitting this.
>
> checkpatch.pl threw some typ-o warnings, and I listed them below. I
> think either spelling is correct, but 'spelling.txt' does list this as
> a typ-o explicitly, so I would suggest conforming to that just to
> silence the checkpatch warning.
>
> This patch also passes 'dt_binding_check' and 'dtbs_check', but I
> think I'd like to defer to Rob Herring for an actual r-b.
>
> On Sun, 14 Feb 2021 at 18:55, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> >
> > It has a flexible configuration of MIPI DSI signal input and
> > produce RGB565, RGB666, RGB888 output format.
> >
> > Add dt-bingings for it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - updated to new dt-bindings style
> >
> >  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
> >  1 file changed, 90 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > new file mode 100644
> > index 000000000000..13764f13fe46
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > @@ -0,0 +1,90 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
>
> $ scripts/checkpatch.pl --git HEAD~0
> WARNING: 'Convertor' may be misspelled - perhaps 'Converter'?

Thanks for pointing it.

I was aware of it before sending it and need to understand whether we
need to use vendor naming conversion or not. Chipone call these
devices are Convertor [1], So I have used the vendor notation for
better understanding.

Any comments are this would be welcome?

[1] http://en.chiponeic.com/content/details45_123.html

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
