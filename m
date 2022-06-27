Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C055BC44
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 00:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A84110E23D;
	Mon, 27 Jun 2022 22:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E844F10E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 22:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656368608; x=1687904608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=D/9o5cohMu1NvnjPxHqkuc13BvcHggcoK1DCttYcB7E=;
 b=jpKLJIoO/GoCziqTUc9mHAMlAOOV7+DyMTtV2tqY51vgMXYrz/fNaBY7
 tEc6vNwXj+S7zb028vx2jknTLg87ovXpIen2zM7kUPzn09mIlUxt6P+J9
 ztMDEucp1GxtU5XTQ0DLgSXwXGxGCMkeKxRTsJ3nE4wuNpCTpiDYGPMrh
 29335Jac+xtLouLAE1GPOezADP03clZzbyZf22kcjXW0V8xtzG9YiUsQl
 o1D/hegJrgQHT9Q+2BikTqLrChuZ8auaBk6FAX8rOJuvgVN9bLeLnLx6B
 +KoY6xyPSF78m7aABwDdcccCXIHCMmLMx/evRxXWYmC0F1l0lNlju0XS9 g==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="170106660"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2022 15:23:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 15:23:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 15:23:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iN2dwTHDUft+Qq5w27f+cRbM/GN/pStTz1sKsfJ2gC47Ot1BE+8E5pDSwAga3UJ5WF3zmtYCe/1P44hAgXZ1tcswSlpwtmY9aluKJBfyKPaRaWvvy7kKKhge2IZr6rCfGkb/I484ES0D+c+IsR5LZQeXJUatth1Nc+brW4vDx7x7WxXJUpF15MgAMU1Q/oR3MmArn59Okws1W22RfYIPiXaZ5RJQoflcBFWOJ+8hTAVPbQ1K9zM2lfJH85yagXhHGUIXOxrn1JjiC9S1eN6dWVapKM4RmH84gyuMWemug7VuiAP2dNXYk2JawuS6ly2BOiBHj4mwNXPhupIbV2FvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/9o5cohMu1NvnjPxHqkuc13BvcHggcoK1DCttYcB7E=;
 b=ggk940BRN2JVuMCLI2CBLwCHsEwAXhpUjPP4AXhY4UPrigRXeA3PSiJGhZxEX+uUoQd1/mjlMX5RsYJ9bj9SM6SdIb3oGMWm7SeFRsQot8Wa53833SPlkPeOOIJnI4ZDquc7/gKJphR2+NiITHOwhuIS7IRHKeIwykgsn9C3Ai2xAvnsBTxn2tgNKl6dHWsnY0QTi0/7Ms8QVNkd+BLlwKzrBWBpJMgvwghonQIPOaloUN62rNvvCr2I0UfKIkMJV6RwP5iRaniyuRI6uTSDIo0Blivey55680gsb95Dd0+zhvj6/efdnS5j/cAcWkAaWK5BNOR+7IoCJWihJyDPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/9o5cohMu1NvnjPxHqkuc13BvcHggcoK1DCttYcB7E=;
 b=DS9vZtBE46gaAplDq+jSzKLSEz+hb94wdzLL/klQ4age8dse4zFgI8kLjSimVcDK3A7WKM1OgT+aoySbNz3vuJvmpeAcy6BLFo37gzAx9sa8dERkfvwjeS+SwZOHHirDMJfDjaW8P41z5pg6VMiMxD3SEl1uLikqyuC/0SVpaDw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB3889.namprd11.prod.outlook.com (2603:10b6:405:81::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 22:23:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 22:23:21 +0000
From: <Conor.Dooley@microchip.com>
To: <fancer.lancer@gmail.com>, <mail@conchuod.ie>
Subject: Re: [PATCH v2 05/16] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Topic: [PATCH v2 05/16] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Index: AQHYil3unfMM8MJbu0GkmX2M+wh13a1jxroAgAANjQA=
Date: Mon, 27 Jun 2022 22:23:20 +0000
Message-ID: <47f7cb2a-a9b6-cd3c-7ab4-8ed187dd61ab@microchip.com>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-6-mail@conchuod.ie>
 <20220627213450.ukqai4bsjzcwhnlp@mobilestation>
In-Reply-To: <20220627213450.ukqai4bsjzcwhnlp@mobilestation>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c105dfc8-ff2b-4eee-6313-08da588ba48a
x-ms-traffictypediagnostic: BN6PR11MB3889:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8R8MUH1leWseBUpA80yORtbefu4P9lOftYW7SNr8Lkx9ZEADZCQi3xTlKiduRFio1i84zYl7ifcXrSDtFzu9lpUjREXP1cAQ46eDpz0EbxOK8Ew2Ob+lhZEPJCh+mBeygdNenQZ48aIZKww1t5VQ/uItRz6FUVyHqxy/xx6CZYvNorKd3Ys/K02QjsnVwCLh0H32D8XfzCmkSH3vEQ8dA/Stgni6F5WgSsZzF7e2pkoSoxiHqICKCVWV+e6Bj829TjN/auFeDXTizJ0ufNBN/jlJeyKzbamNQB6OFwywQnlaYqWaJ+w2zRDahnZA6FQqoU/B3BrbJz44NTM69DVmLoo3PBK+n9FgHmXWamX7Nyl5oe8PQz1AaJhA7mOC96u6DGFmUjUUu/JJHQk0iAurpUEDN1NwKWEvXGYvYDkCmWhcFeyccjAdUbDR/P3gGt6nPaFHU+FEcM7AlQDCHgE36LBiQUmz8nNcKiFTTYuljZmfGwTYozYl0u4qBOtFZcJBzFy3jvxDvUml5z+d+ATpwXpU9BumRhh6iA+/jvkI1YZJ7u+D7TlyH56FckLjStLZwHVh0sULrjGEzPNJ6R8Rmnsx3eN86sKMW34e8b1dnREBJjSHzzDEJfiNWZq/g+ky1x2YYybYohvrL1N9IW7mslYAhZ54RQ8Dka7lpYUw6G3ruiv35M2VNETU0I7kVcRiw+q3NIU4XlQyVdP6Ij/NkeodUB9TLxwWgtGIC09KR3FbErteY6trizHm7WFAq4gTylM77ckgECQ9xALe2D/xowFs8++i+VGr+d2djrKRhAjvEdbfpWIyQmq5RpiOTE6JfJ00VnmXv/1UakjIcYRXn45mN0JAEUJmNe4AkYrJfI+YTEO7HuL/RJ43Fr/S2TkGIi0Fi3iyrvEkgs3lNWAYBf3rsvsh4tYnCrnMYacgsPY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(39860400002)(376002)(346002)(6486002)(478600001)(83380400001)(7416002)(38100700002)(966005)(38070700005)(122000001)(2906002)(31686004)(66476007)(76116006)(8676002)(66556008)(91956017)(31696002)(186003)(36756003)(2616005)(66446008)(54906003)(316002)(5660300002)(7406005)(41300700001)(4326008)(53546011)(6506007)(64756008)(71200400001)(110136005)(86362001)(8936002)(66946007)(26005)(6512007)(43740500002)(45980500001)(15398625002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTN6R1d1ZzA4WkFnemdpZFViN1kxTnlBLzJaVG1CMlpqckR2MjFSVTdnT3Ux?=
 =?utf-8?B?ZnRGZmVnZWZDVXRRdFpFSUJEVHFBSzN0SjJMK1UvUEdla2FqZWtRY0RoZXFW?=
 =?utf-8?B?ZEp0QzJGQm5XWXdhR0RDS2xMOHBOa0NIY2dnUXdaWTNLRW1nZkZySG92SlBV?=
 =?utf-8?B?T1hLQmY2eDBaKzVxNlZ1VHhEOW5MVGM3UW9FZlp1YUlMV1RKSEppTVNFaGRJ?=
 =?utf-8?B?RC9BMHZITmZWK3hmRkthYTJUUHZXVGQ0M0IyK2hWVTdBSmcxT1Y0V3NHR3lQ?=
 =?utf-8?B?ZUM3ZzhpV3Vpa3Z3dU5FQWM3WDFKWXd3SnZjVkhUNE1FSGx2OTR0K0ZwdjBU?=
 =?utf-8?B?OFk0Y3ozL0dqSWlTUWNXaERuTEpXUmEzMVJoSEZndGorNGRTM21EMGg3S3VW?=
 =?utf-8?B?bjMxcStxWStjNXR5N3ZZZmZaa3M1SkYrTS82TlkwRUlYbWtTRDhXVysyTDVm?=
 =?utf-8?B?T1hnZWZFRUtzbzJZVjJqOHJ6cS83UzFJMmhNSzErSklCTjRmcXVyZjRlaU9s?=
 =?utf-8?B?RlVNbndxbHVwdnM0R21YRWkwQkxqNmVXejFyaXV2d0dUT1BzT0UzcjJhWTdO?=
 =?utf-8?B?cEJYZENOUTc5SXM2ZktQaFdldTBZRWUvS0xuUkVGVW5yS3hiN2ZhbFd1RHVG?=
 =?utf-8?B?RWcwUVp5ZGhVZHNleWUzd29RQ0RYNnh5eDJhTC8wV1lCYlltcVlYamszb1l1?=
 =?utf-8?B?cWcvbk5CaksxQ3JoZmhOeWFNSEtsWjFteHBCR1BrcTJ0S3c2S2IrV0lNT3hF?=
 =?utf-8?B?K0Npc3kyY3psaE14N0FaM3RpVDJnaEJlRzNPaFZZNGF5MlBOVGlydlZ6eCtq?=
 =?utf-8?B?LzNWNVo4QXVtQjF4eGdXcGN2MXB6NHBGQ3kyUFlQekR4NENWc2ZHWVlDbzVE?=
 =?utf-8?B?ZEI1M3dyNDQ1V2N4b2VTUFA3amNnQW1uOTdpRTF1bHVZNnF1bVl1Mk1aOURm?=
 =?utf-8?B?M3FjbWVucEo0ZHhlYUtYUkFmT2FPb1I4U2VOWWtWaGxzNXd1OWE5dFVLZHUw?=
 =?utf-8?B?d2tOQ3EzNTg2M3VYTjNVQWhFYi9aaGdmY3huU2kzelF0bFYvZDZsMHg1a2p0?=
 =?utf-8?B?eXBqY1pnYVpRTmJrQWEzSCtmY0ZkdHRWT3RRN1F5V09MbktYVFpIeFRkU3Jo?=
 =?utf-8?B?Z0pzUEhxMVAvRUN2YzRDMXRBVEhsci9JZG5LdEtQclNFZTFyUmJqQmZnT0ZF?=
 =?utf-8?B?WlM0VTAvOUdVTkxhYXBjWTExZWxTTXZ6bHBkRGkxbzMvSTM1cjFIRXhCTjNG?=
 =?utf-8?B?ZnRoWXQ2aEFUYU9JdlVraUt4V2JGYlM2WG5FTy9aN2hLTjBKWk0yZHlDV2JP?=
 =?utf-8?B?cXBVclBTZmlKSG1zZDFZb1pYaXZBMEhaWXhPUDg2Qjhmc2hqUzkwYmtyVDNu?=
 =?utf-8?B?WnRMcmFUSzJHYlRmWDk0UXpSa1pXeVZ5cDEyb0hkbGJUL0VWYktQQVVDOWM4?=
 =?utf-8?B?RTZQeHZuVUMreThxei91aDgyV0gxNXVVNnc2djZpc25xeXhnREhpSkY4Vld4?=
 =?utf-8?B?UCtOOGVmRzJDV0JySkFMOTdaRngySnEvb1IzdTlOZ0d6MnFDaEN4dmlpbEwx?=
 =?utf-8?B?dE4wSjJ6aVQ1Mm5aM1MwT0xBc2RZWjlZOUJaLzlKR1A2bnRLMU1vMHRpc3VH?=
 =?utf-8?B?L2xxZVJqc0cyclgvUVZic3dCUzdPK2JwOVA5U2l2d0ErcEp0d1lUZGdoZWQw?=
 =?utf-8?B?S3BBUEpsVGZ6MVJBdkpFQytBYVZvUjhzR0VSQko0T0lGZHgySVRBN1MyNWlT?=
 =?utf-8?B?MzBhMDl6eEFZUDkra3ZncXRXN1BmZG9GaVd0bndteWxmcmo1OUwwN0tXMUtO?=
 =?utf-8?B?Z0hPZ0NoMkh0aFFkVEEwSUxKeC8rY0xNWTJTYTZBWXYzdG1lU3QwNFIwRDM0?=
 =?utf-8?B?UE1WdEE2NG90cjczVHRuQnN6cGVpLzBYbEhjZSsxSUZab3k5aDk0S2RvTW12?=
 =?utf-8?B?dnlGMVYxUDRMU2RnZVp5d3hCcFNIR3ZXY0NvSGxFMVlrSWNJKzFLVzdNZlZu?=
 =?utf-8?B?Y3dWSXNhUlFrZnZ2b1JYUDZhYkcySWdtOWJlU29SVzJrMFVIN204T1IwcHNW?=
 =?utf-8?B?Y0Y0MlphaFB5QVdpWUkxbGpWUGk0UmNFOE5TTWU2YlBXcDBCSnRZM3BGT3NY?=
 =?utf-8?B?SlB4VVVwc0R3UExGT2xMN0pNYnIxcW5OenErcFViS0p3Sm9NNTVodXEwUzYy?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFEE2DD61A6DD348843A0763CA9E99CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c105dfc8-ff2b-4eee-6313-08da588ba48a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 22:23:21.0109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1kxPGPpdRqsF+NjTvcGvyHO4KezIrBP2Oor7rgCNbiXK/XGZgh4qQrka7d1iPUZW6eNeudrkVq9nmdZ5CODgXzhRtCo1lls9dE10K9sprY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3889
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDYvMjAyMiAyMjozNCwgU2VyZ2UgU2VtaW4gd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMDg6Mzk6
NTNQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBUaGUgQ2FuYWFuIGsyMTAgYXBwYXJl
bnRseSBoYXMgYSBTeXNub3BzeXMgRGVzaWdud2FyZSBBWEkgRE1BDQo+PiBjb250cm9sbGVyLCBi
dXQgYWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudGF0aW9uICYgZGV2aWNldHJlZSBpdCBoYXMgNg0K
Pj4gaW50ZXJydXB0cyByYXRoZXIgdGhhbiB0aGUgc3RhbmRhcmQgb25lLiBBZGQgYSBjdXN0b20g
Y29tcGF0aWJsZSB0aGF0DQo+PiBzdXBwb3J0cyB0aGUgNiBpbnRlcnJ1cHQgY29uZmlndXJhdGlv
biB3aGljaCBmYWxscyBiYWNrIHRvIHRoZSBzdGFuZGFyZA0KPj4gYmluZGluZyB3aGljaCBpcyBj
dXJyZW50bHkgdGhlIG9uZSBpbiB1c2UgaW4gdGhlIGRldmljZXRyZWUgZW50cnkuDQo+Pg0KPj4g
TGluazogaHR0cHM6Ly9jYW5hYW4tY3JlYXRpdmUuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDIw
LzAzL2tlbmRyeXRlX3N0YW5kYWxvbmVfcHJvZ3JhbW1pbmdfZ3VpZGVfMjAxOTAzMTExNDQxNThf
ZW4ucGRmICNQYWdlIDU4DQo+IA0KPiBJIGJlbGlldmUgd2hhdCB5b3UndmUgZ290IGhlcmUgaXMg
dGhlIHBlci1jaGFubmVsIElSUXMsIHdoaWNoIGlzDQo+IGFjdGl2YXRlZCBmb3IgdGhlIERXIEFY
SSBETUFDIGJ5IHNldHRpbmcgSVAtY29yZSBzeW50aGVzaXplIHBhcmFtZXRlcg0KPiBETUFYX0lO
VFJfSU9fVFlQRT0xIChDSEFOTkVMIEFORCBDT01NT05SRUcpLiBUaGF0J3Mgd2h5IHRoZXJlIGFy
ZSBzaXgNCj4gSVJRIHNpZ25hbHMgYW5kIHNpeCBETUEtY2hhbm5lbHMgYXZhaWxhYmxlLg0KPiAN
Cj4gU2VlaW5nIHN1Y2ggc2V0dGluZyBpc24ndCB0aGUgQ2FuYWFuIGsyMTAgc3BlY2lmaWMsIGJ1
dCBpcyB0aGUgRFcgQVhJDQo+IERNQSBjb250cm9sbGVyIGNvbW1vbiBwcm9wZXJ0eSwgd2hhdCB3
b3VsZCBiZSByaWdodCBpbiB0aGlzIGNhc2UgaXMgdG8NCj4gdW5jb25kaXRpb25hbGx5IGV4dGVu
ZCB0aGUgbnVtYmVyIG9mIElSUXMgaW4gdGhlIERULWJpbmRpbmdzIHNjaGVtYS4NCg0KQ29vbCwg
d2lsbGRvLg0KVGhhbmtzIGZvciBhbGwgdGhlIGdyZWF0IGZlZWRiYWNrLg0KQ29ub3IuDQoNCj4g
DQo+IFBsZWFzZSBub3RlIHRoZSBEVyBBWEkgRE1BQyBkcml2ZXIgY3VycmVudGx5IGRvZXNuJ3Qg
c3VwcG9ydCB0aGUNCj4gcGVyLWNoYW5uZWwgSVJRcy4gU28gbW9zdCBsaWtlbHkgdGhlIERNQSB3
aWxsIG9ubHkgd29yayB3aXRoIHVzaW5nIHRoZQ0KPiBjaGFubmVsIDAgb25seS4NCj4gDQo+IC1T
ZXJnZXkNCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgLi4uL2JpbmRpbmdzL2RtYS9zbnBzLGR3LWF4aS1k
bWFjLnlhbWwgICAgICAgIHwgMzUgKysrKysrKysrKysrKystLS0tLQ0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3NucHMsZHctYXhpLWRtYWMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc25wcyxkdy1heGkt
ZG1hYy55YW1sDQo+PiBpbmRleCA0MzI0YTk0YjI2YjIuLmJjODU1OTgxNTFlZiAxMDA2NDQNCj4+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc25wcyxkdy1heGkt
ZG1hYy55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1h
L3NucHMsZHctYXhpLWRtYWMueWFtbA0KPj4gQEAgLTE4LDkgKzE4LDEzIEBAIGFsbE9mOg0KPj4N
Cj4+ICBwcm9wZXJ0aWVzOg0KPj4gICAgY29tcGF0aWJsZToNCj4+IC0gICAgZW51bToNCj4+IC0g
ICAgICAtIHNucHMsYXhpLWRtYS0xLjAxYQ0KPj4gLSAgICAgIC0gaW50ZWwsa21iLWF4aS1kbWEN
Cj4+ICsgICAgb25lT2Y6DQo+PiArICAgICAgLSBpdGVtczoNCj4+ICsgICAgICAgICAgLSBjb25z
dDogY2FuYWFuLGsyMTAtYXhpLWRtYQ0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBzbnBzLGF4aS1k
bWEtMS4wMWENCj4+ICsgICAgICAtIGVudW06DQo+PiArICAgICAgICAgIC0gc25wcyxheGktZG1h
LTEuMDFhDQo+PiArICAgICAgICAgIC0gaW50ZWwsa21iLWF4aS1kbWENCj4+DQo+PiAgICByZWc6
DQo+PiAgICAgIG1pbkl0ZW1zOiAxDQo+PiBAQCAtMzMsOSArMzcsNiBAQCBwcm9wZXJ0aWVzOg0K
Pj4gICAgICAgIC0gY29uc3Q6IGF4aWRtYV9jdHJsX3JlZ3MNCj4+ICAgICAgICAtIGNvbnN0OiBh
eGlkbWFfYXBiX3JlZ3MNCj4+DQo+PiAtICBpbnRlcnJ1cHRzOg0KPj4gLSAgICBtYXhJdGVtczog
MQ0KPj4gLQ0KPj4gICAgY2xvY2tzOg0KPj4gICAgICBpdGVtczoNCj4+ICAgICAgICAtIGRlc2Ny
aXB0aW9uOiBCdXMgQ2xvY2sNCj4+IEBAIC05Miw2ICs5MywyMiBAQCBwcm9wZXJ0aWVzOg0KPj4g
ICAgICBtaW5pbXVtOiAxDQo+PiAgICAgIG1heGltdW06IDI1Ng0KPj4NCj4+ICtpZjoNCj4+ICsg
IHByb3BlcnRpZXM6DQo+PiArICAgIGNvbXBhdGlibGU6DQo+PiArICAgICAgY29udGFpbnM6DQo+
PiArICAgICAgICBjb25zdDogY2FuYWFuLGsyMTAtYXhpLWRtYQ0KPj4gKw0KPj4gK3RoZW46DQo+
PiArICBwcm9wZXJ0aWVzOg0KPj4gKyAgICBpbnRlcnJ1cHRzOg0KPj4gKyAgICAgIG1heEl0ZW1z
OiA2DQo+PiArDQo+PiArZWxzZToNCj4+ICsgIHByb3BlcnRpZXM6DQo+PiArICAgIGludGVycnVw
dHM6DQo+PiArICAgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICByZXF1aXJlZDoNCj4+ICAgIC0g
Y29tcGF0aWJsZQ0KPj4gICAgLSByZWcNCj4+IEBAIC0xMDUsNyArMTIyLDcgQEAgcmVxdWlyZWQ6
DQo+PiAgICAtIHNucHMscHJpb3JpdHkNCj4+ICAgIC0gc25wcyxibG9jay1zaXplDQo+Pg0KPj4g
LWFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UNCj4+DQo+PiAgZXhhbXBsZXM6DQo+PiAgICAtIHwNCj4+IEBAIC0xMTMsMTIgKzEzMCwx
MiBAQCBleGFtcGxlczoNCj4+ICAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9pcnEuaD4NCj4+ICAgICAgIC8qIGV4YW1wbGUgd2l0aCBzbnBzLGR3LWF4aS1k
bWFjICovDQo+PiAgICAgICBkbWFjOiBkbWEtY29udHJvbGxlckA4MDAwMCB7DQo+PiAtICAgICAg
ICAgY29tcGF0aWJsZSA9ICJzbnBzLGF4aS1kbWEtMS4wMWEiOw0KPj4gKyAgICAgICAgIGNvbXBh
dGlibGUgPSAiY2FuYWFuLGsyMTAtYXhpLWRtYSIsICJzbnBzLGF4aS1kbWEtMS4wMWEiOw0KPj4g
ICAgICAgICAgIHJlZyA9IDwweDgwMDAwIDB4NDAwPjsNCj4+ICAgICAgICAgICBjbG9ja3MgPSA8
JmNvcmVfY2xrPiwgPCZjZmdyX2Nsaz47DQo+PiAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29y
ZS1jbGsiLCAiY2Znci1jbGsiOw0KPj4gICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8Jmlu
dGM+Ow0KPj4gLSAgICAgICAgIGludGVycnVwdHMgPSA8Mjc+Ow0KPj4gKyAgICAgICAgIGludGVy
cnVwdHMgPSA8Mjc+LCA8Mjg+LCA8Mjk+LCA8MzA+LCA8MzE+LCA8MzI+Ow0KPj4gICAgICAgICAg
ICNkbWEtY2VsbHMgPSA8MT47DQo+PiAgICAgICAgICAgZG1hLWNoYW5uZWxzID0gPDQ+Ow0KPj4g
ICAgICAgICAgIHNucHMsZG1hLW1hc3RlcnMgPSA8Mj47DQo+PiAtLQ0KPj4gMi4zNi4xDQo+Pg0K
DQo=
