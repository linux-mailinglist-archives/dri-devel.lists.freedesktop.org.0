Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4E995FC4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 08:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000AD10E650;
	Wed,  9 Oct 2024 06:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uXWeA760";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="R0lXtEvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C550D10E650
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 06:28:09 +0000 (UTC)
X-UUID: a3d1ebde860711ef8b96093e013ec31c-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gsqbh8td0MPQzoi6T7OvtFiehleal+gQZTgnHFy+ymI=; 
 b=uXWeA7606DJ4sIeSmg3yeUWa0pl66jKi3UwkckDfwxt1L4VCJLAE1qk7N3aXX7MWmfRidvmp5lpm/QC7I/XJEMg+AvrU79HnIpVRp1Tm9Rio3tINmBSPAI1kyYecALD81Up2EELKeBwpucSRUHJ10SGaMc4pDq5DeIw3rufoKpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:503e3033-7de2-469c-b601-b52d79aa96e2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:b7f4fb40-8751-41b2-98dd-475503d45150,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a3d1ebde860711ef8b96093e013ec31c-20241009
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 66755075; Wed, 09 Oct 2024 14:28:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 14:28:03 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 14:28:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvQfxPNnCpb5Zwn1hhh1FVHU3B8F863uMUS88YQlfntOaGcYGW60Us2Eq2orG8DsCWzV65H2a35R2m2A0WEIczCjxkvdmemO7ClI4iowCFiGvq7rq+WNsgTC5igwplPzttW1eOerC3PB8Y/FHgyRmqfA//bP5zwJNQlBYsrP+ZKPDki7j506oEEatYsDdPPDjrhWxTu8HPi8URHtnyEyPTN2hZiva3ziGplgJJ7f4jCEr9pIJ++M7+K4tg1nxYJpdmaOmHij+BGveQZcDCA9clfWvXAiXyohOCdpSH1IlC5B5e8XiRa5JldrzQE4KCihipAFhE1N0Ka1CX+mdwm2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFq6ivv5pOBR6di/N8OCb/cB3GxyF80SnxcX91wVN4w=;
 b=WCLlqXBP7h1FPCuqO2Bz8pP4EvH0ez2VuyYyojSqM5o0IzzLI2PpqYpajRyH3i8raAbjXFkgo4ApEANJ7Tbeo4FA462kDhn5FYtdYM1pmuDxSWHOKEmc2tDSRMzcvNiTt+/JIb8mc56XlkGcUquDaOnKxtZPG4LMFzQoC+3wWHmUreSGgVNq0nd5JY0J0WyQdDXd0uZLufwFZijw6qkHQ0s8zq7pRkymhXWcD/oXTzRm5wbhDPaBKHsJI1IEDhMFos0f1jwHWOtWtxUyMv6RkDF6N51NBRoEYfIiU2ItJyODUJLVQ3NOIt9s8OD0MOTGI32nyNHv7wmbRSj3Z/hp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFq6ivv5pOBR6di/N8OCb/cB3GxyF80SnxcX91wVN4w=;
 b=R0lXtEvXhJWkvprPRD7cnvoeaMK9cG+zorLX1taHXshlpkM17bae+taCTZt828pTw6DerrcmsoSpmzmugGpeuW48t4njgdQC+6eHpm+2P602aWK8Klumsr+PU5ZzCTi0CGlZiYNofFDlbZNypeCRM6y5PCZ58qBOmqzui7hSgGE=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYSPR03MB8632.apcprd03.prod.outlook.com (2603:1096:405:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 06:27:59 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 06:27:59 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "djkurtz@chromium.org"
 <djkurtz@chromium.org>, "Markus.Elfring@web.de" <Markus.Elfring@web.de>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 04/14] drm/mediatek: Fix XRGB setting error in Mixer
Thread-Topic: [PATCH v3 04/14] drm/mediatek: Fix XRGB setting error in Mixer
Thread-Index: AQHbGhFoymvl7lViUUem4QhUCh6QILJ99J+A
Date: Wed, 9 Oct 2024 06:27:59 +0000
Message-ID: <2f1aef50c4a72f0d901191e18aa537e62cbc1fd1.camel@mediatek.com>
References: <20240620-igt-v3-4-a9d62d2e2c7e@mediatek.com>
 <81ce44fa-a972-44bd-ae80-6144a8ac4c2f@web.de>
In-Reply-To: <81ce44fa-a972-44bd-ae80-6144a8ac4c2f@web.de>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYSPR03MB8632:EE_
x-ms-office365-filtering-correlation-id: 7abb6d99-8ae5-4d6a-2e9f-08dce82b855e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?VVRtVkVJWm95ekh3dFd6VngzRk5FUWVMUnNncTQwalozUEtjYk50U1E0TVVj?=
 =?utf-8?B?aGFaeFBOM3ZZSWZ0RG52SjM4OXBBa0JwVllUNU5nYlZKV3B3eXZ0WDdSd0d1?=
 =?utf-8?B?cFhVK1NrVDkzcnRtNTFQcFM2QlQ4OUd1M21aU2JsdDAxVG9PaTV6WW0xRDUv?=
 =?utf-8?B?Unh5NnEwZVIyUlFsM05jcWFwM3dsSWcvNFdROWtUNEViZDBnNXA3NHBpNjdP?=
 =?utf-8?B?UUtrZjljZTZZRWloZFh2ZmY5eWRiV1hqZGRhcld5QzJLY25nLzIrMWc2SkRK?=
 =?utf-8?B?anhidWRxNVB6Rkk5aFRGY1VCdGpUdGg4blFWellaQXYva1piQUJSb3NKU3FT?=
 =?utf-8?B?VzYydzlaSDBtTXVrWWcwait0cGJzRnhmT3VuVVhDejZ5OFhUTkllWEJKZ3FL?=
 =?utf-8?B?MXd1eVBtY00vYmQxVXpWcEdWWmNsVGk3djNmM0NveVh2RkRaZFp3azFTM1p1?=
 =?utf-8?B?S1V4ckhUNC9LZmVTNGVwMVV5TDRka2w1OWh5K1FKaTArTy9La2xwVFFsVnZs?=
 =?utf-8?B?UmdUOVlScGkxUjdYRVl1bDZibEV0UmpUMzIwcVU2amgrdDRTek5QaFNPcWFU?=
 =?utf-8?B?ZVg5eDRZSVR3YmplRmFOYVhrSFg0SURuQWUrQmxUc0tJYlB2N2MxaG1obGRF?=
 =?utf-8?B?NXRUNmVIMGZqbWxXMm1nc3NVSm1kVnlDYUJRUjNzazNYaDFpclJJT3hCUEdS?=
 =?utf-8?B?KzJOelZZdldnWDgyVmVKTVdTMVRiSnR4MWFWZS8yVWsySHBhYm84bndMMkZG?=
 =?utf-8?B?LzVLTFcxVGU5dGVIQkErdjRSRXl2V1F2MmttbjRjNVE1YWIxcm12N0c1NUpI?=
 =?utf-8?B?cjV3V3NNRWxGZTgwT1JxTThhZWdKMXpBZzE4cTVGcmY5V0hlS3d1WUU0MUdE?=
 =?utf-8?B?cmJoa3VqUTRCSmxBWGYxNEpPQnVRTUJKM0V5SGd1Q0xQWkh5czNIRFpEalAv?=
 =?utf-8?B?dlAxcUJzYjg0NzdHTGhxVUpYenNQK0JXWDR5bURPTTU1c2RhN1pEVlB0a1h0?=
 =?utf-8?B?WGEraXkwQ29USU1Va2dDd3pLaVNORUNDS2Qyd2VZREJKTjlTU0M2R0dFaENz?=
 =?utf-8?B?Ky9HYklXNUozbkNjdjFiYzI5ZXBzN1NtUGF1VG9TVlNHN285ZklKNS81N0FF?=
 =?utf-8?B?UjZOSnNCZEFOVW56V3o4bDRJSTRWQk9zOCtzMGNZT3pBYVpjd3JnSzYrOVBo?=
 =?utf-8?B?OTBqQytVd3VYbnhxNHhLOTlVSUhQb0hZdk1FNUxza0N1Vlc0a0JHRlpuc29V?=
 =?utf-8?B?K042UlhXdnNEMGM4SmNDQ2NWeStpd3Z4SUNNUkpPNVpMQ09NRmdaTW0xN1Ix?=
 =?utf-8?B?WktFaGV5d2g4Y2tWandYWTVpeWxqMkE1cVFublZoYVFjNzlMSEI5K0NvYUN5?=
 =?utf-8?B?SzBXVmpHb2R1NjJxcStJVkN5TlNqdzNuZjRLK1VGZ2d6cFhTRnhsek02KzJ6?=
 =?utf-8?B?UWFEWVZSSHRCT3NXY3YzTzB1eVcxcFZEQkF0RW5xOVNSYnZNM0h2Qm03UnJR?=
 =?utf-8?B?eFdpY3JVN3MzM0p0KzhTT0Zidm9XdW13ZEQ4UDFWT0daaFdQb0djYVNFWXlk?=
 =?utf-8?B?Y1NMTFZIRHlrYndVT0dZN3l5NUQ1aUwwdVBJNnUvYnUrYk9LbFo1aGEveGg0?=
 =?utf-8?B?WUF6WGovUkRYaG5vWnNZM0s2d3hKSnFZL2x1ZEhlSDVQdzhncjRYQ0xUeHdW?=
 =?utf-8?B?V1hndFlrQWJPbDh5MjRRQ3FKUkx5QVUzUHFoVFdIVTU0aVVFVlpzc3NQbWJB?=
 =?utf-8?B?LzlzT0wvcWx3MlFRYmovUVFveU9IekE5MEx2QkVycU1MKzVUT1NtTVNBb1Vz?=
 =?utf-8?Q?N7qA4Z1CpEsgM/iLpPK0+dx+j3AtVpDtGvvvE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVZTWnRLb2JMSVdxUXFPcm1peFMzUTJFTFVBT29XY0VhM3JoK0tMaDR3ZWhQ?=
 =?utf-8?B?OUpDSzZxUk0rWlEwcXpOK0JGMDZwSUpSRzJaQ2JocEdpcG5jVXNoSGJneFVS?=
 =?utf-8?B?YkVBNGZQYm0yc05KOURwTlN6MGhqT2JRNm1zbEtuczd4MzdEN1dWd1NhTnRY?=
 =?utf-8?B?Q0Z1RytaM2ZKSWsxYnpyTjJKVTR3dW1MNTVzWCtuTkZKakdjSkNTSlJ6TmNL?=
 =?utf-8?B?NmR2WWIxaW1kQTFwZm5vNmtSOHRzLy9pUGZGTEdESW84aWhHbldYajY1VjZj?=
 =?utf-8?B?NkExRTRaQTkvdXdlOTc5ZmQxR0ZobXJsVFVQVlk0b3lqRDNCbHF6Nzg3cDdG?=
 =?utf-8?B?RjdPSEhPZmJ3YVduRUZuUHhsbnhPUXppVyt0Vk9hejN4dDB4N01FWlFXOUw3?=
 =?utf-8?B?b2NyQ21aSXl3dE9XSFE4NjB6MTJEa3BXd2RvSmJDd2VWeE5aY0xwOHZMYmNK?=
 =?utf-8?B?Z2dsRzFvMkUzUHFQUXhjUGYybWZqQ01LSEhXcm04bnFmU2FLdHN3OXBmMUl1?=
 =?utf-8?B?Qk1MMGMxM2haaC9CSlVSZGdaMndPZUlGejZLV3ZSMVBWZ1pwREcvL1JMNDRv?=
 =?utf-8?B?b3VsVGVQNDJtcStQUkRITjRncTM1ZURrTEJoZmxKRUJodDZKQU5XNUcyN0tY?=
 =?utf-8?B?QmRHYTNZNXBOTjgvdUp0QmdiRkxnM1R5VzdRNkRnSkMrYVA0ZmtuYXNaZXVm?=
 =?utf-8?B?SHI5dkRsTzhqUVdXVDI5a1ZXWldlTW5qd2l1SVZVK0xhZm1NenVqRTlaNGlL?=
 =?utf-8?B?YnIzSWlYUDkyS28rMFJlMTdzcXhZMkY2TW95TU5RaURlVUtqQ0ltQ2Nmc241?=
 =?utf-8?B?VitWY2MweFMzc0szWHg1UXljblJKWFVMMnVXR25qY0FPa3dkWDFQbVhXZmdp?=
 =?utf-8?B?NUs0S0pMNDhqam8yUm5oeGp4bThyclZFZTZxWFlpUWY0dTdndTgwSUhHVXhq?=
 =?utf-8?B?RzkzRVRwMFc2RGViWXc1UUZlako2NWVxRUFzRmxIckRZTlAwMWwyd1dCai9V?=
 =?utf-8?B?d1NmYnlyam0rSVk3ZFBwb015MTZFTTNFUjAzRWxRT2xrdEtVbHBFelduVWNB?=
 =?utf-8?B?UTJQQmVVSzNxZExuVWxNbENKNG94MTJJSTlrb0NNekxtMzBLZzRDMlZIbkJu?=
 =?utf-8?B?V3ZIZWxsZHhWdytiK0E4eFRhbDJ2am5FK2s1QzVSRHlURWlIVDNoN3JGR3BV?=
 =?utf-8?B?a0hUSDRUMEhXWmJheUtQYUJPYkFmaU1Tc3FUK3JEZ0VocVU4Y2tMTDdwb0oy?=
 =?utf-8?B?RG1OWUdkSXhwMS9xajNESFV2N0VsSWRvSnFZNmxEbmpIQmYxa0tpVHVRNjdz?=
 =?utf-8?B?OWQwNCs1OWMxa3gwMnJmckJKSWN3bmNWMUJMSjNFTjRDVThHV01OWWY2aURF?=
 =?utf-8?B?cGR1SnhKNTdkbUZNZEo0Q2JiRG95Ym1vbDliWTFISElJVEs0eWUwcTQyenJj?=
 =?utf-8?B?NFk0WFNyalBOK1ZGZFBqbjliOS9oQ3JUYUpncjMwcXNTVDFVbWFWWS95WEQ2?=
 =?utf-8?B?NDNMQzRHQWhpTlg3QWFIclB4RXpLQ2lOZzhrQXU1Uk91UXRpODBpSzJqVTZh?=
 =?utf-8?B?NEgyTVZIK1lKeTkxbFhaRDJsMlloYjgwVEd2bGFLb3ZJTXRwWjFrMUhJL2RJ?=
 =?utf-8?B?cENucEhYdG91eFV4dUNZYzRDMWVqRUFBdlJDN2NOWVFid0F4YUVQUU1YUTlt?=
 =?utf-8?B?YmxVSmd2ZnhxdWs4TmZoczRqYVlFUHRKdUt6eUI4WjBUMFNveGNra1Z1Q2o4?=
 =?utf-8?B?UDVHV0ZXVm54TzJRQUtUenVSMTR6VTBaam8xaTRKelFxRk5TN1JRZ2lqQnVy?=
 =?utf-8?B?UTBQcmVwZk1DdE1wTDdsZHNXUk1wQk9yaXFSVXdzT1lFRHQrVzNWemRrWTND?=
 =?utf-8?B?ak1Ud05HME5zdkVGVlkwZ2lsdU1NczZDS1N4R3JhL3grZDluT0VLandReGx4?=
 =?utf-8?B?dEZzSE5KYVRiajRqVmxHZ21WRDNuQnJLNW8xMGFtMU1nWlc5dDArd2Q2Qno5?=
 =?utf-8?B?WUxxU0ZDSzNjaXZaTmFIRkNrM3ZHNTBIS0huY29pMVRLK0ZOVXFHTkU1OVdV?=
 =?utf-8?B?eFFOcDVKVUZLMjlmNDBqeUVBVFEyTEJMOHkydmpZSm1idDJkbjZkbUl2UW1q?=
 =?utf-8?B?R25QTFF1clppU3JiTnNIR2xTQitELzlmSUtFSm56YUxqNGhaTU52TEZUdnpj?=
 =?utf-8?B?VXc9PQ==?=
Content-ID: <5B2829D8ADB95D409889A82FE5631C6A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abb6d99-8ae5-4d6a-2e9f-08dce82b855e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 06:27:59.8281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dFuLVmd7s85Dm3sasXdyUWD3XR+weEkGWnwFG5EjhFBrhze2id3FNIBl8v4aS723D1sjAxogTA5GwAkMe2raDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8632
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1057530086.1686232630"
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

--__=_Part_Boundary_005_1057530086.1686232630
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTEwLTA3IGF0IDEzOjM2ICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToN
Cj4gPiBBbHRob3VnaCB0aGUgYWxwaGEgY2hhbm5lbCBpbiBYUkdCIGZvcm1hdHMgY2FuIGJlIGln
bm9yZWQsDQo+ID4gQUxQSEFfQ09ODQo+ID4gbXVzdCBiZSBjb25maWd1cmVkIGFjY29yZGluZ2x5
IHdoZW4gdXNpbmcgWFJHQiBmb3JtYXRzIG9yIGl0IHdpbGwNCj4gPiBzdGlsbA0KPiA+IGFmZmVj
dHMgQ1JDIGdlbmVyYXRpb24uDQo+IA0KPiAgIGFmZmVjdD8NCg0KWWVzLCBkaWRuJ3Qgbm90aWNl
IHRoYXQuDQpUaGlzIGlzIGEgdHlwbywgYnV0IHRoZSBzZXJpZXMgaGFzIGJlZW4gbWVyZ2VkLg0K
DQo+IA0KPiANCj4gQ2FuIHN1Y2ggYSBjaGFuZ2UgZGVzY3JpcHRpb24gYmVjb21lIGEgYml0IG5p
Y2VyIHdpdGggYW4gYWRkaXRpb25hbA0KPiBpbXBlcmF0aXZlIHdvcmRpbmc/DQo+IA0KaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12
Ni4xMi1yYzIjbjk0DQoNCkhvbmVzdGx5LCBJIHdhc24ndCBmYW1pbGlhciB3aXRoIHRoZSB0ZXJt
ICJpbWVyYXRpdmUgbW9vZCIgYmVmb3JlIHRoaXMuDQpBZnRlciBzdHVkeWluZyBpdCwgSSBub3cg
dW5kZXJzdGFuZC4gVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dDsgSQ0Kd2lsbCBrZWVw
IHRoaXMgaW4gbWluZCBmb3IgdGhlIGZ1dHVyZS4NCg0KQXMgYSByZXN1bHQsIEkgYXNrZWQgQUkg
dG8gcmVmaW5lIHRoZSBkZXNjcmlwdGlvbiB1c2luZyBpbXBlcmF0aXZlDQp3b3JkaW5nIGFzIGEg
cmVmZXJlbmNlIGV4YW1wbGU6DQoNCiJFbnN1cmUgdGhhdCBBTFBIQV9DT04gaXMgY29uZmlndXJl
ZCBhcHByb3ByaWF0ZWx5IHdoZW4gdXNpbmcgWFJHQg0KZm9ybWF0cywgZXZlbiB0aG91Z2ggdGhl
IGFscGhhIGNoYW5uZWwgY2FuIGJlIGlnbm9yZWQuIEZhaWxpbmcgdG8gZG8gc28NCndpbGwgYWZm
ZWN0IENSQyBnZW5lcmF0aW9uLiINCg0KUmVnYXJkcywNClNoYXduDQo+IA0KPiBSZWdhcmRzLA0K
PiBNYXJrdXMNCg==

--__=_Part_Boundary_005_1057530086.1686232630
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjQtMTAtMDcmIzMyO2F0
JiMzMjsxMzozNiYjMzI7KzAyMDAsJiMzMjtNYXJrdXMmIzMyO0VsZnJpbmcmIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7QWx0aG91Z2gmIzMyO3RoZSYjMzI7YWxwaGEmIzMyO2NoYW5uZWwm
IzMyO2luJiMzMjtYUkdCJiMzMjtmb3JtYXRzJiMzMjtjYW4mIzMyO2JlJiMzMjtpZ25vcmVkLA0K
Jmd0OyYjMzI7Jmd0OyYjMzI7QUxQSEFfQ09ODQomZ3Q7JiMzMjsmZ3Q7JiMzMjttdXN0JiMzMjti
ZSYjMzI7Y29uZmlndXJlZCYjMzI7YWNjb3JkaW5nbHkmIzMyO3doZW4mIzMyO3VzaW5nJiMzMjtY
UkdCJiMzMjtmb3JtYXRzJiMzMjtvciYjMzI7aXQmIzMyO3dpbGwNCiZndDsmIzMyOyZndDsmIzMy
O3N0aWxsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjthZmZlY3RzJiMzMjtDUkMmIzMyO2dlbmVyYXRpb24u
DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7JiMzMjthZmZlY3QmIzYzOw0KDQpZZXMsJiMzMjtk
aWRuJiMzOTt0JiMzMjtub3RpY2UmIzMyO3RoYXQuDQpUaGlzJiMzMjtpcyYjMzI7YSYjMzI7dHlw
bywmIzMyO2J1dCYjMzI7dGhlJiMzMjtzZXJpZXMmIzMyO2hhcyYjMzI7YmVlbiYjMzI7bWVyZ2Vk
Lg0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7Q2FuJiMzMjtzdWNoJiMzMjthJiMz
MjtjaGFuZ2UmIzMyO2Rlc2NyaXB0aW9uJiMzMjtiZWNvbWUmIzMyO2EmIzMyO2JpdCYjMzI7bmlj
ZXImIzMyO3dpdGgmIzMyO2FuJiMzMjthZGRpdGlvbmFsDQomZ3Q7JiMzMjtpbXBlcmF0aXZlJiMz
Mjt3b3JkaW5nJiM2MzsNCiZndDsmIzMyOw0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QmIzYzO2g9djYuMTItcmMyI245NA0KDQpIb25l
c3RseSwmIzMyO0kmIzMyO3dhc24mIzM5O3QmIzMyO2ZhbWlsaWFyJiMzMjt3aXRoJiMzMjt0aGUm
IzMyO3Rlcm0mIzMyOyZxdW90O2ltZXJhdGl2ZSYjMzI7bW9vZCZxdW90OyYjMzI7YmVmb3JlJiMz
Mjt0aGlzLg0KQWZ0ZXImIzMyO3N0dWR5aW5nJiMzMjtpdCwmIzMyO0kmIzMyO25vdyYjMzI7dW5k
ZXJzdGFuZC4mIzMyO1RoYW5rJiMzMjt5b3UmIzMyO2ZvciYjMzI7cG9pbnRpbmcmIzMyO3RoaXMm
IzMyO291dDsmIzMyO0kNCndpbGwmIzMyO2tlZXAmIzMyO3RoaXMmIzMyO2luJiMzMjttaW5kJiMz
Mjtmb3ImIzMyO3RoZSYjMzI7ZnV0dXJlLg0KDQpBcyYjMzI7YSYjMzI7cmVzdWx0LCYjMzI7SSYj
MzI7YXNrZWQmIzMyO0FJJiMzMjt0byYjMzI7cmVmaW5lJiMzMjt0aGUmIzMyO2Rlc2NyaXB0aW9u
JiMzMjt1c2luZyYjMzI7aW1wZXJhdGl2ZQ0Kd29yZGluZyYjMzI7YXMmIzMyO2EmIzMyO3JlZmVy
ZW5jZSYjMzI7ZXhhbXBsZToNCg0KJnF1b3Q7RW5zdXJlJiMzMjt0aGF0JiMzMjtBTFBIQV9DT04m
IzMyO2lzJiMzMjtjb25maWd1cmVkJiMzMjthcHByb3ByaWF0ZWx5JiMzMjt3aGVuJiMzMjt1c2lu
ZyYjMzI7WFJHQg0KZm9ybWF0cywmIzMyO2V2ZW4mIzMyO3Rob3VnaCYjMzI7dGhlJiMzMjthbHBo
YSYjMzI7Y2hhbm5lbCYjMzI7Y2FuJiMzMjtiZSYjMzI7aWdub3JlZC4mIzMyO0ZhaWxpbmcmIzMy
O3RvJiMzMjtkbyYjMzI7c28NCndpbGwmIzMyO2FmZmVjdCYjMzI7Q1JDJiMzMjtnZW5lcmF0aW9u
LiZxdW90Ow0KDQpSZWdhcmRzLA0KU2hhd24NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcywN
CiZndDsmIzMyO01hcmt1cw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_1057530086.1686232630--

