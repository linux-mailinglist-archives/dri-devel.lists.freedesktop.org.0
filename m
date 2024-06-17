Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549A90A7BF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 09:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382B410E2CD;
	Mon, 17 Jun 2024 07:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qqg/N7aV";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XPawKUuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B09910E293
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:53:40 +0000 (UTC)
X-UUID: b2245fa62c7e11efa22eafcdcd04c131-20240617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ZAaC546FHEJA4lHundeiagwYG6UwmO9e3Fm1pW5ando=; 
 b=qqg/N7aVVOR8Mig0Nu4Qh4SXHsQYnJcQxCHOYgmkmMTAinWO8F7tl6rviBKX5TBk4Pd3BzGExYCffcPM4RgPnioBMC/odOu+NYat4Ml46JiSXe2yWYUn/lJpsahz/Qni+hJrNj+rG1qvDJwf2MRTsYVcftb1E/y1WERCy7rrDnY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:76095b65-5d22-40f9-befb-9ad83125d2d1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:17601494-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b2245fa62c7e11efa22eafcdcd04c131-20240617
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 628761707; Mon, 17 Jun 2024 15:53:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 17 Jun 2024 15:53:31 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jun 2024 15:53:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbRDQWz81C4IybELgyV1vY8pUwV+3IXjFF8jhVIJCDJb5pv1ptgkn+KvEwTO9nWINcVyplxwWdTYtvHnwx+gQQGgNmvk3AaH0H4ePKza3ivC976szaCC1efmNRolg/8VxJZhlYhW/uVZzJtNfGcV5SU9uVL+B06v11n1j0IQcLSDG00q9atjKfilDN0+dqTEW02wHJSitC4lDz4bbPKgFgInqdKrDfd6rd+fldTabNIf2c/yJdodGTPstBVKXxa7KMCxjZsB3uybfC5iQeUXpxUidKz9XZJXzcDYnM3S/ZbSiDHbmw/dxfm4PY8hZVxvlzTvWdLFH+2FFCpL83uL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAaC546FHEJA4lHundeiagwYG6UwmO9e3Fm1pW5ando=;
 b=BpxPgvIrm190XuSuP4rcafbFucYKucoEBG/sZJc2Uo0Ma8mL/6ZLcd0EfDKtB9q8txpP2cra17V51wflPEGp55Bxbdmh3pgTCGjjWC+K0aEZt5Cs998GqAiFvDiod6w37n1HqwlB8+8tG47+G+T+XLcaAac6OQI/WclmSlkaXpF5UhcVLSoacO7CPK0S+AHw+jQtv66ZlCnIMp9KC06M0HV5OoQgt6+QGAsb1/OITtfwPhe0OsB+PuFQhXAwYbORwrunwPSfntj4BykvQs2K40lpw6BcSgmd1lP0Xnqbm+2PtWKId8E0t1YNv09LHi0Oq6TbcX09tbILs02b8j03iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAaC546FHEJA4lHundeiagwYG6UwmO9e3Fm1pW5ando=;
 b=XPawKUuQR3q/GXP8rdYg2UUCMaprNrPNHRHTyMfqo//gTnMe3Uknx6lsD0cNGvv+azFPsvynKj1IX3WGDS3UsG87BeW+lloDFyfG+GksHDqKmf4jD5G2MVb2312oCjPgAiIlDjPyt1vh45tYubDWbIEPm4Q4+rQdqb+qHgES4uI=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TY0PR03MB6677.apcprd03.prod.outlook.com (2603:1096:400:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Mon, 17 Jun
 2024 07:53:30 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 07:53:29 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "andrzej.p@collabora.com" <andrzej.p@collabora.com>, "tfiga@chromium.org"
 <tfiga@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "jkardatzke@google.com" <jkardatzke@google.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>, "wenst@chromium.org" <wenst@chromium.org>,
 "jstultz@google.com" <jstultz@google.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>, "tjmercier@google.com" <tjmercier@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
Thread-Topic: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
Thread-Index: AQHap4uokFgF3qecT0uosn9rp4V4O7GjNziAgCiQkQA=
Date: Mon, 17 Jun 2024 07:53:29 +0000
Message-ID: <f1d1dc8cc04254f6848881cc6c15779215e03b5f.camel@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-13-yunfei.dong@mediatek.com>
 <b6ef4188-e5da-487c-b4af-ebe5b2fcdfae@collabora.com>
In-Reply-To: <b6ef4188-e5da-487c-b4af-ebe5b2fcdfae@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TY0PR03MB6677:EE_
x-ms-office365-filtering-correlation-id: df04e0d9-98f4-4b23-c7d0-08dc8ea293e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|7416011|376011|366013|1800799021|38070700015|921017; 
x-microsoft-antispam-message-info: =?utf-8?B?Z1pHS2EvQVBXMm1hMVNYRjB1Z3dhWU1QbXZ5ZWFqa0o2QkVwMzFnekptbE4z?=
 =?utf-8?B?bTBybWM0Y0JZOS81MlA5UVkxUDViNEc3MTVOVWR3Vy9VKzRWTnpUS2VaUm43?=
 =?utf-8?B?NlJvSm9oVVBad0JpRVJhZXlJYnZXbFUrWCtKQlRHMURpOFRIaTJrVUFHczFR?=
 =?utf-8?B?R2xVeFdBTmVxakhRU2p3L3dUT1FNaVo5dXB6YVMyM2V1WTFUaVQ0SGtScTcz?=
 =?utf-8?B?NTZuZHAwOTRWcUI5aG1SOFZvSDZNYUFBU1BPQ1ZUaGNTbXdBczQ2NS9rcmxn?=
 =?utf-8?B?b1p1a05sNGJrTmprK2k1Rk4waVVtYzZVa1diTUIzRzRKUzhuYXBvRUJKNlly?=
 =?utf-8?B?a3k1ZVB6YVF3N01CRE9MR21Ia2pUUkdKTCtGUmhzenBFaTVsdXNPTGluSHMw?=
 =?utf-8?B?N1p3S2lCa1Blc3YxZDREdHRvQjBWMm9oSjlEbVFZR2xxOE1XQU9YSzhsUkVF?=
 =?utf-8?B?MVBsTHBoaW5OWHJDVzZuSDc3RGVaOFM5RG1OSFRWUnRZWGZ2emUwOFVtMTdS?=
 =?utf-8?B?Uy83Q1JZZFN5QTZsMGRpQkRVRXQwWEpHbFduejhGMXpvY3EwckVZN0krUTh0?=
 =?utf-8?B?N2EzY1djU0JDY2QyQU91KzZIRk9EaTZ6Q1BQT2lQc2dOQlVuNlVrd2lIcEVJ?=
 =?utf-8?B?cE0yOVJCQWNEOFEvenBwU0FCTnFnck0wNFhsV1p2QWhKWVY0cFczeEI2TmF6?=
 =?utf-8?B?ZDM4YmNXV2V0clBzazN4NE5ZZ3lNZHJ0K05PTG9KZjJRRjVkTnB4c3ZZQnVp?=
 =?utf-8?B?OVAwZW02TEpkTkt4RTNOQWxwdlUydkZGZ01KKzFQQXR6NC9pWnhHaUErcVQ2?=
 =?utf-8?B?Uk0vYmFGdmNWYkM4b0I5TzgxcjlDSXdmV21oT1FDd2l0ZEtIZUpiYjR2cXBS?=
 =?utf-8?B?aG0yMkFGN3U3L0VhQnRWZmJPclYvaEJmQ1dubnljaTVyY0xnUlVoWXM1eHVK?=
 =?utf-8?B?aDl2ZlMyQXRjVlBsYmZVcitiK0tGSFB1UjhGSzJQMGZMaWw4RStoNFh0T1R3?=
 =?utf-8?B?bk5abS80ME55RWU3NkZ1cTNzNllCckJ3Q1g1VWhnQm5Xa1hCVzB6OGpwbzJy?=
 =?utf-8?B?MlRuaXFLY3M5SVFPRE5Od05WVy9LS08xVU1TTy9Fd2JwaXJCREhVYzFtUGZU?=
 =?utf-8?B?L0t5bFUyL3RhbmYxbU13WE5neU1TbkJqanZJZXh6UFgvQWJnT0UzcUpFQzJk?=
 =?utf-8?B?UmpmSVBIVG9obkJMZGhkVzFoa25DTm9iQ0tlMGdGdUEvRVNIcUV3emZlc0wx?=
 =?utf-8?B?ZzdDaDJVWGlZcER5UmpZMUYyZU9MRWptVDlFd0NBZGdGSDNwQm9wSUVuZmo0?=
 =?utf-8?B?cnhWUytpV1dLZHRjL2toemNpTEpWaVZkRXozb1p3Q09pQVJKb0JhVmxOY3BG?=
 =?utf-8?B?TVFVUXBUSzNZdDBOWkZ5b1k4SjhHS2RaM0U2QWlDZnc4OXUyVnNUQjkvWkpj?=
 =?utf-8?B?WU54QU5ZdzlxaVFKanlmZGlkNjcyaTZ0UlhVcDI3VUh4SDJ6VWViZzVOcm9D?=
 =?utf-8?B?RXBoRllMUkdZTURjK21OYURXMnA5U05iMVpVQmd4OE5SZnpZMm10VG9HazNP?=
 =?utf-8?B?N2IwODVNdmRycThnMXQ3NlJlMEwwdXJoM2c1SlcrdW1pMXcvemliNDVvNWlS?=
 =?utf-8?B?T3NIeno5L0g3YVV1dmluMTdDK0dyWWJNYjEwKy9NWVZ2N2J0bDJNaldSSzhI?=
 =?utf-8?B?WjV1bVNkT3BqUnN5SUNEdENCUHlPbjRvNjQwMHEzSHpTTkVCRjhmaFJ0Tjdl?=
 =?utf-8?B?T0lsYXhJNmdTNXFPRUdKYkZjU21UVmo4YzZSUUIxcFlLZDVNS3Jmd2xHK3Bv?=
 =?utf-8?B?RUpXSjlJcnpZZEN3aXRXR2duVkNtOUJxYXQ3bjhkY0VZb1cvZjNxVGdLd2wz?=
 =?utf-8?Q?FsCxgvselWctG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSQPR03MB8697.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(7416011)(376011)(366013)(1800799021)(38070700015)(921017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWtJSFNaTmVaaDdTT250L2oyc1lFaUNpVmlpa3YvcTFJZER6VFcvTzB3V0ZU?=
 =?utf-8?B?cTN2S1I0Z2FqL3NqRXF1b1VTRFdvOGlQdDBBV3FMY0JmSVRxV2pXTzhlS3lo?=
 =?utf-8?B?azQvZ1RCQ2tZTGZCZjdVbUk4N3JCcmZFYnZwa1V4WG1DakwvM0pGMlRwUExK?=
 =?utf-8?B?aWVuSE8wdkxrOEN5OXpFYTlMK1g4ajRDMUtlWVBtMVJqMHFEKzNGS1FXSlBG?=
 =?utf-8?B?RFhKQStiVjZPSTVDcGN0bmxoQWsxb0NxU2lrZDRtd0ZCUzloTmlqbUZweGx2?=
 =?utf-8?B?L0JjNXlNbmZwSzVjS3RMeFp3MGJTbStvR1o1M1hxaWk2Wk51MEZDZHFnVkdl?=
 =?utf-8?B?elhVZmEwV0dKMnZoWmNEYXZIMFhva3FNdG5ueU9oM0ZXL2c4dU1jSTlBWW0w?=
 =?utf-8?B?bDdmSEhuYkpXWXdKS2xFb3ZwcUh2UXJWMGpDd0Q5YW5EaHVzUUt6RU5RZTZH?=
 =?utf-8?B?T1JRaWtLSkRndWwyYWJYVG9QcStLSXNCMVFjSWZVcVozTFM3NG5uWDNSN3dQ?=
 =?utf-8?B?UG9YWVRLVlErNVlqYnZBRDdHVVFrcGdjQzZ0VTB1S3hFRG1lTUNMMW9TcitL?=
 =?utf-8?B?b1RYUHgwckNrbFR3WTJ4akd6N25wQmZxc0R0MG96UnQrNTFmR0xEbGpXRzhw?=
 =?utf-8?B?Q2JHVHNsbUZBSllpTi9wY3NJdXUyWnVoakRLZTFDNHQ3bjRBTjZpY1NySDVD?=
 =?utf-8?B?RzZ3ZE5qYnZleE1qMlZVMzlzRHZLVTI0aFZsVEd1VlNGQlJRcDhmd3V3Nzdv?=
 =?utf-8?B?WW8wbi83cDY4YVVQUTkrOTZkSWgwVWNTYW5kenJOODdrZ3B4YlR4SmtxM1Jo?=
 =?utf-8?B?a1Z3Um0vMUd5cFpCT2xmc05aekpBZmNZT2xObHNjeEVjQ2YxeWF6K2dRbHdp?=
 =?utf-8?B?MnVDanI3c2owaGRONWFXcE5FcnB5NjdpYnVZUjBZNjZOeGM3TWpWQ1I0ZjhK?=
 =?utf-8?B?SXFFa0EyeDNHR3FNdUw5akFjT25PdENKTUMranhFWWNQbENGWExYVi96OUVV?=
 =?utf-8?B?RjhlZUJicFVWeFBnWm5la2tFeTdwQ2pmSHh6Uk5NSzNGY0s2NzVSU0xsamhJ?=
 =?utf-8?B?WHZFd1BJNFhpVm1NMlBVYytqbFErWHBub3B1eUE2OXY1bWVFSDNCMnV6amlR?=
 =?utf-8?B?NDZ0SmJIVktmR21kVG1BRXJnOU1SMjBCcEZIbjN0eXZDamlmSTV4dHFzVnBw?=
 =?utf-8?B?WVJuMFo5OGQxN3k5Smw0Y05DTndrcVphVjFFUGt5ZFkyL0JBNUd0QlR3QTdq?=
 =?utf-8?B?Qzg3c0NFTWt2YThFbHdHSG1DaUg3bTNJS1R3OG9IQzhycDFuOGk5YmdlTUtC?=
 =?utf-8?B?SDFxQTEyK1JhKzV5UzVrMi9pRGM0OHlvTjB0NmtCeG1HZ09oMjFHaVl3M2ls?=
 =?utf-8?B?VHAwU05QWFFjdUFpZVJXa3BSNFl4YVk0eTNaT2R4YTNocklmN0ovSytndlRN?=
 =?utf-8?B?YWlKVU5YUkl5SDFYVUVnZVNBS2NsdGpPWHZwclFrR2hrYzZTTFFDZVpFZkhT?=
 =?utf-8?B?QVNHUVMvdWlORktlSUoveDdpZWdoM0ZGdTFGUkpQU3RPZFpXYjN3a2tKaHlO?=
 =?utf-8?B?N29MalF3V0dnZWlxWHlLZy9GUG85VE9rUlV0eThPc0ZmYmYzeVd4YnE2bGM5?=
 =?utf-8?B?cGhvcGdGTHV0OGowZSt5SWZsTUZ3STNIcjBNYmcra2R4dUdXemdJOE9WTVZr?=
 =?utf-8?B?WUkyQ256REJsSEM2azhEZWxoTzVvYm9Ucnc3TXZVMG1PUFZ2L1BHQ2MzQzQz?=
 =?utf-8?B?MC9oL05SQVZuRTVPOUlkS2hpY3dMMHkvYjY5dHZWc2g1K2pkQndvWWVYeHpl?=
 =?utf-8?B?ZERtRk0vSzNZN2MwL0ZqL3dWcXRGNG9TU2tZTTJMVXBvNlhYaDJKZVhKdkZp?=
 =?utf-8?B?VkYxNDE1alBGaHh3S0dmeWQzZDdzVTZZUHZMQWZvRHBodzNVTnR6Y1dmVkJq?=
 =?utf-8?B?eGwxdGJHSEVSWTZVdUgybWtHbEJwRU95MkFEZytsYlVXMUI5ckxXd1BSTEli?=
 =?utf-8?B?aGt2YytJQkVHTERpM1dIZlMvVU9rUlVsemlzTTJmbGxHVUk5VnFsN2ovVGhJ?=
 =?utf-8?B?UU95dVhCNFE4M2k5UnNCWUNxSUo0Y2dIYUpnUE56QmlpRkhacS9rVURmVEZj?=
 =?utf-8?B?MjUrRVNUZmY0dmZ5c2Yvc1VPQkYxSzltZ21kVVdYTzl0UVFPNGZWOUEreHdQ?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60D0FE302CA55649BEFC19DE12B1185B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df04e0d9-98f4-4b23-c7d0-08dc8ea293e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 07:53:29.6186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCv4LvgfO+dJN1a46k72RzSlv5ZAfS4f2z1Wt5G14ss7GP5gOJdVCl06JNnMkqbfNdUAOfrfnSoIzVyV2N6Xnifsqk3dliJseznV1Wm9gLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6677
X-MTK: N
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

SGkgQW5kcnplaiwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2gu
DQpPbiBXZWQsIDIwMjQtMDUtMjIgYXQgMTQ6MjUgKzAyMDAsIEFuZHJ6ZWogUGlldHJhc2lld2lj
eiB3cm90ZToNCj4gSGkgWXVuZmVpLA0KPiANCj4gVyBkbml1IDE2LjA1LjIwMjQgbyAxNDoyMCwg
WXVuZmVpIERvbmcgcGlzemU6DQo+ID4gTmVlZCB0byBjYWxsIGRtYSBoZWFwIGludGVyZmFjZSB0
byBhbGxvY2F0ZS9mcmVlIHNlY3VyZSBtZW1vcnkgd2hlbg0KPiA+IHBsYXlpbmcNCj4gPiBzZWN1
cmUgdmlkZW8uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5k
b25nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvS2NvbmZpZyAgICB8ICAgMSArDQo+ID4gICAuLi4vbWVkaWF0ZWsvdmNvZGVj
L2NvbW1vbi9tdGtfdmNvZGVjX3V0aWwuYyAgfCAxMjINCj4gPiArKysrKysrKysrKysrKysrKy0N
Cj4gPiAgIC4uLi9tZWRpYXRlay92Y29kZWMvY29tbW9uL210a192Y29kZWNfdXRpbC5oICB8ICAg
MyArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L3Zjb2RlYy9LY29uZmlnDQo+ID4gaW5kZXggYmM4MjkyMjMyNTMwLi43MDc4NjU3MDNlNjEgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvS2Nv
bmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL0tj
b25maWcNCj4gPiBAQCAtMTcsNiArMTcsNyBAQCBjb25maWcgVklERU9fTUVESUFURUtfVkNPREVD
DQo+ID4gICAJZGVwZW5kcyBvbiBWSURFT19NRURJQVRFS19WUFUgfHwgIVZJREVPX01FRElBVEVL
X1ZQVQ0KPiA+ICAgCWRlcGVuZHMgb24gTVRLX1NDUCB8fCAhTVRLX1NDUA0KPiA+ICAgCWRlcGVu
ZHMgb24gTVRLX1NNSSB8fCAoQ09NUElMRV9URVNUICYmIE1US19TTUk9bikNCj4gPiArCWRlcGVu
ZHMgb24gRE1BQlVGX0hFQVBTDQo+ID4gICAJc2VsZWN0IFZJREVPQlVGMl9ETUFfQ09OVElHDQo+
ID4gICAJc2VsZWN0IFY0TDJfTUVNMk1FTV9ERVYNCj4gPiAgIAlzZWxlY3QgVklERU9fTUVESUFU
RUtfVkNPREVDX1ZQVSBpZiBWSURFT19NRURJQVRFS19WUFUNCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9jb21tb24vbXRrX3Zjb2Rl
Y191dGlsLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Nv
bW1vbi9tdGtfdmNvZGVjX3V0aWwuYw0KPiA+IGluZGV4IGM2MGU0YzE5M2IyNS4uNTk1OGRjZDc5
NjVhIDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay92Y29kZWMvY29tbW9uL210a192Y29kZWNfdXRpbC5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9jb21tb24vbXRrX3Zjb2RlY191dGlsLmMN
Cj4gPiBAQCAtNSw5ICs1LDExIEBADQo+ID4gICAqCVRpZmZhbnkgTGluIDx0aWZmYW55LmxpbkBt
ZWRpYXRlay5jb20+DQo+ID4gICAqLw0KPiA+ICAgDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kbWEt
aGVhcC5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAgI2luY2x1ZGUg
PGxpbnV4L29mLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+DQo+ID4gKyNpbmNs
dWRlIDx1YXBpL2xpbnV4L2RtYS1oZWFwLmg+DQo+ID4gICANCj4gPiAgICNpbmNsdWRlICIuLi9k
ZWNvZGVyL210a192Y29kZWNfZGVjX2Rydi5oIg0KPiA+ICAgI2luY2x1ZGUgIi4uL2VuY29kZXIv
bXRrX3Zjb2RlY19lbmNfZHJ2LmgiDQo+ID4gQEAgLTQ1LDcgKzQ3LDcgQEAgaW50IG10a192Y29k
ZWNfd3JpdGVfdmRlY3N5cyhzdHJ1Y3QNCj4gPiBtdGtfdmNvZGVjX2RlY19jdHggKmN0eCwgdW5z
aWduZWQgaW50IHJlZywNCj4gPiAgIH0NCj4gPiAgIEVYUE9SVF9TWU1CT0wobXRrX3Zjb2RlY193
cml0ZV92ZGVjc3lzKTsNCj4gPiAgIA0KPiA+IC1pbnQgbXRrX3Zjb2RlY19tZW1fYWxsb2Modm9p
ZCAqcHJpdiwgc3RydWN0IG10a192Y29kZWNfbWVtICptZW0pDQo+ID4gK3N0YXRpYyBpbnQgbXRr
X3Zjb2RlY19tZW1fYWxsb2Nfbm9yKHZvaWQgKnByaXYsIHN0cnVjdA0KPiA+IG10a192Y29kZWNf
bWVtICptZW0pDQo+ID4gICB7DQo+ID4gICAJZW51bSBtdGtfaW5zdGFuY2VfdHlwZSBpbnN0X3R5
cGUgPSAqKCh1bnNpZ25lZCBpbnQgKilwcml2KTsNCj4gPiAgIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwbGF0X2RldjsNCj4gPiBAQCAtNzUsOSArNzcsNzEgQEAgaW50IG10a192Y29kZWNfbWVt
X2FsbG9jKHZvaWQgKnByaXYsIHN0cnVjdA0KPiA+IG10a192Y29kZWNfbWVtICptZW0pDQo+ID4g
ICANCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiAgIH0NCj4gPiAtRVhQT1JUX1NZTUJPTChtdGtfdmNv
ZGVjX21lbV9hbGxvYyk7DQo+ID4gICANCj4gPiAtdm9pZCBtdGtfdmNvZGVjX21lbV9mcmVlKHZv
aWQgKnByaXYsIHN0cnVjdCBtdGtfdmNvZGVjX21lbSAqbWVtKQ0KPiA+ICtzdGF0aWMgaW50IG10
a192Y29kZWNfbWVtX2FsbG9jX3NlYyhzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfY3R4DQo+ID4gKmN0
eCwgc3RydWN0IG10a192Y29kZWNfbWVtICptZW0pDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZjdHgtPmRldi0+cGxhdF9kZXYtPmRldjsNCj4gPiArCXN0cnVjdCBkbWFfYnVm
ICpkbWFfYnVmZmVyOw0KPiA+ICsJc3RydWN0IGRtYV9oZWFwICp2ZGVjX2hlYXA7DQo+ID4gKwlz
dHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2g7DQo+ID4gKwlzdHJ1Y3Qgc2dfdGFibGUg
KnNndDsNCj4gPiArCXVuc2lnbmVkIGxvbmcgc2l6ZSA9IG1lbS0+c2l6ZTsNCj4gPiArCWludCBy
ZXQgPSAwOw0KPiA+ICsNCj4gPiArCWlmICghc2l6ZSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPiArDQo+ID4gKwl2ZGVjX2hlYXAgPSBkbWFfaGVhcF9maW5kKCJyZXN0cmljdGVkX210a19j
bWEiKTsNCj4gPiArCWlmICghdmRlY19oZWFwKSB7DQo+ID4gKwkJbXRrX3Y0bDJfdmRlY19lcnIo
Y3R4LCAiZG1hIGhlYXAgZmluZCBmYWlsZWQhIik7DQo+ID4gKwkJcmV0dXJuIC1FUEVSTTsNCj4g
PiArCX0NCj4gPiArDQo+ID4gKwlkbWFfYnVmZmVyID0gZG1hX2hlYXBfYnVmZmVyX2FsbG9jKHZk
ZWNfaGVhcCwgc2l6ZSwNCj4gPiBETUFfSEVBUF9WQUxJRF9GRF9GTEFHUywNCj4gPiArCQkJCQkg
ICBETUFfSEVBUF9WQUxJRF9IRUFQX0ZMQUdTKTsNCj4gPiArCWlmIChJU19FUlJfT1JfTlVMTChk
bWFfYnVmZmVyKSkgew0KPiA+ICsJCW10a192NGwyX3ZkZWNfZXJyKGN0eCwgImRtYSBoZWFwIGFs
bG9jIHNpemU9MHglbHgNCj4gPiBmYWlsZWQhIiwgc2l6ZSk7DQo+ID4gKwkJcmV0dXJuIFBUUl9F
UlIoZG1hX2J1ZmZlcik7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJYXR0YWNoID0gZG1hX2J1Zl9h
dHRhY2goZG1hX2J1ZmZlciwgZGV2KTsNCj4gPiArCWlmIChJU19FUlJfT1JfTlVMTChhdHRhY2gp
KSB7DQo+ID4gKwkJbXRrX3Y0bDJfdmRlY19lcnIoY3R4LCAiZG1hIGF0dGFjaCBzaXplPTB4JWx4
IGZhaWxlZCEiLA0KPiA+IHNpemUpOw0KPiA+ICsJCXJldCA9IFBUUl9FUlIoYXR0YWNoKTsNCj4g
PiArCQlnb3RvIGVycl9hdHRhY2g7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJc2d0ID0gZG1hX2J1
Zl9tYXBfYXR0YWNobWVudChhdHRhY2gsIERNQV9CSURJUkVDVElPTkFMKTsNCj4gPiArCWlmIChJ
U19FUlJfT1JfTlVMTChzZ3QpKSB7DQo+ID4gKwkJbXRrX3Y0bDJfdmRlY19lcnIoY3R4LCAiZG1h
IG1hcCBhdHRhY2ggc2l6ZT0weCVseA0KPiA+IGZhaWxlZCEiLCBzaXplKTsNCj4gPiArCQlyZXQg
PSBQVFJfRVJSKHNndCk7DQo+ID4gKwkJZ290byBlcnJfc2d0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4g
PiArCW1lbS0+dmEgPSBkbWFfYnVmZmVyOw0KPiA+ICsJbWVtLT5kbWFfYWRkciA9IChkbWFfYWRk
cl90KXNnX2RtYV9hZGRyZXNzKChzZ3QpLT5zZ2wpOw0KPiA+ICsNCj4gPiArCWlmICghbWVtLT52
YSB8fCAhbWVtLT5kbWFfYWRkcikgew0KPiA+ICsJCW10a192NGwyX3ZkZWNfZXJyKGN0eCwgImRt
YSBidWZmZXIgc2l6ZT0weCVseCBmYWlsZWQhIiwNCj4gPiBzaXplKTsNCj4gPiArCQlyZXQgPSAt
RVBFUk07DQo+ID4gKwkJZ290byBlcnJfYWRkcjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwltZW0t
PmF0dGFjaCA9IGF0dGFjaDsNCj4gPiArCW1lbS0+c2d0ID0gc2d0Ow0KPiA+ICsNCj4gPiArCXJl
dHVybiAwOw0KPiA+ICtlcnJfYWRkcjoNCj4gPiArCWRtYV9idWZfdW5tYXBfYXR0YWNobWVudChh
dHRhY2gsIHNndCwgRE1BX0JJRElSRUNUSU9OQUwpOw0KPiA+ICtlcnJfc2d0Og0KPiA+ICsJZG1h
X2J1Zl9kZXRhY2goZG1hX2J1ZmZlciwgYXR0YWNoKTsNCj4gPiArZXJyX2F0dGFjaDoNCj4gPiAr
CWRtYV9idWZfcHV0KGRtYV9idWZmZXIpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIG10a192Y29kZWNfbWVtX2ZyZWVfbm9yKHZvaWQg
KnByaXYsIHN0cnVjdA0KPiA+IG10a192Y29kZWNfbWVtICptZW0pDQo+ID4gICB7DQo+ID4gICAJ
ZW51bSBtdGtfaW5zdGFuY2VfdHlwZSBpbnN0X3R5cGUgPSAqKCh1bnNpZ25lZCBpbnQgKilwcml2
KTsNCj4gPiAgIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwbGF0X2RldjsNCj4gPiBAQCAtMTEw
LDYgKzE3NCw1NyBAQCB2b2lkIG10a192Y29kZWNfbWVtX2ZyZWUodm9pZCAqcHJpdiwgc3RydWN0
DQo+ID4gbXRrX3Zjb2RlY19tZW0gKm1lbSkNCj4gPiAgIAltZW0tPmRtYV9hZGRyID0gMDsNCj4g
PiAgIAltZW0tPnNpemUgPSAwOw0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgbXRr
X3Zjb2RlY19tZW1fZnJlZV9zZWMoc3RydWN0IG10a192Y29kZWNfbWVtICptZW0pDQo+ID4gK3sN
Cj4gPiArCWlmIChtZW0tPnNndCkNCj4gPiArCQlkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQobWVt
LT5hdHRhY2gsIG1lbS0+c2d0LA0KPiA+IERNQV9CSURJUkVDVElPTkFMKTsNCj4gDQo+IGlzICgh
bWVtLT5zZ3QpIHBvc3NpYmxlIGF0IGFsbCBoZXJlPw0KPiANCj4gSW4gbXRrX3Zjb2RlY19tZW1f
YWxsb2Nfc2VjKCkgImlmIChJU19FUlJfT1JfTlVMTChzZ3QpKSIgdHJpZ2dlcnMgYW4NCj4gZXJy
b3IgcmVjb3ZlcnkgcGF0aCBhbmQgdGhlIGFsbG9jYXRpb24gZmFpbHMuIERvIHlvdSBldmVyIHRy
eSB0bw0KPiBmcmVlX3NlYygpDQo+IGEgZmFpbGVkIGFsbG9jYXRpb24/DQoNCkxvb2tzIHVzaW5n
ICdpZiAoIUlTX0VSUl9PUl9OVUxMKG1lbS0+c2d0KSknIGlzIG11Y2ggbW9yZSByZWFzb25hYmxl
Lg0KDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0KPiANCj4gPiArCWRtYV9idWZfZGV0YWNo
KChzdHJ1Y3QgZG1hX2J1ZiAqKW1lbS0+dmEsIG1lbS0+YXR0YWNoKTsNCj4gPiArCWRtYV9idWZf
cHV0KChzdHJ1Y3QgZG1hX2J1ZiAqKW1lbS0+dmEpOw0KPiA+ICsNCj4gPiArCW1lbS0+YXR0YWNo
ID0gTlVMTDsNCj4gPiArCW1lbS0+c2d0ID0gTlVMTDsNCj4gPiArCW1lbS0+dmEgPSBOVUxMOw0K
PiA+ICsJbWVtLT5kbWFfYWRkciA9IDA7DQo+ID4gKwltZW0tPnNpemUgPSAwOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtpbnQgbXRrX3Zjb2RlY19tZW1fYWxsb2Modm9pZCAqcHJpdiwgc3RydWN0IG10
a192Y29kZWNfbWVtICptZW0pDQo+ID4gK3sNCj4gPiArCWVudW0gbXRrX2luc3RhbmNlX3R5cGUg
aW5zdF90eXBlID0gKigodW5zaWduZWQgaW50ICopcHJpdik7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+
ICsNCj4gPiArCWlmIChpbnN0X3R5cGUgPT0gTVRLX0lOU1RfREVDT0RFUikgew0KPiA+ICsJCXN0
cnVjdCBtdGtfdmNvZGVjX2RlY19jdHggKmRlY19jdHggPSBwcml2Ow0KPiA+ICsNCj4gPiArCQlp
ZiAoZGVjX2N0eC0+aXNfc2VjdXJlX3BsYXliYWNrKSB7DQo+ID4gKwkJCXJldCA9IG10a192Y29k
ZWNfbWVtX2FsbG9jX3NlYyhkZWNfY3R4LCBtZW0pOw0KPiA+ICsJCQlnb3RvIGFsbG9jX2VuZDsN
Cj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0gbXRrX3Zjb2RlY19tZW1fYWxs
b2Nfbm9yKHByaXYsIG1lbSk7DQo+ID4gK2FsbG9jX2VuZDoNCj4gPiArDQo+IA0KPiBhZ2FpbiBt
YXliZSBpdCdzIGp1c3QgbXkgcGVyc29uYWwgcHJlZmVyZW5jZSwgYnV0IEknZCBoYXZlIG5vIGdv
dG8NCj4gKG5vdCBiZWNhdXNlIGdvdG8gaXMgcHJvaGliaXRlZCwgYnV0IGJlY2F1c2UgbWF5YmUg
aXQncyBub3QgcmVhbGx5DQo+IGp1c3RpZmllZCBoZXJlKSwgZmV3ZXIgY3VybHkgYnJhY2VzIGFu
ZCBubyBsYWJlbDoNCj4gDQo+IGludCBtdGtfdmNvZGVjX21lbV9hbGxvYyh2b2lkICpwcml2LCBz
dHJ1Y3QgbXRrX3Zjb2RlY19tZW0gKm1lbSkNCj4gew0KPiAJc3RydWN0IG10a192Y29kZWNfZGVj
X2N0eCAqZGVjX2N0eCA9IHByaXY7DQo+IA0KPiAJaWYgKGRlY19jdHgtPmluc3RfdHlwZSA9PSBN
VEtfSU5TVF9ERUNPREVSICYmIGRlY19jdHgtDQo+ID5pc19zZWN1cmVfcGxheWJhY2spDQo+IAkJ
cmV0dXJuIG10a192Y29kZWNfbWVtX2FsbG9jX3NlYyhkZWNfY3R4LCBtZW0pOw0KPiANCj4gCXJl
dHVybiBtdGtfdmNvZGVjX21lbV9hbGxvY19ub3IocHJpdiwgbWVtKTsNCj4gfQ0KPiANCj4gVG8g
bWUgaXQgbWFrZXMgbm8gc2Vuc2UgdG8gY2FzdCBwcml2IHRvIGluc3RfdHlwZSBfYW5kXyB0byBk
ZWNfY3R4DQo+IGdpdmVuIHRoYXQgZGVjX2N0eCdzIGZpcnN0IG1lbWJlciBfaXNfIGluc3RfdHlw
ZS4NCj4gDQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0wobXRr
X3Zjb2RlY19tZW1fYWxsb2MpOw0KPiA+ICsNCj4gPiArdm9pZCBtdGtfdmNvZGVjX21lbV9mcmVl
KHZvaWQgKnByaXYsIHN0cnVjdCBtdGtfdmNvZGVjX21lbSAqbWVtKQ0KPiA+ICt7DQo+ID4gKwll
bnVtIG10a19pbnN0YW5jZV90eXBlIGluc3RfdHlwZSA9ICooKHVuc2lnbmVkIGludCAqKXByaXYp
Ow0KPiANCj4gDQo+IGRpdHRvIGhlcmUuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gQW5kcnplag0K
PiANCj4gPiArDQo+ID4gKwlpZiAoaW5zdF90eXBlID09IE1US19JTlNUX0RFQ09ERVIpIHsNCj4g
PiArCQlzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfY3R4ICpkZWNfY3R4ID0gcHJpdjsNCj4gPiArDQo+
ID4gKwkJaWYgKGRlY19jdHgtPmlzX3NlY3VyZV9wbGF5YmFjaykgew0KPiA+ICsJCQltdGtfdmNv
ZGVjX21lbV9mcmVlX3NlYyhtZW0pOw0KPiA+ICsJCQlyZXR1cm47DQo+ID4gKwkJfQ0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCW10a192Y29kZWNfbWVtX2ZyZWVfbm9yKHByaXYsIG1lbSk7DQo+ID4g
K30NCj4gPiAgIEVYUE9SVF9TWU1CT0wobXRrX3Zjb2RlY19tZW1fZnJlZSk7DQo+ID4gICANCj4g
PiAgIHZvaWQgKm10a192Y29kZWNfZ2V0X2h3X2RldihzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfZGV2
ICpkZXYsIGludA0KPiA+IGh3X2lkeCkNCj4gPiBAQCAtMTcxLDMgKzI4Niw0IEBAIEVYUE9SVF9T
WU1CT0wobXRrX3Zjb2RlY19nZXRfY3Vycl9jdHgpOw0KPiA+ICAgDQo+ID4gICBNT0RVTEVfTElD
RU5TRSgiR1BMIHYyIik7DQo+ID4gICBNT0RVTEVfREVTQ1JJUFRJT04oIk1lZGlhdGVrIHZpZGVv
IGNvZGVjIGRyaXZlciIpOw0KPiA+ICtNT0RVTEVfSU1QT1JUX05TKERNQV9CVUYpOw0KPiA+IGRp
ZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Nv
bW1vbi9tdGtfdmNvZGVjX3V0aWwuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvY29tbW9uL210a192Y29kZWNfdXRpbC5oDQo+ID4gaW5kZXggODVmNjE1Y2Rk
NGQzLi4yMjA3OGU3NTdlZDAgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9jb21tb24vbXRrX3Zjb2RlY191dGlsLmgNCj4gPiArKysN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtf
dmNvZGVjX3V0aWwuaA0KPiA+IEBAIC0xOCw2ICsxOCw5IEBAIHN0cnVjdCBtdGtfdmNvZGVjX21l
bSB7DQo+ID4gICAJc2l6ZV90IHNpemU7DQo+ID4gICAJdm9pZCAqdmE7DQo+ID4gICAJZG1hX2Fk
ZHJfdCBkbWFfYWRkcjsNCj4gPiArDQo+ID4gKwlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICph
dHRhY2g7DQo+ID4gKwlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsNCj4gPiAgIH07DQo+ID4gICANCj4g
PiAgIHN0cnVjdCBtdGtfdmNvZGVjX2ZiIHsNCj4gDQo+IA0K
