Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526D52BB71
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 15:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3171B10EEFF;
	Wed, 18 May 2022 13:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2CE10EEB0;
 Wed, 18 May 2022 13:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnJzE1lOQCQS+L1Zl55ifAdP3ep5nzzikyzJ20y9YKyEtUhXwYEXm4ejqbwJAjGJ0CMT7Ta9G20mhMjJZ8vmx3TXwRqzpVMrS4H2xi0Ujzp6sNx7EK0RlC5ETSGTayc/WyqLv67RqBFQSc/+TyhmrQn1WJLLVKjunYfvnX6TSFz4r9PPMe26O0JY1YPlFcxtI+hum3YRToTaQws71aoq03VH+Kovu2YKCBG0bm8KG9iE7Qu+sAG6kZdOjxSLPCLQ5xafB5/G6nulGW/676/OHhT6YUvLuX56CtnWM8V3j2VYdu+WcG49/eD9PWDq4DdFpU3IDNqI89AclSw1gUu69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHGaF/Lbvxwtgoz0c+l5wTOMbsRPdVzUzQ2RKgegkcA=;
 b=g0UryPGGF5UEZe4/DtNm5wVTAugH50TusMY6mnyfGf3dieIfLgvds0oeF0L16JriW3MwtHc5Lsn0aq4sInWUror4aFFRzbHs6i2SuX9yV8htH0WsVnnK0TBk1Q3b2N+QSwkj3Da7/u4EdUBrPvjroswLYAkO96m1LV6djEH1IhLpbPPI3np23EKkR2nqhkksHY4oW1w2BYfqbA6hlg4xOsMvcHAfWLmhEe3AD7b2tQkQY432INYhpyDCaZsMyShbRQUmJoF8ieuNpcPiwW+z/a/h+MVtVGQRufF+RcYOAfxvq6aFL8WNhgGQKrJtacOSL3CcOfqDuJS0A8dG3AiAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHGaF/Lbvxwtgoz0c+l5wTOMbsRPdVzUzQ2RKgegkcA=;
 b=UR73Y3FsLXWgnv9QK08f01RONhy02aPEGk2Q1v5OEOiCJHD1ilZS4HMLPVydWVfSpGF55Rqwnj3F4YB+1Dmxhl1n0LJdNlXlaYp7Lwy9VJF3WALOXtI56FONa2fbK7VpGxA2Wm2Mra4PMYMvIPeIYDNAzYOeKmwHxeDnN2+NEWY=
Received: from CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9)
 by CY4PR12MB1527.namprd12.prod.outlook.com (2603:10b6:910:5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Wed, 18 May
 2022 13:22:32 +0000
Received: from CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::29f8:a744:2bea:23a7]) by CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::29f8:a744:2bea:23a7%4]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 13:22:32 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>, Sasha
 Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 5.17 13/23] drm/amd/display: undo clearing of z10
 related function pointers
Thread-Topic: [PATCH AUTOSEL 5.17 13/23] drm/amd/display: undo clearing of z10
 related function pointers
Thread-Index: AQHYarKg56zIqRXpvUiucrNC/4AWdK0kknIAgAAMj/8=
Date: Wed, 18 May 2022 13:22:32 +0000
Message-ID: <CH0PR12MB513911CB22A1842FD391126BF7D19@CH0PR12MB5139.namprd12.prod.outlook.com>
References: <20220518122641.342120-1-sashal@kernel.org>
 <20220518122641.342120-13-sashal@kernel.org>
 <MW4PR12MB5668AA4277ABA5A76CAABB1F96D19@MW4PR12MB5668.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB5668AA4277ABA5A76CAABB1F96D19@MW4PR12MB5668.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Nicholas.Kazlauskas@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-05-18T13:22:32.253Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0f960c7-0364-4e6b-51a9-08da38d17768
x-ms-traffictypediagnostic: CY4PR12MB1527:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1527FB281E990189F8ABB881F7D19@CY4PR12MB1527.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fUCxp6tEJ/kPoLsojJ5JimtNkQqJdGYF7LyI17qcXnu6vM8rglelkCPdVvKOYdjPIOBah9Fs622kaXkGDETRLDo6pajq4CVXsaq0kCIcEIiZ1YFDTeTvqwBqum8seArvz7enm5WULs6pcWlmVolwCKiMJaSj+AhqNLRygq1dPLZzBD/UdbyTsuebeHQO59w/fhHIvcAVtyzVgwJ9ECCh7+BKH1JV5CkK1dPjm3kWyEjZ7cKn8bsfElaJ/a4IAf3TviJH9HKUucj+T3Ls2PiqiTJEYiGCKORszMHwA2VYxF3WiRKeDH0X0o2xC4pUCqNLEx1cN6PLurdD17q6xHh4qUkwYZbraYPBf4+JtDMnlxyilh4WRw/sGVoa6EEOBmXSx2UxQmPjt1IlPyRzOM/WpYo7x1lN176CxePDytxBz1eH8LI3iIp2GUy0IfK0F3tuhsjUYaWdDRKdVDHZXemmdZht2VmksGuv/33MMp268gTXRWWlKhJ4ix1LYyhZx8r7yF+AFYHRykzFJhl0RrHO1wXLguvYLjFxKigMy2Xnb4cJfc8GH8UNZ1zkGOu0fmf4p0wrPo8OdU4SoC9IA8ajb2jh77UuW4P7jGAdaCJtarB2kkoqNlPZOgMxen8xf8+m6/htBp5Zx2j/S009dD3ZNW0or2PyF1o/yMgpx4oRyZArWZkI1Su3Acx3BDdWIV+bSx4NyCV2d3DORrCWcKEeww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5139.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(6506007)(55016003)(66556008)(4326008)(66446008)(7696005)(186003)(19627405001)(2906002)(66946007)(76116006)(110136005)(53546011)(86362001)(9686003)(33656002)(26005)(52536014)(8936002)(83380400001)(508600001)(5660300002)(122000001)(316002)(54906003)(64756008)(91956017)(66476007)(38100700002)(38070700005)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ctB5Ya2vRdoK814dKqa1Z0EpDqrP+ub3TcjxAVqRKdTiYRYho7UFIjlZhQno?=
 =?us-ascii?Q?qJe+30Pc8mlPQ7g00kDy65vVYJQnAUsBPFY0DS5s4bsUHnH+Y92Y6FIemcL4?=
 =?us-ascii?Q?+zDcWtPMZYliGqzMhGsBhMIIEZMTEmom5wmxWnhu6GaS9ycXjGQOXkfVH///?=
 =?us-ascii?Q?lEatvxgAQqexFVEvLYbZKpZZj6mJSbKgUj9LI/TWaX06YYMS8UfKyI3uljwN?=
 =?us-ascii?Q?hA82Oxz5wQKRSBMJHU6Q/YKs1S5GMfILKnQXe15WhBOcvPUnsTNwBBzR/4z3?=
 =?us-ascii?Q?Dzd7uzgan487vWHgBB3N2wsouPSzN/zupZm9VuFN60J15DbVr73bImWGJiT7?=
 =?us-ascii?Q?XKv39fb5pOp6Vou27rtCcA7Zn+tumXlqB6ZQqwbVD+zc2L+qSSrYczSOJUtz?=
 =?us-ascii?Q?rI23L0V3Y05Mz1TtGLmCo3yrlOMAmTv9a2F8Nxc2Tkt9OlQp2GPejRGe3kgK?=
 =?us-ascii?Q?+7Qj+apdtnEMu+Ag6Od2z0FLwM+QeKCIz6SFKcLw9Xt7SW2Eb5FkD06c2qc6?=
 =?us-ascii?Q?327US97/pyWRyYeYi1zNA7U7NRmRF+Is+3cxB6LS0XrMBoRLaahXy44loLap?=
 =?us-ascii?Q?5CgmMBcMb5OeuzJ6Vv2jd5Xkg3tQLhricPFPH7lPS7TYWRAvbmjBH0Fm/i2B?=
 =?us-ascii?Q?BpWDd/wffNVZim7BjZCJOwUz3ffn62Hr2a1P3hWpAZlS1qauCpAUHT9nmq7a?=
 =?us-ascii?Q?j02StKyZsz1QbPuwVcJPHawWrumifUuUpHcpEtmgfRhc9+TGYn53KOWFPcqX?=
 =?us-ascii?Q?JjCQmjaCQ3uVaihbBCQi8JU1e4AMtVZS/bphsZqUCfiF4HvD42s3H2HYb1eZ?=
 =?us-ascii?Q?LuQFB8YnImOfIInCjC8qldnwIzDC+rVMZua2Odk+5DR7boGyepUa4/esXBOn?=
 =?us-ascii?Q?zobnDSgz4B5AqOtCYPqwEMz5ccjgXuipjNvMoMeX44gZW3EntkM1L004BM71?=
 =?us-ascii?Q?OfvmyGX7jU5RM8N50g5p4uyY6Bc56cIlzFyyLitEmpCxjN3n7fSc9tHv4JZt?=
 =?us-ascii?Q?zD7JcJ5/9dSXJi1ethQqoojyDUevjvtqo58ksh8X1C9d686Ifnmv/9fGf3CO?=
 =?us-ascii?Q?QU+whEZ+n0w4sRbybrPqyATwVHaCJNMuAw+QERuLoF9GoV0vUe+6d6cYVlzm?=
 =?us-ascii?Q?SwlyO2b+pSSs7tMsYh7iDxgsmsNAs2Wr8O+CzxBgWvImKyh+iiJXMpQZKz6h?=
 =?us-ascii?Q?2JDvJW3c7rmqCSi8A5qsYzMtjEbwYgTeNr+XKJJyMXO1li/4DKf8aaG/sUI3?=
 =?us-ascii?Q?h6mt+TtkF/3Xn1d5JFo4zLQMJiN9qPpitvVYHFqtuJg+ohX4hyRcpb+t8w5E?=
 =?us-ascii?Q?WHVFTLlnfu/O6hdD9cr5SLIsca/gsICkwn5KTRNWc5jmmHLlu2tGUhtDIMvJ?=
 =?us-ascii?Q?kGDyVSPiw4nhUAGm5ojl15x91evqLSe8tax2zK7fHJVdpkQL+dXZRmzPKwHU?=
 =?us-ascii?Q?B0RBENWNro9e6vYPElIdiEskqw+VtnXwV2bohWhVr6R0Kbrtp00UuRuqGC3t?=
 =?us-ascii?Q?Y6Dkm5sjdxl2Dn32tDhRQQAhR2ZiaG/M9UX5sI6bA+g7TbDOZXDwjZH1EjWD?=
 =?us-ascii?Q?qy7X3nfO7SHICfL+fDMfwnJV6ls0VEPP9ty5e6Y10WdBQSCvAIr/LD1SnUrC?=
 =?us-ascii?Q?wp63xEAqyj292Rdjh5R1aVsopKxosIqb5fN+8UOT1Vx3NLKINbQeI4AoKdJY?=
 =?us-ascii?Q?AYBkfdBM28r7j2Os6RyRl2Atg8tjNRCaKqUozCObRCvkpd7GJdvwNXooB7wu?=
 =?us-ascii?Q?/4W9/jzOlA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB513911CB22A1842FD391126BF7D19CH0PR12MB5139namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5139.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f960c7-0364-4e6b-51a9-08da38d17768
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 13:22:32.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmDN+Vjg391d09ydRAJ6mh9wJ2be1BAxwaN/htni+l/iKVzVTGhExpCXa961dZPAT5uLeG8l5MLT2kZYMl43FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1527
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
Cc: "Yang, Eric" <Eric.Yang2@amd.com>,
 "haonan.wang2@amd.com" <haonan.wang2@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wyatt.wood@amd.com" <wyatt.wood@amd.com>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Kotarac, Pavle" <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_CH0PR12MB513911CB22A1842FD391126BF7D19CH0PR12MB5139namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

DCN 3.1.6 needs it, but I don't know if yellow carp needs it.  I think this=
 is only applicable to kernel 5.18.  @Kazlauskas, Nicholas<mailto:Nicholas.=
Kazlauskas@amd.com> can you verify?

Alex

________________________________
From: VURDIGERENATARAJ, CHANDAN <CHANDAN.VURDIGERENATARAJ@amd.com>
Sent: Wednesday, May 18, 2022 8:36 AM
To: Sasha Levin <sashal@kernel.org>; linux-kernel@vger.kernel.org <linux-ke=
rnel@vger.kernel.org>; stable@vger.kernel.org <stable@vger.kernel.org>
Cc: Yang, Eric <Eric.Yang2@amd.com>; haonan.wang2@amd.com <haonan.wang2@amd=
.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Pan, Xinhui <Xinhui.Pan@amd=
.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; amd-gfx@lists.freedesk=
top.org <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koeni=
g@amd.com>; airlied@linux.ie <airlied@linux.ie>; dri-devel@lists.freedeskto=
p.org <dri-devel@lists.freedesktop.org>; daniel@ffwll.ch <daniel@ffwll.ch>;=
 wyatt.wood@amd.com <wyatt.wood@amd.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; mikita.lipski@amd.com <mikita.lipski@amd.com>; Wentland, Har=
ry <Harry.Wentland@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.=
com>; Kotarac, Pavle <Pavle.Kotarac@amd.com>
Subject: RE: [PATCH AUTOSEL 5.17 13/23] drm/amd/display: undo clearing of z=
10 related function pointers

Hi,

Is S0i3 verified for DCN 3.1.6 with this?

BR,
Chandan V N

>From: Eric Yang <Eric.Yang2@amd.com>
>
>[ Upstream commit 9b9bd3f640640f94272a461b2dfe558f91b322c5 ]
>
> [Why]
>Z10 and S0i3 have some shared path. Previous code clean up , incorrectly r=
emoved these pointers, which breaks s0i3 restore
>
> [How]
>Do not clear the function pointers based on Z10 disable.
>
>Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
>Acked-by: Pavle Kotarac <Pavle.Kotarac@amd.com>
>Signed-off-by: Eric Yang <Eric.Yang2@amd.com>
>Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>---
> drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c | 5 -----
> 1 file changed, 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/drivers/g=
pu/drm/amd/display/dc/dcn31/dcn31_init.c
>index d7559e5a99ce..e708f07fe75a 100644
>--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
>+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
>@@ -153,9 +153,4 @@ void dcn31_hw_sequencer_construct(struct dc *dc)
>                dc->hwss.init_hw =3D dcn20_fpga_init_hw;
>                dc->hwseq->funcs.init_pipes =3D NULL;
>        }
>-      if (dc->debug.disable_z10) {
>-              /*hw not support z10 or sw disable it*/
>-              dc->hwss.z10_restore =3D NULL;
>-              dc->hwss.z10_save_init =3D NULL;
>-      }
> }
>--
>2.35.1
>

--_000_CH0PR12MB513911CB22A1842FD391126BF7D19CH0PR12MB5139namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
DCN 3.1.6 needs it, but I don't know if yellow carp needs it.&nbsp; I think=
 this is only applicable to kernel 5.18.&nbsp;
<a id=3D"OWAAM829909" class=3D"t0qjo mention ms-bgc-nlr ms-fcl-b" href=3D"m=
ailto:Nicholas.Kazlauskas@amd.com">
@Kazlauskas, Nicholas</a> can you verify?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> VURDIGERENATARAJ, CHA=
NDAN &lt;CHANDAN.VURDIGERENATARAJ@amd.com&gt;<br>
<b>Sent:</b> Wednesday, May 18, 2022 8:36 AM<br>
<b>To:</b> Sasha Levin &lt;sashal@kernel.org&gt;; linux-kernel@vger.kernel.=
org &lt;linux-kernel@vger.kernel.org&gt;; stable@vger.kernel.org &lt;stable=
@vger.kernel.org&gt;<br>
<b>Cc:</b> Yang, Eric &lt;Eric.Yang2@amd.com&gt;; haonan.wang2@amd.com &lt;=
haonan.wang2@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Pa=
n, Xinhui &lt;Xinhui.Pan@amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueir=
a@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.=
org&gt;;
 Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; airlied@linux.ie &lt;a=
irlied@linux.ie&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.fr=
eedesktop.org&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; wyatt.wood@amd.=
com &lt;wyatt.wood@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@am=
d.com&gt;;
 mikita.lipski@amd.com &lt;mikita.lipski@amd.com&gt;; Wentland, Harry &lt;H=
arry.Wentland@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd=
.com&gt;; Kotarac, Pavle &lt;Pavle.Kotarac@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH AUTOSEL 5.17 13/23] drm/amd/display: undo cleari=
ng of z10 related function pointers</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
Is S0i3 verified for DCN 3.1.6 with this?<br>
<br>
BR,<br>
Chandan V N<br>
<br>
&gt;From: Eric Yang &lt;Eric.Yang2@amd.com&gt;<br>
&gt;<br>
&gt;[ Upstream commit 9b9bd3f640640f94272a461b2dfe558f91b322c5 ]<br>
&gt;<br>
&gt; [Why]<br>
&gt;Z10 and S0i3 have some shared path. Previous code clean up , incorrectl=
y removed these pointers, which breaks s0i3 restore<br>
&gt;<br>
&gt; [How]<br>
&gt;Do not clear the function pointers based on Z10 disable.<br>
&gt;<br>
&gt;Reviewed-by: Nicholas Kazlauskas &lt;Nicholas.Kazlauskas@amd.com&gt;<br=
>
&gt;Acked-by: Pavle Kotarac &lt;Pavle.Kotarac@amd.com&gt;<br>
&gt;Signed-off-by: Eric Yang &lt;Eric.Yang2@amd.com&gt;<br>
&gt;Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt;Signed-off-by: Sasha Levin &lt;sashal@kernel.org&gt;<br>
&gt;---<br>
&gt; drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c | 5 -----<br>
&gt; 1 file changed, 5 deletions(-)<br>
&gt;<br>
&gt;diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/driver=
s/gpu/drm/amd/display/dc/dcn31/dcn31_init.c<br>
&gt;index d7559e5a99ce..e708f07fe75a 100644<br>
&gt;--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c<br>
&gt;+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c<br>
&gt;@@ -153,9 +153,4 @@ void dcn31_hw_sequencer_construct(struct dc *dc)<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; dc-&gt;hwss.init_hw =3D dcn20_fpga_init_hw;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; dc-&gt;hwseq-&gt;funcs.init_pipes =3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc-&gt;debug.disable_z10) {<br>
&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /*hw not support z10 or sw disable it*/<br>
&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; dc-&gt;hwss.z10_restore =3D NULL;<br>
&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; dc-&gt;hwss.z10_save_init =3D NULL;<br>
&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; }<br>
&gt;--<br>
&gt;2.35.1<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB513911CB22A1842FD391126BF7D19CH0PR12MB5139namp_--
