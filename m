Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10924A37C5B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 08:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5461E10E38E;
	Mon, 17 Feb 2025 07:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="dIfK5Rq0";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OVReIblw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2EC10E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 07:36:18 +0000 (UTC)
X-UUID: dd95485aed0111ef8eb9c36241bbb6fb-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=qA8rj+HfU3LH53iWHmsbfzCjCyTLA7AG59s7EGoLNeY=; 
 b=dIfK5Rq0AJgGzeKscf6nPTc+ppm8bi5+ZKehz0QnTAjJdK5aZgATwPHirZqZr8uNW1bSUr0bcV8UuBGNNLaOsSolE8ZByqme6mEPdhzaCgyfVGbUe4YzQY2rvVicmFFDQijsrScNUuQQs/TFexzEP0fMFhDYSuhHtDZiU4NNnJo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:4d803342-6ccb-469f-ac60-3ae84fa29054, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:554d77fc-7800-43c5-b97b-ddbe32561a5b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dd95485aed0111ef8eb9c36241bbb6fb-20250217
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 12043771; Mon, 17 Feb 2025 15:36:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 15:36:13 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 15:36:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYA1v7ld439ZUTVu+vQDOgrbsgM2U9SDl+epII2Nf5eWf6jKXB5DcjlVxoqp2n+ov8Wt4B9NiDG24XAgpAWMywy9x0B1NTcg05JSnpWLgMr+hBBmOwnGrbLco4Y42LCNxuxEx6SOR80HsuZUeu5oz608eRME7Wn+uBJtwgdwRqGqVfqF/Kk2IrE/Le9slWe//pgGgQNQdXKJnA3dX0CkfDkpMoB0B9YH/tTTgVS5P7mTyYBVURzes1zQg5kTCW9Y4E9xO/MjvxUezwh9UIY+JlWIGqRE+K/Cbg7njVRz3EjDTX1vfgZshu3yH/BV5SCAjrJzS396F/nvKIQh71OSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K06GE1PcQuDqhUpU3gJvuiDp4BKcJeMTbzWzdDR/lrI=;
 b=L48lAmQYVZU8T1cSaiHNnSVy3i4dx2QcYbdHgpZyYWzczXehyf1TzNOH3zDCWF92xjTTaU9f60Q9IWcky8nPJ7oJE9G+UAQqdvGiWW+BHJ9R0BF0IhQwQEV89NdzM8DXkR/yDcyqtFKrYNELlEwrbIrQ4LfWGidAscqinjH/vcTvdH/soSweOBRLwVI9RQIQ+knW3J1NFg/NCndKmUOf4VOj5npAcaxaKaBGWgQ/VRQ1YvZFO6tg75D8Fvbwzvil9bT7vLGt3bvyxuK7Qtf2etpDifSlpbLX3oO+KBYRlvaux8toFHTXEZVECiEUon7JXfJYJQv0rLRTUD5silHyYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K06GE1PcQuDqhUpU3gJvuiDp4BKcJeMTbzWzdDR/lrI=;
 b=OVReIblw0XG1Fpysg5TZIReJrF7jqSGWOWmmyQMfyvlamKS6XqupKiJd2gMOrJsYz6HGpFUArUcTcYUKJrPmsi26jmE8kZthRoP/foV3F+TuwGQt6hmpdy7od82sjg/mGqL7yzwoJajfiV5NwdnzvXnAVElLw3zaBLnpWdfDBaY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8379.apcprd03.prod.outlook.com (2603:1096:101:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 07:36:11 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 07:36:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, Alexandre Mergnat
 <amergnat@baylibre.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "will@kernel.org" <will@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "fparent@baylibre.com" <fparent@baylibre.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 3/6] drm/mediatek: add MT8365 SoC support
Thread-Topic: [PATCH v7 3/6] drm/mediatek: add MT8365 SoC support
Thread-Index: AQHbY2QU9vOuEs5BC0yehlyRevRljLNLVnEA
Date: Mon, 17 Feb 2025 07:36:10 +0000
Message-ID: <716394284d57715652f1f31c4b48b49d3a25262d.camel@mediatek.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8379:EE_
x-ms-office365-filtering-correlation-id: 39900fab-dbc2-4403-79b3-08dd4f25bfeb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cCtMN096WHo3aGdKUWJWSHE5N29vMkJraGppNzJHN0lEN2tiekVtaGM3M2Jy?=
 =?utf-8?B?alpLa1d6RVB2OXo4dE82M24zdU1TL1NkRkRmOXNTa0VTd2ptOEpDSy9mM2JD?=
 =?utf-8?B?VExvWU9UTEpxRnVUTTVwYlpzQmFoOGdWMUR5N3JEUkFodGFiRDdRdFRwcW1v?=
 =?utf-8?B?c2Z5MzJVT1d4OEpzajh2eHN0VFJ6TVlaSWRvcnJZN3Zqa2FLSmRiNFA2U1RZ?=
 =?utf-8?B?YXQzSWUrSTcxWUVpSHptRklhSTkrMnVrUE5mKzN1SGsrRENOQWR1eHcxMzBv?=
 =?utf-8?B?WVVRd2JtSGQzemJOTjRkbW1aVTlqaXdXc2RrelFldHByMnBYbXpuTVI1UlM2?=
 =?utf-8?B?cy9PZDBUTkFCM3ViMzhXdWVGMFpVdEhpRGQrUTdYbmtJTmw3RUMzaEV5RTFC?=
 =?utf-8?B?cnlMeWRTdENuWHZJSmZPZDcyMVlRamJIeU1YZDl1ZlJPZHg0ZVhyRWdkbVRS?=
 =?utf-8?B?dG1aU004RmlINjY2QmFLb0Z6bkRZVVRYanlFS2labk00WHRGQmxNdzJJS01S?=
 =?utf-8?B?TGEzYmVSQnB2Z2xjVjVRcVMzeS9ZbmpxcGZEbFY2U25Oa2IyTWRLOHFuemRL?=
 =?utf-8?B?UnpjR0szcFRSMUJCSmhvM1gweC9kQVFIZmt3bDFVOVdBdDNJbGc4U2ROcVAz?=
 =?utf-8?B?YnhLbkFZTVZubTduc3gxd3pUQ2FsVlhGRWVTcnRYZTRjUDJocTNTcDA3anhH?=
 =?utf-8?B?ZWJhNlFKaFU2Q3dkeFU3aCtERFZyRGRqQkJqK3RKRC9YS1NrOEF0ZFVrYU9s?=
 =?utf-8?B?b0lUYlJyNTFpSmN1M0lZWTEyS3g0aFNKTEdBODVHMERPRTVkZjl4dTdBUnp0?=
 =?utf-8?B?aEZPR0I0N2FLbmFnYWJFVXMvcmk0dzF5a3pmVUZkQXdpcWhmbE5LbXVPNE90?=
 =?utf-8?B?MkozdFZRdFBkcDAvK2R5UURYR2Nvcy9pMnM0QU03eDVGT053cFI4dE5qVUl1?=
 =?utf-8?B?ZHgxQzl5cUVlL2xPWG4vT1lUMHVLaUtTeEZxNXE0dlpGR0dhMjNvMitRd3pT?=
 =?utf-8?B?czVIeWZSa1VkQzczSXpHOXNWeXhDZTlkODBHZ29rNjVITGVad3AwRDNvcGtm?=
 =?utf-8?B?OGVVTWE4TDFRK1dOUTRjR0JSVWRORzJESHJNSm92Y1NERU9tbHR3azJGc1ZI?=
 =?utf-8?B?UTMrUmM4Y3FFT2dxTk11TUpDT3kzWHYvMXVDd1lBWHFhQ080V3NBSjNQZzJ1?=
 =?utf-8?B?OXRwQThGbWRVUjQvWVF6cUlwaUxIODNpY2Q2cVVUTzNPZFVsQnlvdENUaUtJ?=
 =?utf-8?B?MDlhOGM3MCswVE9jODR4dXFVTnVhVHF2ZHA1VWhtK1czS1FuL0xzVk9GZndq?=
 =?utf-8?B?M0J0ZVZidmZmTHlMSTB1ZzBBa0RZSG9Hc2JzQXY2MjF4c05Obm1VMnBvZGhz?=
 =?utf-8?B?R1BIa3dZaFp5TjNvZGlUaXY5WjlkcDVhWnprNTZBeVJTeGp3ZEVldVhoRy81?=
 =?utf-8?B?SFExeU9ZTURJc0l2dkVxZXJWUG52Y2dtUlJRTVZOZVZwM1NSMG1FbVlTejBy?=
 =?utf-8?B?STZSSVNRNVoxVEVvdi9KOERFVkw4c1l0dHlsSlBXZWlUVC9IWE5adDNMZGNu?=
 =?utf-8?B?YnJqcUpacGJZNEgxN0k4N3dqcDMrWGFoODdNWGJJNCtkZ1ludHh2VHpucFM1?=
 =?utf-8?B?VU9FS2tlWEdwV01qcGFWb1ZDek5vTm8rZnc5NUVlZENlYVRCMXZKcVVxMnBH?=
 =?utf-8?B?YXpuMG1GNWkwYkQ1OXFEQ2I3RlJzc3p5UmxGUFdtZU5xNWZiaGZWcUdRSUda?=
 =?utf-8?B?ZkNOb1dZR2JGQ0FaOUVPT2xnS0psMFF3c3Vpd0t3R0JHYnVRTkR0aFBQdGZ6?=
 =?utf-8?B?K08yQzNJcE1OVG43dGpjMVN1ZnBvTkJOaFJlRm9oVmg4UHZBWTZ0anZ4MTlS?=
 =?utf-8?B?d3dqVHBtdnFzWk8vZ2QyS2VXeFFKWVZ6SFpYR3Z1TlArWTF5ZDhRN2l4TG5S?=
 =?utf-8?B?VmtzSTRVaHQwOERhZFVobW9nMk1JSVd2aURsejJiR0lVZzlXQy9HaGxSeHNj?=
 =?utf-8?B?RjN6bklKalNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU9BRk80UHRCVFBwa1JNczFvYW5naFJvUzFMemtJdUJ3M21iTGRaUlk3Y1lp?=
 =?utf-8?B?OWtlcGJKQUxyUTlXaTlrRTFoeXZTM2Njdkc2VGtYeVRuTE1TRmhiQmxhUmw2?=
 =?utf-8?B?L1lDSUEvMVpxcjZYcDBtdkN3SGc4ZzI0R3JKbEo0VVU3Sk9IeGk0V1l3a1Jh?=
 =?utf-8?B?clZLOE9hM3JXMnY5bVA4M0RWT0R4MGk2UmpnTmRVQmpaZkNaMXNxSE00bVBz?=
 =?utf-8?B?djZIdHNJNkZLTXJQbFVld0RZUE0zK0tqN0xpV0N6dXgxd09KYmhGYW11ZTcw?=
 =?utf-8?B?NitQcUh6cm9LUWhpcHlWdEd4ck4yZXMrUjAzY2tvSHliU3M2ckUvQUtjZ3Fw?=
 =?utf-8?B?MEhveVRnVFBCQjRsL3NNWFVZRUJjMElNbytoTTdrem5QTVRlRytsUEFNZGtr?=
 =?utf-8?B?QWtlMndMZ2xPdE1HVkNnL1NrT3FlNWtGdTcybHNDOUpFbG5RSC9MS2JKTHl1?=
 =?utf-8?B?dkxXZEVGYXZTSytuaDFPUHJQMkh5ZGZoQ0o2N1FDOXFBTTdTbGpKeTdXY1l1?=
 =?utf-8?B?Y3lqNnExZGZuS3p1RXRHSy81UlRxaUROZEJxQkVXN2pDS1dLWjFXcmZhNC8z?=
 =?utf-8?B?N20zUnJoTjJ5LzVTVDUrVFh3bTJHcXIyLzZiOW1oYXVSYzlkZktUV0d5WlF4?=
 =?utf-8?B?clRYQ1ZjcUpDbG1aZFlndmhDcDYwNk41ZUVmd1pycnFlYWV3K2krejIvd3NG?=
 =?utf-8?B?ZFVkTkdxTWhsQUR0ZUc5MnQ4UjFCR1JqQ1o2c0VKR0ZDaGQ0Y1I3RTdvT1VQ?=
 =?utf-8?B?TW5CelVsbm5iQyt6MWNQUldjMTM3bjVTNUt2SGRLUHg4T0ZUYU04bTRzS0FT?=
 =?utf-8?B?ZjdoY1NqL1FkR3BYVGNrenltMk1HWGhIZG51MStESU1HRm9sV09OMVFPK1pW?=
 =?utf-8?B?d01wd1AwV3VPQzhUYnkvc2R6M3lKRDdqejBwRjUwRDBUT2NJUEwrTE9nR3VC?=
 =?utf-8?B?dnFMdUE4VnN0YlJSZjBjSkgrTENpSFp6YTBrRDhIYzFHZ1Urb3g4cVdPanpZ?=
 =?utf-8?B?YmF3WWIyMGU3WVo4ell3STFhMWcxYnA1UU9NOWFkR3FnV3hOK0srVGFqVDVK?=
 =?utf-8?B?NWRybEFJNURpQmVTNWFKSXl5djNBWHlERnF0N0NvaThoZnhpeVhkNVdyTzVN?=
 =?utf-8?B?ck1LenlJQmFYU2F3ZnMyaXhMRzdNWVdmTUljeDhMVWxnYUttNU5SUnVJN1Zn?=
 =?utf-8?B?RGNDSkR0bVJNb2kxNDVxTG42bVJjVFl1WXg2TWhPNWpSUzZzOFdnSThiRFBO?=
 =?utf-8?B?cUcxZThaa0VVTVYvcGk0dDgwR21WRnB1WnNtaWNrdFpJRlNwV2d4U3oxdFB1?=
 =?utf-8?B?SGhNRjc2dysrQk5VTmtnNDV4dHB0S1JKeXNUQWtoWGZGbEtmSk5MdldVN25z?=
 =?utf-8?B?c0dhUlcvbExocWVhYWwvb3lGd2tscjd5cVJKby9DZVYvVy8zL0w5WlRtYzM5?=
 =?utf-8?B?K0g0VE5PMmlySGRpQkR5M2pReXU2ekdROVZsV3N6bEFwQ1pxR0Vib0xjNEFy?=
 =?utf-8?B?dlJvb2lXZlNUSm5BUnkxL3FsR29IR0FqL2dlaGViQ2I4KzNYRjVMb28xSGha?=
 =?utf-8?B?TEd3eHF0ZGN2UGpxaHpDZDRoVllNdlRyQndXS1Rpby9KRWMzd3ZqUzVPT1hq?=
 =?utf-8?B?c0czWnZNazJ0Nmo4ekc5REZjRTZsVlExc29acEdZdCs5TTU5a2U4b1hoTE9W?=
 =?utf-8?B?UzZkL1BmSm9CS0YzM05xSXUyKzErYjlacVB3VkRvc2gwaHlkUUJtcDlNdkUy?=
 =?utf-8?B?Q3Z6b3VhVDV3MlVFUGplb3AzcDNCdndGYXFSdytrV1NmVzMzRE8zcUkwTGE3?=
 =?utf-8?B?WGxPOE5HVWM2QzRBQjk0akEzWm1LYmh1NnRqb25rNEJBakVvR1hrY1NyVUta?=
 =?utf-8?B?elkyeVhWenhQbHRXYTR2cTBpS2VQb0Z4RTZZR3RjL084QXBvVkc5WGgyTjI3?=
 =?utf-8?B?WlpSYlZoNXZaeThkelNXZEF4S2UzaWFyeUdnZkU1NUlqcTVML1AvZWVhVjF1?=
 =?utf-8?B?S2J5WVJyWkNQUWp6VTYzQ0M2NHAwWnBCSzZrZnQ1cHFERmNRZ1NiTDFTTTRt?=
 =?utf-8?B?WS9mS3VyL2p2eWpxR0N1S2xzWEwvTk1LZVp5dHNRWXNzWlhFTW9tNDBWWkFS?=
 =?utf-8?Q?r2DBi7Nq2u+vq42QWBCkqy5aW?=
Content-ID: <38081F64BC91EF448F1D08F4F19F89A9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39900fab-dbc2-4403-79b3-08dd4f25bfeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 07:36:10.8549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lI5zE5bS5B4M9gngL36XPsNv0oDRGBqp4hmLPt2PqjSloL2Zxi1xkghH8n4bItcsOwzeYhhsuZBg1k5Ho88cTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8379
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_891759915.238396040"
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

--__=_Part_Boundary_005_891759915.238396040
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDE0OjMxICswMTAwLCBhbWVyZ25hdEBiYXlsaWJyZS5jb20g
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gRnJvbTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJy
ZS5jb20+DQo+IA0KPiBBZGQgRFJNIHN1cHBvcnQgZm9yIE1UODM2NSBTb0MuDQoNClJldmlld2Vk
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBG
YWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vs
b0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBNZXJnbmF0IDxhbWVyZ25hdEBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMgfCA4ICsrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCAwODI5Y2ViOTk2
N2MuLjU0NzFlZjc0NGNjMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMNCj4gQEAgLTMyOCw2ICszMjgsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1z
eXNfZHJpdmVyX2RhdGEgbXQ4MTk1X3Zkb3N5czFfZHJpdmVyX2RhdGEgPSB7DQo+ICAgICAgICAg
Lm1pbl9oZWlnaHQgPSAxLA0KPiAgfTsNCj4gDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19t
bXN5c19kcml2ZXJfZGF0YSBtdDgzNjVfbW1zeXNfZHJpdmVyX2RhdGEgPSB7DQo+ICsgICAgICAg
Lm1tc3lzX2Rldl9udW0gPSAxLA0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbXRrX2RybV9vZl9pZHNbXSA9IHsNCj4gICAgICAgICB7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10MjcwMS1tbXN5cyIsDQo+ICAgICAgICAgICAuZGF0YSA9ICZtdDI3MDFf
bW1zeXNfZHJpdmVyX2RhdGF9LA0KPiBAQCAtMzU1LDYgKzM1OSw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1fb2ZfaWRzW10gPSB7DQo+ICAgICAgICAgICAuZGF0
YSA9ICZtdDgxOTVfdmRvc3lzMF9kcml2ZXJfZGF0YX0sDQo+ICAgICAgICAgeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxOTUtdmRvc3lzMSIsDQo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgx
OTVfdmRvc3lzMV9kcml2ZXJfZGF0YX0sDQo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgzNjUtbW1zeXMiLA0KPiArICAgICAgICAgLmRhdGEgPSAmbXQ4MzY1X21tc3lzX2Ry
aXZlcl9kYXRhfSwNCj4gICAgICAgICB7IH0NCj4gIH07DQo+ICBNT0RVTEVfREVWSUNFX1RBQkxF
KG9mLCBtdGtfZHJtX29mX2lkcyk7DQo+IEBAIC03NTEsNiArNzU3LDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RkcF9jb21wX2R0X2lkc1tdID0gew0KPiAgICAgICAg
ICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX01VVEVYIH0sDQo+ICAgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1tdXRleCIsDQo+ICAgICAgICAgICAuZGF0YSA9
ICh2b2lkICopTVRLX0RJU1BfTVVURVggfSwNCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODM2NS1kaXNwLW11dGV4IiwNCj4gKyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilN
VEtfRElTUF9NVVRFWCB9LA0KPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTczLWRpc3Atb2QiLA0KPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09EIH0s
DQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1vdmwiLA0K
PiANCj4gLS0NCj4gMi4yNS4xDQo+IA0KDQo=

--__=_Part_Boundary_005_891759915.238396040
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDEtMTAmIzMyO2F0
JiMzMjsxNDozMSYjMzI7KzAxMDAsJiMzMjthbWVyZ25hdEBiYXlsaWJyZS5jb20mIzMyO3dyb3Rl
Og0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMz
Mjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRz
JiMzMjt1bnRpbCYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5k
ZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0
OyYjMzI7RnJvbTomIzMyO0ZhYmllbiYjMzI7UGFyZW50JiMzMjsmbHQ7ZnBhcmVudEBiYXlsaWJy
ZS5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0FkZCYjMzI7RFJNJiMzMjtzdXBwb3J0JiMz
Mjtmb3ImIzMyO01UODM2NSYjMzI7U29DLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYj
MzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWdu
ZWQtb2ZmLWJ5OiYjMzI7RmFiaWVuJiMzMjtQYXJlbnQmIzMyOyZsdDtmcGFyZW50QGJheWxpYnJl
LmNvbSZndDsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7
RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbSZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbGV4YW5kcmUmIzMyO01lcmdu
YXQmIzMyOyZsdDthbWVyZ25hdEBiYXlsaWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMmIzMyO3wmIzMy
OzgmIzMyOysrKysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMz
Mjs4JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMzMjtiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MDgy
OWNlYjk5NjdjLi41NDcxZWY3NDRjYzEmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMyO0BAJiMzMjst
MzI4LDYmIzMyOyszMjgsMTAmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3Qm
IzMyO210a19tbXN5c19kcml2ZXJfZGF0YSYjMzI7bXQ4MTk1X3Zkb3N5czFfZHJpdmVyX2RhdGEm
IzMyOz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsubWluX2hlaWdodCYjMzI7PSYjMzI7MSwNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX21tc3lzX2Ry
aXZlcl9kYXRhJiMzMjttdDgzNjVfbW1zeXNfZHJpdmVyX2RhdGEmIzMyOz0mIzMyO3sNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy5tbXN5c19kZXZfbnVtJiMz
Mjs9JiMzMjsxLA0KJmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3N0YXRp
YyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNlX2lkJiMzMjttdGtfZHJtX29mX2lk
c1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10Mjcw
MS1tbXN5cyZxdW90OywNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7bXQyNzAxX21tc3lzX2RyaXZl
cl9kYXRhfSwNCiZndDsmIzMyO0BAJiMzMjstMzU1LDYmIzMyOyszNTksOCYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNlX2lkJiMzMjttdGtfZHJtX29m
X2lkc1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE5NV92ZG9zeXMw
X2RyaXZlcl9kYXRhfSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTk1
LXZkb3N5czEmcXVvdDssDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE5NV92ZG9zeXMxX2Ry
aXZlcl9kYXRhfSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgzNjUtbW1zeXMm
cXVvdDssDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7bXQ4MzY1X21tc3lzX2RyaXZlcl9kYXRhfSwNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt7JiMzMjt9DQom
Z3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmIzMyO01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsJiMz
MjttdGtfZHJtX29mX2lkcyk7DQomZ3Q7JiMzMjtAQCYjMzI7LTc1MSw2JiMzMjsrNzU3LDgmIzMy
O0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZCYjMzI7
bXRrX2RkcF9jb21wX2R0X2lkc1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsodm9p
ZCYjMzI7KilNVEtfRElTUF9NVVRFWCYjMzI7fSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7
bWVkaWF0ZWssbXQ4MTk1LWRpc3AtbXV0ZXgmcXVvdDssDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsodm9p
ZCYjMzI7KilNVEtfRElTUF9NVVRFWCYjMzI7fSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRp
YXRlayxtdDgzNjUtZGlzcC1tdXRleCZxdW90OywNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMyOyop
TVRLX0RJU1BfTVVURVgmIzMyO30sDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVr
LG10ODE3My1kaXNwLW9kJnF1b3Q7LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMyOyopTVRL
X0RJU1BfT0QmIzMyO30sDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10Mjcw
MS1kaXNwLW92bCZxdW90OywNCiZndDsmIzMyOw0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuMjUu
MQ0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0
LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_891759915.238396040--

