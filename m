Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD49F8C5F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 07:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B76210E4C5;
	Fri, 20 Dec 2024 06:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="REU2AsrO";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="f//QASf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B4410E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 06:09:52 +0000 (UTC)
X-UUID: 035e46dcbe9911efbd192953cf12861f-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LVGKIRfLSDZRG1GFtzp5wvDGkz46Z646mwoZl+ee2MU=; 
 b=REU2AsrOZv9YSAeKetB2xj+cQdgHO1OQ12RwLrydcuek7MnROffrIOeLXU9c/A+BK+6cdMJXXzgY/YXuoQOFZuJjAtLXB0cFDDH36LPMUKPhkPgk7W6tZFCdiI7VmBZWCRjvkAnV0XCvA8Q9ppJNoh+Ev8lWhhb67FWkUyeTV7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:79bf6750-82f4-406c-9eb1-2011f56ce478, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:d5e054e6-8d52-4d8f-9f93-b258cf7bc333,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 035e46dcbe9911efbd192953cf12861f-20241220
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 895904602; Fri, 20 Dec 2024 14:09:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 14:09:45 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 14:09:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roMpklUweBwknI62YD4mC47gjS87jcTYZ5YzQlJmx/gckh+UoecgCyti9+iAHe2nlxcyIezU7ATzr61QyKeVoDo4cfoaKY1TBCcPxUxnIu9Qc7gWvpfjOhHVdbixTmOGx5x+Fp7BbsW1N5kjQdgNeFL5s/uxzWavVL+uveGTW1uIr1vNixIqFuy2byb69OxJUbOMUIsAms99w8FRDisj49gWkkqlaQU24dZ0zldIBPd1S9chJ6HEfV9bSM21Cz77oJDGvh5NbF2mKKEiUq2IEUCelliQVkxncCX2WayGEvF7qQ3cW16iRMzgA8wvZEqML2pxZGjCenqXu5rZdWfBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IAzXde6cpTjW8cfrvW51Jcieryj5YvybSe1WZ6ZxFU=;
 b=T+muJjP3PD+a8DQscLNDnuPCRx3e/DFVnnIhYYnVUlAuwN0oZ8u4oUwmX9tOG453GVitFaJ15smhF3mi5vdd+8B60c2aIvm/uzo1hTzvoFajEtZhk2/U6RnfZ/Sn+kNAhqt6loQQy7vkM/WftWYiXbQ83fCMEJUHjuLH5Ipc/wVBeOfKM+gysKyTvsNu9ws8rIvfTk01TfjjOVnK4lSZ3XYojB7g/xhk4yEV9FmOaQ490noOf8yBJHnn8jeD0Y+sY7ZPBfnog20F9FFX5SQTISg4KFM4HnOxWZEZXlTWlk03oN3D37AphiOZogiMR1pqasC3TwnWJ67dMbTTXRVijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IAzXde6cpTjW8cfrvW51Jcieryj5YvybSe1WZ6ZxFU=;
 b=f//QASf6y9bPGetwxcPnZGQVUtUTEnsqBtxDragtqW6TiLRl67ynAKZRSdG5hK0gLmqyWAS+IfJFVz7m+1VmeHvKijXIVb1lbdrkkBK51bozTU1gxanwoXlpQilZTSBiSscgfcHgySU/KdE+CwtBohYHFVVWz/osGUVPDlefi08=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8223.apcprd03.prod.outlook.com (2603:1096:405:15::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 06:09:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 06:09:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 18/33] drm/mediatek: mtk_hdmi: Move vendor/product
 strings to drm_bridge
Thread-Topic: [PATCH v3 18/33] drm/mediatek: mtk_hdmi: Move vendor/product
 strings to drm_bridge
Thread-Index: AQHbUJq0gwwfSAqNM0+NcGMydc6TirLuqk8A
Date: Fri, 20 Dec 2024 06:09:43 +0000
Message-ID: <c93c81878ca5f45e2b7cf16863f1e4ab85f957e5.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-19-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8223:EE_
x-ms-office365-filtering-correlation-id: 592aba0d-c707-4484-628a-08dd20bce56d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cVRZZVd2cURyZ0piTmJIK0tNc3BwZUZ0elZEVXAwZGVMTFAyaXRZVGpxMWQ1?=
 =?utf-8?B?R3c5ZlZOakdFUW9MTThWdkZRaFBxVGVEanFqbEo1UkxXN2RIQUFHOThlV3F4?=
 =?utf-8?B?dW4xYnFhVUROTGxMN3Y0dFNadWF0b2FIRlU5MnVTMWc3RkppVThyTkF2YkVk?=
 =?utf-8?B?SUdnZlJ1TCtqbkNWcTNJQ3ZOMGo4eDAvQUU4ZjdBSmJVN3ZEQzNhUkFTUit5?=
 =?utf-8?B?andCL2hHRWtheGVhNkQ1M0ZDbC9MY00xRnVDblBVZy9wNWdBME1xNW9URUxJ?=
 =?utf-8?B?VjV3ZEgxU0V3T0FsSzQwTysyUWNxNjZmUjk1cUV5QzcybXdnRHJndHIvYWRo?=
 =?utf-8?B?SzJZNlNraHFyck1Nenp4dlhpeHdjZEVuY3NsRmZOT0JMeWRNbnFlcXFGMnpk?=
 =?utf-8?B?Y0Z2TXJTck1HWkN4RmxKZEdYUWV6UGgvVHU0R2QzdGZVMnBtQURDM0ZHOXI0?=
 =?utf-8?B?dDRFS2xqTmtGdWJPM2p6SlFjWldOeUZwOENKYy9oSlBFNEF2N050NVBNZXBO?=
 =?utf-8?B?cy9xVVNQQVFvV0ZtNytUd3k5YU5iY0JveWprY3lMaGFYb1U1QmtkdVM3Y0k1?=
 =?utf-8?B?cGRZdFBXUzIwZTllc1I5bll0SjVBYU1ycU9KMS94VG9salpLV09TWC90ajRQ?=
 =?utf-8?B?S1dRLzRiZ01SVzNOenFkcGFudVNCWi80UUt4MWpmTjc0Y0FWUVZLV3BGa1pv?=
 =?utf-8?B?aTYxaXpLZTRtenJOdFJDV3l4Y3ZwL0NlSWh4VnJSWVJZaktZWFVkc3ZkVWhB?=
 =?utf-8?B?cGV0dXM5RU8vWmM5YUF1V3RCSG5POEM1MzRKODh5SjViM1hKYi9UM2pxRk1Q?=
 =?utf-8?B?dFJTelllaEtkU29YWDFyMDJXRmRKYzE5MDFzTE8zUk81RUNtOHg0MFZsNzJD?=
 =?utf-8?B?dENoeVVYQ3oxU1lxK2wyL3BEbHNyWVVpTW1HaVNoc1V4T3VyVkFMZzR3ZVN4?=
 =?utf-8?B?VS8wUnBTYzVqeGhiWjBseFhiMUhoZHBFSGVEVjRnZUQzakxIRjVkVm5nSFA3?=
 =?utf-8?B?RW11NDZMQW44UUR3U1BSWEwrblNnZFlvYnZxcTAyNENZYm9PSmhicCtaOUVw?=
 =?utf-8?B?U1lpd3o5Y0ZlVGwxUnUwcnVrMlluY3VTa2hUaEtDNXJ0dVZSQ0pueklRLzh5?=
 =?utf-8?B?TWNnd0ptbm91cXRKVFZqenhBYnBMNnRxNDVjNHdnbHVEVWs0WDY3dnM4eHZS?=
 =?utf-8?B?U3NDUkd2bHBxUEhOV01iTzFhMU96UWhqdWwxMitWQ3RsNVFXdWl2bGRjcmhD?=
 =?utf-8?B?WmkrZm1iQlJCbktKSEdZdCt2c0RKQy96WFVTOGlid2ZsOGZER3ZNRklCbE5U?=
 =?utf-8?B?ZWZSRlBkSm0zUmRKUHNsYWdKK1lwQ2pRMWgvOFd0VFJXYnM2R2w2L1ZzQVc2?=
 =?utf-8?B?MGhMM3lkQVhmay9CazJJUHFYajFwZmFyUGh2ZjhUMGt6eHlZdVRKV2pFbEtI?=
 =?utf-8?B?V3ZWays4cmRXYmdzTEQyWmtKeEsrTDNuN0pyRDUwRnh0cW5rZWpaRDUwRXRN?=
 =?utf-8?B?YlJrbUw3bTVqd2czQkMzblAxblRYRmpraWFTWVZEbVVmQmhDSGtSVmFCU2FD?=
 =?utf-8?B?a01LOTVST3ZFVkdlWjZwYkRkbTV4bHBqOVNFbmhnU3hoRXU4SGRKSGFIQnNz?=
 =?utf-8?B?SFRPNm5lYmpVa2d6R2ljZnp1Y2NtVG0xQVBJZ2QxS0tBVkZ6eHBITWhieVhq?=
 =?utf-8?B?UGh3ajY5ZWpxNjdzU2swN0hpcmNzNjczRk50ZEkyNkhUVjFxbVZsVEVRelhG?=
 =?utf-8?B?OFgzSUN2RUNiWm05MDhLblp6QUZCRGZJcXRlYTNXMnZVZ3NOeFF0R0ZPbXNq?=
 =?utf-8?B?R1hRN25nK0Nmd1FpSThJdmRuMktsTDc0YnNkcVRnWkxHczhRcC9QWEJZR1V0?=
 =?utf-8?B?UzJMb0RWMHB2MkZKU0x4NFNpeEJCU0FScVUzS1BMdUJpbnhQSVVCZi9zN1VL?=
 =?utf-8?Q?U8MICf0UwgTzdVHaXowKIQGTzEjpiJIY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkdYMUMwaHg0VWk1UHZQTUJXaWxDdzNuK0E4S2ptLzNyK04wZnlEdm5yOTBG?=
 =?utf-8?B?RzduZmVUWDVXSmJCSUFVWHdjc25BNEhFalppdVFnRTVBa2t5K2I5UzdTNVZp?=
 =?utf-8?B?SkRkcy83N3pkc1RkVGY5WjZQY1JTcWdpWCtJdDlQVnprV24wTmZUemNzK1Zu?=
 =?utf-8?B?V0FJMElXRStwbTgxSGpGV3FQNXdCWkE1TnhTWEJOa2JycnIrYzh1NjVqNlVO?=
 =?utf-8?B?ZU13RDZFMnFNeTVXcXZRa3VaZkVPOW4vZjJ5b2RIcXBTb0VscFF5dUhmcTZI?=
 =?utf-8?B?bFNscjdPdm5SS0V4ek9NeHNZRC92UGRiY1Y3TnF2VnVYdTNFd3ROc3A5V2k0?=
 =?utf-8?B?TzdOeHJCL0gvSiswaWZkZk91d1ZsOHdPNEd1YTlmRkNLbzBRY2JtOWFRRFBY?=
 =?utf-8?B?RmlnNVN4ejRWSlpRYXVuNmUvVUtiYm1CRDFiS1pOZnZyTXlqenBpVE11RzZF?=
 =?utf-8?B?T2NlNWt4VmFVZTFWSlVlb3JSZVlkNkFFSmdOUVZjcy8xU294MmhRZXErYnJy?=
 =?utf-8?B?WWJ4NmVTdi9UblZXaElyL0c5L3dtVUpBcTk0em5aTXJHYkZuYlVSbjNKbmxk?=
 =?utf-8?B?NTBLNG1EUjUxTExFK1ZOOVFNR1NQeXhsL0lyemNqVS9wSS9uZ21Wcm1zNVB0?=
 =?utf-8?B?alBMcGZnNnhpQ3VzcVFwclB5VjZRTjM0dExYanJnMHNkajNkNE84K3pxQVBj?=
 =?utf-8?B?cmdRSW1wOEZYQjZSek02RG9Ea2xpNVVCdEdOL0NUZXk0dEJoQkYwY2krWTk2?=
 =?utf-8?B?anJ1SEpnb2xOaiswZ3ZDZkd2bHltL2pBNlVjRkZ1WEw1SmRDZjlwVHBkOVRI?=
 =?utf-8?B?WkluV3ZCa1g3cUhRY1JVd1kvWFRjOGh6ZTYyL3ZpY05LTFJoWkxOaHg2RzBP?=
 =?utf-8?B?ellKSzFueWFYUUd6eEx2SzZNaW1xbmFNR3JTT3V1UTZab0ZoZWc3dmEwWndx?=
 =?utf-8?B?VzBuN1N5RmwzTDBnYWwvaDNXbnZpZkJIMlhQbWg4ZTFQK3NVNXJ1WnJYOFhU?=
 =?utf-8?B?U2paMkZsSmUyemRvUFhxT2FPbFZlSWROekprSXhBT2diRUZiN2hnL1Zacm9Z?=
 =?utf-8?B?VTREY2U4SjdOeXdIdndCVVRCRmo1VlpiVEZSVS8vNnoycHpKdXdya21YMmpM?=
 =?utf-8?B?YkZEb0x4MU92enhNZnpKWVVJZUdqQWRmZXhBR1NJaVNLajh6enhuK0ZlR1pU?=
 =?utf-8?B?S1BMaGczMU45OG1lclNrSU9YejJ3Z1pmYk11aGtXakN4c1hrMERHc0ZSYUg1?=
 =?utf-8?B?N2puaVBrUVhqNFF5SWtzVEZ3d2VROU40djlNaXlmcjcrSHpCcnZoWVVEb2Iz?=
 =?utf-8?B?dG11V3B4djNRSHg0U2h3OHJLRVc1bE9yc0VIdWI0bTlIUUwvYkxLQUNWLzZa?=
 =?utf-8?B?YWE0eDc0aFZheUdmbFRrdG5NS3p6dVFtYVYxb3B6NTgvMzVka2sxU2V4dU0x?=
 =?utf-8?B?RUpvN2gxdlhZZHFqai9KRC9SZ0dPcjYvMjltYmpHYXZXZmxHcFo4RzBocGhH?=
 =?utf-8?B?Vk5POUcxdXdJd21pYTdVR1FCSXFzeU04eEtRS2pYNE9zSTYyNlM3VVBaSE9v?=
 =?utf-8?B?S3kvM1VYdFJsMHVpQ1BwWUNacDRoQm4wbC9LYkdJb0ZHUWJ2d0l3WHZZSjc3?=
 =?utf-8?B?WE1rQ3hHbmRFLzlmejF4NWRMN3NoYTRMYVpZdkF6azBkdkY4TnRMZWpFRDFi?=
 =?utf-8?B?WTZJdVFYOHpyR1dNQ0hXMk1xUlRVSzgvWHVqU2FROGpVNFIra2ExcSt5QWo4?=
 =?utf-8?B?NmlBaE5oaUltbEtaZGhZcUp3STVjbHpneDlsdExZeHhvMVdaVTF5Y3pjMGh3?=
 =?utf-8?B?S3VWUmcvYUdFVjNmalovbEs4SDFlTHBPVHV2ZnpwdEhhNnRCV3pCL0JyZ091?=
 =?utf-8?B?THEyUmEyY1Q4TWx5T1ArS0RnOVpzdkRRQW05TUlyNDByMnZYWDBDSjZaTHpD?=
 =?utf-8?B?cEpmSnRzS083dGQySVQvVyszY2xTWlJBWlNDTm5IQTAyd0x0T3BlZHNHb0Ny?=
 =?utf-8?B?a0hzeStQVUJlZlRTNlJxSXVkVlkxZW95dU1ReUZvQkFWeEdzZFByNHdNczZG?=
 =?utf-8?B?bkZIZk9icVk1OEhvSFVuNStYZTNvMzUzZElqbm5sOGlyQURSak5zNU80dWpV?=
 =?utf-8?Q?ObZiBzEWyC139sWcmzrA+VDnW?=
Content-ID: <DF76C43EFF959243A6B1DD298F76531A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592aba0d-c707-4484-628a-08dd20bce56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 06:09:43.1126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5AD6f+6J8bkvPA99R68027zAORSf7mPe9UH4VEHzsabRPBQ73eDZ8/DTpQcP6L+2kwH7O+4pHOPGEZX0AFdHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8223
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_710132996.1430922533"
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

--__=_Part_Boundary_001_710132996.1430922533
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBNb3ZlIHRoZSB2ZW5kb3Ig
YW5kIHByb2R1Y3Qgc3RyaW5ncyB0byB0aGUgYXBwcm9wcmlhdGUgZW50cmllcw0KPiBvZiBzdHJ1
Y3QgZHJtX2JyaWRnZSBhbmQgdXNlIHRoYXQgaW4gbXRrX2hkbWlfc2V0dXBfc3BkX2luZm9mcmFt
ZQ0KPiBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgc2FtZSBhcyBmdW5jdGlvbiBwYXJhbWV0ZXJzLg0K
PiANCj4gV2hpbGUgYXQgaXQsIGFsc28gYmVhdXRpZnkgdGhlIHN0cmluZ3MsIHNldHRpbmcgdGhl
bSB0byByZWFkDQo+ICJNZWRpYVRlayBPbi1DaGlwIEhETUkiLg0KDQpSZXZpZXdlZC1ieTogQ0sg
SHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDExICsr
KysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggZWY4ZGZj
Yjc3MzE4Li5lYjM4ZjRiNzY3NGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jDQo+IEBAIC05NTIsMTUgKzk1MiwxNCBAQCBzdGF0aWMgaW50IG10a19oZG1pX3NldHVwX2F2
aV9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLA0KPiAgICAgICAgIHJldHVybiAwOw0K
PiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgbXRrX2hkbWlfc2V0dXBfc3BkX2luZm9mcmFtZShzdHJ1
Y3QgbXRrX2hkbWkgKmhkbWksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICp2ZW5kb3IsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICpwcm9kdWN0KQ0KPiArc3RhdGljIGludCBtdGtfaGRtaV9z
ZXR1cF9zcGRfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gIHsNCj4gKyAgICAg
ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlID0gJmhkbWktPmJyaWRnZTsNCj4gICAgICAgICBz
dHJ1Y3QgaGRtaV9zcGRfaW5mb2ZyYW1lIGZyYW1lOw0KPiAgICAgICAgIHU4IGJ1ZmZlcltIRE1J
X0lORk9GUkFNRV9IRUFERVJfU0laRSArIEhETUlfU1BEX0lORk9GUkFNRV9TSVpFXTsNCj4gICAg
ICAgICBzc2l6ZV90IGVycjsNCj4gDQo+IC0gICAgICAgZXJyID0gaGRtaV9zcGRfaW5mb2ZyYW1l
X2luaXQoJmZyYW1lLCB2ZW5kb3IsIHByb2R1Y3QpOw0KPiArICAgICAgIGVyciA9IGhkbWlfc3Bk
X2luZm9mcmFtZV9pbml0KCZmcmFtZSwgYnJpZGdlLT52ZW5kb3IsIGJyaWRnZS0+cHJvZHVjdCk7
DQo+ICAgICAgICAgaWYgKGVyciA8IDApIHsNCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoaGRt
aS0+ZGV2LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgU1BEIGluZm9mcmFtZTogJXpkXG4iLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBlcnIpOw0KPiBAQCAtMTMyOCw3ICsxMzI3LDcgQEAgc3Rh
dGljIHZvaWQgbXRrX2hkbWlfc2VuZF9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLA0K
PiAgew0KPiAgICAgICAgIG10a19oZG1pX3NldHVwX2F1ZGlvX2luZm9mcmFtZShoZG1pKTsNCj4g
ICAgICAgICBtdGtfaGRtaV9zZXR1cF9hdmlfaW5mb2ZyYW1lKGhkbWksIG1vZGUpOw0KPiAtICAg
ICAgIG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoaGRtaSwgIm1lZGlhdGVrIiwgIk9uLWNo
aXAgSERNSSIpOw0KPiArICAgICAgIG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoaGRtaSk7
DQo+ICAgICAgICAgaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR18zRF9NQVNLKQ0KPiAg
ICAgICAgICAgICAgICAgbXRrX2hkbWlfc2V0dXBfdmVuZG9yX3NwZWNpZmljX2luZm9mcmFtZSho
ZG1pLCBtb2RlKTsNCj4gIH0NCj4gQEAgLTE3MDksNiArMTcwOCw4IEBAIHN0YXRpYyBpbnQgbXRr
X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICBoZG1p
LT5icmlkZ2Uub3BzID0gRFJNX0JSSURHRV9PUF9ERVRFQ1QgfCBEUk1fQlJJREdFX09QX0VESUQN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHwgRFJNX0JSSURHRV9PUF9IUEQ7DQo+ICAgICAg
ICAgaGRtaS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUE7DQo+ICsgICAg
ICAgaGRtaS0+YnJpZGdlLnZlbmRvciA9ICJNZWRpYVRlayI7DQo+ICsgICAgICAgaGRtaS0+YnJp
ZGdlLnByb2R1Y3QgPSAiT24tQ2hpcCBIRE1JIjsNCj4gICAgICAgICBkcm1fYnJpZGdlX2FkZCgm
aGRtaS0+YnJpZGdlKTsNCj4gDQo+ICAgICAgICAgcmV0ID0gbXRrX2hkbWlfY2xrX2VuYWJsZV9h
dWRpbyhoZG1pKTsNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=

--__=_Part_Boundary_001_710132996.1430922533
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTEyLTE3JiMzMjthdCYjMzI7MTY6NDMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtNb3ZlJiMzMjt0aGUmIzMyO3Zl
bmRvciYjMzI7YW5kJiMzMjtwcm9kdWN0JiMzMjtzdHJpbmdzJiMzMjt0byYjMzI7dGhlJiMzMjth
cHByb3ByaWF0ZSYjMzI7ZW50cmllcw0KJmd0OyYjMzI7b2YmIzMyO3N0cnVjdCYjMzI7ZHJtX2Jy
aWRnZSYjMzI7YW5kJiMzMjt1c2UmIzMyO3RoYXQmIzMyO2luJiMzMjttdGtfaGRtaV9zZXR1cF9z
cGRfaW5mb2ZyYW1lDQomZ3Q7JiMzMjtpbnN0ZWFkJiMzMjtvZiYjMzI7aGF2aW5nJiMzMjt0aGUm
IzMyO3NhbWUmIzMyO2FzJiMzMjtmdW5jdGlvbiYjMzI7cGFyYW1ldGVycy4NCiZndDsmIzMyOw0K
Jmd0OyYjMzI7V2hpbGUmIzMyO2F0JiMzMjtpdCwmIzMyO2Fsc28mIzMyO2JlYXV0aWZ5JiMzMjt0
aGUmIzMyO3N0cmluZ3MsJiMzMjtzZXR0aW5nJiMzMjt0aGVtJiMzMjt0byYjMzI7cmVhZA0KJmd0
OyYjMzI7JnF1b3Q7TWVkaWFUZWsmIzMyO09uLUNoaXAmIzMyO0hETUkmcXVvdDsuDQoNClJldmll
d2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMz
MjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMzMjsxMSYjMzI7KysrKysrLS0tLS0NCiZndDsmIzMy
OyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzYmIzMyO2luc2VydGlvbnMoKyksJiMz
Mjs1JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQm
IzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMmIzMyO2IvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMyO2luZGV4JiMzMjtlZjhkZmNiNzcz
MTguLmViMzhmNGI3Njc0ZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7QEAmIzMyOy05NTIsMTUmIzMyOys5
NTIsMTQmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2hkbWlfc2V0dXBfYXZpX2lu
Zm9mcmFtZShzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSwNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsm
IzMyO30NCiZndDsmIzMyOw0KJmd0OyYjMzI7LXN0YXRpYyYjMzI7aW50JiMzMjttdGtfaGRtaV9z
ZXR1cF9zcGRfaW5mb2ZyYW1lKHN0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1pLA0KJmd0OyYj
MzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbnN0JiMzMjtjaGFyJiMzMjsqdmVuZG9yLA0K
Jmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbnN0JiMzMjtjaGFyJiMzMjsqcHJv
ZHVjdCkNCiZndDsmIzMyOytzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2hkbWlfc2V0dXBfc3BkX2lu
Zm9mcmFtZShzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSkNCiZndDsmIzMyOyYjMzI7ew0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtk
cm1fYnJpZGdlJiMzMjsqYnJpZGdlJiMzMjs9JiMzMjsmYW1wO2hkbWktJmd0O2JyaWRnZTsNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMy
O2hkbWlfc3BkX2luZm9mcmFtZSYjMzI7ZnJhbWU7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dTgmIzMyO2J1ZmZlcltIRE1JX0lORk9GUkFNRV9IRUFE
RVJfU0laRSYjMzI7KyYjMzI7SERNSV9TUERfSU5GT0ZSQU1FX1NJWkVdOw0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3NzaXplX3QmIzMyO2VycjsNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZXJy
JiMzMjs9JiMzMjtoZG1pX3NwZF9pbmZvZnJhbWVfaW5pdCgmYW1wO2ZyYW1lLCYjMzI7dmVuZG9y
LCYjMzI7cHJvZHVjdCk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtlcnImIzMyOz0mIzMyO2hkbWlfc3BkX2luZm9mcmFtZV9pbml0KCZhbXA7ZnJhbWUsJiMz
MjticmlkZ2UtJmd0O3ZlbmRvciwmIzMyO2JyaWRnZS0mZ3Q7cHJvZHVjdCk7DQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhlcnImIzMyOyZs
dDsmIzMyOzApJiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Rldl9lcnIo
aGRtaS0mZ3Q7ZGV2LCYjMzI7JnF1b3Q7RmFpbGVkJiMzMjt0byYjMzI7aW5pdGlhbGl6ZSYjMzI7
U1BEJiMzMjtpbmZvZnJhbWU6JiMzMjslemQmIzkyO24mcXVvdDssDQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtl
cnIpOw0KJmd0OyYjMzI7QEAmIzMyOy0xMzI4LDcmIzMyOysxMzI3LDcmIzMyO0BAJiMzMjtzdGF0
aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX3NlbmRfaW5mb2ZyYW1lKHN0cnVjdCYjMzI7bXRrX2hk
bWkmIzMyOypoZG1pLA0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2hkbWlfc2V0dXBfYXVkaW9faW5mb2ZyYW1lKGhk
bWkpOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210
a19oZG1pX3NldHVwX2F2aV9pbmZvZnJhbWUoaGRtaSwmIzMyO21vZGUpOw0KJmd0OyYjMzI7LSYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2hkbWlfc2V0dXBfc3BkX2luZm9m
cmFtZShoZG1pLCYjMzI7JnF1b3Q7bWVkaWF0ZWsmcXVvdDssJiMzMjsmcXVvdDtPbi1jaGlwJiMz
MjtIRE1JJnF1b3Q7KTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO210a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoaGRtaSk7DQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhtb2RlLSZndDtmbGFncyYj
MzI7JmFtcDsmIzMyO0RSTV9NT0RFX0ZMQUdfM0RfTUFTSykNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7bXRrX2hkbWlfc2V0dXBfdmVuZG9yX3NwZWNpZmljX2luZm9mcmFtZShoZG1p
LCYjMzI7bW9kZSk7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyO0BAJiMzMjstMTcwOSw2JiMz
MjsrMTcwOCw4JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19oZG1pX3Byb2JlKHN0
cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2Uub3BzJiMzMjs9JiMz
MjtEUk1fQlJJREdFX09QX0RFVEVDVCYjMzI7fCYjMzI7RFJNX0JSSURHRV9PUF9FRElEDQomZ3Q7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO3wmIzMyO0RSTV9CUklER0VfT1BfSFBEOw0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRnZS50eXBlJiMz
Mjs9JiMzMjtEUk1fTU9ERV9DT05ORUNUT1JfSERNSUE7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2UudmVuZG9yJiMzMjs9JiMzMjsm
cXVvdDtNZWRpYVRlayZxdW90OzsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRnZS5wcm9kdWN0JiMzMjs9JiMzMjsmcXVvdDtPbi1DaGlw
JiMzMjtIRE1JJnF1b3Q7Ow0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO2RybV9icmlkZ2VfYWRkKCZhbXA7aGRtaS0mZ3Q7YnJpZGdlKTsNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldCYj
MzI7PSYjMzI7bXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsNCiZndDsmIzMyOy0tDQom
Z3Q7JiMzMjsyLjQ3LjANCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+
PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZp
ZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBj
b250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1l
bnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3Ro
ZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQg
aXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lw
aWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5n
LCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0
dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVj
aXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRp
YXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNv
cGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlv
dXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFp
bCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_710132996.1430922533--

