Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85516EA17E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 04:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B9F10E231;
	Fri, 21 Apr 2023 02:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE1110E231
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 02:11:52 +0000 (UTC)
X-UUID: dd71541cdfe911eda9a90f0bb45854f4-20230421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4tu9waD9fvBE4dZACaCsXAYNuxEizyQbGdexkl3fbbk=; 
 b=Pn0SY346ut62GrWLjah84kGdD3U7uDKvf/MHATQNxAtDmh5O3O2prATESMc1MaQqFXCsYs+mVdOMMIoVV5wprQXsB1HevIBDwrqUwG5P5n/HU1AmcP3Xo+rgeHCwphFECOrCO2spBBZoITf1/L/at8QmEK5Nq4Wplt9KZw3qJz4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:515e455d-7bc0-44c5-bdb1-e04bc686f7c4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:af5ac384-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: dd71541cdfe911eda9a90f0bb45854f4-20230421
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1576720128; Fri, 21 Apr 2023 10:11:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 21 Apr 2023 10:11:44 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.25 via Frontend Transport; Fri, 21 Apr 2023 10:11:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYQjMxH/7iqUpyIWL72erlhw8pS5cZXuFgPFmYKeFH59MZcRGwL4LhfjGQgm4TwuKqZdCXV7MESARQJWVRWlHBkAfvA11U5c0RxWyuyCuXieEWL6ZposXKVlq1HACapBC2EveveumZF6scVfXoafdSLpjXuyeHgkKS3v3JsTohaZX9OLeklv6118Bu1VEoF4jxXlsXfhRBY7BhB2ct05ypu1x3e/gg8A7Iw3bCO/dbDbpJbXveEO7+3VUHYfXWr8hDFBki0IPY4KRTWjHCjCqnOorXWUy9GOsAqNM6LGlB4mf1iQRfR+bdG1rDANjrFYazCRGrq1f+F6bCL1n4SN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ25hARgc/C4N6ExNNaTX6XcVVpyDPa6bV+P8zLj9zA=;
 b=Cq9LocQqGatnWVjaigQ9wx7OE3u212DdlIG86cJhOcAstZt1wB4tXNFp8bhg3KlzR7O3DIZM/ndEi9gecy9XiSksoXhG89kvhIm2JcweTdMd8MZEbOqKuejj+QiKN+hfSdehjbpB9yjDaid4cJA7k6QIPv0t5PJrdit1BWNxwPm4JCie1ZS58k0T+fBFP3ccR9sxRfujtf4MzbB0TGIIkWrSV3kGep9fQlK4bA3t/hO1jAxyqBM9ktdMNiKyIwbDN6CmmYR2z8bgsHFTH4/9txoQ5jM4zSs6kGX3p+MjyiSruGtHiy3vMvzZPrTRrLUvjPTKNq65S/3tGlvf706zcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ25hARgc/C4N6ExNNaTX6XcVVpyDPa6bV+P8zLj9zA=;
 b=Cr5+93cyCb/cAPxIhkno0HrXnpKveWurOj15qIbgrlHCYrsKNqzSt2pkFcCMA8W73GliwhLhac7gLNH0xsv9ny4yApBId6SYkWfplot03ep5IUjX6NFJO3DxvrcjiTMOKyzSIhDwjmDj/682wEE7jUjqzGyAxom+UOs+mVVoPdE=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by KL1PR03MB6031.apcprd03.prod.outlook.com (2603:1096:820:85::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 02:11:41 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::a9f2:b477:6a2d:b8aa]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::a9f2:b477:6a2d:b8aa%4]) with mapi id 15.20.6298.045; Fri, 21 Apr 2023
 02:11:41 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH] drm/mediatek: fix uninitialized symbol
Thread-Topic: [PATCH] drm/mediatek: fix uninitialized symbol
Thread-Index: AQHZc3YgfsA23QK3cUqJHFZ/dfAphK80GOCAgADtaoA=
Date: Fri, 21 Apr 2023 02:11:40 +0000
Message-ID: <842fefa133982cf20ec44c324141a4bcfadea255.camel@mediatek.com>
References: <20230420105115.26838-1-nancy.lin@mediatek.com>
 <e1619d7a-2ac3-55bf-bcf1-cad3f07d20fe@collabora.com>
In-Reply-To: <e1619d7a-2ac3-55bf-bcf1-cad3f07d20fe@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|KL1PR03MB6031:EE_
x-ms-office365-filtering-correlation-id: d9e79b0f-2b73-42ef-518b-08db420dbef9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7zrd82zyRKXz5fPrWt/CqtpSXDjTVx2/bDHAlL0drm5EEatDLBjyEeBjC4/e6PDCSM4m53aXl0DP7BBRb8OeXaWNwclBkIO2gqDhydy46Qdhk93Y0kkLTbungcS4V7iEDUI71BRh9wCoILyIuUvSBi9Bv/pgJ6yCokFPD6rYtz+it7qsvyVgtK0aYow9GChaVj9HVJHtIiHcoA6tJjLa395BxWQJUAbb9E1lijZ0TI0K94bXHrdv8lLtg5TzN34j/sB7v+simarn9UBPvfcV0E+kqFceRzldY8pCD0aFPiOyzShDEjGTdlcTLC/UxLU19hfkfY8TW6tVj5ZXAOQ6GZJ6tqoCgANK2a/JBf5EE5lGg8m1OQi+V/gUsaGNKnGwl4hcTvroOhnG8dnsMbJO5bST6WyN7i08kbiClxY6UmNJP435LGFuftHRW5d7+0HPd0ayiULc0kQhLaVBFZFkO07vLTpBpLDh6G0e3sI/h3u660Kpz3ux5bb23O/61zA6/WqtI4k81yI9qIGdhZwxB2B8RG1GT2oPFtKvVkFlQ9ktYjFlWwn4dXhlukK4dBOGdteOvnFoEgXhGL2350y/+BDBREq9dRz/5Ry428cGh+/YKZ92wVjN0viHDPUuob45
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5175.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199021)(4326008)(38100700002)(8936002)(8676002)(41300700001)(76116006)(91956017)(122000001)(66556008)(64756008)(316002)(66476007)(38070700005)(66446008)(66946007)(2906002)(4744005)(5660300002)(7416002)(186003)(6512007)(6506007)(26005)(85182001)(83380400001)(36756003)(2616005)(110136005)(54906003)(86362001)(6486002)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkNDdld5UzhuaWxaMEp0VWYzSWd5ay9EMjB4VFM2Vy9YSlROSnAwWG4yQTdx?=
 =?utf-8?B?RnlZU2tOY05Kd21JVFNYN25yb29kejZJajdyamd0YXVjeVNuNVdSQU5mR3l6?=
 =?utf-8?B?TWdaaWRHdnN1ZGVOMVNYVUVjOE9JYmltZ1lpWFR0TE1pVWpkZkxhckROQTE4?=
 =?utf-8?B?Ujk1SEJqNUY0UFNzSGx6eDhvdG5zbDhiQmdUeDIxYy9tcWRDWmloMVNuWkRF?=
 =?utf-8?B?TVk1cGFQeFM1cFFDZ3VURWpPS0VrRjM1cHlJc3dqVE9VNVVSVUQ3OHlsOCtE?=
 =?utf-8?B?R0M2dWpsRHc4YWVuOFRUcEdpK0xCaThmVGVpZ0pZdWtHdDZwUENNWnFSOExG?=
 =?utf-8?B?MHZsbTFDVkxOdWloaGc3empINUVoMEpTRWltc0o1eUpJYUVoZk1sSVZlNTh0?=
 =?utf-8?B?ZzYweVA2QlJjczNkNDVHeW91RHErbU9kcUlKVFlrelNhQVZXYUpyRTUzZzho?=
 =?utf-8?B?UDVDaDNkWklXcWwzbXBjL0wxVm9ZY0h0dXRCZHJZUk5NdXZnL0UyMG0yd1dw?=
 =?utf-8?B?bEFIa3g3bTFvVHFpZkg0Y2NBWVVJZjVOV2FybkZwVFRjSERkcEk1MG5yd0Jp?=
 =?utf-8?B?NHdIZURvMVlvbHdYWlBhMDNLS3ZnSVloMFhUa1lyNVdsZHp0T0tWNS9hZ3cy?=
 =?utf-8?B?UzVaanRKczhaLzNxMjV2NFo5M2IwWDdtVzFHZ2VnMGdwVUgvMDRtekg5WCtD?=
 =?utf-8?B?UjBwVXVRZk1XV0prSHJQZ1VwaFkrUGNzZWU0clBudVlwOTkwM1BoYmtsd254?=
 =?utf-8?B?Y29BZkE0cUZsZjRiTWc1TUllc0dGUUtxK3hldUZYbTY4UE1VNlVlck04MUN1?=
 =?utf-8?B?d1AxdkdLSUdBNG5od1ZweTRUdTN0eEZRWnFvcTZiZTZmaDFpWWNYa09lbEFI?=
 =?utf-8?B?RXEyU3Q3eUhrZ0pmS2FWcjlKZWFUUFJQZFdiQ1U3SU84U1JPellwWDFZbDNw?=
 =?utf-8?B?NjBpY1phRXF4c3hDSXVtZGQzeDRibnZlVDBQUnM5Y1RvL0VManhQb3VIay9R?=
 =?utf-8?B?dWVOVHRZNnRJc2dXdWk2YkhYRm9pN2tONHpaSjhySlJaTnBBaTJFc1c2c01q?=
 =?utf-8?B?OGc2M0ZpLzFsVmpkZTFOQVYvYVFtN0RNS2dkOEVpVER2V2VwL3o5UmJPY0J3?=
 =?utf-8?B?Q2V1M2dFRHdaeEV0SUJtUDdRYjcvZ0FTK0tUUFAzYjJBZXpLUXc2cG12K1dG?=
 =?utf-8?B?Y0YvdDNNZVB3cEhFY0R4VE55RzlvcTI2bmtxRWhMRlRIc2dwVkU1TWtVaDgr?=
 =?utf-8?B?T1MzY2hydUp5WnFERlVqN216dGFnanZNVDlqMjFobGJ3YlZiWkNMS0V4SHg0?=
 =?utf-8?B?blAyUzdJVFIxNnhxejFGdjNDbTVQVUE0MGNXNTlES0YyUEhXdnpYVmdyR3VW?=
 =?utf-8?B?djdQQmRpOE9qMjFvcW9Wb3I4YUNVK3l2L2FGbEtpU1pFYXRaQ0NFYVNJeDho?=
 =?utf-8?B?Q1o0b0lpMnNER0EyanVNZU1oeXFtNXdVTXpHcGIyeTRlcU1RaXVZRmRuTUho?=
 =?utf-8?B?NFAwMkh3ZG9hZVhrR0NEdzlqdkk4ZHVvYUZnd0lCTm5qZGhlYjdlTTY2cVZa?=
 =?utf-8?B?Y2xUV3k5UXM3Wm5VelVvUGR3UW1YR2R2cHFhNTZ0L2hJeE9KK3pHQ1gyUGRV?=
 =?utf-8?B?WHNuam1ubnpIeit1WEZ6aml0bFU4VFh1TzdvWC9tUjd1UEtEVUNzZEthaTlP?=
 =?utf-8?B?THNBOG1WMXU5MStuSDFKTHpobWVpRE5LTmM3bUUzK3BGOEVWN0kxSm5EQ0hJ?=
 =?utf-8?B?U0Q4YUxscUhtNFNUb2NKYVF2emt1NTlTRnA0ZVdLRFY0RUV1dFl3VGx3T3dF?=
 =?utf-8?B?Z212TkFrWms4Ti9SWjk2YndraEhpTDQxK0R1bGtHajRwMmQxNHg2SWJyT2gv?=
 =?utf-8?B?bTdVc3JkOStlalg1c2pjMnZRaTlZSnBBSjJOeUw2ZU9va0hvLzU1czgzTDdw?=
 =?utf-8?B?N1VyNlExZTNlMVNwbTcvU2ZNcUFNanVNajNUeTZoTHUzMXVuTjR0UVBHTjN3?=
 =?utf-8?B?Sm9PcE5jN0dpeVk4TFAxbGI5YUIyZHp0V285UUMzYVp5c05sRlExNUgvcW94?=
 =?utf-8?B?VDQ2bVB4Y040RklqWE9XdHJCeml0bnpRQVNEbHMzY292NklKQ0FPKzFUU2I3?=
 =?utf-8?B?emhyWGxBVjRZUTZPVXNqSUR0c0FFaURIcUdJcUJIeGtzdG5YVFBqWjQ3dFlq?=
 =?utf-8?B?clE9PQ==?=
Content-ID: <89A963CA534B694384ACD7E77A49A205@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e79b0f-2b73-42ef-518b-08db420dbef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 02:11:40.8616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKaHkjijbmMGGZsc8Mh/qbnvvMy/8Jkcd1+nRsYa2zA6KC59dFmxQRhq3V5dIhiHcUJ+9HO8rph92eNeTrZgXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6031
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1391819.1966014937"
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
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1391819.1966014937
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtUaHUsJiMzMjsyMDIzLTA0LTIwJiMzMjth
dCYjMzI7MTQ6MDEmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1Bs
ZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYj
MzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zlcmlm
aWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbCYjMzI7MjAvMDQvMjMmIzMyOzEyOjUxLCYjMzI7
TmFuY3kuTGluJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyO2ZpeCYjMzI7
U21hdGNoJiMzMjtzdGF0aWMmIzMyO2NoZWNrZXImIzMyO3dhcm5pbmcNCiZndDsmIzMyOyZndDsm
IzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO3VuaW5pdGlhbGl6ZWQmIzMyO3N5bWJvbCYjMzI7Y29t
cF9wZGV2JiMzMjtpbiYjMzI7bXRrX2RkcF9jb21wX2luaXQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtOYW5jeS5MaW4mIzMyOyZsdDtu
YW5jeS5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJJiMzMjthZ3Jl
ZSYjMzI7d2l0aCYjMzI7dGhpcyYjMzI7Y29tbWl0LCYjMzI7YnV0JiMzMjtwbGVhc2UmIzMyO2Fk
ZCYjMzI7YSYjMzI7Rml4ZXMmIzMyO3RhZy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhhbmtzLA0K
Jmd0OyYjMzI7QW5nZWxvDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmlldy4mIzMy
O0kmIzMyO3dpbGwmIzMyO3Jlc2VuZCYjMzI7aXQmIzMyO3dpdGgmIzMyO0ZpeGVzJiMzMjt0YWcu
DQoNClJlZ2FyZHMsDQpOYW5jeQ0KDQoNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+
PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0
byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5v
dA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNv
bi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_1391819.1966014937
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBUaHUsIDIwMjMtMDQtMjAgYXQgMTQ6MDEgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IElsIDIwLzA0LzIzIDEy
OjUxLCBOYW5jeS5MaW4gaGEgc2NyaXR0bzoNCj4gPiBmaXggU21hdGNoIHN0YXRpYyBjaGVja2Vy
IHdhcm5pbmcNCj4gPiAgICAtIHVuaW5pdGlhbGl6ZWQgc3ltYm9sIGNvbXBfcGRldiBpbiBtdGtf
ZGRwX2NvbXBfaW5pdC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeS5MaW4gPG5hbmN5
LmxpbkBtZWRpYXRlay5jb20+DQo+IA0KPiBJIGFncmVlIHdpdGggdGhpcyBjb21taXQsIGJ1dCBw
bGVhc2UgYWRkIGEgRml4ZXMgdGFnLg0KPiANCj4gVGhhbmtzLA0KPiBBbmdlbG8NCg0KVGhhbmtz
IGZvciB0aGUgcmV2aWV3LiBJIHdpbGwgcmVzZW5kIGl0IHdpdGggRml4ZXMgdGFnLg0KDQpSZWdh
cmRzLA0KTmFuY3kNCg0KDQo=

--__=_Part_Boundary_003_1391819.1966014937--

