Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59EF7BB1F5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851210E1FF;
	Fri,  6 Oct 2023 07:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3779810E1FF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:09:14 +0000 (UTC)
X-UUID: 3f558a20641711eea33bb35ae8d461a2-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=s+yNnbjWsNekkYhtrGt2EPR+REvKVQTxb7CgqHs0Sz8=; 
 b=fngpXy226KgPs6CqNEhd6v/jgLaISi/3a1F71zpDzBWI4g+dJLOQXbfPLZS7DKAfQi9nVVFEe+v1PtTXG7ynCMkl/hbeV5/r3My0tOpSEB+T4DVLbwOrfl4+cJFCJEOX2jcfFM7JzKFQJEbw8AGaSuguajJBTgMkp86V4rbiFdc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:422fcc71-017d-4c6b-b819-4af59f7a2ff1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:4115a6bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3f558a20641711eea33bb35ae8d461a2-20231006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1074399542; Fri, 06 Oct 2023 15:09:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:09:09 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:09:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3pjzqXPfPYDmbaek/xnOIYqUKn7CTCLGasvWtERwSa1AS2wHYTqUURPgHJKwp5X6K9CjvadGMc8//7ruaKhm36+kDY+99rBwnRbcqgounqsy0WO2b3RN7kXpRveDQleZV2lFtC3cNiu4aHqJXDcGvCz8Ops8F/ZQ1tytmGFSAbAlM2pJGQ2O4cJy0PqKA9JVx+S8oblOO0nmgppaiezLxpuzp2SyU+Ve9Kl8PKkVbNlOHY7QESFdaYDwxjSSGISl3LEKb4L5/HUtTDqYaDSuA0Fryc2IgKJRdiZMfVhwksOt2XKo0VZDkG6d12XqO2jTP4lXMg4BLl6wvGYb+MQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aidq70Oh+m/FqtjfbwDDfApySMt8JJPvAitbPcWFLAU=;
 b=oM2zz7dBtbg8NRuRymRNDBHzrCBcMuuaB0MM5I78qr/eCQm9/vAW7Jxy79qKfu9jpJHvFPnmD5H0RuAFulCnmhI/hOiDkRv0uxm+ByZufdn3uiDMi1tgF4MubJ6Gq6Vk5KFcYfafklB/PGUd2T8oqK7jT3PNLCirJRkrgM+Tic6oqOwhgMf4ZHuQgToWIRGv4Uoq/RRNl41EMMKPktRA7AUef7nsiCbhXAdt0HNKqeAReGBR8qb1sjvvsaGy9Cl7gEfMNJ9wkpRXmocWsV6XrAHi4WAAUEaBJvTJkPkHZn3k9ryVivOYTvc7FRQ/vh87Vc8IlYXXpO+PBnj/QEfMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aidq70Oh+m/FqtjfbwDDfApySMt8JJPvAitbPcWFLAU=;
 b=mmNiUxrsX105oOMP/92bsxXIpGfkEHP9RcRgOgX0lkUATTpVjsH4GXEvQViVgnyiKPe7ADFEtdVRETiwDW0SCoYcWz9JQ9gV/HMb/nEiL9xNaxaFKw5UU0NXyvxDB+rMjd3lZfaJDAD9HYL0TDfOE46lCJxxfIAYuR8WLVQwJ9g=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB6288.apcprd03.prod.outlook.com (2603:1096:820:a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 07:09:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Fri, 6 Oct 2023
 07:09:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "eugen.hristev@collabora.com"
 <eugen.hristev@collabora.com>
Subject: Re: [PATCH v5 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Topic: [PATCH v5 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Index: AQHZysEdyIbqwKfQfEKR7enbDMBCZLA8snmA
Date: Fri, 6 Oct 2023 07:09:06 +0000
Message-ID: <b5356aa9f85caba681e0dd62697d1cf588a4064d.camel@mediatek.com>
References: <20230809125722.24112-1-jason-jh.lin@mediatek.com>
 <20230809125722.24112-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809125722.24112-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB6288:EE_
x-ms-office365-filtering-correlation-id: 4b678e37-262f-4a34-2172-08dbc63b2124
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kkPOrScOJ/ZqyFfV99+2hKnQIu3KQZVHaz6eXRvrJbuQyO/XlYnSnGFK7OYErlxqoyh37zlI7AA+BEr35rRVmjZQxSHOOuc6swiuvhJtnbgUngzKoCKxpHlUMhr51LAAaXeAw+CgLR5D7ChS3DPp7m7INEMppm5BImf8X6muuNrwGnzd2ifPQtqhV8RW3MCcwI7KQU515gaUb7xScTeL69MrAVtcEG/3PLYCdfWeiqrLPoLoebHv+7aGRgI7xwViRATSN3q01UGjbDI2Of1YfhGakoAYcvTn3KdL6fNNOgosfwPXeGzd1kKiBlpcXdUUiercM8KS1XNqOL1cvFZB09gDHIw1bmOLDW4zAIdpPw0l1Z06AhhmU0FTqJnKANm0a7ruXWHfYma70JYE23XGit7NBwAKlXUkUXNOsvGw0d2pe0F0KmaYM061wl3eqBZ6yhwEvj+WMDZn/wUT1HAol+QP0icQ+2F/Gop5ZVWtFpKFZRWz8hl55cVBQvSPc7iVObSMWDKvHY7X0Y88mPJ8t3CxnHv0fmZ7xpSQZ+r8YT33HldtD+DfNfCyDy+te24HRQ5bP+5hSaEL8Hw57Dsn0p4HhxCTl6IzjI3wUAQmZrZKKUj0ELhxn5952DEQLQsM6gVP+VY/C7U9menF5ZTa+q8xiwKVgZ1deRsoL+dFRwA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(478600001)(122000001)(6512007)(6506007)(26005)(4326008)(2616005)(5660300002)(8936002)(2906002)(66476007)(8676002)(316002)(36756003)(66556008)(85182001)(76116006)(86362001)(41300700001)(66946007)(110136005)(54906003)(64756008)(71200400001)(38070700005)(38100700002)(66446008)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUtpN3dpdUNtak1CTzczekFwckxybHlQSlJiZlFQOU0xVkY1YnRkQXl4bms5?=
 =?utf-8?B?Ym1IN2o0S085UXZ6T1h2cFkwK0xjM3gydGhDMGZwQUFjbjEvTDdFREtJVHBE?=
 =?utf-8?B?N1hEY2NQWExCZ3luVU1XTGQvei9GaVh1VldsclZNK2R2Sm5KRW1USXlTUWhh?=
 =?utf-8?B?ZCtsc0VvOUZLSGZscVhxNUhZRjY4ZWVaSUo2cW05YWMzUFQ3S0ZKTTRCVmJQ?=
 =?utf-8?B?R2s2V3Y1dmU0dG4vaW00cEJoNTAyRllmeE1POFNBTEpRWHk1V2VYY2lGeWtj?=
 =?utf-8?B?NlNTbXFBdHZ0L09ZajZ4b09COXJZb1VHekNnTVdKNVhTRy9uQU5pdXhweWpk?=
 =?utf-8?B?aUhrMVB2NmVFcXJVQzhWQUVRUGNpQWpaNW4yc2x0N3hwWExBbjl6bThqVHNN?=
 =?utf-8?B?cjQzRk5UMEhmejk5UGhTNUU1K3U0bk5kc2tMTXVPN0R4VmgvYjV2NzNOWnNT?=
 =?utf-8?B?ZDlyY0RuZGkvRElqcmdLbDJvU1FmbU0rMjFkMG5FbUxMVkFycjJIcWkrNENs?=
 =?utf-8?B?VHBTcWlOVkdCb1E1VS9IVHN6NHVHWHFHKzk1Y1B1L0xQcVlDZUFYeG9ndFk4?=
 =?utf-8?B?amVkSzdaMExyVk9ZL1FESmgrRjBycWdDYXJXSzhWRS9ydzJCWVB0WFFFTHJw?=
 =?utf-8?B?bytSSUxOd0JkOEdyR2t0eEtLMFlsYWliL1d4RFFDQUNkNUlhQVZMclU5dDNr?=
 =?utf-8?B?b0ljLzdlYTQ4eWJpUmhhQXJ2OEdWQkZJYmZsWW44MjNOUmhOMXJuVG1OcC9z?=
 =?utf-8?B?c1ZoclFOaHFDRmIrV0tKYUFlTG1JWmN2amNlUCtzUWxvM25JY1hWVjhRd3Jj?=
 =?utf-8?B?OFh1TmRVdVdBMHNXQlVkZk1iSjY5MzVQcHR5YlQ2UDJMMXM5RHB5TVprQm5v?=
 =?utf-8?B?MFFQejloR3NmVnVTOFNtUHRXaVFuUEdpVmY3QVVEQUM2MjBkMFJPU0FHRnVB?=
 =?utf-8?B?RjBlT0xqOTdFYXd3M1dDbGJSeDRRZmNZdVkvN2FDNERTcGtmQmNMOFpuc1Bk?=
 =?utf-8?B?V1V2QXpSNWMrNDdWOUpvYkc1aUZ2TDVmd2F3L3BrcU1MWHFYZGI1TERtcXM1?=
 =?utf-8?B?RXNtMVBxS25RVmY0cnIvQWV4VzhMM0VBZkJJSDdlSndNUHBLWkduWkpCTFll?=
 =?utf-8?B?V1FJdzh1NTBLSENFc2lxSVA3bFQ3Z0pjbWl2b045VWRCajNWRmFWSFZmN3g4?=
 =?utf-8?B?MHpYNFZ5SzNTM2pmTW12UXh0ZVJVUWpaWVhVS28wZ0VKS1V4aGFiYm1xQmlv?=
 =?utf-8?B?U1JTSHFXd09sN2hiNnhjOHMxdmRqODZMU2hTVFVDTTBacGhPOE1VT2krVkl2?=
 =?utf-8?B?eGk0bUcxajFaZ2R6K2sxTE1oSDhtTFBqSzRtSFdyejhJejI4T2lhSXF0aGJa?=
 =?utf-8?B?QW5Jc0Yya3JWYkJPNGM4U1pHMHgzSSt5RGEvSFQyVDZvNGhvRWZoQVh3ZHNC?=
 =?utf-8?B?VUgzekxacm8xcTBrcmFXR045by9WMVNzeEtpTSsrS0QzLzVuK01qQ3JFUkdG?=
 =?utf-8?B?a0t3SUlPMXJQRnV5ZlFGai9mcUdmSjlSMk5zTEpKWDNraGlGc2FBOVFYdFNF?=
 =?utf-8?B?c2VFVGR0YW9rakpZRm82RVZ2MlR5ZXczeVNzeE0wYTJjbzcvRHcvM3ZWMzl6?=
 =?utf-8?B?UVN6SnRZaXdJdUEzbERQN0ZVaEdpZHR3T2ZRanZFVGxaVXZ3WVlUVGk4bk5i?=
 =?utf-8?B?YW9KSFJOWm9hd3VKMEZtYkllQktBMi9CeHlRa2hhbVU5U2o3S2F2VEozQk9l?=
 =?utf-8?B?djFLQUFMVTB4UkFDcUNQSmpjbndINTgxZ3ZDQ3FuNDhzV1JqWXRiMmhtVC9K?=
 =?utf-8?B?K3FLNURJdUZUVXU5ekU2MTVBMi94MklpTzRQMlBhVmtZY0NoWXo5dU9QMFc5?=
 =?utf-8?B?WFcyZDVqOVlBcXlKU1F1bEpvcmhPTUVSMzBQa2E1d2N5SjhvaW15YlhTODNJ?=
 =?utf-8?B?YUJqa09zUlV2djZNeWFTZEgzRlJCRmZwOEtQbmlsOUpYMDdWeEg3Q2pLUENK?=
 =?utf-8?B?SUN0dnR5OGpDdWplQjNaWmdzc3JwMERLSTB0YW5kVitpSHBSUDZRV1lmRXFk?=
 =?utf-8?B?VDFPc0pQUCtNTEsvNGhjRHMvY0VaUjlHVEJiamRraExhZTV0dUkxN3BpVXFE?=
 =?utf-8?Q?Teope9wJo+DMeV8GZmDnzpUHu?=
Content-ID: <7C3DAE3FB7934E4FBB3C05E05F41E3B3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b678e37-262f-4a34-2172-08dbc63b2124
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 07:09:06.3882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qybDc1ckF1Va2sU0EeI86BRxiB7f1dffCmjycb9apv9l+LtnKsBm4nmfvMS7NuOKsMt6TpjDw3OTUsR85jNsTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6288
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_179500393.1820394373"
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_179500393.1820394373
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtXZWQsJiMzMjsyMDIzLTA4LTA5JiMzMjth
dCYjMzI7MjA6NTcmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO1RoZSYjMzI7ZGlmZmVyZW5jZSYjMzI7YmV0d2VlbiYjMzI7ZHJtX2F0b21pY19oZWxwZXJf
Y29tbWl0X3RhaWwoKSYjMzI7YW5kDQomZ3Q7JiMzMjtkcm1fYXRvbWljX2hlbHBlcl9jb21taXRf
dGFpbF9ycG0oKSYjMzI7aXMNCiZndDsmIzMyO2RybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWls
KCkmIzMyO3dpbGwmIzMyO2NvbW1pdCYjMzI7cGxhbmUmIzMyO2ZpcnN0JiMzMjthbmQNCiZndDsm
IzMyO3RoZW4mIzMyO2VuYWJsZSYjMzI7Y3J0YywmIzMyO2RybV9hdG9taWNfaGVscGVyX2NvbW1p
dF90YWlsX3JwbSgpJiMzMjt3aWxsDQomZ3Q7JiMzMjtlbmFibGUmIzMyO2NydGMmIzMyO2ZpcnN0
JiMzMjthbmQmIzMyO3RoZW4mIzMyO2NvbW1pdCYjMzI7cGxhbmUuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO0JlZm9yZSYjMzI7bWVkaWF0ZWstZHJtJiMzMjtlbmFibGVzJiMzMjtjcnRjLCYjMzI7dGhl
JiMzMjtwb3dlciYjMzI7YW5kJiMzMjtjbGsmIzMyO3JlcXVpcmVkDQomZ3Q7JiMzMjtieSYjMzI7
T1ZMJiMzMjtoYXZlJiMzMjtub3QmIzMyO2JlZW4mIzMyO3R1cm5lZCYjMzI7b24sJiMzMjtzbyYj
MzI7dGhlJiMzMjtjb21taXQmIzMyO3BsYW5lJiMzMjtjYW5ub3QmIzMyO2JlDQomZ3Q7JiMzMjtj
b21taXR0ZWQmIzMyO2JlZm9yZSYjMzI7Y3J0YyYjMzI7aXMmIzMyO2VuYWJsZWQuJiMzMjtUaGF0
JiMzMjttZWFucyYjMzI7T1ZMJiMzMjtsYXllciYjMzI7c2hvdWxkDQomZ3Q7JiMzMjtub3QmIzMy
O2JlJiMzMjtlbmFibGVkJiMzMjtiZWZvcmUmIzMyO2NydGMmIzMyO2lzJiMzMjtlbmFibGVkLg0K
Jmd0OyYjMzI7VGhlcmVmb3JlLCYjMzI7dGhlJiMzMjthdG9taWNfY29tbWl0X3RhaWwmIzMyO29m
JiMzMjttZWRpYXRlay1kcm0mIzMyO2lzJiMzMjtob29rZWQmIzMyO3dpdGgNCiZndDsmIzMyO2Ry
bV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSgpLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtB
bm90aGVyJiMzMjtyZWFzb24mIzMyO2lzJiMzMjt0aGF0JiMzMjt0aGUmIzMyO3BsYW5lX3N0YXRl
JiMzMjtvZiYjMzI7ZHJtX2F0b21pY19zdGF0ZSYjMzI7aXMmIzMyO25vdA0KJmd0OyYjMzI7c3lu
Y2hyb25pemVkJiMzMjt3aXRoJiMzMjt0aGUmIzMyO3BsYW5lX3N0YXRlJiMzMjtzdG9yZWQmIzMy
O2luJiMzMjttdGtfY3J0YyYjMzI7ZHVyaW5nJiMzMjtjcnRjDQomZ3Q7JiMzMjtlbmFibG5nLA0K
Jmd0OyYjMzI7c28mIzMyO2p1c3QmIzMyO3NldCYjMzI7YWxsJiMzMjtwbGFuZXMmIzMyO3RvJiMz
MjtkaXNhYmxlZC4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBt
ZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Rml4ZXM6JiMzMjsxMTlmNTE3
MzYyOGEmIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtBZGQmIzMyO0RSTSYjMzI7RHJpdmVy
JiMzMjtmb3ImIzMyO01lZGlhdGVrJiMzMjtTb0MNCiZndDsmIzMyO01UODE3My4mcXVvdDspDQom
Z3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgu
bGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7QWxleGFuZHJl
JiMzMjtNZXJnbmF0JiMzMjsmbHQ7YW1lcmduYXRAYmF5bGlicmUuY29tJmd0Ow0KJmd0OyYjMzI7
UmV2aWV3ZWQtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsm
bHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7
DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jJiMzMjt8JiMzMjszJiMzMjsrKysNCiZndDsmIzMyOyYjMzI7MSYjMzI7Zmls
ZSYjMzI7Y2hhbmdlZCwmIzMyOzMmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYj
MzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
Yw0KJmd0OyYjMzI7aW5kZXgmIzMyO2Q0MDE0Mjg0MmY4NS4uNTFkMTBlNjUwMDRlJiMzMjsxMDA2
NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9j
cnRjLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9jcnRjLmMNCiZndDsmIzMyO0BAJiMzMjstNDEwLDYmIzMyOys0MTAsOSYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7aW50JiMzMjttdGtfY3J0Y19kZHBfaHdfaW5pdChzdHJ1Y3QNCiZndDsmIzMyO210
a19kcm1fY3J0YyYjMzI7Km10a19jcnRjKQ0KJmd0OyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50
JiMzMjtsb2NhbF9sYXllcjsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3BsYW5lX3N0
YXRlJiMzMjs9JiMzMjt0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtJmd0O3N0YXRlKTsNCiZndDsm
IzMyOysNCiZndDsmIzMyOysvKiYjMzI7c2hvdWxkJiMzMjtub3QmIzMyO2VuYWJsZSYjMzI7bGF5
ZXImIzMyO2JlZm9yZSYjMzI7Y3J0YyYjMzI7ZW5hYmxlZCYjMzI7Ki8NCiZndDsmIzMyOytwbGFu
ZV9zdGF0ZS0mZ3Q7cGVuZGluZy5lbmFibGUmIzMyOz0mIzMyO2ZhbHNlOw0KJmd0OyYjMzI7JiMz
Mjtjb21wJiMzMjs9JiMzMjttdGtfZHJtX2RkcF9jb21wX2Zvcl9wbGFuZShjcnRjLCYjMzI7cGxh
bmUsDQomZ3Q7JiMzMjsmYW1wO2xvY2FsX2xheWVyKTsNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhj
b21wKQ0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsJiMzMjts
b2NhbF9sYXllciwNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioq
KioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioq
KioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5j
bHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFy
eSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVy
IGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRv
IHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpk
aXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChz
KSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFy
ZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0K
dGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwg
ZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55
IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUg
Y29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8
L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_179500393.1820394373
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjMtMDgtMDkgYXQgMjA6NTcgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBkcm1fYXRvbWljX2hlbHBlcl9j
b21taXRfdGFpbCgpIGFuZA0KPiBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0oKSBp
cw0KPiBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbCgpIHdpbGwgY29tbWl0IHBsYW5lIGZp
cnN0IGFuZA0KPiB0aGVuIGVuYWJsZSBjcnRjLCBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFp
bF9ycG0oKSB3aWxsDQo+IGVuYWJsZSBjcnRjIGZpcnN0IGFuZCB0aGVuIGNvbW1pdCBwbGFuZS4N
Cj4gDQo+IEJlZm9yZSBtZWRpYXRlay1kcm0gZW5hYmxlcyBjcnRjLCB0aGUgcG93ZXIgYW5kIGNs
ayByZXF1aXJlZA0KPiBieSBPVkwgaGF2ZSBub3QgYmVlbiB0dXJuZWQgb24sIHNvIHRoZSBjb21t
aXQgcGxhbmUgY2Fubm90IGJlDQo+IGNvbW1pdHRlZCBiZWZvcmUgY3J0YyBpcyBlbmFibGVkLiBU
aGF0IG1lYW5zIE9WTCBsYXllciBzaG91bGQNCj4gbm90IGJlIGVuYWJsZWQgYmVmb3JlIGNydGMg
aXMgZW5hYmxlZC4NCj4gVGhlcmVmb3JlLCB0aGUgYXRvbWljX2NvbW1pdF90YWlsIG9mIG1lZGlh
dGVrLWRybSBpcyBob29rZWQgd2l0aA0KPiBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9y
cG0oKS4NCj4gDQo+IEFub3RoZXIgcmVhc29uIGlzIHRoYXQgdGhlIHBsYW5lX3N0YXRlIG9mIGRy
bV9hdG9taWNfc3RhdGUgaXMgbm90DQo+IHN5bmNocm9uaXplZCB3aXRoIHRoZSBwbGFuZV9zdGF0
ZSBzdG9yZWQgaW4gbXRrX2NydGMgZHVyaW5nIGNydGMNCj4gZW5hYmxuZywNCj4gc28ganVzdCBz
ZXQgYWxsIHBsYW5lcyB0byBkaXNhYmxlZC4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBt
ZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiAxMTlmNTE3MzYyOGEgKCJkcm0vbWVkaWF0ZWs6
IEFkZCBEUk0gRHJpdmVyIGZvciBNZWRpYXRlayBTb0MNCj4gTVQ4MTczLiIpDQo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gUmV2aWV3
ZWQtYnk6IEFsZXhhbmRyZSBNZXJnbmF0IDxhbWVyZ25hdEBiYXlsaWJyZS5jb20+DQo+IFJldmll
d2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBp
bmRleCBkNDAxNDI4NDJmODUuLjUxZDEwZTY1MDA0ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBAQCAtNDEwLDYgKzQxMCw5IEBAIHN0YXRpYyBpbnQg
bXRrX2NydGNfZGRwX2h3X2luaXQoc3RydWN0DQo+IG10a19kcm1fY3J0YyAqbXRrX2NydGMpDQo+
ICAJCXVuc2lnbmVkIGludCBsb2NhbF9sYXllcjsNCj4gIA0KPiAgCQlwbGFuZV9zdGF0ZSA9IHRv
X210a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOw0KPiArDQo+ICsJCS8qIHNob3VsZCBub3Qg
ZW5hYmxlIGxheWVyIGJlZm9yZSBjcnRjIGVuYWJsZWQgKi8NCj4gKwkJcGxhbmVfc3RhdGUtPnBl
bmRpbmcuZW5hYmxlID0gZmFsc2U7DQo+ICAJCWNvbXAgPSBtdGtfZHJtX2RkcF9jb21wX2Zvcl9w
bGFuZShjcnRjLCBwbGFuZSwNCj4gJmxvY2FsX2xheWVyKTsNCj4gIAkJaWYgKGNvbXApDQo+ICAJ
CQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsIGxvY2FsX2xheWVyLA0K

--__=_Part_Boundary_006_179500393.1820394373--

