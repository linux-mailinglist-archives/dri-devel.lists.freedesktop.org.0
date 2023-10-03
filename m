Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E497B5F55
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 05:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395B010E097;
	Tue,  3 Oct 2023 03:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C976F10E097
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 03:29:13 +0000 (UTC)
X-UUID: 01944202619d11ee8051498923ad61e6-20231003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ssNpYi9eGIqq6NoSH2wdzSLFbNRAHN+hh71MDNLkklY=; 
 b=S9m0X8ZkoGz0yQgPqLejyNyiGV1z1LWbqv0JzpgIiIHKRikVhv6dFgbZ6dMDnhkRmYYMwtF6AIXzEPwVJ/tcy+Zzd+BK/+CyPn3eoRUC+tF2Ccqy4HpOk0ePB53vNnCXRsrRGuwndT9p538uoV7fHwDp1n8cAIDN/oclm3+Asfc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:d2de912b-f6fc-4329-980f-7dcc725124fc, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:6b5f9e14-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 01944202619d11ee8051498923ad61e6-20231003
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1661224151; Tue, 03 Oct 2023 11:29:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 3 Oct 2023 11:29:04 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 3 Oct 2023 11:29:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgBmohnPs66+7AZHN0ozdr25bP6KSGAvqnWgpSWxO7HwtGKU3lT7xpV744ReU4cXN9h39De3jzjbZd328znCvqcttmIIKmXhnPRY5YDjN4N5Vptq1NunqTlbx/hFZ5KQh8++jptW9jHews3mu1qHZnwAZpctcaKUV5/9NEw6OuXBn8hNZZKdwA7txTCclJiqQW7qVrlk9S1T8ZVq+I+Y2JqwjJJtaloySxYOEt+JQVjqQS8DgFrOfvIYna9Z6IkLfR98xsFecmWf93cFN2p6WU5OIKjzJEAu2X24sETd81f9hJRhMDPFoyujQDtUsgpxEPoZHAZAnjDennk1BbiCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssNpYi9eGIqq6NoSH2wdzSLFbNRAHN+hh71MDNLkklY=;
 b=RXRrrJtCC7X9eY7tu7laK1/LDAv34HpN2LfifS2lN0JfNX28dtwNUkqer6IVV860+lO0LNku9u27jqkGsMLibBOHOMaQw1dI6QvJZNqZE8tK8MZMT4XkvdwpAor49Yodhe5p1IewhcrmMiU5vGdn/SvNJ7er9icrDTalG20UWpUBSkAoSLBj3qTDZUVnDZjwusMClAdKC/PkfK9wPZKH3uJTuHJV5MmDTYpU7TtUWhfkroCGTg8iJmKT/lHiDvLQdfPjOGovDS4BKkogkubKS73ERjWnh0SJFMI2AW+jJ74rVCE0wrlGfH5D2Uql5SdsNmfqginOtWGfEipDwU95sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssNpYi9eGIqq6NoSH2wdzSLFbNRAHN+hh71MDNLkklY=;
 b=QdAgduaijWq3wtw/EeoNv0h/85oRmt4mNHSMZZS5mc0M35tYzH4ok5AOdZQUAP/WMfe/LwkyUQtE1+ZM+lvy3+x6OsFFAGZJZJmlD50UsU8BavGZGi/tgW45tbJCIshMPGZzHsTKV9FaOqyGtIW/YeUBNg5sT5hAnHpAzBs0MkU=
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com (2603:1096:4:17a::6) by
 PUZPR03MB7253.apcprd03.prod.outlook.com (2603:1096:301:103::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.28; Tue, 3 Oct 2023 03:29:01 +0000
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::10c2:a420:e409:a1b8]) by SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::10c2:a420:e409:a1b8%7]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 03:29:00 +0000
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
Subject: Re: [PATCH v6 02/16] dt-bindings: media: mediatek: mdp3: split out
 general properties
Thread-Topic: [PATCH v6 02/16] dt-bindings: media: mediatek: mdp3: split out
 general properties
Thread-Index: AQHZ7SVi6wBhd7H0BkCcC9cdpgTqabAon7WAgA7ZfQA=
Date: Tue, 3 Oct 2023 03:29:00 +0000
Message-ID: <392f0603d6a753611de56dc64e36a43291e2bf5b.camel@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-3-moudy.ho@mediatek.com>
 <4fdfe29b-aea7-8180-d2e3-5caa1beb7232@linaro.org>
In-Reply-To: <4fdfe29b-aea7-8180-d2e3-5caa1beb7232@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6343:EE_|PUZPR03MB7253:EE_
x-ms-office365-filtering-correlation-id: 6d80a59e-0ea2-4333-df9e-08dbc3c0e251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 95vdrkIL0QZOzyRBbVtHUm8xij/pwLo+2ooXxbWbLoRj4NdTJqL6vkAXBckOZ7FZA39EpH++fD8l1JGKqXrq+qqnOjoLu/+4beOEcgRhoHEt9wnFBHODQjDnkA0vz5c2Ayceo4DxmFi0sDORfEWEQpVDMAcTLnHkVDvkwYVFHN76SxeSrr4tFpwzpqajrTiK66Wm9TF4A7wHMfxA295769Ocm+71+SkXzoSgx7JxxXCu5G4W9na7RWhdApE4q+i/G9VlDBi+g/HmMyXzWJpb3P8Tdym3Es5gVF0laL8lnC00aqALR2KU7KJ1uZPNTOQP6vwZRykDna75VZ/07Lz5mOD6RcgMz/fyJ41vEHWdim8Qa0r+Zn1NX0t+fha2o3oV0L1QAEMZc4CqjGVvPdcz2yuZ9S1Yb7trv3RbVRxQJB7fjoIb2zBKjoGukheb0c0F1qY4WqrnA0MN2ikQ6NiZHrP6/9Ok3CubpL3QSL7ts0S4sGPyMmk2GxQ9OcMX493TEoSg+BVFHqNDks70Bv+bqJp1wDGLdcQUIaLumAwLwuq3G8zikLCC/JG4N2gEaP9o6xxPXAMU/Cvo0ZScGFW7Bwo+CQPmJCxpmAzpBaNUIJYoY+631ObTuQNxg8P/JOzkI/yFiOGh0+BRgq+g5srHL5RJTJuVu7MkO6jMgtoIqONuAnxUjl0xXfXuQVDGx2PxfwmIGZ9nrVabSMd3H8nsGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6343.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(39860400002)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(122000001)(38070700005)(921005)(8676002)(7416002)(83380400001)(38100700002)(110136005)(91956017)(53546011)(66946007)(66556008)(6512007)(71200400001)(66446008)(4326008)(66476007)(6506007)(6486002)(478600001)(54906003)(64756008)(8936002)(26005)(2906002)(5660300002)(41300700001)(76116006)(316002)(2616005)(36756003)(85182001)(86362001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1MwR25yMXBabDQ5bkhlK3JpRWoyMzZBZnlnanN4d0thd1h5WUlrSGpEWDlW?=
 =?utf-8?B?emk3RXFWbktjOUVBYlVQV2FsSUVCaTlIUWtGRzExUjRuV0hqR1FmcjdvN0xQ?=
 =?utf-8?B?Wm5MK3JxNmpZdXZVbmxkR2trVjg1bTZJODJWbUVOS3Vld2lxNjJIV2VKZzhw?=
 =?utf-8?B?T0lrYUFBVEVFcDljN0J0cngwaXkxdHlIeHM0bmgxb2x0ZktwcDlFVXNpNTFJ?=
 =?utf-8?B?ekN3dC9abndiUnVyMUJTazA1d1RLS25EclJZUC9iQndyWnNJcGpva0JnRk5m?=
 =?utf-8?B?SkZMbmZQV21JbmlhZFFpOXNwbG5mRXlOYWUvZllwTUtpMnFwc2YxYjE2K0R0?=
 =?utf-8?B?eG1KQTVYM1M0QVNoR2pHejdhc3ZzZjA5d3VIK2xwZHY3STRTMVI1SHVHaVNm?=
 =?utf-8?B?d0duOTRMTVN3TlRwdHU2YWFsWDVvZHJCenZTZUliNENTVjVZeDY2Y25teGh2?=
 =?utf-8?B?ZDlZNUxyVzlsRHZPUFVLcTFMTThmL3l0YUVDQVFjbUhrNHRPcVM5cnVQRjVK?=
 =?utf-8?B?YlpOSW5nbzkybERRcHpOU28yaVlQVHhzVE5NemIzNGk2YU9FMzlVeno4cXpo?=
 =?utf-8?B?UTJ1emgzRUZDQzNKM041QTJ3aXpzdW5sWWZvcmh2MzE3VE5ZNG9La2RjdjZF?=
 =?utf-8?B?YzBoakFOSkZETkJoWjlMTWF2M1FabWd4V2hVaE5yNTJQei9ISTZ6VC9WK1Jp?=
 =?utf-8?B?Nlk0SytpVGtHTThnWXkwQ0c2cFhWT1FyY1E4SlljY2s4N1FJUG9Jd3ZnNnlE?=
 =?utf-8?B?dVQ4VkFMUWdlV1NwRy9TUUp1NUxRejd1Ym1zNjhEMGZ6ZStDYm9EUk5ibFhJ?=
 =?utf-8?B?TDBwZ2FNRWxFblY4S1RpY3J0UVVkY0oyWVJjc2N5V1FkN1I5ZWlseVc4MWZo?=
 =?utf-8?B?Z3dIbnJDTjhwUVhuQXcvb3FoYk9UWVVSZXo4UHd3SG83Z3JNYTdxYlRRa1pT?=
 =?utf-8?B?eUljc2d1bzZRaFhCUytOV1Zhc291eExQeksvTW1QeU9mMW9RWXBqSkxvSjhw?=
 =?utf-8?B?SkdMRllaU245c0REdHpkT29TRjdDSzFSVjM2eE9FV2VYREdIZHVnZ29XOFgz?=
 =?utf-8?B?a2Q4OUpaNUxZM0ZuZnNEUWFWMG5Rc05DaStBR0VpYVRDdmtXbHU5QzlpM1Z4?=
 =?utf-8?B?WGJGVDBHZHFyZlFpUFVqOFprQlJkelp6UU1nTnJkRjFyVUZVbkQ5Z0prTmVp?=
 =?utf-8?B?UzlZQUVCbzJBL08rcGZsME4xNFJVaWJyZGh6WldoVEVRWkFqSGo1RW1wbU9x?=
 =?utf-8?B?eG50c0tiZFovNWYrMHFzWlBhM3k0am9sYVVDaXdNYXpXd2M3eDc5WENQRzFv?=
 =?utf-8?B?SEFleVNyeHgxOGhZTHJxeDlrdGw2V0hpUG02alpzRFFJWDNmTUNjWXNMby83?=
 =?utf-8?B?aUZ3cGhIT1lxU01LQjBRRE5FeWFiQkVZNVBqMlU2QmRPNnVyeG1mazVwMFBo?=
 =?utf-8?B?ejBYdnNNWmh0ZjQ4Q1VGZXVaWVArZzlOWUxMNnUxY3V0dWxzRll3NlRHYS9x?=
 =?utf-8?B?SEp6anJ4THg2a0pIUmQrZlZzOWltVHlDQ0g2dG01RWZCT2ZURlFnWjFIVldj?=
 =?utf-8?B?M080NGxGQkNBTHFFUTVZS3NTaVhNU0V1dXIvMlptMGVLSEtnYmw5NHlybUNQ?=
 =?utf-8?B?Nk5MbkFCNDBiQmdqMUtpdmZwTGc4QWhyWGNxemZock5JZnJNQ25TOVpheGVr?=
 =?utf-8?B?bEFnWnpLekJ5SUxTNG1ucWFCMlNzM0FNUmNSbDhEaDZlc05tUkxBaHAvZkQx?=
 =?utf-8?B?OENSUEFhU0tOdEJCUTdnbndHdHFZMy9uSCtVY1pxc0RVUkFSYjFheVc3bEZi?=
 =?utf-8?B?UXRJVTMrWkliOGVEOXZFa0N0TEFSakplTldpZ2kxNy9PYWcxWS9xWEJ0WUJT?=
 =?utf-8?B?eHpXKzBjL0ErYklnOXBrT0Y2V3FJLzJYYndzVzVSZFNMNDZwYUtxdi9NMEZ6?=
 =?utf-8?B?dTd4VXFQMTdNM2tndG81MHViYmR4SnFqVGZYSXdHL1dMejc0cktzZ0RQTHd2?=
 =?utf-8?B?WkZMeDVqamVjTFRCZjd1YTF2ZDRFY2wrdnh6OUNmUDVtWkI2enNKejVTNEM3?=
 =?utf-8?B?aGpmWHFFdE83MGdVcURic0JOaittQmZoR1Y5bnhQbHBONWNhY0k2VVk4K2R0?=
 =?utf-8?B?eWt0R09hUkpOcnFwaU95MXd2YWI5Nmd0NTRlbEtjVlF6Y2ZCRC9uVXRVNmUw?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC2745B4806AA84CABCE09CB95203BA6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6343.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d80a59e-0ea2-4333-df9e-08dbc3c0e251
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 03:29:00.0881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbf9blA1NXLE3WtD66PynNI9FoutEXgQ8VhxOsVne7Pa5se7vhw2iJYHs7exI8MxH1x3c5Rq4hSNHul6MEcqcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7253
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

T24gU2F0LCAyMDIzLTA5LTIzIGF0IDE4OjQyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDIyLzA5LzIwMjMgMDk6MjEsIE1vdWR5IEhvIHdyb3Rl
Og0KPiA+IEluIG9yZGVyIHRvIG1pbmltaXplIGR1cGxpY2F0aW9uIGFuZCBzdGFuZGFyZGl6ZSB0
aGUgZG9jdW1lbnQNCj4gc3R5bGUsDQo+ID4gaXQgaXMgbmVjZXNzYXJ5IHRvIHNlcGFyYXRlIHRo
ZSBnZW5lcmFsIHByb3BlcnRpZXMgc3BlY2lmaWMgdG8NCj4gPiBNZWRpYVRlayBNRFAzIFJETUEu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgLi4uL21lZGlhL21lZGlhdGVrLG1kcDMtcmRtYS1jb21tb24ueWFt
bCAgICAgIHwgNzINCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NzIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIGlzIGEg
c2VwYXJhdGUgcGF0Y2guIEl0J3Mgbm90IHVzZWQsIG5vdA0KPiBlZmZlY3RpdmUgYW5kIG5vdCB2
aXNpYmxlIGZvciB1cyBob3cgaXQgZXh0cmFjdHMgY29tbW9uIHBhcnRzLg0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCkhpIEtyenlzenRvZiwNCg0KSSBjb21wbGV0ZWx5
IG1pc3VuZGVyc3Rvb2QgdGhlIHN1Z2dlc3Rpb25zIGdpdmVuIGluIFY1LCB3aGljaCBsZWQgdG8N
CmluY29ycmVjdCBtb2RpZmljYXRpb25zIGFuZCBjb25mdXNpb24gaW4gcGF0Y2hlcyAyfjUuIEkn
bSBpbiB0aGUNCnByb2Nlc3Mgb2YgcmVjdGlmeWluZyB0aGVzZSBlcnJvcnMgYW5kIHJlc3BlY3Rm
dWxseSBhc2sgZXZlcnlvbmUgdG8NCmRpc3JlZ2FyZCB0aGUgaW1wcm9wZXIgY2hhbmdlcy4gSSBz
aW5jZXJlbHkgcmVncmV0IGFueSBpbmNvbnZlbmllbmNlIG15DQphY3Rpb25zIG1heSBoYXZlIGNh
dXNlZC4NCg0KUmVnYXJkcywNCk1vdWR5DQo=
