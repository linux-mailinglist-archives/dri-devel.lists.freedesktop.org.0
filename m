Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421261AB286
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 22:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7D6EA65;
	Wed, 15 Apr 2020 20:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA746EA65
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 20:33:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BCC8DD3;
 Wed, 15 Apr 2020 22:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586982789;
 bh=ZWrQLQiITcnJHS7w+LOALjXfWMs5iz+rT8aFRxucxtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GQiAUrd7WJjvq8jNIeeljZaHhBNFa/QhJS4yGJW5WND2eu3EUuqC3ud3FcqdxopQf
 XSO0UCi7+yJP0gda51b3GJ5gC4HhTREnnvjaC0aBVqfHLALAzWwxAUjKVIJuL19Bua
 VngkH6/jze8rIhCrN/ha0VSue9EADOCMji40G+to=
Date: Wed, 15 Apr 2020 23:32:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
Message-ID: <20200415203256.GP4758@pendragon.ideasonboard.com>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 spanda@codeaurora.org, a.hajda@samsung.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 12:53:02PM -0700, Stephen Boyd wrote:
> Quoting Douglas Anderson (2020-04-15 08:48:40)
> > Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> > example.
> > 
> > NOTE: The current patch adding support for hpd-gpios to the Linux
> > driver for hpd-gpios only adds enough support to the driver so that
> > the bridge can use one of its own GPIOs.  The bindings, however, are
> > written generically.
> > 
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > 
> >  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > index 8cacc6db33a9..554bfd003000 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > @@ -60,6 +60,10 @@ properties:
> >      const: 1
> >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> >  
> > +  hpd-gpios:
> > +    maxItems: 1
> > +    description: If present use the given GPIO for hot-plug-detect.
> 
> Shouldn't this go in the panel node? And the panel driver should get the
> gpio and poll it after powering up the panel? Presumably that's why we
> have the no-hpd property in the simple panel binding vs. putting it here
> in the bridge.

Same question really, I think this belongs to the panel (or connector)
node indeed.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
