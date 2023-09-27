Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1395F7AF850
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 04:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8410E426;
	Wed, 27 Sep 2023 02:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204D10E426
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 02:52:25 +0000 (UTC)
X-UUID: e01b58ce5ce011ee8051498923ad61e6-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jWhDdRTEAU+zw/lhjP8Yc14q2g7obPCQEaeePg/cjqM=; 
 b=YuoAtgQjLEzMsivC7VoL2rnNM2HTm+AzpIbzy/573bAg0PZ+KRoEiLSvJTFC5TXGnztuOyafIqGrEOCm1+aFuXAVIBjQ3VUT5hiyMEmkoJZYxXtjsKtUTgMQy06l+q5kezqoTAo5oWzvDBrY5Az5qefRtVGyAzZGGtUB9Mm/DTQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:66cc766d-5a36-452a-b6ef-afc16de00b21, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:5f78ec9, CLOUDID:0d082df0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e01b58ce5ce011ee8051498923ad61e6-20230927
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1398149878; Wed, 27 Sep 2023 10:52:19 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 10:52:18 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 10:52:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Je6HIXt8DmZJFlJsSGTjsTckUSXc2/zi6NmY1OtOrc+fF/Hv5BBZQy2C52IwCvr2I1l5aR/Av62Oz2aVwGaIYb3TwcJhQdcwSCCaof1ODqjp+/6M2CY7wHOimmBEwD5iP2nY2IQs4fWGXFsFI0i9cAo5u1Y/bahHBgv8gJyAdZDkfUlXcM6uoZZqZKtwpow468KOJS6vqTb8O3V+Fft8GVU7gReWYREXVTBDqYFb48GYv/YNxh8ISSsj3pNgNymurrry+QbmjuB9xa/vpbNZF2wzPqRE62EWuVJOCXHXzjyK4IwbtmysRkq4fN3uwYnSs/S2/trJzO9tsUjaG01xVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWhDdRTEAU+zw/lhjP8Yc14q2g7obPCQEaeePg/cjqM=;
 b=cC/6DKq6WsQ/zAvwh7iu7ZqpJxL5lD365zNmJY4DLYgHMglSw5PjzlkMxRhCLIQp3WycJY9TNLcAIgcyJ835MQvZ2cYn9q8gNDQbPLGRAkbU8XrXkTQfVcgF1TnXdSUGZiI6a3G+HiR2d8HvHW80bLmlR79wvXhdUjxEWevWu2hAbS4fC5aTdj3Pafb/HLoKQWn9UjX4xqCaMT94swsGnUKkJCiLCEGYVV9xDUf40vIp8bcY0UZcKrUQTOqD0+Fptvu3DuBE1nI9iz+pL/dru6CFGQ23mvjDjbMdUl5444A9m2N2sfCONce59NjF7rHnh/sfMZErdbTsqKwDPmpy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWhDdRTEAU+zw/lhjP8Yc14q2g7obPCQEaeePg/cjqM=;
 b=DAJDpywAoYbUz6A2hw1jtlNF7AC0neUkSVmkf5x1L++k1xStu+7LqsurQMOXZEMgGgMgs896DMI+xgtrRZ6vhEAhVlyqKnbwbrgmn9rm0ilg93Mmzn+NvWNKBO1nQFjM9qRkmFQA6L5/tirYfRXXlUvU0ayDmG7T+nYdnls4tyw=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB5524.apcprd03.prod.outlook.com (2603:1096:820:3b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 02:52:16 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 02:52:16 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 10/16] dt-bindings: media: mediatek: mdp3: add
 component TDSHP for MT8195
Thread-Topic: [PATCH v6 10/16] dt-bindings: media: mediatek: mdp3: add
 component TDSHP for MT8195
Thread-Index: AQHZ7SWG+juuYn9W1Uq9kLbQoBxE1bAorgIAgAVS8IA=
Date: Wed, 27 Sep 2023 02:52:16 +0000
Message-ID: <75897feec12e34c5a2acb550a55f4de10437aa1b.camel@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-11-moudy.ho@mediatek.com>
 <948a37c4-2237-8ec8-270d-8a704c8c4835@linaro.org>
In-Reply-To: <948a37c4-2237-8ec8-270d-8a704c8c4835@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB5524:EE_
x-ms-office365-filtering-correlation-id: 15b2bb09-2cc0-4cac-1d03-08dbbf04c255
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rUcV8H2FYngrGjgGPGrKSZmNDmDJp6nCMFr1nAG2UdfBFaJw+rHdrLCZMXztZqkjesp4719N33Zcuz+7SS46zJWu3jQvp692Rvw6d3SfYYA6B6XLcEVExynPx8/mHzZp96Z4zE5KFdOMffym2GUosEDMZtA2be8RR29eop8izJxmO335XqR1Dq4tZR1HXY3LSiHNraV05F0TJZaCIh83ddwVUPvlIm3cBLHG8bpIWO4SwfPp09PdYaUsP6S1JWq3OKwKk44n0WuW9/4911cfVlow3PCZ11w0Qs2dXZxyJ8i1IQZZRR3YD4OlGFcCejn5r3M2I++Stww6AD5zZqKAnQPaDhO8W1Hq17BtBGuPohgjBbnEqzXmZc97/BeaWNmEK34nUtHBGA2Fel3J/9LHWgbsd43McQAJyt9tInljg3kVnEaugkOXtRM0NzWqNdrSsHL96kn7JxynekjYsldCw7H78YqMm6pbI9spkNrHSAz8klLLWl/fuwybE5y8ZZPVKY0EevZudw76HKVUNjsOTK/adKkL/3Tvc0hjbPLiuBzBgSoWt2L0tq9QEjpWZF5ze7jgz9p2vhiRW+RXr38pyZTUrsqBdHjfmCK3vxCYLYzGgaI5cVrAhSrmqOaufPdvrchui8HB2Ox95btaO6X5ZOiA1NpFsslvkEhPl3mGciEv8HpcxQHIQmSVe7gPc8enpx8Omsps2xcz82mDf5KPqab/BovlXD8qh22USVF7/4k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(38100700002)(85182001)(36756003)(38070700005)(86362001)(53546011)(4326008)(2616005)(2906002)(41300700001)(478600001)(316002)(66556008)(64756008)(966005)(66476007)(66446008)(54906003)(66946007)(110136005)(7416002)(76116006)(6506007)(6486002)(71200400001)(122000001)(6512007)(8676002)(83380400001)(26005)(5660300002)(8936002)(921005)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHk2RFQyTGxnbWxNdjMvOWZTNzk0ZXBHckRveC9ZbDZhTkJEQ0dBMG9iRFI3?=
 =?utf-8?B?dkJUUXgxRWZwUWU4bGVoYnNkaGlBNngwbFlncnQvQksrUTQzTVRrL2ZsZDhL?=
 =?utf-8?B?TFJSMWdBenBJS1lnbkxJTURpWDJNaU1JK3pVWHI4enJ5eGhoaFd3bW5GVEFR?=
 =?utf-8?B?L2VPZS9Odjc3RjdtWlh1NW9MdUxjdVlETFE5RVpwUjZTZUh6R1UzdGlrTHBF?=
 =?utf-8?B?MytxczBEUHJSRE5PWnNBUktYdzBWZjc1dGdhSFJDV3h1a0wxZFhKY1Z4MVB2?=
 =?utf-8?B?MXYyS29HOGhRVjlUcjFHL0hzWDFYZnZhNStBS2dURkdxaGMyUlUrU1Q5TWFa?=
 =?utf-8?B?S1dDWldkK3k0SUpVRC9GdEIwL2hYcDFWWmdwbFFxM01ocDlhQUFVT2pVTWI0?=
 =?utf-8?B?bFdhK2tBUzBIVWRqR3FjR1V4Q201SDFUMnFJOFRyQmdpQWgzbEozNkxmN1hC?=
 =?utf-8?B?Ulo3b2FYWENBdWNmRnJjaS9kQVZ1SEMwbURaZzh5ZlF3Zmw4UTczK1ZJWDlD?=
 =?utf-8?B?YzdTL1dNM1poTkp6blgxUjlBRjVxU2tTSEVBZnJhMlhaL2VjQ3pCSE5tNU9I?=
 =?utf-8?B?NVBZajd0YUVXQnBrS2dRZUcwY3dqVCtONUFDeE5FcjhHb1NEYWRxei9BSHp2?=
 =?utf-8?B?Z0UwYkNXWVNCdHFjNHY3THkwQlhQUWpqaVBJWGVCci9OMm5INTR2OG4rMUsv?=
 =?utf-8?B?bGFNeDBldER6SFUrYTVFamkzYk1mSHNQTmYxUittZDdOVWF2VS9HQ3BEU1B5?=
 =?utf-8?B?ZXM5N3RQNnArVnhnYlBoclljSUd1U1hGYXBITERYTlgwMzVHT0YvYndyZUxE?=
 =?utf-8?B?bTB5R3RMWCsyZjJQOWNxMVQyMWVxWVozL1ZXKzNRcUorNVBWeUZTVEpjWmhj?=
 =?utf-8?B?SndSbW5DemE1eW1QMDVLMWdRTDR0cVZxU1VxNGNpK2M2eEhwV2UvQ1dYWGpp?=
 =?utf-8?B?YWFzNjhJOUtxNnQrWTlhTVAxWDgxNmEyYXJrbTFlZUU3T0lYc0hwcXZObFpm?=
 =?utf-8?B?aWhOdjNZWFZENmhVNld3TExhYkR4UlFzZ3d4UXZzeFo5QkREaVJSSzV4L3ow?=
 =?utf-8?B?UldkZS85MTBBZlBJSzZmY01yLythTHJTbTVDNzNKUlBzb1FIT3JxUSt6TVJO?=
 =?utf-8?B?UjE5aEhRK0hKQzdSb2tIajBYTjZvOGhobVQ0eWNBc3cxR0JlQVppZ09aQWdI?=
 =?utf-8?B?RVovbjkyc3FqUUFnSHVlWGFGQkk3VjF2ZFJIRENVK3ZMeXRDV3Vpc0VnYUpZ?=
 =?utf-8?B?MUZsSndIT25zZUFIdHBkYmlJYXBCeEMyOExNSmZqU1FMeERWS21FOEZoMUlO?=
 =?utf-8?B?VUV0Qyt6T1pVS3NpTjVzYXREQ0YzVDVhTTh6VHcwLzNlTGxLcnZKWkxqbVNn?=
 =?utf-8?B?a2ZjZkNkRDE3cE5GWWFoNEc5YTRCcndDT3dXYVArZ1JXYUcyWXVQdkxLclFE?=
 =?utf-8?B?ZTRZT1RRQU9XR1ZMYzA2ZmtLK1BDVnBhUWVvSnlCejhndDlvUVM0Q0dzV0xm?=
 =?utf-8?B?eTNDdFpmajJuM2J3WWpHemdRcUMwRFZCd0VQaTZIbi9CTGQxWjFjSUVQT1N5?=
 =?utf-8?B?c3A0NVl1L1VORSs5Sms3SjYxTHlNc01CYUZhMkxUWU9pTkhFdnhWaUY1Ym1B?=
 =?utf-8?B?MWw2Wmh6RnZTUlMyQjZ0M2tiT1hyVjlpcmFjUm9OZXZwZTJwS09QSlBjWVh2?=
 =?utf-8?B?b0dpbmhyUmx5bDVsRXFNZTJUUWNGWHNYbmR0YzZWUWltRi9tUUpvVVB6VDJs?=
 =?utf-8?B?Z2c5WmZpNGxZQVpyQklJTmpOVTdDMEpaK3grZnFDcnNJWlk2QllsaHZ0cGt0?=
 =?utf-8?B?Qjl3RDU0by9XSlJ6c2dEdkR4VFBiOTB3RG53Vy9mcVZJbHgvLzQyMmFndC9F?=
 =?utf-8?B?dVJtQmU1RGQ3bTczVUliRFAySlcvVk5kSjVkNW1jUnFudlA3aHlHazJlUFZT?=
 =?utf-8?B?M01FSDJLQjRaN2ZjOENjN3o0eStCczJKYmVQNFp2eTZBZFlDaFJmZStoQUwy?=
 =?utf-8?B?cHZ2NExyK285dWx0Y0pVTWJDOFVQNEdodnFMUGE5VGtnVWVhUFNab3pQT280?=
 =?utf-8?B?djZvKytGSjNrMWVvTFFIOFU1UmEwQ3ZwejlGQTlkYW9xREx4c0JpY3U1aUt6?=
 =?utf-8?B?ZHE4L2hFTjZFc3gwbTVYWGxuUUcycVcxMW9pUUpIamNCMndFTjFKQkFFcHcv?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F954066871F38E43BACBF4E1C68EEEF2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b2bb09-2cc0-4cac-1d03-08dbbf04c255
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 02:52:16.3809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9i6/FghBVL+DyzLbnhI16q6D5uW1wAdxpNQW81RAfj2ACNUjd1OiCqlllA05q76LJciI+VKghrMKueIozGFEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5524
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTIzIGF0IDE5OjM0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDIyLzA5LzIwMjMgMDk6MjEsIE1vdWR5IEhvIHdyb3Rl
Og0KPiA+IEFkZCB0aGUgZnVuZGFtZW50YWwgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBvZiBjb21w
b25lbnQgVERTSFAsDQo+ID4gd2hpY2ggaXMgY29udHJvbGxlZCBieSBNRFAzIG9uIE1UODE5NS4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy10ZHNocC55
YW1sICAgfCA2MQ0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2
MSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy10ZHNocC55YW1sDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlayxtZHAzLQ0KPiB0ZHNocC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtDQo+IHRkc2hwLnlhbWwNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGFjOTA0Y2JjMmMwDQo+ID4g
LS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9tZWRpYXRlayxtZHAzLQ0KPiB0ZHNocC55YW1sDQo+ID4gQEAgLTAsMCArMSw2MSBA
QA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL21lZGlhdGVrLG1kcDMtdGRzaHAueWFtbCMNCj4gPiAr
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+
ID4gKw0KPiA+ICt0aXRsZTogTWVkaWFUZWsgTWVkaWEgRGF0YSBQYXRoIDMgVERTSFANCj4gPiAr
DQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMu
YmdnQGdtYWlsLmNvbT4NCj4gPiArICAtIE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+
DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiArICBPbmUgb2YgTWVkaWEgRGF0YSBQYXRo
IDMgKE1EUDMpIGNvbXBvbmVudHMgdXNlZCB0byBpbXByb3ZlIGltYWdlDQo+ID4gKyAgc2hhcnBu
ZXNzIGFuZCBjb250cmFzdC4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0
aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMt
dGRzaHANCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+
ID4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4g
PiArICAgICAgVGhlIHJlZ2lzdGVyIG9mIGRpc3BsYXkgZnVuY3Rpb24gYmxvY2sgdG8gYmUgc2V0
IGJ5IGdjZS4NCj4gVGhlcmUgYXJlIDQgYXJndW1lbnRzLA0KPiA+ICsgICAgICBzdWNoIGFzIGdj
ZSBub2RlLCBzdWJzeXMgaWQsIG9mZnNldCBhbmQgcmVnaXN0ZXIgc2l6ZS4gVGhlDQo+IHN1YnN5
cyBpZCB0aGF0IGlzDQo+ID4gKyAgICAgIG1hcHBpbmcgdG8gdGhlIHJlZ2lzdGVyIG9mIGRpc3Bs
YXkgZnVuY3Rpb24gYmxvY2tzIGlzDQo+IGRlZmluZWQgaW4gdGhlIGdjZSBoZWFkZXINCj4gPiAr
ICAgICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNoaXA+LWdjZS5oIG9mIGVhY2ggY2hpcHMu
DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxl
LWFycmF5DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgaXRlbXM6DQo+ID4gKyAgICAgICAg
LSBkZXNjcmlwdGlvbjogcGhhbmRsZSBvZiBHQ0UNCj4gPiArICAgICAgICAtIGRlc2NyaXB0aW9u
OiBHQ0Ugc3Vic3lzIGlkDQo+ID4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogcmVnaXN0ZXIgb2Zm
c2V0DQo+ID4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogcmVnaXN0ZXIgc2l6ZQ0KPiA+ICsgICAg
bWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsgICAgbWluSXRlbXM6IDEN
Cj4gDQo+IE5BSy4gU28geW91IGlnbm9yZWQgYWxsIHRoZSByZXZpZXcuIEJyaWxsaWFudC4NCj4g
DQo+IEkgYW0gZ2V0dGluZyBmZWQgdXAgd2l0aCBNZWRpYXRlaydzIGFwcHJvYWNoLiBJdCdzIG5v
dCB0aGUgZmlyc3QNCj4gdGltZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+
IA0KDQpIaSBLcnp5c3p0b2YsDQoNCkkgYXBvbG9naXplIHNpbmNlcmVseSBmb3Igb3Zlcmxvb2tp
bmcgZGVzcGl0ZSB5b3VyIG11bHRpcGxlIHJlbWluZGVycy4NClRvIHByZXZlbnQgc2ltaWxhciBp
bmNpZGVudHMsIEkgd2lsbCBlbnN1cmUgYSB0aG9yb3VnaCBzY3J1dGlueSBvZg0KZXZlcnl0aGlu
ZyBpbiBxdWVzdGlvbi4gSSBnZW51aW5lbHkgYXBwcmVjaWF0ZSB5b3VyIHBhdGllbnQgcmV2aWV3
IGFuZA0KZGVlcGx5IHJlZ3JldCBhbnkgaW5jb252ZW5pZW5jZSB0aGlzIG1heSBoYXZlIGNhdXNl
ZCB5b3UuDQoNClNpbmNlcmVseSwNCk1vdWR5DQo=
