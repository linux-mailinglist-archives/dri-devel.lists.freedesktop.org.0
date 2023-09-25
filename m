Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB3A7AD83E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 14:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865910E17C;
	Mon, 25 Sep 2023 12:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9A410E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:50:00 +0000 (UTC)
X-UUID: 06bd380c5ba211eea33bb35ae8d461a2-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5ucnnm7ou7TDJUI2qM1XF6W4sbZ+cwhD0NGzYmMPVxo=; 
 b=fOT1Q+POd6VyK5DRXliuA5/EojO6BGkcPr13WtI2sZzpovcKpolmWeDfx2l525FESUPsYE1EbHxPJIue+Dd2ZhagVJWuCi+lLjqDFXWbwQrlFMaPldsLq6wWQnWGso0r7B9K4GA7bZJSG+iFk/YpQyOGRJusW6CAcdAiFt709r4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:84a1459d-6d27-445c-9016-79d4e9591514, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:8db43fbf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 06bd380c5ba211eea33bb35ae8d461a2-20230925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1245616241; Mon, 25 Sep 2023 20:49:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 20:49:53 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 20:49:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnvzG5ZdtlD/2d0tdRn0uxBbCIcOYUpGSmDg0S/us36Gh5McaYc1dFJ5kfChsE/G2NaHZpLkWoeVsB0vEeepe5uZ4TO7sTBpbfh9Cvbr2ADyyJIVHewQ4l2zxtcWPscNU4s7yh8UvbLmQD6F5eTIQU9ba6XNH1SUi8IfZMTeLg8CGlEn0SZo2Y7MmwcNqDcXJRaUUDF1hQqJG1ZCbtR/rLVwm2gsPFcGBCzgftvHw2/zAz4EICCDW4zTPskh8Pi8HHDu8vxO53tK3f7SLuFOjxCuaiYnuAcrIve6t0k6ff24y4idMtXugtGujyaIySZgn5j8wikYxfO5XVphVBuWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ucnnm7ou7TDJUI2qM1XF6W4sbZ+cwhD0NGzYmMPVxo=;
 b=dpYpacP6//D2/f0o4YkSD1s86lvrctcp65GWchVIPc+UdgaetJE2Wvu2bs0qRQ5sZSMmwdFgfRlH5U00FlWStFFU7CMgDHHF0gNvmWW6UwpbPqgorXXLbIn4oRftZFOlADTaxUDqoA3kvyE0alskzLXVD+//9Hd2g97lGT+0yJqWxK5wP5y0Gdz5Xo8+2n00ZH8pSRT7GDs+bW8ZtaUpKXXN4R/FZIugQzzWCdtnfZ9aWBfBaCGBeP4AHxuhxjhCgKrv2D8/WIImHO1F9tM9IdMDV98OV1qEB3Vqw8oF6C5FGSTtxIvQGu500vXY35YmB9arJq+qOenJbZqXvwVNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ucnnm7ou7TDJUI2qM1XF6W4sbZ+cwhD0NGzYmMPVxo=;
 b=NgObBTCLLgaVTpqxT15smXVJMNQ9uqfxAATvFpEWf054XEiF81kW0FqeF4VqERxDVmlorhs0j51FPqhL1o0DChxr+VNoda8GGz1a28Gx+E51gh0xwv7vvnsGVR5w5PI2Co35VbqgTTIW83qDvX2iuYvK1syq/fESI09vnwHmf5c=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB6820.apcprd03.prod.outlook.com (2603:1096:400:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 12:49:51 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 12:49:50 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Thread-Topic: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Thread-Index: AQHZ5FgkdSQ5OiqhjEmEvtpYDF+5QrAVXDQAgAFcr4CAADZ+gIAUpXiA
Date: Mon, 25 Sep 2023 12:49:50 +0000
Message-ID: <a4ecc2792f3a4d3159e34415be984ff7d5f5e263.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
 <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
 <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com>
In-Reply-To: <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB6820:EE_
x-ms-office365-filtering-correlation-id: d0e2d02a-eecb-4fc4-23bb-08dbbdc5e853
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IMN/6nZTOaiMqJWoYZV1B5tWJi4LeoT1hViAwNZmgny4ltrDhJPwVUhOLjFsMMVJlj1/VqKZ8XAbp1FBEzmIxvFJh2EAwy5gf1Ptepo1GYnnLsxaR94IPY6TJ3UnY4WMSGgf1jeEcGpfMy/b8GUDBJTeDqUOhEfPqZQe1C2FdkXoXQgz2JTK1HBQzxvmcz+kZaXQpfc+JHaE6xkmrml+523HuEfgheQdBn3qiB9LTWftS14V2GD4eMUlZocsxwrYZmOqfG5Js0SGZ5wavsQ9AWvDRU01LuKOQ2GYsd/EXDTAHLR4sdEcSHRmc9wuYyfFpRVj0lxVa5kTLEeNj6JrA5hdiGbxEOdlkqaEznoCHSYRI09VZWfQvd7z8JDuV+XLN8+8X1o/CAqtflw8QCnuvLJR9GGsOsAcsTbGYumJawUYBiTkrN7cZXeQbny8F8/gPhgkBEkml2z0HvJOpyPOCwfNyJbj/5yaFCWm4l5s+RrePC23xHbM8fXVfRZbtFs1Zss5bgSeW/MmA7jAgpttqHMAVCnrowbKxEnCR6JgAO0mQTUc2+7ZPdsuoY6qoiRDrmdyg1IiCppP1sE4lleaICxdx0H4PFIrmtYBVYshQl63Pa8Fp4ypeYX06dbrlnWyxKwGvxl1U5qfS1phwi5liDZkQbTfHQKyXt565dZIi98tXmMY6kcWRikJvUSirdrh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(26005)(71200400001)(478600001)(2616005)(83380400001)(85182001)(36756003)(86362001)(122000001)(38070700005)(5660300002)(6486002)(38100700002)(6506007)(6512007)(2906002)(4326008)(8676002)(41300700001)(54906003)(316002)(91956017)(110136005)(66946007)(64756008)(66446008)(66476007)(66556008)(76116006)(7416002)(8936002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1RWY0FOSnA4TkhXRmxCdHhyRm9PNzFZT2Q5VFNxVHBCbE5ab2FZbnNyWkhY?=
 =?utf-8?B?YUx0Z0tNWllpMWR3aUt5TXM0eDZrNVJidmdZeFRTZ0I0cEliencwVng1Wmlm?=
 =?utf-8?B?ZzlJM25ObXlsOU1ZUWRMWW5lZnd2UmxSOUEzbEZXQXk5eWdVQTFMWTRXZ1k5?=
 =?utf-8?B?SXN0cFEvVHhDbmJ2clREdXRZQmdBVE96WnlRb1lObXFsZkJiM2Z5eUlMeDNL?=
 =?utf-8?B?T3RCTi9OYzVnUGFiZGN6RFNXSlRNUmxMaE1XZWRMUDhqbU13d3B5L3BZcUcv?=
 =?utf-8?B?bERPMXFkUU9PK2p0Tkl2b0JmYldZTFVaZDRKK3gvSmp4TkUxMzAxSEVEYmlz?=
 =?utf-8?B?OFQyck5VTUVobGdsUy84dTFTSzkvSzlZSStJQjZrWVhySlBJb1Z6ZlFBakNR?=
 =?utf-8?B?RlZLVXpRbk1TMmdvZzJ6R0VvK2pkQzNSY1lLTTZlS29mWVJ1VTEwS0c1eXhW?=
 =?utf-8?B?OUd6Z2FXdnR0SEloY01pc3VZanFjbnRSL1pqVVUwWXNSTlowM1Y5STUvQjRr?=
 =?utf-8?B?a2dnaUFOY0Qzd1ZBSEY3SFRPanBtUFp0ZkxMMWhqU1p3VHd4VU1sTStSSUl4?=
 =?utf-8?B?K1VONy94eXNkWFRNdHlKNjlBR2VqRVVlSEdRUWhtbk1SNGwxVlMvdDhlRWhW?=
 =?utf-8?B?SDJ3Sk8ySlNJS2VJNCs4TUJkeXVVSHV0QVRzL1J1anQ5bUZFci9sbU9KM2JF?=
 =?utf-8?B?QTh1NnZocEhSUFlTZm54SlA5MjZ3cnRuQ2FBV0RPRmFBTVFoUVhvVE9xaEJO?=
 =?utf-8?B?bXBIaUVGMXFXTDMxdXR0TlhDVWpuTG1PdWduM2Qxbmw3MGRRUnRyVHNwbXpq?=
 =?utf-8?B?dmkveFZ2MTc5Q0xGR0ZLTC93UDVsTXdrSTZWcnluOFJqR2k5UWxiWFdlVzBr?=
 =?utf-8?B?WXFqMnUvMGo0SkY3REpIMEJBMEMwTGZsWWU5VVRwcG4xeTJ1RmZQWWpoOTZM?=
 =?utf-8?B?Nk5qOUI3OUJ1dEcrRUJhb1NnTWJpMG1UOVFaYW1sMzVrQWJ2eERIdXJrdFVx?=
 =?utf-8?B?b3ZJZ1d1cHhRcThTZEpGN3RXbGQrSzJiMWJtQmU0ODMwcC80T2R0dTdtcWtH?=
 =?utf-8?B?dEFFR3QrTEx0S3BwZCtFNDJScGJMUG81N3pleUFOUTRod1JZSjVnN0RwTFlM?=
 =?utf-8?B?TitIaUV5NWEyWmdpWXgyK2prNDF5cnRJS00rcGQ0alovT0VKbWRFNDJaYmpH?=
 =?utf-8?B?YkRudms5Y3JERTJkdENNcVRhbWN0emRGUWkyakV2TGU3cnEvOUFlWURJODdh?=
 =?utf-8?B?WEs5K3ZaWkVpUmE2QnplZVlwOXdMVU85N0RiWkpmcG13TXRGcERENnBLMkRv?=
 =?utf-8?B?aitiaDJFL0MzUVpEZmpCWm5TQ2orcWZ5V1Evd3NMc0JqWnhpT1FKRFdWeTY1?=
 =?utf-8?B?WUZ4VytxSHFHK3NaRWdtd1lodWVFb2tMZG0ra1QxS1ZPQUZvTi9qQXRwQ2lV?=
 =?utf-8?B?aE0wTlp2UVdrMWVEQ1RrbG02dkNTN3FuU3ZjQkRJcHMyWXBIdnVtYTRsRVJH?=
 =?utf-8?B?L2hBMmxQS2ZOcGQwaEVyNlJ4UlFUdFlSemNQS1BuWC95aUt1QVNQa1hqbGxC?=
 =?utf-8?B?c293Qzg1aFVHWFh5dThyYkdGdHUxc0daNVRSWmJOL3JKQ2xDS2gwZm1JbHNl?=
 =?utf-8?B?L2RmR1dqWVNqblJCSjczOHdHYU8yOUFqZUwyS09xSjJncDNhRnBRa2E5dGYv?=
 =?utf-8?B?eHB2UWRXQWZsOHRwRmE1ZUd5emtCdldha1R5M1hkZTgxek90a0FxQzR2bGV5?=
 =?utf-8?B?QlBFM3lCNkpKL3pOVnYvNTU5elNCUUUraU44OEVTNEc0dlBab1pxdlpsV1A1?=
 =?utf-8?B?bUJxeSt6T1F0Q3hMVGZCMG9DZDdQTWtSSGFVaEJyQkV2eVdZaUdhVlZSN25q?=
 =?utf-8?B?U2hUZ2lUY2xacDRpQjJxTWM2UnN5REhVc3lHNTR3eVZYZWp1RnBvaFVBcmln?=
 =?utf-8?B?SlYxTGkxczFVZndmd1IrTklNclhLUU1aYlk0U2QrWTYxai9qL0tOZHZ5c2li?=
 =?utf-8?B?UUJ4VERYNXNoeWxLV2k4d2dhNnhwQmhrVVBEVnZxMXI4aklIcG1SUElleXdy?=
 =?utf-8?B?anBvN1ZycEdwenNnWDNnVC9YM0ZyUzNxMnBYRVltQnRkZEdJL3VzSlVSU09l?=
 =?utf-8?Q?XXgeH/hxrp61PDY+mcLdVoZDf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB8E6A2D4F5D7E4CBE3594C777063463@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e2d02a-eecb-4fc4-23bb-08dbbdc5e853
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 12:49:50.6487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJbhOkflBFjP/ncwB2v43FsqmTHr6u1Qt3J87a7GY9LnzgX42PY/EcSKNYufvaONB1HoIPhdf8ClwDyLHxtEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6820
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

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDExOjMyICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTIvMDkvMjMgMDg6MTcsIFlvbmcgV3UgKOWQtOWLhykgaGEgc2Ny
aXR0bzoNCj4gPiBPbiBNb24sIDIwMjMtMDktMTEgYXQgMTE6MjkgKzAyMDAsIEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vDQo+ID4gd3JvdGU6DQo+ID4gPiBJbCAxMS8wOS8yMyAwNDozMCwgWW9u
ZyBXdSBoYSBzY3JpdHRvOg0KPiA+ID4gPiBUaGUgVEVFIHByb2JlIGxhdGVyIHRoYW4gZG1hLWJ1
ZiBoZWFwLCBhbmQgUFJPQkVfREVERVIgZG9lc24ndA0KPiA+ID4gPiB3b3JrDQo+ID4gPiA+IGhl
cmUgc2luY2UgdGhpcyBpcyBub3QgYSBwbGF0Zm9ybSBkcml2ZXIsIHRoZXJlZm9yZSBpbml0aWFs
aXNlDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBURUUNCj4gPiA+ID4gY29udGV4dC9zZXNzaW9uIHdo
aWxlIHdlIGFsbG9jYXRlIHRoZSBmaXJzdCBzZWN1cmUgYnVmZmVyLg0KPiA+ID4gPiANCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo+ID4gPiA+
IC0tLQ0KPiA+ID4gPiAgICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvbXRrX3NlY3VyZV9oZWFwLmMg
fCA2MQ0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAgIDEgZmls
ZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL210a19zZWN1cmVfaGVhcC5jDQo+ID4gPiA+IGIvZHJp
dmVycy9kbWEtDQo+ID4gPiA+IGJ1Zi9oZWFwcy9tdGtfc2VjdXJlX2hlYXAuYw0KPiA+ID4gPiBp
bmRleCBiYmYxYzhkY2UyM2UuLmUzZGEzM2EzZDA4MyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2hlYXBzL210a19zZWN1cmVfaGVhcC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9tdGtfc2VjdXJlX2hlYXAuYw0KPiA+ID4gPiBAQCAtMTAsNiArMTAs
MTIgQEANCj4gPiA+ID4gICAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ID4gPiAgICAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiA+ICAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvdGVlX2Rydi5oPg0KPiA+ID4gPiArI2luY2x1ZGUg
PGxpbnV4L3V1aWQuaD4NCj4gPiA+ID4gKw0KPiA+ID4gPiArI2RlZmluZSBUWl9UQV9NRU1fVVVJ
RAkJIjQ0Nzc1ODhhLTg0NzYtMTFlMi1hZDE1LQ0KPiA+ID4gPiBlNDFmMTM5MGQ2NzYiDQo+ID4g
PiA+ICsNCj4gPiA+IA0KPiA+ID4gSXMgdGhpcyBVVUlEIHRoZSBzYW1lIGZvciBhbGwgU29DcyBh
bmQgYWxsIFRaIHZlcnNpb25zPw0KPiA+IA0KPiA+IFllcy4gSXQgaXMgdGhlIHNhbWUgZm9yIGFs
bCBTb0NzIGFuZCBhbGwgVFogdmVyc2lvbnMgY3VycmVudGx5Lg0KPiA+IA0KPiANCj4gVGhhdCdz
IGdvb2QgbmV3cyENCj4gDQo+IElzIHRoaXMgVVVJRCB1c2VkIGluIGFueSB1c2Vyc3BhY2UgY29t
cG9uZW50PyAoZXhhbXBsZTogQW5kcm9pZA0KPiBIQUxzPykNCg0KTm8uIFVzZXJzcGFjZSBuZXZl
ciB1c2UgaXQuIElmIHVzZXJzcGFjZSB3b3VsZCBsaWtlIHRvIGFsbG9jYXRlIHRoaXMNCnNlY3Vy
ZSBidWZmZXIsIGl0IGNhbiBhY2hpZXZlIHRocm91Z2ggdGhlIGV4aXN0aW5nIGRtYWJ1ZiBJT0NU
TCB2aWENCi9kZXYvZG1hX2hlYXAvbXRrX3N2cCBub2RlLg0KDQoNCj4gSWYgaXQgaXMgKGFuZCBJ
IHNvbWVob3cgZXhwZWN0IHRoYXQgaXQgaXMpLCB0aGVuIHRoaXMgZGVmaW5pdGlvbg0KPiBzaG91
bGQgZ28NCj4gdG8gYSBVQVBJIGhlYWRlciwgYXMgc3VnZ2VzdGVkIGJ5IENocmlzdGlhbi4NCj4g
DQo+IENoZWVycyENCj4gDQo+ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IEFuZ2Vsbw0KPiA+
ID4gDQo+ID4gPiANCj4gPiA+ID4gKyNkZWZpbmUgTVRLX1RFRV9QQVJBTV9OVU0JCTQNCj4gPiA+
ID4gICAgDQo+ID4gPiA+ICAgIC8qDQo+ID4gPiA+ICAgICAqIE1lZGlhVGVrIHNlY3VyZSAoY2h1
bmspIG1lbW9yeSB0eXBlDQo+ID4gPiA+IEBAIC0yOCwxNyArMzQsNzIgQEAgc3RydWN0IG10a19z
ZWN1cmVfaGVhcF9idWZmZXIgew0KPiA+ID4gPiAgICBzdHJ1Y3QgbXRrX3NlY3VyZV9oZWFwIHsN
Cj4gPiA+ID4gICAgCWNvbnN0IGNoYXIJCSpuYW1lOw0KPiA+ID4gPiAgICAJY29uc3QgZW51bSBr
cmVlX21lbV90eXBlIG1lbV90eXBlOw0KPiA+ID4gPiArCXUzMgkJCSBtZW1fc2Vzc2lvbjsNCj4g
PiA+ID4gKwlzdHJ1Y3QgdGVlX2NvbnRleHQJKnRlZV9jdHg7DQo+ID4gPiA+ICAgIH07DQo+ID4g
PiA+ICAgIA0KPiA+ID4gPiArc3RhdGljIGludCBtdGtfb3B0ZWVfY3R4X21hdGNoKHN0cnVjdCB0
ZWVfaW9jdGxfdmVyc2lvbl9kYXRhDQo+ID4gPiA+ICp2ZXIsDQo+ID4gPiA+IGNvbnN0IHZvaWQg
KmRhdGEpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJcmV0dXJuIHZlci0+aW1wbF9pZCA9PSBURUVf
SU1QTF9JRF9PUFRFRTsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGlu
dCBtdGtfa3JlZV9zZWN1cmVfc2Vzc2lvbl9pbml0KHN0cnVjdCBtdGtfc2VjdXJlX2hlYXANCj4g
PiA+ID4gKnNlY19oZWFwKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCXN0cnVjdCB0ZWVfcGFyYW0g
dF9wYXJhbVtNVEtfVEVFX1BBUkFNX05VTV0gPSB7MH07DQo+ID4gPiA+ICsJc3RydWN0IHRlZV9p
b2N0bF9vcGVuX3Nlc3Npb25fYXJnIGFyZyA9IHswfTsNCj4gPiA+ID4gKwl1dWlkX3QgdGFfbWVt
X3V1aWQ7DQo+ID4gPiA+ICsJaW50IHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXNlY19oZWFw
LT50ZWVfY3R4ID0gdGVlX2NsaWVudF9vcGVuX2NvbnRleHQoTlVMTCwNCj4gPiA+ID4gbXRrX29w
dGVlX2N0eF9tYXRjaCwNCj4gPiA+ID4gKwkJCQkJCSAgICBOVUxMLA0KPiA+ID4gPiBOVUxMKTsN
Cj4gPiA+ID4gKwlpZiAoSVNfRVJSKHNlY19oZWFwLT50ZWVfY3R4KSkgew0KPiA+ID4gPiArCQlw
cl9lcnIoIiVzOiBvcGVuIGNvbnRleHQgZmFpbGVkLCByZXQ9JWxkXG4iLA0KPiA+ID4gPiBzZWNf
aGVhcC0NCj4gPiA+ID4gPiBuYW1lLA0KPiA+ID4gPiANCj4gPiA+ID4gKwkJICAgICAgIFBUUl9F
UlIoc2VjX2hlYXAtPnRlZV9jdHgpKTsNCj4gPiA+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ID4g
PiA+ICsJfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsJYXJnLm51bV9wYXJhbXMgPSBNVEtfVEVFX1BB
UkFNX05VTTsNCj4gPiA+ID4gKwlhcmcuY2xudF9sb2dpbiA9IFRFRV9JT0NUTF9MT0dJTl9QVUJM
SUM7DQo+ID4gPiA+ICsJcmV0ID0gdXVpZF9wYXJzZShUWl9UQV9NRU1fVVVJRCwgJnRhX21lbV91
dWlkKTsNCj4gPiA+ID4gKwlpZiAocmV0KQ0KPiA+ID4gPiArCQlnb3RvIGNsb3NlX2NvbnRleHQ7
DQo+ID4gPiA+ICsJbWVtY3B5KCZhcmcudXVpZCwgJnRhX21lbV91dWlkLmIsIHNpemVvZih0YV9t
ZW1fdXVpZCkpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0ID0gdGVlX2NsaWVudF9vcGVuX3Nl
c3Npb24oc2VjX2hlYXAtPnRlZV9jdHgsICZhcmcsDQo+ID4gPiA+IHRfcGFyYW0pOw0KPiA+ID4g
PiArCWlmIChyZXQgPCAwIHx8IGFyZy5yZXQpIHsNCj4gPiA+ID4gKwkJcHJfZXJyKCIlczogb3Bl
biBzZXNzaW9uIGZhaWxlZCwgcmV0PSVkOiVkXG4iLA0KPiA+ID4gPiArCQkgICAgICAgc2VjX2hl
YXAtPm5hbWUsIHJldCwgYXJnLnJldCk7DQo+ID4gPiA+ICsJCXJldCA9IC1FSU5WQUw7DQo+ID4g
PiA+ICsJCWdvdG8gY2xvc2VfY29udGV4dDsNCj4gPiA+ID4gKwl9DQo+ID4gPiA+ICsJc2VjX2hl
YXAtPm1lbV9zZXNzaW9uID0gYXJnLnNlc3Npb247DQo+ID4gPiA+ICsJcmV0dXJuIDA7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gK2Nsb3NlX2NvbnRleHQ6DQo+ID4gPiA+ICsJdGVlX2NsaWVudF9jbG9z
ZV9jb250ZXh0KHNlY19oZWFwLT50ZWVfY3R4KTsNCj4gPiA+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+
ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICAgIHN0YXRpYyBzdHJ1Y3QgZG1hX2J1ZiAqDQo+
ID4gPiA+ICAgIG10a19zZWNfaGVhcF9hbGxvY2F0ZShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXAsIHNp
emVfdCBzaXplLA0KPiA+ID4gPiAgICAJCSAgICAgIHVuc2lnbmVkIGxvbmcgZmRfZmxhZ3MsIHVu
c2lnbmVkIGxvbmcNCj4gPiA+ID4gaGVhcF9mbGFncykNCj4gPiA+ID4gICAgew0KPiA+ID4gPiAr
CXN0cnVjdCBtdGtfc2VjdXJlX2hlYXAgKnNlY19oZWFwID0NCj4gPiA+ID4gZG1hX2hlYXBfZ2V0
X2RydmRhdGEoaGVhcCk7DQo+ID4gPiA+ICAgIAlzdHJ1Y3QgbXRrX3NlY3VyZV9oZWFwX2J1ZmZl
ciAqc2VjX2J1ZjsNCj4gPiA+ID4gICAgCURFRklORV9ETUFfQlVGX0VYUE9SVF9JTkZPKGV4cF9p
bmZvKTsNCj4gPiA+ID4gICAgCXN0cnVjdCBkbWFfYnVmICpkbWFidWY7DQo+ID4gPiA+ICAgIAlp
bnQgcmV0Ow0KPiA+ID4gPiAgICANCj4gPiA+ID4gKwkvKg0KPiA+ID4gPiArCSAqIFRFRSBwcm9i
ZSBtYXkgYmUgbGF0ZS4gSW5pdGlhbGlzZSB0aGUgc2VjdXJlIHNlc3Npb24NCj4gPiA+ID4gaW4g
dGhlDQo+ID4gPiA+IGZpcnN0DQo+ID4gPiA+ICsJICogYWxsb2NhdGluZyBzZWN1cmUgYnVmZmVy
Lg0KPiA+ID4gPiArCSAqLw0KPiA+ID4gPiArCWlmICghc2VjX2hlYXAtPm1lbV9zZXNzaW9uKSB7
DQo+ID4gPiA+ICsJCXJldCA9IG10a19rcmVlX3NlY3VyZV9zZXNzaW9uX2luaXQoc2VjX2hlYXAp
Ow0KPiA+ID4gPiArCQlpZiAocmV0KQ0KPiA+ID4gPiArCQkJcmV0dXJuIEVSUl9QVFIocmV0KTsN
Cj4gPiA+ID4gKwl9DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgCXNlY19idWYgPSBremFsbG9jKHNp
emVvZigqc2VjX2J1ZiksIEdGUF9LRVJORUwpOw0KPiA+ID4gPiAgICAJaWYgKCFzZWNfYnVmKQ0K
PiA+ID4gPiAgICAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+ID4gDQo+ID4gPiANCj4g
DQo+IA0K
