Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C13A40790
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 11:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3203D10E318;
	Sat, 22 Feb 2025 10:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="nwuAmInu";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XKWk4AmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A9110E318
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 10:44:54 +0000 (UTC)
X-UUID: 09d5afd4f10a11ef8eb9c36241bbb6fb-20250222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Jw9p9EBD/qEploV0XYMbvXs0rkygs/e2rPtIj00HVvU=; 
 b=nwuAmInupmaJSc8GEm5hLxDxEVGCXMmjlq+Qic28fNzv/R+Dz718qBNPvhQpbl1Eb2sMewdTmvjCKKj0/H6msVLUEszMPKNU7Tclqm8aafEyZoE4mbFw3DCvt46+emglfMAQWbUCT9bL/Q2oT/56itV/fQIYoZY0rGLiWBD/98g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:ad5a1f4e-a153-423f-b8e5-d2edb856f840, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:305771b5-a2a1-4ef3-9ef9-e116773da0a7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|51,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 09d5afd4f10a11ef8eb9c36241bbb6fb-20250222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1342043815; Sat, 22 Feb 2025 18:44:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 22 Feb 2025 18:44:47 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 22 Feb 2025 18:44:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0su302lh71N3UkDjye/Z+sPNAB6AsIBgMBuBBXl0ZlHqnSJL+lHPYVeV7o5hh5MFIui7YC//n4V0OSLXAAJ7lmxAfi7mpSULpXpDGyiRIoWGQxwnh8BTDUmf3ZpJqMH39zi8pk/55K9TKm5evKd2YVImK3zOcItUJOQwnVDp1UsmcZPpGNAiMK3gVTFgmAuI4g55N0n+YLXKVu1+2dSa9bNAMyDAE95nKSnqmjXHNpLhlmgQCWPKNIeMfIe7ychH8yhOTdKBwiHml1wyo8SElVUtuspMR4/9TrY/ZD/ewHJntq83+zAE0ZKlVe0ShZlEmLudJjhNndAVtyznXuafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uUDMpAiI4k6Vkvm2jeSOoIknKewr2Nc4iwAnBmbpj8=;
 b=Bhtk7dEDYYnCbiGTAHacyUcQLYDA1axXyg8POyyDf9FoYagy3MFbK9QbgcNdTjTByT2OdWBK8F+JpIXMc3Q45oVlaIyz5RyMBrv3SEhw4zoG7jQvMkZqRF6OjvT5gb/DSwJ3l1LGMwgVPCJbkZohHTRWw2oxxtoZ84v4zGbuw++ocXz2FjGsfxwrsNZDHKXLDR3mtOi4Ti3ads1+ICosjEdotGBpghnEPpqhy9aoijUJ+Vea89Hzlj77GBgoKumjkv4Niu3cp5t3bYwUe7Rzm1bhEpY2EvabxasZ+N6LJbEVYE3DwhN4uWGRByL+BIH8oF06d1XEAPhjzv1AI176ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uUDMpAiI4k6Vkvm2jeSOoIknKewr2Nc4iwAnBmbpj8=;
 b=XKWk4AmAi+qZS8933LrZoY1buz/EbTGKGmonUknpJzdl2whkSBdOMKwWPOzX0yQYhFcOKLzV0WxoGOgDI/XmIhjf33ion/BqWRkJ1qJMnjIDHzzgpYqWXmuS3sq0RfW7jc1UMDU1Wo6qevUKcCSYgIeGc4tHcdRf1LYOYxfY0u0=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB8113.apcprd03.prod.outlook.com (2603:1096:990:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sat, 22 Feb
 2025 10:44:45 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 10:44:43 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
 <treapking@chromium.org>
Subject: Re: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Topic: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Index: AQHbgcg2iEEFnb0qD02RDglBS18jJrNMyqiAgAZfVgA=
Date: Sat, 22 Feb 2025 10:44:42 +0000
Message-ID: <219a0c8d675cf52298a8d3e542764206480598ca.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
 <8cfc321d570dbbfafebba55a0bda156314e6bdc0.camel@mediatek.com>
In-Reply-To: <8cfc321d570dbbfafebba55a0bda156314e6bdc0.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB8113:EE_
x-ms-office365-filtering-correlation-id: b585f584-f6ec-4458-98aa-08dd532dea94
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cFBoTkRMZUVhc0FzMmtXVUJ3a3NsNkJmelpQZ3ZlOEJpVHp4d1RhRHlLUXo1?=
 =?utf-8?B?KzJFVkRzdTUySHY1UWZoOVNtMDZuT0Y4S1dNcjY2QVhoa1ZnWnBGV25IQ1Zw?=
 =?utf-8?B?MmI1RitzN2VUWkxkN1lMRjBtT0MrNWxIR1JMVzFWU3BCcit6dlptZWxTMDNm?=
 =?utf-8?B?N2xMTWJNWXVxTGtwSTZDVHNiVys1WGRlbWdUYXkyVDZmVy8wZEVjRHlZb0d4?=
 =?utf-8?B?VlltalNtQ2tOMHl5VnJsVWUzdHZlRGhacnRjY0k4Skw5aERwbE1XcWYwSHZr?=
 =?utf-8?B?U0JsMG1Rd25PbGdBYTk2Zk5RNWtYTWJHbXk5dUJuWXM4RHRnaFBtOEZ2YU1P?=
 =?utf-8?B?RlV3dkd6elRFSmhoeS9qdWJtUDFaTlZjVkF4RVd3T0owQUR4b0pIVFIwOEZJ?=
 =?utf-8?B?c3M4RERzdytsUUxLTmJQWGtzSEx3eVlBZDQzY3EwMVoxbWM5aEgyREJFVURu?=
 =?utf-8?B?VCt4Ym1xT2c1Q09pSUZkekd5ZnViSC9JYzUwbkZVaG9ycVV6QlBYOU1zZ1J4?=
 =?utf-8?B?RG9sQWRhRk9MZHI4cjVHZnY2U3J4bEQ4U3RkMGhxcjNyT1FQRmw2T1FTcnlY?=
 =?utf-8?B?WFJiQ0pnNnFWUUNsaDBnM21SYW9aeXUyVVU5T204QmxWVU9ES1lrdE11N25Z?=
 =?utf-8?B?eHJzTDVmMHQyTTlMZHY3SE5WTlh0U1AvL2twbUxRM0dWNStiTDV2MUJwVlE4?=
 =?utf-8?B?RmpoVjBNamxuZU9CQU45VHZ4aDRQeWI1QnNZam9WUngxek54b2M0SUVwYTZW?=
 =?utf-8?B?alEzam9PZ1pTa0ZMNVVsZXhUTmQ2NjZ5NTBpb2tSdkdlZmdGdnRWOUhmY0Fz?=
 =?utf-8?B?d1NHZXc0b1JtYXBVNWVrVWozc2lqMUJJVk1waVMxWTh3TjlPcGI2N1lXdjdE?=
 =?utf-8?B?NmdpZko4QkFTSWVRL01oWXJvaGp6TE9kajhIRnBISnlXK0pES1R0Tnc1b08z?=
 =?utf-8?B?TG5na1h0aUY4dko2VGt3TEZWY3BqNmoyUk5tNk1kZnFzQmQ5a1RSS3BHR1BJ?=
 =?utf-8?B?cVVpekZEVzFzRkViOXBBZko0RVpNa3lRTTFxVERaWHY4SGxlU05IMnR4ZVRH?=
 =?utf-8?B?UHcycXhzSmhrOFp1c3h0M28xN0JjNVdaSkxFK2svUmRFdm85ZndzR2NaMkZ5?=
 =?utf-8?B?NHdWSUFnRDI4WWxzYmtOSkNPcFUxY2VwaFBjUnVESmJvOFdmcHZrWWgwcVZm?=
 =?utf-8?B?VnRXaWJuTmkrNURCRk4wc3N3R2c5bDF6RzJseERyRFhRSk5SV1A2UGIzVHZs?=
 =?utf-8?B?cHFEcGhTRjFVTUszNzUvczUzWnZ5T1VpeElJdFM0Tk5iZ0o0SXB4OFRudFJV?=
 =?utf-8?B?U29pS2ZKRTIvZ1dqaktUbmtiV2xLNFV3NUZjZEtqRllBQ1RXWStqLzIvTFJq?=
 =?utf-8?B?aENQVUtyK1JGT0Jua1RZdzFpN1FuMDdTMmdCa1RnQ0E2dXJaU1NNejNHWXpS?=
 =?utf-8?B?NUlIL0NKMGR2RDlKeE9sbHZoSWZCbFE4SEhDVVgxaGFkT2h0dHcxaXN6WHFO?=
 =?utf-8?B?SXdGbG5mUEtOb1lvUXFDTDBMaUxVWnRLMk0vbVo2c09sT3VLanQyRVJDSDZX?=
 =?utf-8?B?ZXNhNzJpMEsxblVhcWVMSm96L3hTYXlnZnZ3bzNHRlljZjVHYU9ueWJOWHpu?=
 =?utf-8?B?dk4xWEt3U0tkdGFZMEJNK1RjbUVDWXN3ZXFGelIzb2NmZHhEMmxMUC9mMnlH?=
 =?utf-8?B?a0lMeXQ4dUt2UXV4bDVuUC9EOGZsdTZNTGJWQUNvaWtCZi9SYVl5MS9vaW16?=
 =?utf-8?B?ZVg3dWl5ZkRJMVdMbzdMaEpqWFRMalV6L01ZN2J2LzUycHl5YnlBaTFRM2pZ?=
 =?utf-8?B?L3ZFaHZsWEptQXhrTzFnYStoQmp5Q1lkYVJsTFQrMFV1QlNMZHgyVlR5NVE4?=
 =?utf-8?B?U0ZOSWM1MUpDRDFBamlyTzJtWmh3NHBhZ3JPY3JaQWRsWnpDZnNmWnoxQkhD?=
 =?utf-8?Q?nsd2f7WLpa2E9IYK1bAoPFn6mkW5kF90?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGo2L1Y0S3pTMEREcitZcndFOXdMdDJoNk4wZmtQQ3VHN3lSRjNNak1jMWtT?=
 =?utf-8?B?bFdLMEVRYlBOVTcvUEdKeThGMVZDc1JIVCtDWCsvMVpJbFNCSklJd0RxZmlv?=
 =?utf-8?B?Z1V0Y2Z0UVVTL3k0QW9tNGRhbzVubWRHeHNhMVZCK3dDWSsxb1ZkY3FWTVI5?=
 =?utf-8?B?OGFWc3BnZXJlN1JQRlpMYjVPQUxWc3dkL2J4RWZiVzVxbFNMMjZjbmdlbkxB?=
 =?utf-8?B?dDk1OWxzdTVUb3lQdTFlZkdxOUlKUXovVEFxMk1tdFhtZGk4c0FGNE92cnRX?=
 =?utf-8?B?OTJEZzM4Y0xteTdHWVNneU5EYzBqc295bTg3R1FvbDdPcTdQamxMazlzSFZE?=
 =?utf-8?B?TzdCVlRKTWhTOStxa0xHakF6QXBFbmNHYmo3NHlXeDZId21HaSsxRmMyWWFP?=
 =?utf-8?B?d3QxTHJKSGh4M3NabHJhOTNRRk81bnhOR01jU1Ira1N2UUNWbXlqckpKTTRK?=
 =?utf-8?B?K3liME9MaEdyK1JQMlpESkNMS25rOEJ5VVdmcmZKNWprMTdCZFlDMVM5UVY1?=
 =?utf-8?B?ZitTUSs4WVZiMDBxbnV6MzBCZ0J3UmtUSERlbHhlN1BmbStScWdiNE4yNDBM?=
 =?utf-8?B?b1VLaksyenBNdEgxNE1zNXFuc2k3US9BS2p5ZmdIdTJmbkZXdEt6WExmYTB0?=
 =?utf-8?B?SGVyMXdTMm1xMzg5Q242SjI0L1g5T3NmbjlnSmp5VlRXQXVTU24zQlR4RjdU?=
 =?utf-8?B?Tlljd0tVT3IyYytKQ0MwZFpIR2hsNU1tRFEwTFd1d1V2VVdtak9NUVB6ZUxH?=
 =?utf-8?B?Nm43L045aVB6cjZQbkhFL2lXeTVuTW84YXRPT3d1dUZ4NUgxbXZGRzYxTkh3?=
 =?utf-8?B?ZmJFemJnaFYzdjdLV3lJUmpoZEpLTG5ELzVNNjE4T1FQbC81YTd3ZFZ1ZUJL?=
 =?utf-8?B?NWR0YTRvSlR0Wk1LelNXelFZSklWVStoUkhCVXhBbUpjOEUwOVlKaXJzZE1D?=
 =?utf-8?B?NVNwMHpkMXNrR2poRndPSk1kWGRhWlF4MDRJcTBzRFQ2T2NkczQwcUF3VmY3?=
 =?utf-8?B?QktwUkpvYkh1MElRR1gwYmZDMFU1Y0sxT0R4a3cyNDR6Nmd6bm5TNnYyYmda?=
 =?utf-8?B?YjVjRm5sN2Jicy9qY05SMHZXWTdRTGt6NDF3ZjVuQXhvQjRINEtabG1DOGRD?=
 =?utf-8?B?ZDIzM2o2Q251M1FYN1JkbnE4dDQreGNzUHNicHVGU0ErTmYrK0R2R3BUby9G?=
 =?utf-8?B?eWNLQ0VIMFV6c0lUd3NWaTRFMklqZGt4aG01dWo2S2Q5a3Buby83aS9oS09B?=
 =?utf-8?B?NDJ6OVFZY1Flc0hrODFXZ21rancvbElLdlpFSWFoMG5YTWxtczlYZzd3QVRY?=
 =?utf-8?B?dVp1NGhmbzBjQTVueUM5MzBENFphakExOTJMUWNWTjBmdDFqYjV1b3Nhbzhq?=
 =?utf-8?B?Tk9pQkFzYkdVeVhjdlJWcGVrMVhLdHRZbHgvMjJHSXY1VjBRcXZmMllqRHJM?=
 =?utf-8?B?c245OGZEYThmLzRrUkNhY0NqY1JXYnhpYk1QSFVSSkF2STIxS0dNcExOL0Zy?=
 =?utf-8?B?b0REMk0vWTN5VGo1Z2g4eUFFcWJpMnBwcEI0alB4K2JWdVI3K0tTUWJaZjlq?=
 =?utf-8?B?eXRFNGVvQldQNDdlZlY0amxORDlxMXZ4TStpeVJKdkxFTElzMldsbWF3aGl1?=
 =?utf-8?B?MjFGRVNoN09UVkZYT1Y2UFZVV3ZqQThjOWtzZWJVbDJRSGFLaVN2Z3dBVlZi?=
 =?utf-8?B?NmM3YURKdzJNZHFSZ05PT01mQlBMcGo4SEIySUQ2RHJlWlNmWGIvS0Y0VDZL?=
 =?utf-8?B?VlhSNGRHMzA5L0JncjlTNnhTcnp6dGJocFZVK1Y0S2I0eXU5MVRYNmJuK2Nl?=
 =?utf-8?B?U2NWZ0pCWGlpOXpURnhaMFpyVGRrRE9EWFVMVlE3NTdkOFNtZzlCb01vK3J3?=
 =?utf-8?B?cFBUR1hRRThySVdYOGdCbmRnYWgvKzRQTmVyTjdzYzZaZEtKbFQrNVFIejVR?=
 =?utf-8?B?dnJLMm5qR1Fjby9mUFFZME1ZbzV1QnRxWkR3K2xpRzRHWE5DR0pnVmZIM0R5?=
 =?utf-8?B?NUNRSWl4QUpVS09QaXN3UWlhbnNzT2lvSzVldnprTVliTDN0eEcyaXphVG5h?=
 =?utf-8?B?M2lzTTQ0M2dzQThYOG5nSHgxT09YdmR6a05IM2pnRlRLN0Q5V2hEaENCWVI3?=
 =?utf-8?B?SEFLOVhOVTc5YjY4YUVLZVU3NUFEcmFxalNqeUhFNU9tbGxBL0JsNWY4YVo2?=
 =?utf-8?B?TkE9PQ==?=
Content-ID: <270B8E1C6723C2419C53996973967E62@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b585f584-f6ec-4458-98aa-08dd532dea94
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 10:44:43.0635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBNCFLzwdFSuNN9m6nhhZQeTnisC4Kw3g+Z0ODZIY7dBXlye9RmA+yhYI/EZ1X4WPO5m9VyY3l4lntBJkieeb2jkqgkZG0BFgN/7trxv2XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8113
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1062826575.1139562998"
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

--__=_Part_Boundary_005_1062826575.1139562998
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNClRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQoNCk9uIFR1ZSwgMjAyNS0wMi0xOCBh
dCAwOToyNSArMDAwMCwgQ0sgSHUgKOiDoeS/iuWFiSkgd3JvdGU6DQo+IE9uIFR1ZSwgMjAyNS0w
Mi0xOCBhdCAxMzo0MSArMDgwMCwgSmFzb24tSkggTGluIHdyb3RlOg0KPiA+IE1UODE5NiBoYXMg
MyBuZXcgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBjb21wYXJlZCB3aXRoIHRoZSBwcmV2aW91cw0K
PiA+IFNvQywNCj4gPiB3aGljaCBjb3JyZXNwb25kIHRvIHRoZSAzIG5ldyBkcml2ZXIgZGF0YToN
Cj4gPiANCj4gPiAxLiBtbWluZnJhX29mZnNldDogRm9yIEdDRSBkYXRhIHBsYW5lIGNvbnRyb2wN
Cj4gPiDCoMKgIFNpbmNlIEdDRSBoYXMgYmVlbiBtb3ZlZCBpbnRvIG1taW5mcmEsIEdDRSBuZWVk
cyB0byBhcHBlbmQgdGhlDQo+ID4gwqDCoCBtbWluZnJhIG9mZnNldCB0byB0aGUgRFJBTSBhZGRy
ZXNzIHdoZW4gYWNjZXNzaW5nIHRoZSBEUkFNLg0KPiANCj4gSXQgc2VlbXMgdGhhdCBHQ0UgaGFz
IGlvdmEgYW5kIG1taW5mcmEgd291bGQgbWFwcGluZyB0aGUgaW92YSB0bw0KPiBwaHlzaWNhbCBh
ZGRyZXNzLg0KPiBNYXliZSBsZXQgR0NFIGJlIGEgaW9tbXUgZGV2aWNlIG9yIGFkZCBpb21tdXMg
cHJvcGVydHkgaW4gZGV2aWNlDQo+IG5vZGUsIGFuZCB1c2UgZG1hX21hcF94eHgoKSB0byBnZXQg
aW92YSBvZiBHQ0UuDQo+IGlvbW11cyBwcm9wZXJ0eSBwb2ludCB0byBtbWluZnJhIGRldmljZSAo
bWF5YmUgYW5vdGhlciBuYW1lKSBhbmQNCj4gbW1pbmZyYSBkZXZpY2Ugd291bGQgcHJvY2VzcyB0
aGUgbWFwcGluZyBvZiBpb3ZhIGFuZCBwaHlzaWNhbA0KPiBhZGRyZXNzLg0KDQpUaGUgR0NFIGlu
IHRoZSA4MTk2IGlzIHVzaW5nIElPVkEgYWxyZWFkeS4NCg0KVGhlIG1haW4gcmVhc29uIG9mIGFk
ZGluZyB0aGUgbW1pbmZyYV9vZmZzZXQgMHg4MDAwXzAwMDAoMkcpIGlzIHRvDQpzb2x2ZSB0aGUg
YWRkcmVzcyBjb25mbGljdGluZyBwcm9ibGVtOg0KRHVlIHRvIE1NSU8sIGlmIHRoZSBHQ0UgbmVl
ZHMgdG8gYWNjZXNzIGEgaGFyZHdhcmUgcmVnaXN0ZXIgYXQNCjB4MTAwMF8wMDAwLCBidXQgdGhl
IFNNTVUgaXMgYWxzbyBtYXBwaW5nIGEgRFJBTSBibG9jayBhdCAweDEwMDBfMDAwMCwNCnRoZSBH
Q0Ugd2lsbCBub3Qga25vdyB3aGV0aGVyIGl0IHNob3VsZCB3cml0ZSB0byB0aGUgaGFyZHdhcmUg
cmVnaXN0ZXINCm9yIHRoZSBEUkFNLg0KVGhlcmVmb3JlLCBhIHJ1bGUgd2FzIHNldCBpbiB0aGUg
TU1JTkZSQSBjaXJjdWl0IGR1cmluZyB0aGUgSFcgZGVzaWduOg0KdHJhbnNhY3Rpb25zIHdpdGgg
YWRkcmVzc2VzIGdyZWF0ZXIgdGhhbiAyRyBhcmUgY29uc2lkZXJlZCBkYXRhIHBhdGhzLA0Kd2hp
bGUgdGhvc2Ugd2l0aCBhZGRyZXNzZXMgbGVzcyB0aGFuIDJHIGFyZSBjb25zaWRlcmVkIGNvbmZp
ZyBwYXRocy4NCkFkZGl0aW9uYWxseSwgb24gdGhlIGRhdGEgcGF0aCwgYWRkcmVzc2VzIGFyZSBy
ZW1hcHBlZCBieSBzdWJ0cmFjdGluZw0KMkcsIGFsbG93aW5nIHRoZSBTTU1VIHRvIHN0aWxsIG1h
cCBEUkFNIGFkZHJlc3NlcyBsZXNzIHRoYW4gMkcuDQpIb3dldmVyLCB0aGUgc29mdHdhcmUgbmVl
ZHMgdG8gYWRkIDJHIHRvIHRoZSBEUkFNIGFkZHJlc3MgdGhhdA0KdGhlIEdDRSBuZWVkcyB0byBh
Y2Nlc3MgdG8gZW5zdXJlIHRoYXQgTU1JTkZSQSB3aWxsIGZvbGxvdyB0aGUgZGF0YQ0KcGF0aC4N
Cg0KU2luY2UgdGhlIE1NSU5GUkEgcmVtYXAgc3VidHJhY3RpbmcgMkcgaXMgZG9uZSBpbiB0aGUg
aGFyZHdhcmUgY2lyY3VpdA0KYW5kIGNhbm5vdCBiZSBjb25maWd1cmVkIGJ5IHNvZnR3YXJlLCB0
aGUgYWRkcmVzcyArMkcgYWRqdXN0bWVudCBpcw0KaW1wbGVtZW50ZWQgaW4gdGhlIENNRFEgZHJp
dmVyLg0KDQo+IA0KPiA+IA0KPiA+IDIuIGdjZV92bTogRm9yIEdDRSBoYXJkd2FyZSB2aXJ0dWFs
aXphdGlvbg0KPiA+IMKgwqAgQ3VycmVudGx5LCB0aGUgZmlyc3QgdmVyc2lvbiBvZiB0aGUgbXQ4
MTk2IG1haWxib3ggY29udHJvbGxlcg0KPiA+IG9ubHkNCj4gPiDCoMKgIHJlcXVpcmVzIHNldHRp
bmcgdGhlIFZNLXJlbGF0ZWQgcmVnaXN0ZXJzIHRvIGVuYWJsZSB0aGUNCj4gPiBwZXJtaXNzaW9u
cw0KPiA+IMKgwqAgb2YgYSBob3N0IFZNLg0KPiANCj4gV2hhdCdzIHRoaXM/IEkga25vdyB0aGlz
IHBhdGNoIHdvdWxkIG5vdCBpbXBsZW1lbnQgdGhlIGZ1bGwgVk0NCj4gZnVuY3Rpb24sDQo+IGJ1
dCBkZXNjcmliZSBtb3JlIGFib3V0IHdoYXQgdGhpcyBpcy4gV2h5IG5lZWQgdG8gZW5hYmxlIHBl
cm1pc3Npb24/DQo+IA0KDQpPSyBJJ2xsIGFkZCB0aGUgY29tbWl0IG1lc3NhZ2UgYmVsb3cgaW4g
dGhlIG5leHQgdmVyc2lvbjoNCg0KRm9yIHRoZSA4MTk2LCBpdCBpcyBuZWNlc3NhcnkgdG8gY29u
ZmlndXJlIGFjY2VzcyBwZXJtaXNzaW9ucyBmb3INCnNwZWNpZmljIEdDRSB0aHJlYWRzIGZvciBk
aWZmZXJlbnQgVk1zIGluIG9yZGVyIHRvIHByb3Blcmx5IGFjY2VzcyB0aGUNCkdDRSB0aHJlYWQg
cmVnaXN0ZXJzLg0KQ3VycmVudGx5LCBzaW5jZSBvbmx5IHRoZSBob3N0IFZNIGlzIGJlaW5nIHVz
ZWQsIGl0IGlzIHJlcXVpcmVkIHRvDQplbmFibGUgYWNjZXNzIHBlcm1pc3Npb25zIGZvciBhbGwg
R0NFIHRocmVhZHMgZm9yIHRoZSBob3N0IFZNLg0KDQpWTV9NQVAwIGlzIGZvciB0aHJlYWRzIDAt
OSwgVk1fTUFQMSBpcyBmb3IgdGhyZWFkcyAxMC0xOSwgVk1fTUFQMiBpcw0KZm9yIHRocmVhZHMg
MjAtMjksIGFuZCBWTV9NQVAzIGlzIGZvciB0aHJlYWRzIDMwLTMxLiBFYWNoIHRocmVhZCBoYXMg
YQ0KMy1iaXQgY29uZmlndXJhdGlvbiwgYW5kIHNldHRpbmcgYWxsIGJpdHMgdG8gMSBtZWFucyB0
aGUgdGhyZWFkIGlzDQpjb25maWd1cmVkIGZvciB0aGUgaG9zdCBWTS4NCg0KUmVnYXJkcywNCkph
c29uLUpIIExpbg0KDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0K

--__=_Part_Boundary_005_1062826575.1139562998
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpUaGFua3MmIzMyO2ZvciYjMzI7
dGhlJiMzMjtyZXZpZXdzLg0KDQpPbiYjMzI7VHVlLCYjMzI7MjAyNS0wMi0xOCYjMzI7YXQmIzMy
OzA5OjI1JiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYjMzI5OTM7JiMyMDQyNjsmIzIw
ODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7T24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTgmIzMy
O2F0JiMzMjsxMzo0MSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjt3cm90ZToN
CiZndDsmIzMyOyZndDsmIzMyO01UODE5NiYjMzI7aGFzJiMzMjszJiMzMjtuZXcmIzMyO2hhcmR3
YXJlJiMzMjtjb25maWd1cmF0aW9uJiMzMjtjb21wYXJlZCYjMzI7d2l0aCYjMzI7dGhlJiMzMjtw
cmV2aW91cw0KJmd0OyYjMzI7Jmd0OyYjMzI7U29DLA0KJmd0OyYjMzI7Jmd0OyYjMzI7d2hpY2gm
IzMyO2NvcnJlc3BvbmQmIzMyO3RvJiMzMjt0aGUmIzMyOzMmIzMyO25ldyYjMzI7ZHJpdmVyJiMz
MjtkYXRhOg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsxLiYjMzI7bW1p
bmZyYV9vZmZzZXQ6JiMzMjtGb3ImIzMyO0dDRSYjMzI7ZGF0YSYjMzI7cGxhbmUmIzMyO2NvbnRy
b2wNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMzI7U2luY2UmIzMyO0dDRSYjMzI7
aGFzJiMzMjtiZWVuJiMzMjttb3ZlZCYjMzI7aW50byYjMzI7bW1pbmZyYSwmIzMyO0dDRSYjMzI7
bmVlZHMmIzMyO3RvJiMzMjthcHBlbmQmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7
JiMxNjA7JiMzMjttbWluZnJhJiMzMjtvZmZzZXQmIzMyO3RvJiMzMjt0aGUmIzMyO0RSQU0mIzMy
O2FkZHJlc3MmIzMyO3doZW4mIzMyO2FjY2Vzc2luZyYjMzI7dGhlJiMzMjtEUkFNLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtJdCYjMzI7c2VlbXMmIzMyO3RoYXQmIzMyO0dDRSYjMzI7aGFzJiMzMjtp
b3ZhJiMzMjthbmQmIzMyO21taW5mcmEmIzMyO3dvdWxkJiMzMjttYXBwaW5nJiMzMjt0aGUmIzMy
O2lvdmEmIzMyO3RvDQomZ3Q7JiMzMjtwaHlzaWNhbCYjMzI7YWRkcmVzcy4NCiZndDsmIzMyO01h
eWJlJiMzMjtsZXQmIzMyO0dDRSYjMzI7YmUmIzMyO2EmIzMyO2lvbW11JiMzMjtkZXZpY2UmIzMy
O29yJiMzMjthZGQmIzMyO2lvbW11cyYjMzI7cHJvcGVydHkmIzMyO2luJiMzMjtkZXZpY2UNCiZn
dDsmIzMyO25vZGUsJiMzMjthbmQmIzMyO3VzZSYjMzI7ZG1hX21hcF94eHgoKSYjMzI7dG8mIzMy
O2dldCYjMzI7aW92YSYjMzI7b2YmIzMyO0dDRS4NCiZndDsmIzMyO2lvbW11cyYjMzI7cHJvcGVy
dHkmIzMyO3BvaW50JiMzMjt0byYjMzI7bW1pbmZyYSYjMzI7ZGV2aWNlJiMzMjsobWF5YmUmIzMy
O2Fub3RoZXImIzMyO25hbWUpJiMzMjthbmQNCiZndDsmIzMyO21taW5mcmEmIzMyO2RldmljZSYj
MzI7d291bGQmIzMyO3Byb2Nlc3MmIzMyO3RoZSYjMzI7bWFwcGluZyYjMzI7b2YmIzMyO2lvdmEm
IzMyO2FuZCYjMzI7cGh5c2ljYWwNCiZndDsmIzMyO2FkZHJlc3MuDQoNClRoZSYjMzI7R0NFJiMz
MjtpbiYjMzI7dGhlJiMzMjs4MTk2JiMzMjtpcyYjMzI7dXNpbmcmIzMyO0lPVkEmIzMyO2FscmVh
ZHkuDQoNClRoZSYjMzI7bWFpbiYjMzI7cmVhc29uJiMzMjtvZiYjMzI7YWRkaW5nJiMzMjt0aGUm
IzMyO21taW5mcmFfb2Zmc2V0JiMzMjsweDgwMDBfMDAwMCgyRykmIzMyO2lzJiMzMjt0bw0Kc29s
dmUmIzMyO3RoZSYjMzI7YWRkcmVzcyYjMzI7Y29uZmxpY3RpbmcmIzMyO3Byb2JsZW06DQpEdWUm
IzMyO3RvJiMzMjtNTUlPLCYjMzI7aWYmIzMyO3RoZSYjMzI7R0NFJiMzMjtuZWVkcyYjMzI7dG8m
IzMyO2FjY2VzcyYjMzI7YSYjMzI7aGFyZHdhcmUmIzMyO3JlZ2lzdGVyJiMzMjthdA0KMHgxMDAw
XzAwMDAsJiMzMjtidXQmIzMyO3RoZSYjMzI7U01NVSYjMzI7aXMmIzMyO2Fsc28mIzMyO21hcHBp
bmcmIzMyO2EmIzMyO0RSQU0mIzMyO2Jsb2NrJiMzMjthdCYjMzI7MHgxMDAwXzAwMDAsDQp0aGUm
IzMyO0dDRSYjMzI7d2lsbCYjMzI7bm90JiMzMjtrbm93JiMzMjt3aGV0aGVyJiMzMjtpdCYjMzI7
c2hvdWxkJiMzMjt3cml0ZSYjMzI7dG8mIzMyO3RoZSYjMzI7aGFyZHdhcmUmIzMyO3JlZ2lzdGVy
DQpvciYjMzI7dGhlJiMzMjtEUkFNLg0KVGhlcmVmb3JlLCYjMzI7YSYjMzI7cnVsZSYjMzI7d2Fz
JiMzMjtzZXQmIzMyO2luJiMzMjt0aGUmIzMyO01NSU5GUkEmIzMyO2NpcmN1aXQmIzMyO2R1cmlu
ZyYjMzI7dGhlJiMzMjtIVyYjMzI7ZGVzaWduOg0KdHJhbnNhY3Rpb25zJiMzMjt3aXRoJiMzMjth
ZGRyZXNzZXMmIzMyO2dyZWF0ZXImIzMyO3RoYW4mIzMyOzJHJiMzMjthcmUmIzMyO2NvbnNpZGVy
ZWQmIzMyO2RhdGEmIzMyO3BhdGhzLA0Kd2hpbGUmIzMyO3Rob3NlJiMzMjt3aXRoJiMzMjthZGRy
ZXNzZXMmIzMyO2xlc3MmIzMyO3RoYW4mIzMyOzJHJiMzMjthcmUmIzMyO2NvbnNpZGVyZWQmIzMy
O2NvbmZpZyYjMzI7cGF0aHMuDQpBZGRpdGlvbmFsbHksJiMzMjtvbiYjMzI7dGhlJiMzMjtkYXRh
JiMzMjtwYXRoLCYjMzI7YWRkcmVzc2VzJiMzMjthcmUmIzMyO3JlbWFwcGVkJiMzMjtieSYjMzI7
c3VidHJhY3RpbmcNCjJHLCYjMzI7YWxsb3dpbmcmIzMyO3RoZSYjMzI7U01NVSYjMzI7dG8mIzMy
O3N0aWxsJiMzMjttYXAmIzMyO0RSQU0mIzMyO2FkZHJlc3NlcyYjMzI7bGVzcyYjMzI7dGhhbiYj
MzI7MkcuDQpIb3dldmVyLCYjMzI7dGhlJiMzMjtzb2Z0d2FyZSYjMzI7bmVlZHMmIzMyO3RvJiMz
MjthZGQmIzMyOzJHJiMzMjt0byYjMzI7dGhlJiMzMjtEUkFNJiMzMjthZGRyZXNzJiMzMjt0aGF0
DQp0aGUmIzMyO0dDRSYjMzI7bmVlZHMmIzMyO3RvJiMzMjthY2Nlc3MmIzMyO3RvJiMzMjtlbnN1
cmUmIzMyO3RoYXQmIzMyO01NSU5GUkEmIzMyO3dpbGwmIzMyO2ZvbGxvdyYjMzI7dGhlJiMzMjtk
YXRhDQpwYXRoLg0KDQpTaW5jZSYjMzI7dGhlJiMzMjtNTUlORlJBJiMzMjtyZW1hcCYjMzI7c3Vi
dHJhY3RpbmcmIzMyOzJHJiMzMjtpcyYjMzI7ZG9uZSYjMzI7aW4mIzMyO3RoZSYjMzI7aGFyZHdh
cmUmIzMyO2NpcmN1aXQNCmFuZCYjMzI7Y2Fubm90JiMzMjtiZSYjMzI7Y29uZmlndXJlZCYjMzI7
YnkmIzMyO3NvZnR3YXJlLCYjMzI7dGhlJiMzMjthZGRyZXNzJiMzMjsrMkcmIzMyO2FkanVzdG1l
bnQmIzMyO2lzDQppbXBsZW1lbnRlZCYjMzI7aW4mIzMyO3RoZSYjMzI7Q01EUSYjMzI7ZHJpdmVy
Lg0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Mi4m
IzMyO2djZV92bTomIzMyO0ZvciYjMzI7R0NFJiMzMjtoYXJkd2FyZSYjMzI7dmlydHVhbGl6YXRp
b24NCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMzI7Q3VycmVudGx5LCYjMzI7dGhl
JiMzMjtmaXJzdCYjMzI7dmVyc2lvbiYjMzI7b2YmIzMyO3RoZSYjMzI7bXQ4MTk2JiMzMjttYWls
Ym94JiMzMjtjb250cm9sbGVyDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtvbmx5DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzE2MDsmIzE2MDsmIzMyO3JlcXVpcmVzJiMzMjtzZXR0aW5nJiMzMjt0aGUmIzMyO1ZN
LXJlbGF0ZWQmIzMyO3JlZ2lzdGVycyYjMzI7dG8mIzMyO2VuYWJsZSYjMzI7dGhlDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtwZXJtaXNzaW9ucw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMz
MjtvZiYjMzI7YSYjMzI7aG9zdCYjMzI7Vk0uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1doYXQmIzM5
O3MmIzMyO3RoaXMmIzYzOyYjMzI7SSYjMzI7a25vdyYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO3dv
dWxkJiMzMjtub3QmIzMyO2ltcGxlbWVudCYjMzI7dGhlJiMzMjtmdWxsJiMzMjtWTQ0KJmd0OyYj
MzI7ZnVuY3Rpb24sDQomZ3Q7JiMzMjtidXQmIzMyO2Rlc2NyaWJlJiMzMjttb3JlJiMzMjthYm91
dCYjMzI7d2hhdCYjMzI7dGhpcyYjMzI7aXMuJiMzMjtXaHkmIzMyO25lZWQmIzMyO3RvJiMzMjtl
bmFibGUmIzMyO3Blcm1pc3Npb24mIzYzOw0KJmd0OyYjMzI7DQoNCk9LJiMzMjtJJiMzOTtsbCYj
MzI7YWRkJiMzMjt0aGUmIzMyO2NvbW1pdCYjMzI7bWVzc2FnZSYjMzI7YmVsb3cmIzMyO2luJiMz
Mjt0aGUmIzMyO25leHQmIzMyO3ZlcnNpb246DQoNCkZvciYjMzI7dGhlJiMzMjs4MTk2LCYjMzI7
aXQmIzMyO2lzJiMzMjtuZWNlc3NhcnkmIzMyO3RvJiMzMjtjb25maWd1cmUmIzMyO2FjY2VzcyYj
MzI7cGVybWlzc2lvbnMmIzMyO2Zvcg0Kc3BlY2lmaWMmIzMyO0dDRSYjMzI7dGhyZWFkcyYjMzI7
Zm9yJiMzMjtkaWZmZXJlbnQmIzMyO1ZNcyYjMzI7aW4mIzMyO29yZGVyJiMzMjt0byYjMzI7cHJv
cGVybHkmIzMyO2FjY2VzcyYjMzI7dGhlDQpHQ0UmIzMyO3RocmVhZCYjMzI7cmVnaXN0ZXJzLg0K
Q3VycmVudGx5LCYjMzI7c2luY2UmIzMyO29ubHkmIzMyO3RoZSYjMzI7aG9zdCYjMzI7Vk0mIzMy
O2lzJiMzMjtiZWluZyYjMzI7dXNlZCwmIzMyO2l0JiMzMjtpcyYjMzI7cmVxdWlyZWQmIzMyO3Rv
DQplbmFibGUmIzMyO2FjY2VzcyYjMzI7cGVybWlzc2lvbnMmIzMyO2ZvciYjMzI7YWxsJiMzMjtH
Q0UmIzMyO3RocmVhZHMmIzMyO2ZvciYjMzI7dGhlJiMzMjtob3N0JiMzMjtWTS4NCg0KVk1fTUFQ
MCYjMzI7aXMmIzMyO2ZvciYjMzI7dGhyZWFkcyYjMzI7MC05LCYjMzI7Vk1fTUFQMSYjMzI7aXMm
IzMyO2ZvciYjMzI7dGhyZWFkcyYjMzI7MTAtMTksJiMzMjtWTV9NQVAyJiMzMjtpcw0KZm9yJiMz
Mjt0aHJlYWRzJiMzMjsyMC0yOSwmIzMyO2FuZCYjMzI7Vk1fTUFQMyYjMzI7aXMmIzMyO2ZvciYj
MzI7dGhyZWFkcyYjMzI7MzAtMzEuJiMzMjtFYWNoJiMzMjt0aHJlYWQmIzMyO2hhcyYjMzI7YQ0K
My1iaXQmIzMyO2NvbmZpZ3VyYXRpb24sJiMzMjthbmQmIzMyO3NldHRpbmcmIzMyO2FsbCYjMzI7
Yml0cyYjMzI7dG8mIzMyOzEmIzMyO21lYW5zJiMzMjt0aGUmIzMyO3RocmVhZCYjMzI7aXMNCmNv
bmZpZ3VyZWQmIzMyO2ZvciYjMzI7dGhlJiMzMjtob3N0JiMzMjtWTS4NCg0KUmVnYXJkcywNCkph
c29uLUpIJiMzMjtMaW4NCg0KJmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMyO0NLDQomZ3Q7JiMz
MjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48
cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1062826575.1139562998--

