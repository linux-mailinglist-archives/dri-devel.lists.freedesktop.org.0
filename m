Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4754EFA13
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552F410E054;
	Fri,  1 Apr 2022 18:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D8D10E054
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:46:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 348F92F7;
 Fri,  1 Apr 2022 20:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648838761;
 bh=bIPnJlMFDVmi0C1I8Q2bPj5LFxQ4imZIJVNx9HE6Nwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3/dgBqn91Fd07hpAMTcNUbc3I/u9WoPvb38QJyYB6PVZKVIL5lFU+xd+YH30kjob
 gskPGn8cDTtBhdk1MzLczSI4ejtjRrdoh1OBIz3SruxITLJV4E8e7MwAmIMXrNwTz1
 ftDnTnwtRXdLwHlGS4v5exk8Gqc7Oy6gZVu5MxBc=
Date: Fri, 1 Apr 2022 21:45:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC][PATCH 1/3] dt-bindings: display: panel: mipi-dbi-spi: Make
 width-mm/height-mm mandatory
Message-ID: <YkdIZhpy6px3Xgk9@pendragon.ideasonboard.com>
References: <20220401163755.302548-1-marex@denx.de>
 <CAL_JsqKVkc51sXWE6Sh5yHxLX0vJWgFpn8cmjjKSBx4dYzA8qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKVkc51sXWE6Sh5yHxLX0vJWgFpn8cmjjKSBx4dYzA8qA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Robert Foss <robert.foss@linaro.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 01:36:53PM -0500, Rob Herring wrote:
> On Fri, Apr 1, 2022 at 11:38 AM Marek Vasut <marex@denx.de> wrote:
> >
> > Make the width-mm/height-mm panel properties mandatory
> > to correctly report the panel dimensions to the OS.
> 
> Adding required properties is an ABI break.

Only if drivers don't provide backward compatibility.

There's still the issue of validation warnings of course. We can ensure
that DT sources in the kernel are updated. For out-of-tree DT, I'll
argue that a validation warning is a good thing, it will notify that an
update is needed.

> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Dmitry Osipenko <digetx@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Noralf Trønnes <noralf@tronnes.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: devicetree@vger.kernel.org
> > To: dri-devel@lists.freedesktop.org
> > ---
> >  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > index f29789994b18..c2df8d28aaf5 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > @@ -83,6 +83,8 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - width-mm
> > +  - height-mm
> >    - panel-timing
> >
> >  unevaluatedProperties: false

-- 
Regards,

Laurent Pinchart
