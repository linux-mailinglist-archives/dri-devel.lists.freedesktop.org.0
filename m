Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D355A42251
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0266410E41C;
	Mon, 24 Feb 2025 14:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qsPfpznD";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qot/yl/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC9A10E0B5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 17:49:55 +0000 (UTC)
X-UUID: 93d841f6f20e11ef8eb9c36241bbb6fb-20250224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=A2SQnlu17dxGxl7Ok1kWzO4m2HUguc5t+OhxcNXNApg=; 
 b=qsPfpznDV34mYCVJDhEuD2Ly90RK+NMLk7gQIUX84hOV5SVDdAxNG238xg4aSUexzX0iZcQn4GS/hy6XI86svEQ5Ji32JXn0o3snknVp0Wq6xjbanVEtbvGk6eEzfCqCWu80cK4FmS7dbz/V50GT2PzktWc85P5+twJZp3w8bq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:c4ae6d30-d29d-4c1b-95a9-bf979a8fb4e8, IP:0,
 U
 RL:25,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:27
X-CID-META: VersionHash:60aa074, CLOUDID:909e3adc-d480-4873-806f-0f365159227b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 93d841f6f20e11ef8eb9c36241bbb6fb-20250224
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <sunny.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1610565766; Mon, 24 Feb 2025 01:49:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 24 Feb 2025 01:49:48 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 24 Feb 2025 01:49:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpmmJJ8RZd3eRjd8BxxtA2lYoKmytk2Z52v5ImO6a4qWzdb6r36p8k4TuX79DrZR1g4BOQ7dQwo5g6XtnEOkExBWdm9QuwL4/S7A75X1Bu2MTf3lWFkbyhU9TvyZzM1Eo4YnomUEj9Bo0pRevzu9ELv3iv5Eqj3FfbSgXGSJXR1gXjiiHWOZ8Y4HR6f542PjQKC3A7/P+gAN1VSoxHrXQofnlhbh6CRCJigbAqbn2MJTgfxD0nPlMAYLfRM5lW52glMIhfTtJJ+Uz7mkxk9sndES9LS7UZ3QFka+2EG0QDfyTMGj89420oKGzB3erSRePk/40oIbYvVD8coPi2bXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLW8vbjxnwgRMfFPz4l3PYvXM6qU1u0vPK+gv59jqZw=;
 b=vMCfKwySKXdhZPm0c3LH6g2E8o85nNKHaJxr3fu71UIlG6N6orob7x50ypJPQCZ6LzOZI07qx3afQ7wTHk0gwtx+MBA7w0ehG+8/z6NBeojuxRGgUg7kIsOdox94Ju8xrZi6LX0Zo7EWLnBbZGp4zjusI2oQEFlopq/V5TZQWs7vr+h2b2lT1ZUDCDKYthFmYatF8jYGLVF+r3VU4ZOaYACfVaBwaM52JzJqA1/lVTGk2XUyVNQKWT3+fhBLmcPJfvluGxQDPM2Fm1vaX5EVXh8rPnKQsc5Sudodeo+0vj8/e7Iv6WRmphvu0xgTtvs3pOLgxkZbozv9N4az9Rp4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLW8vbjxnwgRMfFPz4l3PYvXM6qU1u0vPK+gv59jqZw=;
 b=qot/yl/TglVNRdyHZcbScWSDdJMxIPFzsgWE3L2yiiJb1shkynII3pcsOZCbb0UiK5r0wyaY3ygEUkrTG++wyMZK/HF08tzRSFg6zejTdDt//jvuvhGAJwBQAxw9X/8Q7smGU4kNtKMAMqK/1jsYhsKIskCr0XZ70/hnOEBEXTo=
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com (2603:1096:405:1a::6)
 by TYZPR03MB8092.apcprd03.prod.outlook.com (2603:1096:400:464::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Sun, 23 Feb
 2025 17:49:45 +0000
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf]) by TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf%5]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 17:49:45 +0000
From: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Topic: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Index: AQHbfDA5jLoxTxf3wkWDuIJMLNCq1bNCY5mAgBLaqwA=
Date: Sun, 23 Feb 2025 17:49:45 +0000
Message-ID: <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <20250211-feed-shed-4b32f146cc54@spud>
In-Reply-To: <20250211-feed-shed-4b32f146cc54@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB8330:EE_|TYZPR03MB8092:EE_
x-ms-office365-filtering-correlation-id: cb369ff1-f500-4e98-eed7-08dd54327561
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TzR4TGhiVGYySmpKRW45c1VmbHVqQ0c3UzlISHIzV2o4aFgwMTNJMjA5aThE?=
 =?utf-8?B?eTlpVGhrbVlGRlpFSXo2L1lZYWRabWsvc2NCZjJYWnM2MDlsV2xONWYzbXlH?=
 =?utf-8?B?K3N2RG95WkFQVjV1NlloTCtEVSszRG9BT0xkSWVxRHYwcUVBNThLeE5ZOVAr?=
 =?utf-8?B?ajUxaTBIQksyN0NQMkxzVm5rdVptRSthNlBOeFBHSlRReWRjUFNRckpyVE5R?=
 =?utf-8?B?MHlMMHNnTWUwWFhqcGgvZFdXT3RXVi9pcFhzRTVPOS9kRWdITVl0Zmw5dmgr?=
 =?utf-8?B?Y0g1Tlh5Sk9GTHA3N1JOSDRZN2wzNmRWVE1JV2dXUjJmMzV5dVZMWlZqRHQr?=
 =?utf-8?B?eEIxYTVIdlM1L1MwQ0hKblFxQW1Vb3k2YUxlS0pGK28yQlQ5NzUxN1l1Vkgz?=
 =?utf-8?B?cXlka3FCVERRMkpyblNUL2EwMXl4Z2hSWktjOVIxLzMvQU12cEpuY0xud2Fa?=
 =?utf-8?B?SCtKNmFjRVZlYWMzbzJDUnJiclgvU3d5Sjh0SUdGd2tsaUhTcnMxdGlhV29h?=
 =?utf-8?B?VVVodE5oQlNSOVdlYjdCd08yM2JHak1uRkh5ZXl2WFJQMllPQjJDRmpMSlFY?=
 =?utf-8?B?ZEpZQVJBbE13Vm1EeXQ2SmxDc0hjVmFLQUtZeUJRdzAyNXdsZTZ0N0RBTWgx?=
 =?utf-8?B?dG9RQk5vNHlRaFV6a0hEek9UNEFKem9JZFhMYS9GaEJ0KzFLUWE1Z0prcVpi?=
 =?utf-8?B?N3c1UU5nNnMyRE15cFMrRGVmM1BvcjFaWHBpc1BMOUtYR0lqaFBmc2tvSlB1?=
 =?utf-8?B?SGFPWnNZRW1GTHVBNXNINlVPNWoyZGE2MVlOSzdYVXNLbVNyckdBS0I2T09r?=
 =?utf-8?B?cmt6dXYwdDJFOXNLbHVZRVlQVkZzV01WcXhrb1JvZXlSd0lNSkVFbVNUT3Mz?=
 =?utf-8?B?QWZYR3M1L2MwVFNlY1JhMkpVaFN1SFJqeFRPNnBuWWpQMnpJekZuUGg2TFQ1?=
 =?utf-8?B?OVpkaEQ5aXk2c1NNdTdtdlpkVnM1c2I1MWVkaEpWL0hCUG5rREZTTkloT1hy?=
 =?utf-8?B?dCtaeDQ0a3UyWURxRkdiVjVmQjd3ZnY1RGplbWtjUTNENE16VWRaMHA0VDdu?=
 =?utf-8?B?OW1RU2w3THJtaDlrY2tha0NKeUtmTTBZeFRRUUpEQTFzLzFwY0tmVEwwUnBJ?=
 =?utf-8?B?VlRSSkNmR3V0MmI0MGcyTENSNjNMeTBnakM0dFM1VW4wTUhWeXF4d3ZoejlG?=
 =?utf-8?B?VW42dXZDakdyK0thenEwYUYzZXVEdGc1RUVJT3p6R00zbUxBTVpVTE11dnNS?=
 =?utf-8?B?ckJMMHJRZnFLWXhvZnpuTkNTUjNkYTh6d0lieGNsKytGQnVXazIwcDNXTFoz?=
 =?utf-8?B?QjdYbTV2MWNVejdxQ2dLQUg2Um0zTHhzRWlpQlFFM3pLVENCL1hGNkNPUkFI?=
 =?utf-8?B?cTROS3owd2p0QmM5Y2lsZVVvOGl1U2d0UDdTUTdpOFNYbExpaStxQmhNMzNS?=
 =?utf-8?B?enBqQ0ZoT0tEVi9YRXE1Y0Y2bFBNTUNwYnp3T3IweGpGSTUrc1R2cm8vUFB6?=
 =?utf-8?B?R0J5emt5RWUrMFkzTy9vWHp3aDAyU21Dd3E5TENyb3RtSHJwZFhhZ2tnOFgr?=
 =?utf-8?B?YjNzUjl5NlN0ZFhxUW9wV0dlZnc4blBYOEFlN1U5RHk2YjBLUmhYK0Myck5y?=
 =?utf-8?B?d296R2h5VkVTK3BXMTFBWXR5QjVvQy94RTIzaWl1VTBna1g1NVJ6di9paWo4?=
 =?utf-8?B?NVV1amgrdjd1U2tEODRHa0RMTjZVNlNYdW1GRjlaS2JnTTh1amtXRUppUHNh?=
 =?utf-8?B?ZjBKWldDZWpkT2xUZmJkSnRNQ1FOeDl0YitZZldvVGcwelM4LzN5TzlCZERV?=
 =?utf-8?B?SHU3RjJCem8wYU80RnU2bHFIL25wMU0zeFRXUEk0WUdOWGxFNGxiY2xjdm02?=
 =?utf-8?B?WFJZQkN5b3R4aWxPdE0vSktJMGVNZ3lwRWVoRjlwenBUVmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB8330.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVNIN0tPek1jMmVOR04xTW5jdHVlNlM1bmdnOUt4YnFVSFZVSExWNHg0Q20r?=
 =?utf-8?B?SUtTVS9ZVHlUMUNMVGlhQ3Z5eHgrTEY2RjVVZ0dFbTJuMjFkcmJsNllPMkVM?=
 =?utf-8?B?YjZnRzVMdWFMVTdyZDFOWU8zajNaUmdHbU45dWJNRmJ3SEx3UE9TVnEwZjZU?=
 =?utf-8?B?RytMZU5ZanFHeldTVDhpa05DTEJ3aWFIdVFZZG1jT3N6dng0ODV0OTdqaW1F?=
 =?utf-8?B?WDRhMHNSUHd3UzJGazFJbHM2MlpsTU5KZmw2MTFEL0tobndmUGVYT2V3aTEw?=
 =?utf-8?B?Q1AxYlBYRDU2VTBqUVlQYVlVR3g5TjNtWWZNOXE5Vk1XY3lYNnR2NzNjQnMy?=
 =?utf-8?B?bWhraml1M0lXQ1g2TERHRzU1MHZPUGpaQmx0ZkhrZWNuMEt4dSt5UkFJdTRU?=
 =?utf-8?B?aUUrZEpCRWF4QXd0R2VPeVdtZ0d0MmtFMmdML0c0eGxXQUJxNFpRR0pKUEJS?=
 =?utf-8?B?SHh5UjN6YXgxWmdWRUdUQVEraFpPWFFtMHlMNHFGQUxBT2pEcVRzNktBSFNS?=
 =?utf-8?B?MGhaNmd6RlZpeno5R1JkdlZpeXRQUlludTZDMzlid205K3liOVpoQ3RVU0hJ?=
 =?utf-8?B?R1ZwOHpDeWdFcm4zdHUrUUdJc1NrSTBMS2U1alp1OUhhaHh2ZlBqeUdlMERR?=
 =?utf-8?B?Vmh6c1JWQmkvL3NZM3orTVN2MjBLKzU5bG5YSjlqTWkvSUQyMDc2WjhPdDVz?=
 =?utf-8?B?MzhwaTZyV1hXR3JYbUZ5R3dYa1RoVm5ZMmVlcExONXNET0dJc1FGdmNlWml5?=
 =?utf-8?B?R2h2YTJ1L3lGYmxkeHB4dFgxRmkxUlVEM1JsVFhoYzFxNVZpUlo1UXZ1OElP?=
 =?utf-8?B?dWF6dTBkb0NjenBIRi9WN2ZQZm5YNWJvaTN4aEorU2NPU3B0WmV6WXIvb1hJ?=
 =?utf-8?B?OTVNd2RlSnVmWm1WYVBZenN2QnZJOVJpd2pWWDhscjcxRFdzSlFDRHBGUXZ1?=
 =?utf-8?B?VjFYdmNQTFhVZWMzakxoSWFGUTJ6U29FNXJ3VFB3MVQxZFVPSHplViswNGNC?=
 =?utf-8?B?MHhManFPblgvVWZsQitaa1MvMEFnSjVCZFE1NTBtSHY0bUNPeXNDcmwzZ1gv?=
 =?utf-8?B?NnpqR3BReHlrd1BrL2Y4UTR1WGV1MTJBbWpaVW14bmExWHRnTTdNWGdZNXpB?=
 =?utf-8?B?Ty9uTm1tS05XMjQ0cEo5THFPQytDRkJRQmwvRDNBNEh0QkxiUlFYcXdrNmly?=
 =?utf-8?B?eEVmaFZKSTJHbUdWUmR1c1Z6T05qUzk5WkwzNkpyRmd6enNDTkFZMDZvVTEr?=
 =?utf-8?B?R25qcThHNWVwTnh5aXhEellFV0dFWWpBbmFRU1VPU3BIaEFVNDlhZ1RTcWY2?=
 =?utf-8?B?V1owYkc3SXNWY0dzMjhzNUx4WHZ2T1VHazBLTGFJT0tGbVdsaXVXQldieVNz?=
 =?utf-8?B?UWdUTm40TS9CWTBHUWhqRDVoVmVLN2hhZ0VDMkd2TW9vSHNLMEhZUk5RUllk?=
 =?utf-8?B?ekJHMGJKYkRvRVNpbjZvZm1wOTNBU1kzd2tjejZEMXhiUHJTemhZTTUzcnFK?=
 =?utf-8?B?RmlYb1hLZitKQXpGYm9IdjlNTUFPc1lpTGZwcGZlK2xvSWdaaGFYTFR5ME8y?=
 =?utf-8?B?dFZ4bzdvcjFIVS9EdzRuUTBWejJTZWZYbW5ZdUlrNUNDTkg4S2ttNFRqN1I3?=
 =?utf-8?B?QTNqSVI4RHNuZE8rMXhzU2FoTnhMM3hrc2Zqak4yZEVKOWNUWFZJcm1yamNQ?=
 =?utf-8?B?ci8yM0xaVjFRQThmQmxCODd5MytseFl4cHJXQkZ2eXZtUnFoWDRxSTlNcXgw?=
 =?utf-8?B?ZkVqK1lMbzIySTdOK3RSV1h2R1BqNFJacGFacXB4M2NZbzI3U3BCSytDdnJi?=
 =?utf-8?B?djBNZ3plVkZDZEIwQTJmK1E0MUN6OGxaRFlidVlsdUJ0TFh3Y2Y4Zm8vdUQ4?=
 =?utf-8?B?Y2w0bFV0RFdRUmh0dDZNZ1hveWFGUWsvOFRLRUhITkx3cWhzbnE0M2s1SFU1?=
 =?utf-8?B?cmpyazZPbGJ2YndWU3g3WW1lMk9RN2xwcmxtTWdRSU44bW5YcjVPZUpKRG95?=
 =?utf-8?B?c052UmsvdllrbU5hM1Q1T3I0R0x1aGI3VjVHWjVheFh1NGMwSGRBc05RTXJY?=
 =?utf-8?B?d0lHMUo5UXh1ZUpla3M1ejF6bDhTMnYzYWVBdE11Y0h0SFdQQTVOTGZUWTVL?=
 =?utf-8?B?Tk9tYklrUm45eTRVYlVmWjJyUTJjTjNkYnl1cnVtQmYrUm5CNUxTbzV4Zjhk?=
 =?utf-8?B?dmc9PQ==?=
Content-ID: <445D00FC33087E4CA3836610F4122933@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB8330.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb369ff1-f500-4e98-eed7-08dd54327561
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2025 17:49:45.0586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kEvH882ag2dewua7rGQ3mggOfvN9JTHjbTo6dMVP1Pr9d4//pBGpwCceQdDfrYCQKkw+2pXcto8GC+rO1DxAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8092
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1545524411.538563338"
X-Mailman-Approved-At: Mon, 24 Feb 2025 14:05:04 +0000
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

--__=_Part_Boundary_004_1545524411.538563338
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDE3OjU0ICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFR1ZSwgRmViIDExLCAyMDI1IGF0IDEwOjUyOjUwQU0gKzA4MDAsIFN1bm55IFNoZW4gd3Jv
dGU6DQo+ID4gQWRkIE1EUC1SU1ogaGFyZHdhcmUgZGVzY3JpcHRpb24gZm9yIE1lZGlhVGVrIE1U
ODE5NiBTb0MNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdW5ueSBTaGVuIDxzdW5ueS5zaGVu
QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLG1kcC1yc3oueWFtbMKgwqDCoCB8IDQ2DQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykNCj4gPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLG1kcC0NCj4gPiByc3oueWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLG1kcC0NCj4gPiByc3oueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLQ0KPiA+IHJzei55YW1sDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjY2NDJiOWFh
NjUxYQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gPiByc3ou
eWFtbA0KPiA+IEBAIC0wLDAgKzEsNDYgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICst
LS0NCj4gPiArJGlkOg0KPiA+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJzei55YW1sIw0KPiANCj4gRmlsZW5hbWUgbWF0Y2hpbmcg
Y29tcGF0aWJsZSBwbGVhc2UNCg0KR290IGl0DQp3aWxsIG1vZGlmeSB0aGUgY29tcGF0aWJsZSB0
byAibWVkaWF0ZWssbXQ4MTk2LW1kcC1yc3oiDQoNCj4gDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6
IE1lZGlhVGVrIGRpc3BsYXkgbXVsdGltZWRpYSBkYXRhIHBhdGggcmVzaXplcg0KPiA+ICsNCj4g
PiArbWFpbnRhaW5lcnM6DQo+ID4gK8KgIC0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtl
cm5lbC5vcmc+DQo+ID4gK8KgIC0gUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gK8KgIE1lZGlhVGVrIGRpc3BsYXkg
bXVsdGltZWRpYSBkYXRhIHBhdGggcmVzaXplciwgbmFtZWx5IE1EUC1SU1osDQo+ID4gK8KgIGNh
biBkbyBzY2FsaW5nIHVwL2Rvd24gdG8gdGhlIHBpY3R1cmUuDQo+ID4gKw0KPiA+ICtwcm9wZXJ0
aWVzOg0KPiA+ICvCoCBjb21wYXRpYmxlOg0KPiA+ICvCoMKgwqAgY29uc3Q6IG1lZGlhdGVrLG10
ODE5Ni1kaXNwLW1kcC1yc3oNCj4gPiArDQo+ID4gK8KgIHJlZzoNCj4gPiArwqDCoMKgIG1heEl0
ZW1zOiAxDQo+ID4gKw0KPiA+ICvCoCBjbG9ja3M6DQo+ID4gK8KgwqDCoCBpdGVtczoNCj4gPiAr
wqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBNRFAtUlNaIENsb2NrDQo+IA0KPiBUaGlzIGNhbiBq
dXN0IGJlICJtYXhJdGVtczogMSINCg0KT0ssIHdpbGwgbW9kaWZ5IHRoaXMNCg0KPiANCj4gPiAr
DQo+ID4gK3JlcXVpcmVkOg0KPiA+ICvCoCAtIGNvbXBhdGlibGUNCj4gPiArwqAgLSByZWcNCj4g
PiArwqAgLSBjbG9ja3MNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0K
PiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gK8KgIC0gfA0KPiA+ICvCoMKgwqAgc29jIHsNCj4g
PiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gK8KgwqDCoMKgwqDC
oMKgICNzaXplLWNlbGxzID0gPDI+Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgZGlzcF9t
ZHBfcnN6MDogZGlzcC1tZHAtcnN6MEAzMjFhMDAwMCB7DQo+IA0KPiBBbmQgImRpc3AtbWRwLXJz
ejAiIGlzbid0IGFueXRoaW5nIGNsb3NlIHRvIGEgZ2VuZXJpYyBub2RlIG5hbWUuDQoNCldpbGwg
bW9kaWZ5ICJkaXNwLW1kcC1yc3owQDMyMWEwMDAwIiB0byAibWRwLXJzekAzMjFhMDAwMCINCg0K
PiANCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5Ni1kaXNwLW1kcC1yc3oiOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDww
IDB4MzIxYTAwMDAgMCAweDEwMDA+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2Nr
cyA9IDwmZGlzcHN5c19jb25maWdfY2xrIDEwMT47DQo+IA0KPiBTdXJwcmlzZWQgdGhlcmUgYXJl
IHNvIGZldyBwcm9wZXJ0aWVzLCBubyBwb3J0cyBsaW5rIG9yIGFueXRoaW5nIGxpa2UNCj4gdGhh
dD8NCg0KQmVjYXVzZSB0aGUgbXQ4MTk2J3MgcGF0aCBtdXggZGVzaWduLCB3ZSB1c2UgbWRwLXJz
eiBhcyBhIGJ5cGFzcyBtb2RlDQpody4NClNvIG9ubHkgc2V0IHRoZSBiYXNpYyBwcm9wZXJ0aWVz
Lg0KDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoCB9Ow0KPiA+ICvCoMKgwqAgfTsNCj4gPiAtLSAN
Cj4gPiAyLjM0LjENCj4gPiANCg0K

--__=_Part_Boundary_004_1545524411.538563338
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxNzo1NCYjMzI7KzAwMDAsJiMzMjtDb25vciYjMzI7RG9vbGV5JiMzMjt3cm90ZToNCiZn
dDsmIzMyO09uJiMzMjtUdWUsJiMzMjtGZWImIzMyOzExLCYjMzI7MjAyNSYjMzI7YXQmIzMyOzEw
OjUyOjUwQU0mIzMyOyswODAwLCYjMzI7U3VubnkmIzMyO1NoZW4mIzMyO3dyb3RlOg0KJmd0OyYj
MzI7Jmd0OyYjMzI7QWRkJiMzMjtNRFAtUlNaJiMzMjtoYXJkd2FyZSYjMzI7ZGVzY3JpcHRpb24m
IzMyO2ZvciYjMzI7TWVkaWFUZWsmIzMyO01UODE5NiYjMzI7U29DDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTdW5ueSYjMzI7U2hlbiYj
MzI7Jmx0O3N1bm55LnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0t
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZHAtcnN6LnlhbWwmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3wmIzMyOzQ2DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrKysrKysrKysrKysrKysrKysrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsxJiMzMjtm
aWxlJiMzMjtjaGFuZ2VkLCYjMzI7NDYmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOyZndDsm
IzMyOyYjMTYwO2NyZWF0ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxtZHAtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0OyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdA0KJmd0OyYjMzI7Jmd0OyYjMzI7YS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZHAtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZHAtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0OyYjMzI7bmV3JiMz
MjtmaWxlJiMzMjttb2RlJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjsw
MDAwMDAwMDAwMDAuLjY2NDJiOWFhNjUxYQ0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjsvZGV2
L251bGwNCiZndDsmIzMyOyZndDsmIzMyOysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAt
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyc3oueWFtbA0KJmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0w
LDAmIzMyOysxLDQ2JiMzMjtAQA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyMmIzMyO1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiYjMzI7KEdQTC0yLjAtb25seSYjMzI7T1ImIzMyO0JTRC0yLUNsYXVzZSkN
CiZndDsmIzMyOyZndDsmIzMyOyslWUFNTCYjMzI7MS4yDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrLS0t
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzNjtpZDoNCiZndDsmIzMyOyZndDsmIzMyO2h0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJzei55
YW1sIw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaWxlbmFtZSYjMzI7bWF0Y2hpbmcmIzMyO2NvbXBh
dGlibGUmIzMyO3BsZWFzZQ0KDQpHb3QmIzMyO2l0DQp3aWxsJiMzMjttb2RpZnkmIzMyO3RoZSYj
MzI7Y29tcGF0aWJsZSYjMzI7dG8mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5Ni1tZHAtcnN6JnF1
b3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzY7c2NoZW1hOiYjMzI7aHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrdGl0bGU6JiMzMjtNZWRpYVRlayYjMzI7ZGlzcGxh
eSYjMzI7bXVsdGltZWRpYSYjMzI7ZGF0YSYjMzI7cGF0aCYjMzI7cmVzaXplcg0KJmd0OyYjMzI7
Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K21haW50YWluZXJzOg0KJmd0OyYjMzI7Jmd0
OyYjMzI7KyYjMTYwOyYjMzI7LSYjMzI7Q2h1bi1LdWFuZyYjMzI7SHUmIzMyOyZsdDtjaHVua3Vh
bmcuaHVAa2VybmVsLm9yZyZndDsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzMyOy0mIzMy
O1BoaWxpcHAmIzMyO1phYmVsJiMzMjsmbHQ7cC56YWJlbEBwZW5ndXRyb25peC5kZSZndDsNCiZn
dDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOytkZXNjcmlwdGlvbjomIzMyO3wN
CiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzMyO01lZGlhVGVrJiMzMjtkaXNwbGF5JiMzMjtt
dWx0aW1lZGlhJiMzMjtkYXRhJiMzMjtwYXRoJiMzMjtyZXNpemVyLCYjMzI7bmFtZWx5JiMzMjtN
RFAtUlNaLA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMzI7Y2FuJiMzMjtkbyYjMzI7c2Nh
bGluZyYjMzI7dXAvZG93biYjMzI7dG8mIzMyO3RoZSYjMzI7cGljdHVyZS4NCiZndDsmIzMyOyZn
dDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOytwcm9wZXJ0aWVzOg0KJmd0OyYjMzI7Jmd0OyYj
MzI7KyYjMTYwOyYjMzI7Y29tcGF0aWJsZToNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2
MDsmIzE2MDsmIzMyO2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4MTk2LWRpc3AtbWRwLXJzeg0KJmd0
OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMzI7cmVnOg0KJmd0
OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7bWF4SXRlbXM6JiMzMjsxDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMzMjtjbG9ja3M6
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtpdGVtczoNCiZndDsm
IzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOy0mIzMyO2Rl
c2NyaXB0aW9uOiYjMzI7TURQLVJTWiYjMzI7Q2xvY2sNCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhp
cyYjMzI7Y2FuJiMzMjtqdXN0JiMzMjtiZSYjMzI7JnF1b3Q7bWF4SXRlbXM6JiMzMjsxJnF1b3Q7
DQoNCk9LLCYjMzI7d2lsbCYjMzI7bW9kaWZ5JiMzMjt0aGlzDQoNCiZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3JlcXVpcmVkOg0KJmd0OyYjMzI7Jmd0
OyYjMzI7KyYjMTYwOyYjMzI7LSYjMzI7Y29tcGF0aWJsZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYj
MTYwOyYjMzI7LSYjMzI7cmVnDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMzMjstJiMzMjtj
bG9ja3MNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOythZGRpdGlvbmFs
UHJvcGVydGllczomIzMyO2ZhbHNlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrZXhhbXBsZXM6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMzMjstJiMzMjt8DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtzb2MmIzMyO3sNCiZndDsm
IzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzMyOyNhZGRyZXNzLWNlbGxzJiMzMjs9JiMzMjsmbHQ7MiZndDs7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjsjc2l6ZS1j
ZWxscyYjMzI7PSYjMzI7Jmx0OzImZ3Q7Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7
Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7
ZGlzcF9tZHBfcnN6MDomIzMyO2Rpc3AtbWRwLXJzejBAMzIxYTAwMDAmIzMyO3sNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7QW5kJiMzMjsmcXVvdDtkaXNwLW1kcC1yc3owJnF1b3Q7JiMzMjtpc24mIzM5
O3QmIzMyO2FueXRoaW5nJiMzMjtjbG9zZSYjMzI7dG8mIzMyO2EmIzMyO2dlbmVyaWMmIzMyO25v
ZGUmIzMyO25hbWUuDQoNCldpbGwmIzMyO21vZGlmeSYjMzI7JnF1b3Q7ZGlzcC1tZHAtcnN6MEAz
MjFhMDAwMCZxdW90OyYjMzI7dG8mIzMyOyZxdW90O21kcC1yc3pAMzIxYTAwMDAmcXVvdDsNCg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtjb21wYXRpYmxlJiMz
Mjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTYtZGlzcC1tZHAtcnN6JnF1b3Q7Ow0KJmd0OyYj
MzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7cmVnJiMzMjs9JiMzMjsmbHQ7MCYjMzI7MHgzMjFh
MDAwMCYjMzI7MCYjMzI7MHgxMDAwJmd0OzsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzMyO2Nsb2NrcyYjMzI7PSYjMzI7Jmx0OyZhbXA7ZGlzcHN5c19jb25maWdfY2xrJiMzMjsxMDEm
Z3Q7Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTdXJwcmlzZWQmIzMyO3RoZXJlJiMzMjthcmUmIzMy
O3NvJiMzMjtmZXcmIzMyO3Byb3BlcnRpZXMsJiMzMjtubyYjMzI7cG9ydHMmIzMyO2xpbmsmIzMy
O29yJiMzMjthbnl0aGluZyYjMzI7bGlrZQ0KJmd0OyYjMzI7dGhhdCYjNjM7DQoNCkJlY2F1c2Um
IzMyO3RoZSYjMzI7bXQ4MTk2JiMzOTtzJiMzMjtwYXRoJiMzMjttdXgmIzMyO2Rlc2lnbiwmIzMy
O3dlJiMzMjt1c2UmIzMyO21kcC1yc3omIzMyO2FzJiMzMjthJiMzMjtieXBhc3MmIzMyO21vZGUN
Cmh3Lg0KU28mIzMyO29ubHkmIzMyO3NldCYjMzI7dGhlJiMzMjtiYXNpYyYjMzI7cHJvcGVydGll
cy4NCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjt9Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYj
MTYwOyYjMTYwOyYjMzI7fTsNCiZndDsmIzMyOyZndDsmIzMyOy0tJiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyOzIuMzQuMQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5
PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFU
RUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
YXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2Vk
LCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBs
YXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0
ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwg
cHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
aXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
DQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFu
ZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMp
IGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRo
aXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_1545524411.538563338--

