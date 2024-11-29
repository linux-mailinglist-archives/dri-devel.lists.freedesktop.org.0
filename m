Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B89DBF4D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 06:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43C810E11D;
	Fri, 29 Nov 2024 05:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="hFMnJGeE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qg1vrveX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E53910E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:53:53 +0000 (UTC)
X-UUID: 4d4cf75eae1611efbd192953cf12861f-20241129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=C0r3wMDeqmXMjJh1cv0cKUJNMO5LzRLTLc0B2cZBvi8=; 
 b=hFMnJGeE9FTl8+ScrsqldOtPqGMOoP+nYedmxq4UhnmC0kgg5b6WpiVEY6XCkn3QUZqyyaE2MANkba5pfJfkPu1+SBVNgs8qqaAjlw8iTX8oChsmb7bCCppMXAllzbWsl6owVjevyPuZClMoLIzgNck0EfrtAD9vR3LiZdrL51o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:76966147-5ff9-4f0f-b817-329657310a97, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:289f76e0-1fe5-4c4a-bdf3-d07f9790da32,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4d4cf75eae1611efbd192953cf12861f-20241129
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1761609602; Fri, 29 Nov 2024 13:53:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Nov 2024 13:53:47 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Nov 2024 13:53:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3P6e8Ampdg4J+L2WOfyUUnk1iD577XG3ktGaE8i6jyUcH0RF0lUmSyJKnabvOCoK55rib9x3dDUn2BI0XXroIegXDsihVTMMFnWy9WvaLIXPH9xdu7aQcvWmRvgozwcugNq9D/QUYD0ldDUT/iDmv0lDbuNLn0H7R61IkZ+EwsxjjO0LmYh+QTpcMI8ux/8Asm9gDbYg92tHYsGPFRCMNgyd5Ltjf+8h7RBIFbo16tkOzsmBf5wDll1oHIodkQGxZ2Oodk5xjUT3CU42Gj1GURar+TvEbRvFhJzhgjtpfGriqU4lVPNX9Zp5tv2yn5rCFAH4AfqSf8TQVfpTT+uZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR1w5Uch+4QswIj33qEfHLraC7R4gmAKJ0MCUGSJiII=;
 b=vaqdMJZ39rEZNYcQzZEzX050RYK6OijkfG91+EuyAQ1rwJLPkWkaPJ6yx3qbYMOVz9nwNvLkpOjcBs3t+r5Nyqu8mVDcxehQEFshKL8HptGGP1i8sppx9uCVKcPnmovcnG3D+ugEU3yqFyoqx+nCJSEI7Ubx1YJqPg0dplxWKpYkwLM+Zx660HXiaGaI6I7pYiaur16hPVaKNywGS7vj97ty6ZTR4sKLh9FzKLy5yl3laEPVFh/g7Lm8J9FFII4aVKUNeiqThXjcT5sxycDtDW8SbkOTJxf2Q0kQndyvSNTY1eyo3tTQnBqfUZTx0iOUdbabKWjvAS9VJGIBj3rVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR1w5Uch+4QswIj33qEfHLraC7R4gmAKJ0MCUGSJiII=;
 b=qg1vrveX2KosCeaRPs+KBbMJf/9AfoVPa75sxXLFis30ghSGggu4TJh3fekAbBacjSYvdY7aESYGHX2STskKA4ql3Ai6F0I2FzD0dPt0S1E8KciTeg7oyurNUQG8BxNAEVQQ0ck1vENki4ONw8u+M0EDAUgiNbC2Xo+oh9pW2hw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8502.apcprd03.prod.outlook.com (2603:1096:604:27b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 29 Nov
 2024 05:53:45 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 05:53:44 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Topic: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Index: AQHbO0pF3Zp6UXdpSEmkHbI6wNkmT7LNz4QA
Date: Fri, 29 Nov 2024 05:53:44 +0000
Message-ID: <efd20d11b7eb88df78be23d111f08fe79cedc38c.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8502:EE_
x-ms-office365-filtering-correlation-id: da41beb8-4ef5-4a9e-30da-08dd103a2f9d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SlJ4ZXhQK3phUE5QaVREQis1RkVTYXFtei8zc3FoWUFZbWs4b2QwQ3dJeENt?=
 =?utf-8?B?OHE1NVo1dWxWVEtadTFNU3pRVFVXQ2hJeUNIdzBiU2JOTDRCb0puald6R3pC?=
 =?utf-8?B?blBiMmRHeDFNZmoyZ1dUTG5yQmpvT2FNM3NzNXl5bkNLbjNXNVNnR0pLVTRQ?=
 =?utf-8?B?S0ZaZWdNY1RNS0lkS1gybUp3Zk1VZWNjTGNOcnB6UnhEdElYV2JKblBMT0Ft?=
 =?utf-8?B?NDQzSmk4dml2azBLQ2hDanFOaDBTejQ0SHBFVWJHT3RMbTRVZ2Q5MVFNSG41?=
 =?utf-8?B?UmhkL3drV2hiL0Flb3dUbUxlWFlodGNmNUNub1JKV3lLMlQ0RE9xVGQ0SElR?=
 =?utf-8?B?VmsxNEdodkNPTTZldTE4V3B5a1VFQ0tuK25GZWNndHdzdCtsVFdlbnJ0NGxv?=
 =?utf-8?B?MzllWXNBbHpzY1RlTHFwK1ZtNEdHZy9DTTlhY25pOExWeVI4cCtsVlJibXIz?=
 =?utf-8?B?Y2UxSTBDUUd1WlFnSzZDNXFaWXpWaGlCSnBlYzRQV0NTZkI5TVBXWGMwc2FJ?=
 =?utf-8?B?ZXhVK0d0ekJ2eVU5L2pHVlpSQW1QcmlsWEkxM1dNcTM5WGtDTjFySTFqb1p1?=
 =?utf-8?B?MzhuRlpxNWZ1ek9WSStQVkxNeHpDZmhDbmtIajVLTkp1L1BqWFV0VWxLZG02?=
 =?utf-8?B?OHZrOEdrU3ZlU3d0cUpMYjRQYXdkY1BLeklsUnlCN2g1VU4vZVJFTVFMN3JB?=
 =?utf-8?B?ZjVtSjB3b0NxdEI2UzJ5YTh5LzJvN1k0NkpRNXZNdER1aGtuTHlibzdEQjkr?=
 =?utf-8?B?eU5ObTZ6ckZ1TVphVW0xMFpqZ1YvVjBKRkpscytobU80SUl6VXNibFlYNDQ3?=
 =?utf-8?B?aWtUNFNvM0lDTjA4bThkSEhwRWlaeEdZSDNyV21SV2RaZ20wUGcyWTRuZmJk?=
 =?utf-8?B?b1BUbm90V0xGMWYrWVNDd3R4emttVGxhZzYzeEV0ZkJsK2gwckFRMmJQc1VL?=
 =?utf-8?B?ZjBlRXNjdDZkVUxiMVVpU0IraUMyN3RIUGtMbmZZd3VBN3JGMFJFL3RNbllO?=
 =?utf-8?B?MGQzcWdyQmhDNWFpK2NWTGxzZEhIUWtWcEpUbnFFcVhrK1pyNEpnSU90MU4r?=
 =?utf-8?B?TDVBL3ZCYUhBRGFRdWdkcitvZzR6WG44RlVTYUhBeHY0WXVpYVpLcWNMWXFr?=
 =?utf-8?B?cEI1OU5xK1dWNEVER3I5VEMvZndGRG1odXpyZFpUYW9ubEtrWDA5TXRtVzMx?=
 =?utf-8?B?VC9BMktZYUw0TnZsck9JTG1PN2lSVVBqdEVxNGRhdjVOZmZhazRXMm1NaGRk?=
 =?utf-8?B?ai94b1lDa1hlVUdJNGlCQWplMUZyRkJneGJob0hHbERKSzROVHFVek40aEVa?=
 =?utf-8?B?VXBJSTlFQmI0WDBkNS8yNEdFYzFQdXNHRDZQNEFGeHRyeVhzc2hKVlMrU2Ez?=
 =?utf-8?B?bHM3VnN4VTd4S04wZlFQZ3FXVDFoT3lHYzNKZTcza2RoaUhDY1d1aW1ybTZG?=
 =?utf-8?B?a3VCa25VRDR5bUdQbTgxQjBpZGtCa1cybHFVNlFEeXJ4NjV5UnNLZjBlRTB0?=
 =?utf-8?B?aDQrakF3MFMzUnZLUDV4MWtobStjUmFBMDJVTXBHd29uZS9KTEtJOXRnQ0Rl?=
 =?utf-8?B?QU8zcXNrR1gzQlFDRXkvNjZoUVVqb3VPQ0xKQlRqd0dFNmxpcVZna2Rray9I?=
 =?utf-8?B?NmNQTFgvb0h6Nmx3Q3BvT21CUUFSUTRnSnN6YnRTTFM4ZXAxTU9mMTE1U2wv?=
 =?utf-8?B?N3pacDJqV3QxUi9kS3pndWROOUN1b3phV0d3aWdRUHVsZ1ZPVXdqbmluZDBT?=
 =?utf-8?B?VEx3eTlveWg5S29XWnFDRGc2dHJXTEcrNkJ5KzVDK1pSVWVXNEJhZFNlS09Q?=
 =?utf-8?B?b2JjZjE1RS9lbGtvK3RiWHhpQnBEQjBOb0VJa2tPaDNnREZaWmc2b1lRWVJo?=
 =?utf-8?B?Ync4RDZQSHdCTm11RkN2YkgrYnVmZFNmTzZkWkxWaHh6bFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzJ4TjZEVGxQS2RVWG8rVklYL0YrNWNxZENiSWJNbzFOVERNYTRsUUNuQzlr?=
 =?utf-8?B?eUxxMGg4c0l0Yk9YMURFZjh1alY3c0lyU25HRWpENHlSSGRVMXlvV2pZTTRP?=
 =?utf-8?B?V3FvaTlsSHpEcWNRY2VHWGxKakVRbER1eDQ4RVBmNWJPNUFsVUNlTlhFOEZs?=
 =?utf-8?B?NkpWVTVocW9JeHBzTlZwTy85Y0xQQnF4MFZQdnNQNFBONlpaVG5yL3djWmdH?=
 =?utf-8?B?K0ZMR21ibk9PVEx2dVNMTHFTQlprMC9rUjduY1hoTGpTeUhlTnV3L1dRRE1a?=
 =?utf-8?B?WGEwc3hibVNESVVDRndyZ1VGRURSR2tqdDFLOGcxbUhudjZKdDNGNGdGRVM0?=
 =?utf-8?B?NE9ieTNuTVZ5NjhudkZFd25oQ0hDQXNTb29qSENGZUVydmlqSkpXM0tUQy8v?=
 =?utf-8?B?SDhjeldpYW5iQVZzb2ZBdnpLVkU3SG1Id2xLZGlqaEdabVFwWUYxbmR1RVhI?=
 =?utf-8?B?b2NiYzMxa0VnQUVXZXBUUS9xOTJpVlFXcUJtdXFEd2JuQ3JyckRwYlorUi9V?=
 =?utf-8?B?L3c1U3B1SmFxZVllWGF6dFhsL3BMNXhHMExseSsrdW9GSWtSeDdFZzFKV0tT?=
 =?utf-8?B?Q292WW5FclZxcEtLbE14WFpuc2lLZlAvdXFZTU91Qm5ENXNkaW8vc1JaREVY?=
 =?utf-8?B?SjVQN2J2RlFXcHZiNnYxMHIzV3dOVW9iRlZuWFNVMzRYNVBIbTVpcTAvSjFJ?=
 =?utf-8?B?b0ZTME5wWnFOMHB6Zk50L3dtQnFrTm1NQTFRV2pjcjhITld4RGwvZFlwSWVs?=
 =?utf-8?B?TE53UExpVW9XaGtUMm9tV3A1Y0dZalJLeEZWM2ZqR1pyeVI1Slp3M3piRXRn?=
 =?utf-8?B?akkzL1NFWDBxVjd1RFIvU2haWlFNbnpxSUQ4MnA3REd1elFoTS9wdTBJb1VQ?=
 =?utf-8?B?YTFBK3J0UDdBU3Y1Y2lvTnFTZkwydld5NEFHV1pCTm90VWIxN3I5MlBuYWFt?=
 =?utf-8?B?NTZ2M01GR3MrSkdtcEh1UnJzMloyZm1GYTZnZVQydVNzcG82OWVTSzJmV1lQ?=
 =?utf-8?B?YmFnL2lNWmN5TUt1RlJIOVgvTEl3a2hYQ1BVenpaVlJoVGF4WjRmU0hXRHhy?=
 =?utf-8?B?RUlTTVc1ZmRvYWU0SmNQelVEWUpHVngrREJ2RWJ3NmMvTW1OZEQ3MnVHdG1J?=
 =?utf-8?B?RURNUmNlQ2kyN01ScVdvcEFxTFo0RlJkTHpLZURqMER2U2pNeFdaR1hwUjFk?=
 =?utf-8?B?VHk2YzI4S0hGVW1wQnN6U1Mva3VTQW5ldWoydFdGRmRBQmVHOHNLK21CUHdR?=
 =?utf-8?B?bllwdzZjOG0zeWt2a1BlOVhVQzFHcE9PekMrREl0SzJCN0JyanA1akN3b2lU?=
 =?utf-8?B?YlB3UmNKK21qU0FCcTdPNnZkMUtBSS9IN25zVWlDRjJyNElwUVc0c1FIK1dP?=
 =?utf-8?B?cGJpY0QrenFBVytsL1pDb3dyUHhjdzdYa2ZjSWNKUVZrbk8vdXBpZXQ2cTcw?=
 =?utf-8?B?a3ZEVjUwSEJDUmdDd1lodU10UmNyM2F6SUhQVjdyTGdFMmpsZVYyS3BDS3Ns?=
 =?utf-8?B?SXlHUC9Mcjl3anROdkRKUjFzYnZsU3RMbVNhZXZhQjFKYXhRQytKK1lJbXpF?=
 =?utf-8?B?YUNEL0lJTjBCQ0k5M2YyUDFNUldTV3BxL3hKSmxPL0d1K213Z3hxUUhOeE1p?=
 =?utf-8?B?bW50N09Ja0VrSWRuZ0E3Y1htaTJWNk9Kem5JMmJGRlRiYWJGSUVYL2lUbkxN?=
 =?utf-8?B?M2JENGRMeWVxUTdRREwrZGhVa3U4Qjc1SWduZ1h1WjE1S040a3JEYmRsTnpr?=
 =?utf-8?B?M1pHZWJBL0FqK2k1ZktmM05Sa1hzVThoc2RVcjdvdi9TODJFVC9nM1RmRmc5?=
 =?utf-8?B?eXZJM0l6NmVBQ0V5THpzOVJSbnNwTnB1ZC9qK1RnZ09pSXpTUm44clZMakRk?=
 =?utf-8?B?Mnk1WUg2b2N3anBBSm8xYUF5RUtVazhCVkY0TUlQWWhUQjYzMHhaekVzTHhz?=
 =?utf-8?B?WmNnbzlYSnU2dGxrUFV5UUZZS3VjbjlkU1ZzMzlsclZhZUxROWRuM1JuYm10?=
 =?utf-8?B?SFcySGpRcnkwTHF6U29iT3NBZWdMRlE1ZS9PYnZyUHYzUHZRY0ppM0VGQi9K?=
 =?utf-8?B?MFRPUEtqcmFmcmtZRzNOdTFDV2VxNkpUL0ZNQ0FXdUFLdXhOSEVONkVpRGhn?=
 =?utf-8?Q?dod4vVTioLS4CqTiCP77/klg3?=
Content-ID: <4E70C9C64EECEA45BAB176E3816BD35B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da41beb8-4ef5-4a9e-30da-08dd103a2f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 05:53:44.8867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnxcVynIhVdLj5k+9CiBx/Iu5+trz7IwczRBQYJpg5jkZik+RBM2clOOq/G+iFdyT4w44g++5P4NE99oyWFW/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8502
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_672208033.1347707699"
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

--__=_Part_Boundary_007_672208033.1347707699
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIG5ld2VyIEhETUktVFggKEVuY29kZXIpIHYyIGFuZCBEREMgdjIgSVBzDQo+IGZvdW5kIGlu
IE1lZGlhVGVrJ3MgTVQ4MTk1LCBNVDgxODggU29DIGFuZCB0aGVpciB2YXJpYW50cywgYW5kDQo+
IGluY2x1ZGluZyBzdXBwb3J0IGZvciBkaXNwbGF5IG1vZGVzIHVwIHRvIDRrNjAgYW5kIGZvciBI
RE1JDQo+IEF1ZGlvLCBhcyBwZXIgdGhlIEhETUkgMi4wIHNwZWMuDQo+IA0KPiBIRENQIGFuZCBD
RUMgZnVuY3Rpb25hbGl0aWVzIGFyZSBhbHNvIHN1cHBvcnRlZCBieSB0aGlzIGhhcmR3YXJlLA0K
PiBidXQgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGlzIGNvbW1pdC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGludCBtdGtfaGRt
aV92Ml9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArICAgICAg
IHN0cnVjdCBtdGtfaGRtaSAqaGRtaTsNCj4gKyAgICAgICBpbnQgcmV0Ow0KPiArDQo+ICsgICAg
ICAgaGRtaSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmhkbWkpLCBHRlBfS0VS
TkVMKTsNCg0KQm90aCB2MSBhbmQgdjIgaGFzIHRoaXMgYWxsb2NhdGlvbiwgc28gbWFrZSBpdCBh
cyBjb21tb24gY29kZS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICAgICBpZiAoIWhkbWkpDQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArICAgICAgIHJldCA9IG10
a19oZG1pX2NvbW1vbl9wcm9iZShwZGV2LCBoZG1pKTsNCj4gKyAgICAgICBpZiAocmV0KQ0KPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gKw0KPiArICAgICAgIGhkbWktPmhwZCA9IEhE
TUlfUExVR19PVVQ7DQo+ICsNCj4gKyAgICAgICAvKg0KPiArICAgICAgICAqIERpc2FibGUgYWxs
IEhXIGludGVycnVwdHMgYXQgcHJvYmUgc3RhZ2UgYW5kIGluc3RhbGwgdGhlIElTUg0KPiArICAg
ICAgICAqIGJ1dCBrZWVwIGl0IGRpc2FibGVkLCBhcyB0aGUgcmVzdCBvZiB0aGUgaW50ZXJydXB0
cyBzZXR1cCBpcw0KPiArICAgICAgICAqIGRvbmUgaW4gdGhlIC5icmlkZ2VfYXR0YWNoKCkgY2Fs
bGJhY2ssIHdoaWNoIHdpbGwgZW5hYmxlIGJvdGgNCj4gKyAgICAgICAgKiB0aGUgcmlnaHQgSFcg
SVJRcyBhbmQgdGhlIElTUi4NCj4gKyAgICAgICAgKi8NCj4gKyAgICAgICBtdGtfaGRtaV9od2ly
cV9kaXNhYmxlKGhkbWkpOw0KPiArICAgICAgIGlycV9zZXRfc3RhdHVzX2ZsYWdzKGhkbWktPmly
cSwgSVJRX05PQVVUT0VOKTsNCj4gKyAgICAgICByZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRf
aXJxKCZwZGV2LT5kZXYsIGhkbWktPmlycSwgbXRrX2hkbWlfdjJfaXNyLA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2hkbWlfdjJfaXNyX3RocmVhZCwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUV9UWVBFX0xFVkVMX0hJ
R0gsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfbmFtZSgm
cGRldi0+ZGV2KSwgaGRtaSk7DQo+ICsgICAgICAgaWYgKHJldCkNCj4gKyAgICAgICAgICAgICAg
IHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgIkNhbm5vdCByZXF1ZXN0IElS
UVxuIik7DQo+ICsNCj4gKyAgICAgICByZXQgPSBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCZwZGV2
LT5kZXYpOw0KPiArICAgICAgIGlmIChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJDYW5ub3QgZW5hYmxlIFJ1bnRpbWUgUE1cbiIp
Ow0KPiArDQo+ICsgICAgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCg0KPiANCg==

--__=_Part_Boundary_007_672208033.1347707699
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3N1cHBvcnQmIzMy
O2ZvciYjMzI7dGhlJiMzMjtuZXdlciYjMzI7SERNSS1UWCYjMzI7KEVuY29kZXIpJiMzMjt2MiYj
MzI7YW5kJiMzMjtEREMmIzMyO3YyJiMzMjtJUHMNCiZndDsmIzMyO2ZvdW5kJiMzMjtpbiYjMzI7
TWVkaWFUZWsmIzM5O3MmIzMyO01UODE5NSwmIzMyO01UODE4OCYjMzI7U29DJiMzMjthbmQmIzMy
O3RoZWlyJiMzMjt2YXJpYW50cywmIzMyO2FuZA0KJmd0OyYjMzI7aW5jbHVkaW5nJiMzMjtzdXBw
b3J0JiMzMjtmb3ImIzMyO2Rpc3BsYXkmIzMyO21vZGVzJiMzMjt1cCYjMzI7dG8mIzMyOzRrNjAm
IzMyO2FuZCYjMzI7Zm9yJiMzMjtIRE1JDQomZ3Q7JiMzMjtBdWRpbywmIzMyO2FzJiMzMjtwZXIm
IzMyO3RoZSYjMzI7SERNSSYjMzI7Mi4wJiMzMjtzcGVjLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtI
RENQJiMzMjthbmQmIzMyO0NFQyYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjthcmUmIzMyO2Fsc28m
IzMyO3N1cHBvcnRlZCYjMzI7YnkmIzMyO3RoaXMmIzMyO2hhcmR3YXJlLA0KJmd0OyYjMzI7YnV0
JiMzMjthcmUmIzMyO25vdCYjMzI7aW5jbHVkZWQmIzMyO2luJiMzMjt0aGlzJiMzMjtjb21taXQu
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5v
JiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xs
YWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGlj
JiMzMjtpbnQmIzMyO210a19oZG1pX3YyX3Byb2JlKHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNl
JiMzMjsqcGRldikNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaTsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2ludCYjMzI7cmV0Ow0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaSYjMzI7
PSYjMzI7ZGV2bV9remFsbG9jKCZhbXA7cGRldi0mZ3Q7ZGV2LCYjMzI7c2l6ZW9mKCpoZG1pKSwm
IzMyO0dGUF9LRVJORUwpOw0KDQpCb3RoJiMzMjt2MSYjMzI7YW5kJiMzMjt2MiYjMzI7aGFzJiMz
Mjt0aGlzJiMzMjthbGxvY2F0aW9uLCYjMzI7c28mIzMyO21ha2UmIzMyO2l0JiMzMjthcyYjMzI7
Y29tbW9uJiMzMjtjb2RlLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyghaGRtaSkNCiZndDsmIzMyOysmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtyZXR1cm4mIzMyOy1FTk9NRU07DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO210a19oZG1pX2Nv
bW1vbl9wcm9iZShwZGV2LCYjMzI7aGRtaSk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KHJldCkNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2hwZCYjMzI7PSYjMzI7SERNSV9QTFVHX09VVDsN
CiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
Oy8qDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyom
IzMyO0Rpc2FibGUmIzMyO2FsbCYjMzI7SFcmIzMyO2ludGVycnVwdHMmIzMyO2F0JiMzMjtwcm9i
ZSYjMzI7c3RhZ2UmIzMyO2FuZCYjMzI7aW5zdGFsbCYjMzI7dGhlJiMzMjtJU1INCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7KiYjMzI7YnV0JiMzMjtr
ZWVwJiMzMjtpdCYjMzI7ZGlzYWJsZWQsJiMzMjthcyYjMzI7dGhlJiMzMjtyZXN0JiMzMjtvZiYj
MzI7dGhlJiMzMjtpbnRlcnJ1cHRzJiMzMjtzZXR1cCYjMzI7aXMNCiZndDsmIzMyOysmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7KiYjMzI7ZG9uZSYjMzI7aW4mIzMyO3Ro
ZSYjMzI7LmJyaWRnZV9hdHRhY2goKSYjMzI7Y2FsbGJhY2ssJiMzMjt3aGljaCYjMzI7d2lsbCYj
MzI7ZW5hYmxlJiMzMjtib3RoDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyomIzMyO3RoZSYjMzI7cmlnaHQmIzMyO0hXJiMzMjtJUlFzJiMzMjthbmQm
IzMyO3RoZSYjMzI7SVNSLg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsqLw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7bXRrX2hkbWlfaHdpcnFfZGlzYWJsZShoZG1pKTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lycV9zZXRfc3RhdHVzX2ZsYWdzKGhkbWktJmd0O2lycSwm
IzMyO0lSUV9OT0FVVE9FTik7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtyZXQmIzMyOz0mIzMyO2Rldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoJmFtcDtwZGV2
LSZndDtkZXYsJiMzMjtoZG1pLSZndDtpcnEsJiMzMjttdGtfaGRtaV92Ml9pc3IsDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2hkbWlfdjJfaXNyX3RocmVhZCwNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtJUlFfVFlQRV9MRVZFTF9ISUdILA0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Rldl9uYW1lKCZhbXA7cGRldi0mZ3Q7ZGV2KSwm
IzMyO2hkbWkpOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjtkZXZf
ZXJyX3Byb2JlKCZhbXA7cGRldi0mZ3Q7ZGV2LCYjMzI7cmV0LCYjMzI7JnF1b3Q7Q2Fubm90JiMz
MjtyZXF1ZXN0JiMzMjtJUlEmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0JiMzMjs9JiMzMjtkZXZtX3BtX3J1
bnRpbWVfZW5hYmxlKCZhbXA7cGRldi0mZ3Q7ZGV2KTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsocmV0KQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO3JldHVybiYjMzI7ZGV2X2Vycl9wcm9iZSgmYW1wO3BkZXYtJmd0O2RldiwmIzMyO3Jl
dCwmIzMyOyZxdW90O0Nhbm5vdCYjMzI7ZW5hYmxlJiMzMjtSdW50aW1lJiMzMjtQTSYjOTI7biZx
dW90Oyk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQomZ3Q7JiMz
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

--__=_Part_Boundary_007_672208033.1347707699--

