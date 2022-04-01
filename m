Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2ED4EF9E9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33610E199;
	Fri,  1 Apr 2022 18:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2259610E199
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:33:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C627B825B4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40969C36AE2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648838008;
 bh=bDlCd+GBQ+mqOJchbFEIUDC4io4eBTFi4lSCULak7Kc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JbnKCQCjCFYpbmw7uzAcevCRmxDAly9ACyc0IKYkbCzFHNeiujm7c92aZbVjaWXND
 J91rlDwqEB7Qo78LaTRf6oKwwNAaNY4R9M3n7C5SwMGa1MO8g8dTF/WJ1X0AvHObl8
 Mt35LmxRcNsopH0OOf1yQosDpAcVnEB5aG0DGggsXNK5iv6LVeBvhzkxVyE89AGwVL
 WrmDaoBWeup7fZ9q7aGMOctglgjMX60q9WWhHD1nXV4tk9hOl9eMh8xV4xxrgg/oKe
 ShLtjlnNQcrQ9GYusVBwaN3r3L/lq9IEakA2lFuxXlLFeGWLIWI6O4r4fgnRMjKOzo
 RFq8Syf+S21jw==
Received: by mail-io1-f53.google.com with SMTP id e22so4148241ioe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 11:33:28 -0700 (PDT)
X-Gm-Message-State: AOAM5334ZyrgyQWT2A7X8SG72GNoEcDzSCIx/+DTQ46LT5FupmZwUFMe
 jm7yTZKCxnsWn3jWgH0g2/yMUiUaEx96HxKR/A==
X-Google-Smtp-Source: ABdhPJwrG0ux9MKLAl032Ro0HBQskvW4qfvM90GI0L1thJTPaa+8ocOgKj5NyIHBLj1HTAAHi/XXNJPUvoXwbgJoa7M=
X-Received: by 2002:a05:6638:3052:b0:317:79e1:8b7f with SMTP id
 u18-20020a056638305200b0031779e18b7fmr6237380jak.239.1648838007308; Fri, 01
 Apr 2022 11:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
 <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
 <Ykc3wm5pqJIA1jCn@robh.at.kernel.org>
 <1fddec5f-5fb3-4ea0-a1e5-9d1b9e54de81@denx.de>
 <CAL_JsqLmin2qXdeNrvraAf=fGzttOAYxwFCUSbC5TeHYaN+LhQ@mail.gmail.com>
 <30ea889f-f65e-e887-e230-935d6207c919@denx.de>
In-Reply-To: <30ea889f-f65e-e887-e230-935d6207c919@denx.de>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Apr 2022 13:33:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLHsZW0DJNDxKNApk1AKo=91JYnTNVvemF4iCkyYq88bQ@mail.gmail.com>
Message-ID: <CAL_JsqLHsZW0DJNDxKNApk1AKo=91JYnTNVvemF4iCkyYq88bQ@mail.gmail.com>
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

On Fri, Apr 1, 2022 at 1:25 PM Marek Vasut <marex@denx.de> wrote:
>
> On 4/1/22 20:21, Rob Herring wrote:
> > On Fri, Apr 1, 2022 at 1:06 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 4/1/22 19:34, Rob Herring wrote:
> >>> On Fri, Apr 01, 2022 at 03:22:19AM +0200, Marek Vasut wrote:
> >>>> On 4/1/22 01:52, Rob Herring wrote:
> >>>>> On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
> >>>>>> MIPI-DSI devices, if they are controlled through the bus itself, have to
> >>>>>> be described as a child node of the controller they are attached to.
> >>>>>>
> >>>>>> Thus, there's no requirement on the controller having an OF-Graph output
> >>>>>> port to model the data stream: it's assumed that it would go from the
> >>>>>> parent to the child.
> >>>>>>
> >>>>>> However, some bridges controlled through the DSI bus still require an
> >>>>>> input OF-Graph port, thus requiring a controller with an OF-Graph output
> >>>>>> port. This prevents those bridges from being used with the controllers
> >>>>>> that do not have one without any particular reason to.
> >>>>>>
> >>>>>> Let's drop that requirement.
> >>>>>>
> >>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>> ---
> >>>>>>     .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
> >>>>>>     .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
> >>>>>>     2 files changed, 2 deletions(-)
> >>>>>>
> >>>>>
> >>>>> I tend to agree with port@0 not being needed and really like
> >>>>> consistency.
> >>>>
> >>>> The consistent thing to do would be to always use port@0 and OF graph, no ?
> >>>
> >>> I guess it depends how wide our scope for consistency is. Just DSI bus
> >>> controlled bridges? DSI panels? All bridges and panels? Any panel
> >>> without a control interface has the same dilemma as those can be a child
> >>> of the display controller (or bridge) and not even use OF graph.
> >>
> >> I would likely opt for the OF graph in all cases, panels, bridges,
> >> controllers. Then it would be consistent.
> >>
> >>> All simple panels don't require 'port' either. That's presumably only
> >>> consistent because we made a single schema. I'd assume 'non-simple'
> >>> panels with their own schema are not consistent.
> >>
> >> Maybe we would start requiring that port even for simple panels ?
> >> The port is physically there on that panel after all.
> >
> > Fix this in all the dts files and then I'll agree. Though I think this
> > ship has already sailed. I'd like to someday get to platforms without
> > warnings and not just keep adding new warnings.
>
> I doubt we can fix existing DTs, but can we at least require it for new
> DTs ?

We don't have any way to do that currently and get to warning free for
all DTs. We'd need to be able to disable specific checks for specific
DTs. I've thought about it, but haven't come up with a way to do it.

Rob
