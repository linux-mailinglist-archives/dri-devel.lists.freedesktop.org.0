Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E78E9D1D86
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 02:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B1510E1A6;
	Tue, 19 Nov 2024 01:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mhQxE33a";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GTTGsRi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14610E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 01:46:13 +0000 (UTC)
X-UUID: 0b053f06a61811efbd192953cf12861f-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=KiRWCGAsLcVxILZqrkb+3VJUWS1wPcgbnvMuZAqS0PY=; 
 b=mhQxE33aY/oVSDzzbYZYtwoChdfZCJiDrFFjrf0P2807ylLQJzqbYvih5hj4v/lOde3Gwk8BFi0to+NdG66gpAv1dtMFopjxUWCys+q/d8+yiTV8pFJOVDHvD3rjAa2F+0mDRdxvEIIvt84ujl0PWTHKGn0wWGbhWoX/Zqp8vHk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:a2befd51-2ef5-437e-9045-14b37d493693, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:b4ad4a07-6ce0-4172-9755-bd2287e50583,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b053f06a61811efbd192953cf12861f-20241119
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1709884224; Tue, 19 Nov 2024 09:46:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 09:46:04 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 09:46:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hdg0+ytUpJvWAXS1PUGB9Ct3QZOuU566Oxfd+WL6WeCW15fIT1/L0G6Qc/a5tc0dQ34VeMW9XGhYdvpjYdeKsbKkywg9xRrwa5WCKN+lHo0dMd4Ey4f1SCz/E07qFJQzLHjvwyvq9f4nXdmqzqH87TwM0OUYJLBf4LAcHXwk5nRSpwVZU+o9N32U/11axVSaPjwwdNoslKmBJ/0FwG5lB9vnTNOfJdEVtd+X758UJ2BUcbU3XXuXukrpyrZdyyMbjLnQrEERBJnOqJLrmQ2WJe1R8nLYWVXKMShbqBhdJhU8qmkv/tkuSjiuVoTjpf5wKKSjwfTArJy7Bc6y/Wl5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEOEwXh/Ibl4c2bmJ9WFU4+SCP2464aJPd5l0+qJtI4=;
 b=kPL616twBW8tbZaoq3DpemEOQbjn7dhy0z+Inv0tLKci4+PMZShRDmo+oSGErRYhdDmuzrNjXS8yhCKH4KalXOK+MsMPWvrpdSmk1xbOulXL2ZDwAGAtLMrislKxrsy+ztHsoYQTK7ooAOcubjvfuIldgiD+O6qa+UzikT4WaAfA+ZFXlvfk0RWtKHC/Er2ye3p1u8l+quQQRXi2o0aDhTtbjUN4cabRLEDlJgpWKyMbgGKIbLdy6QF98vehvCeN56d5zRpfsNjAuc0VT3hS9D4bJI3lIn3uVHPMoWRdLJ3Lc8TBKX7t2H8MA1/4E4JL+eMyImUkWfp5ub0HXkOvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEOEwXh/Ibl4c2bmJ9WFU4+SCP2464aJPd5l0+qJtI4=;
 b=GTTGsRi+kQpUJ1cO3Rdjx/tCPAfZfQtVEuHMPYOQC8qh9rl9QoHDGz168AOZGkjVsioW4u+zmS4J/tIs4hx9hAdZwUSbjsPjGzkXy9O+ncwWMJ/5/1BPcv4HQRjRBCnqtu+rQgPB7mTjlv0iT/4956lffFRhJqWHvSATJ8nNQjI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8121.apcprd03.prod.outlook.com (2603:1096:101:188::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 01:46:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 01:46:00 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf unit
Thread-Topic: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLK+FRcA
Date: Tue, 19 Nov 2024 01:46:00 +0000
Message-ID: <41531353b8ae6e09ac9976fb06a5dfc700d17f5a.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8121:EE_
x-ms-office365-filtering-correlation-id: 23b36705-c981-45cc-d168-08dd083bebd3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R1FCWVU0UHpCK2lKUDBLS0dPUTRoTkd0MmhPcmU3QXltNXpCTmF0ZSs3Rllz?=
 =?utf-8?B?SkhOV3BVS2h2Sm9oemRNcW92RlE2L1BoZ2FieXQxZzMwVjBmbTIvN0M4d0dj?=
 =?utf-8?B?YzVJSk0xMWdCSVZUWlRhTmRXclBkVlNScEJQd1hQYk44VmpRbDMyZ21iZDE5?=
 =?utf-8?B?N3FES295UlRmanBjSjlXSWJ0S0lNZUtObitQSk1TaGM1emN0TjlHVGMweHFS?=
 =?utf-8?B?VG96eHhHNGNmNEozUzl2ZjlOd0F3RVFzODZDZ1dLUU85TE81WEV3UVd2OHEz?=
 =?utf-8?B?WGI1WGs0N1g1S2NUeEY3U2ZQSmh0YlMvVDhrMmh3VzRHU2ordFEyYW9ycktT?=
 =?utf-8?B?VkVlYU1CaXNFQVZMS3VkK0k3M093WjNTeXgwTDUvbXdzQjFxSXRITmYya3ls?=
 =?utf-8?B?TWJEeThyNktMZlRlbDJGaXIzTDgyL1VvNlRpdEVhdWJveVRCOU1KejZ1d1lq?=
 =?utf-8?B?Y04wc2dPUHhZeEQ1cmxuVUIwQVF6NlpVMlpXa2xkQzM2TEh2U2g0MlJSdlJB?=
 =?utf-8?B?TkxiT25qcDM1VFJlcERvV3Z3Q05velNBY2kydHhCUlJFTjRLaUJRTUZ1cVVU?=
 =?utf-8?B?Z2R0LzI5VjNSUllhRkp6ZDBSSUhYdmRoSjY4K2IreC96Mlc2U1NtSWZsY0lE?=
 =?utf-8?B?Q2FsOTNkdFR0cWRXN3dVZkw2V3o2ZlRyZmovdUxBekNwK29BTUFWclZVaHhr?=
 =?utf-8?B?WG8wMWxmZmN2aXY2aFcybmFSNXhaN2ZiLzBpWk02QmFVdW1TTnE5aUl4NXg2?=
 =?utf-8?B?Vkt1ZXJDZmRzNktOQmN6YXRiZlJNL0FYRGtIMjRTb1J5NlI1emxjc3UwRjkr?=
 =?utf-8?B?OHArSEtuMGorK1pBdEtybmN5NXNHbkI2MmRLcVNsUlNocTRTckZvdHV2azBJ?=
 =?utf-8?B?ZjNMbHhoYlZMckIzL2xsRGJEVmtya1U4T3dCcTdyNDFFTWdNOUJRL3pYbWdQ?=
 =?utf-8?B?RHVVOVVmY1YxQ2JtTmxqUTJwMXd0cXBaZ1RoVnVlNnAvSmRVOTR3amlWc29K?=
 =?utf-8?B?WklGYWVWUkZPNkVoQ2hBem5PWGRKSFhmWWhwVk1iT2I0UUhRMWJXT3ppeTZL?=
 =?utf-8?B?dFB6eFEzN2kvaWN4K01OREZpalpldzB6aUhGN0pqUktBbXBYekJmVzJtZGU2?=
 =?utf-8?B?N0xQbVZEcFJhZ0tqSWczYzE4Tk1HRFpXK1RLZmkyS1piL1Nzd2xBVVNKRXJJ?=
 =?utf-8?B?c0EzZnY1bVp5OERqZW5XQnMxQ2dLZFVJUi9KRTh1bFFtQ2p5ZXpyNE56ZG1F?=
 =?utf-8?B?MXJpWngwQjh3TG52V2lZSTc0bk00N2hiNUZRLzhyditZc1UxMEZWNWpBc2t4?=
 =?utf-8?B?SVZxbDYyMnY5ZzAxdG95WWk4ZC9TdE9CeTJmYytHUUlLR3BsQmp2RWlsUUpn?=
 =?utf-8?B?dHl3cUxtVGw1dXJVSmdIeU9kdTF1eXN4bzZjYi9Mb0dSQ2hycmxjTG1tNWZj?=
 =?utf-8?B?YURLRFVvZlBzUzRLT1k5NVZyQ09iNmlGdy9ndFpjQ01kcmFRd1NSWFJmN3V4?=
 =?utf-8?B?dnZZZnYyRW5BZVMwSDlJZ1JtNm1Lc1ZiL2ZpSFVzMVYxVVZJMXV6SFpseDBG?=
 =?utf-8?B?TUFsZ1RJUXAyNGwva2s5OWZsMnZ3SDlKVEpyaGg0N1hxcloxanZZWGs5bGY5?=
 =?utf-8?B?MGtqMUpxYlFFOTZOWENGMUQzaEI0ZW1odnhTeHp2NnpRdmNKRzFMd21ic0ps?=
 =?utf-8?B?cTdXdHB4Wnd3NGF6WDRpUEhxVGgrNTIyWVN3K3hMRDd0Tm1EeU80anRnNFo3?=
 =?utf-8?B?VWY4NVNpdWpvekY3dVFkaXpzVnR2YW5hZEI1NGFUdFVBZGZjV2grVjAyQjBF?=
 =?utf-8?Q?H+1fndbaDC2sWsDE33/UfY+7bzU7/pOKshZfw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkNjZGZVVi92SnZNbVJlTmdreklnMmd0ZVNRTisxaG9KTk9OWmhuUE9WMTdv?=
 =?utf-8?B?RklUcEYyNncvR0NFY0JIS3BPWGFHeHdQRzV0QWpBMUtpdmdhTXVZNVpheVZW?=
 =?utf-8?B?a1RQQ0oyN2VkY3lJTTIxZlA4c3JnODF0bGRmNmRPVmEvR3VTMDVXU0I2c1Yr?=
 =?utf-8?B?anE2dVVzTnBNY2dKd1J0NE1jZzdjREhCeEhsbW14a05KckdQZHA4dHg1Nnla?=
 =?utf-8?B?TFFNSFkxUTFNTUFXazd1cHh1QzhtWHY5bHlTeDJNVDF4elAzU3h2d3I4NWIv?=
 =?utf-8?B?WDF2dk5FVHh4Z0tFZ20wcnE3MUR1bThwOXVpc2hvQ09BcmZUV1dIV08raU1B?=
 =?utf-8?B?dHpOb1pEOURaTHo5bzY1ME5zSTFidUdRdi8zNzBGT1pVekxsVXZLYlFZZUVF?=
 =?utf-8?B?UTFlRnd2RXVxbTB4SHhlTnJBd25ZNzdsdjMwYnhCbUt0a0twUVM2dkRTcDJP?=
 =?utf-8?B?Mi8yTE9wWHRCemR0M1JvZVREb2NCRXFsMytINEorTnlyS3Q1Y2ZQUXNtd3lJ?=
 =?utf-8?B?UUwrSXE4ZUhSdDVpYktOVjMxVG81czllaHFFWlpBU0Q1cDZCdXFHcW5tNFZZ?=
 =?utf-8?B?aHh6R0VKK0pEUStJRXpFU0c1TUM5OFZBTGhmbnY2SHhCdzJQcTNlV3IvWmg3?=
 =?utf-8?B?OU1PdjJ2WXlEREprTVNGODNqTWV0TFdFZXpmRDFaVk5VR01nV2FVWlRuSGc5?=
 =?utf-8?B?bXY5b2VDaXVyNjlKQmNDTVY2VzBOVURjOUxkeTBrRG1oTXh3MFpBZnR6ZnhI?=
 =?utf-8?B?bmlmR2dYSGFFWGVSVjcwUEE1cE5sVWZ4UzEwV0pUWkZ0T2E0UkF1RXV4Y3Zj?=
 =?utf-8?B?MElTa0p3VUplM2JxWHdNQkNJSHJ0TzZMRmRwZVZpN1BiM1o1ZksweFk3bkF1?=
 =?utf-8?B?TXpvVXg3VmFGYUhwbUkyWkozeXNsT3J1bjdWOCt2RWQzRXJ0UEtsS1hrMGVv?=
 =?utf-8?B?Q1N6dStqcFVJZkZLQlBzSStMa0xOTVZlUGxWTnkvdVFCd0U0a3RGZmxDcnhV?=
 =?utf-8?B?ZjJIU2xWNEE2TXhCNmZ3OElqRHZhVlEzelQyTDVabXR4WU9BaUVPSUhkeVdR?=
 =?utf-8?B?NTF3dXozeDUwc09OVitFajFWWStVdjk1cTc3WXlialUvclFJV2pDQ0ZhZUlS?=
 =?utf-8?B?R1dlUk5OK1dUYjRHbTRScFUvZlN4UWpMbHRybVFSY2hHMU1MdUZBZjhaVVF1?=
 =?utf-8?B?NXpQaDhneXZMTW5zVDI5RFZ6c1B2NXhJWEZNUDEvUTN0YzBuOVU1Rmd3OEhG?=
 =?utf-8?B?SE4yM3JrcHlwaDdFMmtMSGR6WHBrbUc2Qi93MDNtTkpiM3g2LzFpUnJwTU5K?=
 =?utf-8?B?TGl4OTRXRndvemZ4RVVxSVBxWVNMUGhPcno4NnErUEdER01mR2JHMVlMTWsx?=
 =?utf-8?B?RzVkeTA1MklLUHYxNDZpNTFlcjFwV0s3YjU5Ly9sd09iaHVmNTBtRlhVTFJh?=
 =?utf-8?B?Z0FCQTRxN1RJVmdRN2d6czhaNWQzMEhFOHUvRXZRMWoxTG1qcGx3TGZyOU5j?=
 =?utf-8?B?SFBXaVNGdk02WHNUcHZzWFE1WHYzRFhvRUIzamdDMFBqR2dnM3BuRzNUS1RI?=
 =?utf-8?B?RmRnWmxkUHZ1MkJURHg3WHRMeENGZXk5VUlud2h5dWNRRGFsWmpTejdvRGhJ?=
 =?utf-8?B?L0dzNHk5aWFkUlhzc0RTOTIwV0hhT0ZEMXBBR1Zaajd6bC9ScVIybFE2NmlL?=
 =?utf-8?B?aUhISXc2SmZ1bUVHai9UV0NQcG5pTU1CbnVoZ3pEcU9ydDRZRmxBUWtTOCti?=
 =?utf-8?B?dVdqeFRCSG5oYWNjUy9QcURCaS8yeWxZdU8xRjlCNjBmMW1UYTVaOXNlbFBI?=
 =?utf-8?B?QWcrS3VDdFVzT1hDcEw5ZTdMekFvTjMxc2F3SHFOV0tCK0xWdTAvQnZHWUEz?=
 =?utf-8?B?aGphZFZ2Z2Yrek5Xd0c0OXlZMEl5ZTkrNkNBQWdpQk9KekliTzBMUmhLUzVI?=
 =?utf-8?B?bHhJYi83bkxVZjVXLzVpalhjWVR0cXdyY3dTVnp0VlQycS8wVHZoWFhMSmg2?=
 =?utf-8?B?Y0xTdnlvYklZNUR1YVlBb0JUdGh1T1g4a3F5SDBtalhTYjJsT0d6c1lhMEpE?=
 =?utf-8?B?ZDJaY0IvUVJ6eHRJelVYMkhLRFdwZnRTSmNDRFJTUis5L2lJSWdQQ3RyUS94?=
 =?utf-8?Q?JJsIebbekK/k/Clm+Lu8+2fCf?=
Content-ID: <A2056B9F3AF9214D9BFFB4A4D71F136B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b36705-c981-45cc-d168-08dd083bebd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 01:46:00.8986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7CcZxvNOYvp1rH3cIWVsX/nzkFyuQzsCEPetn3uXvHBXqxE/g58hS3j39EehG9TZWxxmOPdTmiEnNVndri14A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8121
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.820900-8.000000
X-TMASE-MatchedRID: 9zTThWtzImtm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYPuA
 5hg2vazcZc34la8q513oOFZKBrFWj0ILcl5xUj1W+Fq9Vk/m1NrXAvRa0tfJGm7gWSfKrKyENzD
 QBKb2yJ2c+vypK/WgT8J8156QdbToo27xiIuUglCMVQb49Y23I30tCKdnhB58pTwPRvSoXL0ir3
 kOMJmHTBOYqJip7cUI0C1sQRfQzEHEQdG7H66TyH4gKq42LRYk8ig3YgCPnA5QfXx52ePoqswtq
 hBuweiGqzyro0LuUu1+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.820900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C04EAC698734FA53CEE3A2B6751FB1D2C69C185EB9A7400B00E922146C4C63F32000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_2016793029.1485541906"
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

--__=_Part_Boundary_001_2016793029.1485541906
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0cnVjdCBzZW5pbmZfdmMgew0KPiArCXU4IHZjOw0KPiArCXU4
IGR0Ow0KPiArCXU4IGZlYXR1cmU7DQo+ICsJdTggb3V0X3BhZDsNCj4gKwl1OCBwaXhlbF9tb2Rl
Ow0KPiArCXU4IGdyb3VwOw0KPiArCXU4IG11eDsgLyogYWxsb2NhdGVkIHBlciBncm91cCAqLw0K
PiArCXU4IGNhbTsgLyogYXNzaWduZWQgYnkgY2FtIGRyaXZlciAqLw0KPiArCXU4IGVuYWJsZTsN
Cj4gKwl1MTYgZXhwX2hzaXplOw0KDQpleHBfaHNpemUgaXMgYWx3YXlzIHplcm8sIHNvIGRyb3Ag
aXQuDQoNCj4gKwl1MTYgZXhwX3ZzaXplOw0KDQpEaXR0by4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
K307DQo+ICsNCg0K

--__=_Part_Boundary_001_2016793029.1485541906
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjtk
cml2ZXImIzMyO29mJiMzMjt0aGUmIzMyO01lZGlhVGVrJiMzMjtTZW5zb3ImIzMyO0ludGVyZmFj
ZSwNCiZndDsmIzMyO2ZvY3VzaW5nJiMzMjtvbiYjMzI7aW50ZWdyYXRpb24mIzMyO3dpdGgmIzMy
O3RoZSYjMzI7TWVkaWFUZWsmIzMyO0lTUCYjMzI7Q0FNU1lTLiYjMzI7VGhlDQomZ3Q7JiMzMjtz
ZW5pbmYmIzMyO2RldmljZSYjMzI7YnJpZGdlcyYjMzI7Y2FtZXJhJiMzMjtzZW5zb3JzJiMzMjth
bmQmIzMyO3RoZSYjMzI7SVNQJiMzMjtzeXN0ZW0sDQomZ3Q7JiMzMjtwcm92aWRpbmcmIzMyO21h
bmFnZW1lbnQmIzMyO2ZvciYjMzI7c2Vuc29yJiMzMjtkYXRhJiMzMjtyb3V0aW5nJiMzMjthbmQm
IzMyO3Byb2Nlc3NpbmcuDQomZ3Q7JiMzMjtLZXkmIzMyO2ZlYXR1cmVzJiMzMjtpbmNsdWRlJiMz
MjtWNEwyJiMzMjtmcmFtZXdvcmsmIzMyO2NvbnRyb2wsJiMzMjthbmQmIzMyO2R5bmFtaWMNCiZn
dDsmIzMyO2hhbmRsaW5nJiMzMjtvZiYjMzI7c3RyZWFtJiMzMjtjb25maWd1cmF0aW9ucyYjMzI7
YW5kJiMzMjt2aXJ0dWFsJiMzMjtjaGFubmVscy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO1NodS1oc2lhbmcmIzMyO1lhbmcmIzMyOyZsdDtTaHUtaHNpYW5nLllhbmdA
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3Ry
dWN0JiMzMjtzZW5pbmZfdmMmIzMyO3sNCiZndDsmIzMyOyt1OCYjMzI7dmM7DQomZ3Q7JiMzMjsr
dTgmIzMyO2R0Ow0KJmd0OyYjMzI7K3U4JiMzMjtmZWF0dXJlOw0KJmd0OyYjMzI7K3U4JiMzMjtv
dXRfcGFkOw0KJmd0OyYjMzI7K3U4JiMzMjtwaXhlbF9tb2RlOw0KJmd0OyYjMzI7K3U4JiMzMjtn
cm91cDsNCiZndDsmIzMyOyt1OCYjMzI7bXV4OyYjMzI7LyomIzMyO2FsbG9jYXRlZCYjMzI7cGVy
JiMzMjtncm91cCYjMzI7Ki8NCiZndDsmIzMyOyt1OCYjMzI7Y2FtOyYjMzI7LyomIzMyO2Fzc2ln
bmVkJiMzMjtieSYjMzI7Y2FtJiMzMjtkcml2ZXImIzMyOyovDQomZ3Q7JiMzMjsrdTgmIzMyO2Vu
YWJsZTsNCiZndDsmIzMyOyt1MTYmIzMyO2V4cF9oc2l6ZTsNCg0KZXhwX2hzaXplJiMzMjtpcyYj
MzI7YWx3YXlzJiMzMjt6ZXJvLCYjMzI7c28mIzMyO2Ryb3AmIzMyO2l0Lg0KDQomZ3Q7JiMzMjsr
dTE2JiMzMjtleHBfdnNpemU7DQoNCkRpdHRvLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7
K307DQomZ3Q7JiMzMjsrDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_2016793029.1485541906--

