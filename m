Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF467CDB26E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 03:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBE610E30E;
	Wed, 24 Dec 2025 02:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uJlMzLGe";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qebTVDxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9292910E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:19:24 +0000 (UTC)
X-UUID: f529fa68e06e11f0b33aeb1e7f16c2b6-20251224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=NRi6lAcKhBS7f0fYAfAIcbGYx380MGdLWLxKHHwF7/A=; 
 b=uJlMzLGeHS98D/VG6p5LtXdBX4vbPJ03k9+p5eC2UVZOFKySVQ0xds1kbPaBtZBaHMWJ43DpDfugX3MLQ47VfoiHFW1gscEpUlMeIJgME4w2NJiQc+5+0MmVI4P1mOtlO0GhUyYyNvMb1jaSq5hId0f86sSN4+gg58DQoJGtV5s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:c37632e7-478f-4914-a83c-0eb5ebe03d23, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:6f44db28-e3a2-4f78-a442-8c73c4eb9e9d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f529fa68e06e11f0b33aeb1e7f16c2b6-20251224
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1099586231; Wed, 24 Dec 2025 10:19:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:19:19 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:19:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMU0kN0J2ANWy8Gm6SJ23XKSePjzZmJ77//+tJYeO7VfLPwUyzTCcDw0eP+vyHhcRm4bZGgL8684hoRtmYkbP99VBGDiTd2sCt/Qz+UbkBKX1hq007Zkk0vYZ1n7BffF0B1oa9BIfUZmk79MBBdDY0Kz+EfDR7iB2uuYo+72ezqpkAER7kRnJsUJTXC8rn3PZMM/pxXzoIJ8I2yDIkMwh1vgTP2mSPPJQK9FaYq/djdmnISLb/6vviMOZ4V7Ylqs6f8X55t+BCaTh+vMD3w0bGbkyA6XtsNmyUF+cVGJ0M9/lbADfPEA3nFNWsMHXEX8bhnfY15X2vLL1SWVHnb9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPWan6U32Ol08Y+2sWtvySJ8PnLGRk6NqirT28quDJI=;
 b=i1Pqa5AK23P/AO7F2i7T3OMHW3cyAolb3ihiOoHh1eC+Y6Y9WdZhswnkvvKIB/Lf/7ZEAzhc70j+36nDVNLT8stnrY1R5HgcvmkI7kSPVYxTthOy/U7f7nGAOJ5V86mmWqjTXcwqxeVFpWQ3r3ZEf6+4EPww0uwfW39Lp0eij2c7abYSfP/a5XL/uuloJOOdYhXo6utvaEGbNTNUeU1CQ5hm4XaeaRvHNqDLGjEj/QuGEgQp/7N+H/lY7OWsw4tzUMpbGKFaU4J1Kdv/E4/pOmXEkCuMa5Q6k4mdjO2qR+jZ8bC2lySJeh51xP6UiGckpDZYv6Ptwn8kKhXG2B6ynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPWan6U32Ol08Y+2sWtvySJ8PnLGRk6NqirT28quDJI=;
 b=qebTVDxWkf60k1dxXAQIW6XyXxxFUGvtOPZD6pdfACUfGCUAUaAN4OQGZ2CDOwbF7QwqVsUOdggDuYupFxpLmwqOUATGXr4bHB/jz6gT8iwCUbDxwZjO31dZ+2dRyudikXy+QFaLUSM7bfXPQE3QN5BtgzytzJVZtmj7qhH9MYM=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 02:19:17 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 02:19:17 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH 04/11] drm/mediatek: ovl: Enable per-plane color
 operations on MT8195
Thread-Topic: [PATCH 04/11] drm/mediatek: ovl: Enable per-plane color
 operations on MT8195
Thread-Index: AQHcdET4jJL085hn/U2T9sj7MisBX7UwDt0A
Date: Wed, 24 Dec 2025 02:19:17 +0000
Message-ID: <515f2adf162b33785790acdebe5b345571ade668.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-4-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-4-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|KL1PR03MB6899:EE_
x-ms-office365-filtering-correlation-id: 2d3a8704-be0b-4191-d4d8-08de4292d6ef
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YTNXdUZPRlVrZk9peWVkdmVLczVieE9hbVUwTDk1S3lnYlFPNWF5OUtLeE5z?=
 =?utf-8?B?QXRxRTZZSm12Wmg2bWFzaG13ZnpaK3AwNlhMYzVsQlV1S1Y1V2lxVWNBYW0y?=
 =?utf-8?B?MnhiZlkwQUhUc0l0VjVTUm9RYVI3a0crSkt5RmxKL0pCMXExdzBwMG55V3Jr?=
 =?utf-8?B?Z1dVUnlSV2R3dVdMdGhrRzNiaEo4bzhYUmpJa2lNSmo3b1M5RVl1b0NobWhw?=
 =?utf-8?B?dEwwUGR4c1NnTGhIZkV1T0RpdGM2NXpRamZuZTFsVTNnMkhrcFVvUGxzNmUv?=
 =?utf-8?B?Q3h3dW4xRDVJM0t4STZRZ29NZjdobENxL0RKZEpZK0p1bnRXWDdERDdXQ3Y3?=
 =?utf-8?B?a0JsY2ZyaUFQUXNjQW5iWUc2b1N2dlJoTHRwZ0ROOCs5VzIyM0JqTG1KWlhH?=
 =?utf-8?B?Sk5MdjZuaEc2emZ2WStZRVorNVJOWDNGNUgyN0hUd1h0ajRpWTZFZVZiYmlP?=
 =?utf-8?B?K3hKRWk2cEFYYTNvcHFiZjQwRlpOYm5FR1QyQWdRc25wNVA5bnVJdnJTSGdP?=
 =?utf-8?B?MTlEd2lQa2VYRGNMT2tGNytncnRFN3RkTjV1UlIvZXUwV0xjQ2hYeXlJaUNz?=
 =?utf-8?B?cHcvWi80eG1iemJkNENuYlpEZnNaaVdSNnFIa2FRSE9ic1RjZEVoYU9mU2hU?=
 =?utf-8?B?MVNwVko4bGM0OVFFWDJkRHRVclRzRW1UZXFsM01zcTR5MWJqaDk0VUphbytK?=
 =?utf-8?B?R01yZGdhbUJrZnc1UlJLb0hoTDFjZGFSSXJPRE5YWXlRV2tzT3Q0S05ReGZm?=
 =?utf-8?B?blZacjRCOWxQVktHSUNiQVE5SGNtOG80bklUU2lVdXpKcUZaeElJQmt3TStE?=
 =?utf-8?B?bzkyTFN6bUZSZFNNYXBFUzNFWjArVms2MTZ5VENuTG83MmlSV0F6eXVPMjcr?=
 =?utf-8?B?TzlnbTlGVmRVa2dWN0I3c3Z3VHJxSVdlQmJVR1FZN0tuQ203TGJZUnRISFB6?=
 =?utf-8?B?dGNNbFVqdW1BeUt3K1hQTldndnZoRk1kL0F3UjQrRG0wNkRIak9pV2N5bEEv?=
 =?utf-8?B?U1VrWlFsaU1KR0N2R2hPbDJ5aFhnZkZZR2trNzVsRnVEcnJPWTlGcitqWjVl?=
 =?utf-8?B?Mk1iV2lYWS9Ec0M3ZGtTSytQR3dlVmVvWFcxNVN5dk9VZjVjUWxkUHAwRisz?=
 =?utf-8?B?OGlQZnZ0R1Y1TDF3bWwyMkx1V1VjQVRrYkdFVTgzd0EyeGtwZnlwM1ZPUWx4?=
 =?utf-8?B?NklyOFlQSGU2bVlaTW82amVvUlNjUEJGTWpuZmlsTHJvNjlWcmJjbzNodGd3?=
 =?utf-8?B?Y1RTZzExUmlJcFkvQ2h5c0JaQzVYalJTR2tYOTBQMmVCQmIvdk5PdzNwNVh1?=
 =?utf-8?B?aHQxdzdRcWRFcEN5RnhkR3g1SzErT1ErYWk0RjB0dm5PN2xBVGFDVWpzNXN5?=
 =?utf-8?B?REErd25CSERhM2VBV2lsbVo0d2h6VVU5bndSbzNYZ081bHlLY1NkRlVkZ0RL?=
 =?utf-8?B?dGUrQ2xJTEh0UUJlY3Z3ZWdhRVZOTDBFeGRIWEIvYjQ5K2RNR1VhekwrL2lH?=
 =?utf-8?B?UGdhaER3dUJoWm1BTzY3QkJiM2lGeVFCQk9kQmxHTkNYRDg2M1ZBM2Zkcnhq?=
 =?utf-8?B?RUZaYW1RVkRjZE9iaHB1NUpqcngzVWdnNTVSZXV6WW11NnEwbzZIbXMrbFlY?=
 =?utf-8?B?Q1h0dFNlbzJaVk1kRE1FaStzeWpIdi9QVWVZRmU3eVBjTENwS1ZQZGNpNE9P?=
 =?utf-8?B?OFdCMk9MdkdIanlFTUR1aitKaWJqZEUzdlJlYUt1KzA5UGxUcnVGR1RaQ1lt?=
 =?utf-8?B?eDdQWVNhNHBrQUZRU0Yrbk1ST2VJYWNjNzIxQkRmajY1QU9HenFoR1RUbkZG?=
 =?utf-8?B?aEUxYVNhekQwQW1Zd09jSHpTcGhSL0t2TUpVYkRHOHJqMUYxaHB6UG5tNENz?=
 =?utf-8?B?dzdyLzlSaEpJVDA2TTd5bWRValNTQWxSOXFxaU5ZMkJyRWFza2Z0UFoyV1Rs?=
 =?utf-8?B?SXhwWkt6RkVoRFJaM1FSZjl4SVRsWVBmemxsa3F3V2xBZ1FTSGU2clJXWjYx?=
 =?utf-8?B?S0tZakxXY2ExRzBXb0o5RXJtcW83MHZKU3hTR0lKRnZ3NFVkNHRRcGlacys5?=
 =?utf-8?B?bzA4OWVrRjdkS3h6cUl1aG9xREJrbXVjTXlVZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR03MB7810.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2RSUkxyY3dmMndkenpXQzdyU09FR3NIYjkzamNPdWFheE5KUlgyTmJyTzgw?=
 =?utf-8?B?WXF0S25VV0JNUzRIR3RGTmEwaXQ0b0ludi90N1Y5Uy9zT0tmaGRSWjJTZGpx?=
 =?utf-8?B?emN6VldObzA1RDFCL0lHUXNvWHdIRWNQdG43WmthbWFyMzAxZjVoNWlTN3U0?=
 =?utf-8?B?S0dzQzFzQ0w4VUVqelRCMFU4UFFtNFVEdmR4RXhFcDE4MVByZ2NMaVJ1RkN2?=
 =?utf-8?B?c3VtelhBTVhBQ2dpWWxtamhCMXpYS0ZHNUxzd3RVOXBCc1I3YmNvWGNnZkFF?=
 =?utf-8?B?cGlVTldOQVZ2MSt4emR4QWJ6MkM2QjZhcWpVUW81cTlKSjdZN3lOSHRMWnE5?=
 =?utf-8?B?ODZhNnVlOEZzSW5HOUxrNmtZQTNRRXdXb3NJcVk4UUsvSk16WThWZHI1RXdo?=
 =?utf-8?B?MXUxZGZMMWNCYkIxWmlBSVRYb01rZ2Zyekk2bUc5ZnNnZzVGYTNWNjkvdTV2?=
 =?utf-8?B?bFpMUEUxWXZHQ1MyRnBwNHhEMXEvRmhHWTdFTUFEQXZSTWpzL21iajJmR1gx?=
 =?utf-8?B?Vk9TbjhoVGI2QXhVMlJTK2lLODVjbWovN1FIMDQ3N2Nxa3AzZUhHaEIvYmZP?=
 =?utf-8?B?YUMrRkhPb3NyMkpValFyZVJqL0xsNmRYM0RUQUxldnlWWExpUEVJNG9Ycjd2?=
 =?utf-8?B?SEc3QjliUHZndDJOVmFvYjRibUFhSWJqYndydXd4ajZleFVaVHVsSXp6elhl?=
 =?utf-8?B?UHEyZmZwYWNBWDdXTGZyajRJSUZnTS94MG14VEd2aml1U044WEFrQVlibWlv?=
 =?utf-8?B?M2p6MGplYWp6TmJwLzZDMVQ5UU1EemJLTjZuaEJPT1BVOFUzTHVYeWlYdzJ4?=
 =?utf-8?B?Z1JOay9wM3JnVGlTbjBLSmg3cDNYeVVPNDBqMEUvUXB4OW9hRzRzOE8rVmZq?=
 =?utf-8?B?U2dOenFMNDAzdGhydmhmZFdBN0pUK2M3OUJBYWVIRFRxd2pjNkhpQ2ZRWmRD?=
 =?utf-8?B?QUJLV1pudXdXeEowMTRjSGNFNFU3R1RDcURaWStqWXJOdTgyc2lwTG9MbGZH?=
 =?utf-8?B?YW43N2tXdy8wT2JmSVVpckMvR2NXSWxwZzczUnVrQ1Bsc2o1L1I2bmtnWWRP?=
 =?utf-8?B?T1lJRStVKzQ3Q3JGaGR4K2xmaUpPUWxOMnN1MHVUTFdDQnRSMHA0aTN4SEFQ?=
 =?utf-8?B?azY2cUptcDBpSGF3cUdBVGR4L1RBR1JVdHpJRG8rWkNRZEREM2VEcE9mblFV?=
 =?utf-8?B?R1ZrNDM5VitVUVdZLzNZYXUySU9LclN5V3lPTFQ1T1BsR09UNzgvMEl5Wk1w?=
 =?utf-8?B?NVBlR2htWUhRb3RwazZsRDRWZkkvelNva1FMMnFkZWw5dDV5TTZTTHp3WDV2?=
 =?utf-8?B?Z3hVeFNUa3p0dzBMMjJncW9GVlRoS1I1N2VsNW9zcW5KRE4wWmVMdlkyQmcw?=
 =?utf-8?B?OXZPL3p5akFNRXd5VGNiOXdraW4zd2dORWovSDd1WEJsQUJuTkZ1L09Rb0lG?=
 =?utf-8?B?Y3Q2bDRLdFpuMkVCb2IvK2I1V0VlVGs0K2d6L0xickdFTDRXMlYzRjVrNVNW?=
 =?utf-8?B?ckxLREh0ZjgzT3draXZjZTk5SUZGbWJOQXVDMzd1Zjh2b2J1SHA3cVp4NkJu?=
 =?utf-8?B?dTFSc3dmSDNDam9YaVFxTEU0NzArVXIvRjg2NjFsVlpvd1M2VlNCMlRncjB2?=
 =?utf-8?B?NWFjTW8vV3AzdUd0RG9QVjJIbEhMWGZPUzFkem5iOFRNczZ5dHA5dEJ6ZlE4?=
 =?utf-8?B?cXIwYmxPQy9SUlgvWjh0U0JpZHN3OVZYdjVydmlrSCtsY3lQVVNjV256TWRO?=
 =?utf-8?B?ZE1xQlJJNGhqbEp6Sm9abUV4UDJ3V3VjQ2NYc1hhTkhTakpOK3Q1MW5lOVBU?=
 =?utf-8?B?ODQzMXcwUkY5dnZCRndDQ0JXNmdTYlJNeEtnbGxZWnlQZzBmNFFoNFN5L2Jr?=
 =?utf-8?B?QVVub1lKQzRhMTdDTDNsVzZ2L2wwOGlRSExPdUVQRXg3cDFNMUFIeWdaV3VJ?=
 =?utf-8?B?dHB6L1NpQWpJR05ZdDBtYkJZOUdZOEo2SHlqWkl1d3lmc0ZPN1huMHJLZm9i?=
 =?utf-8?B?cHF3cWNxVzhDaXJRWFVWcExCeFNBbHdVK3h3cFpRVHRmZHhYOHB6Zjh6OWFG?=
 =?utf-8?B?eTVoeGorVUFNZTAxVS9jaGU3VGJkY2l4RTJ5RXE4akdsTk93dnZZUVJ3WkJw?=
 =?utf-8?B?T2NjZVFvTWVOOFBkWE4xSVdIVHk3RkVxM1FSd0h6N3lxMEhkM3RMVkdiVjI4?=
 =?utf-8?B?ak55WDNhQTQzYWVNcUYwQlJ2QUc2UkVQSzNNb1VGd3pDWnpleHNObXVMUytH?=
 =?utf-8?B?RVJaUUovdjF6QnpGeERZMkF6TGRxdG40NWpxMlRYeStraUdxUEgycDVvd0Mr?=
 =?utf-8?B?N2hnSThyYkxzQmVpMGUxK2p5NGN6Wm1BSy9qTXVxNmo4MldYamVKOVROeWto?=
 =?utf-8?Q?A/eopcnaesylrb0U=3D?=
Content-ID: <065862052C9D1D43B398CDF809D30633@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3a8704-be0b-4191-d4d8-08de4292d6ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 02:19:17.1547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vatDr0VNy8TNJ04kiP6wk8a9DluDydhdOMzGuaO5UpTVLpqP4x69VdqIFiOkxfEBLwDPxsBJlrr9tP0Yf52IylctFhCHdvMVuq2be7uZHp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_177781939.1878191683"
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

--__=_Part_Boundary_005_177781939.1878191683
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gTVQ4MTk1J3MgT1ZMIGhhcmR3YXJlIHN1cHBvcnRzIHBlci1wbGFuZSBjb2xv
ciBvcGVyYXRpb25zLiBFbmFibGUNCj4gc3VwcG9ydCBmb3IgaXQgaW4gdGhlIGRyaXZlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29s
bGFib3JhLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jIHwgMSArDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGluZGV4IDQ2MjM4YzIx
YjBhYy4uY2ZjNmEzMTU0ZjczIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bC5jDQo+IEBAIC03MzgsNiArNzM4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
ZGlzcF9vdmxfZGF0YQ0KPiBtdDgxOTVfb3ZsX2RyaXZlcl9kYXRhID0gew0KPiDCoMKgwqDCoMKg
wqDCoCAuZm10X3JnYjU2NV9pc18wID0gdHJ1ZSwNCj4gwqDCoMKgwqDCoMKgwqAgLnNtaV9pZF9l
biA9IHRydWUsDQo+IMKgwqDCoMKgwqDCoMKgIC5zdXBwb3J0c19hZmJjID0gdHJ1ZSwNCj4gK8Kg
wqDCoMKgwqDCoCAuc3VwcG9ydHNfcGxhbmVfY29sb3JvcHMgPSB0cnVlLA0KPiDCoMKgwqDCoMKg
wqDCoCAuYmxlbmRfbW9kZXMgPSBCSVQoRFJNX01PREVfQkxFTkRfUFJFTVVMVEkpIHwNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKERSTV9NT0RFX0JM
RU5EX0NPVkVSQUdFKSB8DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEJJVChEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSwNCj4gDQo+IC0tDQo+IDIuNTEu
MA0KPiANCj4gDQoNClJldmlld2VkLWJ5OiBNYWNwYXVsIExpbiA8bWFjcGF1bC5saW5AbWVkaWF0
ZWsuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpNYWNwYXVsIExpbg0K

--__=_Part_Boundary_005_177781939.1878191683
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMjMmIzMyO2F0
JiMzMjsxNjo0NCYjMzI7LTAzMDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO01UODE5NSYjMzk7cyYjMzI7T1ZMJiMz
MjtoYXJkd2FyZSYjMzI7c3VwcG9ydHMmIzMyO3Blci1wbGFuZSYjMzI7Y29sb3ImIzMyO29wZXJh
dGlvbnMuJiMzMjtFbmFibGUNCiZndDsmIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7aXQmIzMyO2lu
JiMzMjt0aGUmIzMyO2RyaXZlci4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO04mIzIzNztjb2xhcyYjMzI7Ri4mIzMyO1IuJiMzMjtBLiYjMzI7UHJhZG8mIzMyOyZsdDtu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMxNjA7
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jJiMzMjt8JiMzMjsxJiMzMjsr
DQomZ3Q7JiMzMjsmIzE2MDsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0
aW9uKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyO2luZGV4JiMzMjs0NjIzOGMyMWIw
YWMuLmNmYzZhMzE1NGY3MyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTczOCw2
JiMzMjsrNzM4LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210
a19kaXNwX292bF9kYXRhDQomZ3Q7JiMzMjttdDgxOTVfb3ZsX2RyaXZlcl9kYXRhJiMzMjs9JiMz
Mjt7DQomZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzMyOy5mbXRfcmdiNTY1X2lzXzAmIzMyOz0mIzMyO3RydWUsDQomZ3Q7JiMzMjsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOy5zbWlfaWRfZW4mIzMyOz0mIzMy
O3RydWUsDQomZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzMyOy5zdXBwb3J0c19hZmJjJiMzMjs9JiMzMjt0cnVlLA0KJmd0OyYjMzI7KyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7LnN1cHBvcnRzX3BsYW5lX2NvbG9yb3Bz
JiMzMjs9JiMzMjt0cnVlLA0KJmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMzMjsuYmxlbmRfbW9kZXMmIzMyOz0mIzMyO0JJVChEUk1fTU9ERV9CTEVO
RF9QUkVNVUxUSSkmIzMyO3wNCiZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7QklUKERS
TV9NT0RFX0JMRU5EX0NPVkVSQUdFKSYjMzI7fA0KJmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSksDQomZ3Q7JiMzMjsNCiZndDsmIzMy
Oy0tDQomZ3Q7JiMzMjsyLjUxLjANCiZndDsmIzMyOw0KJmd0OyYjMzI7DQoNClJldmlld2VkLWJ5
OiYjMzI7TWFjcGF1bCYjMzI7TGluJiMzMjsmbHQ7bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tJmd0
Ow0KDQpCZXN0JiMzMjtyZWdhcmRzLA0KTWFjcGF1bCYjMzI7TGluDQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_005_177781939.1878191683--

