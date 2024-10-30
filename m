Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398979B5D82
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 09:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FB310E2AC;
	Wed, 30 Oct 2024 08:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JRZGFANg";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hN9zqaY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6BE10E2AC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 08:21:06 +0000 (UTC)
X-UUID: e78cc880969711efbd192953cf12861f-20241030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3ZuCe9PVd92mIoT2hqIsjawZqb4GYEgrmfIvwu5YlgY=; 
 b=JRZGFANgAOuZTcVTTh9zESgBfsUZeAwsizqR036PGPfDQaTmUGtKOtxy8+2R0pKF6M29Wr8hED5l0FJZxDN0nTcEDv6anhE9P27jJ6pViG23L2lPKQ5OkXiS0BC8d5Ad+6ukwAe5RF+XsGdG/23mc+2swG64RLFyulymsgXDbkQ=;
X-CID-CACHE: Type:Local,Time:202410301621+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:4a30e896-b943-40bc-a421-d3cd1570bc18, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:62d748e7-cb6b-4a59-bfa3-98f245b4912e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e78cc880969711efbd192953cf12861f-20241030
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2136976471; Wed, 30 Oct 2024 16:21:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Oct 2024 16:20:59 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 16:20:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNK9zcEn+25J5+83yHh49/STtR6MZDkG6Ejks6JMJOoOdMEKqAKcFf8DRa7IYP4vm0nh93eYdtInOU2eTyoz0VHsHYuCu/efgQotBVMx0htE7/GUia03nIAAbx6dRGiB4iJ6u/JLtdbKdq6vOL72Jy+eRff1NNG+ytUVEl6l1MpIYie0chhn6lkNXMRiAgwtrpkmjHOTHXItWs6KKiglEWZUZtuWyqrDJCmHdVH1mzEmSrRDtJkc+LpDIVbNUGT2kADbc49HoiF22/G9RvWIgVAk+X6MrQk2skI6cNPhTuEhJyKoiF4Ba7tgKJnNxJqrZ6A4jEbmfnVRCtrcyHgx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVeb6B1b0towaKguN5/MD2xIOCdLDot8TrdqvE+k2S4=;
 b=eZctbLw1OS12tnNxUeu1Q3f25VCXOPZ0VYjwcnL8ORbkHnLRAsSycR14tHu0qpmbZgERS33PP8MUm3PK+xcUqyFCrENFlGQw86CxWYJjS0RIDqCo3nftsVCAB/IzWtYO1GT4uaZ0VpmBu8wVEvATdZxoj4MF35nfVuJvAEbbkLdjThmXcHO7+cjXhVZKVBvej2BpPMW5ovfj/FDugZvxR69R3LFS7EH7DqGqUBs5URQHLY2UhOerp/0k4Yw9q8XwNddzV+cceeBnNGPb7NIJ8uG2BhpkYUqiqaPeVosfl6OaAP+Iv23fZSAwxdtPA4RLbVRBoDKX1LIclBeR7MJYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVeb6B1b0towaKguN5/MD2xIOCdLDot8TrdqvE+k2S4=;
 b=hN9zqaY0hNSSodZ3OoqClJOaV3AISyoLF2b+DAIttnGC9ppYt3C1j5LVgq5Dy6BGmXyxytigssS98osYKxCjb/rQTMrNr5SGsOSnpPVbkJIUrez0bsMNWkWDn+QoQAkIpDstJizuwVOaH3qgvo+7kLEtmPyvCETuz5f6xIprDMA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7255.apcprd03.prod.outlook.com (2603:1096:301:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 08:20:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Wed, 30 Oct 2024
 08:20:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
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
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLKf1g4A
Date: Wed, 30 Oct 2024 08:20:55 +0000
Message-ID: <a292c445fa662b0af54c47b192e281490636bdd0.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7255:EE_
x-ms-office365-filtering-correlation-id: 097416ce-b59e-48eb-7b91-08dcf8bbc6dc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R3U4cWlIK1k4WFBFcnpvK1NBT0FOdzlLUWRHeEhMWXB2ZjFvc2R3T2NSOEdx?=
 =?utf-8?B?TjV6SW5UbGorTzFoblg3WlZtd3NnWHZqQWs2UCttbWhYcGVwSE1HaG5STldm?=
 =?utf-8?B?RTVXZFNzRnljYmZFeVNPZjlkdm8xZnN6SUNIYTJZYk9mTTBaa3R2UGM5YUk5?=
 =?utf-8?B?VDM4ZXY1R2I5R3laOGJHY1NTZCthVldlTktsRUJaMUpBeFB3SXkrSTRDUGda?=
 =?utf-8?B?TG03NHBmT2g3UlFod2JjdTN1QjZ6Nlc2SHFOMklJOUF6Z0JKZFpyZ3pESTNP?=
 =?utf-8?B?d1pGZWxTc2d1MERSZkVTdDREUmpPMHhIUmJnaUh4NWJyWnUxOGl1QVR2OVlj?=
 =?utf-8?B?cXpZSE5HV29JcldrR25NRGRJVUlqdFJvMXVHdHdQUkVNYlhDa242Rng5d3hh?=
 =?utf-8?B?T2xHVnhCT014bHdjZlllK1FrWUdZODltKzNxOURtUmREOVJzbjFmdEthL0c0?=
 =?utf-8?B?UUh3STJseWpGV1JaMU1GUzZ0MThlamZSU2tPeDJ4ZmZKVjRiNjFmZWtubTVW?=
 =?utf-8?B?TlBMMzBWdzhvQno4bysyb0tFcmIxZVBqR25xZHE1WWRmc2hTOGF1bXNEd0dN?=
 =?utf-8?B?bytlelEvaUdQU09ZVXduQ2N6Q0N6SFAyWXpTcVFEb3dUa3hjdjF2eHloa2RM?=
 =?utf-8?B?Nk9SR05FQ3NBSXNyNGYzUS9qcERzVEd1WGhUb3g0WVZrTzhkczdzQmNQbFNL?=
 =?utf-8?B?Z3ZvRnBvWW14WkU2YjV2anNCZEYwVC9FOGVlTlEwVlJhZDYydUxCc1VUQ1BS?=
 =?utf-8?B?TUw0WkRuUUdQbzQ2YzR0QWpnck1RK01NWGZwMEVMMklUaWZxalQ2cm5uaXhk?=
 =?utf-8?B?citTTys1NzkxOTZlbm1mWjlIcHZiVUt1Q0U5VEhRSU9QdDhHY0NzMllYWFlV?=
 =?utf-8?B?UFh0endMQ2NYejl5cm43RW1sV2FCUGY3aFU3MURJUTNScUF0bHdJSHJDaXdq?=
 =?utf-8?B?cmxhUVFJMjVLZks2dnhlVDZFTUxrNnRidkVMWEptU3BqcVJYMEwvNDYrNTU3?=
 =?utf-8?B?S0JMeWxXdmI3a3hRT3hEb3JvNGRIVDcxQnBuL0tocjlDcUgvWDFnb09Lb1dn?=
 =?utf-8?B?UndEcit4OHdDU1V2bEdERHRGUVZ2SzhLc1NNS2t0QTFHS3RrcVFDMlZDRENh?=
 =?utf-8?B?OUZObXdXYkxNWGNnY0lOQ3BjejUrUTFDMGc3eE8zK2ZmZjloOGdiTGhOd1VC?=
 =?utf-8?B?WENBTURrcTNZd0UyYVRsVjRXYzdhbVpmcmRqVEphR0d3alNxSFRVQ0N5UUp4?=
 =?utf-8?B?SG10ZHZiVzJmMzRmYTF0S01JS0w5VG1TUHJPVWJRUStTU0Jua0RucW5GOHlC?=
 =?utf-8?B?Y01rNlNpczdSc2syTTBSYUg2TklUNWRKOWluSFl1d2VwRERDUWVnenBqVkp4?=
 =?utf-8?B?RTc5MDhSYlVFamlBWjdBUlU2dmphL3NYTlZEMXdkWWk0cDlLTm9LQ0c1b0I5?=
 =?utf-8?B?cFhuK0NVUm12T09qay83TVExbzRPRUo0NHV0clVyMUdPUGZPUlJjeTdsanRB?=
 =?utf-8?B?c3RSLzJ2bStRT2swT01rU0NOdmhuczI0engya2ZhV3RSUUowQ1FSVkZWYnBu?=
 =?utf-8?B?UDNzWlIwSnAyTnV4dy9aWDJETlJ2V0hVWE02bWg5R3B3NzFHYkJnQTFaMjh1?=
 =?utf-8?B?VlY4QmxEVnQxcUExZFZ5ZVR3bnhXeU1EdUVwU01Ga0wxamY3Sm1RQngzWVhx?=
 =?utf-8?B?bTZmTkZTQVpPVFFwUWltY3QwOS9mUHptcTNjTkNYWW14bUNUOTNnVTlmL3ZW?=
 =?utf-8?B?RitLNjJhcFB5bFFNOXpKZllQbFUwVTVKcEg4NWwrNmw5Tk9jbk0yUVhzZ3VJ?=
 =?utf-8?B?TTI3NC8wS0Iza0xTUEx0MC9OdTh5SXpIUmJZVTBoWWR0VTJ4V216TXRPMU90?=
 =?utf-8?Q?C2TUy4jekyylg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE9PQmhzV0k3RVQ0NkpKYzJqbTg4eTdKVnVXcTJOempEM1RydFVnVWoyNWtw?=
 =?utf-8?B?TVdFcytwc0VMUlUrM0xQRXBEUHdkelpMQkJMMzVZL0ZlSnR5NWYreFBqNzRK?=
 =?utf-8?B?bCtRdjlSU3JLR0NpWkdRSnk4UTRhMm1lYWxIQ2FvRGRyaGt3aGJOc3JzZXBr?=
 =?utf-8?B?NFdpMlZRQWQ0VTBYU2VMOU5UY1htRUptUjNFQTFlVk54eWN0b2ZlVjJJbUds?=
 =?utf-8?B?bytqOHNqbVJRU3FDeVltNUVqNzhkbjV5NXVBSmVFL3JwbnozUE9CNXVTRjcy?=
 =?utf-8?B?NE1VeXBmczg4YWhkZHZ4MUk1Z01EcWM1TjMyYXRFQlhWYWRkL0k2UGttN1Np?=
 =?utf-8?B?OVc1VWdrTG1oOC81bVI3Qi9vN0JnR2FOaG9VTk90VXVuZjlHZkVYQUZVcitt?=
 =?utf-8?B?TnZJSGFOZHZlOWZLem1EQ3VEbnFKRFJLNGVtZTdJbzlyYzZvZzJzcktIRHZy?=
 =?utf-8?B?SkpCeFR1cmNnZUs1YmJwQ1cyejlPYjZxQmk0cW1kdi8vK2FGV0VzcGJjbmVu?=
 =?utf-8?B?YndkUDZ6Yy9DOFg4UmwzY24xSGovYXEyazVRNFJyMzVVWkxnM01iUDIvSEQ1?=
 =?utf-8?B?cDFTdHlpaVBvREVtUXpGTXdYZi9GQlhWa2JndDhoNWpxSnk1V3RrYU0rNWpC?=
 =?utf-8?B?bU5uV3lVcFpyLytHTExScktOUzRYZFE1SjVzL1NibENnRmw1K3ZQemR3Q2hu?=
 =?utf-8?B?UlNSYUhMcEFSM29vTDA3a1ozN2JMc2VMa2I5YVJVaE9LZjVQSnBXUDZyUUEy?=
 =?utf-8?B?Y1FjS20yR2taU21RcFlFck02Q1JuSVR0aUViaDFSVE1TVkFEbDhKWlE4b291?=
 =?utf-8?B?d1dvOGlOR09XMVBSMDlhTVUvNWMzR2k5L2pvUFNRbi9kQmpPSlV1djNVc1Ur?=
 =?utf-8?B?UjBNa2xDNC83Mnh3MDVaZm5lOWYwMnFTdGFiV0MvQW9MWlZwcWRBWHFPQis0?=
 =?utf-8?B?ckp2SjIwWUJwQVpNeFE3MTNkNU96czljbWM4VmZOWU8ydk9Kd2xRY28yM1Er?=
 =?utf-8?B?SzdCUXJWNHZRSUp5TTRVR1EwZmlQUER3OTVqVlowTUtDUGxHb0ZWZkQ2Vk1n?=
 =?utf-8?B?SlJtd3FrWitpTGJXOU9TcW1NeFQwbnJWRjUrTkNPM2NmZU1pRThhcmlmNFBT?=
 =?utf-8?B?RlFEY0FCRXk2QzFTeW4xQmpxQmVZUVNVeC9jT1o4S3RuZktraEtwSUJWUC9I?=
 =?utf-8?B?RktoQ3RUOGhOTXpNZ2lOUWxqWUZXekhoZFFTU045d0d0eEdDY2F0SHdxc2lU?=
 =?utf-8?B?SldJY1l4Q21xUzZoaVpiMmhCUnVYNTNWdTNoWHNRcjhVWFgvaVNjeEI4WmQr?=
 =?utf-8?B?VEVZOCtBQUJFMEVTeVkwOXVpckowdnluZ3NXSzNha1NkdUUyaHVTOU8xMHBw?=
 =?utf-8?B?cUZiaXlsSUxHMis5WEdPaXViNVk3SU9Ra0pqZ3dLbzA4SCtFTEdzZ3BaOGgw?=
 =?utf-8?B?UUR5dllpVFZTTUFhWVFKQk9hais4Vm5tQUZKL2Z2cnprR0drTWR0WDFFbU9S?=
 =?utf-8?B?d2dhQnJLZktFLzU1bE80OUVPTVdKcFI4b0gvd2ZWQmhRMG9sZ2VGVVJ6UEFR?=
 =?utf-8?B?enpmQ1VtZ2MxZ2pEMGxCc3dreTByeStzTjVLSGVWODI4VktiN1Juc3AzVnY0?=
 =?utf-8?B?cGFGOVBJOEhCamdFVllKd09jSmdtalFPeXEzS1RTemg1dHU1QzB5aWFNVEhn?=
 =?utf-8?B?Q3ExQTBkcDNUNjNhS1F4eFBMaWd4eUxQOVNYSkFqNVhoYXY2eU1LU3ZJR0w1?=
 =?utf-8?B?NkNKditCRldocmFvVitaNE5RVzRVTlNGWGhXMDBFemwvRkxZN0JaYzBZaXN6?=
 =?utf-8?B?SU1ka3NVRzVUNjVNWitLY0pFRWp3R1Nqd08zeXBSOFZ0N0NzMC9aZzA2aGVJ?=
 =?utf-8?B?d3NnK1gxY2lBMm9yOGZuZ3lPMGUyaEkzZzliQTk2NnRMQUdJcUdUNGtsc05a?=
 =?utf-8?B?VGVRZHZ6ZFJpSU5WNEovT3AzUU9BRGIySTBCeGZjYXRoQWkwVmpYa2JXNlJ1?=
 =?utf-8?B?dStyYm9jU01OaHBGMHU3d0FkVnh0NFQxektMa1JNcXRmRDFvZVJBNXFTczNu?=
 =?utf-8?B?bHlUd3I3bnBsZjdsQ05vekxZZnpRSW5lNnEzRkoxa2hwNVBsZnpNQ1MrSUw2?=
 =?utf-8?Q?h3bnf6luFQ1Z7SzFdIjMKTkTA?=
Content-ID: <82808B24D4B347429122931938992F3A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097416ce-b59e-48eb-7b91-08dcf8bbc6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 08:20:55.8507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16y5v8KTHBV3RlMxKS+eDGzDdk5vzwftaeZgs7CfzT3h5au5Gl8i64lm0Px520UmGB0L8KDpD4N6rEYOqltLdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7255
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.862400-8.000000
X-TMASE-MatchedRID: oTBA/+sdKabPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxXA7rTaHAw771A
 /V6RVDjDMqtZwXDJcJxiPmy8WTo67rNUVnqixiMOGVyS87Wb4lzSv+oK79xjnUYvSDWdWaRh8ha
 W4U9IrFqFWYX2TPbDEjkjHQF/IwVgKQ54kjEfuxWiAZ3zAhQYgmah98LPRzqEjlFfNjQx+AJVJ0
 ADqZV4hn8XMBMHFSej7KGNpgCqvMjlRxm3A2wKutIFVVzYGjNKWQy9YC5qGvy2s0ar5ZAS9Ku6x
 VHLhqfxWBd6ltyXuvuoyVChg0+eGQOqSbHeP93tbVuYoK2a1M+kdDrypzhspa1E3v/+Ihx3psYw
 zIU6Buy+m1x0G9xVtwQ81pP+O8P1FhfAXUMqJGj8DYAMxfNdesTcZRBQ3ORlx7TAT/418tn4dFD
 MTTdqtlRjIYeif4m6ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.862400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 62BCE708F759A08427F1DC06E4465193D7F5F877D207E1D8CEDD35691751563A2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1945526031.1228557487"
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

--__=_Part_Boundary_001_1945526031.1228557487
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
DQoNCj4gKw0KPiArc3RhdGljIGludCBkcF90eF9oZGNwMnhfcmVhZF9yZXBfc2VuZF9yZWN2aWRf
bGlzdChzdHJ1Y3QgbXRrX2hkY3BfaW5mbyAqaGRjcF9pbmZvKQ0KPiArew0KPiArCXN0cnVjdCBt
dGtfZHAgKm10a19kcCA9IGNvbnRhaW5lcl9vZihoZGNwX2luZm8sIHN0cnVjdCBtdGtfZHAsIGhk
Y3BfaW5mbyk7DQo+ICsJdTggcnhfc3RhdHVzID0gMDsNCj4gKwlzc2l6ZV90IHJldDsNCj4gKw0K
PiArCWRldl9kYmcobXRrX2RwLT5kZXYsICJbSERDUDIuWF0gSERDUF8yXzJfUkVQX1NFTkRfUkVD
VklEX0xJU1RcbiIpOw0KPiArDQo+ICsJZHBfdHhfaGRjcDJ4X3dhaXRfZm9yX2NwX2lycShoZGNw
X2luZm8sIEhEQ1BfMl8yX1JFQ1ZJRF9MSVNUX1RJTUVPVVRfTVMpOw0KPiArCWhkY3BfaW5mby0+
aGRjcDJfaW5mby5jcF9pcnFfY2FjaGVkID0gYXRvbWljX3JlYWQoJmhkY3BfaW5mby0+aGRjcDJf
aW5mby5jcF9pcnEpOw0KPiArDQo+ICsJcmV0ID0gZHJtX2RwX2RwY2RfcmVhZCgmbXRrX2RwLT5h
dXgsIERQX0hEQ1BfMl8yX1JFR19SWFNUQVRVU19PRkZTRVQsICZyeF9zdGF0dXMsDQo+ICsJCQkg
ICAgICAgSERDUF8yXzJfRFBfUlhTVEFUVVNfTEVOKTsNCj4gKwlpZiAocmV0ICE9IEhEQ1BfMl8y
X0RQX1JYU1RBVFVTX0xFTikNCj4gKwkJcmV0dXJuIHJldCA+PSAwID8gLUVJTyA6IHJldDsNCj4g
Kw0KPiArCWlmICghSERDUF8yXzJfRFBfUlhTVEFUVVNfUkVBRFkocnhfc3RhdHVzKSkgew0KPiAr
CQlkZXZfZXJyKG10a19kcC0+ZGV2LCAiW0hEQ1AyLlhdIFJYIHN0YXR1cyBubyByZWFkeVxuIik7
DQo+ICsJCXJldHVybiAtRUFHQUlOOw0KDQpJbiBbMV0sIGludGVsIHJldHVybiAtRVRJTUVPVVQg
YW5kIG5vdCByZXRyeS4gTWF5YmUgcmV0dXJuIC1FVElNRU9VVCBpcyBiZXR0ZXI/DQoNClsxXSBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2hkY3Au
Yz9oPXY2LjEyLXJjNSNuNDI4DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJfQ0KPiArDQo+ICsJcmV0
ID0gZHJtX2RwX2RwY2RfcmVhZCgmbXRrX2RwLT5hdXgsIERQX0hEQ1BfMl8yX1JFUF9TRU5EX1JF
Q1ZJRF9MSVNUX09GRlNFVCwNCj4gKwkJCSAgICAgICBoZGNwX2luZm8tPmhkY3AyX2luZm8uaGRj
cF9yeC5yZWN2aWRfbGlzdC5yeF9pbmZvLA0KPiArCQlIRENQXzJfMl9SWElORk9fTEVOKTsNCj4g
KwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCWhkY3BfaW5mby0+aGRj
cDJfaW5mby5kZXZpY2VfY291bnQgPQ0KPiArCShIRENQXzJfMl9ERVZfQ09VTlRfSEkoaGRjcF9p
bmZvLT5oZGNwMl9pbmZvLmhkY3BfcngucmVjdmlkX2xpc3QucnhfaW5mb1swXSkgPDwgNCB8DQo+
ICsJSERDUF8yXzJfREVWX0NPVU5UX0xPKGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3J4LnJl
Y3ZpZF9saXN0LnJ4X2luZm9bMV0pKTsNCj4gKw0KPiArCXJldCA9IGRybV9kcF9kcGNkX3JlYWQo
Jm10a19kcC0+YXV4LCBEUF9IRENQXzJfMl9SRUdfU0VRX05VTV9WX09GRlNFVCwNCj4gKwkJCSAg
ICAgICBoZGNwX2luZm8tPmhkY3AyX2luZm8uaGRjcF9yeC5yZWN2aWRfbGlzdC5zZXFfbnVtX3Ys
DQo+ICsJCUhEQ1BfMl8yX1NFUV9OVU1fTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0
dXJuIHJldDsNCj4gKw0KPiArCXJldCA9IGRybV9kcF9kcGNkX3JlYWQoJm10a19kcC0+YXV4LCBE
UF9IRENQXzJfMl9SRUdfVlBSSU1FX09GRlNFVCwNCj4gKwkJCSAgICAgICBoZGNwX2luZm8tPmhk
Y3AyX2luZm8uaGRjcF9yeC5yZWN2aWRfbGlzdC52X3ByaW1lLA0KPiArCQlIRENQXzJfMl9WX1BS
SU1FX0hBTEZfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0K
PiArCXJldCA9IGRybV9kcF9kcGNkX3JlYWQoJm10a19kcC0+YXV4LCBEUF9IRENQXzJfMl9SRUdf
UkVDVl9JRF9MSVNUX09GRlNFVCwNCj4gKwkJCSAgICAgICBoZGNwX2luZm8tPmhkY3AyX2luZm8u
aGRjcF9yeC5yZWN2aWRfbGlzdC5yZWNlaXZlcl9pZHMsDQo+ICsJCWhkY3BfaW5mby0+aGRjcDJf
aW5mby5kZXZpY2VfY291bnQgKiBIRENQXzJfMl9SRUNFSVZFUl9JRF9MRU4pOw0KPiArCWlmIChy
ZXQgPCAwKQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsN
Cg==

--__=_Part_Boundary_001_1945526031.1228557487
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
bmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hk
Y3AyeF9yZWFkX3JlcF9zZW5kX3JlY3ZpZF9saXN0KHN0cnVjdCYjMzI7bXRrX2hkY3BfaW5mbyYj
MzI7KmhkY3BfaW5mbykNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfZHAm
IzMyOyptdGtfZHAmIzMyOz0mIzMyO2NvbnRhaW5lcl9vZihoZGNwX2luZm8sJiMzMjtzdHJ1Y3Qm
IzMyO210a19kcCwmIzMyO2hkY3BfaW5mbyk7DQomZ3Q7JiMzMjsrdTgmIzMyO3J4X3N0YXR1cyYj
MzI7PSYjMzI7MDsNCiZndDsmIzMyOytzc2l6ZV90JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsrZGV2X2RiZyhtdGtfZHAtJmd0O2RldiwmIzMyOyZxdW90O1tIRENQMi5YXSYjMzI7SERD
UF8yXzJfUkVQX1NFTkRfUkVDVklEX0xJU1QmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7K2RwX3R4X2hkY3AyeF93YWl0X2Zvcl9jcF9pcnEoaGRjcF9pbmZvLCYjMzI7SERDUF8y
XzJfUkVDVklEX0xJU1RfVElNRU9VVF9NUyk7DQomZ3Q7JiMzMjsraGRjcF9pbmZvLSZndDtoZGNw
Ml9pbmZvLmNwX2lycV9jYWNoZWQmIzMyOz0mIzMyO2F0b21pY19yZWFkKCZhbXA7aGRjcF9pbmZv
LSZndDtoZGNwMl9pbmZvLmNwX2lycSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9
JiMzMjtkcm1fZHBfZHBjZF9yZWFkKCZhbXA7bXRrX2RwLSZndDthdXgsJiMzMjtEUF9IRENQXzJf
Ml9SRUdfUlhTVEFUVVNfT0ZGU0VULCYjMzI7JmFtcDtyeF9zdGF0dXMsDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtIRENQXzJfMl9EUF9SWFNUQVRVU19MRU4p
Ow0KJmd0OyYjMzI7K2lmJiMzMjsocmV0JiMzMjshPSYjMzI7SERDUF8yXzJfRFBfUlhTVEFUVVNf
TEVOKQ0KJmd0OyYjMzI7K3JldHVybiYjMzI7cmV0JiMzMjsmZ3Q7PSYjMzI7MCYjMzI7JiM2Mzsm
IzMyOy1FSU8mIzMyOzomIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KCFI
RENQXzJfMl9EUF9SWFNUQVRVU19SRUFEWShyeF9zdGF0dXMpKSYjMzI7ew0KJmd0OyYjMzI7K2Rl
dl9lcnIobXRrX2RwLSZndDtkZXYsJiMzMjsmcXVvdDtbSERDUDIuWF0mIzMyO1JYJiMzMjtzdGF0
dXMmIzMyO25vJiMzMjtyZWFkeSYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjst
RUFHQUlOOw0KDQpJbiYjMzI7WzFdLCYjMzI7aW50ZWwmIzMyO3JldHVybiYjMzI7LUVUSU1FT1VU
JiMzMjthbmQmIzMyO25vdCYjMzI7cmV0cnkuJiMzMjtNYXliZSYjMzI7cmV0dXJuJiMzMjstRVRJ
TUVPVVQmIzMyO2lzJiMzMjtiZXR0ZXImIzYzOw0KDQpbMV0mIzMyO2h0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfaGRjcC5jJiM2MztoPXY2LjEyLXJj
NSNuNDI4DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYj
MzI7K3JldCYjMzI7PSYjMzI7ZHJtX2RwX2RwY2RfcmVhZCgmYW1wO210a19kcC0mZ3Q7YXV4LCYj
MzI7RFBfSERDUF8yXzJfUkVQX1NFTkRfUkVDVklEX0xJU1RfT0ZGU0VULA0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRjcF9pbmZvLSZndDtoZGNwMl9pbmZv
LmhkY3BfcngucmVjdmlkX2xpc3QucnhfaW5mbywNCiZndDsmIzMyOytIRENQXzJfMl9SWElORk9f
TEVOKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOyty
ZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytoZGNwX2luZm8tJmd0O2hkY3Ay
X2luZm8uZGV2aWNlX2NvdW50JiMzMjs9DQomZ3Q7JiMzMjsrKEhEQ1BfMl8yX0RFVl9DT1VOVF9I
SShoZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRjcF9yeC5yZWN2aWRfbGlzdC5yeF9pbmZvWzBd
KSYjMzI7Jmx0OyZsdDsmIzMyOzQmIzMyO3wNCiZndDsmIzMyOytIRENQXzJfMl9ERVZfQ09VTlRf
TE8oaGRjcF9pbmZvLSZndDtoZGNwMl9pbmZvLmhkY3BfcngucmVjdmlkX2xpc3QucnhfaW5mb1sx
XSkpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3JldCYjMzI7PSYjMzI7ZHJtX2RwX2RwY2RfcmVh
ZCgmYW1wO210a19kcC0mZ3Q7YXV4LCYjMzI7RFBfSERDUF8yXzJfUkVHX1NFUV9OVU1fVl9PRkZT
RVQsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZGNwX2lu
Zm8tJmd0O2hkY3AyX2luZm8uaGRjcF9yeC5yZWN2aWRfbGlzdC5zZXFfbnVtX3YsDQomZ3Q7JiMz
MjsrSERDUF8yXzJfU0VRX05VTV9MRU4pOw0KJmd0OyYjMzI7K2lmJiMzMjsocmV0JiMzMjsmbHQ7
JiMzMjswKQ0KJmd0OyYjMzI7K3JldHVybiYjMzI7cmV0Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
K3JldCYjMzI7PSYjMzI7ZHJtX2RwX2RwY2RfcmVhZCgmYW1wO210a19kcC0mZ3Q7YXV4LCYjMzI7
RFBfSERDUF8yXzJfUkVHX1ZQUklNRV9PRkZTRVQsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtoZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRjcF9yeC5yZWN2
aWRfbGlzdC52X3ByaW1lLA0KJmd0OyYjMzI7K0hEQ1BfMl8yX1ZfUFJJTUVfSEFMRl9MRU4pOw0K
Jmd0OyYjMzI7K2lmJiMzMjsocmV0JiMzMjsmbHQ7JiMzMjswKQ0KJmd0OyYjMzI7K3JldHVybiYj
MzI7cmV0Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3JldCYjMzI7PSYjMzI7ZHJtX2RwX2RwY2Rf
cmVhZCgmYW1wO210a19kcC0mZ3Q7YXV4LCYjMzI7RFBfSERDUF8yXzJfUkVHX1JFQ1ZfSURfTElT
VF9PRkZTRVQsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjto
ZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRjcF9yeC5yZWN2aWRfbGlzdC5yZWNlaXZlcl9pZHMs
DQomZ3Q7JiMzMjsraGRjcF9pbmZvLSZndDtoZGNwMl9pbmZvLmRldmljZV9jb3VudCYjMzI7KiYj
MzI7SERDUF8yXzJfUkVDRUlWRVJfSURfTEVOKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7
Jmx0OyYjMzI7MCkNCiZndDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsm
IzMyOytyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQo8L3ByZT4NCjwv
cD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_001_1945526031.1228557487--

