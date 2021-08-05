Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A63E1F99
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 01:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DEC6E899;
	Thu,  5 Aug 2021 23:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5885D6E8F2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 23:53:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="236252344"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="236252344"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 16:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="437977717"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 05 Aug 2021 16:53:50 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 5 Aug 2021 16:53:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 5 Aug 2021 16:53:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 5 Aug 2021 16:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcMOhe/UFCUQNfcam5M175cOYccHn/qUOtzlVnyDyUy7+GA4pPZL+OaT1Op56utFt3y1qRwCCytJVzh2QBqsx5SKb5k8LUX+edSvb3AEgW3ydvmXeMJCvNAa41LkCnthPwkzyq3GYELOLH5ZdoPNuEapdfgKO7GrmEDRkS7YyYJSbZcRstmAaRqxo6Qxh2RyeSJxQee45hdWGEdFlxlV9I/YhFgmbQn02R8Djgb6HDj5FUsuQdeRvJ+OrHAJ866XqSPm1awHQ7s12J7KK8tcqD7i2dJH0WMPk1xuA1dkggAAXq2YS2aRZLyzJVFNnMj0TBUPKgk9VpSRaDXppg4wQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYlF5VPMqFcrlKWXa+c8mSIWLCKd96/VDlETH1BD1To=;
 b=NNR8A96t32OyFM6W8SUXdCN42yTrSCvcIYegoIHXBvQ1RnAY7VcDAcjeZ0JHETTDVKddmr5qmoaEtYPbn40WtphjNDfWBX0IHVUk1o+cCmbEB3eSkMFn3DJeqFIp+hYHELqJ4ps2y/YgcB7y85EdVACd5xvBkcI+p8wv1H6lTLQps5USEdnahfCTmJYDLOGeRnYRz41ciKX33VdVNY7yl9YqpqtfUH+sjE/63OH9VJaz/fohrJIuBDt2P4yVTdhzWjYlGpKlcnBaHYNvAO9bxZgADMFhOPQ9ckQGgP0DUw0Ef8ij6hhPPUlk+1xl4QfAQeZh24xDLZWjkDLsQFxQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYlF5VPMqFcrlKWXa+c8mSIWLCKd96/VDlETH1BD1To=;
 b=TcpiD5yPOw2XiO1I0Itv6L/1FExwDDWPDM82L7kyLKtG/beWldrqRjDZJSecKRuUEOMoi/HFl+nN4QcwETh9nlpBaH4XY/IwSoEUKSWjm4c4zIiW0YEk4YFCjDRUa7PPG/Qfd6TMwtQTvg8B+xprwHXoU2BgFqdZlKybsg8pX6Y=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Thu, 5 Aug
 2021 23:53:48 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::64ff:14d5:eaf7:315c%7]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 23:53:48 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Dea, Edmund J" <edmund.j.dea@intel.com>
Subject: RE: [PATCH 02/14] drm/kmb: Define driver date and major/minor version
Thread-Topic: [PATCH 02/14] drm/kmb: Define driver date and major/minor version
Thread-Index: AQHXg0gBs+8UDfQ6NkWod6Z1zcFWF6tjskeAgAHxSrA=
Date: Thu, 5 Aug 2021 23:53:48 +0000
Message-ID: <BY5PR11MB4182E3F8938BDF3174D5516E8CF29@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-2-anitha.chrisanthus@intel.com>
 <eced0f97-06c1-9af3-29ca-8b92b31f2370@suse.de>
In-Reply-To: <eced0f97-06c1-9af3-29ca-8b92b31f2370@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b69de179-dbbe-44ea-0664-08d9586c44dd
x-ms-traffictypediagnostic: BYAPR11MB3767:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3767EEFA3BE54A3DE4A3DC778CF29@BYAPR11MB3767.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uEzoSq4BJ0P9nkYDlStmB786wKterWWWw9weYhx0O2ltY9uVSwmiXlMJ7f66D3aHoHcuRjjzu61XOyHH90XN6vlytPUPghrL65pXi0DGIQ94WJNv2VQ9e47/VWV/3IBqu7hOfP3ilp2ce5O46ChqpkJlvKl5Ro1OST9A+XQk5nW9rUlQY+mmW6TmXN9fRceDo+g3IvgL0oVWQglUcHmitiWalZBNrg53sSdg1TcxVqI/PKOOYlzr7AJQ2pImC6xdB7heLhuIN3qDsDNMpC5IxHWeIT1N6ZmRysxDQLFaMWRLt4F/QJC43UEglsSa3BERzshK1DQvFKUCLEAMNB+iHAqUdJl0OfXZnCqb0ITJvqUsnCzCPn03vaIy4Ggr3KfcMYuj0arwwUd66ZU9ECSygbT0wO4Qw+C29V7ndO7eqRwFqjyCHB2ZvdfKNQhESO9sbIG/DatGytTiBPZQV0WGX2vQFFibmopeVL9xU2fdHGgI5BUxQUMF7xMy03987AhbWHcNIflp3T0Cf34DMBFb8PcbVQ8j3s5bPO33pECojxYemmmafo2dOCq6dInapN9tyYAcuWWSvUwgHZTAzrqGZyD7oheVzYPQrk9/vPPKe75F+3ENuoL8Fk47ynZvBGai525/iPJ2A0OvkychuCpEi/MpMrB9pVfL/qfDCePCNDj68aKtQqle5bY+O0xS83YOFj0i6r3mnb9OMYcD/a1Jvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(38100700002)(8676002)(26005)(316002)(38070700005)(122000001)(6636002)(2906002)(110136005)(86362001)(8936002)(186003)(7696005)(33656002)(83380400001)(9686003)(55016002)(478600001)(5660300002)(66946007)(76116006)(71200400001)(66476007)(52536014)(66556008)(6506007)(66446008)(64756008)(66574015)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0QwUGpGSVZZcXc0Sm1vVTltVWM3VG9kQk81QmIwcStBYmNvMkwrTmY5SU1m?=
 =?utf-8?B?TDh1RUFZWnhWbVVsM0srbkN6c2UxaUI5a3l0MnR3Z0pMcDY4WUl0YUlaemhy?=
 =?utf-8?B?NE53eGEvcC9VMDFlUjdwRk8xRXE3bGZrNm9aZmUyMG1SOEc5R1Q1OC9NNG9C?=
 =?utf-8?B?bDhHV2J4NHRxcGlMWW1xdGF2Zk9wejN0TDlaNEk0a2ZQZ1pkK1B6UkMzQWZ0?=
 =?utf-8?B?K0JnT3dFNHJISGRFTmp3Y2JwL0x5cFJzYXcxeE8xUXpmUFM1WXZVTFhTS3ZP?=
 =?utf-8?B?UEJFUGVmQngyUFZNc29saG1MczJ6VW1JekNOeFRkQmZlUnBpSnVua1lhOXJt?=
 =?utf-8?B?dHdkQUE5MmlYVXVmZUsvY3QvYnBudzdRTFZqa1hWWjNrQUN1bUFtVTRCckZM?=
 =?utf-8?B?bFhOVnNPV1lxZHZYd3J2bUFzRG4xWjkvN1duM3NaeSthRTF3RGdXZURhV3NO?=
 =?utf-8?B?Rk5ZYW9RUzVqcW9JQjVYTHdOaG91SVV5YVdmK01KSXBOVDNoZDV1K1FaMmVz?=
 =?utf-8?B?K0l5V3BramZISnlta1RmdWlERWUxaC9oTUpkMzJyRVdnTzFPOVVOQ1N5aytF?=
 =?utf-8?B?WGV6eUpmeUlndFBuWW9IZ1dwUVZqdUkyTjVLUlo5a0JOWkZTNTEwL0EvTEJY?=
 =?utf-8?B?dUJ4Zk9IRlJBTkpuMmx5NmpuM3E5V1A0Smxlc2kyMWNQVUF2bFE2cHpiNnhs?=
 =?utf-8?B?SHZISmlKVHBGYkNYRm84K1FRQ0VLSGp1MURLUkhkbTJpL1dwYVFkNXlTNHVW?=
 =?utf-8?B?VTNUOUlXQ2g3MytCQ1dpK1B1NUIzdHBQNWpTRVcvdjhBbGx2TWVINHhVLzlT?=
 =?utf-8?B?YXFObFBuL1YxQ1BKdnNiR0lROU9mcU5VZkZYb041U20waTk5MDN2NFdvYndN?=
 =?utf-8?B?NEVlRjhrd2FWTEJjVEpKODFaeUgzeDVuMitsNDQxWmt6bXM1dEltYzZtMEQ0?=
 =?utf-8?B?b2x6V2ZyNW95dUR1cEVoY2xseHVQdHNuZC9IaDM3b2U5NCsxUlVXRy91Vkdz?=
 =?utf-8?B?b0NFTXFzMTVNdGpEMWxwb3lNczdEOFVDQklHQTh5TEtGaE9DU0lsdThMeTFF?=
 =?utf-8?B?K284dmRBelVqVjlPc2t6Uy9GNmN3bXNzd0FhM05kUVhpcmFJc0ZKdGNLNVlP?=
 =?utf-8?B?VFlTMGF4ME5Eb2JCaDNtM2Y4N0xlL2dvV21iQkZNWGRtenE2QmxzMndCYWZR?=
 =?utf-8?B?K3Qvc0FpNHRPRnRRUG5pVmdnRkJhLzhZVnBYOGx6cjBxYkxOSWhrM3Nhc1Vy?=
 =?utf-8?B?c2RSMU9YQi9oOERBK0xWSVdLTDd1N1dxM0JCTTZQTHdLWnA2OFFLVnE2Z1ds?=
 =?utf-8?B?RHhYSXNjNFF2M243SjRCWm1rOFdLbEJqY2hpTTJoQk5nYVlCTDUxc3RMV0lF?=
 =?utf-8?B?Sk5xUXJDTGw0U2ZYWWNZZjEwT2tRMUpBK2pDc0pMOUhRaktrcTRCR3liSUw3?=
 =?utf-8?B?WjdPc3F2ckhFNm0xMTMyYytsZ3RYcHFlTEtRaCt0djN2K0FWdU1oOTQyMEhP?=
 =?utf-8?B?M1FBOUpsREJhSlhPWDZqT2o1TjN1V1hITUE1RUlDbHh1YUdYVUM2UnVGKy9n?=
 =?utf-8?B?R1hrcWtwRWM2VzdoalNGaVZuZnYxYUdWNTd0NHNjYnZSNEQrVG5oT3ZqdEQv?=
 =?utf-8?B?b3NjdEx4Mk9sVmFLTDJ6SDFzNVpmc1RKWWUwWnJ1SE1pMkJxWGRDaVRJbFNs?=
 =?utf-8?B?b0w0aXpiZkxGdStkR3RsN0xkYVd2aHJ6ZUg3MmVRWDFJbW1Lb0NSb0FsUHEr?=
 =?utf-8?Q?LkJrRqkAfo1Y3lO788=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69de179-dbbe-44ea-0664-08d9586c44dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 23:53:48.3314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxtlMuuH9iRbUcIxKYTPujJ3uV2MlhPrYa4foBeMPloSXXH1/SN9PYc5pN1j9u3L398krF05Vpq189FomqN/34D1Uupf/pu2sRkAk8dJuA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
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

VGhhbmtzIFRob21hcywgSSdsbCBrZWVwIHRoaXMgaW4gbWluZCBmb3IgdGhlIG5leHQgcGF0Y2gu
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBUaG9t
YXMgWmltbWVybWFubg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA0LCAyMDIxIDExOjEzIEFN
DQo+IFRvOiBDaHJpc2FudGh1cywgQW5pdGhhIDxhbml0aGEuY2hyaXNhbnRodXNAaW50ZWwuY29t
PjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlYSwgRWRtdW5kIEogPGVk
bXVuZC5qLmRlYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDIvMTRdIGRybS9r
bWI6IERlZmluZSBkcml2ZXIgZGF0ZSBhbmQgbWFqb3IvbWlub3INCj4gdmVyc2lvbg0KPiANCj4g
SGksDQo+IA0KPiBqdXN0IGEgZnJpZW5kbHkgcmVtaW5kZXIgdGhhdCBicmFuY2hlcyB0aGF0IGVu
ZCB3aXRoIC1maXhlcyBhcmUgZm9yDQo+IGZpeGVzIHRoYXQgYXJlIHJlcXVpcmVkIGluIHVwc3Ry
ZWFtIEFTQVAuIEkgZm91bmQgdGhpcyBwYXRjaCBpbg0KPiBkcm0tbWlzYy1maXhlcy4gSXQncyBu
b3QgaW1wb3J0YW50LCBzbyBpdCBzaG91bGQgaGF2ZSBnb25lIGludG8NCj4gZHJtLW1pc2MtbmV4
dCBpbnN0ZWFkLg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4gQW0gMjguMDcu
MjEgdW0gMDI6MzEgc2NocmllYiBBbml0aGEgQ2hyaXNhbnRodXM6DQo+ID4gRnJvbTogRWRtdW5k
IERlYSA8ZWRtdW5kLmouZGVhQGludGVsLmNvbT4NCj4gPg0KPiA+IEFkZGVkIG1hY3JvcyBmb3Ig
ZGF0ZSBhbmQgdmVyc2lvbg0KPiA+DQo+ID4gRml4ZXM6IDdmN2I5NmE4YTBhMSAoImRybS9rbWI6
IEFkZCBzdXBwb3J0IGZvciBLZWVtQmF5IERpc3BsYXkiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEVk
bXVuZCBEZWEgPGVkbXVuZC5qLmRlYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0va21iL2ttYl9kcnYuYyB8IDggKysrKy0tLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9rbWIva21iX2Rydi5oIHwgNSArKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2ttYi9rbWJfZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kcnYuYw0K
PiA+IGluZGV4IGMwYjFjNmY5OTI0OS4uZjU0MzkyZWM0ZmFiIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9rbWIva21iX2Rydi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2tt
Yi9rbWJfZHJ2LmMNCj4gPiBAQCAtNDI1LDEwICs0MjUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZHJpdmVyIGttYl9kcml2ZXIgPSB7DQo+ID4gICAJLmZvcHMgPSAmZm9wcywNCj4gPiAg
IAlEUk1fR0VNX0NNQV9EUklWRVJfT1BTX1ZNQVAsDQo+ID4gICAJLm5hbWUgPSAia21iLWRybSIs
DQo+ID4gLQkuZGVzYyA9ICJLRUVNQkFZIERJU1BMQVkgRFJJVkVSICIsDQo+ID4gLQkuZGF0ZSA9
ICIyMDIwMTAwOCIsDQo+ID4gLQkubWFqb3IgPSAxLA0KPiA+IC0JLm1pbm9yID0gMCwNCj4gPiAr
CS5kZXNjID0gIktFRU1CQVkgRElTUExBWSBEUklWRVIiLA0KPiA+ICsJLmRhdGUgPSBEUklWRVJf
REFURSwNCj4gPiArCS5tYWpvciA9IERSSVZFUl9NQUpPUiwNCj4gPiArCS5taW5vciA9IERSSVZF
Ul9NSU5PUiwNCj4gPiAgIH07DQo+ID4NCj4gPiAgIHN0YXRpYyBpbnQga21iX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0va21iL2ttYl9kcnYuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9rbWIva21iX2Rydi5oDQo+ID4g
aW5kZXggMDJlODA2NzEyYTY0Li5lYmJhYTVmNDIyZDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2ttYi9rbWJfZHJ2LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0va21iL2tt
Yl9kcnYuaA0KPiA+IEBAIC0xNSw2ICsxNSwxMSBAQA0KPiA+ICAgI2RlZmluZSBLTUJfTUFYX0hF
SUdIVAkJCTEwODAgLypNYXggaGVpZ2h0IGluIHBpeGVscyAqLw0KPiA+ICAgI2RlZmluZSBLTUJf
TUlOX1dJRFRIICAgICAgICAgICAgICAgICAgIDE5MjAgLypNYXggd2lkdGggaW4gcGl4ZWxzICov
DQo+ID4gICAjZGVmaW5lIEtNQl9NSU5fSEVJR0hUICAgICAgICAgICAgICAgICAgMTA4MCAvKk1h
eCBoZWlnaHQgaW4gcGl4ZWxzICovDQo+ID4gKw0KPiA+ICsjZGVmaW5lIERSSVZFUl9EQVRFCQkJ
IjIwMjEwMjIzIg0KPiA+ICsjZGVmaW5lIERSSVZFUl9NQUpPUgkJCTENCj4gPiArI2RlZmluZSBE
UklWRVJfTUlOT1IJCQkxDQo+ID4gKw0KPiA+ICAgI2RlZmluZSBLTUJfTENEX0RFRkFVTFRfQ0xL
CQkyMDAwMDAwMDANCj4gPiAgICNkZWZpbmUgS01CX1NZU19DTEtfTUhaCQkJNTAwDQo+ID4NCj4g
Pg0KPiANCj4gLS0NCj4gVGhvbWFzIFppbW1lcm1hbm4NCj4gR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4gTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KDQo=
