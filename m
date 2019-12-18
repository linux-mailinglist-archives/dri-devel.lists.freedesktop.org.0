Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A2125C6A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CC76EAC0;
	Thu, 19 Dec 2019 08:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400107.outbound.protection.outlook.com [40.107.140.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCD36E2DA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOrUKZt9W8gbgT90boOi9WG1XH5nCbHnMt0uZddN1pCTOD+WLjwMRh8EjnkANcPtkHERqFkhHjNdhOPfmkEtNUso620L8ZtEMBKlYXwFu6YVszAT4yN5imyQu2pC2n9cqnQro9NHt6Bdu3y5Np+3u8ceKPtHELKfr1yU60JwZeC9Nanp/HyelNGg4yJLQ/V2Em3CcnGyoUY/VcQmks7h2DaXSg3DZKCExL1DS9/CDF9e3KkAdyBLcbNx+4oTZNeAJdOmRKe/5OUv35y8Q9dl0bTEOUy1c/0Kh9NsOdvtOVFTb8oLRd2ULtVODgtgOL3L2nFNpygbJLG4A25XzayA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiEieY7Ft9mKYf0jzEXpRDaIzRRubLziMmCw/Ov5sIE=;
 b=SnHusWg4B71miToAngucAxbpVK8ymwKb7VcONUmbWjThEzAUkQUuQQgu2x9cIS+oMafVeEPt8BrLAJ3P9rkHcnwn91IvEA4v0ZHLnvrtkCnHHtaxs2qRevx+oDWD4rYO8AraQ+fPfIcDFxYHQwRuVSp9muihWGGKtg6uMNJAI+ZMHug8LVFWo6pJtzU53usQliGGtg/NF+4l9JgPaLlzRCnaNU9V9ih7ZSIWFiOCi0IhfjNdPsG08M5A1BVY8KLrucJ6878yo+C+GCQQqcnT3TkRGM+Z/ly4qGd0sy8iRlXV/pRjcxXIK0S8bobMVGietfmbPoOQG0wz0Qex5KtUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiEieY7Ft9mKYf0jzEXpRDaIzRRubLziMmCw/Ov5sIE=;
 b=q6D2oZ6NBpije2kA90NSUDhFZ2huGY2A/B38DjU01AogizrE/mxpVqGdvK7MybBwwaCCzI8a6XQpXpg6UXit1/C3jUpKLguYIBXcqJqE9ZhjTdQDBvANml8ndIIsBqHkKq2yE3hT0Prz6V6bj9qPucV6iV4kC1wYhzCDQU1JVfs=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1820.jpnprd01.prod.outlook.com (52.133.164.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Wed, 18 Dec 2019 14:05:42 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 14:05:42 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: RE: [PATCH v4 00/13] Add LCD panel support to iwg20d
Thread-Topic: [PATCH v4 00/13] Add LCD panel support to iwg20d
Thread-Index: AQHVmjo/M6ipYgFTGkKGMRHUnVLV3Ke//tUAgAAlB0A=
Date: Wed, 18 Dec 2019 14:05:42 +0000
Message-ID: <TY1PR01MB177012F63EC99A0B209B89F8C0530@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <41b59b13-1c8d-a407-8fd8-f2d8cfadd43d@baylibre.com>
In-Reply-To: <41b59b13-1c8d-a407-8fd8-f2d8cfadd43d@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d47e64b1-c6dd-4744-6375-08d783c35ea1
x-ms-traffictypediagnostic: TY1PR01MB1820:|TY1PR01MB1820:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB182087980D482AED828FAB6DC0530@TY1PR01MB1820.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(189003)(199004)(54906003)(110136005)(2906002)(26005)(33656002)(316002)(66476007)(4326008)(44832011)(86362001)(66556008)(19627235002)(71200400001)(186003)(52536014)(7416002)(9686003)(81166006)(8676002)(8936002)(66946007)(53546011)(66446008)(6506007)(7696005)(76116006)(55016002)(478600001)(64756008)(5660300002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1820;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Nsq3Tgi2MlFTZMQZ+54NLKzv9LBLijkwWhexXfsFdWmq7F7oD5ZgdCQnicYOntKtwFIWqTwswIkZQukVQVefrllDWZWh5uaQvvtFAYqHKw/1vzcXpAa2FIWb7I7xq7A4Ye9SU66exq0nucclxWcxb6XVqO0f79PMZs+HYFWDmqp61BLmu0HZjRPLY22Dv/yHJthSzJEkxfqDINYi9s2aXgFOJvyxd4FK84nhqZ6ExJ5untqsEssaD1b+h0Zh2eim0eGlZoAzosoixBNSud8DKm6BvWW3oUYwAssg6wHvhDjIKDxJ9n+dUnM5/8xM6V+3X1/q7nj43R4Y3Khr0hC4ObPNAMtYj8jiyx+EX/Sk46PyZw6AjuvdtJR+vxNNP7rz5eQDhB2Cguu//D2cvEJXiv/ND5oMAq3OELhsOUj8LWeSMTpzmT0Vnj2iEAHDOo5
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47e64b1-c6dd-4744-6375-08d783c35ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 14:05:42.4561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KjboJNMPyY30Dm0ESsxl3TjHbwTLc0bucbNxXp54BgpPAEaZq9CoOqqrlpB9afwh69uRrav97J6jKRLQEERNNoFwvUVENGfwxhJX002N1i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1820
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,


> From: Neil Armstrong <narmstrong@baylibre.com>
> Sent: 18 December 2019 11:53
> Subject: Re: [PATCH v4 00/13] Add LCD panel support to iwg20d
> 
> Hi,
> 
> On 13/11/2019 16:51, Fabrizio Castro wrote:
> > The iW-RainboW-G20D-Qseven RZ/G1M,G1N Qseven Development Platform
> > comes with a 7" capacitive display kit from Emerging Display
> > Technologies Corporation (EDT). This series adds all that's
> > necessary for supporting it.
> >
> > Thanks,
> > Fab
> >
> > v3->v4:
> > * Reworked according to Laurent's and Jacopo's comments
> > v2->v3:
> > * Split the dt-schema patch in two patches as per Rob's comment
> > * Made fixes to the dt-schema according to Rob's comment
> > * Made fixes to the lvds-codec driver according to Jacopo's comments
> > * Added two new patches:
> >   * drm: Define DRM_MODE_CONNECTOR_PARALLEL
> >   * drm/panel: panel-simple: Add connector type for etm0700g0dh6
> > v1->v2:
> > * Convert dt-bindings to dt-schema
> >
> > Fabrizio Castro (13):
> >   dt-bindings: display: bridge: Convert lvds-transmitter binding to
> >     json-schema
> >   dt-bindings: display: bridge: lvds-transmitter: Document
> >     powerdown-gpios
> >   dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt
> >   dt-bindings: display: bridge: lvds-transmitter: Document
> >     "ti,sn75lvds83"
> >   drm/bridge: Repurpose lvds-encoder.c
> >   drm/bridge: lvds-codec: Add "lvds-decoder" support
> >   drm/bridge: lvds-codec: Simplify panel DT node localisation
> >   dt-bindings: display: bridge: Repurpose lvds-encoder
> >   dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a
> >   ARM: dts: iwg20d-q7-common: Add LCD support
> >   ARM: shmobile_defconfig: Enable support for panels from EDT
> >   [HACK] drm/bridge: lvds-codec: Enforce device specific compatible
> >     strings
> >   [HACK] dt-bindings: display: bridge: lvds-codec: Absorb
> >     thine,thc63lvdm83d.txt
> >
> >  .../bindings/display/bridge/lvds-codec.yaml        | 131 +++++++++++++++
> >  .../bindings/display/bridge/lvds-transmitter.txt   |  66 --------
> >  .../bindings/display/bridge/thine,thc63lvdm83d.txt |  50 ------
> >  .../bindings/display/bridge/ti,ds90c185.txt        |  55 -------
> >  arch/arm/boot/dts/iwg20d-q7-common.dtsi            |  85 ++++++++++
> >  arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi           |   1 -
> >  arch/arm/configs/shmobile_defconfig                |   3 +
> >  drivers/gpu/drm/bridge/Kconfig                     |   8 +-
> >  drivers/gpu/drm/bridge/Makefile                    |   2 +-
> >  .../drm/bridge/{lvds-encoder.c => lvds-codec.c}    | 179 +++++++++++++--------
> >  10 files changed, 333 insertions(+), 247 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
> >  rename drivers/gpu/drm/bridge/{lvds-encoder.c => lvds-codec.c} (25%)
> >
> 
> Applying patches 1->9 and 13 to drm-misc-next with correct SoB.
> 
> Also applied change on patch 8 while applying.
> 
> And checked the diff is the same as laurent's PR.

Thank you.

Fab

> 
> Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
