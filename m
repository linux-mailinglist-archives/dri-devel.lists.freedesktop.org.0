Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B18149AB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2745010EA20;
	Fri, 15 Dec 2023 13:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B7E10EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAu6ZUr5DzP7QOA7+UmPnEubAS1URjMQOGFcZFwkKbxf2Gxni97AIZ5dUbN1YFQHYhQZeG16YbvDU6Ur0Y6qudJykupMF0ysx7icbEb/ynKLV0ci728x7VTDfHuzfsNyCrrzBEuLx9OSFZmLo/+l4z6CXT6pbZ50hIcor7zCOW8ms31i2EW674N8DYemQ88BeAveLIJTstEFFe++YQr+XcvDmB4TPAJzWS2SSaf2LABr9qb/E9+L1LlvCCryBxs6BcNHMIH1LN6bRkPlJsG6VmkTghP+H+/PgXa361uKTtjcaUXJy1Rv9m0imczNBB9HaUSDEzirAfKuJSwc3E6KXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/ztfQIZNfhvS+DS3TWCTiovFKVop3H+K4VPzvh56HA=;
 b=G6AVzFio/F7HRClaQfFVK1cTZu8uSZuMudlrHleYHRB7wzp0OLMZGqPJfOuiHEC+Q1hX6nY9qmhAFiEiM11D0MJbv/UEXAxB9/biH1Uw2QdU7xX6qP6BtDEBIRnLJ12KvVqgSPoTUuJHevyhuZqUm3vnij3vrmIPtIR0rN7jLchvEuCtwIDo1YrvGeLpzYle5gaQbYEtCJlffGlp34T3k3LePYbpsmPx4pOjme9h1S/HqRI3qO15Q13FhbgB4pATwZwmHb3X2pjdhMTDnf4w6RgrXou1cKVLhiX6W2dHJcOC649KvUHIlhUrv3S0OmIF6zk7NDuQCEocv3Q59Q9Srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/ztfQIZNfhvS+DS3TWCTiovFKVop3H+K4VPzvh56HA=;
 b=tUiCSm9o9WwOWi7HGAub/SH9keYc87cPtrgCG+77yGcxoRVf1GC7viLHzqhI5zZHAXcMJtrM5LhIiWzf3ww4BGvh/Qf7xl+oLh3Nht9ZxEyT3rXonfLYdQCSBLhZwDoTuXHkjcp69Rwhdm/vpqAVSAR2VGJ+3EgV9YypK8sXFKo=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB10408.jpnprd01.prod.outlook.com
 (2603:1096:400:24c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.9; Fri, 15 Dec
 2023 13:52:28 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 13:52:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXwwgAAZsoCAAANogA==
Date: Fri, 15 Dec 2023 13:52:28 +0000
Message-ID: <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
In-Reply-To: <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB10408:EE_
x-ms-office365-filtering-correlation-id: d3822248-b37d-4cc4-cd74-08dbfd7513c0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rUQCtsf+s+mhIfPkBd9wWlZpBJMsH+WU+Nm8kCdYkT0AjI6g4oo5PWmnw4Lyow2AQ7uFqyWr+JHsN3oDRNoERDEu4iEfWqH6v8EWMNWyznJ10a1JrR8XwPPAoxX5xgsBBtUWoNGpOmKnbQ4yKSK0aqXqQaspAdcoOlfnsWyheYjdS1jYDWoInqjlhwVXBWL8L25IMNNA/1LKZ82roBoMTznSIxBp7mtdBpR91MEabwzcFPbEodrraeQ8yNCQ7yQvTnjUvPz0mQw3cSerrLbykSUrKQhDGaItH85JYzE/cxRUL/M9kkAm3swONdIIszBJ1F53z2xIc85qSu2DoG1UX0eMg1/FYFKAxbLlHW2QrA8KYXTsoq3PYw8El/LXqbrHdNDJ6vRSMmgvOr5xADepjQoNOYzxBuXG8mbXo/qKKgulkPF/0jNySK9NCx/RLR1A+oFw+F8ejP7XHuBzDgjdi3QxQPdM9GZ/NhR1yXBoKJo9H5pf12RRT3iJYYZNkUwE6dP2zJ7tau5XAjvGPDvqAHZ3JDhPURlXyGfbvJBb+tE9W0QEWfHzgnlEaB72bCQf4QhNPyOM+dfgBGApjLeib+zi9IHqy9ce6ZdNQZ0Rl/q29Pp+7CgymMOPvSDpYPRP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(54906003)(478600001)(6506007)(7696005)(53546011)(5660300002)(7416002)(26005)(66446008)(66556008)(66476007)(64756008)(76116006)(66946007)(71200400001)(9686003)(316002)(6916009)(83380400001)(52536014)(8676002)(8936002)(4326008)(122000001)(2906002)(41300700001)(38070700009)(86362001)(33656002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nWVGmVgJIT8XXdbWyGhL6hiqNn4Y06JC9gOi56RUIzOfLbrwtRw6abizTtUH?=
 =?us-ascii?Q?It1GoAHZ+EctzEeWItAkVNszQyPr7kj6uJm0Fu24XzWarMGYSxJRjYSvKIsA?=
 =?us-ascii?Q?Ed1wMGl1PXBiVLjJvztGIpRlBJwOmo0xSuHABe0M6Pu4LjxPb/W8QcpjioLs?=
 =?us-ascii?Q?N5Qggd0hYM7Sczx5Ze9rQUIpSs9djEcgLyqIaqz5G0SfjDyXDbX1La/kWciG?=
 =?us-ascii?Q?jEvuguJU/EoP7kncGMBOa5OWv/5DFxhlRkdFsy0z4ancYpHPb+leBK5mJ9tM?=
 =?us-ascii?Q?51/OkIfWguti89rnUM9L6kMFAm/PhudiHEzmIFoQV31akoyf81SN+xUGUjHG?=
 =?us-ascii?Q?h4s4fqxhdy8BdPdY67FdK+IKDUs/Kxruy+wXpxZt0u9p6LWZkO6JLnzGJQDn?=
 =?us-ascii?Q?H+5UJI/0HD3bDBCHNYDNOJsQP+InK7xvnmFQJ79YVshaPJHp5unXjlVieaGM?=
 =?us-ascii?Q?MVAhZ/4KURXZ/v8wnKNqM9PXUirpZCIS9Akav1Ho5IcZAwMwZscbFNgCBQ9G?=
 =?us-ascii?Q?cS2U0N9hJgICLr1sUayXd01aTukA4+HyGL09X2WezHApOhZUgxDyujIU6bOJ?=
 =?us-ascii?Q?hPqTFWKOU1aeGpRgQooQPxEDq0oocmV569EhUzaZJEEFmPJ2Pll8KaoP3ccs?=
 =?us-ascii?Q?p+mu9WTPyWQAkN2IQBXxcE8TI0Btf70P7qUnkh8LKJFcfqFIjeA0sb5YHfv+?=
 =?us-ascii?Q?OJiqF7jqURO8Qq7GEjlFhkwNUo7/Epmvucu/bvFQfomQxx6dBYnp4pQlSag2?=
 =?us-ascii?Q?nbvnnp8aeMbk2xCmziWUMTNljcdgA+3hlEGnRS+DV9tDCwcL/p7JSbyWSNf1?=
 =?us-ascii?Q?zPbTUW/WgCQ0GWtl0snp9zdutRa65c/QOptwRvFf7wGRbF1/xVJK9KPj8ECD?=
 =?us-ascii?Q?eBLW9HZt8vW6pvupCtlSmExiHTSqI9ZzJS8UNcjiLfH+VmBJyexai3HMvIiZ?=
 =?us-ascii?Q?7cWMgKrfI4iwpuJ4vbg0CYZVfoCP0knmSn+3BicaTy8GEakIvPedt/0CjWGD?=
 =?us-ascii?Q?U+jXekCovvCHo3BGGMOHCzmrshIUrGlAl7hNommjzBrrqIAuMosaWmN2ZFkB?=
 =?us-ascii?Q?LX3rGNYxLY3tzCrWDADJCQi+sYRpnYm+lf7R7SgF7+uvZI1Q5a61ryJfUsLE?=
 =?us-ascii?Q?4dF9XnXC5O9GuxL7t4WEJ5f5GK+pr3a0p/L4VSOoeajJvHfEGZZs97gL/y0x?=
 =?us-ascii?Q?AEx1m3WOafkgu2gl4SMKC7cyGKIOQuVVJI30n4aav4qIjP2GMmhJUm+0AKXP?=
 =?us-ascii?Q?1BJMuB+ZheBCQWb06bJh3D91BmbC/v/qNLcKmV1+SLoUr54du8CNZ+hKY3SC?=
 =?us-ascii?Q?E6mOQ/u1rK+OP7lWnj5Vc4vj0riJoDtgKdfy3elMmE1uLQC8CD767wuzgt4+?=
 =?us-ascii?Q?rfqkltkiSqbCueGAe8ovhg8MD84RRuIfVhSnX5mQdv2q37chFyVTrCZpzSFt?=
 =?us-ascii?Q?Jw+hZmiGjNN7bvUjTIE0XP65VaenVz9JcOjptMU2hcEyaURtAec7FLFjuQFp?=
 =?us-ascii?Q?Ux02/W72yUWNgrrpSs4bSOAboprlgLRZ212gw7yZnLiVXwVL9Cc1li0uz30p?=
 =?us-ascii?Q?rzbQtdwnUv26vRVx7DrQJTt4JD8rbrxDCpMfdUoIjIuSNFcOVxanneIXftPd?=
 =?us-ascii?Q?nQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3822248-b37d-4cc4-cd74-08dbfd7513c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 13:52:28.7335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MnAowD7sDYvdsCweUNBnidaExJPqFzMFIogd7O7yyxcjlCMjEJ8EodzNIPy06tPQECkn4ki1OErxRjKt692Mf0zp8FPethLLaTeFQd83Pj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10408
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
> Sent: Friday, December 15, 2023 12:58 PM
> Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> On Fri, Dec 15, 2023 at 11:37:07AM +0000, Biju Das wrote:
> > Hi Maxime Ripard,
> >
> > > -----Original Message-----
> > > From: Maxime Ripard <mripard@kernel.org>
> > > Sent: Friday, December 15, 2023 10:24 AM
> > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > >
> > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > Hi Maxime Ripard,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > -----Original Message-----
> > > > > From: Maxime Ripard <mripard@kernel.org>
> > > > > Sent: Wednesday, December 13, 2023 3:47 PM
> > > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > > >
> > > > > > +	 */
> > > > > > +	rzg2l_du_crtc_get(rcrtc);
> > > > >
> > > > > That's a bit suspicious. Have you looked at
> > > > > drm_atomic_helper_commit_tail_rpm() ?
> > > >
> > > > Ok, I will drop this and start using
> > > > drm_atomic_helper_commit_tail_rpm()
> > > > instead of rzg2l_du_atomic_commit_tail().
> > >
> > > It was more of a suggestion, really. I'm not sure whether it works
> > > for you, but it usually addresses similar issues in drivers.
> >
> > I confirm, it is working in my case, even after removing
> > rzg2l_du_crtc_get() and using the helper function
> drm_atomic_helper_commit_tail_rpm().
> >
> > >
> > > > >
> > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc) =
{
> > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > +
> > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc=
)
> {
> > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > +
> > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > >
> > > > > You should enable / disable your interrupts here
> > > >
> > > > We don't have dedicated vblank IRQ for enabling/disabling vblank.
> > > >
> > > > vblank is handled by vspd.
> > > >
> > > > vspd is directly rendering images to display,
> > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > called in vspd's pageflip context.
> > > >
> > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > >
> > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > reporting is going to work. Could you explain it a bit more?
> >
> > We just need to handle vertical blanking in the VSP frame end handler.
> > See the code below.
> >
> > static void rzg2l_du_vsp_complete(void *private, unsigned int status,
> > u32 crc) {
> > 	struct rzg2l_du_crtc *crtc =3D private;
> >
> > 	if (crtc->vblank_enable)
> > 		drm_crtc_handle_vblank(&crtc->crtc);
> >
> > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > 		rzg2l_du_crtc_finish_page_flip(crtc);
> >
> > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
>=20
> Then we're back to the same question :)
>=20
> Why can't you mask the frame end interrupt?

We are masking interrupts.

[   70.639139] #######rzg2l_du_crtc_disable_vblank#######
[   70.650243] #########rzg2l_du_vsp_disable ############
[   70.652003] ########## vsp1_wpf_stop###

Unmask is,

[ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
[  176.354922] #########rzg2l_du_vsp_atomic_flush ############
[  176.355198] ########## wpf_configure_stream###

Cheers,
Biju
