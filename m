Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B732A504B6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCB989580;
	Wed,  5 Mar 2025 16:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ugGLUEv9";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="feZCTUfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A9989580
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:27:04 +0000 (UTC)
X-UUID: a994a2f0f9de11efaae1fd9735fae912-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YFANHtm3z8vYwcrnlzH/RgYJfOTZijgkS4h8xnvaV9k=; 
 b=ugGLUEv9sezoDPiNW+q2jqHzXguiWB7Uq8SLY2fzQc2nuERmchjvmAzLRbMZqFELxxytAdBGfZh5A2urglQQpL1nL09LTp+EL4vfSKBpu5UGPfaM5eAEnUSv8ejT1t9Y2JDhVuLyjF/O0bY1GHZx0OKkNtsIHIZQGzgslBRIwAY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:bf2e89bd-2254-4fa8-a130-f00800e8a2f9, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:93430fce-23b9-4c94-add0-e827a7999e28,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a994a2f0f9de11efaae1fd9735fae912-20250306
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1295688247; Thu, 06 Mar 2025 00:26:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 00:26:59 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 00:26:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwzDbdCgKYcoMgmqqPbfgvNIHN6z8/+1dLkBTujYJLWfTcYv4LhD+0TjKE+XMo/+xdXIvT77ygZNl0I4xgyKea1Nn45PCh9l2XkDpssUE4svxcAFeOehWJy7qu3KkZgGtcHg4Zl3A7Hv8IOdWtBJivSPxraR5HU0G1UiofuY/5Y61fPMe9pIKJVFICQEUS+FQnEYsoVZ5QxIHTRabSm1gskWfPw5LB3pmfOr1ZcDmu2qUBBcrvdQgWvdfLbj15vXeuLew42ItUeddyJZsai5IZK8WqoVtpyv9Tj/ZR69LpvPYOgBFbBW3oOLQUrEho132zqLkmnmw8HapnBBLDyx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ6ZgNkyf8Fz4Uxswl0NWuZOyjKzbR142JHEUCMMsDg=;
 b=qRPyyd+mqkb9uSgaGPCt9/7dzZQfYRsZp+OdT4jEBRq0H4Aq4wRb7gAENeiT7XkfKtKQdr8MPl+bN8lMP2ifbnmvySotHBJo3lEbBny1VE4aNGu4zJ2IuJWqElOt/uCJNsja9YI1t+9/mS//mc3A3RJFfH4P9hm55ZVroa8QfuKOCp0F/A6LpY+V5HDNjccRJ6MfbwC7KLM3ZhtVyR78uzafF1GCuUfRT6LHMASYuYlwZNS1RsYranKCVjtjsHDaTWhXICnazF09ERitWeaIYNqvpqeWjRowyve6cbPyz4SpJlfJ+GdAbOB152bobgt+oOVidxRsvU3nQuu6I+AnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ6ZgNkyf8Fz4Uxswl0NWuZOyjKzbR142JHEUCMMsDg=;
 b=feZCTUfBEjmOXTYftp4IbIqpMKyloHy5S+JNmil0Xtu9GwIWiVbXixtkeeBU0I6/eHDp9sFV3eqb/gK+Rx5YgqI6xd493xHLqECO+7DESxoyvpZRRpkKM4Iau3XILCtjt/O/RdjYu1DnPMPeuqxbLOJ7FXL5PfDTcPPbxs5hBUw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7972.apcprd03.prod.outlook.com (2603:1096:820:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 16:26:55 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 16:26:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
 <treapking@chromium.org>
Subject: Re: [PATCH v4 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset
 compatibility for DRAM address
Thread-Topic: [PATCH v4 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset
 compatibility for DRAM address
Thread-Index: AQHbgcg4qSKnRJgQykSVLFqFZDeyS7NiznuAgAIExAA=
Date: Wed, 5 Mar 2025 16:26:55 +0000
Message-ID: <524d152b9e9261981b0ee3aa2ff43376a26be294.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-6-jason-jh.lin@mediatek.com>
 <c1395546-9cfe-4da9-b87a-e5cc392910f6@collabora.com>
In-Reply-To: <c1395546-9cfe-4da9-b87a-e5cc392910f6@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7972:EE_
x-ms-office365-filtering-correlation-id: 806a17e0-9cd9-4702-8ede-08dd5c028b48
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VW5KRTRHTzJ3TFY2dC80WVdQa1JqRm9RSDhWUWFsT1BzRXNaajNjUDFRVmRq?=
 =?utf-8?B?MWVFeGJhUGZicFprWlBoVzVSMzVVWlhsRnkwcXY2L3RmTDFHWktIN0wwU2Nx?=
 =?utf-8?B?cVAvM0R4S1ZacGk2Skw0bXYyY3NRUm94SVEvWUh5TFZIVWRBN1VEb1Y0dGJ6?=
 =?utf-8?B?V2g0UjB5cmRheXVVQTFPUFRwSlBpb1RNaFJsVjFoMDBJUEVOUE5STlZ1amJ0?=
 =?utf-8?B?bW1GajhFaXhIVG96WnFKbVgwUHhtcWtLMzJtQ2w2dFRJQXBxcmI2RmMwZE1J?=
 =?utf-8?B?L3NRYUtVbVBQVms4aHRTM0tRQXJWek9JN1ErR2g3bFcyUW5YME5SQXRKQlVS?=
 =?utf-8?B?SjFYNVZlR0llRlFRKzU2ZDlQZjlMMW54YlJZU0U0WXZ3MWtjNlYzUkRoYmpW?=
 =?utf-8?B?eU1sVGpKSHJsOXZidks3WldnWjhmNU9tQ1RUTTBMQlFxaG5RanJBR2pGcGQ3?=
 =?utf-8?B?bDFnVlRpcEhzYW93MThCb2Qvem95SFowbmlwVDJ5OVBLVE0veG9ORGYrcVNk?=
 =?utf-8?B?TXVPd2lEbUIrZ0lOL094U3hVUUZWc1JQM01vZDBTM0dXQ1ZWSGxzbWl3Wmpi?=
 =?utf-8?B?RmFYdjllNUIvV1JGc3NXa21PbVBjWmxBMk9GNll2aUZHU3ZrTXE0S2ZFM0ZJ?=
 =?utf-8?B?QnVKWXBSUmVNeTdGbVp1MzJaMWJVNzF6bXJjajNkL0lLa1VJN0lMaFMxRm92?=
 =?utf-8?B?WUNQaXowWmY5ME94cjAzczZPSE9ENkU4TUF0eWJPOGIyVWUwM0dvWklGZkFq?=
 =?utf-8?B?ZmpaWVFOTjhQbVV3dnJYaFhTaTdmcDR6SEtETDhmTU9wQ1YvOVEyQm14Y3RE?=
 =?utf-8?B?V0FubEdHczBKQ1dXZ1drWmxPSzBJeDQ1MTRJY0JkZ3F5NjlIQVhLUDdCSWRy?=
 =?utf-8?B?NnR4c2RZbTlIblpBL0ZJUU1PKzFDc3ZYanNtbGtKdm5rc1VVZU1ESk1SQk0r?=
 =?utf-8?B?UVZhT25JTC9GVEZOK3NkMTBJYlRoYjczNEpmRFZtSkl0eXI2YmExbjcvSGhm?=
 =?utf-8?B?TmlycHhSNlRVcHkzb0VlZlZPSWdOY2lCUWdONUNWald0dmdKSzNvcDh0SWFu?=
 =?utf-8?B?VW1BV2I2REplMll6ek1TVGtpc0tES0ZsVG9nUks0OHM3Y2UybFpnb1diY0Zo?=
 =?utf-8?B?aUVKaWhHOXR6eldDYnhjTUFNVEVtd1VGY2ZTMi9FKzY3enRFbndsL2RFNDd3?=
 =?utf-8?B?dXpMYlc1eWNENkMzOFp3MEdOdmZYRjVvcVF3cEI2WXExbXNvc0Q1S0c3Wkdn?=
 =?utf-8?B?YzJwZEFpSG0rTjJjeTBkOGFMVWdSMG1jYzlJWjVPS2h4WUczdkMwUjZ1NEt2?=
 =?utf-8?B?NTBISGZGdFdOYVJ2TElIcGtkNnh1cWJITXFUall6aTJpbDI3SXZvR0lDZWc2?=
 =?utf-8?B?VVJEMXdaRGFKVm9pbTNHdmF6T09WWndMZTE1d2w3WlVuRldDNWxWSFBrY2VR?=
 =?utf-8?B?K2tia0hFaDRiOXJDby8rcWVNVFh4dnUrYXgvUW01UklOTUR0LzMyWDlwN2NL?=
 =?utf-8?B?OG11U2R1clBYNXpWV1NVNEZjelN2UnVpRE50OFZRMWt4NEdva1ZOZUhrMUFO?=
 =?utf-8?B?QnF3Vk1tSGtYbE14dnlCTG5vTUY1V3FRbFltYmlmSE8ySUdBZmFQS2RBQTBB?=
 =?utf-8?B?MGlzZGMxaFgwNTNsYnovMXRYM0FhdHhKSVpUYndOM0ZLNG9tY0ZoUzlOaldD?=
 =?utf-8?B?K0dEZWo5b01HOUZITHZiTml1T3psbjhNOWdrNHc5YjBWNUVVMitDOE9wcTdl?=
 =?utf-8?B?akdsanZ6ZTl5SEZDTkc5WkVrY2htOUtMT0M0cXJnYzdjRmNYRC90T0pKZit4?=
 =?utf-8?B?dDY1TXUwOU1VZHcrWHhheWtUTTV4dGZmK2V0T1o1WWtvSGFHUXh4MENseUpM?=
 =?utf-8?B?cm1HMTcwOWwwMEFxdTg3YmtvdURzN0R6ZVRDQTVuYmgrcDhZbjhUVEZQd3N2?=
 =?utf-8?Q?fq2RE3jzjryN8SSHtRJwZIfs8r9CCwY0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WG0yNCtzM052YzdxdkJJVDdMY2ZzbVBZblZHSExMY0MvSHZ0MzRUamo4MXB5?=
 =?utf-8?B?NzY3Uy9Ndnp4VXpuY0RNQm9pQTdFMGh4MTlIUEpXLzduemhwVnppbUd4YUdC?=
 =?utf-8?B?M2FtWFlzUXlXZ1hkNFgyakZlcXdOTm5nWlh2WFROSCs3U1lIYU53enVXNTJD?=
 =?utf-8?B?dXBZVGZCQ3hMWG5UMXMrQkJBbnY5QmNKaTRsZ2RNNjExbHRMSTBWUzFLODly?=
 =?utf-8?B?NXgxQmVwVG5yU0Z4WVJ6b0tFYjN5cmxyVVlzSGhpL3dNaGdZTEo5RVFHT2k4?=
 =?utf-8?B?UVBvL2NaWnJ6VzVOR3hDUW9aYjI4KzJrRTNhTkloWXJEd2J2ZHJVWW5MQzJ6?=
 =?utf-8?B?L2N2T3EwOVh4NXh4aG9IcGdwMmxyL0NlQlowSUpXN1FHSlpjZzc0elBQSHFj?=
 =?utf-8?B?aUh6UVQ5ZU83cGs0Sk5Gb1NJb002K3NFY0tKajlhVGM2eHYyRURRdWFSek1p?=
 =?utf-8?B?T0Vha2ZDVWEwT1ZPUS9TMm9XVWx1VkxrVjFNTExnOTUvWGpRZlNqSXlYT2tT?=
 =?utf-8?B?Y0U5MDdLTUdQMUpxQTh1S3NnV1A2R2l5ZzJqR0c5cVZLSWU0eFA3QnpNWG5R?=
 =?utf-8?B?eU9aQWZZcVBiUDVwcUtWZDgzZ1dQdzNKeWVTRHI3blFCd2xjYy9ZV2JyVnNX?=
 =?utf-8?B?bjcxTW9STDZWeC9PVWJ5Yk1NYUdlWjFzN3gzQ0ZqYTVCbmpTNzd6a0E0RmRt?=
 =?utf-8?B?aFlhNzRkeEFpRFg2SVlvL09mV0dzcU1LTENBSnZrYTFOR0RwL0IvN0RTd0tS?=
 =?utf-8?B?bGtqV1M3MTBLUmZjVVk2SDZPRzQwQ3lJU2Zad016Vy9SWDhuYWo4VnA2VUlz?=
 =?utf-8?B?T1Fsc2cxTnRPN0hFV2pxQkplVUNsWEIvSzgzNkhlVmVGNTE2TDlybmVJOTVJ?=
 =?utf-8?B?L0gzbUtBWVYrOVMzWlV2UzExV2l2ZFpGU2NHcng1ZzlLcFdwMk5nbWxRZ1BJ?=
 =?utf-8?B?bDZnVmRHWmpCRG8yOFpJUmNBcTNvZjlGNjdWVDc3UXVzdkowL3NEWElCZnor?=
 =?utf-8?B?RXlzRWthK010bGNvc0ZvMTFjdzhhdzNWbkZKaGtKakkyRWhiYmZWeWZ1c1dr?=
 =?utf-8?B?bmhURGNidVVGY0JabDJLS0JiVmtMQlFvSjUrSElrQTI3Ylc3djFOTEZYd3Zx?=
 =?utf-8?B?bW5RWlpMTFMzditXTGQ1VUgzY0Q1bjZkWEhlWnBlMGdCa09OV200QlNGaCti?=
 =?utf-8?B?WkYrNmtlWGoxSzBackVESnp2aXRIOHd0S2ZwSGo3SVlzT2I3bVR5Y2t6TFYv?=
 =?utf-8?B?Zk9BZytqQ1JzbzZWYldCN1YxcGl1bXdONzZMNWNSS01sTmZFNTBPQjRaVjVt?=
 =?utf-8?B?WVo1eE0wUVpoR3FjVG9UbGMyRHdwbTRUWXo1K2pGL3NiditpL2x1VEZkZDg0?=
 =?utf-8?B?T0lqS29hbE1ubkRteXBBM2lFVVhGK1lhbmNWN0U5K1VRZDJWTXZwbGRPNmhp?=
 =?utf-8?B?T2lZYzVTL2YzTU9WK253Vk5HRFNXcCtCYUNISmlJVkhWN3lWWGd3M1ZkcEFC?=
 =?utf-8?B?b1FoMnhBaVMyUllHbGsxaVR4UjU0NFgvcWNzS0hLWkxoNW95ZCtUOXphNmZK?=
 =?utf-8?B?QU5LL0czOGZndG01bVVhSlJIeTJVT04rNzVMRFVxa3A1alZnY2dORTNWSXdV?=
 =?utf-8?B?VDZjY3dnS0p0UHdzWkVpVWRrUlFqVW9JelVnbmJCNDhYdHNTM0xCa0RjWW12?=
 =?utf-8?B?TGpoT2lDb1kvQ2FYWUlESDQ4aXVDRWt1YTkzTGU4aWFOOXRzK05lU3RkT0tr?=
 =?utf-8?B?MzAyak1qTkJNbzFMSllEUDZpMzB1VlJPbWc4MGgvQTN2YzIrREVZeno4OVF5?=
 =?utf-8?B?dXV6OGUvMk00VnRtdmNGNDBPZ04zTGQrVmJGRmE0dDdlTTBiSGlpUGVBU3RZ?=
 =?utf-8?B?Vk5LMnAxSnMvcDJFTGp2ZzYzcjFxWTdZOEFDTUdhcGhxek9RWkxmS3B1bnpa?=
 =?utf-8?B?T0hVbEJaOTNxejgrQktxZTBTZHZzZmIveWNGSWZpY1YzYSswZ1NDcVpkZ1Nx?=
 =?utf-8?B?MTMvSjY1UFlvTGdsU0N5MFhnbmZRUTJGRlhybzhveFpKc3RCbis0WUNZQms5?=
 =?utf-8?B?c2NJWWYyZUgzVjJRVWFZaEdZVndtLzdVZ3pQNEJBZjdNbWhrSHZOTTBFWG1a?=
 =?utf-8?B?K1RKZ1gxb0pGVEY0WEoyYms5UUNCMTM0NDFLdkZERVNMcUJjaUpweDBDTFBQ?=
 =?utf-8?B?dkE9PQ==?=
Content-ID: <9B5911E7B3E34947A68996418DA59C5A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806a17e0-9cd9-4702-8ede-08dd5c028b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 16:26:55.2692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAooIvjqZMZzSXe5mcJxn5/gF4R7HilzU35uI7tsW0ZMSyHKg5T1KDAaAJx9NwAHLh1V3pvfJAXmhnSVtxJsLmNgTwWXAv7nNIONe2+u4bI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7972
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1904667968.402392708"
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

--__=_Part_Boundary_004_1904667968.402392708
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAzLTA0IGF0IDEwOjM3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTgvMDIvMjUgMDY6NDEsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFNpbmNlIEdDRSBoYXMgYmVlbiBtb3ZlZCB0byBtbWlu
ZnJhIGluIE1UODE5NiwgYWxsIHRyYW5zYWN0aW9ucw0KPiA+IGZyb20NCj4gPiBtbWluZnJhIHRv
IERSQU0gd2lsbCBoYXZlIHRoZWlyIGFkZHJlc3NlcyBhZGp1c3RlZCBieSBzdWJ0cmFjdGluZyBh
DQo+ID4gbW1pbmZyYSBvZmZzZXQuDQo+ID4gVGhpcyBpbmZvcm1hdGlvbiBzaG91bGQgYmUgaGFu
ZGxlZCBpbnNpZGUgdGhlIENNRFEgZHJpdmVyLCBhbGxvd2luZw0KPiA+IENNRFEgdXNlcnMgdG8g
Y2FsbCBDTURRIEFQSXMgYXMgdXN1YWwuDQo+ID4gDQo+ID4gVGhlcmVmb3JlLCBDTURRIGRyaXZl
ciBuZWVkcyB0byB1c2UgdGhlIG1ib3ggQVBJIHRvIGdldCB0aGUNCj4gPiBtbWluZnJhX29mZnNl
dCB2YWx1ZSBvZiB0aGUgU29DLCBhbmQgdGhlbiBhZGQgaXQgdG8gdGhlIERSQU0NCj4gPiBhZGRy
ZXNzDQo+ID4gd2hlbiBnZW5lcmF0aW5nIGluc3RydWN0aW9ucyB0byBlbnN1cmUgR0NFIGFjY2Vz
c2VzIHRoZSBjb3JyZWN0DQo+ID4gRFJBTQ0KPiA+IGFkZHJlc3MuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+IMKgIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgMzUNCj4g
PiArKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KPiA+IGIvZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gPiBpbmRleCBhYTk4NTMxMDBkNzguLmYyODUzYTc0
YWYwMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQo+
ID4gQEAgLTMxNCwxMCArMzE0LDIyIEBAIEVYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfc19t
YXNrX3ZhbHVlKTsNCj4gPiANCj4gPiDCoCBpbnQgY21kcV9wa3RfbWVtX21vdmUoc3RydWN0IGNt
ZHFfcGt0ICpwa3QsIGRtYV9hZGRyX3Qgc3JjX2FkZHIsDQo+ID4gZG1hX2FkZHJfdCBkc3RfYWRk
cikNCj4gPiDCoCB7DQo+ID4gK8KgwqDCoMKgIHN0cnVjdCBjbWRxX2NsaWVudCAqY2wgPSAoc3Ry
dWN0IGNtZHFfY2xpZW50ICopcGt0LT5jbDsNCj4gPiDCoMKgwqDCoMKgIGNvbnN0IHUxNiBoaWdo
X2FkZHJfcmVnX2lkeMKgID0gQ01EUV9USFJfU1BSX0lEWDA7DQo+ID4gwqDCoMKgwqDCoCBjb25z
dCB1MTYgdmFsdWVfcmVnX2lkeCA9IENNRFFfVEhSX1NQUl9JRFgxOw0KPiA+IMKgwqDCoMKgwqAg
aW50IHJldDsNCj4gPiANCj4gPiArwqDCoMKgwqAgaWYgKCFjbCkgew0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJfZXJyKCIlcyAlZDogcGt0LT5jbCBpcyBOVUxMIVxuIiwgX19mdW5j
X18sDQo+ID4gX19MSU5FX18pOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7DQo+ID4gK8KgwqDCoMKgIH0NCj4gPiArDQo+ID4gK8KgwqDCoMKgIGlmIChjbWRx
X2FkZHJfbmVlZF9vZmZzZXQoY2wtPmNoYW4sIHNyY19hZGRyKSkNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNyY19hZGRyICs9IGNtZHFfZ2V0X29mZnNldF9wYShjbC0+Y2hhbik7DQo+
IA0KPiBJZiB0aGUgb2Zmc2V0IGlzIGp1c3QgRFJBTSBJT1NUQVJULCB5b3UgY291bGQgbWFuYWdl
IHRoYXQgZGlmZmVyZW50bHkNCj4gaW4gdGhlIGNtZHENCj4gaGVscGVyIGFzIHdlbGwgYXMgdGhl
IGNtZHEgbWFpbGJveC4uLiA6LSkNCj4gDQoNClRoZSBvZmZzZXRfcGEgaXMgbm90IERSQU0gSU9T
VEFSVCwgaXQgaXMgdGhlIE1NSU5GUkEgc3VidHJhY3RpbmcNCm9mZnNldC4NCg0KQ01EUSBoZWxw
ZXIgaXMgdXNlZCB0byBnZW5lcmF0ZSB0aGUgaW5zdHJ1Y3Rpb24gdG8gdGhlIGNvbW1hbmQgYnVm
ZmVyLg0KU2luY2UgdGhpcyBvZmZzZXRfcGEgaXMgYWRkZWQgZm9yIHRoZSBQQSBwdXQgaW50byB0
aGUgaW5zdHJ1Y3Rpb24sIEkNCnRoaW5rIGFkZGluZyB0aGUgb2Zmc2V0X3BhIGhlcmUgaXMgbW9y
ZSBzdWl0YWJsZSB0aGFuIENNRFEgbWFpbGJveC4NCkRvZXMgdGhhdCBtYWtlIHNlbnNlPyA6LSkN
Cg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+ID4gKw0KPiA+ICvCoMKgwqDCoCBpZiAoY21k
cV9hZGRyX25lZWRfb2Zmc2V0KGNsLT5jaGFuLCBkc3RfYWRkcikpDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkc3RfYWRkciArPSBjbWRxX2dldF9vZmZzZXRfcGEoY2wtPmNoYW4pOw0K
PiA+ICsNCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCg0K

--__=_Part_Boundary_004_1904667968.402392708
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDMtMDQmIzMyO2F0
JiMzMjsxMDozNyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMz
Mjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3Im
IzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZl
JiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRl
bnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SWwmIzMyOzE4LzAyLzI1JiMzMjsw
Njo0MSwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7U2luY2UmIzMyO0dDRSYjMzI7aGFzJiMzMjtiZWVuJiMzMjttb3ZlZCYjMzI7dG8m
IzMyO21taW5mcmEmIzMyO2luJiMzMjtNVDgxOTYsJiMzMjthbGwmIzMyO3RyYW5zYWN0aW9ucw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7ZnJvbQ0KJmd0OyYjMzI7Jmd0OyYjMzI7bW1pbmZyYSYjMzI7dG8m
IzMyO0RSQU0mIzMyO3dpbGwmIzMyO2hhdmUmIzMyO3RoZWlyJiMzMjthZGRyZXNzZXMmIzMyO2Fk
anVzdGVkJiMzMjtieSYjMzI7c3VidHJhY3RpbmcmIzMyO2ENCiZndDsmIzMyOyZndDsmIzMyO21t
aW5mcmEmIzMyO29mZnNldC4NCiZndDsmIzMyOyZndDsmIzMyO1RoaXMmIzMyO2luZm9ybWF0aW9u
JiMzMjtzaG91bGQmIzMyO2JlJiMzMjtoYW5kbGVkJiMzMjtpbnNpZGUmIzMyO3RoZSYjMzI7Q01E
USYjMzI7ZHJpdmVyLCYjMzI7YWxsb3dpbmcNCiZndDsmIzMyOyZndDsmIzMyO0NNRFEmIzMyO3Vz
ZXJzJiMzMjt0byYjMzI7Y2FsbCYjMzI7Q01EUSYjMzI7QVBJcyYjMzI7YXMmIzMyO3VzdWFsLg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGVyZWZvcmUsJiMzMjtDTURR
JiMzMjtkcml2ZXImIzMyO25lZWRzJiMzMjt0byYjMzI7dXNlJiMzMjt0aGUmIzMyO21ib3gmIzMy
O0FQSSYjMzI7dG8mIzMyO2dldCYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjttbWluZnJhX29m
ZnNldCYjMzI7dmFsdWUmIzMyO29mJiMzMjt0aGUmIzMyO1NvQywmIzMyO2FuZCYjMzI7dGhlbiYj
MzI7YWRkJiMzMjtpdCYjMzI7dG8mIzMyO3RoZSYjMzI7RFJBTQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
YWRkcmVzcw0KJmd0OyYjMzI7Jmd0OyYjMzI7d2hlbiYjMzI7Z2VuZXJhdGluZyYjMzI7aW5zdHJ1
Y3Rpb25zJiMzMjt0byYjMzI7ZW5zdXJlJiMzMjtHQ0UmIzMyO2FjY2Vzc2VzJiMzMjt0aGUmIzMy
O2NvcnJlY3QNCiZndDsmIzMyOyZndDsmIzMyO0RSQU0NCiZndDsmIzMyOyZndDsmIzMyO2FkZHJl
c3MuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6
JiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZn
dDsNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMzMjtk
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyYjMzI7fCYjMzI7MzUNCiZndDsm
IzMyOyZndDsmIzMyOysrKysrKysrKysrKysrKysrKysrKysrKy0tDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzE2MDsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjszMyYjMzI7aW5zZXJ0aW9u
cygrKSwmIzMyOzImIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
Y21kcS1oZWxwZXIuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9kcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstY21kcS1oZWxwZXIuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyO2FhOTg1MzEwMGQ3
OC4uZjI4NTNhNzRhZjAxJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7
KysrJiMzMjtiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtAQCYjMzI7LTMxNCwxMCYjMzI7KzMxNCwyMiYjMzI7QEAmIzMyO0VYUE9SVF9T
WU1CT0woY21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVlKTsNCiZndDsmIzMyOyZndDsmIzMyOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMzMjtpbnQmIzMyO2NtZHFfcGt0X21lbV9tb3ZlKHN0
cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypwa3QsJiMzMjtkbWFfYWRkcl90JiMzMjtzcmNfYWRkciwN
CiZndDsmIzMyOyZndDsmIzMyO2RtYV9hZGRyX3QmIzMyO2RzdF9hZGRyKQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMxNjA7JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMzMjtzdHJ1Y3QmIzMyO2NtZHFfY2xpZW50JiMzMjsqY2wmIzMyOz0mIzMyOyhzdHJ1
Y3QmIzMyO2NtZHFfY2xpZW50JiMzMjsqKXBrdC0mZ3Q7Y2w7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2NvbnN0JiMzMjt1MTYmIzMyO2hpZ2hf
YWRkcl9yZWdfaWR4JiMxNjA7JiMzMjs9JiMzMjtDTURRX1RIUl9TUFJfSURYMDsNCiZndDsmIzMy
OyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Y29uc3QmIzMyO3Ux
NiYjMzI7dmFsdWVfcmVnX2lkeCYjMzI7PSYjMzI7Q01EUV9USFJfU1BSX0lEWDE7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2ludCYjMzI7cmV0
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMzMjtpZiYjMzI7KCFjbCkmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzMyO3ByX2VycigmcXVvdDslcyYjMzI7JWQ6JiMzMjtwa3QtJmd0O2NsJiMz
MjtpcyYjMzI7TlVMTCEmIzkyO24mcXVvdDssJiMzMjtfX2Z1bmNfXywNCiZndDsmIzMyOyZndDsm
IzMyO19fTElORV9fKTsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3Jl
dHVybiYjMzI7LUVJTlZBTDsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2lmJiMzMjsoY21kcV9hZGRyX25lZWRfb2Zmc2V0KGNs
LSZndDtjaGFuLCYjMzI7c3JjX2FkZHIpKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMzI7c3JjX2FkZHImIzMyOys9JiMzMjtjbWRxX2dldF9vZmZzZXRfcGEoY2wtJmd0O2No
YW4pOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJZiYjMzI7dGhlJiMzMjtvZmZzZXQmIzMyO2lzJiMz
MjtqdXN0JiMzMjtEUkFNJiMzMjtJT1NUQVJULCYjMzI7eW91JiMzMjtjb3VsZCYjMzI7bWFuYWdl
JiMzMjt0aGF0JiMzMjtkaWZmZXJlbnRseQ0KJmd0OyYjMzI7aW4mIzMyO3RoZSYjMzI7Y21kcQ0K
Jmd0OyYjMzI7aGVscGVyJiMzMjthcyYjMzI7d2VsbCYjMzI7YXMmIzMyO3RoZSYjMzI7Y21kcSYj
MzI7bWFpbGJveC4uLiYjMzI7Oi0pDQomZ3Q7JiMzMjsNCg0KVGhlJiMzMjtvZmZzZXRfcGEmIzMy
O2lzJiMzMjtub3QmIzMyO0RSQU0mIzMyO0lPU1RBUlQsJiMzMjtpdCYjMzI7aXMmIzMyO3RoZSYj
MzI7TU1JTkZSQSYjMzI7c3VidHJhY3RpbmcNCm9mZnNldC4NCg0KQ01EUSYjMzI7aGVscGVyJiMz
MjtpcyYjMzI7dXNlZCYjMzI7dG8mIzMyO2dlbmVyYXRlJiMzMjt0aGUmIzMyO2luc3RydWN0aW9u
JiMzMjt0byYjMzI7dGhlJiMzMjtjb21tYW5kJiMzMjtidWZmZXIuDQpTaW5jZSYjMzI7dGhpcyYj
MzI7b2Zmc2V0X3BhJiMzMjtpcyYjMzI7YWRkZWQmIzMyO2ZvciYjMzI7dGhlJiMzMjtQQSYjMzI7
cHV0JiMzMjtpbnRvJiMzMjt0aGUmIzMyO2luc3RydWN0aW9uLCYjMzI7SQ0KdGhpbmsmIzMyO2Fk
ZGluZyYjMzI7dGhlJiMzMjtvZmZzZXRfcGEmIzMyO2hlcmUmIzMyO2lzJiMzMjttb3JlJiMzMjtz
dWl0YWJsZSYjMzI7dGhhbiYjMzI7Q01EUSYjMzI7bWFpbGJveC4NCkRvZXMmIzMyO3RoYXQmIzMy
O21ha2UmIzMyO3NlbnNlJiM2MzsmIzMyOzotKQ0KDQpSZWdhcmRzLA0KSmFzb24tSkgmIzMyO0xp
bg0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMzMjtpZiYjMzI7KGNtZHFfYWRkcl9uZWVkX29mZnNldChjbC0mZ3Q7Y2hh
biwmIzMyO2RzdF9hZGRyKSkNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMy
O2RzdF9hZGRyJiMzMjsrPSYjMzI7Y21kcV9nZXRfb2Zmc2V0X3BhKGNsLSZndDtjaGFuKTsNCiZn
dDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyO0NoZWVycywNCiZndDsmIzMyO0FuZ2Vsbw0KDQoN
CjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4q
KioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioq
KioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2Fn
ZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9w
cmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJl
IHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxp
ZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_1904667968.402392708--

