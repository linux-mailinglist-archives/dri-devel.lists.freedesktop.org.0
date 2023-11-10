Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C008C7E76ED
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 03:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B5510E23A;
	Fri, 10 Nov 2023 02:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C451910E23A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 02:00:37 +0000 (UTC)
X-UUID: eec1e10a7f6c11eea33bb35ae8d461a2-20231110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5P2P1p46LLI5H0Qta3FG+XIQFwfQbt9V8Trc1Z7nKMk=; 
 b=qlqAle3WDASUND0JYo9kUhL+7YgfPf1Wp/Lc1dsvojvcr+yYSm7FOFXw9O+Xh+JIHltfLFLv+vQxAWNGgrWQV+mDUzCgwS6MGW6e8ZYdd3yGrjNNh8kPuMCnGo9tOg9dD0M/qhadD1A2dDgdaW3qIt1cXqeVJMfMDKgchCgqOfg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:f53df975-3d01-4a9c-9882-66eb9dbce91e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:58703995-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: eec1e10a7f6c11eea33bb35ae8d461a2-20231110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 591971947; Fri, 10 Nov 2023 10:00:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Nov 2023 10:00:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Nov 2023 10:00:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUEBCVNOCIDlVELleAJ8a+MRBblkk+nbNn3O0Gu8sQwMmiat2hkknHv7vrMDJ8pbqfKipeNwVUM9jsBGvA+ZnkfqpqgAKr/3y1Y4CN1nQdJTmg5dnuoRt5nrzGGv8m97Sy6P3SIP+DWLMDkWjuwc+tSxDHYv9ku8+lCkq2vEjTVp6wVoc0os4xU4wX0boosmus8T4ty0DAeBxj9WddDTBuW6SO4ZG/yNUXqIkdiLo1RH1Z50wq5tvFmmWo2ENsRPqWurH3v6mgl1SHvZOhns+412lBA7XI5eknFpSYPRaEFUsYmMAkyea4lypRWb+5FS1Lo14/ycRPlYObhR1GY1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP6z10M5tLg3hIB83HjgCucEfOKiRVeYboWUBj6dpCk=;
 b=f2ZEZnUhMh2C3uQsjVvZlC1QRKITHdb8tlxHJwHlv7gP+1FcQHBY+TuIptMj3nGJsIps8kv2/4SPscM1mjugGF0nyhJJ1bAnThJLijNI9l1C6AmHHFVIur8Eo9uyae0K4dxHTgsapY14C4gmPZs7Dlr/6qRwGWt494mJBRxOPxFY1Rvftpg/b+3ibBsV4TlUIK/vlMNa89Mh088CXsdKFFoSpbjW3PTqDTRyGpkytxiTmZsPJ4cXzZlJC3ZiGh6vQJ3y1xmvPjMuiziUJb99GK1w/M4+CXALBJA//QPkfYg3YJWJ9I6D0WS082jOuUCWwrTeGAs+OOpt2FAiOiHuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP6z10M5tLg3hIB83HjgCucEfOKiRVeYboWUBj6dpCk=;
 b=n8yFJdQbsovD1RSVeWRF4c2402pjii8YKSuVTUU58JDd3mzHJ1XcUAuhu69rigog85QxyNtUluvV7nh/dL4LPqg7DkXYxSYeWQEdAEggzv76gpFqKkZSAohiaf9fXbFDKrgKfOmeVLbyBiydjmjeY6YfydsMb4DzqQVitGmkgak=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6877.apcprd03.prod.outlook.com (2603:1096:101:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 10 Nov
 2023 02:00:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252%4]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 02:00:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U3R1YXJ0IExlZSAo5p2O57+wKQ==?= <Stuart.Lee@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
Thread-Topic: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
Thread-Index: AQHaE3WCy9+Bd6OJs0Kv90rK6TQPY7ByzG8A
Date: Fri, 10 Nov 2023 02:00:29 +0000
Message-ID: <f7c0a90a7f2302a53029c1cafd0b64271b2e546c.camel@mediatek.com>
References: <20231110012914.14884-1-stuart.lee@mediatek.com>
 <20231110012914.14884-2-stuart.lee@mediatek.com>
In-Reply-To: <20231110012914.14884-2-stuart.lee@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6877:EE_
x-ms-office365-filtering-correlation-id: 2709bcf3-af3c-4312-fe29-08dbe190d08d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M8Wh/lZpxlJJwpPnI7BaL+a9vf3CFKLdxjdIBJRWjsVfJAxv9rq/09H8TAjKeUQ3w/ws5Bc2/EVEN8+e4U7JiK4k7roINair6/e8yJhhMyPS6NY5ooPMBkKnz9/suH2YiGH/cmtFx/YTph39ZScqAzEgmhJRfslQPEOas0iqB2fsQnKDTRGGtPkm+VORGmgUPpUUZ6epWlOgBlJIUvezqW1Ndv3jpT+JPI413Z8Ky3khZIsVQC+DX8ZemPkpSxkGOltf79ieGBGsjidy560dUuLjmxQ6aGETbCHZQTkQWEp1EipWagqEzG8BLu52R7g+2Da3a5by0LgKt0slPTup9sUm7B4Jhv8NpbH4eygvX8+GkKw2IujWd91AkQMcnFLPJuelFGltUfX4Cvt6SQu27bGjAtumUR0xeO4jn1/rNSWsMQNQBeW3snR/uselChzM/E72T7j0+fdHQmbV/ntEumX9NgwIMaNyYaASxN9xXnWBJTYn2Uwp5x1EJI3A7SxF+iil50eQmfHwyExuc65VdpfOB9Ne4Sin0rHIgXQjWhY+iGwtF9U2GLN21DyAce3cz8wM2OvZucBF+XCG/B4WFDZe2YZAZ/AuTrFiSQ/ZoTDDjWBOhp72giyAWQVFvA+OY3daalK0AMl6kbREicw1T6Y33S594cyvkfUREBfNPTU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2616005)(26005)(107886003)(6512007)(122000001)(86362001)(38070700009)(85182001)(36756003)(38100700002)(83380400001)(478600001)(2906002)(5660300002)(7416002)(6506007)(71200400001)(54906003)(8936002)(8676002)(76116006)(64756008)(4326008)(66946007)(66556008)(66476007)(66446008)(316002)(4001150100001)(41300700001)(6486002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEdSMGd3WTJvbmRQQTZSbytWVWt4dFJWRnFyYWNjSGkza0hkb3ZVTFN5Vm1K?=
 =?utf-8?B?Umt2NGNCbmVQTzRERXkyeUZ3VDE4V1FTSVVldHhuYnNLNUNnaXgxZmZpVEZ6?=
 =?utf-8?B?cTB3VVJUbTJwQ0VxMjlQMVltU054cDM3NXllTm1WQnFMNFR3dmdraFFDRFA1?=
 =?utf-8?B?RGZkNmVoblBka0ZycnQzN3owZy94VkZMYXV6U3ZFd0JtWmtvZzlDcy9nZ3Nr?=
 =?utf-8?B?SGx0a1BRTm5NN1VkZzl4SCs0aU5RWkEyKythVHJJRDh4T1dmQ0dycG9kaDFQ?=
 =?utf-8?B?QnRxYjk2dkgwMWg5b0xMeU9PTkN0eGFNb1V5cTJiNWJGQ21Oam1YOUZZWU8y?=
 =?utf-8?B?aUdUNjNkekpDSHprd0hERkt1a0VmRHZubVNoYTRsQXNHQUl1c210cVRJQlVI?=
 =?utf-8?B?WXB6NWdKN1JjMkVFNmNkSi9VT2taVURmZGI5bHJDZlAyeUlWcXI4cG14M0l0?=
 =?utf-8?B?YUM3VWVZZXZWQ1dlUFg4R3lWbFN6dk5ueWZJbG9yVE5WN0Z2dU5YTjlCYkMz?=
 =?utf-8?B?dHJ0cVdSd202WFNpMmFWdjJpRDA2eVBBdno3WHRtMVMvaGNlcXJDQnQyWUhB?=
 =?utf-8?B?NkFXTERaZEFTRk9iV3RMd1ppWFh0cHNJRU1NNzNQblh5RTZGeVF3WmNnNTVx?=
 =?utf-8?B?eGt2eDBBR3JVSWZhT0F0SFVZTkF3OGNhM1dGazAwUzVPdEg1c2kxL0FiQkpI?=
 =?utf-8?B?TXFGT0pxWE15bHFaZXdJakpVQlBXQzVBWFUvSHBPVElRdkdwL1FiejdhQi9y?=
 =?utf-8?B?K0V5TmExeWFzQkcrTjNpOEN3eG1jUnVFaGJHUXNnMUpLY0YycW5zTGFLL1Nj?=
 =?utf-8?B?UHp4bWl3bXdla3RaMWUweUozMzFwZ0ZDeC81WFBXSTBNbkRmbUUxRUhFYUJT?=
 =?utf-8?B?a0VPbUcycEQ5b1M2ZTVPVjIxMXZKeVpSMkk3ZVpMU0JnaThFcklOSEl1V09a?=
 =?utf-8?B?bTdHVUlqUjBIS0c1TFZheG9jaEZwUldFZWlYcll5T21SUkkwK0pXamNyQzVk?=
 =?utf-8?B?VVhuVjVnK1hwbk9HRlVLa3lYUzFtR0FDWFZUVVBWcUNhM1JKU2NsbWZWRDh0?=
 =?utf-8?B?Y1kveGNuN3QzYzVPQVA2NU45MER5ZUxSSmdXL2dpbWNHV21Ma1BCYVcwSTQ2?=
 =?utf-8?B?dkJJc291b0hMejJnbXFoQ0hVZmc5d0NnSldxMEdQbmNXZEVLaWxldkhOWXFC?=
 =?utf-8?B?UWJ1OXBMVytoYnplZ0dadHNFWkdvam1wajNqSEt4aDQ2S2RIQ0JKNnc2TU1q?=
 =?utf-8?B?T3V1L3ZpNXJNM295RjR3NFh1QXFsTkpMMG5yR0lpQXRCWm1uQjh0UGJ5RWxn?=
 =?utf-8?B?V2JCeGpjMktVaFU4cUhST2d3OWRkeE9PMFI5TGwyVlJWWmZSS2FUVVlaTllQ?=
 =?utf-8?B?V2R4NDVnMWphRzEwYjVabG5xU09PVWx4TlhjclY3QTVyQkUwVVFGWlgwakJO?=
 =?utf-8?B?WGhmOW8ycjkxSUhYNzJPM2JUWHpVWnozaCtLOEhMeitRZnlCOVJ5NzAvcFNK?=
 =?utf-8?B?S25sc3g0L1BkU3BleDEyVzkvWWhUMTdDU2lzK3IwdUNkRnhJKzI2TlBNV2kx?=
 =?utf-8?B?MC81UWdZeEFuWkhqeTFPeDNxMjJwaXN4THFuQ0IxTFZESDBxQUVkWkJGUTJz?=
 =?utf-8?B?cGxRK1ptN0FLWkhVVlBMUFIvRVJuLzREMUtoUzFzdmlYS0h6TEszaWFiUnhT?=
 =?utf-8?B?ZkNmMUVJeE5XRUxsQW94NGs3WEF3ekY4aU5vdFB3cWI5djV3VnVaSWwwOGwx?=
 =?utf-8?B?eVNvVU5IeGNQdlVWZGloNDNUb2ZBMnRDSHNEcWZzN2FnYzgwNWVLbXlNODlN?=
 =?utf-8?B?TWNVRWttOC9tTzYxRWc5VHYrNnlyeXdMWjNlTGZkQVdWTUE3U3JhekJVbHNG?=
 =?utf-8?B?MjR0clg5ZUVKU1lua0NvQ0NqRFZIZEdBZWdhRStsQmo4MGs0dmdOS0NXV1A2?=
 =?utf-8?B?Sm43UzFScVhZalhhK3NZWSt1eHpsMktCeGhtd29sY3ZaSVRFWWVNWmdEVjI4?=
 =?utf-8?B?emptR1RGNG9PdGdEdTV3aHNrclRrbW82ZzdnSm5uZ2hsV2MyU3lscGpxYWNp?=
 =?utf-8?B?ZU0wZW82cmxFQk1uWGJYSDlaT0p3NnlxQ3J3MDZEQWw5eDA3OHRkRTE5QlVo?=
 =?utf-8?Q?muXyQqvg9Fr1UnE5koY437VmK?=
Content-ID: <F2E17A0E6AF0834FBB589BD09BE07A92@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2709bcf3-af3c-4312-fe29-08dbe190d08d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 02:00:29.3010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L1+MInX8Bk86GDmKBWX08lDXYZ65x+WyVwGFVJz7LlhEJApsp0pQyxI2y00xl4mewm4yCBL2xvPkTjTWsG2TNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6877
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_839080961.824292193"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_839080961.824292193
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7U3R1YXJ0Og0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0xMS0xMCYjMzI7
YXQmIzMyOzA5OjI5JiMzMjsrMDgwMCwmIzMyO1N0dWFydCYjMzI7TGVlJiMzMjt3cm90ZToNCiZn
dDsmIzMyO0FkZCYjMzI7ZXJyb3ImIzMyO2hhbmRsaW5nJiMzMjt0byYjMzI7Y2hlY2smIzMyO05V
TEwmIzMyO2lucHV0JiMzMjtpbg0KJmd0OyYjMzI7bXRrX2RybV9jcnRjX2RtYV9kZXZfZ2V0JiMz
MjtmdW5jdGlvbi4NCiZndDsmIzMyOw0KJmd0OyYjMzI7V2hpbGUmIzMyO2Rpc3BsYXkmIzMyO3Bh
dGgmIzMyO2lzJiMzMjtub3QmIzMyO2NvbmZpZ3VyZWQmIzMyO2NvcnJlY3RseSwmIzMyO25vbmUm
IzMyO29mJiMzMjtjcnRjJiMzMjtpcw0KJmd0OyYjMzI7ZXN0YWJsaXNoZWQuJiMzMjtTbyYjMzI7
dGhlJiMzMjtjYWxsZXImIzMyO29mJiMzMjttdGtfZHJtX2NydGNfZG1hX2Rldl9nZXQmIzMyO21h
eSYjMzI7cGFzcw0KJmd0OyYjMzI7aW5wdXQmIzMyO3BhcmFtZXRlciYjMzI7KmNydGMmIzMyO2Fz
JiMzMjtOVUxMLCYjMzI7V2hpY2gmIzMyO21heSYjMzI7Y2F1c2UmIzMyO2NvcmVkdW1wJiMzMjt3
aGVuDQomZ3Q7JiMzMjt3ZSYjMzI7dHJ5JiMzMjt0byYjMzI7Z2V0JiMzMjt0aGUmIzMyO2NvbnRh
aW5lciYjMzI7b2YmIzMyO05VTEwmIzMyO3BvaW50ZXIuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0sm
IzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO0ZpeGVzOiYjMzI7Y2IxZDZiY2NhNTQyJiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7
QWRkJiMzMjtkbWEmIzMyO2RldiYjMzI7Z2V0JiMzMjtmdW5jdGlvbiZxdW90OykNCiZndDsmIzMy
O1NpZ25lZC1vZmYtYnk6JiMzMjtTdHVhcnQmIzMyO0xlZSYjMzI7Jmx0O3N0dWFydC5sZWVAbWVk
aWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Q2M6JiMzMjtzdGFibGVAdmdlci5rZXJuZWwub3JnDQom
Z3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fY3J0Yy5jJiMzMjt8JiMzMjs5JiMzMjsrKysrKysrKy0NCiZndDsmIzMyOyYjMzI7MSYjMzI7
ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzgmIzMyO2luc2VydGlvbnMoKyksJiMzMjsxJiMzMjtkZWxl
dGlvbigtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7YzI3N2I5ZmFl
OTUwLi4wNDdjOWEzMWQzMDYmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KJmd0OyYjMzI7QEAmIzMyOy05MjEs
NyYjMzI7KzkyMSwxNCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHJtX2NydGNf
aW5pdF9jb21wX3BsYW5lcyhzdHJ1Y3QNCiZndDsmIzMyO2RybV9kZXZpY2UmIzMyOypkcm1fZGV2
LA0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtkZXZpY2UmIzMyOypt
dGtfZHJtX2NydGNfZG1hX2Rldl9nZXQoc3RydWN0JiMzMjtkcm1fY3J0YyYjMzI7KmNydGMpDQom
Z3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOy1zdHJ1Y3QmIzMyO210a19kcm1fY3J0YyYjMzI7Km10
a19jcnRjJiMzMjs9JiMzMjt0b19tdGtfY3J0YyhjcnRjKTsNCiZndDsmIzMyOytzdHJ1Y3QmIzMy
O210a19kcm1fY3J0YyYjMzI7Km10a19jcnRjJiMzMjs9JiMzMjtOVUxMOw0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7K2lmJiMzMjsoIWNydGMpDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtOVUxMOw0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7K210a19jcnRjJiMzMjs9JiMzMjt0b19tdGtfY3J0YyhjcnRjKTsN
CiZndDsmIzMyOytpZiYjMzI7KCFtdGtfY3J0YykNCiZndDsmIzMyOytyZXR1cm4mIzMyO05VTEw7
DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyO210a19jcnRjLSZndDtk
bWFfZGV2Ow0KJmd0OyYjMzI7JiMzMjt9DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_839080961.824292193
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFN0dWFydDoNCg0KT24gRnJpLCAyMDIzLTExLTEwIGF0IDA5OjI5ICswODAwLCBTdHVhcnQg
TGVlIHdyb3RlOg0KPiBBZGQgZXJyb3IgaGFuZGxpbmcgdG8gY2hlY2sgTlVMTCBpbnB1dCBpbg0K
PiBtdGtfZHJtX2NydGNfZG1hX2Rldl9nZXQgZnVuY3Rpb24uDQo+IA0KPiBXaGlsZSBkaXNwbGF5
IHBhdGggaXMgbm90IGNvbmZpZ3VyZWQgY29ycmVjdGx5LCBub25lIG9mIGNydGMgaXMNCj4gZXN0
YWJsaXNoZWQuIFNvIHRoZSBjYWxsZXIgb2YgbXRrX2RybV9jcnRjX2RtYV9kZXZfZ2V0IG1heSBw
YXNzDQo+IGlucHV0IHBhcmFtZXRlciAqY3J0YyBhcyBOVUxMLCBXaGljaCBtYXkgY2F1c2UgY29y
ZWR1bXAgd2hlbg0KPiB3ZSB0cnkgdG8gZ2V0IHRoZSBjb250YWluZXIgb2YgTlVMTCBwb2ludGVy
Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4
ZXM6IGNiMWQ2YmNjYTU0MiAoImRybS9tZWRpYXRlazogQWRkIGRtYSBkZXYgZ2V0IGZ1bmN0aW9u
IikNCj4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IExlZSA8c3R1YXJ0LmxlZUBtZWRpYXRlay5jb20+
DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgOSArKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gaW5kZXggYzI3N2I5ZmFlOTUwLi4wNDdjOWEzMWQz
MDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gQEAg
LTkyMSw3ICs5MjEsMTQgQEAgc3RhdGljIGludCBtdGtfZHJtX2NydGNfaW5pdF9jb21wX3BsYW5l
cyhzdHJ1Y3QNCj4gZHJtX2RldmljZSAqZHJtX2RldiwNCj4gIA0KPiAgc3RydWN0IGRldmljZSAq
bXRrX2RybV9jcnRjX2RtYV9kZXZfZ2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4gIHsNCj4g
LQlzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YyA9IHRvX210a19jcnRjKGNydGMpOw0KPiAr
CXN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0gTlVMTDsNCj4gKw0KPiArCWlmICghY3J0
YykNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gKwltdGtfY3J0YyA9IHRvX210a19jcnRjKGNy
dGMpOw0KPiArCWlmICghbXRrX2NydGMpDQo+ICsJCXJldHVybiBOVUxMOw0KPiAgDQo+ICAJcmV0
dXJuIG10a19jcnRjLT5kbWFfZGV2Ow0KPiAgfQ0K

--__=_Part_Boundary_005_839080961.824292193--

