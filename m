Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2B7EC393
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D47110E00C;
	Wed, 15 Nov 2023 13:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBF710E00C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7P9733HglU7iVMf8CEfombu4rszuthVfUMoMyBlsv2FaGtDnhLsEAWRwL0PHeI10QZuZ68tY/V4cbFlAW8Yw64myl0K3LN+xc/HVYnRANRAZlIheJ+mq0SMR9Gb6oMcpbcApnfSVJQVK6MLXdJGr5OmcJVJ8uzG8jP78RHLLQnjKzD3eIJYnvlQZ/oGk08qnc098xGCLSopyOPo1To1o6k7dqYFT1GLAnFcIJmtVgZrT0z5WA2YLLneRrNqvqh9MPQkrmsoX0CogIFgZ8HW0CT7H9sT/fwKK05dT6gXZ3rzZaVyag2JHs4YUbJ/9Rtdez9xLF/YqXeqeCrMgi2w7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV/pjxp+WD3WqUoz9M7hLaZYQMoOHj/pgOrJ5XTHtRU=;
 b=SlUF8DfMMzBI4/cN8VLYEziC1VmTVsUpOJXvWgOsBfp4p2BshsO8TbJYitZTr1l4kbJqWcvlYzfrwTEsDUT6VfYhKexxuswLR1TNmz2GOfNrt2h2D1DG/34mEdlDNiQWmIIhY5J87TUfq/Lftcf+/nOCfiEmQKYQGUlzbgZFrmx7cTcUHfJqJ0iykSxd2GocwUlGu8+QqRoVU78tnPvBbYCTp+ieMXfL7IBZ75KLKbQnT2fwcwA8vMRMCgMH9xQmFbN8ASlwqAn5GyS5irIV7Gm2qwRR74Et1CBmnRHvpna1ZvvmEZcnlef00ilAhtCvitPZBsWSCn14p6xX8eoGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV/pjxp+WD3WqUoz9M7hLaZYQMoOHj/pgOrJ5XTHtRU=;
 b=AG9KN70Izffk36UhozIfejKGGXJJjtoD9/l60dr0i2CoIBMXnCsW64RZHOUz6r8YDNL8GM6au2K2p4Wz3BGADkYuFPhLKLsY1RELISrdw/coDJ2cona5aOFPDtsPuAlzZhTDoLWS3BrF732EzXwlriVbhnxoAQmwhKj9ruyEV9k=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB8110.jpnprd01.prod.outlook.com
 (2603:1096:400:11f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 13:27:31 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b%7]) with mapi id 15.20.7002.021; Wed, 15 Nov 2023
 13:27:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: RE: [PATCH v12 3/4] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v12 3/4] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaDZ5oJe/uy1a7mU++VPYrFoPc6LBu6ReAgAyKJTA=
Date: Wed, 15 Nov 2023 13:27:28 +0000
Message-ID: <TYCPR01MB11269FBB803B76A9DC0D334C586B1A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231102150744.28736-1-biju.das.jz@bp.renesas.com>
 <20231102150744.28736-4-biju.das.jz@bp.renesas.com>
 <72edcrxqbhq3ykcdocipx7tf7pd6dporvi7hh6mor4inxchuho@p5j7s4zczmux>
In-Reply-To: <72edcrxqbhq3ykcdocipx7tf7pd6dporvi7hh6mor4inxchuho@p5j7s4zczmux>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB8110:EE_
x-ms-office365-filtering-correlation-id: 4ea6aa20-d309-4ef2-0e0c-08dbe5de9d3e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BDziV2VC7Apy9wGTPBtOp8zwVMn92c/RkPllM/7oIpqr0siNNRH0/ugvgur9kg8A6xZ9KvaCdjI9y2nPaZZRSvLd9z935djnnWKZVaawAj2PLSBdGhX0NH7hLLiQ7IqgZ8blcUy54Sg3Ps/7S3krYlbV7qukuqO5xtk8b6w9BdZRyN3G5V569RZtSlqRg9JcU/6IuRre+0/JD5frc1RZm3gXwpxarjJY1hqKhhjmvDl3bvtrjIPE9AFud/N0+IuxvbcxGzfWYdaSeq/hlDHj+e7ilKc8lUlhjS7RVynWaYSwT+fdvdK+7IUHR4zuAwxkOvNdYDm4rqvyr8ZKXM+hWwenwO9+Kx8Vl11bx3rPl7PkJXI/hWN63ac4WzNLV6E02TkhrjcHYD0s+6aG5zYQ4lj4kGjdkV5OnxjY9jaH0teOz468p4KqqB3THMXhzzhfVCLmstWTJyTmknbVpOT2qtw8ebRrtsJHwUOWozvlJHaqtpSk64BsPqtDg7ykubzt/KlqwnKPBwSGpeC2onAyASIGz3nroBq/enb4gXyfXsKEL5Y118R3RKfw+yiPNq6sDjOc95cMvu6L5pAgl9RHhMCNu/Bw3OVm2I+D6/wxwKDyEThZWobPj2zhQYhLjAm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(122000001)(83380400001)(26005)(55016003)(38100700002)(478600001)(71200400001)(6506007)(7696005)(9686003)(86362001)(54906003)(76116006)(66946007)(66476007)(66446008)(66556008)(64756008)(316002)(6916009)(8676002)(33656002)(7416002)(4326008)(8936002)(52536014)(5660300002)(38070700009)(4744005)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2O4q8bWrK6TcIzjREkzBLwBNZLMYxmERIOa7qqvMkEYhWngYKMGaRpIBB8Rj?=
 =?us-ascii?Q?JS8DNsdbNiieqxa0nE2c+JPtmzBWnYkhxMhxdbKSs944PdsUHD1O6uJxsmwY?=
 =?us-ascii?Q?V7LPf1qgiTE3iU9wRoakw+1TZagmjLCLQRfbStAnpbOgY+elBJ6H27T4H9Y9?=
 =?us-ascii?Q?tA7X/qt8UFCH5Htj4SWb5dmHmn0ZcJUEiVaGGx2iOl3H5BDAPJexjSsENvDs?=
 =?us-ascii?Q?yfAmYEc1EGMh1El+JvO/CjeppvfDNaztMPpvfShbC9O6KaIB6zon8Lm5kEHE?=
 =?us-ascii?Q?nrI/6/J2pdTGyI8MdxQ+30uUMo5Jb79OzClppbQFR4Yab3u8dTfJAzsc3EM/?=
 =?us-ascii?Q?q26kzJN1bR1UNUzcG984rUFcLeRb9gdfovryXYpCvfv5n85WUDfmeFvJtPQs?=
 =?us-ascii?Q?8GveztMsA8UVgrqz6VKkr1MAU9u2Ck60cbvUrrG8H/RZAbArE3JZPx+hPBRQ?=
 =?us-ascii?Q?g0D+q/0/+bnStx4P1pKoIFZJuX1smSrGqPUrB2FQzWT4cExMcu27gq6Vg4Px?=
 =?us-ascii?Q?suOFEriCPW8ox8xGJ4kuWROBHcHKKTIjwhH7n9Xhez8nqNPQ1sBQv4LClcYW?=
 =?us-ascii?Q?KRDU5v7OZB6+2EMuhlZ4oQLilNtO2JJZoKvmDvSesMlteYskPa0yTj82uBOw?=
 =?us-ascii?Q?lIQL4rCZkDK9stdMz5WCetzC1LIK9Ybx7ie8oA9u74ZTXrAhH7dowEotZd2p?=
 =?us-ascii?Q?akK6g7vHIz0Jj7Zvok5IkyrkWq9N66o0gxehw23Tlqri5+GHZ9UT/eqEyktS?=
 =?us-ascii?Q?UUkSAeibCwt+bK8BUL7O/e6sVMpuSJATFLuHEHUPQAfYJaXOYCvbLXrdd09f?=
 =?us-ascii?Q?Kzz5LqfaPhWUJVf6z8X7dSL1v1iCTI6uD0vYSc6wEq93Xv14OZEsPMslNWmU?=
 =?us-ascii?Q?wKx1bLe926T77cjw0ULKTiGsyusHS2BMKs1ewIHi0W9WjP68/gQHBysU9tlh?=
 =?us-ascii?Q?ZrzfcZ+AYsaImiIj4pE3n3nbADS/8KnxKfMUukrHFHO1cy8a2MC4AQKar26/?=
 =?us-ascii?Q?mczibcJynCLleo838Rql68HKevhPHsUa0LWK59QmIb3j+EAbCqERM4lQjqfS?=
 =?us-ascii?Q?uTTh6MQsQ7lxqlsExh24L5Sq2bRmRESHGciHCbd6ClaPcspE9SZKuS+sh51L?=
 =?us-ascii?Q?MtkpIi3lgmy5emuUqaF1M3X+KmBnV9XZMRbuy5pL+M7eC0k72NTNCp2ZipFe?=
 =?us-ascii?Q?LAWoQzXdDgAxxp7iWwZ4xu7ECycxvIseBlX1t/rfB15CYe5OlyStTylOIihm?=
 =?us-ascii?Q?WFlgOYg2TjUewuAKAAJe44TGDrGezyxxKFzb9gybTuYkbdZTEz6OcLEe3g9U?=
 =?us-ascii?Q?AeHS4snyO1JmdWNjzSJ42OfoU6abCOFuloWfDxqNcZiLWN0ITV3zkKVf+bb6?=
 =?us-ascii?Q?L+5jevifi4s/w34KwOK5aAIOV1SN0MXPF3OH0Z/2jfd/q4IYLezzEeCtFC5v?=
 =?us-ascii?Q?tcj5CMCyTrnw5Vt5q1IDvFQ9VKqeeEhN2ATolsSzplxRSVa7tgb+mjZKDEAN?=
 =?us-ascii?Q?aKkDnGGYjoIPjBz+5eOSum5piTnVvpt4QhNxm9NiixsGz8D9GIkTSTCNV00p?=
 =?us-ascii?Q?DkhPRH5dz3AVB6ZkqQLoPwuiW/cJ3vhue4ebEMu/FDCu3FEdsGRT2zZWpe46?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea6aa20-d309-4ef2-0e0c-08dbe5de9d3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 13:27:28.6649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UOw3koDVBM1JRZjRk1wp71IXbFR5cHzSN2N0m7eUZWXTZ0Jq4A71mn6ggpRlycvvmWUTnuLd6ypHs72h7Esp/XP4ngGO0qMXhh8ln5q4McE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8110
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jacopo Mondi,

> -----Original Message-----
> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Subject: Re: [PATCH v12 3/4] drm: renesas: Add RZ/G2L DU Support
>=20
> Hi Biju
>=20
>   the series does not apply on v6.3. What is the base for the series ?

This patch series is based on drm-misc. I will add base-commit id on next v=
ersion.

Cheers,
Biju
