Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E826665600E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 06:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE3F10E185;
	Mon, 26 Dec 2022 05:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5995010E185
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 05:18:11 +0000 (UTC)
X-UUID: ddf5864e61f348fc92bee275db43eed1-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3XWHRr61sx6vOcVU3OKssUYChqo4GGhivMVAzQ7iKYM=; 
 b=eKO43BeLdjVYftY6xJKv2cEq4MhytaSuy6MHt8kEHCUqVOP7AlJM/Rts8xM9sALl7x4aQkMYKckdi/TPgCm8tNTa2tA0AsMfyddJKlRLg3idma65GZ3xAOG5C/3hkhFryBLLuzMijkLgSy4wmfEY3iMn4Xp1IceCb/4vV+yH44w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:ea82fe2b-1a5d-4fb0-8bbd-ffa1d91fd6cb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:dcaaed0, CLOUDID:2ee2f0f3-ff42-4fb0-b929-626456a83c14,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ddf5864e61f348fc92bee275db43eed1-20221226
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1675435683; Mon, 26 Dec 2022 13:18:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 26 Dec 2022 13:18:05 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 13:18:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGVVdyr6dQGiN1aC1wZtyyR+iS/9BlFUekdFdBofbVv2X25zKl7KaH1kDLRgSOoABYkeXPfLCfhvm41XBzjCBu2nqJr0wve7HGc3KOyqa5Bx+8JBbvFr3p509yxNkJgsM5S6l14ivCQXnZ4m8hJDmRbSSKaWBy7UesJG46zi7Pye0dZGjMDNeUjgwNtCDAUeANIjhY1eadFAIzhcGU4d7/lOrTcQXenIbPIn110eMw9AaCPKIwXyj/Tm7sg7bHEYe3R8cgwb8gsH0yJ6mwhxPDH4l4kggWElHEFTtsYbXTzwlMXM+63meybTHzkrPs1WFtBKJBagJzEGItDkdZ6VxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAWTdcGt9Dbd3eUrdpJoRlR7cubenrLZesGsWUPYvYo=;
 b=kY0GfmHt1kFCKq2d2a4G/+LNQ3Ypp4rf4fCCNzjs3vm99egtx6LIIytF3AmUTcOxDLvk6Glm/E30OvAMIAefm0NgNbJfsLAVcUKZFRzvRs3CdyAy0cLKflnZEjj9jHJ2DIAwtn6K/VOHEo8lStT7XsQlCHIl1/gzpfm2X8eIdLWhdKdjBiRQZa6NU4rbRGyHSXR7TZptbsOttqUl6lxWKzGPpk8gb+iyrGBC0y5u1SmF6xcZnN9Vl8zlqMRDmXz0Bjxm6Mrnk0jRPgTexs+41EavRu1bQHTmDnL9mRgEhKNmxPiew1y9AOQQidUBADoXxqGrAi2YfMdqQFD1QLVu6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAWTdcGt9Dbd3eUrdpJoRlR7cubenrLZesGsWUPYvYo=;
 b=rSyBjxf3q9dFqmd6scXJSuGQ95y/5tk9epcPnipVptsOLA7V2qVBM09uhVNvOdVxJkm+oHV3qjehFppNywzX4fxuTABqBSq0PordDI1bpPcmMiT0nduiC/GTadDP0ajdRzoMHU+SIaWVBiHp4bTa9yhnwWgDPC7SGFQhCihge1g=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6134.apcprd03.prod.outlook.com (2603:1096:400:12d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:18:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::99:4418:290a:ce5d]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::99:4418:290a:ce5d%9]) with mapi id 15.20.5924.016; Mon, 26 Dec 2022
 05:18:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com"
 <kishon@ti.com>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
 <Chunfeng.Yun@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "granquet@baylibre.com" <granquet@baylibre.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Thread-Topic: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Thread-Index: AQHY8FfX0tvBVNVOZEOAQw3HT5WBbq5/8ioA
Date: Mon, 26 Dec 2022 05:18:03 +0000
Message-ID: <7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-2-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-2-a803f2660127@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6134:EE_
x-ms-office365-filtering-correlation-id: 69bf41d9-a7c4-4ede-e46f-08dae700903b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iya4El/nKvP97+zXKtbf7qNscD0LKT8UhH7bkNSNZw+bT8DJcJ9hinOyDP291IT6UieAJCd/3eU7WnxNfuxKyfkFk4wnZksYLKGUbDakUCFCqbMxpLSh4vWHQfXKDLyTWJj00IklSLwKuc5mDUZavwD2Q6UME7iyO5sQnMx41qII30aAAnFVWDX8iTFBOcyhIzYKyu+4MMXQISoL06JnPYxEuOHdpNHCIQL3RhH1Tk3nSoyNXaX+rLD/olO3pDmpuqPbTrGhuG2QU//YtV4/JaA1faacWTMXQOXikQXpG8a7kSYh4jJwxPNBHwswY9nx1TyMir68q55ojcRNuIWU32CTPDTiUHzUK6rZBpJJz0iJbC2lWwUwZjoMtflpgE9LZ7nJkR9EP1T9DJQoeLJ4em12gU/T6JSXL81dBD8T65AC+UmPhW9DH8hDjmCgtgNjfXcavGd6ONbkhA69PWq2EduH1mBeld6B7TgNAYessU1/8x77C1e7BF1HHH2eGj1Y1M80mpkE34adNZvPGyu57iuuij+SDLhwfPKkJBRRrNeUMLDJ5yKB/k4r0NUmG9rg/d6tDZmc1RIy/xPrJIWJKT1A+RkJh5m7EAEjtDs5oYu+qE33yyhLtXHeTBi8uPDZaiiU0eUBP1qBhA61yFo+koOc6B+5+PmOKhKDVR1uO+lWFXpAzqywt8qUbKQPu+nmNzXe5+2HRCamjleK6iC4UpOfsqP1D+WEfcB0ihwCwX83e2KwPTpu82QzL2VZJTeYLHrpO8UnEQ2+YnZ8o5K5cf7PzhLoU2FYkjqL7lYSW+mRFVXA7avYwC5I3XnNCLtLA1rIhAzcNQO2UlaaZNLA9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(478600001)(71200400001)(6486002)(966005)(316002)(36756003)(2906002)(110136005)(54906003)(85182001)(921005)(83380400001)(38070700005)(38100700002)(122000001)(86362001)(2616005)(6506007)(26005)(186003)(6512007)(5660300002)(7416002)(8676002)(4326008)(76116006)(66946007)(66446008)(66476007)(66556008)(8936002)(64756008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmFlWkU5MFpCVlRNTnFUUzZ6UURSRDZPVUFqeUwxWWlJL251ZUpTMHdZczVG?=
 =?utf-8?B?SlQwOVZNaFhKTDgrZFR0R0lTWXdNR1ZEYkpHcDhUZk9Pelo4Y2RHWTV3Wk5m?=
 =?utf-8?B?VERyL3VPbU1qbm9BdTNuN0dNOWk3OGdWSVVMWDIrZFpFZGwvNGdZd3U2RzJ4?=
 =?utf-8?B?T0llRWZEY2JFdGpScHdzOFhHVUxqWlUzZWZaMVZsRjZWQkNoTU82UlZFZWVv?=
 =?utf-8?B?dSs2cHRxRkxZTklDb0luVnNYMHh5Ukw3a0F4UjRQaU55eWg4MFlXVUV3U0Jx?=
 =?utf-8?B?a0VyYkNhN1lyOTM0aE5EWGtuY2hQWVFlaDFuSmI2bFUvUC9mUHZRN0NiY1V4?=
 =?utf-8?B?RytvUklIdmh5SElhQmpWVkRyT1JxUmpuVXF1NkpsNDhDQmsrbHVud0pLWjhZ?=
 =?utf-8?B?MS9TR2pXZ3ViaEFwVytKVU40cHJ1MG53Yk4zemhUbTFGVVN2dDAxOGROL25k?=
 =?utf-8?B?ZjJHYWdEM0lHczJaMSt4a2RUOVBKNFZ0YkZoQndYa2M1ZmgybU1XY21EeFlx?=
 =?utf-8?B?SUNuYjZTVHBjb1MyNG5aNjAwc0tuTVNnMnY0TVptMzNpUi8rbi95OVEwQW90?=
 =?utf-8?B?dFRZSmhMR2J3RHJ5bjNCNnY5dVZad0JDUFhPK2NxckRFZkdoVHZ0Mm9nTWtE?=
 =?utf-8?B?cThaUmpMcE0rZ21vWU9Qd2pUellISmIzeStGLzZ1OXhvZVZlZEswM1VXYkFF?=
 =?utf-8?B?K0RNKzR0ZWM1SDdwUmdaRFVDMXJUUlpHMHl1dUNKajJRTUlBSzd6azdtNDBV?=
 =?utf-8?B?RTVoYUVVTGNvM284b3FNUDhKWEtXajRaajJzS25zWVVlZCszTnRzTGVic096?=
 =?utf-8?B?NWsrS2NYNnJPcVlXelp0ZENlaC9pQk4xNVZFbXlHdnFxV3RHamszZ1NYWnFT?=
 =?utf-8?B?b2RzcFFXc0Q4SllNSXZEaTJrUWZOQ01tM1NUNTM1akI4Q2ErdWhBU1ViVjIx?=
 =?utf-8?B?K1grQWhHaERtUDJKenhzSnRPbEpzVWZzYUoveFJybGxPRzcvZllzcUxuS2VI?=
 =?utf-8?B?UDZoZEJIcjc5bmtNQmN0SUNvYUdFMk5tWXhnQ3FwblJ0cVc5QjJNaXFpR0lM?=
 =?utf-8?B?amhPak5id3dhOERCWWdOazFVbEprNE51bjNJNkoxSUFOTUJLNXNhMWNvcVpV?=
 =?utf-8?B?UUFsb0dOb0JHaDB2dHlMYStjZ1JzV29UT0hiZjY4cW9IaVd5QTZXcEVqL3FV?=
 =?utf-8?B?MWZ5alJtVTcvTkNENWxlU0FpSzVXdmdiVytkV1Y5VUNBRmh2QnBlVi82MUJr?=
 =?utf-8?B?Qkp6QXpsU1M3MW54bXhGRkxIZFFxMU5xajk3N0RxMFlCemNuMGlxOTdBNm8r?=
 =?utf-8?B?R2I2Sk1TWWVKVEg4RkZ0T1lVeUpvc0FwOGQybmpReTFPaVppWXFUdDBSc1A1?=
 =?utf-8?B?TVBBQk82ZjNtSXJJNVVYRUU0QXZvYThDMnBNbnNmcWRJWHpxdFV3VlJhNWdV?=
 =?utf-8?B?d0VhS0cvN1lwRk44eVd5Z3ZjODhDMWhQTUpLbEx1QjNmUVJZTEpJazVETHIx?=
 =?utf-8?B?YXRGUy9PRHNFUUJzemVWRHZvTE1RbmJNRDhMR3lnSnhmTjlWdXF6WUVzUUlJ?=
 =?utf-8?B?V3Jxc1cvaitQWlNmcE5vQWc1aytZS0ZzVDM2VDRWR3ZnYzY5Sml4b0NpQmZU?=
 =?utf-8?B?WTVGS2hIdDdPNVJZYlZoazlVRlk0U2Z1TzF2Z0F2ZzVLSE01bzROd0UvR1ox?=
 =?utf-8?B?V2dvSDRKb1NYRlozZzdpQ1pyazd6SHk3LzA5Um00NjQ1R01sNjlNd2tiSDFq?=
 =?utf-8?B?cXdDcEkxeVJ6ZEhoR3BOTnlHV0RZQ3JpR0J5SG04TWlNMVY5b3F3NUg0V2Qv?=
 =?utf-8?B?VnArV3A0YzFEeHFIQ0kzMGVJMi8zSWlIM01hYjAwY3JLYTkzQ1lBRzE3UmEw?=
 =?utf-8?B?MDZNZmtYbVlHWnAvbCtDdnZKcWUxN0RQUzlrU0dTVG1kOC9xVDcvNkpkMmZq?=
 =?utf-8?B?KytGMW5qQWwwdVpEUE9PZHFNMVpWTHk5RE9yTUVveUFwYjBodWhaLzZrT29u?=
 =?utf-8?B?SGJQN0lzSzBLVHZCNGVuREhzNTZLWDFWcFc2L0pjOGx0ZUJpdFZyaC9SMUtF?=
 =?utf-8?B?VUNOZzE4N1M2SlZkNjYvcVhkL3l0eGxMUmtFSE1qd0FtSGhqaFRaMTJpNGMw?=
 =?utf-8?Q?4N5EinsbrEaVZ+DRSDJgcpvAR?=
Content-ID: <5B9D832898B92742950E07E29C6BEC18@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bf41d9-a7c4-4ede-e46f-08dae700903b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2022 05:18:03.2050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/AmOSjUGewnJ5KbdFJVyYsFpFgY6JOr3sVtkV2taxe9a4qMF/5uhbXtevXlwn1ozuXpcvNLg9wBOXj6MIYTVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6134
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_29534577.1343943838"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 =?utf-8?B?U3R1YXJ0IExlZSAo5p2O57+wKQ==?= <Stuart.Lee@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_29534577.1343943838
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7R3VpbGxhdW1lOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMi0xMS0wNCYj
MzI7YXQmIzMyOzE1OjA5JiMzMjsrMDEwMCwmIzMyO0d1aWxsYXVtZSYjMzI7UmFucXVldCYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjtBZGQmIzMyO210ODE5NSYjMzI7U29DJiMzMjtiaW5kaW5ncyYjMzI7
Zm9yJiMzMjtoZG1pJiMzMjthbmQmIzMyO2hkbWktZGRjDQomZ3Q7JiMzMjsNCiZndDsmIzMyO09u
JiMzMjttdDgxOTUmIzMyO3RoZSYjMzI7ZGRjJiMzMjtpMmMmIzMyO2NvbnRyb2xsZXImIzMyO2lz
JiMzMjtwYXJ0JiMzMjtvZiYjMzI7dGhlJiMzMjtoZG1pJiMzMjtJUCYjMzI7YmxvY2smIzMyO2Fu
ZA0KJmd0OyYjMzI7dGh1cyYjMzI7aGFzJiMzMjtubw0KJmd0OyYjMzI7c3BlY2lmaWMmIzMyO3Jl
Z2lzdGVyJiMzMjtyYW5nZSwmIzMyO3Bvd2VyJiMzMjtkb21haW4mIzMyO29yJiMzMjtpbnRlcnJ1
cHQsJiMzMjttYWtpbmcmIzMyO2l0JiMzMjtzaW1wbGVyDQomZ3Q7JiMzMjt0aGFuJiMzMjtpdHMm
IzMyO3RoZSYjMzI7bGVnYWN5JiMzMjsmcXVvdDttZWRpYXRlayxoZG1pLWRkYyZxdW90OyYjMzI7
YmluZGluZy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0d1aWxsYXVt
ZSYjMzI7UmFucXVldCYjMzI7Jmx0O2dyYW5xdWV0QGJheWxpYnJlLmNvbSZndDsNCiZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7JiMzMjsNCg0KW3NuaXBdDQoNCiZndDsmIzMyO2EvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LQ0K
Jmd0OyYjMzI7aGRtaS1kZGMueWFtbA0KJmd0OyYjMzI7Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtDQomZ3Q7JiMzMjto
ZG1pLWRkYy55YW1sDQomZ3Q7JiMzMjtuZXcmIzMyO2ZpbGUmIzMyO21vZGUmIzMyOzEwMDY0NA0K
Jmd0OyYjMzI7aW5kZXgmIzMyOzAwMDAwMDAwMDAwMC4uMmRjMjczNjg5NTg0DQomZ3Q7JiMzMjst
LS0mIzMyOy9kZXYvbnVsbA0KJmd0OyYjMzI7KysrDQomZ3Q7JiMzMjtiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS0NCiZn
dDsmIzMyO2hkbWktZGRjLnlhbWwNCiZndDsmIzMyO0BAJiMzMjstMCwwJiMzMjsrMSw1MSYjMzI7
QEANCiZndDsmIzMyOysjJiMzMjtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjomIzMyOyhHUEwtMi4w
LW9ubHkmIzMyO09SJiMzMjtCU0QtMi1DbGF1c2UpDQomZ3Q7JiMzMjsrJVlBTUwmIzMyOzEuMg0K
Jmd0OyYjMzI7Ky0tLQ0KJmd0OyYjMzI7KyYjMzY7aWQ6JiMzMjsNCiZndDsmIzMyO2h0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYy55YW1sKl9fO0l3ISFDVFJOS0E5d01n
MEFSYnchd3dWUXVxNWx6VzBsdlVGVWtWWFBXVDhjSXU5Nnhka240dE1hbXMxRTU1cXl4RVptZ1Yx
aTBXZnBPbHE1N3cmIzM2Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOysmIzM2O3NjaGVtYTom
IzMyOw0KJmd0OyYjMzI7aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchd3dW
UXVxNWx6VzBsdlVGVWtWWFBXVDhjSXU5Nnhka240dE1hbXMxRTU1cXl4RVptZ1YxaTBXZFNHT1N4
encmIzM2Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt0aXRsZTomIzMy
O01lZGlhdGVrJiMzMjtIRE1JJiMzMjtEREMmIzMyO2ZvciYjMzI7bXQ4MTk1DQomZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsrbWFpbnRhaW5lcnM6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOy0mIzMyO0NLJiMz
MjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOysmIzMyOyYjMzI7
LSYjMzI7Sml0YW8mIzMyO3NoaSYjMzI7Jmx0O2ppdGFvLnNoaUBtZWRpYXRlay5jb20mZ3Q7DQom
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZGVzY3JpcHRpb246JiMzMjt8DQomZ3Q7JiMzMjsrJiMzMjsm
IzMyO1RoZSYjMzI7SERNSSYjMzI7RERDJiMzMjtpMmMmIzMyO2NvbnRyb2xsZXImIzMyO2lzJiMz
Mjt1c2VkJiMzMjt0byYjMzI7aW50ZXJmYWNlJiMzMjt3aXRoJiMzMjt0aGUmIzMyO0hETUkmIzMy
O0REQw0KJmd0OyYjMzI7cGlucy4NCiZndDsmIzMyOysNCiZndDsmIzMyOytwcm9wZXJ0aWVzOg0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjtjb21wYXRpYmxlOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7ZW51bToNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMz
MjttZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYj
MzI7Y2xvY2tzOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7bWF4SXRlbXM6JiMzMjsx
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyO2Nsb2NrLW5hbWVzOg0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7aXRlbXM6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7LSYjMzI7Y29uc3Q6JiMzMjtkZGMNCiZndDsmIzMyOysNCiZndDsmIzMyOysm
IzMyOyYjMzI7bWVkaWF0ZWssaGRtaToNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzY7cmVmOiYjMzI7L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGVzY3JpcHRpb246DQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7QSYjMzI7cGhhbmRsZSYjMzI7dG8mIzMyO3RoZSYjMzI7
bXQ4MTk1JiMzMjtoZG1pJiMzMjtjb250cm9sbGVyDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmVx
dWlyZWQ6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOy0mIzMyO2NvbXBhdGlibGUNCiZndDsmIzMyOysm
IzMyOyYjMzI7LSYjMzI7Y2xvY2tzDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOy0mIzMyO2Nsb2NrLW5h
bWVzDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrYWRkaXRpb25hbFByb3BlcnRpZXM6JiMzMjtmYWxz
ZQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2V4YW1wbGVzOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjst
JiMzMjt8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2R0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaCZndDsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvaXJxLmgmZ3Q7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1p
ZGRjMDomIzMyO2kyYyYjMzI7ew0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO2NvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYyZx
dW90OzsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttZWRpYXRlayxo
ZG1pJiMzMjs9JiMzMjsmbHQ7JmFtcDtoZG1pMCZndDs7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7Y2xvY2tzJiMzMjs9JiMzMjsmbHQ7JmFtcDtjbGsyNm0mZ3Q7Ow0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Nsb2NrLW5hbWVzJiMzMjs9
JiMzMjsmcXVvdDtkZGMmcXVvdDs7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjt9Ow0K
DQpJJiMzMjt0aGluayYjMzI7d2UmIzMyO3Nob3VsZCYjMzI7bm90JiMzMjtoYXZlJiMzMjthJiMz
Mjt2aXJ0dWFsJiMzMjtkZXZpY2UuJiMzMjtUaGlzJiMzMjtkZGMmIzMyO2lzJiMzMjtwYXJ0JiMz
MjtvZg0KbXQ4MTk1LWhkbWkmIzMyO2RldmljZSwmIzMyO3NvJiMzMjtqdXN0JiMzMjtrZWVwJiMz
MjttdDgxOTUtaGRtaSwmIzMyO2FuZCYjMzI7bGV0JiMzMjttdDgxOTUtaGRtaQ0KZHJpdmVyJiMz
Mjt0byYjMzI7cHJvYmUmIzMyO3RoZSYjMzI7c3ViJiMzMjtkcml2ZXImIzMyO29mJiMzMjtkZGMm
IzMyO2RyaXZlci4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOysNCiZndDsmIzMyOysuLi4N
CiZndDsmIzMyOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioq
KioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioq
Kg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNs
dWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5
LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8g
dGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRp
c3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWls
IChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMp
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0
aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBk
ZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkg
YXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwv
cHJlPjwhLS19LS0+

--__=_Part_Boundary_004_29534577.1343943838
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEd1aWxsYXVtZToNCg0KT24gRnJpLCAyMDIyLTExLTA0IGF0IDE1OjA5ICswMTAwLCBHdWls
bGF1bWUgUmFucXVldCB3cm90ZToNCj4gQWRkIG10ODE5NSBTb0MgYmluZGluZ3MgZm9yIGhkbWkg
YW5kIGhkbWktZGRjDQo+IA0KPiBPbiBtdDgxOTUgdGhlIGRkYyBpMmMgY29udHJvbGxlciBpcyBw
YXJ0IG9mIHRoZSBoZG1pIElQIGJsb2NrIGFuZA0KPiB0aHVzIGhhcyBubw0KPiBzcGVjaWZpYyBy
ZWdpc3RlciByYW5nZSwgcG93ZXIgZG9tYWluIG9yIGludGVycnVwdCwgbWFraW5nIGl0IHNpbXBs
ZXINCj4gdGhhbiBpdHMgdGhlIGxlZ2FjeSAibWVkaWF0ZWssaGRtaS1kZGMiIGJpbmRpbmcuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUu
Y29tPg0KPiAtLS0NCj4gIA0KDQpbc25pcF0NCg0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS0NCj4gaGRtaS1kZGMu
eWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLG10ODE5NS0NCj4gaGRtaS1kZGMueWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjJkYzI3MzY4OTU4NA0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKw0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLG10ODE5NS0NCj4gaGRtaS1kZGMueWFtbA0KPiBAQCAtMCwwICsxLDUx
IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IA0KPiBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3
IXd3VlF1cTVselcwbHZVRlVrVlhQV1Q4Y0l1OTZ4ZGtuNHRNYW1zMUU1NXF5eEVabWdWMWkwV2Zw
T2xxNTd3JA0KPiAgDQo+ICskc2NoZW1hOiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJO
S0E5d01nMEFSYnchd3dWUXVxNWx6VzBsdlVGVWtWWFBXVDhjSXU5Nnhka240dE1hbXMxRTU1cXl4
RVptZ1YxaTBXZFNHT1N4enckDQo+ICANCj4gKw0KPiArdGl0bGU6IE1lZGlhdGVrIEhETUkgRERD
IGZvciBtdDgxOTUNCj4gKw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCj4gKyAgLSBKaXRhbyBzaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+DQo+
ICsNCj4gK2Rlc2NyaXB0aW9uOiB8DQo+ICsgIFRoZSBIRE1JIEREQyBpMmMgY29udHJvbGxlciBp
cyB1c2VkIHRvIGludGVyZmFjZSB3aXRoIHRoZSBIRE1JIEREQw0KPiBwaW5zLg0KPiArDQo+ICtw
cm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGVudW06DQo+ICsgICAgICAtIG1l
ZGlhdGVrLG10ODE5NS1oZG1pLWRkYw0KPiArDQo+ICsgIGNsb2NrczoNCj4gKyAgICBtYXhJdGVt
czogMQ0KPiArDQo+ICsgIGNsb2NrLW5hbWVzOg0KPiArICAgIGl0ZW1zOg0KPiArICAgICAgLSBj
b25zdDogZGRjDQo+ICsNCj4gKyAgbWVkaWF0ZWssaGRtaToNCj4gKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ICsgICAgZGVzY3JpcHRpb246DQo+
ICsgICAgICBBIHBoYW5kbGUgdG8gdGhlIG10ODE5NSBoZG1pIGNvbnRyb2xsZXINCj4gKw0KPiAr
cmVxdWlyZWQ6DQo+ICsgIC0gY29tcGF0aWJsZQ0KPiArICAtIGNsb2Nrcw0KPiArICAtIGNsb2Nr
LW5hbWVzDQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFt
cGxlczoNCj4gKyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2FybS1naWMuaD4NCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ICsgICAgaGRtaWRkYzA6IGkyYyB7DQo+ICsgICAgICBj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1oZG1pLWRkYyI7DQo+ICsgICAgICBtZWRpYXRl
ayxoZG1pID0gPCZoZG1pMD47DQo+ICsgICAgICBjbG9ja3MgPSA8JmNsazI2bT47DQo+ICsgICAg
ICBjbG9jay1uYW1lcyA9ICJkZGMiOw0KPiArICAgIH07DQoNCkkgdGhpbmsgd2Ugc2hvdWxkIG5v
dCBoYXZlIGEgdmlydHVhbCBkZXZpY2UuIFRoaXMgZGRjIGlzIHBhcnQgb2YNCm10ODE5NS1oZG1p
IGRldmljZSwgc28ganVzdCBrZWVwIG10ODE5NS1oZG1pLCBhbmQgbGV0IG10ODE5NS1oZG1pDQpk
cml2ZXIgdG8gcHJvYmUgdGhlIHN1YiBkcml2ZXIgb2YgZGRjIGRyaXZlci4NCg0KUmVnYXJkcywN
CkNLDQoNCj4gKw0KPiArLi4uDQo+IA0K

--__=_Part_Boundary_004_29534577.1343943838--

