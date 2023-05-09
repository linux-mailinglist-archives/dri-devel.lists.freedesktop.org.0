Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531C6FC947
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A348810E38E;
	Tue,  9 May 2023 14:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB2B10E370
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:41:39 +0000 (UTC)
X-UUID: 991ba550ee7711edb20a276fd37b9834-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=d2jA5nJMb6v9d2dxq+eKoH5engzTAzu02CnNeT03ENQ=; 
 b=pgon/yVt3JXw1KozSUVRn01mPzQflbpdP4amGJ+IC+1wf8PjWDhzbWcppI06qVgNDpe8h5hPLAgQG2/VeX51ktKoVpvWMj8+Q0gQ9cUHkAEUna/lpQ/baNcvwuvMItybQeVlLxuSOQEqcOeorvzXFjZqCwcnk6GDqNbgr9dSxl4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:cb743733-0700-4987-833d-ab3485f49e1f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-INFO: VERSION:1.1.24, REQID:cb743733-0700-4987-833d-ab3485f49e1f, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-5
X-CID-META: VersionHash:178d4d4, CLOUDID:e41d49c0-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:230509223838WCCCSQYY,BulkQuantity:11,Recheck:0,SF:38|17|19|102,TC:ni
 l,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0,OSI:
 0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 991ba550ee7711edb20a276fd37b9834-20230509
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 948166906; Tue, 09 May 2023 22:41:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:41:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:41:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqNAZy0HQGQ8zjhm3FwTjFtfEwx893KLQIN0qZwrystvbxl9BR6O6vHXZQ5MKHGXSeiaIg8Owv5mKYArIf/YQPagpOBXi1oq0Hfgn3GnLk3VZuF+w6sgTXBe9TbrTPtri8RKbf7eHNMRHFpmdjCYpgbq/2rV4teTkQk8wEoTpe6yWJN8k89oewOSNK/ul3MKHWK1PaJyn72KyCMMQnLoIB2QXxSaBHpxFJA7vuQDBU8JUnoCUBZC2Ck/dwt9HksqVeOYxXlq/g54/cBV0+AKFfS0styEQOV1xsc3049k8CtYuVsEWWg6pFa2Ng4636K3S+9IcZHPg0yZaa8DqMA8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEPq6CiKK/prIJt/68ruo+qvhxmG8y2Rd91Yol07+uU=;
 b=U6++1R/YGEMfKP+zqgumMHieBaCsHoRRd1DScQ793+eGzBPrn2NyxrbRpWy/pD2mOV9Tm/Fq0ymy061HIj3y3iFQoWXzXFliMvkMQ1XLCxbsWaamISVV6TmZMZd2eMWVAlnA1FoveKvcDK03N5szt67BgRDJRdG/w06B31pjDiAVRpn1xyniSZfPbkEEY67BdE5SHwAGmzrxRxZth+QTkxo/y4JdjrxFi9jtb+6BqGu7VV4wiTJZE9NdiTjQvKs72EgTosHXBgU6IorWlRDbna6LMSyCkjj7NtW/L1AKZNlEqG+eRbCczBBIGJDpvW1R1tkEMzEUMt8tUY7uPj8UYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEPq6CiKK/prIJt/68ruo+qvhxmG8y2Rd91Yol07+uU=;
 b=eivMzzzaXRoi5VaJI7c3iaeD+qyZvSEx/s/5HQF9U1wjf2a+YGAEI7dHwFEURCxQvvl0LT3jU3HcaRSJlt5g2emqiOG+cyLpyt7JmPg+WOUj5thNYpoLkJanVO75fTUSh/6a5ROqyJRRblv4zCC5iKg0U30XAwdeYd5ECaavxPY=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by TYZPR03MB5995.apcprd03.prod.outlook.com (2603:1096:400:12a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:41:33 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:41:33 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v3 07/11] drm/mediatek: gamma: Support specifying number
 of bits per LUT component
Thread-Topic: [PATCH v3 07/11] drm/mediatek: gamma: Support specifying number
 of bits per LUT component
Thread-Index: AQHZgBeInL5/NOdXpUeQuqtah2od669SCIIA
Date: Tue, 9 May 2023 14:41:32 +0000
Message-ID: <b49e49ebb12b6170c5817cad693226f688f79606.camel@mediatek.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
 <20230506123549.101727-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230506123549.101727-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|TYZPR03MB5995:EE_
x-ms-office365-filtering-correlation-id: e2c7c868-c1d7-4e37-3fdc-08db509b7bc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TWTOdCmb4dNLYTxz6Rsbp7zupwCCOA1MDnwxi5WHKx9YP7yFsc+143GOVVauDAsTeZ5AzHuvpfL7R1RFSZJJkQDkCBZHql5vhAAYDRGiDLgikAOo3kzjIWxRLbkBepkXDe2vRmVHPRF4fxHtQJDzUY+Xf6xP1LfDcIOOIF0DIvDrmbTtNldefwcjG+Ka/l7LSWgSNO1OpwLjJHblxfHoNSjAGDszHE3ynkyRoyho+bVG7ecH0WH8a3lTXtMLlc0u5CBliN0cM08jXmvY1tXjQjWP32Bp68VwYnZcoX51FWNH6mbpGvwybsAHHtx+5IBJnZNio5rgHtHen3MPyM8tRB1M1fMBEXndnHaHfDZyibYfJzsgPJ83Un+L4qzYg3zrWDByTNt5Y+uhhxNSt9hXAL7OP6teyVgikJJLjXd/zeIAtlr9ucKSt2OrQ4dhTdXnQAsXJHauSaDeVcODWsxp6aPL3C9XiiDL552j+9Jxp0BWDtX58nFRiu7XNlMc0w1M0HlRdj+zvm7O+UseaWhA37eSUkjfle0fwxvh3rzBQDA82XLV3iABsdnn+BG7AG1K0gZQai6zEarUjBK7jYJ6Kpq9NO0hsEZAJPiSGV6qIo7ZALx821YqroXlUfNquIqy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR03MB3062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66476007)(4744005)(7416002)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(64756008)(76116006)(91956017)(66556008)(66946007)(83380400001)(85182001)(71200400001)(26005)(186003)(6506007)(6512007)(478600001)(6486002)(2906002)(66446008)(38070700005)(86362001)(38100700002)(36756003)(2616005)(54906003)(110136005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHM2dFZpclB0MFg4ZVdTUyttbklFbHNZUHhucGYrOFVkY05YR2l2ZHJYUEo1?=
 =?utf-8?B?QXErRHN0VDNiVTBnYitjcHUwMXcxMUpMR2twbGhOSU5uYThYQUVGV3FlTjgx?=
 =?utf-8?B?RERZZEQ4ZDQ3NXJrRUtJZXRoRlZIdHdDY0pxNVJYQWM3V2Yrb3JMLzNoNjA1?=
 =?utf-8?B?T1EzdGIxeGluT2szQ2ZPQVdaNVN4SXJHTzJSbTErYy80L3JCNjJQSDY2Tzhn?=
 =?utf-8?B?WktXcmtHbStNbmtKRCs3enpmZ0lta0dueHZpMHA5VWI5YUlpQ0JTRW9ROW41?=
 =?utf-8?B?VEF3d01RcFNMVHBpd2tlUG9zb2tjWWdRK1d1c2RnUHl1dHJmalllMzFEcnM0?=
 =?utf-8?B?WFVkRkdFNEt6S1E3MEJwcFlwY2xaa255SHJKWTZESGNWL3diaTAvTURqbGo5?=
 =?utf-8?B?a3BGRTdwMGJWK0l4My90cGhWd1huZmtmejhxNnZQekNtUUJOWDBTWktQN3NC?=
 =?utf-8?B?RVVXeXNjemNlVnl6SFVSRlpvYmtPV1ErQzF1d3c3N2VCWGMzc1RrRmg5OEJT?=
 =?utf-8?B?eXhWdTVBdzM4TGVLRGpQc2hTcXJxK0NOUjBobmhGM3dBRVlFVzdKZXg3MGJD?=
 =?utf-8?B?bXFXbU9FQXRTVk5kTU1scUFOMjZzMnV1eHJlYnE0ZzNPQnpCMXRQQ3VKSnVt?=
 =?utf-8?B?R2c0WTlmTHl4Vk9kRm8xTkNzeVEwS0hra01qTjVINE9kTkc5Uk9vQ3NFNmps?=
 =?utf-8?B?QUg0cEhOek11VG1JdVNVZmp2Ung3bVl4dHF4NVRkTmVMa0lOT2VZVmtsTXdm?=
 =?utf-8?B?bitKR0htbzU1WWZubmNFVmNoZkE0RFMzUXpZL2gvYlU3cGdCaVNBSmRsdTQx?=
 =?utf-8?B?bGNFWXlMM0VqTGxueFRmb3ZXY0l2MVM4SmF3L0VQcU9Vd25TdDZhL3hZVTNu?=
 =?utf-8?B?WnNxRDVHdTFrall5Q05GSG50QjZQYWFhM3V4K0hYWlNwbUJGZXRTK1RKRE5x?=
 =?utf-8?B?RnkzelVvTnNScTB3cjR4YWNwREhVUGtKUi9HTGtzRWtiVDdVamJOV0tBMVVC?=
 =?utf-8?B?QUNqTU96ZVMyMkN6aGJ0V0pXaW9PRnVaTWNtMktmNkpib1czakRUdXJ6YUJj?=
 =?utf-8?B?Wi9iU3pUTXhTbloxdUltSU1tYkR0OS9lYkxSbUhmRWk0SDBjVE1DNmtKUGtQ?=
 =?utf-8?B?Qng2Z1k1Q29PVThycjNCOGhMQitzLzJ1blNGanpiYTFsaE5id0RpelU3am1Y?=
 =?utf-8?B?d1Rpa1dKbjdITlAyRmtlNDl0WkxObEtmckY1NTNLWGpPS3RobnJEWjVsV1NM?=
 =?utf-8?B?SFFIajd1T0FCMXpPcEZ0S0JHMHE4WURHVVFPWU1JVzJPWDNyZU9xd0dsazdQ?=
 =?utf-8?B?SGxCMnVDMWlWVmVxTXdsaDVDcUVVOFZ5alFDcjB6VFlUOGxMWVM3Z2FraVp2?=
 =?utf-8?B?d0xzcW1UTktqYmhxK0NRZHFRK3NPV05PZm0xTTMvTXYxbFNPSk9HRWw3cWZ4?=
 =?utf-8?B?SjZyUlBpcUdrSnJwUjRKa0FLNjVCL0RHcENKWlFscjB1NFJ1NTlQalJ4RUtu?=
 =?utf-8?B?QVJCanhETFNBOVZBWG8wTFRLdkExMGcrL3lsdFRoNS9XRWlHN2lPTkpGQ0s3?=
 =?utf-8?B?dXdoc2dFZGtyN0w0bGZuT1cvR0dEdFc2aDFBaXB3UFFvTkNJbERiT0ZuZ1h6?=
 =?utf-8?B?UnBvQjNOR1hUcllqeWx5TFpKeStqTVFOb3htVkxIV1VZd3hkYnRyTXI5S2pC?=
 =?utf-8?B?cTg2b1RvNnVOd3JLYUF3cEpjcnpqMXFTSjVCaElWb0lKbGJXWGdYZjVrV1lH?=
 =?utf-8?B?Q3NxbFdSSVh6MkhGemhXV0FHSG8wL0drK3dZNllsdkpwL2lDRDZmOGtOeEpV?=
 =?utf-8?B?YnhWZDd3NTdPZzlSSG4vUXM4eEF1V1FCd1V2a1MxQWRQQTlaNU5ibU1BTjVL?=
 =?utf-8?B?UHMyT3BhOUhjblo2ZW9YK1YyS2U1b3gycHVCSmxmK2g0cGx0R1V3OGkxZXp2?=
 =?utf-8?B?bmtiaUhoN3kzQzVHVmhEMTVpaVVhdE9uYlVnbzM2TDNISkU3ZzAxTzJZR1dj?=
 =?utf-8?B?QmduSlNsdnRvakQ5cmZEL2hjLzBnL0tzT3BKdnVzZEMyK3p2OHNEeXQ5eEhv?=
 =?utf-8?B?VXNvRU16emVkWHhISktCM3ZKMWVHcHZSQ3A5L0ZCQk5UWGpKZXY0bjBXeUU0?=
 =?utf-8?B?OWFraEt0anBKc084UXZyMnM3dGpyQzl6MXp6ZHBrN3RGVHdyR2ZwTzdGNGl6?=
 =?utf-8?B?TWc9PQ==?=
Content-ID: <88C5A6C90CD82D439A5EF059945DDC61@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c7c868-c1d7-4e37-3fdc-08db509b7bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:41:32.9585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFnIKTff8dWflII7AgFAItP1IFeKA57b4lNQDHKHXJG89tuH8gC5UCkErYdvH0ZYne/efD+mvRQmtIqDAfsxtMa2xNUkqWAXo9ZatzgQNwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5995
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_616675601.759575467"
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_616675601.759575467
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA1LTA2JiMzMjth
dCYjMzI7MTQ6MzUmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1Bs
ZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYj
MzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zlcmlm
aWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtOZXcmIzMyO1NvQ3MsJiMzMjtsaWtlJiMzMjtNVDgx
OTUsJiMzMjtub3QmIzMyO29ubHkmIzMyO21heSYjMzI7c3VwcG9ydCYjMzI7YmlnZ2VyJiMzMjts
b29rdXAmIzMyO3RhYmxlcywmIzMyO2J1dA0KJmd0OyYjMzI7aGF2ZSYjMzI7Z290JiMzMjthJiMz
MjtkaWZmZXJlbnQmIzMyO3JlZ2lzdGVyJiMzMjtsYXlvdXQmIzMyO3RvJiMzMjtzdXBwb3J0JiMz
MjtiaWdnZXImIzMyO3ByZWNpc2lvbjoNCiZndDsmIzMyO3N1cHBvcnQmIzMyO3NwZWNpZnlpbmcm
IzMyO3RoZSYjMzI7bnVtYmVyJiMzMjtvZiYjMzI7JiM5NjtsdXRfYml0cyYjOTY7JiMzMjtmb3Im
IzMyO2VhY2gmIzMyO1NvQyYjMzI7YW5kJiMzMjt1c2UmIzMyO2l0DQomZ3Q7JiMzMjtpbiYjMzI7
bXRrX2dhbW1hX3NldF9jb21tb24oKSYjMzI7dG8mIzMyO3BlcmZvcm0mIzMyO3RoZSYjMzI7cmln
aHQmIzMyO2NhbGN1bGF0aW9uLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYj
MzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYjMzI7
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KDQpSZXZpZXdlZC1i
eTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7
DQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17
LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAq
KioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUt
bWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSAN
CmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBk
aXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5
aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50
ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVu
bGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1h
aWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWlu
ZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRv
IG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBl
cnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_616675601.759575467
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBTYXQsIDIwMjMtMDUtMDYgYXQgMTQ6MzUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE5ldyBTb0NzLCBsaWtl
IE1UODE5NSwgbm90IG9ubHkgbWF5IHN1cHBvcnQgYmlnZ2VyIGxvb2t1cCB0YWJsZXMsIGJ1dA0K
PiBoYXZlIGdvdCBhIGRpZmZlcmVudCByZWdpc3RlciBsYXlvdXQgdG8gc3VwcG9ydCBiaWdnZXIg
cHJlY2lzaW9uOg0KPiBzdXBwb3J0IHNwZWNpZnlpbmcgdGhlIG51bWJlciBvZiBgbHV0X2JpdHNg
IGZvciBlYWNoIFNvQyBhbmQgdXNlIGl0DQo+IGluIG10a19nYW1tYV9zZXRfY29tbW9uKCkgdG8g
cGVyZm9ybSB0aGUgcmlnaHQgY2FsY3VsYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1l
ZGlhdGVrLmNvbT4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

--__=_Part_Boundary_001_616675601.759575467--

