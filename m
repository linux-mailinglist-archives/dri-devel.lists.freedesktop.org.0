Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ODrNU5ggWnfFwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:41:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21FD3D25
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FE010E30D;
	Tue,  3 Feb 2026 02:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bLCFFV16";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YU+ocb8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B86810E30D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 02:41:12 +0000 (UTC)
X-UUID: caccea0e00a911f1b7fc4fdb8733b2bc-20260203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ZbglJDmB4IB0aZyd2VBkPcJb1FuLd7UjHZuIt5euwnw=; 
 b=bLCFFV16E1v7KkNxg8pOME2Un0V4/lASBoifco7kkMlzOrFoDPzo0691hwprZ6XKuPaL6SaXI1crjGSoC7uajpBLpFl5cJJbncVmBqtofdSXBHgzL9lnTKPdTtwk4cG21jrugMUUsPMogrvpzheA8GMqhaTqi5togrAT2noB6P4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:7f88fd4d-d5ec-4ef0-a905-b87aa5436601, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:495b3de9-ef90-4382-9c6f-55f2a0689a6b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: caccea0e00a911f1b7fc4fdb8733b2bc-20260203
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 294282228; Tue, 03 Feb 2026 10:41:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 10:41:06 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 10:41:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nouyV2EI363qpfDu6wpgS4Q8H2ULY07B7QJ3aculwTgtg98VBprGdV+iqpZptXq0AhilQddbDpkKXnQ7vvSFEepA1qhEvm6Qmh+MmEb7tQHEi0ESPtT9KHDBry5r6jkOJa/v+0IhKY49WRCH4RlbnWYQU9YIAYg5obtmH9vhSsrck4dHPAVtUfRWvjBGC8LJev97A7C94BKp6B51CEWuCtg9FJhuucLEWcgUD0XJxvSJAAuDJpve3fxwLSlcAKh7//jtTDy34gZDYbqpWFPoJKFLgbzFEtsGrX8xddvlvqhri7u6NzVbFFbmi1fRBkNj5MlJyJYdvk2i+EhCBJDM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9iMHr+lZf3yD7Ev9J9FiTn2v3G7q9CLX/I+u5fT+Qk=;
 b=rS9EP7G/TpqPtpWtmwmDxuUlqcLlpE1UdEvP1RAZeBFaUy0aOyn0y08T4H+cj3M0i/OiLVCl6NvaojQBbb8kDGKiIxol9MlAp3r5rD7bTCXeFbhhFDL/xsbDSHCavF6468bS+bnArbX6eM3Knqgzwn3TfGj894PQYIhp26DtGQ9RpImkJDHfQM48pA/mAIDpu0xCQaajP+E3LIJKoiOIWhRXkWMx7zT2NM0z9xV8+Zc2zHv1Z4tc/7qyVffcUiEPwymOVT7aNg4sYYHeb8lKw0MzaVbThgHa4541O6zm7+h+gM1gs3QCgAliUCOIS8XZrzMHI6gNu+6fiqUgJm43MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9iMHr+lZf3yD7Ev9J9FiTn2v3G7q9CLX/I+u5fT+Qk=;
 b=YU+ocb8NHFF/hD8t0x37p+S2zFDcx24JS4Al+54BSp6Frnb+LT2XAVn18zAQDUhB2yeRaX7CkwIPjAgZADimEmvhgji7F24C9YTX3xydkTrsot/m1vXyg8VTMxcveNyEwuEcqr4OvBO8VntecfiHMrMMu4XE+vyNIRYj7LvmN28=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6759.apcprd03.prod.outlook.com (2603:1096:4:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:41:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:41:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 5/6] drm/mediatek: ovl: Disable AFBC on MT8188
Thread-Topic: [PATCH RFC 5/6] drm/mediatek: ovl: Disable AFBC on MT8188
Thread-Index: AQHceZU3KTSKZ2bJXEWHUfPU58aFh7VweeaA
Date: Tue, 3 Feb 2026 02:41:03 +0000
Message-ID: <f9900cc0bd27a77acf37a9a6f733d55fa8915a3d.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
 <20251230-mtk-afbc-fixes-v1-5-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-5-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6759:EE_
x-ms-office365-filtering-correlation-id: d495dcf2-04e5-4c0f-741d-08de62cdac75
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|42112799006|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bHNoeHZtOFNmYkZNUi9QdkRremIrYlVZeGwycjQ0SlZmeUtjU1U4UHdYbUIw?=
 =?utf-8?B?c3hkbnRvc3dqcG1Id3c4My9zZkJQaHFRTkVFa1BYS1RFOXIySFlKMW83cWsx?=
 =?utf-8?B?R2pTMDRrM1Z5eUdUUVFXNXp6YTlBOFk2NGp6SXo1VXVWUUdJVXNIYTJ6Z0xi?=
 =?utf-8?B?cHk4cmU0dXVpWTlZZjlaVFBFcGZFRksvc0ZPRUZ6cFd3eU1Oc0dlTW81RXhW?=
 =?utf-8?B?QTM5NlpVNDhQTjEvVEhtU3hqUXV0NmJZc3A0bUhOcWZkdWlOTXdYRkRuRFk4?=
 =?utf-8?B?Q3FUVEZYMjlyU3RCd2RPTC9HVEd2WUFKMHl5ZVdxR3pYS3JlckRROHZjcVo0?=
 =?utf-8?B?VnFrWEp2dDZSUE9WZnJsVUp5OGdZWW9SZzk2b0laUDArVDdvZldTR0h5dDhL?=
 =?utf-8?B?L3NJV1d6TElKZXZPbzlXWjl0T3ZYM2Nkb3psWG81R2l5b09vYzh4TG54R0c1?=
 =?utf-8?B?Mi9pWk95RFBVc3g2K1BHTXVsWngxb0tjZHYyRlZ1T3VWMm5VUlJRLzJXVmhq?=
 =?utf-8?B?NXFoakxsNEJ0dCtwVjQ4aHF1MEs4eGNlekI1KzlTMlByN2RmNy9pL3pTVHlL?=
 =?utf-8?B?WjAyRjQwK3haZlVvbGRKdXRjTFhBOGs0ZUlXRG52MnRCcWxVemY5eTFCalpX?=
 =?utf-8?B?aEkyOHhuVFh2ZjgyaWU4cWVLdllOY1kxK0JBUDV4QUdvZGVSWEFWTVM1YXc3?=
 =?utf-8?B?UWFtd3RYVVoySXc5TmpMdmMvK1hSQW5Nanh0WnB2bzVXVjhKVzF6bXhiRnRL?=
 =?utf-8?B?L3hHdzVXN3B6TmZydGk0OXNPQ2ZlcmtaUTJGQTV0andsSFRNRlBWWHIxcG9P?=
 =?utf-8?B?N2tOc0VoYms1VDZXOGFpL2h4OEdES3BQUmw1NkJPOWNsNUdyYjZlTXNWOGQ1?=
 =?utf-8?B?MmlJTnFQRndSYkJmdjFWQnBhRjhUY0RlQzhHMmNuREszUVVnMlE4OFRhOXN4?=
 =?utf-8?B?eVpUaVNkNVhWcHgwWmRpUFhIK3hRbHJEOUJEZU1wVW1CdFZiQUJiMnhuT3Yv?=
 =?utf-8?B?Uk5EMWJtemZHMENJaWwzdk1FTVpqNkVqQjdJOHIySUN1a1ZaSFpoWFZtTkNv?=
 =?utf-8?B?ckhEWnoxakFpQ1Z3cm4xR01FTjFmQXJaUEJ4dVNWZTd0U2xSaEhFQ1RlTjl1?=
 =?utf-8?B?eHc2OXFFUHN0QS9Ydm9YbjhYMU5mY0dVS0t2eWVET0p1NFVYL1BkQ3BXWWo2?=
 =?utf-8?B?TDJxQTlIU1FFSElNc1VlZnpaZWRvcThoNjFJVHloMUNUa0RTSXoxU3Z2NHhx?=
 =?utf-8?B?ZitKZUJUaGovTGQ5dnd2ZThUMXFyd2k1S2hKelp5SThYd0RZeW9URnljTXFR?=
 =?utf-8?B?VUlldThlbWJuS2lvSXJuc0UwbmxITnFXRUQ2anFiRFIrZVZWWlE3SmNUSDcw?=
 =?utf-8?B?dWNXK09HZFVHUTR6eXdiZFA4VHh4aWY0RlV4RndvM1AvTUkvcnEyS1kwTzVj?=
 =?utf-8?B?NnN2eFk0VE0vNDhsSExCS2p2bmJpZnNPSmRISVFsVHFLMTB4Zk9rN0NSZDZr?=
 =?utf-8?B?Qm0rUmFVS0pzVmU0NnlINHhTeUsxZjZDOS9MbW1Gc2VPYjQzaWhOTFJFNFBV?=
 =?utf-8?B?RXBTZ0ZPd2lwR0pCYm1lYVVyZHFua2lVNDBGZGFLNEkwQkIzeXQxWTVYZm9w?=
 =?utf-8?B?eGJPMDZISmFKa25vSkdGVjgxVzUwWk1HMXRTLzJjVVRkNHV4Sk0wRkxnVW5C?=
 =?utf-8?B?TUVZQnl1WnhNbWhjQkFIVzdmZUF4Z2hEaGRtUFZSTjlDVFMxN2pLanlXVE9P?=
 =?utf-8?B?ZkNRVHZvMVJJWEZKN2VnaFpLc3RBWXhxVlBZRXlORy9xbUNMTzhZMlFRS3BO?=
 =?utf-8?B?SVZHUmMxaExCVkw5WFpnQm5Hb0UwN3FncHBIaTB6Z1BMVVNEdTBGeHFobHJI?=
 =?utf-8?B?SmRRK09KOGRwMGJ4WHl1ZUdnbzVxemwxeVZLd2JrblAxUXNtclFNVGViLzhN?=
 =?utf-8?B?Y29SNDQwU3lHVE1NZWxXeHB5eTZ0czh2emJQdm50Qm5ydXhmVzNudU1yTTBS?=
 =?utf-8?B?VGZhUnU4R0dhTWh3bjRKMWRwQndlazFkYkRaV0EvWHVjS0xWSmExK3d4bUZK?=
 =?utf-8?B?eDM5b3hYdWd0Q2s5cXBlYk5UdU4vWHhBRnFqYmIzcUNxUllTVDViS2lxTjZ5?=
 =?utf-8?B?L3FvWlVSVnh6OS9zamdjOEVRaThlWm5QS3hVanpFTkMyVUI4WHg2SXZPZ1A3?=
 =?utf-8?Q?v44fg+J3pq7hw7L1cgI4SHk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(42112799006)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDkwcGExRklmWmFPbXp4YTNadUMzVWxwU3VLNk5WQWUrTEplbXJpY050NEc2?=
 =?utf-8?B?UmVxU3hub0pYM2xQSm4vMno3azhIWGVEVmIweUluSWh6Yk5paHhvYWJWa0pL?=
 =?utf-8?B?QmVhVlhHVnV4UWZmV3BqT2psL2ZmMzRDMjhvTjc4OUpJRHZYQllNdE4xQk1j?=
 =?utf-8?B?ait2NTRGaHU1N0ZzSmRSZ1FDOFlZWncxZWh4WGl0VmJ4eUFIWG9xRkdOMkpC?=
 =?utf-8?B?N2NadGFWK01oSUFHY09xMGN2cE9LZTZTNTFhVVNCVW1BMVZ4d3ZQdXZoWUdu?=
 =?utf-8?B?SU5uU2F0ai9JM2VqRkRYOGJ6U2ljZHRJenBNSzhiSFd1WmhvOXlvRHZwcW0y?=
 =?utf-8?B?WTgwazJKcXJvVCtZNFpvMU5kaFRlSzRkVmlFWU5TUnpUMnZiUXFGMWlBNHUv?=
 =?utf-8?B?ZEVCM0IwM1pNVU1ZQ0c3dEtIRGs3L1IyakpRUGpqN3NPeGt3VU5SZ3NlNTd2?=
 =?utf-8?B?WkZJN3h5bVhwb3RzZ1I5STd1Zzk1dzh6NmE4WU1leEVBa1UxZWlUN3djVWRk?=
 =?utf-8?B?dWNNSnJiR0NyVHRKcDBWV2V3Q3NtM1c1MDhTb0lsTVM5RzcvUkk1L0xJa3pk?=
 =?utf-8?B?bnByU283S25WakdOMG5UMFp1cVZjQndzenZLZFcrRnQyMnQwNSs3TWZTY09M?=
 =?utf-8?B?OEpNbDkrdENaVTIvQUxqcGd5bEVQNHQ5Mnh3RzVzQVFPZVpqeGlqTU1XMHlu?=
 =?utf-8?B?TGRDaXhHYlY3SGJXcHJ3VEd1c2gzbHVDTDM3Sm84V09jTHU2ckpvUkg2Y3B1?=
 =?utf-8?B?WnlXUDdFNjdsaUpqQ1hnQXFsQjBoTHBqbUsvZk03ZW12c0xSb1QyQ2pJN0tW?=
 =?utf-8?B?bURCTGNYR1hDR01yRTU1VFArZjZNVmhLUDJ3VWE5SkZ5OC82WXZTWEE1YmhS?=
 =?utf-8?B?QVRUd2NmV3ljbHo4SmRCZFp5YXFrQ3NzVjhJT3E1MmhmUy84RXBidFRwZWhJ?=
 =?utf-8?B?NUxMTURkZVJlamRXWlNSRTc5TUU0VHM2cmd6dHV3akhKT0pFOW9IaG9QNXdO?=
 =?utf-8?B?dldQdGQwd2oxazBLSlRUSWkwUTZSNjZhbTdEY1hFNTNvbzBIa2h5eWh5YUpv?=
 =?utf-8?B?ZnI4djZoMGMxOUUweEpzS3FRY3hDOG5NZ3pPRWVwNkR0WVdPR0pvZFhYbDBh?=
 =?utf-8?B?RFNORCtTSDUvNkhrd3g1S1RNUzVDdUJGMXdRamF0eGxpMUw1ZytyeURQai9M?=
 =?utf-8?B?Wm1MVTQ1Q1F2VFpvVW9Cdk9Wai81ZzlIQkxkWk5vb3VzWEdtYTdzeTUwUHBY?=
 =?utf-8?B?bmpoL2RTczNwTGc2cHVZcEdCZkdUcVBNSlNJUnlzY202TlE4V2EzYTIxMjJC?=
 =?utf-8?B?NWVNbElqd2lHVmtQaG1jTUhxNEVac0daOVBsMEROanRVUTF2VzVjSXR4MlZm?=
 =?utf-8?B?bGs3NkpCMEJZVW1GdUxNeHFZYU1Jemw2KzR5QlhMOFhKdkxwcWQzVmVJbDJq?=
 =?utf-8?B?NFBjVzhQL29BYVl5MEJ5T21pd1EzdVNKM0tYd092VEtDR1BZL1FLY3crNnR1?=
 =?utf-8?B?ejBiTHFGclp6ckt3OU45TUs5YnMzTnZEclUvbW5rK0VsSUREeEd1NFF1d1Iz?=
 =?utf-8?B?ZmNNQWc2RWRVb0xqS2dnbU9VNXJ6UjgrRVlQaTJYVGg2cEdyZUZBZ2QvVHJp?=
 =?utf-8?B?OVUrMFRHTkZFZnBQMjVJT25tQWU3YXAvVTUvYUtXNU5RUERwRTZqSm1VTUQ1?=
 =?utf-8?B?OHQ0Slk4OGVTdjVuQksxanBsYXZyM1c4d2RYV0MrRzg4S1RqUUhoc1kySFY5?=
 =?utf-8?B?b3hwcGd6Z1BEaVFTUjQwUE9wcDM4UGpld0YzdU5uQ1pneG5SZ2szSXZGWDVX?=
 =?utf-8?B?dXVydHZJMThGbGZRckJjemhRc29vYzVmSndTZktvODgzanJiWHBkTEx1SHpV?=
 =?utf-8?B?L0E1b1poSExYelQ1V0VEOGRKUWRoS1AvY25EanVOQ1VZTlpSU2srUlNwYmh4?=
 =?utf-8?B?VGNnL05Fa1pqQnh0VjJGTnlXTlRLeCtKeFQyRlNtMldjaUViMXFvb2k1ZTZ0?=
 =?utf-8?B?NERTaWIvUS9HZGlNblJUMlVzcXU2amVmRGZnQjRmQ3NwbFhJSXNVMDJzTjFn?=
 =?utf-8?B?OHRBTzJMM215WHMvOVJ4TnVHWUJoTkF0K2hMbVljOThLem5tMXFZdmhXRTFV?=
 =?utf-8?B?STFJaUZaTHJJU2NoZU0yekJlcDBZdnpIOURHMVdYdG1OQm9IWGUxT1A0YUR0?=
 =?utf-8?B?MmRaUFVKTFgya2NOZXI2Q1F1TitidnV0YkZvWHNYdEFod2ZOaWJPdGxOZFk1?=
 =?utf-8?B?N3hzTkdwUFBkRVNuRFY3ZnYvZFBtcjZmZGNjZXVIMTdSY0hyQWx6eFhaYjdH?=
 =?utf-8?B?eG4xQ0NObHphVkQ0TlIyUm52Y1BoMVdxeXJEZFNIWmJnM3FKN1pYQT09?=
Content-ID: <5F5619C3AC26B4419AD9C99B0F75459F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d495dcf2-04e5-4c0f-741d-08de62cdac75
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:41:03.4106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYGMOlW54XTNM0ZyTcczjax/+C4t8I/FHttFIic6JbmGJvm8Gl2J6F+y3FLFvM016oi78depYVgH5QTfcw0fww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6759
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1276302190.1671153668"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:greenjustin@chromium.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:nfraprado@collabora.com,m:ariel.dalessandro@collabora.com,m:Nancy.Lin@mediatek.com,m:linux-kernel@vger.kernel.org,m:Jason-JH.Lin@mediatek.com,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,ffwll.ch,collabora.com,gmail.com,chromium.org,pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E21FD3D25
X-Rspamd-Action: no action

--__=_Part_Boundary_002_1276302190.1671153668
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDExOjAzIC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRGVzcGl0ZSBNVDgxODgncyBPVkwgYmVpbmcgbW9zdGx5IHRoZSBzYW1lIElQ
IGFzIHRoZSBPVkwgb24gTVQ4MTk1LCBpdA0KPiBkb2VzIG5vdCBzdXBwb3J0IEFGQkMsIGV2ZW4g
d2hlbiB0aGUgc2FtZSByZWdpc3RlciBjb25maWd1cmF0aW9ucyBhcmUNCj4gYXBwbGllZC4gSW50
cm9kdWNlIGEgc2VwYXJhdGUgY29tcGF0aWJsZSBmb3IgaXQgd2l0aCBBRkJDIHN1cHBvcnQNCj4g
ZGlzYWJsZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jIHwgMTcgKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bC5jDQo+IGluZGV4IDE5NmI4NzQwNTdiYS4uOTdmNjY5NDc3MmQ0IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IEBAIC03NjIsNiArNzYyLDIx
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgbXQ4MTkyX292bF8ybF9k
cml2ZXJfZGF0YSA9IHsNCj4gIAkubnVtX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKG10ODE3M19mb3Jt
YXRzKSwNCj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2Rh
dGEgbXQ4MTg4X292bF9kcml2ZXJfZGF0YSA9IHsNCj4gKwkuYWRkciA9IERJU1BfUkVHX09WTF9B
RERSX01UODE3MywNCj4gKwkuZ21jX2JpdHMgPSAxMCwNCj4gKwkubGF5ZXJfbnIgPSA0LA0KPiAr
CS5mbXRfcmdiNTY1X2lzXzAgPSB0cnVlLA0KPiArCS5zbWlfaWRfZW4gPSB0cnVlLA0KPiArCS5z
dXBwb3J0c19hZmJjID0gZmFsc2UsDQoNCkdsb2JhbCB2YXJpYWJsZSBpcyBpbml0aWFsaXplZCB0
byB6ZXJvLCBzbyB0aGlzIGNvdWxkIGJlIGRyb3AuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2su
aHVAbWVkaWF0ZWsuY29tPg0KDQo+ICsJLmJsZW5kX21vZGVzID0gQklUKERSTV9NT0RFX0JMRU5E
X1BSRU1VTFRJKSB8DQo+ICsJCSAgICAgICBCSVQoRFJNX01PREVfQkxFTkRfQ09WRVJBR0UpIHwN
Cj4gKwkJICAgICAgIEJJVChEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSwNCj4gKwkuZm9ybWF0
cyA9IG10ODE5NV9mb3JtYXRzLA0KPiArCS5udW1fZm9ybWF0cyA9IEFSUkFZX1NJWkUobXQ4MTk1
X2Zvcm1hdHMpLA0KPiArCS5zdXBwb3J0c19jbHJmbXRfZXh0ID0gdHJ1ZSwNCj4gK307DQo+ICsN
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgbXQ4MTk1X292bF9kcml2
ZXJfZGF0YSA9IHsNCj4gIAkuYWRkciA9IERJU1BfUkVHX09WTF9BRERSX01UODE3MywNCj4gIAku
Z21jX2JpdHMgPSAxMCwNCj4gQEAgLTc5MCw2ICs4MDUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBtdGtfZGlzcF9vdmxfZHJpdmVyX2R0X21hdGNoW10gPSB7DQo+ICAJICAu
ZGF0YSA9ICZtdDgxOTJfb3ZsX2RyaXZlcl9kYXRhfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE5Mi1kaXNwLW92bC0ybCIsDQo+ICAJICAuZGF0YSA9ICZtdDgxOTJfb3ZsXzJs
X2RyaXZlcl9kYXRhfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1kaXNw
LW92bCIsDQo+ICsJICAuZGF0YSA9ICZtdDgxODhfb3ZsX2RyaXZlcl9kYXRhfSwNCj4gIAl7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kaXNwLW92bCIsDQo+ICAJICAuZGF0YSA9ICZt
dDgxOTVfb3ZsX2RyaXZlcl9kYXRhfSwNCj4gIAl7fSwNCj4gDQoNCg==

--__=_Part_Boundary_002_1276302190.1671153668
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMzAmIzMyO2F0
JiMzMjsxMTowMyYjMzI7LTAzMDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO0Rlc3BpdGUmIzMyO01UODE4OCYjMzk7
cyYjMzI7T1ZMJiMzMjtiZWluZyYjMzI7bW9zdGx5JiMzMjt0aGUmIzMyO3NhbWUmIzMyO0lQJiMz
MjthcyYjMzI7dGhlJiMzMjtPVkwmIzMyO29uJiMzMjtNVDgxOTUsJiMzMjtpdA0KJmd0OyYjMzI7
ZG9lcyYjMzI7bm90JiMzMjtzdXBwb3J0JiMzMjtBRkJDLCYjMzI7ZXZlbiYjMzI7d2hlbiYjMzI7
dGhlJiMzMjtzYW1lJiMzMjtyZWdpc3RlciYjMzI7Y29uZmlndXJhdGlvbnMmIzMyO2FyZQ0KJmd0
OyYjMzI7YXBwbGllZC4mIzMyO0ludHJvZHVjZSYjMzI7YSYjMzI7c2VwYXJhdGUmIzMyO2NvbXBh
dGlibGUmIzMyO2ZvciYjMzI7aXQmIzMyO3dpdGgmIzMyO0FGQkMmIzMyO3N1cHBvcnQNCiZndDsm
IzMyO2Rpc2FibGVkLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7TiYj
MjM3O2NvbGFzJiMzMjtGLiYjMzI7Ui4mIzMyO0EuJiMzMjtQcmFkbyYjMzI7Jmx0O25mcmFwcmFk
b0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7fCYjMzI7MTcmIzMyOysrKysrKysr
KysrKysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxNyYj
MzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMmIzMyO2IvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MTk2Yjg3
NDA1N2JhLi45N2Y2Njk0NzcyZDQmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7QEAmIzMyOy03
NjIsNiYjMzI7Kzc2MiwyMSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYj
MzI7bXRrX2Rpc3Bfb3ZsX2RhdGEmIzMyO210ODE5Ml9vdmxfMmxfZHJpdmVyX2RhdGEmIzMyOz0m
IzMyO3sNCiZndDsmIzMyOyYjMzI7Lm51bV9mb3JtYXRzJiMzMjs9JiMzMjtBUlJBWV9TSVpFKG10
ODE3M19mb3JtYXRzKSwNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
Mjsrc3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfZGlzcF9vdmxfZGF0YSYjMzI7
bXQ4MTg4X292bF9kcml2ZXJfZGF0YSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Ky5hZGRyJiMzMjs9
JiMzMjtESVNQX1JFR19PVkxfQUREUl9NVDgxNzMsDQomZ3Q7JiMzMjsrLmdtY19iaXRzJiMzMjs9
JiMzMjsxMCwNCiZndDsmIzMyOysubGF5ZXJfbnImIzMyOz0mIzMyOzQsDQomZ3Q7JiMzMjsrLmZt
dF9yZ2I1NjVfaXNfMCYjMzI7PSYjMzI7dHJ1ZSwNCiZndDsmIzMyOysuc21pX2lkX2VuJiMzMjs9
JiMzMjt0cnVlLA0KJmd0OyYjMzI7Ky5zdXBwb3J0c19hZmJjJiMzMjs9JiMzMjtmYWxzZSwNCg0K
R2xvYmFsJiMzMjt2YXJpYWJsZSYjMzI7aXMmIzMyO2luaXRpYWxpemVkJiMzMjt0byYjMzI7emVy
bywmIzMyO3NvJiMzMjt0aGlzJiMzMjtjb3VsZCYjMzI7YmUmIzMyO2Ryb3AuDQoNClJldmlld2Vk
LWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7
JiMzMjsrLmJsZW5kX21vZGVzJiMzMjs9JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfUFJFTVVMVEkp
JiMzMjt8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtCSVQo
RFJNX01PREVfQkxFTkRfQ09WRVJBR0UpJiMzMjt8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSksDQomZ3Q7
JiMzMjsrLmZvcm1hdHMmIzMyOz0mIzMyO210ODE5NV9mb3JtYXRzLA0KJmd0OyYjMzI7Ky5udW1f
Zm9ybWF0cyYjMzI7PSYjMzI7QVJSQVlfU0laRShtdDgxOTVfZm9ybWF0cyksDQomZ3Q7JiMzMjsr
LnN1cHBvcnRzX2NscmZtdF9leHQmIzMyOz0mIzMyO3RydWUsDQomZ3Q7JiMzMjsrfTsNCiZndDsm
IzMyOysNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtf
ZGlzcF9vdmxfZGF0YSYjMzI7bXQ4MTk1X292bF9kcml2ZXJfZGF0YSYjMzI7PSYjMzI7ew0KJmd0
OyYjMzI7JiMzMjsuYWRkciYjMzI7PSYjMzI7RElTUF9SRUdfT1ZMX0FERFJfTVQ4MTczLA0KJmd0
OyYjMzI7JiMzMjsuZ21jX2JpdHMmIzMyOz0mIzMyOzEwLA0KJmd0OyYjMzI7QEAmIzMyOy03OTAs
NiYjMzI7KzgwNSw4JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtv
Zl9kZXZpY2VfaWQmIzMyO210a19kaXNwX292bF9kcml2ZXJfZHRfbWF0Y2hbXSYjMzI7PSYjMzI7
ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7bXQ4MTkyX292
bF9kcml2ZXJfZGF0YX0sDQomZ3Q7JiMzMjsmIzMyO3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMz
MjsmcXVvdDttZWRpYXRlayxtdDgxOTItZGlzcC1vdmwtMmwmcXVvdDssDQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDttdDgxOTJfb3ZsXzJsX2RyaXZlcl9kYXRh
fSwNCiZndDsmIzMyOyt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWss
bXQ4MTg4LWRpc3Atb3ZsJnF1b3Q7LA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYj
MzI7JmFtcDttdDgxODhfb3ZsX2RyaXZlcl9kYXRhfSwNCiZndDsmIzMyOyYjMzI7eyYjMzI7LmNv
bXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1kaXNwLW92bCZxdW90OywN
CiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE5NV9vdmxf
ZHJpdmVyX2RhdGF9LA0KJmd0OyYjMzI7JiMzMjt7fSwNCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0K
PC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1276302190.1671153668--

