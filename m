Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC3ADE574
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCCE89798;
	Wed, 18 Jun 2025 08:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tx2E2QXn";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mNfUKrKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1B910E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:23:54 +0000 (UTC)
X-UUID: 8bbe6e144c1d11f0b910cdf5d4d8066a-20250618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+nHHHMuoNxrFPmztH+FliLSSujgab689aUZt1aRELOk=; 
 b=tx2E2QXnOwMqESvObFZMC1SfJM2OZzMcogDNF5y7zIDNz7sAIkA0SvlyqomnRx/xJ9/z6JXAYHDpzsxXV8fqnbur6V/tCQ6noj6yIGjc5w+oykYr0lET3Z6I9S7eBaduXeDYAr6xuOd2XKzAn8YjMKf50hhP8x+oU4G8uVb7CwA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3, REQID:3792313c-2601-441a-96a5-97e430155a8d, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:09905cf, CLOUDID:14a9bc83-db76-4e00-9dd0-5c1455b2676b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8bbe6e144c1d11f0b910cdf5d4d8066a-20250618
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1457261379; Wed, 18 Jun 2025 16:23:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 18 Jun 2025 16:23:41 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 18 Jun 2025 16:23:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNOW1A9PHWSuHDrImGaR/YtfyT1/0LxmK0Kgua487oHviU0G39rqPOPPJJmRB2H14va3+5zdXuw6B32XA12N636GVxLb1kz73giOiwQzVql0ZYWXdDE9bXkItUD3sLdzleAbHBmyfQ9IV5iHZ0H3Gu9vB0/+e2KXRudRCw7hEAgDFdOWbx80yEmIyRAH7eGWdLKGSEthf8ban9kPDFJritGUt7N6pvuSWf64SNQ/0vYnZQccEpczApoRwYC/6uXUaJ+XQGXh+2yUeh3t3Op7VfyPozYoVLwCl4R/We1y7k1fx34tiluj75IRIBkFQsl5SX1N0ECV/KgSDWu/vSHUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBb91KwQ5d87YkmoWsoodIDT9UmZ41z7T3oFj3R9rfA=;
 b=yYzqYG0LIN+AwqJAVoNfYj9nP9nLEQRphgj4ENJEk5XEMfS5iyoqge5pPflPv0gqH67OP2NbbamDdWJkJnXyGEa8lIAgaPqW9IKhkQ7wE2NqJJu7ckJLxlhWtNnvu0O5g+QuY+UwZ/CETZnseiMubaTqN9sEtCd52ABZ1V8aMo4M+vS9ZC9QjQN/ILUDV7BPgB6LXiR+0o8FHTYpEb7Jeri/nubZraXZ/m08fTja1I5A+Do/tm1T/E6rqen6bP/DojGCN7PYhgH/H0U5Cy4fcWgfwbIQ3luqk1Em0dcCCohqE3y/qttKTpYPCzgkV3KrM1046Fn6xoDrIIzmlXUktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBb91KwQ5d87YkmoWsoodIDT9UmZ41z7T3oFj3R9rfA=;
 b=mNfUKrKD+SeLJQJfttBwqacq7BD+ludf5EUgqHZqO4+uFlWhK7xdEWxedND9E2SAR0hGyDHvBQ6KjZJT/f3rHqphODIFcoR2Dp42SBDPaSEF3lp2cRaGpyZIXhzQv2MGgsE088Ah+GOh5EzE5wiuk7B7Ti3JgORPtCF1iq7dNVQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KU2PPF7353C556D.apcprd03.prod.outlook.com (2603:1096:d18::417)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 08:23:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 08:23:38 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Thread-Topic: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Thread-Index: AQHbxXzMlGt/esHD6EWE1cmK2i59x7QIyZsA
Date: Wed, 18 Jun 2025 08:23:38 +0000
Message-ID: <778e9796ed50d8f9aaf11b6f1fa1f19386eb71d6.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-15-paul-pl.chen@mediatek.com>
In-Reply-To: <20250515093454.1729720-15-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KU2PPF7353C556D:EE_
x-ms-office365-filtering-correlation-id: e0f805d4-7c4e-43e0-b384-08ddae416d70
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Unp2WXE1N2J0Y2xSbGlxbTBwc0dSVVZUTHpRUFdHRHZ1dGt0OVROaFd4MndQ?=
 =?utf-8?B?TjN5OHN1ZHVQVXZlbllwcWRJU01NTWR6a0drUWpRWXZla25LdW1HSGdhUXQ4?=
 =?utf-8?B?SFg5V0p5VUhlZUROS2ZHZkZrRE1IYTJzbnRKamVtbnkySGFaVVlhR0FTSW0r?=
 =?utf-8?B?R1dQSGc4ZWNuOSttRlp0REhEbVVnU1gvWDRtbG9yNm9LOUhZdkR0UE1pb2Ri?=
 =?utf-8?B?L2FMWURCUTRNVnpaSHNxSFQ5MzlzVC95VDBOQnQveTYxOXd3WS8wcVI2M0pu?=
 =?utf-8?B?WVVLR24xRzA1djM1RVZ5SmhuWjZhYlR5bjRxTHlpZUduS2V3UGdTZW9ZT0s4?=
 =?utf-8?B?N1V4K3hHY0duVDl5TjF2YXNsVnpKK0pzODlTeHd1ZHRLS2d4VXlIVDFUcHZo?=
 =?utf-8?B?UnNYZms1bE00M3dOZWlrV2wvdHdxSnBndGZGbkh2dTZwU1NoMGFZVUE5SThK?=
 =?utf-8?B?bzlvZXZDTkRqeERCOUlCUUl6TTgySGc2Qk5vTjlhZHB0OVREbkNzV0lRYXFn?=
 =?utf-8?B?UW45QzlXcVBkNjFaVEo0dUhoOXNsS0VuMzZGSDJ1akdCUEJENWEyMzZVeFJ1?=
 =?utf-8?B?ZG5IYXJvVk9aUnlONEtkNjVRWGJRaTk2aW04SjArWm56NldiUTF4K0kyU2Ru?=
 =?utf-8?B?YVhkRTVZNlY4U1lWcTR3cXJPUWFSWGFHcDJ6UjM0ZVJZbkMzc1NrWS9PRWN2?=
 =?utf-8?B?Y0MwZ28yandWanhsbDZqY1VyRmw2SDNNMTJ5Und3emwvbjRuVHdiZ0lWaFBl?=
 =?utf-8?B?UnBSMkJ5MUNCdTd0VWJSeG1kbEV2eW1VOENDcXlaaWpmNUhSc1hXa0F4RmZr?=
 =?utf-8?B?SnBQU3o0ME80ZlMvV2h0Q2l5Y3dYZUtBMVJoWENldWpHM29VL0V4dzJ5em9q?=
 =?utf-8?B?OUc4TVphdis4SVNRYTBIbmxJdDdNZnFXc2VmUjVDVUlaOG5JR1JiWUdqOUJp?=
 =?utf-8?B?c1FPWGZKdWtpeEJUQS8xY0IrTitsR2JKSDBpUE9xYUdmRzNYSHFncW43ejB4?=
 =?utf-8?B?MzM4N2tlY0RldmsrWEhVQTdCNVErNnBRaERRLzhQWUk3ZjR3Rk42ZmNtSG5G?=
 =?utf-8?B?ajZmOUIySjJOK052WVdqNVArNUk2aXdHeDFTZjA0UnRjRzJhYVdTNkdHUVNT?=
 =?utf-8?B?elA5TzNVN2YzZjlGWFJiSzcwT3JtaWJ4RUs2MTJYaFVLNS9VWDltb2hKWmNq?=
 =?utf-8?B?cEkrbjE0QTVhVHNWOXh4bU9nU1lhUHd6aWcwMTdQOGNqc3RjWVdGTlR0RUxm?=
 =?utf-8?B?SWxFV2NIK09DQ1dOSmJaQTVEdGFLQ1h1eUJNTWNDQTF1cEI3NlBzR2hzMkxB?=
 =?utf-8?B?eko3MERyK1IyUjYyeThkM2p4eENmc3ROUFNSMlpCcllNYXNqdU9XejZ2eHgv?=
 =?utf-8?B?aGZFdUJlTXNNTGpHaEozdGllc1VldElSL3JCUkt5WlVDT0dhVXg4Z0NKL2d2?=
 =?utf-8?B?eXhEUGVBOVQrUlVBbTZFSUdnRTl4RHlHRE9ldzV5cHl6TTRqL1ZYSmtGY3JE?=
 =?utf-8?B?djM3M2toTVNKWHE5VWp6cWNwTE5BYWFaSmZ3Z0VuNlpIbXdaYXFVMVlKb3Z1?=
 =?utf-8?B?Z0p3bUcxeURtU1F5MDlMZmM1V2lHemFYYnhENURkTFU5ZitaOTYyVXFOQ1Rq?=
 =?utf-8?B?RDVIR0QwS3NRME81cXUySm4zb2dmS0NVSnZscWRHdlhoNGNKem91b2R4Z043?=
 =?utf-8?B?QWFsRlE2TTJoY3hCTkd2RVhaTlAxQW1KbTdKT0JvUjVxTjhrOW1GcEhwaTFP?=
 =?utf-8?B?V1JSdmNTYmRZUE1wSHBPRHZNK0dzckhlRkhnREpWd2pnYlRjcEdvdzMyZTly?=
 =?utf-8?B?T3llT1NLL1FEUG0ya1IzeFB2b0ZJK1k5NUh6clpKSWVSK2lhUlRpci90bGNm?=
 =?utf-8?B?WCsxbXpOU1M5YUVhNjNBSEhWeDh4MStCUFAxcXhtdnIvZ3ovVXJ2T2hleVhi?=
 =?utf-8?B?dGVGT3lQYVA1ZVVSU2Irb25wcngxZGsxL3JDT1ZhcjZqekJWb3BXNisyc2sw?=
 =?utf-8?B?bU9FZHFKMXhRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Um5DdEtDalVTcHNJM3diZ0MvVHhUWEdKTWs5NnU2dlQwUFBnaGNVREpoRWlr?=
 =?utf-8?B?eUhkRzBCVUQ0TjRkUUYzc3ZIbWRLaXBsWWZnUkQzd0p2a0RhMXNkcVl1VUNV?=
 =?utf-8?B?dThBQ01IaHpUK1IyVkNtb242emU2NUhIWjVnZDB1UGNzTlF5UlJJTWgvSWts?=
 =?utf-8?B?YUVtcnE1aFBjakVncUpuN09pK0lsZUtjZDJ0TzNQMEdnSFMrUjBPOVY4bWlu?=
 =?utf-8?B?NkE1L3RBY2ppb0VwZndRQi9aWHhCamYxU3FZbURiSHl1V1JLTWJXNWoxOHox?=
 =?utf-8?B?Yjl4SGJMMmdCLzFQRTdvMGtHVW1mT1lGak8vdEo2cHp0amFoakJyblRGd2hP?=
 =?utf-8?B?NGxIOFZ0UXNETVh6dXh5NXJFcCtjZUlNQURELzNmQkU1ZTFSd2VwZ282ZVpv?=
 =?utf-8?B?RVZiNUsxSUlnU1JVT0NseTE1YVpRYkJ1V2VrU0svLzMwTkZ5MUY2TlJ5TGRt?=
 =?utf-8?B?U3FkMXE3Z200Z2hiQVR2a0JsSk9GbWpEb09TeWF5aTRFU3JyL094c2NrdXpN?=
 =?utf-8?B?TDRRTnpKbjB2LzMvZEdKd3N4SUM4bzd5d0lVU0ZxTWFyM2h3dklIQ1VuQmZN?=
 =?utf-8?B?c0EzUWJQYUUrelRCNE9Gajd5Mnc0cXJSbkxaVExnbkY3dU1YT1UzYlhkYm5t?=
 =?utf-8?B?b3lka2VhUlRRa1J4WTFTSDN0YUJSTDFLMkZ2UTdIbG4vbXB0WTc3a0doQWpQ?=
 =?utf-8?B?SE5nd01TaSs3L01Td0I3dmR4UUt3OEFub2FWSzhtejBQZlhsRGdvSVFUTVJr?=
 =?utf-8?B?NGZ6ZGRYN2NvbmpIazNibUlKVXBKeXlaYWRqZWFzR1BiODlZVDdTTzdUUXdn?=
 =?utf-8?B?T2RtcXRWemp0RDR3TWZrSFlXYWlzU2hEbU1mbkxuMVRGQkdZaU1IWHJPSTZt?=
 =?utf-8?B?dTBJVDdJakZzaFFOVng4eU5lTzJaOSt4eTBiSitZUEtQVzNtSENIcVBVRWZ1?=
 =?utf-8?B?T3lnS1VENkl0dkxjQlJwUDFKOWIvS0ZLdFk5R0pXa3gyUlVHRW1HMVhNSGgy?=
 =?utf-8?B?QU1NUE9mcVFMakRPU0V0U1p4MWRRYXJaRHdJUHo4OUYvYmpHU0FYbzY0QTl5?=
 =?utf-8?B?WmVyUVhDVW8yeXR3SUxtVkZ5NXY4OUpQV3hrekNobnVvbVJEc2Q5WE1TNVFL?=
 =?utf-8?B?L2FraWtaT1N6Z2loZHp4YWI4R0lhcVNMVDMxc0NZSnpBRjZKL0FLVW4yekpj?=
 =?utf-8?B?Y1pJTUMwYkg3VGhyTzE0WUZSQVFlRERNazNSbG1meG12Y2VndGpDN3dTM3Rj?=
 =?utf-8?B?L2Q5OHJLeTY5U28xY0Z4d011V2YvanJNMkxDZ2RmbEwxVC9CWG9NNHhNa1hj?=
 =?utf-8?B?bytNTGhqS28yOUFLREM0Ry9mOWN5WkhmRDFlT2N1YmpmU2hXSmJGRU90N3hK?=
 =?utf-8?B?V1JjcUtpdFpvMmRSaG9Db3h6YW5rcFlCSEFRMFcrbnJTb0ZBdjVvWGZyZFJ6?=
 =?utf-8?B?aWZoSFhXOS93RkxEMm1ZbVdERjJxOFM3TWE1NFdldC9COGFNa2dvSENmZlZO?=
 =?utf-8?B?b0U2YkJWMVAwdkNURjYrVmU3bEdsMHhwRGxna0RHNExSVENLeVA3cU1JU1VX?=
 =?utf-8?B?eFlKRUNsZnNQLy9qVUFQQ0J3blRDa3V6eFJ3cmwzcmVEWHlXMGk0L3ltcDJS?=
 =?utf-8?B?Ui9lYk5XamNwSDlvUzZmbWQ3VW5aQ01WMlZhMDlyWVdVTmxHQ2NDM21mYURr?=
 =?utf-8?B?NjRPZUYxZXdjZFJsV21pSGVZVEpsZ0FxajRPL2x0U01FL3UxWTZQOHVLMVVp?=
 =?utf-8?B?Q0dPZllPaFdWQmE0bEZ5ZEQ5RXRRaTNWRDIvRkJnNGtmVHZjKzRwUzJvZldl?=
 =?utf-8?B?eXhIRjJpL0NGTGo4ckdnL1orNEpTT2wrUkFmajFhajNPNzVoNC9ZL2FUYnYx?=
 =?utf-8?B?eDd6VEZLMS9KLzZnQWo0MXFDaUpZSXBROHltbEF2cVhmV25vV09kd0h5YU01?=
 =?utf-8?B?ejVyRDZzOG5SUGlFRFpQL1cwU0hJUmpJM2dvelNOS1lIWWp5MjV5eGxobENE?=
 =?utf-8?B?emp1QXUwcjk0c3lPYlVlQlV0TVNPbmxMbEQ2ZElnOU1IWmc2dDdZc3FPeTNY?=
 =?utf-8?B?NWg3ZVRRNXZPeG1nVzFkMVFtZjRSMCtxMGlDdGN6RlVNTDVKZFFqWHFxZUEw?=
 =?utf-8?Q?SkUAwTMsglVWzUhoh49kfRj3H?=
Content-ID: <E5E091DF1470BE429EC5985D3B219F12@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f805d4-7c4e-43e0-b384-08ddae416d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 08:23:38.8575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e8ufcflp8qL8TgZ8z5g7hG+fdTvc0R/T9ErdJG2YKgYmAEOpBc8wprhCwOU37Z70lo+r9yhsqBh2xZDpQokQcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF7353C556D
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1478741806.1999407586"
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

--__=_Part_Boundary_009_1478741806.1999407586
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTA1LTE1IGF0IDE3OjM0ICswODAwLCBwYXVsLXBsLmNoZW4gd3JvdGU6DQo+
IEZyb206IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IE9VVFBST0Mg
aGFuZGxlcyB0aGUgcG9zdC1zdGFnZSBvZiBwaXhlbCBwcm9jZXNzaW5nIGluDQo+IHRoZSBvdmVy
bGFwcGluZyBwcm9jZWR1cmUuT1VUUFJPQyBtYW5hZ2VzIHBpeGVscyBmb3INCj4gZ2FtbWEgY29y
cmVjdGlvbiBhbmQgZW5zdXJlcyB0aGF0IHBpeGVsIHZhbHVlcyBhcmUNCj4gd2l0aGluIHRoZSBj
b3JyZWN0IHJhbmdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5saW5A
bWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsLXBsIENoZW4gPHBhdWwtcGwuY2hl
bkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArdm9pZCBtdGtfZGlzcF9vdXRw
cm9jX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCB3LA0KPiArCQkJICAg
ICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLA0KPiArCQkJICAgICB1bnNp
Z25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQ0KPiArew0KPiArCXN0cnVj
dCBtdGtfZGlzcF9vdXRwcm9jICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJdTMy
IHRtcDsNCj4gKw0KPiArCWRldl9kYmcoZGV2LCAiJXMtdzolZCwgaDolZFxuIiwgX19mdW5jX18s
IHcsIGgpOw0KPiArDQo+ICsJd3JpdGVsKChoIDw8IDE2KSB8IHcsIHByaXYtPnJlZ3MgKyBESVNQ
X1JFR19PVkxfT1VUUFJPQ19ST0lfU0laRSk7DQo+ICsNCj4gKwl0bXAgPSByZWFkbChwcml2LT5y
ZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfREFUQVBBVEhfQ09OKTsNCj4gKwl0bXAgPSAodG1w
ICYgfk9WTF9PVVRQUk9DX0RBVEFQQVRIX0NPTl9PVVRQVVRfQ0xBTVApIHwNCj4gKwkJICAoT1ZM
X09VVFBST0NfREFUQVBBVEhfQ09OX09VVFBVVF9DTEFNUCAmIE9WTF9PVVRQUk9DX0RBVEFQQVRI
X0NPTl9PVVRQVVRfQ0xBTVApOw0KDQpUaGlzIHdvdWxkIHNpbXBsaWZpZWQgYXMNCg0KdG1wIHw9
IE9WTF9PVVRQUk9DX0RBVEFQQVRIX0NPTl9PVVRQVVRfQ0xBTVA7DQoNCj4gKwl3cml0ZWwodG1w
LCBwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfREFUQVBBVEhfQ09OKTsNCj4gK30N
Cj4gKw0KPiArdm9pZCBtdGtfZGlzcF9vdXRwcm9jX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX2Rpc3Bfb3V0cHJvYyAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOw0KPiArCXVuc2lnbmVkIGludCB0bXA7DQo+ICsNCj4gKwl0bXAgPSByZWFkbChwcml2
LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfU0hBRE9XX0NUUkwpOw0KPiArCXRtcCA9IHRt
cCB8IE9WTF9PVVRQUk9DX0JZUEFTU19TSEFET1c7DQoNCnRtcCB8PSBPVkxfT1VUUFJPQ19CWVBB
U1NfU0hBRE9XOw0KDQo+ICsJd3JpdGVsKHRtcCwgcHJpdi0+cmVncyArIERJU1BfUkVHX09WTF9P
VVRQUk9DX1NIQURPV19DVFJMKTsNCj4gKw0KPiArCXdyaXRlbCgwLCBwcml2LT5yZWdzICsgRElT
UF9SRUdfT1ZMX09VVFBST0NfSU5UU1RBKTsNCg0KVG8gYWxpZ24gT1ZMIGRyaXZlciwgY2xlYXIg
aW50ZXJydXB0IHN0YXR1cyBpbiBlbmFibGVfdmJsYW5rKCkgZnVuY3Rpb24uDQoNCj4gKw0KPiAr
CXRtcCA9IHJlYWRsKHByaXYtPnJlZ3MgKyBESVNQX1JFR19PVkxfT1VUUFJPQ19FTik7DQo+ICsJ
dG1wID0gKHRtcCAmIH5PVkxfT1VUUFJPQ19PVkxfRU4pIHwgKE9WTF9PVVRQUk9DX09WTF9FTiAm
IE9WTF9PVVRQUk9DX09WTF9FTik7DQoNClRoaXMgd291bGQgYmUgc2ltcGxpZmllZCBhcw0KDQp0
bXAgfD0gT1ZMX09VVFBST0NfT1ZMX0VOOw0KDQpPbmUgcXVlc3Rpb24uIEluIG10a19kaXNwX291
dHByb2Nfc3RvcCgpLCB5b3Ugb3ZlcndyaXRlIHRoZSB3aG9sZSByZWdpc3RlciBvZiAgRElTUF9S
RUdfT1ZMX09VVFBST0NfRU4uDQpXaHkgaGVyZSBub3Qgb3ZlcndyaXRlIHRoZSB3aG9sZSByZWdp
c3Rlcj8NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwl3cml0ZWwodG1wLCBwcml2LT5yZWdzICsgRElT
UF9SRUdfT1ZMX09VVFBST0NfRU4pOw0KPiArfQ0KPiArDQo+ICt2b2lkIG10a19kaXNwX291dHBy
b2Nfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IG10a19kaXNwX291
dHByb2MgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKw0KPiArCXdyaXRlbCgwLCBw
cml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfRU4pOw0KPiArCXdyaXRlbChPVkxfT1VU
UFJPQ19SU1QsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19PVkxfT1VUUFJPQ19SU1QpOw0KPiArCXdy
aXRlbCgwLCBwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfUlNUKTsNCj4gK30NCj4g
Kw0KDQoNCg==

--__=_Part_Boundary_009_1478741806.1999407586
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDUtMTUmIzMyO2F0
JiMzMjsxNzozNCYjMzI7KzA4MDAsJiMzMjtwYXVsLXBsLmNoZW4mIzMyO3dyb3RlOg0KJmd0OyYj
MzI7RnJvbTomIzMyO05hbmN5JiMzMjtMaW4mIzMyOyZsdDtuYW5jeS5saW5AbWVkaWF0ZWsuY29t
Jmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPVVRQUk9DJiMzMjtoYW5kbGVzJiMzMjt0aGUmIzMy
O3Bvc3Qtc3RhZ2UmIzMyO29mJiMzMjtwaXhlbCYjMzI7cHJvY2Vzc2luZyYjMzI7aW4NCiZndDsm
IzMyO3RoZSYjMzI7b3ZlcmxhcHBpbmcmIzMyO3Byb2NlZHVyZS5PVVRQUk9DJiMzMjttYW5hZ2Vz
JiMzMjtwaXhlbHMmIzMyO2Zvcg0KJmd0OyYjMzI7Z2FtbWEmIzMyO2NvcnJlY3Rpb24mIzMyO2Fu
ZCYjMzI7ZW5zdXJlcyYjMzI7dGhhdCYjMzI7cGl4ZWwmIzMyO3ZhbHVlcyYjMzI7YXJlDQomZ3Q7
JiMzMjt3aXRoaW4mIzMyO3RoZSYjMzI7Y29ycmVjdCYjMzI7cmFuZ2UuDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3kubGlu
QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtQYXVsLXBsJiMz
MjtDaGVuJiMzMjsmbHQ7cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0t
LQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7K3ZvaWQmIzMyO210a19kaXNwX291dHByb2NfY29uZmln
KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7dywN
CiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7
aCwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO3ZyZWZyZXNoLA0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjticGMsJiMzMjtzdHJ1Y3QmIzMy
O2NtZHFfcGt0JiMzMjsqY21kcV9wa3QpDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7K3N0cnVjdCYj
MzI7bXRrX2Rpc3Bfb3V0cHJvYyYjMzI7KnByaXYmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShk
ZXYpOw0KJmd0OyYjMzI7K3UzMiYjMzI7dG1wOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2Rldl9k
YmcoZGV2LCYjMzI7JnF1b3Q7JXMtdzolZCwmIzMyO2g6JWQmIzkyO24mcXVvdDssJiMzMjtfX2Z1
bmNfXywmIzMyO3csJiMzMjtoKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt3cml0ZWwoKGgmIzMy
OyZsdDsmbHQ7JiMzMjsxNikmIzMyO3wmIzMyO3csJiMzMjtwcml2LSZndDtyZWdzJiMzMjsrJiMz
MjtESVNQX1JFR19PVkxfT1VUUFJPQ19ST0lfU0laRSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsr
dG1wJiMzMjs9JiMzMjtyZWFkbChwcml2LSZndDtyZWdzJiMzMjsrJiMzMjtESVNQX1JFR19PVkxf
T1VUUFJPQ19EQVRBUEFUSF9DT04pOw0KJmd0OyYjMzI7K3RtcCYjMzI7PSYjMzI7KHRtcCYjMzI7
JmFtcDsmIzMyOyYjMTI2O09WTF9PVVRQUk9DX0RBVEFQQVRIX0NPTl9PVVRQVVRfQ0xBTVApJiMz
Mjt8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyhPVkxfT1VUUFJPQ19EQVRBUEFUSF9DT05fT1VUUFVU
X0NMQU1QJiMzMjsmYW1wOyYjMzI7T1ZMX09VVFBST0NfREFUQVBBVEhfQ09OX09VVFBVVF9DTEFN
UCk7DQoNClRoaXMmIzMyO3dvdWxkJiMzMjtzaW1wbGlmaWVkJiMzMjthcw0KDQp0bXAmIzMyO3w9
JiMzMjtPVkxfT1VUUFJPQ19EQVRBUEFUSF9DT05fT1VUUFVUX0NMQU1QOw0KDQomZ3Q7JiMzMjsr
d3JpdGVsKHRtcCwmIzMyO3ByaXYtJmd0O3JlZ3MmIzMyOysmIzMyO0RJU1BfUkVHX09WTF9PVVRQ
Uk9DX0RBVEFQQVRIX0NPTik7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3Zv
aWQmIzMyO210a19kaXNwX291dHByb2Nfc3RhcnQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYp
DQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2Rpc3Bfb3V0cHJvYyYjMzI7
KnByaXYmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7K3Vuc2lnbmVk
JiMzMjtpbnQmIzMyO3RtcDsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt0bXAmIzMyOz0mIzMyO3Jl
YWRsKHByaXYtJmd0O3JlZ3MmIzMyOysmIzMyO0RJU1BfUkVHX09WTF9PVVRQUk9DX1NIQURPV19D
VFJMKTsNCiZndDsmIzMyOyt0bXAmIzMyOz0mIzMyO3RtcCYjMzI7fCYjMzI7T1ZMX09VVFBST0Nf
QllQQVNTX1NIQURPVzsNCg0KdG1wJiMzMjt8PSYjMzI7T1ZMX09VVFBST0NfQllQQVNTX1NIQURP
VzsNCg0KJmd0OyYjMzI7K3dyaXRlbCh0bXAsJiMzMjtwcml2LSZndDtyZWdzJiMzMjsrJiMzMjtE
SVNQX1JFR19PVkxfT1VUUFJPQ19TSEFET1dfQ1RSTCk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsr
d3JpdGVsKDAsJiMzMjtwcml2LSZndDtyZWdzJiMzMjsrJiMzMjtESVNQX1JFR19PVkxfT1VUUFJP
Q19JTlRTVEEpOw0KDQpUbyYjMzI7YWxpZ24mIzMyO09WTCYjMzI7ZHJpdmVyLCYjMzI7Y2xlYXIm
IzMyO2ludGVycnVwdCYjMzI7c3RhdHVzJiMzMjtpbiYjMzI7ZW5hYmxlX3ZibGFuaygpJiMzMjtm
dW5jdGlvbi4NCg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3RtcCYjMzI7PSYjMzI7cmVhZGwocHJp
di0mZ3Q7cmVncyYjMzI7KyYjMzI7RElTUF9SRUdfT1ZMX09VVFBST0NfRU4pOw0KJmd0OyYjMzI7
K3RtcCYjMzI7PSYjMzI7KHRtcCYjMzI7JmFtcDsmIzMyOyYjMTI2O09WTF9PVVRQUk9DX09WTF9F
TikmIzMyO3wmIzMyOyhPVkxfT1VUUFJPQ19PVkxfRU4mIzMyOyZhbXA7JiMzMjtPVkxfT1VUUFJP
Q19PVkxfRU4pOw0KDQpUaGlzJiMzMjt3b3VsZCYjMzI7YmUmIzMyO3NpbXBsaWZpZWQmIzMyO2Fz
DQoNCnRtcCYjMzI7fD0mIzMyO09WTF9PVVRQUk9DX09WTF9FTjsNCg0KT25lJiMzMjtxdWVzdGlv
bi4mIzMyO0luJiMzMjttdGtfZGlzcF9vdXRwcm9jX3N0b3AoKSwmIzMyO3lvdSYjMzI7b3Zlcndy
aXRlJiMzMjt0aGUmIzMyO3dob2xlJiMzMjtyZWdpc3RlciYjMzI7b2YmIzMyOyYjMzI7RElTUF9S
RUdfT1ZMX09VVFBST0NfRU4uDQpXaHkmIzMyO2hlcmUmIzMyO25vdCYjMzI7b3ZlcndyaXRlJiMz
Mjt0aGUmIzMyO3dob2xlJiMzMjtyZWdpc3RlciYjNjM7DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7
JiMzMjsrd3JpdGVsKHRtcCwmIzMyO3ByaXYtJmd0O3JlZ3MmIzMyOysmIzMyO0RJU1BfUkVHX09W
TF9PVVRQUk9DX0VOKTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrdm9pZCYj
MzI7bXRrX2Rpc3Bfb3V0cHJvY19zdG9wKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0
OyYjMzI7K3sNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19kaXNwX291dHByb2MmIzMyOypwcml2
JiMzMjs9JiMzMjtkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt3
cml0ZWwoMCwmIzMyO3ByaXYtJmd0O3JlZ3MmIzMyOysmIzMyO0RJU1BfUkVHX09WTF9PVVRQUk9D
X0VOKTsNCiZndDsmIzMyOyt3cml0ZWwoT1ZMX09VVFBST0NfUlNULCYjMzI7cHJpdi0mZ3Q7cmVn
cyYjMzI7KyYjMzI7RElTUF9SRUdfT1ZMX09VVFBST0NfUlNUKTsNCiZndDsmIzMyOyt3cml0ZWwo
MCwmIzMyO3ByaXYtJmd0O3JlZ3MmIzMyOysmIzMyO0RJU1BfUkVHX09WTF9PVVRQUk9DX1JTVCk7
DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRt
bD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29u
ZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1478741806.1999407586--

