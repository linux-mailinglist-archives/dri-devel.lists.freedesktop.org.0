Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4419D09F4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 08:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360B610E1F9;
	Mon, 18 Nov 2024 07:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JHYPFywk";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Q6FnpnBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5370910E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 07:00:27 +0000 (UTC)
X-UUID: c0f79ffaa57a11efbd192953cf12861f-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=qKuPrc9N+ktn/x28NI9/bTj5XX+QOulbES7vG1Vmh18=; 
 b=JHYPFywk8lkyff1/7m3IGbqQ/aP/SM+QAWZF7jOygxdBWW+EMuEyXPorypEhK8sX3Pzoai2ikPO2oszQuT9R9bnC31ZzHv4HV8wV9N5q/ZdMvHlKKiROm3QPWSn403jO6iPsGNLkmnCElrOp6cjmtHCUQcm7yGONRjbFFWQmFWs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43, REQID:4113a979-d6d4-45ef-87e2-184243b98b21, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ce19b8a, CLOUDID:5921ce5c-f18b-4d56-b49c-93279ee09144,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c0f79ffaa57a11efbd192953cf12861f-20241118
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1551834937; Mon, 18 Nov 2024 15:00:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 15:00:05 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 15:00:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZOFRELFEkV4skqsnXJTLaNhRgsx2fzBiPe4f4Px8Ud4NCO14Y7EqT/M0ASrstFFj4S7UdbPGuj7nkzfhuh3OIZ5hEtAqPWAbted+hkIUngNyHe2481BnDlzcJqJN9nFuZ5i1G4AE9AHwCTD7hTGnOmL8eC6ycCmjwfVvwqCfhcVSyrrONUcOCrr+h+KP8xLeBeWgKGgmMfVXJ7EHi7OlxxWi1QE6rceSwrXXxjIAcaLjcwLHEw8mdUvKh/ILfHyQaYzGKdKjSWarQETeqQY/t7jnBpDgdxl2jL6DQq8r3qMq/gg3DUnQ1oImYE2p3105V7q4a5G6c16kmH4zNHejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deGeM9CSb4i1dVIAB9jlcSo+kPrcZT146Z2M89+8p6E=;
 b=vJpB6cCJkwC49DiduBERdXR5hN291aGLs8QA1npmw8gyhjho9I74vy24KQsBef1DG+y+byzLmC36toNkebJ5xCXDrnbZTIU69WHm7JsHdT+Z08r0rXEAesbXX3k2JkBag36A3qPIKn+mTYrmevf4Gney3e3zQRtWTOROUp3uK5t4q0vnZ1k0mRStc7bN58ddknX5qMN8jgRba8bJ2yxYqw5b3m22RK031WaJcqQB2oOZyoPdxb0FAXhmua7miwTcvPf4EJy0xaC4GJ2+r4+RF55/m2IhL7342yH4rI2vTDPen4mWTwMdigUAzhtoYU5NuPIuNqvGnQvNZleJ/BZ4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deGeM9CSb4i1dVIAB9jlcSo+kPrcZT146Z2M89+8p6E=;
 b=Q6FnpnBReTxFsffUxfaREKpNRA8FOls/lpno0aYfbdlU/vpgV5w+/ANTAu9qRjydeYGWOsRGW05lWKKOfMW0PMTgs8c6mX9LAhW9LHTsa+JliFhEiM8aKFLkaycXh/XCDoSI5UUWw2dYnuAoY/SMiH4JolcsBLYT6jjaw37BaSE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7831.apcprd03.prod.outlook.com (2603:1096:101:18a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 07:00:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 07:00:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "fshao@chromium.org"
 <fshao@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
Thread-Topic: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
Thread-Index: AQHbOWTep+mGnhKSk0OqoXPmeRs3lrK8nC+A
Date: Mon, 18 Nov 2024 07:00:02 +0000
Message-ID: <6c6780d849b205fc84969463240cf1cdf74bd80d.camel@mediatek.com>
References: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7831:EE_
x-ms-office365-filtering-correlation-id: 1856fbe2-1f20-4d47-e5ba-08dd079e9fb7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bTNKUzh3QW5vMjFrM3FOUlNjU1Z5dTdVQzlEWmMweFE3QW1UT0c5NW53L29R?=
 =?utf-8?B?dXlvSFZFcTRnRFZaKzJmUC9MZ1ZsejlBUjBlZFFBVmlSOERiejE0V2RnVk1D?=
 =?utf-8?B?ZHZ4blFoUWMrTllBNG1jbFNpM1QvUElwNzdyeldYSUVzK2hlRjc1aUtZWVJF?=
 =?utf-8?B?TFpyMUtMYUp4OHkzTUpvZTdwRFVnMWhtb0JLQXJtTjlQRzQzbHNRSnJHTjI1?=
 =?utf-8?B?bUdzdkpzbjZBNFdFQXg4TTZNVzNLNVhDT0w1UTFqS2ZZWGhERUkvbjdvQzY2?=
 =?utf-8?B?Ylhlc1ZuR2pmY2hicVJEcUk0WHJ4Q3dFNzlIazFoZ2N1OTdNUUkvS1NmVHNM?=
 =?utf-8?B?cHRFS0VjZmNhUkEwSmJXWXBLd3FPK2ovNE8vbjYxcG1FZ3JHUGE3c1pnb09q?=
 =?utf-8?B?RFp5aU5ZUE9yZ2w4NUZMY2JqczN2WlduTkNKN0VFNUJpMnp0d1JpczRaU1Fo?=
 =?utf-8?B?dWE1bmZTeWNOSFFiZkVTTVN1SkZYb2h0T3YweTFGRUFvWCtMOWszZWFkVXJY?=
 =?utf-8?B?TmxuaFhxdDlwSWNUT3JXMTM2ZFRQRTQ0OXFqZ3VLc0djakd5dDVFb1V1T2V6?=
 =?utf-8?B?ZnE2MStDQ0daT0NPY0pmSmxRMGNGTk1ueC9FcFhQTGpPaTFwbVNPcFpTTzRP?=
 =?utf-8?B?V1lVRVpocHNiZG85R3d2SThWZjk2ZWdvbmhOaFJncVdyNUtscjIxTTBWKzlx?=
 =?utf-8?B?RHczRk84WXZnNzdXcjgzR29XNnlXb0FGMklDREgwTXNBTkltSGZGanRmOElU?=
 =?utf-8?B?MnJ3eUMycFYxNUdHaXg2bnpqZ3I0MzBpK1J4V2dMZ3pDOXFSS1hNUnBMeFZ5?=
 =?utf-8?B?M1dTOGllWVc2M0FqUGwvdTZNNFp5S28xQW5ndmI3MTNxRDBuelRRUlZwWGFN?=
 =?utf-8?B?YUExRGxUem13amNNMGlmUkpWOTA0Q1A3TUxIdTZiaHdRMVRhT05QSDYxV2NI?=
 =?utf-8?B?WXlvcWZzWVQyVi8wOGRNcW1BQmt3VmF3a1g3V1JQUW0vV0FrRnVxNzdzWFd4?=
 =?utf-8?B?bUFHSlRYbGR0UWNLUnIwcGJadTlWbC9ZcVFaVTZMbGN2MGdqQ0ZkcTNMS2JP?=
 =?utf-8?B?UHNTN3ljQjFFcGxxTFpGUXdGTGJyQm4zVittTENlRGtXTW0vZFRuUCtxbjE1?=
 =?utf-8?B?WVprdFcwZGxKQnkxUGtERHJnbExyT3Q3eTNiWW85b0swb3gyaWUxdHQxeTBq?=
 =?utf-8?B?V0RFYkxDaU55T2puSG9aYnByWmlUbFV0ZDRQek55YWk2eXpSNWNHYi80VDJB?=
 =?utf-8?B?U0FFdzMyRE4wdWsrakNPZVhYNWJTTkZEVWNWaHllZWM2ME5mRkZLQVBBcXNI?=
 =?utf-8?B?anpWSi9Ra1pYSS9SY1ZsUWV1Zy96U2JIbXlLWHlRVU8yL3JaR1hPU05yeEtk?=
 =?utf-8?B?Um5vNzhFcitJclRjN1d3bUZaWUhHM1pYTS93N3doZUZEREVNZkxlNTNYa3k3?=
 =?utf-8?B?R3doUitkRW9UODVFcTZGeDVmVVRlSlc5K2dPeWkxbXI1eW4vdGNzc0hvWm9B?=
 =?utf-8?B?cVJuQ1VjT3BIZTgyd3REUUFVWXBQNEVLMnBUZWN1TDFWTlplcnFvRGZEUEtY?=
 =?utf-8?B?L01lc2FHMnA1eTNLN0c1a3RxYmQzRTVTcm83SVhzYThXWkw4N3lsWERVR0Vs?=
 =?utf-8?B?SDNVQmlmY1dWd3Erbi9iR09TSStEaU96SmtBN1V2TTNTR2M5TFpXM09FQnVX?=
 =?utf-8?B?SHJlQUlNNlRZaFlHcGorcHB6NUowKytJK2dLcVRhYnhJckJieUtGYlkrQnY3?=
 =?utf-8?B?bTZOd3B5TFR1QlZSMXlES2JUMXlkVFpoYWpiWkNCbUphay96RmZIODZYL3RY?=
 =?utf-8?Q?M/WL6OfC8JsffU502V4jMvc6O7Ez9VdHPZYCc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SURpLzdUdGVxMlJRd2prdGgzcjl3b01KcFAyWmZkMDA5WWs2b2pCSjZxM2hu?=
 =?utf-8?B?eFloNzMzR1dVZEJKa2hSZ1dSbXpJMCtJaHREU2g2em5RMjNWRGFkT1QzWmE0?=
 =?utf-8?B?OE9lR212VVNySjI1Nkk4ODZGcmtQR3NBcGhScFM1cEJ4RVE0cXpmMTdKQzlP?=
 =?utf-8?B?S3VocXBDbUdXUkhLOUhVd1p6ZWF1K21QUmRNVkRRalhRSk5FdWxnQ2FYMDJO?=
 =?utf-8?B?eGhndm9mR0pFMjRrMDY2YkY4VmRsOG50S0Rsck5XSVRhdU5YUkpNVzNuSXB5?=
 =?utf-8?B?NWNwaHU1UHM2eGk1THNOcUNlZDY1VDZKWCtsdTduempmcitGcE9PSHozVllJ?=
 =?utf-8?B?YUkrRnhtQ0NFb29xUm0rR3Q3SE9sbTNCalRIWDdzajdFRWVOWnpXdW9nblMz?=
 =?utf-8?B?MlN6bUFRbkdoNHJLYVhXVkpvZzZNWDB2NGtaZ3NNNloxQlFCKzJvemlTNGR1?=
 =?utf-8?B?dEJrNXdRTWo1UWdwbVQxUkJ4RGZ3REkvdTMrbTNieVFLZGVSTVl6cUE5Zno0?=
 =?utf-8?B?UjZIRkV3RXBwRmt2Y04yLzhLOGNGZC9OWk0rVFR3T2RUSWZjejJzVEJ2R3R6?=
 =?utf-8?B?MXl2N2FXNFBSL2JMbU1nWSs1SnR0am1IVThsK25GTFlGem8vODhYT05POFdL?=
 =?utf-8?B?UHk0MzdmdWRlQUFIUmpxRlZqU0hUYTVaVTlUU1luVUUzcUI5VHlsdlNnTCtV?=
 =?utf-8?B?ZE9ZVjBtbFcwZ0ZTb1NHWHNGaTI5UzN4Q0poUUxWbWFnaDV1YW1NWW5YRzNk?=
 =?utf-8?B?MXBRb1RqQ2NISHR2MXZYSGl4alUyMU1BNDhLeHF4VTVBeUNsVllVdWJ5RG01?=
 =?utf-8?B?RmNNZUI4NTZzMUwxcStPcE1WNTBtTFZFa2VJNE9NeGMxemRQaTN0SW0wdjBO?=
 =?utf-8?B?T0t5WjRsQnJnZm5jMzdDRkhwVUhveXk5d2l2QXpoNW9PNFkzY0hGRHFxT1Jl?=
 =?utf-8?B?NjhNeWpkMzErdmtSZEpaTXVtdlFHdngwYjUzS1c0MmRuaC9jbS82R0piOVpG?=
 =?utf-8?B?RitJTk5MK2h3WkJRNmpNVWpXTFcrVTlRdHVOaDE5UDJib3RuYmpWK0pPNXBO?=
 =?utf-8?B?S0lXbmNndlMraVRsTHROYWhDdCs1cmRldmZCQ01kbXBtOFNCMUpxcmQyeDBo?=
 =?utf-8?B?a2xkR3Q0a0U2RXJqQkVwVFFGeG16SVl4em1PN0N1bGVFR2s1UW5xTFJSQmpI?=
 =?utf-8?B?NUlZWGxZc0RBZS9HNTdzN3hVN0ZoWUhNK1hleDdaTmFpWnREWE12azAxampu?=
 =?utf-8?B?UytvaU96Wm5OZU9nSGx5cU1TSUJJTHVpc2JsdlI0ZHBOMW54Z1lZdERMcThV?=
 =?utf-8?B?Z2EwZnNDMkdKVU5aUEFQbHBvOXFKa0hXUTFqbExOaERjV1J2WXZpQ3BXTlZl?=
 =?utf-8?B?WmZUQTVpcTNYWE00WUdwVHBPOFZhNnFXRGlJbXcvRkFEME5aSzAwM3c1eENv?=
 =?utf-8?B?VmIrbjJvMDBhNjluTFZLYVI3RU44SnNZSUh0OERIMkY4N2FNTzAra3Z4K2dS?=
 =?utf-8?B?QUZzL1FERWJkZ1d2Vy9CTUpqU0sxWGwwSjE4MU9MRmZMMUlSOGNUYVo3VDNh?=
 =?utf-8?B?MGxHMXV3K3N3UmVENG4rcTVVVWgzWnY3dTY2dTNDUVh5OGJUY0tveklocHda?=
 =?utf-8?B?RFJxejU1cHJlR1NydkxIcHF3YlVtalQvUkJuZGYrb1o2TmVuQzBvbWpucXFT?=
 =?utf-8?B?TUJuVEE4TVVlYklFSm9yTjJETmNLdUpZUWdvOVg5N3V3ZHMrVzJMSSsvL1Iz?=
 =?utf-8?B?MEtiSUpkaERMQjEyNnJqTkoyOWwveVJ0RFZMUW1uSmc2eWg3dnNPOUU3aWJ1?=
 =?utf-8?B?T3lsd28xaFRWNmhlWVdIaFdLVXB0bytSRUNsL1BQcDF6cnhySm1sY0t6SlFw?=
 =?utf-8?B?dnFaRkNIREVPYkxuTVQ1UkcxL3lOcjhpR3lSODgwVFBYUFUrREVEZ0hRa3Nx?=
 =?utf-8?B?R09CblVxajJSNThEMytCSGdiV1Fiazlyb0pDR2s5bkwzSEFFeHZuZ1FqTHp6?=
 =?utf-8?B?KytMeWhMb0xnYUNsOW4rOG12anVkcSsxWmpyZ2pRVzhlbHBZM3Z0VVBDaWIy?=
 =?utf-8?B?OXFmS2ZydWdZKzBwQXBwbjZZb0pBTkxXRTVHaXR6RVVIb0NSaFc4dlF0a0dl?=
 =?utf-8?Q?6O1QLjFtPTRVdOZicVGZvl12M?=
Content-ID: <6180AA7D4977874FA14CC1F535032CC9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1856fbe2-1f20-4d47-e5ba-08dd079e9fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 07:00:02.1707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SjVP0bdKuCsQyo6s2r3uwjGyDYvJhJ7Ch2zGhNf8DAyFYeA8/M7CJuRBLTZHv9otUqQo03d1R9c9we6eU0ax5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7831
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_370732687.1716668510"
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

--__=_Part_Boundary_006_370732687.1716668510
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBNb24sIDIwMjQtMTEtMTggYXQgMTA6NTEgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gbWVkaWF0ZWstZHJtIGRyaXZlciByZXBvcnRlZCB0aGUgY2FwYWJpbGl0
eSBvZiAxODAtZGVncmVlIHJvdGF0aW9uIGJ5DQo+IGFkZGluZyBgRFJNX01PREVfUk9UQVRFXzE4
MGAgdG8gdGhlIHBsYW5lIHByb3BlcnR5LCBhcyBmbGlwLXggY29tYmluZWQNCj4gd2l0aCBmbGlw
LXkgZXF1YWxzIGEgMTgwLWRlZ3JlZSByb3RhdGlvbi4gSG93ZXZlciwgd2UgZGlkIG5vdCBoYW5k
bGUNCj4gdGhlIHJvdGF0aW9uIHByb3BlcnR5IGluIHRoZSBkcml2ZXIgYW5kIGxlYWQgdG8gcm90
YXRpb24gaXNzdWVzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4N
Cg0KPiANCj4gRml4ZXM6IDc0NjA4ZDhmZWVmZCAoImRybS9tZWRpYXRlazogQWRkIERSTV9NT0RF
X1JPVEFURV8wIHRvIHJvdGF0aW9uIHByb3BlcnR5IikNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24t
SkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDEyICsrKysrKysrKystLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGluZGV4IGUwYzBiYjAxZjY1YS4uY2M4
MjVjNGYyZTA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
DQo+IEBAIC00NzIsNiArNDcyLDcgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJdW5zaWduZWQgaW50IGhkcl9waXRj
aCA9IHBlbmRpbmctPmhkcl9waXRjaDsNCj4gIAl1bnNpZ25lZCBpbnQgZm10ID0gcGVuZGluZy0+
Zm9ybWF0Ow0KPiAgCXVuc2lnbmVkIGludCBvZmZzZXQgPSAocGVuZGluZy0+eSA8PCAxNikgfCBw
ZW5kaW5nLT54Ow0KPiArCXVuc2lnbmVkIGludCByb3RhdGlvbiA9IHBlbmRpbmctPnJvdGF0aW9u
Ow0KPiAgCXVuc2lnbmVkIGludCBzcmNfc2l6ZSA9IChwZW5kaW5nLT5oZWlnaHQgPDwgMTYpIHwg
cGVuZGluZy0+d2lkdGg7DQo+ICAJdW5zaWduZWQgaW50IGJsZW5kX21vZGUgPSBzdGF0ZS0+YmFz
ZS5waXhlbF9ibGVuZF9tb2RlOw0KPiAgCXVuc2lnbmVkIGludCBpZ25vcmVfcGl4ZWxfYWxwaGEg
PSAwOw0KPiBAQCAtNTEzLDEyICs1MTQsMTkgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJCQlpZ25vcmVfcGl4ZWxf
YWxwaGEgPSBPVkxfQ09OU1RfQkxFTkQ7DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKHBlbmRpbmctPnJv
dGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9ZKSB7DQo+ICsJLyoNCj4gKwkgKiBUcmVhdCByb3Rh
dGUgMTgwIGFzIGZsaXAgeCArIGZsaXAgeSwgYW5kIFhPUiB0aGUgb3JpZ2luYWwgcm90YXRpb24g
dmFsdWUNCj4gKwkgKiB0byBmbGlwIHggKyBmbGlwIHkgdG8gc3VwcG9ydCBib3RoIGluIHRoZSBz
YW1lIHRpbWUuDQo+ICsJICovDQo+ICsJaWYgKHJvdGF0aW9uICYgRFJNX01PREVfUk9UQVRFXzE4
MCkNCj4gKwkJcm90YXRpb24gXj0gRFJNX01PREVfUkVGTEVDVF9YIHwgRFJNX01PREVfUkVGTEVD
VF9ZOw0KPiArDQo+ICsJaWYgKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9ZKSB7DQo+ICAJ
CWNvbiB8PSBPVkxfQ09OX1ZJUlRfRkxJUDsNCj4gIAkJYWRkciArPSAocGVuZGluZy0+aGVpZ2h0
IC0gMSkgKiBwZW5kaW5nLT5waXRjaDsNCj4gIAl9DQo+ICANCj4gLQlpZiAocGVuZGluZy0+cm90
YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1gpIHsNCj4gKwlpZiAocm90YXRpb24gJiBEUk1fTU9E
RV9SRUZMRUNUX1gpIHsNCj4gIAkJY29uIHw9IE9WTF9DT05fSE9SWl9GTElQOw0KPiAgCQlhZGRy
ICs9IHBlbmRpbmctPnBpdGNoIC0gMTsNCj4gIAl9DQo=

--__=_Part_Boundary_006_370732687.1716668510
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO01vbiwmIzMy
OzIwMjQtMTEtMTgmIzMyO2F0JiMzMjsxMDo1MSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7bWVkaWF0ZWstZHJtJiMzMjtkcml2ZXImIzMyO3JlcG9ydGVk
JiMzMjt0aGUmIzMyO2NhcGFiaWxpdHkmIzMyO29mJiMzMjsxODAtZGVncmVlJiMzMjtyb3RhdGlv
biYjMzI7YnkNCiZndDsmIzMyO2FkZGluZyYjMzI7JiM5NjtEUk1fTU9ERV9ST1RBVEVfMTgwJiM5
NjsmIzMyO3RvJiMzMjt0aGUmIzMyO3BsYW5lJiMzMjtwcm9wZXJ0eSwmIzMyO2FzJiMzMjtmbGlw
LXgmIzMyO2NvbWJpbmVkDQomZ3Q7JiMzMjt3aXRoJiMzMjtmbGlwLXkmIzMyO2VxdWFscyYjMzI7
YSYjMzI7MTgwLWRlZ3JlZSYjMzI7cm90YXRpb24uJiMzMjtIb3dldmVyLCYjMzI7d2UmIzMyO2Rp
ZCYjMzI7bm90JiMzMjtoYW5kbGUNCiZndDsmIzMyO3RoZSYjMzI7cm90YXRpb24mIzMyO3Byb3Bl
cnR5JiMzMjtpbiYjMzI7dGhlJiMzMjtkcml2ZXImIzMyO2FuZCYjMzI7bGVhZCYjMzI7dG8mIzMy
O3JvdGF0aW9uJiMzMjtpc3N1ZXMuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsm
bHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0ZpeGVzOiYj
MzI7NzQ2MDhkOGZlZWZkJiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtEUk1f
TU9ERV9ST1RBVEVfMCYjMzI7dG8mIzMyO3JvdGF0aW9uJiMzMjtwcm9wZXJ0eSZxdW90OykNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5s
aW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7fCYjMzI7MTImIzMyOysrKysrKysr
KystLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MTAmIzMyO2lu
c2VydGlvbnMoKyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7
ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYj
MzI7aW5kZXgmIzMyO2UwYzBiYjAxZjY1YS4uY2M4MjVjNGYyZTA5JiMzMjsxMDA2NDQNCiZndDsm
IzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZn
dDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMN
CiZndDsmIzMyO0BAJiMzMjstNDcyLDYmIzMyOys0NzIsNyYjMzI7QEAmIzMyO3ZvaWQmIzMyO210
a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dW5zaWdu
ZWQmIzMyO2ludCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjto
ZHJfcGl0Y2gmIzMyOz0mIzMyO3BlbmRpbmctJmd0O2hkcl9waXRjaDsNCiZndDsmIzMyOyYjMzI7
dW5zaWduZWQmIzMyO2ludCYjMzI7Zm10JiMzMjs9JiMzMjtwZW5kaW5nLSZndDtmb3JtYXQ7DQom
Z3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO29mZnNldCYjMzI7PSYjMzI7KHBlbmRp
bmctJmd0O3kmIzMyOyZsdDsmbHQ7JiMzMjsxNikmIzMyO3wmIzMyO3BlbmRpbmctJmd0O3g7DQom
Z3Q7JiMzMjsrdW5zaWduZWQmIzMyO2ludCYjMzI7cm90YXRpb24mIzMyOz0mIzMyO3BlbmRpbmct
Jmd0O3JvdGF0aW9uOw0KJmd0OyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtzcmNfc2l6
ZSYjMzI7PSYjMzI7KHBlbmRpbmctJmd0O2hlaWdodCYjMzI7Jmx0OyZsdDsmIzMyOzE2KSYjMzI7
fCYjMzI7cGVuZGluZy0mZ3Q7d2lkdGg7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQm
IzMyO2JsZW5kX21vZGUmIzMyOz0mIzMyO3N0YXRlLSZndDtiYXNlLnBpeGVsX2JsZW5kX21vZGU7
DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2lnbm9yZV9waXhlbF9hbHBoYSYj
MzI7PSYjMzI7MDsNCiZndDsmIzMyO0BAJiMzMjstNTEzLDEyJiMzMjsrNTE0LDE5JiMzMjtAQCYj
MzI7dm9pZCYjMzI7bXRrX292bF9sYXllcl9jb25maWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypk
ZXYsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtpZHgsDQomZ3Q7JiMzMjsmIzMyO2lnbm9yZV9w
aXhlbF9hbHBoYSYjMzI7PSYjMzI7T1ZMX0NPTlNUX0JMRU5EOw0KJmd0OyYjMzI7JiMzMjt9DQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LWlmJiMzMjsocGVuZGluZy0mZ3Q7cm90YXRpb24mIzMy
OyZhbXA7JiMzMjtEUk1fTU9ERV9SRUZMRUNUX1kpJiMzMjt7DQomZ3Q7JiMzMjsrLyoNCiZndDsm
IzMyOysmIzMyOyomIzMyO1RyZWF0JiMzMjtyb3RhdGUmIzMyOzE4MCYjMzI7YXMmIzMyO2ZsaXAm
IzMyO3gmIzMyOysmIzMyO2ZsaXAmIzMyO3ksJiMzMjthbmQmIzMyO1hPUiYjMzI7dGhlJiMzMjtv
cmlnaW5hbCYjMzI7cm90YXRpb24mIzMyO3ZhbHVlDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjt0byYj
MzI7ZmxpcCYjMzI7eCYjMzI7KyYjMzI7ZmxpcCYjMzI7eSYjMzI7dG8mIzMyO3N1cHBvcnQmIzMy
O2JvdGgmIzMyO2luJiMzMjt0aGUmIzMyO3NhbWUmIzMyO3RpbWUuDQomZ3Q7JiMzMjsrJiMzMjsq
Lw0KJmd0OyYjMzI7K2lmJiMzMjsocm90YXRpb24mIzMyOyZhbXA7JiMzMjtEUk1fTU9ERV9ST1RB
VEVfMTgwKQ0KJmd0OyYjMzI7K3JvdGF0aW9uJiMzMjsmIzk0Oz0mIzMyO0RSTV9NT0RFX1JFRkxF
Q1RfWCYjMzI7fCYjMzI7RFJNX01PREVfUkVGTEVDVF9ZOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
K2lmJiMzMjsocm90YXRpb24mIzMyOyZhbXA7JiMzMjtEUk1fTU9ERV9SRUZMRUNUX1kpJiMzMjt7
DQomZ3Q7JiMzMjsmIzMyO2NvbiYjMzI7fD0mIzMyO09WTF9DT05fVklSVF9GTElQOw0KJmd0OyYj
MzI7JiMzMjthZGRyJiMzMjsrPSYjMzI7KHBlbmRpbmctJmd0O2hlaWdodCYjMzI7LSYjMzI7MSkm
IzMyOyomIzMyO3BlbmRpbmctJmd0O3BpdGNoOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsm
IzMyOw0KJmd0OyYjMzI7LWlmJiMzMjsocGVuZGluZy0mZ3Q7cm90YXRpb24mIzMyOyZhbXA7JiMz
MjtEUk1fTU9ERV9SRUZMRUNUX1gpJiMzMjt7DQomZ3Q7JiMzMjsraWYmIzMyOyhyb3RhdGlvbiYj
MzI7JmFtcDsmIzMyO0RSTV9NT0RFX1JFRkxFQ1RfWCkmIzMyO3sNCiZndDsmIzMyOyYjMzI7Y29u
JiMzMjt8PSYjMzI7T1ZMX0NPTl9IT1JaX0ZMSVA7DQomZ3Q7JiMzMjsmIzMyO2FkZHImIzMyOys9
JiMzMjtwZW5kaW5nLSZndDtwaXRjaCYjMzI7LSYjMzI7MTsNCiZndDsmIzMyOyYjMzI7fQ0KDQo8
L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+Kioq
KioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioq
KioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1
bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25s
eSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24s
IA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGll
bnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2
ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFp
bCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2Ug
dGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91
IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_370732687.1716668510--

