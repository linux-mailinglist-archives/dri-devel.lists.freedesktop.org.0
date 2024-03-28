Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E3588F5A1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 03:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2031610E13B;
	Thu, 28 Mar 2024 02:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SP3G8sl0";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="md4hSodw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7E610E1E4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:56:13 +0000 (UTC)
X-UUID: b9735d1cecae11eeb8927bc1f75efef4-20240328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xxOBAqj1jyLEP1+YBCHm0ImbFc1DwGUpLeu/g8rVjG8=; 
 b=SP3G8sl0RG3TZ4IOzCC7yB9Ek2bD0pU5MotaL94om+2bB3c3lJByvnPjoTKOVIihzXg85eo1GVcX2KvNHgUAVNXFYWZH6JBTNgx09UmDLuvAa/pgAvWsd+UKedl/iBbfHwFPQbTRAfiZlXrgY3B56wFTxBgTLrjn3xC+T4P+4xM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:dee82afb-6ecb-450e-9e51-4d7ea8598f3f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:10a78585-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b9735d1cecae11eeb8927bc1f75efef4-20240328
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2138010086; Thu, 28 Mar 2024 10:56:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Mar 2024 10:56:06 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Mar 2024 10:56:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jebiS400vb4o+7UysYiX2IKmheqin47750q7oxurM9Xa+qkV9n9YS6YdqLRApXeExMcDLGHDZKQ+7a9dDEbjYVYWTmLJumyS6sUKL8Y0dH4s7vRFEd4ElCAYrvUikQ4gU29RfdXCQ/6QtJoZpl2aRtgFYzA6hJDJ3vfjcutpxtb+MWxObKZqQZxcp1Ff+JG3pHSPJO9hr8wib1XN6kzmwBedYBFiBJ7rWNPlVpw/Wu/yIaKmsbu+2MzPc37n65q/CFf84yGjoZjcXBU8yxccyOjqHVo67muKLouqwN/rb8CH21jJX6ZqHlcDkcasuvpH45R0zNzgu+Rg8biRT0G9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxJ3vGB415isMxJASvxuv19etNB9wEgwmbFbGMESKlw=;
 b=mkAUTjTgQ+lanHoq6zPosmaGH1So248g1qO4YskK5IM084KoJm27ZF3r2FsNFzCrvykYvJ/yGJ1+Xx5XRTAQVLGgd27wz1ssO20CheBeLdHp/E8QkD/3tFR/7EnFm0VWElNMPkeCtorf3NPZfNyb7rGyWB73UFB5KyqD54j2HXgS96yeY0DPY3DeAlSaPaYMTh+OGKs/c5ywwR059q9xoIy0MQeOmhe3AGCahnPAPils9s9GfOZpFSteji4F7UpnpD9Mt8ILUeXo8q8GbXPEGvOVaTpIQhOhE+nIQz4FCQ7aqMCuxw2+UjUo4KdTfU9tARhjpl781NAhXqAyWu9heQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxJ3vGB415isMxJASvxuv19etNB9wEgwmbFbGMESKlw=;
 b=md4hSodw7XhLUUfQQ/8BKgsSXek+WQTohVTxI1WgEsNQLj80pOOhQXmZWcX01LFkNorjRV9IQLkzE+/S5YpjRJs4xPHtiSNdYCAsvVfbJRtvez0hbFg2wTBiQAnzNSLIAbPo/3OfcOE3WezT4D5ahNiSTBR8Q3458EllYfx0E+4=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by PUZPR03MB7254.apcprd03.prod.outlook.com (2603:1096:301:102::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 02:56:04 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8031:ae41:afdd:d0a4]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8031:ae41:afdd:d0a4%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 02:56:03 +0000
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
 <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 11/14] drm/mediatek: Support "None" alpha blending in
 Mixer
Thread-Topic: [PATCH v6 11/14] drm/mediatek: Support "None" alpha blending in
 Mixer
Thread-Index: AQHafBnw+V1hSeGslE6y+DwkKP+KhrFHuPwAgATFvwA=
Date: Thu, 28 Mar 2024 02:56:03 +0000
Message-ID: <30b3c349d8a42bc6921dc6846e043358555a548a.camel@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
 <20240322052829.9893-12-shawn.sung@mediatek.com>
 <3a427289f49b196d99934b9b4aaebeeebb13c628.camel@mediatek.com>
In-Reply-To: <3a427289f49b196d99934b9b4aaebeeebb13c628.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|PUZPR03MB7254:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3xTESJCYDKHlVMsMOf9cNgFmr/W8pzI8WutOxVhM8O0oHc/mDWB/sUEL6G+KU3dErb2X3aR22zZlG5BDqClt0A2lBY7IG4vMZ+Kp2RU87RichovhM5N05M7kjEuMSOnrZfOZh4eBmtvy8iCxjsbrp/QJitUU9jqGam3zSeZLG2OvD4nZFrHXIR7Zz2GbhB9n0Xrkkfk+CtNPvHMbGhGRdXMQShzRrNuH9ZHlCLBxwuJv5+sIi1KE6KPx6iOOJimPSn3dU1OvX2vgAFQ/spBVRSSgGadaJR1MFF0ClpylBdsSE2XxvmIUS2rHM3e06EpHUGsaW5R3zZ+rAKE7ggtZDDtS5S4yhocUEGX+f0TQdwF1nA38zM4NKRT/DIIpbVGJ9p2qI3q7OArXqhxqr81dfqigOlZUaCRLUCqqLplCxjCYnQYJLFZ/0MXavkFAyawnFEu4g9rxIvytpFnDLj/OCCzslqQP/UxZPwBz14dKjFLFFZhv4I0vHw8SgxXUnTNNR64KF8BaGqfUCKItkuqGIzhGbTZUHj0FWz8DTy0MYFT977iUtHTN+lhzTC9b+s/oyOrMHkNfJxoSm6BsXvFHf28+51/sY3d3QJpGVXwbSAgVPgL+ZQ9nVc8cnYdt15D7o031WTEhTt53dkbWVDrTwp4OEsKSGg/PZ9nBjlSdmKY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U01aYWJXUFdzVWJzT2twVVppSmFpekc0K2tWbUUwQVdxd0E2SklXb0x5SFNE?=
 =?utf-8?B?SFBIWkFHdi9CcGtPVGJoc0ErMjV3U0luNGV4R25TeW16WFhUSnpyc0UyNkdB?=
 =?utf-8?B?UUQzd2lpZm9Xa2ZTbTlpWFZGTUVpdEhLbCt5ZDZ4RHlXV3o5dEpKSkJoT2pM?=
 =?utf-8?B?bFNEbTU1YTNybzBnOU12NGZPOThSN21PTUhOSWZGQmVHZzBNdHNzQ1RZRzZD?=
 =?utf-8?B?QVVJVHlIZTU2aXRkZ0JJVU90R2wvQWpDd3ZzcDdGekVtY3kyMytjVjcrVzlL?=
 =?utf-8?B?ZjdWTFFaWXdTcVNoanQ3R1NFbTBONXF5dE9jb0xkdmRJY1IrMWQvVEI1SG5H?=
 =?utf-8?B?MG9aYlhwSXVBMnlNRE11SVFsaFZLdXhhL0lpcm04RTVKZ0U4cVRLenVPWElT?=
 =?utf-8?B?eGlGekltMFBFczFWc2l1TE9ZdjNQWnhQak5nb3Q4blJZZGEzNzN5LzlhSWZ2?=
 =?utf-8?B?Q01xN0V2ZlBuSVNqTENobksyR2lSbEFLOTloRlNWdUhxcmw3WlR5cG90WE1X?=
 =?utf-8?B?aVNQMGZMUWxiWnI0dkN0clJrYnZrZEpLVSs5NG5lMzdOSUlpc0t0YWx4THBk?=
 =?utf-8?B?R29jcVhPWitMQVlhZXhWMDl1LzZETy9DNmlqSnZKV0kzb2tIWWl1UmhrK0pC?=
 =?utf-8?B?MEFLbm5zcmZNVE91TnczS0lNckIyc2liNEFrRVlhSmE2NW9nNGFOaEt5NHd4?=
 =?utf-8?B?eWdBbGxLLytkblVzZitWdzhpUmxEWlVnNS9PaWtqUUdBL0EwTU9BdGtvajJZ?=
 =?utf-8?B?c1c1enVpV3IxM3lVaEtVZU5mVUdPSWlJZFRabmNsOEZOc3RsejNsR0JCRFI3?=
 =?utf-8?B?TE5qT08zTEtRd1NXOW9UZnA3M01yYXgvblNWZ1d4YzlhQzJaWTRnZ2NlbnJF?=
 =?utf-8?B?RVJ4SW1iUzI3TW5pb0FhQjFkZjlIM0ZINm5zM2pNbEhUN1hWaytnL1NIVld1?=
 =?utf-8?B?RXNYVWNTWEJYMXpRWjlBNE1VMXR6a290TjVmZkR3ai9Yb1UyMnltQmszRURW?=
 =?utf-8?B?SHg0bDJXRTl5Ykc1cStxY28zOXdtNjFiNE5zQ2YzYXROd0NET3AyTEs4OHQ2?=
 =?utf-8?B?NnUzT21jVURqWUxoQmp0U2FBa2k2aGFHM1I1V0M0NEsvSFZWNkI1K1NBZWlS?=
 =?utf-8?B?NjZQa2R1b3lpZ2laUENqek1Gd3M0dFZLQTVIbFVxZGdwVkFDSjFyaXozS0FJ?=
 =?utf-8?B?T1hVMUU4WTFPcXNvaFlFTXFUTnRDeGtsUWFBV0MwREd0NTZXN3oyRnZZNWg5?=
 =?utf-8?B?SHRoWnVhTVdvUDFBRzQ1Z2pPSWhRd0IwUHRqL0hNcDFTMk5ITVhmazNZZ0hS?=
 =?utf-8?B?RFpidnRZbnN5QmJramdjOHorK0RYUTQ4QURpeEhiM2RlaHRyTDNjYkR1S3dt?=
 =?utf-8?B?d3poSi8xQWN1RnBaSjFtc2RrMU1nMzFQL1VNVXo0Sm1ubE5Ec0FJcWl5cXNS?=
 =?utf-8?B?cldkRmNvTFpVZ3c5enF3T1FwaDAxVjEra3hNRzVkaDhLUjExcjhoOXJlTjVV?=
 =?utf-8?B?TVExd0dqcEhveXpjbVlubnBReG5YbFNYanVERUFtSStvK3U5YXlOUStPUHVy?=
 =?utf-8?B?K1kvZE5OSkVlUlBUeFVIMTNzQmNwUFoxN2J4RVcyWXRhdWRGM3VvSVFvbTV1?=
 =?utf-8?B?RWdrMVBOa1NkMTVsL09hUDBFQ1NQNkR0THpyV2dtWjN5N2ppMkhHbWhZMitl?=
 =?utf-8?B?bmFLdGo5WElIbjFNSTlWdW90cWQrUjg3QmlqQjB5TVRrcnRSUXBtK29tc3Zq?=
 =?utf-8?B?cFBZZ01ZOCtqb2dWU1V2ZkpwaDBhczlad1dRdUp1QlBjNmVSRmV5UnlLRmln?=
 =?utf-8?B?V2JrYXUxU1VZSFUrRWkweExKaEF0K0VKdzZ0aEt6UVZROEI1dnYxUVA1bXJs?=
 =?utf-8?B?QkhhMlVvQkhZWW5oL28yTjFyK2wvM1hZRldEaVExZWxCcHlLVyt6MHcvTGkx?=
 =?utf-8?B?QWNQdWZ2dE9hdFZtYzVFd3g4Smd6SlhlR0xuTSsvclZodllTWEFJM1FRdFFV?=
 =?utf-8?B?a1kzN1h4SmJ0amRKcXo3dUJXSXVwSWsrT3cwdy9RUmpDVkdsQ0d5UHZNMHdr?=
 =?utf-8?B?U0IzSUE3RG1XM0dSYzJQdmN4d28rY0ZTL0RwVnZOMFJmRUpaVVBVdnYrMmhG?=
 =?utf-8?B?SXVJaCt4a0FvRW9aUGtuU1dtcE85ZXdIRXFscnBzZzZOUFNaYytmUnFoZTBV?=
 =?utf-8?B?aHc9PQ==?=
Content-ID: <2AD3187DAD9D3A49AD986D5774B9F5A4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7aecd1f-8200-4032-cf6a-08dc4ed29b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 02:56:03.5536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6K0p5mycm4kDJIqShla7+yBzNYfD1W4fhgRt8roLIvZX2VB+EpCA/uSRxEs8inm5lupFqM8TopcktLKHfveHaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7254
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_315406074.535804614"
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

--__=_Part_Boundary_002_315406074.535804614
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIE1vbiwgMjAyNC0wMy0yNSBhdCAwMjowMyArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBTaGF3bjoNCj4gDQo+IE9uIEZyaSwgMjAyNC0wMy0yMiBhdCAx
MzoyOCArMDgwMCwgU2hhd24gU3VuZyB3cm90ZToNCj4gPiBGcm9tOiBIc2lhbyBDaGllbiBTdW5n
IDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBTdXBwb3J0ICJOb25lIiBibGVu
ZCBtb2RlIG9uIE1lZGlhVGVrJ3MgY2hpcHMuDQo+ID4gDQo+ID4gUGxlYXNlIHJlZmVyIHRvIHRo
ZSBkZXNjcmlwdGlvbiBvZiB0aGUgY29tbWl0DQo+ID4gImRybS9tZWRpYXRlazogU3VwcG9ydCBh
bHBoYSBibGVuZGluZyBpbiBkaXNwbGF5IGRyaXZlciINCj4gPiBmb3IgbW9yZSBpbmZvcm1hdGlv
bi4NCj4gDQo+IEJ1dCBJIHdvdWxkIGxpa2UgeW91IHRvIGRlc2NyaWJlIHRoZSBpbmZvcm1hdGlv
biBpbiB0aGlzIHBhdGNoDQo+IGluc3RlYWQNCj4gb2YgcmVmZXJyaW5nIHRvIGFub3RoZXIgcGF0
Y2guIFRoaXMgcGF0Y2ggY291bGQgZGVzY3JpYmUgbW9yZSBkZXRhaWwsDQo+IGFuZCB0aGUgaW50
ZWdyYXRpb24gcGF0Y2ggY291bGQgZGVzY3JpYmUgbW9yZSBicmllZi4NCj4gDQoNCkdvdCBpdC4g
V2lsbCB0cnkgdG8gYWRkIG1vcmUgaW5mb3JtYXRpb24gdG8gYWxsIHRoZSByZWxhdGVkIHBhdGNo
ZXMuDQoNClRoYW5rcywNClNoYXduDQo=

--__=_Part_Boundary_002_315406074.535804614
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7TW9uLCYjMzI7MjAy
NC0wMy0yNSYjMzI7YXQmIzMyOzAyOjAzJiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGksJiMzMjtTaGF3
bjoNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO0ZyaSwmIzMyOzIwMjQtMDMtMjImIzMyO2F0
JiMzMjsxMzoyOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3VuZyYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7
c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO1N1cHBvcnQmIzMyOyZxdW90O05vbmUmcXVvdDsmIzMyO2JsZW5kJiMzMjttb2Rl
JiMzMjtvbiYjMzI7TWVkaWFUZWsmIzM5O3MmIzMyO2NoaXBzLg0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtQbGVhc2UmIzMyO3JlZmVyJiMzMjt0byYjMzI7dGhlJiMzMjtk
ZXNjcmlwdGlvbiYjMzI7b2YmIzMyO3RoZSYjMzI7Y29tbWl0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
cXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtTdXBwb3J0JiMzMjthbHBoYSYjMzI7YmxlbmRpbmcmIzMy
O2luJiMzMjtkaXNwbGF5JiMzMjtkcml2ZXImcXVvdDsNCiZndDsmIzMyOyZndDsmIzMyO2ZvciYj
MzI7bW9yZSYjMzI7aW5mb3JtYXRpb24uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0J1dCYjMzI7SSYj
MzI7d291bGQmIzMyO2xpa2UmIzMyO3lvdSYjMzI7dG8mIzMyO2Rlc2NyaWJlJiMzMjt0aGUmIzMy
O2luZm9ybWF0aW9uJiMzMjtpbiYjMzI7dGhpcyYjMzI7cGF0Y2gNCiZndDsmIzMyO2luc3RlYWQN
CiZndDsmIzMyO29mJiMzMjtyZWZlcnJpbmcmIzMyO3RvJiMzMjthbm90aGVyJiMzMjtwYXRjaC4m
IzMyO1RoaXMmIzMyO3BhdGNoJiMzMjtjb3VsZCYjMzI7ZGVzY3JpYmUmIzMyO21vcmUmIzMyO2Rl
dGFpbCwNCiZndDsmIzMyO2FuZCYjMzI7dGhlJiMzMjtpbnRlZ3JhdGlvbiYjMzI7cGF0Y2gmIzMy
O2NvdWxkJiMzMjtkZXNjcmliZSYjMzI7bW9yZSYjMzI7YnJpZWYuDQomZ3Q7JiMzMjsNCg0KR290
JiMzMjtpdC4mIzMyO1dpbGwmIzMyO3RyeSYjMzI7dG8mIzMyO2FkZCYjMzI7bW9yZSYjMzI7aW5m
b3JtYXRpb24mIzMyO3RvJiMzMjthbGwmIzMyO3RoZSYjMzI7cmVsYXRlZCYjMzI7cGF0Y2hlcy4N
Cg0KVGhhbmtzLA0KU2hhd24NCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_315406074.535804614--

