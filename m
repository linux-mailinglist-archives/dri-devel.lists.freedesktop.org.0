Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD5668714
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C63510E944;
	Thu, 12 Jan 2023 22:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6ACC10E944;
 Thu, 12 Jan 2023 22:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DerNMCRG3FhIQOA0H4iRacxMaWscNLDAUetFWl9KOgxjSHz2yK9eflvoZP+qdO540gsTYZzeXqtVmJZM0gOgbCUTgVf7q5WYkbtI2HEViHVE7ShpL/s8+DdtAGx17TBNAtGwtN0ZzFbj6oNMmb92aztW9HNCFTz34QDTbwZJpUErWVshkE6lEae+AAidYsOtnAbei06AxLhuJ26zWKb9waHQoxHK3zVfSFd46HL60n07LrVYDReVy6ZR1mFmyS+RbYV1aWF21mtbcrcbL55qcbJUxM7M9ZVUlpoT4w2ujS78puTRykfVBtubCXYwghT6mN4y4zNbqduYNsNNF1p/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOXc9IwbKXL/fUAUY0rVCTtCA/tFCTmz7CU4Pl8/hTs=;
 b=IJnzQ9vegxynF0sEU9RIz3as3EsUrx3qWVve8AhdYqN/SswiKR04FtvYpRJCsz4FN0IfmZBDp+LBxrOFwxoj2tqrN/K1CPtSsnFyC3ljMRVYTgAJiPaCFIwvHvDKfML5wVsIA4mp2xN40HVr6WD13CiceaQG/w+enyIBBygcOjZIyjjD5N2sMQAShOCAYEsoKjw7HLpNxlo/9wNmJN1Q/1VvdyYXBKjuanlOI1ZDYfOP6vp0hGUaVgkWTDEp9iPYs+pRYgQXmLLomOcfjSoeb2sCONCT9MKqtXdwvaXRthEnE7VmcwwDq2cBH9/Zt7+Q5h2go1FxLLw9TvgG3RqgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOXc9IwbKXL/fUAUY0rVCTtCA/tFCTmz7CU4Pl8/hTs=;
 b=VdRHPdHKbnTE7eymamW2X2bz5J8VZ/G26mfFM9xMq1hjTfqYYYUx0U7x8Zi1+0f1f50QwnHrM935HFspcDxggIA5J2jum/0YCpwrpTFcDYyrqEN3Ol3DXD+KdNr7qZKI6zah82AJryH5LFA5M0EhqWzeDOqFJPcuQpQDPkryzb4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM8PR12MB5477.namprd12.prod.outlook.com (2603:10b6:8:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 22:39:20 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 22:39:20 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: coverity-bot <keescook@chromium.org>
Subject: RE: Coverity: dm_dmub_sw_init(): Incorrect expression
Thread-Topic: Coverity: dm_dmub_sw_init(): Incorrect expression
Thread-Index: AQHZJtTECKjZOHrrA0Or7NAan2z2hq6bX6Gw
Date: Thu, 12 Jan 2023 22:39:20 +0000
Message-ID: <MN0PR12MB6101667DFB81967706C13111E2FD9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <202301121425.FB249B61B4@keescook>
In-Reply-To: <202301121425.FB249B61B4@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-12T22:39:18Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=01286f80-20b7-4ccb-8a21-4f66ef654ab7;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-01-12T22:39:18Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 7a39bf39-cc4a-4df3-bf19-8ef46ce1f562
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DM8PR12MB5477:EE_
x-ms-office365-filtering-correlation-id: a323c9ad-47ef-40a1-e143-08daf4edd89d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Om7OUWhwqnqbQNv5Y2wq9R78x/wLej9GvTQjAmdREG5M2JVUQUa8NfXHzzeZPGAkQq1uKb0v0TIs0qV4rZmH692bpdsSLQ1eyf6sdAyFUwpEtyvQJ6+sKupTtqGv2mKuebIkdwN7pReN6cMfQgwyYNcKtA8gHKdAOD6eS+XF2nt5yHaqysdj/339LoOk2lpNhQDsLaSZhvcoynlXtTDEHRarzQCOqnW7m3FzMLqdtAHhzy/6iypaRPZ7BbrTzppvCOmXArlyhGZA05EtrbYN80BZ96cZKdfkXy/sgEczLX86irsLVVZhLU5PcWHnfb8pjgrhLZqyMtk4/fj4Q87qal427faZj0ks9tGPVpT6n18vJDuJSRoNIBsANSOC57K8wnDv6TrHa5UuJENSjMI1nGtAcBWXINCRN2UM98xGLYxO/oh1BbKF6GU9MDZdq9Bjo2lDQORyL0FKty7lSZVoT7hE+JAWpdqjax4OV/JrC1i35Z/GRuFj20fSB+/eKUc7Vh/o2WWAfdM84UVnW1gUH/KuVf0TaVVl4ZJsVXKn8rjP3NLqCkfjsSwWgvgy0vEHIbupAQhw2ED3yqlfvH0wXleUrRV0f429ZoaYwmdg+Rg44PHt4t4BSLHGPFrCJQTc8sfKZwpEV4Vg09rF64GLYoEwfIKGMmVMI+VGywViSOWrS+5mZEAnFM0CYzljaJ3hcNhcCNFQwjqPntsyMjYWKbH42InWzMDxTSFhnKju4Yc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(6506007)(478600001)(6916009)(33656002)(76116006)(55016003)(186003)(9686003)(966005)(66476007)(8676002)(71200400001)(66446008)(7696005)(64756008)(66946007)(41300700001)(53546011)(316002)(54906003)(4326008)(83380400001)(86362001)(38070700005)(38100700002)(122000001)(66556008)(52536014)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZbnsTmx8aApJ0Suk2O8lNZETVIzWa13hdZqqwG2YwGdZFDvbtL3jN9wBh4TE?=
 =?us-ascii?Q?HDtkiA5Gt27X1DTU/nVbqwAe28X1gzbEXwuPDINyAbqgxEOplmm3ctBwrtLe?=
 =?us-ascii?Q?asbxd7ijR7MqPQdTWFxEpVtIIjDxp0mJb1SsIDLLIbbdtakR0q5gsnDRpZeR?=
 =?us-ascii?Q?yM1lAivqgsFadk8rWQL7MWJFZxgdLpUxBejxaHIDfuRjnBvJCh4WD0MPGzv6?=
 =?us-ascii?Q?sbeC8Ql31HbT/4fO7YeyHbBry5EpHf0M/7LpR5JoS/Xxm8IdXU4IY2WdpNGD?=
 =?us-ascii?Q?kupL5I/vxFOmnudFH/jEOKsv0PM7WznE+MDxEQtY6cnR9tGGyxvMX3EaH7Sf?=
 =?us-ascii?Q?ulBMF4v5ma4WNNFz3R3S1f75/zsCL5G0jImfWfEyQz1mvwgG6cfC7lcRl/Qg?=
 =?us-ascii?Q?2S6hsBA/WDdSacJbImdOlzq+v2cPsu1LqtE+RdqDTrxRSQxSdc79PVBzeyWp?=
 =?us-ascii?Q?tcVd77RMbJygmILA1u+oPmwRN5tMk2g8iuvgAXYuCzHegGNeCOAKyELOjLZK?=
 =?us-ascii?Q?Xo1Loscqjw5vUnGI57LbrcVA63PVLuu6QNKX7I5nr7bBER4jY80g7qwjTBnh?=
 =?us-ascii?Q?YcWmNB1TMpelc8/A3FM3dB3IHxvE8nT4VhLgM8bxGP+dlkJvsVHrxrOGrmpk?=
 =?us-ascii?Q?4quZtXpeuuKxJAvNZKRNcfS9InF5R5VQhgngSLy08RQ5BWz1C4IYWx5JG9Tr?=
 =?us-ascii?Q?7lQBurUewk6EHbP/s6rOaJ5eMF4F9r6tb8kz1T/KzcO4TX9ld5SZHO3DpZJ7?=
 =?us-ascii?Q?wA2U4IVQ5cGPWUV0fHEkSH8PINQMV2bWlqEnx4HGtwTB6e7dHXvRPfg+6hhL?=
 =?us-ascii?Q?5QiWHDiRh7VKmJbg0exUWCLNQxeies3Or5fTtrkwCSsYDkV9FzInLGlaKEdT?=
 =?us-ascii?Q?w6wB1K9F8liS+IbyELBuWWuYmkpF2DKfkYkbSPz+qMWOKcNikHhecZCxelax?=
 =?us-ascii?Q?QwfXN3S7NdOqzhqnKqtVBxNFmtRXxD0UdUkaAQ2i1H9DvUcavgTDhKxlNamu?=
 =?us-ascii?Q?B8PIokW8R1637U9/VEtp1WSgPWB7aRB3jc5HL7LnKYNZbRJiXsxeUam/iC7J?=
 =?us-ascii?Q?Iu61M4VZkOUesVLYu5xAjnveEfAXR1DylA++L2Abz0UzeZW35vC8+9W6a2Xj?=
 =?us-ascii?Q?xOjAZKSt1S1YfZ5NYlYATVc2rSFskNyZg64mU31RgBh24YCMUsZKK7QBqT1v?=
 =?us-ascii?Q?iCSwq1BRDj03dEsqoH76lfFji/TAaQU7CFrXLgoHz8t6Epw4L0uoXQeZBloA?=
 =?us-ascii?Q?GUsV8myoeTbOXf2uQ4aqCR9ti4FaVCDwiPiAGujhTwKjAqWG0exauY0Bw/g7?=
 =?us-ascii?Q?n27Fu+7YEPEEbS33ZbezO1UDbfHwgoBT+HS7KLd/4CHJGO/taIgbuSeSRDcl?=
 =?us-ascii?Q?Sf1upamwwMEZpqKyrZ7gxgC9653bMuIGcOTI6mDcb0spacEvlrpJnSZOOCWH?=
 =?us-ascii?Q?jzu1dm5ft2BNNxS4rdGgO0UNX0LkXddg9oLVr0JdG+DgfZQVaT0tqjPz/Pjv?=
 =?us-ascii?Q?G3oioyBNZO1v5YPrLvkUFNenqywIVANIPZfGpCWLIc+DN2X9BpkFNduIgR9c?=
 =?us-ascii?Q?mehu+c6CATwN1EGhZSsIe2tpiFrWPlY5um0a0d9kpttXtv3Zdiky9f/5Pdvr?=
 =?us-ascii?Q?/c8xDDxhWiqv37PlM2lrId4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a323c9ad-47ef-40a1-e143-08daf4edd89d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 22:39:20.4529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJh7y8QdXaPrXOYwDgKke/bqX0GNdtgeTpnQZKVtrd7G73zBfJNDKqEFsPOg8PS4Q2GkKjvIy/w7YcUJmZxILw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5477
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
Cc: "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Siqueira, 
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Roman" <Roman.Li@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Wu, Hersen" <hersenxs.wu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

This particular one was fixed already in https://patchwork.freedesktop.org/=
patch/518050/ which got applied today.

> -----Original Message-----
> From: coverity-bot <keescook@chromium.org>
> Sent: Thursday, January 12, 2023 16:25
> To: Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: linux-kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; Siqueira=
,
> Rodrigo <Rodrigo.Siqueira@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Li, Roman <Roman.Li@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; dri-
> devel@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>=
;
> Lazar, Lijo <Lijo.Lazar@amd.com>; Pillai, Aurabindo
> <Aurabindo.Pillai@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Daniel Vetter
> <daniel@ffwll.ch>; David Airlie <airlied@gmail.com>; Pan, Xinhui
> <Xinhui.Pan@amd.com>; Wheeler, Daniel <Daniel.Wheeler@amd.com>;
> Gustavo A. R. Silva <gustavo@embeddedor.com>; linux-next@vger.kernel.org;
> linux-hardening@vger.kernel.org
> Subject: Coverity: dm_dmub_sw_init(): Incorrect expression
>=20
> Hello!
>=20
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20230111 as part of the linux-next scan proj=
ect:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>=20
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>=20
>   Tue Jan 10 14:32:57 2023 -0500
>     a7ab345149b8 ("drm/amd/display: Load DMUB microcode during early_init=
")
>=20
> Coverity reported the following:
>=20
> *** CID 1530544:  Incorrect expression  (IDENTICAL_BRANCHES)
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1951 in
> dm_dmub_sw_init()
> 1945
> 1946     	switch (adev->ip_versions[DCE_HWIP][0]) {
> 1947     	case IP_VERSION(2, 1, 0):
> 1948     		dmub_asic =3D DMUB_ASIC_DCN21;
> 1949     		break;
> 1950     	case IP_VERSION(3, 0, 0):
> vvv     CID 1530544:  Incorrect expression  (IDENTICAL_BRANCHES)
> vvv     The same code is executed regardless of whether "adev-
> >ip_versions[GC_HWIP][0] =3D=3D 656128U" is true, because the 'then' and =
'else'
> branches are identical. Should one of the branches be modified, or the en=
tire 'if'
> statement replaced?
> 1951     		if (adev->ip_versions[GC_HWIP][0] =3D=3D IP_VERSION(10, 3, 0))
> 1952     			dmub_asic =3D DMUB_ASIC_DCN30;
> 1953     		else
> 1954     			dmub_asic =3D DMUB_ASIC_DCN30;
> 1955     		break;
> 1956     	case IP_VERSION(3, 0, 1):
>=20
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
>=20
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1530544 ("Incorrect expression")
> Fixes: a7ab345149b8 ("drm/amd/display: Load DMUB microcode during
> early_init")
>=20
> Thanks for your attention!
>=20
> --
> Coverity-bot
