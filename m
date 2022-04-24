Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42D50D32A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEE210F305;
	Sun, 24 Apr 2022 16:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C037710F305
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUrVPZhX2MkBtv0PQ7PfayDVjdiNGJXhdUopArZp1eFLL4GY0zAcWY6PHsXkuh4hEgYksFbN8jM5bU7QNTzm9PY+TAZcy2OjyeLozkD6141nbwIYTCTKCr7R+NjgJrNvmX3nDg40ivDDIfTgWAbh+Q/1yCc6F0XzvhDZTG6Wkq2n5+5HyCOwlk27WyHjVgk43Tb/s+CBBg4vTDWZWDHvQITaOql3xCVtNTd/4tEuIMZXj0CFrW9xPMu7bJXT80CtG0jkUnbI658EH1sEq4ghS1JDMhFsiKtM5mRMLcASqjForJZRLunMsBCgKbL5v9uKW+wrTgrxSQerdFo6sUMyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av6/ztZvpAdomDTq2UlpaWjQMXrKkOEKClMMV1pRdNI=;
 b=MP8nhRS0OjjnZuOmfZG9MnTLtRstfihwtjecrey3m0N35y5rIc2TIViU6ASceY4G0EvuMA0voQuhKc68Cq1hrzTtQsoOvF21P1Eo/sdNL+YToplMg9UZC1KRHfgXsWQ85IOh+epB+n9NhD53g5X8Qne1FkRen/kvn4cdETtR4VslXstemC2AU+iemjFFiC/SrgAxnAiObEGClQaUUEnJim2124+ifAzOQvVnf3pIROOMKtTqQ7H6zhNqIKwieQrKGfvix0Ex+BoGwrkdoW5dESglxfc31U1JFEdFxe1qj5Oy+vfY10jz2IR4K4KkkDvBRXParkTVmeW41JhH9Xr26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av6/ztZvpAdomDTq2UlpaWjQMXrKkOEKClMMV1pRdNI=;
 b=pSmY5CwFCEsNqh2nSxnt1B0c5orn35E64Ogolj85JCJqC7Tae3F0jhsKNG7QMqnugtAR7UI8kKrMd+j3Fu83J7Tfiy/oa0dMx8df4/B7s3CEy0gjwqMooYOq4uiiKGOwBjKkwwa5v1T2SQB1E47izPAnUnpsTy5QZi61VPsiFPI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB7207.jpnprd01.prod.outlook.com (2603:1096:604:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sun, 24 Apr
 2022 16:12:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Sun, 24 Apr 2022
 16:12:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Thread-Topic: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Thread-Index: AQHYVuUAOzlVPnUgs0+FWxrpB7gKdqz/MuUAgAAIosA=
Date: Sun, 24 Apr 2022 16:12:08 +0000
Message-ID: <OS0PR01MB59229B70A7C183B82882BFDC86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
 <YmVtRlI0+IfuXujL@pendragon.ideasonboard.com>
In-Reply-To: <YmVtRlI0+IfuXujL@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab5f3ec6-1631-4b6e-494c-08da260d2eba
x-ms-traffictypediagnostic: OSAPR01MB7207:EE_
x-microsoft-antispam-prvs: <OSAPR01MB72079B80CEFF3DD37493750586F99@OSAPR01MB7207.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AAWZNfPHB5YJ5fqnLGp7xfgNOCSkhxMtBAzoNvO4CeAl8H4sSEKv8p9oxfRQniY9eY2PgwBhE6KgfkdpY2FNq3yL9wkrLf6BkMzIQUkSHpM0SkFRomAglZ6Kw7gDxW9MeP0WWefZMn7eubePoR+842YXQAbtSJrPqzd7gnRsTbF54uEd/hGDQF6AoFSCJPqhz35vmQB6lqHO8NWP39H21r0Z7sLmLK5fBYWGp1QzxAtM+zzvOY2kpesO6DfemNjlyCYIoeYto7/gbcxpL2jXkiQA8Z9LspL6Raw4C2tXCflwE+i+6Y5zk4kyJ2pDaqAQ7a1yEGukFEcchWiqtbZTtkhENIRKs8J+CTC9Rp8JG7ViWpIK9zfxZZSyHhcbJx6M/W3/HvWrjU/TNlF2fS2Jj294ba/J2cBAuJRry71KVtE4bxqfyH2eiWcXpiNaklLPEohpdhQJXAr79GAkFuk7D5XPqVBUTgFa15If0xnL+VrXaOWzgOEUVRqc78Txi1s7Wv4q+61p1VzPB1Fo2D4HBdv79KQf2gqMXdqOPSdDB///cH9azUE9XjpctoAXnbplc0CTTkzXgkRTaIeviUayJrX3bo9Z8TFkvQa4V7MAFCIsL7rfsoBlQQsMirDDri+dbw9Ie+tbB8MEDSf1rIzjnP68SkOc7swT3Yzx7PY4ousn1tN3sLbce6HK+KrwlfDfh9/CQENr9FDjZ5WZA6GnqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(122000001)(38100700002)(316002)(38070700005)(83380400001)(26005)(76116006)(66946007)(4326008)(55016003)(8676002)(66476007)(66556008)(64756008)(66446008)(71200400001)(2906002)(86362001)(6506007)(107886003)(186003)(7696005)(5660300002)(508600001)(8936002)(52536014)(9686003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J5OXgBJlRNZnNB6Iv+mLyRnUT5j+RwNgNMuuly/q409hLXXyidnistn2d8PL?=
 =?us-ascii?Q?zYMjrjEkbEwxl1G0nnFMcGwyYPgjAIXjFlCND7Fh4N3cVyAd3yEVr/9fBVLs?=
 =?us-ascii?Q?1WYxydE2lsoJ37ltOjGAi8A7oX/I8ow2evZ2dPjPUXcmaBFYYpephMrq0rCm?=
 =?us-ascii?Q?jT3rHU4L3f9xfsSGizTXNzz05pfAf8n7TTHLfvUYUuVx0wiRdf5kFXX4JTdR?=
 =?us-ascii?Q?U92m1/0aMSJ3AWonSCW2fdpPXN1nL8lR3Y8hTHyhCLziwu2hFnS+5r7DZuXj?=
 =?us-ascii?Q?svqyPe2YULK6W+5Q7R9NJkQ9i5VuhSCUvYtmNsP7RSvWajgo5+DlS7YjJ4du?=
 =?us-ascii?Q?ESp+2SFC9ICUX43JKhsVcgkFy5+tbgA+oqTMmv6fdZvhEYXFMmD59QxBJc51?=
 =?us-ascii?Q?Ff78BHvz7NsRmJ+5I3QQVs6eU6NlF0YLI0EueBi6ec8+o1kNv0O24s2LAipk?=
 =?us-ascii?Q?1zrFX4jA6xO+1IQb4i2ULtaNj1S8kXrmKDMpF/BbAlcvRh5xmlsHqkH2YhvY?=
 =?us-ascii?Q?H+ejtx786uJGGU0q392bHQ96T8dUVhWNEUT90qRA5k83S+MH3Jy3aJbtrd0y?=
 =?us-ascii?Q?9oEiTtAQX9L2gSnkBBIm2xTCmQj2iWjLVM87+HlCCXmyaPwYQlnU1+ZkeTjl?=
 =?us-ascii?Q?s6G7zNpQ+j9pxQeJkCuu5cd/fGFi40AGYCzno8arvcrAcuusf6ZzxpIHvCVj?=
 =?us-ascii?Q?6YkLZBPECMldtGwQQOTU64B0k8UUk+RAbhOTVWs254tJYAjkojMqyIGeRK5m?=
 =?us-ascii?Q?y9DSraD5rCQ5jD/ROQ/qXauUmPgERwsoJ3iXOPG/WnByj3sHU5GIKREuaMdT?=
 =?us-ascii?Q?dZAg/Wk6HaRogXm5GPwQMdR0cVTaozMxaP+B9jaMcrvuImnaUza3YvYtXRGC?=
 =?us-ascii?Q?YFskA2d1Jf/XswTS1SJe0XYTZY/ndf8zPrBGFCZjXtLf/wVGvrizi+XGMQ/G?=
 =?us-ascii?Q?azRzNEcSJlaq/EXy0VEi7wOCcX4LUDeT8CbuPM5/Y/qMgrGKjf5+W6kh09gf?=
 =?us-ascii?Q?UDAWcs5QZK29h7qXVU01XxT6a1ncC7zm1QgzjQUXQJO7K9CYDySGJ6roGyhP?=
 =?us-ascii?Q?Ift6Xv/HgI7g3UiK3hFEDikliuNT+RG2N/7+i/OSa+vQEfw7YIzbR7E/R5et?=
 =?us-ascii?Q?hCGQvd7WgZbn8ntygLtTWjhZQhpwIPIFk9J4bI7A9e3l0cKeDEH3HjntVvFV?=
 =?us-ascii?Q?SJvrZ8+R36aTeci2ZjJyxlwHjI1So5xUhicHgHJSNZ98XdG7arogUAICiHUy?=
 =?us-ascii?Q?V9bMccpYdyyfOCDj87GSwu2YgocfKi+V0A/CNeFsS6Y9TDCTzZdGjRpwXoxX?=
 =?us-ascii?Q?RZhHkfhhEUiFwNngylY/5IiHoRxZiHIFIVnFjFyzluubyoXMyRjWRHF/JnPm?=
 =?us-ascii?Q?iYKeWAwsRE8Gdi1sIJHIozr7Q304hXtYHrA4flZhC4UqOetzzMUpWKBHWrCV?=
 =?us-ascii?Q?N/qFbImu8JpGCvCPBf9+AVWlgBFRdgtTp250LeyBhMmDnjQ7AYxRzgrTUu6b?=
 =?us-ascii?Q?9rdx8GzaX+Su7CDPcoqKIPn6ifGARpL+Ncaz82XgbB8gnJNMpmapXy10acEN?=
 =?us-ascii?Q?EkINxZa93t0sPWgE4P6SnYbd/d9ZIPE9g0NU+w6Y3xVATiu7hcUk2TfUO9MG?=
 =?us-ascii?Q?drL7/Lh+aYZqv5JdaBkeENC2Iic8CKPZQHCTSmpHpcGQLV3qE3/M6gFwZdLh?=
 =?us-ascii?Q?m/RnIzc5h5xXXKQgb6HoosVe1IGlh6k/a2Q4z3+ZQYiext8s60h1GDpeR8wJ?=
 =?us-ascii?Q?fhu1WLXd6m4Mbdp6jga76d0OruFRvRo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5f3ec6-1631-4b6e-494c-08da260d2eba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 16:12:08.6424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OK2oH2HXxbdtdDNlgfTzZu1KlWEr8dJQE0lzQ5s7iHqhYc6RViB4+eo2oIaz/mLvq+FD1jSOnzaHjWigzqXCRxSwTNkn7w/pwQAKSAt1qgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7207
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Hoai Luu <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on
> Gen3
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Sat, Apr 23, 2022 at 08:37:28AM +0100, Biju Das wrote:
> > From: LUU HOAI <hoai.luu.ub@renesas.com>
> >
> > In Gen3, when Alpha blend is enabled in the PnMR register, depending
> > on the initial value of the PnALPHAR register, either channel of DU
> > might be black screen.
> > Therefore, this patch prevents the black screen by setting the
> > PnALPHAR register to all 0.
> >
> > In addition, PnALPHAR register will be released in the R-Car Gen3
> > Hardware Manual Rev 2.4 (Sep. 2021).
> >
> > Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > This patch is based on [1]
> > [1]
> >
> > Not sure this patches has to go with Fixes tag for stable??
> >
> > Tested the changes on RZ/G2M board
> >
> > root@hihope-rzg2m:/cip-test-scripts#  modetest -M rcar-du -w
> > 54:alpha:55555 root@hihope-rzg2m:/cip-test-scripts# modetest -M rcar-du
> -s "93@90:1024x768@AR24" -d -P "54@90:400x300+200+200@XR24"
> > setting mode 1024x768-75Hz@AR24 on connectors 93, crtc 90 testing
> > 400x300@XR24 overlay plane 54
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > index 5c1c7bb04f3f..aff39b9253f8 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > @@ -510,6 +510,12 @@ static void
> > rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
> >
> >  	rcar_du_plane_write(rgrp, index, PnDDCR4,
> >  			    state->format->edf | PnDDCR4_CODE);
> > +
> > +	/* In Gen3, PnALPHAR register need to be set to 0
> > +	 * to avoid black screen issue when alpha blend is enable
> > +	 * on DU module
> > +	 */
>=20
> Comments should start with /* on a line of its own, and you can also
> reflow the text to 80 columns:

OK.

>=20
> 	/*
> 	 * In Gen3, PnALPHAR register need to be set to 0 to avoid black
> screen
> 	 * issue when alpha blend is enable on DU module.
> 	 */
>=20
> It would however be nicer to document the exact behaviour, but the latest
> version of the documentation I have access to is rev 2.3 and it lists
> PnALPHAR as not available on Gen3.

I don't have access to rev 2.4, but I got access to=20
"R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf"=20
where it is mentioned about this issue and solution for fix
which is inline with the patch from R-Car BSP.

"The reason is that a register is not initialized by reset.
This could lead to output wrong image data of other plane or=20
wrong color set from BPOR (Background plane output register)."

>=20
> Furthermore, is this really the right fix, shouldn't we instead avoid
> enabling alpha-blending in PnMR on Gen3 ?

Avoid enabling alpha-blending in PnMR on Gen3, will it help here?

Here the issue they mentioned as "register is not initialized by reset"

Cheers,
Biju

>=20
> > +	rcar_du_plane_write(rgrp, index, PnALPHAR, 0x00000000);
> >  }
> >
> >  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
>=20
> --
> Regards,
>=20
> Laurent Pinchart
