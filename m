Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B480015E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 02:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C6E10E7A6;
	Fri,  1 Dec 2023 01:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C6410E7A6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 01:59:50 +0000 (UTC)
X-UUID: 4bce89b28fed11ee8051498923ad61e6-20231201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=8hLpesx28hWyYr2ocFVCHCjWvsHOXc74SZCfrIZEpPE=; 
 b=DIvI+ZOFqxgvZDUFa26oJqr2w7/a1fOSaJbcIgWHFfd9KeDTH4Qm1FLavwV6TRseOcgy2/kMR9k7JWD2/Lmf65irh+WRlePjkf/sAugWxlSpCua13mndbKiGCfrQ8cv5MVN80rr7onRD6UYPJCTRnxkdSYp4unSdu4W2mHfK1cM=;
X-CID-CACHE: Type:Local,Time:202312010946+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:4e0a7337-c446-41e5-ba63-9dce7c06a2f7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:abefa75, CLOUDID:186b4673-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4bce89b28fed11ee8051498923ad61e6-20231201
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 253512189; Fri, 01 Dec 2023 09:59:43 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Dec 2023 09:59:42 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Dec 2023 09:59:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV5gtMpeUjGyq/bwHFZcXAsg6Nm7aGOgpyqadoqGUl+XPxbsK7meI86QuOKAIk2vCts7F5ef8sm8uaeRYWw05aQ7O+WZ5+WfQ4I7dYktdt+Bi6F48XcE+CEUHq49urQI1ok17k5ZC5PF31L02CABu2dZkWVK5FWZZSrOPzpmEjF1/+IOaKedgcX/8AAnKhQXMHlk+ffdnGccYoOh3HaQYFmFrXuK/3mgmYm2yz1glwF4PhXfPVphXguEMzeimExOW5nZekjcqSTNDPphyAVk+5mGEU4QmgekFIUzvZvbhDgNia5/XIG96D71pNoKrPKxWoMrOx2+ildQcMcsRLLt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa6qmHSFMxu3lgRhZ4+0EquKhqVvlLxdCA41TWZvYPM=;
 b=QvpksM6CIdjmyBhjWTdGC7+L1OgbITIRcBdJzzw5lRKttkpXWhrD7Tb/oz52ejZECUjWsaTHeHep4JuOZBANZnre1eiFRTw9zS5gosbjaXInsp5AoNnTBEyP0mZEb+Ohz9dUU5XdMFp9B/jmE8MkYIvu1J0BO95fjUYuUeCpLeuaQ26VsASjC+t43U9TwdOCJNoNyPUiGzIYu7m1zjE6gCQQwrvqBCWbGxs+4o1YRVNmqSXw/AETNBItdECTxEqHHc1JocI5mqgC8hO5ocRsZjiOxEOs5LqGOEUe0xRCn24oKqnISskBoO+YPOVpMZuO/AcYDMFdFTqySAVAMAQTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa6qmHSFMxu3lgRhZ4+0EquKhqVvlLxdCA41TWZvYPM=;
 b=pL+J4vQyar5QcHBENWxdzLi3dxsyXWW1Bixr7E2hQfnwkjBt19Lku9ugjMANC8DPfokSeEiL0LQimzlZ3dRDeomC+qsmHjgiUj8YhzkSZp8CLbH3waV7AdaSsDW+0AMQ+S2kP/Hxsx+qxGfHwCm/YloHc2ENslUBs+CwZ48B2XI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7303.apcprd03.prod.outlook.com (2603:1096:990:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Fri, 1 Dec
 2023 01:59:38 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 01:59:38 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrCTtquA
Date: Fri, 1 Dec 2023 01:59:38 +0000
Message-ID: <acb94c6918cf9f212d0d9fadd414e66e132b5e11.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7303:EE_
x-ms-office365-filtering-correlation-id: f86ee3d0-229a-47a9-205f-08dbf2112cb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PpQj5CdvHIVNEg/lIhQQbXLZtg4YjFaxqMz8E1Y8ldRPYGAhzvtWZGO5cnYk1nO606RDfwsLSn0VtVzKLgkImLupuw+sFQ1XbxUZ2tf0CDXgufCJirL4GREVPYrw6FFzti+qu+34ISwEx6jOZfiS4oFL2wLqBzt8huPKado9hQXpM66jE8Id3EQErrsLUERm38nWOzGMvVN703pLIF5ZT3ij8H8qeZe6iEjuenQ65GylTczy9tEK5Z07WGsty3plSDhoQaCSNqxh0yCEz8dmHPwxnQhPs8/hEzgLeI3FPo/dUfanniNGlQxX76+lAYfIkvAc/SKF50IPRuPRYUaMDteTi0yPsX8pbDzr4NPcQZqL95vZ4Ag5TqR/TufPGTQjK/HqJPMLKB3J4/+QwrjE7ygvqusdTc4ex255/yZBKSuBnMStmsXJF4tVgLMySZ801/LciFx9nR0XUdAQAyKKMHvzkVYwGqJRdnvgnTQzdNGhiFWWl9u0qtX/UTqSkEsnXR+lA7nF2fZhcPfUpndm1SFKOKa+wAdrYAXF6AKGdMKyN5qV1lb2nnogx5GABgoYMaghb3agD6QHyGO/CNgixwPwEf+qK24MDFjLULK0h7n9ckTDirtayuWsTAMoNkYX7SVGV1b77abgB3IXS4/ascfWVNrs4EfmOnUCR5utJJg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6512007)(107886003)(4001150100001)(54906003)(6486002)(478600001)(66556008)(76116006)(316002)(4326008)(64756008)(66446008)(66946007)(66476007)(110136005)(8676002)(8936002)(71200400001)(5660300002)(86362001)(7416002)(85182001)(41300700001)(36756003)(122000001)(6506007)(38100700002)(26005)(83380400001)(2616005)(2906002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUlEcjlzU1JYVnFOQnFhMHBGalBhVEtSZ2hxM0N6NTNacUZaMUlEbEpqVmZQ?=
 =?utf-8?B?dVpKR0o3UXRhS0tWZEpUTFRQRUVxUjAyOHpUWXZycHZXaHBDTTBqdXhQZnFR?=
 =?utf-8?B?ODhsYVlJQjRzOExHaENMS3NBZ0h0Qy9OeVJoRkZ1eGVKOWc3MitrTDhUbHVL?=
 =?utf-8?B?RGh5amhyYmRnanQ5bDc1SXZGTmI0VW9jNTgxbzlIT3NVSUdwSlNZd2pKVjF3?=
 =?utf-8?B?UGZUQ0dhU3NxVWVVOC9hVmR6Tzk2cDRwNmZTWWljTStpZVVGdzZ2K1hyeURi?=
 =?utf-8?B?WWN5K2hPcm05TFl6amdVQVVKc0tsbVVjcmxFZGZKU08vREppSHNJYkthb1Bk?=
 =?utf-8?B?WFY4ck9NQUxVNzRodytXMVMwazlRakw4Z3hWVS9HdFBmVHl1Q2o4cTM3dU44?=
 =?utf-8?B?eVVlbnZTcTFmdkhnQ29LRVRNS1J5NnpEQ1JzMElJeFdPVDZQZkNOZDc5alFC?=
 =?utf-8?B?VnR3dlR3V1pPM2hydElybGhrcEVsdy90RTVyQXpyN200TzhWMmpUa2cyaUpt?=
 =?utf-8?B?LzAvZUZYN3FxMFljVGorMGxGWDV2dUYvY0Z1bGZ5SFRWUTgrRWEyeFd2TGJq?=
 =?utf-8?B?eXYxQzlvVWpVMWwzWEJYaVB4M1VpK3IrY2t2S1BNaXVvd2lGZGVxSDJhNkt6?=
 =?utf-8?B?MVBJRmsyVGEzaG43aXJWSWthNy94c0h0cndIekVyajdnNzBGdVIxVFZrcHQr?=
 =?utf-8?B?cHMzRUM2MWV3RjM0ZlduM0FodEUwOG5MR1NocVVEbWZObVRYaUw5M1lQT3lK?=
 =?utf-8?B?Z2J1WTNVV2k0d3NuNFl1SEhqQjVSckx1aXpVVHBYMkNybUJ0Vlk3WldPckl2?=
 =?utf-8?B?Wms5VHpRQ1Z4TWI2S3BxOVpHMzFRMkVuWU5jSEVjWWhYUmF0RzBIZ1pndml4?=
 =?utf-8?B?NGE1SEtyWlpWR08vNTBVUXdpRnloVUtINHdzajF1ODlhZWVxbVUwQ1RBTDVa?=
 =?utf-8?B?S3NLY3FYeEE1VUw4T1FZeDc2SkdVMkExMy9xa3E0VDRoNVNxMmR0Smgzd1NG?=
 =?utf-8?B?SzdOQXIrVk5OQTlKZzlhSFY5MEpLNWZWTzNibDExRjVlTzZOREVxekJoQzhK?=
 =?utf-8?B?SmhPVTdTRU1GdHljQUhRZ3BkeDNQb3NiUlhHdHljby9vTVNaVlp6UHlQT1B1?=
 =?utf-8?B?Rkx4MjYyWjFGdWpkUDMzQk8rd3IzK3FlVk0xRHMzQVFZaFp5T3dlS0MxVUg5?=
 =?utf-8?B?YkRUM1owV2hpV2VvTTc0WFpsdXF5WThqRE01VXhJRiszREJJZ0hLOHdYTXBV?=
 =?utf-8?B?aFQ4enJzTm1ZenhXUFduaHdDSFU3emFGb0Z6YjdGNWhrczB6blZKTHo5NW5U?=
 =?utf-8?B?eVh2ZU90MWxVVXRmMzNDeGo1TzcxaWpKUjVrbm5SWXFxYUo3WDBFVTA5ak1R?=
 =?utf-8?B?Z21iM0tLN1VFNDNNNEdnN0UyNHpxaUxJV2Vybit5aEpqMGpaaldSQjZRemFn?=
 =?utf-8?B?R3F1dlRWVTRwaCt5QTRKNk5kd2gwaHJnNVhBUWJsZWwzZkp3UGpBNFNkVWRG?=
 =?utf-8?B?WS90eWk3Vll4QVZDL0hjQVl1K1BITklBUE1wY3FEbi9mdVpjeHNpeG8zWUlP?=
 =?utf-8?B?NTRURVlQcmdwc09VUys0bm1SQ0NvUzZ6VkswcW1GeXloRDQ5am41RGlielUw?=
 =?utf-8?B?OVM2bnhHYnFBN0RzY3k2ZUdRbm8ybFNzRUQxbGEvMGxQVTBIMXBxMktBazBi?=
 =?utf-8?B?TnY4b05BdzVCYTA4aW1qQWdWZ25NVWw1V3dNNmpPTTgrcmFmZzhsR09HODNo?=
 =?utf-8?B?NFNVbEhzYmV3S3hlMCtTZTNvNk9Fa1pMNzVDREdONzJaK1RrOEZaaitPRk9h?=
 =?utf-8?B?c3FFVEhQaDBiSDVvSVJscDYvaXRuS2R5aDFGNDIwaDhlSTRjZ1NNckpCajlG?=
 =?utf-8?B?eFZkbU1pL1Fua0l0V3hreG1GM0JRMW1qKzRmeDhkSXpWRFZMOFNYekRXeU5L?=
 =?utf-8?B?dHY3UVJkVVpROFQ1MHZFbTJvN01HUytlQWs4N0xZRndvMDMvMGoyaUdtbExo?=
 =?utf-8?B?eGFsT1NaWGtmR2Fkdjg2dXkxWkl6RnhlempvdWEzL29Tc28ySmpjM0ZpdVB3?=
 =?utf-8?B?L2NkTWpMZFFIa0t2eVZrMW56ZU5RS2x5ZjJpMGZQZ1UyT2hzU3VTR3grdGQz?=
 =?utf-8?Q?DpxWCOZ706GjuYn5pwHhy6cmh?=
Content-ID: <EC1B0812E15E8C41A1D7964516E27102@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86ee3d0-229a-47a9-205f-08dbf2112cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 01:59:38.0516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PB4oSwudP+yhhsUZyPnvufX7O4M7iuQegTTL0u28XpWb9FahPgLFCQbBNN/eUbTTWRmprUak2QCa+P0IIq4ciQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7303
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1213232259.1460612620"
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_1213232259.1460612620
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7TWFjOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0xMS0yNCYjMzI7YXQm
IzMyOzE2OjUzJiMzMjsrMDgwMCwmIzMyO21hYy5zaGVuJiMzMjt3cm90ZToNCiZndDsmIzMyO0Fk
ZCYjMzI7dGVlJiMzMjtjbGllbnQmIzMyO2FwcGxpY2F0aW9uLCYjMzI7SERDUCYjMzI7MS54JiMz
MjthbmQmIzMyOzIueCYjMzI7YXV0aGVudGljYXRpb24mIzMyO2Zvcg0KJmd0OyYjMzI7RGlzcGxh
eVBvcnQNCiZndDsmIzMyO3RvJiMzMjtzdXBwb3J0JiMzMjt0aGUmIzMyO0hEQ1AmIzMyO2ZlYXR1
cmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjttYWMuc2hlbiYjMzI7
Jmx0O21hYy5zaGVuQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMz
Mjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsmIzMyOyYjMzI7JiMzMjs3JiMzMjsrLQ0KJmd0
OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGNpLmgmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsmIzMyOzE0MyYjMzI7KysrDQom
Z3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9jYS90bERQSGRjcENNRC5oJiMz
Mjt8JiMzMjsmIzMyOyYjMzI7MzYmIzMyOysNCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL2NhL3RsY0RwSGRjcC5jJiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjs2MzgmIzMy
OysrKysrKysrKysrKysNCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL2Nh
L3RsY0RwSGRjcC5oJiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjszMDUmIzMyOysrKysrKysNCiZn
dDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsxNTkmIzMyOysrKy0N
CiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5oJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOzE3JiMz
MjsrDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfaGRjcC5o
JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsmIzMyOzE1NCYjMzI7KysrKw0KJmd0OyYjMzI7JiMz
Mjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3AxeC5jJiMzMjsmIzMyO3wmIzMy
OyYjMzI7NjQ2JiMzMjsrKysrKysrKysrKysrDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBfaGRjcDF4LmgmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOzU1JiMz
MjsrKw0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3Ay
LmMmIzMyOyYjMzI7JiMzMjt8JiMzMjsxMDA4DQomZ3Q7JiMzMjsrKysrKysrKysrKysrKysrKysr
KysNCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9oZGNwMi5o
JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOzc1JiMzMjsrKw0KJmd0OyYjMzI7JiMzMjtk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX3JlZy5oJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO3wmIzMyOyYjMzI7JiMzMjsmIzMyOzYmIzMyOystDQomZ3Q7JiMzMjsmIzMyOzEzJiMzMjtm
aWxlcyYjMzI7Y2hhbmdlZCwmIzMyOzMyMzMmIzMyO2luc2VydGlvbnMoKyksJiMzMjsxNiYjMzI7
ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsmIzMyO2NyZWF0ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0JiMz
Mjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGNpLmgNCiZndDsmIzMyOyYjMzI7Y3JlYXRl
JiMzMjttb2RlJiMzMjsxMDA2NDQmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9jYS90bERQ
SGRjcENNRC5oDQomZ3Q7JiMzMjsmIzMyO2NyZWF0ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0JiMzMjtk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGxjRHBIZGNwLmMNCiZndDsmIzMyOyYjMzI7Y3Jl
YXRlJiMzMjttb2RlJiMzMjsxMDA2NDQmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9jYS90
bGNEcEhkY3AuaA0KJmd0OyYjMzI7JiMzMjtjcmVhdGUmIzMyO21vZGUmIzMyOzEwMDY0NCYjMzI7
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5oDQomZ3Q7JiMzMjsmIzMyO2NyZWF0ZSYj
MzI7bW9kZSYjMzI7MTAwNjQ0JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hk
Y3AuaA0KJmd0OyYjMzI7JiMzMjtjcmVhdGUmIzMyO21vZGUmIzMyOzEwMDY0NCYjMzI7ZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9oZGNwMXguYw0KJmd0OyYjMzI7JiMzMjtjcmVhdGUm
IzMyO21vZGUmIzMyOzEwMDY0NCYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9o
ZGNwMXguaA0KJmd0OyYjMzI7JiMzMjtjcmVhdGUmIzMyO21vZGUmIzMyOzEwMDY0NCYjMzI7ZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9oZGNwMi5jDQomZ3Q7JiMzMjsmIzMyO2NyZWF0
ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
X2hkY3AyLmgNCiZndDsmIzMyOw0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3N0
cnVjdCYjMzI7Y3J5cHRva2V5c190JiMzMjt7DQomZ3Q7JiMzMjsrdTgmIzMyO3R5cGU7DQomZ3Q7
JiMzMjsrdTMyJiMzMjtsZW47DQomZ3Q7JiMzMjsrdTMyJiMzMjtrZXk7DQomZ3Q7JiMzMjsrfTsN
Cg0KVXNlbGVzcywmIzMyO3NvJiMzMjtyZW1vdmUmIzMyO2l0Lg0KDQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsrc3RydWN0JiMzMjtjbWRfaGRjcF9pbml0X2Zvcl92ZXJpb25fdCYjMzI7ew0KJmd0OyYj
MzI7K3UzMiYjMzI7dmVyc2lvbjsNCiZndDsmIzMyOytib29sJiMzMjtuZWVkX2xvYWRfa2V5Ow0K
Jmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjtjbWRfaGRjcF93
cml0ZV92YWxfdCYjMzI7ew0KJmd0OyYjMzI7K3U4JiMzMjt0eXBlOw0KJmd0OyYjMzI7K3U4JiMz
MjtsZW47DQomZ3Q7JiMzMjsrdTMyJiMzMjt2YWw7DQomZ3Q7JiMzMjsrfTsNCiZndDsmIzMyOysN
CiZndDsmIzMyOytzdHJ1Y3QmIzMyO2NtZF9oZGNwX2NhbGN1bGF0ZV9sbV90JiMzMjt7DQomZ3Q7
JiMzMjsrdTgmIzMyO2Jrc3ZbQktTVl9MRU5dOw0KJmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQom
Z3Q7JiMzMjsrc3RydWN0JiMzMjtjbWRfaGRjcF9nZXRfYWtzdl90JiMzMjt7DQomZ3Q7JiMzMjsr
dTgmIzMyO2Frc3ZbQUtTVl9MRU5dOw0KJmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQomZ3Q7JiMz
Mjsrc3RydWN0JiMzMjtjbWRfaGRjcF9zaGExX3QmIzMyO3sNCiZndDsmIzMyOyt1MzImIzMyO21l
c3NhZ2VfbGVuOw0KJmd0OyYjMzI7K3UzMiYjMzI7bWVzc2FnZV9hZGRyOw0KJmd0OyYjMzI7K307
DQoNClVzZWxlc3MsJiMzMjtzbyYjMzI7cmVtb3ZlJiMzMjtpdC4NCg0KUmVnYXJkcywNCkNLDQoN
CiZndDsmIzMyOysNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO2NtZF9oZGNwX2FrZV9jZXJ0aWZpY2F0
ZV90JiMzMjt7DQomZ3Q7JiMzMjsrdTgmIzMyO2NlcnRpZmljYXRpb25bQ0VSVF9MRU5dOw0KJmd0
OyYjMzI7K2Jvb2wmIzMyO3N0b3JlZDsNCiZndDsmIzMyOyt1OCYjMzI7bVtNX0xFTl07DQomZ3Q7
JiMzMjsrdTgmIzMyO2VrbVtFS01fTEVOXTsNCiZndDsmIzMyOyt9Ow0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7K3N0cnVjdCYjMzI7Y21kX2hkY3BfYWtlX3BhcmluZ190JiMzMjt7DQomZ3Q7JiMzMjsr
dTgmIzMyO2VrbVtFS01fTEVOXTsNCiZndDsmIzMyOyt9Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
K3N0cnVjdCYjMzI7Y21kX2hkY3BfZW5jX2ttX3QmIzMyO3sNCiZndDsmIzMyOyt1OCYjMzI7ZW5j
X2ttW0VOQ19LTV9MRU5dOw0KJmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPjwhLS10
eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRp
YWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5
IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMg
b2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5
c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8g
YW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_1213232259.1460612620
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAg
fCAgICA3ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGNpLmggICAgICAgICB8
ICAxNDMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGxEUEhkY3BDTUQuaCB8
ICAgMzYgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL2NhL3RsY0RwSGRjcC5jICAgfCAg
NjM4ICsrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9jYS90bGNEcEhk
Y3AuaCAgIHwgIDMwNSArKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
LmMgICAgICAgICB8ICAxNTkgKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cC5oICAgICAgICAgfCAgIDE3ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBf
aGRjcC5oICAgIHwgIDE1NCArKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
X2hkY3AxeC5jICB8ICA2NDYgKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcF9oZGNwMXguaCAgfCAgIDU1ICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwX2hkY3AyLmMgICB8IDEwMDgNCj4gKysrKysrKysrKysrKysrKysrKysrDQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3AyLmggICB8ICAgNzUgKysNCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmggICAgIHwgICAgNiArLQ0KPiAgMTMg
ZmlsZXMgY2hhbmdlZCwgMzIzMyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGNpLmgNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvY2EvdGxEUEhkY3BDTUQu
aA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9jYS90bGNE
cEhkY3AuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9j
YS90bGNEcEhkY3AuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBfaGRjcC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcF9oZGNwMXguYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBfaGRjcDF4LmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3AyLmMNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX2hkY3AyLmgNCj4gDQoNCltzbmlw
XQ0KDQo+ICsNCj4gK3N0cnVjdCBjcnlwdG9rZXlzX3Qgew0KPiArCXU4IHR5cGU7DQo+ICsJdTMy
IGxlbjsNCj4gKwl1MzIga2V5Ow0KPiArfTsNCg0KVXNlbGVzcywgc28gcmVtb3ZlIGl0Lg0KDQo+
ICsNCj4gK3N0cnVjdCBjbWRfaGRjcF9pbml0X2Zvcl92ZXJpb25fdCB7DQo+ICsJdTMyIHZlcnNp
b247DQo+ICsJYm9vbCBuZWVkX2xvYWRfa2V5Ow0KPiArfTsNCj4gKw0KPiArc3RydWN0IGNtZF9o
ZGNwX3dyaXRlX3ZhbF90IHsNCj4gKwl1OCB0eXBlOw0KPiArCXU4IGxlbjsNCj4gKwl1MzIgdmFs
Ow0KPiArfTsNCj4gKw0KPiArc3RydWN0IGNtZF9oZGNwX2NhbGN1bGF0ZV9sbV90IHsNCj4gKwl1
OCBia3N2W0JLU1ZfTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRfaGRjcF9nZXRfYWtz
dl90IHsNCj4gKwl1OCBha3N2W0FLU1ZfTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRf
aGRjcF9zaGExX3Qgew0KPiArCXUzMiBtZXNzYWdlX2xlbjsNCj4gKwl1MzIgbWVzc2FnZV9hZGRy
Ow0KPiArfTsNCg0KVXNlbGVzcywgc28gcmVtb3ZlIGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAr
DQo+ICtzdHJ1Y3QgY21kX2hkY3BfYWtlX2NlcnRpZmljYXRlX3Qgew0KPiArCXU4IGNlcnRpZmlj
YXRpb25bQ0VSVF9MRU5dOw0KPiArCWJvb2wgc3RvcmVkOw0KPiArCXU4IG1bTV9MRU5dOw0KPiAr
CXU4IGVrbVtFS01fTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRfaGRjcF9ha2VfcGFy
aW5nX3Qgew0KPiArCXU4IGVrbVtFS01fTEVOXTsNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBjbWRf
aGRjcF9lbmNfa21fdCB7DQo+ICsJdTggZW5jX2ttW0VOQ19LTV9MRU5dOw0KPiArfTsNCj4gKw0K

--__=_Part_Boundary_002_1213232259.1460612620--

