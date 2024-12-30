Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191659FE1FC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABC010E008;
	Mon, 30 Dec 2024 02:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YPiSIXHF";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="i3qiPDFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966DD10E461
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:25:15 +0000 (UTC)
X-UUID: 48af14fac65511efbd192953cf12861f-20241230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+KyAj85zpLtP+V9XPc6UuyqNQoOJy9K9f1YOi0jgo5E=; 
 b=YPiSIXHFP/91rqWx7E3ZDfv4T5wYzHti0xnQxFXezZizoGha2GQi8EPr2Ucjma1Qjtq0Wf7EZWvaCl5s11c98kmrXHVg7+HVUxAvFIaFOmgaDi7nKAszSMuEwNk0s5NHW2VeTPIuUbfj/hqCz3qOH1CKbHMbT3BNMDk8L7gm2+c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:ce71763c-ed2b-4b18-a08a-bb047ded08c3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:e4a46025-8650-4337-bf57-045b64170f0c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 48af14fac65511efbd192953cf12861f-20241230
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1942925998; Mon, 30 Dec 2024 10:25:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Dec 2024 10:25:05 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Dec 2024 10:25:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJdQ8J6pbUl1aCNdfOsKdkDIGIuZa8rIE9nCzooQ5wOZ/DpcYPyZDCG3T+UX5FwUyStFF+6i2G4J/FYQKU/epblvrDrWKV/EQrLFcz+6kOkUgivW5VYBQ7PQclmj9XilPM/iYEaEgC0bEG3DjNH838Wy6QXq6anJ42Daq04+BdR4wPfr8+fU9kTFfM0jrUEOG9z90AugfQr+0Jf5/qOrI4ZRVCigrkurOe/efYLKA6VvLGmp9XNAY5UBGu2vg4GCXVRZ35DGVyrsxWZ6vTOiftWZnok84xCOsGxVETxd4P5doM15IQaNPa+aUq0RHfuvEyw2xX1FnP1LxI7UaBzeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtHQfn9mq5235jmp09fn7liNtg+jBmVpJekh7QzktA8=;
 b=FRyaQYOIJmiO1BhY/s9nUr32Kz51ZmMy0WAnmXRUeMscBAUxmfiIqdIt40CzLrp3bD8QfgbPq+oS+Im7VoOGZLtQYnz+FvP+LRxMirsVd5FquIyIrC/vcub9p64GmlZu6KoeevXRD9BKRRQqhYgK0s1cBDzwe+638P7tbLh8oU1aq6vhshXpKnIgw6Y7xSSZP4ak0K6vMWOOt8GDMMv3lLfWndwZvzhHzYTSJQ1eoD7oqrdyiHB1LF4KE3+DE0S0vd88m+9IBWAWC5uSJpsY6kBbXH75vZhZyw6BeAhNGQBeU0VA4uyRinA5NKTWU2jW+13cnIRDS/YKtYWAqDGNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtHQfn9mq5235jmp09fn7liNtg+jBmVpJekh7QzktA8=;
 b=i3qiPDFytrrdNTNE2OtN4gmsprIGsi9qGVzsdygtOQXadW7YAg+I+qj6BESmJ5vOiZBse6/XGNDa3WBJm5ogeozDQljnCuVjcBp6b4lmiwQiAsudxEabyVk1g992DTb86znbEwA1w4wOSoMw4Gl3Hrw5vqmNkV+KBRhimfe+HqU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6878.apcprd03.prod.outlook.com (2603:1096:101:b7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:25:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:25:02 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
 <robh@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mchehab@kernel.org" <mchehab@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
Thread-Topic: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Thread-Index: AQHbUjifwIYL/sR61UKff0WQOKSFC7L5yV2AgARWP4A=
Date: Mon, 30 Dec 2024 02:25:02 +0000
Message-ID: <11d058874ec4d9302bbc25a69a8de63e56dc8f64.camel@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
 <gfopo2xjqljehbwkrxlf2t3vqwrqi4namh7dlt2rf4bc4ri25k@xm7pawszl4ix>
In-Reply-To: <gfopo2xjqljehbwkrxlf2t3vqwrqi4namh7dlt2rf4bc4ri25k@xm7pawszl4ix>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6878:EE_
x-ms-office365-filtering-correlation-id: 4751423e-2053-486b-d08f-08dd28792a71
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RTR6OVNhYkNIT3A0QWcwNDR3VXY2akFXY3hGQm1WdDJKSDA2UDVTbE4yOWZw?=
 =?utf-8?B?Qm5yb09qbkRhNVpmTmhSWWR4bW5IVElhVDhBTmpOdm9RYzNPVXZwdlg5dFFJ?=
 =?utf-8?B?djk3QkQxNnRmUUFSR3pBbVg2a2NVWmlFS1VKdzZRckE1UlAwNDUyNWZ4QktS?=
 =?utf-8?B?Q0krZGprUWR5cjNiQmVJMitYNmRNL2Q1dlhXdXozTXFYZkdabEJPN3VHWjhy?=
 =?utf-8?B?bmxJVGpyZDFoSGZJTDdwRmtSNTNxUXRJc29mR3V2SHgrd2U0dXYwVWE0aSt3?=
 =?utf-8?B?UENpTUhhRzhMdThPUERCSWNUOWh0TzFUSUYzZGpNby9TU25DcndPTFJnYkJr?=
 =?utf-8?B?OEVsQllqcmVEdFdJZHhSbkNZOWcxSitaajlLeEt3ejd4bFRMLzBBM2NFVWV4?=
 =?utf-8?B?TEw0aTJ4MU8rUVBRL1hld1VhUWJzbTA0a2xaYVdJWVZITVJja00rTmtSZlNj?=
 =?utf-8?B?UVc5cnM2Njc3djdseEV6d2pRemVYMDhpWjdnS20yUFo4bGVQdWY2TGhqWVRQ?=
 =?utf-8?B?dGEzNEtrZ05tdkd6NWkwOSt3UTRXR2JGTzlZM2RJemlhWExKQlBCNy9kSW5a?=
 =?utf-8?B?eDBJUllRdTIrc0lzdklSTTVmY0cyWGVjK0MwNEV6RXZ6VDZsNFNVR3RwblJC?=
 =?utf-8?B?OEUvRFBuNXdQVUJYNDBuZXg1dVg4L21ZUkp3S1JoREMveGZlUXNuSzNQMUpC?=
 =?utf-8?B?UjVUYkVnOHNxT1ROTVI4Tnh2SDlsY0Q3UjdNQVNycFN6S3k4a3l5SHdNeUNq?=
 =?utf-8?B?VUpXVnAwQXY1elhqb0F2eGZEWUVUVGxNL0RkVVV1V2x5VUcrZDhxUWxuR0dJ?=
 =?utf-8?B?S1FhQTd2MVlicnd0TmlwNFpIWitlNnVzRFdTZ1VrZ0NGNWFacGs3VmtaMjhN?=
 =?utf-8?B?aHVsN2tYOWhuSmJ5ZTRtNVFRY3JjZGJHeGNZZ2NLRk52N0VVQmY4OC9Bd2pp?=
 =?utf-8?B?K2h0b00xM205REcxT2dpYWtkVjlPT0ZtVlJjeGJwd2FYRDdiTDFjMWpMZmxM?=
 =?utf-8?B?M2puaXFLRzFlSmNOd0ExS0lHUVFiNnJFeWxoSlhyZDJ3bk12cXoxdEJ4U0dS?=
 =?utf-8?B?QnVPWUVQdE05UFNKS2F1TGpQcDl6cHJDMm0vTVNaSTFuM1dBK3B4MEJsajY2?=
 =?utf-8?B?WVVhK05Pc2lyQ0pPcjBlM1dPcG9ZNDhqQm9QWXdPZHkzQnpQT05yUlBIYmg0?=
 =?utf-8?B?SFgvczdOM0JMRlhVNUJiZXpwMGZEelNuMWRCcW00eHkzcHVvV3RBZUc4dDZx?=
 =?utf-8?B?NkxqM2N1QlF1SWI2TXRIWFZqVkpHa1ZJNVNLSHpnZXR3clJlczA4MmlYQ2Mr?=
 =?utf-8?B?bTFwSDA1WGlNOGgrVWZETFVqL1Q3M01WYUM0OUNxWUFLU0Z1MjU0N1p0b3JH?=
 =?utf-8?B?UVU4emFoaytzcGViWEpqMDY3MGZEaU5XbkwrWm1RUlZaNHFqY0Z2VkpGcCs3?=
 =?utf-8?B?Y3kvMndCRWFPcUFJRXhxUDhKTkoweTVRV1RJZSs5ZG92YnJRVzM0ZCtBOERo?=
 =?utf-8?B?TWdXV09SUFk1UmprbDB2Z3VTOWJ2OUVMWngrb0hRWW5uZUh4dlB2dFNUK0Ez?=
 =?utf-8?B?Yit6eXdxNy9BQU5QYVl5SDkyTVk3aUZkejA4SDQwdUw4R2szQmRZMkhCbjZM?=
 =?utf-8?B?R0NSampuc3Z4UmZwK0ttMnphSlBVUXJVQWF6c2duQWpBMTV0QkhQRTZiUzQ4?=
 =?utf-8?B?ZXlScS9Lb2xyRXRpbXRjS1R1WXhVKzh2MTNpVi9SdW9XdHBHVWpIbUFkc2ZF?=
 =?utf-8?B?UEJDNEZCdlZMZHdjSlJrbk9aNTN0OWU1dWQrYVlQQVd4YTg4YTA5UmtFdzYz?=
 =?utf-8?B?Unc2SDJjS2owZlBmTzlmVDR4T1U1bFJYZEZDdU02SDloSmZuUjEvRUVoTXlq?=
 =?utf-8?B?aG14bzNMZ1dqalZ0R2Zzd3NMMTQ4R1l0Ri9kZ05TMmRwOFZSWUQ1WGtqd0RV?=
 =?utf-8?Q?wxuV+Hl0/i4YGMaQgDbbmltGTxnbQ15P?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEJ4U1BYUFNZQ3g4aDA2Q1RVQVhVbUYrcjJWbjdQM2N1Vkg2SVBPTEFBVC9Z?=
 =?utf-8?B?RkhLUThXd1ZFSmQvVFJLYWJPd2NoeVVScnJzZHRLQm5lWXQwRG1sSjQ3NFRa?=
 =?utf-8?B?N2RIbGhzYzRWOXBkSmlMRTBYcXNwR3krTXVOQTdYWVdrZjNnS2NLSlhNOWJa?=
 =?utf-8?B?OEdXMnpKdFZsSmViVFRlb3diT1pKSjVXOWx0RlFqYzBERGpMMTM4bWJEbWFC?=
 =?utf-8?B?V1E2bjllc2FlMVQ0R1RpTXJEM1RueVZwYzl1aFh0NmtCSFpiUFNvcWtJMjJk?=
 =?utf-8?B?QmZrR00wWVBCL21QdEdUN3N5YVVPOFU1SnJaZXErUmI1WS9OaEJYN05lZWFO?=
 =?utf-8?B?ODhXM3JFaU1SNCt2cmovaUNGZ1BRYVBYaHoydjY0N3Z1S3NPdUJtWkliR2xJ?=
 =?utf-8?B?Y1NXWDdkdkRJV09EQ0RCQVJia0cwbCtUaTVTa0Q0WHFRbi9tMUs0K211RWxD?=
 =?utf-8?B?alcySTI0Szd4VU5pRmhxbXV5QUwyVktSbnBreVJKUlNyUE1EZlR6NEUzcVJm?=
 =?utf-8?B?UE1KU2NZUFJMa3VwTXpHV3IzVXQrR3YvbituUFRVNE9JcVdwZXpjYnFVODFj?=
 =?utf-8?B?ZFErQXdRYkVzQ0JDWWF5bHo5eEtzdEQ1Yjdpd1A0UkZvMDJiUkF0UTBYMEVq?=
 =?utf-8?B?b1oyMGNFTldNN1RLRGpkay9CNWp4TUZoQ1o3VS9xd04vVTBzYW9RVUljcXlZ?=
 =?utf-8?B?YTFlRm1hTUdQWHBmdm4wQUw5QkhwRUpIcGNjQ2dJTDNxZnVmMnhMRVVlbWVF?=
 =?utf-8?B?MnZTd2JvdU01dEdUaGRiZ2ZudzIvWlQrWjczcUFsS3Q0TnFQUmRKcmV4eHht?=
 =?utf-8?B?SHhqclBSeXFRa3dXVktodW5ubFNFeklnWGxLcmV1WFhLdGtOVm5HcWNJeTRS?=
 =?utf-8?B?ajFkUjFGVDZNdVhMNnU0dWRiNUtCdGhZdStoN0Y1QlJ6ZGhNS1EvekNvaVdu?=
 =?utf-8?B?ZTJIZFdGMU9NYnZLVkdWZDBsWnNkbCtST2lXZnVza2tpendJVGtsNDZHZUdr?=
 =?utf-8?B?QytPTmdWeDVZdko5SWVWcm8wMmo5MVk1RGdHdFAzVDB2SDVKWktKK3ZjTkNZ?=
 =?utf-8?B?dzE4akFqaGpNNUNDTTIzVTBKZEJrR2QzdDdMVmszbzUyUGFZZ1RMZ05jckF6?=
 =?utf-8?B?Z2c1bjFDSWFHeGNuK1Q1M3NaTnVRaVBqd0xLZnNEdEk3L3dQYlR4Umo3YmZa?=
 =?utf-8?B?RFdOckE0L050ZG9kVWhqVmJEdmduSzNWMGZUR1VXYm1jeU42WnQwaG9qTGtI?=
 =?utf-8?B?QnBVWG4vZ1pNL0xSYzVNRFlzWXUzRG1rM2p2eFFBT2Vmd29RcXFqamUxQ1FJ?=
 =?utf-8?B?eHJZaHpFNGVUUmNTZmNNNE1UbnhvcjRxdC8xbEhXTENiT1N1WS94Q2xVTndu?=
 =?utf-8?B?U2h1S0JQajU2SkkyY1R4Z3hsTEhmUjJtZGtNT0VzYzB0blY1NDRIZ2Ird3Ro?=
 =?utf-8?B?bHlnRCtYT0lWSEUvUGllNUZUUGlSaDJFUmJseDBTbEEyUWtLODhQNVRzV0I0?=
 =?utf-8?B?MEZPNHV0bmlIOEVTaG5iS2JRSnRRbkwrd0JxNUJaeWMyWFBqcUVVckVBRHlV?=
 =?utf-8?B?Tm54OE1FTFpFMVlWdWs1cE1wWXNyRE0vSUt6VUJuNUVUM2VXdjBoMkVzd0pN?=
 =?utf-8?B?TFNXTkNnTXZMMmRTSTAzM3cxNm1HcFB0V2h5WWxnOUFVc1h0Wmkza2RPcTdr?=
 =?utf-8?B?S29ERHkyL2hYcC9sV0ZEcVJpVVVvL1FoTG5XVHdzQzRvLzlTcGxXdXF2QlZw?=
 =?utf-8?B?ckpsbGxFdUNxWlUvVjhnMnowWVAzTEdQNy9MSWNYL2RONXZMb0h0MmQ4MWRo?=
 =?utf-8?B?QklKdlhDZVRUc2ZzV1Z2R1lCZGUwOFFxdjZvc3FpQzBvUzRncXEyWVdGaGRZ?=
 =?utf-8?B?S3A1ZnpCb1NBOGltb0FYOEh1TDFuTGlaNGU3cWRPM0d0UWRjSHcydzNUU3pQ?=
 =?utf-8?B?NmVOUzY0WGRJb0NlKzNWMXk2cWNRRFcyOGFqVktwcWJWQ0NGNzZOSng0cmxB?=
 =?utf-8?B?My96NkRySWZsS3BXUExWelNuRzk5ek1pU2xxYUJjVWZPckRwL0podjh2Q01v?=
 =?utf-8?B?QXJIeis3OHNNYXlaYVd6aXFhb09RaXU1eFlXdjJscjVESTkwcVpVMnF0YWlU?=
 =?utf-8?B?TkJ0MU9hcStDa3JhMk56SHFyQlU2bmJQRFBGL3lIVUVFK3BSSHg4RnlXZjJJ?=
 =?utf-8?B?V0E9PQ==?=
Content-ID: <75C41ED8FFA75D4DA521137BE8673562@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4751423e-2053-486b-d08f-08dd28792a71
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 02:25:02.4114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RN36dnT7vvA6TL0xx0N+jP9/QoKfGaLkm7bCGgIb+qwHyecfh7OAbkVXyEp5AeSu+PJu3zSCYVUm8ptAz2balk1tw9FKMBBwszaptduSFsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6878
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_2089241891.284655732"
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

--__=_Part_Boundary_005_2089241891.284655732
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS3J6eXN6dG9mLA0KDQpPbiBGcmksIDIwMjQtMTItMjcgYXQgMDk6MTEgKzAxMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgRGVjIDIw
LCAyMDI0IGF0IDAxOjA3OjU0QU0gKzA4MDAsIEphc29uLUpILkxpbiB3cm90ZToNCj4gPiAxLiBB
ZGQgY29tcGF0aWJsZSBuYW1lIGFuZCBpb21tdXMgcHJvcGVydHkgdG8gbWVkaWF0ZWssZ2NlLQ0K
PiA+IG1haWxib3gueWFtbA0KPiA+IMKgwqAgZm9yIE1UODE5Ni4NCj4gPiANCj4gPiDCoMKgIC0g
VGhlIGNvbXBhdGlibGUgbmFtZSAibWVkaWF0ZWssbXQ4MTk2LWdjZS1tYWlsYm94IiBpcyBhZGRl
ZCB0bw0KPiA+IMKgwqDCoMKgIGVuc3VyZSB0aGF0IHRoZSBkZXZpY2UgdHJlZSBjYW4gY29ycmVj
dGx5IGlkZW50aWZ5IGFuZA0KPiA+IGNvbmZpZ3VyZQ0KPiANCj4gDQo+IFRoaXMgaXMgMTAwJSBy
ZWR1bmRhbnQgc3RhdGVtZW50LiBEb24ndCBzdGF0ZSB0aGUgb2J2aW91cyBhbmQgZG9uJ3QNCj4g
ZXhwbGFpbiB0byB1cyBob3cgRFQgd29ya3MuDQo+IA0KDQpPSywgSSdsbCBkcm9wIHRoaXMuDQoN
Cj4gPiDCoMKgwqDCoCB0aGUgR0NFIG1haWxib3ggZm9yIHRoZSBNVDgxOTYgU29DLg0KPiA+IA0K
PiA+IMKgwqAgLSBUaGUgaW9tbXVzIHByb3BlcnR5IGlzIGFkZGVkIHRvIHNwZWNpZnkgdGhlIElP
TU1VDQo+ID4gY29uZmlndXJhdGlvbg0KPiA+IMKgwqDCoMKgIGZvciB0aGUgR0NFIG1haWxib3gs
IGVuc3VyaW5nIHByb3BlciBtZW1vcnkgbWFuYWdlbWVudCBhbmQNCj4gPiBhY2Nlc3MNCj4gPiDC
oMKgwqDCoCBjb250cm9sLg0KPiANCj4gWW91IHNob3VsZCBzYXkgd2hldGhlciBkZXZpY2Ugc3Vw
cG9ydHMgb3IgZG9lcyBub3Qgc3VwcG9ydCBJT01NVS4gU28NCj4gYWxsDQo+IGRldmljZXMgbm93
IHdvcmsgd2l0aCBJT01NVT8gSSBndWVzcyBJIGFza2VkIGFib3V0IGl0IGFscmVhZHksIG5vDQo+
IGltcHJvdmVtZW50cy4gU28gYWdhaW4sIGRvbid0IHN0YXRlIHRoZSBvYnZpb3VzLg0KPiANCg0K
WWVzLMKgSSdsbCBjaGFuZ2UgdGhlIGFib3ZlIHN0YXRlbWVudCBhcyBiZWxvdzoNCg0KSW4gTVQ4
MTk2LCBhbGwgdGhlIGNvbW1hbmQgYnVmZmVycyBhbGxvY2F0ZWQgYW5kIHVzZWQgYnkgR0NFIGRl
dmljZSBhcmUNCndvcmtpbmcgd2l0aCBJT01NVS4NCg0KPiA+IA0KPiA+IDIuIEFkZCB0aGUgR2xv
YmFsIENvbW1hbmQgRW5naW5lIChHQ0UpIGJpbmRpbmcgaGVhZGVyIHRvIGRlZmluZSB0aGUNCj4g
PiDCoMKgIGFic3RyY3Qgc3ltYm9sIGJpbmRpbmcgdG8gdGhlIEdDRSBoYXJkd2FyZSBzZXR0aW5n
cyBvZiBHQ0UNCj4gPiBUaHJlYWQNCj4gDQo+IHR5cG8NCg0KVGhhbmtzLCBJJ2xsIGZpeCBpdC4N
Cg0KPiANCj4gPiDCoMKgIFByaW9yaXR5LCBHQ0UgU3Vic3lzIElEIGFuZCBHQ0UgRXZlbnQgZm9y
IE1UODE5Ni4NCj4gPiANCj4gPiDCoMKgIC0gR0NFIFRocmVhZCBQcmlvcml0eTogRGVmaW5lZCB0
byBjb25maWd1cmUgdGhlIHByaW9yaXR5IGxldmVsDQo+ID4gZm9yDQo+ID4gwqDCoMKgwqAgZWFj
aCBHQ0UgaGFyZHdhcmUgdGhyZWFkLiBUaGlzIGlzIG5lY2Vzc2FyeSBmb3IgcHJvcGVyDQo+ID4g
c2NoZWR1bGluZw0KPiA+IMKgwqDCoMKgIGFuZCBleGVjdXRpb24gb2YgY29tbWFuZHMgaW4gdGhl
IEdDRS4NCj4gPiANCj4gPiDCoMKgIC0gR0NFIFN1YnN5cyBJRDogRGVmaW5lZCB0byBzcGVjaWZ5
IHRoZSBzdWJzeXN0ZW0gSUQgZm9yIEdDRQ0KPiA+IGNsaWVudHMuDQo+ID4gwqDCoMKgwqAgVGhp
cyBpcyB1c2VkIHRvIGNvcnJlY3RseSBhZGRyZXNzIGFuZCBhY2Nlc3MgZGlmZmVyZW50DQo+ID4g
c3Vic3lzdGVtcw0KPiA+IMKgwqDCoMKgIHdpdGhpbiB0aGUgR0NFLg0KPiA+IA0KPiA+IMKgwqAg
LSBHQ0UgRXZlbnQ6IERlZmluZWQgdG8gc3BlY2lmeSB0aGUgZXZlbnRzIHRoYXQgdGhlIEdDRSBj
YW4NCj4gPiBoYW5kbGUuDQo+ID4gwqDCoMKgwqAgVGhlc2UgZXZlbnRzIGFyZSB1c2VkIGJ5IHRo
ZSBkcml2ZXIgdG8gc3luY2hyb25pemUgYW5kIG1hbmFnZQ0KPiA+IMKgwqDCoMKgIGhhcmR3YXJl
IG9wZXJhdGlvbnMuDQo+ID4gDQo+ID4gwqDCoCBFeGFtcGxlcyBvZiB0aGUgYmluZGluZyB1c2Fn
ZSBpbiB0aGUgZHJpdmVyIGNvZGU6DQo+IA0KPiBEcm9wIGFsbCBiZWxvdyBmcm9tIGNvbW1pdCBt
c2cuIERvbid0IHBhc3RlIEMgY29kZSBpbnRvIHRoZSBiaW5kaW5ncy4NCj4gDQpPSywgSSdsbCBk
cm9wIHRoZW0uDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEtyenlzenRvZg0KPiANCg0K

--__=_Part_Boundary_005_2089241891.284655732
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0tyenlzenRvZiwNCg0KT24mIzMyO0ZyaSwm
IzMyOzIwMjQtMTItMjcmIzMyO2F0JiMzMjswOToxMSYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2Ym
IzMyO0tvemxvd3NraSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMz
MjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlu
a3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lv
dSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhl
JiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtGcmks
JiMzMjtEZWMmIzMyOzIwLCYjMzI7MjAyNCYjMzI7YXQmIzMyOzAxOjA3OjU0QU0mIzMyOyswODAw
LCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOzEuJiMzMjtB
ZGQmIzMyO2NvbXBhdGlibGUmIzMyO25hbWUmIzMyO2FuZCYjMzI7aW9tbXVzJiMzMjtwcm9wZXJ0
eSYjMzI7dG8mIzMyO21lZGlhdGVrLGdjZS0NCiZndDsmIzMyOyZndDsmIzMyO21haWxib3gueWFt
bA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMzMjtmb3ImIzMyO01UODE5Ni4NCiZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMzMjstJiMz
MjtUaGUmIzMyO2NvbXBhdGlibGUmIzMyO25hbWUmIzMyOyZxdW90O21lZGlhdGVrLG10ODE5Ni1n
Y2UtbWFpbGJveCZxdW90OyYjMzI7aXMmIzMyO2FkZGVkJiMzMjt0bw0KJmd0OyYjMzI7Jmd0OyYj
MzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtlbnN1cmUmIzMyO3RoYXQmIzMyO3RoZSYj
MzI7ZGV2aWNlJiMzMjt0cmVlJiMzMjtjYW4mIzMyO2NvcnJlY3RseSYjMzI7aWRlbnRpZnkmIzMy
O2FuZA0KJmd0OyYjMzI7Jmd0OyYjMzI7Y29uZmlndXJlDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7VGhpcyYjMzI7aXMmIzMyOzEwMCUmIzMyO3JlZHVuZGFudCYjMzI7c3RhdGVtZW50
LiYjMzI7RG9uJiMzOTt0JiMzMjtzdGF0ZSYjMzI7dGhlJiMzMjtvYnZpb3VzJiMzMjthbmQmIzMy
O2RvbiYjMzk7dA0KJmd0OyYjMzI7ZXhwbGFpbiYjMzI7dG8mIzMyO3VzJiMzMjtob3cmIzMyO0RU
JiMzMjt3b3Jrcy4NCiZndDsmIzMyOw0KDQpPSywmIzMyO0kmIzM5O2xsJiMzMjtkcm9wJiMzMjt0
aGlzLg0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3Ro
ZSYjMzI7R0NFJiMzMjttYWlsYm94JiMzMjtmb3ImIzMyO3RoZSYjMzI7TVQ4MTk2JiMzMjtTb0Mu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMzI7
LSYjMzI7VGhlJiMzMjtpb21tdXMmIzMyO3Byb3BlcnR5JiMzMjtpcyYjMzI7YWRkZWQmIzMyO3Rv
JiMzMjtzcGVjaWZ5JiMzMjt0aGUmIzMyO0lPTU1VDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjb25maWd1
cmF0aW9uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2Zv
ciYjMzI7dGhlJiMzMjtHQ0UmIzMyO21haWxib3gsJiMzMjtlbnN1cmluZyYjMzI7cHJvcGVyJiMz
MjttZW1vcnkmIzMyO21hbmFnZW1lbnQmIzMyO2FuZA0KJmd0OyYjMzI7Jmd0OyYjMzI7YWNjZXNz
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2NvbnRyb2wu
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1lvdSYjMzI7c2hvdWxkJiMzMjtzYXkmIzMyO3doZXRoZXIm
IzMyO2RldmljZSYjMzI7c3VwcG9ydHMmIzMyO29yJiMzMjtkb2VzJiMzMjtub3QmIzMyO3N1cHBv
cnQmIzMyO0lPTU1VLiYjMzI7U28NCiZndDsmIzMyO2FsbA0KJmd0OyYjMzI7ZGV2aWNlcyYjMzI7
bm93JiMzMjt3b3JrJiMzMjt3aXRoJiMzMjtJT01NVSYjNjM7JiMzMjtJJiMzMjtndWVzcyYjMzI7
SSYjMzI7YXNrZWQmIzMyO2Fib3V0JiMzMjtpdCYjMzI7YWxyZWFkeSwmIzMyO25vDQomZ3Q7JiMz
MjtpbXByb3ZlbWVudHMuJiMzMjtTbyYjMzI7YWdhaW4sJiMzMjtkb24mIzM5O3QmIzMyO3N0YXRl
JiMzMjt0aGUmIzMyO29idmlvdXMuDQomZ3Q7JiMzMjsNCg0KWWVzLCYjMTYwO0kmIzM5O2xsJiMz
MjtjaGFuZ2UmIzMyO3RoZSYjMzI7YWJvdmUmIzMyO3N0YXRlbWVudCYjMzI7YXMmIzMyO2JlbG93
Og0KDQpJbiYjMzI7TVQ4MTk2LCYjMzI7YWxsJiMzMjt0aGUmIzMyO2NvbW1hbmQmIzMyO2J1ZmZl
cnMmIzMyO2FsbG9jYXRlZCYjMzI7YW5kJiMzMjt1c2VkJiMzMjtieSYjMzI7R0NFJiMzMjtkZXZp
Y2UmIzMyO2FyZQ0Kd29ya2luZyYjMzI7d2l0aCYjMzI7SU9NTVUuDQoNCiZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Mi4mIzMyO0FkZCYjMzI7dGhlJiMzMjtHbG9iYWwmIzMy
O0NvbW1hbmQmIzMyO0VuZ2luZSYjMzI7KEdDRSkmIzMyO2JpbmRpbmcmIzMyO2hlYWRlciYjMzI7
dG8mIzMyO2RlZmluZSYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzMy
O2Fic3RyY3QmIzMyO3N5bWJvbCYjMzI7YmluZGluZyYjMzI7dG8mIzMyO3RoZSYjMzI7R0NFJiMz
MjtoYXJkd2FyZSYjMzI7c2V0dGluZ3MmIzMyO29mJiMzMjtHQ0UNCiZndDsmIzMyOyZndDsmIzMy
O1RocmVhZA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjt0eXBvDQoNClRoYW5rcywmIzMyO0kmIzM5O2xs
JiMzMjtmaXgmIzMyO2l0Lg0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYj
MTYwOyYjMzI7UHJpb3JpdHksJiMzMjtHQ0UmIzMyO1N1YnN5cyYjMzI7SUQmIzMyO2FuZCYjMzI7
R0NFJiMzMjtFdmVudCYjMzI7Zm9yJiMzMjtNVDgxOTYuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMzI7LSYjMzI7R0NFJiMzMjtUaHJlYWQmIzMy
O1ByaW9yaXR5OiYjMzI7RGVmaW5lZCYjMzI7dG8mIzMyO2NvbmZpZ3VyZSYjMzI7dGhlJiMzMjtw
cmlvcml0eSYjMzI7bGV2ZWwNCiZndDsmIzMyOyZndDsmIzMyO2Zvcg0KJmd0OyYjMzI7Jmd0OyYj
MzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtlYWNoJiMzMjtHQ0UmIzMyO2hhcmR3YXJl
JiMzMjt0aHJlYWQuJiMzMjtUaGlzJiMzMjtpcyYjMzI7bmVjZXNzYXJ5JiMzMjtmb3ImIzMyO3By
b3Blcg0KJmd0OyYjMzI7Jmd0OyYjMzI7c2NoZWR1bGluZw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjthbmQmIzMyO2V4ZWN1dGlvbiYjMzI7b2YmIzMyO2Nv
bW1hbmRzJiMzMjtpbiYjMzI7dGhlJiMzMjtHQ0UuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMzI7LSYjMzI7R0NFJiMzMjtTdWJzeXMmIzMyO0lE
OiYjMzI7RGVmaW5lZCYjMzI7dG8mIzMyO3NwZWNpZnkmIzMyO3RoZSYjMzI7c3Vic3lzdGVtJiMz
MjtJRCYjMzI7Zm9yJiMzMjtHQ0UNCiZndDsmIzMyOyZndDsmIzMyO2NsaWVudHMuDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO1RoaXMmIzMyO2lzJiMzMjt1
c2VkJiMzMjt0byYjMzI7Y29ycmVjdGx5JiMzMjthZGRyZXNzJiMzMjthbmQmIzMyO2FjY2VzcyYj
MzI7ZGlmZmVyZW50DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzdWJzeXN0ZW1zDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3dpdGhpbiYjMzI7dGhlJiMzMjtHQ0Uu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMzI7
LSYjMzI7R0NFJiMzMjtFdmVudDomIzMyO0RlZmluZWQmIzMyO3RvJiMzMjtzcGVjaWZ5JiMzMjt0
aGUmIzMyO2V2ZW50cyYjMzI7dGhhdCYjMzI7dGhlJiMzMjtHQ0UmIzMyO2Nhbg0KJmd0OyYjMzI7
Jmd0OyYjMzI7aGFuZGxlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMzMjtUaGVzZSYjMzI7ZXZlbnRzJiMzMjthcmUmIzMyO3VzZWQmIzMyO2J5JiMzMjt0aGUm
IzMyO2RyaXZlciYjMzI7dG8mIzMyO3N5bmNocm9uaXplJiMzMjthbmQmIzMyO21hbmFnZQ0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtoYXJkd2FyZSYjMzI7
b3BlcmF0aW9ucy4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7
JiMxNjA7JiMzMjtFeGFtcGxlcyYjMzI7b2YmIzMyO3RoZSYjMzI7YmluZGluZyYjMzI7dXNhZ2Um
IzMyO2luJiMzMjt0aGUmIzMyO2RyaXZlciYjMzI7Y29kZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7
RHJvcCYjMzI7YWxsJiMzMjtiZWxvdyYjMzI7ZnJvbSYjMzI7Y29tbWl0JiMzMjttc2cuJiMzMjtE
b24mIzM5O3QmIzMyO3Bhc3RlJiMzMjtDJiMzMjtjb2RlJiMzMjtpbnRvJiMzMjt0aGUmIzMyO2Jp
bmRpbmdzLg0KJmd0OyYjMzI7DQpPSywmIzMyO0kmIzM5O2xsJiMzMjtkcm9wJiMzMjt0aGVtLg0K
DQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMyO0Jlc3QmIzMyO3JlZ2FyZHMsDQom
Z3Q7JiMzMjtLcnp5c3p0b2YNCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_2089241891.284655732--

