Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA72576FA5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 17:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEC6113A94;
	Sat, 16 Jul 2022 15:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEEB8EB3F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 15:12:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 363A06E0;
 Sat, 16 Jul 2022 17:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657984357;
 bh=SqADCWXFXONCpdgY4hl/8v2eC4vqPseH2e03h4BzIGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kc1Z777CWxCl6R7vhj65BdU7ssL5ud6tNDIZ5QTwIvI/XPyaTvJKzKSq0M5OCEnef
 67METLL9IEJdIgQpHpeJvl6OYObQVF2gOi1VeS2Ef6g6X9WllHJgmmwoYffDnJ8ZTj
 z8NuPL4uxZQG//WHKN5PM28iWDIZ1Nkp6YDphcnA=
Date: Sat, 16 Jul 2022 18:12:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/6] dt-bindings: Use new video interface bus type
 macros in examples
Message-ID: <YtLVRclLA4Jkk5i2@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-3-laurent.pinchart@ideasonboard.com>
 <YtKEzS6j0/45E7tP@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtKEzS6j0/45E7tP@valkosipuli.retiisi.eu>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sakari,

On Sat, Jul 16, 2022 at 12:28:45PM +0300, Sakari Ailus wrote:
> On Thu, Jun 16, 2022 at 01:14:06AM +0300, Laurent Pinchart wrote:
> > Now that a header exists with macros for the media interface bus-type
> > values, replace hardcoding numerical constants with the corresponding
> > macros in the DT binding examples.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Go back to PARALLEL
> > 
> > Changes since v1:
> > 
> > - Rename PARALLEL to BT601
> > ---
> >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 1 +
> >  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ++-
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml  | 3 ++-
> >  .../devicetree/bindings/media/marvell,mmp2-ccic.yaml          | 3 ++-
> >  Documentation/devicetree/bindings/media/microchip,xisc.yaml   | 3 ++-
> >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 +++-
> >  6 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 35a48515836e..b0e5585f93e2 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -118,6 +118,7 @@ additionalProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >  
> >      i2c0 {
> >          #address-cells = <1>;
> 
> The definition doesn't seem to be used here. Is there a need to include
> this?

There was, but the change that added bus-type to this binding got
reverted in commit 979452fbc430 ("dt-bindings: drm/bridge: anx7625:
Revert DPI support") and I forgot to drop the header when rebasing.

> I could drop this chunk while applying. There's just one trivial change
> elsewhere in this patch to make.

Please do :-)

-- 
Regards,

Laurent Pinchart
