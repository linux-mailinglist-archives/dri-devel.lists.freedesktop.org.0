Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1B762C00
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 08:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CB110E065;
	Wed, 26 Jul 2023 06:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD1E10E065
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 06:56:40 +0000 (UTC)
X-UUID: 8eaa8b762b8111ee9cb5633481061a41-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=8NM4DnRcIVBFDo7X12lPVsHw0xVIb2eRwn7akT3emcY=; 
 b=hAqp+OxTeAbbYEAvFDm0UXsx3JqCiL4fMKdA2fppPMoJaR9rP6iH2QE/PfCr6vcF3I8EgZWt1Zwy6EqmrbcanyFVwqYtqCiHOPJHeaEum8+9tL2KrFUdY7g5mhNec0sk5tKe/kxB+nbUMl5ZKkHhwz+NT4+5+EFmZZxbEQ8EwlA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:4b7f8053-4496-460a-a28c-ba6c2fa7557b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7562a7, CLOUDID:57ac56d2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8eaa8b762b8111ee9cb5633481061a41-20230726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 952933683; Wed, 26 Jul 2023 14:56:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jul 2023 14:56:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jul 2023 14:56:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4f7iGpV0pKy9r5XHMZEmxy8udHl1Q0jhFOGuYwIxofyfL34yv/CEuiMi5sYTJ/1PU/k4ssaxg8cepF34IAKPby/dDORPZOxC/oGFVdP/6KAdjFcS9m1MWw41F4oz82ao6uh3Sdls4SKQQ1WfxR1AOXXllrmOUp7nW3/XXPGlivTWEj1z/Op10uA8vhpykHiP6mNcDx2wqf66o9TBlyRdUJUoW0mdeH/kDDucOTO8o7sPrb3UwBzC/7H5e3IUt2Sh99OkoYQNiuKXcdRzvBBowHA7ZZa7xcy49GpC1crTUr9bSzS3hhqicqqbjkcR5njdbh5nLcmaGFRcb4gxyMldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cTQpbmRGV5ToFO5+RVEyPnwPGEWRCGWgQa5QWD0Boc=;
 b=NvPMQra9iWNI9fXWUZAM1Cd6rNoN2/+EJIe0DdCPry8sjsVsv74qXmvOiou/KC96wADMjUAsh8dy5Kc1AgCB9cE5hHlmRFF8q3I8hTFf0JO17Ux7lo04La9H33qA45saEJCMTw/Zf/0vlHgcLI+68nzqXGhfjaDgN5Ih1sMmvYws/33NlRmQgOJFyQyx9micdYZgsGbA8jiiUeKbgnIgyHnPriWzJllHMo9aSFlds00vJGPXNH76Vb7JDmibj9K5FXAtfhU7dXY1H24XpDKuvATpTI+b/4N81UiwExqjyszXqqLXqM65d0kJkgBcFhaSksfGGhsbTzg0bbMq2PihxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cTQpbmRGV5ToFO5+RVEyPnwPGEWRCGWgQa5QWD0Boc=;
 b=BUdqAvfPfCSIgbUGSujmrKopBlj305pdIRzCisEksfpaPqTxuw4LnBTj1QunrdGaVTCpxY/sRH5SQyYSMLcWu5GzwquApijTQJJqsNm6UkdptqDe0bJjazMsISX03m6+EFOWs4efn1f84AjvUsGBW8bp1djKDuC3eYxCyqh/J0I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6605.apcprd03.prod.outlook.com (2603:1096:400:21a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 06:56:28 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6609.026; Wed, 26 Jul 2023
 06:56:28 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Topic: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Index: AQHZsxGwMq+9pCAEu0Ga9M97Dlv5zq+42rSAgAbd1oCAC/3rgA==
Date: Wed, 26 Jul 2023 06:56:28 +0000
Message-ID: <480ec4606a163e6c2881c1dd904fc99b24e48aae.camel@mediatek.com>
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-3-jason-jh.lin@mediatek.com>
 <9ba9347d4e5e05299fef80707bd1b3c5db61d657.camel@mediatek.com>
 <7adca80c59d5c3cb8d97c24995f824cd7bf5fea2.camel@mediatek.com>
In-Reply-To: <7adca80c59d5c3cb8d97c24995f824cd7bf5fea2.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6605:EE_
x-ms-office365-filtering-correlation-id: 9c0468e6-b7d5-4b37-fdca-08db8da56fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0VyL+g8E8CuvIMbciBhW2LggsHsFFCzCQSAWjjjmpNgTvVxif+M9/J8+rt6G4Y9SbFjVGzlc0ePYHsKnfvJIoI9hXltmNTHcYZWv5K/3yrUdEICr5sgvzcoUoVFelak7y+ffN7spUi27FBl1riZrO4WotPQFuvITI4tBJWovAJVVGQJcySa/UMdUKKNl0INauR16M+UvILfYfxaDoqnZemiUBPmH3coxeBcGHobsmLsBpWWlAV7buD8I2XgM9h7lq93y1/OxIvZ263jHAUmW4FB4gDhUOZn7+ASfO+/jYk8geP4uOQu6ugMSBYnDo4XWsQah1Ue3RikKU4SmZLJoC6UQMpJHctpzaEqrpdta0L7koSrEuko97HhuYUOdC/st+m4BLO3rlCIXpoZWD7biaaOeJiVExwug0RPidUvmAtoycvuJ7LiZpnYzgCTq3o8q8ty0N0CSlNM3zvey+JqiFqPl45EKdoZVsSoA5uowVygCyGhnt9eHEdXFzZsdMSZGAW9oGi5KlE+9s0uLatWdrUCQSuXKW4mPIFGdreCIENjsoYpdYPWNbyuUCDFxiBTul9ZlFQt+IkOwexAr3DYWmYSva4Sz83ztNFOYgFkoXmKuiVaTDT6ounkok8R/9F/UI81b+YKniGgMjImNivjGo4ofQd/GIP9ObSqsQiNBDmI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(36756003)(85182001)(86362001)(38070700005)(2906002)(83380400001)(186003)(6506007)(26005)(6486002)(122000001)(54906003)(38100700002)(6512007)(66946007)(478600001)(110136005)(71200400001)(76116006)(316002)(8936002)(64756008)(8676002)(66446008)(66476007)(2616005)(66556008)(41300700001)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkJNc0hDU0NNamc1Vkw3QkJVL1JJa2w4VkdGZ1FuTGhrejF4MEJBelJJWjZV?=
 =?utf-8?B?d3NlUk02NjBZb1ZvVmR6NDh1dllRYW96WDVhU2MyQ2R0QnZRRXVCV0plK0du?=
 =?utf-8?B?TWhTMUNYMW85ODZudG9PVTREVlV4MTZQazFxZHl6NEVLSHA3VlhwTE5IK2Zp?=
 =?utf-8?B?VXdiYldsZS9rOWxFWXBkMm1UaDYrV2cxWkh1R1gxWklkR3JaODVZb0pvaEIw?=
 =?utf-8?B?bGc2cDdneEpmdy84blRmRUoyWDJ6RUlrdFVUR1g1a2hEVjV2KytLbTZHTjNQ?=
 =?utf-8?B?YWczNDJxdG90K1VMTE80NGtqQkhlOFdhd0hodEo4SXl0bmRzL1V0SmdJV0ta?=
 =?utf-8?B?QjFzdDZoSHlsaFV1MkwwQWNWdWNJV2ZKTUMwd1RlMVBxR09pM2dRRTZzc2JD?=
 =?utf-8?B?QU54MnVvWGd1SWQ5TC9JYXZERzkreFRwMDRkVWcxVFJoQXV1UXdCKzR1cWM0?=
 =?utf-8?B?aTV4YklNN2NnRjBWRDAvaDZXZy9qYUJzUG1BL3cySlVQUko1Yis5ck8xcno1?=
 =?utf-8?B?N0F3Y2RIRTRoa0oxZEZVWXFSNkw3SUpWbERCN09jMTU5WFFaZ1EzTGlMTXI1?=
 =?utf-8?B?U200NjdFT2ROK0hBQk42TVRmVmFvTVhXZkxmMFVTNGlJSkg1QjRtbWZJeXps?=
 =?utf-8?B?MVdYRzhRcTdZeDJCUS82SnZQaE50L2M3YWp3cTAxZjRqZzlhVEFndzUwSWNv?=
 =?utf-8?B?anMrT0VIeXpGUFdyaS93TTRKN1lZQzFxNEVBbUVyTkRraWUzQUc4N3Q1RlJP?=
 =?utf-8?B?ZzdVeldIVGNCN3NIVVFQM3hZdjN3S2F3V21HcWpjNG9ERWpjeFdNTXZrSzk2?=
 =?utf-8?B?a0ovN2JPNWdHRTdvOElpTXJVZFIzMEhRM08rVWRCN1VOREdEYTU3bVlpMHZw?=
 =?utf-8?B?YWxDanNhSUx4blR3SndscmpWZVhHY0YyMGR1YTVFbEQ2WTF3aXJpVTBUSW93?=
 =?utf-8?B?Z3pNQXJmRHlnaE5JZjBvamNCNVVWWXFaMDhiZm9PN2JBZVp0c1pBb0t4b1Fs?=
 =?utf-8?B?RXJhYmNxbWxWYkNnUXZZNXllYlA0eFlLaWpBaURmUG4vYkM2SUR3RnZUdkV1?=
 =?utf-8?B?VktZbXZrVHY4WjVPQVVTTzZYZmVVMHlaaVlEM25BZFUrMVEzUHpyaWl0Skoy?=
 =?utf-8?B?NHZyNE0wY1ptSVl4MmREbVJoNDNHVjBxTVpFTWhydmFES0ZKZlVJOEc5RDMx?=
 =?utf-8?B?UXYrb2YxUXNXT055eHpBbTRmcEtmaTNPVkd6ZEc5VjgwdUlicldNOEhjeEZK?=
 =?utf-8?B?UzNBZGl5YmVHbC9RMGRWS0ZTcVl2azFzSHl2blFwOU1QbDUyNU9iWnJ1Qmw1?=
 =?utf-8?B?UjZBNzQ2aTdBdFVsUU1YWStQSXRGWWhJeWM4QmdudmFtODNwMVRTOTFPRXps?=
 =?utf-8?B?Q3hoajc4bXI3R24wa0ozTkxwMmZnVGEzcEg5dE95VFoxS3g0K2pwbE13ck1S?=
 =?utf-8?B?cFlpaDJmSlN1eXVqQUVsRnl6R2VWaEIrNXFLK1IwTEVzN2RoZUs5WDkxejNr?=
 =?utf-8?B?aFE0S0J1aDdxREdEbXRNSzhFbDV5VHo3WGJNVUtjYk5rRW1MSjJYd2hDalhh?=
 =?utf-8?B?UFBYUnVVQVRoWFZiUEdXKzd1ZFRxY3pEQWVhNlVhQS9GY3U2UHpBQTJuN2d0?=
 =?utf-8?B?OEdIdm4zTURsaWRvMWc2OVpCQXZvMUZFdjZBbFZZZW1qWVR6a01neEwxWFVq?=
 =?utf-8?B?cmRUdDhsUVVieUJrUG5CQVFvdHhKOVp3cnhIam81VTJpc2JSbjhtbzVrZWdN?=
 =?utf-8?B?UFM5VjBJOEhPQmJWbThjT0pwMDdlTjFJcVArRjd5NXVrVGFwcytyd1ZTUy9l?=
 =?utf-8?B?VldmaEpLUFMzb00zWkN0ZTI1Z2tvM1kxOC9oYlBXWll0azcyWUtXS2xZQ29y?=
 =?utf-8?B?TkhRZHB1QWdoSnROQS8zQjRHVDRXZGVWVDdrbmhabkxQcy9aTlU1a251VzZl?=
 =?utf-8?B?SGJKcWZuNDV1SmJHUS9GbXBUOGJDVU9QeEdvRjkxL1lhRGwvdTNzWHNqR3JX?=
 =?utf-8?B?RW5UWGpLbHFWK29DSzhGQnVHelR6YW1vTEowc0ZEOGdqMEJUSkVJU3NLU1RW?=
 =?utf-8?B?Y0dQLzl2U2UvdXpwVjRjVS9VUmFkU3VSelZ1b0lsN1JCbzE0NVlBd2Z6Z1Uw?=
 =?utf-8?Q?HS53weGs7BrkGGiLeZu5DzomT?=
Content-ID: <AFC3ADFAC64E2145A74B22C7ACA72ED8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0468e6-b7d5-4b37-fdca-08db8da56fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 06:56:28.6734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SS7iwqx8G5KOZM+wOQUpkkVLPSIFyvQcZhRtfoQOqMOWhHDEEcP2DWF9kDFmUSReYCgCGlROPrcjHbNTSwgMdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6605
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1097564876.407686165"
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
Cc: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_009_1097564876.407686165
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtUdWUsJiMzMjsyMDIzLTA3LTE4JiMzMjth
dCYjMzI7MTU6NDgmIzMyOyswMDAwLCYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7KCYjMjY1MTk7
JiMzMDU5MTsmIzMxMDc3OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGkmIzMyO0NLLA0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtUaGFua3MmIzMyO2ZvciYjMzI7dGhlJiMzMjtyZXZpZXdzLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtPbiYjMzI7RnJpLCYjMzI7MjAyMy0wNy0xNCYjMzI7YXQmIzMyOzA2OjU3
JiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYjMzI5OTM7JiMyMDQyNjsmIzIwODA5Oykm
IzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7SGksJiMzMjtKYXNvbjoNCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO01vbiwmIzMyOzIwMjMtMDctMTAmIzMy
O2F0JiMzMjsxNzozMiYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7T1ZMJiMzMjtsYXllciYjMzI7c2hvdWxkJiMzMjtub3Qm
IzMyO2JlJiMzMjtlbmFibGVkJiMzMjtiZWZvcmUmIzMyO2NydGMmIzMyO2lzJiMzMjtlbmFibGVk
Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7VGhlJiMzMjtwbGFuZV9zdGF0ZSYjMzI7b2Ym
IzMyO2RybV9hdG9taWNfc3RhdGUmIzMyO2lzJiMzMjtub3QmIzMyO3N5bmMmIzMyO3RvDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUmIzMyO3BsYW5lX3N0YXRlJiMzMjtzdG9yZWQmIzMy
O2luJiMzMjttdGtfY3J0YyYjMzI7ZHVyaW5nJiMzMjtjcnRjJiMzMjtlbmFibGluZywNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO3NvJiMzMjtqdXN0JiMzMjtzZXQmIzMyO2FsbCYjMzI7cGxh
bmVzJiMzMjt0byYjMzI7ZGlzYWJsZWQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0ZpeGVzOiYjMzI7MTE5ZjUxNzM2MjhhJiMzMjsoJnF1
b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtEUk0mIzMyO0RyaXZlciYjMzI7Zm9yJiMzMjtN
ZWRpYXRlaw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7U29DDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtNVDgxNzMuJnF1b3Q7KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
JiMzMjt8JiMzMjszJiMzMjsrKysNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7MSYj
MzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzMmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7LS1n
aXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyO2Q0MDE0Mjg0MmY4NS4u
NTFkMTBlNjUwMDRlJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOy0tLSYj
MzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCiZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9jcnRjLmMNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNDEwLDYmIzMyOys0
MTAsOSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfY3J0Y19kZHBfaHdfaW5pdChz
dHJ1Y3QNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO210a19kcm1fY3J0YyYjMzI7Km10a19j
cnRjKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMz
Mjtsb2NhbF9sYXllcjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3BsYW5lX3N0YXRlJiMzMjs9JiMzMjt0b19tdGtfcGxh
bmVfc3RhdGUocGxhbmUtJmd0O3N0YXRlKTsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOysN
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOysvKiYjMzI7c2hvdWxkJiMzMjtub3QmIzMyO2Vu
YWJsZSYjMzI7bGF5ZXImIzMyO2JlZm9yZSYjMzI7Y3J0YyYjMzI7ZW5hYmxlZCYjMzI7Ki8NCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOytwbGFuZV9zdGF0ZS0mZ3Q7cGVuZGluZy5lbmFibGUm
IzMyOz0mIzMyO2ZhbHNlOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtB
bGwmIzMyO3BsYW5lJiMzMjtoYXMmIzMyO2JlZW4mIzMyO2Rpc2FibGUmIzMyO2luJiMzMjttdGtf
ZHJtX2NydGNfYXRvbWljX2Rpc2FibGUoKSwNCiZndDsmIzMyOyZndDsmIzMyO2RvZXNuJiMzOTt0
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpdCYjNjM7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7WWVzLCYjMzI7aXQmIzMyO2RvZXMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0J1
dCYjMzI7c29tZWhvdyYjMzI7dGhlJiMzMjtwbGFuZV9zdGF0ZSYjMzI7Z2V0JiMzMjtmcm9tJiMz
Mjt0b19tdGtfcGxhbmVfc3RhdGUobXRrX2NydGMtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwbGFuZXNb
aV0pJiMzMjtpcyYjMzI7bm90JiMzMjtzeW5jZWQmIzMyO3RvJiMzMjt0aGUmIzMyO3BsYW5lX3N0
YXRlJiMzMjtpbiYjMzI7YXRvbWljX3N0YXRlLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTbyYjMzI7
SSYjMzI7dGhpbmsmIzMyO3dlJiMzMjtzaG91bGQmIzMyO2Rpc2FibGUmIzMyO292bCYjMzI7bGF5
ZXImIzMyO3RvJiMzMjthdm9pZCYjMzI7aW5jb3JyZWN0JiMzMjtwbGFuZV9zdGF0ZQ0KJmd0OyYj
MzI7YXBwbHlpbmcmIzMyO3RvJiMzMjtPVkwmIzMyO0hXJiMzMjthdCYjMzI7dGhlJiMzMjtIVyYj
MzI7aW5pdCYjMzI7c3RhZ2UuDQoNCkRvJiMzMjt5b3UmIzMyO21lYW4mIzMyO3BsYW5lX3N0YXRl
JiMzMjtpbiYjMzI7YXRvbWljX3N0YXRlJiMzMjtpcyYjMzI7Y29ycmVjdCYjMzI7YnV0JiMzMjtp
dCYjMzk7cyYjMzI7bm90JiMzMjtzeW5jZWQNCnRvJiMzMjttdGtfY3J0Yy0mZ3Q7cGxhbmVzJiM2
MzsmIzMyO0lmJiMzMjtzbywmIzMyO3RoZSYjMzI7YXRvbWljX3N0YXRlJiMzMjtpcyYjMzI7Ynlw
YXNzZWQmIzMyO2ludG8NCm10a19kcm1fY3J0Y19hdG9taWNfZWFuYmxlKCkmIzMyO2FuZCYjMzI7
eW91JiMzMjtjb3VsZCYjMzI7c3luYyYjMzI7aXQmIzMyO2hlcmUuDQoNClJlZ2FyZHMsDQpDSyYj
MzI7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMyO0phc29uLUpILkxp
bg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtDSw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyO2NvbXAmIzMyOz0mIzMyO210a19kcm1fZGRwX2NvbXBfZm9yX3BsYW5lKGNy
dGMsJiMzMjtwbGFuZSwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZhbXA7bG9jYWxfbGF5
ZXIpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtpZiYjMzI7KGNvbXApDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO210a19kZHBfY29tcF9sYXllcl9jb25maWcoY29t
cCwmIzMyO2xvY2FsX2xheWVyLA0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJl
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

--__=_Part_Boundary_009_1097564876.407686165
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUdWUsIDIwMjMtMDctMTggYXQgMTU6NDggKzAwMDAsIEphc29uLUpI
IExpbiAo5p6X552/56WlKSB3cm90ZToNCj4gSGkgQ0ssDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXdzLg0KPiANCj4gT24gRnJpLCAyMDIzLTA3LTE0IGF0IDA2OjU3ICswMDAwLCBDSyBIdSAo
6IOh5L+K5YWJKSB3cm90ZToNCj4gPiBIaSwgSmFzb246DQo+ID4gDQo+ID4gT24gTW9uLCAyMDIz
LTA3LTEwIGF0IDE3OjMyICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gPiBPVkwgbGF5
ZXIgc2hvdWxkIG5vdCBiZSBlbmFibGVkIGJlZm9yZSBjcnRjIGlzIGVuYWJsZWQuDQo+ID4gPiBU
aGUgcGxhbmVfc3RhdGUgb2YgZHJtX2F0b21pY19zdGF0ZSBpcyBub3Qgc3luYyB0bw0KPiA+ID4g
dGhlIHBsYW5lX3N0YXRlIHN0b3JlZCBpbiBtdGtfY3J0YyBkdXJpbmcgY3J0YyBlbmFibGluZywN
Cj4gPiA+IHNvIGp1c3Qgc2V0IGFsbCBwbGFuZXMgdG8gZGlzYWJsZWQuDQo+ID4gPiANCj4gPiA+
IEZpeGVzOiAxMTlmNTE3MzYyOGEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBEUk0gRHJpdmVyIGZvciBN
ZWRpYXRlaw0KPiA+ID4gU29DDQo+ID4gPiBNVDgxNzMuIikNCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDMgKysrDQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiA+ID4gaW5kZXggZDQwMTQy
ODQyZjg1Li41MWQxMGU2NTAwNGUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYw0KPiA+ID4gQEAgLTQxMCw2ICs0MTAsOSBAQCBzdGF0aWMgaW50
IG10a19jcnRjX2RkcF9od19pbml0KHN0cnVjdA0KPiA+ID4gbXRrX2RybV9jcnRjICptdGtfY3J0
YykNCj4gPiA+ICAJCXVuc2lnbmVkIGludCBsb2NhbF9sYXllcjsNCj4gPiA+ICANCj4gPiA+ICAJ
CXBsYW5lX3N0YXRlID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7DQo+ID4gPiAr
DQo+ID4gPiArCQkvKiBzaG91bGQgbm90IGVuYWJsZSBsYXllciBiZWZvcmUgY3J0YyBlbmFibGVk
ICovDQo+ID4gPiArCQlwbGFuZV9zdGF0ZS0+cGVuZGluZy5lbmFibGUgPSBmYWxzZTsNCj4gPiAN
Cj4gPiBBbGwgcGxhbmUgaGFzIGJlZW4gZGlzYWJsZSBpbiBtdGtfZHJtX2NydGNfYXRvbWljX2Rp
c2FibGUoKSwNCj4gPiBkb2Vzbid0DQo+ID4gaXQ/DQo+ID4gDQo+IA0KPiBZZXMsIGl0IGRvZXMu
DQo+IA0KPiBCdXQgc29tZWhvdyB0aGUgcGxhbmVfc3RhdGUgZ2V0IGZyb20gdG9fbXRrX3BsYW5l
X3N0YXRlKG10a19jcnRjLQ0KPiA+IHBsYW5lc1tpXSkgaXMgbm90IHN5bmNlZCB0byB0aGUgcGxh
bmVfc3RhdGUgaW4gYXRvbWljX3N0YXRlLg0KPiANCj4gU28gSSB0aGluayB3ZSBzaG91bGQgZGlz
YWJsZSBvdmwgbGF5ZXIgdG8gYXZvaWQgaW5jb3JyZWN0IHBsYW5lX3N0YXRlDQo+IGFwcGx5aW5n
IHRvIE9WTCBIVyBhdCB0aGUgSFcgaW5pdCBzdGFnZS4NCg0KRG8geW91IG1lYW4gcGxhbmVfc3Rh
dGUgaW4gYXRvbWljX3N0YXRlIGlzIGNvcnJlY3QgYnV0IGl0J3Mgbm90IHN5bmNlZA0KdG8gbXRr
X2NydGMtPnBsYW5lcz8gSWYgc28sIHRoZSBhdG9taWNfc3RhdGUgaXMgYnlwYXNzZWQgaW50bw0K
bXRrX2RybV9jcnRjX2F0b21pY19lYW5ibGUoKSBhbmQgeW91IGNvdWxkIHN5bmMgaXQgaGVyZS4N
Cg0KUmVnYXJkcywNCkNLIA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBKYXNvbi1KSC5MaW4NCj4gDQo+
IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gPiA+ICAJCWNvbXAgPSBtdGtfZHJtX2Rk
cF9jb21wX2Zvcl9wbGFuZShjcnRjLCBwbGFuZSwNCj4gPiA+ICZsb2NhbF9sYXllcik7DQo+ID4g
PiAgCQlpZiAoY29tcCkNCj4gPiA+ICAJCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAs
IGxvY2FsX2xheWVyLA0K

--__=_Part_Boundary_009_1097564876.407686165--

