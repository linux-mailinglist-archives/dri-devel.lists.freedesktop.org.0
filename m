Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726127AFEB2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 10:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40B410E49F;
	Wed, 27 Sep 2023 08:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E8610E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 08:35:47 +0000 (UTC)
X-UUID: d7b6229c5d1011eea33bb35ae8d461a2-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=B6EcI6pwq41c5qZJudUyPapHZhrkI+jC1g/YQpzskdw=; 
 b=ZB9vliwd2g+MkU8NBnUYNSAb2hby3Lf/lX+fL3My7+pxclAh3/3/uNMqpD7hc/zco4PMsmXb0JXbKz6dtXt5pBr2dpMt0f2lCfv04t0eMOqYc+VOQ1Cm+hIbeBgrNWyvDrwpCMdf2jsj9LCBDKy6YHvscSn404x0FdfzQXjR17M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:fca9f46d-7708-4166-80cf-35daf6f32182, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:5f78ec9, CLOUDID:f2f930f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d7b6229c5d1011eea33bb35ae8d461a2-20230927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1325716001; Wed, 27 Sep 2023 16:35:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 16:35:40 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 16:35:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igq1ritdg38dzNDnAURv3du77Ju+jxuFPFhlY0XsPjPAlFS9ThPSBixTlIhGSUHxFbjuzM8ZmDi76eQxe4SHhoE/Bt5YC9ETNCMt0JFrTLW+g3SQs2AR4cuR7RKtwlWv32Y960AYor+Y7ojE2PSfJMpGKrpe7rCAgNhIFrpkcoM48Ycyudi6jyCpmSfikUjt2hrYvSgF6+JbuhYyuODxg3AOMnJK+YiAU43X7Da9AFbY329q/aRaVke9g4jETK5ACUCYC8RKIN0hZNERPdkoAoeGuPbQkNo8Ukp6qDzEyQFlskLaVFLRv3lXshnoV85pINmObOIs4nLzNcOFFMUz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6EcI6pwq41c5qZJudUyPapHZhrkI+jC1g/YQpzskdw=;
 b=CvTaazS37LJ7M5Dx7VnW8L8pop9tMbQ+HXRpYaToOZtqh4hEhIANST8TcmQg2nxr7vUW19zjOa3aUoHBCiuptoynz5tLzSjHfZNQCryMYjaWUoYswQ/iQUDwfXT/UT7gjs+W1tkak0yQBlaUyVY4tAWqm3JaN5Wheg0sUXLIqg0HGQcElnKmQyi243NOyiyGnOQxEnZW5MRcCy4V9znS3ieK3x1/9XNYXwSZVJ4rS/vCAAPOyvNO3YsQ+7wpg0xMrkK/xclHrPJm7oOCo+Wur2sj8X32OOKhPROqZTeUbXqZ/Tl4dFAJspK5iivr8pH4TiB+S/HHlvN/AclAeRBKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6EcI6pwq41c5qZJudUyPapHZhrkI+jC1g/YQpzskdw=;
 b=ufe/fwyZWcQw32Ohr7/HxX7mIhMVdvSD1A9q0CIOGep63/zl5lBD4jguppYS6uQ8//ATsocoZwl7AkRVFIvUjHfmLZ//0mzSiRQzimBZctoQmeE/OgMhlXqDeGT+ogxkvMGP7GHqs4+quXcAyHpPPjmaDcC+de4+ixd1PljChiA=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB5666.apcprd03.prod.outlook.com (2603:1096:820:7c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 08:35:37 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 08:35:37 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v6 09/16] dt-bindings: media: mediatek: mdp3: add
 component STITCH for MT8195
Thread-Topic: [PATCH v6 09/16] dt-bindings: media: mediatek: mdp3: add
 component STITCH for MT8195
Thread-Index: AQHZ7SWHyg9ZDPcRyk2nqrGQYxaRXbAruySAgAKlvIA=
Date: Wed, 27 Sep 2023 08:35:37 +0000
Message-ID: <fd167162432a28d716bb532291f9c13e2916b286.camel@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-10-moudy.ho@mediatek.com>
 <20230925160953.GA1449445-robh@kernel.org>
In-Reply-To: <20230925160953.GA1449445-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB5666:EE_
x-ms-office365-filtering-correlation-id: 13312b73-1d6c-40cd-9fed-08dbbf34b954
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I4ep/r2Rg9gqKv8fe++PuWTBM0h5GTZ36y3WX58XTPh4+k1BFN0BtzLg15tIUCbXJML0eIl8K0UbGUI7sOWj2iv5s+J2FkHfcXNJ3wgrS1GaeqB2TomaOONPlwkOuLKWVbKjHcf9jJwBUuHei183JEro/tyAlAj5wy1qBUq5REXcozJ/ih9A9dBxKvbsf/CvufnY+o8B9lH1iM6lk/YqrOk48W/Gw1WTvmZYBsP1sjxRT5iubGgaHSC3TzUO89vxlgK4nzaDNB7pK4n7oElipjWlhyalDDFaaK72WvBdI6aEAL8+2zQ0lCs8ylDl6B5Al2BiJZCKSjFH8XhciVsMRQOvOo6t+HkYngExdcdo6ADYq138qipazxxnhF+TF/bonaYC5YZsYovAQKOEK1idnDOnbEDHJhYJdu2lTifF5C+R7R3e0ztX+A8J0kSwQTSnbVpVBKDsiAsPLv7A3C5HJdYYBRAdDp98h4EsyLM9ue2TJrCrhfjN8wSpr57+Y3XGP6OPgvTo6uAcDMgAtH6850j/mzThtMSaPnw0KwsUmN0xqTipOppRgGwp9TKYAvo/Zf3FNySChYedjH9o/hGWRuIl3GDzWWMHjEu8HktiovHHkAldBSZpxwlgZPZ8W8iTqfWkwMwCnmDbSJZ+gxVwAKaW/neU1x3Hh+eFHvkwHfse4CopzKfMTNsejOsbfUOJQzymWnRR1Y/xLNWPpFiRPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(2616005)(26005)(6506007)(6512007)(86362001)(85182001)(122000001)(38070700005)(36756003)(38100700002)(83380400001)(76116006)(2906002)(7416002)(54906003)(6916009)(64756008)(66946007)(316002)(66476007)(66446008)(41300700001)(4326008)(8936002)(8676002)(5660300002)(66556008)(71200400001)(6486002)(966005)(478600001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWY1Y0pjSXdWNlIxQ3N4SG95MG5QUWNEQjFCdWdTSlF0L1VCNlhSaVV4eC9t?=
 =?utf-8?B?UWxtSEVMVWlhTmpBOFFzcHhZa1BpSUFrZFZ1LzhBUFJ2RytjQ01HU3NsbW5E?=
 =?utf-8?B?d2VxWkw0YXlPaEdIMkw0UVRsT0dHZ0tGKzJkT3NabkEram9Dc0ZOME9CQW9Q?=
 =?utf-8?B?UEp5cGZMMW9IVGJxRWVXYjlLcS9YK3F0Ykp3bmhrMU1QMUxPZzlGbHhKMlJt?=
 =?utf-8?B?NFE5Q3A2UHVoVksvNnRSK08ySXk3M3U0NmJmbWp3UUs1TkxwN3dsaUlqejJO?=
 =?utf-8?B?UnRNVUJPWG9RcytvTkU5RFNXKzlVWGZxdGhOYUJuU1pYNEViMUo4Kyt5UG1y?=
 =?utf-8?B?c3JRSnE4Qk1LcVFSTjhjblkvK3NsTUhEZmQ0UjFHY2FYNkVMV3haNHFkQUNJ?=
 =?utf-8?B?S1JVbG5MZ0ZZTEtYc2FLd0R3ZVlkbHVqYTQxQ3NaTEFSWmF2dzl0N2FBdTRj?=
 =?utf-8?B?S28xL2JMQlBWMHZJOHBQTTd5dWI5Qm8xZUtIT1ZTdXk4ZnB2aVFKSEpRRzJY?=
 =?utf-8?B?ZFo1eElhbFlKYUZZVkhITWl0bTJlZk51b2hZNFN3TTVjZStsU0hJc1crTGNG?=
 =?utf-8?B?V2g4Qmk3OXl6VmNYZ2JsaTc0RjJHWXMyR1IzN2YwQ3h1OG02WjM2Kys0dDJw?=
 =?utf-8?B?MFV1M1orOVg3VDh0bWFQUjk3a3IwNW1TbThaUXdLYTNlbHRpek0zZHQ0MUxp?=
 =?utf-8?B?N3FSRE9paHc2Ylg1c0swZVRuSGVXR3h1eWZMdHFXczNLYnRWcWNuYzRtb3Z0?=
 =?utf-8?B?SC9jeTFvSlZHUTBuRTJHUlhtRlJNZFg5MFIvTk5rVHgyelQ2M0x0bEh6ZlpC?=
 =?utf-8?B?Y0I4dCtaZGdQRFQwVGpjYWlzRHRiNEJxUXlpb0liZlhSRmhUWEUvNjB3Q2J2?=
 =?utf-8?B?UjZoREhXUytLczVWSWhtVERrdklsQmhoV2N0Y3Rmd3J6UTkvUUpvRStZNmZK?=
 =?utf-8?B?cEFWOXNmNGVJTzlTclZ3OUVpd2dEK0FscE1TbnFreXBSLzlTRTNwcHBJSE0r?=
 =?utf-8?B?WjRhV1RrMlprSzA4eHlPV1YyT2V5Z3ROWWkzTlN0dzlIT3ZXREF5dmgrRS9Y?=
 =?utf-8?B?UGxycHBvRUU4T0NVbEl0MDBrc0w2S3QvSUhrWlUzblJua1Y3U3ZGaWxMVFlk?=
 =?utf-8?B?eTJSZk9paDdpUkdLZzcvazY1NEEzb3prT0wxZXZRUUJmTE9XK1h4M0RiYkpE?=
 =?utf-8?B?MTZtNjZTbThFTkd5bFdHTzdtVTVaTUNKVksrNk1kUUlHb29BTnZEZGZha1NJ?=
 =?utf-8?B?RzlHSzJPMUtobmcrSzlvQUtkTjVmb29ibHArbFdBMEVIVDhyTFlWVTFIR3Bp?=
 =?utf-8?B?amNBNmdqNldoZGplUzhhSUQ5Kzlna3JlK2JuTTFqK1hYWEY0bEdoSzNFMTNq?=
 =?utf-8?B?Qit5Ynk5aWlOc0FhUjFDZm5TUSsxZnpQaDc3VkFJQkJIcDFIQWRNWDUzbDU3?=
 =?utf-8?B?VzFYYmplSldvcFcyRlJuc0V5RGMzNWwyMmRPR2lmdm9wby9jRnFzeXNqZGNn?=
 =?utf-8?B?N3VBV3RjUnA4L0hRMHJlUXNwTk9uTm5iL1pvTjQ2aGphelVwd0krNnk2Ym82?=
 =?utf-8?B?anBpV0JVck5hZWFrd29iWnhtemRweVAzZSs2U3JyV2RzdTZ5aUI0dW1zUkhm?=
 =?utf-8?B?MlNRd3FMZk9USGZ1ZUQ1SEUzV1h4am1XSUpmZ3UxRGlqUUZ6ejBLWFI0RjJH?=
 =?utf-8?B?eS9Jd2JaYmV2RGNqZTZQWmcwN3dmTDc5V3g4blBPZUE2S1lvRHBKZGxkSjkv?=
 =?utf-8?B?andhOU1rTVRQNVdNYUd6a2plVmMwTUNvWEpUZm0xaE0zU3RSeStGMFdwY084?=
 =?utf-8?B?Nk5odUdsL3ZENW9TZGlGR2k2T0hyN2F6Z3Y2RkplL0VIYjRndG1ISG9VR29U?=
 =?utf-8?B?Q3h3VlNJMXhWVkN1YUY2ejBFZ2U1SXBaUFA1MjlhRTV1clEvWlRzQ2N0YVZr?=
 =?utf-8?B?TkVlZ2Z0K1k4Vnh0OW9Dc2Q2S1pXYlJVS29KOE9Za1o4VWFQQUp2NFhzd1BH?=
 =?utf-8?B?NUxFV0ltUVVjUW1tVHR0K1JmMzYxVjhXYlY4dy9nNlQzYi85M1ZsbHdKVHhI?=
 =?utf-8?B?TXo0TDkwS2FSamFWb2xRc3ZPSFZackVkejl5cEdOODJvd2dlKzFkVkY1bXZJ?=
 =?utf-8?B?c0lsaFFOYXZsQkFhck5lMndaaXFiN3hOTWNLaTZ4QzduNXJPc1gzQ2JIWGFs?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82BC3C4A20C8A44699ED3154CD33E195@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13312b73-1d6c-40cd-9fed-08dbbf34b954
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 08:35:37.1091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3nGQS9kZEsz9lSZMf1MxXbgd3D1IucYjou2nYI+TFkxcboGUqz2kYzmtjOkDwwBRH7vb0cpM2ZHSZqlOtjvGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5666
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDExOjA5IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
IAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAwMzoyMTowOVBNICswODAwLCBN
b3VkeSBIbyB3cm90ZToNCj4gPiBBZGQgdGhlIGZ1bmRhbWVudGFsIGhhcmR3YXJlIGNvbmZpZ3Vy
YXRpb24gb2YgY29tcG9uZW50IFNUSVRDSCwNCj4gDQo+IFNUSVRDSD8gWW91IG1lYW4gVENDPw0K
PiANCkhpIFJvYiwNCg0KQXBvbG9naXplIGZvciB0aGUgdHlwbywgaXQgd2lsbCBiZSBwcm9tcHRs
eSBhZGRyZXNzZWQgYW5kIGNvcnJlY3RlZC4NCg0KPiA+IHdoaWNoIGlzIGNvbnRyb2xsZWQgYnkg
TURQMyBvbiBNVDgxOTUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5
LmhvQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLG1kcDMtdGNjLnlhbWwgICAgIHwgNjANCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMt
dGNjLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtDQo+IHRjYy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtDQo+IHRjYy55YW1sDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI0NWUyMTM0
Yzc0YQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gdGNjLnlhbWwNCj4gPiBAQCAtMCww
ICsxLDYwIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVkaWF0ZWssbWRwMy10Y2MueWFtbCMN
Cj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogTWVkaWFUZWsgTWVkaWEgRGF0YSBQYXRoIDMgVENDDQo+
ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIE1hdHRoaWFzIEJydWdnZXIgPG1hdHRo
aWFzLmJnZ0BnbWFpbC5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiArICBPbmUg
b2YgTWVkaWEgRGF0YSBQYXRoIDMgKE1EUDMpIGNvbXBvbmVudHMgdXNlZCB0byBzdXBwb3J0DQo+
ID4gKyAgSERSIGdhbW1hIGN1cnZlIGNvbnZlcnNpb24gSERSIGRpc3BsYXlzLg0KPiANCj4gUGxl
YXNlIHNheSB3aGF0IHRoZSBibG9jayBkb2VzLg0KPiANCg0KSSB3aWxsIHByb3ZpZGUgYSBtb3Jl
IHNwZWNpZmljIGRlc2NyaXB0aW9uIGZvciB0aGlzLg0KDQpTaW5jZXJlbHksDQpNb3VkeQ0KDQo+
ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVt
Og0KPiA+ICsgICAgICAtIG1lZGlhdGVrLG10ODE5NS1tZHAzLXRjYw0KPiA+ICsNCj4gPiArICBy
ZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBtZWRpYXRlayxnY2UtY2xp
ZW50LXJlZzoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBUaGUgcmVnaXN0ZXIg
b2YgZGlzcGxheSBmdW5jdGlvbiBibG9jayB0byBiZSBzZXQgYnkgZ2NlLg0KPiBUaGVyZSBhcmUg
NCBhcmd1bWVudHMsDQo+ID4gKyAgICAgIHN1Y2ggYXMgZ2NlIG5vZGUsIHN1YnN5cyBpZCwgb2Zm
c2V0IGFuZCByZWdpc3RlciBzaXplLiBUaGUNCj4gc3Vic3lzIGlkIHRoYXQgaXMNCj4gPiArICAg
ICAgbWFwcGluZyB0byB0aGUgcmVnaXN0ZXIgb2YgZGlzcGxheSBmdW5jdGlvbiBibG9ja3MgaXMN
Cj4gZGVmaW5lZCBpbiB0aGUgZ2NlIGhlYWRlcg0KPiA+ICsgICAgICBpbmNsdWRlL2R0LWJpbmRp
bmdzL2djZS88Y2hpcD4tZ2NlLmggb2YgZWFjaCBjaGlwcy4NCj4gPiArICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkNCj4gPiArICAgIGl0ZW1z
Og0KPiA+ICsgICAgICBpdGVtczoNCj4gPiArICAgICAgICAtIGRlc2NyaXB0aW9uOiBwaGFuZGxl
IG9mIEdDRQ0KPiA+ICsgICAgICAgIC0gZGVzY3JpcHRpb246IEdDRSBzdWJzeXMgaWQNCj4gPiAr
ICAgICAgICAtIGRlc2NyaXB0aW9uOiByZWdpc3RlciBvZmZzZXQNCj4gPiArICAgICAgICAtIGRl
c2NyaXB0aW9uOiByZWdpc3RlciBzaXplDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4g
PiArICBjbG9ja3M6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6
DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIG1lZGlhdGVrLGdj
ZS1jbGllbnQtcmVnDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9w
ZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTk1LWNsay5oPg0KPiA+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2djZS9tdDgxOTUtZ2NlLmg+DQo+ID4gKw0KPiA+ICsgICAgZGlz
cGxheUAxNDAwYjAwMCB7DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
OTUtbWRwMy10Y2MiOw0KPiA+ICsgICAgICAgIHJlZyA9IDwweDE0MDBiMDAwIDB4MTAwMD47DQo+
ID4gKyAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lTXzE0MDBY
WFhYIDB4YjAwMA0KPiAweDEwMDA+Ow0KPiA+ICsgICAgICAgIGNsb2NrcyA9IDwmdnBwc3lzMCBD
TEtfVlBQMF9NRFBfVENDPjsNCj4gPiArICAgIH07DQo+ID4gLS0gDQo+ID4gMi4xOC4wDQo+ID4g
DQo=
