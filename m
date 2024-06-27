Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E9919DCD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 05:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A049010E9F4;
	Thu, 27 Jun 2024 03:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PKzZVwx4";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="V8TpnijI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ADB10E9F4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 03:21:24 +0000 (UTC)
X-UUID: 51f7fff8343411ef99dc3f8fac2c3230-20240627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=q2itrmTVaGpWXinvwUei/0C2w4Mr0HExSZDCymL4f4o=; 
 b=PKzZVwx4dQMT1krUx7KGnGM/TU0c2Kpv1ABnyVQj9X+1zWCOybJIL50pvutUowtCzZAyxisML43xHQ004GkAziCrS8wz7Q6pk/5lpH0Qs0CgQsG/x1ij6gZ22UD/GKHrXU7MUkSgbag4muinInZWDtrdnTHpkk3t0/CntMv56zo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:e35b7924-a383-45e4-a706-a6616db198ca, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:dec49585-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 51f7fff8343411ef99dc3f8fac2c3230-20240627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1478224692; Thu, 27 Jun 2024 11:21:18 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jun 2024 20:21:18 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jun 2024 11:21:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA/ETgJxUf3WCSwYgqwA4VXA6GI7wy7sS/PSROMOZUkkKaxZ5A8WEaJ3lkUEqXJ7mb7/7PjjgAkQiZC/GSs2tg0v8qG+dbWuDaFnp5Rf3l7PnVONIJC6dNmtqfK8FGjvVodWoqongmeMakSMisR116xXKMkI6IaNba6RNV6/gTB/2XN56mCatGY4qIklxhFMBe9pAP4vS/7ItYuxcisvYppe2H6Me4MBBESyErL1aUSki5CiUIOgCmKqC2UV6xGDFpZk8ql9n8Xz6UIU7tQieY63EGgduCEVsjTwEAwcWr8DhmXDy8OZsTC6l+RpJt8QwKTyX8PR7WBKZvCUmX7i2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTleM43uzHKBha3s7orvefkOJvvxAWrmkxHQJvV458k=;
 b=Q4jkWowbcZLW20E3WJ4m9yW94LHtdu2dQn8r7FYyzi1Fe6sjPf56rsLXNvOQiQq17ZCYdFINvqUqSJL6YTTaF5qFoJ0wR7GoSgrkmLwrABN8xtf68o2vyMQmK5ZzVSLDyFEMsnclUm9jZvCekfaiHX4zdlYrilFjvPQR1M6bcupQ2s2c+KZsClreZmJItpaWFP4lUAmT2Uyo/yWDlGSr91B1hdy+ygvB9mnUnU2qsVa97k2G3gsb2RHg0V+4yZLwrxbvRg51lMFgi4KHpSOHI7Qx21wRbGeJ9bESAIqeIyqKdSeHQF3RuU/ozYyRIevDZeauEdzl4KNqQoMy7aW/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTleM43uzHKBha3s7orvefkOJvvxAWrmkxHQJvV458k=;
 b=V8TpnijIxHk86B/Ghz6Ox/NiSQuV4QEOntCzdCeS1WnZBjsZ/bI0R/ZYSK/9SrxqScTDN9SCtEz8x4MpX7folfc/ucmkxAsbDV8Q4nqxzeAYhttkmmW3kBFYKb1efJZMnjkrLFKP5crIBqplWx5+GNQraJfczX0s9l26H4ogrqs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6649.apcprd03.prod.outlook.com (2603:1096:101:83::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 03:21:15 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 03:21:15 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Topic: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Index: AQHaxufGtXYlJ2nIzkCmfICpDUjhvbHYUI0AgAAN6YCAAVLnAIAALb0AgAB3fQCAAJ26AA==
Date: Thu, 27 Jun 2024 03:21:15 +0000
Message-ID: <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
In-Reply-To: <ZnxWWtdShekGSUif@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6649:EE_
x-ms-office365-filtering-correlation-id: ec3a9cee-76ed-423b-c5d0-08dc9658341d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0JRV3VjdnVCQW8xN2p6UDdiTVQza1FTYndBQ2RxU3pyTjluRUZDYVQwQ29u?=
 =?utf-8?B?YnBua1Q1eDRRdFFEZXEwWlhJTUcxZ00vdDU3b0x1UVZNUnprSTQ4RkRoRjVL?=
 =?utf-8?B?TkJja0d0bExuM1d5MWhyL1JGeGhJVkpmK0pGRFBOKzUwSmRtM3E0K3Fkc1dS?=
 =?utf-8?B?K0xVSWRjeHlDNW5HWEZ1Mkh4SVY2OUhtSGZwb3lYVTNWR1JqZFFNc1pHUWp0?=
 =?utf-8?B?cjhPUmgyOWtrenUxRkcvTFNOajFwTHh5ZE9hNFYvYUFvUHI0c2I2ckVGMGZk?=
 =?utf-8?B?aFZ3WlphRUtNSnBqWUVhK1VSd0UzZWM4QmtKNUNKOTFOYmJ5OEJZM1pJcUpw?=
 =?utf-8?B?eGNwOTFmRVppeW91d09rWkNNa0NZcUV4cjd2blRiakt1Wmp4eHo1SDNGZHZ4?=
 =?utf-8?B?ek45UmhnZEVyTTR3dllRT0NydXBUZFdmb05jRFBJSW5hTVNEMjNLUldVNU5E?=
 =?utf-8?B?eDZnaTV3ajBMUjlSSEdmNVNEb2djMHhtNnBEb3BNaHVEMzN3MTFvcUxzazJU?=
 =?utf-8?B?OFQ5TStyNjV2Qm5nbW42V1pXVStOR0Zsa1JTSE1oekx2VFFqQXNQa250MnFp?=
 =?utf-8?B?ajIrRkNNazhVc3MvT0NndHhCZXUyeFE4aXRncjFCb2V2QWVhajB4V0VCRnJn?=
 =?utf-8?B?WERkdzFWNUJtN0VLelRxYzRnY29oUFo2WUcxQ25wV0lZVUxvMGlqdWliV0Zk?=
 =?utf-8?B?ZkFrWTRlWjZidnFsMCtoZjhUQnBjeWpqcXBoTDVCMjN0VmRFVW9CWFQ1Z1hQ?=
 =?utf-8?B?NmhRQ3hTWERwN0lOMm5BdGEveUlWc3ByWGJtdGp3NWx5RkNjMEdSdDZodjRa?=
 =?utf-8?B?NWZzZjFiYTlySkZNMUoxSmUrYmtUY2dpYnlMN1Q0NXZVNDlibzEyV3FaQWxa?=
 =?utf-8?B?bWQ5SmlKQWpZeENxakpmanVEY1o4RVhjUEdhaGoyT3VaRndLRXFOK3JBN01T?=
 =?utf-8?B?Sis3dVY4Wjc3WTBIeGMzUUFTMXhFUDlnRW5CSVNOU3BqSzVjenVxcHJJN25T?=
 =?utf-8?B?MnI2SnFCWXJXQmcwdXJ3WGVPcW8vK0N4VFA5L0M0Q2h6SitJeUlGSXNTS3pq?=
 =?utf-8?B?S2J5REVuSUZpOFRjOE9yOXE3ZlY4dDg5Z1RNTVNiSWk0Qi9QQWw5QVRKNk54?=
 =?utf-8?B?UkxwM3BNOC9mZWFhM2VGVkkvNGtRM0tmRWdaY1JpNE5Ubm1tbFJrMitpMXJU?=
 =?utf-8?B?RWJhRVh2WGRPaWFnT2gvQWRmdUtzc1E2YzFnU0hMVktjTDNyNlNFS1RnM3BD?=
 =?utf-8?B?bk9XZmFkbmpGSFFRbDFxblJvWWsvc2RLUmU5QzBSL2NYYmg2N1JqMFowcUwv?=
 =?utf-8?B?dWdrNGx3MGlVcWl3dnhPd0lkak94d2o2WS9aSEdRS3lmR1lHdEtBcFBKMDFx?=
 =?utf-8?B?MThZRDhzYXNBQzdxeGlHQStOeGk1dmI4ejR1K0hOVkZEYU1paVBwVEVpTE8y?=
 =?utf-8?B?ajBDUlFvR0hkWVFRRWdBNTdIdnA1THB3ZjZPdm9yZUtlMVVMS1lQeUpJUUgz?=
 =?utf-8?B?amxlNko4Uk9KbFkxcFVhb0huTDZ6V2NmeGUrYnpZSS9FSjBPaU82T05zMnJ3?=
 =?utf-8?B?dHlpUlBCZmd3QkFIZ29zMFR4NUtSM0dtRERNNTVBci93VkhiZVNyUndBNm5S?=
 =?utf-8?B?RFQydXcxUlB4ZFFFeGxCa2tqS2RLU3FnYXN0SUI4b29KeUlYZXVmSGFJc3g1?=
 =?utf-8?B?b1JkWGdtTkp1VVpVdnhjRWpRcHNWUks3L2FJL0l1dWpHaG1YaTVFa2hMSXlx?=
 =?utf-8?B?empTSENQNnd3ejMrcG4xNFhRRStDRTAzVHZ2NFkwTnUxRXZZZjZjTTNKTEtD?=
 =?utf-8?Q?mP3rhgLKcanRvvgi7qrPp9ksCsxqBcm38+eo0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czRPRloxN1dORDNCZTc3Q01Kc2lKckZ0T0RCS3BESVdXN1pBRTB1UTRwUDN1?=
 =?utf-8?B?UWpUUWVoZm92eXFsbk54NTVTekZlR2I2aElVRm9lNG05a0xzeEtMVzdBVmlt?=
 =?utf-8?B?ZVFiRUlVZWdlSkhlZmxxWExLVEFWL0dLZGVVbjdvUU1JNHdGaytoV0d4VUt6?=
 =?utf-8?B?MWwvdUxQMzE4T3lOOWZjZkNkV2RUNi9BVzF2cmxlbTJubVhyYU9VWkhpQStK?=
 =?utf-8?B?ZWlXTmxGSWtwRWN4VXpvRmdEcUIzcDVzYk9mU0J3Z1ZyK2hXYmY4MnNBQjZ0?=
 =?utf-8?B?cjZ5cXBYYzh4cHdQSEtCNkZSNlFFVUdRT3FrUVhIR1VkTGM0UkNDaUJyeW9F?=
 =?utf-8?B?d3dRdWVEODRJY0FUanlRSU5Ha0FmOE8vbnZ0enpHRzBIWDFYVGFLVVJaM2lK?=
 =?utf-8?B?QmNja0x2RXZmTEdjbEtaLzVSYmZHd3diWFluMDhuRlpSNGVhKzNEdXJKN1Vy?=
 =?utf-8?B?eHNrRkJ0SVo5eng1NUdJRUZVNTVJWHdnK1FwdjlrMlJpaEFDNTEyR3lUdWlT?=
 =?utf-8?B?OUN3RDNFc3diL1VrcnV1RzY0ZnRNejhmUThXd2htSWh4dzNHclNjOCtLRGVS?=
 =?utf-8?B?cXJxRjJxaHdGMEhiK2doL0hGRVlUL213UEtvUkRiLzY4ZGduTDd1MlpJc1FS?=
 =?utf-8?B?cjdNTTlRdTdiQ01Xa29Jd1NpUGJiK0NZK05jeFpxYlY2b1RaOCtPaE5XM1Mv?=
 =?utf-8?B?SG9nVzRsUXZCQlJQai8vbmR2K3NNc2VndzZYd1QwQ2NEMUIxVFV0bE0rSlc3?=
 =?utf-8?B?bEJacGh1Y0oyV1FtamNhU1pyMkZCUkNoTW9rTjN6QzVDT3pVb3NDdnNZYncx?=
 =?utf-8?B?cWZjUisxZjhmdWs4UDFpSzk0eFBrcHpwY0tyK3VsY2RhVHVTUXlIZGoyU3k1?=
 =?utf-8?B?M0xiY1NrQWQwSktEa2Z0QVhERUVNRWF0TlVyUVRWVDBjZi9CQlN5cGhpOFJ5?=
 =?utf-8?B?aEwremdLaXJ0V09GYS9TYjhvbngvZFp2SnMzcmZ0aWsyekR5NjMrNE9YYlBz?=
 =?utf-8?B?QkZLV0c1VmpvMnplUWQrREVnNWhiV3dCR3JDeU03SWFBMWpnVVVKY0VQcDB1?=
 =?utf-8?B?amw1S0JRWUJuTitvT3hsVlBpV1JFRmgyMG9UY3R3Yk1ONmFiTzh2NGc4NGNB?=
 =?utf-8?B?MnZGZWRsakE1L3IzY21VTlJLNzE5bzd4RmUyRkRybHVVQjJSQ3p6MkFnSzVQ?=
 =?utf-8?B?c3Uzb1ozSkxaTTNRRDJMVElPc2Vac1h6Y0J4WURLQTF2N21yWU1YQlVNaFNi?=
 =?utf-8?B?TkJSaytoMFhsNEZQSlhldE1IT3M3dHF1Y2oyNUtmWUlOZGNOT0JBMVNLNDVl?=
 =?utf-8?B?Sm1ROFVYNUhhbVhtVU0vOHRmdDU3U3V4SmNIazMwNHZ3OHZ0VnBiazkrejJZ?=
 =?utf-8?B?b1Z5S1VobWUrVTJlUEJnODRzYzl5T2RNaXV5Q2IrU2ZOem5HVVRyNjg1TGRK?=
 =?utf-8?B?Njl0Q0Uxd3MwNHVnMVJSS3Z5ZjZWeWkxTzJUQVNCQ2dMVFQ5NnI0bC9kVUs1?=
 =?utf-8?B?dE9uc29EZlV4Y1dHZklZUUY5clp5eXpXdHBFQ3FBYlF1blF4ejFUVktPdGs2?=
 =?utf-8?B?NWV3NTZyODVGTi9oY3EzdXNEMUhTNVlFVkFBNDBvd3p4Z0RkTWVidDd6Z1A2?=
 =?utf-8?B?ck81Tmh2UHhtNUtESnN4R1V1QnhyTmlHVEV3UldKWFJQeWNYbWJzSjNsVlhG?=
 =?utf-8?B?NEpENDRULzNBckZWMmFPVFRLeUs2M0VQQUJUR2tLSTlzUVg2b05TcGdteHpM?=
 =?utf-8?B?ZXhTSWhjOGVYdS9kRGJTUkxWbWx6Q0lZZndQKzFXbm1SM1JFYWw3YWtEZE5w?=
 =?utf-8?B?cnZMaUxyamNDeXdPSFA0YUREZEJ3WkdjMHZQRk9FT1ozMmw5MnFiWFpZVFNu?=
 =?utf-8?B?RktGbWdob01ESUVnbE9MR01mcEh0NGxuU0tBdmNuYVB0azZqTXhvOEFOWnY0?=
 =?utf-8?B?YTNzU0RNbEFuVWdnK2VGN1g4Yzh5TktwNFJmM0tvdGRrdWVVZXBmWG9oZytO?=
 =?utf-8?B?aUZQR0pucGN5akJJL25Uamt6MndoNE9NUmxpYVVaL3RPLzR0ak1FSzY1a3Mx?=
 =?utf-8?B?dUc4djN0cGZUQjVISHdvNk1WQjZ6SERGbkk4RTMwOHhEdDVieFVXbW1Genc2?=
 =?utf-8?B?MkRubU9lRS9YUXhMWnlkZHdyY1pvdEVnSTNVVnhUa2Y1RFZtK0dmczBqeWNR?=
 =?utf-8?B?L0E9PQ==?=
Content-ID: <BB208B0597DBEF469E68D9BD1A30E572@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3a9cee-76ed-423b-c5d0-08dc9658341d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 03:21:15.5178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tND+yDQUh1wkA0bfvYSJnfmHZm9r+Zhx+521mPdADtfzm5E0av+TgDxrJXmg6mZwQ1zY8yyexDEvn0Onybd/o4MsVUUctF0Q2vxHqvOQHIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6649
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_954525159.1238704056"
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

--__=_Part_Boundary_008_954525159.1238704056
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTA2LTI2IGF0IDE5OjU2ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIE9uIFdlZCwgSnVuIDI2LCAyMDI0IGF0IDEyOjQ5OjAyUE0gKzAyMDAs
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+ID4gQW0gMjYuMDYuMjQgdW0gMTA6MDUgc2Nocmll
YiBKYXNvbi1KSCBMaW4gKOael+edv+elpSk6DQo+ID4gPiA+ID4gSSB0aGluayBJIGhhdmUgdGhl
IHNhbWUgcHJvYmxlbSBhcyB0aGUgRUNDX0ZMQUcgbWVudGlvbiBpbjoNCj4gPiA+ID4gPiA+ID4g
DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjQwNTE1LWRtYS1idWYt
ZWNjLWhlYXAtdjEtMC01NGNiYmQwNDk1MTFAa2VybmVsLm9yZy8NCj4gPiA+ID4gPiA+ID4gSSB0
aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGUgdXNlciBjb25maWd1cmFibGUNCj4g
cHJpdmF0ZQ0KPiA+ID4gPiA+IGluZm9ybWF0aW9uIGluIGRtYS1idWYsIHNvIGFsbCB0aGUgZHJp
dmVycyB3aG8gaGF2ZSB0aGUgc2FtZQ0KPiA+ID4gPiA+IHJlcXVpcmVtZW50IGNhbiBnZXQgdGhl
aXIgcHJpdmF0ZSBpbmZvcm1hdGlvbiBmcm9tIGRtYS1idWYNCj4gZGlyZWN0bHkNCj4gPiA+ID4g
PiBhbmQNCj4gPiA+ID4gPiBubyBuZWVkIHRvIGNoYW5nZSBvciBhZGQgdGhlIGludGVyZmFjZS4N
Cj4gPiA+ID4gPiA+ID4gV2hhdCdzIHlvdXIgb3BpbmlvbiBpbiB0aGlzIHBvaW50Pw0KPiA+ID4g
PiAgPiBXZWxsIG9mIGhhbmQgSSBkb24ndCBzZWUgdGhlIG5lZWQgZm9yIHRoYXQuDQo+ID4gPiA+
ID4gV2hhdCBoYXBwZW5zIGlmIHlvdSBnZXQgYSBub24tc2VjdXJlIGJ1ZmZlciBpbXBvcnRlZCBp
biB5b3VyDQo+IHNlY3VyZQ0KPiA+ID4gPiBkZXZpY2U/DQo+ID4gPiANCj4gPiA+IFdlIHVzZSB0
aGUgc2FtZSBtZWRpYXRlay1kcm0gZHJpdmVyIGZvciBzZWN1cmUgYW5kIG5vbi1zZWN1cmUNCj4g
YnVmZmVyLg0KPiA+ID4gSWYgbm9uLXNlY3VyZSBidWZmZXIgaW1wb3J0ZWQgdG8gbWVkaWF0ZWst
ZHJtIGRyaXZlciwgaXQncyBnbyB0bw0KPiB0aGUNCj4gPiA+IG5vcm1hbCBmbG93IHdpdGggbm9y
bWFsIGhhcmR3YXJlIHNldHRpbmdzLg0KPiA+ID4gDQo+ID4gPiBXZSB1c2UgZGlmZmVyZW50IGNv
bmZpZ3VyYXRpb25zIHRvIG1ha2UgaGFyZHdhcmUgaGF2ZSBkaWZmZXJlbnQNCj4gPiA+IHBlcm1p
c3Npb24gdG8gYWNjZXNzIHRoZSBidWZmZXIgaXQgc2hvdWxkIGFjY2Vzcy4NCj4gPiA+IA0KPiA+
ID4gU28gaWYgd2UgY2FuJ3QgZ2V0IHRoZSBpbmZvcm1hdGlvbiBvZiAidGhlIGJ1ZmZlciBpcyBh
bGxvY2F0ZWQNCj4gZnJvbQ0KPiA+ID4gcmVzdHJpY3RlZF9tdGtfY21hIiB3aGVuIGltcG9ydGlu
ZyB0aGUgYnVmZmVyIGludG8gdGhlIGRyaXZlciwgd2UNCj4gd29uJ3QNCj4gPiA+IGJlIGFibGUg
dG8gY29uZmlndXJlIHRoZSBoYXJkd2FyZSBjb3JyZWN0bHkuDQo+ID4gDQo+ID4gV2h5IGNhbid0
IHlvdSBnZXQgdGhpcyBpbmZvcm1hdGlvbiBmcm9tIHVzZXJzcGFjZT8NCj4gDQo+IFNhbWUgcmVh
c29uIGFtZCBhbmQgaTkxNS94ZSBhbHNvIHBhc3MgdGhpcyBhcm91bmQgaW50ZXJuYWxseSBpbiB0
aGUNCj4ga2VybmVsLCBpdCdzIGp1c3QgdGhhdCBmb3IgdGhvc2UgZ3B1cyB0aGUgcmVuZGVyIGFu
ZCBrbXMgbm9kZSBhcmUgdGhlDQo+IHNhbWUNCj4gZHJpdmVyIHNvIHRoaXMgaXMgZWFzeS4NCj4g
DQo+IEJ1dCBvbiBhcm0geW91IGhhdmUgc3BsaXQgZGVzaWducyBldmVyeXdoZXJlIGFuZCBkbWEt
YnVmDQo+IGltcG9ydC9leHBvcnQsIHNvDQo+IHNvbWV0aGluZyBlbHNlIGlzIG5lZWRlZC4gQW5k
IG5laXRoZXIgY3VycmVudCBrbXMgdWFwaSBub3INCj4gcHJvdG9jb2xzL2V4dGVuc2lvbnMgaGF2
ZSBwcm92aXNpb25zIGZvciB0aGlzIChhZmFpaykgYmVjYXVzZSBpdA0KPiB3b3JrcyBvbg0KPiB0
aGUgYmlnIGdwdXMsIGFuZCBvbiBhbmRyb2lkIGl0J3MganVzdCBoYWNrZWQgdXAgd2l0aCBiYWNr
Y2hhbm5lbHMuDQo+IA0KPiBTbyB5ZWFoIGVzc2VudGlhbGx5IEkgdGhpbmsgd2UgcHJvYmFibHkg
bmVlZCBzb21ldGhpbmcgbGlrZSB0aGlzLCBhcw0KPiBtdWNoDQo+IGFzIGl0IHN1Y2tzLiBJIHNl
ZSBpdCBzb21ld2hhdCBzaW1pbGFyIHRvIGhhbmRsaW5nIHBjaXAycGRtYQ0KPiBsaW1pdGF0aW9u
cw0KPiBpbiB0aGUga2VybmVsIHRvby4NCj4gDQo+IE5vdCBzdXJlIHdoZXJlL2hvdyBpdCBzaG91
bGQgYmUgaGFuZGxlZCB0aG91Z2gsIGFuZCBtYXliZSBJJ3ZlIG1pc3NlZA0KPiBzb21ldGhpbmcg
YXJvdW5kIHByb3RvY29scywgaW4gd2hpY2ggY2FzZSBJIGd1ZXNzIHdlIHNob3VsZCBhZGQgc29t
ZQ0KPiBzZWN1cmUgYnVmZmVyIGZsYWdzIHRvIHRoZSBBRERGQjIgaW9jdGwuDQoNClRoYW5rcyBm
b3IgeW91ciBoaW50LCBJJ2xsIHRyeSB0byBhZGQgdGhlIHNlY3VyZSBmbGFnIHRvIHRoZSBBRERG
QjINCmlvY3RsLiBJZiBpdCB3b3JrcywgSSdsbCBzZW5kIHRoZSBwYXRjaC4NCg0KUmVnYXJkcywN
Ckphc29uLUpILkxpbg0KDQo+IC1TaW1hDQo=

--__=_Part_Boundary_008_954525159.1238704056
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjQtMDYtMjYmIzMyO2F0
JiMzMjsxOTo1NiYjMzI7KzAyMDAsJiMzMjtEYW5pZWwmIzMyO1ZldHRlciYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMy
O1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3Bl
biYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zl
cmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZn
dDsmIzMyOyYjMzI7T24mIzMyO1dlZCwmIzMyO0p1biYjMzI7MjYsJiMzMjsyMDI0JiMzMjthdCYj
MzI7MTI6NDk6MDJQTSYjMzI7KzAyMDAsJiMzMjtDaHJpc3RpYW4mIzMyO0smIzI0NjtuaWcmIzMy
O3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7QW0mIzMyOzI2LjA2LjI0JiMzMjt1bSYjMzI7MTA6
MDUmIzMyO3NjaHJpZWImIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygmIzI2NTE5OyYjMzA1OTE7
JiMzMTA3NzspOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
SSYjMzI7dGhpbmsmIzMyO0kmIzMyO2hhdmUmIzMyO3RoZSYjMzI7c2FtZSYjMzI7cHJvYmxlbSYj
MzI7YXMmIzMyO3RoZSYjMzI7RUNDX0ZMQUcmIzMyO21lbnRpb24mIzMyO2luOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQom
Z3Q7JiMzMjtodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDI0MDUxNS1kbWEt
YnVmLWVjYy1oZWFwLXYxLTAtNTRjYmJkMDQ5NTExQGtlcm5lbC5vcmcvDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtJJiMzMjt0
aGluayYjMzI7aXQmIzMyO3dvdWxkJiMzMjtiZSYjMzI7YmV0dGVyJiMzMjt0byYjMzI7aGF2ZSYj
MzI7dGhlJiMzMjt1c2VyJiMzMjtjb25maWd1cmFibGUNCiZndDsmIzMyO3ByaXZhdGUNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2luZm9ybWF0aW9uJiMzMjtp
biYjMzI7ZG1hLWJ1ZiwmIzMyO3NvJiMzMjthbGwmIzMyO3RoZSYjMzI7ZHJpdmVycyYjMzI7d2hv
JiMzMjtoYXZlJiMzMjt0aGUmIzMyO3NhbWUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyO3JlcXVpcmVtZW50JiMzMjtjYW4mIzMyO2dldCYjMzI7dGhlaXImIzMy
O3ByaXZhdGUmIzMyO2luZm9ybWF0aW9uJiMzMjtmcm9tJiMzMjtkbWEtYnVmDQomZ3Q7JiMzMjtk
aXJlY3RseQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7YW5k
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtubyYjMzI7bmVl
ZCYjMzI7dG8mIzMyO2NoYW5nZSYjMzI7b3ImIzMyO2FkZCYjMzI7dGhlJiMzMjtpbnRlcmZhY2Uu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjtXaGF0JiMzOTtzJiMzMjt5b3VyJiMzMjtvcGluaW9uJiMzMjtpbiYjMzI7dGhpcyYj
MzI7cG9pbnQmIzYzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsm
Z3Q7JiMzMjtXZWxsJiMzMjtvZiYjMzI7aGFuZCYjMzI7SSYjMzI7ZG9uJiMzOTt0JiMzMjtzZWUm
IzMyO3RoZSYjMzI7bmVlZCYjMzI7Zm9yJiMzMjt0aGF0Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7V2hhdCYjMzI7aGFwcGVucyYjMzI7aWYmIzMyO3lvdSYj
MzI7Z2V0JiMzMjthJiMzMjtub24tc2VjdXJlJiMzMjtidWZmZXImIzMyO2ltcG9ydGVkJiMzMjtp
biYjMzI7eW91cg0KJmd0OyYjMzI7c2VjdXJlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjtkZXZpY2UmIzYzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtXZSYjMzI7dXNlJiMzMjt0aGUmIzMyO3NhbWUmIzMyO21lZGlh
dGVrLWRybSYjMzI7ZHJpdmVyJiMzMjtmb3ImIzMyO3NlY3VyZSYjMzI7YW5kJiMzMjtub24tc2Vj
dXJlDQomZ3Q7JiMzMjtidWZmZXIuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtJZiYjMzI7
bm9uLXNlY3VyZSYjMzI7YnVmZmVyJiMzMjtpbXBvcnRlZCYjMzI7dG8mIzMyO21lZGlhdGVrLWRy
bSYjMzI7ZHJpdmVyLCYjMzI7aXQmIzM5O3MmIzMyO2dvJiMzMjt0bw0KJmd0OyYjMzI7dGhlDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtub3JtYWwmIzMyO2Zsb3cmIzMyO3dpdGgmIzMyO25v
cm1hbCYjMzI7aGFyZHdhcmUmIzMyO3NldHRpbmdzLg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtXZSYjMzI7dXNlJiMzMjtkaWZmZXJlbnQm
IzMyO2NvbmZpZ3VyYXRpb25zJiMzMjt0byYjMzI7bWFrZSYjMzI7aGFyZHdhcmUmIzMyO2hhdmUm
IzMyO2RpZmZlcmVudA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7cGVybWlzc2lvbiYjMzI7
dG8mIzMyO2FjY2VzcyYjMzI7dGhlJiMzMjtidWZmZXImIzMyO2l0JiMzMjtzaG91bGQmIzMyO2Fj
Y2Vzcy4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7U28mIzMyO2lmJiMzMjt3ZSYjMzI7Y2FuJiMzOTt0JiMzMjtnZXQmIzMyO3RoZSYjMzI7
aW5mb3JtYXRpb24mIzMyO29mJiMzMjsmcXVvdDt0aGUmIzMyO2J1ZmZlciYjMzI7aXMmIzMyO2Fs
bG9jYXRlZA0KJmd0OyYjMzI7ZnJvbQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7cmVzdHJp
Y3RlZF9tdGtfY21hJnF1b3Q7JiMzMjt3aGVuJiMzMjtpbXBvcnRpbmcmIzMyO3RoZSYjMzI7YnVm
ZmVyJiMzMjtpbnRvJiMzMjt0aGUmIzMyO2RyaXZlciwmIzMyO3dlDQomZ3Q7JiMzMjt3b24mIzM5
O3QNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2JlJiMzMjthYmxlJiMzMjt0byYjMzI7Y29u
ZmlndXJlJiMzMjt0aGUmIzMyO2hhcmR3YXJlJiMzMjtjb3JyZWN0bHkuDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1doeSYjMzI7Y2FuJiMzOTt0JiMzMjt5b3UmIzMyO2dl
dCYjMzI7dGhpcyYjMzI7aW5mb3JtYXRpb24mIzMyO2Zyb20mIzMyO3VzZXJzcGFjZSYjNjM7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NhbWUmIzMyO3JlYXNvbiYjMzI7YW1kJiMzMjthbmQmIzMyO2k5
MTUveGUmIzMyO2Fsc28mIzMyO3Bhc3MmIzMyO3RoaXMmIzMyO2Fyb3VuZCYjMzI7aW50ZXJuYWxs
eSYjMzI7aW4mIzMyO3RoZQ0KJmd0OyYjMzI7a2VybmVsLCYjMzI7aXQmIzM5O3MmIzMyO2p1c3Qm
IzMyO3RoYXQmIzMyO2ZvciYjMzI7dGhvc2UmIzMyO2dwdXMmIzMyO3RoZSYjMzI7cmVuZGVyJiMz
MjthbmQmIzMyO2ttcyYjMzI7bm9kZSYjMzI7YXJlJiMzMjt0aGUNCiZndDsmIzMyO3NhbWUNCiZn
dDsmIzMyO2RyaXZlciYjMzI7c28mIzMyO3RoaXMmIzMyO2lzJiMzMjtlYXN5Lg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtCdXQmIzMyO29uJiMzMjthcm0mIzMyO3lvdSYjMzI7aGF2ZSYjMzI7c3BsaXQm
IzMyO2Rlc2lnbnMmIzMyO2V2ZXJ5d2hlcmUmIzMyO2FuZCYjMzI7ZG1hLWJ1Zg0KJmd0OyYjMzI7
aW1wb3J0L2V4cG9ydCwmIzMyO3NvDQomZ3Q7JiMzMjtzb21ldGhpbmcmIzMyO2Vsc2UmIzMyO2lz
JiMzMjtuZWVkZWQuJiMzMjtBbmQmIzMyO25laXRoZXImIzMyO2N1cnJlbnQmIzMyO2ttcyYjMzI7
dWFwaSYjMzI7bm9yDQomZ3Q7JiMzMjtwcm90b2NvbHMvZXh0ZW5zaW9ucyYjMzI7aGF2ZSYjMzI7
cHJvdmlzaW9ucyYjMzI7Zm9yJiMzMjt0aGlzJiMzMjsoYWZhaWspJiMzMjtiZWNhdXNlJiMzMjtp
dA0KJmd0OyYjMzI7d29ya3MmIzMyO29uDQomZ3Q7JiMzMjt0aGUmIzMyO2JpZyYjMzI7Z3B1cywm
IzMyO2FuZCYjMzI7b24mIzMyO2FuZHJvaWQmIzMyO2l0JiMzOTtzJiMzMjtqdXN0JiMzMjtoYWNr
ZWQmIzMyO3VwJiMzMjt3aXRoJiMzMjtiYWNrY2hhbm5lbHMuDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1NvJiMzMjt5ZWFoJiMzMjtlc3NlbnRpYWxseSYjMzI7SSYjMzI7dGhpbmsmIzMyO3dlJiMzMjtw
cm9iYWJseSYjMzI7bmVlZCYjMzI7c29tZXRoaW5nJiMzMjtsaWtlJiMzMjt0aGlzLCYjMzI7YXMN
CiZndDsmIzMyO211Y2gNCiZndDsmIzMyO2FzJiMzMjtpdCYjMzI7c3Vja3MuJiMzMjtJJiMzMjtz
ZWUmIzMyO2l0JiMzMjtzb21ld2hhdCYjMzI7c2ltaWxhciYjMzI7dG8mIzMyO2hhbmRsaW5nJiMz
MjtwY2lwMnBkbWENCiZndDsmIzMyO2xpbWl0YXRpb25zDQomZ3Q7JiMzMjtpbiYjMzI7dGhlJiMz
MjtrZXJuZWwmIzMyO3Rvby4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Tm90JiMzMjtzdXJlJiMzMjt3
aGVyZS9ob3cmIzMyO2l0JiMzMjtzaG91bGQmIzMyO2JlJiMzMjtoYW5kbGVkJiMzMjt0aG91Z2gs
JiMzMjthbmQmIzMyO21heWJlJiMzMjtJJiMzOTt2ZSYjMzI7bWlzc2VkDQomZ3Q7JiMzMjtzb21l
dGhpbmcmIzMyO2Fyb3VuZCYjMzI7cHJvdG9jb2xzLCYjMzI7aW4mIzMyO3doaWNoJiMzMjtjYXNl
JiMzMjtJJiMzMjtndWVzcyYjMzI7d2UmIzMyO3Nob3VsZCYjMzI7YWRkJiMzMjtzb21lDQomZ3Q7
JiMzMjtzZWN1cmUmIzMyO2J1ZmZlciYjMzI7ZmxhZ3MmIzMyO3RvJiMzMjt0aGUmIzMyO0FEREZC
MiYjMzI7aW9jdGwuDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt5b3VyJiMzMjtoaW50LCYjMzI7SSYj
Mzk7bGwmIzMyO3RyeSYjMzI7dG8mIzMyO2FkZCYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO2ZsYWcm
IzMyO3RvJiMzMjt0aGUmIzMyO0FEREZCMg0KaW9jdGwuJiMzMjtJZiYjMzI7aXQmIzMyO3dvcmtz
LCYjMzI7SSYjMzk7bGwmIzMyO3NlbmQmIzMyO3RoZSYjMzI7cGF0Y2guDQoNClJlZ2FyZHMsDQpK
YXNvbi1KSC5MaW4NCg0KJmd0OyYjMzI7LVNpbWENCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRt
bD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29u
ZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9u
IGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNo
bWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBv
dGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJ
dCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVj
aXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRp
bmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0K
YXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCBy
ZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2Vp
dmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1l
ZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwg
Y29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20g
eW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1t
YWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_954525159.1238704056--

