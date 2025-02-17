Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E30A37B29
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 07:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DFF10E30E;
	Mon, 17 Feb 2025 06:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Wu+o+1Kz";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LlTR6Pox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C2910E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:06:40 +0000 (UTC)
X-UUID: 59464268ecf511efaae1fd9735fae912-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=n7ZiV70WL0/v9sXewqq+rUo9VQOiNjqMblSDfh5CfyQ=; 
 b=Wu+o+1Kz4+re0eR3Vi9q6qeC2hA+IY+GdzgYQI1MdODR8w1qIoQkv6TfP2f/JBJZ+3Qd+sCR1nSnSVTp4smyhY/m+qNV9w/IolFXRaXEbwKtFlLP7+jU6dLtyTf5exyWP2UTNpfIDGeElxYo4Y0ikufF2k71rpVrqBUOdrPGo+w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:2d7eeaac-f920-4615-bf2b-3dd7b9d2b1fd, IP:0,
 U
 RL:0,TC:0,Content:7,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:7
X-CID-META: VersionHash:60aa074, CLOUDID:81ce7a88-f9ab-4ac1-951b-e3a689bed90c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 59464268ecf511efaae1fd9735fae912-20250217
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1722920866; Mon, 17 Feb 2025 14:06:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 14:06:36 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 14:06:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeBoxpxZlzXBBQz/KdwRQ46djO/EE8Ve4FwAdzWlys+y3OmVvER1pe12JdTKmAfNp5RR5cnOZ2ES3LEBBGXRWbWRgApV/8nI5uhEfCWRbw4VLZmO6Q6ukwSEBZCq+MeFCXGMLCc4Y1y5bvDp9NoMz+lELISZeRYE0F6yhxvIXHKPco0zd7DYhzKc5RZpIt2oln6MtrAt6ooeBlbFqAjnNoWaVg3992PqsFJZbYJyIrG0eVG1kjxDxfzTU9PJ9zYxQW0XKUWdmSYoM0ewYbW43bXQVwpLbQV8VP32qI/atD2hpI9dqZWiqG0AClEJz97qit7V5oECcYfZ2TknvbfJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5sTNR5u8wXmeeD3KDpDgiMBEvhX2rOD3A72GL77Bn0=;
 b=hetPWZp6oYzXv9EZ6f6G9apoqptEXNYtsTM4c/o788e7+3nvomw5II6S18tUfCc5E4UYMIPN92xUzB0O0xF7xoKgfxXlz1mMNMAmFlEcbY9dZ8pJulXfz1QSQioKBSSZ42dVzj28KYYpvhayR0NKlfRjoSruGRZT1ADV3q56/S14NnjQUMcaxQQH4mer2bSceibzXECroiXx2ofxEuK3ZDwuvUyHD/cna0BUzEWK64QE9GUO6+BvUeybOxsF2yDHCsNJCmLYhzNortWmK0MXKcdOVWKQxaQt+s2vyj3jFd7SWwYYUlzbSicxIyjtaSSygxIoFYkLRT7fMHg37vRHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5sTNR5u8wXmeeD3KDpDgiMBEvhX2rOD3A72GL77Bn0=;
 b=LlTR6PoxEnwbG8N3tCndkxuxP0ASurNuv096nc4kCCrhf0UeQU0VEabxtuw9wxafZXnfc7Dj1tFtArOXvWOQEbR9YgFY0DTdkZYFUQUkZhRKeoRcYqxXcRMMWB/xVNHXZM1orPlK9y+IjQtn37EZrtoRaoIo4vllXbjjEbjek6k=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7493.apcprd03.prod.outlook.com (2603:1096:990:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 06:06:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 06:06:32 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
CC: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "treapking@chromium.org" <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>
Subject: Re: [PATCH 5/5] drm/mediatek: Change main display path to support PQ
 for MT8196
Thread-Topic: [PATCH 5/5] drm/mediatek: Change main display path to support PQ
 for MT8196
Thread-Index: AQHbfDEQHfW5CGcc30uIDnmhgNgwP7NLC8uA
Date: Mon, 17 Feb 2025 06:06:32 +0000
Message-ID: <b3a6afa2e818d31dc60632615215a88449fb78bf.camel@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-6-sunny.shen@mediatek.com>
In-Reply-To: <20250211025317.399534-6-sunny.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7493:EE_
x-ms-office365-filtering-correlation-id: 7f2f001d-4b60-4cb8-cb66-08dd4f193a0f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cmVjOWVpSURaSUlDSGlJcWJhdkRBUHorVXk2TWhYSWtsT3REK3UwOU5BdFR2?=
 =?utf-8?B?T0Z3R1NBNTY3RkhxK3gyc2lzekxpL0oxQ1diOFlCL29McnBXVnJ1ZmRka0tx?=
 =?utf-8?B?MDZhZFRiZ3NXOXIwc1QvSjJqTGdDOUpDMHR3TEJPWmVEOGpmZ3J4V1dvS0VQ?=
 =?utf-8?B?UENQYVc1blJGaHU0UEpwL1JiMlZjcENVOUdTY2VRVlVmT0IzRWZyNDV6N1Rt?=
 =?utf-8?B?aXlsaloyRmJTcHMvdld2TUx2MVRXcXkrWTVPc0gzVFVtQlBWS0c3N2JwSm1E?=
 =?utf-8?B?bW5RbmtJSnJ1c2lha0VZbGtEazlTS0dETzE4UENKL0xQR3l6a01pRCtuUnpH?=
 =?utf-8?B?UC9DM29xcmtKcGE4UG8vL05vVy9tMkFsV0VOT2VZalI4SmYxNjdoaXUyellx?=
 =?utf-8?B?Y3VtU3M2MHdKckdiTEVSZTJWdzQ0ZlZ5RkxTUFg3cGVBTW9ENlBJeVNYL3o2?=
 =?utf-8?B?Z1BsM2M5VUkvZzYyWmx4clgvMTdSMlNSK0NJU1k5RGpDSEszVHFyaDBYWUpn?=
 =?utf-8?B?aXNRZFBEcElVWnJmL1JCOHZka1ZuSlJDUVAyalQ2ckkvMmhWMnloYWJWTFZ4?=
 =?utf-8?B?ZGZaZjhqK2ZibVJxMy9Tb21WekR4cjBwa0RycjlGTDdLUS9uengxYTVWTEdM?=
 =?utf-8?B?YWRkMS9tTTcwSW1ZSnhuT2xkY3ExU3VQRXA1eDRVVnlhVlIxeExpUnJmY3Rh?=
 =?utf-8?B?R3BZbHpmN0g0U1I5elpubzNZVE9PNCtPM2VsRWpBQXVoVFFaTE40QzZrY2Qw?=
 =?utf-8?B?TG1SUUs3TGdXaVhrSEJEMUlkZ3k1S2l2TjlVWW9WWGlWNmU3ajJScXEvS2Vi?=
 =?utf-8?B?T2t5d2ZEM09EWDRSZXlydW5BYWUxY0dpV2F4NjAraFlVRkV2Z2FiNEFvdXh2?=
 =?utf-8?B?a0pxYWJGbFQvamluQmdzYjNGc0dqN1huL0lmVUU5TUc0ZFV5dWFIdG5hY2FG?=
 =?utf-8?B?VFpzSDdFdnVhWG93UVorU084WGNXb3Y4VHhRalNwd2dyUWZWL3A2KytLcDB3?=
 =?utf-8?B?bFYyRzRmNXZnaW42QVpJVXVhbm01UmtiV0l4cExLRmtHYzRvTi9mYTFVNXV3?=
 =?utf-8?B?RFI5anFmbFJGVFVGM0UzbHV4SWlDbDRpcVRoZlg1SndhWFZFZUwxV2hGbEs5?=
 =?utf-8?B?ZGViT3ZUUHkvd0k4UVFENXU5VTJmVG0rZ0ZRVnhwS29FT1BtSUJaMmxRNkZY?=
 =?utf-8?B?RVlGQnlQczM3Q2R5ZndwZm5iMEMwd1VKWGhJS1EwQVBiR3F6NFZvUjIwNkNU?=
 =?utf-8?B?Z01kanU0Q0YvS2ExZTVVOW56K3JEa0tIemRuTGlNQ3Y0aXNUelpuYk5TWkR3?=
 =?utf-8?B?RktuNzEvVzhSRkpPUU1PUGxjRzJPOUJIRjNzQzRPdk0zckZ4OEUxME5KSFUx?=
 =?utf-8?B?WjRLdlozV1VjTlBXcEpYQ3ZOcG5lZUY5YmhTYVFwNlREOGJYQVc5L1Jaenkw?=
 =?utf-8?B?V1Y1RGM4cjhpQUpONUFYVDhGVmpGbFNGRVJXNWJJZVBndEt3YXVRaXY4ODRP?=
 =?utf-8?B?Q1VQQXppYnFxZjE3R3Nic2NEci9wRXIzL2xyR0pvK2ZjVEc2SjJ5STRhaFBW?=
 =?utf-8?B?VFBzZjVrcXZTVUlnUTh6K1h1MTB1MmVTWVovTERqVWxwY2J0c1VLd1RuMGZQ?=
 =?utf-8?B?bldvK1BRWWU2ODBsVXFFOEsxTzRUTzlDT2ZTK1Fqc24yT1ZSSXR6LzVKV1Ra?=
 =?utf-8?B?bzV3dE1vT2szdGdKK2kxMGdQOGxmeks3RnFxeTd1OTJvY3JwbGJnR0tpd0JH?=
 =?utf-8?B?SFA0amhMdUFDUzdzRmFDS1F0TmdTZVZseXN4cXpXbzdkWFVjS1MwNCtUNXJF?=
 =?utf-8?B?czNBb25PMHFSMG5WUHN5QUtGUklKZG5hdGhHN3RNbHBSclhxc3BoN09teTJ5?=
 =?utf-8?B?bTVWbkk5T09mSlJMNWx5c05IaTAvTkF4ellqNWpoeHRpOWRRdk9UWjJQUmZW?=
 =?utf-8?Q?+EkDmcqcnvNw070Jv150f88lXCwEzG+v?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1VJNjJZNml1bXlrNWVwdjhKQ1N3VU1YZUF0ZDA3bDBWNmF0UmVadHJvc0V0?=
 =?utf-8?B?RHl6c1k3aVlSbkZJOHZDdC9Ga2Ria0QyNUJFTzlzbE4yc0tSZ0lIV3hqaW96?=
 =?utf-8?B?V2t0WkpVUUVHZjczSjlsZmpPc3VUekNrZkpxQ3dLa3FBR0lqazdGME1IRWk1?=
 =?utf-8?B?T1RkVEpmUHphelh6WUtaTGpRT2Myc01GWllPVy9tYk81RUJMMTR2cm54VFRn?=
 =?utf-8?B?RVBOb1FXVTN5UktiUmtaOUk0WTBEQ0hnTTJ5eGRnc0JKTHhOekpWSm1pbWhB?=
 =?utf-8?B?Y2dJQUF4UHJJODRtaExhdWhoMnloT2ZxbEVodnUxVVRMWWRHMStSeTIwZ1h0?=
 =?utf-8?B?Wk1EZGFDMDUxRGpXY0RFVkhia25LcWhwOG5CVDdTS0FEdkgrdVhxODg5UzAy?=
 =?utf-8?B?VW9xU1E0eU9ZZnVSWGw2bE8rYWV3S1ZOOXV3RkUwa1dVeTBOelk1UVpoMjVC?=
 =?utf-8?B?ZlFEeXVaMWdsY1RHNjU2eTVqZlo3SGw0Z04wZGdORWxIdUpxWThHbllZck5Z?=
 =?utf-8?B?c0o1MHdvdnFLU1pIa0xNOVBmcUx0em5ac2xUcDMzMnh1UU5sWXIvN1cwMitD?=
 =?utf-8?B?VmVNWFlGaWdkL0cwLy9kdHA1R1BPVkF5WDAwK0U5Vk50UlNUdU5YQW1WRi80?=
 =?utf-8?B?T09uSFdFNWlxYVg1dUJPV2lqdkx0WHBqemNVR2l1YXRxRGo3Wnlab2txYTB2?=
 =?utf-8?B?ZHJQUWVkb2daUjdNcEl1L1Q0WlBiZlk2KzFtYnlPd0xMbTVoczFVZGtGMDBx?=
 =?utf-8?B?Z0dVTlg4UTNSa2wzTUhoNllNTVFEVkwrTmpSYWpLb25oRE9mWklZMW9mZGhx?=
 =?utf-8?B?aEoveTdpaTBib3hSbXhXYm92Z1Nsakh3KzlvTi9QcTNxNjlVQk1jYy9KeTIr?=
 =?utf-8?B?TlNHc3JHR0w2L0I5L1RucStpUWR3dVBURStjemZaUVFLV3pNSmlFV2pCaWpl?=
 =?utf-8?B?RGpocS9NUlBwbE52ZXBkaElNTWRiNFRUK1V3bVRVN3hxMmRQU3AyNzl0Tzgx?=
 =?utf-8?B?SkZkTUhjUng3MXMzNDFGRnlYOGxGbC84aFhzdi9xcFZXUnYyVFVvajhZdDM3?=
 =?utf-8?B?bjJINkdRUTVkRXpaY1l4aUxyRnM0cEtMaW56TENYN0wrSDhzWWt1d1pyV0dV?=
 =?utf-8?B?Y3YwZ0NMalV6eE5jRVh5bWh3dE1tVmIybXgrdVpad1ZYTUp6WFpqMFhmcWhx?=
 =?utf-8?B?dXBuUm5YL25qcm1xb1pKTDhuZDhqbXVMNkowdEJ5UWYzTGtlckdLaExkU2NL?=
 =?utf-8?B?c2o2ZFZWRkVGcHNKdC9vMy9KTjBpNGNEU0lxdng3SExUZ2Fzc0RBK1V5K1pS?=
 =?utf-8?B?SnFQeDBncEk4TmhJZlN5a0VzSlRJQ1FhRDFOTDZxT01GdHkrMlFNK1pGT3o0?=
 =?utf-8?B?OWFwUC9PZkhleU1BM3Judkl1S0dEQk9GODBrUUdmTTBoMTg5cW5tQmpKSmlE?=
 =?utf-8?B?WFlVRjhidFJhQkVGRjdMYXdXUHpwZ1c4M2g5ME9rdW5HVEVUZVhES3pFVmJQ?=
 =?utf-8?B?eUZuam1PYkg0ajFWNkg4VkMvMzFiOTdMaE9zb3FjRzNjem5Hd2RhcFFtbW1u?=
 =?utf-8?B?MlRINk1oaklwckp5aTdIeFFpOTkyWnhIb1ZhV2dzUkhSSW00TVFka3BJSzVz?=
 =?utf-8?B?UVNYbE8vaWZ5dkt0a0ZoeWRacDVxRHN0NHMwUU5BdiswaFV6YnRZMjZhUFVE?=
 =?utf-8?B?TEQ3TGoxbWJrSmp4OTl5SGgwVUJtZVRtUkQxaFk3ZmphNDhGM0srZXY4V1kw?=
 =?utf-8?B?ZERWMkhQdjVXeVU5S2hGMjU2dGVNbVVHbnNodEhpK3ZlVkowQjhLRzhxVDJR?=
 =?utf-8?B?KzRzWDFGdi81RzZSMTgyTlc3VWMva3lhQVVqNk95Q0ZCNEJsQ1hkSVFCRlBD?=
 =?utf-8?B?WmI3cXJydUh2ckIxclI2TjRIYXk2bSthSUZNL2dqOC9OZ0c2MlVHbFpDcHps?=
 =?utf-8?B?RzgrSnVnZFJjcjdEYUQ2R2VMdDQ4SVBBTldVVzJZcXNqMytCREM2OTRNQWE5?=
 =?utf-8?B?a3ZjK2U4TnFVaTVrMjM2NFVZV24va3owNy9TSDZXWk16dkVmTlBsNFE5cVpQ?=
 =?utf-8?B?OFpVc2VMaXhzL2lSNjRtY083ZUFLSHNUc2dTVjZkM0xBRm1NZVJLUHgvSjRW?=
 =?utf-8?Q?QuFRw8nOMHGyYlAmjiOETIl/q?=
Content-ID: <FEDCF9B86633A2488280E382E2D3C79E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2f001d-4b60-4cb8-cb66-08dd4f193a0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 06:06:32.2976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgQ5p5LJtRi/9+IkpdrvNNdUtcWX35zW8BWA6kKxHrmtS4T4rgXKnqV/iN6A//FInZN3wjt0RXD4e5IwLoM8DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7493
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_926317085.1323571942"
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

--__=_Part_Boundary_005_926317085.1323571942
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEwOjUyICswODAwLCBTdW5ueSBTaGVuIHdyb3RlOg0KPiBE
dWUgdG8gdGhlIHBhdGggbXV4IGRlc2lnbiBvZiB0aGUgTVQ4MTk2LCB0aGUgZm9sbG93aW5nIGNv
bXBvbmVudHMNCj4gbmVlZCB0byBiZSBhZGRlZCB0byBzdXBwb3J0IFBpY3R1cmUgUXVhbGl0eSAo
UFEpIGluIHRoZSBtYWluIGRpc3BsYXkNCj4gcGF0aDogQ0NPUlIwLCBDQ09SUjEsIERJVEhFUjAs
IEdBTU1BMCwgTURQX1JTWjAsIFBPU1RNQVNLMCwgVERTSFAwLg0KDQpSZXZpZXdlZC1ieTogQ0sg
SHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3VubnkgU2hl
biA8c3Vubnkuc2hlbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+
IGluZGV4IGI4MTBhMTk3ZjU4Yi4uMWM5N2RjNDZhZTcwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAtMjQyLDYgKzI0MiwxMyBAQCBzdGF0aWMgY29u
c3QgdW5zaWduZWQgaW50IG10ODE5Nl9tdGtfZGRwX292bDBfbWFpbltdID0gew0KPiAgDQo+ICBz
dGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG10ODE5Nl9tdGtfZGRwX2Rpc3AwX21haW5bXSA9IHsN
Cj4gIAlERFBfQ09NUE9ORU5UX0RMSV9BU1lOQzAsDQo+ICsJRERQX0NPTVBPTkVOVF9NRFBfUlNa
MCwNCj4gKwlERFBfQ09NUE9ORU5UX1REU0hQMCwNCj4gKwlERFBfQ09NUE9ORU5UX0NDT1JSMCwN
Cj4gKwlERFBfQ09NUE9ORU5UX0NDT1JSMSwNCj4gKwlERFBfQ09NUE9ORU5UX0dBTU1BMCwNCj4g
KwlERFBfQ09NUE9ORU5UX1BPU1RNQVNLMCwNCj4gKwlERFBfQ09NUE9ORU5UX0RJVEhFUjAsDQo+
ICAJRERQX0NPTVBPTkVOVF9ETE9fQVNZTkMxLA0KPiAgfTsNCj4gIA0KDQo=

--__=_Part_Boundary_005_926317085.1323571942
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMDo1MiYjMzI7KzA4MDAsJiMzMjtTdW5ueSYjMzI7U2hlbiYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtEdWUmIzMyO3RvJiMzMjt0aGUmIzMyO3BhdGgmIzMyO211eCYjMzI7ZGVzaWduJiMzMjtv
ZiYjMzI7dGhlJiMzMjtNVDgxOTYsJiMzMjt0aGUmIzMyO2ZvbGxvd2luZyYjMzI7Y29tcG9uZW50
cw0KJmd0OyYjMzI7bmVlZCYjMzI7dG8mIzMyO2JlJiMzMjthZGRlZCYjMzI7dG8mIzMyO3N1cHBv
cnQmIzMyO1BpY3R1cmUmIzMyO1F1YWxpdHkmIzMyOyhQUSkmIzMyO2luJiMzMjt0aGUmIzMyO21h
aW4mIzMyO2Rpc3BsYXkNCiZndDsmIzMyO3BhdGg6JiMzMjtDQ09SUjAsJiMzMjtDQ09SUjEsJiMz
MjtESVRIRVIwLCYjMzI7R0FNTUEwLCYjMzI7TURQX1JTWjAsJiMzMjtQT1NUTUFTSzAsJiMzMjtU
RFNIUDAuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0
ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTdW5u
eSYjMzI7U2hlbiYjMzI7Jmx0O3N1bm55LnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
JiMzMjt8JiMzMjs3JiMzMjsrKysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2No
YW5nZWQsJiMzMjs3JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYm
IzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjtpbmRl
eCYjMzI7YjgxMGExOTdmNThiLi4xYzk3ZGM0NmFlNzAmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0t
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMy
O0BAJiMzMjstMjQyLDYmIzMyOysyNDIsMTMmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMz
Mjt1bnNpZ25lZCYjMzI7aW50JiMzMjttdDgxOTZfbXRrX2RkcF9vdmwwX21haW5bXSYjMzI7PSYj
MzI7ew0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7
dW5zaWduZWQmIzMyO2ludCYjMzI7bXQ4MTk2X210a19kZHBfZGlzcDBfbWFpbltdJiMzMjs9JiMz
Mjt7DQomZ3Q7JiMzMjsmIzMyO0REUF9DT01QT05FTlRfRExJX0FTWU5DMCwNCiZndDsmIzMyOytE
RFBfQ09NUE9ORU5UX01EUF9SU1owLA0KJmd0OyYjMzI7K0REUF9DT01QT05FTlRfVERTSFAwLA0K
Jmd0OyYjMzI7K0REUF9DT01QT05FTlRfQ0NPUlIwLA0KJmd0OyYjMzI7K0REUF9DT01QT05FTlRf
Q0NPUlIxLA0KJmd0OyYjMzI7K0REUF9DT01QT05FTlRfR0FNTUEwLA0KJmd0OyYjMzI7K0REUF9D
T01QT05FTlRfUE9TVE1BU0swLA0KJmd0OyYjMzI7K0REUF9DT01QT05FTlRfRElUSEVSMCwNCiZn
dDsmIzMyOyYjMzI7RERQX0NPTVBPTkVOVF9ETE9fQVNZTkMxLA0KJmd0OyYjMzI7JiMzMjt9Ow0K
Jmd0OyYjMzI7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
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

--__=_Part_Boundary_005_926317085.1323571942--

