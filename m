Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BEB6FC939
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E71810E36A;
	Tue,  9 May 2023 14:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360B510E36A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:39:50 +0000 (UTC)
X-UUID: 5840f364ee7711ed9cb5633481061a41-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Ue42QMV6lulYE66oCVE0CldKLwPdcH/RAWfN7NoCalw=; 
 b=twBEXjteVdaMTp9UhTVlIWg6+Afsqg7Gf4IFqUeE/jV0esVi85jlqjV+Fpt4OBE6YVJR3C5kVh8PVKu/5/s/uGad/rAQ9lSE/s3zLvNrUgkyPmatjAE0g4cnE/QFCtYqlktY8tQktaBl08Yw/Vk/dxvooTsBwrsMFIP6D2B2pZg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:da7bffe8-9202-4633-bd43-c6efbdc6d04f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:178d4d4, CLOUDID:87d1416b-2f20-4998-991c-3b78627e4938,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5840f364ee7711ed9cb5633481061a41-20230509
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 368278738; Tue, 09 May 2023 22:39:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:39:45 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:39:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPhzrSwxzG4+ev/q+2Mwo7o0x1Eri2AWvVREu6hn8df0mZ1T9PeADmalyh0t/mZRATCMy4I65nwwCLG67zBWpaYk3bumsls0u/DT+Al5yXW8o6eSZSLlZXSg4y7OF+6ySqMjTVHwnksbQjRTA/OWGYNUkYOlh7tEcijHVqGtY0q7WuAANJGSsij08NhvpGVFPVEvo4P3GPbS5/E7wl9Hhkz5NSDCX6oknIzdUyk5crXk89YtQ5vnNcj2ostsWvFstky0+1KWRKEX2veRPbrQL5SLfPFpgtbYYsJLdBWZEiFXWvJ1erZti9F2nm5RPFBq5KZugr/mB85dkGXPPiL09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWoun3N8cx+aob+pJ/4J1/wEj8G7HkWA3+emTszcV+A=;
 b=VAKl2syhLBO+R5UhP70E4BY0r3eX2va8J4o3A3GZaU/MvZgXWRofF48jeiNJ0QJ8yvXBoVEYuqpBoc7gAWXlWy7gGQcg7Alb95AhxmXtDT5y9rVG4mI/Kzbnjr0ZEJuxOBhmG9QvRcr8wGCKkM9rXvLDlwhM44FY5oKQTvBBIDr9Ql6gGQ7aKKGOAz89J7v7mxYs1C73IRm386qL7IsHt4QFrdZusQDHfnNc0MB68vOMtc4/KWXzhxxWn/YjR2bchBiAOekPxX+vHpd9XZPo+EpAeBMC3xJt6TUzMHxgIy6H6CefY7eMQhvbHRUls0R8i9h58XKHuM5I6gAzU8lDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWoun3N8cx+aob+pJ/4J1/wEj8G7HkWA3+emTszcV+A=;
 b=KDSXdEvFT9f37ksnU1AgsyCbaZtGNX5fS6HVYATBWijK4pi3iYVxPWRHyLIuzikd3gGC27Bk+GWzCcX6ailTZdkffm+vKxG+tD5L77/Jbh/MMLuIgnNqqv1ko8p5QxjtFtm8cOYEzouKRERCqeQkaXaH5PcsjRC9yEvHgb+dNro=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by TYZPR03MB5995.apcprd03.prod.outlook.com (2603:1096:400:12a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:39:43 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:39:43 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v3 05/11] drm/mediatek: gamma: Enable the Gamma LUT table
 only after programming
Thread-Topic: [PATCH v3 05/11] drm/mediatek: gamma: Enable the Gamma LUT table
 only after programming
Thread-Index: AQHZgBeGXk/em5ru0Uak1NlwM111s69SB/8A
Date: Tue, 9 May 2023 14:39:43 +0000
Message-ID: <366688a61bea284c0f5a3154c92006543f825e18.camel@mediatek.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
 <20230506123549.101727-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230506123549.101727-6-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|TYZPR03MB5995:EE_
x-ms-office365-filtering-correlation-id: d5caa4b9-8434-410b-b9c2-08db509b3a98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ve3Gq+EQmsp5d4Pg5WZoQrByDDOv2Fsb4AieJe2G+kdfX8WpgaYjmlIlb9qeRQxR8ASaOqJiatL3M9CTQlZq398URg08dri1QrURrJ83r9YPDXcntB9YNaUQuMIN6+qQ4QXZB1MuXPg4Yle+lpNu4dEQzkHhPhrQVuFy2A52GcfAxMNK/CeKUEbsx/btgi4DbwAdSJYvO5pYDl5DebX/IomPtkvyVF9Wl1ffqBkqIYHUDc0R6vCYMUXpvO7fDQln6MV62hGcOODcep+P7Y8jmG9+IV57L3hyXueT25w3wkT8ov5VXUBxz+J51R/3A7j8E7CAPWdUVDnXIHnSP58lVInjszn3DxZ1nQuZHNcAtq73QLsveKdEWaJgLIJq0dS4zFvlJ7EkUkQuRJsmE7RqZbRIXxLRqs9541rFBZHbL68nV6EQf9vOu7b0JS3XBuKW50xlMq1uxnBpTFbDCa3iHzKHa2Q86bWePaGaKyFZJlkbDbe95ZDokG57hJe+cpGeA1v9y4cJijB5b3qVvKghVoMOWcja/ekitZQqdYAqjLRjuSxGNtPULOhmhxDp8JXoSusPRR5RNE0WO6CxNgqbXkIMTt2DPDam86t80o4mQlxOPrU+XXTayTRxzY/r5/mk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR03MB3062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66476007)(4744005)(7416002)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(64756008)(76116006)(91956017)(66556008)(66946007)(83380400001)(85182001)(71200400001)(26005)(186003)(6506007)(6512007)(478600001)(6486002)(2906002)(66446008)(38070700005)(86362001)(38100700002)(36756003)(2616005)(54906003)(110136005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEZLQXR2QkZVMjZzbTZPSWxvZXBtREtnOWl6UHQxdmtqRWgrbmpKdlR1UkRl?=
 =?utf-8?B?cFRjbEFwc0dTSjhyQ3M0Y0YwaThwYUxqZndpYzRQOFhiQ3ltN3NYeUN3NXA0?=
 =?utf-8?B?THl5OEhuWUtCOW9aSUJxK0hvUWpCV0sxdktCbGlidkVkUzFtWHd2Umk5aUZJ?=
 =?utf-8?B?UnN6NGF6NDNCZjU0VTFFdnpuYW5Uakp0TGpsQ1AyY2pJS2hFdUZPcmhsN2pz?=
 =?utf-8?B?NktoZzl2T2xIYWlrSDNQWmxIdW5VUVFCcksyNXN4cURid2swdVlsL0czdzNT?=
 =?utf-8?B?a2xoRVFCSGJRVnlWdHFCaGpsc0llYjdudTNWa0ZjYmNoTVZnREdBenpWa01E?=
 =?utf-8?B?SjJNOHpTTzllWFpxd082YWZUUmFIdW5WditLelhVMDVIdGo2eUxIMW9JMHpo?=
 =?utf-8?B?dFNDSENiZkN5cXBSa2JWOW5FZjhaYXduWHlBdTlTcmVwM0xjYzh6Vys3bTFv?=
 =?utf-8?B?MjdkMDliL2F0S1VFSisvRVJiZEZXV1l1bTgzci9VTEQ0WlJ5Q2ZsV2lVMFVG?=
 =?utf-8?B?bHkzYUVHbXJ2ei83dHBnWVl2MjZBc3dxTkZoQ0pObFcwakprTzBLK29kZ0F6?=
 =?utf-8?B?V3F5UjJhRjN2Ymc4MVJkU0VDSll2STdEczhNeURTOHhZNHlDcXlJeWk1QUNO?=
 =?utf-8?B?eGhXUUVUZ3lwdW55M1FQS2ZEOGZMZGw3ZTQzTVZwZzVBa0FQWVlhUlVKUHVo?=
 =?utf-8?B?SFZEcXRtZDRWWE4vZm9uM0hVTVN6cUpkakVHY3h4U2xFVDA4Y3dhR3dKKzhu?=
 =?utf-8?B?RHh0cEFEWkdWQ2U2VjdBNUhENmZxZmJpTmljL1VSSWFMcGRPcEdFQlN2WG0z?=
 =?utf-8?B?MTJEdTJHYVZYT0grQy9hS1Z5ekFsYjJXQ3UzUlRjM3dWZFVQVzFDMzBkaTE2?=
 =?utf-8?B?K2RmMVdWV1VGSVB4NW5FSTJNVUZ3NnRMQ3dwdGd5cUNhLzFKRkxtVGQxcC85?=
 =?utf-8?B?anJXTjJvLy9PSk9rbllUcEoxSmtuS1pCVHY5U0NoYUpGY0lvNm90MmZVN1lo?=
 =?utf-8?B?Vk9QSEFLaE0vcFJMNGUrYnRmNlZMcURlOUUzMjRJVGM2ZzFwYUdiaS9ZODY1?=
 =?utf-8?B?RWlGc0NpalJySytxQ1MwY2l2NFRQVDYzZUNDZlQraVNPblRiVW9KVHB6ZWNP?=
 =?utf-8?B?Vlk5aW83Zko3akNISjFOTHJXSkMrbmlPMVQ4VGVpVFNxcjBXT0w3S0Fxcnhi?=
 =?utf-8?B?bVlTOFpVNzZ5Ni9lOG9ZTGRrTXE5U2tIRVRzclc0UXlDM0ZCd29Qb0RkOHJZ?=
 =?utf-8?B?WC9DcndHTGNEbVJoREVxMHYyZncxenMyQW1SMHloNlZPYzZITk1RbnZXYnU2?=
 =?utf-8?B?bDlwNkdYZGRzbzVtUVVRY3NpbmRMREFkOVdocDBTNWZZZmovOGNkVlRGRU1D?=
 =?utf-8?B?YTU3bm1RS0ozWStjRWc2czkvb1J2V2xhdzNRbCs3TXNhREtVSEVTMmFOR0xN?=
 =?utf-8?B?TjZZQ09NOFFjdlVvbmNaMkRMZDUyMUdJVE9RZmhFejZSR0NWQ2gxUDExMjEy?=
 =?utf-8?B?R0laZDF6Z01mQVFZMXBrUXJKbXJRalcwMk1rdVI3RXRtNUJDcXJ4K1FwR2l1?=
 =?utf-8?B?SFlrak8yeC9kZHFPVzkrZ1JDVDRIUHBua3RJQm9jMDJmOExQVGpSRXZYM2lz?=
 =?utf-8?B?bUxOZlp2UUJIUXI5c2FmZWo1NVVSeXNsUHdsYUFmUWxPMHU5UlZraFhPVnE5?=
 =?utf-8?B?Z2lOeUpOcFBBMzRkSmJQVW5WcmRSWGJSZnhmY3pTbEdJVEhoeHUxUURkUVpv?=
 =?utf-8?B?TU9ZdTJiSnhEeXB3b3NMakR1ZWpTbGJ1aXRWcElhOUFIa3A0cEZJT0x4cG1G?=
 =?utf-8?B?Y09uaGgyQWhUSVN2YURQT3B4L2Izd241VWJRMUpzVzV2VnVSYnJpUzJ3VXpH?=
 =?utf-8?B?NUxWck9oRG5PSEFzR0xXUzdSQjVST3REREFZWVpURDVab3dZNmFNajB5aTNC?=
 =?utf-8?B?Y3U1YXdjRjFFd0lJSm1OVUQyeTdmRDh3S0hpNDF6eHFqcTVQSnFYVnFSV2g5?=
 =?utf-8?B?aFphQVVQZE9Fb0VpRUFSOFowTnNIWFNJa1ZnUmR6VHZFR2pobk9HWHgzcWcr?=
 =?utf-8?B?eFZwVndIOVVXVzhaOTFtWlhTMVBVd2FGdUM2ZmRuTlF0TEVUY2NhVHlTeHlq?=
 =?utf-8?B?aG5tV0hwY29PK0dvZWIxT2pGbGdCd3R2cndlaFlDNnErcTFiN1BJSU04c2Nr?=
 =?utf-8?B?dHc9PQ==?=
Content-ID: <1C7B3D8F76AE814498E80741084006BF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5caa4b9-8434-410b-b9c2-08db509b3a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:39:43.6271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5mqftYhjObAYJ4rJZd+myFWcX7vVIKZWSuJoIA4XqkOVmIdCWElZnNJchFpr8vtX41uIZAbkBiksoHbwZ28bzISjgqYdbnPyrLtf5wnhOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5995
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_217702677.920631846"
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

--__=_Part_Boundary_009_217702677.920631846
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA1LTA2JiMzMjth
dCYjMzI7MTQ6MzUmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1Bs
ZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYj
MzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zlcmlm
aWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtNb3ZlJiMzMjt0aGUmIzMyO3dyaXRlJiMzMjt0byYj
MzI7RElTUF9HQU1NQV9DRkcmIzMyO3RvJiMzMjtlbmFibGUmIzMyO3RoZSYjMzI7R2FtbWEmIzMy
O0xVVCYjMzI7dG8mIzMyO2FmdGVyDQomZ3Q7JiMzMjtwcm9ncmFtbWluZyYjMzI7dGhlJiMzMjth
Y3R1YWwmIzMyO3RhYmxlJiMzMjt0byYjMzI7YXZvaWQmIzMyO3BvdGVudGlhbCYjMzI7dmlzdWFs
JiMzMjtnbGl0Y2hlcw0KJmd0OyYjMzI7ZHVyaW5nDQomZ3Q7JiMzMjt0YWJsZSYjMzI7bW9kaWZp
Y2F0aW9uLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lv
YWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYjMzI7YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KDQpSZXZpZXdlZC1ieTomIzMyO0phc29u
LUpILkxpbiYjMzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQoNClJlZ2FyZHMs
DQpKYXNvbi1KSC5MaW4NCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_217702677.920631846
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBTYXQsIDIwMjMtMDUtMDYgYXQgMTQ6MzUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE1vdmUgdGhlIHdyaXRl
IHRvIERJU1BfR0FNTUFfQ0ZHIHRvIGVuYWJsZSB0aGUgR2FtbWEgTFVUIHRvIGFmdGVyDQo+IHBy
b2dyYW1taW5nIHRoZSBhY3R1YWwgdGFibGUgdG8gYXZvaWQgcG90ZW50aWFsIHZpc3VhbCBnbGl0
Y2hlcw0KPiBkdXJpbmcNCj4gdGFibGUgbW9kaWZpY2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+DQoNClJldmlld2VkLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpo
LmxpbkBtZWRpYXRlay5jb20+DQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg==

--__=_Part_Boundary_009_217702677.920631846--

