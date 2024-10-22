Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B69A9EAA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B1810E636;
	Tue, 22 Oct 2024 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PISTFp20";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="r8h6iBa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C0C10E636
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:37:46 +0000 (UTC)
X-UUID: 47e8cbd8905911efbd192953cf12861f-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5lBU2hZsRdu44rKqd7N8TKeJnNjHPb1149OZnB2F2aA=; 
 b=PISTFp20SrO5h6Xtgl30BC3pVPxhOIliNPf7Sj0xskuDpkkZGRFM9Esj3IFoorYvTyBFwmSB0PaSn5FVI/a4onLcsswwcPP4J7wEJg7hNScmwdeSSQXHk3W76fXtE8tghniOkDnlfdbtpaKQFnqwmHko2doWsONppL/m9eyniLs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:d906f16e-e1a7-467e-9c35-bc9a84587b60, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:7364300d-1043-475c-b800-3262c01ea3e5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 47e8cbd8905911efbd192953cf12861f-20241022
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1858459063; Tue, 22 Oct 2024 17:37:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 02:37:39 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 17:37:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ7G0osOSr7fc7pWYeCV8ffm1Xjw//AdhjUyYM6OkMvhT7D4yMtnJdF4yqr5pmLtBUK3nVXydMOfIefj/e9Lx6IMuk8zrzgOfzv7QmEn5F9tEW+FlTkXVbl8Akm43vIzGGqaP30YeIBnauBHJE24TrTZsvjpgU4WDdjcvjdN5L366JKYmF1TVdMf8wnJobwTCkFi9FE4VwHmCXmGQJvXo4NkfDh+ZgzW8bY1PkUVJLCDTix0+7x3zdn6VIUejLG/9uiy1Xj5D2nU+iW96DfE4t+72TSuJRqjRVtSPkJlQ9Zv0JJuN9M0RGPZ8d/X1FYs/mLfjrHqwBIoFG74LGqIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X66bBHKT9f/4AFyzDYIcBIpvSCYj+vexFdDGkItd+LM=;
 b=tMLqzL7CSsMZZNiiT11Z7fyqS+ely12J20qDysY/F6SF/g8xh7WU1Tbv5tgIRjtKlnOleh0Wck3fyteYz5uXB2vsrJ34i24HLEvpYBxYibUcT+zVRVtWylPDQ40cDn2FN1Af41Je85scJ21UUuryPA35JTmp/8LtHrxoIyxYz2lB+6eYkBnp8tE+QQwGEw9O6ZbHOKFyp7Hg7eTsGIFgTTLXLgUwqJfzQksQsS6Kv4wUBMG9Or2A2I2dAwZOxmQigxfposT35CpB7cGxgM1SQPErp3ai5wHRyLsLFdKrU2Nh/LpsLHWTcLPU5RjIulMofW/qBy0PBpvWdozMy39rtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X66bBHKT9f/4AFyzDYIcBIpvSCYj+vexFdDGkItd+LM=;
 b=r8h6iBa+EHsx7S3WtrCxyWfAtNRQ4DoUgT53rb5HeNcBRE2PCVnwodq2cC7kLrJYcuT3rGfChDka+GCnug06WiPyIlbd6dkAr0PCKz7Nc8YHj6C9nuaPMKgMGzw9H9fDfqDnk2DdYtl48wfcpYqpx562UJ8IW/DR179arTPQINY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8768.apcprd03.prod.outlook.com (2603:1096:101:208::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 09:37:36 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 09:37:36 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com"
 <airlied@gmail.com>, "yuanhsinte@chromium.org" <yuanhsinte@chromium.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dianders@chromium.org"
 <dianders@chromium.org>
Subject: Re: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
Thread-Topic: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
Thread-Index: AQHbH9YyuB7wZxXG9UO5j9efzdzKCrKSjGEA
Date: Tue, 22 Oct 2024 09:37:36 +0000
Message-ID: <e4aca41996a991cb64f7a6f2e94c3c1985164890.camel@mediatek.com>
References: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
In-Reply-To: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8768:EE_
x-ms-office365-filtering-correlation-id: f2077078-e594-42dc-2cf6-08dcf27d29f0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N0poRzJ2TkU0Yi9ON0hhNVowditmTjN1dUhleS9ralZHbVFpVVVGcWVSWU95?=
 =?utf-8?B?ckVPTnp3UVN2Rnk0TFpoNmdWNThNZytvSnE3aDluLzRqNWdVWW9JT1FWK2pX?=
 =?utf-8?B?SUxFTFBMYzRrY1pPdVdhSE9TSDdheXNHUE04ZTVqczZVM2RzOCtzKyswakZS?=
 =?utf-8?B?OUYzTnJpT0V6TmNwa2JMOVZyS3UvdGVaaXhKTTYwTWtqZDJvRzV0RmhPblRR?=
 =?utf-8?B?Z1VoaDBrMVZmdnU5QkExQ0xKanovSDhmUGJtMzhoam1wdm1iU3E0YkYvTDU1?=
 =?utf-8?B?RG9mSzlFWW5PVnl2dzl6QzQydm40UE5jRDNadUVQSjhUZXFUcC80d1NSNkFX?=
 =?utf-8?B?ckM0RVdzL2srMkc1ZlVaMFRDSVdmV3AwV0lDR0tWRmdCSk1HT1owa3RSWk4w?=
 =?utf-8?B?WFZ3TlFTSHpBamxPSTNaM3ZGRnBySTB0Z3kvNlcvTEhqVC9paGlUUmlsUWIw?=
 =?utf-8?B?bS82aGJUc3B4TFgzZGRiSCtQRS9XNzlucC8zU0xnaTZTYkkyRFFDRXdnYXp3?=
 =?utf-8?B?UExvRFZGN3RUUU4ycEVNeUNIcVhOQWNWUmgvVXlIZVdPV3ZLRVJvZU1GVFV6?=
 =?utf-8?B?Vkl5Q0czL0lLSE5ndmU3SnFTZzFSMFNIK1pDZGcxZjFBa3c5dm5Ob0pFM0FL?=
 =?utf-8?B?T1JwWjMwMjVZR2k3cVZaSWVJaFdiTG5ub3J1bGJxNE9ZZ1pESlpUOWdYd3ZD?=
 =?utf-8?B?VHF0eitpUG0wS21hN0FQNzFuSitJREJVSTU5aEZVcjJaaS84R3FES0V5RjdF?=
 =?utf-8?B?Qk5JNzBHY1VDbU9jb3I4NXBSY25ScXRaMTB3N2xsSGphbmY3bWNFOWJwbDdW?=
 =?utf-8?B?UUpPMFZGSkoxam9zd0N0Y2lPdzFVOHlkRFdHaXFaZE80dVNNRDdocFRhN3p2?=
 =?utf-8?B?Z0VZMVhNYytVZDNrYUhqWVpseElrQUUvdzFZSElUYjVyTWtudnVwR1pIKzVo?=
 =?utf-8?B?K1NpWkNrSFFhUHFCbTJnUFRBSmlvUmNFSGhqTmdjeHdEanRzTUZxRzhZUjYw?=
 =?utf-8?B?MjdpM3FmUG04cjJwc1puY3NsTDl1cGpKajBNNjJKVjRLSm1WaytLVEJQMEk3?=
 =?utf-8?B?TEEwbllmTS9SSUNjdDlzZU9INklUR0YvZlJnUDhaeDRFL1M2RHpkRGdhVDQ4?=
 =?utf-8?B?RGdtdVA4OGlqNWtEZUNFQSs1T21YYldFYkcrcC9xUG42UFRLMGZ3UDBMLzV0?=
 =?utf-8?B?K1RxdjQwNkEyUmpabDgvVWdCZEZ1bDZNNm9oY3B1V0NneUFJS0RpQUI2T1pm?=
 =?utf-8?B?cllOQjdpVkVZZmIyenpZRkdwSkVzeE4zV3JZajhVWkdBdmp3L0M0S2JtWk4v?=
 =?utf-8?B?dW1kalFaSUQ4ZXZvNXhESGFSUDBVVlVJeWdTTkdwL1JlOVJkNHVLNHpPa2RP?=
 =?utf-8?B?cVdnSUFXeTFuOE1mVGpsZEJibUpBTWpsdXlHVlJiZk40amZnUWxmcjk5NDFU?=
 =?utf-8?B?bTIrbUNFLzF5T0VkeDBNMk55cVFYR2o4a0NpNjBBT0ZqQ0ZEUmY3dllCdm5T?=
 =?utf-8?B?d2swTjBMVW03bUQvWDNKQXQ4Y1dTQzVVaEJtSU1NSTJkOUxuMlFoaGtJT1Qr?=
 =?utf-8?B?dVh5WDNuNFR6cm1HclRIakVlY0tVQkwwNGRqZk1WTzJicklNMVFRdjg0Q1Ax?=
 =?utf-8?B?RjhMeGh5SllNcXYwK0tKV3dsb01SZnNyRW9GWVAwVEgxVlZOd3BjSEFwdWVy?=
 =?utf-8?B?MXF5azRqb2ZUNXR1am5NdEpSM2Q2Vm4rUjRKUGw3dDVOQVNwQm9WbkZONjF2?=
 =?utf-8?B?dzNVTlhMOUxkRnFLVEE3SC9yY0g4YTNiK3lpKzdzSnAyMVhGMk1WbVRCUk94?=
 =?utf-8?B?WUFOalFQeVFlWVpSYVdLbitNeVJ4TDErWGxxaVRnZzFORklCZVZEbW93QjJN?=
 =?utf-8?Q?cfRpcuNoWtVaH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmpGQkM1UjhHbVZpWWE3UitheEp3QTZyaVBjTzBZSklIVzNQa2gzVlBkRDFv?=
 =?utf-8?B?UnB0Y2tDRm0xWldBK01oRjBVV2pzMDRPNzgwaU1vSzA1SVFJSDZRd3h3Zmpi?=
 =?utf-8?B?QnpOc1lTanE1c2wyQkFQeFhKYkZlZzlQRTM1QWttMkdwMWNSazl5SXd0NEJR?=
 =?utf-8?B?VnZPelVWZVJheWFSaWpWMnZ1ZUgvTC9uaW1YZ0d3MU03Q1RmTDdhNm1BZXhw?=
 =?utf-8?B?WjY1ekhzUUNuNzZxSVh4Ny9PUWg4MldJYWoyZWo2L1lCeHl3VHl0M0czUGYv?=
 =?utf-8?B?Slo4UlVjU3o5T0tSZy9VNGJlblJQendqLzAzcjFNemEwRlVVYXUrQjh2UXJG?=
 =?utf-8?B?WTdWckVVSys3YlA2QWZxSXhCbmRVajFvNXdROENXK1VHdnpqVFNOVXljaWI2?=
 =?utf-8?B?d3B2d2VWRko5MEdxYkpFaHJXVzdJeGlMTjErU29Ib3FNZXBBTHFLNzFwYTdK?=
 =?utf-8?B?LzdSeVdUd3J1UXZFMFUrQzVIN0VwNjlETEhLdnhZajVySWdwNnk3MWJDNTNE?=
 =?utf-8?B?Y1RHUmxMV2xjQ2ExeTVBQ1g3QnMwVnpLZG1Rd2cyOWZlbmdkdVZ1Q3VhY2Fs?=
 =?utf-8?B?akthVFoxM0NZem9xVUNHRmdQWjJENW5hV3crOVJVU0VIMWZYTDUwUFFYWHgx?=
 =?utf-8?B?YkVIa2paamlRTks1VFJJazVNTTd1SEJWWFRwZmRBUHhCV1g3QUJVd2FMZjYz?=
 =?utf-8?B?azdRZ09Cc2ZFUWhsU3FYbVpYTThHTXdRNmNVRXdES2x5TFhIK3VSYzgvZWVE?=
 =?utf-8?B?OVhMTE44S2x2eGFsc2J0dEIxWjRkZGpDVUM0NnpYTHJxcTJKSUN2NHVGN3VG?=
 =?utf-8?B?ampjaUVKU2VuQll0TlpLVEhQQjh3WnpCUnkrT1FCVTlJQmptbGhZeDVDbDJQ?=
 =?utf-8?B?bzZ6UVVLaHhrQU1GQmtiaVFMYjNIWVVpZGg1S3FjMXJZT1Rnc1d3T0x5cUVo?=
 =?utf-8?B?clNxZWl6WURRNXZuRGF6RFVWNlpjVFVEYUczOHRKcGIyWGFDOG8wVTFpaGMr?=
 =?utf-8?B?SlBGQTdvMzc1SWV5MjVVOVpNVm8ydUxGanlpNGZPYVhuZkFTVWV5TmltWXdR?=
 =?utf-8?B?THc0OFVTaG1yajFkY1RWY1dCd3RQbElscFJtc3ovOTlBOE5nRmVBT2dqdWFR?=
 =?utf-8?B?bW5tQ0lSZVRwNXlvOEZvV2tVUEpUUktrOEhXNG9mbG11YU8wNEJZU1JJMVFR?=
 =?utf-8?B?WXJwcTRrU0h3RnBLcGo1MEl3N3djOS83ZVBTaGJidHNEa2s1SzhzWjFhL3lO?=
 =?utf-8?B?UmNCb1RXbE93NjdLYWc2VVVzb1ZMN2NNb0NBUkxTY3NnaGpFMU43am12dkpF?=
 =?utf-8?B?dmtCM25ySllEWWQyVHlaVzd2MjBRQ2RXdkFyanVVaG84MDdROUQvN1hjaytm?=
 =?utf-8?B?WVI5SHNGMVc4Qzh4cGV4bXR6bUdhY1gvS2JDU29aa0Qyd29zN1RvdUhidVVw?=
 =?utf-8?B?a0ZQU1ZMb21HSUFnR09IbFZVWjR3M25kcEFPSHNRbjk0bFRSNjZudjdwT29W?=
 =?utf-8?B?YnA3NEtVQUtDSXVsd2R0Ly8yOEdvL0dEdjNFRDM0MEkzWTlxaWlzVDErM0Nx?=
 =?utf-8?B?VWZsd05ySUhiQzJudWdxbHZtMDNhQThDUzhqQmVyZlR1OTU5RUdSSmFweTVp?=
 =?utf-8?B?alo3YVBNdTNqY2xzSE1PMUVnM0JKOVlYbTdYM3JPc1hveldKdTN2S1ZIOVJW?=
 =?utf-8?B?OVAyWGtlMzBtTWtzdUVGVkJmZjNrYnBmeFdXWGx2L3NDVU02UytHMGpSRlgz?=
 =?utf-8?B?S3ExY1V4di83SHVsQXpKb0FyM0pOR1FyZ01HVTNJcWVLeUI2Q0dHbU5JNUp3?=
 =?utf-8?B?eVYxSFZtNnhkY1o1V0c1a0JvM3pxMmN3d0VheDFxbkU4V0llRkZtaFBGVEdz?=
 =?utf-8?B?V3NpSklycVVCTEVBdzZBZ2xaa2RLR3MzZ05XSnhsZW5vZmtHcEtDdndwdDZh?=
 =?utf-8?B?VldjKzFtNXFhNkdsRS9QMU5zdkZxQTNvZTFaaXlwcFNjeWc2VlhKK2crVm4w?=
 =?utf-8?B?ckZuL2REWUM4NmdreG0rTUlGQnNnY0tDOW9uZENvd0lSL3lHbFhzTTBjRHJY?=
 =?utf-8?B?WFowT3BJVVBNVzJsUUdmUkgvV1ZYQ25XcW9rUE5PL2ZnSGtnU0ZJOTlOdDBj?=
 =?utf-8?B?OHdkY0FyWlFicUgxbURJU3p4U3VBb3NyY2ozMXFJRnc5ZURnb0pHSWpYQ1Nt?=
 =?utf-8?B?dVE9PQ==?=
Content-ID: <D0934BCA39BD4247B9DEA01F571682BF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2077078-e594-42dc-2cf6-08dcf27d29f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 09:37:36.7636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6S35Ju5yOIHXyo9EqX0+E4OjogoaLoiVuP8TK46sg4sL0MpXp55eZtjXhZh4+XCchrZhgXZJQSJei2JjBUzSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8768
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1503690535.1392632610"
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

--__=_Part_Boundary_004_1503690535.1392632610
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaW4tdGU6DQoNCk9uIFdlZCwgMjAyNC0xMC0xNiBhdCAxNDoxNyArMDAwMCwgSHNpbi1U
ZSBZdWFuIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhl
IHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEluIGNvbW1pdCA5ZjQyOGI5NWFjODkgKCJkcm0v
bWVkaWF0ZWs6IEFkZCBuZXcgY29sb3IgZm9ybWF0IE1BQ1JPcyBpbg0KPiBPVkwiKSwgc29tZSBu
ZXcgY29sb3IgZm9ybWF0cyBhcmUgZGVmaW5lZCBpbiB0aGUgTUFDUk9zIHRvIG1ha2UgdGhlDQo+
IHN3aXRjaCBzdGF0ZW1lbnQgbW9yZSBjb25jaXNlLiBUaGF0IGNvbW1pdCB3YXMgaW50ZW5kZWQg
dG8gYmUgYSBuby1vcA0KPiBjbGVhbnVwLiBIb3dldmVyLCB0aGVyZSBhcmUgdHlwb3MgaW4gdGhl
c2UgZm9ybWF0cyBNQUNST3MsIHdoaWNoIGNhdXNlDQo+IHRoZSByZXR1cm4gdmFsdWUgdG8gYmUg
aW5jb3JyZWN0LiBGaXggdGhlIHR5cG9zIHRvIGVuc3VyZSB0aGUgcmV0dXJuDQo+IHZhbHVlIHJl
bWFpbnMgdW5jaGFuZ2VkLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4NCg0KPiANCj4gRml4ZXM6IDlmNDI4Yjk1YWM4OSAoImRybS9tZWRpYXRlazogQWRkIG5ldyBj
b2xvciBmb3JtYXQgTUFDUk9zIGluIE9WTCIpDQo+IFJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVy
c29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+IFJldmlld2VkLWJ5OiBNYXR0aGlhcyBCcnVn
Z2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVRlIFl1
YW4gPHl1YW5oc2ludGVAY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4g
LSBBZGQgbWlzc2luZyBSZXZpZXdlZC1ieSB0YWcNCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjQxMDE2LWNvbG9yLXYyLTEtNDZkYjVjNzhhNTRmQGNocm9taXVt
Lm9yZw0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBDbGFyaWZ5IHRoYXQgdGhlIGNvbW1pdCBn
ZXQgZml4ZWQgd2FzIGludGVuZGVkIHRvIGJlIGEgbm8tb3AgY2xlYW51cA0KPiAtIEZpeCB0aGUg
dHlwbyBpbiB0YWcNCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjQxMDE1LWNvbG9yLXYxLTEtMzViMDFmYTBhODI2QGNocm9taXVtLm9yZw0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDQgKystLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gaW5kZXggODliNDM5ZGNmM2E2YWY5ZjU3
OTk0ODdmZGMwZjEyOGE5YjVjYmU0YS4uMTYzMmFjNWMyM2Q4N2UxY2RjNDEwMTNhOWNmNzg2NDcy
OGRjYjYzYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0K
PiBAQCAtNjUsOCArNjUsOCBAQA0KPiAgI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9SR0IoMSA8PCAx
MikNCj4gICNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfQVJHQjg4ODgoMiA8PCAxMikNCj4gICNkZWZp
bmUgT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODgoMyA8PCAxMikNCj4gLSNkZWZpbmUgT1ZMX0NPTl9D
TFJGTVRfQUJHUjg4ODgoT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODggfCBPVkxfQ09OX0JZVEVfU1dB
UCkNCj4gLSNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfQkdSQTg4ODgoT1ZMX0NPTl9DTFJGTVRfQVJH
Qjg4ODggfCBPVkxfQ09OX0JZVEVfU1dBUCkNCj4gKyNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfQUJH
Ujg4ODgoT1ZMX0NPTl9DTFJGTVRfQVJHQjg4ODggfCBPVkxfQ09OX0JZVEVfU1dBUCkNCj4gKyNk
ZWZpbmUgT1ZMX0NPTl9DTFJGTVRfQkdSQTg4ODgoT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODggfCBP
VkxfQ09OX0JZVEVfU1dBUCkNCj4gICNkZWZpbmUgT1ZMX0NPTl9DTFJGTVRfVVlWWSg0IDw8IDEy
KQ0KPiAgI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9ZVVlWKDUgPDwgMTIpDQo+ICAjZGVmaW5lIE9W
TF9DT05fTVRYX1lVVl9UT19SR0IoNiA8PCAxNikNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDog
NzViNjA3ZmFiMzhkMTQ5ZjIzMmYwMWVhZTVlNjM5MmIzOTRkZDY1OQ0KPiBjaGFuZ2UtaWQ6IDIw
MjQxMDE1LWNvbG9yLWUyMDVlNzViNjRhYQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLSANCj4g
SHNpbi1UZSBZdWFuIDx5dWFuaHNpbnRlQGNocm9taXVtLm9yZz4NCj4gDQo=

--__=_Part_Boundary_004_1503690535.1392632610
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtIc2luLXRlOg0KDQpPbiYjMzI7V2VkLCYj
MzI7MjAyNC0xMC0xNiYjMzI7YXQmIzMyOzE0OjE3JiMzMjsrMDAwMCwmIzMyO0hzaW4tVGUmIzMy
O1l1YW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwm
IzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjts
aW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbCYjMzI7eW91JiMz
MjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMy
O2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0luJiMzMjtjb21taXQmIzMyOzlmNDI4Yjk1YWM4OSYj
MzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7bmV3JiMzMjtjb2xvciYjMzI7Zm9y
bWF0JiMzMjtNQUNST3MmIzMyO2luDQomZ3Q7JiMzMjtPVkwmcXVvdDspLCYjMzI7c29tZSYjMzI7
bmV3JiMzMjtjb2xvciYjMzI7Zm9ybWF0cyYjMzI7YXJlJiMzMjtkZWZpbmVkJiMzMjtpbiYjMzI7
dGhlJiMzMjtNQUNST3MmIzMyO3RvJiMzMjttYWtlJiMzMjt0aGUNCiZndDsmIzMyO3N3aXRjaCYj
MzI7c3RhdGVtZW50JiMzMjttb3JlJiMzMjtjb25jaXNlLiYjMzI7VGhhdCYjMzI7Y29tbWl0JiMz
Mjt3YXMmIzMyO2ludGVuZGVkJiMzMjt0byYjMzI7YmUmIzMyO2EmIzMyO25vLW9wDQomZ3Q7JiMz
MjtjbGVhbnVwLiYjMzI7SG93ZXZlciwmIzMyO3RoZXJlJiMzMjthcmUmIzMyO3R5cG9zJiMzMjtp
biYjMzI7dGhlc2UmIzMyO2Zvcm1hdHMmIzMyO01BQ1JPcywmIzMyO3doaWNoJiMzMjtjYXVzZQ0K
Jmd0OyYjMzI7dGhlJiMzMjtyZXR1cm4mIzMyO3ZhbHVlJiMzMjt0byYjMzI7YmUmIzMyO2luY29y
cmVjdC4mIzMyO0ZpeCYjMzI7dGhlJiMzMjt0eXBvcyYjMzI7dG8mIzMyO2Vuc3VyZSYjMzI7dGhl
JiMzMjtyZXR1cm4NCiZndDsmIzMyO3ZhbHVlJiMzMjtyZW1haW5zJiMzMjt1bmNoYW5nZWQuDQoN
ClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0
Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7OWY0MjhiOTVhYzg5JiMzMjsoJnF1
b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtuZXcmIzMyO2NvbG9yJiMzMjtmb3JtYXQmIzMy
O01BQ1JPcyYjMzI7aW4mIzMyO09WTCZxdW90OykNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7
RG91Z2xhcyYjMzI7QW5kZXJzb24mIzMyOyZsdDtkaWFuZGVyc0BjaHJvbWl1bS5vcmcmZ3Q7DQom
Z3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO01hdHRoaWFzJiMzMjtCcnVnZ2VyJiMzMjsmbHQ7bWF0
dGhpYXMuYmdnQGdtYWlsLmNvbSZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lu
LVRlJiMzMjtZdWFuJiMzMjsmbHQ7eXVhbmhzaW50ZUBjaHJvbWl1bS5vcmcmZ3Q7DQomZ3Q7JiMz
MjstLS0NCiZndDsmIzMyO0NoYW5nZXMmIzMyO2luJiMzMjt2MzoNCiZndDsmIzMyOy0mIzMyO0Fk
ZCYjMzI7bWlzc2luZyYjMzI7UmV2aWV3ZWQtYnkmIzMyO3RhZw0KJmd0OyYjMzI7LSYjMzI7TGlu
ayYjMzI7dG8mIzMyO3YyOiYjMzI7aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTAxNi1j
b2xvci12Mi0xLTQ2ZGI1Yzc4YTU0ZkBjaHJvbWl1bS5vcmcNCiZndDsmIzMyOw0KJmd0OyYjMzI7
Q2hhbmdlcyYjMzI7aW4mIzMyO3YyOg0KJmd0OyYjMzI7LSYjMzI7Q2xhcmlmeSYjMzI7dGhhdCYj
MzI7dGhlJiMzMjtjb21taXQmIzMyO2dldCYjMzI7Zml4ZWQmIzMyO3dhcyYjMzI7aW50ZW5kZWQm
IzMyO3RvJiMzMjtiZSYjMzI7YSYjMzI7bm8tb3AmIzMyO2NsZWFudXANCiZndDsmIzMyOy0mIzMy
O0ZpeCYjMzI7dGhlJiMzMjt0eXBvJiMzMjtpbiYjMzI7dGFnDQomZ3Q7JiMzMjstJiMzMjtMaW5r
JiMzMjt0byYjMzI7djE6JiMzMjtodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMDE1LWNv
bG9yLXYxLTEtMzViMDFmYTBhODI2QGNocm9taXVtLm9yZw0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMz
MjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7fCYjMzI7
NCYjMzI7KystLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MiYj
MzI7aW5zZXJ0aW9ucygrKSwmIzMyOzImIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQom
Z3Q7JiMzMjtpbmRleCYjMzI7ODliNDM5ZGNmM2E2YWY5ZjU3OTk0ODdmZGMwZjEyOGE5YjVjYmU0
YS4uMTYzMmFjNWMyM2Q4N2UxY2RjNDEwMTNhOWNmNzg2NDcyOGRjYjYzYiYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
DQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTY1LDgmIzMyOys2NSw4JiMzMjtAQA0KJmd0OyYjMzI7JiMz
MjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9SR0IoMSYjMzI7Jmx0OyZsdDsmIzMyOzEyKQ0K
Jmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9BUkdCODg4OCgyJiMzMjsm
bHQ7Jmx0OyYjMzI7MTIpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO09WTF9DT05fQ0xSRk1U
X1JHQkE4ODg4KDMmIzMyOyZsdDsmbHQ7JiMzMjsxMikNCiZndDsmIzMyOy0jZGVmaW5lJiMzMjtP
VkxfQ09OX0NMUkZNVF9BQkdSODg4OChPVkxfQ09OX0NMUkZNVF9SR0JBODg4OCYjMzI7fCYjMzI7
T1ZMX0NPTl9CWVRFX1NXQVApDQomZ3Q7JiMzMjstI2RlZmluZSYjMzI7T1ZMX0NPTl9DTFJGTVRf
QkdSQTg4ODgoT1ZMX0NPTl9DTFJGTVRfQVJHQjg4ODgmIzMyO3wmIzMyO09WTF9DT05fQllURV9T
V0FQKQ0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO09WTF9DT05fQ0xSRk1UX0FCR1I4ODg4KE9WTF9D
T05fQ0xSRk1UX0FSR0I4ODg4JiMzMjt8JiMzMjtPVkxfQ09OX0JZVEVfU1dBUCkNCiZndDsmIzMy
OysjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9CR1JBODg4OChPVkxfQ09OX0NMUkZNVF9SR0JB
ODg4OCYjMzI7fCYjMzI7T1ZMX0NPTl9CWVRFX1NXQVApDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUm
IzMyO09WTF9DT05fQ0xSRk1UX1VZVlkoNCYjMzI7Jmx0OyZsdDsmIzMyOzEyKQ0KJmd0OyYjMzI7
JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9ZVVlWKDUmIzMyOyZsdDsmbHQ7JiMzMjsx
MikNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7T1ZMX0NPTl9NVFhfWVVWX1RPX1JHQig2JiMz
MjsmbHQ7Jmx0OyYjMzI7MTYpDQomZ3Q7JiMzMjsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7YmFz
ZS1jb21taXQ6JiMzMjs3NWI2MDdmYWIzOGQxNDlmMjMyZjAxZWFlNWU2MzkyYjM5NGRkNjU5DQom
Z3Q7JiMzMjtjaGFuZ2UtaWQ6JiMzMjsyMDI0MTAxNS1jb2xvci1lMjA1ZTc1YjY0YWENCiZndDsm
IzMyOw0KJmd0OyYjMzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyOy0tJiMzMjsNCiZndDsm
IzMyO0hzaW4tVGUmIzMyO1l1YW4mIzMyOyZsdDt5dWFuaHNpbnRlQGNocm9taXVtLm9yZyZndDsN
CiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48
IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNl
DQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29u
ZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQg
ZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8g
YmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3Ig
Y29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1
bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpi
ZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMg
ZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWls
IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVw
bHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFu
ZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhl
ciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_1503690535.1392632610--

