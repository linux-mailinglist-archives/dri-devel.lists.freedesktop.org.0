Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD39B5A61
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 04:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF1910E0CF;
	Wed, 30 Oct 2024 03:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uUDRqVaw";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RJnUg0tI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A74110E0CF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 03:30:43 +0000 (UTC)
X-UUID: 550f7cfa966f11efbd192953cf12861f-20241030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=zcjL4DHqderZFLEAGqKaxdwkMr1oBsRAJVgjSsBjKC8=; 
 b=uUDRqVawiujgYotS5A8sKvMrz0QGiLhWXs/X4Q8tWkyHqH+FslVuwQhWp51VJxU21koZBT/69EvPjtCrar6lOm/IQyt+ZD+PenGbXVSxaR652fQZUURANbnpGOb+kxyBkwvWtOkGETZt5sW+KFAXEIvpcKW5Jh5fbdc1YgxR+h0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:cf8d631d-b642-4435-b937-8f68021db017, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:faa74107-7990-429c-b1a0-768435f03014,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 550f7cfa966f11efbd192953cf12861f-20241030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 98559639; Wed, 30 Oct 2024 11:30:38 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Oct 2024 11:30:36 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 11:30:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5qTVRuZuLRluzXXOIA1sxglyR+czjw9h1f3wjw/svoCJFFKxmnNvZYKcmVrtXO0aanji0DKG4WyHcZrfg0oQr2ifUUXSAUyE7etbWOPLuGC0K3WjKLwtszOpGzQLp/oDlDxYQv2v9Dyw+DU6wx8Lfj1vUKzEojGtOrlm4gtVHscEjiwYgoFG55TWVYwtbnjQSV2qvTJLpNPzwZt+dYyeYPXJjfdJ6ly4a7c9VTZcrjh/2ZGUlW38nZdYs/uRzXbKRgJRs9eBEpm1Qs3+1uuaNHwp9Jz73NdvUC0b26p/4G5bjGUdnzMj9UexWU/pZBKJyXpvOD3GjfJeoy2nLB6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3JeB48puCw6IcP18BCZ47h3gEVMlwpNl1k2u8kFEzQ=;
 b=Jydg5Uig/t4UGyOVc0NNyM+eDRTUzn75zDQZKgS7251A+x/sr6PqLxHY7ziWOVuZYfMNj7p/qmZmYCkrDFzD96+T1EyvC9DFBl7c8iGbhuyYKXNTzO+kF3hFmZsn0N2W+kHDFxUc8x15FVj/oTuYFUFfGzpn+bI041apw2S1xxr++qponHxXV+CfkJRcE+6qQZ44Kj+H0BWrimu1IsiVElgMMUn4jJw8fuGt/9dCiKKWAS2CKPktKsAUQ1XIRv1oiap7ZtHh9L1GvrLyknqZIVZZ+cmoOkH4CqbTaXTP5iFKgqWSRj3sei5yVoFMO+ZLPowUy55dzSVkpzj3LEDjbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3JeB48puCw6IcP18BCZ47h3gEVMlwpNl1k2u8kFEzQ=;
 b=RJnUg0tIyf6aY+JR9H7j6WbkXUsS8rm/8WIy5iHZQhJwOPDbxuzyvRsaK9I4Av+PCE38+aazRq53XLc2C5IyYG46ps7W/GDlutXhlS5nYzynR3ytJbqXSD8efiR2fMyO4hS+7Jsrma1E99wYminUAdo5X7Y2wLZSXreJtBr8teI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8029.apcprd03.prod.outlook.com (2603:1096:101:16e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 03:30:34 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Wed, 30 Oct 2024
 03:30:34 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
Thread-Topic: [PATCH] drm/mediatek: Drop dependency on ARM
Thread-Index: AQHbKfOlKgrWu8XeBkaWOJ8UqtA9E7KepD+A
Date: Wed, 30 Oct 2024 03:30:34 +0000
Message-ID: <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
References: <20241029111309.737263-1-wenst@chromium.org>
In-Reply-To: <20241029111309.737263-1-wenst@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8029:EE_
x-ms-office365-filtering-correlation-id: 6f501929-5442-43e2-aced-08dcf89336ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Wm1VZWFaYVFnRERselB0M3B3WmJ0Tmdub1hXTGxVN2FnZ3crb20ySGd3ZjFu?=
 =?utf-8?B?dUNvR2Ntc1dZWVVmdUl0eFBDM0xlZ2VkWmh3dmpYZDRUaVQrYVl4WUU1SDBH?=
 =?utf-8?B?bVZHVndHODUzRmRaaHpCbnBTV3dQZG5xVDJha0M5UjdLc1pRUTRjWWI5bGpE?=
 =?utf-8?B?bGEvWThHSFhPcXJqd0laWEtUUEUrWXV2U1BUYWdTQUFQdmZILzJmQXE0MUNM?=
 =?utf-8?B?QmFDOU8vQktRbXJwUVhvZVE3RFl4YXBBRExiZnZzWGc0ZUluRkNaYlZHckRW?=
 =?utf-8?B?V2JHUUZjcEp2ZjhOMFc5MEloa05qQ0loZkpiWE0wTFo1eHAwdnhKVGpNYjhl?=
 =?utf-8?B?T1pvbCtKcElKTkNVR2Y1Y0JWYTZDbHlHaXlXMDk4Qmt1dG5PYkpGMVlNWG5j?=
 =?utf-8?B?c0s1MTNMZjYwQ2FUUTZOaWRBSXU3RFE3Yi9hVUlnYVZvSkxhaDVhT1NiUlJr?=
 =?utf-8?B?R1RSdzhUaVJEU2RnMEVPRlZLMENmL2c2bW8rZi9WYVRLK0xEYTJJeTJKT0dN?=
 =?utf-8?B?Qm5OWEZSeFl3cGJSdGpPWmdwc2VEam9jYzNMZVRVYjBSNXZQaHU1dmQ5S3JC?=
 =?utf-8?B?R2lRKzhvUWcwS0M1bFpMaitSYVJPc3YyVlBZaXVtZGRQMWdxRzVTNjVOZVJG?=
 =?utf-8?B?cm10NUtIU1FUa0NIblpudDhiS1ZkSXZ6QWh2bUVaVTVvamhhY3V5Ry9hY2Jr?=
 =?utf-8?B?MHJMSkloWm1udklOWkNabm5Xa2lvTU9kRkcvN2dnMkdkaHRaY1hlbTFFTk1t?=
 =?utf-8?B?MVJDcTJBNFVZb3RDbHB4RkF6MkZhRC9aSUhwM1dLWlBKdU9ud09kTEthZTJx?=
 =?utf-8?B?N0FZWHg4TnNyT0xNVTkwYy9kdkVzQ1RsZHhOWUpRK0FwNHErc25tZUVqWXE3?=
 =?utf-8?B?Tmc0eWxWZG1hREJ6SVdNVlJoRG13QUliSjFPcHR5eTVONWFYaDE1NUF4UVh5?=
 =?utf-8?B?ZWNXZjBEcTJrZU0vaWhTQWVSTW1nbDR5bnQ2aDUzRnRtU1RSNEtkU3JEc3lK?=
 =?utf-8?B?U1JxWDRrdUdKTGxNakhmblBQZVd2WmpUUDRMaVRrQlV2dERraWVWaUtXQW1L?=
 =?utf-8?B?TjA3M0JNWit1US9KOU9CSlg1aEhMWUlIV2xpVTFRcVo1MHJWbzhrMzlZZUJr?=
 =?utf-8?B?bEgvQXpNVy9USjQ4ZFNiaHpkMVZYSHprWi81RmNhT3pzeXBPeGNqSHlZMkJa?=
 =?utf-8?B?ejlmZEI2aVp1dVQrcHhCd3RDM2pEWjJ1VUFvQkJVeUI0Y1l1YVppVHh2TWc1?=
 =?utf-8?B?Rm1VeVFmU2V2ekZLU2NaSEFrb1hjTm1SNFpxZ25CcEkzblBKR3RmaU1aN25W?=
 =?utf-8?B?M093VjRoMDJuUlQ4UGxUaWtMcXd5bStscjRXYWN2UE52Vmt1U01zQTQyTTFB?=
 =?utf-8?B?aUlrYWJWZXpWRGVzWSt1MnFVWXgvdmRaZUFUUmRodTVLa01rL1hURlZITmVi?=
 =?utf-8?B?a3pqVHZzOXZHVk9zaGpyM3VkYmhENEtUUFVBODM1V2RlTFNMdDJLL0xlcXAv?=
 =?utf-8?B?bnZYNURnRFhORjlVZmFpRmMyd1ZSZXk2QWI2aEd0U21weWYrWHpIek1hWVNs?=
 =?utf-8?B?eWxnRldzZmZwMHRjM20wd2xHOVgzNEVwam14NHBaWHhEaGJrUXdHc0ZKT25X?=
 =?utf-8?B?bjJuQ3d5dy95N053QWtHTDRURUl4SUtFS3A0TXlKZnNxakZNM3oxWHplZFF6?=
 =?utf-8?B?L0c4ZnZEbXZVdVJFdlFCOWxxdkxsTTgrZStpbE5aTnhqMEtDQU1UTzNoQkhs?=
 =?utf-8?B?V1QzVmtPaHpRc1dhL04zaXpMdllxYjk4d2JDRWVjTjJ2Z2krM2NCZjRVYmFX?=
 =?utf-8?Q?hLo/r2ExbRy90qkUQikb9sX6KjUngCt5a4ebY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mnd2ODZFa3lyVE8xSXBVMTRiT2ZtZjlGUXFpeHlleTVsSTAweXdZMFlMRjM0?=
 =?utf-8?B?U2NDK0NwTkJJQnlEd1ZTTUt1ZVIyb3o4a0R6M21zby94d2NSTGw2VEJoR2Za?=
 =?utf-8?B?cmNDWllvMTRNek5oQVE1MWVtL1BQOS9lMVQwYnk5WU9IVDhZNmpJQ25JQ0R3?=
 =?utf-8?B?czFidno2WEJGMXhHOEpvK0Z1Yy9jajFzSHZ1VEIvc0dsU0JDZUlzR1RRL1hn?=
 =?utf-8?B?WWxRY0xRQU9qNkNXQnNqTFFsTnpKTDlIdHBIaVhteUNqN0FOYTBXUWhFWTh6?=
 =?utf-8?B?VlQwMjNHMXlzcUFCQkhZTXVsQmVhMTZ4NDQ3T0o4R0I3MmsrbWRtaEpwNTd6?=
 =?utf-8?B?NXl0c1ZVbzNjVlgxNkdSckRLeFlIcE1VSTlFc3NPejZtelRVL2xIR040dTNZ?=
 =?utf-8?B?eEJMcmxuQzh2Um5KWEdXR2I1VnNRQmtYekdUSVozRXY1Q2ZnWDQzelNNa3pP?=
 =?utf-8?B?VTZmczBnalhqSnZkSC84cXcrV1ZKU09QSThieG8zQVdudWFEVHBic01sR3Az?=
 =?utf-8?B?ck0wSWw0a0R5WVBVaW1CMWJVeDU2RWlRZ09SdFAyRTN6MzBxOStwT21Qd2k1?=
 =?utf-8?B?aEN5eHg4dld2VFZyQThjMDVVZEtIOWovMjhseEtsZHVzdEIrWm5QVXBJT0hF?=
 =?utf-8?B?d1BMTFlzT0VBYUx6eDBETHJHV0VieDgzOHRuSXRqVW55d2RyYzN0ZWVxYUNp?=
 =?utf-8?B?MFhwRC9ZNWxRQ0JvbjJPQ2syK3dZY1lTZlVBSFJ6VEJUTlIzQTk0YW5VM3hX?=
 =?utf-8?B?MTJPdEw2TUducGdYWTVDandxQmZIU0FIcndZRHJnWjhtN2lrdE92K2FrWWFy?=
 =?utf-8?B?MHcxM01OTnJ3MEtFMW5jOW9zM2xHUDdrdnJrRWpRdXgxRlNGU0V1SEVRRS9s?=
 =?utf-8?B?Qm5nRWtUMldiMmlubHNDQlpickJpUGsyYzhNWkxOaWYzZUNoMjNsMlg4dEw0?=
 =?utf-8?B?c3VFL21pMFR3M2U4aGM5dHdVc3JyS1RtdExZdzBYeVNlUExpbVl3QTFvTzQ4?=
 =?utf-8?B?K0RMdTdtbWJaNU9YZ2ZCZzM2NDVsSndOeGt6bWF6M3lBSVVTZkNtVUYxWVh3?=
 =?utf-8?B?Ylo3NUNCY2J0TVpMWVVzWHpaNFFVT0ZoRkF1NkJTUGdVK0xVRHEwMlBXTTNE?=
 =?utf-8?B?dU5JcHVNRFVKZ1J6dWYwSEdZcTUxNlQ5bHYwcUNySm0weUNrcDh6YURlRnZE?=
 =?utf-8?B?c0V2M3lIcXVuNlFDUXFwaU9KUjBuWjBaV2IzUUczUEJpemx2a1lzMk9wcDZU?=
 =?utf-8?B?cTRRUEdWRkFoYW0xVmNVRnFKRUJINHg2MzN5WitvanZBOU9hOW9oU3owRzNi?=
 =?utf-8?B?TGZraVdOemdsZkpVa29SOEIrcU5UVzAzcEE4cjk3enVpV3JSRHgxSSt0R0lt?=
 =?utf-8?B?ZmdDMUdTNC94RzhnKzFXbDdqc0grZUdqU0ZrcnczSUloUW1WakNQS2IyTlV1?=
 =?utf-8?B?dGtQdzRGRnhSMDhHM29CQ0RrWUREc1QyODI5dXl5eWFWQkYzWEM2THVZVDVV?=
 =?utf-8?B?YXNIM2xsak4wT3lxSDhyejU0QTExano3c0xrYmdwRkhIQ1pFTVY5UUNrS3Rt?=
 =?utf-8?B?RnY1M3d0QnpPcmcxNlJ3YWI0TE1UejdIWXUzUFI3OEJNZVQ2NDh0RGtIdTZi?=
 =?utf-8?B?dW5weHlacDFZb0xveXU1UUFKcnF3MkRsNThsS29EVGtPZGNQMitsK3U3N3pL?=
 =?utf-8?B?eGV2TXpMYUhiLzJaT3Z2b0RrOS9zWjBkckhxVnkwaGloc3BhYWhWVEthLzh1?=
 =?utf-8?B?cmVURllraEtldUExR2ZwWm5ROWY1QVJyUVh2ejEwRzV1UW8rTXVVVzNSTGRC?=
 =?utf-8?B?ZEo2RTdWWURNcVVhcXR5VnNDdjB2Y1FCK3M0UHo0eFByaXQ4ejhVTElsRnc1?=
 =?utf-8?B?ZEZZcmJZUS9iRjdiN2dBMmlna3pkY3NpRkx6TGkvN054VDhLL3NMcFVZNENW?=
 =?utf-8?B?Y1NOTnFKQmRGSHBDTEFHVVhZcmEvS3FiZDRZblJQUk9iblhKRXBpd1IzK1kw?=
 =?utf-8?B?RDJaRUUySkRucTRVUFBLNnhabm5Nd0thRFFXZ01VcE1NOGJ4WHp2MzkvT1Jk?=
 =?utf-8?B?aDRnbjVNQkNrWTJ3TXYzZExScG1XYnBiT3R2UUlCWnNpSUZ2aXEyU1dGaGFP?=
 =?utf-8?Q?Df2KD4vN2xaeLzkUP26PFLX1g?=
Content-ID: <311B449075F487408009368763FE99F2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f501929-5442-43e2-aced-08dcf89336ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 03:30:34.2826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YcQpbyc6GJ2zBQRQiqO2xj+/Aah+aLG9zg1Ysvnp4uxpfixguKIpKIzcrYxqdb7eLUZrD6foiK6SwdmLrMsuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8029
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.742300-8.000000
X-TMASE-MatchedRID: csPTYAMX1+FjbyiFvYNuKLhzZI/dfrdOjLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2bc297PAGtWbTDXgcUlCNo3XeJBXr7CDUQgW
 7EhUD4pBQudb+O1ri3iHNDkynRZA9TozbukWPHUt7k1ZHmKLF7Z4Q/QN0mu6WXFNHTRKzg/qArq
 oIZrVn1+MJ4Tm/iUfkkZOl7WKIImrS77Co4bNJXVZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJGqKs
 0J9+ISSsagzgkxuJlV6ml1AyTvffQFGvLzvXi1DftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.742300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C2B96BB1B95554E4E946AFDC6B23376ED152246AE196F50A9944703022063CCD2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_286579496.863805882"
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

--__=_Part_Boundary_005_286579496.863805882
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIENoZW4teXU6DQoNCk9uIFR1ZSwgMjAyNC0xMC0yOSBhdCAxOToxMyArMDgwMCwgQ2hlbi1Z
dSBUc2FpIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IFRoZSByZWNlbnQgYXR0ZW1wdCB0byBtYWtlIHRo
ZSBNZWRpYVRlayBEUk0gZHJpdmVyIGJ1aWxkIGZvciBub24tQVJNDQo+IGNvbXBpbGUgdGVzdHMg
bWFkZSB0aGUgZHJpdmVyIHVuYnVpbGRhYmxlIGZvciBhcm02NCBwbGF0Zm9ybXMuIFNpbmNlDQo+
IHRoaXMgaXMgdXNlZCBvbiBib3RoIEFSTSBhbmQgYXJtNjQgcGxhdGZvcm1zLCBqdXN0IGRyb3Ag
dGhlIGRlcGVuZGVuY3kNCj4gb24gQVJNLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCg0KSSBmaW5kIHRoaXMgZGF5cyBhZ28sIGJ1dCBJIGRvbid0IGtub3cgdGhl
cmUgaXMgc29tZW9uZSB3aG8gYXBwbHkgaXQuDQpMZXQgdGhpcyBwYXRjaCBnbyB0aHJvdWdoIGRy
bS1taXNjIHRyZWUgd2hpY2ggYWxyZWFkeSBoYXMgdGhlIGJ1ZyBwYXRjaC4NCg0KUmVnYXJkcywN
CkNLDQoNCg0KPiANCj4gRml4ZXM6IGQyZGIwYjhmZDcwYiAoImRybS9tZWRpYXRlazogQWxsb3cg
YnVpbGQgd2l0aCBDT01QSUxFX1RFU1Q9eSIpDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4tWXUgVHNh
aSA8d2Vuc3RAY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gSXQgbG9va3MgbGlrZSB0aGUgY3VscHJp
dCBjb21taXQgd2FzIG1lcmdlZCB0aHJvdWdoIHRoZSBkcm0tbWlzYyB0cmVlLg0KPiBTbyBwbGVh
c2UgbWVyZ2UgdGhpcyBvbiB0b3AgQVNBUC4NCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvS2NvbmZpZyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9L
Y29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcNCj4gaW5kZXggMmUwZTdj
NDA3OWI2Li5mNDk2ZTZjZmRmZTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+
IEBAIC0yLDcgKzIsNyBAQA0KPiAgY29uZmlnIERSTV9NRURJQVRFSw0KPiAgICAgICAgIHRyaXN0
YXRlICJEUk0gU3VwcG9ydCBmb3IgTWVkaWF0ZWsgU29DcyINCj4gICAgICAgICBkZXBlbmRzIG9u
IERSTQ0KPiAtICAgICAgIGRlcGVuZHMgb24gKEFSQ0hfTUVESUFURUsgJiYgQVJNKSB8fCBDT01Q
SUxFX1RFU1QNCj4gKyAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTUVESUFURUsgfHwgQ09NUElMRV9U
RVNUDQo+ICAgICAgICAgZGVwZW5kcyBvbiBDT01NT05fQ0xLDQo+ICAgICAgICAgZGVwZW5kcyBv
biBIQVZFX0FSTV9TTUNDQyB8fCBDT01QSUxFX1RFU1QNCj4gICAgICAgICBkZXBlbmRzIG9uIE9G
DQo+IC0tDQo+IDIuNDcuMC4xNjMuZzEyMjZmNmQ4ZmEtZ29vZw0KPiANCg==

--__=_Part_Boundary_005_286579496.863805882
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtDaGVuLXl1Og0KDQpPbiYjMzI7VHVlLCYj
MzI7MjAyNC0xMC0yOSYjMzI7YXQmIzMyOzE5OjEzJiMzMjsrMDgwMCwmIzMyO0NoZW4tWXUmIzMy
O1RzYWkmIzMyO3dyb3RlOg0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQ
bGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4m
IzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbCYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYj
MzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlJiMzMjtyZWNlbnQmIzMyO2F0dGVtcHQmIzMyO3RvJiMz
MjttYWtlJiMzMjt0aGUmIzMyO01lZGlhVGVrJiMzMjtEUk0mIzMyO2RyaXZlciYjMzI7YnVpbGQm
IzMyO2ZvciYjMzI7bm9uLUFSTQ0KJmd0OyYjMzI7Y29tcGlsZSYjMzI7dGVzdHMmIzMyO21hZGUm
IzMyO3RoZSYjMzI7ZHJpdmVyJiMzMjt1bmJ1aWxkYWJsZSYjMzI7Zm9yJiMzMjthcm02NCYjMzI7
cGxhdGZvcm1zLiYjMzI7U2luY2UNCiZndDsmIzMyO3RoaXMmIzMyO2lzJiMzMjt1c2VkJiMzMjtv
biYjMzI7Ym90aCYjMzI7QVJNJiMzMjthbmQmIzMyO2FybTY0JiMzMjtwbGF0Zm9ybXMsJiMzMjtq
dXN0JiMzMjtkcm9wJiMzMjt0aGUmIzMyO2RlcGVuZGVuY3kNCiZndDsmIzMyO29uJiMzMjtBUk0u
DQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29t
Jmd0Ow0KDQpJJiMzMjtmaW5kJiMzMjt0aGlzJiMzMjtkYXlzJiMzMjthZ28sJiMzMjtidXQmIzMy
O0kmIzMyO2RvbiYjMzk7dCYjMzI7a25vdyYjMzI7dGhlcmUmIzMyO2lzJiMzMjtzb21lb25lJiMz
Mjt3aG8mIzMyO2FwcGx5JiMzMjtpdC4NCkxldCYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO2dvJiMz
Mjt0aHJvdWdoJiMzMjtkcm0tbWlzYyYjMzI7dHJlZSYjMzI7d2hpY2gmIzMyO2FscmVhZHkmIzMy
O2hhcyYjMzI7dGhlJiMzMjtidWcmIzMyO3BhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7ZDJkYjBiOGZkNzBiJiMzMjsoJnF1b3Q7ZHJtL21l
ZGlhdGVrOiYjMzI7QWxsb3cmIzMyO2J1aWxkJiMzMjt3aXRoJiMzMjtDT01QSUxFX1RFU1Q9eSZx
dW90OykNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtDaGVuLVl1JiMzMjtUc2FpJiMzMjsm
bHQ7d2Vuc3RAY2hyb21pdW0ub3JnJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjtJdCYjMzI7
bG9va3MmIzMyO2xpa2UmIzMyO3RoZSYjMzI7Y3VscHJpdCYjMzI7Y29tbWl0JiMzMjt3YXMmIzMy
O21lcmdlZCYjMzI7dGhyb3VnaCYjMzI7dGhlJiMzMjtkcm0tbWlzYyYjMzI7dHJlZS4NCiZndDsm
IzMyO1NvJiMzMjtwbGVhc2UmIzMyO21lcmdlJiMzMjt0aGlzJiMzMjtvbiYjMzI7dG9wJiMzMjtB
U0FQLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9L
Y29uZmlnJiMzMjt8JiMzMjsyJiMzMjsrLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtj
aGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL0tjb25maWcmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcNCiZn
dDsmIzMyO2luZGV4JiMzMjsyZTBlN2M0MDc5YjYuLmY0OTZlNmNmZGZlMCYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcNCiZndDsm
IzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KJmd0OyYjMzI7
QEAmIzMyOy0yLDcmIzMyOysyLDcmIzMyO0BADQomZ3Q7JiMzMjsmIzMyO2NvbmZpZyYjMzI7RFJN
X01FRElBVEVLDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7dHJpc3RhdGUmIzMyOyZxdW90O0RSTSYjMzI7U3VwcG9ydCYjMzI7Zm9yJiMzMjtNZWRpYXRl
ayYjMzI7U29DcyZxdW90Ow0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO2RlcGVuZHMmIzMyO29uJiMzMjtEUk0NCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO2RlcGVuZHMmIzMyO29uJiMzMjsoQVJDSF9NRURJQVRFSyYj
MzI7JmFtcDsmYW1wOyYjMzI7QVJNKSYjMzI7fHwmIzMyO0NPTVBJTEVfVEVTVA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGVwZW5kcyYjMzI7b24mIzMyO0FS
Q0hfTUVESUFURUsmIzMyO3x8JiMzMjtDT01QSUxFX1RFU1QNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkZXBlbmRzJiMzMjtvbiYjMzI7Q09NTU9OX0NM
Sw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2RlcGVu
ZHMmIzMyO29uJiMzMjtIQVZFX0FSTV9TTUNDQyYjMzI7fHwmIzMyO0NPTVBJTEVfVEVTVA0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2RlcGVuZHMmIzMy
O29uJiMzMjtPRg0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDcuMC4xNjMuZzEyMjZmNmQ4ZmEt
Z29vZw0KJmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4
dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBO
b3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4g
dGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUg
Y29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVt
cHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQg
dG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55
IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcg
b3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBi
eSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkg
DQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRo
aXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJl
cGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBh
bmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3Ro
ZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_286579496.863805882--

