Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73E9F8D3D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 08:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF6D10E06C;
	Fri, 20 Dec 2024 07:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Lt0gVjjI";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JRqjfDbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E1F10E06C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:25:52 +0000 (UTC)
X-UUID: a0c8d220bea311ef99858b75a2457dd9-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jBaFlOwcZh9lFZ3gLILVSPQutki4mxEl4wZbHHexf2Y=; 
 b=Lt0gVjjI/Gz5jnZ1KYsxTiilMNBCVSh+Q+U2zvXeGoObeSUfl/rnQCMrBKS9WA+UcMU4aCBqLCLmi3dI8HAG1YInq1hCJUgcgO7J6IR2ldPubNbibiPQrc5kVfcZOqJ4IZbG/KQujLGcrOY/BxM8pA+fIUgTUQuJiDowk7W4c5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:6897b9dc-ab00-4bae-a319-ec696d7bb846, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:e9009818-ec44-4348-86ee-ebcff634972b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a0c8d220bea311ef99858b75a2457dd9-20241220
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 847375560; Fri, 20 Dec 2024 15:25:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 15:25:44 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 15:25:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgiUiNVGhFjGwQz6ApUz/mKuqMU9GVUCIrQdwbKlvR6N3RkVC7oqHKvshiTPMxXPK1lvxdFvJTc5IBh593yr6X1rsOkgoi8XLdlkVI3lI74J3xEGvl9/Y49E/p4X/fbjrm8Lv9mBadoAeJ1OlmiOECr4kBvoFdjm8nY01HOcCYR1WHtPriyNXvEDhvZCLSnudDJLh+Ch1ag0N2MXqEh661elkC07jJ/Y0SL6IQZOAh/GrUsJQP1ccyEgrR7+m3XCGqU+k1N7n3ewIl4vpbe4dBx15AeK5nWYofIS4VpUGiJO6Z9bgF5ELaDW7hbBoHEM5RzPdp2Um3dEOALr62etFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNdYNZX9BYmZuo5jqyC+wb7BoqPGjl6KiYfHFw/JYa8=;
 b=rZgpy0Ugbtx8nZDCl5S4N7qD4eBjNWcjDvRtb1EM9l8is+3gmIH7TznnbwDB3KrihadFPwHemy0drl/pGuS4rbmKUqvTNfhm1wDNlgHtmuRJTjx+byLB5eZUNpkFJb4W1Jxfgyfbgvcmr4Y+ocWMgQWKQjmPogQi58lv/vYqvcbmyI7FeTneCYkJOYtA3/ws/9P2Ke9QIPKGQKVyKNYNAeXD9JHI4+9wjT6octP1bLbC0pF1j5lLnwhEomnumJPTIikACjFCY5buDPDR+5Fe6ysvFxpxAWGL83ca834bzrWwL55cLVcDzNU6eTdI10281OrvRqLB+v63mkTyd2/JYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNdYNZX9BYmZuo5jqyC+wb7BoqPGjl6KiYfHFw/JYa8=;
 b=JRqjfDbh1vtdqih1DiyAZYjTabYYAuMHzgqhZY6xKj7LG8JX+AJLRe0rZ254+Y0LCngIm+FaHkZyd/9ki3/XhvV2oBTActETS9ruHJKqp8sNf3q75+Ts3FcrGLNEP4cYCTPuPkZ3KrCBrIEbLWxS7ZblWFm/wp9o43ZbONseUgc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6527.apcprd03.prod.outlook.com (2603:1096:400:1f8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 07:25:42 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 07:25:41 +0000
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
Subject: Re: [PATCH v3 21/33] drm/mediatek: mtk_hdmi: Remove unused members of
 struct mtk_hdmi
Thread-Topic: [PATCH v3 21/33] drm/mediatek: mtk_hdmi: Remove unused members
 of struct mtk_hdmi
Thread-Index: AQHbUJqyhqmN0hUHzEG8Yx2uszSS3bLuv4gA
Date: Fri, 20 Dec 2024 07:25:41 +0000
Message-ID: <8531b18b1e98156e315e3a20506c3e9f274712fe.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-22-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6527:EE_
x-ms-office365-filtering-correlation-id: 2b612f54-5859-4a0c-62b9-08dd20c7822a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S00zS005WDlzcFhaVEhKWlBQbEU0ZXo3ZDJYeHZOVEpUVE16THpVWUZWcWl4?=
 =?utf-8?B?NUZIdUZCS21Zdm5ZdTFUeXNEQTlKbXY0SGZ4SkY3dlN0K1JSRDFmNFkySjAx?=
 =?utf-8?B?cVBVNDJpanB0ZWZIdllYRWtia2hnTVoyaWpodXoyL21qbXlIQlZqU25hMVNL?=
 =?utf-8?B?WnBFREFic1FXY3JnV09iNlRwbDYxSzQ5cDFxSWtXVTNMcVpoMHY3OWJPVnZ1?=
 =?utf-8?B?b2lGaTdDczBvck0zbUcxajd3cXZqY3ZPUG1BRG1rRVFWRFBCNGRtYXhiSURi?=
 =?utf-8?B?elV5Z3B2SUxpYnJaeFdhQ3ZIUC9rb01tQ2tHWVRxNFFydjk3VUZseldEb0Rr?=
 =?utf-8?B?KzNQRFNJL0NpV1AxelpHb3VIdWJGYWhMWTVqaTRIZXR1U1ZoYzYyL29ha0l5?=
 =?utf-8?B?NU9FRXduRWdSUnFtaThPZWs0WXZTM3F4WitEeEtSdjN4d1dIUWpJS1RpQVF3?=
 =?utf-8?B?MWFqMVpmMzl1YUVRTHNoMmQ1R3U3bHNEclFhZS9zQ1BPeFhYTU9ubm1MRzQ3?=
 =?utf-8?B?WExLdTVtTDhnNW16ZDVBMjk4L2c1ZVgvQU5GYlErS2ZKcXE0d3Fhb3pxeHJW?=
 =?utf-8?B?cEdGTjRraW5wRTVUSTdnR1ZINmFZYTJSVlNISWpRbGl0SVV2aFJ2U3JoZzVY?=
 =?utf-8?B?VEhESjVjcWZkdlYzd3dDc3lVMFRqbFozVFd0NmZqczVvOE9GNkhhaHFlMzYw?=
 =?utf-8?B?QlJMYW1JK0VVUUtTdCsxaitQUWdaSGljam80WXFIRDVpcU84OTVPaWNFKzR3?=
 =?utf-8?B?emMrZzVVbk85a2RBbUkyYzJIQ3RYSmlObHpzQlpJUXoxTzFnZ01xMWp1OE5X?=
 =?utf-8?B?djg3R09KY2Y3NVRiem83OFA3T01qYzRSSnpMYkNCdXJLcjNTNEt3ZmNqVENv?=
 =?utf-8?B?R1JjNG00SWlkVldUVXpSUysxRHdYeTFnaFJORXdhdXNHK3Yxa0NzOGFxaXBz?=
 =?utf-8?B?SVkyVXJnQzdqb3N5YXVPKzQzc1kyUXZ3VjkwSUZxRVZqTlF3c2FpSGlBcVdr?=
 =?utf-8?B?VHRCR0ZEdmZwMkVvQjYwZ0p6Umx2c1VrNkdBVmdrSnRHdm9YRWdhTmx1dFZR?=
 =?utf-8?B?alYxbXBHNnNEcDRBeTQ1aWtNUVlEQ0JCbVMyYUNCUThoN2FEcDV3ZVowVTlk?=
 =?utf-8?B?NGtwa0t0SDBCT25HUWxQN2VZMlhWbTlsaXpKQ1Q4amhPRmJoeW5aNDM1RHlj?=
 =?utf-8?B?YXRYNUZaVmF0M1RkN0lPY2tENUlmUHNidjdFUlJzVWp6M1kwZkp4UFBuU2pq?=
 =?utf-8?B?NTAvRWRQUmtHOUg1TWhmMlhEZTJ2ZUhiZXVneVRteDJRN2VDV2xDS000RGFQ?=
 =?utf-8?B?UmxFTzN4VlFacGU2UEpTaXdGWnZJUjBpQmJkY05CNTJ2b2ZlWTJFbVNPd1BP?=
 =?utf-8?B?WVkya1dJSnA5SDZSS25QbHhmdkdvZStTSUZSSkc2QU9PUFV0bFZ3aVlKcEtT?=
 =?utf-8?B?dys5VzhRR1hGMWlWdGp2QnhqSTgxUVUxdkIxeW9STEQwTlFQMTgraU5aUVJ4?=
 =?utf-8?B?Ykp6TzEydzE3NWlQeDduM0RxVFl3WkJsQmdzS01MVE1XVUlsSzBiNWdZN3R2?=
 =?utf-8?B?WHVtdCtVWEtXKzdMZVg2VmJiOUJmbXNDL3ZNN09Ba00vYUhQRVg5c3NHZUVx?=
 =?utf-8?B?UVNDdi85U1cyS2lVS0pYUVdub0VuRHlVZkQ3R1ZBbk5ZU3BJeDJBbCtvSGVB?=
 =?utf-8?B?OVB6bmJ2aHJqS1cwbThwa0lDQVYrZGxJSkZrRVFFeWdzb1hkbVY2YW94TW5C?=
 =?utf-8?B?aDdTNGtLM3R4TkpUcVhpazBOKy9pUCtPejc5UFRLZjcxMVg1UWVDMmpZNUdz?=
 =?utf-8?B?U2xlMEFZZlFsUVFOY2NSNmtxRjVhRVM0M1V4N2FWKzVsQ3EzQ2lnRlJ4bVZR?=
 =?utf-8?B?cElzMEtzQTJZVGpwd2Z5bnVoUHQwQjNtT3MzNTVPYWYwdkY5ZFU0Q0R3WEp6?=
 =?utf-8?Q?zypmmeQrKhF/sGcGTqHiA1lnhFzyV5wE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkY3bmpoODZWemVjcGluODJlN0ZWMk9tQlF1S0l4SEpPcXN3ZjhDeEl1NHV3?=
 =?utf-8?B?YVVHUVoxUjJEZUNQeEVMTFJrSTgvRGRWaFJwYTI4Vldsb05tMHp5czBFZmc2?=
 =?utf-8?B?RC9hYW1sQUN6dWEzbmNoZ294RDhOV1lldzA0cjJQbGNWNHlhTUp0SlRBR0Va?=
 =?utf-8?B?dkdTbXZYSDQ5enA0cm5rTWZuQnpTSEJIR3pJbjRpWFFHei83aWQ0c1FLRzNC?=
 =?utf-8?B?ZWxoMHNzUjMyWnh3RDdTWkh6NUpxQ0ZPcktsTHNKZ0YxUjJwUUxML0JWTGRT?=
 =?utf-8?B?Sys0Uy9qSU5WZjdyWmozQmVMR1hLWEQzVFdEODNNcDQ4aDcyeTlZTS9jalJO?=
 =?utf-8?B?K3IzSng1ZVFwZkt2U2JoREdRNC9hYXE5MkpybWQwT2h6VUFoRmpubFprd2ds?=
 =?utf-8?B?VDhXZGV4V3BDUW1MTG5KL0hEYS9YL3ZqTWplSE9WbTF2SHJyZm10WkpmNXR4?=
 =?utf-8?B?Zlc0amluK0dSSFZQTjNNMXV0TXFxZ0JkNDRkUEhoNWgxeFNRb2FJUFpBL0pz?=
 =?utf-8?B?blhLa2gzbmF6ZUp4V2NNaDlLb1dLY2tDOXJCN25YK2o0azJxWUNUOFNKcFgv?=
 =?utf-8?B?OFVyTjEveDdUSk9rZFJpZjQ3N1ppaTRzTlZvYWYrcVZoNndrR0dzaWMxMjhW?=
 =?utf-8?B?UnhXbFlGNStML29OdUxvVStSaTdOWjRGY0xWcXRjL0U1ZytaWnFHaGk1Y1JQ?=
 =?utf-8?B?TXM4K1RPMVVZdGRRZzJZSE9kRkU5ZzdOMks2Yld3bUp1cEJ2Zk1QK0c2anpv?=
 =?utf-8?B?N0RPQ0x6UXgwTGdrMEFjUkxSN1ROVEdUMUxTWm5za0FUN2tmS0swc2JMR0oy?=
 =?utf-8?B?SlNOVkhSOFZsTzdhbThqOERmVU9XYSs3Y1FycllHNFFPaVN1L0xScUt3Qmph?=
 =?utf-8?B?MVplUitZTTI2WUc4TUc2T0lKRUN2clkxM2pqS3VCK2drNmF6MUE4N0h6c1lM?=
 =?utf-8?B?OVF3VE9ScGdTcVZEUG8zNEZCVFM3MnpRRjdwODVpMnBPWGRwUXVwZWtyVW1L?=
 =?utf-8?B?ZGQ3RXh6MlV4Q1FKdlF2U1pHdEU2WHR0RjlTZ2Z6OHhxSnFSQnRMTk41d1dZ?=
 =?utf-8?B?aEovSWl0aDZta3RrSGdMTXB3TC9QdWlLdzdXV0RUTmpSWGFsbDZycC93WDFH?=
 =?utf-8?B?R1h4RytIdmo2aHM1cnl1aFA0MERpZTlUQ1o3MUcwTGMxZC9Ca2Y3akdaeDg0?=
 =?utf-8?B?NVVzdkl0WUN0S0dNTnNZVWdONVZGUFk5c3l6VS9OVjlwTlFmTU1VQVZweUkr?=
 =?utf-8?B?bG1sVjFHMjh5OWFoai9iTWhuZ1dTMTd2UXpmaWhUckJWd21BRVJnUVBpZENL?=
 =?utf-8?B?U3hmajRkQm5NZ053akFpQnFMZTVEeGV2bS9PbzBQV3NIWW5sYjVkUlFiN2hR?=
 =?utf-8?B?WjFpaHAyWlFOMUt3R29OejZrUkg1aUg4K3MzODl4WjZCcXZKVE84RzhrK2Jw?=
 =?utf-8?B?c201U05qdTUrRUVOcEp2V2NyRjdUNjRxbXljOUc1eWVmVldjZldDd2dXamVs?=
 =?utf-8?B?T3RpOStjN09KMVNMdm5WM3VZdE5xNWM4Z3dQd3NJR05Hc1Q0TTFBUzhtb0x3?=
 =?utf-8?B?cGpUZ2FsYnZhQ01Ld3k5cm9zUFRsbFZaLzE3Rmx2RlpXalkwMlR1dDhQNnpR?=
 =?utf-8?B?UUhuRTZoUDRVbi9mbUhoUEdqV3N6N3Y4UHlGdUlzdXZzRTJyYnV0b2dkNXpl?=
 =?utf-8?B?RFpwdVRGS0VaRE0veEc2SDNzQnNHTGRPSVNHMkQyWHFKakh6UkJLWWJNbUpm?=
 =?utf-8?B?OFhvM1pEQUFpSnVoUUdxN09HNXljNkE4Y3RPM3djdk1acHpYckJ5cnd0MUJN?=
 =?utf-8?B?QzYvMkhPYXZGWFBmNVB6Tks2aWJJeUxad1FQT1VOODhHRGtPdFRSM2pPWjNV?=
 =?utf-8?B?cHJ2bUpJMG45MXY5TDBMNmtZRnRKVjFLVzRja3lzWEFaR0JtNERRSGVjakxX?=
 =?utf-8?B?Q1pOOGE2Mmoyc0FicXhFaExsa3NwdCtOT2F2ZW8wNE96YnIrRTY1VmxHa3oy?=
 =?utf-8?B?WFpmNG1JTkM1N1htS1B6STZZWnZxMWZOUmw5a0w1MkhRbHluRFVjRlZRQmRx?=
 =?utf-8?B?MUxZb3ZBYVY2UG5KeFdOUG5ZNmRwd3JvRld1ekg5RFNydHBHRHUrM3pxS2RR?=
 =?utf-8?Q?W1jtBdZt3piLdJ/YqkqHIsfQd?=
Content-ID: <46C96A824006E948B9FD1CEF2513090C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b612f54-5859-4a0c-62b9-08dd20c7822a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 07:25:41.0414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RQGXoVTFjOP2PW1hrxFpyX5lHW6fOOeEV2CAPNIZx24CK9k0AvL1M0w6bfQkb66cqdfqX4TOx3nikOOUiiuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6527
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_854174920.2119337387"
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

--__=_Part_Boundary_002_854174920.2119337387
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgaGRtaV9jb2xvcnNw
YWNlIGNzcCBtZW1iZXIgb2Ygc3RydWN0IG10a19oZG1pIGlzIGluaXRpYWxpemVkDQo+IG9uY2Ug
YnV0IHRoZW4gaXQncyBuZXZlciB1c2VkIGF0IGFsbC4NCj4gUmVtb3ZlIHNhaWQgbWVtYmVyIGFu
ZCB0aGUgb25seSBhc3NpZ25tZW50IHRvIGl0IGFzIGEgY2xlYW51cC4NCj4gDQo+IEFsc28gcmVt
b3ZlIHRoZSBpYmlhcywgaWJpYXNfdXAsIG1pbl9jbG9jaywgbWF4X2Nsb2NrLCBtaW5faGRpc3Bs
YXkNCj4gYW5kIG1heF92ZGlzcGxheSBtZW1iZXJzLCBhcyB0aG9zZSB3ZXJlIHJlYWxseSBjb21w
bGV0ZWx5IHVudXNlZC4NCj4gDQo+IFRoaXMgY29tbWl0IGJyaW5ncyBubyBmdW5jdGlvbmFsIGNo
YW5nZXMuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jIHwgOCAtLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCBj
OTVjN2I1NTk5OGMuLjNlY2QwZWQ1OTg1MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMNCj4gQEAgLTE2MiwxNiArMTYyLDkgQEAgc3RydWN0IG10a19oZG1pIHsNCj4gICAg
ICAgICBzdHJ1Y3QgY2xrICpjbGtbTVRLX0hETUlfQ0xLX0NPVU5UXTsNCj4gICAgICAgICBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtb2RlOw0KPiAgICAgICAgIGJvb2wgZHZpX21vZGU7DQo+IC0g
ICAgICAgdTMyIG1pbl9jbG9jazsNCj4gLSAgICAgICB1MzIgbWF4X2Nsb2NrOw0KPiAtICAgICAg
IHUzMiBtYXhfaGRpc3BsYXk7DQo+IC0gICAgICAgdTMyIG1heF92ZGlzcGxheTsNCj4gLSAgICAg
ICB1MzIgaWJpYXM7DQo+IC0gICAgICAgdTMyIGliaWFzX3VwOw0KPiAgICAgICAgIHN0cnVjdCBy
ZWdtYXAgKnN5c19yZWdtYXA7DQo+ICAgICAgICAgdW5zaWduZWQgaW50IHN5c19vZmZzZXQ7DQo+
ICAgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnczsNCj4gLSAgICAgICBlbnVtIGhkbWlfY29sb3Jz
cGFjZSBjc3A7DQo+ICAgICAgICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqYXVkaW9fcGRldjsN
Cj4gICAgICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSBhdWRfcGFyYW07DQo+ICAgICAgICAg
Ym9vbCBhdWRpb19lbmFibGU7DQo+IEBAIC0xMDM2LDcgKzEwMjksNiBAQCBzdGF0aWMgaW50IG10
a19oZG1pX291dHB1dF9pbml0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gIHsNCj4gICAgICAg
ICBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSAqYXVkX3BhcmFtID0gJmhkbWktPmF1ZF9wYXJhbTsN
Cj4gDQo+IC0gICAgICAgaGRtaS0+Y3NwID0gSERNSV9DT0xPUlNQQUNFX1JHQjsNCj4gICAgICAg
ICBhdWRfcGFyYW0tPmF1ZF9jb2RlYyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0KPiAg
ICAgICAgIGF1ZF9wYXJhbS0+YXVkX3NhbXBsZV9zaXplID0gSERNSV9BVURJT19TQU1QTEVfU0la
RV8xNjsNCj4gICAgICAgICBhdWRfcGFyYW0tPmF1ZF9pbnB1dF90eXBlID0gSERNSV9BVURfSU5Q
VVRfSTJTOw0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

--__=_Part_Boundary_002_854174920.2119337387
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTEyLTE3JiMzMjthdCYjMzI7MTY6NDMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGUmIzMyO2hkbWlfY29sb3Jz
cGFjZSYjMzI7Y3NwJiMzMjttZW1iZXImIzMyO29mJiMzMjtzdHJ1Y3QmIzMyO210a19oZG1pJiMz
MjtpcyYjMzI7aW5pdGlhbGl6ZWQNCiZndDsmIzMyO29uY2UmIzMyO2J1dCYjMzI7dGhlbiYjMzI7
aXQmIzM5O3MmIzMyO25ldmVyJiMzMjt1c2VkJiMzMjthdCYjMzI7YWxsLg0KJmd0OyYjMzI7UmVt
b3ZlJiMzMjtzYWlkJiMzMjttZW1iZXImIzMyO2FuZCYjMzI7dGhlJiMzMjtvbmx5JiMzMjthc3Np
Z25tZW50JiMzMjt0byYjMzI7aXQmIzMyO2FzJiMzMjthJiMzMjtjbGVhbnVwLg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtBbHNvJiMzMjtyZW1vdmUmIzMyO3RoZSYjMzI7aWJpYXMsJiMzMjtpYmlhc191
cCwmIzMyO21pbl9jbG9jaywmIzMyO21heF9jbG9jaywmIzMyO21pbl9oZGlzcGxheQ0KJmd0OyYj
MzI7YW5kJiMzMjttYXhfdmRpc3BsYXkmIzMyO21lbWJlcnMsJiMzMjthcyYjMzI7dGhvc2UmIzMy
O3dlcmUmIzMyO3JlYWxseSYjMzI7Y29tcGxldGVseSYjMzI7dW51c2VkLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtUaGlzJiMzMjtjb21taXQmIzMyO2JyaW5ncyYjMzI7bm8mIzMyO2Z1bmN0aW9uYWwm
IzMyO2NoYW5nZXMuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVA
bWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMz
MjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsm
IzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMzMjs4JiMzMjst
LS0tLS0tLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7OCYjMzI7
ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7Yzk1YzdiNTU5OThjLi4zZWNk
MGVkNTk4NTEmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMyO0BAJiMzMjstMTYyLDE2JiMzMjsrMTYyLDkmIzMy
O0BAJiMzMjtzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtjbGsmIzMyOypjbGtbTVRLX0hE
TUlfQ0xLX0NPVU5UXTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtzdHJ1Y3QmIzMyO2RybV9kaXNwbGF5X21vZGUmIzMyO21vZGU7DQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Ym9vbCYjMzI7ZHZpX21vZGU7
DQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1MzImIzMyO21p
bl9jbG9jazsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3Uz
MiYjMzI7bWF4X2Nsb2NrOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7dTMyJiMzMjttYXhfaGRpc3BsYXk7DQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjt1MzImIzMyO21heF92ZGlzcGxheTsNCiZndDsmIzMyOy0mIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3UzMiYjMzI7aWJpYXM7DQomZ3Q7JiMzMjstJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1MzImIzMyO2liaWFzX3VwOw0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7cmVn
bWFwJiMzMjsqc3lzX3JlZ21hcDsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtzeXNfb2Zmc2V0Ow0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7cmVnbWFw
JiMzMjsqcmVnczsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O2VudW0mIzMyO2hkbWlfY29sb3JzcGFjZSYjMzI7Y3NwOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMz
MjsqYXVkaW9fcGRldjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtzdHJ1Y3QmIzMyO2hkbWlfYXVkaW9fcGFyYW0mIzMyO2F1ZF9wYXJhbTsNCiZndDsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtib29sJiMzMjthdWRp
b19lbmFibGU7DQomZ3Q7JiMzMjtAQCYjMzI7LTEwMzYsNyYjMzI7KzEwMjksNiYjMzI7QEAmIzMy
O3N0YXRpYyYjMzI7aW50JiMzMjttdGtfaGRtaV9vdXRwdXRfaW5pdChzdHJ1Y3QmIzMyO210a19o
ZG1pJiMzMjsqaGRtaSkNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7aGRtaV9hdWRpb19wYXJhbSYjMzI7
KmF1ZF9wYXJhbSYjMzI7PSYjMzI7JmFtcDtoZG1pLSZndDthdWRfcGFyYW07DQomZ3Q7JiMzMjsN
CiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2Nz
cCYjMzI7PSYjMzI7SERNSV9DT0xPUlNQQUNFX1JHQjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjthdWRfcGFyYW0tJmd0O2F1ZF9jb2RlYyYjMzI7PSYj
MzI7SERNSV9BVURJT19DT0RJTkdfVFlQRV9QQ007DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7YXVkX3BhcmFtLSZndDthdWRfc2FtcGxlX3NpemUmIzMy
Oz0mIzMyO0hETUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7YXVkX3BhcmFtLSZndDthdWRfaW5wdXRfdHlwZSYj
MzI7PSYjMzI7SERNSV9BVURfSU5QVVRfSTJTOw0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDcu
MA0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0
LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWls
IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVw
bHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFu
ZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhl
ciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_854174920.2119337387--

