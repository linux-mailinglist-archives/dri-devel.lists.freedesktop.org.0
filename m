Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3FA79C6C5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 08:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DF710E33B;
	Tue, 12 Sep 2023 06:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7C510E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 06:17:31 +0000 (UTC)
X-UUID: 0b75b89c513411ee8051498923ad61e6-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=1vRhhwOTRiseG5kdq/DHmly5hOHzkotoMCp0W3OYKaM=; 
 b=WAJODgpUtTa2zKfIDw+s1xErakWlQsMRfaBIOPuKOi/v3wUXYUj8Hs3ksLPzTp2/247n4GTQjskHsh/npzgQDLBB/XadiIlNKIgb/JLfCmUIvX4oceo4O4gmS4d00ocAn5cVUq3ThUMefidAUeqCAj09P/svG7ss/Pa+8ytvP+s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:985624d4-a95d-43be-82f5-23599d5a5717, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:7d64ecc2-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b75b89c513411ee8051498923ad61e6-20230912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 160188933; Tue, 12 Sep 2023 14:17:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 14:17:26 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 14:17:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/Ydwy5sRR5YzV6kv9JvwXkAiSv98c5+vJQIc8j1/a08nACd1gN1yzEfzGnpPntZkwxAIRFp3ZFb9w2+goWkO2d1d5UNLOw0fMkbX8+PQUT9BOHiTK5thr4fcm7D1LEyQ4fqGB4vwsaB+co61JKKTwjvUV3nMAKUdULFVwwiGadlSNPuvqs/C8ieeYy6tCZxZ9op4xHqp5AmBr/ayMhGWI4Zx9cjqeLsUnCPI2EThbeo7ZCrypY5lfX9QWHMfYRetdeWA73U98U8x/4EhUmOqv+2l7c5u6qiV66ynxcGtQuYq7PTvCHV6HOkhE6XRzCIeEFbJm74uxHZWlfoqJ075g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vRhhwOTRiseG5kdq/DHmly5hOHzkotoMCp0W3OYKaM=;
 b=ThAjPX/wkkgW4xoNn1pbkDest1helu08OT2oP93fX6Er5I4DUOH/65s1HDJ+czl1Wjw5l4O9iG7X/dPXiTXpxdNF9JRPEB73MCusAQdCF9rWuMvQ/Gd/rMxEGT1NabqLY5MHIElyUdqtErmfX/dT/CeMjqKUwnEsKPU3uQr0e2+nfonyTlYCV7I8RqoZ7RAkfleJWQemLm5/tSaKIWxQFJRX9I5VqBDQ37NU6bziO5lAV9t/GH7WR2heV3c1/zW+iTgi+WBrwYJ2GtJ7zMqrDdK/fS7I6ur3MAsT14enG6kaSfTPNKgA+IS1RM3t8buI+2qlfLeJh0A2hYW2XclKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vRhhwOTRiseG5kdq/DHmly5hOHzkotoMCp0W3OYKaM=;
 b=aw0MjNvhwsVMXVl4dCoAfn6pdz8dHInXs/ELct0SIqemEJE3z45iRjnGnwYFSkjm/73Ic2lqDFC2LXBMXkxLmRV3EDPVbrb+VWKug+6BAG8XiQNHSzmV2t9bKKqbJbFcNo8IiUZE4YPj/i++eHidzQPOSyTRjUaSHVCvXc/MR0g=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEYPR03MB6697.apcprd03.prod.outlook.com (2603:1096:101:80::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.38; Tue, 12 Sep 2023 06:17:22 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 06:17:22 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Thread-Topic: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Thread-Index: AQHZ5FgkdSQ5OiqhjEmEvtpYDF+5QrAVXDQAgAFcr4A=
Date: Tue, 12 Sep 2023 06:17:22 +0000
Message-ID: <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
In-Reply-To: <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEYPR03MB6697:EE_
x-ms-office365-filtering-correlation-id: 4651c811-7acb-4711-5bcf-08dbb357ecee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rsmcIJK3eUdIG89ampRvw102ydXRX1+E2LjPvaGMtR4pTM2ZsoixyoYfJ9r0kKoRiGH+uheDzLcXeyESMyl7xJEXEzWEOz4H+bt4tw/z4ZcK+YF8Hx7gcS6wh41MwRTdO+RJDDujql6tY/o3GqijLs3cOBfHyR9vBMUEe5msONKqiNUBAjkBS2+3KS0bsq/ypOIikZhAeXMXGCGoKvprZXHJ42wQG+Oe+xixR0otXiFFh05NFqhedAz5Fm73EvzMr69dAkg1C3VqJZsDkQis2dquILp9sOxEroYRO883GgY5aPxNHMw5GoIteFyfcTZ6aQIu93eZyxL8R8xLrTH5HXLAe+pb/y8/EbKSzRp1B8+f2/Wc15nsNd2oVDe6i+onjGt2SL95kTaBBXgiRZ9D/Ka2lnF2Ls3G6TUo1GkswX9kfqXc8x1gsyyk/G7jK4GPywOnqd3oC81fgcvd9XukTd+kS3iJ06glHKxBsA6KkMtL0S1RpM7MtFYoN4sJunX62fvVuWw2hKJ6jt2kjS+0qlQMLttnBCJESS18y7kuVlusg451SYElKXjDNgB1iVg6C3iw+nKLAoQ+mygmeiA+K/Gu0OA2tPkk1MOVXGb3FbcfdOpYuU8M5DxtK/gubFHexNO9wluEe2BYo6+XZayJ53+TRaypcl1FDeBtN/MIrTe1g2b4K5V0uuYoECrjcN1a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(186009)(1800799009)(451199024)(8676002)(4326008)(2906002)(8936002)(66476007)(66556008)(41300700001)(76116006)(110136005)(66946007)(38070700005)(91956017)(38100700002)(316002)(66446008)(64756008)(54906003)(7416002)(122000001)(5660300002)(478600001)(86362001)(71200400001)(6506007)(6486002)(2616005)(6512007)(85182001)(36756003)(26005)(83380400001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTFlMmlPVzB5dzFjV01SZFB2ekVseHloNW11amViTVBxR1RBUjByUVJaaUUx?=
 =?utf-8?B?aDZKbm5nY0p2a1VyWkxpLzNsWUQyVExiSGJpdmpsK3MvMUJoeWhid2ZZamxX?=
 =?utf-8?B?YXlycmxYOHhVNXNZNkk1cFhYUFdkdHlmWFRQaGp2L0d6dWdvRW1nRUdNVWda?=
 =?utf-8?B?VGJqN0ttZ2pwdVlWN2NkZUdGMldkcTI2SDNGK043eVNReU9ZeE1sVmdlMmZN?=
 =?utf-8?B?MVBwdmdiMXZ4K1FhN3RTTkRra2h0dFBCWU1BTjk5a0Y5RXBRclQvWlhRWkM0?=
 =?utf-8?B?UVkwMDMyZGxkeFBvUGxNRXNpQTZERDJ4YkJ6dTNtRnB5THBPbitLWmRueEVM?=
 =?utf-8?B?eGxNZTVkd1ZHUDYwVnA5d3RsaktZZGhueE9TTmJkOWlKRVF1K0pUMWVKNDdt?=
 =?utf-8?B?K242SlZ1UTdnR0dkOTc3SEprQ1NCWE1VTTNDM0RYYlczRmczRGpJNHcrR2p5?=
 =?utf-8?B?UXY3c3ZGWWl0WFowNEdhKzljM014UFcxc2h3M0pkeElvNWNkMmg3Mzc1OHc0?=
 =?utf-8?B?ekRFTjEwZzlhTWxMUStwVFh5aG9QZkFrTms1ekRUSGN0NkpldmFwTG12VU84?=
 =?utf-8?B?aDBXbm0xT3Jia0hwZEJUU2Q1Z2RDbVlRMk1sQzNvQ29DSFNIYi9sZUxyclVT?=
 =?utf-8?B?Mk5BcVJzUVFwemkyeFZsdG85M1ZtZGNrQXNzanB0ZTlycmVJUDErL21qQkFV?=
 =?utf-8?B?eFhlOTZuU2tlaU9zWHpaUFErbnRLRmVjMGtxamZpMjBqVGhjOFl3Rit0VldX?=
 =?utf-8?B?UHZrcWx3Rm9COUE2eGpPRXNPTisvTXdteVdjMEhVa1VOQW5BN2xjWUlYbjMw?=
 =?utf-8?B?S3cvNFRsT0d3TUpSN3FidGROVndiY1prakpHL0Z5SmU0U1FPb09IRERRcUc0?=
 =?utf-8?B?SmE4dUt4dHYvUFMzU05KQnlFOGg2eWg1OStaS0R5dnc5WWxJbFBrdG1JYitQ?=
 =?utf-8?B?dFl0MVRGSjVSMmVoUW5ZT24yU3MrQ3hrWVgyM2UvN28xc3F2TkFuZGwzU093?=
 =?utf-8?B?NkZtdlFZekhEZlNQL1M3QzRrSEw1VklQR1FiOFI1VURWQ3JDUmVXbEE4Z244?=
 =?utf-8?B?eEg0K3N1eFVWMnpJb0NqSlpwdm9qVHZ2azdUbUxNZFR4MVBPTHNaV0MvRDd0?=
 =?utf-8?B?ck1hSThMOGx5SmtJSDRxNys5bEtVdktJYW1oTXpzOVNnY2NHcFkvOTUxN0pD?=
 =?utf-8?B?LytweDBuSlZiblhwL1U3TVV2Syt0VU5pMDJXRUJPUGNYTHpibGpvUGh0cUJo?=
 =?utf-8?B?UTdTTlA4MnpDbUxzSm1uZG1LZ2RpTkM0V3dWb2JjdS9xYzFLY3FUVVJaeXJu?=
 =?utf-8?B?dmpycnBqU1BBZUZNYmlxUFMwVURsb3pEcHcveVpGRTY4QmVpVHEraUlTUXRx?=
 =?utf-8?B?YVJPWXRDRTRjdDZRMFJCczNEVVc2dHVHSm1JTzBBQ3BoK2lvay9LcjJNQWtJ?=
 =?utf-8?B?N2x0TjRrWEQrcU1DeEJRL280T3llRkVlVGs4bGd2YnBQUDBwTjA5eDhmNWpI?=
 =?utf-8?B?LzlMeDFTR2MyN2lOL2V4bWFFTHhhcHBiQVlSMmJvQ0VmTlFWOXEvVzNMYnF6?=
 =?utf-8?B?Q2lkdExOazlIVmRUUG9ZbXl3Qk5tMW00bFMzRmd5TUczaUNISmM1NnlRU2ky?=
 =?utf-8?B?T05WaVdHRVZQQnBUMWdwaGlUZy9GY1h1emdHSURYWEJIaVJYUmRKQlBhWGxM?=
 =?utf-8?B?bWtrUjIrMytkdWNmSWVhRFpwd09ZMWpmZXZqcURlNWcwc2dEUFRSb2R0elR2?=
 =?utf-8?B?WUZkeGoxRWIyd1E3cUxjZnh2V1czalF1c0hxWDVMZUtNYVN5ZVRYcTg5ZmU0?=
 =?utf-8?B?OEtlY1lGUTRuWklCL3BxYTVkY2lrK29UREtkcTUvam5QKzFLMWtDc2JXdDJH?=
 =?utf-8?B?NWVNYnRDd3VEVVA4Ni9XemQ1cjE3d1FaVm0xMDA3bzJFbm1ZNktjdFo2a1F5?=
 =?utf-8?B?blY3cWZBTGF2blV3U2FjUHdyR2FaR0pqejRmYUdoQm9vRjRtcUpQU1U1OVUx?=
 =?utf-8?B?akpORjZOak11TzJUQ2tDSWJKeWlxbnN5aTVkaDVqLzMza0ZPUXlpTHhuc201?=
 =?utf-8?B?Q1RYWEZJTFVFZko3NTBVVW9jU2JjNkc5V0N5KzRGbTRZREZXdmFvU2NwYk5E?=
 =?utf-8?B?ZjJlQ1k3WXdNUy9OVkRRa21rS2dtaWxhK1dja04yN2pPZlcvRWtYV0JhOTNx?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <227914B193ED3340A02F0A2AC44E8280@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4651c811-7acb-4711-5bcf-08dbb357ecee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 06:17:22.1055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guGMGRvsBE3/7KxMjKLIlH3Hf2RaEZlZmH66oAmT6MVNGaLdHi6fVk7ndo8uUqGRm1rANGHs4QKHK6RwWcGETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6697
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA5LTExIGF0IDExOjI5ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTEvMDkvMjMgMDQ6MzAsIFlvbmcgV3UgaGEgc2NyaXR0bzoNCj4g
PiBUaGUgVEVFIHByb2JlIGxhdGVyIHRoYW4gZG1hLWJ1ZiBoZWFwLCBhbmQgUFJPQkVfREVERVIg
ZG9lc24ndCB3b3JrDQo+ID4gaGVyZSBzaW5jZSB0aGlzIGlzIG5vdCBhIHBsYXRmb3JtIGRyaXZl
ciwgdGhlcmVmb3JlIGluaXRpYWxpc2UgdGhlDQo+ID4gVEVFDQo+ID4gY29udGV4dC9zZXNzaW9u
IHdoaWxlIHdlIGFsbG9jYXRlIHRoZSBmaXJzdCBzZWN1cmUgYnVmZmVyLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL210a19zZWN1cmVfaGVhcC5jIHwgNjENCj4gPiArKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9u
cygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvbXRrX3Nl
Y3VyZV9oZWFwLmMgYi9kcml2ZXJzL2RtYS0NCj4gPiBidWYvaGVhcHMvbXRrX3NlY3VyZV9oZWFw
LmMNCj4gPiBpbmRleCBiYmYxYzhkY2UyM2UuLmUzZGEzM2EzZDA4MyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvbXRrX3NlY3VyZV9oZWFwLmMNCj4gPiArKysgYi9kcml2
ZXJzL2RtYS1idWYvaGVhcHMvbXRrX3NlY3VyZV9oZWFwLmMNCj4gPiBAQCAtMTAsNiArMTAsMTIg
QEANCj4gPiAgICNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gKyNpbmNsdWRlIDxs
aW51eC90ZWVfZHJ2Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC91dWlkLmg+DQo+ID4gKw0KPiA+
ICsjZGVmaW5lIFRaX1RBX01FTV9VVUlECQkiNDQ3NzU4OGEtODQ3Ni0xMWUyLWFkMTUtDQo+ID4g
ZTQxZjEzOTBkNjc2Ig0KPiA+ICsNCj4gDQo+IElzIHRoaXMgVVVJRCB0aGUgc2FtZSBmb3IgYWxs
IFNvQ3MgYW5kIGFsbCBUWiB2ZXJzaW9ucz8NCg0KWWVzLiBJdCBpcyB0aGUgc2FtZSBmb3IgYWxs
IFNvQ3MgYW5kIGFsbCBUWiB2ZXJzaW9ucyBjdXJyZW50bHkuDQoNCj4gDQo+IFRoYW5rcywNCj4g
QW5nZWxvDQo+IA0KPiANCj4gPiArI2RlZmluZSBNVEtfVEVFX1BBUkFNX05VTQkJNA0KPiA+ICAg
DQo+ID4gICAvKg0KPiA+ICAgICogTWVkaWFUZWsgc2VjdXJlIChjaHVuaykgbWVtb3J5IHR5cGUN
Cj4gPiBAQCAtMjgsMTcgKzM0LDcyIEBAIHN0cnVjdCBtdGtfc2VjdXJlX2hlYXBfYnVmZmVyIHsN
Cj4gPiAgIHN0cnVjdCBtdGtfc2VjdXJlX2hlYXAgew0KPiA+ICAgCWNvbnN0IGNoYXIJCSpuYW1l
Ow0KPiA+ICAgCWNvbnN0IGVudW0ga3JlZV9tZW1fdHlwZSBtZW1fdHlwZTsNCj4gPiArCXUzMgkJ
CSBtZW1fc2Vzc2lvbjsNCj4gPiArCXN0cnVjdCB0ZWVfY29udGV4dAkqdGVlX2N0eDsNCj4gPiAg
IH07DQo+ID4gICANCj4gPiArc3RhdGljIGludCBtdGtfb3B0ZWVfY3R4X21hdGNoKHN0cnVjdCB0
ZWVfaW9jdGxfdmVyc2lvbl9kYXRhICp2ZXIsDQo+ID4gY29uc3Qgdm9pZCAqZGF0YSkNCj4gPiAr
ew0KPiA+ICsJcmV0dXJuIHZlci0+aW1wbF9pZCA9PSBURUVfSU1QTF9JRF9PUFRFRTsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBtdGtfa3JlZV9zZWN1cmVfc2Vzc2lvbl9pbml0KHN0
cnVjdCBtdGtfc2VjdXJlX2hlYXANCj4gPiAqc2VjX2hlYXApDQo+ID4gK3sNCj4gPiArCXN0cnVj
dCB0ZWVfcGFyYW0gdF9wYXJhbVtNVEtfVEVFX1BBUkFNX05VTV0gPSB7MH07DQo+ID4gKwlzdHJ1
Y3QgdGVlX2lvY3RsX29wZW5fc2Vzc2lvbl9hcmcgYXJnID0gezB9Ow0KPiA+ICsJdXVpZF90IHRh
X21lbV91dWlkOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlzZWNfaGVhcC0+dGVlX2N0
eCA9IHRlZV9jbGllbnRfb3Blbl9jb250ZXh0KE5VTEwsDQo+ID4gbXRrX29wdGVlX2N0eF9tYXRj
aCwNCj4gPiArCQkJCQkJICAgIE5VTEwsIE5VTEwpOw0KPiA+ICsJaWYgKElTX0VSUihzZWNfaGVh
cC0+dGVlX2N0eCkpIHsNCj4gPiArCQlwcl9lcnIoIiVzOiBvcGVuIGNvbnRleHQgZmFpbGVkLCBy
ZXQ9JWxkXG4iLCBzZWNfaGVhcC0NCj4gPiA+bmFtZSwNCj4gPiArCQkgICAgICAgUFRSX0VSUihz
ZWNfaGVhcC0+dGVlX2N0eCkpOw0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCWFyZy5udW1fcGFyYW1zID0gTVRLX1RFRV9QQVJBTV9OVU07DQo+ID4gKwlhcmcu
Y2xudF9sb2dpbiA9IFRFRV9JT0NUTF9MT0dJTl9QVUJMSUM7DQo+ID4gKwlyZXQgPSB1dWlkX3Bh
cnNlKFRaX1RBX01FTV9VVUlELCAmdGFfbWVtX3V1aWQpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiAr
CQlnb3RvIGNsb3NlX2NvbnRleHQ7DQo+ID4gKwltZW1jcHkoJmFyZy51dWlkLCAmdGFfbWVtX3V1
aWQuYiwgc2l6ZW9mKHRhX21lbV91dWlkKSk7DQo+ID4gKw0KPiA+ICsJcmV0ID0gdGVlX2NsaWVu
dF9vcGVuX3Nlc3Npb24oc2VjX2hlYXAtPnRlZV9jdHgsICZhcmcsDQo+ID4gdF9wYXJhbSk7DQo+
ID4gKwlpZiAocmV0IDwgMCB8fCBhcmcucmV0KSB7DQo+ID4gKwkJcHJfZXJyKCIlczogb3BlbiBz
ZXNzaW9uIGZhaWxlZCwgcmV0PSVkOiVkXG4iLA0KPiA+ICsJCSAgICAgICBzZWNfaGVhcC0+bmFt
ZSwgcmV0LCBhcmcucmV0KTsNCj4gPiArCQlyZXQgPSAtRUlOVkFMOw0KPiA+ICsJCWdvdG8gY2xv
c2VfY29udGV4dDsNCj4gPiArCX0NCj4gPiArCXNlY19oZWFwLT5tZW1fc2Vzc2lvbiA9IGFyZy5z
ZXNzaW9uOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtjbG9zZV9jb250ZXh0Og0KPiA+
ICsJdGVlX2NsaWVudF9jbG9zZV9jb250ZXh0KHNlY19oZWFwLT50ZWVfY3R4KTsNCj4gPiArCXJl
dHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgc3RydWN0IGRtYV9idWYgKg0K
PiA+ICAgbXRrX3NlY19oZWFwX2FsbG9jYXRlKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCwgc2l6ZV90
IHNpemUsDQo+ID4gICAJCSAgICAgIHVuc2lnbmVkIGxvbmcgZmRfZmxhZ3MsIHVuc2lnbmVkIGxv
bmcgaGVhcF9mbGFncykNCj4gPiAgIHsNCj4gPiArCXN0cnVjdCBtdGtfc2VjdXJlX2hlYXAgKnNl
Y19oZWFwID0gZG1hX2hlYXBfZ2V0X2RydmRhdGEoaGVhcCk7DQo+ID4gICAJc3RydWN0IG10a19z
ZWN1cmVfaGVhcF9idWZmZXIgKnNlY19idWY7DQo+ID4gICAJREVGSU5FX0RNQV9CVUZfRVhQT1JU
X0lORk8oZXhwX2luZm8pOw0KPiA+ICAgCXN0cnVjdCBkbWFfYnVmICpkbWFidWY7DQo+ID4gICAJ
aW50IHJldDsNCj4gPiAgIA0KPiA+ICsJLyoNCj4gPiArCSAqIFRFRSBwcm9iZSBtYXkgYmUgbGF0
ZS4gSW5pdGlhbGlzZSB0aGUgc2VjdXJlIHNlc3Npb24gaW4gdGhlDQo+ID4gZmlyc3QNCj4gPiAr
CSAqIGFsbG9jYXRpbmcgc2VjdXJlIGJ1ZmZlci4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKCFzZWNf
aGVhcC0+bWVtX3Nlc3Npb24pIHsNCj4gPiArCQlyZXQgPSBtdGtfa3JlZV9zZWN1cmVfc2Vzc2lv
bl9pbml0KHNlY19oZWFwKTsNCj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJCQlyZXR1cm4gRVJSX1BU
UihyZXQpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgIAlzZWNfYnVmID0ga3phbGxvYyhzaXplb2Yo
KnNlY19idWYpLCBHRlBfS0VSTkVMKTsNCj4gPiAgIAlpZiAoIXNlY19idWYpDQo+ID4gICAJCXJl
dHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiANCj4gDQo=
