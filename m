Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0802B85B43E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 08:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ED110E191;
	Tue, 20 Feb 2024 07:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="KKMsnVl2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PL5Dp+ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE8510E191
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:54:08 +0000 (UTC)
X-UUID: 35401b1ccfc511ee9e680517dc993faa-20240220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=o22Yl6uzhBnuRRrTJcr+hVRy8me5woTp+DeXNaoulcY=; 
 b=KKMsnVl2cWdkWvGeoU64RETFJwL97MFLPmJr9H+1Xw0mI0wCtoWrmhKbcSiZ0tec6UYgha6I7TZyBPTWys3/GsCaKu7xkRRtWcDkHNn+1xSOVUXhr3alduJJRYaxD/mBo+jiM57EA/u4YVOdAgyrhUYvE4PzDEXAFpFAui/3Ek4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:8aa2d3d6-d083-403e-877d-3df077ce0f47, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:792a7f8f-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 35401b1ccfc511ee9e680517dc993faa-20240220
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 283966030; Tue, 20 Feb 2024 15:54:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 20 Feb 2024 15:53:58 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 20 Feb 2024 15:53:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUnHD/tD69cffze0U6mHkik9eSXacxje8+sKSuGsqdLn35s2JS39RW3I+pqVL7wwzdJCiWodgYB7FT83cwRbEsUsnpOHpMCB+3HaqxWwlyIDUsjf5M+uDI2hmrRnIo1jj9ehD0NQnwZqYSf5YxCqxV2r9hIIUmKJzQqZVuMPgQ9/v1xlOvvYWL85mGUU/qMdoVqjpIPryvreIDqAutUNINcgr+E1YBZPjAXcRrpToUF3seP7vImQ1/A6B0AhnBzFrjjRyDuPHZFLdpCevsVVyfP5+qgwXgIiKCPO5+qEzn2KJ5bV9ckQW5Pmy8MVV5vWYr2hTnIIDbFmf8bXHxMGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU99aj+tc/EoXnYuy8d1LbsX60oVqkjY+Tw7/iiXduA=;
 b=EET8QlJkjBqm1qnjPiCoMxBuXNtnMou2H4pv+pA71Xxbulu0R8kaHcgfoSgdmPGgZhzqjAHCuKGBUvIbahmV/qlodrTr9gpJSxDkDQJv75FtQTRcCuzPwG3QdK+C48H/QRZFQKECB4t+Ea3UCYx/07HtVTQUD3beyWAcoOabUc6RyK8DoNcHA101YvSXM8ZX/KSuVf2l5qnUjW0xEm+q3/5PITPK4kdq3qEhEL6TFnSU8HB46lCywDEOKpPEtmIbvgRd/aOd6mG8/MKAGO37eSohTuoacfwM/paOXzlRNJUHeTEAYAvUsz5Zeo+3RDscjVxa/nX5H5vu60MDLINnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU99aj+tc/EoXnYuy8d1LbsX60oVqkjY+Tw7/iiXduA=;
 b=PL5Dp+otS87Rh42DGpKOg8EVDw/nHEuz424TGcpN5nJNuHmRSHctkO98rwX/hRnaVQkLYxo0arRR6VSjt8aqkfCpWqPHEpXYYW7dShGjhcISymrqbK3+8kk+78y/UVi1VSrD+XCJ0S/cQpu8q8b5r0rFHvkLU0rTXa8aYTtnVag=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7174.apcprd03.prod.outlook.com (2603:1096:820:c9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Tue, 20 Feb
 2024 07:53:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b705:ea58:46d:e98d]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b705:ea58:46d:e98d%4]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 07:53:56 +0000
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
Subject: Re: [PATCH v2 1/3] Subject: [PATCH] drm/mediatek/dp: Add tee client
 application for HDCP feature
Thread-Topic: [PATCH v2 1/3] Subject: [PATCH] drm/mediatek/dp: Add tee client
 application for HDCP feature
Thread-Index: AQHaV/ePwyvGD4XnJkOIaHAXSCsAzLES8/iA
Date: Tue, 20 Feb 2024 07:53:56 +0000
Message-ID: <e06c53745d18eb2b275e677e61cbd258b96f7ebf.camel@mediatek.com>
References: <20240205055055.25340-1-mac.shen@mediatek.com>
 <20240205055055.25340-2-mac.shen@mediatek.com>
In-Reply-To: <20240205055055.25340-2-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7174:EE_
x-ms-office365-filtering-correlation-id: 3ce7fef9-c09e-419a-a01c-08dc31e916e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WzvrGr5mQtVuSiSmH0CsTFIrvBxdXHkZEjWQpZ0yQWdgaQME+q3151+uocVNLnC2BzDJFpWnKSCXznwlEZBj6r+yoma3B3Du2+Gh/+p7rPpc4Aa/7TCiZv2RsTTYt2zXNErwV5b5cRREZW2XoxNdR/c3jhJY/8Y19SodlgKbPUkzRYZNnnc8aaFqG0OTire7t7HWceUVfI/XB21GLMOA9hAyHVCwdetvNZIb0iZy77OVg7NrTjt/6HVcnKUeKhXshsIyaoK9AyOQOhIMeMSxFb6fiOBjFeFPuuuinJd0ztrEGVbVsro9h75I80Xu8uwuJ3kfHJQ9nsVFnMNvjxn5HnApJlebu1N0dQ9u27eKtRro2vyNQFvwQouQJXDDhr0SohxMR7pv6QVzE6sBqMCvLcRCjptdOO7ZTWKkcm4nW1brcDjt/01KA2OAp3fDeiovdz9XvmjxEh35+xZW+NA3qqF8CeHW9bx4RTRC4GH13/nGw/kEe7slbGDTWAUiwBK7QMfWg0hdfJ+6aPRrEPPivyDWTaW5iOR8RimqF+Yk/zHd0Qj3rbjFpXz+rzv1qy0WxGQ5yoai0ginyUqWMNYOvhoTiy/CQoc1skK9brWvKew=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFlJK2JGTXpqTUxpTzZjd0xNRGRUU2dpbE4wYURxYmhnWHhPVGZYcHhVd0Z0?=
 =?utf-8?B?aTNnNW9CWk9LeUw1M0dhZ1B5RE8xZ3hINnNJY21xallmNEdnMG5BaGJiYlh5?=
 =?utf-8?B?K0RVdzltVC9NS3BWRitqS0R4VHhyTGdEMS8yTW85M1pKSlJ1aUgxYkFhQlVL?=
 =?utf-8?B?ampOdWZrV2NxNktubWloWUc2NXdRV0NlSmREVWN0KzFnSG15Wm1JR2dNblN4?=
 =?utf-8?B?TWxDQ1BKRXRYdGFtTGhLQmZUMTFJaUNBVjNQUnpJdmlLeFNiWElDOFJmTGQw?=
 =?utf-8?B?Z2RvaW11amswb1dFdlFzMmJyVGlOaW5UWTFhK0pGbGdvTzJlNjdXU3ZucUZx?=
 =?utf-8?B?dW9pTzU2WGxydWNTYWt5cjlsdmV0QmdzRWYxeEZEVU1ONEtLNjVsdHo3bzYz?=
 =?utf-8?B?U0hWYjIwUlpPTDN1Y0VyT204SXkveHVOY1dEdGlxTm5OeXFxK3pyL2V4ajAv?=
 =?utf-8?B?dzFpdlhJYlMrV2xWTHRON1B5cUtuM2loU291THRIbzViRWxLUnA3RlFDanpJ?=
 =?utf-8?B?V1oybnR2Szd3NHluRFowQWc5Wmk3NFdUUzN2THdUSnU1bDZsZ2lscXM5Tkpv?=
 =?utf-8?B?TnR1N2I5Z3BEV2NNWWN2V1hoOVluT0JzUTFHQ0Z6cFZxdjQrR2E3Y0VndnJG?=
 =?utf-8?B?cUxHb3VBWUtNemtrV3pyS0dSSzFnL0dHSXRwakdlZG96ZkFDVGwyWE9pY3JU?=
 =?utf-8?B?Z1FSRStEUlR5YUpjOUZXTFltcFZ3YndGZjdDdEowWGdIYVY1ZXArY3dvNm91?=
 =?utf-8?B?QmVnK1F6UCtNbHNwcVFCY2ZGZGJrK3F5L01Ga1l5RnJWRGRRVE9VREppVGdk?=
 =?utf-8?B?d0l1dXBIcTFIRWJXaVhWb015d3NmM3FPOCtkcFlDMmZBS0lDVTF1a3RyL25k?=
 =?utf-8?B?Sk05OWtYVnZVUDVEQ0FyY2lUNjJreXlsaExBRkpsUjljcFFKaERCMGE2RXRK?=
 =?utf-8?B?RmVrZEVYWjc4RmovN0ZCc1dmTVNNTGozbGN6VDJQd1BxeUY2bFdNTTFHdlk2?=
 =?utf-8?B?OEtzZ1h0YUJhWEVFSUQvbUdTbStGUjhqRUtnYXdqZEZXSWJLUGxsZE9vUFhE?=
 =?utf-8?B?T2lBKzNwTjJtNEpoZHRseEJvdkFYaVhHT3NFSHpmUUh3enl2cG1EbmRkT3My?=
 =?utf-8?B?dGVMWUNFTldXa2kzTDBFeGFvYjF1MCtuT2dCRWhEdHJwazQybm9nZU5ialdl?=
 =?utf-8?B?c1o1NklPdDBFTm9PNTdCL0VoSU1GRTNwN3lNSStrelRPVDZCT1dTeHdNVkRz?=
 =?utf-8?B?dFpldmcyaitwQUNnNGlIQXd0Um5ud0VCMldkakRBdmR6a1A2QjJOejVjeG5m?=
 =?utf-8?B?Mng3NmpITE9sdXNkL2RoaXJBS0w1QjMwbVJkcGlZWHp5UXIvblhsaFZtSVE2?=
 =?utf-8?B?ejBxdkdROTJHN1k2eUJqMENqZkxSRWRIQTEycTBEcTM1KzkzTkdnVVBRT3hN?=
 =?utf-8?B?MlRzSURZVXZZRHVEeWRCUnMveDdmcE14SkVFSGZzUXBpTDBkaTdtTWZ4aEor?=
 =?utf-8?B?OU45MDNqSVd0YWZzL3psZE9FVFJaa1BMREs0L3p3ZGpzSk9GekJGSzMzeWlZ?=
 =?utf-8?B?R0xHcnVoVHlKUmdWcTc0KzVPMmNOaFY1b052UnNGdlFRUHVncmI3ZGY1N3hx?=
 =?utf-8?B?M2ZBclNmUWdzVG9qSFpMUWgwcVQ4U1ZPMFE4R2ZlTkhhUU9ic1J2Q2JudVFs?=
 =?utf-8?B?cVJzd3lrckNDUDdXZmgzL1dpaEJhT2JwMk9ka0Q1bDlNZlNpZzI3NnFzamlW?=
 =?utf-8?B?UW5zWTFjY1U5S2lkUU9SQWRaMGdhZ2tPMjkwMVFnYW1yOEYrcGFydFVtbXJz?=
 =?utf-8?B?UHJpOHZMY2E3ZVlqVkxIc1Z3NmZNSEVlVldGZDBsdmRIM1k5THhKMkJEd2NZ?=
 =?utf-8?B?OWlVeExPZXdESDlZUXBSUGpSU2dMQk42QkFiY09DaW1mdGIwM3NQQ2RHVjNy?=
 =?utf-8?B?QUVGS1hkWFhsOW1icmJPOTh5dlZPSTVBUHpsaXFVZ2RIZlNLTG4vR0lwdys5?=
 =?utf-8?B?eFpYK29yYW52c3A5ZVdVamhxZ2Z1aEJwZ0RJN2ZRZGl0WTVMVnJ3dFZmQUFF?=
 =?utf-8?B?UFBYaEtmckcvdTBid1BIeURuRlkxc2ZBa3pjZmVZMWNqVitKU1k5dFJXMVVC?=
 =?utf-8?Q?Far3T5YQySMv7potfbeqm4cZ4?=
Content-ID: <CA2105620555954E9A8F4EB196BC0FDF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce7fef9-c09e-419a-a01c-08dc31e916e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 07:53:56.0745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3lHZmS339M823LWSc1L+IOL4JUXz8OovmFQ1W6Icj4wtUUpvHggfwSaiyptuiJIA9y7CkmnqPb45Mi8ZTxr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7174
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.810500-8.000000
X-TMASE-MatchedRID: scwq2vQP8OH4OiVTWoD8RNOdGz1/8ORmjLOy13Cgb4+qvcIF1TcLYJsn
 GP/L/vuk2tzxWRuOm/cRfF2ohY7CQYdM1kFwmWfIfxzygoxuBhgpWss5kPUFdBL6MU7t349bxUD
 TxL3vuSCrOei4RDEWn7wnrf2ISN+oH0nltmolsgldtN+hx8BZv/5KjtsWKl+WYdHWCsGFCe0/H4
 pb4un6/UtMHXSjYB7Ng2n1XHjucgwM8jMXjBF+sNIFVVzYGjNKWQy9YC5qGvz6APa9i04WGCq2r
 l3dzGQ1aA1+IVCU7MQUpVEztVaD8SL5bIwVEU8Z91EzlyY9jskZE7kGza2v4qiyCHlYu4e2kGjq
 8KBlWkaSeseYs5sfQiElRDXuZJmeEaI2E6JbeiQ9XGVRM/cag7sCWxFv9DtZChiU+c//xP8WW1i
 V/cL+I0MMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.810500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E6C0AC878B2EF361E61CA1DDE399A315D449E7807F026E9B8C94D5DBE4E4E1DE2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_418581879.1371312161"
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

--__=_Part_Boundary_009_418581879.1371312161
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtNb24sJiMzMjsy
MDI0LTAyLTA1JiMzMjthdCYjMzI7MTM6NTAmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7QWRkJiMzMjt0ZWUmIzMyO2NsaWVudCYjMzI7YXBwbGljYXRpb24mIzMy
O3doaWNoJiMzMjt3aWxsJiMzMjtiZSYjMzI7dXNlZCYjMzI7Zm9yDQomZ3Q7JiMzMjtIRENQJiMz
MjsxLngmIzMyO2FuZCYjMzI7Mi54JiMzMjthdXRoZW50aWNhdGlvbiYjMzI7aW4mIzMyO0Rpc3Bs
YXlQb3J0Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtDaGFuZ2VzJiMzMjtpbiYjMzI7djI6DQomZ3Q7
JiMzMjstJiMzMjtyZW1vdmUmIzMyO2NhJiMzMjtmb2xkZXIsJiMzMjthbmQmIzMyO2NoYW5nZSYj
MzI7ZmlsZSYjMzI7bmFtZSYjMzI7d2l0aCYjMzI7bG93ZXImIzMyO2Nhc2UNCiZndDsmIzMyOy0m
IzMyO3JlZmluZSYjMzI7dGhlJiMzMjt0Y2lfdCYjMzI7c3RydWN0dXJlJiMzMjt0byYjMzI7bWFr
ZSYjMzI7dGhlJiMzMjtkYXRhJiMzMjt0byYjMzI7dGVlJiMzMjtjYW4NCiZndDsmIzMyOyYjMzI7
JiMzMjt0aHJvdWdoJiMzMjt0aGlzJiMzMjtzdHJ1Y3R1cmUNCiZndDsmIzMyOy0mIzMyO3JlbW92
ZSYjMzI7YXV4JiMzMjthbmQmIzMyO3JlZ3MmIzMyO2Zyb20mIzMyO210a19oZGNwX2luZm8mIzMy
O3N0cnVjdHVyZQ0KJmd0OyYjMzI7LSYjMzI7cmVtb3ZlJiMzMjtzb21lJiMzMjtkZWZpbml0aW9u
cywmIzMyO2FuZCYjMzI7dXNlJiMzMjt0aGUmIzMyO2RlZmluaXRpb25zJiMzMjtpbg0KJmd0OyYj
MzI7JiMzMjsmIzMyO2luY2x1ZGUvZHJtL2RybV9oZGNwLmgNCiZndDsmIzMyOy0mIzMyO3JlbW92
ZSYjMzI7dXNlbGVzcyYjMzI7Y29kZQ0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtm
cm9tJiMzMjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvOGZmZjU5YjU1Njc0NDlkODIwMWRkMTEzOGM4ZmENCiZndDsmIzMy
OzkyMThhNTQ1YzQ2LmNhbWVsQG1lZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO21hYy5zaGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0
Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RydWN0
JiMzMjtoZGNwMl9oYW5kbGVyJiMzMjt7DQomZ3Q7JiMzMjsrdTgmIzMyO21haW5fc3RhdGU7DQom
Z3Q7JiMzMjsrdTgmIzMyO3N1Yl9zdGF0ZTsNCiZndDsmIzMyOyt1OCYjMzI7ZG93bl9zdHJlYW1f
ZGV2X2NudDsNCg0KVXNlbGVzcywmIzMyO2Ryb3AmIzMyO2l0Lg0KDQomZ3Q7JiMzMjsrdTgmIzMy
O2hkY3BfcnhfdmVyOw0KDQpEaXR0by4NCg0KJmd0OyYjMzI7K2Jvb2wmIzMyO3NlbmRfYWtlX2lu
aXQ6MTsNCg0KWW91JiMzMjtzZXQmIzMyO3NlbmRfYWtlX2luaXQmIzMyO3RvJiMzMjt0dXJlLCYj
MzI7YnV0JiMzMjtuZXZlciYjMzI7Y2hlY2smIzMyO2l0LCYjMzI7c28mIzMyO2l0JiMzOTtzJiMz
Mjt1c2VsZXNzLA0KZHJvcCYjMzI7aXQuDQoNCiZndDsmIzMyOytib29sJiMzMjtnZXRfcmVjdl9p
ZF9saXN0OjE7DQoNClVzZWxlc3MsJiMzMjtkcm9wJiMzMjtpdC4NCg0KJmd0OyYjMzI7K2Jvb2wm
IzMyO3N0b3JlZF9rbToxOw0KJmd0OyYjMzI7K2Jvb2wmIzMyO3NlbmRfbGNfaW5pdDoxOw0KDQpZ
b3UmIzMyO3NldCYjMzI7c2VuZF9sY19pbml0JiMzMjt0byYjMzI7dHVyZSwmIzMyO2J1dCYjMzI7
bmV2ZXImIzMyO2NoZWNrJiMzMjtpdCwmIzMyO3NvJiMzMjtpdCYjMzk7cyYjMzI7dXNlbGVzcywm
IzMyO2Ryb3ANCml0Lg0KDQomZ3Q7JiMzMjsrYm9vbCYjMzI7c2VuZF9hY2s6MTsNCg0KVXNlbGVz
cywmIzMyO2Ryb3AmIzMyO2l0Lg0KDQomZ3Q7JiMzMjsrYm9vbCYjMzI7c2lua19pc19yZXBlYXRl
cjoxOw0KDQpEaXR0by4NCg0KJmd0OyYjMzI7K2Jvb2wmIzMyO3JlY3ZfbXNnOjE7DQomZ3Q7JiMz
MjsrYm9vbCYjMzI7c2VuZF9wYWlyOjE7DQoNCllvdSYjMzI7c2V0JiMzMjtzZW5kX3BhaXImIzMy
O3RvJiMzMjt0dXJlLCYjMzI7YnV0JiMzMjtuZXZlciYjMzI7Y2hlY2smIzMyO2l0LCYjMzI7c28m
IzMyO2l0JiMzOTtzJiMzMjt1c2VsZXNzLCYjMzI7ZHJvcA0KaXQuDQoNClJlZ2FyZHMsDQpDSw0K
DQomZ3Q7JiMzMjsrdTMyJiMzMjtzZXFfbnVtX3ZfY250Ow0KJmd0OyYjMzI7K3UzMiYjMzI7cmV0
cnlfY250Ow0KJmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48
L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
YXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2Vk
LCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBs
YXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0
ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwg
cHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
aXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhh
dmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkg
YW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50
cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2Yg
dGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0t
LT4=

--__=_Part_Boundary_009_418581879.1371312161
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gTW9uLCAyMDI0LTAyLTA1IGF0IDEzOjUwICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24gd2hpY2ggd2lsbCBiZSB1c2VkIGZv
cg0KPiBIRENQIDEueCBhbmQgMi54IGF1dGhlbnRpY2F0aW9uIGluIERpc3BsYXlQb3J0Lg0KPiAN
Cj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSByZW1vdmUgY2EgZm9sZGVyLCBhbmQgY2hhbmdlIGZpbGUg
bmFtZSB3aXRoIGxvd2VyIGNhc2UNCj4gLSByZWZpbmUgdGhlIHRjaV90IHN0cnVjdHVyZSB0byBt
YWtlIHRoZSBkYXRhIHRvIHRlZSBjYW4NCj4gICB0aHJvdWdoIHRoaXMgc3RydWN0dXJlDQo+IC0g
cmVtb3ZlIGF1eCBhbmQgcmVncyBmcm9tIG10a19oZGNwX2luZm8gc3RydWN0dXJlDQo+IC0gcmVt
b3ZlIHNvbWUgZGVmaW5pdGlvbnMsIGFuZCB1c2UgdGhlIGRlZmluaXRpb25zIGluDQo+ICAgaW5j
bHVkZS9kcm0vZHJtX2hkY3AuaA0KPiAtIHJlbW92ZSB1c2VsZXNzIGNvZGUNCj4gcGVyIHN1Z2dl
c3Rpb24gZnJvbSB0aGUgcHJldmlvdXMgdGhyZWFkOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvOGZmZjU5YjU1Njc0NDlkODIwMWRkMTEzOGM4ZmENCj4gOTIxOGE1NDVjNDYuY2FtZWxA
bWVkaWF0ZWsuY29tLw0KPiANCj4gU2lnbmVkLW9mZi1ieTogbWFjLnNoZW4gPG1hYy5zaGVuQG1l
ZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4gK3N0cnVjdCBoZGNwMl9oYW5k
bGVyIHsNCj4gKwl1OCBtYWluX3N0YXRlOw0KPiArCXU4IHN1Yl9zdGF0ZTsNCj4gKwl1OCBkb3du
X3N0cmVhbV9kZXZfY250Ow0KDQpVc2VsZXNzLCBkcm9wIGl0Lg0KDQo+ICsJdTggaGRjcF9yeF92
ZXI7DQoNCkRpdHRvLg0KDQo+ICsJYm9vbCBzZW5kX2FrZV9pbml0OjE7DQoNCllvdSBzZXQgc2Vu
ZF9ha2VfaW5pdCB0byB0dXJlLCBidXQgbmV2ZXIgY2hlY2sgaXQsIHNvIGl0J3MgdXNlbGVzcywN
CmRyb3AgaXQuDQoNCj4gKwlib29sIGdldF9yZWN2X2lkX2xpc3Q6MTsNCg0KVXNlbGVzcywgZHJv
cCBpdC4NCg0KPiArCWJvb2wgc3RvcmVkX2ttOjE7DQo+ICsJYm9vbCBzZW5kX2xjX2luaXQ6MTsN
Cg0KWW91IHNldCBzZW5kX2xjX2luaXQgdG8gdHVyZSwgYnV0IG5ldmVyIGNoZWNrIGl0LCBzbyBp
dCdzIHVzZWxlc3MsIGRyb3ANCml0Lg0KDQo+ICsJYm9vbCBzZW5kX2FjazoxOw0KDQpVc2VsZXNz
LCBkcm9wIGl0Lg0KDQo+ICsJYm9vbCBzaW5rX2lzX3JlcGVhdGVyOjE7DQoNCkRpdHRvLg0KDQo+
ICsJYm9vbCByZWN2X21zZzoxOw0KPiArCWJvb2wgc2VuZF9wYWlyOjE7DQoNCllvdSBzZXQgc2Vu
ZF9wYWlyIHRvIHR1cmUsIGJ1dCBuZXZlciBjaGVjayBpdCwgc28gaXQncyB1c2VsZXNzLCBkcm9w
DQppdC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwl1MzIgc2VxX251bV92X2NudDsNCj4gKwl1MzIg
cmV0cnlfY250Ow0KPiArfTsNCj4gKw0K

--__=_Part_Boundary_009_418581879.1371312161--

