Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6FA33807
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 07:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CE810E9F7;
	Thu, 13 Feb 2025 06:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="pokNzUg2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MI5J51zc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF44E10E9F5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 06:39:34 +0000 (UTC)
X-UUID: 48545936e9d511efbd192953cf12861f-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=bItBukKR3gMj0nEcVkZLY5GUXHqx/iXjEtJyCb0bWzA=; 
 b=pokNzUg2ZqysYRLAYUkohnbG2aUboY7P07kWj0XAEJgMqtWmCDAguxxQBicmlJXuzTJRgFn5RwWwphbkr5Fm9nTJYvRdOHJkuYhAh0pp7iJN0FQBJNjbHSVAqAsMZTSe1iTbjgPa+V0axyPFazB0L4yU2b7PtxpaF+m2NDdKB8Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:98db195a-0ba7-4770-865d-43280832881c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:1bc08027-6332-4494-ac76-ecdca2a41930,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 48545936e9d511efbd192953cf12861f-20250213
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1124313644; Thu, 13 Feb 2025 14:39:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 14:39:31 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 14:39:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxgCsV8veWQGPAwYXi7OgSIdBbnUvfG1kiPDA7mCNAHr4zO2Mf8xrFf8B/gn36zO6vnmc1tcdnSibcwwHTAOH7eq3SipKwNeg7aDXFSqZIvbZ34Eq7juP0fT5MIxNyGtwEIUN7+KtBABfrUnnZ4u0ASxszkwbTNEtwRxcTIl8ZTHT3GKM1lacQTgomI9z6gB+p5s3411bB/MA1sf8BalSZCk/4ZcCjNp2CBPgXGTJAsXIsGPOEHxzzZ0PJbhozMpf0pBbzuIzDCu+h3793HJj3Ii761D5K58h14h5KU73PLoxjUSrAL+PrT363+Noyv2Aewkw8MtwKGw51B/FIGkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOTO5d66fhXz3RvCRI8ICJoN6b4FJN3Y/7KXrJQg8As=;
 b=m+vHgu4E2LYmHWwtsY0pXm04DP3u9sCAELzXHQS7wELk+5AyjIBKcsjd9kfxlBJLyl3/TsqxQ0AhE8Gxm1HSQY2pbKKZghpCvsGQiTPoUDu5hxmcUsRpHF+o1N5OhB+QFHpGq6fdkyuPwfotYMQVo5n2AxVAK4FPMf7bdtUUDPcUZYj3gujCYYkM90YqtD07cewBAD4rb6kMWJp3+D1fjRznxEys0+uthr8//V6w6nJw1Am8vgCXNX1thx3j2R2tls098eEohEfNl4b1BPzAsFuOa+GV07iUCEVFIJfmDnhtRPKl1nDbSRCja0NsfzBw7bMGtG5HzLLb+jstQt+VNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOTO5d66fhXz3RvCRI8ICJoN6b4FJN3Y/7KXrJQg8As=;
 b=MI5J51zc6EWrDPiLtc7U8nRWaDTjA8y7uo3QW4xiTZXwojtr4NCr84cayXJeaFToczKH/47Jcgqu5CexM5pFu7U3d0UQBDKBNpK/NlCJR5jVM9ZPXBEsqDysXLspRL9/D+0nlXEIys7yzx0V03eyMc78nAQu+sJKPBQ8H8SWrXY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8450.apcprd03.prod.outlook.com (2603:1096:820:131::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 06:39:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 06:39:28 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Topic: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Index: AQHbZPiP9hLzdllPqkqC9yWrx6kB0LNE+h0A
Date: Thu, 13 Feb 2025 06:39:28 +0000
Message-ID: <bb903722cf60d6efdfdc64598faf21e45f72e128.camel@mediatek.com>
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8450:EE_
x-ms-office365-filtering-correlation-id: f3ef1a29-89a2-4577-b8d3-08dd4bf92a8e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V1g2VUlPcnQvUHNISGZsRXc2Mm9LY3E5UUtzQ2ROMGt1SUs1eVR2N2N4V3h6?=
 =?utf-8?B?UkZSVUwrS2lWdjB3MEJSUmlwdmEwR2VuUkFmdjkwMkJPVEVlL2FLbUF0OHNV?=
 =?utf-8?B?cTdDMC80dVcrNWV6UDdqUWpaR00ybTU5Ri9YRTYyTVRQTFpCT1pacVNwU2VS?=
 =?utf-8?B?cnBwSVlWVmpWRjN3R00wbFIrVk5RS3NMcG9YUFU2dGpZN3hNUGY0MG5ZRnlQ?=
 =?utf-8?B?Ukcxb1VaTVkzRUIwVitpandNMCtCUzNsTUNjbmhjOUp5ZndKbUM5Z09POVAx?=
 =?utf-8?B?U1Y1TzFWd3NXZUtzV3loUnFhZWdqV2JjaFIrb1dqK0VvWWg0R25RbFJFKzg3?=
 =?utf-8?B?Y01jak9kREEyWXlwOHZwNmNua29uWkVGWlNzZEdTL3RKNHc3MmdnUlpwYStU?=
 =?utf-8?B?MmJDUHVwZEhmV2xYcEJFejQwa1BKaE5XclA2ZWgzTThVaTVNbFBYaUpjWlQ2?=
 =?utf-8?B?d3JLdDA1N0FXcUFXSkNUeXpqc1oycEZVcHdkNExTK2EwQ1BWMVdNenEwQS9p?=
 =?utf-8?B?VTJ5WmNhWktIZnhPNFdwVWhxMG9pSUQ4emRFVFhvZWN2Qk9vcjZ2eklKRktL?=
 =?utf-8?B?MDhXMUx3Z0tZcjZjZklha2c4SDdqRytIZEZrbkYwTUp5dzZnbURzVlBHck9B?=
 =?utf-8?B?TmRkeEY2YU5LK2JUa0pUVkYrZGcvRGREMDMxZjlBdG1aTFFFQTBYZ3luR1hi?=
 =?utf-8?B?UEJNK3lkbjBIeTlyUTcvV2NEZFk2UGdyY2lSaFEzbG5uN3Ivd3l1WnpxdUNP?=
 =?utf-8?B?MDIrbmtHazIxckNNQVVuaFRPblFyME1leStEK1BCWlV4dGxJZXdTb0VpcnVK?=
 =?utf-8?B?OXNpVDZNRlJvSVJXVlVIYThqMmFFUXVRV0YrdGU4UEd0dTdaYTM1aWJCd2sv?=
 =?utf-8?B?Z0NXb0tJTXFLZFdyYjlSVCtoREwxME5UVE5DcDNIUDc3SUdFUSswRHRaZkVX?=
 =?utf-8?B?SVVaOCtFMkhGSFhBYk1QczA4aVdlSUxlNlN0OTl4MzNWZGlGemFTSU8raHl0?=
 =?utf-8?B?U0hBZ3hqOGxkQTJMUGlOWko0dVVCRXBHRmhkU0V2cG92djJwNjh6M2tQTTg3?=
 =?utf-8?B?bjZ3V3lrbEl2SVF1S1dmWEpURWEza01nOXQyUEZBelNhbFljU1RiOG1DN0xN?=
 =?utf-8?B?ZUJkSjdaekN2dTl1N2tsaFB1aFFSbGRsV1NVQm5LNzlORDhqSlpSeUkyeTlW?=
 =?utf-8?B?US93cXB5UnFid0I5NHYxdnNHanFUNEZNUm5YVTI3ckhTTTlGZXlMZHJLYTVu?=
 =?utf-8?B?L2dDT2pJTC9CZ1pGanRweTJDa0dhNzRCYU5RMWxuRkcvUU51am1FSnBMSm1k?=
 =?utf-8?B?N3poR3VGVTVkaXlLdnR0TnMvbGFFRm5oMVZlbjV1NnVWSFZEcjB6K3RkbTFw?=
 =?utf-8?B?akZMd0QzVVhDa2FNMnlyL29wRDJxRUdDeTI3UlVXcHk2WFZDNitkeGhTMEhG?=
 =?utf-8?B?cFBSRXRCMXFkWGU4T2ZKVVRMUDFJdjVwbEpWUVRZaEZhOXlqZ3h1aXpOdU50?=
 =?utf-8?B?T0Y1dURWcFZtVTlOL1VxK1VseVQ4SEc2TktyLzdCd21UUGhUUWJ3d1VvUG9K?=
 =?utf-8?B?QWk5cmxyT0RFZ3NIallJQ1pHdmFtQkZxOFZMWm10RmtJOXJrMjE3V3NTWGJ6?=
 =?utf-8?B?OGdhdjhQYkZBTU1XcFJ5N3Z2aTZoSnlIMWJEVGNyWjRSekNYSFovM3kyRWVY?=
 =?utf-8?B?NlJGT1M1THRwZDNtK0pBMVR4U0VyKytETlhLR3pIZE40T2xPUTJyMEs5L0h0?=
 =?utf-8?B?TVlTSGNoYU9LOUtpSDBNN3VTSStmNDBpK0ZUTnRvYWk2Z2NVRTZvamVvcjFG?=
 =?utf-8?B?K2xBUi82VWlaTHZuZXcwUjlnQU1GTWlURCttTHpsdkJUV3V4THhXK0F5UGxt?=
 =?utf-8?B?VjI2L1FPSktMNnNhd1ljK29TeDNST2VQbHRTQUhFZnFqOGFTWXR1cXFzSnNB?=
 =?utf-8?B?dFRlVC9nY0FTK0E3cmpMWi9hMmh5TE5ITUo0a01zYlZoL3pvL2V0MWVPOXE5?=
 =?utf-8?B?RnVVNnpkcWJ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWRRL0tJYmFwQXFrbTVPNXlBZEIxNkJaVWdXSDZOdnRFVmgvMU1zNGFaZnd5?=
 =?utf-8?B?NHBYQ2JBMHMvYWtvclVkS1RabGxmQ281M0s0TkJjSkdmcTFENDhiT05Ra3pn?=
 =?utf-8?B?eVgzRmFhVW5GRFdJOVYzVVZ4RCtoYTl1UG4yaUVJamxiS3UwenpZdEdCOFpn?=
 =?utf-8?B?TFI4blhoUUt1NWlCekwvZktnUzJQM0FJQlkvcTdxRU9rd3MrZHd6Ty9yMTkx?=
 =?utf-8?B?Q3o4R1hJMnN1RGk2a05NcW1GT0d5dFJkV29WYjM4U2owenRDSm9zV3Z2aE02?=
 =?utf-8?B?QzZwei9wM2wyaWZveCtvZ0hmZHNnSExVZlNOdmltN1VWQ2h4TGhYNFd5NW11?=
 =?utf-8?B?OEhScnZCUkFqY2ZGbEt6UzUyMnZDa3hhYytVbTZPdWgyeXJpTTZEV21Md0lF?=
 =?utf-8?B?L1ZvY2lEdzhWWnFwYjQxdTViUnpyNm51WWZUV2E2SWRSak1hdGdWaEVaVFhj?=
 =?utf-8?B?NXIvd3pMZ3dJalNIa3NRZEthYkdOVXhTa0ExazRjN09yb0FXeDAyY3BKdWla?=
 =?utf-8?B?L0VIWUc2b2o1SFZOY2NqaW1VcU5hQXB0SEl0aU9Ray9XK3gyKzQ5RjhYUmlQ?=
 =?utf-8?B?cmdtZGZleldQVVErcmxWa0pmSEpxclcyWS9JNWliRHlPZTlSS0JOVVZPc0JM?=
 =?utf-8?B?ZDRIbndxazVvdThmN2VvbjJvUm02R2tBNzU5MWQ4eFVDRzErVHQreHdHdm1i?=
 =?utf-8?B?QVBVN1dSWGFLWFdUTGJ6V0hwV3hHNCt3ZkdGOXRza0dCN1NRN0ZKL1VHTzVI?=
 =?utf-8?B?N0FrcEM1R1pSQU96QUJQMDVzdnppSmZVVjE5YVMyTjlLVU1Sa3Q2aEx5RHF0?=
 =?utf-8?B?Q2RhZm5jVnhJZUtyYXRGUjV2dWNnN3VvMm9XeHE5NnlRemdiTDVwWFRUTzRY?=
 =?utf-8?B?TzV3K2xzcVJheE9YK1RrVlR2Q0xmaklzZ0RuTnRmU2lZY25WUmNmSFRmM0Er?=
 =?utf-8?B?MnZqYitnL1I2Szdwb1F4RWZnMzRrNm1HamlmSWlISjI0ZW1aL0V6Q2ZZdmRT?=
 =?utf-8?B?ci82U2FaUUcvbHFTaFUvN21RK2x5Wi8zTzFiRXJXSFF3aGhmaXNGMVp1WVg2?=
 =?utf-8?B?c3I1Q1cyWFVSaVUveU45ZmRxdy9iZ2RFM2RIR256cjRXS25Vc0V4MGVkRm5j?=
 =?utf-8?B?aW1yWm5DNzlacW9MZHZPWmxIY1FXb056ZkdUdzhjQ2tZT1FOa3JNZk5GYW1W?=
 =?utf-8?B?VDdNbkl3SGJKd3ZHSzFYNGZiVThuWXdiNjhISlNEOUxTZUdpQ3Y1VW5LR3dn?=
 =?utf-8?B?cWJvSnNmRmhQUjhjbGtIa2FrUlFPdGdmZ3BlMFNmdE0xSXhGS3ArcENJSlc1?=
 =?utf-8?B?WWtSUHZScHZ6NEJWOVc0VDBLekhBWkNBckpaQnQrVHB6Qnkrbk8vTStuOVhH?=
 =?utf-8?B?dzNOMFFjSjM1KzlUMHB6RzdaVlphT0xJbStnbnNCNlpPS2RKdFNtS0ZMWHRK?=
 =?utf-8?B?dkpjS3JUM2Z1SGZGVkdSU0xwUGtzRjJTNzkyc00zbksrbHFyRE1ReW5IQnMv?=
 =?utf-8?B?SE9pbTloZ3Vyc2ovQmk3bFhlVFVyN1ZSL2I3V3dRRE11Y0YzaUMrZ0RNcXJu?=
 =?utf-8?B?Y0hRcHd2U0xKSkVocnhLUWlKOXlWSDhMaVZSN2RROTgxVzdwbHFRbm9xUzY2?=
 =?utf-8?B?RVZZb2w3RXJFaDcxOU0vckhRN3lJanY2LzVuWkQ4QjFTMHZwSlltWVR1clgv?=
 =?utf-8?B?WGdMMTN2Z2Rzcm0rOVZ4V0d5QjdrKzlEOVhsa2hoVEZyeUNDZ1pEc2I0RGlh?=
 =?utf-8?B?d2s1aE1FU2lGSW5mcHhJOFY5dlhmQmhmTEY3YlFHOWx0R2RiMkhvUCt1a1ph?=
 =?utf-8?B?NWYwQStVRWhabFhMNy9iZzRZVy9LRUI3c3JvcmQvQ2E0Vm4zQmwyVC85Qndq?=
 =?utf-8?B?Sng3eGo1MVYrSmNieTIwc1p2ZHJGK0JoUHMzWVNYQjM1ZmlNd1ZSd0k3OVNw?=
 =?utf-8?B?NVprTHZCMTY5YmlrV3ZXNkl5bHlZcWlaRTZFK3grcjJHWURmRGtCbDBvVFVz?=
 =?utf-8?B?K1UxWmFSYXVWQjRuZ1FYcVJUYVBRNm4xOG0zUWFpODBNK0tURHVLeFVDQkVi?=
 =?utf-8?B?MnM3endvVXBnL0ZVYnFpcE1JaHM2bDBBMW1GcmpMZUhkUDZVRDlrbHB1YWdj?=
 =?utf-8?Q?mODVZQy5dRL4qLhwc21IpMcCO?=
Content-ID: <CD65611529250442B9F38F149C9C02BB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ef1a29-89a2-4577-b8d3-08dd4bf92a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 06:39:28.9152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nt7GhfxBaRsvnLVLV5jzgtgUUc10tZUIezkSfyAMi+fw56xuFIFXFuurY5Nu0dr+WKlRDUPR2xjIFIBiVqmcvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8450
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_38752330.1886327999"
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

--__=_Part_Boundary_004_38752330.1886327999
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDI1LTAxLTEyIGF0IDE0OjQ3ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IFVzZSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2Fy
Z3MoKSB3aGljaCBpcyBhIHdyYXBwZXIgb3Zlcg0KPiBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9w
aGFuZGxlKCkgY29tYmluZWQgd2l0aCBnZXR0aW5nIHRoZSBzeXNjb24NCj4gYXJndW1lbnQuICBF
eGNlcHQgc2ltcGxlciBjb2RlIHRoaXMgYW5ub3RhdGVzIHdpdGhpbiBvbmUgbGluZSB0aGF0IGdp
dmVuDQo+IHBoYW5kbGUgaGFzIGFyZ3VtZW50cywgc28gZ3JlcHBpbmcgZm9yIGNvZGUgd291bGQg
YmUgZWFzaWVyLg0KPiANCj4gVGhlcmUgaXMgYWxzbyBubyByZWFsIGJlbmVmaXQgaW4gcHJpbnRp
bmcgZXJyb3JzIG9uIG1pc3Npbmcgc3lzY29uDQo+IGFyZ3VtZW50LCBiZWNhdXNlIHRoaXMgaXMg
ZG9uZSBqdXN0IHRvbyBsYXRlOiBydW50aW1lIGNoZWNrIG9uDQo+IHN0YXRpYy9idWlsZC10aW1l
IGRhdGEuICBEdHNjaGVtYSBhbmQgRGV2aWNldHJlZSBiaW5kaW5ncyBvZmZlciB0aGUNCj4gc3Rh
dGljL2J1aWxkLXRpbWUgY2hlY2sgZm9yIHRoaXMgYWxyZWFkeS4NCg0KUmV2aWV3ZWQtYnk6IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCkkndmUgbm90IGRlY2lkZWQgdG8gYXBwbHkgdGhp
cyBwYXRjaCBmaXJzdCBvciBBbmdlbG8ncyBwYXRjaCBmaXJzdC4NCkknbGwgZml4IGNvbmZsaWN0
IHdoZW4gSSBhcHBseSBib3RoIHBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMTQg
KysrKystLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCBj
YTgyYmM4MjljYjkuLjRiMGViN2RjMjVkOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMNCj4gQEAgLTE0NTgsMTUgKzE0NTgsMTEgQEAgc3RhdGljIGludCBtdGtfaGRtaV9k
dF9wYXJzZV9wZGF0YShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksDQo+ICAgICAgICAgICogTU1TWVNf
Q09ORklHIGRldmljZSBhbmQgdGhlIHJlZ2lzdGVyIG9mZnNldCBvZiB0aGUgSERNSV9TWVNfQ0ZH
DQo+ICAgICAgICAgICogcmVnaXN0ZXJzIGl0IGNvbnRhaW5zLg0KPiAgICAgICAgICAqLw0KPiAt
ICAgICAgIHJlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUobnAsICJtZWRp
YXRlayxzeXNjb24taGRtaSIpOw0KPiAtICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
X2luZGV4KG5wLCAibWVkaWF0ZWssc3lzY29uLWhkbWkiLCAxLA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZoZG1pLT5zeXNfb2Zmc2V0KTsNCj4gLSAgICAgICBp
ZiAoSVNfRVJSKHJlZ21hcCkpDQo+IC0gICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKHJlZ21h
cCk7DQo+IC0gICAgICAgaWYgKHJldCkgew0KPiAtICAgICAgICAgICAgICAgZGV2X2VycihkZXYs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gZ2V0IHN5c3RlbSBjb25maWd1
cmF0aW9uIHJlZ2lzdGVyczogJWRcbiIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCk7
DQo+ICsgICAgICAgcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdz
KG5wLCAibWVkaWF0ZWssc3lzY29uLWhkbWkiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxLCAmaGRtaS0+c3lzX29mZnNldCk7DQo+ICsg
ICAgICAgaWYgKElTX0VSUihyZWdtYXApKSB7DQo+ICsgICAgICAgICAgICAgICByZXQgPSBkZXZf
ZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyZWdtYXApLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBzeXN0ZW0gY29uZmlndXJhdGlvbiByZWdpc3Rl
cnNcbiIpOw0KPiAgICAgICAgICAgICAgICAgZ290byBwdXRfZGV2aWNlOw0KPiAgICAgICAgIH0N
Cj4gICAgICAgICBoZG1pLT5zeXNfcmVnbWFwID0gcmVnbWFwOw0KPiAtLQ0KPiAyLjQzLjANCj4g
DQo+IA0KDQo=

--__=_Part_Boundary_004_38752330.1886327999
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1N1biwmIzMyOzIwMjUtMDEtMTImIzMyO2F0
JiMzMjsxNDo0NyYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8m
IzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVu
dHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3Nl
bmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtVc2UmIzMyO3N5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGVfYXJncygpJiMz
Mjt3aGljaCYjMzI7aXMmIzMyO2EmIzMyO3dyYXBwZXImIzMyO292ZXINCiZndDsmIzMyO3N5c2Nv
bl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoKSYjMzI7Y29tYmluZWQmIzMyO3dpdGgmIzMyO2dl
dHRpbmcmIzMyO3RoZSYjMzI7c3lzY29uDQomZ3Q7JiMzMjthcmd1bWVudC4mIzMyOyYjMzI7RXhj
ZXB0JiMzMjtzaW1wbGVyJiMzMjtjb2RlJiMzMjt0aGlzJiMzMjthbm5vdGF0ZXMmIzMyO3dpdGhp
biYjMzI7b25lJiMzMjtsaW5lJiMzMjt0aGF0JiMzMjtnaXZlbg0KJmd0OyYjMzI7cGhhbmRsZSYj
MzI7aGFzJiMzMjthcmd1bWVudHMsJiMzMjtzbyYjMzI7Z3JlcHBpbmcmIzMyO2ZvciYjMzI7Y29k
ZSYjMzI7d291bGQmIzMyO2JlJiMzMjtlYXNpZXIuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoZXJl
JiMzMjtpcyYjMzI7YWxzbyYjMzI7bm8mIzMyO3JlYWwmIzMyO2JlbmVmaXQmIzMyO2luJiMzMjtw
cmludGluZyYjMzI7ZXJyb3JzJiMzMjtvbiYjMzI7bWlzc2luZyYjMzI7c3lzY29uDQomZ3Q7JiMz
Mjthcmd1bWVudCwmIzMyO2JlY2F1c2UmIzMyO3RoaXMmIzMyO2lzJiMzMjtkb25lJiMzMjtqdXN0
JiMzMjt0b28mIzMyO2xhdGU6JiMzMjtydW50aW1lJiMzMjtjaGVjayYjMzI7b24NCiZndDsmIzMy
O3N0YXRpYy9idWlsZC10aW1lJiMzMjtkYXRhLiYjMzI7JiMzMjtEdHNjaGVtYSYjMzI7YW5kJiMz
MjtEZXZpY2V0cmVlJiMzMjtiaW5kaW5ncyYjMzI7b2ZmZXImIzMyO3RoZQ0KJmd0OyYjMzI7c3Rh
dGljL2J1aWxkLXRpbWUmIzMyO2NoZWNrJiMzMjtmb3ImIzMyO3RoaXMmIzMyO2FscmVhZHkuDQoN
ClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0
Ow0KDQpJJiMzOTt2ZSYjMzI7bm90JiMzMjtkZWNpZGVkJiMzMjt0byYjMzI7YXBwbHkmIzMyO3Ro
aXMmIzMyO3BhdGNoJiMzMjtmaXJzdCYjMzI7b3ImIzMyO0FuZ2VsbyYjMzk7cyYjMzI7cGF0Y2gm
IzMyO2ZpcnN0Lg0KSSYjMzk7bGwmIzMyO2ZpeCYjMzI7Y29uZmxpY3QmIzMyO3doZW4mIzMyO0km
IzMyO2FwcGx5JiMzMjtib3RoJiMzMjtwYXRjaC4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0tyenlzenRvZiYjMzI7S296bG93c2tpJiMz
MjsmbHQ7a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnJmd0Ow0KJmd0OyYjMzI7LS0tDQom
Z3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMz
MjsxNCYjMzI7KysrKystLS0tLS0tLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hh
bmdlZCwmIzMyOzUmIzMyO2luc2VydGlvbnMoKyksJiMzMjs5JiMzMjtkZWxldGlvbnMoLSkNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMNCiZndDsmIzMyO2luZGV4JiMzMjtjYTgyYmM4MjljYjkuLjRiMGViN2RjMjVkOCYjMzI7MTAw
NjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Yw0KJmd0OyYjMzI7QEAmIzMyOy0xNDU4LDE1JiMzMjsrMTQ1OCwxMSYjMzI7QEAmIzMyO3N0YXRp
YyYjMzI7aW50JiMzMjttdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3QmIzMyO210a19oZG1p
JiMzMjsqaGRtaSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyomIzMyO01NU1lTX0NPTkZJRyYjMzI7ZGV2aWNlJiMzMjthbmQmIzMyO3RoZSYj
MzI7cmVnaXN0ZXImIzMyO29mZnNldCYjMzI7b2YmIzMyO3RoZSYjMzI7SERNSV9TWVNfQ0ZHDQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsqJiMz
MjtyZWdpc3RlcnMmIzMyO2l0JiMzMjtjb250YWlucy4NCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyovDQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZWdtYXAmIzMyOz0mIzMyO3N5c2Nvbl9yZWdtYXBfbG9v
a3VwX2J5X3BoYW5kbGUobnAsJiMzMjsmcXVvdDttZWRpYXRlayxzeXNjb24taGRtaSZxdW90Oyk7
DQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0m
IzMyO29mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCYjMzI7JnF1b3Q7bWVkaWF0ZWssc3lz
Y29uLWhkbWkmcXVvdDssJiMzMjsxLA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JmFtcDtoZG1pLSZndDtzeXNfb2Zmc2V0KTsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsoSVNfRVJSKHJlZ21hcCkpDQomZ3Q7JiMzMjst
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7cmV0JiMzMjs9JiMzMjtQVFJfRVJSKHJlZ21hcCk7DQomZ3Q7JiMz
MjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KHJldCkmIzMyO3sN
CiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkZXZfZXJyKGRldiwNCiZndDsmIzMyOy0mIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JnF1
b3Q7RmFpbGVkJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO2NvbmZpZ3VyYXRpb24mIzMy
O3JlZ2lzdGVyczomIzMyOyVkJiM5MjtuJnF1b3Q7LA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQpOw0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmVnbWFwJiMzMjs9JiMzMjtz
eXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MobnAsJiMzMjsmcXVvdDttZWRpYXRl
ayxzeXNjb24taGRtaSZxdW90OywNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7MSwmIzMyOyZhbXA7aGRtaS0mZ3Q7c3lzX29mZnNldCk7DQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KElTX0VSUihyZWdtYXAp
KSYjMzI7ew0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7ZGV2X2Vy
cl9wcm9iZShkZXYsJiMzMjtQVFJfRVJSKHJlZ21hcCksDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyZxdW90O0Zh
aWxlZCYjMzI7dG8mIzMyO2dldCYjMzI7c3lzdGVtJiMzMjtjb25maWd1cmF0aW9uJiMzMjtyZWdp
c3RlcnMmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtnb3Rv
JiMzMjtwdXRfZGV2aWNlOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtoZG1pLSZndDtzeXNfcmVnbWFwJiMzMjs9JiMzMjtyZWdtYXA7DQomZ3Q7JiMzMjstLQ0K
Jmd0OyYjMzI7Mi40My4wDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFu
eSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRp
b24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFu
eSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBv
ZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0t
fS0tPg==

--__=_Part_Boundary_004_38752330.1886327999--

