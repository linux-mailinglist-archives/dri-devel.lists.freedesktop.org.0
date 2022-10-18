Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F76030CE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 18:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BF110E273;
	Tue, 18 Oct 2022 16:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11010011.outbound.protection.outlook.com
 [40.93.198.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739EA10E273
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 16:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8bfuNLeaKe9mKJJgF8ItgRKO11Tx3Bs8SJcGOdttGjXQR7fSpcEuLzi8BeaZTwh9hXcfwrK5TWPVTEaepZ2NLdn51piHto0SX3Gco84aIq1ck/BPPjf/f3giLkH/95dtZ/ISk9XfFhz7f3sx5o1H1MTXgBufBn/UEo/pTG21uqOymLDQiNi2tbCPYFKA6KcpO4MNmC5Wg0ba8rcP2puVp+YiTnoVc8cNk4JgQdnxLCU8DrQvTsmItOxa/1BOp8FlFeaARxrtEhijU3glmBk+cZoFhddWVWCdIB6IdmMI6DfZU7gdAARZbDm1UZGejbFGDduz641SXHj/8FSmUR3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7qdct5/B5O0IOeULngQjkWsgijC0jldN5ENfOnshNg=;
 b=HIxyb/OltPjKU2NJ/uy0DhvnBWuEhHqC1rQJsLbsWfE+VVCJ9gXGivnPpGHXdMMAAX05UhDB3yLL01UycU6/u3c+R8eUduTWZpnh2Bb62tOfvcBCRuhmKhd8xs8j4+Rm8VdqpU6voo04O7414J9lXMduA4ii6ZRKd5i++Rl7GoBfWekZwwgVlftXqUBLZAS4akPalY01585DhvDE3N4UbJa+MjXmkBJTJHbBX9B5Tm9m2gjdp8HIMJUODH7i74MIy1AGblG9LXLrSDbocEedUMxrRI9SnowtQLdmP12odxBvqk/aYi0oNKqbb4IPXqBH+pfVnubg5XK+mjeiHccjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7qdct5/B5O0IOeULngQjkWsgijC0jldN5ENfOnshNg=;
 b=ug9aVPknG+CgsQa9vmFwe/N0qUQEOQ6OyMdQP+31ZYN0yVe6lGkri9KOlzEUzJqlkb+a2JyJQKmsy8lDgAjPKqesN5LKRrU2tztADVj2+MLBSOV8I0gpeNCJZeZFo9vizgaFH5BBulNOVpsHiD6tEvRwx11Wcaoz1EcEEX/nx9k=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BY3PR05MB7939.namprd05.prod.outlook.com (2603:10b6:a03:363::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.10; Tue, 18 Oct
 2022 16:31:20 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5746.017; Tue, 18 Oct 2022
 16:31:20 +0000
From: Zack Rusin <zackr@vmware.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm: Remove drm_mode_config::fb_base
Thread-Topic: [PATCH v2] drm: Remove drm_mode_config::fb_base
Thread-Index: AQHY4wxmh2BkI5MMlEC1jn8uzVOF+q4UVy+AgAAA0oA=
Date: Tue, 18 Oct 2022 16:31:20 +0000
Message-ID: <6c8ba4444e990046f013bf0bcb72fc8451a1a00c.camel@vmware.com>
References: <20221018131754.351957-1-zack@kde.org>
 <20221018161201.365897-1-zack@kde.org>
 <Y07UJ0ogxrGnHE9j@pendragon.ideasonboard.com>
In-Reply-To: <Y07UJ0ogxrGnHE9j@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|BY3PR05MB7939:EE_
x-ms-office365-filtering-correlation-id: c54a0814-105a-4567-9051-08dab126302c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q3VmbVCIOa7M42rQ79g5faFOJT52myPPrUNytHKNHS9wC3vuI0798YtYqDXxsAAi32yRt3GIrbIH4xt8URVRD/gi0o2RNHfi4kn2sRERO7W/WDOPdtSbatqjBj4U6ZL9mijF7P4FZl4o3ORmvThW9ElDVFP1IKHUZ60FqnzSxBTjjjNL8BklOhqa3sEQ5a0m2kQpbotKHQ/nBP5ykvj/gBcpsZbHBpZzQoSHOWV49pDbhv6TUQsUBdyau1r+ICQsRgZiYcnwvMW3hjP4qO5sGaeDwFbtPpJIYgLMnqKsiB3jOzPGCqko8aX5GOIFBbSCeuRMqSNC861FmbPIx2wu9YU+duZmQFWdam7SN7l1XysYUbETwcN9BCfjQvg/vjtA4xltFyoYxYM/ghMzz0wQN5YBtCHXFBvH7dZ3jkYe56zzfKPvxuOEjy5d9ajuo5bE523VDZVG8Li88fOjMANchs/KU54Spd2p4L91x0m49gk0L1zjY6yjBOikniXw/q+GOdeCuIWtWWyFzH29OkR221Nzi/Wm83xE14hyZoSIh5zycLqp4ilrdCnrecPEqxnp9DBVNp1SfwMJ0i8t4R36gTVGZqadi1R9WJI1fPaM9Qoaj4qKi35VPdkrGNDywM+otacIybvJlocIIeJ4S43wSPMCowpZSGCt2DI30hxEzEGOXxWZIECJz6jGKjYw2R7yGxfHVlRiKcNcUwmkiCD4B6/ChD4LL2ahdSIrRagPLCGkVjl8Q6IFUGnvK/JM0nkYqvQXzT/P9eYKO35FcNs0n4xbDUupkZ+zu+aVxp/Wfq51R16KBWrb34W6dZRDi6nd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199015)(8676002)(66446008)(316002)(54906003)(4326008)(6512007)(7406005)(7416002)(64756008)(71200400001)(66946007)(86362001)(478600001)(91956017)(76116006)(4744005)(6916009)(41300700001)(6486002)(38070700005)(66556008)(36756003)(5660300002)(66476007)(6506007)(38100700002)(2616005)(122000001)(186003)(8936002)(26005)(2906002)(4001150100001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTFmR2NJMWxjS3RqZlgycjhJTW1ZcW56TVVYUjRNVlQxV0JXd0VxTURlWVRD?=
 =?utf-8?B?WFAwR0JaT3l0U1RaYWhKS0ZScnZCVUR4VDk4WXpWd0c1azBFaTZ3QU5HMGwx?=
 =?utf-8?B?THB3ZUx0UGlTeGcxSzlsUlc0cjE5TDJRQnhPeUZkenFlSnptVTVobDJ6UG5p?=
 =?utf-8?B?Ri9oVTE3VVJCYVo5UUg1Z0EvcitJNjBEYUpWYS9IOWszYUF1ZUNsMnFlYTEz?=
 =?utf-8?B?QkdNM0dDRDlpOWh1bWJqZzJmNGtIbGdoSHZCMkduZEJDYzh1Q3dWSDFXN2s1?=
 =?utf-8?B?dnhxKzRodnRiQ0NWaUlCa1ZLZXUzR2Fyck1ETThRYStXeCtPSyszdkVLQmh6?=
 =?utf-8?B?SWNrKysrV3JjVFlPNExSS0UzaldPS2pndC9GQ1B1SXdpTC9oL1prTTc4QmZY?=
 =?utf-8?B?c3BQWUNiZm84aDkvMng4SnlwWkxaRTExQWpJbFpiMjM1MzhocG1qMDBkK3ov?=
 =?utf-8?B?d1R1UjJiS1BFM3lxa3A1NWo0KzdWaktKVXpwVHlrdlJCdTY1WnJHbTkrY05x?=
 =?utf-8?B?Wk5jaWdvSG8zSTNCS0pqT0xBZVNSZWhDN29PNUxqeG9kU0ZjUWljcEdmRzI4?=
 =?utf-8?B?d3ZuR0JrMC83REk4MHlkeXBsWG9yV1R1S1lRMWRSZWZLcEI2Rk1kMUQ4Mjls?=
 =?utf-8?B?T1BsTGNldzZUS1ltMGpJQVBGUEw1aURnZ1dRM1hHV2hWa2ZGRVUrNTBHcmly?=
 =?utf-8?B?c2dOR1dtUHFpQUJkOTlxWnE4USsvai9PUXZuRDBuODVtUStGWEQ1YTMrY25H?=
 =?utf-8?B?T2lmYTRaRGJRMGxjUE9valZ2aG5kM3NpNmJ4M1dtM1dTZXMxdi8rdTIxaTFs?=
 =?utf-8?B?NXhOL3dnVUVVcXJQYVJ4aDZCRlEyWjdTcUI2Snh4U2VZWE40SDlEcVZZNnhU?=
 =?utf-8?B?Ti93Ny9Xd0l5NExVSEhsams4cGh3Q1J4aEQ4aWZRSlZSc1FiTGNyNG05RXB2?=
 =?utf-8?B?d3dYTHZIWC9ONGQ4Yjd0R1NVekNQb1gyTVpHYThxbDhGYWVQNHBsVnZSRnph?=
 =?utf-8?B?NnhwMCtZZWV0VTYvVEFPYmdTVTBFWHVHaFJkUmdvTHU5ZXJMVVN5SThKeGNq?=
 =?utf-8?B?MndPTUc1bSs1ODVzbTQ2S3JZbE8wb3RaQ21kTXFVc2Q3Ti9nZXl3bUhha1U3?=
 =?utf-8?B?QWo1R0xFMXluMmp4dWdwa0RRTXdCUmVIclFCeGJKNjZaMXFTY3ZSZVBhMmRz?=
 =?utf-8?B?L21MY0VTQnBPYWRQZjhRT3I4c3VsYXR4UWNYOGUyVVFTRkE0aFRKUDdhOHY4?=
 =?utf-8?B?RnNVb1VDVXlWTlZoaVpoYlVrSGk2S0ZQQWdCSmJkWU9GWFo5dWdpSERMS0JW?=
 =?utf-8?B?UStucFhRTlA2V3FMeFRtd1BMZW9IVm9jZDBVZXRzemJIOWVwWGNUR0w0Tmli?=
 =?utf-8?B?RmNRTTVHMDVLd0dLaWtKblpFNXZaUkI3OGpraFQ5ditrUkJKQ292UXFkM3VR?=
 =?utf-8?B?bVlkZWRIeFQyR0hZSnB3RFFmY2J4WUE0RHJybENHQzZtdXZuWmRnQ2k5eTNQ?=
 =?utf-8?B?ZW1YeENnT2FYSDFyaXN1My9FR0dmYzdta2twU3dnWGZwM2Z2S1RVSnZlZVRX?=
 =?utf-8?B?OHdOSFdBUnRhYUVrWkpMTzU1N24xRThhc0hGOGdsOXVmZW4vWDc1elJhbXFD?=
 =?utf-8?B?dVhERlRxdWdBZkp5SmMxbm1YVWZJVFFaUDFXZ3hWRGJ1ZHlEYUxyc3lBRG45?=
 =?utf-8?B?SlRSZU1HSkg5ZGFhWW5FU1ZMak5hTTZoK216czF2cFpMUVRQR3J5QUUxKyt3?=
 =?utf-8?B?U282K29ycXdDK0dTcWpib1N6VXRUd2dMS3krMmpOdjRTRlFnS3ZXbW1vcTUz?=
 =?utf-8?B?M3FOQ0pqNU1iRzgwRTIwQ0JpelFzMjg5NTBxbllaWUZiRVh0aTh1azIwTUhP?=
 =?utf-8?B?VXp0L2RhYXFjb0NyL25IZGNsdndZcnN2aThYdkhGM2dnWWJsVEdhckJrUWk5?=
 =?utf-8?B?RS9BdWE5b09veU1QRCtjVkkzSlUvM1YwYmsrVUFuSHdyU0ZxY2ZpNVJyQjNN?=
 =?utf-8?B?aStlMURsN3Ntenc0ajNOSmFlUThXTlZ1aWdCME80anFwREx6bFVTSWdYZlYw?=
 =?utf-8?B?ekhIWVd5RWdHUkwyNjdxWC82TVBvajJFTG10Vys2Vzd4TVFZMk0xMk1Rc0k4?=
 =?utf-8?Q?xrrazIi34g6Yd8fGhprawD3B0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28D17F991B97B842A241209F3D2735EB@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54a0814-105a-4567-9051-08dab126302c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 16:31:20.1290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYj+ETTW+NnLSe/dVhNIdzwXKZuOalb5Hmx8eUgiO4xBYhSEyXV9sqxzZ1PyiS4SqRpEFCh8SXuwBM+SSvTS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB7939
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
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "flora.cui@amd.com" <flora.cui@amd.com>, "etom@igel.co.jp" <etom@igel.co.jp>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "guchun.chen@amd.com" <guchun.chen@amd.com>,
 "bernard@vivo.com" <bernard@vivo.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "Jerry.Zuo@amd.com" <Jerry.Zuo@amd.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "Yuliang.Shi@amd.com" <Yuliang.Shi@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "sean@poorly.run" <sean@poorly.run>,
 "tomba@kernel.org" <tomba@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "roman.li@amd.com" <roman.li@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTEwLTE4IGF0IDE5OjI4ICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Ogo+ID4gQEAgLTI3MSw3ICsyNjAsOCBAQCBzdGF0aWMgaW50IGhpYm1jX2xvYWQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikKPiA+IMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPiA+IAo+ID4gLcKgwqDCoMKgIHJldCA9IGRybW1f
dnJhbV9oZWxwZXJfaW5pdChkZXYsIHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAwKSwgcHJpdi0K
PiA+ID5mYl9zaXplKTsKPiA+ICvCoMKgwqDCoCByZXQgPSBkcm1tX3ZyYW1faGVscGVyX2luaXQo
ZGV2LCBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2lfcmVzb3Vy
Y2VfbGVuKHBkZXYsIDEpKTsKPiAKPiBUaGlzIHNob3VsZCBiZSBwY2lfcmVzb3VyY2VfbGVuKHBk
ZXYsIDApLiBBcGFydCBmcm9tIHRoYXQsCgpFaCwgeWVzLCBvZiBjb3Vyc2UuIFRoYW5rcyEKCj4g
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KCgp6Cg==
