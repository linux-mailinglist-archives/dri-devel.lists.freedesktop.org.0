Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E43697870
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 09:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524210EA6D;
	Wed, 15 Feb 2023 08:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E242E10EA6D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676450694; x=1707986694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z4DhdwaoH58e4ik39f3MRtwMkMTNMbsori+83AG0uWU=;
 b=MGYN0CSwe1ixWbZMfRqBwAJy9nbYpljjEe0df/v8PYeN4+CMyzVGpzCD
 WmSx1STMglL1k5EhnwqaC65l2FZE/Cm87IWebqpVhrJiKN05vhiqsbnES
 eO9eqUQdww7uiTW8qwO8Z0vYzTNu+QfQ5i65NW0uveNNLwFh3RGLhykV6
 CIymSSnbU6m5Itvf0lp60xGFzW9/UAEzzDUZtZR1SHgMbHJfXGUE2hepT
 HY367SMcBuMTZYlLX41B10Q/oSg+0BRo5WRnsJFPvYoKXPiAQNMWL8Myi
 DKV8g9XuTk21GVEegCY9AvwMZcbdQU0LcbQHlC84oI158crGidNwKduJI Q==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29092997"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 15 Feb 2023 09:44:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 15 Feb 2023 09:44:52 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 15 Feb 2023 09:44:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676450692; x=1707986692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z4DhdwaoH58e4ik39f3MRtwMkMTNMbsori+83AG0uWU=;
 b=nCYYzopyh/LuhaoL4m1l8AZSw5kjCYaTxnUBNu5kLOvJDIF0QxmtLQPE
 k5y48QlTcT078beU0d5OJljgs8oz9F1m//8EFG/CB576+Q2/n7qEJLvRh
 5Ji404a9RiaE7RT6e/g9qXncDP3PViI8ibd9ZwPipQkUk6M3eBhsQasz/
 MHsQntqbCyTLl5+ItYiq0M8oDogseNSPaAWOCkhNjnMuG2dSOANtkO5UN
 2RrNHH1YO8qmjNXvwCxcW0b4I6yk9uD0p6KuaorAJkndUJwEj9p3FkVV/
 Q49uoKXzzYinGewsgAJmRVzmhz3j+r+BQaQKWOmkUyd7tEc3qSnZEU0lQ A==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29092996"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2023 09:44:51 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9FDDB280056;
 Wed, 15 Feb 2023 09:44:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Wed, 15 Feb 2023 09:44:51 +0100
Message-ID: <2703596.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <41bc30ac7af4b0ce3ff608b604fb6ea762428680.camel@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <2551514.Lt9SDvczpP@steina-w>
 <41bc30ac7af4b0ce3ff608b604fb6ea762428680.camel@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Am Mittwoch, 15. Februar 2023, 08:49:56 CET schrieb Liu Ying:
> On Wed, 2023-02-15 at 08:26 +0100, Alexander Stein wrote:
> > Hi Liu,
>=20
> Hi Alexander,
>=20
> > thanks for the update.
>=20
> Thanks for the review.
>=20
> > Am Montag, 13. Februar 2023, 09:56:07 CET schrieb Liu Ying:
> > > There is one LCDIF embedded in i.MX93 SoC to connect with
> > > MIPI DSI controller through LCDIF cross line pattern(controlled
> > > by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
> > > directly or connect with a parallel display through parallel
> > > display format(also controlled by mediamix blk-ctrl).  i.MX93
> > > LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
> > > tree binding for i.MX93 LCDIF.
> > >=20
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Reviewed-by: Marek Vasut <marex@denx.de>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v2->v3:
> > > * No change.
> > >=20
> > > v1->v2:
> > > * Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
> > >=20
> > >  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7
> > >=20
> > > ++++++-
> > >=20
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> > > 75b4efd70ba8..fc11ab5fc465 100644
> > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > >=20
> > > @@ -21,6 +21,7 @@ properties:
> > >            - fsl,imx28-lcdif
> > >            - fsl,imx6sx-lcdif
> > >            - fsl,imx8mp-lcdif
> > >=20
> > > +          - fsl,imx93-lcdif
> > >=20
> > >        - items:
> > >            - enum:
> > >                - fsl,imx6sl-lcdif
> > >=20
> > > @@ -88,7 +89,9 @@ allOf:
> > >        properties:
> > >          compatible:
> > >            contains:
> > > -            const: fsl,imx8mp-lcdif
> > > +            enum:
> > > +              - fsl,imx8mp-lcdif
> > > +              - fsl,imx93-lcdif
> > >=20
> > >      then:
> > >        properties:
> > >          clocks:
> > > @@ -107,6 +110,7 @@ allOf:
> > >                enum:
> > >                  - fsl,imx6sx-lcdif
> > >                  - fsl,imx8mp-lcdif
> > >=20
> > > +                - fsl,imx93-lcdif
> > >=20
> > >      then:
> > >        properties:
> > >          clocks:
> > > @@ -123,6 +127,7 @@ allOf:
> > >                - fsl,imx8mm-lcdif
> > >                - fsl,imx8mn-lcdif
> > >                - fsl,imx8mp-lcdif
> > >=20
> > > +              - fsl,imx93-lcdif
> > >=20
> > >      then:
> > >        required:
> > >          - power-domains
> >=20
> > I would have expected that fsl,imx93-lcdif supports up to 3 endpoints
> > (MIPI
> > DSI, LVDS, and parallel) in a 'ports' subnode. But this binding only
> > supports
> > a single 'port' sub-node. Also an example for this case might be very
> > helpful.
>=20
> The port node allows multiple endpoints(See graph.yaml[1]).  It's
> enough to use the existing port node instead of using ports node.

Ah, I wasn't aware of that possibility for OF graph. Yep, agreed then it's=
=20
enough.

> For i.MX93 LCDIF, the port node will be something like this:
> --------------------8<--------------------------
> port {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>=20
>         lcdif_to_pdfc: endpoint@0 {
>                 reg =3D <0>;
>         };
>=20
>         lcdif_to_ldb: endpoint@1 {
>                 reg =3D <1>;
>         };
>=20
>         lcdif_to_cross_line_pattern: endpoint@2 {
>                 reg =3D <2>;
>         };
> };
> --------------------8<--------------------------
>=20
> Looks like it's not necessary to add a specifc example for i.MX93
> LCDIF.

=46ine by me.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> [1]
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/gr=
aph
> .yaml#L48
>=20
> Regards,
> Liu Ying

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider


