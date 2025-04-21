Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C7FA94C05
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 07:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3598C10E122;
	Mon, 21 Apr 2025 05:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ErA90fUC";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VElYDUCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFE510E122
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 05:07:21 +0000 (UTC)
X-UUID: 7b9a82ac1e6e11f0980a8d1746092496-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=NIHHcaVrJEHSI7xtnIaYtHATHJYjNw5vnhtffQ6DuG4=; 
 b=ErA90fUCnTTx1jEJlV1Dy19seucRxvJpelRKb7UTnU09QBsAM9LvVPv3DuCkZ/prMP8DbCMtIAAJ1oUBocJc1m7k495F7rYo3d2TKPkYhMFNj/25CQmdVjJ9/MQuzeDtzNJuzZ+9G234Myj7/o11g4E7JQnb0YZbd7GNh6Wpcqs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:db1b3738-3837-4f5f-a36a-3eef2d60dfbb, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:ee53d78d-f5b8-47d5-8cf3-b68fe7530c9a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b9a82ac1e6e11f0980a8d1746092496-20250421
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1079446017; Mon, 21 Apr 2025 13:07:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 13:07:11 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 13:07:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtK8fJX2XS+lsLYSYuRn1zbJyECXEaShEiasdCCVmVKy/nFpH2Ib9I9lXcZqb2PGAaJtxzAINrR4d2A+ozYTzoxd64qWPQBUzaoBfVyUri4eSmRw5F/WZnxXn6CMJ+5CsLDrFC2sudGowmHtEMVnM6bVKPqmWJ/6Wq/p6qTW7duQLkmGv0HkrUjoDnn5GkUR6r54AhOOy08ic3iSa3yFcCLmGKBcTMx6ZhsiHsgjFCNs6aRNQxvyaLjr7utXHRz5EOogYbUVBVU8xzd2iHzOBS3L53C4Rpno3Jf4RlPGp2fDPEzlCwT69ZkaYW1/R9qTPEXB3E1gSl/SLEYxSti8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCwV/wTVjWh6G0PztVVI98X1lPgPM4EUM3gKfeDlHjk=;
 b=JUOdadFqbY7q0fswwOMsEUbZ/sStiElrZhSUi7J9fu/qBwt7zTXYu0/B9AfommYFSiCuBYH3H61/43WyKhe5F5z0efD4G3MHR2ZKqCy4yp8eKBmcvfPRcUaD4VkZATMU9vrdHtHdmyfvWDVAHV6IRZx6QLaoOAID8E/vXEMIdc2Yh9dNiJa5FcIpRV31S7BPS8qWD3WH38/LoxGQ3fWYhSoLKmbjlhnUQFqHPdjq4kIPMQRn0CB++EfLDAbkNaH8MYtNJn3zp6EoYXWNy23fU17aKkLZPZ2wQkox1yy2vLZa+uB/HuroWiwwl8/lHhCUcfSBn/k4jGfC6LsFn9MMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCwV/wTVjWh6G0PztVVI98X1lPgPM4EUM3gKfeDlHjk=;
 b=VElYDUCmA6Xjlh8zutiUD4sLmS1aruUyg1C1hUS9cPhwJHL/Z1XgGlW1lqbpKDQh8RTGaaQV7CnsfQTj+ZB9hxynTdUe8CfTfT3hP53g1qOXsP7/L51vd7abDwHrrQyiapyGXskhH9sBG4KdvJIt7lRTYBfgGPtXKQQqdgLkXl8=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYZPR03MB7553.apcprd03.prod.outlook.com (2603:1096:400:421::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 05:07:09 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Mon, 21 Apr 2025
 05:07:08 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?QmluY2FpIExpdSAo5YiY5b2s5omNKQ==?= <Bincai.Liu@mediatek.com>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5] dt-bindings: dvo: mediatek: add dvo yaml for mt8196
Thread-Topic: [PATCH 2/5] dt-bindings: dvo: mediatek: add dvo yaml for mt8196
Thread-Index: AQHbsC6nBq2GF7QIRUqaX2yXmfTM9rOtlheA
Date: Mon, 21 Apr 2025 05:07:08 +0000
Message-ID: <8ae9c99227fbfedafb4b118578e0228905d2f9d5.camel@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
 <20250418065313.8972-3-bincai.liu@mediatek.com>
In-Reply-To: <20250418065313.8972-3-bincai.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYZPR03MB7553:EE_
x-ms-office365-filtering-correlation-id: e044f321-0825-4576-6a02-08dd80925e06
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?enVNd0dpMWdTMWNsSXd5ZUlhd25zdmhaYjNIcUh2L1o4MlpValRtQzV6bHh5?=
 =?utf-8?B?OUVhV29hRzZXM2hwSGpDSXhCQStlSTVBaGZ5YjhsNXFkZVBPSnBnSmhLSXNH?=
 =?utf-8?B?bDZWTlBncVFkeHVGZWVsSGVZY0V2MDFndVBvZnFHT2o4cDNtWFJFS2twUHgv?=
 =?utf-8?B?LzJVTWtpaWMwNXRIcjNPZWRBRVNVNVNMUlFPd3l6VHZsSlAzNUo2eDlQVHN0?=
 =?utf-8?B?MHFsYVFISEQ2dUg0dW9FZDVUbVloYUc5dmR3azdWdng0cEpNby9EOVdXbExz?=
 =?utf-8?B?UExoWFkwTDBUWHowY2o0KzNjQ3Vxam1FVVJJdWszc010L1FRZk1tY0pVd0Jt?=
 =?utf-8?B?ZjFGTUtzbWNmb1hhVG5uLzczRnhmUkJhR2Ntc2lrWmNXOGJXb2hZUHJkTVY1?=
 =?utf-8?B?Z1JDQWROT1M4VXVsdXBiclpWZXhVZXpQYXlYbzlzU2ZDTEwzcFNPckd0Z2JV?=
 =?utf-8?B?NisrT0lUTTV6WGErQVJrZTc0d2JhazhXQ2JLakp5L1IxMkRnaUFCN0JDR1BE?=
 =?utf-8?B?L056R29ZbnUvYlZzdWVvRzVSZmRoUjRZT1F5Rk1mTC9UMUF4TzdRUy9OTmwr?=
 =?utf-8?B?YytUbGtVdGVMTUcyZnpTNVNZWFRqbmpVOVBsY01IMTJOSkt2NXZXWVFHczBS?=
 =?utf-8?B?TnNxVVlaQmFYNUN3azQyZWZidVljclJzT2Zva2tPOUN0MGF4YVM1bitvUFFV?=
 =?utf-8?B?bi81WjNabHQwaHZJcUdYSXhRd0RtREtTTWV1NEpkdjVaVU1vZnloZDRVTGVL?=
 =?utf-8?B?Qk9Fakk1V3daWjR1NzdKeDBzOFRWaGdBM1ZGdjRZY2ZreDIxR1NXMTM2bzdt?=
 =?utf-8?B?Y3pUekkxTkZFT2dSLzlzQjl2SG1Kc2FpNEE1REUxYjdobjU4ME5hYnpleEFk?=
 =?utf-8?B?aGU5ZFIxZTEzTWJiTm9MVU5vUFpOaW5KVzN5VmgvSXcrbjB1cFZXcC9ZclRz?=
 =?utf-8?B?T2kzZHIrSlFjMXJuSVZRa0kyMXZjcHFISlo5Vk1USWdtL1M4NWE4MG5FVHhv?=
 =?utf-8?B?Ym1raVoxbHFSN00xZFA3VFlEZ2g4MDA1a0hFWVA0ZE1HQ2V3K2NFcmxkRlhW?=
 =?utf-8?B?bEd5NDJSM1dnUjZTU21Kd3U5MXErQzVLajVTd2p3OFZyUDB4djdOMmliejlB?=
 =?utf-8?B?NXk0WTYwR25PUk1xRFpyUnFEcHFmcGNPVldTUXZNSWswTy9EKythUXVEU0Uw?=
 =?utf-8?B?NVRXb3ViNVUva2R5MFdGMHhRdmxrTWRraHdwSTd3TWlGUzVtc3JkVWRPeDBj?=
 =?utf-8?B?QkgvakEyaTZIdXVhWjhtcENUTHFqWDE2bmVGUXV3THlqaWVWM0pxYzJBaVMv?=
 =?utf-8?B?UUgwRDhmLzNvMTZXUDIwYmdSN2tFSjhBTmxZc2liMlB4ZlpsVFVlVGd5dnRO?=
 =?utf-8?B?TnZ1QVAwNTE3YmNJUHg3eFdWRzZYK2VnRSt1TWZvaERBbG83V1hQN1FlVDAz?=
 =?utf-8?B?U2N2MkxHTTYwYldOVkhUOGx6QjRXWkt6bm5TMmVaejFFcEQxYVJuaVRHYWln?=
 =?utf-8?B?SzJLNnlodWQ0NHBySzdnaFRScGR6aUZyKzQ3RVZpbFFvdXRNSzdNOGpDcG9r?=
 =?utf-8?B?cTJ2TG8wR2dwQmxxc0VjWGx4OXJJK0ZCV1pOa2Q4cDhWc3U1UFV3dHZ5TkJz?=
 =?utf-8?B?cmw4RDh0VG5ad1NENG9HMGJ1QXhqSmdLMW15K29OMHkxOFBiaWFDaWNqS2gr?=
 =?utf-8?B?Q0w5bUxwaDF6KzlhRHNrTG5yTkV5ZFVjcjBOM2lJMDFYQ0NNbloxYm9wa2Nt?=
 =?utf-8?B?dXprNzlsUkl4SUJ1cmNwWU40OHNScWlZY2k2NGZPRUtOUitiWHo2ek5zY3lH?=
 =?utf-8?B?UlhvWExKY2NZMTg3NXBKL2dPanFBL3E5MmpBbGwyTDBCOTdndWhwY3F4M0RQ?=
 =?utf-8?B?RGZpRERwWUZveDJXWDltcDEvcE50NjgyT3ZpTElRUGFJaVVjZCtISlRNVHJ2?=
 =?utf-8?B?Vm5JMGR6S2tORGZTUEdPell1YTUvTlFhUnNLMU42TUxzNklmaUtmMHV3K1M3?=
 =?utf-8?Q?GyIwOG2fzUr4CQ5oLybwFXoaYrIz9Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmNsR3R5eE90WU9xWSs1Y3ZacmRTdkVWU3dXSEE0RVJRVWlGczg0M0t2d1NQ?=
 =?utf-8?B?dnFTeDZORDJ1TG94alVBRlA2Q0IzUnF6Rk92RHk2UkRCSHF1K25nY282RnAr?=
 =?utf-8?B?UHY2Um5VVGhHSkJTK1hrS2VjR1pJOVN0cWkyT1poVTVxbUoxbllZSHZoOFEr?=
 =?utf-8?B?Q1BITzdCTlVpR3Z4YWN0Y1RGM1pSWkxBcFpYeEloalBDUEhCN1dpcjJFb2hC?=
 =?utf-8?B?RDV4c3VVMmV4LzVPZlV2ODVnMjdYTUFYeEE4T1E0czFQdURVeW5OU3Urb3pt?=
 =?utf-8?B?YkxjaHZ5bE1kOVowYm9NZjlZVjY0cGhVRlFYd3JSTmFaQ0FKdTVJa1pCalRq?=
 =?utf-8?B?V0g1U1RxbWlvNUpGMDdrQVpqbDJhNGc3WnR3TWZjeGYvUm1mdEhUY0VYWXdm?=
 =?utf-8?B?M24yK0tVR3VsZWdOT0pyTGFTOFdvV3lCZE5GRWdsSnJPc3VRa3U4N0lSU3Mz?=
 =?utf-8?B?SmcvQklVQ0dKNU5JcFQzRDV6USsxTWovUTkyWGVzby85Y1dKN1VPRzB4dU4y?=
 =?utf-8?B?QTVVZTd2NkVSUEZsL0xCRURKVElDaUN6K2FpMGlCVDNxaUljeEZJM2dvSHNj?=
 =?utf-8?B?QnQ3YnlzeHQwRjZPNFgwU0UyUzZRcm93QW0veGp4eVdxbEpFd3BBaVVJVEZO?=
 =?utf-8?B?dVRzUmNTMk1yVEx4UE5XVkp4VE9mUkkvQjZmbTFjZ00wTUVTeGxpYXM3WEE4?=
 =?utf-8?B?ZExvY1dCK2graklZVW83MXR5NkN6aUJpL29yY2hWUVA5dDIzb1JSNnk2Y3Uw?=
 =?utf-8?B?bis3QVg3cHNuWjFXQTVGZlFaQW0wN1VyRHlXbGVJU245dUQrN3daMmdBRUhO?=
 =?utf-8?B?d3BrVEkvaWFWbHRBa3g2bzh3cit1bGdRVFd0ZDNCN1h1WVROb2YyMmtzL2l1?=
 =?utf-8?B?YzlWU3V0WWEzeENqdzBkd3p3WnBvQ3p6UG5CZFQrKy9sa3ZBRFI4NkdDcm1I?=
 =?utf-8?B?ZFhXZlZWMllpL29mSmxORm9QRDJGTkgzaXNHQVQ3ZTlQRlQrbGxyMWljQ1k1?=
 =?utf-8?B?elRhazFEK1lCbnFqdGZGNmRWYm9xVU5FTWptVzdVRkQrUG9Mcm10S0dvZ3k1?=
 =?utf-8?B?WC9ZMFRBdWZRanRJMjlaMnZDN3I2czg1NUh5bnh1Sml1ckJjREY4cDVHU3hZ?=
 =?utf-8?B?b3Z3SUlaNWQyVzF6RWYrTDZ6ZFMzVDM2c2hURlVYb1A3K2hiNFFtSEtuKys5?=
 =?utf-8?B?VWRMUGhtblF6dEpUVVVtUlpWMFdHL1ZXUFVkeXVVS0Q3allNcm5EUFJIS1o4?=
 =?utf-8?B?dVFKSjM4M0o3RzVGRlBPYW5TeUovVkJPT21YK3FoZDZJNTdYK2gxQUJXclNM?=
 =?utf-8?B?SGIvK2d3T3FJbkNZd1k4bnI1cWNDL0VzcU1JYzRzbGphOTc5eDUvTyt4anF2?=
 =?utf-8?B?dThxVkdxLzdqR2RDSnpONFQ2THdOcVBQOFpqbWpwM0hrbnFIZS9jRFlvV09y?=
 =?utf-8?B?eVpBK0poc0xRaXFSYlFCM3N0VXhPbm5yTjlVNXpDVWVVajh6Q1VzVUxGTjNu?=
 =?utf-8?B?elkxcjlwL2JvZm9oZm12cndjNW5nSTZQNFg3T0FXcERqb1Y0ZXdMWExxUjVH?=
 =?utf-8?B?bzBBOHlTR2F2QXg5cExaS0QxOGUrQ2FnUG1xQitSTVc5NXZvbWJNYktzZ3Ew?=
 =?utf-8?B?VE9VQXozb0FSc05MTmZjNXc5eDMrUTh5eUhWNG5YTk5BbVg3MlBjMm5KZjZ1?=
 =?utf-8?B?NC84UEpjOFZja29TQy9YTmVtcjdPWFBma3F6aHUvME1OblBQV1RkRzk5RFNN?=
 =?utf-8?B?dkpVR1h3dlhUYXpFSUtVVnd1OGF2a3puVEQxV2ZGZXNocmtQeDAxclJkM0ww?=
 =?utf-8?B?aTZ3bC9ldW9lTVNVOVNWL2dNNDltVk05dFpGRWJkNXl1WTc3bTNzTzM1bTYy?=
 =?utf-8?B?cjgzbkJNTVBsWTFiZWg4ZW5nTkU5NExWeGgzeFh6a1NvanRiOXhuUGdYVG9L?=
 =?utf-8?B?N3duWURHY0RqU2t3RUxTbno3cG85QWU2NnRZNGtvVjVoQUxhaEFzVVcvR1hS?=
 =?utf-8?B?VVlENzFpcWNPOU5jUnMrZ1RGay8xam9ObWxtWjBNdWZXdjBVQ2x0UnVCRGZh?=
 =?utf-8?B?V1FLMU5mTldFRnR5S3FJSDB3VzVWZCs1SlpZOGVpNnB6WGdSK09LVzV0dGp5?=
 =?utf-8?Q?adSfnhl9dqTx4R15cXhy1FALY?=
Content-ID: <C6E1AE18E617D24FAC9AFC8CDC406582@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e044f321-0825-4576-6a02-08dd80925e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 05:07:08.7148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dy6uF98JyU7ubYLaGwrqfjaScI6Sl1sB4pknUEcLihNOzB3PHkMlbdDN6OLTyFJDNwrVGqCTgz80UCnVro/wxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7553
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1557604535.696385844"
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

--__=_Part_Boundary_005_1557604535.696385844
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA0LTE4IGF0IDE0OjUyICswODAwLCBCaW5jYWkgTGl1IHdyb3RlOg0KPiBB
ZGQgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3VwcG9ydCBkdm8gZm9yIE1UODE5Ni4NCg0KU2F5IHNv
bWV0aGluZyBhYm91dCBkdm8uDQpXaGF0IGRvZXMgJ2R2bycgbWVhbj8NCldoYXQncyB0aGUgbXQ4
MTk2LWVkcC1kdm8gcHJpbWFyeSBuZXcgZnVuY3Rpb24/DQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBCaW5jYWkgTGl1IDxiaW5jYWkubGl1QG1lZGlhdGVrLmNvbT4NCj4g
LS0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRwaS55YW1sICAgICAgIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sDQo+IGluZGV4IGI2
NTlkNzkzOTNhOC4uNGY4OTdmMDVjYjM2IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkcGkueWFtbA0KPiBAQCAtMjgsNiArMjgsNyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWRwaQ0KPiAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4
MTk1LWRwLWludGYNCj4gICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1kcGkNCj4gKyAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE5Ni1lZHAtZHZvDQo+ICAgICAgICAtIGl0ZW1zOg0KPiAgICAg
ICAgICAgIC0gZW51bToNCj4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDY3OTUtZHBpDQoN
Cg==

--__=_Part_Boundary_005_1557604535.696385844
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDQtMTgmIzMyO2F0
JiMzMjsxNDo1MiYjMzI7KzA4MDAsJiMzMjtCaW5jYWkmIzMyO0xpdSYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtBZGQmIzMyO2NvbXBhdGlibGUmIzMyO3N0cmluZyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMy
O2R2byYjMzI7Zm9yJiMzMjtNVDgxOTYuDQoNClNheSYjMzI7c29tZXRoaW5nJiMzMjthYm91dCYj
MzI7ZHZvLg0KV2hhdCYjMzI7ZG9lcyYjMzI7JiMzOTtkdm8mIzM5OyYjMzI7bWVhbiYjNjM7DQpX
aGF0JiMzOTtzJiMzMjt0aGUmIzMyO210ODE5Ni1lZHAtZHZvJiMzMjtwcmltYXJ5JiMzMjtuZXcm
IzMyO2Z1bmN0aW9uJiM2MzsNCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7
U2lnbmVkLW9mZi1ieTomIzMyO0JpbmNhaSYjMzI7TGl1JiMzMjsmbHQ7YmluY2FpLmxpdUBtZWRp
YXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7Li4uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtm
aWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sJiMzMjtiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sDQom
Z3Q7JiMzMjtpbmRleCYjMzI7YjY1OWQ3OTM5M2E4Li40Zjg5N2YwNWNiMzYmIzMyOzEwMDY0NA0K
Jmd0OyYjMzI7LS0tJiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sDQomZ3Q7JiMzMjsrKysmIzMyO2IvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBp
LnlhbWwNCiZndDsmIzMyO0BAJiMzMjstMjgsNiYjMzI7KzI4LDcmIzMyO0BAJiMzMjtwcm9wZXJ0
aWVzOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5Mi1kcGkNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRp
YXRlayxtdDgxOTUtZHAtaW50Zg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5NS1kcGkNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
Oy0mIzMyO21lZGlhdGVrLG10ODE5Ni1lZHAtZHZvDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2l0ZW1zOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2VudW06DQomZ3Q7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRpYXRlayxtdDY3OTUtZHBpDQoNCg0KPC9w
cmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioq
KioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioq
KioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1
bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25s
eSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24s
IA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGll
bnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2
ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_1557604535.696385844--

