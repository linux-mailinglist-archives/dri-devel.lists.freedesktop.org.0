Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76795832461
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68F410E065;
	Fri, 19 Jan 2024 05:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A44B10E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/exEqH5Vlzug16/kBoqmZiMWsfoc050NiVXXvQXIkh6pAwV93swGQiO/L0ADBfl3GG0fkwyuqKw9ohAEoRKR0s7Xq3KyWJO0l9ROelJYXbtRwMGGeb+nzyZDCQ6PSRL5OJ/zS5Lr2ER9Be45F00ScWojwGts7PFSLKohH4x9VDPi07QsJRhRX2qJ/u/UMQ00u15aPt+wMfFtmj3B/WGHIxlsBOrySIzbGo4zMruh+IdOWrFu+4q8JrNj7XCsFZPcbpEcwOtVPMiUU+35w3TEWh2FC1ZyOqUeCngNEBohfI+/CsQ7e1wyj0uMAua5n+sDd4jLw0ACJ/j6w/lCkR/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv2ZkTv8HJvgY2avtySOjvRV6HUkD1/qp1ZS0z6+sc0=;
 b=ieTPcJX+b5FnjTCc+hwFvHAZbJnQc31EupujSprqlPN9Gz9LogOd+J2I3xD3fHBDFIclfXAsj2XbN0UXv9Dy4qLKP6VQYvuhLe7Bn6Fp9OlIaNqcJjNuJgbTlOTm6jAeZDoADGWfEUh3BjdFn6i2XfRxGAjurLPrIVSh00TBldKdV0j8dDnAMepMCSpXgyxhAEElD3USKGCzpsN4ARm17GhxxyxPmirnhBQ2ItpPKazl1hF6H8E6jNduFFAifnwatWr885ml7ZOj3r/ioMAZ6c7Vhp3yBawjFK1EEX9i7QZtgOrU0REILs8SbwbOAYKdatNmAk/h0ARI51xNYC1HIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv2ZkTv8HJvgY2avtySOjvRV6HUkD1/qp1ZS0z6+sc0=;
 b=noJb423z4fFrsZVBrZDw/2kf3LsyytAvQ4Pxk7OhltY87KTafkpz+U0utkAnaqFzhtdLMZa8TOGD3VKtoapyHKcywlRX077WI6NGFO7kAz1ETcbkBggCW/Z+bNgml/LHAt10E++iubHje6GXb9M1ixa4jivYQgh3wVd5Sa8T+6Y=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 05:50:41 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 05:50:41 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "Simek, Michal" <michal.simek@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
Thread-Topic: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
Thread-Index: AQHaSptvwR6+wKrLckmDc7xgQ1kfYw==
Date: Fri, 19 Jan 2024 05:50:41 +0000
Message-ID: <MW4PR12MB7165428B4A7A973D29E953C5E6702@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <mailman.1627.1705504032.2418.dri-devel@lists.freedesktop.org>
In-Reply-To: <mailman.1627.1705504032.2418.dri-devel@lists.freedesktop.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH8PR12MB7255:EE_
x-ms-office365-filtering-correlation-id: f2bfa826-c2eb-496f-99a8-08dc18b291f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Etl5MWPkleGJrAWN7ZrsXZBgxK1/DtPKCGAJqn0RC2ZJXnJyqXVhG3wOB4bXYoBniHU6nlCoyj5ebQccQORc+gMr26y+Jr3svPf8HsdgNDJ1R1YWcgw1VlGhepSMS5yJuxQWtEteEpOj4/27OeZTFOrxsYm5DrM177WMti5rXPEMNQBTG447EwUUHZIJDmutgM7hUUwi3BJ3bfXRu0k8GoNqdsAlYLBN4XRydRk34LW8pk+ntR4X6JsH5Zjs1lzBWrqu40M5cCfdnZ5xFHMm0umQP5BG3Bk02cjiURWodGqwwNQ3PXJRkHp8396+sd/wD/w5ZOjEXvq0W5JTF1KYtXlVcx9jgS9pLj4wp99xSoDk/AjjCPT5UZQqeVwoFGZm7d2Tjs2YPZFl4cMrGUS4h2zl0cfbqKs+fTKk+sIrpA0WPPOgz7u4pZwlWznsaOl4FCvzQdOQhAA3SUx4Us7n5tbfJTVvARDibf6640yxwPBHNQI0/NyxSclVkAhuznTp+KVQ9T4eljJk7+3hPSxd20hSntn/iXk8lWoQDeBWlipLIBzbpQoYJNmy20qtdBM/YJgqXN0DlP9/FuGlN12L9zv/mU81MM6SApgYFXuM5dXtDJBqc/FrldvCycJBVFCXv+QJIkS6uHsuM/EVtGQUMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(110136005)(9686003)(66446008)(122000001)(38100700002)(83380400001)(86362001)(33656002)(41300700001)(7696005)(6506007)(8936002)(8676002)(5660300002)(52536014)(316002)(66946007)(71200400001)(64756008)(66476007)(2906002)(7416002)(76116006)(66556008)(26005)(53546011)(478600001)(921011)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DirRGYh9yjoPmF8/4/nF5Gp5o0KbuT8loftV/yYXnDj2rE7GkSlWRRhFaooM?=
 =?us-ascii?Q?CLZNH8cqicf7WG4q3x1TC0wrxonqLNHlshpo0UcDYQgxnaQXpyqBaY2fW2Bb?=
 =?us-ascii?Q?niT+Og8oFdJCbMClUIGCcfdDte74QvwzlEap7Jc+/MyDjG9OyOF6+KbpTvs4?=
 =?us-ascii?Q?/ibJLGYRY6K2A6at6sn5BHmRlD0eUPu899phjmby1pawn5x6aFYQbxbkKl8p?=
 =?us-ascii?Q?ZMCs0XmifPS3z/ZzulV4ciFQ6PEbvy3CKskuSzFZ50GVz2RsQqna/W4Oz0pL?=
 =?us-ascii?Q?VGj3MrJdqvZ8vDDjdVX8IDBoHuda3HcjbN7qUCgvg98oZ9wRihIKxLEfHzJP?=
 =?us-ascii?Q?/f+y0ev5Fn0fyn4Z4cDNBrVpG8Uf0IrivUXVOrvdjxO87j3j5Vr539rSnso/?=
 =?us-ascii?Q?v+M8ehTEqEarlV2L/tfFKPT0YpF4/HGkDy7zQZJwghRZ1j0MPhWF71TfwgOr?=
 =?us-ascii?Q?HeAn1tRDfVnROFjDfxFtSwFb3TasDSmo+Bz3wOEQiZDE6hYumYSDSR5zhOKS?=
 =?us-ascii?Q?jsXNDhhmy7ILU9Ahu3fGj1OSr/oHByI+TFiNDtxZ55wedmYUGKMkS8JqiMNm?=
 =?us-ascii?Q?M1wrFgSPqvpanZ8/yvaWAmh/nmefeZ0ZPN7IaJr7NpK3F9p7H2IJtYKrnz2H?=
 =?us-ascii?Q?T4dOs5A2mqBFT+zCnV9a1qcxXI3NMdA1Prhn4EtEFLq7Ch9OmvQ84JKEnWrd?=
 =?us-ascii?Q?8n6RX0zv/IdVJijWnBEXgU3OWlxiwpSlSgK5x4HH/w0KdyvtgREYa+5ZP3bh?=
 =?us-ascii?Q?OwfrScMHETnv95o3X5Gkwo11AlvTW6PYTx66BEyiOwl+t69TOVua+MIvr2GO?=
 =?us-ascii?Q?rl/mq1HqGncj153y6ly0UZobSnFGEvv5EM9p3azswkuLBSoPDlToCiitm5R0?=
 =?us-ascii?Q?rXzJ7ZLtBIMs9f3lF5gTzYs99AWAE60gPunOdOEVQQF5GSr0Xp3txS9ra7pc?=
 =?us-ascii?Q?rNcDrs20VnGTZlYlZeeZrwxdyG2lyioyBRMOykh8UaEd6NsU/c2jUVrwDL7R?=
 =?us-ascii?Q?Aj8e1zW/2QgtSAc2l6VYriIXqFzZT1LkVFr26XidAN4znUbE7L4psKzjb/cm?=
 =?us-ascii?Q?/dccNCZ8RCj25cna24mLoPOHpy6EYWzTe5s2BT6HSY6MRFnHoV9jkUkWWXba?=
 =?us-ascii?Q?rkxOFDRlFlb19Tm0lOTsRVjhKJIEqxDQMsqs2xd/vcMOCW8QYZKb1h2p9lQE?=
 =?us-ascii?Q?BPZ8/76j29LEgDQEp2jCbzx2/fZV+GA+jST417DvXCjadvziT5Fy3btL7J0i?=
 =?us-ascii?Q?sUxawYG++xPAYLynnfd+abyQo3zaOZn1mZO0eFRX5Yz6pyC56ki0rBgrSryq?=
 =?us-ascii?Q?IsFVZoKjJTvV0rVNFf02sn40CsUKCbAFOLZBNJVmTvFkAZNeLlBAZsTyOETP?=
 =?us-ascii?Q?kvteDowa/rBsSB7P0nQD4W5mikxnfdrdVPk0dM5w29NXtU1QWyvWhQzLJfkb?=
 =?us-ascii?Q?OacZ0dziUGhhiTLXqDw8HYMjavG6HEsPJdj1jd92XqpEFOcSC2ulBu9zr3Sp?=
 =?us-ascii?Q?FtJF0+5GGHyukTBGRABLXBLFP2mF7Q4C21o80u+4uIdDwQa8LfBryyQbVBnb?=
 =?us-ascii?Q?ZfwpxwC8Dyku0DXfH1w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bfa826-c2eb-496f-99a8-08dc18b291f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 05:50:41.1288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+NJ84kJvDeZ2y71S/RqPBu8Bsmon7T6RBeLazlUzGFdQrwtZMXsp5twvMBPiqSh4dcaYKPtakNgVLxwD92oRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for the reply.

> Date: Wed, 17 Jan 2024 16:24:20 +0200
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
>         maarten.lankhorst@linux.intel.com, mripard@kernel.org,
>         tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
>         michal.simek@amd.com, dri-devel@lists.freedesktop.org,
>         linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.or=
g
> Subject: Re: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge
>         discoverable
> Message-ID: <20240117142420.GE17920@pendragon.ideasonboard.com>
> Content-Type: text/plain; charset=3Dutf-8
>=20
> On Wed, Jan 17, 2024 at 04:06:31PM +0200, Tomi Valkeinen wrote:
> > On 13/01/2024 01:42, Anatoliy Klymenko wrote:
> > > Assign device of node to bridge prior registering it. This will make
> > > said bridge discoverable by separate crtc driver.
> >
> > I think a few words on why this is needed (and why it wasn't needed
> > before) would be nice.
> >
> > Other than that:
> >
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20
> Agreed. With a better commit message,
>=20

Sure, I will update commit message in the next version.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > > ---
> > >   drivers/gpu/drm/xlnx/zynqmp_dp.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > index a0606fab0e22..d60b7431603f 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > @@ -1721,6 +1721,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub
> *dpsub)
> > >     bridge->ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> > >                 | DRM_BRIDGE_OP_HPD;
> > >     bridge->type =3D DRM_MODE_CONNECTOR_DisplayPort;
> > > +   bridge->of_node =3D dp->dev->of_node;
> > >     dpsub->bridge =3D bridge;
> > >
> > >     /*
>=20
> --
> Regards,
>=20
> Laurent Pinchart
>=20
>=20

Thank you,
Anatoliy
