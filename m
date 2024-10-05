Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6E9915A4
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 12:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E3710E023;
	Sat,  5 Oct 2024 10:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HGWGr17d";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="r5i+tFBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDA10E023
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 10:03:11 +0000 (UTC)
X-UUID: 055c637a830111efb66947d174671e26-20241005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4XBrngTXon6pBZ15iDIRI8MRsC7aCTX7qOodDQA7nPQ=; 
 b=HGWGr17dohwIZytuOPRiwPPD/tcwqK2x+KilQyVCyONOe5bIMxp+fWMMsPWOPbiWujAZClW4QH7eYbvoYEaWB4a8nH4IiQ2wMcB7fPBgmu3eSLOPJh9JUxErKPBDUP8jDaOFlX6BsvgoxzWmo8zG91NkXsqobmfNXRzSgL/aQdg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:4e2a1970-1525-4ea3-bf1c-7c9870385c8f, IP:0,
 U
 RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:6dc6a47, CLOUDID:9d16ca40-8751-41b2-98dd-475503d45150,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:4|-5,EDM:-3,I
 P:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
 ,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 055c637a830111efb66947d174671e26-20241005
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1068539880; Sat, 05 Oct 2024 18:03:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 5 Oct 2024 18:03:05 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Sat, 5 Oct 2024 18:03:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMd5sJnQdj/7i4yEX8f+OwCoG4pM5c0TL7sbD4z+we+1DUDudOwqKvx/7q9Lhv8OdIhXPoK30TvFUh18+jDGcu1BcqzY6AKpfVR6GNgu5K2Hd3d4HbDl4+GRZdoQlFNWY0NoU0vDFTmuwN+iLu4+jSxVNxRtNBXwZoTrh4kDqsUoJOZxXglrqR1D7hBOxE+4MeD19oI43ncu1JHIoIr3U6uKIirUxT6bJ5JyEQZCFIoiNI4nsT9z5wQYeAUNQBNYwi9iZoYD8gvZQpJGu4QwYHNbbX5OsFofIRMW3ybNeYkMP5v3lv021Y5SntzAjoLL7INPevqDGkHe5kcc22O7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0+DLWKkEV3V7LYEHOZKNDJltCIkgQuh1mB9yWYlcJg=;
 b=WzCyyImIvwat0UePfsW1NtRMZV5XB71GRvjpzcfAKfnnSTCqO8fG6Nqm6UyGMV0oyMrL82Y1xtXBGQWmtMTUv4yGq0WZ8/I+Lz88yNfyI+HnRpoTr0F220Vxxi+RwclCYZZyhJuC5a7jLHTlHYCEoQFOehneU26C9HDWMiCChom1GIpGKApdKGhHEN60D9I+HjPQLw89TEq/2KPAMG9x84N/ibr+cEP6fUt6YwoKzSuMUnjJUKdhfBzecxeKIEXiZk9PSzOyYkWHMi2jf3s1TwT6LOw6HxixwcEcRrCm7SrmOSFxFMOebT4aUduO7r4K7Vr5qLRPAKDWGkPvbqBfYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0+DLWKkEV3V7LYEHOZKNDJltCIkgQuh1mB9yWYlcJg=;
 b=r5i+tFBbRC4AK3K5CVqeV89TmpHeyLUYBGlvyWcNeBPdFm4FqbA21ADjaM3mSaI9xPXqyt8LzzTmrroIrqOx1e78JCXgLe3zOPy5p2Bb2hmbdFkxMWMo2LbT7r3GsfVEo2OffHBts5UD8aIWTyzyCKe/VfRRAm4OagqF/SCNgOI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8456.apcprd03.prod.outlook.com (2603:1096:101:20a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Sat, 5 Oct
 2024 10:03:00 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.017; Sat, 5 Oct 2024
 10:02:59 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "djkurtz@chromium.org"
 <djkurtz@chromium.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "me@adamthiede.com" <me@adamthiede.com>,
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
Thread-Index: AQHbFVPlNViRsB+fWkG+2zWvYOwE6rJ3tjcAgAA6owA=
Date: Sat, 5 Oct 2024 10:02:59 +0000
Message-ID: <b8fb4f241b2d248ca4c2c57b98588e1be0642b76.camel@mediatek.com>
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
In-Reply-To: <d820e8be-c525-4435-99a3-b0eb076b3282@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8456:EE_
x-ms-office365-filtering-correlation-id: fddaa6aa-24df-454a-f166-08dce524e46f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dzNSQlZvdGVsVGM1UitKV0N2M3o1MFBDL2VMd0thRjdDOG91ejE4bEp2enFV?=
 =?utf-8?B?aVkzd01wMkg4YTJUZTkxQmtrOGo3aUhFV3ZlTnFZSk8vU2lLR2VaQm5EaVhS?=
 =?utf-8?B?TGZTaTZ0WEtwVEF2M3MrOUs4dldNamhnWTA1RklvV0RRSmphTjFjZnl5MlA2?=
 =?utf-8?B?SjhsbW53aFZmNGRuUGpReXZ5T2wwM1ArNTNoOFFLdkJCdEh5aEswdEdJK3I5?=
 =?utf-8?B?Q3U4bjN3bDhZOUZCakxWR1JzeGMxcDRNcjV1aHdmUzlBWkxTNjBVeGY3NUZU?=
 =?utf-8?B?UkJOTzNnZVdwaW9HdjhrTGgwUmViNHpzVGlPcHJrcWlmY0ZsSmlxS0xINzlE?=
 =?utf-8?B?ZWVBd1NvYTk1cE9MbEc1QkxEczVnc1JFSVBRaWxtVkI2WDFsSDQrZjIwRi95?=
 =?utf-8?B?eWR5NzNKUklPd05LOCtkUGlMMWg3NVNjQ0hybkRrNXFuTWd5bHpSVFhRcnFO?=
 =?utf-8?B?NzJEbnNEUG53KzAzbURNK1d1Umx4UldkR05ZbnJXUjZieFY0QlN3ZW1qTFZl?=
 =?utf-8?B?YXRHbkFTZmhiNGFENTlSU3Q0MjFPWXo1cHNJOFdsdXhCQ01URWlQR1hRS3Er?=
 =?utf-8?B?WXJ6QzVjRUtuZHVva2crYndGT3BheWVVWGtlSVlaa3lGVUY1QVFjbXVUdmZQ?=
 =?utf-8?B?WVljLzZycEdtakZtVkdldjBJNUU3YUt5RitXUDhxbXlMMFhFN08wTzJSbjVa?=
 =?utf-8?B?cVk2U1dwUVVNR3hvRm9DOTFPQUM4MjF1czhubUZsSFliSUUxYytWcGQ1WFM1?=
 =?utf-8?B?TjR6U0NHbDJFZ0wwVEdiRHpOQmVNYlI3aFdmRDlUaGVRZGxuUnNVaW8xVDVM?=
 =?utf-8?B?SVRjNll3RVpYL2JmQkdjTzAzR3QyakdrQ1pZS3MwMXB2K0t1dUhVUFNPbUpm?=
 =?utf-8?B?OWJFelFDRTFIUTBpOVN2cGJHODMvVDJXU2JRZkdicEw2V2tTK3ZVb0VhOGxn?=
 =?utf-8?B?M2NCUW9DWW0rTzY4c1IzdE5ibU5tQ1ZmYy9MajBnR2JHOVlVYWVNN2FjYjdQ?=
 =?utf-8?B?eG1JVk4wRTRnYVdJQ3BwMHBRRTN1K0taWXZtZmR6dHY0a0NROWlZNUJleFlB?=
 =?utf-8?B?QlU3WmJQME4wdHpsUVgzN042L3ZCdjI0bTludlhzRSs5TWg5ZTdWZkJnTld6?=
 =?utf-8?B?MEc1dFV1dmhNNVFka1NsbEdhL3cyUExFemIrN1NXbE9pZnBmWUFsQ25sRUNh?=
 =?utf-8?B?eFQ1MVJwMmNEK2pscmlZS2pRUFdlK0liT3k5S3dCU0xKNnYvaDdwVzhNWWJX?=
 =?utf-8?B?dFYzNGdQZzdPYXFaQ2JvQ1ZaclBDZkhjUVg1aWRPYjRqM09HVEg0RUlyQnFi?=
 =?utf-8?B?c2NuQTU4ZFRpR1BhbDl3eklIVFpKY1lNNFNTZm50MmxZUVB4VDJrN2RteXZB?=
 =?utf-8?B?Mnp6MHVjQkVsM3lwTGxmak9ZNTZFWDdKZnQ0LzAxbWRWbnBhTjNhQXZFdGNk?=
 =?utf-8?B?UTEyQkJ3NGNsOVZkV2phd1N1WDhTQ0FVT1FCQ0FLT2ZrVVU1VlZaVVlpTE5R?=
 =?utf-8?B?eVdhVi9JclQxZnlKZEEyenRUNDNScHltekNHMVFOSzI1dURGYXVpbS9BcE9G?=
 =?utf-8?B?ekpKblJuaXhsdGp6M0pTOVljTUVCRkh1a0JZSE5jTDVsR1VNc0NLVzhsU1Bk?=
 =?utf-8?B?d0RjWUVOR1htNDlORFU5dzZmYW5jcmkwMEdra1djYXBvc3BCQ0xrbzAvM2tj?=
 =?utf-8?B?Wll1K3BWempmOVFGcXJpRDdyM1M0dTlKNkxxOHVsbi9SZWU3SGEzSFlBZm42?=
 =?utf-8?B?R1l0ZVBrZ3F2R2N4bEpiRkFCb0dYekJybTZQUWtKc3A4Sk9lRlBLZkNlY2Ft?=
 =?utf-8?Q?Kco+WUhPy+ZSTWUe3HEvEb80rtz6/hiREOMz4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzNvL0xOa3E5TWRxV3NUQzJKNFZleE92QVh0NTJJQU1TZ245NVNSaUFwRW1n?=
 =?utf-8?B?MlNzY0p1a0NMWFZBbkNXMVpUaFVGeHZtOStac2VuRkdvY0k3eXpOWHFqVU91?=
 =?utf-8?B?Q1llVDFLNFBHN1JhT2tEWk1rQ3MzSHhCajBQV0xiY29pSkJjM0FKci92TVIv?=
 =?utf-8?B?YUloVkpoQ3lLUWxReDIyMnVTcEVCbDB0VGN5dmFEbHVlTSs4WURUOERjVERa?=
 =?utf-8?B?SlFPQTVZT20yNUNJZE9OREJITjVBQ3ZTUmhaWEQxeUlyQXJxdHBmbmw5OFNY?=
 =?utf-8?B?bHJGNVk4UWQxZ04vak1SUlh6OUNRYWRBandHRVoxck0zSFF4VnNFZGhIN3M3?=
 =?utf-8?B?L1RoTE5PenJYZTk4M3R4bWpwVjhZZzJxcXVGMlhyc1grWGZoMFNyK1c3eGV0?=
 =?utf-8?B?ZUdGdzdiSlpFazkweEIvY2VIVG44bmpURE0vSzFuOUMzTUdzL1VLVGxGR3FG?=
 =?utf-8?B?eWpHVWZNem9uamcvSjJmVHBVSXhmajAxNmExQXNpSnhwR0sveFFEUVRnU214?=
 =?utf-8?B?ZlVkbTBEN0I3M2UxWmVXbUljaEk4d0pmTjhVMS9iZUpJdjg3NFVqdGNsRkxC?=
 =?utf-8?B?eDcvWDV2LzhJU0NscVJQUmFKY3pXdkQ4aWZrak5wY0hBZ3lQVmExVU5Rc0dJ?=
 =?utf-8?B?ODdUNUlTM1FqUngrYklFc0FpcHRWL2pHTlNyTkJHbFdpRWN0SVcvdVJubUZ6?=
 =?utf-8?B?aVlGbEhJc25naDUwczM4TDJGYWRHN3NHU0ZNU2l1OG1kMFZDZ3RZT0xFQld0?=
 =?utf-8?B?UU93a0NrWEg1WDVaQXEwT3NDSjVtVEpkSTlMUTJ4bXFnWFNXMnFDRmF5VUwr?=
 =?utf-8?B?U0JrRG1IU2pyS28rN2JjZytRK0pXNWZaL1ZHcGpqTXlMTk92R2lZTXcwWHlt?=
 =?utf-8?B?c3JxZTVmNlEyQjZnbmFJYUJnc2VJNlNoQk1Kc0ZtRGJ1NGpzVTdFWTVwL1VL?=
 =?utf-8?B?eU5tb2ZzSG01eXF2MEhKK3ZUSkZ5aFF3ZGNUUU1wQ1JZUGFGaTRSQU9icDJX?=
 =?utf-8?B?WDB0NGFyL0UwK2hVR3BkNGUydHFzdHVzVDBKUzZFUFJVR1ZlellSbFdHK2U2?=
 =?utf-8?B?V0dqQWxZMkVDNjBNS0tEYzl3MW1WQVVpc3pnL1lkWG9uYjVDWUZkMFo1Wnlx?=
 =?utf-8?B?dkxqR2h5Q3ZuUFhFdkQ0TEZ1ejBVREpXVFBhdXZheHhjQ3k3bGx6bDhMVVV6?=
 =?utf-8?B?YlJITmJ4OER6YVhaTDR5YU9nNk0vUXVOZmtpd0I2RFpQcWkyeTBjMHRCWWFP?=
 =?utf-8?B?d2FqTDR3Q1RLSnZVNG85bmdxdkxranJtVm5pNE5UeWRMdFoxNThGdmpmNWtB?=
 =?utf-8?B?dlhPU3NlVGJidTdsRWJjSUR2c0duMHdDNDlPUnMwVzMwWHVCRWZPa1F1bHJO?=
 =?utf-8?B?ODNMbTZ5QmdrUXNlWThPbTBXSUlsY3IrekxocTZlVmRtMVBIN3JmN1hKdVlO?=
 =?utf-8?B?K0ZzQ25adzY5RFFXOFBPU1Y0d3FzVTIwTmtpNXdxMTk1RW1kSEtJV3FqRlZK?=
 =?utf-8?B?L3ZHeHBsNzVZMEc2NWQzSUxJZ0htK2J5VGZxWG0yMXE3blBKNFNLeFptaVNi?=
 =?utf-8?B?dlJQRVd0cnAvcjd0OWpzL041RzBSZlI4THFKYVdKOGN2TUwraU5HTWpVdVg5?=
 =?utf-8?B?MWFnQ1RMaFloTjI5OE5xRW1YRG9yV2NyY29qUkl1cnNzc0Y3Ukd4eXUwUkFK?=
 =?utf-8?B?WUthSlpvVEg0MzRybm5PaGtqcGNGRE1DY05kRVJpbnhxRDUwQlhTcnZqRzQ3?=
 =?utf-8?B?MDNqTXpJR3ZBcFVrRzZqYW1ZbU1SR2pidGhrblEvRjZYdDhDc29YK0xzVVc4?=
 =?utf-8?B?MU1jS3FBYS85MEFNOWIrd09TNlA4NmNtS0NsdzlBUFRNbUhuUXJUa3JrKzRQ?=
 =?utf-8?B?S0ROcVJERnZvZmRJeWw2aUVpQWFvKytESjFzT2xtdkgxOVA4aHdVVWlhZnhv?=
 =?utf-8?B?OTdUYlkxMDFPMGg3RGJGWUJOR3ROYXFaTk9lL0tHdHNIdzc4M1F5bENTRXln?=
 =?utf-8?B?NXFNTjg4UWVseUNZbm94NUFLUVBRK2tjTC8wYS8rWXR3eDV3M1VVdXF5UTNR?=
 =?utf-8?B?bkxTZFRPZExNZzFMcjFvWURtcWxMRGU5THhnY0dHOEg0YmFQQzBYVng4bXhB?=
 =?utf-8?B?N2I4bTVjbFlZV1lTS3hFMnpIMHpTVXlNbmhYemZKVlZrOEUxd2NCOFlBNkpo?=
 =?utf-8?B?bEE9PQ==?=
Content-ID: <EA781588372BCA479FAABC0F29EB88DC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fddaa6aa-24df-454a-f166-08dce524e46f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2024 10:02:59.3785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33EaSByC4eGXYcYQJqRpKYxGAX0RRlFPiQDcf9ldiFrDmEAozsVXWBxdp6ufpn8cBZsc0uC+T6f1091Ry6PW1VKQCqc8b0hkqidos/+rycQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8456
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.873800-8.000000
X-TMASE-MatchedRID: 9zTThWtzImsn2WEbWzq9rUOLK43kW8U27f6JAS2hKPjXIZTIUrehXknC
 M4OR855doO9cNC/nIh7cuGoKzkWNUL8nFEEdZMCmvHKClHGjjr0Ea8g1x8eqFzRCaZSKE/OsnJl
 qVKcsJUiMeweAXr5ZNyXquvz3fdpukU34HyglnloZXJLztZviXNK/6grv3GOd+jjY4TGIcMD6sR
 z1g/tlo+LzNWBegCW2PZex/kxUIHWNo+PRbWqfRDsAVzN+Ov/sa8/MS16xLu3cc9h9qrSwG2PUK
 AUpOPSEC8u9OgapNfhXyF7V54OtVw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.873800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3A5A215141F994E3E429E4C90A3269F94FEC057DA48E05C3A057D85E0A881D0F2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1958724933.1041346963"
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

--__=_Part_Boundary_008_1958724933.1041346963
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+IEBAIC0xMDIs
MTIgKzEwMiw5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc18xMGJpdF9yZ2IodTMyIGZtdCkNCj4g
PiAgIH0NCj4gPiANCj4gPiAgIHN0YXRpYyBjb25zdCB1MzIgbXQ4MTczX2Zvcm1hdHNbXSA9IHsN
Cj4gPiAtICAgICAgIERSTV9GT1JNQVRfWFJHQjg4ODgsDQo+ID4gICAgICAgICAgRFJNX0ZPUk1B
VF9BUkdCODg4OCwNCj4gPiAtICAgICAgIERSTV9GT1JNQVRfQkdSWDg4ODgsDQo+ID4gICAgICAg
ICAgRFJNX0ZPUk1BVF9CR1JBODg4OCwNCj4gPiAgICAgICAgICBEUk1fRk9STUFUX0FCR1I4ODg4
LA0KPiA+IC0gICAgICAgRFJNX0ZPUk1BVF9YQkdSODg4OCwNCj4gPiAgICAgICAgICBEUk1fRk9S
TUFUX1JHQjg4OCwNCj4gPiAgICAgICAgICBEUk1fRk9STUFUX0JHUjg4OCwNCj4gPiAgICAgICAg
ICBEUk1fRk9STUFUX1JHQjU2NSwNCj4gDQo+IFRoaXMgaXMgd2hhdCBJIGdldCBvbiBNVDY3MzU6
DQo+IA0KPiBbICAgIDEuNzI5NDY3XSBtZWRpYXRlay1kcm0gbWVkaWF0ZWstZHJtLjEuYXV0bzog
W2RybV0gYnBwL2RlcHRoDQo+IHZhbHVlIA0KPiBvZiAzMi8yNCBub3Qgc3VwcG9ydGVkDQo+IFsg
ICAgMS43Mzc3NzddIG1lZGlhdGVrLWRybSBtZWRpYXRlay1kcm0uMS5hdXRvOiBbZHJtXSBObyBj
b21wYXRpYmxlIA0KPiBmb3JtYXQgZm91bmQNCj4gWyAgICAxLjc0NTk0M10gbWVkaWF0ZWstZHJt
IG1lZGlhdGVrLWRybS4xLmF1dG86IFtkcm1dICpFUlJPUiogDQo+IGZiZGV2LWRtYTogRmFpbGVk
IHRvIHNldHVwIGdlbmVyaWMgZW11bGF0aW9uIChyZXQ9LTIyKQ0KPiANCg0KSGkgQWRhbSwgWWFz
c2luZSwNCg0KUGxlYXNlIHRyeSB0aGUgcGF0Y2hlcyBiZWxvdyBhbmQgY2hlY2sgaWYgdGhleSBj
YW4gZml4IHRoZSBkb3duZ3JhZGUNCmlzc3VlOg0KWzFdIEZpeCBkZWdyYWRhdGlvbiBwcm9ibGVt
IG9mIGFscGhhIGJsZW5kaW5nIHNlcmllcw0KLSANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9ODkzNjM0DQpbMl0gZHJtL21l
ZGlhdGVrOiBGaXggWFJHQiBmb3JtYXQgYnJlYWthZ2UgZm9yIGJsZW5kX21vZGVzIHVuc3VwcG9y
dGVkDQpTb0NzDQotIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1lZGlhdGVrL3BhdGNoLzIwMjQxMDA1MDk1MjM0LjEyOTI1LTEtamFzb24tamgubGluQG1lZGlh
dGVrLmNvbS8NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+ID4gDQo+ID4gUmVnYXJkcywN
Cj4gPiBKYXNvbi1KSC5MaW4NCj4gPiANCj4gPj4NCj4gPj4gLSBBZGFtIFRoaWVkZQ0KPiANCg==

--__=_Part_Boundary_008_1958724933.1041346963
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kysr
JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7
Jmd0OyYjMzI7QEAmIzMyOy0xMDIsMTImIzMyOysxMDIsOSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7
aW5saW5lJiMzMjtib29sJiMzMjtpc18xMGJpdF9yZ2IodTMyJiMzMjtmbXQpDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7dTMyJiMzMjttdDgxNzNfZm9ybWF0c1td
JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtEUk1fRk9STUFUX1hSR0I4ODg4LA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9BUkdCODg4
OCwNCiZndDsmIzMyOyZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O0RSTV9GT1JNQVRfQkdSWDg4ODgsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtEUk1fRk9STUFUX0JHUkE4ODg4LA0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
RFJNX0ZPUk1BVF9BQkdSODg4OCwNCiZndDsmIzMyOyZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO0RSTV9GT1JNQVRfWEJHUjg4ODgsDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtEUk1fRk9STUFU
X1JHQjg4OCwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO0RSTV9GT1JNQVRfQkdSODg4LA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9SR0I1
NjUsDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO2lzJiMzMjt3aGF0JiMzMjtJJiMzMjtn
ZXQmIzMyO29uJiMzMjtNVDY3MzU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1smIzMyOyYjMzI7JiMz
MjsmIzMyOzEuNzI5NDY3XSYjMzI7bWVkaWF0ZWstZHJtJiMzMjttZWRpYXRlay1kcm0uMS5hdXRv
OiYjMzI7W2RybV0mIzMyO2JwcC9kZXB0aA0KJmd0OyYjMzI7dmFsdWUmIzMyOw0KJmd0OyYjMzI7
b2YmIzMyOzMyLzI0JiMzMjtub3QmIzMyO3N1cHBvcnRlZA0KJmd0OyYjMzI7WyYjMzI7JiMzMjsm
IzMyOyYjMzI7MS43Mzc3NzddJiMzMjttZWRpYXRlay1kcm0mIzMyO21lZGlhdGVrLWRybS4xLmF1
dG86JiMzMjtbZHJtXSYjMzI7Tm8mIzMyO2NvbXBhdGlibGUmIzMyOw0KJmd0OyYjMzI7Zm9ybWF0
JiMzMjtmb3VuZA0KJmd0OyYjMzI7WyYjMzI7JiMzMjsmIzMyOyYjMzI7MS43NDU5NDNdJiMzMjtt
ZWRpYXRlay1kcm0mIzMyO21lZGlhdGVrLWRybS4xLmF1dG86JiMzMjtbZHJtXSYjMzI7KkVSUk9S
KiYjMzI7DQomZ3Q7JiMzMjtmYmRldi1kbWE6JiMzMjtGYWlsZWQmIzMyO3RvJiMzMjtzZXR1cCYj
MzI7Z2VuZXJpYyYjMzI7ZW11bGF0aW9uJiMzMjsocmV0PS0yMikNCiZndDsmIzMyOw0KDQpIaSYj
MzI7QWRhbSwmIzMyO1lhc3NpbmUsDQoNClBsZWFzZSYjMzI7dHJ5JiMzMjt0aGUmIzMyO3BhdGNo
ZXMmIzMyO2JlbG93JiMzMjthbmQmIzMyO2NoZWNrJiMzMjtpZiYjMzI7dGhleSYjMzI7Y2FuJiMz
MjtmaXgmIzMyO3RoZSYjMzI7ZG93bmdyYWRlDQppc3N1ZToNClsxXSYjMzI7Rml4JiMzMjtkZWdy
YWRhdGlvbiYjMzI7cHJvYmxlbSYjMzI7b2YmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7c2Vy
aWVzDQotJiMzMjsNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1t
ZWRpYXRlay9saXN0LyYjNjM7c2VyaWVzPTg5MzYzNA0KWzJdJiMzMjtkcm0vbWVkaWF0ZWs6JiMz
MjtGaXgmIzMyO1hSR0ImIzMyO2Zvcm1hdCYjMzI7YnJlYWthZ2UmIzMyO2ZvciYjMzI7YmxlbmRf
bW9kZXMmIzMyO3Vuc3VwcG9ydGVkDQpTb0NzDQotJiMzMjsNCmh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTAwNTA5NTIzNC4xMjky
NS0xLWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4N
Cg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYj
MzI7Jmd0OyYjMzI7SmFzb24tSkguTGluDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7LSYjMzI7QWRhbSYjMzI7VGhpZWRlDQomZ3Q7
JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_1958724933.1041346963--

