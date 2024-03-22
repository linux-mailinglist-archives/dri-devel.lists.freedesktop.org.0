Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96699886966
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F1C10F39F;
	Fri, 22 Mar 2024 09:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fY5JhQwf";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ucJuRCq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62C910F1CA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:37:11 +0000 (UTC)
X-UUID: c0ab13bee82f11ee935d6952f98a51a9-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=cgzaG7FUdZ5TaZZ8pJIZhcbLCC0rGmz7r97a0onloo4=; 
 b=fY5JhQwfEMPsB8pxSqio8oJ3LG15TLaRzyOxLgvTghZBDd2GfDrFn0ekgF0sAF4PZCLEe3rzyEByr2UPtEcV8MRQ0L5fYUdFziZFzz5YgkdWakrxIB3yMn/J1P11IsHsWDsz5ArnEItVBmwg47C3BYlJa4q41VMupJlUMbpYbUE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:43ebda7e-c939-43d5-b344-e50066e0e2ed, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:b2653400-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c0ab13bee82f11ee935d6952f98a51a9-20240322
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1773152216; Fri, 22 Mar 2024 17:37:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:37:07 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:37:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ejd/2ffdrrG9VOcf92WuJgkYs2UngrIP4NcMHUtGhxPb43i5bOnIK6sfpkE7Nbr49aFdMoMYOClIRENlYhAO6/UafKQZzaU438dVTsDbAkfSDFYS/hoVvHQJtRss+k/qNTHPcMeFHDtPVTI5RI9KNMFGtx5sKBsrdxjw3Jf/7zHjyALiEDQX7YN3zIq4S4G2XGquFi6A1gd3GDHxqNYk1N/URdlkFNR+hhwG2WmmKwg7CQnijR0Dr9pnISQe/9DiCrX3Mci1tyxSgckxxKf7GMxnYE4sWPu4KDBN9In2QJwoXQKcL7wPYZq077bXqCuPLlRnR6qPBtFSIm7q6+E/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyHezhkpdlJiPZAvS1pa7vbOh6vLBh3da+VV/Ribx64=;
 b=HT9+JTpjJpcrb+od/yMfL42PDHEpuagsVFKg51BkaFjUjTk2+9+DwOkD2VDtGnpKj2cVFRgAkT4czJTC0zbVhZrFtvQIk266QnrayMvR3ZDFMvr8wmmLp4jzmWZdqKnA1TM35Hbd/8+IKy8U5u+9ZcczxxYwh5NYoQ2JqfxObMEny4mLy0tV+hDH7DxM1RzkbErukzFq2BdZTtNOIJQO8RLE3kuBZMMCUeQ/eR6JcX5ZcStV1DTajnT69hgCtE9cG57Xz7OlDl/6QfmpMBbL4Gs+4ifRrEGSqXxK7hA5R93i+z9NtVtuvgieLRE/ILLJ65nXEdUUAc113qBE7cUDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyHezhkpdlJiPZAvS1pa7vbOh6vLBh3da+VV/Ribx64=;
 b=ucJuRCq42IKQ7ubduNbMZjyBFGNSWf1lZftXdMgrMMz5T4FW4mcALwJtMJeVgAGHU6Ltrrsjb0/RlFD7KAFi+0nX15FARJPZkkzqTNbRPWyD0GZjhn68SO10IK0M9SUBa7/BalXHizTVq3UtTrHwi7TfcG6boZ3bYzmhS4wwEoc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7017.apcprd03.prod.outlook.com (2603:1096:820:b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 09:37:04 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.031; Fri, 22 Mar 2024
 09:37:04 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 07/14] drm/mediatek: Support alpha blending in display
 driver
Thread-Topic: [PATCH v6 07/14] drm/mediatek: Support alpha blending in display
 driver
Thread-Index: AQHafBntK1eS3jUZ3EWvRQZqG5LfxbFDgMmA
Date: Fri, 22 Mar 2024 09:37:04 +0000
Message-ID: <d170ccc1b2e6275cfc6df32f90d2c1b11295f019.camel@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
 <20240322052829.9893-8-shawn.sung@mediatek.com>
In-Reply-To: <20240322052829.9893-8-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7017:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TUALLbmtT4uTNhdLB7vyx+TMY7Nj+45kLQBT4W8JbbAyL3RcRuLmY3BNbvIxErPl0nKf70Cy1Y9s6o2CSBJJb1O8T0gsjaS3km5kqD5rSLID6c6BcmUnJC8hKQwEFg+B+cuOP1RTn1y9P7kGzp06XFz8FQHYbOkOGOhgSKl+V1ssEwXmdBmmEjHkbRk3YzlLIzKzjI9tCJwXnJd0SQKiskqX1x9Ww2vj/LH/z18nanPrDWZziSWfTbYe8eCMuI9/wOSUXtBmxAUL5tW4pIScPeQN2zZhC8/o1iumE8AqN35j674TxDhAy0IfB4WPyS32btLZev+fiNz12ft2e9TzlJbhG+0Z/VQrofEPwAxQmLfCJy75wTvGmn+r2iFV6/T3uCT8wobz/nQmIooHjW18dQ3ZCTMFbvmSuocCguTfVxOtpPik9Q+NN0R6FCDine3o/zIDPtMEJGpo/bI+UKqN+fsLpElRkr15WrsmFs0ygsF84LMesMuIPa9crfuXA7pYhgWfxdEFNiBZR26QhaAmJC6UKTGxhWzwGfSDWJRh00DWCCr2RMlOveSm1H/4nG1ockdjfsUKvBkBxsYmcrZqWb9HEWAi1t+j9J47k6kn57VPHp/zEHU1JO6siTgyVCnSlrVeYKgfkTvKRmMT9991uMW33VtwDS4k897L94H4d80=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVBkbnVncTVtTVVuZ0Zlb3FkTFNESDlEOUUwK083RTlIZ2xuQ21SNGVhWnhO?=
 =?utf-8?B?V3RLWG93cnFrK1REM0F5L2NaaEtGWmk5U0liZ0pFbWNWZTR6Z3dQQzJTbHJp?=
 =?utf-8?B?QXBBN1RYL0NOZ2xFT2FMVUNQU1RrZWtTa3B4dWlIck95NU82WGNHMmlCdkdm?=
 =?utf-8?B?Zit4N3NRZTUzOXQ2LzFXQ1N3UFRtV0FjUm92TERVbHAreUl2YmhFejMzbnI4?=
 =?utf-8?B?NW11ZTl1RE5ZTE1yYk5xaU1pNi9MZjVZNGw4T1JVNFhha3dqcGY3Yi9EUDFC?=
 =?utf-8?B?YVZ1N1RaTS85UCtUTUtiaFZBMjBUdkFjb1hIQlFXb1RWaml4Y2lxcEU2QXFG?=
 =?utf-8?B?Znl0WTdHRkJVdXZhUTlqdFV5OE1QWm0xZXEvcEJ0bTdnbEpLTTFReXZuVThU?=
 =?utf-8?B?eGl4bUFlM3F3WERlWjk0NzBQdFdyVVlmMUkrSmpjanQ3VEdWUHNxUzJwcVEr?=
 =?utf-8?B?dTNzZ2JZMjk0Y3ZhUWNJRGFqWFJEZHZObVZVTUFYSGgxSUJ1bXJsRGpDUG1i?=
 =?utf-8?B?bGZFZXUwMEpYdk1FQ3RMd2F2OFkvUU5vRVg3aGhRWW5KQmphUnU1MlRpb0ZH?=
 =?utf-8?B?SWU5RUY4THM0MTN1WU8xdHBXVzN0RWtGb0N0VHdSdXIvS1FaS01EM2Qxb3RS?=
 =?utf-8?B?N0M5Qm9WSGI1ZVlXS3UzUmxWOTlZQWxRVDdzLzRwOC9meHBlallzRXFqTDhR?=
 =?utf-8?B?Q1BaYlVzOWRzZjJXNGsvQ2tFQWpQWEx3bjhkWm1qK1pKTUMrZzhyRlZHWTk4?=
 =?utf-8?B?eStWTFZtaTBLSEdHLzZDYmhla0phYTFYdmZlWUUwRnFWdElObjNFcTV5TVk0?=
 =?utf-8?B?Rk5YNmVxUUF5TUhZREN0aFo5VjV0dEpOM2ZXRXg1alR3TzBRWWdybGhqSi9B?=
 =?utf-8?B?ZEhpa1VzMnppdlNySFpMQmxoYkhsWGlPNFdjL0owMm9GQlpqYjZranZMajU1?=
 =?utf-8?B?ZWtWcTR5WmMyYmxaR1lDaXJBZ0NXQ21kYXFsZVpVbTBrcG8wb0hWZVV2Kytr?=
 =?utf-8?B?MGhTTk9xWGt0WHhhUVY1NDV2M3RJbHpyNVFmdm5HMWlOM0Q2cmRLQ0VSNjkz?=
 =?utf-8?B?Z2dWT3ZLUENBMktycnRhdXU0OGFWaXN0QmYwK3VMY1FSNGlxUzBFckgwWm5n?=
 =?utf-8?B?NFFjdzkyQzliK0V1K2Q4ZWdHYzNFTHZNMWMvNnFDTlNuSU9mbnJEZnBvK1J3?=
 =?utf-8?B?ck9QY2VqSlI4V09KTURzUjl0SURNNkVGSkFnSFNGa1NVaWd5ZUxxUW5nNCtl?=
 =?utf-8?B?Zk5YamM4cVkyL2NickpJQVQ4cVFseEY2RHRqc0R5aTU3elhITDhoWkRZUjQ3?=
 =?utf-8?B?Skp6UG5UMVl1SGxQRk9ZTGxvV0d1dEVPRWQwd2lOdUwvWGhlMGF2KzZwN3Fo?=
 =?utf-8?B?TTV3RkFsRnhlMWh4ai9yQzR0bE91UVN0V1dGZCt1YjFYMlpCOHAwcnlBVWlM?=
 =?utf-8?B?eXNUQ3d0R3ViRmNDb2tWSXcvMHZaZUY0QUR4SVhVK0MzNUdOWlk1YmhjSmpq?=
 =?utf-8?B?UWVET05iTFMxbmdJdFp4c3BmbVZsbitzYzI3WFc5ejlYeEJMcDgycXI1SHNy?=
 =?utf-8?B?ekdSdnFRRTlCT3o3dVY3U3BMQWFuOTdNOTJFWkNuekJwMGUvSnZNbHEvSEdk?=
 =?utf-8?B?Rnk1WTlWbEg5V3pKN2EranUraGduYnNPUHhYWEZGTWhSV3ZTbG4rcFRUSXRE?=
 =?utf-8?B?WjRtNFpLeWNPYXlHS0VOaHlhcU5nUFpGSVBaemw5NTNHNkU5blJOTDZyMXIx?=
 =?utf-8?B?SWVKd1pFZS9IMi9yb0owQ1BFY2ZCYWdieHhSVWhMTVdqdjU3SEd1MWI0MUF1?=
 =?utf-8?B?QkFUNEJnTW5xMGpod1hxMjhYN1BDZGYxb0JETmJmc0Y0SWRGd1ZYVXMxbVFr?=
 =?utf-8?B?RzEydEJRQnJCWURIVzJOQW5UcERYa1R4T1dQSmZsQ1pIRU41UjU4ZkczWGty?=
 =?utf-8?B?cTU5b2szYk8yOFBqV2J1RU91TTRFL1BLaUpybHU5d2E2Qnh0SWJ6N1JZOEk5?=
 =?utf-8?B?UEd1M2cvQmtQdHJtNmVSZnNSNEtCN3BYNnZVNG9XWHJ0N3BOOVd1dXprMU5v?=
 =?utf-8?B?VmhkSGtBY2xxbEpMempQbEhGekI3cmd5QzRBRlkraTBYOE5qRTZyTGorS0tP?=
 =?utf-8?Q?XdIwyZY7A3iyRJk8kaYgcv/t0?=
Content-ID: <DEED464E4374C241BE12AF4F3C1C7EEC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea1392b-ac90-454c-bd56-08dc4a53a23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 09:37:04.4155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7FIdvj0mXY126I+WmPhrIwaS9MzSpLDpCk2AV1SHdciETtmSQRT0fz0KtVYnqemZeCWYbUVeBXWhrm3syP27Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7017
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.991700-8.000000
X-TMASE-MatchedRID: HXSqh3WYKfsOwH4pD14DsPHkpkyUphL9X4GSJGyYc367qpOHKudqc3xm
 C/CenOgNzCI8XB2Ya3Maom150xxR/ZRho78T5P9DQ1OcCEvT+bc/FeJYf9wxdbghdDfPx2dqCWH
 b0xo/FuYoxJgcjYM0yJD+T+bb5XFJgR3NPmEJwgpjVtAwIy+aflqLeWdevru+2IKxg8LhSXbZ+2
 //mNeSL9mhOXLc8ZbgtIW3/9bx0+pP6qceA7YxiVz+axQLnAVBfS0Ip2eEHnylPA9G9KhcvbLn+
 0Vm71Lcq7rFUcuGp/EgBwKKRHe+r+Tx+qmvTAExfNzGY+0Yb5xSgpqCnB4lYsBKLBGqVNuTMEet
 BvZhfw0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.991700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2BCB1BFD19BCA5C209E2FD7DC5BED1C52C0A3A133199E1DC3BAD33DA9AB000AF2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_582315071.766995823"
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

--__=_Part_Boundary_003_582315071.766995823
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDMtMjIgYXQgMTM6MjggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCAiUHJlLW11bHRpcGxpZWQiIGFuZCAiTm9uZSIgYmxlbmQgbW9k
ZSBvbiBNZWRpYVRlaydzIGNoaXBzIGJ5DQo+IGFkZGluZyBjb3JyZWN0IGJsZW5kIG1vZGUgcHJv
cGVydHkgd2hlbiB0aGUgcGxhbmVzIGluaXQuDQo+IEJlZm9yZSB0aGlzIHBhdGNoLCBvbmx5IHRo
ZSAiQ292ZXJhZ2UiIG1vZGUgKGRlZmF1bHQpIGlzIHN1cHBvcnRlZC4NCj4gDQo+IEZvciBtb3Jl
IGluZm9ybWF0aW9uLCB0aGVyZSBhcmUgdGhyZWUgcGl4ZWwgYmxlbmQgbW9kZXMgaW4gRFJNDQo+
IGRyaXZlcjoNCj4gIk5vbmUiLCAiUHJlLW11bHRpcGxpZWQiLCBhbmQgIkNvdmVyYWdlIi4NCj4g
DQo+IFRvIHVuZGVyc3RhbmQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGVzZSBtb2RlcywgbGV0
J3MgdGFrZSBhIGxvb2sNCj4gYXQNCj4gdGhlIGZvbGxvd2luZyB0d28gYXBwcm9hY2hlcyB0byBk
byBhbHBoYSBibGVuZGluZzoNCj4gDQo+IDEuIFN0cmFpZ2h0Og0KPiBkc3QuUkdCID0gc3JjLlJH
QiAqIHNyYy5BICsgZHN0LlJHQiAqICgxIC0gc3JjLkEpDQo+IFRoaXMgaXMgc3RyYWlnaHRmb3J3
YXJkIGFuZCBlYXN5IHRvIHVuZGVyc3RhbmQsIHdoZW4gdGhlIHNvdXJjZSBsYXllcg0KPiBpcw0K
PiBjb21wb3NpdGluZyB3aXRoIHRoZSBkZXN0aW5hdGlvbiBsYXllciwgaXQncyBhbHBoYSB3aWxs
IGFmZmVjdCB0aGUNCj4gcmVzdWx0LiBUaGlzIGlzIGFsc28ga25vd24gYXMgInBvc3QtbXVsdGlw
bGllZCIsIG9yICJDb3ZlcmFnZSIgbW9kZS4NCj4gDQo+IDIuIFByZS1tdWx0aXBsaWVkOg0KPiBk
c3QuUkdCID0gc3JjLlJHQiArIGRzdC5SR0IgKiAoMSAtIHNyYy5BKQ0KPiBTaW5jZSB0aGUgc291
cmNlIFJHQiBoYXZlIGFscmVhZHkgbXVsdGlwbGllZCBpdHMgYWxwaGEsIG9ubHkNCj4gZGVzdGlu
YXRpb24NCj4gUkdCIG5lZWQgdG8gbXVsdGlwbHkgaXQuIFRoaXMgaXMgdGhlICJQcmUtbXVsdGlw
bGllZCIgbW9kZSBpbiBEUk0uDQo+IA0KPiBGb3IgdGhlICJOb25lIiBibGVuZCBtb2RlIGluIERS
TSwgaXQgbWVhbnMgdGhlIHBpeGVsIGFscGhhIGlzIGlnbm9yZWQNCj4gd2hlbiBjb21wb3NpdGlu
ZyB0aGUgbGF5ZXJzLCBvbmx5IHRoZSBjb25zdGFudCBhbHBoYSBmb3IgdGhlDQo+IGNvbXBvc2l0
ZWQNCj4gbGF5ZXIgd2lsbCB0YWtlIGVmZmVjdHMuDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20+DQo+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMgfCAxMSArKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gaW5kZXggMTcyM2Q0MzMzZjM3MS4uNWJm
NzU3YTNlZjIwMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19w
bGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KPiBA
QCAtMzQ2LDYgKzM0NiwxNyBAQCBpbnQgbXRrX3BsYW5lX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwNCj4gc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ICAJCQlEUk1fSU5GTygiQ3JlYXRl
IHJvdGF0aW9uIHByb3BlcnR5IGZhaWxlZFxuIik7DQo+ICAJfQ0KPiAgDQo+ICsJZXJyID0gZHJt
X3BsYW5lX2NyZWF0ZV9hbHBoYV9wcm9wZXJ0eShwbGFuZSk7DQo+ICsJaWYgKGVycikNCj4gKwkJ
RFJNX0VSUk9SKCJmYWlsZWQgdG8gY3JlYXRlIHByb3BlcnR5OiBhbHBoYVxuIik7DQo+ICsNCj4g
KwllcnIgPSBkcm1fcGxhbmVfY3JlYXRlX2JsZW5kX21vZGVfcHJvcGVydHkocGxhbmUsDQo+ICsJ
CQkJCQkgICBCSVQoRFJNX01PREVfQkxFTkRfUA0KPiBSRU1VTFRJKSB8DQo+ICsJCQkJCQkgICBC
SVQoRFJNX01PREVfQkxFTkRfQw0KPiBPVkVSQUdFKSB8DQo+ICsJCQkJCQkgICBCSVQoRFJNX01P
REVfQkxFTkRfUA0KPiBJWEVMX05PTkUpKTsNCg0KQWZ0ZXIgYWxsIHN1YiBkcml2ZXIgc3VwcG9y
dCB0aGVzZSBmdW5jdGlvbiwgdGhlbiBjcmVhdGUgYmxlbmQNCnByb3BlcnR5LiBTbyBtb3ZlIHRo
aXMgcGF0Y2ggYWZ0ZXIgYWxsIHN1YiBkcml2ZXIgc3VwcG9ydCB0aGVzZSBibGVuZA0KbW9kZS4N
Cg0KUmVnYXJkcywNCkNLDQoNCj4gKwlpZiAoZXJyKQ0KPiArCQlEUk1fRVJST1IoImZhaWxlZCB0
byBjcmVhdGUgcHJvcGVydHk6IGJsZW5kX21vZGVcbiIpOw0KPiArDQo+ICAJZHJtX3BsYW5lX2hl
bHBlcl9hZGQocGxhbmUsICZtdGtfcGxhbmVfaGVscGVyX2Z1bmNzKTsNCj4gIA0KPiAgCXJldHVy
biAwOw0K

--__=_Part_Boundary_003_582315071.766995823
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDMtMjImIzMyO2F0JiMzMjsxMzoyOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyOyZxdW90O1ByZS1tdWx0aXBsaWVkJnF1b3Q7JiMzMjthbmQmIzMyOyZxdW90
O05vbmUmcXVvdDsmIzMyO2JsZW5kJiMzMjttb2RlJiMzMjtvbiYjMzI7TWVkaWFUZWsmIzM5O3Mm
IzMyO2NoaXBzJiMzMjtieQ0KJmd0OyYjMzI7YWRkaW5nJiMzMjtjb3JyZWN0JiMzMjtibGVuZCYj
MzI7bW9kZSYjMzI7cHJvcGVydHkmIzMyO3doZW4mIzMyO3RoZSYjMzI7cGxhbmVzJiMzMjtpbml0
Lg0KJmd0OyYjMzI7QmVmb3JlJiMzMjt0aGlzJiMzMjtwYXRjaCwmIzMyO29ubHkmIzMyO3RoZSYj
MzI7JnF1b3Q7Q292ZXJhZ2UmcXVvdDsmIzMyO21vZGUmIzMyOyhkZWZhdWx0KSYjMzI7aXMmIzMy
O3N1cHBvcnRlZC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Rm9yJiMzMjttb3JlJiMzMjtpbmZvcm1h
dGlvbiwmIzMyO3RoZXJlJiMzMjthcmUmIzMyO3RocmVlJiMzMjtwaXhlbCYjMzI7YmxlbmQmIzMy
O21vZGVzJiMzMjtpbiYjMzI7RFJNDQomZ3Q7JiMzMjtkcml2ZXI6DQomZ3Q7JiMzMjsmcXVvdDtO
b25lJnF1b3Q7LCYjMzI7JnF1b3Q7UHJlLW11bHRpcGxpZWQmcXVvdDssJiMzMjthbmQmIzMyOyZx
dW90O0NvdmVyYWdlJnF1b3Q7Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUbyYjMzI7dW5kZXJzdGFu
ZCYjMzI7dGhlJiMzMjtkaWZmZXJlbmNlJiMzMjtiZXR3ZWVuJiMzMjt0aGVzZSYjMzI7bW9kZXMs
JiMzMjtsZXQmIzM5O3MmIzMyO3Rha2UmIzMyO2EmIzMyO2xvb2sNCiZndDsmIzMyO2F0DQomZ3Q7
JiMzMjt0aGUmIzMyO2ZvbGxvd2luZyYjMzI7dHdvJiMzMjthcHByb2FjaGVzJiMzMjt0byYjMzI7
ZG8mIzMyO2FscGhhJiMzMjtibGVuZGluZzoNCiZndDsmIzMyOw0KJmd0OyYjMzI7MS4mIzMyO1N0
cmFpZ2h0Og0KJmd0OyYjMzI7ZHN0LlJHQiYjMzI7PSYjMzI7c3JjLlJHQiYjMzI7KiYjMzI7c3Jj
LkEmIzMyOysmIzMyO2RzdC5SR0ImIzMyOyomIzMyOygxJiMzMjstJiMzMjtzcmMuQSkNCiZndDsm
IzMyO1RoaXMmIzMyO2lzJiMzMjtzdHJhaWdodGZvcndhcmQmIzMyO2FuZCYjMzI7ZWFzeSYjMzI7
dG8mIzMyO3VuZGVyc3RhbmQsJiMzMjt3aGVuJiMzMjt0aGUmIzMyO3NvdXJjZSYjMzI7bGF5ZXIN
CiZndDsmIzMyO2lzDQomZ3Q7JiMzMjtjb21wb3NpdGluZyYjMzI7d2l0aCYjMzI7dGhlJiMzMjtk
ZXN0aW5hdGlvbiYjMzI7bGF5ZXIsJiMzMjtpdCYjMzk7cyYjMzI7YWxwaGEmIzMyO3dpbGwmIzMy
O2FmZmVjdCYjMzI7dGhlDQomZ3Q7JiMzMjtyZXN1bHQuJiMzMjtUaGlzJiMzMjtpcyYjMzI7YWxz
byYjMzI7a25vd24mIzMyO2FzJiMzMjsmcXVvdDtwb3N0LW11bHRpcGxpZWQmcXVvdDssJiMzMjtv
ciYjMzI7JnF1b3Q7Q292ZXJhZ2UmcXVvdDsmIzMyO21vZGUuDQomZ3Q7JiMzMjsNCiZndDsmIzMy
OzIuJiMzMjtQcmUtbXVsdGlwbGllZDoNCiZndDsmIzMyO2RzdC5SR0ImIzMyOz0mIzMyO3NyYy5S
R0ImIzMyOysmIzMyO2RzdC5SR0ImIzMyOyomIzMyOygxJiMzMjstJiMzMjtzcmMuQSkNCiZndDsm
IzMyO1NpbmNlJiMzMjt0aGUmIzMyO3NvdXJjZSYjMzI7UkdCJiMzMjtoYXZlJiMzMjthbHJlYWR5
JiMzMjttdWx0aXBsaWVkJiMzMjtpdHMmIzMyO2FscGhhLCYjMzI7b25seQ0KJmd0OyYjMzI7ZGVz
dGluYXRpb24NCiZndDsmIzMyO1JHQiYjMzI7bmVlZCYjMzI7dG8mIzMyO211bHRpcGx5JiMzMjtp
dC4mIzMyO1RoaXMmIzMyO2lzJiMzMjt0aGUmIzMyOyZxdW90O1ByZS1tdWx0aXBsaWVkJnF1b3Q7
JiMzMjttb2RlJiMzMjtpbiYjMzI7RFJNLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGb3ImIzMyO3Ro
ZSYjMzI7JnF1b3Q7Tm9uZSZxdW90OyYjMzI7YmxlbmQmIzMyO21vZGUmIzMyO2luJiMzMjtEUk0s
JiMzMjtpdCYjMzI7bWVhbnMmIzMyO3RoZSYjMzI7cGl4ZWwmIzMyO2FscGhhJiMzMjtpcyYjMzI7
aWdub3JlZA0KJmd0OyYjMzI7d2hlbiYjMzI7Y29tcG9zaXRpbmcmIzMyO3RoZSYjMzI7bGF5ZXJz
LCYjMzI7b25seSYjMzI7dGhlJiMzMjtjb25zdGFudCYjMzI7YWxwaGEmIzMyO2ZvciYjMzI7dGhl
DQomZ3Q7JiMzMjtjb21wb3NpdGVkDQomZ3Q7JiMzMjtsYXllciYjMzI7d2lsbCYjMzI7dGFrZSYj
MzI7ZWZmZWN0cy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtBbmdlbG9H
aW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTom
IzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO1Np
Z25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5z
dW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMmIzMyO3wmIzMyOzExJiMzMjsrKysrKysrKysr
Kw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MTEmIzMyO2luc2Vy
dGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzE3MjNkNDMzM2YzNzEu
LjViZjc1N2EzZWYyMDImIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7QEAmIzMyOy0zNDYsNiYjMzI7KzM0
NiwxNyYjMzI7QEAmIzMyO2ludCYjMzI7bXRrX3BsYW5lX2luaXQoc3RydWN0JiMzMjtkcm1fZGV2
aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7c3RydWN0JiMzMjtkcm1fcGxhbmUmIzMyOypwbGFuZSwN
CiZndDsmIzMyOyYjMzI7RFJNX0lORk8oJnF1b3Q7Q3JlYXRlJiMzMjtyb3RhdGlvbiYjMzI7cHJv
cGVydHkmIzMyO2ZhaWxlZCYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjsrZXJyJiMzMjs9JiMzMjtkcm1fcGxhbmVfY3JlYXRlX2FscGhhX3By
b3BlcnR5KHBsYW5lKTsNCiZndDsmIzMyOytpZiYjMzI7KGVycikNCiZndDsmIzMyOytEUk1fRVJS
T1IoJnF1b3Q7ZmFpbGVkJiMzMjt0byYjMzI7Y3JlYXRlJiMzMjtwcm9wZXJ0eTomIzMyO2FscGhh
JiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytlcnImIzMyOz0mIzMyO2RybV9w
bGFuZV9jcmVhdGVfYmxlbmRfbW9kZV9wcm9wZXJ0eShwbGFuZSwNCiZndDsmIzMyOysmIzMyOyYj
MzI7JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfUA0KJmd0OyYjMzI7UkVNVUxUSSkmIzMyO3wNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfQw0KJmd0OyYjMzI7T1ZF
UkFHRSkmIzMyO3wNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjtCSVQoRFJNX01PREVfQkxFTkRf
UA0KJmd0OyYjMzI7SVhFTF9OT05FKSk7DQoNCkFmdGVyJiMzMjthbGwmIzMyO3N1YiYjMzI7ZHJp
dmVyJiMzMjtzdXBwb3J0JiMzMjt0aGVzZSYjMzI7ZnVuY3Rpb24sJiMzMjt0aGVuJiMzMjtjcmVh
dGUmIzMyO2JsZW5kDQpwcm9wZXJ0eS4mIzMyO1NvJiMzMjttb3ZlJiMzMjt0aGlzJiMzMjtwYXRj
aCYjMzI7YWZ0ZXImIzMyO2FsbCYjMzI7c3ViJiMzMjtkcml2ZXImIzMyO3N1cHBvcnQmIzMyO3Ro
ZXNlJiMzMjtibGVuZA0KbW9kZS4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOytpZiYjMzI7
KGVycikNCiZndDsmIzMyOytEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkJiMzMjt0byYjMzI7Y3JlYXRl
JiMzMjtwcm9wZXJ0eTomIzMyO2JsZW5kX21vZGUmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7JiMzMjtkcm1fcGxhbmVfaGVscGVyX2FkZChwbGFuZSwmIzMyOyZhbXA7bXRrX3Bs
YW5lX2hlbHBlcl9mdW5jcyk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtyZXR1cm4m
IzMyOzA7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17
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

--__=_Part_Boundary_003_582315071.766995823--

