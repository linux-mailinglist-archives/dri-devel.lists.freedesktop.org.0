Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B453D7C4F37
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 11:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92D310E4D0;
	Wed, 11 Oct 2023 09:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C9F10E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 09:38:12 +0000 (UTC)
X-UUID: e190fb3e681911ee8051498923ad61e6-20231011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=y+pAeEK5HZG5PlCCT/O0Ih8pnl5I0AkOMARV4r6G/hU=; 
 b=Mwv9Zu1eoYEYiPM0lSMwophME/Cjmd9LCWFaLc/Aa7XR2Vy0hRFYGGH24LEihGiljAbX6rGHSBrTXvKJWi0fwJTKpbZw0wxeglraS4In0HJn6RXdQqyeXFnqFqc6eQ3pF+aNDbHKDxNNEyg2KJx/PTDdyu24Ev3+M9mSkcHLVSg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:a258c6b4-c8f9-4940-959e-711ade222224, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:e5e7cdbf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e190fb3e681911ee8051498923ad61e6-20231011
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1998888273; Wed, 11 Oct 2023 17:38:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Oct 2023 17:38:04 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Oct 2023 17:38:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQpj8d+cCxpCfw7IwUa6bBZWku0KAbTqwxcbLyy7OHOBTKiswgEvZEgwJho0eTTDL46MQ+KsCAWYU/Fo42tYVCOzIyMzf1rc08yFlerUJxhTE93/bXCbyttp4YZCZwtb1DhZ2k1FiLXU7nDjQe/xHxnDBsNxz9949E4WZds8S+9eCxLjjhI4BUGZVzcvoJOPey7iWSxtgYuTDe4WfThyFKZ37hVqPIsqY8FNAZAsYxYMOjCDmWVFS8FVao5boKGDKwmIUUfRHLivo7vkwEaka0reWsmU2PN1EsuFAS/RPDOoniWFA+r5qFgOkiFpXk5Zf1cnJtk8tSUQW6Rt0nDSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgShIJHAIUNnSBi07k9VblH+IbXeQ/Jh2wQ+N9xxspw=;
 b=JiOPBh4ikL3na8SdaWFLtlY5/Y2Ft1QqS/d0b/tQWqruS/tig9MzltrSxEzTeaJJBLO1vrIbJzSAv4wWGAIat6yijS12+toRS4BMb03Tsb7P4uBlGiqfF3NAp6dXaZqv1YfPdYICIytlJA0otX413sZYEZnkYvp5qFtiPvKTU5caMT4uP5VzrEIpEgctmQ7aeY62FpEujd75DowbRfQw/gVahgwQT41P5bt6Qtz3bRGJcwQFTFYrfiUpHsJn+vyTAKisdlXWu00HJuolyGIpHG0kEW0p7K0ltVLXvT0toieviXnNE+vclMiAsGq0f5BTO9RoXPAcIfx9JdjiyxPDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgShIJHAIUNnSBi07k9VblH+IbXeQ/Jh2wQ+N9xxspw=;
 b=v2rJtT70n8gGgli5JlyqTwroEOpLwuzzRgW86GaDdVWI/Bm5uD5RqFBxyYAOvjl3pwQPuDBTUN26YuOEVEbEUGiQDpJ7tP6CI7yM3DKFyL2UbIQstSXkFd4juKTo6+4SmLQGzN5L0pive9AZGdRxRm+b+sN+O9lY6j0TSLnd0Kc=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB5213.apcprd03.prod.outlook.com (2603:1096:405:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Wed, 11 Oct
 2023 09:38:02 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 09:38:02 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 04/11] drm/mediatek: Add OVL compatible name for MT8195
Thread-Topic: [PATCH v2 04/11] drm/mediatek: Add OVL compatible name for MT8195
Thread-Index: AQHZ6gwiJ9IMYcSA5UyotrP5ZCP/fbAgS3iAgAADhACAJCotAA==
Date: Wed, 11 Oct 2023 09:38:02 +0000
Message-ID: <4f16a8ab0b2f5af0bf0d31ad26c83d7ab695c304.camel@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-5-shawn.sung@mediatek.com>
 <ffcf35cb8ca1ff0fe0a0f0176e3199b9c944b3b9.camel@mediatek.com>
 <30cc93a5-b3de-d23f-fd4d-e695551a71e3@collabora.com>
In-Reply-To: <30cc93a5-b3de-d23f-fd4d-e695551a71e3@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB5213:EE_
x-ms-office365-filtering-correlation-id: 40ef0116-3506-43f1-9561-08dbca3dc3c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b05e4hvOzSvlNTG0XKostAf0E52QfHAFwGFCAtFVwc9clLd7IIIsAvVKPjTlnmhu8nBdJyJX5l/pL1IijdzZO/GFfb0kmA4TMWCIC4r5Gwe4gmDFZWocdLy6LSqhNUSW3srrVTFkzZljYuJD1D2vy+GUQuVVODe9dw72b3hgSNBpR82+82UpEvBtF41TpDC3SLlWoM419htLRyU0RemNl4ghSCqK0EOxLqIlejq259ageRMx/ZbafsM80IeUpWe1A5qDowQBKjoYiBo62jh3mI06qYpyLH7NssezY1oW0BSUa4rxjynlrfX2yfudHVQNBh8C560gxSkLoi67BBJQyTpHNCgVaCXgE1Ob5tkoi01Eb4jUuH6eFkRadVZ27UxbDVCHUjUU9f/aKygjSwVycDPhFQB0psPA37unPxuBZS9ez4M3V7HyrsvGwF6Jv4Fa2Uu2zbIPdzypvn419+ryHTselT8UXhw0D7b8R0UwahfYJFpluWURL0yeIhF48p+NO+xXX5MjWuTt+QzHowN0PCCqjE/2jSW2qM0ATJhnPfdP8gyrRF4c2wGSC0GAPnme3VTWuRJU2xqik6XCh6VKqVWTTjuKxVih2AF+oSqg6qjxbDMr12av7Y92U15WGW8+otaUZFthEgcLo0QLN5l5+iNz+KeS2v9VphGr7r5UN/c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6486002)(26005)(6512007)(6506007)(71200400001)(478600001)(41300700001)(38100700002)(76116006)(66946007)(110136005)(2616005)(316002)(64756008)(66446008)(66476007)(66556008)(54906003)(5660300002)(8676002)(8936002)(38070700005)(122000001)(4326008)(7416002)(2906002)(36756003)(85182001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXlRNnJiQkJqYnY5VWhIZTMvMUswL3ZRUWtOdWNabEZOUUVLNjYyM0lNVXEx?=
 =?utf-8?B?VW5FZm5JWXFmVk9md0FESFQ1akVoVkVWUVI0RitaVWxHdnpza1BqSmI1aktO?=
 =?utf-8?B?Y0hGVzljV0NRcXRUSDdDcHhwOGxtY0d1eHh2c0UyVUNCb3BlT1NCVXhXSTR3?=
 =?utf-8?B?cVVWbFBYdVZTVGNEOU1uOGlxS2VsWmc3R0pYOHcyMkh5Zyt1TDc1SzNHdGV2?=
 =?utf-8?B?U3MyYmkyVHBLQnQ3YnpKZnVXeWZOcExmNjFqRklVQ0lLL2x6azJ3ckVhWHZ1?=
 =?utf-8?B?NjZ5aXp1bFptRm51ODhmdUk2TEF2bm1oaDJBWHVoZG8rUjhDckpDTXQ3ckdt?=
 =?utf-8?B?RGV4bHhTdnlNSGxmZjZLOXN4VlZqZWt4eU01MlNsRzI1aXdVaDRidDBld1hL?=
 =?utf-8?B?UGIyOEh4TGg1b3ZwSzExQlJ0Yk8rSEx3QTMwdDV3RlE0L3h6UElKVnVrYkp4?=
 =?utf-8?B?cHhMT2tkTER6RGpSSUVIQUV4clNqK3o3NUJ4cENlOTh3VGN5SVh3L2oySytr?=
 =?utf-8?B?d3VxdS8xWmZ5SUUwTlFIblZhQnB0ZHV0Y2JQWUQ3MEozWXYxVTNxYUErKzVO?=
 =?utf-8?B?TmRTQzVua1lieS9JbGp1R2d0Q2ppNHkrUExhZ0d0bnB6V2l4dCsyWU54dHBx?=
 =?utf-8?B?aDBib015RGp2T2dWZXhVbWNCT21pTCtZM0ttYkczTzd2d2lpN2JxY29oSmsy?=
 =?utf-8?B?d2hoUVBqQjBKanlhWjgwVDAxVGRMM3NDY29kYlBzd0VyNm9nV2t5VE5ZdzJ6?=
 =?utf-8?B?VVdGdWdHVUtVTmFBdU16WlY0NGFsenMrNE9Gck9hNGNxMUM1REE4eGxBamtl?=
 =?utf-8?B?MWdCWEZYbWUxWE56ZE0rUUtJdWxIbHR1amxjR20reWI3L0x1amphNlNxY012?=
 =?utf-8?B?Z3EwaWxnbmhteG5lOEF3ckxVRFJnNURIaS8wRWhJUjF3TSt2cFd0ME9pQkxX?=
 =?utf-8?B?WXpTUURDeVU2b3NKTVFuZjZOZE45VmRNMWsvVzZ2ekx1UndlQ2pqWHJyK0Fr?=
 =?utf-8?B?dDBPWnRaR1dDYnBOTC9RRWtJSzI5eGl0bHZZOElGZm1EWlBSblZsUVlhZi83?=
 =?utf-8?B?bElaOS9TK2tJQTUrYkUvR2xHVTlZTTJ0YWZyMEN2cmJpOFVIUmp0SUpUTnU0?=
 =?utf-8?B?RnZ6RzNnektXQmZPUm5PbHZMTHhEd0NNMS95TFczNDF3cW1va2EwVUFYekxo?=
 =?utf-8?B?cERMNlFKdjJoSXBEQXd6eXJYR0NiYnJHNk9YNnVvRVYxcEN2TkFrVkNIdDl3?=
 =?utf-8?B?WEdhWFRubFNBK1lJU0hKS3I3OEppZTYrVTJwMlBKeTJETk9wMXBMY25NZ3Iy?=
 =?utf-8?B?ZXpSMWl5d2ZTcmJyVDFJQnNmdjNNYlc0YWZiOXEvRWFocTJ4clBEYXFuMlNp?=
 =?utf-8?B?R05XcExtUHFzYU1xRkgydlNrU1lVUUlOV3R0akdidXIzLzMvWk81SWlneEVX?=
 =?utf-8?B?WWkzdzJENVNEYU9kaWdUbkJ6Y3JuWkpVTmkvcDNPUExoeWdqOGthL2piZ1Zi?=
 =?utf-8?B?NlVvRVEyQno5VWg0aHQ5d0FOL1BXUGhXbysxeGtjQkZXcTRyMFBuNTdQZ2cv?=
 =?utf-8?B?VVNHeDl4dlJVT1c3SUhmVm5DelloRFJOaWxMTGw2Z0NkV0dGUTMxUHk4TWpz?=
 =?utf-8?B?Uk50UDk0WTdIcDR5anlSd1ZTM2w2emcxUlJrOGF4WGVsTVIxM3dLQUxDbFht?=
 =?utf-8?B?R0o5dldSZWlvT3lPeVFIOXJNbVZlMUl6eVIxVW9QYmdNOWZ4d2FLTGpGNVJt?=
 =?utf-8?B?dUREN2hDeHlXdVJsN21NVGRQRU1WUnZHQTB6c2pNR1FWc0lBSlcxUmsrZjFl?=
 =?utf-8?B?eFNIcmJzMWlTVStEZ241aUFwcG5VMzdaL29TSWRTRndZbnhlYU8vQUN4elpu?=
 =?utf-8?B?TnhWbHhDZVk2QzRuN2o5SjdWd0NtWjdGRm5Ed1IyanBFZXczblZXeWhzeTlQ?=
 =?utf-8?B?eGh2Y1JTNGlTT0wrVzB6VW0wcGRmRWl5QW0yTDQxdGZxRDRWRndtOHY4ZmFy?=
 =?utf-8?B?N0MxMXRodnVuQ2EzelFjeGgvN2FDY0xqeWZyVWV1TTRDcjhGMmFDMk9haVhD?=
 =?utf-8?B?aWl1eXhnYzBKQlJSUUxIR2dBMi84T0loYnNGSG81bmY1QmpiQmNja0hYYjJn?=
 =?utf-8?B?SThWMlhTRXRaZjFrbTRzTWUvVVRqQTAzSzJ6djJwNnIyZWNqVDNyWi8yeENS?=
 =?utf-8?B?YUE9PQ==?=
Content-ID: <5B3EB74A5CEFE94EA739D87B0CD234F0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef0116-3506-43f1-9561-08dbca3dc3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 09:38:02.9221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSRj/7LszuUiuM2LSk8N8/kUT8xspocYQaZCI67X24sdJhWeBiy8zQmYKUXUULgyl6SOdBYMLTflfdfiEf7UEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5213
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.051700-8.000000
X-TMASE-MatchedRID: F7tLedRt7ifUL3YCMmnG4t7SWiiWSV/1YefZ7F9kLgsNcckEPxfz2OLB
 DcjMHcx7UmsNbSHn8eCHw1K447s2NVhdPEiZHlm8Y1bQMCMvmn64vBuE2X0HleOxOq7LQlGLGJ4
 tqoRyLskNDfGmw9mdvh3l7vlEbA5torXvpLj1Q0cVglQa/gMvfDoSfZud5+GgYmQk5BUIinBWFs
 MQfbcNE3suQxnfs9eeEA2YfbVfiNEYB2fOueQzj9IFVVzYGjNKcmfM3DjaQLHEQdG7H66TyOk/y
 0w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.051700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7432D7D9D4FFF54C10EAD33081E2588EA8431D04A3850438AF65520505DC7E722000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_869059180.2015479018"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_869059180.2015479018
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvJiMzMjthbmQmIzMyO0NLLA0KDQpPbiYjMzI7TW9uLCYjMzI7
MjAyMy0wOS0xOCYjMzI7YXQmIzMyOzExOjIxJiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hp
bm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7SWwmIzMyOzE4LzA5LzIz
JiMzMjsxMTowOSwmIzMyO0NLJiMzMjtIdSYjMzI7KCYjMzI5OTM7JiMyMDQyNjsmIzIwODA5Oykm
IzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO01vbiwmIzMyOzIw
MjMtMDktMTgmIzMyO2F0JiMzMjsxNjo0MiYjMzI7KzA4MDAsJiMzMjtIc2lhbyYjMzI7Q2hpZW4m
IzMyO1N1bmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7QWRkJiMzMjtP
VkwmIzMyO2NvbXBhdGlibGUmIzMyO25hbWUmIzMyO2ZvciYjMzI7TVQ4MTk1Lg0KJmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYj
MzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7YnV0JiMzMjtpdCYjMzk7cyYjMzI7d2VpcmQmIzMyO3RvJiMzMjtwdXQmIzMy
O3RoaXMmIzMyO3BhdGNoJiMzMjtpbnRvJiMzMjtJR1QmIzMyO3Nlcmllcy4mIzMyO1dpdGhvdXQm
IzMyO3RoaXMNCiZndDsmIzMyOyZndDsmIzMyO3BhdGNoLA0KJmd0OyYjMzI7Jmd0OyYjMzI7bXQ4
MTk1JiMzMjtkcm0mIzMyO2RyaXZlciYjMzI7ZG9lcyYjMzI7bm90JiMzMjt3b3JrJiMzMjtub3Qm
IzMyO29ubHkmIzMyO0lHVC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtUaGUmIzMyO2RyaXZlciYjMzI7ZG9lcyYjMzI7d29yayYjMzI7YmVjYXVzZSYjMzI7dGhlJiMz
MjtkZXZpY2V0cmVlJiMzMjtub2RlJiMzMjtkZWNsYXJlcyYjMzI7dHdvDQomZ3Q7JiMzMjtjb21w
YXRpYmxlcywNCiZndDsmIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1kaXNwLW92bCZxdW90Oywm
IzMyOyZxdW90O21lZGlhdGVrLG10ODE4My1kaXNwLW92bCZxdW90OyYjMzI7d2hlcmUmIzMyO3Ro
ZQ0KJmd0OyYjMzI7c2Vjb25kDQomZ3Q7JiMzMjtjb21wYXRpYmxlJiMzMjtpcyYjMzI7bWF0Y2hl
ZCYjMzI7aW4mIzMyO210a19kcm1fZHJ2LCYjMzI7YW5kJiMzMjt0aGUmIzMyO2ZpcnN0JiMzMjtp
cyYjMzI7bWF0Y2hlZCYjMzI7aW4NCiZndDsmIzMyO210a19kaXNwX292bA0KJmd0OyYjMzI7YXMm
IzMyO2JvdGgmIzMyO2FyZSYjMzI7cGxhdGZvcm1fZHJpdmVyLg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtUaGlzJiMzMjtjb21taXQmIzMyO2lzJiMzMjtub3QmIzMyO25lY2Vzc2FyeSwmIzMyO2V2ZW4u
Li4mIzMyOzotKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7QW5nZWxv
DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtDSw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hp
ZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMy
OyZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsm
IzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMzMjt8JiMzMjsyJiMz
MjsrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMy
O2NoYW5nZWQsJiMzMjsyJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7OTM1NTJkNzZiNmU3Li43NzU5YTA2ZTVjMGUm
IzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNzE1LDYmIzMyOys3MTUsOCYjMzI7QEAmIzMy
O3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNlX2lkDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjttdGtfZGRwX2NvbXBfZHRfaWRzW10mIzMyOz0mIzMyO3sNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMy
Oyh2b2lkJiMzMjsqKU1US19ESVNQX09WTCYjMzI7fSwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOyYjMzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWss
bXQ4MTkyLWRpc3Atb3ZsJnF1b3Q7LA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMyOyopTVRLX0RJU1BfT1ZMJiMz
Mjt9LA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7K3smIzMyOy5jb21wYXRpYmxlJiMzMjs9
JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwmcXVvdDssDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsodm9pZCYjMzI7KilNVEtf
RElTUF9PVkwmIzMyO30sDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7eyYj
MzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4My1kaXNwLW92bC0y
bCZxdW90OywNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
LmRhdGEmIzMyOz0mIzMyOyh2b2lkJiMzMjsqKU1US19ESVNQX09WTF8yTCYjMzI7fSwNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYj
MzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTkyLWRpc3Atb3ZsLTJsJnF1b3Q7LA0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCg0KUGxlYXNlJiMzMjtyZWZlciYjMzI7dG8mIzMyO2M2YWE1ZjFmYjUwNS4mIzMy
O1RoaXMmIzMyO2lzJiMzMjt0aGUmIzMyO21haW4mIzMyO3JlYXNvbiYjMzI7d2h5JiMzMjt3ZSYj
MzI7aGF2ZSYjMzI7dG8NCnVzZSYjMzI7TVQ4MTk1JiMzMjtpbnN0ZWFkJiMzMjtvZiYjMzI7TVQ4
MTgzL01UODE5Mi4mIzMyO01vc3QmIzMyO29mJiMzMjt0aGUmIzMyO2Zvcm1hdHMmIzMyO3JlcXVp
cmVkJiMzMjtieQ0KSUdUJiMzMjtpcyYjMzI7bm90JiMzMjtzdXBwb3J0ZWQuDQoNCldpdGhvdXQm
IzMyO3RoaXMmIzMyO2NvbW1pdCwmIzMyO0RSTSYjMzI7d29uJiMzOTt0JiMzMjt3b3JrJiMzMjth
ZnRlciYjMzI7Y2hhbmdpbmcmIzMyO3RoZSYjMzI7Y29tcGF0aWJsZSYjMzI7bmFtZSYjMzI7DQpv
ZiYjMzI7b3ZsMCYjMzI7dG8mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1kaXNwLW92bCZxdW90
OyYjMzI7aW4mIzMyO3RoZSYjMzI7ZHRzLg0KDQpUaGFua3MsDQpTaGF3bg0KDQo8L3ByZT48IS0t
dHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50
aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMp
IG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndp
c2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50
KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNo
bWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQg
YW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGll
bnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVs
eSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVz
IG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBz
eXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRv
IGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_869059180.2015479018
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbyBhbmQgQ0ssDQoNCk9uIE1vbiwgMjAyMy0wOS0xOCBhdCAxMToyMSArMDIwMCwg
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IElsIDE4LzA5LzIzIDExOjA5LCBD
SyBIdSAo6IOh5L+K5YWJKSBoYSBzY3JpdHRvOg0KPiA+IE9uIE1vbiwgMjAyMy0wOS0xOCBhdCAx
Njo0MiArMDgwMCwgSHNpYW8gQ2hpZW4gU3VuZyB3cm90ZToNCj4gPiA+IEFkZCBPVkwgY29tcGF0
aWJsZSBuYW1lIGZvciBNVDgxOTUuDQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gYnV0IGl0J3Mgd2VpcmQgdG8gcHV0IHRoaXMgcGF0
Y2ggaW50byBJR1Qgc2VyaWVzLiBXaXRob3V0IHRoaXMNCj4gPiBwYXRjaCwNCj4gPiBtdDgxOTUg
ZHJtIGRyaXZlciBkb2VzIG5vdCB3b3JrIG5vdCBvbmx5IElHVC4NCj4gPiANCj4gDQo+IFRoZSBk
cml2ZXIgZG9lcyB3b3JrIGJlY2F1c2UgdGhlIGRldmljZXRyZWUgbm9kZSBkZWNsYXJlcyB0d28N
Cj4gY29tcGF0aWJsZXMsDQo+ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwiLCAibWVkaWF0ZWss
bXQ4MTgzLWRpc3Atb3ZsIiB3aGVyZSB0aGUNCj4gc2Vjb25kDQo+IGNvbXBhdGlibGUgaXMgbWF0
Y2hlZCBpbiBtdGtfZHJtX2RydiwgYW5kIHRoZSBmaXJzdCBpcyBtYXRjaGVkIGluDQo+IG10a19k
aXNwX292bA0KPiBhcyBib3RoIGFyZSBwbGF0Zm9ybV9kcml2ZXIuDQo+IA0KPiBUaGlzIGNvbW1p
dCBpcyBub3QgbmVjZXNzYXJ5LCBldmVuLi4uIDotKQ0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxv
DQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+ID4gPiAt
LS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyICsr
DQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4gPiBpbmRleCA5
MzU1MmQ3NmI2ZTcuLjc3NTlhMDZlNWMwZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiA+ID4gQEAgLTcxNSw2ICs3MTUsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+ID4gbXRrX2RkcF9jb21wX2R0X2lkc1tdID0g
ew0KPiA+ID4gICAJICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfT1ZMIH0sDQo+ID4gPiAgIAl7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kaXNwLW92bCIsDQo+ID4gPiAgIAkgIC5k
YXRhID0gKHZvaWQgKilNVEtfRElTUF9PVkwgfSwNCj4gPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwiLA0KPiA+ID4gKwkgIC5kYXRhID0gKHZvaWQgKilNVEtf
RElTUF9PVkwgfSwNCj4gPiA+ICAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRp
c3Atb3ZsLTJsIiwNCj4gPiA+ICAgCSAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTF8yTCB9
LA0KPiA+ID4gICAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZGlzcC1vdmwtMmwi
LA0KPiANCj4gDQoNClBsZWFzZSByZWZlciB0byBjNmFhNWYxZmI1MDUuIFRoaXMgaXMgdGhlIG1h
aW4gcmVhc29uIHdoeSB3ZSBoYXZlIHRvDQp1c2UgTVQ4MTk1IGluc3RlYWQgb2YgTVQ4MTgzL01U
ODE5Mi4gTW9zdCBvZiB0aGUgZm9ybWF0cyByZXF1aXJlZCBieQ0KSUdUIGlzIG5vdCBzdXBwb3J0
ZWQuDQoNCldpdGhvdXQgdGhpcyBjb21taXQsIERSTSB3b24ndCB3b3JrIGFmdGVyIGNoYW5naW5n
IHRoZSBjb21wYXRpYmxlIG5hbWUgDQpvZiBvdmwwIHRvICJtZWRpYXRlayxtdDgxOTUtZGlzcC1v
dmwiIGluIHRoZSBkdHMuDQoNClRoYW5rcywNClNoYXduDQo=

--__=_Part_Boundary_007_869059180.2015479018--

