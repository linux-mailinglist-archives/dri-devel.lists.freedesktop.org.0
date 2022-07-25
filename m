Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27057F943
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 07:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F08112E11;
	Mon, 25 Jul 2022 05:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D2A113602
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 05:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5fmNAoOjYS1qXZ4pqvXQ0ilHE5bJJG2JkdewTiI8djW9vf0Q3NoYlXhMgzFMIb48cxE5+up43rojZTT/hlPk/e4+niTw2zDAAxrJkcLeVmx7GP2KQ/b1Wwrut1NiX8PWQuS524OqCLf+FqqzL8BhwCiKr/oANqtGHF5lf3kT9QoikdG+0KCP+4kMJ1XAHvb2E0wnK/mfbOLCgiowCWu9yZ3sCQ8vpuLv1yp/E2eDwRpkiLyCzHUHchmOzUdvjSNZQnD48CtsA3nU3zNEu25w73+spb1dQgSXquvdeeqm/C5LfMex5/AZ+U4hE+s8lAuUbW2BpiUAxBMXXijxkfjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQwKjI0ltdik4HSsHRc29svTe1Kq1G8hz7tNMd3NCBw=;
 b=Ex4jpPqSh/i9tYQHMUF2CSyp2EApNqfbNvEbTs6V1rZyar0pMU9EIu0gmxQ+SLWwVf5KkvsVWPNjWm5M2prE3tWChXdK7DDQVh+glk55yhaEoHDE3lXeY+ajbMAZ3ScGYS3uyCXgqy6aaSKg1jcigKkWJC+I28WABENkybp7AxDrmkkRr71GjJNCXzVB2FefYY5IO99XlH2OFTy8siKURpIgfZCwalE0ZSq/M/DNMhTBgl8iEX4cWFosbspbn336i0m1mlaNgtX9naovJntr/OcQHp+GQerP2JRneCR4hnC/k3t34Q270WCsKEuwZ4UWtigFxPf9yC1kMZhimN/+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQwKjI0ltdik4HSsHRc29svTe1Kq1G8hz7tNMd3NCBw=;
 b=L9hG6qjVXDllJhgYchu7jQjjlLegMGcka3hFra6LDZmZKBpUdJEeFIvpZnUESKozTKFoemnHxoenX14fvRHKmEvTjmNjWzVJhdTCqkfcBHE9102dUbdg6ho1DSf8TdQuYELSInipuqGpMExjXlFx1AKYWo2fWyG8U7G6docdTRw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8808.jpnprd01.prod.outlook.com (2603:1096:400:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 05:58:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 05:58:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Topic: [PATCH v4 1/2] dt-bindings: display: bridge: Document RZ/G2L
 MIPI DSI TX bindings
Thread-Index: AQHYnf/87eTeKvDbekaCDE5oqiHWv62K0KIAgAPI8vA=
Date: Mon, 25 Jul 2022 05:58:39 +0000
Message-ID: <OS0PR01MB5922D4ACD0C05DAC4A471BA886959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220722191924.544869-1-biju.das.jz@bp.renesas.com>
 <20220722191924.544869-2-biju.das.jz@bp.renesas.com>
 <YtsC6p7yy86Dr95H@ravnborg.org>
In-Reply-To: <YtsC6p7yy86Dr95H@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f93255f5-775d-4786-3170-08da6e02b8f5
x-ms-traffictypediagnostic: TYWPR01MB8808:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FvfPvldjfKpSqGUhvWMwQpCxUNe+A6BdfUuipwnjm7MRzrK+KWtVcH5gxucOMFkxPYpMFDI/CWME2Q5jSB1ugRSbVhWq+C9woJ/ZW/X8VI/UkvaDQmazF93u2nFdZ7PLgYZ2MGhcF017Y0rU1Wcr+LZeS17CM8Y6KeLXq+7nbUo2OA5Lo0eZpFj8c8fJxCwCFoUujGl4cf3oeB1orpn+IP3sV1wOJNX3JzqlyqDmasmghN2iJihPtdKEQD7UP+QM87d0pk+ZZHTf6yr8K3CaRAG7JotUnC+tMgO55GX5akdFnCg6IW742hpE+C+kVBVyku4jpv7oA4endZBziiEaUc4wDV2bG/XCFZMhqFKHIPIuxzWlnFcHS714tJyDjIwIvH0IBtk1XcRPqstpoI4EY3V/z9t7p/dbqiwWjJhQlO2wCYBFeqwx+4kBotiV8FLLhcdoWWzO7IuIeYU7813dycJ4n66Hn+8pfCkrEgX1rYS1H1borNPQopvOgEuOdoPtgWxxsR3eWE8mouJvsWGnnEcCZnHJQlFrJCg/XwWR4k/LAt0bwXZ3NxF6CAJn8On0EIIpPXBdZcmgz+Yd/JX6yoapJuh6juLo0iclfD02UHa4DI4lZujQS5Pikj4ByCa7GleTqgax7gWET1YVCgxRRS+JHjW2K3YdNTD8SqHvxEMk/DOPbBHqv/L/gWKJBe8jREMhc7FBL2bL6kmClLl1bFW3SAWIBma593MntAsvFpoKeRQuJBDqkwLQnWz/hBI5oHdDoNPd8YYjWu6RnFk4xKtJRYpAD54w751FJ+f8p4YO/cUZ0kSDuw4JBKNA4/CO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(38100700002)(122000001)(38070700005)(52536014)(8936002)(83380400001)(186003)(7416002)(5660300002)(64756008)(66476007)(66556008)(66446008)(55016003)(2906002)(66946007)(41300700001)(26005)(9686003)(7696005)(478600001)(33656002)(4326008)(76116006)(8676002)(71200400001)(54906003)(316002)(86362001)(6506007)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FAVoqc1vEF19+W3Vnr7hNHftDkzLcHtYBebNtnv4qmk9b23Xzvzne0B/IGX0?=
 =?us-ascii?Q?oP0+3o2CpzTmG9QyV/rtyrLdVGSPKtLqJz7o266TMb7IFFY7O5QHe8O70bnX?=
 =?us-ascii?Q?27xh6R4CijWYC0FCx1D6edl2qcyOZ0I+JIlJKaH35rLxBu6X01hV7zuPALYp?=
 =?us-ascii?Q?LXDiV2LBfOOe3sRAAb16Py2FZcfyb3IC5dShibOjnizHwkri1MVX6akVyBnw?=
 =?us-ascii?Q?NLg3in/nwtcuNcri8c8Ndm4hO2b48OBRqV83kL2je+aqqCPJn/NAYB73YFYf?=
 =?us-ascii?Q?2LwsjHhyb5vKj224nOG4jQvpKF2lSVg+X8K1ZTiSobta0Ag/iAFJbT7GoBMd?=
 =?us-ascii?Q?fi7hF4Z86q66Sf+F1C0Tj7LJ+JCbf9YoyT1ww7izv4kSmCxfUsjgqjqqH/Ir?=
 =?us-ascii?Q?1IGWo44bn0FOh1ipsisoHXd8k/TJ9VkCcfeZUfM57uFs4SEtuPM6aQj4xuA6?=
 =?us-ascii?Q?WsXswRbruwPXOv2UyEhreqs9eq4Tu65nAs1suAURfomBZhVEGQ0bYhXdADvZ?=
 =?us-ascii?Q?H6JAawreMtPMBmb9lKw3k8S7VfQcogYyEaiEXNc/JiIle8cDcnKVKfZApCGf?=
 =?us-ascii?Q?mrLFsglxEL3iwsC6DoG49DzuGZLScpeNOfwYpgAAjjzdfVp2TNun/z81tm/1?=
 =?us-ascii?Q?tYzrfBewRhE2XP7O+/88wuvRdWvIQB/RpEa4bspD8UKKLXQCnmOjiJgP/t+t?=
 =?us-ascii?Q?HQnrV1cgl3yACc/YAI19FSwjJh/cg1VFgJf0Tpx6/7udx9KUhDRfVUY44x6L?=
 =?us-ascii?Q?SUeqaEW8OkK4S3NVrX1f+soZ+AHFHZ8U3Y+Lf8YFXhaU6WVW/pHO1NwGS9Bf?=
 =?us-ascii?Q?P3fdt64T7kXniO1+za2NguLtxFsrp+808dgfDoXtDZUrl/aG6NMomEQWpzdp?=
 =?us-ascii?Q?hEJZOKDERpzh99lkknNIIz0P5Jn9+YZMYVJkC5MEP/lhg4Jc2mbfFeu3cZmC?=
 =?us-ascii?Q?JnuyIC55YbhyvB4BwTXSLesMUzt6B3MHFBMWWUo2cL0eqE+gotqqgHmnWoa/?=
 =?us-ascii?Q?amH95BQxXkG00bMUHoD+Bf3SNbyMFIefTVvk9ISitbVjzx9BCEQ3X2xP6fMO?=
 =?us-ascii?Q?+JtTLFMwaphBoAQ+ONK7ZIHPVN7VQRof0wxCEYgaZ+NpXBSCxumeXyvtIYqO?=
 =?us-ascii?Q?2WbV2RuLG/zr2UB6A3veDNjNMNMPdhunVdsjp8ntqKW6NRKbDTTcszMng42M?=
 =?us-ascii?Q?rFPc4vAU5QSlJ5KmwVzMEvViOZDPjMxmlUmuKLB/Jh050ax5PImPBX6S45p4?=
 =?us-ascii?Q?zPrzVaMgNlCnxK3jcaC6P6EVHeWGUimT4zfEzZZ7qJ5ggU7hf9YABCBhF4D7?=
 =?us-ascii?Q?GVtLSK9yeSRzxDb3FGA7i534ktwy5EPUthm0GBXBptByA/M4UXC+Xyy0mJhW?=
 =?us-ascii?Q?/FjlNTy9OfiMx8aQJNDLMmytlQ3FxKoSsp4rDEdtIVgjMYZEQe1tDs7+ggk1?=
 =?us-ascii?Q?rBrQj5CLcrO7xmDOamc67JAuuTiUxFbs3+ojWUVsB5fUVOmsTgrkjkWmbs1m?=
 =?us-ascii?Q?cKt5EhkDaomzXkGozRIysfj8o43qdwQ8g5tgcjNROs6wBysrRJDDz8k9l4IP?=
 =?us-ascii?Q?Go6LCfIbZZAPZBOwYPdbSY9vsIatAImTipQuCMG1gsUpk4vaPC20qoSoHhN5?=
 =?us-ascii?Q?qQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93255f5-775d-4786-3170-08da6e02b8f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 05:58:39.7945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBZHYifNlibEOIN8jk2aT35287XMF15/0NN0w0WiR5DnCzXEDfkJaSKkAQpwLZIeMTK+dsSJrcidin6PLsxtjj5bPI6rJAZW3WikbhnDryo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8808
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Robert Foss <robert.foss@linaro.org>, Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thanks for the feedback.

> Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: Document
> RZ/G2L MIPI DSI TX bindings
>=20
> Hi Biju,
>=20
> On Fri, Jul 22, 2022 at 08:19:23PM +0100, Biju Das wrote:
> > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's.
> > It can operate in DSI mode, with up to four data lanes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3->v4:
> >  * No change.
> > v2->v3:
> >  * Added Rb tag from Geert and Laurent
> >  * Fixed the typo "Receive" -> "transmit"
> >  * Added accepible values for data-lanes
> >  * Sorted Header file in the example
> >  * Added SoC specific compaible along with generic one.
> > v1->v2:
> >  * Added full path for dsi-controller.yaml
> >  * Modeled DSI + D-PHY as single block and updated reg property
> >  * Fixed typo D_PHY->D-PHY
> >  * Updated description
> >  * Added interrupts and interrupt-names and updated the example
> > RFC->v1:
> >  * Added a ref to dsi-controller.yaml.
> > RFC:-
> >  *
> > ---
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 182
> > ++++++++++++++++++
> >  1 file changed, 182 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > new file mode 100644
> > index 000000000000..131d5b63ec4f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > +++ l
> > @@ -0,0 +1,182 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +
> > +title: Renesas RZ/G2L MIPI DSI Encoder
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  This binding describes the MIPI DSI encoder embedded in the Renesas
> > +  RZ/G2L alike family of SoC's. The encoder can operate in DSI mode,
> > +with
> > +  up to four data lanes.
> > +
> > +allOf:
> > +  - $ref: /schemas/display/dsi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> > +      - const: renesas,rzg2l-mipi-dsi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Sequence operation channel 0 interrupt
> > +      - description: Sequence operation channel 1 interrupt
> > +      - description: Video-Input operation channel 1 interrupt
> > +      - description: DSI Packet Receive interrupt
> > +      - description: DSI Fatal Error interrupt
> > +      - description: DSI D-PHY PPI interrupt
> > +      - description: Debug interrupt
> This is an awful lot of interrupts.
> Is this really individual interrupts or status bits in a single
> interrupt? If it is the latter then there should be only one interrupt
> defined.

It is individual interrupts.

As per the hw manual,  these interrupts have dedicated IRQ lines
as below.

dsi_int_seq0 174 SPI 142 IRQ 142 Level
dsi_int_seq1 175 SPI 143 IRQ 143 Level
dsi_int_vin1 176 SPI 144 IRQ 144 Level
dsi_int_rcv 177 SPI 145 IRQ 145 Level
dsi_int_ferr 178 SPI 146 IRQ 146 Level
dsi_int_ppi 179 SPI 147 IRQ 147 Level
dsi_int_debug 180 SPI 148 IRQ 148 Level

Cheers,
Biju
