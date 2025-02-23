Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFECA42253
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D61D10E3FE;
	Mon, 24 Feb 2025 14:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mZcFt/WR";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="P4OjJKL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD67010E0B5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 17:50:24 +0000 (UTC)
X-UUID: a50c3aaef20e11efaae1fd9735fae912-20250224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5ln2CWSD4VpnKs0XbRkFRdYFGzXZh5xDc23qABgil08=; 
 b=mZcFt/WRGh1wyJlB+QWNSF3gatZKYkPDJz7ABo5q/6uoQRymWrt+gKbCjWvY5tClutS0W21pUhhN3X+pGbJYD47yxon+T9MpFwvhvd/6/hp4DZD2A84KFRBcK3hMfdDIuQytCR2jK2NxMxVmzUA2KEw8SPTqOgea7cqcUeBEMoc=;
X-CID-CACHE: Type:Local,Time:202502240149+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:33dc8290-f01b-402e-bc7c-e7e46c1ec4a9, IP:0,
 U
 RL:25,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:27
X-CID-META: VersionHash:60aa074, CLOUDID:889073a4-5c06-4e72-8298-91cabc9efadf,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a50c3aaef20e11efaae1fd9735fae912-20250224
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <sunny.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 387069118; Mon, 24 Feb 2025 01:50:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 24 Feb 2025 01:50:17 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 24 Feb 2025 01:50:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luuvI8ge4c1Zo5X40uiylOMK0b27mZp6VJ161BElnPykL+8Lsdupi/67b3HBNyE2Isy+WihzEUIvpL5d7VkhNnXkhCSGVfuOasCxoXdK58S8IDe41FXyUlbwnfICR2pI7OgJI3WTYG2KyP8SiC7QZuCQFbpJF8tIWPCXBnvZQtvQ6VL9JtJWzmr/INCsVZ8d5Kx/8lu01o8FmYRbN4GbYI5ALc0h4RzI7K5ZPoUeIA24a2M+bS698KKuX1fOja2lRF4wCwbs+q4FoQcJifzFGueFJY4Mlm+CJcv/rc/977Bd+V6LaT71z8hBV7/z6PBjBgLwQzopeTuQh4BU+O1BhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqtaVH7ek5gsGOlQMpJ1aNafbcx5bKCPXOmdb0bvl+k=;
 b=a3EVjNWR3peAG6F5sCgUu5rO5ElIU0ps9lcRMYoUatjfoSaYx881r0W60guO+VQI8RUx3PEQeu8BB6CVSyttJ+UU6CW1jMCFcVRBzlDCnmPObs+PmeD0qtCuCCJEN9hub8wbb9GwKP7eijM/krode0PGuB7PFqNIbR9ZZpeJeoLxCN2k/2mPwg8T702RssOOw7y8HZoVSfqLFISomCgFJzAZoqS1RWvQDvY0pi4+V53HOMijWHRsQzlZhIaAzTwKV6PvXpDS8HS8bLeXftq7ly/xJ0wEq7oNxFrSE5GrjaFZwRuioe6NHmWI6G09HeX2qo7IN7J3ui3vCAsqFH5E8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqtaVH7ek5gsGOlQMpJ1aNafbcx5bKCPXOmdb0bvl+k=;
 b=P4OjJKL8eR1VrUdgYP3WvaQ8biOFeO8e0r3BQHsE5e3W14AlT1TytnQRRbwJQFGaPb5KYpWyCQIDmkticpEpNxl8l5sSQ77LYcAKrkItegARoLdoJ0BjkMHTsiqW1UCx7YKvHLEbHbycToTgLAqva/3RK9XraKUCwJyude7hTto=
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com (2603:1096:405:1a::6)
 by TYZPR03MB8092.apcprd03.prod.outlook.com (2603:1096:400:464::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Sun, 23 Feb
 2025 17:50:15 +0000
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf]) by TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf%5]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 17:50:15 +0000
From: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "treapking@chromium.org" <treapking@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Topic: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Index: AQHbfDA5jLoxTxf3wkWDuIJMLNCq1bNLCoUAgAoz4gA=
Date: Sun, 23 Feb 2025 17:50:15 +0000
Message-ID: <982e72c0ae1681d3385e594c81c0b1a994e3e81d.camel@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <a70c23487f3b3458ad21a61a4b8d16f47b75438b.camel@mediatek.com>
In-Reply-To: <a70c23487f3b3458ad21a61a4b8d16f47b75438b.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB8330:EE_|TYZPR03MB8092:EE_
x-ms-office365-filtering-correlation-id: 2836c4c8-bc82-4914-628b-08dd54328741
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bk5SWWx6STdId3lWNHFGQ1JrTHE5ajcxM240d2xDa2t2UC9vRmJkQ0FFYWlL?=
 =?utf-8?B?TzhPemkvcHdtZ1NDN2cvR2liS1NubXlDTm8xZ2tWM2hacWNLanBqdUFQQ2Vq?=
 =?utf-8?B?Q3FZZzFSYjNUQ016eXZKQ2QxUG5UUWNPeE93U09zcnBHRXlJbEF4ckw2bXQz?=
 =?utf-8?B?cWlyMzFudHJSS050Y0ppRW9od1ZnNjIvRkpnQi9LREUvSXBVNHdEMnl6MFJ3?=
 =?utf-8?B?ZTRSdHNlNCtySXNqeFdrWkhyVHJJVHNHbDJPK2dtYVZ6bjJQM0k5QzBqNWhG?=
 =?utf-8?B?ZDg0YjBqM2hUQWVNaHBlTDJnZVhzbE96WEQzVHhZaHpVbGlIeVNvNWloVDRO?=
 =?utf-8?B?RzEyUXBPREdidnhYcWN0T2xhbVlLcmZSOCtTaU16d0tkVXl6bUV2clo4cjZk?=
 =?utf-8?B?T05mZTlYU3o0azZvRFNhZGJsV1U1ZHZjZEUrUzZUN3NJZm40Wkc3aVZJaXFX?=
 =?utf-8?B?MnRlcHJrVEYxdnFpSG5MWE5YS2NzVDQ4VjVkN3NUYy9nTk1nL20yMlJMMUxC?=
 =?utf-8?B?amlFdXhqOTNuV2VFYnlzdnZLNVBRR2UycUw3Q3ErR2JGb2VOWjlRYy9WT3Zi?=
 =?utf-8?B?WHAxcUsrOG1ld2J1VG5YMUd4alFWTmhITEhNVG5UOEY5MVFOcElVQ1A2eTlE?=
 =?utf-8?B?VnRsV2pZbHlNbHFKVUFYVkM3a2xxRk54MEUyTjdrWnRkcDU1ekRqN3RsaUto?=
 =?utf-8?B?RU1Oem9QVUV4bFEyS2lQeVB2RGpENyt1R2ZDV2hTYXdYTk9qUkNMM2draE11?=
 =?utf-8?B?VzZtWjhnQ29rK0dJZHhEV282Z20rQU85UTBJbnY0Q3NhSmgvdVo2TThqUWww?=
 =?utf-8?B?eGdaMVlHZEcrb0FUTjVPNkhra1A4UjRiMVBKVHplVkc0a3RzYUh6K01aelZl?=
 =?utf-8?B?UUh1Ti9ickV4Z0dyUGRidFo3UmdhL2xmd2t6OXlWajJkN3RyRmFoQzcyNjZn?=
 =?utf-8?B?YlJwZWVmSXpMODc1QWQ5Zms0b2NpWUROUmVRNFIxYmE2WkV4MVMwd1lSK1g3?=
 =?utf-8?B?R2FUVjNEdGlEdEo4N1lhSFcyemNpK1d1UTVCbGkvWHBtNG01dWxrajk2V3JI?=
 =?utf-8?B?WHNFZHphMWU2aVpKTjhLM1djdjE0dTVXM0hYTmVDa0xHOHlFZ1RSNll4WkVQ?=
 =?utf-8?B?VGNQOGtmL2J6OXcySzJGN0c1SVQ4aXNIa3B2QXQ5ZVAvWnNteUt0Zit2eVJR?=
 =?utf-8?B?RjkrYmxsd002dURCV2tmQmdPUjAxOHJibU9aOHpJZ0VsODl3Sm5CQTVtWkhL?=
 =?utf-8?B?NzFCbXZHRVBFell3cGQwelRodmxmQUIrazY4M0JDdG5XVFNtejQ4bU1yTnBq?=
 =?utf-8?B?bEpXblEwQ0k5MGpXNTBFOUZQUjFPaXl0WnJreVVxMkMxOTJKbXJOaWk2VFl5?=
 =?utf-8?B?MlorNndjVkRKbG0zQzlpRUt2S0cyNFVPSmxGVllaSWdwNjFsbE5kSzJMVlFu?=
 =?utf-8?B?NG5nME94d1IrOWwzNHRiZWVhTW9uNlhQQWFZTGxNMTJyVCtnS1o2TGs4bmJj?=
 =?utf-8?B?a2dKVDJmSTNOVzZ1b1MzYzlKczZEQ1hhejlrNG1CYm1Vd3JhU2kxdnZMN1lF?=
 =?utf-8?B?MnphdWl4TVUxVDhldE5xR0s5VHg2SVBZVCtZYXZSL295Z1RoUmovUHd4YlBJ?=
 =?utf-8?B?bXQwUkNjK1NuTnlKMnQvTnlSUTdQSXNVWmVhaVVzaDRZZ0pFczZNZEhUSTVw?=
 =?utf-8?B?bW82Y3g3d1RDSU41eG1HMTVFMXpNaTRrRWpRWklIbXA3Q0p2N2pDQ08xalZh?=
 =?utf-8?B?aDhTblUrM0dZbndtNWNZWDFuTUxYZkxJZ3M1SWlES0x0SkRLcDluMis5N1d4?=
 =?utf-8?B?TzdIVUdKK3dsZytxUVlFeDBjVkNzdXBMSzZhbUl3OXJEWTdjTmc4Q0tidDFt?=
 =?utf-8?B?alU3N203QTZocDd6Zy9WVk45MlB5bkpnK0lPN1ZHakZDWUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB8330.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXJKcFYzRTNrcHhZMXBndTMzdnJHcEM5UUFFRHNrYVVlc3VOaDExYTQ5Mnkr?=
 =?utf-8?B?TEl3TldQOWhVc2VxcENSaWtuclVIMWM0Y29yQ21sdkFZL1FlSGJlNE1nWE9j?=
 =?utf-8?B?TndZOFNDMjZ1NytPbTliQ3NZN3dmRExQeUkvRnV6L24vc085R25MYUlVQ0dr?=
 =?utf-8?B?Z3NCQmoya29Md0FMd21uMWlWSUI1S1N6eVJacXNEcyt3dTJPQTFkcmU0dFBU?=
 =?utf-8?B?ZGE1dFRSTEJQRzNzWmcwL251YW5vajViRm1CZTdaZ1ozU3g4UTNVUHZ0Q2hk?=
 =?utf-8?B?TnhUUDIrb3V6aWNXUmtObmYzdHI4dmdxQ0hzc2czeVJUN1FQK2R2Mi9qU0dz?=
 =?utf-8?B?SDJpYjNaS1dNUWk4RzdteklBeW95azRHOTd1bWxIaXVPMWozbWdLb1Q0cEp5?=
 =?utf-8?B?aUczSEd2YmhlWGdYb3BaRG1YQXZ3czRLamE5M2pZZVY1MVZWK01LaU5jaGgy?=
 =?utf-8?B?NFc1ZURocVdReVo0OThoQ1pFQk53cFMvWUhzT1pBcS9RMXp3Q2o1bjhqTlBy?=
 =?utf-8?B?Sld1dHpjSmxlSVkxb3RFai9rNXJaSlBJQXkrUFE4RXpmSllZaDVnZFZxL0tM?=
 =?utf-8?B?WFhOaGRVSzV5aFEwK04rSFdKYmRqb2YxekpNTWNtT0d5WnVHY1JEaGdrczdU?=
 =?utf-8?B?Q0pVWnJJSGd5N1QxRXJSM0RMS1ppb3FDbDM2MWY0WTNNU0trbUpFQnhLMVdE?=
 =?utf-8?B?amVBOS9FRHdYeEJoeWVFdmtmVkVoK3dCTjVlQXB2TW9DV1NjeEM1ZEVzaksz?=
 =?utf-8?B?K1o5RzhNRS9pUllkYkEyM0FTVGpSaXJiUjlQL21yazJUYUxwQVc1YkVRWUZN?=
 =?utf-8?B?dURlOXhrY3FuU1VsYXZER0NpSGN5NHF0ODh2UFF6TzVnRnpIKzJaQ3I0R09K?=
 =?utf-8?B?SzI4c3BHU1VQcDMyWVNVUVh2ck1PcTNRbnllczBlRmRxZC9YSmJQZ1V4OEJX?=
 =?utf-8?B?azVLZ2VWVmIzNmJnMHJXUytkZlVQZHgrR1hRTDBFQkExSE8xVWR4QjQzc3Q4?=
 =?utf-8?B?cEpLYVo1SlhoVnFHNG1nR2hWbjNGSFpvNHZBZFdnVU9md3IvUWxCcDdSRzdZ?=
 =?utf-8?B?eGF2TjNGOTdoSkxDRlI5ZXh2UVRUNm9kUnRGbDN4SnpncWxTTnZJQXJMY2Iy?=
 =?utf-8?B?aUtFcithOVpXUS9lNnhvRnhFdUMreTZMYWx0d2ppR2N0SHV2RWxOUWhQWjUr?=
 =?utf-8?B?dFhxTzRSa0VMY2cvWFVkaDgwNHBZaHZsY0h4WTRmM1B1dGpZRXI5N2M5bW1h?=
 =?utf-8?B?SVkxWjdIUTkrNk15WU1EMk85a05UZHNyUFJqcjlMZ0RwQjBIbW1iOVRWektL?=
 =?utf-8?B?UXBGVmw2dE1BVm9HS3lzTHRUbnpFZm9UcklXVnA4ZEp4R1ZlUEJvWFdnbTc0?=
 =?utf-8?B?bXdmeElCb0NsUnUwSEYvczcvUEQydEhSUGJ3Qjl4Qmk5OWVGOGRXaHlLU2Rq?=
 =?utf-8?B?V1R2cWJmTnBFbDBtZ2xCaGlsUmU4cWJUdlNObkdvYUpZQURBYmlLMEdBdUx5?=
 =?utf-8?B?K3ZMSm9zTFJZellhbjR3aFBuaHBsWEZwbzJNajFhdVBRN2s1NGhqS1ZpNFpy?=
 =?utf-8?B?YU9yWlRlRmp3MlVERVkxK1didlM1SFJtcFRlcHpPZm9EWTZleTNnRWt4NG1h?=
 =?utf-8?B?bmduaDFMVlV2RE1ldE5jVHFYeVdiNzdMVWx5MVE0Q3l1RXZFdHR6Zy9ZemE3?=
 =?utf-8?B?YjJKRHpJMGdQeWExYmJzdWtjeFQxa1lNMEJqZEVFaE1aeTNsVmFzK3lBMDRi?=
 =?utf-8?B?SzZhL24zWUtJS0pvWFcvdkpoTTBSWnQxMG96ak9LTjRUNWtjckRPdHAyR1ha?=
 =?utf-8?B?RHZHTkI3SlRCeWxtNkVhaDlNZEFCamhpOXlWU1VHbjZaVlNDaWhodE95aDc0?=
 =?utf-8?B?RE9RWDllUFY1OWFkRitGZHhYSHloNjZ6ZG13VXhReHlpYlVqaWk4WUk3VmU3?=
 =?utf-8?B?K2pmb1hpRWltU1Z2VkpvK2FmM2VVUDZ6eDhTemY2aVdmMmY2ZTZmVnllS0Rk?=
 =?utf-8?B?VzN0VDFxQXdOcnFyTzZuVXplZFU4Rk9oaGNiZFFRTktPb2hKL1ZNR2IxRlJM?=
 =?utf-8?B?ZEwyVnMxK2xqODR3OW85QktqM0UzMWx5UDN0bytVbW9yY2hQSEQ2ekcrVHE5?=
 =?utf-8?B?bWhNc0NCKzZjZHBraFpZVUxTZkgrcTZNeFhVUTA2Yms2YitkK1kwTEx3L1o4?=
 =?utf-8?B?SWc9PQ==?=
Content-ID: <BA03610962DB9E4D85DB86AE04E1E01B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB8330.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2836c4c8-bc82-4914-628b-08dd54328741
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2025 17:50:15.0473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qx+pAmFNWwJaQ5Xf0z9TJObYSTRGGeIvD6nY9mh77QmEstHlZs52QooNy0vnd65ZWAJ/QdcwJwXvO26I3Qg6eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8092
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1499114622.1718170288"
X-Mailman-Approved-At: Mon, 24 Feb 2025 14:05:04 +0000
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

--__=_Part_Boundary_005_1499114622.1718170288
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTAyLTE3IGF0IDA2OjAxICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVHVlLCAyMDI1LTAyLTExIGF0IDEwOjUyICswODAwLCBTdW5ueSBTaGVuIHdyb3Rl
Og0KPiA+IEFkZCBNRFAtUlNaIGhhcmR3YXJlIGRlc2NyaXB0aW9uIGZvciBNZWRpYVRlayBNVDgx
OTYgU29DDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU3VubnkgU2hlbiA8c3Vubnkuc2hlbkBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxtZHAtcnN6LnlhbWzCoMKgwqAgfCA0Ng0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiDC
oDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZHAtDQo+ID4gcnN6LnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxtZHAtDQo+ID4gcnN6LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gPiByc3oueWFtbA0KPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi42NjQyYjlhYTY1
MWENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAtDQo+ID4gcnN6Lnlh
bWwNCj4gPiBAQCAtMCwwICsxLDQ2IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0t
DQo+ID4gKyRpZDoNCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAtcnN6LnlhbWwq
X187SXchIUNUUk5LQTl3TWcwQVJidyFqbzktRXpuNUdSOHdmRENNWDcyenJycHhsTUVZYi01dzUy
VFlpbk5Xc1FsZnBpUGp3NVI5NjdKSVUwLTZXbkk1ZnZJVTctdjBJVmFSQUxCbFc0YUwkDQo+ID4g
wqANCj4gPiArJHNjaGVtYToNCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcw
QVJidyFqbzktRXpuNUdSOHdmRENNWDcyenJycHhsTUVZYi01dzUyVFlpbk5Xc1FsZnBpUGp3NVI5
NjdKSVUwLTZXbkk1ZnZJVTctdjBJVmFSQUlJTVc4VEokDQo+ID4gwqANCj4gPiArDQo+ID4gK3Rp
dGxlOiBNZWRpYVRlayBkaXNwbGF5IG11bHRpbWVkaWEgZGF0YSBwYXRoIHJlc2l6ZXINCj4gPiAr
DQo+ID4gK21haW50YWluZXJzOg0KPiA+ICvCoCAtIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPg0KPiA+ICvCoCAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICvCoCBNZWRpYVRlayBkaXNw
bGF5IG11bHRpbWVkaWEgZGF0YSBwYXRoIHJlc2l6ZXIsIG5hbWVseSBNRFAtUlNaLA0KPiA+ICvC
oCBjYW4gZG8gc2NhbGluZyB1cC9kb3duIHRvIHRoZSBwaWN0dXJlLg0KPiA+ICsNCj4gPiArcHJv
cGVydGllczoNCj4gPiArwqAgY29tcGF0aWJsZToNCj4gPiArwqDCoMKgIGNvbnN0OiBtZWRpYXRl
ayxtdDgxOTYtZGlzcC1tZHAtcnN6DQo+IA0KPiBSZWZlcmVuY2UgdG8gb3RoZXIgZGlzcGxheSBt
ZHAgZGV2aWNlIGNvbXBhdGlibGUsIHVzZQ0KPiANCj4gbWVkaWF0ZWssbXQ4MTk2LW1kcC1yc3oN
Cj4gDQo+IFJlZ2FyZHMsDQo+IENLDQoNCk9LLCB3aWxsIG1vZGlmeSB0aGlzDQoNCg0KPiANCj4g
PiArDQo+ID4gK8KgIHJlZzoNCj4gPiArwqDCoMKgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICvC
oCBjbG9ja3M6DQo+ID4gK8KgwqDCoCBpdGVtczoNCj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0
aW9uOiBNRFAtUlNaIENsb2NrDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArwqAgLSBjb21w
YXRpYmxlDQo+ID4gK8KgIC0gcmVnDQo+ID4gK8KgIC0gY2xvY2tzDQo+ID4gKw0KPiA+ICthZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICvCoCAt
IHwNCj4gPiArwqDCoMKgIHNvYyB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxz
ID0gPDI+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArDQo+
ID4gK8KgwqDCoMKgwqDCoMKgIGRpc3BfbWRwX3JzejA6IGRpc3AtbWRwLXJzejBAMzIxYTAwMDAg
ew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTk2LWRpc3AtbWRwLXJzeiI7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDAg
MHgzMjFhMDAwMCAwIDB4MTAwMD47DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tz
ID0gPCZkaXNwc3lzX2NvbmZpZ19jbGsgMTAxPjsNCj4gPiArwqDCoMKgwqDCoMKgwqAgfTsNCj4g
PiArwqDCoMKgIH07DQo+IA0KDQo=

--__=_Part_Boundary_005_1499114622.1718170288
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDItMTcmIzMyO2F0
JiMzMjswNjowMSYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtUdWUsJiMzMjsyMDI1LTAyLTEx
JiMzMjthdCYjMzI7MTA6NTImIzMyOyswODAwLCYjMzI7U3VubnkmIzMyO1NoZW4mIzMyO3dyb3Rl
Og0KJmd0OyYjMzI7Jmd0OyYjMzI7QWRkJiMzMjtNRFAtUlNaJiMzMjtoYXJkd2FyZSYjMzI7ZGVz
Y3JpcHRpb24mIzMyO2ZvciYjMzI7TWVkaWFUZWsmIzMyO01UODE5NiYjMzI7U29DDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTdW5ueSYj
MzI7U2hlbiYjMzI7Jmx0O3N1bm55LnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0
OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsuLi4vZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxtZHAtcnN6LnlhbWwmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3wmIzMyOzQ2DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrKysrKysrKysrKysrKysrKysrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2
MDsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NDYmIzMyO2luc2VydGlvbnMoKykNCiZndDsm
IzMyOyZndDsmIzMyOyYjMTYwO2NyZWF0ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZHAtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdA0KJmd0OyYjMzI7Jmd0OyYj
MzI7YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxtZHAtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0OyYj
MzI7Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxtZHAtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0OyYj
MzI7bmV3JiMzMjtmaWxlJiMzMjttb2RlJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyO2lu
ZGV4JiMzMjswMDAwMDAwMDAwMDAuLjY2NDJiOWFhNjUxYQ0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0t
JiMzMjsvZGV2L251bGwNCiZndDsmIzMyOyZndDsmIzMyOysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxtZHAtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0OyYjMzI7
QEAmIzMyOy0wLDAmIzMyOysxLDQ2JiMzMjtAQA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyMmIzMyO1NQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiYjMzI7KEdQTC0yLjAtb25seSYjMzI7T1ImIzMyO0JTRC0y
LUNsYXVzZSkNCiZndDsmIzMyOyZndDsmIzMyOyslWUFNTCYjMzI7MS4yDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrLS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzNjtpZDoNCiZndDsmIzMyOyZndDsmIzMy
O2h0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yc3oueWFtbCpfXztJdyEhQ1RSTktBOXdN
ZzBBUmJ3IWpvOS1Fem41R1I4d2ZEQ01YNzJ6cnJweGxNRVliLTV3NTJUWWluTldzUWxmcGlQanc1
Ujk2N0pJVTAtNlduSTVmdklVNy12MElWYVJBTEJsVzRhTCYjMzY7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzE2MDsNCiZndDsmIzMyOyZndDsmIzMyOysmIzM2O3NjaGVtYToNCiZndDsmIzMyOyZndDsm
IzMyO2h0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWpvOS1Fem41R1I4d2ZE
Q01YNzJ6cnJweGxNRVliLTV3NTJUWWluTldzUWxmcGlQanc1Ujk2N0pJVTAtNlduSTVmdklVNy12
MElWYVJBSUlNVzhUSiYjMzY7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsNCiZndDsmIzMyOyZn
dDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyt0aXRsZTomIzMyO01lZGlhVGVrJiMzMjtkaXNw
bGF5JiMzMjttdWx0aW1lZGlhJiMzMjtkYXRhJiMzMjtwYXRoJiMzMjtyZXNpemVyDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrbWFpbnRhaW5lcnM6DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrJiMxNjA7JiMzMjstJiMzMjtDaHVuLUt1YW5nJiMzMjtIdSYjMzI7Jmx0O2NodW5r
dWFuZy5odUBrZXJuZWwub3JnJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMzI7LSYj
MzI7UGhpbGlwcCYjMzI7WmFiZWwmIzMyOyZsdDtwLnphYmVsQHBlbmd1dHJvbml4LmRlJmd0Ow0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2Rlc2NyaXB0aW9uOiYjMzI7
fA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMzI7TWVkaWFUZWsmIzMyO2Rpc3BsYXkmIzMy
O211bHRpbWVkaWEmIzMyO2RhdGEmIzMyO3BhdGgmIzMyO3Jlc2l6ZXIsJiMzMjtuYW1lbHkmIzMy
O01EUC1SU1osDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMzMjtjYW4mIzMyO2RvJiMzMjtz
Y2FsaW5nJiMzMjt1cC9kb3duJiMzMjt0byYjMzI7dGhlJiMzMjtwaWN0dXJlLg0KJmd0OyYjMzI7
Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3Byb3BlcnRpZXM6DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrJiMxNjA7JiMzMjtjb21wYXRpYmxlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYj
MTYwOyYjMTYwOyYjMzI7Y29uc3Q6JiMzMjttZWRpYXRlayxtdDgxOTYtZGlzcC1tZHAtcnN6DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1JlZmVyZW5jZSYjMzI7dG8mIzMyO290aGVyJiMzMjtkaXNwbGF5
JiMzMjttZHAmIzMyO2RldmljZSYjMzI7Y29tcGF0aWJsZSwmIzMyO3VzZQ0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjttZWRpYXRlayxtdDgxOTYtbWRwLXJzeg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdh
cmRzLA0KJmd0OyYjMzI7Q0sNCg0KT0ssJiMzMjt3aWxsJiMzMjttb2RpZnkmIzMyO3RoaXMNCg0K
DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2
MDsmIzMyO3JlZzoNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO21h
eEl0ZW1zOiYjMzI7MQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYj
MTYwOyYjMzI7Y2xvY2tzOg0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYj
MzI7aXRlbXM6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMzMjstJiMzMjtkZXNjcmlwdGlvbjomIzMyO01EUC1SU1omIzMyO0Nsb2NrDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmVxdWlyZWQ6DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrJiMxNjA7JiMzMjstJiMzMjtjb21wYXRpYmxlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMx
NjA7JiMzMjstJiMzMjtyZWcNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzMyOy0mIzMyO2Ns
b2Nrcw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiYjMzI7ZmFsc2UNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsm
IzMyOytleGFtcGxlczoNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzMyOy0mIzMyO3wNCiZn
dDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3NvYyYjMzI7ew0KJmd0OyYj
MzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MzI7I2FkZHJlc3MtY2VsbHMmIzMyOz0mIzMyOyZsdDsyJmd0OzsNCiZndDsmIzMyOyZndDsmIzMy
OysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOyNzaXplLWNl
bGxzJiMzMjs9JiMzMjsmbHQ7MiZndDs7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtk
aXNwX21kcF9yc3owOiYjMzI7ZGlzcC1tZHAtcnN6MEAzMjFhMDAwMCYjMzI7ew0KJmd0OyYjMzI7
Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Y29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0
ZWssbXQ4MTk2LWRpc3AtbWRwLXJzeiZxdW90OzsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzMyO3JlZyYjMzI7PSYjMzI7Jmx0OzAmIzMyOzB4MzIxYTAwMDAmIzMyOzAmIzMyOzB4MTAw
MCZndDs7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtjbG9ja3MmIzMyOz0mIzMy
OyZsdDsmYW1wO2Rpc3BzeXNfY29uZmlnX2NsayYjMzI7MTAxJmd0OzsNCiZndDsmIzMyOyZndDsm
IzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO307DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMzMjt9Ow0KJmd0OyYjMzI7DQoN
Cg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJl
PioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioq
KioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNz
YWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHBy
b3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1
cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVk
IG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0
aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVj
aXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJ
ZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJl
bGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBl
LW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Ns
b3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5r
IHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1499114622.1718170288--

