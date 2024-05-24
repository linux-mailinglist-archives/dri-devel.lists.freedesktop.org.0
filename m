Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783AC8CE0D0
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 07:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD3810E060;
	Fri, 24 May 2024 05:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="GyLNqnN2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="pmAUXhT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9923210E060
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 05:58:18 +0000 (UTC)
X-UUID: 9a3da946199211ef8c37dd7afa272265-20240524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=SLIJC7Hc/LVfnZJIDdTklGHVwWZ9fb56jrcRtbvw+Yc=; 
 b=GyLNqnN2V2hmJXS5dvQM5IBwPRSJC/+KkHPapM5q3CrNA6h8KLNByzdaRh2ISuIxWZYFuBCCZ2Bbj/gI15TdyCjjRNm5i1opoGRYdG9ze5KA9KyacvNKkjDAlkm0Opxy7BuNp9X1dQ+UuwK0Jj+q86+WF2hUx3x78NveJ8dRYJo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:cab26510-0405-416e-8fc6-96e5ad0b5a59, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:3d1ac287-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9a3da946199211ef8c37dd7afa272265-20240524
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 23634874; Fri, 24 May 2024 13:58:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 May 2024 13:58:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 May 2024 13:58:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Smp/MBkxbPhVHHTCfq8/VwSfa0i+hdB1qsJZYSM+HuHLu28PsYJDJK3pgIKm+jgTWeGgNgIhtrtXfM6Q76vsG2i05NGJWLV3KcqYguTEcIuYKRQxs6TF9tnvHGbbWVRi0NvXR9DbffHUCmzHjghqcJy8m+8fbene9LPZGiUrQaYzT4YSbh6JRori37TCxBx2uAK7niIPqkpNUi18766GJIaHJGBBrZmaH12devBw2dlMBO2roE0rcHNoFszjXBTKDxNmOPPVMb8LXAvlVEK3Ssp6BKw37NO1OE29/KBN1Tj/WORO+0nJUF8ydhyOBjph0hNWfjo9Cr/y+flA/J0GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNUXz0ZAxVppYY9katwCJj42i3DjN3hX/VCDLqizGEI=;
 b=SUW0XZ5TSoddaPUODbxzcFmiAshPwliW+iAkXZjvyEzdVKtZL4SyBq+e52G4Ud1vpNDrl74eNqBbZsTTXZzxP6IUo3lNkok57/w5ZlbmhvE7bN6gJ6JzCBhOJ40XDeUiprXQ58ixid/D2Iws2j5O/qEOQ5gAEaB0GaPy2JZTsouWn+92An5JMm3VUlBkuAyHfAITrcJpnyk9MrGQ5BIDgsylDoVHXKvBuCHGYjaAK2ioeTJ4TlG63w/yNb+ROHVPqx+prHdyV+YproblfgIbBqYRnteZPiIcfh3e2+46cqUABGQfq+awf040+SnEFuMXULDG7v4t8zAJcVvn0Y89LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNUXz0ZAxVppYY9katwCJj42i3DjN3hX/VCDLqizGEI=;
 b=pmAUXhT2DFvK3P4xJbM5rgB6166/L74QNKXEe8bB5wYrNiWWU7PlXrGwdgFhiONyliUoCPQiSUMYccCpZRmH/Ytebbs6jExtrrws5psifuM+nLgWI+XBcVdqOZlWOTzRf9sr4giQpDURe6SVsRqP2NNOrouWDyom1ijE8iJibCg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7421.apcprd03.prod.outlook.com (2603:1096:990:1b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Fri, 24 May
 2024 05:58:08 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 05:58:08 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "robh@kernel.org" <robh@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 03/15] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
Thread-Topic: [PATCH v4 03/15] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
Thread-Index: AQHarQ/Ak3hlQtJJ/UWtBg3sgApZPLGl5JOA
Date: Fri, 24 May 2024 05:58:08 +0000
Message-ID: <6bc8a1334dab5cfcfd7a0a8b4ac126c997f9be43.camel@mediatek.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-3-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-3-ed82eb168fb1@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: b78fea24-1a06-4b96-af89-08dc7bb67c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?ZGx6WnE5dWhPZW1xMnpLMm82aG5IYmJ1MEpVZWsyOUoreUY3T0cvWEtzUGNY?=
 =?utf-8?B?bGo5cml6TlVJYlI0V0pRUWh0Q2drOUY2US9Cc0c3NkRzZmhUaVV4cEpkcVo2?=
 =?utf-8?B?SVBhVm1wNW4yOHhyYzFZZlZOTjRJMGpZdE0rWEk5WlZnQ09NSDNRL2JQMjJW?=
 =?utf-8?B?UWwzUmFQWmc0NDJwbms0bnEyMGlERk1TbTcxWHJoVzE4ZmFOQllPSnNuYVgy?=
 =?utf-8?B?eVBLamRkZGtiNlFFOGhreW41cWZGNTQ0YUw0d0Z4UFhWWVp5T2ZuNFEwaytX?=
 =?utf-8?B?cEhqMG1wMTNPMXRhR1c1M0FBbUp1dGJwbjFxeFVJeUE0OGhOSkFNUjB6YXN1?=
 =?utf-8?B?K1hIbmFkRXdxaHRMZko4ZURteWhreUw0T1JraGQ0M2pHekYrUzZOMWc1eUF1?=
 =?utf-8?B?eHFIUGtWNjhTbSt0b0VQWVFLT21iQXRNMmNpSzN4cFBvUnFkcEpoYzh5REtM?=
 =?utf-8?B?VmZoUXRyWkl4dmxnVVhDNzA0TzJUb2pPajNtSmt4YnRCWEFxSklDSG0zbVBx?=
 =?utf-8?B?RFFPR3ptZFFPcnk4aE9PdGxLMUFLUjYveWF4Yyt5eXVWWEtuTDVXbVRQQUJD?=
 =?utf-8?B?VE5KajVVNFRQZXhwS1Bvci9GTWMzbzZxWktFeHRMZ1FvWUNBTmR5ZlY4K21J?=
 =?utf-8?B?aEprYXU0OUV6SGtxRklJOXM1NHF5VnZEM0RTMFlZa3VXUWdManN1ZUtWcU45?=
 =?utf-8?B?RHNQNEI5SVBiK0k4ZUhkMEx0RzhIU1Eya3EyV2x2T2ozc1MwUHlWRWdSUTVF?=
 =?utf-8?B?RFJPSnd1REFzMCttUUR0L2x3TzFDT1YyQ2lsRTN0dXBwVWU4ejg1NFFZU0xk?=
 =?utf-8?B?R1RXWTNGR3hQTkZUWkw2WXNzY0I1ZnltV1JSbXpwSkhHUFNWYldtSk45Z0ND?=
 =?utf-8?B?V2t3MGhOU1N5TEFvYVU0aTJPZjFHMEdEUXdRcjBaNnZNYTBYVmlVUEFuUjVT?=
 =?utf-8?B?eExTVSt2Mk4yZU5tM3Z1aHFPWXYrTVM5VDFFeVhjYW5IbE1NT2dhMzJlZGl4?=
 =?utf-8?B?ZFk1MTRGbDQ3WUxKM0RKSm9Hd2g3bXVodXJSZVhpdE9QaUljanJERnBXQUtJ?=
 =?utf-8?B?NHhIRzZaYytzMkVlMWUwU3hOUkg0d1VBeXZaOGhiVFB1Tm9Tbi9WTncyQUI2?=
 =?utf-8?B?N2ZkOVVUZzFibko5TVU2bDE1OG1LVGNTamRtcHovT0dNVkE5SmthVndRajhp?=
 =?utf-8?B?djN3R0E1aUZhMUxJOWw3MzZvWlBCdXZnL3hEbE5XWDczWlFUU0FEblppQ01I?=
 =?utf-8?B?SkFMcnErMndpejJsNnRlWG5XN3JDdFZzUWVTMHR6RG1Wc1NvMVFYV2poczRR?=
 =?utf-8?B?eDVPWU83VFVpQnV3THE3RXZYdjJLZHZLcjgveUNJL0dDM2RhdGlWZWpxQmpE?=
 =?utf-8?B?SVBXZmk1ckg2K0VoZkZoN25oUVVraXMydGhDQWN0NWduMXBPNEROckswUUNG?=
 =?utf-8?B?amd1ell3M2pBZk5UMVRxaDFKRDU4b3RubU5BR2s1OUJUK0lsYnpvb0VYWDVJ?=
 =?utf-8?B?REdSVWNld2wwenNtRUZob3MvM2Y4WmNPcVVjNmZ4T0QzU244dUdQVUI3RUZQ?=
 =?utf-8?B?bzhJUmlvcTNSOEFuOHduWnczVFdtYVNpVVBqbmYza3dPZ0V3ZGRTQTQrSXpi?=
 =?utf-8?B?eklJLzcya0Z5S2pKaEtycHQrK1I1MFd2S1ZTSENGMk5nS2FBYmtlRkhCczgx?=
 =?utf-8?B?NG1UTWhZVWJPdGFHV3NhRkF0Y3RrTDNQckN2dE9ITDZqOHZGSGJBYmFRT2ZF?=
 =?utf-8?B?YUJVV1F4TW1EamxJTjhmTHBIakIxNUdUNEprTHhQYVFXYUhJR3R1NkMxZXBa?=
 =?utf-8?Q?OWrPCRtczKVw6ZWhVkFDq3VJZ41BozaL1Jl1M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHEraWdUQnpYMlJzdEJuMmpvWXBLS2lvNXlZeFIwWDk1V2YrZFVQQjI0WXZ1?=
 =?utf-8?B?UFhOeHdhUGErb3M2R3k0czJuaHdWek8yQ3I0NUtiVmcwQ1llVDFZOUkyUkxl?=
 =?utf-8?B?WXZJOTF1L2g1V0dUWThiRVpBRUdQUjg3WVUwZFlXL1RMUk9sZ3h6N0wvc0dr?=
 =?utf-8?B?SzI3K1JwT2lUbDVqZk9pcWY4Z0tsVXdTYjF4MVFWVmRMVGFjMk5yRVFPbGRw?=
 =?utf-8?B?SmlIQ0IvS2plQWVoU0VWV3NKWkh3eHZCd2FhOFRyaU56TFhzSDJCYjZsUHRQ?=
 =?utf-8?B?aXU0MFlEOWYrWkM3MDMyZS9KMDJyNithMVZ1SzVlbmk1NnpENTlEMEZ1bkJO?=
 =?utf-8?B?SnFIVTJqYmROT1crZGliRzh2eldPeXBCclhJK2J3UjJzZDRwYzRhY0xjSFpk?=
 =?utf-8?B?NUo0N2hINnZLWkhnc1FGYTV4NlJ6UDNVOGt4TldjOTJGOXlCdExJTzhadnFV?=
 =?utf-8?B?YXNIRE54T0NBVjMvRWwwUEdpZmY3QWVzVk00dTJ0ZWx2U1BDbEFPOWpCK0M4?=
 =?utf-8?B?UWh6UFhJOU01OEc0S0ZZWjNLZTIzRlBieHBsT3E5NHp2MXgzRlVoVHdDaXNj?=
 =?utf-8?B?QVU5bWdNTXZISVhXcjMyWWd4bmFjL3ZjMllHREQ4RUJJN2RNc3JXdXV5c0c0?=
 =?utf-8?B?bGdZNFE0Rm1vTlJnVnVWbHVGZnV1cmdVNmpwdElDRWJhU05hek83VHVUU3hp?=
 =?utf-8?B?eSs5dE81REhiaGlJWXFqUm8vckdTc2dUSTdxeVB4ZndPNXE3MGFjMGduQjN1?=
 =?utf-8?B?WlNEY3g2OHpmbWh2Qm9JRlRlb3NwZnJBUjBTejJvTXZrcFZCcHo4NlUxTGJY?=
 =?utf-8?B?T09zZkhUNS9zeFBIU1RNUzMwZnJQUGdwWGM2eDlFWTJoRlRlZ0NkUm5HRllG?=
 =?utf-8?B?RG16Qk11QStBZWtkY2ZCUHVOaE9hT21CaWZweFpsRXk5RlRkcGlwWld0cVBK?=
 =?utf-8?B?d0pXYWo3K2MyNWpQQVd4WTlYbTQ1ZTZjY2hGR1JCV3pHbmZ5dnN5TE4vdnhx?=
 =?utf-8?B?dnVvUEFXWHVUK0tVSTltcXZHK3EreGNOaCtvVjVDL2hBYUNnT245M095SFln?=
 =?utf-8?B?cC9LRXQ0LzVVbzA5M3RNYVB5M1VGRGNrOXFERWtyVWdDaFJzK2VxdTRzKzBD?=
 =?utf-8?B?S3l1V1hFclV5MHZQQ09QTUkxTkJ4TFBVNU5veURTVC9rVEdta1UyL2NoWXJL?=
 =?utf-8?B?bXdGRnhMbjZZYng4a3hKTlZqOFRuY1FoeDMvcWtYUVdFY0E3Y0I3MzVHQkts?=
 =?utf-8?B?Y3BvbkNiUit4OElreXk4U3R6TG96QkZUMCtybGRxNUpMNFVITC9nLzhHdFFq?=
 =?utf-8?B?OWUzdTE1L251bGZWV214UVA1TUNSZHlkQjRwckVkczBINTBvY3dvbnJicGpR?=
 =?utf-8?B?OHlGazlsK2NFTFdXbkxmY3R4NkFNVjRTYkRMQXRVUCtkVEpEMEgrenZhaEM1?=
 =?utf-8?B?SndKdVhoSHhTeVFHUUlCTzJDdXI0VXB4T0hqbkd6VW1HTmppTXczRDRxZG9Q?=
 =?utf-8?B?SHVFV2ZueTZwMVhkUk1yZDEwTmJZMlZwcStBeGFHd1pIQVhVRnN6Y1Z1UW9i?=
 =?utf-8?B?YkpQMkI1b0FKamx5T2h5WGF5SktOMURqbytadFpBMVBmdE5qRGM4eVFyVURW?=
 =?utf-8?B?ajQ5cXBTQXgycTVDeWJlb2tRWlZWVDloWE5GSjF2NVUxZnZqZ1JsRUx4dFRE?=
 =?utf-8?B?Q0tDUEprNkpqUDFUa29JZmJXSWh3RzhRekxNR0M3bVNhVkNDdCs1Z3hpRUlT?=
 =?utf-8?B?YkZHNjBqU1BnSVE0VFVWYjg3aXdtTjdqc040SDVBOGtOU2NqbllFZFhJQ3N4?=
 =?utf-8?B?cHZrQ1RYTmxUVXR5VU9OY3BEcjF5VVdDTkdqWE5pdzVvMlhIWE5HKzViZDRq?=
 =?utf-8?B?eG1FOU9tUVh2YkRnMW9rNHRaT1VXWmlwWmljRjlRRXN3U2pWR0REVGJHdXZn?=
 =?utf-8?B?RkZEL3dZMzJzNHhSY0JWaDlGa0pyT21hZ2kxdW1CbHMzaFMzdlJ1SklDRlor?=
 =?utf-8?B?c0VtNmRvQ3BNazQxdmp0T2x0cGRmT2l3YnphcmZxWVpma0V4Y2pEd3phQnV1?=
 =?utf-8?B?S2xvR01UZTNiVko1RTA0YzRoVzlrRkN4a29kalBndVJkbDNhcXhPRllnRUxB?=
 =?utf-8?Q?CrFi0Rmhpdh7yVuVEtuS3+vEN?=
Content-ID: <4D312B7E0C1FAB449E8928A82771E854@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78fea24-1a06-4b96-af89-08dc7bb67c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 05:58:08.0814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: huS94tqwvOKqLHbJocqx3jNGkb3Tm4BtzWfSav8w0ulIn8CP1QsCeXOA36mo+ewv+gjLlcl86SNjVoxUqwECFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7421
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1564346928.866982274"
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

--__=_Part_Boundary_004_1564346928.866982274
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFsZXhhbmRyZToNCg0KT24gVGh1LCAyMDI0LTA1LTIzIGF0IDE0OjQ5ICswMjAwLCBBbGV4
YW5kcmUgTWVyZ25hdCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlm
aWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBEb2N1bWVudCB0aGUgZGlzcGxheSBD
b2xvciBvbiBNVDgzNjUsIHdoaWNoIGlzIGNvbXBhdGlibGUNCj4gd2l0aCB0aGF0IG9mIHRoZSBN
VDgxNzMuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4NCj4gUmV2aWV3
ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBNZXJnbmF0IDxh
bWVyZ25hdEBiYXlsaWJyZS5jb20+DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY29sb3IueWFtbCB8IDEgKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY29s
b3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGNvbG9yLnlhbWwNCj4gaW5kZXggNjFkMDQwYTEwYzA4Li42MTYwNDM5Y2U0
ZDcgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY29sb3IueWFtbA0K
PiBAQCAtNDAsNiArNDAsNyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgICAgICAgICAtIG1lZGlh
dGVrLG10ODE4OC1kaXNwLWNvbG9yDQo+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTky
LWRpc3AtY29sb3INCj4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtZGlzcC1jb2xv
cg0KPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODM2NS1kaXNwLWNvbG9yDQo+ICAgICAg
ICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTczLWRpc3AtY29sb3INCj4gICAgcmVnOg0KPiAg
ICAgIG1heEl0ZW1zOiAxDQo+IA0KPiAtLSANCj4gMi4yNS4xDQo+IA0KPiANCg==

--__=_Part_Boundary_004_1564346928.866982274
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbGV4YW5kcmU6DQoNCk9uJiMzMjtUaHUs
JiMzMjsyMDI0LTA1LTIzJiMzMjthdCYjMzI7MTQ6NDkmIzMyOyswMjAwLCYjMzI7QWxleGFuZHJl
JiMzMjtNZXJnbmF0JiMzMjt3cm90ZToNCiZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4
dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGlj
ayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMy
O3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7
dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtEb2N1bWVudCYjMzI7dGhlJiMzMjtkaXNw
bGF5JiMzMjtDb2xvciYjMzI7b24mIzMyO01UODM2NSwmIzMyO3doaWNoJiMzMjtpcyYjMzI7Y29t
cGF0aWJsZQ0KJmd0OyYjMzI7d2l0aCYjMzI7dGhhdCYjMzI7b2YmIzMyO3RoZSYjMzI7TVQ4MTcz
Lg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNv
bSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBY2tlZC1ieTomIzMyO1JvYiYjMzI7SGVycmlu
ZyYjMzI7KEFybSkmIzMyOyZsdDtyb2JoQGtlcm5lbC5vcmcmZ3Q7DQomZ3Q7JiMzMjtSZXZpZXdl
ZC1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjtTaWduZWQt
b2ZmLWJ5OiYjMzI7QWxleGFuZHJlJiMzMjtNZXJnbmF0JiMzMjsmbHQ7YW1lcmduYXRAYmF5bGli
cmUuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwmIzMy
O3wmIzMyOzEmIzMyOysNCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMy
OzEmIzMyO2luc2VydGlvbigrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYj
MzI7YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxjb2xvci55YW1sJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwNCiZndDsmIzMyO2luZGV4JiMz
Mjs2MWQwNDBhMTBjMDguLjYxNjA0MzljZTRkNyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMy
O2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssY29sb3IueWFtbA0KJmd0OyYjMzI7KysrJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwNCiZndDsm
IzMyO0BAJiMzMjstNDAsNiYjMzI7KzQwLDcmIzMyO0BAJiMzMjtwcm9wZXJ0aWVzOg0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTg4LWRpc3AtY29sb3INCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5Mi1kaXNwLWNvbG9y
DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRpYXRlayxtdDgxOTUtZGlzcC1j
b2xvcg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRpYXRlayxtdDgzNjUtZGlzcC1j
b2xvcg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOy0mIzMyO2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4MTczLWRpc3AtY29sb3IN
CiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO3JlZzoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjttYXhJdGVtczomIzMyOzENCiZndDsmIzMyOw0KJmd0OyYjMzI7LS0mIzMyOw0KJmd0
OyYjMzI7Mi4yNS4xDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_1564346928.866982274--

