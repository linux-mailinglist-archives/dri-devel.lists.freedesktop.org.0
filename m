Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C069925FE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C0510E311;
	Mon,  7 Oct 2024 07:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fl+LW2Eu";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MZJduA42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50710E311
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 07:22:39 +0000 (UTC)
X-UUID: ebcb8846847c11efb66947d174671e26-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gsJTVhv8q57rmKzuNycj9ohnui0P3A1o3EAssnDIDE4=; 
 b=fl+LW2Eu/TGpRlpLK3cX76nypTfDWBLOIU2q1guIlFY/PJEHb52/SF14h9otx+m8Akk5s0T0AUgkvm4gF3S5Z8pJeXDsBVvWrfg6iAyrek4pwjRsRhIi14uKrd+0g1tl592JV7i1GKBBWzYet08MOeRVYLbqrGAecuFrnXne9Vk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:28dbbe27-8ce9-412e-b699-c93bc446a48f, IP:0,
 U
 RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:6dc6a47, CLOUDID:6de06526-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:4|-5,EDM:-3,I
 P:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
 ,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ebcb8846847c11efb66947d174671e26-20241007
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 868042494; Mon, 07 Oct 2024 15:22:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 15:22:32 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:22:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0qSAohRCm3mXx4aqKY/1vdbYk6HpdHqd9e/B6w29/xeINxzlDFqTqlx+OKHC45yUWhpk+tMgyMeYeUiYFeROOYhyz5LeBrHdpKkRxO23EBXcX6B0eSNFnraKLlfMXksElTmZmCHwzZ1spqcVaOKynFdviQeLEWvvT6BatIaoIF4QyxRPP9/i1DGe/ilZn5WfkhFZYmn9neU8l+JeU3F7ZId89yt/CwtCQsxTfZjgWN7Cz4sIm2kQJD2wDODkyei7+S3aWrSi+GPPzyz10Zhqa7Gi23oM/Q7+n3Pj8PJKtANISPFpXc28pJEaYCYULpdNyee//RUI/UnJ7AKaNEfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBzSXakV5tU2XXGz+3DGzUEmRBX+MaN2/8A0nEcRosQ=;
 b=CoVtUMmJD8vuGWXuqR+zYGC3RVMIiN9IeK/Lx+OIL4hYFgaa/8YAwvF6VzrDzv1mzKpLRlGSHyfSQc44xgNNQgTvhGJCCBQBI08pj2gx/in4J29f6v9gsEh0teFsyah7C8c+bGYPCzCniH9TleS+jlwVPra4dl7O9GSjwRsP4M1gtO/LvIqCNWb8VHemJT8Luvmg/5D89rCjIjxoV/dEHTecEFOgVbney71CyhJ2zw9fAiOXPAEeyoFrwNp79riq7G6XbTkroVClX+yrobO89ZcehqICs9TRopZzyJA7LO+evXNnrRKQpU+h+5wRpd257rc0JywASaRQYqaf/lg6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBzSXakV5tU2XXGz+3DGzUEmRBX+MaN2/8A0nEcRosQ=;
 b=MZJduA42xk34Mggxff+XP2nulydpJjOAoX/BpDdEiJaUtXpciUKCPMA0zXfn72za/ceAOGLs+jsZV74OaEfiEizZ7dj0BrCCzUYw9qXmGrzVzI5XfppsHc+NbFsaqPHY53PM+YEHgXmcwdvdYC1GKijhSUWyq0S3nENsmcl7JgY=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB6916.apcprd03.prod.outlook.com (2603:1096:101:a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 07:22:27 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 07:22:27 +0000
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
Thread-Index: AQHbFVPlNViRsB+fWkG+2zWvYOwE6rJ3tjcAgAA6owCAAH2HgIACekgA
Date: Mon, 7 Oct 2024 07:22:27 +0000
Message-ID: <429db3b66919e67ef765eef220608cb3d3d9db65.camel@mediatek.com>
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
In-Reply-To: <fd6fc10e-d0f6-4c53-8561-bdfd047e45f2@adamthiede.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB6916:EE_
x-ms-office365-filtering-correlation-id: 19b67677-9ad2-47c5-6091-08dce6a0cc44
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dy9Qb0JDMU83ZTZhSkdXVEFCOUl5QW14QmdyQWYxOElzZmFsT3lMZkxtZXRm?=
 =?utf-8?B?YlVlaHY3WHBFTG1EeE1HSkRuSzlCSVpWMWFzZXl1T0R3YksrZE15a1V2Snlq?=
 =?utf-8?B?d0MzUjFZVWcxYkI1UXgyWk9wNkkzRC9TZ05zWkxhT1hIYzBjeVRWaGwyejJC?=
 =?utf-8?B?dTVVODVhZnBQWGo0czZyZW8rYjhLWnBOMDBGL0tyZ3BnWUw4a25seG9zSXFt?=
 =?utf-8?B?eFlMQmJxTVQxNERvYmp2VTY4bWgwSGtmSUFGSkx6UEpqV3RFVDFvRDJQQW82?=
 =?utf-8?B?elZNUUxNdGpQNFYyek5SS0VSN3JYRXRqUjQ0WG5USUduNUlQM3ROZGkwRXJn?=
 =?utf-8?B?SFR4TnZYdlZXUXNHTlVpeTNtUmhLekdnK3N4S2tOWlpLQ1BkRG8vdytHbGZH?=
 =?utf-8?B?dlIvL0hoV3lYU1ZsbWkvVWZKdzFlVzBpQ3RRS1RCNDVzbFRWZjBWbVo0V3U1?=
 =?utf-8?B?akFzbnFHZlZObXBhcFRxSjVHeFNQR3BBOEdDQ0lkZDQ0dHdFT1pwd0d4ZDdl?=
 =?utf-8?B?ZFBRYmw4OTJ5Y1pyMGtuSVp4UHRidEliWmZHbjNMY2IxaEs0SVNMeEpWMUUv?=
 =?utf-8?B?ZXlGUnRWNEd5aG1xSXQ1dlpzRm51enE5RXViQm55QkdxbWxWYWR5S2k0V0gr?=
 =?utf-8?B?eDIvdkx4TXM4Q3l6NGdSc0dZSGFRem1sMXhQUEUzb2w4VzN0cEEySW4zbTV0?=
 =?utf-8?B?WmRhU0lRL3hzVnUzRithSmc0RWI0VWZLblJLU0wydTBYV1R1bDBkRHI1bkY5?=
 =?utf-8?B?T0NSY1hJRUNoV2ZLWGtBblVEWkI0aU5GU3oveEJhb3VTTDcwSEFJVDk3aW9J?=
 =?utf-8?B?WkV6elY2TXN3cnJYZndaMFdBeHBTZXBQd2hXMnlPaGRzNVVOQVdrTlk1QjRB?=
 =?utf-8?B?QXl5dXc5ZVR4bDJ3N0tYd0tEZk5KZW9NTFZqTE1ZRTczOUkzeHo1bittVnA1?=
 =?utf-8?B?V2tXOVRlUjNaNVd4R21oNFd0MmNSaGJhNitvOTByck9YVUJ0aW5oak1ycG11?=
 =?utf-8?B?U2NZSVlsUXcrbGpaVVNaN1hmUkNvSUl3MXN5eUhTMnh2QkJpODdzelAzN1pP?=
 =?utf-8?B?bVY4VXJDeG9nQ0RFUUZsVUdkQ21mY3AxMU9jc2dLWEhJY2pHWlJsMUdYQWpC?=
 =?utf-8?B?NVFLNFdiNUx0N2MwQ1ZoT3llOThCa3BtdXJUMUI1ZjNZUDY0clJJa1ZjMTZ6?=
 =?utf-8?B?cmRXcDc5N3I0NG9XdEErRjFCbFFZMVVXTW5nblJmdG1pKzZPRmVzZGovQ1ph?=
 =?utf-8?B?cGpDVjNEMndUZ1Qra282L1YzMlc1WmFrS2RKQjRXQmtmSDhTL0UxeVh1V0pW?=
 =?utf-8?B?ZGt1N1BHR21IRVJubmJDdklXbEY0bHUwMGIzQ0Nhb3k5Qy9LTnNnT2FpUWs5?=
 =?utf-8?B?ejNWTXV1bCtBeWlBcHRBd3hXSG8zWm84MjAzc2JlL3ozWndDbk9raXE2dS85?=
 =?utf-8?B?dFpSbkhPNERHYWtKOU9keEpWM21MNGtWNGt1ZUVmTThYVTF2R1pKMEhOaFFC?=
 =?utf-8?B?ditRVUNxdklyZjNuV2o0WCtSSVJRRnFtS3QwakNXV25EbzRJV1FjNWxIYWdL?=
 =?utf-8?B?ZVhpZlBlM1lwUFd0bGgvVFJBOEw3S0EyUVBkeFhPdjJjZ3FTd0l0VFVMVnB3?=
 =?utf-8?B?d0U3TXhkM2c1UDEyWVhvdXhraXpQVkdxUWQ5bDAzY0FWVUFBaklLb3pHeGRE?=
 =?utf-8?B?djNFZ2Q2VEpkQ0pOZjUyd1FuNFhPNXRybm95cEZqR0FqMHJUYW91dE5Obk1l?=
 =?utf-8?B?Rno3WEdLZ1YwWTZJeldPT0tQaE9ENzNoY29sQUVhTzUvNFUyaXk3RUI3b0Ix?=
 =?utf-8?Q?vJCOSAXabt3I4EHwEYnWEpvjP+Rw5+DF52oZs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cThmUmV0c1hvbUFLNGpTV1REeWdKc2ZKOHlMekNRdG91dm9LdDlrRE91bGdj?=
 =?utf-8?B?aXNOazlSS2tSdTZzMUYwdnFzdFNIbFloU0svMStUQ2Q3VU4yR2NFTWllYWtk?=
 =?utf-8?B?V2xTaHZxc3dNcWMwWENBc3U2Q3VpZXl5ZEE1aUhmK2NwTkNFTFJ6VldIbjFM?=
 =?utf-8?B?Ykl3U005TDk5dHkxRy9Md1BpTmNBaUVxZTZ5NXo2RFhVOVU3SVBvVzBVRllP?=
 =?utf-8?B?VWppUEY1cDRHUElRYXdOd01SejNtNDNVbEw2M2VDaVRLOVBwS2ZRYkdLb1Vj?=
 =?utf-8?B?aDFsbWtHcGQyVG05dVo0OWhISUhmOHZic0g1ZGlCdkRIYjlaTXgxMlVsc2Rx?=
 =?utf-8?B?cUkrVk5mOVNXNHZHRmRaOHpJdytaSWpkekR3WHNLRVFmRlQ5V25SQmswWDZK?=
 =?utf-8?B?dnlwWjk0UTFLRjUrd1VPczM0aFRBTjgvQktUeWxqU0YrQkNWS1hrM0tpSHgr?=
 =?utf-8?B?ZDhVZDdpa05NNnM3d1h4RkhXRUt5NXVuaEF2M1d3cm8wMzJWbS9CUlBqU3Qv?=
 =?utf-8?B?RG5rNWdvNkxwc1ZaV1ptbTl6OXBObXYzTWMvdGtxdElyTVUyUTBReDFOOXNE?=
 =?utf-8?B?aGFNdnNnelJPMURvczl2ZldTSENJYVc3cmhGSzJSaHF6STByZDJzUzI2RHBm?=
 =?utf-8?B?ZkEyMi85QS9qQmtOM2JHN0dTd0huWi83QmdaaGVuUnBhaWNxaDk4T3VBdzN4?=
 =?utf-8?B?cHgybEdoNWpodGk5Y2YvR2x1TGJtaThqMUU2Z3pDMlYzK0ZyM0Mva1lrUWc3?=
 =?utf-8?B?VHlKMStwV3VTYVgzSFZ4bGR4akZ2WW9heFI0YlB5ak5pd01nYzdoeWpKQ0Nn?=
 =?utf-8?B?V2U3MitoZjIvOVRFbGFkbCs4UmYzamdZYUVnN1lJeEtQQVFQNjVjZC9VNG15?=
 =?utf-8?B?M1cxME5MRDduNUQxL21NZTJGeEtrTDlUWGV0Ri9tMVI4WVhNVzA3UVBJOVpK?=
 =?utf-8?B?TFd3ckFlaG1LcFQ4aGV2RHBTOVAySUk5U1I1N0FwNUtncnNzbGRhTVdtZzVh?=
 =?utf-8?B?cS9xMzhMaHNBcjRsa3d3MUxLVk9sSi9IcTlLU01aVG4yZGZKUGM3QzRvV1FQ?=
 =?utf-8?B?SkVtTE5sY2tmbFpvenVVV1pnM2FKa0tvZ0tCWGFvV0VTYlJRaGRzTGJmRDVn?=
 =?utf-8?B?S3IydW9JMi8zS3NuUmZSNmVxS1BJdHp3OTZOQndVd29aNUQ4N0F1SW5kTzIx?=
 =?utf-8?B?TWhydjBZM21iSWJNQkszdW16UlFDVlhIU0ZvREVPa0cwaXZ1QW5VMXNrZ2lz?=
 =?utf-8?B?Z3V6ODdycVlHWGhQYXJNV0ZUTnBSUVhYZUhqQUZKc0FTUUwwNHI3eHJyNm5P?=
 =?utf-8?B?RFRRSnZYR2FDVERVcm5vOW9wVGt3UUFlQ2pieVpGNDIxL2YrMWtuOHlqUFFD?=
 =?utf-8?B?WnNoVFRTUEltMmFKdXl2OTB1ME1oc2hOYlZZcUNIekV4aEtjdm9SeG5UVmRB?=
 =?utf-8?B?UmZ4emtrNnJUS1MvaGRqL3RmaEU3UlQ3TXNQYVJLM3JjbHdFb2I5MHEzTDBD?=
 =?utf-8?B?eWwzZFdreC90ejh0RjVXZTlEYnBpVXFReEoyU3phZmd5OE51bXBUdXQ5NExw?=
 =?utf-8?B?czkzWXIzZFI1K0NyV0EzYzJ4R05HOXhYVXV5eklDMUR4MUljTHNxWUFCVjZr?=
 =?utf-8?B?U1BaUjYraHdpWDRJTmdYUXBiM21sOGtCV1g3RDl5RmVVSFgyeEVpcFdGRmUv?=
 =?utf-8?B?NnMwZXBNVlNya3Jha0RudjZmU1ZrMkJrNmpBWURvWFErbGxod0NxTmJLRFE3?=
 =?utf-8?B?VEpmcnliNytEVGhaVjdMbW5kalJRR291Rmk0dlpQUEdUcXhuS0VjRG9HWDNm?=
 =?utf-8?B?SDhsbzVZT1c2a0JIdXlaelpXVzY0bmdCRVg0ekxyMTV3NWN5dUs2SXdYQXE5?=
 =?utf-8?B?NFJpNmNEcmtuRlo1aVFKTEY4R0lWcUxpYlh1TW8vNER5L3NJK3Z2WmtsYWtD?=
 =?utf-8?B?VWJNTGg4bHlGSVdZT1pTLzZoVlhwT3k5dWRIR3ZVNWg5TmVxTzJNekJBVzNh?=
 =?utf-8?B?THBSQ3hsayt0dklJYjAveWs1TTJxQWF2VE5LSlVIY0E5MENEdWVOWjcvdUZG?=
 =?utf-8?B?V1V5and0RERDZUZySFhEYjRTcFYvU3pLNWhRY1E0bTkzQk9CamlYRmwzSkRz?=
 =?utf-8?B?UUNyZ0NveTFvczhMV1ovbk5qNCt0K3lEdVZ2S1g2N0hFcDNWeVphc1lhSTU4?=
 =?utf-8?B?Rmc9PQ==?=
Content-ID: <C982D95F012671488A6A5D36E4027517@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b67677-9ad2-47c5-6091-08dce6a0cc44
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 07:22:27.5821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MuVI68jXzffzgcN4jO8r+aXPkIkmvURexzB23jh2HZbQAiS4AKc5Ees8gKb5CULSwYAlnXzxDArH6cQB9xp6Tdn8yRBicuhxHyVFcr6BPdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6916
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.323400-8.000000
X-TMASE-MatchedRID: csPTYAMX1+En2WEbWzq9rbxygpRxo469BGvINcfHqhfOS3qd4Dd5VsWl
 hj9iHeVpCCnHlGqray1N2wDbewri3vZ+/QtM9+8znVTWWiNp+v8oUVkB7ifJnlksP1I0n2wSoo0
 Wua1h8Xa5/3lyq6X9HaijHQaCNMQZybIb5tEHptMTDJnK4xDjXZPFJV0Myxm82+mPn502VC+RnE
 JOP6CIAsN2z5M+5vbynagtny7ZPcRC/bXMk2XQLIMbH85DUZXy3QfwsVk0UbtuRXh7bFKB7lhMn
 7ngJcdCNpDAu70fG0zhR6JSHlNAbhtA6rteOsi8NkUSDDq742k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.323400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E01FC4BF24ECF9948722F100F1131E884180EC70F3CDE6FA76DE1CFB8467D4F2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_194283797.1118272450"
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

--__=_Part_Boundary_004_194283797.1118272450
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IA0KPiA+IEhpIEFkYW0sIFlhc3NpbmUsDQo+ID4gDQo+ID4gUGxlYXNlIHRyeSB0aGUgcGF0
Y2hlcyBiZWxvdyBhbmQgY2hlY2sgaWYgdGhleSBjYW4gZml4IHRoZQ0KPiBkb3duZ3JhZGUNCj4g
PiBpc3N1ZToNCj4gPiBbMV0gRml4IGRlZ3JhZGF0aW9uIHByb2JsZW0gb2YgYWxwaGEgYmxlbmRp
bmcgc2VyaWVzDQo+ID4gLQ0KPiA+IA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTg5MzYzNA0KPiA+IFsyXSBkcm0vbWVk
aWF0ZWs6IEZpeCBYUkdCIGZvcm1hdCBicmVha2FnZSBmb3IgYmxlbmRfbW9kZXMNCj4gdW5zdXBw
b3J0ZWQNCj4gPiBTb0NzDQo+ID4gLQ0KPiA+IA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDEwMDUwOTUyMzQuMTI5MjUtMS1q
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tLw0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gSmFzb24t
SkguTGluDQo+IA0KPiBKYXNvbiwNCj4gSSd2ZSBidWlsdCA2LjEyLXJjMSB3aXRoIHRob3NlIHBh
dGNoIHNlcmllcyBhcHBsaWVkLiAoSSBhbSBhbHNvIG5vdCANCj4gcmV2ZXJ0aW5nIHRoZSBvdGhl
ciBjb21taXQuKSBUaGlzIGZpeGVzIHRoZSBpc3N1ZSAtIEknbSBhYmxlIHRvIHNlZQ0KPiB0aGUg
DQo+IGNvbnNvbGUgbm93LiBUaGFuayB5b3UhIEhvcGVmdWxseSB0aGVzZSBjYW4gZ28gaW50byA2
LjEyPw0KPiAtIEFkYW0gVGhpZWRlDQoNClllcywgdGhleSB3aWxsIGdvIGludG8gNi4xMi4NCg0K
DQoNCkhpIEFkYW0sIFlhc3NpbmUsDQoNClNpbmNlIHRoZSBtYWludGFpbmVyLCBDSywgaGFkIHNv
bWUgY29tbWVudHMgYXQgdGhlIFsyXSwgSSBtYWRlIHNvbWUNCmNoYW5nZXMgZm9yIGl0Lg0KDQpD
b3VsZCB5b3UgcGxlYXNlIHRlc3QgYWdhaW4gb25seSB3aXRoIHRoaXMgc2luZ2xlIGZpeCBwYXRj
aDoNClszXSBkcm0vbWVkaWF0ZWs6IG92bDogRml4IFhSR0IgZm9ybWF0IGJyZWFrYWdlIGZvciBi
bGVuZF9tb2Rlcw0KdW5zdXBwb3J0ZWQgU29Dcw0KLSANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTAwNzA3MDEwMS4yMzI2My0y
LWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQogDQphbmQgc2VlIGlmIGl0IGNhbiBmaXggeW91
ciBwcm9ibGVtPw0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCg==

--__=_Part_Boundary_004_194283797.1118272450
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtIaSYjMzI7QWRhbSwmIzMyO1lhc3NpbmUsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyO1BsZWFzZSYjMzI7dHJ5JiMzMjt0aGUmIzMyO3BhdGNoZXMmIzMyO2JlbG93
JiMzMjthbmQmIzMyO2NoZWNrJiMzMjtpZiYjMzI7dGhleSYjMzI7Y2FuJiMzMjtmaXgmIzMyO3Ro
ZQ0KJmd0OyYjMzI7ZG93bmdyYWRlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpc3N1ZToNCiZndDsmIzMy
OyZndDsmIzMyO1sxXSYjMzI7Rml4JiMzMjtkZWdyYWRhdGlvbiYjMzI7cHJvYmxlbSYjMzI7b2Ym
IzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7c2VyaWVzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyO2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0LyYjNjM7c2VyaWVzPTg5MzYzNA0KJmd0OyYjMzI7
Jmd0OyYjMzI7WzJdJiMzMjtkcm0vbWVkaWF0ZWs6JiMzMjtGaXgmIzMyO1hSR0ImIzMyO2Zvcm1h
dCYjMzI7YnJlYWthZ2UmIzMyO2ZvciYjMzI7YmxlbmRfbW9kZXMNCiZndDsmIzMyO3Vuc3VwcG9y
dGVkDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTb0NzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyO2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTAwNTA5NTIzNC4xMjkyNS0xLWphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20vDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1Jl
Z2FyZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtKYXNvbi1KSC5MaW4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7SmFzb24sDQomZ3Q7JiMzMjtJJiMzOTt2ZSYjMzI7YnVpbHQmIzMyOzYuMTItcmMxJiMzMjt3
aXRoJiMzMjt0aG9zZSYjMzI7cGF0Y2gmIzMyO3NlcmllcyYjMzI7YXBwbGllZC4mIzMyOyhJJiMz
MjthbSYjMzI7YWxzbyYjMzI7bm90JiMzMjsNCiZndDsmIzMyO3JldmVydGluZyYjMzI7dGhlJiMz
MjtvdGhlciYjMzI7Y29tbWl0LikmIzMyO1RoaXMmIzMyO2ZpeGVzJiMzMjt0aGUmIzMyO2lzc3Vl
JiMzMjstJiMzMjtJJiMzOTttJiMzMjthYmxlJiMzMjt0byYjMzI7c2VlDQomZ3Q7JiMzMjt0aGUm
IzMyOw0KJmd0OyYjMzI7Y29uc29sZSYjMzI7bm93LiYjMzI7VGhhbmsmIzMyO3lvdSEmIzMyO0hv
cGVmdWxseSYjMzI7dGhlc2UmIzMyO2NhbiYjMzI7Z28mIzMyO2ludG8mIzMyOzYuMTImIzYzOw0K
Jmd0OyYjMzI7LSYjMzI7QWRhbSYjMzI7VGhpZWRlDQoNClllcywmIzMyO3RoZXkmIzMyO3dpbGwm
IzMyO2dvJiMzMjtpbnRvJiMzMjs2LjEyLg0KDQoNCg0KSGkmIzMyO0FkYW0sJiMzMjtZYXNzaW5l
LA0KDQpTaW5jZSYjMzI7dGhlJiMzMjttYWludGFpbmVyLCYjMzI7Q0ssJiMzMjtoYWQmIzMyO3Nv
bWUmIzMyO2NvbW1lbnRzJiMzMjthdCYjMzI7dGhlJiMzMjtbMl0sJiMzMjtJJiMzMjttYWRlJiMz
Mjtzb21lDQpjaGFuZ2VzJiMzMjtmb3ImIzMyO2l0Lg0KDQpDb3VsZCYjMzI7eW91JiMzMjtwbGVh
c2UmIzMyO3Rlc3QmIzMyO2FnYWluJiMzMjtvbmx5JiMzMjt3aXRoJiMzMjt0aGlzJiMzMjtzaW5n
bGUmIzMyO2ZpeCYjMzI7cGF0Y2g6DQpbM10mIzMyO2RybS9tZWRpYXRlazomIzMyO292bDomIzMy
O0ZpeCYjMzI7WFJHQiYjMzI7Zm9ybWF0JiMzMjticmVha2FnZSYjMzI7Zm9yJiMzMjtibGVuZF9t
b2Rlcw0KdW5zdXBwb3J0ZWQmIzMyO1NvQ3MNCi0mIzMyOw0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQxMDA3MDcwMTAxLjIzMjYz
LTItamFzb24tamgubGluQG1lZGlhdGVrLmNvbS8NCiYjMzI7DQphbmQmIzMyO3NlZSYjMzI7aWYm
IzMyO2l0JiMzMjtjYW4mIzMyO2ZpeCYjMzI7eW91ciYjMzI7cHJvYmxlbSYjNjM7DQoNClJlZ2Fy
ZHMsDQpKYXNvbi1KSC5MaW4NCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBl
OnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxp
dHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5
IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0K
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWlu
aW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50
cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQg
bWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBv
ZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChi
eSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2Yg
DQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3Rl
bSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55
IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_194283797.1118272450--

