Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090AD7BD402
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 09:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB610E093;
	Mon,  9 Oct 2023 07:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4CC10E093
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 07:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiycmAKxWvDToeR0DHzEwqSXlAkc22QWLSKzrgydqHgNqLOcfMwy3bsT0oBlx6QhAfU59H0yFJnZgMAA+DThEyJChZ+Sg2w2lBx0X0kSECDZClYX37gzvotnFiXv7w5TSLVPdBzaprb7dJN5Q7fM8ajRz3OxOewOFF8b7ENHMecm0frj/48JVHwZezNAjdvp8DDOt9KTStQyGIFRvfbtma/FiTbIIz5Q7QAGn18lynis2jxddb/4sVHL4OhhDjUhRIJN+apaJ7j/EiwreIh/a7E4iItFiO7pXHRxXd1Ihfr57/yG4OzlFF2Uyirx/Ajj/g6NgrmBpbPUZ0ylbkHymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve5AQTkzAtDzNWmxsbi4i+zdENieW5/U1G9PmMxnMcs=;
 b=gS6isv8SGcHbzO7rzof/NVesSrvXc5zKZ7fj0bzf1nklbqIUFxMtupkP1DHMgyMH6Mip+iJSiopfbAwntDaKW/LH+vuuj3LPJDGHWzdTMYa4FJwJXP1vEQldIsYeTbw6x13mG0L8W8vCIDHFnKi4ybbzdDddMxqJwfiBnWKdnqAzM9cCaZ+rFEVzUAnYYYCEwvcClf+fi1LTtYS4gKc3imNoRBw0+uMITRPZ2kuFCUcCoMfq2IhsjP07fFg8eLKwJEDHV82KhgrfZV4UN7NeAgvrKetbTotZmvFA/VJEzRlGzbNWKPsapzQOOEp2H8phlqWI3eKN4brk4xOgbEuIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve5AQTkzAtDzNWmxsbi4i+zdENieW5/U1G9PmMxnMcs=;
 b=TOp1D0rREa+5qCCoqQmbSdwQDfIGJUavnAhMckbieb9f7cYKcK01ijCAvSHw4Tm48l6IjyLNS/h8eBiFZ6BmXF3TQsODZD3SGMR3ecRPvG4D54umNKOZU9O8EH63Ewf7HB8TTbr6u6eih0ZNykjMBv3dA+MLJET6F+mODrzN4nM=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYBPR01MB5502.jpnprd01.prod.outlook.com
 (2603:1096:404:801e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 07:04:44 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::db75:e192:bbfa:78a2]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::db75:e192:bbfa:78a2%3]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 07:04:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2 0/8] ADV7511 driver enhancements
Thread-Topic: [PATCH v2 0/8] ADV7511 driver enhancements
Thread-Index: AQHZ202jCBNL1aKlyEaWSc1tCd8m3rA2SVNggAr9Z7A=
Date: Mon, 9 Oct 2023 07:04:44 +0000
Message-ID: <TYCPR01MB112694B0087AA48173F0E5F9386CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922B6B282401FDB42135F1086C5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922B6B282401FDB42135F1086C5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYBPR01MB5502:EE_
x-ms-office365-filtering-correlation-id: 04e664ac-20bf-44f3-41f5-08dbc8960454
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r1B7AvaZgyTM7TZYiZhBUP7qXo78tDQkw554U2zRi6IVJ34Hyne5iDA5x08HA4BEcMN4Zp9Dke2k4JX7xQwqmihxxDWgaQlbb02Q1zwoEMF8Y7Ff27GbBujs3ohuPaUnxYkhn/wNGof4urJTKsRlgKMnTz6g3zmAsbYZm1PPLGkNyS9vfvNdIpw1HaNA/PMR8ufaGcKbeQ6of91kbydqNvSJYI/vga1pm2H9QLJJ3zCkH82Z01VoiYEG6XMFXpR9/gWgal5woDgJZfijmXmAxK9Kr/jQHVYCPvZ4dpHVczpvsx0deNDB1eIwFZM20v1D59vtx/F9K3ExNzThKBZJ1jz++9i/bxXn/WlO+eydecb4stJeretkEnAfADDmGZcC2isXZpMc4SizX5q1odtqIOWwEZXLYIw9Ant6W1NcNvv152URBArxUhQg2FAD2eSkZ2yV3XH8ZxcvA6Wn5qii9oO3EnqipU4KiRZjiRIvTjtdX9NSMLbiTEO6bgx2b9VjXYoevoM+u+ncfwGfa9pKQpGJkTpvLWbpG7KXcuVPYqcUs4L8IY5n8OKTIQFFBMxy+nEA6EW1Sd4qjor4h/8Lcw5t1Wma93JyeEQkhEhvGzxPKwGiXvR7tHjvBEjps0dG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(83380400001)(26005)(64756008)(66476007)(66556008)(110136005)(66446008)(54906003)(76116006)(316002)(66946007)(7416002)(8936002)(8676002)(4326008)(5660300002)(41300700001)(7696005)(52536014)(53546011)(6506007)(71200400001)(2906002)(9686003)(478600001)(33656002)(38070700005)(38100700002)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?u3s8GXAE2MblQ68hTmi4/i0b0xMoR5s+2jWozUiQ3IeUaxh3NyyCMGAY3P?=
 =?iso-8859-1?Q?mlaQPYJSzge0ANMkyVwEJUFpiC82DjTh4q7p1Z0AMmBvaz9KYqPqEi2dlz?=
 =?iso-8859-1?Q?9F3S2AVb61L4Z/PPQFB1GP8eHUvNbgHleDZ7kbxA2kbCsm0DfcbgKPOXvF?=
 =?iso-8859-1?Q?Td8rym0bwJFZGP6j5jA3PCLJxE1i9I6TGgV6COvMhLCa2/oMQKzUFoyA4o?=
 =?iso-8859-1?Q?RbOJhvorXlDu3hedy+4aYtb34ubx014EHgsUTYGWCJahD6hOA+ahnnW6Mx?=
 =?iso-8859-1?Q?UsxEDRLNnKtsPrIxhcK9bty0S5Bh7mhL+Zd8wsZVf6gNkD2ihd6zIuBHiN?=
 =?iso-8859-1?Q?g3jtEGFlKtbTglMl/n6coORa4Df9CKi1roixQM1m/a48Lc5APK4lO2OPiu?=
 =?iso-8859-1?Q?xyxpg49Q1j3alGmLnSORhcddsn/JDuGCog9DGwdxCZtN/Zk+rTOaOMBWMt?=
 =?iso-8859-1?Q?LtBUtvsXWAJAqIzGrpyN7fGPxfJKfFGQ4K0SnPV1AFJqGkuCxSlTcgvK5a?=
 =?iso-8859-1?Q?JSyyzt9Hs/Lkjor0TIvuE+OIjh+jixyBu9n3NPlN8iowh7pF7ErqOlXVfX?=
 =?iso-8859-1?Q?lN+SGc2AIOJjTvCVsMc4IbrmICbo7RxUosEdsSMKOvSaABCTmBZxZUI2x9?=
 =?iso-8859-1?Q?I80Lf75Hzit9V9InL0W5FT+3vtv0cpGsYfyyLXvUIiZOCyg5DCoxe2BCs/?=
 =?iso-8859-1?Q?bjUa8pDNwKT3Y4CnIhLOdGmWQMaL9TWfREm3BDvVV+ZVI4SCfthmRY9wSX?=
 =?iso-8859-1?Q?OjRw2TkwaYe8yO5Nn17FRKId+Sig2yz54fb1gPyfPShii9XTvQJNekXIdM?=
 =?iso-8859-1?Q?MhFdSsmfrFUcU1ENhPXUVmds7U4o9pU3XPdHVBRG90s5fDWRKpTsRuu7or?=
 =?iso-8859-1?Q?1gZ9df1dOaeTNB6rS4ZiqiZNVTExfXc1X9MtTbyCuPkwXZ1oV8BGg5CeCL?=
 =?iso-8859-1?Q?LoIYBwGHpH6X0lr91kTZl4kRErKsYwLKeNbRMBOjWscB3rfp9wJsntrSM5?=
 =?iso-8859-1?Q?0OrFAbAP1RLmKqGDnkTF3RyidGjbrtWfL0Fg3l/HVd9aIeTuwjPRDXhKlf?=
 =?iso-8859-1?Q?hPMxO8zsvUO4/dKLP7VjKGGT5oBEOrqLkjEbJCGpuWzjOZQ9mYBWP1nsNy?=
 =?iso-8859-1?Q?bAmPKLG8HyFS+X4MWRzoSA/6D3uD9ltSiH0Jl3mnmteBjYzOAMwVq6ibC2?=
 =?iso-8859-1?Q?2sXRhm+bkdJyg1SDYJDhES/oioCycFWYBB6pNd92yayVUKGgnzJNMycajE?=
 =?iso-8859-1?Q?qKM0FU702tvF1he+TNSi3rIM8H7NJeFnrHCJXQyzaTTTtzI/pI2EnyixlA?=
 =?iso-8859-1?Q?kkEiy4S75yiZoV6C2YFdwEQdE3UcteyHjZwBLLtwwbamTaevswQh9qLakw?=
 =?iso-8859-1?Q?gCt6XaisEwjEn3wvtrbrXC+z+MqNDXaLaN7nsJWOZ8OHYs+LzeHP/tl1Zb?=
 =?iso-8859-1?Q?yenIqN0Gn31CnmulpPQ2wW+TEoxzQ+SgIsruc3hR28x463jjie0rtIRttZ?=
 =?iso-8859-1?Q?qvjgIvZg2HISjTxz8BIAcsMZFsaSfDnUTSNho8hXy4f87q+khc/4gnSnVy?=
 =?iso-8859-1?Q?LnM3DP3MFhvgvQkW+RMDFIrHVP0qRTiLQqj0qmGX3XJ3he9aUoXPXcW7hw?=
 =?iso-8859-1?Q?vhCiMk+gHTHzKJ6SAeQtxARJ+8l8iQL0F3adE5mG/HSMm9WqjhlmSBIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e664ac-20bf-44f3-41f5-08dbc8960454
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 07:04:44.5969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jXsUjUtuwmx62chV8gWaEGfwLvem/WTTuq8IunqW0tzFDmioZQx8yieYgmkwxgp/6vZ93lDAiI4bG9vGz4WvYUa38fBV8IgwDc3M8djVTTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5502
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
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping. Are we happy with this patch series?
Is anything to be improved? Please let me know.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das
> Sent: Monday, October 2, 2023 8:15 AM
> Subject: RE: [PATCH v2 0/8] ADV7511 driver enhancements

> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Wednesday, August 30, 2023 3:24 PM
> > Subject: [PATCH v2 0/8] ADV7511 driver enhancements
> >
> > This patch series aims to improve ADV7511 driver by adding feature
> > bits and data instead of comparing enum adv7511_type for various
> > hardware differences between ADV7511, ADV7533 and ADV7535.
> >
> > This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
> ADV7535.
> >
> > [1]
> >
> > v1->v2:
> >  * Added Rb tag from Adam and Laurent.
> >  * Added tested by tag from Adam and Fabio.
> >  * Updated commit description with reason *why* the change is needed.
> >  * Dropped the local info variable and instead started using
> >    adv7511->info->type in probe().
> >  * Replaced max_mode_clock->max_mode_clock_khz in struct
> > adv7511_chip_info
> >  * Replaced variable type for max_mode_clock_khz from
> >    unsigned int->unsigned long.
> >  * Replaced max_lane_freq->max_lane_freq_khz in struct adv7511_chip_inf=
o.
> >  * Replaced max_lane_freq_khz variable type from
> >    unsigned long->unsigned int.
> >  * Added trailing commas for num_supplies in adv753{3,5}_chip_info.
> >  * Added patch#5 for adding the reg_cec_offset variable to struct
> >    adv7511_chip_info.
> >  * Replaced has_dsi variable type from unsigned->bool.
> >  * Restored check using type for low_refresh_rate and
> >    regmap_register_patch().
> >  * Replaced link_config variable type from unsigned->bool.
> >  * Restored enum adv7511_type as there are users.
> >  * Replaced hpd_override_enable variable type from unsigned->bool.
> >
> > Biju Das (8):
> >   drm: adv7511: Add struct adv7511_chip_info and use
> >     i2c_get_match_data()
> >   drm: adv7511: Add max_mode_clock_khz variable to struct
> >     adv7511_chip_info
> >   drm: adv7511: Add max_lane_freq_khz variable to struct
> >     adv7511_chip_info
> >   drm: adv7511: Add supply_names and num_supplies variables to struct
> >     adv7511_chip_info
> >   drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
> >   drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
> >   drm: adv7511: Add link_config variable to struct adv7511_chip_info
> >   drm: adv7511: Add hpd_override_enable variable to struct
> >     adv7511_chip_info
> >
> >  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  16 ++-
> >  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c |  14 +--
> > drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 104 +++++++++++--------
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c     |   7 +-
> >  4 files changed, 81 insertions(+), 60 deletions(-)
> >
> > --
> > 2.25.1

