Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2624E939B92
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 09:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24C510E44F;
	Tue, 23 Jul 2024 07:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="hTQVnPJe";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="a9Wli0ed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4639F10E44F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 07:16:35 +0000 (UTC)
X-UUID: 7869029c48c311ef87684b57767b52b1-20240723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=0M6c+xetGJI9JSJWpv5flQgRg0iJ0Jbbdr5WeNrNZ/Y=; 
 b=hTQVnPJedWioBPFAWruZFr4SeJ+uTtEiqjIwzYuP9ncjFljL4DXNDQdA7fpiKxRW3/HPtibj7KaiBxroG2V0Tp1Ru7C7bsK/18jYwsW/EfDfWSxELB+Tmi3CwwZQrLXXTNovd5pbSwUiJ4oDaXwAv0n92RmrX6Xt8vgXJZbV9zI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:0a2be2e2-636b-44c1-bb3a-6725e6a6fac9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:4210cfd1-436f-4604-ad9d-558fa44a3bbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7869029c48c311ef87684b57767b52b1-20240723
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 671975047; Tue, 23 Jul 2024 15:16:24 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 Jul 2024 15:16:22 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 Jul 2024 15:16:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJIBE3BygHpwt1hfcPyLwGdxZAgJ/ekdN1jeIQ4DAYKdpo5F317inlvuHndtUiNbrTyIzf0qEHfj3iV1+BiwlZ7WFmSsW3eBUN4KEdtn0ooFu/Rd6s7PfeZ1+wJibDHhyY0lnubUP2vZsGbqRkg/IaT/oc1SzGn3pCl8ndvqkPECWa5GaB73p1pxAsbKmKhL4Fi2/Iorhq04ZxTWZ2jI5cTUpNRqysYdq08IzJakekGvK/pCi8btEwhhUo4El6hp301n6fGdsHMZn0WRJQDZQ2jsJ3LEcxH+ELc2QqTleKktplCROBH1lYc6uFuq9HUl6nAUXfZZRn+uKxGBQ312dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX50yLXkKrvQspQbKyLAlNvDgjtqJsweWh9EL0lXc48=;
 b=fkWRluBMKBcMDaDkHcTkR0APoa0dq2vj1SMZsVNOK29YldltCmJF/N61TuJox0q/F2OLQXgAxO6NmQqhLWlVpt7gFkZX8p7DWdXvrilRLkkajSScNnXnsk+pnFITXYxCkN6gmunSTFwIO+UTYEM72Os2kG9Qb5U1gjsn2rxTXvXmMZZKqNpppxmlMJqzmPXd6rkhvkaC6L6Fyn1djfycecjK+ynF4u9nVH3TxyOY+9N/t3kmdPWccKM1ER1Hvlszv3B1SBaLoT/JUDP8zyxL5V8Oy9Cwakuxp2wSuBz/+aypK2DbYSHQ3s4m4LdyEEFOQsrRMrXNZ0VGhqOCx1hgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX50yLXkKrvQspQbKyLAlNvDgjtqJsweWh9EL0lXc48=;
 b=a9Wli0ed0pjB+r/E7MWpFBIA6ayBxP940jndZCFs0SAZVJTW0f0aGUdepT8xIRlkyyvTVkRmpAKIwihgoTahrwAbD2DhJnUnfQ/YrBOsHZOtfZhsTpd6jsucF48sVysZ+jS1JZHm/4jIWqMZRRi9sb820H4FUnV7kO5pyHAGE2o=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6758.apcprd03.prod.outlook.com (2603:1096:4:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 07:16:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 07:16:20 +0000
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
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLIELTWA
Date: Tue, 23 Jul 2024 07:16:20 +0000
Message-ID: <eac00029998344824f3cee871c41938551ee9f99.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6758:EE_
x-ms-office365-filtering-correlation-id: a20532ce-4c5e-498d-f030-08dcaae759cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RzMwMXU5V1VDRHAxVS9RQTh6TDh6Zllsd3VuUGxub3hBZEoxblVjdTc0MXph?=
 =?utf-8?B?V2diRjJnTEFvNHVNQ0VtWkpXNGl0Z1pyaXMrc1Q2RHVXMEQ3OFJWOXNabmlq?=
 =?utf-8?B?TXUrSHR0YUFRRG5JTytsK21GYjdobW5hMUdQNWFEdm5zU0lBNXd3SUFIcVMy?=
 =?utf-8?B?OGw3c0xsUk1OVTBkWWFFTU82SU80UjRncHQydXc4M3p6YjdkVVNmTDJFOUFh?=
 =?utf-8?B?dm1ob0o1djdudm8zUzlBTWxsNUlTM0lTd1ZCUlNEMFVadFA0USt4aEZmSko1?=
 =?utf-8?B?aFN4ekxhZlYwK1hiK1RkSlNiOWRBU1hTUW5Ga2FEOHpNZ1NaUCtUdEVHaGxV?=
 =?utf-8?B?QzlDUjVBN1RvSStRYk5HaENCN0F4U2c3dWRWUVhuWSttajl0TXhaemRPSVZR?=
 =?utf-8?B?YkF3OWRpU015K0VYZDc4bFVJbTR4eXpocXlacU9ZdFM4RUpBNXFkZ3J6cnhk?=
 =?utf-8?B?bjRrMnBRSUhUQ2ZGdnJVaEExM21WSHMyYlM2ZHplcWFBbjB4TTlrRGFzN0My?=
 =?utf-8?B?WU84QmZqSG5OR2RzNk5JQ1AvTlo0SWVqSW1ncjhiajNrTnV1UUhJREswRHFv?=
 =?utf-8?B?RmFmVXF3Nmw4b2dGYnlMQmFxTUg4cEV1c25sTG1tOXZIbVIyNHRXa0Q4aUNG?=
 =?utf-8?B?ekJEdG8rdU5FakpvMy9BRStEOWRkRUl6S200M21lNjBIb1Y2cnZlS2FmbUho?=
 =?utf-8?B?b25IODRmTEhzYnlwUkkwWDFGUTVQU0FPdHpVbnh4dHNudW1PUjduaGxGZ2pq?=
 =?utf-8?B?YmtqWWRSTjh3TlFQZklYSkt6dUl2VUxIT2UzM3lvM0lzRkVnZnRncnFubFhr?=
 =?utf-8?B?elhGWVNKQWd1cU1RR1JWZ3lvN0pFT29qaEtiV0ZzRzd3TXF4WGplWElnNzdZ?=
 =?utf-8?B?c09xeG9jazRlbUhQY1BscTl1Tkw2YmZRV3pWZWJQcHVpYzJyV2orOVV1OHJW?=
 =?utf-8?B?V1BOaFpBN2srb1FHRGt3OUl4VjhlR2taV0VqZUcvbEpNWXpYNUdIZDFuQ0Fv?=
 =?utf-8?B?OHBZQjZYbDhPR3VYR2NFbUNwbVl2aEpWOFJkMXFLZnlodk5OcVc2alpVTVZB?=
 =?utf-8?B?cVExa2QwMmpWcXhTOTR5NExNOWFPenFyOEhKbG9EdzBJZys1OER3TWZuVzJ2?=
 =?utf-8?B?eFdadFRncE1aU3BoeWlKd3JRUjYyVisvdURUd1hsUlJUTFBodW8yQmVZTGF1?=
 =?utf-8?B?NFB6dGkxbTNjaXpzbStxTmR6SGZwS3FnMUQ3Vm5YOTE0T2FsTjZmYkVaRHlY?=
 =?utf-8?B?cThZYUxJRHJEWDhXSGNrRXlvTjhSUXdRQTYyRnhJcjY1SHV2UXFGL2pQOHc0?=
 =?utf-8?B?RUE4TUdBakJZc1Nha3RyNzBFaUJFcUFBdVpwdmZ5akR3bjRWUlFsbnRJdHU2?=
 =?utf-8?B?b0JrOTVVanVLOVk0dU9Ja1ZKSEp2ZXVIYnZIVEkyRi9KZDVVcTkwSWhka0Ju?=
 =?utf-8?B?ZW1XdXFwbFRZSjE0Y293TnY2bC9oNTlIeTlNM3c0bXZXczVIZndzcllQY3I1?=
 =?utf-8?B?TjN6ZEdnSEJHZGdYdXlzd1M0VHBvWU9UOTlzdnpIdEdaamx3M0FHRWZFclVh?=
 =?utf-8?B?eHVpTVh6aWY3aGtFQ1FObmhPRVhRVStkbkYyMGg0cExkNWdIZHQwdmVoQkVR?=
 =?utf-8?B?amRPa1BJV2JaWVQ1cnFlbHprMm4yTlJid1kwQ0dJOVM2MlhwTUR5MlhmMmVB?=
 =?utf-8?B?L3dHS2FYK2UyYUlOMnRlVjlwMUdNMndZVmNXVnVUbnV6TE41bkdVNm1UU2Ra?=
 =?utf-8?B?WlJaYW5ZZ1MzZlFSWGlYZHc4dURVdzFTMmdMei82T1Fvd29NOHRiejJqTUR2?=
 =?utf-8?Q?gXAyZlffpTUw8z5dfCDaFWv7ldIfHuZAZHgW4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDJPWmtGRjVjdGdTTjFxTVY2L2ZkNTNNMkVrWGJVeXhUK3lZSXRUcXl4SUl6?=
 =?utf-8?B?TERFTnlwNUNvS2ppKzhNUVJvSy9VaE5hZnAzVUVDOFJ1M0UxWDNrRFIydk5Q?=
 =?utf-8?B?QlJ2ZGh5RGxtWnNNejg2aXdEeTVaZTQ1Y01JcEJkcy9hNHdiWlI0M3FjMytL?=
 =?utf-8?B?MWNOOERVb0YvRHZEbjBFNTV1SWtZU2hJeXdqMGFkTXdNT3VFM1lOR004Y2RS?=
 =?utf-8?B?NkdLaWwwM29DZS92Q1dKWnlVOEJWb1F4OGdUZjlXOXFQY2RneU82Qm1rQzg5?=
 =?utf-8?B?Q09hc2RPcXRwc2p6VjI1RjJld2FYNHAyWXUrREZKMGx4ejdBR2ZSSWpxNEti?=
 =?utf-8?B?SVNWcWFscFgvTVpkRjVvd1dzQUNLOUkvRVdvQWNRRVJsYVcvUjFVdVlqNzFG?=
 =?utf-8?B?Yk9RYzZDT0JnK3dYU2pTT0JvQkJwb0hobzA2NVdVT200eWJ0blhUdXdKTXJJ?=
 =?utf-8?B?bnB1UGwrSnlqVlo0UVB3RUlSbXdLZjFicUJzK2NVYklWancyMHpWQjZkdDli?=
 =?utf-8?B?cDJGTzh2SEhiOHV6T3ZLT0FUNjAwR0ZkZjhFWCtUM0cyQ0Jvc0NENTB0SFZQ?=
 =?utf-8?B?RjlvY2cyYjFFdWdmUzdTVUhXdzJTWU1zRFdlc1hZMnQ4YWthMDF1bW5WaWpw?=
 =?utf-8?B?UjU1S1dOSjRkOXYyZHdndWQ5bFVOWG9hT1N0YmkyQUZqdkdqRis3dVY2Z1U3?=
 =?utf-8?B?czZoZ2VZeWpSbVZiTTV1U3ZNSnRON3hEbzRJRGhaY0RmMEF2WGFOWWFsUlRM?=
 =?utf-8?B?cjMxMWttTXhleWVsWDIvbStYMlVqc1N1Zkl0R3k0VkFSdDNWdUxtRTBRaElC?=
 =?utf-8?B?cUVYS3hmY3h3ek1rZlFaR3dvZ1lXVWVrNWFjL0NTY1pTRTFoMEt6dVFpSCtN?=
 =?utf-8?B?SzFPSnlZWGdaeG96YngyZ0NTclVQeGdBbi95NERmVm1uSUlEMzY3UzFhNHZj?=
 =?utf-8?B?Y3h0MVBwd3pjb2FRL1NKZlduOVpZVyt1V29OUkg4all3bWVPaFZ3RTd5SGFn?=
 =?utf-8?B?c2x3Q3NPaTJiaFFBN2liRytqbG5uNVEyT2F1VHFMVUt0ZDRpRG13cVR1eE5E?=
 =?utf-8?B?NjNvRko1Q285ZUFWWkQ3ZGM1R05XUGJtR0lFVGwvYlFBdU5UU2NJdFRLZFA0?=
 =?utf-8?B?QnlHWUpRSUhTdEMvRVR0MTE3WGNsTTRsMUF5VWNUYzEyMXlLMm8zeFE3SzNO?=
 =?utf-8?B?bDRsKzQ0NVErR3RBQlYrR05rVnJNa3FYZlJJV0hibW5vV2U2Wm9aYmF5RWJV?=
 =?utf-8?B?dGszUkh2dkIzdTJoYjFoZUlIbCsrSmtwanA3c1k4VjNaUmEvNlVOTW50MVpr?=
 =?utf-8?B?aCttQVZnVEUwNlFZZzNYMTFiOHp2dmtuZzhqWWJxWXlVM3BEM0N3Z3dQaHJM?=
 =?utf-8?B?cXJkcmFBZmsrNGZHUnc3OVZlWVpaelM0akRTNmNWbTZqTjE5WlZueW9lZDRk?=
 =?utf-8?B?aFIxZGZ0VEJRWERmUkhldXZ3aERCU0R4VWxyZHlXbnZKL05YakdOVUd2RlZH?=
 =?utf-8?B?clh0MW1yRUVyTnF4THZsd3lQc0QycU1FM2xmSVJ5bEk2cFR3bDlUWWJBa0pR?=
 =?utf-8?B?NmpuUUVWZDhwL1NKSy9ET1NPQWlBak10K2d5TFdoZ0hxbEFLVktOS1hpaUZP?=
 =?utf-8?B?SlE1dG1WbTkrUTR4MWxkTktQaDJXOE1jWnFiRHNmYVl1VnY5b2JEM3V1a0Vy?=
 =?utf-8?B?blJERklWcVIxVlFXVk5DazQrWGhxd0tZclJLZlh0NmhWQXNlamlNcVNQMjc0?=
 =?utf-8?B?M05jWFMxN285MElzQWx6dEpCNnVFVHdZTHZKdEU3OWo0a2FXUFI3Tk1Ua2Jx?=
 =?utf-8?B?RE9BMVIyWTJ0NUJHajlQcFdHQUhxd3VGbWt5NHBuVnFlU3VyK0gwVFp1MTRL?=
 =?utf-8?B?V3VpTkxxa0lsM2hTT3FUeDFIeHkrb25RVnBaRURiRmt0eEJaVDRQNXp4L1Ur?=
 =?utf-8?B?OEcydUNVMWxqTXJ0R2d1NDFRUGE1TEhnTW42bmhnemhJbXNzaTl5TnJsbmRZ?=
 =?utf-8?B?U29jd3hPOCtZS1hNcjBDbjU3MmxRaGF6ejhmbnNFZWJBSXZkUXhpRkF6c2dm?=
 =?utf-8?B?RGVLNCtIcmZhTWt3NFZEQUhGN3h1L2QyM2ROUlpGRlVmbGdSaUEvcmkrRmhx?=
 =?utf-8?Q?TGpl/MWsXv3qV5MCFcbuM0RZd?=
Content-ID: <93BD2C6DA6223D4FA669AEAEA0ED4E55@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20532ce-4c5e-498d-f030-08dcaae759cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 07:16:20.0351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZ6oQNEw0aMghHRx4Y3ucred14UYOnnmJ9Bl/nT1nbVzCra3mre7GfumN1mkykDR+ExXrQ4CqJj70KEiIYQlsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6758
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.771000-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/vPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxXA7rTaHAw771A
 /V6RVDjDMqtZwXDJcJxiPmy8WTo67rNUVnqixiMOGVyS87Wb4lzSv+oK79xjnUYvSDWdWaRh8ha
 W4U9IrFqFWYX2TPbDEjkjHQF/IwVgiHPr8+FqMNOiAZ3zAhQYgpnaxzJFBx6vV+MOvGRW7mIcBB
 CFbDP5KSGPgk0IpyWwKqt2FG1/DdBC/bXMk2XQLIMbH85DUZXyseWplitmp0j6C0ePs7A07Vg3w
 wZ5miMr5ZmNlSF8nTTX1C5hTfm/YCXtwB/suGQJXzBn3TzGus6b3sHrlB6maguaUA5gAcPe3r85
 /ZE6oEAvbu2CuV38Ee0LUhWJ/IFbOfbyAG+7N/vQTXPmYM0+8Ng2r9cuAAjdn6JI6Uotz6TAvpL
 E+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.771000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F925F137968BC4DE2C6C6ABE691FB0E921F141AB3C09CE20890BD1C96297111F2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1371289355.426540559"
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

--__=_Part_Boundary_009_1371289355.426540559
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
DQoNCj4gKw0KPiArc3RhdGljIGludCBkcF90eF9oZGNwMnhfaW5pdChzdHJ1Y3QgbXRrX2hkY3Bf
aW5mbyAqaGRjcF9pbmZvKQ0KPiArew0KPiArCWludCByZXQ7DQo+ICsNCj4gKwltZW1zZXQoJmhk
Y3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4LCAwLCBzaXplb2Yoc3RydWN0IGhkY3AyX2luZm9f
dHgpKTsNCj4gKwltZW1zZXQoJmhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3J4LCAwLCBzaXpl
b2Yoc3RydWN0IGhkY3AyX2luZm9fcngpKTsNCj4gKwltZW1zZXQoJmhkY3BfaW5mby0+aGRjcDJf
aW5mby5ha2Vfc3RvcmVkX2ttLCAwLCBzaXplb2Yoc3RydWN0IGhkY3AyX2FrZV9zdG9yZWRfa20p
KTsNCj4gKwltZW1jcHkoaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHguYWtlX2luaXQucl90
eCwgdF9ydHgsIEhEQ1BfMl8yX1JUWF9MRU4pOw0KPiArCW1lbWNweSgmaGRjcF9pbmZvLT5oZGNw
Ml9pbmZvLmhkY3BfdHgudHhfY2FwcywgdF90eF9jYXBzLCBIRENQXzJfMl9UWENBUFNfTEVOKTsN
Cj4gKwltZW1jcHkoaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHgubGNfaW5pdC5yX24sIHRf
cm4sIEhEQ1BfMl8yX1JOX0xFTik7DQo+ICsJbWVtY3B5KGhkY3BfaW5mby0+aGRjcDJfaW5mby5o
ZGNwX3R4LnNlbmRfZWtzLnJpdiwgdF9yaXYsIEhEQ1BfMl8yX1JJVl9MRU4pOw0KPiArDQo+ICsJ
cmV0ID0gZHBfdHhfaGRjcDJ4X2VuYWJsZV9hdXRoKGhkY3BfaW5mbywgZmFsc2UpOw0KDQpCeSBk
ZWZhdWx0LCBhdXRoIGlzIGRpc2FibGVkLiBTbyB0aGlzIGlzIHJlZHVuZGFudC4NCg0KUmVnYXJk
cywNCkNLDQoNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJu
IDA7DQo+ICt9DQo+ICsNCg==

--__=_Part_Boundary_009_1371289355.426540559
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
bmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hk
Y3AyeF9pbml0KHN0cnVjdCYjMzI7bXRrX2hkY3BfaW5mbyYjMzI7KmhkY3BfaW5mbykNCiZndDsm
IzMyOyt7DQomZ3Q7JiMzMjsraW50JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrbWVt
c2V0KCZhbXA7aGRjcF9pbmZvLSZndDtoZGNwMl9pbmZvLmhkY3BfdHgsJiMzMjswLCYjMzI7c2l6
ZW9mKHN0cnVjdCYjMzI7aGRjcDJfaW5mb190eCkpOw0KJmd0OyYjMzI7K21lbXNldCgmYW1wO2hk
Y3BfaW5mby0mZ3Q7aGRjcDJfaW5mby5oZGNwX3J4LCYjMzI7MCwmIzMyO3NpemVvZihzdHJ1Y3Qm
IzMyO2hkY3AyX2luZm9fcngpKTsNCiZndDsmIzMyOyttZW1zZXQoJmFtcDtoZGNwX2luZm8tJmd0
O2hkY3AyX2luZm8uYWtlX3N0b3JlZF9rbSwmIzMyOzAsJiMzMjtzaXplb2Yoc3RydWN0JiMzMjto
ZGNwMl9ha2Vfc3RvcmVkX2ttKSk7DQomZ3Q7JiMzMjsrbWVtY3B5KGhkY3BfaW5mby0mZ3Q7aGRj
cDJfaW5mby5oZGNwX3R4LmFrZV9pbml0LnJfdHgsJiMzMjt0X3J0eCwmIzMyO0hEQ1BfMl8yX1JU
WF9MRU4pOw0KJmd0OyYjMzI7K21lbWNweSgmYW1wO2hkY3BfaW5mby0mZ3Q7aGRjcDJfaW5mby5o
ZGNwX3R4LnR4X2NhcHMsJiMzMjt0X3R4X2NhcHMsJiMzMjtIRENQXzJfMl9UWENBUFNfTEVOKTsN
CiZndDsmIzMyOyttZW1jcHkoaGRjcF9pbmZvLSZndDtoZGNwMl9pbmZvLmhkY3BfdHgubGNfaW5p
dC5yX24sJiMzMjt0X3JuLCYjMzI7SERDUF8yXzJfUk5fTEVOKTsNCiZndDsmIzMyOyttZW1jcHko
aGRjcF9pbmZvLSZndDtoZGNwMl9pbmZvLmhkY3BfdHguc2VuZF9la3Mucml2LCYjMzI7dF9yaXYs
JiMzMjtIRENQXzJfMl9SSVZfTEVOKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXQmIzMyOz0m
IzMyO2RwX3R4X2hkY3AyeF9lbmFibGVfYXV0aChoZGNwX2luZm8sJiMzMjtmYWxzZSk7DQoNCkJ5
JiMzMjtkZWZhdWx0LCYjMzI7YXV0aCYjMzI7aXMmIzMyO2Rpc2FibGVkLiYjMzI7U28mIzMyO3Ro
aXMmIzMyO2lzJiMzMjtyZWR1bmRhbnQuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsraWYm
IzMyOyhyZXQpDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMz
MjsrcmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCg0KPC9wcmU+DQo8L3A+
PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_009_1371289355.426540559--

