Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE3076444A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 05:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C7E10E4D2;
	Thu, 27 Jul 2023 03:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545510E4D2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 03:24:50 +0000 (UTC)
X-UUID: 22a4cd2c2c2d11ee9cb5633481061a41-20230727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+6PCxfvdCKxACFwsukYRZM+RDov0p/mfXeEPI72ZzTY=; 
 b=eFGwRa9avBY59KzGfNOqdJvbFt4Fa019U8OgFPT5xbGhTLBaYH5xvbAVlOhMMuumP4ojck+obJ7h8m6qdKhJwkDq6PIN8QwHDwgmUxuBJuXbGwGCy4piEyhrpcnnKvMq77EU/dUkugoA0D83Qj6tGKnCL79C6Klsx/F4ky18BhM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:fefe81dc-1332-44db-85cc-8d79bd810a62, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7562a7, CLOUDID:e286d6b3-a467-4aa9-9e04-f584452e3794,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 22a4cd2c2c2d11ee9cb5633481061a41-20230727
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 468341594; Thu, 27 Jul 2023 11:24:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jul 2023 11:24:45 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jul 2023 11:24:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oejzSeyL7Utu/GbUbSoISu2GxOa/H9nk5Pp3oph9VJTcsQ86E0N/HPSxve70Q07pTBfhm6FexzeUX57uL4ICwR7i9zglig/vjQFWIkYUxehMejFy8JC3S5jVVqINxSPmXEjCLHD6u/UiBNc0UHFnA7lGDZEeusGjcRhPYKv6rKbYkgLEXAJl32hjWmepdAja9urH5ybG6ppbfFhIHqPFo1A6XrqVTxvSfdQorDttv/K65CmrjrEijCZECVyZ1S8CLieBE5xzaRb0t1MtSN1SF+C7un64Au//xqFs+8E/Gf+lz2BcXd9TGDSBuxYcRG/WeLuIJT9XMPFRPYXiEgqlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfomMOAkuINvMMJVjhJY01msWeY50EeJfQAJoYrJXnQ=;
 b=jCXUZSCOzEKd8ED3XY3/lUwvvyVEaWxvyi/7XTvPP1UjDaWPngcNPuw+mJne3RO32M3pJA632ANVQNJHNKRj0HYqCk17BpGANfG/mmKcFnOhDQiBA3Nfr7K3zBjz7H+B7SS6s86gS8c0J99DUY7Ax8LrwBh6Akg8R1aCi8y/cUdaL3K5P8IB7BHX733pWZ7khJyNp9oi49W8iA+KdLHZOOLpwsD1umDUC99ZE+CO1l4jxS6glSeYpyi90+zEhKTfxo6icfbza/rOTA8cz8N6IEETztjdgA8rIvInT7yaAU5a1ZjXD/ZtqzuCJtquonec4l2jGz1sXFwfFwAtgwc3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfomMOAkuINvMMJVjhJY01msWeY50EeJfQAJoYrJXnQ=;
 b=guezgm0zLAzRlUhlsJZHmahPs9PiTDdiYEvZcrtMJyn8HKzmJH9OblFVbPc+CXHzmI/dk0Sa/MkNKejgaowTgyISGACPpZNUpeGcVWf7WqzPfYBuAf3ZYYRdddfTqLnuyBHEiY5X5u0lLQ8N/p8RYnojEeDvC26Cv/4YwSvXMts=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6615.apcprd03.prod.outlook.com (2603:1096:4:1e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 03:24:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:24:41 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v3 3/6] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
Thread-Topic: [PATCH v3 3/6] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
Thread-Index: AQHZv5p1pfg2KNJMjEGUqyHq52IsNK/M9I2A
Date: Thu, 27 Jul 2023 03:24:41 +0000
Message-ID: <c3e1553b8f55e107b548bd14c60d55b6b46de0bb.camel@mediatek.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
 <20230726082245.550929-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230726082245.550929-4-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6615:EE_
x-ms-office365-filtering-correlation-id: a0b1ec55-058b-4514-cb5d-08db8e51041d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dlBB9BZfcjNmCOH6ZPIndBKhDFjy4c4OAbUkPHpOxM7QClD5sDSPdpQM34XIX/8083s38oiCz5ak+rbBwTY+5EUmSPbyP+yhHErN/MscDGEHzU2/93RfHJClDTUo5ST23WKeAdSWmFLsdE7hJhXUrYEEjAhpZ9efP97CjmGoWjfrhW1bgeHnWvanIwMyS6IyhQdBShinSgpEiE0C3bDIYIpRdGAa/Q5DI+phrN5T+mDozffP5M/kblhz1KSTAI7cyljkEsUa/mPG0im5ztJ/HPlhOcoQj6uA/wSSKREFlAMoSWX636ryLCowVCu4DkocGICiNYh5XhprrkDcgRTpqlaHtGsZN2xkiNe5cY7I72E1wqFygtfbJgoYg/RA/nS3cqFuoUYes5plnRTggZVK4loyPtjRlCp9tN30tbVOsJBmnbi1ITq+HcQozK8aXNaG8zxEA1uPgQn6DwbjCulkWYpYPp3I9rO7y2HnsMBZzsvAnZ1Bl4lfiIyneo76AzxweCq9+hZbXp/xZ0i9nWs3chB8A14KDoTmuahUHJgP6sJQ6JDfEe+FFpb50iOeEnqBy3pnyneVBmidiff57ZwOex+v8b4FH7wAfISiGv0J+pHgCM4EhMn8RnDeUGRBVpva3kjYUF39jj9dKWtUIJb1vjMdFTaXLq8Kd3UD8vCrtrE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(38070700005)(85182001)(36756003)(2906002)(86362001)(83380400001)(186003)(6506007)(26005)(6512007)(54906003)(478600001)(122000001)(6486002)(110136005)(2616005)(316002)(8936002)(4326008)(66476007)(8676002)(76116006)(38100700002)(66446008)(66946007)(66556008)(71200400001)(64756008)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTV6UDRPd29Ua292T0dRWDVOSUY1SWNkS2JYbzZjN0FuYmlma2EzSm94cGxM?=
 =?utf-8?B?SStvdU85R0N3bnNwY2daZnpPSndFZExrV0NYZlBNdkRWOWYrZWlFaFZqYXcy?=
 =?utf-8?B?Uk95OHEyQjFBWklrMmJGRXk0aEsvV1RwdVV5YWUvT0pHRE1mYUlUS0tFakNF?=
 =?utf-8?B?NHpPdEZscDBXME0rTmkyRG40WkZuclNEbmFBbUE4VjdtOXN5M1lYMXEyQkpr?=
 =?utf-8?B?S3JZWklqTXZuem1nU3lHQWtMYW8reUdFKzY4eVNGdDJLMU5tUUUvaXJEUzdL?=
 =?utf-8?B?Wk9NYWNld0NZT2d5QUtKaVJqRHdHR0NxdVI1T3p4TGhNR3BncEVBNnYyM01N?=
 =?utf-8?B?dStUV240UllSY1duaDhSWDZTRXgvUWY1WU1xRnl3WTZRWUJLcHppUVNRM1Zx?=
 =?utf-8?B?c0RSNW9kbDhhM0RoQWZiUnN5SEE5Z3JoSGtkQmtwZUxGSS9MaVhMSHlyNlVL?=
 =?utf-8?B?NGNSeDVOekxxYTc5N2RXbFQ0RjQvWkduNXVPVlpFdlJFYWIyM1FKZkdkZ3Jr?=
 =?utf-8?B?SnVqSTlMQkdpT3IvYzdRZFp2eFpOcjZIdkcvNVVDc1FYczQ3WFE2QjVsNTRT?=
 =?utf-8?B?ZFFLQ2xrL1NDaEZoYVVrOUJsWFUzOHZjTWpXeFNyUEVBL2JiMUc3VEdEakRE?=
 =?utf-8?B?THFpZllkdFZLUjNBaEpiY1BVanBrWWdoSnRJZ2M0UUJCSVdUclpEMlF1bUZF?=
 =?utf-8?B?bGc0M0JXWXp2MlcrRnZFQi9LczNWdW9xaDRYUCtjTjkwRmpNR2VzRkQ5UW52?=
 =?utf-8?B?YzlhVlVXRVV0SHZ1cXpGSnRBSFRxNGtOMWJjcXk2K2FSbFpxS2lvVXJmWWRM?=
 =?utf-8?B?NFF6WFo2Wml3QVBwR3pIVlhOR2RxVGp6VFJneHRXK0pVMGJTanZvamNVTWJI?=
 =?utf-8?B?Mi85NWFxK2dkSU9ZWDlLWHc4c3l3YThBc1FsbnVOa1NsWWNQR1Ftc2FIREE5?=
 =?utf-8?B?aFcrSTJRZ2JJemFmTitoTnpXajFuWGkxL285cXVOdGpHaVBwUDlId2hKL3Er?=
 =?utf-8?B?ZE90UVB4eFYxK0c2RnZ3alIraXJiL1RUZVQrWStOMzJVUHZlQWRQd3lRUmZs?=
 =?utf-8?B?Q3VrVXAyZElTbDhaNnE4Rmo3WkNmSzg4M2p1eUZjZkVJZU1wT0ZVMUF0OHJD?=
 =?utf-8?B?Y3p4djhlRE1wQnkwR3BxZWFLZUFpOFdlL3orVWhJUUt6NVhCU2xZSW9semFm?=
 =?utf-8?B?VVZwZGJFY1hnZ1ZpMkxJbVJxZFc5MW1KbVdJbGZ6MEgyV2FZV2c2TEtCMTNK?=
 =?utf-8?B?b0R2YkVVRWlwcHFiYlI0TjJRd0pJOG1OUGpEb214dzlHeXMvSjc4SnRsbVk3?=
 =?utf-8?B?QVd2MEt6TGI3RThwOGpRVGV5QjFRQ2NMemVzcWlXYmRrblZYcVBlTncrYUw5?=
 =?utf-8?B?aUxNbFdtU0RqT2V3YUQvdGpUNmxLSll5RCsxRklZZGFZSkxvKzY5alBvZnlq?=
 =?utf-8?B?UVFRcTFKZ3V3cityMi9nclEyck9VS1JHZ3I1Wmp5ZHBlR1E5alZaTGtaWUhK?=
 =?utf-8?B?enR5N2tKTUxxNlhvV29vczdIbTA4Z1RtWjkwaG5DTStoSEJaMnhmQlRReVdC?=
 =?utf-8?B?Si9Sc2VTTW5oVGdyMFRhQS9DNTdiUjJ5ZTFYVElCajJoSGdkK2VBZXpMbE5T?=
 =?utf-8?B?SEhuMXZDN0hCeUllQjNOTzZ4b0lVUjF4S3pCWVI2NUc5bEFXRTFIemdaaGZt?=
 =?utf-8?B?d2JrMnptajRiUDJKVG1vYlpoZHNuMU5ZTUV2dHpoL0lNcDMwQXg2TTY5eDRE?=
 =?utf-8?B?TG5JWDVoQUJUVUpaZ0ZWNTRJSjlkZmhZdXlkUFhKNTNhTW9ZZStPUDNXcmNw?=
 =?utf-8?B?QTIvL0k0RUQvL1o5cHBISHNXL2FQRmpkVEV1NkxmSEhQYkQySkppU2grTUlX?=
 =?utf-8?B?Z2pRMDBtK05tQUtRdDlSQ3V5emJpK1F6VXBHVWlwS3k3OW9Xc1RkaFdIWXRR?=
 =?utf-8?B?dWFaZjV6MllxRWh0NWVnSGxiTlpRSWZEQmxndEtrNzM4cmhabWkyZ0RZTU9Q?=
 =?utf-8?B?STQwYytHcThpRjZCUVNGY21McWNvWS9zdmlXTnI4U1pIekMvRFZIWmdUMzVo?=
 =?utf-8?B?MUd2cCt0ditVU2g3d0NKMXluU1FUMnVPa2xha1dLbitlV1dHMkRmOHh1Z2pK?=
 =?utf-8?B?SEp3WkplVldsVzJtOTBGNVpaYnd6SE5LRmtKWUlBSmVWclFRWENyZnZSQjBu?=
 =?utf-8?B?SFE9PQ==?=
Content-ID: <A68BD86FEB7F4C4EAD4936430299E183@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b1ec55-058b-4514-cb5d-08db8e51041d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 03:24:41.5276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i11k3HIbd+Z/6l7Xcq8ewdgV1bC+bE0E+tBuR7RI0FpVLHCqEYhIcvkkCKbi7ZV0SWjfmBGRV7VH4hNfWtIB6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6615
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1751402032.1010491518"
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_1751402032.1010491518
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0yNiYjMzI7
YXQmIzMyOzEwOjIyJiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7RnVuY3Rpb24mIzMyO2RybV9vZl9maW5kX3BhbmVs
X29yX2JyaWRnZSgpJiMzMjtpcyYjMzI7bWFya2VkJiMzMjthcyYjMzI7ZGVwcmVjYXRlZDomIzMy
O3NpbmNlDQomZ3Q7JiMzMjt0aGUmIzMyO3VzYWdlJiMzMjtvZiYjMzI7dGhhdCYjMzI7aW4mIzMy
O3RoaXMmIzMyO2RyaXZlciYjMzI7ZXhhY3RseSYjMzI7Y29ycmVzcG9uZHMmIzMyO3RvJiMzMjt0
aGUmIzMyO25ldw0KJmd0OyYjMzI7ZnVuY3Rpb24NCiZndDsmIzMyO2Rldm1fZHJtX29mX2dldF9i
cmlkZ2UoKSwmIzMyO3N3aXRjaCYjMzI7dG8mIzMyO2l0Lg0KDQpSZXZpZXdlZC1ieTomIzMyO0NL
JiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdu
byYjMzI7Jmx0Ow0KJmd0OyYjMzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tJmd0Ow0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtGZWkmIzMyO1NoYW8mIzMyOyZsdDtm
c2hhb0BjaHJvbWl1bS5vcmcmZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7fCYjMzI7OCYjMzI7KysrKy0tLS0NCiZn
dDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzQmIzMyO2luc2VydGlvbnMo
KyksJiMzMjs0JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7
LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7
ZmRkNWI3MTI2ZTI3Li4wODgyMmZlODhjOTMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjth
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEwNjIs
MTAmIzMyOysxMDYyLDEwJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kcGlfcHJv
YmUoc3RydWN0DQomZ3Q7JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7
JiMzMjtpZiYjMzI7KGRwaS0mZ3Q7aXJxJiMzMjsmbHQ7PSYjMzI7MCkNCiZndDsmIzMyOyYjMzI7
cmV0dXJuJiMzMjstRUlOVkFMOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1yZXQmIzMyOz0m
IzMyO2RybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYtJmd0O29mX25vZGUsJiMzMjswLCYj
MzI7MCwNCiZndDsmIzMyOy0mIzMyOyYjMzI7TlVMTCwmIzMyOyZhbXA7ZHBpLSZndDtuZXh0X2Jy
aWRnZSk7DQomZ3Q7JiMzMjstaWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjstcmV0dXJuJiMzMjtyZXQ7
DQomZ3Q7JiMzMjsrZHBpLSZndDtuZXh0X2JyaWRnZSYjMzI7PSYjMzI7ZGV2bV9kcm1fb2ZfZ2V0
X2JyaWRnZShkZXYsJiMzMjtkZXYtJmd0O29mX25vZGUsJiMzMjswLA0KJmd0OyYjMzI7MCk7DQom
Z3Q7JiMzMjsraWYmIzMyOyhJU19FUlIoZHBpLSZndDtuZXh0X2JyaWRnZSkpDQomZ3Q7JiMzMjsr
cmV0dXJuJiMzMjtkZXZfZXJyX3Byb2JlKGRldiwmIzMyO1BUUl9FUlIoZHBpLSZndDtuZXh0X2Jy
aWRnZSksDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyZxdW90O0ZhaWxlZCYj
MzI7dG8mIzMyO2dldCYjMzI7YnJpZGdlJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOyYjMzI7DQom
Z3Q7JiMzMjsmIzMyO2Rldl9pbmZvKGRldiwmIzMyOyZxdW90O0ZvdW5kJiMzMjticmlkZ2UmIzMy
O25vZGU6JiMzMjslcE9GJiM5MjtuJnF1b3Q7LCYjMzI7ZHBpLSZndDtuZXh0X2JyaWRnZS0NCiZn
dDsmIzMyOyZndDtvZl9ub2RlKTsNCiZndDsmIzMyOyYjMzI7DQoNCjwvcHJlPjwhLS10eXBlOnRl
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

--__=_Part_Boundary_004_1751402032.1010491518
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA3LTI2IGF0IDEwOjIyICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRnVuY3Rpb24gZHJtX29mX2ZpbmRfcGFuZWxf
b3JfYnJpZGdlKCkgaXMgbWFya2VkIGFzIGRlcHJlY2F0ZWQ6IHNpbmNlDQo+IHRoZSB1c2FnZSBv
ZiB0aGF0IGluIHRoaXMgZHJpdmVyIGV4YWN0bHkgY29ycmVzcG9uZHMgdG8gdGhlIG5ldw0KPiBm
dW5jdGlvbg0KPiBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKCksIHN3aXRjaCB0byBpdC4NCg0KUmV2
aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPg0KPiBSZXZpZXdlZC1ieTogRmVpIFNoYW8gPGZzaGFvQGNocm9t
aXVtLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwg
OCArKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
aS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBpbmRleCBmZGQ1
YjcxMjZlMjcuLjA4ODIyZmU4OGM5MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
aS5jDQo+IEBAIC0xMDYyLDEwICsxMDYyLDEwIEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShz
dHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChkcGktPmlycSA8PSAwKQ0K
PiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0KPiAtCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29y
X2JyaWRnZShkZXYtPm9mX25vZGUsIDAsIDAsDQo+IC0JCQkJCSAgTlVMTCwgJmRwaS0+bmV4dF9i
cmlkZ2UpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+ICsJZHBpLT5uZXh0X2Jy
aWRnZSA9IGRldm1fZHJtX29mX2dldF9icmlkZ2UoZGV2LCBkZXYtPm9mX25vZGUsIDAsDQo+IDAp
Ow0KPiArCWlmIChJU19FUlIoZHBpLT5uZXh0X2JyaWRnZSkpDQo+ICsJCXJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgUFRSX0VSUihkcGktPm5leHRfYnJpZGdlKSwNCj4gKwkJCQkgICAgICJGYWls
ZWQgdG8gZ2V0IGJyaWRnZVxuIik7DQo+ICANCj4gIAlkZXZfaW5mbyhkZXYsICJGb3VuZCBicmlk
Z2Ugbm9kZTogJXBPRlxuIiwgZHBpLT5uZXh0X2JyaWRnZS0NCj4gPm9mX25vZGUpOw0KPiAgDQo=

--__=_Part_Boundary_004_1751402032.1010491518--

