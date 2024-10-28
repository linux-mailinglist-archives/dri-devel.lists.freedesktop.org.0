Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D54F9B2399
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 04:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9010E031;
	Mon, 28 Oct 2024 03:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Z9y8mhz4";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="svVsW/P8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C255210E031
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:46:34 +0000 (UTC)
X-UUID: 36c713b694df11efbd192953cf12861f-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3PVqgeBmGC+I1gJgJ7+GJqQL5Aih5ynZGGEc0R9rFOU=; 
 b=Z9y8mhz4Sj/vIxXflTqzECpiLTCs5V1orBhMbsUftBdN1y3EFKcpQFT8TtsKI95yyfx8hRM/bZnH0ivbkZpj2MPpqc0QDNBfN4ETu1/sevLsWE9REWJgzymefj6vJMyQ/wX8i6gOUTwoN+B1HPol/4UjZqQ5WblxIfZ55mks93I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:78c67f75-a3e4-410e-8ee5-0a16fb279b8b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:072c332e-a7a0-4b06-8464-80be82133975,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 36c713b694df11efbd192953cf12861f-20241028
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 444972699; Mon, 28 Oct 2024 11:46:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 11:46:26 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 11:46:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdFNxHfT+sTvtRLS+OEdgj1WiTmfqDQvshNJuYLs7BzEhsjntJUzTaodzTTL2LgQ+n+MXD0afxb5mD4MjsuH9RAz+KAV4r50wXPKeSznzlI0PxgDuzNaxk055aWMal+tgoZaP24+Qx1EpITmPNFfZtYf2CSbjR2ZYw/KLpvrTMKzmQc/3TcUwklg4BrO8jSjRwqvKb+uF0ZszlHmv6fwRhwocSmMVE/jKh158vI5CQ169hm91ntacYEb8pm9OxBgGxlbaOUDQf/xKtP+fn1lQ3xUNvLRsJB88aMHm5LsBQ+4LQBQK/EzCkJRm2BXIIx+WeK+i4qgzE67HXcp/6pGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+FzC/ZlRj12rVKOThJPkdIYyTy7J5vjs0M5Squ3J2E=;
 b=SRIFdD2eycWVZ1ORg1J6tFJ2R48MANZ/kLF2kRUu7okF9/H6RjHn3Ps4hTLXhwoW/bJjobrsc4oH2eAvjOG0K7KDNxgT6tWzgQWTlT4pPbblg9RNBmz3wq8u8yKbJwL8zTtn6c+HL7idgYElpaUG6HuqpPh60zmloR7VONqPzwh9xF3Kv8PEJAG2DicKTZuGeiwyX8J95v2ncDCkbPml0irIjZK+BzNJnaSYgzhXNeodFAoTO22zlmwgQgbEsbt2UA5miMMfNyS2VkU68YJLDvz2z802Ym8dOrOKZIcHJ93qC8v/Ob99OwxLhrJCUNThl3va/5ytuvMjyOXESRbwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+FzC/ZlRj12rVKOThJPkdIYyTy7J5vjs0M5Squ3J2E=;
 b=svVsW/P8yVGxZoyBPkrUV+4oyvU8VQ6KLvaNnJ60dgD0hr2h8i5xcI6LH5mPn4moH5jddxGvWBQ7k12r6z0etByw63bbcSaNj6cOf7rAH4D/BSY+Blgxf90r/nBmK/bCNciv0Uc4ugLiMv4Xsj1+JFpgUo+Yn2y0tOY2SVnvIe0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7249.apcprd03.prod.outlook.com (2603:1096:101:c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 03:46:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 03:46:22 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKbo2yA
Date: Mon, 28 Oct 2024 03:46:22 +0000
Message-ID: <467985c340926e6396f1425f3035b13f277b56d1.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7249:EE_
x-ms-office365-filtering-correlation-id: 846def09-b4db-4e01-8a97-08dcf70316ee
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NUhKQmtQK1RsbnMxMnZzTjllcW5jcmdDRDZRNjJ1SjdjbGhQR2N0QlJKaWR0?=
 =?utf-8?B?Qkh2VDBoTmI1eGw2QzA3aFJoZHgvNzNZYUdCNjl4QldEd09uWFJhMzhITmJw?=
 =?utf-8?B?ZFhVZ2g1ZGZaUWRMV0JoRlFBWUxpVG9idCtpeXNZVkREUmtmYlNhL1NxQnhx?=
 =?utf-8?B?eDZkMFNVeGZSUkhuK3lxKzZPYlpqZW1nbjYxVFZ3dUYyZ3JGbGxxbDljNmdJ?=
 =?utf-8?B?SVFyTUtBbDNGbytSV2RLVmZ5TFpScTZvVjI0eXg1cHNBbDFXTmNsaUpIOWZG?=
 =?utf-8?B?SzZNaWFqZXJ5a2prZVo4UnlnSUNJTGtzbGE2OFZ2MHlxMjhUWFZVdERBR2M1?=
 =?utf-8?B?bXMxOExZcHNYZnJlOHdKMFcwSjY4aFpCbndOd1BZQ0VDR21IMVIrT2VPTjA2?=
 =?utf-8?B?V3owQkNHNENTNytWdFJIZ3VvQlNIZHB1eGs2ajFSSlZyYURiVmordGVpLzhu?=
 =?utf-8?B?M2FpeHo3cC9jVWx6azhFck80RjZCSWJmS21IbG92S29LTDUvMDBWeS9SejBt?=
 =?utf-8?B?YllnTGFobnRJSkRscG94a01pdXNiQ2JiUGxHZnlHUFNXQzRRdkpjZFlnSGFv?=
 =?utf-8?B?NnNJVEpMb0JqZ2ZibWpsS2x2Z2k2dEZPR0YrZUhsTDdEQnpTNUxSYkVYZEg4?=
 =?utf-8?B?RmdBL2x0dGk4TzkxUEZvQmRzamV6WDhBUHF0VXNwUHBsbHVCMXJFS253dkJS?=
 =?utf-8?B?NFdLaGFVSE1pV3JKSXdUdFJER1NDcEpPaFJ4dzM0OVpvWXZlM0hXRm5VcWkv?=
 =?utf-8?B?R0xFR0FXclpUb2FhenBXUkN3cHFhNU1CZkRobXYrU0QyamNDNUsyOU8vdW9E?=
 =?utf-8?B?dkVuQXdXRUM5YWc1b1NPaVg0R0d5NERIRHp0WDZ5amFBQWNHekpWQXprZksr?=
 =?utf-8?B?Sy9QYXJJUmQwYlN0bXd0WUJPTjA2M3ZYSEhBVzZhT1JXL2dhNkNiQXg3Q1lo?=
 =?utf-8?B?c2JjemVTQVNyUGhDMHFaUEJOUjhvNHhvc2RvQlJwbTMxK2VYdzE2OVVUVU5a?=
 =?utf-8?B?S3V3bTdhVE5RU0tDck1ETzhLdUl1dlNKaFZwaE15Z1hDQnpST1VPeWU3aWQ3?=
 =?utf-8?B?cUJBWVRRK3BoM0owczBVNGF5TTJWcTE0L2RVcmcwZ09MZ2lFSjQ1QWlWblYr?=
 =?utf-8?B?MmJRNkNHWnE5MCtIdXdhT21kOFJQQk9ZZkEvY095WkQyc090SkplK3VpUmJi?=
 =?utf-8?B?ZXgrRmdVZWc0UkQwYTRiOGYxdnNHNXlVVkduOHJSTFNicjVic0JvQmVFVmN2?=
 =?utf-8?B?MmduZm0yN2RGSG92eW9IWXo5VUhMcnpWNWZ0VXpXeGtNcU1yb2h6cUZlNVpW?=
 =?utf-8?B?WnA0MFNWZms3SDJZdUZvU0FSWDdhMjN4Q0IxSTExYXIzSTR0amE1UXl0bGFy?=
 =?utf-8?B?T25KeXVLY3gxbzgrazQvVjhWcjZSOUZlZDlqalZjYnk3a2RGQ2dZeUM1Rk5O?=
 =?utf-8?B?eEhhTFVvOGJtZldMY3lTZEdRc3ZCcU1WTWk1cXdJZEF3ZzlBUG96UmV4UlV0?=
 =?utf-8?B?UERiNVZsdWdQeVBndTJwVldkRGR3N1p6b0M1aGhYRlNVUlJWaVpiVVZYRHEz?=
 =?utf-8?B?bE4wblBleFBoc3lLSjJaS2F0SUlYQWR4ZzdXbmFTZGdtZ3Z2d1JvSFEzOTF2?=
 =?utf-8?B?RjBRYVVyL1VBZGlLamY5RHIxNlNKTC8rdnQwMUx5OFhYbVBVY0xmRGoyaUlr?=
 =?utf-8?B?a29Zby9mUzM4T1g5N2MzdGRTU0lpMkh2d2tRVHN5RUpDR21ablV4VGhoUENm?=
 =?utf-8?B?VEQ5NktaaHV5R0c4dlczb3ovNzlaTDZJYVZockNqV3JSaTFWK2VVem40czgz?=
 =?utf-8?Q?w4QTtxS3dJkAm/92FMhDJN6la6UUnCfWqhog8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmFkZzFhVWc5ZlY2eU44ZXFMZTBvRVdvUm00THpLT29FeFZlWkRhanJEY0tX?=
 =?utf-8?B?YldIR2tnRzFrUGRoeW15bjFma1VKQWFNSUZ6TjZxaU5uWGQ4S1dmdzR6SzZn?=
 =?utf-8?B?V0xwaG44MDI5ZFhEYjhLaitDazNyUDJoclpEakdqSlJKQnh4dnRkK2JhQkda?=
 =?utf-8?B?dU5JV24wTlhkYVd0alVPMy9zaFlKTTlYZW9Nc3p0TEcya3FpTEp5WXZPMW9M?=
 =?utf-8?B?MjZtdHQwQWliRDF1MUNlOGVidkVFQlEyMzVOaGdUR3lNOEVHUEhLS2Z3R2xh?=
 =?utf-8?B?RVdhZ25YUnNIdW5OVlgzcnhRRTNhTll4OXhIRXRHK1g2ajhvRE1yK3VBK3Qr?=
 =?utf-8?B?MW1GVTd6dUt0dDYzc1NFRnlXbDV5WjhSTUdRZXd2T0lGWlNoZzZSaGU4emNC?=
 =?utf-8?B?NXdYZnA2bWxFeEowaFNmMy9BdFBMNTNNQjNXNkxDWXlhNWZLS2dXSGZnK3RK?=
 =?utf-8?B?VStIc1dKT2RzMGN1RTBYdHVtb2pja2lkb0J0bk9OYWxHaDE2M090bTNtSEp0?=
 =?utf-8?B?T3FNVkFKMGZCR3JvbDVrbTA0M2xlV3FkVG9hN2VjZ3F3ZmZ2MFdVdXNqUWJY?=
 =?utf-8?B?Qm9FeEdxL0NUaFpWM0lQQVdtUWd2N3F2NklESWQvZ1poUi83MngwM010R3RE?=
 =?utf-8?B?TnBneTdwV0VGK3FhM2lmNi9Bd2NCd2V4TFZFdnJ5WUR3aEluY0tERXQ5RVpl?=
 =?utf-8?B?VGwxc25qWnBaenNVUHdjaExnSkpUSnh2bGVOZUlVOGRSSzluYmN3TDJsbzFp?=
 =?utf-8?B?VmJkMzFYOWhzOWpHUkozR0pzam12cUZqYnYyc0pSNENQOXdSMFUxdGNBTEJX?=
 =?utf-8?B?dU1vbk9VK1Y0YXkwbks1VUIvQ3RueitibTBXOWlqcHdjSCtLeUd2d2dWTFdE?=
 =?utf-8?B?WHpKeHNCNThXNTl2V3JteXBxWjBMUHpRMjc1ajExTG1uZG9XZVY1WWRPaGZo?=
 =?utf-8?B?Snd4UUlNNEdRc0ZkNEM3N2ExSFB4MEVoTExSVkFrc1VnZEZVYjR0NFU4NUJD?=
 =?utf-8?B?VzByb29Cb1ovbVIwYm1sbjVVdDQycG1CcndjWHk4OS9DaFh6REgrM3JYZjNh?=
 =?utf-8?B?Q09iVnZZeElLSnVUaHpRV1hkWkQvWDczSW9vMFR2U1d1d3B3ZHNHaVlkRGhw?=
 =?utf-8?B?YytveG9CMkhLOTZGUWRyNzFyOXR3VkpnN0x1N0VYNVV4SlpkOXNCTVBnNHIr?=
 =?utf-8?B?MSsxcVlZcWwvd0NldWFGN3NUeDNTT2szcnFOYk5WL2hXR3R4NXNFR3psNnJ2?=
 =?utf-8?B?TjhIeUhOOXhoekRTQnp2UzZyWkxUS3hET1M3RFBPclJ6dU5EZXFKV2dwb3p5?=
 =?utf-8?B?TnZOSkZ5cTN2cTFEZ1R1UmFBYnkxa2pXZVd5YmNpUVkwOGl6Ykk1N2xBNTRC?=
 =?utf-8?B?Z2c4dXFMZzZCL0VvUGloYjBuWGtiL2FQazlzblowbnBiNVZlNEhQTWJ3dDZh?=
 =?utf-8?B?VWJaMmVqRE8yQWptWEFCQnI3Mzh4OFJjOUgzaG1Oa1VxSFNHZFF2OSsyWVFy?=
 =?utf-8?B?L2RrQit6eVRtYWRaa1pWajB6azh6dCtvWWV2cUFhejMwWm5sd2hCSVc3TU5W?=
 =?utf-8?B?VTNzR2wvdE1QZzZaQk1XVEtZd3BCTmRSRG5zMy9Nc3Fma3RwQUlnL2MzZ0k2?=
 =?utf-8?B?SnRSRk1FZUtCNFN1SmZCY25OS1BEMjEvNldHNVZTVFk2TERyaWRaNkNvZTFa?=
 =?utf-8?B?N05VeVN2b1cramlpQmkxYlVZLzRKWWdVUGpTeG4zWFA2ZzFhQzJINU1zWm52?=
 =?utf-8?B?Z1dmeVhUMVZlQVY3Y2U2SmprVWZxZlF4UXhnWjltUTVwVUU2QXU1RUdPb0xS?=
 =?utf-8?B?OVVNakZ1S1cxVXNTS0EwWFFWWGdYclRaZDhEZnVYV1lEdDBJdnpJRytRVXhx?=
 =?utf-8?B?dlR4RVlsSUJyZjcvWllJT20vYlYxRno3MndCTkw1WVZyK2hjRkpJa21iZTQ2?=
 =?utf-8?B?ZzQyRVFQa1cxY21lMUVybjBhc1V5U3NNVDBsQ25BYm0xUmF6c0xabUFEeTdz?=
 =?utf-8?B?L0pGVjhXNkh6bjErUzlGQ0NJREk3NWlLZTM0WlZNZXJZQWhnamF3Nm9SRDBG?=
 =?utf-8?B?c29QTCtoc01ySnBuejQyQnJ0VlZqS2dZYnY4bHpQKzlYdk5rUmVIakcxSDRM?=
 =?utf-8?Q?DifdQiWS/3t7xqOOAQbOadgTH?=
Content-ID: <E41BF462CAE1AC47A9D83D70CD4A0CEE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846def09-b4db-4e01-8a97-08dcf70316ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 03:46:22.1158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQ8kk9MBcBVZ3ijkocRwtrtKCHOBl1YKccn2/lIqk7v8QWRw0FwbmMN8HFy10ngZCZ3hscoZ1+jyFjBivDMDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7249
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.852200-8.000000
X-TMASE-MatchedRID: nVQUmLJJeyZm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYEmo
 bOLhIyMmCPYbugXTgR+M5TCLNNgDParukyhyG02kylAqNTt8FdX54F/2i/DwjRrUQ7A9MrmGjse
 1+4fQ7uu2XuqHnmj9+6mN6Vg7c0C4rpRH5+x/2gO5PNqdvNvYV30tCKdnhB58pTwPRvSoXL2y5/
 tFZu9S3Ku6xVHLhqfxIAcCikR3vq8atIw0pq9OeCvracXdTt2r3DCLO660/eIF2v1pMmCNYQbGB
 pCJ7Kol
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.852200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DB961F23DBCFD23A6BC073E9A624F31805ADFE04191B1A44A80A9323B19B24662000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1497478583.110998754"
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

--__=_Part_Boundary_009_1497478583.110998754
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
DQo+ICsgKiBzdHJ1Y3QgbXRrY2FtX2lwaV9od19idWZmZXIgLSBETUEgYnVmZmVyIGZvciBDQU0g
RE1BIGRldmljZS4NCj4gKyAqDQo+ICsgKiBAaW92YTogRE1BIGFkZHJlc3MgZm9yIENBTSBETUEg
ZGV2aWNlLiBpc3A3XzE6IHU2NC4NCj4gKyAqIEBzaXplOiBidWZmZXIgc2l6ZS4NCj4gKyAqLw0K
PiArc3RydWN0IG10a2NhbV9pcGlfaHdfYnVmZmVyIHsNCj4gKwl1NjQgaW92YTsNCj4gKwl1MzIg
c2l6ZTsNCj4gK30gX19wYWNrZWQ7DQo+ICsNCg0KbXRrY2FtX2lwaV9od19idWZmZXIgaXMgdXNl
bGVzcywgc28gZHJvcCBpdC4NCg0KUmVnYXJkcywNCkNLDQo=

--__=_Part_Boundary_009_1497478583.110998754
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dXRpbGl0eSYj
MzI7ZmlsZXMmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQNy54JiMzMjtjYW1z
eXMmIzMyO2RyaXZlci4mIzMyO1RoZXNlDQomZ3Q7JiMzMjt1dGlsaXRpZXMmIzMyO3Byb3ZpZGUm
IzMyO2Vzc2VudGlhbCYjMzI7cGxhdGZvcm0mIzMyO2RlZmluaXRpb25zLCYjMzI7ZGVidWdnaW5n
JiMzMjt0b29scywmIzMyO2FuZA0KJmd0OyYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7SVNQJiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO1NDUCYj
MzI7Y29tbXVuaWNhdGlvbi4NCiZndDsmIzMyO0tleSYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjtp
bmNsdWRlOg0KJmd0OyYjMzI7MS5IYXJkd2FyZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7cmVn
aXN0ZXImIzMyO2RlZmluaXRpb25zJiMzMjtmb3ImIzMyO21hbmFnaW5nJiMzMjtpbWFnZQ0KJmd0
OyYjMzI7cHJvY2Vzc2luZyYjMzI7bW9kdWxlcy4NCiZndDsmIzMyOzIuRE1BJiMzMjtkZWJ1Z2dp
bmcmIzMyO3V0aWxpdGllcyYjMzI7YW5kJiMzMjtidWZmZXImIzMyO21hbmFnZW1lbnQmIzMyO2Z1
bmN0aW9ucy4NCiZndDsmIzMyOzMuRGVmaW5pdGlvbnMmIzMyO29mJiMzMjtzdXBwb3J0ZWQmIzMy
O2ltYWdlJiMzMjtmb3JtYXRzJiMzMjtmb3ImIzMyO3Byb3BlciYjMzI7ZGF0YSYjMzI7aGFuZGxp
bmcuDQomZ3Q7JiMzMjs0LklQSSYjMzI7YW5kJiMzMjtTQ1AmIzMyO2NvbW11bmljYXRpb24mIzMy
O3N0cnVjdHVyZXMmIzMyO2ZvciYjMzI7bW9kdWxlJiMzMjtzdGF0ZSYjMzI7bWFuYWdlbWVudCYj
MzI7YW5kDQomZ3Q7JiMzMjtjb25maWd1cmluZyYjMzI7SVNQLg0KJmd0OyYjMzI7NS5NZXRhZGF0
YSYjMzI7cGFyYW1ldGVycyYjMzI7Zm9yJiMzMjtjb25maWd1cmluZyYjMzI7aW1hZ2UmIzMyO3By
b2Nlc3NpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNp
YW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Ky8qDQomZ3Q7JiMzMjsrJiMzMjsqJiMz
MjtzdHJ1Y3QmIzMyO210a2NhbV9pcGlfaHdfYnVmZmVyJiMzMjstJiMzMjtETUEmIzMyO2J1ZmZl
ciYjMzI7Zm9yJiMzMjtDQU0mIzMyO0RNQSYjMzI7ZGV2aWNlLg0KJmd0OyYjMzI7KyYjMzI7Kg0K
Jmd0OyYjMzI7KyYjMzI7KiYjMzI7QGlvdmE6JiMzMjtETUEmIzMyO2FkZHJlc3MmIzMyO2ZvciYj
MzI7Q0FNJiMzMjtETUEmIzMyO2RldmljZS4mIzMyO2lzcDdfMTomIzMyO3U2NC4NCiZndDsmIzMy
OysmIzMyOyomIzMyO0BzaXplOiYjMzI7YnVmZmVyJiMzMjtzaXplLg0KJmd0OyYjMzI7KyYjMzI7
Ki8NCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a2NhbV9pcGlfaHdfYnVmZmVyJiMzMjt7DQomZ3Q7
JiMzMjsrdTY0JiMzMjtpb3ZhOw0KJmd0OyYjMzI7K3UzMiYjMzI7c2l6ZTsNCiZndDsmIzMyOyt9
JiMzMjtfX3BhY2tlZDsNCiZndDsmIzMyOysNCg0KbXRrY2FtX2lwaV9od19idWZmZXImIzMyO2lz
JiMzMjt1c2VsZXNzLCYjMzI7c28mIzMyO2Ryb3AmIzMyO2l0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioq
KioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioq
KioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdl
IChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3By
aWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUg
dW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9u
bHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9u
LCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBp
ZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGll
dmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3Nl
IHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlv
dSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_009_1497478583.110998754--

