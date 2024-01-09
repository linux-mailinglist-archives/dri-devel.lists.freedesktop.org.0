Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B72827D38
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 04:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C0710E2EA;
	Tue,  9 Jan 2024 03:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF12910E2EA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 03:08:08 +0000 (UTC)
X-UUID: 4cdc966eae9c11ee9e680517dc993faa-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=HbQsAdv8npAnKgntoWDb0qYvoEWK+tTfrRFULZCpK5s=; 
 b=Veh3Hlx9koOs5Fzb6hWZOYYrdVDMW2G9NLkUpdx508lY45MPd0CyIRuN/BEl04b9UtQF4ImHz/Hn9QDakdJ9dvdidGzUT50MGVlVMkuk68j8PT6G8rtqGc8RqcxsPRRRRpuLsDoT8Bq27B35ebbs7J3NHzrePZqma3UDHM28cn4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:254bde4c-a97e-4489-bb79-2ba355b3bb65, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:67a7227f-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4cdc966eae9c11ee9e680517dc993faa-20240109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 207083714; Tue, 09 Jan 2024 11:08:02 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Jan 2024 11:08:02 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Jan 2024 11:08:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv3hF0pWJy+lQOXNM2UT7tti658Jh/p3d09hPJASm9uMpcGkk/5AgYXn+aLchN4JEqTW3gkmZGMtlB1xvB0aUtTwqa5Em2pEZ330VxS8a/nrLXxovul+1nCmleD8a7+LAlmInnYck5kev4cf3mYYVB0aE8UysJvR58IDWw0nZGDnXfAJxj8eIcX4LRYPNi3SYfOQwuw21BSZx6c294s/YFVkm9YXP9bUt58zCuUa/mPSSg0PcOPJgysdhYc4dp1Xca6dnj6emIF7pOpLa5g+MYa/rBYfykFJSWJgsT0lvqoDMgoDRGewQ2hZJlaFI1gYc/ijTR/xE4Mmcjqry+xzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbQsAdv8npAnKgntoWDb0qYvoEWK+tTfrRFULZCpK5s=;
 b=U0SZvZCL3ANkOp3T4Q23zzd3k6XaqMDzRmL4+sx3SwNrR1UodDiaUwHKmJ0c/yKRDUrnWIDtQphT5lVE925npdG6zBqbNqKO0iIOyXb/v1dRAwBjPSQNjwX1lk6KwOoxP+bXaPd96LUAdiEJkseek4Tgba53DHUBWW7TLN9WIukKVLy2U1Sa2Z+xxDpmyKWBTv4tBWw9RRyOWFA+KtOL3ynaOGMpn3LjJormHFOlKDsgkl+lecOBIkWrV9AGwACu7wdmTsLxeYp+hfMb7EoRoacg9Wm+URYzHj07l/YpnXNDoqX6B7tYQnpJlU17VW5q3k0GmVWsuJ+N2/lsaQg0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbQsAdv8npAnKgntoWDb0qYvoEWK+tTfrRFULZCpK5s=;
 b=Wtm+Lb8HEK4jyN0cJDzwxJZVJUbTc70/3XkbmpfHKgiSB03bBA4Tpg/1S6OAlyPWVhQeeqQxdOMYhFL+uX/3VRqf3KzprQW2+lrcKYMktimxO45IX9BKYhSVR18um0/9ho4nncyn81xPwupRa0KORbNlIsYEs0h0n+WbDq+WTig=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEYPR03MB6433.apcprd03.prod.outlook.com (2603:1096:101:3d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Tue, 9 Jan 2024 03:07:22 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::80bc:52a5:ec31:6180]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::80bc:52a5:ec31:6180%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 03:07:22 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "jkardatzke@google.com" <jkardatzke@google.com>, "contact@emersion.fr"
 <contact@emersion.fr>
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Thread-Topic: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Thread-Index: AQHaLKV/TUoFsF1qAky6IXxgfhlOWLCl2XKAgAEUPoCAABO1gIAAFxSAgAAdE4CAAA8EAIAN1+QAgBUY6ACAAOZFAIAF3P4A
Date: Tue, 9 Jan 2024 03:07:21 +0000
Message-ID: <ac8107b8608de25a8d680863b28b075c4cd17140.camel@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell>
 <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
 <20231213161614.43e5bca8@eldfell>
 <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
 <CA+ddPcOew7Wtb1-Cakq_LPN1VwtG+4vpjpLFvXdsjBunpefT1A@mail.gmail.com>
 <160df81d-e5fa-4798-96d4-5ab1809a9680@gmail.com>
In-Reply-To: <160df81d-e5fa-4798-96d4-5ab1809a9680@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEYPR03MB6433:EE_
x-ms-office365-filtering-correlation-id: 35f17acd-ee03-42ea-5637-08dc10c01924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r01t+q9SQgG4Q97w/4uy6RxYjfYaB7D3+X4DwdtKYmSQppkybOhguXOHH9yBPs5kJuSh82acfZCrw3HtJi/WNmZ6aKuR5cMpNoirOMjfWgRU0ppzTVw1A6nJ5eSwEudE5DwjjaSvVuEkEDXiYrMiIiBU6BpTcMj7w6aQbn1TeTrzXf5LD0Z/i8dcXYlxhslQ+D+dJpNYLgg6O1z5b8H6baEQqOJnMTLzM7O8zgTvSMY/6co2jfMYSJVkX4H2yu1puRhLvRR0tHSTdklXLRNE1yIRAJplkdHX+VLKPnke1gBGA9VIckfSrxBUDcr7Di8xZJI5U/GLy5XHFEyZAeu8ibdwqZMOoB5IEb/JJApv7VzwU1ki/Fbd5E9c4dLE+/qOI5Rvx0kcYEjBHrq3mj5Lojel6i6njropPcvDu9ycjh+tChcG7o9JfrjaZtjjNvRDJTKVhJ1TceT17L+JBg7bsJWQJpBX2Td9DOIn8oZeNfE8fm/r9Q+YXxzRez5I+L3zZzgY40xzIjU5p3t0/F/Mom9mVZHub6wkzuQGpxgo6YfWSlqxhDG5h910bL76h3wYs2qtZ+s4zx7vmjgZT1G1WOwExRqIzegg4BaGROzaEtCN4qbUhrgJMYy8bM25pLRrs5CO9GkUNzbZiFmlt/wh1vVF6mrFnVQdrYCO2EYaJGXl2YQ5NJHDg/T4FLAURKbrtCqjsbkPYKH7mXH8Om+aPSO75tEOn1gbl28en2wfjOY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(4326008)(6486002)(478600001)(2616005)(66556008)(8936002)(64756008)(91956017)(66446008)(66946007)(66476007)(110136005)(54906003)(8676002)(66574015)(26005)(76116006)(83380400001)(6506007)(71200400001)(6512007)(53546011)(2906002)(7416002)(41300700001)(5660300002)(38070700009)(36756003)(85182001)(38100700002)(122000001)(86362001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFA4bWoweXZkRVRObDNsZVBjekMxZStKNktVTWlnRU93Z09hTXNHcWp5a05j?=
 =?utf-8?B?WXltQVUzWVJpQ3V0SGR2d3RGZnhTSU1pdlBKZXZtdUFlUEtNczkvR2NDVFVP?=
 =?utf-8?B?T2JzZGVQQnBUbXJjSnlGcmQra2xtTGVDT2Ztb3doSXV0UlFpME1aZ2FRZWdj?=
 =?utf-8?B?K2dxV1V0OEVpaFBncDROeC8xaCtOM09vb05rWllRclpZc3loK1hXYVNteW1V?=
 =?utf-8?B?SFBEL3lKdm5DN2ZDcFNDUDVBb29UTW1FK3FPWS9WeVZwS0c0ZnhpNGRzWGZj?=
 =?utf-8?B?VXJmNE1LZndzK214VktjRDhxY09FUlE1bkxOcFR6MzFUR2Z3M0VZTEI4cHVG?=
 =?utf-8?B?alVTMHlkcDUwOTJnRzVCOEpVNG9lUGJYZ0dwOWQvTkhjeWIyY2N1cEV4UWRB?=
 =?utf-8?B?RGZXM0ZYT21EY0FHZkhpSG9yUUloMk56SXdtR25RY2tIb2g0OXB3SElyVGYv?=
 =?utf-8?B?S0U0WE1lNGs2dDJFL0EyOE9BZjJhSkptVnNsa1IzOUk3Y2ZjMG5rMEF5MFdl?=
 =?utf-8?B?YW1TT3hTcmg5WTFURkhPYnlKaTh0U2ZDaHRiSHNPSC9WREtyUG5DZURGeWNI?=
 =?utf-8?B?L2xzQ2o3UXNJM1FGOUtZQmtLWSs2OEZTQVZiYkdWNVR0dndoY1EweHZTd3kr?=
 =?utf-8?B?WEQyVkoxTDIzeGx5R0VyeDNMa0hZVWtsdDJJa2ZuZFZGSzRqakQwcFdMRGdz?=
 =?utf-8?B?eTYwSkZlOUZuVXdkaVJKalM4R1A4SzdnSFA2YUtoVWU1RUpJZzJPU3JPVUs1?=
 =?utf-8?B?NjVqZDZ4YzRWKzlKamZlSXk0VE11bTJQSkdPaVFML1NvRHJTRHN6dHlFV2J5?=
 =?utf-8?B?NC94WHNBZG5EckhQRzVGSGZSRVNlak94Tmtmc2t6RksrSVdCZ3NzZGY3RFVT?=
 =?utf-8?B?aGZHMk5RVjFQNVpoN0wwT242VWNqSytBYytLaHZJRHBVQ244UjZ6aStiV0pj?=
 =?utf-8?B?TzJNbmxzSzBqZTJIQUZQbUZCdU9mOFM0YW9RYXlzR3ArUEUxNWFrU0RkWmcv?=
 =?utf-8?B?alpWOXNmN2FJWndKL0RKM0xkbXpSZmlPRnVBUlBVNzliN1lFQks5QkIrRHo0?=
 =?utf-8?B?a3huVlozeXNCbzFhVkpSVVhkc1lKTHVLbTRwZ1Y1SFArWXlndFRzVCsxdEV3?=
 =?utf-8?B?RllHTnFycFNTczJ1SUxLZ3JDZ1dmNzR6cXExanBKYTZvajkvYzNFTmdSS3F4?=
 =?utf-8?B?ZG45VFZNQnphcHRYSnFkRjNoRWw5d1pnczI2dkVHdW5zNjM5M3pTSkFSK3JH?=
 =?utf-8?B?bXEySlJtYUR0U1hHNWpnVEdaa1JkcWVPd1Ntd2xKNHYzdUptQmFZRlZoeWpU?=
 =?utf-8?B?MG9SbGFFNURENFlyYmNnUksreWdEWktkQTRxNFdOSmlMdFNiZ3E4MUlVM3d3?=
 =?utf-8?B?ZWlPVzRieTVyekFmTkt4cGtLMDdaOFh1RlRkSUswZXA0MmgydjhZRmJZbmVY?=
 =?utf-8?B?d3haTXc4d3RFSGNyNDd2eEZkd2xCdXJ6VU42a1dJV0Q3ZlVVL0RNVlFhdERq?=
 =?utf-8?B?RjJ2TXBlbGpZYUF0T0d0d0thaEp3QVNBbkhuRUZwQTJKWlNuUDBNQXlYNHFM?=
 =?utf-8?B?Q01nRy9DempRVEZvb1VCd0hLaHlzSkdXcThlODNGU3c1QVp1MGd5NmVnaW1K?=
 =?utf-8?B?a2s3TXBYaURiZGtvbkVERkhSRENlTUtiTG1TU0FFbUg4TlJJblR4NVdadWJH?=
 =?utf-8?B?WnNmWXNhSWx0dXV1MlZwTnF5enpTZ1RGaXhWUml2TFluQUoyNEsxQldXY3Rm?=
 =?utf-8?B?b2x6UGZIRVZqdTdGckxiZ01oZFZlV3hOTUdQVHFNRmhqQ2VCYUhEVW5xRmpp?=
 =?utf-8?B?bXRZMkNHdEhaREtTbFdaRUhGS1ptSHVIbEJaVTFsd1ZRSGw0WTJFdVVscEUr?=
 =?utf-8?B?Sy90U0ZXNVBSRFM2SEdxamRrb0hKYmhJdGpKaU93d1M0SGNISTdZOXo3TklH?=
 =?utf-8?B?Q3Axd0ZISXFZbGFWU1QwcVZORHE2d3MwYko2YTNWZCtEelUxbWFtWllIYy9I?=
 =?utf-8?B?SThRTGRTQndHUWJEbUoxS2hMd01TVk41bTMxQTQvdHpES2pSREd0VndvUEtW?=
 =?utf-8?B?TVpadHBmMDJmZWVOV1V0N3BJUlU1VWpINkRSQWNKOWJ2VVNqekFCRDVtd2Fl?=
 =?utf-8?Q?6jBx+jP0qhLQEJXvX2yc7Xpps?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <866D933C27DA544BB8704563C6BAFE48@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f17acd-ee03-42ea-5637-08dc10c01924
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 03:07:22.0870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CcmLs42mxsxpNa/qNI6Ai00p/PmwX7wYS2gNG2OjCwp0vsMQRE95u3AuiwPy/THa2t+oLiuwtJQp8FAP1UtnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6433
X-MTK: N
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI0LTAxLTA1IGF0IDEwOjM1ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIEFtIDA0LjAxLjI0IHVtIDIwOjUwIHNjaHJpZWIgSmVmZnJleSBL
YXJkYXR6a2U6DQo+ID4gQW55IGZlZWRiYWNrIGZyb20gbWFpbnRhaW5lcnMgb24gd2hhdCB0aGVp
ciBwcmVmZXJlbmNlIGlzPyAgSSdtDQo+IGZpbmUNCj4gPiB3aXRoICdyZXN0cmljdGVkJyBhcyB3
ZWxsLCBidXQgdGhlIG1haW4gcmVhc29uIHdlIGNob3NlIHNlY3VyZSB3YXMNCj4gPiBiZWNhdXNl
IG9mIGl0cyB1c2UgaW4gQVJNIG5vbWVuY2xhdHVyZSBhbmQgdGhpcyBpcyBtb3JlIGZvciBBUk0N
Cj4gdXNhZ2UNCj4gPiB0aGFuIHg4Ni4NCj4gDQo+IFdlbGwgQU1EIGNhbGxzIHRoaXMgInRydXN0
ZWQiLCBidXQgSSB0aGluayB0aGF0J3MganVzdCBzbGlnaHRseQ0KPiBiZXR0ZXIgDQo+IHRoYW4g
InNlY3VyZSIuDQo+IA0KPiArMSBmb3IgdXNpbmcgInJlc3RyaWN0ZWQiIGNhdXNlIHRoYXQgc2Vl
bXMgdG8gbWF0Y2ggdGhlIHRlY2huaWNhbCANCj4gY29uc2VxdWVuY2VzLg0KDQpUaGFua3MgeW91
IGFsbCBmb3IgdGhlIGRpc2N1c3Npb24gYW5kIHRoZSBjb25jbHVzaW9uLiBJIHdpbGwgc2VuZCB2
NCBpbg0KdGhpcyB3ZWVrIHdpdGggInJlc3RyaWN0ZWQiLg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBD
aHJpc3RpYW4uDQo+IA0KPiA+DQo+ID4gVGhlIG1haW4gZGlmZmVyZW5jZSB3aXRoIHNpbWlsYXIg
YnVmZmVycyBvbiBBTUQvSW50ZWwgaXMgdGhhdCB3aXRoDQo+ID4gQU1EL0ludGVsIHRoZSBidWZm
ZXJzIGFyZSBtYXBwYWJsZSBhbmQgcmVhZGFibGUgYnkgdGhlIENQVSBpbiB0aGUNCj4gPiBrZXJu
ZWwuIFRoZSBwcm9ibGVtIGlzIHRoZWlyIGNvbnRlbnRzIGFyZSBlbmNyeXB0ZWQgc28geW91IGdl
dCBqdW5rDQo+ID4gYmFjayBpZiB5b3UgZG8gdGhhdC4gT24gQVJNLCB0aGUgYnVmZmVycyBhcmUg
Y29tcGxldGVseQ0KPiBpbmFjY2Vzc2libGUNCj4gPiBieSB0aGUga2VybmVsIGFuZCB0aGUgbWVt
b3J5IGNvbnRyb2xsZXIgcHJldmVudHMgYWNjZXNzIHRvIHRoZW0NCj4gPiBjb21wbGV0ZWx5IGZy
b20gdGhlIGtlcm5lbC4NCj4gPg0KPiA+IFRoZXJlIGFyZSBhbHNvIG90aGVyIHVzZSBjYXNlcyBm
b3IgdGhpcyB3aGVyZSB0aGUgaHlwZXJ2aXNvciBpcw0KPiB3aGF0DQo+ID4gaXMgY29udHJvbGxp
bmcgYWNjZXNzIChzZWNvbmQgc3RhZ2UgaW4gdGhlIE1NVSBpcyBwcm92aWRpbmcNCj4gPiBpc29s
YXRpb24pLi4uLmFuZCBpbiB0aGF0IGNhc2UgSSBkbyBhZ3JlZSB0aGF0ICdzZWN1cmUnIHdvdWxk
IG5vdA0KPiBiZQ0KPiA+IHRoZSByaWdodCB0ZXJtaW5vbG9neSBmb3IgdGhvc2UgdHlwZXMgb2Yg
YnVmZmVycy4gICBTbyBJIGRvIGFncmVlDQo+ID4gc29tZXRoaW5nIG90aGVyIHRoYW4gJ3NlY3Vy
ZScgaXMgcHJvYmFibHkgYSBiZXR0ZXIgb3B0aW9uIG92ZXJhbGwuDQo+ID4NCj4gPg0KPiA+IE9u
IEZyaSwgRGVjIDIyLCAyMDIzIGF0IDE6NDDigK9BTSBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNp
b24uZnI+DQo+IHdyb3RlOg0KPiA+PiBPbiBXZWRuZXNkYXksIERlY2VtYmVyIDEzdGgsIDIwMjMg
YXQgMTU6MTYsIFBla2thIFBhYWxhbmVuIDwNCj4gcHBhYWxhbmVuQGdtYWlsLmNvbT4gd3JvdGU6
DQo+ID4+DQo+ID4+Pj4+IEl0IGlzIHByb3RlY3RlZC9zaGllbGRlZC9mb3J0aWZpZWQgZnJvbSBh
bGwgdGhlIGtlcm5lbCBhbmQNCj4gdXNlcnNwYWNlLA0KPiA+Pj4+PiBidXQgYSBtb3JlIGZhbWls
aWFyIHdvcmQgdG8gZGVzY3JpYmUgdGhhdCBpcyBpbmFjY2Vzc2libGUuDQo+ID4+Pj4+ICJJbmFj
Y2Vzc2libGUgYnVmZmVyIiBwZXIgc2UgT1RPSCBzb3VuZHMgbGlrZSBhIHVzZWxlc3MNCj4gY29u
Y2VwdC4NCj4gPj4+Pj4NCj4gPj4+Pj4gSXQgaXMgbm90IHNlY3VyZSwgYmVjYXVzZSBpdCBkb2Vz
IG5vdCBpbnZvbHZlIHNlY3VyaXR5IGluIGFueQ0KPiB3YXkuIEluDQo+ID4+Pj4+IGZhY3QsIGdp
dmVuIGl0J3Mgc28gZnJhZ2lsZSwgSSdkIGNsYXNzaWZ5IGl0IGFzIG1pbGRseSBvcHBvc2l0ZQ0K
PiBvZg0KPiA+Pj4+PiBzZWN1cmUsIGFzIGUuZy4gY2xpZW50cyBvZiBhIFdheWxhbmQgY29tcG9z
aXRvciBjYW4gcG90ZW50aWFsbHkNCj4gRG9TIHRoZQ0KPiA+Pj4+PiBjb21wb3NpdG9yIHdpdGgg
aXQgYnkgc2ltcGx5IHNlbmRpbmcgc3VjaCBhIGRtYWJ1Zi4gT3IgRG9TIHRoZQ0KPiB3aG9sZQ0K
PiA+Pj4+PiBzeXN0ZW0uDQo+ID4+Pj4gSSBoZWFyIHdoYXQgeW91IGFyZSBzYXlpbmcgYW5kIERv
UyBpcyBhIGtub3duIHByb2JsZW0gYW5kIGF0dGFjaw0KPiB2ZWN0b3IsDQo+ID4+Pj4gYnV0IHJl
Z2FyZGxlc3MsIHdlIGhhdmUgdXNlIGNhc2VzIHdoZXJlIHdlIGRvbid0IHdhbnQgdG8gZXhwb3Nl
DQo+ID4+Pj4gaW5mb3JtYXRpb24gaW4gdGhlIGNsZWFyIGFuZCB3aGVyZSB3ZSBhbHNvIHdvdWxk
IGxpa2UgdG8gaGF2ZQ0KPiBzb21lDQo+ID4+Pj4gZ3VhcmFudGVlcyBhYm91dCBjb3JyZWN0bmVz
cy4gVGhhdCBpcyB3aGVyZSB2YXJpb3VzIHNlY3VyZQ0KPiBlbGVtZW50cyBhbmQNCj4gPj4+PiBt
b3JlIGdlbmVyYWxseSBzZWN1cml0eSBpcyBuZWVkZWQuDQo+ID4+Pj4NCj4gPj4+PiBTbywgaXQg
c291bmRzIGxpa2Ugd2UgaGF2ZSB0d28gdGhpbmdzIGhlcmUsIHRoZSBmaXJzdCBpcyB0aGUNCj4g
bmFtaW5nIGFuZA0KPiA+Pj4+IHRoZSBtZWFuaW5nIGJlaGluZCBpdC4gSSdtIHByZXR0eSBzdXJl
IHRoZSBwZW9wbGUgZm9sbG93aW5nIGFuZA0KPiA+Pj4+IGNvbnRyaWJ1dGluZyB0byB0aGlzIHRo
cmVhZCBjYW4gYWdyZWUgb24gYSBuYW1lIHRoYXQgbWFrZXMNCj4gc2Vuc2UuIFdvdWxkDQo+ID4+
Pj4geW91IHBlcnNvbmFsbHkgYmUgT0sgd2l0aCAicmVzdHJpY3RlZCIgYXMgdGhlIG5hbWU/IEl0
IHNvdW5kcw0KPiBsaWtlIHRoYXQuDQo+ID4+PiBJIHdvdWxkLiBJJ20gYWxzbyBqdXN0IGEgYnkt
c3RhbmRlciwgbm90IGEgbWFpbnRhaW5lciBvZiBrZXJuZWwNCj4gPj4+IGFueXRoaW5nLiBJIGhh
dmUgbm8gcG93ZXIgdG8gYWNjZXB0IG5vciByZWplY3QgYW55dGhpbmcgaGVyZS4NCj4gPj4gSSdk
IGFsc28gcGVyc29uYWxseSBiZSBPSyB3aXRoICJyZXN0cmljdGVkIiwgSSB0aGluayBpdCdzIGEg
bG90DQo+IGJldHRlcg0KPiA+PiB0aGFuICJzZWN1cmUiLg0KPiA+Pg0KPiA+PiBJbiBnZW5lcmFs
IEkgYWdyZWUgd2l0aCBldmVyeXRoaW5nIFBla2thIHNhaWQuDQo+IA0K
