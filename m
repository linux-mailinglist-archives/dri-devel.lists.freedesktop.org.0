Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4444EF903
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 19:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6626310E06B;
	Fri,  1 Apr 2022 17:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B0510E06B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 17:35:01 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-df26ea5bfbso3470477fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 10:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DQa17hCgTs2MBoKtP/4j182oJ3/hJiT7owQ4N3CG1VA=;
 b=W9mBhk4K9BQCpQtshG50p69ZJqlA8AaWWk+OcP+Fv9TLwKwhw5d/F16Aw+wrJMrspK
 FqQfJ+6ySCP0P0NPwcXmbfhpViLUUNcMpawWcXiOPLvVIki6+CiubaiEIT3H48LLoRgf
 7j+ecAuLgyAXL9CqxYw73dvIq+pd9xUt7/x9Cu+7zXB91AZv/vdqrdhiH0wRgd2+eV5y
 j8XFP5lcOqYZGNAKYcSSIrbtyexz50UjzY9Ok8pTkQDPhNn1zFOXv/6dOT0OqVlieJld
 6CN2Z7C339xzn6tCo18qkHQgceCUnsUDKSHyNIn0zTQDIPX1HWIBXH4Z5/ZSrcA0zSsZ
 QYPg==
X-Gm-Message-State: AOAM533IbapRo1VL4gPwjfRkTDKCim3DYEdlLbZUYq/glCfskxitTYVj
 RpWB3GDN2TOUtGNYZHYi+g==
X-Google-Smtp-Source: ABdhPJwuP+KB4kqdKE8P1T1bpNpbaC0qFdGOvVLZwShbOxOH8cSo0l8Tnr3HKrGOSXUcqFw1gk/u5g==
X-Received: by 2002:a05:6870:fbab:b0:de:b33b:16b1 with SMTP id
 kv43-20020a056870fbab00b000deb33b16b1mr5525171oab.26.1648834500331; 
 Fri, 01 Apr 2022 10:35:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c19-20020a9d7853000000b005cdbc0f02ccsm1386474otm.68.2022.04.01.10.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 10:34:59 -0700 (PDT)
Received: (nullmailer pid 3289912 invoked by uid 1000);
 Fri, 01 Apr 2022 17:34:58 -0000
Date: Fri, 1 Apr 2022 12:34:58 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <Ykc3wm5pqJIA1jCn@robh.at.kernel.org>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
 <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 03:22:19AM +0200, Marek Vasut wrote:
> On 4/1/22 01:52, Rob Herring wrote:
> > On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
> > > MIPI-DSI devices, if they are controlled through the bus itself, have to
> > > be described as a child node of the controller they are attached to.
> > > 
> > > Thus, there's no requirement on the controller having an OF-Graph output
> > > port to model the data stream: it's assumed that it would go from the
> > > parent to the child.
> > > 
> > > However, some bridges controlled through the DSI bus still require an
> > > input OF-Graph port, thus requiring a controller with an OF-Graph output
> > > port. This prevents those bridges from being used with the controllers
> > > that do not have one without any particular reason to.
> > > 
> > > Let's drop that requirement.
> > > 
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >   .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
> > >   .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
> > >   2 files changed, 2 deletions(-)
> > > 
> > 
> > I tend to agree with port@0 not being needed and really like
> > consistency.
> 
> The consistent thing to do would be to always use port@0 and OF graph, no ?

I guess it depends how wide our scope for consistency is. Just DSI bus 
controlled bridges? DSI panels? All bridges and panels? Any panel 
without a control interface has the same dilemma as those can be a child 
of the display controller (or bridge) and not even use OF graph. 

All simple panels don't require 'port' either. That's presumably only 
consistent because we made a single schema. I'd assume 'non-simple' 
panels with their own schema are not consistent.

Rob
