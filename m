Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E09A1A796
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 17:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBB910E860;
	Thu, 23 Jan 2025 16:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Ref9Z9eT";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ASZMiLq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586E210E860
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 16:09:55 +0000 (UTC)
X-UUID: 77bb0b3ed9a411efbd192953cf12861f-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Epe+c+N/GK9x+M8OiuyQpge0SVfvDpq1XsiWNPd+T+A=; 
 b=Ref9Z9eTM2JNmJusS7uvbFD6q+L7DSNpICCsgf7ktJp3RTsZZrNz3Q4ZoTVflHo2zVT9rVuftPIRRagBoYtArdJ9V0UgrPBy894K7OOmdJMMTl9iAGYx+2CNzpyvFyXBv4EJa6BSKBQtp80+2KY/vvADtUH4mNebGRFccLrYfuw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:f3435fd4-154a-464c-98ef-fc5dc33d1e76, IP:0,
 U
 RL:0,TC:0,Content:5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:5
X-CID-META: VersionHash:60aa074, CLOUDID:1c8f9e7e-427a-4311-9df4-bfaeeacd8532,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 77bb0b3ed9a411efbd192953cf12861f-20250124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 437382083; Fri, 24 Jan 2025 00:09:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 00:09:46 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 00:09:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfpK7XZn/8J0GNrJmnZwcZ6eNawuQPE+9KNcJIcvJ4Avb/W2WQ2eiWtZijJIUBquLuNwDYsfYZoAsHoMxdd/L53D8NRr2qktZtm7MzSW2UWE1I4a9vzruFgH27DnL27yfj/3jVQbWjVk7KeF9mD6s+UVq3D0RWtNUGo9ooeou4Q4GM3j4ajxB/HhoazF1kCNzBkgOfDL1s82FfYLShD5Lqjz6tzF6fZL/f+X/Nm3+vpavd04HwisdysVFw774rugpWNJu5UP8ZskIiVB/ulqIPcZnejTRsLo7fBK3Irp7p2fqgkjcapTfF5UTVnnleoAbSfkK7vyN8XI5ArJHj5+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoHT5kRPjUN7JO/N2ybJ4gHAB21YAkenuzeJ98xAAY0=;
 b=mveMpJMG509XzNdZ0mJ8RJWTipC9H4EX5aWW5Ivm5zZkXRmT1AbGcxgbJJw96FayAmPA82oaGtAQ9hzUIvGgF4z09QTk4zYz4qkJvUwXIcJ0CzOydMiucrNJaW/LXDNcSoKX6AKobyqoN9DVMLW72zvRsAj1Io9/nuJzmJDAB971jbOx24JvDrPrkomoyzWRqyH2bR7IgZlTfGRyxlrsvwj1dl10l/lPtsyg4KwEEHvRppoifhMyF1I2ygPJxO6ZODaphjqPMNIDnvWdh/tkmxPbsrtYtHonFTJuvKVsGV8hpqzVGxqZ6wygnRJQrHj0oEZY1xzWF+slqv8TyTl+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoHT5kRPjUN7JO/N2ybJ4gHAB21YAkenuzeJ98xAAY0=;
 b=ASZMiLq4T9xywbPSTzS0YC9OFhj69/2s+G8KQ5FtMvky3GUCskXfwXk0DstMVDyhdZDgR/LbpYbO85YK6c0XHlhHsyf3SwjqF46s+azHGHbuN3YsEzofCY9oU/3VHMneKI05pFE4psaH/LuwpadAB8Lz1DzSOc7U/qZV/NQNyLg=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 SEYPR03MB6904.apcprd03.prod.outlook.com (2603:1096:101:b1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.21; Thu, 23 Jan 2025 16:09:43 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 16:09:43 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "fshao@chromium.org" <fshao@chromium.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "krzk@kernel.org" <krzk@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrDUiFOy83+0KImka1ZzUdabMQB4wAgAXBksCABoVHgIAHpisAgAADy4CAAKNXAA==
Date: Thu, 23 Jan 2025 16:09:42 +0000
Message-ID: <cdb4a606bf632f3a3ffb16f98a098f4675b9578c.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
 <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
 <CAGXv+5EhG+xnJmYj6kYp2hzgkX62HfxRUJZKc4_X-s09aBMvrA@mail.gmail.com>
In-Reply-To: <CAGXv+5EhG+xnJmYj6kYp2hzgkX62HfxRUJZKc4_X-s09aBMvrA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|SEYPR03MB6904:EE_
x-ms-office365-filtering-correlation-id: 0a114e8d-ea97-4e43-3b88-08dd3bc85909
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?b3JuaEs1WXB2d1RNdHEyaDVtMC9ycmd6Y2c0VHZFd3VMQk05VmI3Z3lyN01L?=
 =?utf-8?B?dDFDREhFUE1EK3MrVmRyOVZ6dGhPMmo4MTJNdWQxQ0MrYm1waGFnK3B4c0J1?=
 =?utf-8?B?UHpuVUVUeW1aNWYxMnZ3MUxOc2JSWkxsd25XU2I5Y2tHQnppMlFqdFlTaVhC?=
 =?utf-8?B?citjZkZBVjhqdDBuVEorV0FGVG9MT21udENoWTFBY1hSaTE0aXlRRXhLUnBD?=
 =?utf-8?B?ZE5hS3lHYzNRU0h6SlpvUE9zOG8vU0FkVEhzQXZYVHY2M2U2eGdYbVdMMDFI?=
 =?utf-8?B?ck5ZWXhNc0J0NjQyVmlSakYwWW9BYjhqTzRuYkpGMlFoQ3Q3M1QrL0M3WGRL?=
 =?utf-8?B?YVZjSXQwejFzVmdUVjBZUHpVUzNHV3lwSEx6ODlIOWM5Tm1Edzkxb2xCY3Vs?=
 =?utf-8?B?eERnekFIWFdLS295eER6enI3bjVpOVUrUVZKTXJpQkIrMmZOVlkzM2JuWXUy?=
 =?utf-8?B?ZkJFVWVvTlA2dU1FZU5MaU1WY2JiRWxQREV4VDlEYlpibzYyUkpFM3lUNzlC?=
 =?utf-8?B?bXFqL2ZlV0pJemt2dkR3aS90RG4veG41dVJtcEkzNG5hbW9yUlF5NWRldGtk?=
 =?utf-8?B?NXJyemkySWRxUzB0Qjk5eGs3YlZybFNnS1doNytaNG9tbHdjYzQrZVFhVFVa?=
 =?utf-8?B?SzRlVGNpejJRaktDQ1NERXQyZ0VkU2kzWlErQnd0YmxrRmUzanpjZVdiV0tq?=
 =?utf-8?B?WUowRFhKNmZEZU5VRkRUSzA4Y3UwcnRJSlVzakJEbHBPZjBjM0czUUZjNVVO?=
 =?utf-8?B?OXhJeCtaVzJ0S1F6NlhuTmh2ZWlmMDU4ckIyQ0dGc013d29CNkVhOEQya1JN?=
 =?utf-8?B?aVZGT2hla3luYXRXbDBLTGhFcXpkQ01UaWRZSmVMVEdRQTNGdHB4bFFscWMv?=
 =?utf-8?B?MXRGVm5HN3FoSkdGN3kyeDU4Mlo3Tk1Dbm04OUZxd1Q2TnpQNzBOVGVLR3BY?=
 =?utf-8?B?STVweFhnQW9pZHNMQ1Vvd0lHYUp0cjFrODVBaFFPdlNxU3dyZmUxYklsM29Y?=
 =?utf-8?B?aWozSSttV09sTVlML1VLYmRQYlZGUnNxWXdxaVJGZVNTcEJIVE1uNllvbGRY?=
 =?utf-8?B?NkdGeERtTzNuaEVBL1NmTG1rVVhVMVFWOWdnOXJNVWJmQlBvTk4xa0s0TVR3?=
 =?utf-8?B?VzhmaVAveWtBcUVDcWFRQ1RaWnkwR25pQ2t0YnlDM0hhRlo5MWJVL0tXaVF5?=
 =?utf-8?B?RDFoME1CbUhYVG5pN3VyZnRaNTdpbkplL1JiTE9LbVErVC8rNHR3OE0rZFVN?=
 =?utf-8?B?Q1hadDRxZG1uWStvdEdUVzZaUkF5Mkp6RVN0cDNQcmVXVlZ2MFcwa3JsamJM?=
 =?utf-8?B?V0tsM2tyT3NOUm1mUXdaMnU4c2k5cFNvaDEwS3AxTnNFaWE0SzdDdm1TNVVt?=
 =?utf-8?B?Si94REVYUHlQUnE4TkZEOFNuTjVTU1Z0NUN6am9pQkEzZzBET2M0OFhONjc1?=
 =?utf-8?B?WDZzdkxrcTd3LzN3cDJqbUxINkJkeXhidHdDTlEvanBaQU9DU204emZGemxK?=
 =?utf-8?B?Qklmc3VoclhGZUVIaVY2NURKZE5xVG4ycUQyd0FWNmRINFB4QjB1Y2ZlQ2tk?=
 =?utf-8?B?enRiK3VnaEZsa1pDUFA4a1MyNlBPL3RVbUVPVGJFSFN4aHVRZDQ5WGhOdXNw?=
 =?utf-8?B?ang4dTZ5UW9FbUdmWFNIdjJ1bjNRVVd2dnp6Q2x0anF4WG1UV3dsUytzblpN?=
 =?utf-8?B?MElWUUptelRyR3VJS3JIdGdrbmYzT0tJZlRYL3hqcUpqRzkzdDNJd0xQVVpu?=
 =?utf-8?B?MXlWOUVnbVNYbzV3RG94VGY4V0pqQzNHVEV0Y2VHck5Nd2NMQXhvL0F2TENi?=
 =?utf-8?B?Z1lnbmxrd1NnaVo1aFd2TmhSS2h1b2hsNWhxMFR5TGtzcksvTFQ5eGFXbk5q?=
 =?utf-8?B?bHo1TWJNc3ZIMm9PYURZRXVQbGtjWDhsZnpoOU12R2cxREVncEJpOUMwK0Ix?=
 =?utf-8?Q?bxXyG/amWOmUUGnQJY/isTqs7s8fK92F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3UrZFYrRkhEQWFydTNhYTVxaTlKMWI3QTZydXZYS0tFYnkxUVppWVNpeHFX?=
 =?utf-8?B?ZnBBS0VKQllqR1d4bEJMK2dxcXhpeEhyNFJmRzNIRmNxVjBUeXB5NlcvSE8y?=
 =?utf-8?B?cVJCN25NeVpqM2RYN0tOTFBFamRwcjZHM3o3cjlncmVjZ0I2aWEyRVhUaFk1?=
 =?utf-8?B?YWliZHBXcGRoc0hTRW9ZN3hTRjdPTjIrS3lyN1M2YWt6anZTQVJPTmlnUnJC?=
 =?utf-8?B?QTRzWi9UdW8wNDZrazBwbC9JSk4xSVdrU0NHTGRDZWtiZ0xCdEd5QTY4WVRs?=
 =?utf-8?B?VFI3MFlScnJNWjVydzkwelRxMmczVEdCKytqNzFVYmZqUjA1dnlXS2ROdCtl?=
 =?utf-8?B?bjIxVExNMVFrM2V5ajNkc0NXdS9ibFNTQldpdTR3Mmk0QS95ejFMZkhDS20v?=
 =?utf-8?B?dlNjUWtkZXdGNlkweU9QWXNCZ3dSR0F2TFhOMVBkM2lITytpemdxR1h2eFlk?=
 =?utf-8?B?cVh0aGgwQ2VwMXVlOFRnTHMrUXNIVXp2K1RIZkRCTytlcmpSYitsTzMvR0J2?=
 =?utf-8?B?YUxwV05iOXY0RG42VXBwNGIxQjJtREdBcThhSStuQlFtR0V5cS9xUmR1aDJI?=
 =?utf-8?B?NmFyYWJ6T1lPcVVxdXpuMFpHWmJlVk8xdzh4RmxEVzF5MGZpeE5hTWxKZm0z?=
 =?utf-8?B?aGNZaUdyQ3g2WFFLcjJZaXdXQ3R6Y3ZjYkwwQm1oeVhjci8wUWN6WXZwbmJS?=
 =?utf-8?B?RXdlQXE1OEtDWW45c0k2c2RiNEZ4S1ZwdGVGUWYzcHdyQnpxYXVoS1VnaC9t?=
 =?utf-8?B?d0ZYU2lPa2ZXeHJjQU1oZXBXUTFZTmZ2bzcwM3N1VDF2YkhnVVlZOGQ5MVpC?=
 =?utf-8?B?RlR1VVdXNkh2SlpHdTR1Zzl4Z09nRTFmbnpXZ09YOG5SYnV1T09JY08xRndC?=
 =?utf-8?B?bHJYTi9uUlduc2hRa0loRXNOZVluRzRxeXhNVjdZT2RvRU1aOTJkWk50Mk5J?=
 =?utf-8?B?UTFGdURHM2hOeUljVlNJLzZjV0E0R01zQjFaMHFkWDRYd1JmWUdiS3NhU2lE?=
 =?utf-8?B?bnhMcjV1djg3YmltZWp3OXdyb2hzQjZ3QzdBVzVaamtWQlZ3UVUwV29lUXY5?=
 =?utf-8?B?MEo3UVpvbDd2Z1dpVTFNaTVNbmxsS00zeW1nRTB6ZTVDRk1DeDZETDNDaDZM?=
 =?utf-8?B?cmgra1BnazRwNk8rOXczYXpPNmRoSU14QytucWNOb1BJLzFzaEZ3WlNQQjdY?=
 =?utf-8?B?OGIrVVRiUzRHblc4ZlZwd3FpYjFVODNDUjJBSGtkRlZFc1NhcWpLYmI0ZTcv?=
 =?utf-8?B?cFhaMFF5MGF2RCtTQlAyMXhJOVAwMVVraHNQbEhLTlNLMlN0OGRlQjdlcHRV?=
 =?utf-8?B?SXV5NHNwMlovWUtrTHBMQzFlUGhVclk5U0M0VEtlQ2t0TTYwUUh5aUFGNzBn?=
 =?utf-8?B?N0hkUWgzMDBMbEJ6b2IxRDZQWWpZR283b05jdW5qSDVVU24wY2E5WXhhWTgx?=
 =?utf-8?B?MWloUkJjcUNlMGtiaWN1bE42QVI1dVdSL0Jxa2doZWFrakREZ3c2RzBTZjVJ?=
 =?utf-8?B?dHl5SWJTWjlwdjkvczhkalA0b0kwZ1pOYlQrT1F2dlVHcUc0bnV6eERYVEhz?=
 =?utf-8?B?d0M2dmR4bUhXNDN4Z01hY2NSaWlQejRVYzhjT1NnRktpMGc2TzdoWUoxNHov?=
 =?utf-8?B?Zk9DVmFlYlZrNWJTZ1oxaFZLYTFkemhvVU5xV0pwYkdqR1cyWEZsQnRNczMv?=
 =?utf-8?B?V2RoRUY5MFBOWkhneW9RKy95UWdUV2xrd3ZwWGloTDdWZnFoMW00RHBDOWpY?=
 =?utf-8?B?dUgxR3EwMlQ2TEJhODRteGhTdkZBczhTOXBlWmxCZjA1aVZJRVhmaEZSRE5r?=
 =?utf-8?B?cGt4VlRGYkIva1l5TmZtb2VkYVY2L2Z6QlF6SzRBd1NJM1d6R1g1TnZVNTBL?=
 =?utf-8?B?dExwbk1YZkdxRDZtV0JYdFFhdUFhWG9pckxBb1dyODZLQWczaXREbE4rM3Q1?=
 =?utf-8?B?Y2I1THI2eUwzL3V3TEUzNzFpSzg4RDcyWTIrajBYTEZ3ZExubVVEb0lZdzl6?=
 =?utf-8?B?RFdWektLcHZURlpYb3pTYmU4L0o4R1V5MDEzallCSUZWR2FWaThOUXMwR3du?=
 =?utf-8?B?SkViOEFsMSt6Q3JuYTVwYU1YTUNLdGp2cUJVMGl5TmJaeUhITTNtTXpNZlRW?=
 =?utf-8?B?eTJIRHNpalowT3Y0RkxvR2J2S1diOVpDTFptUEF4bXdNc3ptd3EwdWdLNnJR?=
 =?utf-8?B?c2c9PQ==?=
Content-ID: <78B51C86275C0748A17776504533E79D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a114e8d-ea97-4e43-3b88-08dd3bc85909
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 16:09:42.9414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apvMkmQ7SDbhhAamclv0iS3oXCba0isBlwx4RG071DsKWJ0WJts4OfJ2ufegi/nAQTqER3aTVbDkANj3vpj8ym5ChUviOAjjASHhRKdJjjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6904
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_170431426.1292842637"
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

--__=_Part_Boundary_002_170431426.1292842637
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDE0OjI1ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IE9uIFRodSwgSmFuIDIzLCAyMDI1IGF0IDI6MTHigK9QTSBQYXVs
LXBsIENoZW4gKOmZs+afj+mclikNCj4gPFBhdWwtcGwuQ2hlbkBtZWRpYXRlay5jb20+IHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFNhdCwgMjAyNS0wMS0xOCBhdCAxMDoyMiArMDEwMCwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2Ug
ZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4g
PiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+
ID4gPiANCj4gPiA+IE9uIDE0LzAxLzIwMjUgMDY6NDksIFBhdWwtcGwgQ2hlbiAo6Zmz5p+P6ZyW
KSB3cm90ZToNCj4gPiA+ID4gSGkgUm9iDQo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGFkdmljZS4N
Cj4gPiA+ID4gVGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGVycm9uZW91cyBsb2cgbWVzc2FnZSBpcyBk
dWUgdG8gbWlzc2luZw0KPiA+ID4gPiBwb3dlci9jbG9jayBkZXBlbmRlbmNpZXMuDQo+ID4gPiA+
IE9uY2UgdGhlIE1USyBjbG9jay9wb3dlciBoZWFkZXIgZmlsZSBpcyB1cHN0cmVhbWVkLA0KPiA+
ID4gU28gdGhpcyBjYW5ub3QgYmUgbWVyZ2VkLg0KPiA+ID4gDQo+ID4gPiBEZWNvdXBsZSBkZXBl
bmRlbmNpZXMgb3Igd2FpdCB3aXRoIHlvdXIgc3VibWlzc2lvbiB0aWxsDQo+ID4gPiBkZXBlbmVk
bmN5IGlzDQo+ID4gPiBhcHBsaWVkIHRvICpMSU5VUyogdHJlZSwgbm90IGV2ZW4gbWFpbnRhaW5l
ci4gT3RoZXJ3aXNlIHRoaXMNCj4gPiA+IGJyZWFrcw0KPiA+ID4gbWFpbnRhaW5lcidzIHRyZWUu
IEkgcmVhbGx5IHN1Z2dlc3QgZGVjb3VwbGluZy4NCj4gPiA+IA0KPiA+ID4gQmVzdCByZWdhcmRz
LA0KPiA+ID4gS3J6eXN6dG9mDQo+ID4gPiANCj4gPiANCj4gPiBIaSBLcnp5c3p0b2YNCj4gPiAN
Cj4gPiBJIGhvcGUgdGhpcyBlbWFpbCBmaW5kcyB5b3Ugd2VsbC4gSSBoYXZlIGEgY291cGxlIG9m
IHF1ZXN0aW9ucw0KPiA+IHJlZ2FyZGluZyB0aGUgRVhETUEgY29tbWl0IHBhdGNoIGFuZCBkZWNv
dXBsaW5nOg0KPiA+IA0KPiA+IDEuIFdvdWxkIHJlbW92aW5nIHRoZSBleGFtcGxlIGZyb20gdGhl
IEVYRE1BIGNvbW1pdCBwYXRjaCBiZQ0KPiA+IHN1ZmZpY2llbnQNCj4gPiB0byBhY2hpZXZlIGRl
Y291cGxpbmcgZm9yIEVYRE1BIFlBTUwgYW5kIE1USyBjbG9jay9wb3dlciBoZWFkZXI/DQo+ID4g
DQo+ID4gMi4gSWYgcmVtb3ZpbmcgdGhlIGV4YW1wbGUgZnJvbSB0aGUgRVhETUEgWUFNTCBpcyBu
b3QgYWxsb3dlZCwgd2hhdA0KPiA+IGFsdGVybmF0aXZlIGNoYW5nZXMgY291bGQgd2UgaW1wbGVt
ZW50IHRvIGFjaGlldmUgZGVjb3VwbGluZz8NCj4gDQo+IEp1c3QgcmVwbGFjZSB0aGUgbWFjcm9z
IGluIHRoZSBleGFtcGxlIHdpdGggdGhlIHJhdyBudW1iZXJzLCBhbmQNCj4gZHJvcCB0aGUgaW5j
bHVzaW9uIG9mIHRoZSBoZWFkZXIuDQo+IA0KPiBDaGVuWXUNCj4gDQo+IA0KSGkgQ2hlbll1DQoN
ClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQgc3VnZ2VzdGlvbi4gDQoNCkJlc3QgIFJlZ2FyZHMs
DQoNClBhdWwNCg==

--__=_Part_Boundary_002_170431426.1292842637
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDEtMjMmIzMyO2F0
JiMzMjsxNDoyNSYjMzI7KzA4MDAsJiMzMjtDaGVuLVl1JiMzMjtUc2FpJiMzMjt3cm90ZToNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMy
O2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFj
aG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7
dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO1RodSwmIzMyO0phbiYjMzI7MjMsJiMzMjsyMDI1JiMz
MjthdCYjMzI7MjoxMSYjODIzOTtQTSYjMzI7UGF1bC1wbCYjMzI7Q2hlbiYjMzI7KCYjMzg1MTU7
JiMyNjU3NTsmIzM4Njc4OykNCiZndDsmIzMyOyZsdDtQYXVsLXBsLkNoZW5AbWVkaWF0ZWsuY29t
Jmd0OyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO09u
JiMzMjtTYXQsJiMzMjsyMDI1LTAxLTE4JiMzMjthdCYjMzI7MTA6MjImIzMyOyswMTAwLCYjMzI7
S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMy
OzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYj
MzI7b3BlbiYjMzI7YXR0YWNobWVudHMNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3VudGls
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMz
Mjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7MTQvMDEvMjAyNSYjMzI7MDY6NDksJiMzMjtQYXVsLXBs
JiMzMjtDaGVuJiMzMjsoJiMzODUxNTsmIzI2NTc1OyYjMzg2Nzg7KSYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtIaSYjMzI7Um9iDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGFua3MmIzMyO2ZvciYjMzI7dGhlJiMzMjthZHZpY2Uu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGUmIzMyO3Jvb3QmIzMyO2Nh
dXNlJiMzMjtvZiYjMzI7dGhlJiMzMjtlcnJvbmVvdXMmIzMyO2xvZyYjMzI7bWVzc2FnZSYjMzI7
aXMmIzMyO2R1ZSYjMzI7dG8mIzMyO21pc3NpbmcNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyO3Bvd2VyL2Nsb2NrJiMzMjtkZXBlbmRlbmNpZXMuDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtPbmNlJiMzMjt0aGUmIzMyO01USyYjMzI7Y2xvY2svcG93ZXIm
IzMyO2hlYWRlciYjMzI7ZmlsZSYjMzI7aXMmIzMyO3Vwc3RyZWFtZWQsDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjtTbyYjMzI7dGhpcyYjMzI7Y2Fubm90JiMzMjtiZSYjMzI7bWVyZ2VkLg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtE
ZWNvdXBsZSYjMzI7ZGVwZW5kZW5jaWVzJiMzMjtvciYjMzI7d2FpdCYjMzI7d2l0aCYjMzI7eW91
ciYjMzI7c3VibWlzc2lvbiYjMzI7dGlsbA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7ZGVw
ZW5lZG5jeSYjMzI7aXMNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2FwcGxpZWQmIzMyO3Rv
JiMzMjsqTElOVVMqJiMzMjt0cmVlLCYjMzI7bm90JiMzMjtldmVuJiMzMjttYWludGFpbmVyLiYj
MzI7T3RoZXJ3aXNlJiMzMjt0aGlzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjticmVha3MN
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO21haW50YWluZXImIzM5O3MmIzMyO3RyZWUuJiMz
MjtJJiMzMjtyZWFsbHkmIzMyO3N1Z2dlc3QmIzMyO2RlY291cGxpbmcuDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0Jlc3QmIzMyO3JlZ2Fy
ZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtLcnp5c3p0b2YNCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtIaSYj
MzI7S3J6eXN6dG9mDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0kmIzMy
O2hvcGUmIzMyO3RoaXMmIzMyO2VtYWlsJiMzMjtmaW5kcyYjMzI7eW91JiMzMjt3ZWxsLiYjMzI7
SSYjMzI7aGF2ZSYjMzI7YSYjMzI7Y291cGxlJiMzMjtvZiYjMzI7cXVlc3Rpb25zDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtyZWdhcmRpbmcmIzMyO3RoZSYjMzI7RVhETUEmIzMyO2NvbW1pdCYjMzI7cGF0
Y2gmIzMyO2FuZCYjMzI7ZGVjb3VwbGluZzoNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7MS4mIzMyO1dvdWxkJiMzMjtyZW1vdmluZyYjMzI7dGhlJiMzMjtleGFtcGxlJiMz
Mjtmcm9tJiMzMjt0aGUmIzMyO0VYRE1BJiMzMjtjb21taXQmIzMyO3BhdGNoJiMzMjtiZQ0KJmd0
OyYjMzI7Jmd0OyYjMzI7c3VmZmljaWVudA0KJmd0OyYjMzI7Jmd0OyYjMzI7dG8mIzMyO2FjaGll
dmUmIzMyO2RlY291cGxpbmcmIzMyO2ZvciYjMzI7RVhETUEmIzMyO1lBTUwmIzMyO2FuZCYjMzI7
TVRLJiMzMjtjbG9jay9wb3dlciYjMzI7aGVhZGVyJiM2MzsNCiZndDsmIzMyOyZndDsmIzMyOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Mi4mIzMyO0lmJiMzMjtyZW1vdmluZyYjMzI7dGhlJiMzMjtleGFt
cGxlJiMzMjtmcm9tJiMzMjt0aGUmIzMyO0VYRE1BJiMzMjtZQU1MJiMzMjtpcyYjMzI7bm90JiMz
MjthbGxvd2VkLCYjMzI7d2hhdA0KJmd0OyYjMzI7Jmd0OyYjMzI7YWx0ZXJuYXRpdmUmIzMyO2No
YW5nZXMmIzMyO2NvdWxkJiMzMjt3ZSYjMzI7aW1wbGVtZW50JiMzMjt0byYjMzI7YWNoaWV2ZSYj
MzI7ZGVjb3VwbGluZyYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0p1c3QmIzMyO3JlcGxhY2Um
IzMyO3RoZSYjMzI7bWFjcm9zJiMzMjtpbiYjMzI7dGhlJiMzMjtleGFtcGxlJiMzMjt3aXRoJiMz
Mjt0aGUmIzMyO3JhdyYjMzI7bnVtYmVycywmIzMyO2FuZA0KJmd0OyYjMzI7ZHJvcCYjMzI7dGhl
JiMzMjtpbmNsdXNpb24mIzMyO29mJiMzMjt0aGUmIzMyO2hlYWRlci4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7Q2hlbll1DQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KSGkmIzMyO0NoZW5ZdQ0KDQpUaGFu
a3MmIzMyO2ZvciYjMzI7dGhlJiMzMjtyZXZpZXcmIzMyO2FuZCYjMzI7c3VnZ2VzdGlvbi4mIzMy
Ow0KDQpCZXN0JiMzMjsmIzMyO1JlZ2FyZHMsDQoNClBhdWwNCg0KPC9wcmU+DQo8L3A+PC9ib2R5
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

--__=_Part_Boundary_002_170431426.1292842637--

