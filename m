Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0AE91D606
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF6410E136;
	Mon,  1 Jul 2024 02:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jHaqu68A";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Qdsq/45d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554D910E136
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:22:28 +0000 (UTC)
X-UUID: bf89af02375011ef99dc3f8fac2c3230-20240701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=BQP0Ctp7Tcw1UJ1JdwD8APvjg5hduDJcFZllEAhaTiM=; 
 b=jHaqu68AAdY68fPgJtN7o7CISlGO4zNkhS9GRWt2GxylCYONVTdF6B5MsF1U+/sKvTmd8IX0jF+1nkuAKjRIbL8cYhUFhF6RDJAbEX1mPINxPev6Ljhk7UbNSqnSZIksJgTasAZ92K8GWSKyC1Olp55lVqdvl7H5Phpfzgcsw2E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:916dabfe-9ce1-41fb-b1b1-f50a875a1ea4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:d875e70c-46b0-425a-97d3-4623fe284021,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bf89af02375011ef99dc3f8fac2c3230-20240701
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1451217058; Mon, 01 Jul 2024 10:22:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 1 Jul 2024 10:22:20 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 1 Jul 2024 10:22:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce/SsSDZSRCIVs92arrCGbb2SUpitXyQQpIzsysrI29r5boxfH2OSTmgf8J1c2UPVoyOwGBMZ9TlF9xnc5Wfjoci1xH3MJpMj0OEdNx7voqKBzUc9/xaL0aGxW0uvCKva4DVvSs8ViyObbU2bAM0cXRixUzcNqcrt6zMbpxM/MZpI0YYa0FxpOjxEZAZXiHk0lTQ2GWqKrETYfuB03s7zWMYJ1BHNiu4bK537yO0c5VIeZ4PpcDPxmxPz0p0WVmr8TR1W6hQiT661yZXCa/jYvr4Cx/Vw64KKy/KQTIy6sr8xbgswjLHpDZV/q4xakdWxxXply3ikiQtyMqV4NNlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+s2ZI1gD6atYys63AbhRIo6k4AmVdetz8oAkfQb3bk=;
 b=P2pIFcLuwLz9ecA4G1Ci0cd8MwFB4qLIkL1NlpGECmY6YBuuv8Gt6dJsoEuttxow7yqrX3ooLxOVffHCoEqwmC4SNWYdUqO2iAw5oINvaaDpUKqUxuyobXrbZRSJrACI3js4F68qj83d5ZpN0Rll5FyT2FXsVaMIh1sSV271XZnzJtslM8nvHE6p0Zt+onolb5Vs7knnJ+DBxVEWCZtuUJtIv+ZNbDn7xhfZlL40ISdxnTgetdbMkDX7SiAsI+roFvheB3vd+6Zf9Rwy773OjS7Wj2fHPPlFJ7ajmgHDiv2S5saqCPJcrgpVjXVf4a8SO/VRLSggYGb9eLm7MkQvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+s2ZI1gD6atYys63AbhRIo6k4AmVdetz8oAkfQb3bk=;
 b=Qdsq/45dqIxu0Yv2d4EEu8RydmmOTaWeaapZYpyBk7ybn63v9VgaUUwHwcyD9Pg4cGrEe5L7VOXcIBM4xYInjWaT4LDXh9dgw0YBqGUqo04hEttAj6fCQPSeZjv8yVdpp1yKfo7Am39PN6mZsyIbSIvf26KBBHcvAz8M6VQr0Dw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6591.apcprd03.prod.outlook.com (2603:1096:4:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 02:22:16 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 02:22:16 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHawm4CehGZ7j4H80uVSodFizERF7HhNh2A
Date: Mon, 1 Jul 2024 02:22:16 +0000
Message-ID: <5374029c58dbb4e2c23f86e74eabbde7b2ae7b78.camel@mediatek.com>
References: <20240620-blend-v1-0-72670072ca20@mediatek.com>
 <20240620-blend-v1-2-72670072ca20@mediatek.com>
In-Reply-To: <20240620-blend-v1-2-72670072ca20@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6591:EE_
x-ms-office365-filtering-correlation-id: ce170ee8-1148-4a63-e5c5-08dc9974a036
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MnRUWUdpVGc2d3FVU2t2aXE0TThXZzYva2JqUnhnK25QZzB3NE5uanc4cjVa?=
 =?utf-8?B?VXJOWWg0UG9LcmZPK2RIT3VGS3oxY25JY0RZUnNjYW40NnJJQzRINEM2Nm5G?=
 =?utf-8?B?eHJRUmcyYUl2Mktzdng4aUFXanB0OFNiZFdDeVB2RDkwQlBZWW5uK1RZL0RW?=
 =?utf-8?B?NkdJdnJmNGs0d3h2aVpZL0FoYmlqc3J1eXRjRlV2K1VFbDZxQ0U4eXFhS1hI?=
 =?utf-8?B?ZWV5dFg3eEJqVG5vb0g0cldIK0d5cGhITXJuVzMwZ3NMcmxTcWsvTzNqZWo2?=
 =?utf-8?B?WC96aGpwK0FOV1drUk8wUW9ndXVsbzNjTFdNbmZWZG52aXdhMnNYcGo0c0E2?=
 =?utf-8?B?TitpMTIwNkZmanFrSFZNUnVWajM3UEY0MFdPdk0zcmxYNDdiVTF4ZnNzbVhi?=
 =?utf-8?B?MlRVdU5rclJDN0Z2WWdadkNCRWNDbUlTY1hWOEkvem9vSU5PTDc3M2p1SHRj?=
 =?utf-8?B?eEhSNVk4K3prZ2pKWE1jQTZwMXQ4aHlGR0R5bFhzYlozVDExc0VXSU1jTkQy?=
 =?utf-8?B?YlVCeExRRHp1S3ZlMDZncGJ2ajUzYXVWLzNZQkdmVUtObEdzejErMGdxR0o4?=
 =?utf-8?B?ZTVIYnFNelU2WlA0N0tNY2hlaXpMbHpiNzVFdmdNMysyNVpRS2NDOTJaaXRR?=
 =?utf-8?B?SmI5dVFuejlha00vZHhYQ3RmZTA1ekJLcUNoTFBCNmdJYWJSdzlibXNyWk9v?=
 =?utf-8?B?OXorTWppMTU3QUZmVmZaaFlxNk92bGJMQ3JvYkZHRjVUa3U4Vk9uVUw5UXBF?=
 =?utf-8?B?eDBzZkx0UktIbGJqd004UnR4UTJjKzJ6K0F4ek5VME5nMGI4SEtvK1RQTHdO?=
 =?utf-8?B?THc4NFNQT0UvSG9QYXZ4VGQvNUNoSkZ0OEUyeUtrTjN2VC9jN3g5TjRJYkx6?=
 =?utf-8?B?bVJEZ2tPRENMQlppQlBMRmVJdGJEcnR1TFhQVEZ3bHpDTi9sVEMwTTlwZUR0?=
 =?utf-8?B?VnNubjdyTURlSDI4N3NZY3JNTHBxMHJrOFRyY2VlVnVIeGtWMXdnNHBtZXRs?=
 =?utf-8?B?UWhkcGpwY2xWNDZkMjBhaHhHOHhBZkVJNHlBVWdQeElaRVJobnpOUUZ6UTd6?=
 =?utf-8?B?YTdpZklwZ1pEVjZkNk1KNWsvZjhYaWlzSVNwWm5OdEx1Y01jR2xJYnR3SHJE?=
 =?utf-8?B?c3g0VDdCU3AvNDNQaWkwcERPYlFGUXUwZU1KdWlkMUp2bmZKd0VxWjR1QkZ1?=
 =?utf-8?B?RnZEU0xheVdIVmkrdndkM2ZpVHhiZUtuSnNJK0FxZUk4MWpIT1k0VllHN2t6?=
 =?utf-8?B?d2tvc0diUS9oQXBoaDBEVXZRM21mNTJ5UlNiMDBVWkhmZFNJLzJlOFk2ekZw?=
 =?utf-8?B?bGZsczgxQXkxbk9Ua2dhZENkQjNmV3RCWHVad3luZmRwVVErVlZTVGdDSTN4?=
 =?utf-8?B?bHhTN2FIaXRiODNOdlQ4SllMOTBaRFl3Q212a0swYUE3ZWZWcytQN29YK3JT?=
 =?utf-8?B?UzdiVitWV0k0Z0twZnp4eWxuZ05Td0Z0S054b1R4c3kvcEtnUGUxSGZBYkdJ?=
 =?utf-8?B?ODNLZjF5WURwVnoxdUZ0enFjdzdiVlZKQWtIYVVZZDJoRkFxSW1paTFWZHo0?=
 =?utf-8?B?WU5xYmlJS1BuWEJqZGl1clNCTXJvNHNSb2VhOTFHUWpIcEdYanJUc0N0SW5j?=
 =?utf-8?B?cDUzMnFMSHh0bzFEbmxHSDV6eHR2Nm51a1d2QkRWM3hIdnVtTnl4cEFjdEh2?=
 =?utf-8?B?THZNQVhlWENNdzIyeE95WUdObk4rRWpteHJ3VFhFdFBqcjBLMHNNWUIvWkpm?=
 =?utf-8?B?QWdRYTZzczVaWFdray9Jblc1ZnErR3M2czhFMGRtZzNmNWNzT0Z0NElMVXVz?=
 =?utf-8?B?ZzY1bXN3bForZERDb3RCVm1VLzFvVGNpcGhNWU5ycXNrVWI3aVI3cXhnYnEz?=
 =?utf-8?B?UExXamV2Ylp1TVEvT1JLN2MrUXZEYU96RCsrNUVJWUlqelE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVY0WHgrRmd4YTlCRDBvRzJiZCsvL0x2TnR4bm1kOU1mdTFzRkVSd1JRbjc3?=
 =?utf-8?B?N0hGeE9lWWJKTVdMZ2pYMVk5cW1tSTArOVZTU05DWUF0TC9DaW5CSTQxV25U?=
 =?utf-8?B?bzlUZzlKL1hFMjhLci9memd1K2t3Zm9kUDV4OHRqT0xkd2szbHlrby9DTmhL?=
 =?utf-8?B?OFlsOUFLNXlWZEtKZGRwWnFTSEppSzNqaXZSaW1XQjQ3alNkNDdSaFBVNVNP?=
 =?utf-8?B?bEtBS1lhSHZqUklNeDFZQkY2dlo2Wm1UTGdqYkowNmFoZUhBTTY3WDI4YmRj?=
 =?utf-8?B?T2JqaThzNmFTTEI0czJ4M3ZsTlE5OGQ1RW9HQTVkdWN4UUxwYzFCU2FDRFlE?=
 =?utf-8?B?bmZLMTNLVmd6cnljcXoybXBKWEdOQ0ovT3dSTXQ1Qjk3VnZtd1UzbHArdDhh?=
 =?utf-8?B?bmEwVVZ3VFVqSDI5eldzYmgxK1hpdjZOWG10T2p1ekZvU2NQajgrUlMvUElo?=
 =?utf-8?B?dlplNHRzVHBNSnk0R1VPdEFyOC9xaUNaRXdscDZJTzRxUXUrT2c2ZUJvVk11?=
 =?utf-8?B?NTQ0Yjd1Wk4yY1BnTnR6eVlxQTZTZnhjS2tpYmJFenJ5MHUrbENhTHd4WWZH?=
 =?utf-8?B?dnFldjkxUjlEeTFXR2VJLzRwOHVVbHM1dURVZm14QVdGMkhyY0VObmtCcjFa?=
 =?utf-8?B?YVF6RjNXOWRFYnZYT1RyUHZZdTBoeEZSQXNwUUtOVjdlMzlJd1lLN2ZjRWRR?=
 =?utf-8?B?dkJOR0VSc3pZZmVMZWFjeVJQY2RHMDFNSmkxamxJelZoYVJQUEZwRlYzVXg4?=
 =?utf-8?B?RkpaclFFUGpDZHVmQzNPeU9kemo5b2wvMkVITitDN2FKVGJ5ejhZY203RFI2?=
 =?utf-8?B?OVk4NkR3N1dxdDZsRWgyeXcvSEJ3dWlGSXFCRkt4ald6Ujl0bStjQzl0S3dI?=
 =?utf-8?B?bGxKMkpkaHNCRHFaQTBQZFUvSnVLSS9JcVVUS1c5bDhrb0s3U3dFM3B1c3kx?=
 =?utf-8?B?YUhpV0RoVkQxYzdvWkFQcGtpRFQ2RVhIa1RPa1R2aU92VG43Z0M5ZGhjTXE2?=
 =?utf-8?B?WjRZbkhKTy9GUVJJSGt6U0R6aE9jd0JYbEQ4ZC9ySFJ6Tk9Uc0tFVVJSZ2VH?=
 =?utf-8?B?UVBjbVpRVldJSm9Dc0ZXS2JQeExicVJzakV5aHo5MkxnYlUwQmZSUmljN2FI?=
 =?utf-8?B?RlVNSG16VERRVWVacFJoWUJRdXh5MDBJaUxOcHV4WlBPcThyby9LeDgwdnlo?=
 =?utf-8?B?UGV4WjBBRkxqSWJMVnhtZ0Fza0pzUGxiTEpSNU5QUUdKclNzdkZ1YUJzamhy?=
 =?utf-8?B?QTBsT0Z3NTQ2eklzN2JIdEViN2c0blhFU2xpeDNNdmNuYlFVS1hyWjhwWW5o?=
 =?utf-8?B?OGQvVnRqWW5BUGdvREluaDZCdkNpZDZxOVYwUThsb3c1SDh2L1U5K3BndnNQ?=
 =?utf-8?B?Rm40Y3FMazNkQk03SDA3TTdOK1BnSit3T1YrUTcrNUEwUGVURW9wT0F3ZEtC?=
 =?utf-8?B?WEw3RTZEdEVGenhEZVNEenZRNzlNUkJqTzVUYUlramhRTi96V3BubkxCV3lW?=
 =?utf-8?B?TzlkR3RRRDhOMXArVHhFdjI5MENWMk9wL3R5TmtJaEVkcWxWaTg2SEwrN3Q0?=
 =?utf-8?B?c3V6bkhDZWI0aEx2dE1MUk9iZ1N2UTg0TkVlRHhWUTVYS3R4NDBMSUUvN2d4?=
 =?utf-8?B?cTZwbGgwRkxnMTJaV2lZbDRZNzdpWjEyKzJwQ1JSODR3MDJYTlo2OHpjVUlN?=
 =?utf-8?B?YzVmTHV5RjRENkgwOXFmcVFkRXZQM1UwTWdxeW9MUnhxTXoyNGxENFp1eHdK?=
 =?utf-8?B?YndYZzhDRkN5K0I3MVJDUUpKNWdSVU9HME81K1Z6emlBK0VNaU9ieXRNcjJK?=
 =?utf-8?B?Q3A3R24ybThKaVFROC9ucldjYVBBdFN2RXFuQk1xaGZzVE11TEkvaEZjKzRt?=
 =?utf-8?B?Kzd4UzJkYkludVJhS3JLMFJKc1FJcys5Q0QwaVVKdnE3SDJucS9IRjU1c21Z?=
 =?utf-8?B?NE5GQzk1NlZ6S25zR1ZnbW5BMHJFUmxMcTRwVklIVkFTTW9HYXdEa3Y5TUtX?=
 =?utf-8?B?SUJld1I3aW5ZSGJkOVdlSnJGa2Z4ZUd4RHA4L21oOUlCZHB2aVB4Q29pa3U2?=
 =?utf-8?B?N1I1czlvQThTZGhMRjFhcUFacWdBcDR6MVBsclkybThyRVZKMkhxWnZWOGZs?=
 =?utf-8?Q?jFbCgd0Pfp/mb0yB0Ux2/wCDY?=
Content-ID: <9CD4502932E11F4C8E5659C62776E0D1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce170ee8-1148-4a63-e5c5-08dc9974a036
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 02:22:16.2762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eQXMwa2gZY6BtYsFKg5gI0dA53ClZFLymCLe5dNnw9ZnrF/u3xsoVu2RC693KzNWcmRpzvY9e8z6iqOVZvlmhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6591
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.053100-8.000000
X-TMASE-MatchedRID: oTBA/+sdKaY/XHdICuW5rya1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCks3z3wljuVXxQvMEFMAcCUb0i1/OzLz9diCsYPC4Ul2Zvo
 +mFW19mCMKKuuIHcTr+u8J5Yu5uTgi9Om4SO4imQVglQa/gMvfAreImldQ5BDNEJplIoT86wsX2
 NvG8rX7UT88A7P9JJ2uRJDyxxCQ2afgYw5AuFyU54CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
 QCUU+jzjoczmuoPCq1GAgurjgXXIpvckOWI14tz9D4BW1HZX8yvMOU22rY4apIipLKBspxJ
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.053100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4DC60A1EBAAD8813BE157243D5F0445CCF28DA8B1BAD1F7D0AB57030CBFB56592000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1942841303.1024974803"
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

--__=_Part_Boundary_007_1942841303.1024974803
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDYtMjAgYXQgMDE6MjcgKzA4MDAsIEhzaWFvIENo
aWVuIFN1bmcgdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQ
bGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhh
dmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEZyb206IEhzaWFvIENo
aWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIg
YWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRlaydzIGNoaXBzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIHwgMTMgKysrKysrKysrKy0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGluZGV4IDM2MDIxY2I4ZGY2
Mi4uNDhiNzE0OTk0NDkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2V0aGRyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5j
DQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICogQ29weXJpZ2h0IChjKSAyMDIxIE1lZGlhVGVrIElu
Yy4NCj4gICAqLw0KPiAgDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9ibGVuZC5oPg0KPiAgI2luY2x1
ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5o
Pg0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiBAQCAtMzUsNiArMzYsNyBAQA0KPiAgI2Rl
ZmluZSBNSVhfU1JDX0wwX0VOQklUKDApDQo+ICAjZGVmaW5lIE1JWF9MX1NSQ19DT04obikoMHgy
OCArIDB4MTggKiAobikpDQo+ICAjZGVmaW5lIE5PTl9QUkVNVUxUSV9TT1VSQ0UoMiA8PCAxMikN
Cj4gKyNkZWZpbmUgUFJFTVVMVElfU09VUkNFKDMgPDwgMTIpDQo+ICAjZGVmaW5lIE1JWF9MX1NS
Q19TSVpFKG4pKDB4MzAgKyAweDE4ICogKG4pKQ0KPiAgI2RlZmluZSBNSVhfTF9TUkNfT0ZGU0VU
KG4pKDB4MzQgKyAweDE4ICogKG4pKQ0KPiAgI2RlZmluZSBNSVhfRlVOQ19EQ00wMHgxMjANCj4g
QEAgLTE3NSw3ICsxNzcsMTMgQEAgdm9pZCBtdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlkeCwNCj4gIGFscGhhX2NvbiB8PSBzdGF0ZS0+YmFz
ZS5hbHBoYSAmIE1JWEVSX0FMUEhBOw0KPiAgfQ0KPiAgDQo+IC1pZiAoc3RhdGUtPmJhc2UuZmIg
JiYgIXN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkgew0KPiAraWYgKHN0YXRlLT5i
YXNlLnBpeGVsX2JsZW5kX21vZGUgPT0gRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSkNCj4gK2Fs
cGhhX2NvbiB8PSBQUkVNVUxUSV9TT1VSQ0U7DQo+ICtlbHNlDQo+ICthbHBoYV9jb24gfD0gTk9O
X1BSRU1VTFRJX1NPVVJDRTsNCg0KQ292ZXJhZ2UgbW9kZSBpcyBhbiBhbHJlYWR5IHN1cHBvcnQg
bW9kZSwgYnV0IHRoaXMgcGF0Y2ggbW9kaWZ5IGFscGhhX2NvbiBmb3IgY292ZXJhZ2UgbW9kZS4N
ClNvIHRoaXMgaXMgYSBidWcgZml4Pw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICtpZiAoKHN0
YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpIHx8DQo+
ICsgICAgc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZSA9PSBEUk1fTU9ERV9CTEVORF9QSVhF
TF9OT05FKSB7DQo+ICAvKg0KPiAgICogTWl4ZXIgZG9lc24ndCBzdXBwb3J0IENPTlNUX0JMRCBt
b2RlLA0KPiAgICogdXNlIGEgdHJpY2sgdG8gbWFrZSB0aGUgb3V0cHV0IGVxdWl2YWxlbnQNCj4g
QEAgLTE5MSw4ICsxOTksNyBAQCB2b2lkIG10a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0IGRl
dmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwg
cGVuZGluZy0+aGVpZ2h0IDw8IDE2IHwgYWxpZ25fd2lkdGgsICZtaXhlci0+Y21kcV9iYXNlLA0K
PiAgICAgICAgbWl4ZXItPnJlZ3MsIE1JWF9MX1NSQ19TSVpFKGlkeCkpOw0KPiAgbXRrX2RkcF93
cml0ZShjbWRxX3BrdCwgb2Zmc2V0LCAmbWl4ZXItPmNtZHFfYmFzZSwgbWl4ZXItPnJlZ3MsIE1J
WF9MX1NSQ19PRkZTRVQoaWR4KSk7DQo+IC1tdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIGFs
cGhhX2NvbiwgJm1peGVyLT5jbWRxX2Jhc2UsIG1peGVyLT5yZWdzLCBNSVhfTF9TUkNfQ09OKGlk
eCksDQo+IC0gICAweDFmZik7DQo+ICttdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBhbHBoYV9jb24s
ICZtaXhlci0+Y21kcV9iYXNlLCBtaXhlci0+cmVncywgTUlYX0xfU1JDX0NPTihpZHgpKTsNCj4g
IG10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgQklUKGlkeCksICZtaXhlci0+Y21kcV9iYXNl
LCBtaXhlci0+cmVncywgTUlYX1NSQ19DT04sDQo+ICAgICBCSVQoaWR4KSk7DQo+ICB9DQo+IA0K
PiAtLSANCj4gR2l0LTE0NikNCj4gDQo+IA0KPiANCg==

--__=_Part_Boundary_007_1942841303.1024974803
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDYtMjAmIzMyO2F0JiMzMjswMToyNyYjMzI7KzA4MDAsJiMzMjtIc2lhbyYjMzI7Q2hp
ZW4mIzMyO1N1bmcmIzMyO3ZpYSYjMzI7QjQmIzMyO1JlbGF5JiMzMjt3cm90ZToNCiZndDsmIzMy
OyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNl
JiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjth
dHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3Ro
ZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtG
cm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRp
YXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1N1cHBvcnQmIzMyOyZxdW90O05vbmUm
cXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7bW9kZSYjMzI7b24mIzMyO01lZGlhVGVr
JiMzOTtzJiMzMjtjaGlwcy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMy
O0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29t
Jmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZXRoZHIuYyYjMzI7fCYjMzI7MTMmIzMyOysrKysrKysrKystLS0NCiZndDsmIzMyOyYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEwJiMzMjtpbnNlcnRpb25zKCspLCYjMzI7
MyYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMz
MjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyO2luZGV4JiMzMjszNjAyMWNiOGRm
NjIuLjQ4YjcxNDk5NDQ5MiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjtAQCYjMzI7LTMsNiYjMzI7KzMs
NyYjMzI7QEANCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtDb3B5cmlnaHQmIzMyOyhjKSYjMzI7
MjAyMSYjMzI7TWVkaWFUZWsmIzMyO0luYy4NCiZndDsmIzMyOyYjMzI7JiMzMjsqLw0KJmd0OyYj
MzI7JiMzMjsNCiZndDsmIzMyOysjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fYmxlbmQuaCZndDsN
CiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtkcm0vZHJtX2ZvdXJjYy5oJmd0Ow0KJmd0
OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fZnJhbWVidWZmZXIuaCZndDsNCiZn
dDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtsaW51eC9jbGsuaCZndDsNCiZndDsmIzMyO0BA
JiMzMjstMzUsNiYjMzI7KzM2LDcmIzMyO0BADQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01J
WF9TUkNfTDBfRU5CSVQoMCkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TUlYX0xfU1JDX0NP
TihuKSgweDI4JiMzMjsrJiMzMjsweDE4JiMzMjsqJiMzMjsobikpDQomZ3Q7JiMzMjsmIzMyOyNk
ZWZpbmUmIzMyO05PTl9QUkVNVUxUSV9TT1VSQ0UoMiYjMzI7Jmx0OyZsdDsmIzMyOzEyKQ0KJmd0
OyYjMzI7KyNkZWZpbmUmIzMyO1BSRU1VTFRJX1NPVVJDRSgzJiMzMjsmbHQ7Jmx0OyYjMzI7MTIp
DQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01JWF9MX1NSQ19TSVpFKG4pKDB4MzAmIzMyOysm
IzMyOzB4MTgmIzMyOyomIzMyOyhuKSkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TUlYX0xf
U1JDX09GRlNFVChuKSgweDM0JiMzMjsrJiMzMjsweDE4JiMzMjsqJiMzMjsobikpDQomZ3Q7JiMz
MjsmIzMyOyNkZWZpbmUmIzMyO01JWF9GVU5DX0RDTTAweDEyMA0KJmd0OyYjMzI7QEAmIzMyOy0x
NzUsNyYjMzI7KzE3NywxMyYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19ldGhkcl9sYXllcl9jb25m
aWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtp
ZHgsDQomZ3Q7JiMzMjsmIzMyO2FscGhhX2NvbiYjMzI7fD0mIzMyO3N0YXRlLSZndDtiYXNlLmFs
cGhhJiMzMjsmYW1wOyYjMzI7TUlYRVJfQUxQSEE7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjstaWYmIzMyOyhzdGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1w
OyYjMzI7IXN0YXRlLSZndDtiYXNlLmZiLSZndDtmb3JtYXQtJmd0O2hhc19hbHBoYSkmIzMyO3sN
CiZndDsmIzMyOytpZiYjMzI7KHN0YXRlLSZndDtiYXNlLnBpeGVsX2JsZW5kX21vZGUmIzMyOz09
JiMzMjtEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKQ0KJmd0OyYjMzI7K2FscGhhX2NvbiYjMzI7
fD0mIzMyO1BSRU1VTFRJX1NPVVJDRTsNCiZndDsmIzMyOytlbHNlDQomZ3Q7JiMzMjsrYWxwaGFf
Y29uJiMzMjt8PSYjMzI7Tk9OX1BSRU1VTFRJX1NPVVJDRTsNCg0KQ292ZXJhZ2UmIzMyO21vZGUm
IzMyO2lzJiMzMjthbiYjMzI7YWxyZWFkeSYjMzI7c3VwcG9ydCYjMzI7bW9kZSwmIzMyO2J1dCYj
MzI7dGhpcyYjMzI7cGF0Y2gmIzMyO21vZGlmeSYjMzI7YWxwaGFfY29uJiMzMjtmb3ImIzMyO2Nv
dmVyYWdlJiMzMjttb2RlLg0KU28mIzMyO3RoaXMmIzMyO2lzJiMzMjthJiMzMjtidWcmIzMyO2Zp
eCYjNjM7DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOygo
c3RhdGUtJmd0O2Jhc2UuZmImIzMyOyZhbXA7JmFtcDsmIzMyOyFzdGF0ZS0mZ3Q7YmFzZS5mYi0m
Z3Q7Zm9ybWF0LSZndDtoYXNfYWxwaGEpJiMzMjt8fA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7c3RhdGUtJmd0O2Jhc2UucGl4ZWxfYmxlbmRfbW9kZSYjMzI7PT0mIzMyO0RSTV9NT0RF
X0JMRU5EX1BJWEVMX05PTkUpJiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy8qDQomZ3Q7JiMzMjsmIzMy
OyYjMzI7KiYjMzI7TWl4ZXImIzMyO2RvZXNuJiMzOTt0JiMzMjtzdXBwb3J0JiMzMjtDT05TVF9C
TEQmIzMyO21vZGUsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7KiYjMzI7dXNlJiMzMjthJiMzMjt0cmlj
ayYjMzI7dG8mIzMyO21ha2UmIzMyO3RoZSYjMzI7b3V0cHV0JiMzMjtlcXVpdmFsZW50DQomZ3Q7
JiMzMjtAQCYjMzI7LTE5MSw4JiMzMjsrMTk5LDcmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfZXRo
ZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dW5zaWduZWQm
IzMyO2ludCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCYj
MzI7cGVuZGluZy0mZ3Q7aGVpZ2h0JiMzMjsmbHQ7Jmx0OyYjMzI7MTYmIzMyO3wmIzMyO2FsaWdu
X3dpZHRoLCYjMzI7JmFtcDttaXhlci0mZ3Q7Y21kcV9iYXNlLA0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttaXhlci0mZ3Q7cmVncywmIzMyO01JWF9MX1NSQ19T
SVpFKGlkeCkpOw0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCYjMzI7b2Zm
c2V0LCYjMzI7JmFtcDttaXhlci0mZ3Q7Y21kcV9iYXNlLCYjMzI7bWl4ZXItJmd0O3JlZ3MsJiMz
MjtNSVhfTF9TUkNfT0ZGU0VUKGlkeCkpOw0KJmd0OyYjMzI7LW10a19kZHBfd3JpdGVfbWFzayhj
bWRxX3BrdCwmIzMyO2FscGhhX2NvbiwmIzMyOyZhbXA7bWl4ZXItJmd0O2NtZHFfYmFzZSwmIzMy
O21peGVyLSZndDtyZWdzLCYjMzI7TUlYX0xfU1JDX0NPTihpZHgpLA0KJmd0OyYjMzI7LSYjMzI7
JiMzMjsmIzMyOzB4MWZmKTsNCiZndDsmIzMyOyttdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCYjMzI7
YWxwaGFfY29uLCYjMzI7JmFtcDttaXhlci0mZ3Q7Y21kcV9iYXNlLCYjMzI7bWl4ZXItJmd0O3Jl
Z3MsJiMzMjtNSVhfTF9TUkNfQ09OKGlkeCkpOw0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dyaXRl
X21hc2soY21kcV9wa3QsJiMzMjtCSVQoaWR4KSwmIzMyOyZhbXA7bWl4ZXItJmd0O2NtZHFfYmFz
ZSwmIzMyO21peGVyLSZndDtyZWdzLCYjMzI7TUlYX1NSQ19DT04sDQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO0JJVChpZHgpKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjstLSYjMzI7DQomZ3Q7JiMzMjtHaXQtMTQ2KQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0t
ey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoq
KioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1t
YWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVu
dGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20g
ZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0K
Y29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRp
c3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlp
bmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRl
bmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5s
YXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFp
bCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0
byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5v
dA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNv
bi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_1942841303.1024974803--

