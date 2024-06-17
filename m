Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957090A1A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 03:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F9210E124;
	Mon, 17 Jun 2024 01:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MQNVlCoW";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BvkOOevd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B5110E124
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:19:50 +0000 (UTC)
X-UUID: ae162aac2c4711efa22eafcdcd04c131-20240617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=uoRPrI/QGWGTzu1TEW+G0HcPhiNXKqSgkMDWUNLScSk=; 
 b=MQNVlCoW8DydG39KlhAmQ5Z7UCQmDH1FbusDXMKAehgxceflH7NvC7N/gjLXMza8ezXQNwrMg3nv5fm4V7dnn3MUrMDpaRWi9qyi10rUcboztHdtBoRlHtRkPv9kZbWkNBPeQ1i9jV00UvU/7qWbKlOQRpa9AUeifJMO0dRGMfA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:75cd3182-2218-4da8-8d58-534814f52071, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:5983a888-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ae162aac2c4711efa22eafcdcd04c131-20240617
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1428018050; Mon, 17 Jun 2024 09:19:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 16 Jun 2024 18:19:43 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jun 2024 09:19:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iar7Ca3gu84ydFKLVUX22u2+SuN16pXVNorcFxFyw/FmWsDS/BW9QQ1tOAd266UzCqVT65QMouhCtkc7aB63PqEKQ/u9LQ3lwacrue5HLsff2CzrHB8D76bC6Cce/Ax0GMwiKsmWzLzxWnU3beSKdW0GAraf3mEhJF9M0jFPWFGLnMJzU3pwmg8JX5omG/xsawcuYb3aCkNxVaNPHgAliCxdh6txTz3Qgh7vKH/oMrd7aAemzPNi34wMez7l9TrUCvI9sLz2uOglJmVcuKX6spLqZzioDwPzUtyIvxwltN0WYOShAU/IxEM2oqW5baQCOcEk8CrQbIOBD9BKikPmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2XOvuOfp4HnKlAp2788rBqZZLZLnbI6CbUrtcwRUOA=;
 b=NmAO+p8FkSc0VecKdRGX/tAIkdBYA4MhmDCMXIv2CGEE+HMVZ7o2cicjIt4j7y+C9M9vGEBHCti9sPdnr3bUrUMswyCfCvKMKWH5meWC9q5+UBh6N2eAXpz4L+H8/DXIGr79d5j0fIqBCYc5d6/AGKCqOiUlQri8oxwvoJnxMV2/FZRNylB+e9JI7VXIA9yHaiHTCEAUXjqpP/lBvde8yT2HtbbnlYs1+c8e89/yVcteAuh/lYw+sjSBo6E+Xqbs69ow3b0L/i/vhzh0EarvpsTF0XSyo+X+MZ20vxj4Zu/+h7l9BuTbuJ05DetoaMb996L/YfYY5rJmi7oUMh5Z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2XOvuOfp4HnKlAp2788rBqZZLZLnbI6CbUrtcwRUOA=;
 b=BvkOOevdJNi5HNmj2A8d6Hywiazjb6x+4l0BMZ9iDSBwnoSibBN/pFqmP5JY6N3g7Dl/uDVYTOyK7kq9b5sj7jShnx3d4GY3aAdfJwNGLFxymxDP6Y6QipaZvrAcs/GAn8k/OM7p9/vjZ8bx+lkDia8xm89NzikzCEhaIAQ6ZeI=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by KL1PR03MB7152.apcprd03.prod.outlook.com (2603:1096:820:d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 01:19:39 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 01:19:39 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Remove less-than-zero comparison of an
 unsigned value
Thread-Topic: [PATCH] drm/mediatek: Remove less-than-zero comparison of an
 unsigned value
Thread-Index: AQHavg31gO/WkfVH3Ea3N0oJyRwM2bHLLLsA
Date: Mon, 17 Jun 2024 01:19:39 +0000
Message-ID: <6e9b0113a30c2dc8fc796deff276d71d3ad224d7.camel@mediatek.com>
References: <20240614034937.23978-1-shawn.sung@mediatek.com>
In-Reply-To: <20240614034937.23978-1-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|KL1PR03MB7152:EE_
x-ms-office365-filtering-correlation-id: b297fe29-6946-4c59-99b3-08dc8e6b8f06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|7416011|376011|366013|38070700015|921017; 
x-microsoft-antispam-message-info: =?utf-8?B?eEtLVENFSFVvYnBaOHk2aWl3TmNMajV3aElHY0NaU0JTdjNHWmpOeEFVT1My?=
 =?utf-8?B?TTBFZi9rVVVOYlozYXhGTmtraDVRLzU2aS9FYnptVWlwNDNpalBUckN0eFhH?=
 =?utf-8?B?d1UxOEVDYmNMaUptSnlhTHBFNy9JWFllaTYwaHhqZkRIZkVrdk03d3R6SEJn?=
 =?utf-8?B?aDNVTDRGeStxaDd4UG05dDJCaE5tU3BLbVNrQkxXdHNJbVRiR21qT2RsbFZJ?=
 =?utf-8?B?UWlicnIzbUltS1lNRFdpdEF3d2dNY2cvMnJBV1l2ZC8zUHhLYmFFSGIzNWNm?=
 =?utf-8?B?cDRFenEwMGRBMncwOHUzRmhWZUNrMWVrZmRXN3FtYW5yZDRWUUFJRkJZSmM0?=
 =?utf-8?B?dHVmMlkwM2VBNkhyNlhDdng0M29Yc2tZakJHc0ZkRjlrZ3NVUEQ2QzFDWW1a?=
 =?utf-8?B?dFVhUkVaTDlqWElnYTcyQzF2ZUZaMDNycG55cGo1KzJJUndpcGtXRHJwY3d0?=
 =?utf-8?B?NzZEMVZOVXZBUGtBZE9LNmw5MXVGMTYzWXBOQjZ3YSt2blpvbFNkeHdORjdM?=
 =?utf-8?B?a1lrZ2hYZGFCN3Bac2tJWk5GVGcreU8vVmNWZnlrRjlvbkh0cFpaL2UzV2k3?=
 =?utf-8?B?eERjck9LdGhoakZQSUs3Q0JXbEI0dWQrQitUVFdyb0huV2lZaWZWamdaUE9P?=
 =?utf-8?B?dHlZTDNPUmFNeXE5N095Z05IamhHVjUyOGo0TDNDMEhwZHNRQWw4Zk1hcmtu?=
 =?utf-8?B?bVFiMzU0Y3pRWkdidnVzZnN2RWkvWk12dU1mMEdVK0g4VjBGWnpCYko1UHRH?=
 =?utf-8?B?d3hhU1BjZkZScU5KMW9JV1pidDRnUkl3dWh6NGw3dDZMdHdZVndBdnJBdEoz?=
 =?utf-8?B?cUFLY09zenlXbXZTV1E1aXJBT2M2NTZLdGk2cE9uNHpNTGRzOERWR0xwYjZs?=
 =?utf-8?B?aVQ3c2REODhnMnBzSll2UWxQT2t1UHl5UTMreDhyRUZpQkNNa2FUc3pTZS9C?=
 =?utf-8?B?YWNzYXNjdUp0eUEzOG4xelBPZnBBZEVLL3RuNEdzbjlFeUo5a0ZMNy8xTTVo?=
 =?utf-8?B?V1dVM0ltcy8rSFRYVG5ubWRONHA3QlVYa1EzeXYvcjZiTVJRL1dsWDdQY0xB?=
 =?utf-8?B?L1dEa2xURDJ3VHJRUUtDQlpsSThialpRVmY1ZTcyakg0R0NqdFJ1NXRnUXBU?=
 =?utf-8?B?SFZmQW01ZHR5Sk1WSmFCZElRRWpiaytIQ0lQTEsxbkpkdW83MlhZajVlaFNK?=
 =?utf-8?B?Y1g2b09QVUs2L082Ny9LaGhDMWZUUDl3SXJQK2ZaZzlhZTNKckhTN0UwSjM3?=
 =?utf-8?B?d3BzVHowNmdQYVVyU2R2SmIxbCtlQ2t6SHYyeGJ6MHkyRSswUmt3ejhab05u?=
 =?utf-8?B?OS8yeHVWRzBmRVVTcUZnV2pPSGlWOHhxMC96Vjc4TTArRkZyM1B5RmlNR012?=
 =?utf-8?B?TnMrdFRpekNQbVZXczJSWmY4Y28xeVhab0duTmo5SlhjeU1SdXArclN4UGN5?=
 =?utf-8?B?eU1ZaGt1TEwrS2R0WjFNN0tqaGZyN3JLcEt2UEFaOTdRTW00ZjNnMVMvWmlh?=
 =?utf-8?B?RWVhUlVvTC9jRTRreWtPTFBiM3RuNVdvTjZKTk1paVA1cDlsWmFpNGRtMG9o?=
 =?utf-8?B?VHBDdDJTTVN3WGtVQm9pYWtsSDhiakRxRm0wZGs0aktkSnFKTzFBemhXS3FQ?=
 =?utf-8?B?QWxjeFI1QllrM04xbyt1RGF3ZUJHWVVPRjZHVlRjdTFPdWwxb2NOS3RzSEpn?=
 =?utf-8?B?SzRPM3JTK25FZXhFZFd3S0x3dnl5Y1c4L3I3UVhUTHc5eDVJSno5WFpWcyti?=
 =?utf-8?B?UXhrdnpkZFc3MXA1eC9FQXFjQldldVJoUURlMms4Lzg5T0Z2dnh0ZlVHVVBv?=
 =?utf-8?B?cjYwakZqZU9HN3pSVjczQWpXeEZSVGQ5S25YTWxMOTFKelY0SU55M2lxWHZl?=
 =?utf-8?Q?+jkIMnKvOQNF/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(7416011)(376011)(366013)(38070700015)(921017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ukc5Z2lzWkM0U2Q1VWpwOFFIUWwzckVmMkw0NVZwcTMrOHdRMU1RVkVqSmxF?=
 =?utf-8?B?Ulo2cnJzRE03U2lUaWdyS0ZhcmR3cVpsUVMwWTI4QktpMmRYU1ZSUWZ5REN0?=
 =?utf-8?B?d1E4b2dIWVZiN1dMZ3dZa1pld1pLSmFIcE9qU0NWNktXWFRnRS9XSTJLeGFo?=
 =?utf-8?B?TkNNdThJWWRvM05ZZktHUjNvcUh5a1RkZlV0Q2JLTlZ3OU5ML01WbWo2ci9G?=
 =?utf-8?B?bUNFcCt5V2lxK3RtR2xsVmxacTludXEvWS9wbGFLMGxSK0V0SjhpK1NzSmk4?=
 =?utf-8?B?RFhQQktubFlhY3VCYnVyTVphSkhEamgvcVNNOGRTbkVPM1RIdmorb0IzVlZn?=
 =?utf-8?B?Vm1GNit0amNlRUhLZytHSzkxdW81ZXI4WFhNSlNTYTR1bU1PTitOM1FrSlZt?=
 =?utf-8?B?SXliWkxaaGVyZDZ4WVlvQXY3RlkzUGZhbC93Qk1DUThlWmZmK1pRc1VwL3Jr?=
 =?utf-8?B?S0ErYTAzSXFjV1dYZm81VzZ5RjJTTUk4ZWNIU1l1eUw2TVdmSFFYcCtKNzZ5?=
 =?utf-8?B?WnRia2FQT2N4S0RjMWJwMFhLN3RucTN4c1JRK1h2dnJLWWxCcGhlN0ROeGhj?=
 =?utf-8?B?TkVUMzlNa0VCQ0hrUXBVUXR6YnFZWllFMVVrK0ZaVDVZZkpnMmM3aW1jOFFB?=
 =?utf-8?B?Z0d6V2FCbVpuMGVSS3R4Y2Z2eElnVEZZTjZnbTYzOGNoM2VlcnkzWDg0aWFK?=
 =?utf-8?B?bDZ1NTdQdVhrMlE3S3lwK1ZjL3NOd2hJNXRMVVpKT29JM3ZDT1N3aHZCdlVo?=
 =?utf-8?B?SXJmMXorYmpwWGhVb3lGcTI5dWQvTWEycW1JeTkweW96OW5FY3NsZGpqbHNo?=
 =?utf-8?B?NnBWbDIySEkwUlZzSmRBK01EUHRuSUxHWk9tV2FvNlJwQUpsbE1yOUdrT2Na?=
 =?utf-8?B?Z2FzNTdSMVZ6Z29Uc2lnNUtJeFFlS3VCT1JKMDUvaDRQZFFCTUoyd2Z6dklM?=
 =?utf-8?B?V21rNTN3RnlVSEIyK2dnSWhTV1VDVUNtd3hNNEN5R1djYS91d3JESGZVUmZX?=
 =?utf-8?B?amJ0RmlLZktYa2R2U2Q2dW01dnp5R2MzcWMzbEtyN296dFNDVHZsaVcvZWxw?=
 =?utf-8?B?RDliV1hQN085Tk1OUDArbG9EbGd5bGYwN3RRZnVDdDVubnl6TXZ4VnpFSlli?=
 =?utf-8?B?b3V5cFY1aEI2ZHAvTDZQUkZhcmZDbWxWTllKS0p4VmpvS1hZcDQ3VzFaM1lq?=
 =?utf-8?B?M1h6ZFdqaW9WS1g2RjNFZGpYTE12dGl5U01UMEluUDZwY3J2ekxZdkZiN1Z0?=
 =?utf-8?B?aTRoV0JVeEk0SW9Xcm5EdTZ6T3FJaE9xVm13UjFQZG5aWnVNeC9VVEpyTEhW?=
 =?utf-8?B?dDZNYk43L0M1Z2pFT0tSdFM4SGhlOWRQQkxIVStIOFRuKzI2VDBNZVdyRVc3?=
 =?utf-8?B?Zk9SWjBUeU9ramFvcTBPaVh0dGI5aEFya05NY0VZWnJTRDNNU1Y1Q2tUOUcw?=
 =?utf-8?B?SmFWV0lSem9BSzFPbWJFbGRJUGxUS0VTQXp4RWhicWlVUjkzNENWZ0Q3SWE2?=
 =?utf-8?B?cytpQmVHVWNOZUN4YXFubFFSMS8xeGx0NFJtYkVNbEY1MEVsRGJibGtMMHJy?=
 =?utf-8?B?NityUGNyU3F4eUJXQVF4UEpheFplVWJPdE4rdzBKbG45NVhYSlo5SW4zbHZ5?=
 =?utf-8?B?V0dCM092T2tLOFQxbGhQTVRSYTlyR0ZLWWdTVW0rd2o0TzBXdzZpMm83Nzhw?=
 =?utf-8?B?WWgxZXp0Yy9WODU3K3NoSlJuWGtjSGsxbkpWdzhTV3hxQzNwMjJlUEJPZ243?=
 =?utf-8?B?SDAxTTMvUEFYYStZYkFzejVtK2V5emo5QzZQNDhpdS9OMm9kckd2VGhrRlNW?=
 =?utf-8?B?UXd3SkhXRUZqTW4vcURPUDdRZ1V0MUNYR1ZZcEw2QnloaXFJN054TEF3emJE?=
 =?utf-8?B?dUtQK0hnZlNxRlRvekVRNzFRU0ZVSm9tRjNUdEE5VjdpN3RBR0ptcTlWRHdj?=
 =?utf-8?B?Ym1LNXI1bkJuSVdXUHdDaS9NUlNUaUlpY3RyK05DdU1rZDhqR3NCWlZhQ3lk?=
 =?utf-8?B?L1RBTVlRQk9yTklhbVdrV3JtblJVTEZLNy9BK3p4NlNnM3hBNklReUp6dkZS?=
 =?utf-8?B?TnF4MG5QM2UwMHl6dkh6NWszWXFITG16WkxhMkZyczNvZ3AvZ3J3ZnZyTUdO?=
 =?utf-8?Q?JnFcROygH/09lnaFe/FfZhSF0?=
Content-ID: <592EF6166F173A45A5E9466496809DD8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b297fe29-6946-4c59-99b3-08dc8e6b8f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 01:19:39.1965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/gWpGN9bcLW9ITsrfSI+jEav7TlcrIL0wafOHh8FXLfOLlipnxWFRqevZa1onVcb9vkz2w5YXwr1lxg2ZlnpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7152
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_130592746.1930974833"
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

--__=_Part_Boundary_009_130592746.1930974833
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTE6NDkgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gRml4IGEgQ292ZXJpdHkgZXJyb3IgdGhhdCBsZXNzLXRoYW4temVybyBjb21w
YXJpc29uIG9mIGFuIHVuc2lnbmVkIHZhbHVlDQo+IGlzIG5ldmVyIHRydWUuDQoNClJldmlld2Vk
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBGaXhlczogMGQ5ZWVlOTEx
OGI3ICgiZHJtL21lZGlhdGVrOiBBZGQgZHJtIG92bF9hZGFwdG9yIHN1YiBkcml2ZXIgZm9yIE1U
ODE5NSIpDQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVk
aWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2Nv
bXAuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRw
X2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiBpbmRl
eCAxN2IwMzY0MTEyOTIuLmE2NmU0NmQwYjQ1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGRwX2NvbXAuYw0KPiBAQCAtNTkzLDcgKzU5Myw3IEBAIGludCBtdGtfZGRwX2Nv
bXBfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNv
bXAsDQo+ICAJaW50IHJldDsNCj4gICNlbmRpZg0KPiAgDQo+IC0JaWYgKGNvbXBfaWQgPCAwIHx8
IGNvbXBfaWQgPj0gRERQX0NPTVBPTkVOVF9EUk1fSURfTUFYKQ0KPiArCWlmIChjb21wX2lkID49
IEREUF9DT01QT05FTlRfRFJNX0lEX01BWCkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4g
IAl0eXBlID0gbXRrX2RkcF9tYXRjaGVzW2NvbXBfaWRdLnR5cGU7DQo=

--__=_Part_Boundary_009_130592746.1930974833
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMTQmIzMyO2F0JiMzMjsxMTo0OSYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O0ZpeCYjMzI7YSYjMzI7Q292ZXJpdHkmIzMyO2Vycm9yJiMzMjt0aGF0JiMzMjtsZXNzLXRoYW4t
emVybyYjMzI7Y29tcGFyaXNvbiYjMzI7b2YmIzMyO2FuJiMzMjt1bnNpZ25lZCYjMzI7dmFsdWUN
CiZndDsmIzMyO2lzJiMzMjtuZXZlciYjMzI7dHJ1ZS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYj
MzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYj
MzI7Rml4ZXM6JiMzMjswZDllZWU5MTE4YjcmIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtB
ZGQmIzMyO2RybSYjMzI7b3ZsX2FkYXB0b3ImIzMyO3N1YiYjMzI7ZHJpdmVyJiMzMjtmb3ImIzMy
O01UODE5NSZxdW90OykNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hp
ZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21w
LmMmIzMyO3wmIzMyOzImIzMyOystDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5n
ZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24oKyksJiMzMjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RkcF9jb21wLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBf
Y29tcC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MTdiMDM2NDExMjkyLi5hNjZlNDZkMGI0NWUmIzMy
OzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGRwX2NvbXAuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGRwX2NvbXAuYw0KJmd0OyYjMzI7QEAmIzMyOy01OTMsNyYjMzI7KzU5Myw3JiMzMjtAQCYj
MzI7aW50JiMzMjttdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QmIzMyO2RldmljZV9ub2RlJiMzMjsq
bm9kZSwmIzMyO3N0cnVjdCYjMzI7bXRrX2RkcF9jb21wJiMzMjsqY29tcCwNCiZndDsmIzMyOyYj
MzI7aW50JiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMyOyNlbmRpZg0KJmd0OyYjMzI7JiMzMjsNCiZn
dDsmIzMyOy1pZiYjMzI7KGNvbXBfaWQmIzMyOyZsdDsmIzMyOzAmIzMyO3x8JiMzMjtjb21wX2lk
JiMzMjsmZ3Q7PSYjMzI7RERQX0NPTVBPTkVOVF9EUk1fSURfTUFYKQ0KJmd0OyYjMzI7K2lmJiMz
MjsoY29tcF9pZCYjMzI7Jmd0Oz0mIzMyO0REUF9DT01QT05FTlRfRFJNX0lEX01BWCkNCiZndDsm
IzMyOyYjMzI7cmV0dXJuJiMzMjstRUlOVkFMOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYj
MzI7dHlwZSYjMzI7PSYjMzI7bXRrX2RkcF9tYXRjaGVzW2NvbXBfaWRdLnR5cGU7DQoNCjwvcHJl
Pg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioq
KioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioq
KioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5j
bHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFy
eSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVy
IGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRv
IHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpk
aXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChz
KSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFy
ZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0K
dGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwg
ZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55
IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUg
Y29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8
L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_130592746.1930974833--

