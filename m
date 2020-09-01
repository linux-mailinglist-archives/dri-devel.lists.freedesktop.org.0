Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D7258CBF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2436E844;
	Tue,  1 Sep 2020 10:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126C6E844
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:27:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8310AAF2;
 Tue,  1 Sep 2020 12:27:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598956055;
 bh=0qlmJYuDW2iryN+BmHfha+stqCE4Vy2hHMSYVH5pWCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxeO5Rvqwl8BlbXEcsJPTQfCHN/4l3Z5KHbvJtDs88j4uxh9kSFeGVCXcD9GA2elZ
 jy1LfR7KunAaxDIZ5eljN6etqK2FntgTzia0yeeeN5Sx8W5AnV4pGcjwCye4HTZRNo
 vOKxYeXuFcCXMb9XiV5MVEdAFNNbIMIMPISEj6Y8=
Date: Tue, 1 Sep 2020 13:27:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Message-ID: <20200901102714.GC5821@pendragon.ideasonboard.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
 <20200824230458.GA3489164@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824230458.GA3489164@bogus>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Aug 24, 2020 at 05:04:58PM -0600, Rob Herring wrote:
> On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> > Document optional vcc-supply property that may be used as VCC source.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> > ---
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 68951d56ebba..3248be31eceb 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -79,6 +79,9 @@ properties:
> >        The GPIO used to control the power down line of this device.
> >      maxItems: 1
> >  
> > +  vcc-supply:
> > +    maxItems: 1
> 
> Probably should be 'power-supply' to align with the 'simple' panels. 
> That's also to signify there's only 1 supply. Using 'vcc' would 
> encourage adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll 
> NAK because at that point it's not a simple bridge with no configuration 
> (it's arguably already there).

Fully agreed.

Do I get your Ab or Rb line with s/vcc/power/ and the commit message
updated to

    dt-bindings: display: bridge: lvds-codec: Document power-supply property

    Document optional power-supply property that may be used to specify the
    regulator powering up the device.

?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
