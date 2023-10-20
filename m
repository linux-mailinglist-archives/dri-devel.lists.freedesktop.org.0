Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99637D0C9D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF18310E592;
	Fri, 20 Oct 2023 10:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAE510E592
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:02:31 +0000 (UTC)
X-UUID: c4f6dbac6f2f11eea33bb35ae8d461a2-20231020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ukCOhZTg1cMbzr0HUQZWo5sBjxxbqsjmw4GQljFbAf0=; 
 b=C/MM9gfxSZo7/iQmz1JV+kPgv5JAnBkXVfGeffIi2hXAhyk8aV/Sv7O4QM+KG5hX6E4rEV59SH3PgQ6CXGDvYUNfHhuTmpwaP8aYpES696uEqO+qPj8JnG7vkzEN7Z/0X47p2wti+QOJ0Ub6MWIJ2A2cgkQBVtwnzfrykBulrCw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:c4f1c5e8-5e68-4052-ac40-28168dc75209, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:ead7393b-9667-4160-9f3e-e63ef4a1118c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c4f6dbac6f2f11eea33bb35ae8d461a2-20231020
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1308785481; Fri, 20 Oct 2023 18:02:25 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Oct 2023 18:02:24 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Oct 2023 18:02:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9iMnYSlu82fO0BiSGBjSaKx41XCjpeiKqTGbCdYuIWq/kIB2tU9wHV2kyJYn05ZUnu0J7l8j8nagmmZN9sYTP8zQh+pdLd5U8DhO/ssy87xPxxpV3xBeDx6K00dTw57c2UEMlKPjJzrSAqqFS/gky2LReNXtWUkgImcRdxSAOkGGKW5J9GAwSm9rlQNJSGu8TemlA8xZqtIYHvO/p0SbBBojzvYqV0FrXTtK4KAXSgDY1YKVEGWd5/FKdHgc8ujHrJdPGyVeQE/Vz+PjX/akPYVFcGvewIL3HezZ3saQ7nRVgF5n7h3Uf4obqhSnpLyiO0bADfRA4FXABDYq9qgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukCOhZTg1cMbzr0HUQZWo5sBjxxbqsjmw4GQljFbAf0=;
 b=F0JqFuXypzlwiA+cuZXut0ZgiZtRvvdGGx4my5KlyTcCWQHlG2HkVF6USVOu22KxVtDmXlbp9PAUkmECggZ8jpOm3xGM3QAY6iPFQfjeVa8NpjD0QIRnXGrzbO25irCP8Gx81rIBFt8JTehnJCCRXT62MvhFgcrxih0qy/T0saK8NrlYynQjzCqG0wi6XKJoD3gN8oOD89UVf5XfWjnWK5mySTDRp6j2anFTPGy7/P3L9c6L2FY9QwGt03xNlK/urNj9ngtE0mbjJlwpP4fiwy4Ks88Aq6PQD5lslhcfAJJMOT1bTQMhr2e2FtHH73T9Ef6WYOO8IheErEvwSMXkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukCOhZTg1cMbzr0HUQZWo5sBjxxbqsjmw4GQljFbAf0=;
 b=ldfAOyeElrv5A8lvELaRSknQif1sKwYz055hwDvjD6Db4YSPPtmNRlQkvBAwg4IlLN2XnN7cowg3SVOpUBSaiHuE27p4dtgxtOrgLmTjWmzChuLG46cXCfUr/FaOSXJG4PyiSZKjPPAGvDPffGtEXNcBPwau1vmCDJ7cOMNvML4=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB5408.apcprd03.prod.outlook.com (2603:1096:400:35::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24; Fri, 20 Oct 2023 10:01:19 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dfd:5783:26bf:c189]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dfd:5783:26bf:c189%4]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 10:01:19 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Thread-Topic: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Thread-Index: AQHZ5FgqDwsDNAc9xUe5kPjiMIdpmrBQxZ0AgAHqcIA=
Date: Fri, 20 Oct 2023 10:01:19 +0000
Message-ID: <7a2995de23c24ef22c071c6976c02b97e9b50126.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-7-yong.wu@mediatek.com>
 <e7d72a94-4804-4297-8d3a-2191e2886bfc@quicinc.com>
In-Reply-To: <e7d72a94-4804-4297-8d3a-2191e2886bfc@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB5408:EE_
x-ms-office365-filtering-correlation-id: 7fbe873a-6f36-4e7a-66d9-08dbd1538209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UhV2OQ1f9P8KvOVJmY6XdSUV5JVZKXws4dvA6WU/wj8WY9kDkhu3TPDA8sjGjL/+des78qj7D6LOBiXtI87Qj8nKXlGcLwqerWxjUiM/uRxKvDjpbJwnOFqkQVkazr6SlflHW5bPzFOeSQlqncXtAeqTvxM+m7d2tbQcApRy7W6R2WZBIN4Nu27um/w1w7WK0qxCTWHqWRC+FPKF9KRAky51l6e/5LgSluJwCGFCjWC57QHTKrfZyNhvGUjLsgFTaeYvN5CqnahjGrpeN+b3JeIDuHbP2cKok84UgtMQbsmfh9JEsllO5MEhcrT7L6VMPkXO5yQkGqggM2gepcMcCVtK5K1ergA0Qe6SSXOMex3kofM/toBw0Iqc3xgbmbOiRRhYYG5DSFRRCkVm3tk80cJCVUTTN4AbLfgfXbiHfvBaFWjCAA7u3skk6iKVpQU8DrB4gB/wQWsSL9oy30OORDxSaqMoU9o05jjiRQnBBxIDuphZifdDjnt8Ns4wuYp9DAm5wBsn1OtzoDOfDAyGMvEjI1pE3RbxQXTMYSHeNtrCP58+VieZjtrhv4bXpmWKkYBk8oWaDkeSdeV4Dcb/NgcGLHRu0x6OxoQtScLPsSCPoyVuvYpOnwqDOlz7AjVHQV+AP/pzzzyxMipkifRJ4+Ax00UPAiYtzmunagIgLd12sAEZ7MmJVvuOickIwtsh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(76116006)(66946007)(64756008)(66476007)(66446008)(54906003)(66556008)(110136005)(6486002)(478600001)(83380400001)(6512007)(53546011)(71200400001)(6506007)(122000001)(316002)(36756003)(85182001)(4001150100001)(38100700002)(38070700009)(7416002)(2906002)(86362001)(4326008)(8936002)(26005)(8676002)(41300700001)(2616005)(5660300002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGpoRnVYYW52SloxQnpXRk91WFZLY1o2dzc0N3ZOZ3Z0QVNtMWIrVzBHMUNx?=
 =?utf-8?B?eWZPd21TREVXczI4Y0I2SkM5aXQyUmVZL0tHV0xnL3lnWFpTNlJsUDlnR05V?=
 =?utf-8?B?MGt5K3lHWWRLc2ZMUEZDTmlOWG9taXhkMkM4bXFBY0NzWUwxMVdnZ2toMUR6?=
 =?utf-8?B?djNqbTUwL3Jkb0FCYXpCUnFyYWVRNVpsMEdkOHJKZUpWWVVXclYxb1k2WEF0?=
 =?utf-8?B?ZzVwZjcxcTRhdlZwVE5xWkpqTlFTTEJ4a2V0YVEyTUIyb2t1S3VMTUhhV0E2?=
 =?utf-8?B?NTNzVkJYRHV0cGxnc2xidmZtZ1pMRlNIUDZuMjd6NGJRQkxtZlBpVVRTK2V1?=
 =?utf-8?B?ekk4czFPRmEraThEM3NFZlNjSEUxdStmT3JlUWdwSURRS2xUZXFrYjJnQnJm?=
 =?utf-8?B?amNCZ3U4Qm5RZVlYalJxMkxIQ0NJelh2MDI2YzVoMGlZcVdEdm9FMXljTkFs?=
 =?utf-8?B?Q2lrS0hGWjBHK0dXcml6OWVKL1lXa3ZoN0pBZFJoWGNNOE0rckx3Y05peTJE?=
 =?utf-8?B?NVdGcFRRcEFUT0psdktFTStVRFZmYWRQSmVxaTZCclFJV3ZJOEZHSkUvT05J?=
 =?utf-8?B?VDFUS1FRbVJjL1dKRzdRS09mREdxVFdnb0JKVnF2VW0vSlYwbkJaMFhJWW5G?=
 =?utf-8?B?d0ZqUGhmLzBSSTFMQUh0ZStWaWR0dnlsaUU0QjNyK21BT2RaOXoyN2ZDS25q?=
 =?utf-8?B?YUFkclFIWDFud2x6bjMzL2YxY084T0ZmWWJvYXp6UzVEeit1d1VZZmZwOVZ6?=
 =?utf-8?B?L2ZIbHIxVTRlSGFHM2ZTbUcrZTNmcEc5U0ZlYWd3Q1E0aFNaTUlJWFNBYUE3?=
 =?utf-8?B?ajJDREpPeFpjMk9LajJvU3FuZld6Y2IvejMram9ta2ZzajZBY0VUOFczMWhv?=
 =?utf-8?B?Umt3TTIwSEM1L2VBbjJkbGNld2lCb2t4NUZkU0QrRVNwT1MxUXVnc3IveHNI?=
 =?utf-8?B?czh4U2JYdks1TmdxNSt3VVM4VU9UNHRWejU4bjNKNWNrYmFNRGU3eCttVWhD?=
 =?utf-8?B?S29QM21sSmhsTnZYd3hjYndGeWZDT3V5MmdiT0MyNVJ4T2dNU1ZoZ2Q3eEZX?=
 =?utf-8?B?RUFPa0RpdGg2NVR2UjFkNkZldFR5bEJXWTN0VDRPZjNlbGs2dnI3bVUvSzFm?=
 =?utf-8?B?TGNqZjRRN25DUDg2NGlWRStpL2JzS3RBZHNtb2lNMXEyS3VBSXFCbGhmbTQ0?=
 =?utf-8?B?TG41STJ4ckdISUFiVmxaaitiVnVoZWZWblR3QTdzZGpMeVo5bWc0NTVuTitC?=
 =?utf-8?B?QlJTWW5kQWxmbFYwazZmb3laR3VVK0d5SXFYL2tpWkpCV3R5ai9CNExTZnBa?=
 =?utf-8?B?WFphRWJYdzkrSHlLbUlHRis0Y3QrbDBZYWRqalFYYlUrVGY4QUFTL2NldDJJ?=
 =?utf-8?B?dlFLUTRQQlpTWmU4SlZMOVlOb1FCV2o0cVliR01STUhaRklPMTlKVVhOK1g5?=
 =?utf-8?B?UWllMDVFMU5XRHo1ekFhWkczNVBhNjZFSC9NM25kVGJzOUVGSjFVc0hOMEpG?=
 =?utf-8?B?QWpKK2RLaTRzMWZjQk13bksrZGtIU2ZPaGlPQ0h0bjFuYlBxL3cyek9NSlhY?=
 =?utf-8?B?TVpkR2swWXFZQlBKSUlVRSswM1VRaTR0b2ZKaVN0T2pXK3FkeE4wb1ZnY3FB?=
 =?utf-8?B?TXg5YStnalJPd3dqSllxbm05aDBVNTlkOVEvNTgyS05qWlRVZlhvTmIycVZO?=
 =?utf-8?B?TVVOT1NrUDVBN2NyNHcyUVV4dU8xR0JTZk5zWVkrZVZOWnRieUtJcXEwYTd1?=
 =?utf-8?B?UnRKY1BqZnlCTEZlTUl5bldzTi9SUVEwcUFoOU0zY0x0TEpSdlhPc3BLMTBw?=
 =?utf-8?B?OUpaenFtOGZNdGNZNVVJY3RLaFltS1FaOXlIdSt5SlFZejZsVnFvMUZRVEJ0?=
 =?utf-8?B?WU4rSkxidWhjbVo5dTgrTUdBRHo4MWFKOGxkQ2lxbEphbFVHTXZCRkR3ME1B?=
 =?utf-8?B?akZjRDBsZlUxRjRuR0w5Y1JkTGx2d1lJMEFXSFc2aW5jV2U5TEo5VzNzTmVX?=
 =?utf-8?B?eWlEek1uWHU3b1AybHNHTnpFQ3FKZzJoaCtYVDdud24vY1pKVTJ4WjY2K0RX?=
 =?utf-8?B?YUJkb2NyWmo5VGQxNXkrM0Rna09lZjZJTUFQeXE2YmlYQisxS0QrQWhlMzF1?=
 =?utf-8?B?OWxjd3VEeTh4aENUeWVmckNwZ0hEWjh1WWhxMnNnSWFROFhiSnNoTjV6NE9U?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A120DE4D9B11BB4E9A25C442F4B6D15B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbe873a-6f36-4e7a-66d9-08dbd1538209
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 10:01:19.7163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7MeeWuS896n1WsAm/I6sioC0+v6q86WcZnmRcnpskzhqOTMCDaZOS5Y1UJ4XRce68EGX9DykS6qTfL4xiH6UqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5408
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--24.656400-8.000000
X-TMASE-MatchedRID: gIwa0kWWszLUL3YCMmnG4uYAh37ZsBDC1kqyrcMalqUNcckEPxfz2DEU
 xl1gE1bkfdd9BtGlLLzx1uczIHKx54/qvvWxLCnegOqr/r0d+Cx+Mk6ACsw4JlwpnAAvAwazCS6
 IUmxCo5HtLocRZnnK+tsIe/TXUbL1idh40yl3wZCVOwZbcOalS4fsPVs/8Vw6CqIJhrrDy28bOO
 kcH9zseSrlq6rYWJgzqYoaR830XIVxzwb0rKc346ngbqTYC4GHmGSSol4Uei26pZ/o2Hu2YZ/ih
 Jrtaz9W4vM1YF6AJbY9l7H+TFQgdbew1twePJJB3QfwsVk0Ubv+efAnnZBiLyF6bSSak9kx
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--24.656400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7A2BC4B9017573CE1F2DA9D4E1799009D5A7FD0A1250DB93FFCAA19CCFA931152000:8
X-MTK: N
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
Cc: =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlqYXlhbmFuZCwNCg0KVGhhbmtzIHZlcnkgbXVjaCBmb3IgeW91ciByZXZpZXcuDQoNCk9u
IFRodSwgMjAyMy0xMC0xOSBhdCAxMDoxNSArMDUzMCwgVmlqYXlhbmFuZCBKaXR0YSB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ICANCj4gDQo+IE9uIDkvMTEvMjAyMyA4OjAwIEFNLCBZb25nIFd1IHdy
b3RlOg0KPiA+IEFkZCBURUUgc2VydmljZSBjYWxsIGZvciBzZWN1cmUgbWVtb3J5IGFsbG9jYXRp
bmcvZnJlZWluZy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmFuIFN1biA8YW5hbi5zdW5A
bWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvbXRrX3NlY3VyZV9o
ZWFwLmMgfCA2OQ0KPiArKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA2OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9tdGtfc2VjdXJlX2hlYXAuYyBiL2RyaXZlcnMvZG1h
LQ0KPiBidWYvaGVhcHMvbXRrX3NlY3VyZV9oZWFwLmMNCj4gPiBpbmRleCBlM2RhMzNhM2QwODMu
LjE0YzJhMTZhNzE2NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvbXRr
X3NlY3VyZV9oZWFwLmMNCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvbXRrX3NlY3Vy
ZV9oZWFwLmMNCj4gPiBAQCAtMTcsNiArMTcsOSBAQA0KPiA+ICANCj4gPiAgI2RlZmluZSBNVEtf
VEVFX1BBUkFNX05VTTQNCj4gPiAgDQo+ID4gKyNkZWZpbmUgVFpDTURfTUVNX1NFQ1VSRUNNX1VO
UkVGNw0KPiA+ICsjZGVmaW5lIFRaQ01EX01FTV9TRUNVUkVDTV9aQUxMT0MxNQ0KPiA+ICsNCj4g
PiAgLyoNCj4gPiAgICogTWVkaWFUZWsgc2VjdXJlIChjaHVuaykgbWVtb3J5IHR5cGUNCj4gPiAg
ICoNCj4gPiBAQCAtMjksNiArMzIsOCBAQCBlbnVtIGtyZWVfbWVtX3R5cGUgew0KPiA+ICBzdHJ1
Y3QgbXRrX3NlY3VyZV9oZWFwX2J1ZmZlciB7DQo+ID4gIHN0cnVjdCBkbWFfaGVhcCpoZWFwOw0K
PiA+ICBzaXplX3RzaXplOw0KPiA+ICsNCj4gPiArdTMyc2VjX2hhbmRsZTsNCj4gPiAgfTsNCj4g
PiAgDQo+ID4gIHN0cnVjdCBtdGtfc2VjdXJlX2hlYXAgew0KPiA+IEBAIC04MCw2ICs4NSw2MyBA
QCBzdGF0aWMgaW50IG10a19rcmVlX3NlY3VyZV9zZXNzaW9uX2luaXQoc3RydWN0DQo+IG10a19z
ZWN1cmVfaGVhcCAqc2VjX2hlYXApDQo+ID4gIHJldHVybiByZXQ7DQo+ID4gIH0NCj4gPiAgDQo+
ID4gK3N0YXRpYyBpbnQNCj4gPiArbXRrX3NlY19tZW1fdGVlX3NlcnZpY2VfY2FsbChzdHJ1Y3Qg
dGVlX2NvbnRleHQgKnRlZV9jdHgsIHUzMg0KPiBzZXNzaW9uLA0KPiA+ICsgICAgIHVuc2lnbmVk
IGludCBjb21tYW5kLCBzdHJ1Y3QgdGVlX3BhcmFtICpwYXJhbXMpDQo+ID4gK3sNCj4gPiArc3Ry
dWN0IHRlZV9pb2N0bF9pbnZva2VfYXJnIGFyZyA9IHswfTsNCj4gPiAraW50IHJldDsNCj4gPiAr
DQo+ID4gK2FyZy5udW1fcGFyYW1zID0gTVRLX1RFRV9QQVJBTV9OVU07DQo+ID4gK2FyZy5zZXNz
aW9uID0gc2Vzc2lvbjsNCj4gPiArYXJnLmZ1bmMgPSBjb21tYW5kOw0KPiA+ICsNCj4gPiArcmV0
ID0gdGVlX2NsaWVudF9pbnZva2VfZnVuYyh0ZWVfY3R4LCAmYXJnLCBwYXJhbXMpOw0KPiA+ICtp
ZiAocmV0IDwgMCB8fCBhcmcucmV0KSB7DQo+ID4gK3ByX2VycigiJXM6IGNtZCAlZCByZXQgJWQ6
JXguXG4iLCBfX2Z1bmNfXywgY29tbWFuZCwgcmV0LA0KPiBhcmcucmV0KTsNCj4gPiArcmV0ID0g
LUVPUE5PVFNVUFA7DQo+ID4gK30NCj4gPiArcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4g
PiArc3RhdGljIGludCBtdGtfc2VjX21lbV9hbGxvY2F0ZShzdHJ1Y3QgbXRrX3NlY3VyZV9oZWFw
ICpzZWNfaGVhcCwNCj4gPiArc3RydWN0IG10a19zZWN1cmVfaGVhcF9idWZmZXIgKnNlY19idWYp
DQo+ID4gK3sNCj4gPiArc3RydWN0IHRlZV9wYXJhbSBwYXJhbXNbTVRLX1RFRV9QQVJBTV9OVU1d
ID0gezB9Ow0KPiA+ICt1MzIgbWVtX3Nlc3Npb24gPSBzZWNfaGVhcC0+bWVtX3Nlc3Npb247DQo+
ID4gK2ludCByZXQ7DQo+ID4gKw0KPiA+ICtwYXJhbXNbMF0uYXR0ciA9IFRFRV9JT0NUTF9QQVJB
TV9BVFRSX1RZUEVfVkFMVUVfSU5QVVQ7DQo+ID4gK3BhcmFtc1swXS51LnZhbHVlLmEgPSBTWl80
SzsvKiBhbGlnbm1lbnQgKi8NCj4gPiArcGFyYW1zWzBdLnUudmFsdWUuYiA9IHNlY19oZWFwLT5t
ZW1fdHlwZTsvKiBtZW1vcnkgdHlwZSAqLw0KPiA+ICtwYXJhbXNbMV0uYXR0ciA9IFRFRV9JT0NU
TF9QQVJBTV9BVFRSX1RZUEVfVkFMVUVfSU5QVVQ7DQo+ID4gK3BhcmFtc1sxXS51LnZhbHVlLmEg
PSBzZWNfYnVmLT5zaXplOw0KPiA+ICtwYXJhbXNbMl0uYXR0ciA9IFRFRV9JT0NUTF9QQVJBTV9B
VFRSX1RZUEVfVkFMVUVfSU5PVVQ7DQo+ID4gKw0KPiA+ICsvKiBBbHdheXMgcmVxdWVzdCB6ZXJv
ZWQgYnVmZmVyICovDQo+ID4gK3JldCA9IG10a19zZWNfbWVtX3RlZV9zZXJ2aWNlX2NhbGwoc2Vj
X2hlYXAtPnRlZV9jdHgsIG1lbV9zZXNzaW9uLA0KPiA+ICsgICBUWkNNRF9NRU1fU0VDVVJFQ01f
WkFMTE9DLCBwYXJhbXMpOw0KPiANCj4gSSBzZWUgaGVyZSBvcHRlZSBjYWxscyBhcmUgYmVpbmcg
dXNlZCB0byBzZWN1cmUgbWVtb3J5Lg0KPiANCj4gRm9yIGEgc2VjdXJlIGhlYXAsIHRoZXJlIGNh
biBiZSBtdWx0aXBsZSB3YXlzIG9uIGhvdyB3ZSB3YW50IHRvDQo+IHNlY3VyZSBtZW1vcnksDQo+
IGZvciBlZyA6IGJ5IHVzaW5nIHFjb21fc2NtX2Fzc2lnbl9tZW0uDQo+IA0KPiBUaGlzIGludGVy
ZmFjZSByZXN0cmljdHMgc2VjdXJpbmcgbWVtb3J5IHRvIG9ubHkgb3B0ZWUgY2FsbHMuDQo+IGNh
biB3ZSBoYXZlIGEgd2F5IHRvIGNob29zZSBvcHMgdGhhdCB3ZSB3YW50IHRvIHNlY3VyZSBtZW1v
cnkgPyANCg0KVGhhbmtzIGZvciB0aGlzIHN1Z2dlc3Rpb24uIFNvIGl0IGxvb2tzIGxpa2UgdGhl
cmUgYXJlIGZvdXIgb3BlcmF0aW9ucw0KaW4gdGhlIGFic3RyYWN0IG9wcy4gU29tZXRoaW5nIGxp
a2UgdGhpcz8NCg0Kc3RydWN0IHNlY19tZW1vcnlfb3BzIHsNCiAgIGludCAoKnNlY19tZW1vcnlf
aW5pdCkoKSAgIC8vd2UgbmVlZCBpbml0aWFsaXNlIHRlZSBzZXNzaW9uIGhlcmUuDQogICBpbnQg
KCpzZWNfbWVtb3J5X2FsbG9jKSgpDQogICBpbnQgKCpzZWNfbWVtb3J5X2ZyZWUpKCkNCiAgIHZv
aWQgKCpzZWNfbWVtb3J5X3VuaW5pdCkoKQ0KfQ0KICAgDQpEbyB5b3UgYWxzbyBuZWVkIHRlZSBv
cGVyYXRpb24gbGlrZSB0ZWVfY2xpZW50X29wZW5fc2Vzc2lvbiBhbmQNCnRlZV9jbGllbnRfaW52
b2tlX2Z1bmM/DQppZiBzbywgeW91ciBVVUlEIGFuZCBURUUgY29tbWFuZCBJRCB2YWx1ZSBhcmUg
YWxzbyBkaWZmZXJlbnQsIHJpZ2h0Pw0KICAgDQpXZSBtYXkgYWxzbyBuZWVkIG5ldyBtYWNyb3Mg
b24gaG93IHRvIGNob29zZSBkaWZmZXJlbnQgc2VjX21lbW9yeV9vcHMNCnNpbmNlIHdlIGRvbid0
IGhhdmUgZGlmZmVyZW50IGJpbmRpbmdzLg0KDQo+IA0KPiBUaGFua3MsDQo+IFZpamF5DQo=
