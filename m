Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD0AB596E
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 18:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C8F10E167;
	Tue, 13 May 2025 16:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZD1BfDTe";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="e11g6n5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA3310E167
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 16:11:48 +0000 (UTC)
X-UUID: f6c72518301411f0813e4fe1310efc19-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=U2QFsUgLVROJKmSuaVps5oKUerCfjgv8pGJn7++zB8c=; 
 b=ZD1BfDTeRi23BIkdzT3wP3IuteXrmL1GzCHbfIaE7qiV4Fg4g86Vj53/1XwS3ZvNBtw/7Bw7FisM6Eyil8vrFin56YKZpS8qhz8Q8P8NPcxVua3NJv20Yyj/PmC3zk6+XEV1bNOCRZwdSd697SYkl02AFcfNmBn0WlEdbZ7j9wI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:0ce44630-e438-45cb-ad42-0d4a9a392c14, IP:0,
 UR
 L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:2
X-CID-META: VersionHash:0ef645f, CLOUDID:fc4c7b51-76c0-4e62-bb75-246dfb0889c6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:4|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f6c72518301411f0813e4fe1310efc19-20250514
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1917769396; Wed, 14 May 2025 00:11:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 14 May 2025 00:11:42 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 14 May 2025 00:11:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb3XTI0OImiEHYkBIGvxBfunjZYLInn9jkxNYO6A/OmXKv//hpejZUGmfO466FT0PBpBebB6VEIRvbLmcqA+usGDzXn1868MssgNL572aGLYr8YmO8e0zSmIq9X3lWI9rgIxXaTLIhgb1rP3b9lJW62khf1f7RD2LB4LjtBxNXpQnjrvS0UBDbKwUOOWXafetxFQaRqo/lb7GJLyu84I36c4PK/Q4zapzUK2rgi1YG8vu0yWrwYKXqSS/XTd/AarQPy0tgIg7mlQsaUfTOlyslv70dBURpPAXu5CMa7UzQIOlOi+22XIzftFS4zD1EgzVA/IdQQ9ibbRDc9RL3bNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaPSAehZzSVf7VOBn+zkWhkwoLUZr0p4ed0mpEH0wAg=;
 b=XjFwKsrMfkqGI666D1b8dviMHw7QbBdCzvIpgQaibf2rLDnzZmEw/MLbvN36wfRI4HLjs8ge+c0WZmz8x9usUUNA4N4MbafSJt9CCu1YrAHI1n+HLs+NpVc/W74m2+zQYOlTdJRos93nKO4uHrZ+Prv3s2ZdyHgRNJhNo0x0CBF7aUz8nlKi7c0tnzfOYDrHGAnzU0aBUcFDUvRaF8VJk+qn4no4Exs7RIrBcSY9VFCK4yWle56wS3DrChi5mOhlZFrtAvHbM6oovFrbT+7TxPrZcM8D9HORwsV9iqt1cUZXG5S/2iPDMO/gobnekSbEvoKwKraWQhwHEumx/9aGEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaPSAehZzSVf7VOBn+zkWhkwoLUZr0p4ed0mpEH0wAg=;
 b=e11g6n5CwATJsjUzV0pgYPw1x3qRgjfZoAploiosD1yuEO73sr4yznsgelhsfvlVkmQZCSkM7cGj9Rl7Qg0PSnzSaAxcGOcpBogxLMJeAQkDM6/olePEMRwJqRg2XOitpRdr/HUsrrVHk4JSrpN0gPJMIck4iUxwZFqBSjsgPEs=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 TY1PPF4D0176D00.apcprd03.prod.outlook.com (2603:1096:408::a53) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Tue, 13 May 2025 16:11:39 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 16:11:38 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?=
 <Sunny.Shen@mediatek.com>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
 <Sirius.Wang@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 14/15] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Thread-Topic: [PATCH v2 14/15] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Thread-Index: AQHbmkTEVma8fTY0uk2QHt27Jr/h3bODPASAgE3S2oA=
Date: Tue, 13 May 2025 16:11:38 +0000
Message-ID: <a917b57f4392e1cba5798d97da4c4b24f1a5e990.camel@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-15-paul-pl.chen@mediatek.com>
 <6bf9d4b3e060461ec491a3703d7ba952f9c5dceb.camel@mediatek.com>
In-Reply-To: <6bf9d4b3e060461ec491a3703d7ba952f9c5dceb.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|TY1PPF4D0176D00:EE_
x-ms-office365-filtering-correlation-id: 783a5f7e-6359-4b5a-27a6-08dd9238d76d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Ym43VDVzM1FNNFdUUldWL2VCSmRRTkZJbTZDSDd5TGFZNGNuUW1mYVhESlpl?=
 =?utf-8?B?YkNDUWs2NTN1WUxlV1ArVnREZ2dwSEpxYlcyOGlkTG9LbVpKNENpUTI2OW1w?=
 =?utf-8?B?d21yZUpTUDRwRS9UaG40SW9qVUgxemxsUm9GSkRVcXlSK05oSHRTSGNUMUNt?=
 =?utf-8?B?Yno2TlBVcFlwelM2Y1U0am1JbSsvU1gzaElIVkJUMWpac0pQUVFuZTdLeTJN?=
 =?utf-8?B?d3NwSnpqZlFlRDNtMEExRzBsd05NdW5tSlVHNDBKNTJIMzZhVE1GRGFqdmdR?=
 =?utf-8?B?SUJtR0xCR3lXekUxWHlZN2IreTJDNk51VjdSMXFJNGdoRGU5YnhGaXJ5V1FH?=
 =?utf-8?B?T1JjWlF3NDQ2WXNBK1BJd1o2TUFlbzduNlRTQVhkN25JbXZ1d1F1QlB6cTJl?=
 =?utf-8?B?Y096WHA3Mlp4aExrWHJJY0FQK0J3VFN0Wjk0d0I4NEdNYUVjeEN0N00za0dL?=
 =?utf-8?B?MnVTU2FDUEUvU0g5Nk9NZ1FjWlNqZFNwWlhQRm0zWkU1OElkdUlNcGplTnF1?=
 =?utf-8?B?Tkhrbm9ja0hWUm1ZUWNadEtTOTdKU3FJUSthOHc2K2pQMEpHSWJWVGpodTZh?=
 =?utf-8?B?MDdrV0M4RDNZUnk0eXMrRGJwT2NMRCtlYWtGRjZRT0dRb1hNa1crSFpRb0VM?=
 =?utf-8?B?enc0cUEydG1SRG5MZFRDVWt6RzB3WDIrU1N5RENWV2xuU1F6cSsrU29xNFN2?=
 =?utf-8?B?K05JWitTV0ZlNDZodGJBeEplV1d2WU51dms2OW5CWHN6RzQyblVaNnFSdWJk?=
 =?utf-8?B?eUZoWkNDM0JoSExZZ01yamVxSjlYSU5hZ1lRK3RXK29RNThQUmlWV3d4UENW?=
 =?utf-8?B?U0hIV2RqbWFONnJ2R0p4M0psejFTV21SMXc4eFNtWkI0bjBZejRTd2MwWEdW?=
 =?utf-8?B?MkJYWDc2WENZNy9nMHJzSFY1MU1wbFlxeGw3ZVUwY2R5WFVkSkE5QVl5ZlMx?=
 =?utf-8?B?YitQQU9UaFZLVnFzTWFWMlJnem1STit1eUlsVnNsV05aaC9ERktQdDRRUFJS?=
 =?utf-8?B?Y3hXM0VvKzlueUdSTG4vdkNZbHFLT3VRcHNVdE13SFNiUGY2THBQQU4rNjk4?=
 =?utf-8?B?cStDMVNKT29obE9RaWN2Qm02S2RZallTZ0NlV3FuTkwycTV6ZmpQWm84c3h1?=
 =?utf-8?B?eW00TkdQVGRKWHJGZnh2VzBTYVJpRFI1Q1pSK01XblY0QTB5eVYxMFovSllH?=
 =?utf-8?B?bTRaYWxvYmhqR08yVXBjWmIvRTR4V1V0TlB6NTF2dlhkeVp0a0JQaG12VXpD?=
 =?utf-8?B?M3NQbWJFdVhGK1VlQWxZRDV5N24zWjRRSU9aODZzdEFPUkFueWw0WUJHTGVK?=
 =?utf-8?B?T3M3TW5SOWhoSXkzcXdYRDFUdGNwcERzMEpGTXRCMldsSlRaS3R2WEUvK1kv?=
 =?utf-8?B?Q1kvUzN3aVEvdFBrSkorYlJ1bFVTRDBkQXFQcXp0ak9vT3hlWWRtZmdPc1Bl?=
 =?utf-8?B?Y0hxRTRQZmpQTlZscUsvMkVqWENYSTNEQ0ZJbGxkVUszcHhFcjBBU1E1d1hy?=
 =?utf-8?B?V0dFdXRQamY1bTg0QmVFQXdFWjdWWUY5cmtpaitxb08zSmV2SXVPUUVZMjY5?=
 =?utf-8?B?NHdGOFZOa2ZIdUFuMEhPR25IaDZERHZTVHdpWW15NGxlY1UraWxmWGI2c0Rm?=
 =?utf-8?B?cWRKMzg3MVhsNW9uWm94Tlp1Sis5Zzl2b0lBcjVyaHNMbDFiL3ptT3M5WWpt?=
 =?utf-8?B?UnVtT21sRC9XbkRseHQwVmpPbm9UZVhaRW1FZ0RsL1AxZklmRkJKSHRzMVpi?=
 =?utf-8?B?ZE1JM3JKb1ZKV3dBVUxIa1A1eVRRdlB0Y09qUVVaUXQvOTF3Y25nNDhVUUxO?=
 =?utf-8?B?dWlLVStCYTh4RXBMV1ZVWVlySWJxR1hRai9ycSs5ZGJEN2JzVlF0ZUtWaWJS?=
 =?utf-8?B?QWtBTFArdGo3YjRwNThJcWZvcU9RU2w1TTJoT2U5VnJwM29qZXM1ZlF3N1NS?=
 =?utf-8?B?cGtFVERkRFU0UW1OWDU1eUFGTGhzeks4YkRJeUJlbGxseW15MHhGdkpxR21i?=
 =?utf-8?B?OVFub1UxVTB3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anE1ZXp0WWRsNmdQY3ZlTDZyblA5M3YxMk12dmFrVDRHc3VlM1RWbTZIdE01?=
 =?utf-8?B?b2J0aHdHR1dJNFdGTGZHeXVER2tiVWpDRm5uT0ZPTnhpWkswKzFCeUQ5ZEdY?=
 =?utf-8?B?dE1JeFdZVFhBY2ZQT0JsRi8wdW9jak5CaGJHbzVpWFFEUFpKSFc5WVZvNTV0?=
 =?utf-8?B?S1ljYkRVc2VCZ05BNGg0eU90RW5GUlJkS3NWWTd3T2RPd3ZWcE1WSUhWVlUv?=
 =?utf-8?B?U2VrdERIeHFZaU5xVFJJSi9hdEdSSGdZVFFGQ2x1Ym5KSlZzOTFRVmpDTys3?=
 =?utf-8?B?ZGltYThKWExKaDRLQ1J1Ykg5MUE0K3hwZ2xlMUIxSGFnN2hic1lUMGxNanJU?=
 =?utf-8?B?RVV6d21iazg1KzloK2NjSUJud2l4OVNDNlZDL2pxc0ZKNnlTbU82Lyt3K0xl?=
 =?utf-8?B?UHRML0RDVmVuV3BtSk5HL1ZxVFhkRE91L3VLTkJvR1JrRDRZREowdTBMNE04?=
 =?utf-8?B?dU54UVd3OTBLZDRYVVNzMkxzL052YUM1cjU0OFdrQi8xN0RROEQ0RXhIRlV6?=
 =?utf-8?B?bzNyUlhJL2x3SG9GMHRsR21CaFBqUG9QRVhhV1VDdlNFSnh6SjFiVTBHdlpB?=
 =?utf-8?B?QWdTNVlOUWhXanpVVGRNOGFoZkR5WFgvM1hKQ3p3T3hxZWNReTBUMTlpNEla?=
 =?utf-8?B?RnB0dTlMZklzaGk1L0RaS0NGSjVPK1RVVGxud0VkZjk3Z2JSWElEOU9Lc0lh?=
 =?utf-8?B?U3dRbEdnbFhGbXVtVVdlckxaNGU1NC96T2RJL1B3RHB0ZFQ1VCtuWWRpNUFo?=
 =?utf-8?B?NitjbEZTY3pIdk5qYVpQSmhUZlRtLzVhNytlSFdlZTkrazdaQTJ0T1NjUHMx?=
 =?utf-8?B?Tjl2RzJuYnZrT2FvbmIyREhMTjd4anpiN09ZMjRQSUJoSDJxY3BJWXR4Ujk4?=
 =?utf-8?B?aXZIUS9pekFvOFNtQm1ZMGo0YTFKQUFPcFRpaVVud0VxTGJyYlNyS09IU0lJ?=
 =?utf-8?B?S2ZkZzlDbVJJQy9MVlNhS0lPM0hGY0tWS0Z2aUFISGZTWFQvS0lQYjNSRFM1?=
 =?utf-8?B?WTA4d0JVbW04QjBieDQ4cFJQRXN3VU01c1k1Rmx2Um0zM0loTXlUVEl3VXds?=
 =?utf-8?B?OEtSdkNsam9vU0R2NkxSa1VEUXVkb2Q3YXpNUFpsRFdqTTg3V0NIcUJzd2VT?=
 =?utf-8?B?WWdRN3NDZFZnelJ6cVZJZHdJbllEQ29tWmVldnIzMHN0VDVPNDJJT3M2MFkx?=
 =?utf-8?B?dGR3Z2x2aExQbzM1UmgyZnFvVVR2TmsrWVBGTXc3MVZPd29qUTVnSC9uVUl5?=
 =?utf-8?B?WmxqdzM3RDZkVmROcDVFUHhGdkVaM05IKzRlQ0JXR21PQ2p1UjVvTDBpTTJL?=
 =?utf-8?B?a0N0VkwxVG9DOGdxK3Z4UTdOaFMwcGF1eUVXQWpUb2lIYkYrMEhreGcwZVRD?=
 =?utf-8?B?emFoVDIxWE9SYXIwblRWK2Z0aE1PUysvZStPTHlNSDFNNTI3aWpuYmJQbE54?=
 =?utf-8?B?eENLSE9obytxTlpTa0hZTEozdjBDSFVJMG50WmdXL2IvbDBySUlMK0RGbnB5?=
 =?utf-8?B?SmhHcW5ndUJ6aVB4elA4TXBEZGxJWDZpQkNoK2RVM3V2UTRMK3RTUndnRHZT?=
 =?utf-8?B?M1hmUnlUdTBLV3VnOGxaUW9ZSFp3MHlWOGtqWEFrQ3pqVTZIZXM1SUhWb0xv?=
 =?utf-8?B?YzgraC9uTzg0dnhZZ1FNOWxURGREZ2QxZTdReHRHRXJqV1JnRUwyRlZFRmNv?=
 =?utf-8?B?WnpJc1E1dy9SblUxN0FVOGRRdTZGN2pKMk9ZNGVwTnJ4bFlwSkh5Q1o0SElL?=
 =?utf-8?B?bjJoSDI1OEY3L211YjVqdjVxUUxYV3Yxck5MNTRBcysrSkNEYms1QVRZUGoz?=
 =?utf-8?B?TmlJaGRVZTE0bnJRQ2pJWVJNdnNKOVJ5T3pSTi9VNVBIZjc0WlRWbzhML2dV?=
 =?utf-8?B?dEp5U3JFTkU2ZnVsSWwyQW9tM3FFSFdyQnBBY1ZHbXNVNnhJN29hVU9tZGh1?=
 =?utf-8?B?MXYwNXBKRW5wMjFlallSaGIyQzczYURzTFNpenNad0pqOUpTdDVvdzZxdXFY?=
 =?utf-8?B?QkNqVER4YVUwTE8yNUJxcXFweUNSRDVCM0hEOWJib3VIZFpZSStBMDVmamRD?=
 =?utf-8?B?M2xIOFEvQk5hZFVQRFY1YjFrYzU4aDEwMC96b0JVVm94UERBSm9iTmVlcUtr?=
 =?utf-8?B?UGJxRXdBdks5alIrR1VDZnpDQUdlakh3VGxsWm4vcFVpam9VVlpNOFRjZG9B?=
 =?utf-8?B?dnc9PQ==?=
Content-ID: <2E4E860D3FD31743B4810565726374A9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783a5f7e-6359-4b5a-27a6-08dd9238d76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 16:11:38.6026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ehaa1ddfPXTbbZKHBRH97jwWMr8B3WiN3JE0V/b9p9reFMJnUa11iJQ1SeUy//8vNQ47TG6VC/gE3DO8ypbCHoS+Igfw/osMdwLSuQX8ag8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4D0176D00
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1901800704.267185654"
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

--__=_Part_Boundary_009_1901800704.267185654
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAzLTI1IGF0IDAzOjQ0ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gRnJpLCAyMDI1LTAzLTIxIGF0IDE3OjMzICswODAwLCBwYXVsLXBsLmNoZW4gd3Jv
dGU6DQo+ID4gRnJvbTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IA0K
PiA+IFRvIHN1cHBvcnQgbXVsdGlwbGUgbW1zeXMgaW5zdGFuY2VzIGluIHRoZSBvbmUgbWVkaWF0
ZWstZHJtDQo+ID4gaW5zdGFuY2UsDQo+ID4gcHJvdmlkaW5nIGltcHJvdmVkIGZsZXhpYmlsaXR5
IGFuZCBzY2FsYWJpbGl0eSBieSB0aGUgZm9sbG93aW5nDQo+ID4gY2hhbmdlczoNCj4gPiANCj4g
PiAxLiBBZGQgRERQX0NPTVBPTkVOVF9EUk1fT1ZMU1lTX0FEQVBUT1IqIHRvIHByb2JlIHRoZQ0K
PiA+IMKgIG92bHN5c19hZGFwdG9yIGRyaXZlcnMgYW5kIHN1cHBvcnQgZGlmZmVyZW50IG1tc3lz
IGNvbXBvc2l0aW9uLg0KPiA+IDIuIEFkZGVkIG5ldyBjb21wb25lbnQgdHlwZXMgTVRLX0RJU1Bf
VklSVFVBTCB0byBzdXBwb3J0IHRoZQ0KPiA+IMKgIHJvdXRpbmcgdG8gdmlydHVhbCBkaXNwbGF5
IGNvbXBvbmVudHMuDQo+ID4gMy4gQWRkZWQgYW5kIGFkanVzdGVkIHRoZSBleGlzdGVkIHN0cnVj
dHVyZSBvciBpbnRlcmZhY2UgdG8gZXh0ZW5kDQo+ID4gwqAgdGhlIHN1cHBvcnQgb2YgbXVsdGlw
bGUgbW1zeXMgaW5zdGFuY2VzLg0KPiA+IDQuIE1vZGlmaWVkIHRoZSBjb21wb25lbnQgbWF0Y2hp
bmcgYW5kIGJpbmRpbmcgbG9naWMgdG8gc3VwcG9ydA0KPiA+IMKgIG11bHRpcGxlIG1tc3lzIGlu
c3RhbmNlcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeSBMaW4gPG5hbmN5LmxpbkBt
ZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bC1wbCBDaGVuIDxwYXVsLXBsLmNo
ZW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gW3NuaXBdDQo+IA0KPiA+IMKgDQo+ID4g
K2VudW0gbXRrX2RybV9tbXN5cyB7DQo+ID4gKwlESVNQU1lTMCwNCj4gPiArCURJU1BTWVMxLA0K
PiA+ICsJT1ZMU1lTMCwNCj4gPiArCU9WTFNZUzEsDQo+ID4gKwlNQVhfTU1TWVMsDQo+ID4gK307
DQo+IA0KPiBMZXQgb3Zsc3lzIHN1YiBkcml2ZXIgY29udHJvbCBPVkxTWVMwIGFuZCBPVkxTWVMx
LCBzbyBtZWRpYXRlayBkcm0NCj4gZHJpdmVyIHdvdWxkIG5vdCBzZWUgdGhlbSBhbmQgdGhpcyBw
YXRjaCBpcyBub3QgbmVjZXNzYXJ5Lg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQo+IA0KSGkg
Q0ssIA0KDQpUaGUgRFJNIERyaXZlciBuZWVkcyB0aGUgZGlzdGluZ3Vpc2ggYmV0d2VlbiBvdmxz
eXMwLA0Kb3Zsc3lzMSwgZGlzcHN5czAsIGRpc3BzeXMxIHRvIGNvbm5lY3QgdGhlIG1haW4sIGV4
dCwgdGhpcmQNCkNSVEMgUGF0aHMuDQoNCg0KIm92bHN5cyBzdWIgZHJpdmVyIGNvbnRyb2wgT1ZM
U1lTMCBhbmQgT1ZMU1lTMSwgc28gbWVkaWF0ZWsgZHJtDQpkcml2ZXIgd291bGQgbm90IHNlZSB0
aGVtIGFuZCB0aGlzIHBhdGNoIiANCg0KVGhpcyBpcyBzaWduaWZpY2FudCBjaGFuZ2UsIHdlIHdp
bGwgZml4IHRoaXMgbW9kaWZpY2F0aW9uIGF0IHRoZSANCm5leHQgdmVyc2lvbi4NCg0KIA0KDQpC
ZXN0LCBQYXVsDQo+IA0KPiANCj4gDQo+IA0KDQo=

--__=_Part_Boundary_009_1901800704.267185654
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDMtMjUmIzMyO2F0
JiMzMjswMzo0NCYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtGcmksJiMzMjsyMDI1LTAzLTIx
JiMzMjthdCYjMzI7MTc6MzMmIzMyOyswODAwLCYjMzI7cGF1bC1wbC5jaGVuJiMzMjt3cm90ZToN
CiZndDsmIzMyOyZndDsmIzMyO0Zyb206JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3ku
bGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7VG8mIzMyO3N1cHBvcnQmIzMyO211bHRpcGxlJiMzMjttbXN5cyYjMzI7aW5zdGFuY2VzJiMz
MjtpbiYjMzI7dGhlJiMzMjtvbmUmIzMyO21lZGlhdGVrLWRybQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
aW5zdGFuY2UsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwcm92aWRpbmcmIzMyO2ltcHJvdmVkJiMzMjtm
bGV4aWJpbGl0eSYjMzI7YW5kJiMzMjtzY2FsYWJpbGl0eSYjMzI7YnkmIzMyO3RoZSYjMzI7Zm9s
bG93aW5nDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjaGFuZ2VzOg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsxLiYjMzI7QWRkJiMzMjtERFBfQ09NUE9ORU5UX0RSTV9PVkxTWVNf
QURBUFRPUiomIzMyO3RvJiMzMjtwcm9iZSYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2
MDsmIzMyO292bHN5c19hZGFwdG9yJiMzMjtkcml2ZXJzJiMzMjthbmQmIzMyO3N1cHBvcnQmIzMy
O2RpZmZlcmVudCYjMzI7bW1zeXMmIzMyO2NvbXBvc2l0aW9uLg0KJmd0OyYjMzI7Jmd0OyYjMzI7
Mi4mIzMyO0FkZGVkJiMzMjtuZXcmIzMyO2NvbXBvbmVudCYjMzI7dHlwZXMmIzMyO01US19ESVNQ
X1ZJUlRVQUwmIzMyO3RvJiMzMjtzdXBwb3J0JiMzMjt0aGUNCiZndDsmIzMyOyZndDsmIzMyOyYj
MTYwOyYjMzI7cm91dGluZyYjMzI7dG8mIzMyO3ZpcnR1YWwmIzMyO2Rpc3BsYXkmIzMyO2NvbXBv
bmVudHMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjszLiYjMzI7QWRkZWQmIzMyO2FuZCYjMzI7YWRqdXN0
ZWQmIzMyO3RoZSYjMzI7ZXhpc3RlZCYjMzI7c3RydWN0dXJlJiMzMjtvciYjMzI7aW50ZXJmYWNl
JiMzMjt0byYjMzI7ZXh0ZW5kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzMyO3RoZSYjMzI7
c3VwcG9ydCYjMzI7b2YmIzMyO211bHRpcGxlJiMzMjttbXN5cyYjMzI7aW5zdGFuY2VzLg0KJmd0
OyYjMzI7Jmd0OyYjMzI7NC4mIzMyO01vZGlmaWVkJiMzMjt0aGUmIzMyO2NvbXBvbmVudCYjMzI7
bWF0Y2hpbmcmIzMyO2FuZCYjMzI7YmluZGluZyYjMzI7bG9naWMmIzMyO3RvJiMzMjtzdXBwb3J0
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzMyO211bHRpcGxlJiMzMjttbXN5cyYjMzI7aW5z
dGFuY2VzLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2Zm
LWJ5OiYjMzI7TmFuY3kmIzMyO0xpbiYjMzI7Jmx0O25hbmN5LmxpbkBtZWRpYXRlay5jb20mZ3Q7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7UGF1bC1wbCYjMzI7Q2hlbiYj
MzI7Jmx0O3BhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjst
LS0NCiZndDsmIzMyOw0KJmd0OyYjMzI7W3NuaXBdDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyOyYjMTYwOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2VudW0mIzMyO210a19kcm1fbW1zeXMmIzMy
O3sNCiZndDsmIzMyOyZndDsmIzMyOytESVNQU1lTMCwNCiZndDsmIzMyOyZndDsmIzMyOytESVNQ
U1lTMSwNCiZndDsmIzMyOyZndDsmIzMyOytPVkxTWVMwLA0KJmd0OyYjMzI7Jmd0OyYjMzI7K09W
TFNZUzEsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTUFYX01NU1lTLA0KJmd0OyYjMzI7Jmd0OyYjMzI7
K307DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0xldCYjMzI7b3Zsc3lzJiMzMjtzdWImIzMyO2RyaXZl
ciYjMzI7Y29udHJvbCYjMzI7T1ZMU1lTMCYjMzI7YW5kJiMzMjtPVkxTWVMxLCYjMzI7c28mIzMy
O21lZGlhdGVrJiMzMjtkcm0NCiZndDsmIzMyO2RyaXZlciYjMzI7d291bGQmIzMyO25vdCYjMzI7
c2VlJiMzMjt0aGVtJiMzMjthbmQmIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjtpcyYjMzI7bm90JiMz
MjtuZWNlc3NhcnkuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtDSw0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsNCkhpJiMzMjtDSywmIzMyOw0KDQpUaGUmIzMyO0RSTSYjMzI7
RHJpdmVyJiMzMjtuZWVkcyYjMzI7dGhlJiMzMjtkaXN0aW5ndWlzaCYjMzI7YmV0d2VlbiYjMzI7
b3Zsc3lzMCwNCm92bHN5czEsJiMzMjtkaXNwc3lzMCwmIzMyO2Rpc3BzeXMxJiMzMjt0byYjMzI7
Y29ubmVjdCYjMzI7dGhlJiMzMjttYWluLCYjMzI7ZXh0LCYjMzI7dGhpcmQNCkNSVEMmIzMyO1Bh
dGhzLg0KDQoNCiZxdW90O292bHN5cyYjMzI7c3ViJiMzMjtkcml2ZXImIzMyO2NvbnRyb2wmIzMy
O09WTFNZUzAmIzMyO2FuZCYjMzI7T1ZMU1lTMSwmIzMyO3NvJiMzMjttZWRpYXRlayYjMzI7ZHJt
DQpkcml2ZXImIzMyO3dvdWxkJiMzMjtub3QmIzMyO3NlZSYjMzI7dGhlbSYjMzI7YW5kJiMzMjt0
aGlzJiMzMjtwYXRjaCZxdW90OyYjMzI7DQoNClRoaXMmIzMyO2lzJiMzMjtzaWduaWZpY2FudCYj
MzI7Y2hhbmdlLCYjMzI7d2UmIzMyO3dpbGwmIzMyO2ZpeCYjMzI7dGhpcyYjMzI7bW9kaWZpY2F0
aW9uJiMzMjthdCYjMzI7dGhlJiMzMjsNCm5leHQmIzMyO3ZlcnNpb24uDQoNCiYjMzI7DQoNCkJl
c3QsJiMzMjtQYXVsDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsN
Cg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlz
IGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlz
Y2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhh
bmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_1901800704.267185654--

