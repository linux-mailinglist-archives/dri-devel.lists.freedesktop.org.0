Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5A496C05
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 12:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86A510E15A;
	Sat, 22 Jan 2022 11:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2293C10E139
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 11:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7ohXkYEa/sdA1PGIWhXfUw1/vo/75xwrWx0eb2xWWrtVwc/9TAgBHvBxd2skO8qUYZiTQ/mLPZY6P2Y1YoFxqyHIVQsKqFoePEoksmTIucfrFWEcFWezPV9AAwpeYv64Lox3fd9P0k89b9kOrICu0ZeVCE7aN39AbE9AFjG7WQrZ3EfYQQyKZUOo1BeYU79uHig4bHcDjrpcyPr205DjIJjaNkLDbKxE3q1cVMQa96BCj1mAnUnRuw1jNf4TfnskvYRgTOqcvqnc3OqPzstV+tfAK05j8J1pgoraR3IWQyb4V5YRFy2KHP3tCOUdQrNgpfeK9QMgUXrpo94ute7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDfi4wJrZXCRrwO2o6K6xZY2IwN5sm8jNPEvs5Yfk9A=;
 b=S6EQ68LOhEvKZEWmZzqPtSugHbFDHSUDX0m77Jia0ezjQxOo1TFd82YZ6fe/5BxoHzWZSb9PEr1aqAmbblPxrSor50EyYULn7geiy9to4bZkAU1JMvujNg9WYtHC/fm2uPfz65JNK9MlMrifdn/gFLa664gvu8ffUszSmKr8cB1brSN6brOCS+VvsLbXbztWhs+mjQDjD6m/oeHG8oAsk9378IovFJuTp5i/+FfUbBTYanyEL0CqjuKyz8ES4LnTGV6giVUNM2FyMBuuwXzlr32ceDf8JUkSEjFFBzC64wgQ6QfGE7cuE1r+DiZnDw1VbwsFCCgb0QQLZoO9bP0fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDfi4wJrZXCRrwO2o6K6xZY2IwN5sm8jNPEvs5Yfk9A=;
 b=h8h8fLHzbZN+f68v/w05g3vO0yl7jgwThpo7wjTeagVeu1wsRWkYrZV3UsBOo1Yafg5wCXoIGZoNk8fx92JRik4wUxmNwfmXJW7YelLZ8NrZDT/xcBJWpZs7RtLbN1rEg05bqijHRvBqQNicQrQvjOJqM/6tUoZ1J26WcrPrL1U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2881.jpnprd01.prod.outlook.com (2603:1096:603:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Sat, 22 Jan
 2022 11:20:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4909.014; Sat, 22 Jan 2022
 11:20:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [RFC 17/28] dt-bindings: display: renesas, du: Document r9a07g044l
 bindings
Thread-Topic: [RFC 17/28] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Thread-Index: AQHYB9xp8SCjAxKLh0iOfG0cgwtg3axuR4EAgACsnSA=
Date: Sat, 22 Jan 2022 11:20:20 +0000
Message-ID: <OS0PR01MB59223A6E2E245147B69F58A1865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-18-biju.das.jz@bp.renesas.com>
 <YetXdDHGnHDV2LSM@robh.at.kernel.org>
In-Reply-To: <YetXdDHGnHDV2LSM@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc6eb338-7ed4-4859-0c12-08d9dd992d1b
x-ms-traffictypediagnostic: OSAPR01MB2881:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2881613394BD67547617FED6865C9@OSAPR01MB2881.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 78fVV59FLxPUIc9p5ixle5N/Kt/08fENmmqgkBAkSbtjk2pEnEJ2TzDaJ2AQRu/GouXUYjxlGOsOYz5WOmvYNiWgkELyBH4c1IxVX9yN+vdh20F8KaLlgkWQnBz/1UxqxXwceOZrXSF6PzKXjJNJ5kK3MeMFLo6hEgRwzZQQnRES+N0wbkMJ4IA44deiyGI5eIB09JdquBsilphUln5RI5SgGxK4CXJPa9+kUOVYH2iuI3JbxhbcVDLY21ZOdcuiryRTQ7tXfG3qsYLxhnoxReSoGXh42OnrrU32QorlflQB+ukYP1oG9RDMcgYTYwgwwp/s2Rq7mRzsl5c+Xwdb2+/e0Cyp4Tvj7a9JW/K9Bu7RERQ9jy7vRz8iA3Qmc0yyYZcmNl7xCeIPZYqK3947PG9/dxdvvfkvZZQjZ19MCX9AC/trv7dFm0fy0o48JsyZbszhWVt0hXpCEcb6o7Nj1Mj/pKIEnOVlde5cQKd7DuXlom6oza/MvsTvGxtlxeSCoiAmcG/EAF+d/77FX7gx85F5siOosmIW2/PY/448DYRO5LteAd+K7x9H4/TltQYueWy/nCrSo77caKFtUkCTJRq8dzUgAU8tKxVXQUYZFzDcx4OHzhL+Ak2NgrrFn2kLibrT5TRZ4PauC2qaJUyvEBF4Wqr2QIb4cQ8llPIbcwkUX7imA0ZKFppFf93G3HYTL7+cSX7oKMDROBEE75MDsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(8676002)(54906003)(6916009)(66476007)(66446008)(66556008)(66946007)(64756008)(8936002)(76116006)(2906002)(122000001)(71200400001)(316002)(38100700002)(55016003)(107886003)(6506007)(4326008)(52536014)(83380400001)(86362001)(33656002)(186003)(26005)(7696005)(508600001)(5660300002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ahRO2+C2AKDj8htbsY0F908x07HHEmB3bJwI616bRJ9lT6w6fr6xCPys20EQ?=
 =?us-ascii?Q?XRk+J2Eh0hi17GU00xvNWyDablVf3ezyiaFKWS9OxsVI+yCXlLZvCKmu/5Py?=
 =?us-ascii?Q?QPyC01HRzSCr8ThCiLWcyRhvPFEyErx7XPKAbwJ2+WsxgaMfgwhZnTt39XL1?=
 =?us-ascii?Q?diw/pES3NKHq+ahRJ2nMPmTCNfKc0fCTJclzI/5piudzTR/2gHxg541FwlW3?=
 =?us-ascii?Q?vt+UydbeHw8AORw4EcS1+JA6agY5ozz+S2388T+wXCDTC7y2GRaSeFJ6fl8Z?=
 =?us-ascii?Q?VnvewZjIkaBvqA764kZkeKodKL9AotF2CnbYSqmDawSqO1CCt9kC54uPKqgJ?=
 =?us-ascii?Q?2bcyyvqg5lh609S1njiMB4EqYJQTcnfSl+ivmArr/cOFkq4StcLcQSdr4xn4?=
 =?us-ascii?Q?o1gguKdKQIH8esEYqg8ply3NTj7Nj4jndVv6kFpqt1GNrqw3byraBoEpBS3H?=
 =?us-ascii?Q?gjgonlasXiLabdku5RoWPD8Dpp+i9DkaoFe/kPcE9PBwWoXzNqYDJ8xMvOgN?=
 =?us-ascii?Q?3l1rhxwknsbvxquctAMYSPTE9jznl/UXwbRee/EG1LOF1z9mfZiXw+Aawuf4?=
 =?us-ascii?Q?NfwUNWgvxNjEBy0eNt3RcqDKKxgSZll5jRxmVwD1bD1fHjxFql0t6qHEd6xO?=
 =?us-ascii?Q?wz55+SvXNXY8z6GmOV4nItFt00vtQXHkYbvApAkkffFx3lm8DuSw5Dimaitx?=
 =?us-ascii?Q?6/IIvsig+vq5MubuhnGi0D56AdxvfO2Hs0pBtiY7NCKEJhO+hY2DulUGCRbM?=
 =?us-ascii?Q?P7ovx1qAu0mq0Fxc/sl6BezGHQamZFc1DqK7bmcbrrbAv69+KJZ9ftboZcoZ?=
 =?us-ascii?Q?YrqbWP0Ip7Z+H0BUeWoK6E2InRTacN4tSg+u5JHvfNIoExErlTaf2SSmgRCo?=
 =?us-ascii?Q?bxNbflX3Kbex4plcSwzEx+zhkMdq7dCvk9J3FIbVkrHxtId9iRTP0QH9f0uB?=
 =?us-ascii?Q?zNdh9dbmPbkxJMoxggslmL/6d+4o+ctZBumGjOQbD7Zx2gzzMW0SWHINCJSD?=
 =?us-ascii?Q?41rGQLqyLtzpakkLC5UErx8alYZauTxQLYiNtiDAyWO6g9W3sFIRarF+zR14?=
 =?us-ascii?Q?JRKZECztRgBskfsmM5Zyu348yQlOP3x4kP8pxrqhwKw5NR9kwhKpONTTfaDU?=
 =?us-ascii?Q?gcUQNZkNEDW3Tze3wFh3ebdJqtiLgsaj8PD9UJ1y7riU9+ol6CZ3YTWJFkqi?=
 =?us-ascii?Q?/cLFk+aVTfOtjS/nfX+NpO7oKXRudwcDAkjLRZAXNExWGCidEckaoOINPObn?=
 =?us-ascii?Q?hhw1UmjxK19sWuWiuBI3agT1gmLdk6ux4pi+C6+EdlSs4xD2cOt5bDSO+GDP?=
 =?us-ascii?Q?2mCUmy22+UQkKJLWooUWxGByhddq0kuFHVJ8qiqfwqVecCFvt84Gc7UVKlAB?=
 =?us-ascii?Q?sA3/Dz0e+0AAt7FspH79ONsZyH6E4wG4lPEp02gfPhEzhlgIXuwT3TXKv431?=
 =?us-ascii?Q?5RSvOdGYRcxmbyGY3jBgqRg10wFRQAxTyhv9mSBKeF76OSqASuF1Ejal/RGd?=
 =?us-ascii?Q?RrO6Nl9HZGoiYd+KDdwpbshIs/yqBuzaZPf/LnplfTAxcYi715fYg6217jHR?=
 =?us-ascii?Q?gbamMRHYYQFMfsZdYX8/8ARWHxyJgBW81qZqJp5ED2N8GC1Qk2Ps5SPpASTE?=
 =?us-ascii?Q?+IITO+7bmtZMoBdZIlHiFGBBmy0qG7F/D4dXIWSQPTPBwggcCGGZ2XSrm9Yy?=
 =?us-ascii?Q?nHsCGg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6eb338-7ed4-4859-0c12-08d9dd992d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2022 11:20:20.5336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qzPzJ6PCLLf33oYNuq3mq8U4Z4kZDLfqoOIwxCJz/vLBarNu5U+rbRKKSJtTOEQ/v7btAKhwbrCGCdSaGpTHaxVxVNzrEppWUXZMv6RWv/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2881
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the feedback.

> Subject: Re: [RFC 17/28] dt-bindings: display: renesas,du: Document
> r9a07g044l bindings
>=20
> On Wed, Jan 12, 2022 at 05:46:01PM +0000, Biju Das wrote:
> > Extend the Renesas DU display bindings to support the r9a07g044l RZ/G2L=
.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml
> b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index 13efea574584..fc050b1088f3 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -40,6 +40,7 @@ properties:
> >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> >        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
> >
> >    reg:
> >      maxItems: 1
> > @@ -824,6 +825,59 @@ allOf:
> >          - reset-names
> >          - renesas,vsps
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r9a07g044l
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: LCDC Main clock
> > +            - description: LCDC Register Access Clock
> > +            - description: LCDC Video Clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: du.0
> > +            - const: pclk
> > +            - const: vclk
> > +
> > +        interrupts:
> > +          maxItems: 1
> > +
> > +        resets:
> > +          maxItems: 1
> > +
> > +        reset-names:
> > +          items:
> > +            - const: du.0
> > +
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DPAD 0
> > +            port@1:
> > +              description: DSI 0
> > +            port@2: false
> > +            port@3: false
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +        renesas,vsps:
> > +          minItems: 1
>=20
> The minimum number of items is 1 by default if not otherwise specified.
>=20
> maxItems: 1 ???

Agreed, I should use maxItems: 1

Regards,
Biju

>=20
> > +
> > +      required:
> > +        - clock-names
> > +        - interrupts
> > +        - resets
> > +        - reset-names
> > +        - renesas,vsps
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.17.1
> >
> >
