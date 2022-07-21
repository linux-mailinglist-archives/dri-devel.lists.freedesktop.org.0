Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B349957CAB2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 14:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A90909C3;
	Thu, 21 Jul 2022 12:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215BD909C3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:34:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D98E496;
 Thu, 21 Jul 2022 14:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1658406865;
 bh=4u/Wl5mxuWl6k4D4roY6y5SIN2NN8QO64TNR6Sq5plw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vfw7Et/zkla/2ATtBzgqfBnnlCaex0XfbZjJ4o5nxj0tlsMtamhGc5pKQN1UT2gNX
 UAw7jQZRrBsV5TsBRi0wX4M4BIkamT0pv/k+u3gYk3z2T6Ea3JSR3K4WYJgOC8acVb
 DLV59PwlcMxGR0vNwpchrctr/SGHj1KAPSvkfQUI=
Date: Thu, 21 Jul 2022 15:34:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Densitron
Message-ID: <YtlHz1+zLR2oi7cK@pendragon.ideasonboard.com>
References: <20220721030327.210950-1-marex@denx.de>
 <YtjnFxA66V6bMePa@pendragon.ideasonboard.com>
 <0b4927f7-f1e4-60a8-1eaf-6d4cbc38daec@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b4927f7-f1e4-60a8-1eaf-6d4cbc38daec@denx.de>
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
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, robert.foss@linaro.org,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, Jul 21, 2022 at 02:24:57PM +0200, Marek Vasut wrote:
> On 7/21/22 07:41, Laurent Pinchart wrote:
> > On Thu, Jul 21, 2022 at 05:03:27AM +0200, Marek Vasut wrote:
> >> Densitron is a manufacturer of LCD panels.
> >> https://www.densitron.com
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Guido Günther <agx@sigxcpu.org>
> >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Thierry Reding <thierry.reding@gmail.com>
> >> ---
> >>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> index 88859dd4040ee..6277240536b44 100644
> >> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> @@ -312,6 +312,8 @@ patternProperties:
> >>       description: Dell Inc.
> >>     "^delta,.*":
> >>       description: Delta Electronics, Inc.
> >> +  "^densitron,.*":
> > 
> > How about "dsn", to follow the practice of using stock names as vendor
> > prefixes ?
> 
> Is there any benefit to that ? All I can see is that it's making DTS 
> less clear and more difficult to read. It is easy to map "densitron" to 
> "densitron" when it is spelled out like so in the DT, but it sure isn't 
> immediately obvious that "dsn" means "densitron" without extra look up. 
> And even that extra look up of "dsn" does not return densitron, but some 
> woodworking company and other totally unrelated results.

I don't know where that practice originates from, and if it's still the
recommended naming scheme these days. All I know is that it was the
recommended scheme at some point. I expect Rob will be able to tell
which name is best.

-- 
Regards,

Laurent Pinchart
