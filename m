Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D886DC947
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF3310E151;
	Mon, 10 Apr 2023 16:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E12B10E151
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 16:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3faHYVNmnYkweQ/cyR9jZdNDyU5WtOGhH2S+VJz8PzcT+D7RObAf0KLtX2770XzYwcmlJrzjhC+rZqRt5dIXne+tekhI1x4fd1TCmUca0sGdaZYEl2bnGdKSJDRpp6sCAysj6JiPpIyjv1BuhhMaptm4Be+uMDOYvwCGqCISyfnbisHvN1gyPV3+Qw4GkDdemheziB97YjxRatk/2fwccPV6kHisrwtoS5bQG4WksnbGmVKdqJEL9kD8UN8+lv9gepou/V6V+OmiNxgCY9VymUDJ6zO/QeLpgldilwIKzjfcaGvKWursPsc8C9OFKzl0CmmvQL8lQ8PcHcjBZvvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj9MLQIx/hKOh/GKccPafmV8seDIfySY4WVDj36t2xY=;
 b=In0uxSkzIu/r56ltLpGJir9/AGHw3Q4XM+U9u0kNeJP/6qjRJvC1cxLHhdfZ7JUv/KyqdiFN/Gyms12ckJu7GF5I+rStiy5uDFtVER0GkvcenJA3cQlhjNaMDmxXRd8hrknmuA2dW3UWFptA/Gb2ZU5fdrtmkAbhkReyLbBp2ab6B2s1gLT2MKn9T9fD9x5MaAOB7j84WQa62QUslFROdmu0FqNSciE/kxH/LEebtE62xj6Ea41AW0fDjVCsYBlGPu5cGtbXDhIskz35tdip1XRIFIaw8MV5WNTLjx+JwSN77ojconPMzWi1WrPiA6PYT4Hc4J+JwXUZd7EmWljA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sj9MLQIx/hKOh/GKccPafmV8seDIfySY4WVDj36t2xY=;
 b=fWX5WNzdcbtMvZUO996o3sjAJVqKE8kWQlfmAP33oIJlXXSdVAaQXCDAMM85kKGydU5sfhvd2sYNrNXDSx1AanJQwzTNAFv+gqYujTW3P1QZbax0cn7+3ffQQ2P2NALj8te2PK1Isz9nZSPdLCtuIq4tTIrzkueQ+AwlOL8Tt3E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7708.jpnprd01.prod.outlook.com (2603:1096:604:179::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Mon, 10 Apr
 2023 16:26:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%6]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 16:26:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: RE: [PATCH 2/2] drm/bridge: adv7533: Add option to disable lane
 switching
Thread-Topic: [PATCH 2/2] drm/bridge: adv7533: Add option to disable lane
 switching
Thread-Index: AQHYM8fv0yOVdmo1BU+9U/dgwwp1qq8nKruQ
Date: Mon, 10 Apr 2023 16:26:53 +0000
Message-ID: <OS0PR01MB59221A41F36F093C60B7CC9086959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
 <20220309151109.20957-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220309151109.20957-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB7708:EE_
x-ms-office365-filtering-correlation-id: d9087011-9bfa-48b5-e60a-08db39e064f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AgD5Pr1MFih4ZqG+ievGRHGzz8RktYM8PGvKE89JmZbWXfarb/LFlxLwVxsMoeybYyVnO/qyrrjtFvHDc88YLR9wLOuzAm/QNtK109Mg8vT0R5Fbv6b+6+GtMbW7epen2sPy1wk4yaawuTJnhtVacHyLkcgu/QJ/GQU0CI07nq/sbfEXQqzNI9tyJ0q5toluQEhxC+qMhhlTLTDT3CE/2BnkWi6IPhl0z00d47NsuPZD7DDWKVvqJwdunbEk6Y7AsruOzuYncla/KhZTE7KBOqPZPIH7WB+BNfdrmdwJGqKDXYHgIvDB+0FLdkujjsNXadF4Y4ojn7gI6Oym6bpisREVRf4kwNdOYhMeqbcPlyHlm3/nW6NZhKAMp2mTl4nAQjUe0zk/3FIjO+ZXe2EauhE5DksazTOz+AJPc7TOpNThhDDsGqVzSbaLl6LkObGpZyQXdV23LWqKHtC/d64a5hlj1i8sA+VlLgWO/JCrDr9d/W9x4A3yL0kcLl0qKM7oWmmknmUwq8mQdd/rVMJ0Vrm+LFOUPZa+L5R+RxhIS1woVED+rbzG5/rO1rrXKUblfo078a3kKDanS53CdSp9GmFX4sdX+JGB5zpGXdnTNNr83vPO7S7FTn3uYHyOhf3uR3BBLY8iJgidBa4HcMdRTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(478600001)(7696005)(71200400001)(316002)(110136005)(9686003)(6506007)(53546011)(26005)(186003)(54906003)(7416002)(966005)(2906002)(76116006)(66946007)(4326008)(64756008)(66446008)(66556008)(8936002)(66476007)(8676002)(52536014)(41300700001)(5660300002)(122000001)(38100700002)(86362001)(55016003)(33656002)(83380400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uC3PJ/GDg6sqJ/A4TsROR7oG/Qd26l6e6iYBdWjTVOeOoFTu3rEx1BzpySZ1?=
 =?us-ascii?Q?Vw8KIrsJzwBMt3oYLjnJZhot6h9VO/Tbu2dJcIF0IWVvo4kScha84MW18Xxa?=
 =?us-ascii?Q?xOjuchSOHf1sJ+u6GO1RQrqBfyV7a1NYwJ4Plc8/dOCmGr8e4VjVr517NDJS?=
 =?us-ascii?Q?S4ptnnGksaoWokJQorRDD5YiilSJZad7BFDId/65D3cY6TTgmWSETEsywSmw?=
 =?us-ascii?Q?jh9TAgOP6IX7zVdYCqWERgmxhwtNlfif8jQzYzj9nvLzoCfF68f0TVm7KfrA?=
 =?us-ascii?Q?0DwFAulCjvsG+nPXL6ADYsi6WSVPpNYhuxk+w1rxqwEiHcZSP8xyKAOqCATk?=
 =?us-ascii?Q?zGVyu3wXp0rXsDmgox57MyPVPmcGf7yvfylZc3ULoneul+VebHCTmDUP9O/r?=
 =?us-ascii?Q?OMvWKYyHhnXrO+5DMGztLn6S/EgVz9odFI10q/3N/3TuyIYIlfP3DHussh16?=
 =?us-ascii?Q?E4sbml798/sfPVJOcL97J2/jpL1mQjA7MMl7Oig2evugbs/Poh6JNbWx6P2z?=
 =?us-ascii?Q?NBETZd++4n6Sx56asqVN+d5EoAtOiC1VBm7sX22QdHJMyOxtI4jqvfgY6s2J?=
 =?us-ascii?Q?0hgLLvhOrLj7OTzWGJa0jg3UQgGDc6EG+Et60IEBfgYnMVS5ycyRkjuaOvAV?=
 =?us-ascii?Q?k7WdQyOEM5uRyND7G6aalakj3+5frN6gpjYLtcrkPVcLbuiUJFjB4EHpFINq?=
 =?us-ascii?Q?GO/jq1/BJa/er+QhjAkHgjtKOnuVIiO/aSUUjUTC+LVVarTdqsnXNzfx9nuQ?=
 =?us-ascii?Q?Ro7YJr7fhQ4lEZ5cFkHOFbY6RukCndkuI9Zfat1HIgntKkYvm51BBJICkFH+?=
 =?us-ascii?Q?4DY6BHYz4Cg2PmK8AjAYjslL2KxU0jKgMai7fgNZpuRPFhEppLVDSueTDcC6?=
 =?us-ascii?Q?lFZkycMp3QTxk1r1/O3o2b/YmwbVUvJjDZsTLSNZVEB6mH7+FfZXZB5B0usB?=
 =?us-ascii?Q?SUjsvlwAXywrUSGeZZemd9Q9oo3k2oglbMCsYvaMuR6zgKfgcTI2OZRJlPva?=
 =?us-ascii?Q?fFLHtr8rw2s9lM6naozdOMxrM9VOzGBT6NR9OiUIAkjkHRf+ZtiDhS8a8U2p?=
 =?us-ascii?Q?kowsN+ZPvgR3zura2eCLILeRw5151RnHVXGLNNHUzJ/FnC1/kpZEnsOIyiXf?=
 =?us-ascii?Q?ifSFYh/zAgWY/GklIGqRo/YUVddg2eRdqpBvWdD50U5jiM45+rVSNCpARtIz?=
 =?us-ascii?Q?1B5v9c9pqgAt3h91YAZG1dddrxWsxc+mOkvKZsoRJep6ac2s9pNctXhDjAt+?=
 =?us-ascii?Q?Wx5Jp3K9EXJUlGWZFZagiiLka1O88xUXzA6pU544xy6SV/Vbw2V03bYmqxNE?=
 =?us-ascii?Q?ZffFhp/XJBadARtpWMvNY+n39+P4Ho//oB8xJwzUVGYKrWnSRGa2vyOJSQNP?=
 =?us-ascii?Q?slk93YpRZAUepUKOc6coYHk/na9jvEudyGPzYJ/ymYRfQOK6Ajiw6RT2xl7K?=
 =?us-ascii?Q?VB34ryF0V2fH6By6Qoo5SAQmU5UXmpOG5pJxfy9k+4q+UmHvFPdoEGGDBcLB?=
 =?us-ascii?Q?6UJ5FBjs84ES6g0pXEFfyWVvZDEcNtia80zrSXYcMhd/C7IJsVtsc1dAtz3D?=
 =?us-ascii?Q?XjWiZ1ceCpUXstaYYR51Lo7MWwunw/UW9RVMViy2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9087011-9bfa-48b5-e60a-08db39e064f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 16:26:53.2245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pY4jOzXzsXnwzhxt3oBiYd/Pda5wpqEcdB6+5zIeKC8fnjDIuDhNjthuCxElQwzHa/+S4kNMrsC+Z6rarQ35exx4TB3rRScCaPIqW1rNfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7708
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>, Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I would like to drop this patch as [1] and [2] fixes the issue.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/drivers/gpu/drm/bridge/adv7511/adv7533.c?h=3Dnext-20230406&id=3D9a0cdcd=
6649b76f0b7ceec0e55b0a718321e34d3

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/drivers/gpu/drm/bridge/adv7511/adv7533.c?h=3Dnext-20230406&id=3Dee0285e=
13455fdbce5de315bdbe91b5f198a2a06

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Wednesday, March 9, 2022 3:11 PM
> To: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> <narmstrong@baylibre.com>; Robert Foss <robert.foss@linaro.org>; David
> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Laurent Pinchart
> <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jer=
nej
> Skrabec <jernej.skrabec@gmail.com>; Maxime Ripard <maxime@cerno.tech>; Sa=
m
> Ravnborg <sam@ravnborg.org>; Sia Jee Heng <jee.heng.sia@intel.com>; Abhin=
av
> Kumar <quic_abhinavk@quicinc.com>; Nicolas Boichat <drinkcat@chromium.org=
>;
> dri-devel@lists.freedesktop.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Biju Das <biju.das@bp.renesas.com>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.=
org
> Subject: [PATCH 2/2] drm/bridge: adv7533: Add option to disable lane
> switching
>=20
> On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at lower
> frequencies causes display instability. On such platforms, it is better t=
o
> avoid switching lanes from 4 to 3 as it needs different set of PLL parame=
ter
> constraints to make the display stable with 3 lanes.
>=20
> This patch adds an option to disable lane switching if 'adi,disable-lanes=
-
> override' property is present in DT.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h | 1 +
> drivers/gpu/drm/bridge/adv7511/adv7533.c | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 592ecfcf00ca..7505601f10fb 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -368,6 +368,7 @@ struct adv7511 {
>  	struct mipi_dsi_device *dsi;
>  	u8 num_dsi_lanes;
>  	bool use_timing_gen;
> +	bool override_lanes;
>=20
>  	enum adv7511_type type;
>  	struct platform_device *audio_pdev;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index eb7579dec40a..7f6a8e95d70e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,7 +108,7 @@ void adv7533_mode_set(struct adv7511 *adv, const stru=
ct
> drm_display_mode *mode)
>  	if (adv->num_dsi_lanes !=3D 4)
>  		return;
>=20
> -	if (mode->clock > 80000)
> +	if (!adv->override_lanes || mode->clock > 80000)
>  		lanes =3D 4;
>  	else
>  		lanes =3D 3;
> @@ -195,6 +195,9 @@ int adv7533_parse_dt(struct device_node *np, struct
> adv7511 *adv)
>  	adv->use_timing_gen =3D !of_property_read_bool(np,
>  						"adi,disable-timing-generator");
>=20
> +	adv->override_lanes =3D !of_property_read_bool(np,
> +						"adi,disable-lanes-override");
> +
>  	/* TODO: Check if these need to be parsed by DT or not */
>  	adv->rgb =3D true;
>  	adv->embedded_sync =3D false;
> --
> 2.17.1

