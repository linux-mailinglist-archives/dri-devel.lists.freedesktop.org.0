Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF57EDF08
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D33910E5C4;
	Thu, 16 Nov 2023 10:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14AF10E5C4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K36CKoU0aWRxr5nL97y+URbnmcR6/TyowlWhHCD3tX213nWuLiOqqe5qw5mju5IIBSa4eatY/XdvlgXcwqkXkoJqay3PJFEZ4E2V//YVxAtPYr7dq21Q8Oxa1wCb9f2EcJzZA1swKiKcpjdXuGsiK/xKHFwjoNkuOM5naCs9rCttI/hHYubT6vrzWlrOJYFc7MbSnq60EpEckxMQITrXxUGgWvB4Gs8DvtmLcb5zV+I8PMFkorzk+r9FOVUawITWR+h55Pl1d3Qyhzd6mWLum0Xoz8j3Z5YMjo8rxWVM5x8uDHfenPMjkX1EonEh1/8AG9xTfyN/hj4A6LrcM2XsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luf2XcQNF2CVuToAXAL/rrKOKx0RwaUjuxVLri2wMJ8=;
 b=h0I2m9ZazTF3FnEJuKj5JqK4EUAivzHoEDqPkYpO2VScZC0Zj3IGdFUas3EATXf0rIqolwSA8QlA43ONs+nLsv7sajjvOkaW0ZjMFjEXvg1YUrYLHWzaXXTvFaAqNcqn+XP0kVplN5XgaYfSBAmkYuBeYlhFT9FwBaFifQp5TY4oWnxBExyiN5WtbqQPP0Vmt3oDpEnaYvzIHbcBb15Q/8vHvy4qk33ZhksgyADuDrXGqYo+wnAi/ZVOOdPgSEweuXJwJ3ar4hp1ijzJ0gBMH4sc9k0XYkQGzY6QlC4z1BSe08jii0uM/SGjLJMEosmt6mBDZO2VCKON1FCRHA5POw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luf2XcQNF2CVuToAXAL/rrKOKx0RwaUjuxVLri2wMJ8=;
 b=Nt4t4nqpM9WIlzx7dy6OKgXAB4humm0FhQFZsW30T+yENWue2rkXk556rRkByR3kbUTJ6MfmV//x9UM2D4tU3RPCrJQTV7cAxJM+YORT6f+FJAjuaQXFf7fTGNEKCV72Ulo27a2Ui16VF3R2RrkE4FByPKC0FuXq1/BXWHPDNPo=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5857.jpnprd01.prod.outlook.com
 (2603:1096:604:b9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 10:59:00 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 10:58:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment
 in rzg2l_mipi_dsi_start_video()
Thread-Topic: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the
 comment in rzg2l_mipi_dsi_start_video()
Thread-Index: AQHZ4KanEtWnGVO/fU6nMuPRdmyQgbB9NW1Q
Date: Thu, 16 Nov 2023 10:58:56 +0000
Message-ID: <TYCPR01MB1126962629C0E20D78BDE8C8386B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5857:EE_
x-ms-office365-filtering-correlation-id: 7e5afc18-a3bc-4343-d740-08dbe69307ad
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6rjEuHzG46GJLk1sPEyzMNf0COR1JCvsk8+7g/5NSPgsIaZWw6G1/jPxU23JwO2e07Fm0wwDJKHgLuBc8OOsgIbFjHyQ2BtFRaO9bSYO5IAEOtKYhBB77SiZfq+QSLVxtlu5+zrAlRtLiRJMZRVjiRIgoHuJbwVqrJDqie3iTn2IwrCiEZUuenWkQSm8WE8zUEzl0lXn6ay0zeeKRfvkvOHVVKV4Sp6jgudxHYcPJLsv8Hl2aYAjBwC93KXuvWzmH1BlYvC4mJ9hZFu++j5e4Hb4NbmAp5sYwGUqoQSj0iJ9usMCY7rJVUuV+I2cg2IwQ/rkHPe1JV3e/v8dQm3XEZchvVTMREWQ92ESPfw5rUZQCzzWj2t1ftnqlFsTDhiIx1EVErvQDfFUHJvlTx4QjxbxLFsnP1nHozz4k3AcLsl6DD+/Pc6YD4zs2kTVcnrMK5IkqbZQeR7SHA9pnPplKq5lSSZVqAK+khgI5uK+gVzX+ErbC+v5zCk1u8R0uahd0yyCLPweo6D4k4OrGTMt+x3MAQULrrF6w6p6Tp8IFhroUK4NGuN6e6R5fVU3TWhPKQio/Aoi/1ExrQJEGu9xoP1a0p8meHnmQ4YmZZE/bitCuAMZ8SMGqhaIIPcKMVU7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38070700009)(33656002)(86362001)(4326008)(8676002)(8936002)(83380400001)(55016003)(54906003)(110136005)(64756008)(26005)(66946007)(66446008)(76116006)(316002)(66556008)(15650500001)(66476007)(7416002)(2906002)(52536014)(5660300002)(478600001)(53546011)(6506007)(71200400001)(7696005)(41300700001)(122000001)(9686003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?814owczM/nk5FynZ1XYuMLVs/Hxb/2HKM4Sf4xZL6CKAwwb9o0EmYwzP9syQ?=
 =?us-ascii?Q?USYCmYRufBHtgNKaiXW7NXMxrhip98StGcQ1esmxbDPzX5Q8ZKYngqjK3ufm?=
 =?us-ascii?Q?fqCldW5eQfHc0HKgdWYQYHFuXvYfqQ0PT1wO76qntTswlwOBtDiKOEHJMCXW?=
 =?us-ascii?Q?QFNjNuFt0b86lbeMM4XCUwzku0xI13gWLD97d+IWZOwKUJlkjZDRmzs8pqJU?=
 =?us-ascii?Q?APQWLN0+OJQGrQxAuRajrPokcddso+voMjZdH9QkhaIwQboTZWU7rfIf0/+M?=
 =?us-ascii?Q?T5JVxZzTYtjLBq8xSbzwsD+8kUhW4UeReBqWz5Y08oVusSzTqaft8rPKJBV6?=
 =?us-ascii?Q?uN217NmUIbET2NbrBfxFbi5IBSRvCfsRZ/h5VEcMVhPSIDvMtrrIz320VI/e?=
 =?us-ascii?Q?B7VN7c939/ISRDpolB00U4P+FdT6xonwBcvb9d6GIsP4jHOOeS6mWHSQDAhy?=
 =?us-ascii?Q?oYljrPmuTwXHDnRZGmH3sP/ORrIRkYglSoAosvtZSLtF5R6/1EgWwfCKuEqJ?=
 =?us-ascii?Q?WdcWnbjXj67n+V+sZLxcYXDHZCcgd6s2Z/LRUYxZ8YId/I78hLth14cYuxLZ?=
 =?us-ascii?Q?aTzfUxHqCdy8c4PDlyQIPF+G9ES6xONv8hzGlTjrY8p3iYiJDeob46RmpbQq?=
 =?us-ascii?Q?cXXxiNZY1KMtce5vpUoOWlKy0Ib+EnN9sGz0Xu+1nW67ZhEN5OXDFZMZKloF?=
 =?us-ascii?Q?fOxJRuUdgwULLDCglIgednzQCdEZbOGnd8GFRopCZGbayvukDRoR40bXhkI8?=
 =?us-ascii?Q?ftEBsx8aramerNUr8aX2FJr0Jrud8oYoyk+jiO2ElwvYSx1v5PCA77SVdE45?=
 =?us-ascii?Q?oTEZ33nu7Gc4rxP4Jwj8sJ2Pajpiuwm74hVo35DtajgDE9Quy50+g1YIeXvp?=
 =?us-ascii?Q?vsUOJ3VTyVP1onMsW28mMuC+9Q4t65OVazGJALg3w7QK+uHLkZPIQDbYpE7B?=
 =?us-ascii?Q?Xkzyvxj/3NX659OeikcntWvDmgEC/bjJc31qmlLc+PDKjCEHTixsmxH6EfyV?=
 =?us-ascii?Q?dEs06kIBUW2kzxh/zWYiufICOmSM/e9ECffrB2mYx+ixfmur6n4h9Rb7WWU4?=
 =?us-ascii?Q?2ggnr/SFfSykJqg9Y0LQZoLw/ek02d4kjZIIvFKAMGoRWGOMrN+HvaPh5Svu?=
 =?us-ascii?Q?Wc4ySSsKzE9G/TKoxhJ/vcsnaVo2165m5P3TyIQ3dAyVPmyfXZ83RfKjzQTM?=
 =?us-ascii?Q?f1NqmPbLEvWSUZdovH5ecWorxtQF8Ef7Kynj+uBFnRdvbhlSBiAATB6Z5zl2?=
 =?us-ascii?Q?SW4rbhbZgVSNkwapCIc7DnIbosx9aDYZ8XNIvT8DFX63iLUjv4Gf4zLzRc2A?=
 =?us-ascii?Q?pniChkgiaurftlxjC1953LWt3DcUpyOPQH5rJ6u3zma6M8Gj6aPOlY1gCJdP?=
 =?us-ascii?Q?2UKYlgvB1mkFVeb6Ph2d2nKzDrQOdyqdwXWSl6gFDY3bGOs521y/uOdU3zUa?=
 =?us-ascii?Q?axHXsg+A/1wvAP+Ia/RHoXF498fmmiYp5g9bzsEol1lwQZhl7sdh4+Yy+PxD?=
 =?us-ascii?Q?ExMIlMdC1YIhIIVfCOWG6QD/L6efP0k1h+EhPkF6TWl49+8lPoTa64pd3bNq?=
 =?us-ascii?Q?MmLXGUobYXVGeGBgHHW3m+zW+AB2HTkNvT8VNGNJrIupQt3lMVUbkMojd9m0?=
 =?us-ascii?Q?UQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5afc18-a3bc-4343-d740-08dbe69307ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 10:58:56.5905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcZN/AjtuWrHHuX12/4qW/+Nfv0eR8jQ/FhN1wqPvwldOXShjHId8JiYHfbHI80sUOwRIeq12dXzlIuhnSl/RApmS4w1+DnEpnrYRyLFFBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5857
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
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Pavel Machek <pavel@denx.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping. It is reviewed by both Laurent and Geert.=20

Can it be applied to drm-misc-next, if everyone is happy with this patch?

Cheers,
Biju

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Wednesday, September 6, 2023 10:44 AM
> Subject: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the commen=
t
> in rzg2l_mipi_dsi_start_video()
>=20
> Add missing space in the comment in rzg2l_mipi_dsi_start_video().
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes:
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This issue is noticed while backporting this driver to 6.1.y-cip [1].
>=20
> [1]
> ---
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> index 10febea473cd..9b5cfdd3e1c5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> @@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct
> rzg2l_mipi_dsi *dsi)
>  	u32 status;
>  	int ret;
>=20
> -	/* Configuration for Blanking sequence and start video input*/
> +	/* Configuration for Blanking sequence and start video input */
>  	vich1set0r =3D VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
>  		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
>  	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
> --
> 2.25.1

