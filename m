Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461489D92B5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 08:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0748710E3D9;
	Tue, 26 Nov 2024 07:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="hZQy/y0h";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="COsPLyjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B732D10E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 07:42:49 +0000 (UTC)
X-UUID: 06917568abca11ef99858b75a2457dd9-20241126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7ZDkIf/bXOCr8+x+mKJPYLvYjhVJMCc0TctZuJjFjJE=; 
 b=hZQy/y0hVfMfklIDaGRTmCaKpL/+rZ+ekBgcBCBpqYOeQf0EZFSaOxADB1K99M8aTdhXSB9LTomKrZr4egxLJM3A7LiCrxwsd2Hvj1gYZXmQSl1kJSG/LHmby3cNSzGEW7CqFvd1DQfKhdFe3iVUIiFuVN3x1Zh5WBIM9ap5Rlw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:8872a0ae-c09c-43bb-8a42-9bd13dc39aad, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:c0168423-634f-4016-85ba-2d63e55c9400,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 06917568abca11ef99858b75a2457dd9-20241126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 128498404; Tue, 26 Nov 2024 15:42:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 15:42:44 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 15:42:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saYaV/6PUyu4FHp/YNotJJDLnos2JklWKc+u9lcl2OBkTua5Rvl6zqKsaP+2WEGaQr11IgpJBiFtYbWen//CWKrRs0PvvBShIO1d+Kgvd96YH3dOAUkTFzgFhLwlZTT1PSSiL1/OeN76vI9mExB2gF/Vi1rU+MVDrkAnS89W2iL0+PhosY5BBBQj+3UiVZkAD3sYncaCRL6pL0T7KI49OhdUYGRS7s0H6bNzV4Tqij089TBRQTSI8vaqY4A0A0XiHo4LrcA6kXo9sNaz0Ia6Rtk8fBvPUtdRi5tUeuNP1NXoLHD20kLlhzNM3wcFOk4M5rRqk5PAf7VlQPhXy1puJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrGyXdx5Uyq9w0wV0QqOzxkk/Z1o/KpkFIjJk0RXTkY=;
 b=uGMOLfr/I3GXJ39wVIJv6CyKp+ZPA1LUNHCZRBV7sShT9JVD/re6gS41/HJO/8gKhxXqvrAZ4NCAUdwiMM6fQm8DHpSg6yYR38pqEUEKwXzL447Kh/V6jigtQNa6/zQQKbjRuxssPbG0wjhVZMow+K1SgVqUxBE6mtTmQSWVMuDxNdxRMS9406h1CDr5jQtlqUEXvwObAA+OV4/zTsMrLrf9DdpUNluimcpJAHjwAk/c8e+UaOQi9a4N4jQR23zty1E+aRtIE25wRt+/eKEzw5fxPPCtP4JqeNX4FaAVsW+AXv8Ir3Ws4vBRmOPuDAzB9dVTEsisVPPCNAy3FdWGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrGyXdx5Uyq9w0wV0QqOzxkk/Z1o/KpkFIjJk0RXTkY=;
 b=COsPLyjyKgpNovplyUfqlLi2IHV74/uQ+NdknD0VKV+q9Yu3JnNPRxTSAiHor57cFeFoJcO99NUk/GWOy6+WRPI+Lunm2PVeJ6JdZRV1Ymm3y8qcASoM9kMYZcNQRZ8tOlE1g0KTwpSbEozsvU4pV1/Fi8ehxmHfDBz5vSUaQ1U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7005.apcprd03.prod.outlook.com (2603:1096:101:ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 07:42:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 07:42:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Topic: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Index: AQHbO0pF3Zp6UXdpSEmkHbI6wNkmT7LJNvSA
Date: Tue, 26 Nov 2024 07:42:40 +0000
Message-ID: <133167aa2a3fab40547f5dc6602adf2c3d9e01e5.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7005:EE_
x-ms-office365-filtering-correlation-id: 62510e81-edac-4ed8-e4bd-08dd0dede7c1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZlpQbFJvUHlGYi94OVpXQW4xMWtFNkw0ZVF2ekhSRHI0T2s2bVdsNHJmalNT?=
 =?utf-8?B?VDl0Q1RNZUgwanRWaHZ1ZzFEQjgxcU9BWjlldCtzUGN2bVMvcXdpandtVC9s?=
 =?utf-8?B?QWpMNHp4ZDl0bStzak0wQzM3aFBYRUhleEVnL0dPUGM5dExVTTg5eTRRaWhK?=
 =?utf-8?B?V1dHSGs0ZUpVbDN2WllmRUpySmcrN2tRL1hVWmI3RngreSticGsyNjhwOWdl?=
 =?utf-8?B?VVB2UlVWRVFIaGtxVFBzTS92MEFWMFpVcEdzWTFPbGpsdjgzb2NCTG1KS1RN?=
 =?utf-8?B?bjhWR2k0UzA4TzVITnpBdVVkZWdJTTA5eENXR3lUZ0s2RmVvaXlOT1FNRTJz?=
 =?utf-8?B?NWh3WnVHOXZYdHBqUnF5eXBmUy9VZytJaUFxQkl3TDZhTjhXb2ViWWRqaXRD?=
 =?utf-8?B?c2FOSFB1NGJxUUVpbXZuck0wUDZHdEtvZ1FPcml6VWRuaC9Hd3ZmTitiNlR1?=
 =?utf-8?B?UzJ1NjJjNmU1YzZzMVArUmtVMFViZ2FRdFMvN3ZKNkRGY3BzdDgvUFUyS2p6?=
 =?utf-8?B?bWtzcFRwRDJOVTN1QlM4NVVONHNRR1dQVlVSd1NUZDFlNHJWaFZ2ZElONk03?=
 =?utf-8?B?a3NabEdmMklqWGlKMVNNQUthSk4ra1hobWh4M0JLU3g2UzNxVTdlOURXc1pU?=
 =?utf-8?B?dlhXY0tDbjhONmg2Z3ZKaVlLdmpYTFd0U1B0NEdIKzdXUFpCQy9sYm9JTW1L?=
 =?utf-8?B?NUFVNC9MaHlwRFphKzFkd3JlS296TEUySk1KamhjMjIvS3lWbzRwbzFoMmV5?=
 =?utf-8?B?eXU4RWF5ZVZhY1EyZzJjYU01QlpSQlRkaTR3Wnk2UDcvcTJFYTgzYm4wUGdY?=
 =?utf-8?B?QzBlSGdFcXRnSExldGIzaTZEUU1IRHlQOC9GUW8vZFJkQVRQTjZDYm93bVFy?=
 =?utf-8?B?Y2krVTVmQmFNdkluVldPVVNTTEdzamdDK1ZDbG55eDU2aTFXN0p6N0ROVSs0?=
 =?utf-8?B?aVFINkVTS2FBQS9CUGtQUTZ0bGlhMXVMOGxNRnlkRDhIS3pMNnpOMlBYWE0v?=
 =?utf-8?B?YWIwNG1zb0dpSUluWWZmQWlzUmVjTElaU0hNeHF0Q0VzaHVQN1JRdlF0anhL?=
 =?utf-8?B?ZlE2SkdhcDFNeFA1TGdIcGZSWTNjMlFiNk0yRHJTV0hvaHJ5MVl1eWVzR0JD?=
 =?utf-8?B?MSttVUVXTmV4aHJrMGJrUlNYOGtTMmo5eC9QMWxCaExQeFpBY0ZZS2pneDJE?=
 =?utf-8?B?ejMrZnRVRS9rRkZzbk1xV2NaMk5wMFNKVWNyV01vWXFmY29zQ040cG1CdFJO?=
 =?utf-8?B?Q3pYcHUyWXRqYW9pNi83d003SXVFQmErbDNmdzl6TkNnS0JMbFYzTC9YdmFN?=
 =?utf-8?B?MGdFRnF1NVRGYWNvTE5USGVxcUhTb2thNVlJUmlTVjdNTjVReDcxSllrczdh?=
 =?utf-8?B?ZHk3MW5YcHVUc3ZqV3lONjNiL0JnOGxya2R4WWdNYUE5dGcvdVdHRGFqS08y?=
 =?utf-8?B?dE1pUWsvR1pvaTNVT2ZlaW9ULzI1MTJVTkJ6SEJMRTkzYUpkc3IrNWZWbUxo?=
 =?utf-8?B?TWVIeE1GOHp5NEhkcmRTWFEwWkgrNmR2OFJlZ0hKK2loMWliNnVXZnRhWGtx?=
 =?utf-8?B?L2dOQnhJWU44U0xDY01QeGJIc0N5a1pFMFJ2eDQwMHVIUmJkTmE3SUd2dXNh?=
 =?utf-8?B?V3lFeTYzRS9PQkNpMkJpaFg3bEpuSlNLOFp3SS9tN2RreHhRcTl0V3JEcDNh?=
 =?utf-8?B?dTJjdFVDQ0ZZVlo5T0U3eDVvd1BSSVJJUTgzb2ZJd01Ramg1bFZId2JkRUM5?=
 =?utf-8?B?bTJ6VzM1Z0R3VGpnMnVMNnFLbFVudnN2d3VlaEFTMUFOQnl6WVFWMEZNNVdv?=
 =?utf-8?B?clNSalhCb25LWXlNRTI4ME0wZzlmN2hDU0JXeHp2N2hoR0VXeXlOdElQc1Yy?=
 =?utf-8?B?WjZQMWJ3akdVUlJGdTVkVGU2Z3MzV2UwTytOQWkzalA4L3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFpnbTNvV2pJUTUxVzRjRnJvRWt0ME5iblJreFlFYWo4Y09xRHk4RnZXQmJa?=
 =?utf-8?B?VGI2NHJFSCtUQXBQaEQ2UFFvbktDbmVqbWUxZ1VIM3JqV0J1NDJ2Q1JzVm9Z?=
 =?utf-8?B?T2lXS2YyOVhSVE5nS084Mm9xRGlDUzBON0tXazgwVUhXd1JLbk9WVFMyMW56?=
 =?utf-8?B?MUt6emgzS292U1Rkd3VNaG5oQWt4U05MRkREZElSWEtiZG45azF3VEVWMzNq?=
 =?utf-8?B?UU1GWk56cStwVktEUWoxa0RmUER5OWJORFdqRWlJT2kyVzltLzdvWkVwcVM3?=
 =?utf-8?B?aHBrd2ZzbjZ0QVhGV3o1b1RINzNOdGJRd3U0T1pCNTJvejlBN3Rrb1FCY2lN?=
 =?utf-8?B?ajZ5QzYxRVNKSEd2bDU5U1FKa24xUGdiSUpKVGhKL2pqbm5VQ0phd3R0Ukdx?=
 =?utf-8?B?ZGhsa2w2bnRJTm4rc1c5andnWGNUMitUWGNEa2tyV0JzM0dncWlSOGtuT0hW?=
 =?utf-8?B?RzMrNnhaTGdMK0c5ay9WeW80eVZlbkNUUnZReCtBR2pzb2M3Qkd0UzI0YTlE?=
 =?utf-8?B?L09Ib093MHNPT2NGb1VyRmZUSmZTS0hvR3JMenJ2dTVtN3VrQmtrOWlPQkx1?=
 =?utf-8?B?azVXeFZLVEI0U1h2dXdUTjBaeGVUWUVQeW51S2N1NFB5aHY0a1ROdmNuSVJI?=
 =?utf-8?B?ZGw4OUkwNjdjRmxneDBFUXNpZVJFKzh6NXZoQ1hhZm03WDhjSUFHdkQwM1BC?=
 =?utf-8?B?L0FlQ3NRNitidEZvRXZGU09GQjVVK1ZYRjY3THc3eEJiUzZCUk1BMlNPY1RJ?=
 =?utf-8?B?Tnk5YUo2aERDNUx2aWRaVGlHSGgxN1dTVzVwSzYyNDVyMENoSnNVMjlaZ1F6?=
 =?utf-8?B?U1J6eCtpQzJ6amo3ejd3S2xpbG9rd2E2OG13OEJWRVErUWc4d0JicElKbFRC?=
 =?utf-8?B?eWRjNlRReWtSL1lzaXR4VTM4bTZJMUsyNzlMUWxNNXFZVDViN2J4L1RqRE1H?=
 =?utf-8?B?OU0zeGFUNVZWWTg1QmMrdkV0OWFwSUNYSWdXbytEUzdZQ2EvbEpoVUQydm8y?=
 =?utf-8?B?S2d3QmxyY0wrZ3k3SDQvRG9QZUF4cGhad1NhNE9lM0JzbTYyQ0RYRTY0emx6?=
 =?utf-8?B?TGJuL2VycTk1UWlYMzgzVWVEck9rL2h5aHVzL1AvWmd5eUVoYVNkWW1XU3Mr?=
 =?utf-8?B?dW9ZKzh6VlVTYlNkeGYwNWZFWVF2R09wb0JhOUtPL1FiNnhNQ0FSdlZkQzcy?=
 =?utf-8?B?VnkzRXdoSzdNR0YrdFB0aWZrcmRtL1FQWGd6VWtDelJMdVF3ekpUc2V4aWZl?=
 =?utf-8?B?VnhmeHdpWklSWTdsclZTK0h3MkFTQ0dRcjZXNFNwVjA1NHhKKzJUc29RNWky?=
 =?utf-8?B?M3lzdlBTUDZycUZrdFVwMGVXZUhaQy9pSFhOczdaNWdvS2FacS9oYVdhWHFC?=
 =?utf-8?B?eTlZL1hqeU9xaVJnZ0VkN21BaXlVbktHTnVZNngzT0wvZVNUZmZuK2E3KzJC?=
 =?utf-8?B?cEN0UnI3ajZ5eVQ3cFhKNkxVb0hvcXREMUwyT0pmVzZ6anplM0FWR3lJV3l0?=
 =?utf-8?B?SG1PVmF5dm4zS2xCeGdLNm02V0NXNUJPcWxvQTF3cHMwQkJ2d2RPSm9uUEdB?=
 =?utf-8?B?QWxLK0M4SDdTSmJpY3BWRGJTT1NmbGpTOGcyZzZTQnN1emc2MmxMVFRFd1V1?=
 =?utf-8?B?dU5wd1poeDkxUHpnZU5qSG5HOXZjN3AzNWZUWjAyTWdCNXh3N0hITE5XSVow?=
 =?utf-8?B?T0JxRncyNm5kSll0TGg5VDdTdURrQm43b1ZrZGFMeFYxT21mc0IxYnZBVGc3?=
 =?utf-8?B?SjVjblUxd1J0Zldtc3NLaE9ob3YxLzhiR3o0ZGJVd2VMTmZocVJHeWQxQ2xq?=
 =?utf-8?B?aVRJa3dicE1Ib0pKbXQ4RUpoVmk4WlJKYXhubUpsSS9FT2ovVnFFdFJFcFFj?=
 =?utf-8?B?emFuTTduS1MzOGw5ZDRUVXp4TmJwQTFuR2lrazVDeHFNVlNHU3dhT0hHNFNJ?=
 =?utf-8?B?KzdKaUJRcHJFd0lnYVhnTXBFRVUzaVFKZWpwMFZSWEswK2pSa3E2UnJlcDEx?=
 =?utf-8?B?eG5oQ2VlcllaTUZkSzJHb05lRWVieU05cnlSbTMzaGZvNmFQdHJyVzJ2cm0x?=
 =?utf-8?B?ZUFqUVJycWtJQXUyZVNYZk5Xa2dsRHY5Q3ZtN0N3emhzVTJxU1dwVENBcHB3?=
 =?utf-8?Q?9vu3YxeTitqRwYAWOb3tTgFmJ?=
Content-ID: <24750D12E0EB7E4190F6ABE637BB3DD2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62510e81-edac-4ed8-e4bd-08dd0dede7c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 07:42:40.2592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GONIA2cyO2kLoX1l0ZaEeifDsVj6y3rxybKrymJe+qvTIV4uFdq1q2sd4qCeiLzIY1bOFHDjVmRP0VjXjENRVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7005
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_756657213.248167714"
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

--__=_Part_Boundary_009_756657213.248167714
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIG5ld2VyIEhETUktVFggKEVuY29kZXIpIHYyIGFuZCBEREMgdjIgSVBzDQo+IGZvdW5kIGlu
IE1lZGlhVGVrJ3MgTVQ4MTk1LCBNVDgxODggU29DIGFuZCB0aGVpciB2YXJpYW50cywgYW5kDQo+
IGluY2x1ZGluZyBzdXBwb3J0IGZvciBkaXNwbGF5IG1vZGVzIHVwIHRvIDRrNjAgYW5kIGZvciBI
RE1JDQo+IEF1ZGlvLCBhcyBwZXIgdGhlIEhETUkgMi4wIHNwZWMuDQo+IA0KPiBIRENQIGFuZCBD
RUMgZnVuY3Rpb25hbGl0aWVzIGFyZSBhbHNvIHN1cHBvcnRlZCBieSB0aGlzIGhhcmR3YXJlLA0K
PiBidXQgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGlzIGNvbW1pdC4NCg0KQm90aCBNVDgxNzMgSERN
SSBhbmQgTVQ4MTczIENFQyBoYXMgaG90IHBsdWcgZGV0ZWN0aW9uIGludGVycnVwdC4NCkkgZG9u
J3Qga25vdyB3aHkgYnV0IE1UODE3MyBjaG9vc2UgQ0VDIHRvIGRldGVjdCBob3QgcGx1Zy4NCg0K
RG9lcyBNVDgxOTUgQ0VDIGhhcyBob3QgcGx1ZyBkZXRlY3Rpb24gaW50ZXJydXB0Pw0KSWYgaXQg
aGFzLCBtYXkgd2UgYWxpZ24gdGhlIGhvdCBwbHVnIGRldGVjdGlvbiBmbG93IHdpdGggTVQ4MTcz
Pw0KDQpUaGlzIGlzIG5vdCBhIHN0cm9uZyBzdWdnZXN0aW9uIGJlY2F1c2UgSSBkb24ndCBrbm93
IHdoeSBNVDgxNzMgY2hvb3NlIENFQyB0byBkZXRlY3QuDQpJIGp1c3Qgd2FudCBtb3JlIGZ1bmN0
aW9uIHRvIGJlIGNvbW1vbi4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+DQo+IC0tLQ0KDQo+IA0K

--__=_Part_Boundary_009_756657213.248167714
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3N1cHBvcnQmIzMy
O2ZvciYjMzI7dGhlJiMzMjtuZXdlciYjMzI7SERNSS1UWCYjMzI7KEVuY29kZXIpJiMzMjt2MiYj
MzI7YW5kJiMzMjtEREMmIzMyO3YyJiMzMjtJUHMNCiZndDsmIzMyO2ZvdW5kJiMzMjtpbiYjMzI7
TWVkaWFUZWsmIzM5O3MmIzMyO01UODE5NSwmIzMyO01UODE4OCYjMzI7U29DJiMzMjthbmQmIzMy
O3RoZWlyJiMzMjt2YXJpYW50cywmIzMyO2FuZA0KJmd0OyYjMzI7aW5jbHVkaW5nJiMzMjtzdXBw
b3J0JiMzMjtmb3ImIzMyO2Rpc3BsYXkmIzMyO21vZGVzJiMzMjt1cCYjMzI7dG8mIzMyOzRrNjAm
IzMyO2FuZCYjMzI7Zm9yJiMzMjtIRE1JDQomZ3Q7JiMzMjtBdWRpbywmIzMyO2FzJiMzMjtwZXIm
IzMyO3RoZSYjMzI7SERNSSYjMzI7Mi4wJiMzMjtzcGVjLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtI
RENQJiMzMjthbmQmIzMyO0NFQyYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjthcmUmIzMyO2Fsc28m
IzMyO3N1cHBvcnRlZCYjMzI7YnkmIzMyO3RoaXMmIzMyO2hhcmR3YXJlLA0KJmd0OyYjMzI7YnV0
JiMzMjthcmUmIzMyO25vdCYjMzI7aW5jbHVkZWQmIzMyO2luJiMzMjt0aGlzJiMzMjtjb21taXQu
DQoNCkJvdGgmIzMyO01UODE3MyYjMzI7SERNSSYjMzI7YW5kJiMzMjtNVDgxNzMmIzMyO0NFQyYj
MzI7aGFzJiMzMjtob3QmIzMyO3BsdWcmIzMyO2RldGVjdGlvbiYjMzI7aW50ZXJydXB0Lg0KSSYj
MzI7ZG9uJiMzOTt0JiMzMjtrbm93JiMzMjt3aHkmIzMyO2J1dCYjMzI7TVQ4MTczJiMzMjtjaG9v
c2UmIzMyO0NFQyYjMzI7dG8mIzMyO2RldGVjdCYjMzI7aG90JiMzMjtwbHVnLg0KDQpEb2VzJiMz
MjtNVDgxOTUmIzMyO0NFQyYjMzI7aGFzJiMzMjtob3QmIzMyO3BsdWcmIzMyO2RldGVjdGlvbiYj
MzI7aW50ZXJydXB0JiM2MzsNCklmJiMzMjtpdCYjMzI7aGFzLCYjMzI7bWF5JiMzMjt3ZSYjMzI7
YWxpZ24mIzMyO3RoZSYjMzI7aG90JiMzMjtwbHVnJiMzMjtkZXRlY3Rpb24mIzMyO2Zsb3cmIzMy
O3dpdGgmIzMyO01UODE3MyYjNjM7DQoNClRoaXMmIzMyO2lzJiMzMjtub3QmIzMyO2EmIzMyO3N0
cm9uZyYjMzI7c3VnZ2VzdGlvbiYjMzI7YmVjYXVzZSYjMzI7SSYjMzI7ZG9uJiMzOTt0JiMzMjtr
bm93JiMzMjt3aHkmIzMyO01UODE3MyYjMzI7Y2hvb3NlJiMzMjtDRUMmIzMyO3RvJiMzMjtkZXRl
Y3QuDQpJJiMzMjtqdXN0JiMzMjt3YW50JiMzMjttb3JlJiMzMjtmdW5jdGlvbiYjMzI7dG8mIzMy
O2JlJiMzMjtjb21tb24uDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Np
Z25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsm
bHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQoNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_756657213.248167714--

