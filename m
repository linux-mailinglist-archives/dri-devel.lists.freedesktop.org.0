Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65CAC5EEA
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 03:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E235E10E196;
	Wed, 28 May 2025 01:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="m+iKDXNr";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="oUoMqQjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F0A10E196
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 01:52:14 +0000 (UTC)
X-UUID: 5dbf2dc23b6611f082f7f7ac98dee637-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pkEcvditwXh5vzhYTsbI9Foj9Y8QqtBCL85MI0vbYM4=; 
 b=m+iKDXNrIpCRktScPusCezGkcOtkvcpacKRBSV+yKXT3bXpobm/ICoNvPLc9GLa44SUqGoo04LVKtQjz/NEqkp3+GaLIbW1oqXZdpPBPI6MvxuT0TflDe2aFMac0RMytNIeL+jrPU2SSjN1LaFgt1mlOT3fMIsOOo3hY7stsIRg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:553410bf-bfa4-405a-af74-d864f3406a76, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:94280c58-abad-4ac2-9923-3af0a8a9a079,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5dbf2dc23b6611f082f7f7ac98dee637-20250528
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1883304946; Wed, 28 May 2025 09:52:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 09:52:07 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 09:52:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpLt+IVtHKbDbifLfQQp5xE8eZLU4+pE9QauellbK+V9uyIzjYggWVKMpE8Fkz5TeCRdnLZUHE9CPta3YbGxrAWP4jZzn9tgz/ARUH5hfPuU6Kkpxns6qMAP9LvJrPquaauqQt/85muSN3NOvbzJL2Fl1kvuPw10q05mBRhuSSq3/sCfW/feIJzSzXe/WH+Nnho5e8UauO1fJkhaUZCGkA+Q9uDSF+BBqpqtmAKj8i8lHDLhNoKdxIpoMxj+MiR9Kxsby7M+wFc3ZL+ID4nShbLRcVT0TT6QHSRN93RitXvFRC8F8FaQqIDyvzDLEMVBff4b2lbBB2G9rjpnq9jxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxtFuMmExtnDwy2WGLPBHRn9gVrEbR2HtTTe4DgQpYQ=;
 b=RCd6T5KhYpgZ9uTop6u2l3ngrnByUKsQKme7WP7Ipwn8OzVo4/vHw/bt7yihYvfsdPbRPfKSUYzrIqvyARX23DTyJvgZdfEmUKfn+OPwY994V4tE6sKWWalxhPLARhyHy748cjhTMKbyvxJFu8Sn1rCAVijCKp6UMlwUX8SFGdRBRJc6gkgDhW3GkyUtJ2m+Y98t3fF6PypO/n0GXkudlO6jCWXYZ0GbAyu4HoLElHUj5rGLx9mdgD8bfcXEDv+Pot1544mtjA342IG+aKPyrHm4edTJER2CcDOco8wMY2c8zwZvgpnjVw8mOrJrNUkP2PXntVhS8DNkunDhcbeqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxtFuMmExtnDwy2WGLPBHRn9gVrEbR2HtTTe4DgQpYQ=;
 b=oUoMqQjf8Yx4p3KXU4+TPnq4GRswGEyxVed5n4wrzFzYhMpy5PA3GuQ2lFhAAOkg41MCYa5ZlC9V4jb4ZlQjTu0fkReu2QwCfwqqv0A6jTk3KhuDIEArOQyj2XFNDr+96dIcekJ3kLdzQIxJtehb0IoXX29pL0ciOobDi2hEQJ4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7794.apcprd03.prod.outlook.com (2603:1096:101:16a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 01:52:05 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 01:52:04 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?QmluY2FpIExpdSAo5YiY5b2s5omNKQ==?= <Bincai.Liu@mediatek.com>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/5] drm/mediatek: Add eDP phy driver for mt8196
Thread-Topic: [PATCH 5/5] drm/mediatek: Add eDP phy driver for mt8196
Thread-Index: AQHbsC6nILm1Pp5FREq+iYpjFG3Z8LPnhdqA
Date: Wed, 28 May 2025 01:52:04 +0000
Message-ID: <912b07f99e5a8757fbd5934c0b72779b1be31bb4.camel@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
 <20250418065313.8972-6-bincai.liu@mediatek.com>
In-Reply-To: <20250418065313.8972-6-bincai.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7794:EE_
x-ms-office365-filtering-correlation-id: 28ebd464-a5a1-4d76-f84b-08dd9d8a3ef2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?cFc3bE9wRG00d2lhWjg0aENsdDF2Tjk0ZkVmeFQycjVtdTFscWUzZzQ4dzBE?=
 =?utf-8?B?blBtc2FqWGlHNTg4Y1ZqSnBlb2VMMEIvRFZhc213TnJYeklJM1haaTZjeVNI?=
 =?utf-8?B?VkI5YUEwY3VpWVl5aVdvNktBVzJlNGsyK1EyT3M5RTgvaTl0UmRncFpKZ1dv?=
 =?utf-8?B?L3REWXp0aUFBRTBEVmltVXJHOGR5WWVSSXpQU29KVWtIYkRWN2hCcmhzL3o1?=
 =?utf-8?B?R242TjlHcW16NmIxUkU2cGwwNmlBb0lPa0ZiZmFVY1NOb2VpNWRmRE1Vb3pi?=
 =?utf-8?B?MmxtSEZrTzk1SklITjRPc3VWbno4MktMeFVtejhTUHRINEk4akk5c3MydlpI?=
 =?utf-8?B?ODFqcHRYYnRXenFZaGdsL3Y2M2ozY0htTHBJTG5USmxPb0tZNnhYbkhTMUVt?=
 =?utf-8?B?VTBOZUsvMUtIdXl6SGp0SWJSK291elp6enU1VStOb3FZcWV1MU1aTklZdjRr?=
 =?utf-8?B?STRLVHhVTS9WMjJzVlB4VEJlWDRvQUxERUsrTTEvRE5FZy9ua2tYalNWd2I2?=
 =?utf-8?B?OGxJWm96R29MaUxXVGtwZHMwWnl1d1l0Q0hKVEdzblBVOG05K3p5b3BRV202?=
 =?utf-8?B?SVlUN1Q0aEdkd1g4dW5QVSs3eGZ2TXJ0TkJibW40TVpkcVBYeHdyTjFPTVhH?=
 =?utf-8?B?dzZ1K3p3Y0VlYUwyRHpTaDEyOWlaNU9ocFJmYWlDd3pGSHVva1hXNkpWREw4?=
 =?utf-8?B?SDRLbWpXb1M1d3lTU1JRd0diWnltM1UzVXROV1FROUwrTncxZno3cWlNOS9L?=
 =?utf-8?B?MTNRMWVGN2JoUlVkTWs0YzhlS29sZS9sakFpY2pucGFxMG1CdEFzNGlDTGFv?=
 =?utf-8?B?WTdwT0VpTkF3a3BwQVY5V3dCNmI5MnVjbngvMk04dmU0VUZjVnJ5MDAxVjZQ?=
 =?utf-8?B?eDcwZi9HK2txSWx3N051RUhKRTZaUDFuU29VUm01MlNnZzBxRUdhUFpQYnJu?=
 =?utf-8?B?Y0dNUUR4b0dFVWZONkVuM1VFK0tVazRURXE0cEUxNkRJc3dqcUloRnUyazNy?=
 =?utf-8?B?UXkvbmNiajNkKzZDV2xid3JtTVZiVGJlclp6LzBQQ2NqSjNoQUR2amlQcGoy?=
 =?utf-8?B?SHRwa0RmaVRrVW9LQ2FKbkdnSDNUVnhyTFdBSnRsQy9QcGt0ZW8zenpSOVVj?=
 =?utf-8?B?bEdmazl4MEEyQk5CVldTTnZSTlBpNHVDcHI5ZW5MWDZiSEJNQmVtd3VBSExO?=
 =?utf-8?B?MERnQnc5MmR0cnFlbjFSTjRtOE5LM2ZmM1N3Z2tJWWhaQzZxOHJtMC9majA3?=
 =?utf-8?B?UG5hYW11QmdoRGZzUHFpclB4THAxWWhwalV1bktRdFBhMU43SUFWWnBORlRG?=
 =?utf-8?B?MEpSaHo0UkJ1U3U0U3EwNGVZUkFVRnFNdTA2TGJWSUg4UFVvRWozY2s1RGR4?=
 =?utf-8?B?aEN3UmxLKzZ1RDdvU2s1bFJScndEK3A2U0x1OWg4TnRFY1EzcnB2TXRiT3JF?=
 =?utf-8?B?emUzMmJLaS96MTh2bjdXT2lPSERYd0NiTjU5aFBDNHlBVUc1Q2Uxek9FZGZo?=
 =?utf-8?B?YVNSbkg1VmdobFBFYit5SnpxYUJxUlFTQ24ydzhQT2lIWm41L2VjNUlWUE8w?=
 =?utf-8?B?TnhzT1N3cDUreEgvVXI1eDZHRWpiRlcvMlI5UkFuZFlFSjA0a0NEYk03NW1y?=
 =?utf-8?B?cUtWWE4rYmYrRXIwNGsrTVArR0pBeUd2QzhqaXNJWFdIOFgva3VHWW4rbE9r?=
 =?utf-8?B?eU9DdVkzSDVHVmNzSEJHb0F1NnljWHdLSXVXb0toTnZ2UERHMlc0QVRUWDFK?=
 =?utf-8?B?MlJxdjZxZCtUQ3lIcWduTVF3d0dTQUFPQzljQ2FZM0FJa0ppWUxqOE1tc2Mw?=
 =?utf-8?B?a3F2NzRlMHlhRGsrcHFwRHhuazhZalltOFB2TVBjVXFJZlBiazN6OEVubldU?=
 =?utf-8?B?cWFoM0FFaXRaVnN4ZHpCOWs4VXJUa2ZUVjhPbnZDZkhPcktVMndtSTExTGpZ?=
 =?utf-8?B?NUc0NXplVkRlYTBUMmJYMTMzZEl2QVdsakZCbmNpZW4vOFZVcGxoZGNJNEFD?=
 =?utf-8?Q?Te3UndH4IVzfPWxDuAUFJ58oS9fHRM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGZRck92R2VldFNrWFhDVmRoTVowNjlmMWxUTCsrUDl2Qm1VZUgrV2gwcWJC?=
 =?utf-8?B?QVU3VW44U2lQaEJURktqek1kTmRHbkQwMkdKQkRGSTNJdjEzNG82cDBkTUdQ?=
 =?utf-8?B?R0NFd21rVThTdTNBRVRmeU5CQ2Zla1d3U28yRlAyT1AwMmpVTmxhRHlDVGNS?=
 =?utf-8?B?bW5UOEhENEJoTnliSmY5VEJCMkdZMWxDcDdweWtQemJVRzBwTnE1aWUrMzIz?=
 =?utf-8?B?bklQVDhxWWFwMHNpZnBlcU5seVI1WitaSE1ybUFtamxFS0p6dWJzVFNzQ2Ja?=
 =?utf-8?B?ejJVbEFtdW94VFpBYWlRYzdnU09ocjRyemc2b0tScy93K2I3QklwQys2cDBU?=
 =?utf-8?B?NU11OWFldHNJVTVvMjVhODFHVDBKcXVCZ2J0ZjRJelZUS0E3R3BGa1lmbmpS?=
 =?utf-8?B?cWlTMHBEVFJXQkQ4bW9kcE94VlpTOXU1cTJRNUtKNWtHRit3MFRKTEpwR042?=
 =?utf-8?B?SnJuWDBUTXk1cHNXT0JWdjAvUC9jY0hLWXg2SmdySlNDOWNlUnlDQnFENzdl?=
 =?utf-8?B?a0VLT2d5VjVWdXFtc0xjOFo2aFE4cTFYTnU0MXloODh5cGhLS3JFRC9GdWha?=
 =?utf-8?B?bEdHbDZSekFEOUZPMkJiWHFWazB0MzlXT0RSTnpVR3pweEFjT29hRFVoRVBm?=
 =?utf-8?B?dDkzbXVMd0RVbWxwT216YnNlNGtidnF6Nkkra2RSVnBBRkNMNG8yZTg3Ky9z?=
 =?utf-8?B?K3hKN3REcjFSRjJjTk5DaVNLRGVzOEF2NTRNOWhzK0J1SUJtTGNUSTVaNGtn?=
 =?utf-8?B?YXlMQThKbXFLZmZIRWF2cjlZWTlFaG1uY2lLK0tHOWtDajVLNWRVaHRidXcy?=
 =?utf-8?B?U1BKWVZlSmZGQTZlQmRPZTlOQVNhSlZTVUt4MVYybnFXTVpMRVV1aG5EcXQz?=
 =?utf-8?B?MHl6ZEpOZTdFaXRJamIwWTBhNnI3Y2txdElhVHdnbWRldjFZUGREZnhQN0tU?=
 =?utf-8?B?UEh5U1loL1J2UE9YUG4xRzVkUkE3U0VldW5ySDRZdzRxbVc0ZDdIVm9HM2Iz?=
 =?utf-8?B?WE5aTytRZVcxazIxc0tPd0FsTXNDWWJaZHQxYW95Y0JTNThLMHE5d2RLUGkr?=
 =?utf-8?B?RUtJN29hOWxkVjB3V1ArS3F6WHJ4MGFYZ2ZJYzlRTEkwWkJVNGhOdDM4b016?=
 =?utf-8?B?L3JGb3FQV0FsWHBLNEs2YWZFTG9EVlBKeE5oUndTdnBTOTdaQzFzaTR6SnBt?=
 =?utf-8?B?RENHVkMxY3ZFRWYrMXN5TXF1S05pMSs4UE1SOER2emdGUXcrbEdRYisxdVR0?=
 =?utf-8?B?UEhxYUZFQ0tnSHdZWktyUDVITmN0Y0VKaktYWVBhKyt2ZWMxUFNvQ2dhekd5?=
 =?utf-8?B?bUMvaVByTTlaRG9hSGtJM3VIS0dzc01WTDN0Y01QT3NnOFdlWWJqM3JwdXgy?=
 =?utf-8?B?aG5uZFpCU0NDNGRjaDZNR3dNQnVsZ013Nkgxc3RINkhoM0FFQ0NvOE1odkVr?=
 =?utf-8?B?MTlvVGxWYlRSb0hHTkZVS1NuWThWUitjY3BERHp2a2tRMTB3WmxFd2JrU2gx?=
 =?utf-8?B?MVMramV3Z1lLSTFwbnR0UjRWVDBCdWFVMmE2TW5CT1hoUnNBc25ScFJZeUkw?=
 =?utf-8?B?L1J4YnJRUTh5RTNvTzN6WkFDekl5RnhQL1I2TVFTTjFybjBjYmNGZXJWa0Yr?=
 =?utf-8?B?NEtmNnRjYU5rU055VVZ1MGg4VEI0S1FzNm5zUHMvM1lGZHZOenRzVWN6bVFp?=
 =?utf-8?B?SFdCeHVUUG02OE1yckh4UUpLS3hTc1QwOFlPSU9tM3ZKYms3dElVWDMzNHh3?=
 =?utf-8?B?djUwQ21SMGRkcThtdXZFQ3FVVmF5c2RuOU5wYkpsMWVnMmpySHdOT1ZTWHFF?=
 =?utf-8?B?aE1hLytlTFBQZUNxTVF6WTFtYXRxN1Y3bTJGeHpGV0hvTjRxMlhkSkdrZVRJ?=
 =?utf-8?B?MzQyT1Q3TmJTZ1VkOHFGS1NEaG5qdnYvS2ErWnkzUDFmWjFneUs5OTl3UEJY?=
 =?utf-8?B?RnJwcERnQ3N1ZHpLeTNEWjJWc3NjQjhLWUU4MGFKd05iUml1dFM5N3JiTEdD?=
 =?utf-8?B?Yld5SlBiUENNMER1MHVHOGJmRWQ1cHZmWTR2MTJsQ1MwWnFGd0J2MVJESDh4?=
 =?utf-8?B?RkdXcXdGdjFsbzNCT3ZRdWR4TmhoL2NydXRmUTZjZCtkYWpKY1pYYmJBUDFv?=
 =?utf-8?Q?X/kwqupvWTS0Rg88SUf6NEMF8?=
Content-ID: <800950702D99A74A9C75841D4C2456C5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ebd464-a5a1-4d76-f84b-08dd9d8a3ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 01:52:04.3211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 073TmkO3xTEI84+lSrOyfGl1y3drWQTLf0jo+lW+sTv+ZGRDYTcBgrSu0uNUQDctbznEM3Unf/LhGoC3Vfwfrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7794
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1656383890.1014638035"
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

--__=_Part_Boundary_004_1656383890.1014638035
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA0LTE4IGF0IDE0OjUyICswODAwLCBCaW5jYWkgTGl1IHdyb3RlOg0KPiBB
ZGQgY29kZSB0byBzdXBwb3J0IGVEUCBwaHkgZm9yIG10ODE5Ni4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEJpbmNhaSBMaXUgPGJpbmNhaS5saXVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvcGh5L21lZGlhdGVrL01ha2VmaWxlICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9waHkvbWVk
aWF0ZWsvcGh5LW10ay1lZHAuYyB8IDI2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyNjMgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstZWRwLmMNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZSBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL01h
a2VmaWxlDQo+IGluZGV4IDFiODA4OGRmNzFlOC4uNDlkOWVhNDI0OTdhIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL3BoeS9tZWRp
YXRlay9NYWtlZmlsZQ0KPiBAQCAtNCw2ICs0LDcgQEANCj4gICMNCj4gIA0KPiAgb2JqLSQoQ09O
RklHX1BIWV9NVEtfRFApCQkrPSBwaHktbXRrLWRwLm8NCj4gK29iai0kKENPTkZJR19QSFlfTVRL
X0RQKQkJKz0gcGh5LW10ay1lZHAubw0KDQpwaHktbXRrLWRwLmMgc3VwcG9ydCBtdDgxODggZWRw
IHBoeSBhbmQgbXQ4MTk1IGVkcCBwaHkgZnVuY3Rpb24uDQpwaHktbXRrLWVkcC5jIHN1cHBvcnQg
bXQ4MTk2IGVkcCBwaHkgZnVuY3Rpb24uDQpTbyBJIHdvdWxkIGxpa2UgdG8gcmVuYW1lIGZpbGUg
YXM6DQoNCnBoeS1tdGstZHAtbXQ4MTg4LmMgKHN1cHBvcnQgbXQ4MTg4L210ODE5NSBkcC9lZHAg
cGh5IGZ1bmN0aW9uLCB1c2UgIm1lZGlhdGVrLWRwLXBoeS1tdDgxODgiIGFzIGRyaXZlciBuYW1l
KQ0KcGh5LW10ay1kcC1tdDgxOTYuYyAoc3VwcG9ydCBtdDgxOTYgZWRwIHBoeSBmdW5jdGlvbiwg
dXNlICJtZWRpYXRlay1kcC1waHktbXQ4MTk2IiBhcyBkcml2ZXIgbmFtZSkNCg0KV2hlbiBkcCBk
cml2ZXIgcmVnaXN0ZXIgcGh5IGRyaXZlciwgdXNlIHRoZSBhY2NvcmRpbmcgc3ViIGRyaXZlciBu
YW1lLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgb2JqLSQoQ09ORklHX1BIWV9NVEtfUENJRSkJCSs9
IHBoeS1tdGstcGNpZS5vDQo+ICBvYmotJChDT05GSUdfUEhZX01US19UUEhZKQkJKz0gcGh5LW10
ay10cGh5Lm8NCj4gIG9iai0kKENPTkZJR19QSFlfTVRLX1VGUykJCSs9IHBoeS1tdGstdWZzLm8N
Cj4gDQoNCg==

--__=_Part_Boundary_004_1656383890.1014638035
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDQtMTgmIzMyO2F0
JiMzMjsxNDo1MiYjMzI7KzA4MDAsJiMzMjtCaW5jYWkmIzMyO0xpdSYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtBZGQmIzMyO2NvZGUmIzMyO3RvJiMzMjtzdXBwb3J0JiMzMjtlRFAmIzMyO3BoeSYjMzI7
Zm9yJiMzMjttdDgxOTYuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtC
aW5jYWkmIzMyO0xpdSYjMzI7Jmx0O2JpbmNhaS5saXVAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYj
MzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvcGh5L21lZGlhdGVrL01ha2VmaWxlJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOzEmIzMyOysNCiZndDsmIzMy
OyYjMzI7ZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1lZHAuYyYjMzI7fCYjMzI7MjYyJiMz
MjsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KJmd0OyYjMzI7JiMzMjsyJiMzMjtmaWxl
cyYjMzI7Y2hhbmdlZCwmIzMyOzI2MyYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7JiMzMjtj
cmVhdGUmIzMyO21vZGUmIzMyOzEwMDY0NCYjMzI7ZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10
ay1lZHAuYw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJz
L3BoeS9tZWRpYXRlay9NYWtlZmlsZSYjMzI7Yi9kcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmls
ZQ0KJmd0OyYjMzI7aW5kZXgmIzMyOzFiODA4OGRmNzFlOC4uNDlkOWVhNDI0OTdhJiMzMjsxMDA2
NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZQ0KJmd0
OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvcGh5L21lZGlhdGVrL01ha2VmaWxlDQomZ3Q7JiMzMjtA
QCYjMzI7LTQsNiYjMzI7KzQsNyYjMzI7QEANCiZndDsmIzMyOyYjMzI7Iw0KJmd0OyYjMzI7JiMz
MjsNCiZndDsmIzMyOyYjMzI7b2JqLSYjMzY7KENPTkZJR19QSFlfTVRLX0RQKSs9JiMzMjtwaHkt
bXRrLWRwLm8NCiZndDsmIzMyOytvYmotJiMzNjsoQ09ORklHX1BIWV9NVEtfRFApKz0mIzMyO3Bo
eS1tdGstZWRwLm8NCg0KcGh5LW10ay1kcC5jJiMzMjtzdXBwb3J0JiMzMjttdDgxODgmIzMyO2Vk
cCYjMzI7cGh5JiMzMjthbmQmIzMyO210ODE5NSYjMzI7ZWRwJiMzMjtwaHkmIzMyO2Z1bmN0aW9u
Lg0KcGh5LW10ay1lZHAuYyYjMzI7c3VwcG9ydCYjMzI7bXQ4MTk2JiMzMjtlZHAmIzMyO3BoeSYj
MzI7ZnVuY3Rpb24uDQpTbyYjMzI7SSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3RvJiMzMjtyZW5h
bWUmIzMyO2ZpbGUmIzMyO2FzOg0KDQpwaHktbXRrLWRwLW10ODE4OC5jJiMzMjsoc3VwcG9ydCYj
MzI7bXQ4MTg4L210ODE5NSYjMzI7ZHAvZWRwJiMzMjtwaHkmIzMyO2Z1bmN0aW9uLCYjMzI7dXNl
JiMzMjsmcXVvdDttZWRpYXRlay1kcC1waHktbXQ4MTg4JnF1b3Q7JiMzMjthcyYjMzI7ZHJpdmVy
JiMzMjtuYW1lKQ0KcGh5LW10ay1kcC1tdDgxOTYuYyYjMzI7KHN1cHBvcnQmIzMyO210ODE5NiYj
MzI7ZWRwJiMzMjtwaHkmIzMyO2Z1bmN0aW9uLCYjMzI7dXNlJiMzMjsmcXVvdDttZWRpYXRlay1k
cC1waHktbXQ4MTk2JnF1b3Q7JiMzMjthcyYjMzI7ZHJpdmVyJiMzMjtuYW1lKQ0KDQpXaGVuJiMz
MjtkcCYjMzI7ZHJpdmVyJiMzMjtyZWdpc3RlciYjMzI7cGh5JiMzMjtkcml2ZXIsJiMzMjt1c2Um
IzMyO3RoZSYjMzI7YWNjb3JkaW5nJiMzMjtzdWImIzMyO2RyaXZlciYjMzI7bmFtZS4NCg0KUmVn
YXJkcywNCkNLDQoNCiZndDsmIzMyOyYjMzI7b2JqLSYjMzY7KENPTkZJR19QSFlfTVRLX1BDSUUp
Kz0mIzMyO3BoeS1tdGstcGNpZS5vDQomZ3Q7JiMzMjsmIzMyO29iai0mIzM2OyhDT05GSUdfUEhZ
X01US19UUEhZKSs9JiMzMjtwaHktbXRrLXRwaHkubw0KJmd0OyYjMzI7JiMzMjtvYmotJiMzNjso
Q09ORklHX1BIWV9NVEtfVUZTKSs9JiMzMjtwaHktbXRrLXVmcy5vDQomZ3Q7JiMzMjsNCg0KDQo8
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

--__=_Part_Boundary_004_1656383890.1014638035--

