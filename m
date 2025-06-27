Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F1AEAC57
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 03:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972AD10E305;
	Fri, 27 Jun 2025 01:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="U5ai6gaa";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NUCdqf4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E3210E305
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 01:32:27 +0000 (UTC)
X-UUID: 936afc6a52f611f0b33aeb1e7f16c2b6-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=0jMO6bNJibKFeRkH8wyObb4CxwZtMVME79TLj9FDYQU=; 
 b=U5ai6gaaBClmjUt8/FKE8FtMjKAoB+IT6GA9NLPOTjcuVpXXy4YtUnN6wSFZlokvbE6twEV7kzJQ1Vmgl7sOS3u1s0Ir9ncI/VJweT+DLNHDB9I57/SbdpKIxdnkr2QcB11fsYr9pWGL27z51+QpmzfgFXBbcF/QORX//t/erJ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:fdca0641-400f-4db4-9eba-16aba72070f5, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:45559d73-15a7-4ae6-ad4b-94c27b45c266,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 936afc6a52f611f0b33aeb1e7f16c2b6-20250627
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1335319774; Fri, 27 Jun 2025 09:32:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 09:32:21 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 09:32:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSKsB86W6hDknCoKPEOcjj9Ak1NQs4UlZmmUs2qdFEto5YVcuovYvlokEb98RoqUo4PjSeT8RxBIlHLrjGn2F9HQAZJpmJOy7fyhVr+38Ag737bcKBpajY9uAFRxmUeakuL9Ilp1+b8I5LJ3AHFDUfcOqRM7/E18ETTNiio5JdmIWpqOO8sZm7U0laWQ8bh/149AFz4HYh/jngjDvfY2ZYZHmWj5U8Xy/a0ifL0sVVd6LcPMaoU0ow3zLZUptC4cdnRiDI1Z8D/mM9Y5Fk78+zNodJzYKBC8MrDmDmUqunTKEFAPH8Ve9oX6/KxT3ymMR7Ln7f32SdzW5xR+3UIwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNrLugenpIWK/pOQvhbV003zC21Q3/I+CuIYya+unCU=;
 b=FIfZF07MZ42EOK0GGGt5SXkp6PQ+Kdw+R4ABbOxK5NlKBtg/r7ty+aNZ5ugg38rrDJl7lXObZK6tc8bDCVL0qx3Qsoz0d35JYR2Y0ta47gQxQ31s2YCmXkEoPAa2U49IRBJzSZH7V9VrCKxQ7+hHqmPP0bkNm5FbzbaAuZVQE2HdxIkeJQtXplVDVEV5h4IVjVs+weW1i79SpesjiCYYpU5R3zfDjOg7onj0JwCZTG7dG+Mn1ERkQ0ZM1PEXQVU28MJ0Es+Mho+V1LiahVsdhixKn0GbRVfy4MV890mlz1gXEAWnplFWvLPtyU1g6RLPP2X5uoBfrA3jKkP4M1w1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNrLugenpIWK/pOQvhbV003zC21Q3/I+CuIYya+unCU=;
 b=NUCdqf4qlpApCSBh/8GHWrDjrTtVCuV1CgiKGt5xdz+2I2YKQlp+4L/CIr8J/6hb3UMJof6YD6n7E89O4477vqpgLB4JUv3fI0D3iXlca9oivDPEjNmARqOVz63LiQxO9L9r2kNgg+as2VZAc/EmIAJ9JqDc1H9zLoh809eYkyI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY2PPFA66B8D345.apcprd03.prod.outlook.com (2603:1096:408::9e0)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 27 Jun
 2025 01:32:19 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 01:32:19 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?=
 <Mac.Shen@mediatek.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Nicolas Prado
 <nfraprado@collabora.com>, =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?=
 <Peng.Liu@mediatek.com>, =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?=
 <Liankun.Yang@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] drm/mediatek: Adjust bandwidth limit for DP
Thread-Topic: [PATCH v4 1/1] drm/mediatek: Adjust bandwidth limit for DP
Thread-Index: AQHb5bdPB+1hhoYhX0CpWWLjQmdYErQUOHCAgAICxAA=
Date: Fri, 27 Jun 2025 01:32:18 +0000
Message-ID: <667a201e7893d6d4bf9ae0267a5afaf06faa5db8.camel@mediatek.com>
References: <20250625095446.31726-1-liankun.yang@mediatek.com>
 <f3135961b2fe2c2b5cb3c29d76eb3d818d7a766a.camel@collabora.com>
In-Reply-To: <f3135961b2fe2c2b5cb3c29d76eb3d818d7a766a.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY2PPFA66B8D345:EE_
x-ms-office365-filtering-correlation-id: 6dc80589-c6f0-469c-fa23-08ddb51a74dc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?K0JKWngyQXBoWWdNVHkyT1V4WTNyS1U1c0pkZFMrYVA3Z1YxbHR6SllKNC91?=
 =?utf-8?B?NmdnaXJJclhES2dleGFRaGRlR3BDZ2c5WHExa3VKWi8wVDV5bkI4aHBrZzYz?=
 =?utf-8?B?VTdIZXgxRk1uRXRHVnhGaCs2VjBtNE1xa0liMVZKYUtCZThNSnJGTDcvNEpT?=
 =?utf-8?B?dFk3RzYrakZCUTRFb1NSOCtYS0czNUE0WHNwVmdoQ3lTTE1FeEs3b3QrQVE3?=
 =?utf-8?B?UkUrUFBhOG9qeXhUaUFSQjlXRUF5WWNSa3pNbjhHN0p6ZVozeUsxSEVrcmw3?=
 =?utf-8?B?TDBmbmFDTTBvYzBEZStpekR0UkZjQmVQZjJxOCtXWEU5UUdXaXhkZ244Z1ky?=
 =?utf-8?B?L1IyK0h6L3krbTk1QmlxbGRaYkREWnd5WjdIZFByTVFqazZGa0NQQ2lWdGRy?=
 =?utf-8?B?RGRROWxJOVFNb3FHbiszYjBkS241K0dTYXR1akRDNkRCTmxNbFhkUDhhZzE4?=
 =?utf-8?B?ZXZhSE53NnRrczhSb1hMTW1Mb2dnRnprdWJlM0J1QU5KbDE1cUxCdFlYQTBz?=
 =?utf-8?B?amh0Zi9jWWNmdHJIV1FUTEI0RUtVbzVwWTVxZUNzUXNBZ3BOWW9vcmhlb3ZR?=
 =?utf-8?B?dkRWTE1JcWJyZXFUd0VQRzdNSmpTMFQ4QmJLYk9jQi8vNWtFeElvSlBOcFBH?=
 =?utf-8?B?clhoNUFmdnYwUWk0Mlp0N0Y5Vnd4ZWFoTElvUU5SOE9IUmxOLzF3VnluQkhs?=
 =?utf-8?B?RktoZkJZb3B6RmJ2d2c1NFJUWnI0SzZ4TWU5aDdQRk1ydTBWV3N1Vm9aOEdr?=
 =?utf-8?B?d1FtNXRsRXBkdTVKWm11Z2QyOHRQV2dibGsybDlLRkVzNTBBejJGdU1kSFoy?=
 =?utf-8?B?VGhTMWc3alBLVTZ2eWlJMXFEbHF6dVQ3T3lDeUFnekRmSlFvZUhkU3YrUUU1?=
 =?utf-8?B?UExsd3NLVzBJNk10VnRmWEpSOUdiMzcxemI4QzMyVVVRU3ZwV1NJRDkvcmxo?=
 =?utf-8?B?QjIrVDJ5ekNNemI5MlM2aDhjcEp3TE1yR1M1N3ljYkJtZEd2bjg4QzhnekJy?=
 =?utf-8?B?RzNyQzM4QW5BaGhQWGhWOHN5c0hTQTJjdWdsa0UzcE50ZHpSVXcwVGNBTXZU?=
 =?utf-8?B?NllCc3dSVXVXL2l6dUwzNUlyejNHTlQvdGhQcG13NTFsVkdXeTJCSU43R2VG?=
 =?utf-8?B?WVR1SlNOSTZTZFh3L01lTHpxSk03dENPRVZMSUQweE11aEtPRThxV2loMFpP?=
 =?utf-8?B?Qm10dXVST0dXWnhydmx5cUZFSTFjcERvbkVNLzBJam1nUGZFU3FlcFovMytC?=
 =?utf-8?B?Y1FpN2Y3R3hpMGlUUkU3NGU3emxrUHE3ZExGUlRwdFA4bGZkV052bHM3dnNG?=
 =?utf-8?B?L2J6WkI1MlUvVDNBUTZVSUptb25WRFBJTXFvcGc3THlSL1hzM1l0VWRCM3VG?=
 =?utf-8?B?a2NPbTQySDd4Tjh1dFdJQWQ2KzBaQjFXVTJyRTMxaDd0MTMxOFlHR1FBNC9E?=
 =?utf-8?B?WTZXb3FSUXI2d2ZCQ21CSnFUWUhneUdxSC9lczdUWFFLQlNQcktwRXFXQ2Qx?=
 =?utf-8?B?bHpMenVVRTc5bzJSRk5QZ1pic2lieHlCamI3QWFlZWJpYUFkZi9YQktMUDZJ?=
 =?utf-8?B?aXNYUWVEdDZIWTRlNFltYVR6T1pFcEh3b2cxcDJ6ZG5vWkdwdnluVE9QVWJT?=
 =?utf-8?B?aWtEOUxVM2M3Vld2a1hXeC9SS3JXVEtFajk2dGpQd2dPMzBiNTNUYVcrekx6?=
 =?utf-8?B?NTNxMGtUTFFoOHFzcHlIcDA1ZGx1Q2VyRWlSQ1NuQ3VDZzN6dlF6R1ZLS2pw?=
 =?utf-8?B?NmVUeDgrY0J6OVBoT08vWHUxeTZRRUVtTmtzK2hINXExUU1BaDFObzlxRk9Q?=
 =?utf-8?B?SldoNG5Md3J1OXlVeEpReWVvcnJmRmFzb3ZRYUxDc05id2k3RER1QVZPUGk2?=
 =?utf-8?B?em56cTNBTVU3UmlHUGZSRkphZW5oZnVFQ1h6d0JpR2o3VWRwenpSMXNzTmNS?=
 =?utf-8?B?cW40dU5LNEt2U1NteDlyM3U2bGxNME9tVHYxRHhLWmZTbkp5M0dzUTlYU2tK?=
 =?utf-8?Q?+VSphmUy6kcl9UQ5roB0Dh24SRipDY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFBTSzh0NkpHOXBORlZQM1d6SHNCVUx3S0ZMUG9RdE1sY3ZwZ3hCc3RvRmVi?=
 =?utf-8?B?bXZtOFAyVXByNzNSQ0svNzRxb1JyOUhndmtCenArNkR4OGRLNlRnTHdycXN2?=
 =?utf-8?B?OWRnd3hOMjZoSFd5L3F3RXJrdllRSENmTzgrWGM1eDRHaWx2RDl5ZTB2OExn?=
 =?utf-8?B?RWlTZ1lGbEQxMndjcFFsNDd5RjZEeElyWlBnR2xJdTFOZVZOR2ZkWWdCUVJR?=
 =?utf-8?B?Z3YrTzJsSHVLajBwTUs2Y0lTQ3BjeTFGRHpVRDhwNSsyRUFoV1hUUWtvcEQ1?=
 =?utf-8?B?TVowZUxjRitnNk50bGxyQ1hEcGFhMHh6V3dqdU5sd291aTFKc3czdHRBSjlV?=
 =?utf-8?B?Sk1mbmU1djNDNS9ZQ2FzZm92bS82OUx3SU55bFNjbFFEczZ3ditNeVVCSjNk?=
 =?utf-8?B?MDBOMmJwWVdTOTlXWjZOOW1vVHJjZmN3M2tVMW54OEV0akVITUUxL2tRRmRp?=
 =?utf-8?B?TVVWdUM0a0NjRmVVU0JUdEFXTDRJOXR6UDEyZW1ZUDgyQUVyUGJYc2NVTjZo?=
 =?utf-8?B?YWpnOHFEaDk0MzRvdjd3L3FacStPUlJEc0xUMnFOTS9vK0lPSTVIZGc3ak93?=
 =?utf-8?B?QjZ4dXM1RVlwRmpudStRMDcwQ1B4dkZCUUx4NkN5T2pUaS9vTlFwRXZXS0xp?=
 =?utf-8?B?Q0F5eVkwczZHNzVFQ2RRZXNZYThxZnJsMGR3eHg0Uk5GTG0wU3lIeStjZ0pV?=
 =?utf-8?B?dXo2cTdmWGcxbmZiRUlhZEh2dVMxUlN1c1hYTUsrNXVUYlpCNEE5VVNMNmdP?=
 =?utf-8?B?RXFyYmM4dmI5UGlyYXN5UHB5ZTBOUE1DaW41a3N0b0c5SW00MG1NRmpxZGFt?=
 =?utf-8?B?STJtdVlZSnZaaVhCMW5zSGRtZXBUNmZTbnY0aDJIdGowS2FhSzhYTG84c1N5?=
 =?utf-8?B?MmZpMkNMa01nRER5UkRyTkpIZy9HQmx0RS93S2NSTlFBR2JsV3Q5aTYwc3Vj?=
 =?utf-8?B?Qll3VjlyanJtMHZZeGdZbGFTUksrL0lZSmZFbVVZMTdLZGxLMXlhL0lwSkNn?=
 =?utf-8?B?YkJ1YVc0L2lMN0Y1Q3paTk04ODRFS1BRZ1NWRjBNVitqNjFMWFBTRmFyK29F?=
 =?utf-8?B?WW95UGFkbUx4WktWQUVzOFpsbkZWaGxiNFBlVFBpdXpHS0NhL1B2aXZKK1U2?=
 =?utf-8?B?L1ZpVCtvRWI4aDVBVkZFZ29HVVBPWmM5TWlDSXJZZVRTTGtZU2NQTEV6ejJX?=
 =?utf-8?B?S3h4N0JlRE5EUEwwcXVjMWExaVRkaWovOG9xRmlmNkF3aW9zOTBGbmp0bExH?=
 =?utf-8?B?Z0drd01EK3FveWtSK253YVNnWk83YjByT0FQWUE3Q2J3VzQ2Q0FPaGJBTG1J?=
 =?utf-8?B?emxxYWx5OEZ6cEpJOXZIVDB5Lyt4Tkx0WHVha09rd2JrV0hORVhHMWJ1RUpL?=
 =?utf-8?B?TFZPcDg2dWJhbTRQZ2w0YVNCdGVPSEpiZjJabHc4L1hPVFlzeDVlRjNVNVZT?=
 =?utf-8?B?cHUrVWF0WERmMkFhbVdtRTJES2tEZ3YwZlZwTmJZOVZDenpOR2NQT2hSZWNG?=
 =?utf-8?B?TnpOUFFjeXJrRmFNSW1xb3lDQjhRWWQrVDBYV3hvTVh3WWppaSs4VVBQTHBu?=
 =?utf-8?B?SXU1OFUvV0pjSGR6T1I2R3hVTDRpSU1KUVg3V3NhNWErSXpUdzFReHRVREM0?=
 =?utf-8?B?YU1wZ2RscVBsbDZzdnN3TFVXUzl3SW5TSHJvUzl6eVlpdDUydTN1RGRzT20w?=
 =?utf-8?B?VlhyazZzdkhJbzg1ejlFN0owMjlKblZxYVJUZnB0WnA5ZDV2MUdTbElXeno4?=
 =?utf-8?B?WDFMV0hQQmh0SjZqUzhyMVJZeU13cWRPQjVVNXNpYm92eE9XQkZnc3RNVTgw?=
 =?utf-8?B?UTVDVzhyb0Fsb0NLZ1pGdVMyWUV0by9zWmlHU0F0WE1zZjZuSXMzRTB4YkFC?=
 =?utf-8?B?SG1zNlh5Y0J3cm41K05Vb0pQK2VJQXUyMHVmNEVTTlRidFJ2TXc4QityMWZl?=
 =?utf-8?B?ODJ1OGFocDZDK3lMS1FkTVdMWUsyeWRRZG5lbFRuMnhEWjJac0tVSUc4M3d5?=
 =?utf-8?B?WFJLMTE5NVMxOUFzMnRhZGc5ZzA2WVlRTWhjZFVIaldYK0dWWDFSZDlXZjdv?=
 =?utf-8?B?U1RrUUZnY1NzRExoS0Q4dkVFRHZMNllsSDJ4Q2dSUzhzUzNEUWhieGRuOGsz?=
 =?utf-8?Q?U8t+C86tDWFaKP49zmCafOqo8?=
Content-ID: <3450513CE626584D97668B804CAFD893@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc80589-c6f0-469c-fa23-08ddb51a74dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 01:32:19.0531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEGi1V7kEmb/3ug/gFW1bFFrNJvP5XgOp7QI9rFSu2fpApb4MXcjqkTuur/pPapMTOVxCxAe1k+CMdFOug3jlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFA66B8D345
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1789813129.150154300"
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

--__=_Part_Boundary_008_1789813129.150154300
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTA2LTI1IGF0IDE0OjQ5IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiBXZWQsIDIwMjUtMDYtMjUgYXQgMTc6NTQgKzA4MDAs
IExpYW5rdW4gWWFuZyB3cm90ZToNCj4gPiBCeSBhZGp1c3RpbmcgdGhlIG9yZGVyIG9mIGxpbmsg
dHJhaW5pbmcgYW5kIHJlbG9jYXRpbmcgaXQgdG8gSFBELA0KPiA+IGxpbmsgdHJhaW5pbmcgY2Fu
IGlkZW50aWZ5IHRoZSB1c2FiaWxpdHkgb2YgZWFjaCBsYW5lIGluIHRoZSBjdXJyZW50DQo+ID4g
bGluay4NCj4gPiANCj4gPiBJdCBhbHNvIHN1cHBvcnRzIGhhbmRsaW5nIHNpZ25hbCBpbnN0YWJp
bGl0eSBhbmQgd2Vha25lc3MgZHVlIHRvDQo+ID4gZW52aXJvbm1lbnRhbCBpc3N1ZXMsIGVuYWJs
aW5nIHRoZSBhY3F1aXNpdGlvbiBvZiBhIHN0YWJsZSBiYW5kd2lkdGgNCj4gPiBmb3IgdGhlIGN1
cnJlbnQgbGluay4gU3Vic2VxdWVudGx5LCBEUCB3b3JrIGNhbiBwcm9jZWVkIGJhc2VkIG9uDQo+
ID4gdGhlIGFjdHVhbCBtYXhpbXVtIGJhbmR3aWR0aC4NCj4gPiANCj4gPiBJdCBzaG91bGQgdHJh
aW5pbmcgaW4gdGhlIGhwZCBldmVudCB0aHJlYWQuDQo+ID4gQ2hlY2sgdGhlIG1vZGUgd2l0aCBs
YW5lIGNvdW50IGFuZCBsaW5rIHJhdGUgb2YgdHJhaW5pbmcuDQo+ID4gDQo+ID4gSWYgd2UncmUg
ZURQIGFuZCBjYXBhYmlsaXRpZXMgd2VyZSBhbHJlYWR5IHBhcnNlZCB3ZSBjYW4gc2tpcA0KPiA+
IHJlYWRpbmcgYWdhaW4gYmVjYXVzZSBlRFAgcGFuZWxzIGFyZW4ndCBob3RwbHVnZ2FibGUgaGVu
Y2UgdGhlDQo+ID4gY2FwcyBhbmQgdHJhaW5pbmcgaW5mb3JtYXRpb24gd29uJ3QgZXZlciBjaGFu
Z2UgaW4gYSBib290IGxpZmUNCj4gPiANCj4gPiBUaGVyZWZvcmUsIGJyaWRnZSB0eXBlYyBqdWRn
bWVudCBpcyByZXF1aXJlZCBmb3IgZWRwIHRyYWluaW5nIGluDQo+ID4gYXRvbWljX2VuYWJsZSBm
dW5jdGlvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFua3VuIFlhbmcgPGxpYW5rdW4u
eWFuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlIGluIFY0Og0KPiA+IC0gVGVz
dGVkIHRoZSBpbnRlcm5hbCBlRFAgZGlzcGxheSBvbiBNVDgxOTUgVG9tYXRvIGFuZCBpdCBpcyBm
aW5lLg0KPiA+IFBlciBzdWdnZXN0aW9uIGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gPiBo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjUwMzE4MTQwMjM2LjEzNjUwLTItbGlhbmt1
bi55YW5nQG1lZGlhdGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFnMElpMlVhVDlXdTFGa3Rv
R25lRzRnSFZfendJQXdjcUVpaEVBMFc0WEhLT1cydnY3aTVNTGxla0ZCOUFiYkJKdldLdmJ5YWlR
RmtGLUpwUGNxMCQNCj4gDQo+IEhpLA0KPiANCj4gSSB0ZXN0ZWQgdGhpcyBwYXRjaCBvbiBNVDgx
OTUgVG9tYXRvLCBvbiB0b3Agb2YgbmV4dC0yMDI1MDYyNS4gSW5kZWVkDQo+IHRoZSBpbnRlcm5h
bCBlRFAgZGlzcGxheSBpcyB1bmFmZmVjdGVkIGJ5IHRoaXMgY29tbWl0OiBpdCBzdGlsbCB3b3Jr
cw0KPiBmaW5lLg0KPiANCj4gVGhlIGV4dGVybmFsIGRpc3BsYXlzIHRob3VnaCBub3Qgc28gbXVj
aC4gSSB0ZXN0ZWQgMyBkaWZmZXJlbnQNCj4gZGlzcGxheXMsIHVzaW5nIDIgZGlmZmVyZW50IFVT
QkMtdG8tSERNSSBhZGFwdGVycywgYW5kIGluIGFsbCBjYXNlcyB0aGUNCj4gYmVoYXZpb3Igd2Fz
IHRoZSBzYW1lOg0KPiAtIEJlZm9yZSB0aGUgcGF0Y2gsIHRoZSBpbWFnZSBvbiB0aGUgZGlzcGxh
eSBpcyBjb21wbGV0ZWx5IGNvcnJ1cHRlZA0KPiBhbmQgdW51c2FibGUuIFRoZSBvbmx5IGRpc2Nl
cm5pYmxlIGVsZW1lbnQgb24gdGhlIGRpc3BsYXkgaXMgdGhlIG1vdXNlDQo+IGN1cnNvciwgd2hp
Y2ggc2hvd3MgcGVyZmVjdGx5IGZpbmUuIE9jY2FzaW9uYWxseSBubyBpbWFnZSB3aWxsIGJlIHNo
b3duDQo+IGF0IGFsbCwgYnV0IG1vc3Qgb2YgdGhlIHRpbWVzLCB0aGUgYmVoYXZpb3IgaXMgYXMg
ZGVzY3JpYmVkLg0KPiAtIEFmdGVyIHRoZSBwYXRjaCwgbm90aGluZyBldmVyIHNob3dzIGF0IGFs
bCBvbiB0aGUgZGlzcGxheS4gSXQgaXMNCj4gYWx3YXlzIGJsYWNrLg0KPiANCj4gU28gd2hpbGUg
dGhlIGV4dGVybmFsIGRpc3BsYXkgc3VwcG9ydCBvbiBUb21hdG8gaXMgYmFzaWNhbGx5IGJyb2tl
biBhcw0KPiBvZiB0aGUgbGF0ZXN0IG5leHQsIHRoaXMgcGF0Y2ggc2VlbXMgdG8gcmVncmVzcyB0
aGUgc3VwcG9ydCBldmVuDQo+IGZ1cnRoZXIuDQoNCkhpLCBOaWNvbGFzOg0KDQpIYXZlIGV4dGVy
bmFsIGRpc3BsYXkgd29ya2VkIG5vcm1hbGx5IGluIHByZXZpb3VzIHZlcnNpb24/DQpJZiBubywg
SSB0aGluayB0aGlzIHBhdGNoIGp1c3QgbGV0IGV4dGVybmFsIGRpc3BsYXkgY2hhbmdlIGZyb20g
b25lIGJhZCBzdGF0ZSB0byBhbm90aGVyIGJhZCBzdGF0ZS4NCklmIHllcywgSSB0aGluayB3ZSBz
aG91bGQgZml4IHRoaXMgcHJvYmxlbSBmaXJzdCwgYW5kIHRoZW4gYXBwbHkgdGhpcyBwYXRjaCB0
byB0ZXN0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gLS0NCj4gVGhhbmtzLA0KPiANCj4gTsOt
Y29sYXMNCg0K

--__=_Part_Boundary_008_1789813129.150154300
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDYtMjUmIzMyO2F0
JiMzMjsxNDo0OSYjMzI7LTA0MDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7
OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMz
MjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVy
aWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtXZWQsJiMzMjsyMDI1LTA2LTI1JiMz
MjthdCYjMzI7MTc6NTQmIzMyOyswODAwLCYjMzI7TGlhbmt1biYjMzI7WWFuZyYjMzI7d3JvdGU6
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtCeSYjMzI7YWRqdXN0aW5nJiMzMjt0aGUmIzMyO29yZGVyJiMz
MjtvZiYjMzI7bGluayYjMzI7dHJhaW5pbmcmIzMyO2FuZCYjMzI7cmVsb2NhdGluZyYjMzI7aXQm
IzMyO3RvJiMzMjtIUEQsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtsaW5rJiMzMjt0cmFpbmluZyYjMzI7
Y2FuJiMzMjtpZGVudGlmeSYjMzI7dGhlJiMzMjt1c2FiaWxpdHkmIzMyO29mJiMzMjtlYWNoJiMz
MjtsYW5lJiMzMjtpbiYjMzI7dGhlJiMzMjtjdXJyZW50DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtsaW5r
Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJdCYjMzI7YWxzbyYjMzI7
c3VwcG9ydHMmIzMyO2hhbmRsaW5nJiMzMjtzaWduYWwmIzMyO2luc3RhYmlsaXR5JiMzMjthbmQm
IzMyO3dlYWtuZXNzJiMzMjtkdWUmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtlbnZpcm9ubWVu
dGFsJiMzMjtpc3N1ZXMsJiMzMjtlbmFibGluZyYjMzI7dGhlJiMzMjthY3F1aXNpdGlvbiYjMzI7
b2YmIzMyO2EmIzMyO3N0YWJsZSYjMzI7YmFuZHdpZHRoDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtmb3Im
IzMyO3RoZSYjMzI7Y3VycmVudCYjMzI7bGluay4mIzMyO1N1YnNlcXVlbnRseSwmIzMyO0RQJiMz
Mjt3b3JrJiMzMjtjYW4mIzMyO3Byb2NlZWQmIzMyO2Jhc2VkJiMzMjtvbg0KJmd0OyYjMzI7Jmd0
OyYjMzI7dGhlJiMzMjthY3R1YWwmIzMyO21heGltdW0mIzMyO2JhbmR3aWR0aC4NCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SXQmIzMyO3Nob3VsZCYjMzI7dHJhaW5pbmcm
IzMyO2luJiMzMjt0aGUmIzMyO2hwZCYjMzI7ZXZlbnQmIzMyO3RocmVhZC4NCiZndDsmIzMyOyZn
dDsmIzMyO0NoZWNrJiMzMjt0aGUmIzMyO21vZGUmIzMyO3dpdGgmIzMyO2xhbmUmIzMyO2NvdW50
JiMzMjthbmQmIzMyO2xpbmsmIzMyO3JhdGUmIzMyO29mJiMzMjt0cmFpbmluZy4NCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SWYmIzMyO3dlJiMzOTtyZSYjMzI7ZURQJiMz
MjthbmQmIzMyO2NhcGFiaWxpdGllcyYjMzI7d2VyZSYjMzI7YWxyZWFkeSYjMzI7cGFyc2VkJiMz
Mjt3ZSYjMzI7Y2FuJiMzMjtza2lwDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyZWFkaW5nJiMzMjthZ2Fp
biYjMzI7YmVjYXVzZSYjMzI7ZURQJiMzMjtwYW5lbHMmIzMyO2FyZW4mIzM5O3QmIzMyO2hvdHBs
dWdnYWJsZSYjMzI7aGVuY2UmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Y2FwcyYjMzI7YW5k
JiMzMjt0cmFpbmluZyYjMzI7aW5mb3JtYXRpb24mIzMyO3dvbiYjMzk7dCYjMzI7ZXZlciYjMzI7
Y2hhbmdlJiMzMjtpbiYjMzI7YSYjMzI7Ym9vdCYjMzI7bGlmZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGVyZWZvcmUsJiMzMjticmlkZ2UmIzMyO3R5cGVjJiMzMjtq
dWRnbWVudCYjMzI7aXMmIzMyO3JlcXVpcmVkJiMzMjtmb3ImIzMyO2VkcCYjMzI7dHJhaW5pbmcm
IzMyO2luDQomZ3Q7JiMzMjsmZ3Q7JiMzMjthdG9taWNfZW5hYmxlJiMzMjtmdW5jdGlvbi4NCiZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0xp
YW5rdW4mIzMyO1lhbmcmIzMyOyZsdDtsaWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0
OyYjMzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDaGFuZ2UmIzMyO2luJiMzMjtW
NDoNCiZndDsmIzMyOyZndDsmIzMyOy0mIzMyO1Rlc3RlZCYjMzI7dGhlJiMzMjtpbnRlcm5hbCYj
MzI7ZURQJiMzMjtkaXNwbGF5JiMzMjtvbiYjMzI7TVQ4MTk1JiMzMjtUb21hdG8mIzMyO2FuZCYj
MzI7aXQmIzMyO2lzJiMzMjtmaW5lLg0KJmd0OyYjMzI7Jmd0OyYjMzI7UGVyJiMzMjtzdWdnZXN0
aW9uJiMzMjtmcm9tJiMzMjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjUwMzE4MTQwMjM2LjEzNjUw
LTItbGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFnMElpMlVh
VDlXdTFGa3RvR25lRzRnSFZfendJQXdjcUVpaEVBMFc0WEhLT1cydnY3aTVNTGxla0ZCOUFiYkJK
dldLdmJ5YWlRRmtGLUpwUGNxMCYjMzY7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0hpLA0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtJJiMzMjt0ZXN0ZWQmIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjtvbiYjMzI7
TVQ4MTk1JiMzMjtUb21hdG8sJiMzMjtvbiYjMzI7dG9wJiMzMjtvZiYjMzI7bmV4dC0yMDI1MDYy
NS4mIzMyO0luZGVlZA0KJmd0OyYjMzI7dGhlJiMzMjtpbnRlcm5hbCYjMzI7ZURQJiMzMjtkaXNw
bGF5JiMzMjtpcyYjMzI7dW5hZmZlY3RlZCYjMzI7YnkmIzMyO3RoaXMmIzMyO2NvbW1pdDomIzMy
O2l0JiMzMjtzdGlsbCYjMzI7d29ya3MNCiZndDsmIzMyO2ZpbmUuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1RoZSYjMzI7ZXh0ZXJuYWwmIzMyO2Rpc3BsYXlzJiMzMjt0aG91Z2gmIzMyO25vdCYjMzI7
c28mIzMyO211Y2guJiMzMjtJJiMzMjt0ZXN0ZWQmIzMyOzMmIzMyO2RpZmZlcmVudA0KJmd0OyYj
MzI7ZGlzcGxheXMsJiMzMjt1c2luZyYjMzI7MiYjMzI7ZGlmZmVyZW50JiMzMjtVU0JDLXRvLUhE
TUkmIzMyO2FkYXB0ZXJzLCYjMzI7YW5kJiMzMjtpbiYjMzI7YWxsJiMzMjtjYXNlcyYjMzI7dGhl
DQomZ3Q7JiMzMjtiZWhhdmlvciYjMzI7d2FzJiMzMjt0aGUmIzMyO3NhbWU6DQomZ3Q7JiMzMjst
JiMzMjtCZWZvcmUmIzMyO3RoZSYjMzI7cGF0Y2gsJiMzMjt0aGUmIzMyO2ltYWdlJiMzMjtvbiYj
MzI7dGhlJiMzMjtkaXNwbGF5JiMzMjtpcyYjMzI7Y29tcGxldGVseSYjMzI7Y29ycnVwdGVkDQom
Z3Q7JiMzMjthbmQmIzMyO3VudXNhYmxlLiYjMzI7VGhlJiMzMjtvbmx5JiMzMjtkaXNjZXJuaWJs
ZSYjMzI7ZWxlbWVudCYjMzI7b24mIzMyO3RoZSYjMzI7ZGlzcGxheSYjMzI7aXMmIzMyO3RoZSYj
MzI7bW91c2UNCiZndDsmIzMyO2N1cnNvciwmIzMyO3doaWNoJiMzMjtzaG93cyYjMzI7cGVyZmVj
dGx5JiMzMjtmaW5lLiYjMzI7T2NjYXNpb25hbGx5JiMzMjtubyYjMzI7aW1hZ2UmIzMyO3dpbGwm
IzMyO2JlJiMzMjtzaG93bg0KJmd0OyYjMzI7YXQmIzMyO2FsbCwmIzMyO2J1dCYjMzI7bW9zdCYj
MzI7b2YmIzMyO3RoZSYjMzI7dGltZXMsJiMzMjt0aGUmIzMyO2JlaGF2aW9yJiMzMjtpcyYjMzI7
YXMmIzMyO2Rlc2NyaWJlZC4NCiZndDsmIzMyOy0mIzMyO0FmdGVyJiMzMjt0aGUmIzMyO3BhdGNo
LCYjMzI7bm90aGluZyYjMzI7ZXZlciYjMzI7c2hvd3MmIzMyO2F0JiMzMjthbGwmIzMyO29uJiMz
Mjt0aGUmIzMyO2Rpc3BsYXkuJiMzMjtJdCYjMzI7aXMNCiZndDsmIzMyO2Fsd2F5cyYjMzI7Ymxh
Y2suDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NvJiMzMjt3aGlsZSYjMzI7dGhlJiMzMjtleHRlcm5h
bCYjMzI7ZGlzcGxheSYjMzI7c3VwcG9ydCYjMzI7b24mIzMyO1RvbWF0byYjMzI7aXMmIzMyO2Jh
c2ljYWxseSYjMzI7YnJva2VuJiMzMjthcw0KJmd0OyYjMzI7b2YmIzMyO3RoZSYjMzI7bGF0ZXN0
JiMzMjtuZXh0LCYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO3NlZW1zJiMzMjt0byYjMzI7cmVncmVz
cyYjMzI7dGhlJiMzMjtzdXBwb3J0JiMzMjtldmVuDQomZ3Q7JiMzMjtmdXJ0aGVyLg0KDQpIaSwm
IzMyO05pY29sYXM6DQoNCkhhdmUmIzMyO2V4dGVybmFsJiMzMjtkaXNwbGF5JiMzMjt3b3JrZWQm
IzMyO25vcm1hbGx5JiMzMjtpbiYjMzI7cHJldmlvdXMmIzMyO3ZlcnNpb24mIzYzOw0KSWYmIzMy
O25vLCYjMzI7SSYjMzI7dGhpbmsmIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjtqdXN0JiMzMjtsZXQm
IzMyO2V4dGVybmFsJiMzMjtkaXNwbGF5JiMzMjtjaGFuZ2UmIzMyO2Zyb20mIzMyO29uZSYjMzI7
YmFkJiMzMjtzdGF0ZSYjMzI7dG8mIzMyO2Fub3RoZXImIzMyO2JhZCYjMzI7c3RhdGUuDQpJZiYj
MzI7eWVzLCYjMzI7SSYjMzI7dGhpbmsmIzMyO3dlJiMzMjtzaG91bGQmIzMyO2ZpeCYjMzI7dGhp
cyYjMzI7cHJvYmxlbSYjMzI7Zmlyc3QsJiMzMjthbmQmIzMyO3RoZW4mIzMyO2FwcGx5JiMzMjt0
aGlzJiMzMjtwYXRjaCYjMzI7dG8mIzMyO3Rlc3QuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMz
MjsNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjtUaGFua3MsDQomZ3Q7JiMzMjsNCiZndDsmIzMyO04m
IzIzNztjb2xhcw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1789813129.150154300--

