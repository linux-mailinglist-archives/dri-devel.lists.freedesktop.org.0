Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377C77E50E9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 08:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD1B10E38B;
	Wed,  8 Nov 2023 07:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF7310E38B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 07:27:35 +0000 (UTC)
X-UUID: 45dfeede7e0811eea33bb35ae8d461a2-20231108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=iGr+tZcmXTcTeNUjmJJ8xbijkwW64eAu8Gfp3BznZTs=; 
 b=KmB/M392S7z3dSQ7qSlHJ4M6+7MyqXQP1KvpczhxIlgbwcjPb6cg9zPL3NSK5AozTtWq58Z4HGOgHpz5WnEzv1g7fUPjzg2TeSFeD13TW41EDC4GGvJh1pzGcy6Ym/TItOwV8arFDUDj7DqkleAMTLjG/KjL9fe+x7Ucz4accsg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:aeebbaf9-3f18-4e12-b5a1-face4b901431, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:7fad6872-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 45dfeede7e0811eea33bb35ae8d461a2-20231108
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2020792641; Wed, 08 Nov 2023 15:27:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 8 Nov 2023 15:27:28 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 8 Nov 2023 15:27:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC0K3UslwfqDiHVR9Mv+UiwsZNt5H2aHxsyhly2DRTBhGH/uBWgpr8t2SUPGxUm7w5kTVsSW+Lk9+Oavl56sQjJlIWT23n8KpdMh7OjxW9pxpMTafVPtiXz3ZZ9MgAHD3RUj4anoT18x1uWSaRXbASEj38PFXrOR8b4jI3ShgKEOSacpGU7qEjPbVJvjcDAY5OkSp+z16Y67DxkNRGwvwB74H5K0MZcjTQ3hiHGnLwohEGzY1mDV9tY0mX10UvQ6ZecXH9Ax1NlyVZvtpg92JV3yNQ35MB5W0eCyRyQGedmZB8e9zHY5p0qQjNno2nFF4kOHjDlBrd9H9leFeZ/RkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LO/QJupJmLT4SLwdwrwIGhXYGgV5bZ9dE1uSV8dGMM=;
 b=FshjI+Ijj6J/RuadMyI7/qgC8of//NZlVdkE795Yy5HO36bTPMBjNN3FERYF1bB3XNQPOyn/W7fkqVNIOYQpTChpFdr72zu1nxInaQ/PuVjkBNo1sLgj4srE5CGJhZG5hH3vmmDomGiflU1oj3s6jWVK2YxdQ8FC1VexD44027JwkAZwlw/ypr92fxTVylfnuZs3RNkpOFHC8pzyutEMP29/Eiu6Mx8ufTstDHt7mYCYo9zEBEBVoOeo9jnVKnsFuM6mb5a/6+g+pmuUL9tNGKO6GHNP4Hxv6QLdEQSxE7Zg8VUHrk+N7zEeLdAo3PZPHtAf+TynNGi6sTwiNByLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LO/QJupJmLT4SLwdwrwIGhXYGgV5bZ9dE1uSV8dGMM=;
 b=v42yAeSXhDXRAlffpu1Fl2Q+rfKYqbWnz/otRcs+CdpovjTLBF3/XNS1aNw7SIGqNxpvDkHb9eNyznahjfysFu0BId5iyNUPWYreoY3P0ElBr3/2rSxjjU7ouQh1Wh2H3ms2UBmphW59D5VtCs1QpQjIsuP/qxri8eS7CakKZJE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7828.apcprd03.prod.outlook.com (2603:1096:820:f0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 07:27:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252%4]) with mapi id 15.20.6954.027; Wed, 8 Nov 2023
 07:27:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
Thread-Topic: [PATCH v2] drm/mediatek: Add spinlock for setting vblank event
 in atomic_begin
Thread-Index: AQHZ66HiGkans6e6KkKLgSXwtRDeaLBwUsUA
Date: Wed, 8 Nov 2023 07:27:24 +0000
Message-ID: <4b55632a4cc92932384844f94a7d237aa3f471e3.camel@mediatek.com>
References: <20230920090658.31181-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230920090658.31181-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7828:EE_
x-ms-office365-filtering-correlation-id: a0e28e96-63d8-4a80-64ea-08dbe02c275a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4eB0IeUYWdUYJ8B0pvwu5kswZeAraO232Bo7hJE2HP0vxiHXqYrizFE0tMAx1QKgzhsb5d9/BvTcomJI94Z0Egsu8BWHWMUJg74JnsK8Ec8r7FWxmg79WGA/AVh/Jg64Iz/m7WxWEzuYouUFJlvijc0Gl3KddmxzglS8HFq68v0qLmE+Q9FsC/Eq8FWxn799yP+g1wC2lE3BWPWRKxEe715rKGEBa2j63jSj67EQp7iMgm86+HwP1k5zIrG2XoTKdXary1s9BdZa65RT7wqEE3E0NIiCJ899la5pQgP4Ffx/eT+HmVq9ynDkWaa+jwWLk6ZxPDxdwEmgxV2L7E2+nXoJSF7GJ32qVjwt5KMQ0tydROD1w/liGNLaIHGlEOozUpEHiSLUBByrAHcZJfdQd9iAba+EbtOi74WqmFE61ihsbfVxsF6C3nJ1hTfDYlFHluDavkIs7Gjq8iI8sf7qtL8CLGWo9pGmGf7CyJ5y9J49eUZrsmX3RfwEgH7FNaathFyv93ACpQRi2RcQ1bQcPtrQ2WjqPe5rgU2Slb4tM+Avuyly0NHaYPO2HfS/GqAQaI93mPMUJIeZAiYMO3Npfv2V4mAY87atbssBuFYuHovfP+/C8s8bhtU2A5W2UKWZ+zS7ZYg0WQZlZyjXCFOYYEZKg0R8k5hU8jXIWErTI7I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(122000001)(38070700009)(26005)(2616005)(76116006)(83380400001)(66946007)(6506007)(478600001)(71200400001)(6486002)(6512007)(66556008)(66476007)(8676002)(2906002)(36756003)(4326008)(110136005)(41300700001)(8936002)(38100700002)(5660300002)(86362001)(66446008)(54906003)(316002)(64756008)(85182001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU9YR0RoRTVwayt5am5SS0lhWlA5ZXU1OVQreWJBaGNDUkpvbWtEZDRvNXlS?=
 =?utf-8?B?dktKaW9uTExhZFJUQ3dDbzR4WFNMYURrSVhuaExCRnFqQnBPSEtiL3lCYnZI?=
 =?utf-8?B?aDBKRnF4aEFaMTZ5UjJkQVdEKzJoMFJTS3NCODE1YVN3V0E1N3RHSHZOVG81?=
 =?utf-8?B?U09BN3lZUDgzM3VQbllZNmlEY3N1MHJJeTJQQlhnSGRoaHdyQmNsOTFkSkNW?=
 =?utf-8?B?RlRZOTd5eE8rYi8vTThVeVByWkljNVg1Wk9wNE5Lc3QxS212ekRRbDRuUlVv?=
 =?utf-8?B?L3U1SFFIdjFZVUZENWo4SUxnSGdkZ0dRanFpdlc2NzUzanYvM3RxV0pZeExX?=
 =?utf-8?B?aStJYnhOUkFUaWNtL09NUGxKcWFhdDlBbndOQjlPRmkrdlNaTlI4YllMV3Nr?=
 =?utf-8?B?OXVlQXhwWjV0TjJSMUhvZmdldC9lMFIza0ZSV1J4TkN1dWZjMjVLdVZCSVhr?=
 =?utf-8?B?ZVhDNmxyTDlqYzBQZ3ZOTGdZeFRzeENwTFpOeG5xMnk2bFFsRkxLMmxCcnR5?=
 =?utf-8?B?cnlSWXQ2amlmM1FmM0JjYTk1K1E2UVIvUkxib05Uc2xWWXZkcDRpNWRnOUdI?=
 =?utf-8?B?V0Y2Rlk3UFF5ZnQ1MkdBSnRzN2xQdmYxK0ZueFJ6Rm9heWpmdHUraGhaek5P?=
 =?utf-8?B?T0VxSFNHc1ZMS1VhRWNRWk5UZUE2a25xNzBjQmdjYzJvaHczREIycXR6MDIr?=
 =?utf-8?B?Z0RPSnJiNE5jSER5SWhGZVRERUR3WVdmaGgvamt0RzBFdjBhSU9UZXczenF6?=
 =?utf-8?B?c0hyRWpxZ09Jc3laSjlwd0lqVkVHK1N4K1VvN3VEbXdUSFBiL2o3K0VGT2FT?=
 =?utf-8?B?aWVDa2xUQmRta05STzllT3UxNXFjdnI3VUxRMTE1VW9GS2MxNEtPM1loRVlO?=
 =?utf-8?B?ME0xMXMyZFJEQnllWm9kWVFNSWRnR1NwcDV1dm9lMUlBRHJFZXFwMkYwbnhP?=
 =?utf-8?B?Tk5wOWx1Sjd1cmtwcis5c3JqNi9DZ1k2cmFpN0RyZ29vd25yenY2K3QvY0FU?=
 =?utf-8?B?bWMwaE91ZGNpdDhpajBTTkJkeWlERlNxR0s2c3RrRGVIWUZXeUdzUjZvZzlK?=
 =?utf-8?B?M0w0V04wVTZ3aGZrQmFuUGZmZmlpZUh6NXFidXRuQVRqZWFKdzNnRUdxZFpH?=
 =?utf-8?B?L2t2MU5SaGlkd1I3NSt2Z1hRaS92QkJBM1llQVZ3MXN6WHh5VldORk5HbDNY?=
 =?utf-8?B?M09wdTg5V0VzNGhvTVhMTDgzNlJKZmVwcU9XelJRQWZOSlNWQlFtUjN1elMw?=
 =?utf-8?B?Vy8rbmNnY0RwU2NWQlVydEQ0MzBURm5SSi9VV090VklvTE5qbWo0L3pGcklR?=
 =?utf-8?B?b2RxMmU2ekNMNDYxUWJqWVlCNnc3QjlDUGlYSm1XNXJVNU9ZV3RCbFplUTgv?=
 =?utf-8?B?ZHg4ZU9yU2lRUDFGaXZDRTVOMlZHT1NJTGxVdnZYSCtId1F5dTRRYkJGUG9C?=
 =?utf-8?B?amhiWXQyM3ZqQUdHUTZKc1RNTVMxeE5EaGU0d3lETk1waWJ5bGRjbDVzOEh5?=
 =?utf-8?B?SXdEYmx3RkxZYnUvbGtLQjRTaVZ3d3dZbGRQVnp6VEliUUp2MlAyeE1OaURr?=
 =?utf-8?B?UlFWNjNTcko2ZFJLVlVnTVhBbTJMVy9Vb3h1Smx2VGhHb3kweng4dWIvanBq?=
 =?utf-8?B?eDhiYWMzdUltQkE0UExPdVZJcC9ad0pjT201SFFhVDlhcU01a1ZKMjRyb1pQ?=
 =?utf-8?B?MnhXY2pFSFJ4Yk9aZ3lUU202SEtjcVYxNG9UalVpaEQ2NW1TT1ZRUmp0QjRw?=
 =?utf-8?B?c1pNSGJSWTRvb1Z5K2RSeVpkUzFjd3dBQlZxeHZHQXJsV0tMS2N3dnFKc2Rw?=
 =?utf-8?B?eUVmeGI2ZTlYOGV5b0VlSVBwdGt3cXA0RTZpZmpoa2tBSjNCWVdzQ3M1VmpH?=
 =?utf-8?B?TDFXWTlvUDNxNlRPaDVQd28xUlFiVFlTaEJqL2xxeXowNG9RVHBsNHA0Mmd1?=
 =?utf-8?B?R1phbm9NOGpKb3BNM2xJKzV2MzZKdEowM3VvUlQ0S3daK21QYXNUNC8xRFI3?=
 =?utf-8?B?VDEzRWdVNjJUSHFjYnIrRU9XOTk3RTBmNlcyb1dXdnE0TlcvZzFUZUp3NElr?=
 =?utf-8?B?NW1ucXVGZ2c1a3RTSmZNQXhhekZidk5ybUxCZFBpdlc1YlJqZEJXcDB1dEdz?=
 =?utf-8?Q?1GlKQBsfWI03AHdSX/X2Iz3ld?=
Content-ID: <A9BF6AFD7AC48349BA95549918AE4BD9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e28e96-63d8-4a80-64ea-08dbe02c275a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 07:27:24.6220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7x2fHshAIcjrEDVX/tuOQ6qryhcp0XtXBIiOPlzEt04c6KC1FYyDf+VnaSjGqttv78CtJQeDgE0wUDDs8qIeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7828
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1833676039.1586656256"
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
Cc: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1833676039.1586656256
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtXZWQsJiMzMjsyMDIzLTA5LTIwJiMzMjth
dCYjMzI7MTc6MDYmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0FkZCYjMzI7c3BpbmxvY2smIzMyO3Byb3RlY3Rpb24mIzMyO3RvJiMzMjthdm9pZCYjMzI7
cmFjZSYjMzI7Y29uZGl0aW9uJiMzMjtvbiYjMzI7dmJsYW5rJiMzMjtldmVudA0KJmd0OyYjMzI7
YmV0d2VlbiYjMzI7bXRrX2RybV9jcnRjX2F0b21pY19iZWdpbigpJiMzMjthbmQmIzMyO210a19k
cm1fZmluaXNoX3BhZ2VfZmxpcCgpLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7
Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczom
IzMyOzExOWY1MTczNjI4YSYjMzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7RFJN
JiMzMjtEcml2ZXImIzMyO2ZvciYjMzI7TWVkaWF0ZWsmIzMyO1NvQw0KJmd0OyYjMzI7TVQ4MTcz
LiZxdW90OykNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZs
dDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7U3VnZ2VzdGVkLWJ5OiYj
MzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYjMzI7
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7UmV2
aWV3ZWQtYnk6JiMzMjtBbGV4YW5kcmUmIzMyO01lcmduYXQmIzMyOyZsdDthbWVyZ25hdEBiYXls
aWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0ZlaSYjMzI7U2hhbyYjMzI7
Jmx0O2ZzaGFvQGNocm9taXVtLm9yZyZndDsNCiZndDsmIzMyO1Rlc3RlZC1ieTomIzMyO0ZlaSYj
MzI7U2hhbyYjMzI7Jmx0O2ZzaGFvQGNocm9taXVtLm9yZyZndDsNCiZndDsmIzMyOy0tLQ0KJmd0
OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMmIzMyO3wm
IzMyOzUmIzMyOysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMz
Mjs1JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KJmd0OyYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCiZndDsmIzMyO2luZGV4
JiMzMjtiNmZhNGFkMmY5NGQuLmNhYjRmZTA5MmYxMyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0m
IzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQomZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQomZ3Q7JiMz
MjtAQCYjMzI7LTc0NCw2JiMzMjsrNzQ0LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMy
O210a19kcm1fY3J0Y19hdG9taWNfYmVnaW4oc3RydWN0DQomZ3Q7JiMzMjtkcm1fY3J0YyYjMzI7
KmNydGMsDQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMyO2NydGMpOw0KJmd0OyYj
MzI7JiMzMjtzdHJ1Y3QmIzMyO210a19jcnRjX3N0YXRlJiMzMjsqbXRrX2NydGNfc3RhdGUmIzMy
Oz0NCiZndDsmIzMyO3RvX210a19jcnRjX3N0YXRlKGNydGNfc3RhdGUpOw0KJmd0OyYjMzI7JiMz
MjtzdHJ1Y3QmIzMyO210a19kcm1fY3J0YyYjMzI7Km10a19jcnRjJiMzMjs9JiMzMjt0b19tdGtf
Y3J0YyhjcnRjKTsNCiZndDsmIzMyOyt1bnNpZ25lZCYjMzI7bG9uZyYjMzI7ZmxhZ3M7DQomZ3Q7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KG10a19jcnRjLSZndDtldmVudCYjMzI7
JmFtcDsmYW1wOyYjMzI7bXRrX2NydGNfc3RhdGUtJmd0O2Jhc2UuZXZlbnQpDQomZ3Q7JiMzMjsm
IzMyO0RSTV9FUlJPUigmcXVvdDtuZXcmIzMyO2V2ZW50JiMzMjt3aGlsZSYjMzI7dGhlcmUmIzMy
O2lzJiMzMjtzdGlsbCYjMzI7YSYjMzI7cGVuZGluZw0KJmd0OyYjMzI7ZXZlbnQmIzkyO24mcXVv
dDspOw0KJmd0OyYjMzI7QEAmIzMyOy03NTEsNyYjMzI7Kzc1MiwxMSYjMzI7QEAmIzMyO3N0YXRp
YyYjMzI7dm9pZCYjMzI7bXRrX2RybV9jcnRjX2F0b21pY19iZWdpbihzdHJ1Y3QNCiZndDsmIzMy
O2RybV9jcnRjJiMzMjsqY3J0YywNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhtdGtfY3J0Y19zdGF0
ZS0mZ3Q7YmFzZS5ldmVudCkmIzMyO3sNCiZndDsmIzMyOyYjMzI7bXRrX2NydGNfc3RhdGUtJmd0
O2Jhc2UuZXZlbnQtJmd0O3BpcGUmIzMyOz0NCiZndDsmIzMyO2RybV9jcnRjX2luZGV4KGNydGMp
Ow0KJmd0OyYjMzI7JiMzMjtXQVJOX09OKGRybV9jcnRjX3ZibGFua19nZXQoY3J0YykmIzMyOyE9
JiMzMjswKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytzcGluX2xvY2tfaXJxc2F2ZSgmYW1wO2Ny
dGMtJmd0O2Rldi0mZ3Q7ZXZlbnRfbG9jaywmIzMyO2ZsYWdzKTsNCiZndDsmIzMyOyYjMzI7bXRr
X2NydGMtJmd0O2V2ZW50JiMzMjs9JiMzMjttdGtfY3J0Y19zdGF0ZS0mZ3Q7YmFzZS5ldmVudDsN
CiZndDsmIzMyOytzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhbXA7Y3J0Yy0mZ3Q7ZGV2LSZndDtl
dmVudF9sb2NrLCYjMzI7ZmxhZ3MpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjttdGtfY3J0
Y19zdGF0ZS0mZ3Q7YmFzZS5ldmVudCYjMzI7PSYjMzI7TlVMTDsNCiZndDsmIzMyOyYjMzI7fQ0K
Jmd0OyYjMzI7JiMzMjt9DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+Kioq
KioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioq
KioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1
bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25s
eSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24s
IA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGll
bnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2
ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFp
bCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2Ug
dGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91
IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1833676039.1586656256
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjMtMDktMjAgYXQgMTc6MDYgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQWRkIHNwaW5sb2NrIHByb3RlY3Rpb24gdG8gYXZvaWQgcmFjZSBjb25k
aXRpb24gb24gdmJsYW5rIGV2ZW50DQo+IGJldHdlZW4gbXRrX2RybV9jcnRjX2F0b21pY19iZWdp
bigpIGFuZCBtdGtfZHJtX2ZpbmlzaF9wYWdlX2ZsaXAoKS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiAxMTlmNTE3MzYyOGEgKCJkcm0v
bWVkaWF0ZWs6IEFkZCBEUk0gRHJpdmVyIGZvciBNZWRpYXRlayBTb0MNCj4gTVQ4MTczLiIpDQo+
IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4N
Cj4gU3VnZ2VzdGVkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRy
ZSBNZXJnbmF0IDxhbWVyZ25hdEBiYXlsaWJyZS5jb20+DQo+IFJldmlld2VkLWJ5OiBGZWkgU2hh
byA8ZnNoYW9AY2hyb21pdW0ub3JnPg0KPiBUZXN0ZWQtYnk6IEZlaSBTaGFvIDxmc2hhb0BjaHJv
bWl1bS5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jIHwgNSArKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBpbmRleCBiNmZhNGFk
MmY5NGQuLmNhYjRmZTA5MmYxMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fY3J0Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYw0KPiBAQCAtNzQ0LDYgKzc0NCw3IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0
Y19hdG9taWNfYmVnaW4oc3RydWN0DQo+IGRybV9jcnRjICpjcnRjLA0KPiAgCQkJCQkJCQkJDQo+
ICAgY3J0Yyk7DQo+ICAJc3RydWN0IG10a19jcnRjX3N0YXRlICptdGtfY3J0Y19zdGF0ZSA9DQo+
IHRvX210a19jcnRjX3N0YXRlKGNydGNfc3RhdGUpOw0KPiAgCXN0cnVjdCBtdGtfZHJtX2NydGMg
Km10a19jcnRjID0gdG9fbXRrX2NydGMoY3J0Yyk7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsN
Cj4gIA0KPiAgCWlmIChtdGtfY3J0Yy0+ZXZlbnQgJiYgbXRrX2NydGNfc3RhdGUtPmJhc2UuZXZl
bnQpDQo+ICAJCURSTV9FUlJPUigibmV3IGV2ZW50IHdoaWxlIHRoZXJlIGlzIHN0aWxsIGEgcGVu
ZGluZw0KPiBldmVudFxuIik7DQo+IEBAIC03NTEsNyArNzUyLDExIEBAIHN0YXRpYyB2b2lkIG10
a19kcm1fY3J0Y19hdG9taWNfYmVnaW4oc3RydWN0DQo+IGRybV9jcnRjICpjcnRjLA0KPiAgCWlm
IChtdGtfY3J0Y19zdGF0ZS0+YmFzZS5ldmVudCkgew0KPiAgCQltdGtfY3J0Y19zdGF0ZS0+YmFz
ZS5ldmVudC0+cGlwZSA9DQo+IGRybV9jcnRjX2luZGV4KGNydGMpOw0KPiAgCQlXQVJOX09OKGRy
bV9jcnRjX3ZibGFua19nZXQoY3J0YykgIT0gMCk7DQo+ICsNCj4gKwkJc3Bpbl9sb2NrX2lycXNh
dmUoJmNydGMtPmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOw0KPiAgCQltdGtfY3J0Yy0+ZXZlbnQg
PSBtdGtfY3J0Y19zdGF0ZS0+YmFzZS5ldmVudDsNCj4gKwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7DQo+ICsNCj4gIAkJbXRrX2NydGNfc3Rh
dGUtPmJhc2UuZXZlbnQgPSBOVUxMOw0KPiAgCX0NCj4gIH0NCg==

--__=_Part_Boundary_001_1833676039.1586656256--

