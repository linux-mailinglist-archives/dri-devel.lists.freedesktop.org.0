Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF95B1C080
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 08:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761610E3A6;
	Wed,  6 Aug 2025 06:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DxqfrN5P";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Lb5W6mS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF96D10E3A6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 06:37:55 +0000 (UTC)
X-UUID: dd8873c8728f11f08871991801538c65-20250806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LGwZJw15cr7NBOYweZ5JRJxyK9Tev4nSHzdhke4qMF8=; 
 b=DxqfrN5PX/4RpG99BJpDDOpCYRJOGMFO3/J9v0D1vdCviOuj5o8yjEUeB4oOPn0z8bNPlEcORCyTAPuv6igEmtH5FnatFDBMD9lNugEzEcp08TucH3TSnaz/cHxxns+XqDW4Mqv5Je9ZaTDwZil5cwis2KA/lEG7W2kcPYhQyiU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:1699ca45-d7a4-4c13-931f-7fff363d7e50, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:a823a350-93b9-417a-b51d-915a29f1620f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dd8873c8728f11f08871991801538c65-20250806
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 196005903; Wed, 06 Aug 2025 14:37:47 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 6 Aug 2025 14:37:45 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 6 Aug 2025 14:37:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cs4hDe1936AvqZctK1XhXZBxhz/IYMfMDeF89+zZeAczizDqkPLfDSHUVqlEtvGSHSGgN0Pyf1aLIcifirZiy2ofTg9BTSpiTpCzxCZ20R9S5E8Wxk2U14qTTnX+Mxp7WIlD8kInHFtIa/P4TeJ8SFhn8XYDiYxhpFQEDJP6YWwAh9z4jOeKi1stKjcdQ1yb3mT2yLsqZKq8QEzQKlaEfGhhyzLXycWxB1wIcT50FBXyVLGTuW5WszSsXfwGZ8idrcHF+aa6T9Q4JRK5YBEL/I3FIJS5mAlIafo1rR5bE3D2yGJryFLVFRzCoy1UEyQ8cr2CmOC3FKgy/yepRLmqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETbk0mvhsNRTl6MWzSyd5yHvGRKDEy5WjTkJqNT84Lc=;
 b=OglWtfBTNgBDQjfRrxihG4Ks4wi0cdqB9JNsQ64JdkRsKLK3Eu+AhgZdzcu+8OHqFwiv9cDaJ3qcqJJaxxzlieM16AZHeLh5DoecvHyr+O1s0hk3dQGNYjAu8o6N/eL5QS7fw6KilTpDlKjv/TeDJEZpphCvfYgfp4Kcw10hsGlxnA6188DSu8oNewqbUKnqr3fa8qIYAnk9KOLEaqMgMt0sCtLlqDIpGdUqWXhvJsQNP4pKb1+TZP9QrdZ+ikptE7ZTCbx3gZ8NheuCpews9Pu2ZfRoUYx5Be4qGhyn1WJwWbQTB15S4rLRNNH6vptlFaZdJonhxtGfvBmeyF2G+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETbk0mvhsNRTl6MWzSyd5yHvGRKDEy5WjTkJqNT84Lc=;
 b=Lb5W6mS72QDgYtJiuYsFxAMvRNEJy1AU0LxgUEsvkZaBAREfrOjuzgBUlGeI2m2bnYqJDi15sJ+ur2NDYl6puOurqDNpzZKonyLlr5a6m34zyQkKDQzFxvbbKR5ycJYyND+dMxISwaMmRY90OYOYCRSka8URWaKQ5NsQbTp0JFE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8646.apcprd03.prod.outlook.com (2603:1096:405:b4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 06:37:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 06:37:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/7] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
Thread-Topic: [PATCH v2 2/7] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
Thread-Index: AQHb/sZy890y7qtL6Ei1hKjl+z1IFLRVO6yA
Date: Wed, 6 Aug 2025 06:37:43 +0000
Message-ID: <a0e1845df41238678d3f5a568ea278ba7b1f0f61.camel@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-3-jay.liu@mediatek.com>
In-Reply-To: <20250727071609.26037-3-jay.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8646:EE_
x-ms-office365-filtering-correlation-id: d3cc9fb4-272f-46e9-11c0-08ddd4b3bfc4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?WERjUWxoTEllZjhFbXdhRldzQ0VBN2sycVN4TUVNaDJXb0V2L2FWR3NkdC9I?=
 =?utf-8?B?RzBjMERFOXZJa3RtbDBWNEJpNGRFT3dHcTJBa3o1L2QyRkowcGpYZ2FDaFlx?=
 =?utf-8?B?YXJhRi9SVkE4dW83WVRTQU1ZdWk0Mm9RL2VnLzZnN3M5SFpXbWZ5NzB6V3dM?=
 =?utf-8?B?YlVDeFpvVjZ6RWZscUFORm9mNi9NSm5KQ2F4TmF2WHRQNXJxYmJ5ajRXc3R3?=
 =?utf-8?B?TjFZbmFMU1BVeWZDdHlHZ0tHWkxIazZvek1IY1pBVE01UkdzUlVBbmp4eXc5?=
 =?utf-8?B?Nzg3WmlCVTN1T2xQaWtVYW1sQWZvVnYzYWRZbkRhU1NjVW14K09RclBPVVZQ?=
 =?utf-8?B?cUI1QkpNR092S1lVYTdiczZGUWR2ejhZUkFRcFVaNVVDeXNWNG9wMkZacHFa?=
 =?utf-8?B?eWp0eHF0UnVlSmRwWGhUZUw2a0JkN3RkRUhhSmFoUWkvaUFLcVA5SEJPaGNr?=
 =?utf-8?B?NldKSjRJKzYzSGhjSTdoM2M4cWJPaGwzNWVMYTNqNSt1QXZacXV5a3MzU0Ji?=
 =?utf-8?B?YkxVdHJDV2luVWRJais3cFR0d2cwVEJrN3Z4ODE5QVdqdVRvV0ZkTDFzYm9z?=
 =?utf-8?B?YnY3TW5uVDZxMW03RFBYR3NRZnVlY2dDWVJTZ09nSFNFbjZpcjVBeXR6UkR3?=
 =?utf-8?B?K2pUZm5ZT09hVUJQbjZzQ2I0NDBjcnh2UDhvS2d6aUJyVGVnc2ZsbC9TWTBh?=
 =?utf-8?B?U1Q3K1Avay9STUpYaXgvL1I4RHpScmwyTGZOb3BTcE11QTIySEYxMzJMRUVG?=
 =?utf-8?B?V2FRZ1J2VStRc0JOL3FQdGwxL0oxNTBLZTRKUm0vdXpqM2EwNFNDNVk0azF0?=
 =?utf-8?B?ZGVjaEI2TU1WQVlrMWhBSndsWVFZNUZpaWtzMkVEaEJTc3FhZEZRQ1dyc3Ev?=
 =?utf-8?B?ak9ITHF4VG5UWFJaR1J6Z1MweHVaOWUwamxLb1pHbU1XcEkvM09aQzA4U3ZB?=
 =?utf-8?B?UWJ0bXdCN0RlSTQ1Nk9Uay9md2dqcnM2cFpaL3JZZk5ncTlTY2hjVmhTVHd2?=
 =?utf-8?B?Z1BvSHdiUHYyS0orYkwxTi9yWVdzSDRHTEZZREhsVUo0MzFOeG1PVU1xKzZw?=
 =?utf-8?B?RGY0c01rUHZ0Z2wxUm1zME5ia0c1UExUYjRTcTk2YTdkRU9wZmpjY2Qxampa?=
 =?utf-8?B?VitoaWU4NVZoZmZ3d0VMMFRJNGZRY3FmRk1vZkhBMDN1U0VtbFR3RFZvLzNP?=
 =?utf-8?B?VHJjUUpSL3FST1Z3eGlrT2dyV1ZMc1lyMFRGaUJ1aDEzSFVEVDF1SjRobFRQ?=
 =?utf-8?B?eG0vaEVLQVAzU3pRVUpxQi9pZHBHNVExRWFhMjRqcXVvSVJsc0Z1Z1ZMWkRT?=
 =?utf-8?B?OGhTT2R4MCttSy96dVAvaEcvNEgxdzhXRzgzV3BuMFoybVdVU0VCRVhKSDE2?=
 =?utf-8?B?bTExU1RQZDh5OTR1RTJxNkRrSEZHckIyVXI0UERpaEpMNCtRcjBlUkJSYmJn?=
 =?utf-8?B?b2pxbTdydUpGM0IwNW9VSDEvWlJOdHllc3BYK1lGdjNyb3J1VXVqdnRUMFlC?=
 =?utf-8?B?UlkzcHk0L1VOTS9SQXB5bHB5TFhmSmFvcVpZcEEyc1ZGMVdobkEyM2N1WGdo?=
 =?utf-8?B?ZzIxa2c4RW9DK0toUU84bkplcTdseEJNbklVOEdqMEtQMUpWV0E1aXpwRmFs?=
 =?utf-8?B?YytBRDdhc0M2MTFFbE1TZWtTRnBXS0ZpY3hLSEN3K0FLVm83aVB2UStEVzNw?=
 =?utf-8?B?TmxIcDlKTVJtdHF6Z1lJVXlBQ2FBSEVqdlJMYm1FZlRqVlIzdnBUREVPUWVO?=
 =?utf-8?B?Y2ZRY0dpOGE4QWx3dXlINHc3c21sSXk0VWdMRUhLY1RleUgvanRBeDNicTJ0?=
 =?utf-8?B?aUMyVXo1SUVTRTRWdUJ3UmlnUGdPSnlpc2k4L2FCQUd6emJkY2JrL0c3QXBp?=
 =?utf-8?B?YWIxUWdXdnZFWE9zMmsvdHBCOGlBaDE4d2x1c0ptYlloS0dlazI5VGxPMTZ5?=
 =?utf-8?B?dE9OWkxMZmRSZTNBcG0yLytJb1ovUkRNQ0FBelVmQXV2bncybktaTEtuSjZK?=
 =?utf-8?Q?j6Gh5payZlZAqNuQlIcD9Yn9IGGTxc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVRhcEtUVTNLZk9hZy8yejdzN01DZzJTbGF3RVFFaGVtMktrTGlVNHhxU3Bh?=
 =?utf-8?B?OGdQam9ybElCeC81WE9mNzhMdEYvWi9GR3BaOE5YWFBjTERhOUZRY0lFMHNn?=
 =?utf-8?B?NFpsYmsyMjh4UVgyUGhkeWdkQkN1TFFXcTZLM24zNkgzNnJRZUlUTWtGZTVU?=
 =?utf-8?B?ZkZCVmxqKzEzZ1RadmZBWjdlaHJUR01nSXV1TURPMGpaYzRGclpSenRzQnVo?=
 =?utf-8?B?MHoveDByVVA4Q0srSnJ4b2YyNmFCMTc3aFpOMWxuZkwvcmlWcE02QlRFaVdZ?=
 =?utf-8?B?Y2g0OVdxK2xhN1gyQVJQV3hXVDJDVjJPczk3L2tMVDJFaHB3L2JoQ09COWxE?=
 =?utf-8?B?WFlmOHdZY1JYSHM5LzBRUFErbmtxWUV5SnlEd2hadHVocGFUUlpubnpxY0Nu?=
 =?utf-8?B?U29NMEtsZVdhckdKODNWUDdkVUdqbGNuTkg1NW1QTG0xamU4T0VhQUN0bTBP?=
 =?utf-8?B?cXhUZmxybDEycTY4WTJBSmFyczdKNmxvWUdHazYrWnN3QlpBc3FadFJOc3Er?=
 =?utf-8?B?QjhnZ2JoN1A0S2k5ZFRoUHM0Uml3a1p2WTlFZUZDK2FpcFZMSlk3ZUlmOVhB?=
 =?utf-8?B?Nnd2RTQ1Uk5NaDlma09laVZkZ2ZaOC9PYmloSHBjNWl0YjhYNmIxbFFoOEd3?=
 =?utf-8?B?Z2NZYmtRVnZzbTJWc0FJNjNwTFNDRk51SjdWeE9OYytESE5sbm1MQ3Y5Z3lP?=
 =?utf-8?B?QmpsZ1FKQTBuTy9BR240Yzkwb25BT2FRV0FHcldVK0hKSG9nYUNDRWZZbm1x?=
 =?utf-8?B?M0tPdncwZmFTczRoWWxtSnR6a2FxZjlEc1R5bGxvSnhSVEJidTFIZTVZZ1Rv?=
 =?utf-8?B?dWRYcytUazlFYWI4KzFobnpRWWsyVjFtZldGQ0RvRk1NU3RkVVR5a1lpa0F0?=
 =?utf-8?B?aDg0cGVQcm1XVFNCSllRbWh0WExremwyT3Jlbll4LzVna0psdDFXWDVjVnZ6?=
 =?utf-8?B?MmlYU0NmTDFBWnBzVkJ0RHdTN0RyU0k1ZTFwR3N2T2lPZzAyWTUzd0JxbHE1?=
 =?utf-8?B?b2Q4NjZFMk5aNFIrL3NWdUJPUVFiT1NPdnFBbVdGakx1NS80NkMwTW9GYlYw?=
 =?utf-8?B?c3dBeng2WDY4T3dBWnBOeGV0eS9PSExnU3ovQ05NUjdoTWNvVlFQTE54OXpQ?=
 =?utf-8?B?Z2kyUU1kSGhwakRJRit0bHVhSlFlUkNiaVRCVEJhTTV3bU9nNmdQNGFUK3FS?=
 =?utf-8?B?ZFFQVWZ0L2IzdzMxbnJKTlR4NFc3WEsvZDF1RXdONXphVnhSdDhTQ3c0M0JT?=
 =?utf-8?B?bTd0MG02Q1ZtK3d6RW5LTkt4NWx2MG9hNENjWVVQTGpDT1lxRUdEbUFqcDkr?=
 =?utf-8?B?SXc3bWVGTXRtdzk5YThhNjFwVUZtYUpZaHZsWHhRYTJIYm1HbHZsdi9kaFBz?=
 =?utf-8?B?VjhnUmFFZDJaNVRiNjZkWlFTQnArMHovZE0rcUVkb1p4cHlBSXlNRkRneU1T?=
 =?utf-8?B?dXlCRlpwZERSRVdyRjBwM1JUL2F2cU5XWkNYcERHUm9Ja0ZzN0h4NEM4OWpp?=
 =?utf-8?B?d0EvNTV0MytUUEZ3a0gwMzU2aktoY0VpUGI3ckV3YTdIbTBQVGFiMjMxY2Jw?=
 =?utf-8?B?Vk5kUUJqQ1E2VjVsTUNDcXB4bnoxVnNGaW9nalNtaEx1MGoxeDliamc1TTZR?=
 =?utf-8?B?WTMzWXpnRFdKMGEyYnJOdXFFUXBRdzQ2ejlPVEtWaUxVaytkMjJraGtOaFRZ?=
 =?utf-8?B?dFpSMFdtRUJjSzBuczU3VTBNTlZFUXJPTytiL3kvWFl3Y2hERFRsa2c4dnJV?=
 =?utf-8?B?VjdrU0x1NjBvRm1lc1prSzNZVWVHandmMkZKYUcveTQ2VzJsR05KYzRKaU5Z?=
 =?utf-8?B?Q2FnK2tCdHlVWUZvd0c4cjRwaXp5b2VUemlaOTRVODVQOFE5QVQ2dHdtUHVJ?=
 =?utf-8?B?YjhLZCthSXRIa0RhQmVNQmF2YjBzTjBYU2VTMG5GUWIzVlVnNU9HUFVYL3BT?=
 =?utf-8?B?TlI5RVpNazVVc0w0QUthdi9Lb0lEbUZ2ZDhKQ3J3c00xRzBEemxNcmVjNXNN?=
 =?utf-8?B?YW1VaEpsSCtYNmtON3JuU290N3ppVEprbTAreERkMi9NVXdPR25IUThEVGhp?=
 =?utf-8?B?amxJWkRvUzZzWUYxNVZBRU9IUVFsbXpCaWx2RjZPZXlLQmxJeVREejU3TWRQ?=
 =?utf-8?Q?Jflj1SC1wyBOxfugh30+MXB2a?=
Content-ID: <9A0CE42E155D1A4097E4A2E231DE8D9E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cc9fb4-272f-46e9-11c0-08ddd4b3bfc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 06:37:43.7830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TiTsMcZeM2JqjeCm9YEJtLYx7DbB5ItxK/uzOB082bGFE9n3xK/GkXDqRAX5OD8s3rXuG+PL66ky1vvAKoogpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8646
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1511316718.169338155"
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

--__=_Part_Boundary_004_1511316718.169338155
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDI1LTA3LTI3IGF0IDE1OjE1ICswODAwLCBKYXkgTGl1IHdyb3RlOg0KPiBpZiBt
YXRyaXhiaXQgaXMgMTEsDQo+IFRoZSByYW5nZSBvZiBjb2xvciBtYXRyaXggaXMgZnJvbSAwIHRv
IChCSVQoMTIpIC0gMSkuDQo+IFZhbHVlcyBmcm9tIDAgdG8gKEJJVCgxMSkgLSAxKSByZXByZXNl
bnQgcG9zaXRpdmUgbnVtYmVycywNCj4gdmFsdWVzIGZyb20gQklUKDExKSB0byAoQklUKDEyKSAt
IDEpIHJlcHJlc2VudCBuZWdhdGl2ZSBudW1iZXJzLg0KPiBGb3IgZXhhbXBsZSwgLTEgbmVlZCBj
b252ZXJ0ZWQgdG8gODE5MS4NCj4gc28gY29udmVydCBTMzEuMzIgdG8gSFcgUTIuMTEgZm9ybWF0
IGJ5IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24sDQo+IGFuZCBzZXQgaW50X2JpdHMgdG8g
Mi4NCg0KWW91IGNoYW5nZSB0aGUgYmVoYXZpb3Igb2YgTVQ4MTgzIENDT1JSIGFuZCBNVDgxOTIg
Q0NPUlIuDQpUaGVzZSB0d28gU29DIGhhcyB3b3JrIGZvciBhIGxvbmcgdGltZS4NCkRvZXMgYm90
aCBTb0MgcmVhbGx5IGhhdmUgYnVnPw0KDQpJbiBjb21tZW50IGJlbG93LCBpdCBzaG93cyB0aGF0
IEhXIFMxLm4gZm9ybWF0Lg0KVGhlIHBhdGNoIHNlbmRlciBoYXMgbXVjaCBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgaGFyZHdhcmUgaW5mb3JtYXRpb24uDQpXb3VsZCB0aGV5IG1ha2UgbWlzdGFrZT8N
CklmIG9ubHkgTVQ4MTk2IENDT1JSIGhhcyB0aGUgZm9ybWF0IHFtX24sIHVzZSBwcml2YXRlIGRh
dGEgdG8gZGlzdGluZ3Vpc2ggdGhlIGJlaGF2aW9yLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4g
Rml4ZXM6IDczOGVkNDE1NmZiYSAoImRybS9tZWRpYXRlazogQWRkIG1hdHJpeF9iaXRzIHByaXZh
dGUgZGF0YSBmb3IgY2NvcnIiKQ0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogSmF5IExpdSA8amF5LmxpdUBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IDIwMjIwMzE1MTUyNTAzIGNyZWF0ZWQgPGpheS5saXVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jIHwgMjQgKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9jY29yci5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Njb3Jy
LmMNCj4gaW5kZXggODViYTEwOWQ2MzgzLi5iMDk3YzIwODc3ZjMgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jDQo+IEBAIC04MCwyNyArODAsNiBAQCB2
b2lkIG10a19jY29ycl9zdG9wKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAl3cml0ZWxfcmVsYXhl
ZCgweDAsIGNjb3JyLT5yZWdzICsgRElTUF9DQ09SUl9FTik7DQo+ICB9DQo+ICANCj4gLS8qIENv
bnZlcnRzIGEgRFJNIFMzMS4zMiB2YWx1ZSB0byB0aGUgSFcgUzEubiBmb3JtYXQuICovDQo+IC1z
dGF0aWMgdTE2IG10a19jdG1fczMxXzMyX3RvX3MxX24odTY0IGluLCB1MzIgbikNCj4gLXsNCj4g
LQl1MTYgcjsNCj4gLQ0KPiAtCS8qIFNpZ24gYml0LiAqLw0KPiAtCXIgPSBpbiAmIEJJVF9VTEwo
NjMpID8gQklUKG4gKyAxKSA6IDA7DQo+IC0NCj4gLQlpZiAoKGluICYgR0VOTUFTS19VTEwoNjIs
IDMzKSkgPiAwKSB7DQo+IC0JCS8qIGlkZW50aXR5IHZhbHVlIDB4MTAwMDAwMDAwIC0+IDB4NDAw
KG10ODE4MyksICovDQo+IC0JCS8qIGlkZW50aXR5IHZhbHVlIDB4MTAwMDAwMDAwIC0+IDB4ODAw
KG10ODE5MiksICovDQo+IC0JCS8qIGlmIGJpZ2dlciB0aGlzLCBzZXQgaXQgdG8gbWF4IDB4N2Zm
LiAqLw0KPiAtCQlyIHw9IEdFTk1BU0sobiwgMCk7DQo+IC0JfSBlbHNlIHsNCj4gLQkJLyogdGFr
ZSB0aGUgbisxIG1vc3QgaW1wb3J0YW50IGJpdHMuICovDQo+IC0JCXIgfD0gKGluID4+ICgzMiAt
IG4pKSAmIEdFTk1BU0sobiwgMCk7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIHI7DQo+IC19DQo+
IC0NCj4gIGJvb2wgbXRrX2Njb3JyX2N0bV9zZXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
ZHJtX2NydGNfc3RhdGUgKnN0YXRlKQ0KPiAgew0KPiAgCXN0cnVjdCBtdGtfZGlzcF9jY29yciAq
Y2NvcnIgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gQEAgLTEwOSw2ICs4OCw3IEBAIGJvb2wg
bXRrX2Njb3JyX2N0bV9zZXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2NydGNfc3Rh
dGUgKnN0YXRlKQ0KPiAgCWNvbnN0IHU2NCAqaW5wdXQ7DQo+ICAJdWludDE2X3QgY29lZmZzWzld
ID0geyAwIH07DQo+ICAJaW50IGk7DQo+ICsJaW50IGludF9iaXRzID0gMjsNCj4gIAlzdHJ1Y3Qg
Y21kcV9wa3QgKmNtZHFfcGt0ID0gTlVMTDsNCj4gIAl1MzIgbWF0cml4X2JpdHMgPSBjY29yci0+
ZGF0YS0+bWF0cml4X2JpdHM7DQo+ICANCj4gQEAgLTExOSw3ICs5OSw3IEBAIGJvb2wgbXRrX2Nj
b3JyX2N0bV9zZXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0
YXRlKQ0KPiAgCWlucHV0ID0gY3RtLT5tYXRyaXg7DQo+ICANCj4gIAlmb3IgKGkgPSAwOyBpIDwg
QVJSQVlfU0laRShjb2VmZnMpOyBpKyspDQo+IC0JCWNvZWZmc1tpXSA9IG10a19jdG1fczMxXzMy
X3RvX3MxX24oaW5wdXRbaV0sIG1hdHJpeF9iaXRzKTsNCj4gKwkJY29lZmZzW2ldID0gZHJtX2Nv
bG9yX2N0bV9zMzFfMzJfdG9fcW1fbihpbnB1dFtpXSwgaW50X2JpdHMsIG1hdHJpeF9iaXRzKTsN
Cj4gIA0KPiAgCW10a19kZHBfd3JpdGUoY21kcV9wa3QsIGNvZWZmc1swXSA8PCAxNiB8IGNvZWZm
c1sxXSwNCj4gIAkJICAgICAgJmNjb3JyLT5jbWRxX3JlZywgY2NvcnItPnJlZ3MsIERJU1BfQ0NP
UlJfQ09FRl8wKTsNCg0K

--__=_Part_Boundary_004_1511316718.169338155
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1N1biwmIzMyOzIwMjUtMDctMjcmIzMyO2F0
JiMzMjsxNToxNSYjMzI7KzA4MDAsJiMzMjtKYXkmIzMyO0xpdSYjMzI7d3JvdGU6DQomZ3Q7JiMz
MjtpZiYjMzI7bWF0cml4Yml0JiMzMjtpcyYjMzI7MTEsDQomZ3Q7JiMzMjtUaGUmIzMyO3Jhbmdl
JiMzMjtvZiYjMzI7Y29sb3ImIzMyO21hdHJpeCYjMzI7aXMmIzMyO2Zyb20mIzMyOzAmIzMyO3Rv
JiMzMjsoQklUKDEyKSYjMzI7LSYjMzI7MSkuDQomZ3Q7JiMzMjtWYWx1ZXMmIzMyO2Zyb20mIzMy
OzAmIzMyO3RvJiMzMjsoQklUKDExKSYjMzI7LSYjMzI7MSkmIzMyO3JlcHJlc2VudCYjMzI7cG9z
aXRpdmUmIzMyO251bWJlcnMsDQomZ3Q7JiMzMjt2YWx1ZXMmIzMyO2Zyb20mIzMyO0JJVCgxMSkm
IzMyO3RvJiMzMjsoQklUKDEyKSYjMzI7LSYjMzI7MSkmIzMyO3JlcHJlc2VudCYjMzI7bmVnYXRp
dmUmIzMyO251bWJlcnMuDQomZ3Q7JiMzMjtGb3ImIzMyO2V4YW1wbGUsJiMzMjstMSYjMzI7bmVl
ZCYjMzI7Y29udmVydGVkJiMzMjt0byYjMzI7ODE5MS4NCiZndDsmIzMyO3NvJiMzMjtjb252ZXJ0
JiMzMjtTMzEuMzImIzMyO3RvJiMzMjtIVyYjMzI7UTIuMTEmIzMyO2Zvcm1hdCYjMzI7YnkmIzMy
O2RybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24sDQomZ3Q7JiMzMjthbmQmIzMyO3NldCYjMzI7
aW50X2JpdHMmIzMyO3RvJiMzMjsyLg0KDQpZb3UmIzMyO2NoYW5nZSYjMzI7dGhlJiMzMjtiZWhh
dmlvciYjMzI7b2YmIzMyO01UODE4MyYjMzI7Q0NPUlImIzMyO2FuZCYjMzI7TVQ4MTkyJiMzMjtD
Q09SUi4NClRoZXNlJiMzMjt0d28mIzMyO1NvQyYjMzI7aGFzJiMzMjt3b3JrJiMzMjtmb3ImIzMy
O2EmIzMyO2xvbmcmIzMyO3RpbWUuDQpEb2VzJiMzMjtib3RoJiMzMjtTb0MmIzMyO3JlYWxseSYj
MzI7aGF2ZSYjMzI7YnVnJiM2MzsNCg0KSW4mIzMyO2NvbW1lbnQmIzMyO2JlbG93LCYjMzI7aXQm
IzMyO3Nob3dzJiMzMjt0aGF0JiMzMjtIVyYjMzI7UzEubiYjMzI7Zm9ybWF0Lg0KVGhlJiMzMjtw
YXRjaCYjMzI7c2VuZGVyJiMzMjtoYXMmIzMyO211Y2gmIzMyO2luZm9ybWF0aW9uJiMzMjthYm91
dCYjMzI7dGhlJiMzMjtoYXJkd2FyZSYjMzI7aW5mb3JtYXRpb24uDQpXb3VsZCYjMzI7dGhleSYj
MzI7bWFrZSYjMzI7bWlzdGFrZSYjNjM7DQpJZiYjMzI7b25seSYjMzI7TVQ4MTk2JiMzMjtDQ09S
UiYjMzI7aGFzJiMzMjt0aGUmIzMyO2Zvcm1hdCYjMzI7cW1fbiwmIzMyO3VzZSYjMzI7cHJpdmF0
ZSYjMzI7ZGF0YSYjMzI7dG8mIzMyO2Rpc3Rpbmd1aXNoJiMzMjt0aGUmIzMyO2JlaGF2aW9yLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczomIzMyOzczOGVkNDE1
NmZiYSYjMzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7bWF0cml4X2JpdHMmIzMy
O3ByaXZhdGUmIzMyO2RhdGEmIzMyO2ZvciYjMzI7Y2NvcnImcXVvdDspDQomZ3Q7JiMzMjtSZXZp
ZXdlZC1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDth
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjtTaWdu
ZWQtb2ZmLWJ5OiYjMzI7SmF5JiMzMjtMaXUmIzMyOyZsdDtqYXkubGl1QG1lZGlhdGVrLmNvbSZn
dDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjsyMDIyMDMxNTE1MjUwMyYjMzI7Y3JlYXRl
ZCYjMzI7Jmx0O2pheS5saXVAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMz
MjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jJiMzMjt8JiMz
MjsyNCYjMzI7KystLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7Zmls
ZSYjMzI7Y2hhbmdlZCwmIzMyOzImIzMyO2luc2VydGlvbnMoKyksJiMzMjsyMiYjMzI7ZGVsZXRp
b25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9jY29yci5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7ODViYTEwOWQ2Mzgz
Li5iMDk3YzIwODc3ZjMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Njb3JyLmMNCiZndDsmIzMyO0BAJiMzMjstODAs
MjcmIzMyOys4MCw2JiMzMjtAQCYjMzI7dm9pZCYjMzI7bXRrX2Njb3JyX3N0b3Aoc3RydWN0JiMz
MjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMzMjsmIzMyO3dyaXRlbF9yZWxheGVkKDB4MCwmIzMy
O2Njb3JyLSZndDtyZWdzJiMzMjsrJiMzMjtESVNQX0NDT1JSX0VOKTsNCiZndDsmIzMyOyYjMzI7
fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy0vKiYjMzI7Q29udmVydHMmIzMyO2EmIzMyO0RS
TSYjMzI7UzMxLjMyJiMzMjt2YWx1ZSYjMzI7dG8mIzMyO3RoZSYjMzI7SFcmIzMyO1MxLm4mIzMy
O2Zvcm1hdC4mIzMyOyovDQomZ3Q7JiMzMjstc3RhdGljJiMzMjt1MTYmIzMyO210a19jdG1fczMx
XzMyX3RvX3MxX24odTY0JiMzMjtpbiwmIzMyO3UzMiYjMzI7bikNCiZndDsmIzMyOy17DQomZ3Q7
JiMzMjstdTE2JiMzMjtyOw0KJmd0OyYjMzI7LQ0KJmd0OyYjMzI7LS8qJiMzMjtTaWduJiMzMjti
aXQuJiMzMjsqLw0KJmd0OyYjMzI7LXImIzMyOz0mIzMyO2luJiMzMjsmYW1wOyYjMzI7QklUX1VM
TCg2MykmIzMyOyYjNjM7JiMzMjtCSVQobiYjMzI7KyYjMzI7MSkmIzMyOzomIzMyOzA7DQomZ3Q7
JiMzMjstDQomZ3Q7JiMzMjstaWYmIzMyOygoaW4mIzMyOyZhbXA7JiMzMjtHRU5NQVNLX1VMTCg2
MiwmIzMyOzMzKSkmIzMyOyZndDsmIzMyOzApJiMzMjt7DQomZ3Q7JiMzMjstLyomIzMyO2lkZW50
aXR5JiMzMjt2YWx1ZSYjMzI7MHgxMDAwMDAwMDAmIzMyOy0mZ3Q7JiMzMjsweDQwMChtdDgxODMp
LCYjMzI7Ki8NCiZndDsmIzMyOy0vKiYjMzI7aWRlbnRpdHkmIzMyO3ZhbHVlJiMzMjsweDEwMDAw
MDAwMCYjMzI7LSZndDsmIzMyOzB4ODAwKG10ODE5MiksJiMzMjsqLw0KJmd0OyYjMzI7LS8qJiMz
MjtpZiYjMzI7YmlnZ2VyJiMzMjt0aGlzLCYjMzI7c2V0JiMzMjtpdCYjMzI7dG8mIzMyO21heCYj
MzI7MHg3ZmYuJiMzMjsqLw0KJmd0OyYjMzI7LXImIzMyO3w9JiMzMjtHRU5NQVNLKG4sJiMzMjsw
KTsNCiZndDsmIzMyOy19JiMzMjtlbHNlJiMzMjt7DQomZ3Q7JiMzMjstLyomIzMyO3Rha2UmIzMy
O3RoZSYjMzI7bisxJiMzMjttb3N0JiMzMjtpbXBvcnRhbnQmIzMyO2JpdHMuJiMzMjsqLw0KJmd0
OyYjMzI7LXImIzMyO3w9JiMzMjsoaW4mIzMyOyZndDsmZ3Q7JiMzMjsoMzImIzMyOy0mIzMyO24p
KSYjMzI7JmFtcDsmIzMyO0dFTk1BU0sobiwmIzMyOzApOw0KJmd0OyYjMzI7LX0NCiZndDsmIzMy
Oy0NCiZndDsmIzMyOy1yZXR1cm4mIzMyO3I7DQomZ3Q7JiMzMjstfQ0KJmd0OyYjMzI7LQ0KJmd0
OyYjMzI7JiMzMjtib29sJiMzMjttdGtfY2NvcnJfY3RtX3NldChzdHJ1Y3QmIzMyO2RldmljZSYj
MzI7KmRldiwmIzMyO3N0cnVjdCYjMzI7ZHJtX2NydGNfc3RhdGUmIzMyOypzdGF0ZSkNCiZndDsm
IzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19kaXNwX2Njb3JyJiMzMjsq
Y2NvcnImIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7QEAmIzMyOy0x
MDksNiYjMzI7Kzg4LDcmIzMyO0BAJiMzMjtib29sJiMzMjttdGtfY2NvcnJfY3RtX3NldChzdHJ1
Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3N0cnVjdCYjMzI7ZHJtX2NydGNfc3RhdGUmIzMy
OypzdGF0ZSkNCiZndDsmIzMyOyYjMzI7Y29uc3QmIzMyO3U2NCYjMzI7KmlucHV0Ow0KJmd0OyYj
MzI7JiMzMjt1aW50MTZfdCYjMzI7Y29lZmZzWzldJiMzMjs9JiMzMjt7JiMzMjswJiMzMjt9Ow0K
Jmd0OyYjMzI7JiMzMjtpbnQmIzMyO2k7DQomZ3Q7JiMzMjsraW50JiMzMjtpbnRfYml0cyYjMzI7
PSYjMzI7MjsNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KmNtZHFfcGt0
JiMzMjs9JiMzMjtOVUxMOw0KJmd0OyYjMzI7JiMzMjt1MzImIzMyO21hdHJpeF9iaXRzJiMzMjs9
JiMzMjtjY29yci0mZ3Q7ZGF0YS0mZ3Q7bWF0cml4X2JpdHM7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0
OyYjMzI7QEAmIzMyOy0xMTksNyYjMzI7Kzk5LDcmIzMyO0BAJiMzMjtib29sJiMzMjttdGtfY2Nv
cnJfY3RtX3NldChzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3N0cnVjdCYjMzI7ZHJt
X2NydGNfc3RhdGUmIzMyOypzdGF0ZSkNCiZndDsmIzMyOyYjMzI7aW5wdXQmIzMyOz0mIzMyO2N0
bS0mZ3Q7bWF0cml4Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7Zm9yJiMzMjsoaSYj
MzI7PSYjMzI7MDsmIzMyO2kmIzMyOyZsdDsmIzMyO0FSUkFZX1NJWkUoY29lZmZzKTsmIzMyO2kr
KykNCiZndDsmIzMyOy1jb2VmZnNbaV0mIzMyOz0mIzMyO210a19jdG1fczMxXzMyX3RvX3MxX24o
aW5wdXRbaV0sJiMzMjttYXRyaXhfYml0cyk7DQomZ3Q7JiMzMjsrY29lZmZzW2ldJiMzMjs9JiMz
Mjtkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKGlucHV0W2ldLCYjMzI7aW50X2JpdHMsJiMz
MjttYXRyaXhfYml0cyk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dy
aXRlKGNtZHFfcGt0LCYjMzI7Y29lZmZzWzBdJiMzMjsmbHQ7Jmx0OyYjMzI7MTYmIzMyO3wmIzMy
O2NvZWZmc1sxXSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JmFtcDtjY29yci0mZ3Q7Y21kcV9yZWcsJiMzMjtjY29yci0mZ3Q7cmVncywmIzMyO0RJU1BfQ0NP
UlJfQ09FRl8wKTsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQt
LT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90
aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4g
dGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUg
Y29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVt
cHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQg
dG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55
IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcg
b3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBi
eSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkg
DQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRo
aXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_1511316718.169338155--

