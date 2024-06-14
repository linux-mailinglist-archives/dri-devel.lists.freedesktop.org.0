Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23EF9082CC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 05:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CAF10EC1A;
	Fri, 14 Jun 2024 03:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QAjgUy6/";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dST+op4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F95210EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 03:58:32 +0000 (UTC)
X-UUID: 5b9fca542a0211efa22eafcdcd04c131-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=T6Sg2jex9aSFrJ3w5+i98UFxqJE2yLuvyP7w81mqHyA=; 
 b=QAjgUy6/yaltksqnbJFTNP8vJd0e107fawv7YfjifKTn0HrXz3lK8v2hHFT52/1gRdUmzoQJwN2VMLCMF1W61LhDzG7uGqXgjfZ7E5c9H0UhjRciXEUFYqH9EpID5jQuiFeMq2aNp1sCcZgth0oLz4YE/SbZ8t8rPqEkJD3c0W4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:6e486f6d-71b7-4490-94d9-8a87a2c02af0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:63c39288-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5b9fca542a0211efa22eafcdcd04c131-20240614
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1690066400; Fri, 14 Jun 2024 11:58:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 11:58:27 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 11:58:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYKVqIzZLNALHLinfFjXATUrXFX99E0WFoLGvZQ4o+jNQ+WIPhNsTA6m81adnHZ7/RreV2iKpDLcLHXQqUVr2J+9x2HmJ+juEjXx4KQURw+AV2J+t64Ohi3vrydLOrmWWIuE/lcQabVvwuMxiEY7O3lX0LCPlWNlgaduRZ9Q66SSUzv8OHZK7KSRa1/DYEABN86UuWZ7dyUQYJemwbD3e3LEdn4xOBd3rkx7IomM3U5/PsKebFJz75Xlut/jKuNhN7xwgVDdSp0Mg/xuZ0wnKetBd4FrpWZwajGK7r/V/xuGkNhgkNUnzRr5dKswtrSo+TsYkX1/iZ+e3CU2YePhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLwOa8f5uptod8LqG3FoZcUdjuT3yApPWM4CjfnQchk=;
 b=L88RMtRY76TjL2hHkATcTFhLnMTPNcI3YE+gj6ohDesUl6fT50CdKUqodNARNw/9kjfqzYyisbK/qHi38YiIt8XWBcP4vZxX5aY5U3U+GhAvikbEeuwrp/RBZfhRyM07r3jQ0ahibEBcMfT+eFRfmv9ohj7XFkIXQZ74xiNe2Owiy6xV0ckzInIUG4GTBHZ8vyIFhvq2+zpVHMmckkrxjOXDZ7KWWbPETHtbtRw21rUlEMY1vHfp99Q4P0ljj5cU8eADbI5Imwe8gAJBzvnlBydwYmeIFzuKUPxL6kOQ80H8PIJFvRu8vjyqyhhcgra9t8JRgtmUJE1eA3KuSEzOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLwOa8f5uptod8LqG3FoZcUdjuT3yApPWM4CjfnQchk=;
 b=dST+op4mK6fNKpkrtPTAcHZDey5zJ+FU+OhTYYM0RbxtbG136NtKkH73ZN5UeIhSL7vqmcYE2i7uA1QKrA1zSyfrc/ctNsvAeWR3jfmAzhHlhQc/C6V4Go6VBD6j+Hl0k5t1YtTEoPZFS1LlxL5qYrSSag5ZZh36hiTWf4MMaOk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB7281.apcprd03.prod.outlook.com (2603:1096:400:21f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 03:58:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 03:58:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
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
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v9 10/21] drm/mediatek: Fix XRGB setting error in Mixer
Thread-Topic: [PATCH v9 10/21] drm/mediatek: Fix XRGB setting error in Mixer
Thread-Index: AQHavgU2BIIUh+nU3Em9hsnbQR963bHGoimA
Date: Fri, 14 Jun 2024 03:58:24 +0000
Message-ID: <20d9165c911b7e165de1bb1eb6aa08d705bd3a4a.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
 <20240614024620.19011-11-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-11-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB7281:EE_
x-ms-office365-filtering-correlation-id: 2ed4a4cd-04b2-4267-7270-08dc8c263d16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230035|366011|1800799019|376009|7416009|38070700013; 
x-microsoft-antispam-message-info: =?utf-8?B?TS9JUnlpc1Fya2UrRE5Nb0h6eTI0OVNkOXFseDQzQ2xnM1JhYUROcE9HeFdt?=
 =?utf-8?B?d0U3ZWFSd3Zwc1VFNGUrRnJaN0VUUFR0ZlIyV3RYWDRGTXpqK25nQlZBQmgw?=
 =?utf-8?B?a1VDY0tZcG1WNGsvcy9Ib1RZc0lBZ2IvQWVId0ljUkF6QmFyOEFlZG9xc3Vy?=
 =?utf-8?B?cUI2YjY5eU5uQzRrK0JjWFFoTXZCNXVOQWl3Qmw3SkhRQ3VsK2JWV2dUMVZC?=
 =?utf-8?B?MU1QQWZ1TE5SazlVQlhUdGRCZXN5OVlOc05OWm03V0d0MXBieU5zSmZkeGQv?=
 =?utf-8?B?NGJMbU5wSit2L05uVjZyUEJqNXkwUUtGbnhKWTBmOTQyRFRPYU5WcCtkZ0NM?=
 =?utf-8?B?NVFHR20yZGN5RHZKQ1lxbzF4cklReEZpZ2ppeXdWaVRvNWlhUENBOEhXOUJS?=
 =?utf-8?B?T1ltNmE4MkEvMzJzN1EzZlRCQW5jNUJUb0t3Z3JQd1JTK003Mkw5QnZLNDJi?=
 =?utf-8?B?cVpDRExndU1NQnhDaTdLcThwWnpiRXRiRUtiOU1DQkV2dTVUMkxyWUN1Q3F1?=
 =?utf-8?B?dENneStQQ3dpb1UraGpoYUNrcEhiTjhyd2ptNUs3MGt5cGJnb0tkNjZyaU5i?=
 =?utf-8?B?NjhPL0tqUHVkMGhWRUZHZzJMNzBvRTdlZnNkVGhiNkIwL0ZzV3pNTkpBaU9M?=
 =?utf-8?B?ZG52REZoQVZBRldTbHlXbkdRRStMQzl4N0REYmtkejVLMkYrWGhpTkVkQ0NT?=
 =?utf-8?B?d0R6dWdyMC9hMGo1dHpxWFBCYUplYmw3Q3oyMzNmT1lGakM4WFNZblBnbmFk?=
 =?utf-8?B?VWhpSGgxUklqQUlwT3RpaTRGM3ZHK1dKZEJXWUJId1o5RnM0dnEwRFhaRi9M?=
 =?utf-8?B?d1JaVHhuOW9xNEl6V2srcXFQT3B3NDMxalNpVkU2QXdSSXFpVk13Zkk0Q3Rx?=
 =?utf-8?B?MjhIN2U2b0ZJbWhHV3RHTEt2ZmoyZy8xOFdZOEZobHFyZWpKdlByRjEvL2Fl?=
 =?utf-8?B?MVZKeU4vbU5kYy9NNlBxZkFiYW9XV1kyZGtnZThvOWV6TEVORHJrQ3RYNWVq?=
 =?utf-8?B?SlJjSVJZdmtmQWVYNHd0SWlLaS9jeEJVSmdLemhjZjBOcDlVcmpZV3hIWGJC?=
 =?utf-8?B?MzgyMTBiQk5wRU93RUJFbkdyWlpXbVBsM1hFMmsyK3VhMHFUMGJ6ZjhMbnVD?=
 =?utf-8?B?OGtnSzJHRkNwOUN6MU5aTUhhbFMvZE9rSzducVlER1h0NDRNdldqNk5IMU1V?=
 =?utf-8?B?UXhkbWEvcEpjV2EzTG9iVnJiY0RvTEI3bUJmYVRXb3FQQnZsVyttV1VMd2FK?=
 =?utf-8?B?K2puNHZIL0ZHN1J1ZjNNRE1hNU1tT2pJaGpwY2VGd3BXQ1dxSmpvV3dBVWh2?=
 =?utf-8?B?TUEyUlY0dXNlbDd1ZjBuMnFOdW43SXZOYk53Y0xQUWdEalpjeGJmT0wrWGZ6?=
 =?utf-8?B?NjdvSkQxY0ZXSStmd3dyZFFKeXpWdk94YnRnelduaXcyZDhrcTQzUGw5Vnlp?=
 =?utf-8?B?aEVuSVE5YThsZC9UaFk3WCtleGZYOEJGejVYZXIzN2hpcTE4NmhVQS9KSTlj?=
 =?utf-8?B?bDRzMzlBZTdxcFFDeW9lL2NSUURST1pKY1c5c0FoOVhDMW5nalRPVHRlenRG?=
 =?utf-8?B?Wi9CN1UvN0pvaUMvb2xHbDZaOGNxU09vUDhFTEUxeXk5K29YUVFWYWNabUJF?=
 =?utf-8?B?MEh4S2Uzd3lmeEgvYzZJOGpvTGNBL3RNNm16c3J4d2I5RGlFcGI5aVp3UFhQ?=
 =?utf-8?B?aWt2Q3lxaG1KTnlpaDVPSFdQUG1JQnY3VndhWUNNU1dySmdRQ3prUXFrb2RU?=
 =?utf-8?B?azBMWlQ0ak5yS0hENGVtRStxY0g3V21RSXR4QU9rMmpOWnVNaUtDQmdNNTVO?=
 =?utf-8?Q?MdJXDR3LtcD6SG9RtoBm/FBpf3hOHenEBNsb4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(366011)(1800799019)(376009)(7416009)(38070700013); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?US81dWpWYS9CN3JheFE2MGxuY3ZaaXZqMTlHSjdRYVFra3owMHY3ZmMrcjda?=
 =?utf-8?B?N3h3WjlURU04WGhJU25qQTNsTEU3Zm1UOTRmcFZOeUkrWmp4ZlhZQzR3bUkv?=
 =?utf-8?B?SGQ1NllaczN6RWtuSlpZdHgramh6dnVkOXp0ZFhpeER5YnhOcy9Da3RIVDZp?=
 =?utf-8?B?bVNUUUtHSDZFaUpjbHZuaXYvVC9tNUZqME15MThJRkFIT2hTWnRiYUNyTjE5?=
 =?utf-8?B?UlJ4TTFJdms4YTd6UllnQitwSnJSVzErUloxT0xjbm5kMHFXVXdOVHdNdmU3?=
 =?utf-8?B?Z1RBTTFWakNORFdEbzlPWitBcmVnQm8yMWpvc21GYVFVRGVQTHhLeE85a2pM?=
 =?utf-8?B?SS9ORnpCWnlGWTFlcmsyem90c0ZweHA2ZGtqRDdDWmx4RCtVQm9oRlFmbk01?=
 =?utf-8?B?Q0dsdDJpWWd3WnFJVUV0VVIzUVBLQ2xybVlQRks3ZElwVHdQT0dCay9SLzk2?=
 =?utf-8?B?bDlpN1gwNTNHSlVnQkdkOElnenVSSytXUW9hUzFtejFTVThlRVE4UzgrdkFi?=
 =?utf-8?B?QVNEaDV0Z3Ezb3JJVnhFcVdjY05FbUhGQW1wRXVWQVczWi83TGF4eXNpUlly?=
 =?utf-8?B?TUhmMWl3eW9zWUh1UUcwdGE0dlJ0bFpPWUxNRFcyRE1CckdBWnJpdXhmczdZ?=
 =?utf-8?B?TWUzV1Q0SmtZeWhCUXpEZEhkazhzRjA2V3RLVU45K0c1YWFEV09kUFdKVmNm?=
 =?utf-8?B?dUlRWlVCMnF0SFFNdFlMN3J3K3FVNS9vNzIyckxSZzBhU3d1NFU1MUVkR1g5?=
 =?utf-8?B?YWlweERLd1lqMmlNcDFxRE53OFpNV0NULysrTlp1SzZlb3l5dStTQWxMWFJT?=
 =?utf-8?B?bVk1WkpCYnovVGVuRitsbWJhS25xZHFtK1d3NzU3UEJmMC9lUHJJT1FLMzd6?=
 =?utf-8?B?L3Y5ODVZaTdwYklSYUdub2d3WW9GSjNPOSt5M29OcllqWlQ2MGFMQjNteDNQ?=
 =?utf-8?B?dTJNNWxENjE0UjZCWUFmK2FNazAvcDA1Qi9YVU9rbkN2Q0xzTngzZFdkSmxZ?=
 =?utf-8?B?cVJyRjhyQTR5ckFtUEU1Y2lLbm93ek15UjkzQ2RZeXcvMlkyL0t2YUFwcUVL?=
 =?utf-8?B?dmNaYU12T2U5bk15ZmRpd2N4MVJHSmdFQ3ptejJnUHVyYXp1WXdjNmtsN29E?=
 =?utf-8?B?ZGpFaWFqK084czBkYmJVVmNCeTl0bGdkT29nWUViUGJLRG8rUDZaL1hZY2Ez?=
 =?utf-8?B?RGJyUDg5anJ5TWNsUVlPbXhrRU4vYmxMY2RJcWtZTWRuYmcxa3g4c3UvMndH?=
 =?utf-8?B?VDB2QWt6U3RYU2FUWGVWNjVLY1M0a1U0RUhqMlk5bW5hZ1FTWXB0cUpBNFRK?=
 =?utf-8?B?NjdCTVdKUENuRnhIWklSVU9CQ1gwRjE5NXZmUVRsMTVYc1N4Y1M3RWQ1NkFX?=
 =?utf-8?B?SGNVZ3ZxaGdDVDB0bkxIOG1ReGJ6cE03UHhzK3hMYTREYnRibStvQzUvOVVV?=
 =?utf-8?B?VG9HVElqTktPNkJvNEJDaXZIM0hzd0xnaGZUQXJaODBwOHZPdWdGOG1FVUI2?=
 =?utf-8?B?akhxUllpc202UURONFUvc2hxa0hkS05VWjlVOWdETzBQQ0x0NlhKUGxkQW9j?=
 =?utf-8?B?d3BEa0I4YWt3RmFZVDdYNUE3Z1NnR1FZRGNKOGI2a2RqWW45VUd1Rks4eWFv?=
 =?utf-8?B?QTlzT2lIekplYkZtTm9ENk5iUURhOUNoSm5TRS9vaXcxZWNVVUtJai9mV2tJ?=
 =?utf-8?B?MGZHMjVBeWdNS1pLazhNbUoveU0yS3NLUlBJODlUSHVrdDJwK2dGSi9rUzRE?=
 =?utf-8?B?MThRSnlzNktCK3l6dmx5aENyV1NqMTNoQVZDcnVhOUZ3SFpINTgzZVpZYU9C?=
 =?utf-8?B?WTQ3S2JFR3puVXlqdVpENlRYd0JaUm1PUWZRKzBuVHdXOEhIVXpsQllNVnB4?=
 =?utf-8?B?a0NuOFNPWmlpeTV6MlN3VlptNi9PcFpvZWhNNXBzd2ROS3plazk3UDNyZ1Z5?=
 =?utf-8?B?VU9NQk5XWTFMenFMVlRncWJJanZWK0xEVzZkNWxQY1FtSkJuY3c1UjV5QjJz?=
 =?utf-8?B?SGRGZjdic1c3Y1VvZWpWM3NoOHZKdHdkUy9ranhDWWNDTDJzMnBEcmhCZXlM?=
 =?utf-8?B?NlEzNEppVGtHMlljU2x3cG94OW95aGZHWTd0YWxGMDdXcnBnaUcvbURxUjZs?=
 =?utf-8?Q?osDYC5JZoVfZkuzXq9tUp83DQ?=
Content-ID: <FFFED623852CC7438353524500C28AB8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed4a4cd-04b2-4267-7270-08dc8c263d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 03:58:24.1222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vzr6qWg7YPUWUXxx3o0gdrnBY/pNUQAdn7161uTpkT1X1mRxLW1um4NYccWTHtjwVXF0rY0bByxuNq14irSr6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7281
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_930891251.330345969"
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

--__=_Part_Boundary_007_930891251.330345969
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gQWx0aG91Z2ggdGhlIGFscGhhIGNoYW5uZWwgaW4gWFJHQiBmb3JtYXRzIGNh
biBiZSBpZ25vcmVkLCBBTFBIQV9DT04NCj4gbXVzdCBiZSBjb25maWd1cmVkIGFjY29yZGluZ2x5
IHdoZW4gdXNpbmcgWFJHQiBmb3JtYXRzIG9yIGl0IHdpbGwgc3RpbGwNCj4gYWZmZWN0cyBDUkMg
Z2VuZXJhdGlvbi4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoN
Cj4gDQo+IEZpeGVzOiBkODg2YzAwMDliZDAgKCJkcm0vbWVkaWF0ZWs6IEFkZCBFVEhEUiBzdXBw
b3J0IGZvciBNVDgxOTUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3
bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2V0aGRyLmMgfCAxMiArKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZXRoZHIuYw0KPiBpbmRleCA5Nzk2ZmQxZDUxZjIuLjkwMmRlYzAzYTdkZCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBAQCAtMTUzLDYgKzE1Myw3IEBAIHZvaWQg
bXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBp
ZHgsDQo+ICAJdW5zaWduZWQgaW50IG9mZnNldCA9IChwZW5kaW5nLT54ICYgMSkgPDwgMzEgfCBw
ZW5kaW5nLT55IDw8IDE2IHwgcGVuZGluZy0+eDsNCj4gIAl1bnNpZ25lZCBpbnQgYWxpZ25fd2lk
dGggPSBBTElHTl9ET1dOKHBlbmRpbmctPndpZHRoLCAyKTsNCj4gIAl1bnNpZ25lZCBpbnQgYWxw
aGFfY29uID0gMDsNCj4gKwlib29sIHJlcGxhY2Vfc3JjX2EgPSBmYWxzZTsNCj4gIA0KPiAgCWRl
dl9kYmcoZGV2LCAiJXMrIGlkeDolZCIsIF9fZnVuY19fLCBpZHgpOw0KPiAgDQo+IEBAIC0xNzIs
OCArMTczLDE1IEBAIHZvaWQgbXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJaWYgKHN0YXRlLT5iYXNlLmZiICYmIHN0YXRlLT5i
YXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gIAkJYWxwaGFfY29uID0gTUlYRVJfQUxQSEFf
QUVOIHwgTUlYRVJfQUxQSEE7DQo+ICANCj4gLQltdGtfbW1zeXNfbWl4ZXJfaW5fY29uZmlnKHBy
aXYtPm1tc3lzX2RldiwgaWR4ICsgMSwgYWxwaGFfY29uID8gZmFsc2UgOiB0cnVlLA0KPiAtCQkJ
CSAgTUlYRVJfQUxQSEEsDQo+ICsJaWYgKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5m
Yi0+Zm9ybWF0LT5oYXNfYWxwaGEpIHsNCj4gKwkJLyoNCj4gKwkJICogTWl4ZXIgZG9lc24ndCBz
dXBwb3J0IENPTlNUX0JMRCBtb2RlLA0KPiArCQkgKiB1c2UgYSB0cmljayB0byBtYWtlIHRoZSBv
dXRwdXQgZXF1aXZhbGVudA0KPiArCQkgKi8NCj4gKwkJcmVwbGFjZV9zcmNfYSA9IHRydWU7DQo+
ICsJfQ0KPiArDQo+ICsJbXRrX21tc3lzX21peGVyX2luX2NvbmZpZyhwcml2LT5tbXN5c19kZXYs
IGlkeCArIDEsIHJlcGxhY2Vfc3JjX2EsIE1JWEVSX0FMUEhBLA0KPiAgCQkJCSAgcGVuZGluZy0+
eCAmIDEgPyBNSVhFUl9JTlhfTU9ERV9FVkVOX0VYVEVORCA6DQo+ICAJCQkJICBNSVhFUl9JTlhf
TU9ERV9CWVBBU1MsIGFsaWduX3dpZHRoIC8gMiAtIDEsIGNtZHFfcGt0KTsNCj4gIA0K

--__=_Part_Boundary_007_930891251.330345969
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMTQmIzMyO2F0JiMzMjsxMDo0NiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O0FsdGhvdWdoJiMzMjt0aGUmIzMyO2FscGhhJiMzMjtjaGFubmVsJiMzMjtpbiYjMzI7WFJHQiYj
MzI7Zm9ybWF0cyYjMzI7Y2FuJiMzMjtiZSYjMzI7aWdub3JlZCwmIzMyO0FMUEhBX0NPTg0KJmd0
OyYjMzI7bXVzdCYjMzI7YmUmIzMyO2NvbmZpZ3VyZWQmIzMyO2FjY29yZGluZ2x5JiMzMjt3aGVu
JiMzMjt1c2luZyYjMzI7WFJHQiYjMzI7Zm9ybWF0cyYjMzI7b3ImIzMyO2l0JiMzMjt3aWxsJiMz
MjtzdGlsbA0KJmd0OyYjMzI7YWZmZWN0cyYjMzI7Q1JDJiMzMjtnZW5lcmF0aW9uLg0KDQpSZXZp
ZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczomIzMyO2Q4ODZjMDAwOWJkMCYjMzI7KCZxdW90O2Ry
bS9tZWRpYXRlazomIzMyO0FkZCYjMzI7RVRIRFImIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7TVQ4
MTk1JnF1b3Q7KQ0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYj
MzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0t
DQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7
fCYjMzI7MTImIzMyOysrKysrKysrKystLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtj
aGFuZ2VkLCYjMzI7MTAmIzMyO2luc2VydGlvbnMoKyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkN
CiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19ldGhkci5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZXRoZHIuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzk3OTZmZDFkNTFmMi4uOTAyZGVjMDNhN2RkJiMz
MjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2V0aGRyLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2V0aGRyLmMNCiZndDsmIzMyO0BAJiMzMjstMTUzLDYmIzMyOysxNTMsNyYjMzI7QEAmIzMyO3Zv
aWQmIzMyO210a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYs
JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtpZHgsDQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMz
MjtpbnQmIzMyO29mZnNldCYjMzI7PSYjMzI7KHBlbmRpbmctJmd0O3gmIzMyOyZhbXA7JiMzMjsx
KSYjMzI7Jmx0OyZsdDsmIzMyOzMxJiMzMjt8JiMzMjtwZW5kaW5nLSZndDt5JiMzMjsmbHQ7Jmx0
OyYjMzI7MTYmIzMyO3wmIzMyO3BlbmRpbmctJmd0O3g7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVk
JiMzMjtpbnQmIzMyO2FsaWduX3dpZHRoJiMzMjs9JiMzMjtBTElHTl9ET1dOKHBlbmRpbmctJmd0
O3dpZHRoLCYjMzI7Mik7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2FscGhh
X2NvbiYjMzI7PSYjMzI7MDsNCiZndDsmIzMyOytib29sJiMzMjtyZXBsYWNlX3NyY19hJiMzMjs9
JiMzMjtmYWxzZTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2Rldl9kYmcoZGV2LCYj
MzI7JnF1b3Q7JXMrJiMzMjtpZHg6JWQmcXVvdDssJiMzMjtfX2Z1bmNfXywmIzMyO2lkeCk7DQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7QEAmIzMyOy0xNzIsOCYjMzI7KzE3MywxNSYjMzI7QEAm
IzMyO3ZvaWQmIzMyO210a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0JiMzMjtkZXZpY2UmIzMy
OypkZXYsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtpZHgsDQomZ3Q7JiMzMjsmIzMyO2lmJiMz
Mjsoc3RhdGUtJmd0O2Jhc2UuZmImIzMyOyZhbXA7JmFtcDsmIzMyO3N0YXRlLSZndDtiYXNlLmZi
LSZndDtmb3JtYXQtJmd0O2hhc19hbHBoYSkNCiZndDsmIzMyOyYjMzI7YWxwaGFfY29uJiMzMjs9
JiMzMjtNSVhFUl9BTFBIQV9BRU4mIzMyO3wmIzMyO01JWEVSX0FMUEhBOw0KJmd0OyYjMzI7JiMz
MjsNCiZndDsmIzMyOy1tdGtfbW1zeXNfbWl4ZXJfaW5fY29uZmlnKHByaXYtJmd0O21tc3lzX2Rl
diwmIzMyO2lkeCYjMzI7KyYjMzI7MSwmIzMyO2FscGhhX2NvbiYjMzI7JiM2MzsmIzMyO2ZhbHNl
JiMzMjs6JiMzMjt0cnVlLA0KJmd0OyYjMzI7LSYjMzI7JiMzMjtNSVhFUl9BTFBIQSwNCiZndDsm
IzMyOytpZiYjMzI7KHN0YXRlLSZndDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjshc3RhdGUt
Jmd0O2Jhc2UuZmItJmd0O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKSYjMzI7ew0KJmd0OyYjMzI7Ky8q
DQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjtNaXhlciYjMzI7ZG9lc24mIzM5O3QmIzMyO3N1cHBvcnQm
IzMyO0NPTlNUX0JMRCYjMzI7bW9kZSwNCiZndDsmIzMyOysmIzMyOyomIzMyO3VzZSYjMzI7YSYj
MzI7dHJpY2smIzMyO3RvJiMzMjttYWtlJiMzMjt0aGUmIzMyO291dHB1dCYjMzI7ZXF1aXZhbGVu
dA0KJmd0OyYjMzI7KyYjMzI7Ki8NCiZndDsmIzMyOytyZXBsYWNlX3NyY19hJiMzMjs9JiMzMjt0
cnVlOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOyttdGtfbW1zeXNfbWl4ZXJf
aW5fY29uZmlnKHByaXYtJmd0O21tc3lzX2RldiwmIzMyO2lkeCYjMzI7KyYjMzI7MSwmIzMyO3Jl
cGxhY2Vfc3JjX2EsJiMzMjtNSVhFUl9BTFBIQSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO3Bl
bmRpbmctJmd0O3gmIzMyOyZhbXA7JiMzMjsxJiMzMjsmIzYzOyYjMzI7TUlYRVJfSU5YX01PREVf
RVZFTl9FWFRFTkQmIzMyOzoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO01JWEVSX0lOWF9NT0RF
X0JZUEFTUywmIzMyO2FsaWduX3dpZHRoJiMzMjsvJiMzMjsyJiMzMjstJiMzMjsxLCYjMzI7Y21k
cV9wa3QpOw0KJmd0OyYjMzI7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0t
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

--__=_Part_Boundary_007_930891251.330345969--

