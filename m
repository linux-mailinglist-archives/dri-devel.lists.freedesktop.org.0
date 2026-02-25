Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMm7LwxenmmIUwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 03:27:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFF190E2C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 03:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5231010E34D;
	Wed, 25 Feb 2026 02:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sefHUzuf";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FlgBdv1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC3E10E34D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 02:27:20 +0000 (UTC)
X-UUID: 8025c41811f111f1b7fc4fdb8733b2bc-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=En9iWndGxRyGWu0InPU9qvTaP8biWQuWgWworemU8Qo=; 
 b=sefHUzufZZijxJf7loELPlsLb8L++0cEqr1ZRY6mUFfZ95UVApRKK2XnTRaKR0xmZaJ8rBfoqZBx9Kq6KCUfesTp8xaPG1kmWaE4kQ2obRjtugsFQgESP/GjxfQUEqTe//qJxn7GDTufLPmr358rkNRnWYxJy3jwX01cGEoBdRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:3bb1dd21-ea86-4c0a-8d7b-ae85a593b35a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:002f3c7b-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8025c41811f111f1b7fc4fdb8733b2bc-20260225
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 719567344; Wed, 25 Feb 2026 10:27:15 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 10:27:14 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 10:27:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0SadIK68yUq686RCDLK1XPeleAKf6jqRExR+kEjaS0b+aQ1r8b4JI1PcPbJzodqK29ONBcfK256+Y4NwwSD//1HKutJwEmT6w9YvfYjw5AT3ufl3uDJjI8jAVt9jjaWA6kqcXg9xIOSQbRvyLMRtsLzyTZiN92Se7+yFpczVOtPu12OQH6SXdnLEmWQKCMnHCsGV4U7/eWjpjXgJ83G9Nopv0VeGe7QGVUapZfBLSK/VzIWbwcdu9Tkb8+FB2HjZtp1mF3Q53B3KXeuCawXQFGhfHaAkdlSOKXYrxvPFMRLWsAeFTyRb8N9C9/IdTtpVQQ0NOnm99lPSRkFyw/GTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80Tu4zNGuCwxovsU3J5ZUopRLp3eJfKaycLTh+B01yI=;
 b=pzZlN8uEXrmZJhtjuDt/MQWp8G2/Hfzsh9GcFBcPNaQjfcwlsFvlna0uXp0QsxOg35JivFCq+VBVf3oqPVLEN6pgB1cHrn/u2zyQO4dph/1VHhC3Qj0ofQcRwmLvme46C4LbnM6+ueBldvH9OZA9tA7zyE/SgEPbu0yaeMakxwjjAzn3AyTXTYmBP9fCK1Si4WhK/Zd7I1z105X26VDIKLZ2Y/ejMatfhi8Y+AV3yiFf6bstWTelrHBxQ8rZoGr2sAtG9aic+ZgzudqbGXZ9dX3i+F5m/CiXMT6lmm3a+90QGFfVq7C/lqWZGcNyaImEKvn05ZvNUvpGDHO6MEcWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80Tu4zNGuCwxovsU3J5ZUopRLp3eJfKaycLTh+B01yI=;
 b=FlgBdv1UmaDle0D1UIc2uA+WyN0kyoZ6mOpZZTaNyV8jFx1dagQCxUaOGUmleR5QUA7BwCjh2f4jl4/lAaD8oDIfj6YC297rMNcDcsZ/Vy3rCO9x3BGuUWO7Sosi9mGYbjBolAQxXp8Egjd8+Kzkv891ageOwqDlA8++DXUENzY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KUZPR03MB9640.apcprd03.prod.outlook.com (2603:1096:d10:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:27:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 02:27:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "krzysztof.kozlowski@oss.qualcomm.com"
 <krzysztof.kozlowski@oss.qualcomm.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "mripard@kernel.org"
 <mripard@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
Thread-Topic: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
Thread-Index: AQHcpOFMvBPfzA8LwE+UMae7K1msq7WSsruA
Date: Wed, 25 Feb 2026 02:27:11 +0000
Message-ID: <ea7015f3e3215b67dc5ca009fff428b72f8dcc5f.camel@mediatek.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
 <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KUZPR03MB9640:EE_
x-ms-office365-filtering-correlation-id: ad8d445f-d962-4a85-3419-08de741561dd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MjlaRW92Ly90bWFXR2oyM3hLN3NyQWdyY0ZJZDkyaXpUK0tLWHpWbFBzSDJi?=
 =?utf-8?B?UGdlMDRqUFlZL2dtSS9lMXpNOGlnSG5xTXhFNUFWc2thMXpiMlFyS050Z3lB?=
 =?utf-8?B?cWtmcFBQdU41S2plNkwzKy9xcnNPNTRzY2hObzFoaTFmN2FBSld4eENnVVNL?=
 =?utf-8?B?eUFZNWhrWVExM0RVZWhDeVJtVVN5YWFJUExmd3o4QVFFaGNjRHA1Mlhka1R3?=
 =?utf-8?B?VzZ2eTMzSU9hQm03MU9XT3ByOFczV281Z0hYbU5OenFIN1dNeVlvYSt6TGky?=
 =?utf-8?B?N0VhT2NMbjl3UEpPeEFwM2NFS3ZDcE9nb2tCR3lJcEhzVk1ZUzBDM1FZdkxK?=
 =?utf-8?B?aTJQcDRoYWFLY2lxTzZFcUJuQy9nSmFQbnU5RnhNMzZ2UGJ3eVJyZVpBZG1H?=
 =?utf-8?B?UllaRzJ6cjZkOTQ4ZzRnSHlsWjI5SmI3MFJDV1dOYlpHK3ZxTzJucE9OY1NK?=
 =?utf-8?B?WGNKekprQ3BaYXdKSHVTS29XWlc1TWNac0JGVGhJTmpoNVBiZ21jRVBQajZP?=
 =?utf-8?B?TTlVWERYYndVaGJqa1U0RGMxVnNxT3oyZUJTZzVmRWEwVm1KQ0dTcHlpUjNl?=
 =?utf-8?B?WWtoYTFsZHIyNHZPcnF6MWd2Zkp0MnZ2RmVmV21sQ0xKa1AwMXl1OTZ0aG84?=
 =?utf-8?B?M2orZmtMOGcvVlovN0I2OE5hK1h2STJEM281Vmlxdi9XYzRRbnA2U0lCWmpL?=
 =?utf-8?B?bDlKc1g4YzcvTmxGeGRYbUhjRzZFWXRNaUdqUnBINEpMeXdEcjJjOVBqOWFq?=
 =?utf-8?B?dk1XSmRJSll0UFBYSm9zcmFxOGwvTmFsVmQ0cFc0MG4xcEM4eEVOdm1CL3ZO?=
 =?utf-8?B?S2pmU0JlbjMwTytKd3V1ZXlYK3Z2dXJBdS83QTdOTEFvSkk4TXNLS0xxVmJw?=
 =?utf-8?B?VEMzd1kvYnVGWnBkZlVNcUpiQ3I1QTNVM3hXRjJjaFZSa2c0RFVYUGsveXpD?=
 =?utf-8?B?bHJHc3kyNUZpS2ZUYWdTWllTMkFPTkF4RWZUaVdiR2o3cHM0MStrN2FLcWY4?=
 =?utf-8?B?eWZkL3lDWUVWcm5KUGN5WElBZGtIMmVzUHRlSGtGTWNnZXBiakdlNzFLcktp?=
 =?utf-8?B?S1Z2M2lnYW40TmhLUmpuZFEwd09XMW5nS2RtbjVtWjdySS9rd0IrTUlJTWJi?=
 =?utf-8?B?dnd0MkloOS9PYmNTQmEzRk5SWnAyaC9OQ29Kc0RlVTNHckt5em5mQnM2a0FD?=
 =?utf-8?B?aVM5NjVsZ0dkL00vNzVWYTdRSDYvd1VGK0toMmVFbmRlSnl4aGNleDA5VlJ2?=
 =?utf-8?B?SGNzQmdvZUN5YVR5SXJoRFIrdS94dHEvSGhaZEZuT2tCZm1OZzVqaWNYaFFR?=
 =?utf-8?B?eU1EZjVmL0JIdU95SFUxWFBhNFBzck1UaU9BV0RPZTlYODk4bDdTdTZ4Vkgy?=
 =?utf-8?B?Q1BDZTI1bVhiNW05UTNlcW1ZcVA2MEJSRlhnYXZYKzVXaTVxY3ZiQ2RxTXk3?=
 =?utf-8?B?dnhOWUlCV3UyYXlsOW5uYnFOaU92NHV2ZDdCbm1zaktQTmY2V3NCVVk0SmxQ?=
 =?utf-8?B?MlZMMGtldy9KYTFtSEp1N1FJOXArVyt4UXdVT3dLSiswVjM2d1ppT1p1NjEz?=
 =?utf-8?B?T0FhMXJyQndSSDRYaEpOV3RMWW0yeGsrcHl2VExpbEZzeUlGb2FYcHFEZy96?=
 =?utf-8?B?MEU1VDk0TTlIaXlqQ1FlTVdtekh3UEFUQ3I0cWYwaUNEYVdZRXZhVFNaYzhh?=
 =?utf-8?B?WXQ4ajNmdCtBQ2RnbUdzc3JicTZ0S2N0NnFpU2dCaFBZVkVrbzdxZlpUbzJL?=
 =?utf-8?B?amRrVk9YejdoRHdCU1daamhPcWlycEhtSGt5T21Ha3UxMmh3cnZTbXFIQXFJ?=
 =?utf-8?B?czNxNzF6RHI1NUdmeWhVekRsQlF1emhUN3FBeTdoQW5LZVZRTmI1bDc0OC85?=
 =?utf-8?B?UVJlME4ramVoQ3M5REwyY0Z4TFdEOWFlaHJuWUc4cndRaXREUGNtTUxMRUp1?=
 =?utf-8?B?MFR0T3ZOTnMzeVR1MWN6dXZFRW1yVVZSNnp6Y01qZmtsSkFqS1c3bS9nRy8x?=
 =?utf-8?B?Q1AzQ2NJU0tRUlYyVnA4UThOelNTcFNlS21va3QyZWc1bnE3Rlg3cWIxMUIv?=
 =?utf-8?B?bjVVODhndStZTEVlM0lzVUpqVzVDc0s1R1hSQ25wRGNxMUUyYWZyblhGOGxN?=
 =?utf-8?B?WThaSUVONDZiQTF6Y0w1UlZjNy9ONkdzekE0dzZRMlRzNlVCTVpWb2dZY2l2?=
 =?utf-8?Q?pYe92cTm9eb910tKbps9Tt0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFJiaEJyb08yYnFkaGdJdW1tMkFKZWdyYmRlNUM1bXB0TjI1V1psb2tZdzM1?=
 =?utf-8?B?Y095Q2ZZYkNJcFpJdmVMSVNWNkMrTXNETzZqejBKOEw1ZmUyRkV3cS9vdGc3?=
 =?utf-8?B?NnVuWGh5bDhORnhMTXRVTW5waktwWW5QeHNSTDhUUkNPcG9yRmFvSk4xaGhs?=
 =?utf-8?B?QngvT0lUbENJM0NtcGRoUGdoeDI0RVBCSEFhMytINk0xOUhWRlF5S0QxT2hq?=
 =?utf-8?B?K2h4VTVnQ2dFQzB6Qnh4K2xMTXYzZjQwTk9ZQ20vTU1wYUNkK3VZZ3lMQ3JE?=
 =?utf-8?B?THZlQjM5ajdtc1A2azczb0dSWEgvR1BTd3hxYXNuUEV4MmlhR3d5RWUzUTJC?=
 =?utf-8?B?NjlHNWsyVDB3L2swOU9HUlRQQkE1RG95NlYzZG5BeHRDUENkZlJFUXNuM05F?=
 =?utf-8?B?aHNpMXNtK2plSStvTWVVa3oyMHJEMTNCQXEyZmQ4RWxGUkVFcDhwTkYxZnlT?=
 =?utf-8?B?VGkyYnZYUEErNm1ZK044UW8zVGxOb3JoYXE5cG1LbU9NY2ZJWVJUbDhRekl3?=
 =?utf-8?B?YkowQmExbVlvMnlha0h2bkdLUnRFVVZrY3VrcVUxV3plNjVjU1dvbmJ1VUI5?=
 =?utf-8?B?aXRDU3lleFozVnhOMzVsMHJiclhQTGdUanlBU1MvM3ROMHlSbjFlQ1hSei9G?=
 =?utf-8?B?M3lwZDZ5TzJZZEhSQUNOcFRQZ2pKMnMxSlA3dkhrUGZwRXFod3l4MmtUcWkx?=
 =?utf-8?B?QnZUcXFmalFHaytKbGs0NXEvOGVvSmFybFpLTzIvYzhiWjN4dndhTnRGL0ow?=
 =?utf-8?B?UDZ6OXgwd29QWCt6eS9PVmE5bHdVd21iWVRFa21BZGx3NGNvSmkyN3ZlOThE?=
 =?utf-8?B?d29sZFZFTENlODZpdElsTHFoTDdDL0hocCt5MFVxQ21aT3ZxZ1ZaSjRzMTFD?=
 =?utf-8?B?T2dSTDVJNE1COVRDbXJQLzZIZVpzME0vZW1wL0ZnbmNGbi9LS2ViSUd4T3Vh?=
 =?utf-8?B?eGwwQ0N1RkVQOCs3SVphSzV3eng0T1Nmd0RwbUNWem5rd1lOQTA4em9oaXRR?=
 =?utf-8?B?VW00dkNuL0JESk0zK2JTNFBnUnh1SVNZOWJOTTF1WHQ0QmswclljdDUwQ01O?=
 =?utf-8?B?QmhvMVRoa3lZRmVqWEVnWnZMUGdsMGRJcnNuTUY5WEpTdHVmWUY2QUNDYUN0?=
 =?utf-8?B?bjVOVDhkaktZYXpGMnpHVjhLL3F2YW1VOUMveUlvM0tUMjhieXlhUmp5VlQx?=
 =?utf-8?B?R1pjQWZiYjQ2bEZQZlRZbzVRcThnSFRtOUpFeExqS0FhYmQ4ZVFRcFY2YXcz?=
 =?utf-8?B?MU0zbjd5N0RCelhtbEVnd0Z3U1F0UlkzYU5jblJjMEFEZTFSTW9FbVNCK0JT?=
 =?utf-8?B?bG5hTGtnM3BmZ29kbjBwdEllRXhEUFVwRTE2bDVLVHVBa3VmT05yMUVQRlpS?=
 =?utf-8?B?V3pJS0g5S1FzNUQrNDlCU0RSVS9xaUNtblJpeU1zcUxGWjAzMnNHKzNqSnlF?=
 =?utf-8?B?bWpxQTlyeStSa1BpK1h3bmNjTXk0OFV5eTBtNWUrWnplUFFxOHEyMStycUp3?=
 =?utf-8?B?NUxWd2l1S2pScGxoQnkvZVZpQURnVjNiNlR0dFdnaTFPS1lPOWo1UUp1ZGVx?=
 =?utf-8?B?OEV0cEdocHJQKzRheGErY29MMVRwdXBjOG04NG0vUkJJYk1hTjdrMzNvUTl6?=
 =?utf-8?B?R3RjMmdoNWU3N1VWVDZIbVlMVmdkWWVSRHRlNkVWR2Nsbm9ablNZU0tmbUxW?=
 =?utf-8?B?bHdoeHdZMFpWVlp3R2xTVXdkeHRtc0tzckJXaEdKR2w1WHpOQjNzL2F6ejZF?=
 =?utf-8?B?bzNnWThXWC9VWElGQ0R3djdCK2hXdDZxZ3NsVHZscWhVR3ppeVgyVTBJemI0?=
 =?utf-8?B?c2VWOTFVWnBFaUhlRnFPL0h4MndQb3NobkJxdGFiV0NJUlFJVkJpdCtFQVlP?=
 =?utf-8?B?d1hkRG9XTitBeDBwejIvcHZ5NUZPcmt2dHhMTi9JYW1TRDEvWjlYQk1SalVh?=
 =?utf-8?B?N2FSdXYrY2FWR2drSTJ3Rlo5aWhxWDBMcmpOZ2xRRGQyalBxZVEwM3NWZFZ1?=
 =?utf-8?B?cjRiVlU3VjFLOXJOaDA2bHBEaEVHTHNORnRFc3dMSUo4SHBOc3ZZOW5DQnQ4?=
 =?utf-8?B?UXpNZVBPeW5GMXNsU0RzMEFpYTVZeGpaaWJLWXUvU0JFKzY1SHdlUGZZck1Z?=
 =?utf-8?B?cldoWkFoekxqSE5mZWZnbzdoUlhTWE00VStFMUNaYzlUUkFJYXRhZHJJQzVo?=
 =?utf-8?B?cVBaeVRac0dZS1dvKzVRV2RQUHlaM2RoR1pBVXpwZyt0UEM5RDN3cDFaYUkr?=
 =?utf-8?B?UmdQL0dqaUpDU2V6NGVyMFhVbVVkSTlvMm1LWUFjaWsrYVBqeUpPYmlDRGhV?=
 =?utf-8?B?elRFaHlLMXRWaGk4bUZCZGlTUW03ZFJ2Q0ZOR1dQN3JOTFU2TUhvZz09?=
Content-ID: <C1D50009209FE8478D05CD3CA80EF2D2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y7hwaJVjR7pmv0cB5lGj8/O4vn2pfHLjnxjx6rz+wUQmQBT23zpnqEg4bFqCUkHkUsIZNdiJ8/G2vKv+5QDNE+IlquCtzLWwhwpcerfFN+yRMy6YGZVWmIHs6tzzuClbe4xnshZ7+bQQtjHt3HAqbkf6u0zOtuUac443RbH73UuIcEit5C7Il6quNzVgcT3F2soqsrc08hsdO6LdDFN9o/ifepY5ljrnNcHGDNEeL8bRBMGrVPm/lP6rgyvsZ3e3WQT03zYjNvP6oBH8Y5+cCtrMg+cElxfdqJcAYXLzZAhCD55XuwY9WLiMviWslfB6ge7W9RTAugRSDA7dHhthpw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d445f-d962-4a85-3419-08de741561dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:27:11.8034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7c107R5G/tTBWzDfywWDtyjqUH4UN0hIvnkkWSx46SFFpqDZEjCheWWhPoflUICHIn+LvLEAuwIRDw1nnEN8SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9640
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1140624363.784685255"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:robh@kernel.org,m:Chunfeng.Yun@mediatek.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:mripard@kernel.org,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:conor+dt@kernel.org,m:chunkuang.hu@kernel.org,m:vkoul@kernel.org,m:krzk+dt@kernel.org,m:linux-phy@lists.infradead.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:devicetree@vger.kernel.org,m:lscorcia@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,mediatek.com,oss.qualcomm.com,ffwll.ch,suse.de,collabora.com,vger.kernel.org,linux.intel.com,lists.infradead.org,pengutronix.de,lists.freedesktop.org,gmail.com,linaro.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CBFF190E2C
X-Rspamd-Action: no action

--__=_Part_Boundary_003_1140624363.784685255
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDE2OjIyICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBtdDgxNjcg
U29DOiB0aGUgRFNJIFBIWSBmb3VuZA0KPiBpbiB0aGlzIGNoaXAgaXMgZnVsbHkgY29tcGF0aWJs
ZSB3aXRoIHRoZSBvbmUgZm91bmQgaW4gdGhlIG10MjcwMSBTb0MuDQoNClJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIExl
b25hcmRvIFNjb3JjaWEgPGwuc2NvcmNpYUBnbWFpbC5jb20+DQo+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sIHwgMSArDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQo+IGluZGV4
IGFjZGJjZTkzN2IwYS4uYzZkMGJiZGJlMGUyIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFt
bA0KPiBAQCAtMjMsNiArMjMsNyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgLSBpdGVtczoNCj4g
ICAgICAgICAgICAtIGVudW06DQo+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLW1p
cGktdHgNCj4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxNjctbWlwaS10eA0KPiAgICAg
ICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10MjcwMS1taXBpLXR4DQo+ICAgICAgICAtIGl0ZW1z
Og0KPiAgICAgICAgICAgIC0gZW51bToNCj4gLS0NCj4gMi40My4wDQo+IA0KPiANCg0K

--__=_Part_Boundary_003_1140624363.784685255
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjYtMDItMjMmIzMyO2F0
JiMzMjsxNjoyMiYjMzI7KzAwMDAsJiMzMjtMdWNhJiMzMjtMZW9uYXJkbyYjMzI7U2NvcmNpYSYj
MzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYj
MzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0
YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUm
IzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRl
ayYjMzI7bXQ4MTY3JiMzMjtTb0M6JiMzMjt0aGUmIzMyO0RTSSYjMzI7UEhZJiMzMjtmb3VuZA0K
Jmd0OyYjMzI7aW4mIzMyO3RoaXMmIzMyO2NoaXAmIzMyO2lzJiMzMjtmdWxseSYjMzI7Y29tcGF0
aWJsZSYjMzI7d2l0aCYjMzI7dGhlJiMzMjtvbmUmIzMyO2ZvdW5kJiMzMjtpbiYjMzI7dGhlJiMz
MjttdDI3MDEmIzMyO1NvQy4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtj
ay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1i
eTomIzMyO0x1Y2EmIzMyO0xlb25hcmRvJiMzMjtTY29yY2lhJiMzMjsmbHQ7bC5zY29yY2lhQGdt
YWlsLmNvbSZndDsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYj
MzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbSZndDsNCiZndDsmIzMyO0Fja2VkLWJ5OiYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dz
a2kmIzMyOyZsdDtrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20mZ3Q7DQomZ3Q7
JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwmIzMyO3wmIzMyOzEmIzMyOysNCiZndDsmIzMyOyYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKQ0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbCYjMzI7Yi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbA0KJmd0OyYjMzI7
aW5kZXgmIzMyO2FjZGJjZTkzN2IwYS4uYzZkMGJiZGJlMGUyJiMzMjsxMDA2NDQNCiZndDsmIzMy
Oy0tLSYjMzI7YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVr
LGRzaS1waHkueWFtbA0KJmd0OyYjMzI7KysrJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQomZ3Q7JiMzMjtAQCYjMzI7LTIz
LDYmIzMyOysyMyw3JiMzMjtAQCYjMzI7cHJvcGVydGllczoNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7aXRlbXM6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7ZW51bToN
CiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10NzYyMy1taXBpLXR4
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE2Ny1taXBpLXR4DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7LSYjMzI7Y29uc3Q6JiMzMjttZWRpYXRlayxtdDI3MDEtbWlwaS10eA0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtpdGVtczoNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjst
JiMzMjtlbnVtOg0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDMuMA0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0t
ey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQog
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlp
bmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBk
byBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBw
ZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_1140624363.784685255--

