Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ED585B734
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE11110E2D0;
	Tue, 20 Feb 2024 09:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="y168Tq1N";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="M/DVjQKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96810E2AC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:22:10 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41K833vB017719; Tue, 20 Feb 2024 09:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=Y0fT3rEzvfxwmUuku1zz2
 P8bQ5YBgNUiYas7MB+rpyA=; b=y168Tq1NJn2t8eRvBnz9Ze5cEbH6jGOARQ54c
 SVZUht6AtJeVFyZSqiU1LkVlC3/TZ5nnfBcjxUlx5yG/g2ZpJi1Wa/afhdOth71n
 ejRs2Ip2fHCJk0w8X6xDCQAmI30J2dhQWdpeDE+IAgZNEL22+2wsUw7vYZt5y8mq
 C4/CEgMWhhemdhnp6CnNQvIKLUBM68jbd49vjUQK0VYVkvbjRYFDQpFcRsdv5OvJ
 ope21g0ksGkYgruMDs44R8mJ6UpHbbdwkBj60e6eU4i2jAwM7WTe/qivBU6uwHTW
 C/zMr264v8qwOUUlTGgsPlOiMkUZgwP9wEGfVhNAW4zy9S5Zg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wanrvt7h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Feb 2024 09:21:47 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 09:21:46 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 20 Feb 2024 09:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AReI/hXe8BjQVsjKAgTPYU2rW/PYhiihVrWJdqrrAN3aiweJkzwfldbNBbljUISfsEls+/FMgXvWQ6vRPnsWIFH8lghmO0BXy8+uDSGQk/Kr1a3UhUAsVTty3PrtyaAmzfsQtW9ogXk8aluLR5FzlGSbmSkIAwLzFUcVnDUbO8gAFL5/0FYsEtx2vxfJ0naA30jxWh189dexSDDnInFotzHbroDoi5pab3Ahg6xNEI3orhu1+njWgSaqwZ8s6rJJjJP806n2mkTsjmx61arGhwl47IoPZ1zCG4VhinqPdD2Nfa13rYvsIurqDaM7SvUfrtekLOo0TUSpeuJ4VFEHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0fT3rEzvfxwmUuku1zz2P8bQ5YBgNUiYas7MB+rpyA=;
 b=Zvix/l3+I5+nrwMQ8wHfK3PhCu8n7zhvztlTWPP9NEO4sojsxh2JQLe5kWk3Ud9vY96b/YqYHMI3kznSe3wRhyWF0+4m+bHOSL3qjF+1+EDLYYB3sykd4mjLpEa8qtgaCCFuqbBKVWkdCecYGxC1c6r/griEDFh9Mw6XknuKoHMWZwyuXyT1SZkyeuOjgJL2ecW/JJcF1G207bnNtFC5H5GRv6DNYYsT2DE2t26ZXMa35JEc505HqaQZzBk2pmYHReAGgUBBsPHOp2KUuhogszy3BMptufOJC0WvokPaFKd8rAuR7bJ6FE3Q3QlH/14OZIxjQDj6xCOWz9R0RhQVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0fT3rEzvfxwmUuku1zz2P8bQ5YBgNUiYas7MB+rpyA=;
 b=M/DVjQKnrZL2HaupMfYnOJkTr/nxFvBH1XvK9WtHS5yz/7bQG3fypNnU0k38lR59HQYdR+5SCWgUw5etlDqSmQwxpL9BN4ZMh23cZynacV0TeCOZMxw5SNKQy8fMFXC14cogRrHpGSeZIlZ9dYxcGD++mLPWi8HcwRJP+bANbbs=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by CWLP265MB6403.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 09:21:44 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626%5]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 09:21:44 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>
CC: Maxime Ripard <mripard@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Sarah
 Walker" <Sarah.Walker@imgtec.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Nishanth Menon <nm@ti.com>, Marek Vasut
 <marek.vasut@mailbox.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Topic: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Index: AQHaY944iaSwBSHHh0GHv2NwHQ+25g==
Date: Tue, 20 Feb 2024 09:21:44 +0000
Message-ID: <f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@imgtec.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
 <1ff513b9-d4fd-4663-b46b-bb9662e3881c@imgtec.com>
 <CAHCN7xJ0TTS_-PA3Ox_RCpfyHJFk-s=-zs8W1Zm3dQTUAoqbpg@mail.gmail.com>
In-Reply-To: <CAHCN7xJ0TTS_-PA3Ox_RCpfyHJFk-s=-zs8W1Zm3dQTUAoqbpg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|CWLP265MB6403:EE_
x-ms-office365-filtering-correlation-id: 0f2ed591-c176-4a6f-69e6-08dc31f55afc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RA2t4Rxr+oPW1WpDsf3+84xvKtND4hoGEkQbJWfFRvW5mAempu90qvR06eMjZFWeDqj6Qgt6J9RbhOO30s2CoKDd1XNYaKSOdcPQuHgWxQ65xYFpin27BBABvmfMyAfG2JCvNBXURKGkGM9HaJ1o0ylAMGHN9/qaim2bQRmfTbuqzinn8wO/b07S7HtOABlOuX2Yke32XR1OGFyE0fajhoO+RYmhA2Ciz5GrbJmTXUOTL8/DXPS9Gd0RdWz9MinshizyKN4Dnbab0e5JjIMORFTRFuxl3HgnUxaAG6iqnTVWgUFyIcaMbhGHOo6bi3FkczsVwA+UnliTgMzaIjSTiS/UIdvKgPPM+1NNnPxZSmRqgIL5NjZSZjkGUg5shQe0N8MZOnoKHi/MgdQMyziKZOr1xP/Po1m1lAx2PrWGQpXpL7jYHuoWb9Cho3vMUMjTogj/l5wXtyrm7fmf+GF2HtOWYj5p4aFL0P7oWFvsamWkIdVj/iG7uLkqK60MQu7Ci6sQPuYx8yXNFAQMhDmlB2edf4cSizrl3m2/Gt0n5LOuC7w8xEMQggQ92YDryViHcDvJG7S+A7MEYIxRIVv8IiqFLbgkQKXwxJFQlXDMy9o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUcxNWZib011Q0RtMno1OE8wcVdDZTN5WE1lektvS2lzQjV4QVZvclZKZHJS?=
 =?utf-8?B?cTM3cFZ4MGpEUHpBWU9UTUtjWGhGQWhnWXBoR2cwektLaDhlNEhZdUptc0h6?=
 =?utf-8?B?MlY1cXZsMXdWcXVOVFZYUDFwVFRSU0hZRmdHWExPQU9EUktNMUpSQTcvVzVH?=
 =?utf-8?B?ZFB0NXJ2S0JPOEF1QTU4Rnk0L252aDJBUHNaaHk2Qm1hUUtpVDJMUlpQWWxC?=
 =?utf-8?B?bVJzcHNvTnRtQWNaSW4xalB1dDJ0eDV4Vk01Q1RjQzFJZm0xOFpsbnpyVTVW?=
 =?utf-8?B?aXBUdHJhZVZMRW1QYjhNbUYyUGc5bnltVEZJei9TQWxmS3IxQXBaekpVbldz?=
 =?utf-8?B?eHhoYnVaU3p6THVBb29NY040TDF1Y3pjODNNM2k2T1ZVUmp4dFA5di93VVFV?=
 =?utf-8?B?OW5yeGlaV3NkTjdFSm56R3FQOG1wVGJhMU1COC8xa3FPckYyV3YxRElYMUhM?=
 =?utf-8?B?azVzUmI5VXVwRGlXZW9sUzcvNGhWT2pjYmdFZ1QzYktyZ0tSVktsbTAwbFYx?=
 =?utf-8?B?eUhaSTZudVJWdzNXc3o3OG1qQVNrcXpmMWdack5CMUZkalFReGV6T1NtTE1G?=
 =?utf-8?B?ZDBxNEZVU3VmdTNKUVJiNmczT0NDVEpMOFBMY01hQjFpNVZLTis5dE8zM01o?=
 =?utf-8?B?VWhwQi9pbkk2WCt3WkpHWDZaOENtTVpESjRFSlF0NythaStYRE5SNlUvVFhT?=
 =?utf-8?B?RlcxK3RtU3pKUnl2RkRCQnBrKzlQUElGenRKU2ovV0hhQ0VaUS94a21NY2I5?=
 =?utf-8?B?blN5TU1uZDYwelBMWFN4T2F2ZEEvUnZPYVhoT3RkN0E3UnVZUTZmbGp0cEtl?=
 =?utf-8?B?TEFGeEw3N3MrcytnbnJLay9IYTF0NVlZdjJKZlloQzBhVWdjRHlFT2hyNTln?=
 =?utf-8?B?WGQrWjE3K0ZCaFpFbUVyenZ5TlVLaHhzTyt4R3pFem9mTUFqQWpIcFpZTm1O?=
 =?utf-8?B?bjlzNzRlWlI2dTlDQldyNWJXT0o2dThvelNZdUM3UmhJQytMZ1Zha3lZeE1n?=
 =?utf-8?B?MkFub2laV1JUQ3BXdXZ4YXJ5UzFKYmhDbEk5VzZHT2VEUURISVJTZFlGeFVI?=
 =?utf-8?B?Z2VqK3djZGpCNXNJaS90d2toZ1RQUktQUUVXcXZwNDd1bzNFQ0ZWNGEvU0Ri?=
 =?utf-8?B?L1E1dzYxN2wyUmk3Q0YyeGM4czlsU2dzVUFWUHhSL0NvMStIOXNDbnRnL29M?=
 =?utf-8?B?dXBQSjVxbDFHQ3p4STF6R3E2N0lSQUVxdjNZdVdCNzNtUm9rVlhJWTBQbEpJ?=
 =?utf-8?B?U1hFRysyaDBhbjdmNGpDeEJXaEJqRWFlMy9Fb0tpd2NTUmI3elFtY1JYTUtI?=
 =?utf-8?B?SkdwQ2pObFJnczJSZTloSlpDemVic1EvYzNXWG5VM2V2eTA2cWtnOU1aMWlV?=
 =?utf-8?B?TkZFVkhLNkR6RE1yR09qajZmTTlVaFJBc2tNZDM3TmhtUHRhZFltYjNCUURy?=
 =?utf-8?B?RjF2SlgrVjZwRHNoZUMzaFBqR0ZNbkcvNTFpSEdENi9DK0Z6UlpsRFFBVDVB?=
 =?utf-8?B?REFWa2ZsVjgyNzZMakRDdE5oT3lBOXI2RmM0WW9LZitWeE53Z29BQkVaeFc4?=
 =?utf-8?B?NHdwUFVwOTdnVFd2LzhGVDhsZ2R2ZysrUHlFUlI2ZmhOMG0vcFppMDJyUFZI?=
 =?utf-8?B?OGNzOHRaSjgwWjAzRkhRRW5wYlFrTFBUSFEvOE0rb2xnaWYyMGU3UW83eU84?=
 =?utf-8?B?bFVjb2VMcU0rdnFGVDN5TGppdlc5eTVoWW1qRW91aHR1UWxUanA0UStXUXlH?=
 =?utf-8?B?QUp2OVhYNVF6NERXeSt4Z1pvYVd1aWtOT3hvOGQ5RU12cFZhS0oycEE0cEJq?=
 =?utf-8?B?ak5MWlNnU2Z6TUU1elZUbkNFSWRqd1RZeDRoYVlTTDROSHUwcDg0eU14a2JL?=
 =?utf-8?B?T28rYXQ2ZU52RnY5Zkg4M3U2bFBEQTdDYVFFSThsVmdtcHErd3NQWEtjWVBh?=
 =?utf-8?B?S0RhYmw5anZ2bEtVVFJsMTZYNXY5T3Vnc1ZqVE5MMXNRaEo5M29wNS9oZ2Uz?=
 =?utf-8?B?QkIrVHRIMkJIZ0tUUHFER2F1RkVPRXZtSkk1NFdpMlVNNFhhYU12U0pVckpG?=
 =?utf-8?B?TldtT0I3SkFoZ20vNVBrUjVOamFHaW9QcEZxcEN6a3RVRGNlQnlNdDdtL2NJ?=
 =?utf-8?B?ajlzUEMrZVFBYm9STVBnelBsZ3EremxzczNOZUZEbjR0T2tJSS9SU2xIaENH?=
 =?utf-8?B?dVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EqiMJRriQXhuDt0wQHM6brVL"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2ed591-c176-4a6f-69e6-08dc31f55afc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 09:21:44.2411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yT0x8Hj7tF0+KKcTLibfXIR5sVtxDwtZG6d2fEkj01fNCLPtv8KkkQ8gh/XpPgtNqpEx0/X13s3MjJTAszwRXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6403
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: GHj4h7bcYmg60GhWBa6pZ-XezoSv7xRz
X-Proofpoint-GUID: GHj4h7bcYmg60GhWBa6pZ-XezoSv7xRz
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

--------------EqiMJRriQXhuDt0wQHM6brVL
Content-Type: multipart/mixed; boundary="------------E2yuDuXCQvagJ0ZH378EhSLJ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sarah Walker <Sarah.Walker@imgtec.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>,
 Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
 <1ff513b9-d4fd-4663-b46b-bb9662e3881c@imgtec.com>
 <CAHCN7xJ0TTS_-PA3Ox_RCpfyHJFk-s=-zs8W1Zm3dQTUAoqbpg@mail.gmail.com>
In-Reply-To: <CAHCN7xJ0TTS_-PA3Ox_RCpfyHJFk-s=-zs8W1Zm3dQTUAoqbpg@mail.gmail.com>

--------------E2yuDuXCQvagJ0ZH378EhSLJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On 19/02/2024 20:38, Adam Ford wrote:
> On Mon, Feb 19, 2024 at 3:00=E2=80=AFAM Matt Coster <Matt.Coster@imgtec=
=2Ecom> wrote:
>>
>> Hi Adam,
>>
>> On 18/02/2024 23:26, Adam Ford wrote:
>>> On Fri, Feb 16, 2024 at 8:14=E2=80=AFAM Maxime Ripard <mripard@kernel=
=2Eorg> wrote:
>>>>
>>>> On Fri, Feb 16, 2024 at 09:13:14AM +0000, Biju Das wrote:
>>>>> Hi Maxime Ripard,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Maxime Ripard <mripard@kernel.org>
>>>>>> Sent: Friday, February 16, 2024 9:05 AM
>>>>>> Subject: Re: RE: [PATCH v2] drm/imagination: DRM_POWERVR should de=
pend on
>>>>>> ARCH_K3
>>>>>>
>>>>>> On Fri, Feb 16, 2024 at 08:47:46AM +0000, Biju Das wrote:
>>>>>>> Hi Adam Ford,
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Adam Ford <aford173@gmail.com>
>>>>>>>> Sent: Thursday, February 15, 2024 11:36 PM
>>>>>>>> Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depe=
nd
>>>>>>>> on
>>>>>>>> ARCH_K3
>>>>>>>>
>>>>>>>> On Thu, Feb 15, 2024 at 11:22=E2=80=AFAM Adam Ford <aford173@gma=
il.com> wrote:
>>>>>>>>>
>>>>>>>>> On Thu, Feb 15, 2024 at 11:10=E2=80=AFAM Adam Ford <aford173@gm=
ail.com>
>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>> On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
>>>>>>>>>> <geert@linux-m68k.org> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi Maxime,
>>>>>>>>>>>
>>>>>>>>>>> On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard
>>>>>>>>>>> <mripard@kernel.org>
>>>>>>>> wrote:
>>>>>>>>>>>> On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven=

>>>>>>>> wrote:
>>>>>>>>>>>>> Using the Imagination Technologies PowerVR Series 6 GPU
>>>>>>>>>>>>> requires a proprietary firmware image, which is currently
>>>>>>>>>>>>> only available for Texas Instruments K3 AM62x SoCs.  Hence
>>>>>>>>>>>>> add a dependency on ARCH_K3, to prevent asking the user
>>>>>>>>>>>>> about this driver when configuring a kernel without Texas
>>>>>>>>>>>>> Instruments K3
>>>>>>>> Multicore SoC support.
>>>>>>>>>>>>
>>>>>>>>>>>> This wasn't making sense the first time you sent it, and now=

>>>>>>>>>>>> that commit log is just plain wrong. We have firmwares for
>>>>>>>>>>>> the G6110, GX6250, GX6650, BXE-4-32, and BXS-4-64 models,
>>>>>>>>>>>> which can be found on (at least) Renesas, Mediatek,
>>>>>>>>>>>> Rockchip, TI and StarFive, so across three
>>>>>>>>>>>
>>>>>>>>>>> I am so happy to be proven wrong!
>>>>>>>>>>> Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g.
>>>>>>>>>>> R-Car M3-
>>>>>>>> W.
>>>>>>>>>>>
>>>>>>>>>>>> architectures and 5 platforms. In two months.
>>>>>>>>>>>
>>>>>>>>>>> That sounds like great progress, thanks a lot!
>>>>>>>>>>>
>>>>>>>>>> Geert,
>>>>>>>>>>
>>>>>>>>>>> Where can I find these firmwares? Linux-firmware[1] seems to
>>>>>>>>>>> lack all but the original K3 AM62x one.
>>>>>>>>>>
>>>>>>>>>> I think PowerVR has a repo [1], but the last time I checked it=
,
>>>>>>>>>> the BVNC for the firmware didn't match what was necessary for
>>>>>>>>>> the GX6250 on the RZ/G2M.  I can't remember what the
>>>>>>>>>> corresponding R-Car3 model is.  I haven't tried recently becau=
se
>>>>>>>>>> I was told more documentation for firmware porting would be
>>>>>>>>>> delayed until everything was pushed into the kernel and Mesa.
>>>>>>>>>> Maybe there is a better repo and/or newer firmware somewhere e=
lse.
>>>>>>>>>>
>>>>>>>>> I should have doubled checked the repo contents before I sent m=
y
>>>>>>>>> last e-mail , but it appears the firmware  [2] for the RZ/G2M,
>>>>>>>>> might be present now. I don't know if there are driver updates
>>>>>>>>> necessary. I checked my e-mails, but I didn't see any
>>>>>>>>> notification, or I would have tried it earlier.  Either way, th=
ank
>>>>>>>>> you Frank for adding it.  I'll try to test when I have some tim=
e.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I don't have the proper version of Mesa setup yet, but for what =
it's
>>>>>>>> worth, the firmware loads without error, and it doesn't hang.
>>>>>>>
>>>>>>> Based on [1] and [2],
>>>>>>>
>>>>>>> kmscube should work on R-Car as it works on RZ/G2L with panfrost =
as
>>>>>>> earlier version of RZ/G2L which uses drm based on RCar-Du, later =
changed
>>>>>> to rzg2l-du.
>>>>>>
>>>>>> IIRC, the mesa support isn't there yet for kmscube to start.
>>>>>
>>>>> What about glmark2? I tested glmark2 as well.
>>>>
>>>> It's not really a matter of kmscube itself, but the interaction with=
 the
>>>> compositor entirely. You can run a headless vulkan rendering, but an=

>>>> application that renders to a window won't work.
>>>
>>> I have made a little progress.  I have Ubuntu running on an RZ/G2M
>>> (Rogue GX6250) with a device tree configuring the GPU and the GPU
>>> loads with firmware.
>>>
>>>   powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58=
_v1.fw
>>>   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>>>   [drm] Initialized powervr 1.0.0 20230904 for fd000000.gpu on minor =
0
>>>
>>> drmdevice lists card0 and renderD128
>>> --- Checking the number of DRM device available ---
>>> --- Devices reported 2 ---
>>> --- Retrieving devices information (PCI device revision is ignored) -=
--
>>> device[0]
>>> +-> available_nodes 0x05
>>> +-> nodes
>>> |   +-> nodes[0] /dev/dri/card0
>>> |   +-> nodes[2] /dev/dri/renderD128
>>> +-> bustype 0002
>>> |   +-> platform
>>> |       +-> fullname /soc/gpu@fd000000
>>> +-> deviceinfo
>>>     +-> platform
>>>         +-> compatible
>>>                     renesas,r8a774a1-gpu
>>>                     img,img-axe
>>>
>>> There is more to this dump, but it seems to repeat. I wanted to show
>>> that it seems like it's trying to work.
>>>
>>> I think I need to modify the powervr code in mesa to recognize the
>>> renesas,r8a774a1-gpu and associate it with the rcar-du, but I am not
>>> sure, and I am hoping someone might be able to provide some guidance,=

>>> since I think I am missing something somewhere. I modified
>>> pvr_device.c in the mesa driver to attempt do this:
>>>
>>> /* This is the list of supported DRM render/display driver configs. *=
/
>>> static const struct pvr_drm_device_config pvr_drm_configs[] =3D {
>>>    DEF_CONFIG("mediatek,mt8173-gpu", "mediatek-drm"),
>>>    DEF_CONFIG("ti,am62-gpu", "ti,am625-dss"),
>>>    DEF_CONFIG("renesas,r8a774a1-gpu", "rcar-du"),
>>> };
>>>
>>> When I run modetest -M rcar-du, I can see the encoders and connectors=

>>> and I can display test patterns, so the rcar-du is working.
>>>
>>> I built Mesa 24.0.1 with the following options:
>>>
>>> meson setup builddir -Dvulkan-drivers=3Dimagination-experimental
>>> -Dimagination-srv=3Dtrue -Dtools=3Dall -Dgallium-drivers=3Dzink,kmsro=
,swrast
>>>
>>> I have tried to set PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 the Mesa
>>> documentation for the powerVR, and I have exported the variable for
>>> VK_ICD_FILENAMES to point to the powervr json file.
>>>
>>> when I try to run glmark2-drm, I was expecting the GL reddered to be
>>> the powervr, but it keeps using the
>>> GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
>>>
>>> I realize this driver is still in its infancy, but I was hoping
>>> someone could give me some guidance to let me know if the work to do
>>> is on the Mesa side or the rcar-du driver side, or something else.
>>>
>>> I rebuilt both libdrm and mesa.  While I don't get any errors, I also=

>>> don't get the hardware acceleration I was hoping for.
>>>
>>> I even tried  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1
>>> MESA_LOADER_DRIVER_OVERRIDE=3Dzink MESA_DEBUG=3Dcontect glmark2-drm
>>>
>>> ...but it only renders with llvmpipe
>>>
>>>     glmark2 2023.01
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>>     OpenGL Information
>>>     GL_VENDOR:      Mesa
>>>     GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
>>>     GL_VERSION:     4.5 (Compatibility Profile) Mesa 24.0.1
>>>     Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D32 stenc=
il=3D0 samples=3D0
>>>     Surface Size:   3840x2160 fullscreen
>>>
>>>
>>> I am not as familiar with the Mesa side, but if I can get this workin=
g
>>> to a point where something is rendered, even if it's not 100%
>>> compliant, I'd like to push patches to the kernel and/or Mesa if
>>> necessary.
>>>
>>> adam
>>>
>>>
>>>
>>>
>>>>
>>>> Maxime
>>
>> I suggest you try running Vulkan demos (we use Sascha Willems=E2=80=99=
 [1])
>> instead of GL at this stage. Support for Zink is currently under heavy=

>> development so you may have trouble differentiating between issues wit=
h
>> your kernel changes and the incompleteness in Mesa.
>=20
> I hacked the look-up-tables in the Mesa PowerVR driver to match the
> values of the other GX6250. I know there must be some minor
> differences, but I don't know what they are right now.

In case you missed my other email, we have device info for the GX6250
variant you=E2=80=99re using in [2]. I=E2=80=99ve been informed that bran=
ch should be
usable as-is =E2=80=93 can you give that a try?

> I also had to tweak   src/imagination/vulkan/pvr_device.c again to the
> following:
>   DEF_CONFIG("renesas,r8a774a1-gpu", "renesas,du-r8a774a1"),

Ah yes, not perfectly as-is then. These lines (pvr_drm_configs) declare
the pairing of GPU to display hardware. You=E2=80=99ll still need this tw=
eak.

> I am not positive that is the correct thing to do, but with that, I
> can now run vulkaninfo.
> I know that it's not fully Vulkan compliant yet, but it appears there
> is some progress:
>=20
> Layers: count =3D 2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> VK_LAYER_MESA_device_select (Linux device selection layer) Vulkan
> version 1.3.211, layer version 1:
>         Layer Extensions: count =3D 0
>         Devices: count =3D 2
>                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
>                 Layer-Device Extensions: count =3D 0
>=20
>                 GPU id =3D 1 (llvmpipe (LLVM 15.0.7, 128 bits))
>                 Layer-Device Extensions: count =3D 0
>=20
> VK_LAYER_MESA_overlay (Mesa Overlay layer) Vulkan version 1.3.211,
> layer version 1:
>         Layer Extensions: count =3D 0
>         Devices: count =3D 2
>                 GPU id =3D 0 (Imagination PowerVR Rogue GX6250)
>                 Layer-Device Extensions: count =3D 0
>=20
>                 GPU id =3D 1 (llvmpipe (LLVM 15.0.7, 128 bits))
>                 Layer-Device Extensions: count =3D 0
>=20
>=20
> I then tried to redndr with vkgears, but it didn't redner.  When I run
> vkgears, I get the following:
>=20
> LAYER:            Searching for layer manifest files
> LAYER:               In following locations:
> LAYER:                  /home/aford/.config/vulkan/implicit_layer.d
> LAYER:                  /etc/xdg/xdg-ubuntu/vulkan/implicit_layer.d
> LAYER:                  /etc/xdg/vulkan/implicit_layer.d
> LAYER:                  /etc/vulkan/implicit_layer.d
> LAYER:                  /home/aford/.local/share/vulkan/implicit_layer.=
d
> LAYER:                  /usr/share/ubuntu/vulkan/implicit_layer.d
> LAYER:                  /usr/share/gnome/vulkan/implicit_layer.d
> LAYER:                  /usr/local/share/vulkan/implicit_layer.d
> LAYER:                  /usr/share/vulkan/implicit_layer.d
> LAYER:                  /var/lib/snapd/desktop/vulkan/implicit_layer.d
> LAYER:               Found the following files:
> LAYER:
> /usr/share/vulkan/implicit_layer.d/VkLayer_MESA_device_select.json
> LAYER:            Searching for layer manifest files
> LAYER:               In following locations:
> LAYER:                  /home/aford/.config/vulkan/explicit_layer.d
> LAYER:                  /etc/xdg/xdg-ubuntu/vulkan/explicit_layer.d
> LAYER:                  /etc/xdg/vulkan/explicit_layer.d
> LAYER:                  /etc/vulkan/explicit_layer.d
> LAYER:                  /home/aford/.local/share/vulkan/explicit_layer.=
d
> LAYER:                  /usr/share/ubuntu/vulkan/explicit_layer.d
> LAYER:                  /usr/share/gnome/vulkan/explicit_layer.d
> LAYER:                  /usr/local/share/vulkan/explicit_layer.d
> LAYER:                  /usr/share/vulkan/explicit_layer.d
> LAYER:                  /var/lib/snapd/desktop/vulkan/explicit_layer.d
> LAYER:               Found the following files:
> LAYER:
> /usr/share/vulkan/explicit_layer.d/VkLayer_MESA_overlay.json
> ERROR:            loader_validate_instance_extensions: Instance
> extension VK_KHR_wayland_surface not supported by available ICDs or
> enabled layers.
> Failed to create Vulkan instance.
>=20
> I have tried running in X.org mode instead of Wayland, but I get a
> different set of errors:

We haven=E2=80=99t been testing with window systems yet =E2=80=93 can you=
 try building
the Sascha Willems demos [1] with -DUSE_D2D_WSI=3DON and try running
triangle?

Matt

[2]: https://gitlab.freedesktop.org/imagination/mesa/-/tree/dev/devinfo

> [ 11102.013] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> [ 11102.014] (II) Module fbdevhw: vendor=3D"X.Org Foundation"
> [ 11102.014]    compiled for 1.21.1.7, module version =3D 0.0.2
> [ 11102.014]    ABI class: X.Org Video Driver, version 25.2
> [ 11102.015] (II) FBDEV(0): using default device
> [ 11102.016] (II) modeset(G0): using drv /dev/dri/card1
> [ 11102.016] (EE)
> Fatal server error:
> or all framebuffer devices
> [ 11102.016] (EE)
> [ 11102.017] (EE)
> Please consult the The X.Org Foundation support at http://wiki.x.org  f=
or help.
>=20
> I think I am close.
>=20
> adam
>>
>> Matt
>>
>> [1]: https://github.com/SaschaWillems/Vulkan

--------------E2yuDuXCQvagJ0ZH378EhSLJ--

--------------EqiMJRriQXhuDt0wQHM6brVL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZdRvJwUDAAAAAAAKCRB5vBnz2d5qsGxY
AP0eMnXBKnjAwgIKvfMNlQ+YKlOQmXSSxlN83MZcEKhnzwD+OASwVZ5DuHIDmMB81TfljaHS/2+l
ef3aZp1ZV1N82wY=
=2V6N
-----END PGP SIGNATURE-----

--------------EqiMJRriQXhuDt0wQHM6brVL--
