Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED52CE08E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 22:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061766EC1F;
	Thu,  3 Dec 2020 21:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA8C6EC1F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 21:24:27 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 01527804D9;
 Thu,  3 Dec 2020 22:24:23 +0100 (CET)
Date: Thu, 3 Dec 2020 22:24:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 0/2] drm: add DisplayPort connector
Message-ID: <20201203212422.GA81406@ravnborg.org>
References: <20201130112919.241054-1-tomi.valkeinen@ti.com>
 <0110944b-f531-1a2c-2263-e5cba86730e4@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0110944b-f531-1a2c-2263-e5cba86730e4@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=RvfnRF042-DQDJFLRnMA:9 a=CjuIK1q_8ugA:10
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
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,
On Thu, Dec 03, 2020 at 01:52:21PM +0200, Tomi Valkeinen wrote:
> Hi DRM Bridge maintainers,
> 
> On 30/11/2020 13:29, Tomi Valkeinen wrote:
> > Hi,
> > 
> > This series adds the DT bindings and a driver for DisplayPort connector.
> > 
> > Minor changes since v3:
> > - Added Laurent's reviewed-bys
> > - Added $ref to graph schema
> > - Use 'ret' instead of 'r'
> > - Add the missing period
> > 
> >  Tomi
> > 
> > Tomi Valkeinen (2):
> >   dt-bindings: dp-connector: add binding for DisplayPort connector
> >   drm/bridge: display-connector: add DP support
> > 
> >  .../display/connector/dp-connector.yaml       | 56 +++++++++++++++++++
> >  drivers/gpu/drm/bridge/display-connector.c    | 46 ++++++++++++++-
> >  2 files changed, 100 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> > 
> 
> Is it ok for me to push this to drm-misc-next, or does one of the bridge maintainers want to handle
> that?

IMO apply them to drm-misc-next.
But I am not bridge maintainer so...

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
