Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D63B9B41D1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 06:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CE710E0C7;
	Tue, 29 Oct 2024 05:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="k7hvZAco";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gXSSgq7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A505C10E0C7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 05:35:57 +0000 (UTC)
X-UUID: a8b07f6695b711efb88477ffae1fc7a5-20241029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=dwDbZfuzMuTLs3VwWKLgZ4DMso35kE1Jri8kwF+mA2U=; 
 b=k7hvZAcoEdtzic4/urRBkqnt7NviPuYgwzVvZhEuOCLU6Qv8nksN266eDVs1jKXqOaNdTeZL0qtC5rYG/oPRSBSdyzNDKlpjon/Ptmtwzm5nT152UxKsG5cyClZmDZ+BzX6HG9uEXi6anMR4KPhSL0iK/osW4QpXzFRbM1kZT7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:e7dc905c-4e6d-4764-be6e-037d1c42437b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:136336e7-cb6b-4a59-bfa3-98f245b4912e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a8b07f6695b711efb88477ffae1fc7a5-20241029
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1333981248; Tue, 29 Oct 2024 13:35:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 22:35:50 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 29 Oct 2024 13:35:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMwrpzr4O/DwzQkn9lqUImO19cUaxnZvLfEFPb/brDD0MePtK+ZPNMiJjSsU5Q2tB9zU5SIDWQzd/9St8SXucQjILEDLuD3EFHiZdnA8V/79MS9p2ww2bUm6lkPuRhtrkjT415f1rbgRyGBmMG8jXe8/KoVQerZnr47Am/Qh1j7QBQ4wg+JpfTNtUXOkvSG3G13/136Qmt0Ez+suCO+0hj2ge7IlyZJmJ64cE/Q7S2PWPyqNFOGPJDqn5Z9q0jkvdofNzBUsASq+v+i9hX2yjou0n4Q0iQ1JKyNkMGdIlseFFrsNMYBklPW1gSxI09hK/kSEowNvalFcYpAbbODjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYxY60b7k+2xGK88j6mPCiXBRYWlbosHo33MGp6BaKQ=;
 b=iim4p4KILFE8RLM6R6md5hAbMUvEC2pDB7+h/2nxdqVDmiB232Z0rlVVk9d0L/yRL9i/9oKp74idQukni8HDIJfME1+CCFUTvKwdAvC1ODVrU0W9yRuAMS+H1IyYYpsRPzOf7UrlURyXaMPXcW8RcGoL4ruTnmuoJvhiyDt1M7hdoRJF12h9FyTpJzxR5z/iOp5GQI6eEq9hE+aOkyeIXGZIJchj0JpvWuz03+5L4mt/xSDSUBZkjqc9olHCsthAc21Tr2Ozk4UPtndOOUB2xhKPpRJ2A/yRwfPfvD6IjhYIbAwfxm8lHqyKBEm4iwQnPckOXOSiEwfT15AL8cbgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYxY60b7k+2xGK88j6mPCiXBRYWlbosHo33MGp6BaKQ=;
 b=gXSSgq7IzgCsmWxPNvWX9A2cYGpV3Su6qJWuIwZHJ43YldhfWXW9NfAqfNmzJak3iNfp7sIyq+xjoNSQsL/sgYlR8E1eDeDZzdFa/AfvymWn4TVbMXfZAsk6G9GRwodbuoFIzCHt+lr63/sVUewdrYBdoa7TA5vBlu77f5/0q9k=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7718.apcprd03.prod.outlook.com (2603:1096:820:ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 05:35:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 05:35:44 +0000
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
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKdVE+A
Date: Tue, 29 Oct 2024 05:35:44 +0000
Message-ID: <acf0eb12e00d2096ce84960480b73718667cfc89.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7718:EE_
x-ms-office365-filtering-correlation-id: 5c86a53c-a814-4d7a-5681-08dcf7db88ea
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U1BrYjEzUGRGeUZ5bjZCRW12bFRrZnROSTgyZzdmbWxLZUZGZmdyQXRBNUZp?=
 =?utf-8?B?ZmpHNGpDZXUxZUI4dThKVVhGVWdOREJPdU45U282blAxTWtqRUN6L0VKZ05I?=
 =?utf-8?B?d1JRYmozNjB4VVhiS3BtdXB6enJKNGpTSExKQnlWNXV0bHFqbTU5eEJDbVRQ?=
 =?utf-8?B?NWJoREtTeGNrdTNLTEVwczBKcmJmaUpyOThNRHkweTNReEo0SVRDeXNWSGtB?=
 =?utf-8?B?eTVPQUVBNEF0bGZHVm9SU0h4RHBpYSttZWhYeW9pMjlsdTJvZmpBZStOd0gz?=
 =?utf-8?B?NnY3WDcxNkFPVDZKQXN2RWNpdk93eTJZVWZxbml5U1FkTGZQL2R0RzBDTGdO?=
 =?utf-8?B?em4vK2cycWltVS9Oamk3NEhaREtVV1RhWHRzcGJZdVdaa0dSNHdGMmZMWjJX?=
 =?utf-8?B?a3RiOHdlMXhOK2NZd0E5M3ZoMU9pd0MwOE9DMm5IN3EzNVVidVk2WTMzZk5N?=
 =?utf-8?B?cnlieWg2RnBvUkFoQTRaQjdwbTMvWnBSc240TXo5cXlTQmxxeWVSdzcxVURP?=
 =?utf-8?B?UkNydzBCcDdrVWwwYjBEbHBsUUZlTExJV3BhdnVLRWVNWUZFN25oblRhdzM2?=
 =?utf-8?B?WmFkZmNFVzZHU0hYSHVRM0w4NEo2bkVVQUlBeElXQUFTVE8rZzF3eCs2b3RC?=
 =?utf-8?B?K0duUzNQQlY2NU5yVG5iekNPeG9yTU9NTkNlay8zQ2lDUXlyb2ZZa045eVN5?=
 =?utf-8?B?V29kc1pVa1B0S0JZQ2l0TE9CZkVvS3dGU04yUzN0S2Rwb25kQWZuRWl1a2E1?=
 =?utf-8?B?Nld3VFd2TDA2eExSWldjc2pRdlJvTTY2MmxrV1pZMVBXNERUaW1QNWRKQlRy?=
 =?utf-8?B?RUpoMVRRdndYNW9ra0VObGFjQ01xc3l0TlA1a0VmZ2YzZDJwalV1VnV6WGxs?=
 =?utf-8?B?cTNoYXM0NkkzQ2tZU0NMMzU4SWwveGtadmQrRlhPdlRneUdwcStsUC9kYjlh?=
 =?utf-8?B?aFlnY0ZIcE4yVHMzMjFhN2NiaEhtWk9tUFZjVWdzMUtnTDNjYzV1TW9FVHlQ?=
 =?utf-8?B?aGM0bHM2cDFJNnk5dFpkMGoyK1dMSG1QNEVQMDZ6ZXJ5ejBwbTNyUGd4d0ow?=
 =?utf-8?B?b3pkRmFpaURUVUZGcHdEejRFUis3dUFjbVVSRzVxWTZvMW5IZGlqZHkxS3JQ?=
 =?utf-8?B?NVVnekwvV3ZHbEtrcVVzWU5jcmtJYzY1elZhSkRKZEdMTkxvdjZKbnBrMzd2?=
 =?utf-8?B?RzU3aFBCbjYyalJ3SkZ2M1JVdGIwcFNFR2I4ZWxvVUNPbGUrNjhLdkk2Zkhy?=
 =?utf-8?B?OXlFZTYvem85S2xHZmpZbkk2RFBUV0Yvc0xCYnlWemJtK3I1dWQwd2RPeEZi?=
 =?utf-8?B?SmxwVG1nL1dSVEpYTlZ0SVpWY0svUkFQdGNIeFJuQ213czFTNUM3cHViU3E0?=
 =?utf-8?B?SmRYbXE3elUrd1BKaU5mdy9pRTZHQU9BNmFqS0EvU1g0R3RIVHZ4K3NPR1dq?=
 =?utf-8?B?dlRySGpjMDJLYU53M0paTDFVY3B4OWxxMUJrRXpGU0cySmtFc0pTZTFlU3ZB?=
 =?utf-8?B?Z3o5R3IzOW1EM2lQL0dCS2Z6Vi9OWmdQb2JpWkwwaEcyUm1iOWdJdDB0K0dJ?=
 =?utf-8?B?YjVPZjFLdzVIS2ZremFEcUtJTmV2SDFwN1FwaUpLd0dZazk5MENVZ1FHTnF4?=
 =?utf-8?B?QitLQm1wY1F5OUpIMjE2dGU0RWowUStqSzl2NzhWVk4zK3ZCSDFtS0NCOVZn?=
 =?utf-8?B?WDRncXVqSjgrZTNhQUM4bGlQQzlPenVDcS93K252bDFNT3B6NjNaOTd3Mjlk?=
 =?utf-8?B?MUNraFAvY3A5UDFRK0JoeVh2aSsxTUdaWEtPQ0I3MXJBMmx2QVRiaGlrMWRS?=
 =?utf-8?Q?4ppTikIZ/P+BZtk850roN5BC1bjT3bjZGgZwI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFQ5dU9EM0xhcmFDOWR0citiQnFQRnNCdkMrTU1NVUVVd09FQnpTTmY0Y013?=
 =?utf-8?B?dDVBY1VRclZwZ3RzVE1jV3R1VTJSUzd6Y3g5NU5qS09KREd3QThISUUwSnZY?=
 =?utf-8?B?OHJqRUE2WUdRcUQ1MmFYc2dRanpqUzZjNkIzKytWV0ovcXBnbHZITUIvSXRi?=
 =?utf-8?B?S0VHL1ZJaTltc0FIdlJhaDFDM0VYWlcyUjlwWHhPaXUyTnNWclJubWVoTTU4?=
 =?utf-8?B?SVIxeVNLeDRTVXFRUmVyLzAzbDVTVDhPNE1YeGpNNldDbjg3WEUrb3JoKzlj?=
 =?utf-8?B?Y05QZTczS2FCQWVEOE1aY0I0b3czRnp6ZG5QTk5rNXMvVEZsRExCVVgyQnBw?=
 =?utf-8?B?MlRBY3gzOEhnRlZrNTRtRUdJdlR3VWpzeTBydmJEckl4eUhDYklqcnQ0dk5j?=
 =?utf-8?B?N0NQWEtydVIvVEJxZTZIb1k2WEtzdFQvYWZGblpPaXNES1U0UkVCRmFpSjNk?=
 =?utf-8?B?WGVOV1d1S1o4aWFHS2JJL1dYMWZKSG5zc29jc0pzclFHelJHRjZwYVdvcHla?=
 =?utf-8?B?K01pTVRSaE1YU0ZOSW03ZW1sY0RqVzlpQ0gvVSt5NG5xdTZ5ajEyRlhtNWZx?=
 =?utf-8?B?UTFzcm9sWlhncytybkpKelRoUEh2QW5UaVRmenFJSFgzUlpjc1pXQS85aDcw?=
 =?utf-8?B?Nmp3bFNoZVNqcEJnOWRKRkRmWnVWVGM4Szl6UjdhOW9nTzEvWEp3RFNnSlU5?=
 =?utf-8?B?a0oya2ZTUmsxTjFKNVNSUWlxdlZJRHFKb3RZcFBSRGFhelJLb0Z6dmEvR1dM?=
 =?utf-8?B?NGRGVFBCdERMWjJybS9LcjNydStIb25sSEw5bHZCY0JLYjZKNmxrZUJXSXBE?=
 =?utf-8?B?WGxOYnZjTk1BNVhBYU1LYndaR1FYYUp4SldQR3pLV3Nxd0dvOWc3RHZZMkR3?=
 =?utf-8?B?YUNvcnMyMkZjcVFxblEyb284T1FGNXYvYmZjOEJFQjBlTmp5WS83cks3SlZa?=
 =?utf-8?B?UlQ3dmlzMlE5ditDMTg4dXVxNEFoUnRKYVdBVmwzdXNGSENVUWpvam9Sc1Fs?=
 =?utf-8?B?V1RMSW4rdXZzZWZXY21SVlFKajdnNVZldFowNEV2Um81c24rZHp5eW5SQ2RJ?=
 =?utf-8?B?OWdORHN0ajB6VW9BNFMxNEpUakxTU2NUSTRSVkdOUTIvUE9aOU8yOU1wemRU?=
 =?utf-8?B?YzU2SGFQRkt1bG5ia2ZRcHBuM2JFcHlQQW13Q2dvNDZhdWRuUTN4NmtQTEsz?=
 =?utf-8?B?R2g4Q09XSmFwWk5xeVU2ZXpORHFNNmdjSEg4Mm9jeGV4dU1YWHFzcjRTL3hr?=
 =?utf-8?B?U29mOXBCNm9UdU5aV2xsMmgvRlp0WTRDMU1VaWUzMnF2aGRQb2ptaXVVZVFC?=
 =?utf-8?B?U3VEaS9yYy9wem01TkV6UklpVWZJdENWd0x6REJnTHRXMUpVWTZMbzNBRmR6?=
 =?utf-8?B?Yk1mcmVBclNZSVFTYjE5SWExQ043RTZIOVVvT1JodTYrZndPTWNNbDRxRXlM?=
 =?utf-8?B?Q3R5TGpPbHltMExJQ2VmZTZoRDhvdFdqNTFhZ1VIdnRIYy9oTHlNZXhnVnlx?=
 =?utf-8?B?ZCtyMVdPV25LTHpCd0tDMm0wYjUraEdtbzQ0cmpneVNLVGE2SVdqNXBmampx?=
 =?utf-8?B?NS96VFhsaklySHNSRlhMdXlVTzJET3lHdi80a2FHM0ZURitDQ2hqSFBYOXVI?=
 =?utf-8?B?YXZKbFR6VHRqRVJwcXdicEQxS2R4MC9nc0NuMXdBV09QY2pSSGRZV3RtV1R0?=
 =?utf-8?B?TXVwTmJBdkI0R2RublFHdlA5dXBDcEFNVTBqMVZuSllUdEg4dFg2Y2s0c0N0?=
 =?utf-8?B?aDRGcktEWElsOGFtUGlGM1p5UVhuV1RESUNCUmhrQVRteDlWbFhOaVFhVUZp?=
 =?utf-8?B?UElobkRHRmJTNFE4S0h4eHpESVVHQWMzL0cwdzlmQk9keDhQZnEwSHM2cXpv?=
 =?utf-8?B?UjhXanZMQ2xaSDNiVEs3NmtVSDhSeTZSdFVDU2ZNWFNTemZMU1hobDBKNlc1?=
 =?utf-8?B?aVJUMjBsZXZXODVFcXNoQzJCeUk3WnhJSDViQU1mSnhGUWxVendlZ3JyOVpZ?=
 =?utf-8?B?VVQ4dnZwSGZkQlNRTHlZQjZMMTJaVWdONWYxTWIzb0JIT2MzcWpaYitXRWps?=
 =?utf-8?B?WG92ei9rVFpoYk5HS3F3WkZhQllTTDhVSUd6dDZGcXUwV01rY3BYYy9wT0h2?=
 =?utf-8?Q?uaeNw9mZFqsifIsBYDzdUOhJ6?=
Content-ID: <0BE6E3A533DE0A44A985EB50C71E57F1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c86a53c-a814-4d7a-5681-08dcf7db88ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 05:35:44.6298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /YnZsMRbfjfEG6xYNn0adXx7iysSSkctGxcYNoXIVbggDE/mjHN1A28D8OexkC1Y1brFIp+nmXbSa5TAD/8iDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7718
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1683302658.1973106804"
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

--__=_Part_Boundary_002_1683302658.1973106804
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
DQo+ICsgKiBCaXQgRmVpbGQgb2YgTFRNU19CTEtISVNUX0lOVDogTFRNU19CTEtISVNUX0lOVDEN
Cj4gKyAqIE1US19DQU1fTFRNU19CTEtISVNUX0lOVF9MVE1TX0JMS0hJU1RfSU5UMTogWzAsIDEz
XQ0KPiArICogYmxvY2sgaGlzdG9ncmFtIGludGVydmFsIDENCj4gKyAqLw0KPiArI2RlZmluZSBN
VEtfQ0FNX0xUTVNfQkxLSElTVF9JTlRfTFRNU19CTEtISVNUX0lOVDFfTUFTSyAgIDB4MDAwMDNm
ZmYNCj4gKyNkZWZpbmUgTVRLX0NBTV9MVE1TX0JMS0hJU1RfSU5UX0xUTVNfQkxLSElTVF9JTlQx
X1NISUZUICAwDQo+ICsNCg0KTVRLX0NBTV9MVE1TX0JMS0hJU1RfSU5UX0xUTVNfQkxLSElTVF9J
TlQxX01BU0sgYW5kIE1US19DQU1fTFRNU19CTEtISVNUX0lOVF9MVE1TX0JMS0hJU1RfSU5UMV9T
SElGVCBhcmUgbmV2ZXIgdXNlZCwgc28gZHJvcCB0aGVtLg0KDQpSZWdhcmRzLA0KQ0sNCg0K

--__=_Part_Boundary_002_1683302658.1973106804
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
MjtCaXQmIzMyO0ZlaWxkJiMzMjtvZiYjMzI7TFRNU19CTEtISVNUX0lOVDomIzMyO0xUTVNfQkxL
SElTVF9JTlQxDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjtNVEtfQ0FNX0xUTVNfQkxLSElTVF9JTlRf
TFRNU19CTEtISVNUX0lOVDE6JiMzMjtbMCwmIzMyOzEzXQ0KJmd0OyYjMzI7KyYjMzI7KiYjMzI7
YmxvY2smIzMyO2hpc3RvZ3JhbSYjMzI7aW50ZXJ2YWwmIzMyOzENCiZndDsmIzMyOysmIzMyOyov
DQomZ3Q7JiMzMjsrI2RlZmluZSYjMzI7TVRLX0NBTV9MVE1TX0JMS0hJU1RfSU5UX0xUTVNfQkxL
SElTVF9JTlQxX01BU0smIzMyOyYjMzI7JiMzMjsweDAwMDAzZmZmDQomZ3Q7JiMzMjsrI2RlZmlu
ZSYjMzI7TVRLX0NBTV9MVE1TX0JMS0hJU1RfSU5UX0xUTVNfQkxLSElTVF9JTlQxX1NISUZUJiMz
MjsmIzMyOzANCiZndDsmIzMyOysNCg0KTVRLX0NBTV9MVE1TX0JMS0hJU1RfSU5UX0xUTVNfQkxL
SElTVF9JTlQxX01BU0smIzMyO2FuZCYjMzI7TVRLX0NBTV9MVE1TX0JMS0hJU1RfSU5UX0xUTVNf
QkxLSElTVF9JTlQxX1NISUZUJiMzMjthcmUmIzMyO25ldmVyJiMzMjt1c2VkLCYjMzI7c28mIzMy
O2Ryb3AmIzMyO3RoZW0uDQoNClJlZ2FyZHMsDQpDSw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48
L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
YXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2Vk
LCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBs
YXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0
ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwg
cHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
aXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhh
dmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkg
YW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50
cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2Yg
dGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0t
LT4=

--__=_Part_Boundary_002_1683302658.1973106804--

