Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62E431856D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 07:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E946E87F;
	Thu, 11 Feb 2021 06:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85386E87F;
 Thu, 11 Feb 2021 06:56:10 +0000 (UTC)
IronPort-SDR: OYaJz5mMuC7JRkL+6RJFs/zG3BHT/4S05xhkhVOsRI1eQV21EbxJfkL4JvPvNRjadG/U22+pxU
 41KP/HiuqJZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="182267755"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="182267755"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:56:09 -0800
IronPort-SDR: qXMN8CY3I3TmVdh9nZZID0VVXt8BZY6vLevLwqxyB2BSoPndbi6GUCzicx16W9fEVgo88A/2bS
 5k97x0fjgolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="421736398"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2021 22:56:08 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Feb 2021 22:56:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 10 Feb 2021 22:56:08 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 10 Feb 2021 22:56:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQnbSq9o3FhQesuxUJ3QIwbX3qpc9gYIPKMLvJYHg1/MOq38/tT9/iHd6hcoyr9NHl5i9853dqlEw1p6t07fWp4TIOZcN0gQgqNKM6h1ZzFGvID4+2newIYCUFyYcrKEXCa/3MgWj/3j4neWUYchHP5EKpFEv+HDehqWzxcM778zzlvT7XwaGLPKlE0SOZQA2oeFxxZZhJruIYPiF78B4RCRmWnDgyOvjWoyEmOkfvI8CR3gkaJTSkfFZr+Pht7gn7Y1rTjTDsJRmk2m6wOMpWgdSGMqVpvQOCHga8aQ4Liw3BSNuvo0lIEZ67RlBHNjD2QiRS1IXrqo8mO2Gj0bRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn1n6ZEHbYMMxB0eo4yoVlllCr+G0dvMQuvVhkV5im8=;
 b=EqUYXycLX7FLQph7k6QyAenNIsvKyTBktniC6+qoqdwuDD5Esf2WN+R9WbsJzHkWRwyThIJq0oirk4+tMnG4B3beJyBmEHbFmvuhhsl+763Dg9uo6xLBdpOfW19W1quzACVRZzAZMk7YUCbfueKt71hK2JmJ8nP3uhn5L8qYiWb/ciOq35lUClCUluxn052bE45HZT042LWTWNeL85VTw9ugSjWAeNwiEX8/wkJHqvITDfGFPdAPeG0CWEHjrWcYFzdohiD+1nWBd5COGWIPk86Et2vvNTJC1plepw0MkIB6dpyY3qq5Cky71LDJYXr4R03F9Xu+r9QuIcxPa8yqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn1n6ZEHbYMMxB0eo4yoVlllCr+G0dvMQuvVhkV5im8=;
 b=v6jp/N9jr7MZ99PrkAq3nqc5vy7Uzcb/UyUZ3CBKAqJ7+DLbvAUt1EhXoPSMAaNR2QMzSghbOwRyKOrqATJRyk+AqFWJOfjOhlkrgXTlP+d4ODWYoh/V7iq4rTK/JP3ehhaHdynhLstLQX05OWw9r5fwe9o+EMmStrUq0NczXgQ=
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 06:56:05 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::94eb:c915:5a57:e7bc]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::94eb:c915:5a57:e7bc%6]) with mapi id 15.20.3846.030; Thu, 11 Feb 2021
 06:56:05 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable
 by display drivers.
Thread-Topic: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable
 by display drivers.
Thread-Index: AQHW/4cpKxF7JQIDHUqjHvmYD8/ADqpRrueAgADX+4A=
Date: Thu, 11 Feb 2021 06:56:05 +0000
Message-ID: <c72586deb3c529096f0e943f2fe1707db73658fe.camel@intel.com>
References: <20210210083338.100068-1-khaled.almahallawy@intel.com>
 <d8606a5519a777c6531accdd8406b17a1dac3c66.camel@redhat.com>
In-Reply-To: <d8606a5519a777c6531accdd8406b17a1dac3c66.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c738cc1-4f1e-4169-f838-08d8ce5a1a30
x-ms-traffictypediagnostic: CO1PR11MB4849:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4849C0B7AFAEF399F65B516F898C9@CO1PR11MB4849.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X33x8WLDDd39oDHNoQ6inHiuwilHIcYZdjUuVu6wt/DrQg5WXw6wOiVzVqo6DHx0Vtz2pCz0zeR5njme1juRcgJ+bgcQhjTf4sSuiydaSu4+J3xtO6RhSHXMRaSJflE6wnv9QubqBsfJSmmKwVwgMvsu+XcfNGM2OmB/8qLF0zYdjIYvwAOUVHhoJpSeoxlXn3mkw2ChFjsISwPZGVn71gcfwGS8NVKe8Z0ncqTO7njgi5HZYVd2NzZyC83YmyI6muR0ClALv5H4GsD9p/AT+PjMQPNL/8PX9QRymieJQdr1yGZqjgglWOeXNpwJXln1r33e90Jbs2QX8ovpi1OEzzGptsCemhdOn/w64uzepyJsYWeIg7qrXJdiGfKIbxKD/Gnicr3gNFA8l5RaJIre/r9nopElBXxrl35oMNVD3OK8G328Cm8Fgnw6YmYvxuiTk/jRPxT74bZdRcxqI2fU49EALmKzjGvYj7KkgjaLsuA4ze/72cVYEBpxdeECpqB1QUmG1Hno5xs9zQy9qrP8XVAgtjwuI3ae/Yus88+lCw3ygnpvjMXgAHumg8fsbhOjApC/fx0bwpeojk6ijd4ZcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(376002)(396003)(346002)(2616005)(66446008)(66476007)(6506007)(64756008)(66556008)(66946007)(71200400001)(4326008)(86362001)(6486002)(26005)(186003)(76116006)(36756003)(91956017)(83380400001)(966005)(8676002)(316002)(8936002)(110136005)(54906003)(2906002)(6512007)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RDNndTl5eHNpdC9ZY1VvY1RlOGJWd2FiYXE3L05wbGV1TkN2U1RFczRRaXJF?=
 =?utf-8?B?eVg5QkN1SjhsbFViNmpIbkhzZ2pyZEJ6WUJBRWF2ZXNGT05kazBPUlA2d2pk?=
 =?utf-8?B?UjAzWHg2U3dXeURiT1p6Q2FYV0J4QVFpUTlLaU5DSEY1QVhrN1ZVMHFMS2Uy?=
 =?utf-8?B?cGFXc09FNUZxSEVBTXhiMkNmRnZVUjhOMHB5eTVBM093YVZEd1U3QjZMMFR0?=
 =?utf-8?B?b1oxcEtDVjJpbnkrQWFLQXlKYk5RbEorbVM2d3RabU55Q083bksrNHZBbEdk?=
 =?utf-8?B?VjlTbzQwQ3NSUzJ3aUZ1Ymh0QTk4QjlNSTNhVE9YRk5IZVVPQ3dKQTZVSUxV?=
 =?utf-8?B?TzlNNWtkejhaUGYwUW92TXlnc3k3YjFaZDhQN3VDRE1hSGcyendWUWRaUGJz?=
 =?utf-8?B?OCt5QnZmU1JONVh0V3diZnEvSHBUVTNadHNoZkhGQi9CaHVnM1pVNlVJNldh?=
 =?utf-8?B?ZnJvK1YzRkx5bUhMQ3QvK056WHBYM01mRHNBUFpvcmwwbUlkdTI1c21NajVN?=
 =?utf-8?B?TnpxUStwT1YrWFFpWU1MNUswcU9GKysxb1dNZmRTSWo2VEUxSmlFdklaa2hq?=
 =?utf-8?B?ZWNUMzFZaW5CV1NIWURRTmxwL3cvZ2xlL0RYd0dYKzBVb0V3aVNCa2dWSC9a?=
 =?utf-8?B?Wk9ZWm5maktoNWU0Z2R2Q01nWDhTaVFkVVJvVGN4QkVGekk2VG8vRWFIVXdS?=
 =?utf-8?B?a213d2h2WW9ZZjFvMnlJNURvWVpYNDNUNWJlMktmMWxtbEkwK2x3U1F3Ui9U?=
 =?utf-8?B?dG13K3FHNTE2ank1eVFJYnp5ZGlnYlNjaUV3bUoxOUZoa3JmRWNydnlGVWNs?=
 =?utf-8?B?YnREQk5wUERNOTN1aGxCVWYxWkVaOW9OY2dWbjBUZG4wYUVCRGtNLzdOQ0ZZ?=
 =?utf-8?B?MllQb2d6VlkreHEvbHZjelhLRThDZVlnMTdTcWVDTGRkcW8rajg3SGZnSUtI?=
 =?utf-8?B?UWM1T1JzWGc2Qkx3Lzdla1RYRURWRUZoOW1hZlVEM1ovL0YwM1N3KzJJdlM4?=
 =?utf-8?B?VFpWY09ZaUNPRFFnLzBWaTFleWN2VjFoNmQrdTYzc05HUEhJZ1F4RVJJOGt6?=
 =?utf-8?B?WTdIYmVYQnZVVWZDOW5VZlZXQzVEYWl0dGVNWFlyK1k2VjBOTXBqMHpHcllm?=
 =?utf-8?B?R2RIV04vazJLZ2lZRlRoeWE3Qzl2cU5VSStQVnY0VWNFZ1V6R2ZRMUFaeitW?=
 =?utf-8?B?SUx4YzZlcjhmaHRJSW9JWEszRkFERk1uMXRyUTVnaGJBUlBCS2VCZUpQbkE3?=
 =?utf-8?B?SHQ1R0pxU2JoZC85QTFtREFDTHdydzdFNVd0M0NqZ2hDVjhXWDI3RTFHc2Zu?=
 =?utf-8?B?V3dSeGo4NDNLbDc1V3c0NUl3ZnYwR0F0bTFTNTlLMm43MFdGNDlMQXJMYVJO?=
 =?utf-8?B?WUVsQzJpclFXdngrWGpFMStVeC9IUEZxL25hbmZ2eHpvRllDUXRjYnZSTGJP?=
 =?utf-8?B?ZzVmL1YvR2o4Mi9KYnp0Y1VyRWQxMko1YThXS2c2UzhZdm9jUEZDbjl4UHJK?=
 =?utf-8?B?T2MxelJ1YTVGU2hGbnlKVlRhNzJvOFdYOVVhbDBCUWRER2NhTUgrWTd3Y3lj?=
 =?utf-8?B?cEx4UW5iSFAyYXJZcVZ5cS9SUHU0L3hTK1UzSGNQajJJSFZXS0FjT2ZyY0tK?=
 =?utf-8?B?SUxhQUE3SnY3d3JnRzhISGh5QkFBMERjZFVFNWd1eUgrVVlwU0hkTVVmUjRv?=
 =?utf-8?B?YTMxNzkzTmVsc1NHWHZsRnZTYmVYQWsvQVF3TDZ5QXpqTkt1S09rY3Z4cFZL?=
 =?utf-8?B?MkJjQmxtZmVDVm5xdFJPWWR5UmpEalM0Y3pSelRMbkl5clovb3E3eC9qa0Rx?=
 =?utf-8?B?ZFF5cWhMMUZMbXRnY3hTZz09?=
Content-ID: <C311DC8891E51649B4C97F7FDE21CEE1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c738cc1-4f1e-4169-f838-08d8ce5a1a30
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 06:56:05.3416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUCfrYJOlmpifEackdHaFCwpTy6CSfOBlQn+hZ/MH6HW7JejV//bHODUHUBNXCsoG0/SLeYClKln7tU30JX8DKl7uMOuStqlju/j4Hubyv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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
Cc: "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAyLTEwIGF0IDEzOjAzIC0wNTAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBP
biBXZWQsIDIwMjEtMDItMTAgYXQgMDA6MzMgLTA4MDAsIEtoYWxlZCBBbG1haGFsbGF3eSB3cm90
ZToNCj4gPiBUaGUgbnVtYmVyIG9mIEFVWCByZXRyaWVzIHNwZWNpZmllZCBpbiB0aGUgRFAgc3Bl
Y3MgaXMgNy4NCj4gPiBDdXJyZW50bHksIHRvIG1ha2UNCj4gPiBEZWxsIDRrIG1vbml0b3JzIGhh
cHBpZXIsIHRoZSBudW1iZXIgb2YgcmV0cmllcyBhcmUgMzIuDQo+ID4gaTkxNSBhbHNvIHJldHJp
ZXMgNSB0aW1lcyAoaW50ZWxfZHBfYXV4X3hmZXIpIHdoaWNoIG1lYW5zIGluIHRoZQ0KPiA+IGNh
c2Ugb2YgQVVYDQo+ID4gdGltZW91dCB3ZSBhY3R1YWxseSByZXRyaWVzIDMyICogNSA9IDE2MCB0
aW1lcy4NCj4gDQo+IElzIHRoZXJlIGFueSBnb29kIHJlYXNvbiBmb3IgaTkxNSB0byBhY3R1YWxs
eSBiZSBkb2luZyByZXRyaWVzDQo+IGl0c2VsZj8gSXQgc2VlbXMNCj4gbGlrZSBhbiBlYXNpZXIg
c29sdXRpb24gaGVyZSBtaWdodCBqdXN0IHRvIGJlIHRvIGZpeCBpOTE1IHNvIGl0DQo+IGRvZXNu
J3QgcmV0cnksDQo+IGFuZCBqdXN0IHJlbHkgb24gRFJNIHRvIGRvIHRoZSByZXRyaWVzIGFzIGFw
cHJvcHJpYXRlLg0KPiANCj4gVGhhdCBiZWluZyBzYWlkIHRob3VnaCwgSSdtIG9wZW4gdG8gdGhp
cyBpZiB0aGVyZSBpcyBhIGxlZ2l0aW1hdGUNCj4gcmVhc29uIGZvcg0KPiBpOTE1IHRvIGJlIGhh
bmRsaW5nIHJldHJpZXMgb24gaXRzIG93bg0KDQppOTE1IG9yIG90aGVycyBtYXkgYmVuZWZpdCBm
cm9tIGNvbnRyb2xsaW5nIEFVWCByZXRyaWVzIHRvIG9wdGltaXplIGFuZA0KbWluaW1pemUgdGlt
aW5nIHNwZW50IG9uIHRoZSBhdXggdHJhbnNhY3Rpb25zLg0KIA0KZHJtX2RwY2RfYWNjZXNzIGhh
bmRsZXMgbXVsdGlwbGUgYXV4IHJldHJpZXMgY2FzZXMgdGhlIHNhbWUgd2F5IChyZXRyeQ0KMzIg
dGltZXMgYXQgd29yc3QgY2FzZSkuIFRoZSA0IGNhc2VzIGFyZToNCjEtICpBVVggcmVjZWl2ZSBv
ciBJTyBlcnJvciouIEkgYmVsaWV2ZSBpdCBpcyB1cCB0byBzcGVjaWZpYw0KaW1wbGVtZW50YXRp
b24vSFcgb25jZSBpdCBkZXRlY3RzIGEgcmVjZWl2ZSBlcnJvciB0byByZXRyeSBiYXNlZCBvbg0K
dGhlaXIgaW50ZXJuYWwgdW5kZXJzdGFuZGluZyB1c2luZyB0aGUgdGltZW91dCBhcHByb3ByaWF0
ZSB0byB0aGUgSFcNCmNhcGFiaWxpdGllcy4NCiANCjItICpBVVggVGltZW91dCogQXMgdGhlIGRy
aXZlciBmb2xsb3dzIHRoZSBzcGVjcyBmb3IgdGhlIHJlY29tbWVuZGVkDQp0aW1lb3V0IHRpbWVy
IGFzIGRlZmluZWQgaW4gc2VjdGlvbiAgKDIuMTEuMiBBVVggVHJhbnNhY3Rpb24NClJlc3BvbnNl
L1JlcGx5IFRpbWVvdXRzKSwgdGhlIGRyaXZlciBoYXMgbW9yZSBpbnRlbGxpZ2VuY2UgdG8ga25v
dyBob3cNCm1hbnkgcmV0cmllcyBpdCBuZWVkcy4gVGhpcyBpcyBtb3JlIHVzZWZ1bCBpbiBjYXNl
IG9mIERQLUFMVCBpZiBzb21lDQppc3N1ZXMgaGFwcGVuIGluIFR5cGUtQyBzdGFjayB0aGF0IGNh
dXNlIEFVWCB0aW1lb3V0IChlLmcuIFVTQjMgZG9jaw0KZGV0ZWN0ZWQgYXMgaGlnaCBzcGVlZCAo
VVNCMikgY2F1c2luZyBTQlUvQVVYIGxpbmVzIHRvIGJlIGRpc2FibGVkKS4NCkFsc28gdGhlIGRp
c2Nvbm5lY3Qgb2YgTVNUIGh1Yi9kb2NrcyBpcyBkZXBlbmRlbnQgaG93IGZhc3QgYSB1c2Vyc3Bh
Y2UNCmRpc2Nvbm5lY3QgYWxsIE1TVCBjb25uZWN0b3JzLiAgTm90IGFsbCB1c2VyIHNwYWNlcyBk
byBpdCBhcyBmYXN0IGxpa2UNCkNocm9tZSAodWJ1bnR1IGlzIGFuIGV4YW1wbGUpOiANCmh0dHBz
Oi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9jaHJvbWl1bS9zcmMvKy8yNTEy
NTUwLyAgDQoNCjMtICpBVVhfTkFDSyogRFAgc3BlYyBtZW50aW9ucyByZXRyeSAzIHRpbWVzIGZv
ciBOQUNLKDIuMTYuMS4zIEdUQyBMb2NrDQpBY3F1aXNpdGlvbikuIEhvd2V2ZXIsIHNvbWV0aW1l
cyB3ZSByZWFsbHkgZG9u4oCZdCBuZWVkIGFueSByZXRyeSBmb3INCk5BQ0ssIGlmIERQUlggcmVw
bGllZCBBVVhfTkFDSyBmb3IgRFBDRCB0aGF0IGl0IGRvZXNu4oCZdCBzdXBwb3J0IChlLmcuDQpy
ZWFkaW5nIExUVFBSIENhcGFiaWxpdHkgYW5kIElEIEZpZWxkIGF0IERQQ0QgRjAwMDBoIH4gRjAw
MDcpLg0KDQo0LSAqQVVYX0RFRkVSKiBUaGUgc3BlY3Mgc3RhdGVkIHdlIG1heSByZXRyeSA3IHRp
bWVzIG9uIEFVWF9ERUZFUg0KKDMuNS4xLjIuMyBMQU5FeF9DSEFOTkVMX0VRX0RPTkUgU2VxdWVu
Y2UpIGFuZCBtYXkgdGVybWluYXRlIExULiBBbHNvDQp3aXRoIHRoZSBpbmNyZWFzZWQgdXNhZ2Ug
b2YgVVNCNCwgVEJUL1R5cGUtQyBEb2Nrcy9EaXNwbGF5cywgYW5kIGFjdGl2ZQ0KY2FibGVzLCB0
aGUgdXNlIG9mIExUVFBSIGJlY29tZXMgY29tbW9uIHdoaWNoIGFkZHMgbW9yZSBjaGFsbGVuZ2UN
CmVzcGVjaWFsbHkgaWYgd2UgaGF2ZSBtdWx0aXBsZSBMVFRQUnMgYW5kIGFsbCBvcGVyYXRlIGlu
IG5vbi1MVFRQUg0KbW9kZS4gSW4gdGhpcyBjYXNlIGFsbCBMVFRQUnMgd2lsbCByZXBseSBBVVhf
REVGRVIgaW4gMzAwdXMgaWYgaXQgZGlkDQpub3QgcmVjZWl2ZSBhbnkgYXV4IHJlc3BvbnNlIGZy
b20gb3RoZXIgTFRUUFJzIGFuZCBEUFJYLiBUaGUgU0NSIHN0YXRlcw0Kd2UgbmVlZCB0byByZXRy
eSA3IHRpbWVzIGFuZCBub3QgbW9yZSB0aGFuIDUwbXMgKERQIHYyLjAgU0NSIG9uIDhiLzEwYg0K
RFBUWCBhbmQgTFRUUFIgUmVxdWlyZW1lbnRzIFVwZGF0ZSB0byBTZWN0aW9uIDMuNikNCg0KSW4g
YWRkaXRpb24gSSBiZWxpZXZlIHRoaXMgZnVuY3Rpb24gaXMgbm90IGNvcnJlY3QgaW4gdHJlYXRp
bmcNCkFVWF9ERUZFUiBhbmQgQVVYX05BQ0sgYXMgLUVJTy4gRXNwZWNpYWxseSBmb3IgQVVYX0RF
RkVSLCBpdCBpcyBhIHZhbGlkDQoxIGJ5dGUgcmVzcG9uc2UgdGhhdCBjYW4gcHJvdmlkZSBhIHZh
bHVhYmxlIGRlYnVnZ2luZyBpbmZvcm1hdGlvbg0KZXNwZWNpYWxseSBpbiB0aGUgY2FzZSBvZiBv
bi1ib2FyZCBMVFRQUiB3aGVyZSB0aGVyZSBpcyBubyB3YXkgdG8NCmNhcHR1cmUgdGhpcyBBVVgg
cmVzcG9uc2UgYmV0d2VlbiB0aGUgU29DIGFuZCBMVFRQUiB1bmxlc3MgeW91IHNvbGRlcg0KdHdv
IHdpcmVzIG9uIEFVWF9QIGFuZCBBVVhfTiBsaW5lcyBhbmQgdXNlIGkyYy9hdXggYW5hbHl6ZXIg
dG8gZGVjb2RlLg0KQXQgbGVhc3Qgd2Ugc2hvdWxkIHByb3ZpZGUgdGhlIHNhbWUgZGVidWcgaW5m
b3JtYXRpb24gYXMgd2UgZG8gaW4NCmRybV9kcF9pMmNfZG9fbXNnIGJ5IHByaW50aW5nIEFVWF9E
RUZFUiBhbmQgQVVYX05BQ0suDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayBhbmQgcmV2
aWV3Lg0KDQotLUtoYWxlZA0KPiANCj4gPiBTbyBtYWtpbmcgdGhlIG51bWJlciBvZiBhdXggcmV0
aXJlcyBhIHZhcmlhYmxlIHRvIGFsbG93IGZvciBmaW5lDQo+ID4gdHVuaW5nIGFuZA0KPiA+IG9w
dGltaXphdGlvbiBvZiBhdXggdGltaW5nLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEtoYWxl
ZCBBbG1haGFsbGF3eSA8a2hhbGVkLmFsbWFoYWxsYXd5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDEwICsrKy0tLS0tLS0NCj4gPiAg
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICB8ICAxICsNCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMNCj4gPiBpbmRleCBlZWRiYjQ4ODE1YjcuLjhmZGY1N2I0YTA2YyAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYw0KPiA+IEBAIC0yNDksMTMgKzI0OSw3
IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0cnVjdA0KPiA+IGRybV9kcF9hdXgg
KmF1eCwgdTgNCj4gPiByZXF1ZXN0LA0KPiA+ICANCj4gPiAgICAgICAgIG11dGV4X2xvY2soJmF1
eC0+aHdfbXV0ZXgpOw0KPiA+ICANCj4gPiAtICAgICAgIC8qDQo+ID4gLSAgICAgICAgKiBUaGUg
c3BlY2lmaWNhdGlvbiBkb2Vzbid0IGdpdmUgYW55IHJlY29tbWVuZGF0aW9uIG9uIGhvdw0KPiA+
IG9mdGVuIHRvDQo+ID4gLSAgICAgICAgKiByZXRyeSBuYXRpdmUgdHJhbnNhY3Rpb25zLiBXZSB1
c2VkIHRvIHJldHJ5IDcgdGltZXMgbGlrZQ0KPiA+IGZvcg0KPiA+IC0gICAgICAgICogYXV4IGky
YyB0cmFuc2FjdGlvbnMgYnV0IHJlYWwgd29ybGQgZGV2aWNlcyB0aGlzIHdhc24ndA0KPiA+IC0g
ICAgICAgICogc3VmZmljaWVudCwgYnVtcCB0byAzMiB3aGljaCBtYWtlcyBEZWxsIDRrIG1vbml0
b3JzDQo+ID4gaGFwcGllci4NCj4gPiAtICAgICAgICAqLw0KPiA+IC0gICAgICAgZm9yIChyZXRy
eSA9IDA7IHJldHJ5IDwgMzI7IHJldHJ5KyspIHsNCj4gPiArICAgICAgIGZvciAocmV0cnkgPSAw
OyByZXRyeSA8IGF1eC0+bnVtX3JldHJpZXM7IHJldHJ5KyspIHsNCj4gPiAgICAgICAgICAgICAg
ICAgaWYgKHJldCAhPSAwICYmIHJldCAhPSAtRVRJTUVET1VUKSB7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgdXNsZWVwX3JhbmdlKEFVWF9SRVRSWV9JTlRFUlZBTCwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVVYX1JFVFJZX0lOVEVSVkFMICsgMTAwKTsN
Cj4gPiBAQCAtMTc0NCw2ICsxNzM4LDggQEAgdm9pZCBkcm1fZHBfYXV4X2luaXQoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCkNCj4gPiAgICAgICAgIGF1eC0+ZGRjLnJldHJpZXMgPSAzOw0KPiA+ICAN
Cj4gPiAgICAgICAgIGF1eC0+ZGRjLmxvY2tfb3BzID0gJmRybV9kcF9pMmNfbG9ja19vcHM7DQo+
ID4gKyAgICAgICAvKlN0aWxsIG1ha2luZyB0aGUgRGVsbCA0ayBtb25pdG9ycyBoYXBwaWVyKi8N
Cj4gPiArICAgICAgIGF1eC0+bnVtX3JldHJpZXMgPSAzMjsNCj4gPiAgfQ0KPiA+ICBFWFBPUlRf
U1lNQk9MKGRybV9kcF9hdXhfaW5pdCk7DQo+ID4gIA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgNCj4gPiBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0K
PiA+IGluZGV4IGVkZmZkMWRjY2EzZS4uMTZjYmZjOGY1ZTY2IDEwMDY0NA0KPiA+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9o
ZWxwZXIuaA0KPiA+IEBAIC0xODc2LDYgKzE4NzYsNyBAQCBzdHJ1Y3QgZHJtX2RwX2F1eCB7DQo+
ID4gICAgICAgICBzdHJ1Y3QgbXV0ZXggaHdfbXV0ZXg7DQo+ID4gICAgICAgICBzdHJ1Y3Qgd29y
a19zdHJ1Y3QgY3JjX3dvcms7DQo+ID4gICAgICAgICB1OCBjcmNfY291bnQ7DQo+ID4gKyAgICAg
ICBpbnQgbnVtX3JldHJpZXM7DQo+ID4gICAgICAgICBzc2l6ZV90ICgqdHJhbnNmZXIpKHN0cnVj
dCBkcm1fZHBfYXV4ICphdXgsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkcm1fZHBfYXV4X21zZyAqbXNnKTsNCj4gPiAgICAgICAgIC8qKg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
