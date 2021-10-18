Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7957432810
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 21:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B581B6E0F8;
	Mon, 18 Oct 2021 19:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36786E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 19:58:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E04118F1;
 Mon, 18 Oct 2021 21:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634587092;
 bh=h9q17lnxPlSuYfsSjKylh2YK+JZl6xp76jzw6AuN+eI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aOSt/e+TKryBtJKxp0QWaHcaNM47x892oLl///9lUx3rQkcQiFf9h2DocYYLKScAH
 e2uNJKZd8+yjGoMNftbMY6P/FCTj3yXf91DXft0D1XB+uoz3jbMRazgJmj8dr4Wpfv
 xXzVh9/gc/peA5/itmBm5F4sK06uQG2+90uhXVlI=
Date: Mon, 18 Oct 2021 22:57:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec:
 Document pixel data sampling edge select
Message-ID: <YW3Rw0hZmB6plu+V@pendragon.ideasonboard.com>
References: <20211017001204.299940-1-marex@denx.de>
 <YW24EbfbtJdMMDRV@pendragon.ideasonboard.com>
 <c34f8a7e-eec6-9373-0c52-f6546ad689a8@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c34f8a7e-eec6-9373-0c52-f6546ad689a8@denx.de>
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

Hi Marek,

On Mon, Oct 18, 2021 at 09:47:13PM +0200, Marek Vasut wrote:
> On 10/18/21 8:08 PM, Laurent Pinchart wrote:
> 
> [...]
> 
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >> index 1faae3e323a4..708de84ac138 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >> @@ -79,6 +79,14 @@ properties:
> >>         - port@0
> >>         - port@1
> >>   
> >> +  pclk-sample:
> >> +    description:
> >> +      Data sampling on rising or falling edge.
> >> +    enum:
> >> +      - 0  # Falling edge
> >> +      - 1  # Rising edge
> >> +    default: 0
> >> +
> > 
> > Shouldn't this be moved to the endpoint, the same way data-mapping is
> > defined as an endpoint property ?
> 
> The strapping is a chip property, not port property, so no.

For this particular chip that's true. I'm still not convinced overall.
For some cases it could be a per-port property, and moving it there for
lvds-codec too could allow implementing helpers to parse DT properties,
without much drawback for this particular use case as far as I can see.
It's hard to predict the future with certainty of course, so I won't
insist.

-- 
Regards,

Laurent Pinchart
