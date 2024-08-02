Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF069455EB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 03:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94AA10E11F;
	Fri,  2 Aug 2024 01:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HEoCjoku";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TiEHYjo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF14910E11F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 01:25:38 +0000 (UTC)
X-UUID: 19fbd600506e11ef87684b57767b52b1-20240802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mBD7xFfT4lO43oMf6p3Sh09kg/I3s9BHfN43bCUlyck=; 
 b=HEoCjokuzECduOndY4Jfq+pWW6sdfRToqGmibCKfH8JujoiZlBcmqtZYC1Ch3GCZcMigv/mqkHgyK+Vzd1cCCoM8LS1U35ZF95T7P3a5kNDrpKpxqKe/3BDQamR46GYwWXVDsNTE1xk666kHm7xX0f+zXhhFp13H97goYBIuCu8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:754cf391-63e7-4de3-937b-c8e34a93f698, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:1b860dd6-0d68-4615-a20f-01d7bd41f0bb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 19fbd600506e11ef87684b57767b52b1-20240802
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1751779308; Fri, 02 Aug 2024 09:25:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Aug 2024 09:25:28 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Aug 2024 09:25:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBqVpekl3034QofpCKXTrqxsOpn3cs0syx/rrJGuxCsnyUqi68ByGPh/iIXmEe9AZPmSAwNqgdcd4927RE9PCKCuz8bgqKV0YqhG0TbzqjuB6AEOIFEoS4tkZriz1P9UHBfP8NRvfFXVP1MtMsrWIilnnKtxjy1vq/2icbPtVe7cK2ewI294irTdaFyDW+1B9AQ1TcjpCNQCM+nGA+tk3MZQoijv3amJ4WI2H3rbfc2zXe/hC+TeZZDJ1XKdVm4f+b/LODCbNlJpSr6efEMo9BGJoLtdn3K9XJZLckzj8X9OLcR0RYOUQAVJ51nAMMT5GWu2E1RtW0T4XJg6844pSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riItKPE6lkh7h4aXUNYjuvWFwuBnrqjAI0ne/D7pVcM=;
 b=ZQ/LEEh5S/FhRCG99+UL1ZwcuaqbnjMeUyiyyeXWBGg+WDCcrokjq5pWTEVPVhhi8hnYNswnk4V3e7P6U04eqRh8DuChDg7sAZjSOweYaL4Tmx7IVO23kz1KaEc2nj06lpB0d3ZnpleZUtNJzjQl6oTXH8M+b1gOEdloB6e15JPGPJ+p/3F+tgLGXAZJjzbcKawCvQx3v2by2W2lVQQe4g/efIUyaoMZ1kOEUiTnmT+c8U09qbY4Q/WvPEDoSY2JCv9+gjlEBbTyAnYvk/36EdS9I5Bqdl5pPZCA4O75HsnUrM47IDTZSzMVml8O6X7X1pH/SR9qxmxIAuxqq36Dnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riItKPE6lkh7h4aXUNYjuvWFwuBnrqjAI0ne/D7pVcM=;
 b=TiEHYjo8GXvercgOTZ3TbCw5euuD/TfvSTcuqiwYn8QiLxG9NBTAoMax9oc1gUJ8u1AdsARM1i3La8iLVzjnpzAtH84w5zCl84L5gVAU3jeS3TyKd0eZ4gL7Fpx4R/K5GZfLd4mSowR1TTo7jq8xyGQtbBAhJEbx01MxJXsh83c=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYUPR03MB7111.apcprd03.prod.outlook.com (2603:1096:400:350::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 01:25:25 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a%7]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 01:25:25 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
Thread-Topic: [PATCH v4 0/5] Support alpha blending in MTK display driver
Thread-Index: AQHa405sYpT7pK+sikao+QoQn+cXFLITLxUA
Date: Fri, 2 Aug 2024 01:25:25 +0000
Message-ID: <052f217dea8afd4d01f1837c7b61da4791fb8dce.camel@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
In-Reply-To: <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYUPR03MB7111:EE_
x-ms-office365-filtering-correlation-id: 354b4da8-01a4-4cdb-f826-08dcb291fc84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TUlPalpZVmpobkl6ZDNnTW5aaHpSUWpqTDFqQ1pySTVpbEp1S05SUUFiUmdt?=
 =?utf-8?B?UVhUajg3cnhmTWRlSDJNM1FKb3dDQXhpUkJObjZlTTYrcFJCV2w5eDJnUVFu?=
 =?utf-8?B?MFdjcXhNUkxQZjdYNDJlUi9nVEdBZmk0eG54dHg1RzAzalZTZzV4TzgxS2VS?=
 =?utf-8?B?YTdrOHhUVDBSRXpNWFhqODllSGR3cWtSUUV4SXRsMFh4YmNnUll2UHhUU1lM?=
 =?utf-8?B?alVGcGVvMWxtTUtMWkt4UnpMdkx1STZvTmVlOWRwVU9WMkVHOXBDdzMvaHRi?=
 =?utf-8?B?NktwaURweUp2ZUgyQ2VjRjR0T0VCUGFlR3NCbXhpYys0c2tnKzYvRGdUaGth?=
 =?utf-8?B?cVJrTUxEVExibVV2dkdkWnh6TEtLZnpHd0hteVk1TW0ySU5MS2NsbGxOcG11?=
 =?utf-8?B?elJ1djFjM3hxQTVmWnp0SGREcWVyd0VMZU9tVVEzTENvTHExQUFGWjI1RTNK?=
 =?utf-8?B?cloxK2JpWlk1TTAzMVNLZkd6NlZUVUxEaHA3ckNOTTBuQmk0L2lMRmNWbGZp?=
 =?utf-8?B?K1d3bEJZK2pKYmF4R1A0QVNlZHpCTXNZOGpPdFhaVnBmZk5GUnhHVjFTVzZk?=
 =?utf-8?B?dXRreGlHMlNBcUZwMjNXNElabG5HWnVOUXk2c1UrZ1FUMHArczRNaTZUaUE3?=
 =?utf-8?B?dVdXZlFMVDRhWnpmS3BjajZxSW90VEV0cGdHQW9MN2VuR1BDZ2FlK1lsSENS?=
 =?utf-8?B?UXk0SStVeVQrOXRWUzNYRXBGeVlzRGxuUktuL3FGaXNiajhFQ1VuR1RXOFIz?=
 =?utf-8?B?cndyNm1XRmM1SXNKelFIL2VhenBUTUFyWUFGeS9USHhOS00xTWZ6ZitVVjNZ?=
 =?utf-8?B?YVlrWkZKMUdwU3NNR2ozTGJFcFNBdG82TUQwZGZFMTBMOEdlc1h6R3VKcGdD?=
 =?utf-8?B?TzNzVEI0T0FSZFJuSjAwWE5kVlhYdDlWaDA5QUozcHoxT1IzRERYTTlMTmY5?=
 =?utf-8?B?V0xROG1lZXhWQStxWDl2ZGMyQ0RqdW5rYW5uYlJZa1YwTElSYWNmVUx1VkJJ?=
 =?utf-8?B?NnJOZ01jT1JaNmtuTFB4b3hkbXNPTllnSE41V0ZTRzVoYldGZ1ZOM0cvdk9z?=
 =?utf-8?B?T0ZmM2tFVUZweUJDcm1Ec3NnOVNGZzF2V3N1cXp6WWlqOEFCa3hxRE5PcSti?=
 =?utf-8?B?ZTJESjNKWkFlc2QzbVRFQ3FCaEZmUmR2V2ZuQ3V0SFRCWi9CZmZzdTM3UHVj?=
 =?utf-8?B?MVBvcUxFY0NOVjk2aFBvYVNNZkdZbWl4QjBRakFWZWdBa21qZ1pybjBVS1pK?=
 =?utf-8?B?WHl6c3FUakhybXNIZDUwWWJVZGZBRXVrUFlPYlVyeTNvbCt1MThVaEtsUWpp?=
 =?utf-8?B?ZmkvWjNZVi9nM01ubTRJcFIrQjdzWHNpcHcybTNpeE9xZEdraDBzVXh1MXpv?=
 =?utf-8?B?V3dkSFdlRitBcGpxcmZ0NGswOGNzVkxMbG5iRE0vYllUZ1BYRmxveUhWTHgx?=
 =?utf-8?B?REx0a2c4d3o2ZXhaOTNDbDN3QmZzQnVDRnh3ajRjVUNPZklIS0pTYm9sODY5?=
 =?utf-8?B?MHBiMmIvWW1PSStiWGdTZ2dwcHBaMUdlZTJJdWlxbHNaSU10NTliRjMwWmdT?=
 =?utf-8?B?V1pqL2IvMmQrbERITWZ5N25Na3YweVYwMWdXRmdacEU2MXFtZ08xZjVKL3ZX?=
 =?utf-8?B?VzdDaWNzTTM4Z0w1TlpqVzlVUEZ1YldpUi9KcVBBQXV0a2FHVTBmSmhxUysy?=
 =?utf-8?B?UGdrbVdVelBOS0VFS00wZVl1WWdybEcvQ24zdU05YVltTGRpa09wc0dlWnY1?=
 =?utf-8?B?NTRQa1RzNFpsNGl2TFY1emtLSnpDSDFpZ1FIcmxEelhJeXlaOFNYQi9mNkY5?=
 =?utf-8?Q?pAC/Ssz7EEOmRC9KoEeABiK4NMXUQFI5ySGIc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1VaRW8ybGhYb1BRSDl0eG9JN214enpqendsNS9wK2F5T0hmQ0V0Q3BBM3Jx?=
 =?utf-8?B?blJXeDlpNytrNSt0bEw1aTliR1NlVzVicmswRGZEM3hHbzdveTRvRWpuZkNi?=
 =?utf-8?B?ZmcrcnpRQU9vVVRNS2RrQ3RDNFpHL3JTVi9obzlldHlQUXR2WGVSWTViRXpu?=
 =?utf-8?B?QVNHK1ZhaU45Vlh5VC9HMUFyclZXNThKTHNpdytINVpoVWtlN1ZhZmRiMGwx?=
 =?utf-8?B?M2ZJVEV0RWdNczNmbklJaDV2c0tuajg1WTlPRS82emRqS3E1cDlQZGl3VzZs?=
 =?utf-8?B?NEpsRWJNSERsK2pYeFNyaU9NK0UwMEY0SnJPVkc1WXAyaTVpaTdlQkFrK3Bj?=
 =?utf-8?B?L2o1clF0R3BHZVZRZ1FmVUEvTUIyd3NJSDcrUFZDdVVsMmR6aS81RHY4N3Bl?=
 =?utf-8?B?TkhKelhpRlorclJ1eG5SL0FXMVBhQkV0clB3aVRUTitsSGh1VS9sTDYrcHcy?=
 =?utf-8?B?Ty9veG5JYU1XK0Q0WjNsWDdVNklBYkszYzF4OUtob3ZuYVZERHVMTGdjOGdO?=
 =?utf-8?B?Z3kySDZXQXlzS01TNUVERDBBNTFyLys1TTN1Y3p5M0xUd1BYeTFONkhoSC9N?=
 =?utf-8?B?RGtOUGJLbnVFMFgyYmhZQktUayt2aTJRRldNd3ozVll3cU53S0lXLzZZNGxR?=
 =?utf-8?B?V1dMSExsdVdid1J3dEtnRnBOSmNRV2RCNklJNWtuT1VPY25BQTFWVGNVbFlH?=
 =?utf-8?B?dGRJMGtBMTFxRUlpTlhEUXRlZlo0b01yVEwrdk5qa2t3N0RmcFF4V0ZISEU0?=
 =?utf-8?B?Z2h4N3lvR1BRbzljdXhOK3BDUVZmZ3ZFWUpSdUg5YStlSkJnN3drTEx1ekNv?=
 =?utf-8?B?U1M2bUhoNE9ROEJmM0FUbmNjVXN3WVRtUDRpY3RodG43NmdjZitLNC9XYXVD?=
 =?utf-8?B?aWFWV21TdFhVZ3J1NTNTV1JGWXlvTGF2VXMxV3pKdGtQWnpQREhlTkEvSXVX?=
 =?utf-8?B?Z2M5L3d0RkExNlZoSXFHQ3hUak5Hb1gyLzZNeWdhclBrOUIwdW10U21IMTBx?=
 =?utf-8?B?M1lWbHpiMzJaSGlGbk92bGdvUFhFMGFwVkg4RzRKdHBRN1B3UFk2UE12cGpo?=
 =?utf-8?B?bXNSSDBkK3ZYOXFiTnA3bDd3b2l3Y3I2M0tPNTllWmNzaFhXMkVmMmFrT0Vq?=
 =?utf-8?B?OXN4R1RsdVhQVjc5NGFGWnU1VWNlU1ZSc3VoU3Zoc2dHK3hITjltcjMyc0V1?=
 =?utf-8?B?MEZuQ3NJZkFQOG9wTXdaL0dVUlpYUDhja2lZM0hua3l5UXpnK1A5MkFFTWwr?=
 =?utf-8?B?d094azl3dnBid1dWYk9OZzhDZmg1bGplYmp3NTc4ZnA1K0MrbC84Nll5S0tP?=
 =?utf-8?B?UTVwK25pYnNwSEZGdFZYRlFCT2ZITUdpMFZlM3FTR1IxNk85TnVzNkR5d2Vu?=
 =?utf-8?B?OFNuYjhIL3ZhTGllYThvWk1PVmEyZ3lwSHdnc2MvTXFmaTc2d1AwQ3lnMWtD?=
 =?utf-8?B?Undha3FHS0hxVjFaMmZRVmtZc09WSEJRTlRocjFCOFBxck9IMUh4MWVNSGdw?=
 =?utf-8?B?Y0VBUThnS1gySHc2dUdIa3pxVjRyNFRyTHMrbUFQZ20wWStkYk4zMm81VXRG?=
 =?utf-8?B?WGdoR0VsOFozdStwd2VaTU5SeVhONjVRVHVjQ0dwMUZZQVBOUk1UYW04V2ZL?=
 =?utf-8?B?NUZQUitqSUszZWNoQ24vb0pPbHRYN0ZNM3BrUTM3Y05jQWIwQVB1Vkw3eDdD?=
 =?utf-8?B?NmFMdlJLc0dXSHJaZnU4Z2xrTU9QU2psb3p5a3JRM0tjUmdPMi9mOFMrc2Rm?=
 =?utf-8?B?ZW91aUEzTGZVeU5hSzJvS0I2d2QwUm83ZERLc0FsTmRtV3dNekp3cWJHMjd5?=
 =?utf-8?B?emd4NGtOQ3RUQnRxbXBKNmVjbnVhUFhVZnNId3RvM3QrbDBmaGhKaVBuTUxw?=
 =?utf-8?B?NVB5MS8zelcvYnMvODg2SWRFYkt6SEJWZ242eWdTVnJuRzNqNy82bThBbVZn?=
 =?utf-8?B?cTdKTGJBb0NxUUhlTVl5ejJEd2pySzhTQklSUnR0dGhJVEQ4S1BHODN5VEYv?=
 =?utf-8?B?V1l3RE9zWDZHQ3dGcjBUb3hWTFR1a0MvTUJpaUR4dzRtRHhBcHlHMlNPaU41?=
 =?utf-8?B?UTRpSFRLb01ZZHN5Tk1hdWpPZ3F3TlJSRFNRa2FoSUtHU09FNE1KT1Fpc1Mz?=
 =?utf-8?B?dlpVb2c1N1g0ajBaUzZ5ZzFUd0RZbnV3UmlZTENoOC9WQ0srZmowRXBoNXJ1?=
 =?utf-8?B?UVE9PQ==?=
Content-ID: <1B6315834A9D2B45817304C9322860DC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354b4da8-01a4-4cdb-f826-08dcb291fc84
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 01:25:25.6108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clqBBaxjWodYV5tOFBMgwU9vt1jjMkteX8U/LcN9HkqqyzAVssUzrq9zzo9tqElRU+Rty6BGkvfNyvjOOdfiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7111
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1760375574.1263422244"
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

--__=_Part_Boundary_008_1760375574.1263422244
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFdlZCwgMjAyNC0wNy0zMSBhdCAyMTozNCArMDgwMCwgQ2h1bi1LdWFuZyBI
dSB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBIaSwgU2hhd246DQo+IA0KPiBIc2lhbyBDaGllbiBT
dW5nIHZpYSBCNCBSZWxheQ0KPiA8ZGV2bnVsbCtzaGF3bi5zdW5nLm1lZGlhdGVrLmNvbUBrZXJu
ZWwub3JnPiDmlrwgMjAyNOW5tDfmnIgxN+aXpSDpgLHkuIkNCj4g5LiL5Y2IMToyNOWvq+mBk++8
mg0KPiA+DQo+ID4gU3VwcG9ydCAiUHJlLW11bHRpcGxpZWQiIGFuZCAiTm9uZSIgYmxlbmQgbW9k
ZSBvbiBNZWRpYVRlaydzIGNoaXBzDQo+IGJ5DQo+ID4gYWRkaW5nIGNvcnJlY3QgYmxlbmQgbW9k
ZSBwcm9wZXJ0eSB3aGVuIHRoZSBwbGFuZXMgaW5pdC4NCj4gPiBCZWZvcmUgdGhpcyBwYXRjaCwg
b25seSB0aGUgIkNvdmVyYWdlIiBtb2RlIChkZWZhdWx0KSBpcyBzdXBwb3J0ZWQuDQo+IA0KPiBG
b3IgdGhlIHdob2xlIHNlcmllcywgYXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRo
YW5rcy4NCj4gDQoNClRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0aW9uLg0KDQpSZWdhcmRzLA0K
U2hhd24NCg0KPiBbMV0gDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0
DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEhzaWFvIENoaWVuIFN1bmcgPA0KPiBzaGF3bi5zdW5nQG1lZGlhdGVrLmNvcnAtcGFydG5l
ci5nb29nbGUuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gLSBBZGQgbW9y
ZSBpbmZvcm1hdGlvbiB0byB0aGUgY29tbWl0IG1lc3NhZ2UNCj4gPiAtIExpbmsgdG8gdjM6IA0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNzEwLWFscGhhLWJsZW5kaW5nLXYzLTAt
Mjg5YzE4N2Y5YzZmQG1lZGlhdGVrLmNvbQ0KPiA+DQo+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiAt
IFJlbW92ZSB0aGUgQ2hhbmdlLUlkDQo+ID4gLSBMaW5rIHRvIHYyOiANCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI0MDcxMC1hbHBoYS1ibGVuZGluZy12Mi0wLWQ0YjUwNWU2OTgwYUBt
ZWRpYXRlay5jb20NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSBSZW1vdmUgdW5uZWNl
c3NhcnkgY29kZXMNCj4gPiAtIEFkZCBtb3JlIGluZm9ybWF0aW9uIHRvIHRoZSBjb21taXQgbWVz
c2FnZQ0KPiA+IC0gTGluayB0byB2MTogDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NDA2MjAtYmxlbmQtdjEtMC03MjY3MDA3MmNhMjBAbWVkaWF0ZWsuY29tDQo+ID4NCj4gPiAtLS0N
Cj4gPiBIc2lhbyBDaGllbiBTdW5nICg1KToNCj4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IFN1cHBv
cnQgIk5vbmUiIGJsZW5kaW5nIGluIE9WTA0KPiA+ICAgICAgIGRybS9tZWRpYXRlazogU3VwcG9y
dCAiTm9uZSIgYmxlbmRpbmcgaW4gTWl4ZXINCj4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IFN1cHBv
cnQgIlByZS1tdWx0aXBsaWVkIiBibGVuZGluZyBpbiBPVkwNCj4gPiAgICAgICBkcm0vbWVkaWF0
ZWs6IFN1cHBvcnQgIlByZS1tdWx0aXBsaWVkIiBibGVuZGluZyBpbiBNaXhlcg0KPiA+ICAgICAg
IGRybS9tZWRpYXRlazogU3VwcG9ydCBhbHBoYSBibGVuZGluZyBpbiBkaXNwbGF5IGRyaXZlcg0K
PiA+DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDM2DQo+
ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2V0aGRyLmMgICAgfCAxMyArKysrKysrKystLS0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jICAgIHwgMTEgKysrKysrKysrKw0KPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+IC0tLQ0K
PiA+IGJhc2UtY29tbWl0OiA4YWQ0OWE5MmNmZjRiYWIxM2ViMmYyNzI1MjQzZjVmMzFlZmYzZjNi
DQo+ID4gY2hhbmdlLWlkOiAyMDI0MDcxMC1hbHBoYS1ibGVuZGluZy0wNjcyOTU1NzA4NjMNCj4g
Pg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiAtLQ0KPiA+IEhzaWFvIENoaWVuIFN1bmcgPHNoYXdu
LnN1bmdAbWVkaWF0ZWsuY29tPg0KPiA+DQo+ID4NCg==

--__=_Part_Boundary_008_1760375574.1263422244
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7V2VkLCYjMzI7MjAy
NC0wNy0zMSYjMzI7YXQmIzMyOzIxOjM0JiMzMjsrMDgwMCwmIzMyO0NodW4tS3VhbmcmIzMyO0h1
JiMzMjt3cm90ZToNCiZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtl
bWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3Mm
IzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYj
MzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMz
Mjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtIaSwmIzMyO1NoYXduOg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyO3ZpYSYjMzI7QjQmIzMyO1JlbGF5DQom
Z3Q7JiMzMjsmbHQ7ZGV2bnVsbCtzaGF3bi5zdW5nLm1lZGlhdGVrLmNvbUBrZXJuZWwub3JnJmd0
OyYjMzI7JiMyNjA0NDsmIzMyOzIwMjQmIzI0MTgwOzcmIzI2Mzc2OzE3JiMyNjA4NTsmIzMyOyYj
MzY5MTM7JiMxOTk3NzsNCiZndDsmIzMyOyYjMTk5Nzk7JiMyMTMyMDsxOjI0JiMyMzUzMTsmIzM2
OTQ3OyYjNjUzMDY7DQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTdXBwb3J0JiMz
MjsmcXVvdDtQcmUtbXVsdGlwbGllZCZxdW90OyYjMzI7YW5kJiMzMjsmcXVvdDtOb25lJnF1b3Q7
JiMzMjtibGVuZCYjMzI7bW9kZSYjMzI7b24mIzMyO01lZGlhVGVrJiMzOTtzJiMzMjtjaGlwcw0K
Jmd0OyYjMzI7YnkNCiZndDsmIzMyOyZndDsmIzMyO2FkZGluZyYjMzI7Y29ycmVjdCYjMzI7Ymxl
bmQmIzMyO21vZGUmIzMyO3Byb3BlcnR5JiMzMjt3aGVuJiMzMjt0aGUmIzMyO3BsYW5lcyYjMzI7
aW5pdC4NCiZndDsmIzMyOyZndDsmIzMyO0JlZm9yZSYjMzI7dGhpcyYjMzI7cGF0Y2gsJiMzMjtv
bmx5JiMzMjt0aGUmIzMyOyZxdW90O0NvdmVyYWdlJnF1b3Q7JiMzMjttb2RlJiMzMjsoZGVmYXVs
dCkmIzMyO2lzJiMzMjtzdXBwb3J0ZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0ZvciYjMzI7dGhl
JiMzMjt3aG9sZSYjMzI7c2VyaWVzLCYjMzI7YXBwbGllZCYjMzI7dG8mIzMyO21lZGlhdGVrLWRy
bS1uZXh0JiMzMjtbMV0sJiMzMjt0aGFua3MuDQomZ3Q7JiMzMjsNCg0KVGhhbmsmIzMyO3lvdSYj
MzI7Zm9yJiMzMjt0aGUmIzMyO2luZm9ybWF0aW9uLg0KDQpSZWdhcmRzLA0KU2hhd24NCg0KJmd0
OyYjMzI7WzFdJiMzMjsNCiZndDsmIzMyO2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLyYjNjM7aD1tZWRpYXRl
ay1kcm0tbmV4dA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Q2h1bi1L
dWFuZy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0Ow0KJmd0OyYjMzI7
c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsNCiZndDsmIzMy
OyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3Y0Og0K
Jmd0OyYjMzI7Jmd0OyYjMzI7LSYjMzI7QWRkJiMzMjttb3JlJiMzMjtpbmZvcm1hdGlvbiYjMzI7
dG8mIzMyO3RoZSYjMzI7Y29tbWl0JiMzMjttZXNzYWdlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMz
MjtMaW5rJiMzMjt0byYjMzI7djM6JiMzMjsNCiZndDsmIzMyO2h0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDA3MTAtYWxwaGEtYmxlbmRpbmctdjMtMC0yODljMTg3ZjljNmZAbWVkaWF0ZWsu
Y29tDQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDaGFuZ2VzJiMzMjtpbiYjMzI7
djM6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMzMjtSZW1vdmUmIzMyO3RoZSYjMzI7Q2hhbmdlLUlk
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMzMjtMaW5rJiMzMjt0byYjMzI7djI6JiMzMjsNCiZndDsm
IzMyO2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA3MTAtYWxwaGEtYmxlbmRpbmctdjIt
MC1kNGI1MDVlNjk4MGFAbWVkaWF0ZWsuY29tDQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtDaGFuZ2VzJiMzMjtpbiYjMzI7djI6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMzMjtSZW1v
dmUmIzMyO3VubmVjZXNzYXJ5JiMzMjtjb2Rlcw0KJmd0OyYjMzI7Jmd0OyYjMzI7LSYjMzI7QWRk
JiMzMjttb3JlJiMzMjtpbmZvcm1hdGlvbiYjMzI7dG8mIzMyO3RoZSYjMzI7Y29tbWl0JiMzMjtt
ZXNzYWdlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMzMjtMaW5rJiMzMjt0byYjMzI7djE6JiMzMjsN
CiZndDsmIzMyO2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA2MjAtYmxlbmQtdjEtMC03
MjY3MDA3MmNhMjBAbWVkaWF0ZWsuY29tDQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjstLS0NCiZndDsmIzMyOyZndDsmIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7KDUp
Og0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZHJtL21l
ZGlhdGVrOiYjMzI7U3VwcG9ydCYjMzI7JnF1b3Q7Tm9uZSZxdW90OyYjMzI7YmxlbmRpbmcmIzMy
O2luJiMzMjtPVkwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO2RybS9tZWRpYXRlazomIzMyO1N1cHBvcnQmIzMyOyZxdW90O05vbmUmcXVvdDsmIzMyO2Js
ZW5kaW5nJiMzMjtpbiYjMzI7TWl4ZXINCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO2RybS9tZWRpYXRlazomIzMyO1N1cHBvcnQmIzMyOyZxdW90O1ByZS1t
dWx0aXBsaWVkJnF1b3Q7JiMzMjtibGVuZGluZyYjMzI7aW4mIzMyO09WTA0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZHJtL21lZGlhdGVrOiYjMzI7U3Vw
cG9ydCYjMzI7JnF1b3Q7UHJlLW11bHRpcGxpZWQmcXVvdDsmIzMyO2JsZW5kaW5nJiMzMjtpbiYj
MzI7TWl4ZXINCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O2RybS9tZWRpYXRlazomIzMyO1N1cHBvcnQmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7aW4m
IzMyO2Rpc3BsYXkmIzMyO2RyaXZlcg0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7
JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMmIzMyO3wmIzMyOzM2
DQomZ3Q7JiMzMjsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jJiMzMjsmIzMy
OyYjMzI7JiMzMjt8JiMzMjsxMyYjMzI7KysrKysrKysrLS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
IzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYyYjMzI7JiMzMjsmIzMyOyYj
MzI7fCYjMzI7MTEmIzMyOysrKysrKysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7MyYjMzI7
ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjs0OSYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzExJiMzMjtk
ZWxldGlvbnMoLSkNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YmFz
ZS1jb21taXQ6JiMzMjs4YWQ0OWE5MmNmZjRiYWIxM2ViMmYyNzI1MjQzZjVmMzFlZmYzZjNiDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtjaGFuZ2UtaWQ6JiMzMjsyMDI0MDcxMC1hbHBoYS1ibGVuZGluZy0w
NjcyOTU1NzA4NjMNCiZndDsmIzMyOyZndDsNCiZndDsmIzMyOyZndDsmIzMyO0Jlc3QmIzMyO3Jl
Z2FyZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7SHNpYW8mIzMy
O0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7
JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEt
LXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVk
aWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBj
b3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5
b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1h
aWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1760375574.1263422244--

