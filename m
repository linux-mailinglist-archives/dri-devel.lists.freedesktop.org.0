Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB09347AD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 07:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE4110E53C;
	Thu, 18 Jul 2024 05:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="muWJz89d";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uxav7/ZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A340710E53C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 05:41:18 +0000 (UTC)
X-UUID: 573e0c6044c811efb5b96b43b535fdb4-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pIdJBkyG6AhnMF28mCAfV5lfe/W4DeIF6ktXqylDotc=; 
 b=muWJz89d6+EhL6jnzGUzP1ZRW1eqasfFK3+0kQAiMun5akn7S6LSwu79cKCuFZXtVCtEJ7wR93hFhMs58QyhRHzlr8CHEUVpYlx16HxTNq2DIlQxgQ/Zb6iA1if6EqneD2qcA2KMdCsTLrsFO9gJHDuSYAQh3hCtMVcrM5QSxTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:8516a1ed-8b2a-460e-b5ac-59b49a9e7fcf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:97c9980d-46b0-425a-97d3-4623fe284021,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 573e0c6044c811efb5b96b43b535fdb4-20240718
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1702307243; Thu, 18 Jul 2024 13:41:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Jul 2024 13:41:03 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 13:41:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyWSYX680rcYVuWpfS/7P/iPFGsd1+8hjt0P8kUwJZbroR9qJOru1vbZJWTes9+IK1zVPId1WtRc5PKXTLICheHybrgKs1aQfCOlln1cBP1sjHnGV7c0slum0hCIifi5IiF7AzEWFVwqfIsWclYjG9zUgsnvcPe3Sb5OHOTIsoFV9cZi3jI9zns/a3vio0MNb780b81BamyC9gWwlySAXa/g9t0CGQ1wmYtAchFPb6zFxtRp7fvuHfs4LfVRlL160xjZiLdk5FLB5BH/YhsLwB0LK0c3lIPC5EYNNDBv0YBmdoKtNJ0vLqbsOQIlcPILDhjuWKyz/K8pn/UM8OHbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7rbAPiqM/t8eoyN9CWi87hZzfIRgMny7NzTq+6T4kA=;
 b=U7AUeubPSGFn0+9yQ5File+iN2J1sMkL9ENEZUxqIp3hS/6zWu6WMRB7hNUOOCnhhfv3/qlRmc6lh0SH0famzKj83A6jjy1jc8CyT4QqqBH9nIzEqViFoLoOjy+HrNkf4O6ttvcQ/RxjJJEtZ995vd5W1fbskZWaPQ/Tj7G5cb3zNsSozXsEDTwDv4Wc8M8CPjr45+A6b0pd1WAVSi0GxjGUCC4VsFxg650wSY/b+q/CFcUahlK3/e9K273XFpcCHqZiDceL/kTiqgOB05kkVb577EeFYxqvllSAiX56qGqSnaEq/l8GNIAy03Ctbj1us/9ElrkuZdfNfbm7oXNP+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7rbAPiqM/t8eoyN9CWi87hZzfIRgMny7NzTq+6T4kA=;
 b=uxav7/ZC4GSO/q1AOcMgRh5dZUhf+Jv1jtrv1Ll07kCvuA2uh/+NDtnaZhuO3cAbDAwUHwtEKiWQzJf72vBIhIxpx80lSsjnOudCIPUeTJTeNqeBDhD8Tsd/lCcthexgN9aP1+Z19Hs1XfnTVO/iiqJcPbI75bynfxOeguJrYCc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8564.apcprd03.prod.outlook.com (2603:1096:405:61::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 05:41:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 05:41:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLH8NusA
Date: Thu, 18 Jul 2024 05:41:01 +0000
Message-ID: <22bc6e48edb0ed17080518531926ecc38194f1ad.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8564:EE_
x-ms-office365-filtering-correlation-id: 3811ff94-6124-4b4f-adab-08dca6ec3544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M2x1c1drSHNhVS9FMFVkK2xQdW9tb1ltdExYMEVmR0F5Z0NqdTBmUXdNNi9B?=
 =?utf-8?B?N01yVVcwL1J4a0NEREh4b2R2ZVlyU3FuMm04RlFOWk56c0ZLMmE1VGdnYzFu?=
 =?utf-8?B?R3pNb3UvZDE4UFFtMUgzWCtvTktDY1R3L3krMFhQSmlFN252blMxSGdLL0ZC?=
 =?utf-8?B?bVo5QVJGY295L2ozYW5nVWhYNEw4emh5UnNwaVE0d3FPWTBNZXlia0Jma0FM?=
 =?utf-8?B?RkhORU1jVTM5YzNPMG5kYzZ1KzUyK1F2djlhN2NXY3kxTERjNzJWOHU5RUs1?=
 =?utf-8?B?KzFkc0doeHhLblI1elpnbkxrUjhhZXN5T0U0SWNpWkhjaUlQWmQ5cGlYNU5X?=
 =?utf-8?B?MUVJL3dFbmExWDFjVDJHNEZZUTRFZExZQUtwU2ZUUERFeEx6U3RVTndzRVZN?=
 =?utf-8?B?U2VoRVdueTNGL0lpTUowU3NFUVBuU2oyVVd3dUp2bUMxSk81QktvTXFkdFZr?=
 =?utf-8?B?RTNLQ1ZHeHRMNW9NdXZxMG9UV3NpRHJYZHljWGRQdVNIV0ErSUxsYVExby94?=
 =?utf-8?B?R2s2Z1hqb1pHYTRTM0F3NUlKc0VQcnh4NFdZQ01hVHlaS3RsQUtBSDAxVzNx?=
 =?utf-8?B?TGRhREVydTFERTVDTG1QMmJ4ZEVERXl6bFY0SFNuaVZPekVxTWF5VExhdDZL?=
 =?utf-8?B?MHZxbTluWEwvUUIxcnhEMnAvbDdOdGJHbTF4UExldWhBWTV1cW11UG85N2tR?=
 =?utf-8?B?MTBPbUh2cFdDNXpjdGRCbi9DRjY3OHprbW5nRVBrVzFlNVhtVlYvaVNWMFZQ?=
 =?utf-8?B?MFJTK29kRkd3cW9PWkxHWUt2TWxJOUoxQkVnMEVmSzJpRitTMzAwc2F0cUda?=
 =?utf-8?B?dWhkZzVCa25BcGVXZnVOTHFtamx5NDhtL1pyWlhvRERyY2NXQk1aRUhwakNJ?=
 =?utf-8?B?blExWEN0cktVT2xuQ2tGOElRRlk0T1FPL3poUGlMYnN2SVFraFdrMUIrK0tR?=
 =?utf-8?B?Zm83MGNEcm5zYmczbG1KeW5oaU5XYm1MM1VNc2x1MjlIbmw1aGZ0dDlaVUF0?=
 =?utf-8?B?V0RBRXJIcUJzeGNNNzc0djZtTGVKTE5wdlZkb3pkTSsyYUh3K2RLeW1vSkxP?=
 =?utf-8?B?YVhzZnRFbFk0K3VCcDFhbldWMGlxMGErSUdGSURvUHlmeVFmT3BreWRneWdO?=
 =?utf-8?B?NVhwWmFtNkNpWC91L0MrL2NFTUw5bjIxVHB6UEZiSVpsaFFGYkIyeEJwTU9V?=
 =?utf-8?B?VE15VDRGS2VjTi9raXZXMXZGYkF2dUFuSm96djdRMHV1SGZEQmxla3J3ZVFN?=
 =?utf-8?B?bDFucTRRdWtiYzB5Skh1QTVnV1RDT1RjTzU0S0ZVRUl5MXFFWE1UU2tYK2Zj?=
 =?utf-8?B?eG1ieCtHVzV1VVRRcFFGTG9RcXk1M2RuNjdyZjQwQitQR09NdjhMR0FlWHc3?=
 =?utf-8?B?S2N5SDJPTnJUa2pJSC9JZ0VQM3Mza1RUbXgwY1o1ckZHbnlQdFdycEoxMUxQ?=
 =?utf-8?B?bDdtdnRTMjl4d1ZlQ2VOVWhWVUYxUjUyd2pla2VRVzRJTEs3YVFsM0x6c09M?=
 =?utf-8?B?SWdPaWtVL1ZjcmpSdGVTUnQ0RFQ1R1ArS2JtVTFHY2llUytOU1ZMaHJ3QndN?=
 =?utf-8?B?aFFBQjdSekU4M3Fnb2VPOXNNOFBHbTh6THYycVRUWHlHODNmQ1NweGFzR05U?=
 =?utf-8?B?c1c3dC9tSHBBejd1L25yRnBob1RXZFJYT21uTEdNY2pub3lvaURmSWlQT0xI?=
 =?utf-8?B?M0ROSDRKeStseVJZYkkxdGRSQ1FvVmNwZXBnVE9xVUZ2d0ViQlZpaFU2UEtS?=
 =?utf-8?B?NmZIS0tvM0FZVDhwL09MbWlWcVJLSFY3dG9RbUE1ZnRDRCtJbjU4dDVrTmx4?=
 =?utf-8?Q?L0c0GC8aFcDYYoa7pGwjgjBhCp7m4LkS6/aqE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXhKNzhUWXp2MFBETTNBWm1yMGFCdE1RdzJhWUJlVnBWdngwblpEK1krR0hv?=
 =?utf-8?B?bkp0c0hKaEhzRW1yV0dXQmpTTWdNcUtUaXJOeEFUMjRiZCttTDhyS3RmRVZD?=
 =?utf-8?B?ZnF2eUhZejF1V0E3Nnkzbm04RDBxYUJIYTA0RjJGTlBmb0NpRnRtOXE1QUU2?=
 =?utf-8?B?enF4dGhNbDl0SDg2RTVWT3lkWmZ5cHNndHc5bk9KWGVjYzNhdlJQcHNTODhE?=
 =?utf-8?B?QXRIVXFHT0kraVRqOXk5UjdFbzJsYndxZWdXYUhKSVhnTUZQK05Eb2RxQW04?=
 =?utf-8?B?NFJ6SlQ1b3dwaDBhUUE3VTB5SXdrYlg0ZURudjNyUEY0Nm12U2FlcEw0ekIr?=
 =?utf-8?B?T1lxY2tWV1RyUUUvdC83eXMyVlB4NUtYQzV4bWptRDhSRXRJZzVFY2Zvbjh3?=
 =?utf-8?B?dmludW1ZbVV4bHRjVGtuV1M4MTFIU0dubEhsSGk4eFdBZW1yZFJ2RjNJd0dk?=
 =?utf-8?B?ZHF4UnlKZnB3RzhYVEZVTXc5aWtHQkVpakFiN2tzZTYvK0xyRUdLKzRNbnhr?=
 =?utf-8?B?QjlaRnFWTHZXbzVRaW5WN0d5ajhrcnF0RjF2U0hGdnpIc2RuZFZZdGhsejgw?=
 =?utf-8?B?SmFXc3I1OW1pWUxGRHFrN0hzTVprWjkwTS9HTloxVmk4MEpvMTgrbU4zTWJX?=
 =?utf-8?B?NmUwRG5SVEVUUkdrbWcrVEdnWnhmMjNqNmdDUWpEbmF0ZTgwNTBhVGJFM0hL?=
 =?utf-8?B?YTduTkY5bFpFN3Nsb3o1QTk1N2kzdFl0OG5uVVFvRmdLSVpONlBuQVhEZE03?=
 =?utf-8?B?NnJ2SDNDTTVvNm4yZ0VjZW9qcTRKUDBtU0dJeUFuWmtmSHpRRjJwZW1ueklD?=
 =?utf-8?B?b3dublo0OXQ1b0hZaDZtd0N4T2FpOXhiY2lQQWttMVdOck5KYnEyRFZOeFNC?=
 =?utf-8?B?QnR0cmExRGthQWo5TDBUQlkxeUtwQjJXc2MvREV3QU1sczRiUUxFV0J2UGRQ?=
 =?utf-8?B?TDNEbk82ekZkK1htNG9XdHJPUk9wYUhrckJYTUdjNFRxM3RGcnZqdVJsWXRL?=
 =?utf-8?B?SWR1RkM1NVQ4ZThzMEthM2tNNWp1MlVDV3NvaTB3R0F6NXdwODhiazRoQTJG?=
 =?utf-8?B?S2t2YitDZVErSEtDcVRQYmpSOEkxVlhsUkNvWUtRcHpUU0N4S001OVBWalMv?=
 =?utf-8?B?bXhSQnJBUU04UXdIWEJYT1dEVDFnd3YzN2JPM2xlQXVqbjY1dVFXU1FwNWN2?=
 =?utf-8?B?ZW51Sk53UkM5b1o2MnRRRXRNV2d5T1J4TjRyWFBNZEtzZFhGdWpHZ3lpQmdP?=
 =?utf-8?B?M3E2eDJIWTMwbFVTd2JMbXZQM0VDVlR4Szk3K3VscWE2L2x0Yld5OW9icGhT?=
 =?utf-8?B?cDdnbktGb2tZWFloMU1DMEF2ODUycFh0RlE2NmlSaDdxcHpkajFocEUyRG5z?=
 =?utf-8?B?RlYzQTFCcG9NU0tpNjFCQmhnSUVMQUFETUlvKzZBSkhJRmJPNUxQMEtjbmtW?=
 =?utf-8?B?bnBsWWxSVHlXT3V1eTJwREo2eW12Wkh5UnE3SnRjUGxTQzJacVZUaFk2MXlC?=
 =?utf-8?B?N2dBWG42SE5URUN5dWtjUWk2QzhMVHhlcnQ5MmtWRk4raUZsSUlrTi9hcFdq?=
 =?utf-8?B?d2Zza0FEK0l4TGRlTkNhZGthaTJHOHNQanRJaldvMDJyUFJyQ2lQUjRwVDlj?=
 =?utf-8?B?WlRSbTY4dUtMaE5uSVFPT21JeldhS3JoRVpmbks4cDNJT3RCT05tNWQvazll?=
 =?utf-8?B?elJCcFk4Mm1CSE5QSkFlRjBZanIyU0RPVHVsdDgwWWZpdmpGaEhiTHJSVmZi?=
 =?utf-8?B?YnVwaWVGL2VLejVySFlFRGpXUThnM0ZqTHUzNW14QUNiQ1YwaDVzQ1FjY2k4?=
 =?utf-8?B?MGc0aTZoWkl1QnJ6dmVYVVBSaHZsdEowQjdXazZTTkRSWHhqczhPUDdIeUNh?=
 =?utf-8?B?cVh4SG1WTm5pT0Z4VlhLcWFNZzg0MzZEUnZudFkwNWVUem9kRjZ1UklTZmtU?=
 =?utf-8?B?dTNjQVFuaXM5RXkvalBVZmxxbUlRaE1aRGRyek5kZklhNHozRW50L2xMRXFt?=
 =?utf-8?B?OW9qUldJSGVoNXJta2N6TVF0Q09YcHVNNFJYS21ZTHM3S2FQVWlGMEthVC9s?=
 =?utf-8?B?dWhLMklBbm1LeHU3VXNndmVMdTBZdTdXWE5XaitFUWhSK1FIRHo3dlZDSFVj?=
 =?utf-8?Q?O5Dc40xC3kK1vnrB8jeJmlLTn?=
Content-ID: <F22A04FB4F54BC47B854A2A610C3687C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3811ff94-6124-4b4f-adab-08dca6ec3544
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 05:41:01.5368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M01TqOjfbGdi3fF1bxyU8fHoXLmBxGKq/LliYhHRpezGStb24qNLdHSLyWwg/Y6+nwGw1J/9zYTilJN5QC/2kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8564
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.003800-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfjPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxXA7rTaHAw771A
 /V6RVDjDMqtZwXDJcJxiPmy8WTo67rNUVnqixiMOGVyS87Wb4lzSv+oK79xjnUYvSDWdWaRh8ha
 W4U9IrFqFWYX2TPbDEmR/iQlCuCUWlwV2iaAfSWfSBVVc2BozSnJnzNw42kCx2bNx1HEv7HAqtq
 5d3cxkNaHPvJWKXC4F43fNEs/Hqwi7Mo8V9xqEPy05qRgqqIxPf+GEg1l85xcfvRvQEjvkJJnY8
 UMFWrtvqmNic5lkPHKPYRvkXSVlnVUR4JJWH47oPVxlUTP3GoO7AlsRb/Q7WQoYlPnP/8T/FltY
 lf3C/iNDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.003800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CB48ADE343C9B06E2B89A738CB8602E3B0F57AD9F606B233F3852465E5BE97492000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1215966316.1386016615"
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

--__=_Part_Boundary_008_1215966316.1386016615
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gKw0KPiArc3RhdGljIHZvaWQgbXRrX2RwX2hkY3BfZ2V0X2luZm8oc3RydWN0IG10a19k
cCAqbXRrX2RwKQ0KPiArew0KPiArCWRwX3R4X2hkY3AyeF9nZXRfaW5mbygmbXRrX2RwLT5oZGNw
X2luZm8pOw0KDQpkcF90eF9oZGNwMnhfZ2V0X2luZm8oKSBpcyBvbmx5IGNhbGxlZCBieSBtdGtf
ZHBfaGRjcF9nZXRfaW5mbygpIGFuZCBtdGtfZHBfaGRjcF9nZXRfaW5mbygpIG9ubHkgY2FsbCBt
dGtfZHBfaGRjcF9nZXRfaW5mbygpLA0Kc28gbWVyZ2UgdGhlc2UgdHdvIGZ1bmN0aW9uLg0KDQpS
ZWdhcmRzLA0KQ0sNCg0KPiArfQ0KPiArDQo=

--__=_Part_Boundary_008_1215966316.1386016615
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtTYXQsJiMzMjsy
MDI0LTA2LTA4JiMzMjthdCYjMzI7MjA6MDEmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YzOg0KJmd0OyYjMzI7LSYjMzI7cmVm
aW5lJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO3Rp
bWUNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93JiMzMjt0byYjMzI7ZG8m
IzMyO0hEQ1AmIzMyO3dpdGgmIzMyO2NvbnRlbnQmIzMyO3R5cGUmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO3Byb3RlY3Rpb24mIzMyO3ZhbHVlJiMzMjt3aGljaCYjMzI7c2V0JiMzMjtieSYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93
JiMzMjt0byYjMzI7dXBkYXRlJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uDQomZ3Q7JiMzMjst
JiMzMjtyZWZpbmUmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7dG8mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbg0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtmcm9tJiMz
Mjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchbWQ2eFVpWU44OEQyWW1FVHM4RlFnYUV4TTJ6SDhT
MVNtQUVVOUdSY2h3cE5zWE95REZ1bDN6aVZLaFJwQ0phajhSY24tZ3ZNLTgwMXJ1bmp3QSYjMzY7
JiMzMjsNCiZndDsmIzMyOy9wYXRjaC8yMDI0MDIwNTA1NTA1NS4yNTM0MC0zLW1hYy5zaGVuQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO21hYy5z
aGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjt2b2lkJiMzMjttdGtfZHBf
aGRjcF9nZXRfaW5mbyhzdHJ1Y3QmIzMyO210a19kcCYjMzI7Km10a19kcCkNCiZndDsmIzMyOyt7
DQomZ3Q7JiMzMjsrZHBfdHhfaGRjcDJ4X2dldF9pbmZvKCZhbXA7bXRrX2RwLSZndDtoZGNwX2lu
Zm8pOw0KDQpkcF90eF9oZGNwMnhfZ2V0X2luZm8oKSYjMzI7aXMmIzMyO29ubHkmIzMyO2NhbGxl
ZCYjMzI7YnkmIzMyO210a19kcF9oZGNwX2dldF9pbmZvKCkmIzMyO2FuZCYjMzI7bXRrX2RwX2hk
Y3BfZ2V0X2luZm8oKSYjMzI7b25seSYjMzI7Y2FsbCYjMzI7bXRrX2RwX2hkY3BfZ2V0X2luZm8o
KSwNCnNvJiMzMjttZXJnZSYjMzI7dGhlc2UmIzMyO3R3byYjMzI7ZnVuY3Rpb24uDQoNClJlZ2Fy
ZHMsDQpDSw0KDQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSAN
CmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdl
ZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUg
bGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25h
dGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24s
IHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBo
YXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55
IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVu
dHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9m
IHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19
LS0+

--__=_Part_Boundary_008_1215966316.1386016615--

