Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E28243DD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 15:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D476C10E479;
	Thu,  4 Jan 2024 14:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2B10E479
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 14:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdmxaor6RZLl11EcHx/eoDGIVJwk13a5WsBPj9y8sShh8zjoyNHUQFgcrXMKHaQBb4gjFW0BBYNzuUYubRO8P42iq8842eh5eGKCgNYYupuHx0wjv+8cqMo52v2bCtk7guvo48XD+QKC4gXP3FmU5MXcEihoXvUI2ZpnWqHQocPICkxE6HFIjKa5eIfSqt1Zfqxa49eiGr6ILyhvxZJX123gglIkT6TDFJ36ZGoAZf7vzzq3p/kVIQ6IabOkKj7aIwIBOTWnwlgTPrPZYNqkj/VFOLKzH5I01zI/zb00dku894cM5uySoVGAYv2nMXn1rYd/qHsNo/KuQMdjK324gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhA/+ekj8Odv31UAlY3qDWO3cnpGRQ52vV7FbFN6AsI=;
 b=FW4j83GT8FnSy+M5zKibY162Emccvp8wdDokCioaLQ844G8GMb10ILqBtU3Brv3erxR1EUzpaFu04/tWrleRv7AWGAVspC02viOL/gpSFUVVeI1OOFaEL28UhicJBm/bYnSUg9R9rghUINuScLmBNCaqITXTm0thmlq0LHw8OeAWqP/90SjN8Orv7fn2bnWTYhRseZf3PDjQoiXcTzaPijQZ+sJEORs4Zp/RuZGSb8SrOlMt2w91dMr1pLmtNnSyUuhy2J16h7DVIvq9mDyFr10eeGNXgJElv8zrTIAAlGC0Pc6AlavCf1NIugLo+lWs4gIelrzeANRwHowDLb8L/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhA/+ekj8Odv31UAlY3qDWO3cnpGRQ52vV7FbFN6AsI=;
 b=pKXNhAROExHVxKof3Aro/wr57HCFd4IBw1cN3G6LqfZiUkXNQY6FS5Vlz+m7NeqIJQCORqdgxlcIIy0r9NmTMeHYuoBkTdKzN5QlWmA+0RUEURzeYzF7XaflYcIBwiR6d9s/GvxGgmZSpaTBF6w6m92hZy8PmQEd/KfzLJ874eI=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB9550.jpnprd01.prod.outlook.com
 (2603:1096:604:1d4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.9; Thu, 4 Jan
 2024 14:34:33 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.009; Thu, 4 Jan 2024
 14:34:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAKdWwgAAZZACAH25AgA==
Date: Thu, 4 Jan 2024 14:34:33 +0000
Message-ID: <TYCPR01MB112697575E0CF41CC26A8140086672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB1126964899D432355ACAF49D18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <he23e5al3hinegebvq7qai4jdw3qjgbzmnx34xgxqnu3hw4jke@dts2vi5kcs4u>
In-Reply-To: <he23e5al3hinegebvq7qai4jdw3qjgbzmnx34xgxqnu3hw4jke@dts2vi5kcs4u>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB9550:EE_
x-ms-office365-filtering-correlation-id: 0d26eca5-fe4d-405a-0426-08dc0d3244f7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RAkjMsWteu9kL9VVhp5O/xLXWSa6qA2PEjaFmOkhG1773ALsbZWOegc7LyW8gjT0jmcq3Kfhk50UnWtzpuOZFtooERidaB9QIZPIaftXxw1oP0lMGZyM5cV68K3Idt4+yH6zBiesKM7wpHUvs56OLCVeicje3YlGMLEHvRmzRcL95zBKQaw+rBNHRym4KvqF/suxEflMA1MiSnQ0jZJcDIaD1HQ56NMMSOIroe9BkVvdxTLB5U3aNS+3rhjJLjTCnaaNKXKPhYrpUi/mJmnhkrK/9Tx5P5cZh6dkp/kGdK0qC3VwbQ0dnzf/+2WFPeiM1Z/2I9AsSQglk0BLpo2jgjEfvzsHAiON+zOYjiAU148cCWfBBToAMFIcbppM623826kxjFa3BZk0+UfAG9V0N3IhHDp9XlrC75fwGnY4FtwsdZex6cJcoTl2x7LlTCVBm7TWJgQbywlkTiZ0U+LU1qJg53xuuDEtnolldUo4xJZESqUvn/xA1gr+73UCx0pTbK++4tME2GaNmXAmZNmwiTbV4uxYAt7seEuvj/fB5epG5bLMp76KwKz7unjUH463Wmn8T2ai2/Y1uHAJscWq903E3i18lA1+jTvutL3omOA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(53546011)(71200400001)(478600001)(966005)(6506007)(9686003)(7696005)(83380400001)(7416002)(2906002)(41300700001)(66446008)(66476007)(66556008)(76116006)(54906003)(6916009)(316002)(64756008)(66946007)(52536014)(4326008)(8676002)(8936002)(5660300002)(38070700009)(38100700002)(122000001)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OVb0HwubbEvIdEMmzscOz4iUs7v3ilYnM1oMswU+ixc5tuvHN7MZF20bQJZb?=
 =?us-ascii?Q?NuGS7K1bpY5LIhb/+cYcDhE8FGN0xa4nr3uh+q7m4sQOEag+DQtXqoKe8T4T?=
 =?us-ascii?Q?L32bXIoJJfB2tSTaluCeNVjMe+qeVpigfVhaN5Uy2n6u+yRX+HrhtN/TzzHA?=
 =?us-ascii?Q?nnUaxUOPfiwiBziXEznwOdL5u1el2cybqNhsVluUKPSk6R6fx+gjTQHNOg0r?=
 =?us-ascii?Q?CfOaNIjbduQUgF9rPtH63afVgqkb7U9OSW4R2cZkHuYmh6kV7ursI5rl4lBC?=
 =?us-ascii?Q?NQamYX78vFVdRHJymWpf28x9262J3ccUyviC/4yrcXUJfbGY1nadil95gNG9?=
 =?us-ascii?Q?0qX7jqr+dvQzeVbDmUvd5rDkZnCoBTW6NBtvLOBsgDzR0ywU8HbRpvhAaW4l?=
 =?us-ascii?Q?Tq2s1wn8UXxq7mI7i03Z5yHrEhnd52pbp5AZ8zLgtU0o+typlTHX0R8fHkr0?=
 =?us-ascii?Q?yKvP11lmsO7RGAbmiPyQKjEaDQk+Q5fXO+F1YSXCg0rG+xJMvr0eBcJINKud?=
 =?us-ascii?Q?WcTfVjWytgIOhvAIi6nB4v1t7hti6px1UyAvlqab4pKBCK8MaYt7egpy8EwI?=
 =?us-ascii?Q?hrVuRlkBmB1FZjSKRQE8GrbC9QvFLx8LrzPeGTA48p6ss9fTd3WHSLeqRJR6?=
 =?us-ascii?Q?9QoNWFTWa6mcCGJN9bxGp4UpSANarKKQUTlAk569eZq/ZGj5XOe7dJbrQoHl?=
 =?us-ascii?Q?Up9mrXIfIrgijc3t5EwhLtcsoIFyYyWkXNyirq+Zw4iJVvpUZzZ0kaGPvvU0?=
 =?us-ascii?Q?xgmWrpHj9mQtN9B1jKcRDJpz2blzT9p9SoVV6IcaDiZtKtiX0UJFqXDgpsvF?=
 =?us-ascii?Q?izBNgUNQiARh64gq+N8UOmI00q4je0B5qVMyV9wDpDeLgNlISEZbnA0Ak9l/?=
 =?us-ascii?Q?BW+YJKI/Es37X/MkDJy5b5UozkoxAcz4oGKkhNz9+S3BmV9xUzHTqr23As85?=
 =?us-ascii?Q?F5eolAeZ12yTWQLIlznyxcYnUEAC2gnnxQokyTwoLickm4VnAd8q3BbjNwaT?=
 =?us-ascii?Q?YP1UIxY2T/o8cIrXAAgyhOandQ7ihk5EYUJZx13Rf4LaoW8zWWsrOcXLA8U1?=
 =?us-ascii?Q?y3Iq6koHq58VGSsBM4UGm2AG+m6sz9aDwso0j4CYeXwjc3m0K4O5W51jy3qv?=
 =?us-ascii?Q?1jS7yb7UO5Br/xJLSKYB2huOsiDd+W7va3oRqm9vouHzAnyfR8nepwLOyByY?=
 =?us-ascii?Q?k90s22dVSkgbLXL79oJAMuAPCNMsItfpyHzPKQxgwrSKbffAKkJE4DCYpHHu?=
 =?us-ascii?Q?Stxct2RIrlD/mMkdAAjtlS4CO9RtR/TyODex/nZTvQRVcbkcKh/FH50KNUbZ?=
 =?us-ascii?Q?V4jBvRR7PJob034QV6/eiHCEbq8Zu+iljw3VWj9697ET+zu3h6MuYPbJnXzB?=
 =?us-ascii?Q?q7mqXE1B8jfb2N9oEPeAE42n8iIIjGGsZGAIINu0OHUZDcqCqt6tA2K2lkpL?=
 =?us-ascii?Q?Q+6ILy9lw8YmMtWLidrX7cI1rJrrYfaC8zGBuI47I5e8Mo5mhLNvQ0VcuN+i?=
 =?us-ascii?Q?QJcubXe4sT7FyUL1rRmsRzH6cU/gatqCYeD5ELhFJZOLzvtfmr2d7wR79fPi?=
 =?us-ascii?Q?uo4R0e+DMl6lKffP6C8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d26eca5-fe4d-405a-0426-08dc0d3244f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 14:34:33.5921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UuwILXQpGeIz+7mfci4Vu0B8bYv/FAtX0VkztK+FX3oJDa+aqMoegyIBDWWPlKzfuz4e3n06Sz6kRNp24RTLRoCmp48S4WbVpxoWcVG96aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9550
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
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime Ripard,

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Friday, December 15, 2023 2:24 PM
> Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> On Fri, Dec 15, 2023 at 01:25:48PM +0000, Biju Das wrote:
> > Hi Maxime Ripard,
> >
> > > -----Original Message-----
> > > From: Maxime Ripard <mripard@kernel.org>
> > > Sent: Friday, December 15, 2023 10:24 AM
> > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > >
> > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > Hi Maxime Ripard,
> > > >
> > > > Thanks for the feedback.
> > >
> > > Thanks, that's super helpful. The architecture is thus similar to
> > > vc4
> > >
> > > Some general questions related to bugs we had at some point with vc4:
> > >
> > >   * Where is the display list stored? In RAM or in a dedicated SRAM?
> >
> > [1] It is in DDR (RAM).
> >
> > >
> > >   * Are the pointer to the current display list latched?
> > >
> > >   * Is the display list itself latched? If it's not, what happens whe=
n
> > >     the display list is changed while the frame is being generated?
> >
> > There is some protocol defined for SW side and HW side for updating
> > display list See [1] 33.4.8.1 Operation flow of VSPD and DU.
> >
> > All the display list operations are manged here[2]
> >
> > [1]
> > https://www.renesas.com/us/en/document/mah/rzg2l-group-rzg2lc-group-us
> > ers-manual-hardware-0
> >
> > [2]
> > https://elixir.bootlin.com/linux/v6.7-rc5/source/drivers/media/platfor
> > m/renesas/vsp1/vsp1_dl.c#L863
>=20
> I'm sorry, but I'm not going to read a 3500+ to try to figure it out.
> Could you answer the questions above?

The answer for your question is,

If a previous display list has been queued to the hardware but not
processed yet, the VSP can start processing it at any time. In that
case we can't replace the queued list by the new one, as we could
race with the hardware. We thus mark the update as pending, it will
be queued up to the hardware by the frame end interrupt handler.

Cheers,
Biju
