Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A29AF6D6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 03:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD25710E274;
	Fri, 25 Oct 2024 01:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YQwktxjJ";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jE5gUeOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3043D10E274
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 01:32:47 +0000 (UTC)
X-UUID: 065b0a86927111efb88477ffae1fc7a5-20241025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=rT86GuoroGtIo4RnxC0zKifziyM7wVF99B8NeURMrW8=; 
 b=YQwktxjJxM9EdNgoW6CzkX6gieA/6qZVK+iOQnEvKrSkSvqUQP5U7f0zv1EN4913Bb3QizR071l275wbQbU+j5YVgUFPOQz9nIR1ULpuQcZCpdXORDs7NZICidhQdG+Vm8kgxbdLkmb+HxE7tigiJ7I9+IO23mRA232+okuNdCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:5c8ef4eb-97ea-49e0-9a32-127ee140e1d6, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:b0fcdc3, CLOUDID:3a21d4cc-110e-4f79-849e-58237df93e70,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 065b0a86927111efb88477ffae1fc7a5-20241025
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 235981387; Fri, 25 Oct 2024 09:32:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 09:32:39 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 09:32:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSsplYsDbwW+ff0nRIB+5RZ4xbrbZDOefFq+T2c64f/S/x/dds0fRq0Ij+Fs4Hl6dRoIJHElN9AE/uImJqmIR0EEP61cwNIuZOyQWJa12fgDeICK7azs3hzqLXJHhsNbaTHhpUONbxP56lim1Y0FcuY0SbwvbgZ71KjN7mICwWPrpK1B1A2xuTR2rGO6EdMc/Q5AI/i8K1Xrcc5vtJ+0ScKd/HBYWNQTvZaY4y0LiDCpoqsdJgkMZyYkbl3Nj6P3fXEDd1bnyPigkIjUgkR8Fp7GXhA1MeRMskEEI+6z0VKH/lm7MTWBAvEp2DgtFq3MeWwEBveJWIzVmxdYHbBNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6oLxTZorx7qbehkUavYggVPaNG7Y/6pk4tK4RfMeaU=;
 b=AmSXG5LrCbpXJZOyUJEuM9h4i3weL0ms8qJkmVzAtI1p1yY4ATFZ1pEQyK6wjVqXrDLrxNIqQhJY6pt0WpodyiCfXHyQRCutK6h52kA5vwA8+f6a4BiZAaGfrMoZZwXTZIdWKW2ad3t4JAGEKmLD3JcN5ZLkK9yStlxPRZVEHjVZk+yroii8qGTSLWLmB+P/FKT1+b/NmaRzTzJZ88qoSAf7AuCWe62g8MZ50HaLiz1/cz9XMMzgkyD5VU+n7IOJRoCPJzgz/JLmlmVM0ADjFm/eq+8O9HtoQe1zIz9au/XarU7f8uVIMZNz3K6tV8sd6sn8IM3U9911tcFNKIAAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6oLxTZorx7qbehkUavYggVPaNG7Y/6pk4tK4RfMeaU=;
 b=jE5gUeOYIsgKxKwrdAVqsAbp5p/W7YJZdME1X94p8ZEKT4wHwgh2k5nR7dm52sEE6aRqgiKLwAQ+bZPUCnTNFrxoie6ZSmz67TEc7XzNCBpfkac874msYGWH5CFIyLxxB3X4lbw9axBTLrN1m/yv/hfCnkJNTIE7vVRenCX454Y=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB7668.apcprd03.prod.outlook.com (2603:1096:400:41a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Fri, 25 Oct
 2024 01:32:37 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 01:32:37 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "dianders@chromium.org" <dianders@chromium.org>
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?=
 <Bibby.Hsieh@mediatek.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "djkurtz@chromium.org" <djkurtz@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 =?utf-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "littlecvr@chromium.org"
 <littlecvr@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 08/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation
 property
Thread-Topic: [PATCH v3 08/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation
 property
Thread-Index: AQHbJlcM+XgY83PS/UONQZcY0r8SzrKWrtwA
Date: Fri, 25 Oct 2024 01:32:37 +0000
Message-ID: <b75276ff8dc2f73818ccd132530c0d3825e17888.camel@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
 <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB7668:EE_
x-ms-office365-filtering-correlation-id: b920cf94-8586-4aa3-b3a9-08dcf494e87d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bTFOSnhXLzVEc2oyMmZoWTFlNS85TXhVRzVhaDd6Ynp2QWNSS1dCWkhraDVH?=
 =?utf-8?B?K1RmSjY2enNqdEtTSDlrS2h6Y1FHcXpIVWlVRXR4eWhoRk53MExkTHljSWVk?=
 =?utf-8?B?a3lZdzFOQWNyZzNaUVU4TkF6TkpEa2Z2akRVcmI0SElKeUVGRVJ3ZjBFYnpr?=
 =?utf-8?B?bVcxT3FQREw5aHM5UFQwUllLMGFkbnBCNzlhYkxJSWgwOVpFKytUbnpaaElV?=
 =?utf-8?B?Y2hwYVhKZmkzb0phUHhiWURGQXVVRGFCNWlPdlk1NWFuNHZlVitaQ1VZMmU5?=
 =?utf-8?B?OGxPdy81NHk3czdZNCtkWFlsVUhrSXhpcTR4Q1BoRGV3cFB5Z0w5Y2ZUdEIx?=
 =?utf-8?B?ZWx2Rmd2bGo2aklyZks1YnIwa2YyYURtYkZ0SlVXME5yQkpsME9DN0NUbGFU?=
 =?utf-8?B?dXNTQnNwQmdtbU92Nmlnei9xME8yR1lnVzJDQmtaaXloSFNCQmlVT0pEeU4x?=
 =?utf-8?B?YllYbUIvK2s0Mm9TUHZjeFhoRE9kR0RHMXdLd285THA3UlVTQ0NwZkFITjdB?=
 =?utf-8?B?K2M0U2VISThWTGE3di80NW11Tm44OTd4SHRJalJUalRQQmV2Zjl1dHV1b0VB?=
 =?utf-8?B?bUN1K2ZxVFlYZjRkYzZnWlVZeHVicGt4UGRyVjkyUm8xcmlQR05qd2REMGg5?=
 =?utf-8?B?eTZTOVFTMkNXUHdjQXVYdnJod3N5ME5lWHNkaENkUkZHVWdiYTcvV0toQW9u?=
 =?utf-8?B?UVBlVSs3OVdFYjQ4UlNLYXhIMzVjdzR0RExiZ1ljMmlmQVVMazVPdTRHdy9N?=
 =?utf-8?B?U0RGWFAxUzJQOVZ5L0lmV01CeW52ZHgrZmt4TDJWd0c4UStuR0J4dmtkbWNo?=
 =?utf-8?B?QlJoK25uREQ2cVZrdHZBVy94dUZjcS82YXh2T2hvODdhMGZkcjF0SFpWeHVC?=
 =?utf-8?B?dkY3bjZMMi9jRjB0djJRU0hraVp4Nm9iVHNtWG10Qm9xV2s4S21ESjVsRnZE?=
 =?utf-8?B?M21Da05vT2JuSHljNEpKQUZDUzUvbm5lN1MyZmFlakk3b1FuaDBCUXBIbmpr?=
 =?utf-8?B?VmhON2psVWtONDFQL09TYmNJaWlIUmlsVjRoc0dNYThQSmRTVk5xU09aUm1j?=
 =?utf-8?B?ajViS2xsTXdBbTVnOEZBdWN6cll5L1o3cTlLOGRwU2tEemJrMDhXdDZ5YlI1?=
 =?utf-8?B?bkxNSThWaUp2R1ZqbC9nSm1ZUXo5Y3p6S0oyQ2dRWWpZK2lHRGMyQUwvN2hj?=
 =?utf-8?B?NFlwdy9qQ3NDZ09PcGllaUZDaWVkbTdzanFTbDdwZ3p5eEMyWkZQKzNva01m?=
 =?utf-8?B?a0xzRk81N1I2MWFybThHaldZSjBWTWVGdHdTMXhvWVI3TDJBYzY2cTc3M0Y3?=
 =?utf-8?B?VkFqTTJSemhBSGJPY1BiSkZtNjkwRkVvai81T0tUNTZ1dmE1UUdnSktrYyt2?=
 =?utf-8?B?RXV3czY4SWx6eFFKUlE1SjRnRitWQnNzUkZsQkN0N0MwYktnY1JzcDJFU3dy?=
 =?utf-8?B?dEh6NHlQcFAwUXpFVGVwTVZXNGUxeWpTUU9FMU02cGhlK0JBaXFZckl0ZkRV?=
 =?utf-8?B?ZW1pV3ZNVlpaVExhSGdjcm0vZFZpRENISUJHdTIyYVJRaXIwamVyVUxCODdn?=
 =?utf-8?B?UjZ4V1Mzc0VOcS9WeTdZcWsxK2NscHRoM1VGeGZraGNLN01QaENGcm15NHow?=
 =?utf-8?B?UmNQcURGKzh3L0xCcmtocWY0ZHlZTEw1NnA4cERNVGdHZTQ3UWJOSjNOQ2Q3?=
 =?utf-8?B?eUJDMGZqcnYxRzVGVkdjNkY5R1h0UTR6RjliWU11NnNkRktiNDZIbmxxWC90?=
 =?utf-8?Q?6coZy4Sv7dbHcR54nqup+sGLKwJcO6pkqwdGXPN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0Z4T1EzaGhTdStFdThSUVFNRTVETHdjeHFmSlhRT05JVFZ1UWhCWTRvZUls?=
 =?utf-8?B?NGFvc0dXTGpaYTYyZGRiTDZ3bnBWTFF6dXU1ZUsyQ2JzVXVJaFd1dHFnZVdT?=
 =?utf-8?B?ZE5VUU9sdDFkWDFwUzB4V2dtdVBPWHY4REpLU3B2U0RPUFhzNGE1bC84OUV3?=
 =?utf-8?B?anFWUldrSHBGRkZ4U2cyWDhzS3NrZXhmY0dSZ0xEK1ZoMTBkWmlmNGpxNElm?=
 =?utf-8?B?OWc4VXB2QzgxWmk1NUMvajdTSWw3bjEzcWVLQllSYytYM1lRWTB4TnBmNWd5?=
 =?utf-8?B?cmRQTWUyQ0hORHFXQmxoQTFCK1BGR3l6RkxDYzUyOFlNQ0UxL2h3OGhvQVZq?=
 =?utf-8?B?U0QzRXpsdTBtNEVoNkpzdVFvK2pDK1hWWk00aHVCMGpaWEJuMmZSSUJxZlpO?=
 =?utf-8?B?alpYc0N5aDZCYTJLd1F0OGJMN2hHaWxYVEc2MVBDYmYxYXV3SjhuYUVHSTJj?=
 =?utf-8?B?M3ZHVG16eW5HZk5yR3ZJSVZKT2lWUVJCSnBVNlNiS25qVWJMazFQSCtiSHhy?=
 =?utf-8?B?aFEzUXhBY3lWbGlKVXhSYTBla0crTHFtYVZtbFJrc0JJcG1vZTBlT0diVWtT?=
 =?utf-8?B?MStyNXRFUlpFWTduUlJDKytHVGkreU4wVXdqOXJrQlNUTmRRU1k5M0RUM1Vv?=
 =?utf-8?B?a2FHZUhWMGd1aWFhZ3RZSjJ3MlM2dUpKYjZRb0x5S0k1Z0tzL0JkdHlyWGhy?=
 =?utf-8?B?SVZpZUQ2eHdjWVcwUDdXcEt3R1FhVVA2UmM1aVk3MTQ1S0FQQ3dSQ0JxYXk2?=
 =?utf-8?B?ZzgxR3dQZkZ6V1RqVmg0Vldlc0lacllPcmhRVmZMWVNpSHZJUHhzK0FidUZm?=
 =?utf-8?B?YnltN20rVVh5azU0eHZNVXdRVTJsTUZ5MzJSaVdqUUh1c001OTBOLzZMNnNX?=
 =?utf-8?B?b3FDK21iQ3kvb0ErbGpRS0hjcFdqQ2ZyQk0xOFV4UGJCMW9VRWtLZEhTMlBQ?=
 =?utf-8?B?TDRIdU05YWUxdG9XRnpZbFBZN1piYlJHblpycGM3TnE3OEk1TDhua2plZ3RX?=
 =?utf-8?B?c0dDTHBxZ0NuNEhRVnlQcnphRDcwRWVGTXhaamlFUkpLMTNuOXFscWZvRzRG?=
 =?utf-8?B?TmVmRkNJblN6MVVYc3M2T1YzTUovQUtoampCaE9qUk1YUVB4RHJQd0Z0UjRT?=
 =?utf-8?B?UFRTMG1oWDQzVjZIaUJRQlBFREhPakg1dXJ1RkM1aWt6QzBzYjEzMnV3RnJ2?=
 =?utf-8?B?UG05UDBWL2hvUVFMUEZ6WGxMdnlUVXp4dmduSDNiYzcyZmprRS92VWNMakkw?=
 =?utf-8?B?MEVvNmxOeG53RktMRUFleHErN2xZN09lZUNWdjVyVHRLbzVpQ3E5VENjZFY3?=
 =?utf-8?B?ODhtdm9FL0J6c3hQU0FFMXJNOUNvWkowdjJCTzJJTks4YW9wWFg0UCtPVEVV?=
 =?utf-8?B?blFFU1dBNmNLU3ZjRjh4MWl5VzMrVXdTclhzOUVRUjlzaFlSYXh1RG02Qm1r?=
 =?utf-8?B?aHVuMzNHQk9XTkwvRjBTZVgwRzdiYWd1Mkk1WWkzd3pIZDg3WjJpS0p3eWhB?=
 =?utf-8?B?ZU9qWEJSanlNZnVGZTVTaVpqak5ONUFid3NweGh2ZVd3b3ZhTEt6Vk5OeUxM?=
 =?utf-8?B?VkpxRG5tSGVSaGJId3h1MmdIa29KaVcrVGZjUEowYmFwcm1xT0hxL2dyalRE?=
 =?utf-8?B?VTdJVi9FZlhlZkdFQjdLanJFaVVsSXg0VXFyL0ZjU0t4b0ptUHpNUTVBZHhx?=
 =?utf-8?B?K05Wb0J2V0FnMjBVUmYyK3ZEVnJ4cUhVTnd1Ni84YVFKdFZvNWROaUhKQTNL?=
 =?utf-8?B?ZGZDL05ndkFGMUFtbW94bkRhMU12TzQ0Wkpjekt5RWJnNk1XTmx6SjZTdEVi?=
 =?utf-8?B?Q1l1bEpiWUE2RzZWb2FRSU9yVzFqTFdYMFh3Sy80R0FRVFJTRUF3Q3ZaTHox?=
 =?utf-8?B?TEFaRnV0anEzbUtFWGoxbGZoR3FjV1NlOEhMUU1GTlJkQTZLdlE3UFZpQXdz?=
 =?utf-8?B?ZUVxOXZKcGp0QkhVWE8wVWY3WTlSQ01hdDRsY09UYUNyL2RJcXlQdDNxczE5?=
 =?utf-8?B?Z2tNTjh4K001cUlBWEkyNnhRZ2IxKzNYSXprZXpVc0NPNzloTGtid0h6V210?=
 =?utf-8?B?c0lST1kxYlYwc3RReHZJYm5mTjU1b0dLV2NrY2tPREtxMk1iT1JZMjNBTHAx?=
 =?utf-8?B?V01jNllqOWZ6RktnRWduOEM5aGRVWm53ZTJBVC9RemZuTzJjTDJpeWdMdUh5?=
 =?utf-8?B?L2c9PQ==?=
Content-ID: <7B749AF4936EDA40A08D42278A7CDF7E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b920cf94-8586-4aa3-b3a9-08dcf494e87d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 01:32:37.2469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtw1bzIbH2kpa7TlgRoe0bTTqciX2Jk7ko25PGOl6D/3qleoKNvNeVFDwEAcpZwNtYAD37jqYZmE1/7jQUXPsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7668
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1990186638.735356050"
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

--__=_Part_Boundary_008_1990186638.735356050
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRG91ZywNCg0KT24gVGh1LCAyMDI0LTEwLTI0IGF0IDEzOjQ3IC0wNzAwLCBEb3VnIEFuZGVy
c29uIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhl
IHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEhpLA0KPiANCj4gT24gV2VkLCBKdW4gMTksIDIw
MjQgYXQgOTozOeKAr0FNIEhzaWFvIENoaWVuIFN1bmcgdmlhIEI0IFJlbGF5DQo+IDxkZXZudWxs
K3NoYXduLnN1bmcubWVkaWF0ZWsuY29tQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gRnJv
bTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+ID4NCj4gPiBB
bHdheXMgYWRkIERSTV9NT0RFX1JPVEFURV8wIHRvIHJvdGF0aW9uIHByb3BlcnR5IHRvIG1lZXQN
Cj4gPiBJR1QncyAoSW50ZWwgR1BVIFRvb2xzKSByZXF1aXJlbWVudC4NCj4gPg0KPiA+IFJldmll
d2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4NCj4gPiBGaXhlczogMTE5ZjUxNzM2MjhhICgiZHJtL21lZGlhdGVrOiBBZGQg
RFJNIERyaXZlciBmb3IgTWVkaWF0ZWsgU29DDQo+IE1UODE3My4iKQ0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmggfCAgNiArKysrKy0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMTcgKysrKyst
LS0tLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jICAg
IHwgIDIgKy0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkNCj4gDQo+IEZXSVcsIHRoaXMgcGF0Y2ggZ290IGludG8gQ2hyb21lT1MncyA1LjE1
IGJyYW5jaCB2aWEgc3RhYmxlIG1lcmdlIGFuZA0KPiBhcHBhcmVudGx5IGJyb2tlIHRoaW5ncy4g
QXMgYSBzaG9ydCB0ZXJtIGZpeCB3ZSd2ZSByZXZlcnRlZCBpdCB0aGVyZToNCj4gDQo+IGh0dHBz
Oi8vY3JyZXYuY29tL2MvNTk2MDc5OQ0KIA0KVGhhbmsgeW91IGZvciByZXBvcnRpbmcgdGhpcyBp
c3N1ZS4gV2UgYXJlIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIHRoZQ0KYnVnLg0KDQpTaW5jZSBJ
IGFtIHVuYWJsZSB0byBhY2Nlc3MgdGhlIEdvb2dsZSBpc3N1ZSB0cmFja2VyIFsxXSwgY291bGQg
eW91DQpwbGVhc2UgcHJvdmlkZSBtb3JlIGRldGFpbHMgYWJvdXQgdGhpcyBidWc/IFRoZSBtZXNz
YWdlIGluIHRoZSByZXZlcnQNCmNvbW1pdCBtZW50aW9ucyAiaGFuYS9zeWNhbW9yZTM2MCIgKE1U
ODE3MykgYW5kIGl0IGFwcGVhcnMgdGhhdCB0aGVyZQ0KaXMgYSByb3RhdGlvbiBpc3N1ZSBpbiB0
YWJsZXQgbW9kZS4NCg0KPiANCj4gLi4uYXBwYXJlbnRseSB0aGUgcGF0Y2ggaXMgZmluZSBvbiBu
ZXdlciBrZXJuZWxzIHNvIG1heWJlIHRoZXJlIGlzIGENCj4gbWlzc2luZyBkZXBlbmRlbmN5PyBI
b3BlZnVsbHkgc29tZW9uZSBvbiB0aGlzIGxpc3QgY2FuIGRpZyBpbnRvIHRoaXMNCj4gYW5kIGVp
dGhlciBwb3N0IHRoZSByZXZlcnQgdG8gc3RhYmxlIDUuMTUga2VybmVscyBvciBzdWdnZXN0DQo+
IGFkZGl0aW9uYWwgYmFja3BvcnRzLg0KPiANCg0KVGhlcmUgYXJlIGtub3duIGlzc3VlcyBbMl0g
cmVnYXJkaW5nIGZvcndhcmQgY29tcGF0aWJpbGl0eS4gQ291bGQgeW91DQpjb25maXJtIHdoZXRo
ZXIgdGhpcyBwYXRjaCBpcyB1bmFibGUgdG8gcmVzb2x2ZSB0aGUgbWVudGlvbmVkIHByb2JsZW0/
DQpUaGFua3MuDQoNClsxXSBodHRwczovL2lzc3VldHJhY2tlci5nb29nbGUuY29tL2lzc3Vlcy8z
Njk2ODg2NTkNClsyXSANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9ODk2OTY0DQoNCj4gDQo+IC1Eb3VnDQoNCkJlc3QgcmVn
YXJkcywNClNoYXduDQoNCg==

--__=_Part_Boundary_008_1990186638.735356050
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0RvdWcsDQoNCk9uJiMzMjtUaHUsJiMzMjsy
MDI0LTEwLTI0JiMzMjthdCYjMzI7MTM6NDcmIzMyOy0wNzAwLCYjMzI7RG91ZyYjMzI7QW5kZXJz
b24mIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMy
O2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5r
cyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91
JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUm
IzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0hpLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYj
MzI7V2VkLCYjMzI7SnVuJiMzMjsxOSwmIzMyOzIwMjQmIzMyO2F0JiMzMjs5OjM5JiM4MjM5O0FN
JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyO3ZpYSYjMzI7QjQmIzMyO1JlbGF5DQom
Z3Q7JiMzMjsmbHQ7ZGV2bnVsbCtzaGF3bi5zdW5nLm1lZGlhdGVrLmNvbUBrZXJuZWwub3JnJmd0
OyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtGcm9tOiYjMzI7
SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20m
Z3Q7DQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtBbHdheXMmIzMyO2FkZCYjMzI7
RFJNX01PREVfUk9UQVRFXzAmIzMyO3RvJiMzMjtyb3RhdGlvbiYjMzI7cHJvcGVydHkmIzMyO3Rv
JiMzMjttZWV0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJR1QmIzM5O3MmIzMyOyhJbnRlbCYjMzI7R1BV
JiMzMjtUb29scykmIzMyO3JlcXVpcmVtZW50Lg0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0
OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5j
b20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hp
bm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyO0ZpeGVzOiYjMzI7
MTE5ZjUxNzM2MjhhJiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtEUk0mIzMy
O0RyaXZlciYjMzI7Zm9yJiMzMjtNZWRpYXRlayYjMzI7U29DDQomZ3Q7JiMzMjtNVDgxNzMuJnF1
b3Q7KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGll
biYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGRwX2NvbXAuaCYjMzI7fCYjMzI7JiMzMjs2JiMzMjsrKysrKy0NCiZndDsmIzMy
OyZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jJiMz
Mjt8JiMzMjsxNyYjMzI7KysrKystLS0tLS0tLS0tLS0NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jJiMzMjsmIzMyOyYjMzI7JiMzMjt8
JiMzMjsmIzMyOzImIzMyOystDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOzMmIzMyO2ZpbGVzJiMz
MjtjaGFuZ2VkLCYjMzI7MTEmIzMyO2luc2VydGlvbnMoKyksJiMzMjsxNCYjMzI7ZGVsZXRpb25z
KC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0ZXSVcsJiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7Z290
JiMzMjtpbnRvJiMzMjtDaHJvbWVPUyYjMzk7cyYjMzI7NS4xNSYjMzI7YnJhbmNoJiMzMjt2aWEm
IzMyO3N0YWJsZSYjMzI7bWVyZ2UmIzMyO2FuZA0KJmd0OyYjMzI7YXBwYXJlbnRseSYjMzI7YnJv
a2UmIzMyO3RoaW5ncy4mIzMyO0FzJiMzMjthJiMzMjtzaG9ydCYjMzI7dGVybSYjMzI7Zml4JiMz
Mjt3ZSYjMzk7dmUmIzMyO3JldmVydGVkJiMzMjtpdCYjMzI7dGhlcmU6DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO2h0dHBzOi8vY3JyZXYuY29tL2MvNTk2MDc5OQ0KJiMzMjsNClRoYW5rJiMzMjt5b3Um
IzMyO2ZvciYjMzI7cmVwb3J0aW5nJiMzMjt0aGlzJiMzMjtpc3N1ZS4mIzMyO1dlJiMzMjthcmUm
IzMyO2N1cnJlbnRseSYjMzI7aW52ZXN0aWdhdGluZyYjMzI7dGhlDQpidWcuDQoNClNpbmNlJiMz
MjtJJiMzMjthbSYjMzI7dW5hYmxlJiMzMjt0byYjMzI7YWNjZXNzJiMzMjt0aGUmIzMyO0dvb2ds
ZSYjMzI7aXNzdWUmIzMyO3RyYWNrZXImIzMyO1sxXSwmIzMyO2NvdWxkJiMzMjt5b3UNCnBsZWFz
ZSYjMzI7cHJvdmlkZSYjMzI7bW9yZSYjMzI7ZGV0YWlscyYjMzI7YWJvdXQmIzMyO3RoaXMmIzMy
O2J1ZyYjNjM7JiMzMjtUaGUmIzMyO21lc3NhZ2UmIzMyO2luJiMzMjt0aGUmIzMyO3JldmVydA0K
Y29tbWl0JiMzMjttZW50aW9ucyYjMzI7JnF1b3Q7aGFuYS9zeWNhbW9yZTM2MCZxdW90OyYjMzI7
KE1UODE3MykmIzMyO2FuZCYjMzI7aXQmIzMyO2FwcGVhcnMmIzMyO3RoYXQmIzMyO3RoZXJlDQpp
cyYjMzI7YSYjMzI7cm90YXRpb24mIzMyO2lzc3VlJiMzMjtpbiYjMzI7dGFibGV0JiMzMjttb2Rl
Lg0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyOy4uLmFwcGFyZW50bHkmIzMyO3RoZSYjMzI7cGF0Y2gm
IzMyO2lzJiMzMjtmaW5lJiMzMjtvbiYjMzI7bmV3ZXImIzMyO2tlcm5lbHMmIzMyO3NvJiMzMjtt
YXliZSYjMzI7dGhlcmUmIzMyO2lzJiMzMjthDQomZ3Q7JiMzMjttaXNzaW5nJiMzMjtkZXBlbmRl
bmN5JiM2MzsmIzMyO0hvcGVmdWxseSYjMzI7c29tZW9uZSYjMzI7b24mIzMyO3RoaXMmIzMyO2xp
c3QmIzMyO2NhbiYjMzI7ZGlnJiMzMjtpbnRvJiMzMjt0aGlzDQomZ3Q7JiMzMjthbmQmIzMyO2Vp
dGhlciYjMzI7cG9zdCYjMzI7dGhlJiMzMjtyZXZlcnQmIzMyO3RvJiMzMjtzdGFibGUmIzMyOzUu
MTUmIzMyO2tlcm5lbHMmIzMyO29yJiMzMjtzdWdnZXN0DQomZ3Q7JiMzMjthZGRpdGlvbmFsJiMz
MjtiYWNrcG9ydHMuDQomZ3Q7JiMzMjsNCg0KVGhlcmUmIzMyO2FyZSYjMzI7a25vd24mIzMyO2lz
c3VlcyYjMzI7WzJdJiMzMjtyZWdhcmRpbmcmIzMyO2ZvcndhcmQmIzMyO2NvbXBhdGliaWxpdHku
JiMzMjtDb3VsZCYjMzI7eW91DQpjb25maXJtJiMzMjt3aGV0aGVyJiMzMjt0aGlzJiMzMjtwYXRj
aCYjMzI7aXMmIzMyO3VuYWJsZSYjMzI7dG8mIzMyO3Jlc29sdmUmIzMyO3RoZSYjMzI7bWVudGlv
bmVkJiMzMjtwcm9ibGVtJiM2MzsNClRoYW5rcy4NCg0KWzFdJiMzMjtodHRwczovL2lzc3VldHJh
Y2tlci5nb29nbGUuY29tL2lzc3Vlcy8zNjk2ODg2NTkNClsyXSYjMzI7DQpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8mIzYzO3Nlcmllcz04
OTY5NjQNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstRG91Zw0KDQpCZXN0JiMzMjtyZWdhcmRzLA0K
U2hhd24NCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0t
ey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoq
KioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1t
YWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVu
dGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20g
ZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0K
Y29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRp
c3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlp
bmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRl
bmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5s
YXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFp
bCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0
byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5v
dA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNv
bi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1990186638.735356050--

