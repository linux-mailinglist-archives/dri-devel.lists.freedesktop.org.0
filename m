Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C4B58B69
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 03:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E53E10E173;
	Tue, 16 Sep 2025 01:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Fdef+AMB";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GZQk7I+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210BD10E173
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 01:47:21 +0000 (UTC)
X-UUID: 12fab780929f11f0b33aeb1e7f16c2b6-20250916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5tkEP/Emq82fbr/hmF/T/nCg0fjGWKKU4hTbFJPJHMk=; 
 b=Fdef+AMBeQGEnqAx3tLOdgyeGj7vnbZcQwX9cv79e0oL0bt20Bamc6ZLQmRcJy3l6f9FtuS9/nGUeu/2fCpSkORwarQOfUC+nu0aHDD6L8BVsb3ITccv4ms20cb4/G6Hob9PGI7DkslzAGbaSeteAeL21qqFODoNb3uFHN/vlCQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4, REQID:1bde9f97-c211-4213-b3ec-90fcdca87564, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:1ca6b93, CLOUDID:a8dd966c-8443-424b-b119-dc42e68239b0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 12fab780929f11f0b33aeb1e7f16c2b6-20250916
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1071858338; Tue, 16 Sep 2025 09:47:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 16 Sep 2025 09:47:15 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 16 Sep 2025 09:47:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKipq3f+2XNBOt7eAnX7M3BSpNIF/z8NdmCmMNuRMRkwDsXU38mjvduO3GNCXVOxVde8p58zm4fkbRisPeCeZPOQDcQlRUQrd+CtuEEotYzVkyZ4DJPn9W1Ks5Fdg446e/5HZw6Cqgy9eftBFNXDo6g1j02M8Y4mqZahpaJfy37O0J3k5Rl8prXH1fSpnTq+LCFeVZ69an7RD/ubHNJW65+SfrHHhj+vUlPZGx8U0R2u0460r7YRSm1wIIfTeAGva7wNsOu+AhzVOT6agmmGyIR2BlMcMC76mT//yIjMrg6EopO1YX50o0wReRGi+Rs+xTj92blWZabStJw1G4iA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSrhC/y51I6ApDxNhQznaN5k3ySiPeXOdCnFgoDuLUg=;
 b=hVwSY3cCSuz6tp354RE2XXoSo3xBtSoonmw3P+8iSgAh8K173tkTP4R0zC7xswb8tgDjw0lTDGqtd/htq3+tmihv9KPbyHUjWCXzwHj9OYma8+k5fuKFjlzO912YSrTlGXZOSj9iV4xy/VqCVAn+8NAT0KXC1SOC+Oo/iytsCE/VenyRfb1dckTkHY19JZTvXJWe2xYwXyuok+ckb5jlY1uDNwJ5aynS26vW3KOohtksEjKulvBvik1q9FgVqPEMmmfA4ptNHsx3y+fVXGR63ca0ShHXg5EENvUHQhbYvFV+WKPEBvUQAbnbY0xC4GZmkJ4gTf5Mhdc+WayLC6W3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSrhC/y51I6ApDxNhQznaN5k3ySiPeXOdCnFgoDuLUg=;
 b=GZQk7I+kNI4xMSRTFwOtNOAWvj6ic2BPiJVj0t3PVYVOinekyiIYMRTU5n05aZUjOx1EdIHch99VT4OwHvNXc4jEtUxXQ6RH7CFsljA4NNNoF++Snu2awh+DHvMytaFW494UOMtORjci2OZgeXJ/L3FxEABzplfI2a2FpdkrYro=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7690.apcprd03.prod.outlook.com (2603:1096:400:42c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 01:47:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 01:47:12 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v4 19/19] drm/mediatek: Add support for MT8196 multiple
 mmsys
Thread-Topic: [PATCH v4 19/19] drm/mediatek: Add support for MT8196 multiple
 mmsys
Thread-Index: AQHcF/MeyqlQUH4fgkmnTEAPXrWUDrSVJ7yA
Date: Tue, 16 Sep 2025 01:47:11 +0000
Message-ID: <1e5e7768f52a260270f991dbc013275223aab816.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-20-paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-20-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7690:EE_
x-ms-office365-filtering-correlation-id: 7322f6bc-c939-492a-acad-08ddf4c2f4b1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|42112799006|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UlhYN2ZQc3NORUs2R3ExQSsxa2NoZk94aU5YM0dZS1BxMUFnZ3kxSUdCbFhO?=
 =?utf-8?B?M2Y0R1E2QzR4RitlTU5JNi9UcXJGcUFHK3dxbjYxWHNoYTFLZ1ltNXRhaFdo?=
 =?utf-8?B?aHZ6dEVFdzc4NW9qcmRGVTZMekZNTmF6M290NkVtRlBTT0MyYlE5ME5NcVR3?=
 =?utf-8?B?dytHYk95dzJ2dzR2bVh2bXYzYmowRE44Q2pHWjlQdXZIZWxlaEQraWdibXdn?=
 =?utf-8?B?eTNNcC9yMkgyVGpLY0dGWDJBOWR5aGdzdG92U0ZEelI2NUxoQ1gvcFd3QjNy?=
 =?utf-8?B?eTljRFJZU0hiaWNWbTJiQlFLYzNRaDloUGVLNEdtcDNNOUd2SFJ6di9ZN1JX?=
 =?utf-8?B?Uis5MkNEZjhmc0x0bjZ2NFZYNm1XUThmQTYrbFB0Qkt6M0pNRlFVb0N6WlYx?=
 =?utf-8?B?NDE1dCtoSzJmOWpIcnkrMVNVV2NrUVVBbWNhQ2dhN2luRDVHUG1YcHcrWTA3?=
 =?utf-8?B?MFBRUk8zWXliTi9wai9mTkpsTENhcGI5N1huRWxtWWpoaXVzbXFKbzg1Z1ov?=
 =?utf-8?B?dE5UMVd0TXBRbVk1enJlVFNBQXo3dGpLSFhZNjNYY2VwTjBSaXM0L0JZM2Jk?=
 =?utf-8?B?L095NXFVWEFTaHc1d2dCenE1TlRIbEJEeGRRVFVScWQvbjZBVGNGTXgvaHpW?=
 =?utf-8?B?aW0wUkZVOUhZZmZ1V2FOd0RrUnNJZ1VCQjRRUFpLZ0VDTVB4RjgrWW8rTlc5?=
 =?utf-8?B?S2RQVmZPQWtDak5DcklwZE1ST0tiREpiMllnU2ZvNVBZWGdubUhWQjJGazZN?=
 =?utf-8?B?M1dPU21EbktXM2dBUWRpUEdmd0toTFlQWHZvOXVqZHIxTUtJNjd0eEtJQVU3?=
 =?utf-8?B?S2w5a3hwNlM4Y1RTWUlkUVlpcUF3aU52L2NWWVpwQzRlalVUd0VZcWJ6TTFQ?=
 =?utf-8?B?VERaNGdTLyt3NklmUC9xazhnNURTK2RtZVY4Y1hjYWRPeW1kNG00OXl1RUtN?=
 =?utf-8?B?OGIvc0V6VEw0TWUrcVg5amRpUlJXT0FYTGZ1ajl5N2c5M0FsbzAwK09DZzNi?=
 =?utf-8?B?RW9uTFBJL2VNcTZ6NmgydTBXTHk1cndBRkpyQk5QYS9lRytqMHlzbCtoSmx1?=
 =?utf-8?B?aDZPU3FYaU56d1RiQXZIWUVZTFV0cWlnWTh2OUF4U2lMdkVCZnFsN3o3eXZ5?=
 =?utf-8?B?bVlneXpBUVBUVmZ1NkJsK3Y1UkNpVi93aXFkbVlJYXdvNlBaaEFwWHVvSGps?=
 =?utf-8?B?TGZ5NDZ0Tm1LeDNUM2ZEUjIyUGh6dEIyNHFrQm95UnMva2dKZ2VuTHFxUlc0?=
 =?utf-8?B?WEdMelVSdmQrQTBKbEI5LzVKL3JaTk0vWVVvSFc3TFZWbmVUT3FlWkpHNEUr?=
 =?utf-8?B?SnZsTlZ2akt6cHZNWWU5ZHZPZHd3d0F3Z1dVVkxGbmJ2Z25lV1BzQjZod21w?=
 =?utf-8?B?dE1EQjg2ZTAza2FWRXJpenVYcTdDaVVpWVI4enoxQ3FuRmdCTmo2b2VrRjBm?=
 =?utf-8?B?MTNuR1d0T1c1NjZBbGdzOXJmOEdqanBTUEZub3creHNLa3ZhRFR3WXZkdUZX?=
 =?utf-8?B?TGJGMElaTUJEWk1jYzZrd1VtcWhtUUQyMFNDd1ltcFdUcDI3UVpSdnlwYmpQ?=
 =?utf-8?B?c0lXMm5aNXZzVzVhUHZuQU1QRmFMeHdkMDN5bWdGMjVrLzc4dUMrRVUvWmlI?=
 =?utf-8?B?Z3lScGw5MnA3ZE4wNjRpRWNKWE9HRG43S3ZZMyt5VElkbDY4TDNYY1d6dktm?=
 =?utf-8?B?a3hHakRseDB4cWVRSnl3S2paSGdJK0pyUmt0WVVIOEFiRmFrY0dUTy9Fenpv?=
 =?utf-8?B?TlBZdTlOck4rcjg3T0dOajVvbUR0YmVnNkpOay9EUmY5QWdHOGhqRk5sSXc3?=
 =?utf-8?B?WTZUNzRsQW1mWWc2RWpVaE81NEFVVmJBU1k3eHppWTVwcUFVMGtBUUx1ZjNs?=
 =?utf-8?B?MktJYllYV0o0TGV5emNGNUsvcmtMOXhPRnR6c1NpSUpEZDFybmRLS3prdXBl?=
 =?utf-8?B?bEYzNWZYUzhYdWMxTkFUU3JRc3pKcWMydkJ0bXhtdkw1VkFrNEZoOGh1TGQ1?=
 =?utf-8?Q?P/84QxWL39HBLkOp3z1OVUY4ZhrtlE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(42112799006)(376014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDNyU2FYTU1WQVBqS2puSVJVKzh6QUcxU2ZETG1FbzNZbnFLVXZzV3krZFRF?=
 =?utf-8?B?ZVJxbWJ3MnJySnkrMHlIZ3dzOW02RUZOaUFxYVVFMzNIL0V6bUF4WUpQb2pT?=
 =?utf-8?B?YkUzU2xUUE5XRzZvTWJvVkR5ekM1VFUxWG1teHR6ZUd2YytlZGRKWTlzMUph?=
 =?utf-8?B?bjZBR2xnWjUrb2crT1ZFSkI2cmJDTnN1SW9IU0Z2Uy9ITnBRQVFtYXptUzVC?=
 =?utf-8?B?T20zN0NVZE1OejV4OHRtNGFDcHJxNkNDc3M0TU0vOU04aTVrVmZnRWxIZDFG?=
 =?utf-8?B?TU0yVVpPNUh1a1Z4azJYaHFHdmxGeEp6T3hrY240T05KaXRlTGlxL3Q3WVJT?=
 =?utf-8?B?SXVVV0RzbmQ4dTFLUk9rUzhTRFJaMWE2bFFoSE1uYXlUZ25kV2R2aFAwR1RS?=
 =?utf-8?B?bklwUERxM2xoZTlaQnR0TGtiRERKSXBoTVBGaEpkb3pBNUZETGthb3FnMDMz?=
 =?utf-8?B?b0lIZTI4bWw4TkRaSXNJME9ERjJ6bUxreGFXaVpWem84YVpWRGJSWEhUU0VN?=
 =?utf-8?B?TW81WWptWjVEbWZHZHBPbGJoSjlFRVMvMXRTNnNHbkdrSWUyRHp2bkxjeC81?=
 =?utf-8?B?ZldRenJBM1ErQ25rMkl2ZTduUXplaW93NGdxbVk1WnY1ZHpDVzMyeEtYYkNE?=
 =?utf-8?B?ekNSM0hUdUN0VXdES2ZuZ1pnT3Nmb2tEakVLUnF5cm9pNU4xa2lURllDTy91?=
 =?utf-8?B?eUJIdG82SldOdVU5M1J1YUtQRlpCdmdoN3hCdjBoT1dYSnNGR2VrYTJsZjhh?=
 =?utf-8?B?RVZGZ0UvS3FzbnBhSXBYdi9DNytDcjllVnk5aU9ScEVmOUlNVGh0SGNkU1BS?=
 =?utf-8?B?T2FWdU44cnltMWkxZy9CWXdQVHFpVUIwVnFWeVd0ZkhJS05Hd09QZFM1a1Rx?=
 =?utf-8?B?bHl2Wnk2N2RZUTRrU0hVSGdrM3hFeDU5RHBGRHNlSUF1QnlQbVVlaWN6SExG?=
 =?utf-8?B?czBHMTRkSFo5NTZHRXM3Z014ZlNFWUhVcGhzTXpocC94NzZ3SkNLWENFdXZG?=
 =?utf-8?B?WTR1NjRQSGdQMkpKY1diT3VMT0xLNithbXFFcXd6MnBqSmVrNEwxVnJCTjcy?=
 =?utf-8?B?b1dTR1hZRkhXM2FZVGRWL3VwZ015Mmg4Q1FnUXV6RDBLTDU1TldzSjM1eGZr?=
 =?utf-8?B?S3NNYXR5ZnFUL3I0aFM2RnBDaEN5OFhKTEQvZ0RtMEpuY0VWbTlCZGNnVmRv?=
 =?utf-8?B?aHlTcm50K243aHJNb3l4ZWl4Mlg4c2JBR293R1NQVmx6MWRUWlFNdEdVQmI1?=
 =?utf-8?B?cEEwR1F6NzYyNkFOSlNiaDc2a3FoMVh1M3BiN2xtOFJPVEw4d3VLbjMzQ0Fm?=
 =?utf-8?B?S21MMkE5Y2tMVkFmWDl1VFdSTmUzMVFHTUk4eWFrSEZHdStZOG5WZ2dVVmZW?=
 =?utf-8?B?ZzlIRnExSVNnRnZwYWg2QWdoVmt2L3FzN3RralB3aUNlZlpJNTdycU9wMjkz?=
 =?utf-8?B?bG5USW04OERvZjVqSDhDNTkrRVVDbWRmUVRFUUEvTlIxR0s2UzYrazdIdFI1?=
 =?utf-8?B?N0hxOXhUWGJNcGs3NlJaRVBzM2xIcUFRenhYVTltKzIzcnpJZnBhbFFEWXBu?=
 =?utf-8?B?RnhPeGwrWjdsSHpYZWNwUkJrUmxyWjF2Z0N3Ri9tRjRmcldlZ0FvT1ZMeXhH?=
 =?utf-8?B?MlM2eUtyTmJqQmFDMUxKRjBhSWF0T21Cei8rcXU2UDh6WU9HbjBxWngvQWZR?=
 =?utf-8?B?bDR0Y2xrNTA2ZSt4Z0tYdXdHVXFJMnA3cnlXeThVcTRkdXpxSkFQSDRMS0tZ?=
 =?utf-8?B?bkl4a1U4TmJ2NUJlRUZjbEdTcVE1OTVjaXV6NTAyZzFXMmUyRmkrdEFtTXcx?=
 =?utf-8?B?b1NaZ0xxMlpKaWVHbFg2cGVTYWoyZ1c1NC9rS29sSE02UitVYkNpc3ZxbUhF?=
 =?utf-8?B?RkVBaWRWcUlpVGtSR1NBaEVvMW9xdHdkenUxVUE1VmFuU0MxakNCQW9ITDAr?=
 =?utf-8?B?dHZkalNiSWxoZWdTMFh6Mzh3R1o4bXd6R2J0TThSQk9tOFR1b2pHTEVBSldk?=
 =?utf-8?B?OFJ6aXNnL0NCTkQ3Slgwb0Y5UlhpTGV3Z1k2aTl5SnZ1dFJEeGxmU3ZYWTdi?=
 =?utf-8?B?ekZOSURYWkkwVXVjc0ZFREdZM3N2Szk0RE5xbFRKa3BBYVVUQzg4czNkL2Zl?=
 =?utf-8?Q?WyI8h4J90JV5//JJAroXHra0m?=
Content-ID: <193B9CEA458F1D4E8B25BA9382F3012A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7322f6bc-c939-492a-acad-08ddf4c2f4b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 01:47:12.2342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9I2S2OdZcJzH6KUsznbMS/Q67Ap7BalxKvDkYL/sNFE1xqW0/8A6OWdsH7qo7fdH1f30QjNGo+by5S/r0RFRuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7690
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1792166136.705409026"
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

--__=_Part_Boundary_009_1792166136.705409026
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDE2OjA3ICswODAwLCBQYXVsIENoZW4gd3JvdGU6DQo+IEZy
b206IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBjb2RlIHRv
IHN1cHBvcnQgTVQ4MTk2IFNPQyBNdWx0aSBNTVNZUyBEcml2ZXINCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
UGF1bC1wbCBDaGVuIDxwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcwMV9t
bXN5c19kcml2ZXJfZGF0YSA9IHsNCj4gIAkubWFpbl9wYXRoID0gbXQyNzAxX210a19kZHBfbWFp
biwNCj4gIAkubWFpbl9sZW4gPSBBUlJBWV9TSVpFKG10MjcwMV9tdGtfZGRwX21haW4pLA0KPiBA
QCAtMzI2LDggKzM3NCw2NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJf
ZGF0YSBtdDgxOTVfdmRvc3lzMV9kcml2ZXJfZGF0YSA9IHsNCj4gIAkubWluX2hlaWdodCA9IDEs
DQo+ICB9Ow0KPiAgDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0
YSBtdDgzNjVfbW1zeXNfZHJpdmVyX2RhdGEgPSB7DQoNCllvdSBzaG91bGQgbm90IHJlbW92ZSBt
dDgzNjVfbW1zeXNfZHJpdmVyX2RhdGEuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IC0JLm1tc3lzX2Rl
dl9udW0gPSAxLA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEg
bXQ4MTk2X2Rpc3BzeXMwX2RyaXZlcl9kYXRhID0gew0KPiArCS5tYWluX3BhdGggPSBtdDgxOTZf
bXRrX2RkcF9kaXNwMF9tYWluLA0KPiArCS5tYWluX2xlbiA9IEFSUkFZX1NJWkUobXQ4MTk2X210
a19kZHBfZGlzcDBfbWFpbiksDQo+ICsJLm1haW5fb3JkZXIgPSAxLA0KPiArCS5leHRfcGF0aCA9
IG10ODE5Nl9tdGtfZGRwX2Rpc3AwX2V4dCwNCj4gKwkuZXh0X2xlbiA9IEFSUkFZX1NJWkUobXQ4
MTk2X210a19kZHBfZGlzcDBfZXh0KSwNCj4gKwkuZXh0X29yZGVyID0gMSwNCj4gKwkudGhpcmRf
cGF0aCA9IG10ODE5Nl9tdGtfZGRwX2Rpc3AwX3RoaXJkLA0KPiArCS50aGlyZF9sZW4gPSBBUlJB
WV9TSVpFKG10ODE5Nl9tdGtfZGRwX2Rpc3AwX3RoaXJkKSwNCj4gKwkudGhpcmRfb3JkZXIgPSAx
LA0KPiArCS5tbXN5c19pZCA9IERJU1BTWVMwLA0KPiArCS5tbXN5c19kZXZfbnVtID0gNCwNCj4g
KwkubWF4X3dpZHRoID0gODE5MSwNCj4gKwkubWluX3dpZHRoID0gMiwgLyogMi1waXhlbCBhbGln
biB3aGVuIGV0aGRyIGlzIGJ5cGFzc2VkICovDQo+ICsJLm1pbl9oZWlnaHQgPSAxLA0KPiArfTsN
Cj4gKw0KDQo=

--__=_Part_Boundary_009_1792166136.705409026
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDgtMjgmIzMyO2F0
JiMzMjsxNjowNyYjMzI7KzA4MDAsJiMzMjtQYXVsJiMzMjtDaGVuJiMzMjt3cm90ZToNCiZndDsm
IzMyO0Zyb206JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3kubGluQG1lZGlhdGVrLmNv
bSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7QWRkJiMzMjtjb2RlJiMzMjt0byYjMzI7c3VwcG9y
dCYjMzI7TVQ4MTk2JiMzMjtTT0MmIzMyO011bHRpJiMzMjtNTVNZUyYjMzI7RHJpdmVyDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7
bmFuY3kubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtQ
YXVsLXBsJiMzMjtDaGVuJiMzMjsmbHQ7cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMz
MjtzdHJ1Y3QmIzMyO210a19tbXN5c19kcml2ZXJfZGF0YSYjMzI7bXQyNzAxX21tc3lzX2RyaXZl
cl9kYXRhJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy5tYWluX3BhdGgmIzMyOz0mIzMyO210
MjcwMV9tdGtfZGRwX21haW4sDQomZ3Q7JiMzMjsmIzMyOy5tYWluX2xlbiYjMzI7PSYjMzI7QVJS
QVlfU0laRShtdDI3MDFfbXRrX2RkcF9tYWluKSwNCiZndDsmIzMyO0BAJiMzMjstMzI2LDgmIzMy
OyszNzQsNjUmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19t
bXN5c19kcml2ZXJfZGF0YSYjMzI7bXQ4MTk1X3Zkb3N5czFfZHJpdmVyX2RhdGEmIzMyOz0mIzMy
O3sNCiZndDsmIzMyOyYjMzI7Lm1pbl9oZWlnaHQmIzMyOz0mIzMyOzEsDQomZ3Q7JiMzMjsmIzMy
O307DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LXN0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVj
dCYjMzI7bXRrX21tc3lzX2RyaXZlcl9kYXRhJiMzMjttdDgzNjVfbW1zeXNfZHJpdmVyX2RhdGEm
IzMyOz0mIzMyO3sNCg0KWW91JiMzMjtzaG91bGQmIzMyO25vdCYjMzI7cmVtb3ZlJiMzMjttdDgz
NjVfbW1zeXNfZHJpdmVyX2RhdGEuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjstLm1tc3lz
X2Rldl9udW0mIzMyOz0mIzMyOzEsDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtjb25zdCYjMzI7c3Ry
dWN0JiMzMjttdGtfbW1zeXNfZHJpdmVyX2RhdGEmIzMyO210ODE5Nl9kaXNwc3lzMF9kcml2ZXJf
ZGF0YSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Ky5tYWluX3BhdGgmIzMyOz0mIzMyO210ODE5Nl9t
dGtfZGRwX2Rpc3AwX21haW4sDQomZ3Q7JiMzMjsrLm1haW5fbGVuJiMzMjs9JiMzMjtBUlJBWV9T
SVpFKG10ODE5Nl9tdGtfZGRwX2Rpc3AwX21haW4pLA0KJmd0OyYjMzI7Ky5tYWluX29yZGVyJiMz
Mjs9JiMzMjsxLA0KJmd0OyYjMzI7Ky5leHRfcGF0aCYjMzI7PSYjMzI7bXQ4MTk2X210a19kZHBf
ZGlzcDBfZXh0LA0KJmd0OyYjMzI7Ky5leHRfbGVuJiMzMjs9JiMzMjtBUlJBWV9TSVpFKG10ODE5
Nl9tdGtfZGRwX2Rpc3AwX2V4dCksDQomZ3Q7JiMzMjsrLmV4dF9vcmRlciYjMzI7PSYjMzI7MSwN
CiZndDsmIzMyOysudGhpcmRfcGF0aCYjMzI7PSYjMzI7bXQ4MTk2X210a19kZHBfZGlzcDBfdGhp
cmQsDQomZ3Q7JiMzMjsrLnRoaXJkX2xlbiYjMzI7PSYjMzI7QVJSQVlfU0laRShtdDgxOTZfbXRr
X2RkcF9kaXNwMF90aGlyZCksDQomZ3Q7JiMzMjsrLnRoaXJkX29yZGVyJiMzMjs9JiMzMjsxLA0K
Jmd0OyYjMzI7Ky5tbXN5c19pZCYjMzI7PSYjMzI7RElTUFNZUzAsDQomZ3Q7JiMzMjsrLm1tc3lz
X2Rldl9udW0mIzMyOz0mIzMyOzQsDQomZ3Q7JiMzMjsrLm1heF93aWR0aCYjMzI7PSYjMzI7ODE5
MSwNCiZndDsmIzMyOysubWluX3dpZHRoJiMzMjs9JiMzMjsyLCYjMzI7LyomIzMyOzItcGl4ZWwm
IzMyO2FsaWduJiMzMjt3aGVuJiMzMjtldGhkciYjMzI7aXMmIzMyO2J5cGFzc2VkJiMzMjsqLw0K
Jmd0OyYjMzI7Ky5taW5faGVpZ2h0JiMzMjs9JiMzMjsxLA0KJmd0OyYjMzI7K307DQomZ3Q7JiMz
MjsrDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoq
KioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1t
YWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVu
dGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20g
ZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0K
Y29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRp
c3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlp
bmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRl
bmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5s
YXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFp
bCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5n
IHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8g
bm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1792166136.705409026--

