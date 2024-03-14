Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A955087B890
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 08:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E4610F1DF;
	Thu, 14 Mar 2024 07:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="NqR/NZoZ";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XkJ0EMgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0937A10F214
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 07:26:33 +0000 (UTC)
X-UUID: 2afab358e1d411eeb8927bc1f75efef4-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=RK0RNwPmDDaztyIvOb5EuaS412Nwtlzcub0cs/AGsMk=; 
 b=NqR/NZoZw+fE4xUVMgQupMWngbfJpKwiMthaXoPkuQONnB/dYztHE5CLosnCJbsYX5KoPyLwwCda9x+DZVioZZrF8gmvUEGKdD7JVWmBwwU8A1XyoO/wpGuenHMDsuFVDbEuXjS7eEs73Zx+AhJSVe5XOVQh6LAdk9Jpx+PNXD8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:6c45220f-f6f7-41bd-bfdb-ab20cd92a02b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:98a36490-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2afab358e1d411eeb8927bc1f75efef4-20240314
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1211267763; Thu, 14 Mar 2024 15:26:26 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 15:26:23 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 15:26:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPgxpynZHgYaAWA0KsSqNBt2RABSoozSnNgdIchhdmUdHSQ++HnBKy7MNpioafZyVn5s5iUXrn7NZwomdaYQiZae5q3IMUFe8wgY2BoRECJklJE3HWKgYII/M6aXnF0bKq3PERM9ZNmgnlCuJlhbR6ZWai54k8Gr5FBVEYLJE7HPQsnUj4oBI+d5H4pJ8Tlbj6L5NeK9BQs+lXb0hdK/stz6WHObjGEDW3UVPcmM9V2tTd/o8vJ/TvAHomjRloWdvcroC8w1M1JxLRK/OgmunahbSFiXBVmNO2OUeRrF87iUBxknyUUrcbgJ2LSphp2cV143Xr7MFcIP+mhDHi0fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJnRewlVjMXyg1I9Z8AdVvj+YJaDg6eKXesNRWBYGZo=;
 b=HSs0FKy1G0TIF+nQtV7HcmBOm/SS0zGu9b8gptxw2ofkQZtX/Y92SUx0GmKgaJMo0imRLDHqIn61rGdtPlJFohaEBr5raVpvV9sE5NBAywySXqXSo/+e8Xdh3YO56qV8p20e+T9VXPe0IUqif561ucjGrVr9gel/khOoUdqp6ZwsQq3XBenUxaNqdWmH46KvKFgGddA9WABuZ3/0jK4AJu7bwFO9IMnu5Wo9+XIz+HhetB36fjJTpGZ2idZPI9ckvl6Qbcd6mhxvEEcs+mnGWnQZxmzqsIV8JFsBIPfR4E6/OaBo7QJ7HPOHJBmVXD96wRNd4ohiu0mHgl7PMZrFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJnRewlVjMXyg1I9Z8AdVvj+YJaDg6eKXesNRWBYGZo=;
 b=XkJ0EMgOvpk2a16xrbb5ANmv4nu20l9w/zuBByUhoYOBHqnf7P+dCfEeHczbyqz9QgImQYIWM7p2ZctcFICbXNUvDf/ZveBPNKeVxQBicglIImlAqet7rlLtm/FcG/ziouCgS9GVXujZAhhBOxlLSiRdyWRjSrONRiEau0PH7xY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8743.apcprd03.prod.outlook.com (2603:1096:101:201::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 07:26:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7362.031; Thu, 14 Mar 2024
 07:26:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH 11/11] drm/mediatek: Rename "pending_needs_vblank" to
 "needs_vblank"
Thread-Topic: [PATCH 11/11] drm/mediatek: Rename "pending_needs_vblank" to
 "needs_vblank"
Thread-Index: AQHaaJEfcSPtdu0F7kygFMPcSagb17E28K6A
Date: Thu, 14 Mar 2024 07:26:20 +0000
Message-ID: <db993e44824b69dc36cbb36ff9558e10a3cf0c8e.camel@mediatek.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-12-shawn.sung@mediatek.com>
In-Reply-To: <20240226085059.26850-12-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8743:EE_
x-ms-office365-filtering-correlation-id: 8ef80ea3-bba0-453a-f4d1-08dc43f80b72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8YCf3LLI+23ebZF8hErdKWLEeSuWOvjhgiW5aw72ujEr6EQsIAAf5vFf1jtm4XlzntOfW4H6/9UkZHpYUNacMxQY88a5/MSYZ6OmCEcUnLCzsB0tCE2TMR7G/kHvTfC/sR5t8qsxMm7OtP0wfetoBAJWM5ac3RVUGSr2sCKit6VZmwgk0qMtxmp8hvCc41cQMVTJ0nuGY3bxf74xmIcFN32NGR4fAERcER3zDMVQLv1lf/+vYhdvLdxfBHQ5l75qmZBlEhh0EdjNwLUOmRPBB5MDubTlMfAw8U7YQaEA+eCLfqnocRNfL0GqrPujrpS2FHshWMtrCV2F66XcnkXPg79HlGEvY55FCbbEN3sMmH0/ARC5MBkduHKwH6pIzS0mwS4cZ67h7qryAGIoJ8D/OXhCUyI1wMej+DzFv92oE2+2cCQhGoFgrtREsj9MXK6MVDtSB1RcG0BjFjpaWhoVA2yNn4OcuLmKgUEU5k4ENoEZ6DKaGUW7Ldb64z4jSFEzMPvunxR/+mSFnFKw8vVFnPupDZz9bJlTm91jgd6Ps0Z9+B5HjytBoiwLFcZHgQESBaOX3Zr0OVfW5ykCrSuw+qKVWG4Q4keI0aJGFIqhTkvvX6LDHO6TTJ8ymCilKabXDM0AIP8msSNrILRlvcxrT+He+Gs/Y6LoFrLAH7cVpv1n38BoMZv4xmC8nVFawg1pz281sQIc0qKPIEdcB6+u/rzGD0ERlFOcKT18kNdOGDM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzJZdUJWelZaNXBSTHhXYnIvQk44OVhEaVJvajlOQU1SelA4V3FmYTNBTHFG?=
 =?utf-8?B?dENPZHlBZE16T2NTbDFIN3YvRHVGcXVvMVI5UmVaQ3R3eWVIdGlFTldhUlNH?=
 =?utf-8?B?cGxMWlIrbkd1TmpCYkI0WXM5eDNKNlNuYjRnTUR6ZjRwc1E3K0Jhci9BbUo5?=
 =?utf-8?B?dExMZ0ljd2grTXVZNWRXZzFTQ3dqUlZmN0NDYUtNN0NJbFBaV243Ulp0czQ1?=
 =?utf-8?B?WnVlNzVnelRJSDZ5WjhVb2pIZ3BrdVNXbTU3cjFGYTdXcGR0bFJNWFBDY0ZP?=
 =?utf-8?B?eFhYY1dkYjFOV0Qwd3lMcUdTb01rS2o3ZG83a1VVcWxZTDY1eW1kclFhS1dR?=
 =?utf-8?B?andJWWJOajZ5UHh5OVptZHhBOFhnUHM3WCthb25DV0NUdkUvSFpQTFVxUXhN?=
 =?utf-8?B?VHc3OHJXaVAwYTF0NjlLaml4UklvUWdDYzBZUmkyb2NxOFVEeVVyeDVHdDJu?=
 =?utf-8?B?YmtVd21rR3JHMlJGa0ZzanJzakdUVXV2L2FyZkMxTU1FZFVaRzJhY1VvQ0pv?=
 =?utf-8?B?Wk0vd3VEMCs3Q0FpeHltU1gzK1Q1WDhCeUQ3N3FRUm9KdjF5c0tjMUE5TFVz?=
 =?utf-8?B?MVk4QWxtdjJoR0lRRndVVjJyNU1HZVptMTBFMWRiUElSZzhGRElZb2t1NVMx?=
 =?utf-8?B?emhKWWVHZWgzTGV3TDdEakJmNm4vYkdLUU5ZeEEzTDV3S0swZnVEVGZBUkhU?=
 =?utf-8?B?MTZ3NFRGQnNDdWpyTm5jQklETTJYejE3anh2cTdyRm5oT3ZNbUxqYm5uK0c4?=
 =?utf-8?B?QzR6K3FuVGQzbzNSa3FaeVVxL2hSQnA2NmgxQUhXTHVlYUxoRXUwRnNnOFZB?=
 =?utf-8?B?ejNYNVc5MzZCQVUzMjFmOUFpemZET0xEbS9hdFF6ZTdiL0lRODBSWVVsQkJp?=
 =?utf-8?B?bzNLcWErQ3NLTkpaU0x2VExkM3pqWlA5R3ZNV3VkREJGZXNGVmlORnpiMjVk?=
 =?utf-8?B?RG9lejBQRngwVWZ1dG9FSU5nQUdDbE42aVhXN3d3RXE1dGtXUVdsdlJhSHJo?=
 =?utf-8?B?Y2RtVUQyQkJ3UmJ3MExheUgyUUJqZHBQSFVuZ2o0bjlGRkZoejVJTGttbXh3?=
 =?utf-8?B?UUQ3TXFSSUU0bWZUTlBoSHphYmZXYnNFYlNXZTJ0b0JWZm51ZldjaUUxY1Bi?=
 =?utf-8?B?bkRJSS9Hcnc1M3dhNzVwZTBzam1kR2M4ZHUxWnFTb056R1ZxQ0YrT1plSlVE?=
 =?utf-8?B?QVlIdmMrdGJsWDVkVEI1YlhTZ3gzU0hiZlp5SDFvYnplTXJCUzR0NCtEUko1?=
 =?utf-8?B?VVR1QWQzbVFYU09KcWwwR2hlODV6SzA3c2FxWU15aDZleC9TeEwxenFnbHdP?=
 =?utf-8?B?azB5bWRieTRnNmxWcHBXeDkxQWhZT3J2OHlYeTZOZG1KL2J3RjAzRnZxL0Jt?=
 =?utf-8?B?YkRsWmRYdWRKY1dFNHRlOTRsUkM2ai9XYlpLWG1tWTRBNWc4dlRrMUxabU9W?=
 =?utf-8?B?a0pKdGVrT1Q4ZUVBWFppMFhRMDBtWVBmRjBjZXYwNm83ODZ1OVNqYTJqU2cx?=
 =?utf-8?B?dnZNTTFCMllDWWkvUVM3d2Q5WVZOV2szLzEwMFZZbnZ3akNiZjdOT0c1N3lF?=
 =?utf-8?B?a3pRZmU1bGJoWjZZcXhmVk04ZldZcUJoL0I2Zmt5Znl5cHgwVkRqSmljTjl1?=
 =?utf-8?B?M2FsRDNTNTBVV3YyV0s0QXRzTXhxWXlBSm0zeExRTmo0YlVrRE5KKzR1YldI?=
 =?utf-8?B?YXQwUjR5ekRMUUl0N2ROTU95UnF3U3ZldXpsMVRFQXBOS3hRWFZVT0g4ZWpj?=
 =?utf-8?B?NytCTDhiSG5FdjVGTHZnZ0xYNDhlSTBNUmN2Z2dQNWpoRkFkZlVnajlzL2kx?=
 =?utf-8?B?TVdlWDRHbW1NQWlFenBWcnZDNFNhT3R3Z3hYSzBSclRUNjNNbC9QbEFBb3RV?=
 =?utf-8?B?aFVvRnBTZDVGVW9VSU1oazdtelJnNGZLWU5YRVBIN2xHdExIcU9DQVRDYXZF?=
 =?utf-8?B?WFczck5JYWhmcWVtdW5xakFwTkxyeFB2QnJETGZFcCs1bXgrUzV2Szc1dDNT?=
 =?utf-8?B?SVV2YkhiRERld1RkMmRja2Y0VndYWVVoSHNYR2hTaGRSZ2JScGN2OXZLaVh4?=
 =?utf-8?B?SVltNXVpQ1N5TUVieU80YUFSN3VhNlF0aEVBb2FxcTliejBjMEZ0cW9hbWNI?=
 =?utf-8?Q?hhA08wbpnOI4anv48Q/VbVzbR?=
Content-ID: <B457BC34A46FA149BD0D37A3C48F1271@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef80ea3-bba0-453a-f4d1-08dc43f80b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 07:26:20.2271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7hsUPBnyDc9B4O5WXbqnVlKJoUwk+65Mvb0FZxxSslqllKtp/kDBKZ4Fp6Ntk7DZuU5cAMJdG/RbLoIepls9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8743
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.989700-8.000000
X-TMASE-MatchedRID: scwq2vQP8OH+DXQl7XSOUt7SWiiWSV/1jLOy13Cgb49qSjxROy+AU3a2
 v7MgC776yAUgFH8TZu7DCwrx7OfXzdTgPtgJJv6UDB+ErBr0bAPwZGE/+dMc1nzlhuYw8JsTUNW
 K3252w/96lh0OR8iK+hgRYmdci0+Tw5hH8zwI+joD2WXLXdz+AV67veYUroY0CqIJhrrDy2+Mv7
 XbowmN0jiFeyap0p87E9PhZaJeNjOvvxILmKK/HNIFVVzYGjNKWQy9YC5qGvz6APa9i04WGCq2r
 l3dzGQ1sS/MVWpzisNBFh0IliiAGlPLsRPBDDv9UmTPtPrhItifyPlgiETfgA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.989700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E9E0B62EE16DDF509F2822076D154BBCCA84E32D57F6A6344E3025C40D4B0D3F2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_41094127.189218815"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_41094127.189218815
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBNb24sIDIwMjQtMDItMjYgYXQgMTY6NTAgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgInBlbmRpbmdfbmVlZHNfdmJs
YW5rIiB0byAibmVlZHNfdmJsYW5rIiB0byByZWR1Y2UgdGhlIGNvZGUNCj4gc2l6ZS4NCg0KSW4g
bXRrIGNydGMsIG1hbnkgdmFyaWFibGUgaGFzIHByZWZpeCAncGVuZGluZycgdG8gaW5kaWNhdGUg
c29tZXRoaW5nDQpoYXMgbm90IGJlZW4gZG9uZSB5ZXQuIFRvIGFsaWduIHRoaXMgbmFtaW5nLCBJ
IHRoaW5rIGl0J3MgYmV0dGVyIHRvDQprZWVwIHRoaXMgcHJlZml4Lg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8DQo+IHNoYXduLnN1bmdA
bWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19jcnRjLmMgfCA4ICsrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19jcnRjLmMNCj4gaW5kZXggN2ZlMjM0ZGU4M2EzLi5hMWZiNmM2NzY4MWQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+IEBAIC00Miw3ICs0Miw3IEBAIHN0
cnVjdCBtdGtfY3J0YyB7DQo+ICAJc3RydWN0IGRybV9jcnRjCQkJYmFzZTsNCj4gIAlib29sCQkJ
CWVuYWJsZWQ7DQo+ICANCj4gLQlib29sCQkJCXBlbmRpbmdfbmVlZHNfdmJsYW5rOw0KPiArCWJv
b2wJCQkJbmVlZHNfdmJsYW5rOw0KPiAgCXN0cnVjdCBkcm1fcGVuZGluZ192YmxhbmtfZXZlbnQJ
KmV2ZW50Ow0KPiAgDQo+ICAJc3RydWN0IGRybV9wbGFuZQkJKnBsYW5lczsNCj4gQEAgLTEwNSw5
ICsxMDUsOSBAQCBzdGF0aWMgdm9pZCBtdGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKHN0cnVjdA0K
PiBtdGtfY3J0YyAqbXRrX2NydGMpDQo+ICBzdGF0aWMgdm9pZCBtdGtfZHJtX2ZpbmlzaF9wYWdl
X2ZsaXAoc3RydWN0IG10a19jcnRjICptdGtfY3J0YykNCj4gIHsNCj4gIAlkcm1fY3J0Y19oYW5k
bGVfdmJsYW5rKCZtdGtfY3J0Yy0+YmFzZSk7DQo+IC0JaWYgKCFtdGtfY3J0Yy0+Y29uZmlnX3Vw
ZGF0aW5nICYmIG10a19jcnRjLQ0KPiA+cGVuZGluZ19uZWVkc192YmxhbmspIHsNCj4gKwlpZiAo
IW10a19jcnRjLT5jb25maWdfdXBkYXRpbmcgJiYgbXRrX2NydGMtPm5lZWRzX3ZibGFuaykgew0K
PiAgCQltdGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKG10a19jcnRjKTsNCj4gLQkJbXRrX2NydGMt
PnBlbmRpbmdfbmVlZHNfdmJsYW5rID0gZmFsc2U7DQo+ICsJCW10a19jcnRjLT5uZWVkc192Ymxh
bmsgPSBmYWxzZTsNCj4gIAl9DQo+ICB9DQo+ICANCj4gQEAgLTU3MSw3ICs1NzEsNyBAQCBzdGF0
aWMgdm9pZCBtdGtfY3J0Y191cGRhdGVfY29uZmlnKHN0cnVjdA0KPiBtdGtfY3J0YyAqbXRrX2Ny
dGMsIGJvb2wgbmVlZHNfdmJsYW5rKQ0KPiAgCW11dGV4X2xvY2soJm10a19jcnRjLT5od19sb2Nr
KTsNCj4gIAltdGtfY3J0Yy0+Y29uZmlnX3VwZGF0aW5nID0gdHJ1ZTsNCj4gIAlpZiAobmVlZHNf
dmJsYW5rKQ0KPiAtCQltdGtfY3J0Yy0+cGVuZGluZ19uZWVkc192YmxhbmsgPSB0cnVlOw0KPiAr
CQltdGtfY3J0Yy0+bmVlZHNfdmJsYW5rID0gdHJ1ZTsNCj4gIA0KPiAgCWZvciAoaSA9IDA7IGkg
PCBtdGtfY3J0Yy0+bGF5ZXJfbnI7IGkrKykgew0KPiAgCQlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSA9ICZtdGtfY3J0Yy0+cGxhbmVzW2ldOw0K

--__=_Part_Boundary_005_41094127.189218815
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO01vbiwmIzMy
OzIwMjQtMDItMjYmIzMyO2F0JiMzMjsxNjo1MCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmVuYW1lJiMzMjsmcXVvdDtwZW5kaW5nX25lZWRzX3ZibGFu
ayZxdW90OyYjMzI7dG8mIzMyOyZxdW90O25lZWRzX3ZibGFuayZxdW90OyYjMzI7dG8mIzMyO3Jl
ZHVjZSYjMzI7dGhlJiMzMjtjb2RlDQomZ3Q7JiMzMjtzaXplLg0KDQpJbiYjMzI7bXRrJiMzMjtj
cnRjLCYjMzI7bWFueSYjMzI7dmFyaWFibGUmIzMyO2hhcyYjMzI7cHJlZml4JiMzMjsmIzM5O3Bl
bmRpbmcmIzM5OyYjMzI7dG8mIzMyO2luZGljYXRlJiMzMjtzb21ldGhpbmcNCmhhcyYjMzI7bm90
JiMzMjtiZWVuJiMzMjtkb25lJiMzMjt5ZXQuJiMzMjtUbyYjMzI7YWxpZ24mIzMyO3RoaXMmIzMy
O25hbWluZywmIzMyO0kmIzMyO3RoaW5rJiMzMjtpdCYjMzk7cyYjMzI7YmV0dGVyJiMzMjt0bw0K
a2VlcCYjMzI7dGhpcyYjMzI7cHJlZml4Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsm
bHQ7DQomZ3Q7JiMzMjtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29t
Jmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfY3J0Yy5jJiMzMjt8JiMzMjs4JiMzMjsrKysrLS0tLQ0KJmd0OyYjMzI7JiMzMjsxJiMz
MjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NCYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzQmIzMyO2Rl
bGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzdmZTIzNGRlODNhMy4u
YTFmYjZjNjc2ODFkJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfY3J0Yy5jDQomZ3Q7JiMzMjtAQCYjMzI7LTQyLDcmIzMyOys0Miw3JiMz
MjtAQCYjMzI7c3RydWN0JiMzMjttdGtfY3J0YyYjMzI7ew0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3Qm
IzMyO2RybV9jcnRjYmFzZTsNCiZndDsmIzMyOyYjMzI7Ym9vbGVuYWJsZWQ7DQomZ3Q7JiMzMjsm
IzMyOw0KJmd0OyYjMzI7LWJvb2xwZW5kaW5nX25lZWRzX3ZibGFuazsNCiZndDsmIzMyOytib29s
bmVlZHNfdmJsYW5rOw0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RybV9wZW5kaW5nX3ZibGFu
a19ldmVudCpldmVudDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7
ZHJtX3BsYW5lKnBsYW5lczsNCiZndDsmIzMyO0BAJiMzMjstMTA1LDkmIzMyOysxMDUsOSYjMzI7
QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcChzdHJ1
Y3QNCiZndDsmIzMyO210a19jcnRjJiMzMjsqbXRrX2NydGMpDQomZ3Q7JiMzMjsmIzMyO3N0YXRp
YyYjMzI7dm9pZCYjMzI7bXRrX2RybV9maW5pc2hfcGFnZV9mbGlwKHN0cnVjdCYjMzI7bXRrX2Ny
dGMmIzMyOyptdGtfY3J0YykNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjtkcm1fY3J0
Y19oYW5kbGVfdmJsYW5rKCZhbXA7bXRrX2NydGMtJmd0O2Jhc2UpOw0KJmd0OyYjMzI7LWlmJiMz
MjsoIW10a19jcnRjLSZndDtjb25maWdfdXBkYXRpbmcmIzMyOyZhbXA7JmFtcDsmIzMyO210a19j
cnRjLQ0KJmd0OyYjMzI7Jmd0O3BlbmRpbmdfbmVlZHNfdmJsYW5rKSYjMzI7ew0KJmd0OyYjMzI7
K2lmJiMzMjsoIW10a19jcnRjLSZndDtjb25maWdfdXBkYXRpbmcmIzMyOyZhbXA7JmFtcDsmIzMy
O210a19jcnRjLSZndDtuZWVkc192YmxhbmspJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO210a19jcnRj
X2ZpbmlzaF9wYWdlX2ZsaXAobXRrX2NydGMpOw0KJmd0OyYjMzI7LW10a19jcnRjLSZndDtwZW5k
aW5nX25lZWRzX3ZibGFuayYjMzI7PSYjMzI7ZmFsc2U7DQomZ3Q7JiMzMjsrbXRrX2NydGMtJmd0
O25lZWRzX3ZibGFuayYjMzI7PSYjMzI7ZmFsc2U7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMy
OyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyO0BAJiMzMjstNTcxLDcmIzMyOys1NzEs
NyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2NydGNfdXBkYXRlX2NvbmZpZyhz
dHJ1Y3QNCiZndDsmIzMyO210a19jcnRjJiMzMjsqbXRrX2NydGMsJiMzMjtib29sJiMzMjtuZWVk
c192YmxhbmspDQomZ3Q7JiMzMjsmIzMyO211dGV4X2xvY2soJmFtcDttdGtfY3J0Yy0mZ3Q7aHdf
bG9jayk7DQomZ3Q7JiMzMjsmIzMyO210a19jcnRjLSZndDtjb25maWdfdXBkYXRpbmcmIzMyOz0m
IzMyO3RydWU7DQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsobmVlZHNfdmJsYW5rKQ0KJmd0OyYjMzI7
LW10a19jcnRjLSZndDtwZW5kaW5nX25lZWRzX3ZibGFuayYjMzI7PSYjMzI7dHJ1ZTsNCiZndDsm
IzMyOyttdGtfY3J0Yy0mZ3Q7bmVlZHNfdmJsYW5rJiMzMjs9JiMzMjt0cnVlOw0KJmd0OyYjMzI7
JiMzMjsNCiZndDsmIzMyOyYjMzI7Zm9yJiMzMjsoaSYjMzI7PSYjMzI7MDsmIzMyO2kmIzMyOyZs
dDsmIzMyO210a19jcnRjLSZndDtsYXllcl9ucjsmIzMyO2krKykmIzMyO3sNCiZndDsmIzMyOyYj
MzI7c3RydWN0JiMzMjtkcm1fcGxhbmUmIzMyOypwbGFuZSYjMzI7PSYjMzI7JmFtcDttdGtfY3J0
Yy0mZ3Q7cGxhbmVzW2ldOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_41094127.189218815--

