Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC1A8D206D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F36E10E1DE;
	Tue, 28 May 2024 15:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OGoIEJgv";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FNAiw5qZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A0D10E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:33:12 +0000 (UTC)
X-UUID: 92f4d4d41d0711efbfff99f2466cf0b4-20240528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ovFnuSCzTJNxrTnPfHr/Pzy0MQ3vy584iT8CPgxfYw4=; 
 b=OGoIEJgvODYpfK1jRnxKjFpR35LYpjuDMRVeBX6qqUH8ZPO4bnET+IW8MoTKaKAGxgsD/E1EgvaZOP+KK7y1vSGEguyczw8TJZqZk/vnAdOMlIUegc5Itg0a188si09J53bb1SkguyfbRWpWgKtgOj6hgL8MEh3tjzTUcg7XszA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:851f5e2c-6643-4bab-b420-7fb3fb8fd925, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:fd6ee943-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 92f4d4d41d0711efbfff99f2466cf0b4-20240528
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1546653835; Tue, 28 May 2024 23:33:03 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 May 2024 23:33:02 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 May 2024 23:33:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEfCBJkfk9YpNbASyPePDeTNSZYxwMmHiLUDK02dK3R+lfOtpGmfIqshARZbCytakSEj4dZlobckmfXC8JEK6FxO+EN0pBxggXKk5ZrfLgTDWzB5EoqERcEAf69pMTfhxl1G/1CEg/FM22oapUmE7KFGGhh6skD3oPXSf6z8Jb61ul0Sw46eROD2UL6NM//T15WHqyW+o54uSlxy1D04sARlpnpRV1btgxnZnY59udZfkUFBpwZIonoJbrhqbmJvYoe3xg/xyfHdeczqZl1bb4bFTngfEdxDxi0H5sE5/S77je1N2z4FlJHp41lDded9E6gzIA5niQvne/VgOGnJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHXf3Zcz60lBQnGXOTTtLTRRouNWnln2T81TAqf+OG8=;
 b=dPby2n0AHAukyf6K3423fFnKS3eq6cQEkcn5HZ5Pz/aseoAV8CbAHEzznhx6ZlEfINhx55qw5mBtm36Gfw98jy7YDA6oKSxf8JnixlQ2cuOxIgg+hyCqIimN9u/THTZ60CGgJsxtO0wjq4tGyW3eQW45zqjYjEEiWBn+ALjntSJxx4Xj/RxTYvMrG5G1hKDnsELE13YFodMJDonwYGtjKabajs4uW/T/pNAXer+J78JnlP/8SmwMvh8Ad7e18ix1tx5mCf6WZ6TbvRE8XpIDbc3shPBcMWtwDslKmDnjJ9k6ht5dPKJdHIdk97aQcAGOAAixwoMz5pLFsnqYzXcFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHXf3Zcz60lBQnGXOTTtLTRRouNWnln2T81TAqf+OG8=;
 b=FNAiw5qZP3jx/i7XN9BPNb5Hguo1Tz0jqve9KLkO5fRwsmoydne60YO+9nYMmuCTliWsSqd6M/D/P0dwQjgqXE3KYSxyLhhihcWnA6LvoGkBxE6X43CS5aIc+SHWTd18w36wo+nhUD/jN9cL4xEdSoDsyN9M1SkPiQVwACU8Wnc=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SG2PR03MB6455.apcprd03.prod.outlook.com (2603:1096:4:1c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 15:33:00 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.7633.001; Tue, 28 May 2024
 15:33:00 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND,v6 8/8] soc: mediatek: mtk-cmdq: Add secure
 cmdq_pkt APIs
Thread-Topic: [PATCH RESEND,v6 8/8] soc: mediatek: mtk-cmdq: Add secure
 cmdq_pkt APIs
Thread-Index: AQHar3tfI4StAhxEi0CN3KPsYLIClbGr95IAgADSGoA=
Date: Tue, 28 May 2024 15:33:00 +0000
Message-ID: <6141715c6f17ff5bb39460d87b88f93785a613a8.camel@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-9-jason-jh.lin@mediatek.com>
 <98b5d60e0ca29e6ac126035c1594c8b0d0210aba.camel@mediatek.com>
In-Reply-To: <98b5d60e0ca29e6ac126035c1594c8b0d0210aba.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SG2PR03MB6455:EE_
x-ms-office365-filtering-correlation-id: 7cd06006-bdf0-4bd6-6ca0-08dc7f2b7515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?dmFzQWg3L1NTSkJ3NWhsWnI1Y3FJaFE2UVl6a2NLMDl5UWFIVmpoR1VHU2tz?=
 =?utf-8?B?MEQ4TUlYQ1dkdlN3RTlaNjdPL1pRWVErQkh3TzFzSHNxTndDOTlack4ybTR6?=
 =?utf-8?B?dEMwdGs4aXhLMjUvL1hyaDAvNXFBSFBnWTY1eHZhUGhPSmQ2QWRaRFZCUWJ4?=
 =?utf-8?B?a0k4aURaUW9aUDJJU01CWm4vVTkyUkNBTlZKeHo5REJDMDY5dTNYblFJQnlN?=
 =?utf-8?B?N2ZJL005MnAyc05mQ3pXK3h1N2drTGNOVWxFa2EyMFN3OWVMeWRiT1Zqa3ls?=
 =?utf-8?B?cnVBS2ZRMmRUTys1a21DQWhTRkpPYlNMRWRaUi9EdDJpSzVwSDNScFJFWE1h?=
 =?utf-8?B?dEdRaXpMWGxmTXdacno5MHRUeWhNaVJlbStkeFpqWmVzb3puT3kzVittQ25M?=
 =?utf-8?B?ek53WENmam9mbE5qdE0zZVQxRU9kN2MzRWNJTkVaSHphRUJkRHZiSEh6UGtH?=
 =?utf-8?B?RVNPNmx1MjJrVyttYTJOTDVyWE40dTZuNkx5RTN5Zy9FNjRsNlpEUlVQOWVn?=
 =?utf-8?B?elErSWo4YUx3MFh1cGZUQTRzOER0SlNrbXNUbWpjTFVRUndFbXBkWWl4a1hG?=
 =?utf-8?B?KzNBRXdGNDl3cHh4ZGUxKzByNDVMajZpRlkwNXRteHA3SjJhUWg1NDYxQmlF?=
 =?utf-8?B?K09sSjh0RWkrRk81Q2JEYnpLRTZBR2NoVjYzZVN0cnZoazlOaGowTi9Pb1pa?=
 =?utf-8?B?T1NneFhWMHdTMDBKUmFZdHhmajBnWC9tWW1GcUUwZVUwdFp1N3A0RlgvL0xU?=
 =?utf-8?B?WWRsc2R3NktIRlZTNG9Lc1VFR2JXaHRVMDV5dk91akVtaGpLRVlDcFJxT2Vp?=
 =?utf-8?B?MWFPZ1p1Y2ZiZmJjdFZHbjExUUxyYzBtYTdMQ3pKUFBwRGw3NHd1N2tLekdH?=
 =?utf-8?B?akMzS0hlOEpQNHI2NU5SaDRFeDU3QnZaTXUyaGMrTnU2ejNTV3dqRHRuV1F0?=
 =?utf-8?B?dkNXdzVwRmVCNTRCL21YdFJhcFJCWXovUS9OdkVYenA5SDIwUFhJbXdpaDVm?=
 =?utf-8?B?RVBHbXV1aUxaV2lxOTROaFlhd0xOcmFxUXlsNVFOSVVmOURORy9uT3NxMmlG?=
 =?utf-8?B?TDhvRjc3d0tjNW9yM1c4cHVCSUN6VUYwTFVMc1RBWHhvZWNvamdyanA5R0RQ?=
 =?utf-8?B?U0ZiazJ0bkZ3M01GOE9sdXNLUEUvS1JUZldJS0Q1bTB2bmZTZ0dUdTdCa25o?=
 =?utf-8?B?aEwrRnc0ODFpSitUNUlyTlJYRFpYTm45QURwQjRkaHpvbk9KZDBzR1J4MHJX?=
 =?utf-8?B?eE5MY243TWVJTzdWY3JNRGZ3eHBrVWg3ZzBreXN2djRCd09wSnRwZFptRjli?=
 =?utf-8?B?dWQ3d2Z4RGVsODJ4MGl2UTI1TlZrK0F5YkFRY0ZqUkdhQW5IYlA3enJzL3FE?=
 =?utf-8?B?NnAwZlpkVktaT3FHOVFRQVRMY3hPRVpuZi8vd2FWSEJ4UkpvZjVvZlZkRXpv?=
 =?utf-8?B?R2J1RzhhTTZyUXlxcDEwbHhSOG1iMmxDUFFDRTZaOEdqalZsTmY0VEd2ZmNV?=
 =?utf-8?B?S2c5SEFRUXQ2aHU5ZUl6enVHY2xWUVVhV1MzYmxlQnFJUFcxQXFlY2h2UDlj?=
 =?utf-8?B?cG5MSGdjbXZRcXg0ZzUvVFRTTjZKbUJXUGw1cEhacCtzSXkwcFRJbG9KZHM4?=
 =?utf-8?B?d1BvSHZwQTF2VWMrLzBwdTI5VVdBZVJMaGlrMFE5WkI1OGYwSUljZEFqTXlW?=
 =?utf-8?B?bm0rMW1tZmFGT1JQUHM3QVJWd0lsTXFSenVtTGoxQ1dmNm0yN3dxS1c0ODcy?=
 =?utf-8?B?UW1KM1RTQmNpVUlyV0Ftbm5lWnRxc2lBM2lPa1I3anNmNisrTXVXc3ZSSG1h?=
 =?utf-8?B?VjJiYWdpZUp2VnByTWdWQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmlXTEFSMGVWMnFhdmVGV2kwMkFYUzhtQ2o2YzdUb09OU2JnT2ZIQUV4a2Q4?=
 =?utf-8?B?MGRROWU0djdkMFVqMmZJZE5SQVhzV09MOFg1MlNWclV5NENkdTZMbHBBLzdQ?=
 =?utf-8?B?alE2NjRpMlBEdGJVeW1IcktFTGpiSTJrc1diNlZWNXMzYmJIVkNrcGl3V3Ba?=
 =?utf-8?B?d0t5dG1ROTVKU0d6NGpLK3NxQ250c0ZkL3FCQjlySC84ak95dkJiN1NLbi9r?=
 =?utf-8?B?cHlrV2FIa2RxZmcrN25IcUFPanlqeEJzRjQ2eHNvNXB4ZUJncXJXVG5ndEs5?=
 =?utf-8?B?MWE1MGZOUk1NOU5RSTVGVUNxYk93Q3ZGdjR2djdwZUIxcGZmNjY1dHlrdDgx?=
 =?utf-8?B?ZFRtaHBINzlzb29wUXQ5Slk3dHJXSVdQNlkzSU1VMlc4QnJiUEJGbnloOFdp?=
 =?utf-8?B?L0dzMVN0dFpOamthbEozdG1nQzNsSWpRVURIMEtLS2YzZFF5V2ovQ0xBcFFq?=
 =?utf-8?B?bUowWExaU2NHSG53YllWN0NJM3A5V0R3YUgwd1hvMEhMOXZqd0xFNFN6T2Zs?=
 =?utf-8?B?M3FFMERaK0VzVHdPdThUQVg4R2xSeDlCQ2NUdDJEWUVJeUN4N0VFQ1VEOWNP?=
 =?utf-8?B?dVVMQm8yRlNWQ2hWSHhYenE2T0x4QWxIZUpPV1NiRkhzM0pOaXF3cnoxdVpS?=
 =?utf-8?B?MVdIUzRRZEZteEJRLzZyb2tqam1EeENrUnRDSDFCYjJyeHBsbWhhZytoRmZp?=
 =?utf-8?B?bmU3UGZjc0dycEFKRFR0cXUxREMzZ2lCNXlLcnpvMlFUdkVCeFM5Znp0WXlG?=
 =?utf-8?B?djNKUWhYRG5hRklBZ29QZitlYklWVlU4Q1FQazlkcm02WmQ3eWRLWHd3QTJM?=
 =?utf-8?B?M01mdGtYYU1Hblh6alZpYk9KU1k3dVovZHd0ZGlaak40VUViaGhDbzNrZ2pq?=
 =?utf-8?B?ZHN4ZDRTY0tQWUp3bHgwQjVnTTBqb3FMSkduWFU3emN5blFDQkN3dEd1emZ4?=
 =?utf-8?B?R1NDTHJMeis1bytla0VMTjd2VGhySGF2YXhCSFFPUHd3L3daRExsS3ZPK3Bq?=
 =?utf-8?B?dWRieGhsb2h2Y1VkUEZWSGtFNzVUTWd6WmhpS1B6YzlWbHB2Y3FrLzVvSzlZ?=
 =?utf-8?B?MnhoYXdmVDNHWDZuc21NKzV6b2hybzNwY0dzT0d3WCtVK0RQYUtQaGY3VzZ5?=
 =?utf-8?B?VEZWNHZqeklINkRsK0EvU200NUx6VUcvWHI5TStGSG9rZWg1WEc1VEdHUC91?=
 =?utf-8?B?NUNWcnVLYzZjeHRYT2tUU3VtY3h6YWlYdi82VkVFdU5ad0pEQmlXM0x4UXRK?=
 =?utf-8?B?QmRMMG5CTFNLdEZSTVQyNnFucTNiLzE5cFpWSjRkZURJUzBySFFoajNEcW5x?=
 =?utf-8?B?dmJQYTNiL0wzWmM4d2RBUWdQY3FYSC9uRGRjK2EzSktaOTNiR3BIMWxNVG9D?=
 =?utf-8?B?MFhkTlA1cFQvcUxJTnZtZnVrQTlRR1J3UU5Hd29yOFYyWDdPV2tIY2dNVUtM?=
 =?utf-8?B?OGpLNlJOeDhzTXZIMWdiUkhlTExSWWNkaFdWUUJqbUgzZ2N3K3RqZk5KRHF5?=
 =?utf-8?B?SmpwVTcrZFI4MkxkK2ptU2ROV1RFWTZzZGNKd1FBd1RDd1lqM3RvM2tjTDh1?=
 =?utf-8?B?LzJPdzdOWXpiNlJPRjFHQUtLSGwzTFVPZE9GcmFOclp6RGk3UmVvdTdPVGoy?=
 =?utf-8?B?aDFxbFg1WWtlWFZ4VitBZzIrVkZyWHhWRjFhVm50YU5QSU1td3pQWjBWQkdk?=
 =?utf-8?B?RU1XcldrQmp6VWVqVnd2RHdhOUE2eHFkTFF6VTh4aG54VURnamxqcXRXZlJ2?=
 =?utf-8?B?cWJkbDlnMnVuaFVHV3hvaE5lUzh6RVpVZ0VZWmlqL0FZNHNVREhpeiszVVh2?=
 =?utf-8?B?b1IwNmQ3ai80dTFFRzZiK3RIVDZqcnNja2V5VC85ZGVGeUJJTExtcjZGTkJu?=
 =?utf-8?B?emZvSVFKS3FUei9yN3ZsemloRnNwTUtHUE1ya29ZVFlNY1lGV3NveTY5Z0V0?=
 =?utf-8?B?alRJK2RGN1dLZFQwK0F3L1UrZUxQcTlQZUUzUjVaNWxKTUhVWlpuQS8wZjlN?=
 =?utf-8?B?VVV6bFFPTXhkeWZ5QzI3M1h0WGo5dTRFeVQ1ZkhFVGp3bVhvNEc3VHI3NzRa?=
 =?utf-8?B?NlNHVGVUeDdmL1JUUDhDajJBaXlqRXo0UHFkbjB1RGFpZEJlZnNYZDBjeGFs?=
 =?utf-8?B?ZG9xcnRJTXNQeE1ETk5IcEZXVnZyemJhcGFyMjRyZ0NDeEFCOTV0MnljdXp3?=
 =?utf-8?B?REE9PQ==?=
Content-ID: <C12C69A5952D4F4FB88C65F0634E57D5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd06006-bdf0-4bd6-6ca0-08dc7f2b7515
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 15:33:00.4314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xBpSD1cltK8YwqnmiHAab0PAZXWAVtfH734MLXF9LSYyPx8H5s4JdXosiAM4ssOxIoB7JY9QFv8GgZUQ09puD8xz0tUupVglo5kpUTCSp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6455
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1427134541.2031764790"
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

--__=_Part_Boundary_003_1427134541.2031764790
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFR1ZSwgMjAyNC0wNS0yOCBhdCAwMzowMSArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBKYXNvbjoNCj4gDQo+IE9uIFN1biwgMjAyNC0wNS0yNiBhdCAy
Mjo0NCArMDgwMCwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IE9wZW4gc2VjdXJlIGNtZHFfcGt0
IEFQSXMgdG8gc3VwcG9ydCBleGVjdXRpbmcgY29tbWFuZHMgaW4gc2VjdXJlDQo+ID4gd29ybGQu
DQo+ID4gDQo+ID4gMS4gQWRkIGNtZHFfc2VjX3BrdF9hbGxvY19zZWNfZGF0YSgpLCBjbWRxX3Nl
Y19wa3RfZnJlZV9zZWNfZGF0YSgpDQo+ID4gYW5kDQo+ID4gICAgY21kcV9zZWNfcGt0X3NldF9k
YXRhKCkgdG8gcHJlcGFyZSB0aGUgc2VjX2RhdGEgaW4gY21kcV9wa3QgdGhhdA0KPiA+IHdpbGwN
Cj4gPiAgICBiZSByZWZlcmVuY2VkIGluIHRoZSBzZWN1cmUgd29ybGQuDQo+ID4gDQo+ID4gMi4g
QWRkIGNtZHFfc2VjX2luc2VydF9iYWNrdXBfY29va2llKCkgYW5kIGNtZHFfc2VjX3BrdF93cml0
ZSgpIHRvDQo+ID4gICAgZ2VuZXJhdGUgY29tbWFuZHMgdGhhdCBuZWVkIHRvIGJlIGV4ZWN1dGVk
IGluIHRoZSBzZWN1cmUgd29ybGQuDQo+ID4gICAgSW4gY21kcV9zZWNfcGt0X3dyaXRlKCksIHdl
IG5lZWQgdG8gcHJlcGFyZSB0aGUgbWV0YWRhdGEgdG8NCj4gPiBzdG9yZQ0KPiA+ICAgIGJ1ZmZl
ciBvZmZzZXQgb2YgdGhlIHNlY3VyZSBidWZmZXIgaGFuZGxlIGJlY2F1c2Ugc2VjdXJlIHdvcmxk
DQo+ID4gY2FuDQo+ID4gICAgb25seSB0cmFuc2xhdGUgdGhlIHN0YXJ0IGFkZHJlc3Mgb2Ygc2Vj
dXJlIGJ1ZmZlciBieSBzZWN1cmUNCj4gPiBoYW5kbGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ICsNCj4gPiAraW50IGNtZHFfc2VjX3BrdF9zZXRfZGF0
YShzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgZW51bQ0KPiA+IGNtZHFfc2VjX3NjZW5hcmlvIHNjZW5h
cmlvKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgY21kcV9zZWNfZGF0YSAqc2VjX2RhdGE7DQo+ID4g
KwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCWlmICghcGt0KSB7DQo+ID4gKwkJcHJfZXJyKCJpbnZh
bGlkIHBrdDolcCIsIHBrdCk7DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwl9DQo+ID4g
Kw0KPiA+ICsJcmV0ID0gY21kcV9zZWNfcGt0X2FsbG9jX3NlY19kYXRhKHBrdCk7DQo+ID4gKwlp
ZiAocmV0IDwgMCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCXByX2RlYnVnKCJb
JXMgJWRdIHBrdDolcCBzZWNfZGF0YTolcCBzY2VuOiV1IiwNCj4gPiArCQkgX19mdW5jX18sIF9f
TElORV9fLCBwa3QsIHBrdC0+c2VjX2RhdGEsIHNjZW5hcmlvKTsNCj4gPiArDQo+ID4gKwlzZWNf
ZGF0YSA9IChzdHJ1Y3QgY21kcV9zZWNfZGF0YSAqKXBrdC0+c2VjX2RhdGE7DQo+ID4gKwlzZWNf
ZGF0YS0+c2NlbmFyaW8gPSBzY2VuYXJpbzsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiAr
fQ0KPiANCj4gV2hhdCBkb2VzIGNtZHFfc2VjX3BrdF9zZXRfZGF0YSgpIGV4YWN0bHkgZG8/IEl0
IHNlZW1zIHRvDQo+IGVuYWJsZS9kaXNhYmxlIHByb3RlY3Rpb24gb24gaGFyZHdhcmUgb2YgY2Vy
dGFpbiBwaXBlbGluZS4NCj4gSW4gZnV0dXJlLCB5b3Ugd291bGQgdXNlIHNlY3VyZSBHQ0UgZm9y
IG5vcm1hbCB2aWRlbyBhbmQgc2VjdXJlDQo+IHZpZGVvLg0KPiBXb3VsZCB5b3UgYWxzbyB1c2Ug
c2VjdXJlIGRpc3BsYXkgcGlwZWxpbmUgZm9yIGJvdGggbm9ybWFsIHZpZGVvIGFuZA0KPiBzZWN1
cmUgdmlkZW8/DQoNCkkgdGhpbmsgSSB3b24ndCBkbyB0aGF0Lg0KDQo+IElmIHNvLCBJIHRoaW5r
IHdlIGNvdWxkIGRyb3AgdGhpcyBmdW5jdGlvbiBiZWNhdXNlIHRoZSBoYXJkd2FyZSBpcw0KPiBh
bHdheXMgcHJvdGVjdGVkLg0KPiANCkJ1dCB3ZSB3aWxsIHVzZSBFTkFCTEUgYW5kIERJU0FCTEUg
c2NlbmFyaW8gdG8gbm90aWZ5IHNlY3VyZSB3b3JsZCB0bw0KZW5hYmxlL2Rpc2FibGUgdGhlIHBy
b3RlY3Rpb24gb2Ygc2VjdXJlIGJ1ZmZlciBhbmQgcmVnaXN0ZXIgYnkgc2V0dGluZw0KbGFyYiBw
b3J0IGFuZCBEQVBDLg0KDQpJZiB0aGVyZSBpcyBzZWN1cmUgbWVtb3J5IG91dHB1dCBzY2VuYXJp
byAoV2lGaSBEaXNwbGF5IHNjZW5hcmlvKSBpbg0KdGhlIHNhbWUgZGlzcGxheSBwaXBlbGluZSBh
cyBtYWluIGRpc3BsYXkgc2NlbmFyaW8sIHdlIHdpbGwgbmVlZCB0byB1c2UNCnRoaXMgc2NlbmFy
aW8gdG8gZGlmZmVyZW50aWF0ZSB0aGVtLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4g
UmVnYXJkcywNCj4gQ0sNCj4gDQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGNtZHFfc2VjX3BrdF9z
ZXRfZGF0YSk7DQo+ID4gKw0K

--__=_Part_Boundary_003_1427134541.2031764790
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7VHVlLCYjMzI7MjAy
NC0wNS0yOCYjMzI7YXQmIzMyOzAzOjAxJiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGksJiMzMjtKYXNv
bjoNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO1N1biwmIzMyOzIwMjQtMDUtMjYmIzMyO2F0
JiMzMjsyMjo0NCYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0KJmd0OyYj
MzI7Jmd0OyYjMzI7T3BlbiYjMzI7c2VjdXJlJiMzMjtjbWRxX3BrdCYjMzI7QVBJcyYjMzI7dG8m
IzMyO3N1cHBvcnQmIzMyO2V4ZWN1dGluZyYjMzI7Y29tbWFuZHMmIzMyO2luJiMzMjtzZWN1cmUN
CiZndDsmIzMyOyZndDsmIzMyO3dvcmxkLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsxLiYjMzI7QWRkJiMzMjtjbWRxX3NlY19wa3RfYWxsb2Nfc2VjX2RhdGEoKSwmIzMy
O2NtZHFfc2VjX3BrdF9mcmVlX3NlY19kYXRhKCkNCiZndDsmIzMyOyZndDsmIzMyO2FuZA0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7Y21kcV9zZWNfcGt0X3NldF9kYXRhKCkmIzMy
O3RvJiMzMjtwcmVwYXJlJiMzMjt0aGUmIzMyO3NlY19kYXRhJiMzMjtpbiYjMzI7Y21kcV9wa3Qm
IzMyO3RoYXQNCiZndDsmIzMyOyZndDsmIzMyO3dpbGwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
JiMzMjsmIzMyO2JlJiMzMjtyZWZlcmVuY2VkJiMzMjtpbiYjMzI7dGhlJiMzMjtzZWN1cmUmIzMy
O3dvcmxkLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsyLiYjMzI7QWRk
JiMzMjtjbWRxX3NlY19pbnNlcnRfYmFja3VwX2Nvb2tpZSgpJiMzMjthbmQmIzMyO2NtZHFfc2Vj
X3BrdF93cml0ZSgpJiMzMjt0bw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7Z2Vu
ZXJhdGUmIzMyO2NvbW1hbmRzJiMzMjt0aGF0JiMzMjtuZWVkJiMzMjt0byYjMzI7YmUmIzMyO2V4
ZWN1dGVkJiMzMjtpbiYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO3dvcmxkLg0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7SW4mIzMyO2NtZHFfc2VjX3BrdF93cml0ZSgpLCYjMzI7d2Um
IzMyO25lZWQmIzMyO3RvJiMzMjtwcmVwYXJlJiMzMjt0aGUmIzMyO21ldGFkYXRhJiMzMjt0bw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7c3RvcmUNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
O2J1ZmZlciYjMzI7b2Zmc2V0JiMzMjtvZiYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO2J1ZmZlciYj
MzI7aGFuZGxlJiMzMjtiZWNhdXNlJiMzMjtzZWN1cmUmIzMyO3dvcmxkDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtjYW4NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO29ubHkmIzMyO3RyYW5z
bGF0ZSYjMzI7dGhlJiMzMjtzdGFydCYjMzI7YWRkcmVzcyYjMzI7b2YmIzMyO3NlY3VyZSYjMzI7
YnVmZmVyJiMzMjtieSYjMzI7c2VjdXJlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtoYW5kbGUuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNv
bi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7
Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1tzbmlwXQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjtjbWRxX3NlY19wa3Rfc2V0X2RhdGEoc3RydWN0
JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCwmIzMyO2VudW0NCiZndDsmIzMyOyZndDsmIzMyO2NtZHFf
c2VjX3NjZW5hcmlvJiMzMjtzY2VuYXJpbykNCiZndDsmIzMyOyZndDsmIzMyOyt7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrc3RydWN0JiMzMjtjbWRxX3NlY19kYXRhJiMzMjsqc2VjX2RhdGE7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjtyZXQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsraWYmIzMyOyghcGt0KSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7K3ByX2Vy
cigmcXVvdDtpbnZhbGlkJiMzMjtwa3Q6JXAmcXVvdDssJiMzMjtwa3QpOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7K3JldHVybiYjMzI7LUVJTlZBTDsNCiZndDsmIzMyOyZndDsmIzMyOyt9DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjtjbWRxX3NlY19w
a3RfYWxsb2Nfc2VjX2RhdGEocGt0KTsNCiZndDsmIzMyOyZndDsmIzMyOytpZiYjMzI7KHJldCYj
MzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOyZndDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsm
IzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOytwcl9kZWJ1ZygmcXVvdDtbJXMmIzMy
OyVkXSYjMzI7cGt0OiVwJiMzMjtzZWNfZGF0YTolcCYjMzI7c2NlbjoldSZxdW90OywNCiZndDsm
IzMyOyZndDsmIzMyOysmIzMyO19fZnVuY19fLCYjMzI7X19MSU5FX18sJiMzMjtwa3QsJiMzMjtw
a3QtJmd0O3NlY19kYXRhLCYjMzI7c2NlbmFyaW8pOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0
OyYjMzI7Jmd0OyYjMzI7K3NlY19kYXRhJiMzMjs9JiMzMjsoc3RydWN0JiMzMjtjbWRxX3NlY19k
YXRhJiMzMjsqKXBrdC0mZ3Q7c2VjX2RhdGE7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrc2VjX2RhdGEt
Jmd0O3NjZW5hcmlvJiMzMjs9JiMzMjtzY2VuYXJpbzsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZn
dDsmIzMyOyZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtXaGF0JiMzMjtkb2VzJiMzMjtjbWRxX3NlY19wa3Rfc2V0X2RhdGEo
KSYjMzI7ZXhhY3RseSYjMzI7ZG8mIzYzOyYjMzI7SXQmIzMyO3NlZW1zJiMzMjt0bw0KJmd0OyYj
MzI7ZW5hYmxlL2Rpc2FibGUmIzMyO3Byb3RlY3Rpb24mIzMyO29uJiMzMjtoYXJkd2FyZSYjMzI7
b2YmIzMyO2NlcnRhaW4mIzMyO3BpcGVsaW5lLg0KJmd0OyYjMzI7SW4mIzMyO2Z1dHVyZSwmIzMy
O3lvdSYjMzI7d291bGQmIzMyO3VzZSYjMzI7c2VjdXJlJiMzMjtHQ0UmIzMyO2ZvciYjMzI7bm9y
bWFsJiMzMjt2aWRlbyYjMzI7YW5kJiMzMjtzZWN1cmUNCiZndDsmIzMyO3ZpZGVvLg0KJmd0OyYj
MzI7V291bGQmIzMyO3lvdSYjMzI7YWxzbyYjMzI7dXNlJiMzMjtzZWN1cmUmIzMyO2Rpc3BsYXkm
IzMyO3BpcGVsaW5lJiMzMjtmb3ImIzMyO2JvdGgmIzMyO25vcm1hbCYjMzI7dmlkZW8mIzMyO2Fu
ZA0KJmd0OyYjMzI7c2VjdXJlJiMzMjt2aWRlbyYjNjM7DQoNCkkmIzMyO3RoaW5rJiMzMjtJJiMz
Mjt3b24mIzM5O3QmIzMyO2RvJiMzMjt0aGF0Lg0KDQomZ3Q7JiMzMjtJZiYjMzI7c28sJiMzMjtJ
JiMzMjt0aGluayYjMzI7d2UmIzMyO2NvdWxkJiMzMjtkcm9wJiMzMjt0aGlzJiMzMjtmdW5jdGlv
biYjMzI7YmVjYXVzZSYjMzI7dGhlJiMzMjtoYXJkd2FyZSYjMzI7aXMNCiZndDsmIzMyO2Fsd2F5
cyYjMzI7cHJvdGVjdGVkLg0KJmd0OyYjMzI7DQpCdXQmIzMyO3dlJiMzMjt3aWxsJiMzMjt1c2Um
IzMyO0VOQUJMRSYjMzI7YW5kJiMzMjtESVNBQkxFJiMzMjtzY2VuYXJpbyYjMzI7dG8mIzMyO25v
dGlmeSYjMzI7c2VjdXJlJiMzMjt3b3JsZCYjMzI7dG8NCmVuYWJsZS9kaXNhYmxlJiMzMjt0aGUm
IzMyO3Byb3RlY3Rpb24mIzMyO29mJiMzMjtzZWN1cmUmIzMyO2J1ZmZlciYjMzI7YW5kJiMzMjty
ZWdpc3RlciYjMzI7YnkmIzMyO3NldHRpbmcNCmxhcmImIzMyO3BvcnQmIzMyO2FuZCYjMzI7REFQ
Qy4NCg0KSWYmIzMyO3RoZXJlJiMzMjtpcyYjMzI7c2VjdXJlJiMzMjttZW1vcnkmIzMyO291dHB1
dCYjMzI7c2NlbmFyaW8mIzMyOyhXaUZpJiMzMjtEaXNwbGF5JiMzMjtzY2VuYXJpbykmIzMyO2lu
DQp0aGUmIzMyO3NhbWUmIzMyO2Rpc3BsYXkmIzMyO3BpcGVsaW5lJiMzMjthcyYjMzI7bWFpbiYj
MzI7ZGlzcGxheSYjMzI7c2NlbmFyaW8sJiMzMjt3ZSYjMzI7d2lsbCYjMzI7bmVlZCYjMzI7dG8m
IzMyO3VzZQ0KdGhpcyYjMzI7c2NlbmFyaW8mIzMyO3RvJiMzMjtkaWZmZXJlbnRpYXRlJiMzMjt0
aGVtLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7
JiMzMjtDSw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrRVhQT1JUX1NZTUJPTF9HUEwo
Y21kcV9zZWNfcGt0X3NldF9kYXRhKTsNCiZndDsmIzMyOyZndDsmIzMyOysNCg0KPC9wcmU+DQo8
L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioq
KiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0K
dGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwg
ZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55
IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUg
Y29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8
L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1427134541.2031764790--

