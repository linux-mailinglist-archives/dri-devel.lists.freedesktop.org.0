Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77D5821AA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA7EC2446;
	Wed, 27 Jul 2022 07:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68062C2441
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTd/uWgrVwnVr1RwggL4ojDlrrnj6qUTvxErDA7XmgG9IRjWM+ZOP96Dbyv6CZZIl7GNypVVxzkwkE19IS9a5LRJb3e7yrLY/XVBpCcfAgXOozcNans0RadNDs6tRm3stj+SeHwPyT3m73Y3PNRKY0QQm6rd0xEf0CZB2C5/h1Haefn4TGIttrDsS0HhYgtDfw0jZVOY+/T654qUtUkxrzH4D7qKxZOUuCGWsJRMwGswxN319rSJf13j8DOZJ4nsirUMptbeWaIglCAQKAgQSIACzHW+DAGezfiSzB/78uqiR9krE1Br+RJNjZQUirHNHxyGH3xkLPW44VTYKPOf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZZTl6wxSOvECAFo0KY+zBMdgrbXorALM4cSYg24p04=;
 b=CuOFibCTxr0vGL+gn1p/AOo34mceqNLp2IKOgFL+U96x6kF9yNcgNp41XTTdHO4upr6gcOD4eKMGq1n+abOWRrnOoM4faEi+xzv5GZOOcvzZzfcR+5gTKg4sqruN8Xt2U5hdvnJejmCPz6d7Oiz6pkqtJ+KUAmcVasd2H2tRhbYxxw/4fWcSwbVRkkynkiH0dp16gbyroYIVYZb1VlTsIX4qMpO+xa71I1LZMqq29mc78b2iOjtQOsryRkx11no+tsy6kuy/nuiXUR/XYbehOT4qupFhRbkQy7pWfC9WPR/bP0ZqlcmYabdZMFGtqEiZUMKUy4nTEC4VWhfNfOqOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZZTl6wxSOvECAFo0KY+zBMdgrbXorALM4cSYg24p04=;
 b=JYAbl6e4OWEQlWqYtvokGkd2q4W2+mjJHt2zS6gEGflcRFIjb7HkRKY8RlAEtKiI/hlVkOQXp3Tbgkv/D8d0IqQ81NeJkJaircQXnO7bacu8hovkZX+ExEj5MJeiB4Xwb3HF6HnPcfPsyWFFhnOyoQfyIV3jhB1II/ASTwhz1hI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9346.jpnprd01.prod.outlook.com (2603:1096:604:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 07:59:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 07:59:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 02/10] drm: rcar-du: Add encoder lib support
Thread-Topic: [PATCH 02/10] drm: rcar-du: Add encoder lib support
Thread-Index: AQHYoQ6v/YoyPUyhf0e4w4r4s1yC2q2RanMAgABvt8A=
Date: Wed, 27 Jul 2022 07:59:36 +0000
Message-ID: <OS0PR01MB5922CF91D346622C9633EBAF86979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220726164208.1048444-3-biju.das.jz@bp.renesas.com>
 <202207270934.Cq65wqcE-lkp@intel.com>
In-Reply-To: <202207270934.Cq65wqcE-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6bd966c-a757-4bb3-fccd-08da6fa5f341
x-ms-traffictypediagnostic: OSZPR01MB9346:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k34+WV1yG2MVAw+KBGhpYp1E++LgnY7C2PvxyAWzvqf7PHm0ovSfKN2ez1EmUeo5b7RMOnfC1wRRj4WsuUFGHSIhxm8y/G98SbVD873RfUY7oNrscdk3HJJnOGUuVx6EUerNB4DNinA2ruph+3WdxYlOdiKivUeFpClYnxT5uMdzAhYsnL1kSgsOax4HeaSo5eB+UX1CCgJWYIX1+m4b9WEOAPGdQudNIdAJOgiWXVKc+1OSitONNDZHewE/cfbfdiYK28QfFszamFHl3oYiu815bG0XKKD9qwlD0NzVZQZcxYaXL6smJClq0zvoXz1NBruSPVFTktQyAsKfOfpjy9JZvV/sQ/YksGmNfXCRcelVbey2T6GEG8BSSNoEKg+w1GEiJXxjs10Mh1irg2UKMJzyxct2dGLiC+vEdFy9riFOUWkK6s+dXPaouMD+PQFCPSdfqhRTx6gRivFh+hTW/dPKzm+FF+aL25ZCgZCXSPsjrSe6pawhh0lvrKQUzvBGtXlJVm6CezabQ4tMHDEPYnIr/QZZzGvOm/GOjcW9E5q1YWJmHtuJJvyusgPmDL83yr2BzSYdwTQAZNrtCIIWahiH4Opc0O2YNAxnT7SIOramM3uoL5kx+8nwSeRW6npZt2U8zIojuA4dZCvcL0UloKxeBpjeBaSUaT14sR4gGLpcSytL+PpPe3wiL3vJqspFM58t9jfALpx0uKL1QErB4yCmmieOIH3AzujaIq9Vnkvqrd4LNJhZ4S7PwGFA8rNrM1XGqMmG9e2OyX7GcpPDZHJS4rVMw5ObOZZpNsQjm6gWq3Cvqouzw7Fx58dFaRbv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(83380400001)(52536014)(8936002)(7696005)(8676002)(41300700001)(66446008)(66476007)(66556008)(76116006)(4326008)(6506007)(71200400001)(38070700005)(478600001)(316002)(54906003)(86362001)(38100700002)(110136005)(33656002)(64756008)(122000001)(9686003)(2906002)(55016003)(5660300002)(66946007)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xx08E5t3luIWWg2vlCfuJmMoc+ivvUqafkWRrRs5XZi1SieCMTz+b0jR31mg?=
 =?us-ascii?Q?AMtiZqzWnNjl60ThHDqOkUq0c5JjG0j0sFWfxBfpJF65FAgflSbkPz0T2xOy?=
 =?us-ascii?Q?XxMfV50jC7CEWWhMYXzGDjJXhPpNBNjbySnT3QOlwI4MCU4JpIk/AhjI2WUU?=
 =?us-ascii?Q?jmL6lEK7hjPRnuYAUtnTG8FyrOwIIXucwwH5bLraGZo/uC2N3dJf8aICbydN?=
 =?us-ascii?Q?av2fLh37avm5/BW52wA8NsToSAMRFY5+JHUM5++nanyF0uiGSrswLhA2mtLC?=
 =?us-ascii?Q?0tWbQi+LM4ng43gaFPm4qAR/M9UNVDgNyD72ZtJUbJdorSB3BCWZMci/3AuM?=
 =?us-ascii?Q?eIK8NwKpmV78t3JhC916IH3VgUIuAuE+FahQI7NGW20OmbEhml3nQ3p+E42b?=
 =?us-ascii?Q?IF6mfbgs+cqnUYjXer0AiilVETN5ftbUCej5ZaLWgGosDmFO9D2K7OE2tuVU?=
 =?us-ascii?Q?itOghhVJLYRklDsTQZk2RyXp5j5JAvS3IFYikCVAn6Rm7vXsDsuF9lf8gEuM?=
 =?us-ascii?Q?QWTHsoV9XnCLk2NfNbih8wHL6XrOpBIg8x0Do/Dz1qn4I0wzITGVFdXz8o5k?=
 =?us-ascii?Q?FIL0ESiO/UmRJpkmjbAF+UTObzoIHC42UkN6FGrUKtT42vvkIAEemd9DH/tQ?=
 =?us-ascii?Q?jqLV9qmgzZqHLQWn8xig1XcTcDcOqbC6BFoqLtYNtu1kTGmpM1BwHrafvqcs?=
 =?us-ascii?Q?KkmUs5rO0Q5QLQomAnXeehfFS3hDvonPcHfGs6E7IXeY/pFdk1/ndBQdepOh?=
 =?us-ascii?Q?Z33BorJa0GQU48Qyrruo6H7d+feoBXhqnoJOyuYY43g9l9VxPnlag5Bc5n00?=
 =?us-ascii?Q?gtyP+qwr2Au8mppPN3TKlO2eGT8qQ7ucAcO/LV/VswVZVfABgjopFeqKMWFF?=
 =?us-ascii?Q?85aWjV9IxkwspgiU55wtZexwW3AXVFfmR6iKb3PgcDleHS0vH/JJjBLRnWPX?=
 =?us-ascii?Q?0tsd48WJ5CgQBH1ilu5WIGa/YNKzL+xWW54CblY3fa1JdZq5EAjUuQ0+awA2?=
 =?us-ascii?Q?vS0iOu19EEJciFOKGIXCUnsvKjHMLeIl+uCGyRzW6qj4cwVnPnMOiefXvRU1?=
 =?us-ascii?Q?xN43q5HWbEYw2gtWRR7TLfEywaKsnFV7YE+ryQuIBICsYTgwYcIXaXHTvmqQ?=
 =?us-ascii?Q?Uor0VPWbzauiAfSEKIe4r3SMVIDVItSfRy9J4p/fcF98vEQ/IDWYzacdTQEG?=
 =?us-ascii?Q?OWYyPcWGqhHzkpIy325PQWxno9G8wktbYcCsb/l0ITpfQJ1eKAt39oXY1CQv?=
 =?us-ascii?Q?7T3nscatsU18qMT+JrgoevpvZsYGxpGvijW0+PwsQ6PG57OBXF6WasRVuJWC?=
 =?us-ascii?Q?8IhUgw/f476hYXqYz5nFruvVyH8s7do9MaXjkmS5lDLFNNxAtlpg5C1ylInV?=
 =?us-ascii?Q?Qhz1usRYKdYn1NiV59W5qU+Mp0ppHWJFEoSBmMBHiOq9pSRS0FaFumwhhA0Q?=
 =?us-ascii?Q?Jnl+n/7pbclJo8OjRXeXe4Z0hupDj1ry9ALr2Z4Me2S0n5Xp7x0bgQG9Zu5y?=
 =?us-ascii?Q?LDwYtQqTBM7Z5nKnyjv1OBk7G7yRbBuATNNr6Gm84YhtLCuMPqUrgaFfK9L7?=
 =?us-ascii?Q?VpD07QB2jQlinergHU7AWI4tZWsfCO29TUivNXxE6BZ3yJ0CPi5d6DYBVHU8?=
 =?us-ascii?Q?fQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bd966c-a757-4bb3-fccd-08da6fa5f341
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 07:59:36.7352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J8OdFV8rlCZ87q3M3WBMVOtXqNEAPvQUq3w84NBREHAFQ74xw+gfTuYzwnmf3FTlVVXBkgkwoKfu+zOMSpD7yECKTte/VX56ph5RxdrsmlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9346
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Subject: Re: [PATCH 02/10] drm: rcar-du: Add encoder lib support
>=20
> Hi Biju,
>=20
> Thank you for the patch! Perhaps something to improve:
>=20
>         wget
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss
> W=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash drivers/gpu/drm/rcar-du/
>=20
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/gpu/drm/rcar-du/rcar_du_encoder.c:20:5: warning: no previous
> >> prototype for 'rcar_du_encoder_init' [-Wmissing-prototypes]
>       20 | int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>          |     ^~~~~~~~~~~~~~~~~~~~

This warning message is because of the below header file=20
change in rcar_du_encoder.c.

rcar_du_encoder.h-> "rcar_du_encoder_lib.h"=20

Will fix this in next version, based on the feedback for the remaining
patches

Cheers,
Biju

>=20
> vim +/rcar_du_encoder_init +20 drivers/gpu/drm/rcar-du/rcar_du_encoder.c
>=20
> 4bf8e1962f91eed drivers/gpu/drm/rcar-du/rcar_du_lvds.c    Laurent
> Pinchart 2013-06-19  15
> 6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent
> Pinchart 2013-06-15  16  /* --------------------------------------------
> ---------------------------------
> 6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent
> Pinchart 2013-06-15  17   * Encoder
> 6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent
> Pinchart 2013-06-15  18   */
> 6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent
> Pinchart 2013-06-15  19 6978f123776594b drivers/gpu/drm/rcar-
> du/rcar_du_encoder.c Laurent Pinchart 2013-06-15 @20  int
> rcar_du_encoder_init(struct rcar_du_device *rcdu,
>
