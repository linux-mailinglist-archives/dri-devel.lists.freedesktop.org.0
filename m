Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0352E8A0A10
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B677910EF1A;
	Thu, 11 Apr 2024 07:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="l+cK6lFO";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="h8AacTfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31AC10EC97
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 06:23:23 +0000 (UTC)
X-UUID: fb407446f7cb11ee935d6952f98a51a9-20240411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=0x/VDA+qMOCK3iuNRN0nrdyHf4T31JRUfiZVC+j1u7s=; 
 b=l+cK6lFOjJxd2M7zkBwmpAJFpLLKzl95XKUCrQu4HulC41wrX2tZAGH/I9OKldHua0vsSYDRSKEfkpucVy93/LoyKazvOAnFi5gz9vLp8bQCE5IFzgQfFhrK/JetRMzPm36h9roqOTYXQFIGE4owtxLreM+6UoS+X6qeX4aM54Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:825d8a8e-1d62-4713-9ace-38d6b12653cb, IP:0,
 U
 RL:0,TC:-9,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-9
X-CID-META: VersionHash:6f543d0, CLOUDID:005f8b82-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:1,Content:0,EDM:-3,IP:nil,URL
 :0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
 R:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fb407446f7cb11ee935d6952f98a51a9-20240411
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 894547045; Thu, 11 Apr 2024 14:23:16 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Apr 2024 14:23:13 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Apr 2024 14:23:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb9n2ueXN8u8DY8N0ZaB8ngg+Km85CsBU5vLNcTaRKPe/1l0M6GM8XJf6aLurVxLqiiHhHUnMA2xi5SvXn0KJfctqj2Fugf65Mm6+HxLCvuvU9OlhCB2mcSMkPWHv/DI2NZpMhTq7lPkmK7/H6sBdSSmIWTzIQ7a+vN6Uo/wk19/9IS6QMsSExwbyuL3cFwzLeCbAp+fpc57I12s4dsy62E42/GeuHormBSJcxk9lzJkSGPCCDVnts2mctWZN6MdYMF8x60hG5rxGLhwzxzkZEqV1dReIfW8X9nYMviv/1C8T3JnVvarYIeX1aqhdW5MXottWSrsP2e0lAzQ3VALmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOp8pd89b1oCe8hAGCis1wduMDEBD1JMhmesOgbOSJE=;
 b=CD8aztQ5Pex3QBFQp34cT72uEuD0sMgqulAUQPHa6i+uo70NsoBmT/msyrf419UCoHyp8C4+sMeAe5436ZBGIsHKAsKU4RK+aZ49ZmXqL+IebyjKQC3CY+9k2zipDZ2sd7l4vNEYuYv/3u2U8RbbcLpz7mwRSxUuUafE79xIM0rtSlVqmio3Lg5Ooxv59s85Y7uT377BpQcoxFVRLppfsm3793bofrRWWXBTm5+ZOIUEg4vLpcoMDTTdVVfS6X/8anYgYxZOqYMtUWjJ7OoTqayaVXVhBgHocit9vrLlEIFRC1fjYpQpmQ+Pq5qRgOOkrpxU2FcwnkDnJJGuCi7EDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOp8pd89b1oCe8hAGCis1wduMDEBD1JMhmesOgbOSJE=;
 b=h8AacTfZ18fUhCFrSFMERE3k8QSFN/VnzokqLX++8RtGscBAEwT5RR6At3MxkDi0DyQu0L8XOokA//297SuM2uvGaHhRp1/ess9SGx5WebiQT4caH4bkbA2ovVFD/1Au44nam0C5ieYo358TaGmTiWH69R4iX07r/lwsYNo2Jis=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by TYSPR03MB8901.apcprd03.prod.outlook.com (2603:1096:405:97::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Thu, 11 Apr
 2024 06:23:10 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::10a4:6aaa:bf25:96f3%5]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 06:23:10 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "kishon@kernel.org"
 <kishon@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] drm/mediatek/dp: The register is written with the
 parsed DTS SSC value.
Thread-Topic: [PATCH v1 1/1] drm/mediatek/dp: The register is written with the
 parsed DTS SSC value.
Thread-Index: AQHahXwGjAzd+9TbM02omPlvxIpuLLFWGOuAgACKTgCADANAgA==
Date: Thu, 11 Apr 2024 06:23:10 +0000
Message-ID: <e06306875d9bb2bf5dc47f2bba65947a8dfd5e22.camel@mediatek.com>
References: <20240403040517.3279-1-liankun.yang@mediatek.com>
 <c0986506-ba8b-4c52-88f8-119c23b8778c@kernel.org>
 <86dd866a-8ead-4fd1-993a-672d4947ba84@kernel.org>
In-Reply-To: <86dd866a-8ead-4fd1-993a-672d4947ba84@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|TYSPR03MB8901:EE_
x-ms-office365-filtering-correlation-id: dee627b2-e25c-49aa-c4ba-08dc59efdc2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OUM3euaBzb8Q7qmCk3HStrJIgXosk/kcz8mOusqdWBfkFrHBQZAyEGsV/fqPPQrtY0+q1aJe0X8rfqd+N6L3hl+/dKxJgGr9ngPFee6ljntVdMPsCQkv5g6c7nCss+Ac2TCdZ2tAH6PpPY3eluOsZGqNGa4liWx+xAtHxHxmTwIfFVyIpsPdS1Ie8dsMIzWPlKPJb74nlSfMcGJcP+FXtcT0WWIbsVCYC6XbpGzUV79jmVUB3Qs45hoiTsCkAbxvVF+eCSiZ6WF7qurHwK54iEbSSf0yjhSpHdKIz2v60lVAu2kqNJ8Bf5WYghOPyk074fqjmlwQypOVsWNa603NTQJreS7COFpthEAMyczmd3p0dohLwMdyl29gR7qI7V+WJQX61uDAulQckGqjnLRFNjnsrOUDMO7k5LQv7P0NvVRjJ+Zj7vC7B0qZtzDzhnEmiFvAEriw13xulrlpmfBF9shdnmfc6KOfuZWwMsKJzGGD73QyCyeKJqCGP73vuYnIwzbsX16q1zVStbdrroWarTJkRfRQ8TJ2mxW625HfVSygbBUa9qoRn7gajP92NaRkg6vAIAWI1IPOjNLdflmQxPHpZlpjRCuzC+RXYBgJLhDeM8qJ8fKDFhNDgPKhRQJNU4TMFQzba8vsu4AbPK2LFtw1vG4/3UKbBCUSMDxhBEIZBsHgFNr4Iz/R6CP3o3zkme4/QV8qKrdvXmAaOVM98wxPvVwVvbs2eEFdjXdDbqI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB5760.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUR2UHNvOWd5eWZYQXE3cFZNR1VhRHJXRHFMU0kzdDh4eVVoUjJEOWF4b1BM?=
 =?utf-8?B?dnlDemEwUE1kUUg1ZXZuVkdMcnREYjZ4RWJCWjVMaFZ4MVVTeWtOdFNMeElH?=
 =?utf-8?B?U1ZBblErOTU4SzdOYU1lK2NLdkZ4RlVhZTZpNWtyNkRuWU1VVGdUOGpvMHh3?=
 =?utf-8?B?bVdxM3dLY1dKNEtGVTdpWS9sbCtxdkMzSEV0NGZ0M3R6QjJraDFWb0g4QnlE?=
 =?utf-8?B?M0NreWR5ZllPcUhRT0dBMWJjWUw4MlJWd3RMRlpjakVjOWZROVVOSDlpcDNN?=
 =?utf-8?B?aG82TGpuQ3JiYjdBZ2dZL2Y2b3RzVTR6MCs4Mmd1T1ZuZzRCMytsUHU5VEMr?=
 =?utf-8?B?S1lEaE5rNG5IRVFQZzd5NDhTd2Q3UXZ4ZllKS015UXdTTjVsbHpJVzJKYXJO?=
 =?utf-8?B?TUxjWWZLWlRWRW5kQmJLdmU4NkNKQWxlRnhYUk93S0lvd1E5SFVuZXJqQ01N?=
 =?utf-8?B?ckhlczZpTkhUVStTM2RVQ0ZSRndIdS85V21vZGpPYW5SMzUwZk5XeC92cU1O?=
 =?utf-8?B?SWRDTElGRjBPRERWUnBiT01EQzE5VlVFMzlvYmN5MXpkWCtTaGUzWWZtSDhV?=
 =?utf-8?B?aTB2cUovZ1hWM2NoVGZxZVVXOUdPWDFESm0zbTVnTm5mMmVwQ00zMXA1ZDFa?=
 =?utf-8?B?WHIvTjBxV2pMMStPWExXK1BRU3BYL3Y0d2kraXZINmk5UWFOc0lBeXN2Sm9a?=
 =?utf-8?B?M3ZWU2FBUDY2dnVtMFkwSWFyRXMwc3g0VHFPUjFoN0Y5UWd5RkRPZUdreXYy?=
 =?utf-8?B?b0NRUFg5T0lGZC8zRm5DZDJhd1IyOVdDMlBFNERQR1JYc05mYU91N2VJd3Nh?=
 =?utf-8?B?disramRuTVRQKzBxTmdaQmJsVWpDSnZuQkNiSXB5U2VCNjJhZVJuMFZDZWps?=
 =?utf-8?B?a2RPdmJSSzI1OFBWUFcvYUhFc1U3SEhiSUVFRE8vVDFVdXprWS94enA4NkdL?=
 =?utf-8?B?NmRYeitsWFVvSTZQMVhLN2N2a3RIYzNxWFU1MUh5NDZCUkprakJ2c1Y1eXFy?=
 =?utf-8?B?YVNBQWpOSkZFZ05RVGlrOUo5OWdZVElja1VDSnVSNVd0U2hndFJraHJxOGV5?=
 =?utf-8?B?VmdhWXFXSVB0Y1RUOXJ4OG82aENaS01sVEJpbFZkSHIwZnBGTm1wNXZFOGJp?=
 =?utf-8?B?aEE0SkRWNWFJeEl3YzdEN0hCeUhxcXlTMnhYKzZlcmN1UzBMTWtKODBTL2E2?=
 =?utf-8?B?c2VTOTY4bVkraGg1Q28vYTh0Z1JmRWduOTFkb0tEVTlWNjdYc3JDUHJ1cGd3?=
 =?utf-8?B?VzQ2YXQzdjhlbVJKWGoyNnpoOE1Ia0ljcnk3bDJuNHQxdHk0ZEt3NkIwTHRp?=
 =?utf-8?B?Ti9jWnVQa3REWG1rSUJQQXJFUStscW9OenAyMFdzaGFYbHRxYzZNRjMyZi9a?=
 =?utf-8?B?dW54cWFKdU1TT1REMzdtai9yclN1V1lmLzlRUDdrTWc3M04zVXJNV01BWW1L?=
 =?utf-8?B?QW00eGRYRTdvL29ER1dvUWZ6Sm5QcUpOT2dqaExBL1pTN3FHUkoxbHBYVFVG?=
 =?utf-8?B?UkE1dEovWkVQUXkzbXVkdWNtdjNsL2I1dWdVUEN1QzZSRXM5V1JDRzFHZjJ3?=
 =?utf-8?B?d1JhdjVwdkU3TDdkdThBS3p1bWNDR1Q0OVJmTVVtRjhPaTlRRVMvdHA0V1Za?=
 =?utf-8?B?a3p4RWxydHpXOVNvNDdQYWNZY3JETTU1eTJST3RRL1crVVdScXNFcFllZ1lw?=
 =?utf-8?B?ZnlSQWErTUZaT2t1WnVoWWN1U3QyVFVDTzRZWjNmbjQ3ZnF0SWRZNnZUd3Bn?=
 =?utf-8?B?VkJLYlQ1M0lIUWxJT215NHBnSWFKQlFIckRvb0NJNjhqMHNBNDdUa2ErekNE?=
 =?utf-8?B?S3EzRmExNG1pa0k0VUltNGhHZVRINkpQRURKUSs1aFA4NElIcU1HVVBOQm1F?=
 =?utf-8?B?c2NZOEpNRzNNejFXZXptNVdTYnhIMlh4Y3c3TGpPbHQ5aTdOcExFVDJWWW9x?=
 =?utf-8?B?eVFKV0ZGZk9vVW96cmZ6bGNWanljbDZ2eVpUVmcxU2xTcG1MdkpCVW1JSzRo?=
 =?utf-8?B?dzdkc25QbUVmeXRiQnlBdWxoL3hyN0VxTk0vUDhqOUcyUFdSbm1XMThwdHhr?=
 =?utf-8?B?ODl4d0V3U3NoSGVqYVdPNzlJeXB5eVk0ZWFTdForOGMyazZrK0dBMjlGdDR2?=
 =?utf-8?B?QWNmT2ZDQkZEVUJBNVNHc2I3VkZLSTgzeFRBeFBJSDlUNXpGLzRaVy9DZ3Z2?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_e06306875d9bb2bf5dc47f2bba65947a8dfd5e22camelmediatekco_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee627b2-e25c-49aa-c4ba-08dc59efdc2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 06:23:10.5337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: maiLjXSkAH8WX0tHrXfFdCcu2hlAdKYj5FKLCj22TgjNOWa7RFLmMC21OF1YYzyLbSphMhz7J+OlpP76fVljGQDENB7IrjA7khF0Pqda0qU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8901
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--22.394700-8.000000
X-TMASE-MatchedRID: 9Mh434hFDFXUL3YCMmnG4vGG8F2k2BBV9r9tEcSw8jcbIszkLg3+MSzE
 U5V3CtgtBJHeE/CD31t1F2UJ40Hu5qLCTO1UKypvJXKk/roE/RCYjZKrBeqMa8GfJqX95GfeDNE
 KwYdREu7ClwmbY1iU8AXoZjQVvrIKOByiP8mqkZtsG7r4Qh7N3CseSAhqf1rRu6qThyrnanNYTM
 99NlfBm9EaQW398b/ID4F4+5ALHTVlZ48frA+issDORqgKKiYqbv16+gil4jc76rqmQGSwT7o8P
 QV15rjgHaZob8tfIBdaDCH8lWFcdKOUVKBdY9a4Ij0zFI5DoJJeCrB32KOS0Pk3SjZMcZFkwIZs
 ltUXDSOCWFfzKajXUIFoPFs7wHUtzCK25xPd0Ts00dkxYNMRt9vhKQZ2RM31XvMXWLuxwsqsVEy
 MV1aoOJfgbWJBOd7WzKYcwSQnUGUtVrIvuTuiXDbN0t/c2qF2cbVmJQ7kUKVjvA9ERrks6CYvsM
 HQlNQYlYFsVQjWcmNcSNmWV/ZuF99faxl/I4mhngIgpj8eDcDBa6VG2+9jFNQdB5NUNSsi1GcRA
 JRT6PMumHytyu1nDzSBUTyIIVkAEOnOn2U7Cb48Ztz+TsoIMcTwz1/Eteaa
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--22.394700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4C8B6A8F45B32366EB4F87406EBC7F232489DDABC02C625195CEE30EF0ED53572000:8
X-Mailman-Approved-At: Thu, 11 Apr 2024 07:39:13 +0000
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

--_000_e06306875d9bb2bf5dc47f2bba65947a8dfd5e22camelmediatekco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTA0LTAzIGF0IDE2OjU2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KRGVhciBLcnp5c3p0b2Y6DQoNClRoZSBkcF9waHkgZGV2aWNlIGhhcyBhbHJlYWR5IGJl
ZW4gcmVnaXN0ZXJlZCB0aHJvdWdoIHRoZSBtdGtfZHBfcmVnaXN0ZXJfcGh5IGZ1bmN0aW9uIGlu
IHRoZSBtdGtfZHAuYyBmaWxlLA0Kc28gaXQgY2Fubm90IGJlIHJlZGVmaW5lZCBpbiB0aGUgZHRz
LiBBdm9pZCB1c2luZyBvZl9nZXRfY2hpbGRfYnlfbmFtZSBmb3IgdGhpcyBwdXJwb3NlLg0KDQog
VG8gZmluZCB0aGUgbm9kZSBuYW1lLCB1dGlsaXplIG9mX2ZpbmRfbm9kZV9ieV9uYW1lIHNpbmNl
IGl0IGhhcyBhbHJlYWR5IGJlZW4gcmVnaXN0ZXJlZC4NCg0KQmVzdCByZWdhcmRzLA0KTGlhbmt1
biBZYW5nDQoNCkV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQoNCk9uIDAzLzA0LzIwMjQgMDg6NDEsIEtyenlzenRvZiBLb3psb3dza2kgd3Jv
dGU6DQoNCj4gT24gMDMvMDQvMjAyNCAwNjowNSwgTGlhbmt1biBZYW5nIHdyb3RlOg0KDQo+PiBb
RGVzY3JpcHRpb25dDQoNCj4+IFNldmVyZSBzY3JlZW4gZmxpY2tlcmluZyBoYXMgYmVlbiBvYnNl
cnZlZCBvbiB0aGUgZXh0ZXJuYWwgZGlzcGxheQ0KDQo+PiB3aGVuIHRoZSBEUCBwcm9qZWN0aW9u
IGZ1bmN0aW9uIGlzIHVzZWQgd2l0aCB0aGUgbWFya2V0IGV4cGFuc2lvbiBkb2NrLg0KDQo+Pg0K
DQo+DQoNCj4+ICtpZiAoIXN0cmNtcChtb2RlX25hbWUsIFJHX1hUUF9HTEJfVFhQTExfU1NDX0RF
TFRBX1JCUikpIHsNCg0KPj4gK3JlZ21hcF91cGRhdGVfYml0cyhkcF9waHktPnJlZ3MsIHNzY19y
ZWdfb2Zmc2V0LA0KDQo+PiArICAgWFRQX0dMQl9UWFBMTF9TU0NfREVMVEFfUkJSX0RFRkFVTFQs
IHJlYWRfdmFsdWUpOw0KDQo+PiArfSBlbHNlIGlmICghc3RyY21wKG1vZGVfbmFtZSwgUkdfWFRQ
X0dMQl9UWFBMTF9TU0NfREVMVEFfSEJSKSkgew0KDQo+PiArcmVhZF92YWx1ZSA9IHJlYWRfdmFs
dWUgPDwgMTYgfCAweDAwMDA7DQoNCj4+ICtyZWdtYXBfdXBkYXRlX2JpdHMoZHBfcGh5LT5yZWdz
LCBzc2NfcmVnX29mZnNldCwNCg0KPj4gKyAgIFhUUF9HTEJfVFhQTExfU1NDX0RFTFRBX0hCUl9E
RUZBVUxULCByZWFkX3ZhbHVlKTsNCg0KPj4gK30NCg0KPj4gKw0KDQo+PiArcmV0dXJuIDA7DQoN
Cj4+ICt9DQoNCj4+ICsNCg0KPj4gK3N0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKm10a19kcF9n
ZXRfc3NjX25vZGUoc3RydWN0IHBoeSAqcGh5LCBzdHJ1Y3QgbXRrX2RwX3BoeSAqZHBfcGh5KQ0K
DQo+PiArew0KDQo+PiArc3RydWN0IGRldmljZV9ub2RlICptb2RlX25vZGUgPSBOVUxMOw0KDQo+
PiArDQoNCj4+ICttb2RlX25vZGUgPSBvZl9maW5kX25vZGVfYnlfbmFtZShkcF9waHktPmRldi0+
b2Zfbm9kZSwgU1NDX1NFVFRJTkcpOw0KDQo+DQoNCj4gPyE/IQ0KDQo+IFlvdSBoYXZlIHRoZSBu
b2RlLCB3aHkgZG8geW91IHRyeSB0byBmaW5kIGl0Pw0KDQo+DQoNCg0KV2FpdCwgdGhhdCB3YXMg
YnJhaW5mdWNrIGZyb20gbXkgc2lkZSBvciAtRU5PQ09GRkVFLiBJZ25vcmUuDQoNCg0KSSBzdGls
bCBoYXZlIGEgcXVlc3Rpb24gdGhvdWdoLCB3aGVyZSBkaWQgeW91IGRvY3VtZW50IG5ldyBBQkk6
DQoNCmRlcGVuZGVuY3kgb24gdGhlIG5vZGUgbmFtZSBoZXJlPw0KDQoNCkFsc28sIHdoeSB5b3Ug
YXJlIG5vdCBnb2luZyB0aHJvdWdoIGRpcmVjdCBjaGlsZHJlbiAtDQoNCm9mX2dldF9jaGlsZF9i
eV9uYW1lKCk/DQoNCg0KQmVzdCByZWdhcmRzLA0KDQpLcnp5c3p0b2YNCg0KDQo=

--_000_e06306875d9bb2bf5dc47f2bba65947a8dfd5e22camelmediatekco_
Content-Type: text/html; charset="utf-8"
Content-ID: <7A24658B4EDA294FB139D9A9A8C08BD3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keSBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0OyBkaXJlY3Rpb246bHRyOyI+DQo8ZGl2Pk9uIFdlZCwgMjAyNC0w
NC0wMyBhdCAxNjo1NiArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZTo8L2Rpdj4NCjxk
aXY+RGVhciBLcnp5c3p0b2Y6PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KVGhlIGRwX3BoeSBk
ZXZpY2UgaGFzIGFscmVhZHkgYmVlbiByZWdpc3RlcmVkIHRocm91Z2ggdGhlIG10a19kcF9yZWdp
c3Rlcl9waHkgZnVuY3Rpb24gaW4gdGhlIG10a19kcC5jIGZpbGUsJm5ic3A7DQo8ZGl2PnNvIGl0
IGNhbm5vdCBiZSByZWRlZmluZWQgaW4gdGhlIGR0cy4gQXZvaWQgdXNpbmcgb2ZfZ2V0X2NoaWxk
X2J5X25hbWUgZm9yIHRoaXMgcHVycG9zZS48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
PiZuYnNwO1RvIGZpbmQgdGhlIG5vZGUgbmFtZSwgdXRpbGl6ZSBvZl9maW5kX25vZGVfYnlfbmFt
ZSBzaW5jZSBpdCBoYXMgYWxyZWFkeSBiZWVuIHJlZ2lzdGVyZWQuPC9kaXY+DQo8ZGl2Pjxicj4N
CjwvZGl2Pg0KPGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+DQo8ZGl2PkxpYW5rdW4gWWFuZzwvZGl2
Pg0KPGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4
OyBib3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjx0YWJs
ZSBjbGFzcz0iTXNvTm9ybWFsVGFibGUiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxw
YWRkaW5nPSIwIiBhbGlnbj0ibGVmdCIgd2lkdGg9IjEwMCUiIHN0eWxlPSJ3aWR0aDoxMDAuMCU7
YmFja2dyb3VuZDojNzdGRkNDIj4NCjx0Ym9keT4NCjx0cj4NCjx0ZCB3aWR0aD0iOSIgc3R5bGU9
IndpZHRoOjcuMHB0O2JhY2tncm91bmQ6I0VBMDYyMTtwYWRkaW5nOjUuMjVwdCAxLjVwdA0KIDUu
MjVwdCAxLjVwdCI+DQo8L3RkPg0KPHRkIHdpZHRoPSIxMDAlIiBzdHlsZT0id2lkdGg6MTAwLjAl
O2JhY2tncm91bmQ6I0ZGRDRENDtwYWRkaW5nOjUuMjVwdA0KIDMuNzVwdCA1LjI1cHQgMTEuMjVw
dCI+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1lbGVtZW50OmZyYW1l
O21zby1lbGVtZW50LWZyYW1lLWhzcGFjZToyLjI1cHQ7bXNvLWVsZW1lbnQtd3JhcDphcm91bmQ7
bXNvLWVsZW1lbnQtYW5jaG9yLXZlcnRpY2FsOnBhcmFncmFwaDttc28tZWxlbWVudC1hbmNob3It
aG9yaXpvbnRhbDpjb2x1bW47bXNvLWhlaWdodC1ydWxlOmV4YWN0bHkiPg0KPHNwYW4gbGFuZz0i
RU4tVVMiIHN0eWxlPSJmb250LXNpemU6OS41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7U2Vnb2UNCiBV
SSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMyMTIxMjEiPkV4dGVybmFsIGVtYWlsIDogUGxlYXNl
IGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuPG86cD48L286cD48L3NwYW4+PC9wPg0K
PC9kaXY+DQo8L3RkPg0KPC90cj4NCjwvdGJvZHk+DQo8L3RhYmxlPg0KPCEtLX0tLT4NCjxwPjwv
cD4NCjxwcmU+T24gMDMvMDQvMjAyNCAwODo0MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZTo8
L3ByZT4NCjxwcmU+Jmd0OyBPbiAwMy8wNC8yMDI0IDA2OjA1LCBMaWFua3VuIFlhbmcgd3JvdGU6
PC9wcmU+DQo8cHJlPiZndDsmZ3Q7IFtEZXNjcmlwdGlvbl08L3ByZT4NCjxwcmU+Jmd0OyZndDsg
U2V2ZXJlIHNjcmVlbiBmbGlja2VyaW5nIGhhcyBiZWVuIG9ic2VydmVkIG9uIHRoZSBleHRlcm5h
bCBkaXNwbGF5PC9wcmU+DQo8cHJlPiZndDsmZ3Q7IHdoZW4gdGhlIERQIHByb2plY3Rpb24gZnVu
Y3Rpb24gaXMgdXNlZCB3aXRoIHRoZSBtYXJrZXQgZXhwYW5zaW9uIGRvY2suPC9wcmU+DQo8cHJl
PiZndDsmZ3Q7PC9wcmU+DQo8cHJlPiZndDsgPC9wcmU+DQo8cHJlPiZndDsmZ3Q7ICtpZiAoIXN0
cmNtcChtb2RlX25hbWUsIFJHX1hUUF9HTEJfVFhQTExfU1NDX0RFTFRBX1JCUikpIHs8L3ByZT4N
CjxwcmU+Jmd0OyZndDsgK3JlZ21hcF91cGRhdGVfYml0cyhkcF9waHktJmd0O3JlZ3MsIHNzY19y
ZWdfb2Zmc2V0LDwvcHJlPg0KPHByZT4mZ3Q7Jmd0OyArICAgWFRQX0dMQl9UWFBMTF9TU0NfREVM
VEFfUkJSX0RFRkFVTFQsIHJlYWRfdmFsdWUpOzwvcHJlPg0KPHByZT4mZ3Q7Jmd0OyArfSBlbHNl
IGlmICghc3RyY21wKG1vZGVfbmFtZSwgUkdfWFRQX0dMQl9UWFBMTF9TU0NfREVMVEFfSEJSKSkg
ezwvcHJlPg0KPHByZT4mZ3Q7Jmd0OyArcmVhZF92YWx1ZSA9IHJlYWRfdmFsdWUgJmx0OyZsdDsg
MTYgfCAweDAwMDA7PC9wcmU+DQo8cHJlPiZndDsmZ3Q7ICtyZWdtYXBfdXBkYXRlX2JpdHMoZHBf
cGh5LSZndDtyZWdzLCBzc2NfcmVnX29mZnNldCw8L3ByZT4NCjxwcmU+Jmd0OyZndDsgKyAgIFhU
UF9HTEJfVFhQTExfU1NDX0RFTFRBX0hCUl9ERUZBVUxULCByZWFkX3ZhbHVlKTs8L3ByZT4NCjxw
cmU+Jmd0OyZndDsgK308L3ByZT4NCjxwcmU+Jmd0OyZndDsgKzwvcHJlPg0KPHByZT4mZ3Q7Jmd0
OyArcmV0dXJuIDA7PC9wcmU+DQo8cHJlPiZndDsmZ3Q7ICt9PC9wcmU+DQo8cHJlPiZndDsmZ3Q7
ICs8L3ByZT4NCjxwcmU+Jmd0OyZndDsgK3N0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKm10a19k
cF9nZXRfc3NjX25vZGUoc3RydWN0IHBoeSAqcGh5LCBzdHJ1Y3QgbXRrX2RwX3BoeSAqZHBfcGh5
KTwvcHJlPg0KPHByZT4mZ3Q7Jmd0OyArezwvcHJlPg0KPHByZT4mZ3Q7Jmd0OyArc3RydWN0IGRl
dmljZV9ub2RlICptb2RlX25vZGUgPSBOVUxMOzwvcHJlPg0KPHByZT4mZ3Q7Jmd0OyArPC9wcmU+
DQo8cHJlPiZndDsmZ3Q7ICttb2RlX25vZGUgPSBvZl9maW5kX25vZGVfYnlfbmFtZShkcF9waHkt
Jmd0O2Rldi0mZ3Q7b2Zfbm9kZSwgU1NDX1NFVFRJTkcpOzwvcHJlPg0KPHByZT4mZ3Q7IDwvcHJl
Pg0KPHByZT4mZ3Q7ID8hPyE8L3ByZT4NCjxwcmU+Jmd0OyBZb3UgaGF2ZSB0aGUgbm9kZSwgd2h5
IGRvIHlvdSB0cnkgdG8gZmluZCBpdD88L3ByZT4NCjxwcmU+Jmd0OyA8L3ByZT4NCjxwcmU+PGJy
PjwvcHJlPg0KPHByZT5XYWl0LCB0aGF0IHdhcyBicmFpbmZ1Y2sgZnJvbSBteSBzaWRlIG9yIC1F
Tk9DT0ZGRUUuIElnbm9yZS48L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT5JIHN0aWxsIGhh
dmUgYSBxdWVzdGlvbiB0aG91Z2gsIHdoZXJlIGRpZCB5b3UgZG9jdW1lbnQgbmV3IEFCSTo8L3By
ZT4NCjxwcmU+ZGVwZW5kZW5jeSBvbiB0aGUgbm9kZSBuYW1lIGhlcmU/PC9wcmU+DQo8cHJlPjxi
cj48L3ByZT4NCjxwcmU+QWxzbywgd2h5IHlvdSBhcmUgbm90IGdvaW5nIHRocm91Z2ggZGlyZWN0
IGNoaWxkcmVuIC08L3ByZT4NCjxwcmU+b2ZfZ2V0X2NoaWxkX2J5X25hbWUoKT88L3ByZT4NCjxw
cmU+PGJyPjwvcHJlPg0KPHByZT5CZXN0IHJlZ2FyZHMsPC9wcmU+DQo8cHJlPktyenlzenRvZjwv
cHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjwvYmxvY2txdW90ZT4NCjwv
Ym9keT4NCjwvaHRtbD4NCjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--_000_e06306875d9bb2bf5dc47f2bba65947a8dfd5e22camelmediatekco_--

