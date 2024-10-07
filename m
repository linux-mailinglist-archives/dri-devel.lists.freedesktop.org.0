Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B451992F8B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9273710E3B4;
	Mon,  7 Oct 2024 14:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="KQ4MIZSx";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="c29H04nN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0755D10E3B4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:39:05 +0000 (UTC)
X-UUID: e3368ec884b911ef8b96093e013ec31c-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=P3YjIdFSt/x7eWb3m7RWOm2bkLnVAZ1ZACn+0EjCnZE=; 
 b=KQ4MIZSxmV3pk9PuCoh1wsUnr4HFbrLBGd5gtJtaHZ+ri/2zyjFm9sKAFA6nnifZGnWaALY7c80KTP4BuQ/dT092ZqAccLaNG/B6lZTFBD4chEqPBVzyKR3y3hiEYHqr91Rx1+9yB60RKQ/t/aNDkQszUPMQVKg8UnEYz0MzNQs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:14e89355-ac8e-4fb2-8d96-57b84c9454ff, IP:0,
 U
 RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:6dc6a47, CLOUDID:dfec6a26-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:4|-5,EDM:-3,I
 P:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
 ,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: e3368ec884b911ef8b96093e013ec31c-20241007
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 104576509; Mon, 07 Oct 2024 22:38:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 22:38:57 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 22:38:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkxjVRDU3ab3kK23bxi74md68wo5lGEMI1/JgJBXbougWnn5wZutgLTpPsO0+SkAiHGAbfYcrTTNcwCe+XAjjXl69BOoXdZiw0ukFO02Bfaiz7aYKoUmIFqqLHmaqW925CuybjkwpZuaznjOuTE29WQVuzFvY6JWzAgvsz3kogwOd4nCP9d6KXfzUlUV2e6NR+yvcv53QlOq8spZPq/DdWtAJUohDdv8d2wAZg3pzGOznSs/IhP3d1Zffo/lm9uqE8ITvj9+DCsumMwAgYfuQ5rSy2RkUgwWPIn6gBF4yFxe3GxTNkw6b4Spu4FJakdQFr8blAQDwJr+nlwKEhilyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IA880mnyv1KnJRbzEheYinJu/fupG19csS2tNmm4eI0=;
 b=EQZwRcRm6dy7+i92ITNw0+QULEs86kaeXcj8r7Sf9TaDWYHaHZ1phjFr3RYLodClHlUsIfC600ENjrPj8McL8BNsHmYD6ZqcuJcTtUeyWHza9ceMq1uUt6Ol41CbX3zCZQGeZhfbGqU/vMiA3zpI89x3pB2PcVbY6yER13QvogPgQMBzvaZIeXpTaZmFmQoOx3nuj3u97Eg5hj4gUtEN5Jpdm8oT+HXcWokSacgcZEfmAQALa2qE5LCFa5UIdjbMvee1FDHRtU68Ll+Ra+9d5SRrfFtkGrwH0/5Gz4rz/DfVTcw1LROfDYREDNzwwpfYaIdOrw3i5qJLKMbnvBZa6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA880mnyv1KnJRbzEheYinJu/fupG19csS2tNmm4eI0=;
 b=c29H04nNlbG70PCC5qweS05l0vPSFNIB6Vk/rqEMIKoUbUelQXgnk8ciKS/VEg3t5RHJAV6KOutS2v+Ckfe/JG+iUG1YsTBxuAw1sjTYQlB7pVMS78HVzwAGVJZ36YZeLGV9nyyxZWku7P6g2lpH2nLq1ExzEX1QYwZti6ey2HA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7221.apcprd03.prod.outlook.com (2603:1096:820:cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 14:38:54 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:38:53 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "djkurtz@chromium.org"
 <djkurtz@chromium.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, "me@adamthiede.com"
 <me@adamthiede.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "littlecvr@chromium.org"
 <littlecvr@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
Thread-Topic: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
Thread-Index: AQHbFVPlNViRsB+fWkG+2zWvYOwE6rJ3tjcAgAA6owCAAH2HgIACekgAgAA7M4CAAD6+AA==
Date: Mon, 7 Oct 2024 14:38:53 +0000
Message-ID: <5e599d263f5801cc90e291e6fd304bd1b6cb00ae.camel@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-13-a9d62d2e2c7e@mediatek.com>
 <1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com>
 <49df03e8b982cc5ee97e09ef9545c1d138c32178.camel@mediatek.com>
 <00ebe9ca262b6a95fd726e5be06334b1e923db02.camel@mediatek.com>
 <5975b361-c1b4-4c57-89d4-0d247ae99d8c@adamthiede.com>
 <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
 <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
 <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
 <d820e8be-c525-4435-99a3-b0eb076b3282@gmail.com>
 <b8fb4f241b2d248ca4c2c57b98588e1be0642b76.camel@mediatek.com>
 <fd6fc10e-d0f6-4c53-8561-bdfd047e45f2@adamthiede.com>
 <429db3b66919e67ef765eef220608cb3d3d9db65.camel@mediatek.com>
 <85971b89-b6eb-4ea3-994e-6107e91477fc@adamthiede.com>
In-Reply-To: <85971b89-b6eb-4ea3-994e-6107e91477fc@adamthiede.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7221:EE_
x-ms-office365-filtering-correlation-id: 5b52aa0a-6cbc-4c5c-8bdb-08dce6ddc419
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?alAxbDNCUzZ3VDF3WlpXYUQvT0ZiZGFsQ3FWeFppbEliMktnZFRaaXN6NHlW?=
 =?utf-8?B?N1MvRjNhaFp3TXgyMzk0b1VuOWoxdkg3ZEl3K2RCNmYxUHZ4cUhSaER4N3U1?=
 =?utf-8?B?K0JsR3JmR2Ewb0cxcDJIem14VUZYa2o0YXFEVzNpNmJQZ0swQi9JOUVKNXVs?=
 =?utf-8?B?WGFITFZRMVgxL2xqN3lOUjJNa01KT2tsdUwrTUZiRHNQZnJsT29rRlAwWHhs?=
 =?utf-8?B?RmZYUWJCNDZlU3VzL1BNZDB1ZENWaElrWThYTzFlNkFYSjNQTjdoVkhseEgz?=
 =?utf-8?B?ZXJDUksxeTd6djJLeFdxbG5rcU5INzF2WVRVaVBVNk1zYzNrTXFuOUlXVVE0?=
 =?utf-8?B?Z2Z3TVlFaWZaWWRlTGIxOWZqQXpLMGNzQXJHeUNtMEN0UVZFaE0wOWJYOGdX?=
 =?utf-8?B?bjZUZm1tY0lKdDIrelhaZFJCOWZmVnJ5RENEZG84a1BySVZyS1BpbStXN1RI?=
 =?utf-8?B?S24rdTVPYmRkRHBGVVozSFRzMjhzQ1YrYjhDUkpQNk9mR202ZlN6MXA2bzBR?=
 =?utf-8?B?NmRZU3RTTGZ5eDB5WUFXdWtOTVlqTDBGWXhGNVNKbkVvS1dlUHBCVzhZbFY5?=
 =?utf-8?B?cjdraEFrRTRvdGNUK1lsSG5SOEhhNEJoU2NvQkovelRpSFN3OXQvVTJzVmE5?=
 =?utf-8?B?TGJ1ZGlxaCtVa3IrbXFxMWYwMEVJeTRFdXJ1Nk9NMzhJdjN4SCtVVU43bGZx?=
 =?utf-8?B?WU90R2djNndQRWRlVTEraEoyc2VZMUhkRDlvWXR1aHJEdEY2bTNmSEVDUlhh?=
 =?utf-8?B?Z2psYkpFbjBabVBNN3lNVDJhc2hPL2dDMTA0T2RHUkEvdlh5b0NhemIybjFs?=
 =?utf-8?B?T0wzRlV3eTN3ZkZJTEZKVmRiTG8rdHoxelFaMnR3aDUzeWFUNXh2Yis3QlBn?=
 =?utf-8?B?R0dVcHU5ZVJhTVUyQWw0d1V2NmhTSjZOcUJIVStFVVNxa0R2WGcyakFLcHZm?=
 =?utf-8?B?Y0htR3lDaHNsM0I2cVlQNW5tcW53VDlselg0cHBGYXlGbFA0S1Y2UjhMU0d0?=
 =?utf-8?B?NlJkSDZYQ0NrWmhDUHd0ZjVEMThLaVp6RzdZODZEcGdqbDE3QVdpMmxwYklp?=
 =?utf-8?B?L1FXZHludzFEd0g1N2c4SkgxWnczbHJ1RkdPNUl2WlEvVzhNZXJnM2FlUTF5?=
 =?utf-8?B?Y05HSjNFd2pMZzNBZEJOMnN0V1U3cGFqREQwMnFKYlZZdW0yTjJ3M0d6d3NB?=
 =?utf-8?B?bVFYZWFEYSt2eHJBbVU3S2VBRE9iZExVV0IzcnZUREtKM3B5ZWFyY2NRUE1x?=
 =?utf-8?B?R0kvSVg0OTc5UWpoSTFSZzBSR2VBVk5hZlJKM2ZUWEZoRHpFc1JEdmNldzI3?=
 =?utf-8?B?eW5LNFBMM3dOL3o4TnpJVXZqZ1NHOGdaRklvdTFKdnJ1U3hGMG9CY0twbXFN?=
 =?utf-8?B?cnNGd1lWVXpBUnBEU0VKUEJQM3R5c2VsYi9xNVlXQkJBdytrRXVBdTlURzdF?=
 =?utf-8?B?Ymk5bnZqMVhTVUZ6bUdqWE8xYWJJak1yU1U4VUJQSzZCejdDb1M5YnlBZU9o?=
 =?utf-8?B?SHNqOWNncnRoMG04UzlvZlNmMUZPem8rR3VuRnBOc1FVOWVsSkczdnFGLzZx?=
 =?utf-8?B?aTFNeDFjbm9MeVpIQWZ3R21ZakFwc212d3dJalhoc3RFbWtqUEJJZUlreUky?=
 =?utf-8?B?Wm1FMWxucFVyNXoyUU44NlNLc3gyQjhBcHprMXR0N3FmZXFoZFRGcjVOdXNw?=
 =?utf-8?B?aUtPMUlqbCt6NW5VSUVaYjIrZU8zREJlbm05cmhvTVZaZmpBajNETU05TnB0?=
 =?utf-8?B?TWUwNWF2cDVFV3hzWkE0TFF1aGZZZ1M1UzVhRXR5SkhVOEN1MStzUkQvZXIr?=
 =?utf-8?Q?78CkZ5NOb+Kl4iY3N3rAX1wY6LIpEv1D2au3w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVlzdHl5Mk8rR1dZcXRuTkFINURCUzg2U3k5Yk9CK3Ezc0FoWHF3K093b0pk?=
 =?utf-8?B?ajdOVkZpU01YM1B4ai9kcFZQeEdETklPRUwwNVhsVDUvWlloMEhVeVZnUVVp?=
 =?utf-8?B?MUZCUGVUeU8vd0U2enJ0QUorVUpaOEF0aTZDR0VQeEdtNUs4bjFtN2dOb2Nr?=
 =?utf-8?B?OGVGRUJUTGhHVjB5SWp6NHFacmpxSEViRk5KQlFhWmFwTVhneWFibFlyellz?=
 =?utf-8?B?bDlmMmZ5eXJvckYzaXBVdG5jMmJLS1VVbWcwbUh4bzZQQnY1QnZjRTNIVzVV?=
 =?utf-8?B?TTcrZG5pLzNPK3dGZXMycVVEY0J2Z2V4bEhlSkFweFlZY1ljdW9uU0pXWnRT?=
 =?utf-8?B?YXJhOGJzM2xaTURUNHBxcEZEbmFHMy9MdTB0SnFYSmIxMGJhUnh5TVJPTjlX?=
 =?utf-8?B?S2tVdEJCUHdYMWROQjFnK2JLRWRYSm1jTGhxSmltRnpxMDhtemdKVGFYZzNj?=
 =?utf-8?B?ZnNqSlVNS2lXYmViV3lPZXZSd1JZc1QrTk5TaVhId2JUYTFIL0g3UWxrMjRa?=
 =?utf-8?B?Wm9BVU42emVPdmdiNDBSVk9BT3kySGM3V2xiMEtCenpWZFhNeCt6Z0tVR1hI?=
 =?utf-8?B?d1V1WHA0ZDVDTzdRNWg3TG5TN1lZSCtNczZmZmIzb2c5WUx3R3pxOUQ3WHpC?=
 =?utf-8?B?STF4dEk5Qk5VRks5QVhnZUI1OVFRWUFEUWVpMlF3czlUTEdiMmtPZ3N3REZt?=
 =?utf-8?B?L1J0bXo3ZC9BWXg1NEUvVGJXQnd3aGVOQmI4Y1BHSGcrRkxDdFY1cUpFUEVj?=
 =?utf-8?B?ZUxjMEErYXVwdGpJMlA0dEROYWN2SS93QUIvTkNXL3djNHFTT0FFZHhETjUy?=
 =?utf-8?B?a2lnSTAxS2FhSy9BRVRhZTJwclh6cjJaZno0NmcydGt3YngrSW9kbjRvTzFy?=
 =?utf-8?B?QzlzSU02Q3FrVFJhNzBVVW5zWk9aMU1ES3FxT3pSeWErYkp6UUFiWUNrekZt?=
 =?utf-8?B?WmkvWEZkc3BKTDcxTEJHRTN6ZmhHNGVGdjBJbGN1RjNzNkdDbXBRd0V0L1Nt?=
 =?utf-8?B?Q0NkY3VHaFk3em01M2tsR1NHZjdISXEvTENyUUZxaXdPZGUrTHhyREJaTmcw?=
 =?utf-8?B?dDI3QndyQUZINXJaNG5GRXRHblFmY3hSOE8wa1AySjJuWVJCbHdTaWd6MTR5?=
 =?utf-8?B?RlpGNGZ4T1pNSnh4RGVLbWpYWkdtQ2dFOEQ2dG5ueVgyOTlZUSs2V2w2QTIw?=
 =?utf-8?B?QzI3VGYrKy9OUHNDcEZuNVM3ZjR2UytCM3V0R21YdlFoV25hRzFHa2FGdnlx?=
 =?utf-8?B?NFFsdGRjaEpRMElGWk1lSHhKNjY0MUlBMWd5RWwxbEFMTENaaVI4UFdqRkpD?=
 =?utf-8?B?WWlyUyt1Z3N6Vy9hajFHZVVxZnJibXdmSzBnZU00dWRCTWpEM3l2TW1LRmVM?=
 =?utf-8?B?Zkgyc3pzNDVQUk1GMHU0cGdxWDZzUEVLVWpoYkFJMW43bDZseE1PL00yaFlE?=
 =?utf-8?B?cFdNcEo4VjhoNk5QUkRJSlJQK2hyanY4U0IrTFRqbHpzQzErSFA2cGpSSjhR?=
 =?utf-8?B?SlVabUk0Yy9uem9kSUFleE5UZFplY1RydC9DM0ZxRVo4L0pFVHZ1dDVuVVpX?=
 =?utf-8?B?MThIZUV0ZWJIYTFwT2Y3WitzMm12eXRDM1hPZ1VKWGVBblVYMDA4dVlOamZK?=
 =?utf-8?B?TTFMQlZRd2tlR2RnWVdzRkpiSmVxWUVDc3h4VHlLNXJWbjlrSjdDUEdKUVNi?=
 =?utf-8?B?VS9KUTZhcUpsQloxYW50bE9qMXZ5UlJyVVdDaVo3RFkwTDVlekU3TTBNNHdU?=
 =?utf-8?B?djVuV24vcUVrVEFFY3pBTlViT25tUm5HaUMrVDBzcTFzRCtnQmp3ZWduV0VV?=
 =?utf-8?B?RzdyT3RkZjk0YmFDOTB4T1h2S3kyTUZWQnpUR3NvZzczMXNrMlkybkV3Z2dI?=
 =?utf-8?B?VE9KUE5pTlFVR3BQbklSWi9tVFZjcTMzbVBUdnl0QlJzNDN4b1FXWjN4QjFh?=
 =?utf-8?B?S3NtNVNWTjNzZGpqSUJVM0YySElTQXVCTjRRSUU2TUYzdXFBK0J5a091Qk12?=
 =?utf-8?B?MCt2RVhYK3A1WjJGSHBCbTI3V0l6a20zNGN6d0hJd0hEZlpiYllTUzY0bnp2?=
 =?utf-8?B?Z0x4QU1uWXlOOUkxU21JWEo3c0l1WHZ2aElhcGdxK3phdWRyZXZNT0dCUmJS?=
 =?utf-8?B?dndXUEdOZE05V0VCZElqeEd3c1FCdTVuTUI4R2Zya2RnSHRONUgzRjFQeEx3?=
 =?utf-8?B?ZVE9PQ==?=
Content-ID: <F3CD8900A812D0479154BEA22DA8BCDE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b52aa0a-6cbc-4c5c-8bdb-08dce6ddc419
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 14:38:53.1340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXHqua/Xxjdxq6YhmrDsZ/TGI8c2rPAEmrObMDODs9N7pGbgKRs3UFz+nk5tDEMMb0+X010umVAE+vt2e7nQns/elevbieeqAmmaKcKRe0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7221
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1808393573.149652657"
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

--__=_Part_Boundary_001_1808393573.149652657
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEhpIEFkYW0sIFlhc3NpbmUsDQo+ID4gDQo+ID4gU2luY2UgdGhlIG1haW50YWluZXIsIENL
LCBoYWQgc29tZSBjb21tZW50cyBhdCB0aGUgWzJdLCBJIG1hZGUgc29tZQ0KPiA+IGNoYW5nZXMg
Zm9yIGl0Lg0KPiA+IA0KPiA+IENvdWxkIHlvdSBwbGVhc2UgdGVzdCBhZ2FpbiBvbmx5IHdpdGgg
dGhpcyBzaW5nbGUgZml4IHBhdGNoOg0KPiA+IFszXSBkcm0vbWVkaWF0ZWs6IG92bDogRml4IFhS
R0IgZm9ybWF0IGJyZWFrYWdlIGZvciBibGVuZF9tb2Rlcw0KPiA+IHVuc3VwcG9ydGVkIFNvQ3MN
Cj4gPiAtDQo+ID4gDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9wYXRjaC8yMDI0MTAwNzA3MDEwMS4yMzI2My0yLWphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20vDQo+ID4gICANCj4gPiBhbmQgc2VlIGlmIGl0IGNhbiBmaXggeW91ciBwcm9ibGVt
Pw0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gSmFzb24tSkguTGluDQo+IA0KPiBKYXNvbiwNCj4g
SnVzdCB0aGlzIHBhdGNoIG9uIDYuMTItcmMxIGRvZXMgZml4IG15IHByb2JsZW0gdG9vLg0KPiBU
aGFuayB5b3UuDQoNCkhpIEFkYW0sDQoNClRoYW5rcyBmb3IgeW91ciB2ZXJpZmljYXRpb24uDQpJ
J2xsIG1ha2UgdGhlc2UgZml4IHBhdGNoZXMgZ2V0IHJldmlld2VkIHNvb24uDQoNClJlZ2FyZHMs
DQpKYXNvbi1KSC5MaW4NCg0KPiANCj4gLUFkYW0NCg==

--__=_Part_Boundary_001_1808393573.149652657
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7Jmd0OyYjMzI7SGkmIzMyO0FkYW0sJiMz
MjtZYXNzaW5lLA0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaW5jZSYj
MzI7dGhlJiMzMjttYWludGFpbmVyLCYjMzI7Q0ssJiMzMjtoYWQmIzMyO3NvbWUmIzMyO2NvbW1l
bnRzJiMzMjthdCYjMzI7dGhlJiMzMjtbMl0sJiMzMjtJJiMzMjttYWRlJiMzMjtzb21lDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtjaGFuZ2VzJiMzMjtmb3ImIzMyO2l0Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDb3VsZCYjMzI7eW91JiMzMjtwbGVhc2UmIzMyO3Rlc3QmIzMy
O2FnYWluJiMzMjtvbmx5JiMzMjt3aXRoJiMzMjt0aGlzJiMzMjtzaW5nbGUmIzMyO2ZpeCYjMzI7
cGF0Y2g6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtbM10mIzMyO2RybS9tZWRpYXRlazomIzMyO292bDom
IzMyO0ZpeCYjMzI7WFJHQiYjMzI7Zm9ybWF0JiMzMjticmVha2FnZSYjMzI7Zm9yJiMzMjtibGVu
ZF9tb2Rlcw0KJmd0OyYjMzI7Jmd0OyYjMzI7dW5zdXBwb3J0ZWQmIzMyO1NvQ3MNCiZndDsmIzMy
OyZndDsmIzMyOy0NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQxMDA3MDcwMTAx
LjIzMjYzLTItamFzb24tamgubGluQG1lZGlhdGVrLmNvbS8NCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO2FuZCYjMzI7c2VlJiMzMjtpZiYjMzI7aXQmIzMy
O2NhbiYjMzI7Zml4JiMzMjt5b3VyJiMzMjtwcm9ibGVtJiM2MzsNCiZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMyOyZndDsmIzMyO0phc29uLUpI
Lkxpbg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtKYXNvbiwNCiZndDsmIzMyO0p1c3QmIzMyO3RoaXMm
IzMyO3BhdGNoJiMzMjtvbiYjMzI7Ni4xMi1yYzEmIzMyO2RvZXMmIzMyO2ZpeCYjMzI7bXkmIzMy
O3Byb2JsZW0mIzMyO3Rvby4NCiZndDsmIzMyO1RoYW5rJiMzMjt5b3UuDQoNCkhpJiMzMjtBZGFt
LA0KDQpUaGFua3MmIzMyO2ZvciYjMzI7eW91ciYjMzI7dmVyaWZpY2F0aW9uLg0KSSYjMzk7bGwm
IzMyO21ha2UmIzMyO3RoZXNlJiMzMjtmaXgmIzMyO3BhdGNoZXMmIzMyO2dldCYjMzI7cmV2aWV3
ZWQmIzMyO3Nvb24uDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjstQWRhbQ0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48
IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNl
ICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZy
b20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJl
IA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2Us
IGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNv
cHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5p
bnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUg
dW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWlu
ZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRv
IG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBl
cnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1808393573.149652657--

