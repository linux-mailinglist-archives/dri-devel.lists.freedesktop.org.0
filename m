Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1217BB3FC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 11:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB9B10E4D3;
	Fri,  6 Oct 2023 09:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23010E4D3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 09:11:15 +0000 (UTC)
X-UUID: 4b9236ba642811ee8051498923ad61e6-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=e84c7vcsbacuBh5JPR11kru5vYj9DNzUu41SWx+qHPA=; 
 b=DpEkPRoeBvgT1hYq0C/U8/BHOKQ18VAdrOue99ufGUTRkHx973M2A8J15pMneqFusvTcQddX4qVJ3xi58dXReMQR9MFl6aw1gmK+fBQjDRdMUBFAHrhes06mvlHhK4wTaRE70ZETdPV8zha3GMpkmKLKwHxmwTNmv1DYZqCmzv0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:8af9aa74-b7b5-4544-a1af-6e2806d7d696, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:94f083f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4b9236ba642811ee8051498923ad61e6-20231006
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1314106109; Fri, 06 Oct 2023 17:11:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 17:11:11 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 17:11:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqcLC0pzrN42OmqqzQdY8+oJX9oUqAD8ydcMOtrDd1863xrchaSdyh0DCDE4mA9cKo2IhepIqHvoBXLCyjkik65py0Dn3Dy1cqVK5z3xp9Ckz6+lOJC4hN/KrNUX4GU0ZQYSvGyfx+KPknDz+RZjsdRFTnATsJI2BCMggipvjwCXhiE5q+Ar9g0XyAk4mh+z3thi+H7hfY5FLQrTNyfJroJNaPyACyCKjr8beooRXihTdPtXP4suzkE0VKMbcFzgEAmQdehEaAPJdWBDAW2LXRFn3TGyy14LTXBHphpV76o0K65ttCEs4zQwOOusqEAFo6msuE2qz39teRJAEX+OAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/BTzDjjJBp7fBA9xsbOLAzx+aL8UlQDwfE3F4hld2M=;
 b=K36irRbVTv3Chut3GnKkAvDt0UdqwgUmcREIvygb6OnRxoqO/ftyesF5YYNO12U38MnLEf6MKToSTaET+yhsUgr5UlIXwPbSJWLeoaRq5SJsZzAXKxxguX70QKVuYXSLxCdkjg5cjSjBLzJNZ/SnK3OblIkbeL7XytWfrG0MU+HNf8R3oYNGxlEHMg87mUZEMnsmQxYIKEn3JCFdz9Utlb+liVvxAP/Ga2vIp6yS38PzkGOwVvutV4VytBx9N9QHPly27ZWmWSwvyurisbb0p5UpegLwIWYVhjnw/6lEqYJc54kvK+EiGCzeDMtKr2juKuCnRYEskP4jeqtKhyvmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/BTzDjjJBp7fBA9xsbOLAzx+aL8UlQDwfE3F4hld2M=;
 b=mJF73x9kCQnwq0QNHV4MlM7KxmRj6FZTADS5iVuAOZC48z+tj9KpOhV28oQpYf5xIh9Fuoi98I8P+igTYtBuAGOPUiZfNIHZTJn+HPyUlK3xnhDEs3os9y/6zFndu1obQfgE5xqLnSQaevZHmMvaxDtQwPR8Hj3YO1f3NUgwk3U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8289.apcprd03.prod.outlook.com (2603:1096:990:46::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Fri, 6 Oct
 2023 09:11:08 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Fri, 6 Oct 2023
 09:11:07 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v7 20/23] drm/mediatek: Remove the redundant driver data
 for DPI
Thread-Topic: [PATCH v7 20/23] drm/mediatek: Remove the redundant driver data
 for DPI
Thread-Index: AQHZ+CgvyPF4Bm3940yBadfla4nAnbA8ecOA
Date: Fri, 6 Oct 2023 09:11:07 +0000
Message-ID: <ec4bae581ac120276cc041d82203ff07a48d5c2f.camel@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-21-shawn.sung@mediatek.com>
In-Reply-To: <20231006073831.10402-21-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8289:EE_
x-ms-office365-filtering-correlation-id: 5a168e91-bc33-4d43-7fdf-08dbc64c2d0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f3OG9Y2lVwiX1Au7Rx6kflWRJKeFOyNymEfyPGl5PJugEmbcC87ncee4B29wLQCcZ5j/PmvF2UYvl8afshtKXEMHWBqSPegtYj57flR5oS9JBnh62Z+tiCENZ6jDBf7QJuwOSLxD7wj88MduFB7IxPUwsU4dUQ6u90Wi001Kpznn9Bv8jcC+gTgrT+6fWzsFNRD6Sf+NAjH2iZC/2FjyfYCEAM2W2FseOHjgLdtQd/O+V7vk/rfk94Y6qHS+GmLczOAvt+q1WXhkIrHzCIbnsfGWAp9W2uI1e/rBFvGpHl4U5OEsPLg/Db0g1Mcyjov38RkLiNOI0+kJPekOrYAHBYmyTLDKNo4+a/EooZvdg9sDM6Vgeu/Xyrk0nSi77R14ykE/ZtTf0zJSO4Z/czXnmvvrj/cmO4r0BWlrwFDExesiJQeT56xDzCDI+N0DcxHxvzudibOTuxvZ8mGncOqPo/TCN3WwHlE1e6CKn+SszcyLoy8QYH6NMfsU7ucB6/S2+jUOlbAz0P5E7luNCgI644RYflazXAwHEV+Yyo3nqPjEAeMghG1wxH1WiyORDZTjuQM3cKGz9QTzYbXR+8CGQlFpspYxjwu+oJRuI4b88AjkmrHhH5ElPN6Z2oxLq90YDqsIvelAbPW8mRaWfdZYjeUMjEEmPul3IHKwVmDPKSw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(478600001)(26005)(2616005)(38070700005)(85182001)(36756003)(86362001)(122000001)(5660300002)(38100700002)(2906002)(7416002)(83380400001)(6506007)(6486002)(6512007)(71200400001)(41300700001)(54906003)(66446008)(316002)(4326008)(8936002)(66476007)(66556008)(110136005)(64756008)(76116006)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTJ2b1FuMEhiZm95NnlJQVFhZ1pGM3MveEQraGN3NVhsSzVCN3hnc1Y3c3lX?=
 =?utf-8?B?QXBBOVZXWHlDQ2p3ZDdDU1pjMUU5V0U1QzFabWlnK2NRSDJZTFlObzAxd0tI?=
 =?utf-8?B?ZkRGQWRJUWdndkJUVGhEdGRJelBoWGE0YTl5SEh3NG5uZ2tLcEpPalZTOVhl?=
 =?utf-8?B?SnhhNkU4OXpaQ1Uyb0pzbGx2b056clYzWURNZ1VkSEYwdEhqRzJQZzIzbmRs?=
 =?utf-8?B?YzN6dXZxSFB3bFIxZ1lrbCszK1IvYUNrYzlYV1dqNTdrT3hORUNHQnNLbHRt?=
 =?utf-8?B?N2s4allqVG41dHJ2Snh2bXFyZkw2cFRObURBZmV4NFJuUEMrRDJvdCtITjlN?=
 =?utf-8?B?QzhXSXRzaWxDcitCMENlYlpVTStKbUdwOFlDTXhjajNnMHhsYXQ3VGQrc2p0?=
 =?utf-8?B?aForMzRJbGVUcXZPbFdxekx6d2tya0xoeThsVzBHNmhpaU9XUFdlRndPL3dU?=
 =?utf-8?B?RG5OK3RaMGNkaUNpRFE0cUZYK1NGcisxclBBNzJ0VWVQa1E0ZzVEQlcyR2Fi?=
 =?utf-8?B?YW5DN25GcFpNaXFZTVRRRnNxblFQdEMyTnpmcWp1QkVDTUNuUzdIdlNibi9N?=
 =?utf-8?B?dG9kS2h2b1Z4QzV2YmZCM1dmZlFCU1pkbHBLL0FIL1VJcGJCaUY0bHNrM2ta?=
 =?utf-8?B?TElRa1JCR3pkWkpETU13aFJRUlhiZFhsNlpTSE9vQTFDSExmOWZBT1RaOTN3?=
 =?utf-8?B?UmFUbnhQS0cwOVpvTGdHdnExajl0aVNEbDYvREoxalMwWS9Dd0pva0hkdHNj?=
 =?utf-8?B?TWZ2Q2VVdkVLTVdDblJxci96V1BVVzhKaWcrSU9qcHlueWxOTXNscXB0Q0p3?=
 =?utf-8?B?ZkkxcTd0bGs3ZWVnQXFjRmkyWVdXZ1Q3c2E2SndsSXVGQ2VRWGxDam1HMGth?=
 =?utf-8?B?Q0FZK2h3ZndPcU4wSmdTUHlnZWIxbmhaS2EzbHVWOXdBQ2FSeFpEUTI0M055?=
 =?utf-8?B?RlBUQUYwek5nQ1l4KzV5WFVtR2pmdGJSVFIzYVlnWTFidDJFUVIySFVyckZx?=
 =?utf-8?B?V1IzeHBDUkdsU1NVMC9zS2dFb3VjdGRhSE1jYjZTQmdqMkZsODBHQjRFZW56?=
 =?utf-8?B?VElVbE5tRG5YNERCdjRlNTR5UklGUll1QWJLVTBLbUZhMEcwL2lLSUNmV2l6?=
 =?utf-8?B?Z1JYQlJ1YlJhWGZsNHEvMnZrVy9NVE5MYUNFSmU1MUhGL0UwUnFmT3FFekdk?=
 =?utf-8?B?eWRNL2VVZFBIbWxhaDNYZFFvYkVGVkpqRlFBR01IYWdJQUw2bUMwZWpFVmFK?=
 =?utf-8?B?L0RvRDNiQTgvMWtSMWVNRjFoSEVINzJEYld1WVRrY05oSzFDVmVWb0JpekZ5?=
 =?utf-8?B?NDIxSXlhdW83blZXZndDUTl5MlEzU3FBRUtGN1pGU0lYL0taTjlJbnZlejd3?=
 =?utf-8?B?cXd1K3ZWK2t4UDhDdnJubDN5SW84b1puUXpaS0lObzNPcWNybmxJVFJhWFZC?=
 =?utf-8?B?dFA3K2Jjd0xpellIRmdIWTM0M1JBOGI5SHNmZFBMVU13eFUxWThPMFhrMFA5?=
 =?utf-8?B?Rk84cG5zS0JtRzBYT2ZpWlE1RHhPZCtKbC9BdHJxZzZiSzFTUE5OVEVEUHYw?=
 =?utf-8?B?eDFhcmFGbVZqMDhWRW1YZ05TTWE0T3huTHJuVk44TVZJU0M3a0ZUMUVrQmFU?=
 =?utf-8?B?YllmL1lFY1czOGU4OFdNaUh2RlFkSzVGZzJSVzhrVHRVc3RDallvR2FmUWNQ?=
 =?utf-8?B?a3FGR0hlMnB2Ym1NZHlkMjA0cnBTY2NWUThzUDUwQ1R0KzdWYkcwZ011MUFD?=
 =?utf-8?B?TzV1and6aHNqYlBUTWF5Vy9oUUNsRG1Zdzk3MENRTFRVMUpCeFBqdG1YdjVY?=
 =?utf-8?B?ekZPTzN5QnRiWXBpSFQ5ZHFYZU93N0pTSTliSThZNFdaaW5mU1A1djVQM2xa?=
 =?utf-8?B?bUN5OHNKNis5SHBoWEpNVUNJTzRMcWJGd0N3VmdTb1o4bXprUlNsTTZyZWw3?=
 =?utf-8?B?SHh4U3N2blFtcGFHVG5vZkZUTTQvWElpWlNxL2xXSmZxM3B5UDhGVWs5cEkr?=
 =?utf-8?B?VWlqN3Yyb3U4R1B6WE10dlozd3hibGd6WjdOTUhkODU1eDJBclBabXFqRUQ5?=
 =?utf-8?B?Q0I5WmlCL1BuVE1rZFlCMzRWelJkL0t2NEJScGJQVS96TDVvSDVYWUpNYTBF?=
 =?utf-8?B?TVFlNWdoKzd2MHVieHUxRTVXbHA5aW9JaWZiQmUzQWovRDBla3luSm5YeDRn?=
 =?utf-8?B?cHc9PQ==?=
Content-ID: <38A5D08FA450B4418951863E7F9B1D85@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a168e91-bc33-4d43-7fdf-08dbc64c2d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 09:11:07.8576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0WwTYGDtTyUz41nW1W8pzTFwdngJx9NM2Dm1rJiXgnHLwRZgOGu90zcRHiBjxUHo4IFvqZ4r3zycTIh3lEk8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8289
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_611604041.1332931760"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_611604041.1332931760
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTEwLTA2
JiMzMjthdCYjMzI7MTU6MzgmIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyO0RQSSYjMzI7aW5wdXQmIzMyO2lzJiMzMjtpbiYjMzI7MVQy
UCYjMzI7bW9kZSYjMzI7b24mIzMyO2JvdGgmIzMyO01UODE5NSYjMzI7YW5kJiMzMjtNVDgxODgu
DQomZ3Q7JiMzMjtSZW1vdmUmIzMyO3RoZSYjMzI7cmVkdW5kYW50JiMzMjtkcml2ZXImIzMyO2Rh
dGEmIzMyO3RvJiMzMjthbGlnbiYjMzI7dGhlJiMzMjtzZXR0aW5ncywmIzMyO29yDQomZ3Q7JiMz
Mjt0aGUmIzMyO3NjcmVlbiYjMzI7d2lsbCYjMzI7Z2xpdGNoLg0KDQpSZXZpZXdlZC1ieTomIzMy
O0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtGaXhlczomIzMyOzI4NDdjZDdlNjQwMyYjMzI7KCZxdW90O2RybS9tZWRpYXRlazom
IzMyO0FkZCYjMzI7bXQ4MTg4JiMzMjtkcGkmIzMyO2NvbXBhdGlibGVzJiMzMjthbmQNCiZndDsm
IzMyO3BsYXRmb3JtJiMzMjtkYXRhJnF1b3Q7KQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQt
b2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0Bt
ZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7fCYjMzI7MTYmIzMyOystLS0tLS0tLS0tLS0tLS0N
CiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlv
bigrKSwmIzMyOzE1JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYj
MzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYj
MzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtpbmRleCYj
MzI7MmY5MzFlNGUyYjYwLi5iYzA3M2E2YjM2N2UmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMz
MjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOysrKyYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTk1
NywyMCYjMzI7Kzk1Nyw2JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMz
MjttdGtfZHBpX2NvbmYmIzMyO210ODE4Nl9jb25mJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMy
Oy5jc2NfZW5hYmxlX2JpdCYjMzI7PSYjMzI7Q1NDX0VOQUJMRSwNCiZndDsmIzMyOyYjMzI7fTsN
CiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjstc3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMz
MjttdGtfZHBpX2NvbmYmIzMyO210ODE4OF9kcGludGZfY29uZiYjMzI7PSYjMzI7ew0KJmd0OyYj
MzI7LS5jYWxfZmFjdG9yJiMzMjs9JiMzMjttdDgxOTVfZHBpbnRmX2NhbGN1bGF0ZV9mYWN0b3Is
DQomZ3Q7JiMzMjstLm1heF9jbG9ja19raHomIzMyOz0mIzMyOzYwMDAwMCwNCiZndDsmIzMyOy0u
b3V0cHV0X2ZtdHMmIzMyOz0mIzMyO210ODE5NV9vdXRwdXRfZm10cywNCiZndDsmIzMyOy0ubnVt
X291dHB1dF9mbXRzJiMzMjs9JiMzMjtBUlJBWV9TSVpFKG10ODE5NV9vdXRwdXRfZm10cyksDQom
Z3Q7JiMzMjstLnBpeGVsc19wZXJfaXRlciYjMzI7PSYjMzI7NCwNCiZndDsmIzMyOy0uaW5wdXRf
MnBpeGVsJiMzMjs9JiMzMjtmYWxzZSwNCiZndDsmIzMyOy0uZGltZW5zaW9uX21hc2smIzMyOz0m
IzMyO0RQSU5URl9IUFdfTUFTSywNCiZndDsmIzMyOy0uaHZzaXplX21hc2smIzMyOz0mIzMyO0RQ
SU5URl9IU0laRV9NQVNLLA0KJmd0OyYjMzI7LS5jaGFubmVsX3N3YXBfc2hpZnQmIzMyOz0mIzMy
O0RQSU5URl9DSF9TV0FQLA0KJmd0OyYjMzI7LS55dXY0MjJfZW5fYml0JiMzMjs9JiMzMjtEUElO
VEZfWVVWNDIyX0VOLA0KJmd0OyYjMzI7LS5jc2NfZW5hYmxlX2JpdCYjMzI7PSYjMzI7RFBJTlRG
X0NTQ19FTkFCTEUsDQomZ3Q7JiMzMjstfTsNCiZndDsmIzMyOy0NCiZndDsmIzMyOyYjMzI7c3Rh
dGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfZHBpX2NvbmYmIzMyO210ODE5Ml9jb25m
JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy5jYWxfZmFjdG9yJiMzMjs9JiMzMjttdDgxODNf
Y2FsY3VsYXRlX2ZhY3RvciwNCiZndDsmIzMyOyYjMzI7LnJlZ19oX2ZyZV9jb24mIzMyOz0mIzMy
OzB4ZTAsDQomZ3Q7JiMzMjtAQCYjMzI7LTEwOTQsNyYjMzI7KzEwODAsNyYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNlX2lkDQomZ3Q7JiMzMjttdGtf
ZHBpX29mX2lkc1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3smIzMyOy5jb21wYXRpYmxl
JiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxNzMtZHBpJnF1b3Q7LCYjMzI7LmRhdGEmIzMy
Oz0mIzMyOyZhbXA7bXQ4MTczX2NvbmYmIzMyO30sDQomZ3Q7JiMzMjsmIzMyO3smIzMyOy5jb21w
YXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxODMtZHBpJnF1b3Q7LCYjMzI7LmRh
dGEmIzMyOz0mIzMyOyZhbXA7bXQ4MTgzX2NvbmYmIzMyO30sDQomZ3Q7JiMzMjsmIzMyO3smIzMy
Oy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxODYtZHBpJnF1b3Q7LCYj
MzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7bXQ4MTg2X2NvbmYmIzMyO30sDQomZ3Q7JiMzMjsteyYj
MzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4OC1kcC1pbnRmJnF1
b3Q7LCYjMzI7LmRhdGEmIzMyOz0NCiZndDsmIzMyOyZhbXA7bXQ4MTg4X2RwaW50Zl9jb25mJiMz
Mjt9LA0KJmd0OyYjMzI7K3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRl
ayxtdDgxODgtZHAtaW50ZiZxdW90OywmIzMyOy5kYXRhJiMzMjs9DQomZ3Q7JiMzMjsmYW1wO210
ODE5NV9kcGludGZfY29uZiYjMzI7fSwNCiZndDsmIzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUm
IzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5Mi1kcGkmcXVvdDssJiMzMjsuZGF0YSYjMzI7
PSYjMzI7JmFtcDttdDgxOTJfY29uZiYjMzI7fSwNCiZndDsmIzMyOyYjMzI7eyYjMzI7LmNvbXBh
dGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1kcC1pbnRmJnF1b3Q7LCYjMzI7
LmRhdGEmIzMyOz0NCiZndDsmIzMyOyZhbXA7bXQ4MTk1X2RwaW50Zl9jb25mJiMzMjt9LA0KJmd0
OyYjMzI7JiMzMjt7JiMzMjsvKiYjMzI7c2VudGluZWwmIzMyOyovJiMzMjt9LA0KDQo8L3ByZT48
IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlk
ZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVk
IHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlh
dGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29w
aWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91
ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWls
IHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_611604041.1332931760
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBGcmksIDIwMjMtMTAtMDYgYXQgMTU6MzggKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IERQSSBpbnB1dCBpcyBpbiAxVDJQIG1vZGUgb24gYm90
aCBNVDgxOTUgYW5kIE1UODE4OC4NCj4gUmVtb3ZlIHRoZSByZWR1bmRhbnQgZHJpdmVyIGRhdGEg
dG8gYWxpZ24gdGhlIHNldHRpbmdzLCBvcg0KPiB0aGUgc2NyZWVuIHdpbGwgZ2xpdGNoLg0KDQpS
ZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IDI4
NDdjZDdlNjQwMyAoImRybS9tZWRpYXRlazogQWRkIG10ODE4OCBkcGkgY29tcGF0aWJsZXMgYW5k
DQo+IHBsYXRmb3JtIGRhdGEiKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3Vu
ZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYyB8IDE2ICstLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMNCj4gaW5kZXggMmY5MzFlNGUyYjYwLi5iYzA3M2E2YjM2N2UgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBAQCAtOTU3LDIwICs5NTcsNiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxODZfY29uZiA9IHsNCj4gIAkuY3Nj
X2VuYWJsZV9iaXQgPSBDU0NfRU5BQkxFLA0KPiAgfTsNCj4gIA0KPiAtc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTg4X2RwaW50Zl9jb25mID0gew0KPiAtCS5jYWxfZmFjdG9y
ID0gbXQ4MTk1X2RwaW50Zl9jYWxjdWxhdGVfZmFjdG9yLA0KPiAtCS5tYXhfY2xvY2tfa2h6ID0g
NjAwMDAwLA0KPiAtCS5vdXRwdXRfZm10cyA9IG10ODE5NV9vdXRwdXRfZm10cywNCj4gLQkubnVt
X291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxOTVfb3V0cHV0X2ZtdHMpLA0KPiAtCS5waXhl
bHNfcGVyX2l0ZXIgPSA0LA0KPiAtCS5pbnB1dF8ycGl4ZWwgPSBmYWxzZSwNCj4gLQkuZGltZW5z
aW9uX21hc2sgPSBEUElOVEZfSFBXX01BU0ssDQo+IC0JLmh2c2l6ZV9tYXNrID0gRFBJTlRGX0hT
SVpFX01BU0ssDQo+IC0JLmNoYW5uZWxfc3dhcF9zaGlmdCA9IERQSU5URl9DSF9TV0FQLA0KPiAt
CS55dXY0MjJfZW5fYml0ID0gRFBJTlRGX1lVVjQyMl9FTiwNCj4gLQkuY3NjX2VuYWJsZV9iaXQg
PSBEUElOVEZfQ1NDX0VOQUJMRSwNCj4gLX07DQo+IC0NCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2RwaV9jb25mIG10ODE5Ml9jb25mID0gew0KPiAgCS5jYWxfZmFjdG9yID0gbXQ4MTgzX2Nh
bGN1bGF0ZV9mYWN0b3IsDQo+ICAJLnJlZ19oX2ZyZV9jb24gPSAweGUwLA0KPiBAQCAtMTA5NCw3
ICsxMDgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gbXRrX2RwaV9v
Zl9pZHNbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kcGkiLCAu
ZGF0YSA9ICZtdDgxNzNfY29uZiB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTgzLWRwaSIsIC5kYXRhID0gJm10ODE4M19jb25mIH0sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxODYtZHBpIiwgLmRhdGEgPSAmbXQ4MTg2X2NvbmYgfSwNCj4gLQl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1kcC1pbnRmIiwgLmRhdGEgPQ0KPiAmbXQ4MTg4X2Rw
aW50Zl9jb25mIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgtZHAtaW50
ZiIsIC5kYXRhID0NCj4gJm10ODE5NV9kcGludGZfY29uZiB9LA0KPiAgCXsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTkyLWRwaSIsIC5kYXRhID0gJm10ODE5Ml9jb25mIH0sDQo+ICAJeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZHAtaW50ZiIsIC5kYXRhID0NCj4gJm10ODE5
NV9kcGludGZfY29uZiB9LA0KPiAgCXsgLyogc2VudGluZWwgKi8gfSwNCg==

--__=_Part_Boundary_007_611604041.1332931760--

