Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98398937DC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 05:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5BB10E4F4;
	Mon,  1 Apr 2024 03:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kTuq2Z7W";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KPBv78s3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49B10E4F4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 03:44:42 +0000 (UTC)
X-UUID: 2a677692efda11eeb8927bc1f75efef4-20240401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4SiAXOjul1M3UlNDTRJbCjyI5qegwVj1r1gvrUCcvTU=; 
 b=kTuq2Z7WaEb06ZQOaK97R7MmugvGeZNBNZAyOTSBYxejBeqJ0J7oEzgJbtJT1GGQrm2uSbqP82v416FA+SBMgi2iwlZ3jjlrOprpudG76z3DothquLFgHmU4j5TZMyIXfaGzpxy5/rCsfRY7CnhB6GAQmPv11EqTgHEIudk8n2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:4774d951-d25a-4cf0-9dec-f74d0c5839d7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:41728d00-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2a677692efda11eeb8927bc1f75efef4-20240401
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1740624786; Mon, 01 Apr 2024 11:44:38 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 1 Apr 2024 11:44:37 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 1 Apr 2024 11:44:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcZeBazyqKJUyaHR0/FTz9tRGZGGIG+cZgrJhiXPuAlIElJg14eBrr1WloShP5PJ6O5EwsdonMoM3WCd5hOkFoOF7GSV1Cg4nZYKdBVsqDQiOBjEXN7CFwtFWV9Pj8uvv5z4xX50QcGxoM0ufFiIz8ik3q6i7bHtydi9yfig7NbzqcwqstEne0c4W4tyfMmUyc/oaRi4gWefAHV41LEo+GOuNGjy0vfTomrtJk3lC2uyF5PrXxH9alSuGHYOYpduOAKfbf1uKPVmDMnpDkwOf1EhYiOQQFfy3SblYxRlE6WQt2gmZQVAc9o3CxTUdpx4QowWYDXKUuttyLJo0MXQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WduwDYL350ZtcVKnskOQYvq1t6TcG4ARYKWyBv2n36g=;
 b=HP1z8ALGf3dyHutyu0LCxHyVMstmCHGrPnagJOmPAnIxZvtliKGxTlhlWk+ut6rMkR3eEeHlyuhVw2lQMMaEnfVYKT5+LWTyGZuLW88KX6U0U0qtvoJAwGaCcNProwJh5aHrcgTKj2tRzpqDqspsEabezvL+ZDdPyWAB3VqQap/TUKbKXbCfGfKe3FvZkiQN/p+gQ3ER6mudUZdNV66UkW7DZCXX2EXh5DS8bMu/FyDpZiAUEzAehf7wEc40z5UuQHPapxAbZSn120LJnraQ+VqNtHC5g9HjpdlaFP7UmgT4MF7INHoQBJzXn1O3zDLa57+uki9v0piTvO24CAzFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WduwDYL350ZtcVKnskOQYvq1t6TcG4ARYKWyBv2n36g=;
 b=KPBv78s3B1wTPDHRNRXk+15rRimdobqEYvspov7CMW1CFuy7acXBQiOkO5POWf+grEg0eSpGbnPS4hRf26s9qCNNVYQM0ENIDbNfqOyo4LpFydZ36ayjcNMua3ORVxc+dHFXxj6nOmbXAHL3OKZO0BHezmqeON5hsrKCgUUxL1s=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6587.apcprd03.prod.outlook.com (2603:1096:4:1d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Mon, 1 Apr
 2024 03:44:35 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 03:44:35 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 01/11] drm/mediatek: aal: drop driver owner initialization
Thread-Topic: [PATCH 01/11] drm/mediatek: aal: drop driver owner initialization
Thread-Index: AQHaguMPYzlN7nTIpU2lb32BpYpEIrFSyAwA
Date: Mon, 1 Apr 2024 03:44:35 +0000
Message-ID: <48612f68a7e7b6aab0c6d5cbc77d85b1389f4591.camel@mediatek.com>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
 <20240330-b4-module-owner-drm-mediatek-v1-1-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-1-fd5c4b8d633e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6587:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z9d7lkJeiidv8/0Vh4knPAfNHHgUkguNZbI9DYV1eSCdNTO/Ky/L6Mr6vzaD3vIj44bv0FYM7aCQUuHJ5fD293+xna3ZGmBeiBhCmIYcz6BKhqbf1MayZl/yf1NU6YjMlWKjuOMzqyNAmg9ay5R98JjCYk78WT3bboPgBsaJrmZ7FrT1xVtef6fPLEwEIsFWDvgt0cEhIgiY5orM65vR9Qd6PWZok6LWFRRCqnd/zzpwljGGE/5QnjJZMbHWgcaAN04Stp/VUrYVJVMsShUHA3lcxjxIiuDfs0wA0ZwTVaHpGvpRr81q9jDKtxWafPwwsFAa9ZZxGSBpKMG7T4Z3B2MoEuTfklJybKD6HD+Lne/5UpCXfbzVazzEALBDiWouFb8MuJVTFAlSSI67vNhBa0l9VnpMfKuCg13dT0kAMizR53FQdOsUiqcieLvpMh4r2FIY+vDtCRTEkC/QB7PFaklH5u59F2QDAcVqcpgEzBdINFFztfmCZEklzBknP47BRJx06PO500nTkngd3EidESwjNb7TUB9zTzPvxN+x+hH7CZt+hOVBEIfdVTjVVRTbucYEC3cd0NQgt4zAhNA08mXxIGl3QI6TuSU+B0izHYwBFug/pUzxXzgYJfg7tGLnAkmT8Zw1RckYQeNdQRW5X5HdyNwTOLq5eB2dIxxz8Xo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGVlTDR0MHVxYlRHc2Z0V3NKRWFoQmw5YWZXalRwY05oTHMyRmNwbVRXcC9C?=
 =?utf-8?B?dnFkbkEvSGJrODhlNlVTeUNURkVoMUNhV1c2c3Ira0xVVGN2WVpNSXQ1NlZF?=
 =?utf-8?B?ajA2L1FlWXRJNkxyYkIvOHVIcDNUZ3hheHB0YlFwTE8rUll0Z0N1RmpWeDli?=
 =?utf-8?B?aHI0elpoK2RHOHZ2RWRtSWkvdTBobktPY2J2cUloMFoxbUZlYU54alNZTG1a?=
 =?utf-8?B?aHR0OFNJTTU4UEp4V2lBdU9qbkQvOFlIc0lieCtoOHBXdjRLZ1JFSGpRM09s?=
 =?utf-8?B?b1lYeXQ5QjM1KzBnRzhKeDEyRkRqcXB2eUJiaHIvREZ6dlR1L1ZMbFhXMWNt?=
 =?utf-8?B?MytzRVNMRzlnTjB3RklJYk9qL2xPL1FMNlVuMnRzd2FXd2FHZWdMMTZrMkZm?=
 =?utf-8?B?MnZ1eXJSeXhnd3EzdWt3elpwdXJZUjliVUVFWlZ0SW9GVCtTWHUrMVdnek9o?=
 =?utf-8?B?eXZ0Y2MzUVlxbzVmZms1eFEzUTB4YitqbVdNem5hQTZSczgvdWxrNlpBak5D?=
 =?utf-8?B?UmhBbHBrcVJzalplRHp1di9SVXpUeG1PdFhXNktibklnY01FcVZmZnRIOGFK?=
 =?utf-8?B?aXMyZkVyU2laNWVIQ0EyUGJmcVVOWllDN1FDakY3RkFCSjFXRkN5SjJYZVJ6?=
 =?utf-8?B?Q1VyNk1KK2pHcVZGV2dGZFVGa2pWWDNrNW95RWZ2Q3BiWW1PYktUeXJIQ3RB?=
 =?utf-8?B?SnBEM0xXZldvZ2dPajdpeitsR3NjREJyUTNWRnE3SWFUZ2w1YUliMFZkT01K?=
 =?utf-8?B?a3hxOHBqWWpsTUlrZHdCL2lQckNVRWlCWUZHZVdwZVRzSjRJYlk1R3ROSXdJ?=
 =?utf-8?B?Rmx6cUM4aUhlbEpGYklVRHBReW9ZS0hycDEwZVBMeGNxenhVQk1ZQmNaMGFM?=
 =?utf-8?B?ZU5Xb2dWbGZsWW9wQXFUTjYvSzNvZk9aei9FNXlXTTlvWlVqSk5TOXkwakth?=
 =?utf-8?B?QnR4bjUzeHREN3pHSStLcHAzUEIvaHUzZUVvT0k2UDhkRlhOTnBDY2gyUkEx?=
 =?utf-8?B?MlJpcDA2b0tVaSt0elkyd2xiRnZyQjRBZExoNThmV213d0IvLzhPV0I5dDNk?=
 =?utf-8?B?QlRUTXNDOEtvKzRheFZ0c3pEZmVKdkE4YTNXMzFCRnlFZmRNTDk2Y2dDRTlo?=
 =?utf-8?B?V1N5cGZPMEZDMlRMeHp4c01tcXZ3bDZYZ1NrbWNXVEc3bndzUXpGbGl2aTJr?=
 =?utf-8?B?VkVNTXNaUEdHbi9LaTJsV09YbytaQWVQKzZ0dlYvNzk3dFRwbmxmWHBpODFR?=
 =?utf-8?B?YmZ6VFUrUmxJaCtFSzdhMFpCdUp1TjBEaEx0UWpmLyszRFN2TUQ3cW5nTkNQ?=
 =?utf-8?B?TnNhL1NHNUZvRklqVnh6ZFpuVmFXK25HSEFtMG5veEcydkFSQVFqV3NFUENz?=
 =?utf-8?B?bCtDL3paejR5UEx4ZEp1TnhoQmpLMEd6RnZFdTZJb2ZFcjRMMDhkbTkzQzgr?=
 =?utf-8?B?NnBDOGprYmlXc3htTEh0T1BKa2VzU1hXNVF4RFFnY1k3Q0pBL3gzUS9HS24v?=
 =?utf-8?B?M2FSM0RxS0dLYUorRHlJNTdaZzd4N0ZTSSsyc3h6ZUcvY0I4VmI4NXpwcjRE?=
 =?utf-8?B?RDRyRDZjSGNELy9QQUwvanhWV21MZWNkY1hsZExlbGdqMVlOeGsvTGtIeXEv?=
 =?utf-8?B?T0VMS1pNZUl2bkxnZmhFZU8yTzlxYjVuWHJMV3NJTFprVjJGTTZFZkJ6alFD?=
 =?utf-8?B?SVdMTFVOMDAxL1NlbWxQNUpmdkNGQlU2bUk0bjBwTWgwMERMbXdCTVNhc212?=
 =?utf-8?B?L3N1RnNGWHd0Vzc0M0lnTzJCMk9xYW9IZDdzVlFXUUkvUFZBOXM1SXB2ZVlz?=
 =?utf-8?B?R2k5Z2N1VlBHTnhLYlhFNUpYWEcya3BBYkNJY2krOHBkcm0yTW9vZ0ozREJX?=
 =?utf-8?B?RUhQUGdJaFlVb284NzMwYjI2K0RXNEtucVhLK0p5bWZGajFBSmV1M0hrVEFm?=
 =?utf-8?B?VC9tRnloTzBmQjJ4NGhMT2pRa2paWmo2N3RobXNnMkgwNVE4bEhpTUVKaGNJ?=
 =?utf-8?B?dFhCMU5yREc0Ujd5L1JxRkZzVCt6bmgyaThIWW1YNlNtWUR6QnErYzZ2MUlV?=
 =?utf-8?B?YkZhQXgxazdFWmMxQkZ0ZU5ldmpOQkxwZHlHanZTOHlyV01MTXF6cEJvVTlq?=
 =?utf-8?Q?csBfnuN32e3PqcNqQiTaiv4bL?=
Content-ID: <F01D1BE7AA50DE478127C7D0CD3AC949@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545a359a-6675-421f-fd01-08dc51fe0c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 03:44:35.0498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SA7ktg/OOEayLOeJoqctX/Uw2EFwk+GgGgjhyvKPWti+yjCsUBc4ZHP883IquYbSJg+Dh+3UL7Z5zQo5QnTHZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6587
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.911800-8.000000
X-TMASE-MatchedRID: VPleTT1nwdQOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0r/XD0CNJ3fxLMywGOaB4QQtxwPIeWtDDmMzqVg0D8iD1c/CedjlcvkzxK
 vLM0IxWTukyFek1X/B3F5zpucqy2iWbvYSwAXzZAD2WXLXdz+ATFcf92WG8u/Z5yuplze9pt4TT
 ZA00QEU+LzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7bkV4e2xSge6HamKtoE1Pv5q6Z
 cGt3il1/oLbaTqCtzL3wHwQi9XR4AkrYwrjkf4Y
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.911800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AC5CAF1307FE7179418CA456D5E5C2EA7A7A0D161494BD94C1250DF10CDBF1562000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_540942834.1819214985"
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

--__=_Part_Boundary_002_540942834.1819214985
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEtyenlzenRvZjoNCg0KT24gU2F0LCAyMDI0LTAzLTMwIGF0IDIxOjQzICswMTAwLCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2Ug
ZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUg
dmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIENvcmUgaW4gcGxhdGZvcm1f
ZHJpdmVyX3JlZ2lzdGVyKCkgYWxyZWFkeSBzZXRzIHRoZSAub3duZXIsIHNvDQo+IGRyaXZlcg0K
PiBkb2VzIG5vdCBuZWVkIHRvLiAgV2hhdGV2ZXIgaXMgc2V0IGhlcmUgd2lsbCBiZSBhbnl3YXkg
b3ZlcndyaXR0ZW4gYnkNCj4gbWFpbiBkcml2ZXIgY2FsbGluZyBwbGF0Zm9ybV9kcml2ZXJfcmVn
aXN0ZXIoKS4NCg0KRm9yIHRoZSB3aG9sZSBzZXJpZXMsDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8
Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jIHwgMSAtDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9hYWwuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9hYWwuYw0KPiBpbmRleCA0MGZlNDAzMDg2YzMuLmY2ZjJjMjRhYmM5MyAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KPiBAQCAtMjIzLDcgKzIyMyw2IEBA
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX2Rpc3BfYWFsX2RyaXZlciA9IHsNCj4gIC5yZW1v
dmVfbmV3PSBtdGtfZGlzcF9hYWxfcmVtb3ZlLA0KPiAgLmRyaXZlcj0gew0KPiAgLm5hbWU9ICJt
ZWRpYXRlay1kaXNwLWFhbCIsDQo+IC0ub3duZXI9IFRISVNfTU9EVUxFLA0KPiAgLm9mX21hdGNo
X3RhYmxlID0gbXRrX2Rpc3BfYWFsX2RyaXZlcl9kdF9tYXRjaCwNCj4gIH0sDQo+ICB9Ow0KPiAN
Cj4gLS0gDQo+IDIuMzQuMQ0KPiANCg==

--__=_Part_Boundary_002_540942834.1819214985
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtLcnp5c3p0b2Y6DQoNCk9uJiMzMjtTYXQs
JiMzMjsyMDI0LTAzLTMwJiMzMjthdCYjMzI7MjE6NDMmIzMyOyswMTAwLCYjMzI7S3J6eXN6dG9m
JiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7
RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2Ns
aWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0K
Jmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMy
O29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0NvcmUmIzMyO2luJiMzMjtw
bGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoKSYjMzI7YWxyZWFkeSYjMzI7c2V0cyYjMzI7dGhlJiMz
Mjsub3duZXIsJiMzMjtzbw0KJmd0OyYjMzI7ZHJpdmVyDQomZ3Q7JiMzMjtkb2VzJiMzMjtub3Qm
IzMyO25lZWQmIzMyO3RvLiYjMzI7JiMzMjtXaGF0ZXZlciYjMzI7aXMmIzMyO3NldCYjMzI7aGVy
ZSYjMzI7d2lsbCYjMzI7YmUmIzMyO2FueXdheSYjMzI7b3ZlcndyaXR0ZW4mIzMyO2J5DQomZ3Q7
JiMzMjttYWluJiMzMjtkcml2ZXImIzMyO2NhbGxpbmcmIzMyO3BsYXRmb3JtX2RyaXZlcl9yZWdp
c3RlcigpLg0KDQpGb3ImIzMyO3RoZSYjMzI7d2hvbGUmIzMyO3NlcmllcywNCg0KUmV2aWV3ZWQt
Ynk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsm
IzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0tyenlzenRvZiYjMzI7S296bG93c2tp
JiMzMjsmbHQ7a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnJmd0Ow0KJmd0OyYjMzI7LS0t
DQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYyYj
MzI7fCYjMzI7MSYjMzI7LQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYj
MzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQm
IzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQomZ3Q7JiMzMjti
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KJmd0OyYjMzI7aW5kZXgm
IzMyOzQwZmU0MDMwODZjMy4uZjZmMmMyNGFiYzkzJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYj
MzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCiZndDsmIzMyOysr
KyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCiZndDsmIzMy
O0BAJiMzMjstMjIzLDcmIzMyOysyMjMsNiYjMzI7QEAmIzMyO3N0cnVjdCYjMzI7cGxhdGZvcm1f
ZHJpdmVyJiMzMjttdGtfZGlzcF9hYWxfZHJpdmVyJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMy
Oy5yZW1vdmVfbmV3PSYjMzI7bXRrX2Rpc3BfYWFsX3JlbW92ZSwNCiZndDsmIzMyOyYjMzI7LmRy
aXZlcj0mIzMyO3sNCiZndDsmIzMyOyYjMzI7Lm5hbWU9JiMzMjsmcXVvdDttZWRpYXRlay1kaXNw
LWFhbCZxdW90OywNCiZndDsmIzMyOy0ub3duZXI9JiMzMjtUSElTX01PRFVMRSwNCiZndDsmIzMy
OyYjMzI7Lm9mX21hdGNoX3RhYmxlJiMzMjs9JiMzMjttdGtfZGlzcF9hYWxfZHJpdmVyX2R0X21h
dGNoLA0KJmd0OyYjMzI7JiMzMjt9LA0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjstLSYjMzI7DQomZ3Q7JiMzMjsyLjM0LjENCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48
L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBN
RURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUg
aW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBh
bnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZp
bGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNh
YmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVz
aWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0
aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFu
IGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91
IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNl
bmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBh
bnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2ht
ZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQg
b2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEt
LX0tLT4=

--__=_Part_Boundary_002_540942834.1819214985--

