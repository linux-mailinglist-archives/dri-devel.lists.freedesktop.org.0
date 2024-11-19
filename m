Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CC99D2040
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 07:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD48110E5BD;
	Tue, 19 Nov 2024 06:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="avQi8yWu";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gGGmEKw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB26210E5BD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:33:11 +0000 (UTC)
X-UUID: 227873d8a64011ef99858b75a2457dd9-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=05sIE30q2r05M0RGs1ugI3iWTb10w/34hLT8ojpmBr4=; 
 b=avQi8yWunA6ijd76DebvuZ7ZU24WhwUSUKj69TOyrI8k/QxFj/6H2/fQeRPVrko5YjWyFyPhEui2zdyBkd0vvWqtO0mPndp0xFNtAbyTz4ozbsesqBpt96B9GfmNKQYe+X9DcIXmOcGpj302u91SFzlONBlbB8kRtEB7heWPDTY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:85564ed9-c769-47f0-8903-47aad031bc04, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:4338484f-a2ae-4b53-acd4-c3dc8f449198,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 227873d8a64011ef99858b75a2457dd9-20241119
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1306004279; Tue, 19 Nov 2024 14:33:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 22:33:04 -0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 14:33:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URFIkpfExlK4J8w0iupx5l++ZgpE6NU7Ei42KxONHEWM7o9mfdedNbWQG244IQAwt4v5WANf1gcOlVfqSJBc2azXVWlnTYUDFhnAVKgDYL7Wduj1exSA6GPCYc1P1nO3G9dqFHQMOU3dac+8RPfwJdi98VPh6Ua+lKhntCCJ3L1etgGNQml2U81l1x/Ee8MAA0IAX7Yoet3U2SwnGsColvefeN+Q6eGdVnnG5r8JdqLrl2ixFq3NxOM0JyqJS35Z2kAO//KcDxfUlqHkyAYClaxTaGBCcYA9HJcHa/8J0ACpJ1ni+sfeiKV6yrjIvpWVT+GFWA4Y+lEO+BAmqBt4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QPExhO9ExBgcy0as7i5oUrTPDVhwa9i1eiw2V+610Q=;
 b=dRCpdS5im0Yh5BQYrje6KIJtFKbbNi+LJiOWSKrAtEHnWkxBjCn6G84JH0DSDbC0foXvJl6v/0gfLK9GSgkAUTMkC4YGCu7p63eyw9qIYwrT/UvnGYWC0REiCWsaJ56TNCAxhDl7bbDuS+3g5gA9Qi7WoXFYYocIwhDL+rJu5F089chGUS3j6XXEEX1SDTp6PrgUvlnT8NFFO+vBB4hquGa8x0Gx8NCanzFh3W46cd6M+g2Jd9HUrg+RkmP0KSV72v3FAlRDYUX+NruQtfMG2MbyOwio5EsNNjSh9uy5qt3A8LERZ8cpso0xQbOwhpV4RVT0kECn/enVV2WARYLa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QPExhO9ExBgcy0as7i5oUrTPDVhwa9i1eiw2V+610Q=;
 b=gGGmEKw4GAF/K3MMp2zI4hjHhBGlybAKZbmjj8089Sa8Znwxtc/RTU1iMO87j7XEQ9bckByvaBQ8YlWT8qFxab44apY9vU68gK4z/zixiyEGCSguqJpXnf/JDzFhSQlsYPfMiqpf14H2ptqhHGZB5Ugrvuj9onG0xvd4jgfk+X8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PUZPR03MB7044.apcprd03.prod.outlook.com (2603:1096:301:11c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 06:33:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%4]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 06:33:00 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "fshao@chromium.org"
 <fshao@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Add no pending_planes flag checking for
 mtk_crtc_finish_page_flip()
Thread-Topic: [PATCH] drm/mediatek: Add no pending_planes flag checking for
 mtk_crtc_finish_page_flip()
Thread-Index: AQHbOWscNtWmixb/8EyoshdcHaMvILK8souAgAF0X4A=
Date: Tue, 19 Nov 2024 06:33:00 +0000
Message-ID: <a92217eb88afae8ce947be8f064e9c96ca568497.camel@mediatek.com>
References: <20241118033646.31633-1-jason-jh.lin@mediatek.com>
 <96b3576243f5c6880dd16d36020d2083a8508b44.camel@mediatek.com>
In-Reply-To: <96b3576243f5c6880dd16d36020d2083a8508b44.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PUZPR03MB7044:EE_
x-ms-office365-filtering-correlation-id: 6bd0ac0c-b0c1-4891-e49e-08dd0864038d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VVBJejZjemljWVpZWnk4OS9FQlF6TXByWVQxTGhjOXo4VEtKcE1UMmhRVUF0?=
 =?utf-8?B?eXh5R25qSWRJSDNzTTM4TXl3QnZuMmdubExjVWtnN0VsWnBFU0xnOHlqRCtr?=
 =?utf-8?B?Qkd5NDlza01tK2RnRElDUEVPeGtYdGdhQmNmMkRFSWNVWDYyTVQ5dUNLT2ZO?=
 =?utf-8?B?V2dqYU5qSDNWSlRqazhzVW42U0J6bFFBTEw3ajBOVVBzRm5yYzFhZlFCVXhU?=
 =?utf-8?B?Ui9EUENtSDdSMUUzWXpEcy9Ha2Q4aVhnNStoanNXaU9YK3locEtiRWNlMStH?=
 =?utf-8?B?dUo4MmtFL0RZT0Q5c291WTRsUXozWE14VzJvSjBiUldVdkp4YkxrWEh3NVpm?=
 =?utf-8?B?VVlLRzArQUxpTXRaSHRod2JzWUcwNFB0S21QaWltbkJiRFlJcnQ2Nk1kS2Va?=
 =?utf-8?B?bjUrd2JUNzlpb0ZZVzNVT0JqOGVTR1RMVG5VTU1lblVhNXJHcDlteERZL3VJ?=
 =?utf-8?B?UXFlczE0WkxYbUhHS3F1NURpUkFUM3NEREV5dWRYY2x4WitzN0VJeWlVK255?=
 =?utf-8?B?cTlsRDhwcmlnSjBTYVQ2djVsZkIwK0drZ29NYmsrVmpqY2JONG9xTGRLeFo4?=
 =?utf-8?B?VnZ3b0w5bms2cG5UNW5jeUxnQXp5VmlacXJmaWNNcnNaMzhaenFYbnduV3hk?=
 =?utf-8?B?S2FabUNoWFRxRmJ0M29Mb1BmY3dtVDN1bGtNRnpKRUtRd2NNOEpsSjl1UlJZ?=
 =?utf-8?B?TFJxaERDcUxmMm10R2dzaGdua3J1Z1Z5ekMvbW5Nakd5VW1oRVFjSUR6dDJW?=
 =?utf-8?B?MVFvdGQybmIvdFRRbW9BOXVqSEdyL1N4ZWwyWitsVThhT2FFUjR1MHIvUE0y?=
 =?utf-8?B?QU1aWmI0b3F2WTR4amhhSk5iNVhyaXRoejU4aFlLM0VWVzN4MU5hektKR1ZQ?=
 =?utf-8?B?ekt5M2dQZ0ZYUGVRTjV2OGtWNE9ZTVV0UkFHZmc0TGF5UmZXVERhZW9xOGUw?=
 =?utf-8?B?TUt5eVNuWlNla2JacGRNVUlOejhzanVGQmVvWi9FRitvL2hENm1DblJwZmEv?=
 =?utf-8?B?M0tiMjdwbjJlSlZ4OHVRRHdEcVBDUlVlbnNCK04xSnB3QW9IaEQ3VFNRZmZm?=
 =?utf-8?B?dlYrL1k4cnRFbWVHNXBOcHVPdGM1UjgwcUFoMmZQUkVOVVZyT2lQVFhOQWhp?=
 =?utf-8?B?UWdEU3ZERTBiRkp1RXozK3FuWVpoS2NWYzVYc3I4K3Q4R2JmNUJBNWZTTjkx?=
 =?utf-8?B?MVRxajMyQzhzU2xzSmhIeVdXYUhVbGR4MEVyWXNRM2FISUtzeHVWZjBCUWx2?=
 =?utf-8?B?VGdBOFFkZktYNEh6SVhmc2JhUjUrM2lUTHlrcWpMbXJEQ1NCRitKdDJZd2E0?=
 =?utf-8?B?SWp3ajFkVjEwL1Q4UFJDNW81U2FsakNkUkJLb1I5TFFzRkE5S3BIRm8vcm1k?=
 =?utf-8?B?cXExTnhqY0hBOTF2ZnluaDhHcU4reGgrUk9yaUxFT1hGejNYdVdnNVpkc2M1?=
 =?utf-8?B?ZnVuaFBMc0xubFNqYms0Tm9JamdmOXZtT0J3QUxYMjkvaXo0bTYvN0JNNHB6?=
 =?utf-8?B?VEVNMW9yUktWbjRFOE1zdjhJRXg4U3hiQW9FL3h0M1FXNi93Nzk3YkVnN1RS?=
 =?utf-8?B?TnpKcXp1UFVBem5kU0xtK1hvcjNLTW9Day83aDF4K3JhS3dQdzNnVkUzdkNi?=
 =?utf-8?B?NFNYcUszSkFyTDI0T1I0OVBWTnA1Q05YWnJSNDMrbVB4ekR0bGo4MTh3MW9E?=
 =?utf-8?B?SFMyUXZzekRPV2U1Q241dHA3VGlnODZYS1U0c0l2ekh3dGxrN3FJTW5MdHhz?=
 =?utf-8?B?eG1EUnBBMmRIMWtNam1sVnBKbktOQURtNEJvYk1EWUkzQkVFTWhzS0FPTG5t?=
 =?utf-8?Q?ScfiIa1Y6H5nuMFy91MM9tU9f0dhCRVwqAH9U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFQwaVJzKzFrRHhmMFlVZkFPc3cyb2dtaW10WDBxQm4yRVhpM3RFaDVuVFMz?=
 =?utf-8?B?NFNGSnJhK0R5MHdlOUdBUTZEME9RczJsNWY3aXBjQSs4Unh2czZuQVJaZDJr?=
 =?utf-8?B?dmJhdEZLbVlFWU5FVkRpeUlPcGs2SXNhYzQxbzRBYWRYRFdsK1I0bkVtZHQ2?=
 =?utf-8?B?YUlNVi9wM21UUFNqc09yU2pjTnlqbGd1bldvSW9xVFFDMzd6Y3hZS3A1MkVK?=
 =?utf-8?B?cEdsRWs3RUtSVGE3bTV3VFM3ejJhN081NUFMdThFaTdZSzZzbzBpaThmdnZa?=
 =?utf-8?B?VzVLM3NDcjl3RjZFNHd3OUdPbWQ4eFVwenRsa08zbms4RzgzMXJ4aEduclVs?=
 =?utf-8?B?U3B0TzFJNjE0OEkrMFlMTEw5NFg3SGRwOGwxdnpEdG4zUFNFTmRSN21TWmh6?=
 =?utf-8?B?MjYwMzF4b25DV0xFN3RjeDRuVjF5VzVXVXo3aHJWUTZMWlBIVksxanVpdE1l?=
 =?utf-8?B?dHZXMFNoNnMzUGhHeCt3dnorMml1YnA5Z1Z1cFU2UXJOc0tMclVQQVFTOXBU?=
 =?utf-8?B?SUt6TGVOU1lrNDRWZEs2dGRsaFJDVW9MVlU4K0l0YWlFdDgwU3BpRDJYMjdq?=
 =?utf-8?B?MnQzQzd3V1FNbkJGMzU2UVdrUTByM2Z5WlNmb25aWkRFcFFZOWdvcndMNnBP?=
 =?utf-8?B?SGFlelBNOVR0U1o4NVg4MEV2WURVczlBNDFjVnUvdVRlRWhqdGhLR1Flb1lG?=
 =?utf-8?B?cFlubHFuZVh6MDYrQzdGOGtKVHRsM1NScjFyZWhkK0FGSktvWm43N2RqV2Rr?=
 =?utf-8?B?Y1lLNDk1bXBsL2UwaWxjME1EdFlxWWtzaVpDSUZHVHlhTlNRRzQyR3l6TVMx?=
 =?utf-8?B?VzhkVUNzUUo5SzNyWG04dVgyYlBHRHBHQTVoVy9ud1dNTmU5cmMrNGsvcnhW?=
 =?utf-8?B?WTh4b2paVDVReWFEWHptandsd1VVYlB6NDlUcGRMN3BCTTN2L0dDWVVWdXFi?=
 =?utf-8?B?SUdOeVBVYmROWXVwQUdLYzVPKzY4QkNraGZWVyttV2pWOWNFZDRlbWVjQ3lu?=
 =?utf-8?B?V0V2WStzYTYyc1JzZWtpZW9JRE5LTTl6WGsxRnB0YkNuakVwcE9IVm1JajlP?=
 =?utf-8?B?YVFyVk51S0R0ZDhMc3VMWDdteEdZdmpJSk0rQW43RFdxS3JqeVNtUkJNRFJY?=
 =?utf-8?B?Nyt5QTdKUWRLSWxKcjJzdENsZkV2RDN1NUozY3R4VHlDemI1VkxUT1QrWklS?=
 =?utf-8?B?U3diMytGaW5aVXhBaElBMS82THo2WjNIcTNObVREclE4bGdMTW9aNUUvRUtR?=
 =?utf-8?B?SlFNVVNwZ0ZlaWNnZEQvZGgvY1FwMWthUWY5bnhodFZQeTVPMFU0UTlGRnll?=
 =?utf-8?B?NlVUT2dxa0FpVGRId2hBNjdZOE5icUNLZkdYMnZObXRGcE04V0ZsUVlJNWg1?=
 =?utf-8?B?UjM0bnZhWk1vcG1MUGRtdUtRNXNKNUMzVHp6MWxKMEZ5UEhqUS8vOFYyL3o4?=
 =?utf-8?B?WWFIRkFadG1ielBxYXJSblJIT1VBRlVENEY0cUl5ZVdrVUFYZDE3UldjY0Fj?=
 =?utf-8?B?Mkt4RktaRGhFV0pOQzI3ZDlMWDQwTitIQ21BTFBYbE1LZGg0VmJDWXF2bXVr?=
 =?utf-8?B?a3VrWDFuN2JBaDF3cmE1MUF5UklaMzg3dFoyVURCekV4eERzTEdNdC9QR24w?=
 =?utf-8?B?ay83VDkrd0NEMy9kYlhQZ2pjUjA3L2FyV1hvOG5kclNUb2p1eWp6OGl5SFFR?=
 =?utf-8?B?QkdMODAzbUlSbUQ2ZDlidWZLYTB1VGRadFl1Y0lUOElLa1M2d2VxMnJBelRi?=
 =?utf-8?B?WkZKRVJoZUhPY2lCSytJRDFLaE9WdVBwc1k3bGVUR1M5M2ZBNHN5VENNWmpH?=
 =?utf-8?B?T2xJamozSTVrbEI0aVZVeDhnRlg0VGtDVGZHemtYRzVwUms5WHlMdG8vRGpB?=
 =?utf-8?B?d0FQT2t3cUM3WWRyemxsbGZCZk9NMDVaQXByYXlaWWdjK2RGNUhnbEdWRlFE?=
 =?utf-8?B?aVhNWTRSYUNqMlBKU3J5RUluOFdFWVhBU0NRNGJnSnErOHN1ellRQmd0OVNq?=
 =?utf-8?B?aThvL1NDYzBSdDNKU0VtdFdUNXU3aXh0TEoxa004YWh0QkN5TmlzZ1MxbGFJ?=
 =?utf-8?B?R2JPZmc1Y0ZRWUJrVEZoYlFCZFk2NDVJdDhRdVpxVUpLWklrSC9ta1FhNXZz?=
 =?utf-8?B?TVdwWG9LUTJmOE9YQjNpdUFTOTNGZHhwQzEyTVhTQnFpS3UzSlZQcjZSM2xM?=
 =?utf-8?B?Z2c9PQ==?=
Content-ID: <DF11385B3C1D7D4399B42FBEB7EE6F0C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd0ac0c-b0c1-4891-e49e-08dd0864038d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 06:33:00.5661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pc8RRMF9mEsqhSp6Iz3bKZr//nD0RUFCGx2g5n13dfKSE121v2eOHhWcudXDzZHygcniAh8AJivIatEbk+qpf2+cADpTs4qAe+KM8T8KEI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7044
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_335287085.1277082737"
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

--__=_Part_Boundary_005_335287085.1277082737
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTExLTE4IGF0IDA4OjIwICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gSGksIEphc29uOg0KPiANCj4gT24gTW9uLCAyMDI0LTExLTE4IGF0IDExOjM2ICswODAw
LCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gbXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpIGlz
IHVzZWQgdG8gbm90aWZ5IHRoZSBwYWdlIGZsaXAgdGhhdA0KPiA+IGhhcw0KPiA+IGJlZW4gY29t
cGxldGVkIHRvIHRoZSB1c2Vyc3BhY2UsIHNvIHVzZXJzcGFjZSBjYW4gZnJlZSB0aGUgZnJhbWUN
Cj4gPiBidWZmZXINCj4gPiBvZiB0aGUgbGFzdCBmcmFtZSBhbmQgY29tbWl0IHRoZSBuZXh0IGZy
YW1lLg0KPiA+IA0KPiA+IEhvd2V2ZXIsIG10a19jcnRjX2ZpbmlzaF9wYWdlX2ZsaXAoKSBjYW5u
b3QgZ3VhcmFudGVlIHRoZSBHQ0UgaGFzDQo+ID4gY29uZmlndXJlZCBhbGwgdGhlIGRpc3BsYXkg
aGFyZHdhcmUgc2V0dGluZ3Mgb2YgdGhlIGxhc3QgZnJhbWUuDQo+ID4gVGhpcyBtYXkgY2F1c2Ug
dGhlIGRpc3BsYXkgaGFyZHdhcmUgdG8gc3RpbGwgYWNjZXNzIHRoZSBsYXN0IGZyYW1lDQo+ID4g
YnVmZmVyIHJlbGVhc2VkIGJ5IHRoZSB1c2Vyc3BhY2UuDQo+ID4gDQo+ID4gU28gYWRkIHRoZSBj
aGVja2luZyBjb25kaXRpb24gb2Ygbm8gcGVuZGluZ19wbGVucyBmbGFncyB0byBtYWtlDQo+ID4g
c3VyZQ0KPiA+IEdDRSBoYXMgZXhlY3V0ZWQgYWxsIHRoZSBwZW5kaW5nIHBsYW5lcyBjb25maWd1
cmF0aW9uLg0KPiANCj4gV2hhdCdzIHRoZSBwcm9iYWJpbGl0eT8NCj4gSWYgaXQncyBsb3cgcHJv
YmFiaWxpdHksIHdlIGNvdWxkIGRyb3AgY2FsbGluZw0KPiBtdGtfY3J0Y19maW5pc2hfcGFnZV9m
bGlwKCkuDQo+IElmIGl0J3Mgbm90IGxvdyBwcm9iYWJpbGl0eSwgSSB0aGluayBkcm9wIGNhbGxp
bmcNCj4gbXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpIHdvdWxkIHJlZHVjZSB0aGUgZnBzIGFu
ZCB3ZSBzaG91bGQgZmluZA0KPiBhbm90aGVyIHdheS4NCg0KSXQgd29uJ3QgaGFwcGVuIGluIGRp
c3BsYXkgbm9ybWFsIGZsb3csIHdoaWNoIHVzZXMgdGhlDQptYm94X3NlbmRfbWVzc2FnZSgpIGlu
IElSUSBjb250ZXh0Lg0KQnV0IGl0J3MgZWFzeSB0byByZXByb2R1Y2UgaW4gZGlzcGxheSBTVlAg
Zmxvdywgd2hpY2ggdXNlcyB0aGUNCm1ib3hfc2VuZF9tZXNzYWdlKCkgdG8gcXVldWUgYSB3b3Jr
IHRvIHRoZSB3b3JrcXVldWUgb3V0IG9mIHRoZSBJUlENCmNvbnRleHQgZm9yIGNvbW11bmljYXRp
bmcgd2l0aCBURUUgd29ybGQuDQoNCkluIG1lZGlhVGVrIGhhcmR3YXJlIGRlc2lnbiBvZiBjb25m
aWd1cmluZyBkaXNwbGF5IGhhcmR3YXJlIGJ5IEdDRSwgSQ0KdGhpbmsgd2Ugc2hvdWxkIHVzZSBt
dGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKCkgdG8gbm90aWZ5IA0KYERSTV9FVkVOVF9GTElQX0NP
TVBMRVRFRGAgdG8gdXNlcnNwYWNlIHdoZW4gR0NFIGZpbmlzaGVkIGNvbmZpZ3VyaW5nDQphbGwg
ZGlzcGxheSBoYXJkd2FyZSBzZXR0aW5ncyBmb3IgZWFjaCBhdG9taWNfY29tbWl0KCkuDQoNCkFs
dGhvdWdoIGl0J3Mgc3RpbGwgbm8gcHJvYmxlbSBpbiBkaXNwbGF5IG5vcm1hbCBmbG93IHdpdGhv
dXQgdGhpcw0KbW9kaWZpY2F0aW9uLg0KQnV0IEkgYmVsaWV2ZSB3ZSBjYW4gaW5jcmVhc2UgdGhl
IGFjY3VyYWN5IG9mIHRoZSB0aW1pbmcgdG8gbm90aWZ5DQpgRFJNX0VWRU5UX0ZMSVBfQ09NUExF
VEVEYCB0byB1c2Vyc3BhY2UsIGlmIHdlIGNhbGxlZA0KbXRrX2NydGNfZmluaXNoZWRfcGFnZV9m
bGlwKCkgd2hlbiB0aGUgYWxsIHRoZSBkaXNwbGF5IGhhcmR3YXJlDQpzZXR0aW5ncyBpcyBjb25m
aWd1cmVkLg0KDQpNYXliZSB0aGlzIHBhdGNoIGlzIG5vdCBxdWl0ZSBzdHJhaWdodGZvcndhcmQg
dG8gZXhwcmVzcyB0aGUgbWVhbmluZyBvZg0KY2FsbGluZyBtdGtfY3J0Y19maW5pc2hfcGFnZV9m
bGlwKCkgYWZ0ZXIgR0NFIGNvbXBsZXRpbmcgYWxsIHRoZQ0KZGlzcGxheSBjb25maWd1cmF0aW9u
Lg0KU28gYWZ0ZXIgSSB2ZXJpZnlpbmcgaXQgaW4gbXkgbG9jYWwgZW52aXJvbm1lbnQgd2l0aCBT
VlAgZmxvdywgSSdsbA0KbW92ZSBtdGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKCkgdG8gdGhlIGRk
cF9jbWRxX2NiKCkgZGlyZWN0bHkgYW5kIHNlbmQNCnRoZSB2Mi4NCg0KUmVnYXJkcywNCkphc29u
LUpILkxpbg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCg==

--__=_Part_Boundary_005_335287085.1277082737
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjQtMTEtMTgmIzMyO2F0
JiMzMjswODoyMCYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO0hpLCYjMzI7SmFzb246DQomZ3Q7JiMzMjsN
CiZndDsmIzMyO09uJiMzMjtNb24sJiMzMjsyMDI0LTExLTE4JiMzMjthdCYjMzI7MTE6MzYmIzMy
OyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO210
a19jcnRjX2ZpbmlzaF9wYWdlX2ZsaXAoKSYjMzI7aXMmIzMyO3VzZWQmIzMyO3RvJiMzMjtub3Rp
ZnkmIzMyO3RoZSYjMzI7cGFnZSYjMzI7ZmxpcCYjMzI7dGhhdA0KJmd0OyYjMzI7Jmd0OyYjMzI7
aGFzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiZWVuJiMzMjtjb21wbGV0ZWQmIzMyO3RvJiMzMjt0aGUm
IzMyO3VzZXJzcGFjZSwmIzMyO3NvJiMzMjt1c2Vyc3BhY2UmIzMyO2NhbiYjMzI7ZnJlZSYjMzI7
dGhlJiMzMjtmcmFtZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YnVmZmVyDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtvZiYjMzI7dGhlJiMzMjtsYXN0JiMzMjtmcmFtZSYjMzI7YW5kJiMzMjtjb21taXQmIzMyO3Ro
ZSYjMzI7bmV4dCYjMzI7ZnJhbWUuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyO0hvd2V2ZXIsJiMzMjttdGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKCkmIzMyO2Nhbm5vdCYj
MzI7Z3VhcmFudGVlJiMzMjt0aGUmIzMyO0dDRSYjMzI7aGFzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtj
b25maWd1cmVkJiMzMjthbGwmIzMyO3RoZSYjMzI7ZGlzcGxheSYjMzI7aGFyZHdhcmUmIzMyO3Nl
dHRpbmdzJiMzMjtvZiYjMzI7dGhlJiMzMjtsYXN0JiMzMjtmcmFtZS4NCiZndDsmIzMyOyZndDsm
IzMyO1RoaXMmIzMyO21heSYjMzI7Y2F1c2UmIzMyO3RoZSYjMzI7ZGlzcGxheSYjMzI7aGFyZHdh
cmUmIzMyO3RvJiMzMjtzdGlsbCYjMzI7YWNjZXNzJiMzMjt0aGUmIzMyO2xhc3QmIzMyO2ZyYW1l
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtidWZmZXImIzMyO3JlbGVhc2VkJiMzMjtieSYjMzI7dGhlJiMz
Mjt1c2Vyc3BhY2UuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NvJiMz
MjthZGQmIzMyO3RoZSYjMzI7Y2hlY2tpbmcmIzMyO2NvbmRpdGlvbiYjMzI7b2YmIzMyO25vJiMz
MjtwZW5kaW5nX3BsZW5zJiMzMjtmbGFncyYjMzI7dG8mIzMyO21ha2UNCiZndDsmIzMyOyZndDsm
IzMyO3N1cmUNCiZndDsmIzMyOyZndDsmIzMyO0dDRSYjMzI7aGFzJiMzMjtleGVjdXRlZCYjMzI7
YWxsJiMzMjt0aGUmIzMyO3BlbmRpbmcmIzMyO3BsYW5lcyYjMzI7Y29uZmlndXJhdGlvbi4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7V2hhdCYjMzk7cyYjMzI7dGhlJiMzMjtwcm9iYWJpbGl0eSYjNjM7
DQomZ3Q7JiMzMjtJZiYjMzI7aXQmIzM5O3MmIzMyO2xvdyYjMzI7cHJvYmFiaWxpdHksJiMzMjt3
ZSYjMzI7Y291bGQmIzMyO2Ryb3AmIzMyO2NhbGxpbmcNCiZndDsmIzMyO210a19jcnRjX2Zpbmlz
aF9wYWdlX2ZsaXAoKS4NCiZndDsmIzMyO0lmJiMzMjtpdCYjMzk7cyYjMzI7bm90JiMzMjtsb3cm
IzMyO3Byb2JhYmlsaXR5LCYjMzI7SSYjMzI7dGhpbmsmIzMyO2Ryb3AmIzMyO2NhbGxpbmcNCiZn
dDsmIzMyO210a19jcnRjX2ZpbmlzaF9wYWdlX2ZsaXAoKSYjMzI7d291bGQmIzMyO3JlZHVjZSYj
MzI7dGhlJiMzMjtmcHMmIzMyO2FuZCYjMzI7d2UmIzMyO3Nob3VsZCYjMzI7ZmluZA0KJmd0OyYj
MzI7YW5vdGhlciYjMzI7d2F5Lg0KDQpJdCYjMzI7d29uJiMzOTt0JiMzMjtoYXBwZW4mIzMyO2lu
JiMzMjtkaXNwbGF5JiMzMjtub3JtYWwmIzMyO2Zsb3csJiMzMjt3aGljaCYjMzI7dXNlcyYjMzI7
dGhlDQptYm94X3NlbmRfbWVzc2FnZSgpJiMzMjtpbiYjMzI7SVJRJiMzMjtjb250ZXh0Lg0KQnV0
JiMzMjtpdCYjMzk7cyYjMzI7ZWFzeSYjMzI7dG8mIzMyO3JlcHJvZHVjZSYjMzI7aW4mIzMyO2Rp
c3BsYXkmIzMyO1NWUCYjMzI7ZmxvdywmIzMyO3doaWNoJiMzMjt1c2VzJiMzMjt0aGUNCm1ib3hf
c2VuZF9tZXNzYWdlKCkmIzMyO3RvJiMzMjtxdWV1ZSYjMzI7YSYjMzI7d29yayYjMzI7dG8mIzMy
O3RoZSYjMzI7d29ya3F1ZXVlJiMzMjtvdXQmIzMyO29mJiMzMjt0aGUmIzMyO0lSUQ0KY29udGV4
dCYjMzI7Zm9yJiMzMjtjb21tdW5pY2F0aW5nJiMzMjt3aXRoJiMzMjtURUUmIzMyO3dvcmxkLg0K
DQpJbiYjMzI7bWVkaWFUZWsmIzMyO2hhcmR3YXJlJiMzMjtkZXNpZ24mIzMyO29mJiMzMjtjb25m
aWd1cmluZyYjMzI7ZGlzcGxheSYjMzI7aGFyZHdhcmUmIzMyO2J5JiMzMjtHQ0UsJiMzMjtJDQp0
aGluayYjMzI7d2UmIzMyO3Nob3VsZCYjMzI7dXNlJiMzMjttdGtfY3J0Y19maW5pc2hfcGFnZV9m
bGlwKCkmIzMyO3RvJiMzMjtub3RpZnkmIzMyOw0KJiM5NjtEUk1fRVZFTlRfRkxJUF9DT01QTEVU
RUQmIzk2OyYjMzI7dG8mIzMyO3VzZXJzcGFjZSYjMzI7d2hlbiYjMzI7R0NFJiMzMjtmaW5pc2hl
ZCYjMzI7Y29uZmlndXJpbmcNCmFsbCYjMzI7ZGlzcGxheSYjMzI7aGFyZHdhcmUmIzMyO3NldHRp
bmdzJiMzMjtmb3ImIzMyO2VhY2gmIzMyO2F0b21pY19jb21taXQoKS4NCg0KQWx0aG91Z2gmIzMy
O2l0JiMzOTtzJiMzMjtzdGlsbCYjMzI7bm8mIzMyO3Byb2JsZW0mIzMyO2luJiMzMjtkaXNwbGF5
JiMzMjtub3JtYWwmIzMyO2Zsb3cmIzMyO3dpdGhvdXQmIzMyO3RoaXMNCm1vZGlmaWNhdGlvbi4N
CkJ1dCYjMzI7SSYjMzI7YmVsaWV2ZSYjMzI7d2UmIzMyO2NhbiYjMzI7aW5jcmVhc2UmIzMyO3Ro
ZSYjMzI7YWNjdXJhY3kmIzMyO29mJiMzMjt0aGUmIzMyO3RpbWluZyYjMzI7dG8mIzMyO25vdGlm
eQ0KJiM5NjtEUk1fRVZFTlRfRkxJUF9DT01QTEVURUQmIzk2OyYjMzI7dG8mIzMyO3VzZXJzcGFj
ZSwmIzMyO2lmJiMzMjt3ZSYjMzI7Y2FsbGVkDQptdGtfY3J0Y19maW5pc2hlZF9wYWdlX2ZsaXAo
KSYjMzI7d2hlbiYjMzI7dGhlJiMzMjthbGwmIzMyO3RoZSYjMzI7ZGlzcGxheSYjMzI7aGFyZHdh
cmUNCnNldHRpbmdzJiMzMjtpcyYjMzI7Y29uZmlndXJlZC4NCg0KTWF5YmUmIzMyO3RoaXMmIzMy
O3BhdGNoJiMzMjtpcyYjMzI7bm90JiMzMjtxdWl0ZSYjMzI7c3RyYWlnaHRmb3J3YXJkJiMzMjt0
byYjMzI7ZXhwcmVzcyYjMzI7dGhlJiMzMjttZWFuaW5nJiMzMjtvZg0KY2FsbGluZyYjMzI7bXRr
X2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpJiMzMjthZnRlciYjMzI7R0NFJiMzMjtjb21wbGV0aW5n
JiMzMjthbGwmIzMyO3RoZQ0KZGlzcGxheSYjMzI7Y29uZmlndXJhdGlvbi4NClNvJiMzMjthZnRl
ciYjMzI7SSYjMzI7dmVyaWZ5aW5nJiMzMjtpdCYjMzI7aW4mIzMyO215JiMzMjtsb2NhbCYjMzI7
ZW52aXJvbm1lbnQmIzMyO3dpdGgmIzMyO1NWUCYjMzI7ZmxvdywmIzMyO0kmIzM5O2xsDQptb3Zl
JiMzMjttdGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKCkmIzMyO3RvJiMzMjt0aGUmIzMyO2RkcF9j
bWRxX2NiKCkmIzMyO2RpcmVjdGx5JiMzMjthbmQmIzMyO3NlbmQNCnRoZSYjMzI7djIuDQoNClJl
Z2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0
OyYjMzI7Q0sNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBl
OnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxp
dHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5
IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0K
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWlu
aW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50
cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQg
bWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBv
ZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChi
eSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2Yg
DQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3Rl
bSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55
IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_335287085.1277082737--

