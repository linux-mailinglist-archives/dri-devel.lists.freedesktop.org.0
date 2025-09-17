Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A5B7EDE6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11B610E3EF;
	Wed, 17 Sep 2025 01:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tkDdToKL";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Nb3dOtUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2514A10E3EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 01:16:12 +0000 (UTC)
X-UUID: e372fb88936311f0b33aeb1e7f16c2b6-20250917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=IU+hM5i3hOnqWcZqxz6w/2+OK39JtY9d7T7VkJK7C0s=; 
 b=tkDdToKLqnkPZ1veg5t5/E8DPDyLVGSHcP23VGAdF11RPzv4hWhKbfu8QdHfsP/w7/LqJ2aZC0S8nZOCHv4jMB62yycDkKDiZp/cXbfJ9OsoUrlxJZGEZInr3QY6/gFIxaxyCneKjXmsvWIbAaEhk+gvTXtVMObg66NKKfDgfbU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4, REQID:e8e0344c-aeae-458e-ba8b-d3475664af55, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:1ca6b93, CLOUDID:870add84-5317-4626-9d82-238d715c253f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836,TC:-5,Co
 ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
 COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e372fb88936311f0b33aeb1e7f16c2b6-20250917
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1530805588; Wed, 17 Sep 2025 09:16:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 17 Sep 2025 09:16:05 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 17 Sep 2025 09:16:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKDaLOkND6VHdxvjk1dkpH3BuH5S3ZBJ8gJHijJC0yQ4pdaX8IGChpLhfJ2uzOOQgnSxU+jY8E/Y1rLLd+3tAltojps/o49GDk135mT18V+C1tKBgoQNW3iinDc0wll90n6KTjIiBl9cDpH+yqc5wmGGfLN8GW3/IkMMEuGPWkqcKouJSpy7pvT1NRW3fcujVfSoTGqLzhOE06AAzcKPAte88di7My86fzYcFrqtMU7XSQ4Z14gIq5QvOLXyAyRnWsPn+mvgtSgVBVfu+ueawerDAfxQMuY4R3QV7DoCNrQmRSPPtldi41vFagvQfKOmMb56e/pb1enRnLjpDJzHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3u/wz/tNycHkTjIcIRyr3N56cIfHy/MzRaS4a1qwHr4=;
 b=W9M0CNcRLNrekAX8pD21cCvgraHJe9CgPMP3yDtkogkgpEAv1px541FsiaxaMsXC57qYo4+ON3UVwW9+J8JEzSICMsLZvCcPWRV42Nn2kBLdHLH2p0NlroYjZwCznFU8OS3XoSV9DENWZqKqewZTF0qKdiXx8inL1ufDlsw9lKJAwu2SX+eQ1znX13jjxrRJz4ELPSya7Uh58u/JebgGmaMUDvB0HE+M3bJoB37riU8wuYeAWe203rqwZHTYRMUtoHU4bwzq/GE0QGjYI+QQyjiZgRgLlC+VDYi5MpRj/tXO4NlXLKGZp8Qg231rpLRB053McGBNMfk9ltMdEMqfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3u/wz/tNycHkTjIcIRyr3N56cIfHy/MzRaS4a1qwHr4=;
 b=Nb3dOtUm9OapSfoaXHgTmVT0xAgxyXdj72pu6/9BwdAhOvepV+CwID40YhxjaPXPJh8n3rUgl3TjMekSuKVpTzY/WBFBskJNd5xYvXml8q/0Ciq7VRb74gVk2Pk5PwY1zLJE0NilB577rtwLq1dXscHSr5B71cquhglXvwl9vfY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OS8PR03MB8818.apcprd03.prod.outlook.com (2603:1096:604:28a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 01:16:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 01:16:02 +0000
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
Subject: Re: [PATCH v4 09/19] soc: mediatek: mutex: refactor SOF settings for
 output components
Thread-Topic: [PATCH v4 09/19] soc: mediatek: mutex: refactor SOF settings for
 output components
Thread-Index: AQHcF/M+VfWS+QEobkKuhJU0Tw9oo7SWsVyA
Date: Wed, 17 Sep 2025 01:16:02 +0000
Message-ID: <1f447d6a356ee1778185fbc8430ce72498f2f169.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-10-paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-10-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OS8PR03MB8818:EE_
x-ms-office365-filtering-correlation-id: e9c9a9fc-bbeb-4df9-618c-08ddf587c4aa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|42112799006|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MVhxUzYvVW56ZzdTMGlYdnJMZSt4UE41bGhla2RSZ3k4b1hKaDJsNGx1MXV1?=
 =?utf-8?B?cDdKM1doVW1paHVyWThxSG9jV2hlSVpDNjl4QjZtQTAyb2xSc3BneEdWbzVG?=
 =?utf-8?B?cGxFU1V4VVUrT0NhS2J6YWpza0pDZ2lpcDRySE5lbFZmeXJkV1VtbVBxWkxC?=
 =?utf-8?B?WXhMTEJnKzFKMnlMRFRkYUxBTy9rdFdqK0R1KzY1WGNGZDdoWGI0L3prSTI4?=
 =?utf-8?B?bUt6OENrQzBRQUtSSFFYOTlkd3dSVWo2ZDNRbWk4UkpOY09sb3c4K25ta0Nh?=
 =?utf-8?B?M1BmVGRJWDJoRUU4TDhsc25xalFabHNxMWFZUlhRNS96cy9xSFh6VWZseXlo?=
 =?utf-8?B?dDdNTVRiM05IaHhwV1MvUURhaWY2ckYybU5uMnB0T3dQQ3lUUDQxMSsyNlFY?=
 =?utf-8?B?R3ZpVTZQYmt5RVpRUjJrWGNMejhpZU5JVUMzcnM0Zy85eEZCSUVlNC9EL1pB?=
 =?utf-8?B?dktpZnM4cnRadEpRYmpzUVF0ZGowR2JFaHpOK2w3NnhQcUF3THpSWVdaUENy?=
 =?utf-8?B?UlQrTDgwY2VBZmdCWHowa0JsVkk1K252SDNveCtqUmt5Rk1Ia0hpNlJhN2xk?=
 =?utf-8?B?WmRZZkZkdVB0ZWwzcE01VGNaSTZtbDJ1alB0U0IyWnRzeEJ1ckVXdGV3OTZD?=
 =?utf-8?B?YzMxTHJJZHJhQm40Y2k1Mm5hbzU5MHFoSjJWMVB6MDB0OTlwbFc2QzFCNEhn?=
 =?utf-8?B?ZjRNSktKdTN1ZkdCNHgzU2JTdDF1NGtoUHl3ZUVtRktTcEQyZjFnMHhpYWVa?=
 =?utf-8?B?NHpuSURNaVFJTEN3ZC9EeEhsT1dybUlqUlpWNnp0aXBCZjRlZVpyK0lDRUZQ?=
 =?utf-8?B?eGpDT2k1dVU3NFJOZm1SMlEyZ2M1Qkl3dm1RaFcxL2RsbldqOXQzMGNFR2Fy?=
 =?utf-8?B?MDZFbEdSbHR2SXhUL1pLNkd2bXhZZDI5NkNXVTdrL3hteVl4VlZ0cG1WVHRS?=
 =?utf-8?B?VWFrTHQzdTdkNUQySkx5bVU5bjAwUGtCT0xid2tLbFNPTE41N094Mmdudzlx?=
 =?utf-8?B?Wmp1T3JQTlM5NlVtOEgzd1NzSzlYWE5uQmpKZHgyQ3BCbmh3aFlnRDRNSHRt?=
 =?utf-8?B?cFpjbHBpckhiVnRtWlpFYkFWbWtRZGVOM0REUEp1ejh3bUJhMi9XZ0d0ZzV1?=
 =?utf-8?B?N2loc0kzMTF4ZDBOSGRlNEFuMFBIVmQwKzVJUzJWYTlmNm0zR2ZSYW1ZSVE4?=
 =?utf-8?B?S3NOeWhHaTB3Y1FkZkNFdUp2MVR2K1BabGc5UUEwS2FKUVdqRG1MVTJ6RmxU?=
 =?utf-8?B?ZmMxSm5zSElWdXVETnFKbWtxZmlVZlVhOHl0YkN3NFFndjNIVGlKR29xWmk2?=
 =?utf-8?B?ei8wRVd0SHh4Qzk0anhFbVZITzVCNmRlSGZWWTlDSFd0L2JyWk9ZVzJjbytU?=
 =?utf-8?B?SDUzMC9ndWEvSXRYZjlXT05tRHliSGIrQmVnc0JxWS9FWkg1alhDNVpLSFhL?=
 =?utf-8?B?YXFxdWNCVkdSMVhLQkU2ZHJOQ3pNTDFOWk04MThMeVhxQmdMUHJxQlp0ako5?=
 =?utf-8?B?Q3hqbEl1NC9LTEFUWFQwTm1hQTdGeE12WG8yYjJqdExjc21SNnFUa2txTkJy?=
 =?utf-8?B?YXJFMEN4UlhiaDBaY1lXem4vbk8rLzFJRGNRUXlpZnlxM005dVNVbTQzdm5Z?=
 =?utf-8?B?ci9oLzZTNzY5d2ZrNE14QkRXQlZYd2FnS3lmUG1hSWx0YW9YMkRTRElBOW9U?=
 =?utf-8?B?Qm5JOUloSXh4OTNaZUxUSEpVbkdKUXJZc0dWOU5CTUxpRThrSFNBRmdkWmVG?=
 =?utf-8?B?RnpsVXQwbWNrWHJrMVRRZ0tmUkdPWFZyLzdsY01DdUgvQXNkaEYydFNpWGEx?=
 =?utf-8?B?OExmTWh3S2NJdDRlQTY2Wm5TRDRGYkl6aUZNTzNDL0JzRjNDQUtqcGZIUjRZ?=
 =?utf-8?B?VGRIdE5sbzQ4M1NxeURBazBKVHFiQmJvZUpta0RjczVXak9PTHpNT2lVd2Y0?=
 =?utf-8?B?cEVudUFVT0ZadnRReStKSUxXVTJLb1ZBY3RvbzZFb3Q1dFkxejlBVWNwT1BO?=
 =?utf-8?B?VnFRRFJmUzF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(7416014)(376014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDFTRDJWSTQ3dE1VTWVrcDc5blBseW85SjZQU1RMa1BJK1JmQjJDQmNNYTcw?=
 =?utf-8?B?NW9tSEEwQVZBTlh5WUxCZXVqMVpwWjQxR0pwTkVOZWNpQ2lVaHZEUzA4TXAw?=
 =?utf-8?B?OTBIQjU3bE1rbkZPZ1JqRVo2Wiszdyt6QlFCdEI3dEoxZGRObWo3NFM2Ri9R?=
 =?utf-8?B?alNGUkoxMlRxZU1RL3FMVGFyOGNzWTZSMHpPOEM5MVZlM2prbzJKb2pVM2RI?=
 =?utf-8?B?Z2d5QUhCenp0dFFsNFE4TlFYTnZJRlovWnJHUUVhTnpPQ0VnTzV0SUhrUjFX?=
 =?utf-8?B?c0l4aDdhZUxlbjVsNlRNV0ZXK3NGQkNPaGJnYlVtb2M5c01EUTg1a2N0bU1T?=
 =?utf-8?B?V0hxdFFZMmptK0FLeE8rcWl3M2FWK1N0dTlremhvUlBtUlJrNlk2UWdva0JK?=
 =?utf-8?B?TUhNeG03VjNHL3I0endSMmhDRHBzOW5TS1RvcUJ5d0hzcWQ1WTdtclYvWWll?=
 =?utf-8?B?czNXbU9ObnFNOGtaU0sxLzdIL0VsWFAyN1dQc0dvSTk0bWFjUmhFUTJtUVNt?=
 =?utf-8?B?UnZQOStNSHpSbzZBS29nWU9aN2NDai85dDlLaytGWXFXNTErUXBYOGI2ZThW?=
 =?utf-8?B?dm14OXJPVjFsRXgrWlpiOC9xazhzZFpVcUJmTGNSMFVlQjdONlNaY2lOdHI0?=
 =?utf-8?B?elFrSmdNcysxaithektHZ0JiN0RibXhkTGJ6U3Rnb09oRWgyenFYRklFV3BX?=
 =?utf-8?B?L1BWaSt6dFAyNnFsTmJXUE1SMnFFSlRMSG9MN2F0ZEpNR1lMdmxVTnl6VmNB?=
 =?utf-8?B?ZStsTU81QVBEZXI3MCtuR3FyZzRObnN3WkQwdUo1THl2ZERaOGdVNXpLM01C?=
 =?utf-8?B?Ui83THpmTW0xczR1RTJSaGlVbnZpbm9STmJqVncxNGZmUXJCTVRiY3hBVW5B?=
 =?utf-8?B?UlVNSFZ3ZDIvM3BWa1Nvc2RWVlpTNVJDL1VvdUR3NGVIN0xEcHFQSk9ZZE1m?=
 =?utf-8?B?bVdyRVltQUwrN1p3U25mWHpQcXR0eGpuQzRJeUhkNENqSGdGZHBZVU0wUEty?=
 =?utf-8?B?QlR0Y1ZaL1NOSWVqN1o1Q2RUWVZNbFRoSjJwclc0STZWdEd3NDI5dzZuY0hR?=
 =?utf-8?B?SWtIUkx2N25IeE52SGE3dkExOUtaNDh2Vmw5dFdtYlE5cmIwRmZoeVNWYWVC?=
 =?utf-8?B?c3d1dE1QN2xFNGI2WEpPdVllYTNrQWVwWU5mb3U2TEE4MzYrWFZzYlM0S0JS?=
 =?utf-8?B?Y2U5b3MxTVBUdVh4RllURmhocHN3NmhYcUUrTDhNNGk5VTJrUCszNnhCMnVu?=
 =?utf-8?B?akNJZUlkWThUa0xiQzR1Wks0cUttNldYM0swQnpOa3dMQjlyN1NYZ3JvQVBV?=
 =?utf-8?B?QlZpK2JSVFpXaUdIckxjQ1lSUXZ5QlRHSDlEaFd5OHpEc2pQRzE0dXgxRjFU?=
 =?utf-8?B?S2FIaHI2eEF2MzFVMGVvWEZPTnlpRVhiVXhhQTJLY1FRN0xOOTA2L1RwZGVz?=
 =?utf-8?B?UDlyL1AxTkI2U3M1WDFROGRQUXNsZW5kclVkdWppZjFKc0JDeWwvSXlTUTBx?=
 =?utf-8?B?dGRaV2YvZTFUY1RkTlJPUDZxbnZqTHdvTUl6cFhVUGNoZHRQVmM5ZlVtbllW?=
 =?utf-8?B?Wm9qbUNNdUticzlHMXB6emlwNVZOZHVQVVJlMzJCMVozR3UwNmlnd0J6YVdO?=
 =?utf-8?B?OXdadmRKbjlRWVpTdEdQdTZ6S0puZFQxYi9wVXNVSzluT245VTczNWlaMHdt?=
 =?utf-8?B?a2hFVDBmaFNvRFVDQXVQYVJLUnk3NGl2MkdvWE1RUUpjb2RMdGZQeVRCbHFk?=
 =?utf-8?B?V3crRkUzeEhhNWdhTE9OTlhVOWhMaXlBOU9jcXcyN2ZhbkZnOHlxUGEvc3hi?=
 =?utf-8?B?cys4bFhZNlF3d01iRjBRSDdxdE11a01aMFBrQUlodkFlWkxsTVR5cGpFWFJD?=
 =?utf-8?B?dWxONkN1MU5HWFROekEwU3RJUEc0MHlsMzZCejNwWHRTZ1doS1dzZFQ0aXB6?=
 =?utf-8?B?dzlFZ2V5ZFM2dnIwRjVEbjJtWU4xSWVQWHdFZU13Q3BRZXlWcXBobkFWMTZ1?=
 =?utf-8?B?dGlwZUw3M0RINS8vb3VwdE1HK2duUmRuRGtyOE81d1pQUnczVExJWmE3eVdz?=
 =?utf-8?B?UnY3VFBIVFJFd3V6R0F0ZXBvUytpbStSazg3ZHhRVVRaRGZtelcyS2RuZ2pF?=
 =?utf-8?Q?wkVhlkzakS4LSRG7zHnM+5O30?=
Content-ID: <B1BF963953F6D645B13DD30A3B8B8EB7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c9a9fc-bbeb-4df9-618c-08ddf587c4aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 01:16:02.5065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wtdLrVfpIMXvhrn2NDygX9dkLDvkflvqhpHR/s7aWl8kuuMPMdmIwU3qcm+PkTxc+grvo1lJE/Fy9UrnuXmRzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8818
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1077315446.1479331778"
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

--__=_Part_Boundary_004_1077315446.1479331778
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDE2OjA3ICswODAwLCBQYXVsIENoZW4gd3JvdGU6DQo+IEZy
b206IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gDQo+IFJlZmFj
dG9yIFNPRiBzZXR0aW5ncyBieSBhZGRpbmcgbXRrX211dGV4X2dldF9vdXRwdXRfY29tcF9zb2Yo
KQ0KPiBhbmQgZXh0cmFjdGluZyBTT0YgbG9naWMgZnJvbSBtdGtfbXV0ZXhfYWRkX2NvbXAoKQ0K
PiBhbmQgbXRrX211dGV4X3JlbW92ZV9jb21wKCkuDQoNClRpdGxlIGFscmVhZHkgdGVsbCB1cyBX
SEFUIG9mIHRoaXMgcGF0Y2ggYW5kIHBhdGNoIGNvbnRlbnQgYWxyZWFkeSB0ZWxsIHVzIEhPVyBv
ZiB0aGlzIHBhdGNoLg0KU28gaW4gY29tbWl0IG1lc3NhZ2UsIHRlbGwgdXMgV0hZIG9mIHRoaXMg
cGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsLXBsIENo
ZW4gPHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQo=

--__=_Part_Boundary_004_1077315446.1479331778
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDgtMjgmIzMyO2F0
JiMzMjsxNjowNyYjMzI7KzA4MDAsJiMzMjtQYXVsJiMzMjtDaGVuJiMzMjt3cm90ZToNCiZndDsm
IzMyO0Zyb206JiMzMjtQYXVsLXBsJiMzMjtDaGVuJiMzMjsmbHQ7cGF1bC1wbC5jaGVuQG1lZGlh
dGVrLmNvbSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVmYWN0b3ImIzMyO1NPRiYjMzI7c2V0
dGluZ3MmIzMyO2J5JiMzMjthZGRpbmcmIzMyO210a19tdXRleF9nZXRfb3V0cHV0X2NvbXBfc29m
KCkNCiZndDsmIzMyO2FuZCYjMzI7ZXh0cmFjdGluZyYjMzI7U09GJiMzMjtsb2dpYyYjMzI7ZnJv
bSYjMzI7bXRrX211dGV4X2FkZF9jb21wKCkNCiZndDsmIzMyO2FuZCYjMzI7bXRrX211dGV4X3Jl
bW92ZV9jb21wKCkuDQoNClRpdGxlJiMzMjthbHJlYWR5JiMzMjt0ZWxsJiMzMjt1cyYjMzI7V0hB
VCYjMzI7b2YmIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjthbmQmIzMyO3BhdGNoJiMzMjtjb250ZW50
JiMzMjthbHJlYWR5JiMzMjt0ZWxsJiMzMjt1cyYjMzI7SE9XJiMzMjtvZiYjMzI7dGhpcyYjMzI7
cGF0Y2guDQpTbyYjMzI7aW4mIzMyO2NvbW1pdCYjMzI7bWVzc2FnZSwmIzMyO3RlbGwmIzMyO3Vz
JiMzMjtXSFkmIzMyO29mJiMzMjt0aGlzJiMzMjtwYXRjaC4NCg0KUmVnYXJkcywNCkNLDQoNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1BhdWwtcGwmIzMyO0NoZW4mIzMy
OyZsdDtwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCg0KPC9w
cmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioq
KioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioq
KioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChp
bmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0
YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5k
ZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkg
dG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCAN
CmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50
KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3Ug
YXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUg
DQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwp
LCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBh
bnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRo
ZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEN
CjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_1077315446.1479331778--

