Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D73DE5E5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 07:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2AA6E1CD;
	Tue,  3 Aug 2021 05:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C94C6E1CD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 05:04:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCAFB4A3;
 Tue,  3 Aug 2021 07:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627967047;
 bh=7iXBcDMKLGzqf2LR4lsynirI/zfHxyZfPWbEUhP1jss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jm83gOZXHIiE2yp0DuMHlErDYU991cQXdwYPstXqipMdBUp7OTdN5QYVV7TlLkIGR
 ABDtIxoh1emxwPqeANBNQFdD23zInaHQzj47mWTeQCg1UE0/ZujhWAO4Wyyjr7HGP1
 IEEhvMyn9NSYA7mXlNxeTna5zMkhcirQk7MCosN4=
Date: Tue, 3 Aug 2021 08:03:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add
 binding for R-Car MIPI DSI/CSI-2 TX
Message-ID: <YQjOPAne8AnPjCEC@pendragon.ideasonboard.com>
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
 <YQhzsjCheZByFHyS@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YQhzsjCheZByFHyS@robh.at.kernel.org>
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

Hi Rob,

On Mon, Aug 02, 2021 at 04:37:38PM -0600, Rob Herring wrote:
> On Wed, Jul 28, 2021 at 07:26:39PM +0300, Laurent Pinchart wrote:
> > The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> > can operate in either DSI or CSI-2 mode, with up to four data lanes.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > Looks like I forgot to CC the devicetree mailing list and Rob Herring on
> > the first try. Resending, sorry about that.
> > ---
> >  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 119 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> BTW, b4 doesn't like your message-id.

I've told base64, but it shrugged.

Is there a recommendation to change mutt's message_id_format from the
default ?

-- 
Regards,

Laurent Pinchart
