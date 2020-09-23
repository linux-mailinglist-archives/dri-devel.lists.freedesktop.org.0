Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9A275473
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 11:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D4E6E904;
	Wed, 23 Sep 2020 09:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D5E6E904
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 09:24:30 +0000 (UTC)
IronPort-SDR: cb8qc8MvqHp8ockOtCf3WlJjSOjAaliYZHx4an7bBWBuBbNqW1Qa4obk4l8eCsXfmavmfQAHez
 y62s2pHPpexg==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="245675626"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="245675626"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 02:24:29 -0700
IronPort-SDR: 8tVwd3Hemf9yXCjETkJXSqRcncobH9VbBak/ySEf0LLJszbOA/5ekkwvbj54j+QtBHGKKIRgMM
 P6iZp83+OZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="454831668"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 23 Sep 2020 02:24:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 02:24:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 02:24:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Sep 2020 02:24:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 23 Sep 2020 02:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNYpLe2+qkzRS7Uo3KHTgAsRqGjfgLZlN4/+YR/B9PRuUEcXaNS6VgnyuZg/ABfYQuMolXFMf/SFJ34KvRq3Qzcaf3OV8pKUpHiicKcmC33JJgvKY1UaI8lm2fArOZz4FNYFpG+KgWY/8klbZ90Y1iqtnWM0SYMvfCR5FIFBcqoV60G99/LV0ljc8b22tem7+xD/zDJflr9+BZ/GTyiEGStgfEbhkELeGaWh1l2V6WCnLPqfVpoXX4FNiBu/PQhQ1bXxeQLUOvQRlBbkv2jBsjW8WsN4g17//gtn4zlnMIbS+Cbk6uCxMdhrRYxl3JkftG59qXzhgE7g4oY8MOzGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oihH1yJM4wi9jMok58rrpkn6dBfCc6ngJPsNKLfhlw8=;
 b=FSxwKJQE+oluU/uF/A5kcUY6X+eGTsv8HWT/2KKfcfZixKbDqyaG+BCtsvOk9+De1rqhThkdAYGOZNqh7la5/P7TIv5WGbXN6wHCBT+0CoT32tp3HS07vwFElHnKNZ0l0j47dZFKWbBd2obynJBHrMsk82yv4NlDeYMddl2YtzJdW1jDKIsl2TCTVnoQ6elC5booYJwdQuFrajiq36RtWpw/CMgX2YeiYAFJrlID+wP1APBjQ1gUn37Ab06kXmu80yV0dVUWKRzizbr+4AtTWikuDOp5hlTYOYAymD/GFMthzRjKRnPttALl/VHRtPlKbAYEcgn7M0fuSNNadtL5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oihH1yJM4wi9jMok58rrpkn6dBfCc6ngJPsNKLfhlw8=;
 b=WpMnJ8JtehQAUSyY7RKjv9RdufNg/tibG18Yvdos1SOeYu8v36bBbzjC9BErUm9gWN00nyjhSZu49aYz8Ja9GDlDz8isxRUft0zbwQ0rNgu34ba7WYsTuHbETCKNs6SPhzMa14lqjDSEMXhQkfazLy7YhxnakwrkZ/MPvBnuhxw=
Received: from BL0PR11MB3315.namprd11.prod.outlook.com (2603:10b6:208:6c::33)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 23 Sep
 2020 09:24:26 +0000
Received: from BL0PR11MB3315.namprd11.prod.outlook.com
 ([fe80::c59d:fadd:399d:9a1f]) by BL0PR11MB3315.namprd11.prod.outlook.com
 ([fe80::c59d:fadd:399d:9a1f%7]) with mapi id 15.20.3391.024; Wed, 23 Sep 2020
 09:24:25 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: Why can't ttm_tt_swapout() handle uncached or WC BOs?
Thread-Topic: Why can't ttm_tt_swapout() handle uncached or WC BOs?
Thread-Index: AQHWjOzpympiH3VKRUaEDem1swaLx6ls6EsAgAABbQCACKyOgIAAZocA
Date: Wed, 23 Sep 2020 09:24:25 +0000
Message-ID: <3c75bf5b45f3a345407dc099de8b1a96ee9b4b81.camel@intel.com>
References: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
 <5fb55684-c797-a104-253f-bf43634f0cec@daenzer.net>
 <9181f6be-0da1-2f43-2014-7c3195147194@amd.com>
 <CAPM=9tzWw3x345AHeODiQ9noDNN6XuTd6J2GsADhu4bQns1_XA@mail.gmail.com>
In-Reply-To: <CAPM=9tzWw3x345AHeODiQ9noDNN6XuTd6J2GsADhu4bQns1_XA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.139.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 896c730d-ae2f-4022-5949-08d85fa2770d
x-ms-traffictypediagnostic: MN2PR11MB4648:
x-microsoft-antispam-prvs: <MN2PR11MB4648497271DC927CCCD8B4D097380@MN2PR11MB4648.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2lkVTZW3iReNS8Aky++COBUzZIOdnL99GeeyboMbk59hNlDcSQV4oSKzV81U+61LefaRentDKOVIhURvE98cx/EZuh5E5ElxZYzBhxnYfkQ987ibcwQJfw1bb20uz+bTll+5rIFH7zOSltj/sbariEPq1OF0Tb3aU1S8fhEAyYWnSztmLE2u+mWugkhH5MCmXshtM0cOph4n143gsXEjurucjUvpTkIHyedMp7Gs6YBEr4ySdkTC/myLW1ckaLD901wTSvYcHl0Xe1RtSeJQyTxS+DDjwONg+tJ8xbrebR0SP52j6WDm55uCNAnOaIrQsI/1JBGrN1ShARxg2GEmZ4PGaDQhBJJAw84iMzhT+FGhqVa91WP/Cf7kC2zrUt4x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3315.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(26005)(54906003)(66946007)(71200400001)(76116006)(91956017)(36756003)(2906002)(110136005)(8676002)(66556008)(5660300002)(66446008)(66574015)(64756008)(53546011)(66476007)(8936002)(86362001)(478600001)(6512007)(6506007)(4326008)(186003)(6486002)(2616005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JprYk/hLKBvAEIQs9uVYr7rk35QEjtEA8DMR06zNuo9r4kBOYoAcidMOD76XC7iEgR/uoWiJdf3/xdAJZAPxU8MX2BB6w8QHI9IhaOftP7bRuMnOoOHDABhDZ8EWN8dA5Ly5sjnYl9RKxSl1xczMNJOW/pwJUrzkQQGIrlrIn06pX5S5gEdjH2U6pJ9sGOu3254LpLl2zNlUpeb+HJapuv+OPX0EX2vUvsvFwZIASP7gozX8CrVPeYt9sMy/ZWgFVgIeOcs4qK4x5hGXHRazVoCuiMf4IXbWrt2EscHcOEntSOnTXoQYg9L2xROLJ9IjaTZUcCzFO3v2MZbta8U38KmaeIQDZTmXEvn1qbatgjSN1xArTyx4yycuej5TlMUU6iezvy9x3b1eja5gCvrXfKbgGoiV++yuuwM66SgD/A9mbBAOwonVHYsNAq+TEXOgzjr/H8hvJsrQ7CfFrSQ8InhmKttrQ6NrutriVpG1dmEECoPO/h+Xe1ImYIREvLJcMYgO4/Ja+RNzKg9J3FBbQ+fd3E0TsP6QofFZjVKypG4hX7PATLD2yetS2MEw0WMrsSMVJK5UVfHfyatr1Nh5pwI6KrdTDN+QCcHXTW5TfQjNy4cU6up0eCvDEP2AeSeZnqnTrDWuWTsbZUFRrDn9Hw==
x-ms-exchange-transport-forked: True
Content-ID: <9C3DD6BCE728F6408CB4D44CC8C6D203@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3315.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896c730d-ae2f-4022-5949-08d85fa2770d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 09:24:25.7600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5hhKuYsnYhg7xr4fWMyvgaZb96uOI029t/mx4UzTtJ7WaWzvBuAuvn1Wh2EspqRQn8pO1qKvKge2b8lmRsTErmYMXwS1z5aADDce5Wt7VAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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

T24gV2VkLCAyMDIwLTA5LTIzIGF0IDEzOjE3ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
T24gRnJpLCAxOCBTZXAgMjAyMCBhdCAwMDo0OSwgQ2hyaXN0aWFuIEvDtm5pZyA8DQo+IGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6DQo+ID4gQW0gMTcuMDkuMjAgdW0gMTY6NDQgc2No
cmllYiBNaWNoZWwgRMOkbnplcjoNCj4gPiA+IE9uIDIwMjAtMDktMTcgMjoyMCBwLm0uLCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOg0KPiA+ID4gPiBIaSBndXlzLA0KPiA+ID4gPiANCj4gPiA+ID4g
TWljaGVsIG9uY2Ugc3VibWl0dGVkIGEgcGF0Y2ggdG8gZml4IHRyaWdnZXJpbmcgdGhpcyBCVUdf
T04gaW4NCj4gPiA+ID4gdHRtX3R0X3N3YXBvdXQoKToNCj4gPiA+ID4gDQo+ID4gPiA+ID4gQlVH
X09OKHR0bS0+Y2FjaGluZ19zdGF0ZSAhPSB0dF9jYWNoZWQpOw0KPiA+ID4gPiANCj4gPiA+ID4g
Tm93IG15IHF1ZXN0aW9uIGlzIGRvZXMgYW55Ym9keSBrbm93IHdoeSB3ZSBoYXZlIHRoYXQgaW4g
dGhlDQo+ID4gPiA+IGZpcnN0DQo+ID4gPiA+IHBsYWNlPw0KPiA+ID4gPiANCj4gPiA+ID4gVGhl
IG9ubHkgcHJvYmxlbWF0aWMgdGhpbmcgSSBjYW4gc2VlIGlzIGNhbGxpbmcgY29weV9oaWdocGFn
ZSgpDQo+ID4gPiA+IGFuZA0KPiA+ID4gPiB0aGF0IG9uZSBpcyBqdXN0IGRvaW5nIGEga21hcF9h
dG9taWMoKS9rdW5tYXBfYXRvbWljKCkgb24gdGhlDQo+ID4gPiA+IHNvdXJjZQ0KPiA+ID4gPiBh
bmQgZGVzdGluYXRpb24uDQo+ID4gPiA+IA0KPiA+ID4gPiBJIGNhbid0IHNlZSB3aHkgaXQgc2hv
dWxkIGJlIHByb2JsZW1hdGljIGZvciB0aGlzIHRlbXBvcmFyeQ0KPiA+ID4gPiBtYXBwaW5nDQo+
ID4gPiA+IHRvIGJlIGNhY2hlZCBpbnN0ZWFkIG9mIHVuY2FjaGVkIG9yIFdDPw0KPiA+ID4gPiAN
Cj4gPiA+ID4gRG9lcyBhbnlib2R5IGhhcyBhbnkgaWRlYT8NCj4gPiA+IA0KPiA+ID4gT25lIHRo
aW5nIGlzIHRoYXQgQUZBSUsgc29tZSAoQVJNPykgQ1BVcyBjYW4gZ2V0IHZlcnkgdXBzZXQgd2hl
bg0KPiA+ID4gdGhlcmUncyBib3RoIGEgY2FjaGVkIGFuZCB1bmNhY2hlYWJsZSBtYXBwaW5nIGZv
ciB0aGUgc2FtZQ0KPiA+ID4gcGh5c2ljYWwgcGFnZS4NCj4gPiANCj4gPiBHb29kIHBvaW50LCBi
dXQgSSBhbHJlYWR5IGNvbnNpZGVyZWQgdGhpcy4NCj4gPiANCj4gPiBJZiB0aGVyZSBpcyBhbm90
aGVyIG1hcHBpbmcgZm9yIHRoYXQgcGFnZSBsZWZ0IHdlIGFyZSBjb21wbGV0ZWx5DQo+ID4gYnVz
dGVkDQo+ID4gYW55d2F5IHNpbmNlIHdlIGFyZSBjdXJyZW50bHkgY2hhbmdpbmcgdGhlIHVuZGVy
bHlpbmcgc3RvcmFnZS4NCj4gPiANCj4gDQo+IEl0J3Mgbm90IGp1c3QgQVJNIG9mIGNvdXJzZSwg
eDg2IFBBVCBhbHNvIGhhcyBtYW55IGlzc3VlcyBhYm91dA0KPiBtdWx0aXBsZSBtYXBwaW5ncyBv
ZiB0aGUgc2FtZSBiYWNraW5nIHBhZ2Ugd2l0aCBkaWZmZXJlbnQgYXR0cmlidXRlcy4NCj4gDQo+
IFRoZSBvbmx5IG1hcHBpbmdzIG1pZ2h0IGJlIGluIHRoZSBsaW5lYXIgbWFwcGluZywgc2luY2Ug
bm90IGFsbCBwYWdlcw0KPiB3ZSBnZXQgaGVyZSB3aWxsIG5lY2Vzc2FyaWx5IGJlIGhpZ2ggcGFn
ZXMgSSBhc3N1bWUgYW5kIHRoZXJlZm9yZQ0KPiBjb3VsZCBoYXZlIGEgbGluZWFyIG1hcHBpbmcu
IElmIHdlJ3ZlIGNoYW5nZWQgdGhlIGxpbmVhciBtYXBwaW5nIHRvDQo+IG5vbi1jYWNoZWQsIHRo
ZW4gY3JlYXRlIGEgY2FjaGVkIGttYXAgSSdtIG5vdCAxMDAlIHRoYXQgd29uJ3QgY2F1c2UNCj4g
aXNzdWVzLg0KPiANCj4gYnV0IHRoaXMgaXMgYSBkZWZpbml0ZSBtYXplIG9mIHR3aXN0eSBwYXNz
YWdlcyBhbmQgSSdkIHByb2JhYmx5IG5lZWQNCj4gdG8gc2l0IGRvd24gYW5kIGJyZWFrIGl0IGEg
Yml0IG1vcmUuDQo+IA0KPiBEYXZlLg0KDQpUaGlzIGlzIGEgcHJvYmxlbSB0aGF0IGdvZXMgYmFj
ayB3YXkgZmFyICgxMispIHllYXJzIHRoYXQgdGhlIHg4Ng0KYXJjaGl0ZWN0dXJlIGlzIG5vdCBh
bGxvd2VkIHRvIGRvIGFsaWFzZWQgbWFwcGluZ3Mgb2YgcGFnZXMsIGV2ZW4NCnRocm91Z2ggbWFw
cGFibGUgR1RUczogVGhlcmUgYXJlIHR3byBhc3BlY3RzOg0KDQoxKSBDcmVhdGUgYSBXQyBtYXBw
aW5nIG9mIGEgcGFnZSB3aXRoIGRhdGEgaW4gdGhlIGNhY2hlLiBXaGVuIHRoZSBjYWNoZQ0KZG9l
cyBhIHdyaXRlYmFjaywgYW55dGhpbmcgd3JpdHRlbiB0aHJvdWdoIHRoZSBXQyBtYXBwaW5nIHdp
bGwgZ2V0DQpvdmVyd3JpdHRlbi4NCg0KMikgRmx1c2hpbmcgdGhlIFdCIG1hcHBpbmdzIGZpcnN0
IG1pZ2h0IG5vdCBoZWxwLCBzaW5jZSBhdCB0aGF0IHRpbWUNCnRoZXJlIHdlcmUgc29tZSBBTUQg
cHJvY2Vzc29ycyAoQXRobG9ucz8pIHRoYXQgd2VyZSBzcGVjdWxhdGl2ZWx5DQpwcmVmZXRjaGlu
ZyBkYXRhIG9uIHRoZSBXQiBtYXBwaW5nIGludG8gdGhlIGNhY2hlIGF0IGFueSB0aW1lLCBhbmQg
ZXZlbg0KdGhvdWdoIGl0IHdhc24ndCBjaGFuZ2VkIGl0IGRpZCBhIHdyaXRlYmFjay4gQW55dGhp
bmcgd3JpdHRlbiB0aHJvdWdoDQpXQyBpbi1iZXR3ZWVuIHRoZSBwcmVmZXRjaCBhbmQgdGhlIHdy
aXRlYmFjayBnb3Qgb3ZlcndyaXR0ZW4uIFRoYXQgd2FzDQphIHJlYWwgYW5kIG9jY3VyaW5nIHBy
b2JsZW0gYXQgdGhhdCB0aW1lLiBBTUQgY2xhaW1lZCBpdCB3YXMgbm90DQp2aW9sYXRpbmcgc3Bl
Y3MuDQoNClNvIGFsaWFzZWQgbWFwcGluZ3MgaXMgcHJvYmFibHkgYXQgYmVzdCB2ZXJ5IGZyYWdp
bGUuIA0KDQovVGhvbWFzDQoNCg0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgU3dlZGVuIEFCClJl
Z2lzdGVyZWQgT2ZmaWNlOiBJc2Fmam9yZHNnYXRhbiAzMEIsIDE2NCA0MCBLaXN0YSwgU3RvY2to
b2xtLCBTd2VkZW4KUmVnaXN0cmF0aW9uIE51bWJlcjogNTU2MTg5LTYwMjcKClRoaXMgZS1tYWls
IGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZv
cgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBv
ciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBh
cmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIg
YW5kIGRlbGV0ZSBhbGwgY29waWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
