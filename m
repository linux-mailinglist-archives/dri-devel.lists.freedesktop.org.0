Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10379784ED8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 04:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0542510E072;
	Wed, 23 Aug 2023 02:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789C810E072
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 02:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1SrSMmlYXePVKTQviVFqHtVvdSx+YZTxr/fKC81EXF5qOW1Skfpgy2vHBDBRqgrkBoAh3FTWx2IfROuXlOUylrMYWRMNnxq2SxWRA7blE2Ieb3lrrOWIXjdzBzXVSeYbpqugwo3a+Fm4vVGlhgz7apn+tRFSLVc4rhuZuYfnrO+THKW1GLatE5et8Khks/m0yeFAvWEiBB38IvBNmRzWt0WIlYY1uCaBkSv8SNioDeeiEHYq9uRJI21uUe5rF5jjjwBWU5yZrzkD9p/OGUEGnsCicHu8HayJ1mZm9CkFYsSu3YHCvdRBV2H4VIDe/F/C2j7jcrOGZqEc6T21ibi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mMqiVUknUX1+e8bWDwZy04pS0xJUtmQrLi9Aojn0C0=;
 b=K+hWXnI6Xs3fR0PY9KWL4B3AVOVzQutQ+GCSkYgX/gzq61NB0i3Bb7YY+dYlHNWwR8g1epR8K6/JrakgcNt/3kPpaLGdWWDtFsZyQlqHLJ+vvKCGLoqC4PaXZjn+X3RVYk0B9bbwCYEW2Pecmy983yoxaNLhDx1lEQxb0T3+9l9N1rysj5ZuL3EBoFVzFWp310ZuW7vAKMUMdOUE8WaTPM/vdgKGWPKYttJ9npbDWD3R/27fGvyXuY8jy/H7uEflRRi4pmmMkLZedcOooSovbUN4PC0EvgOXYqWX8tJ2TU/jVl85QANPA5u9xS4fcVpSZxSUjPaAKeYNKzq61Ye3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mMqiVUknUX1+e8bWDwZy04pS0xJUtmQrLi9Aojn0C0=;
 b=EdSlYic4ZgLy1bpRSpwxAnOIrx+j04ZT2SBwiDQUNGx21wWjo979ubgE54muMqCINkC0WXFULZbGRipHotfRbuz3Q/oWSqqcyWOsYkZP3zSAe1Glned8pbh1jb2P2zDpuScYpMulZemoeABp1h158V2WwzTJ2FgErbbzldYnqMg=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7587.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 02:45:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 02:45:54 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm
 DPU binding
Thread-Topic: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add
 i.MX8qxp/qm DPU binding
Thread-Index: AQHZ1NZxpKDHNQbjgEiILz/ou3qvwa/2MuwAgADviPA=
Date: Wed, 23 Aug 2023 02:45:53 +0000
Message-ID: <AM7PR04MB70469E94D5FCFC46F51A72F3981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-2-victor.liu@nxp.com>
 <scbtbu4cdjlsmbr6ugkpqslvfywidvbuqyekxuttfe4rmbp2st@lev2zfqe4h62>
In-Reply-To: <scbtbu4cdjlsmbr6ugkpqslvfywidvbuqyekxuttfe4rmbp2st@lev2zfqe4h62>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB7587:EE_
x-ms-office365-filtering-correlation-id: 06f9eb1d-82c3-4b5a-779c-08dba38311e3
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qt4JGIyKhjvu3jX2FrLT04jwZyIvZSAfC7Apq4LSfjNttLhTybU6Q8nQICR6GB5UumLQY6usE7HQ5GJoDG8tHsVRx4UFL7yFuhPetJehiRWj1Fn9V9i6kb27g+kP3F/PtsNj76nD5t9+yFPExJIUh97bvFIi0PpX1ybvXB+H50oGB7cExhM49FhvgQ1+mOwc1U/32a+a5klXhCqtczl+ZtcAstkVR1v8WQYL94zdFooHMPI9qgVBi7ufu4jxCDmJMpiBfV6W/zo402o0fKhtpRZWdfO9ucIYXDsitf9TuOYaNPGWVLuY+tCu1QrO//ZW3E03U2A+4hITtOicOLKuOjSVncXwXpDCNXj9OoB5Za3uuGs5/TmOT6h6OGOIMgx3Y/4CWMXdjSJNvHYh9LcdnnM5Sod7xpJzdnF28FFtQ+mrW0e2tQTv08kj7tas0yaacLYfGZe8o8EApFDgdA7eFmX7SAwtEcTdeW3RK/e2AXPm0EARNFoPO+iq/0Vzi/glRU7qX7earCstG5EdMoFim8X1gQrlWtNLZxCRI9VU73PEYRzXHsWfTLorGOp4yl8KF5LVLPOtsccGmt0ll0ym5OIy73npIAlpRek4M5V3OHkUN66miBkKw84T0h2RlymaLPG18K3grPpxva4gDNSnJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199024)(1800799009)(186009)(2906002)(7416002)(30864003)(38070700005)(38100700002)(6506007)(53546011)(83380400001)(5660300002)(26005)(33656002)(52536014)(86362001)(7696005)(8676002)(8936002)(4326008)(966005)(316002)(9686003)(64756008)(66946007)(6916009)(76116006)(54906003)(66446008)(66556008)(66476007)(478600001)(122000001)(55016003)(71200400001)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yD8rwCxEDwyPRIzPt9ecrfsdfDQYAV3nS9pIrX5mj+CWzLoUFkXtER64sJ?=
 =?iso-8859-1?Q?w3UAzp4dvlrc0onQEcf579SrcQIQs/A7zjpqA0RSpCdMgb/HXpgoR73xEU?=
 =?iso-8859-1?Q?J5X6MtHrzjJDtW5aRra78iI5gCAcEnwA9dE0fCDmGmo9R5EOFCKJ4Bq1ho?=
 =?iso-8859-1?Q?AkISIpm9ySVx2QX47WE+ypMQULQb+P0CarpaaXHidsEt/jHyzkwBuejNq7?=
 =?iso-8859-1?Q?PBiR3a6+fuFVcEMZpaaZ9H6rEWp+juymll8Sg8+zAnaMQo2wAnx+UzOd0M?=
 =?iso-8859-1?Q?arZBAak66ocdrst3x7TU+nGXHzhsq0J3QwlCSIVTEPokN+5snc7E1nib0j?=
 =?iso-8859-1?Q?b6YSzyCF9b8RrWDq5H870+fKFysfEO8/90SiXeV1BLRSfVtUyUoEZuQQHn?=
 =?iso-8859-1?Q?5ttHmcp8Idf8BUOecGA1zGqIiT63Drz2zsUeQagsho8yjibW1mCyASlVhK?=
 =?iso-8859-1?Q?48Eo8ztVSGdtzD6DaazRJ+FfK8+u8ST9a/Dcz5jtkjuSvc+XHFQsXQMM1K?=
 =?iso-8859-1?Q?CYt/xAB1Asj49+dY8oZ7E9neU50+dDgBgKDn7F9mh8b6EptsFC8kJ8QljA?=
 =?iso-8859-1?Q?MadPPY4BY/HwQ3Qcjk5uqu5owMZsJCDJd/F/tW0ornKrxYA79MWGvNU4L1?=
 =?iso-8859-1?Q?dHnyzE7cl9nWk9Y0lzMvFxCslnO0jqa29U9E2+of2f94LUXrGbl2TKx0Eb?=
 =?iso-8859-1?Q?lj2yWqd0lYp6VqCgY1zJ7UrsPdw+riaQuyt8RQ0MORVkRswOioLB2V9bc9?=
 =?iso-8859-1?Q?a+Hpws5Ab2InU5kmq5o4IMqM0q7XfykYxWZpv+teOSPLcL/UYuWN7KR6Cp?=
 =?iso-8859-1?Q?fFe6+2xHqNj9jRVgy295n2F6KIvFE43oe4nSU9AyVGz99fYeQapt3q+NfF?=
 =?iso-8859-1?Q?xKcge/vJfRlDYyUxG8giWhBiH4qOmZy8LJloY+HZuHSvactAw1b8vbD09N?=
 =?iso-8859-1?Q?LysIL428yA2Wyto58uEEjy4De8SjkirEWj+/LYbBwKFlO0FOUG2wQ4pv0E?=
 =?iso-8859-1?Q?SpbtvHIUJ0WUBA2Oi4krHlqMqJATGLaPjFHcLa9XjiIVQprGQAcPg/m1Jt?=
 =?iso-8859-1?Q?xXPzD21mvpNcC5JJAK04cGfDI1yYMr+0YbEMpqtGALy+g1TgSZGRQROlGt?=
 =?iso-8859-1?Q?onyJWNldBAiiFcdzB/ApKgNx6AZSR1iXBSzq6vzIzRMCE6BlpzZ4onxSbV?=
 =?iso-8859-1?Q?6VCA1VBsgm0VYFEqK5gGZMcUpT3kNQbJh92m/OPdnuYEWkcO38jteK48WG?=
 =?iso-8859-1?Q?v9n6YZxK9j1/yDuoLcsMuyQMd69/UtcJdxqJze0bmzrClBmSa1XH6ESKyF?=
 =?iso-8859-1?Q?7ADD7GyGo2Orx128F+1fepyQ5GZUeIES40XzruBEHhYLWhJ5MfSU3qbupJ?=
 =?iso-8859-1?Q?qtbUXabhRgIHwXbzoMq2L6sosjjgVImnYE6wvAv5cRe9a1hjoHW9hahGH8?=
 =?iso-8859-1?Q?0RzlZZXKwLQgrheJ7DYIbXsF9R0X+Sc+t8rZBZM+xfZaGVwYu4qAShF+QP?=
 =?iso-8859-1?Q?u1+Olz4ClDd9GjeuhjSGJsdImdMN0o62x2BdhyBTrnKH2zTUS94g+/pNSA?=
 =?iso-8859-1?Q?9pQ8HV1WXLCvDTZssUaCLKdmYFq3KMs3lTPgrZjnB+H2M636jqenJm7NwB?=
 =?iso-8859-1?Q?zD/oUpEPru/gmEtoeN+aS9vHN5b2bw4Wro?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f9eb1d-82c3-4b5a-779c-08dba38311e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 02:45:53.8880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NU8xL0MbS0wSGQHXwXgSWeJzqEicYv3fm8PKyMQ8Eyv++7xG0oac3R3hOKRBj4rYq82uxnjvJV4m+z1BOHPVHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7587
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On  Tuesday, August 22, 2023 7:47 PM Maxime Ripard <mripard@kernel.org> wro=
te:
>=20
> Hi,

Hi Maxime,

Thanks for your review.

>=20
> On Tue, Aug 22, 2023 at 04:59:44PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v7->v14:
> > * No change.
> >
> > v6->v7:
> > * Add Rob's R-b tag back.
> >
> > v5->v6:
> > * Use graph schema. So, drop Rob's R-b tag as review is needed.
> >
> > v4->v5:
> > * No change.
> >
> > v3->v4:
> > * Improve compatible property by using enum instead of oneOf+const.
> (Rob)
> > * Add Rob's R-b tag.
> >
> > v2->v3:
> > * No change.
> >
> > v1->v2:
> > * Fix yamllint warnings.
> > * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as
> the
> >   display controller subsystem spec does say that they exist.
> > * Use new dt binding way to add clocks in the example.
> > * Trivial tweaks for the example.
> >
> >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml | 387 ++++++++++++++++++
> >  1 file changed, 387 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> dpu.yaml
> > new file mode 100644
> > index 000000000000..6b05c586cd9d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> dpu.yaml
> > @@ -0,0 +1,387 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8qm/qxp Display Processing Unit
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp Display Processing Unit(DPU) is comprised =
of
> two
> > +  main components that include a blit engine for 2D graphics accelerat=
ions
> > +  and a display controller for display output processing, as well as a
> command
> > +  sequencer.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qxp-dpu
> > +      - fsl,imx8qm-dpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: |
> > +          store9 shadow load interrupt(blit engine)
> > +      - description: |
> > +          store9 frame complete interrupt(blit engine)
> > +      - description: |
> > +          store9 sequence complete interrupt(blit engine)
> > +      - description: |
> > +          extdst0 shadow load interrupt
> > +          (display controller, content stream 0)
> > +      - description: |
> > +          extdst0 frame complete interrupt
> > +          (display controller, content stream 0)
> > +      - description: |
> > +          extdst0 sequence complete interrupt
> > +          (display controller, content stream 0)
> > +      - description: |
> > +          extdst4 shadow load interrupt
> > +          (display controller, safety stream 0)
> > +      - description: |
> > +          extdst4 frame complete interrupt
> > +          (display controller, safety stream 0)
> > +      - description: |
> > +          extdst4 sequence complete interrupt
> > +          (display controller, safety stream 0)
> > +      - description: |
> > +          extdst1 shadow load interrupt
> > +          (display controller, content stream 1)
> > +      - description: |
> > +          extdst1 frame complete interrupt
> > +          (display controller, content stream 1)
> > +      - description: |
> > +          extdst1 sequence complete interrupt
> > +          (display controller, content stream 1)
> > +      - description: |
> > +          extdst5 shadow load interrupt
> > +          (display controller, safety stream 1)
> > +      - description: |
> > +          extdst5 frame complete interrupt
> > +          (display controller, safety stream 1)
> > +      - description: |
> > +          extdst5 sequence complete interrupt
> > +          (display controller, safety stream 1)
> > +      - description: |
> > +          disengcfg0 shadow load interrupt
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          disengcfg0 frame complete interrupt
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          disengcfg0 sequence complete interrupt
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          framegen0 programmable interrupt0
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          framegen0 programmable interrupt1
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          framegen0 programmable interrupt2
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          framegen0 programmable interrupt3
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          signature0 shadow load interrupt
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          signature0 measurement valid interrupt
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          signature0 error condition interrupt
> > +          (display controller, display stream 0)
> > +      - description: |
> > +          disengcfg1 shadow load interrupt
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          disengcfg1 frame complete interrupt
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          disengcfg1 sequence complete interrupt
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          framegen1 programmable interrupt0
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          framegen1 programmable interrupt1
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          framegen1 programmable interrupt2
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          framegen1 programmable interrupt3
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          signature1 shadow load interrupt
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          signature1 measurement valid interrupt
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          signature1 error condition interrupt
> > +          (display controller, display stream 1)
> > +      - description: |
> > +          command sequencer error condition interrupt(command sequence=
r)
> > +      - description: |
> > +          common control software interrupt0(common control)
> > +      - description: |
> > +          common control software interrupt1(common control)
> > +      - description: |
> > +          common control software interrupt2(common control)
> > +      - description: |
> > +          common control software interrupt3(common control)
> > +      - description: |
> > +          framegen0 synchronization status activated interrupt
> > +          (display controller, safety stream 0)
> > +      - description: |
> > +          framegen0 synchronization status deactivated interrupt
> > +          (display controller, safety stream 0)
> > +      - description: |
> > +          framegen0 synchronization status activated interrupt
> > +          (display controller, content stream 0)
> > +      - description: |
> > +          framegen0 synchronization status deactivated interrupt
> > +          (display controller, content stream 0)
> > +      - description: |
> > +          framegen1 synchronization status activated interrupt
> > +          (display controller, safety stream 1)
> > +      - description: |
> > +          framegen1 synchronization status deactivated interrupt
> > +          (display controller, safety stream 1)
> > +      - description: |
> > +          framegen1 synchronization status activated interrupt
> > +          (display controller, content stream 1)
> > +      - description: |
> > +          framegen1 synchronization status deactivated interrupt
> > +          (display controller, content stream 1)
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: store9_shdload
> > +      - const: store9_framecomplete
> > +      - const: store9_seqcomplete
> > +      - const: extdst0_shdload
> > +      - const: extdst0_framecomplete
> > +      - const: extdst0_seqcomplete
> > +      - const: extdst4_shdload
> > +      - const: extdst4_framecomplete
> > +      - const: extdst4_seqcomplete
> > +      - const: extdst1_shdload
> > +      - const: extdst1_framecomplete
> > +      - const: extdst1_seqcomplete
> > +      - const: extdst5_shdload
> > +      - const: extdst5_framecomplete
> > +      - const: extdst5_seqcomplete
> > +      - const: disengcfg_shdload0
> > +      - const: disengcfg_framecomplete0
> > +      - const: disengcfg_seqcomplete0
> > +      - const: framegen0_int0
> > +      - const: framegen0_int1
> > +      - const: framegen0_int2
> > +      - const: framegen0_int3
> > +      - const: sig0_shdload
> > +      - const: sig0_valid
> > +      - const: sig0_error
> > +      - const: disengcfg_shdload1
> > +      - const: disengcfg_framecomplete1
> > +      - const: disengcfg_seqcomplete1
> > +      - const: framegen1_int0
> > +      - const: framegen1_int1
> > +      - const: framegen1_int2
> > +      - const: framegen1_int3
> > +      - const: sig1_shdload
> > +      - const: sig1_valid
> > +      - const: sig1_error
> > +      - const: cmdseq_error
> > +      - const: comctrl_sw0
> > +      - const: comctrl_sw1
> > +      - const: comctrl_sw2
> > +      - const: comctrl_sw3
> > +      - const: framegen0_primsync_on
> > +      - const: framegen0_primsync_off
> > +      - const: framegen0_secsync_on
> > +      - const: framegen0_secsync_off
> > +      - const: framegen1_primsync_on
> > +      - const: framegen1_primsync_off
> > +      - const: framegen1_secsync_on
> > +      - const: framegen1_secsync_off
> > +
> > +  clocks:
> > +    maxItems: 8
> > +
> > +  clock-names:
> > +    items:
> > +      - const: axi
> > +      - const: cfg
> > +      - const: pll0
> > +      - const: pll1
> > +      - const: bypass0
> > +      - const: bypass1
> > +      - const: disp0
> > +      - const: disp1
> > +
> > +  power-domains:
> > +    items:
> > +      - description: DC power-domain
> > +      - description: PLL0 power-domain
> > +      - description: PLL1 power-domain
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: dc
> > +      - const: pll0
> > +      - const: pll1
> > +
> > +  fsl,dpr-channels:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: |
> > +      List of phandle which points to DPR channels associated with
> > +      this DPU instance.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The DPU output port node from display stream0.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The DPU output port node from display stream1.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
>=20
> Generally speaking, and looking at the main KMS drivers patch, it really
> looks like it's multiple device glued as one, with the driver un-gluing
> them and creating devices and their resources based on what actual
> devices you have in there.
>=20
> It's especially obvious for the CRTCs, and to some extent the embedded
> interrupt controller you have in your driver.
>=20
> This is *very* far from the usual way of describing things in the device
> tree, and you would usually have a driver that doesn't take care of
> creating the devices, because they are properly described in the device
> tree.

The DPU core driver(dpu-core.c) creates platform devices only for CRTCs,
no other device is created.  The CRTC devices, as components, are bound
together with the DPU DRM master device.  i.MX8qm SoC embeds two
DPU IPs, while i.MX8qxp SoC embeds one.  Each DPU supports two CRTCs.
So, e.g., for i.MX8qm, there could be at most four CRTCs under the imx8-dpu
umbrella.

>=20
> If you have a good reason to deviate from that design, then it should be
> explicitly discussed and explained.

The DPU is one single IP which cannot be split into separate devices.
The "IPIdentifer" register in DPU register map kind of provides version
information for the IP.
This dt-binding just follows generic dt-binding rule to describe the DPU IP
hardware, not the software implementation.  DPU internal units do not
constitute separate devices.

Regards,
Liu Ying

>=20
> Maxime
