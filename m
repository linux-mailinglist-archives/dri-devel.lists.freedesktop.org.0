Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92DFBFF0D9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEC910E354;
	Thu, 23 Oct 2025 04:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="i7zpwgZ1";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NNps35o9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6127810E354
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:03:39 +0000 (UTC)
X-UUID: 3eaa9b3cafc511f0ae1e63ff8927bad3-20251023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GVd044tVj0T39g/BFc9RJ28sty0vn70KIdek2CXBNuk=; 
 b=i7zpwgZ1SvYWkST8CLU+f0/9zC/n6vJMkgDAg7PuTkNieWwRJxHrS0rmC+SFdpCvQcQ32MDrgX0lfucNdJyi1SurOtWDtw56AZ+c4sgr9HyJ53Xjo0VL5NvXuRjONCZsE0e4KWhl1VIsUeKtbi75MFPbUO3PUsSSZnt1r6X8No8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:38c4cc57-d307-46b4-a415-2502a406dcd4, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:86e6bc3a-b16f-49fc-bb37-560773c432f7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
 BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3eaa9b3cafc511f0ae1e63ff8927bad3-20251023
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1295840001; Thu, 23 Oct 2025 12:03:34 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 23 Oct 2025 12:03:33 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 23 Oct 2025 12:03:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwkjtEMVpcYU32GK9mr3m1aNrz7KitiHheyfWumjbZAbdgoU+FYlM3C0FzE0ZlKQVszbAizEx9a+/pAcSNr3YmeUG+oUd1isRrCy3nPBW/uZ8gWTu8TrG8FxjDM5FuFaDS19K08CwME+GwYDIKFD995qE04qfZsbav+4dwZEBGky9djrB8TNQ+LQ84qXd9GilygdYBieairzT3v85o+8I9ZF0bkmeWzJY5zWyRlIWWywBw+6NJG5v1YzyEUmY09CmN9BLqc735QJUwbBw9rQtMCXZpvs6ANuEaM9QkqHmSmn2JUZK+qPjgNotHif2J9lkzjIxdKAfgtyYT3DsXe7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxyQ13SC6F7lL/brAupGj6i7SvJF81Z3Wt9HawfyLJM=;
 b=khAhm7+iJ+7h2R41Jh33ExzQmPgpnj8u5QsRe9zqtwMeBJMVad5ZgcnNP2uCiakvr/0lxFPMyuJgbei++kxtlHGTFyKO03W7Ajg/BmG3P+WoUiYFuYi0Ol6VGaf8s0iykXC7QnysvklI60gSchA4uIcav2VFrXMLte/OR95eBDM4CWS+cFxo0l80MxlRQEfCU4jQUZgWv9pJEf4CjgSUTDG9IZPZc2Yjzlyy6OF2yzdX4UBj80ZIZCLrzbymkho5HqgTB2ye04atReJKLOcZj7feWZqpIgGjn1QQHx5ZkvdxchjLtwc4nqdG9kYVRFf/jChrsP3wK/Cvp5z3ho2yRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxyQ13SC6F7lL/brAupGj6i7SvJF81Z3Wt9HawfyLJM=;
 b=NNps35o9aSZovo4X9+Zd96B2UQLWqJ8nCPiqKA/z02+6OQ2UB+mr3US+bwA9xSvjz3v644MbBc4+D3yyEseKJ9Hept+jhW06dNKqLR7lT4HIsTdE864+nAdB+ZwnNOkHdxWCR24P3UOGi4I3ksr+IKb1sDbwRr8aCks7wwGX6ME=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7648.apcprd03.prod.outlook.com (2603:1096:820:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 04:03:30 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 04:03:30 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nicolas@ndufresne.ca"
 <nicolas@ndufresne.ca>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v8 10/20] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write
 API for SoCs without subsys ID
Thread-Topic: [PATCH v8 10/20] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write
 API for SoCs without subsys ID
Thread-Index: AQHcPzJqDXHrFcEr/kCiyzQk4xk0i7TK04uAgARSCoA=
Date: Thu, 23 Oct 2025 04:03:30 +0000
Message-ID: <1f1377ebec26f767a4af9a0c542817be7cfaeddc.camel@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-11-jason-jh.lin@mediatek.com>
 <24b74989-4e31-49e3-8652-c2439f368b26@collabora.com>
In-Reply-To: <24b74989-4e31-49e3-8652-c2439f368b26@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7648:EE_
x-ms-office365-filtering-correlation-id: b3819e9e-a55f-4ffe-7d4d-08de11e9209a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RzZ3MTF2THFoYzZjZXJOcnpZRExqSmR6UElmT0xnY0hBL1FGRlMrOGt4MXc1?=
 =?utf-8?B?SVNSZk1odHFPTTZhcko5K21hdTNPUG5Zc3BqY1l6WlVaUVIxY29sdFFPeDJi?=
 =?utf-8?B?NGlHaUd4c0pTVDhYYVpzTE4xS1pMMS9LRElZS3JaTm9pQWpqTmozcTI5cXVB?=
 =?utf-8?B?Sm5BQkVleVU1R09IMThXc3Y0K2x1Rm5XWUtNQlgxZ3VtQnNPVEtYdFN4YUp3?=
 =?utf-8?B?Rk1FUEZSNkluYXA3UFRvWVlXNzBPWWYvWHNWS2g1N3R1M1hvUzJTU0pXQzZX?=
 =?utf-8?B?ZWx6aDQ0Tk9hVjk1UjFpckNBTStoUVpHbmtQS3kwK3paNFJ6OStncXF2azJT?=
 =?utf-8?B?aWFWSmppaFJjVTVGemZmNUZoR0VUYU1RN3RvMERabkRST3h5ZmpmWjN6Wm5U?=
 =?utf-8?B?RGtIUVZvUjhBcVJ0UkM0V2FoRXZIYXkyemJpL25QakdZV3ZjM3JsQSsrRS9T?=
 =?utf-8?B?c3VaS2NwRjErYXVTbmJsbVBQMjRvTi91a2d1NWdmbjExNUNUdXQwRHJMbmJr?=
 =?utf-8?B?WGNsbDl0ZncvZ1huL3JwdE1GQ3l2Yi9jbHpCZ2Zhb2NvRDU3dTdPS2U3LzZq?=
 =?utf-8?B?ZTBlQ20yNVRLd1FKRE9EdENxdHN0emkzY0ticmptd3NoVmpvVmlDRUthZUow?=
 =?utf-8?B?cWdNc3Zicm1pM2tlT1NwN1pVL2ZFbEx6UmFNNW9zOU1uOTV5enBkaU1Sc1FM?=
 =?utf-8?B?QUIwaUNDSzdSRE9sMk1jQW92UmJucnc2dFJJWXE1eUtBR3FWcUxPRUlJcHFL?=
 =?utf-8?B?c3kzcVpPWTd4ZlVsTFo4dHdCYW0yMXdBUUlSbWgvUmxVNGpFRWNqK2RoYkUv?=
 =?utf-8?B?WThOY1YxUmNUZklVQXJIaXVsUThQR0tGeHprUVdOVGFSM0NFN0ZjeVFJSSt3?=
 =?utf-8?B?aFd3UGRNWTU1aVp3eDl3Q3JVYjlKV1IwZ1htWlNIMUVUUVVZMzRKRFJTa0dB?=
 =?utf-8?B?U1hnanAxaVJiYXVFTkVqSUxqdHpRMElwY04ya1pncy9mUFJCUitseU9zeHNr?=
 =?utf-8?B?RlcrL3pkdVJod3VvSTNBN2FyUVJ2MXdTYkRTY01FbGs3Y0t1MGNnK096aWk0?=
 =?utf-8?B?SnltYTVFTXdlQzNCZFZlT3VPcHovMnFHUTVaSzdHekVIUG9WR1pzNkpLYk9G?=
 =?utf-8?B?czJKaGhXTGVMb1pLaXRZaVFkU1o4ZEtLbXlaa3MwbFBzWWNzRnMyaktJQ3g4?=
 =?utf-8?B?ekhZTEdBMlUvV2xjczEydW8vanBSdUxDajhtajBOVWxpZmxUYTBZdVBCMGV3?=
 =?utf-8?B?T0RCdHF6S1QzMDF6OVZGbm9CMEpZcGJzZ1E4WGhyVG9uUVpCeVU4aGcrVVJE?=
 =?utf-8?B?YTFaeWROY0NoUjVySzViQm5mZjlCTDVycTQvS1VyRHZpL1ZNK1JOcEdyN3lq?=
 =?utf-8?B?NUQzYjNQSHRsbGo4M2xVOWRqVkVQRmdJMHA1NkhLUitqeTdySDJZZ05ZVVBv?=
 =?utf-8?B?QkVvZ0J2V050NG01ZjBNMW90bXlkZE5NV2JqVXNiWjc5QUhURXFmMEVmKyt0?=
 =?utf-8?B?MENUNVl6TU44TUoxb01TeXkrbFBEd1NqOGN5WWdnTnhaSEtKRFk5bFMra3Fn?=
 =?utf-8?B?b0t4cmFwa1VXM1dyOEtpczJTbmxqQWwxZHBYdGRUZ3hmLytnVTRUeDJMWi9s?=
 =?utf-8?B?b3FLVXFEWkNpeTNGNnNwOExndnJwVjZmNnlTMFIzbmVmaU5tY2dzVlVwRWFr?=
 =?utf-8?B?M0h0V2xzWEFWUWZGK01lN2JsNVBKd3lIaHFMWlJqR2tkRWk4b0pyZXJVelJ5?=
 =?utf-8?B?Z2JVYW9kamJpU2hHTkR2YkhhZFFpWjVMZlRqa3orL2Jxc3QxWWJva0h5Z0Vr?=
 =?utf-8?B?RS9MekhVVTdhSnJ3ek9ETEJZbU43bWVDOHpjM01OUUo5U2NEeVgwZmFvU0RS?=
 =?utf-8?B?dGw4TThyak8xbGdPQWM4eGIwNHF4T0JNY2JlNzhVei9lQVd2VXZ3T1VFZjQ0?=
 =?utf-8?B?bmVYS2VjWlM4dklwNlVnTitFeUVmcTFOSzVNZHFMcTJxS0hTNmxPWGxISEx1?=
 =?utf-8?B?V3hncHNKVWtCeHFwczNtK2M2R0dNWWl5MjZaa1pNVERiaWpINklUQ2RaOTA4?=
 =?utf-8?Q?Eyf9np?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnVyRmZQanV4RmJRdDBaZ0J4VFJZNXdoVG5EdmdFN3RDakM4Q1MzVlZlUGlK?=
 =?utf-8?B?Y21Tcm5kV3RwTkhXYy80LzZ0S2t2aVBvUEVmMFVvNkF5MVpkU016Rm1VNkVo?=
 =?utf-8?B?Rjh0ck4zUlJOSk05MEdXay9aOFpQNStvUmltVGNmMkRYOUN3Y080ZnYwWnhr?=
 =?utf-8?B?VzJFSlUvazc1dm1yQUUySUtCZTBnRVBnSGNuYkNVZ1Ewd1VKZkJ4QUo5bmsx?=
 =?utf-8?B?T0IxaHF3SHlPQzFNRHpJbGlVTTNOQU9VUnlkcWNxS2FETmZVdWpQY1pIem5q?=
 =?utf-8?B?UXFDbVo3bnAxd0Vza2V3NW9JWFNQZFUrZ1lQYUhRNG9lNVU4c2M5MmxxS0Jm?=
 =?utf-8?B?RmRIQWFyZmhDWTdrRE9MV1doVy9DSlFyR1RPT0kzSWpqWnVlaElFU0dZaWMy?=
 =?utf-8?B?bXNWdTNrYlFJM0Nab0lkeFMrclNya1I5UW1yaTI0VDAvZHB3OGdQTHJ1eGVO?=
 =?utf-8?B?TXBaeTBTeFQ1SkViZHd0VVdEL0VSL2ZNZGtKZFQwMXJ4N0RsVXVnVXdCckVH?=
 =?utf-8?B?QmM0SFZmc0pVRmIrdm10N0IvME50bi9rQU90VS9yVkI4Um9veHBZSGtVL0JP?=
 =?utf-8?B?Sis4aTY3Rlg0UjhCS2Nqa0tra3FiNCtQaDM2SStadkllNmtuOTNCRnZDUFFv?=
 =?utf-8?B?OGZGY0ZKeWh1dDRWQlYwNEtHMnNYOEQ4Y2IwajZmOWR1ZHUzVno1U2t6K2dw?=
 =?utf-8?B?OHFGYWpDYzlpRUZlRTR3RGFGK3pLSFl2V0p6MjBTMkZUei9wNExrdVpPSkdI?=
 =?utf-8?B?Mk1iWTJjWnFKM0E2ei9GWXFQemszelhJQTVWZ0l3UFQ0LzRRSG5KRDd5Uk40?=
 =?utf-8?B?dzFENXEzeklkb3dSVWVUc0g1TkhPZEFmRE5wWWNyV3JURmg4OHBNbCtOMDVh?=
 =?utf-8?B?YVAxSGNGeERHNWxKeTJYT3pGTytabk5sbWNuSW5qemtRWjJPeE5CNmdqY0pX?=
 =?utf-8?B?elBrRExoclgzTE0yb1NEZ1BwcnhrdnpUQWFiSHR6NXJoTWRacWdUNXViMEcy?=
 =?utf-8?B?VWdQMlFBNkt0VXF1V1RLRWY1WjVpbHNIdGkwMVhzTFpKS2o0N1UvWEhBRzUx?=
 =?utf-8?B?emUvVmYyNEhiNTlUb1RSemdGK0VENFNBaXlwRGo0dVB4ZG5lSndZZDBzdncw?=
 =?utf-8?B?VjRlNE1MNExmN3FjbDBQMllITVVieStGaDN2WVZUMUJlOFpqcGViVFJwTHQ5?=
 =?utf-8?B?NXZvZ0NpclYvUTh3QUJMSml6WVIwSkpDMk9ObWo5aVIvdU5ialJPOGRGT25i?=
 =?utf-8?B?NXNNNmtsY3JuVVppMHorSUdBYXo4UGFlTXREcUpPdWJtTUg4WHV6amEwSXRy?=
 =?utf-8?B?cEJST2ErK3hqRVBYMmw1YSt5YmdmT1RKUGsyNE80WDhzUEUxSW8wYW05QTNh?=
 =?utf-8?B?djlCRXN6elRoRWZKRU5tWlRLQlBIN3JjbzRlcURBQTZRVDFLVU1nVXU2RGRx?=
 =?utf-8?B?Q1RseWJBLzdnNUV5UHJzUndnc2g0MEoxdGdYYUk2Sk9YbnRvSWQxalZPNnpx?=
 =?utf-8?B?YzVSMDZ1TGdic3lZRElUeUhYTjhIbURYL3J2Y3dBYklUbGt6ZnN6VUtuajFq?=
 =?utf-8?B?OTh0TjBrdXpsSUtBMDdadVRiVVVwNUFoUjByRGFxRmRzZ3JuQzA0NU9OSGNa?=
 =?utf-8?B?azJ1NUtXNEpZZzhrSWdBMzZjem90ZkN3cVQwYWpNaHhkcWRoZmxXMktDMHFC?=
 =?utf-8?B?STMxbGUrMENYbUdiK3V4ZXBvc2xTZ1liSDFvTUN4cDF2N2NocVlPMnZjcDFz?=
 =?utf-8?B?OFlUVGErUHVnYytJZUEvMHU0aVpoczl2ODZHWmQ2UTN1WDExSTJyangxalh0?=
 =?utf-8?B?K0QvYW9RdWRnRG5DNm1vc2U5WUpmdEMwdlg2REF4ek5uN2gxSVRJa01CMlhh?=
 =?utf-8?B?ZzRCT3AybnpZMm1BbDFBTW1HUzNKQnpIZjkvc1pkMEJyazlHNUlKaFFrUGt4?=
 =?utf-8?B?RytnaTRGb1hPVWZxTDhrd0M3VWpOaFF4bnJnVVF4RGg2SUNQY0w3NUtsbTNy?=
 =?utf-8?B?VWlWM1I4aUNDdVVYNU5Ram9Qai95Q3g1MUlrbyt3Qlc4OGpHc3BwSGNaYWd0?=
 =?utf-8?B?c09SNjN1TXlJajdwb3Z3ZEdrL0J0eklsQkZGRkNXUEtJV1k5VWIvTlpESFZz?=
 =?utf-8?B?OVBMYXlZTk1JWkNNMWN3YkM5SjE3VEVFajlNVVlicmd2UFlqTytTTWxsT2Zx?=
 =?utf-8?B?Q1E9PQ==?=
Content-ID: <01CDF255CEB34A4892FCB26841DFDDB8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3819e9e-a55f-4ffe-7d4d-08de11e9209a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 04:03:30.4813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWD25JoYJxCO7VyYDN12tLwW2A7mcEywGI0BeWKVg3X1AAaeAKBgFg3KTLC7FiR95KdI9evQwvGCoRn9vH2aDNihjsR6PCLfo6+lzrV7TlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7648
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_114629093.592676228"
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

--__=_Part_Boundary_002_114629093.592676228
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTEwLTIwIGF0IDEyOjA0ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTcvMTAvMjUgMDg6NDQsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFRoaXMgcGF0Y2ggZXh0ZW5kcyB0aGUgY21kcV9wa3Rf
d3JpdGUgQVBJIHRvIHN1cHBvcnQgU29DcyB0aGF0IGRvDQo+ID4gbm90DQo+ID4gaGF2ZSBzdWJz
eXMgSUQgbWFwcGluZyBieSBpbnRyb2R1Y2luZyBuZXcgcmVnaXN0ZXIgd3JpdGUgQVBJczoNCj4g
PiAtIGNtZHFfcGt0X3dyaXRlX3BhKCkgYW5kIGNtZHFfcGt0X3dyaXRlX3N1YnN5cygpIHJlcGxh
Y2UNCj4gPiDCoMKgIGNtZHFfcGt0X3dyaXRlKCkNCj4gPiAtIGNtZHFfcGt0X3dyaXRlX21hc2tf
cGEoKSBhbmQgY21kcV9wa3Rfd3JpdGVfbWFza19zdWJzeXMoKSByZXBsYWNlDQo+ID4gwqDCoCBj
bWRxX3BrdF93cml0ZV9tYXNrKCkNCj4gPiANCj4gPiBUbyBlbnN1cmUgY29uc2lzdGVudCBmdW5j
dGlvbiBwb2ludGVyIGludGVyZmFjZXMsIGJvdGgNCj4gPiBjbWRxX3BrdF93cml0ZV9wYSgpIGFu
ZCBjbWRxX3BrdF93cml0ZV9zdWJzeXMoKSBwcm92aWRlIHN1YnN5cyBhbmQNCj4gPiBwYV9iYXNl
IHBhcmFtZXRlcnMuIFRoaXMgdW5pZmllcyBob3cgcmVnaXN0ZXIgd3JpdGVzIGFyZSBpbnZva2Vk
LA0KPiA+IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBzdWJzeXMgSUQgaXMgc3VwcG9ydGVkIGJ5IHRo
ZSBkZXZpY2UuDQo+ID4gDQo+ID4gQWxsIEdDRXMgc3VwcG9ydCB3cml0aW5nIHJlZ2lzdGVycyBi
eSBQQSAod2l0aCBtYXNrKSB3aXRob3V0DQo+ID4gc3Vic3lzLA0KPiA+IGJ1dCB0aGlzIHJlcXVp
cmVzIGV4dHJhIEdDRSBpbnN0cnVjdGlvbnMgdG8gY29udmVydCB0aGUgUEEgaW50byBhDQo+ID4g
R0NFDQo+ID4gcmVhZGFibGUgZm9ybWF0LCByZWR1Y2luZyBwZXJmb3JtYW5jZSBjb21wYXJlZCB0
byB1c2luZyBzdWJzeXMNCj4gPiBkaXJlY3RseS4NCj4gPiBUaGVyZWZvcmUsIHN1YnN5cyBpcyBw
cmVmZXJyZWQgZm9yIHJlZ2lzdGVyIHdyaXRlcyB3aGVuIGF2YWlsYWJsZS4NCj4gPiANCj4gPiBB
UEkgZG9jdW1lbnRhdGlvbiBhbmQgZnVuY3Rpb24gcG9pbnRlciBkZWNsYXJhdGlvbnMgaW4NCj4g
PiBjbWRxX2NsaWVudF9yZWcNCj4gPiBoYXZlIGJlZW4gdXBkYXRlZC4gVGhlIG9yaWdpbmFsIHdy
aXRlIEFQSXMgd2lsbCBiZSByZW1vdmVkIGFmdGVyDQo+ID4gYWxsDQo+ID4gQ01EUSB1c2VycyB0
cmFuc2l0aW9uIHRvIHRoZSBuZXcgaW50ZXJmYWNlcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4g
wqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMgfCA1NCArKysrKysrKysr
KysrKysrKw0KPiA+IMKgIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmjCoCB8
IDgzDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoCAyIGZpbGVzIGNoYW5n
ZWQsIDEzNyBpbnNlcnRpb25zKCspDQo+ID4gDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQo+ID4gYi9pbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstY21kcS5oDQo+ID4gaW5kZXggMTU0ZDA1MTFhMGFkLi5mNmRjNDNjMDM2YmQg
MTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaA0K
PiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgNCj4gPiBAQCAt
NTcsNiArNTcsMTAgQEAgc3RydWN0IGNtZHFfY2xpZW50X3JlZyB7DQo+ID4gwqDCoMKgwqDCoCBw
aHlzX2FkZHJfdCBwYV9iYXNlOw0KPiA+IMKgwqDCoMKgwqAgdTE2IG9mZnNldDsNCj4gPiDCoMKg
wqDCoMKgIHUxNiBzaXplOw0KPiA+ICvCoMKgwqDCoCBpbnQgKCpyZWdfd3JpdGUpKHN0cnVjdCBj
bWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMsIHUzMg0KPiA+IHBhX2Jhc2UsDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUp
Ow0KPiANCj4gKCpwa3Rfd3JpdGUpDQo+IA0KPiA+ICvCoMKgwqDCoCBpbnQgKCpyZWdfd3JpdGVf
bWFzaykoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTMyDQo+ID4gcGFfYmFzZSwN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUsIHUzMiBtYXNrKTsNCj4gDQo+ICgqcGt0X3dyaXRlX21h
c2spDQo+IA0KPiB0aG9zZSBuYW1lcyBtYWtlIGEgbG90IG1vcmUgc2Vuc2UuDQo+IA0KSGkgQW5n
ZWxvLA0KDQpUaGUgcmVhc29uIHdoeSBJIHVzZSByZWdfd3JpdGUvcmVnX3dyaXRlX21hc2sgaXMg
dG8gaW1wbHkgdGhlc2UgQVBJcw0Kb25seSBwcm92aWRlIHdyaXRpbmcgSFcgcmVnaXN0ZXIgYWRk
cmVzcyBmdW5jdGlvbiwgbm90IHdyaXRpbmcgRFJBTQ0KYWRkcmVzcy4NClNvIHdlIGRvbid0IG5l
ZWQgdG8gY2FyZSBhYm91dCBtbWluZnJhX29mZnNldCBpbiB0aGVzZSBBUElzLg0KDQpJIGNhbiBh
ZGQgY29tbWVudCBmb3IgdGhpcy4NCg0KV2hhdCBkbyB5b3UgdGhpbms/DQpPciBzaG91bGQgSSBj
aGFuZ2UgaXRzIG5hbWUgdG8gcGt0X3dyaXRlL3BrdF93cml0ZV9hbXNrPw0KDQpSZWdhcmRzLA0K
SmFzb24tSkggTGluDQoNCj4gQWZ0ZXIgYXBwbHlpbmcgdGhlIHJlcXVlc3RlZCBjaGFuZ2VzLA0K
PiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vDQo+IDxhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IA0KPiA+IMKgIH07DQoNCg==

--__=_Part_Boundary_002_114629093.592676228
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMTAtMjAmIzMyO2F0
JiMzMjsxMjowNCYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMz
Mjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3Im
IzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZl
JiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRl
bnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SWwmIzMyOzE3LzEwLzI1JiMzMjsw
ODo0NCwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7VGhpcyYjMzI7cGF0Y2gmIzMyO2V4dGVuZHMmIzMyO3RoZSYjMzI7Y21kcV9wa3Rf
d3JpdGUmIzMyO0FQSSYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO1NvQ3MmIzMyO3RoYXQmIzMyO2Rv
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtub3QNCiZndDsmIzMyOyZndDsmIzMyO2hhdmUmIzMyO3N1YnN5
cyYjMzI7SUQmIzMyO21hcHBpbmcmIzMyO2J5JiMzMjtpbnRyb2R1Y2luZyYjMzI7bmV3JiMzMjty
ZWdpc3RlciYjMzI7d3JpdGUmIzMyO0FQSXM6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMzMjtjbWRx
X3BrdF93cml0ZV9wYSgpJiMzMjthbmQmIzMyO2NtZHFfcGt0X3dyaXRlX3N1YnN5cygpJiMzMjty
ZXBsYWNlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzMyO2NtZHFfcGt0X3dyaXRl
KCkNCiZndDsmIzMyOyZndDsmIzMyOy0mIzMyO2NtZHFfcGt0X3dyaXRlX21hc2tfcGEoKSYjMzI7
YW5kJiMzMjtjbWRxX3BrdF93cml0ZV9tYXNrX3N1YnN5cygpJiMzMjtyZXBsYWNlDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzMyO2NtZHFfcGt0X3dyaXRlX21hc2soKQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUbyYjMzI7ZW5zdXJlJiMzMjtjb25zaXN0
ZW50JiMzMjtmdW5jdGlvbiYjMzI7cG9pbnRlciYjMzI7aW50ZXJmYWNlcywmIzMyO2JvdGgNCiZn
dDsmIzMyOyZndDsmIzMyO2NtZHFfcGt0X3dyaXRlX3BhKCkmIzMyO2FuZCYjMzI7Y21kcV9wa3Rf
d3JpdGVfc3Vic3lzKCkmIzMyO3Byb3ZpZGUmIzMyO3N1YnN5cyYjMzI7YW5kDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtwYV9iYXNlJiMzMjtwYXJhbWV0ZXJzLiYjMzI7VGhpcyYjMzI7dW5pZmllcyYjMzI7
aG93JiMzMjtyZWdpc3RlciYjMzI7d3JpdGVzJiMzMjthcmUmIzMyO2ludm9rZWQsDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtyZWdhcmRsZXNzJiMzMjtvZiYjMzI7d2hldGhlciYjMzI7c3Vic3lzJiMzMjtJ
RCYjMzI7aXMmIzMyO3N1cHBvcnRlZCYjMzI7YnkmIzMyO3RoZSYjMzI7ZGV2aWNlLg0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtBbGwmIzMyO0dDRXMmIzMyO3N1cHBvcnQm
IzMyO3dyaXRpbmcmIzMyO3JlZ2lzdGVycyYjMzI7YnkmIzMyO1BBJiMzMjsod2l0aCYjMzI7bWFz
aykmIzMyO3dpdGhvdXQNCiZndDsmIzMyOyZndDsmIzMyO3N1YnN5cywNCiZndDsmIzMyOyZndDsm
IzMyO2J1dCYjMzI7dGhpcyYjMzI7cmVxdWlyZXMmIzMyO2V4dHJhJiMzMjtHQ0UmIzMyO2luc3Ry
dWN0aW9ucyYjMzI7dG8mIzMyO2NvbnZlcnQmIzMyO3RoZSYjMzI7UEEmIzMyO2ludG8mIzMyO2EN
CiZndDsmIzMyOyZndDsmIzMyO0dDRQ0KJmd0OyYjMzI7Jmd0OyYjMzI7cmVhZGFibGUmIzMyO2Zv
cm1hdCwmIzMyO3JlZHVjaW5nJiMzMjtwZXJmb3JtYW5jZSYjMzI7Y29tcGFyZWQmIzMyO3RvJiMz
Mjt1c2luZyYjMzI7c3Vic3lzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaXJlY3RseS4NCiZndDsmIzMy
OyZndDsmIzMyO1RoZXJlZm9yZSwmIzMyO3N1YnN5cyYjMzI7aXMmIzMyO3ByZWZlcnJlZCYjMzI7
Zm9yJiMzMjtyZWdpc3RlciYjMzI7d3JpdGVzJiMzMjt3aGVuJiMzMjthdmFpbGFibGUuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0FQSSYjMzI7ZG9jdW1lbnRhdGlvbiYj
MzI7YW5kJiMzMjtmdW5jdGlvbiYjMzI7cG9pbnRlciYjMzI7ZGVjbGFyYXRpb25zJiMzMjtpbg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Y21kcV9jbGllbnRfcmVnDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtoYXZl
JiMzMjtiZWVuJiMzMjt1cGRhdGVkLiYjMzI7VGhlJiMzMjtvcmlnaW5hbCYjMzI7d3JpdGUmIzMy
O0FQSXMmIzMyO3dpbGwmIzMyO2JlJiMzMjtyZW1vdmVkJiMzMjthZnRlcg0KJmd0OyYjMzI7Jmd0
OyYjMzI7YWxsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDTURRJiMzMjt1c2VycyYjMzI7dHJhbnNpdGlv
biYjMzI7dG8mIzMyO3RoZSYjMzI7bmV3JiMzMjtpbnRlcmZhY2VzLg0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkgmIzMyO0xp
biYjMzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjstLS0NCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMzI7ZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEtaGVscGVyLmMmIzMyO3wmIzMyOzU0JiMzMjsrKysrKysrKysrKysrKysrKw0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMzMjtpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
Y21kcS5oJiMxNjA7JiMzMjt8JiMzMjs4Mw0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrKysrKysrKysr
KysrKysrKysrKysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMzI7MiYjMzI7ZmlsZXMm
IzMyO2NoYW5nZWQsJiMzMjsxMzcmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9pbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2lu
Y2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgNCiZndDsmIzMyOyZndDsmIzMyO2lu
ZGV4JiMzMjsxNTRkMDUxMWEwYWQuLmY2ZGM0M2MwMzZiZCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjstLS0mIzMyO2EvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaA0K
Jmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1jbWRxLmgNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNTcsNiYjMzI7KzU3LDEwJiMzMjtA
QCYjMzI7c3RydWN0JiMzMjtjbWRxX2NsaWVudF9yZWcmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMy
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7cGh5c19hZGRyX3QmIzMyO3BhX2Jh
c2U7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMy
O3UxNiYjMzI7b2Zmc2V0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMzMjt1MTYmIzMyO3NpemU7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMzMjtpbnQmIzMyOygqcmVnX3dyaXRlKShzdHJ1Y3QmIzMyO2NtZHFf
cGt0JiMzMjsqcGt0LCYjMzI7dTgmIzMyO3N1YnN5cywmIzMyO3UzMg0KJmd0OyYjMzI7Jmd0OyYj
MzI7cGFfYmFzZSwNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3UxNiYjMzI7
b2Zmc2V0LCYjMzI7dTMyJiMzMjt2YWx1ZSk7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOygqcGt0X3dy
aXRlKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMzMjtpbnQmIzMyOygqcmVnX3dyaXRlX21hc2spKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMy
Oypwa3QsJiMzMjt1OCYjMzI7c3Vic3lzLCYjMzI7dTMyDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwYV9i
YXNlLA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMzI7dTE2JiMzMjtvZmZzZXQsJiMzMjt1MzImIzMyO3ZhbHVlLCYjMzI7dTMy
JiMzMjttYXNrKTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7KCpwa3Rfd3JpdGVfbWFzaykNCiZndDsm
IzMyOw0KJmd0OyYjMzI7dGhvc2UmIzMyO25hbWVzJiMzMjttYWtlJiMzMjthJiMzMjtsb3QmIzMy
O21vcmUmIzMyO3NlbnNlLg0KJmd0OyYjMzI7DQpIaSYjMzI7QW5nZWxvLA0KDQpUaGUmIzMyO3Jl
YXNvbiYjMzI7d2h5JiMzMjtJJiMzMjt1c2UmIzMyO3JlZ193cml0ZS9yZWdfd3JpdGVfbWFzayYj
MzI7aXMmIzMyO3RvJiMzMjtpbXBseSYjMzI7dGhlc2UmIzMyO0FQSXMNCm9ubHkmIzMyO3Byb3Zp
ZGUmIzMyO3dyaXRpbmcmIzMyO0hXJiMzMjtyZWdpc3RlciYjMzI7YWRkcmVzcyYjMzI7ZnVuY3Rp
b24sJiMzMjtub3QmIzMyO3dyaXRpbmcmIzMyO0RSQU0NCmFkZHJlc3MuDQpTbyYjMzI7d2UmIzMy
O2RvbiYjMzk7dCYjMzI7bmVlZCYjMzI7dG8mIzMyO2NhcmUmIzMyO2Fib3V0JiMzMjttbWluZnJh
X29mZnNldCYjMzI7aW4mIzMyO3RoZXNlJiMzMjtBUElzLg0KDQpJJiMzMjtjYW4mIzMyO2FkZCYj
MzI7Y29tbWVudCYjMzI7Zm9yJiMzMjt0aGlzLg0KDQpXaGF0JiMzMjtkbyYjMzI7eW91JiMzMjt0
aGluayYjNjM7DQpPciYjMzI7c2hvdWxkJiMzMjtJJiMzMjtjaGFuZ2UmIzMyO2l0cyYjMzI7bmFt
ZSYjMzI7dG8mIzMyO3BrdF93cml0ZS9wa3Rfd3JpdGVfYW1zayYjNjM7DQoNClJlZ2FyZHMsDQpK
YXNvbi1KSCYjMzI7TGluDQoNCiZndDsmIzMyO0FmdGVyJiMzMjthcHBseWluZyYjMzI7dGhlJiMz
MjtyZXF1ZXN0ZWQmIzMyO2NoYW5nZXMsDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Jldmlld2VkLWJ5
OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubw0KJmd0OyYjMzI7Jmx0O2Fu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMzMjt9Ow0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0
YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBv
ciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdz
LiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQg
cmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJp
bnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRz
IA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRl
ZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_114629093.592676228--

