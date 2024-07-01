Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A391D67C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 05:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0404B10E0A6;
	Mon,  1 Jul 2024 03:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ae7XcXlk";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="I9HSTf88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEC610E0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 03:10:21 +0000 (UTC)
X-UUID: 7010fb5e375711ef8b8f29950b90a568-20240701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5drVEzB6z9o3R2zh+vBtWeFs3U7MgTQjKIaPJL3+Xiw=; 
 b=ae7XcXlkaPZl3QUen9fDU0RxbHnWvuRCsmELcLXEOwqgzhZio40mFlfQwInbcK9NT/+vVwpkpfMsr2jPUVCWtA4znQtOi53RIFyE70m4dNMiVdSrc2R0hIynTV1YV89GaXlUGhJ1nIXhIhyTw72PAY2pwLZAQ65qX8VQ2k59Eu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:f34ec54e-dbf2-4ea2-b5bb-41ae5b54cc28, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:4098bf44-a117-4f46-a956-71ffeac67bfa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7010fb5e375711ef8b8f29950b90a568-20240701
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1363488721; Mon, 01 Jul 2024 11:10:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 1 Jul 2024 11:10:14 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 1 Jul 2024 11:10:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvLzDQT1Looh4zmz1xkYYT2EUdgBxmbt7X6BkF2d7+WxkBUuWUtflur2hbLQB9Zse1ACoh9l1anbuzBR6CqL2wu5eqe0y1JgLegJujdzt/RD4bS7IJ4nFvyD7+6IKxYPUPFeFhz9ajTYJY6Ge3jOSyT3fA3ocPDwhppCbx6qT95xr/DB0IiYRWcAapyHcuNTJ3pcU0J+ObJJtT2rhACBfLl6d1wOf6H4VLYALnmzqmEPyye7v3B4VJCQzA0iEFJuyoLq2jEME5py84WdE0/EdrX58IA3z8mBbqX82NxxOoVpie2EGBwrTliYO5TrSHMiSwLh9p90fnL3WH28LvQldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCsstC29dplaeQpcwYU5MPiDSFGTKtXneuwor0Mvkqg=;
 b=nAzgNCNhpLkntX86kqrN8VkteqWjzXstbHFXIMvQac4FJYDiD91ejIJddWcYiGifGqQU4xMVIfH7tecOjhnd91tyiKbjFBc1KeJYgdRCKQoftTckA8EH8un6tOwWZwOqQzH+62WablumkhytpFe8myhwKNIn+QwSVDhOkM3z1byioL1wPFehgULNibXeyK5cZvMJqENq+UG4jmn2qKFchSSpoBEy6U11w3D6UZkSgRT8s/JAEw7K9tmQPoZqCfk25XLc8UrIQsLAt8JcAWZ5Wcryv7+oXd+HYxZhvPCsMu/llY8MkV94htlkkGA7Eia0fFvO+bxijAKCIJcCBCrRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCsstC29dplaeQpcwYU5MPiDSFGTKtXneuwor0Mvkqg=;
 b=I9HSTf88vby7pd8f3qvfog37AAsyynxdoalF9AU1RWVKVga+ewZuASzbBlZSCRpDzOe95F3QijrvCDKJ5rUNo5Ux0rHEnkGrOOcsDeOuJgLa11ObywiplqfIdGkO4GASN/WCjYi+76mh9ygcFo7LYB0yobQ7plgB+Fz/dOEkDUw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7395.apcprd03.prod.outlook.com (2603:1096:400:420::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 03:10:11 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 03:10:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHawm4CehGZ7j4H80uVSodFizERF7HhQ4EA
Date: Mon, 1 Jul 2024 03:10:11 +0000
Message-ID: <2bcb715c19c8445746a00bcd4b633ceb42c286a1.camel@mediatek.com>
References: <20240620-blend-v1-0-72670072ca20@mediatek.com>
 <20240620-blend-v1-2-72670072ca20@mediatek.com>
In-Reply-To: <20240620-blend-v1-2-72670072ca20@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7395:EE_
x-ms-office365-filtering-correlation-id: 4b5d06c0-55e6-4e94-ba18-08dc997b51ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OW40OTlIeFFvMS9pcjZXU1YvRjhWdjVnTWhUd0ZnSUZnZGZ3ZklvbFVtV24v?=
 =?utf-8?B?UmcrcWRXNG5oQ25xcnh0UUVESzZDYTVBYWdObXdOd1M3Wk9Xem55bXVVNHNa?=
 =?utf-8?B?RnVFNWE2d2N1KzBtMWdYMllrVnpMNE1GM1A5K1VBd2I2bngwa1I0Y1NQRFVm?=
 =?utf-8?B?WHF6eFBpVGIwY2NPTFI2Y1Fma0s2VUNDZ2l4VWpPdUFYOTMxNGloc2tIaEkx?=
 =?utf-8?B?enVzNEFmczFKZlBXT2ZBQjZzQUpZTm91V3VJK3prN29ZbU1uTUtidkl1K1g2?=
 =?utf-8?B?NllLR3hFeEtsL0RkVE14NUIzQUdUcFJLcG1aWnVTT3d6Um42N3hCQ3BqdVNP?=
 =?utf-8?B?YVNabkR4L2RqVGt1YVoyNEl1N1Vack9PZ0JMSVpSLzBOZ0pRaU5PZXFyaDlE?=
 =?utf-8?B?bW5EYWhCOXVBTWhpM1U3UHpRSlBadll5U2ZYalpBZllUV0l6N3VId0trS2d4?=
 =?utf-8?B?dlBkMzVERm1wQUFRWDhHRlFJcU9nNGRuc01qb0dUbmxHUGV2SFRxd0lyODVy?=
 =?utf-8?B?VWk4ODFkeWhHTGFtWWhaV0U0c3QzbjhoL1JEalZUQ25uOUF6VVBwUllDaExo?=
 =?utf-8?B?MnV4cEhxRXFHYmR1bnZpQnVyenBXeEJaMXhTMjhHWkU3b1JGTk5GYWdkRXNN?=
 =?utf-8?B?OTBwSUtWd0FLVFUvUXVadGhUNk02Ui82QU1yVzRPUnBCN3prRkd0U2ZaUS9I?=
 =?utf-8?B?bEVVSzNSODhXWmVHNEQrZWxtbnRoeHRZT1c2WGtLK1lJZ20xbXNYMWpSOFli?=
 =?utf-8?B?WW9PbTJaUVJVZzgxSVlFRlV0aEFJemNQc3MzUEhDc0tiRVNvbEZjelF5dmdV?=
 =?utf-8?B?SHRLano0YzYrOEpPU1lNc0ZrZTZySUVhdE5UUUVEMjBPWmwrZVRNY29pV3JS?=
 =?utf-8?B?b2FmbUFxQkR5OGNFNjFTZWI4QzBMUkdPVG5zd1RxanlLYSs3WWt5QkJkYTZW?=
 =?utf-8?B?am5HU1M1ejc5RnRLK1c2UkllS28zYkpMNE96eDdMK3oySi9iZkV2V081dnBs?=
 =?utf-8?B?T0VSaGtoZUloZ1JSVTgvZHQ2Z2tCV2UweGk1NzRabWk0SG5SV2J5ekllV1lU?=
 =?utf-8?B?NXJCMWwydk5QZWhxcWRmS0YxdGltVDVDSVo0VWxZMXhyVUkvbEtNdFpSM2Rz?=
 =?utf-8?B?ZHFwa1h6eUU0Y2d2eDJua1E4WThPVWFsQnZJMm1WWXdNbEI3WGlzVUxYVEs4?=
 =?utf-8?B?aHRuQVhuQi9WRTJza3JyUUc3b1FlSjd4Rzg3UjNnWmY1K2xEcllIMFdEeW1q?=
 =?utf-8?B?Ky9KL0hYaVZ3L0VXc2FSSmlUR0Zxd3NTKzRRTFJNeWJZaS83ZW0yT0FoMXg1?=
 =?utf-8?B?amd2NVpnTmxBL3lKMTNDdmRjYnIrNGhsM0NLUFk0YmtTZlRDNkNPVVRvaG4v?=
 =?utf-8?B?ZUcwT2ZyTUFNeGY1UFc2SkY2aXdmbURIS0pQd3dudjFRZW5hVVE1czF4aCtr?=
 =?utf-8?B?TjZQOWNvYkU1UnVlUkhuaTJkeFprMnFVTFdmd3YzSkI0RkQrWDh3aFBQZmRT?=
 =?utf-8?B?YXh2cmRtU3J6VWFIZnhrNUtOZWNoSDVpSVJyQjNZRTFYWFI3T1gwWTV3OEdT?=
 =?utf-8?B?V2Qxdy9UR0R0RkliMU9rb3hmQ0VLdTJtUTk3M0x3cjZIMW5vckRYeU9FR1h0?=
 =?utf-8?B?eVppdVJFODk3L05YZEgxVmxaMG5GaTlqY2dtWlR1Z0RPeFNmeWNsUkpFR2xU?=
 =?utf-8?B?c0k2Y2xISmhXUS9SZFpIWU1jcHBSRG8wK1VxT0hNZEtDL2VKYXRhVitBMmg4?=
 =?utf-8?B?cnpkSGw5NW1QWG5OMVJQTEM3RE5pRkxnODRSbFZDTlJwRkFzTDNoYlo0Ulp1?=
 =?utf-8?B?UHZVdE1Pek5sU2xDWjJTYnpNZXcvUTR3YVFvZzVJNDVkckNIcmEyS290L0Rx?=
 =?utf-8?B?U1RlYmNWMERHdUxVdkl4ZGJBUnFpcGlLd1ZWb2hLNXgvUVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm5lNURhS3JITEdFSk1UdGZVOTlmdUF0RjNSajZLZW0wQjZSQVliTVgwd1VI?=
 =?utf-8?B?Ni9NbkwvMDJPaTAvdkdGVG5icVVOWU5pemhXbWlUdU5QcUtGZS9CRGpGVUxV?=
 =?utf-8?B?N2xTamJLN1VxazdSSlZwTmZheGhiRUd1NzhHdTMxUVpRVzFpdnVyNmFUTHo2?=
 =?utf-8?B?V0Z5VXQvRjZZSTdEM1JtL29OYTF6R2l5c3NkTk5VcGJ5UE1JSHA1QzNkalY2?=
 =?utf-8?B?eHA1a0ZyMHFwd2RNQ2kxQjlBV2lqc1lteXUwaDJiNXVocVZJSlRMOVJXWDls?=
 =?utf-8?B?SnkwWFlrQTJZbTVmUWo5UG5mZW9SVGRBek9Ub3hvOTloUzlQaW5DVkhRMkZj?=
 =?utf-8?B?MG9xa3dmWFM3ZFB2dkJrYXU5NXNjM1NIOFo0ekgyVjJxOWcxeHFnaUg4WWkz?=
 =?utf-8?B?QkdRMmd3SXdHeno3MHpvSURzVUVWZWpwOEJOQ2FqKzZsb2lTbWRYTGcrS3Nm?=
 =?utf-8?B?UDlMRm5Gc3c0dXd6Q0FlemZ4OFR0S0JEcTdXMytRbVlybDJQNVVPODNCVy9U?=
 =?utf-8?B?cWV6bnF2TVI3bXJDUWpvMHhnYVA4aEdYNTIxRzl3bTNXdTUwN1N6aVAvRW9w?=
 =?utf-8?B?Wkxoc3pvcElIb3A4QmZHYzlwY0ZXQmVxYUtraUxGS082RWhSVmdUTEFGQVRU?=
 =?utf-8?B?d0pXR0JVcFp3NkJndExCQk1LSTIweS9wNzNQcHBaUTl0Yno1VVJWUzVLWEZV?=
 =?utf-8?B?VmxvV1FxaUkraEd0RjJ0LzJKU0lSUnlSeGhGQkx4dUFiOWpzcGRkelVOSmN4?=
 =?utf-8?B?dmVneUxKRmE0TGYzWTU2NExYTDJtL3pMUHJscnNjc0hrOHhUSlcwTVZxNzRT?=
 =?utf-8?B?UlB3cyswMFdFcHd4VmZia3pXQUNtMmI3c0dtRU5lTXEraDdYbTdrbWJBTXZw?=
 =?utf-8?B?WVY3cW55QldqTDFrOEw5aldnclpNbnVId3V5VjhYeXMyd2dsamV2MzZEUHI2?=
 =?utf-8?B?bERlclE3VXo1Wmc0R3BWU1JOTzNpak1sL25CNjJmbklIanE3ai80SEZ6WnJL?=
 =?utf-8?B?Qzd4QmZucXB3R3R4eVZ3UzM3NHJNVTVrbEpsZzhOYXdvNjcwaEV2Tmx2YWsz?=
 =?utf-8?B?T2ZVQ0EwRmZaL0pEMTYrbEgvZ2JkRk9zWllCNjhxRXMyeUVTbVMwdDVoTGZp?=
 =?utf-8?B?d2N6c09UQUlkellCZXUveVpJNzZUWEF3UTB4R1JJbzFYSDFFSkppM3BUeTcr?=
 =?utf-8?B?V2JudXJtZ1d4WTJuN3UyWjNRZVViYW5yQ3p6dVREOE5CbFNPTWVoanB6Z3ZP?=
 =?utf-8?B?ZlN5THp5clhLWUhoOFBiZGQyVm51a1kwNHVkbmZGRVBvVVI4RkF5WGdUdHZ3?=
 =?utf-8?B?ZGJ3RFpnMENiTDU0dkZiWGlDQmRGUW5Td05wUmRRclUvN01LQ2YxRjdpbW95?=
 =?utf-8?B?bVZzOWVhaFk4U01DRmhHeTlpVGhyVDlHSS85VXdCdWljVnZ0c29kMjAwTHUx?=
 =?utf-8?B?UE41ekwweE1pdlVYRnRxRnI1eW1teVhaWC9GbUlDaHVMN0t4aEMvZmkvakFU?=
 =?utf-8?B?empOWFZQcEZYZmFsb1Y5RitrWHJpRXpkSzMwWCt4bDM3RG40dmZncHlrVFR4?=
 =?utf-8?B?ci80MWJqM1Q5a2c0eEE2dnNRTXI4K1RRWUl6K2hHdzJBL2hvaFdvVnFQVCtk?=
 =?utf-8?B?TTcrOUZUVUtQNTd6Z1pXZllSb2h3MWdSc0xFUmFzTUNYN05jdWxCWExGd3BS?=
 =?utf-8?B?dXExMHpSd01WQnUxVXpiMm9tODBvWmdtRGhsMW1OZVlCRjBiSmRKeGY3ZUR2?=
 =?utf-8?B?RFdkckNPNncyVXNQSkRwRURaSWNiOGllUEtiK0NBcTdreG1wYmZ5WGt4NGdn?=
 =?utf-8?B?TWF1Y0M3c2o1d2VBUE5yT2RVeHNNMGZPUUFlUGlnVGl2NU52U2RkcXd3V3Ba?=
 =?utf-8?B?S3lYN1Z5eG54Q3VMWkdraEV3QWlpYkJSVjlkL3JtVTNXakloSURpR3NxSWZy?=
 =?utf-8?B?U3NMK1ZhVXFad1VreGdBb0RMcXRES2VjTkxWQzhWbnhzbVMxQVZzSWxXODRy?=
 =?utf-8?B?b09qYy9QTzdhYXNnaWwzZUZCcFpWV3FWcGFzb0tVSW9GMDBIaXRXRmNBdERF?=
 =?utf-8?B?NmkzczQrZFNtOVZXYlRLTHFYMnM1QVZvcFJKMjJVZTlXcE1FajU4djdIZnlI?=
 =?utf-8?Q?oyNPj6/22tooqqayyZmaaIB++?=
Content-ID: <82BF1118F87F1745AB626D847DD30E9F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5d06c0-55e6-4e94-ba18-08dc997b51ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 03:10:11.5129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16SexT6ms0e/C2wAKoHeGFOD2caHAmYogbKKsL+YJY+rgsZNY9SjB6ZVi3scKtsWyFM9McOIsGUESGqcAbu3lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7395
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1257509930.1071872134"
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

--__=_Part_Boundary_005_1257509930.1071872134
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDYtMjAgYXQgMDE6MjcgKzA4MDAsIEhzaWFvIENo
aWVuIFN1bmcgdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQ
bGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhh
dmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEZyb206IEhzaWFvIENo
aWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIg
YWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRlaydzIGNoaXBzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIHwgMTMgKysrKysrKysrKy0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGluZGV4IDM2MDIxY2I4ZGY2
Mi4uNDhiNzE0OTk0NDkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2V0aGRyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5j
DQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICogQ29weXJpZ2h0IChjKSAyMDIxIE1lZGlhVGVrIElu
Yy4NCj4gICAqLw0KPiAgDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9ibGVuZC5oPg0KPiAgI2luY2x1
ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5o
Pg0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiBAQCAtMzUsNiArMzYsNyBAQA0KPiAgI2Rl
ZmluZSBNSVhfU1JDX0wwX0VOQklUKDApDQo+ICAjZGVmaW5lIE1JWF9MX1NSQ19DT04obikoMHgy
OCArIDB4MTggKiAobikpDQo+ICAjZGVmaW5lIE5PTl9QUkVNVUxUSV9TT1VSQ0UoMiA8PCAxMikN
Cj4gKyNkZWZpbmUgUFJFTVVMVElfU09VUkNFKDMgPDwgMTIpDQo+ICAjZGVmaW5lIE1JWF9MX1NS
Q19TSVpFKG4pKDB4MzAgKyAweDE4ICogKG4pKQ0KPiAgI2RlZmluZSBNSVhfTF9TUkNfT0ZGU0VU
KG4pKDB4MzQgKyAweDE4ICogKG4pKQ0KPiAgI2RlZmluZSBNSVhfRlVOQ19EQ00wMHgxMjANCj4g
QEAgLTE3NSw3ICsxNzcsMTMgQEAgdm9pZCBtdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlkeCwNCj4gIGFscGhhX2NvbiB8PSBzdGF0ZS0+YmFz
ZS5hbHBoYSAmIE1JWEVSX0FMUEhBOw0KPiAgfQ0KPiAgDQo+IC1pZiAoc3RhdGUtPmJhc2UuZmIg
JiYgIXN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkgew0KPiAraWYgKHN0YXRlLT5i
YXNlLnBpeGVsX2JsZW5kX21vZGUgPT0gRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSkNCj4gK2Fs
cGhhX2NvbiB8PSBQUkVNVUxUSV9TT1VSQ0U7DQoNClRvIHN1cHBvcnQgRFJNX01PREVfQkxFTkRf
UElYRUxfTk9ORSwgSSB0aGluayBpZ25vcmUgcGl4ZWwgYWxwaGEgaXMgZW5vdWdoLiBXaHkgbmVl
ZCB0aGlzIHNldHRpbmc/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICtlbHNlDQo+ICthbHBoYV9jb24g
fD0gTk9OX1BSRU1VTFRJX1NPVVJDRTsNCj4gKw0KPiAraWYgKChzdGF0ZS0+YmFzZS5mYiAmJiAh
c3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKSB8fA0KPiArICAgIHN0YXRlLT5iYXNl
LnBpeGVsX2JsZW5kX21vZGUgPT0gRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSkgew0KPiAgLyoN
Cj4gICAqIE1peGVyIGRvZXNuJ3Qgc3VwcG9ydCBDT05TVF9CTEQgbW9kZSwNCj4gICAqIHVzZSBh
IHRyaWNrIHRvIG1ha2UgdGhlIG91dHB1dCBlcXVpdmFsZW50DQo+IEBAIC0xOTEsOCArMTk5LDcg
QEAgdm9pZCBtdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWdu
ZWQgaW50IGlkeCwNCj4gIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHBlbmRpbmctPmhlaWdodCA8
PCAxNiB8IGFsaWduX3dpZHRoLCAmbWl4ZXItPmNtZHFfYmFzZSwNCj4gICAgICAgIG1peGVyLT5y
ZWdzLCBNSVhfTF9TUkNfU0laRShpZHgpKTsNCj4gIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIG9m
ZnNldCwgJm1peGVyLT5jbWRxX2Jhc2UsIG1peGVyLT5yZWdzLCBNSVhfTF9TUkNfT0ZGU0VUKGlk
eCkpOw0KPiAtbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBhbHBoYV9jb24sICZtaXhlci0+
Y21kcV9iYXNlLCBtaXhlci0+cmVncywgTUlYX0xfU1JDX0NPTihpZHgpLA0KPiAtICAgMHgxZmYp
Ow0KPiArbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgYWxwaGFfY29uLCAmbWl4ZXItPmNtZHFfYmFz
ZSwgbWl4ZXItPnJlZ3MsIE1JWF9MX1NSQ19DT04oaWR4KSk7DQo+ICBtdGtfZGRwX3dyaXRlX21h
c2soY21kcV9wa3QsIEJJVChpZHgpLCAmbWl4ZXItPmNtZHFfYmFzZSwgbWl4ZXItPnJlZ3MsIE1J
WF9TUkNfQ09OLA0KPiAgICAgQklUKGlkeCkpOw0KPiAgfQ0KPiANCj4gLS0gDQo+IEdpdC0xNDYp
DQo+IA0KPiANCj4gDQo=

--__=_Part_Boundary_005_1257509930.1071872134
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDYtMjAmIzMyO2F0JiMzMjswMToyNyYjMzI7KzA4MDAsJiMzMjtIc2lhbyYjMzI7Q2hp
ZW4mIzMyO1N1bmcmIzMyO3ZpYSYjMzI7QjQmIzMyO1JlbGF5JiMzMjt3cm90ZToNCiZndDsmIzMy
OyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNl
JiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjth
dHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3Ro
ZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtG
cm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRp
YXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1N1cHBvcnQmIzMyOyZxdW90O05vbmUm
cXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7bW9kZSYjMzI7b24mIzMyO01lZGlhVGVr
JiMzOTtzJiMzMjtjaGlwcy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMy
O0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29t
Jmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZXRoZHIuYyYjMzI7fCYjMzI7MTMmIzMyOysrKysrKysrKystLS0NCiZndDsmIzMyOyYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEwJiMzMjtpbnNlcnRpb25zKCspLCYjMzI7
MyYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMz
MjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyO2luZGV4JiMzMjszNjAyMWNiOGRm
NjIuLjQ4YjcxNDk5NDQ5MiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjtAQCYjMzI7LTMsNiYjMzI7KzMs
NyYjMzI7QEANCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtDb3B5cmlnaHQmIzMyOyhjKSYjMzI7
MjAyMSYjMzI7TWVkaWFUZWsmIzMyO0luYy4NCiZndDsmIzMyOyYjMzI7JiMzMjsqLw0KJmd0OyYj
MzI7JiMzMjsNCiZndDsmIzMyOysjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fYmxlbmQuaCZndDsN
CiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtkcm0vZHJtX2ZvdXJjYy5oJmd0Ow0KJmd0
OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fZnJhbWVidWZmZXIuaCZndDsNCiZn
dDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtsaW51eC9jbGsuaCZndDsNCiZndDsmIzMyO0BA
JiMzMjstMzUsNiYjMzI7KzM2LDcmIzMyO0BADQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01J
WF9TUkNfTDBfRU5CSVQoMCkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TUlYX0xfU1JDX0NP
TihuKSgweDI4JiMzMjsrJiMzMjsweDE4JiMzMjsqJiMzMjsobikpDQomZ3Q7JiMzMjsmIzMyOyNk
ZWZpbmUmIzMyO05PTl9QUkVNVUxUSV9TT1VSQ0UoMiYjMzI7Jmx0OyZsdDsmIzMyOzEyKQ0KJmd0
OyYjMzI7KyNkZWZpbmUmIzMyO1BSRU1VTFRJX1NPVVJDRSgzJiMzMjsmbHQ7Jmx0OyYjMzI7MTIp
DQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01JWF9MX1NSQ19TSVpFKG4pKDB4MzAmIzMyOysm
IzMyOzB4MTgmIzMyOyomIzMyOyhuKSkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TUlYX0xf
U1JDX09GRlNFVChuKSgweDM0JiMzMjsrJiMzMjsweDE4JiMzMjsqJiMzMjsobikpDQomZ3Q7JiMz
MjsmIzMyOyNkZWZpbmUmIzMyO01JWF9GVU5DX0RDTTAweDEyMA0KJmd0OyYjMzI7QEAmIzMyOy0x
NzUsNyYjMzI7KzE3NywxMyYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19ldGhkcl9sYXllcl9jb25m
aWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtp
ZHgsDQomZ3Q7JiMzMjsmIzMyO2FscGhhX2NvbiYjMzI7fD0mIzMyO3N0YXRlLSZndDtiYXNlLmFs
cGhhJiMzMjsmYW1wOyYjMzI7TUlYRVJfQUxQSEE7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjstaWYmIzMyOyhzdGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1w
OyYjMzI7IXN0YXRlLSZndDtiYXNlLmZiLSZndDtmb3JtYXQtJmd0O2hhc19hbHBoYSkmIzMyO3sN
CiZndDsmIzMyOytpZiYjMzI7KHN0YXRlLSZndDtiYXNlLnBpeGVsX2JsZW5kX21vZGUmIzMyOz09
JiMzMjtEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKQ0KJmd0OyYjMzI7K2FscGhhX2NvbiYjMzI7
fD0mIzMyO1BSRU1VTFRJX1NPVVJDRTsNCg0KVG8mIzMyO3N1cHBvcnQmIzMyO0RSTV9NT0RFX0JM
RU5EX1BJWEVMX05PTkUsJiMzMjtJJiMzMjt0aGluayYjMzI7aWdub3JlJiMzMjtwaXhlbCYjMzI7
YWxwaGEmIzMyO2lzJiMzMjtlbm91Z2guJiMzMjtXaHkmIzMyO25lZWQmIzMyO3RoaXMmIzMyO3Nl
dHRpbmcmIzYzOw0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K2Vsc2UNCiZndDsmIzMyOyth
bHBoYV9jb24mIzMyO3w9JiMzMjtOT05fUFJFTVVMVElfU09VUkNFOw0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7K2lmJiMzMjsoKHN0YXRlLSZndDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjshc3Rh
dGUtJmd0O2Jhc2UuZmItJmd0O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKSYjMzI7fHwNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyO3N0YXRlLSZndDtiYXNlLnBpeGVsX2JsZW5kX21vZGUmIzMy
Oz09JiMzMjtEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsv
Kg0KJmd0OyYjMzI7JiMzMjsmIzMyOyomIzMyO01peGVyJiMzMjtkb2VzbiYjMzk7dCYjMzI7c3Vw
cG9ydCYjMzI7Q09OU1RfQkxEJiMzMjttb2RlLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyomIzMyO3Vz
ZSYjMzI7YSYjMzI7dHJpY2smIzMyO3RvJiMzMjttYWtlJiMzMjt0aGUmIzMyO291dHB1dCYjMzI7
ZXF1aXZhbGVudA0KJmd0OyYjMzI7QEAmIzMyOy0xOTEsOCYjMzI7KzE5OSw3JiMzMjtAQCYjMzI7
dm9pZCYjMzI7bXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRl
diwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7bXRrX2RkcF93
cml0ZShjbWRxX3BrdCwmIzMyO3BlbmRpbmctJmd0O2hlaWdodCYjMzI7Jmx0OyZsdDsmIzMyOzE2
JiMzMjt8JiMzMjthbGlnbl93aWR0aCwmIzMyOyZhbXA7bWl4ZXItJmd0O2NtZHFfYmFzZSwNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bWl4ZXItJmd0O3JlZ3Ms
JiMzMjtNSVhfTF9TUkNfU0laRShpZHgpKTsNCiZndDsmIzMyOyYjMzI7bXRrX2RkcF93cml0ZShj
bWRxX3BrdCwmIzMyO29mZnNldCwmIzMyOyZhbXA7bWl4ZXItJmd0O2NtZHFfYmFzZSwmIzMyO21p
eGVyLSZndDtyZWdzLCYjMzI7TUlYX0xfU1JDX09GRlNFVChpZHgpKTsNCiZndDsmIzMyOy1tdGtf
ZGRwX3dyaXRlX21hc2soY21kcV9wa3QsJiMzMjthbHBoYV9jb24sJiMzMjsmYW1wO21peGVyLSZn
dDtjbWRxX2Jhc2UsJiMzMjttaXhlci0mZ3Q7cmVncywmIzMyO01JWF9MX1NSQ19DT04oaWR4KSwN
CiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsweDFmZik7DQomZ3Q7JiMzMjsrbXRrX2RkcF93cml0
ZShjbWRxX3BrdCwmIzMyO2FscGhhX2NvbiwmIzMyOyZhbXA7bWl4ZXItJmd0O2NtZHFfYmFzZSwm
IzMyO21peGVyLSZndDtyZWdzLCYjMzI7TUlYX0xfU1JDX0NPTihpZHgpKTsNCiZndDsmIzMyOyYj
MzI7bXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCYjMzI7QklUKGlkeCksJiMzMjsmYW1wO21p
eGVyLSZndDtjbWRxX2Jhc2UsJiMzMjttaXhlci0mZ3Q7cmVncywmIzMyO01JWF9TUkNfQ09OLA0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtCSVQoaWR4KSk7DQomZ3Q7JiMzMjsmIzMyO30N
CiZndDsmIzMyOw0KJmd0OyYjMzI7LS0mIzMyOw0KJmd0OyYjMzI7R2l0LTE0NikNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0t
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

--__=_Part_Boundary_005_1257509930.1071872134--

