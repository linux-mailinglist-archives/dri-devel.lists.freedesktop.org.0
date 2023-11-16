Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8517EE4E7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 17:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B330010E626;
	Thu, 16 Nov 2023 16:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5539C10E626
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 16:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzjEF6JAih64OZJ1++D9dm4Ibv1zS4aHJ7ghCd4ZaVAjZaD9rtbsnY66X7aM9rmVca5qmHsfP8JYvSLKAIUmHw0BwModJxQ7P8FCr/LZmtM2yOXnOmddyihXlqP4gQ47XqpiVYCFGH+2/EDZnWlXOxpsbY3aXIb9YQRS0/6sN7s038jM7HDM4Yo9kwCVn3qvDkY5lGIcgQWJOxKUiVSSyNwEI0jBokyQT3Eb92JhvQL2xeZCFrrkDZX/U+2O9vL4D4ISwZJDy19YZ+3HN5vjd6shHtLVXVChdlPe5hUy/qUX3Xvnukw1UIa3+RffM9Ipqw0browy5mpZ0p7B26lqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nB2xFnwb5zgwF3ZYpL1Vw4+/BF143+L0D4UfQJOJMYg=;
 b=mR8GTqYDKI1X8R8iTwyDuCfVbPDJmLYdfPLONZtbtbZqmcRQkgjs+DqM1le1RPU53nvCje2vT2evedhgLk3YpvSA9QrSETxkWccO/BJmcTEvnpPzP7YuNhXmSDH8RX10pzeLq7bUj4nfr92amxoqQXQrAc2uSDa+HB6cfFrfha4sgxgSJhb8We7sJ3+TaxElwIiLNdajtZoaD9JIbOAzybF2TcqC3z+VUAMIiHSgk2MFmkiEpUSJVhHKnzwxdLI67vpndov8oCd19Kk8hh6wtH2bMW+22ZGAekc+GWSi6LeFQVyKykHgvfdzGD7JiMzByddMFpJImovhenPRbPUTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB2xFnwb5zgwF3ZYpL1Vw4+/BF143+L0D4UfQJOJMYg=;
 b=gTAuH9qGlSLjNRLE2T/1bb/Elblzz0dwWnTefhtBDmZtrNlaJMP7gPcg3BQntszG0jj50LhFb30/ZDx5yeMFEq7xRvihplaLlmoPfLCy//FlnosECYCr31jlO3uokHS342gpvagyE3gxvCAx+8wdHK/np+XA4EngWgu/lfjeE/g=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB10756.jpnprd01.prod.outlook.com
 (2603:1096:400:2a4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 16:03:48 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b%7]) with mapi id 15.20.7002.022; Thu, 16 Nov 2023
 16:03:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
Thread-Topic: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
Thread-Index: AQHaGJeGZUEV+z0MqkWlcaHmYB1Kk7B9GjcAgAAAnsA=
Date: Thu, 16 Nov 2023 16:03:46 +0000
Message-ID: <TYCPR01MB11269F59FCE2DAEB417408BA986B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
 <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
In-Reply-To: <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB10756:EE_
x-ms-office365-filtering-correlation-id: 83b6d5c5-a203-4d08-4e01-08dbe6bd9d9d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eqPXK8npKTT5nbQQWYcXieIj5Wg2UOgCMSemrWtgM2c3JQJcawiIrFXmH0hxEbQdrCwaRe+GpBOcx0SqFu1FqIbA/jtBYOC3RE4h4ugS4Co3GOlU3PcrnoMWH2m9DqlNg6vKnyLltyHtm/9MCoUf1qevWfgR3CYWEmj9TKAmU5ZxvR3YQKwQe1OW/GQj0+lCMil7PnicCYK3yUdv6Y9ieRKsP5Pai1eeEkrICWx61FEHAVb/pBU3fk8wu7xhnNK2KfqeY3p6TgqrZid65LxcouS4Fqke6LldlXqnJ5MewEgDYNB1i+u3yf0lC4KZZNEDzyWmXjPGyhGRDm5+kc6TLgX1aHG8hV5B5RAUP+l3Uv10dQaGcgutI264KFycupM0CL/b3gE+cVzrSeBLCSMl6BRFavGKT7uiwr/XtjsgHwjJT2v/Ivkww825a9D2H1lWhgo/EG1wWKD0FNpBLHYODgBGTj6rBrVJe0/bHbzIujoDH7xpUVyJ39kPT/cvDyobkW4FBngFIqGLUjDxkm862KTdgV9gIaLsqeSkM91JOdK8vJ8EfCR8WVMBspOv6rHXllsZbZZR+NSkwRlTXmXwk6gD/20tXpeDfwNIvCPLSUcNdNwRmRRjM4Mmhd4a8x7W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(55016003)(53546011)(71200400001)(7696005)(6506007)(83380400001)(122000001)(38100700002)(26005)(8676002)(9686003)(2906002)(7416002)(33656002)(5660300002)(86362001)(4326008)(52536014)(38070700009)(54906003)(64756008)(66446008)(66476007)(66946007)(76116006)(8936002)(66556008)(6916009)(316002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zLguGWMuFPDAvOxe1pff5FKWpQqyHncmq6qk231bCe2YMOBycrd031X10kd6?=
 =?us-ascii?Q?O3xQsS+6CzvXGL1IMnJtAHSTDPhNJWeuYy4I8wk11Hl9JWmTcdVa8JHclG1h?=
 =?us-ascii?Q?ltJjtl8NjCpj5EeNzKTS6Fs3brXfXcUpQeq9wFj4IfwGpI7U4Jv1LtLftRtp?=
 =?us-ascii?Q?UxDIZusQEPy6e1uc1eBqgBW/tqH2WGmS3E3CwwSydudbJLn/H2G1DnF/YAqa?=
 =?us-ascii?Q?zubKibRXIYU3Cex9ONvKOpRcAwfZxAZ3RaMnqrUcYqx4asT7xQhqfz4D4sdJ?=
 =?us-ascii?Q?J1fGLKGRvOjSTxNRodabooeYd427PcNi8ZqtckYm3GytnaDJ5eeUg6ZvsOXb?=
 =?us-ascii?Q?s1U0bBUC3nibamiKN/b/OK12LDaEObgTqhGVRQlC3r1ORmuZGX4YhgfxYlgx?=
 =?us-ascii?Q?itJcJ46hYnqnuEndESLhb1BesluiImRITkhujGWhKyJ7JtgnzYrvMnK9gPa/?=
 =?us-ascii?Q?q87pqGl+nD5/qKvN99e/6fbj4aaWFasS1Cw0pyAxP3mT5/YTz25KQ5YJAg8a?=
 =?us-ascii?Q?KJpE7WIPDFPzTA38COgd9BZgjwAYYRXvBVNaRpWrpxZZqrSTYcktZEzBvjug?=
 =?us-ascii?Q?BALvl/3GzniU+6qGSrlxCEgnxlnR52F98cW+ueiinZkjc61QC/WIXx1Z7Dme?=
 =?us-ascii?Q?2ujRRWqzjhoZv+T8LjLH0WeuUihj0FOIZCgoNm7umuujitS3E4Dz5RkO6UXR?=
 =?us-ascii?Q?UxqGNTzc8BNiFYJnRcAYZUhRFnXPKuGPQptczOhd0bl9jKfDLL5KLf2+U9j8?=
 =?us-ascii?Q?DYtOvvbE62t3WbS3eReeEZZpbTtgmWaCo0sGlrINP/9XSdOXkkCZHUK1cAWX?=
 =?us-ascii?Q?mFNHbIbQ8Yq04vVGMU4JwvmgA6ltPRMasrB8b+tjAyRo1V0oGbpY+61Xsz/B?=
 =?us-ascii?Q?ON7O/RAb2moe0tL6bPw2HP87+zADAoY9BenTaljHG55F4xhMzmnfXQQahGG0?=
 =?us-ascii?Q?BpNpY+kuqByEbMFXkSjCGubhaK6CMbROReVLySoLfYuvkxfISJgtp376Ic3B?=
 =?us-ascii?Q?nd42Dy6yIVWXOj9WBisPbilL5t5UdlXTNEtgUriDfTnsQQbE69OzEdr7Lpsz?=
 =?us-ascii?Q?dMSwmkWbr+e3hkGLOlDCPXezRno03ojgchaJsXjjyMp/OE6uuMRC7D4L/R5E?=
 =?us-ascii?Q?TzLC9yipqrYxVWCKleJsyktHgPrr5bdWLqh275udphx8yJ5v8TCC7/EtFg4A?=
 =?us-ascii?Q?Wy3CcCHfQZ3w+YXdysDjnDXkxxFx23WvuVuZJ9SV+4q+V9S6jbr8HXm4jssj?=
 =?us-ascii?Q?DlAri7YohZzLCkLpfWWq1Qmk4GC4BhohItCivhwiA1Zgnc1+urhDCHBrobEe?=
 =?us-ascii?Q?EUrFZZlgGmxWbmnbqHjBuDfST/TQ0gM18ozKW1WrxKH4Zpjn/9xYC/hNWlVs?=
 =?us-ascii?Q?v4nz7jcxb5GQY+Dmsc3MgnwgGVdm4rdDcxfxX1MR6Wsrle6c+AHo7Tqks2Aw?=
 =?us-ascii?Q?yCsTCOIvKbQkYAJutH9Pe9GtnRlUpVOQH8UgggVg9UPcWOSSuYJCE2K6Jn7O?=
 =?us-ascii?Q?dGzl3bHPlJmguGLjYtHyvY6Pfovll/aOWr+7cqAtOqO0rZ/x4LmJI9PwBqJw?=
 =?us-ascii?Q?Mcx8gqyamZ8Cc5Pi6foCCYGqqgrgMWO8TuNz8GdzFfyC7Ja7rc7FmIZYZlCe?=
 =?us-ascii?Q?zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b6d5c5-a203-4d08-4e01-08dbe6bd9d9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 16:03:46.9979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8fNIZmFySEqvEk7YVh/cBA6Ggl+c2Q19a1EsXzNqEIZL5sEDM7u/fBUqEoSEicw1FH7UjAF2DNMw4Ql7q3+LOZvKPgjX8548QpJL4LmfKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10756
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime Ripard,

Thanks for the feedback.

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Thursday, November 16, 2023 3:58 PM
> Subject: Re: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
> drivers
>=20
> Hi,
>=20
> On Thu, Nov 16, 2023 at 02:16:08PM +0000, Biju Das wrote:
> > Create entry for Renesas RZ DRM drivers and add my self as a maintainer=
.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > v13->v14:
> >  * Now SHMOBILE has maintainer entries. So dropped updating
> >    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
> >  * Updated comment header and description.
> >  * The above changes are trivial, so kept the Rb tag from Laurent.
> > v12->v13:
> >  * No change.
> > v11->v12:
> >  * No change.
> > v10->v11:
> >  * No change.
> > v9->v10:
> >  * No change.
> > v8->v9:
> >  * Added Rb tag from Laurent.
> >  * Updated entries for common parts(Makefile and Kconfig).
> > v8:
> >  * New patch
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 8a70be8f08ee..d4e21fe54fe0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7154,6 +7154,14 @@ F:
> 	Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> >  F:	drivers/gpu/drm/renesas/shmobile/
> >  F:	include/linux/platform_data/shmob_drm.h
> >
> > +DRM DRIVERS FOR RENESAS RZ
> > +M:	Biju Das <biju.das.jz@bp.renesas.com>
> > +L:	dri-devel@lists.freedesktop.org
> > +L:	linux-renesas-soc@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +F:	drivers/gpu/drm/renesas/rz-du/
>=20
> Any particular reason you want to opt-out of drm-misc?

No, I was not aware of that. Will add drm-misc entry as well.

T:	git git://anongit.freedesktop.org/drm/drm-misc

Cheers,
Biju
