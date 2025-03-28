Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278FA74241
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D60210E1B1;
	Fri, 28 Mar 2025 02:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="GnWRi9Gw";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="A6EyKF5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4974610E1B1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:28:11 +0000 (UTC)
X-UUID: 43c8c08c0b7c11f08eb9c36241bbb6fb-20250328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yr0+yS7NxGgQHJcY6OsusBfwQES7sGQeRt2vmXAEs8M=; 
 b=GnWRi9GwuXo9TwWTnbQq44AENcbFrspulE5UG4BPDU3zptAmEyYQX34BJftC33XtYM1AgBjZa4l2UEPQgkbVriRjbtmfq4DvFK6zuSItyTSdHC+eg2B+KS6Pup88qGg2/qKCFB+yvfJogK+14vWm7WF25XXRPH6EgFKedsKP4oE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:7a070644-614e-4a7c-aa1c-3df7a2a50bff, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:8a6c65a5-c619-47e3-a41b-90eedbf5b947,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 43c8c08c0b7c11f08eb9c36241bbb6fb-20250328
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1201568925; Fri, 28 Mar 2025 10:27:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 28 Mar 2025 10:27:57 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.39 via Frontend Transport; Fri, 28 Mar 2025 10:27:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSHK4CPvZ8ftI6zMenn+sBLIhRH8jgoZBCLJV9lcAZuFYOsaLoTaEKz4Ids4qM8kgnkKAOwGXGUoIs0OqLuNg0sNL3G2E83cdslWF/hLuTLStoc3hvmkTzJOb+FAjnVZVPmtFSxXMIvgYIenFann3D41DpkY5UhvBuU5sYUqC2929wwklE3qNy3XtGAWhFmCr8+d9BOnp99EmhF+KMELqI1xpWcWgwKImEbhHdow/q05UoR/SgDCUDkQdof/VW/P5AeUoYMq7NAFD/p1h/+AqmthXGJnVsfHQ2rkbadVavK6r6wUc7FKS/lzOpwYdg0xLxGeyfvDS8CMDV3Jhb0hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIHM4CjrU/YoOTwAmISLxRlLNL0rLLVazbNgp3IZrOo=;
 b=a+hWFIcvYInSpPmM/j1ydDh8p4cmzwc77VEZtDLrJ1Ds+CSHLwlugG9nrtjfgCpgW5EgF10bQcUWBiUkeCy5zv5345eVWPyH2PRlbdZCkAuoqlUiethhsPXjWJr9fCwehl939AqF7ieprMfL2Nz+BNKeoUo/0/z3YGq8BvV73KuwfEJHn980I3p1qXzEiLuJ05duCYBhkCPzyt9D6lzVUYZ6mHQ6S0QtTik6t6CXr8WZ2KgKU6ELJD0JrumryeEdt7RftDWmtddIxNJpWJgdy4rkZ7ecCkJjj4WBNFKPOL+tomerJ79An1MjHsSDL8nvvE87jgBe6Bea/EdtPP9HbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIHM4CjrU/YoOTwAmISLxRlLNL0rLLVazbNgp3IZrOo=;
 b=A6EyKF5qwXDiQgIYwV/r3IiQJWQk7i0ZGt1fTqlagCK/notakO+5DXevEsnhrOXlaZrbz8fWoZu9rkhdrOp0t8GA3WQ0Rm+XobbzJRgzBXUA0ne/voQ/QLbOQFsU557v8yueQrlXQOtveUdZZYLg4wNHkQBSf9t1eW8CyhBHc6w=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 SEYPR03MB8361.apcprd03.prod.outlook.com (2603:1096:101:1a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 02:27:54 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:27:54 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?=
 <Sunny.Shen@mediatek.com>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
 <Sirius.Wang@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v2 04/15] dt-bindings: display: mediatek: add BLENDER yaml
 for MT8196
Thread-Topic: [PATCH v2 04/15] dt-bindings: display: mediatek: add BLENDER
 yaml for MT8196
Thread-Index: AQHbmkSw4jLMitfh4kK4hbVE9kjlPrOCC+6AgAXRjIA=
Date: Fri, 28 Mar 2025 02:27:54 +0000
Message-ID: <1a9c53b092bdfa98464e74b405fce094ae74a94f.camel@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-5-paul-pl.chen@mediatek.com>
 <20250324-vigilant-vagabond-earthworm-b4e2c9@krzk-bin>
In-Reply-To: <20250324-vigilant-vagabond-earthworm-b4e2c9@krzk-bin>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|SEYPR03MB8361:EE_
x-ms-office365-filtering-correlation-id: 47fba102-60f8-43e5-32b9-08dd6da0254f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S0o0c01OTVdZZnJZeEwrVE4xNFlubW9Hc2dDdzFVSnFjV1lEQUttRC9FcWxW?=
 =?utf-8?B?OFE1MGk3Sjkzbi9qZUdTNHcyMjdRM29HOTVyUnk3cUM2M2F6Yzg4Rks1T3ZX?=
 =?utf-8?B?TDk1Q1d4MW1OQkhNSWdvanQ4VGlTTHd2aVJ3em4vYkJma29BWVJpR2NKNDhH?=
 =?utf-8?B?SEtSaGtSWWdINCtxeTYvU1M1SjBxaHFDVmVYZmhYQXJjQ0JWd0lrVVNWRFhz?=
 =?utf-8?B?NEpkYzkzY0QzUXNFNTVMNkdvR1R5Y0I2RkFrYkgwNkJFM2xZUUNnbWN4UUN1?=
 =?utf-8?B?NlFGeS9VMzBPeHhsUFppejc1R2ZvK1JCZE5QZ2V2Z0xBZjNDckFpdG91clZl?=
 =?utf-8?B?Qi9yWXRuRnQ4cC9HY0hvNDJGS01CNGp2WFlKazlTSVVaSWxQVGQ0cEhWQ0ZN?=
 =?utf-8?B?TFNlUklOQTVNcDQxeTdWWTUrWWdiYmlyVGxmaXVaQnhmWE1ZeS9nRFZsU2Nu?=
 =?utf-8?B?V21rUE5mUllGWkZhMWlId01XcUlYZ2FsQWlrM1R3bjRDU3pMVWt3MWdPWDQr?=
 =?utf-8?B?azJIRE9oT3p5dVprQzMvbVRVN3FUeVY5Z2xLcVdiOTFVekREODZoSWRiZDlM?=
 =?utf-8?B?anpTdFJKbEZGS1FWNHQ2VkZCSUpkWFMzeWVieW9wdmxGa1BucWpFaE0yc2VY?=
 =?utf-8?B?OGcvZ01Lc3UzSGdVL1MwMWpiOG9OZTNsR3hFWW53YXpnaG9ZQ2taaTZVakhE?=
 =?utf-8?B?OUNWb2pMVTB2ZHNCM01JMmFXZzJxQ1JGREZsRWJvT2tER3l5eXZwQlhSZHNv?=
 =?utf-8?B?SEtGbEpOdDdjV3F6Ym9zY01yZHdDQVVwM1FHU1QvY0VObUNGbDNjUTRGZ29Z?=
 =?utf-8?B?ekt2WU4wMU10WmxCY2FrTlk5dGxUeGZvQ01kejdHeTd6SHpPRHFSamFWMGV6?=
 =?utf-8?B?VDVCWS80SGZoOWpUSmFXZEViQ1hWbTgzbXBuK2kvcCtIeUNmY2ZGNVlkcndV?=
 =?utf-8?B?MzJDWjBXNzBZYnhWRkpYdUlPeThQeVZ3ZHpXS2IxVXUveVhMMURsNVUrTUly?=
 =?utf-8?B?cHp6U1JUSlNmRjdDZTRhOElrdjFaR2ZQTDkwa0RPWXlMQWRSNjNLLy8vd1NB?=
 =?utf-8?B?ZTRkQnV5Q0c3V0RQM3NKclFRdTJtTGI5WjBLZkRYcytROFdURUgrdE1yUFRC?=
 =?utf-8?B?aWpiblFkbGNIUUM0MjNZQXhqWWxKRFBObHN0WGJDNHVPajJRdURzQ000bHhE?=
 =?utf-8?B?SnB0cnp3Z0J5bXNZM0ZhMFFnWC9IQll6NThwNzROQzk2STNlK1cwZitzclFW?=
 =?utf-8?B?Qnk4cGJjMjZ4bUZTOStCeiszWHcwMDBXRDd5ejkvZUVncWFidnVtTm0yQ2Y0?=
 =?utf-8?B?bUJ5RmxZczRRVkxLMlJUbmpOYUM4aXF5UWlVRXZPMElMVVlGdEs4eFBsMk9p?=
 =?utf-8?B?NlpYVWZnMXBFM3pSOFRjWndWZ1JEL2JuU2VxbEpWUmdYU0lzc01EYmxxTUFu?=
 =?utf-8?B?TVRqYlJreWgxMWk1Z29mWEZnaVZWNWhwSUJLbHZNQk0zSDRtZFRsWWlRV0F3?=
 =?utf-8?B?bks5R1R5RGpkY2NWdUJ4SHYrOVE5cVJBbjhHNUJIcGhOU3F5T296NytWY3Fr?=
 =?utf-8?B?Z0s1ZTI2MGRaVVQ5K3Z6bFBHamhGakxXZ0FvZ2FjWjV6TU5uVFZmb3BTUUxD?=
 =?utf-8?B?dzVnOC96WnNDcFAycGtGS2tIR1hrczFTelVpeHF5NWJSc0ZCVldwNHA2UkJP?=
 =?utf-8?B?SEFpN0lvd3FCWDlLeTV2dXNtaFM0MWs2MU0vQVJ2ZFkvempCQlJZaHkrSVB6?=
 =?utf-8?B?eFV1N2xneG9kbDhGVTMybHFBQkxvWi8rWFZub0xnakdibElCSldCYmx0cmQy?=
 =?utf-8?B?S0x1TE5BbE9JZE1LR2thWTByejVPKzFVTnQ4WmdDMHpuTm5MVXczamhiTE9w?=
 =?utf-8?B?V0V6VEpYRk9CeHNGd2cvbEE4MGN0bHBtZm9vQm4ycGNCT3JjOEFBbWpjWWpj?=
 =?utf-8?B?d2hxM255TXE4SFl6YWlzcXdWQVM1aVRjaHZadDVUQ0xPNWtxR24yS0ViU09n?=
 =?utf-8?B?Rm5nUHEza3FBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEVFSjNEYlpMRmE4K0JUMXBRVzllZDVPcU5tZ3p0QnZCOFU5OENaQWpwM1FD?=
 =?utf-8?B?azdscjlNenBnMlpnSGJSdVBuTVdoL1dZNGtjSFBlTXZLdnFDZXNkeGRUeUlZ?=
 =?utf-8?B?NDNMUDJZcFNHM3N4VHBramRyYUcvQS9VUFBSWTlCNzBXeEl1NFJqVzY5NUVY?=
 =?utf-8?B?d01lc0pDMWJDY09CcGt0bks0NGkxRko5RGdiOXlndUlMMUpKNFVEcTJHNHhX?=
 =?utf-8?B?elZ1Z1pJU0F5VXA2TEJuSWZRbWVsQTVOanUyQUpjbURZTDJhZThvQ0FwbTE3?=
 =?utf-8?B?OU5KUUR4blpCRTFMQW9TT3UzcXF3OERwbXRrTXI5dmNxMlN1QTljaXArY0Zs?=
 =?utf-8?B?UGR6ME5mRVNqYVpoQjJWVGtTOG5oVUtOc3BvbGk0VGt3WWhocDM5bzVvaTNH?=
 =?utf-8?B?NE9RWkErTTVxd3FPVm5LMkdITE9PRGhjZ01ZQ0R4aTZZMXJ6QUdPMm45S1kw?=
 =?utf-8?B?eU1JN0ZURmh0QlBFTzBxdXp6aVFJS3FzT01aLzdrWmxVOWpJNVovalNPam9k?=
 =?utf-8?B?eDdTZWgvS1NwT2NEY29WVm8yeU1LQlFENzREYXUyOW1NZXMwZkQyTndJWGph?=
 =?utf-8?B?dWxPeVgvN0IwOUx0Z1RBcCtINDdYdXcwcExCS3ZHZ0k4bzRreWlnbFg4SDIz?=
 =?utf-8?B?M3oxdFR2T2tLd0J6ODJjVzBlVWhDUGUvelE5Y2Y2Y21SRUVvU3h2Y1ZuamZN?=
 =?utf-8?B?OUZBUXdxU2R0Ni95NmlJSzRlNnN2bldWTXBrK1VIZnRxZEF1c3dTWE02NXFH?=
 =?utf-8?B?RmJWM1hjM1ZzMUlNMDE0TFFCeHZBQ3hSSjI1ZHRlYUo5SEFoUnV5ZktxZmVX?=
 =?utf-8?B?dUFOMThKT3haTitpSzVJdmp3T1V2WFNTblNSZkpORzZzaWRwNlA4VFBrZEhD?=
 =?utf-8?B?dDc3TjFJN3Q0SENaM3RheTIxcUhYTm5PNktjSkkzRCs5QStnQi9EeWVyYmVE?=
 =?utf-8?B?Q3pDQk1uenlTbjFXUEdXMFE2S0QxMEFibTczbnFsNTdOSFNNV1Urem9td01F?=
 =?utf-8?B?blJVekZ6MUlIT3FuNC9UR2p4RVI1ZkVQWTRYTVdsM0JOa256N09ieW9kSWho?=
 =?utf-8?B?R0hVRENDblYzZ2lFK3ZSVGYzdS8xQXh0ZjU2R2xHd2pNaUFpclU4OTNxZjFM?=
 =?utf-8?B?RWFUUnMxRElIclJZdHp5Y0pCV25wL0tGV0lrdmhYM0RuT3Yxb2lHUktJUHp1?=
 =?utf-8?B?U1Y1Y2hjRlZqN3BwUGdlZ2pOUEx1OEwrcWZ4UkNTQnpLV2RQZmM5MW5GeGlU?=
 =?utf-8?B?enNZT0tBZlhMVFR3YklqTHNBbWpmRk8ySUo0eFphODExYjQwaklhWnhuYzB2?=
 =?utf-8?B?OTZXOEdlcVVmdzI3V2xiT0xWUlhIWFFobm9sbXNiWWRYZTEzWE9rdkFQZitt?=
 =?utf-8?B?aWNDdkNHZ3JqVEtySVh3ZEMyU2RiTUk0T2lTTVBNZjlIMC9mSExrWVNRZlFw?=
 =?utf-8?B?RjBxWWxWWlR6UUxzSGtGU2JrdkpkLzQyUkV1dXZpRTZoUUk3V0wxVlJoOXVs?=
 =?utf-8?B?RFUzMUtad25SUmRBVmJRUFZIVHBSdXFjMVJuWU92UzgyclNIRlozVENXaldG?=
 =?utf-8?B?aFdqYmFPOU1hSlhLT0dtekVwNElSK2JvU2hydnN2SDkzNk42R0oxbHV1VCtI?=
 =?utf-8?B?eGErd1k4WTFpUUNueEpNMzdkUUMyM3B0K2hiZU1KR1VxakhqRWt4dzZsSFFT?=
 =?utf-8?B?amhhcHdDNTNXcjBOUDdaeFNiT3BFK1phUkhlamIzWHExY1YxN3ZGU2VqZDhO?=
 =?utf-8?B?VXdmd2R3WC9OUlptbGZENWZQZURsQzhrdWs1VnhNR2hOUHNNSCs0RDVuRUtE?=
 =?utf-8?B?WlRHMWpHeVZxZkM5eGNObENZa2ZpdzE4Q3hmUjZrNkFzYTdlR24rSmJRR2s4?=
 =?utf-8?B?UEs2WHpXTXA0QzNXNGtrZE9VcGFWZ3VpbTA2WGNtNTNHYTRmUXJJT2Y1VmI4?=
 =?utf-8?B?WkQ0ZUllN3RmMCtpbVlGYUFGT3dIUFkwWjdIWmRlVGdSQUVyUCs5S2ZnVWFq?=
 =?utf-8?B?TldpczViZGhyWFpuNmZGbGtiWnFFZW9OUHdSdEw5akEyR2VIczk2S09GbkRr?=
 =?utf-8?B?cnpTUi9uMzFQMFluK3laQjZmY2h3TTN3MVo0eHhaUDJNZEhRbks1bTVsMlVp?=
 =?utf-8?B?a2pobFZmU3JLai9FSlRSL0VXZjQxU1pQN2Q5cW9pVWdkbUNic2o3bkpQcUZu?=
 =?utf-8?B?dnc9PQ==?=
Content-ID: <20C1E7480F7F094DAB4F74918B930C5A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fba102-60f8-43e5-32b9-08dd6da0254f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 02:27:54.4398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpm8VqHue/ozBfFAcK45lv8h0lvvdISeZnYl/SMxbwXr+3PMf7N/2f3x/JjID74nEPl/GW3E2tChGYf7S3UY7EmY4o/kXAR3XiwRMSRfTd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8361
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_618601591.1948094785"
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

--__=_Part_Boundary_001_618601591.1948094785
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTAzLTI0IGF0IDEwOjM2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiBGcmksIE1hciAyMSwgMjAyNSBhdCAwNTozMzoz
M1BNICswODAwLCBwYXVsLXBsLmNoZW4gd3JvdGU6DQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gK8KgIC0gfA0KPiA+ICsNCj4gDQo+
IFdoeSBkaWQgeW91IGFkZCBoZXJlIGJsYW5rIGxpbmU/IFJhbmRvbSBjaGFuZ2VzIGhhcHBlbmlu
Zy4uLg0KPiANClNvcnJ5LCB3ZSB3aWxsIGZpeCBpdCBhdCB0aGUgbmV4dCB2ZXJzaW9uLg0KPiA+
ICvCoMKgwqAgc29jIHsNCj4gPiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47
DQo+ID4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDI+Ow0KPiA+ICsNCj4gPiArwqDC
oMKgwqDCoMKgwqAgZGlzcF9vdmwwX2JsZW5kZXIwOiBibGVuZGVyQDMyOGQwMDAwIHsNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1ibGVu
ZGVyIjsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MCAweDMyOGQwMDAwIDAg
MHgxMDAwPjsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8Jm92bHN5c19j
b25maWdfY2xrIDI5PjsNCj4gDQo+IFdpdGggZml4ZWQgY29kZToNCj4gDQpUaGFua3MsIFdlIHdp
bGwgZm9sbG93IHR0aGVoZSBmaXhlZC4NCj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQo+IA0KPiBCZXN0IHJlZ2FyZHMsIA0KDQpQYXVsIA0KDQo=

--__=_Part_Boundary_001_618601591.1948094785
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDMtMjQmIzMyO2F0
JiMzMjsxMDozNiYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZp
ZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtGcmksJiMzMjtNYXImIzMyOzIxLCYjMzI7
MjAyNSYjMzI7YXQmIzMyOzA1OjMzOjMzUE0mIzMyOyswODAwLCYjMzI7cGF1bC1wbC5jaGVuJiMz
Mjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOythZGRpdGlvbmFsUHJvcGVydGllczomIzMyO2Zh
bHNlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZXhhbXBsZXM6DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMzMjstJiMzMjt8DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1doeSYjMzI7ZGlkJiMzMjt5b3UmIzMyO2FkZCYjMzI7aGVy
ZSYjMzI7YmxhbmsmIzMyO2xpbmUmIzYzOyYjMzI7UmFuZG9tJiMzMjtjaGFuZ2VzJiMzMjtoYXBw
ZW5pbmcuLi4NCiZndDsmIzMyOw0KU29ycnksJiMzMjt3ZSYjMzI7d2lsbCYjMzI7Zml4JiMzMjtp
dCYjMzI7YXQmIzMyO3RoZSYjMzI7bmV4dCYjMzI7dmVyc2lvbi4NCiZndDsmIzMyOyZndDsmIzMy
OysmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3NvYyYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7I2FkZHJlc3MtY2Vs
bHMmIzMyOz0mIzMyOyZsdDsyJmd0OzsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOyNzaXplLWNlbGxzJiMzMjs9JiMzMjsm
bHQ7MiZndDs7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtkaXNwX292bDBfYmxlbmRl
cjA6JiMzMjtibGVuZGVyQDMyOGQwMDAwJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMzMjtjb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTYtYmxlbmRl
ciZxdW90OzsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3JlZyYjMzI7PSYjMzI7
Jmx0OzAmIzMyOzB4MzI4ZDAwMDAmIzMyOzAmIzMyOzB4MTAwMCZndDs7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMzMjtjbG9ja3MmIzMyOz0mIzMyOyZsdDsmYW1wO292bHN5c19jb25m
aWdfY2xrJiMzMjsyOSZndDs7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1dpdGgmIzMyO2ZpeGVkJiMz
Mjtjb2RlOg0KJmd0OyYjMzI7DQpUaGFua3MsJiMzMjtXZSYjMzI7d2lsbCYjMzI7Zm9sbG93JiMz
Mjt0dGhlaGUmIzMyO2ZpeGVkLg0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtLcnp5c3p0b2Ym
IzMyO0tvemxvd3NraSYjMzI7Jmx0O2tyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZyZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRv
Zg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtCZXN0JiMzMjtyZWdhcmRzLCYjMzI7DQoNClBhdWwmIzMy
Ow0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+
PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioq
KioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwg
bWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFs
LCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNj
bG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252
ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2Vt
aW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBv
ZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVk
IHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1
bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBv
ciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwg
cGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRo
aXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpk
aXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBU
aGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_618601591.1948094785--

