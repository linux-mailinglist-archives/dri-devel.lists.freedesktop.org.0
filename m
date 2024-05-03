Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD48BAA00
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7706610FA94;
	Fri,  3 May 2024 09:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="n2sN9QGp";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Be7Lt5CZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F4C10FA94
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 09:40:55 +0000 (UTC)
X-UUID: 399cd128093111ef8065b7b53f7091ad-20240503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=wtBzLs/UM3WBFGKbG+Fh6INEbEfTig1kzkb/jqHAbt4=; 
 b=n2sN9QGpzPbzQB1ZRrdEVAsc+BC/Tow/8eKYCPvC18TkVSkoE3XkWXWMpKnGJB3jayJ4XlJMu9z5kuGskDdvsNQfXV3VAProAPzVzLpiyd5qRqXGDwm2H4xCOH+ChzdFz63xsezvoHij5QPMr+Z9d7t9Sz6G7B/hIMW5/DBUHYs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:25e2d7a3-e59a-4110-95fe-f1aa536659e0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:f02c5092-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 399cd128093111ef8065b7b53f7091ad-20240503
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 815680353; Fri, 03 May 2024 17:40:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 May 2024 17:40:46 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 May 2024 17:40:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrqKnwyetUvVG7J+M+JCf/apHSX0CSlJHtoTBgvqNd0Ix65kweL1skdpFLAtMTj+RrJaGJnxpNZ6nOYVcpZCgJmIRbJo6jAgQytabmJu9xwWkyhnr0RpfVAFqsxT0CCgzzEfkAZRq4xK6DaiU/v4kD/X0SN6rSYyILh79Z1xK+0WxA8DBrJpT5B37qquXE/GF7u7JUHlgfyekdbcnHvJ/XDRd++kn4MPG340klCmZaVjwgTnwvkuPoYrWVWyBARlo+qJlX6gha3Ot2PXuKWWks+H5X9P+Qyz7tFO89HXmL7r5KqDKT0umV8F1ksWJzTFeaCPCt8nUbnNfk3NYU2IWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdjrtKLOw/ZiQI4+aSg4iPWoMEzFWn9tI4OiXFWS7KA=;
 b=JEc53eLuWg8z+RyWRxH7N9aBpNPIx9YfgcB7a1h6PhAqJyyl4tMwe+i5xiRXcTwteBkeZ+MANUpcV0xp+dhXih8coIiuSRm/8SIo400L0o1b2jjDfe81cMcna/L5PZPZPra8gWTo3jflrvH7XJ/tUQhR2uWnCB2BiLiLbm/Avt1O1odd5jgQVKGlu1P+UsEU259/kmuhmq9Cl+cytcNhkyuikoiFh2I9xdt7UgQXuTD529lHW80kEHOZfxncMHAQ2HQo2SbM+5DR13HpnpC7M1QY22Tl0bHXq3YzdcvJe2wQwKeOjE2sJS1P0gVZz/f7wzYw5jh5JvKb6KUMwM6AUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdjrtKLOw/ZiQI4+aSg4iPWoMEzFWn9tI4OiXFWS7KA=;
 b=Be7Lt5CZcdbVQDBBED/S8RYUfoV+Eot5yWV0oa8L8EVQ0n15rSIrGwX7pYnwKnjxbqDMqlvtBbPpfTUyApE7a+4kVoUlayNOpyKzlKS4sC9gJC7AZGcGZv/Tuumzny9oDyOClyAxfFqhM9MrdNYTo0+6wIyPIALqHl9OXWYfcnw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7338.apcprd03.prod.outlook.com (2603:1096:101:144::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 09:40:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 09:40:44 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 14/18] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH v7 14/18] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHanH0KCOgSmCJolkiQW+ayxvdFs7GFQvUA
Date: Fri, 3 May 2024 09:40:44 +0000
Message-ID: <e7250d213e560caff065095c8116219310d2d9f7.camel@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-15-shawn.sung@mediatek.com>
In-Reply-To: <20240502103848.5845-15-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7338:EE_
x-ms-office365-filtering-correlation-id: 96808e86-1b60-4546-b090-08dc6b551ac7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|7416005|1800799015|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?UG5sSGRxRkN0SThCYzVYdmlpVHJkVzY2MkhzNG0xU0l4UG9DcjdqZVp0dkdp?=
 =?utf-8?B?eFE3cm5vSlYwSkp0QUpab09kMHhyMUU3NVZQSFR2aXRuRmV1RFk2Uzg5T1Nr?=
 =?utf-8?B?UnNnNDZCVndwNjF3TTJ0YUxXcHNFdENkNG5zSTE3TmNNODlwYkpLS2JvTzRV?=
 =?utf-8?B?bzRaOGxYVzluOWZQOXo1dUdOaDJYdEJCcUEydk80UTZjTXhObHdpbjBXb3p0?=
 =?utf-8?B?WEkxeTBFS055QUlwUGdaSDJPNjJaREh5aVZwTFdkTkRoVmc4ejlpRWtEbFRW?=
 =?utf-8?B?dHo2b2p4cHVVMlVob2VQZldkLzZremgyRWFMb3pzVHBGb3lBaEhVNDdyaFda?=
 =?utf-8?B?Q3h0RGo5Um5xUllVUlZONVF0bW4rcTlTTFBqRjdmb3R2OHNEREZEei9PQzBV?=
 =?utf-8?B?Mkt6UWwzS0FWRnEzWUtvcTk5RHVtMmhaRGVLYTUybGpwdlFLRk1GTjkrTFdQ?=
 =?utf-8?B?QzZmekx1eCtHU1dnalBYUzFBTWVDdnNsWExPVmVGenhTVjAxZE1LRCtPditw?=
 =?utf-8?B?TlZuZnpSYmFIZnBKY210UWxNUnY5TEVGbW5aakNkUXlmYUNzWHMzYVRXcmhm?=
 =?utf-8?B?OVllQk5ZTjlCL2NWT3V3TEVTQ0tGdVJ2K0FCK0p1NWhDL1ZPUVhjdnUzc01T?=
 =?utf-8?B?eGw1Vlp3RjhQdXZtMSsxR2FROUpUdXp4SjZMdVIxbXZKZE93cUZ4bSswTitF?=
 =?utf-8?B?SjdqekxIRUNsTGc0SjRBRTNIVEdZa2Y3ZmZRcDB5R08vZzJ3ck1TWCtEM2NS?=
 =?utf-8?B?Z2dTYm9hVHFyK2VKd0U4T09BUVNjWjg0RVpEbm5IclgwNnNqSE42Z2dkN2VV?=
 =?utf-8?B?M0dUWlErS3J3V09vZllha09Cbmt5OG1VeXMrZXZvWmZ5NTZYYnNtMS9sL0k2?=
 =?utf-8?B?Qm1aWHdmaE5WZ2ZVSmRXTE0rL290cHNUUFUzYlQ1SU9KR3VqRVpXRXAwancr?=
 =?utf-8?B?OUdSSGdsZFdQUmY5VzVZdkplWHNPMTdseEw3SVlTSmRjQkJmaldQM1d4NVow?=
 =?utf-8?B?SVc1QVZycXd1NGRiUzJqdVcxY25VZWJLbnFCN0JrcjVXRmVnYjJYVUJqcHpo?=
 =?utf-8?B?MHViVkF5R3AwSWdjeWhxLzFFa1N5U0VzMDRRYmIxbis2RkhCL1RKbk1qdldl?=
 =?utf-8?B?aE0xZW5LeUZPVFF1dUxVVjlUM2dZZzZIdkxjZkFWbTc2bkpZU1A4WTBXamZq?=
 =?utf-8?B?bGJhcTdYaWxUdk93Y1pld1hqMk9VNHpRVThqanVVM0ZCKzE1bjV3OE1zZTNU?=
 =?utf-8?B?OU1rYUVKUzVnUzRUM1diNkZBcmlTY0RZaGxTbHZFSjlLVFNhTnR6N1NIL2Zm?=
 =?utf-8?B?V2lLdEVLZjNzMktNbE8xMXJ2b3l5cVRNRThaaWJLalFDR1IxeU1kSUh4eEdM?=
 =?utf-8?B?UUtWWnQzY1JRa0lXT1lZby9qNXFVYWhEcHFpTlFQZVNtN2ZwS29IdDBOR2dv?=
 =?utf-8?B?VTRTZklBQUF3ZzNIM2ZKTldTemhuMTV5bElrQjZqY0tSVEtPN3lqaXpqQVFC?=
 =?utf-8?B?K0NaMFhuQkxuNDBSSDRjeHhIS3NJYkJKSThhZUlyR3pCVjlqVFpKU0QxbU9m?=
 =?utf-8?B?M0xzMVBpU2dHa0lNd21EUll0ZG1VTW9mNzJSVFgvZXU0QWp5Q2I2Q085RnRS?=
 =?utf-8?B?R3RkUFRBRTNtNTdIdnlEbHJEWjVIMDM2d09qNTIyRmNsSGx5Umhod3dEQ3Fu?=
 =?utf-8?B?bUhmMnZNem1WRDlSdTlQdHFpYXNJbnFac0ZsQ1RKTTBWUXZOQ2NjTkVTcWQ0?=
 =?utf-8?B?bzVzRFh0TTZzczl4M3VZeTY2VjRTV0gwNXpDaC9CLzRLSVlKQkhiajkwRmJj?=
 =?utf-8?B?RXN0a2xOcDZCenQrSWFxQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L216a2x1L1BUY2l5bmdBaTFjL2VuckI5cjZFVUJ0WTR1aXFwWGJ0b1V3MjFB?=
 =?utf-8?B?dGdYUVQvK0xyZHRDV29BWWtIZ042Yy9GUzJFcHpJc0I1ZkdqaUYrSno4ZVlS?=
 =?utf-8?B?RXV3dm1LdWs5Z2ppeksybWhUblZ6R0Qxb0RaK2pQWDdIYjE3VmFXa205Zy9B?=
 =?utf-8?B?Z2RDa0xQam5iTnhya25WTUtZQmxTV1kyR2tTUG9ieEE0bDdHMnd1aVhwQ01J?=
 =?utf-8?B?WmZ3YXNpaFYwRk8wSVhTUmNGbHpDNEF4elNWREdPZDRIb1QrdTgzTlh3RjJY?=
 =?utf-8?B?RkticHlyWWFNYjBxSTg0anhRTmxlRnlyMktRSG8zZzJNNWoyY1ZRTHA4NUFD?=
 =?utf-8?B?ejhLZmdlVU5aWWhHS0lrblFWODNsV3pJZzVLb1dwYmFhcHkzdVZ4c3FGbjBP?=
 =?utf-8?B?L2ZlT3hhUkg2dlR0NHF5elBKTW9mTnZSUHh6ZVJ4TXRjQmhyaHpTNEhoc0U1?=
 =?utf-8?B?QlhDQ0YzMUFRL2dJamUrN1N6ZldlZnRGcmttNk1Mc2sySURLMXNmQ3BSNWt1?=
 =?utf-8?B?NkRjZGxTdEcyeHU0UmtubUNlYndvUW9McjBVaWxlS1ZrcTU5eEFNenJMbE1n?=
 =?utf-8?B?SUNieGhxdUpnU1gxVXd2anBsSGloNFdRUVU5UXM4M2pzTUJ6UTQ3ekVVSndI?=
 =?utf-8?B?NFZQc2NaNWc2YlVoUFRDUDNRdjdXVUliV0pwck03YVo4V2llOVROekprSWJj?=
 =?utf-8?B?dk1raVBxdmxJcTJSY2dmVXl1dlE3ZEhwSmJrQ3I4ZmV5L2JzNFF3OXI0Q2ZZ?=
 =?utf-8?B?dVhHNGxXREtEVG50YjVxQkVEUmdqblM5aWRSM3ZGZTRUaE1VYStLcTNrYW5l?=
 =?utf-8?B?VHk0S3QvYzluTjRGV3F2dkk2elE2anp4N1FNMGoyUkR6TCs0Ti9kc2swd2V4?=
 =?utf-8?B?bGpldjVCOVAyZ240WmFJeWVOYWlwUzhjNlVhdkxKVkpVcnBXeTEzNFRuM2VL?=
 =?utf-8?B?bEJ2ZDNoTDd3WGxaV1hRVFljdTVxQXA3R0RuZDB5R0pwaWREWmJPYlA5aUUx?=
 =?utf-8?B?b0VKWEZFaDVGZ0FxT0JFRTZ4bGIzY2N4MlJlVzV4TXhSZzhvRmJzMmpwNHYz?=
 =?utf-8?B?SEZjRXE4UHpkclZjWXlnNCt3Q29kNndRenZBcW1kQnJPRmxwR3NTd3JVQ05y?=
 =?utf-8?B?SUduQ01DQWd5eXFlbTlxUXFGRnY5K0FZblV4NFBhMkp1MXJnbFRkOHIrNTVm?=
 =?utf-8?B?NmFkdjM5QVFXSUxqNkVOM2dlQnlrbFJoY01aMzVId09BSnI1TitzQXBpc09a?=
 =?utf-8?B?QnlEMER4T3dVWGZvMlE0Sndab0lFWGtTNTJDWFgxL1NSYmhNSGUzL2tLS1Jy?=
 =?utf-8?B?YkhMWk5VVEgyU1V1S01XeS93SnFLNFdxd3k3UDhyS2FYbEQ5amZxbGNqb1Nw?=
 =?utf-8?B?TUhnbTc2Sys0ajhQeUN4dnA4K3E3R3RoTENJVTIwSmk4VjBsVEh6UEdKR1hs?=
 =?utf-8?B?SGFBMGh5a1kwcnk2d1JFVXZjWDNXTjVNNENCQVgzVXJyNGM3QU1vSUFuRnNn?=
 =?utf-8?B?NG0rZmtlaUJmd3h4eFF0eDFNMjR5UW1KbERYNnFoMzZvbDkvRml1ay9hbmJQ?=
 =?utf-8?B?UmZaaVdCNDd2T055YW5YUFZhRUUxSUdSVy9CVUl0Wk12bGFVTElIOFB0TDNV?=
 =?utf-8?B?UEszVGNub29hbFdXamR3UVJCTDV3dkFQQzR3UDk5VFNDSWlvSi85c2dKOXpl?=
 =?utf-8?B?OEJLSnlnL3FiZnphN3I2cFRVYnFFN1BZVjk4MGtHbkZ0UU5pMU45YlBNVk1Y?=
 =?utf-8?B?ZGtsVU4vY2xFOC93MVROUkd0MWlVVE8wQVdldjlxRXV3K21EZnUxNG1GVHpK?=
 =?utf-8?B?UnFQUmVTMHo5aXl4cUEzY0pIcFdjRVNuR08xdFlsNm1oa1dzNElhZ0xFLzE2?=
 =?utf-8?B?anRwajQxcENOS0Q3dDUzTk1vaWQvYnBpaEZHYURjbTFiUitVRVRzdHpJTzgz?=
 =?utf-8?B?eWhMb3J4RlgwV2ltaUVVUFVpVGVqQXRqK0E4dlN4Rk5FaTZoTUdRWjNERUJ5?=
 =?utf-8?B?dmxvUHZFejMvWk85b0RtbFVjUGpFMjdKSFkxNW8yaFdiKy9XQTcxN1FEODZw?=
 =?utf-8?B?cHZuOGlRSFVXMFlPaDRNMUswZ0QrZEk0MS94ek1HcTA1VVlpQStBcXNBcy83?=
 =?utf-8?Q?WTZjKvm1aNU0lxpoVQFjvFCb2?=
Content-ID: <1AD3A35CE4024746AAAA9036128F3729@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96808e86-1b60-4546-b090-08dc6b551ac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:40:44.5033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SdC3s2wie62qJmskrYqfPdYr6W35OIkH8dEgjDxxKE0nVW9WDIO2/vJDrBAOQAmqBJFPU98swwbZ7aY1AxaEGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7338
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.174000-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfgOwH4pD14DsPHkpkyUphL9X4GSJGyYc34E6M1YtcX6vMQG
 d7R3BXX6Jk19vWy5+1dxec6bnKstolm72EsAF82QA9lly13c/gEK3n1SHen81f0TP/kikeqnJqo
 crulnRtHY0jno/xmKIcgG1VNzFAsbDPIzF4wRfrDSBVVc2BozSlkMvWAuahr8+gD2vYtOFhgqtq
 5d3cxkNfao1RHk0ZAxBfcspdAxcUT1at/ElGamu5wCmczKQiW9uZIGkdTgaGCEjPXqMjABGkAtQ
 wNgKniCnUhFCmf6hxTxMLP9+0kv8NnslBTrtlZRPVxlUTP3GoO7AlsRb/Q7WQoYlPnP/8T/Q3AP
 dlZf6Nc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.174000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7FB272DD45D2464ADB3E829E5B03FEF6EFEE964BDF9E3981C3DC663A0C1A97F42000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_2104462062.1842281779"
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

--__=_Part_Boundary_001_2104462062.1842281779
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDUtMDIgYXQgMTg6MzggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIgYWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRl
aydzIGNoaXBzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIHwg
MyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCj4gaW5kZXggNGYwNDNi
ZTIxZWUzNi4uOTFlYmVlZTZjOGIxZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19ldGhkci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZXRoZHIuYw0KPiBAQCAtMTgwLDcgKzE4MCw4IEBAIHZvaWQgbXRrX2V0aGRyX2xheWVyX2NvbmZp
ZyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IHVuc2lnbmVkIGludCBpZHgsDQo+ICAJZWxzZQ0KPiAg
CQltaXhfY29uIHw9IE5PTl9QUkVNVUxUSV9TT1VSQ0U7DQo+ICANCj4gLQlpZiAoc3RhdGUtPmJh
c2UuZmIgJiYgIXN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkgew0KPiArCWlmIChz
dGF0ZS0+YmFzZS5waXhlbF9ibGVuZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUN
Cj4gfHwNCj4gKwkgICAgKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0
LT5oYXNfYWxwaGEpKSB7DQo+ICAJCS8qDQo+ICAJCSAqIE1peGVyIGRvZXNuJ3Qgc3VwcG9ydCBD
T05TVF9CTEQgbW9kZSwNCj4gIAkJICogdXNlIGEgdHJpY2sgdG8gbWFrZSB0aGUgb3V0cHV0IGVx
dWl2YWxlbnQNCg==

--__=_Part_Boundary_001_2104462062.1842281779
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDUtMDImIzMyO2F0JiMzMjsxODozOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyOyZxdW90O05vbmUmcXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7
bW9kZSYjMzI7b24mIzMyO01lZGlhVGVrJiMzOTtzJiMzMjtjaGlwcy4NCg0KUmV2aWV3ZWQtYnk6
JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYj
MzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMz
MjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7fCYjMzI7MyYj
MzI7KystDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyJiMzMjtp
bnNlcnRpb25zKCspLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7
ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5j
DQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KJmd0OyYj
MzI7aW5kZXgmIzMyOzRmMDQzYmUyMWVlMzYuLjkxZWJlZWU2YzhiMWQmIzMyOzEwMDY0NA0KJmd0
OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KJmd0
OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KJmd0
OyYjMzI7QEAmIzMyOy0xODAsNyYjMzI7KzE4MCw4JiMzMjtAQCYjMzI7dm9pZCYjMzI7bXRrX2V0
aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwNCiZndDsmIzMyO3Vu
c2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7ZWxzZQ0KJmd0OyYjMzI7JiMz
MjttaXhfY29uJiMzMjt8PSYjMzI7Tk9OX1BSRU1VTFRJX1NPVVJDRTsNCiZndDsmIzMyOyYjMzI7
DQomZ3Q7JiMzMjstaWYmIzMyOyhzdGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7
IXN0YXRlLSZndDtiYXNlLmZiLSZndDtmb3JtYXQtJmd0O2hhc19hbHBoYSkmIzMyO3sNCiZndDsm
IzMyOytpZiYjMzI7KHN0YXRlLSZndDtiYXNlLnBpeGVsX2JsZW5kX21vZGUmIzMyOz09JiMzMjtE
Uk1fTU9ERV9CTEVORF9QSVhFTF9OT05FDQomZ3Q7JiMzMjt8fA0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7KHN0YXRlLSZndDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjshc3RhdGUt
Jmd0O2Jhc2UuZmItJmd0O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKSkmIzMyO3sNCiZndDsmIzMyOyYj
MzI7LyoNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtNaXhlciYjMzI7ZG9lc24mIzM5O3QmIzMy
O3N1cHBvcnQmIzMyO0NPTlNUX0JMRCYjMzI7bW9kZSwNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMz
Mjt1c2UmIzMyO2EmIzMyO3RyaWNrJiMzMjt0byYjMzI7bWFrZSYjMzI7dGhlJiMzMjtvdXRwdXQm
IzMyO2VxdWl2YWxlbnQNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0
LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_2104462062.1842281779--

