Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71804508CB6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 18:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E09D10F19D;
	Wed, 20 Apr 2022 16:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB07510F1A4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtJX+kjlp3daBI7q5gDhXml1A9pL5Dlj/7SkL39h6dHMIZsshHM+hW+lVdGcDn5g5M4P1lQb/Zq7JKkJ8weiX/dIyFtm9m28+eWxzH1iT8NJoPMoDr+aty6XLy7Lns/jLlBoFSjQnRV+JDegqzkJuXMj8obA5z5tXYM+6FcKTdpJ2t/tS+Sf1onQUbYMxt9iVya9WWQlkG/qoK8eSf9ZxBeafe2vgOdxVcNPic9nZ4NzP3b6RDTw8a0048s6MGSMalGBpIgU5jYr87KxOx3wfW/IB+RTvb/pYuMZNluYnf16lgUTPzxdd/LmWjqtGdZbCzWFZa/IH5vdQldXYYjUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc0Vft2nlfIsCzsDnGqle+N7goWJIjSbdeYqG/3A/zg=;
 b=fkbWZEk1oHtUihYmpyFwBV0FV3Z4/pd7KJwZm0KWz/CltoIbLvTjDWZ9ZoKtuUnR76TLFHBYeFF1QFYQS6owTQcPM1uatUTY43fQZ4Uf3okuN8Ozf6O0p68PZVe4XhUpSAJCEiLmb8niuKNhZ7uEvKorSr/86znZ0knDk5PtlLJHt0SIXrbzrQf6MNIINJYCqWxjJIx9pqFe86KzPXEDEYtaMhT4nHGUlO1vAPzmLX72pZl0VGATg47QT6ZNlijyCY8idZSl6CQ68MFG2poKSqvu89+tD1/feUiVfJLO+6QAEjpzMLk8jq9lv+pSlHMqLC3JyVyQdGiEPfO1Uk2N+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rc0Vft2nlfIsCzsDnGqle+N7goWJIjSbdeYqG/3A/zg=;
 b=iPRAmesGiEXF08k1vgeeP6hOfe6waPAu9/A5v7ad7vEFFh/dcR2YRV6qet/x1XeoZtHni/OlpAyfbHIndaiu12xaktfKm2fMcgTKwsusYZ8MCaLZ94/yNhZlSPDA4OgiIVq93gdWkBe7yqmXmG1ZmQl16L2hxbsp9EEj9mNhlPU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8835.jpnprd01.prod.outlook.com (2603:1096:400:188::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 16:02:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 16:02:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 3/7] drm: rcar-du: Add max_width and max_height to
 struct rcar_du_device_info
Thread-Topic: [PATCH v2 3/7] drm: rcar-du: Add max_width and max_height to
 struct rcar_du_device_info
Thread-Index: AQHYOTdRxnm+aaHjOkqayeZBUkHNbazxAxMAgAgp3QA=
Date: Wed, 20 Apr 2022 16:02:11 +0000
Message-ID: <OS0PR01MB5922AA7316FB20B1CC88B26E86F59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-4-biju.das.jz@bp.renesas.com>
 <YllU5CReP7Y6iRVE@pendragon.ideasonboard.com>
In-Reply-To: <YllU5CReP7Y6iRVE@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35c63d16-4e5c-4701-e3be-08da22e72124
x-ms-traffictypediagnostic: TYCPR01MB8835:EE_
x-microsoft-antispam-prvs: <TYCPR01MB883514A6F5243B58289ACEF386F59@TYCPR01MB8835.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AlzklVszchI/ZZ3RFDY/RqK/d9v+8fMWTSf/ZnyA1AK3d2U2g8jE6H8p4MTORG5ZZEb6Dw+0XOxZevzkAJ6RnX1PPRk2qHlboXMPGUCAbDAlstUeJMJUHvquEpQFNOdV6HLv9TR4RFmW87y8o2EOX+1bnOnELlg4+M9+Xn6wnSyRDrAOXtxo3JU/k6ajnVkHRWW0RSFNEMjjeKmkkdiPFOeqBaS/vihFlhvl8VTejrQ/+D5ydXP/FOA5opkkUx9gv7ctUCDQGZcr/4MMa9kudWYKn0C9EEw/LG7pmPhB+5ZUciIFXp1y4b28OYSQ5xCROAZvy+uy+c7L9noazJs8sf5Jdo94lDBzehbeqNFZmWqnPMnFB28r2RMiIGxPlAQf+qxrYROu/KLvL4F88hS4o1qSY7XHP4VLPTGVhS2vsVEwG4PZERpmBIvHm4pMCmBTJdDA040UHhcV/0DducYXfkkl4IJ7noc2z6/RkiioGiZAziyeKyROju/SPk051+eksG+QpBM256xns0A0qvZT1zU1krTDOVWc7PtdXZCERTk0fo2E4UFB8aSoU3wFdHFTeaWZtCry5dTHpf9WlA9IKtYjAtYRuYueYlvgNYePS8hB7BeMiopbZuHFEkB2RfFSCcsqVS/8pbTzLOOQv3WxLjZR7tGlshBnq33eB4+h9OhkyBAmEJr5gAFzZ54lK9SGCUTClHejJERZpXZH27uHIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(38100700002)(6506007)(7696005)(52536014)(33656002)(76116006)(6916009)(86362001)(186003)(316002)(107886003)(5660300002)(26005)(71200400001)(38070700005)(4326008)(83380400001)(66946007)(66446008)(9686003)(8676002)(54906003)(66556008)(2906002)(8936002)(508600001)(64756008)(66476007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jfXWH/FPmhJEEjDkry2kQtlZuHQYR1M/xWb/9WXl+Lk/RCDAJL8c2cSxZtct?=
 =?us-ascii?Q?A/jaAHoercn7okPgIdTqbNpVFs8im7YGyW2Aq4ecU4IRsX4ln1dcLwkdX+SB?=
 =?us-ascii?Q?DTyXkmxSQ+9A/LizfjCq1WkZNPalkz5mo3/MYrzLJI57Wzj/BimuqR8fqp/y?=
 =?us-ascii?Q?RLQl373pt3NJ/j+tOOFVSz6tm9xoaGF0ZW6BnpT634AvnLKjqiL+vRuETlp1?=
 =?us-ascii?Q?ZlxUnLOkev8yu75A15yDk+mjixBw6tpDtSaivcC1wlcqfVx3nwot8QKkHHDN?=
 =?us-ascii?Q?0MQC2MiSu5V00bCQUs7MhaeZ/MHopaSOEP3SlfyDhRPB+ONJ0d+E7kOAXftZ?=
 =?us-ascii?Q?mL8JEp9JKFQEsT0TTvXXooPxDjdSD4d8/lD1RTCX4TYYjRi7XaLOBCyKbwVl?=
 =?us-ascii?Q?OMNT4jBzCIMYXlKAhm6/lASShc2GXlS33HTOprY9QL87yxiW09/uwyI5Fw92?=
 =?us-ascii?Q?IMdBtjaTslEuPPgzrSI9CdVukItxZ8PirMZW8VL1zdwGS8hvFlSVw8Mu6jAG?=
 =?us-ascii?Q?JOCTHDwbqmnGLBCVr7ZVC3I+Bs5vEwo3pVwbPd6TKQgEW6XajiDxJ1TzIYhJ?=
 =?us-ascii?Q?9m7MCr+G190q0w47VMwBV243Vuiz/WpuuR5MwNvNXMWtgNUOqV4B6HXPBXod?=
 =?us-ascii?Q?HU/QV9OPRC44pky0qQhGa/aDi/W7AzVEuYBllonPEdv62nPRtuKB0cyTqmuy?=
 =?us-ascii?Q?3Mvje89nb9ZVDx5TsvdNSX/uJJRyXBZDjkhnmZuvStUFGJm6C/SBZAR+Wkyr?=
 =?us-ascii?Q?SMeTF3OzRIq+NFhStXyy3a/70JfYSRVgbEjUX3uU6fK8Jw9cd75efL/wZbne?=
 =?us-ascii?Q?6H+AdG/FZvVcY2CKOaCRUWI0Q9f38nkwgsmy83mMPRtzS9yAlURGbaWh6nfB?=
 =?us-ascii?Q?JqicdRYXGbG6ftcwl/kepHujBbWfj0aNF5X8nbMZk84e9JTIYKqwMaEvhYmF?=
 =?us-ascii?Q?8BuEYTBxOjMkVTI4cB2uxBYNLbLQf8yuTzEojicF+Lv7tt+pyCisqN1ajS2a?=
 =?us-ascii?Q?lhTMGewvPRAA/cAblD1Hi69D1dYp4Or8VXW+IBBrequz6grds6KSvMf0yv5i?=
 =?us-ascii?Q?72Iasd+M+7gLx5WCNOFON9R8+9bjsqpOwPZcgxPEF1bEKh6gB7DS7QoWEHKF?=
 =?us-ascii?Q?41Uun+G87IPy8iwmmR2wzCPnuvU0EAv1+KL06zjyHE/bqAmqqIvBsn0Iz1/k?=
 =?us-ascii?Q?jz/Yik5R9ak5bbqIFouKQWpe3FulWZlw1k6MboV3wioEYr0pS6voOVAia2JD?=
 =?us-ascii?Q?DexfPXarxmJzmlJbPBYUNu5GH3aE26iyc6OIH6eqNrThimMFGgnEjFgcS8Ie?=
 =?us-ascii?Q?B3LxWdRxMWKl7+d6I6DYqmUcb0wgQAWn46CBjLPF+olEw6aCJtl4s0wo0YZ6?=
 =?us-ascii?Q?R7czXdCWdTBGTct9HUbmBnmSu8UnI2laTlJDU4hhO0tJ6puwZYcDpHNAX8/H?=
 =?us-ascii?Q?aNv3k5cVVQUv0fJ4Qavo+csM1E7QQkpYG/8QMU8PEH8k/iGZdXpWUb944E0i?=
 =?us-ascii?Q?xFFau11YyDciYKboyAt03guun4zivLF0jwtgbBMrAbVCc5igqQIMpgs5ZHns?=
 =?us-ascii?Q?hsac8AOUZ+SqOmfvN3fMdVzRcTVcpIuPztYSlEb4PVsKjQ7dfQzs/bevSbaZ?=
 =?us-ascii?Q?RVVZJVb//s3UsgoUYEkajJigepQNF/Rs1Y4oClfmVL8xuwS4POU2bxvvFG04?=
 =?us-ascii?Q?ZfahZnzyLr7V3Irw7GkIkJ+5ZyxFONJinuT6WR4nbFHdXK1WzXoS5B/d6iE6?=
 =?us-ascii?Q?79mJMBxsYYM95H/kM4P5FVGibIDJfIY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c63d16-4e5c-4701-e3be-08da22e72124
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 16:02:11.4264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4eHWgumNJR/2VoqCAqLq08mz0FLYSIdtEtcmj8Hsk5dKXDdtCR6DtuVcgkuxRYkPzVy8G9ia2FfVV/wqy5xitRyNOEnlFB/ho+d0QkKoW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8835
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v2 3/7] drm: rcar-du: Add max_width and max_height to
> struct rcar_du_device_info
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Wed, Mar 16, 2022 at 01:10:56PM +0000, Biju Das wrote:
> > There are some differences related to max frame size supported by
> > different R-Car/RZ-G family of SoC's
> >
> > Max frame size supported by R-Car Gen1 & R-Car Gen2 is 4095x2047 Max
> > frame size supported by R-Car Gen3 is 8190x8190 Max frame size
> > supported by RZ/G2L is 1920x1080
> >
> > Add max_width and max_height to struct rcar_du_device_info to support
> > later SoC without any code changes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * No Change
> > RFC->V1:
> >  * No Change
> > RFC:
> >  *
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 36
> > +++++++++++++++++++++++++++  drivers/gpu/drm/rcar-du/rcar_du_drv.h |
> > 4 +++  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 +++++--------
> >  3 files changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 1bc7325aa356..4640c356a532 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -56,6 +56,8 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7743_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  static const struct rcar_du_device_info rzg1_du_r8a7745_info =3D { @@
> > -79,6 +81,8 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7745_info =3D {
> >  		},
> >  	},
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  static const struct rcar_du_device_info rzg1_du_r8a77470_info =3D { @@
> > -107,6 +111,8 @@ static const struct rcar_du_device_info
> rzg1_du_r8a77470_info =3D {
> >  		},
> >  	},
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a774a1_info =3D { @@
> > -137,6 +143,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a774a1_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -168,6 +176,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a774b1_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -196,6 +206,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a774c0_info =3D {
> >  	},
> >  	.num_lvds =3D 2,
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.lvds_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >
> > @@ -227,6 +239,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a774e1_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -249,6 +263,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a7779_info =3D {
> >  			.port =3D 1,
> >  		},
> >  	},
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7790_info =3D { @@
> > -280,6 +296,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a7790_info =3D {
> >  	},
> >  	.num_lvds =3D 2,
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  /* M2-W (r8a7791) and M2-N (r8a7793) are identical */ @@ -306,6
> > +324,8 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info =
=3D
> {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7792_info =3D { @@
> > -327,6 +347,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a7792_info =3D {
> >  		},
> >  	},
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7794_info =3D { @@
> > -351,6 +373,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a7794_info =3D {
> >  		},
> >  	},
> >  	.num_rpf =3D 4,
> > +	.max_width =3D 4095,
> > +	.max_height =3D 2047,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7795_info =3D { @@
> > -385,6 +409,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a7795_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.dpll_mask =3D  BIT(2) | BIT(1),
> >  };
> >
> > @@ -416,6 +442,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a7796_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -447,6 +475,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a77965_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -474,6 +504,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a77970_info =3D {
> >  	},
> >  	.num_lvds =3D 1,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7799x_info =3D { @@
> > -502,6 +534,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a7799x_info =3D {
> >  	},
> >  	.num_lvds =3D 2,
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.lvds_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >
> > @@ -522,6 +556,8 @@ static const struct rcar_du_device_info
> rcar_du_r8a779a0_info =3D {
> >  		},
> >  	},
> >  	.num_rpf =3D 5,
> > +	.max_width =3D 8190,
> > +	.max_height =3D 8190,
> >  	.dsi_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > index 68c5de59d18d..b0553b43363b 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > @@ -70,6 +70,8 @@ struct rcar_du_output_routing {
> >   * @routes: array of CRTC to output routes, indexed by output
> (RCAR_DU_OUTPUT_*)
> >   * @num_lvds: number of internal LVDS encoders
> >   * @num_rpf: max number of RPFs in VSP
> > + * @max_width: max frame width
> > + * @max_height: max frame height
> >   * @dpll_mask: bit mask of DU channels equipped with a DPLL
> >   * @dsi_clk_mask: bitmask of channels that can use the DSI clock as do=
t
> clock
> >   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as
> > dot clock @@ -82,6 +84,8 @@ struct rcar_du_device_info {
> >  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
> >  	unsigned int num_lvds;
> >  	unsigned int num_rpf;
> > +	unsigned int max_width;
> > +	unsigned int max_height;
> >  	unsigned int dpll_mask;
> >  	unsigned int dsi_clk_mask;
> >  	unsigned int lvds_clk_mask;
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 190dbb7f15dd..5857705aac20 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -834,17 +834,12 @@ int rcar_du_modeset_init(struct rcar_du_device
> *rcdu)
> >  	dev->mode_config.funcs =3D &rcar_du_mode_config_funcs;
> >  	dev->mode_config.helper_private =3D &rcar_du_mode_config_helper;
> >
> > -	if (rcdu->info->gen < 3) {
> > -		dev->mode_config.max_width =3D 4095;
> > -		dev->mode_config.max_height =3D 2047;
> > -	} else {
> > -		/*
> > -		 * The Gen3 DU uses the VSP1 for memory access, and is limited
> > -		 * to frame sizes of 8190x8190.
> > -		 */
> > -		dev->mode_config.max_width =3D 8190;
> > -		dev->mode_config.max_height =3D 8190;
> > -	}
> > +	/*
> > +	 * The Gen3 DU uses the VSP1 for memory access, and is limited
> > +	 * to frame sizes of 8190x8190.
> > +	 */
>=20
> This comment doesn't make much sense here anymore, but I think it's usefu=
l
> to keep the information. How about defining macros for the maximum width
> and height on different platforms, and moving the comment just before the
> macro definitions ?

This patch may not required as planning to add rzg2l_du_kms.c which will ta=
ke care this
Differences in Next version.

Cheers,
Biju

>=20
> > +	dev->mode_config.max_width =3D rcdu->info->max_width;
> > +	dev->mode_config.max_height =3D rcdu->info->max_height;
> >
> >  	rcdu->num_crtcs =3D hweight8(rcdu->info->channels_mask);
> >
>=20
> --
> Regards,
>=20
> Laurent Pinchart
