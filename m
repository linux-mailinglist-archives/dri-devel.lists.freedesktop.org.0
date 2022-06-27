Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D6855BB98
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 20:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E402A10FE80;
	Mon, 27 Jun 2022 18:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC0E10F97B;
 Mon, 27 Jun 2022 18:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+Sb0bjji3nc/X8mgWTCVcjQJUDVfCVh/yL5hzgra24+TcNW5JeZCRECK1BCjcCyrmnjLRivb/H+Qxn25PiD8fuJ9Asz9eQ0SIizbt2rnMn6dh3/gGrHaTmVd5DFwDkFxZjq4zAbi4JibNQFYJAAAdspo8YdM4qE9DuEYPDe4D564Kg5rbgMkJxbpURpZ4Xk0wzvD6hCMs6aOTM1QbDNJiZ6VYF3JdVJ+blGIOlJOo3CxYaUHrTD7evIS1YfT/klHvQY0eQeuvrbb36OmIzLuAp6IFe6QdOpb0hHRmD7437sS2QLmDvYjYwkgU1wUY3g2bTw2BWnm1OWLBzVtCtOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gXMBiGLx+pDr/NjzMy90MvYZG7T1ruhcX291tts0VE=;
 b=Zy18CMGwqSNLFZOBAhRr8ioIfCWtSmrcuRU/6XH/Wij+V/rsRaGLodtnW8M79CrJeBrTajAbyMdgSEIWR9xrH2aoc09YMg8VvdyW5vBrGvRF9qNvpgKquRWMBd36lTfwdPk6Uy3yUaMqKpZ6PH3LYvo+wgFQNfQcM52OJeHHQrOoetPBuFa/oQshLMuzqHBag7eNgZL/baFxm03jHp5FsfH2SHIcVOe4N2/tUgp+rmt5FqkBTwgIaTKh8AZFZKwVRaoPti5mbxW5SEm/PS81DRruFHQyMACJDDatJ631XuuQbCuC/Nww4hRwa2QuYZDSr+Mb+jEPmZaanj+qfKOZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gXMBiGLx+pDr/NjzMy90MvYZG7T1ruhcX291tts0VE=;
 b=mTDTF1Jg4nY3dsuX5fdzaFvP+TiMj19ArDZkES7JVdPSJFM7PYuI9SJs/bnDoxl6PLqn884A8Ce1fZ3Ec8WyQnTWq3sEdHCZrZ6E8SHvX040BtJ2JJZ68uNt/xb0DVlXC7Hhy0kNC3241lm4GDtFPJEyKTSfjTUZ5QEi8yHPnTg=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by IA1PR12MB6116.namprd12.prod.outlook.com (2603:10b6:208:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 18:21:39 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::589b:a1f6:9c87:a8ba]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::589b:a1f6:9c87:a8ba%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 18:21:39 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm: amd: amdgpu: fix checkpatch warnings
Thread-Topic: [PATCH] drm: amd: amdgpu: fix checkpatch warnings
Thread-Index: AQHYiiW9de+ky4v8Gk6KiKpE/Is28a1jj+oAgAAA81A=
Date: Mon, 27 Jun 2022 18:21:39 +0000
Message-ID: <BL1PR12MB51440F9451F48B65B5BDF9C9F7B99@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220627125834.481731-1-Vijendar.Mukunda@amd.com>
 <BL1PR12MB51446E8B038638B916529967F7B99@BL1PR12MB5144.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB51446E8B038638B916529967F7B99@BL1PR12MB5144.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-27T18:17:05Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=a25d9b6f-d79c-49d4-80e6-8858df9f19ed;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-27T18:21:37Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 13bcde53-599a-449d-a14d-0f63b7ca9c22
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d50d966-1cb8-423e-ab00-08da5869e0b9
x-ms-traffictypediagnostic: IA1PR12MB6116:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TsHwZ+PA6uq17CxTywH9ARjBpfJmiPwDAJOkDve7fbk8Cn/cYxFInTsS/bJhhVgzeZP9Jl19oSRhrN5LaRDcTgJJ1scRg0KISl/A4N8i8G8OPS2jfvBO4MfOhHbDRZ8yhFw4OEs91EJ3iTDHMGqkp6t10oGyI/UlmW87sOoQu4nKX4phjcLeLtXLxwnsRrNSk5hQH2LbrUszewnKb2leeUYrUPC3ye/N69f4E6nhg5wzS99mUhpj9qZfplcYTdd1y/AYX9eY1Zrz7PVjW3faDA+ER4SveoLztUChSDonekmMwNx2tLwWf7Z03W8LUY600GWBTeVFQ1/oNDa/UdtmTGRzzFabWrtiWG9Ljm7D3YPVeNxNo/9rLbxFhnsCsVqkzPISDmg0Y4BSVxM/CZ7HjdvyoLFNJO9M1px3Y14xZnS0MLCpOn2F43E9YGkhKaQk4zAM71cAKNMuzZQmvXDEuCDlK6K8HBjG2y7aKgcSpzv0tY7LCNcWvm7pqANF4CCh1eQS04bSt5dCWt4ecVH/o75215TFnQzynD2X30iT9vsUTnZYEg7FIA4Ka5I+4v0ZN1OJ0+9maKdus2jirVFoGR9KelJBMbUxh0HjwCbwWDm3dm1igCWwGEHFImhARVP9xxS1ecgCc/KcN7glQvkW5VwQYunZcDklEQ8M4ZGKap0gqy/iwMWCJOaXrOAASGGELPvYYQ1IsRYGnYFrfrf/XUiFd0IbFCaWll/LaJMA4VDhWhnVcclw2UGfBNsqyzTioHXT/1WZPsmEoAnfX+T49PAapGZV4o6k2ynGN6zQSUo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(64756008)(110136005)(38100700002)(66946007)(55016003)(66476007)(66556008)(4326008)(8676002)(66446008)(8936002)(52536014)(76116006)(54906003)(186003)(38070700005)(41300700001)(9686003)(478600001)(5660300002)(2906002)(33656002)(2940100002)(26005)(6506007)(316002)(122000001)(86362001)(53546011)(71200400001)(83380400001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZFberPoTvgvi/zsoN8+knOvMt/OcvwDcHyQ0YXUtTb2H/zcfm9yih2NJblVT?=
 =?us-ascii?Q?1bHFIbdCcIqzknSc7yXFFmdoSrj7ttESJKML3lKdzjcoGgN/D+o5t8q5JYwb?=
 =?us-ascii?Q?66FXnt9TBlYyL0pZ97R5iZjbmUF2Lg4dmDfzkZzapmbCmUz6tm9k4y+zxwwx?=
 =?us-ascii?Q?8vO7qjaDUtRwdBAsy9M1f+91cXhDU/O4Z8+yYsOs2WmyYXFGSIrB07SbCK+5?=
 =?us-ascii?Q?0vkKNw3vFoUgEftK+9HfNTDrd+o1mrXqSFAHn/dCzcgh8K3rntu9ng+kCByr?=
 =?us-ascii?Q?7xv102ZLXPMQR9Bf+l3kjgc7AosSTja1TOrhhSQ49XGHMIs9LzpYtXN1eJDJ?=
 =?us-ascii?Q?Qvax66pwVgGUOUqNihIs1NGPS9YLlKLGGFgqtFEeHzxvaInM/0U6Flf1Z9Fu?=
 =?us-ascii?Q?FBLFlY1iyTD3Q+t28stsQ6SBT5O2P12VThB6lhHC3Ea/2ctJjuXjmdAS8YPt?=
 =?us-ascii?Q?ezi1ssH61tJTDQ5ZjIfJ271/nkB1vIvw0pXADsXX9vdYK3Zyd0M/JzfXeg5Z?=
 =?us-ascii?Q?b4N/O+mV9r9rz1LON/ja54l7iaPEXkZDVWoERq0tjUBBdE5g0eSc/E6KIhk+?=
 =?us-ascii?Q?U12JYKKDkb7o1nOJS8qIW8l4WY/MXyjDszJCoQ9OMApaO5oWy5GPcw72PqOc?=
 =?us-ascii?Q?emWkSNFOijfO8j7TuT8mdH+f/35OP+wFI0fWMlcLf7B04aU5bDk/FvXy+ZAV?=
 =?us-ascii?Q?dusLKn6tiDIMlIJA5T55bxa+inRE+tMC9lsbISZffal/Gm3R6G0e0aq3NjNJ?=
 =?us-ascii?Q?oUMiNul0Nc0mTThCO0EGHO6uMd13FUp8SHx/5SUcBfgGHmTGo5oEaCp2bvsA?=
 =?us-ascii?Q?VqyDuPRonLW7aGzVazghCR8HUPXkTLe2yOM7TYUkzNJRo04X6MAmlhdfb3Ns?=
 =?us-ascii?Q?UgMqb2tLg3dSAUO2f969bedPUYTqa17iRk6KGj+/azeh5OAuEEu5bNBLN0Md?=
 =?us-ascii?Q?Ed4HyATMCrHHeWHkuJSXBUv3dMHlgxC4EpuxFzKU8Eo2qyIghZho/brVTn9t?=
 =?us-ascii?Q?DKuGGaA+BdCLmewHFWmxMaUFmaQYsKwTCV+xHKw/hVFESfH7x/Qbq4yfO4hY?=
 =?us-ascii?Q?rg3SiTMzgWpzUWPkpu0HyC7XVa95LWDsswXSt0otXxTkvJAs+S4pdJjaMq1f?=
 =?us-ascii?Q?OnH6+DcWh9ijeu/Mw3jv8wsjtLggOrjDOycTRbE+i1t0iSgCja4OlWrme+mG?=
 =?us-ascii?Q?Lw42EBGDjmzeBp+XxujuTEF2q7OiP83HzoFqGqJurBCY2GEf0V92zjEcdpxA?=
 =?us-ascii?Q?P3v8CzALBDuWz1LaL2vEbDyM3uGaPK1pENo4Rbrm+Q1wHes80vJgVTsYcdoN?=
 =?us-ascii?Q?YoQM8usQSrmmeXuX7XL47+j/UrLTJJbdxq3/BzhR9QgFoU9FArvcoB/ToCI3?=
 =?us-ascii?Q?Er1XI1WtT5cXjUnN7RMT1tc/HywQOon1dYab0eIjwX1/QPP++8jR0/VcTVy3?=
 =?us-ascii?Q?gijA/XdTkkBDzT9v4KposP7dRQJggt33AFscbbHtT3uAtNBpXipgjZhjbDDW?=
 =?us-ascii?Q?AyuPRum1PSwnMiVNnM8nXCNKUYGiogvDeLuuzB4C7wcE+5ltegJNOOfQu+KZ?=
 =?us-ascii?Q?cxAkAmuUIQQ01xUa6ZNF5pCnvIIf3LP/NahIv18r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d50d966-1cb8-423e-ab00-08da5869e0b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 18:21:39.0796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1dj51r/7T/WJCZOIe19WWcmSyMEfqA3mJewKMLLXfMmVNGfUfOWOn0cj35lHij43F0DP8IRpsv6A3FrcXoJJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6116
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
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 David Airlie <airlied@linux.ie>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Deucher, Alexander
> Sent: Monday, June 27, 2022 2:18 PM
> To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>; broonie@kernel.org;
> alsa-devel@alsa-project.org; dri-devel@lists.freedesktop.org; amd-
> gfx@lists.freedesktop.org
> Cc: Dommati, Sunil-kumar <Sunil-kumar.Dommati@amd.com>; David Airlie
> <airlied@linux.ie>; Hiregoudar, Basavaraj <Basavaraj.Hiregoudar@amd.com>;
> Pan, Xinhui <Xinhui.Pan@amd.com>; open list <linux-
> kernel@vger.kernel.org>; Kai-Heng Feng <kai.heng.feng@canonical.com>;
> Daniel Vetter <daniel@ffwll.ch>; Mukunda, Vijendar
> <Vijendar.Mukunda@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>
> Subject: RE: [PATCH] drm: amd: amdgpu: fix checkpatch warnings
>=20
> [AMD Official Use Only - General]
>=20
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Vijendar Mukunda
> > Sent: Monday, June 27, 2022 8:59 AM
> > To: broonie@kernel.org; alsa-devel@alsa-project.org; dri-
> > devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > Cc: Dommati, Sunil-kumar <Sunil-kumar.Dommati@amd.com>; David Airlie
> > <airlied@linux.ie>; Hiregoudar, Basavaraj
> > <Basavaraj.Hiregoudar@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> open
> > list <linux- kernel@vger.kernel.org>; Kai-Heng Feng
> > <kai.heng.feng@canonical.com>; Daniel Vetter <daniel@ffwll.ch>;
> > Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>
> > Subject: [PATCH] drm: amd: amdgpu: fix checkpatch warnings
> >
> > From: vijendar <vijendar.mukunda@amd.com>
> >
> > Fixed below checkpatch warnings and errors
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:131: CHECK: Comparison to
> NULL
> > could be written "apd"
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:150: CHECK: Comparison to
> NULL
> > could be written "apd"
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:196: CHECK: Prefer kernel
> type
> > 'u64' over 'uint64_t'
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:224: CHECK: Please don't use
> > multiple blank lines
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:226: CHECK: Comparison to
> NULL
> > could be written "!adev->acp.acp_genpd"
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:233: CHECK: Please don't use
> > multiple blank lines
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:239: CHECK: Alignment
> should
> > match open parenthesis
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:241: CHECK: Comparison to
> NULL
> > could be written "!adev->acp.acp_cell"
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:247: CHECK: Comparison to
> NULL
> > could be written "!adev->acp.acp_res"
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:253: CHECK: Comparison to
> NULL
> > could be written "!i2s_pdata"
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:350: CHECK: Alignment
> should
> > match open parenthesis
> > drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:550: ERROR: that open brace
> {
> > should be on the previous line
> >
> > Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>=20
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>=20

I'm also fine to have this go through the audio tree if it is a pre-requisi=
te for your jadeite audio series.

Alex

> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 27
> > +++++++++----------------
> >  1 file changed, 10 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> > index cc9c9f8b23b2..ba1605ff521f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> > @@ -128,7 +128,7 @@ static int acp_poweroff(struct generic_pm_domain
> > *genpd)
> >  	struct amdgpu_device *adev;
> >
> >  	apd =3D container_of(genpd, struct acp_pm_domain, gpd);
> > -	if (apd !=3D NULL) {
> > +	if (apd) {
> >  		adev =3D apd->adev;
> >  	/* call smu to POWER GATE ACP block
> >  	 * smu will
> > @@ -147,7 +147,7 @@ static int acp_poweron(struct generic_pm_domain
> > *genpd)
> >  	struct amdgpu_device *adev;
> >
> >  	apd =3D container_of(genpd, struct acp_pm_domain, gpd);
> > -	if (apd !=3D NULL) {
> > +	if (apd) {
> >  		adev =3D apd->adev;
> >  	/* call smu to UNGATE ACP block
> >  	 * smu will
> > @@ -193,7 +193,7 @@ static int acp_genpd_remove_device(struct device
> > *dev, void *data)  static int acp_hw_init(void *handle)  {
> >  	int r;
> > -	uint64_t acp_base;
> > +	u64 acp_base;
> >  	u32 val =3D 0;
> >  	u32 count =3D 0;
> >  	struct i2s_platform_data *i2s_pdata =3D NULL; @@ -220,37 +220,32
> @@
> > static int acp_hw_init(void *handle)
> >  		return -EINVAL;
> >
> >  	acp_base =3D adev->rmmio_base;
> > -
> > -
> >  	adev->acp.acp_genpd =3D kzalloc(sizeof(struct acp_pm_domain),
> > GFP_KERNEL);
> > -	if (adev->acp.acp_genpd =3D=3D NULL)
> > +	if (!adev->acp.acp_genpd)
> >  		return -ENOMEM;
> >
> >  	adev->acp.acp_genpd->gpd.name =3D "ACP_AUDIO";
> >  	adev->acp.acp_genpd->gpd.power_off =3D acp_poweroff;
> >  	adev->acp.acp_genpd->gpd.power_on =3D acp_poweron;
> > -
> > -
> >  	adev->acp.acp_genpd->adev =3D adev;
> >
> >  	pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
> >
> > -	adev->acp.acp_cell =3D kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
> > -							GFP_KERNEL);
> > +	adev->acp.acp_cell =3D kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
> > +GFP_KERNEL);
> >
> > -	if (adev->acp.acp_cell =3D=3D NULL) {
> > +	if (!adev->acp.acp_cell) {
> >  		r =3D -ENOMEM;
> >  		goto failure;
> >  	}
> >
> >  	adev->acp.acp_res =3D kcalloc(5, sizeof(struct resource), GFP_KERNEL)=
;
> > -	if (adev->acp.acp_res =3D=3D NULL) {
> > +	if (!adev->acp.acp_res) {
> >  		r =3D -ENOMEM;
> >  		goto failure;
> >  	}
> >
> >  	i2s_pdata =3D kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL=
);
> > -	if (i2s_pdata =3D=3D NULL) {
> > +	if (!i2s_pdata) {
> >  		r =3D -ENOMEM;
> >  		goto failure;
> >  	}
> > @@ -346,8 +341,7 @@ static int acp_hw_init(void *handle)
> >  	adev->acp.acp_cell[3].platform_data =3D &i2s_pdata[2];
> >  	adev->acp.acp_cell[3].pdata_size =3D sizeof(struct i2s_platform_data)=
;
> >
> > -	r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
> > -								ACP_DEVS);
> > +	r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
> > +ACP_DEVS);
> >  	if (r)
> >  		goto failure;
> >
> > @@ -546,8 +540,7 @@ static const struct amd_ip_funcs acp_ip_funcs =3D {
> >  	.set_powergating_state =3D acp_set_powergating_state,  };
> >
> > -const struct amdgpu_ip_block_version acp_ip_block =3D -{
> > +const struct amdgpu_ip_block_version acp_ip_block =3D {
> >  	.type =3D AMD_IP_BLOCK_TYPE_ACP,
> >  	.major =3D 2,
> >  	.minor =3D 2,
> > --
> > 2.25.1
