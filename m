Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162B508CAC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 18:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7F010F19C;
	Wed, 20 Apr 2022 15:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1731F10E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TN9IIfX4RCTliY22OSdvNHGLr9W9VFn7cYq38ec/b9LWDdmdQhwcQRtuEtJmZLbOpnjHILb5wO8IQbe0KezX0fITSfY/vAlkFtSxRXK5uzVk2JMheo8fttB2cVvSKl12O1B91Kh0JUf0Ue8JVVjR4Bm1jTEEijZ8xBr2whfIEVbwwqtplO/IqJG72X8rSxuNww3hME3oCpIA6hOzGP4HArsGKUmtEP6ZpLDljg4rTdrYR0BkpMOEE8oKzLAP5J2qFFuvYUZBOocFp9gbO+mHRy/QINgckuJcvnhz9ShUW2PvB4bRf+9kiyOqe9TDWFBp0QVhKAqmBUQ8eFZTDIEiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KFiv82JJU1oiO7HUH+R79q6frs8QmsDHQx321DtrJg=;
 b=T6f2uAMuW3LGnntLIN612v6H84Gjqj7SbDsN5N0WE2Hj7obked4CJZqz8rrjG4x07mxv0esYDjFEKnUAChNcuI/XzoA90IYuZ65nkZfrCStr4s6grbB5SkoshcSBpP+20ure9h0bsSURCrWXfzBlPFXd4Uu1GZ7RXoloxQaCZN3cGsRE6OCDKsGuOWkvpVUECj7KN1D6LpFXgmpBIc7PfgupmkPJHMKrIj75kg72tvL/q75402EAWQeAM7VaZTdg8bM0Dp6wLj/d1XqvMIk8Rw5Aw+bE+JZqdTY8lCOCRUxwIOcB19rzagYBoMzZv27SDASb+JW1BO+B/UF022Rung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KFiv82JJU1oiO7HUH+R79q6frs8QmsDHQx321DtrJg=;
 b=OknX4sV4A7Y+1B5QjNZoa4QFREdZioCFE6qdt+gerJ9X0RVqF52FkJSketenkTQddC5gCH1+B0/+MQSQRZI4SH/LS7YnVRPh8mAkvjZiFF99U+kvpieRRzDd2q1H7glV2MZml9D+x4K0kYSZHpm+neLl9+uwDSzA0vq9yQG+Eeg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8835.jpnprd01.prod.outlook.com (2603:1096:400:188::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 15:59:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 15:59:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 2/7] drm: rcar-du: Add num_rpf to struct
 rcar_du_device_info
Thread-Topic: [PATCH v2 2/7] drm: rcar-du: Add num_rpf to struct
 rcar_du_device_info
Thread-Index: AQHYOTdQ1zAuPCbiUUqusK+eOXvD4azxAfcAgAgqtMA=
Date: Wed, 20 Apr 2022 15:59:54 +0000
Message-ID: <OS0PR01MB59220C62B99300389CC35EDA86F59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-3-biju.das.jz@bp.renesas.com>
 <YllT4BgEjpMIv/gi@pendragon.ideasonboard.com>
In-Reply-To: <YllT4BgEjpMIv/gi@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f03e301-de44-444b-c952-08da22e6cf61
x-ms-traffictypediagnostic: TYCPR01MB8835:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8835DE7B3DE9C606A15A2B9C86F59@TYCPR01MB8835.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y/gCG8Y50nt8v03p3Em80RFWaDSe7YPHlO1Cqk550MCTF871cxyGm09taGqR3t/8QfeqAmZrbUvXFRhV+AHMLIrr7ma/Ob2DnJF1sk4IQBVj2qn99YULiEyrY5ojbmAM3e34P0r3ltr8kVl8hdxwC9sNHLr/b0PI1OC8+aTkiVGuvLoTi2QoK3uI+5Ah74uj9IAvxZAMgMf5TSiLdLshpIjOk12Oubr1UEuiTndryUMhqCQNspAcZnL6kQtp5S4m+cQlQwRUnP/a4ibSCUOc4h36E+iprGMKGANN4RwbPT00VxkE4OZlhcgSiRfIATkrrmIoh434yKCLEwh/8NwuU1Gw2y68LtIsP3BHaT5+p8UrfJ3HkHUdpIiJGpSwGrm5rmTOYus+0o3k0wVjrhOLcalRPLQ1IFx/Rj3ZMMvCN+SLSIazebjkkPbhlr8umJAwWhDBxZHpI9sZ5pV5N+ITseGqFLoS4J9XEfPizbK18+AVwTlQPrgwvb43n1UdDocOcuTguRe8mN69nxxt5eHH0LyZN0GIvFScOgy2GEPl8qAvwY1tszwDyCtzYm2bmcxQ8cN9dAgJ0T4LSBdqdJw3N3xvqizD549nBLWt69gbAU7fENKu4GIRy7Z5CO8/PIHWtZEozxLW4awG22BrlI62rwIC8ei87TlkOJmH9TjDw3qHK4uE9q+xFCf3Q7pGvC+ccLdD8PO24qu3zp3Z5TIMHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(38100700002)(6506007)(7696005)(52536014)(33656002)(76116006)(6916009)(86362001)(186003)(316002)(107886003)(5660300002)(26005)(71200400001)(38070700005)(4326008)(83380400001)(66946007)(66446008)(9686003)(8676002)(54906003)(66556008)(2906002)(8936002)(508600001)(64756008)(66476007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YETGHNWPg7s3KiLXxoXS70peYGb30e+04fZIbnIrW5f6SPXua7oAF3UOUkeL?=
 =?us-ascii?Q?MtTkecqkjno/UnU8sDp4EThWIBr6Imqtp3fLNI6AwdZ3tsTf1KlVLv5keM9A?=
 =?us-ascii?Q?UUMaJQe92wgn2NZLQKH9ImHaM95iW+zZbek1aMUnJnY7UBwmTCv78Z5GHkM6?=
 =?us-ascii?Q?Sv1q4CbW7HN8t8+vphELe/SDqMij962Ed8/i3UW98a31UONTlm+TzDYFpWf0?=
 =?us-ascii?Q?U6pq4HpBWjeTJHne/h0VR0WJiX72jB5KQ/aLy95/sjGg3W1eNgLZCQLH1z9S?=
 =?us-ascii?Q?EMdFLttEOG1kXKwnWH8BTd6kgFLA3/9/R1exgZcgfqgovem2fvZBrpc42I+x?=
 =?us-ascii?Q?K0KPwjhmJQdoBwODjSzFu6MlhD6pZ02iefGyLVW4LBrCIEwtQQwDXSonCJ41?=
 =?us-ascii?Q?DZJyLqtAU/RfMojoxBlFK3saZvE9VGq3Vdyan8WVMxsoqd+W3I57YuU560vn?=
 =?us-ascii?Q?52qSlDqGOFnI7x8ZaOGRXshp84ub3PFz502RjEW9OfRJISFQZvFeTLivLYpX?=
 =?us-ascii?Q?0rycme9dz/7/J83aoFuf7pbVlYUXdxt0Yqn28WiQyJFXaWQFgqv+h52deZsc?=
 =?us-ascii?Q?aAfwvmGym2hdGHJKgXLObUyxdJZBFteOSrEn8jogxyq0HhhFS+qp0QjuP7bc?=
 =?us-ascii?Q?M8i/gOuAvr6O4ptsZFwV/qHA5CsqGJ1uuPYMNdInJHXaTph0FaknOdN4z+0w?=
 =?us-ascii?Q?jD1BPLzUMOx61n0ZvYvMumCabwUKS3lVgPr9NlekbgNvwgnJ1FHK1Ph0cdol?=
 =?us-ascii?Q?Gbl9itlRd40yhynjAd09cNbOwXMvXqHo6/D6Vbve1ZqO3He2ZWrlGsqgcG0m?=
 =?us-ascii?Q?JXR49hpF8eoQc3woum3gDlHML2Ze36RjeemEJ9VlRmRDLV54rxUSQNIqqeIK?=
 =?us-ascii?Q?C/bHgHs0f0kGjjXtFWBBed5JBqxywn5GLfLqZhauqpeehrkAUGc592TeRf7u?=
 =?us-ascii?Q?RzPdRECYJJ8cMEeaBLRvBX30xjwsrjjgoZq+LjoBAmaubM361IWv6EdCmsN9?=
 =?us-ascii?Q?MiKJnkoyXIYDMluXHWzoJCGFDzvCiWgr3YvUfrzpaTWkvgU2ZXhOoEU2dHiH?=
 =?us-ascii?Q?RuIi/51RTquy8rKL7jggApgEEKTGWr4FBy3fGIMLLs7PTaJJdWyGSagn7kA7?=
 =?us-ascii?Q?Mvhy/YXyHSkmsuqilBZLCygINegDw2WGiI9FPmrQtK4o2cTuFJ5gR5He+yDc?=
 =?us-ascii?Q?iLlXERKR3sFD+g2ZE73vnMS9OfHTdS6JZ839obRga2Y7XPy5bM3B7ynghnVS?=
 =?us-ascii?Q?Nc0/Y4ZGuMr6YbqaSR2dt7oW7JfndQ9X80I3EKMmb3h0wvpnudkG1jQjDNBo?=
 =?us-ascii?Q?aefgPuIqQnrEU88TgJ2vFAVvpqRCZ5BUs7Wr0nfgwvhHswTTQSyMgiMz0akn?=
 =?us-ascii?Q?jigbp8YUC964o7xXiEARvSQiheF38T+kHkS+PsaBK0BmXK513ce/rEsfPSFp?=
 =?us-ascii?Q?gHmLZw3cweH1+144CKcmcfN2htxvDOSfN0Dg8/wCxvmpUMMnIX5BFnjDDJzD?=
 =?us-ascii?Q?iAX2dHDnxYnkMFLil/TwLUE+VXxDH0J73Ow6TV6U96C5X5rjAjwsZU98aE5u?=
 =?us-ascii?Q?9MCof+PwXp6CBKS8m0CiCiVXqnQ44Dp7fPWUicN+Cr0jik5AqmGBniTYbO9T?=
 =?us-ascii?Q?U1w/nvGWO4InVs3q3o3s+hvxcwcpjf4bcnBPebDFenWE4s9fZSZQhMfyIVWs?=
 =?us-ascii?Q?67TOvsTNg0vkwbWAsIrOF5NAKzPc9HhIDfStGIcIIt+AjEZa/KiT2kUUfXf7?=
 =?us-ascii?Q?LA+bvCICFxQfGv8fkUxZ/4FKatP6jI4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f03e301-de44-444b-c952-08da22e6cf61
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 15:59:54.2680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytgIGeC9NEWUFIF500AZjQgMNq6e+yARlen6rQG06sm4bd7DDbSg82/2Jri/Kyo4rQ/isbP0hHmiFruwZOCHJ2Ip4YZUkGrsvodePSAYwg8=
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

> Subject: Re: [PATCH v2 2/7] drm: rcar-du: Add num_rpf to struct
> rcar_du_device_info
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Wed, Mar 16, 2022 at 01:10:55PM +0000, Biju Das wrote:
> > Number of RPF's VSP is different on R-Car and RZ/G2L  R-Car Gen3 -> 5
> > RPFs  R-Car Gen2 -> 4 RPFs  RZ/G2L -> 2 RPFs
> >
> > Add num_rpf to struct rcar_du_device_info to support later SoC without
> > any code changes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * No change
> > RFC->v1:
> >  * Fixed the comment for num_rpf s/rpf's/RPFs/ and s/vsp/VSP/
> > RFC:
> >  *
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
> > drivers/gpu/drm/rcar-du/rcar_du_drv.h |  2 ++
> > drivers/gpu/drm/rcar-du/rcar_du_vsp.c |  6 +-----
> >  3 files changed, 20 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 957ea97541d5..1bc7325aa356 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -55,6 +55,7 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7743_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 4,
> >  };
> >
> >  static const struct rcar_du_device_info rzg1_du_r8a7745_info =3D { @@
> > -77,6 +78,7 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7745_info =3D {
> >  			.port =3D 1,
> >  		},
> >  	},
> > +	.num_rpf =3D 4,
> >  };
> >
> >  static const struct rcar_du_device_info rzg1_du_r8a77470_info =3D { @@
> > -104,6 +106,7 @@ static const struct rcar_du_device_info
> rzg1_du_r8a77470_info =3D {
> >  			.port =3D 2,
> >  		},
> >  	},
> > +	.num_rpf =3D 4,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a774a1_info =3D { @@
> > -133,6 +136,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774a1_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 5,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -163,6 +167,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774b1_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 5,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -190,6 +195,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774c0_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 2,
> > +	.num_rpf =3D 4,
> >  	.lvds_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >
> > @@ -220,6 +226,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774e1_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 5,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -272,6 +279,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7790_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 2,
> > +	.num_rpf =3D 4,
> >  };
> >
> >  /* M2-W (r8a7791) and M2-N (r8a7793) are identical */ @@ -297,6
> > +305,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info =
=3D
> {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 4,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7792_info =3D { @@
> > -317,6 +326,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7792_info =3D {
> >  			.port =3D 1,
> >  		},
> >  	},
> > +	.num_rpf =3D 4,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7794_info =3D { @@
> > -340,6 +350,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7794_info =3D {
> >  			.port =3D 1,
> >  		},
> >  	},
> > +	.num_rpf =3D 4,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7795_info =3D { @@
> > -373,6 +384,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7795_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 5,
> >  	.dpll_mask =3D  BIT(2) | BIT(1),
> >  };
> >
> > @@ -403,6 +415,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7796_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 5,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -433,6 +446,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a77965_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 5,
> >  	.dpll_mask =3D  BIT(1),
> >  };
> >
> > @@ -459,6 +473,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a77970_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 1,
> > +	.num_rpf =3D 5,
> >  };
> >
> >  static const struct rcar_du_device_info rcar_du_r8a7799x_info =3D { @@
> > -486,6 +501,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7799x_info =3D {
> >  		},
> >  	},
> >  	.num_lvds =3D 2,
> > +	.num_rpf =3D 5,
> >  	.lvds_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >
> > @@ -505,6 +521,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a779a0_info =3D {
> >  			.port =3D 1,
> >  		},
> >  	},
> > +	.num_rpf =3D 5,
> >  	.dsi_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > index 101f42df86ea..68c5de59d18d 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > @@ -69,6 +69,7 @@ struct rcar_du_output_routing {
> >   * @channels_mask: bit mask of available DU channels
> >   * @routes: array of CRTC to output routes, indexed by output
> (RCAR_DU_OUTPUT_*)
> >   * @num_lvds: number of internal LVDS encoders
> > + * @num_rpf: max number of RPFs in VSP
>=20
> s/max //

OK, Will fix this.

Cheers,
Biju

>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> >   * @dpll_mask: bit mask of DU channels equipped with a DPLL
> >   * @dsi_clk_mask: bitmask of channels that can use the DSI clock as do=
t
> clock
> >   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as
> > dot clock @@ -80,6 +81,7 @@ struct rcar_du_device_info {
> >  	unsigned int channels_mask;
> >  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
> >  	unsigned int num_lvds;
> > +	unsigned int num_rpf;
> >  	unsigned int dpll_mask;
> >  	unsigned int dsi_clk_mask;
> >  	unsigned int lvds_clk_mask;
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > index b7fc5b069cbc..cf045a203aa5 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > @@ -415,11 +415,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, stru=
ct
> device_node *np,
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	 /*
> > -	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
> > -	  * 4 RPFs.
> > -	  */
> > -	num_planes =3D rcdu->info->gen >=3D 3 ? 5 : 4;
> > +	num_planes =3D rcdu->info->num_rpf;
> >
> >  	vsp->planes =3D kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL)=
;
> >  	if (!vsp->planes)
>=20
> --
> Regards,
>=20
> Laurent Pinchart
