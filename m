Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D240735A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 00:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020886EAC8;
	Fri, 10 Sep 2021 22:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4423C6EAC6;
 Fri, 10 Sep 2021 22:27:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="221246141"
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="221246141"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 15:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="549734897"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2021 15:27:21 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 15:27:21 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 15:27:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 10 Sep 2021 15:27:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 10 Sep 2021 15:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9BFVH3tao29hiRxCsQphlzo3iAHNwqYFSpoZ5QLCWa51nJz0LfwozuGQYgDsIeQjtXqHUc41Csefc7F/9E3nKHN1fldKapoYDBBdCmQHK8sZCg2tLH8S3lzmYgsk1zyDeoK5rLg+ln0pErg+IcbikvwVAvvCkYd+0iScAsm3Vo6ZvkMT/BdGI8Aa8qYTsVNoomInsexHqNLtnpNXf0OYK3HOLGgM0TsKlFlTHef8QZr5GRlh3EDnsUdLGMgPP4otMYZYWHGyhdax5zZAWumVrdSFMajmyHoxwkEWsiKBIRxTmo2aZdraOR1h6wuBI0SW3Qq/nIKBc+P3HsNmh1CLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EPulQMenjV0Hkt1plUwVT7x4p8BTAssTkkmWYV6K6HE=;
 b=f70GWjLUUcMoifd5ah+MwR6dTJgZNjHCqtDWmXSqMeYYuJx8sfyZSkBSAoRQclCCBdqECVSpwgqYC9A28P90Gf04xrlhP6K0N8KFdeIq1vvmJdKuhIZpxh6zJxF2GHfafMzHuENSos+i5iv1lS6gEfZPoG7Z18WF0a5tA9UPwzEAyuRSAACr1qrmattwbuoXQSLkhPiFr8uAHE1mIaiOVsPIEF29CRZWEDIdDs3hJHOvFzNFWGm7BIIRpCd9TWMp5QbRUt5x2RBhwh7rZ9/9H2gNouB6RSF0gkR1SjHeANWczrEYMCpGbNGPP4wLsgmiE+fUubEmagY0s+HOB/e32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPulQMenjV0Hkt1plUwVT7x4p8BTAssTkkmWYV6K6HE=;
 b=EiCpmOvIfZ3FeZ7sLB3uNxHpmdFCa8bGhueTY2bGfjwmvVUZiQ+x1MuyiP1Ssa6H3hftd8NmeHTwpT89ciDevFIlxVK6lXsjSKVQOgDEvvtw4pG1X/nVbXSxMM2xDAGywxLI8s8+RhnoTVgw1EHgZCWRtFZymHpyen7Wf2hfeeE=
Received: from BYAPR11MB3784.namprd11.prod.outlook.com (2603:10b6:a03:fe::10)
 by BY5PR11MB3863.namprd11.prod.outlook.com (2603:10b6:a03:18a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 10 Sep
 2021 22:27:20 +0000
Received: from BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::7d17:fce5:7d65:61e1]) by BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::7d17:fce5:7d65:61e1%5]) with mapi id 15.20.4500.018; Fri, 10 Sep 2021
 22:27:20 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v9 15/17] drm/i915/pxp: add pxp debugfs
Thread-Topic: [Intel-gfx] [PATCH v9 15/17] drm/i915/pxp: add pxp debugfs
Thread-Index: AQHXploxdD1ew8c4vUaugx2r0bRULaud2WuA
Date: Fri, 10 Sep 2021 22:27:19 +0000
Message-ID: <892db4b05014e2fbc2bcc5bd73c8396ccb95c9a7.camel@intel.com>
References: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
 <20210910153627.1060858-16-daniele.ceraolospurio@intel.com>
In-Reply-To: <20210910153627.1060858-16-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf7dee84-6789-410c-88c8-08d974aa2737
x-ms-traffictypediagnostic: BY5PR11MB3863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3863DC471A0A4E497A12EED68AD69@BY5PR11MB3863.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gPs3VojETa2vAXWlP7K5sy9J+lHXIgL51fxjFwvXFozEZL2pk88bGYwfzL8Y1L/mbUMZX3dnRaCl7XLCw7WR039wVu/2vjOxGC1CW6Ifh2alr0Y0FOHRdqmCRRguWY+3LuozYdmaHMHvG12L4b+Wc2cKYcZziuLZvBMwnMuRWHI13r4LjaQ9e4ZbA+KhTlEfVGAwKOcnmMHaiewrW72tdH/wq/Divh57Mq+3AoKIUxca6Vc6U2UyQ6bw2FFAzIh/ztiafgPw+PGZvUlWV3oJbFqvqFwbbg5X5E15zCAU15Smfnyoh7LRS8xhIhQtYW+5OkDGswBkQg+GTTPMputrtWFHB1mUctOJ1jYuSsJCc+4l3CJ3yI1u14n2Wvx0tX6f4qrmdBfYS+OXnKzjDK1LelF6gUDY3mz8medALiCFOR955USSwxAOK7RC/ZolZySU2kK7sYdJJG6CXHOd0d2lYfiVJcY6K+av6Uwu2nWIuHknAT5AcNjW/Q1qsTUt2CNj4yIlE/yVybUamO7EC8eH+viEIuHPmN5PDYLboM2H//cJ+qVOdMe81mK0ZXdzEzrBCXi1eUktEqKhG/pPwOOtkyU2ARcuRtro2PoePXWrrzlXnOk3TVHp4MpprTJGilNSoRMN36uT7IRxuGjooxKdcMzF5eSSzeygwZyMZIgq/E7N5SP+Bn9r0PZIYCYRYapFSHqwb/qk3+RY3bGxPBrWjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3784.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(38070700005)(316002)(2906002)(66556008)(6512007)(450100002)(6506007)(6486002)(64756008)(71200400001)(86362001)(66946007)(8676002)(122000001)(8936002)(478600001)(4326008)(110136005)(83380400001)(2616005)(26005)(5660300002)(186003)(76116006)(38100700002)(36756003)(66446008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmFsTlBVZDIzTFpKN0ZyZkN1K3NacUViSUVVWVJXTS9ocHViRXRQby9MT3gr?=
 =?utf-8?B?RVNsQm5nMGtVL2hCam5Vc3J4ZTRyV0svSVhpK0FGWHU0TUhjZ2Z6TiszZlRT?=
 =?utf-8?B?NEp2dnF0Y1lJbVErNkpvT3NpcUVnalk4Z1pXRnhiSm43bUYySURaV1A5b3Fo?=
 =?utf-8?B?Q3pJMk9nUEFyeWc4OUltTGZlVjlINHlKZlk3VTd4UUdwVGpQVHNaN0hOV1Fx?=
 =?utf-8?B?SzJkZTJLeGgyYlpSWGk1UFV6YTNLbkdvNDhvUzlmMnVGSHRnQS8vOVJqcUJP?=
 =?utf-8?B?enRDQi81ZHRlZUVuSmdpMXo4V2kzd2ZFNVZmdmJoa0ZXSzhJaHBTV2pmNzRr?=
 =?utf-8?B?NHJRekZGVDQ4UFVIWWRIU3lHNkVDUGpkWnorYjNXamFENzBhb2VONnNaTzla?=
 =?utf-8?B?MjA4VzZlM0t3SkNnL1I3eTA3blMybGVlWnM5TnlWcS8rOGpNYWt4T2tmL0RR?=
 =?utf-8?B?RVpDWE0yejlGTGxJRysxUkhCYjJUTEZrQzFaeTZUNmU2cms1dlJKRk0zM3hm?=
 =?utf-8?B?c0VHTGhyTXB0VmUzYXZlQ3huUis3cVVGc1BzTGxMRzF6eEJjZHVpZlVxcFor?=
 =?utf-8?B?Y3h2SC9zWi9tWVhjenlCMkNWcHVtZXlFWm8raGY0RytWSVdNZGh6ckcwTnRV?=
 =?utf-8?B?QXl1QlE2OUdrQXZOQ1MrSysyaVF3Q2RqS2FRaFcwdnU0TThScnNvTTVvYUhy?=
 =?utf-8?B?bTA2ak50bE5pVkxIMjJ3T3lRNGRId2w2MnZMdHRUYUc4c21nbW1pRXJmT2Rq?=
 =?utf-8?B?YWh3YXRteGM2Y0pPSXp2a01HMmVwMjZQczkvMEMxK3pjRU9relNVVG1OTG12?=
 =?utf-8?B?TTR2RHVvZlNqdmVQOHdCaUQxelV4allwc3BPY0R4R3lHNDN3ejBNS3Z1eGh5?=
 =?utf-8?B?SkgxZ0Y2d3EyT3crS3lMWjlHbmpUSzRRWUxDMjV4ZmUrbWt3SlduSFNnRHRU?=
 =?utf-8?B?eGZRUElQZTVSdUM0NVFtUHdoeW5ma0dudlh4MmErNkYrSGNuM3U1bXM1YVYw?=
 =?utf-8?B?UjV6WWJaL0JiRWRWUkhabVp3M1pvRzIzQWpaUGJBME0xQ1BRcmFBaHhZSUZn?=
 =?utf-8?B?U01YajRtN3RSdS9ySDh4SlB1S0QzWlNsWVQ2ZHQ4K3pkcVF6Mk5ybkFMR0h3?=
 =?utf-8?B?NDVHZFFJSFBRYUhieElsRnRJSFVzSXM3Z0JDVDVwc1lyYUoxekJRK3VSSCtS?=
 =?utf-8?B?b0JIeDFWc1JTN3hDajVpb0hnWnVHR2FQaG9Vejd5dWRTODFHWVlzNE5HeDgv?=
 =?utf-8?B?MUJMcG9CMFVicTZGVjR3aWFqMS81eStHNXpYWHJpcWVIUUdESGlJOWpsYWtC?=
 =?utf-8?B?bWt6K0FRWUlyUWI5SUJMcnRCUmdvb3p5aTUrRjNCcXRaWVFUd3hsamNEakxq?=
 =?utf-8?B?Wnc0SXpYekZiZ1V3azVCRURGbXpVVVNIR094ZW5ETTFaaG5DY0ZjTkRMOVJH?=
 =?utf-8?B?Ny9tKzlXVzI3SnA1MlFjVmZ4b2Q4cVlJcmFwcm9qM2RBQ0k5MWFtcHJMb0dS?=
 =?utf-8?B?UnUrVXNyNUV1bHpsZ0wzTGtLU3o3Y0dkSElEUlZPNHZ2S0NBbDVxdXMxUlZk?=
 =?utf-8?B?aHpPd09rNCtOOXJLL1ZrUCtBODFiTEJlemxReDdWRU9Bb0hwRVhFK0lSR3pF?=
 =?utf-8?B?a0NLNjZOa3FHbEY4WkJzQmtXSVhUbXdqREVJVGpCTHhQMDFqS0FzL2prb1dK?=
 =?utf-8?B?cTd1QnF6ZHRwNlhyRzNEaGE5RGgvVWVRQ0FJcTZzVzBnOEdPSmcxL3RuN1Fu?=
 =?utf-8?Q?4suTRV81SZNU2qDXdCTpi3oAyFYCRUAeKGYe9gp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD29526A132FD74EAD3E3956FA1AEC1C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7dee84-6789-410c-88c8-08d974aa2737
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 22:27:19.9140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkE71sPEJFbLsTxhmkY8Wh7HuRA45YOgbgaR5hJxv+RP0LXgqvCY4++fiv7t/zmrAJAOSar5dVgi3XfWVaSzUIogRrsct0M+DxJs5B4h59blgeHTxDviR2o3kI4UTLGZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3863
X-OriginatorOrg: intel.com
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPiANCg0KLi5hbGFuDQoNCk9uIEZyaSwgMjAyMS0wOS0xMCBhdCAwODozNiAtMDcwMCwgRGFu
aWVsZSBDZXJhb2xvIFNwdXJpbyB3cm90ZToNCj4gMiBkZWJ1Z2ZzIGZpbGVzLCBvbmUgdG8gcXVl
cnkgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoZSBweHAgc2Vzc2lvbiBhbmQgb25lDQo+IHRvIHRy
aWdnZXIgYW4gaW52YWxpZGF0aW9uIGZvciB0ZXN0aW5nLg0KPiANCj4gdjI6IHJlbmFtZSBkZWJ1
Z2ZzLCBmaXggZGF0ZSAoQWxhbikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5
IDogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgMSAr
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9kZWJ1Z2ZzX2d0LmMgICAgICAgICB8ICAyICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfZGVidWdmcy5jIHwgNzggKysr
KysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBf
ZGVidWdmcy5oIHwgMjEgKysrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEwMiBpbnNlcnRpb25z
KCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF9kZWJ1Z2ZzLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9weHAvaW50ZWxfcHhwX2RlYnVnZnMuaA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gaW5k
ZXggMzY2ZTgyY2VjNDRkLi5iNDY0NzRlZTFhMWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxl
DQo+IEBAIC0yODUsNiArMjg1LDcgQEAgaTkxNS15ICs9IGk5MTVfcGVyZi5vDQo+ICBpOTE1LSQo
Q09ORklHX0RSTV9JOTE1X1BYUCkgKz0gXA0KPiAgCXB4cC9pbnRlbF9weHAubyBcDQo+ICAJcHhw
L2ludGVsX3B4cF9jbWQubyBcDQo+ICsJcHhwL2ludGVsX3B4cF9kZWJ1Z2ZzLm8gXA0KPiAgCXB4
cC9pbnRlbF9weHBfaXJxLm8gXA0KPiAgCXB4cC9pbnRlbF9weHBfcG0ubyBcDQo+ICAJcHhwL2lu
dGVsX3B4cF9zZXNzaW9uLm8gXA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvZGVidWdmc19ndC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZGVidWdmc19ndC5jDQo+
IGluZGV4IDU5MWViNjA3ODVkYi4uYzI3ODQ3ZGRiNzk2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9kZWJ1Z2ZzX2d0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvZGVidWdmc19ndC5jDQo+IEBAIC05LDYgKzksNyBAQA0KPiAgI2luY2x1ZGUgImRlYnVn
ZnNfZ3QuaCINCj4gICNpbmNsdWRlICJkZWJ1Z2ZzX2d0X3BtLmgiDQo+ICAjaW5jbHVkZSAiaW50
ZWxfc3NldV9kZWJ1Z2ZzLmgiDQo+ICsjaW5jbHVkZSAicHhwL2ludGVsX3B4cF9kZWJ1Z2ZzLmgi
DQo+ICAjaW5jbHVkZSAidWMvaW50ZWxfdWNfZGVidWdmcy5oIg0KPiAgI2luY2x1ZGUgImk5MTVf
ZHJ2LmgiDQo+ICANCj4gQEAgLTI4LDYgKzI5LDcgQEAgdm9pZCBkZWJ1Z2ZzX2d0X3JlZ2lzdGVy
KHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+ICAJaW50ZWxfc3NldV9kZWJ1Z2ZzX3JlZ2lzdGVyKGd0
LCByb290KTsNCj4gIA0KPiAgCWludGVsX3VjX2RlYnVnZnNfcmVnaXN0ZXIoJmd0LT51Yywgcm9v
dCk7DQo+ICsJaW50ZWxfcHhwX2RlYnVnZnNfcmVnaXN0ZXIoJmd0LT5weHAsIHJvb3QpOw0KPiAg
fQ0KPiAgDQo+ICB2b2lkIGludGVsX2d0X2RlYnVnZnNfcmVnaXN0ZXJfZmlsZXMoc3RydWN0IGRl
bnRyeSAqcm9vdCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRl
bF9weHBfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9kZWJ1
Z2ZzLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYmIx
ODUzNjc2Y2MNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9w
eHAvaW50ZWxfcHhwX2RlYnVnZnMuYw0KPiBAQCAtMCwwICsxLDc4IEBADQo+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjEgSW50
ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvZGVidWdmcy5o
Pg0KPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gKw0KPiArI2luY2x1ZGUgImd0L2Rl
YnVnZnNfZ3QuaCINCj4gKyNpbmNsdWRlICJweHAvaW50ZWxfcHhwLmgiDQo+ICsjaW5jbHVkZSAi
cHhwL2ludGVsX3B4cF9pcnEuaCINCj4gKyNpbmNsdWRlICJpOTE1X2Rydi5oIg0KPiArDQo+ICtz
dGF0aWMgaW50IHB4cF9pbmZvX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQ0K
PiArew0KPiArCXN0cnVjdCBpbnRlbF9weHAgKnB4cCA9IG0tPnByaXZhdGU7DQo+ICsJc3RydWN0
IGRybV9wcmludGVyIHAgPSBkcm1fc2VxX2ZpbGVfcHJpbnRlcihtKTsNCj4gKwlib29sIGVuYWJs
ZWQgPSBpbnRlbF9weHBfaXNfZW5hYmxlZChweHApOw0KPiArDQo+ICsJaWYgKCFlbmFibGVkKSB7
DQo+ICsJCWRybV9wcmludGYoJnAsICJweHAgZGlzYWJsZWRcbiIpOw0KPiArCQlyZXR1cm4gMDsN
Cj4gKwl9DQo+ICsNCj4gKwlkcm1fcHJpbnRmKCZwLCAiYWN0aXZlOiAlc1xuIiwgeWVzbm8oaW50
ZWxfcHhwX2lzX2FjdGl2ZShweHApKSk7DQo+ICsJZHJtX3ByaW50ZigmcCwgImluc3RhbmNlIGNv
dW50ZXI6ICV1XG4iLCBweHAtPmtleV9pbnN0YW5jZSk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4g
K30NCj4gK0RFRklORV9HVF9ERUJVR0ZTX0FUVFJJQlVURShweHBfaW5mbyk7DQo+ICsNCj4gK3N0
YXRpYyBpbnQgcHhwX3Rlcm1pbmF0ZV9nZXQodm9pZCAqZGF0YSwgdTY0ICp2YWwpDQo+ICt7DQo+
ICsJLyogbm90aGluZyB0byByZWFkICovDQo+ICsJcmV0dXJuIC1FUEVSTTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGludCBweHBfdGVybWluYXRlX3NldCh2b2lkICpkYXRhLCB1NjQgdmFsKQ0KPiAr
ew0KPiArCXN0cnVjdCBpbnRlbF9weHAgKnB4cCA9IGRhdGE7DQo+ICsJc3RydWN0IGludGVsX2d0
ICpndCA9IHB4cF90b19ndChweHApOw0KPiArDQo+ICsJaWYgKCFpbnRlbF9weHBfaXNfYWN0aXZl
KHB4cCkpDQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiArDQo+ICsJLyogc2ltdWxhdGUgYSB0ZXJt
aW5hdGlvbiBpbnRlcnJ1cHQgKi8NCj4gKwlzcGluX2xvY2tfaXJxKCZndC0+aXJxX2xvY2spOw0K
PiArCWludGVsX3B4cF9pcnFfaGFuZGxlcihweHAsIEdFTjEyX0RJU1BMQVlfUFhQX1NUQVRFX1RF
Uk1JTkFURURfSU5URVJSVVBUKTsNCj4gKwlzcGluX3VubG9ja19pcnEoJmd0LT5pcnFfbG9jayk7
DQo+ICsNCj4gKwlpZiAoIXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmcHhwLT50ZXJtaW5h
dGlvbiwNCj4gKwkJCQkJIG1zZWNzX3RvX2ppZmZpZXMoMTAwKSkpDQo+ICsJCXJldHVybiAtRVRJ
TUVET1VUOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK0RFRklORV9TSU1QTEVf
QVRUUklCVVRFKHB4cF90ZXJtaW5hdGVfZm9wcywgcHhwX3Rlcm1pbmF0ZV9nZXQsIHB4cF90ZXJt
aW5hdGVfc2V0LCAiJWxseFxuIik7DQo+ICt2b2lkIGludGVsX3B4cF9kZWJ1Z2ZzX3JlZ2lzdGVy
KHN0cnVjdCBpbnRlbF9weHAgKnB4cCwgc3RydWN0IGRlbnRyeSAqZ3Rfcm9vdCkNCj4gK3sNCj4g
KwlzdGF0aWMgY29uc3Qgc3RydWN0IGRlYnVnZnNfZ3RfZmlsZSBmaWxlc1tdID0gew0KPiArCQl7
ICJpbmZvIiwgJnB4cF9pbmZvX2ZvcHMsIE5VTEwgfSwNCj4gKwkJeyAidGVybWluYXRlX3N0YXRl
IiwgJnB4cF90ZXJtaW5hdGVfZm9wcywgTlVMTCB9LA0KPiArCX07DQo+ICsJc3RydWN0IGRlbnRy
eSAqcm9vdDsNCj4gKw0KPiArCWlmICghZ3Rfcm9vdCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJ
aWYgKCFIQVNfUFhQKChweHBfdG9fZ3QocHhwKS0+aTkxNSkpKQ0KPiArCQlyZXR1cm47DQo+ICsN
Cj4gKwlyb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJweHAiLCBndF9yb290KTsNCj4gKwlpZiAo
SVNfRVJSKHJvb3QpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlpbnRlbF9ndF9kZWJ1Z2ZzX3Jl
Z2lzdGVyX2ZpbGVzKHJvb3QsIGZpbGVzLCBBUlJBWV9TSVpFKGZpbGVzKSwgcHhwKTsNCj4gK30N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfZGVidWdm
cy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9kZWJ1Z2ZzLmgNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi43ZTBjM2QyZjVkN2UNCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhw
X2RlYnVnZnMuaA0KPiBAQCAtMCwwICsxLDIxIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjEgSW50ZWwgQ29ycG9y
YXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fSU5URUxfUFhQX0RFQlVHRlNfSF9fDQo+
ICsjZGVmaW5lIF9fSU5URUxfUFhQX0RFQlVHRlNfSF9fDQo+ICsNCj4gK3N0cnVjdCBpbnRlbF9w
eHA7DQo+ICtzdHJ1Y3QgZGVudHJ5Ow0KPiArDQo+ICsjaWZkZWYgQ09ORklHX0RSTV9JOTE1X1BY
UA0KPiArdm9pZCBpbnRlbF9weHBfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgaW50ZWxfcHhwICpw
eHAsIHN0cnVjdCBkZW50cnkgKnJvb3QpOw0KPiArI2Vsc2UNCj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZA0KPiAraW50ZWxfcHhwX2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IGludGVsX3B4cCAqcHhwLCBz
dHJ1Y3QgZGVudHJ5ICpyb290KQ0KPiArew0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4gKyNlbmRp
ZiAvKiBfX0lOVEVMX1BYUF9ERUJVR0ZTX0hfXyAqLw0KPiAtLSANCj4gMi4yNS4xDQo+IA0KDQo=
