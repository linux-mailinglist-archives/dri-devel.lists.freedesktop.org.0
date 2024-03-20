Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D00880997
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 03:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AD810EB6D;
	Wed, 20 Mar 2024 02:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MXyzTigt";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iVJr5ZAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16D310EB6D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 02:28:30 +0000 (UTC)
X-UUID: 87d788a8e66111eeb8927bc1f75efef4-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=NoYoOCt5Ju5AXA48SP3blD1uRg6ftjp6r8gWYtlrgxI=; 
 b=MXyzTigt7c507B5mzLB5hiJkBQoY4RGUfQrkKV+E07U9ZDWlpcpa3NUiXetRs6IGLn9eiH/Ibrgn/WrWpygXVbWAXXFz5Lhb9n0aThPrK6IpsDUEZetyZ6AwfgxRJ6xtg/y3FQPpVRv2vly0k0wSlvHSfKrRdxYHRlXTjUs6gtg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:0cee0cac-4564-44c6-b12c-f2d5573931f1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:c82bb381-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 87d788a8e66111eeb8927bc1f75efef4-20240320
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1981531234; Wed, 20 Mar 2024 10:28:26 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 10:28:23 +0800
Received: from SG2PR03CU006.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 10:28:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsWa6ZkYa8fCvnJxO7u60E0DXb2IlDoVM/IuAgrBZt/K5QmGodcxEUcs441iumO+yF+LR7CPBEVOXAPR8X73yqHTKrMhFLDxKJ/VSR4ktana7UsVPCB/ehUNp6rLYI8/GVeMm+gorh59xIxqUQwf0zl1QVriNf0lhkswSrEQjvAnqV6BYCejwZQlP6P514YJG/lBVHhfiKNOQyRA+0N+l7ZBG8j6xyZ/5fRxV0Y2AZyWsYsnlDfs29W98r5GPTYsx6A8Ikp3Wp5dxSehQKGh4XYI8gute+8bCjqDK6KGBgG0GC840BikSrclYVf5hp3oc3K/uZ9JX1tW9TtN7Lm2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv7LCPnKP9IxlByMnDua93ARFjakZ1+qGksMjSpl24Q=;
 b=QnNo9eS7saThg/rnacn30AN8aJlH9bgHGd1NWpeM82tk5EHl1cmA7SM6iIz8qfOXyZ02ttRV9IJRmGY464buu1hnKYTvaqpGByS4ZOSjYm/QqIosVrp639GzGfXhNRMtdlp9Ea+nHPHgs0PDL8Yr2ojqxQUmqkECH/0/LDR8s4XWnLtQ7y5jGzxqA+DNTorm6FDtijAtix0VUtZdWc6JpKeob1yB+B2KG+u8V693H3L3DqrvklP+Vib+WxEP6duSQseaRQ8JWKeOR6pG1IJqaDcDBJ/XF3gc746b9Xwj+znWtuIX8AYqoEnBYqrfivWlS8Fi9tIcmt1STRdJaDdmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv7LCPnKP9IxlByMnDua93ARFjakZ1+qGksMjSpl24Q=;
 b=iVJr5ZAsZ2w99EKyIu8T8EGWJ5z3enornR4ZBGtLpx2lCk4IW6VWuFxQE/wBqpp4NgaK0GHkFcnDwgMm0ux9ZXVAu+qZxJQ3Uh0IAl5sXpqnjk+0ycbGxr8eBCcoJvLmi4g2QcLXsGPc3LwDFncmLpm5YYg+iVHZ39LqJWu0Hy8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7593.apcprd03.prod.outlook.com (2603:1096:990:a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Wed, 20 Mar
 2024 02:28:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 02:28:20 +0000
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
Subject: Re: [PATCH v2 13/14] drm/mediatek: Rename files "mtk_drm_gem.c" to
 "mtk_gem.c"
Thread-Topic: [PATCH v2 13/14] drm/mediatek: Rename files "mtk_drm_gem.c" to
 "mtk_gem.c"
Thread-Index: AQHaecu3RHgbuKhfP0qgo8o9epEDAbE/6POA
Date: Wed, 20 Mar 2024 02:28:20 +0000
Message-ID: <58f99c889910b40fc626f98c23a2570d9d2fa1ad.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-14-shawn.sung@mediatek.com>
In-Reply-To: <20240319070257.6443-14-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7593:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rKL5ABsu9uFU/w0sSfH82KefaUZhcC0oNo3jxhKsxWILQ0Cj5G9XaCizoK7H3QYIX5WUhC3iYa17+M68DHvfihYW4CFzU4oUvC5dFX0c5WpdGgQsRKLEkVDf52v9dkoBEJywouGMdaz0IYT4Vu749szEnUjPP+6sduzoxlbyuGAQqnhxD+CFwi6plaSF77vYQtFzjxInmHijPp8YX7mXE0greP9ViIejAZ4cT3Eo4OLLawn41NAJC3gsu7aN2pCiyIuLkyFAvEg7V1yyolg5cVRW4XnO00THDyWOjdd7CdlhzsVk+XWsuT88TSfANw8piaPYN1w6saz7QfDh1hP42DGEcv21KvcsiAH8slOp8zwpUrpUDme0YgJkjYo0ydwOJ07/Fx9j1zGg+3RCP0qIHMbHmYYItfPA+JcKrmshHCRiDP0iy0xdiFvQymk6yu7O4h9LoDhx1tSfdb0YCdGIwKLqVdIr5WoLuKdnx0r+x9vC6u7rpcx1BCZauX+BUIzOM0UDas0wV1p5Fa3D6uEwiUboWIW8Yf7fbTIenb2dr5NyX/BEh2WJJ4tMZLC8uk8PV2XY/zAO52k51le/3FFFaRS5wxrgfC6OEFs1dMIEL7bnU5lx4fHlHvcsv/d/TMnyGEWKCG8O6M4q3I3wKoDEOavHP6X8R79Bt6WItXBphPw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjZ6ck4va2xEVnFoU05sZDFqWFRzb0xDdzRmT2FadHNkbnRQNEcyYXRrQ09B?=
 =?utf-8?B?K0I4bVJBMldTZUtFSVZrUm56ZFo3UjFISmlxa3h0ZU5vNFZkZ1RlVkd0TFla?=
 =?utf-8?B?cHdqalJXM29zTE9wK2hiN3prVlAyVWd0bWJHbk8wN1lJMnJoSGRJQzZQSks1?=
 =?utf-8?B?MktaNzhaOW40OWNHaUtRWHNxYlAwNFg5aU1qYXlLTEpwbU5JY3hFYjdmT0g4?=
 =?utf-8?B?WlVmL3VYb3V5NFBUVTdHdlJmekFIem5hQjIya2lFL1Y5N3ltbDhPNGtWZlpC?=
 =?utf-8?B?L09HbC82bUltSURUZ01ta2hNNCtFcmJDbnRvMGhDRTg2WENvKzhCY0E2VjZy?=
 =?utf-8?B?eHJKK01SRFBMRTRyWVBKUjZDR0ljMC9CVU16V240YWNwNDUzTHN1WWxXOXE5?=
 =?utf-8?B?TXNJNEcvNjJtcEZPWUd5R0pXUnJiemJZTy9DTnlMTXhTMWVrU1dxVWkyRm52?=
 =?utf-8?B?cnFuUkRGZU5icTczWjFETzhRbFhSd0FHb1RjM0x1bC94Q0Y5Nk55ajYvS05i?=
 =?utf-8?B?QzhxNWd6SVdGbGJsNFhVc2NUZkUxaTVFek5rbVprRFg0M1Fmd1B2cmltTEt6?=
 =?utf-8?B?OGZ5dzlhMXdvR0MvUU04ZVpFY1hKUzM2L0ljSy9xQy9Sa2ErR01EUXNuRUJq?=
 =?utf-8?B?ZFpqbTVSNzJqYXJwdmwyUWdSRzhvdUNyb2VNZjJyOGh2SDFLYy9IMTIvZXdX?=
 =?utf-8?B?azFUNFJkSVd0YkF4TTYxY05HN0JaQk16OE5Ydm5PRm82aGlXaXRLVTV3Z2h2?=
 =?utf-8?B?QW45VXo3amwwTE9BZ1AyWGQxek1YOW96aFFvbTRJRDI4VTZkc1IxR2xBWEtq?=
 =?utf-8?B?UWFqMmx1TVhJNGkvYmFPR0tOcVZkaTN4QzkxL1FDbVl1eVpQb01LR3B3Zkoy?=
 =?utf-8?B?VFhWRkRQdFdlY2NuVjhQN1NnS25ydWN4SzUyY0FTR3pwSGxISldKZzBPZVVy?=
 =?utf-8?B?Uk1nWTNManJhUVcwblJGd1EyZXMxOGhvSHdmcDd4d2FITXNXblBDNjZwZnBY?=
 =?utf-8?B?ZGFIUVpxM2lKcGY2c1c3bHhxV29BdGpycm9RRHNoMGFGTnBCVzVld1czMmhN?=
 =?utf-8?B?WHhtU2x4THVnWFZNYU1oVlpzTFVtdEZRZGQvM0tKTjA3R0ZMQUpOejdhb3FQ?=
 =?utf-8?B?YndiRzZodys0Vk9SRkJTZFQxdG1JcnRxdk90Y2o4UmlIT2ZWSTljNTlxRi9S?=
 =?utf-8?B?aGVKMlE3NlpJZlZsZk0xVXZycUZxYVNkSEsxU3NyL29GcVdwYm5lbE1ualZQ?=
 =?utf-8?B?K3VHQnpvaWo2K1RKQ1podFZWdC9ySlFXVW5hZ0hxM3VhQzRZdTg1SmdyZ0kx?=
 =?utf-8?B?TUdObWNDWDR1bHF2RXJkK0QySzlITTZLdlhxWWpXQVpxZzdUeUJXbU1DSmQ2?=
 =?utf-8?B?Y0VQYlZjL2p4RXJXTDJDTnBDSS9WNW96M01BS1lxNThtQ2piL0hqckx0T1BB?=
 =?utf-8?B?RGxYT1BOQTc5cVh2NmtHRnRnSFpBTGJ4VFM3NUNSVDRIREdLMFg2VUpGM3BL?=
 =?utf-8?B?ZW05VUNnTnhBSkwvbFl2eVdYWDJFTXU4V21WMFYzSkc1cVoyWFpMQ29TVG1x?=
 =?utf-8?B?cGtJUFdUMnhFMmZJNllESVJRbjhBQTNhREFmZmo2YTR0cUdjbXJwQi9LeDZW?=
 =?utf-8?B?akNKdmhZaGtiMEl5MVpWd1YwUlhscXlycHdTMHFlMDBMQzIvcXRFc0M4cEpp?=
 =?utf-8?B?ZmZZYlNjWWFXODlqaXNMSzlXREFScU5NRFIzcC9tVEQ3ZTZNRkRZWmJBbkxW?=
 =?utf-8?B?dmxDMUxNOU0velkxeVNvY0dSUEFRK2M5L0RpTHQ0Zi95TUdoa3phMmczMW8v?=
 =?utf-8?B?VS9EbkorTUY1cHZYUWxVb0RqMkR2a0VzN2VsdDZXL0xROWtpaGFyN01nanpn?=
 =?utf-8?B?d25ZKy91RHIxbHMzbXgvcndXUWI0MVBNbnpVU1o0aUxRUzdIS3p5MFhFV1Zo?=
 =?utf-8?B?aWJyakhhaXpkeVZJNG96Q0liYUZkbFdjRHF6cmJNV1oxQytZR2pZd1M2REhI?=
 =?utf-8?B?Y3ZsL2s5VU9nMTdjMmZEZ2duNEpsNlo3V3RzNzNxRENacDRqZU05VDZkaGtw?=
 =?utf-8?B?WDdaZkVIY0dPeFU4RW5LWWJZWjhzWHVwOGpua1Z4TXdRMlFUT1dpZmVZL3lK?=
 =?utf-8?Q?Di1rR+ToKQjA3haJNayq4W1oh?=
Content-ID: <7B3BA8B60234DA4B8D4AA7A308965E0E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98c69e9-4058-4898-fc1f-08dc488568af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 02:28:20.3362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOTtLcNB08lfjyMcXznRV6Z7O/HIXfVRVUhtmLW2iPWSX+B0oOORzrZ81LUVbKZZSDyX0Ey9gAQEgwsWCf6tWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7593
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.742200-8.000000
X-TMASE-MatchedRID: wQVy7q402w3+DXQl7XSOUia1MaKuob8PofZV/2Xa0cKSO6So6QGgysNq
 SYgiOmwd8cv4yT0rvGP2KmFPL80zKDwij/SkStHmQPrPw3WbUAueEP0DdJrulpgEXULQnZA+grM
 alLf5CQvmj+ti9Uv6J5GTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPInxMyeYT53RkMoV
 Zucp+3P/Z5atbw6AObzaHTmzikFXRWf1kJvJQzabZIs3ub9wnY3eQ47zTpTSFsn2LYREJEWIWZA
 6wdH/npIssMxy7a3nxWabE4FpgZhROONBgNbV8r1KFk+1yFQ8LBb4NEJ3DXH1Zca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.742200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2D51E0BD41D881E5F8E15652EC4F06EC62C31543D0B49EF3497A2AF049B342512000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1611601604.1460562741"
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

--__=_Part_Boundary_006_1611601604.1460562741
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMTU6MDIgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgZmlsZXMgbXRrX2RybV9nZW0u
YyB0byBtdGtfZ2VtLmMuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pg0KDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lhb2NjaGlubyBEZWwgUmVnbm8gPA0KPiBh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEhzaWFvIENoaWVuIFN1bmcgPA0KPiBzaGF3bi5zdW5nQG1lZGlhdGVrLmNvcnAtcGFydG5lci5n
b29nbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL3tt
dGtfZHJtX2dlbS5jID0+IG10a19nZW0uY30gfCAwDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ICByZW5hbWUgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL3ttdGtfZHJtX2dlbS5jID0+IG10a19nZW0uY30gKDEwMCUpDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQo+IGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL01ha2VmaWxlDQo+IGluZGV4IGE0N2ZiZWM3YjljZTEuLjMyYTJlZDZjMGNmZWYg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCj4gQEAgLTExLDEwICsxMSwxMCBA
QCBtZWRpYXRlay1kcm0teSA6PSBtdGtfY3J0Yy5vIFwNCj4gIAkJICBtdGtfZGlzcF9vdmxfYWRh
cHRvci5vIFwNCj4gIAkJICBtdGtfZGlzcF9yZG1hLm8gXA0KPiAgCQkgIG10a19kcm1fZHJ2Lm8g
XA0KPiAtCQkgIG10a19kcm1fZ2VtLm8gXA0KPiAgCQkgIG10a19kc2kubyBcDQo+ICAJCSAgbXRr
X2RwaS5vIFwNCj4gIAkJICBtdGtfZXRoZHIubyBcDQo+ICsJCSAgbXRrX2dlbS5vIFwNCj4gIAkJ
ICBtdGtfbWRwX3JkbWEubyBcDQo+ICAJCSAgbXRrX3BhZGRpbmcubyBcDQo+ICAJCSAgbXRrX3Bs
YW5lLm8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dl
bS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19nZW0uYw0KPiBzaW1pbGFyaXR5
IGluZGV4IDEwMCUNCj4gcmVuYW1lIGZyb20gZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZ2VtLmMNCj4gcmVuYW1lIHRvIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZ2VtLmMN
Cg==

--__=_Part_Boundary_006_1611601604.1460562741
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1R1ZSwmIzMy
OzIwMjQtMDMtMTkmIzMyO2F0JiMzMjsxNTowMiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmVuYW1lJiMzMjtmaWxlcyYjMzI7bXRrX2RybV9nZW0uYyYj
MzI7dG8mIzMyO210a19nZW0uYy4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZs
dDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2aWV3ZWQt
Ynk6JiMzMjtBbmdlbG9HaWFvY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7
JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMz
MjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7DQom
Z3Q7JiMzMjtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtl
ZmlsZSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMy
OzImIzMyOystDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay97bXRrX2Ry
bV9nZW0uYyYjMzI7PSZndDsmIzMyO210a19nZW0uY30mIzMyO3wmIzMyOzANCiZndDsmIzMyOyYj
MzI7MiYjMzI7ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24oKyksJiMzMjsx
JiMzMjtkZWxldGlvbigtKQ0KJmd0OyYjMzI7JiMzMjtyZW5hbWUmIzMyO2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay97bXRrX2RybV9nZW0uYyYjMzI7PSZndDsmIzMyO210a19nZW0uY30mIzMyOygx
MDAlKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL01ha2VmaWxlDQomZ3Q7JiMzMjtpbmRleCYjMzI7YTQ3ZmJlYzdiOWNlMS4uMzJhMmVkNmMw
Y2ZlZiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL01ha2VmaWxlDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L01ha2VmaWxlDQomZ3Q7JiMzMjtAQCYjMzI7LTExLDEwJiMzMjsrMTEsMTAmIzMyO0BAJiMzMjtt
ZWRpYXRlay1kcm0teSYjMzI7Oj0mIzMyO210a19jcnRjLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjttdGtfZGlzcF9vdmxfYWRhcHRvci5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7bXRrX2Rpc3BfcmRtYS5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7bXRrX2RybV9kcnYubyYjMzI7JiM5MjsNCiZndDsmIzMyOy0mIzMyOyYjMzI7bXRr
X2RybV9nZW0ubyYjMzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kc2kubyYj
MzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGkubyYjMzI7JiM5MjsNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19ldGhkci5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7KyYj
MzI7JiMzMjttdGtfZ2VtLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtf
bWRwX3JkbWEubyYjMzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19wYWRkaW5n
Lm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfcGxhbmUubw0KJmd0OyYj
MzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Z2VtLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19nZW0uYw0KJmd0
OyYjMzI7c2ltaWxhcml0eSYjMzI7aW5kZXgmIzMyOzEwMCUNCiZndDsmIzMyO3JlbmFtZSYjMzI7
ZnJvbSYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMNCiZndDsmIzMy
O3JlbmFtZSYjMzI7dG8mIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZ2VtLmMNCg0K
PC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioq
KioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioq
KioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdl
IChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3By
aWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUg
dW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9u
bHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9u
LCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBp
ZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGll
dmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3Nl
IHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlv
dSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_1611601604.1460562741--

