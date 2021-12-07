Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9846C14B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF02A6F9D2;
	Tue,  7 Dec 2021 17:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDFA6EA01
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 17:04:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73F7C556;
 Tue,  7 Dec 2021 18:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638896652;
 bh=Oo3zNiuAJNfk53ZJOP0z97e653AwK2d7kec4ofNwVdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kl/KMtXAAHUo291X7sZ3J72YBdOLxgQv40+/sKNiZzsQd9cbJLtxMnUh84tOxWayN
 h7dbg8Kha+OSxqo6uQXCSpQpgiRBtVSx96wML0dKuKO8EchOrd1mogRIrvfXWDGVtB
 7GrhLJN4iicVjJEeDSYFY3VSVjChOXQIZcgopnNY=
Date: Tue, 7 Dec 2021 19:03:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tc358867: Document DPI
 output support
Message-ID: <Ya+T7zPigqtBzdR+@pendragon.ideasonboard.com>
References: <20211127032405.283435-1-marex@denx.de>
 <Ya+PRMvq3cjJ46s/@pendragon.ideasonboard.com>
 <1a7967f0-ed4b-9cd2-28c8-eb9d181448ae@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a7967f0-ed4b-9cd2-28c8-eb9d181448ae@denx.de>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 05:47:29PM +0100, Marek Vasut wrote:
> On 12/7/21 17:43, Laurent Pinchart wrote:
> 
> [...]
> 
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> >> index f1541cc05297..5cfda6f2ba69 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> >> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> >> @@ -61,8 +61,8 @@ properties:
> >>         port@1:
> >>           $ref: /schemas/graph.yaml#/properties/port
> >>           description: |
> >> -            DPI input port. The remote endpoint phandle should be a
> >> -            reference to a valid DPI output endpoint node
> >> +            DPI input/output port. The remote endpoint phandle should be a
> >> +            reference to a valid DPI output or input endpoint node.
> > 
> > I assume the mode of operation (input or output) will be fixed for a
> > given hardware design. Isn't this something that should be recorded in
> > DT ? It would simplify configuration of the device in the driver.
> 
> Currently the configuration (DSI-to-DPI / DPI-to-eDP) is inferred from 
> the presence of DPI panel. If DPI panel present, DSI-to-DPI, else, 
> DPI-to-eDP.

I've had a look at the driver side, and it seems to complicate things
quite a bit. It seems that specifying the mode of operation explicitly
in DT could make software implementations quite a bit simpler.

-- 
Regards,

Laurent Pinchart
