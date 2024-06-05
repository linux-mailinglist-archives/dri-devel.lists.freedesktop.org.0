Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B48FC15D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 03:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B75710E67E;
	Wed,  5 Jun 2024 01:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Kth89TtH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XPWx++JQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3149610E67E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 01:38:23 +0000 (UTC)
X-UUID: 4756c97622dc11efbace61486a71fe2b-20240605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=UMcLDjFAN70nqIJEkzSNwl+o6SG3wG3oGQZdMmOypt8=; 
 b=Kth89TtHii7CJni0DQoIERqMeZowFPjAUXYwvvL7ID52wyX2bm7mZzFugskfozmlmZnaBR1XJfv2pJ4KI8BN7CGT0N12KSuJttEYqe+lm53Dr9W0OMq76CFR/oyFHzb7qkRxMtHGErnlqXpeieQf6fZq2SJtczytWo5cleYXyJc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:95543845-5620-441a-9708-1ddad1e9cbdb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:3b2d3888-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4756c97622dc11efbace61486a71fe2b-20240605
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1005317179; Wed, 05 Jun 2024 09:38:15 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 5 Jun 2024 09:38:12 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 5 Jun 2024 09:38:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwCndFUTPV9nD96VyiNaKWTF3M2+V4PnrZv8kQteeaaAxuzff099LC+Mo8rjIJPqaV/drZcPbsQM1nOimeWUOL2F3h/mV8ecFoeoUA8pEdOh2FUxQjNsjJnTQqDkaBliDxoiPutkdCSSWRkWD98LjTLLAIvuZmA47gh7jFqYU3WQTNl89E/iudtSiGiNDFosx684W0QOVdjDkdyaUqbWjE1iKDjyJyYi/9hRRmiwItMuItMjxeU1kbIecVIKY6pVEU8X+XMSqKjLwOUx3niLfgbmaEHPXSCfgV/MxQUk2vQPC+FJb47pcft/dEdxYRMGXd562EQ4Ox0l5cx7HIBLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpPZ76b8ZQ5sUz31PjO97pB+k+wXKAIgqDiMJ9er3Yw=;
 b=CP0xJ9SE+xqDMtzXdR1LF5ETKRS8P+KV0YOfyi2eH/6ck5dofggv1+hmiKyzpwcf4YVUFqsylTjPuOcgW3imCGcmA9uDR/2e/buKKLdKA4JzHJkyIW3oGZgzsBKMj2NHzt7b4lfMJl1tRzB5cMujtjJ9LixvSZjB+Yff+AXRNowrzAndJXBydccNlc5RtPyUMVcpqGDKi8NNZAZfVY4RM090Fb59TFqjm1VCaufR9M/MIJj5/tIic+wlLaK4i03OOnHwKkZMw2f4LRv1krUSkR6wldtKVjGpeP0nTCnTGtPvOvrkb0+4KPzfkb5sJiRvGWt2pdAHLh+YR6Hox99YUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpPZ76b8ZQ5sUz31PjO97pB+k+wXKAIgqDiMJ9er3Yw=;
 b=XPWx++JQ7+ZMvdMRfFMiJCUm4+heUWgnfH6CGDgCnZvKebgsjaYux5Y6/ZpQjzELpMOPCb039v9UOvGz/gOWqD8RQ/OjehNr2UhItvhIlgNfRzYKn5zEfDDUdzx55ufte+rqFGIoNsUmqgUdoBzLqsxL5pj4jGgktWz7hlxXXgY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7544.apcprd03.prod.outlook.com (2603:1096:400:432::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Wed, 5 Jun
 2024 01:38:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7656.012; Wed, 5 Jun 2024
 01:38:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robh@kernel.org" <robh@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?=
 <Yu-chang.Lee@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "amergnat@baylibre.com"
 <amergnat@baylibre.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Thread-Topic: [PATCH v5 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Thread-Index: AQHaq1SdB3VktOcCqkqfEslqsj0mTLG4e18A
Date: Wed, 5 Jun 2024 01:38:09 +0000
Message-ID: <e7845300fa822413f6308cb6297222cde89c39e0.camel@mediatek.com>
References: <20240521075717.50330-1-angelogioacchino.delregno@collabora.com>
 <20240521075717.50330-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240521075717.50330-3-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7544:EE_
x-ms-office365-filtering-correlation-id: e83654a3-3f28-4d9f-0a1f-08dc85002801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?QWM3NmVvYWpLVHhBRWZWWnBSeUFLdWpTVVpnZWtNRk8zUGJYbUhtbVJjTGow?=
 =?utf-8?B?dUc3Q3lrS2xUTS9UWVprVTZnd0QwUkFnWmgwRzNJditLVkRGb0pkRUdJT1JZ?=
 =?utf-8?B?aVBuY3VlTy9LYjBWd2ZDeXdidU00cFkvUWVuQ3c1MzkzaEdwNUVIQk9uaVJE?=
 =?utf-8?B?SFNGTGVQdjR0VFBVSzBFY1p2NEpSOGx1RHIzUFFkZXVPcHBBYlYxR0hDTkFU?=
 =?utf-8?B?YW1hK1lBQThLcjE4Q3B2MDRrcWVXWHkwRmJHODgxaExaYjJFcDA0MW10ZERu?=
 =?utf-8?B?MWxPRHBUWk14dS9hN050Q3pnWXlzTERoVWNyVXBjOUwyc3NNalJpdGhBVVUr?=
 =?utf-8?B?c2gxaUpoNkNxUjdkTzdFbUVCTm1rUTRuS1d3QURnUjcxM1FxUkcrQ1ZZQWJh?=
 =?utf-8?B?azhRR0RWcTgwaDBhYUsyZnducVRFRCtmMC9GK21NY21jc1p5TjM2blRFa3M3?=
 =?utf-8?B?K0VQV3JJTG9lMTlZTFFTU2xnR0Z6MTYwNWVKNVFZUW1oTXAzWlYxaTd3RGk3?=
 =?utf-8?B?QTNvMXpyYWxhaFdSeURTWjdYNlZBRTBnMS84WEV5eHZkUEJZQkZXS3dxVXJz?=
 =?utf-8?B?bXhLMnZWNnVQc2VCdWpXTTVwVlVLQkRyeEV6L1EyUG16Tjdvalptbll5RmJH?=
 =?utf-8?B?NitPSzcydFdOVUlaUHlKdStLYXdBaUZSN1ZZaWEzTVQwN1kvbHh5d2lJcGV3?=
 =?utf-8?B?cWE4SWJzc3FiU3I3bURYK1p1dWlRajZVVTcyanNpT280NGtpR3BFR2dQL3NS?=
 =?utf-8?B?bTRGeDJDNFkyRGtoOW53bHhERnplQUNvZ1pGdXVlZmFvVUpJMm1xUXBMM0hT?=
 =?utf-8?B?aXpKcEoyK3BsVDVaK0lNZkdQMUU2SWhiUFUxQmJ1T3pYQk1UQjcyQmY1aTZR?=
 =?utf-8?B?R05JdGY5ZFhxU1o4K0hJUTA1NDNnOHNlSlVpbjFaaVFKWGxoZlFGenYwd3pU?=
 =?utf-8?B?eUU4TmxhbFpPdk5kWWk0T2pLbTFiWjdVQzZZYTU2MTFVR284djQ3TU9lUE5X?=
 =?utf-8?B?UVk0ZFkyY2FsQ0IwVzBPQ05XL1QxUTBRRWZZL3VRK0lIdG5YWjJoQ0FzNVN5?=
 =?utf-8?B?QUgyTHFoc1NPMDBIOVJMWUQ2NDJxazJLNkRWV05KejNXdlhWVkVVbmdFakVZ?=
 =?utf-8?B?MURyai9xSXU4eWxKK3B4U25idW54QzlXNnlLTlZHZk00RXhrM3djRVJhMWJM?=
 =?utf-8?B?Myt4cGxEYTRWY2w5VlZOcVRna1J6NXdzUUlUOWVQZlhSNzd5blptNXd2NSs2?=
 =?utf-8?B?UUNmeGppVVh1NmxBVHJITVFaUzdENkk1d213VUhkS1d3L29wTkt4dGZJSlVU?=
 =?utf-8?B?dStBWThiQVZiaW4xTHhvY3pzVzRxSGNlQ25lbWxMVEdEeDh3Zkp5bjBJUWRl?=
 =?utf-8?B?N3dBWTB3c1EyNkpVak5HSGxFT0ZQcnRpa1UzVHZ5d2lEMzNibXI4UHM0SlRv?=
 =?utf-8?B?OFRTcEp5cHQ5WWVpTWU0YlQ4SiszdzFrY2FzcTdnbEdlRzhOL0RGYUhiN2Fs?=
 =?utf-8?B?Vjh3SG9hcHhtU0RDSXYyQmJYMldaZzBKNS9JcHhndHl1ZzVvZ1FMeDVZTDFV?=
 =?utf-8?B?bGdxZ0FiVjBKaGxlY0hHYnFjckFvZ0NKQnNBNDV2YnI0ZzB3VVd4bkFiN2hG?=
 =?utf-8?B?bmhmbitic0ZYMmtIcjNKMUFNUEdBbHdldC9zcHFDK25pV1BldWZrZ3l0blhF?=
 =?utf-8?B?OHl1WExCV29vUEE2SnhNeXU4MkJOcnh4UnhacWtHbC9WcXRFQldicUE1RHB6?=
 =?utf-8?B?S3Axa0tad3NrdGtLekVlUnlGM05VNEZCajZ4UCtBTlZtYzR3VmFCcm5Tc0NM?=
 =?utf-8?Q?EO6UujAcnXtjzp0oixhIn1jrIrxxVgGdiMhvQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGcrcGszWmx1VGdnVWNCT3dBaGkxNVJIRW0vcnhVYUtEeXhnb0ZjbmtUN2g4?=
 =?utf-8?B?SXpwMC84VE9TSEF0OTVmUWRmTmxKSW5tZituM0F5NUM3dU5za0JibFRoODNp?=
 =?utf-8?B?a0FnME02bVBIMDFLREgxRmlVeGJlb3BmWWp5Ynh0MmxkZU8ydjRWcFp0eXlu?=
 =?utf-8?B?MjVqMTZjb2xIZzk2RWZoVEZWTzhoZmduZ0VMQnp4TEtxL3h0cDM0RjNDcXg0?=
 =?utf-8?B?TzJKemNSSXlCZFZjU0Z0ZnIxN3VxYW5ZUk9pVk1uMFNBTDRuSGx4Z05UNnB4?=
 =?utf-8?B?bWVkUlJEcUJCWUNHNHJNL2FjNVdKMTJmYTh0L0t6b3NmNTRJN1RXbVMzcXBt?=
 =?utf-8?B?TFhIaFJDL2ZJMWFSa0xHYnVKK2NVNmpGeXdjdC93M0hTVFZVRW93eW1zZnhK?=
 =?utf-8?B?RkFjRHhlTWlCbHVYQ21mdUsvWXBtU0F0bThYNlMzMjRFdlV4UVZoWHRGa24w?=
 =?utf-8?B?bkQ3M2c3ZGZrdSswUld1TTBrcFRSOTRWNDIvVDRuT2tjUUFQWlAvT1lIWmRy?=
 =?utf-8?B?RUxSQ3JmK3N0RitnZEhhazc2S0tIcFovYnhZS3NOVU96OEdEbkw3eE9LZlVE?=
 =?utf-8?B?Q21ENkNtOFBIb2YyMXp2cGNPNkxRMUdSNjhwOEtER3pHbkppVEIzRFZXVmN4?=
 =?utf-8?B?c2FzeWpsTFVvT0NiSU9na2p5UkE0QXJpQ1dqUmpkY2ptYmlEZG90TmNFSHoy?=
 =?utf-8?B?dGo1UkJZUVEyZFA0bElRREZ1QVhwd0l4MmRsdnR5UG5IbFErbnR4aHpRUEtB?=
 =?utf-8?B?WmdQNi85aWtoSi9VVEFKaDhFckZJbEpFQllGSmtvVnJzb2M0dXhkeEN0ZjQ5?=
 =?utf-8?B?Q0R4S0E0VU13YndIK0NlcTdEZGE2LzhsdDBrVy9JSGNLV0ZIYTFqY25KUEtC?=
 =?utf-8?B?aEEzeVNqRWNsSk5SV253d1pqaW5BL29BdnNXM0lXQUNJeCtuY1dtaDYrR3l4?=
 =?utf-8?B?K3VzQU5Tbjl3alJmUlZRT3JwQzFCSmFvbXVvOFMvSUpScHVZZzNvOWZuZTBP?=
 =?utf-8?B?dVFuZTZIWWxYMlZSV3dSVm1WRkM2dWJNcTU1a1NpQUxQcGY0VEQ2Z2g0d1g2?=
 =?utf-8?B?V1BaL0dJN3VqWE94ejZjcE9MN0JOZElPOHludnJxNGk1ck5SNEllbW42UUhI?=
 =?utf-8?B?SnBLVlA5OXF5Y2hZRjhtT243OUdrczV4bHNpZXkyWk5BZWFkc3pLTHEzaDlE?=
 =?utf-8?B?bHpzZWNKUmlla1VOVGtuWGp3YXBzT0NkR0tiNmxpbzRrOWJYRGhMMEp5RXAz?=
 =?utf-8?B?bzgvbFY0WndqRW1COEJQbTF1MEtpYjVaSHVmdE9iTXR5VFdJb1JTbEZ6RVZG?=
 =?utf-8?B?MG1uaVBsV1lGcWVpU1hZcSs5NmRRc056WktkL041djY1ZkppYnE0Rk95blFu?=
 =?utf-8?B?LzRlRU1HSlc3SDU2WGZlZHdOU3hrTHhWd3JvWjl5ZURkVTh1YWZEckZ3ZUgz?=
 =?utf-8?B?a1V0OWoyVHNkd3dzNDY0MlN2VFp0eGVNVWZkSnZMWGRudWRiZVpScFBTNWhj?=
 =?utf-8?B?WXJoYjdERUlSQ3RZcGRXSDdWaHNRaFRxUFpmR3dxbjNDMUNpQmNZSTF4Rkwz?=
 =?utf-8?B?K2srekNMWWpRSUlRNjdzSjFhWmNqNXVOZ1ZaeDNRci8xNWsyNFROM3lpODZn?=
 =?utf-8?B?cmo1bXdPWmRmOEVUTjI0VGFCdWlmVEJRMGc3dHVhRG9YNWJMR3QyQU91OUJz?=
 =?utf-8?B?OXloc295bXFNaEFDeWZCb24wWnYzczQ0d1MvbHdLYnRsdkk5ajlUNE9DN1Bt?=
 =?utf-8?B?WGxJQzJsbk1SNFQreStrMEY4ZGxvTWtKNmxQVDdPYkpoMVFXVlhFV2MxOVl2?=
 =?utf-8?B?YXVNM0xJQTFvQUI2cGVXTUdvRzFyUE43OEFaVERjeFB0YXUwalVtK3ZDTUJI?=
 =?utf-8?B?d0hhOHZEZmlPWThabWFTMmdqYjNXa2I4Qll2Sk1nRGdTSnQ1TWM1N0M2eGZm?=
 =?utf-8?B?MVVKQ3NJZEUvWXhVUkxkSnh0a1FJM1prRkNOcUpyekdyL29NeC9PTVNKbEtt?=
 =?utf-8?B?Y0d0VDFXc0hsdmVxeDN5dVVTYzJJZEtNc2hXaExqcGpVSVBFWjQ2NjQrands?=
 =?utf-8?B?bHUwVXArYVpPOVZKQjZ1bitEdm1Ed0VxdU1zNmFxR1BCaW5rSFNPZTRhOE1j?=
 =?utf-8?Q?rSVwO6/ZX7oUmD8i1ckINxUGM?=
Content-ID: <3201F4BB078D3441BA0638F64E9AB946@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83654a3-3f28-4d9f-0a1f-08dc85002801
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 01:38:09.7171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLuzaeJnzYH+LPqj6KQJDOj9Ndv5wOXnwRx9bnicnMWWffcjHHSna4/qG0KYk8KXT7Z2PbZADMKcb/xEc+5RoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7544
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.789700-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hcNtKv7cnNXnSa1MaKuob8PC/ExpXrHizwVuD482edP4yzt
 lR7ZLgp2hgUZOtNuceex1lMnr76JlRLmJd2F/yFudARARTk4h59o3Yq5PCwLAsndkGBlszVvWT8
 RVkWVKi7R3mUO41t6Yn882byw79zmuyXwa/V5eQpjuN6nCSmvr+U6QztVirNpmyiLZetSf8n5kv
 mj69FXvKEwgORH8p/AjaPj0W1qn0SujVRFkkVsm5jMNUw1X/1+4I5u0RavQo4AqrEAW5WxAkyxv
 ZwvAWikK0bJVI97d/J9b9HEYHISlV1Nz/HoOwsHzIop/3J/VkfCI+zdSkIap1r/VRGx0IR2+Uo4
 vXq+qmzIizeCsI6wA0LUmjyL3DZSqHzcKNbZb2s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.789700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D51EAAD5F10EC4980CBDBE67001536E3D37A0A98A166D9CB5C40B0C64C0ED6E02000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1744389848.1967745948"
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

--__=_Part_Boundary_002_1744389848.1967745948
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTA1LTIxIGF0IDA5OjU3ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRG9jdW1lbnQgT0YgZ3JhcGggb24gTU1TWVMv
VkRPU1lTOiB0aGlzIHN1cHBvcnRzIHVwIHRvIHRocmVlIEREUCBwYXRocw0KPiBwZXIgSFcgaW5z
dGFuY2UgKHNvIHBvdGVudGlhbGx5IHVwIHRvIHNpeCBkaXNwbGF5cyBmb3IgbXVsdGktdmRvIFNv
Q3MpLg0KPiANCj4gVGhlIE1NU1lTIG9yIFZET1NZUyBpcyBhbHdheXMgdGhlIGZpcnN0IGNvbXBv
bmVudCBpbiB0aGUgRERQIHBpcGVsaW5lLA0KPiBzbyBpdCBvbmx5IHN1cHBvcnRzIGFuIG91dHB1
dCBwb3J0IHdpdGggbXVsdGlwbGUgZW5kcG9pbnRzIC0gd2hlcmUgZWFjaA0KPiBlbmRwb2ludCBk
ZWZpbmVzIHRoZSBzdGFydGluZyBwb2ludCBmb3Igb25lIG9mIHRoZSAoY3VycmVudGx5IHRocmVl
KQ0KPiBwb3NzaWJsZSBoYXJkd2FyZSBwYXRocy4NCj4gDQo+IFJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIE1l
cmduYXQgPGFtZXJnbmF0QGJheWxpYnJlLmNvbT4NCj4gVGVzdGVkLWJ5OiBBbGV4YW5kcmUgTWVy
Z25hdCA8YW1lcmduYXRAYmF5bGlicmUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFt
bCB8IDI4ICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1sDQo+IGluZGV4
IGIzYzY4ODhjMTQ1Ny4uMGVmNjdjYTQxMjJiIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhbWwNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRp
YXRlayxtbXN5cy55YW1sDQo+IEBAIC05Myw2ICs5MywzNCBAQCBwcm9wZXJ0aWVzOg0KPiAgICAn
I3Jlc2V0LWNlbGxzJzoNCj4gICAgICBjb25zdDogMQ0KPiAgDQo+ICsgIHBvcnQ6DQo+ICsgICAg
JHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0DQo+ICsgICAgZGVzY3Jp
cHRpb246DQo+ICsgICAgICBPdXRwdXQgcG9ydCBub2RlLiBUaGlzIHBvcnQgY29ubmVjdHMgdGhl
IE1NU1lTL1ZET1NZUyBvdXRwdXQgdG8NCj4gKyAgICAgIHRoZSBmaXJzdCBjb21wb25lbnQgb2Yg
b25lIGRpc3BsYXkgcGlwZWxpbmUsIGZvciBleGFtcGxlIG9uZSBvZg0KPiArICAgICAgdGhlIGF2
YWlsYWJsZSBPVkwgb3IgUkRNQSBibG9ja3MuDQo+ICsgICAgICBTb21lIE1lZGlhVGVrIFNvQ3Mg
c3VwcG9ydCBtdWx0aXBsZSBkaXNwbGF5IG91dHB1dHMgcGVyIE1NU1lTLg0KDQpUaGlzIHBhdGNo
IGxvb2tzIGdvb2QgdG8gbWUuIEp1c3Qgd2FudCB0byBzaGFyZSBhbm90aGVyIGluZm9ybWF0aW9u
IGZvciB5b3UuDQpIZXJlIGlzIGFuIGV4YW1wbGUgdGhhdCBtbXN5cy92ZG9zeXMgY291bGQgcG9p
bnQgdG8gdGhlIGRpc3BsYXkgaW50ZXJmYWNlIG5vZGUuDQoNCnZkb3N5czA6IHN5c2NvbkAxYzAx
YTAwMCB7DQogICAgICAgICAgbW1zeXMtZGlzcGxheS1pbnRlcmZhY2UgPSA8JmRzaTA+LCA8JmRz
aTE+LCA8JmRwX2ludGYwPjsNCn07DQogDQp2ZG9zeXMxOiBzeXNjb25AMWMxMDAwMDAgew0KICAg
ICAgICAgIG1tc3lzLWRpc3BsYXktaW50ZXJmYWNlID0gPCZkcF9pbnRmMT47DQp9Ow0KDQpUaGVy
ZSBpcyBubyBjb25mbGljdCB0aGF0IG1tc3lzL3Zkb3N5cyBwb2ludCB0byBmaXJzdCBjb21wb25l
bnQgb2Ygb25lIGRpc3BsYXkgcGlwZWxpbmUgb3IgcG9pbnQgdG8gZGlzcGxheSBpbnRlcmZhY2Uu
DQpCb3RoIGNvdWxkIGNvLWV4aXN0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAgIHByb3BlcnRp
ZXM6DQo+ICsgICAgICBlbmRwb2ludEAwOg0KPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFw
aC55YW1sIy9wcm9wZXJ0aWVzL2VuZHBvaW50DQo+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBPdXRw
dXQgdG8gdGhlIHByaW1hcnkgZGlzcGxheSBwaXBlbGluZQ0KPiArDQo+ICsgICAgICBlbmRwb2lu
dEAxOg0KPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL2Vu
ZHBvaW50DQo+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBPdXRwdXQgdG8gdGhlIHNlY29uZGFyeSBk
aXNwbGF5IHBpcGVsaW5lDQo+ICsNCj4gKyAgICAgIGVuZHBvaW50QDI6DQo+ICsgICAgICAgICRy
ZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvZW5kcG9pbnQNCj4gKyAgICAgICAg
ZGVzY3JpcHRpb246IE91dHB1dCB0byB0aGUgdGVydGlhcnkgZGlzcGxheSBwaXBlbGluZQ0KPiAr
DQo+ICsgICAgYW55T2Y6DQo+ICsgICAgICAtIHJlcXVpcmVkOg0KPiArICAgICAgICAgIC0gZW5k
cG9pbnRAMA0KPiArICAgICAgLSByZXF1aXJlZDoNCj4gKyAgICAgICAgICAtIGVuZHBvaW50QDEN
Cj4gKyAgICAgIC0gcmVxdWlyZWQ6DQo+ICsgICAgICAgICAgLSBlbmRwb2ludEAyDQo+ICsNCj4g
IHJlcXVpcmVkOg0KPiAgICAtIGNvbXBhdGlibGUNCj4gICAgLSByZWcNCg==

--__=_Part_Boundary_002_1744389848.1967745948
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTA1LTIxJiMzMjthdCYjMzI7MDk6NTcmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtEb2N1bWVudCYjMzI7
T0YmIzMyO2dyYXBoJiMzMjtvbiYjMzI7TU1TWVMvVkRPU1lTOiYjMzI7dGhpcyYjMzI7c3VwcG9y
dHMmIzMyO3VwJiMzMjt0byYjMzI7dGhyZWUmIzMyO0REUCYjMzI7cGF0aHMNCiZndDsmIzMyO3Bl
ciYjMzI7SFcmIzMyO2luc3RhbmNlJiMzMjsoc28mIzMyO3BvdGVudGlhbGx5JiMzMjt1cCYjMzI7
dG8mIzMyO3NpeCYjMzI7ZGlzcGxheXMmIzMyO2ZvciYjMzI7bXVsdGktdmRvJiMzMjtTb0NzKS4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlJiMzMjtNTVNZUyYjMzI7b3ImIzMyO1ZET1NZUyYjMzI7
aXMmIzMyO2Fsd2F5cyYjMzI7dGhlJiMzMjtmaXJzdCYjMzI7Y29tcG9uZW50JiMzMjtpbiYjMzI7
dGhlJiMzMjtERFAmIzMyO3BpcGVsaW5lLA0KJmd0OyYjMzI7c28mIzMyO2l0JiMzMjtvbmx5JiMz
MjtzdXBwb3J0cyYjMzI7YW4mIzMyO291dHB1dCYjMzI7cG9ydCYjMzI7d2l0aCYjMzI7bXVsdGlw
bGUmIzMyO2VuZHBvaW50cyYjMzI7LSYjMzI7d2hlcmUmIzMyO2VhY2gNCiZndDsmIzMyO2VuZHBv
aW50JiMzMjtkZWZpbmVzJiMzMjt0aGUmIzMyO3N0YXJ0aW5nJiMzMjtwb2ludCYjMzI7Zm9yJiMz
MjtvbmUmIzMyO29mJiMzMjt0aGUmIzMyOyhjdXJyZW50bHkmIzMyO3RocmVlKQ0KJmd0OyYjMzI7
cG9zc2libGUmIzMyO2hhcmR3YXJlJiMzMjtwYXRocy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2
aWV3ZWQtYnk6JiMzMjtSb2ImIzMyO0hlcnJpbmcmIzMyOyhBcm0pJiMzMjsmbHQ7cm9iaEBrZXJu
ZWwub3JnJmd0Ow0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtBbGV4YW5kcmUmIzMyO01lcmdu
YXQmIzMyOyZsdDthbWVyZ25hdEBiYXlsaWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjtUZXN0ZWQtYnk6
JiMzMjtBbGV4YW5kcmUmIzMyO01lcmduYXQmIzMyOyZsdDthbWVyZ25hdEBiYXlsaWJyZS5jb20m
Z3Q7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVs
JiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjsuLi4vYmluZGluZ3MvYXJtL21lZGlh
dGVrL21lZGlhdGVrLG1tc3lzLnlhbWwmIzMyO3wmIzMyOzI4JiMzMjsrKysrKysrKysrKysrKysr
KysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyOCYjMzI7aW5z
ZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lz
LnlhbWwmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRl
ay9tZWRpYXRlayxtbXN5cy55YW1sDQomZ3Q7JiMzMjtpbmRleCYjMzI7YjNjNjg4OGMxNDU3Li4w
ZWY2N2NhNDEyMmImIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbA0KJmd0
OyYjMzI7KysrJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVk
aWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbA0KJmd0OyYjMzI7QEAmIzMyOy05Myw2JiMzMjsrOTMs
MzQmIzMyO0BAJiMzMjtwcm9wZXJ0aWVzOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzOTsj
cmVzZXQtY2VsbHMmIzM5OzoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjb25z
dDomIzMyOzENCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyO3BvcnQ6DQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzM2O3JlZjomIzMyOy9zY2hlbWFzL2dyYXBoLnlh
bWwjL3Byb3BlcnRpZXMvcG9ydA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGVzY3Jp
cHRpb246DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7T3V0cHV0JiMz
Mjtwb3J0JiMzMjtub2RlLiYjMzI7VGhpcyYjMzI7cG9ydCYjMzI7Y29ubmVjdHMmIzMyO3RoZSYj
MzI7TU1TWVMvVkRPU1lTJiMzMjtvdXRwdXQmIzMyO3RvDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7dGhlJiMzMjtmaXJzdCYjMzI7Y29tcG9uZW50JiMzMjtvZiYjMzI7
b25lJiMzMjtkaXNwbGF5JiMzMjtwaXBlbGluZSwmIzMyO2ZvciYjMzI7ZXhhbXBsZSYjMzI7b25l
JiMzMjtvZg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3RoZSYjMzI7
YXZhaWxhYmxlJiMzMjtPVkwmIzMyO29yJiMzMjtSRE1BJiMzMjtibG9ja3MuDQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7U29tZSYjMzI7TWVkaWFUZWsmIzMyO1NvQ3Mm
IzMyO3N1cHBvcnQmIzMyO211bHRpcGxlJiMzMjtkaXNwbGF5JiMzMjtvdXRwdXRzJiMzMjtwZXIm
IzMyO01NU1lTLg0KDQpUaGlzJiMzMjtwYXRjaCYjMzI7bG9va3MmIzMyO2dvb2QmIzMyO3RvJiMz
MjttZS4mIzMyO0p1c3QmIzMyO3dhbnQmIzMyO3RvJiMzMjtzaGFyZSYjMzI7YW5vdGhlciYjMzI7
aW5mb3JtYXRpb24mIzMyO2ZvciYjMzI7eW91Lg0KSGVyZSYjMzI7aXMmIzMyO2FuJiMzMjtleGFt
cGxlJiMzMjt0aGF0JiMzMjttbXN5cy92ZG9zeXMmIzMyO2NvdWxkJiMzMjtwb2ludCYjMzI7dG8m
IzMyO3RoZSYjMzI7ZGlzcGxheSYjMzI7aW50ZXJmYWNlJiMzMjtub2RlLg0KDQp2ZG9zeXMwOiYj
MzI7c3lzY29uQDFjMDFhMDAwJiMzMjt7DQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO21tc3lzLWRpc3BsYXktaW50ZXJmYWNlJiMzMjs9JiMzMjsmbHQ7
JmFtcDtkc2kwJmd0OywmIzMyOyZsdDsmYW1wO2RzaTEmZ3Q7LCYjMzI7Jmx0OyZhbXA7ZHBfaW50
ZjAmZ3Q7Ow0KfTsNCiYjMzI7DQp2ZG9zeXMxOiYjMzI7c3lzY29uQDFjMTAwMDAwJiMzMjt7DQom
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO21tc3lzLWRp
c3BsYXktaW50ZXJmYWNlJiMzMjs9JiMzMjsmbHQ7JmFtcDtkcF9pbnRmMSZndDs7DQp9Ow0KDQpU
aGVyZSYjMzI7aXMmIzMyO25vJiMzMjtjb25mbGljdCYjMzI7dGhhdCYjMzI7bW1zeXMvdmRvc3lz
JiMzMjtwb2ludCYjMzI7dG8mIzMyO2ZpcnN0JiMzMjtjb21wb25lbnQmIzMyO29mJiMzMjtvbmUm
IzMyO2Rpc3BsYXkmIzMyO3BpcGVsaW5lJiMzMjtvciYjMzI7cG9pbnQmIzMyO3RvJiMzMjtkaXNw
bGF5JiMzMjtpbnRlcmZhY2UuDQpCb3RoJiMzMjtjb3VsZCYjMzI7Y28tZXhpc3QuDQoNClJlZ2Fy
ZHMsDQpDSw0KDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtwcm9wZXJ0aWVzOg0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2VuZHBvaW50QDA6DQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzY7cmVmOiYjMzI7
L3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9lbmRwb2ludA0KJmd0OyYjMzI7KyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkZXNjcmlwdGlvbjomIzMyO091dHB1
dCYjMzI7dG8mIzMyO3RoZSYjMzI7cHJpbWFyeSYjMzI7ZGlzcGxheSYjMzI7cGlwZWxpbmUNCiZn
dDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtlbmRwb2lu
dEAxOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzM2O3JlZjomIzMyOy9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvZW5kcG9pbnQNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGVzY3JpcHRp
b246JiMzMjtPdXRwdXQmIzMyO3RvJiMzMjt0aGUmIzMyO3NlY29uZGFyeSYjMzI7ZGlzcGxheSYj
MzI7cGlwZWxpbmUNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtlbmRwb2ludEAyOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzM2O3JlZjomIzMyOy9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRp
ZXMvZW5kcG9pbnQNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7ZGVzY3JpcHRpb246JiMzMjtPdXRwdXQmIzMyO3RvJiMzMjt0aGUmIzMyO3RlcnRpYXJ5
JiMzMjtkaXNwbGF5JiMzMjtwaXBlbGluZQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7YW55T2Y6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7LSYjMzI7cmVxdWlyZWQ6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtlbmRwb2ludEAwDQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7cmVxdWlyZWQ6DQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtlbmRwb2lu
dEAxDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7cmVxdWly
ZWQ6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjstJiMzMjtlbmRwb2ludEAyDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3JlcXVp
cmVkOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7Y29tcGF0aWJsZQ0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7LSYjMzI7cmVnDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEt
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

--__=_Part_Boundary_002_1744389848.1967745948--

