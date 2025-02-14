Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786BCA353E4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 02:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C72710EBD5;
	Fri, 14 Feb 2025 01:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Kdy1wAcJ";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="R0Wfo+HW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A2610E796
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 01:52:09 +0000 (UTC)
X-UUID: 498572eeea7611efb8f9918b5fc74e19-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=8BQ0rl9mw8KL+4rCY/75LnFq2C3x6yitkWB/OJbu7aE=; 
 b=Kdy1wAcJBp1/8IFT8Mb0I2ciU7auYUaHx1Mkp5LY5OVrSPOC3xqgS2hvAlEEvCc9PhigUGQOsRaL21nVCvhjmkbCobY9FSl54yQQR3rheVPWSVOvAWYs0L9Inl+FIxmIH7t68BjSbqdD/A8GknYYEjBqlCx5LbNj+VOFqVrsPpY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:77e19d45-e08f-4258-8875-a6918c43d6f7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:d89d71a1-97df-4c26-9c83-d31de0c9db26,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 498572eeea7611efb8f9918b5fc74e19-20250214
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1187721979; Fri, 14 Feb 2025 09:52:03 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 09:52:02 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 09:52:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6sPM8B9r43Pb88WINyTuT3/qUtyLjHzXNCk8OvA0+GtcGcnMelEtoqopP0uiDGvTiahmcCcNUoYlA4lrnkaXhe+g6T4qwpsXjKlt8ndg/JPJx3OIMmK/5zHLwfU60FE7FSQELi77raRP5qWVTe51P0kjGWFanC4FqA4P6RKhJMFh1DLvtdRdlozq5qUlKfvd5D59FzDENh+45XHSJFq+E5kXXwKFXacROe406Q83TEx1fD0KgMb/UnUPjr2BOf3ypV0JrKSVQSmm5SKiSAMbSN87DZcBoAKxS+VFaOP6ZqZV8YXndB3lZIGLFxqEfS9+lIGQ4ZFyMeZwk9QjGQwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+TxcV+iPGdAnFJAx7WJopZocKiWoiWvQRqZX+Im7EY=;
 b=U8G/clX1tMCpXqlGVSrFNJE8k45OS6oCyk3EfIEroNbU9oTDuw968TXRODCg0mJIdONgiVeeTddlF5NwVJ2ZfOgAaKNj1HONFlGZwOVPy9jJqDQmYzq0g9w4cFlOBto2LVm52aYbzNhZFR05z0W+JnwyONokI6VdCvKMi+XaF8rmeQK8DTk6/IImNScx7X7rZ6RdAFo8zyrVXeId3xmxIAMnyixWlBl7ZpSH9hwgO7j44eRD5QVNQ/8MZPHk8Ijsi7sJq1+8D7IgFEjQZ2qVvsPz+QFaSxjXwTzb4zHw++MB+prWmHJ3vXQQFe4oVVxd4n2j+/2iLmiU05tbkyg02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+TxcV+iPGdAnFJAx7WJopZocKiWoiWvQRqZX+Im7EY=;
 b=R0Wfo+HWgXumrZ9V5j6jlcP098SbsJNCqNNTHCJCMzPjcaFq8J3crEZd6Msjq1Ibmnp9+/ezZczvKcKq5zLs9Yo2Q6eya2nQ6xbgHN+2UY6y2eKu7Y32nMzEuLvtn8SriDBwzvI1EzfoIHhT8qZcZfx4Hzi7pV4NwZyJagFJPSw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OS8PR03MB8818.apcprd03.prod.outlook.com (2603:1096:604:28a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 01:51:59 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 01:51:59 +0000
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
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
 <Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v6 09/42] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
Thread-Topic: [PATCH v6 09/42] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
Thread-Index: AQHbfHkaiMYyujEbyE64CpDuL6FtRrNGDR4A
Date: Fri, 14 Feb 2025 01:51:59 +0000
Message-ID: <5eefa246f471f4b9382d6f20a9ea783136bd80c5.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-10-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OS8PR03MB8818:EE_
x-ms-office365-filtering-correlation-id: c04856f9-cdf6-4f45-dfb3-08dd4c9a2b82
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aHl4K0J3SmdjV2ZydGRKYzFyQlBNeDFoUWNmM1FTWmJSdjMwZ0NpR2dkOWpL?=
 =?utf-8?B?ZWgwR1F3Z2ljQUpnMXliUVBNWXd6b3ppeGNBS084US9pMzZsSjlKQklIZ3NK?=
 =?utf-8?B?eFg4Nythc2txSFo3ZDA0Mm9hUDlUaDE1UWs2eVdTUGgrcWk4RHRlMnJBaEhQ?=
 =?utf-8?B?VHd4d3VEUzRaVjQ2aHl0Yml4clNSUGY4UjQ2TzZRTkI1VjhzVktGNDVZNzkx?=
 =?utf-8?B?cVpFdmNOeHZWSE82enBxaWx2YnUzT2VxcmFpblpxbE1NOG1TQ0NJY3ZNSkNi?=
 =?utf-8?B?YWVjOGFoYTAwTS95aEZrZms0dWVLT0dydDJhKytDUTJJT2NPOUNyQWtUcFRY?=
 =?utf-8?B?ei9EWHNnOG0zejdtaE5FS0pDeExQS21ZVklKSUJKdDEvTW9hZnhrcXZOS2sw?=
 =?utf-8?B?MW1mOG9QelBXM0crenREaEsxb3h1aUhrTUFXbGJKTzlmRGE0c0VvY0Q2aVVT?=
 =?utf-8?B?ZzJtTXpxcm9HQlFtL2w4UXR4TWVmajMvUmY4SmNkcU50UmFvbk5oak4yaVR2?=
 =?utf-8?B?emh2ZVVWaDJ5RkZZSWd5RHljdVlYdlVhSitsdm9WTWZqSTRxUmFhZi9hR2Er?=
 =?utf-8?B?RGp0Zk9HOXhHRHYxZGN6d0t5VmdqMGI2bXNna1pvSVpWWis2SStGSEgyY2dy?=
 =?utf-8?B?OEtPalB3N1BLem1TWUFvd0hmb3YycXkydHhORFdZKzFVSDlZc0ZEYVppek1j?=
 =?utf-8?B?YTgzOVJuNXFPT0FKMVhZWWhIaDR3VitWTGxoaHBGYkJNQVBHald0d0R6OElm?=
 =?utf-8?B?UXpZODF3aWJPMzNJN0JybldIWGZMSnp1VXJLclMzeVZsS1RlTmo1MVp6ZTJ0?=
 =?utf-8?B?RXNNZXB6aFlLSWM1Nzk2ZmRvSExkcnNoaUUrd25uUUQwYUdJelQ4eFRkdFlN?=
 =?utf-8?B?UFB1RnEzN1pNZUFFbTduOHB3elJqREg0UEFETFVmZGYyWThLdFVFU2lBSVZl?=
 =?utf-8?B?dVFRVkFFNWlROWpxMURGeTZXa3BtRHZtMm05VzZWYk1UNUN5M0tMQUlBMW9a?=
 =?utf-8?B?NVRTYU9aa2NHMklHVE9uR0pFZHNBQ3VqL09ESUtUY3FKVlI0a3FqV3l0M2xB?=
 =?utf-8?B?aFpRZlR0ZW5XUmpGdlVYYnJoay9ld2hnSFNXTHBtSDRJT2NRaE9VSERROGZV?=
 =?utf-8?B?aUdobmQ3UEJMZ0psbGJOc2JwRjVmdEtvRmlSRVZNY05kWWhGWDVyOHl2RzhU?=
 =?utf-8?B?MmFpczIrMU5QcGo3Vk1wNThteHBSaGJTN1VWMWdHMnlHRnMwRjVFVUhrbVFl?=
 =?utf-8?B?b2lvVEovY3Z6Q1Z0V2Z0ZHFwWTc1dVIxQllLc0RIVTVoL0RjbXBxRWt5cnJn?=
 =?utf-8?B?UmlZbk40YlIxSXRKMEZYeDNHNjhCRnFlK2V3dFBxRGxQUUlqTW5VMGRrZm9X?=
 =?utf-8?B?ZWR1RTFiVllVdUlIMXhWVUt5ZVZrUngwNXdUUnFGYWY1a1FGMFo3VkozQlp2?=
 =?utf-8?B?QnE0d01ob2FXWlNqWmdFajBXTHcxd2I0Zy9MMndMRmp2TEVvYVFRenVYNFQ3?=
 =?utf-8?B?bWtDa296dVM1VGVEY04xRVpPUEtrY2dPaUhwR0V3VFd3UzNBdlJaaUx4TVlV?=
 =?utf-8?B?NjA4Z1BjaWZtQkZZWjBxNFRPL3ZDSzVzWkRmZmNvVmlzREphQlBtZWhBamE4?=
 =?utf-8?B?NlVtRFB0ejBRcjNyL1VhdzBaOXBaMTNvWWZyNzJlb004QTNkamgzcGd3ZXNZ?=
 =?utf-8?B?S01hYlI3VUJEYWp1QnRhWHZiVGgwSHBFeWx6d05tVmdSckcvTTNIYlFRbWEy?=
 =?utf-8?B?RWlrRWpWYVlBTHlQeEtkRXIybHZnNGs3SitNTnVLL1REeFh2dnJDb2d2Mm44?=
 =?utf-8?B?c0xzcDlXbXFZTlgwRitpSUFpNS9iV2czejlzOGpWNG1ScE5BT2RiZjFJRTB1?=
 =?utf-8?B?SnQveVhMTnVLM24yZytGRllVYWxYVGd0bmhxVGtUeWptclc5UWhvYzQ5bXla?=
 =?utf-8?Q?9EIYYFJLQVPXzKhtUoLeHuu5IJ11dgVd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjNLdllxbm1MN0F5ZVEwOXhJZ2xpZ3Rnc0djYitLaFh6SnAxV1JWTzFDa3BK?=
 =?utf-8?B?Mlk0VXhyMXE2WHdOYTQ1cnFmcDYyb28yY09LZWxYVW9iOVJZMStiZERrMVBF?=
 =?utf-8?B?dktXZXZzc0FkK1pjSTdreFBYc1IvRHhYdHlzMUFEdVhNc01YV3VicDZBOUZs?=
 =?utf-8?B?U3VMOFFPTkNrZFowQzJGYTFWV0lLLzFYS3k2MEM1Qkc1UkM3TmVEUjgyZTBP?=
 =?utf-8?B?QjZ4eWoxd0kyaG40ck9kODQwcjhEWUVWczNsOU8zUkE2Z04xUGRWUUp4R1Zv?=
 =?utf-8?B?N3F3Wk1FaldWUzgzUlJpWGk0NFlXZE1nMzNhTnRBYnFJZGlENHJUYU9kVVoz?=
 =?utf-8?B?RzYxS1JSRTcvdVJRVWh1UmdPWTlKMkVLYkRZZUhqZTJWVnZMYlBIRjZnSzNr?=
 =?utf-8?B?YnRoWGNSak0rb3krQmZFaFVwZ0VaaWNsNkQ4MGhiSEEyT3N2NnMxZXoremts?=
 =?utf-8?B?QXVvdG44RlZwTkdYdmVkWmh0bjFZQ0dHL1RzbGROd0ZMeU15NSt1NWNVS29B?=
 =?utf-8?B?ODRMc1dsSTduRlVXdFgrTlBLYjBheHRtRkJBdzFFWlVMcDlXbWdsNE1CYVF5?=
 =?utf-8?B?QTdIVGhZOVFoZy9NcnVaek1yVlNuTWh2aWFXdHBCZURhWU1YSSthYW5HemMy?=
 =?utf-8?B?NzhlYUhDQ09KL21zZ0NnUlAvazc0ZXI0ZXNzVDYrRlVvZEQ1eWt3TWtiM25T?=
 =?utf-8?B?YXBHcGJ0eFc5MWttMkJYZEhKMWsyUlVnclgvZS95c3BhemtpSmdhd1YrOHo2?=
 =?utf-8?B?YWlTM0xTVzZoYkxLN1BKd3lEMTJMVmZzeGxZcG9QNWozTlpvRXloeXkyWUlp?=
 =?utf-8?B?ZjNpcVc5M1Q1dUZKNTR1V0xHRDVwNFkyRkwyMEdoaklGOFFZQVpEemI4eEtz?=
 =?utf-8?B?UnBlb2JhR3VGKzNLK1M1TlExOHdUWloyMUcwYU9qckdoYVdKNWh6NUhIQlJM?=
 =?utf-8?B?Y1c2bEM3UklwdFY1dUc3cEpCTXRnVVFkLzV1bS9veVpIOFRibjNlcUdUdkR1?=
 =?utf-8?B?UUxJallFWGRMVjd1ZjBsVUlpS0h2djd6c0pMeHY2b1o0SVJRTDZjRnROOGND?=
 =?utf-8?B?WGFreFJ5OTBXN2lUSmR1cnpuZWVwVTlDbXdkanB6WHZKaXNMSFF0aUI1L3py?=
 =?utf-8?B?aDRxenpGZGNISSsvNjAyMlZLZjJLWmxTbzRuQ0tSYW5SWUM3ZUQvd1Nnb2pN?=
 =?utf-8?B?T1BSdi9Cc0lkWkFBblJQaVNWMFZ4eWgzWWx1Zk0vYXBZelpLa1I2SDBZQjBT?=
 =?utf-8?B?MGZzQU1YR2VmZm9JOFZhMTFkdldjakVqVEpOTVpIeWdzOHBmdWlWWkpBaExD?=
 =?utf-8?B?bnVjOUtFS2hnYnJCL2M5ZmxDMXZPUFpXQUVBeDZ4dEpkSHBqclQzS2RRQUYw?=
 =?utf-8?B?ZWdjRWRGSjVnMjZaU212ZnBETzBzRUFsVVN2WjZHQlNyOTNPMVBCdytmazln?=
 =?utf-8?B?dGRpbTJ5UFlGb1d5enZJa2VPR21WbWpINmgxVkpGVlJpNUhCV2JRMGFQYVlW?=
 =?utf-8?B?a1ppMVg2Q01GbTZvU3JpY2hndEJtUGh3YjNLVWZGMlB0WUJ1QTlxR01Qb2lF?=
 =?utf-8?B?RXJBTlR2NTg5TUJGcXcxV3VRZHNyMktWMVdhM3hGZTFMMFo3OUxRMWw3UWNq?=
 =?utf-8?B?RW01ZlBST2pvd0t6anFNSzR4YmtNR1B5RzU1dXlCY3AyaWd0dENZV3hacUMy?=
 =?utf-8?B?MUsyaTRzY0pDdHNMUkQxRG5iZTF0YWhCQzgwMmYrYmJ6aHRBM0JjeHZweU42?=
 =?utf-8?B?NVllNjArTFN4YjBDWWVyeUVpNzRBS2wzSzdlckVuMm13cXBJY0Y3RUlJaTVa?=
 =?utf-8?B?cW8rOUFmajFMelFYd2pRTXA4dDA0OGtSL1VtYmZxUzUvbTVXcndzQWtPUGh0?=
 =?utf-8?B?M2srK3Ixb3liK2JjZEdTcXUvNmlSTnhLV1VLVHI4T2h5QS95dFlFUFNLSk0x?=
 =?utf-8?B?K3ZLRjZNY1k1Y3JrdUZocFNWTFFvSjNsSDd0RjduQ0xHL3YxdTI5WWZnRHhp?=
 =?utf-8?B?Q3FSczdHRnRJcGZIMmcxNzg5TmNKc3ZMOHZkTVZiN0x6Um9haVlGSHFseVI0?=
 =?utf-8?B?d1pLSWJXd1d5aGh2NXdPUG9tVGwrSUp0WmpUcXZJNGlGZmZ3aHFRc3h3UDRq?=
 =?utf-8?Q?nRFgToRwXEfkk48CmhyQ1iRe+?=
Content-ID: <99551B979AF66241A082DDC064AD647A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04856f9-cdf6-4f45-dfb3-08dd4c9a2b82
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 01:51:59.4667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pMvf0iAUulxdkkll61LUaggwJNjBWRoYCaEDHl2qzWqIAmfgu/oatkNaUCF9Q7Or6gfdecdGbcb7bBg/HQ5aSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8818
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1303633656.1940193980"
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

--__=_Part_Boundary_009_1303633656.1940193980
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjMzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIHN1cHBv
cnQgZm9yIE1UODE5NSdzIEhETUkgcmVzZXJ2ZWQNCj4gRFBJLCBhZGQgY2FsbHMgdG8gY2xrX3By
ZXBhcmVfZW5hYmxlKCkgLyBjbGtfZGlzYWJsZV91bnByZXBhcmUoKQ0KPiBmb3IgdGhlIFRWRCBj
bG9jazogaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSBhZm9yZW1lbnRpb25lZA0KPiBjbG9j
ayBpcyBub3QgKGFuZCBjYW5ub3QgYmUpIHBhcmVudGVkIHRvIG5laXRoZXIgcGl4ZWwgb3IgZW5n
aW5lDQo+IGNsb2NrcyBoZW5jZSBpdCB3b24ndCBnZXQgZW5hYmxlZCBhdXRvbWF0aWNhbGx5IGJ5
IHRoZSBjbG9jaw0KPiBmcmFtZXdvcmsuDQo+IA0KPiBQbGVhc2Ugbm90ZSB0aGF0IG9uIGFsbCBv
ZiB0aGUgY3VycmVudGx5IHN1cHBvcnRlZCBNZWRpYVRlaw0KPiBwbGF0Zm9ybXMsIHRoZSBUVkQg
Y2xvY2sgaXMgYWx3YXlzIGEgcGFyZW50IG9mIGVpdGhlciBwaXhlbCBvcg0KPiBlbmdpbmUgY2xv
Y2tzLCBhbmQgdGhpcyBtZWFucyB0aGF0IHRoZSBjb21tb24gY2xvY2sgZnJhbWV3b3JrDQo+IGlz
IGFscmVhZHkgZW5hYmxpbmcgdGhpcyBjbG9jayBiZWZvcmUgdGhlIGNoaWxkcmVuLg0KPiBPbiBz
dWNoIHBsYXRmb3JtcywgdGhpcyBjb21taXQgd2lsbCBvbmx5IGluY3JlYXNlIHRoZSByZWZjb3Vu
dA0KPiBvZiB0aGUgVFZEIGNsb2NrIHdpdGhvdXQgYW55IGZ1bmN0aW9uYWwgY2hhbmdlLg0KDQpS
ZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jIHwgOSArKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBpbmRleCA1YzE1Yzg5MzU5MTYu
LjY3NTA0ZWI4NzRkMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IEBA
IC01MDEsNiArNTAxLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9wb3dlcl9vZmYoc3RydWN0IG10
a19kcGkgKmRwaSkNCj4gDQo+ICAgICAgICAgbXRrX2RwaV9kaXNhYmxlKGRwaSk7DQo+ICAgICAg
ICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+cGl4ZWxfY2xrKTsNCj4gKyAgICAgICBjbGtf
ZGlzYWJsZV91bnByZXBhcmUoZHBpLT50dmRfY2xrKTsNCj4gICAgICAgICBjbGtfZGlzYWJsZV91
bnByZXBhcmUoZHBpLT5lbmdpbmVfY2xrKTsNCj4gIH0NCj4gDQo+IEBAIC01MTcsNiArNTE4LDEy
IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wb3dlcl9vbihzdHJ1Y3QgbXRrX2RwaSAqZHBpKQ0KPiAg
ICAgICAgICAgICAgICAgZ290byBlcnJfcmVmY291bnQ7DQo+ICAgICAgICAgfQ0KPiANCj4gKyAg
ICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHBpLT50dmRfY2xrKTsNCj4gKyAgICAgICBp
ZiAocmV0KSB7DQo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRwaS0+ZGV2LCAiRmFpbGVkIHRv
IGVuYWJsZSB0dmQgcGxsOiAlZFxuIiwgcmV0KTsNCj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJy
X2VuZ2luZTsNCj4gKyAgICAgICB9DQo+ICsNCj4gICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9l
bmFibGUoZHBpLT5waXhlbF9jbGspOw0KPiAgICAgICAgIGlmIChyZXQpIHsNCj4gICAgICAgICAg
ICAgICAgIGRldl9lcnIoZHBpLT5kZXYsICJGYWlsZWQgdG8gZW5hYmxlIHBpeGVsIGNsb2NrOiAl
ZFxuIiwgcmV0KTsNCj4gQEAgLTUyNiw2ICs1MzMsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93
ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkNCj4gICAgICAgICByZXR1cm4gMDsNCj4gDQo+ICBl
cnJfcGl4ZWw6DQo+ICsgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+dHZkX2Nsayk7
DQo+ICtlcnJfZW5naW5lOg0KPiAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPmVu
Z2luZV9jbGspOw0KPiAgZXJyX3JlZmNvdW50Og0KPiAgICAgICAgIGRwaS0+cmVmY291bnQtLTsN
Cj4gLS0NCj4gMi40OC4xDQo+IA0KDQo=

--__=_Part_Boundary_009_1303633656.1940193980
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMjozMyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0luJiMzMjtwcmVwYXJhdGlvbiYjMzI7Zm9yJiMzMjthZGRpbmcm
IzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7TVQ4MTk1JiMzOTtzJiMzMjtIRE1JJiMzMjtyZXNlcnZl
ZA0KJmd0OyYjMzI7RFBJLCYjMzI7YWRkJiMzMjtjYWxscyYjMzI7dG8mIzMyO2Nsa19wcmVwYXJl
X2VuYWJsZSgpJiMzMjsvJiMzMjtjbGtfZGlzYWJsZV91bnByZXBhcmUoKQ0KJmd0OyYjMzI7Zm9y
JiMzMjt0aGUmIzMyO1RWRCYjMzI7Y2xvY2s6JiMzMjtpbiYjMzI7dGhpcyYjMzI7cGFydGljdWxh
ciYjMzI7Y2FzZSwmIzMyO3RoZSYjMzI7YWZvcmVtZW50aW9uZWQNCiZndDsmIzMyO2Nsb2NrJiMz
MjtpcyYjMzI7bm90JiMzMjsoYW5kJiMzMjtjYW5ub3QmIzMyO2JlKSYjMzI7cGFyZW50ZWQmIzMy
O3RvJiMzMjtuZWl0aGVyJiMzMjtwaXhlbCYjMzI7b3ImIzMyO2VuZ2luZQ0KJmd0OyYjMzI7Y2xv
Y2tzJiMzMjtoZW5jZSYjMzI7aXQmIzMyO3dvbiYjMzk7dCYjMzI7Z2V0JiMzMjtlbmFibGVkJiMz
MjthdXRvbWF0aWNhbGx5JiMzMjtieSYjMzI7dGhlJiMzMjtjbG9jaw0KJmd0OyYjMzI7ZnJhbWV3
b3JrLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtQbGVhc2UmIzMyO25vdGUmIzMyO3RoYXQmIzMyO29u
JiMzMjthbGwmIzMyO29mJiMzMjt0aGUmIzMyO2N1cnJlbnRseSYjMzI7c3VwcG9ydGVkJiMzMjtN
ZWRpYVRlaw0KJmd0OyYjMzI7cGxhdGZvcm1zLCYjMzI7dGhlJiMzMjtUVkQmIzMyO2Nsb2NrJiMz
MjtpcyYjMzI7YWx3YXlzJiMzMjthJiMzMjtwYXJlbnQmIzMyO29mJiMzMjtlaXRoZXImIzMyO3Bp
eGVsJiMzMjtvcg0KJmd0OyYjMzI7ZW5naW5lJiMzMjtjbG9ja3MsJiMzMjthbmQmIzMyO3RoaXMm
IzMyO21lYW5zJiMzMjt0aGF0JiMzMjt0aGUmIzMyO2NvbW1vbiYjMzI7Y2xvY2smIzMyO2ZyYW1l
d29yaw0KJmd0OyYjMzI7aXMmIzMyO2FscmVhZHkmIzMyO2VuYWJsaW5nJiMzMjt0aGlzJiMzMjtj
bG9jayYjMzI7YmVmb3JlJiMzMjt0aGUmIzMyO2NoaWxkcmVuLg0KJmd0OyYjMzI7T24mIzMyO3N1
Y2gmIzMyO3BsYXRmb3JtcywmIzMyO3RoaXMmIzMyO2NvbW1pdCYjMzI7d2lsbCYjMzI7b25seSYj
MzI7aW5jcmVhc2UmIzMyO3RoZSYjMzI7cmVmY291bnQNCiZndDsmIzMyO29mJiMzMjt0aGUmIzMy
O1RWRCYjMzI7Y2xvY2smIzMyO3dpdGhvdXQmIzMyO2FueSYjMzI7ZnVuY3Rpb25hbCYjMzI7Y2hh
bmdlLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVr
LmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxv
R2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jJiMzMjt8JiMzMjs5JiMzMjsrKysrKysrKysN
CiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzkmIzMyO2luc2VydGlv
bnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7NWMxNWM4OTM1OTE2Li42NzUwNGViODc0ZDIm
IzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTUwMSw2JiMzMjsrNTAxLDcmIzMyO0BAJiMzMjtzdGF0
aWMmIzMyO3ZvaWQmIzMyO210a19kcGlfcG93ZXJfb2ZmKHN0cnVjdCYjMzI7bXRrX2RwaSYjMzI7
KmRwaSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO210a19kcGlfZGlzYWJsZShkcGkpOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Nsa19kaXNhYmxlX3VucHJlcGFyZShkcGktJmd0O3Bp
eGVsX2Nsayk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtj
bGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLSZndDt0dmRfY2xrKTsNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBp
LSZndDtlbmdpbmVfY2xrKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtA
QCYjMzI7LTUxNyw2JiMzMjsrNTE4LDEyJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210
a19kcGlfcG93ZXJfb24oc3RydWN0JiMzMjttdGtfZHBpJiMzMjsqZHBpKQ0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtnb3RvJiMzMjtlcnJfcmVmY291bnQ7DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2Nsa19w
cmVwYXJlX2VuYWJsZShkcGktJmd0O3R2ZF9jbGspOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpJiMzMjt7DQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7ZGV2X2VycihkcGktJmd0O2RldiwmIzMyOyZxdW90O0ZhaWxlZCYjMzI7dG8m
IzMyO2VuYWJsZSYjMzI7dHZkJiMzMjtwbGw6JiMzMjslZCYjOTI7biZxdW90OywmIzMyO3JldCk7
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Z290byYjMzI7ZXJyX2VuZ2luZTsNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO30NCiZndDsmIzMyOysNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0m
IzMyO2Nsa19wcmVwYXJlX2VuYWJsZShkcGktJmd0O3BpeGVsX2Nsayk7DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpJiMzMjt7DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Rldl9lcnIoZHBpLSZndDtkZXYsJiMzMjsm
cXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtlbmFibGUmIzMyO3BpeGVsJiMzMjtjbG9jazomIzMyOyVk
JiM5MjtuJnF1b3Q7LCYjMzI7cmV0KTsNCiZndDsmIzMyO0BAJiMzMjstNTI2LDYmIzMyOys1MzMs
OCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHBpX3Bvd2VyX29uKHN0cnVjdCYj
MzI7bXRrX2RwaSYjMzI7KmRwaSkNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7ZXJy
X3BpeGVsOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0mZ3Q7dHZkX2Nsayk7DQomZ3Q7JiMzMjsrZXJyX2VuZ2lu
ZToNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjbGtf
ZGlzYWJsZV91bnByZXBhcmUoZHBpLSZndDtlbmdpbmVfY2xrKTsNCiZndDsmIzMyOyYjMzI7ZXJy
X3JlZmNvdW50Og0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO2RwaS0mZ3Q7cmVmY291bnQtLTsNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQ4LjENCiZn
dDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwh
LS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2Ug
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5n
IHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8g
bm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1303633656.1940193980--

