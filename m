Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738E398E952
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 07:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F8910E0A8;
	Thu,  3 Oct 2024 05:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="B9ydRDFv";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Gy2j/XaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6072B10E0A8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 05:18:02 +0000 (UTC)
X-UUID: d8d82296814611ef8b96093e013ec31c-20241003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=X8fzJz4Dp/UcseIsW/IfJ/1Qz4xuUz55MSoca7NE3TA=; 
 b=B9ydRDFvqlEJLwjCKVfvIuDHqxV+cekWylyOzEG4Ku9L/1xBSaN23uoX86GAJHQzxhw/GPwMj2tkgPetSstKMrgoe3glHhifvhpI4nMYfWIiUknQbtODVAFb8OL9ptNkCBhZxPhe1L8u+mtMJujbHcif8XWF4uAofvvwIargwBU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:b7120ac8-ede8-4ab2-b0e8-31861598a890, IP:0,
 U
 RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:6dc6a47, CLOUDID:8f196d15-716f-48cd-aaf3-155f934b5679,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:4|-5,EDM:-3,I
 P:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
 V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d8d82296814611ef8b96093e013ec31c-20241003
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 646643380; Thu, 03 Oct 2024 13:17:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Oct 2024 13:17:49 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Oct 2024 13:17:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGkOrDUh2HGn96fbgdLeZ4vjg1mgb0iSNr3VWHYZHXroB+nbFVzsi3WqPU5eG75kuQcHvVcccxsrlPcOyc9Z9Y0/zlnJ+Lf1PcdUuG5+ki8eJymQpW5TYtLFmi+Ly8WE6Ldt5C3O189IPUv+L7bpjuyssKABgeqkRnaR6AxHrl2JKfjEdEZd1Ir64Ti2rYXoFxb2Vpl4KHcPBjybr/K9DyPPD7G2X+3oj+yEXy/XLVK9tGNhKigyovxdzOvn6lrQvJZ5f4qGlg15psY2SEQkbMpJAL6VzL0Scw583NiaVbXdYeoeekb8CDe36QrDqNbB3RHUEdKPfC7a+z6xjyHnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvPQujC/kQ0DoehFAGGYk7acl9PRZHh268fOBKrbfwI=;
 b=vkS3AxOV7Ep+DinB089C24kw6XvVu7qiUhaRCEVQhiuk7NxMZhMBb+ERm3Xr3DIu7GNBoA0O/6ykzWhhZXJBzY45lxk4ekX7rV6fdcJkF/9cKhz8saQyv8k99W3YJq3fZsbfJldkYXC9j9u4MYMtxFOm4Smpzu8uDGgmxoQ+ksHhnIJZACsh+1ULjlSy8QYQvqan8FHY4vPggQy/1zgCXLjiVYiSQ/foXBnpBdaqUWOK05UkhrSfEb4gHjuNKeTRmWTPA/GB8H56lNqXdsIyYFRyoe1hajD7CK9NSQYqhEdBJhwgc7zylLbgbRuvQzcRpmRdDpY9/Z0ofMorRTg5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvPQujC/kQ0DoehFAGGYk7acl9PRZHh268fOBKrbfwI=;
 b=Gy2j/XaX/T+Pgx328BdjmDD31riZ1I4lLugSM99Ncl/7XxGNe8qqoKHkIQEWCdtfmMq3MGXOR7xSCrWDctMcQKx+D5oujHIyjjmqGTLhY2WMSvGRNHb8e3eMXgBegYcOAY7BISqMvYiP1jFFRMlwTFs6FGouDp8zwTqHXAVzRMc=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB6582.apcprd03.prod.outlook.com (2603:1096:400:21a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 05:17:46 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7939.022; Thu, 3 Oct 2024
 05:17:46 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "djkurtz@chromium.org"
 <djkurtz@chromium.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "me@adamthiede.com"
 <me@adamthiede.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
Thread-Topic: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
Thread-Index: AQHbFVOUzHfk4uVPxkOpFM/ersnkOw==
Date: Thu, 3 Oct 2024 05:17:46 +0000
Message-ID: <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-13-a9d62d2e2c7e@mediatek.com>
 <1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com>
 <49df03e8b982cc5ee97e09ef9545c1d138c32178.camel@mediatek.com>
 <00ebe9ca262b6a95fd726e5be06334b1e923db02.camel@mediatek.com>
 <5975b361-c1b4-4c57-89d4-0d247ae99d8c@adamthiede.com>
 <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
 <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
In-Reply-To: <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB6582:EE_
x-ms-office365-filtering-correlation-id: ef86a478-86ab-44f3-d81a-08dce36ab754
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OVptTjU0U0dvOE82WVlnczY3Y1FST2hnOXZaNzc4VXdyZStCVGtSY2lIeXM2?=
 =?utf-8?B?VzN1Z1IwVjRkSWpyWGlsMHNiWktuN01CcXdKTVNubkZrMWtEVlg1bmx5TWd2?=
 =?utf-8?B?d2tZT1RPTUxxRkJaVFV2TXVUbmxSZkRmYUZTWStQbjI4VHhyS1R3RVRlSURp?=
 =?utf-8?B?Ty9QQUh2bTAwUm1QMGV5Y0h0ZHNHbzhSQmd2K3NLb1k2alBCdHV0TlZKTTNN?=
 =?utf-8?B?LzYvaVZ0NS9FYW5DYjJNREJMaGQ3ZXlrN0R1Q29FRytwYlhCaVFhNmg3aHdB?=
 =?utf-8?B?djRVM2hMZmN2NUxmNDhhK0srdlFvSFA2alZUMldNbUZVbW93Y1ZLVjZoUS9D?=
 =?utf-8?B?NlBCZThkWGlqYWcvT0R1VllXdkxaUDlRS0VQbmlLTnBIR0dKaFFSRzFKK0hV?=
 =?utf-8?B?ZmtFNWExTHB2T0x5Y0d6UENBc2JZU1dqcDVZUnVEc1VoNFV3ejFScWRmN0Fh?=
 =?utf-8?B?cHhwMkVCUjJKRkdRT3lidWl5Q1orN3VESVVxbGQ0T0pYTU9ZUHlIdm1Yb2t1?=
 =?utf-8?B?QlU0QVZSNncrWGlhTmhNNXVHSlY0cHFGcVZLNDdRZHFRbFZyZXJZcnFNa1Jy?=
 =?utf-8?B?MktjMWpQM1ROOGlZQWpTdVFHVWkycGNLZDJMbHhkbmVvTVBFeTdxNHJ1azBG?=
 =?utf-8?B?NGdOME95WVE4amhGamNFZ2lJekZnRzhpREV4ZkU5b0g5eVlZM2VOdVFOdEkv?=
 =?utf-8?B?V0UyOFpaOHJ5Y2IzaG1aYmQ2Qko5LzJKK2tXZVNzZ25pMVhhdHdSQ0NzMlJN?=
 =?utf-8?B?NXhhOFdFSndxRTQwZ2M2OVZUeTR0ZWtXWmt6d0RkcHgwRXNteHEwZUNlblBi?=
 =?utf-8?B?eXk5NVNaSUtEVzk5TWFDR1U2eUtvRVNPZ0g0WHovek90cHVMRExYNGJ0TEI0?=
 =?utf-8?B?VEkxU1VrZjlMekoxU1VxU2RNNTF1ZEZTcDU4VkJzdEZQOU5MUTUwSFQrV0tj?=
 =?utf-8?B?RUszclMvQjJpL1JGaXI3Q2VHWkdZMkhNV3QwODVsRXp5eGRuL2RSTlNER0sz?=
 =?utf-8?B?ejdFWVFGczdWdTZ3eDlTL3AxV1lFZFlrWnhLV09HUWg3MG5JOEJPNGFsb29W?=
 =?utf-8?B?c1JvVitPQ1ZOWUFuRGFNVVg4WWVpS2dKL1VDK2lCcld1cUdGeFhvOHJzV25W?=
 =?utf-8?B?Tnc2djRRdmpaczBYb1BQNWJrNUY2bXY4cHZjT0ZINUxQTUE3N2g2NG1ZbVFR?=
 =?utf-8?B?ZUZHMXpuUVRFdm5JRE9VY2tLVWZUejdqY0UzU2JPYVQxRU1MeVBkUENGOW5h?=
 =?utf-8?B?T2MyRzliZFk4dmRLSVJjVDhNZXpKMXMySWU0bk8vQUZ5THBYbUtaa2lld2Jk?=
 =?utf-8?B?eGFIRWtPQXNXaUpNSTVpTUNnbzcrNmZVaFovNzJIc2lJcXhETER0UDlkajJm?=
 =?utf-8?B?SEVsQU1ZRlg5bGlyUUQ0Mi9LS1hZNW8xWnNqOFJDOGViMkozd3UrK3RVbXN2?=
 =?utf-8?B?QWdnYzdPVVdlUlZqN2x5dllSYkVFZTdnUnpyUmVrbm9RNld2UzZ3Zmh0TXZI?=
 =?utf-8?B?dWxMUVlDMWV4VnNuUGtwUkwrYkJ2UmYya2pXelFNZnZGa3BkdzlOTFR0bkFL?=
 =?utf-8?B?Y01xRHUwMXRkR3hPZTc4ditYbXB6emY4MUYyYnc1TzJ4bHlaVFM0U3o4NjZO?=
 =?utf-8?B?ck5nWjZoT2R2SXJFU3pMc1M0cGRRTmYxd1IxczUwQUhsK1MwTzRhbUNkWFhL?=
 =?utf-8?B?SVFXWEhUVGU2SytENzRpbm9lY082KzRRNGxHME8xOEFPTVRMcC9rd1RzR2RK?=
 =?utf-8?Q?wsUuatGqk/AGjKdrgI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0N6aitkZk9RS0k1RDFmUjRweDZvcEZPWUMrTHRtN2tJS3I0MnZ4aG1FSzAx?=
 =?utf-8?B?cTRuaUxaODNVdGhNbzJlK3dVVCtzTWdxRUVWTDJZR3dBOHJKbEhzcmVtdnQ1?=
 =?utf-8?B?YUZBUkxVV0FCNGlTUTJ6L0grSGJwVXcxSGF4SG5MRFkzWG1TdmQ3NUg5dXoz?=
 =?utf-8?B?cGp6ekRjN1c5bm50M2E1R2w3d0MvQWIrdHpDMHJ3V3BCbUE2a3lud3FoRlFw?=
 =?utf-8?B?Z1o0ejZ5d2lGR05ZNmpnZGp5cHFCdXhkb0JHaHRsdXNsWEhDRGVIWHBuQ3dT?=
 =?utf-8?B?N3JVK0o2aGhPN0tNdFZFNkMrTk5MRDcySnJxRVlTb0VYamQzT0lYZzdLZnBl?=
 =?utf-8?B?NGp3MTdIYy81ZXdZZW5HZ1Rvb0ZEcUJVWU5PbTFTZHlnQzlPRlpqRy9pc1lm?=
 =?utf-8?B?Kzl1R3dTV1NZaVNjSWdkdzZac1NnZFpjL2pLUEVyZ09pSndHMlNDMVk4OFAy?=
 =?utf-8?B?MmFGSE5UaGtkVnhFUGRmTGhBakNsL0RrQy9CdmlHem1uOS9PYlJ6Z1VzcVZv?=
 =?utf-8?B?TVdJMmw0T2l5NTRQeHZnSmJsUDFPSFBLeTFOd25vTTliOHJ3bENhRUQwdzh3?=
 =?utf-8?B?Z3dRL3dVT2NTSEJ2ZEtFQVcxK0tZVFU2OFNqS0luQ1ZIQ0NkMUd1VitrSGZk?=
 =?utf-8?B?bTlrU2hVWWhXdlB6Nk8zWTB1Tk5KdWVEdlRPK0d4amxHb0NKckhOK2V6TXBa?=
 =?utf-8?B?ekxKd1R3TGNYSEZNek0xT0Y5d2RBR2txd1duN3N2Zmo0YlJaMTNYWGxXOWFt?=
 =?utf-8?B?SWdOSzVvVmQrVTdvMnAzRnRUaXZRaHp2MFdaU1hxbXZHbFNhTU00Z1J5cWl1?=
 =?utf-8?B?djdrazU5YnA3VTNyZGo5S1A2alNkaGpEdmY3b0NQN09ZZGpyb3l2WUI5NDBv?=
 =?utf-8?B?M25rd3FNV2M4cmVxcXAxMExSZW9ZTHRLWTZ3Z041MmErVWtFcDVnd0xDL0Vj?=
 =?utf-8?B?Rzh1SGNCcW5VRnFtemJMWDk5eTU1N3BITFhiUHdROWpwMHk2d21kS3Q5dGVE?=
 =?utf-8?B?TXFwS2MyMmlDeERGWTlHRm5kZmIvQ08zdEYvOUNvK1NLNXQrQ055Y21Zdk0w?=
 =?utf-8?B?TmhqRTRMYjJKaHFxY0RJbzNMYndvUnJBeFVBYnN5Z0tLUkpnbDYweE1FYVEz?=
 =?utf-8?B?aFhVYmRPdkRqWVVUYmdxK1JFZUZNOFE2dVZ3SjR4YWJDU1c4djJlODFsOUdD?=
 =?utf-8?B?VzRUWmdMZTd0Y1poR1ZrWU5lSUlCeFZucTRtaFRRZUhGN3N5ZU8rcXRGVUE3?=
 =?utf-8?B?WERLcm93OHJBOVhGaDd3QVlZR2xnNHg0Rm1YNTFGODA5Uis2d0hteWQ2eUpQ?=
 =?utf-8?B?QkJTTFFOTXBXbG5qQ0FCZDhnU1h4cGJhb05FTUFZNmVLRklIM3ovQkZzWTA5?=
 =?utf-8?B?QmZZRmRmb3dQemlzMS9XaVNZeVl4NkgrT3RzMndBQm9XRWd3ZVlQbW5nMUxk?=
 =?utf-8?B?Yk5LZXFCTktPdnpSY0xJSjVCY1c1RVVBSWJ6OG44UzdxeU0zUVhkYzM3SkpI?=
 =?utf-8?B?SENZSEk4OWRQT1B6Y2dtOUMyNzA3eTVrWVliYzFrLzZhdXlkaTMxTG5YY0s1?=
 =?utf-8?B?RzBoSm5WSmxzMXk3RGhrRlNLTW1qVWRJUmtXRFVFOTVhaHJiYWZEenU0SzY5?=
 =?utf-8?B?UlFBV0w5MUZLb2s0UTl2VENybzlJT3BaYzVzQkZHRnVya1UzeWkwTlR2Q2tX?=
 =?utf-8?B?bVVVV3hVUjFrS3pWL0xOQmFwamZ3UlNDMHhCUzVVVUx1cjBiOFE1UkRzTU5m?=
 =?utf-8?B?WEJ5QWRLYTUzOWFjcWQ1L2VGbmcrbFhzMStRVW1qejRaRTNYUkxuVjlHQjVV?=
 =?utf-8?B?MDhOd2Z0TllBRUdXRzNDZXhrVGlNdnZkT3AyUUV6Wi8zbU5EVlc5VVRaeENr?=
 =?utf-8?B?d0FxaXMxdGk1ZVo4MzBxVzFkb0VweHZRTnJlckxMU0kyL25SdXdac1d4OUky?=
 =?utf-8?B?dWFsSUoxN3YrKzc0NHpTVW1BQTUydHI0ZUVUcGhMdG1nZ0huaXF5c1dXdzJu?=
 =?utf-8?B?UDFVcGNCM3BlTkRBV0VlYnR1dEZmVzFnUVZ4ZVViSmZteENMTUFHN3hDM0Ns?=
 =?utf-8?B?S1VEVDQ0UjlzVVFZU2hEdkhMQ2l6cTFuVzloN25BNXNvamhHTUJFSFNvek1K?=
 =?utf-8?B?d3RCSjRTa1Uwb2Q5eVQrVURoUWtzZ1R1dXJwL3FSd1BzeTJOWFB2RjRrcytC?=
 =?utf-8?B?SkE9PQ==?=
Content-ID: <7CD542F536719041B986945FBCBA17EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef86a478-86ab-44f3-d81a-08dce36ab754
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 05:17:46.1238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NomPBneDStpy7k+VDWQfeW2v/iE1E8WvMA9NCxSPgrapRdzdZobQpqesLFZKDNyzDpHjuJr+LFWcfXJbZMUciSmkiDsFan7ed48eMEhFc44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6582
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.339700-8.000000
X-TMASE-MatchedRID: hls5oAVArl84HKI/yaqRmzCIlN/eSPB9Za7LkubQvj+jD9XxfoENjteW
 FvQm49CB/MqNSuRRur7LbUqIM8i6plVWF3xil1AQkPoFsM336M7WSrKtwxqWpfrL5bbud8Fcq/m
 qnsCAxKZa9oyfq6TuaBd5jEXbXTBzfWckaz51fBVu+yxbbkYIFh852jgffnmIh8BhJvgqWBl4NB
 lm/4a7fSGNoqhINUJ6Gt9V3JO2UuF4+z8LHUMl3cAmcZEx8XHJIXYus8ZZZtaOUV82NDH4Ao90G
 xaR8c3tOgL+9VSMOXSRk6XtYogiatLvsKjhs0ldD16OIL8FA936APa9i04WGCq2rl3dzGQ15AqW
 llcjZ2i4/ZuQ/UuvVOO+KAdOUjfzvUfZoXFCmyYW4Nm9H97P6dzr+g3wo5Fwvb8dp3W46A2S39t
 AJi/WE6Ou1lGTOmV/onwk76HfIfs9XGVRM/cag7sCWxFv9DtZChiU+c//xP9DcA92Vl/o1w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.339700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2F19178FC024B59082D56857482E886F3CB9E785394F382B6F936C9620BF679D2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_834906257.658248981"
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

--__=_Part_Boundary_001_834906257.658248981
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiBKYXNvbjoNCj4gVGhhdCBpcyBhIGxvdCBvZiBpbmZvcm1hdGlvbiwgYW5kIHF1aXRlIGFib3Zl
IG15IGhlYWQhIFRoYW5rIHlvdQ0KPiB0aG91Z2guDQo+IA0KPiBJIHNob3VsZCBub3RlIHRoYXQg
dGhlIGxvZyBpdGVtcyBJIHNlbnQgeW91IGFyZSBmcm9tIHRoZSAiZ29vZCINCj4ga2VybmVsIC0g
DQo+IDYuMTEgd2l0aCB0aGUgY29tbWl0IHJldmVydGVkLiBIZXJlIGlzIGEgbXVjaCBsb25nZXIg
c2V0IG9mIGxvZ3M6IA0KPiBodHRwczovL3Rlcm1iaW4uY29tL2NvNnYNCj4gDQo+IEkndmUgcmVi
dWlsZCA2LjExIHdpdGggdGhlIGxvZyBzdGF0ZW1lbnQgZW5hYmxlZCBhbmQgdGhlICJiYWQiDQo+
IGJlaGF2aW9yLg0KPiBIZXJlIGlzIGEgZG1lc2cgZnJvbSB0aGF0OiBodHRwczovL3Rlcm1iaW4u
Y29tL3hpZXYNCj4gDQpIaSBBZGFtLA0KDQpJIHRoaW5rIHNvbWV0aGluZyB3cm9uZyB3aXRoIHlv
dXIgZG1lc2cgbGlua3MsIGJvdGggbG9ncyBsb29rIHRoZSBzYW1lLg0KV2Ugc2hvdWxkIHNlZSB0
aGlzIGxvZyBpbiB0aGUgImJhZCIgb25lOg0KZm10OjB4MzQzMjUyNTgsIGhhc19hbHBoYToweDAs
IGFscGhhOjB4ZmZmZiwgY29uOjB4MjAwMA0KDQpCdXQgYW55d2F5LCBJIHRoaW5rIHRoZSByZWFz
b24gZm9yIHRoZSBkb3duZ3JhZGUgaXMgY2xlYXIgZW5vdWdoIHRvIG1lLg0KU28gbGV0J3MgdHJ5
IHRvIGZpZ3VyZSBvdXQgdGhlIHNvbHV0aW9uLg0KDQo+IFRoZXNlIGxvZ3MgYXJlIGJvdGggZnJv
bSBgZG1lc2dgLg0KPiANCj4gSSdtIGZhaXJseSBjZXJ0YWluIEkndmUgYnVpbHQgd2l0aCB0aGUg
cGF0Y2ggeW91IHJlZmVyZW5jZWQgZW5hYmxlZC4NCj4gVGhlIA0KPiBrZXJuZWxzIEkgcnVuIGFy
ZSBqdXN0IHJlbGVhc2Uga2VybmVscywgbm90IFJDcyBvciBnaXQgYnJhbmNoZXMgb3IgDQo+IGFu
eXRoaW5nLiBUaGUgbWFpbmxpbmUgdjYuMTEga2VybmVsIGlzIHRoZSBvbmUgdGhhdCBoYXMgdGhp
cyBwcm9ibGVtLg0KPiBJZiANCj4gdGhhdCBwYXRjaCBoYXMgYmVlbiBtZXJnZWQgaW50byA2LjEx
ICh3aGljaCwgbG9va3MgbGlrZSBpdCBoYXMpIHRoZW4gDQo+IGl0J3MgaW4gdGhlIGtlcm5lbCBJ
J20gYnVpbGRpbmcuDQoNCkdvdCBpdC4NClRoZW4gT1ZMX0NPTlNUX0JMRU5EIG1pZ2h0IGJlIHRo
ZSB1bnN1cHBvcnRlZCBjb25maWd1cmF0aW9uIGluIE1UODE3MywNCkkgdGhpbmsgd2Ugc2hvdWxk
IHJlbW92ZSB0aGUgWFJHQjg4ODggZm9ybWF0IGZvciBNVDgxNzMuDQoNCkNvdWxkIHlvdSBwbGVh
c2UgdHJ5IHRoaXMgbW9kaWZpY2F0aW9uIGFuZCBzZWUgaWYgaXQnbGwgY2hhbmdlIHRvIHVzZQ0K
b3RoZXJzIHN1cHBvcnRlZCBmb3JtYXQgdG8gc2hvdyB0aGUgdGV4dD8NCg0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCkBAIC0xMDIsMTIgKzEwMiw5IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBpc18xMGJpdF9yZ2IodTMyIGZtdCkNCiB9DQoNCiBzdGF0aWMgY29uc3QgdTMyIG10
ODE3M19mb3JtYXRzW10gPSB7DQotICAgICAgIERSTV9GT1JNQVRfWFJHQjg4ODgsDQogICAgICAg
IERSTV9GT1JNQVRfQVJHQjg4ODgsDQotICAgICAgIERSTV9GT1JNQVRfQkdSWDg4ODgsDQogICAg
ICAgIERSTV9GT1JNQVRfQkdSQTg4ODgsDQogICAgICAgIERSTV9GT1JNQVRfQUJHUjg4ODgsDQot
ICAgICAgIERSTV9GT1JNQVRfWEJHUjg4ODgsDQogICAgICAgIERSTV9GT1JNQVRfUkdCODg4LA0K
ICAgICAgICBEUk1fRk9STUFUX0JHUjg4OCwNCiAgICAgICAgRFJNX0ZPUk1BVF9SR0I1NjUsDQoN
Cg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+IA0KPiAtIEFkYW0gVGhpZWRlDQo=

--__=_Part_Boundary_001_834906257.658248981
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7SmFzb246DQomZ3Q7JiMzMjtUaGF0JiMz
MjtpcyYjMzI7YSYjMzI7bG90JiMzMjtvZiYjMzI7aW5mb3JtYXRpb24sJiMzMjthbmQmIzMyO3F1
aXRlJiMzMjthYm92ZSYjMzI7bXkmIzMyO2hlYWQhJiMzMjtUaGFuayYjMzI7eW91DQomZ3Q7JiMz
Mjt0aG91Z2guDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0kmIzMyO3Nob3VsZCYjMzI7bm90ZSYjMzI7
dGhhdCYjMzI7dGhlJiMzMjtsb2cmIzMyO2l0ZW1zJiMzMjtJJiMzMjtzZW50JiMzMjt5b3UmIzMy
O2FyZSYjMzI7ZnJvbSYjMzI7dGhlJiMzMjsmcXVvdDtnb29kJnF1b3Q7DQomZ3Q7JiMzMjtrZXJu
ZWwmIzMyOy0mIzMyOw0KJmd0OyYjMzI7Ni4xMSYjMzI7d2l0aCYjMzI7dGhlJiMzMjtjb21taXQm
IzMyO3JldmVydGVkLiYjMzI7SGVyZSYjMzI7aXMmIzMyO2EmIzMyO211Y2gmIzMyO2xvbmdlciYj
MzI7c2V0JiMzMjtvZiYjMzI7bG9nczomIzMyOw0KJmd0OyYjMzI7aHR0cHM6Ly90ZXJtYmluLmNv
bS9jbzZ2DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0kmIzM5O3ZlJiMzMjtyZWJ1aWxkJiMzMjs2LjEx
JiMzMjt3aXRoJiMzMjt0aGUmIzMyO2xvZyYjMzI7c3RhdGVtZW50JiMzMjtlbmFibGVkJiMzMjth
bmQmIzMyO3RoZSYjMzI7JnF1b3Q7YmFkJnF1b3Q7DQomZ3Q7JiMzMjtiZWhhdmlvci4NCiZndDsm
IzMyO0hlcmUmIzMyO2lzJiMzMjthJiMzMjtkbWVzZyYjMzI7ZnJvbSYjMzI7dGhhdDomIzMyO2h0
dHBzOi8vdGVybWJpbi5jb20veGlldg0KJmd0OyYjMzI7DQpIaSYjMzI7QWRhbSwNCg0KSSYjMzI7
dGhpbmsmIzMyO3NvbWV0aGluZyYjMzI7d3JvbmcmIzMyO3dpdGgmIzMyO3lvdXImIzMyO2RtZXNn
JiMzMjtsaW5rcywmIzMyO2JvdGgmIzMyO2xvZ3MmIzMyO2xvb2smIzMyO3RoZSYjMzI7c2FtZS4N
CldlJiMzMjtzaG91bGQmIzMyO3NlZSYjMzI7dGhpcyYjMzI7bG9nJiMzMjtpbiYjMzI7dGhlJiMz
MjsmcXVvdDtiYWQmcXVvdDsmIzMyO29uZToNCmZtdDoweDM0MzI1MjU4LCYjMzI7aGFzX2FscGhh
OjB4MCwmIzMyO2FscGhhOjB4ZmZmZiwmIzMyO2NvbjoweDIwMDANCg0KQnV0JiMzMjthbnl3YXks
JiMzMjtJJiMzMjt0aGluayYjMzI7dGhlJiMzMjtyZWFzb24mIzMyO2ZvciYjMzI7dGhlJiMzMjtk
b3duZ3JhZGUmIzMyO2lzJiMzMjtjbGVhciYjMzI7ZW5vdWdoJiMzMjt0byYjMzI7bWUuDQpTbyYj
MzI7bGV0JiMzOTtzJiMzMjt0cnkmIzMyO3RvJiMzMjtmaWd1cmUmIzMyO291dCYjMzI7dGhlJiMz
Mjtzb2x1dGlvbi4NCg0KJmd0OyYjMzI7VGhlc2UmIzMyO2xvZ3MmIzMyO2FyZSYjMzI7Ym90aCYj
MzI7ZnJvbSYjMzI7JiM5NjtkbWVzZyYjOTY7Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJJiMzOTtt
JiMzMjtmYWlybHkmIzMyO2NlcnRhaW4mIzMyO0kmIzM5O3ZlJiMzMjtidWlsdCYjMzI7d2l0aCYj
MzI7dGhlJiMzMjtwYXRjaCYjMzI7eW91JiMzMjtyZWZlcmVuY2VkJiMzMjtlbmFibGVkLg0KJmd0
OyYjMzI7VGhlJiMzMjsNCiZndDsmIzMyO2tlcm5lbHMmIzMyO0kmIzMyO3J1biYjMzI7YXJlJiMz
MjtqdXN0JiMzMjtyZWxlYXNlJiMzMjtrZXJuZWxzLCYjMzI7bm90JiMzMjtSQ3MmIzMyO29yJiMz
MjtnaXQmIzMyO2JyYW5jaGVzJiMzMjtvciYjMzI7DQomZ3Q7JiMzMjthbnl0aGluZy4mIzMyO1Ro
ZSYjMzI7bWFpbmxpbmUmIzMyO3Y2LjExJiMzMjtrZXJuZWwmIzMyO2lzJiMzMjt0aGUmIzMyO29u
ZSYjMzI7dGhhdCYjMzI7aGFzJiMzMjt0aGlzJiMzMjtwcm9ibGVtLg0KJmd0OyYjMzI7SWYmIzMy
Ow0KJmd0OyYjMzI7dGhhdCYjMzI7cGF0Y2gmIzMyO2hhcyYjMzI7YmVlbiYjMzI7bWVyZ2VkJiMz
MjtpbnRvJiMzMjs2LjExJiMzMjsod2hpY2gsJiMzMjtsb29rcyYjMzI7bGlrZSYjMzI7aXQmIzMy
O2hhcykmIzMyO3RoZW4mIzMyOw0KJmd0OyYjMzI7aXQmIzM5O3MmIzMyO2luJiMzMjt0aGUmIzMy
O2tlcm5lbCYjMzI7SSYjMzk7bSYjMzI7YnVpbGRpbmcuDQoNCkdvdCYjMzI7aXQuDQpUaGVuJiMz
MjtPVkxfQ09OU1RfQkxFTkQmIzMyO21pZ2h0JiMzMjtiZSYjMzI7dGhlJiMzMjt1bnN1cHBvcnRl
ZCYjMzI7Y29uZmlndXJhdGlvbiYjMzI7aW4mIzMyO01UODE3MywNCkkmIzMyO3RoaW5rJiMzMjt3
ZSYjMzI7c2hvdWxkJiMzMjtyZW1vdmUmIzMyO3RoZSYjMzI7WFJHQjg4ODgmIzMyO2Zvcm1hdCYj
MzI7Zm9yJiMzMjtNVDgxNzMuDQoNCkNvdWxkJiMzMjt5b3UmIzMyO3BsZWFzZSYjMzI7dHJ5JiMz
Mjt0aGlzJiMzMjttb2RpZmljYXRpb24mIzMyO2FuZCYjMzI7c2VlJiMzMjtpZiYjMzI7aXQmIzM5
O2xsJiMzMjtjaGFuZ2UmIzMyO3RvJiMzMjt1c2UNCm90aGVycyYjMzI7c3VwcG9ydGVkJiMzMjtm
b3JtYXQmIzMyO3RvJiMzMjtzaG93JiMzMjt0aGUmIzMyO3RleHQmIzYzOw0KDQotLS0mIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQorKysmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQpAQCYjMzI7LTEwMiwxMiYjMzI7KzEw
Miw5JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbmxpbmUmIzMyO2Jvb2wmIzMyO2lzXzEwYml0X3Jn
Yih1MzImIzMyO2ZtdCkNCiYjMzI7fQ0KDQomIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3UzMiYj
MzI7bXQ4MTczX2Zvcm1hdHNbXSYjMzI7PSYjMzI7ew0KLSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9YUkdCODg4OCwNCiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtEUk1fRk9STUFUX0FSR0I4ODg4LA0KLSYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9CR1JYODg4OCwNCiYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtEUk1fRk9STUFUX0JHUkE4ODg4LA0KJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO0RSTV9GT1JNQVRfQUJHUjg4ODgsDQotJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtEUk1fRk9STUFUX1hCR1I4ODg4LA0KJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO0RSTV9GT1JNQVRfUkdCODg4LA0KJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO0RSTV9GT1JNQVRfQkdSODg4LA0K
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO0RSTV9GT1JNQVRfUkdCNTY1
LA0KDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstJiMz
MjtBZGFtJiMzMjtUaGllZGUNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
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

--__=_Part_Boundary_001_834906257.658248981--

