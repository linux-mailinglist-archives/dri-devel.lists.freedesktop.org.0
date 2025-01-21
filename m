Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41154A182A3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 18:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA2E10E610;
	Tue, 21 Jan 2025 17:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="lHzJy1Me";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="DWzqKsUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB04F10E613
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 17:14:42 +0000 (UTC)
X-UUID: 31457b92d81b11ef99858b75a2457dd9-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=nVodeqYYXotExcM43jBHRVIx2DGUBpQBuEV4yOQArm8=; 
 b=lHzJy1MeZd8YbVzOhDm5AANlDSkVVg9jqwmthqQTHwYzqeNx6zUJ3GmV7Pey+0XDSUlefrDexFhztoD9PnRB6pmEQt6fWfbbACM0v52fheeRDMHcQlXCsZgW6ETFp84k3vn/ph7VriIgTedkOf47W8LaiYBJ8NvrFTtOmizUkWQ=;
X-CID-CACHE: Type:Local,Time:202501220107+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:83b69aa3-e7d2-4622-8264-cb333e2f4f58, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:99653d38-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 31457b92d81b11ef99858b75a2457dd9-20250122
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 666041586; Wed, 22 Jan 2025 01:14:37 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 01:14:36 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 01:14:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXepVbWMT79jDqtVNKr7kb3Jk2grvX9MmIGO9lpjzIlQqoivr9o2qwiiEI6eLIAmCcClpdoWQlPAKstkuIkLq7gdNrull8SIz6spLnC8ewd/TtRDIaL1RyzLxkOG294ts3X+0JA+nod0vaQ9/ru/bW0Fdm09y+4KLlz2AOuSCsg+mFtZKQEkLijOwo4ix7NGdcB9DGmfVft/9+lN2tAjyUhYIapPUJ7NMv3UhB1ez45pXC9ldR7frQNTGzsumr94My7umxO1BvqeLcnEXkps75IJ6rOuokOuT21ybcKBcxowW4OB2IJox4cZWF6ZPXewfBvPjLPED08HEoxZphedVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj7lF9+r636c4/wdmiPY5G5EsqBOor8ohG02uURJau4=;
 b=vW2l1ynmCF6IrWmmCVCebvChbV/I9z6WcejshTJ+emfSSY5fmhjJo4Cd0pbweWUwJS+M75uwFDVBhx8oYiWIYlVp2LEakuEUh/X0CN/ZlWMNGK11tJbwxxU2M31pH0FC2+l1EE6QMzKSHcMh0IM1uOQm1zauM5Ua5g/ewxtCrBmgTeO848oJxT6ZfB+szv8tKK+0ac2Buy313aTUDXRSfsRjYcb69w8UJuJgB9UZ2iNeCtPytcDIR90VN47bxiPlbPs/DWyyTL8tF8ZVq5j4U8fzfck2RFDIgTGpoccHd133R7C1CYL1oW7LEsp7eZyj0vk8K82fDFq3Q68UTCYU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj7lF9+r636c4/wdmiPY5G5EsqBOor8ohG02uURJau4=;
 b=DWzqKsUHYTeUhPf/HDHleLkbraFLkNb33kqIF+hsmMB/gwd0xndvnEjMr2BoTuyHuiWIsMd1yhKzeNzxJctR7lLJ3BkMcU/t6q18rzRMhmA8kRzlEwZkGdjarbkp+pDdyGF46Otm75evR811X8EP+5QJ5J8HqzKk0PD5cvVK3Os=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 JH0PR03MB8668.apcprd03.prod.outlook.com (2603:1096:990:9c::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.21; Tue, 21 Jan 2025 17:14:33 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 17:14:32 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrDUiFOy83+0KImka1ZzUdabMQB4wAgAXBksCABoVHgIAFOsCA
Date: Tue, 21 Jan 2025 17:14:32 +0000
Message-ID: <6e1f3e8342dc3770b424bbdcfb189c3ed5112eec.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
In-Reply-To: <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|JH0PR03MB8668:EE_
x-ms-office365-filtering-correlation-id: 6aac40dc-03fc-4a15-13bb-08dd3a3f127f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N0tEVFo3bExvb0ZPWkp6MHZWSE9JQjU5bDFubnBaK01qTkpKdURKcFB3cXlR?=
 =?utf-8?B?aFE0S0kzVURMRWE2aUZuR1ZXWW5wdG5JRDBNMEtlM1NNMmQzWmlnbm44Zjgr?=
 =?utf-8?B?RkpONkdvSkUvVUFxSUl1aHJxQ01RUXFkTVVPbVJLWUNqdVd1R28wbUt5cm1G?=
 =?utf-8?B?dzlqNGlyM3JrUlRGcWJCRGJhZnpJUGY2cHRHb292ZVBxNU5jRkUvRGRUd0tU?=
 =?utf-8?B?aGpxMDR6NmY3WnJEdkVxVHhmaGpUd1Y5KzVmeXR2a1d2MjRmZzhnS0Y2M1BK?=
 =?utf-8?B?SGtXUVdDL1krYU5kaktzYUgvc2tFaXNvYkpKQm9IdFpvK2RLaWlqajlRZFpq?=
 =?utf-8?B?V2tIRFJrdS92SXdIOXdGcjNFTytWWkpoenVVVUZKOSsrNTVDdEtTR2IzNDVy?=
 =?utf-8?B?RkF1THoveUFXMm5PZHVMNDFITW02MWNFYVIrYXM2NnhOeVhGZnBXUHUvYmlp?=
 =?utf-8?B?ZFB2ejZoK1d3anhobGNTSmhHVTdxR1hqVit3VU1ha3N2cTN6dUlYUTdTVXgz?=
 =?utf-8?B?czdsS1lGKzhHQ1RaMC9SRCtnVVhXVW1lVkRWVVJVai9xS3lGY2tyTFJrTzZB?=
 =?utf-8?B?YzNwUG16Yy9Tb2tvWW03d0RNMUJhU2lDaDRISmVvYkhQeW1FWWhhUjdJSXYv?=
 =?utf-8?B?bTQ3cENxVzBPTER3OVY5Rk92cmxNdFVrcEhkaGpiY3BkSVpLV0pXTlhWOE5O?=
 =?utf-8?B?clRlWkRNUjhRVDN0NnFZTFE2WjFlcVJXeFpzcFhmT20vMG5vcnYyV3BkOWFD?=
 =?utf-8?B?bm9zdXVyUkQ1WFJvN1ROREYyUTBlcTcrdDkrdzBoeU1aTGJoMUUwOElYMnlU?=
 =?utf-8?B?VzZmQzdiZ2Y0VmoyVVlyODNSM0RmQnorWk5kRmRzTWRYbkdlUFAza3FEREpX?=
 =?utf-8?B?QWd4OGdNOGNzKzMxbk5pc05GOHJPdERuQkw4WHdmVHlZREJKWEY5QzZyK2dC?=
 =?utf-8?B?TlBjbFkxMC95OWZka0VxMENVNC81ZjE4ZE9GbFNMTHc2anBwbDh4Rm1sZkVQ?=
 =?utf-8?B?SWI0MGN2Unl4dEtVNldlQTJobmtYOUwrS2VndHpUQm5vYkJiOU1xWUczaTVx?=
 =?utf-8?B?TEZQeDZEenJNSmxOcXFHaFJoa3puWmgxRUdKcXZaUnl6Y2dVZm51VzZoZHBk?=
 =?utf-8?B?SHByTURsT1RXb0JDTnRsTHVlNllMOGJYQnMyWjBjZUZwWnZ6bndmbFYrYm1M?=
 =?utf-8?B?c24xN25aRzNoOTA5MWR4aE82VHVYaGJtVjE0cHdkeDgrY1NlWk5LZm8vSFJ2?=
 =?utf-8?B?aGhHSy92NUFyTjJlSnB3Y1pwZjRRcXFsYWY1THdvVkpSbVYrTGFCK1FQNlpm?=
 =?utf-8?B?MlRhL3JidVRiSEhIOFppNlVhclpXMUNQOWhzRllEaWZSVEJGUmZzaCtFZnRG?=
 =?utf-8?B?WWlIVWo0a29obUZwdXhXTlI5Umgwd3BRRkx5VHA1WXNtaEdnVDBuWHdlblVI?=
 =?utf-8?B?b2pRZ042M2FlK2pKakRTRFkxdmdCbGhRY2tHTFh5a1RZYmZ6eEhneTJxaENU?=
 =?utf-8?B?S3NUN0FZRnR1clNUdHRWNEZEc2dpMWNkNGJveEdPUXQ4aWlKQSs4SVN5SC9L?=
 =?utf-8?B?U2xydlNoWkV0TVpwUTRydjcrdGJobHBETVI3bzRXUENUc0VuVk1ZRUxZZU9X?=
 =?utf-8?B?L0pNUHhKQ3NqSEhzM2RUN05hWGwwOFd3amtHRWdoby9KZWNCQzI1ZnRrNU1T?=
 =?utf-8?B?S2U3V2RuRzNpcWtMVjR6WU8xOEIvY0pNRG9CODlJTjRaQ0VtS21rcG0ranV4?=
 =?utf-8?B?SFQwK2xLcW1FZVpvdy9CQjg3QitJQjgxamFJN0Z1NWdYa3lYa1EzRFBUUUlj?=
 =?utf-8?B?M2tvTm1hdXpwQXduZ3VDdnNFTGZOSW8xTVlwZG9oblRXRGZ3L2d0b2RXWGRN?=
 =?utf-8?B?ZUh5MU5FOWFlUTUzUFBxZVZZNFB3WDRZUDUyWmFJNGRKNEpSbzNwWC9naHFX?=
 =?utf-8?Q?7pWyUlAxsV0iKLGWthRx4LDIDQyw1mGu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0VrUU1PNWlZeXpRL2w3MnZHUnFYUXNmTHVLRC9tOHpNaEMrdVNqcURHdDJp?=
 =?utf-8?B?NlBXWm42bmtKNktkYndXTTA1QU9GQlNEa2Fiak43ZXlxODNDaVNhaTlqZTly?=
 =?utf-8?B?bHNQM0xYS1lUdXpYRkVBWm5HVm01dWxrbU85VW9uYU5sS1VqdXdFTUtYK1gx?=
 =?utf-8?B?VGUxVnBkM0YyU1ZteEwvMURjTjIrRkF2ZVlTRU5WYjhRV29LMCtOQU9wQW9Q?=
 =?utf-8?B?QTZOZVVDWW80bVVmZEtzWTdndHhPQU43R1FuS2U1dVJMcU9PaDYySUU2WXpk?=
 =?utf-8?B?OHlTcnFDQ2VyZ0tKVE14T3lLN1p4K2k2aVYxQXRIenpwMW1YY3BtMm93N29K?=
 =?utf-8?B?cllaeFV6akhRQXZNT3hEMUlqa0t2R3Y1dHhSRjZodmRqNkJCZjIvNEh3YjZp?=
 =?utf-8?B?UW1ydzZNVmRaWm9SRy9ZNUw0dEFiUVdxL3NSSnJmaVYvc0NybWtLbm8wRTZK?=
 =?utf-8?B?S0JkTy9EWUlYdmpSalptUE1HSGZmNzJJREdQWDcvRHRES0ZDbWhwaFh4SjN3?=
 =?utf-8?B?cyt2SCtsN1IyZHFMOUYwVDhzd1pVTDJIRnJzWDEvdmNiM09sS3cwWERERmdy?=
 =?utf-8?B?V1NrVU1ZYnFncFQ3bE1xN2dHc0o4UUdCTmNUUFJUYndQN0ZZZjEzRlZVTkU3?=
 =?utf-8?B?ejhES2o5YmpsVjdpS3pZZU5RV2YrbGNadlUwZ01ibEcycmZrd0IwNEhWSUxQ?=
 =?utf-8?B?SDVxY001NjhCOXIzMVhlQ3YxZ3dsMmRKYmhCT2FKb3hmcTVHNjdPbWxsMFdT?=
 =?utf-8?B?NHRCMzlOeU9jdTJHVHRxRmZWcEZ3bjJXS0FWNUlWTHpqa05xcWp4bzhZWTVk?=
 =?utf-8?B?YlI0Y3JmZFgwOWxqS0VWUXhhTHNuR3QrTXNwR21scjd0ZFNHbU9XbDVYUE4y?=
 =?utf-8?B?dE9qNjFVMjJLYnlLQ25qbW00bmQ3cHFpdDUyZHdadmJZV0NmU2NsVmlQNmpq?=
 =?utf-8?B?MzJnMWs5bXBGWmZJQUtHaVF0U1AyaFh1M0hlcEw3RG5MK3FtN0lNN0dxSzZj?=
 =?utf-8?B?UVpZTUdDUWVwWnZXUXU2SnJnUDJLWW5kY3U5Yi9hT2RGZlhlelJEc2cwY0pK?=
 =?utf-8?B?RGJJQzQ4WDkyYjR6MURDKzlFcW1ReWFQZHE0V0x1dXUrS1JKdWF6emFCUHVz?=
 =?utf-8?B?ZkZhdTNHYjNxYjZDTVFKZytCNVEwTjFiT05ydEplREVkYlZWVVV6b2lZNWEv?=
 =?utf-8?B?bzFubkViYzhsb2czOG5FMEdWdFBJdDNuTDVRUHZSUlU5cXVpbXdMREkzUTJW?=
 =?utf-8?B?MFE1UzViZ09oT3Fub2lhNDRYbmo5V3U0TGM5elFwdzhQMlhraThRSEs4ZFUy?=
 =?utf-8?B?QmhLd3JhUERwNER0THU4cWhPL2tLbFd6dGZtUzJIU01GRFVHUGdyeTZqNVFN?=
 =?utf-8?B?aHVQZGM2aUZZWjN4VlVLV0tseGlVMlkzeGk1VUdYY3ppd2RZcnVCTWN0V255?=
 =?utf-8?B?MSt5aXZQRWNFeTQ3RElFMXZobG1xdXIzcVVlaTlDNnliYWt3RVRhd0gxQWVT?=
 =?utf-8?B?NXVXSEp0MkNVT2RKSkdSbHZwVmc2TTN3QWk4S09peFZ4MHZ4UTNaOHVlMkFp?=
 =?utf-8?B?RVJqTjRBTmFnRTVzaGxxaHRzQ2NVeXVCNWJpcXJ3MVVMazZvL1Y5cURoYlNJ?=
 =?utf-8?B?L0hKV0UrQXZhMGo4MndrbGdBekRZQkpUZ0s1NHNFWTdKQlJnTDZZRmxjVTVi?=
 =?utf-8?B?YTkrVzMxM0d0UGg2R0Zad0dvZ3RXby9uUlhqYmxHNjQ2UDN4K1RpNUt0LzFQ?=
 =?utf-8?B?aUc3Q2J3S2x1UW5xRDJmT3R6eEJLMkYwbGl1QXlOUjdTSU5CamY2T0FSdk5Y?=
 =?utf-8?B?d2RCaW4zbU5aSmxMRmpZa2pPdlVwS1BjQ0pTc0pxM1ZXMEUwU0NUMldtOGg4?=
 =?utf-8?B?MWEvbVp4cHZGSkdhRVdtdGQ4UnVxSGIzMXk0YTNwbWRUS1ZkdUo2VUtQajRl?=
 =?utf-8?B?MVB0djRMNFJsVkMydmVBQi9nUVM5WUZtZFF6UVpJaEw3UzU5Q3BoUjVla1BR?=
 =?utf-8?B?ajNTWXpSalUxeHhxbU4rNVdVdENTN2FidkFVODJCVVF4UjRMTmdKWXIzSnFY?=
 =?utf-8?B?c201ZS9ZUWVvRi8vSityWjJSZ0V2YTUwdXZCM1Y3N1hQZTgySS9sWUlFVm11?=
 =?utf-8?B?Nk9ybEhDWUNMS1hUUWJ5SURQVFVwTGRCMW5zZkJjWDdmajF3ZUlSOFN3dXNa?=
 =?utf-8?B?Vnc9PQ==?=
Content-ID: <E34DFF8901ABE94589FF8C77408DC0A0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aac40dc-03fc-4a15-13bb-08dd3a3f127f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 17:14:32.3762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g66OpRKWQGauP4lJBvXCDHacoGzp/WqVyh3iQ4Y5NKQvxKpVYa/21pS7KxILXn0QWa8PyDg8ynxLXu1MlbqkzsipSc+ZRxsHbDbkiBZ3bjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8668
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1641794942.162722253"
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

--__=_Part_Boundary_006_1641794942.162722253
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDI1LTAxLTE4IGF0IDEwOjIyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBEZWNvdXBsZSBkZXBlbmRlbmNpZXMgb3Igd2FpdCB3aXRoIHlvdXIgc3VibWlzc2lv
biB0aWxsIGRlcGVuZWRuY3kgaXMNCj4gYXBwbGllZCB0byAqTElOVVMqIHRyZWUsIG5vdCBldmVu
IG1haW50YWluZXIuIE90aGVyd2lzZSB0aGlzIGJyZWFrcw0KPiBtYWludGFpbmVyJ3MgdHJlZS4g
SSByZWFsbHkgc3VnZ2VzdCBkZWNvdXBsaW5nLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgDQoNCldlIHdpbGwgd2FpdCB0aGUg
ZGVwZW5kZW5jeSBjb21taXQgaXMgYXBwbGllZCB0byAqTElOVVMqIHRyZWUuDQoNCkJlc3QgcmVn
YXJkcywgDQpQYXVsDQo=

--__=_Part_Boundary_006_1641794942.162722253
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1NhdCwmIzMyOzIwMjUtMDEtMTgmIzMyO2F0
JiMzMjsxMDoyMiYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtEZWNvdXBsZSYjMzI7ZGVwZW5kZW5jaWVzJiMzMjtvciYjMzI7d2FpdCYj
MzI7d2l0aCYjMzI7eW91ciYjMzI7c3VibWlzc2lvbiYjMzI7dGlsbCYjMzI7ZGVwZW5lZG5jeSYj
MzI7aXMNCiZndDsmIzMyO2FwcGxpZWQmIzMyO3RvJiMzMjsqTElOVVMqJiMzMjt0cmVlLCYjMzI7
bm90JiMzMjtldmVuJiMzMjttYWludGFpbmVyLiYjMzI7T3RoZXJ3aXNlJiMzMjt0aGlzJiMzMjti
cmVha3MNCiZndDsmIzMyO21haW50YWluZXImIzM5O3MmIzMyO3RyZWUuJiMzMjtJJiMzMjtyZWFs
bHkmIzMyO3N1Z2dlc3QmIzMyO2RlY291cGxpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0Jlc3Qm
IzMyO3JlZ2FyZHMsDQomZ3Q7JiMzMjtLcnp5c3p0b2YNCg0KVGhhbmtzJiMzMjtmb3ImIzMyO3Ro
ZSYjMzI7c3VnZ2VzdGlvbiwmIzMyOw0KDQpXZSYjMzI7d2lsbCYjMzI7d2FpdCYjMzI7dGhlJiMz
MjtkZXBlbmRlbmN5JiMzMjtjb21taXQmIzMyO2lzJiMzMjthcHBsaWVkJiMzMjt0byYjMzI7KkxJ
TlVTKiYjMzI7dHJlZS4NCg0KQmVzdCYjMzI7cmVnYXJkcywmIzMyOw0KUGF1bA0KDQo8L3ByZT4N
CjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_1641794942.162722253--

