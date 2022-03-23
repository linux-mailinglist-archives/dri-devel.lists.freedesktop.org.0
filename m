Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8534E5AD6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 22:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5220F10E154;
	Wed, 23 Mar 2022 21:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD4F10E154
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 21:47:26 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 12so3023559oix.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 14:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OkkqPejIvAtlOMyVAYvOIwcHM2WzlIdgAOpzjXKoJU4=;
 b=Y6dO6F43ucWVCaN0AhSpNaw/zHnjyi/yqWpXlvofhLS6PABCQQCW1Tr+KFGeEO+e0N
 Os95c5EWjkaKKzFTGOFheJSBCZWMgjrtX7jVr/IhilLj98VE9AEmbeMar8Ok11Mmd7ao
 f677IT72XWp4zc7iZJRvdOQEOFzKHkqcX7xwQurmXSmic7WSWWmoqP+CrnIMGsNloBZf
 yD637jC7LryY1LwBkH4wkYyKbHKp0LhMI/8P8aeZ+TP6nbeQjPg5zBuqjJAtFKB/DzQt
 WMxGC+x1z8Z27/hYRanG3tE+LIFSIxtLR9sPQXEaCKp2ATBf19/sKkYWVHH15FRJ+w+O
 J2/g==
X-Gm-Message-State: AOAM531CHPiz0hdK3v5GS30ui27Iy41lzszQoaFrPOi3pytmOwqlf0kr
 Rf79Wfp1apopyzPhcwBwpg==
X-Google-Smtp-Source: ABdhPJxWMtgj0H9DbEOzxF/FOzBu64GXgF8jadPVZ/QU9gzyJsiWf8KipKX16vZYBZk3dCF5pko6Yg==
X-Received: by 2002:a05:6808:146:b0:2f4:748:5588 with SMTP id
 h6-20020a056808014600b002f407485588mr495090oie.292.1648072045865; 
 Wed, 23 Mar 2022 14:47:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q6-20020acaf206000000b002ef960f65b3sm498887oih.25.2022.03.23.14.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 14:47:25 -0700 (PDT)
Received: (nullmailer pid 512768 invoked by uid 1000);
 Wed, 23 Mar 2022 21:47:24 -0000
Date: Wed, 23 Mar 2022 16:47:24 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Message-ID: <YjuVbBck5RE79EPl@robh.at.kernel.org>
References: <20220314161004.14765-1-biju.das.jz@bp.renesas.com>
 <20220314161004.14765-2-biju.das.jz@bp.renesas.com>
 <YjtkMxC0X7mMvMKX@robh.at.kernel.org>
 <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB593341D2E966F3C60ADAC8E986189@TYCPR01MB5933.jpnprd01.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 06:26:31PM +0000, Biju Das wrote:
> Hi Rob,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L
> > MIPI DSI TX bindings
> > 
> > On Mon, Mar 14, 2022 at 04:10:02PM +0000, Biju Das wrote:
> > > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's.
> > > It can operate in DSI mode, with up to four data lanes.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > RFC->v1:
> > >  * Added a ref to dsi-controller.yaml.
> > > RFC:-
> > >  *
> > > ---
> > >  .../bindings/display/bridge/renesas,dsi.yaml  | 146
> > > ++++++++++++++++++
> > >  1 file changed, 146 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > new file mode 100644
> > > index 000000000000..74bc3782d230
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > > +++ l
> > > @@ -0,0 +1,146 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +
> > > +title: Renesas RZ/G2L MIPI DSI Encoder
> > > +
> > > +maintainers:
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description: |
> > > +  This binding describes the MIPI DSI encoder embedded in the Renesas
> > > +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
> > > +  to four data lanes.
> > > +
> > > +allOf:
> > > +  - $ref: ../dsi-controller.yaml#
> > 
> > Full path preferred:
> > 
> > /schemas/display/dsi-controller.yaml#
> 
> OK. Will fix this.
> 
> > 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Link register
> > > +      - description: D-PHY register
> > 
> > D-PHY is not a separate block?
> 
> Basically D-PHY is integrated inside MIPI-DSI Tx module.
> 
> MIPI-DSI Tx module consists of MIPI DSI-2 Host controller (LINK)
> and MIPI D-PHY Tx(D-PHY).
> 
> That is the reason I have modelled like this.
> 
> Is this model ok or am I missing something here? Please let me know.

I don't know the details of the h/w so I can't say. We do see blocks 
with a phy modeled as 1 block only to need to separate them when the phy 
part changes in the next process node. I imagine we have it done both 
ways for DSI + D-PHY.

Rob
