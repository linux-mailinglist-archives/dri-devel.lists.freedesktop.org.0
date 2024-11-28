Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CFE9DB298
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 06:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADED10E009;
	Thu, 28 Nov 2024 05:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gWs8x01S";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="sM/+O3Km";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C18B10E009
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 05:45:22 +0000 (UTC)
X-UUID: f1ab6be4ad4b11efbd192953cf12861f-20241128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=vBPefHvfcCD1u6hH+6zruqjLnRETwfQtxw7bldANQD4=; 
 b=gWs8x01Sv91H4QrE0ar5sG0CjnGg2o4KOfjgUdM5LT68lSejSq+5Kjevpky2ycq6myeD0XPE6dUZJVJY+pkj1aF+VxVjY+nbzJQ8etdo9Sa3fPTvOjb2c8j1Qip2YN7i3qtqcsdfCVsaPR5rASPcraddewJMocC07qo8wCO3Xxk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:0413f3ce-503a-4b81-b921-32b68871882b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:236485b9-596a-4e31-81f2-cae532fa1b81,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f1ab6be4ad4b11efbd192953cf12861f-20241128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 750376599; Thu, 28 Nov 2024 13:45:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Nov 2024 13:45:14 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Nov 2024 13:45:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqAiKNuOe0pnSXJ/DHObjCOpjKk1HoXkO6aruyCRUHnHHsGSLGx+Q09+Vxlwnfy9QqsGEKKH07EPGlkHKCIIrRAld7FsOLoN0IZ8vgPnsq26WfvIGg4UB+fTMm4rmlZkYg54dPylhsbUrHeHxYUmSBNCOnqBVuU7cC5QVVOAAzl0qWsdZ7UJK5+Sb0K+o+tbnDV6U553ky6pYNyKQyJlwqDrGWhJ7MDQOX+QXIxjTZKrPDSLgtZ/svgtBMW5U6vWxLXV7exLfxsrJYEPAatRfyPUxVwgPkiPATLU/+dCU6T96/9mLcAktyUNNP06nSvUjKLvTARVPqToZJTPcYP0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdhExuZIEB8ulsJ033xFYqR0JvCeBeg6cBQXpnonmpE=;
 b=ejDS3OAc8tgEa3DSO63nKURcxOxY6ZTy3TWHnLdiAcxzadSCaPatxtOJDzYrAct9uNF1SWvzV7BorFetuyLDyjLgHk/ArfBzgltDeXa/4ACAkh9WyHpO5u1ESuQRXwvX4Qrsb759/T6UwOgGuBOH0kWOWadd6+8GxHn0Q/AXEdS3qCKp66r0YQX/UwRWhIKiLwfB4JB+Q+DmPEPsZTZVdETzrwbwTHLnbEvm+0fkYj/IfvhgxTBITMEAWMgJGW8fcO95JA8aSiCg1o+fzTiu/LxfjQvCdOr/LHB/9GSHEEDqAvjET9hSldzGDJgtqEkTyUityoJAJylCwoHcfB9Xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdhExuZIEB8ulsJ033xFYqR0JvCeBeg6cBQXpnonmpE=;
 b=sM/+O3Kmaan45Dl1b+af3Z1t1SphiKIknkCF2ljEpdffK3qEh7LYwhCLq16JM8gR/NMhDuabiVNE0G+x25cttd9/lX4etUkzg2QleNrozZbXMvo7J2FtR571IIqyNtErXoBX2dZvJ2WUkkWWxM4BdAo04DnLLTfapR4tQGQLDLY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7475.apcprd03.prod.outlook.com (2603:1096:400:410::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 05:45:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Thu, 28 Nov 2024
 05:45:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "sui.jingfeng@linux.dev" <sui.jingfeng@linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "kernel@collabora.com"
 <kernel@collabora.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer in
 mtk_drm_of_ddp_path_build_one()
Thread-Topic: [PATCH] drm/mediatek: Initialize pointer in
 mtk_drm_of_ddp_path_build_one()
Thread-Index: AQHbNPDFU6e2ZmspN0eeFYb8eurZvLLMR3+A
Date: Thu, 28 Nov 2024 05:45:11 +0000
Message-ID: <3021edf83e5ad32c1ebe9ea711127956aedc211c.camel@mediatek.com>
References: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7475:EE_
x-ms-office365-filtering-correlation-id: b761be10-0779-49bc-528a-08dd0f6fd370
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cE4rUjVoajhxWDFwa3RhaU91RGVoLzFkYm1UN2FoU01oV2NIMHFoSVFkMVhM?=
 =?utf-8?B?a3dPa0JWTExta2ZUdE44bWZCY0k1SWUwS2R0Zm9SYUFVcG9SNjFsU1l5MVFp?=
 =?utf-8?B?SzNLK0ZZeEFMaGYyNXNsbGVLc29LUE80eVJSQjFWVkZmeFAvOFY2NzZiaTk2?=
 =?utf-8?B?WjdYWkpzdmFZUlhGb3dmR0N5OVE5MTR1N3k1UDRHNzFTNDVtakNLbVZmemIw?=
 =?utf-8?B?dkh4YkJ1QjVlTlNoZE5ndDB4QUk3SjhaRFJCbWthQUlaVXNPU1BGSzI5SHhx?=
 =?utf-8?B?ZW5ZVnBvZ1c4NTZPY0NjS3d0ZTNVbG5lTUhPcVhsNmNJN1RBNy9OSXF5K2NE?=
 =?utf-8?B?RHA4OEVWU3MyN0hsM2hWS1JQcDU0cXczU0FPNEloSldvRWZFNnczckszdS9X?=
 =?utf-8?B?d3M1dURRWklZaThJSEg5RGJaL2dwMUswR1ZRTUQ2eUFDNHpMUWlsKzBxdndM?=
 =?utf-8?B?TUZHWHE2cTZpREIxMDNvdXVGWi9pSHczc1h5ZTl6V2w0ZGI2cm44TzlnbW1P?=
 =?utf-8?B?d05nMmZoY3Nua1MzbzI4TThFbjFrS2hqNzRJbGsxd0RFWm85alVITFRTd0Fy?=
 =?utf-8?B?K09aZHlMNnFwWStjVW83SkNRTlQwRHV4WDhpL2xQeXhhb21yUjBObTNHaFQ4?=
 =?utf-8?B?R1hsSmNHOVV1OUM3Nnc4c0JUMDN0aHQxc0g5T1owOXNUMUFwRE9XN3RYUy9O?=
 =?utf-8?B?c3NsM0R4RmdoWkFKeERKVUlOd0FmcWxlMDJycmc5bm9NRnF5aEZIZElvT3FY?=
 =?utf-8?B?bDVNSHdyREdFUS9aZkZUdG8wN3BHNWlJY3N0MG9ia0dhMTBVR2FyWnJ3c2lB?=
 =?utf-8?B?dnpBZjhNYlRRMTNPWUFQUElZV05UeWQrTWxTSXozeFhXaUcvaWppMkJNVm1C?=
 =?utf-8?B?dVNLSm9aY01yQjIvc1psc2lwRDNCV3krZXN2SzdTQ2tGR1h6NGpTQ3RCUFJz?=
 =?utf-8?B?S3ptTEROSStwOGJoK0FoZWZrR2p1aCtQMUVWQXRlTE1hOVhIMHhQb0lic2cx?=
 =?utf-8?B?WStFVE05QVQvMDhYNWR6Y1YxY205Rm1ENG9abm5GOC9udGllSmtmRzR1bllx?=
 =?utf-8?B?UG1tZkUxVWFnRXZwQ3VwVzhDRGtUcXl5RmFKSkIvT04vTXpzakhoNU1ERHpG?=
 =?utf-8?B?MERMRUkzbThkRHFqZVVIR1hvTVVZRHRENDdBRlJ4QjBHbjVUTmtMWEszVG1n?=
 =?utf-8?B?T3lGdDZTK3owYzVMTkNyaVNCcHhSOFBHMm1BcitSTG1wWVY4aXZFK3N3dWZD?=
 =?utf-8?B?MFNXa0JDMVJQbjc5OWlHeFZXeEJ3RUozQktUaE1iSHFMd0M1c2w0eGIvaWFn?=
 =?utf-8?B?aUhuNEU0UUkzK284U09FZ1RVUEI0U3AzZGJOKzdlSTZMV3NjTk41ZmlFK2hy?=
 =?utf-8?B?bE9qT1FOU29LMDVNb1ZHZVIycTNYcUpCWFNKaEpidkVUd2hzR3FON1dLV0F0?=
 =?utf-8?B?SGxDYnBDTzl3N2V6eGVjRjd5UWFwZmV4ZkRSNkxTcUVrMHdla2dEWWluMElT?=
 =?utf-8?B?Z3lCeHRSTDdPVmtqWkJOTVV4dGdtMTRwcnZjOEQyU0pXRFhuRG16dEt1Smtm?=
 =?utf-8?B?a0VYVktCTFh5bDBaTTJ4YmNlNEsvM0FSQmxhKy90M0F2RWMrOUwxdWZxZVJP?=
 =?utf-8?B?UFFDdmg3NFpHKzNFTHlMT2lkNGp6VEJ5aGxEY3JZd013THoyRXdXbFJsSlRD?=
 =?utf-8?B?dzlDMTZoYjJxUFova29wNVU2MGs0anRGL1duZmtQL2ZIaU1BMGRHOEhjY1dj?=
 =?utf-8?B?S0pabWRxNVpvQlFQQml3MWVKYVZILytySmd5aFZ0dlZleDYrRkx5S0pzd1Bl?=
 =?utf-8?B?Ty82b0t2RW52ZVpiaW54YllJS2tSVDU1MEMydHdsMlpGbGMxR3I5b2FaczVW?=
 =?utf-8?B?eVE0MFBncisyKzVYMUxWRlRzUmZwanl4eGZxUHo0eXJJUkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3VtZXVtaEJrMzArL3h2N1c4TCtJMVV4WmZ5VEEyenFMVUViUjBOVDhsdUxP?=
 =?utf-8?B?cTVJQkdEYjZ3WFBua1RMUXVXNGpGRUo2K1VCVGlHelY4WnduWU5LMGJPQUZ3?=
 =?utf-8?B?Zk16VVV6WHJIMnVZbC9oN3RLcmg5MDVDSGFiR2tydStEUUJhdnN4dEp3Y1BU?=
 =?utf-8?B?NjE1cWZHSmplbkVaTmk1dUx6QzBQWk9WbU5FK1NWNWVXY3NSRmVxWVZHY2Q4?=
 =?utf-8?B?L1F4aUpHd2tRakREYzdCczVBblBsVXBXLzdycEdjL3FxdXJXVGF6VHFnL3NE?=
 =?utf-8?B?OG9aZ0M1SDJCL2tOTjRtZGZ4TGdlNEtzK25LN0RVbVhzeHVWekJiVE5YVjBD?=
 =?utf-8?B?Snd3NlpRWitIYXJTcnhJczRxTGVTMWxGVmh2dkZPMnl0UUtBNy8wVEozTkJG?=
 =?utf-8?B?WnNVbnVrZzB3M2NwL1NFRzBGRkk4Q0NpaHBROHprME81SDZsKyt1ZkhENm1D?=
 =?utf-8?B?VzJ1UDF1L2czTUYvOWVhK1FaQ01LU2VFa1k4NE0xZDdZazFVQ2ZtQ2pvcVRB?=
 =?utf-8?B?OFRCdkFOZDZRaFRPcWpRYVV3cllnS0hqeC9aUnkzSk04WXBJam9CeE8wNE5P?=
 =?utf-8?B?ZGxheUl1bHhjUjkyNnRCdjNNZUR5S3U4Wm1tN1pnMitva1lMZ0o2ZkZsb3d6?=
 =?utf-8?B?OFBoQmdwQUdLQjB3OTNXMDE3cGdGNVlIRlVPTGM2c0FxZWJFb0pmK2MzRmI4?=
 =?utf-8?B?TnU2eUV5QVE5cEhkdSsrd1FuSmJ4VTFyTEpDRW4xRTMxQlpRQ2w1cVpZc0Ix?=
 =?utf-8?B?Z0tncVBFaEl4MUxNTWk3RDlONXlGMzVYRit3TkZHcFArRzVWQVE0bk9JT2NZ?=
 =?utf-8?B?QmEvSEJIMXFtanhXVkFpZmdnUlpLL0RjU3pLRENVRTFYdytqbGV1WVI4TXRq?=
 =?utf-8?B?Tit4Und0WDlHSVpwdnEwRkxFVm1aaHplUWtoeUwzWTNXVEUzSWNRdldRTzNW?=
 =?utf-8?B?ekVacVpFVXVLU3oxT2EvcUFqWU1CU2hjT21iYXRPSi9KbDZRRlUzcEJJMkhJ?=
 =?utf-8?B?QWkwcFlJWEtrUFdPVGcwWHVDNjY2YTczbGNjcmF5UjZpOTdWRjhKN0dISWFK?=
 =?utf-8?B?cXhyaXd2UkVUZS8rNHlyOEFtWHQ4Y3BYTGdOMlptdFNMbjhkNWdIU0tzR1B0?=
 =?utf-8?B?UjF0SFYzSDhZaUNWQ3BZb3B4ZXFSRXVMdWxpV1BLKzRmSis2Y2JyVVJVWlRF?=
 =?utf-8?B?TGFLSDBaNi9hZzdOMk5iOERBbi84WmpGUGdJaWJwT05peDJMaDNZWU1YNkc0?=
 =?utf-8?B?S3lQN3JNbTRYOFRBbzdQWjlRNFBacHYva1d6dGovUW5ZQTFxNjVHdkwrQ0dS?=
 =?utf-8?B?bVY0OWFVOEVwZ3VIRldlbjNXWS9pd21MUXF6dGI3NWpVYndocVdGMFdkVi9Q?=
 =?utf-8?B?NVJEUlk0UEZPQ2RlQ3hHb1R2dzBVdGl5U3NoNUFvZVN6V1lxKzZwSWpYL0Zh?=
 =?utf-8?B?WmJyWE9DUldmTm95UXkvUHpWcjRrVVdrcDFVeUYrK0JxYUZCK0FUV1EwejRt?=
 =?utf-8?B?MVkvWHdzWXBTOXN0bGJWaG9tdG50RG9HTFJKbEZNQ2ZGRWtncGkzTHoreEdo?=
 =?utf-8?B?ajJrOStXVzhQVnU3VWFtMEFRRktTUmloS0NkVm1oUzl3aUZreUdFNlkxQlVU?=
 =?utf-8?B?WklYbmdTbU9CcitPMVNRNEhQRWp2V1ZOTVJLT1pTY29ueStQNmJROHZObWRT?=
 =?utf-8?B?UFUxUlM2aU5FM3ZIN0RVNVBFQ3J1TTBibTVITU1aNkNHR25wb05CUnhSZlNG?=
 =?utf-8?B?UWMrM2p5Z3Z0cXhwUVJTbUZUQWRyUWRvNjhhak5KSTNkazZ2TlhtazM3OGRQ?=
 =?utf-8?B?R3ZQTXkvN1pSdzFrbytYa1ZRL0VhVXVTeEdtaUNNREdHS0xyTWdISTcrazEy?=
 =?utf-8?B?UmtIb0lYU2Ywekg4NzRCZ094R0J4U1BrNkdVWHI1RzV3SkIxSGNlemFkNmVP?=
 =?utf-8?B?c3d4Z1FkQnRpRjd6SEtKTXRJSk04VzNqaWU3UlpMQjhRN25PeENDdlhXNk1F?=
 =?utf-8?B?bjNYVFMyK0oxazFVUWZMamd4TnZEcUJmL0hmZmVvTm9XSmxQa05xQjVHcFpK?=
 =?utf-8?B?NTFlc3FXY2hjWlpZR2FzNnovazhHZFpxbDN6cUhKR3hDd1E4a2VzM0FYT2Rs?=
 =?utf-8?Q?d2rG1Kg4dwPPnMxTZsx53idMk?=
Content-ID: <DD3E3B301E7EDA419E3876EC71D4405E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b761be10-0779-49bc-528a-08dd0f6fd370
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 05:45:11.9352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmfjI6tbazIGslRq4kSPz+VjX8xvd1/fLZHt/vNnN23juTPSs2ixTzUiUy8GGqkJpnomKoWTQnOTDPUAq9ZioA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7475
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1004253194.1075035232"
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

--__=_Part_Boundary_008_1004253194.1075035232
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTExLTEyIGF0IDExOjUwICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgc3RydWN0IGRldmlj
ZV9ub2RlICpuZXh0IHBvaW50ZXIgaXMgbm90IGluaXRpYWxpemVkLCBhbmQgaXQgaXMNCj4gdXNl
ZCBpbiBhbiBlcnJvciBwYXRoIGluIHdoaWNoIGl0IG1heSBoYXZlIG5ldmVyIGJlZW4gbW9kaWZp
ZWQgYnkNCj4gZnVuY3Rpb24gbXRrX2RybV9vZl9nZXRfZGRwX2VwX2NpZCgpLg0KPiANCj4gU2lu
Y2UgdGhlIGVycm9yIHBhdGggaXMgcmVseWluZyBvbiB0aGF0IHBvaW50ZXIgYmVpbmcgTlVMTCBm
b3IgdGhlDQo+IE9WTCBBZGFwdG9yIGFuZC9vciBpbnZhbGlkIGNvbXBvbmVudCBjaGVjayBhbmQg
c2luY2Ugc2FpZCBwb2ludGVyDQo+IGlzIGJlaW5nIHVzZWQgaW4gcHJpbnRzIGZvciAlcE9GLCBp
biB0aGUgY2FzZSB0aGF0IGl0IHBvaW50cyB0byBhDQo+IGJvZ3VzIGFkZHJlc3MsIHRoZSBwcmlu
dCBtYXkgY2F1c2UgYSBLUC4NCj4gDQo+IFRvIHJlc29sdmUgdGhhdCwgaW5pdGlhbGl6ZSB0aGUg
Km5leHQgcG9pbnRlciB0byBOVUxMIGJlZm9yZSB1c2FnZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiA0YzkzMjg0MGRiMWQgKCJkcm0v
bWVkaWF0ZWs6IEltcGxlbWVudCBPRiBncmFwaHMgc3VwcG9ydCBmb3IgZGlzcGxheSBwYXRocyIp
DQo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+
DQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jDQo+IGluZGV4IDlhOGVmODU1OGRhOS4uYmMwNmM2NjRlODBmIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAtOTAwLDcgKzkwMCw3IEBA
IHN0YXRpYyBpbnQgbXRrX2RybV9vZl9kZHBfcGF0aF9idWlsZF9vbmUoc3RydWN0IGRldmljZSAq
ZGV2LCBlbnVtIG10a19jcnRjX3BhdGgNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgKipvdXRfcGF0aCwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm91dF9wYXRoX2xlbikN
Cj4gIHsNCj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5leHQsICpwcmV2LCAqdmRvID0g
ZGV2LT5wYXJlbnQtPm9mX25vZGU7DQo+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpuZXh0
ID0gTlVMTCwgKnByZXYsICp2ZG8gPSBkZXYtPnBhcmVudC0+b2Zfbm9kZTsNCj4gICAgICAgICB1
bnNpZ25lZCBpbnQgdGVtcF9wYXRoW0REUF9DT01QT05FTlRfRFJNX0lEX01BWF0gPSB7IDAgfTsN
Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgKmZpbmFsX2RkcF9wYXRoOw0KPiAgICAgICAgIHVuc2ln
bmVkIHNob3J0IGludCBpZHggPSAwOw0KPiAtLQ0KPiAyLjQ3LjANCj4gDQo=

--__=_Part_Boundary_008_1004253194.1075035232
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTExLTEyJiMzMjthdCYjMzI7MTE6NTAmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGUmIzMyO3N0cnVjdCYjMzI7
ZGV2aWNlX25vZGUmIzMyOypuZXh0JiMzMjtwb2ludGVyJiMzMjtpcyYjMzI7bm90JiMzMjtpbml0
aWFsaXplZCwmIzMyO2FuZCYjMzI7aXQmIzMyO2lzDQomZ3Q7JiMzMjt1c2VkJiMzMjtpbiYjMzI7
YW4mIzMyO2Vycm9yJiMzMjtwYXRoJiMzMjtpbiYjMzI7d2hpY2gmIzMyO2l0JiMzMjttYXkmIzMy
O2hhdmUmIzMyO25ldmVyJiMzMjtiZWVuJiMzMjttb2RpZmllZCYjMzI7YnkNCiZndDsmIzMyO2Z1
bmN0aW9uJiMzMjttdGtfZHJtX29mX2dldF9kZHBfZXBfY2lkKCkuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1NpbmNlJiMzMjt0aGUmIzMyO2Vycm9yJiMzMjtwYXRoJiMzMjtpcyYjMzI7cmVseWluZyYj
MzI7b24mIzMyO3RoYXQmIzMyO3BvaW50ZXImIzMyO2JlaW5nJiMzMjtOVUxMJiMzMjtmb3ImIzMy
O3RoZQ0KJmd0OyYjMzI7T1ZMJiMzMjtBZGFwdG9yJiMzMjthbmQvb3ImIzMyO2ludmFsaWQmIzMy
O2NvbXBvbmVudCYjMzI7Y2hlY2smIzMyO2FuZCYjMzI7c2luY2UmIzMyO3NhaWQmIzMyO3BvaW50
ZXINCiZndDsmIzMyO2lzJiMzMjtiZWluZyYjMzI7dXNlZCYjMzI7aW4mIzMyO3ByaW50cyYjMzI7
Zm9yJiMzMjslcE9GLCYjMzI7aW4mIzMyO3RoZSYjMzI7Y2FzZSYjMzI7dGhhdCYjMzI7aXQmIzMy
O3BvaW50cyYjMzI7dG8mIzMyO2ENCiZndDsmIzMyO2JvZ3VzJiMzMjthZGRyZXNzLCYjMzI7dGhl
JiMzMjtwcmludCYjMzI7bWF5JiMzMjtjYXVzZSYjMzI7YSYjMzI7S1AuDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1RvJiMzMjtyZXNvbHZlJiMzMjt0aGF0LCYjMzI7aW5pdGlhbGl6ZSYjMzI7dGhlJiMz
MjsqbmV4dCYjMzI7cG9pbnRlciYjMzI7dG8mIzMyO05VTEwmIzMyO2JlZm9yZSYjMzI7dXNhZ2Uu
DQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29t
Jmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7NGM5MzI4NDBkYjFkJiMzMjso
JnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7SW1wbGVtZW50JiMzMjtPRiYjMzI7Z3JhcGhzJiMzMjtz
dXBwb3J0JiMzMjtmb3ImIzMyO2Rpc3BsYXkmIzMyO3BhdGhzJnF1b3Q7KQ0KJmd0OyYjMzI7UmVw
b3J0ZWQtYnk6JiMzMjtEYW4mIzMyO0NhcnBlbnRlciYjMzI7Jmx0O2Rhbi5jYXJwZW50ZXJAbGlu
YXJvLm9yZyZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5v
JiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xs
YWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMzMjt8JiMzMjsyJiMzMjsrLQ0KJmd0OyYjMzI7JiMz
MjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspLCYjMzI7MSYj
MzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMmIzMyO2IvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMyO2luZGV4JiMzMjs5YThlZjg1NThk
YTkuLmJjMDZjNjY0ZTgwZiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0OyYjMzI7QEAmIzMyOy05MDAsNyYj
MzI7KzkwMCw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kcm1fb2ZfZGRwX3Bh
dGhfYnVpbGRfb25lKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7ZW51bSYjMzI7bXRr
X2NydGNfcGF0aA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Nv
bnN0JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjsqKm91dF9wYXRoLA0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyOypvdXRfcGF0
aF9sZW4pDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7ZGV2aWNlX25vZGUmIzMyOypuZXh0LCYjMzI7KnByZXYs
JiMzMjsqdmRvJiMzMjs9JiMzMjtkZXYtJmd0O3BhcmVudC0mZ3Q7b2Zfbm9kZTsNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7ZGV2aWNlX25v
ZGUmIzMyOypuZXh0JiMzMjs9JiMzMjtOVUxMLCYjMzI7KnByZXYsJiMzMjsqdmRvJiMzMjs9JiMz
MjtkZXYtJmd0O3BhcmVudC0mZ3Q7b2Zfbm9kZTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjt0ZW1wX3BhdGhbRERQ
X0NPTVBPTkVOVF9EUk1fSURfTUFYXSYjMzI7PSYjMzI7eyYjMzI7MCYjMzI7fTsNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50
JiMzMjsqZmluYWxfZGRwX3BhdGg7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO3Nob3J0JiMzMjtpbnQmIzMyO2lkeCYjMzI7PSYj
MzI7MDsNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQ3LjANCiZndDsmIzMyOw0KDQo8L3ByZT4N
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

--__=_Part_Boundary_008_1004253194.1075035232--

