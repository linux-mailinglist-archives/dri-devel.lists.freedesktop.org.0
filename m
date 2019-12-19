Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7646126F1B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 21:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A5B6EB8A;
	Thu, 19 Dec 2019 20:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A0E6EB8A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 20:48:30 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k16so4232500otb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 12:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TYsDTzHFnFQqFh94ii3OQBBPVqMmCO4Don5GWMELd6M=;
 b=qBjDGwHX2uNAJxnjxURLWGCegQWBKflI8XXwyNgRjxpLYc6xDBVXG+rqzaT9gyoQRS
 OpwJsKeQLEVwhPf54FXZKV3PvtnMIu2MsA0g+gAbt8XQvlhZiL9pjbEA7JiWRzMWHzyY
 /N6o0DU3JgB1/joIgmoduBYFBbq9gB1DpB7ULPtax8j4iI8hEV82fsoIOMfaVsHmpFyu
 vbA+Ec68irlColF6hUJAtUPTxThpkPI3cKeV9aSvIfOU3Rs9sma0ab4Z6qvUKcR2uOFT
 lrzESZW2vwBD8hAryHVXZy6d0/Gg/ep19oj+Nwda+IR1shctUfwCN5vFDFYS6k3ZWK+A
 O8hQ==
X-Gm-Message-State: APjAAAUwgjOUttkoVmZAQjbtHnflEjfGurI+EJ0dUcbrQ5Kvb+i/T6GA
 LB5SEGjqEAv40S1RTkOtEw==
X-Google-Smtp-Source: APXvYqyJMSMjyoi+YU4x++Z/hDeE6fV5GGR8Guk8WGxwZLLKVy/j7Nqvr8NBYU/caqbxoJt0GcAJ9A==
X-Received: by 2002:a9d:10d:: with SMTP id 13mr10335983otu.149.1576788509284; 
 Thu, 19 Dec 2019 12:48:29 -0800 (PST)
Received: from localhost (ip-184-205-110-29.ftwttx.spcsdns.net.
 [184.205.110.29])
 by smtp.gmail.com with ESMTPSA id p65sm793744oif.47.2019.12.19.12.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 12:48:28 -0800 (PST)
Date: Thu, 19 Dec 2019 14:48:27 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: Add GPIO display mux
 binding
Message-ID: <20191219204827.GA13740@bogus>
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-4-hsinyi@chromium.org>
 <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
 <CAJMQK-iwF78=2PDMxp=cvS3sotNi7kjj1ZoVO9q_axejUPdLYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJMQK-iwF78=2PDMxp=cvS3sotNi7kjj1ZoVO9q_axejUPdLYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 03:16:23PM +0800, Hsin-Yi Wang wrote:
> On Sat, Dec 14, 2019 at 5:29 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Wed, Dec 11, 2019 at 12:19 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > From: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > Add bindings for Generic GPIO mux driver.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > > Change from RFC to v1:
> > > - txt to yaml
> > > ---
> > >  .../bindings/display/bridge/gpio-mux.yaml     | 89 +++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > new file mode 100644
> > > index 000000000000..cef098749066
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Generic display mux (1 input, 2 outputs)
> >
> > What makes it generic? Doesn't the mux chip have power supply,
> > possibly a reset line or not, etc.? What about a mux where the GPIO
> > controls the mux?
> >
> > Generally, we avoid 'generic' bindings because h/w is rarely generic.
> > You can have a generic driver which works on multiple devices.
> >
> Then how about making it mt8173-oak-gpio-mux? Since this is currently
> only used in this board.

Isn't there an underlying part# you can use? Or if you can point me to 
multiple chips implementing the same thing, then maybe a generic binding 
is fine.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
