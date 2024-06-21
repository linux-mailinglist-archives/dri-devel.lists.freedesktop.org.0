Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD1911CB8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64B810E14D;
	Fri, 21 Jun 2024 07:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QaPAjand";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="AHozUldp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CC710E14B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:27:32 +0000 (UTC)
X-UUID: b6cfe74a2f9f11ef8da6557f11777fc4-20240621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mEZl9ShcoMK/nkWBnr4mgIrGHfhT592wFY2BAE4kS1k=; 
 b=QaPAjandc3oFPfWuTYcgVJZJDHlhwfRJDtXd4CuCe3SgZGeYaStLXjLe7WlwWKDU7SHDcwLNieTsGMFa48oHWr4KW5TNZDu5O6S4zs84HJO2eDnug7xE21K8lQ1KEjpzmCpglJCV0HKIGfes8f3f1a1VXZKr1h6OLFKqoHdnIgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:416173bf-e979-459c-b8bb-14dbd0ef0b57, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:97dcdc88-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b6cfe74a2f9f11ef8da6557f11777fc4-20240621
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2007383069; Fri, 21 Jun 2024 15:27:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jun 2024 15:27:26 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jun 2024 15:27:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxTkerzFw7eteN7IyAApqoJKcMaoHYN1SP6OM+RewNNeSHpB4swXsm0Dz2rOESX7VyAnxJ1Yh4EdMPwH1v3iOQ1gHnsJq3Yckjkn0sdseiIfsYJDhlP3c+VsZms73WzHMHw6sISV60dNCn8baSkt9tcCWZqPeXw2ZXSF2qILC2SKNDeHpmdraMwsnjJ9MffKVFxmiw9yoJaO2SEDQ8eSJSaavcth6S2cj0ymhpcujSnbQ7rUp+d70mTc7+qkBJ0UiocXRc5seUs0CsJ9ycA6EyB2r/oG3i4WPblP2/uAPJ9WDb8LQV0i6mpQCOuKKoN5cVgDcCZ2mGqJPInN1X7ZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNzIoNNJBjLQUcWhRHEfitPfrNgx7qgR/UhQn4rbNow=;
 b=QU3zzo1BJyPB7rOT3XCCyIeDwXKl94VqKNKpYBQZYEWCvJy9QcIbLt3X1izHt08vTgWq4+wvRjOYZiDpITB0qrZGHfuLlcXeuA7BvTvgpmcmgP5z96/wnACcSQN28jaR1I0VHprupOrgqwzranyjlNAcSbipHBho99f4WEDMya/uwlQ3DAmLqXHp0+YgMcKqUiQH9v9Zsmtn6XFBaREncjdOIHMWJKcZxDW/9AHCCF49afIqnBawTWiNCbr6kBtQlZRuvack445gFP9pAg7bWRe6Hrg6Fezf1lAZ8RQIhusmKsEL1UjL14yULUPji9IV508JuSNliDoBrILLKJRLsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNzIoNNJBjLQUcWhRHEfitPfrNgx7qgR/UhQn4rbNow=;
 b=AHozUldpeflhIFgPkGALpoiLOBkoz4hXNlqLT1thCfG7ld6/rTdp50vka4EmJkWz/KrUwA87p4ZvNog/Rk6k2j7skQnhsGlgRIIXH8N1Fjkwi4/fN6FxR1OyO28Y8Y3i7Gwp2upHDQM7kGT033gZlrit82HdlTOu++IugdRX0ew=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PUZPR03MB7044.apcprd03.prod.outlook.com (2603:1096:301:11c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Fri, 21 Jun
 2024 07:27:24 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 07:27:24 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 14/16] drm/mediatek: Support CRC in display driver
Thread-Topic: [PATCH v8 14/16] drm/mediatek: Support CRC in display driver
Thread-Index: AQHat/PH8mziL+xpxE6Xbq1BFRhh6rHDXgsAgA6K94A=
Date: Fri, 21 Jun 2024 07:27:24 +0000
Message-ID: <46773c645267530f9f8656fc105672919197a60e.camel@mediatek.com>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-15-shawn.sung@mediatek.com>
 <bfb9375a4338b12a729bccf2254cb3f1cfa62a17.camel@mediatek.com>
In-Reply-To: <bfb9375a4338b12a729bccf2254cb3f1cfa62a17.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PUZPR03MB7044:EE_
x-ms-office365-filtering-correlation-id: fe13c0d7-cbe4-4e43-34cf-08dc91c3987e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|1800799021|376011|7416011|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?RmpZZWRoL2s4MkF5eS9RVmJMTWNrUDIvTTNJT1NFTlc5RXVva1Z4RG96MUxF?=
 =?utf-8?B?M25NcHcrWDhicU1SUkxROEtmMDNZd0lRWGd0d05zQjltb0pDUDlCaEU4Y3Ir?=
 =?utf-8?B?RmlTYzhjeXRnc3BaMXdLdnZPMERWMVZYa2srM3hMTlMxMjJWZFlGZG9HQ0NW?=
 =?utf-8?B?NGxwZ1ZBTU9ITUNqSUYxeTBJOVJUN0IzaWNtVVJxZW9GT3dOanFML2UvOUZo?=
 =?utf-8?B?SlRoRUxiT04vVkRlMjZkdDh3ZzZmMHlkVUsvMHRxdGx4YVl4c3REeVZ4aEJw?=
 =?utf-8?B?MDJVdERXVGZwMjBJM1ozUU8rd0lUZys4Z2lja1NseDNOUmhXaVd4R2NjKzlB?=
 =?utf-8?B?b1dZeVFyb2RuaVJVMEJDY1BkNjdkVG4zbXEyeXd1KzlxOVFkOHQyaXEvSmx0?=
 =?utf-8?B?NFJUdWd0UGJmdWl5Z0NlYlkwSGZNRm8zWERtbFBHUFJBSkNMOFVrOFI1Yi9o?=
 =?utf-8?B?VTlKTTZlV0lTOHptRVROU3BLclMvbTRraU5ROU9YVnRheHAxSm0wZmw3aU1U?=
 =?utf-8?B?dkRxMENvTzZ1SVdZS2FseFlqR3BFZHlxQWdZdFFOczUzb25LR0FCa2R2dHEy?=
 =?utf-8?B?ZE52U2JySmljeFM2cm0yS3JnU3VMTGJoblNHcE1rZmZkc2lEOHRTV0JMMHl5?=
 =?utf-8?B?YzVVbklhNzcwNXNWTlZvdUVOTk9QZGwxSGpUU1VFL0tmZTRsMldvSS9FeEpr?=
 =?utf-8?B?M2c4K0pldHFBMFlYWEliVHc0cldzRys4T2h4R0JBcCs1cXVwSVdGemhQNUNq?=
 =?utf-8?B?VmZGZWd3S0QwZjNqaVNhWksyTGFwTmlUcDJaRjU4WDA3WHE5MWVKV3ZuU1p1?=
 =?utf-8?B?K3E2V3h6UFNXVTdpR1BtQmp5Y3UrZk9Fa1JWM2JFZUMrbkZYWmJhdTFQeHdo?=
 =?utf-8?B?MjBRVnhGL2VDZFhZWGdpUDM5dEtXcTREdGVoVUVWdlVUVGV1TU5NMktRSWlz?=
 =?utf-8?B?Vmx4Ym9sRVBqYkxMMDlqd2x2aHphbnNVT1N2clp5aE51b1J6MW1ZZitkdFcy?=
 =?utf-8?B?WkZYR2kyUTBRVXRBbloxSVhvK0x1MlRZYzhxVjFMQTluRTByb2h5djFSTGZ4?=
 =?utf-8?B?WE1wa1JiR2k2Y1Z0WEI0c1lSOUxkOVAxaCs2bXVQNnNnNzB2WHEzQk1lMkQv?=
 =?utf-8?B?d2piZW5EZmN3clpiWWNlTk1SWC9hZUczV09DWm1jUlpleVFQcVJNZmJYRk5T?=
 =?utf-8?B?TlE4WW5lTEVHQjNUR0FFUC9obXNPV2lGS0FabEdLYWR2TjJRMEJ6bDVtM3Uv?=
 =?utf-8?B?SUF2TlkvQlpmM1pvOUdESjcxWW9KS3l4cGV0RW41bGZFNFFJbXMzNHJCRUlp?=
 =?utf-8?B?VmhseWZ2cndRemJ3N24ycGNsNGoyelBvMUpkTlRvb3JkUXhsWENZUE1xMS9C?=
 =?utf-8?B?MFR2eVRpK0t5aC91cFFRdFNtZUNpL3VWeEo1K3BWZHJOenhjR2pBOHZiVmE4?=
 =?utf-8?B?L0ZlM3VEZCtTT2tCWWk1NGRObjFoMzBLL0lHb0VXMXJiNVhwYmtvalk2UkI3?=
 =?utf-8?B?REw5ZWwxRTVOVmczNWtrWUpIejR6ak9XUzBETDJtTFV3MFoyQzZZOTlBN0hD?=
 =?utf-8?B?NzlkM21Jc0tmanFGZUp5OUJKZmxHZy85NE00SzlNa0dUcHQrRkJpTUV4SUNE?=
 =?utf-8?B?MnBRYjFqd1ZjUW9MZ1UzYnBpd0FFUHl5SkozaGNqb0RlV1UrZndhblBlVjR6?=
 =?utf-8?B?S21oL0RvZGJFNFNQRVdCT3hINkozMVRMaXJ6SkQxd0JJdGhkSnVwZUlCbTNw?=
 =?utf-8?B?WkFwODhDdURnamxnM0M2aHE1d3gyY01HVjV0Y2tuQ3g2MFFzbEpzcU9Zdmwx?=
 =?utf-8?Q?uWsNWUC1Gp9Pu35W8knSPdx9A1LoQkEpVdEUU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011)(7416011)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmJzZy9Cc3FJN0dkSjlINldQU0c0aUlmOE9pdHgzeXo5Y3BYaUpjTll5YlZ3?=
 =?utf-8?B?Z0pRME9VV2ZlMVNGUm9HS2x2U2dpR0RVTnJCWWNUTVRRaHM1bEFUbHphM0R6?=
 =?utf-8?B?TkRUSWJMYkFlOU5HZ1VadGpDREpSZzdxeE9VOXhRYnR6dnZPdm9sK1VUSkdv?=
 =?utf-8?B?RWhVdCs3RHhyUzVqbU0vRHJFai9PdStIL3RTVEU4MGk5OU9scGduNG9ZazFN?=
 =?utf-8?B?Q2ZSUHpRU1dBMzloMmVFb0l3RFhGNEphYU5PRHhkYitwcEFmMW1VVUJOOTZz?=
 =?utf-8?B?MXAwRVJBZ0JlMXlNZnZxMStvYjZuUG5ESmJCVXBlWGJXOUxHMFBiOFA3Y1JJ?=
 =?utf-8?B?ZjhEZlE5djFEWTZ1V3BCT0FqOVBGS0JCVHcrSHhqYmloRkZ1V2M1RVNZcGZE?=
 =?utf-8?B?UDBibDNPbnlhbkZtZVNTZlN2c1UzcExMSjVKZGZvN0IzUzNlZ3d4UndveTJm?=
 =?utf-8?B?TFkyZXEycGNhRHNyejVMTmVHZGVJWlQrcEgvdERkcCtYSlhMVmRXck5nbFpP?=
 =?utf-8?B?TlJYMnZQamo4bHA3VnFrN3ZwN05TRmM0Yk93U3pSSnlXTSt6N1YzcDBueWo4?=
 =?utf-8?B?ZHdrYzVOMWo0OVJnUEgrQVBoQzhRR0JFQzRRTjRNbEtIUElBWlJyOXhZaEtZ?=
 =?utf-8?B?OWVlV21aaVRqZWZDWnd3WllOSVRoczVXQW9yQm9ZcWgxd1I4d1BoMW1rbWla?=
 =?utf-8?B?YmhOZHJEZ1FsaSsrSmFoc0NoOUFWWm0zbGdvVUxpV1dGdHR1UTF2RzdQNWMw?=
 =?utf-8?B?T2hTZHl5NmQ4UXluVkNwUnhORkZwYkxDZkc5VklHMytnRndLN0RZMHhVT3Jn?=
 =?utf-8?B?VXAzUVg0TUhnM3k4RTZuQlp4WVJ4YVdtM0xzazlwbVVSQ3hNU211RmJEd2Nw?=
 =?utf-8?B?UEgzakdWVmY5QmpPSVFOdmRaSXl3d1M3a1IrYWVaTnh5SXNLWGIraVppM0JD?=
 =?utf-8?B?azdqS1YzTkIzcGdnZnUzcmY2dHE2TGVBbDMxYWN2UHVkMDVSdWdsMEh4YjNq?=
 =?utf-8?B?NDJDU0NxenBOK0FIOW5VeHpHbFBzT3RoNlY2SnFBWXdWWjZvczhnU3V5ZVBE?=
 =?utf-8?B?UTZNVDRvMXovSEp4ZnVZL3dWN2UwZjhiRGNYQUplK1NHdkQ0bmREUDJicFFl?=
 =?utf-8?B?akVFOU9odUVubnJib2ZPUWo4SnFON2tzSVp4SUZNQUZQQzdnV0tjdHNmYlI2?=
 =?utf-8?B?OWsyNWY1Mm9IenI2ZW1GaSsrNjFlb1ozRE56cVFaaDMvRXFseXIxVVppb3pF?=
 =?utf-8?B?dTF4OWFqclRuS0drZ0lxZnFZWEdVdUd1Z3E4cHhOdTRZMkNWNXR2ZEpZTWF6?=
 =?utf-8?B?V2U5dFRycDlmb0h1SDF4aDlla0dmM0U1bWhLOU5sVHk4SUJ5VkJhZFBQamo2?=
 =?utf-8?B?MDZlbzdieTh3emNIb0w3QUZQZTRsRHB6R0I2Q3M0OUtsZFJrTDUvbHk1akhl?=
 =?utf-8?B?SnZCeTVZZ05xWjFGT2pJWDRwUVk5NW1xWDN2bTNDZzJDRVNyK3dFMWlFYk5I?=
 =?utf-8?B?UkhTTDBpNTJCQnlnWCtja0lWdWtRRnVWWHNGSm4wK1pzMU9YUCtvYWl5SVNQ?=
 =?utf-8?B?Ukx6WVNncjhMZVIxRUpieVcyaDFzOTFqS2xpZmFibFg4VGhCTTF0K0lrZTBi?=
 =?utf-8?B?WHo4MEo0ZkxhYWgyWjhqQUVVdU9paGh3WDhwSFZuRkxMVUpWZzNRUVUwTnhH?=
 =?utf-8?B?ZmtheEM5eXBOdTlFbG92UGlYYzY0ZUZWaDFsL1BwUkFlMWJsam1nSkh4Nlh1?=
 =?utf-8?B?RkQySENheDV5QTI5KzFpUGw2MlpRcnh5dm4rY2VKdW1tUExKdkpPdWVqVGN6?=
 =?utf-8?B?YkR4VEJveUVxWFlqbXFMUDdtUS9WNHZweGR6TVVkQk5Pbi9COU9vWHFwaFJz?=
 =?utf-8?B?T1BQOGdjMzZ5NzVCWlh3eFhUSEFSUTlwMnZDYzhSbkROMTMzNWs1Z0ZhbjB0?=
 =?utf-8?B?UXBSemE5SHFtR1hlWW5Kb1ZUK1Y1VkcvODRoa1lhcjg0SXU4cXk0ZGtlRllX?=
 =?utf-8?B?am5RTEYzK3o5T1FPRm5Ja3JWMEg5Y1h3ZkdxQmhMampxWEhoTzFOVlROODc1?=
 =?utf-8?B?WmlQaE5vckl3NklDSlJCV0ZFM3Z3ZVdIbVZPN090MzFTUlBXdVN2c0hmbjQ4?=
 =?utf-8?B?eW9nTUpiaW9RanF0Y1FyUFJGRGFWQUpkaGw1YkZhRHk4M0h2dDd4RE5ZZmg5?=
 =?utf-8?B?Z0E9PQ==?=
Content-ID: <EC5464DCF20C3E48B5B392ACF623EEA7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe13c0d7-cbe4-4e43-34cf-08dc91c3987e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 07:27:24.2651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DY3W0HGYgBfAc7C+wWpftJHgmhV2ToDDAJI3/OSLccKw1UUl7J5bJxfCnWkzOrrBm1Du3cvBCb2lZ9Ejh+m850cbftbT0uUVtX2wZVom910=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7044
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.498400-8.000000
X-TMASE-MatchedRID: scwq2vQP8OEOwH4pD14DsPHkpkyUphL9kd8i2lgND8uSO6So6QGgyvHf
 YecLBVzPaB+AA4s32d+1q48Rh4wr9QgpNt5EgFbMA5rdNgLWPkIxmbT6wQT2a0nea3aZRK8VFkK
 JYPndg9vuGpDZdzOQn8t3+x4RStaZEJHpQ2Y9lUS4jAucHcCqnZyDP1rrUdvh+yNYYwngrxb3AS
 8m+aRStp2sF1v7M6i2nq5ataBcL0WR9GF2J2xqM9IFVVzYGjNKnCGS1WQEGtCm4/3ODjvukSq2r
 l3dzGQ1tPWjpfl+Gwes+fA5inGes1YdzCEWPGL1sXLSx2kS9XXMgXuTCPsD2g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.498400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D63F1732FD7C155D7931B2CE5AB49FA449D6A4306C369BB248BFFF44A475BB2D2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_608565659.27834267"
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

--__=_Part_Boundary_009_608565659.27834267
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFdlZCwgMjAyNC0wNi0xMiBhdCAwMToyMiArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBTaGF3bjoNCj4gDQo+IE9uIFRodSwgMjAyNC0wNi0wNiBhdCAx
NzoyNiArMDgwMCwgU2hhd24gU3VuZyB3cm90ZToNCj4gPiBGcm9tOiBIc2lhbyBDaGllbiBTdW5n
IDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBSZWdpc3RlciBDUkMgcmVsYXRl
ZCBmdW5jdGlvbiBwb2ludGVycyB0byBzdXBwb3J0DQo+ID4gQ1JDIHJldHJpZXZhbC4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVr
LmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiANCj4gPiArc3RhdGljIHZvaWQg
bXRrX2NydGNfY3JjX3dvcmsoc3RydWN0IGt0aHJlYWRfd29yayAqYmFzZSkNCj4gPiArew0KPiA+
ICsJc3RydWN0IGRybV92Ymxhbmtfd29yayAqd29yayA9IHRvX2RybV92Ymxhbmtfd29yayhiYXNl
KTsNCj4gPiArCXN0cnVjdCBtdGtfY3J0YyAqbXRrX2NydGMgPQ0KPiA+ICsJCWNvbnRhaW5lcl9v
Zih3b3JrLCB0eXBlb2YoKm10a19jcnRjKSwgY3JjX3dvcmspOw0KPiA+ICsJc3RydWN0IG10a19k
ZHBfY29tcCAqY29tcCA9IG10a19jcnRjLT5jcmNfcHJvdmlkZXI7DQo+ID4gKw0KPiA+ICsJaWYg
KCFjb21wKSB7DQo+ID4gKwkJRFJNX1dBUk4oIiVzKGNydGMtJWQpOiBubyBjcmMgcHJvdmlkZXJc
biIsDQo+ID4gKwkJCSBfX2Z1bmNfXywgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSk7
DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmIChtdGtfY3J0Yy0+YmFz
ZS5jcmMub3BlbmVkKSB7DQo+ID4gKwkJdTY0IHZibGFuayA9IGRybV9jcnRjX3ZibGFua19jb3Vu
dCgmbXRrX2NydGMtPmJhc2UpOw0KPiA+ICsNCj4gPiArCQljb21wLT5mdW5jcy0+Y3JjX3JlYWQo
Y29tcC0+ZGV2KTsNCj4gPiArDQo+ID4gKwkJLyogY291bGQgdGFrZSBtb3JlIHRoYW4gNTBtcyB0
byBmaW5pc2ggKi8NCj4gPiArCQlkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCZtdGtfY3J0Yy0+YmFz
ZSwgdHJ1ZSwgdmJsYW5rLA0KPiA+ICsJCQkJICAgICAgIGNvbXAtPmZ1bmNzLT5jcmNfZW50cnko
Y29tcC0NCj4gPiA+ZGV2KSk7DQo+IA0KPiBJdCBzZWVtcyB0aGF0IHlvdSBjb3VsZCByZWdlbmVy
YXRlIGNtZHEgcGFja2V0IGZvciBjcmMgaGVyZS4gU28gY3J0Yw0KPiBhdG9taWMgZmx1c2ggYW5k
IGNyYyBjb3VsZCB1c2UgdGhlIHNhbWUgbWFpbGJveCBjaGFubmVsLg0KPiANCj4gUmVnYXJkcywN
Cj4gQ0sNCj4gDQpJdCBzZWVtcyB0aGF0IGl0J3MgcG9zc2libGUgdG8gY2FsbCBtdGtfZGRwX3Vw
ZGF0ZV9jb25maWcoKSBoZXJlIGFuZA0KYWRkIGEgbmV3IHBlbmRpbmdfcmVhZF9jcmMgZmxhZyB0
byBpbnNlcnQgdGhlIHJlYWQgY3JjIHJlbGF0ZWQNCmluc3RydWN0aW9ucyBpbnRvIHRoZSBzYW1l
IGNtZHFfcGt0IGFuZCB1c2UgdGhlIHNhbWUgbWFpbGJveCBjaGFubmVsIGFzDQphdG9taWMgZmx1
c2guDQoNCkknbGwgdHJ5IHRoaXMsIGJ1dCBJJ2xsIG5lZWQgc29tZSB0aW1lIHRvIG1vZGlmeSB0
aGlzIGFuZCB0ZXN0IGl0IHRvIA0KbWFrZSBzdXJlIG5vIG90aGVyIGlzc3VlcyBhcmlzZS4NCg0K
UmVnYXJkcywNCkphc29uLUpoIExpbg0KDQo+ID4gKw0KPiA+ICsJCWRybV92Ymxhbmtfd29ya19z
Y2hlZHVsZSgmbXRrX2NydGMtPmNyY193b3JrLCB2YmxhbmsgKw0KPiA+IDEsIHRydWUpOw0KPiA+
ICsJfSBlbHNlIHsNCj4gPiArCQljb21wLT5mdW5jcy0+Y3JjX3N0b3AoY29tcC0+ZGV2KTsNCj4g
PiArCX0NCj4gPiArfQ0KPiA+ICsNCg==

--__=_Part_Boundary_009_608565659.27834267
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7V2VkLCYjMzI7MjAy
NC0wNi0xMiYjMzI7YXQmIzMyOzAxOjIyJiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGksJiMzMjtTaGF3
bjoNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO1RodSwmIzMyOzIwMjQtMDYtMDYmIzMyO2F0
JiMzMjsxNzoyNiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3VuZyYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7
c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO1JlZ2lzdGVyJiMzMjtDUkMmIzMyO3JlbGF0ZWQmIzMyO2Z1bmN0aW9uJiMzMjtw
b2ludGVycyYjMzI7dG8mIzMyO3N1cHBvcnQNCiZndDsmIzMyOyZndDsmIzMyO0NSQyYjMzI7cmV0
cmlldmFsLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2Zm
LWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRp
YXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOw0KJmd0OyYjMzI7
W3NuaXBdDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
K3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2NydGNfY3JjX3dvcmsoc3RydWN0JiMzMjtrdGhyZWFk
X3dvcmsmIzMyOypiYXNlKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7K3sNCiZndDsmIzMyOyZndDsmIzMy
OytzdHJ1Y3QmIzMyO2RybV92Ymxhbmtfd29yayYjMzI7KndvcmsmIzMyOz0mIzMyO3RvX2RybV92
Ymxhbmtfd29yayhiYXNlKTsNCiZndDsmIzMyOyZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19jcnRj
JiMzMjsqbXRrX2NydGMmIzMyOz0NCiZndDsmIzMyOyZndDsmIzMyOytjb250YWluZXJfb2Yod29y
aywmIzMyO3R5cGVvZigqbXRrX2NydGMpLCYjMzI7Y3JjX3dvcmspOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7K3N0cnVjdCYjMzI7bXRrX2RkcF9jb21wJiMzMjsqY29tcCYjMzI7PSYjMzI7bXRrX2NydGMt
Jmd0O2NyY19wcm92aWRlcjsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMy
OytpZiYjMzI7KCFjb21wKSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7K0RSTV9XQVJOKCZxdW90
OyVzKGNydGMtJWQpOiYjMzI7bm8mIzMyO2NyYyYjMzI7cHJvdmlkZXImIzkyO24mcXVvdDssDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjtfX2Z1bmNfXywmIzMyO2RybV9jcnRjX2luZGV4KCZhbXA7
bXRrX2NydGMtJmd0O2Jhc2UpKTsNCiZndDsmIzMyOyZndDsmIzMyOytyZXR1cm47DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2lm
JiMzMjsobXRrX2NydGMtJmd0O2Jhc2UuY3JjLm9wZW5lZCkmIzMyO3sNCiZndDsmIzMyOyZndDsm
IzMyOyt1NjQmIzMyO3ZibGFuayYjMzI7PSYjMzI7ZHJtX2NydGNfdmJsYW5rX2NvdW50KCZhbXA7
bXRrX2NydGMtJmd0O2Jhc2UpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYj
MzI7K2NvbXAtJmd0O2Z1bmNzLSZndDtjcmNfcmVhZChjb21wLSZndDtkZXYpOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7Ky8qJiMzMjtjb3VsZCYjMzI7dGFrZSYjMzI7
bW9yZSYjMzI7dGhhbiYjMzI7NTBtcyYjMzI7dG8mIzMyO2ZpbmlzaCYjMzI7Ki8NCiZndDsmIzMy
OyZndDsmIzMyOytkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCZhbXA7bXRrX2NydGMtJmd0O2Jhc2Us
JiMzMjt0cnVlLCYjMzI7dmJsYW5rLA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7Y29tcC0mZ3Q7ZnVuY3MtJmd0O2NyY19lbnRyeShjb21wLQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0O2RldikpOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJdCYjMzI7
c2VlbXMmIzMyO3RoYXQmIzMyO3lvdSYjMzI7Y291bGQmIzMyO3JlZ2VuZXJhdGUmIzMyO2NtZHEm
IzMyO3BhY2tldCYjMzI7Zm9yJiMzMjtjcmMmIzMyO2hlcmUuJiMzMjtTbyYjMzI7Y3J0Yw0KJmd0
OyYjMzI7YXRvbWljJiMzMjtmbHVzaCYjMzI7YW5kJiMzMjtjcmMmIzMyO2NvdWxkJiMzMjt1c2Um
IzMyO3RoZSYjMzI7c2FtZSYjMzI7bWFpbGJveCYjMzI7Y2hhbm5lbC4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7UmVnYXJkcywNCiZndDsmIzMyO0NLDQomZ3Q7JiMzMjsNCkl0JiMzMjtzZWVtcyYjMzI7
dGhhdCYjMzI7aXQmIzM5O3MmIzMyO3Bvc3NpYmxlJiMzMjt0byYjMzI7Y2FsbCYjMzI7bXRrX2Rk
cF91cGRhdGVfY29uZmlnKCkmIzMyO2hlcmUmIzMyO2FuZA0KYWRkJiMzMjthJiMzMjtuZXcmIzMy
O3BlbmRpbmdfcmVhZF9jcmMmIzMyO2ZsYWcmIzMyO3RvJiMzMjtpbnNlcnQmIzMyO3RoZSYjMzI7
cmVhZCYjMzI7Y3JjJiMzMjtyZWxhdGVkDQppbnN0cnVjdGlvbnMmIzMyO2ludG8mIzMyO3RoZSYj
MzI7c2FtZSYjMzI7Y21kcV9wa3QmIzMyO2FuZCYjMzI7dXNlJiMzMjt0aGUmIzMyO3NhbWUmIzMy
O21haWxib3gmIzMyO2NoYW5uZWwmIzMyO2FzDQphdG9taWMmIzMyO2ZsdXNoLg0KDQpJJiMzOTts
bCYjMzI7dHJ5JiMzMjt0aGlzLCYjMzI7YnV0JiMzMjtJJiMzOTtsbCYjMzI7bmVlZCYjMzI7c29t
ZSYjMzI7dGltZSYjMzI7dG8mIzMyO21vZGlmeSYjMzI7dGhpcyYjMzI7YW5kJiMzMjt0ZXN0JiMz
MjtpdCYjMzI7dG8mIzMyOw0KbWFrZSYjMzI7c3VyZSYjMzI7bm8mIzMyO290aGVyJiMzMjtpc3N1
ZXMmIzMyO2FyaXNlLg0KDQpSZWdhcmRzLA0KSmFzb24tSmgmIzMyO0xpbg0KDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZHJtX3ZibGFua193b3JrX3NjaGVkdWxlKCZh
bXA7bXRrX2NydGMtJmd0O2NyY193b3JrLCYjMzI7dmJsYW5rJiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsxLCYjMzI7dHJ1ZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfSYjMzI7ZWxzZSYjMzI7ew0K
Jmd0OyYjMzI7Jmd0OyYjMzI7K2NvbXAtJmd0O2Z1bmNzLSZndDtjcmNfc3RvcChjb21wLSZndDtk
ZXYpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K30NCiZndDsmIzMyOyZndDsmIzMyOyt9DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29u
ZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQg
ZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8g
YmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3Ig
Y29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1
bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpi
ZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMg
ZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5
aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQg
ZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIg
cGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_608565659.27834267--

