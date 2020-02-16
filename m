Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B9160481
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 16:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7AA6E037;
	Sun, 16 Feb 2020 15:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3385C6E037
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 15:29:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B8DA2AF;
 Sun, 16 Feb 2020 16:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581866938;
 bh=SBcgUjw9x3rOad2pi6wnvIDSAkwZ+PVWqSdvxJ1IPGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=txR31kI3ukSy8U8AAM8CScHL59YfHYWo6YMJxTSN7WWZDOh9rZgusn9akd+88ZC4u
 PqLsvXsHilHbRAdFNIgrn94uMRleGGjyxie7UZrjK1IHwM27GyHqEUZBYA7lZ0Wary
 OkpuqriUUa99SP/xwsBP89W3p/qcglGHGkWS/wkA=
Date: Sun, 16 Feb 2020 17:28:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings.
Message-ID: <20200216152840.GB28645@pendragon.ideasonboard.com>
References: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
 <1581481604-24499-2-git-send-email-yamonkar@cadence.com>
 <b97283b0-e4a5-4b96-e509-b9b5cdd78991@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b97283b0-e4a5-4b96-e509-b9b5cdd78991@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 praneeth@ti.com, narmstrong@baylibre.com, airlied@linux.ie,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, jonas@kwiboo.se, jsarha@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, maxime@cerno.tech,
 sjakhade@cadence.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuti,

Thank you for the patch.

On Thu, Feb 13, 2020 at 11:16:51AM +0200, Tomi Valkeinen wrote:
> On 12/02/2020 06:26, Yuti Amonkar wrote:
> > Document the bindings used for the Cadence MHDP DPI/DP bridge in
> > yaml format.
> > 
> > Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >   .../bindings/display/bridge/cdns,mhdp.yaml    | 125 ++++++++++++++++++
> >   1 file changed, 125 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> > new file mode 100644
> > index 000000000000..e7f84ed1d2da
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Cadence MHDP bridge
> > +
> > +maintainers:
> > +  - Swapnil Jakhade <sjakhade@cadence.com>
> > +  - Yuti Amonkar <yamonkar@cadence.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - cdns,mhdp8546
> > +      - ti,j721e-mhdp8546
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - description:
> > +          Register block of mhdptx apb registers upto PHY mapped area(AUX_CONFIG_P).
> 
> "up to". Add space before (.
> 
> > +          The AUX and PMA registers are mapped to associated phy driver.

I wouldn't mention driver here, as that's a software concept unrelated
to DT bindings. You could write "The AUX and PMA registers are not part
of this range, they are instead included in the associated PHY.".

> > +      - description:
> > +          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - const: mhdptx
> > +      - const: j721e-intg
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      DP bridge clock, it's used by the IP to know how to translate a number of

s/it's //

> > +      clock cycles into a time (which is used to comply with DP standard timings
> > +      and delays).
> > +
> > +  phys:
> > +    description: Phandle to the DisplyPort phy.
> 
> "Display"

And s/Phandle/phandle/, and s/phy/PHY/.

Shouldn't this bridge also have port nodes ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
