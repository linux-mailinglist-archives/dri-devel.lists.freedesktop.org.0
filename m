Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6AD90A79D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 09:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6168810E283;
	Mon, 17 Jun 2024 07:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Fku7i65v";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="sWfxK2hH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D310E283
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:45:25 +0000 (UTC)
X-UUID: 8d91b5fe2c7d11efa54bbfbb386b949c-20240617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=CUfnlfWF2eHpEfAVZKdDj9Cp7cxQ8btVbExJh2mlYlE=; 
 b=Fku7i65vvsUa2JhOBgvFM8AXoWOvLv27iAB+0Ylr5pQJc+//S3/ClB2iD24MTf2WYcVMJEbbuH6FcaJU00LmtiYd6fYQnNtfGB2F04jFY8MGg0YDbYoAu6j7uaRDWDkhJOYOEBYzYvCex7BoNmBql2jwSO+dvH2l0c6EDZ/Mq38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:b4b8b592-af1b-4e36-b46f-c58c79ee340e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:55461494-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8d91b5fe2c7d11efa54bbfbb386b949c-20240617
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1491124994; Mon, 17 Jun 2024 15:45:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 17 Jun 2024 15:45:21 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jun 2024 15:45:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STKVdExDypP3QSRNeiV45Vzkdwe9jGaCDLe14bbCenhSSaJ+4o/DMpMsySfen8DozxbXVxC+fpPSY1b4Rllx19xGCkA9pGNZ5g5h+2XpkyB+ZV9BiWHBvvdFyVXaBLY90RCbF4vkd71O1rneSBm0Qw/02SVNkWE5doGoQg+RunTY0qIRv3MBfYfDqyGrxhi3NIfznDzDY5AwRKmToB6zNDdNrjH2pDGP5tntpEuQglI1PFYotj3NZIwzoapYolcZF5PJZ/d0AQhslH/1wdAiMppmaaWvHYtEEXD9obUsjFm04XLOc4rUoJMYHUymY9cpX9Svf9rH6Fezwx6AnKXVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUfnlfWF2eHpEfAVZKdDj9Cp7cxQ8btVbExJh2mlYlE=;
 b=ljcUZBGf5d1Zy1/7MaXU1dzNyFg8hDuo9GLmCyNRE37WxfDEk39Z8M2+6JY06pjb+Gb/p39NHclMgAQg0jwaWGhmYZaNMDG2gbdZv6xqlU6Mbg5BeBva4HTmBEOIgcei3uAy1gjDcWMcQPegTQh6tWmvR4VbXzQVnoAEts/RQT0MlkKvwFUVHvFyDKp7xqOkx26u56qFj0mtUGJ167RBSjhTcXTvaqvO2sWAXvxchismL3U1NZUKfQvfOI4PlhGYB9ZwvTYYZupIqe51NtkdtSm3woNXZxpHW3iq/6n922w4BgYhEqE459SwVqQpLV83FtYZXQ65p6NNWNb18YCDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUfnlfWF2eHpEfAVZKdDj9Cp7cxQ8btVbExJh2mlYlE=;
 b=sWfxK2hHKxgGnVP+QECDJ3gRG23w0xJWwFprHc+IEqGrRAQYzRqphh9kI+xjjpsH4g50/0lttsR0Ev0N37pU0xk8fLx55kZDba0z9zqkA6MIciJLDEkA6xAeAQ6MshXADRKonYuLPjo0chx5AL+rR41f8eTHVe1ccX/B717bCI0=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TYZPR03MB8018.apcprd03.prod.outlook.com (2603:1096:400:463::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:45:18 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 07:45:17 +0000
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
Subject: Re: [PATCH v6, 10/24] media: mediatek: vcodec: send share memory data
 to optee
Thread-Topic: [PATCH v6, 10/24] media: mediatek: vcodec: send share memory data
 to optee
Thread-Index: AQHap4umDiVMqaO7Q0eOCGoFLwVS0LGjNmwAgCiPEwA=
Date: Mon, 17 Jun 2024 07:45:17 +0000
Message-ID: <30a0daa8f7166bd3f958a93505de357f466bc0ec.camel@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-11-yunfei.dong@mediatek.com>
 <00128c79-9a27-4410-88d5-d1cd9a6460c0@collabora.com>
In-Reply-To: <00128c79-9a27-4410-88d5-d1cd9a6460c0@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TYZPR03MB8018:EE_
x-ms-office365-filtering-correlation-id: 6affe506-248c-4ae1-47fa-08dc8ea16e80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|7416011|376011|1800799021|38070700015|921017; 
x-microsoft-antispam-message-info: =?utf-8?B?dmVSTEx5TkVyMEpKd0d0M21NRTNpWUczcElTYnpwYnJaeUlFczBzaTJiNHEw?=
 =?utf-8?B?WlJFTm5wNm0rSEhNZWhYVTEzek9reGVTZFpwUWZKYWFIcXhoVUo0d0JlbXRP?=
 =?utf-8?B?dk0xSGV6MzhNUVBvZVVvdU1ETFNjdWl6SDV1a0J6U05kbGlRallrSy9JMWo1?=
 =?utf-8?B?My90eEQvbS9mUGx5MTNudHpQUW13ZHQySTRNL1I1RUJXZXZFbWRaTmIzV1dz?=
 =?utf-8?B?SmU1R3BTVUY1NHFKSzVPblNlenhNUk9wNUxQcHE0QkhRWGQwM3ZPeUx3WlNv?=
 =?utf-8?B?RGRkMkUyeDdCQk5wSGx5d2s4UHBaZVFqenNXdlNkelE5VGZ0V2ZrWWJBZ2pp?=
 =?utf-8?B?bEUxM1BKUnN5U1NTYnhmY0l6VHlsZE9IeE9yYzd4L0UrVXBnUnBhUm9uSG02?=
 =?utf-8?B?ZEtIa09mYlJ0K1A0elVzcFZEVGxqdDFTWHZsK2FKdHFnVHdnaVd3N1VlMTNO?=
 =?utf-8?B?N1lpWTc4SFY5MmhDdlo3blBYV1lrTHFtN1JQd0gyOUk1T3V2SE8wVFZoeml6?=
 =?utf-8?B?MGdJZVd4Tkx0VjV4bFoxU2tiWjJ5WGlucWxEdW9MNW1oSG5wK0pjUS9JWjhx?=
 =?utf-8?B?dzhhamk2RGFZcG5SOEpiOVNaL0FKZVJMZDdNTElZc2FZeHR2S3VYSzJjY2pE?=
 =?utf-8?B?VDBmK0FRbTVkR3NzTkRqN2syS3VsS1VyUEhNTWpRbXhrbGk4Y1dLK3d6RUJp?=
 =?utf-8?B?bEgvZy9US3E4Y3JGQldxTjNDWXpWVmhKNFFjRzdRNVo2R1YvVHhvRERrNmFu?=
 =?utf-8?B?ckRHc24xU2lSS3BkK1NyM1RmUHNVUnBkMG9wVE10dWxBUzBXZXprQUx3MHRW?=
 =?utf-8?B?YXlZcXVwUmN4L0V5TWxRSjZzZWNONDNGbGVlVFlwMkpOMGpUSnN1aENyNkdw?=
 =?utf-8?B?NTBMTlU4T2N0T1pZRGpFK1duak5FcUdSZGFTZHc4aUxLNnNUVUFWMDR0a08r?=
 =?utf-8?B?TlUySi9PT0FHb1NlMUhyMklIelhleWNZYkZNU0VHMXVzYUFxYWZlYi9Mb0Fz?=
 =?utf-8?B?UUo2WVR3VGJnelJhaklxS21GQkVub2lXRndMYUNTbG90dTQxVlJaVTMxcWRF?=
 =?utf-8?B?SG43MTdSZzJNT3YySVZyb25Fd1JZc3JibTBkaUZWcDlaMkVwLzlUbG5jVWlt?=
 =?utf-8?B?empaNGRoNVlaM2JsWkhERDRtUktzcmFFbDJHdFRWQ05tUi91aG9vZU1QS1B0?=
 =?utf-8?B?V3pyL2VZd285VXRrU0JoK1c0VytWUFpTanp5cGZ4MFJoa0FYOVl6WFh6TEJ1?=
 =?utf-8?B?MWN0bWN0TkdRbU1wbjRRV3llOVJoOVhVUmlFeGtSTWJybzZDWXFyUnBlZEhS?=
 =?utf-8?B?N3BZV2tOWVl1Y3A0L2R1MW1FSzhQcnJ2S0pPOWtCNFYwUDBFS1pQSVZldld2?=
 =?utf-8?B?QU5YaEEzeHBzQm03czZ0MWRwd3VmZGVJVFhtODZYT3B2QVlJbnRBWUdJQU9y?=
 =?utf-8?B?WC9lTFRIZXlGdGZ3bUpCOHA5N3NsbDUyNW9pR0lPTW44a0k1cWZNZW1LSW8x?=
 =?utf-8?B?NTVsa2FMU2VKcXIyU0dGN0xtdThpUG1yM21zelJTQ1NseFV2RG9hZGRjcnZV?=
 =?utf-8?B?WGhkcThFS2RSeXRQY2x2MkRxVDJSTGxpVXN1Vlp4NzFlN2JiTWl1NnhqTTg2?=
 =?utf-8?B?dTl0MjhZcnM3RjlmdU1JaEpERGs4VEZFQkpBa2ZlMlllai9lbUYzL1gxVnh4?=
 =?utf-8?B?NXlybGo4QmhOb3p3Tkxid1lZNmw3bGZJMHhYUGhtSkF6TXlKZzhlNjJrWWFD?=
 =?utf-8?B?Umh4U1lnWk1qQnlFK1NpNkpxbHVhNDhaYWxNSFhpc3czOFQ5bGgvUEVFVEpL?=
 =?utf-8?B?R1psVmc4bjdQOWlyMVFvV05zRVJkZ1JYM1lFY2gydnJjVUJuWndITEMwTmdF?=
 =?utf-8?Q?gkHh6Qo1efZVv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSQPR03MB8697.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015)(921017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkdSazZLZUd2MTJZbzBhaXpZV1B0cG02M3pySUgrNVVYSTRpNk90cnc4bDFk?=
 =?utf-8?B?b3plNmNSUmV1aUx6cFpuWVZlQUhPSUZ4ZkM3QVR2WVd3VWFtVExkWGEwcVAr?=
 =?utf-8?B?NkxrVnhXZDJFL25UUVkxMzJLN2E3ckI4djV4bXF3bzE1TVpyQXNJenlVckp3?=
 =?utf-8?B?ZEhxalpHVUpNRWUyNUFuU0FGQzBzL2dUakZsUW95NU1zZ2JDNTcvTjZnbUpM?=
 =?utf-8?B?bWlvbEVPNGdlSC84dFYrcm5JU0J4M0E0c0xYR1BNa0NmMGNsNGhhQUhMVENQ?=
 =?utf-8?B?SUhpWkE3ck9NN2U4YXZZZzVBZEp4RkhwVVZLckFneVdVTC9pUGxIYWswR3FZ?=
 =?utf-8?B?QXJTQWFJUWhjbmVHYWtTWVdISEQrV2JsbTN3RVV6OXBSSUMxbkZnZERESHVp?=
 =?utf-8?B?UzZKQW8wbFZPZ0VMN3Yva0hjazRyaHp1amNVN1RLelVVNld6a2JUdTdCQUN4?=
 =?utf-8?B?dWtoQlpObzdFOUxkME94Q05jZmFmZnJlMmN5N3JlZEl1UzRjMTBTTTg0QUJY?=
 =?utf-8?B?ak00ZzlPN0ltdEtmTkJWSld6bDYyditwUEVuZEtMT2MyQTBKd1dYUFZGUVph?=
 =?utf-8?B?STlTaUJFcHIyM095Z3crd3FKVy9ENjlvNW9oUEhLc1duY1IrSkNTSGVmdkFW?=
 =?utf-8?B?SHp2TG5jU1dWbm4zVmJ5TVdpMmxtSmFMQ3FrQm15WEZSdWJJUHhSb1lSVGFM?=
 =?utf-8?B?YUN5cllZNXNjbGg3dlVsT3NQQXpaMncvbWVsVHZ5QmVRbHhMbjh2bjhDbHhJ?=
 =?utf-8?B?QnJmd0Q1d2FLZHM4bnZLVEI0MXNnV2FlWSt3aFZablhGYnNNT1p3dUh3TUJ6?=
 =?utf-8?B?MDlDWkZveHMyd1ZZOE9yblRtTXg1NE92cHBYKytJaHEyeUFYemltR3FNcVN2?=
 =?utf-8?B?WTdJRG5JemEvRmcvM0twc2Q4bGo3a1hjemgxSHRTNHV2d2lJb0NlL3dNSjNX?=
 =?utf-8?B?aDY3SmxpUTdkSVpINDFDdnpKTnk2bXd3Q3E0RnRiL3pLSEgySkVBMGU2VEll?=
 =?utf-8?B?cXJFZ3hTdS9DTEVWL3lsOXBabndLSnFhaysyZjhyM3ZxZ0IxWGNKamlMdDcw?=
 =?utf-8?B?OHcyaXRRUFExQVFOM0l0WUtYeFR6YXJVNHNxVzlTWmVQaXRmdFZLeVJrRnhv?=
 =?utf-8?B?THozMzAwc0NDVkdlbHdhUVhiZ010UWc5blJlNThOVFZwMCtnc0owdSsvaVBq?=
 =?utf-8?B?YVN5Nko0bS9RenJxVllDWjhnTGtTM2x1Tm4vNFllYit4VGtXcFk3SmlDek01?=
 =?utf-8?B?RGo1M05GWVRjRG9aN3l2bzkybWNDbjFQL3FNNVpCTlE1L0JibGwvc3hzK2lw?=
 =?utf-8?B?cUg3eUVNNU1QazIrUEJxd0dXaHhnYmcwYlVFZ3V6QnRGRURjSnJTV3A5RThR?=
 =?utf-8?B?L1RoLzFNTkZVV2txbXMyY0ZRWGttUlBlODdINTNSV0VVRVBLV1RoT0J1RG9V?=
 =?utf-8?B?SVhzRHNYSEE1VXVWdDZqVGtLRzRNODltWkt6RnFiM0RmaGJ4aHJRN0d6a0gw?=
 =?utf-8?B?MXNEL1cveGJHenRiNG11TFgyem1XUVBvcW5PUUUzWEVKTERpMForcnB2S3Bk?=
 =?utf-8?B?K3kydnZmbnlwNEsvaXAxQSthQ3l6UzFRMDdDdVJNdVczV0ZNMkdkeUt5MzF0?=
 =?utf-8?B?dnk2STBtZmpMT3IzRnZMKzVGYitCL01ycVExdW12NWYrRGpYRk96dkpidE1Y?=
 =?utf-8?B?VFJGeWZGRHBEZytpUjl3U2xnKzVIRVBtTGNpcmlCbEZKL294MXFDM0c2Wm1T?=
 =?utf-8?B?R2RrbEVDL0dtVFUyYXdiSFVzbWRXdHEwckhNVUl1TFVrZTFtOEhGQ3hkRnR3?=
 =?utf-8?B?UkFScDMxSFl1UlhKN1dLSFF2TlUvTnpPU0IyakRWRmRXS2lJS3hvZ1RVTitT?=
 =?utf-8?B?bmR2YS8yM0poWnVJcnR0MlVJOW0zMzNYcFhnZ29HRDBCT05SWW1KeCtmNXN3?=
 =?utf-8?B?em1RSE9FWTI5bi85RHRjN3BSOVI2d0NKVU94QWoyalFPN1RTSnd2SkQzOW96?=
 =?utf-8?B?eFpzMWtKbDJYSU9ENE5VeTJ3U2tuSDVKWlozbEVicWpBaDk3S0dHbTBHYUZj?=
 =?utf-8?B?aEkzNGk1cFFRZWFkVEwvbXVBdWZyMUo5V29RMTh3ZTM1RmlodDNFWWszZ3Nx?=
 =?utf-8?B?dVpJU1gwWjNPR2FQekJFbHBoakkzNmh4SVdyWndJenJyNXlDMEsyNDdlSTdj?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADB1BDAFC3071546AF71A82F779D5C22@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6affe506-248c-4ae1-47fa-08dc8ea16e80
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 07:45:17.4258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4y2UxU4nYIlFWhq9g4QO9NHYdw5kDCCRIDAXYOY4VB79nAvDqFzOJ9xyo37p6o1OPO6Dq+Q+ok+eOIVI+9fbQ+4EMjKEePxCeQhU5idNg28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8018
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--23.923100-8.000000
X-TMASE-MatchedRID: vbSD0OnL8/KnykMun0J1wpmug812qIbzjLOy13Cgb4/mNRhvDVinv/eJ
 lqUEMxA/28iOGQckLR2Rw/ra2qdhjNGETJv1/WyOH5YQyOg71ZbmdC4WbBxTJOk9QK6zMDVauof
 NdUxb+HM8VyRVdn8owOZbmW10nfnjroQgRZf2+t4MH4SsGvRsA1g3VqSTJ7SoCwWRLqiC/Ure9i
 ux8ViNa1uqFf2iTYKb4gA46uHuFGX8OkSa7MC2+7xk3OaETqHeQKuv8uQBDjqlyfbzMrA/wo2PN
 627X5nNY9Y+hIZD5d390UyI6hZHnnOAMSqhBqB6lGudLLtRO1uOJZyIAulM02ecrqZc3vabhCYQ
 0GRRnBNlHNvg6WeWUnLdekVvhhXQxlHnMvFtXmoshGpBsK6H7pRy1HDTPOXagiL/QhKEhDijxYy
 RBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKT4yqD4LKu3A
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--23.923100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8CF695AD066787D90F20199CB9ACED27DABEA2C804E4CBE11E63EB036A3D19CC2000:8
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
DQoNCk9uIFdlZCwgMjAyNC0wNS0yMiBhdCAxNDoyMiArMDIwMCwgQW5kcnplaiBQaWV0cmFzaWV3
aWN6IHdyb3RlOg0KPiBIaSBZdW5mZWkgJiBKZWZmcmV5LA0KPiANCj4gVyBkbml1IDE2LjA1LjIw
MjQgbyAxNDoyMCwgWXVuZmVpIERvbmcgcGlzemU6DQo+ID4gU2V0dGluZyBtc2cgYW5kIHZzaSBp
bmZvcm1hdGlvbiB0byBzaGFyZWQgYnVmZmVyLCB0aGVuIGNhbGwgdGVlDQo+ID4gaW52b2tlDQo+
ID4gZnVuY3Rpb24gdG8gc2VuZCBpdCB0byBvcHRlZS1vcy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgLi4uL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX29wdGVlLmMgICAgIHwgMTQwDQo+
ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gICAuLi4vdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2Rl
Y19kZWNfb3B0ZWUuaCAgICAgfCAgNTEgKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAx
OTEgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfb3B0DQo+
ID4gZWUuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVj
b2Rlci9tdGtfdmNvZGVjX2RlY19vcHQNCj4gPiBlZS5jDQo+ID4gaW5kZXggNjExZmIwZTU2NDgw
Li5mMjlhOGQxNDNmZWUgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX29wdA0KPiA+IGVlLmMN
Cj4gPiArKysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Rl
Y29kZXIvbXRrX3Zjb2RlY19kZWNfb3B0DQo+ID4gZWUuYw0KPiA+IEBAIC0yNDEsMyArMjQxLDE0
MyBAQCB2b2lkIG10a192Y29kZWNfZGVjX29wdGVlX3JlbGVhc2Uoc3RydWN0DQo+ID4gbXRrX3Zk
ZWNfb3B0ZWVfcHJpdmF0ZSAqb3B0ZWVfcHJpdmF0ZSkNCj4gPiAgIAltdXRleF91bmxvY2soJm9w
dGVlX3ByaXZhdGUtPnRlZV9tdXRleCk7DQo+ID4gICB9DQo+ID4gICBFWFBPUlRfU1lNQk9MX0dQ
TChtdGtfdmNvZGVjX2RlY19vcHRlZV9yZWxlYXNlKTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQg
bXRrX3Zjb2RlY19kZWNfb3B0ZWVfZmlsbF9zaG0oc3RydWN0IHRlZV9wYXJhbQ0KPiA+ICpjb21t
YW5kX3BhcmFtcywNCj4gPiArCQkJCQkgc3RydWN0DQo+ID4gbXRrX3ZkZWNfb3B0ZWVfc2htX21l
bXJlZiAqc2htX21lbXJlZiwNCj4gPiArCQkJCQkgc3RydWN0DQo+ID4gbXRrX3ZkZWNfb3B0ZWVf
ZGF0YV90b19zaG0gKmRhdGEsDQo+ID4gKwkJCQkJIGludCBpbmRleCwgc3RydWN0IGRldmljZSAq
ZGV2KQ0KPiA+ICt7DQo+ID4gKwlpZiAoIWRhdGEtPm1zZ19idWZfc2l6ZVtpbmRleF0gfHwgIWRh
dGEtPm1zZ19idWZbaW5kZXhdKSB7DQo+ID4gKwkJcHJfZXJyKE1US19EQkdfVkNPREVDX1NUUiAi
dGVlIGludmFsaWQgYnVmIHBhcmFtOg0KPiA+ICVkLlxuIiwgaW5kZXgpOw0KPiA+ICsJCXJldHVy
biAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCSpjb21tYW5kX3BhcmFtcyA9IChzdHJ1
Y3QgdGVlX3BhcmFtKSB7DQo+ID4gKwkJLmF0dHIgPSBzaG1fbWVtcmVmLT5wYXJhbV90eXBlLA0K
PiA+ICsJCS51Lm1lbXJlZiA9IHsNCj4gPiArCQkJLnNobSA9IHNobV9tZW1yZWYtPm1zZ19zaG0s
DQo+ID4gKwkJCS5zaXplID0gZGF0YS0+bXNnX2J1Zl9zaXplW2luZGV4XSwNCj4gPiArCQkJLnNo
bV9vZmZzID0gMCwNCj4gPiArCQl9LA0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwlpZiAoIXNobV9t
ZW1yZWYtPmNvcHlfdG9fdGEpIHsNCj4gPiArCQlkZXZfZGJnKGRldiwgTVRLX0RCR19WQ09ERUNf
U1RSICJzaGFyZSBtZW1yZWYgZGF0YToNCj4gPiAweCV4IHBhcmFtX3R5cGU6JWxsdS5cbiIsDQo+
ID4gKwkJCSooKHVuc2lnbmVkIGludCAqKXNobV9tZW1yZWYtPm1zZ19zaG1fY2FfYnVmKSwNCj4g
PiBzaG1fbWVtcmVmLT5wYXJhbV90eXBlKTsNCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArCX0NCj4g
PiArDQo+ID4gKwltZW1zZXQoc2htX21lbXJlZi0+bXNnX3NobV9jYV9idWYsIDAsIHNobV9tZW1y
ZWYtDQo+ID4gPm1zZ19zaG1fc2l6ZSk7DQo+ID4gKwltZW1jcHkoc2htX21lbXJlZi0+bXNnX3No
bV9jYV9idWYsIGRhdGEtPm1zZ19idWZbaW5kZXhdLCBkYXRhLQ0KPiA+ID5tc2dfYnVmX3NpemVb
aW5kZXhdKTsNCj4gPiArDQo+ID4gKwlkZXZfZGJnKGRldiwgTVRLX0RCR19WQ09ERUNfU1RSICJz
aGFyZSBtZW1yZWYgZGF0YSA9PiBtc2cNCj4gPiBpZDoweCV4IDB4JXggcGFyYW1fdHlwZTolbGx1
LlxuIiwNCj4gPiArCQkqKCh1bnNpZ25lZCBpbnQgKilkYXRhLT5tc2dfYnVmW2luZGV4XSksDQo+
ID4gKwkJKigodW5zaWduZWQgaW50ICopc2htX21lbXJlZi0+bXNnX3NobV9jYV9idWYpLA0KPiA+
ICsJCXNobV9tZW1yZWYtPnBhcmFtX3R5cGUpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICt2b2lkIG10a192Y29kZWNfZGVjX29wdGVlX3NldF9kYXRhKHN0cnVj
dA0KPiA+IG10a192ZGVjX29wdGVlX2RhdGFfdG9fc2htICpkYXRhLA0KPiA+ICsJCQkJICAgdm9p
ZCAqYnVmLCBpbnQgYnVmX3NpemUsDQo+ID4gKwkJCQkgICBlbnVtIG10a192ZGVjX29wdGVlX2Rh
dGFfaW5kZXgNCj4gPiBpbmRleCkNCj4gPiArew0KPiA+ICsJZGF0YS0+bXNnX2J1ZltpbmRleF0g
PSBidWY7DQo+ID4gKwlkYXRhLT5tc2dfYnVmX3NpemVbaW5kZXhdID0gYnVmX3NpemU7DQo+ID4g
K30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19kZWNfb3B0ZWVfc2V0X2RhdGEp
Ow0KPiA+ICsNCj4gPiAraW50IG10a192Y29kZWNfZGVjX29wdGVlX2ludm9rZF9jbWQoc3RydWN0
IG10a192ZGVjX29wdGVlX3ByaXZhdGUNCj4gPiAqb3B0ZWVfcHJpdmF0ZSwNCj4gPiArCQkJCSAg
ICBlbnVtIG10a192ZGVjX2h3X2lkIGh3X2lkLA0KPiA+ICsJCQkJICAgIHN0cnVjdCBtdGtfdmRl
Y19vcHRlZV9kYXRhX3RvX3NobQ0KPiA+ICpkYXRhKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmb3B0ZWVfcHJpdmF0ZS0+dmNvZGVjX2Rldi0+cGxhdF9kZXYtPmRldjsNCj4g
PiArCXN0cnVjdCB0ZWVfaW9jdGxfaW52b2tlX2FyZyB0cmFuc19hcmdzOw0KPiA+ICsJc3RydWN0
IHRlZV9wYXJhbSBjb21tYW5kX3BhcmFtc1tNVEtfT1BURUVfTUFYX1RFRV9QQVJBTVNdOw0KPiA+
ICsJc3RydWN0IG10a192ZGVjX29wdGVlX2NhX2luZm8gKmNhX2luZm87DQo+ID4gKwlzdHJ1Y3Qg
bXRrX3ZkZWNfb3B0ZWVfc2htX21lbXJlZiAqc2htX21lbXJlZjsNCj4gPiArCWludCByZXQsIGlu
ZGV4Ow0KPiA+ICsNCj4gPiArCWlmIChod19pZCA9PSBNVEtfVkRFQ19MQVQwKQ0KPiA+ICsJCWNh
X2luZm8gPSAmb3B0ZWVfcHJpdmF0ZS0+bGF0X2NhOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCWNhX2lu
Zm8gPSAmb3B0ZWVfcHJpdmF0ZS0+Y29yZV9jYTsNCj4gDQo+IFlvdSBzZWVtIHRvIGJlIHVzaW5n
IHRoaXMgaW4gc2V2ZXJhbCBwbGFjZXMuIE1heWJlIGNyZWF0ZSBhIGhlbHBlcj8NCj4gDQo+IHN0
YXRpYyBpbmxpbmUgc3RydWN0IG10a192ZGVjX29wdGVlX2NhX2luZm8gKmdldF9jYV9pbmZvKA0K
PiAJc3RydWN0IG10a192ZGVjX29wdGVlX3ByaXZhdGUgKm9wdGVlX3ByaXZhdGUsDQo+IAllbnVt
IG10a192ZGVjX2h3X2lkIGh3X2lkKQ0KPiB7DQo+IAlyZXR1cm4gaHdfaWQgPT0gTVRLX1ZERUNf
TEFUMCA/DQo+IAkJJm9wdGVlX3ByaXZhdGUtPmxhdF9jYSA6ICZvcHRlZV9wcml2YXRlLT5jb3Jl
X2NhOw0KPiB9DQo+IA0KPiAoeW91IHdhbnQgdG8gY2xlYW4gdXAgdGhlIGxpbmUgYnJlYWtzIGlu
IHRoaXMgc3VnZ2VzdGVkIGZ1bmN0aW9uKQ0KPiANCj4gYW5kIHRoZW4NCj4gDQo+IAljYV9pbmZv
ID0gZ2V0X2NhX2luZm8ob3B0ZWVfcHJpdmF0ZSwgaHdfaWQpOw0KPiANCj4gPiArDQo+ID4gKwlt
ZW1zZXQoJnRyYW5zX2FyZ3MsIDAsIHNpemVvZih0cmFuc19hcmdzKSk7DQo+ID4gKwltZW1zZXQo
Y29tbWFuZF9wYXJhbXMsIDAsIHNpemVvZihjb21tYW5kX3BhcmFtcykpOw0KPiA+ICsNCj4gPiAr
CXRyYW5zX2FyZ3MgPSAoc3RydWN0IHRlZV9pb2N0bF9pbnZva2VfYXJnKSB7DQo+ID4gKwkJLmZ1
bmMgPSBjYV9pbmZvLT52ZGVjX3Nlc3Npb25fZnVuYywNCj4gPiArCQkuc2Vzc2lvbiA9IGNhX2lu
Zm8tPnZkZWNfc2Vzc2lvbl9pZCwNCj4gPiArCQkubnVtX3BhcmFtcyA9IE1US19PUFRFRV9NQVhf
VEVFX1BBUkFNUywNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJLyogRmlsbCBtc2cgY29tbWFuZCBw
YXJhbWV0ZXJzICovDQo+ID4gKwlmb3IgKGluZGV4ID0gMDsgaW5kZXggPCBNVEtfT1BURUVfTUFY
X1RFRV9QQVJBTVM7IGluZGV4KyspIHsNCj4gPiArCQlzaG1fbWVtcmVmID0gJmNhX2luZm8tPnNo
bV9tZW1yZWZbaW5kZXhdOw0KPiA+ICsNCj4gPiArCQlpZiAoc2htX21lbXJlZi0+cGFyYW1fdHlw
ZSA9PQ0KPiA+IFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfTk9ORSB8fA0KPiA+ICsJCSAgICBk
YXRhLT5tc2dfYnVmX3NpemVbaW5kZXhdID09IDApDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsN
Cj4gPiArCQlkZXZfZGJnKGRldiwgTVRLX0RCR19WQ09ERUNfU1RSICJ0ZWUgc2hhcmUgbWVtb3J5
IGRhdGENCj4gPiBzaXplOiAlZCAtPiAlZC5cbiIsDQo+ID4gKwkJCWRhdGEtPm1zZ19idWZfc2l6
ZVtpbmRleF0sIHNobV9tZW1yZWYtDQo+ID4gPm1zZ19zaG1fc2l6ZSk7DQo+ID4gKw0KPiA+ICsJ
CWlmIChkYXRhLT5tc2dfYnVmX3NpemVbaW5kZXhdID4gc2htX21lbXJlZi0NCj4gPiA+bXNnX3No
bV9zaXplKSB7DQo+ID4gKwkJCWRldl9lcnIoZGV2LCBNVEtfREJHX1ZDT0RFQ19TVFIgInRlZSBi
dWYgc2l6ZQ0KPiA+IGJpZyB0aGFuIHNobSAoJWQgLT4gJWQpLlxuIiwNCj4gDQo+IHMvYmlnL2Jp
Z2dlciA/IE9yIHMvYmlnL2dyZWF0ZXIgPw0KPiANCj4gPiArCQkJCWRhdGEtPm1zZ19idWZfc2l6
ZVtpbmRleF0sIHNobV9tZW1yZWYtDQo+ID4gPm1zZ19zaG1fc2l6ZSk7DQo+ID4gKwkJCXJldHVy
biAtRUlOVkFMOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJcmV0ID0NCj4gPiBtdGtfdmNvZGVj
X2RlY19vcHRlZV9maWxsX3NobSgmY29tbWFuZF9wYXJhbXNbaW5kZXhdLCBzaG1fbWVtcmVmLA0K
PiA+ICsJCQkJCQkgICAgZGF0YSwgaW5kZXgsIGRldik7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiAr
CQkJcmV0dXJuIHJldDsNCj4gDQo+IFNvIGlmIGFueSBvZiB0aGUgaXRlcmF0aW9ucyBvZiB0aGlz
IGxvb3AgZmFpbHMsIHRoZW4gdGhlIGRhdGEgaGFzDQo+IGJlZW4NCj4gcG90ZW50aWFsbHkgY29w
aWVkIHRvIHNldmVyYWwgc2htX21lbXJlZi0+bXNnX3NobV9jYV9idWYgYW5kIHJlbWFpbnMNCj4g
dGhlcmUgdW50aWwNCj4gbmV4dCBjYWxsIHRvIG10a192Y29kZWNfZGVjX29wdGVlX2ZpbGxfc2ht
KCkgZm9yIGEgY29ycmVzcG9uZGluZw0KPiBjYV9idWYuDQo+IEluIG90aGVyIHdvcmRzLCBtdGtf
dmNvZGVjX2RlY19vcHRlZV9maWxsX3NobSgpIGhhcyBtYXliZSBmaWxsZWQNCj4gc2V2ZXJhbA0K
PiBjYV9idWZzLCBidXQgaWYgd2UgcmV0dXJuIHdpdGggZXJyb3IgZnJvbSB0aGlzIGxvb3AgdGhl
IHRlZSBmdW5jdGlvbg0KPiBpcyBub3QNCj4gaW52b2tlZCBidXQgdGhlIGRhdGEgcHJlcGFyZWQg
Zm9yIGl0cyBpbnZvY2F0aW9uIHJlbWFpbnMgaW4gdGhlDQo+IGJ1ZmZlcnMuDQo+IERvbid0IGtu
b3cgaWYgdGhpcyBpcyBhIHByb2JsZW0gb3Igbm90LCBidXQgZ2l2ZW4gd2UncmUgZGVhbGluZyB3
aXRoDQo+IHJlc3RyaWN0ZWQNCj4gYWthIHNlY3VyZSBtZW1vcnkgeW91IG1pZ2h0IHdhbnQgdG8g
dGhpbmsgYWJvdXQgaXQuDQoNClRoZSBpbnZva2UgaW5mb3JtYXRpb24gd2lsbCBiZSBmaWxsZWQg
YWdhaW4gd2hlbiBiZWdpbiB0byBkZWNvZGUNCmFub3RoZXIgZnJhbWUuDQpUaGUgY2EgYnVmZmVy
IGRhdGEgd2lsbCBiZSBvdmVyd3JpdHRlbiBieSBuZXcgZnJhbWUgZGF0YSBhZ2Fpbi4NCg0KQmVz
dCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCg0KPiANCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXQg
PSB0ZWVfY2xpZW50X2ludm9rZV9mdW5jKG9wdGVlX3ByaXZhdGUtPnRlZV92ZGVjX2N0eCwNCj4g
PiAmdHJhbnNfYXJncywgY29tbWFuZF9wYXJhbXMpOw0KPiA+ICsJaWYgKHJldCA8IDAgfHwgdHJh
bnNfYXJncy5yZXQgIT0gMCkgew0KPiA+ICsJCWRldl9lcnIoZGV2LCBNVEtfREJHX1ZDT0RFQ19T
VFIgInRlZSBzdWJtaXQgY29tbWFuZA0KPiA+IGZhaWw6IDB4JXggMHgleC5cbiIsDQo+ID4gKwkJ
CXRyYW5zX2FyZ3MucmV0LCByZXQpOw0KPiA+ICsJCXJldHVybiAocmV0IDwgMCkgPyByZXQgOiB0
cmFuc19hcmdzLnJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwkvKiBjbGVhciBhbGwgYXR0cnMs
IHNldCBhbGwgY29tbWFuZCBwYXJhbSB0byB1bnVzZWQgKi8NCj4gPiArCWZvciAoaW5kZXggPSAw
OyBpbmRleCA8IE1US19PUFRFRV9NQVhfVEVFX1BBUkFNUzsgaW5kZXgrKykgew0KPiA+ICsJCWRh
dGEtPm1zZ19idWZbaW5kZXhdID0gTlVMTDsNCj4gPiArCQlkYXRhLT5tc2dfYnVmX3NpemVbaW5k
ZXhdID0gMDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICtF
WFBPUlRfU1lNQk9MX0dQTChtdGtfdmNvZGVjX2RlY19vcHRlZV9pbnZva2RfY21kKTsNCj4gPiAr
DQo+ID4gK3ZvaWQgKm10a192Y29kZWNfZGVjX2dldF9zaG1fYnVmZmVyX3ZhKHN0cnVjdA0KPiA+
IG10a192ZGVjX29wdGVlX3ByaXZhdGUgKm9wdGVlX3ByaXZhdGUsDQo+ID4gKwkJCQkgICAgICAg
ZW51bSBtdGtfdmRlY19od19pZCBod19pZCwNCj4gPiArCQkJCSAgICAgICBlbnVtIG10a192ZGVj
X29wdGVlX2RhdGFfaW5kZXgNCj4gPiBkYXRhX2luZGV4KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qg
bXRrX3ZkZWNfb3B0ZWVfY2FfaW5mbyAqY2FfaW5mbzsNCj4gPiArDQo+ID4gKwlpZiAoaHdfaWQg
PT0gTVRLX1ZERUNfTEFUMCkNCj4gPiArCQljYV9pbmZvID0gJm9wdGVlX3ByaXZhdGUtPmxhdF9j
YTsNCj4gPiArCWVsc2UNCj4gPiArCQljYV9pbmZvID0gJm9wdGVlX3ByaXZhdGUtPmNvcmVfY2E7
DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGNhX2luZm8tPnNobV9tZW1yZWZbZGF0YV9pbmRleF0ubXNn
X3NobV9jYV9idWY7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19k
ZWNfZ2V0X3NobV9idWZmZXJfdmEpOw0KPiA+ICsNCj4gPiAraW50IG10a192Y29kZWNfZGVjX2dl
dF9zaG1fYnVmZmVyX3NpemUoc3RydWN0DQo+ID4gbXRrX3ZkZWNfb3B0ZWVfcHJpdmF0ZSAqb3B0
ZWVfcHJpdmF0ZSwNCj4gPiArCQkJCSAgICAgICBlbnVtIG10a192ZGVjX2h3X2lkIGh3X2lkLA0K
PiA+ICsJCQkJICAgICAgIGVudW0gbXRrX3ZkZWNfb3B0ZWVfZGF0YV9pbmRleA0KPiA+IGRhdGFf
aW5kZXgpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfdmRlY19vcHRlZV9jYV9pbmZvICpjYV9p
bmZvOw0KPiA+ICsNCj4gPiArCWlmIChod19pZCA9PSBNVEtfVkRFQ19MQVQwKQ0KPiA+ICsJCWNh
X2luZm8gPSAmb3B0ZWVfcHJpdmF0ZS0+bGF0X2NhOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCWNhX2lu
Zm8gPSAmb3B0ZWVfcHJpdmF0ZS0+Y29yZV9jYTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gY2FfaW5m
by0+c2htX21lbXJlZltkYXRhX2luZGV4XS5tc2dfc2htX3NpemU7DQo+ID4gK30NCj4gPiArRVhQ
T1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19kZWNfZ2V0X3NobV9idWZmZXJfc2l6ZSk7DQo+ID4g
ZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMv
ZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19vcHQNCj4gPiBlZS5oDQo+ID4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX29wdA0KPiA+
IGVlLmgNCj4gPiBpbmRleCAyNGFhNjNhZjk4ODcuLmMyNGE1NjdlYzg3NyAxMDA2NDQNCj4gPiAt
LS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIv
bXRrX3Zjb2RlY19kZWNfb3B0DQo+ID4gZWUuaA0KPiA+ICsrKw0KPiA+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19vcHQNCj4g
PiBlZS5oDQo+ID4gQEAgLTYyLDYgKzYyLDE2IEBAIGVudW0gbXRrX3ZkZWNfb3B0ZWVfZGF0YV9p
bmRleCB7DQo+ID4gICAJT1BURUVfTUFYX0lOREVYLA0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICsv
KioNCj4gPiArICogc3RydWN0IG10a192ZGVjX29wdGVlX2RhdGFfdG9fc2htIC0gc2htIGRhdGEg
dXNlZCBmb3IgVEENCj4gPiArICogQG1zZ19idWY6ICAgICBtc2cgaW5mb3JtYXRpb24gdG8gVEEu
DQo+ID4gKyAqIEBtc2dfYnVmX2xlbjogbGVuZ3RoIG9mIG1zZyBpbmZvcm1hdGlvbi4NCj4gPiAr
ICovDQo+ID4gK3N0cnVjdCBtdGtfdmRlY19vcHRlZV9kYXRhX3RvX3NobSB7DQo+ID4gKwl2b2lk
ICptc2dfYnVmW01US19PUFRFRV9NQVhfVEVFX1BBUkFNU107DQo+ID4gKwlpbnQgbXNnX2J1Zl9z
aXplW01US19PUFRFRV9NQVhfVEVFX1BBUkFNU107DQo+ID4gK307DQo+ID4gKw0KPiA+ICAgLyoq
DQo+ID4gICAgKiBzdHJ1Y3QgbXRrX3ZkZWNfb3B0ZWVfcHJpdmF0ZSAtIG9wdGVlIHByaXZhdGUg
ZGF0YQ0KPiA+ICAgICogQHZjb2RlY19kZXY6ICAgICBwb2ludGVyIHRvIHRoZSBtdGtfdmNvZGVj
X2RldiBvZiB0aGUgZGV2aWNlDQo+ID4gQEAgLTEwMiw0ICsxMTIsNDUgQEAgaW50IG10a192Y29k
ZWNfZGVjX29wdGVlX3ByaXZhdGVfaW5pdChzdHJ1Y3QNCj4gPiBtdGtfdmNvZGVjX2RlY19kZXYg
KnZjb2RlY19kZXYpOw0KPiA+ICAgICovDQo+ID4gICB2b2lkIG10a192Y29kZWNfZGVjX29wdGVl
X3JlbGVhc2Uoc3RydWN0IG10a192ZGVjX29wdGVlX3ByaXZhdGUNCj4gPiAqb3B0ZWVfcHJpdmF0
ZSk7DQo+ID4gICANCj4gPiArLyoqDQo+ID4gKyAqIG10a192Y29kZWNfZGVjX29wdGVlX3NldF9k
YXRhIC0gc2V0IGJ1ZmZlciB0byBzaGFyZSBtZW1yZWYuDQo+ID4gKyAqIEB2Y29kZWNfZGV2OiBu
b3JtYWwgd29ybGQgZGF0YSB1c2VkIHRvIGluaXQgb3B0ZWUgc2hhcmUgbWVtb3J5DQo+ID4gKyAq
IEBidWY6IG5vcm1hbCB3b3JsZCBidWZmZXIgYWRkcmVzcw0KPiA+ICsgKiBAYnVmX3NpemU6IGJ1
ZiBzaXplDQo+ID4gKyAqIEBkYXRhX2luZGV4OiBpbmRlbnRpZnkgZWFjaCBzaGFyZSBtZW1vcnkg
aW5mb3JtYWl0b24NCj4gPiArICovDQo+ID4gK3ZvaWQgbXRrX3Zjb2RlY19kZWNfb3B0ZWVfc2V0
X2RhdGEoc3RydWN0DQo+ID4gbXRrX3ZkZWNfb3B0ZWVfZGF0YV90b19zaG0gKmRhdGEsDQo+ID4g
KwkJCQkgICB2b2lkICpidWYsIGludCBidWZfc2l6ZSwNCj4gPiArCQkJCSAgIGVudW0gbXRrX3Zk
ZWNfb3B0ZWVfZGF0YV9pbmRleA0KPiA+IGRhdGFfaW5kZXgpOw0KPiA+ICsNCj4gPiArLyoqDQo+
ID4gKyAqIG10a192Y29kZWNfZGVjX29wdGVlX2ludm9rZF9jbWQgLSBzZW5kIHNoYXJlIG1lbW9y
eSBkYXRhIHRvDQo+ID4gb3B0ZWUgLg0KPiA+ICsgKiBAb3B0ZWVfcHJpdmF0ZTogb3B0ZWUgcHJp
dmF0ZSBjb250ZXh0DQo+ID4gKyAqIEBod19pZDogaGFyZHdhcmUgaW5kZXgNCj4gPiArICogQGRh
dGE6IG5vcm1hbCB3b3JsZCBkYXRhIHVzZWQgdG8gaW5pdCBvcHRlZSBzaGFyZSBtZW1vcnkNCj4g
PiArICovDQo+ID4gK2ludCBtdGtfdmNvZGVjX2RlY19vcHRlZV9pbnZva2RfY21kKHN0cnVjdCBt
dGtfdmRlY19vcHRlZV9wcml2YXRlDQo+ID4gKm9wdGVlX3ByaXZhdGUsDQo+ID4gKwkJCQkgICAg
ZW51bSBtdGtfdmRlY19od19pZCBod19pZCwNCj4gPiArCQkJCSAgICBzdHJ1Y3QgbXRrX3ZkZWNf
b3B0ZWVfZGF0YV90b19zaG0NCj4gPiAqZGF0YSk7DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICog
bXRrX3Zjb2RlY19kZWNfZ2V0X3NobV9idWZmZXJfdmEgLSBjbG9zZSB0aGUgY29tbXVuaWNhdGlv
bg0KPiA+IGNoYW5uZWxzIHdpdGggVEEuDQo+IA0KPiBUaGlzIGNvbW1lbnQgaXMgbW9zdCBsaWtl
bHkgaW5jb3JyZWN0Lg0KPiANCj4gPiArICogQG9wdGVlX3ByaXZhdGU6IG9wdGVlIHByaXZhdGUg
Y29udGV4dA0KPiA+ICsgKiBAaHdfaWQ6ICAgICAgICAgaGFyZHdhcmUgaW5kZXgNCj4gPiArICog
QEBkYXRhX2luZGV4OiBpbmRlbnRpZnkgZWFjaCBzaGFyZSBtZW1vcnkgaW5mb3JtYWl0b24NCj4g
PiArICovDQo+ID4gK3ZvaWQgKm10a192Y29kZWNfZGVjX2dldF9zaG1fYnVmZmVyX3ZhKHN0cnVj
dA0KPiA+IG10a192ZGVjX29wdGVlX3ByaXZhdGUgKm9wdGVlX3ByaXZhdGUsDQo+ID4gKwkJCQkg
ICAgICAgZW51bSBtdGtfdmRlY19od19pZCBod19pZCwNCj4gPiArCQkJCSAgICAgICBlbnVtIG10
a192ZGVjX29wdGVlX2RhdGFfaW5kZXgNCj4gPiBkYXRhX2luZGV4KTsNCj4gPiArDQo+ID4gKy8q
Kg0KPiA+ICsgKiBtdGtfdmNvZGVjX2RlY19nZXRfc2htX2J1ZmZlcl9zaXplIC0gY2xvc2UgdGhl
IGNvbW11bmljYXRpb24NCj4gPiBjaGFubmVscyB3aXRoIFRBLg0KPiANCj4gQW5kIHNvIGlzIHRo
aXMgb25lLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEFuZHJ6ZWoNCj4gDQo+ID4gKyAqIEBvcHRl
ZV9wcml2YXRlOiBvcHRlZSBwcml2YXRlIGNvbnRleHQNCj4gPiArICogQGh3X2lkOiAgICAgICAg
IGhhcmR3YXJlIGluZGV4DQo+ID4gKyAqIEBAZGF0YV9pbmRleDogaW5kZW50aWZ5IGVhY2ggc2hh
cmUgbWVtb3J5IGluZm9ybWFpdG9uDQo+ID4gKyAqLw0KPiA+ICtpbnQgbXRrX3Zjb2RlY19kZWNf
Z2V0X3NobV9idWZmZXJfc2l6ZShzdHJ1Y3QNCj4gPiBtdGtfdmRlY19vcHRlZV9wcml2YXRlICpv
cHRlZV9wcml2YXRlLA0KPiA+ICsJCQkJICAgICAgIGVudW0gbXRrX3ZkZWNfaHdfaWQgaHdfaWQs
DQo+ID4gKwkJCQkgICAgICAgZW51bSBtdGtfdmRlY19vcHRlZV9kYXRhX2luZGV4DQo+ID4gZGF0
YV9pbmRleCk7DQo+ID4gKw0KPiA+ICAgI2VuZGlmIC8qIF9NVEtfVkNPREVDX0ZXX09QVEVFX0hf
ICovDQo+IA0KPiANCg==
