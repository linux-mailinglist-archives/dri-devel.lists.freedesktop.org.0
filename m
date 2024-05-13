Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642978C4283
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 15:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3DA10E78E;
	Mon, 13 May 2024 13:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="aJaNPWVd";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="eBwCHqeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAD410E78E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:50:47 +0000 (UTC)
X-UUID: ca113680112f11efb92737409a0e9459-20240513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Jb4m2TaT4n0a3KamsYnZp4ZuKnaS8bJWoDll1OKdRXc=; 
 b=aJaNPWVddLGlSiMGpl1xDHsBBU/phIhiSltRbnTRPvxBSTk+E7n302Csw6tZyudU/E7yKnGxwk4TtdPplIsQC9eSpJxdjpd1/A/b8inClE8hlpI1qsmnGJ2kQaIj3mzl9u4WlIkLMRfQgwqwXYmpgbpTx5kuKqzeFoAcQvZSHTM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:3262b7c9-e04f-409c-980e-b37dadf646ff, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:473108fc-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca113680112f11efb92737409a0e9459-20240513
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1557804074; Mon, 13 May 2024 21:50:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 May 2024 21:50:40 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 May 2024 21:50:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpP17X3U6rSFd/c1MGBhB+upCRRlCe4iqORWihePYZslJFfOmJLQMDw9xpAvlZa1bweJf6BirmIOQSp3jWL6PsXxjsyTgFOc6oKPhBOpW1OocRYhttiwN98VZwfVL+XqRDo0gDaOxMUJWdxsTxUmNchEQ2G6W6e45T1DFVSj/f0ydue2wvqZwiYHfkYEWfGjmlhQUB33KZ3hQl47V2udA+jgcpdOPOb0TthnplXAnbIXJf+YRiT+WjrYycdB2SLzv00jgfPnas+7Jt2KO6fqhtXtrqaWXqK5385WV63cMjGQCgY71ChffnM91+v0LlS5pilBpWlv73FUJGsOCuOBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWpe+YZqBfCXQ7SfhnFz+kRqr4edaqfBeOgEHzl+C8M=;
 b=T5qwjahm6fzM+KdJR+J+HnORzx2BbZQVlndx0c5IlhHMXbGqfLVqMwzjtSa2l/ur5hkwypwTBEDkvsoKhzMAXd8jrTXb94T/QzlKH3XCRBO2A6wesgZtAMrzW1/QzH/DYq52Hypg8gHBn5FrEqsisema1KUF4XtA9dXeMWUKnHM2a4xlIf0sTxTE7LDhSltmMV5ZUHU5PidVr3Us9QsqmMC9fP9n+Olgfa0Y05GrSqbeLBgmrfuT0GvKlrWKN3Lb46fnp//P28/BKtcWVzVyaL5oXWpvTK/B1aV5zznSVIebUpPnhj3EmkQjsiYK2Buq/9fiDdgM/TNyFIonxZGLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWpe+YZqBfCXQ7SfhnFz+kRqr4edaqfBeOgEHzl+C8M=;
 b=eBwCHqeBS3tPGMIASf4QD2ZbXnTc2cdoukcEfVs8fjMDaV6XEa9zN6nhq3ob5vmmHqVyDFlF5+IVnRdmvwXKTVXAKAAxW/YhCEzfDALK62dxeoj37G4cfyIWQpBFMUAT5w2aTvM58eBjvfJPvWRQ/gFpM8mihlxERovHUNFYVe4=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by SI2PR03MB6857.apcprd03.prod.outlook.com (2603:1096:4:19e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.22; Mon, 13 May
 2024 13:50:38 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3%5]) with mapi id 15.20.7587.021; Mon, 13 May 2024
 13:50:38 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] Support YUV422 for DPTX.
Thread-Topic: [PATCH v1 1/1] Support YUV422 for DPTX.
Thread-Index: AQHaooBUIGH6W/xvtUqO0jWVw5iHGrGQPkOAgAT1zAA=
Date: Mon, 13 May 2024 13:50:37 +0000
Message-ID: <86238b30a01b4790837d5b56e1970ccc3af72c9f.camel@mediatek.com>
References: <20240510021810.19302-1-liankun.yang@mediatek.com>
 <8d624845-7450-485c-8000-0194bcf56458@collabora.com>
In-Reply-To: <8d624845-7450-485c-8000-0194bcf56458@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|SI2PR03MB6857:EE_
x-ms-office365-filtering-correlation-id: e5070f46-0a67-41ea-eb0b-08dc7353abbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|1800799015|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?N3RST2d5RGhzb2o3NTRHL1JodkExMnFTWUM3aklHRDlGV1Y0VlIxTkdqRWpp?=
 =?utf-8?B?WVZHWEw2VDhRNWVDdXowYzNtTWswMEY3K0JhektoQ1orUm9SMEVob3lobngw?=
 =?utf-8?B?Rm5hazZjUHBmbzJlRmljNy9mTm1zNmx6eGs3N242ZHdRRXludmJESlJNT0xp?=
 =?utf-8?B?MDVSR21YUWZxVEdUM09hYzI2ZURiLyt1QTNGSDdtajdtaHU4cVhGMHBWaEV6?=
 =?utf-8?B?OWN1elhyMlFuNWg2MVdYREdvbE1DaFRBUnJlYmFITnpYb1ZMRWp4c1N1dlBh?=
 =?utf-8?B?N2pFRkVxN3VLSEJLTVh4ZGpONEEvOFNuLzZ4NCtoODc1VEh0ZTlCSVREYmZF?=
 =?utf-8?B?TzFhdmdGSlNYWFY3RGVtbHovME9MNmRiakVWdElZU3FJZG9BSjgzcEk4V3Nr?=
 =?utf-8?B?UU93UFRGSVhkOG0wUGY0WW9VcW44bWMrbzhwU2dWaDVhMmRzUXRET3U0WGFV?=
 =?utf-8?B?M0puRFl0VlNVK1pkaGNUUWNoWm9jbWpSbHAxazhEbnUwM2tUY1VvWGVHeXRB?=
 =?utf-8?B?bmNFRWpDT2lJUm5uU3htN3cvMC9KcWJ5dGo3TzVoL1MvL0NSWGM4NjJORUhi?=
 =?utf-8?B?aUo5TTZrcnorNXpuQU8xTUpabnR5eXoyWmNkdmVKeERkTWtxajdyMVF5RVNP?=
 =?utf-8?B?WXFhS1ZvRUhqb0FSbFJOT1JIZXVwU1BKOHpWRy9ndnhHZ002VWRxUVdmMXRi?=
 =?utf-8?B?U0VNNmVURGd0Z1FnOVR2aVROYjJEVjRFWm9Nc1VjNlhXUitkQ1R6UTg1RmY2?=
 =?utf-8?B?eVRQeEZBZTlIZXBxK3NLa2xwMzBiNmdvcjRoZ0hYSEtKQWNaWGpEQmEzdEMr?=
 =?utf-8?B?WUxkNnk1WjhBemtPdlVaVzNOaitVSHVmazhROEN2dmFZQ2RCekVGMlhrdWJL?=
 =?utf-8?B?bk15Rmk1enJka1M2d1JGa1NaOVRKa09HMFMxeXNlWExxZzVQOWp2azV4b3JB?=
 =?utf-8?B?ZHpLOW05TXd4Z2h0ZGozR3F4dFNKVnl4OVFlSVMyVnBpeVRobWJxQ3FiYVRj?=
 =?utf-8?B?RDk1dHpWTk9YdExLcmtMTkhQaTVxMjYwRmxEZDFseVo3cnZhL1EwWVlIZVA5?=
 =?utf-8?B?Vi92SDVUQUZaUUpaOGMvV25WaWpEMC9YRGFpWlNCS09pWThXSHBLM2NYSmpm?=
 =?utf-8?B?R3lTNXM0U1pDeVdoaG1pNWdJaGlDM1VBWWt4eFpVSTVUOGdIZ0dzOHdRR0w4?=
 =?utf-8?B?eThkZU1FUFF1UEFHM1F0dnk1K1kyMmdrdXY2d2gwb0FCdGRBaTc0WHZwRncz?=
 =?utf-8?B?Z213aVVvOU1LRStPcXdFMFVYZTZrWHRPNlJ0ckhac3dkdXhXUFV1YlhtQTZG?=
 =?utf-8?B?bmFoakExYTBhSmhSU09ZcTJWbnJCa2RJb3JWbDFZeW5QOHJCZmNmcjUvbEMz?=
 =?utf-8?B?QTM5cHJLeWtWSDFPa0IyUWg0NGt6aW9hd0UzRWlhZ2F5UEtpa1VKMG9vQmw0?=
 =?utf-8?B?SWJqWjBub0tLZ0t5Lys2SEFiaTNQKy91NkxhbGxEcXM2Q0FNUzhCTGdUWXZh?=
 =?utf-8?B?SUpNY3lmNi9CMk13dXkveW9PZmNXakZrU2czZ0pHUEhrbHkyL1NRR0NQdENE?=
 =?utf-8?B?LzZWbFJJeUhkTDNuM2FWMVJsbVRlV1FHL2Fxak5JYWl0VzZWbjlITDJiYXBo?=
 =?utf-8?B?Wk0ydGI0b1R6cnRKQXAxaWdtMGx6alBRMTNuaCtkRTBQaUZyUGsrSEJPWGUw?=
 =?utf-8?B?cmpSU003cnJpV3FVcW96NDNpSFZTWlBGbC9ubFYxNVdlTjlvY0ZHWGllcUFY?=
 =?utf-8?Q?d3EqpE3x6zluVSdwAxeG7OiiOGojGwtZIZsbY60?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB5760.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWIvb25lWUp1TFI0UDVZb1ZoYVlpWEdvbU45M0h6TXFnVGFRVzN6aE94TlBt?=
 =?utf-8?B?NGJlc2tsT0pkQ2UwMXQ5ZUFVeFBMaVlBTDdnMmsreEllL3lZd3VxT0hhZjZl?=
 =?utf-8?B?M0FjaEhVSDZPdkFuRW9FekczV3hPOFhjNEtBVEx6cTU0eVEvY2gvQVRCeWtR?=
 =?utf-8?B?TE9IRlExRGVZQ0JMWXQ4NTR2UHAvV05DblRlWTd5ei9Ud3kzeENPWGhtWUFL?=
 =?utf-8?B?WXBGK1RzUXR4c2JVVzRueTNCZ1JzZmpvTGdpR29GbjNEOXc4dVBZTGV0NjVp?=
 =?utf-8?B?ZlNmOHlkc3VhUVNqaURoQnpEMEZYMFlwMmpIcDErSkNHdFFIK0doa3VCUjZD?=
 =?utf-8?B?bGlmMkVodUxPUGdJQjNIRncyeVNpN0huMmlPMG5rdnFxTERwK1p4UWQ1UkNs?=
 =?utf-8?B?TUdZKytFMGtUaW5Lcnh6MU1jSU9aSVp5b1dlWVdGLzkySG5JWVJJOC9nVEJu?=
 =?utf-8?B?SERWKzJLNC81em9iZTlPMElzRTlVc0tFaVlHN2l3QzZLd0dqL2N3M3JtaFNx?=
 =?utf-8?B?STJzUTlnbG5DTThhbnpJRFpLaTVZZVlyVVdxYlBDR0hHMW9ZeWc0dUs5NmZn?=
 =?utf-8?B?OXh0dUxLdWE4NTlTbk9tRmVVZ1EvSFM0RnhUdlVXV2RhYzJjK3NIc0p5V2tG?=
 =?utf-8?B?UlB2SEFKeEJacklkaWV1endYRytSZnNpZi92OHpRZkhzbmswM1lRNDVGcHp0?=
 =?utf-8?B?aXdRSzV6eEg0empnWHk1dHJRYW9tVWhSUXBTTjBNbGw4ZzNYbVZVcXQyemNt?=
 =?utf-8?B?QnJ1TmRLVUJzVVZxbzN6K0xLSE9MVHVFa3VmV0ZKU0RadkJaeHlvb3VOSFZk?=
 =?utf-8?B?TWJ4bnFvWVdFZk1oNklxb0VEN3ZpRnZuZ2FFQ0hDa2NLc00rMlhJa2x5OHhX?=
 =?utf-8?B?YVNhUDk5UmJIL2c5Y2hnUm5NWXY4NnMzRy9NMHBhQTJLNkVCa1lRTDFpZnVi?=
 =?utf-8?B?NndOUXVieitqazJpQnpaaGtyMFdYSjJrYnFBQUJtMlFkRDVvQW1UdDJWWlk2?=
 =?utf-8?B?eDR3S3RmbkdsMnJ0NlZOS3Z0akxCSUlKQjFobHBCWDhpTjhNMUNlV2pVZFBY?=
 =?utf-8?B?VGtmNm1GRW5NaWJPSnBuSU5SbHh0ZjhXTnV1Q29yc0c3UHEwb20wdjBpU2pC?=
 =?utf-8?B?cG0zUE1uMDBxV3hxV3lsakFUZzVkTHE1MUhER3krOEpwSUFzOGlaRHhLdE5a?=
 =?utf-8?B?dS9UVG1XbnJKMUE0dC92UTY0RHdFSEtCMkJVTHcyZjF1NWZvcm44blJRNzdY?=
 =?utf-8?B?dzAvV3N3b09Yajl1a0xRK3lJYzlaUjh3eDZnWi83NEpGWnp2emNMNnJoM28v?=
 =?utf-8?B?MXE5enRTc0ZTQlJiTGpBb3ZNdWNEQklYZ2w1SlZIbkY5b005Wnoza1ZYVkFw?=
 =?utf-8?B?d0tHbE1TRDFNaThRVUlVSUxBNWpkTDI4b3JYcW0rejE2TTZXcjhiRG9HemlL?=
 =?utf-8?B?QWZWTk9DUE5kUWNXUUx3a0I2NEVkMFBLL3RwUmk0RVE3cTdnakFmdm5wVHdZ?=
 =?utf-8?B?VCtScHRQcStPaHJHa05UMFVMZGZteHlMdmg5WEFWbWpkQW5JcVdEMjF4UWps?=
 =?utf-8?B?WllZR1ZST3ErTUhwYlBWNGl6SlRCUWw3SVZTd2JCRy9OZENsRzdvdWgvQS85?=
 =?utf-8?B?V0haYlg3azF3VkQ1Ung4YnBGUzIrZFhTYnd3ekhjZTRFbWp6YzBuYkdXbEkx?=
 =?utf-8?B?Mll3c29KS29jcGtYWXd3VjJuVktNQlE5L3Jrb0k5TnRFOWZBR1dXV1dERFZE?=
 =?utf-8?B?RWpiZm9ER1Z6M0lPdkV1dU5GYmtiRGYwSDJIaEx4TUFNSm5aN21FR1oxdFlU?=
 =?utf-8?B?KzJoc2l4WlBwQTZNV3BGTzA2b2paeURxMkJkeW1sUG55SWFCS3dabHBXZEdl?=
 =?utf-8?B?SmpISllNb2xNNGg2UUtTYVZtRm5FaERROU42MFRIVk5WYTMvZSswTXd5bm5Q?=
 =?utf-8?B?cHJpbFJWdXBpNlkvSmJQU1JFbzViWllGWVRIRDdha1VOL2xkY1Y5UUMzdzZM?=
 =?utf-8?B?R0JsVFgzcnBPaktNZ2h2a3RraDE5d3p5OFpiMDEweTVRRERqZkRMeXVRYnBR?=
 =?utf-8?B?QW5TMmlqekJEY2UzYk9NSGFsWDFINGFzbzExSzlVS05TdUE5TTFXb0RBM2lV?=
 =?utf-8?B?KzBha1BvbERhc0ZlNGNCZ1FnVjB5QzBQOVZWU0ZzektmNW5HdGRURTNmQzBu?=
 =?utf-8?B?QUE9PQ==?=
Content-ID: <32031FDAD619744DA80F3CDBF6790EE7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5070f46-0a67-41ea-eb0b-08dc7353abbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 13:50:37.9988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tNFAxYnt+809af4EL46aPQCc8Dn5HlbhXzMFOBnDRHpz7BuozfBm2+gxhSS2+yYb/Sfy6IcBjTll9/Yl5+mvgxrjc1JeAPg180DbNDAtYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6857
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1209545497.948686317"
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

--__=_Part_Boundary_007_1209545497.948686317
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI0LTA1LTEwIGF0IDEyOjA1ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTAvMDUvMjQgMDQ6MTUsIExpYW5rdW4gWWFuZyBoYSBzY3JpdHRv
Og0KPiA+IEFkanVzdCB0aGUgdHJhaW5pbmcgc2VxdWVuY2UuRGV0ZWN0cyB0aGUgYWN0dWFsIGxp
bmsgY29uZGl0aW9uDQo+ID4gYW5kIGNhbGN1bGF0ZXMgdGhlIGJhbmR3aWR0aCB3aGVyZSB0aGUg
cmVsZXZhbnQgcmVzb2x1dGlvbiByZXNpZGVzLg0KPiA+IA0KPiA+IFRoZSBiYW5kd2lkdGggaXMg
cmVjYWxjdWxhdGVkIGFuZCBtb2RlcyB0aGF0IGV4Y2VlZCB0aGUgYmFuZHdpZHRoDQo+ID4gYXJl
DQo+ID4gZmlsdGVyZWQuDQo+ID4gDQo+ID4gRXhhbXBsZSBNb2RpZnkgYmFuZHdpZHRoIGZpbHRl
cmluZyByZXF1aXJlbWVudHMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTGlhbmt1biBZYW5n
IDxsaWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcC5jIHwgODEgKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ID4g
LS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDM1IGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiA+IGlu
ZGV4IDIxMzZhNTk2ZWZhMS4uM2U2NDViZDZmZTI3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuYw0KPiA+IEBAIC02Niw2ICs2NiwxMyBAQCBlbnVtIHsNCj4gPiAgIAlNVEtf
RFBfQ0FMX01BWCwNCj4gPiAgIH07DQo+ID4gICANCj4gPiArZW51bSBtdGtfZHBfY29sb3JfZm9y
bWF0IHsNCj4gPiArCU1US19EUF9DT0xPUl9GT1JNQVRfUkdCID0gMCwNCj4gPiArCU1US19EUF9D
T0xPUl9GT1JNQVRfWVVWNDIyID0gMHgxLA0KPiA+ICsJTVRLX0RQX0NPTE9SX0ZPUk1BVF9ZVVY0
NDQgPSAweDIsDQo+ID4gKwlNVEtfRFBfQ09MT1JfRk9STUFUX1lVVjQyMCA9IDB4MywNCj4gPiAr
fTsNCj4gDQo+IFRoaXMgaXMgZ2l2aW5nIHRoZSBzYW1lIHZhbHVlcyBhcyBkcm1fZHAuaCwgaGVu
Y2UgdW5uZWVkZWQuDQoNCkJlY2F1c2UgdXNpbmcgdGhlIHNhbWUgdmFsdWVzIGFzIGRybV9kcC5o
IGlzIHdyb25nLEkgd2lsbCB1c2Ugb3RoZXINCm1ldGhvZHMgdG8gZGVhbCB3aXRoIHRoZSBwcm9i
bGVtIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gPiArDQo+ID4gICBzdHJ1Y3QgbXRrX2RwX3Ry
YWluX2luZm8gew0KPiA+ICAgCWJvb2wgc2lua19zc2M7DQo+ID4gICAJYm9vbCBjYWJsZV9wbHVn
Z2VkX2luOw0KPiA+IEBAIC04NCw3ICs5MSw3IEBAIHN0cnVjdCBtdGtfZHBfYXVkaW9fY2ZnIHsN
Cj4gPiAgIH07DQo+ID4gICANCj4gPiAgIHN0cnVjdCBtdGtfZHBfaW5mbyB7DQo+ID4gLQllbnVt
IGRwX3BpeGVsZm9ybWF0IGZvcm1hdDsNCj4gPiArCWVudW0gbXRrX2RwX2NvbG9yX2Zvcm1hdCBm
b3JtYXQ7DQo+ID4gICAJc3RydWN0IHZpZGVvbW9kZSB2bTsNCj4gPiAgIAlzdHJ1Y3QgbXRrX2Rw
X2F1ZGlvX2NmZyBhdWRpb19jdXJfY2ZnOw0KPiA+ICAgfTsNCj4gPiBAQCAtNDU3LDcgKzQ2NCw3
IEBAIHN0YXRpYyB2b2lkIG10a19kcF9zZXRfbXNhKHN0cnVjdCBtdGtfZHANCj4gPiAqbXRrX2Rw
KQ0KPiANCj4gLi5zbmlwLi4NCj4gDQo+ID4gQEAgLTE4ODgsOSArMTg5NiwyOCBAQCBzdGF0aWMg
aXJxcmV0dXJuX3QNCj4gPiBtdGtfZHBfaHBkX2V2ZW50X3RocmVhZChpbnQgaHBkLCB2b2lkICpk
ZXYpDQo+ID4gICAJCQltZW1zZXQoJm10a19kcC0+aW5mby5hdWRpb19jdXJfY2ZnLCAwLA0KPiA+
ICAgCQkJICAgICAgIHNpemVvZihtdGtfZHAtPmluZm8uYXVkaW9fY3VyX2NmZykpOw0KPiA+ICAg
DQo+ID4gKwkJCW10a19kcC0+ZW5hYmxlZCA9IGZhbHNlOw0KPiA+ICsJCQkvKiBwb3dlciBvZmYg
YXV4ICovDQo+ID4gKwkJCW10a19kcF91cGRhdGVfYml0cyhtdGtfZHAsDQo+ID4gTVRLX0RQX1RP
UF9QV1JfU1RBVEUsDQo+ID4gKwkJCSAgICAgICBEUF9QV1JfU1RBVEVfQkFOREdBUF9UUExMLA0K
PiA+ICsJCQkgICAgICAgRFBfUFdSX1NUQVRFX01BU0spOw0KPiA+ICsNCj4gDQo+IFRoaXMgY29t
bWl0IGlzIG5vdCBldmVuIGJhc2VkIG9uIHVwc3RyZWFtLCBzbyB5b3UgaGF2ZW4ndCBldmVuIHRl
c3RlZA0KPiBpdCB1cHN0cmVhbS4NCj4gDQo+IERvbid0IHNlbmQgdW50ZXN0ZWQgY29tbWl0cy4N
Cj4gVGhlcmUncyBub3RoaW5nIHRvIHJldmlldyBoZXJlLg0KPiANCj4gUmVnYXJkcywNCj4gQW5n
ZWxvDQo+IA0KDQpJIHdpbGwgZG8gaXQgYmFzZWQgb24gdXBzdHJlYW0gaW4gbmV4dCB2ZXJzaW9u
Lg0KDQpUaGFuayB5b3UgdmVyeSBtdXNoIGZvciB5b3VyIGNvbW1lbnRzLg0KDQpCZXN0IFJlZ2Fy
ZHMsDQpMaWFua3VuIFlhbmcNCg0KDQoNCg0K

--__=_Part_Boundary_007_1209545497.948686317
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjQtMDUtMTAmIzMyO2F0
JiMzMjsxMjowNSYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0lsJiMzMjsxMC8wNS8yNCYjMzI7MDQ6MTUsJiMzMjtM
aWFua3VuJiMzMjtZYW5nJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyO0Fk
anVzdCYjMzI7dGhlJiMzMjt0cmFpbmluZyYjMzI7c2VxdWVuY2UuRGV0ZWN0cyYjMzI7dGhlJiMz
MjthY3R1YWwmIzMyO2xpbmsmIzMyO2NvbmRpdGlvbg0KJmd0OyYjMzI7Jmd0OyYjMzI7YW5kJiMz
MjtjYWxjdWxhdGVzJiMzMjt0aGUmIzMyO2JhbmR3aWR0aCYjMzI7d2hlcmUmIzMyO3RoZSYjMzI7
cmVsZXZhbnQmIzMyO3Jlc29sdXRpb24mIzMyO3Jlc2lkZXMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyO1RoZSYjMzI7YmFuZHdpZHRoJiMzMjtpcyYjMzI7cmVjYWxjdWxh
dGVkJiMzMjthbmQmIzMyO21vZGVzJiMzMjt0aGF0JiMzMjtleGNlZWQmIzMyO3RoZSYjMzI7YmFu
ZHdpZHRoDQomZ3Q7JiMzMjsmZ3Q7JiMzMjthcmUNCiZndDsmIzMyOyZndDsmIzMyO2ZpbHRlcmVk
Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtFeGFtcGxlJiMzMjtNb2Rp
ZnkmIzMyO2JhbmR3aWR0aCYjMzI7ZmlsdGVyaW5nJiMzMjtyZXF1aXJlbWVudHMuDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtMaWFua3Vu
JiMzMjtZYW5nJiMzMjsmbHQ7bGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMy
OyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHAuYyYjMzI7fCYjMzI7ODEmIzMyOysrKysrKysrKysrKysrKysrKy0t
LS0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tLS0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsm
IzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs0NiYjMzI7aW5zZXJ0aW9ucygrKSwmIzMy
OzM1JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5j
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzIxMzZhNTk2ZWZhMS4uM2U2NDViZDZmZTI3JiMz
MjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyOyZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNjYsNiYjMzI7
KzY2LDEzJiMzMjtAQCYjMzI7ZW51bSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMy
O01US19EUF9DQUxfTUFYLA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO307DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZW51bSYjMzI7bXRrX2Rw
X2NvbG9yX2Zvcm1hdCYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7K01US19EUF9DT0xPUl9GT1JN
QVRfUkdCJiMzMjs9JiMzMjswLA0KJmd0OyYjMzI7Jmd0OyYjMzI7K01US19EUF9DT0xPUl9GT1JN
QVRfWVVWNDIyJiMzMjs9JiMzMjsweDEsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTVRLX0RQX0NPTE9S
X0ZPUk1BVF9ZVVY0NDQmIzMyOz0mIzMyOzB4MiwNCiZndDsmIzMyOyZndDsmIzMyOytNVEtfRFBf
Q09MT1JfRk9STUFUX1lVVjQyMCYjMzI7PSYjMzI7MHgzLA0KJmd0OyYjMzI7Jmd0OyYjMzI7K307
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO2lzJiMzMjtnaXZpbmcmIzMyO3RoZSYjMzI7
c2FtZSYjMzI7dmFsdWVzJiMzMjthcyYjMzI7ZHJtX2RwLmgsJiMzMjtoZW5jZSYjMzI7dW5uZWVk
ZWQuDQoNCkJlY2F1c2UmIzMyO3VzaW5nJiMzMjt0aGUmIzMyO3NhbWUmIzMyO3ZhbHVlcyYjMzI7
YXMmIzMyO2RybV9kcC5oJiMzMjtpcyYjMzI7d3JvbmcsSSYjMzI7d2lsbCYjMzI7dXNlJiMzMjtv
dGhlcg0KbWV0aG9kcyYjMzI7dG8mIzMyO2RlYWwmIzMyO3dpdGgmIzMyO3RoZSYjMzI7cHJvYmxl
bSYjMzI7aW4mIzMyO25leHQmIzMyO3ZlcnNpb24uDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2RwX3Ry
YWluX2luZm8mIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtib29sJiMzMjtzaW5r
X3NzYzsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtib29sJiMzMjtjYWJsZV9wbHVnZ2Vk
X2luOw0KJmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy04NCw3JiMzMjsrOTEsNyYjMzI7QEAmIzMy
O3N0cnVjdCYjMzI7bXRrX2RwX2F1ZGlvX2NmZyYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyO307DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfZHBfaW5mbyYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYj
MzI7LWVudW0mIzMyO2RwX3BpeGVsZm9ybWF0JiMzMjtmb3JtYXQ7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrZW51bSYjMzI7bXRrX2RwX2NvbG9yX2Zvcm1hdCYjMzI7Zm9ybWF0Ow0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7dmlkZW9tb2RlJiMzMjt2bTsNCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19kcF9hdWRpb19jZmcmIzMyO2F1ZGlvX2N1
cl9jZmc7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyZndDsmIzMy
O0BAJiMzMjstNDU3LDcmIzMyOys0NjQsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7
bXRrX2RwX3NldF9tc2Eoc3RydWN0JiMzMjttdGtfZHANCiZndDsmIzMyOyZndDsmIzMyOyptdGtf
ZHApDQomZ3Q7JiMzMjsNCiZndDsmIzMyOy4uc25pcC4uDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyO0BAJiMzMjstMTg4OCw5JiMzMjsrMTg5NiwyOCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7
aXJxcmV0dXJuX3QNCiZndDsmIzMyOyZndDsmIzMyO210a19kcF9ocGRfZXZlbnRfdGhyZWFkKGlu
dCYjMzI7aHBkLCYjMzI7dm9pZCYjMzI7KmRldikNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMz
MjttZW1zZXQoJmFtcDttdGtfZHAtJmd0O2luZm8uYXVkaW9fY3VyX2NmZywmIzMyOzAsDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtzaXplb2YobXRrX2RwLSZndDtpbmZvLmF1ZGlvX2N1cl9jZmcpKTsNCiZndDsmIzMyOyZndDsm
IzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyttdGtfZHAtJmd0O2VuYWJsZWQmIzMy
Oz0mIzMyO2ZhbHNlOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Ky8qJiMzMjtwb3dlciYjMzI7b2ZmJiMz
MjthdXgmIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19k
cCwNCiZndDsmIzMyOyZndDsmIzMyO01US19EUF9UT1BfUFdSX1NUQVRFLA0KJmd0OyYjMzI7Jmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7RFBfUFdSX1NUQVRFX0JB
TkRHQVBfVFBMTCwNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO0RQX1BXUl9TVEFURV9NQVNLKTsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsm
IzMyOw0KJmd0OyYjMzI7VGhpcyYjMzI7Y29tbWl0JiMzMjtpcyYjMzI7bm90JiMzMjtldmVuJiMz
MjtiYXNlZCYjMzI7b24mIzMyO3Vwc3RyZWFtLCYjMzI7c28mIzMyO3lvdSYjMzI7aGF2ZW4mIzM5
O3QmIzMyO2V2ZW4mIzMyO3Rlc3RlZA0KJmd0OyYjMzI7aXQmIzMyO3Vwc3RyZWFtLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtEb24mIzM5O3QmIzMyO3NlbmQmIzMyO3VudGVzdGVkJiMzMjtjb21taXRz
Lg0KJmd0OyYjMzI7VGhlcmUmIzM5O3MmIzMyO25vdGhpbmcmIzMyO3RvJiMzMjtyZXZpZXcmIzMy
O2hlcmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtBbmdlbG8NCiZn
dDsmIzMyOw0KDQpJJiMzMjt3aWxsJiMzMjtkbyYjMzI7aXQmIzMyO2Jhc2VkJiMzMjtvbiYjMzI7
dXBzdHJlYW0mIzMyO2luJiMzMjtuZXh0JiMzMjt2ZXJzaW9uLg0KDQpUaGFuayYjMzI7eW91JiMz
Mjt2ZXJ5JiMzMjttdXNoJiMzMjtmb3ImIzMyO3lvdXImIzMyO2NvbW1lbnRzLg0KDQpCZXN0JiMz
MjtSZWdhcmRzLA0KTGlhbmt1biYjMzI7WWFuZw0KDQoNCg0KDQoNCjwvcHJlPg0KPC9wPjwvYm9k
eT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElB
VEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55
IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxl
Z2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJs
ZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2ln
bmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlv
biwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91
IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNl
bmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBh
bnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2ht
ZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQg
b2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEt
LX0tLT4=

--__=_Part_Boundary_007_1209545497.948686317--

