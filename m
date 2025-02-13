Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38401A33AFF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 10:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9091F10EA39;
	Thu, 13 Feb 2025 09:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fRn2zj3/";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rJPCY4qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782810EA39
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:20:24 +0000 (UTC)
X-UUID: befe533ce9eb11efb8f9918b5fc74e19-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=dwsB1ARVJVCbO6ZNYpiEOlEvctSNZZJbFb3i4QsJZ8c=; 
 b=fRn2zj3/7aTjxzsLQJyS0vQCUE15dCuV7vpJfUcbXDlfYyQqBTWRzCsz9icD8FxWeMgp2ie3GcNjn3T6XGvTeE1Q/69XYp8bOi5hRqju1atbtzuUX7qfOPw3XRoUkKtkyTNwjWIRO8HqfPfPQjATbX9AfgQcp0fDr8ihH/QFsJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:b5156477-9ef7-4aaa-ae13-1563109ab108, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:b04d69a1-97df-4c26-9c83-d31de0c9db26,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: befe533ce9eb11efb8f9918b5fc74e19-20250213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1836781215; Thu, 13 Feb 2025 17:20:20 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 17:20:19 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 17:20:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7Kz2d0B74luDO2NV+YWn/6UTLx6KC5IeOBbDGkFen3TIxkRSMnjwOqOZ8FC56JEAkaBAttPhxYPy2UwKR5SP/Ok83x22CtthJWy9BQ3gIM/vY30qyleoC5umuDoafyPxIni7lW5YHTJNe1Hh9td91RD76LlgrQtUQbfl2MfAQxvfRvW5CWrGsaypSdk19Hor7wgql5gNGp54BMANag5R3bcybpHFNDqaE9c+vZD5yq/+IIphPZ+vfbZHsGp7v5CjS3HzBz3CV+LolzW7YopDTtkaNKInXUo3fFhz4iGs0ZATPc+aLVxvm4Qab4KDE3ZZxBe43hia4CqGT8dljW51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN3+GKkpHh+srxF+9z63Z0l9E4kqxM18pyUHw2+FEug=;
 b=gaTCfSBCJaoyQhvUc1FU1ynI+kbNlaKgBrM53MNVKtBeeQtlSA8VN5i6r4n8eIKKJsu0l3U6XlUy1lKud/U45dqqtKg3oD/Ap5pq5JSBqr0uRx0aAglLj4l93WDBPXN4oF2kYaVIuCBLdMLfRmhoQ46F7IetJN8kYIQ79yPfcJcxdKOcT+lFCDYy/YVLZ/wsRiLzJ4SbdjNrtiDtiN32qs7CXvWkTvcpzDZFYbwmPTgSNqt+4wb1g9BUG+M4SFngxemJNUVarE06GrHBYbrRS1Lqs9fRfgQtAD81vSgAgQeYvOoclpcCfkk0qLFBrsAr7qVx8AuS0DCGaVmMEYyQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN3+GKkpHh+srxF+9z63Z0l9E4kqxM18pyUHw2+FEug=;
 b=rJPCY4qpbDmzQk9fxATvI0A+FCb4kaOFYSoYIq1h2ZKqVOzm+tlSnUBsadGpb+XoBl0MjDg+HTEgXvBBQjCsYoKIoQFpk620MSqNeelJRgerkGwgDfaI18lFz+3NHBm3EQjvxxj8ARzH7wekiTCQFsB1w+wWnjtV3SuVJIfMkWg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8789.apcprd03.prod.outlook.com (2603:1096:101:205::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 09:20:16 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 09:20:16 +0000
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
Subject: Re: [PATCH v6 37/42] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
Thread-Topic: [PATCH v6 37/42] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
Thread-Index: AQHbfHk038p6zcjPCUqdeoNCelyMUbNE+AiA
Date: Thu, 13 Feb 2025 09:20:15 +0000
Message-ID: <4ff6d01a040b37d4f581ea3808db4851e555a4fe.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-38-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8789:EE_
x-ms-office365-filtering-correlation-id: bbda752f-e6a5-40c8-4750-08dd4c0fa0a0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MTlUcUhvcVJiK0ZJeFQyVERVNnBIWU9BbDFRekpxbUFsL0VVT0MvcHNyTjNZ?=
 =?utf-8?B?L0ZlRUdKSTJBU1hndHFzNWZOc29VMWxEYlFZWmh4RGVOWS9nc0dKOS83RmdJ?=
 =?utf-8?B?Ti9IWEFoQ1dudVFNNXdpUTZrSDhhR05QM09PUG9IOUcwMmRJZDZicWJ2V3FI?=
 =?utf-8?B?YzhTbUVFMllySjNQMWd4UWFvaWZzOExWTU11bHhIU1RqTHJNa1ZVUDRiT2Ja?=
 =?utf-8?B?TGxkS3c3K2dIQVdyaUZ0UHNheWpkN1FVZDlBcW5tcTNaZWUvcjNkNmUvc25a?=
 =?utf-8?B?cHdpbkNodmwrV2RsbXk1VnUwY053dUpGeSszSk03T1BQRFY4RXpJVDFzVUgz?=
 =?utf-8?B?MDZoN1BXU1lnUzdENFVQWittc3p5bFhjc1l2UTd6a2xsRDJQYUtoc2tVUE5B?=
 =?utf-8?B?NnovcUQwV0JsRS9OblpZNGRxYUdHMkUvQ2duSW40VFZjS1JaYkt3amZnd3A2?=
 =?utf-8?B?WHJzRm9zZHlwTXpRK21BWU9DdjVFeXVDRzhCRnNxK295MHNGeEJOeHJlcUEz?=
 =?utf-8?B?MU8zb2c3NWlhcGtRQkxhcnRzTktCT3VsZlk1L1I1UjZibjBuam5uU2pabGxQ?=
 =?utf-8?B?RUtwL2pVOXU0TkVZaFZSS3pLYXJMTWI0MWxEck03Wm5tbzB2bWFpTDY5NzFk?=
 =?utf-8?B?MGlXWlpNQ0hGRzVoTUJoR1FPeXhsTW0wYyswZ21IWER0OHlaZ1Vnb2RGQ2pr?=
 =?utf-8?B?L1B1Nld4TlY3dWZUVU84ZlhuQUVYQ0d1Rnpkc0lkSGtxSUxrOEZpRTNuS1FB?=
 =?utf-8?B?aUtRZXJ3UHJrWExGRDlYbTZYVGZXMWlRRWRoNjBXaVB5dlI3NHI1K1lCRmZG?=
 =?utf-8?B?OUdHNWZHaGN3UURDZjhyNXZxVWxENkNyLys2RWRWdEQ4Y3dJNFprVkxMVWFi?=
 =?utf-8?B?ekZ4SVBheDAranlVNGE3LzBVK2NjZFpqQjBkTmFQN0dNVUdGb2VOTFZRVGQy?=
 =?utf-8?B?RTRmOUYwQnNyUHdVMy9vajBudWNkY2hMc0lMc0plcExJQmpLREdic2krSnpP?=
 =?utf-8?B?NGxHWHhMTm5lVEhISDZ0L2YrS1NTaUkreEVXTDJsZXF2VmdRdlZoeVdmUXpt?=
 =?utf-8?B?TE90L2JlRWk3NFdzS1krcms5ajE0VnBIbjVpV2swL1Bndi93NTBIeWZNN2F5?=
 =?utf-8?B?bVAyWktiWEJ5dGU4Ti9WVEZhb3NaRkJ1OGlXUkJ5NS9jdGVwWFpDdW5aSE0z?=
 =?utf-8?B?bzd6d3ZUcnhYMkh6dzVqMU1CWXk3VEJFeG4vTHhDeVhEelpvbVM4ZnNmdHgr?=
 =?utf-8?B?bGpsc2hDalF1cEFDa1owenNYV3paeVVCMFF5NjMzdlhnVmFCcU9GNXNSTStv?=
 =?utf-8?B?Nzk3MHRwSm0ybXZvaGlWQVNmcU05OWlMVGVwc3FMejhJUFdmUFZCUUUvR0lu?=
 =?utf-8?B?MzlkK2tCMS8yczhnOHJNU2JEbGNCREZPb3BOK05FUkVOVDR6M2h3MHUwM2R5?=
 =?utf-8?B?aWJXZmNqRy9IZGJhZjdQaEZoaEt4SHFWRjgrZUx3TWNhR2RSMHZ2SElIR0xa?=
 =?utf-8?B?S1VMTXBRQjJFSnc0ZHlmWVdld2JhZ0xncWxLUkRvZ2M3SjdwTG9EOTU5V1Vn?=
 =?utf-8?B?MGVhNndKL2ZUUVVLTWdldnlDbVNDOVZrRnRNckx0VnVpTTdZd05FS2pSL3li?=
 =?utf-8?B?QjBTa3BYM2dQLytFcGFLbm95WXo5ZVpZZm1zaVJkT3dZUlJ4TWc4QXVLOEt1?=
 =?utf-8?B?S2piSllsbzc4Q0hVVFBkTEZIQ24reUhTNWdlVXRkZEJrcHg3OHpnbC8zUHZq?=
 =?utf-8?B?ZjZkaDVnRFpkRW0zaDBkY2JOOXRxNmdDL0pVeTlZMXdmTHRUcHVCdXdhdUJW?=
 =?utf-8?B?NVVPKzZ0Wm81SkcrMENNeWhyRC9mSXlFcTBQRnRZWHFjUUdmVUQybFRuVlho?=
 =?utf-8?B?TGdwczRtalNqTzM4dTY3RTMvU3I5cnFMcUdocjJ3MmhvZHJXMXpQNXdxd2w1?=
 =?utf-8?Q?qbM7caXziAoey0NFqx8ozrViFB4ncLk7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUF5V2FQQlFicnRYVWZuM3NJbUFmbU12d0E1dWZTb3ltZGNGZjVXdER3dS8w?=
 =?utf-8?B?Tzg2WnhKN3VzVVZoR3o3YlhaQ3ZaZk9DdC9lMTNkbVdNTFQvNE5mOUc2MHRx?=
 =?utf-8?B?aHJyUjljUkVGK09qb0dRNmdZbFoyWjN3Vm5mS1NIL0UwaU8xaVRScU9uSElF?=
 =?utf-8?B?UlNZdEJMdGc2NjAzcDhJNEFheGFaN3R6UHF5RmpsNW9kckMrbWUySEVneXpr?=
 =?utf-8?B?Y2xTNGdITnAvajN4ZlB0ZVR2MFVzeVA1UWlRTGkvYWw5K3J5RkhPRlVFaGlF?=
 =?utf-8?B?YSsxWG1rVm84K2ROVWFnc2xnMzZhVWRlTlJBYUMrOHZKWkgwdDUwOGhtcmdo?=
 =?utf-8?B?c2o3Qk56TXpqNWY5YUt3a0dMMS84WERnNVVZRENQVld6eUpUMjNlanBIajc3?=
 =?utf-8?B?bDMvemlOcXhOcEcydFZGUlpFbDNLcE1tZ0lFUlFkOFJaYmtkQXNRc3Z2bDBi?=
 =?utf-8?B?dWJyeUduQ0FMeGxMQzFhbnc1M21acUg5SC80MXlrZm1SRzcvVVFhY2FjRE1C?=
 =?utf-8?B?bW5NZU9kYVNRK1VEUDRTVkUwNDd1OEx3ZWJ2TWlMbjdwbHY0UDdRaDdQd3gv?=
 =?utf-8?B?K041VVRUeVpMZGpsOEtmeWhoR0k0NDFLa1JYSTI5c3FiSVVuM0xYVkNtaEJi?=
 =?utf-8?B?OHJKRjJtaEUxeVk0U0s3aU8xZExZL0hDZFZEeUNqZDVXcC9RdmZ4bDROaXpC?=
 =?utf-8?B?VTQ1c1lyZHIzWXBHSXgxT3lUem5sb3dvMlBKSllVY243cjYrSnMxOFNoTXB6?=
 =?utf-8?B?Vm1JSEM4b0JNVFU2THN1Zkt4UVBDMFVMQUpJY0xiNWJWUlI2N3p5NkJGOXNX?=
 =?utf-8?B?dWhFeUV6KzBxUVVLRkpJeThUdEVGOGdzK1BZR2NoTUU2N0hiZWhBNFN4cUFX?=
 =?utf-8?B?Mk1wOW1Sc0FXa3hBbVVZbnYzZnlybTJ1SEhtamI4aHdyejlKUnp2Yy9nK0d4?=
 =?utf-8?B?djUxa0pRSVJLcC9PcmtXZnlzYkljSHNBN1QxU1QreVBxanpHUTJoUmJ6SEF1?=
 =?utf-8?B?MEFZQ1RoeFJmM2JWME1CSVFOUU9zUEtvUjlEdjZiVWJ1RjFsb2JSdFFZRW5s?=
 =?utf-8?B?MUErSkZrdHJzRmlJVVFVTFpjeGV3TUJwSEJsb3lEWlpsTHBPOXZUSjI1c1hC?=
 =?utf-8?B?L0c3bVcyQjR1QTBQK0x0QW45cmRLSG5lVmVUci9uaHF2dFNQOXJlTWxNRkM4?=
 =?utf-8?B?YUlpeEJvL0RxczNIdWFlNUtBZThZWHpDcUJMTnJlVUVqT3ZWTk9nMENkRDA2?=
 =?utf-8?B?VWpRRkF5MTZXc3grbXdEZzBnZ1ExN09UQ1BpQ1BKTVhhaXFZdkhBS2djMy9D?=
 =?utf-8?B?VnVmVXA3VFBIaGg3ck0wK0xJa3gzcUVwOWNZKzdOeU1JTSsraVRHTGhLS3NI?=
 =?utf-8?B?UHdTTm9HR2J3bXk3dlhNeko5T3c2b1pVQWtSUEhUc0hxN2tudGp4WDFIcW1F?=
 =?utf-8?B?SndyTmNXN0JvdjZMVDB0NkxoYmR1RjI2ekJXbE9YdWoyT2krSlhWZk1sSW1Z?=
 =?utf-8?B?Y2pNUk5KUnlBRGZuaWRIVGJYb1k5MUFQSXhuKzZHcVVCaS9ETjlwYU5lUzdz?=
 =?utf-8?B?RnpvaDc3ek9BUWlKcmtGTDJHVTJUVjdMMGMyTjFpS2JXUzZYeUxNRXpML0tZ?=
 =?utf-8?B?ZzdSQnZlTllPN01nb1RRTmxNdUdsN3lRblJhc1VFWkZkWUcvV2U0R2lTQTYz?=
 =?utf-8?B?dExaWHIyZjM5S2syMEJGTlBaRGc2L2NxdUVkMnQ0aVdsbXRDWDdtZzN4OW10?=
 =?utf-8?B?dVlKVStTeEQzOHhSSHFBdHIrLzkvaTljZGxRL2ZIeW1VK05XSjNXelp1TzAr?=
 =?utf-8?B?b0VmaEtvOVRQMmNDb2t1T0xVNVZncW83UmlqRm1QL3FDbSt2cTNPRWpUWFYw?=
 =?utf-8?B?bSt5M0lzKzJwNlpwSzc5WnpISVlWWWsvWE5WMEo3UzZQMVJIYXllZW0xMFhW?=
 =?utf-8?B?UU5TeXpvcXlYRHc0WE5uKzJoYlZtUnA0QWNHWFBmbWlGVFRGblAwbjhpVE9u?=
 =?utf-8?B?V3RiUzlkdUtxU01ZQ0FWM01WWWsvRnNOT0tlbnlQSHBmakFwaFJOU1BpWjA1?=
 =?utf-8?B?UGg5WG44d0N6NldhT3p3YlNCRFdrdFAvQ0h0QU55and2TUdFMHYxNmtweEl1?=
 =?utf-8?Q?DS8OWaAJc1cxEsTFmBUt5hXC3?=
Content-ID: <240AC92CC71EAC4B9B36FDEC87CDD12A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbda752f-e6a5-40c8-4750-08dd4c0fa0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 09:20:15.9311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTqGS3xbRXB81X2PJtaJiRBde8xWuRXH3Sa5jD1ohJSPigO8ipp9q9qGAZJSVxuyf+VF6y68kgIZultjrLhhjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8789
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_296129188.436478491"
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

--__=_Part_Boundary_008_296129188.436478491
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjM0ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIHRoZSBu
ZXcgSERNSSBUWCB2MiBJUCBkcml2ZXIsIGFzc2lnbiB0aGUNCj4gcG9pbnRlciB0byB0aGUgRERD
IGFkYXB0ZXIgdG8gc3RydWN0IGRybV9icmlkZ2UgZHVyaW5nIHByb2JlLg0KDQpJIGNvdWxkIG5v
dCBmaW5kIHdoZXJlIHRvIHVzZSBoZG1pLT5icmlkZ2UuZGRjIGluIHRoZSBwYXRjaCBvZiBhZGRp
bmcgaGRtaSB2Mi4NCkNvdWxkIHlvdSBkZXNjcmliZSBtb3JlIGFib3V0IHdoZXJlIG9yIHdoaWNo
IGZ1bmN0aW9uIHdvdWxkIHVzZSB0aGlzPw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gVGhpcyBj
b21taXQgYnJpbmdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
X2NvbW1vbi5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMNCj4gaW5kZXggNWVh
NDU2MDg5MjFjLi4yYzkxZjY1ZjI2ZmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWlfY29tbW9uLmMNCj4gQEAgLTQxMSw2ICs0MTEsNyBAQCBzdHJ1Y3QgbXRrX2hk
bWkgKm10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgICAgICAgIGhkbWktPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09QX0RFVEVDVCB8IERSTV9C
UklER0VfT1BfRURJRA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgfCBEUk1fQlJJREdFX09Q
X0hQRDsNCj4gICAgICAgICBoZG1pLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9I
RE1JQTsNCj4gKyAgICAgICBoZG1pLT5icmlkZ2UuZGRjID0gaGRtaS0+ZGRjX2FkcHQ7DQo+ICAg
ICAgICAgaGRtaS0+YnJpZGdlLnZlbmRvciA9ICJNZWRpYVRlayI7DQo+ICAgICAgICAgaGRtaS0+
YnJpZGdlLnByb2R1Y3QgPSAiT24tQ2hpcCBIRE1JIjsNCj4gDQo+IC0tDQo+IDIuNDguMQ0KPiAN
Cg0K

--__=_Part_Boundary_008_296129188.436478491
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMjozNCYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0luJiMzMjtwcmVwYXJhdGlvbiYjMzI7Zm9yJiMzMjthZGRpbmcm
IzMyO3RoZSYjMzI7bmV3JiMzMjtIRE1JJiMzMjtUWCYjMzI7djImIzMyO0lQJiMzMjtkcml2ZXIs
JiMzMjthc3NpZ24mIzMyO3RoZQ0KJmd0OyYjMzI7cG9pbnRlciYjMzI7dG8mIzMyO3RoZSYjMzI7
RERDJiMzMjthZGFwdGVyJiMzMjt0byYjMzI7c3RydWN0JiMzMjtkcm1fYnJpZGdlJiMzMjtkdXJp
bmcmIzMyO3Byb2JlLg0KDQpJJiMzMjtjb3VsZCYjMzI7bm90JiMzMjtmaW5kJiMzMjt3aGVyZSYj
MzI7dG8mIzMyO3VzZSYjMzI7aGRtaS0mZ3Q7YnJpZGdlLmRkYyYjMzI7aW4mIzMyO3RoZSYjMzI7
cGF0Y2gmIzMyO29mJiMzMjthZGRpbmcmIzMyO2hkbWkmIzMyO3YyLg0KQ291bGQmIzMyO3lvdSYj
MzI7ZGVzY3JpYmUmIzMyO21vcmUmIzMyO2Fib3V0JiMzMjt3aGVyZSYjMzI7b3ImIzMyO3doaWNo
JiMzMjtmdW5jdGlvbiYjMzI7d291bGQmIzMyO3VzZSYjMzI7dGhpcyYjNjM7DQoNClJlZ2FyZHMs
DQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO2NvbW1pdCYjMzI7YnJpbmdzJiMz
MjtubyYjMzI7ZnVuY3Rpb25hbCYjMzI7Y2hhbmdlcy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZs
dDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjst
LS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1v
bi5jJiMzMjt8JiMzMjsxJiMzMjsrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5n
ZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24oKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7
LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jJiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KJmd0OyYjMzI7
aW5kZXgmIzMyOzVlYTQ1NjA4OTIxYy4uMmM5MWY2NWYyNmZhJiMzMjsxMDA2NDQNCiZndDsmIzMy
Oy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMNCiZn
dDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9u
LmMNCiZndDsmIzMyO0BAJiMzMjstNDExLDYmIzMyOys0MTEsNyYjMzI7QEAmIzMyO3N0cnVjdCYj
MzI7bXRrX2hkbWkmIzMyOyptdGtfaGRtaV9jb21tb25fcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9y
bV9kZXZpY2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRnZS5vcHMmIzMyOz0mIzMyO0RSTV9CUklER0VfT1Bf
REVURUNUJiMzMjt8JiMzMjtEUk1fQlJJREdFX09QX0VESUQNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
fCYjMzI7RFJNX0JSSURHRV9PUF9IUEQ7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLnR5cGUmIzMyOz0mIzMyO0RSTV9NT0RF
X0NPTk5FQ1RPUl9IRE1JQTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO2hkbWktJmd0O2JyaWRnZS5kZGMmIzMyOz0mIzMyO2hkbWktJmd0O2RkY19hZHB0Ow0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0
O2JyaWRnZS52ZW5kb3ImIzMyOz0mIzMyOyZxdW90O01lZGlhVGVrJnF1b3Q7Ow0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRnZS5w
cm9kdWN0JiMzMjs9JiMzMjsmcXVvdDtPbi1DaGlwJiMzMjtIRE1JJnF1b3Q7Ow0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjstLQ0KJmd0OyYjMzI7Mi40OC4xDQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwv
cD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_008_296129188.436478491--

