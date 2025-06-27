Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C0AEB3CA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47F210E9B4;
	Fri, 27 Jun 2025 10:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MrzgB633";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bAgrfRmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E0F10E9B4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:07:30 +0000 (UTC)
X-UUID: 8480e500533e11f0b1510d84776b8c0b-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GL68qKVis8B8CAZBHfbGzfCd9o6fh3U3j8CuY9P1m5Y=; 
 b=MrzgB633EjNqMc67hOrbSjKS15RXkg7b8Wi0s+5LPkYEvMmq1VyDHJG8853jsFzatsZ40YUweC9G17oPMFroWmP/+z3XF4GI8KAIcRA6fWBMLsD8WvZg8Lajb1uMh9QbYVTDSmZdtNqXP41OE0t/Uv1hLwStrawMh5y3uSs18Bk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:f76aa62e-f27c-473c-87cc-bdbb98f21f6f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:c861a114-6a0e-4a76-950f-481909c914a4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8480e500533e11f0b1510d84776b8c0b-20250627
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 37222864; Fri, 27 Jun 2025 18:07:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 18:07:19 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 18:07:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9RaoU/w1OFYS7AOSKFhfGGZ34ZdW3dIwNFpj2x37r2WZMS+yBctGAXjZitD/1/imTlQHzHWS/PFc9Js5vfXtgn0UCZr8NZ7QsZx3uT/iBg5K7cFB9tsAZtKBqxXH1nofuQEmK7VCJvm3vuz1j7p49mSywgxZsDGNevLNQKps6xGXFlkatmkinH2s5Uqk7IxH2ezDZypuMgg4oRyEHuK2bIMByeCpIuZDB01E/O0ZbzkIR2brGco+qw1MYNP+g59Ssjw9lnfQcj0nLU6oXJHTt8FxXv4v9yeBYtJUdpcnSlPp2LB9FWUWaG/sw69WsgPTu4yxfIUGLW6k78/cbDIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU+1BhLn+AvKqWXizQhMvrDeT+Gd6pHUNONTavw2Tek=;
 b=ru0aRd5liSecfcBid284Z10e/2UZOriQ4S6aQJUHu8OVYoqIKhWKYpDU8IkV8nxR+S7MmqoTgbF3yDB+qxiE/ZjkmUw+QPYxBNXF26oK2V7O/ySYk8FwfRhmS8pW9u3SJtql+wAiBQKNMuk2Pafio7q0l7CSm13GhT4s9Mls2ZO/2sPeb56yauj5EP7Vql1lSnk850+gvMfeBzr9L5Gn82Bh8CxFj6em9U+xUYUx7cFYx2B1GH6mNQCC0l25+xZGwaPKQ99O6PZPTKSFczQlPxDtlAJPy2tyEj+OHBuO1qJk8rWDpvI+7mKYSogM0LnTeZx7VMkRU5/2XlZs8bRv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pU+1BhLn+AvKqWXizQhMvrDeT+Gd6pHUNONTavw2Tek=;
 b=bAgrfRmORmXg+igZDz9+DIHBBgh06xkRAHUMnBWHHRaacMIaichTvONUcHnBNNIB2+L3+zzg+jN9k3HQCGMJel3l2NbtclDkO0NW7lCGNDkZFASRU6/476okp+YmDIPWu4IdkT/rXullpKH1e+pKFRj6mwFAzS7nJKVRlmNjTcI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7329.apcprd03.prod.outlook.com (2603:1096:400:433::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 10:07:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 10:07:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
 <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 08/20] mailbox: mtk-cmdq: Add driver data to support
 for MT8196
Thread-Topic: [PATCH v6 08/20] mailbox: mtk-cmdq: Add driver data to support
 for MT8196
Thread-Index: AQHb0xt3K7Lr5SRftEa3Y5MTfYhL0bQW8E+A
Date: Fri, 27 Jun 2025 10:07:17 +0000
Message-ID: <620b547d768b41fec9c9955d8b1acea2213055c8.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
 <20250601173355.1731140-9-jason-jh.lin@mediatek.com>
In-Reply-To: <20250601173355.1731140-9-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7329:EE_
x-ms-office365-filtering-correlation-id: 6f7df789-361a-4ccb-22b1-08ddb562660c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NUJSWWUwaFJGWjAyQksrQklRT3lPMmprY1BrOWh4d2tOc1dxbWtYSEp0SFhQ?=
 =?utf-8?B?b0MxSmxFd0xmUWJqRU1rWEcrYTZtUzNhK1N3c2MwZWxPQXdSaVdnVCtOS0J0?=
 =?utf-8?B?dUNKRmh6M0xNMksvUlEyUlNEQWhIdTlsdTEzNXBiNXdSNHl5VHYvY2hiWEVK?=
 =?utf-8?B?RFBYZXo4cU1xTmhORS80d1Vrdm5jM1ZQY3drbVJ2OGlQUU1Eam1HTHUzelJY?=
 =?utf-8?B?UkxRT1FPcmhYQ3JpWlhDZENHNzZ1OUxzaUlOT1hkRTJYdUltaEI4Z0VMWXVn?=
 =?utf-8?B?NEduZURmb2cxdUlEdnpvZWpzUUJheFJXNnI4T1lQVFNTT3VIQzRuQWRHYlZn?=
 =?utf-8?B?NkZnZ21ReTVlb3VJZmYyV2tRaHdlSmlTS3FlRGxiT1dRdFV3c0xNa0dFRUlx?=
 =?utf-8?B?Z0NOMEk2ZStuUUtVdVJHT2VVQzZmQldRTUNHOGNJYUN5Nmptd3lWMlpOdzQw?=
 =?utf-8?B?SFJ5OGlOWjRRTW5PL0lucnJxYWw1eWRicGNmSmlIOE1MU2hGWWNmOTFLWE03?=
 =?utf-8?B?ekR5bWljRlpOMVJ4bHZFTWFyQkQ1dlMrbWg5L1BsVnlvQ20rRWZldFc4dHF1?=
 =?utf-8?B?MDVodXEveFp6RGc3ZnY1cWJCYnViR0N0c25jV2VWMHpycVRMUTJXTTI1enhM?=
 =?utf-8?B?VXcwR1ZWaGJtTjRqbGZ6SHhYRmQ3dlNYcXhEbWJySnZObnZpL2xFV0hiSHhr?=
 =?utf-8?B?MExYcitOeUNGdlQyRjB0RWFsVzk4R3l3YkFCVHY3d01Vd2lxcy95dXh3cmJ4?=
 =?utf-8?B?emkrclNaMlhWVGkrTzZSN08wME01bmdmN2thQnIzRU9WQ1lJbXZid0F5R2dM?=
 =?utf-8?B?VXAxYW5zbWpHZVM4bzZqclFSUlBWMVZwSFk2L05YdDF3a2J6UVIybThPbmRN?=
 =?utf-8?B?UUYwd2FQaCsyd1p3QVY1TE1RcEpmVHZYUmZnMnNQZWZyRERXRTdwNEdSdnpz?=
 =?utf-8?B?MEYvOExtaGNORFovUGhBWC9TYjZpb3NuKzd3QndBUjQvUllKZWZ6WEdZMWk1?=
 =?utf-8?B?dzJ0d1BJYWtIbWY5bXJ6aWY5cWxKMlRiRGlrZlV2QU9KK0J3YllZWlNJQWhU?=
 =?utf-8?B?T2ljemp2Mlpvam1PaTNCZjdHOXFUMXBvNHU3RGkvWGI3Tldxb3JhOFVrNE41?=
 =?utf-8?B?SlJjZEcyWm5MUzNTTThzWHliOVBpTGRYc0d1T2pEUWNpb1JtMDlwdlJLRFZ6?=
 =?utf-8?B?bVdwZndSSGZIYjl2NXZOM3dmK1JGZkVreDJGeGQ3M3ZGS2FXVmxoeGN2S2hZ?=
 =?utf-8?B?QlV4Tm1ZRTEzRk9ZN0dPQUZGM0dDQTRyL0RzaGFHS1p4Vkw4QVJsc3R1QmVv?=
 =?utf-8?B?b3pGVnBtdU12SU9QbmFIV09BUGZxUnMzQnI4S0k1R0ErbTF3cnpsWUV4YTBi?=
 =?utf-8?B?MFUyd1Z0ZUhBalcyckF2bXVKdUtOeVlacjJtYUgzMGhkREVZZnVDdXF2MWJB?=
 =?utf-8?B?UXgrK3BKU1Q3cmpCRzZiaUlUM1FRZjQvblJTQnBVelNsU2tqeCtBRzJmNFJu?=
 =?utf-8?B?SVNibDFneGxtdm00Y1VtOWlnL28vNmQ4Qncxby8xWFJ5dUlXWkFCcGJ0aG9V?=
 =?utf-8?B?bEhkNzN4N0JEK25ic2lNUzVuN1hQeHU5Z3c2QlpxOU1FQkxJQkRFVUxtR0hk?=
 =?utf-8?B?VXZlRnJ3c2ROOTlaaW5zcXpETld0UVYxellYbDJNQkZ1bEZvKzJlYTZpM2o4?=
 =?utf-8?B?VXNtSjVXYndzQlp2cm5WNG8yRWtIVmgydS9FSk5ZWGN0aTUxSjhvbXJPSjZO?=
 =?utf-8?B?dHo5UHZHSUFIVWFWUmdJNUJ2R0xQZXpZT1VzdGhyMDdqNnZ3aTFndTUrSGEx?=
 =?utf-8?B?emhEQVZDNXB4VWU5T1REVHE1K2t0bjdKcS94TndqUWEyYlVsWVkwVWw0amtC?=
 =?utf-8?B?WGxvKzRCK3U3SGJGbE0wM0E3aHVONmo5SEp0TSttTVpybjJiaUJmdEo5elZn?=
 =?utf-8?B?eUNwVTlIRW5YTHNkRkl4dHFzU2dPMlVMK1Zub1FmcjNVdHJQZ2Zyd0NaZmM2?=
 =?utf-8?B?RDRkTlRyUGFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDhNei8vQUdxWTRzbUpxKzVFb1grT3BRQXQ2VDZ6R091SklmZ0djTnRLVmFz?=
 =?utf-8?B?SllRN0NFWlhmYlhHaVhBM1NjdU1hZWc5VjhpK1IyeGZ5YUZCVnZIUit1UVV5?=
 =?utf-8?B?OTl3eXhMMzVhb2ZKaHNydUd0T2JWaDlUelBSZmRacVc3bFVtN0lqd1c5WFJC?=
 =?utf-8?B?d0hzOEVZV3dyUjBsVFpjVG9jTjU4eFNnL28zSEowaHE1ejBvdTVNbWtONTV4?=
 =?utf-8?B?bFkzUCs4cHNRdUprREkzeGFjQWpJMmNQdWtjLzF1NXBYaW1vY1RoUHZ1K05C?=
 =?utf-8?B?T25iSjhIRFpoa2NIT1JsaHR2MVpXdTYzRmNuaDhVSTJ3TFFOVTlSODZnV0VY?=
 =?utf-8?B?ZmEydVA2d3VqdTZEREJGek1NY3JOL1JSRjBseWNjeEpRY29jSnRyS2hpS3VG?=
 =?utf-8?B?QlNoK0hMQ3REamFSLzdOL25lNkIrN2g3UTVvS0xnTGJCWEJDVlJXYXhRTXE3?=
 =?utf-8?B?d3A0UGM0akhOREZzWGdGSkh0ZXIvelNuVGFNeTBDemRKb1BTTHVINi9CZzFP?=
 =?utf-8?B?Q0laWWtxelV6Z2lPRm4zb3RIQUJJTHVvSkZaMGt1c1BwS08rRW5RcXYrdjBF?=
 =?utf-8?B?aHBWdlRQWnNBeS91OVM3S0ZBNFc4RWRmNHFPR3cvTzg4K1I2YjBjSWNXMUtP?=
 =?utf-8?B?UXJOZDlMYkxHa0cvQ29SWU8wZEErZjB0RTFUR1NOc055dWpGVFVpSGVHUktP?=
 =?utf-8?B?aXg5M2NJdzVqdWJTUzhiV2pJdGE4NmFMMDhQWThtWUlEcGJpS3VZZDVtblJ6?=
 =?utf-8?B?N0psSmRWT28zSUJHQmIrMm01am5XOWVGcDJHZVJPUnk0Q05ERGJzZnh6YkNK?=
 =?utf-8?B?Qm93NTRSNGZqVjgyand3TnJac25JMFpjY2Z3TmNZZEFQaGNGUkFWLzF3WWs5?=
 =?utf-8?B?U0tDWVpxUWN1NER5RVU1em5aekZHWHgrNEFtTERLNW02TnVCdFc1NUR3d0lL?=
 =?utf-8?B?T3FhaHBoT2dVMm4xdEpoeG51b3dwNFlpaUtkb2I1NDJPWWVSQkk4UDNNRVpu?=
 =?utf-8?B?WUVTQkkvOFQ4VzI0cnV0bnZoMTFibjEzdEQxSzlpZW5sODVYODBpd2hHaU1L?=
 =?utf-8?B?RlRNVW5uVERDVDU4aSs2eFVUVHNWQXZSV1FGY0RHT1RiV0F2N1hmc0hYSlh2?=
 =?utf-8?B?WWJPcENXNHIwRCtEazNQYnlpaUZkS05ESUF2VVVVbUk4RkhtY3VXTTU2VWVh?=
 =?utf-8?B?RStuT3lJRGNaN0hEM2R3YkEwQmsvV2pVT0JFUW9jdUNMdTMvSHl5SUVrRGlD?=
 =?utf-8?B?am9HUldmdzQrejRZc09EakQzWWFXVDVqbHNLcmdUL2FDdEI2MkRvTDI2WWo1?=
 =?utf-8?B?UVN4c1k2ejFadkxjSmlGUm5vRVVkalFtK3hxYS9Eb0J2QkI3OWtBWDBBUWxV?=
 =?utf-8?B?WEVlbzZ1ajdmb0NQVkVXdmJ4N3VHYXJ5dUxieGpPSGZLSWtRenF1QjFhWDVk?=
 =?utf-8?B?M3MreERzdEpGc2JDMm5xekFScUFldmUzQWtJbExob2xubDF1OFBVU2lBNnlD?=
 =?utf-8?B?NUxRbGIyN0I2c1RwbXlhUCtNWEZmSURDUjhUWjI2VWM5OGRMOUhOUGtNV05M?=
 =?utf-8?B?ai9tcTlyeS9SY1pqM0dyREc0UmhmdHpDVkROcnUzeGM5KzRDcWxVcmsrNGlj?=
 =?utf-8?B?VkR3MWg3dVU2Vy9lSmtxRktRdHowWnVyYkQ3eTVNQmcyajBIcVpMajFpUHAy?=
 =?utf-8?B?am90aHVEMWU5REFacWlab1BjdWVLaERLeWVFeE9vZEdWeFhmK1R0bFcwUTNz?=
 =?utf-8?B?cndqcDJVTmQ2cFVTVWdHcWI2M1RRSTRaY0ZBTElFSmc4UTNFSk1DY2MvZnI2?=
 =?utf-8?B?eGZYTVVyVEhXSWUxYU1HcngyYWR0bDZPbUNZajcvbzR3QzhqeGJ3VGpBOVRC?=
 =?utf-8?B?L0YrekhnQWk4dmRQMk80ak9JZlNiK1huTnU2OE01UlJ1Z2lMK05YTkxFZ3lp?=
 =?utf-8?B?VlMveU1PU2h3TkZaZW9KRVJVQS8xQnZjSHZHMFRUT3hidU5KRFhFZzhaUTU3?=
 =?utf-8?B?VkN3bFIrUnJMUFpXM2dSQ3dZOUluYTcrRVY0dW5pcURhTytJUnhKUzNwRHBK?=
 =?utf-8?B?YUJndlo4bUJHYmFZdnRjaU9SYktSVzlJbXB6QlY0YkxOYzlEbFNDdEFvMTZE?=
 =?utf-8?Q?HzRuw83DmF4Tgi05+JwfULFBp?=
Content-ID: <15366454800460469A7809E9533702AB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7df789-361a-4ccb-22b1-08ddb562660c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 10:07:17.9879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: crR1lYvf0rzfPDC6/thFj0V0VedU13EuixJ79iDSJOQNyHHvoz7Pb911l/hruuyYuN9Dpka9ZD/n+Ef79SXezQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7329
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1717217136.1399232820"
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

--__=_Part_Boundary_009_1717217136.1399232820
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTA2LTAyIGF0IDAxOjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IE1UODE5NiBoYXMgMiBuZXcgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBjb21wYXJlZCB3aXRoIHRo
ZSBwcmV2aW91cyBTb0MsDQo+IHdoaWNoIGNvcnJlc3BvbmQgdG8gdGhlIDIgbmV3IGRyaXZlciBk
YXRhOg0KPiANCj4gMS4gbW1pbmZyYV9vZmZzZXQ6IEZvciBHQ0UgZGF0YSBwYXRoIGNvbnRyb2wN
Cj4gICAgU2luY2UgR0NFIGhhcyBiZWVuIG1vdmVkIGludG8gbW1pbmZyYSwgR0NFIG5lZWRzIHRv
IGFwcGVuZCB0aGUNCj4gICAgbW1pbmZyYSBvZmZzZXQgdG8gdGhlIERSQU0gYWRkcmVzcyB3aGVu
IGFjY2Vzc2luZyB0aGUgRFJBTS4NCj4gDQo+IDIuIGdjZV92bTogRm9yIEdDRSBoYXJkd2FyZSB2
aXJ0dWFsaXphdGlvbiBjb250cm9sDQo+ICAgIEN1cnJlbnRseSwgdGhlIGZpcnN0IHZlcnNpb24g
b2YgdGhlIG10ODE5NiBtYWlsYm94IGNvbnRyb2xsZXIgb25seQ0KPiAgICByZXF1aXJlcyBzZXR0
aW5nIHRoZSBWTS1yZWxhdGVkIHJlZ2lzdGVycyB0byBlbmFibGUgdGhlIHBlcm1pc3Npb25zDQo+
ICAgIG9mIGEgaG9zdCBWTS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1l
ZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5j
IHwgMTIgKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9k
cml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+IGluZGV4IDZmNGI5ODc5MDY5ZS4u
ODUyMTFiODBjY2RiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFp
bGJveC5jDQo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gQEAg
LTE0LDYgKzE0LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tYWls
Ym94X2NvbnRyb2xsZXIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tYWlsYm94L210ay1jbWRxLW1h
aWxib3guaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiBAQCAtODUyLDYgKzg1MywxNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGdjZV9wbGF0IGdjZV9wbGF0X210ODE5NSA9IHsNCj4gIAku
Z2NlX251bSA9IDINCj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZ2NlX3BsYXQg
Z2NlX3BsYXRfbXQ4MTk2ID0gew0KPiArCS50aHJlYWRfbnIgPSAzMiwNCj4gKwkuc2hpZnQgPSAz
LA0KPiArCS5tbWluZnJhX29mZnNldCA9IFNaXzJHLA0KPiArCS5jb250cm9sX2J5X3N3ID0gdHJ1
ZSwNCj4gKwkuc3dfZGRyX2VuID0gdHJ1ZSwNCj4gKwkuZ2NlX3ZtID0gdHJ1ZSwNCj4gKwkuZ2Nl
X251bSA9IDINCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGNtZHFfb2ZfaWRzW10gPSB7DQo+ICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS1n
Y2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X210Njc3OX0sDQo+ICAJey5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE3My1nY2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X210ODE3
M30sDQo+IEBAIC04NjAsNiArODcxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgY21kcV9vZl9pZHNbXSA9IHsNCj4gIAl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg4
LWdjZSIsIC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfbXQ4MTg4fSwNCj4gIAl7LmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTkyLWdjZSIsIC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfbXQ4
MTkyfSwNCj4gIAl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWdjZSIsIC5kYXRhID0g
KHZvaWQgKikmZ2NlX3BsYXRfbXQ4MTk1fSwNCj4gKwl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTk2LWdjZSIsIC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfbXQ4MTk2fSwNCj4gIAl7fQ0K
PiAgfTsNCj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGNtZHFfb2ZfaWRzKTsNCg0K

--__=_Part_Boundary_009_1717217136.1399232820
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDYtMDImIzMyO2F0
JiMzMjswMTozMSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjt3cm90ZToNCiZn
dDsmIzMyO01UODE5NiYjMzI7aGFzJiMzMjsyJiMzMjtuZXcmIzMyO2hhcmR3YXJlJiMzMjtjb25m
aWd1cmF0aW9uJiMzMjtjb21wYXJlZCYjMzI7d2l0aCYjMzI7dGhlJiMzMjtwcmV2aW91cyYjMzI7
U29DLA0KJmd0OyYjMzI7d2hpY2gmIzMyO2NvcnJlc3BvbmQmIzMyO3RvJiMzMjt0aGUmIzMyOzIm
IzMyO25ldyYjMzI7ZHJpdmVyJiMzMjtkYXRhOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsxLiYjMzI7
bW1pbmZyYV9vZmZzZXQ6JiMzMjtGb3ImIzMyO0dDRSYjMzI7ZGF0YSYjMzI7cGF0aCYjMzI7Y29u
dHJvbA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7U2luY2UmIzMyO0dDRSYjMzI7aGFzJiMzMjti
ZWVuJiMzMjttb3ZlZCYjMzI7aW50byYjMzI7bW1pbmZyYSwmIzMyO0dDRSYjMzI7bmVlZHMmIzMy
O3RvJiMzMjthcHBlbmQmIzMyO3RoZQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7bW1pbmZyYSYj
MzI7b2Zmc2V0JiMzMjt0byYjMzI7dGhlJiMzMjtEUkFNJiMzMjthZGRyZXNzJiMzMjt3aGVuJiMz
MjthY2Nlc3NpbmcmIzMyO3RoZSYjMzI7RFJBTS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Mi4mIzMy
O2djZV92bTomIzMyO0ZvciYjMzI7R0NFJiMzMjtoYXJkd2FyZSYjMzI7dmlydHVhbGl6YXRpb24m
IzMyO2NvbnRyb2wNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO0N1cnJlbnRseSwmIzMyO3RoZSYj
MzI7Zmlyc3QmIzMyO3ZlcnNpb24mIzMyO29mJiMzMjt0aGUmIzMyO210ODE5NiYjMzI7bWFpbGJv
eCYjMzI7Y29udHJvbGxlciYjMzI7b25seQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7cmVxdWly
ZXMmIzMyO3NldHRpbmcmIzMyO3RoZSYjMzI7Vk0tcmVsYXRlZCYjMzI7cmVnaXN0ZXJzJiMzMjt0
byYjMzI7ZW5hYmxlJiMzMjt0aGUmIzMyO3Blcm1pc3Npb25zDQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjtvZiYjMzI7YSYjMzI7aG9zdCYjMzI7Vk0uDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMy
O0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjsmbHQ7amFzb24tamgubGlu
QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL21h
aWxib3gvbXRrLWNtZHEtbWFpbGJveC5jJiMzMjt8JiMzMjsxMiYjMzI7KysrKysrKysrKysrDQom
Z3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxMiYjMzI7aW5zZXJ0aW9u
cygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL21h
aWxib3gvbXRrLWNtZHEtbWFpbGJveC5jJiMzMjtiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1t
YWlsYm94LmMNCiZndDsmIzMyO2luZGV4JiMzMjs2ZjRiOTg3OTA2OWUuLjg1MjExYjgwY2NkYiYj
MzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1h
aWxib3guYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWls
Ym94LmMNCiZndDsmIzMyO0BAJiMzMjstMTQsNiYjMzI7KzE0LDcmIzMyO0BADQomZ3Q7JiMzMjsm
IzMyOyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvbW9kdWxlLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNp
bmNsdWRlJiMzMjsmbHQ7bGludXgvcGxhdGZvcm1fZGV2aWNlLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMy
OyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvcG1fcnVudGltZS5oJmd0Ow0KJmd0OyYjMzI7KyNpbmNs
dWRlJiMzMjsmbHQ7bGludXgvc2l6ZXMuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMy
OyZsdDtsaW51eC9tYWlsYm94X2NvbnRyb2xsZXIuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1
ZGUmIzMyOyZsdDtsaW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaCZndDsNCiZndDsmIzMy
OyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtsaW51eC9vZi5oJmd0Ow0KJmd0OyYjMzI7QEAmIzMyOy04
NTIsNiYjMzI7Kzg1MywxNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYj
MzI7Z2NlX3BsYXQmIzMyO2djZV9wbGF0X210ODE5NSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMz
MjsuZ2NlX251bSYjMzI7PSYjMzI7Mg0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7JiMzMjsN
CiZndDsmIzMyOytzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO2djZV9wbGF0JiMzMjtn
Y2VfcGxhdF9tdDgxOTYmIzMyOz0mIzMyO3sNCiZndDsmIzMyOysudGhyZWFkX25yJiMzMjs9JiMz
MjszMiwNCiZndDsmIzMyOysuc2hpZnQmIzMyOz0mIzMyOzMsDQomZ3Q7JiMzMjsrLm1taW5mcmFf
b2Zmc2V0JiMzMjs9JiMzMjtTWl8yRywNCiZndDsmIzMyOysuY29udHJvbF9ieV9zdyYjMzI7PSYj
MzI7dHJ1ZSwNCiZndDsmIzMyOysuc3dfZGRyX2VuJiMzMjs9JiMzMjt0cnVlLA0KJmd0OyYjMzI7
Ky5nY2Vfdm0mIzMyOz0mIzMyO3RydWUsDQomZ3Q7JiMzMjsrLmdjZV9udW0mIzMyOz0mIzMyOzIN
CiZndDsmIzMyOyt9Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0
JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZCYjMzI7Y21kcV9vZl9pZHNbXSYjMzI7PSYjMzI7
ew0KJmd0OyYjMzI7JiMzMjt7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10
Njc3OS1nY2UmcXVvdDssJiMzMjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMyOyopJmFtcDtnY2Vf
cGxhdF9tdDY3Nzl9LA0KJmd0OyYjMzI7JiMzMjt7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90
O21lZGlhdGVrLG10ODE3My1nY2UmcXVvdDssJiMzMjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMy
OyopJmFtcDtnY2VfcGxhdF9tdDgxNzN9LA0KJmd0OyYjMzI7QEAmIzMyOy04NjAsNiYjMzI7Kzg3
MSw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtvZl9kZXZpY2Vf
aWQmIzMyO2NtZHFfb2ZfaWRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7ey5jb21wYXRp
YmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxODgtZ2NlJnF1b3Q7LCYjMzI7LmRhdGEm
IzMyOz0mIzMyOyh2b2lkJiMzMjsqKSZhbXA7Z2NlX3BsYXRfbXQ4MTg4fSwNCiZndDsmIzMyOyYj
MzI7ey5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTItZ2NlJnF1b3Q7
LCYjMzI7LmRhdGEmIzMyOz0mIzMyOyh2b2lkJiMzMjsqKSZhbXA7Z2NlX3BsYXRfbXQ4MTkyfSwN
CiZndDsmIzMyOyYjMzI7ey5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgx
OTUtZ2NlJnF1b3Q7LCYjMzI7LmRhdGEmIzMyOz0mIzMyOyh2b2lkJiMzMjsqKSZhbXA7Z2NlX3Bs
YXRfbXQ4MTk1fSwNCiZndDsmIzMyOyt7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlh
dGVrLG10ODE5Ni1nY2UmcXVvdDssJiMzMjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMyOyopJmFt
cDtnY2VfcGxhdF9tdDgxOTZ9LA0KJmd0OyYjMzI7JiMzMjt7fQ0KJmd0OyYjMzI7JiMzMjt9Ow0K
Jmd0OyYjMzI7JiMzMjtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCYjMzI7Y21kcV9vZl9pZHMpOw0K
DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHBy
ZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_1717217136.1399232820--

