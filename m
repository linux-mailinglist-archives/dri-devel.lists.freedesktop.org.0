Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3B9082D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 06:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD50F10E0E6;
	Fri, 14 Jun 2024 04:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="dKP2lZiO";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="DgDhtnXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F69B10E0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 04:04:18 +0000 (UTC)
X-UUID: 2815e2d02a0311efa54bbfbb386b949c-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+J5W28DFR3UI0v7LT7dCqtK2IFVWi9FPCtm/lGGGY6w=; 
 b=dKP2lZiOYTiBvZ3FDS+h75P3YxEq69od4KfkOQmZeB6BuUo4nTGhTvklY0+ZvbR/tli6H0uGn3o94X3114s0Gf9N5aZNFw6zD3vMhItSAry/zQNqtfaIpqKTJj9MOSteZzk/B7bhSJCLUfo6GsZ/SdT/TYBFZOtFPPXe1w6xX7A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:2a62a07e-3e9f-47fd-be3b-d2b583a02f25, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:fad89288-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2815e2d02a0311efa54bbfbb386b949c-20240614
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1337449922; Fri, 14 Jun 2024 12:04:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 12:04:09 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 12:04:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca/kAhIKRsFc53UcfChugF9rYtJlduhvVvKk+7LVf02QPNiv/pbDglKg+3Pq9PWOyCbg8fEtlXzquiSxaSdHlw+I58sNe+Kh07xWJZdFIlq1fVCWFdr3K3Potlv92zN2gq/1aF4RakvSW7EDu/k+HJwURVd6BM6CoAU3ioUyQxD0PuCnCV1d3CREGRA1NJecoL3LCp/sAMfr18NPj0vccDoE7zjy0Gb3H0kI3jJgMUSmPja11ecPc0gY0DGq2ndjhJALfRJbNvTYD9BIXX7z/8fOUybR0PhNlJNG5ooyDuwXfnZ/sr8X3/Zngi6TDBtRSWjp2araRq+0bUVdzSYY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jrygxNZDuV/rDYVh2b1ebrh3QK+eyWZRC5XPSH17hM=;
 b=dbsPgjCeSCf0GQnSD/1bNnF58ZT3jU4epHh0U7n4WxaQ7zmdTnBp7ucKCAvSc+T1NGEP7nQeb0liSO+wzu4BhlAxdzMSjMwOH1ZEzXfLDevQZz7p5B+XzsZlPnPF9IJsWlxZonLObIUjSSoFXnfs+Y2WNqBBBz+7R9rnC3Kue1Kx8hDpEXx7vFUNDtgJ3OuWJ93KOiAAZHEljypdfppAnFRIZ8ZneWg0oWctq1vZ93shyCIOgmdd5JUcRx8lj7sl5WK3Lxkd6NZD1R5ct71htZ85J5oIji/SMFuGoRMMpozQTik3UE1FWHe/S6XbD1lQ3AaUxwIaNklNo0VsLA6vmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jrygxNZDuV/rDYVh2b1ebrh3QK+eyWZRC5XPSH17hM=;
 b=DgDhtnXEkW/GXUZhg1tXBKYigirZBeO73fvSI6jAYPswlTAPtlPZyEFqPOLx5HCyEAgUJ3KhWcSS4efzP4eZIHgAyy76yVDlAayIV2QfpM3IYIRHY2G9bgKHGoR1W1+YzyLoxEA5tmr/vxm+zYAiVTk4h4v+vjGQQ85o+WWeUvs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7321.apcprd03.prod.outlook.com (2603:1096:990:15::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 04:04:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 04:04:06 +0000
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
Subject: Re: [PATCH v9 11/21] drm/mediatek: Add new color format MACROs in OVL
Thread-Topic: [PATCH v9 11/21] drm/mediatek: Add new color format MACROs in OVL
Thread-Index: AQHavgUuj+0mHHGMPEqHUKc2N9/EGrHGo8IA
Date: Fri, 14 Jun 2024 04:04:06 +0000
Message-ID: <668da7e92dc61235e1c62ff8f047dc404aa88cd3.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
 <20240614024620.19011-12-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-12-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7321:EE_
x-ms-office365-filtering-correlation-id: 3bd5d6f8-149d-4804-0c51-08dc8c270915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230035|366011|376009|7416009|1800799019|38070700013; 
x-microsoft-antispam-message-info: =?utf-8?B?cW5YWnMxdVN0SSsrZjk2UWFxWWNkSDRsTk8rZjZCUDlPMjJCaC9hL1cwSjB1?=
 =?utf-8?B?elhSZUcvVkRiaUM3NGZJcUZhTHZmVFJETzVrdkpKelZwMXV4MTN6eHc0T0JY?=
 =?utf-8?B?MmVzQnJJTk1VRGZCQ1ZVQnRvNG1Mc1VHRmM2L2hmc2Y5Q2M4d3pBS3d3MXdW?=
 =?utf-8?B?UXdnS2lNN05JTXJBSWRzd2NMbkNsY0NSRktWTnF4dE9Kd3FML0ZJU3J5c0ds?=
 =?utf-8?B?bS9ibjk5NEQ4UklXb1hCQTZIYzZHRVJyV0RCMzl6WHdwRnlPZi9LUllBdlli?=
 =?utf-8?B?MklabGEzMEVvcDdTMTZveHV0cjRDVUxvaFBKb1BQbWM5eXF3VVVSVm40ckFF?=
 =?utf-8?B?MkVwRHdCKzdaRmJZNFdnYXFPeHJhOVFNMUhJM2RoUFNaUG8xS0lZa0dCekEw?=
 =?utf-8?B?MFptSEVReU9yaUg0WElnTGt6TVZVUnMwTVRNakFtdldtdDlyaGJtM28xRk4v?=
 =?utf-8?B?VDRiU3NnZ3RNK00wMmtwcHZTQjBrUXUwZksxRzFUS25IQnJ5M0ZJNTcvUXpF?=
 =?utf-8?B?TGRWaUFweEtHMDRGcUV5dkdtWlFFcXVXVW1OUVB3ZFRpb3JsWkNvZFMvVTMx?=
 =?utf-8?B?SVRHaEJRWU1JSVhGc3Y3QjB5Q0J4b0xrdEMxZjIrSksrMG1nbnhMbGh3SmlE?=
 =?utf-8?B?eENDcWVzTXJxdzNZNVRva2htKzNoazVIc3JLd2UrOWp5ZStUaVNjbXBqMEwx?=
 =?utf-8?B?MWNZQ215WDZEeng3MmRKYUNWaGdyRmcwNkJ1aUhnOEFXczFUTVpCV0VjUzFs?=
 =?utf-8?B?Y28xUmdrSzROZEJPcllwTlc5VnI5NDI4U3FFRWJoU3FtYWdUMjQzaHQ4bldW?=
 =?utf-8?B?eGFoMFluMTVCNnJ3SHVVUW80dWVXTGk0eGtpbzdqQjJqMlBxRmxRTjFMRFBQ?=
 =?utf-8?B?dXpZWjVIT3YyU1lyMXd2c2FER050aWlPVytuOHc5Z2JJTFUzN2s0WlNWQTFY?=
 =?utf-8?B?T29zcWV4VzNtdUlybnZONkh3S05ZVFRPVkQ3T2prNnErT1d4UDZyY1F1REhs?=
 =?utf-8?B?T3VOc0dIbUtTNTdENDdleVpVOEJ5emFsY092Yk5qeWRuMm5idUdvdVc2emFJ?=
 =?utf-8?B?U2tYUy95OXV6WlROOGptc1JKVitrWFRTRFYrekhnaEVUeXdWNlZvc2JDblZU?=
 =?utf-8?B?aldCT3l6RHNwbFdMKzJxMUZxZ1k0YW01cGlsSklBd0J5eGpNci9vMmFsMnhJ?=
 =?utf-8?B?UytUNlNPNWRQK0tFS0JxeHpTdm4yeXVhYmlwWG8rclJTdjN6Z0h2ZVpvMzlM?=
 =?utf-8?B?Nit5UHpJRmRvNjFyQ1d0TndyZ09RUDVURktISXl0Rlg2MEtnakFSL0s4M3lL?=
 =?utf-8?B?bXZnNExVMHRpUk10REorVEZRSEZwYzB1blYzTWozM1c4TDFJa2pRQ3dPRkV2?=
 =?utf-8?B?b3dlaXY1TElLdGFxcEZSZGtTL0NuRTFPb0tEKzVtVG40N2FiT2RLWGk3VmVR?=
 =?utf-8?B?dENxVjUvam0zamZwbXBSTDZnRzZ3Q0d2QUFNU0VlRE5QRk1uRVBTZXBBc2Jy?=
 =?utf-8?B?NkJjR1BZdW9DaDJHZE5LZ1c0WjVHa3JDQUo2eTFzNE1Iblo2NktsWXpGb2x3?=
 =?utf-8?B?WnprcCtyQXYrenhwTTU5eUJSS2x5SDFoelZ5ZGkxL2NMMUtxY2Ivb0RrYTQ1?=
 =?utf-8?B?ekEwakZMR0V5czFyK3dXTW9yY3hENW04RVhXMDYwbjVuclBkQm5SQUUzZk14?=
 =?utf-8?B?QWZBTXYwSTVmRXJ1YW5NMW1mN3BFbURncC80WDVPQWpKdmpzQmppMmwwTTRt?=
 =?utf-8?B?ZmNocjY0cXFmWFFFMHdtbmNXWTgwcU5XbDZvb2kxTytSR2FTZnB3WEdNMTA1?=
 =?utf-8?Q?dzHT1DmVf9XVMttxk23b27OIZ3BrbGu9vkI0w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(366011)(376009)(7416009)(1800799019)(38070700013); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3hkRnlXUzd4bFhib09JTmM1UGFidldvbXNrTktkYU10Y1hRY2FpOWJ3NUV0?=
 =?utf-8?B?Y3Q3QTc5N0x2V3hlUmMyaW93QzRod2dKUkpxUVNkdE9jZWlFdFNsSnVOYk95?=
 =?utf-8?B?K2paSGNSNmlqd3h0R1djODUwY0RZaml4WWRrdGRQMWNsaFBQc0ZXU1VPM3dr?=
 =?utf-8?B?VHRrb3RBSHBZK04wcUdhMVZvTVNlTTYyTno4QnQxLzBhaFpyVi9VSWIyVDlo?=
 =?utf-8?B?ZzJSU2hqQnd2bThaVkpXV0JUNk5PS0xMT3cwR0FQc1loS3J5OHdBcWlsbzlD?=
 =?utf-8?B?WnR5aVJFQ2djZ2xjSG1sWFZLOVdBZmU4Zyt6QnRweGtZZUVDeFNzUFZkT0Fr?=
 =?utf-8?B?NFNTWkE5MU9ZVEFqbXhSYVNCU1ZxRDBmb3BvM0tzUTUwdlY1VWV5a2RRbjd2?=
 =?utf-8?B?b3Z4Smh0aGhCdElMaHJCcEg0a01yUCtuelRaUUcrMXZCdEhwMWFOb2RITnF5?=
 =?utf-8?B?eUduK2IwRlcrYUd0Q0NXaEhpbWZxWjhJQjdQUG5NNDlNQ0kwaURKcW12RTNh?=
 =?utf-8?B?U1hZNlRmVmxiR2VrNTFQMkpGS2MwZko0WFdtbW53d2FxV2hpVlNxYTlEZHY5?=
 =?utf-8?B?S3VrcnI1Sy9EazRZSzlzczJlR0lkS2ZjNUFMclQwVEsyYjQ3SWR4SlZJRjVM?=
 =?utf-8?B?RllBdXkwaVZEQWhMbGh6WXVtSVBhTkw0dnI0YXJ3bXVSY1NlazEzMmJFd2Rt?=
 =?utf-8?B?RWNUTXo0S1JWM3MyYWs4b3AxNG11SEx1c25vQXhSOEdBS1hwSjUyVEI4Y0hK?=
 =?utf-8?B?RGlKSVdKcWZVWmJQUWlxV0l5d1JueE5EYytQVXhhMUlnT3cvRVViWEFYOEVk?=
 =?utf-8?B?dG1BWEE0UWxnT2FxV0hnWXVhMklZZW9xWk85aHIyaW1SMllBeFNTQVRENnFj?=
 =?utf-8?B?dDgvWXhLa3dJZGViZXM3b1c5Ym9IbUNBNm5jVXk4amQwLzZEUVBiWWNqeWdR?=
 =?utf-8?B?L0JqbmxVdTdHUTlmdVNlMG1xM2tFVUFQZzF6bTNrdUdCakVsYTA5RXpPMTNR?=
 =?utf-8?B?WlpxNG5kTTBwM01XWnl6aDNBN1l0b0lWY1JYbWdFUVVtNFdYWEZQMWN2VFlU?=
 =?utf-8?B?WFU1TFo3MzlzV0RxclZpODJWWUZWY3VqTVZOYlVKR2tyWjVpaUlveHQxYklw?=
 =?utf-8?B?K24yMzIvTmx5M2RIdWJrckZhcTJTY3lvZFpCeGl4WXRYY0o0Y2lpNno0b2xa?=
 =?utf-8?B?SXQ0OG5zYlgxREhJOEhsS3Rsd2tXL1RGV05BQ2RNaytsQzRsdUtaVlZGMlZp?=
 =?utf-8?B?dlFsdWV1N2I1ZHVlVFlDRGphOUtuczRFSVdxaXp1OFlJUUlRSE1NSXZXb3lE?=
 =?utf-8?B?bTI2a0F4Rmd2M0FXY1NieGJMcGVyK2NHK1BCYUJVMDNTSU92QUdRQkJwK25O?=
 =?utf-8?B?QnBveWpBY29xZnZJZHVua04zWFlhcHBTNXYxMWNHa1pXajRBb3JEbW1udG9t?=
 =?utf-8?B?alFnLzN0MW1PZ2hNQlJSSkVibnpaeUhjRHlVaW1EYXNkYUNsWjBkUkRBdWQ2?=
 =?utf-8?B?SnEzV3p0TjFVcGVlcG95QlR6V1dEbjZQWHpxY2RCUFZEL2ltaktBdEFHNGd5?=
 =?utf-8?B?M2w3QkJUT1BIaTM2SC9mQjUrckx6RVVOK0U4aUsrcS9heTAyR0pCQ1NoL0tp?=
 =?utf-8?B?ZHpEdEFINUxEMDFBQWxnR3o3SThRTFRCT1ErK05RMjhxSVVpN0NBOG5PR3JR?=
 =?utf-8?B?bDE4OVppbjNJRS9aMGd3MGsxLzd3cjR6ZE5FUHZOWUhwRGpwcUtNWklIODgz?=
 =?utf-8?B?N2c0QlFVY2pJQnZCMEtaNGN0bnFGTW43elAxRFNZV2wwRWRPczlYMEJUTzRp?=
 =?utf-8?B?MmpDcTN0aXRrUVBlMmFHVm1DSUN5c3Z2S0lGcXVvZmxaR2V2clIzT0cvWUZp?=
 =?utf-8?B?MDBiMkh1WDJ5eW5JU3I0anIwNDJVcWtHWGYzWEtYbkd1ekV4QXN3VGxwT21M?=
 =?utf-8?B?QzJQSXhPOUk2TmZtcGFaaDFaaVFjMnd3SFRzS3pSZWRHM3Ava1hnSVQ1Q2Nt?=
 =?utf-8?B?b1FZUWtHZlVWcE1INStwdXFNWDhHcmRHb25nMi85VjgzR0ZsOXF4V0pYK1Ar?=
 =?utf-8?B?eVRYd3hkM1JFTnhNbzlTbnFYeVp1L0MxcXZZRldQUHdsY1F0YmFMYlRuYmFr?=
 =?utf-8?Q?FrRNZQpZb4DDkjSjAjPIvHuAf?=
Content-ID: <92CAAACB6265CF4E81B536DFBA2FAC02@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd5d6f8-149d-4804-0c51-08dc8c270915
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 04:04:06.3583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WyExzdMD393G9vgyqvd9qegaqMsepZnL0uALkl2ZfMyURQiCVytnQCwRJ9gmy9pLNmrW3gS4bIofLJ/aXGDlMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7321
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.877100-8.000000
X-TMASE-MatchedRID: +c13yJDs900OwH4pD14DsPHkpkyUphL9X4GSJGyYc35nnK6mXN72mznu
 QWM5MjklRx8/53BUs9XsYarUKo3OhGxAn1neOk9NY1bQMCMvmn4RvEpVd3vS1d9RlPzeVuQQrWv
 A11V1iKnBEdhLue3lb5abJvpC2GSsQv21zJNl0CyDGx/OQ1GV8rHlqZYrZqdI+gtHj7OwNO14uF
 xKD13nMatl+XFyL7zvVjHapItG8NXEWfICz+YCQ2KJ/uGgPaw7
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.877100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 01106315B91B6906F4AF3AD7A2642E242113D0A051C531684BC52B9AC747FF702000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1926632190.1566112240"
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

--__=_Part_Boundary_005_1926632190.1566112240
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gRGVmaW5lIG5ldyBjb2xvciBmb3JtYXRzIHRvIGhpZGUgdGhlIGJpdCBvcGVy
YXRpb24gaW4gdGhlIE1BQ1JPcyB0byBtYWtlDQo+IHRoZSBzd2l0Y2ggc3RhdGVtZW50IG1vcmUg
Y29uY2lzZS4NCj4gQ2hhbmdlIHRoZSBNQUNST3MgdG8gYWxpZ24gdGhlIG5hbWluZyBydWxlIGlu
IERSTS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDE0
ICsrKysrKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0K
PiBpbmRleCBmZDM5MGZiODNkMGUuLjE5MjNiYmQ5NjAxNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBAQCAtNTUsOCArNTUsMTAgQEANCj4gICNkZWZp
bmUgT1ZMX0NPTl9CWVRFX1NXQVAJQklUKDI0KQ0KPiAgI2RlZmluZSBPVkxfQ09OX01UWF9ZVVZf
VE9fUkdCCSg2IDw8IDE2KQ0KPiAgI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9SR0IJKDEgPDwgMTIp
DQo+IC0jZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1JHQkE4ODg4CSgyIDw8IDEyKQ0KPiAtI2RlZmlu
ZSBPVkxfQ09OX0NMUkZNVF9BUkdCODg4OAkoMyA8PCAxMikNCj4gKyNkZWZpbmUgT1ZMX0NPTl9D
TFJGTVRfQVJHQjg4ODgJKDIgPDwgMTIpDQo+ICsjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1JHQkE4
ODg4CSgzIDw8IDEyKQ0KPiArI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9BQkdSODg4OAkoT1ZMX0NP
Tl9DTFJGTVRfUkdCQTg4ODggfCBPVkxfQ09OX0JZVEVfU1dBUCkNCj4gKyNkZWZpbmUgT1ZMX0NP
Tl9DTFJGTVRfQkdSQTg4ODgJKE9WTF9DT05fQ0xSRk1UX0FSR0I4ODg4IHwgT1ZMX0NPTl9CWVRF
X1NXQVApDQo+ICAjZGVmaW5lIE9WTF9DT05fQ0xSRk1UX1VZVlkJKDQgPDwgMTIpDQo+ICAjZGVm
aW5lIE9WTF9DT05fQ0xSRk1UX1lVWVYJKDUgPDwgMTIpDQo+ICAjZGVmaW5lIE9WTF9DT05fQ0xS
Rk1UX1JHQjU2NShvdmwpCSgob3ZsKS0+ZGF0YS0+Zm10X3JnYjU2NV9pc18wID8gXA0KPiBAQCAt
MzkzLDIyICszOTUsMjIgQEAgc3RhdGljIHVuc2lnbmVkIGludCBvdmxfZm10X2NvbnZlcnQoc3Ry
dWN0IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25lZCBpbnQgZm10KQ0KPiAgCWNhc2UgRFJNX0ZP
Uk1BVF9SR0JBODg4ODoNCj4gIAljYXNlIERSTV9GT1JNQVRfUkdCWDEwMTAxMDI6DQo+ICAJY2Fz
ZSBEUk1fRk9STUFUX1JHQkExMDEwMTAyOg0KPiAtCQlyZXR1cm4gT1ZMX0NPTl9DTFJGTVRfQVJH
Qjg4ODg7DQo+ICsJCXJldHVybiBPVkxfQ09OX0NMUkZNVF9SR0JBODg4ODsNCj4gIAljYXNlIERS
TV9GT1JNQVRfQkdSWDg4ODg6DQo+ICAJY2FzZSBEUk1fRk9STUFUX0JHUkE4ODg4Og0KPiAgCWNh
c2UgRFJNX0ZPUk1BVF9CR1JYMTAxMDEwMjoNCj4gIAljYXNlIERSTV9GT1JNQVRfQkdSQTEwMTAx
MDI6DQo+IC0JCXJldHVybiBPVkxfQ09OX0NMUkZNVF9BUkdCODg4OCB8IE9WTF9DT05fQllURV9T
V0FQOw0KPiArCQlyZXR1cm4gT1ZMX0NPTl9DTFJGTVRfQkdSQTg4ODg7DQo+ICAJY2FzZSBEUk1f
Rk9STUFUX1hSR0I4ODg4Og0KPiAgCWNhc2UgRFJNX0ZPUk1BVF9BUkdCODg4ODoNCj4gIAljYXNl
IERSTV9GT1JNQVRfWFJHQjIxMDEwMTA6DQo+ICAJY2FzZSBEUk1fRk9STUFUX0FSR0IyMTAxMDEw
Og0KPiAtCQlyZXR1cm4gT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODg7DQo+ICsJCXJldHVybiBPVkxf
Q09OX0NMUkZNVF9BUkdCODg4ODsNCj4gIAljYXNlIERSTV9GT1JNQVRfWEJHUjg4ODg6DQo+ICAJ
Y2FzZSBEUk1fRk9STUFUX0FCR1I4ODg4Og0KPiAgCWNhc2UgRFJNX0ZPUk1BVF9YQkdSMjEwMTAx
MDoNCj4gIAljYXNlIERSTV9GT1JNQVRfQUJHUjIxMDEwMTA6DQo+IC0JCXJldHVybiBPVkxfQ09O
X0NMUkZNVF9SR0JBODg4OCB8IE9WTF9DT05fQllURV9TV0FQOw0KPiArCQlyZXR1cm4gT1ZMX0NP
Tl9DTFJGTVRfQUJHUjg4ODg7DQo+ICAJY2FzZSBEUk1fRk9STUFUX1VZVlk6DQo+ICAJCXJldHVy
biBPVkxfQ09OX0NMUkZNVF9VWVZZIHwgT1ZMX0NPTl9NVFhfWVVWX1RPX1JHQjsNCj4gIAljYXNl
IERSTV9GT1JNQVRfWVVZVjoNCg==

--__=_Part_Boundary_005_1926632190.1566112240
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMTQmIzMyO2F0JiMzMjsxMDo0NiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O0RlZmluZSYjMzI7bmV3JiMzMjtjb2xvciYjMzI7Zm9ybWF0cyYjMzI7dG8mIzMyO2hpZGUmIzMy
O3RoZSYjMzI7Yml0JiMzMjtvcGVyYXRpb24mIzMyO2luJiMzMjt0aGUmIzMyO01BQ1JPcyYjMzI7
dG8mIzMyO21ha2UNCiZndDsmIzMyO3RoZSYjMzI7c3dpdGNoJiMzMjtzdGF0ZW1lbnQmIzMyO21v
cmUmIzMyO2NvbmNpc2UuDQomZ3Q7JiMzMjtDaGFuZ2UmIzMyO3RoZSYjMzI7TUFDUk9zJiMzMjt0
byYjMzI7YWxpZ24mIzMyO3RoZSYjMzI7bmFtaW5nJiMzMjtydWxlJiMzMjtpbiYjMzI7RFJNLg0K
DQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZn
dDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0No
aWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMz
MjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jJiMzMjt8JiMzMjsxNCYjMzI7KysrKysrKystLS0tLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7
ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzgmIzMyO2luc2VydGlvbnMoKyksJiMzMjs2JiMzMjtkZWxl
dGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2ZkMzkwZmI4M2QwZS4u
MTkyM2JiZDk2MDE0JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyO0BAJiMzMjstNTUsOCYjMzI7
KzU1LDEwJiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0JZVEVfU1dB
UEJJVCgyNCkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7T1ZMX0NPTl9NVFhfWVVWX1RPX1JH
Qig2JiMzMjsmbHQ7Jmx0OyYjMzI7MTYpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO09WTF9D
T05fQ0xSRk1UX1JHQigxJiMzMjsmbHQ7Jmx0OyYjMzI7MTIpDQomZ3Q7JiMzMjstI2RlZmluZSYj
MzI7T1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODgoMiYjMzI7Jmx0OyZsdDsmIzMyOzEyKQ0KJmd0OyYj
MzI7LSNkZWZpbmUmIzMyO09WTF9DT05fQ0xSRk1UX0FSR0I4ODg4KDMmIzMyOyZsdDsmbHQ7JiMz
MjsxMikNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9BUkdCODg4OCgyJiMz
MjsmbHQ7Jmx0OyYjMzI7MTIpDQomZ3Q7JiMzMjsrI2RlZmluZSYjMzI7T1ZMX0NPTl9DTFJGTVRf
UkdCQTg4ODgoMyYjMzI7Jmx0OyZsdDsmIzMyOzEyKQ0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO09W
TF9DT05fQ0xSRk1UX0FCR1I4ODg4KE9WTF9DT05fQ0xSRk1UX1JHQkE4ODg4JiMzMjt8JiMzMjtP
VkxfQ09OX0JZVEVfU1dBUCkNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9C
R1JBODg4OChPVkxfQ09OX0NMUkZNVF9BUkdCODg4OCYjMzI7fCYjMzI7T1ZMX0NPTl9CWVRFX1NX
QVApDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO09WTF9DT05fQ0xSRk1UX1VZVlkoNCYjMzI7
Jmx0OyZsdDsmIzMyOzEyKQ0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZN
VF9ZVVlWKDUmIzMyOyZsdDsmbHQ7JiMzMjsxMikNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7
T1ZMX0NPTl9DTFJGTVRfUkdCNTY1KG92bCkoKG92bCktJmd0O2RhdGEtJmd0O2ZtdF9yZ2I1NjVf
aXNfMCYjMzI7JiM2MzsmIzMyOyYjOTI7DQomZ3Q7JiMzMjtAQCYjMzI7LTM5MywyMiYjMzI7KzM5
NSwyMiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7b3ZsX2ZtdF9j
b252ZXJ0KHN0cnVjdCYjMzI7bXRrX2Rpc3Bfb3ZsJiMzMjsqb3ZsLCYjMzI7dW5zaWduZWQmIzMy
O2ludCYjMzI7Zm10KQ0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX1JHQkE4ODg4
Og0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX1JHQlgxMDEwMTAyOg0KJmd0OyYj
MzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX1JHQkExMDEwMTAyOg0KJmd0OyYjMzI7LXJldHVy
biYjMzI7T1ZMX0NPTl9DTFJGTVRfQVJHQjg4ODg7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtPVkxf
Q09OX0NMUkZNVF9SR0JBODg4ODsNCiZndDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZPUk1BVF9C
R1JYODg4ODoNCiZndDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZPUk1BVF9CR1JBODg4ODoNCiZn
dDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZPUk1BVF9CR1JYMTAxMDEwMjoNCiZndDsmIzMyOyYj
MzI7Y2FzZSYjMzI7RFJNX0ZPUk1BVF9CR1JBMTAxMDEwMjoNCiZndDsmIzMyOy1yZXR1cm4mIzMy
O09WTF9DT05fQ0xSRk1UX0FSR0I4ODg4JiMzMjt8JiMzMjtPVkxfQ09OX0JZVEVfU1dBUDsNCiZn
dDsmIzMyOytyZXR1cm4mIzMyO09WTF9DT05fQ0xSRk1UX0JHUkE4ODg4Ow0KJmd0OyYjMzI7JiMz
MjtjYXNlJiMzMjtEUk1fRk9STUFUX1hSR0I4ODg4Og0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtE
Uk1fRk9STUFUX0FSR0I4ODg4Og0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX1hS
R0IyMTAxMDEwOg0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX0FSR0IyMTAxMDEw
Og0KJmd0OyYjMzI7LXJldHVybiYjMzI7T1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODg7DQomZ3Q7JiMz
MjsrcmV0dXJuJiMzMjtPVkxfQ09OX0NMUkZNVF9BUkdCODg4ODsNCiZndDsmIzMyOyYjMzI7Y2Fz
ZSYjMzI7RFJNX0ZPUk1BVF9YQkdSODg4ODoNCiZndDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZP
Uk1BVF9BQkdSODg4ODoNCiZndDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZPUk1BVF9YQkdSMjEw
MTAxMDoNCiZndDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZPUk1BVF9BQkdSMjEwMTAxMDoNCiZn
dDsmIzMyOy1yZXR1cm4mIzMyO09WTF9DT05fQ0xSRk1UX1JHQkE4ODg4JiMzMjt8JiMzMjtPVkxf
Q09OX0JZVEVfU1dBUDsNCiZndDsmIzMyOytyZXR1cm4mIzMyO09WTF9DT05fQ0xSRk1UX0FCR1I4
ODg4Ow0KJmd0OyYjMzI7JiMzMjtjYXNlJiMzMjtEUk1fRk9STUFUX1VZVlk6DQomZ3Q7JiMzMjsm
IzMyO3JldHVybiYjMzI7T1ZMX0NPTl9DTFJGTVRfVVlWWSYjMzI7fCYjMzI7T1ZMX0NPTl9NVFhf
WVVWX1RPX1JHQjsNCiZndDsmIzMyOyYjMzI7Y2FzZSYjMzI7RFJNX0ZPUk1BVF9ZVVlWOg0KDQo8
L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+Kioq
KioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioq
KioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1
bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25s
eSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24s
IA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGll
bnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2
ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFp
bCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2Ug
dGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91
IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_1926632190.1566112240--

