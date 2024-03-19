Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E677187F709
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 07:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3DD10EC0B;
	Tue, 19 Mar 2024 06:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Tj8PvgPb";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vQMqjdAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970410EC0B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 06:00:32 +0000 (UTC)
X-UUID: fb61ce7ae5b511eeb8927bc1f75efef4-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yH6no+k4gQ72M7yVLMsYUF0q0GR97sIQlmcqV1fLGt8=; 
 b=Tj8PvgPbv9TM6NAuRnQi9Cxa2Ez3LoKfwM3YBtVfcMdglSN1g7A/j0ENvxDIEmr42OBgQGWWSTdQazk5G80nmA8U8ovVy8AuZedF2/e5CNynlrPPes/C39gnBSH/KvAI12cw9/IGuTVSwohzJ+ER29scr1emXEv67Hr4zmUlOWI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:47db3494-f9a7-44cd-b8a9-93130eff37b1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:56c7a981-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fb61ce7ae5b511eeb8927bc1f75efef4-20240319
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1225888434; Tue, 19 Mar 2024 14:00:26 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 14:00:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 14:00:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnIyZBzHcqvd2fge+xW+zBwKfRBAq58f30E5QlpnJvMjjjzBle+IGiXQeWOPXLRJiw8XCF6OVNTl0vnsGa22YSYUXgm6ZU4+kXjKIWI+P8x8u8wPNBqXrFOZ7qXA8QQy1HZ5O+GutxJnixLTUQOGVM+AHPLgUEsVjzM0HRr8OsjvRl02H2ci+mNTGVO2qzfj3AFVKZjrOMtHlor9E8y1y7qml1is7v5R0B9QC9TdzWhM4pakY0bpFBirULYW2Y00Pud2fTu39CADFDDe7rEQ7ZU/Jwm0X+VI/Ogx0TTB+VH6eTzgD30TOjXoMtXKCHTdhw4DqLBVRPOP9u2/eaMHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sURUieLfCy3g6Z3iHiiZCNT0lVHpYX2l4WOiTSWXWoE=;
 b=XIZAivaq96JKIpMmTMOOAcOp+MuOEQIV7k0Nhsh5XZh3G5M0Pyjb2FSKIWN4UeKZGl9i6VfoVpac4skVnvYvtUmnTILnNt9v1qkdDTwCfIPpGU3JDcypFezEcAWCFnwJH00k69n7oy2y/jLDe3MdNaDVSlEMHxQ0cM+yeCaz0WVT72CBXMuNe8l4tMuB1Im1SlAmzUHBsyJnVl5un/vPHwDBjmybSZ8x8VABQKMjtEl9BexgEIyi0Ar8T4xqMW1aSRI9pQSMd/C8PRCvo4TrtVClzfG2DPC1XLyN+oxNTfLlik7dG5/cimE5fvDNwXlqMe89bQ9PXKHTppmmwVYlnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sURUieLfCy3g6Z3iHiiZCNT0lVHpYX2l4WOiTSWXWoE=;
 b=vQMqjdAVQm7nmaOLELrWxLqfexX4KeO5plBb03XN0a81U8buY2lI57lBHXMD/YOwApZ5S8w+dAkUHJa1xutTU4qeut1IEkYPCuh10DiMzoy0GydXeBeAtApi0WjouuvTsAI7xfmUlaOQ/QJMJi0Cz0+COk3FKfYZZnQZlGcAs6I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8160.apcprd03.prod.outlook.com (2603:1096:400:47e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 06:00:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 06:00:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "greenjustin@chromium.org" <greenjustin@chromium.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Thread-Topic: [PATCH RESEND] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Thread-Index: AQHacLmAj8+xu1ueOEaPEJuuWj7WG7E+pAEA
Date: Tue, 19 Mar 2024 06:00:22 +0000
Message-ID: <36d6fd903f80c39f0c1250d684a472f86635ff8e.camel@mediatek.com>
References: <20240307180051.4104425-1-greenjustin@chromium.org>
In-Reply-To: <20240307180051.4104425-1-greenjustin@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8160:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mjolTxct1f2JnIxOrbfFKHaaU1j2UueGwLQnHNYAyVNlCgUo5x9BaNDW3stgDPbzNxwZt5jpgITCm7rt0FLgPS3D7Z51EuHCIhTXq5R1cZdOToLprZP2zKNW/YJJqnkrhZEM5zUpxhnzO2IMtHZqVVz1n6nYOdcWhZUBkcFaitCDT2UuM7ir6U6m2myYt4SzO4nYd+eBq5aiK+Glg4B4EbrG66O5L3TgYKpALCYFnE7EEh1DN2X/WysEOUqOAPjuxReH/yqhldpDoFxBvS/oh0SlmPjR2JUxqqIvUW+auJEdKMCTDcd5xkUYgyWFlsjzuLoEJ7rfhoHF50jfHiEZ/3XclhCHNrw1zWpQFakAuke/MPbiQ96AOGHLvYAi30Ivgk830wFh6hOlTvki5ewyL8tV1Sje9NVA19g+efonwyAcFXuDuPHukyReT3IX3wHcFYxOt6J4SplvWKG8IKe0E/6lpksCs2g2E64YhJepJaPO6legQ89KiHvyg4Fy8MQWI9FcgOh+787KC2nV4xn7IbctZhjHCeMi+xuQHFgoTgVijtFt9IkxhhtvVxcHibLF0BlAx/G66gBCT8Z6KS8fPBs1GVgue0Avyn8Td8W2P1BzSQ1UbcIrYhmhraxSk4GZUH2Fk9rmGjD9bhRDysV4v4NJWZ42GzYud3OmlkXIZ2k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3hESWdjYjNyRUtyVXJiWEY5V3QreHdpQkZHZ0FwSE9pczlZM0szTDZmSWZK?=
 =?utf-8?B?QTJmd1NIUExDVTVsODhEWW5uN1I4M0pVS3hpZ3NBM1VlZ1EwcWNqZGJ3M0dM?=
 =?utf-8?B?MitnSkxqNHpjdDkyeDZJaWZaaTJ6aHBMTEY4cmg1REFadkZTdlV5YWxLVkxW?=
 =?utf-8?B?blEwUmNxMjJCdCs4RFBIZ0Q5TUFFS0xRVFdBaVpINkFYN0VQZ2tKZFl5Nm5y?=
 =?utf-8?B?d2ovYlVRdSs0MTMyb282S01seFdwM2xyZGZ2UmpvT3FRMUViOVp1enBzNWl4?=
 =?utf-8?B?dExGcG1yWHJnY3VEdXh3bVh6ZlV2K0N3UmhkeEc4ckl0Q0N1ZnRIeEpaTzBz?=
 =?utf-8?B?ekJPeUcxRmplV094UlU1d1p2NW93MldKbWM5N2xhS1VKZkpWT3VIbitFOHYv?=
 =?utf-8?B?bUx1VUQ3VmdWVkpiSGhybHBNdndLNFM3OSt1WlFaMUo2NW1wcGNIOTloOHVu?=
 =?utf-8?B?YlFFUGU1RFV0cVkwR1ZWd2toMTM0dlhQVFhWY0o5RG5lTmtwMGdTdEU5ZDAz?=
 =?utf-8?B?dDJmMVRub1hCRlJDZkRKQld2bFoxTExqbGJqcDVpVGQxVjZaSjZKN1lkUHZs?=
 =?utf-8?B?QTV5R1QwaUxTK2YvUlhNUHRQVytsUW05elh2bG5vSXlmK0tiNXFaZS9UNTVC?=
 =?utf-8?B?V1RLQ2JDWEUyaWsyUnVqN1M1b0VqTDNFa05qMDFrS09BZldheVVaZTRnREdZ?=
 =?utf-8?B?WUU5cU4yWVQwQXMxdk1LTTlZVkhHdkZydzNtenB4SEw0aERhd2dUV0dvVjVV?=
 =?utf-8?B?cFRmc3FXbEpCV3ZsR3FLUlRwQUowQmdNLy9jOFBBVXdWYUM4TmhuNGFSQ2Jy?=
 =?utf-8?B?VXFPR2JJUGRjN2xnekRsYk8vcVdRNzRyMWNQc0s4UEVGd3V2a055NmFEeWpx?=
 =?utf-8?B?WmlWVC9ZZVUrcXZ3SFZqWWIzaWsrRUdpcVV6a0xmc2dpcFRBRjZuVWNsWkpF?=
 =?utf-8?B?YnlHay8xS0Q2a09KTW5XaWlIM2Q5U1Y3VTE5WjNwUWlWTXlkc2NSY3VvTVRC?=
 =?utf-8?B?Mm1ENGR4RDd4RVYxSktnM3Y5U1A2T05ic0pEaXBIOWY3QTdDV1l4UHhRK0xU?=
 =?utf-8?B?NUZreXVJZUdOOSswYWl6QmI0Y3hzSk9pbWdqZ1kxMERMbGtvL2RHcHA3QmFs?=
 =?utf-8?B?S3djcVp0WCsyVnNSZWlyazJJRnlnK1lvWk1xL1RGenZwR3dNVFltNmQ2L0sz?=
 =?utf-8?B?Tk91WDM0ZEMwZStMeEhaTnlVZW1LUzcrblIxaHdsek1kRmtaTFBJNVk1eVhy?=
 =?utf-8?B?V09OSUNXOUEyK0dzTnp0RU5wcUpHNEZLalFrcWVOR2xYVU9ibmwyM2taZGlK?=
 =?utf-8?B?ZVFnUTlNZlNwRldHZzZETk43S3EwWjhzR2xLM3JpTHBwLzB1QnVaVWQrb3hh?=
 =?utf-8?B?VnR6dG5Mc2dabjErdHBOaktreitSaHNTbmc2ME9YZzkwblU2MTJGb1lrcVZl?=
 =?utf-8?B?a0taNzNETGF1WXoyZW1zUHYxQ3ZzaEVZZ0ZFY0RpWHloVmxVRlkxYXFOZ2p1?=
 =?utf-8?B?WlVsczdXSjZCb2xSKzFiYUdnTkZuY1Z6eW5Yc3NLbjBxZUh0QUpoRmdxV21D?=
 =?utf-8?B?T0gxcXhUcjZ4Z01hNGV4VTVUQ1A5S3IwVHVJNzVuaTRxS2ZNcmFURVd0VnU0?=
 =?utf-8?B?KzBxaSt3V2craHRSWVhpd3FoM0xpQmJOQ29nUVRqd2dHWGEwQUFNaTJlTUpY?=
 =?utf-8?B?UU91ejNMQmxYeWhBZ1c3bGtnbTk5K1BleXlkdDVVRlpWWU5pZlVjTjI2VmZy?=
 =?utf-8?B?empRUXFiZGdSbXY1dE9YY3grVjZNNXFOT1VmZlcxekVhcnJ5dExaUEp2Nk9t?=
 =?utf-8?B?ejhBMzNCbTIwVWh6VnRZbmZzckk1dktwT1U2elNVSFpYV21OaTNmdmxNRlVn?=
 =?utf-8?B?YTFnV0d5eC8zeEl4VUh0Y3lxTzNhVjZOOXdhZTFuTEhkbE9DL2VoWk1uNmNN?=
 =?utf-8?B?WWh6NlpQeXlyN25sTm9iUEd4dXZVWE1Gcm5YZDUxQTF2b1lGZG5PSTk2T3c3?=
 =?utf-8?B?eTdiOXlOazZsZFBYK1cvN001RGJFL2FNNU03MEVQTU9TVVdLQ1dNWXhydmdi?=
 =?utf-8?B?Uk05dW4xdVhid3VNWitRR3pJMUNROXNMMVFvUjBTYTllMVFMNzQrUFVRdU1p?=
 =?utf-8?Q?DmQ+iI+PgpppjJbDDNe8dzvFa?=
Content-ID: <B282721465BCBC458A1F3543126325D9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5c1067-10b0-4fba-b167-08dc47d9dd6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 06:00:22.8073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6chAzuRgSWc9l0MIoaqYv+ZCIJIDSSqaqdgykpLlnqtdx2KdagF5A/jCYBwGozgcqb+vDDlo3yB0PNxWrrAa9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8160
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.390800-8.000000
X-TMASE-MatchedRID: csPTYAMX1+EOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0qbqzDH9G7eTAMWCgdCzp+aA0ncQPC5QKUwCmrLlx+SdQZvX+0veCCc/a+
 +MkaUpSh4QDWoRVUbQDmy3T9OxCP66li7wmYeB3lDiyuN5FvFNkyQ5fRSh265CqIJhrrDy29VJ0
 ADqZV4ht+0sW3E5JtDkZOl7WKIImrS77Co4bNJXVZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJEUGi
 GWdjo9qSUU8zUQj5CS0oSqO5VwUObRIwCGshZuUftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.390800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 226037C40A92A8A9DD1F32622599AD63D63D8AD554AEF41E45299E9756781F342000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1617829314.2037292610"
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

--__=_Part_Boundary_007_1617829314.2037292610
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEp1c3RpbjoNCg0KT24gVGh1LCAyMDI0LTAzLTA3IGF0IDEzOjAwIC0wNTAwLCBKdXN0aW4g
R3JlZW4gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgQWRkIGEgY2hlY2sgdG8gbXRrX2RybV9nZW1f
aW5pdCBpZiB3ZSBhdHRlbXB0IHRvIGFsbG9jYXRlIGEgR0VNDQo+IG9iamVjdA0KPiBvZiAwIGJ5
dGVzLiBDdXJyZW50bHksIG5vIHN1Y2ggY2hlY2sgZXhpc3RzIGFuZCB0aGUga2VybmVsIHdpbGwg
cGFuaWMNCj4gaWYNCj4gYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gYXR0ZW1wdHMgdG8gYWxsb2Nh
dGUgYSAweDAgR0JNIGJ1ZmZlci4NCj4gDQo+IFRlc3RlZCBieSBhdHRlbXB0aW5nIHRvIGFsbG9j
YXRlIGEgMHgwIEdCTSBidWZmZXIgb24gYW4gTVQ4MTg4IGFuZA0KPiB2ZXJpZnlpbmcgdGhhdCB3
ZSBub3cgcmV0dXJuIEVJTlZBTC4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+DQoNCj4gDQo+IEZpeGVzOiAxMTlmNTE3MzYyOGEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBE
Uk0gRHJpdmVyIGZvciBNZWRpYXRlayBTb0MNCj4gTVQ4MTczLiIpDQo+IFNpZ25lZC1vZmYtYnk6
IEp1c3RpbiBncmVlbiA8Z3JlZW5qdXN0aW5AY2hyb21pdW0ub3JnPg0KPiBSZXZpZXdlZC1ieTog
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZ2VtLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMNCj4gaW5kZXggNGYyZTNm
ZWFiYzBmLi5lZTQ5MzY3YjYxMzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2dlbS5jDQo+IEBAIC0zOCw2ICszOCw5IEBAIHN0YXRpYyBzdHJ1Y3QgbXRrX2RybV9nZW1f
b2JqDQo+ICptdGtfZHJtX2dlbV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICANCj4g
IAlzaXplID0gcm91bmRfdXAoc2l6ZSwgUEFHRV9TSVpFKTsNCj4gIA0KPiArICAgICAgICBpZiAo
c2l6ZSA9PSAwKQ0KPiArCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gKw0KPiAgCW10a19n
ZW1fb2JqID0ga3phbGxvYyhzaXplb2YoKm10a19nZW1fb2JqKSwgR0ZQX0tFUk5FTCk7DQo+ICAJ
aWYgKCFtdGtfZ2VtX29iaikNCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+IC0tIA0K
PiAyLjQ0LjAuMjc4LmdlMDM0YmIyZTFkLWdvb2cNCj4gDQo=

--__=_Part_Boundary_007_1617829314.2037292610
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKdXN0aW46DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTAzLTA3JiMzMjthdCYjMzI7MTM6MDAmIzMyOy0wNTAwLCYjMzI7SnVzdGluJiMzMjtH
cmVlbiYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYj
MzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xp
bmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5
b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3Ro
ZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOyYjMzI7QWRkJiMzMjthJiMzMjtjaGVjayYjMzI7dG8m
IzMyO210a19kcm1fZ2VtX2luaXQmIzMyO2lmJiMzMjt3ZSYjMzI7YXR0ZW1wdCYjMzI7dG8mIzMy
O2FsbG9jYXRlJiMzMjthJiMzMjtHRU0NCiZndDsmIzMyO29iamVjdA0KJmd0OyYjMzI7b2YmIzMy
OzAmIzMyO2J5dGVzLiYjMzI7Q3VycmVudGx5LCYjMzI7bm8mIzMyO3N1Y2gmIzMyO2NoZWNrJiMz
MjtleGlzdHMmIzMyO2FuZCYjMzI7dGhlJiMzMjtrZXJuZWwmIzMyO3dpbGwmIzMyO3BhbmljDQom
Z3Q7JiMzMjtpZg0KJmd0OyYjMzI7YSYjMzI7dXNlcnNwYWNlJiMzMjthcHBsaWNhdGlvbiYjMzI7
YXR0ZW1wdHMmIzMyO3RvJiMzMjthbGxvY2F0ZSYjMzI7YSYjMzI7MHgwJiMzMjtHQk0mIzMyO2J1
ZmZlci4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGVzdGVkJiMzMjtieSYjMzI7YXR0ZW1wdGluZyYj
MzI7dG8mIzMyO2FsbG9jYXRlJiMzMjthJiMzMjsweDAmIzMyO0dCTSYjMzI7YnVmZmVyJiMzMjtv
biYjMzI7YW4mIzMyO01UODE4OCYjMzI7YW5kDQomZ3Q7JiMzMjt2ZXJpZnlpbmcmIzMyO3RoYXQm
IzMyO3dlJiMzMjtub3cmIzMyO3JldHVybiYjMzI7RUlOVkFMLg0KDQpSZXZpZXdlZC1ieTomIzMy
O0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtGaXhlczomIzMyOzExOWY1MTczNjI4YSYjMzI7KCZxdW90O2RybS9tZWRpYXRlazom
IzMyO0FkZCYjMzI7RFJNJiMzMjtEcml2ZXImIzMyO2ZvciYjMzI7TWVkaWF0ZWsmIzMyO1NvQw0K
Jmd0OyYjMzI7TVQ4MTczLiZxdW90OykNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKdXN0
aW4mIzMyO2dyZWVuJiMzMjsmbHQ7Z3JlZW5qdXN0aW5AY2hyb21pdW0ub3JnJmd0Ow0KJmd0OyYj
MzI7UmV2aWV3ZWQtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMz
MjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20m
Z3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZ2VtLmMmIzMyO3wmIzMyOzMmIzMyOysrKw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtm
aWxlJiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9nZW0uYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0u
Yw0KJmd0OyYjMzI7aW5kZXgmIzMyOzRmMmUzZmVhYmMwZi4uZWU0OTM2N2I2MTM4JiMzMjsxMDA2
NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9n
ZW0uYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2dlbS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTM4LDYmIzMyOyszOCw5JiMzMjtAQCYjMzI7c3RhdGlj
JiMzMjtzdHJ1Y3QmIzMyO210a19kcm1fZ2VtX29iag0KJmd0OyYjMzI7Km10a19kcm1fZ2VtX2lu
aXQoc3RydWN0JiMzMjtkcm1fZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7JiMzMjsNCiZndDsm
IzMyOyYjMzI7c2l6ZSYjMzI7PSYjMzI7cm91bmRfdXAoc2l6ZSwmIzMyO1BBR0VfU0laRSk7DQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtpZiYjMzI7KHNpemUmIzMyOz09JiMzMjswKQ0KJmd0OyYjMzI7K3JldHVybiYjMzI7
RVJSX1BUUigtRUlOVkFMKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7bXRrX2dlbV9vYmom
IzMyOz0mIzMyO2t6YWxsb2Moc2l6ZW9mKCptdGtfZ2VtX29iaiksJiMzMjtHRlBfS0VSTkVMKTsN
CiZndDsmIzMyOyYjMzI7aWYmIzMyOyghbXRrX2dlbV9vYmopDQomZ3Q7JiMzMjsmIzMyO3JldHVy
biYjMzI7RVJSX1BUUigtRU5PTUVNKTsNCiZndDsmIzMyOy0tJiMzMjsNCiZndDsmIzMyOzIuNDQu
MC4yNzguZ2UwMzRiYjJlMWQtZ29vZw0KJmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48
L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_1617829314.2037292610--

