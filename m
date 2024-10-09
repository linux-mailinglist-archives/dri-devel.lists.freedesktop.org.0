Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A714C996EF5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D86210E762;
	Wed,  9 Oct 2024 14:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rRIhHAqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8490010E762
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:59:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 810855C05FF;
 Wed,  9 Oct 2024 14:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA065C4CEC3;
 Wed,  9 Oct 2024 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728485968;
 bh=S6Oq4Cl8cwV10b0MxDD4bAzcwNwphys1J9zfQElXCyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rRIhHAqwqrFRZMBMrJ8ebfmFCYfPNCaYkn0ZEfGd+KSfij9Ja6LDL8c1srGRiIL6n
 0gDKIiNZRsLhzYLn9AamZuybBKkZCqSN/OlHzVWrpoICRDSL2yz0yYPl5u1fCVVA6l
 RuAuKZKeX61vurd3ZuKUp+iAhH4VWFPnMeVRuPUlFQs9rmTvgcwFsFHoRGd4iXUz4n
 P2cwhU/MER6we8GpOc9pPt/SsqJCz+EdwOUgY1x+OEdI2P0bEcsSSIYoQzTe1mLoWW
 63uNUdUrh36rDgVc/lgWO7MELr0GKDOH0Rnw55RtsuE/+VLYsfin+NRnxC4Fa9GXk4
 vzuUgINcAavNQ==
Date: Wed, 9 Oct 2024 09:59:25 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <20241009145925.GA465237-robh@kernel.org>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
 <20241009142758.GB16179@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009142758.GB16179@aspen.lan>
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

On Wed, Oct 09, 2024 at 03:27:58PM +0100, Daniel Thompson wrote:
> On Tue, Oct 08, 2024 at 06:00:58PM -0400, Frank Li wrote:
> > Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> > Additional Changes:
> > - Remove mfd parent node at example.
> > - Ref to backlight's common.yaml
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
> >  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
> >  2 files changed, 36 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> > deleted file mode 100644
> > index ff5c921386502..0000000000000
> > --- a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -Zodiac Inflight Innovations RAVE Supervisory Processor Backlight Bindings
> > -
> > -RAVE SP backlight device is a "MFD cell" device corresponding to
> > -backlight functionality of RAVE Supervisory Processor. It is expected
> > -that its Device Tree node is specified as a child of the node
> > -corresponding to the parent RAVE SP device (as documented in
> > -Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
> > -
> > -Required properties:
> > -
> > -- compatible: Should be "zii,rave-sp-backlight"
> > -
> > -Example:
> > -
> > -	rave-sp {
> > -		compatible = "zii,rave-sp-rdu1";
> > -		current-speed = <38400>;
> > -
> > -		backlight {
> > -			compatible = "zii,rave-sp-backlight";
> > -		};
> > -	}
> > -
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> > new file mode 100644
> > index 0000000000000..fe9dba8231bf1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> > @@ -0,0 +1,36 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/zii,rave-sp-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Zodiac Inflight Innovations RAVE Supervisory Processor Backlight
> > +
> > +maintainers:
> > +  - Lee Jones <lee@kernel.org>
> 
> How did you arrive at this maintainer list?
> 
> It's not the usual backlight group and it also doesn't match the
> maintainer for the mfd bindings.

It should be someone that has Zodiac h/w, not backlight maintainers 
either. If we can't identify anyone then maybe the platform should be 
removed.

Rob

