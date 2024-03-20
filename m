Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847A880956
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 03:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C24A10E098;
	Wed, 20 Mar 2024 02:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Sp8pFDIz";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="QfIrso03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40E110E098
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 02:04:10 +0000 (UTC)
X-UUID: 2287cbf0e65e11eeb8927bc1f75efef4-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/d8AHleuvSA0eZVEhNnrrDa/rbB4kraPDx7CQLi0KXo=; 
 b=Sp8pFDIzkK1ap/UPNpkL/gecu1ZlyuxwXdWedDePzLmTmruhxDyQ0YICrdLWuldmMgPgDkV1DCZ49rTI2wolyMNYoYb6XFv26B98kxz8xMKGI114CDsEl033M62dqoF4Zdtz+6OXs3YFUH5dywYfDz1dSTHPYlzAy2TP4Rze+M0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:f8a40e75-1519-4186-a0ce-fdd4b7222c87, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:d6019a90-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2287cbf0e65e11eeb8927bc1f75efef4-20240320
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 822556106; Wed, 20 Mar 2024 10:04:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 10:04:06 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 10:04:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGCHqNg7H/aY18G83CvhCz9Gj+PVSj4H7mil0CFnbg/Txt6kCHVhHgMtBVA2vyq7MX6W1GgL2aFw2tX7Y2K7RcYx1fTibgN3t9UdymsHnUad3k8BD0/dRgW6ntxPNaPPVPTVKcCcQcNvRmq2aPVOQHB369+ZRQmaHT2fILk3My7XZNgHmsc5ZVWVr4WCvfm+RHl4d65DfzzCi1lGj8f3XJ1iNcq/vOMmWAPNfplzYV+PGjImmAgK/1HVJ28To5qttf9qyWJl/u+PL3ME2DQaICZFM7K6tdDA9rzEOp03lTd6xJEEHWVr6WaquDqiArSiigXBAyvBW8Q/sr8Rsb+OvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YoqwjH17dIAuiT9OJI2u6OkiiACDACeK6dl1qibooU=;
 b=J1vT5llvJVaHeXWpgSssVeM7Sg43YCg7eR9shMCkt3t4C9xSJf+jSnmVc5PposNgIlbP5b7TOachVZBy/V6u3w6M+XegAVZkJl/PChIkdl497/2u+l6ORQLCbId1IDw0Kp3ksK+KUY4sA1aGLI5NiVGwhdvSpuQennjLfLmNFYy5kWcN7MPQ/6lJQJy7iFtH0i+QK/uC3IGfvFbP53DSv57UZ6GUI+Beih67ecVcJWt7rzix/pM1b/GKFIcPGI6f5wvPS3JIvkeMF/OukNQWE3s98RvU5/E88MfgQF2mKzsOSnxfU+B9aMB9jnCOQQ/I75T65u5Fnl2oi2mIcMEmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YoqwjH17dIAuiT9OJI2u6OkiiACDACeK6dl1qibooU=;
 b=QfIrso03jkSXd6+lL/l7gv7XrMIy2aboQ8bJWs1UPp2+HbWiAK/FY0rgx7FZ4L1WRtaXxHaTmW+MlIDWqba2LYzd+B7ozRkJoxrth3qu8wV0eNmsPaZKnr12j4rRGWE5QlOowSE3g+8fevmAGxzPLT5FqLJ1vFjNidFnTL6wHyU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7730.apcprd03.prod.outlook.com (2603:1096:990:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Wed, 20 Mar
 2024 02:04:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 02:04:03 +0000
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
Subject: Re: [PATCH v2 11/14] drm/mediatek: Rename files "mtk_drm_plane.c" to
 "mtk_plane.c"
Thread-Topic: [PATCH v2 11/14] drm/mediatek: Rename files "mtk_drm_plane.c" to
 "mtk_plane.c"
Thread-Index: AQHaecuVGsFhXJpXT0e3G52RWaZPjrE/4iuA
Date: Wed, 20 Mar 2024 02:04:03 +0000
Message-ID: <58072faffa7127e2fd4e47a8149dbaab1256a59e.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-12-shawn.sung@mediatek.com>
In-Reply-To: <20240319070257.6443-12-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7730:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5rkLqrMlqucFD43NSYiPVuqiFkdD+caupFW4EltwoUx3ek2Eht+6QPVNUlj3QlexawAUU/PUAslmSbQcIpz3T9MQ1MyP9wvoDZlBeX0uadL84O8o/eYQ4K6eWJ01uUo8EFxWEB7+PXABl1VnehasgZyFN7wq6c/l4lNhhJQzRXz/V5iDo3lTEDW/wQqRtEj6m8cN3pp6W8EhcmdFf9jt/zpOtbQqWTeyVkEe29bDXW1UsBtQBUOxVTzo9VbufU8mqCVjJHWJ2zlRXONmINZcfpLVE+qdKYRWYo4rHfcVUcoqVgO/RN6hY6uds1ItGLHsVn31Ftb4jOPYNfrC/A92FeZN9rxbRnlSRR9gKig232lqIOqUhR6dtphFhMxwVOYpR3qjP3A0IxgmjEQFvfClAlaaaJ7iefiJGtji8QSjoxSrC4Iss/N+xkBU96CmmrNK2UTZ9CCl0KZhy7CAQl0gmFI2fCSsnU38drVIad3JK5O7tHaZWeOAdnZmtQ/IzRyXJkOV6ez13fmZeQ2iiaV8A3sv6eKNEvjxIgpV23V5My1eZ4NAVY6GaqzQO0KfcmetJOX3MbA5w5rDVmTYLMNmjVT2MBeTxt01xnSwlfYClG/7smNJJFuLrYMRkjJgIleyfsXPM0cgYgd17jvYrctTCAbaOIoq+VoCiHRcSaFfPDU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG5xWEdvSWVnQlcxSWI1dzJNNCs2TzV3NUVxT2pWVk9wdHJvNTlJOWVTOWlw?=
 =?utf-8?B?TzlmYVVBTFBXU09ad2RzMlZsU0Rxd0YvQ3pCdGFJTnZKZTM2NzZna2VVNUda?=
 =?utf-8?B?OTUzaW9yeEptQXZYQlFEZkxGaGdxTUdzdnllUVBkNWJrMkZTSUwrMkdaL0hB?=
 =?utf-8?B?R3RlUUxKUXVyR2g3bjZ2a1Zva0VNRlBUZXZ2TVc0N3Z1clI3Z0pLaERtSzdF?=
 =?utf-8?B?eEhTRzE1a2dMT1l1bTVEQWk3c1BBa3JwRlVNemxrMmt4YmNlblNOUys5TUNQ?=
 =?utf-8?B?ZFljMGErSWtWSnQyNW13TzE2K1VxZms0dWtkZHZackhzL2hESDQ3M3M2NVJY?=
 =?utf-8?B?VTJEQ2Z2YjZZNmFBdUl1V1FMUGNNRzBDMHdHQitYK1pJK0JSN0czeENOMnNi?=
 =?utf-8?B?OVhDaGlLWFZmVER3aUhkM1dFa2VZbHBuaXV3THRDeW1SR0JjZmkwMkl1VXhy?=
 =?utf-8?B?Z0tkV2hCMWIxMFpvNGx5V0o5ekE0L3VJZk54enZtKzEyNWZEdnJqdFU5QlRm?=
 =?utf-8?B?UjBqQXZ0QjRvdkU4S29RbU9ES1c2dkVhSWpHclZuc2R2eVRXdGdISHhQNGxj?=
 =?utf-8?B?cWZQQ2VPT2lEcFFlS1BwVVUrbnRFTTJFdi9Db2p1ODF6Mk0wNHpJZjRqRDgw?=
 =?utf-8?B?OERXZUNrS1Z3aDRPRW5tSGpnWlE4WittelUvN1RBQ2ZxWW5GQjBwcWljcmJS?=
 =?utf-8?B?TDFKS2JNdUtOcWJXY25TYmZsVnJiRE5VSmo0c1VGandnZXVNY1NZSjBRU3Vy?=
 =?utf-8?B?NCtNanYyZVpnZ2MyY3l1aUtRaVlINlh0MzFNbkJtdUF1SDc4d3RZVlJuZjds?=
 =?utf-8?B?ejREdDlGUFJFQmFsaDl2ZXhNSWluUStkRW42eVdjeFhTZHlqTmxBbjdyMmhC?=
 =?utf-8?B?OENObnI4eVRGeGhLN1ByUndNNjhpRjgrL000dUF2Q1Mzb3JySzV3QXNxQXZW?=
 =?utf-8?B?SktJSGszV1NUcEpxb0ZYUzBtQlJTT3FrZW9sS1QwREdtekJHa2JzdElQYTBl?=
 =?utf-8?B?dU12UzJ0eGdYREpOL2l6OEZWS0dGQnU5RTJXTlZuRit5MWFPUlZDMmc5ZDAw?=
 =?utf-8?B?ZmFLSm56TVc5WmtIOVJsUUVzR0Z0TjBMUWxMWG9KRFQvWm1peGE1UEhGQTdU?=
 =?utf-8?B?dE1lMUY4N0g2WVdDMUtxd2Y0UEZhQlJBM0l3WDNRTXZneE52c0c1SFREUnJX?=
 =?utf-8?B?NHhsdkRkU0U1YjJidHREdytkTnh0S01PcFRCMWM5ajQyK0pVNUl1WklYZnIv?=
 =?utf-8?B?Vy9KUWZTUXg0cUlWVTJFeUg3Nkp0UzFUTGw0eCt0WXZPU0w0T2JLMWpmN1JS?=
 =?utf-8?B?b2lGeE1iNmJuMEtiQURQRVppZzJuQzlyRnZCWW84b29XOHdObHMxM251WnFT?=
 =?utf-8?B?TU9yVzNoQktSSjRLSGYrRWVVUGlCekdndFdpeElQVTVaRDJGeE5jSE9FVXd4?=
 =?utf-8?B?aVhOTGV1a1JVdGtpVEtaWWJMT2EvU0JzZkxmQzV5d1ZBbktEWUZ2ZmtVVURp?=
 =?utf-8?B?TE9PVCs1cmZSUmFRZWYrcE1jY2ZmdkY4RnJLKzJFQnIzY3pReTVZWTh2WmNm?=
 =?utf-8?B?dVhQNy93UkZ2NUg3TlFjT1VSOStzU2RPanpkbzJkTk8wMXdFOGZXL1BxZTY3?=
 =?utf-8?B?RWtsYUR2d2NCZFhtV0hwWkwxY2pKMHFVSEp0eGpKWWx2TGZGU1lHbXNocEk3?=
 =?utf-8?B?SmpUZFpkTTZhTnM0aE9KVXBmT3NSSTcvVFZCRGFqSmVxRk1BYTBOREpYMG9i?=
 =?utf-8?B?M2hrMFArbk9kaU1lRkcvRmh5T2h1MURsTFpROHBZV29ocDdncnlVeEh1aWxM?=
 =?utf-8?B?Z05BY3ZaZmxGeUkxMEVpa0VjNEd1VnhlUG9rMlpZc2xzZkxkWDhZeEcvYzdm?=
 =?utf-8?B?WFZNTVIvTmhLYktIR2Q1VUNrYXlxWmp6WXdYZFlNWU1GOVp4bWRHUXExSWRi?=
 =?utf-8?B?TmFXYk1TeEpFZE40MUJuazhJZWUzbEZMenlzLzlvaXg0ck1EMG0zYlFYc2ZG?=
 =?utf-8?B?TXpDRXQvT0c2MDdsWlIwNFRiTlAxdzJpMW9RUlRHSEpNYk9IaWpNWEhjVXcr?=
 =?utf-8?B?T0hFeWh6cEJyc0ZldmJrZ3FZR1JUSGFDKzZ4MDlIMVJxUDVUcjdURVM0RGN6?=
 =?utf-8?Q?JVdni1kvwrlDSxlqjp0CzcWvE?=
Content-ID: <FE784056B2AE934EAADEA9EC7191095B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d079f08-ee99-470f-4817-08dc4882044b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 02:04:03.4146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w1Z7SuXnjBtiu7DQKyk3QcbY4b9BbIBJxyJEbdQB4bZTGIZjhJVQd1ihZ7e/vHbqP7ILOaPqQihVJafHUua5qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7730
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.217300-8.000000
X-TMASE-MatchedRID: wQVy7q402w3+DXQl7XSOUia1MaKuob8PofZV/2Xa0cKSO6So6QGgysNq
 SYgiOmwd8cv4yT0rvGOawlpOGeSY1gDNPxu11HXjA0ncQPC5QKVBrawMcuRDTjhgoAzehG32fdQ
 7p2bSGhbi8zVgXoAltj2Xsf5MVCB1VSqH97/I9DGx5amWK2anSPoLR4+zsDTtD12T7q2dIUuXg1
 xnW5rjcKJvW8OM5MK0JD77ogz9HtSEuRGVFQBAZQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.217300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BB8F48759CA9C8E8A569BC8756EE0DD6F556E3BDC013FB44EA6C0E0785F40A172000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1771842020.296678931"
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

--__=_Part_Boundary_005_1771842020.296678931
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMTU6MDIgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgZmlsZXMgbXRrX2RybV9wbGFu
ZS5jIHRvIG10a19wbGFuZS5jIGFuZA0KPiBtb2RpZnkgdGhlIE1ha2VmaWxlIGFjY29yZGluZ2x5
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8DQo+IHNoYXduLnN1bmdA
bWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsve210a19kcm1fcGxhbmUuYyA9PiBtdGtfcGxhbmUu
Y30gfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsve210a19kcm1fcGxhbmUu
YyA9PiBtdGtfcGxhbmUuY30NCj4gKDk5JSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFr
ZWZpbGUNCj4gaW5kZXggYmRiNzE3MzhlMWYzMS4uYTQ3ZmJlYzdiOWNlMSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiBAQCAtMTIsMTIgKzEyLDEyIEBAIG1lZGlhdGVrLWRy
bS15IDo9IG10a19jcnRjLm8gXA0KPiAgCQkgIG10a19kaXNwX3JkbWEubyBcDQo+ICAJCSAgbXRr
X2RybV9kcnYubyBcDQo+ICAJCSAgbXRrX2RybV9nZW0ubyBcDQo+IC0JCSAgbXRrX2RybV9wbGFu
ZS5vIFwNCj4gIAkJICBtdGtfZHNpLm8gXA0KPiAgCQkgIG10a19kcGkubyBcDQo+ICAJCSAgbXRr
X2V0aGRyLm8gXA0KPiAgCQkgIG10a19tZHBfcmRtYS5vIFwNCj4gLQkJICBtdGtfcGFkZGluZy5v
DQo+ICsJCSAgbXRrX3BhZGRpbmcubyBcDQo+ICsJCSAgbXRrX3BsYW5lLm8NCj4gIA0KPiAgb2Jq
LSQoQ09ORklHX0RSTV9NRURJQVRFSykgKz0gbWVkaWF0ZWstZHJtLm8NCj4gIA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KPiBzaW1pbGFyaXR5IGluZGV4IDk5JQ0K
PiByZW5hbWUgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQo+
IHJlbmFtZSB0byBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gaW5kZXgg
OTVhNDMyOGE5YjBiNi4uNDYyNWRlYjIxZDQwNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX3BsYW5lLmMNCj4gQEAgLTE2LDcgKzE2LDcgQEANCj4gICNpbmNsdWRlICJtdGtf
Y3J0Yy5oIg0KPiAgI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19k
cm1fZHJ2LmgiDQo+IC0jaW5jbHVkZSAibXRrX2RybV9nZW0uaCINCj4gKyNpbmNsdWRlICJtdGtf
Z2VtLmgiDQoNClRoaXMgc2hvdWxkIGJlIGFub3RoZXIgcGF0Y2guIEFmdGVyIHJlbW92aW5nIHRo
aXMsDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQoNCj4gICNp
bmNsdWRlICJtdGtfcGxhbmUuaCINCj4gIA0KPiAgc3RhdGljIGNvbnN0IHU2NCBtb2RpZmllcnNb
XSA9IHsNCg==

--__=_Part_Boundary_005_1771842020.296678931
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1R1ZSwmIzMy
OzIwMjQtMDMtMTkmIzMyO2F0JiMzMjsxNTowMiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmVuYW1lJiMzMjtmaWxlcyYjMzI7bXRrX2RybV9wbGFuZS5j
JiMzMjt0byYjMzI7bXRrX3BsYW5lLmMmIzMyO2FuZA0KJmd0OyYjMzI7bW9kaWZ5JiMzMjt0aGUm
IzMyO01ha2VmaWxlJiMzMjthY2NvcmRpbmdseS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0Ow0KJmd0OyYjMzI7
c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsNCiZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO3wmIzMyOzQmIzMyOysrLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL3ttdGtfZHJtX3BsYW5lLmMmIzMyOz0mZ3Q7JiMzMjttdGtfcGxhbmUuY30mIzMyO3wm
IzMyOzImIzMyOystDQomZ3Q7JiMzMjsmIzMyOzImIzMyO2ZpbGVzJiMzMjtjaGFuZ2VkLCYjMzI7
MyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzMmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7JiMz
MjtyZW5hbWUmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay97bXRrX2RybV9wbGFuZS5jJiMz
Mjs9Jmd0OyYjMzI7bXRrX3BsYW5lLmN9DQomZ3Q7JiMzMjsoOTklKQ0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZp
bGUNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQomZ3Q7JiMz
MjtpbmRleCYjMzI7YmRiNzE3MzhlMWYzMS4uYTQ3ZmJlYzdiOWNlMSYjMzI7MTAwNjQ0DQomZ3Q7
JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQomZ3Q7JiMz
MjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQomZ3Q7JiMzMjtA
QCYjMzI7LTEyLDEyJiMzMjsrMTIsMTImIzMyO0BAJiMzMjttZWRpYXRlay1kcm0teSYjMzI7Oj0m
IzMyO210a19jcnRjLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZGlz
cF9yZG1hLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZHJtX2Rydi5v
JiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2RybV9nZW0ubyYjMzI7JiM5
MjsNCiZndDsmIzMyOy0mIzMyOyYjMzI7bXRrX2RybV9wbGFuZS5vJiMzMjsmIzkyOw0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7bXRrX2RzaS5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7bXRrX2RwaS5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2V0
aGRyLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfbWRwX3JkbWEubyYj
MzI7JiM5MjsNCiZndDsmIzMyOy0mIzMyOyYjMzI7bXRrX3BhZGRpbmcubw0KJmd0OyYjMzI7KyYj
MzI7JiMzMjttdGtfcGFkZGluZy5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjttdGtf
cGxhbmUubw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7b2JqLSYjMzY7KENPTkZJR19E
Uk1fTUVESUFURUspJiMzMjsrPSYjMzI7bWVkaWF0ZWstZHJtLm8NCiZndDsmIzMyOyYjMzI7DQom
Z3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9wbGFuZS5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxh
bmUuYw0KJmd0OyYjMzI7c2ltaWxhcml0eSYjMzI7aW5kZXgmIzMyOzk5JQ0KJmd0OyYjMzI7cmVu
YW1lJiMzMjtmcm9tJiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5j
DQomZ3Q7JiMzMjtyZW5hbWUmIzMyO3RvJiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X3BsYW5lLmMNCiZndDsmIzMyO2luZGV4JiMzMjs5NWE0MzI4YTliMGI2Li40NjI1ZGViMjFkNDA2
JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19wbGFuZS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTE2LDcmIzMyOysxNiw3JiMzMjtAQA0K
Jmd0OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7JnF1b3Q7bXRrX2NydGMuaCZxdW90Ow0KJmd0OyYj
MzI7JiMzMjsjaW5jbHVkZSYjMzI7JnF1b3Q7bXRrX2RkcF9jb21wLmgmcXVvdDsNCiZndDsmIzMy
OyYjMzI7I2luY2x1ZGUmIzMyOyZxdW90O210a19kcm1fZHJ2LmgmcXVvdDsNCiZndDsmIzMyOy0j
aW5jbHVkZSYjMzI7JnF1b3Q7bXRrX2RybV9nZW0uaCZxdW90Ow0KJmd0OyYjMzI7KyNpbmNsdWRl
JiMzMjsmcXVvdDttdGtfZ2VtLmgmcXVvdDsNCg0KVGhpcyYjMzI7c2hvdWxkJiMzMjtiZSYjMzI7
YW5vdGhlciYjMzI7cGF0Y2guJiMzMjtBZnRlciYjMzI7cmVtb3ZpbmcmIzMyO3RoaXMsDQoNClJl
dmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0K
DQoNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZxdW90O210a19wbGFuZS5oJnF1b3Q7DQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjt1NjQmIzMy
O21vZGlmaWVyc1tdJiMzMjs9JiMzMjt7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEt
LXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250
YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRz
KSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3
aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMg
aW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVu
dChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCBy
ZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFj
aG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVk
IGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRl
bHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGll
cyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIg
c3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_1771842020.296678931--

