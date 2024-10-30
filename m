Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED69B5B6B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 06:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF0710E0FC;
	Wed, 30 Oct 2024 05:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PrN5OQ9V";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Hup1nZYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081A10E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 05:43:10 +0000 (UTC)
X-UUID: d65e923e968111efb88477ffae1fc7a5-20241030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Fl0nAz86n0ZvZ4bedKqFZ47hrG573A80a6g9BVhdfno=; 
 b=PrN5OQ9V0Q5imS5SyIScRolkqUQTyy3Ne8L0W5RyNdB6LOnTj4wQ5YrHrSYc5unTTNYVuvELahOHnLglHeOHRVk7NMG9mtdAh6+EjgksBA4nEeXF+E1qDHOaT2104giJPYqcDvC9bAXmVFEwS0HboccDcxUv6yrpy/kiUIenDRs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:7ea19208-35cf-4f25-83ea-eb96cbe98a7b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:502e46e7-cb6b-4a59-bfa3-98f245b4912e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d65e923e968111efb88477ffae1fc7a5-20241030
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 167237554; Wed, 30 Oct 2024 13:43:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 29 Oct 2024 22:43:05 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 13:43:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhGFaK92b1VUR3k+Hyu1BHRGgv7KzzDQPaDE7f7BPaJ9s//Kq1KQoA2XsZvXaxanR/VC7m8kKvlTSnoq5JZoIuSL4enaafF+sy8uVRIC3cNki/GuqkHuP48YzD9ziJxxWlcl39ucV26ChOWBFkSs5Sn0iD4hWaVz/YuUeEEd2syyVk8ZY6rdB8/znLfQWUwUstlXzKgH3XGrgqGARfKVF5mrIIiF9PWuqUPXw5CUqsMcRLoZQQT3zgHsUvoN1kCBfuK+t7RR50UOJUJowYS+95bpdfNPQKwywWh6hX54SiBoOlFU7g003jHA+W+Q9mumiLU/lZyZ2cWZnkZavk6r7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZwBWGs8FzPz6ufZjymLQQpa/8fqC7BbFZ70MtOr3zo=;
 b=J222J3ej5DhXrNNIw7CHYE+xVbJtP8pH10CXiR3+Zoqa+Jo0LU4JngMXGvQ0b6A4Ls3tZpDIGComKc9H03Meu8dGeDyTCCWZbipxwJNpl0yz7+FeEXvBbf2FUvmcpj9xZDy4MQmz3rgEdHD0UvVuWYjAP08JPtmF7IA8xVaWUI5d3FTLZ/qtdCQeTasQlo2WmPWZLAysg5Zo2BGrtFifONdtwkrSLqmXNVUaJLa9LOu3O8SsIh1nMbYvPjoR7ozxmq9RJcIJwIY+YBC544MFcZXrnxBqoExPF7OqbU2hoROq4gvbXmZ2G9o6+ANvvWIxSBScZe0SDVEQeSWB8imNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZwBWGs8FzPz6ufZjymLQQpa/8fqC7BbFZ70MtOr3zo=;
 b=Hup1nZYCWfp5WxHmQ8UyhQBGbDU5h/MycVOM6My1vzeifjFfuLdl9c7/e9gfwgpjiGNIbl52qQzI6UYr9KoEwNVIxzLLYY7xGgwsk/Rv93+/0+3vKf6mt+CExZ4rMM6u2nq0PXSPz0ANwmXqBY1qTLbklsPKbciFEskXuV7A3lo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7064.apcprd03.prod.outlook.com (2603:1096:301:11f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 05:43:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Wed, 30 Oct 2024
 05:43:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKe6K0A
Date: Wed, 30 Oct 2024 05:43:01 +0000
Message-ID: <3eabad2974c715ce7182c1d4b1181d532122e427.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7064:EE_
x-ms-office365-filtering-correlation-id: e2424ffa-b671-4351-7386-08dcf8a5b7b2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N01CUkQ4UFEraER2YXVyMFBSR1BaZjVvMU1IMnRxZzkzVXNZZ1BJbndsNS9o?=
 =?utf-8?B?bjdJb3hINmUvK1prR2ZVcnVmOFgrWVllWm1NM1FDbjRldGxmL0ZxK2tGV1Fs?=
 =?utf-8?B?aUp4VzVpZzd6M29yQk9odWZITVN2WFpmMVJTQmo0cUtmb0pWRVM5MDBxd3Bz?=
 =?utf-8?B?RlJBNUxWeEdrTDBCZjZUZXBlSkRyWlJGMXRCMHdDWVlKWHJkU2NvUW5BVmw3?=
 =?utf-8?B?MkJFT0JkYnoxUHpnN01WZzFDQWh0byt4dWJmVDZhMjNCejc1VUdwVWpNdlJR?=
 =?utf-8?B?NEZucCtwVDdxY3JCOUg3N0VhQ2lkMGNPR0VRdVlpSUtGWU8vbXhiU0hlOFV1?=
 =?utf-8?B?ckxEWklSdmRUUElaMVlVS2JtNWJkME0vQnlyM2NGUFJXMHNEcGZjWDB0ckZJ?=
 =?utf-8?B?Vk42SnorVDlSbUpPLzhMcWpnQk5WQVduYXhPVEpWWDRkdlEvejVVN3lTNlVo?=
 =?utf-8?B?RnhtK3pjSmd4SHJObWU1ZGd2U0U2UGNoUUhoUHZqaS9DVDl4dW1mVlFnSXo4?=
 =?utf-8?B?VlFuTjd2VHZTVi9aUi8yRGJPTFRQZSt6b3hNcmw0RWtFQjhWMjZTZDh4Q0tr?=
 =?utf-8?B?Rk1sUEpHdGRRbUY4aXRDSFlmVmlLbHBqNE0zY1puMHR2Y21Vbm50SEZKcGZr?=
 =?utf-8?B?d1grOEY1d0YzamRvSGdUL2UvUVFERXlmWUl5SEo2WXJNano1SkJnTzVtSEli?=
 =?utf-8?B?djNjNFV0dkVSajhBT0pXM1A4NVJWZktXK3J3RjltKzhzL3cwZVpLSDJoc3Rk?=
 =?utf-8?B?NmkwcGl1cE5BMHZhUFNkWElub2N1VHlBRWdkMno2eVlkUEt2cllQYTgxa1Rn?=
 =?utf-8?B?RE9YZVhMSkZ2Ym1hWnF2czE2YS9PUXVQUHpidXowTE9lbmxnS202cGM5cUth?=
 =?utf-8?B?SlVLbml0Y2x5U2srUk9DNVBDN0Y5T0toRjBZT216QlliYUlDaHNuL1hsR2dJ?=
 =?utf-8?B?VE14TDZOazhKV3cvNzY5dUFlQnVSSjVuZ2tzWnZLRGwzek1iVjgybXZraWRC?=
 =?utf-8?B?WWNjZ21wZ2F0WStRWWIzVTQ0L29obDZpbG4xSXcvcGtnNjQrcUZmZzFvcStV?=
 =?utf-8?B?ZWhMdFpPTDdjZmxVenJkRXR4M3BtRXVlSzhkd0dHamkvdnZQTEx6dk8wcVZ4?=
 =?utf-8?B?eXZPaC9nblE5MUQxeVRYUkFYQ0NtblZlTDZDR3czamkwTk9uenF6NlNDNUUz?=
 =?utf-8?B?SE5MTDZoMzl6WkVjMTVsbVdTYWVvNkk2d3Fya0dIbGVjaDJUcjVOQUpWUHA0?=
 =?utf-8?B?N0N6My95MWQvUEJmbTlsckVORG5FcnBjZTNianJDNktuMkxVYWNnWWNwMGZz?=
 =?utf-8?B?Rlg3dzB4TDQyNjRwNCt0U1RGNjdaMitXQW1URHkySVdQU2hLWWNEWlJEN0s2?=
 =?utf-8?B?a01tRGlseVovdjZyTUV0Nm5Jemp3QkM2bHFvT2NxWG50Q3ZNdTFvcjU3SXV3?=
 =?utf-8?B?NUI1SWRzNnMzaUhySTVLd3NkdDhzSUtvNW1vYlU0a3FHSmZrU01yUHh4K0FI?=
 =?utf-8?B?UHU4NjE5ZldIcG9VQko4cVJvSEIzelNyN01Gc2J2b29NOFZpdkF1b212TDFT?=
 =?utf-8?B?ZUJEUlVFNEVlaXpYbmQ2SVV0T3k3YVUrN2xwLzhISXFJMzJPOW5odldKMmxD?=
 =?utf-8?B?VENEZ1BSa3d1dFI0c3E1Q0J0ZjRFdEk4UE82YXB5NEc0U1JOUWhtbkY5UGRH?=
 =?utf-8?B?ZTFSZ3NMQUZpZzVwRUQ3SldHNU9yRFV4Q3RZcUJyMmJ6SENBVDE4NW9uNjEz?=
 =?utf-8?B?Q1RFeDFZZWd2TCtndmtUb0F0cHBUNnpRcSs4RCtnazM5WTB1Z3VlSHhoV3Uy?=
 =?utf-8?Q?/DpOP2R1CeW+it9iJB3GChGIKS13ErtxmeWEc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0ZnV3RNQUZMYmthdUpkd2haUWcwdVVURDUzdW9Gam1NcHgvd1Y3bVczb2Uz?=
 =?utf-8?B?c21Wckk4WXlaUFNPWlZsQTE5Y3RtUDdVR1kxbzBpNktxOGI1ZWtXZGUrY3NJ?=
 =?utf-8?B?a0dZNjVpdGRqNDMzSHhhTi9wQysxQ1p4S1pyNGZ3T1A4ZHFGSEdmcloxSlhW?=
 =?utf-8?B?YnFqYTJ0T2txcGQyMk8wbEtCc01VOVFsSFVrS0JCVi8zb0EzdkFPY0NWQ2Y4?=
 =?utf-8?B?c2RMVDgvWFB6YWtwVHE0bDJDck1kMG81b1l5U2VQbk9nTEZwQmZrdkdkRWxT?=
 =?utf-8?B?a29kOXV4Skc4cDBkajdHSUNpNFlsS3p2VVh3OUhHVGQrVDZEY0xpc04ycTNV?=
 =?utf-8?B?UGRtQXdiMGhYYjJPU08zRXYrSWkxYlE1anhsakV5WXF1M0lVK2pFeUNDRy82?=
 =?utf-8?B?S2J1RmNMdkFmWkg1YkI3UmdYbjJTMHpsVXZDMDRVY0lveXF5TkcwMlFsQ3Mx?=
 =?utf-8?B?bXR0NG90eW1IOXc3L05WSHQ4eWhQbTdRQkhzd2Z3ZmtJelVVZW85OExDNmN3?=
 =?utf-8?B?NzJEY01mV3Mxcm9HNW83bER3OVltcDVlUlhwUDUyWDRWMGM5Tm9MR05oYzJD?=
 =?utf-8?B?MlhMa1dhWUgzSS9MMldDZjhCdGtvaXhZSDJ3OG1KTTJ5MVM5MmJ3Yll5Z2M5?=
 =?utf-8?B?U3JZSVZNclkrUTVpdVVsZnFYcXAycGJ1UExEMjkvSUJHSFR2RUtQamYzUlRy?=
 =?utf-8?B?QmdxRE9uVDh1K094NkFVa1l6WlNDaHlwRW9yaTE4TDFnb252VngyZUVLaE9B?=
 =?utf-8?B?WXFJVVlFbStSckZNbXNEMUtyeGx3eTRRNlRRVmRLNGViSFA0YVVrdTF3bW9n?=
 =?utf-8?B?M0xmQzQyZmJmZ3F2QW4xYXRFR09KZjhka2pKeXJ1dCtUcUl3MllwbGxLZ21W?=
 =?utf-8?B?d2pwTG44Vi90S2tRQnNmMWdpUlVrQ0VHclVJbVA5cU1SYmJCdWc5Q0V0Q1o3?=
 =?utf-8?B?aW9LWmF6UjBIcFJBV1J3VnZMVFlFTW82VUJBV1h1SWx2M3lNRFlWcXhud0Fm?=
 =?utf-8?B?d3dLdDBtY203ZzRZYVZNTVlDSDBqK2ZEVVdPTjZvSnJnK3czWkZkUXp3WFpq?=
 =?utf-8?B?dzlxWEFpbTgvM1ErdFp5NzN3cU5KcFZrNkFPVGVJT1ZOYmpFYndFM0J1SXlE?=
 =?utf-8?B?M2JuREd3M3lMamJYSjlMaUVwTnVyRFl0UG9UQUxaNWtwVW1EZ1pBNDBxejRM?=
 =?utf-8?B?bXBra242anoxdmtFY3JkQU12ZmpvNUloTVlSOTc4c1lhaTlnVFpiaDlPeDhj?=
 =?utf-8?B?U1FkK3YrbzBMWnZXb3BKWFJkZUppQ1h3NmJydEp0d0tDUi82MmxOaEg1Y2lw?=
 =?utf-8?B?VWlaV3VGL2JlQmRJZnVVeDIyQW5nTXpPL0E2eFBjNEw3dWMzUlcrL3VhNlVK?=
 =?utf-8?B?ZGF2ZVhaWGpleGlxd1FuemRtVlNvNXVFTUlIM1c1VUNoRy9valBKTzVGV0VK?=
 =?utf-8?B?YzZQbzdCdUhOQVlFM1NaNE42VG05REk2RjJKLzhvM0s4OWg4NmxQK2NZRXZX?=
 =?utf-8?B?NUhJSXc0b1dXWFpWVlpCY2JYNkNpYlhrc3NJUE9KeE5LNWFYbExmRlhxNlpo?=
 =?utf-8?B?K1NlN20vRzgrUmZ2Qm5CU1Z0Sk0rNkV0cjZSa0FPUUdXalhCdkJQdUJQT3pX?=
 =?utf-8?B?ZmhnZGdsY25hYzFoc3ZFbmF0ZTF0dEZuZmtubVRKa3A0WGQ5eFlFd2NoTUxj?=
 =?utf-8?B?SVZQanh3R0llRVlNekhhYkpmSVd6ZEliVkg1TTRjcVJucUsyaXE0anlESkY3?=
 =?utf-8?B?N09NS0t6cGNBSDJlcXQvWE9nMksyQmhFRGl4R2RqbVlpSm5wV3pjY2dtY2JG?=
 =?utf-8?B?TlpYRy9xWGZ1MTU1bDd0a3dZTzRQY0NORHZqT1ZBV28xUDlJUWo2aDRjbEw5?=
 =?utf-8?B?dVptQm92YzNtNEdPc1lYVHRjOExKeHdKYkVoODhkVnhiMm9VbDEwY2laazNi?=
 =?utf-8?B?YnBBRy9GbzlwRmhPYmJTZ0EwQ1FRTm9aVG1weW9uV3pITTNiYzYybzVrZFVE?=
 =?utf-8?B?YTJrdHlPYUpvN3JnSksrK0pyUHdJb0hvVmM2a1ltVXN1YlNmblJDZG4xbmZG?=
 =?utf-8?B?SnptNU40aC9DMXRtTkp2TGJzQTNrV21zWVJqV2gwMkI0VUwxcDFnMmVCaU42?=
 =?utf-8?Q?Y/BX4aPLqKI+DqborKupLRjXs?=
Content-ID: <3A27CBAF6CDCD94BAE6ACC02A698D061@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2424ffa-b671-4351-7386-08dcf8a5b7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 05:43:01.4856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99Bv7Cf0ezpNrRkdechILe5HobzyOIlUZMzrZ102uCLsKevQxPfMd5549lXyVnyX1vODZnZQ2oliwIoVJ/R4bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7064
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_828334054.541512195"
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

--__=_Part_Boundary_005_828334054.541512195
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICtzdHJ1Y3QgbXRrX2NhbV9kZXZpY2Ugew0KPiArCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4g
Kw0KPiArCXN0cnVjdCB2NGwyX2RldmljZSB2NGwyX2RldjsNCj4gKwlzdHJ1Y3QgdjRsMl9hc3lu
Y19ub3RpZmllciBub3RpZmllcjsNCj4gKwlzdHJ1Y3QgbWVkaWFfZGV2aWNlIG1lZGlhX2RldjsN
Cj4gKwl2b2lkIF9faW9tZW0gKmJhc2U7DQo+ICsNCj4gKwlzdHJ1Y3QgbXRrX3NjcCAqc2NwOw0K
PiArCXN0cnVjdCBkZXZpY2UgKnNtZW1fZGV2Ow0KPiArCXBoYW5kbGUgcnByb2NfcGhhbmRsZTsN
Cg0KcnByb2NfcGhhbmRsZSBpcyB1c2VsZXNzLCBzbyBkcm9wIGl0Lg0KDQo+ICsJc3RydWN0IHJw
cm9jICpycHJvY19oYW5kbGU7DQo+ICsNCj4gKwl1bnNpZ25lZCBpbnQgY29tcG9zZXJfY250Ow0K
PiArDQo+ICsJdW5zaWduZWQgaW50IG51bV9zZW5pbmZfZGV2aWNlczsNCj4gKwl1bnNpZ25lZCBp
bnQgbnVtX3Jhd19kZXZpY2VzOw0KPiArCXVuc2lnbmVkIGludCBudW1fbGFyYl9kZXZpY2VzOw0K
DQpudW1fbGFyYl9kZXZpY2VzIGlzIHVzZWxlc3MsIHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpD
Sw0KDQo+ICsNCj4gKwkvKiByYXdfcGlwZSBjb250cm9sbGVyIHN1YmRldiAqLw0KPiArCXN0cnVj
dCBtdGtfcmF3IHJhdzsNCj4gKwlzdHJ1Y3QgbXV0ZXggcXVldWVfbG9jazsgLyogcHJvdGVjdCBx
dWV1ZSByZXF1ZXN0ICovDQo+ICsNCj4gKwl1bnNpZ25lZCBpbnQgbWF4X3N0cmVhbV9udW07DQo+
ICsJdW5zaWduZWQgaW50IHN0cmVhbWluZ19jdHg7DQo+ICsJdW5zaWduZWQgaW50IHN0cmVhbWlu
Z19waXBlOw0KPiArCXN0cnVjdCBtdGtfY2FtX2N0eCAqY3R4czsNCj4gKw0KPiArCS8qIHJlcXVl
c3QgcmVsYXRlZCAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgcGVuZGluZ19qb2JfbGlzdDsNCj4g
KwlzcGlubG9ja190IHBlbmRpbmdfam9iX2xvY2s7IC8qIHByb3RlY3QgcGVuZGluZ19qb2JfbGlz
dCAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgcnVubmluZ19qb2JfbGlzdDsNCj4gKwl1bnNpZ25l
ZCBpbnQgcnVubmluZ19qb2JfY291bnQ7DQo+ICsJc3BpbmxvY2tfdCBydW5uaW5nX2pvYl9sb2Nr
OyAvKiBwcm90ZWN0IHJ1bm5pbmdfam9iX2xpc3QgKi8NCj4gKw0KPiArCS8qIHN0YW5kYXJkIHY0
bDIgYnVmZmVyIGNvbnRyb2wgKi8NCj4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGRtYV9wZW5kaW5nOw0K
PiArCXNwaW5sb2NrX3QgZG1hX3BlbmRpbmdfbG9jazsgLyogcHJvdGVjdCBkbWFfcGVuZGluZ19s
aXN0ICovDQo+ICsJc3RydWN0IGxpc3RfaGVhZCBkbWFfcHJvY2Vzc2luZzsNCj4gKwlzcGlubG9j
a190IGRtYV9wcm9jZXNzaW5nX2xvY2s7IC8qIHByb3RlY3QgZG1hX3Byb2Nlc3NpbmdfbGlzdCBh
bmQgZG1hX3Byb2Nlc3NpbmdfY291bnQgKi8NCj4gKwl1bnNpZ25lZCBpbnQgZG1hX3Byb2Nlc3Np
bmdfY291bnQ7DQo+ICsNCj4gKwlzdHJ1Y3QgbXRrX2NhbV9kZWJ1Z19mcyAqZGVidWdfZnM7DQo+
ICsJc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKmRlYnVnX3dxOw0KPiArCXN0cnVjdCB3b3JrcXVl
dWVfc3RydWN0ICpkZWJ1Z19leGNlcHRpb25fd3E7DQo+ICsJd2FpdF9xdWV1ZV9oZWFkX3QgZGVi
dWdfZXhjZXB0aW9uX3dhaXRxOw0KPiArfTsNCj4gKw0KDQo=

--__=_Part_Boundary_005_828334054.541512195
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjt0
b3AmIzMyO21lZGlhJiMzMjtkZXZpY2UmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0aGUmIzMyO01l
ZGlhVGVrJiMzMjtJU1A3WCYjMzI7Q0FNU1lTLg0KJmd0OyYjMzI7VGhlJiMzMjtkcml2ZXImIzMy
O21haW50YWlucyYjMzI7dGhlJiMzMjtjYW1lcmEmIzMyO3N5c3RlbSwmIzMyO2luY2x1ZGluZyYj
MzI7c3ViLWRldmljZSYjMzI7bWFuYWdlbWVudCwNCiZndDsmIzMyO0RNQSYjMzI7b3BlcmF0aW9u
cywmIzMyO2FuZCYjMzI7aW50ZWdyYXRpb24mIzMyO3dpdGgmIzMyO3RoZSYjMzI7VjRMMiYjMzI7
ZnJhbWV3b3JrLiYjMzI7SXQmIzMyO2hhbmRsZXMNCiZndDsmIzMyO3JlcXVlc3QmIzMyO3N0cmVh
bSYjMzI7ZGF0YSwmIzMyO2J1ZmZlciYjMzI7bWFuYWdlbWVudCwmIzMyO2FuZCYjMzI7TWVkaWFU
ZWstc3BlY2lmaWMmIzMyO2ZlYXR1cmVzLA0KJmd0OyYjMzI7YW5kJiMzMjtwaXBlbGluZSYjMzI7
bWFuYWdlbWVudCwmIzMyO3N0cmVhbWluZyYjMzI7Y29udHJvbCwmIzMyO2Vycm9yJiMzMjtoYW5k
bGluZyYjMzI7bWVjaGFuaXNtLg0KJmd0OyYjMzI7QWRkaXRpb25hbGx5LCYjMzI7aXQmIzMyO2Fn
Z3JlZ2F0ZXMmIzMyO3N1Yi1kcml2ZXJzJiMzMjtmb3ImIzMyO3RoZSYjMzI7Y2FtZXJhJiMzMjtp
bnRlcmZhY2UsJiMzMjtyYXcNCiZndDsmIzMyO2FuZCYjMzI7eXV2JiMzMjtwaXBlbGluZXMuDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNpYW5nJiMzMjtZYW5n
JiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0K
DQpbc25pcF0NCg0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2NhbV9kZXZpY2UmIzMyO3sNCiZn
dDsmIzMyOytzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldjsNCiZndDsmIzMyOysNCiZndDsmIzMy
OytzdHJ1Y3QmIzMyO3Y0bDJfZGV2aWNlJiMzMjt2NGwyX2RldjsNCiZndDsmIzMyOytzdHJ1Y3Qm
IzMyO3Y0bDJfYXN5bmNfbm90aWZpZXImIzMyO25vdGlmaWVyOw0KJmd0OyYjMzI7K3N0cnVjdCYj
MzI7bWVkaWFfZGV2aWNlJiMzMjttZWRpYV9kZXY7DQomZ3Q7JiMzMjsrdm9pZCYjMzI7X19pb21l
bSYjMzI7KmJhc2U7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfc2NwJiMz
Mjsqc2NwOw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqc21lbV9kZXY7DQomZ3Q7
JiMzMjsrcGhhbmRsZSYjMzI7cnByb2NfcGhhbmRsZTsNCg0KcnByb2NfcGhhbmRsZSYjMzI7aXMm
IzMyO3VzZWxlc3MsJiMzMjtzbyYjMzI7ZHJvcCYjMzI7aXQuDQoNCiZndDsmIzMyOytzdHJ1Y3Qm
IzMyO3Jwcm9jJiMzMjsqcnByb2NfaGFuZGxlOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3Vuc2ln
bmVkJiMzMjtpbnQmIzMyO2NvbXBvc2VyX2NudDsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt1bnNp
Z25lZCYjMzI7aW50JiMzMjtudW1fc2VuaW5mX2RldmljZXM7DQomZ3Q7JiMzMjsrdW5zaWduZWQm
IzMyO2ludCYjMzI7bnVtX3Jhd19kZXZpY2VzOw0KJmd0OyYjMzI7K3Vuc2lnbmVkJiMzMjtpbnQm
IzMyO251bV9sYXJiX2RldmljZXM7DQoNCm51bV9sYXJiX2RldmljZXMmIzMyO2lzJiMzMjt1c2Vs
ZXNzLCYjMzI7c28mIzMyO2Ryb3AmIzMyO2l0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7Ky8qJiMzMjtyYXdfcGlwZSYjMzI7Y29udHJvbGxlciYjMzI7c3ViZGV2JiMz
MjsqLw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX3JhdyYjMzI7cmF3Ow0KJmd0OyYjMzI7K3N0
cnVjdCYjMzI7bXV0ZXgmIzMyO3F1ZXVlX2xvY2s7JiMzMjsvKiYjMzI7cHJvdGVjdCYjMzI7cXVl
dWUmIzMyO3JlcXVlc3QmIzMyOyovDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrdW5zaWduZWQmIzMy
O2ludCYjMzI7bWF4X3N0cmVhbV9udW07DQomZ3Q7JiMzMjsrdW5zaWduZWQmIzMyO2ludCYjMzI7
c3RyZWFtaW5nX2N0eDsNCiZndDsmIzMyOyt1bnNpZ25lZCYjMzI7aW50JiMzMjtzdHJlYW1pbmdf
cGlwZTsNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19jYW1fY3R4JiMzMjsqY3R4czsNCiZndDsm
IzMyOysNCiZndDsmIzMyOysvKiYjMzI7cmVxdWVzdCYjMzI7cmVsYXRlZCYjMzI7Ki8NCiZndDsm
IzMyOytzdHJ1Y3QmIzMyO2xpc3RfaGVhZCYjMzI7cGVuZGluZ19qb2JfbGlzdDsNCiZndDsmIzMy
OytzcGlubG9ja190JiMzMjtwZW5kaW5nX2pvYl9sb2NrOyYjMzI7LyomIzMyO3Byb3RlY3QmIzMy
O3BlbmRpbmdfam9iX2xpc3QmIzMyOyovDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjtsaXN0X2hlYWQm
IzMyO3J1bm5pbmdfam9iX2xpc3Q7DQomZ3Q7JiMzMjsrdW5zaWduZWQmIzMyO2ludCYjMzI7cnVu
bmluZ19qb2JfY291bnQ7DQomZ3Q7JiMzMjsrc3BpbmxvY2tfdCYjMzI7cnVubmluZ19qb2JfbG9j
azsmIzMyOy8qJiMzMjtwcm90ZWN0JiMzMjtydW5uaW5nX2pvYl9saXN0JiMzMjsqLw0KJmd0OyYj
MzI7Kw0KJmd0OyYjMzI7Ky8qJiMzMjtzdGFuZGFyZCYjMzI7djRsMiYjMzI7YnVmZmVyJiMzMjtj
b250cm9sJiMzMjsqLw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bGlzdF9oZWFkJiMzMjtkbWFfcGVu
ZGluZzsNCiZndDsmIzMyOytzcGlubG9ja190JiMzMjtkbWFfcGVuZGluZ19sb2NrOyYjMzI7Lyom
IzMyO3Byb3RlY3QmIzMyO2RtYV9wZW5kaW5nX2xpc3QmIzMyOyovDQomZ3Q7JiMzMjsrc3RydWN0
JiMzMjtsaXN0X2hlYWQmIzMyO2RtYV9wcm9jZXNzaW5nOw0KJmd0OyYjMzI7K3NwaW5sb2NrX3Qm
IzMyO2RtYV9wcm9jZXNzaW5nX2xvY2s7JiMzMjsvKiYjMzI7cHJvdGVjdCYjMzI7ZG1hX3Byb2Nl
c3NpbmdfbGlzdCYjMzI7YW5kJiMzMjtkbWFfcHJvY2Vzc2luZ19jb3VudCYjMzI7Ki8NCiZndDsm
IzMyOyt1bnNpZ25lZCYjMzI7aW50JiMzMjtkbWFfcHJvY2Vzc2luZ19jb3VudDsNCiZndDsmIzMy
OysNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19jYW1fZGVidWdfZnMmIzMyOypkZWJ1Z19mczsN
CiZndDsmIzMyOytzdHJ1Y3QmIzMyO3dvcmtxdWV1ZV9zdHJ1Y3QmIzMyOypkZWJ1Z193cTsNCiZn
dDsmIzMyOytzdHJ1Y3QmIzMyO3dvcmtxdWV1ZV9zdHJ1Y3QmIzMyOypkZWJ1Z19leGNlcHRpb25f
d3E7DQomZ3Q7JiMzMjsrd2FpdF9xdWV1ZV9oZWFkX3QmIzMyO2RlYnVnX2V4Y2VwdGlvbl93YWl0
cTsNCiZndDsmIzMyOyt9Ow0KJmd0OyYjMzI7Kw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
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

--__=_Part_Boundary_005_828334054.541512195--

