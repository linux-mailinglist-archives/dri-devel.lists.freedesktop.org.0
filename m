Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D289BC4B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC20A1123AD;
	Mon,  8 Apr 2024 09:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="IYBwioLY";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Z+JgZTi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA6D1123AD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:49:30 +0000 (UTC)
X-UUID: 46d18bc0f58d11ee935d6952f98a51a9-20240408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=yZIvGXq0SHmlZBpYNunY+MJ6y0tMg2QxERn5sZbRY5w=; 
 b=IYBwioLYCNrJoA8qZPuqh6F2Bnp5w9fVaYaKnQCVqMxq3QZN5vz054nQ7Xmi97fxC/tJL3l/n92FM75fB21xD/QxtxPC5G8GvzLD/0UxWJyIhZNeeifDBcMMlEljt+q7Rhzkqk/e/lXDpgJCLdtCgHzl81R5Z3KUsu0nosSAxgc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:e7dced40-c422-4e2e-8fcd-00f1ce166894, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:12cc6a82-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 46d18bc0f58d11ee935d6952f98a51a9-20240408
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 676373278; Mon, 08 Apr 2024 17:49:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 Apr 2024 17:49:21 +0800
Received: from SINPR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 Apr 2024 17:49:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVaIPOixcQ9Y/GhRv0t5vSaHjPtlf2sVqX3f74JOSH+gazd2SLYde8jv5YX/+Tdw/UJasyE6gmJBTLdpfDwEzi0Hf9HSLuGAb2R+DMABLI2bRBeheVfW40XBZTF2cZ1SmUZJ6E0uurSWw/SOoErdRqpcAsV/LKy+SXLhn4eLA5lUhGWpTyi3ayu71Icsp7djE6GpY8kDSE6cGq6xqbbMFddb4jND2vdoz2Mk0o+m1rtFoGAhzlXcnwxKqLbiIl8+6ha80xZsZPC/Ownm6J5UasD3VRJexoB+p+sB/EiRjCYLcRtbshZfqP4lvoUkgtB5RTWXXckBySrT1pN+vw4HqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwBWMVdOmbivKq+TpJpiqomZTBhMYRsNWxrtvAJKMRw=;
 b=NoOvLeLji9jNuMFA9BlrcqDe57CkfvFfl7Nqs2V6qgQ0BxBC63zJtK7GnMseTLa5Dq/i2ltQHvwaHo4MHvkoaFLmrt9BtRt5h70iKCWkfAkqppGfsRRvH0tyEgxIL80rBg3AtwTJf0hWQE9m1BYBaBnwVLpe/5Lw8R1LO+gXJXiNtb5wNOyxu4OeZkfTYjOUpymki5iemFa7iy6WZf7BrFEKSB8c4DflB1yI8y6KjWgzQfnBT4Z8nZ3GLs1u/PJL+U2NdZQ8W1WbVt3nA16VsAGXXjMT47sV+6s9pnKx1ip8FGlX+cC0BBGUOWPATIZ9cfvyjSlc6Rr7MCHr9HZW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwBWMVdOmbivKq+TpJpiqomZTBhMYRsNWxrtvAJKMRw=;
 b=Z+JgZTi37ud90OEz0wdHhNhhNQQ4MQ9UX2o4VxbLBDPHGDNlKN07SEk+QEP1X7BKSdQouBXbGmxbX3cMBv8968vk0DY/35P2GMfAtesj81FfrxKCWg5sufKqoJEM7zM+NDVh4EMj+exwGtiy1oWmQmCEIP8DUiZiePubOFZ8+38=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7010.apcprd03.prod.outlook.com (2603:1096:101:b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 09:49:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 09:49:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "wmacek@chromium.org" <wmacek@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Add RENDER capability to DRM device
Thread-Topic: [PATCH] drm/mediatek: Add RENDER capability to DRM device
Thread-Index: AQHahNMKiD//QF7OJEuho/dn90M+ALFeKmUA
Date: Mon, 8 Apr 2024 09:49:18 +0000
Message-ID: <d4b15c6cdec777f8e930473983914ba52457a30d.camel@mediatek.com>
References: <20240402075352.3147747-1-wmacek@chromium.org>
In-Reply-To: <20240402075352.3147747-1-wmacek@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7010:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20BPkdS3wlRrKByyO3xiGVmBW8X9H0b9Hu8IN6bijgYvmvEuu4CQU8RAuscVIrUewfftcNEEesQuSIZFJZyohXiAXpm11FTjsbyu6rNjlyAAxPYs4ZndkzL/XgVS4pS3c4zuQDWrU9JdU3zHibhKQ00JmAx1fff3WdvhoFVXh2qpkPs3bJWmIraPmSZeyjgDjsaT+vC3CXOHsKfHrverZ5mDVRNfDrWxpvZTE0mmu9As6btdq/dfFQ424mrliQXZol+3ROSuqC3QBunY3dVPLmCQkXhgu5G6Q1PUOVVd5WdZAKcycoPQHi2WbXBbxWOiU3oBCPCvQ7QIh6u0LGevpmzGosl8kBbZrEuJZyE94lK9VdCWqrSuKq2F4SbPyhXIKAU4io5EJofefLhZUCo7ndNPiv96XAnzehCqM/gO0tzhvRw5YQCN8w716cVVVUNTjuEmQxqw9TcUSSpvzwoZBIe0rxy/qigqHmtvJx/OK+7jX0LwluASyhO6oLI5vFsXu/wJ/tl9tRRgAWGhyYs+DQbaQArilMIFATGDmqVmUla4T/Va3gZZYmbZvd1Rc6t/n3fP1YITbjeNAopG/iJYQhMan1PPyOvKWhxw17rsJZbG0u/qCHZrlAiU/+1zK9ekrCD2/8pA7VATjeYAzojl5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011); DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0dGcnZhWDM3VkFnQ3p1ZmFPa2hPZ3lBZDhqKzdCQVpkeWNxVm9rYXlmbXFy?=
 =?utf-8?B?T2t2bnJhMnZGN1hBcXpyYkNGTUVaQ05hZmd4S052cm5ISDBXVk5ncE03UGRK?=
 =?utf-8?B?dS95TTZFb0J3STM3N2FyMXg1dHd5WVZiV3h5OWNBSHF4QlN0SUNaZGNkbVhy?=
 =?utf-8?B?ekV1UEpITHJjeDFnaHcxVitVbWxjeHIvdDFJcGQzN1NCMHYyTmh3S0lGZDZW?=
 =?utf-8?B?bHRXOHkxYmR0dVpBakZld3Z2b2hRQ1dsTk9ZUHVrb2wvQnZScHo1UGNLY3NW?=
 =?utf-8?B?dUlrY1p4TlkvekxKTzdjVVNDKzNHTkM2QmxxWHBEamUyZ3l5RVlSSndSemIr?=
 =?utf-8?B?d0MrcGl3Y244c1NlUTdZY1NJbGVEdzc5MFJTTEEvOXJSb1RHdStUZFl1L0o2?=
 =?utf-8?B?Y2VYWUxXZUJoZHVWa3NhbGZkeUxpMHBMTzN4UDJ4b096b2NYSldreEZYcG00?=
 =?utf-8?B?cG55bHo5MUc3TlZpWnpyYVM3Y1lkUXlRRTVtMnJyRTVtUlpXVzhJYVB6RS9x?=
 =?utf-8?B?b1VIL3RtOFJZQ1p4eG5RQXVxMll3a2x1SFhCcmpCMURuMElNVURWaXpPYTVF?=
 =?utf-8?B?WTBRdWR3aEtyWWZManBIVG44MGJrNExQMENKSXc3R2loengvNTZMRC9Pekhr?=
 =?utf-8?B?cFdYdFhDRllYVmgzMW5acUpwMTdmcXdEaVF0VitzYmhKQklxZG5WcUl0a2lm?=
 =?utf-8?B?Ym9hTCtRTjFMdmpLWDZaU1c5Zm5wQkVnbm81Z3J3SlRYcFZFbkJsN05qdU1j?=
 =?utf-8?B?Ums2SnZzQmo4SnBrK2w1RkFCVUhJRjcrRDF1bzRjMXliNGFKZG5ON2FwYTdC?=
 =?utf-8?B?cjlyV2lXWnV2OGt0WXFQT05mNVVzVGJBVi9kTUJ1UU5ncjVsWi85VmI2VUhh?=
 =?utf-8?B?UTh4R2JTZmpsZHhwKzJNSUNWUWljRmN1VFIweEpvWnhBSC9OY09NUGRvb2k1?=
 =?utf-8?B?Q3Q2UllJenV2WlZGdVd0ZTdHODlLRzZsRnpMMjBqOTR0ZjRSQ1JZcEUxd0pH?=
 =?utf-8?B?WU4yWWNMZVQwWFhVdmRZajZJSzA4eDI5Z1RMY1VRMnpsN21vQTZVb2lGaXo4?=
 =?utf-8?B?QytCbVc4d1lSS2Y1LzNxSi9yOElZRzgveWEzMFB5MCs1UldpTkpEM2VGWEJt?=
 =?utf-8?B?QkJGU3BQWTBiVHpxNWptZ3Zrbjg3YnBxUDNLVlFDV1hSR1MvZW5zbzYzWGVQ?=
 =?utf-8?B?WjVacjJibkl5ZGFRMzFyZFN4cjVhdWVTOC9zZmtrRG5Ec3hvWmN3UkdlU3FR?=
 =?utf-8?B?RHZ1d0NsaU1lSzhBZFZhQVlFaFpzRVNQeUxZbmx5d0xyZWljaVA0K3YxWE9W?=
 =?utf-8?B?Rzg4RUIvQlVKMFhBN1VIUVlyQkxOVlZTTTNid1UvalAzSjhGM3FwTHFhMDEv?=
 =?utf-8?B?SE9sbTRMZTlXaituYkY4REhXcTIwU3FWYU4wV1RjVGk1R1ZQc1hKNEtQSWtC?=
 =?utf-8?B?QUxxNHRXQTRwNDYrWFZxMDZVUXFHTXAvUHp1R21HNTFvRHcwcjg3OHk4aWZY?=
 =?utf-8?B?R09US0hNVnU2R0JiT3J2ZVpJLytnRmtJdEJPRC9FL0xNYWJLWnBKK3N0VDJK?=
 =?utf-8?B?Y1gzaDhDWnY0SGJKK283NlpXbDNTWnJuZ0ZpUXFlVXA1VmxBRk45OGJIaXFk?=
 =?utf-8?B?M3NpVTR3RUI3ZjNOUXBFREtEa3NzSlN4WGgrL2lVZjNzMlFFelBERCsyTWxY?=
 =?utf-8?B?OFdjNnRiczBRNTFxa2NQQXljV1gvbWdNaXZBWEVlV0x0SFgzaFpGbDdiclZq?=
 =?utf-8?B?ZXlFamNpd0ROc1dieFBZOXovMU1oQjBUUmtUc29PdkswbGhMUEN5cG14b01F?=
 =?utf-8?B?Nmw3dlZzZTFNVUxDRW5hTjlleFh4cXJCUzFXUlpMdlZoR1RuUG5HRWsrQjBM?=
 =?utf-8?B?U0JBb1M2ME1kNW9NdUFtc3VwWmorQ3RqNUlkSHFSZ2JpNVBka3BxTlNmUE84?=
 =?utf-8?B?clhaSUZBMVA3R01BRmZ2cmFKWVcvNGtFZE1TaExMczJUM1lOczlrdG9LSGVC?=
 =?utf-8?B?TEYxVE93bzJtRzZmVVRWNVlPZXV5eDMxL3F0aHN3VEpyVUxPQjdtMVVNQ1Nn?=
 =?utf-8?B?dXZ4WDhRME85a3NxYnMrbUZxYXJiU0RTcUlteXUrU1ZRWE9TeE10a0RHeGsz?=
 =?utf-8?Q?H0bgl1qGDQui/ftb9mV3ghET2?=
Content-ID: <B8610B01B57A394B8568D85D836BDD44@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd84400-c3ba-4a73-01c6-08dc57b128eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 09:49:18.6643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNptbwWsp5ejyD7GJU0noyJCYv/8ZUFu1odWaBP/1Ssh90/9fRg9Qk1HJyAKxe9ZhPrMg0JPrFN2hKF4sxlo0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7010
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1906795870.325837272"
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

--__=_Part_Boundary_002_1906795870.325837272
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFdvamNpZWNoOg0KDQpPbiBUdWUsIDIwMjQtMDQtMDIgYXQgMDc6NTMgKzAwMDAsIFdvamNp
ZWNoIE1hY2VrIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIERSTSBkZXZpY2Ugc2hhbGwgY3JlYXRl
IC9kZXYvZHJpL3JlbmRlclhYWCBlbnRyeQ0KPiB0byBhbGxvdyBDaHJvbWVPUyBWTXMgdG8gYWNj
ZXNzIHRoZSBPcGVuR0wgcmVuZGVyaW5nDQo+IG9mZmxvYWQuDQoNCkkgdGhpbmsgdGhpcyBpcyB0
aGUgY2FzZSBEYW5pZWwgbWVudGlvbiBpbiBbMV0uIElmIHNvLCB0aGlzIHNob3VsZCBub3QNCnVw
c3RyZWFtLiANCg0KWzFdIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2Ry
aS1kZXZlbC9wYXRjaC8xNDUyNjExNzUwLTE2MjgzLTE1LWdpdC1zZW5kLWVtYWlsLXAuemFiZWxA
cGVuZ3V0cm9uaXguZGUvDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBX
b2pjaWVjaCBNYWNlayA8d21hY2VrQGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCA3NDgzMmMyMTMwOTIuLmFmYTRkNjM5MWIwOCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTU4NSw3
ICs1ODUsOCBAQCBzdGF0aWMgc3RydWN0IGRybV9nZW1fb2JqZWN0DQo+ICptdGtfZHJtX2dlbV9w
cmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIH0NCj4gIA0KPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIG10a19kcm1fZHJpdmVyID0gew0KPiAtCS5kcml2ZXJf
ZmVhdHVyZXMgPSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9HRU0gfCBEUklWRVJfQVRPTUlDLA0K
PiArCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9HRU0gfCBEUklW
RVJfQVRPTUlDDQo+IHwNCj4gKwkJCSAgIERSSVZFUl9SRU5ERVIsDQo+ICANCj4gIAkuZHVtYl9j
cmVhdGUgPSBtdGtfZHJtX2dlbV9kdW1iX2NyZWF0ZSwNCj4gIA0KPiAtLSANCj4gMi40NC4wLjQ3
OC5nZDkyNjM5OWVmOS1nb29nDQo+IA0K

--__=_Part_Boundary_002_1906795870.325837272
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtXb2pjaWVjaDoNCg0KT24mIzMyO1R1ZSwm
IzMyOzIwMjQtMDQtMDImIzMyO2F0JiMzMjswNzo1MyYjMzI7KzAwMDAsJiMzMjtXb2pjaWVjaCYj
MzI7TWFjZWsmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJu
YWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMz
MjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYj
MzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMz
Mjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0RSTSYjMzI7ZGV2aWNlJiMzMjtzaGFs
bCYjMzI7Y3JlYXRlJiMzMjsvZGV2L2RyaS9yZW5kZXJYWFgmIzMyO2VudHJ5DQomZ3Q7JiMzMjt0
byYjMzI7YWxsb3cmIzMyO0Nocm9tZU9TJiMzMjtWTXMmIzMyO3RvJiMzMjthY2Nlc3MmIzMyO3Ro
ZSYjMzI7T3BlbkdMJiMzMjtyZW5kZXJpbmcNCiZndDsmIzMyO29mZmxvYWQuDQoNCkkmIzMyO3Ro
aW5rJiMzMjt0aGlzJiMzMjtpcyYjMzI7dGhlJiMzMjtjYXNlJiMzMjtEYW5pZWwmIzMyO21lbnRp
b24mIzMyO2luJiMzMjtbMV0uJiMzMjtJZiYjMzI7c28sJiMzMjt0aGlzJiMzMjtzaG91bGQmIzMy
O25vdA0KdXBzdHJlYW0uJiMzMjsNCg0KWzFdJiMzMjsNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9kcmktZGV2ZWwvcGF0Y2gvMTQ1MjYxMTc1MC0xNjI4My0xNS1naXQtc2Vu
ZC1lbWFpbC1wLnphYmVsQHBlbmd1dHJvbml4LmRlLw0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7V29qY2llY2gmIzMyO01hY2VrJiMzMjsm
bHQ7d21hY2VrQGNocm9taXVtLm9yZyZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyYjMzI7fCYjMzI7MyYjMzI7Kyst
DQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyJiMzMjtpbnNlcnRp
b25zKCspLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYj
MzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZn
dDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMy
O2luZGV4JiMzMjs3NDgzMmMyMTMwOTIuLmFmYTRkNjM5MWIwOCYjMzI7MTAwNjQ0DQomZ3Q7JiMz
MjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsm
IzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0
OyYjMzI7QEAmIzMyOy01ODUsNyYjMzI7KzU4NSw4JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtzdHJ1
Y3QmIzMyO2RybV9nZW1fb2JqZWN0DQomZ3Q7JiMzMjsqbXRrX2RybV9nZW1fcHJpbWVfaW1wb3J0
KHN0cnVjdCYjMzI7ZHJtX2RldmljZSYjMzI7KmRldiwNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYj
MzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtk
cm1fZHJpdmVyJiMzMjttdGtfZHJtX2RyaXZlciYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7LS5kcml2
ZXJfZmVhdHVyZXMmIzMyOz0mIzMyO0RSSVZFUl9NT0RFU0VUJiMzMjt8JiMzMjtEUklWRVJfR0VN
JiMzMjt8JiMzMjtEUklWRVJfQVRPTUlDLA0KJmd0OyYjMzI7Ky5kcml2ZXJfZmVhdHVyZXMmIzMy
Oz0mIzMyO0RSSVZFUl9NT0RFU0VUJiMzMjt8JiMzMjtEUklWRVJfR0VNJiMzMjt8JiMzMjtEUklW
RVJfQVRPTUlDDQomZ3Q7JiMzMjt8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7RFJJVkVSX1JF
TkRFUiwNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyOy5kdW1iX2NyZWF0ZSYjMzI7PSYj
MzI7bXRrX2RybV9nZW1fZHVtYl9jcmVhdGUsDQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LS0m
IzMyOw0KJmd0OyYjMzI7Mi40NC4wLjQ3OC5nZDkyNjM5OWVmOS1nb29nDQomZ3Q7JiMzMjsNCg0K
PC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioq
KioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMg
ZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNj
bG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFu
ayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1906795870.325837272--

