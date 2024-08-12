Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30394E75D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D487F10E0F2;
	Mon, 12 Aug 2024 07:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bV19pX7l";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="W6+WRuNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8310E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 07:05:07 +0000 (UTC)
X-UUID: 32a6dbce587911ef87684b57767b52b1-20240812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yi2kMm4lRb1kOaXDaMRkX5h97pD/t+v8ze5GG+X5oas=; 
 b=bV19pX7lNqRLsn1YeoGHH/+3UCle1m2s84DvHLSoNIllJB6cg/wGtoQyj0g+mMUYKr2GFKPiA1CQBDw5EDXD8KTu/582FGf6czAlk4QfQWw0NAsGp/h/SmO3zdR00jio07OB3L5RPlbmQziJhSWjBsgg6UG+iYLiPCOZC2iAC3s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:a0111278-bb3c-46b2-b29c-43e8756199e8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:54fa0c3e-6aa5-4057-84d5-0e7d47251781,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 32a6dbce587911ef87684b57767b52b1-20240812
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1163157003; Mon, 12 Aug 2024 15:05:03 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Aug 2024 15:05:03 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Aug 2024 15:05:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Opddiwdq4cwCszOplyYRgY7Be/9DzpevwR6JebD5Crx6cdZWtagIFhlBeQZh6VExKaUVJnnqyVvy5/+7Dl4eayzw3BJEIRvF9L/VlPQY9vgTk95QKBp3qjL67WbxpoVmkbbNNTghEi60NS3OFMKH0VV5STRzxJWUSxsERCArFoeky4XOIPoZ5PJYj6qxfkc9WHtdbn+J/mMmipp87LxpyS72waiP5G9/yctCrKUNnzmU5eyYZv9l5bRDRdi5KJJpuEJ6YL2pcpxwFnSGZUe8wli1BA+NxykmZTfPryfzfuuSqped+yl2g+YX0NfvS2Ti1TzCK1A2ghj1Bcir0BaZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azQk1/lub/g+JOtGfzSOdyYegzvjeAp5I7KgGhRJuNg=;
 b=eKKptDWt3Q5i7/YFJFCGhSlvjJZNcz6WPCg7/6dfBEJsnhQku8qOD1UciKBtSK0jpnvvs+ZUU9RBqEVVzdRPVuMEXcURND/fkljv3Y2n9SApzO2Umn62NajIIAV8Pmh0XNdZ6QJC2L0zT0vLK3XG9BPZnZruix3GDH0/dw0s7pTnwaGmXTsOr3TREt96aYBEblw1sNcQyvoZCOI4/QXH8C+CPPpHJrozVJTueJj/Bim2SSc031j8r/XNHjBOKStn5j5mE9AH44hrd6dhoLIdwtbmBQRcqYew6Eel0WCEYS+oI+kvZ/yAgR52zQQe24RIiD1h+sHOxcqh0pglYEpkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azQk1/lub/g+JOtGfzSOdyYegzvjeAp5I7KgGhRJuNg=;
 b=W6+WRuNGnPrPu0iF9YEqqSV3qB8m6VuS25Yq6GBW/kn5RUdu6CTg1QJ5GYZLyilUqdAJuGhAeVzgIalblo4kBYlU9io+1H1Bmnzp1NN67hxWc8UqdNUYwaeeUlvEOfGLLBTe4fVHTUSq5LIw24s9dWbKiFnXmt31qiLo5IyPkvI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7517.apcprd03.prod.outlook.com (2603:1096:400:41c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Mon, 12 Aug
 2024 07:05:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 07:05:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLIjmK2A
Date: Mon, 12 Aug 2024 07:05:01 +0000
Message-ID: <de128e0f41cf98b0379b80fa3adbd3de58a5fd4b.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7517:EE_
x-ms-office365-filtering-correlation-id: 0bd61b88-ff96-466d-6f89-08dcba9d15d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UEsyRDJKa090OWZaUFJhMUoxYWF4WFQ1UC9QV0FsQ09PZklZT1FQdFY1UVlx?=
 =?utf-8?B?amlXTVgzWHRaMmNSUE5EekJseDQ2Q2Q5dm0xbUpKaXFacVgwLzRWOU5aR2M5?=
 =?utf-8?B?WlFGcm54WnppeTc3T2Z4VVZRRUk4KzZsNld6cUt3U2puc3B0bURBQ0NoV2xY?=
 =?utf-8?B?U21UL29nY0pSYzRMVDd4UVQramZpTXMySGxlWlhSbm0wSUNzSFlHb2NZbTJQ?=
 =?utf-8?B?RXJsR0RubVZoRzdTK0hBZ2Z3a0JYS1BWZWgyQTdmaHFBbXE5Tm5HdU1WN1k5?=
 =?utf-8?B?ZENORmo5dUlZNWloY2NDTTRRS0pLWktSWlNEZlkyb3EwSlN3VmZlcXMrRktX?=
 =?utf-8?B?dUdzSHRxOHBLWDgydnF2MjlUOGZlVGUvd3loSVN0LzdabTJVeGdBZlNnY1Fm?=
 =?utf-8?B?VXEvRWNrcnNCbzZ2dnd6dEZKbTFSaHZNalVyM3BWWVBCZnl4bDlCanhyd0lw?=
 =?utf-8?B?VnZFd01lcVFaYWxFQUphSGRJZSsvcEx5RXBvQUM3a3U4U1RpdXgvOVJvRVpz?=
 =?utf-8?B?U3U3TnhOVXY5Qk9YT1ZiNm4yZzFGZUREY0tEOVc4d0NRNEQ3bXdQeHNRYkVX?=
 =?utf-8?B?ZDNDRHEwQW43QTFsMjhmWGd1RGtuR2ZBdW9scEUrUzBiTUluYmoyZ01HWFN6?=
 =?utf-8?B?Vlh0K0hmY2FCOEw0WktYd3U0Wkp3VE1LV0dKazgyRWd2WTlLYldpbDRJdTRL?=
 =?utf-8?B?c1pnMEJZb3BNSmdnSm5xWXJpNm0zODB1UGJ1cmJReHNrOS9SK1BMWmJ0cFo0?=
 =?utf-8?B?MTZaQktaSi9sY1RicFV1S3ZSOFlQZVZZRFVYM2VuNlpvNTNYZ2xYY1B0a3hh?=
 =?utf-8?B?V0RkbFozMVRlZ2xmTnJ2eUVtK2J2ZlA0YWZJRkJzakVSRXlSa2JpSVBxQWlK?=
 =?utf-8?B?TWdRZWRCSThteitueWVSK09YZElER1ZpRzBhaE1GUk02WloxTXNubnIwc3Zy?=
 =?utf-8?B?Z2w5ZkQ1S1VSMzEvZDhlU00wdkNHdHBTVjZvSFN0OHNqYXFIZlQ2U1FjcnVx?=
 =?utf-8?B?eDdSS2hWYWwyWGt4T0RDd2pTNFFUNmlLcmxVNTFzNUdBWTY0bzVWKzE4am1V?=
 =?utf-8?B?SEQ1OXEvQmVwN0hRUW16dSszUVRHQktuL1NtdmFGR21WaWp5S2xjWVBmT0Nq?=
 =?utf-8?B?TDdnYlZOdGc3UmxIWTY4ZWlHNXFnekhtN2xoRkpDSGtoM2dGMkxSL2UrZkhv?=
 =?utf-8?B?b0JEK283NkZtNTRNZU8wNUVHamxIUjMrcjlacUZQRlFSVmk2VjZwelZkR0xE?=
 =?utf-8?B?SFdrZEJnRnlNbGJubDhuQ3J2RXp4KzRtWW1nN0Ztdk9UOXJFOW5JYVQvMVFM?=
 =?utf-8?B?cFdVTWtOVyt5YTI4Y1FhUHNsSlE5OHhOc1daUFZYUll2Y1N2VngrRy8reG9N?=
 =?utf-8?B?ZjQxZFJCTlF3M1RCbjdiVHMrSmdPbnU5WE9JSFdiRlRLcHcxaVNDOG1RekZ3?=
 =?utf-8?B?TENrWnVYZFB4VTRNWnpaZVdnWlVyY2NLVHVOVnpSek5TOGRTL2FKT2FIOGF4?=
 =?utf-8?B?Q1lPYm9ITlBxQ09jWCtwK2ZPSDRjVjg3MlFrM3Uzb2R4QVkzVkQzbVFBc21P?=
 =?utf-8?B?OUpaa2dQKy9WeEJKa0RaaW5xZTRCVk16TVhpbCttVVpSMUVodUFHTXFnTUEv?=
 =?utf-8?B?UTF5Z3NJLzdRV3F6MGFhZ3RsZ2FSQ2ZCeVcydW96eldvZDZ5cjdxbHF5bktj?=
 =?utf-8?B?dXBqc2FKZUdHbnNGWXlNdGt1RWQ5bFRKS3VVaHJWMHR3QTJoUGhxaFEvYThz?=
 =?utf-8?Q?0ietIWKYrfsP3jTRkc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGNHQkNQYnZaaXlsRUdBOXgvMmNHSWpLRlJVclhmb2U4NHBsdEZSanhWU1RQ?=
 =?utf-8?B?V1ZnaWcvMzFTcExwS1FNTStJSWVER2dlNjlaVk1VMlNYY2JtUE14T1BlaGhE?=
 =?utf-8?B?VjVDVGlDeWoya1lVeEgxZ2tnUzZMS3p2alZ2NmMzTE5OaTN3SUhXRDlGaWkx?=
 =?utf-8?B?Z3hXKzR3OUJyblg1L1gzUUVYUllUUTFjSE1wUVB3TTUvcWVTY1BMVXNka0ZT?=
 =?utf-8?B?eW5jcUdkbWlHZEFTT0c1L3dtVjNZbWNELzkxMTh5Y1poZGJxMUZFajJ2OWpk?=
 =?utf-8?B?SHZ3NUsySENubHY0Y3hWTWoyL2hYL2lkUEdPQmVkQnRyMWM1cDhuWkl2Sjh3?=
 =?utf-8?B?WjdkdHcvUTdVQWRwVmFpRXdVL3BuRU1wWDVxYXFwSkZ6ZkVDY2Ntc2lmRDhh?=
 =?utf-8?B?QXZ2emtRT1ZPcStaRDYrRzk0djJMdnp3UWllQ1AvRDBmSzdIN0s1cXFqRCtO?=
 =?utf-8?B?YnV3NmxXeXg1dyt2bTVOS25abjhZanJrUFk1bmxMbmZyaVU1SHVPbXpOT1Bo?=
 =?utf-8?B?R0J4dE53RlpTTE1TdmdLUmw0eU40MnNqcHBRL2ZobEJ5UjVqQ0hmMjF2MVVK?=
 =?utf-8?B?NnlJRUQvZGFFNFA2cFhXU2RRT3pORzZOUTNudHZldXVLT1I5TU9EWTlEeEtO?=
 =?utf-8?B?MnA4UGpNWGpmbnZaeFVnY1ZFS3ZsZEp0dWh1dDk5NDhIa2hSQmNtRUVwdEJn?=
 =?utf-8?B?d25KQTV1a0xUMU9MOGVJTXRyYlhrRDRZVitNZXhGRWpRZGVJWnFBVEdiNWZK?=
 =?utf-8?B?b3Z2ZEhwRjRZeTJKUGZ4T2Z2aXhLd1ZaOWtvL2gzdHBsVTdkM3FiSy9SUVpk?=
 =?utf-8?B?Y3VPenVRdjRrSnBBYTlTZlM5aHhkU2RDK1FXc3RzRkFqVnhpcnNQZFpJM0U3?=
 =?utf-8?B?VXpOelE4RGdtck92Y2x0eFRYWHF0bzFaelZVN2Uwc2lvZlBFcFdMT1RKOXBw?=
 =?utf-8?B?UVBTNEgraU43c0hQejVxR3c4djFibmJwSWMrYTRaaTFzdlBvSmFzNzB0NGJF?=
 =?utf-8?B?cTh3eXdxdm94b1RDbzJOUEtCSkVnZUhEQ25hSmhGV2hVamJkNFlPRjZ6WFhp?=
 =?utf-8?B?UGhSbW1BMHhVc2NvL3lLY2kyT01OaDVTeEJTZTZTYXM4K3lXTG9vNGVVNlgy?=
 =?utf-8?B?Z3lvNFhKTzgxTTVKK3p6eWJpZGFnTE1ONXVmaWFxcnRuT2trNENCSmcvY1hD?=
 =?utf-8?B?a21sV1VNanlyUExmcEZpZkhPUHFCVHF2YkphcUR3LzhIRUJ4S0xrQ0gxNW5t?=
 =?utf-8?B?UzYvUTZLQ0YwdHQ1dXg5dlJmUFc3bU94bCs0TllRZUIzdFV1MEdPREVZKzdK?=
 =?utf-8?B?N3FPMXVPenJHeUh5SjlOYkd0UElkYVVLbHJkRFlBejVTZkFhSnNoWUx5bml2?=
 =?utf-8?B?WFJUNnI0VmFiU1QvMStEc21ITlNPSFU4UjVpRUhEUFFacEIycHZTSm01bTRM?=
 =?utf-8?B?TUZxK2xCeTJYU2E3elQvZGhwOUFyZlI4UXlBeW9lZ3VQVzVRWTVTTTMzNklz?=
 =?utf-8?B?c2o4SGcvYXRkYWpxTStsSDI2d3o3NmdsS0tEajJRWGZYalE3YXJUT1QyOCtB?=
 =?utf-8?B?VzBEWE9YSTJXK2JUaDRWK3EvdEI5dy83NTlHRXdaUDhaSWhoU2p2MTZBcXNY?=
 =?utf-8?B?Zk9sbEpLSUNtZFI3TW5HUjUvMmRDeDNLb0w1RWhYVU5RaXZvRW5FczRtcDJL?=
 =?utf-8?B?dy96S2JvMXBpeVpwVVBvZHlJZlkwTGZKcm5aekhPYTJOd2k0cjROb3JqZTY5?=
 =?utf-8?B?RHEzQ3BkZVpzUFhhQVpXenYwck5UWDdlbjVHRGRuTG95Zmp0V1RqWU1HL1hV?=
 =?utf-8?B?cytuOUI3UzNrdHdHaUxNUDZnYXYwQlYvTW95NGJDd3VSOU5Za0RuaVpSRzE1?=
 =?utf-8?B?K0h2Ry9tbkFSRnEwUEZ6WnIzZEVVbS9GYUJSSHA4VWNiamRoUldsR3hxU3VM?=
 =?utf-8?B?eFFZZE0rU0p0dThycnFaQW9KbnpCSy83SzVUZC8rMjNCZ3RDaGlqc3NIQkFp?=
 =?utf-8?B?R1JWL3NmN1JjRUEvV1dVSC9MajRoVlFGNmdZcjFxTkc4NURjdWkzSHFIbzRw?=
 =?utf-8?B?OERoejZENlQrK05SOFhYUEhpNmtGUWNDQ0cvR244eExxbFVOb2w0cnJiekpD?=
 =?utf-8?Q?sjYImkZJCaOBpHHUS6ufLWD34?=
Content-ID: <B5F4689F5628CD4091730CA8A8D1FC08@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd61b88-ff96-466d-6f89-08dcba9d15d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 07:05:01.7967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k2VMk8Xc2kksUpDd7RstNSH4OZlWTKjsxf7wpZyR8MxaxA9hKv2H0VMZvymecIftq0/LTQgKkeKCCAjmyC45wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7517
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_2127407255.115296752"
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

--__=_Part_Boundary_004_2127407255.115296752
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gKw0KPiAraW50IGRwX3R4X2hkY3AyeF9jaGVja19saW5rKHN0cnVjdCBtdGtfaGRjcF9p
bmZvICpoZGNwX2luZm8pDQo+ICt7DQo+ICsJc3RydWN0IG10a19kcCAqbXRrX2RwID0gY29udGFp
bmVyX29mKGhkY3BfaW5mbywgc3RydWN0IG10a19kcCwgaGRjcF9pbmZvKTsNCj4gKwl1OCByeF9z
dGF0dXM7DQo+ICsJaW50IHJldCA9IC1FSU5WQUw7DQo+ICsJaW50IHRtcCA9IDA7DQo+ICsNCj4g
KwltdXRleF9sb2NrKCZtdGtfZHAtPmhkY3BfbXV0ZXgpOw0KPiArDQo+ICsJaWYgKG10a19kcC0+
aGRjcF9pbmZvLmF1dGhfc3RhdHVzICE9IEFVVEhfUEFTUykNCj4gKwkJZ290byBlbmQ7DQo+ICsN
Cj4gKwlpZiAoIW10a19kcC0+dHJhaW5faW5mby5jYWJsZV9wbHVnZ2VkX2luIHx8ICFtdGtfZHAt
PmVuYWJsZWQpDQo+ICsJCWdvdG8gZGlzYWJsZTsNCj4gKw0KPiArCXJldCA9IGRybV9kcF9kcGNk
X3JlYWQoJm10a19kcC0+YXV4LCBEUF9IRENQXzJfMl9SRUdfUlhTVEFUVVNfT0ZGU0VULCAmcnhf
c3RhdHVzLA0KPiArCQkJICAgICAgIEhEQ1BfMl8yX0RQX1JYU1RBVFVTX0xFTik7DQo+ICsJaWYg
KHJldCAhPSBIRENQXzJfMl9EUF9SWFNUQVRVU19MRU4pIHsNCj4gKwkJZGV2X2RiZyhtdGtfZHAt
PmRldiwgIltIRENQMi5YXSBSZWFkIGJzdGF0dXMgZmFpbGVkLCByZWF1dGhcbiIpOw0KPiArCQln
b3RvIGRpc2FibGU7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKEhEQ1BfMl8yX0RQX1JYU1RBVFVTX1JF
QVVUSF9SRVEocnhfc3RhdHVzKSkNCj4gKwkJdG1wID0gUkVBVVRIX1JFUVVFU1Q7DQo+ICsJZWxz
ZSBpZiAoSERDUF8yXzJfRFBfUlhTVEFUVVNfTElOS19GQUlMRUQocnhfc3RhdHVzKSkNCj4gKwkJ
dG1wID0gTElOS19JTlRFR1JJVFlfRkFJTFVSRTsNCj4gKwllbHNlIGlmIChIRENQXzJfMl9EUF9S
WFNUQVRVU19SRUFEWShyeF9zdGF0dXMpKQ0KPiArCQl0bXAgPSBUT1BPTE9HWV9DSEFOR0U7DQo+
ICsNCj4gKwlpZiAodG1wID09IExJTktfUFJPVEVDVEVEKSB7DQo+ICsJCW10a19kcF9oZGNwX3Vw
ZGF0ZV92YWx1ZShtdGtfZHAsIERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9FTkFCTEVEKTsN
Cj4gKwkJcmV0ID0gMDsNCj4gKwkJZ290byBlbmQ7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHRtcCA9
PSBUT1BPTE9HWV9DSEFOR0UpIHsNCj4gKwkJcmV0ID0gZHBfdHhfaGRjcDJ4X2F1dGhlbnRpY2F0
ZV9yZXBlYXRlcihoZGNwX2luZm8pOw0KPiArCQlpZiAoIXJldCkgew0KPiArCQkJbXRrX2RwX2hk
Y3BfdXBkYXRlX3ZhbHVlKG10a19kcCwgRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX0VOQUJM
RUQpOw0KPiArCQkJZ290byBlbmQ7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlkZXZfaW5m
byhtdGtfZHAtPmRldiwgIltIRENQMi5YXSBsaW5rIGZhaWxlZCB3aXRoOjB4JXgsIHJldHJ5aW5n
IGF1dGhcbiIsIHRtcCk7DQo+ICsJfQ0KPiArDQo+ICtkaXNhYmxlOg0KPiArCXJldCA9IGRwX3R4
X2hkY3AyeF9kaXNhYmVsKGhkY3BfaW5mbyk7DQo+ICsJaWYgKHJldCB8fCAhbXRrX2RwLT50cmFp
bl9pbmZvLmNhYmxlX3BsdWdnZWRfaW4gfHwgIW10a19kcC0+ZW5hYmxlZCkgew0KPiArCQlyZXQg
PSAtRUFHQUlOOw0KPiArCQltdGtfZHBfaGRjcF91cGRhdGVfdmFsdWUobXRrX2RwLCBEUk1fTU9E
RV9DT05URU5UX1BST1RFQ1RJT05fREVTSVJFRCk7DQo+ICsJCWdvdG8gZW5kOw0KPiArCX0NCj4g
Kw0KPiArCXJldCA9IGRwX3R4X2hkY3AyeF9lbmFibGUoaGRjcF9pbmZvKTsNCg0KV2hlbiBzb21l
dGhpbmcgZXJyb3IgdGhlbiBnbyBoZXJlLiBXaHkgZW5hYmxlIGhkY3A/DQoNClJlZ2FyZHMsDQpD
Sw0KDQo+ICsJaWYgKHJldCkNCj4gKwkJbXRrX2RwX2hkY3BfdXBkYXRlX3ZhbHVlKG10a19kcCwg
RFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX0RFU0lSRUQpOw0KPiArDQo+ICtlbmQ6DQo+ICsJ
bXV0ZXhfdW5sb2NrKCZtdGtfZHAtPmhkY3BfbXV0ZXgpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsN
Cj4gK30NCj4gKw0K

--__=_Part_Boundary_004_2127407255.115296752
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtTYXQsJiMzMjsy
MDI0LTA2LTA4JiMzMjthdCYjMzI7MjA6MDEmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YzOg0KJmd0OyYjMzI7LSYjMzI7cmVm
aW5lJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO3Rp
bWUNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93JiMzMjt0byYjMzI7ZG8m
IzMyO0hEQ1AmIzMyO3dpdGgmIzMyO2NvbnRlbnQmIzMyO3R5cGUmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO3Byb3RlY3Rpb24mIzMyO3ZhbHVlJiMzMjt3aGljaCYjMzI7c2V0JiMzMjtieSYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93
JiMzMjt0byYjMzI7dXBkYXRlJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uDQomZ3Q7JiMzMjst
JiMzMjtyZWZpbmUmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7dG8mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbg0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtmcm9tJiMz
Mjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchbWQ2eFVpWU44OEQyWW1FVHM4RlFnYUV4TTJ6SDhT
MVNtQUVVOUdSY2h3cE5zWE95REZ1bDN6aVZLaFJwQ0phajhSY24tZ3ZNLTgwMXJ1bmp3QSYjMzY7
JiMzMjsNCiZndDsmIzMyOy9wYXRjaC8yMDI0MDIwNTA1NTA1NS4yNTM0MC0zLW1hYy5zaGVuQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO21hYy5z
aGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraW50JiMzMjtkcF90eF9oZGNwMnhfY2hlY2tf
bGluayhzdHJ1Y3QmIzMyO210a19oZGNwX2luZm8mIzMyOypoZGNwX2luZm8pDQomZ3Q7JiMzMjsr
ew0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRrX2RwJiMzMjs9JiMzMjtjb250
YWluZXJfb2YoaGRjcF9pbmZvLCYjMzI7c3RydWN0JiMzMjttdGtfZHAsJiMzMjtoZGNwX2luZm8p
Ow0KJmd0OyYjMzI7K3U4JiMzMjtyeF9zdGF0dXM7DQomZ3Q7JiMzMjsraW50JiMzMjtyZXQmIzMy
Oz0mIzMyOy1FSU5WQUw7DQomZ3Q7JiMzMjsraW50JiMzMjt0bXAmIzMyOz0mIzMyOzA7DQomZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsrbXV0ZXhfbG9jaygmYW1wO210a19kcC0mZ3Q7aGRjcF9tdXRleCk7
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyhtdGtfZHAtJmd0O2hkY3BfaW5mby5hdXRo
X3N0YXR1cyYjMzI7IT0mIzMyO0FVVEhfUEFTUykNCiZndDsmIzMyOytnb3RvJiMzMjtlbmQ7DQom
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyghbXRrX2RwLSZndDt0cmFpbl9pbmZvLmNhYmxl
X3BsdWdnZWRfaW4mIzMyO3x8JiMzMjshbXRrX2RwLSZndDtlbmFibGVkKQ0KJmd0OyYjMzI7K2dv
dG8mIzMyO2Rpc2FibGU7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjtkcm1f
ZHBfZHBjZF9yZWFkKCZhbXA7bXRrX2RwLSZndDthdXgsJiMzMjtEUF9IRENQXzJfMl9SRUdfUlhT
VEFUVVNfT0ZGU0VULCYjMzI7JmFtcDtyeF9zdGF0dXMsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtIRENQXzJfMl9EUF9SWFNUQVRVU19MRU4pOw0KJmd0OyYj
MzI7K2lmJiMzMjsocmV0JiMzMjshPSYjMzI7SERDUF8yXzJfRFBfUlhTVEFUVVNfTEVOKSYjMzI7
ew0KJmd0OyYjMzI7K2Rldl9kYmcobXRrX2RwLSZndDtkZXYsJiMzMjsmcXVvdDtbSERDUDIuWF0m
IzMyO1JlYWQmIzMyO2JzdGF0dXMmIzMyO2ZhaWxlZCwmIzMyO3JlYXV0aCYjOTI7biZxdW90Oyk7
DQomZ3Q7JiMzMjsrZ290byYjMzI7ZGlzYWJsZTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQom
Z3Q7JiMzMjsraWYmIzMyOyhIRENQXzJfMl9EUF9SWFNUQVRVU19SRUFVVEhfUkVRKHJ4X3N0YXR1
cykpDQomZ3Q7JiMzMjsrdG1wJiMzMjs9JiMzMjtSRUFVVEhfUkVRVUVTVDsNCiZndDsmIzMyOytl
bHNlJiMzMjtpZiYjMzI7KEhEQ1BfMl8yX0RQX1JYU1RBVFVTX0xJTktfRkFJTEVEKHJ4X3N0YXR1
cykpDQomZ3Q7JiMzMjsrdG1wJiMzMjs9JiMzMjtMSU5LX0lOVEVHUklUWV9GQUlMVVJFOw0KJmd0
OyYjMzI7K2Vsc2UmIzMyO2lmJiMzMjsoSERDUF8yXzJfRFBfUlhTVEFUVVNfUkVBRFkocnhfc3Rh
dHVzKSkNCiZndDsmIzMyOyt0bXAmIzMyOz0mIzMyO1RPUE9MT0dZX0NIQU5HRTsNCiZndDsmIzMy
OysNCiZndDsmIzMyOytpZiYjMzI7KHRtcCYjMzI7PT0mIzMyO0xJTktfUFJPVEVDVEVEKSYjMzI7
ew0KJmd0OyYjMzI7K210a19kcF9oZGNwX3VwZGF0ZV92YWx1ZShtdGtfZHAsJiMzMjtEUk1fTU9E
RV9DT05URU5UX1BST1RFQ1RJT05fRU5BQkxFRCk7DQomZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjsw
Ow0KJmd0OyYjMzI7K2dvdG8mIzMyO2VuZDsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsraWYmIzMyOyh0bXAmIzMyOz09JiMzMjtUT1BPTE9HWV9DSEFOR0UpJiMzMjt7DQomZ3Q7
JiMzMjsrcmV0JiMzMjs9JiMzMjtkcF90eF9oZGNwMnhfYXV0aGVudGljYXRlX3JlcGVhdGVyKGhk
Y3BfaW5mbyk7DQomZ3Q7JiMzMjsraWYmIzMyOyghcmV0KSYjMzI7ew0KJmd0OyYjMzI7K210a19k
cF9oZGNwX3VwZGF0ZV92YWx1ZShtdGtfZHAsJiMzMjtEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJ
T05fRU5BQkxFRCk7DQomZ3Q7JiMzMjsrZ290byYjMzI7ZW5kOw0KJmd0OyYjMzI7K30NCiZndDsm
IzMyOyt9JiMzMjtlbHNlJiMzMjt7DQomZ3Q7JiMzMjsrZGV2X2luZm8obXRrX2RwLSZndDtkZXYs
JiMzMjsmcXVvdDtbSERDUDIuWF0mIzMyO2xpbmsmIzMyO2ZhaWxlZCYjMzI7d2l0aDoweCV4LCYj
MzI7cmV0cnlpbmcmIzMyO2F1dGgmIzkyO24mcXVvdDssJiMzMjt0bXApOw0KJmd0OyYjMzI7K30N
CiZndDsmIzMyOysNCiZndDsmIzMyOytkaXNhYmxlOg0KJmd0OyYjMzI7K3JldCYjMzI7PSYjMzI7
ZHBfdHhfaGRjcDJ4X2Rpc2FiZWwoaGRjcF9pbmZvKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCYj
MzI7fHwmIzMyOyFtdGtfZHAtJmd0O3RyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbiYjMzI7fHwm
IzMyOyFtdGtfZHAtJmd0O2VuYWJsZWQpJiMzMjt7DQomZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjst
RUFHQUlOOw0KJmd0OyYjMzI7K210a19kcF9oZGNwX3VwZGF0ZV92YWx1ZShtdGtfZHAsJiMzMjtE
Uk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fREVTSVJFRCk7DQomZ3Q7JiMzMjsrZ290byYjMzI7
ZW5kOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXQmIzMyOz0mIzMyO2Rw
X3R4X2hkY3AyeF9lbmFibGUoaGRjcF9pbmZvKTsNCg0KV2hlbiYjMzI7c29tZXRoaW5nJiMzMjtl
cnJvciYjMzI7dGhlbiYjMzI7Z28mIzMyO2hlcmUuJiMzMjtXaHkmIzMyO2VuYWJsZSYjMzI7aGRj
cCYjNjM7DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQpDQomZ3Q7JiMz
MjsrbXRrX2RwX2hkY3BfdXBkYXRlX3ZhbHVlKG10a19kcCwmIzMyO0RSTV9NT0RFX0NPTlRFTlRf
UFJPVEVDVElPTl9ERVNJUkVEKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytlbmQ6DQomZ3Q7JiMz
MjsrbXV0ZXhfdW5sb2NrKCZhbXA7bXRrX2RwLSZndDtoZGNwX211dGV4KTsNCiZndDsmIzMyOysN
CiZndDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQoNCjwv
cHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_2127407255.115296752--

