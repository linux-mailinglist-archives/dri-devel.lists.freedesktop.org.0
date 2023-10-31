Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91237DC6A7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 07:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C6E10E317;
	Tue, 31 Oct 2023 06:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B2C10E317
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 06:39:51 +0000 (UTC)
X-UUID: 4988b26a77b811ee8051498923ad61e6-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=OzY4Ot6VBehMwsVkyHHxQZkQIiSNj+ktIURalEfh3OY=; 
 b=Q/cAW+fTFZXFdztYnLHBhK7TMuYaPKrmIuedWUOPqwYIXOnbdJi+/c08Ey1DrygfmIs24u5IK5f839SLk90YG5j9smn9v9gF3QJUrOERV5IdoQb60n5NCdE61Zrd+JJvRsfMIzh/xf9zsDKlSLPWfnLEZlQYqrczPbqTv1G6VnU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:04172dfa-9717-44fe-ac70-60b7517638b5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:b013d594-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4988b26a77b811ee8051498923ad61e6-20231031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 853327590; Tue, 31 Oct 2023 14:39:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Oct 2023 14:39:47 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Oct 2023 14:39:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyD06lqe6dL+X56wHwIV8VQT6Ogby1/1WybKl/sPL5o4s/PrraBD4lMt1dQhXH+SbY+Q28JtQ1xOVNRJ5q+vvTEIkwsGJ51srlaYQBeyQvIQjJ0yry80Jk6Zjt8VQeWJvLRMsa8kXV/9uTj+PRoTxgi/vyq6KeBxVUAhFqKEncuNYC0DJKvD9OgW8csxdcK8THaEiF2kSuonv/7tNxpZ+ttoVVNCWs4KsPXqHRrvwQ5R5aJz6mmYBU1aubhScvx8oBBEbOPybEJ0iVsZ+sYqciAlQOO6E6Onff3hQedT9GQjp8lgAIgwBzZnlNOpHH5szIWFDFtMY3TMruTqqEngyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzY4Ot6VBehMwsVkyHHxQZkQIiSNj+ktIURalEfh3OY=;
 b=n3KqrN1ZapYU4p2l/6zMrTVeSNw3PBXU3TyymoCpWcIowyYsSyKwmPI/WZyZUOJp/rgfp/vBJW3fg7mnh4RXtKIurcnCyOiv01SCcQMta64TfCC0dpq1VtVDfNZr2Gu1HXvJ3P8Bvv2JN7RmGoThovnUJoh/vl+njWEg2UU01hByPZdMh6OPCd0dUGKkgfIC22e2wxP9WbR0ZnUgr0qhFbBZ6KGi88VAdePiTPzXjZWgXkiKRSPHiCRpMEiYShTsw5e8q/T2vdZ30P0ZhnWVqCZIVAXstGrNTCldGCgmZ7vgcE9RQ9ILB9nyERmtEmi1s8En7iEvft1Hz/uBOInVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzY4Ot6VBehMwsVkyHHxQZkQIiSNj+ktIURalEfh3OY=;
 b=Z0HquEhjFCc2LrQyDFbGmQ6bAX3VGBJ5kdI6WARUttVTiUlTJBfDLCBfsq2hwA+8/q1WerTJzw4ctsH3kI8INvD3JXHuzBjtXk9djC+8Ki/HlXmLy6H62z4TaKOZYxum1d2WYWxdHA0bvxYgA2Wootjyt4bn24cykMlGcKBYGZA=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by TYZPR03MB7530.apcprd03.prod.outlook.com (2603:1096:400:3ca::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Tue, 31 Oct
 2023 06:39:45 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 06:39:45 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v8 03/16] dt-bindings: media: mediatek: mdp3: add config
 for MT8195 RDMA
Thread-Topic: [PATCH v8 03/16] dt-bindings: media: mediatek: mdp3: add config
 for MT8195 RDMA
Thread-Index: AQHaCxfo2/fexgs3L02jEvfux30iwLBit8aAgAC8GwA=
Date: Tue, 31 Oct 2023 06:39:45 +0000
Message-ID: <d4e0f110923aaff5b61fbb331446d31d82bacdaf.camel@mediatek.com>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-4-moudy.ho@mediatek.com>
 <20231030192629.GA1979065-robh@kernel.org>
In-Reply-To: <20231030192629.GA1979065-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|TYZPR03MB7530:EE_
x-ms-office365-filtering-correlation-id: 9b9bc44f-da1b-43bb-c57a-08dbd9dc2c04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XfN7wThmLzwXv2sSLrcuFmEV8D8Xg90BT8CAEb3sCg29MTWOTCMvHtqgfERGiRvIUl2Z2hftAcH+bmVH+G6SfvtkxKZF+Z5mHd41no6xgU3jdbZieFiT6G+X2qPtO3RyerSFow5BWacUvg7KwCp4DkqRgx+jaze8EkJXQNYEKexBSJoxiwPfavCkhG+NOkd3cFeObXo7KVGgWgcT3AtVYoIfLO0k+0KmygO8y9OVgzgPF0HXz4epEneSGBQvmseNB9gs4j+UGrgZEtABfnIcy3dnwJ4PVHqq+/jJUKBBt7v4mP/zrBUHEX50yAYmODM7apnQKleBjKDI9aRJURt10L6lSq46ZtgHsAjMBLQWEZmnuNpfsg0/d/XBG49qrAEd8YSnvXT0HtnLKW4S/M+BIoQPDLXHpmYx/xnb1R2NVNqEuB84aja38r715WLiJl6G9drOsM8q5FavGDPYqCn0YDRcG1A+BG+pAYjp8K3pGxJtSdz68WcY7UvEgl1abdhQnt4xWw4xdKek0CGl+mVpdsgelLFWKFXq67t7HqSKU7kKpJP68ADEdEIda1onRBg1gX7AD3A2wDdPP8vYQLXxNuBI+3WvsYybP8pg7YUoV5UdiDtaurZz0eLyy1GLobLO0TfAUaM6WygHas6OfNBjgpRZMH4585yy6HNWOlzgxQMFup5WDnAiwwnEI0r+zkm3jBKIUjGUDXWDlNv0y/+vYmF9LwwJNLEZXZBnAckcyTI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(39860400002)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(71200400001)(2616005)(85182001)(26005)(6512007)(38100700002)(8936002)(8676002)(5660300002)(4326008)(7416002)(36756003)(54906003)(66556008)(76116006)(38070700009)(66946007)(66476007)(6506007)(66446008)(41300700001)(2906002)(64756008)(316002)(6916009)(122000001)(6486002)(4001150100001)(86362001)(478600001)(83380400001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3ZzRzZ4b2tnbmRkL0JOcEZuYm9xOW1SQkcwdUVTNmN6SkFxZXNVOUFTWjNV?=
 =?utf-8?B?KzJxUXRpMnRWMEhFZ2U4V1JWOVlOZ1NGK0d3b0lHNjRuK0krOW85elRrWlYw?=
 =?utf-8?B?RGZNQTlTTkh6OXVRdFZTdzl0eUFVcDJEYXhIb3BrUVNaOVpTZFJsTnFoMHp3?=
 =?utf-8?B?a3dmOGZZK2JRbGhyZVBISE16NGhxQmE5NExtVGJLRXBjanlqZWlvVC9weHlO?=
 =?utf-8?B?dUhCTjZCYk81L3AwUGlKeVRTZXZ2alREeFZXQ295N1h2dlg5LzMzZlZacDhi?=
 =?utf-8?B?TzdraTNYT2Fva2k4Nm9WMFpWMGJiRTJFTHdoRm1XVUpvMSsvNEFkaFlmMHlV?=
 =?utf-8?B?RkRIR1BHSlNHVWVBZE9kcjRFa2lCWUhzOExlQ3JaQnZwSFhLYkxxQnBSU1hU?=
 =?utf-8?B?MFcwUHplZkNoMTRQV01wL2hqRnlVZXZlbzA2bU5FeE5ubWZnRUdheVdoelVC?=
 =?utf-8?B?b3pWREtMQ0VPUC9xbUxSUW82OEVCQ2NUdFNKYjhuem5EZHZxOWhtdnQ1RjFS?=
 =?utf-8?B?dkVUL2xqQ0s2RGpJRGZiVFN2L1FqaVFicVY5eWVzQ0VjSEF2L0M0a0szSmZF?=
 =?utf-8?B?OWFsa2NuUGo2anRrSmhNamYyRWc0aTY5Vk5FeTBtVUZtdG5PMXdLbjg5bUpF?=
 =?utf-8?B?YnU5bEdmS0JwYkJXaUtLZjVveThhNU41ZzRQZGFOODUybWl2SnpjZUExeWJ0?=
 =?utf-8?B?NVVKNmN6RUdnOXBVTXF1VCtuQzZEU0dPVC92UHFxZ0w1dVl0akozUDNUZ1NZ?=
 =?utf-8?B?VGtpbEJYSEpXRyt6Y3hjWjNzL3VFT08xS1MvWVIzNm56SlFqN0hqdHN5VExY?=
 =?utf-8?B?cVhqejI2UTZ3VTRqTmMxeEE0Y0pWUDRLNFE3REc3cmJYQUl3QzBxS0hJSHFC?=
 =?utf-8?B?WXpoTzVEVURXODFJcDZuVmRUWS9VZDhRamdIMU9yRzcvUHBBdlgySFR0Yzdm?=
 =?utf-8?B?ZmRXN0VEcmZ2d2RGL0Y5TmtLb0xCQlRZSUNwanJ6MnNsQ3hoTmdRd0FGM2VR?=
 =?utf-8?B?VlRtZkY3NjRpb1ppbDEyM013THRwU3Z5bWpnTTZDdGpyZTFGMERlTUpFQXQv?=
 =?utf-8?B?YVdNV08vU25WTFdrUjBPb0NKdldYdDJPYTlYbmhDdXdvSEV0TVlLS1JuTDU0?=
 =?utf-8?B?NkJuRS9QSmlBVEF2OGJ1dERYVFh5cWhyTW1nRUpBY2M0RGdtcy9oSDRLUVZJ?=
 =?utf-8?B?ZWMvMWE2SnZQMGZpSzc4VGFVZXAwOUV4QjQzUkRnbndQRzl1UTlGL0tYTHNx?=
 =?utf-8?B?a1lqVkVpK2lGMkhxT09tUmpOSE9WRzNZWlRFWnE1UGZmb0Jmc1Q4UUVxaGRV?=
 =?utf-8?B?SjZQNEpQL0pIM2JESGVCbG4wMUNBYm9VTmowOTkvTHRRbk4yTWV1QXR0VXJK?=
 =?utf-8?B?WGordnVzWHhXYlI4OVYySDhVYWxIMTIzVFBQeGVxQytlUysyZElMeXRaWjFP?=
 =?utf-8?B?T2lKV0djeFFsT1RtVldEc1E5NjR5ZW5kcGtoTmJLNUNvTXNmQ1VPMDRRL1Zn?=
 =?utf-8?B?UTF5bnVVT2V6a2RFUC84QzFYNm9ZV1FuUVJDTW5nUGRMb0VROFUySjdkY0hT?=
 =?utf-8?B?Q1dwS3BJYXRSQ1VBS0svMERsRVVvTEJscTh4VUJnT3NFeG01d0dpYVRrY2s1?=
 =?utf-8?B?YTNybVpDd0ZPemZRS2lkK20yT3MrMjJZaTZESkplajJTbEsxUU5kUjVUYkVo?=
 =?utf-8?B?V2dCeWhUVmU3NjZhRXdodUhtMGt5aEI1ck9vdEJJTW5hU1c4VVo2NDJ0WEtQ?=
 =?utf-8?B?UkRvNDJIWk94OWxZZ3NKTFQ5NjA0TjlGUzRqVWp6OHYrRUpQKzBVNnozQnA5?=
 =?utf-8?B?VHp1MFdVcmdkMDhSdE5ZeXhqR0hvQ2l5aGFRMTIrM1pIL3ZZUmVyaGFsZnNX?=
 =?utf-8?B?R0lBNy8vQi9NMW05eFBRQk80YkpEOG9jbzFZL240U1pHL2RHUWJ0Z2tVc1Zp?=
 =?utf-8?B?T216K01WMUFzL3JtbUduL3IvNGJVdUlBL3k2ZG53VkVDVkhiYXREc2o3Q2JD?=
 =?utf-8?B?OTNjWHJLOVkwWGZQYktWTkkxemtYa0laWWxRVFdvU0pYc2k3b0RFQjNYQkxk?=
 =?utf-8?B?MFhRZ0p3djhjWGN4SGp0WENkQUhIdE83eHdyU3VEUXVDLzNmT3BMTmw3OVl3?=
 =?utf-8?B?dVNtL3FiQk1vRFpPcmYxQ1h1V0dXdVJVSDhGTHU2elJ0RTBYRTh0b0UzeXVT?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C180662DEF4261419A08F71A9B8FB2B5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9bc44f-da1b-43bb-c57a-08dbd9dc2c04
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 06:39:45.7595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3XosPN+fTjzk3PLRsi7EwjZN7KIVqDNbp9Bje54XssBYrDv27EV+OjgQq6oMp7PMK+8NX2nouOXyKKgCH7+grg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7530
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEwLTMwIGF0IDE0OjI2IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
IAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICBPbiBNb24sIE9jdCAzMCwgMjAyMyBhdCAwNjowMDowOVBNICswODAwLCBN
b3VkeSBIbyB3cm90ZToNCj4gPiBBZGRlZCB0aGUgY29uZmlndXJhdGlvbiBmb3IgTVQ4MTk1IFJE
TUEuIEluIGNvbXBhcmlzb24gdG8gTVQ4MTgzLA0KPiBpdA0KPiA+IG5vIGxvbmdlciBzaGFyZXMg
U1JBTSB3aXRoIFJTWiwgYW5kIHRoZXJlIGFyZSBub3cgcHJlY29uZmlndXJlZCA1DQo+IG1ib3gu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9i
aW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJkbWEueWFtbCAgICB8IDI2DQo+ICsrKysrKysr
KysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtDQo+IHJkbWEueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLQ0KPiByZG1hLnlhbWwN
Cj4gPiBpbmRleCBjMDQzMjA0Y2YyMTAuLjUwNDMzNGE3NmZiMyAxMDA2NDQNCj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4g
cmRtYS55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLG1kcDMtDQo+IHJkbWEueWFtbA0KPiA+IEBAIC0yMiw2ICsyMiw3IEBAIHBy
b3BlcnRpZXM6DQo+ID4gICAgY29tcGF0aWJsZToNCj4gPiAgICAgIGVudW06DQo+ID4gICAgICAg
IC0gbWVkaWF0ZWssbXQ4MTgzLW1kcDMtcmRtYQ0KPiA+ICsgICAgICAtIG1lZGlhdGVrLG10ODE5
NS1tZHAzLXJkbWENCj4gPiAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hDQo+ID4g
IA0KPiA+ICAgIHJlZzoNCj4gPiBAQCAtNTgsNyArNTksNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAN
Cj4gPiAgICBtYm94ZXM6DQo+ID4gICAgICBtaW5JdGVtczogMQ0KPiA+IC0gICAgbWF4SXRlbXM6
IDINCj4gPiArICAgIG1heEl0ZW1zOiA1DQo+ID4gIA0KPiA+ICAgIGludGVycnVwdHM6DQo+ID4g
ICAgICBtYXhJdGVtczogMQ0KPiA+IEBAIC05OCw2ICs5OSwyOSBAQCBhbGxPZjoNCj4gPiAgICAg
ICAgICAtIG1ib3hlcw0KPiA+ICAgICAgICAgIC0gbWVkaWF0ZWssZ2NlLWV2ZW50cw0KPiA+ICAN
Cj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBh
dGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAgY29uc3Q6
IG1lZGlhdGVrLG10ODE5NS1tZHAzLXJkbWENCj4gPiArDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsg
ICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4gPiArICAgICAgICAgIGl0
ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBSRE1BIGNsb2NrDQo+ID4gKw0K
PiA+ICsgICAgICAgIG1ib3hlczoNCj4gPiArICAgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOiB1c2VkIGZvciAxc3QgZGF0YSBwaXBlIGZyb20gUkRNQQ0KPiA+
ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiB1c2VkIGZvciAybmQgZGF0YSBwaXBlIGZyb20g
UkRNQQ0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiB1c2VkIGZvciAzcmQgZGF0YSBw
aXBlIGZyb20gUkRNQQ0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiB1c2VkIGZvciA0
dGggZGF0YSBwaXBlIGZyb20gUkRNQQ0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiB1
c2VkIGZvciB0aGUgZGF0YSBwaXBlIGZyb20gU1BMSVQNCj4gDQo+IEZvbGxvd2luZyB0aGUgcHJp
b3IgY29tbWVudHMsIGFkZCB0aGVzZSBlbnRyaWVzIHRvIHRoZSB0b3AtbGV2ZWwgDQo+ICdtYm94
ZXMnIGFuZCB0aGVuIGhlcmUganVzdCBwdXQgJ21pbkl0ZW1zOiA1Jy4NCj4gDQo+IFJvYg0KDQpI
aSBSb2IsDQoNClRoYW5rcyBmb3IgYXNzaXN0aW5nIHdpdGggdGhlIHJldmlldyBhbmQgc3VnZ2Vz
dGluZyBhbiBpbXByb3ZlZCBtZXRob2QNCmluIHBhdGNoIFsyLzE2XSBhbmQgaGVyZSBmb3IgYm91
bmRpbmcgcmVsYXRlZCBpdGVtIHF1YW50aXRlcy4NCg0KSSBoYXZlIGEgcXVlc3Rpb24gcmVnYXJk
aW5nIHRoZSBjdXJyZW50IGl0ZW0gZGVzY3JpcHRpb24uIEl0IHNlZW1zIHRvDQppbXBseSBhIHNw
ZWNpZmljIG9yZGVyLiBJZiB0aGUgb3JkZXIgb2YgdGhlIGRlc2NyaXB0aW9uIGlzIGRpZmZlcmVu
dA0KZm9yIGFueSByZWFzb24sIHNob3VsZCBpdCBiZSBmdWxseSByZS1saXN0ZWQgdW5kZXIgJ2Fs
bE9mJz8NCg0KU2luY2VyZWx5LA0KTW91ZHkNCg==
