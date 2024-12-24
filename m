Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711E9FBA0F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 08:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7358410E5D9;
	Tue, 24 Dec 2024 07:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YTP7LZ+l";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GagsqOEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635F10E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 07:05:33 +0000 (UTC)
X-UUID: 74af06c6c1c511efbd192953cf12861f-20241224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=JcCle8yeE98DV/e80VutpldIhJoVSod8cOfMTa/qnl4=; 
 b=YTP7LZ+l9jAxvp89lYiVqgq51aRArhPRnDqh5njULhxuw2RdQP1dJ9y7mHvkEEHRewgGZu1rravwr2CgQzeLXHVd8AzrfU8kTbyV9MoL/9XpA4+L7pqDor9ZtK1OrLu6wBRey2fJNcU3AoyqKZ0srVXj57EVucA3HwZgN+bqipI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:2d57f7de-27a8-425d-ad4c-45be412dfa09, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:cd4d1b25-8650-4337-bf57-045b64170f0c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 74af06c6c1c511efbd192953cf12861f-20241224
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1470117360; Tue, 24 Dec 2024 15:05:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Dec 2024 15:05:26 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Dec 2024 15:05:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fdf0UvO55tNJoFhUTMVwuS6DRgNapkmd3mr+cHr4SnZMNxnDJpZ3j2gpMFpcVv4vukWFJvlvs4oUcfKN44RIULVRyUEFHW9Wkt8u9k/GQYcB2/loYKrB7T6E0KlLh6TILMX4NqeaQs6tG7OWbSk/s0LVwkB8v241IoPvjsFylycmqngyGbC4vIsVZju6sKHj5bN/uHhU6LL3vmQKRRQeMRICcwVYskupX3jTYjRNWYb5LEyiSAJ71BmtjQeg/uNJ+ldaa+2efd/lffizhrHAJWbH+xEv9DrmqpAEBNHqjq+g7OpR4AloSzWalKH036G/tBGGKuG1F1ed2NIwPxnD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iwok3QbEseGCAzZv/NpfmCf+kzdors8WVO29WyIYpxo=;
 b=SiMw1fbNrPeQQ5nizViNeDvqGJRl7GlFWzhis++RJjCW1lrpt1u3RD0yRYuLkcaU4bXqOZ32F5/gCvf3AS39N1aqS9bKwwbbH3yQWTV1o2xdojuHDaMrxvXeAXdKYhVhI1VzZSC2cn2XqoaU9NGUvaGrvGjDvwH6sOyFZtJkSbyjhpP0pXYsbmbLJot2wcB+zYpmClYIEcV6p18A7No9dBEYiPCwbgIKTHshl3Pk7jZeN/i4XbeKl21dZPk4wxgpGhH12GFYtn+pxIT6CH4Mdbf+zAWzHrzuFXlSuaZbzXDY2yG2T6jvctl0bLss9J5EUBJDWOFe1WB1ID1HJEN5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iwok3QbEseGCAzZv/NpfmCf+kzdors8WVO29WyIYpxo=;
 b=GagsqOEaTSUB3xiL5GX1wGGOTVdIhRBKH3Go2qHi9JpJ0xqkG+taRfCkq4qu52LfvIVRdYQo5x0pinBUu61Nhpq0Gzf2blir6TzsStpbrLeAj4BFfuwJc6nkKU+0xadhcXgRSjeCw4FaKKcIwwPihVU1pPUk6rGwEBtkG+qshcQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7617.apcprd03.prod.outlook.com (2603:1096:400:42b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 07:05:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Tue, 24 Dec 2024
 07:05:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "arnd@kernel.org" <arnd@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "wenst@chromium.org"
 <wenst@chromium.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
Thread-Topic: [PATCH] drm/mediatek: stop selecting foreign drivers
Thread-Index: AQHbUSscNVhypo8O7kOny1bAnaNox7L1Ag6A
Date: Tue, 24 Dec 2024 07:05:24 +0000
Message-ID: <208e9a0453d38b081309eca4b9feda013436dc1f.camel@mediatek.com>
References: <20241218085837.2670434-1-arnd@kernel.org>
In-Reply-To: <20241218085837.2670434-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7617:EE_
x-ms-office365-filtering-correlation-id: 20d90409-e156-468e-de56-08dd23e956c3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?REtJd0FPMzNvZC9wNHZxeE53MnhyVUtaQSs2MG9wSS95eFFmQ24zYjRyYzV0?=
 =?utf-8?B?RjBtWFFOVENydGtXUVltSHArSC93U29QdC9nWjZqa1k5MUdncFIvbmhNRW5U?=
 =?utf-8?B?QU9XYmV6Q2pERTVsMDcxSmF2clZnZ1RPSWRTRFlwcEJkRCtBRnZJTFdxSzJ1?=
 =?utf-8?B?c0oxRW4xNjF1V3B3Q0ZoVWxFK0ppdmh1c0tGMXA5WDZROEtGRFhUUzJObmda?=
 =?utf-8?B?Q1Bvd1Z2bUlxYVZ4VDUzenFIcndWZTEzL2g3NnhqVzJoQ0E3cWVoZ3U1YlpS?=
 =?utf-8?B?NGVIcVljRUlDd3NoVWE3ckkxZWxmS2VnU2tnbWZyY3ppeE96MFB3SFVjR2hY?=
 =?utf-8?B?K2tMRFUrVGNHT05sVnJ4NDNIcnlrSW0xNDFTZm1iY29MVGRVYUp3V0tVQmhz?=
 =?utf-8?B?K0luUUZpRG41ZVJ4NGVncG5NcmJsTWh3cU0rMkVNTDQyRVE2WUtwR09JckZh?=
 =?utf-8?B?NTVnekVFSlNGMHJLdzh1N1lSYkJqb1pqOUtRazdBcjFBWjRMS0E4bkNIc3N5?=
 =?utf-8?B?ZzNFdUdIQmxzazV3aGJwdGFOYzN4MGZpVDVQRXVQbVJpSjY4dDNjWStjeEQx?=
 =?utf-8?B?bkNwNFNsWXNrblRTVkJGQ3M1OUpnZHFZeFYzU0sxNHdFSFhnczBwSjlZT1RB?=
 =?utf-8?B?NFN0T0FqdDd4MUNaVWdTejFXcU41bittS2cvNFRXaVBNSUt2L2pqS25BVExW?=
 =?utf-8?B?NC9KbVlWWTVibmxSajd5U0FYR2VlaUdBMmtMWXRuT0dPM2drVkducDdWcHo3?=
 =?utf-8?B?ZEw2bmVQRUtZS014WGtTUGJTc2FkaTlkbTZOZkliT0tSc1daMnptTmlDNnB0?=
 =?utf-8?B?V0Y1Z1VrTkVJZEhseENqL0ZVYUwvNjZ3QUdiWXZHMWV0bkVtbHVCbGNtRWl2?=
 =?utf-8?B?TW1nZnpUKzNBMktVWGR2aC9Xd3hqOWczdDJQQkFFdVVudlBlL2pUbE80R1VE?=
 =?utf-8?B?MHNEQ1diZm9QcjNKZUdGWDlHTDBtTHNXRjhUbFVwUTFtR0FaMjY1bVZxNWlB?=
 =?utf-8?B?eGVncHk5K1o3L0V1LzZJbnMySkxjY2E2azhrcWxMdmcrcEc3QjUrbzhhSWlG?=
 =?utf-8?B?MWw0eDBqVmxZSlhua0RwSC9xTTI5WTRicUxEamwzdFhiK2JveU11OXBRNHA3?=
 =?utf-8?B?cW9tRW1DUVlFQmdjcjRpU2Z0aUkyZmF4amZpb0JSemFoMUdsZWQ0dHFTQ2Nu?=
 =?utf-8?B?UWIxVUJwdEFFNkpzZWJHdUYrWnNEL2pUTkhEeEpKK0kvNFMyTEhBQlNGei9B?=
 =?utf-8?B?OVAzTVhTZjJ6TVhWOFZFM2ZLSG8xSUlNazVQelBvenRpNExTeGpxdkxMcGhn?=
 =?utf-8?B?RytTblhYNzdHLzVZMDhHSmZ5blErMmVGTHNubzhXSDZtdHVjbFZIWnZ3MTNT?=
 =?utf-8?B?ZzlZck9zUTRKQ2NwLzFKZmplQjYzUjRPeVllYVRid3lmOXZzZ244NWtHbU5Z?=
 =?utf-8?B?ZXVjT1UxNDNKVUY4aGU2TFA3ZlpzZ3E0ZjhPNXRnbitHVlVMQXlqbkVLN3d3?=
 =?utf-8?B?K0F2YzgwQ1EwaFlVdEZ0MC9JajBZWVlqRFJkUXVrV09obUVYTENkbW9GM1hm?=
 =?utf-8?B?Y210SXlHQkhZc0FFckd1SWFiaFBXdnFiUkpCRE00T0RxTERqOTBFT3h0Y3ds?=
 =?utf-8?B?OUE0aGErdmlYRmVTaVpPQk9FclFSMkM2b2dPTlNRN3hsTTBPQ1VqV2ZmUTB3?=
 =?utf-8?B?WEowNm01ckdCRkpSeFNzK0xuaEZrOW5DcWFXVVE3MzhrblJFNldUOUMrV3c1?=
 =?utf-8?B?S2Iwbzd6K3BPRVlkcU15STFqY29lcVVPdzhKc1Y3MHdkQU9Ga2pORjBZa0lW?=
 =?utf-8?B?ektxR1AzcHMzSXFJOHcxTzBzYlFnR0hGY3JyRUp3SGRWdmNiV0RzTjByd1ZN?=
 =?utf-8?B?MEdHQ0NMUkQzVGYrL25Id0Y4M1pqZkFablU2RFhTYlVOUURqbmlBcFVjK09H?=
 =?utf-8?Q?JJXb7yp9T6cLBeT0a2wpGtdVq1K0KM/R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmxDdnlDdnZIZDZWRWJ3R003WHZoRlpGT2ZhSWtQWllxYStnaXMzQW9SNkp6?=
 =?utf-8?B?WXFLYWVHSlhKc2lPZEdvenppVDliZ2kyZXBocWxwalRhNzFjMkptV3JDeWxh?=
 =?utf-8?B?S3prUE9jcSsxUEpsMTVCUEVuUk5EcWNHNEJSeXd5U3Q4YVRjdTU1anY3dlJz?=
 =?utf-8?B?Qnk2STBxTFpnWEpYM1JwWVhWZTJYaENwU1NRY1NXYVNtUlltZlpCYk1Nenoz?=
 =?utf-8?B?b09CTmxzTU9lenNYU3pHRFlodkIyOCsrWlliK0lMTWdEcWtKV1NrWU5ISStv?=
 =?utf-8?B?eDUyeVFLdFVZVFpWcXJVWjdqaE5Xei82Ly9nVXZkSVR1ZDZuVnYvQ0IxWXZO?=
 =?utf-8?B?UlY5SmlWUmdvNC9ERjhTZUJackVmSHFSYkd3cHoyblNhWEMzUFc1a1JMcFk0?=
 =?utf-8?B?UDNFZjFnQ0FUQkZzbFlEVFZ0dkxkNjlnd1MxZTRBN1ZEWWZ6WXV6cWRJU1dR?=
 =?utf-8?B?MnFiTTJBakwyN3pRR2RuTzVjMVNiNG1VUkpIZ2duTjk1azZDTGdwWVRQQ0NF?=
 =?utf-8?B?YWV6bkNIcU9HOHF0amlPNGJGaVBYYmpSZWp0OThqQzRGUnh6WU90eno2VU9p?=
 =?utf-8?B?bGpIdEpUc2hJWFIwajE1WlVVd2FCVlo3WGgvMWNHNmV3ZHhIQStYelBkeFZp?=
 =?utf-8?B?WDIzbFRzMEt2TkVwU1gvcjhub2tsam5nNkVHaE1sdXVodzhIY0VpMGtKcXZr?=
 =?utf-8?B?VVg5ejVDSmlYTEx2YVM0b09BN0VUSldtclZEUnZyVHhycjBOUll2UThQV050?=
 =?utf-8?B?WlEzS29lWVNtVUNaa3JqanhLV3p2cjdxbXkwMk9rNWgyaUlkNWhuK2hQLzFj?=
 =?utf-8?B?a1ZTSWNiZFpqTjQ4TTkvYlNUdk1sbTVNSFhjUFJtc3Z3dmNja0dpOGoxaHha?=
 =?utf-8?B?N3Q3dXZHVnZDMGg5VXhWSjVMR0ZaU2J5cE5YdlFqc25sUEpGUEc5cllkcW5F?=
 =?utf-8?B?a1pBdTBsWTVyZUZRdFM3Q1hXMzFmTHdtZkErY2FPRlI0bHNXYmRKQVNNVkcz?=
 =?utf-8?B?TzI1eEVHK0t6aXdibVViL0ZLaGVSMWl3NzBDZDZnVXhITEJNQ3lJYmRsWDBl?=
 =?utf-8?B?V1JOL1A3eExXaFl5M2xGRmJWQzRFN29uTW04QzJnMkhTeVBGTlZveFA4STkz?=
 =?utf-8?B?cWsyMW5VMllWUitrNHNVNXMyRUtqbzViZm90OFp1NGxZdWE2YXBnelZSWHpS?=
 =?utf-8?B?R215MzdFWXlBdml3VTBLTHlNMXJwTUp6WGVxRWkyc2tKOHZ4VlE3bC9BV3c0?=
 =?utf-8?B?U1Q5ZHZSK1NLaVZLeUpwdExtVVNXZzZJUFNiVkRUeGRoSnFldll6VjhyYXY2?=
 =?utf-8?B?MHZ5c2FSRktNa1BLRUlDL3hGR3UzY085T2lxY2x1YmN2ZHB2ZjNRTXk5aVdT?=
 =?utf-8?B?SFZMUGhtTWVONU9qcWZ6eTFxdHBiMDd0aDV2WWN4RkdhbmxvRnV6NUV5U1B1?=
 =?utf-8?B?ODVNOWVaQlU0b1lGdytNVXoyTXZXSzMrTzZLQm9PczB3N0dKWVBpWjMzSHdv?=
 =?utf-8?B?T1QzQ3ZMd3BnOXVzSnpMWGJBVEJ5TEtrdnRtYllzZzNXR1laaTdGUnFJRFc1?=
 =?utf-8?B?VXlmQTBsSHV4aEpaeDZmL0RvVGx0a0hrN1IwNE9hNTIzVnFTN2ZGZHBQVGUy?=
 =?utf-8?B?RDlEazB3SDdFb0JVT1lxRGg0Yk8wakpaTjBRNysrdmZxbmw2N1BwUlo3M1px?=
 =?utf-8?B?VFJoSzczaFhnSmwwb2ZyaVgwQTljclNBNzUzWVRSOE1uNngzaDUyY001YWRl?=
 =?utf-8?B?WmpXRW5yVTFKMWJzV1dTb0VSK2hxRHFFU3hud3RHeTY2endhem5wMkdzL0Nj?=
 =?utf-8?B?NjM0a2ttWFdJTjcrVXNhMTVZUHpQakk1QTYvSUNDTVhscWp0SW9OM044MGg1?=
 =?utf-8?B?YXRIMXg2aDFMcHJab3hwZVZoNUJSa3V3ajM5SXVsUWFCQm5ZVjZ2bWxhWWt1?=
 =?utf-8?B?SmUvSHc4REpici9ENzlLdVJQRGVuTWQ1YXc1TzN3eU1NdjhQMnc1NmRYVDJX?=
 =?utf-8?B?S1JieGQ4VFAvVGNYYVZ2MDR3aGlBMDlpQjNPYjZHNWdSVVp5bENqcS9PaWty?=
 =?utf-8?B?Q2pja2tpOWNiOGt4S2Zvak9NUG85aGJTaldndXhKNmkxVUdBQWJYVUIvMFgw?=
 =?utf-8?Q?UH00a/0ICor+lrLuiafW6nrAf?=
Content-ID: <E92F6D0E698BFE4D9C0B84B2F6278B95@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d90409-e156-468e-de56-08dd23e956c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 07:05:24.5892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yIBSppCaUA2VB19Smcnh7g4K6GxftH3H4AhjbYLSPIXhVD98esyd9SL3Ow7+hX855Ke3CtAam5h6DL2Ydjq4FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7617
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_973451862.552199466"
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

--__=_Part_Boundary_004_973451862.552199466
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFybmQ6DQoNCk9uIFdlZCwgMjAyNC0xMi0xOCBhdCAwOTo1OCArMDEwMCwgQXJuZCBCZXJn
bWFubiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPg0KPiANCj4gVGhlIFBIWSBwb3J0aW9uIG9mIHRoZSBtZWRpYXRlayBoZG1pIGRyaXZlciB3
YXMgb3JpZ2luYWxseSBwYXJ0IG9mDQo+IHRoZSBkcml2ZXIgaXQgc2VsZiBhbmQgbGF0ZXIgc3Bs
aXQgb3V0IGludG8gZHJpdmVycy9waHksIHdoaWNoIGENCj4gJ3NlbGVjdCcgdG8ga2VlcCB0aGUg
cHJpb3IgYmVoYXZpb3IuDQo+IA0KPiBIb3dldmVyLCB0aGlzIGxlYWRzIHRvIGJ1aWxkIGZhaWx1
cmVzIHdoZW4gdGhlIFBIWSBkcml2ZXIgY2Fubm90DQo+IGJlIGJ1aWx0Og0KPiANCj4gV0FSTklO
RzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgUEhZX01US19IRE1JDQo+
ICAgRGVwZW5kcyBvbiBbbl06IChBUkNIX01FRElBVEVLIHx8IENPTVBJTEVfVEVTVCBbPXldKSAm
JiBDT01NT05fQ0xLIFs9eV0gJiYgT0YgWz15XSAmJiBSRUdVTEFUT1IgWz1uXQ0KPiAgIFNlbGVj
dGVkIGJ5IFttXToNCj4gICAtIERSTV9NRURJQVRFS19IRE1JIFs9bV0gJiYgSEFTX0lPTUVNIFs9
eV0gJiYgRFJNIFs9bV0gJiYgRFJNX01FRElBVEVLIFs9bV0NCj4gRVJST1I6IG1vZHBvc3Q6ICJk
ZXZtX3JlZ3VsYXRvcl9yZWdpc3RlciIgW2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRt
aS1kcnYua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJyZGV2X2dldF9kcnZkYXRh
IiBbZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLWRydi5rb10gdW5kZWZpbmVkIQ0K
PiANCj4gVGhlIGJlc3Qgb3B0aW9uIGhlcmUgaXMgdG8ganVzdCBub3Qgc2VsZWN0IHRoZSBwaHkg
ZHJpdmVyIGFuZCBsZWF2ZSB0aGF0DQo+IHVwIHRvIHRoZSBkZWZjb25maWcuIERvIHRoZSBzYW1l
IGZvciB0aGUgb3RoZXIgUEhZIGFuZCBtZW1vcnkgZHJpdmVycw0KPiBzZWxlY3RlZCBoZXJlIGFz
IHdlbGwgZm9yIGNvbnNpc3RlbmN5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IGE0ODFiZjJmMGNhNCAoImRybS9tZWRpYXRlazogU2Vw
YXJhdGUgbXRrX2hkbWlfcGh5IHRvIGFuIGluZGVwZW5kZW50IG1vZHVsZSIpDQo+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL0tjb25maWcgfCA1IC0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
S2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+IGluZGV4IDFjMmY1
NmI3NTcxNi4uMWQ0ZjIwYTRmMjY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0K
PiBAQCAtMTUsOSArMTUsNiBAQCBjb25maWcgRFJNX01FRElBVEVLDQo+ICAgICAgICAgc2VsZWN0
IERSTV9CUklER0VfQ09OTkVDVE9SDQo+ICAgICAgICAgc2VsZWN0IERSTV9NSVBJX0RTSQ0KPiAg
ICAgICAgIHNlbGVjdCBEUk1fUEFORUwNCj4gLSAgICAgICBzZWxlY3QgTUVNT1JZDQo+IC0gICAg
ICAgc2VsZWN0IE1US19TTUkNCj4gLSAgICAgICBzZWxlY3QgUEhZX01US19NSVBJX0RTSQ0KPiAg
ICAgICAgIHNlbGVjdCBWSURFT01PREVfSEVMUEVSUw0KPiAgICAgICAgIGhlbHANCj4gICAgICAg
ICAgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhIE1lZGlhdGVrIFNvQ3MuDQo+IEBA
IC0yOCw3ICsyNSw2IEBAIGNvbmZpZyBEUk1fTUVESUFURUsNCj4gIGNvbmZpZyBEUk1fTUVESUFU
RUtfRFANCj4gICAgICAgICB0cmlzdGF0ZSAiRFJNIERQVFggU3VwcG9ydCBmb3IgTWVkaWFUZWsg
U29DcyINCj4gICAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRFSw0KPiAtICAgICAgIHNlbGVj
dCBQSFlfTVRLX0RQDQo+ICAgICAgICAgc2VsZWN0IERSTV9ESVNQTEFZX0hFTFBFUg0KPiAgICAg
ICAgIHNlbGVjdCBEUk1fRElTUExBWV9EUF9IRUxQRVINCj4gICAgICAgICBzZWxlY3QgRFJNX0RJ
U1BMQVlfRFBfQVVYX0JVUw0KPiBAQCAtMzksNiArMzUsNSBAQCBjb25maWcgRFJNX01FRElBVEVL
X0hETUkNCj4gICAgICAgICB0cmlzdGF0ZSAiRFJNIEhETUkgU3VwcG9ydCBmb3IgTWVkaWF0ZWsg
U29DcyINCj4gICAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRFSw0KPiAgICAgICAgIHNlbGVj
dCBTTkRfU09DX0hETUlfQ09ERUMgaWYgU05EX1NPQw0KPiAtICAgICAgIHNlbGVjdCBQSFlfTVRL
X0hETUkNCj4gICAgICAgICBoZWxwDQo+ICAgICAgICAgICBEUk0vS01TIEhETUkgZHJpdmVyIGZv
ciBNZWRpYXRlayBTb0NzDQo+IC0tDQo+IDIuMzkuNQ0KPiANCg0K

--__=_Part_Boundary_004_973451862.552199466
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBcm5kOg0KDQpPbiYjMzI7V2VkLCYjMzI7
MjAyNC0xMi0xOCYjMzI7YXQmIzMyOzA5OjU4JiMzMjsrMDEwMCwmIzMyO0FybmQmIzMyO0Jlcmdt
YW5uJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0Zyb206JiMzMjtBcm5kJiMzMjtCZXJnbWFubiYjMzI7Jmx0O2Fy
bmRAYXJuZGIuZGUmZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoZSYjMzI7UEhZJiMzMjtwb3J0
aW9uJiMzMjtvZiYjMzI7dGhlJiMzMjttZWRpYXRlayYjMzI7aGRtaSYjMzI7ZHJpdmVyJiMzMjt3
YXMmIzMyO29yaWdpbmFsbHkmIzMyO3BhcnQmIzMyO29mDQomZ3Q7JiMzMjt0aGUmIzMyO2RyaXZl
ciYjMzI7aXQmIzMyO3NlbGYmIzMyO2FuZCYjMzI7bGF0ZXImIzMyO3NwbGl0JiMzMjtvdXQmIzMy
O2ludG8mIzMyO2RyaXZlcnMvcGh5LCYjMzI7d2hpY2gmIzMyO2ENCiZndDsmIzMyOyYjMzk7c2Vs
ZWN0JiMzOTsmIzMyO3RvJiMzMjtrZWVwJiMzMjt0aGUmIzMyO3ByaW9yJiMzMjtiZWhhdmlvci4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7SG93ZXZlciwmIzMyO3RoaXMmIzMyO2xlYWRzJiMzMjt0byYj
MzI7YnVpbGQmIzMyO2ZhaWx1cmVzJiMzMjt3aGVuJiMzMjt0aGUmIzMyO1BIWSYjMzI7ZHJpdmVy
JiMzMjtjYW5ub3QNCiZndDsmIzMyO2JlJiMzMjtidWlsdDoNCiZndDsmIzMyOw0KJmd0OyYjMzI7
V0FSTklORzomIzMyO3VubWV0JiMzMjtkaXJlY3QmIzMyO2RlcGVuZGVuY2llcyYjMzI7ZGV0ZWN0
ZWQmIzMyO2ZvciYjMzI7UEhZX01US19IRE1JDQomZ3Q7JiMzMjsmIzMyOyYjMzI7RGVwZW5kcyYj
MzI7b24mIzMyO1tuXTomIzMyOyhBUkNIX01FRElBVEVLJiMzMjt8fCYjMzI7Q09NUElMRV9URVNU
JiMzMjtbPXldKSYjMzI7JmFtcDsmYW1wOyYjMzI7Q09NTU9OX0NMSyYjMzI7Wz15XSYjMzI7JmFt
cDsmYW1wOyYjMzI7T0YmIzMyO1s9eV0mIzMyOyZhbXA7JmFtcDsmIzMyO1JFR1VMQVRPUiYjMzI7
Wz1uXQ0KJmd0OyYjMzI7JiMzMjsmIzMyO1NlbGVjdGVkJiMzMjtieSYjMzI7W21dOg0KJmd0OyYj
MzI7JiMzMjsmIzMyOy0mIzMyO0RSTV9NRURJQVRFS19IRE1JJiMzMjtbPW1dJiMzMjsmYW1wOyZh
bXA7JiMzMjtIQVNfSU9NRU0mIzMyO1s9eV0mIzMyOyZhbXA7JmFtcDsmIzMyO0RSTSYjMzI7Wz1t
XSYjMzI7JmFtcDsmYW1wOyYjMzI7RFJNX01FRElBVEVLJiMzMjtbPW1dDQomZ3Q7JiMzMjtFUlJP
UjomIzMyO21vZHBvc3Q6JiMzMjsmcXVvdDtkZXZtX3JlZ3VsYXRvcl9yZWdpc3RlciZxdW90OyYj
MzI7W2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1kcnYua29dJiMzMjt1bmRlZmlu
ZWQhDQomZ3Q7JiMzMjtFUlJPUjomIzMyO21vZHBvc3Q6JiMzMjsmcXVvdDtyZGV2X2dldF9kcnZk
YXRhJnF1b3Q7JiMzMjtbZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLWRydi5rb10m
IzMyO3VuZGVmaW5lZCENCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlJiMzMjtiZXN0JiMzMjtvcHRp
b24mIzMyO2hlcmUmIzMyO2lzJiMzMjt0byYjMzI7anVzdCYjMzI7bm90JiMzMjtzZWxlY3QmIzMy
O3RoZSYjMzI7cGh5JiMzMjtkcml2ZXImIzMyO2FuZCYjMzI7bGVhdmUmIzMyO3RoYXQNCiZndDsm
IzMyO3VwJiMzMjt0byYjMzI7dGhlJiMzMjtkZWZjb25maWcuJiMzMjtEbyYjMzI7dGhlJiMzMjtz
YW1lJiMzMjtmb3ImIzMyO3RoZSYjMzI7b3RoZXImIzMyO1BIWSYjMzI7YW5kJiMzMjttZW1vcnkm
IzMyO2RyaXZlcnMNCiZndDsmIzMyO3NlbGVjdGVkJiMzMjtoZXJlJiMzMjthcyYjMzI7d2VsbCYj
MzI7Zm9yJiMzMjtjb25zaXN0ZW5jeS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMy
OyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Rml4ZXM6
JiMzMjthNDgxYmYyZjBjYTQmIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtTZXBhcmF0ZSYj
MzI7bXRrX2hkbWlfcGh5JiMzMjt0byYjMzI7YW4mIzMyO2luZGVwZW5kZW50JiMzMjttb2R1bGUm
cXVvdDspDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QXJuZCYjMzI7QmVyZ21hbm4mIzMy
OyZsdDthcm5kQGFybmRiLmRlJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnJiMzMjt8JiMzMjs1JiMzMjstLS0tLQ0KJmd0OyYj
MzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NSYjMzI7ZGVsZXRpb25zKC0pDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9LY29uZmlnJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQom
Z3Q7JiMzMjtpbmRleCYjMzI7MWMyZjU2Yjc1NzE2Li4xZDRmMjBhNGYyNjUmIzMyOzEwMDY0NA0K
Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQomZ3Q7
JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcNCiZndDsmIzMy
O0BAJiMzMjstMTUsOSYjMzI7KzE1LDYmIzMyO0BAJiMzMjtjb25maWcmIzMyO0RSTV9NRURJQVRF
Sw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3NlbGVj
dCYjMzI7RFJNX0JSSURHRV9DT05ORUNUT1INCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtzZWxlY3QmIzMyO0RSTV9NSVBJX0RTSQ0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3NlbGVjdCYjMzI7RFJNX1BBTkVM
DQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzZWxlY3QmIzMy
O01FTU9SWQ0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c2Vs
ZWN0JiMzMjtNVEtfU01JDQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtzZWxlY3QmIzMyO1BIWV9NVEtfTUlQSV9EU0kNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzZWxlY3QmIzMyO1ZJREVPTU9ERV9IRUxQRVJTDQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGVscA0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtD
aG9vc2UmIzMyO3RoaXMmIzMyO29wdGlvbiYjMzI7aWYmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7YSYj
MzI7TWVkaWF0ZWsmIzMyO1NvQ3MuDQomZ3Q7JiMzMjtAQCYjMzI7LTI4LDcmIzMyOysyNSw2JiMz
MjtAQCYjMzI7Y29uZmlnJiMzMjtEUk1fTUVESUFURUsNCiZndDsmIzMyOyYjMzI7Y29uZmlnJiMz
MjtEUk1fTUVESUFURUtfRFANCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjt0cmlzdGF0ZSYjMzI7JnF1b3Q7RFJNJiMzMjtEUFRYJiMzMjtTdXBwb3J0JiMz
Mjtmb3ImIzMyO01lZGlhVGVrJiMzMjtTb0NzJnF1b3Q7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGVwZW5kcyYjMzI7b24mIzMyO0RSTV9NRURJQVRF
Sw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c2VsZWN0JiMz
MjtQSFlfTVRLX0RQDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7c2VsZWN0JiMzMjtEUk1fRElTUExBWV9IRUxQRVINCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzZWxlY3QmIzMyO0RSTV9ESVNQTEFZX0RQX0hF
TFBFUg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3Nl
bGVjdCYjMzI7RFJNX0RJU1BMQVlfRFBfQVVYX0JVUw0KJmd0OyYjMzI7QEAmIzMyOy0zOSw2JiMz
MjsrMzUsNSYjMzI7QEAmIzMyO2NvbmZpZyYjMzI7RFJNX01FRElBVEVLX0hETUkNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt0cmlzdGF0ZSYjMzI7JnF1
b3Q7RFJNJiMzMjtIRE1JJiMzMjtTdXBwb3J0JiMzMjtmb3ImIzMyO01lZGlhdGVrJiMzMjtTb0Nz
JnF1b3Q7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
ZGVwZW5kcyYjMzI7b24mIzMyO0RSTV9NRURJQVRFSw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3NlbGVjdCYjMzI7U05EX1NPQ19IRE1JX0NPREVDJiMz
MjtpZiYjMzI7U05EX1NPQw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7c2VsZWN0JiMzMjtQSFlfTVRLX0hETUkNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZWxwDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO0RSTS9LTVMmIzMyO0hETUkmIzMyO2RyaXZl
ciYjMzI7Zm9yJiMzMjtNZWRpYXRlayYjMzI7U29Dcw0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIu
MzkuNQ0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5
IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0K
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWlu
aW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50
cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQg
bWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBv
ZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlz
IGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkg
KGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBv
ZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lz
dGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBh
bnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_973451862.552199466--

