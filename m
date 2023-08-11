Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995B778711
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 07:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3156710E654;
	Fri, 11 Aug 2023 05:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02C110E654
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 05:49:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idhQAw2bJgX2y+eTdES0ibMGv5zSZqQvSnJbGORlJ8rzPTwp1PDPi2QXNI18+T2uFQ6W/76xAxathnFp5jTbB6uhJXkuYiUwCRC2qF+pHbec1g2804jR/iHD/oBmxT5j8Oc9BD/IXgPXPOJFtVvnBf060OWHFxAmcYJEO191lMiF8klr3h3h1jFefCEWCTf6I6fjdZbVkT/Q36MZe6f0/gKYviWc1s/GXr9QIFWb5tjxrdwEd4sNNcRUrDTEgh58h5fSuQuV7UJ968ffdkqvP4XCHt3tQR+2ovEnqQpAOnoDC8Y/BkF21CxF6isWBhD6I8RweWxHBE9EHVeHEHRtzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=506X6y64s3KqdwjWcAr+rzZZefOpOQGYPwkVUz2HxL4=;
 b=avDm9tc65RtXFwUQ23Majg5bzV8IKGBdHSCBrOi+ZiigqQC9OQP0UQpOiGTfpeHv4w+iqJ6vGFw5fIZRg6dwy6TCqLVMA5N1dscLbMKA+GaBMX+/OiQmbhzptd29K4zv1Wmdhq5w1Dfc/SEivxnKrnHp2/ikz1WlicNGWIVHT1j1s2LiJMoqT2EPQ924ZVEx3d6oZFeXVSuiiX6EX5cjGmZjt/yVpFexeb2D6gZMfsnIZUWLdEZQpMj4MD8hBw/QOABhD5/x2AXcoiqodBKa418cwnc0JyXqh0NhrBMwpv3812RsUlVdMKgI5f4at2XulVPnE8A7sJTwmjvZRhIW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=506X6y64s3KqdwjWcAr+rzZZefOpOQGYPwkVUz2HxL4=;
 b=CQoZFhiwCl5LzaJMz8XGteeO13QZTjz+8uamIJHQKb5YGNCIpz3WikhaXzu3HCmGeWGmHYPg8DI3Mq1P1RQKbDeIMjKhLtSz2SnoksuVdiP1TpIIXBzkTpyxZv7cJ84i5JraML7jmnFPFtHwnZy8h+k3vJBBwyeks9i2IuPItHI=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB7079.eurprd04.prod.outlook.com (2603:10a6:20b:11d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 05:49:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 05:49:04 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Conor Dooley <conor@kernel.org>, =?iso-8859-1?Q?Guido_G=FCnther?=
 <guido.gunther@puri.sm>
Subject: RE: [PATCH] dt-bindings: mxsfb: Exclude i.MX8MQ from power-domains
 requirement
Thread-Topic: [PATCH] dt-bindings: mxsfb: Exclude i.MX8MQ from power-domains
 requirement
Thread-Index: AQHZwxWBRtjRdjXmIUGhn7S5iRfipK/Wx5iAgA00cYCAAKVY4A==
Date: Fri, 11 Aug 2023 05:49:04 +0000
Message-ID: <AM7PR04MB7046A5CD36B2A8B24B8F7CB09810A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230730184120.94984-1-david@ixit.cz>
 <ZMonFSqutQRqs61n@qwark.sigxcpu.org>
 <20230810-embroider-seduce-ee4506e7608b@spud>
In-Reply-To: <20230810-embroider-seduce-ee4506e7608b@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM7PR04MB7079:EE_
x-ms-office365-filtering-correlation-id: c3fdfa91-a7b9-452c-73ce-08db9a2eabf2
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9j6LHg/jdeEVEXsIO+/DoTVP52K65CgjP2kWyuwjW2/2t1/c7Gf7T/OAebp8l7cC/QIdojs/Nj756NCtow9VuwWpG4XaTfag+0iXyQRQXEkQuBMqNAe7lnOnVdG2e+uVxAENpt1twiPnNS09Qmt7haMl6bqp6jStOX6PbilfH8A9g3dpan+IRkacNQ061ZoSXozs4D8KYfthMS9OtY4cVeycEWxj55zLDBGE9VwVqpeC1wLvDFuKwjNT02CCM6GCPB4aXhCbVCktP571VQhQCPTrjR4qSdSo9n4yNODxy6uH9caCc9CYallxe4qNXR4sT28hHUJqd2BxjjWipo5RpLUL2vFAIOXFfwOCqngs4CVGySc4sRyc8aTm08TYwPvG7ddZb5zlsXfwoDSLPXeyQvc/xB9skhVbhOxY88eQKI6SWqUtvhKnx6SUMn9zXLKSQysh+Ztc0xZbHzGXDSbamG0tk/aqkc8pFcK7hPW/wAvKUgK2TjBRrnUbqiojreEEQxoABq091//rV3DHjPf2Qc9HbW7cXD1hOHcKMz89A4U/ifJqdEqFx8z5HJ3Z2Apc1oA0xKJDewRO2N8eQbx5AvQhCj62VC6uhW3FpFk6pVs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(136003)(346002)(39860400002)(186006)(1800799006)(451199021)(53546011)(6506007)(26005)(83380400001)(66574015)(2906002)(110136005)(54906003)(55016003)(38100700002)(7416002)(19627235002)(38070700005)(7696005)(52536014)(5660300002)(9686003)(316002)(966005)(478600001)(33656002)(8676002)(41300700001)(8936002)(86362001)(4326008)(122000001)(71200400001)(66476007)(66556008)(64756008)(76116006)(66446008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Psv415TBk6hCkGuWCDY3aj2c+zFKpTuycE3aYoxyLyB33uvLdTvUA356hN?=
 =?iso-8859-1?Q?77+wnxBWOdFbUm5q+fldr44yQ+StCeqCf/J78rp5TcmQgbEAoN/aNXkYbz?=
 =?iso-8859-1?Q?KP4E0qaXB0AVFo573whHvRB+ooQCUM5Yin9n4RO+M9QSYJQXEu4VXydZ5P?=
 =?iso-8859-1?Q?+r6kEthMqSjbw7EADKkRWVvXmQ01laZdZziR3Jjy8ZezknSycxIpuNn8//?=
 =?iso-8859-1?Q?EJaE5oB/lHF8pP/eyr0c3StoOc/hdWXAjPPGq+36vlSUgHs4DpxLCJ+RzW?=
 =?iso-8859-1?Q?ZmdEwOowMJJJGdqItWt/mfNvUHlSRxVY4wiFXiErLvIXi2JBCNjMF7jJLY?=
 =?iso-8859-1?Q?yhny8KWMnj39/aeaMh/aYAAKjF2eGAfJqNbKYFILflpUQbz+Cz5YID/qOc?=
 =?iso-8859-1?Q?FvEUwRm80LrekUicXWyCWlDHmQk69bAwA8xGeRgjcqcDs2pnyLuIx1hC/I?=
 =?iso-8859-1?Q?8Nqn7jKAP1QZdNcJX2Vp1vSCV1imUNbQaIAtzhsG4byUH6tcpUMbHdbD2c?=
 =?iso-8859-1?Q?p/ePfZc6TpO9IxQIycwesHTz0NBf3CYd+apMVdDxwUqVxnl1ic2eo+An8M?=
 =?iso-8859-1?Q?0rLdtllO9s7lhH/fIMj5os/I4qt/MlQFEnmixRBRP/tezVs6tltKCxEic5?=
 =?iso-8859-1?Q?iPPiNGXo6veUtntAitagzsxJgAGuLWgFRxAV2dyaJYQ2OMwXUVYDKxtdz9?=
 =?iso-8859-1?Q?gcZNSHxEXpHBHjcxaIkr9CmfHwB3RjwSCfOJ8kn5KzAI3VlVmVY+/9d+yQ?=
 =?iso-8859-1?Q?TscZ0hAuuAyyYul/xz4sRPJqbEFIVipgSrBL2dCntFf/sFGYfXiI97pGSB?=
 =?iso-8859-1?Q?7NyfVS5MEtbktuKNcyL4z9kkjKkSXe4gq9Bj6r3BIwyjg/SpqebkJbKCf7?=
 =?iso-8859-1?Q?oMBEMddhaB4iUo0N8ZLpWUjwDQshOnYmT+2bxs5+fE0JcGijg7+RLt3ZJm?=
 =?iso-8859-1?Q?gCA/cI49wKbPF1+iLI8pQe5VI89/fSCXFMzydIsWDzceLyPKH5kCINh475?=
 =?iso-8859-1?Q?aIFTevjJhCNWr33PIWPAsoIdIPR8X0vp7IqirkWn4f8He6nwcuLPkHfKcd?=
 =?iso-8859-1?Q?hD48phq6wr+L0mVWqVZAE7KwWC8DUlVKY5wYTN0iPy+nRU13VaipwxEaux?=
 =?iso-8859-1?Q?JIW2qPhVv7QPQAxTKERjZshNAS0+70BGyHdKnPAoLrqh2rer6Guwaol4ci?=
 =?iso-8859-1?Q?ywE5fyeh3VNVt/X7YLVqcZk2rFx8KaSeLDyZpcl3IQpA+n1xT59QmzWgUP?=
 =?iso-8859-1?Q?iXf9CHg94rYIoYMu42xu3qceBGQltxRKQJEnsiT2lPerHuK+BSvSTtmMNz?=
 =?iso-8859-1?Q?gv8fcEoZShz0IxQM/lvgTgM8qppeQUFVVgbFVRAF0PeicYj2pOAIgjfMm+?=
 =?iso-8859-1?Q?F3xn4j54XKCT4S92m24Tr1AlNYigK69FB0SydBJ86fkS4dPboAELD6wcFB?=
 =?iso-8859-1?Q?WtfxcjAWaGJwh6MYdX07N6SPnerVe5YkFq7W3CuzopXrtoSngAl1yIQKjH?=
 =?iso-8859-1?Q?ZmhulBYQDmKCok8r08hOw++FjDk/R4WG4lrpmDg9Q3jKaKN+QfbMcmXjh3?=
 =?iso-8859-1?Q?DjImI5K34489VNvkHW52kBJWNXIruh+VdISUhuMTRLh3f5c8v+yDnEFs2Y?=
 =?iso-8859-1?Q?LLfF12JFUcTkM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fdfa91-a7b9-452c-73ce-08db9a2eabf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 05:49:04.6768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6qZQZnmPLH8uWT8xDUMoFjSmbTo3iosbpSUqcY4AJCKBHpYZ4XyXCM+DokoNDGiK7PTOl5dCRu9a9rPbEflhdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7079
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
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
 "kernel@puri.sm" <kernel@puri.sm>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, August 11, 2023 3:30 AM Conor Dooley <conor@kernel.org> wrote:
>=20
> On Wed, Aug 02, 2023 at 11:51:17AM +0200, Guido G=FCnther wrote:
> > Hi,
> > On Sun, Jul 30, 2023 at 09:41:20PM +0300, David Heidelberg wrote:
> > > i.MX8MQ uses as secondary compatible fsl,imx6sx-lcdif, which triggers
> > > requirement of power-domains, thou it's not required.
> > >
> > > Fixes: f62678a77d58 ("dt-bindings: mxsfb: Document
> i.MX8M/i.MX6SX/i.MX6SL power-domains property")
> > >
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >  .../devicetree/bindings/display/fsl,lcdif.yaml        | 11 +++++++++=
--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > index fc11ab5fc465..2d868276b0f9 100644
> > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > @@ -129,8 +129,15 @@ allOf:
> > >                - fsl,imx8mp-lcdif
> > >                - fsl,imx93-lcdif
> > >      then:
> > > -      required:
> > > -        - power-domains
> > > +      if:
> > > +        properties:
> > > +          compatible:
> > > +            not:
> > > +              contains:
> > > +                const: fsl,imx8mq-lcdif
> > > +      then:
> > > +        required:
> > > +          - power-domains
> >
> > We currently enable the mipi power domain for the mipi dphy and nwl
> > bridge only but not for LCDIF itself assuming it's not needed (as there=
's
> > other outputs LCDIF can drive). I *think* this is correct but maybe
> > Marek or Liu can confirm?
>=20
> I'm happy to Ack this, but I've been sitting on it waiting to see if
> Marek or Liu popped up..

I see DCSS and HDMI controller/PHY sit in displaymix in a system
bus diagram(internal only), but LCDIF and MIPI DSI controller/PHY
are not in that mix.  So, it seems that the "gpc_disp" power domain
defined in imx8mq.dtsi supplies power for DCSS and HDMI
controller/PHY only, though nxp,imx8mq-dcss.yaml doesn't even
allow a "power-domains" property...

Assuming that system bus diagram is correct and "gpc_disp" power domain
does supply power for everything in displaymix only:
Reviewed-by: Liu Ying <victor.liu@nxp.com>

P.s., there are still a few warnings from dtbs-check, see build log[1].
Hope they can be addressed...

[1] https://gitlab.com/robherring/dt-review-ci/-/jobs/4767324570/artifacts/=
raw/build-dtbs-1814673.log

Liu Ying
