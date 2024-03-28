Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF6588F583
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 03:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E3D1122DE;
	Thu, 28 Mar 2024 02:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="W+dSXNFB";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ITMaLuVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C861122DE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:50:43 +0000 (UTC)
X-UUID: f443cdc4ecad11eeb8927bc1f75efef4-20240328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=P3ouE/jsYsbVULgdSqangYQ8bZm3TZe2bvPIUCoKVM8=; 
 b=W+dSXNFBwcd6XPVPKWiNs66deC+bHXI6M34y1T2SWmRE4IRCRTzeOqns5zBJzdB4255O0o4SdhqtVWnjIKsQkMq/X8edfbfmUyElW+B6G9/UN0fvEhZijF4WmE/Dykhr4jp0t4EQsWn049ZXxi+tZI79o9vQiARRFPRYVvR8LRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:2be81695-f03d-4029-8898-f873bb84cd3e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:b0978585-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f443cdc4ecad11eeb8927bc1f75efef4-20240328
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1017585878; Thu, 28 Mar 2024 10:50:36 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Mar 2024 10:50:35 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Mar 2024 10:50:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHUD5pCBbds3/XKZL34LqxGO2N/dPxBEHFOINu0EZvTjoRd3Dcavs96NeUXnlwl8Y+wyCjBZogIFUZ9fiKfINgiurxn4j53b8sU3SV8MXyr9MQK92eVi5EVbpnYCIs5FhCZSr76/U7t5mmoQDozxEsnSkmN+O2eDDbkfZjKIcNkpovwRMD7gtRGVmEizb9FerzpEmYVGd/+Tv4YLjbp45v8mKH9WDfgA0XxKbMZO/DQG4XFpFTJfPnPXOEfXhApOL9TK+NRrHYiB4CW2oRwmsTsPCuZqK2nMN5uAvkFxIFMEJ/zVanr+zQYagnLpVimbK8Kt98hQ6JWupz+kuP5Xnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONaYJpUuiVeoCugAWNZdktL0PJNf20orxHDUh5X0TwE=;
 b=codxPtW41yrrkEbMKEtt7IF04QuHd5ZjaRuBud6V+5v1/F/OOXjn3vHkuNq/wmFdjRPvif3fg1U9rm6m6i8c0yoHq6nh1c+BQQkfJZTZ3FP/6OpRDekwnVApcLKhyHgUmREuAWRPBnB1izib4kxAJtmLXUv6SfhgqWmGjyez2JK8756Z95Vpzboa75G/YzRNeJRcYlH3KUWgCnVjUshCM3h45IFUz8LxxClplgMZQzUqbTdrD5CZEKPZ16ybwnf8JoBmcussUf4TMzd5WqL3/GziRuClV6C2k7Fhi4bzaLH/ITUkOFoPBaAqrXWJ2hL6/YnCAdiu6AJfkMa0R6PF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONaYJpUuiVeoCugAWNZdktL0PJNf20orxHDUh5X0TwE=;
 b=ITMaLuVKLTkDD80fkDutYpb7ylQN2r7qEhiDNPmkcqY4FENoHhbr4OMWJz8NYSDporlym9K7QO6aM6gdiGk+Bso23pFOZNPyV3nyOna1A4F4oqMHoR2ARR8tjGGt7VOJg0bAnex+/+BMX6JZ3LrucujPxPsvpsQM49qCQE35SUg=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB7674.apcprd03.prod.outlook.com (2603:1096:400:426::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 02:50:32 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8031:ae41:afdd:d0a4]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8031:ae41:afdd:d0a4%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 02:50:32 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 04/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation
 property
Thread-Topic: [PATCH v6 04/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation
 property
Thread-Index: AQHafBnuu1kQzYpLEket6GkmzEiziLFDd0QAgAQ+tYCABMc4gA==
Date: Thu, 28 Mar 2024 02:50:32 +0000
Message-ID: <52ddd0871a6feaf8ec26080161c25c4475ca5965.camel@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
 <20240322052829.9893-5-shawn.sung@mediatek.com>
 <a5b00d343b922e726476e4b3c1973d44a05aacb3.camel@mediatek.com>
 <fd3beacfc59f466ab5e51276a3479c0501350a39.camel@mediatek.com>
In-Reply-To: <fd3beacfc59f466ab5e51276a3479c0501350a39.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB7674:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PHFL48mWg2Yt+UATRm0WOBQbVZQqclG5RHmr4UHujoKLgjdB0R+xRi+hwiN7javdO2oywDMKQNhsaSTRq3e/J/pXqdrgHVLgTLIhXMYRG1QpARRwuNAtH2LKNq9OLgBStbpzkiTcADR1kpOSUkCksWpyr4s5hN8iILNRlW11fxZhMqLacgkGNwCOK1jNy3fLpftIb/iU2M/yQeTOizZEGIBboNU3BOQNBu6yfzLLgBrfTBc0auQlVT3uWJTQM2mbUpT4zbv7d4YRxocUYRN/d+xbdkBxTFeialifW00OU2dJYitzKeyqhbev65jzqj6igiSNShpud/yQgTsZuC7o10u3h+a5YjXBMJusp9UqfDIrQxdc8ncntI3aEc7lNa7LfEML+evUEe+7cwwCLRjUzIBDWKCCc+V9Ni1HTen+4yZpygz99XqktzC3GQKGBT99nmmb+aJy9riPNch2/rot634Wkc+dAbIHjFoqH4bBpSPtCg6ZI5Yu6Vnt5/hqUOAZ7YKyGEqHTiILN/o/Rv+FOoK2U1rJZjnlUgDcoiDtARqV6b8LYjzdBR7d5whzElcLtW17Hf6sF29F8M1EEy7mgmddCzUvGQ0Ers4RASVV+CDSqGVSPTYoo8xb8ZfP8CgTwyJICKVrYKAbtpgvy4P/ewVTq9w1gS5DwRg6373WqAo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUhYRmRndGNEU1lCWGhmc3ZGY3RRc3J6QmdrTU5obDdSampDbWloU1dQOEt4?=
 =?utf-8?B?S014S2tNMW5MdlhQZGtpcHFIRFdRS0NzZFlXRnRCeTdqUXYrcHVJNmFxbVpm?=
 =?utf-8?B?by9HUXFSSnRjL09BRkhzdnlGNHV6bVVJYmllS0ZGSjMxbmN0ZkxoK2dteTl5?=
 =?utf-8?B?ODZzZlZGZ1RybG8vME5YSENwR2R5NkRTb1RNT245dFlGQ0FtM0dETUtOc011?=
 =?utf-8?B?L1lFS0JnSWxKR21iZmpxeVkzT3ZsMHlxTWVBUzNzSjFmeXR3bUFkN1dPRjBE?=
 =?utf-8?B?ei9VSG1xVnRHWXU3SFh0bzg4UWpqa1NXcjVjbUV6OWFkVXY3V285RWtNOFdq?=
 =?utf-8?B?Mng2TE1KMW1ZTDQ5T1lteUFNYXZjNGwyNVdhYkRBVHVIbzJjdmUvWWZmcnFV?=
 =?utf-8?B?M05SYytpUHcrbVI4b3luQWVlZDZWeEVMUXM5NHpKbmphOHpmSFdiZXBkbGY4?=
 =?utf-8?B?c0JFRCs1V3A3UkFMYXZjNmVhOFo1N1MxL2dsckg0eTk2ZEp1amtTbUtmV0N5?=
 =?utf-8?B?OVl5WDJWRzljT1M4YndJVDdrRzIxZm5MYTJSd3FWdkpnM3BDMEtWSC9BQXZt?=
 =?utf-8?B?b0pMUTBUTjFDbEJUUjZjWEtKNzluS05kclk2QTNDWGJnZUxNdEF1dzg2Vnc0?=
 =?utf-8?B?VlVidXpvM1NZTm1vcG42MjBFYmFPOFc1Qk1ZQ1RQZ2JOSlpEb0tXeTZSUDhw?=
 =?utf-8?B?L3J1VDJQWVpFSk91cjlEbVoyTmxvejRVYThxcEs4UUlsbTBDMHc0ZkZMQmFG?=
 =?utf-8?B?clYvalQxYTl2OFpMUW1WSTV6UUYySlpSNWllaHhDTVZWR2FPOWNOU2lWcVZF?=
 =?utf-8?B?WWhmdlFQeURmZHErNVVSQVZEalNDb2F3dG9DdElQTFVoWmF3dURzdzBmWFRK?=
 =?utf-8?B?UHdVcDBxTzkwbjZmeWoxcExMZ3RydklpR0k4VTAvbm1DTmJVbU9xTTZqVEhj?=
 =?utf-8?B?ajBaVFVMOUdod3NpaHBMeVZmdDdwTFc5UThja0JGaWRCd3lQV0t0R3UraSt1?=
 =?utf-8?B?UmJKNHRrVmw0bmVtL1Zibnd2S0wzdWZWalVYNEtpQ3NQRm0zZTFxL2hmdFc0?=
 =?utf-8?B?SCtxbUpTd2NKZndZcms0bTc0Q0FWR3hON25zMHpSemR5OUcyUXhCSkFSSWg5?=
 =?utf-8?B?ZzlIMFBYZzBrdmtVYzkwaC9QTnhKanFvUTVvcEMvZVdLdTExNUttekN1U1ly?=
 =?utf-8?B?cHJKeHZXKzl1ZHFYa2pwUUd4L0R2SWs3STV3QnozMENOYTQ0RlNucHQxQy9B?=
 =?utf-8?B?YVMwN3Rsdk5VbFQ1K0Q5bFAzUnh3N3hZc00rMVZ3dERIMmQwRlI4NmlNRnF1?=
 =?utf-8?B?Q0RxcUdReGFrWXp3NGdDaE94N2szclNpQndlQWJmcS9NUHBzR01GWTFWdEhv?=
 =?utf-8?B?ZnZDTkdUWTV3eC90VUV4akxBUDFpa1FXckhzUXVRTFIzVVc4K3Q4U0oyUHFQ?=
 =?utf-8?B?VndDT0U4MTN3d1hXem44ZkNwdjBHa0l6MDB6N3pxYndFbGgxRnQ3V212dFNX?=
 =?utf-8?B?QXM0eXVubDF5RldoTmorek5JdUFNN1A2V1JNelk3WVRPMHVKZUZzaTNJK09R?=
 =?utf-8?B?QVFianBaZGozMkNFRmdKWkpDcUdoMnRwaVZ4bnY1RTV5RkdpcXRhWlBKY0JT?=
 =?utf-8?B?b3VCeGJOc0Fwb0x3S0MrZC8yV1REemNNM2tCRG1qV0pRSk9BbmdBNkxXc0JE?=
 =?utf-8?B?MlIrMk1JdThUT2xheXMvdE1JeWZNMzcweFN0Y0JMSHpqMGNkbWVGRlZJMzhD?=
 =?utf-8?B?RGpPaWtseDZjOUtqS2I2Z3lYdVFvT25jZ3BkelB1d2dROE1vM2FobCtBYmdn?=
 =?utf-8?B?VmUrM053azFRRDFFek9laFp3S0xyMy81Zy83OHJONlJ2SjVOTWFhVm9NSkZT?=
 =?utf-8?B?MUFLNmR3a2htNnFEaVJ1R1dwdHlNQlBxcHFrb3Z6Yyt2SXY5eGFTbXBXbU5C?=
 =?utf-8?B?UmJMZ1NmZEcxOGZ2YUwvUjFMZ0VlenN3QlI0RG5xWjhmcE0wNm9Qcy9oK2lj?=
 =?utf-8?B?bmE2MTRMZGdYMXlSSzkrT3U2Njh2QVpUQVZZdXBJaCtpVVpXSUdVbjR6U2Zv?=
 =?utf-8?B?UGpxdldSdzYzOWJQK1pDWEE3TnRDYndpSFdkZEo2bHI3RE1FWXJEQ0NmZUIz?=
 =?utf-8?B?YUx1b1pibElEQkdFWUpDcGJmeFZiTEYwMDBVbHhlZE1uTnpqSlVKbUo1ZHY1?=
 =?utf-8?B?MlE9PQ==?=
Content-ID: <786747D65FCDD34C88BBDC46190416A2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6624645b-830f-4557-c5bd-08dc4ed1d5f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 02:50:32.4404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNGxLvxtaV8OwA6shNu510sspWy8KY3BPPLGfz0KmplyfihOAX8N7J16xBjdF/iP/nA7HsldW+NZXecdrRXFTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7674
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.084800-8.000000
X-TMASE-MatchedRID: xSJL/ht5SGDUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/mNRhvDVinv2mb
 S2REgOw3o5qw/iFKtvbzrL9jlOCHAfQtY4IdDLpU7spMO3HwKCC1k3bRIdXVNG0CvxZ2Eh6fee+
 psuSMY7ohJ/ufappeEpGTpe1iiCJq0u+wqOGzSV2Wlioo2ZbGwdmzcdRxL+xwKrauXd3MZDUD/d
 HyT/Xh7Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.084800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 982D1CB1E528121F68F77C2C0CB7D94554F0C5C486F43A0F06DE25D5304987182000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_638423067.264309750"
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

--__=_Part_Boundary_008_638423067.264309750
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIE1vbiwgMjAyNC0wMy0yNSBhdCAwMTo1MiArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMNCj4gPiA+IGluZGV4IDBlYmVhZjk4MzBkODMuLjJhNzY3YTgyM2M4M2EgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMN
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+
ID4gQEAgLTI4OCw2ICsyODgsMTAgQEAgdW5zaWduZWQgaW50IG10a19vdmxfbGF5ZXJfbnIoc3Ry
dWN0IGRldmljZQ0KPiA+ID4gKmRldikNCj4gPiA+ICANCj4gPiA+ICB1bnNpZ25lZCBpbnQgbXRr
X292bF9zdXBwb3J0ZWRfcm90YXRpb25zKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiA+ICB7DQo+
ID4gPiArCS8qDQo+ID4gPiArCSAqIGFsdGhvdWdoIGN1cnJlbnRseSBPVkwgY2FuIG9ubHkgZG8g
cmVmbGVjdGlvbiwNCj4gPiA+ICsJICogcmVmbGVjdCB4ICsgcmVmbGVjdCB5ID0gcm90YXRlIDE4
MA0KPiA+ID4gKwkgKi8NCj4gDQo+IFNvcnJ5LCB0aGlzIGNvbW1lbnQgaXMgbm90IHJlbGF0ZWQg
dG8gRFJNX01PREVfUk9UQVRFXzAsIHNvIGFmdGVyDQo+IHJlbW92aW5nIHRoaXMgY29tbWVudCwN
Cj4gDQo+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiANCg0KR290
IGl0LiBObyBwcm9ibGVtLiBXaWxsIHJlbW92ZSBpdCBmcm9tIHRoaXMgc2VyaWVzLg0KDQpUaGFu
a3MsDQpTaGF3bg0K

--__=_Part_Boundary_008_638423067.264309750
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7TW9uLCYjMzI7MjAy
NC0wMy0yNSYjMzI7YXQmIzMyOzAxOjUyJiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjtpbmRleCYjMzI7MGViZWFmOTgzMGQ4My4uMmE3NjdhODIzYzgzYSYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtAQCYjMzI7LTI4OCw2JiMzMjsrMjg4LDEwJiMzMjtAQCYjMzI7dW5zaWduZWQm
IzMyO2ludCYjMzI7bXRrX292bF9sYXllcl9ucihzdHJ1Y3QmIzMyO2RldmljZQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7KmRldikNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO210
a19vdmxfc3VwcG9ydGVkX3JvdGF0aW9ucyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldikNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Ky8qDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsqJiMzMjthbHRob3VnaCYj
MzI7Y3VycmVudGx5JiMzMjtPVkwmIzMyO2NhbiYjMzI7b25seSYjMzI7ZG8mIzMyO3JlZmxlY3Rp
b24sDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsqJiMzMjtyZWZsZWN0JiMzMjt4
JiMzMjsrJiMzMjtyZWZsZWN0JiMzMjt5JiMzMjs9JiMzMjtyb3RhdGUmIzMyOzE4MA0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7Ki8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U29ycnks
JiMzMjt0aGlzJiMzMjtjb21tZW50JiMzMjtpcyYjMzI7bm90JiMzMjtyZWxhdGVkJiMzMjt0byYj
MzI7RFJNX01PREVfUk9UQVRFXzAsJiMzMjtzbyYjMzI7YWZ0ZXINCiZndDsmIzMyO3JlbW92aW5n
JiMzMjt0aGlzJiMzMjtjb21tZW50LA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTom
IzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOw0K
DQpHb3QmIzMyO2l0LiYjMzI7Tm8mIzMyO3Byb2JsZW0uJiMzMjtXaWxsJiMzMjtyZW1vdmUmIzMy
O2l0JiMzMjtmcm9tJiMzMjt0aGlzJiMzMjtzZXJpZXMuDQoNClRoYW5rcywNClNoYXduDQoNCjwv
cHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_008_638423067.264309750--

