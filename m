Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043474EFA21
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00F010E345;
	Fri,  1 Apr 2022 18:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E87110E345
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:48:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A8D62F7;
 Fri,  1 Apr 2022 20:48:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648838911;
 bh=dujnelcPNk6p4CPVgNhMrG7u9/pxO/a8Ef1tc/FG5g8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C448RAHkb851knPnWOoU22kqCqcMUdrSIT3Y4q7CH3s994gbPtVuGPfDqeLYp4+zd
 utH2X1f/E1dP4O4zB4ACZY6bxCJ5dRmH75CcgMQSHj1LFRpwOsuhtH8vvqrRQ2LFvf
 wlEg+JOPFA2JZfVDZ//EBsfNPkmVMedLFeYNLoPY=
Date: Fri, 1 Apr 2022 21:48:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <YkdI/BSp/lvKYRjO@pendragon.ideasonboard.com>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
 <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
 <Ykc3wm5pqJIA1jCn@robh.at.kernel.org>
 <1fddec5f-5fb3-4ea0-a1e5-9d1b9e54de81@denx.de>
 <CAL_JsqLmin2qXdeNrvraAf=fGzttOAYxwFCUSbC5TeHYaN+LhQ@mail.gmail.com>
 <30ea889f-f65e-e887-e230-935d6207c919@denx.de>
 <CAL_JsqLHsZW0DJNDxKNApk1AKo=91JYnTNVvemF4iCkyYq88bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLHsZW0DJNDxKNApk1AKo=91JYnTNVvemF4iCkyYq88bQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 01:33:15PM -0500, Rob Herring wrote:
> On Fri, Apr 1, 2022 at 1:25 PM Marek Vasut wrote:
> > On 4/1/22 20:21, Rob Herring wrote:
> > > On Fri, Apr 1, 2022 at 1:06 PM Marek Vasut wrote:
> > >> On 4/1/22 19:34, Rob Herring wrote:
> > >>> On Fri, Apr 01, 2022 at 03:22:19AM +0200, Marek Vasut wrote:
> > >>>> On 4/1/22 01:52, Rob Herring wrote:
> > >>>>> On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
> > >>>>>> MIPI-DSI devices, if they are controlled through the bus itself, have to
> > >>>>>> be described as a child node of the controller they are attached to.
> > >>>>>>
> > >>>>>> Thus, there's no requirement on the controller having an OF-Graph output
> > >>>>>> port to model the data stream: it's assumed that it would go from the
> > >>>>>> parent to the child.
> > >>>>>>
> > >>>>>> However, some bridges controlled through the DSI bus still require an
> > >>>>>> input OF-Graph port, thus requiring a controller with an OF-Graph output
> > >>>>>> port. This prevents those bridges from being used with the controllers
> > >>>>>> that do not have one without any particular reason to.
> > >>>>>>
> > >>>>>> Let's drop that requirement.
> > >>>>>>
> > >>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >>>>>> ---
> > >>>>>>     .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
> > >>>>>>     .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
> > >>>>>>     2 files changed, 2 deletions(-)
> > >>>>>>
> > >>>>>
> > >>>>> I tend to agree with port@0 not being needed and really like
> > >>>>> consistency.
> > >>>>
> > >>>> The consistent thing to do would be to always use port@0 and OF graph, no ?
> > >>>
> > >>> I guess it depends how wide our scope for consistency is. Just DSI bus
> > >>> controlled bridges? DSI panels? All bridges and panels? Any panel
> > >>> without a control interface has the same dilemma as those can be a child
> > >>> of the display controller (or bridge) and not even use OF graph.
> > >>
> > >> I would likely opt for the OF graph in all cases, panels, bridges,
> > >> controllers. Then it would be consistent.
> > >>
> > >>> All simple panels don't require 'port' either. That's presumably only
> > >>> consistent because we made a single schema. I'd assume 'non-simple'
> > >>> panels with their own schema are not consistent.
> > >>
> > >> Maybe we would start requiring that port even for simple panels ?
> > >> The port is physically there on that panel after all.
> > >
> > > Fix this in all the dts files and then I'll agree. Though I think this
> > > ship has already sailed. I'd like to someday get to platforms without
> > > warnings and not just keep adding new warnings.
> >
> > I doubt we can fix existing DTs, but can we at least require it for new
> > DTs ?
> 
> We don't have any way to do that currently and get to warning free for
> all DTs. We'd need to be able to disable specific checks for specific
> DTs. I've thought about it, but haven't come up with a way to do it.

I think Marek may have meant new bindings. While I do agree that
inconsistencies in sources can cause new submissions to blindly copy
mistakes, it shouldn't be a reason in itself to carry historical binding
design mistakes in new bindings.

-- 
Regards,

Laurent Pinchart
