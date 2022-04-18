Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29A505EB8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 21:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023F10E19F;
	Mon, 18 Apr 2022 19:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867B010E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 19:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbHlL3yrdX6NkxsE8ua6R3BTlHC8IZK9Y1S+CFJC19t8ldGXi9udV+DKzsYr8aNwwqvXeT90pE4Lonc+WevWMsHK6GVt4Ux6yaWHhxwPUmiIfxHVFVgtk0UBxBwDISbjrofZlfMZ1NvyPKwd290GQiK+WaqE79J1obE/f+YfIMjEFoz0zNJAsVkbAVOYYle6Mk+1cnKJdPI4lJ3nru2Zu7QCpPJJoVVS+6XOsFJ1neWhmjoyWq7SnYqK47j8Uf3NS+T0c6yxYFR9mp8jzisB+CTTC1jz6wSYubZIr4KfYz08P6EJxiNUYiAsImTqoYFVkWfKZBfME1DuvGCaMXeG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPNE1xDljIVmhV7G5mBZ/P8g1j28SUJKW5HN0GSq3GE=;
 b=kAMw8i2gr3C25d2hZlBOaS0sPdhF/NbG4spSDdRQGnnZ7H4cigYrTXb6ztLOyyOVcFxXy4TEIzb+8k981d6TTUMpWDcB2q7c+rM6D62tsl84JBVMouboPx6peUPhnePzOgfBaofXe+nD5VTs7uvxevcz+zhS6pYbs/OMksFIjnUGw+iNfM1TwbWaa1EC2UNEm0PwlNrk5l4ZuX1vVcH5ZjWxzFm88Svo6sn0D75kvzT1uxA80VrrRDknPrhaLtrHrbFBX79/IZ57EZNwpz8GFJgS/GdXhNMZm1kLOK1s5wNcBWuODrUriQdJ0vLfc6MVWTtWDZ/9GVAwHBjlfRkR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPNE1xDljIVmhV7G5mBZ/P8g1j28SUJKW5HN0GSq3GE=;
 b=nKD8ie/VAFbOWINkyuC6UQbFgzFOzK1JbZp1NyollqOOrp4NY27LXWGpho4qzzxWAbAclW3hMtPC72BUuZ0W/HfdrGRRvWuzi8/K1Xe2jRX88pNldWQndInyhNgq3UIUycU/cMcccsf59UQC9lFC8N+axPiGBR/sHFbm5WwP1FQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB2891.jpnprd01.prod.outlook.com (2603:1096:404:6b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 19:48:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 19:48:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L
 MIPI DSI TX bindings
Thread-Index: AQHYQnADgNCsAhZFrEWrZICvhJcRYazw3vqAgAVWCYA=
Date: Mon, 18 Apr 2022 19:48:37 +0000
Message-ID: <OS0PR01MB5922CAA263CF754EF06381AE86F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
 <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
 <YllGFRx3RZjJliTS@pendragon.ideasonboard.com>
In-Reply-To: <YllGFRx3RZjJliTS@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a2f7f1e-8272-44ef-c163-08da21746e41
x-ms-traffictypediagnostic: TY2PR01MB2891:EE_
x-microsoft-antispam-prvs: <TY2PR01MB289113526C7F49576B4DAA0286F39@TY2PR01MB2891.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aC1jtHH7ozpLD8Vk6d6oxwlJBliLa+7B22cPOX+NjwOuaNXit4MASgB/1P5tlZ2TcQbJsCzONDTLGHxbTG3bpRwaRTNljGb1TceZI7DRWWb49/yQv+gt/bTxwgWjmPE6Ie7NyHBOclk5qnUOENQ5VUvN9t52ATdydlM1a8Dt82DjIWheVRNM8qkjOqyom2P5kOUXzw6cTSAC8nkrKbk66gzeEeLpRZjEKbfBOUPEtV0Gk0N+Cxut93NVq2RRBzpkUreqDLbUunYI3bZfcooRqI5YxpoGtNSiuiT31iHk8xkAh8AOCj/EbE5h2r110IAwf4/4NZtFhYnERGmoEtslQmm075C+xMDCLhKEauzwfxUFCPDaeAZRpSvtsdbA1ILHZRp676sYCzWB9u+tRzlMNoNiHf9dJGtxBNCg6PO0O1WWvfzFheV1lqyGut905aLkU78O7tu5beBCYd+5eenuMZ++CMdylhEQhRJRyk1r/3KrBlnK8L2baBRDqlEGatjbOW+rVIlV+QajhlmzNpaR3pFr3jS3bRxlq+zheQDVM8E6yFo3+q+nR+pao/nARU0cD6U8Kc+8xTx/bp8rOpSSgyY/SFlAcKNsrrkh88HgU9AgkmygBqBIMhBllpqXysdYzBsIcF/0428RvxcVHYrTIvO9t/AG0JAsni6E0aAt0WO5RnkYuZ15/a+B3kuAgPw5UpLnuCI2Uhi2EqNGYoqV+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(71200400001)(4326008)(186003)(8936002)(86362001)(55016003)(83380400001)(6506007)(7696005)(9686003)(26005)(508600001)(52536014)(33656002)(122000001)(66476007)(76116006)(66946007)(66556008)(5660300002)(316002)(66446008)(8676002)(64756008)(38070700005)(38100700002)(54906003)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cRQYF9WkUJSZtkSkjEz8UKPdnGXskN5lujtvK0B3n5ThNksIfg1XL+SuPWfG?=
 =?us-ascii?Q?1jPto3rtVdu6KqtDwD67REt0sDrhnO4HnKmH2+A5BH4n/hAu0i/eC6cvPic+?=
 =?us-ascii?Q?R+qyDjgj4uJXkOsDZMkmoqIZqczWRBUHGQKlyrS3294/fVWuKK6C6dFXZE/K?=
 =?us-ascii?Q?Z5pCoCM8+dbtA03scMf91F0dTy/2KZ21ujNIYYNOZt9MOMxrowBUkUEapiIu?=
 =?us-ascii?Q?ofYzNRHV3TpeaB+x2wc/iSRGuO3Bbpg5fKpGDwTYJqLJDITh8b2/jImMnWGm?=
 =?us-ascii?Q?pThDQEbQjL96qda/2ZWU/XoBSCh7YVamZiUyMHl1fuciVAQB3svCBYFhNsjR?=
 =?us-ascii?Q?EH+IIhNeUwKMK/aIef4QUXxKt1USe5r/vfB+iDUCbYmo4cFDvCKV2whqWxV0?=
 =?us-ascii?Q?FI8E/tg/9aO8bGHVAt31IxsPocEVC8w8Fa/GjLkzCEskRaeKOXIMuq5Zrlzu?=
 =?us-ascii?Q?tRfphyrX1klVWXhY087sSZtJ6pPqVQsVee0JSp6c7FS4ZW79PO8vmynwfCf/?=
 =?us-ascii?Q?wltkUO8GRL5mLzMlDXh3Ihss0IpZdEv8fhooMKt7aQI5YH3nVjQgzDaP7+60?=
 =?us-ascii?Q?jI6Oeqdfo/po9Ivt1QfwDv1s1gxbMP6h1p3XocmzfYdfLVl/VDUJkfnKg59/?=
 =?us-ascii?Q?f7GbxkFMwrCEG+ObHEW2bjgsQOHDkz9Wp2DdQG3PzMT3DcRZMspbfPwA8QmU?=
 =?us-ascii?Q?sJiiaeTmjKuSiVEYyfNfMQBsO30YX25LxR1YMEfJJ/uCWiAMvN29N3Hayj37?=
 =?us-ascii?Q?XpLp6+z2z2QM7S9dM3AY+hNmBjSVdovTZcadZhMKcP6Uhkpk/yeRbz+joHzG?=
 =?us-ascii?Q?Z5Fox/AFsTqDNttxc9pu1jv5QTKHUW16PxwwrZrzQ90OMuiP9I7xfge+xdRQ?=
 =?us-ascii?Q?8Wd20r1brQZlNKM5O9eoQtRIuV9aElshUdOMn4MlI3BXHdw1mEWKfjRpnanj?=
 =?us-ascii?Q?jBydo7DbvAICruw0e16UbNikE+oBBNVHpC4uqs/hfodyVrJGgBCfPTm3kSC0?=
 =?us-ascii?Q?ibS+gtjfmb3oVNRAgf6bCptMnfqSSfmkAZ7vAOc/3cUsMaKswgJvXQNxkqDw?=
 =?us-ascii?Q?0x+zX0KQ7xCzvTx/gOJ6Ez11vLeNW9fSMyhBZqJJZ07nJotTcyZJF6Tbf/Cp?=
 =?us-ascii?Q?eDTJypgiMG5xDxDrlgzqh7bnvz8lHJ/GPy0aO6WGLgBeMcUfXx5aPuAbqWAb?=
 =?us-ascii?Q?LFY3SR2mtZKVYwo9GwA9f+eFduz9dEGYVNNqp13G8jCLWX0diozI+6YuRMtu?=
 =?us-ascii?Q?7SXysqDU9tWAe/N6mtO19dSLh2j9wpPafXLa274sslOR9APq2qv35r/x3Sne?=
 =?us-ascii?Q?7WN4PHf58uFi3JmWLH3bColor19gpNdw1AMzRc/U4eo0s1R2ddjPop/5ijy3?=
 =?us-ascii?Q?42cYmH0F7sAnD3McIF1mgafg+QXGR1hGcKFWykaDu96mniteUWRyQNOQSvt/?=
 =?us-ascii?Q?rXPQSDJJ0LePjfhVYS1Qnpliw30JwezXM6zZTGSX+LDCY/idzGNfp0icOlnq?=
 =?us-ascii?Q?z5MMKMFq8dynm3yMaOu9sn14RS0aNce+NE0qtIpHv33ZZ07W9DOFWPoFlzta?=
 =?us-ascii?Q?mRwssLK9VZVYDgladJkbo/AsvLAQ/wRjoXppllP3Zz92Nnvy6uawPKN9xAV7?=
 =?us-ascii?Q?/azbT3EZr2OI+1FLqq42FI7VU7mXa//qNYJ7XzdrlvwS4lBWCf/fF0QJcIQj?=
 =?us-ascii?Q?8fv35AR6k9Z41eFaSVyyp/KIoSmftr0rS8djA4jg/sJGmRpf+JBkSaRLVFXd?=
 =?us-ascii?Q?gf2ZHQ2tmKc1xi3IPuYDKGF/cJyrwGk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2f7f1e-8272-44ef-c163-08da21746e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 19:48:37.5447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWFM/Q1QRPs3jLyF2xhZieGlh3z/5WJhbS+YtfOW6CUW7KOxKRTxsIHdFZZEyy4kX1OTUi4wUKz7qZTuN2/NGdTc4etnRsjLcHwJVhVX5fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2891
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
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L
> MIPI DSI TX bindings
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Mon, Mar 28, 2022 at 07:49:30AM +0100, Biju Das wrote:
> > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's.
> > It can operate in DSI mode, with up to four data lanes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
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
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 175
> > ++++++++++++++++++
> >  1 file changed, 175 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > new file mode 100644
> > index 000000000000..eebbf617c484
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > +++ l
> > @@ -0,0 +1,175 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> >
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
> > +    enum:
> > +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
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
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: seq0
> > +      - const: seq1
> > +      - const: vin1
> > +      - const: rcv
> > +      - const: ferr
> > +      - const: ppi
> > +      - const: debug
> > +
> > +  clocks:
> > +    items:
> > +      - description: DSI D-PHY PLL multiplied clock
> > +      - description: DSI D-PHY system clock
> > +      - description: DSI AXI bus clock
> > +      - description: DSI Register access clock
> > +      - description: DSI Video clock
> > +      - description: DSI D-PHY Escape mode Receive clock
>=20
> Isn't this the escape mode *transmit* clock ?

Yep, There is a mismatch between clk document and hardware manual.=20
I have reported this issue to HW team for fixing the clk document.

>=20
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pllclk
> > +      - const: sysclk
> > +      - const: aclk
> > +      - const: pclk
> > +      - const: vclk
> > +      - const: lpclk
> > +
> > +  resets:
> > +    items:
> > +      - description: MIPI_DSI_CMN_RSTB
> > +      - description: MIPI_DSI_ARESET_N
> > +      - description: MIPI_DSI_PRESET_N
> > +
> > +  reset-names:
> > +    items:
> > +      - const: rst
> > +      - const: arst
> > +      - const: prst
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel input port
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: DSI output port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
>=20
> You should specify the acceptable values, especially given that the
> hardware doesn't seem to support lane reordering.

OK.

>=20
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
>=20
> Could you please swap those two lines to get them sorted alphabetically ?

OK.

Cheers,
Biju

>=20
> With these comments addressed,
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > +
> > +    dsi0: dsi@10850000 {
> > +        compatible =3D "renesas,rzg2l-mipi-dsi";
> > +        reg =3D <0x10850000 0x20000>;
> > +        interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names =3D "seq0", "seq1", "vin1", "rcv",
> > +                          "ferr", "ppi", "debug";
> > +        clocks =3D <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
> > +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
> > +        clock-names =3D "pllclk", "sysclk", "aclk", "pclk", "vclk",
> "lpclk";
> > +        resets =3D <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
> > +                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
> > +                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
> > +        reset-names =3D "rst", "arst", "prst";
> > +        power-domains =3D <&cpg>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                dsi0_in: endpoint {
> > +                    remote-endpoint =3D <&du_out_dsi0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                dsi0_out: endpoint {
> > +                    data-lanes =3D <1 2 3 4>;
> > +                    remote-endpoint =3D <&adv7535_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
>=20
> --
> Regards,
>=20
> Laurent Pinchart
