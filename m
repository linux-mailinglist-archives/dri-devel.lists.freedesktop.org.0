Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC79FB97B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 06:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFAE10E137;
	Tue, 24 Dec 2024 05:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Q4Tmk6oX";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="n05ZbGdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509810E137
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 05:21:30 +0000 (UTC)
X-UUID: ea636b28c1b611efbd192953cf12861f-20241224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jh8rsl2ov60Yo6/+qDysElvqP5lSk9YsTNdHEBSVPPc=; 
 b=Q4Tmk6oXHzp3R1RIquTuFgzuY0BHiVZJvGBg12ECvJcFLrZpYcyZfWI3jWmOKputLPRWrNuQZYbb21Xd7yjSPa/vmzv4EDkwT7+et31wKTpJc48TYnNxroAGV/kEN4VPYZD/Jg+DkzNNlxYU9mnYWDdKkgB6wUNSGSxOAQNAKnk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:d0ffdec8-a4c9-4a24-b538-939bb22383e2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:8529c618-ec44-4348-86ee-ebcff634972b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ea636b28c1b611efbd192953cf12861f-20241224
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 251574801; Tue, 24 Dec 2024 13:21:23 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Dec 2024 13:21:21 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Dec 2024 13:21:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n66xL6U65LEzw60UfYushx0aRPaOTL1TTiuvXeIWAtASxs+sS2bqBLjALKI0eK0ihoBbqMfyAHQVK2vGCmtB5tZVOYaNfNAr87YtGMYiU8/QN2Ca/rCmRI3/g844RH1ut9ENLPKaQEg5YPJ+dqTjaOJeBjhnP9oi3JsJa088tVD3IxS3jp4kjXTleNsy0gVyk10VRpISATILjFOhrYQmnzawy8iabnnlZS+xqGqVN7TZ+8Em6Hsu/tNa1UncOs2PrugUPHv/999NHWHDslDo4eYXD+FQovB0TLY2xMfvQbie8d3y5DVb8eU5pQ8iZ7OJeg1cYVP79AovJGIVMtTK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytzeOgK/FAUxvyd7UzyJbhb3/WxKXrRT4jDW94CjsXE=;
 b=KNAzB/wBrvpBO4jualYfiYF32uVZJ90unk5cKMksBzWxmlJGTsU++yhTx4E+uaaduSP7QSUHtoq2EENqJ0ImgiYygxVj2r0vPpgVj+ygRVGktni6b5r8NP/ZHdQocMkaH1rgtmwN4JHjOHtzgNDgrdcnxMOTwd0vOOXrqVAMWB9c2KWnMBDZ6kMr+lAjrskj+LAFvebDBhc4PDqlKeKN7x2H9Y3UUdwffrL8mFSrvgmxPDV0q6SC8QcvLYupc5C0RAtIbg8mAxhlNmKq71vWhWA4YO189SvSRDS8M3dlEkL8jNiVbtJgEmspF6X4Uk5x4uzJ6fkwFuNX1Vq5Gm2NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytzeOgK/FAUxvyd7UzyJbhb3/WxKXrRT4jDW94CjsXE=;
 b=n05ZbGdXHEmGQw/AKNJ/jt/lCyksGxn9RUJIb99pyB53RoxrJ7jhNFVd/Egw3z0KmPt1kmwydkTmm3HqbsjioG9mpPFg4ysJLqjy1XItaJlnV/JXMz0tJUffbekqYQ/Y7hdORhYqDP7efwEiD6eN3VLEkJjsHJ8T8lwOWgK9BXs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7913.apcprd03.prod.outlook.com (2603:1096:101:189::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Tue, 24 Dec
 2024 05:21:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Tue, 24 Dec 2024
 05:21:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
 <Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v3 6/7] drm/mediatek: Add programming flow for unsupported
 subsys ID hardware
Thread-Topic: [PATCH v3 6/7] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbUjk94C1yrUVLDkWaw4QjUwi+O7L04t6A
Date: Tue, 24 Dec 2024 05:21:18 +0000
Message-ID: <a20004d1279c234ca3b25681a47897d31f1d525d.camel@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20241219170800.2957-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7913:EE_
x-ms-office365-filtering-correlation-id: cb1eefa5-0fe1-41b6-5705-08dd23dacb92
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ODBObzg3UFBqcFNxSXkyay9rd2YxejF2TjloREhxc2c0R2MrQTBYYWxyY0pL?=
 =?utf-8?B?UW5wdDdvcVl6OUVvMCtTdkNyT0h1NXdkdVpFbW5CaXN2UXl0M1pyR1dpc0xI?=
 =?utf-8?B?Y2ZhbXQwcWNUUStoMlQ4aEtBVVFwdmpJcDRPUDRWRXZiTHZoSGYxaysyYjAw?=
 =?utf-8?B?a1RheDIzR2NDNjRPMmhBc0pXZUIvYjBsdytkVTFCUmluRmJNVWhZWXkwWjda?=
 =?utf-8?B?a29RTmRyR0pBdU5ORzV3WnJQN3JnaTZ2bTFTa2dxRVBmSjVGOXpPQkpWdnF5?=
 =?utf-8?B?M0t1UVhhbXlLeHhlckdqaFI5SnNkWGs0NCtDbmowRzFZaldOeU42QTBjK0JX?=
 =?utf-8?B?TG1jYU9CY1hMMjYza3FHQzNWWWFaS1pjRG5KMElIM1REMXRQVnpUMW1FMm1l?=
 =?utf-8?B?ZE05Rlh3SFVUTnpuWkdoZmlKcHkwejByZVZFbFkraU1Ob25UV1ZiN3daTXZD?=
 =?utf-8?B?OFVqUUpsb1hudFR4SFgwUkFDK1E0ZENLTmVmb1JiRWF3V0FzWGU2alJyS3BO?=
 =?utf-8?B?NXpNS3hOeDdmWGg1aXc4eHdkZ2psc1NMTTRwSVR6N3d3SnoxcjIrSkg4RTd0?=
 =?utf-8?B?VWVuTk1nVFh0ODIrRXlXZ0Z6WjZPWkQ3N2JKdFBNT3Z6a1NBSnlJUE14TmM4?=
 =?utf-8?B?bjlmQXRKaUllSGVlYXFEK3pWMS9RdkNOVi9rdXNEY2Y3N25JemJLd1NNMmhY?=
 =?utf-8?B?cjc2OWcxOXgwN2hBNUFrUGk1OEdIU2szYTRsZytnOG9mUnNOank4ajVrWGdq?=
 =?utf-8?B?L0xBTG9OdU40NU1KQkJoQWlSQzE0bjV2Z01LNjl6UmwxczYxUFh3dmFkV0ts?=
 =?utf-8?B?L0dCbHg0ck9odko3TmhFeFNqeGxPaEVhNllaMm5oNnZkbjBDWmxzbzNIRmU4?=
 =?utf-8?B?eHppVGxoNkkzMEdGSWR4TEtwU1I4WlhyTjdmY0Jaa3ZGOVR1UVhUMzVsWkFs?=
 =?utf-8?B?Q0pOSVJRYWVHUjVJcE1lNHhnclRPMXVCbmlLQkdZOEtsQlhwVGxudHhiUjJp?=
 =?utf-8?B?eFZZVm9wS3k5ZHhwLzgvSGJTUWI5MGhBVnhIeXAybzIrU0FTSEFQSWUzUWNo?=
 =?utf-8?B?MjYyelI0T3FCMzRFOCs0aWtUd21xQWV6dmE5K1ZlaTV1ZkhXZ2JsMTd5ZERG?=
 =?utf-8?B?UkczbjR6NDNHdm80a1ByRFdpRjJiajUvUGVyRk1MVFNmWWdaeEw4YWtXeEtw?=
 =?utf-8?B?SXY4NE5seHN1WHQxbXpWUXA4MGtOQ3BiQUxvdTJTMHFnZllkUzhjcG5lcUkx?=
 =?utf-8?B?Q3dwV2hTNVNSek42UTQ2TVZ1WnMrWDM4d0prUlNuRFV0d2MvVkpIWE5TRG5z?=
 =?utf-8?B?WkYvVFJWSTBUOGxYWUNlYWxuMlZ2dW1KV0l3U01QTnoybGUvclo3TjhLOE14?=
 =?utf-8?B?ZTBHWjRVVmdSanlqM3RyRXJDT2Q3N08zakZvSHk5ZHk0TWFZNk5BTzZ6Y2pB?=
 =?utf-8?B?MWVtME14NmdTeXJ5SXU3REdacDVzaE9kRllYYk42NUtkTlpiN2xSUXJTb3ZV?=
 =?utf-8?B?c0kxaGlnQmlvVVQxWUxLK0twQ01hODc3aXhxV1NhT0VUNGtZTVk1WFc1ZDk1?=
 =?utf-8?B?aWJMdE5tQ214bWpRbWtmRGJ0RnEreWMrWnhINzgyVzlOWEgvSFNVRXoxYmpC?=
 =?utf-8?B?ZTBtVkszTjcxbXNxcE5jU20zUDBDMFFFZTlDZzhsOWNhZHFwM05XV3Fvdncw?=
 =?utf-8?B?Y0VXbmNhODFwb0pDNkNVc1VhRkl5c3BNVmg3YmtOVzJ2QW83VUlwY0RZcmxx?=
 =?utf-8?B?azYxS2VGcHBvTVhVaGlRM1ZBNGpWaEQ0bEJwbE01eUQwT3VCSHorZy9iVm1U?=
 =?utf-8?B?ektwNmtUWG5nQVBqOXBsUEoySXdjc1JGVUdoSUFoUDdlYU9ISEh5MktuOEw0?=
 =?utf-8?B?WDV0WTRZSUs5RUw1SWJ1NnJYTERRSEZBcXJhUjhkTFFoMWhkUnRzT2lGU2lE?=
 =?utf-8?Q?3gPHdU6PhwIUDK3qyzjRFOqs7pPe5ODl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWlmcEM5WW1GQ0dHSWFOOEZ5ZUZkN1BHQ25STFFYbnJUQmhIZXVmaTBVdzVO?=
 =?utf-8?B?V0xYY01PME1LZFAwbzhqZ2xZcnJsRnFHMHRDUUk1RERzakZmbVFRMXgzbVov?=
 =?utf-8?B?RGRuVzZVcFFUS0FxcnM1dFJQTlBWc2NKSkFSOTZtNTBmVXBaMWQ5Nk5uRnE5?=
 =?utf-8?B?cjF6WEZrRmdkbVVJak4rS2diTm5Nd2hGTndmdWhwQzJSTlFUb2NkTStmSDVU?=
 =?utf-8?B?Q05kWHNvUitwRllESHJCZFlNRXVVK0xGT1pMclpueGVQM2J2UG15Z0VJOCtO?=
 =?utf-8?B?aEt3M0xMaENDU0JjdGY0aFpXK3BGdmI1T2dBMFNPc2EwbXlSNk1EWnRqRkFr?=
 =?utf-8?B?K3IxK3NKQWhZckRMUDdsaGpkbncycTNTK1grZUJ6bEo5dlY4K2hsSi8zQ1Nh?=
 =?utf-8?B?TStUdCs0aXRiS3B1WmowLzNubC8zWE51elRzRkNwTkNnK1QzOW90ZDV0WWE4?=
 =?utf-8?B?OWN3WTBIanN6RnlqTDFRZnRPNkJlenVCbUNYSHZpdHBEQjRjSzVnWEJScTkw?=
 =?utf-8?B?RFhnODV4MllyZDEreDVPZXk1ZGRNWUh3T1I5Vng3ejFSdVA3M2ZVdS96VGZn?=
 =?utf-8?B?ZjJOenZZM3FLbTFkUkIycUlxcDZqZ0tWSFRscXBndVJMYUdIQWVHNDFBRE1w?=
 =?utf-8?B?UUpRZnVFd0EyRGxDMEhJVTcvMUdpbC9DQlhyelUvdzFxczNIWnZnVnFTNzVv?=
 =?utf-8?B?WU5jUFRwT1J3SzNGelNVMlREY1hmbFBwcERockc5K0ZYdzcvWHcvQ1lRU2Mz?=
 =?utf-8?B?aHRtM081bHdlQVNaVlJtUkRYV0pRczRPTThSSWVKMmgwOTRveVRGNFhzdlRR?=
 =?utf-8?B?K3FuQ2RIUVhmaDQ3UUU4cnlOSldhRUNnOEtUeTVHT1FKeTdiQjJsTUw4LzJX?=
 =?utf-8?B?SDJveG1GK0F5NzNKQ0NpcHlGc2xvWGpSQjdGVjFwQ2RHNnNpTlQ3WVIxSU9K?=
 =?utf-8?B?M1FqU3ArckFuMG9LN0xNd0pDOFkxbExRbVd6WHA3ZDJOVUZVTldnMDduRlI4?=
 =?utf-8?B?QTVHck9hU0NwSEgvMmR2ZEZDOUphM1gramdMMklpQWt5YnBwVG1KYmlTOUV5?=
 =?utf-8?B?dC9aN1JCUXcxOTR1cjdTTWRQL1FqMmZ2UytjM3dUR1BBT013T3l5RGR1TFpO?=
 =?utf-8?B?Y28yRHloSWpkOU92Nm9Ic2tzRU43ajVIWFZ2LzhPREFYb2ZTb2RXb01zdlpX?=
 =?utf-8?B?dVYzVVoweW9aSzloM3hmMEpGSGs3Szd6K1UzdkVUenVrRzhNaXBheVZhMUFn?=
 =?utf-8?B?WkFiOE1lMFR6Mm91NFRySG5mQzNvZkY1UzMxdkxWdUtDWFQvYit3WE0vazR0?=
 =?utf-8?B?ZVVQK0JOQ1VkQXFyZ2l1VENWcVZuTmRXTFAyZ0F0Wmp3OE1TVlpmZ1BmMzlD?=
 =?utf-8?B?TWp1d2hYRW0vRTRJTHNXbUlZRFd5UGpKdXpwRGU5Wm1UVmkvZUZGazVEek85?=
 =?utf-8?B?b3F0aEo3SnlWTFZ0QkM4a282VVNzQW1Hd29XeW51M2p6bm02U0Z4Tk9xT2Vq?=
 =?utf-8?B?eUJFSldZOWlPSUlZbmhEeWk1SjA2UHdMaUhnbW0xdjBRdGw4MHBDcmVCWW15?=
 =?utf-8?B?Y3c5TzFGNU9sb29mSGxRQ3F6Rkc3MzVFT05XMHNvZ1p1NEJHQmYvaDZmRG1F?=
 =?utf-8?B?ZDRaSXoxbEZGMUtpTFE2L0xSZWZYSytMZXNhbWRtdEV4ZWduck9Sc0ZzZ0E0?=
 =?utf-8?B?bVoySjQ4c2pEdXJGKzhGOVRJbHV4b2RKTnMrSWtEOXAvZTFhUGxFbi9DR2Y1?=
 =?utf-8?B?TjdNYzBzd1NpUVpiZDkwRlNMYXVIeVBUcnYyVWEvMEovWVBySWQ2eTBBZG5u?=
 =?utf-8?B?SHljdVdOS1UxcUJ5V0svYVBvTTZ3TUVXZDhEeWhBSEs4N3BYQnV3RTRBdXVq?=
 =?utf-8?B?MUJkYkFhVjZUckJNOExQWjE4cUV1a1JNNWRLdy8zQk5NWjY5bHc4MEdjcW1C?=
 =?utf-8?B?YlBNOGRqc0V6RVRTeE9CdW94bGVORjRxRHNPNVJZR25xZUpNMjV2RE9OdFFI?=
 =?utf-8?B?ajRpNUcxY2ZtUTIxdlB1aXhrRjFEaEVoOEl6clRoR3lCZGpYMVJWOFllV2xG?=
 =?utf-8?B?bXpENklwT2NSZ0k4RDdSSG5HY052eERnVjZ0UWd6aUxQQS9TdGd2N0NOcmU0?=
 =?utf-8?Q?4VKbsbb/E4Qxa/N/5sNKbQxD6?=
Content-ID: <78CE2A4C5E5F9E4B9A2B2753659529F2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1eefa5-0fe1-41b6-5705-08dd23dacb92
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 05:21:18.1169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3g1Ah2xwiTVo0Tj8SrHYxdVI9WhXWEyXQUDtTX3izBzVl07lzntO2gazJBPCJhlyLqTupuB4mEvNujm02CPMpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7913
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_273085520.114540403"
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

--__=_Part_Boundary_002_273085520.114540403
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjQtMTItMjAgYXQgMDE6MDcgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gVG8gc3VwcG9ydCBoYXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMgb24g
bmV3IFNvQ3MsIGFkZCBhIHByb2dyYW1taW5nDQo+IGZsb3cgdGhhdCBjaGVja3Mgd2hldGhlciB0
aGUgc3Vic3lzIElEIGlzIHZhbGlkLiBJZiB0aGUgc3Vic3lzIElEIGlzDQo+IGludmFsaWQsIHRo
ZSBmbG93IHdpbGwgY2FsbCAyIGFsdGVybmF0aXZlIENNRFEgQVBJczoNCj4gY21kcV9wa3RfYXNz
aWduKCkgYW5kIGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoKSB0byBhY2hpZXZlIHRoZSBzYW1lDQo+
IGZ1bmN0aW9uYWxpdHkuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29t
cC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kZHBfY29tcC5jDQo+IGluZGV4IGVkYzY0MTc2MzllNi4uMjE5ZDY3NzM1YTU0IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+IEBAIC02Niwx
NCArNjYsMzcgQEAgc3RydWN0IG10a19kZHBfY29tcF9kZXYgew0KPiAgCXN0cnVjdCBjbWRxX2Ns
aWVudF9yZWcgY21kcV9yZWc7DQo+ICB9Ow0KPiAgDQo+ICsjaWYgSVNfUkVBQ0hBQkxFKENPTkZJ
R19NVEtfQ01EUSkNCj4gK3N0YXRpYyB2b2lkIG10a19kZHBfd3JpdGVfY21kcV9wa3Qoc3RydWN0
IGNtZHFfcGt0ICpjbWRxX3BrdCwgc3RydWN0IGNtZHFfY2xpZW50X3JlZyAqY21kcV9yZWcsDQo+
ICsJCQkJICAgdW5zaWduZWQgaW50IG9mZnNldCwgdW5zaWduZWQgaW50IHZhbHVlLCB1bnNpZ25l
ZCBpbnQgbWFzaykNCj4gK3sNCj4gKwlvZmZzZXQgKz0gY21kcV9yZWctPm9mZnNldDsNCj4gKw0K
PiArCWlmIChjbWRxX3JlZy0+c3Vic3lzICE9IENNRFFfU1VCU1lTX0lOVkFMSUQpIHsNCj4gKwkJ
aWYgKG1hc2sgPT0gR0VOTUFTSygzMSwgMCkpDQo+ICsJCQljbWRxX3BrdF93cml0ZShjbWRxX3Br
dCwgY21kcV9yZWctPnN1YnN5cywgb2Zmc2V0LCB2YWx1ZSk7DQo+ICsJCWVsc2UNCj4gKwkJCWNt
ZHFfcGt0X3dyaXRlX21hc2soY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsIG9mZnNldCwgdmFs
dWUsIG1hc2spOw0KPiArCX0gZWxzZSB7DQo+ICsJCS8qIG9ubHkgTU1JTyBhY2Nlc3MsIG5vIG5l
ZWQgdG8gY2hlY2sgbW1pbmZyb19vZmZzZXQgKi8NCj4gKwkJY21kcV9wa3RfYXNzaWduKGNtZHFf
cGt0LCAwLCBDTURRX0FERFJfSElHSChjbWRxX3JlZy0+cGFfYmFzZSkpOw0KPiArCQlpZiAobWFz
ayA9PSBHRU5NQVNLKDMxLCAwKSkNCj4gKwkJCWNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoY21kcV9w
a3QsIENNRFFfVEhSX1NQUl9JRFgwLA0KPiArCQkJCQkgICAgICAgQ01EUV9BRERSX0xPVyhvZmZz
ZXQpLCB2YWx1ZSk7DQo+ICsJCWVsc2UNCj4gKwkJCWNtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1
ZShjbWRxX3BrdCwgQ01EUV9USFJfU1BSX0lEWDAsDQo+ICsJCQkJCQkgICAgQ01EUV9BRERSX0xP
VyhvZmZzZXQpLCB2YWx1ZSwgbWFzayk7DQo+ICsJfQ0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4g
IHZvaWQgbXRrX2RkcF93cml0ZShzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0LCB1bnNpZ25lZCBp
bnQgdmFsdWUsDQo+ICAJCSAgIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgKmNtZHFfcmVnLCB2b2lk
IF9faW9tZW0gKnJlZ3MsDQo+ICAJCSAgIHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ICB7DQo+ICAj
aWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gIAlpZiAoY21kcV9wa3QpDQo+IC0J
CWNtZHFfcGt0X3dyaXRlKGNtZHFfcGt0LCBjbWRxX3JlZy0+c3Vic3lzLA0KPiAtCQkJICAgICAg
IGNtZHFfcmVnLT5vZmZzZXQgKyBvZmZzZXQsIHZhbHVlKTsNCj4gKwkJbXRrX2RkcF93cml0ZV9j
bWRxX3BrdChjbWRxX3BrdCwgY21kcV9yZWcsIG9mZnNldCwgdmFsdWUsIEdFTk1BU0soMzEsIDAp
KTsNCj4gIAllbHNlDQo+ICAjZW5kaWYNCj4gIAkJd3JpdGVsKHZhbHVlLCByZWdzICsgb2Zmc2V0
KTsNCj4gQEAgLTg1LDggKzEwOCw3IEBAIHZvaWQgbXRrX2RkcF93cml0ZV9yZWxheGVkKHN0cnVj
dCBjbWRxX3BrdCAqY21kcV9wa3QsIHVuc2lnbmVkIGludCB2YWx1ZSwNCj4gIHsNCj4gICNpZiBJ
U19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQ0KPiAgCWlmIChjbWRxX3BrdCkNCj4gLQkJY21k
cV9wa3Rfd3JpdGUoY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsDQo+IC0JCQkgICAgICAgY21k
cV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUpOw0KPiArCQltdGtfZGRwX3dyaXRlX2NtZHFf
cGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0LCB2YWx1ZSwgR0VOTUFTSygzMSwgMCkpOw0K
PiAgCWVsc2UNCj4gICNlbmRpZg0KPiAgCQl3cml0ZWxfcmVsYXhlZCh2YWx1ZSwgcmVncyArIG9m
ZnNldCk7DQo+IEBAIC05OCw4ICsxMjAsNyBAQCB2b2lkIG10a19kZHBfd3JpdGVfbWFzayhzdHJ1
Y3QgY21kcV9wa3QgKmNtZHFfcGt0LCB1bnNpZ25lZCBpbnQgdmFsdWUsDQo+ICB7DQo+ICAjaWYg
SVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gIAlpZiAoY21kcV9wa3QpIHsNCj4gLQkJ
Y21kcV9wa3Rfd3JpdGVfbWFzayhjbWRxX3BrdCwgY21kcV9yZWctPnN1YnN5cywNCj4gLQkJCQkg
ICAgY21kcV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUsIG1hc2spOw0KPiArCQltdGtfZGRw
X3dyaXRlX2NtZHFfcGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0LCB2YWx1ZSwgbWFzayk7
DQo+ICAJfSBlbHNlIHsNCj4gICNlbmRpZg0KPiAgCQl1MzIgdG1wID0gcmVhZGwocmVncyArIG9m
ZnNldCk7DQoNCg==

--__=_Part_Boundary_002_273085520.114540403
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMTItMjAmIzMyO2F0JiMzMjswMTowNyYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7VG8mIzMyO3N1cHBvcnQmIzMyO2hhcmR3YXJlJiMzMjt3aXRo
b3V0JiMzMjtzdWJzeXMmIzMyO0lEcyYjMzI7b24mIzMyO25ldyYjMzI7U29DcywmIzMyO2FkZCYj
MzI7YSYjMzI7cHJvZ3JhbW1pbmcNCiZndDsmIzMyO2Zsb3cmIzMyO3RoYXQmIzMyO2NoZWNrcyYj
MzI7d2hldGhlciYjMzI7dGhlJiMzMjtzdWJzeXMmIzMyO0lEJiMzMjtpcyYjMzI7dmFsaWQuJiMz
MjtJZiYjMzI7dGhlJiMzMjtzdWJzeXMmIzMyO0lEJiMzMjtpcw0KJmd0OyYjMzI7aW52YWxpZCwm
IzMyO3RoZSYjMzI7ZmxvdyYjMzI7d2lsbCYjMzI7Y2FsbCYjMzI7MiYjMzI7YWx0ZXJuYXRpdmUm
IzMyO0NNRFEmIzMyO0FQSXM6DQomZ3Q7JiMzMjtjbWRxX3BrdF9hc3NpZ24oKSYjMzI7YW5kJiMz
MjtjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKCkmIzMyO3RvJiMzMjthY2hpZXZlJiMzMjt0aGUmIzMy
O3NhbWUNCiZndDsmIzMyO2Z1bmN0aW9uYWxpdHkuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMy
O0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYyYjMzI7fCYjMzI7MzMmIzMyOysrKysrKysrKysrKysr
KysrKysrLS0tLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzI3
JiMzMjtpbnNlcnRpb25zKCspLCYjMzI7NiYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGRwX2NvbXAuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMN
CiZndDsmIzMyO2luZGV4JiMzMjtlZGM2NDE3NjM5ZTYuLjIxOWQ2NzczNWE1NCYjMzI7MTAwNjQ0
DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29t
cC5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBf
Y29tcC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTY2LDE0JiMzMjsrNjYsMzcmIzMyO0BAJiMzMjtzdHJ1
Y3QmIzMyO210a19kZHBfY29tcF9kZXYmIzMyO3sNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtj
bWRxX2NsaWVudF9yZWcmIzMyO2NtZHFfcmVnOw0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7
JiMzMjsNCiZndDsmIzMyOysjaWYmIzMyO0lTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpDQom
Z3Q7JiMzMjsrc3RhdGljJiMzMjt2b2lkJiMzMjttdGtfZGRwX3dyaXRlX2NtZHFfcGt0KHN0cnVj
dCYjMzI7Y21kcV9wa3QmIzMyOypjbWRxX3BrdCwmIzMyO3N0cnVjdCYjMzI7Y21kcV9jbGllbnRf
cmVnJiMzMjsqY21kcV9yZWcsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMy
O2ludCYjMzI7b2Zmc2V0LCYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7dmFsdWUsJiMzMjt1bnNp
Z25lZCYjMzI7aW50JiMzMjttYXNrKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytvZmZzZXQmIzMy
Oys9JiMzMjtjbWRxX3JlZy0mZ3Q7b2Zmc2V0Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMz
MjsoY21kcV9yZWctJmd0O3N1YnN5cyYjMzI7IT0mIzMyO0NNRFFfU1VCU1lTX0lOVkFMSUQpJiMz
Mjt7DQomZ3Q7JiMzMjsraWYmIzMyOyhtYXNrJiMzMjs9PSYjMzI7R0VOTUFTSygzMSwmIzMyOzAp
KQ0KJmd0OyYjMzI7K2NtZHFfcGt0X3dyaXRlKGNtZHFfcGt0LCYjMzI7Y21kcV9yZWctJmd0O3N1
YnN5cywmIzMyO29mZnNldCwmIzMyO3ZhbHVlKTsNCiZndDsmIzMyOytlbHNlDQomZ3Q7JiMzMjsr
Y21kcV9wa3Rfd3JpdGVfbWFzayhjbWRxX3BrdCwmIzMyO2NtZHFfcmVnLSZndDtzdWJzeXMsJiMz
MjtvZmZzZXQsJiMzMjt2YWx1ZSwmIzMyO21hc2spOw0KJmd0OyYjMzI7K30mIzMyO2Vsc2UmIzMy
O3sNCiZndDsmIzMyOysvKiYjMzI7b25seSYjMzI7TU1JTyYjMzI7YWNjZXNzLCYjMzI7bm8mIzMy
O25lZWQmIzMyO3RvJiMzMjtjaGVjayYjMzI7bW1pbmZyb19vZmZzZXQmIzMyOyovDQomZ3Q7JiMz
MjsrY21kcV9wa3RfYXNzaWduKGNtZHFfcGt0LCYjMzI7MCwmIzMyO0NNRFFfQUREUl9ISUdIKGNt
ZHFfcmVnLSZndDtwYV9iYXNlKSk7DQomZ3Q7JiMzMjsraWYmIzMyOyhtYXNrJiMzMjs9PSYjMzI7
R0VOTUFTSygzMSwmIzMyOzApKQ0KJmd0OyYjMzI7K2NtZHFfcGt0X3dyaXRlX3NfdmFsdWUoY21k
cV9wa3QsJiMzMjtDTURRX1RIUl9TUFJfSURYMCwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO0NNRFFfQUREUl9MT1cob2Zmc2V0KSwmIzMyO3ZhbHVlKTsNCiZn
dDsmIzMyOytlbHNlDQomZ3Q7JiMzMjsrY21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVlKGNtZHFf
cGt0LCYjMzI7Q01EUV9USFJfU1BSX0lEWDAsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjtDTURRX0FERFJfTE9XKG9mZnNldCksJiMzMjt2YWx1ZSwmIzMyO21hc2spOw0KJmd0OyYjMzI7
K30NCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrI2VuZGlmDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsm
IzMyO3ZvaWQmIzMyO210a19kZHBfd3JpdGUoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KmNtZHFf
cGt0LCYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7dmFsdWUsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO3N0cnVjdCYjMzI7Y21kcV9jbGllbnRfcmVnJiMzMjsqY21kcV9yZWcsJiMzMjt2
b2lkJiMzMjtfX2lvbWVtJiMzMjsqcmVncywNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
dW5zaWduZWQmIzMyO2ludCYjMzI7b2Zmc2V0KQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsm
IzMyOyNpZiYjMzI7SVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCiZndDsmIzMyOyYjMzI7
aWYmIzMyOyhjbWRxX3BrdCkNCiZndDsmIzMyOy1jbWRxX3BrdF93cml0ZShjbWRxX3BrdCwmIzMy
O2NtZHFfcmVnLSZndDtzdWJzeXMsDQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtjbWRxX3JlZy0mZ3Q7b2Zmc2V0JiMzMjsrJiMzMjtvZmZzZXQsJiMzMjt2YWx1
ZSk7DQomZ3Q7JiMzMjsrbXRrX2RkcF93cml0ZV9jbWRxX3BrdChjbWRxX3BrdCwmIzMyO2NtZHFf
cmVnLCYjMzI7b2Zmc2V0LCYjMzI7dmFsdWUsJiMzMjtHRU5NQVNLKDMxLCYjMzI7MCkpOw0KJmd0
OyYjMzI7JiMzMjtlbHNlDQomZ3Q7JiMzMjsmIzMyOyNlbmRpZg0KJmd0OyYjMzI7JiMzMjt3cml0
ZWwodmFsdWUsJiMzMjtyZWdzJiMzMjsrJiMzMjtvZmZzZXQpOw0KJmd0OyYjMzI7QEAmIzMyOy04
NSw4JiMzMjsrMTA4LDcmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfZGRwX3dyaXRlX3JlbGF4ZWQo
c3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KmNtZHFfcGt0LCYjMzI7dW5zaWduZWQmIzMyO2ludCYj
MzI7dmFsdWUsDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7I2lmJiMzMjtJU19SRUFD
SEFCTEUoQ09ORklHX01US19DTURRKQ0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KGNtZHFfcGt0KQ0K
Jmd0OyYjMzI7LWNtZHFfcGt0X3dyaXRlKGNtZHFfcGt0LCYjMzI7Y21kcV9yZWctJmd0O3N1YnN5
cywNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2NtZHFfcmVn
LSZndDtvZmZzZXQmIzMyOysmIzMyO29mZnNldCwmIzMyO3ZhbHVlKTsNCiZndDsmIzMyOyttdGtf
ZGRwX3dyaXRlX2NtZHFfcGt0KGNtZHFfcGt0LCYjMzI7Y21kcV9yZWcsJiMzMjtvZmZzZXQsJiMz
Mjt2YWx1ZSwmIzMyO0dFTk1BU0soMzEsJiMzMjswKSk7DQomZ3Q7JiMzMjsmIzMyO2Vsc2UNCiZn
dDsmIzMyOyYjMzI7I2VuZGlmDQomZ3Q7JiMzMjsmIzMyO3dyaXRlbF9yZWxheGVkKHZhbHVlLCYj
MzI7cmVncyYjMzI7KyYjMzI7b2Zmc2V0KTsNCiZndDsmIzMyO0BAJiMzMjstOTgsOCYjMzI7KzEy
MCw3JiMzMjtAQCYjMzI7dm9pZCYjMzI7bXRrX2RkcF93cml0ZV9tYXNrKHN0cnVjdCYjMzI7Y21k
cV9wa3QmIzMyOypjbWRxX3BrdCwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO3ZhbHVlLA0KJmd0
OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyNpZiYjMzI7SVNfUkVBQ0hBQkxFKENPTkZJR19N
VEtfQ01EUSkNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhjbWRxX3BrdCkmIzMyO3sNCiZndDsmIzMy
Oy1jbWRxX3BrdF93cml0ZV9tYXNrKGNtZHFfcGt0LCYjMzI7Y21kcV9yZWctJmd0O3N1YnN5cywN
CiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyO2NtZHFfcmVnLSZndDtvZmZzZXQmIzMyOysm
IzMyO29mZnNldCwmIzMyO3ZhbHVlLCYjMzI7bWFzayk7DQomZ3Q7JiMzMjsrbXRrX2RkcF93cml0
ZV9jbWRxX3BrdChjbWRxX3BrdCwmIzMyO2NtZHFfcmVnLCYjMzI7b2Zmc2V0LCYjMzI7dmFsdWUs
JiMzMjttYXNrKTsNCiZndDsmIzMyOyYjMzI7fSYjMzI7ZWxzZSYjMzI7ew0KJmd0OyYjMzI7JiMz
MjsjZW5kaWYNCiZndDsmIzMyOyYjMzI7dTMyJiMzMjt0bXAmIzMyOz0mIzMyO3JlYWRsKHJlZ3Mm
IzMyOysmIzMyO29mZnNldCk7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRl
bHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGll
cyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIg
c3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_273085520.114540403--

