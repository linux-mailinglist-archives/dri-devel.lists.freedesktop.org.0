Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC8283FAA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 21:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF576E09A;
	Mon,  5 Oct 2020 19:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CCA6E09A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 19:31:07 +0000 (UTC)
IronPort-SDR: 5w/uvw1r9QobHv+xA5iA0ixLYbmtetmSj7YDqba4mdd7qy4JzGa3Iwj3ZX72LkhEffJQl8gCKs
 Q++xeBhpSRng==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161272385"
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="161272385"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP; 05 Oct 2020 12:19:28 -0700
IronPort-SDR: Arvwh8CPVqj/7O2phWYfg+Eztf8zQHMmzvBdhT0k/+eVcK5HkEofV63jNesqkOeaDAoNU9QFvd
 x+AZGLyCi5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="517042191"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 05 Oct 2020 11:27:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 09:20:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 5 Oct 2020 09:20:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 5 Oct 2020 09:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp3cKDPnLsn70R+ridUmUiKYuhPbZAbout+2x/dtGfhN2Dz06xXBy+tR390/zAwA4nB4lU1ofuavVMpexBPIHIj8zcud6lrTUPjj2WU3HFObmf6L3eP9sdI9maNgBG6P5dPOKEqBU0wVqhdJvWZU/7Mc4DRAqQeKeQ+ITOIkmIiXeMJhMc8fGFpL8zKmeKa6SwoVhddpYUnZ1DX8tWxYbB5bfD/wdSW8Flar8PiRQTnIpuVx7Ox+NLB4FUnPodEX8DIa65icAmAhLkUch6+JBuEalNT6/UJYS2pyTSoDJPCPeRYfyfv9YBMkhrGTJL6GWNip/EBfvEkIlL17HL2WTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT3gYiXEq2JTOL6GmvtGLFtlIhsoth4esdW+r8BXtxc=;
 b=loAKBZSl7olw6mEYXSuc/EwQntxbK0kvLX0jAredptWmNkZAK2R0GVzqB3B0Xd2HD906120k+NILKwlZvUseMe7o103scjaV9Huupa7x7lqMyyuvr1wSqwEAv0S3elQekBbNfM4ZUKF76s7jH3A55C3abd5AozktsFOW28aoB2GA2bCg34ocTmJDAWWI/Yj5zvJqkjMmEOPZAUTTQKznSQaUCxdtm57VB7knas32N2ezC/A4MLI2qcrC547/AN/0n4AztgwmCGIl/c8E97316fo9u4U1AoOL8J0QcMcAKJRKcAGjGe3GP2AKuaRivZm1HxZy5Uzv65Ha/VN5NTvOdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT3gYiXEq2JTOL6GmvtGLFtlIhsoth4esdW+r8BXtxc=;
 b=rX5rKEuBKzJoC+daGBWShRDyqov7ueLhtuv87s1REB3C4fEc4HX2ReZJYasRjGCTyDONFBgzflW8uN9amDnxmgw3iapB2zVNF83w1L6kExGs4h969OiXRe1jLwj/CrzN3y6Yjzo+7/h7QeQvygqbFgw1go+opC9fYP5Y580d8II=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 16:19:58 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%6]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 16:19:58 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWmoByzOf02BrPAUWXdhZKsQyBsKmI1tgAgABaaTA=
Date: Mon, 5 Oct 2020 16:19:58 +0000
Message-ID: <MW3PR11MB45555CDEB1B3BDF4C5BD73C7E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <dbc54851-1c98-d439-7d30-6572a7d89ea3@amd.com>
In-Reply-To: <dbc54851-1c98-d439-7d30-6572a7d89ea3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3c2d8ca-147c-4095-71dd-08d8694a8135
x-ms-traffictypediagnostic: CO1PR11MB5058:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB50586405258F8F49AF87BB97E50C0@CO1PR11MB5058.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OajMLP+TJJbgpNymmgCrsR3rSChJhSWMkuRqQu9mcxZePUIW8tRS8s99jSIL7lmp82Y09Aj2E44+rChJxonV1MkW6ysotasEFVWM8LpWNWM4+KDhuiCFZBNquflnutxjh7PzVsQUUwszzTGNULYRMBO6wRwrwHd1jg8bO2SIZ0+IcUtQHUKIx4AL9rZLWbHOd4SmfupgY53D9Jvf3GMFFM6wG98u6VpU6bTH3ldQU9YPo2DY6mOFBYoYAz2YoR+z8PhH102qY21KLWVNCksOL6v68RBgXAxVFLhEENLZCmKMtwLLTI4x9sEvDbGYfzkkOibXVqBICzHCZJaXaJ2YGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(71200400001)(107886003)(66574015)(76116006)(55016002)(4326008)(110136005)(54906003)(8936002)(9686003)(316002)(478600001)(86362001)(83380400001)(8676002)(33656002)(2906002)(64756008)(26005)(66446008)(66556008)(53546011)(6506007)(66476007)(7696005)(52536014)(186003)(5660300002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: VbAM24xNoHSPW1CeqFVKKmKvE0tN02TeexTqsVzmhjcUnXAc4tuwtZcWebIhlIg2AcU6iVt0zUqClP9pBIvft9aRMTCR+J/rh63i1KmXrgUcWn9KM0lAmqASAolFFbhNSaXq+/KTB0X7j+N66EKEREvXurLpLmeitu9RHpWt/7i6wL9d3PO75zvaUrO9tVErzBJ0+DTmErvwkMncDVoWoM8WpsI/ZjdLXhiZoNEl9zf4vTJaGQbSaKeDIvtDfE952OrUJEr9W5bSSIIwJFmUtsMvD/atQc7fb30lppbBsEerr3Xc5zF9dw/6l+lCAcOJABxS6VNQovo8LVl8yWc0ei2aCoNADsvpHly3sdE8sSlG0rlwTYoQ1H7Pd42+41b3WJHjOTMouMc+ZPGjz87Xuil4muepnZscYe2+AZJkN7nL43Q/o9wxBvS8So6+QKkwdiVz3qSqURJwHAEjAnFQh3o1/kGeUFJRuZQfThadvxxvm/PrltQXYC0LGrONJP8MdRKqEr0jsTfFxBhBfySWqKQSX6c8hmAcjVHtW3n82FDoVfQ0uPmE+fjCEJ2Cn/wuoOr+jGDbmyzHUYRz+iAaC1o8DlwdxIEr7RdiH5eCPaEbVI7O8DOGFWVL9QWM5DB6/8Fv6tYR+FWJBM431J//bA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c2d8ca-147c-4095-71dd-08d8694a8135
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 16:19:58.8269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivrq/JykwDIi0yLNYrsP2pjDPNn5xDSUPhOYiD6APMCO0aHWEaaybKEENRosKsCYvjKf2cF9iH5xDA3KqIjUbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, Leon
 Romanovsky <leon@kernel.org>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAwNSwgMjAy
MCAzOjU1IEFNDQo+IFRvOiBYaW9uZywgSmlhbnhpbiA8amlhbnhpbi54aW9uZ0BpbnRlbC5jb20+
OyBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogRG91ZyBMZWRmb3JkIDxkbGVkZm9yZEByZWRoYXQuY29tPjsgSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAemllcGUuY2E+OyBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz47
IFN1bWl0IFNlbXdhbA0KPiA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+OyBWZXR0ZXIsIERhbmll
bCA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYz
IDEvNF0gUkRNQS91bWVtOiBTdXBwb3J0IGltcG9ydGluZyBkbWEtYnVmIGFzIHVzZXIgbWVtb3J5
IHJlZ2lvbg0KPiANCj4gSGkgSmlhbnhpbiwNCj4gDQo+IEFtIDA0LjEwLjIwIHVtIDIxOjEyIHNj
aHJpZWIgSmlhbnhpbiBYaW9uZzoNCj4gPiBEbWEtYnVmIGlzIGEgc3RhbmRhcmQgY3Jvc3MtZHJp
dmVyIGJ1ZmZlciBzaGFyaW5nIG1lY2hhbmlzbSB0aGF0IGNhbg0KPiA+IGJlIHVzZWQgdG8gc3Vw
cG9ydCBwZWVyLXRvLXBlZXIgYWNjZXNzIGZyb20gUkRNQSBkZXZpY2VzLg0KPiA+DQo+ID4gRGV2
aWNlIG1lbW9yeSBleHBvcnRlZCB2aWEgZG1hLWJ1ZiBpcyBhc3NvY2lhdGVkIHdpdGggYSBmaWxl
IGRlc2NyaXB0b3IuDQo+ID4gVGhpcyBpcyBwYXNzZWQgdG8gdGhlIHVzZXIgc3BhY2UgYXMgYSBw
cm9wZXJ0eSBhc3NvY2lhdGVkIHdpdGggdGhlDQo+ID4gYnVmZmVyIGFsbG9jYXRpb24uIFdoZW4g
dGhlIGJ1ZmZlciBpcyByZWdpc3RlcmVkIGFzIGEgbWVtb3J5IHJlZ2lvbiwNCj4gPiB0aGUgZmls
ZSBkZXNjcmlwdG9yIGlzIHBhc3NlZCB0byB0aGUgUkRNQSBkcml2ZXIgYWxvbmcgd2l0aCBvdGhl
cg0KPiA+IHBhcmFtZXRlcnMuDQo+ID4NCj4gPiBJbXBsZW1lbnQgdGhlIGNvbW1vbiBjb2RlIGZv
ciBpbXBvcnRpbmcgZG1hLWJ1ZiBvYmplY3QgYW5kIG1hcHBpbmcNCj4gPiBkbWEtYnVmIHBhZ2Vz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmlhbnhpbiBYaW9uZyA8amlhbnhpbi54aW9uZ0Bp
bnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFNlYW4gSGVmdHkgPHNlYW4uaGVmdHlAaW50ZWwu
Y29tPg0KPiA+IEFja2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj4gDQo+IHdlbGwgZmlyc3Qgb2YgYWxsIHJlYWxseSBuaWNlIHdvcmsgeW91IGhhdmUg
ZG9uZSBoZXJlLg0KPiANCj4gU2luY2UgSSdtIG5vdCBhbiBleHBlcnQgb24gUkRNQSBvciBpdHMg
ZHJpdmVycyBJIGNhbid0IHJlYWxseSByZXZpZXcgYW55IG9mIHRoYXQgcGFydC4NCj4gDQo+IEJ1
dCBhdCBsZWFzdCBmcm9tIHRoZSBETUEtYnVmIHNpZGUgaXQgbG9va3MgbGlrZSB5b3UgYXJlIHVz
aW5nIHRoZSBpbnRlcmZhY2UgY29ycmVjdGx5IGFzIGludGVuZGVkLg0KPiANCj4gU28gZmVlbCBm
cmVlIHRvIGFkZCBhbiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiBpZiBpdCBoZWxwcy4NCj4gDQo+IFRoYW5rcywNCj4gQ2hyaXN0aWFuLg0KDQpU
aGFua3MsIHdpbGwgZG8uDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
