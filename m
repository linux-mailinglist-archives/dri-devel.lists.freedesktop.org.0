Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3C8146AA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 12:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822010E332;
	Fri, 15 Dec 2023 11:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43310E332
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 11:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JarShhxYSsSiovaDvghTF87yc/H+bxfr0D7d9xfkp2BghUaSvZgptUCBWvsmmxISRJKducYJD/iald/gjl3TvkKmm7izrwtCIt8w7cgM5DCuIThW77mxXFh/yoic613GPQ13rUfdWMJtynNoE08CiIZSDdAkIfvcEW9Ewkb5s6q55C2owkbFUflIREqbiM8ed8oR8K7gvauntvURNmnMeKBGI8XYgxVcdM0NHq0HDBRF+dH67QFz2pqqRvCasiMhyknSyMpJrV76UyEPAX4SRDVb1dXroFAALYeBg3Nhzyg5rC8K3AoRb3K3yxP/lSxmR49khOfAwasHi3ylt6VQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfVsEYzkkkbU2C7GiHXlR9n/xOUr6vwfnlTqte5j7hA=;
 b=Akrqt1dsMTh3xz8XBcigN/P2rBEXeya5FgSYY2pT+FSuuwyhtexzNYyG9KQqbL3ypF88Jhww4MKJlXL12U5aq660KfpBPBd2jricL+Bi7gdaHYyiLNr7j/4ae1+T3OObD+0YojNXcutWv7U+TjF9JkBNnoOC65M9JqH23UxG+zqEOhmtm5neWnt7KiDirKxuQhqoN/ikk1Oi97vHVaIhkJpcI8y/yV/TS/ZHyHVw0g5IDhlLMFX0soevFIQ/AEzxcmIUmomtbdDPMmPyROTMMm98pPOjXXWPTi5WmcVBc6KJiqYxFGCvMLYnzvLiXCLNAgqBQjrnVNQUoer53nUKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfVsEYzkkkbU2C7GiHXlR9n/xOUr6vwfnlTqte5j7hA=;
 b=L3CEFxYkQxp3FvkooqneY1A1anx4ZL7XKksh2olCivJNx4Y9Hc8VSbyXpf6m16bsXklfcme7utUM99UtJSMMrJ9IJBnHMaCRS+TNBlhnj9m1o4Ili5LeS+n3rVJge+cw0ieZbgca2FuAAVj6tT2cCxKds2TMcZdsmeXkJuQU9ew=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5481.jpnprd01.prod.outlook.com
 (2603:1096:404:8037::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Fri, 15 Dec
 2023 11:19:16 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 11:19:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAIbOgIAAt8VAgAAhsACAAB96EA==
Date: Fri, 15 Dec 2023 11:19:16 +0000
Message-ID: <TYCPR01MB11269E63B4CBB97576DBF03F68693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYVPR01MB112799FA3028E651D8BC9AA1F868CA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269E2263C8D2A14F94CE50F8693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <jxjqwytay24p5g7rl23asjucbwswpjyw3znrbu6z7eigrvl7jy@5vxwqtgpg35g>
In-Reply-To: <jxjqwytay24p5g7rl23asjucbwswpjyw3znrbu6z7eigrvl7jy@5vxwqtgpg35g>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5481:EE_
x-ms-office365-filtering-correlation-id: 63e3700c-cca8-4641-a562-08dbfd5facc6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 47sWKBxbcm9KIMNrhWkK4VcNkmN99U2+bp7j3P9m8o39QYM5+PlCIaUDxiaBZXBImN5NP+aZyJwE6AnG7pzwjfpw/ADkmLwdb1+JxUnWeeAYP2AWxbbkhBHKERQt5tWil6jfQZ0UTMSDj+p9ldwMj1E/WICLx4c3i1nlOnTuXhgk/CWcBepQcfcKAZBzgMEm23/Sz7ITtgHg2ulmQ45kcxr8fIIQw0ay+rfuVT5rCgIcdDXmGDhFOVlNlq9M0j8OI9lHbVhVPZ54tWM730aocEZoYeafEsksnTqbL7k4nnAXV60Gnad2cAJc3i1K8zdv5ec+ekkshQwCN4q/u9/FxU5idLiQunv8TKx6dIdZ/V6BAjuzBhwT40N3fJOI4Hk8BkjLJmwWdJLFvWdY4Td1Mzv3H82NZVl+pRdI3E2kQof1NsHWfdL6mg3K0CGJTL5XnjjEXCrJYN5Rc7PmTPA7a9gQN6QKQy+bX04OM8+lIXcQLAtJHgG/N2zLx6p36YvV7wDsJ/OAYlwr3UoINVAHpWGA7eHCxTeeXlJ66nVBtWTglOeeV9FRpqHHZ2UppYTCYMn8KpcVuRwequ6xaEL0X+OxMF75xtZmmUbPiBXm1lcaj7pjL3u3x0P8ncwosk6G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(2906002)(33656002)(86362001)(4326008)(8676002)(8936002)(52536014)(5660300002)(7416002)(38070700009)(41300700001)(478600001)(83380400001)(9686003)(26005)(71200400001)(6506007)(7696005)(55016003)(53546011)(66946007)(76116006)(38100700002)(122000001)(6916009)(316002)(66476007)(66446008)(64756008)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6y6mb+Xoq/nAXW/IMj92pX6mrcFdM8eR2fXTXQG7CewAcip+99aaBH9snJVm?=
 =?us-ascii?Q?wRcOgrTxufkI7T04TSfmblY7ysUPbIxidtfx2SZ5oBlxog4w78K/KwYbqtTE?=
 =?us-ascii?Q?ouAwZip6XOyj4wONhtE8wx3tQeVShk6171sHK/I54TY6JlWkSLZl5Fm3zR30?=
 =?us-ascii?Q?ZAnl47dfvrtHWOP7RDEAxfWLHNR38L97bGDWKthLUWoaOa+KPYr91NZM3Pa6?=
 =?us-ascii?Q?1PiRZV5i8EOj+KjefJe0zaiWmxhHlwgqRIVa4KhgcvPT/+rjzdhljoGV2DQp?=
 =?us-ascii?Q?FvLBZBJGCK62Qcn+d+oNmN8WExsYPpHudQYW+Z1Mew7ltg9uvSkLMU6qblk0?=
 =?us-ascii?Q?jyDxHC5ZnVsKLVFM4j5VR/vWm5ImZvZBBWEJr3swJsTGkuRuXmvLb3rqMSVi?=
 =?us-ascii?Q?3JLp+xvMMv+Q/RMRLmBwCrveqL4gxbWH85OVqBnfZW2m8JGB3RcvzptnfPRZ?=
 =?us-ascii?Q?vr2LRHUS1IYtmakJGUM0/Tfwhik/WAZezNFxzxG2hCMIHcvvme7IPa4cadDX?=
 =?us-ascii?Q?WMcIg/ql0vX7s2g673vO9fqO/GXPpWsYILgPDExtIH4FNr3i0efmlyddY7Kp?=
 =?us-ascii?Q?KSIyW8tZ1IOj6DNv006rumBc3vSCSODPXQn5AkEulwC2v3CiYjL37YjPtZVX?=
 =?us-ascii?Q?DoMqeN884sYPJD7u8Jyk5uoo8ygTzk0H58WSHmiy5BwA6Z4VXsBfl7fdTtD2?=
 =?us-ascii?Q?asmH4pEEwXPih7RwAeb5TSV9rAd+oSfCjkKhrsoMIvk1KsNWdxmi+SYJdCrV?=
 =?us-ascii?Q?Iu1fo3cLEISBzHlS4vtBx2CzlkIVFO5tmAN2kmDQBBGi66+Q6pl9m7jrLDmc?=
 =?us-ascii?Q?102xsChvYmG4SI1ohhoM63mKLpDxZH/DhWhfb/WUG8w7EaToJoEaSqdRlkA7?=
 =?us-ascii?Q?47kNY6UkLtkSPH43eB0Iv/jnq9ZvgSyYuj46OOOA3OV1xp7Nf+Uu86E/e1lv?=
 =?us-ascii?Q?G5zZgKTlizLU2Ug41UwrELuBJCHZYEnoQeII/5TU9lngMUgS9FetNNK9ogvg?=
 =?us-ascii?Q?Gz49QIl64AaWCFtullEC0wG2t7TNs8sO9jAMEo7shNggEpvrMkWY0Kqu/7cY?=
 =?us-ascii?Q?YNKmxSonjF4MG7RohuRj6h6FSLkpQ1Wv8zT+1KwtNFU+84DUIv4omsce4XMJ?=
 =?us-ascii?Q?3cbhTWWarmTKh7qrWks4vYQ8PwVRn/a9WB4quuuaimbKenCBP16bF0Z+Zyed?=
 =?us-ascii?Q?k3MRxSRwa5EBD/zKy03MTVO8JqaEcTmvioSSHGz5Ijpi9YKT5JUS9WOXUI4h?=
 =?us-ascii?Q?bsZZr6hgT+8vZpam4DWOARO7yv1z24W7/x071hM9Kp5MDRg2oAXM+dDfzSTr?=
 =?us-ascii?Q?83EIRhmydqpMMS4Z2D2lf89sBxwom8aIZ57CszW0UXjYZiRHOgiG5XfvmrEC?=
 =?us-ascii?Q?bULGPRYprKqmtQrBouMIC6TbbrdjDihSa7gldzTt6Dd4ENFuM9jOUtEhfJPV?=
 =?us-ascii?Q?JzrQubEHhjkfTWsdaeDRqhAJ5ShGswy++wZmQswuahN9iC5+a8tE/IiG1Bu2?=
 =?us-ascii?Q?bNBbNxOjhkg7nL//R47Qdybi0KLRzHAJaC9/+cArq/UGWZH5QODnI41uIUPb?=
 =?us-ascii?Q?u9ndGPhA03VMwNEfzRKdbSPzsC4TPpHnk+/GjI6fdBeqrOLaJsWe1T8NbKXo?=
 =?us-ascii?Q?6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e3700c-cca8-4641-a562-08dbfd5facc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 11:19:16.5413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWTGCgdBdL2+CemAPqWxxkiTqY2ifN+e7wA8EcbjEjDGZLell8D3o/7ZCbHLDeteeGdk1ikdqQd9ozi3vouIYBmvuQ8eWAx20fVXKuqF6Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5481
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
> Sent: Friday, December 15, 2023 9:25 AM
> Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> On Fri, Dec 15, 2023 at 07:47:07AM +0000, Biju Das wrote:
> > Hi Maxime Ripard,
> >
> > > -----Original Message-----
> > > From: Biju Das
> > > Sent: Thursday, December 14, 2023 8:50 PM
> > > Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > >
> > > Hi Maxime Ripard,
> > >
> > >
> > > > -----Original Message-----
> > > > From: Biju Das
> > > > Sent: Thursday, December 14, 2023 3:24 PM
> > > > Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > >
> > > > >
> > > > > > +
> > > > > > +	for (i =3D 0; i < num_planes; ++i) {
> > > > > > +		enum drm_plane_type type =3D i < num_crtcs
> > > > > > +					 ? DRM_PLANE_TYPE_PRIMARY
> > > > > > +					 : DRM_PLANE_TYPE_OVERLAY;
> > > > > > +		struct rzg2l_du_vsp_plane *plane =3D &vsp->planes[i];
> > > > > > +
> > > > > > +		plane->vsp =3D vsp;
> > > > > > +		plane->index =3D i;
> > > > > > +		ret =3D drm_universal_plane_init(&rcdu->ddev, &plane-
> > > >plane,
> > > > > > +					       crtcs,
> > > &rzg2l_du_vsp_plane_funcs,
> > > > > > +					       rzg2l_du_vsp_formats,
> > > > > > +
> > > ARRAY_SIZE(rzg2l_du_vsp_formats),
> > > > > > +					       NULL, type, NULL);
> > > > > > +		if (ret < 0)
> > > > > > +			return ret;
> > > > >
> > > > > you need to use drmm variant here too.
> > > >
> > > > I did rebased to latest drm_misc_next and I don't find the
> > > > drmm_universal_plane_init()
> > > >
> > > > Can you please point me to the API?
> > >
> > > We cannot use drmm_universal_plane_alloc() in this architecture.
> > >
> > > rzg2l_du_vsps_init() stores the VSP pointer and pipe index from DT
> first.
> > >
> > > Then all the planes are created using rzg2l_du_vsp_init()
> > >
> > > CRTC uses VSP pointer and pipe_index to set the
> > > plane(rzg2l_du_crtc_create()).
> > >
> > > CRTC->vsp->planes[rcrtc->vsp_pipe].plane
> > >
> >
> > Thinking again, it is possible to use drmm_universal_plane_alloc()
> > here
> >
> > Introduce a linked list [1] and use an API [2] to retrieve plane by
> > matching vsp_pipe index against plane->index.
> >
> > With this we don't need drmm_kcalloc() any more.
> >
> > I will implement and test this and send v16, if there are no comments.
> >
> >
> > [1]
> > struct rzg2l_du_vsp_plane {
> > 	struct drm_plane plane;
> > 	struct rzg2l_du_vsp *vsp;
> > 	unsigned int index;
> > 	struct rzg2l_du_vsp_plane *next;
> > };
> >
> > [2]
> > struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc=
,
> > 					 unsigned int pipe_index);
>=20
> Why do you need a linked list for? There's one already: the DRM device
> will store all the planes registered in the DRM device, and you can
> already iterate over all the planes with drm_for_each_plane, or
> drm_for_each_plane_mask if you want to reduce the scope of the iterator.


Thanks for the pointer, it is simple now.

Vsp->planes[] aswell as linked list is not required using drm_for_each_plan=
e()

Cheers,
Biju

