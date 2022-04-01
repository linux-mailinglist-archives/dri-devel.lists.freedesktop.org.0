Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A494EF9C0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982F910E00D;
	Fri,  1 Apr 2022 18:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE77E10E00D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:21:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B829B8259D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E31C34114
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648837300;
 bh=3rjbE6AG5US/5TOLdT4ZkyW51vstyIfglwN5iEgVtXo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s7vMqNkfmj4C/MJM+Q0/oWqhzBnwhEuQS1Y31wB7nhaYdTkKMHDW9fKpyHQFZ6iBO
 If/QCvrtU9pL4HNSJhCMMKBiiyi7dcpeNIsmJmnDLenPjor0opRp9unvnEq92XSptw
 5WBN1oCCbeYW/qZ/OkSsoLnQ1G6QYRnoilQ2btMfVBk+BEKxBmNkBqQhSgULMIa5Uv
 afab156PU7qzYbjBjf6DDopXHs4HWyFleNTpPbKZYcskD8zJpmxqbrY5C1bp8w/dps
 detUj9NJ4HJj03QkGmSIlSECJs0+jAiDr/WCrgqLmd8e+kLeCvx1dmcTMvGrQLCKMa
 eGEDBGm6x+PgQ==
Received: by mail-il1-f176.google.com with SMTP id z10so2594492iln.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 11:21:39 -0700 (PDT)
X-Gm-Message-State: AOAM5328pLuC3fjwUoaPl/uTkX6ox5E6a3uouXQdovw19IP5RHu1gBLN
 UV+GHUP0j97z2Kpko0a31p+939MqVAuWMfpysg==
X-Google-Smtp-Source: ABdhPJw63D9ovn35K26hTCe3lJdn9e5YQa25V5PPkuy9VHIWJcx/jUUw3CkasbiaOBgYYBLol4f4JE72rl3V/MjU+xU=
X-Received: by 2002:a05:6e02:2183:b0:2c7:fe42:7b07 with SMTP id
 j3-20020a056e02218300b002c7fe427b07mr475473ila.302.1648837299132; Fri, 01 Apr
 2022 11:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
 <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
 <Ykc3wm5pqJIA1jCn@robh.at.kernel.org>
 <1fddec5f-5fb3-4ea0-a1e5-9d1b9e54de81@denx.de>
In-Reply-To: <1fddec5f-5fb3-4ea0-a1e5-9d1b9e54de81@denx.de>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Apr 2022 13:21:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLmin2qXdeNrvraAf=fGzttOAYxwFCUSbC5TeHYaN+LhQ@mail.gmail.com>
Message-ID: <CAL_JsqLmin2qXdeNrvraAf=fGzttOAYxwFCUSbC5TeHYaN+LhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 1:06 PM Marek Vasut <marex@denx.de> wrote:
>
> On 4/1/22 19:34, Rob Herring wrote:
> > On Fri, Apr 01, 2022 at 03:22:19AM +0200, Marek Vasut wrote:
> >> On 4/1/22 01:52, Rob Herring wrote:
> >>> On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
> >>>> MIPI-DSI devices, if they are controlled through the bus itself, have to
> >>>> be described as a child node of the controller they are attached to.
> >>>>
> >>>> Thus, there's no requirement on the controller having an OF-Graph output
> >>>> port to model the data stream: it's assumed that it would go from the
> >>>> parent to the child.
> >>>>
> >>>> However, some bridges controlled through the DSI bus still require an
> >>>> input OF-Graph port, thus requiring a controller with an OF-Graph output
> >>>> port. This prevents those bridges from being used with the controllers
> >>>> that do not have one without any particular reason to.
> >>>>
> >>>> Let's drop that requirement.
> >>>>
> >>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>> ---
> >>>>    .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
> >>>>    .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
> >>>>    2 files changed, 2 deletions(-)
> >>>>
> >>>
> >>> I tend to agree with port@0 not being needed and really like
> >>> consistency.
> >>
> >> The consistent thing to do would be to always use port@0 and OF graph, no ?
> >
> > I guess it depends how wide our scope for consistency is. Just DSI bus
> > controlled bridges? DSI panels? All bridges and panels? Any panel
> > without a control interface has the same dilemma as those can be a child
> > of the display controller (or bridge) and not even use OF graph.
>
> I would likely opt for the OF graph in all cases, panels, bridges,
> controllers. Then it would be consistent.
>
> > All simple panels don't require 'port' either. That's presumably only
> > consistent because we made a single schema. I'd assume 'non-simple'
> > panels with their own schema are not consistent.
>
> Maybe we would start requiring that port even for simple panels ?
> The port is physically there on that panel after all.

Fix this in all the dts files and then I'll agree. Though I think this
ship has already sailed. I'd like to someday get to platforms without
warnings and not just keep adding new warnings.

Rob
