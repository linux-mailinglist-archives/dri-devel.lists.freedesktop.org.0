Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AED8809E2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 03:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86810E285;
	Wed, 20 Mar 2024 02:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="iFy3ffqc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WcwLp502";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD4810E285
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 02:49:08 +0000 (UTC)
X-UUID: 68bb1c8ee66411ee935d6952f98a51a9-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7ieWdbzwKw5Gm6UEMOGKEnL2T0yNnooDjfOstb0Drgo=; 
 b=iFy3ffqcJyIfTKjgx5tbKtvCwLlzoZtGy9WbQ+QGlBO/22ISEcN+DwsB5uUff201v/4SICcvzeYocD/s1ppZOcpVLE7sPrmH549UwOCB/pq7kKexuvtB9iW5T0C/76CFaUPnCoNIWldldDM2g2eScW994hxGj8OwRy6h6NVQ410=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:628739e3-708b-42ea-9f53-c451f47b47df, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:416cb381-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 68bb1c8ee66411ee935d6952f98a51a9-20240320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 296550592; Wed, 20 Mar 2024 10:49:02 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 10:49:00 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 10:49:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1qCH0mg8NHO/dqDGcpxrVDKSoabsn43DrOdyMezvG1GisPpgaVdIbtoD9FyJSvAPV5c2+7BAKs7Cu3dpMOsWqQLRb+AvrI+opEtIqcpZCkbatrEILneiZMV9HaAsyupd8Qo3SHCBNd2cmX5P9DlM84MXabA1Nlifvvj7hQ4DrPGXOdWW4C67iHmSPpd+VAKQvS03zgrVk/mOi/TvemtYZcjSOgvQv35jUUWqeap7DFK41Qr0/yhuW7WaUXSnH2v3r+qiVFbaQtm/m4D7pTcsX7soFDmyVVPmBSgpiopuvPgu3xLcchdTGjuBNJPpzcRNCCvvj4ygerKrYp1KxnFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEIFv0RBUWITLrd+XHoJKA3DfXM+KH0LdY55ULjyX0E=;
 b=YcQ/FwrlKAhCw2Xpa4IywqeznHdb43f+v/il0KJM3V2HGa8Y6mu9sPIx+OEFQAJVUy4yPwEVQLteyutkZsN/G6ouO6NCFzyueqAqaGq/R+j71Hzzblhjdop1DiLLgsKvGstiSGKnSoo2o7CincUJSvDSaI+d4MbjR0hnYz+KXnytTLm+QXvpqYRTaPNK/agUGbNAO6OJbqpDNppighkWlBETZDjBuNI9w2bgPM8Wk5bMIRXMNGqXVQ4XMzTz4fCT2tsDQweI/3NMqobzhAoi7lMqioaNbQ3CtO9CKpCvfe8MFPdEpbYcQ6ApQReHOD3EBoFsw77fvDcJJ/1v5Jgbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEIFv0RBUWITLrd+XHoJKA3DfXM+KH0LdY55ULjyX0E=;
 b=WcwLp502Cv6vVm7VqSdUA1sNCdLIT5BajWQsjA0z16mweXT6J6R79wFLMeKuPsTE7kWZFanI31DX3e41+gOcI9WWBUvTTCtcuo42ojQEDFS1MBfORLZn39uYNZgQQKbqNp1zX8YfVajNbhX5ch3XVgRww8PP12EmiNzfq0kzPxg=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by SEZPR03MB8322.apcprd03.prod.outlook.com (2603:1096:101:192::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Wed, 20 Mar
 2024 02:48:58 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::be:5466:6e74:793f]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::be:5466:6e74:793f%6]) with mapi id 15.20.7386.030; Wed, 20 Mar 2024
 02:48:58 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 11/14] drm/mediatek: Rename files "mtk_drm_plane.c" to
 "mtk_plane.c"
Thread-Topic: [PATCH v2 11/14] drm/mediatek: Rename files "mtk_drm_plane.c" to
 "mtk_plane.c"
Thread-Index: AQHaemrhviPaq25Y9kaX0q5S1OVV3LE/7XiA
Date: Wed, 20 Mar 2024 02:48:58 +0000
Message-ID: <0af9e986235f9cb1df2c27975d4bc810760ecddb.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-12-shawn.sung@mediatek.com>
 <58072faffa7127e2fd4e47a8149dbaab1256a59e.camel@mediatek.com>
In-Reply-To: <58072faffa7127e2fd4e47a8149dbaab1256a59e.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|SEZPR03MB8322:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNIJYQ9m2+pTjyoTVmUbj8M64aOXiy4MLnmGifaLGNT7A//EIaD80gYAaM2fVk/PNnaIBpUmQRPqXlwccsLkf4CMgPh1AYaH7VOXtwBJM0v9aLAeaW2F0zdFbMCq/vdX3KFTY85CaZh56kCL4yn85U59VWMjGXPnUZiOW+gbNq5GRMEjgRq14xIYRVkAubhNMl+l18DdcVGR+RH594MAtU6dHVQKUN7wBIDa5W4dX7g/phK+5yAJ9JfZkebt/GPZQwlTuTANyFj6+AnxeZ18VKdqmUFYqaIuQuB1v4cKsY7k+dUsiuj++vaQn6GOF1kGLUTq7wHzWphIq29PRfuzsdPz9uhV2Ju5FLzAXO9ILeMGc/1mai0oG7jSFxiCwd5uPl4tX2h6hyCjApMJ6puOfBxq6DdBzOMJ1ouujN7kQFkH51tK6SoNwCTzCDLt+/zJdlbSdHf58AK40Da+3X83By28rshUYy5kcmFqwi88HqwWcMwznA67PuSwM5vXrePDFL7JXnTQ0QY3+/PAWmYaUJEQgK7345X1bjvs6Xn9rY+a9eL7KAJmvq9Of7SnLrROxNeSkJX2Nmd5EJPIO8ghe6gl0YAJCDhuBoe6g8fy15HKScsRaRdbtE4I8LrFsHfF1v80yAVk3xDTFBVzRw9rRxZffYfTFpmyV+ZzO2B8irU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1FyK2NZYysvMjZGMmcyQUlNQTBlS25pbmpOemNyVGoxem1ZUXVwWnhycE54?=
 =?utf-8?B?MmVtQTNuU2RRbDhsUzBLQi9UR0IydWVyb2Z4eldVOVFmV2pzWUFWWW5yYVRy?=
 =?utf-8?B?ZTU5YkZGUmlmNEhwK0dDT1hEZEwrcytHRTRYcWhFUmM5UTQrdDdFMlhvc251?=
 =?utf-8?B?SURmZkZLK2VGTDFqRk51dWdpMnA1MnE5ajJZWjZ0QUVXeUxseHlkZEwvOER2?=
 =?utf-8?B?UHpwd1hGYlphdEpFcDhEVlRlQU9uVzRra1ZEWFpZRkF2cnoyZE9jWXdDVDl3?=
 =?utf-8?B?enZSV01MaFBHYUJ6ekxwS2JpVkUyZDJ6M0h5enEwNHkvTFdIeUdWUVJMUXNr?=
 =?utf-8?B?ZjEwL0RvQnRYN0x4VS9YMDI3dy9lVFBpR3hXZ2xFb0RnMURBR2NGbzhuaGdr?=
 =?utf-8?B?Q1F0MDFzdjJxM0RTaDVTUGZXL1VnazZVRFNybmZ4ZlNlRkpFaUtOZjZPeW9z?=
 =?utf-8?B?ZjloVnROT2ZqbjR5MnBVcGVjN0E0VXlwY1JqejRIYUtWVkE0YlNueElFRjFG?=
 =?utf-8?B?OUZCbFp2OG9HYXRZVHRkOGJ3M0JNRFl6NVdtMWtQclB6QkowOHpvQTJpekZy?=
 =?utf-8?B?UmpVSUxDMTk1Qk03OFhrUENKQTRON0JINjJwY1duYlZMOUlBWlJYWHRNR215?=
 =?utf-8?B?ZC9EY2xnMkNrNU8yREpFR211NDFna2Urd0d6dUp4YXZncitnS2tXTEZZNkQ3?=
 =?utf-8?B?V2lNeGJsSUl4VHJ5aElRNlNNaGkrSGM0ckVQL1RwZ0p5aDRDTk15K0pvUFJy?=
 =?utf-8?B?MUFGSnZSaHpzNUs4VWRFL2N0THRaK1IxeVdXTTBYbTh3NTdabUFFWnJHS0xX?=
 =?utf-8?B?aTUrTjRBTVRXZko0UzE3Y2dOUFVLMVI0NGtRWThyUFplSER2M3hjV2JhdHpj?=
 =?utf-8?B?bmZGYWh2ays1YTBUb0pGU2N3RW4zRlFVbVlZeHE1RzRzb1pqdTN5RkxobWd2?=
 =?utf-8?B?QUZBMU50cVhJS2pMUUQxN2V5YkppYmpCb2hlbEJhRlQ2ZHpNL3FkQUZ6Z0tl?=
 =?utf-8?B?UXdZcFdaNXZmWm8rSUdOaFFTOFR3TFYwRTU1dzgrQnoreEY1eXFBRHhDZTNF?=
 =?utf-8?B?TUg3OUZhSWtDQlJBWlo4S3J4N1o5aW9vRFJQY1NvUmpqRTdLck52b3NHWmhh?=
 =?utf-8?B?U1RvbysyN2pLdVNkY25mNHFvTUZ6cTAzQlZsZGx5MGFCdm92YUVJc1dtS3Vt?=
 =?utf-8?B?c3NvWTZtMjVwVGN5NkdMOEM1VXY1elFhKzBCNStUaHZZS2dHL3p0MEl1UmlD?=
 =?utf-8?B?c0V2cThSbXMvR25TandyR3lka1VnM1ZPK0lscE5zTlM1dDdsWkc3L0lJM240?=
 =?utf-8?B?Y0JVbWpXVisvWmtlUDZPQm4vQUcxN2ZDQ3ZhRVZUSUxxRDZJVUQ4U20rVlEx?=
 =?utf-8?B?TWdDSkRyOTZreHczQVJuNEI2a1BWc1pjOFYvekYxZk0xNG9HTCt6Y1dzR0dL?=
 =?utf-8?B?V0xUN2o2TTRhZWt3dG96aUhRV3JMWGFUaUk1TkF6TThRTWUvKzZZdFJrNWxx?=
 =?utf-8?B?ZDhzdkY3c215ZFI4bW1JRXl1WEZjTVNRSmt3a29SMVRYbXpraHFZK28wdW9w?=
 =?utf-8?B?NTVnTzNkaG5tTjZYZ2FHdERwRXJ2QVV1bXBZUmJnUklvTjFNeHZHc3lwaVpP?=
 =?utf-8?B?T0tSOVNvQU9Oc0FtOW0xd0xSc0RtdTh1TmhGSlMva0lCOFg3ZmZ3UGRpMkU5?=
 =?utf-8?B?OFhlcVc5QUJtdTB6MUNvTkUxdmpNUC9COWhTemZma2lrM3Q4M01VWFFQYXFx?=
 =?utf-8?B?SVk5cGJqSVo3TWlVWDNwTkNwbkk4R0tyWVpTajI5c1pOaHhET0l0K3dLUkJy?=
 =?utf-8?B?U1I0b0p6M3pHeGZsV21tS2dUWXNtM0pIT1I4ZWE2ZHI3NTlocjYzNHdKTVl6?=
 =?utf-8?B?MHkzTVFTNi9uZngzQysyTzJ2eDFJMldOeWhMZmJLcDh5akNYT00xd1JHWlVQ?=
 =?utf-8?B?ckhEenk5N21IRENJWmlEU0NucUZHd0toRitlTHZOZkdCNE1aVUVjWXpRb2hY?=
 =?utf-8?B?OUUxWmpDbTJvRWMzZldvend2U3o0ZXBFbHV4bDcrRjhUdnpqRldNS0VwbDcy?=
 =?utf-8?B?OStjTG1EbG42c1VrMjJZWnllYzlrQU5FRkV5S1ZZS2hrSmQ0aGJDWlUyTFVp?=
 =?utf-8?B?S3JyemVoOGNiNVREdWl4RldadmhUcjA4SSt1Wng2WWRvWUNwRllMUWpCb1lo?=
 =?utf-8?B?aVE9PQ==?=
Content-ID: <1DA97435E20A2848A6E50B8B5260749D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec355c3-ae02-40bc-c575-08dc48884a7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 02:48:58.1899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BF4qvQB69ME88yNDYGJen8bTJJPugajJR0d2fGvLgXLrv3tvBScPjA+v2GjQjd1qpSD18XI3jNBEFJ9t2e3sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8322
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.414900-8.000000
X-TMASE-MatchedRID: zdfKSpJbRLjUL3YCMmnG4ir0r2wNA5jBjLOy13Cgb4/eUmhIcPpKYFDQ
 UTMuNMdQEOd3g5mfB6NiSVnIdboij5hDg82nqVsGlGudLLtRO1u1k3bRIdXVNDMVY5itbDoD5lA
 WcqJGaGfi8zVgXoAltj2Xsf5MVCB1ZiFQvkZhFu1q8/xv2Um1avoLR4+zsDTt/KO2LNTSuGMmvw
 jz6vd7Yx6Tgb6u9/BjvkyCDBzaWlHGjA9y2cpBWg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.414900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2E1E375FB81F1E1023B745FC564EE9625F307F7CBEB00B59E9FFF1D1CE893DF12000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_93260478.2086800088"
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

--__=_Part_Boundary_006_93260478.2086800088
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFdlZCwgMjAyNC0wMy0yMCBhdCAwMjowNCArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBTaGF3bjoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX3BsYW5lLmMNCj4gPiBzaW1pbGFyaXR5IGluZGV4IDk5JQ0KPiA+IHJlbmFtZSBm
cm9tIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCj4gPiByZW5hbWUg
dG8gZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jDQo+ID4gaW5kZXggOTVhNDMy
OGE5YjBiNi4uNDYyNWRlYjIxZDQwNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19wbGFuZS5jDQo+ID4gQEAgLTE2LDcgKzE2LDcgQEANCj4gPiAgI2luY2x1ZGUgIm10
a19jcnRjLmgiDQo+ID4gICNpbmNsdWRlICJtdGtfZGRwX2NvbXAuaCINCj4gPiAgI2luY2x1ZGUg
Im10a19kcm1fZHJ2LmgiDQo+ID4gLSNpbmNsdWRlICJtdGtfZHJtX2dlbS5oIg0KPiA+ICsjaW5j
bHVkZSAibXRrX2dlbS5oIg0KPiANCj4gVGhpcyBzaG91bGQgYmUgYW5vdGhlciBwYXRjaC4gQWZ0
ZXIgcmVtb3ZpbmcgdGhpcywNCj4gDQo+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0
ZWsuY29tPg0KPiANCg0KVGhhbmsgeW91IGZvciB0aGUgbm90aWZpY2F0aW9uLg0KV2lsbCBmaXgg
dGhpcyBlcnJvciBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KU2hhd24NCg==

--__=_Part_Boundary_006_93260478.2086800088
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7V2VkLCYjMzI7MjAy
NC0wMy0yMCYjMzI7YXQmIzMyOzAyOjA0JiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGksJiMzMjtTaGF3
bjoNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCiZndDsmIzMyOyZndDsmIzMyO3NpbWlsYXJp
dHkmIzMyO2luZGV4JiMzMjs5OSUNCiZndDsmIzMyOyZndDsmIzMyO3JlbmFtZSYjMzI7ZnJvbSYj
MzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7Jmd0
OyYjMzI7cmVuYW1lJiMzMjt0byYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFu
ZS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7OTVhNDMyOGE5YjBiNi4uNDYyNWRlYjIx
ZDQwNiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjti
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7
QEAmIzMyOy0xNiw3JiMzMjsrMTYsNyYjMzI7QEANCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7I2lu
Y2x1ZGUmIzMyOyZxdW90O210a19jcnRjLmgmcXVvdDsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
I2luY2x1ZGUmIzMyOyZxdW90O210a19kZHBfY29tcC5oJnF1b3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyNpbmNsdWRlJiMzMjsmcXVvdDttdGtfZHJtX2Rydi5oJnF1b3Q7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjstI2luY2x1ZGUmIzMyOyZxdW90O210a19kcm1fZ2VtLmgmcXVvdDsNCiZndDsmIzMy
OyZndDsmIzMyOysjaW5jbHVkZSYjMzI7JnF1b3Q7bXRrX2dlbS5oJnF1b3Q7DQomZ3Q7JiMzMjsN
CiZndDsmIzMyO1RoaXMmIzMyO3Nob3VsZCYjMzI7YmUmIzMyO2Fub3RoZXImIzMyO3BhdGNoLiYj
MzI7QWZ0ZXImIzMyO3JlbW92aW5nJiMzMjt0aGlzLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZXZp
ZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOw0KDQpUaGFuayYjMzI7eW91JiMzMjtmb3ImIzMyO3RoZSYjMzI7bm90aWZpY2F0aW9u
Lg0KV2lsbCYjMzI7Zml4JiMzMjt0aGlzJiMzMjtlcnJvciYjMzI7aW4mIzMyO3RoZSYjMzI7bmV4
dCYjMzI7dmVyc2lvbi4NCg0KUmVnYXJkcywNClNoYXduDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48
L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
YXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2Vk
LCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBs
YXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0
ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwg
cHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
aXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhh
dmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkg
YW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50
cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2Yg
dGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0t
LT4=

--__=_Part_Boundary_006_93260478.2086800088--

