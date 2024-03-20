Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8573880920
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 02:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04E910E140;
	Wed, 20 Mar 2024 01:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Y96J36dR";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="kFf8eQzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78E410E2B0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 01:38:57 +0000 (UTC)
X-UUID: 9b7f9ce4e65a11eeb8927bc1f75efef4-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=n7GV3sM4MVAq9xmqrrKdfTjbPmWW8t/1CPC51j5FG+A=; 
 b=Y96J36dRzfsIGWEZVXauIA9PvwkwwPIi8zaWAAtaQwARhHW01zpm+dg1MlfNT71iZyY69PzrTCFH6EWbTIr3GrjMDgdv7iyCIJOhWUfcnrgggLwJ7jAUA5RFdhngoiH/0wqfcllJccVa4ANUJSZwQpAFJdLpSPqhzZ+3XbBzyjo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:ebd5b73b-890c-4e1a-8809-d6913d67711a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:a181b281-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 9b7f9ce4e65a11eeb8927bc1f75efef4-20240320
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1182691365; Wed, 20 Mar 2024 09:38:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 09:38:51 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 09:38:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWlJeTBf/ZSdNbG3qjy7avpal3laNpuWGyNbrZ73ib5UCdOW7+icjUjic1/g8J+S4sf2zXiBb2n05Ri1wVLIZtIm72H/wagsqLAMS2+t3iWIwqcydXjA+I1daE+uM6lHeI4hf6km1GlYLaT2rHxohVq/u4RLGZpPpFQfeiEa5lXPRKqgpmPwz0HCzCNvep3N+/Qt7VhPmsjwvDPo0TKcy6R9cpOeXVaCztO2g7LfvWZcaccGW7m/R940Sa3vkioEUGwoYod6MXBF5Qj5Z7GnKymXVQb+r8FU/8mX/52i/+Tc7vaYq8miPU3EwLaAwbFEWhWhYW/m8XKV/OGm/7t61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHxSuyVKv9wpM/x5gKryb779SYS+VHGtRWuTELOJk5M=;
 b=VfPnKr1sT/hdE82GdezmKDrnRrsIaDRK+AV1OV6a9kUqLpSTxyOyy7RyrK/5EktBx59NUbKQZCg6UHcLnbP/B0WCe6+5tWfE97fgXuJGk1WcPNC7vYwHA0L6xmMWn3WHf09tGcxAvvmBUaCN4f+MSYVMWaj+KMIeQqKILZL7YdC6Jzwu3iEDgegwxXRNdiH/bzGgj0sex4ulnB62svwn2VMRjN42sIFIas8dtvwkHmSmBfGqt/EceqtIg5aUZmUeIoP3yEK2Gb8nQmcqIca+ybSz5FCxzKGXdVqmG4+wT2ZeyBb1yydYzzARNcZxZ0VfCa6P6uj+QmrIhECiFG7byg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHxSuyVKv9wpM/x5gKryb779SYS+VHGtRWuTELOJk5M=;
 b=kFf8eQzXgBuVdeQBaMb9Ib3mxzaKzTLcjVuD9ES9JT0kpZWtK98aF6iAd2TtaV+S9VzoKHx/PLqkQicqY6cV5NqXZtA6xmHm3ycQlcSyoOPdYIBvMvQJ+rw1vyY4V5wH2xcmlE7YEpXVePwKOXfg9FtR6FcOfKiuQY3f/heV4q8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8638.apcprd03.prod.outlook.com (2603:1096:990:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.23; Wed, 20 Mar
 2024 01:38:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 01:38:48 +0000
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
Subject: Re: [PATCH v2 07/14] drm/mediatek: Rename files "mtk_drm_crtc.c" to
 "mtk_crtc.c"
Thread-Topic: [PATCH v2 07/14] drm/mediatek: Rename files "mtk_drm_crtc.c" to
 "mtk_crtc.c"
Thread-Index: AQHaecuwpYjArSGG4EG6vVFh+JpsHbE/2x0A
Date: Wed, 20 Mar 2024 01:38:48 +0000
Message-ID: <670e0d59d8cb49d4ed165e55b272fd33abd0d619.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-8-shawn.sung@mediatek.com>
In-Reply-To: <20240319070257.6443-8-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8638:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EO5V55zTZyz9VQkNfkSj8+fy7x5caQjRwiWuZPzRAmZd6P1UCCZUCSLir3+WPyqxOni8X7FpcIqrUaYrOnpmCamX3CC2UG5uO8403ExCaut/cdEXvk2uZwW07eVuwE1ZX/rR9a7u2f/YOlzXA2qRDvojYd/NDWIhiGpIMElemtT4GQ76Y5YOoI0LVGiNSLgvza2bHeKIvKkMvW4hgNX9ZV1sadZKCrQAOpU0gBIv07v6UJEHSo7fnD3qrfHWcZunDbC32FL1SBUWsRkROG5WKtiPoKGs2YrRBKlyRPwR2Fl8vdkQcTHmMdZaEEtvjRYs0/Cq/6DqNlJMoIJIwietMjqcrdGUxN7Rl2Yn8ntsXjFip4bflSrCkt0jeEPFZVXOQnAZd2I77GQKSF+eL82sobgsXCcLLy1Yk3ZSXi47vQppplO5T0AjEuURu65cY3vYQOfTHlODuMpcSX9fidF7Efur1lOQmP0e4w3xoon6ziul46W2wnyd7TZGW0/6Ok8wWRxFLtUgrsFCWp/pYUEYxPvh5dpxSp188mv4fsTTFA5RMWz+wTuMV7jGhj/HpwfjR1yH/g5szuv9dJj/xTXtGakFSrJ9JvpkLa8dagIazfL0XB6kIhyGn78epGKzbCLkuINQ/sBIgDc4OoviXkwYtHhqY6dT4WbMBXuVX8jEAJM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djdsRkJlRnRiLzEvMXJVaStmaXBDZUN2NEtsOElhMnBvTkpGRzFYa3RPZUJw?=
 =?utf-8?B?R2k2aUNJcmQyUnlsbWJUdTBQRjNoek1qWXB3NFdvaGx0bTF2WjNKbWduaWs5?=
 =?utf-8?B?ajJMWkJkbjdCa2Myd1c5WGhBdjVXZTNXMkFLWjI1U05RWXFrSWQxQWQ4Vlk1?=
 =?utf-8?B?eVpPcE5FRFRacVQrc3pNUkZKNU9BaGd1aFdCNHlrcmdJdkhKT3ozSTR2d0Vy?=
 =?utf-8?B?eDlLeXhHcmlxUlNibFdCSktRUFFqKzFjS2RsQmxXMGhuYTZYYVZTVVhLeGxn?=
 =?utf-8?B?NVZqT28rVm9mdVJSclZUckw5SU44NmQrbWE0YkNNZXovMkx0KzhXSi80TUwx?=
 =?utf-8?B?eXBDdStONmVjQU5SNllCUlRQSm5TaXJXUUhkSGhMQVlZSnFXQ0hFWTNJT2pi?=
 =?utf-8?B?RElsbEdUTk9sVCtST2ZJdHRFZXZnMytYbFRSb2drWk1VNzJGaWdyTUlJU1JC?=
 =?utf-8?B?Q3NQOEN1UWtwbkg0azdLeWVVaU5uNzhsdUREZ1BYVTRXdGhyVHV5QkxSSkY3?=
 =?utf-8?B?MmpvQjNZTG16UHVJM08vZElab3A5NmNIQzR3SzdYRGU5dkRvZzZjcmlzWVNO?=
 =?utf-8?B?dzN6OXNDci82a0ZXbjhQZzBKakJKMUNEcHFkVDFrajJtcXU1VlcycExjWlFL?=
 =?utf-8?B?MlNyek5yVDNjWjZSdXF3MXhyZDNERERCUHRibldoaTJNWExIU0wvTElmWEJZ?=
 =?utf-8?B?Y00rdnFmY1ZKQ3kxTlIyeThtWkpCWkN6ZzBnUmQxdjB5czUwQzFENFZjV1c2?=
 =?utf-8?B?aSt4a1VNZ0o2c0s1d0dkSTMvOUV1YTV5YWd3Szd6VXltNnlpSzFYMFczTUtG?=
 =?utf-8?B?bnh4WlRLeUZNMjlxd0VTRnNHQzRnUlVyc25qem5NQ3ZDWlNFalo0RHo0c3k3?=
 =?utf-8?B?TDN5MWpnUnJEL2lOeEFMQ2NiNUZ4UFp3ZmVxMmphOC9YR2gybHRYOGpqVEhU?=
 =?utf-8?B?aWJ6SE5jdE9nQjAyQ2NFQjBLOHRJUjBGOXpNRG5EdkE4ZmdxWDV4QVpNaEhO?=
 =?utf-8?B?azVPdjE2VDErYmNrRzh0Qk5LV2FJeTFFOU9WN3Nwd3NESlFJbUREbDczZHRS?=
 =?utf-8?B?UkVQMG1qMkl0WjdOR091K1g2aURjVHRRdDViOG5UL2tBR0MrNTV1QVpTWitI?=
 =?utf-8?B?TmwvWis0ZkRraDBPb2R5RDEyMEZrMjkvM2hSS0RTeHhnMHZxOFN0d0o5RHFt?=
 =?utf-8?B?d1RuMWMwcmFpRDRwM1A1Z3dRVWJuR1AzZlNOd2d5ME9TdUJOK3J5ZG8vZElG?=
 =?utf-8?B?T3UvSzVKcHhUSzZiK2FsZ3dlYXJ1SDd3VFJzOU9FYXVZUzZEWjRGRlhYUEQz?=
 =?utf-8?B?eWpQUDhWVHBzRE1NaHZmdlpaNHNtdjQrN085ejIzc1ZKSk9ybDNlSkZ4ajBS?=
 =?utf-8?B?clJCa2hleEhYc1BiRWVqQks4emU1REhGbXJaRjRIcDFHRzFKSFRZclI1YW5y?=
 =?utf-8?B?SUt4a2ZJQXFLRFVaTUhLU0dsRldvazBDZ0NwdXllK3h1VGVLVit6MXQ4aVU2?=
 =?utf-8?B?b0RQRVJLanZFMW5HUGQwZlJCbGxPQXdleUIveFlIZGV4a1RrUFAxSWhqYWQ3?=
 =?utf-8?B?aWVPQms0NHpXbHJ1MG9PbXQ2U0JKK0czcC9Rd2lrUVF2eC9KL2hDQ3ArYlI0?=
 =?utf-8?B?YWREbFcyalpMeEM3dkVlc0x5dERYRnJtbFRzUlllTVpTZER6V2ZDSXVVTUNN?=
 =?utf-8?B?Q3JOam84RWl6R2Q3Qm9TZk9IOFVsVzdtVkoxWjdjSEVtVG4vVjdMZy9wTkEz?=
 =?utf-8?B?dTU0a2ZKeHd1aUFCbVdnejFKVUFzNWEzbk91RXFJeXlpZUtTZGNIb1VXUE5S?=
 =?utf-8?B?RUx4NUMzTllFZEE5dDcxcnVOUEd4bXV4c21RQ3ZsSkFSdVh2emtzZWtSSnJF?=
 =?utf-8?B?V05ia2p4am5oeExBZEVUNnlmalppemd1Z1VRaXJKd0twMDJ4eFUwVHpIaWli?=
 =?utf-8?B?MFpQRTA4S2E1SXhaNmU5aE5Lc2NydGpmdk5kTkxiUERsVjZOTitac2tnVXRH?=
 =?utf-8?B?RGN1RWRMNStCM2V1ZzRjSGZwS3I0SFpGUzJGYTBPYTR4OEtDRXhFMWMrRFdN?=
 =?utf-8?B?TTZiRmpRNFM2WElhMy9tQjA0VGhwNU0zWWVONDAyK1NVYTFmYU9UcWtjUEFu?=
 =?utf-8?Q?jg/SMVCpeqws9mewqId2tJ3/f?=
Content-ID: <39F45CE3DD583D409D2835FEE1B93D43@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d91560-5770-4842-805e-08dc487e7d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 01:38:48.5952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1bIemOTbAfNYZOutSM0bWFUAW0u7qUUuG2NYWt54jcfKOOqD5055jT13izD/yeRZHDpJEqalC3OBmm5nsquUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8638
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.132500-8.000000
X-TMASE-MatchedRID: wQVy7q402w3+DXQl7XSOUia1MaKuob8PofZV/2Xa0cKSO6So6QGgysNq
 SYgiOmwd8cv4yT0rvGNUPHgTUudKRCUtdpGicV4RJO/EsSykoaBUENBIMyKD0cSiwizsgluQe6K
 2CVyTDuW7qpCSD8dpQpGTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPIfiAqrjYtFiRjdL
 qOPA8J9n+bRfUTypC4zt0fJNFVYCmPJlte8P00gn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.132500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BC218D1896DADD9D0C3E186E8883670C3EF741D71C340B61F4FD556DD24FF42B2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1318090110.2064487140"
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

--__=_Part_Boundary_001_1318090110.2064487140
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMTU6MDIgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgZmlsZXMgbXRrX2RybV9jcnRj
LmMgdG8gbXRrX2NydGMuYyBhbmQNCj4gbW9kaWZ5IHRoZSBNYWtlZmlsZSBhY2NvcmRpbmdseS4N
Cg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPA0KPiBzaGF3bi5zdW5nQG1lZGlhdGVrLmNvcnAt
cGFydG5lci5nb29nbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay97bXRrX2RybV9jcnRjLmMgPT4gbXRrX2NydGMuY30gfCAwDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gIHJlbmFtZSBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsve210a19kcm1fY3J0Yy5jID0+IG10a19jcnRjLmN9DQo+ICgx
MDAlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmls
ZQ0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiBpbmRleCA1ZTQ0MzY0
MDNiOGQyLi4wMTk4YjUwODIwZDRjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxl
DQo+IEBAIC0xLDYgKzEsNyBAQA0KPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MA0KPiAgDQo+IC1tZWRpYXRlay1kcm0teSA6PSBtdGtfZGlzcF9hYWwubyBcDQo+ICttZWRpYXRl
ay1kcm0teSA6PSBtdGtfY3J0Yy5vIFwNCj4gKwkJICBtdGtfZGlzcF9hYWwubyBcDQo+ICAJCSAg
bXRrX2Rpc3BfY2NvcnIubyBcDQo+ICAJCSAgbXRrX2Rpc3BfY29sb3IubyBcDQo+ICAJCSAgbXRr
X2Rpc3BfZ2FtbWEubyBcDQo+IEBAIC04LDcgKzksNiBAQCBtZWRpYXRlay1kcm0teSA6PSBtdGtf
ZGlzcF9hYWwubyBcDQo+ICAJCSAgbXRrX2Rpc3Bfb3ZsLm8gXA0KPiAgCQkgIG10a19kaXNwX292
bF9hZGFwdG9yLm8gXA0KPiAgCQkgIG10a19kaXNwX3JkbWEubyBcDQo+IC0JCSAgbXRrX2RybV9j
cnRjLm8gXA0KPiAgCQkgIG10a19kcm1fZGRwX2NvbXAubyBcDQo+ICAJCSAgbXRrX2RybV9kcnYu
byBcDQo+ICAJCSAgbXRrX2RybV9nZW0ubyBcDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2NydGMuYw0KPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUNCj4gcmVuYW1lIGZyb20gZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+IHJlbmFtZSB0byBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0K

--__=_Part_Boundary_001_1318090110.2064487140
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1R1ZSwmIzMy
OzIwMjQtMDMtMTkmIzMyO2F0JiMzMjsxNTowMiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmVuYW1lJiMzMjtmaWxlcyYjMzI7bXRrX2RybV9jcnRjLmMm
IzMyO3RvJiMzMjttdGtfY3J0Yy5jJiMzMjthbmQNCiZndDsmIzMyO21vZGlmeSYjMzI7dGhlJiMz
MjtNYWtlZmlsZSYjMzI7YWNjb3JkaW5nbHkuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1
JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Np
Z25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDsNCiZndDsm
IzMyO3NoYXduLnN1bmdAbWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20mZ3Q7DQomZ3Q7
JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxl
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O3wmIzMyOzQmIzMyOysrLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L3ttdGtfZHJtX2NydGMuYyYjMzI7PSZndDsmIzMyO210a19jcnRjLmN9JiMzMjt8JiMzMjswDQom
Z3Q7JiMzMjsmIzMyOzImIzMyO2ZpbGVzJiMzMjtjaGFuZ2VkLCYjMzI7MiYjMzI7aW5zZXJ0aW9u
cygrKSwmIzMyOzImIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7JiMzMjtyZW5hbWUmIzMyO2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay97bXRrX2RybV9jcnRjLmMmIzMyOz0mZ3Q7JiMzMjttdGtf
Y3J0Yy5jfQ0KJmd0OyYjMzI7KDEwMCUpDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0t
Z2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KJmd0OyYjMzI7Yi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMyO2luZGV4JiMzMjs1ZTQ0
MzY0MDNiOGQyLi4wMTk4YjUwODIwZDRjJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMyO0BAJiMzMjstMSw2JiMzMjsr
MSw3JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsjJiMzMjtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjom
IzMyO0dQTC0yLjANCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjstbWVkaWF0ZWstZHJtLXkmIzMy
Ozo9JiMzMjttdGtfZGlzcF9hYWwubyYjMzI7JiM5MjsNCiZndDsmIzMyOyttZWRpYXRlay1kcm0t
eSYjMzI7Oj0mIzMyO210a19jcnRjLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyO210
a19kaXNwX2FhbC5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2Rpc3Bf
Y2NvcnIubyYjMzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kaXNwX2NvbG9y
Lm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZGlzcF9nYW1tYS5vJiMz
MjsmIzkyOw0KJmd0OyYjMzI7QEAmIzMyOy04LDcmIzMyOys5LDYmIzMyO0BAJiMzMjttZWRpYXRl
ay1kcm0teSYjMzI7Oj0mIzMyO210a19kaXNwX2FhbC5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7bXRrX2Rpc3Bfb3ZsLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjttdGtfZGlzcF9vdmxfYWRhcHRvci5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7bXRrX2Rpc3BfcmRtYS5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjttdGtf
ZHJtX2NydGMubyYjMzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcm1fZGRw
X2NvbXAubyYjMzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcm1fZHJ2Lm8m
IzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZHJtX2dlbS5vJiMzMjsmIzky
Ow0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
Y3J0Yy5jDQomZ3Q7JiMzMjtzaW1pbGFyaXR5JiMzMjtpbmRleCYjMzI7MTAwJQ0KJmd0OyYjMzI7
cmVuYW1lJiMzMjtmcm9tJiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmMNCiZndDsmIzMyO3JlbmFtZSYjMzI7dG8mIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfY3J0Yy5jDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwh
LS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2Ug
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5n
IHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8g
bm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_1318090110.2064487140--

