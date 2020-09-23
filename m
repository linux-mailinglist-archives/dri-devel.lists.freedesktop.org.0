Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DAD275CB9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 18:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CD589BBD;
	Wed, 23 Sep 2020 16:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AC189BBD
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 16:03:54 +0000 (UTC)
IronPort-SDR: XYLkTbhPLHfVtSwFqF/3rVFcXsretRCjTXNdRG9/C5EZZSgUgJzG1+eyAqIgDx4IADsv7IweR4
 /tJ3v1Qiwfiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148674136"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148674136"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 09:03:52 -0700
IronPort-SDR: Yk8ehb3Nm1raIkE9gd1rDRmNSCla97dnwcLI3jeblMNu966ZeMU/u6M4sp7F2tCycm7YsCo+hh
 h2RfWfyrD2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="511698505"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2020 09:03:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 09:03:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 09:03:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Sep 2020 09:03:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 23 Sep 2020 09:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHHVE0FKdR0Emp+9lMgsfrt4tA6kdZRnxsxqYUWSuiZNIPjoFR32Mw/Oqu6wXMDKvLLNNPSJFq2GsOp94llcKdIaVT3iazysWdhariasNiyBB/KGTayyOYoNIBuN1l7H0BejVaaM5oi/m6m+RRPGyub4B0DfDCpzbFsp7TMFRB4p5XV6HSRccU18Wmr1PlCoczJbem15pzPY7x4mD7QM1CVH5BgETg9d0TfwKzlb3xASrjAm1sIrQbxdlq+5JO6ckIEKxp+DCKez2hUGYsm5gPgWQYQlbOFkx9AHyv0ByWH0lzp7xYYIf4WOgY/iKnCpm0o4RPnDl1O/JHM0TBSnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y04RxbkaH8jlGcPbBGyDVZbBa7tlrl5R+kqWPcyl5zQ=;
 b=IzKqhFAh0zLn6ZJwJurZ1wL/XKVwwrBSZwgotij9dZ9WoS6Kzz1OWxXojFv/ca4s1cUiNBbjsy7agV/QjjuOELOdc/iQ2B7NS3Z1lGAwFGz5AKcJtlrNoUcrMMzgvdCMM4Mo3UucVWjdo7yucLKBVKJz70izZJNDokCjAhjORmlTwnRClCtTtSz4zZs5I2dnAvi7Y/6eFXnZ1i4ivvbSW8C1LWvO4RUFVLM9y9KjXuWvBOdLsTm4nrAV1h6vJVN7KqGZzEMV6ASmXLd7IimaRUNN8mGQiyIGfDxlNoidUmedRBqG/AKMb9NWfJNQz1xO65HP6uxjLPtENXaomnyAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y04RxbkaH8jlGcPbBGyDVZbBa7tlrl5R+kqWPcyl5zQ=;
 b=p9xGXc+cImkBapO9xlORJMpR0cPxqASmiFHxsxZfYOrBepyDnzFpT9H8moqP2Jmj6N9lXNW87qHOV+nAdXzYb1zk0rfz+kCJTjTBBtd6ap8xPCAoaG5yq0/mWMvjqNbvaYd0zWIUdHK0DGJYsJYGWlpb1lwSkbheRVbhD7IHAAY=
Received: from BL0PR11MB3315.namprd11.prod.outlook.com (2603:10b6:208:6c::33)
 by MN2PR11MB4240.namprd11.prod.outlook.com (2603:10b6:208:179::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26; Wed, 23 Sep
 2020 16:03:49 +0000
Received: from BL0PR11MB3315.namprd11.prod.outlook.com
 ([fe80::c59d:fadd:399d:9a1f]) by BL0PR11MB3315.namprd11.prod.outlook.com
 ([fe80::c59d:fadd:399d:9a1f%7]) with mapi id 15.20.3391.024; Wed, 23 Sep 2020
 16:03:49 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: Why can't ttm_tt_swapout() handle uncached or WC BOs?
Thread-Topic: Why can't ttm_tt_swapout() handle uncached or WC BOs?
Thread-Index: AQHWjOzpympiH3VKRUaEDem1swaLx6ls6EsAgAABbQCACKyOgIAAZocAgABOBgCAACGMAA==
Date: Wed, 23 Sep 2020 16:03:47 +0000
Message-ID: <652657d5eb38ff8dc3349947956efd3a59574817.camel@intel.com>
References: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
 <5fb55684-c797-a104-253f-bf43634f0cec@daenzer.net>
 <9181f6be-0da1-2f43-2014-7c3195147194@amd.com>
 <CAPM=9tzWw3x345AHeODiQ9noDNN6XuTd6J2GsADhu4bQns1_XA@mail.gmail.com>
 <3c75bf5b45f3a345407dc099de8b1a96ee9b4b81.camel@intel.com>
 <8cc30de5-210d-e509-bd85-cbbe4ff17724@amd.com>
In-Reply-To: <8cc30de5-210d-e509-bd85-cbbe4ff17724@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.139.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 056ac617-e76b-4283-5578-08d85fda4239
x-ms-traffictypediagnostic: MN2PR11MB4240:
x-microsoft-antispam-prvs: <MN2PR11MB4240640EB9028340785AB14C97380@MN2PR11MB4240.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vxAwFg2aeovleWZIQR2z3qgkG0OrtA2jas0kyzw6rG3HHwENhtRCmQXjYmEJNLdeLIpVzs87Qoj0dJtdNMbgfWoyQT2ws1tWp8TR4Bj1gpNiM292llfOx/jdLEI+ZfoODoHXh3GyuwAx8I5+AO4gdMKBJZ84p0LywrzNZvfW64d2e9VjBj7sCXCfR1jSUFRomz7Y7lIvXXyq8wnNE4lVJnu88RIqO9+cZF6jyBnmLDgtrfrYuOA09PiqswlbrssCA5pG/nVbx45SrxdkxhtFhA2KAL+5dztZHNQ8tjHVE1o74Py7KlRPsSmVdW7EnykXZpoCdSX9j/OrAnd+ffMow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3315.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(86362001)(186003)(6506007)(5660300002)(8676002)(2616005)(54906003)(2906002)(26005)(8936002)(316002)(4326008)(91956017)(478600001)(66574015)(76116006)(66946007)(36756003)(110136005)(6486002)(83380400001)(64756008)(66476007)(66446008)(71200400001)(53546011)(66556008)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XYtU5qlhZ33CQOMnyV4moM9OAIJYAgsH8HUqncOH6P5DEp+pni4ccYLF0UBzHFEt7btSJ8RLstwJ0tb0K7ZNiZsEJGcFURXz/nQ1+B9ZwAKcnb1WG7SKidIPOSR92+jjCJh8z+IQtkVANv96M5tRd0MYQa7bkxFtsMh/4L6jeLfQm7fGSbNBYnsWPSLDAD2ixGCVOglKzuLMGrO/BjM4J8UQ0Q+FjY2KqAPn/voZidZupmLQaERe6uBJvAXOAWQDccs/M5DioWmWWa2lXRb5o6HpCCx9OBpFMCzFj+Bl4EneMzUizngv0dSPNiw2ZC0YxOBTZIkxDVs+iq5cJBScmsF4he0xUvwdwE5719/sc7Vu1n9pUZLfvYr105idrngIXU2uVPNwRfq/gIBZ1hSG6NUpYHbFFxGNpZMI/p1X5pDmYAcg5MG0XtPiAAYew9NvjLIxlk+wUiyW3it7W4V2Cfs4f9StHfgZsseKr2n5KiYUGqjZpXs05bAewoJ5Jxqkh0Q3faWu7v8Mracd2uBLDFm4BHgnwECiTGT+I2yejy4ixR5OTLnEz2pCu4cQG0uJcYl0Yi82ORiVFRNcsp6sCDEhRstrDYLK19qr7WbJCEhwlBypXk1+RnIJ6Yc+lZKDjBuYdwPI/v7Vgpiqoaf9TA==
x-ms-exchange-transport-forked: True
Content-ID: <3D0505935B767B428E2D3AF4DF2492D7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3315.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056ac617-e76b-4283-5578-08d85fda4239
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 16:03:47.7866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcAgJD/a21d8wlBZFiFabTpqAIZ/0N0+G/8NmIeQzZ/JFqfSsb1q3mplgMKoj8y1o1kwUzg9BOwbaMMY+MyT/LAcOluS4W5q2TsyKSQSLSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4240
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
Cc: "michel@daenzer.net" <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTA5LTIzIGF0IDE2OjAzICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAyMy4wOS4yMCB1bSAxMToyNCBzY2hyaWViIEhlbGxzdHJvbSwgVGhvbWFzOg0KPiA+
IE9uIFdlZCwgMjAyMC0wOS0yMyBhdCAxMzoxNyArMTAwMCwgRGF2ZSBBaXJsaWUgd3JvdGU6DQo+
ID4gPiBPbiBGcmksIDE4IFNlcCAyMDIwIGF0IDAwOjQ5LCBDaHJpc3RpYW4gS8O2bmlnIDwNCj4g
PiA+IGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6DQo+ID4gPiA+IEFtIDE3LjA5LjIw
IHVtIDE2OjQ0IHNjaHJpZWIgTWljaGVsIETDpG56ZXI6DQo+ID4gPiA+ID4gT24gMjAyMC0wOS0x
NyAyOjIwIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+ID4gPiA+ID4gPiBIaSBndXlz
LA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBNaWNoZWwgb25jZSBzdWJtaXR0ZWQgYSBwYXRj
aCB0byBmaXggdHJpZ2dlcmluZyB0aGlzIEJVR19PTg0KPiA+ID4gPiA+ID4gaW4NCj4gPiA+ID4g
PiA+IHR0bV90dF9zd2Fwb3V0KCk6DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gQlVHX09O
KHR0bS0+Y2FjaGluZ19zdGF0ZSAhPSB0dF9jYWNoZWQpOw0KPiA+ID4gPiA+ID4gTm93IG15IHF1
ZXN0aW9uIGlzIGRvZXMgYW55Ym9keSBrbm93IHdoeSB3ZSBoYXZlIHRoYXQgaW4NCj4gPiA+ID4g
PiA+IHRoZQ0KPiA+ID4gPiA+ID4gZmlyc3QNCj4gPiA+ID4gPiA+IHBsYWNlPw0KPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiBUaGUgb25seSBwcm9ibGVtYXRpYyB0aGluZyBJIGNhbiBzZWUgaXMg
Y2FsbGluZw0KPiA+ID4gPiA+ID4gY29weV9oaWdocGFnZSgpDQo+ID4gPiA+ID4gPiBhbmQNCj4g
PiA+ID4gPiA+IHRoYXQgb25lIGlzIGp1c3QgZG9pbmcgYSBrbWFwX2F0b21pYygpL2t1bm1hcF9h
dG9taWMoKSBvbg0KPiA+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gPiBzb3VyY2UNCj4gPiA+ID4g
PiA+IGFuZCBkZXN0aW5hdGlvbi4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSSBjYW4ndCBz
ZWUgd2h5IGl0IHNob3VsZCBiZSBwcm9ibGVtYXRpYyBmb3IgdGhpcyB0ZW1wb3JhcnkNCj4gPiA+
ID4gPiA+IG1hcHBpbmcNCj4gPiA+ID4gPiA+IHRvIGJlIGNhY2hlZCBpbnN0ZWFkIG9mIHVuY2Fj
aGVkIG9yIFdDPw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBEb2VzIGFueWJvZHkgaGFzIGFu
eSBpZGVhPw0KPiA+ID4gPiA+IE9uZSB0aGluZyBpcyB0aGF0IEFGQUlLIHNvbWUgKEFSTT8pIENQ
VXMgY2FuIGdldCB2ZXJ5IHVwc2V0DQo+ID4gPiA+ID4gd2hlbg0KPiA+ID4gPiA+IHRoZXJlJ3Mg
Ym90aCBhIGNhY2hlZCBhbmQgdW5jYWNoZWFibGUgbWFwcGluZyBmb3IgdGhlIHNhbWUNCj4gPiA+
ID4gPiBwaHlzaWNhbCBwYWdlLg0KPiA+ID4gPiBHb29kIHBvaW50LCBidXQgSSBhbHJlYWR5IGNv
bnNpZGVyZWQgdGhpcy4NCj4gPiA+ID4gDQo+ID4gPiA+IElmIHRoZXJlIGlzIGFub3RoZXIgbWFw
cGluZyBmb3IgdGhhdCBwYWdlIGxlZnQgd2UgYXJlDQo+ID4gPiA+IGNvbXBsZXRlbHkNCj4gPiA+
ID4gYnVzdGVkDQo+ID4gPiA+IGFueXdheSBzaW5jZSB3ZSBhcmUgY3VycmVudGx5IGNoYW5naW5n
IHRoZSB1bmRlcmx5aW5nIHN0b3JhZ2UuDQo+ID4gPiA+IA0KPiA+ID4gSXQncyBub3QganVzdCBB
Uk0gb2YgY291cnNlLCB4ODYgUEFUIGFsc28gaGFzIG1hbnkgaXNzdWVzIGFib3V0DQo+ID4gPiBt
dWx0aXBsZSBtYXBwaW5ncyBvZiB0aGUgc2FtZSBiYWNraW5nIHBhZ2Ugd2l0aCBkaWZmZXJlbnQN
Cj4gPiA+IGF0dHJpYnV0ZXMuDQo+ID4gPiANCj4gPiA+IFRoZSBvbmx5IG1hcHBpbmdzIG1pZ2h0
IGJlIGluIHRoZSBsaW5lYXIgbWFwcGluZywgc2luY2Ugbm90IGFsbA0KPiA+ID4gcGFnZXMNCj4g
PiA+IHdlIGdldCBoZXJlIHdpbGwgbmVjZXNzYXJpbHkgYmUgaGlnaCBwYWdlcyBJIGFzc3VtZSBh
bmQgdGhlcmVmb3JlDQo+ID4gPiBjb3VsZCBoYXZlIGEgbGluZWFyIG1hcHBpbmcuIElmIHdlJ3Zl
IGNoYW5nZWQgdGhlIGxpbmVhciBtYXBwaW5nDQo+ID4gPiB0bw0KPiA+ID4gbm9uLWNhY2hlZCwg
dGhlbiBjcmVhdGUgYSBjYWNoZWQga21hcCBJJ20gbm90IDEwMCUgdGhhdCB3b24ndA0KPiA+ID4g
Y2F1c2UNCj4gPiA+IGlzc3Vlcy4NCj4gPiA+IA0KPiA+ID4gYnV0IHRoaXMgaXMgYSBkZWZpbml0
ZSBtYXplIG9mIHR3aXN0eSBwYXNzYWdlcyBhbmQgSSdkIHByb2JhYmx5DQo+ID4gPiBuZWVkDQo+
ID4gPiB0byBzaXQgZG93biBhbmQgYnJlYWsgaXQgYSBiaXQgbW9yZS4NCj4gPiA+IA0KPiA+ID4g
RGF2ZS4NCj4gPiBUaGlzIGlzIGEgcHJvYmxlbSB0aGF0IGdvZXMgYmFjayB3YXkgZmFyICgxMisp
IHllYXJzIHRoYXQgdGhlIHg4Ng0KPiA+IGFyY2hpdGVjdHVyZSBpcyBub3QgYWxsb3dlZCB0byBk
byBhbGlhc2VkIG1hcHBpbmdzIG9mIHBhZ2VzLCBldmVuDQo+ID4gdGhyb3VnaCBtYXBwYWJsZSBH
VFRzOiBUaGVyZSBhcmUgdHdvIGFzcGVjdHM6DQo+ID4gDQo+ID4gMSkgQ3JlYXRlIGEgV0MgbWFw
cGluZyBvZiBhIHBhZ2Ugd2l0aCBkYXRhIGluIHRoZSBjYWNoZS4gV2hlbiB0aGUNCj4gPiBjYWNo
ZQ0KPiA+IGRvZXMgYSB3cml0ZWJhY2ssIGFueXRoaW5nIHdyaXR0ZW4gdGhyb3VnaCB0aGUgV0Mg
bWFwcGluZyB3aWxsIGdldA0KPiA+IG92ZXJ3cml0dGVuLg0KPiA+IA0KPiA+IDIpIEZsdXNoaW5n
IHRoZSBXQiBtYXBwaW5ncyBmaXJzdCBtaWdodCBub3QgaGVscCwgc2luY2UgYXQgdGhhdA0KPiA+
IHRpbWUNCj4gPiB0aGVyZSB3ZXJlIHNvbWUgQU1EIHByb2Nlc3NvcnMgKEF0aGxvbnM/KSB0aGF0
IHdlcmUgc3BlY3VsYXRpdmVseQ0KPiA+IHByZWZldGNoaW5nIGRhdGEgb24gdGhlIFdCIG1hcHBp
bmcgaW50byB0aGUgY2FjaGUgYXQgYW55IHRpbWUsIGFuZA0KPiA+IGV2ZW4NCj4gPiB0aG91Z2gg
aXQgd2Fzbid0IGNoYW5nZWQgaXQgZGlkIGEgd3JpdGViYWNrLiBBbnl0aGluZyB3cml0dGVuDQo+
ID4gdGhyb3VnaA0KPiA+IFdDIGluLWJldHdlZW4gdGhlIHByZWZldGNoIGFuZCB0aGUgd3JpdGVi
YWNrIGdvdCBvdmVyd3JpdHRlbi4gVGhhdA0KPiA+IHdhcw0KPiA+IGEgcmVhbCBhbmQgb2NjdXJp
bmcgcHJvYmxlbSBhdCB0aGF0IHRpbWUuIEFNRCBjbGFpbWVkIGl0IHdhcyBub3QNCj4gPiB2aW9s
YXRpbmcgc3BlY3MuDQo+ID4gDQo+ID4gU28gYWxpYXNlZCBtYXBwaW5ncyBpcyBwcm9iYWJseSBh
dCBiZXN0IHZlcnkgZnJhZ2lsZS4NCj4gDQo+IEFsbCBvZiB0aGlzIGlzIGNvcnJlY3QsIGJ1dCBJ
IHN0aWxsIGNhbid0IHNlZSB3aHkgdHRtX2JvX3N3YXBvdXQoKQ0KPiB0cmllcyANCj4gdG8gY2hh
bmdlIHRoZSBjYWNoaW5nPw0KPiANCj4gU2VlIGNvcHlfaGlnaHBhZ2UoKSB3aWxsIG9ubHkgY3Jl
YXRlIGEgdGVtcG9yYXJ5IHdiIG1hcHBpbmcgZm9yDQo+IGhpZ2htZW0gDQo+IHBhZ2VzIHdoaWNo
IGlzIGRlc3Ryb3llZCBpbW1lZGlhdGVseSBhZ2Fpbi4gT3RoZXJ3aXNlIGl0IHdpbGwgdXNlDQo+
IHRoZSANCj4gbGluZWFyIG1hcHBpbmcgd2hpY2ggc2hvdWxkIGFscmVhZHkgaGF2ZSB0aGUgY29y
cmVjdCBjYWNoaW5nDQo+IGF0dHJpYnV0ZXMuDQo+IA0KDQpJSVJDIHRoZXJlIGFyZSBhIGNvdXBs
ZSBvZiBoaXN0b3JpY2FsIHJlYXNvbnMNCi0gR2VuZXJhbGx5IGF2b2lkaW5nIGFsaWFzZWQgbWFw
cGluZ3Mgd2l0aCBjb25mbGljdGluZyBjYWNoaW5nDQotIFJlYWRpbmcgb3V0IGZyb20gV0MgaXMg
ZGVhZCBzbG93DQotIE5vdCBzdXJlIG9mIHRoZSBvcmRlciBvZiBldmVudHMsIGJ1dCBJIHRoaW5r
IHN3YXBwaW5nIHByZWRhdGVzIHRoZSBXQw0KcGFnZSBwb29sLCB3aGljaCBtZWFudCB0aGUgcGFn
ZXMgaGFkIHRvIGNoYW5nZSBjYWNoaW5nIGFueXdheS4NCi0gQSBkZXNpcmUgdG8gYmUgYWJsZSBp
bnNlcnQgdGhlIHBhZ2VzIGRpcmVjdGx5IGluIHRoZSBzd2FwIGNhY2hlDQpyYXRoZXIgdGhhbiB0
byBjb3B5IHNobWVtIG9iamVjdHMuDQoNCkJ1dCB0b2RheSwgd2UgY2FuIHByb2JhYmx5IGRvIGJl
dHRlci4gSSBndWVzcywgd2hlcmUgYXZhaWxhYmxlLA0Kc3RyZWFtaW5nIFdDLXRhaWxvcmVkIG1l
bWNweSBhbmQgbm90IGNoYW5naW5nIHRoZSBjYWNoaW5nIG1pZ2h0IGJlIGENCmdvb2QgY2hvaWNl
Pw0KDQovVGhvbWFzDQoNCg0KDQoNCg0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgU3dlZGVuIEFC
ClJlZ2lzdGVyZWQgT2ZmaWNlOiBJc2Fmam9yZHNnYXRhbiAzMEIsIDE2NCA0MCBLaXN0YSwgU3Rv
Y2tob2xtLCBTd2VkZW4KUmVnaXN0cmF0aW9uIE51bWJlcjogNTU2MTg5LTYwMjcKClRoaXMgZS1t
YWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFs
IGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmll
dyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlv
dSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5k
ZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
