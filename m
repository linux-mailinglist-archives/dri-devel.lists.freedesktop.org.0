Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8535B22ECBC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 15:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE2589C16;
	Mon, 27 Jul 2020 13:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A1D89C16
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 13:01:56 +0000 (UTC)
IronPort-SDR: EdC31NsP3Ez2OjhZqpDIdfsR1sRx3YtC0V1rD9PmzQzTnrPxrHYN/QgGj4rLbZAffYEU9NjuMJ
 TElLxRhkwhrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="212530517"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="212530517"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 06:01:48 -0700
IronPort-SDR: cZFSWgnpYbOWngwmoteKxUo98IsrmgoWx/NSCdGhOp9gb0aYiS+AvG7tmsFrhrL7vckhvB3hYS
 ngD6w2mKNwBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="393975334"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2020 06:01:48 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Jul 2020 06:01:48 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Jul 2020 06:01:48 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.50) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 27 Jul 2020 06:01:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzeV3CPaF1JB/Vl1K21W+BMbbub6u6Wx4SKU3Qi9fTlKuLJnWQYaXvvpwkZuYgBlfoW6po/7ISPOCY52ykMSAT1fS+scVMFf716V07Do07zRbT5O0sXUP4oJYUJir9nu1CVIjzhk6dX2fk+3WtSUYK84EjCWfH4AvERSyirPf6p9wYa6sUL6//gCi3tdT1TLvp+viG7iPZruyCUIviX50dk117g2DndVQA1URn7sqJJqZqVvk30y164Itx4TQL9ypGx8Aazk93I5UguQlNo6GM1WEhxehu6QrfLr2ZwcTmykXp9dL0wXibpwWn49M40kByV6hlDBF6WcnnoKcg7ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUFWglSpLmhhpPVkf6kpDlpTzoqexIlTr9WRKhp8gME=;
 b=kHZZHv6dFochEj4JezFJdtrUQg2BzqSvuVcc5g7z4ZWmkbQm7jf+IYrYl+GF2+ebMLcC5pDUjG3MY8duo92kPdLHWULuG1uxt8XU14ExDYte70b4NjpYoHAz/i4aI7mRYFSnmdC9/wfvI7bXUq+oEd5I/9F/DwnHxerbH2/+QcRvL4BAmWkoohsbNX52tAglLdKUHv/Yjeu3EEHWVMf4bKEZZAfdLOXiD0cna9ZTa9J0j/U3cN4gxyFqxf9rUTRro+B0+cqKd8pghh3iI48vYAJUCISaBFkLKKK9QuSZDwpfc6PFMSEYi+n6JwstX4uNVxpgEhlPgdo4NyUmhe+BQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUFWglSpLmhhpPVkf6kpDlpTzoqexIlTr9WRKhp8gME=;
 b=A3Cw6vXq2rvhaMR+dh33ffRl3ZJ4zuzWPr8b2Qe/KmN7ARFohhhOP7rYTv3E6Q78jd6uHZyL/mhfeQ3hnts7HI7y8vMGOpjAl7OKVxnsgBr2/qxkQCKCStIsQf5S7rK0JLqgJPntrS4kRFKyFgUgLUuhVO9XK4rhYT+eb3cTgcI=
Received: from BL0PR11MB3315.namprd11.prod.outlook.com (2603:10b6:208:6c::33)
 by BL0PR11MB2881.namprd11.prod.outlook.com (2603:10b6:208:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 13:01:45 +0000
Received: from BL0PR11MB3315.namprd11.prod.outlook.com
 ([fe80::2495:853:c506:9876]) by BL0PR11MB3315.namprd11.prod.outlook.com
 ([fe80::2495:853:c506:9876%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 13:01:45 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
Subject: Re: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
Thread-Topic: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
Thread-Index: AQHWZAI5IBJUkCEhDk2uEtF4mvkgQakbP26AgAAZ8ICAAArCAA==
Date: Mon, 27 Jul 2020 13:01:44 +0000
Message-ID: <6cf8d9c160517eb1991e471cfc601e380c6fb127.camel@intel.com>
References: <20200723151621.3536-1-christian.koenig@amd.com>
 <20200727094251.GO6419@phenom.ffwll.local>
 <731e9553-81f3-752f-3e44-71027693d3bc@gmail.com>
 <10da016f256f726b49c09f7440e0dc2c82809bbc.camel@intel.com>
 <419b0a05-63f7-3daa-8ebc-cc6636d8837b@amd.com>
In-Reply-To: <419b0a05-63f7-3daa-8ebc-cc6636d8837b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.77]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b9dab78-f2ff-42a4-5017-08d8322d3741
x-ms-traffictypediagnostic: BL0PR11MB2881:
x-microsoft-antispam-prvs: <BL0PR11MB28812323447BA9B11BD0E12997720@BL0PR11MB2881.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YWKU2koMQGQ1QjnFJtvuOTFKhRA44KwJvFsXlSd9WQ2dME8A609MIGXC6FovRovb6gQGkId5k5ilPNEmkbiDhro4IqHHnsXyykDWeBpKTr0FxQe1MnyIHMYeVIWaqoeCJnJMRE9ekIG63e2dh/Ar1dyqnmiF7uMWkiYiZahHTGD09caCWx6VjZrx/wRu0O5F0doZvTAvkJxxM7/eL1yxdETV8DSy5QDrRB6rypFFOWivHxLA07+1Er/QMwZLSsB/1OsbUZeSUdCW4zsp1k2uCG1ohd85Pz5CHDAmRBSn7yoEC4vLeKaqh9MzkFKLmhM7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3315.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(2906002)(5660300002)(6486002)(6506007)(64756008)(66446008)(8676002)(26005)(83380400001)(2616005)(4326008)(478600001)(71200400001)(110136005)(76116006)(91956017)(6512007)(8936002)(86362001)(66946007)(316002)(186003)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: okaAtMKX3KtXGvmEHw28ZZ4w3QHdYtmjzmyoQ4TDwkLA6tfvADDs1mEnYYV5R+NjsCKZ1/AkMO/7D8si4JP5TaH1m82+7PjywIPxxs7kpBsdd6R34LYpjB+ZKyPfr80r0sOxzWHAz0wOPWTMU+q9UHTZ1pgjcr0UHAJJKUwZR9AjYPvProA4z/cGr3MmQmvaiuhu4g1l2oc4RXDvy0niYjLxwSIC5I1al91HbS5mW23wJxF245Cmj3JhsmxPpmMSrqutNv682ka6MxThxkTDtMkEUGLRkGllUbh9igXthte/hTAdzFs/4jeEj6B0nfN1MOkbshQ1BgCOcvzsoGiIeOe3Cy5bfD+Rn8Rlu8iIaiifKX3JSeiHSsH/nXl5AAGPfWvxieE+bNJNgsHom+/gYKWtOyLfdKYAtD3WapA8qqjjqTVn/2vykIKUWDqpB6ONWlRnxTgR4P0LBDvCA/6c5tUXpJ2UVRR5/xMokLnDugjWe6bmZyQ8XfWOxmyYQAlK
x-ms-exchange-transport-forked: True
Content-ID: <4D5B939EC2C2CB4E93603977EB32D623@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3315.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9dab78-f2ff-42a4-5017-08d8322d3741
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 13:01:45.2251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GAA1nvxbbfNy0em4/9tQztmOF6DMbJ5+DHblwshZbhzWQJgw2fnsanBsC3nI0I+qFvJzB4+jmMJq5zp0Fl34gNzYD9K6v+uGgECoI7HsBWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2881
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTA3LTI3IGF0IDE0OjIzICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAyNy4wNy4yMCB1bSAxMjo1MCBzY2hyaWViIEhlbGxzdHJvbSwgVGhvbWFzOg0KPiA+
IE9uIE1vbiwgMjAyMC0wNy0yNyBhdCAxMjozOSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToNCj4gPiA+IEFtIDI3LjA3LjIwIHVtIDExOjQyIHNjaHJpZWIgZGFuaWVsQGZmd2xsLmNoOg0K
PiA+ID4gPiBPbiBUaHUsIEp1bCAyMywgMjAyMCBhdCAwNToxNjoxM1BNICswMjAwLCBDaHJpc3Rp
YW4gS8O2bmlnDQo+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+IEluc3RlYWQgb2YgcmVwZWF0aW5n
IHRoYXQgaW4gZWFjaCBkcml2ZXIuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiA+ID4gPiA+
IC0tLQ0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YyAgICB8IDMgLS0tDQo+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYyAgICAgIHwgMyAtLS0NCj4gPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmMgICAgICAgfCAzIC0tLQ0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3R0bS5jICAgICAgICAgICAgICB8IDMgLS0tDQo+ID4gPiA+ID4gICAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgICAgICAgIHwgMyAtLS0NCj4gPiA+ID4gPiAg
ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgICAgICAgfCAyICsrDQo+ID4g
PiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMiAt
LQ0KPiA+ID4gPiA+ICAgIDcgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxl
dGlvbnMoLSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gPiA+ID4gPiBpbmRleCAwZGQ1ZTgwMjA5MWQuLmU1
N2M0OWE5MWI3MyAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMNCj4gPiA+ID4gPiBAQCAtODQsOSArODQsNiBAQCBzdGF0aWMgaW50
IGFtZGdwdV9pbml0X21lbV90eXBlKHN0cnVjdA0KPiA+ID4gPiA+IHR0bV9ib19kZXZpY2UgKmJk
ZXYsIHVpbnQzMl90IHR5cGUsDQo+ID4gPiA+ID4gICAgCXN3aXRjaCAodHlwZSkgew0KPiA+ID4g
PiA+ICAgIAljYXNlIFRUTV9QTF9TWVNURU06DQo+ID4gPiA+ID4gICAgCQkvKiBTeXN0ZW0gbWVt
b3J5ICovDQo+ID4gPiA+ID4gLQkJbWFuLT5mbGFncyA9IDA7DQo+ID4gPiA+ID4gLQkJbWFuLT5h
dmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7DQo+ID4gPiA+ID4gLQkJbWFu
LT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7DQo+ID4gPiA+ID4gICAgCQli
cmVhazsNCj4gPiA+ID4gPiAgICAJY2FzZSBUVE1fUExfVFQ6DQo+ID4gPiA+ID4gICAgCQkvKiBH
VFQgbWVtb3J5ICAqLw0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92
cmFtX2hlbHBlci5jDQo+ID4gPiA+ID4gaW5kZXggMzI5NmVkM2RmMzU4Li5iZTE3N2FmZGViOWEg
MTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmMNCj4gPiA+ID4gPiBAQCAtMTAwOSw5ICsxMDA5LDYgQEAgc3RhdGljIGludA0KPiA+ID4gPiA+
IGJvX2RyaXZlcl9pbml0X21lbV90eXBlKHN0cnVjdA0KPiA+ID4gPiA+IHR0bV9ib19kZXZpY2Ug
KmJkZXYsIHVpbnQzMl90IHR5cGUsDQo+ID4gPiA+ID4gICAgew0KPiA+ID4gPiA+ICAgIAlzd2l0
Y2ggKHR5cGUpIHsNCj4gPiA+ID4gPiAgICAJY2FzZSBUVE1fUExfU1lTVEVNOg0KPiA+ID4gPiA+
IC0JCW1hbi0+ZmxhZ3MgPSAwOw0KPiA+ID4gPiA+IC0JCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcg
PSBUVE1fUExfTUFTS19DQUNISU5HOw0KPiA+ID4gPiA+IC0JCW1hbi0+ZGVmYXVsdF9jYWNoaW5n
ID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOw0KPiA+ID4gPiA+ICAgIAkJYnJlYWs7DQo+ID4gPiA+ID4g
ICAgCWNhc2UgVFRNX1BMX1ZSQU06DQo+ID4gPiA+ID4gICAgCQltYW4tPmZ1bmMgPSAmdHRtX2Jv
X21hbmFnZXJfZnVuYzsNCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iby5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JvLmMNCj4gPiA+ID4gPiBpbmRleCA0Y2NmOTM3ZGYwZDAuLjUzYWYyNTAyMGJiMiAx
MDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jv
LmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMN
Cj4gPiA+ID4gPiBAQCAtNjU1LDkgKzY1NSw2IEBAIG5vdXZlYXVfYm9faW5pdF9tZW1fdHlwZShz
dHJ1Y3QNCj4gPiA+ID4gPiB0dG1fYm9fZGV2aWNlDQo+ID4gPiA+ID4gKmJkZXYsIHVpbnQzMl90
IHR5cGUsDQo+ID4gPiA+ID4gICAgDQo+ID4gPiA+ID4gICAgCXN3aXRjaCAodHlwZSkgew0KPiA+
ID4gPiA+ICAgIAljYXNlIFRUTV9QTF9TWVNURU06DQo+ID4gPiA+ID4gLQkJbWFuLT5mbGFncyA9
IDA7DQo+ID4gPiA+ID4gLQkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9NQVNLX0NB
Q0hJTkc7DQo+ID4gPiA+ID4gLQkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19D
QUNIRUQ7DQo+ID4gPiA+ID4gICAgCQlicmVhazsNCj4gPiA+ID4gPiAgICAJY2FzZSBUVE1fUExf
VlJBTToNCj4gPiA+ID4gPiAgICAJCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVE
Ow0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYw0K
PiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMNCj4gPiA+ID4gPiBpbmRl
eCAxZDhlMDdiOGIxOWUuLmU5YjhjOTIxYzFmMCAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3R0bS5jDQo+ID4gPiA+ID4gQEAgLTU0LDkgKzU0LDYgQEAgc3RhdGljIGludCBx
eGxfaW5pdF9tZW1fdHlwZShzdHJ1Y3QNCj4gPiA+ID4gPiB0dG1fYm9fZGV2aWNlICpiZGV2LCB1
aW50MzJfdCB0eXBlLA0KPiA+ID4gPiA+ICAgIAlzd2l0Y2ggKHR5cGUpIHsNCj4gPiA+ID4gPiAg
ICAJY2FzZSBUVE1fUExfU1lTVEVNOg0KPiA+ID4gPiA+ICAgIAkJLyogU3lzdGVtIG1lbW9yeSAq
Lw0KPiA+ID4gPiA+IC0JCW1hbi0+ZmxhZ3MgPSAwOw0KPiA+ID4gPiA+IC0JCW1hbi0+YXZhaWxh
YmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOw0KPiA+ID4gPiA+IC0JCW1hbi0+ZGVm
YXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOw0KPiA+ID4gPiA+ICAgIAkJYnJlYWs7
DQo+ID4gPiA+ID4gICAgCWNhc2UgVFRNX1BMX1ZSQU06DQo+ID4gPiA+ID4gICAgCWNhc2UgVFRN
X1BMX1BSSVY6DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90
dG0uYw0KPiA+ID4gPiA+IGluZGV4IGI0NzQ3ODFhMDkyMC4uYjRjYjc1MzYxNTc3IDEwMDY0NA0K
PiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jDQo+ID4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMNCj4gPiA+ID4g
PiBAQCAtNzYsOSArNzYsNiBAQCBzdGF0aWMgaW50IHJhZGVvbl9pbml0X21lbV90eXBlKHN0cnVj
dA0KPiA+ID4gPiA+IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsDQo+ID4gPiA+
ID4gICAgCXN3aXRjaCAodHlwZSkgew0KPiA+ID4gPiA+ICAgIAljYXNlIFRUTV9QTF9TWVNURU06
DQo+ID4gPiA+ID4gICAgCQkvKiBTeXN0ZW0gbWVtb3J5ICovDQo+ID4gPiA+ID4gLQkJbWFuLT5m
bGFncyA9IDA7DQo+ID4gPiA+ID4gLQkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9N
QVNLX0NBQ0hJTkc7DQo+ID4gPiA+ID4gLQkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7DQo+ID4gPiA+ID4gICAgCQlicmVhazsNCj4gPiA+ID4gPiAgICAJY2FzZSBU
VE1fUExfVFQ6DQo+ID4gPiA+ID4gICAgCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVu
YzsNCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0K
PiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiA+ID4gPiA+IGluZGV4
IDdjMDJjZTc4NDgwNS4uMWYxZjllNDYzMjY1IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jDQo+ID4gPiA+ID4gQEAgLTE2NzcsNiArMTY3Nyw4IEBAIGludCB0dG1fYm9f
ZGV2aWNlX2luaXQoc3RydWN0DQo+ID4gPiA+ID4gdHRtX2JvX2RldmljZQ0KPiA+ID4gPiA+ICpi
ZGV2LA0KPiA+ID4gPiA+ICAgIAkgKiBJbml0aWFsaXplIHRoZSBzeXN0ZW0gbWVtb3J5IGJ1ZmZl
ciB0eXBlLg0KPiA+ID4gPiA+ICAgIAkgKiBPdGhlciB0eXBlcyBuZWVkIHRvIGJlIGRyaXZlciAv
IElPQ1RMIGluaXRpYWxpemVkLg0KPiA+ID4gPiA+ICAgIAkgKi8NCj4gPiA+ID4gPiArCWJkZXYt
Pm1hbltUVE1fUExfU1lTVEVNXS5hdmFpbGFibGVfY2FjaGluZyA9DQo+ID4gPiA+ID4gVFRNX1BM
X01BU0tfQ0FDSElORzsNCj4gPiA+ID4gPiArCWJkZXYtPm1hbltUVE1fUExfU1lTVEVNXS5kZWZh
dWx0X2NhY2hpbmcgPQ0KPiA+ID4gPiA+IFRUTV9QTF9GTEFHX0NBQ0hFRDsNCj4gPiA+ID4gPiAg
ICAJcmV0ID0gdHRtX2JvX2luaXRfbW0oYmRldiwgVFRNX1BMX1NZU1RFTSwgMCk7DQo+ID4gPiA+
ID4gICAgCWlmICh1bmxpa2VseShyZXQgIT0gMCkpDQo+ID4gPiA+ID4gICAgCQlnb3RvIG91dF9u
b19zeXM7DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3R0bV9idWZmZXIuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfdHRtX2J1ZmZlci5jDQo+ID4gPiA+ID4gaW5kZXggMWQ3ODE4N2VhYmE2Li4wMGNlZjFhM2Ex
NzggMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
dHRtX2J1ZmZlci5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfdHRtX2J1ZmZlci5jDQo+ID4gPiA+ID4gQEAgLTc0Miw4ICs3NDIsNiBAQCBzdGF0aWMgaW50
IHZtd19pbml0X21lbV90eXBlKHN0cnVjdA0KPiA+ID4gPiA+IHR0bV9ib19kZXZpY2UgKmJkZXYs
IHVpbnQzMl90IHR5cGUsDQo+ID4gPiA+ID4gICAgCXN3aXRjaCAodHlwZSkgew0KPiA+ID4gPiA+
ICAgIAljYXNlIFRUTV9QTF9TWVNURU06DQo+ID4gPiA+ID4gICAgCQkvKiBTeXN0ZW0gbWVtb3J5
ICovDQo+ID4gPiA+ID4gLQkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NB
Q0hFRDsNCj4gPiA+ID4gQWJvdmUgaXMgQ0FDSEVELCBub3QgQ0FDSElORywgc28gbmVlZHMgdG8g
c3RheSB0byBvdmVyd3JpdGUgdGhlDQo+ID4gPiA+IGRlZmF1bHQuDQo+ID4gPiBDcmFwIEkgbWlz
c2VkIHRoYXQuIFByb2JsZW0gaXMgdGhhdCBJIHdhbnRlZCB0byByZW1vdmUgdGhlDQo+ID4gPiBw
b3NzaWJpbGl0eQ0KPiA+ID4gdG8gaW5pdCB0aGUgc3lzdGVtIGRvbWFpbiB3aXRoIGRpZmZlcmVu
dCBjYWNoaW5nIGF0dHJpYnV0ZXMuDQo+ID4gPiANCj4gPiA+IEkgZG9uJ3Qgc2VlIGhvdyB2bXdn
ZnggaXMgZXZlcnkgZ29pbmcgdG8gdXNlIHRoaXM/IFRob21hcyBkbyB5b3UNCj4gPiA+IGhhdmUN
Cj4gPiA+IGFueSBpZGVhIHdoYXQgdGhpcyB3YXMgZ29vZCBmb3I/DQo+ID4gSSBpbnRlcnByZXQg
dGhhdCBsaWtlIHZtd2dmeCBjYW4ndCBoYW5kbGUgYW55IG90aGVyIGNhY2hpbmcNCj4gPiBhdHRy
aWJ1dGUNCj4gPiB0aGFuICdjYWNoZWQnLiBCdXQgSSBjYW4ndCBzZWUgYW55b25lIGZlZWRpbmcg
dm13Z2Z4IHN5c3RlbSBtZW1vcnkNCj4gPiBidWZmZXJzIHdpdGggb3RoZXIgY2FjaGluZyBhdHRy
aWJ1dGVzLiBJbiB0aGF0IGNhc2UsIHRob3NlIHdvdWxkIGJlDQo+ID4gaWdub3JlZC4NCj4gDQo+
IFllYWgsIGFncmVlLiBTbyBhbnkgb2JqZWN0aW9ucyB0byBjaGFuZ2UgdGhhdCBzZXR0aW5nIGlu
IHZtd2dmeD8NCj4gDQo+IFRoaXMgd2F5IHdlIGNvdWxkIGhhdmUgdGhlIHNhbWUgc2V0dGluZ3Mg
Zm9yIGFsbCBkcml2ZXJzIGluIHRoZQ0KPiBrZXJuZWwgDQo+IGFuZCBJIGRvbid0IHNlZSB3aHkg
YW55IGRyaXZlciBzaG91bGQgaGF2ZSBzb21ldGhpbmcgc3BlY2lhbCBoZXJlLg0KPiANCj4gQ2hy
aXN0aWFuLg0KPiANCg0KTm8gb2JqZWN0aW9ucyBmcm9tIG15IHNpZGUsIGFsdGhvdWdoIEkgZmln
dXJlIFJvbGFuZCBoYXMgdGhlIGxhc3QNCnNheWluZy4NCg0KL1Rob21hcw0KDQoNCg0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpJbnRlbCBTd2VkZW4gQUIKUmVnaXN0ZXJlZCBPZmZpY2U6IElzYWZqb3Jkc2dhdGFu
IDMwQiwgMTY0IDQwIEtpc3RhLCBTdG9ja2hvbG0sIFN3ZWRlbgpSZWdpc3RyYXRpb24gTnVtYmVy
OiA1NTYxODktNjAyNwoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFp
biBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQg
cmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwg
cGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
