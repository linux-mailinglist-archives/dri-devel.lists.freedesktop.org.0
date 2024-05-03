Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD68BA56A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 04:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F9F1127EE;
	Fri,  3 May 2024 02:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MQImXlxc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="f5I53AS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFD61127E6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 02:51:48 +0000 (UTC)
X-UUID: 13f8c71c08f811ef8065b7b53f7091ad-20240503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=r5DXofMP945dySkA3MWjVn7zFamSjbQL5qZz8WF25Y8=; 
 b=MQImXlxcUbgkQOow6tIxIX5yhbIBWXC8wyy+wss0yWBfSxuDh1ZdI2C5HQ+Y9IWgE9bo9DbiwoRG3MnCVt3s7t8V9V2aVYrJJLmB2y+C5nxbiZhw3TX/618wUi0f6BxlS0nUD8c0NW6DRiDmnzTwi46O3lD0XSmz/WaItCHsUoc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:be31dda3-4a9a-474b-b1e0-336d9222e1ff, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:70f3e486-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 13f8c71c08f811ef8065b7b53f7091ad-20240503
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 8521705; Fri, 03 May 2024 10:51:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 May 2024 10:51:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 May 2024 10:51:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMBVKQqsbRCQCVrBbOTh2yD8oXHs/UZdH7lFtG8gVOezfFhnF9Ek9xBqeFni5OXIJ+YrI5UKjK/XAZkGyqbP1oOI3gp8pbePJy0BvIO0jKlNKrslcxX2/9vgIMPVOziwvIkODmhHDh4lRJXty2eSRWKB96jD7uZH+zxmHyAywhFk646LG95C1VOVJmgHIJ5gmL9XsYDRWU4Q+6K89+R8/S9xafyqxAVkvjcYEgykjkTHmUZMh6O2Nz/6xLQTvw80QjbKIxtWfEcVhbT8qPZ+7b26f78OKcQpyaxVJXwvY7Ju0k5qJdtaDTHAVSR1Nwqhu1aBo6KK8CQ4AxSw32WY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NV3aFetrONaFXqvssgvBUtGPlfuTrR6GuIXm3wEBfKY=;
 b=JYgp2R50/elQ7Tv+BANFj6LQ4W610Jiw48dMG0c5jGR6nJC17pMUtcY3fsBazs3+lDCocHit1m1aVovpj/ZC5Y83N/jhkadPRx65jAK8rdFHSrtsQKA/ic0zDVW+Xvkf07ja2pvlgD5Snk4H+AN9BFFtu7DOUmTlXoFHU5RWErZ8CczOKq1or/H3ef4jmwVu3r/ltJKVL/2D6d8G8ybQdbsmqulDT4PjctzTv0LMtPHYX4e5GaZbvx2CTQWJ1Un+xi9BV0EZQHoPYkOZRbBzOzHFNJMeFc/WLGkLdYKh1Eob+XVEPr0Xerpu8Cj/KbraLrIohczAWE0kVHjZsPR7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV3aFetrONaFXqvssgvBUtGPlfuTrR6GuIXm3wEBfKY=;
 b=f5I53AS+cvhYA0vKzwujStVisK8FVk7YdkSP2fPtbiczVCZ2cmjzBOHT3ZjubwA4Ys2DOXjeki4sWjMWVoFPUPC3lfosdWvSQj+CdYwJxFsIOFHG1KkvV5tU/C5KX0qgUd2jV2Oe+dQwux9ryNRFo2PxjskiDny8hcqUzBpkGns=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7847.apcprd03.prod.outlook.com (2603:1096:400:464::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 02:51:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 02:51:40 +0000
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
Subject: Re: [PATCH v7 07/18] drm/mediatek: Support more 10bit formats in OVL
Thread-Topic: [PATCH v7 07/18] drm/mediatek: Support more 10bit formats in OVL
Thread-Index: AQHanH0O3w9pKKf6gE2P5qOw3FKb4bGE0KsA
Date: Fri, 3 May 2024 02:51:40 +0000
Message-ID: <518f61f3a89bcfdc4560865e65942cdb0977e10b.camel@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-8-shawn.sung@mediatek.com>
In-Reply-To: <20240502103848.5845-8-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7847:EE_
x-ms-office365-filtering-correlation-id: ab69af44-42ce-4224-8f83-08dc6b1bf57d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|376005|366007|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?cGU3dGtIVHRJUFN5a2NaOFF2S01GTHBuakJXMmkyKzVJbDNYbWV4a1dwUzNz?=
 =?utf-8?B?VmdyZVRsQVkzS09PdU5SSWE0VlB1ZVF6bEdMVDF3MGU3amM3cEY0SGhpT2FZ?=
 =?utf-8?B?M3o1ejRNUnVYYjZkZGhMTStmSm5SaEQyMFRSMzlmVDdQVXFzM1lFSGJoWURq?=
 =?utf-8?B?VDBaNzE4ZU1iTXhvVmVzUDRwYXFwamtTcGY2ZXJqV2V4UHptSFZVNDZhNTQ5?=
 =?utf-8?B?V3JBM1VIQS9xM0t0SU0xRjZTWWdLdHlJUGNqenVzYU5QL3FwUGUxMlFsNjN1?=
 =?utf-8?B?dmpUMmZkZXRsQjM2RGN4dm5ZNXBQVm9maTVxMHFpRkc4NzgxUEk1WTF3ZGw5?=
 =?utf-8?B?dE1nbmJ5bFF5TVVkaVc5MlMvRXdHWVhFOTZQQTdhVmNxbHc1ZVFrclFwMlk3?=
 =?utf-8?B?SmdTeGdZRnNIUWh3QnRsSDQ5cDYyOE50bXp4M1V3dllhQWJ3eUhMTlFMalAx?=
 =?utf-8?B?ZDBpQlJqM3ptQkNHSVB3cVA2M2VsdkRhclR1SGRXOFVMRHIzNzRiQ2RKbkZn?=
 =?utf-8?B?VWlhRVV6QXJsMWVMZGZKWTdoc0U4b0tUdk9BRkE3S2x3WWNVd1BPd2UybXEy?=
 =?utf-8?B?dnAwaUZVSjhGcmhObm83OFRuekNOUmsrY2dMRk05OHN3K2E4WEVsV21Wb21l?=
 =?utf-8?B?dkhFNFBVZEZHWVhlSlQ2Zk5GQ3FnOE1lYlR5SUs3S21yOHFzZ2xqSHZMazlt?=
 =?utf-8?B?Y1RKVnRZWmFzOUhPN2dWaGNYMGxGLy9vQWFBc2FPTGxwMU1oM1MwcldqdEVN?=
 =?utf-8?B?cCtUMGtQbWdWTTVCYlZvWnIwR1daUnlNZGdOUjI0SmhsKzRxbmV2eFBPWXM0?=
 =?utf-8?B?b1E0M1FpVmEzN2toWHpLcjVNUmxEdTlTTVFWVG9nOFlqTVJRR0FNOUsrMkhD?=
 =?utf-8?B?U0RQVHdsdEFkOEdFdDREcVhCbDFPRU0xcnBXa1drU3VwU1BhZWJ6MW5wZVlD?=
 =?utf-8?B?MlFxUzhJWldrVW93ODZqMm0vWlE2andMUXREck1EUXEyQnhqa0YyQ0JoajFT?=
 =?utf-8?B?U2YxTnRSS2pJVldmSTdySXdmbGxyak9tbkdpOXJsVnFnNEN6eCt6cXRqQVRT?=
 =?utf-8?B?QTIyYUtHYU41Z050Y25Ba1BXUnNENlhoUThmWW5Rb0ZOYXEwSUtVejdYNkhY?=
 =?utf-8?B?dTJvMVExM040V2JaNG1PY3RzNXNGYnZoeXkxTGhzQXJXNXBBODJDelhqSUd4?=
 =?utf-8?B?aXV5ODJJVUlQN01IMkRYQ2pJcE9GRm1wWGszS2djWDRxNk0rckRKRjZJWnE5?=
 =?utf-8?B?Wkw2VUE5S3JQbncvZlduK056Zm1lUUprOEQ0TEQrQWdjNjY2VUJldHlHbGg2?=
 =?utf-8?B?UEdQdGxhV3lzODZKeXBNRURETS9JelJ0Mk03b2ZMRzRPRjhaaDJqSFg1RmtE?=
 =?utf-8?B?c0JnV3lWUStEMWJqTzZ3K204L1I3NkxXRW1CZTJDWmQ0Q0ZDdmJ2V1JiaUlv?=
 =?utf-8?B?M2ZoZ1FHcGNtNG5qWWlISWZ5aHM4RWZwQ0pzbWZUbnV6OFVWb1F4ZTI4Q2Vv?=
 =?utf-8?B?ZXFEdDA5Tnh2MHE1RzI3S3hYVXJ2elkyM3cwdWR0amtQS0lQSndlWXhBRFRt?=
 =?utf-8?B?QVJlUHBLVFVya2o3TERjQzNobGhhNUFFY1VkK25XUS84VUQ1bEpxM3krN1cy?=
 =?utf-8?B?YitHZGduTmlJa0xWdjBpM1FvcDZZQUowZnc3QXZScW03bUhBMWg1Q3luVHJN?=
 =?utf-8?B?VTNuSWVuM2xXTjBGbE1SWXlpejJZbkh5cktrelZTSFgwd0hFQ2tRZEhkUlJ4?=
 =?utf-8?Q?V3i9DliZGnm4DTFwGRWpDTJjRW/iMHbYoaBcBUy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cC90ZWZ1VG5rZWI2NUdmeksxb1ArTG4wbmdhMFdNNTJkMk5pdEJFS1NqMUlX?=
 =?utf-8?B?QTRTUHBqaHBIeEtzeldvUUhUQlF3cDFwOW1ZTkRRSUFoS3IrdXliRFpHekdG?=
 =?utf-8?B?eFpERmdqRkxzNDZsYTA2cGpHQThFRkovenIvQjgwWHFOcTF0VGZxdEt5d09o?=
 =?utf-8?B?Y2lFTFY0OW8zY0kyM25wM1Z3Z01UVkwwWU5OcmtVM2o1S09YemZjWGwvZUps?=
 =?utf-8?B?Y1Z5NnlHZjVUQkV6SEpUUmZUakdzTkd6ekJSUy9SNldZRDJKbTFENUxXRUV6?=
 =?utf-8?B?a05LWkd0RkhxMDg3SmV3UUlBcUE3dERVRzBxb0kvUmVzTHpqWEdjdFF4aVov?=
 =?utf-8?B?K0phTlZmZ3pVR0dTT2NxeGYzYml6SWVBSHI2ZC9uenU4MFF3LzIvRGNkWXQx?=
 =?utf-8?B?U0NGNHZ2bjVmNHVtNXlVeGJ6ak9IWlVzZlRkUUxJSFBPRXhMTXVLb25jVlJI?=
 =?utf-8?B?R0o4K1AzdlVXWld0a0JhY21mb0w1cTNPdDN6SlA0QzVFZHc2ZjkyUFlvd1pM?=
 =?utf-8?B?cHdWS25FTFlmajZzV053RU5vKyswbGMxbTBjbWZYTmFIcklzYVEwV2JiMEFI?=
 =?utf-8?B?YW9WQnhkb1p4L0Q4WlMrazZqaForanpjNjZ5dS85Q3pnTkVHNWU3VUxRMjU1?=
 =?utf-8?B?QUVvTmdiWDBQYkY2di9pOVFRMnBOS3dFcGRTVk9zUWlNeXZOWlNTOENuYVBG?=
 =?utf-8?B?YTg3eFVkc2t2Y1dkZWRqM2ZwMDRkaVhkdzVJandIVTZwbkx1U2NTenB1TGpN?=
 =?utf-8?B?UkNpZVJxbHdaL0JZYUx5TUU2Mzg3TC8yTmltanFzWng1Vmk3VUdvczRuRDE1?=
 =?utf-8?B?a1hzbWxyR3pmdDNWaEVxZkN5RTFnd1pHVmgwM1Q1a2o3aXFWUXZ5QnRUNTZG?=
 =?utf-8?B?RGd0U2FJSUtZcU5va3ZrRFBVUkFVc1BLRWxTK3VOWHpPTzgyMUtrRmNpMUpt?=
 =?utf-8?B?cGVCVGtPVlRuWGxBTkduMXdFdHhicVdzbzJuMC90KzdsV29QS3BVb0tjQUFr?=
 =?utf-8?B?ZjVNY0tjVXl5aThDV01nZ2NZYmRxYmwyUFovWlpLNFhMNHc1N0lNVi9LTmlG?=
 =?utf-8?B?dVMyblBiQzRSNlRKWEppMmM5MVlCYjg0UGdsQWsxUG01cytBVytRK1I1WDFk?=
 =?utf-8?B?WFo5cFZkcDFHSlBHSnJzdy8vZktTekp5aXVhaFRKRHBaM2lJWlhHU1NKK1V5?=
 =?utf-8?B?QklocG1BVzJ1Nm5SMU1zYTh5WTBYMEZLSmgxTHE1bVQ3THloRXlaSWMza1JK?=
 =?utf-8?B?bEVyekdwY0M4QTZRSEFVbFQzSFZTQ3BDWE92ZDdaZTI5dC9DL2lwT3VTUm5F?=
 =?utf-8?B?RmQvWEJ3cDVEZmFCbGhuWkVVSGtUWlNKTzJvSUowQTJNQXpXSFdFQmpsbWUr?=
 =?utf-8?B?bzJVc1N2SUlJV1NFdzQyNFErMXNuR0JKNDhOYnU0c0dxSUFFMTJKazNza09D?=
 =?utf-8?B?bFFEMktpcmx1YWFHSllvQVNUVCtzVmNlakh3aC9rZHFYQ29ScDNYZVdaWENj?=
 =?utf-8?B?ZnNzL0s2MG5Dc2ZYZm9SaFZVN3FqanhEQ282RlBuVWNWQkFVR3B2aTlwendJ?=
 =?utf-8?B?SEtWb0h4Qy9IMGpNSXhFSDFEWjhhcnQ5WmdQREZWQURQUDROZmFVUDFqSUV3?=
 =?utf-8?B?d3ArOEpnM0hZcXVLaVY1TUQvU2hnd1JKSjV5K3Z5djBOc0drb043MDhUNk9m?=
 =?utf-8?B?alpRMVBGUFBra0pJT1hHKzc1eE1BM2hwTDNhZVhrZ2U4bFFpeGhWSTlhVGp2?=
 =?utf-8?B?c0hGZnkvbU03THcvQVNXQUlQWUtUY3BxWWp0TUROdmZ3aUhleGFjQTNQM2dh?=
 =?utf-8?B?YkRJUlRoZFYzUTV1aHFwOVMrSnpqYThrSU0yR3QvWXBNdnVIbDc1TWNSRzZk?=
 =?utf-8?B?eWIraDFLNFNpbGtkSkpNVlk3aTNWNU9EaE1PUnhyMXMzSFEzNDZidTFjRnJM?=
 =?utf-8?B?Y2FVSG1oZVZobHlOT1c1VVg1WVB0Tk1odE02Zlo4cGlZRnVUZFp6VXVSZEVD?=
 =?utf-8?B?MTNKQ24wMko4bEhPRTFUWXY4bWlnWmNBY3VCODZyM0J1ZGh4SEhaenhzVFU4?=
 =?utf-8?B?cVQxVFJvUHpYTS9oNjZvM3FoSkVYQTUycUYzNVNVNFlXRGVFTHVwWjcvTDNK?=
 =?utf-8?Q?ECrVV1pmduWl4neN95UJSaX5u?=
Content-ID: <C9B412D2C0868D45BC95FBCE8365DE49@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab69af44-42ce-4224-8f83-08dc6b1bf57d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 02:51:40.6118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IojTeuGNlKecKkNsWlwiuWLhM0EF2h/32e/EP8fZMel2MieT53Ryra1Wrt+DllbBEGIncyPQP+9AwV5qpfdB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7847
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.861700-8.000000
X-TMASE-MatchedRID: pBwXUM+nCwsOwH4pD14DsPHkpkyUphL9X4GSJGyYc37XIZTIUrehXnIu
 7Bbf4TXto5qw/iFKtvYBtjkcfRMmqeVvZ9VZp3eEHcQQBuf4ZFsK3iJpXUOQQ7/A+0D1to6Pcpw
 vkaGF/zvi8zVgXoAltj2Xsf5MVCB1t7DW3B48kkHdB/CxWTRRu25FeHtsUoHubRpA4nDf/rGKsb
 P1TIeSZJDt0oXbFzKIv6R6WlHmbs/FhXMjdQIJpg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.861700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 664D0D42FE1272DE9E1658704DDF9460CA34B3A2164B9A20A20BF862B92B92522000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1993075073.124670310"
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

--__=_Part_Boundary_009_1993075073.124670310
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDUtMDIgYXQgMTg6MzggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCBtb3JlIDEwYml0IGZvcm1hdHMgaW4gT1ZMLg0KDQpSZXZpZXdl
ZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
SHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMzIgKysrKysrKysrKysrKysr
KysrKysrKy0NCj4gLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
Yw0KPiBpbmRleCA4NjJhYjY4M2VkMWI0Li5kOTcwY2RjZTA2YmM3IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IEBAIC03MSw2ICs3MSwyMiBAQA0KPiAg
I2RlZmluZQlPVkxfQ09OX1ZJUlRfRkxJUAlCSVQoOSkNCj4gICNkZWZpbmUJT1ZMX0NPTl9IT1Ja
X0ZMSVAJQklUKDEwKQ0KPiAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfMTBiaXRfcmdiKHUz
MiBmbXQpDQo+ICt7DQo+ICsJc3dpdGNoIChmbXQpIHsNCj4gKwljYXNlIERSTV9GT1JNQVRfWFJH
QjIxMDEwMTA6DQo+ICsJY2FzZSBEUk1fRk9STUFUX0FSR0IyMTAxMDEwOg0KPiArCWNhc2UgRFJN
X0ZPUk1BVF9SR0JYMTAxMDEwMjoNCj4gKwljYXNlIERSTV9GT1JNQVRfUkdCQTEwMTAxMDI6DQo+
ICsJY2FzZSBEUk1fRk9STUFUX1hCR1IyMTAxMDEwOg0KPiArCWNhc2UgRFJNX0ZPUk1BVF9BQkdS
MjEwMTAxMDoNCj4gKwljYXNlIERSTV9GT1JNQVRfQkdSWDEwMTAxMDI6DQo+ICsJY2FzZSBEUk1f
Rk9STUFUX0JHUkExMDEwMTAyOg0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKwl9DQo+ICsJcmV0dXJu
IGZhbHNlOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgY29uc3QgdTMyIG10ODE3M19mb3JtYXRzW10g
PSB7DQo+ICAJRFJNX0ZPUk1BVF9YUkdCODg4OCwNCj4gIAlEUk1fRk9STUFUX0FSR0I4ODg4LA0K
PiBAQCAtODgsMTIgKzEwNCwxOCBAQCBzdGF0aWMgY29uc3QgdTMyIG10ODE3M19mb3JtYXRzW10g
PSB7DQo+ICBzdGF0aWMgY29uc3QgdTMyIG10ODE5NV9mb3JtYXRzW10gPSB7DQo+ICAJRFJNX0ZP
Uk1BVF9YUkdCODg4OCwNCj4gIAlEUk1fRk9STUFUX0FSR0I4ODg4LA0KPiArCURSTV9GT1JNQVRf
WFJHQjIxMDEwMTAsDQo+ICAJRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCwNCj4gIAlEUk1fRk9STUFU
X0JHUlg4ODg4LA0KPiAgCURSTV9GT1JNQVRfQkdSQTg4ODgsDQo+ICsJRFJNX0ZPUk1BVF9CR1JY
MTAxMDEwMiwNCj4gIAlEUk1fRk9STUFUX0JHUkExMDEwMTAyLA0KPiAgCURSTV9GT1JNQVRfQUJH
Ujg4ODgsDQo+ICAJRFJNX0ZPUk1BVF9YQkdSODg4OCwNCj4gKwlEUk1fRk9STUFUX1hCR1IyMTAx
MDEwLA0KPiArCURSTV9GT1JNQVRfQUJHUjIxMDEwMTAsDQo+ICsJRFJNX0ZPUk1BVF9SR0JYMTAx
MDEwMiwNCj4gKwlEUk1fRk9STUFUX1JHQkExMDEwMTAyLA0KPiAgCURSTV9GT1JNQVRfUkdCODg4
LA0KPiAgCURSTV9GT1JNQVRfQkdSODg4LA0KPiAgCURSTV9GT1JNQVRfUkdCNTY1LA0KPiBAQCAt
MjUzLDkgKzI3NSw3IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfc2V0X2JpdF9kZXB0aChzdHJ1Y3Qg
ZGV2aWNlDQo+ICpkZXYsIGludCBpZHgsIHUzMiBmb3JtYXQsDQo+ICAJcmVnID0gcmVhZGwob3Zs
LT5yZWdzICsgRElTUF9SRUdfT1ZMX0NMUkZNVF9FWFQpOw0KPiAgCXJlZyAmPSB+T1ZMX0NPTl9D
TFJGTVRfQklUX0RFUFRIX01BU0soaWR4KTsNCj4gIA0KPiAtCWlmIChmb3JtYXQgPT0gRFJNX0ZP
Uk1BVF9SR0JBMTAxMDEwMiB8fA0KPiAtCSAgICBmb3JtYXQgPT0gRFJNX0ZPUk1BVF9CR1JBMTAx
MDEwMiB8fA0KPiAtCSAgICBmb3JtYXQgPT0gRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCkNCj4gKwlp
ZiAoaXNfMTBiaXRfcmdiKGZvcm1hdCkpDQo+ICAJCWJpdF9kZXB0aCA9IE9WTF9DT05fQ0xSRk1U
XzEwX0JJVDsNCj4gIA0KPiAgCXJlZyB8PSBPVkxfQ09OX0NMUkZNVF9CSVRfREVQVEgoYml0X2Rl
cHRoLCBpZHgpOw0KPiBAQCAtMzY4LDE3ICszODgsMjMgQEAgc3RhdGljIHVuc2lnbmVkIGludCBv
dmxfZm10X2NvbnZlcnQoc3RydWN0DQo+IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25lZCBpbnQg
Zm10KQ0KPiAgCQlyZXR1cm4gT1ZMX0NPTl9DTFJGTVRfUkdCODg4KG92bCkgfCBPVkxfQ09OX0JZ
VEVfU1dBUDsNCj4gIAljYXNlIERSTV9GT1JNQVRfUkdCWDg4ODg6DQo+ICAJY2FzZSBEUk1fRk9S
TUFUX1JHQkE4ODg4Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9SR0JYMTAxMDEwMjoNCj4gKwljYXNl
IERSTV9GT1JNQVRfUkdCQTEwMTAxMDI6DQo+ICAJCXJldHVybiBPVkxfQ09OX0NMUkZNVF9BUkdC
ODg4ODsNCj4gIAljYXNlIERSTV9GT1JNQVRfQkdSWDg4ODg6DQo+ICAJY2FzZSBEUk1fRk9STUFU
X0JHUkE4ODg4Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9CR1JYMTAxMDEwMjoNCj4gIAljYXNlIERS
TV9GT1JNQVRfQkdSQTEwMTAxMDI6DQo+ICAJCXJldHVybiBPVkxfQ09OX0NMUkZNVF9BUkdCODg4
OCB8IE9WTF9DT05fQllURV9TV0FQOw0KPiAgCWNhc2UgRFJNX0ZPUk1BVF9YUkdCODg4ODoNCj4g
IAljYXNlIERSTV9GT1JNQVRfQVJHQjg4ODg6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1hSR0IyMTAx
MDEwOg0KPiAgCWNhc2UgRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMDoNCj4gIAkJcmV0dXJuIE9WTF9D
T05fQ0xSRk1UX1JHQkE4ODg4Ow0KPiAgCWNhc2UgRFJNX0ZPUk1BVF9YQkdSODg4ODoNCj4gIAlj
YXNlIERSTV9GT1JNQVRfQUJHUjg4ODg6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1hCR1IyMTAxMDEw
Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9BQkdSMjEwMTAxMDoNCj4gIAkJcmV0dXJuIE9WTF9DT05f
Q0xSRk1UX1JHQkE4ODg4IHwgT1ZMX0NPTl9CWVRFX1NXQVA7DQo+ICAJY2FzZSBEUk1fRk9STUFU
X1VZVlk6DQo+ICAJCXJldHVybiBPVkxfQ09OX0NMUkZNVF9VWVZZIHwgT1ZMX0NPTl9NVFhfWVVW
X1RPX1JHQjsNCg==

--__=_Part_Boundary_009_1993075073.124670310
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDUtMDImIzMyO2F0JiMzMjsxODozOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyO21vcmUmIzMyOzEwYml0JiMzMjtmb3JtYXRzJiMzMjtpbiYjMzI7T1ZMLg0K
DQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZn
dDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0No
aWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMz
MjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jJiMzMjt8JiMzMjszMiYjMzI7KysrKysrKysrKysrKysrKysrKysrKy0NCiZndDsmIzMyOy0t
DQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyOSYjMzI7aW5zZXJ0
aW9ucygrKSwmIzMyOzMmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZm
JiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMN
CiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7
JiMzMjtpbmRleCYjMzI7ODYyYWI2ODNlZDFiNC4uZDk3MGNkY2UwNmJjNyYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
DQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTcxLDYmIzMyOys3MSwyMiYjMzI7QEANCiZndDsmIzMyOyYj
MzI7I2RlZmluZU9WTF9DT05fVklSVF9GTElQQklUKDkpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmVP
VkxfQ09OX0hPUlpfRkxJUEJJVCgxMCkNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrc3RhdGlj
JiMzMjtpbmxpbmUmIzMyO2Jvb2wmIzMyO2lzXzEwYml0X3JnYih1MzImIzMyO2ZtdCkNCiZndDsm
IzMyOyt7DQomZ3Q7JiMzMjsrc3dpdGNoJiMzMjsoZm10KSYjMzI7ew0KJmd0OyYjMzI7K2Nhc2Um
IzMyO0RSTV9GT1JNQVRfWFJHQjIxMDEwMTA6DQomZ3Q7JiMzMjsrY2FzZSYjMzI7RFJNX0ZPUk1B
VF9BUkdCMjEwMTAxMDoNCiZndDsmIzMyOytjYXNlJiMzMjtEUk1fRk9STUFUX1JHQlgxMDEwMTAy
Og0KJmd0OyYjMzI7K2Nhc2UmIzMyO0RSTV9GT1JNQVRfUkdCQTEwMTAxMDI6DQomZ3Q7JiMzMjsr
Y2FzZSYjMzI7RFJNX0ZPUk1BVF9YQkdSMjEwMTAxMDoNCiZndDsmIzMyOytjYXNlJiMzMjtEUk1f
Rk9STUFUX0FCR1IyMTAxMDEwOg0KJmd0OyYjMzI7K2Nhc2UmIzMyO0RSTV9GT1JNQVRfQkdSWDEw
MTAxMDI6DQomZ3Q7JiMzMjsrY2FzZSYjMzI7RFJNX0ZPUk1BVF9CR1JBMTAxMDEwMjoNCiZndDsm
IzMyOytyZXR1cm4mIzMyO3RydWU7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7K3JldHVybiYjMzI7
ZmFsc2U7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMy
O2NvbnN0JiMzMjt1MzImIzMyO210ODE3M19mb3JtYXRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMy
OyYjMzI7RFJNX0ZPUk1BVF9YUkdCODg4OCwNCiZndDsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9BUkdC
ODg4OCwNCiZndDsmIzMyO0BAJiMzMjstODgsMTImIzMyOysxMDQsMTgmIzMyO0BAJiMzMjtzdGF0
aWMmIzMyO2NvbnN0JiMzMjt1MzImIzMyO210ODE3M19mb3JtYXRzW10mIzMyOz0mIzMyO3sNCiZn
dDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7dTMyJiMzMjttdDgxOTVfZm9ybWF0c1td
JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO0RSTV9GT1JNQVRfWFJHQjg4ODgsDQomZ3Q7JiMz
MjsmIzMyO0RSTV9GT1JNQVRfQVJHQjg4ODgsDQomZ3Q7JiMzMjsrRFJNX0ZPUk1BVF9YUkdCMjEw
MTAxMCwNCiZndDsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCwNCiZndDsmIzMyOyYj
MzI7RFJNX0ZPUk1BVF9CR1JYODg4OCwNCiZndDsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9CR1JBODg4
OCwNCiZndDsmIzMyOytEUk1fRk9STUFUX0JHUlgxMDEwMTAyLA0KJmd0OyYjMzI7JiMzMjtEUk1f
Rk9STUFUX0JHUkExMDEwMTAyLA0KJmd0OyYjMzI7JiMzMjtEUk1fRk9STUFUX0FCR1I4ODg4LA0K
Jmd0OyYjMzI7JiMzMjtEUk1fRk9STUFUX1hCR1I4ODg4LA0KJmd0OyYjMzI7K0RSTV9GT1JNQVRf
WEJHUjIxMDEwMTAsDQomZ3Q7JiMzMjsrRFJNX0ZPUk1BVF9BQkdSMjEwMTAxMCwNCiZndDsmIzMy
OytEUk1fRk9STUFUX1JHQlgxMDEwMTAyLA0KJmd0OyYjMzI7K0RSTV9GT1JNQVRfUkdCQTEwMTAx
MDIsDQomZ3Q7JiMzMjsmIzMyO0RSTV9GT1JNQVRfUkdCODg4LA0KJmd0OyYjMzI7JiMzMjtEUk1f
Rk9STUFUX0JHUjg4OCwNCiZndDsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9SR0I1NjUsDQomZ3Q7JiMz
MjtAQCYjMzI7LTI1Myw5JiMzMjsrMjc1LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMy
O210a19vdmxfc2V0X2JpdF9kZXB0aChzdHJ1Y3QmIzMyO2RldmljZQ0KJmd0OyYjMzI7KmRldiwm
IzMyO2ludCYjMzI7aWR4LCYjMzI7dTMyJiMzMjtmb3JtYXQsDQomZ3Q7JiMzMjsmIzMyO3JlZyYj
MzI7PSYjMzI7cmVhZGwob3ZsLSZndDtyZWdzJiMzMjsrJiMzMjtESVNQX1JFR19PVkxfQ0xSRk1U
X0VYVCk7DQomZ3Q7JiMzMjsmIzMyO3JlZyYjMzI7JmFtcDs9JiMzMjsmIzEyNjtPVkxfQ09OX0NM
UkZNVF9CSVRfREVQVEhfTUFTSyhpZHgpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1pZiYj
MzI7KGZvcm1hdCYjMzI7PT0mIzMyO0RSTV9GT1JNQVRfUkdCQTEwMTAxMDImIzMyO3x8DQomZ3Q7
JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjtmb3JtYXQmIzMyOz09JiMzMjtEUk1fRk9STUFUX0JH
UkExMDEwMTAyJiMzMjt8fA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7Zm9ybWF0JiMz
Mjs9PSYjMzI7RFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCkNCiZndDsmIzMyOytpZiYjMzI7KGlzXzEw
Yml0X3JnYihmb3JtYXQpKQ0KJmd0OyYjMzI7JiMzMjtiaXRfZGVwdGgmIzMyOz0mIzMyO09WTF9D
T05fQ0xSRk1UXzEwX0JJVDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3JlZyYjMzI7
fD0mIzMyO09WTF9DT05fQ0xSRk1UX0JJVF9ERVBUSChiaXRfZGVwdGgsJiMzMjtpZHgpOw0KJmd0
OyYjMzI7QEAmIzMyOy0zNjgsMTcmIzMyOyszODgsMjMmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3Vu
c2lnbmVkJiMzMjtpbnQmIzMyO292bF9mbXRfY29udmVydChzdHJ1Y3QNCiZndDsmIzMyO210a19k
aXNwX292bCYjMzI7Km92bCwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2ZtdCkNCiZndDsmIzMy
OyYjMzI7cmV0dXJuJiMzMjtPVkxfQ09OX0NMUkZNVF9SR0I4ODgob3ZsKSYjMzI7fCYjMzI7T1ZM
X0NPTl9CWVRFX1NXQVA7DQomZ3Q7JiMzMjsmIzMyO2Nhc2UmIzMyO0RSTV9GT1JNQVRfUkdCWDg4
ODg6DQomZ3Q7JiMzMjsmIzMyO2Nhc2UmIzMyO0RSTV9GT1JNQVRfUkdCQTg4ODg6DQomZ3Q7JiMz
MjsrY2FzZSYjMzI7RFJNX0ZPUk1BVF9SR0JYMTAxMDEwMjoNCiZndDsmIzMyOytjYXNlJiMzMjtE
Uk1fRk9STUFUX1JHQkExMDEwMTAyOg0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyO09WTF9DT05f
Q0xSRk1UX0FSR0I4ODg4Ow0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX0JHUlg4
ODg4Og0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX0JHUkE4ODg4Og0KJmd0OyYj
MzI7K2Nhc2UmIzMyO0RSTV9GT1JNQVRfQkdSWDEwMTAxMDI6DQomZ3Q7JiMzMjsmIzMyO2Nhc2Um
IzMyO0RSTV9GT1JNQVRfQkdSQTEwMTAxMDI6DQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7T1ZM
X0NPTl9DTFJGTVRfQVJHQjg4ODgmIzMyO3wmIzMyO09WTF9DT05fQllURV9TV0FQOw0KJmd0OyYj
MzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX1hSR0I4ODg4Og0KJmd0OyYjMzI7JiMzMjtjYXNl
JiMzMjtEUk1fRk9STUFUX0FSR0I4ODg4Og0KJmd0OyYjMzI7K2Nhc2UmIzMyO0RSTV9GT1JNQVRf
WFJHQjIxMDEwMTA6DQomZ3Q7JiMzMjsmIzMyO2Nhc2UmIzMyO0RSTV9GT1JNQVRfQVJHQjIxMDEw
MTA6DQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7T1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODg7DQom
Z3Q7JiMzMjsmIzMyO2Nhc2UmIzMyO0RSTV9GT1JNQVRfWEJHUjg4ODg6DQomZ3Q7JiMzMjsmIzMy
O2Nhc2UmIzMyO0RSTV9GT1JNQVRfQUJHUjg4ODg6DQomZ3Q7JiMzMjsrY2FzZSYjMzI7RFJNX0ZP
Uk1BVF9YQkdSMjEwMTAxMDoNCiZndDsmIzMyOytjYXNlJiMzMjtEUk1fRk9STUFUX0FCR1IyMTAx
MDEwOg0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyO09WTF9DT05fQ0xSRk1UX1JHQkE4ODg4JiMz
Mjt8JiMzMjtPVkxfQ09OX0JZVEVfU1dBUDsNCiZndDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZP
Uk1BVF9VWVZZOg0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyO09WTF9DT05fQ0xSRk1UX1VZVlkm
IzMyO3wmIzMyO09WTF9DT05fTVRYX1lVVl9UT19SR0I7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48
L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1993075073.124670310--

