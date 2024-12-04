Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6379E36D0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1541F10E4A2;
	Wed,  4 Dec 2024 09:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OkGNhbXH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aNba30XG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B835710E4A2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:41:16 +0000 (UTC)
X-UUID: e3fe5452b22311efbd192953cf12861f-20241204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PYeCiVCThyQguUKu8cBoH17VTf/1xF2NcA/PgjxUKQ0=; 
 b=OkGNhbXHgFshAQvbj1Ch8qH6GCD7MpJgSSwtqUGKNlwG/PQ4IJENahPoF7647WZbAhbP7ew2XK1k62IurZEfKxJO+g4Fi4gnxnD1ZNJJP8PtReqxgI5jKCrJoDPY8Au04wKO6Lbs/X1JaHB2MTc8z0x+KCeF8uOY/n84qOFcuDU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:e0464737-f5fd-43a1-9388-300c6ac6b36d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:53e2bae0-1fe5-4c4a-bdf3-d07f9790da32,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e3fe5452b22311efbd192953cf12861f-20241204
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1459249531; Wed, 04 Dec 2024 17:41:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Dec 2024 17:41:07 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Dec 2024 17:41:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLgHRlnoRISU/KQyrk1JT4BBuXgcORuaCaGQJqo6bQ0TrxeGEdYHjOcI+58zj7P0FWLpDYbareOrMAbGWIwVXWMnp+S3PYJKA2SpeQ6P2bu8bCRS1k+ov20FjEYIHlWpho9yL46pLX4KjPvLWHVTHzc+/Fpp2If0wyhyle6kuouEd+nX4PLRPg03M/qeHgEdFkHW7rmNFhOQplalnrkF/QuQubPLSOlkn2BLaVeq3P505eCfeVliZFXvh2qU2HZn2hctXE0DzR8e2gCmsGHv88EgRTBu0yyz4nyQB0Ikp6GO/Eo0FB5NSjMGZ4f7qf6HhEbVER9IUSb39W4lRcWLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56N+LPG9Lq7LpgGxGPaps5fWlAdk7b5xOvZpfe3jOcM=;
 b=pT7yNXZvKEdchC5PNUL0lu7Lo6zaeOSl6aHv+vvlD0s3EaqULKs9l9u/UNXtq6Q0RCm43A2dfT668veQGPGbRLAUCTMJF6fVs6NkAlBskSN6vBv+6VUByz9V4rLOYvjGOqW0ZAylpf4lSE4cd1WVlBjfPFOeGXmbx/IWxP8VU9GK9cpE37dof4YAPpVVSiRUv1N71O3CHm+X2tRo7ARcGLj+HT7Csj/j4uNffG5+EQ+g+9uVSjLyPw+of95SvaBpzVTNjz9gMLP1t5gq4yY1def5pZ4dpjg7peBlxIg88bMF7twixgUopej3QstrqBMn1dpkYzIooQKGaqwXLHQcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56N+LPG9Lq7LpgGxGPaps5fWlAdk7b5xOvZpfe3jOcM=;
 b=aNba30XGrG43tRcUzfBpz1c3ArTPQGedFYlLp39stU0kHad5fIM1xGIHhMtQxQe+isnILi+MSov4HNLe2TIg0Lvm3gpJxwnhMrq5hM9fEKbNIAM6/tUQl0iKRjy9J5Bms7rnFk6aX5SJsWHd4kctkJLFTscKxVMQmD19sDG1kT4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7241.apcprd03.prod.outlook.com (2603:1096:400:289::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Wed, 4 Dec
 2024 09:41:05 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Wed, 4 Dec 2024
 09:41:05 +0000
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
Thread-Index: AQHbO0pF3Zp6UXdpSEmkHbI6wNkmT7LV6rAA
Date: Wed, 4 Dec 2024 09:41:05 +0000
Message-ID: <de8b0cb760cd0586014426536138f79fe5dd1ed8.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7241:EE_
x-ms-office365-filtering-correlation-id: 1d5a6527-84f4-471a-351a-08dd1447c616
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WldoNjVpVTZwRHJTN0I2L0NJUy9Eam5YanQ0Yzgzd3JKa3FINnNtSEZDY0Vt?=
 =?utf-8?B?K3ZoOUNpanExSXQycDc5SDFadjdqZFNWYWF3TFd4dituWjBKbkQrTTRML3RQ?=
 =?utf-8?B?dWNya2dDMm50emFpcm1JeUJyQXFVaUVLMUw0Qkpsd2NEODlBSDlEZTkwdHU3?=
 =?utf-8?B?ZmFIaVhESVN1b0o4WHZ6c2tMVEk4TTZqaStuZ2hzU0lsbU9XdXJqMmpqQTVk?=
 =?utf-8?B?cHN1RXVJSTllZDVUNmRCREJoU3dtOUxscTR1TkMyKzY4VmdqRmpMaXNBS1lV?=
 =?utf-8?B?ZlpTNHhaRDhaZ09iajZZQyszU3ZWam55SjJVRFRBb0NTSmNxbXdtRzI0S1Uv?=
 =?utf-8?B?d3JBMWRaU1FHaDZqNGc2bTZwL3YvUksxWFprNnFZaytDODl3ZnVZMVBHVmgw?=
 =?utf-8?B?ako1NTVPYmdCeWxxMWZYY0g2djRUUW44aWd5Q0FXT3hQckFnL0haOVcvMVow?=
 =?utf-8?B?SE0zVDRuZjRIS0xNMTlhczg2TS9XdjVvQm50VllDQVgxMUg5NnFVVExZT2NX?=
 =?utf-8?B?TVl6VkhEVGlVaFBHSlFlK0VXUnl2QlROU1I2cSt0NldUVU9KOXZESG1MYmdT?=
 =?utf-8?B?cCtmeFppa0RkMFhKM0NvSFVaeHlwWEo1UEY5N3pIYk53U0xHVUY4MVhnby9Q?=
 =?utf-8?B?NGRjbVlTbFN4bDN2NEV5bktpYml1LzJBcVN2NlNvNFJ0eVdrbW9tcW1Ja1cw?=
 =?utf-8?B?Z2lUakRjMm5rMWk2T0hDNU4yUnp3SU5vQmZzODl4bmlFTlAwK1kxVUlUeXhC?=
 =?utf-8?B?NHFXMjdrcXVmUkJBK2lQcGV3NDhDMm5aa3pxbUhpMENmdW9QNmZMT1FEMVFC?=
 =?utf-8?B?elF4akZMbm5xMm1NeUNIRVBxOFo1aHY0WkRydGdkaUU4aElhRCtZc2pWdk9J?=
 =?utf-8?B?TmpjV2J0cjFFR1M2WVROQ01rK1laY1kxRUJEb1pBNTdwdmJ3aEdLVU1vTVdh?=
 =?utf-8?B?NVgzUnFXbk54cVJpWXFVcDhEWWc3Y3NrUmVNVVNjelJsRFplaW1XWWFObGhv?=
 =?utf-8?B?WDZKeVV1NExjaEhpZE53RUUvZ3RZZjQyS3dhdFRybVN5SEoyTGZMcHgxc0N2?=
 =?utf-8?B?Zkk3ZTVVM0t1clBoeXEzelRjM09TcFhwUkNTOTNVWDdSdE1ia1Z6SUxJbGtE?=
 =?utf-8?B?OTlKbmdlUXRCZnRYRmVhUFRsN3dHZjJhVzhFVi9zUndDdW1Ic1pDUzlCaHJ6?=
 =?utf-8?B?SEltZVlUb3h6aDZlSWFNYXBLS3ZNKzNtbDlLVHppV2tXNE9tNHdrc2NDV3o2?=
 =?utf-8?B?TVBqVERFd3JYRHR1MkFwWjlHWTQ0ZzFMVFozSjVQa0pJNDlybEZmb3QxNG5R?=
 =?utf-8?B?N2k0ZHF5SXBSWnZhOUo0SExyMHNiT1ZMSTFQamVKa1ZQU3R2b21Qa1lIK1Av?=
 =?utf-8?B?Q05aNW5FbU9sd2VDNGp3dEEwQU5uQTI3SmhYV2ZGVkJvdjRnOXFWZWhXUHVL?=
 =?utf-8?B?TDRjOWJidjFDL2c2ZVVQSXNZV1pJbnhMWlZ4czEyZ0QralBEVTcwWWlYMlRQ?=
 =?utf-8?B?Uk5XOUVYZW9oSlNRMkRQS1hpeERGc2Z5V2o4dmM1NHZrK0ZLMWgrWEVjRVRB?=
 =?utf-8?B?SXordDY2NXZ5Z2hKcjRqNFJmSkJGRmdYdmtySmVkcW45QXR4WlpxU1pmaGxX?=
 =?utf-8?B?Sjk5d0pma3R4Q0hQaURVblNvR0ZvTXlQYTUyRXdTSStUVWRvRS9aZndJb2wr?=
 =?utf-8?B?cDY0cDk4Ny9EdjIwbFZZaEV6S3hLYVpianhEZ2VKallTa0lmdmVhbjBKL2RN?=
 =?utf-8?B?NHkwd2o0RXFub0I5aUZ6UEdDMGl6Q09KM09hSnZkbXVJbVphcnY1ZG4va01Y?=
 =?utf-8?B?OWR5QTliUFhoU0kyTzEzQVYrRnpjWEVzWTlnWFBiRTN0YnVLdkpaOFZWSFVD?=
 =?utf-8?B?RlhSaXpJTGE3YVdCdFFDSThsbzhZRXJFcnRBem9LR0NqL1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUhralVuNUFxM3hYQUN1RXhuY3R3WENHSXFCRkk0amtrQSt2L0pYL3J6eVho?=
 =?utf-8?B?K1dLTUR2bE5RSEc5dCtqeHF2Y01RVUJlTnBMdE82WHZoZ3BTTWxXWUpyWk1u?=
 =?utf-8?B?dkNFM2RsZld5c2tyL0tDakZQZW95UmhhVkxkelFrd0R1YXFLSUkwY1pXcVF1?=
 =?utf-8?B?UjdpRm5QTU5YOEtueXplQXVQSURscyt5TTE1dmVFZjZ3MDYwKzFjeWx2TWJE?=
 =?utf-8?B?SThUWUhNM25GK3dmOGUySEhUUStTRkU2M0QxRUZuNFVRTXZmQ2dEbm5jeTNk?=
 =?utf-8?B?SVB2U29CWEhQOUlnSUtGUG1JdVZjeFU4aWdqSUtLV3hOMENhYkNlSXorZnlX?=
 =?utf-8?B?VmZ0WjJCUHo2Q1JVL09QZ2tQbHBRMVFtZThtZnRqbEdsTnF2RndIQ2x0VHd3?=
 =?utf-8?B?K3lwZFdDUUdWdnB3Vkl3eG5yRHBvaGlaU2x2M210Ym9BWDFOQUlKUDJ1WkMw?=
 =?utf-8?B?bUxaeW4yMDFxa2Fqb3BwZ1JVZk5SY3k4M3lPRUNIZFNVU2xuWXBlZ3pjNFRW?=
 =?utf-8?B?MVRMVWZ1Q1N6b0twU2NnTmJWckc0MXQwVFlqdGJKZVY5eGVTd09OWnpnRCta?=
 =?utf-8?B?MmJWQ250VVp0ZEVWclpkVmVWb2w1OWg0MXB5NC9WdVdDOVAwWmZ5K1NHcy9I?=
 =?utf-8?B?ejg4Z1JmWEY4a0dsV3VBTE83eTNKenJZZ1B4alIvZlRodFUvdlYxcnZQOFIw?=
 =?utf-8?B?MkxCZDBGRVNFRDA0ODZUNVdENDAvakhsT0pxZ2FRcjUzRFhFelpRcjFSdG1S?=
 =?utf-8?B?anhaOHhZaFNxODYybTFwOFo1WmQxM3BNS2g4QkF1bFBFMk1QL0ZDV1pOajdN?=
 =?utf-8?B?R0JsMUZlbm5zUEV6UUJmUGw1VGVSdDZVL2RITW5ZY1hzRUFMZndWZCtzbGZE?=
 =?utf-8?B?bFhJR0l3aGRVMFhWLzc1MVloZU9sT0tBWS80SXB6LzhTbFF1Y0JYbGdGY202?=
 =?utf-8?B?ZWdwOVBhaGdUYnJna0lIR0QvYlhyMDRETW02NzBLZC9DN0RqbXF2N25MbHhX?=
 =?utf-8?B?QW9SL1hiakg1bzIxNGhvU2R5WFVwam5VOTIxaWY3QkJ5ZXRKSmhQSGpvaWVk?=
 =?utf-8?B?T0taNjVwMThpOUJiZ0I0d3hPR2xiUU9NaGRiM1YySEV0NktQRWxDTTlnUlJq?=
 =?utf-8?B?N09DQWZEQjF1dXVqOVhPN1psZkV3Nkxld05QS1AyYmU3R2czSkNuT2tDMHls?=
 =?utf-8?B?M1ZUeGpwdENXTXJaQW0wSXpBamFEOXBBdGNCZlNoVWJBd0pOZ3RKYVYvMXp2?=
 =?utf-8?B?TEJMNDNOZUlsNHRTUDFoRkhuNXFxd0NZRTlkVHJsK0M5QUtOV3pyRnV1MlFV?=
 =?utf-8?B?T1dta1NydnRJSTdmQ0xqUjhjSFdBVmZwV3dyUG1ieWh5MGZPa2d5b09PaWZx?=
 =?utf-8?B?TU5SMzV5UFZZUGpSY0Zac1JxZkRXOWpQcGlHOUlWZDJKekFVM2lQdjZyTXF4?=
 =?utf-8?B?alF6V2JBbGVGMzlQcjBOYmltYmpTbGs3RGlXckRnNFkwTkhGT2dkOTlFajAw?=
 =?utf-8?B?ZzVlNVhUS1pHeVZ0ZmExV2pUd3VkeWxhZG5tK2ZzcGlYZWw0K0FjelVDYTVL?=
 =?utf-8?B?ZXdtK25XUll1T1NNYkNLNE1NWkUwVTdTMFYvT1k5ZWtjYkVnUmpiL3lOZ1R5?=
 =?utf-8?B?Y0FSc0h6R3NsaEZ4bDAwUXFsWThvdTg4ZDFyOG5SeVpITTNVZ255N2hKeVBl?=
 =?utf-8?B?UXk5bGJtd3BaUHlXZDRSVDE2S2ZzcHdIOWFPamlBM3lzRWVFMEZaNWdieDgv?=
 =?utf-8?B?Y3JKM2Nab0c1Z1loTkRnYnl6RVhVcUJRRWdtTUpGNnVBZlhQY09LSUhWT0xS?=
 =?utf-8?B?MGdEL0FFQU8xa29WZ1FiUDRSY0lqR2VlNHE2dE5qNlo5ek5kY2wxMWc0M2pE?=
 =?utf-8?B?VHI2VnI4U2lDVzJidTFwVlBWODcxcWF4VStRRzBERzIxQjVDcUZlUUNsSDJI?=
 =?utf-8?B?MVBDVkQ1aFhnRW04MCtiS0ZtQkNEaUNtenErLzhycWRWckZ4L003azE5S1pF?=
 =?utf-8?B?MVd5b3dHdVl5Y1FLeWxydk9WTjJ5SzZPWFE2L2hSL1p2em5kZlpNeUdpcXdC?=
 =?utf-8?B?MlJvWUZCajRYMnF6SlhGbk95cFQvb3FIVWJFZXVJR2sxNVVzdVhWblc2Nldr?=
 =?utf-8?Q?kfB0kH6PPhsA6xdYD40gqvOTb?=
Content-ID: <ABE388DF67E85E4D8EC5E18E5F533698@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5a6527-84f4-471a-351a-08dd1447c616
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 09:41:05.4518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rCMfkgtSdiaYJ5ne+RMZ+POgN8UAdaMkjnWKzAE+3Xz+Rm/OZdS8xrumARmR6yWo1mTUJx9dNu1rNJHUJtWJpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7241
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.533600-8.000000
X-TMASE-MatchedRID: 9zTThWtzImsNtKv7cnNXnSa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCsME2BsoiKJMBfVY7O+c8KbAuWcdTSiQDXvsbfoZixUTkmi
 3zE7HIvmPrj9cXsRchFE/SxwUs/a8sznIV04I19HhG1IOMb7PsGEF8bGZ0cKCSTu1loPX00yjxY
 yRBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKSPzRlrdFGDw1DMbJizqKhMmmbse7T/KqJRxO
 6KPRbAzGX2BBNyQEpTHSxTRIAyLFg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.533600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B038F2E4D1A8344DA67CA34151BE3151471F8424DD42BAE0B96F914B0645EB972000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_876255704.2001246819"
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

--__=_Part_Boundary_001_876255704.2001246819
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
PiBidXQgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGlzIGNvbW1pdC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZWRpZCAqbXRrX2hkbWlfdjJfYnJpZGdlX2VkaWRfcmVhZChzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICt7DQoNClRo
aXMgZnVuY3Rpb24gaXMgaWRlbnRpY2FsIHRvIHYxLCBzbyBtYWtlIGVkaWQgcmVhZCBhcyBjb21t
b24gZnVuY3Rpb24uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsgICAgICAgc3RydWN0IG10a19oZG1p
ICpoZG1pID0gaGRtaV9jdHhfZnJvbV9icmlkZ2UoYnJpZGdlKTsNCj4gKyAgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2VkaWQgKmRybV9lZGlkOw0KPiArDQo+ICsgICAgICAgaWYgKCFoZG1pLT5kZGNf
YWRwdCkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiArDQo+ICsgICAgICAgZHJt
X2VkaWQgPSBkcm1fZWRpZF9yZWFkX2RkYyhjb25uZWN0b3IsIGhkbWktPmRkY19hZHB0KTsNCj4g
KyAgICAgICBpZiAoZHJtX2VkaWQpIHsNCj4gKyAgICAgICAgICAgICAgIC8qDQo+ICsgICAgICAg
ICAgICAgICAgKiBUaGlzIHNob3VsZCB1c2UgIWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmhhc19h
dWRpbyAob3INCj4gKyAgICAgICAgICAgICAgICAqICFjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5p
c19oZG1pKSBmcm9tIGEgcGF0aCB0aGF0IGhhcyByZWFkDQo+ICsgICAgICAgICAgICAgICAgKiB0
aGUgRURJRCBhbmQgY2FsbGVkIGRybV9lZGlkX2Nvbm5lY3Rvcl91cGRhdGUoKS4NCj4gKyAgICAg
ICAgICAgICAgICAqLw0KPiArICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQg
PSBkcm1fZWRpZF9yYXcoZHJtX2VkaWQpOw0KPiArDQo+ICsgICAgICAgICAgICAgICBoZG1pLT5k
dmlfbW9kZSA9ICFkcm1fZGV0ZWN0X21vbml0b3JfYXVkaW8oZWRpZCk7DQo+ICsgICAgICAgfQ0K
PiArDQo+ICsgICAgICAgcmV0dXJuIGRybV9lZGlkOw0KPiArfQ0KPiArDQoNCj4gDQo=

--__=_Part_Boundary_001_876255704.2001246819
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
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5v
JiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xs
YWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGlj
JiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtkcm1fZWRpZCYjMzI7Km10a19oZG1pX3YyX2JyaWRn
ZV9lZGlkX3JlYWQoc3RydWN0JiMzMjtkcm1fYnJpZGdlJiMzMjsqYnJpZGdlLA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMz
Mjtkcm1fY29ubmVjdG9yJiMzMjsqY29ubmVjdG9yKQ0KJmd0OyYjMzI7K3sNCg0KVGhpcyYjMzI7
ZnVuY3Rpb24mIzMyO2lzJiMzMjtpZGVudGljYWwmIzMyO3RvJiMzMjt2MSwmIzMyO3NvJiMzMjtt
YWtlJiMzMjtlZGlkJiMzMjtyZWFkJiMzMjthcyYjMzI7Y29tbW9uJiMzMjtmdW5jdGlvbi4NCg0K
UmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO3N0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1pJiMzMjs9JiMzMjtoZG1pX2N0eF9mcm9t
X2JyaWRnZShicmlkZ2UpOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7ZHJtX2VkaWQmIzMyOypkcm1fZWRpZDsNCiZndDsm
IzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMz
MjsoIWhkbWktJmd0O2RkY19hZHB0KQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVy
biYjMzI7TlVMTDsNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO2RybV9lZGlkJiMzMjs9JiMzMjtkcm1fZWRpZF9yZWFkX2RkYyhjb25uZWN0
b3IsJiMzMjtoZG1pLSZndDtkZGNfYWRwdCk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KGRybV9lZGlkKSYjMzI7ew0KJmd0OyYjMzI7KyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOy8qDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsqJiMzMjtU
aGlzJiMzMjtzaG91bGQmIzMyO3VzZSYjMzI7IWNvbm5lY3Rvci0mZ3Q7ZGlzcGxheV9pbmZvLmhh
c19hdWRpbyYjMzI7KG9yDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsqJiMzMjsh
Y29ubmVjdG9yLSZndDtkaXNwbGF5X2luZm8uaXNfaGRtaSkmIzMyO2Zyb20mIzMyO2EmIzMyO3Bh
dGgmIzMyO3RoYXQmIzMyO2hhcyYjMzI7cmVhZA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7KiYjMzI7dGhlJiMzMjtFRElEJiMzMjthbmQmIzMyO2NhbGxlZCYjMzI7ZHJtX2VkaWRf
Y29ubmVjdG9yX3VwZGF0ZSgpLg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Ki8N
CiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtlZGlkJiMz
MjsqZWRpZCYjMzI7PSYjMzI7ZHJtX2VkaWRfcmF3KGRybV9lZGlkKTsNCiZndDsmIzMyOysNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDtkdmlfbW9kZSYjMzI7PSYjMzI7IWRy
bV9kZXRlY3RfbW9uaXRvcl9hdWRpbyhlZGlkKTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO30NCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7ZHJtX2VkaWQ7DQomZ3Q7JiMzMjsrfQ0K
Jmd0OyYjMzI7Kw0KDQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0t
dHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50
aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMp
IG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndp
c2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50
KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNo
bWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQg
YW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGll
bnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVs
eSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVz
IG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBz
eXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRv
IGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_876255704.2001246819--

