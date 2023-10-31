Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D57DCAA4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF6110E461;
	Tue, 31 Oct 2023 10:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D5310E461;
 Tue, 31 Oct 2023 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698747691; x=1730283691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hzFtSkwrrBJRXEBnB+u/rT6hZSDKFWdfmrn7InA4iRA=;
 b=Q1vn/JnuJWRAGxQCLp0esXmJMPPAU7NkBF92B0miPG6G6q6Y/AMaxR9x
 9ggPOIiTrK6eBqO+pG3UycHopeq4nJB6EXXcCwxqPGDDn7YZvhdy6NT7g
 Ne0MuwHGN9W4GBA/0T62zQy+fwbMEKiKKOwtnYjf3spZRv3KwgEej9MiO
 kyR/jNfajD+7N20OUZYFHNs/MjZaOui5TRpmOkf1gO46ZvONev4XkRHJ1
 U8ElU3I8q8cCRhF9zc/EGX6P8PWv781cwt9GmCxYsWEsfz93jeL6HI8uD
 oRnysuyqRflhS2GDLI9nCcTWbUOnQRxoU6sU8+1LZSkGcpu91iqOgV3Co A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="388079972"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="388079972"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1804875"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 03:21:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 03:21:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 03:21:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 03:21:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buS7JPg60oEmENRSk3ngCN2j9yNJRgRAMrvP4levaobDhljRk+nrx4o0a0H37opxI1u6YUK4FBVOyq7vQAKDDyVIHF1C6ys3MXX6viECpQAykqxt9dE0ZWTHMEr2odcqAVuNjJT3xun78SvUJuwOw8wpiSY4/0Z9fMNzdECgqC9nCrx+zvb86PbKKMyL9wmRDGx7p8mNNIYCCUNLkgFuLoBlBBg9wyhCdAfLE6fk4kQgTAYKeTvOgeKuKj/pXQQeB62rEoWOKvT5xMw4KNG4BWn9HXgrmeZsg0yxw0lDZrXNDo9BgcKwVdnvCMHzb11vdT1bTjnAlR0IW6+vgCOQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzFtSkwrrBJRXEBnB+u/rT6hZSDKFWdfmrn7InA4iRA=;
 b=GgaAS/hl+k/1n2O3tUPTkCaRs4J8PmU4bz5d8K85P2VOchqwzAT5+mSK6VnXGOQPQKwT/vQkTl/4+UzHlcgtp1jieCzO5zttkiWM6tqvm2pR1I4xrD2y3cRbgYsOgSTA9icfxzFDc8dWk7q4mHpmBLl4BCjYLuAikNCEDk8oBrcL7rkJPOrIx6O3Tdpy1Lw/wUeARY+p0CovBbPCIy7UhU7f3cpGKOY2EVBe6wtqgwCGXdnKhWs+mTG2y9Kis/VSvibrY9OpUnWOOvQGF46F50pUZ6Jgf3/XiI2+yAdZXENunAHQGfOMhRDuxwr+Km995l+lJS5oXYTY4oHQiW8QCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 10:21:28 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::2ff2:f2b4:dd37:63d6]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::2ff2:f2b4:dd37:63d6%7]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 10:21:28 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 6/6] drm/eld: add helpers to modify the SADs of an ELD
Thread-Topic: [PATCH v2 6/6] drm/eld: add helpers to modify the SADs of an ELD
Thread-Index: AQHaC+NyFEDSpy2YqkmqeQUdoJBqbrBjr9Mg
Date: Tue, 31 Oct 2023 10:21:28 +0000
Message-ID: <IA1PR11MB6348FD04577CB8608B0273A1B2A0A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <cover.1698747331.git.jani.nikula@intel.com>
 <8e9a05f2b1e0dd184132d636e1e778e8917ec25d.1698747331.git.jani.nikula@intel.com>
In-Reply-To: <8e9a05f2b1e0dd184132d636e1e778e8917ec25d.1698747331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jani.nikula@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SA2PR11MB5209:EE_
x-ms-office365-filtering-correlation-id: 8e76a289-7e15-4834-4969-08dbd9fb24d4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sV4Tpk6RGVeza1n0gUiuQDzAgE44KLLwERAZStdxruWbO1omV1zLNpDsL6154by9T6PMLaXE3IWQOP17k7IZxsPhRmQ+37gNPwPiHy+D6Gnj363EkoeleO/mEv8WP+o9qkJpfMw7ppOZSyVgkQsLFCrN+1SQiMtHCf+80wBmOnlFBFrDXDTw5x6OLEME1EpZyIR1MgJUuMvSDsnHOJBuAMCB0HiUR1kHGS77at1NjtjBWsAMJfgPJU3O+3Ls9xqPsWoLXbT8j+Z6DGlM3FCILK80qWTwK/QrezmHV4cUCLqLEilpY86yuwG3YwEbtizGCSycezWYoPzNxyFVXPyiRchQx2cXK8xb4mnEiVn/NYE7lBXkRXFSES2nxtQ4rOMtPYqhpWO2AVHE2ODYf5wFrfjrFc5GwlQrqjRio3CnJZ5/DhCdnDPY1r3XUkvK9sweR1Mt2E/FwJhfQM62A8JNNXA8heFv4Jl9p067JW+drP/C45L0hSJKSjN5vN8kXF7rgSDlcnMJ/rdQZlKedPswXeWfUpCpBiG1Inu36bSnXR69E4BQ/3sPp4opCpZiEW+ZaSos6Zk3jdLZSdVttEmMU5Bxb3MEmm/L/5GAu8LHcSc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(55016003)(66556008)(66476007)(64756008)(122000001)(66446008)(82960400001)(316002)(38100700002)(53546011)(9686003)(110136005)(478600001)(71200400001)(7696005)(76116006)(83380400001)(2906002)(66946007)(26005)(6506007)(41300700001)(5660300002)(8676002)(8936002)(4326008)(86362001)(450100002)(33656002)(52536014)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U21ESTA4R2FySU9adTNNUWFjQUN1eWJnL01lMFB5ZEFPbXZoRWVjUEdHcGVy?=
 =?utf-8?B?b3dWMURRcFdKK0ZkcmJSK1Z2ZmRjODBXMFYzSEdQdlZLZlExeXY1b0o4ZGYr?=
 =?utf-8?B?Wk9EbWxaWDBHakh4MVJIeVJoeHUwcEsrbGFWcEl3OUx6ZDJEWmQwRFVNTU1O?=
 =?utf-8?B?ckdGU3p1MTdhUDRvaFlzVVErODgvQU03K0NxdzlJcktZWWkzd2hWWkM3R1pE?=
 =?utf-8?B?bGZDYTNTNHhDMXBNZ2FJUDZUSjRpZENPeEJkc2JWN0g1bVpnVkJvZzVIRkJo?=
 =?utf-8?B?dGtCT3M1YzZ2UHBmeFlXZ25TdHU5eDFxa0hFOFZHZDRYa3p1d1FBd3hBeTNV?=
 =?utf-8?B?N2NOWUNCd1lBU01EOXE4RGQzMUMyUzNLWWFFdFR0OFhCQkNtYTlXa2hIWGo5?=
 =?utf-8?B?OFBUUlRnR1JtQTcwcmpDenRsdWt5Z2EvZHVON1dQai9rRlg3YkNGcG10MDlp?=
 =?utf-8?B?eE5ERVZqaFBPRG51RlphQjFVdTRkYXBhUnNXWHhyM0kzaGFPcHlValp2NTVH?=
 =?utf-8?B?bkVjQU93VitmYnBwY3A5a3M0VCtRTjZGQTZIQnk1T0x5TnBDcFlJem5CaTA2?=
 =?utf-8?B?L3VqQnczQ0pCNXJaZExqRUdRTzhsa3A5WU1qamJBREJZNEpMVjV4dEhBNkls?=
 =?utf-8?B?SXNadm1YdHVEWUM0MEdhL3d6MkgyaFhEbWc1UkFxczNTL2xnKzZzaWdENURo?=
 =?utf-8?B?cE9GcWtPWGNmanV0L3Y0Z3ZJRndGVGthSWFvQnVqQVE0KzRrY01XbE9sQTJ5?=
 =?utf-8?B?Y3lNNzh5MURzdG1oWWJPazBNZS9VbU9pUGIwKzlrbkFwUy9wNzBBK3AxTGZH?=
 =?utf-8?B?SlBhanlMcWJMWmVyNC9TUFh0VXlCazd1UXhqNG5oZ3Z6T3gvdlNRUE02SERI?=
 =?utf-8?B?b0tQYzRpRU5RYTdIajNMMHBYV2VKRHZsYmJhZjE2aURKZlM0S2tockRpRkpj?=
 =?utf-8?B?dGVxTFRSdEZGaklQakVoRzZWWGlGN1d5NkNWVGdiRjM1aDRiVlAyeTduRC93?=
 =?utf-8?B?K3QrdkZxZ1h1aVhTV0xGN1pnQ3R1bnpEOTlneXhiRjRiOHdKYWNpWlFtdTlp?=
 =?utf-8?B?MFdVTEZVZ1VRbTVQNmZIYXJwQnkyb2t6eUxFbU1EM0liNXpsQ0poVFQ0T1lr?=
 =?utf-8?B?YTZqQmdVYUVaK3NWM1hIU2YzY05NZGg1SEUydjZLZDZ2TXk5cnMyK0NHaUZo?=
 =?utf-8?B?SzRMaU1hU3RLb3l2SHhYaGpPQkQ5RjhOd3VKTXFhQzk1NHpZK1B6NmJYVGFq?=
 =?utf-8?B?azRVdnI3WEc2aVJJN1orVDk4VVI0SXh3MThXZUlYZ2NxOW1TY0liWVI4bU4r?=
 =?utf-8?B?cmlQTXVVS1lzOHJMTXFUdXFIUElLRzRlMmF4SzhjZTVnR1l4dXkycklDclhI?=
 =?utf-8?B?MG9uak9TV2xiY1RFeUdrYVFpRmMweTIyMU5Od0orMjV6dWZwdndCbytCSEg3?=
 =?utf-8?B?T1pOZFM0bkJyb3o2Y2VpNk56THZ5SjJLSW5DaGx6Q2FoZTF1ZkxsMFprNlZl?=
 =?utf-8?B?VTZvS1FnMnJnYUFMSFZKcTNxZ0VreE9vTm1EbFcybXJ0SkViKzl0UFVvMXdO?=
 =?utf-8?B?aEkxeDI0SzRMTjRpbWpRUjdISHVjU0drS0ZiLzlQYXlXZnEyV3I1SzlkcnIy?=
 =?utf-8?B?VXpEZy9LOFdlOUk0V3FEcGY4aU9UTDRlQ0lhWjlLbU1VMmNOTWEzSGhZMC9Q?=
 =?utf-8?B?Q2xCd2lUUjh3TUplUm0xaGF0T2l4SmtBSTNzRFN0QXQzeHJiNk1xVlVYSEhv?=
 =?utf-8?B?ek1uRkhURXdnVThPYUs3aTgwWUZpSGxKUUd5QU9kYTA3dzVYZUVoVjhKaHBr?=
 =?utf-8?B?VGJzSm1hVmx5ZFpPVStHd3cwRlhxS0UzYjBUMGpnTzY3R25PSmtqQjlCU2VC?=
 =?utf-8?B?T05ycGh6MkVjUTNXNEJDVmQyTVpaSW5XYnlGamhpWm1pU3JaeExZRzVKUDBp?=
 =?utf-8?B?Y1M0dTY3RlFRa0x6UldxTmV1VEZxSzlkQ2Fxd0oxcnhKOHNDemJtWG8wYXRW?=
 =?utf-8?B?YTR5Y2tDaWJMTWREN1hyWVBmMlJlRnNBQS8xd29HZmJZOVdBQWN2dHVVZjVm?=
 =?utf-8?B?a3pqRTZqT3dXOG8wQkp6NWtFdWcybllCMUJBbkFZcXhSdTJSZVlhbmxuQ2pt?=
 =?utf-8?B?ZnZBUlRSV1RvSHB2VDNaTmx0aGxsb2VXNWdTNXJlcnNVQTJjRmIwelpXZGZQ?=
 =?utf-8?Q?tPkrGVBlvnxHjleeT+/PEoI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e76a289-7e15-4834-4969-08dbd9fb24d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 10:21:28.0548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPIsuSHhwgwZRFjJ+ygUplpgx6LxdjJRSLc27KTMYh3M7qc48sKklie88pgSwkC9UaY/K66myFcY+wCjK8YTwBLVUde7DUfwRANbZ7TnkgvJVwV43eO7BY/f8pVKjbwR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlrdWxhLCBKYW5pIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMzEsIDIwMjMg
Mzo0NyBQTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR29sYW5pLCBNaXR1bGt1bWFyIEFqaXRrdW1h
cg0KPiA8bWl0dWxrdW1hci5haml0a3VtYXIuZ29sYW5pQGludGVsLmNvbT47IE5pa3VsYSwgSmFu
aQ0KPiA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNi82XSBk
cm0vZWxkOiBhZGQgaGVscGVycyB0byBtb2RpZnkgdGhlIFNBRHMgb2YgYW4gRUxEDQo+IA0KPiBP
Y2Nhc2lvbmFsbHkgaXQncyBuZWNlc3NhcnkgZm9yIGRyaXZlcnMgdG8gbW9kaWZ5IHRoZSBTQURz
IG9mIGFuIEVMRCwgYnV0IGl0J3MNCj4gbm90IHNvIGNvb2wgdG8gaGF2ZSBkcml2ZXJzIHBva2Ug
YXQgdGhlIEVMRCBidWZmZXIgZGlyZWN0bHkuDQo+IA0KPiBVc2luZyB0aGUgaGVscGVycyB0byB0
cmFuc2xhdGUgYmV0d2VlbiAzLWJ5dGUgU0FEIGFuZCBzdHJ1Y3QgY2VhX3NhZCwgYWRkDQo+IEVM
RCBoZWxwZXJzIHRvIGdldC9zZXQgdGhlIFNBRHMgZnJvbS90byBhbiBFTEQuDQo+IA0KPiB2Mjog
cy9pL3NhZF9pbmRleC8gKE1pdHVsKQ0KPiANCj4gQ2M6IE1pdHVsIEdvbGFuaSA8bWl0dWxrdW1h
ci5haml0a3VtYXIuZ29sYW5pQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1
bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2dwdS9k
cm0ta21zLWhlbHBlcnMucnN0IHwgIDMgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAg
ICAgICAgICAgICAgfCAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VsZC5jICAgICAgICAg
ICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2RybS9kcm1f
ZWxkLmggICAgICAgICAgICAgICAgIHwgIDUgKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDY0IGlu
c2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2Vs
ZC5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJz
LnJzdA0KPiBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QNCj4gaW5kZXgg
Y2ZhOGU2YzM5OWI2Li41OWNmZThhN2E4YmEgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
Z3B1L2RybS1rbXMtaGVscGVycy5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWtt
cy1oZWxwZXJzLnJzdA0KPiBAQCAtMzY2LDYgKzM2Niw5IEBAIEVESUQgSGVscGVyIEZ1bmN0aW9u
cyBSZWZlcmVuY2UgIC4uIGtlcm5lbC1kb2M6Og0KPiBpbmNsdWRlL2RybS9kcm1fZWxkLmgNCj4g
ICAgIDppbnRlcm5hbDoNCj4gDQo+ICsuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2Ry
bV9lbGQuYw0KPiArICAgOmV4cG9ydDoNCj4gKw0KPiAgU0NEQyBIZWxwZXIgRnVuY3Rpb25zIFJl
ZmVyZW5jZQ0KPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmls
ZSBpbmRleA0KPiA4ZTFiZGUwNTkxNzAuLmNkYmU5MWFjMGJmYyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0K
PiBAQCAtMjIsNiArMjIsNyBAQCBkcm0teSA6PSBcDQo+ICAJZHJtX2Rydi5vIFwNCj4gIAlkcm1f
ZHVtYl9idWZmZXJzLm8gXA0KPiAgCWRybV9lZGlkLm8gXA0KPiArCWRybV9lbGQubyBcDQo+ICAJ
ZHJtX2VuY29kZXIubyBcDQo+ICAJZHJtX2ZpbGUubyBcDQo+ICAJZHJtX2ZvdXJjYy5vIFwNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWxkLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VsZC5jIG5ldw0KPiBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4uNTE3
Nzk5MWFhMjcyDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9l
bGQuYw0KPiBAQCAtMCwwICsxLDU1IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
TUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24NCj4g
KyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+DQo+ICsjaW5jbHVkZSA8ZHJt
L2RybV9lbGQuaD4NCj4gKw0KPiArI2luY2x1ZGUgImRybV9pbnRlcm5hbC5oIg0KPiArDQo+ICsv
KioNCj4gKyAqIGRybV9lbGRfc2FkX2dldCAtIGdldCBTQUQgZnJvbSBFTEQgdG8gc3RydWN0IGNl
YV9zYWQNCj4gKyAqIEBlbGQ6IEVMRCBidWZmZXINCj4gKyAqIEBzYWRfaW5kZXg6IFNBRCBpbmRl
eA0KPiArICogQGN0YV9zYWQ6IGRlc3RpbmF0aW9uIHN0cnVjdCBjZWFfc2FkDQo+ICsgKg0KPiAr
ICogQHJldHVybjogMCBvbiBzdWNjZXNzLCBvciBuZWdhdGl2ZSBvbiBlcnJvcnMgICovIGludA0K
PiArZHJtX2VsZF9zYWRfZ2V0KGNvbnN0IHU4ICplbGQsIGludCBzYWRfaW5kZXgsIHN0cnVjdCBj
ZWFfc2FkICpjdGFfc2FkKQ0KPiArew0KPiArCWNvbnN0IHU4ICpzYWQ7DQo+ICsNCj4gKwlpZiAo
c2FkX2luZGV4ID49IGRybV9lbGRfc2FkX2NvdW50KGVsZCkpDQo+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiArDQo+ICsJc2FkID0gZWxkICsgRFJNX0VMRF9DRUFfU0FEKGRybV9lbGRfbW5sKGVsZCks
IHNhZF9pbmRleCk7DQo+ICsNCj4gKwlkcm1fZWRpZF9jdGFfc2FkX3NldChjdGFfc2FkLCBzYWQp
Ow0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9lbGRfc2Fk
X2dldCk7DQo+ICsNCj4gKy8qKg0KPiArICogZHJtX2VsZF9zYWRfc2V0IC0gc2V0IFNBRCB0byBF
TEQgZnJvbSBzdHJ1Y3QgY2VhX3NhZA0KPiArICogQGVsZDogRUxEIGJ1ZmZlcg0KPiArICogQHNh
ZF9pbmRleDogU0FEIGluZGV4DQo+ICsgKiBAY3RhX3NhZDogc291cmNlIHN0cnVjdCBjZWFfc2Fk
DQo+ICsgKg0KPiArICogQHJldHVybjogMCBvbiBzdWNjZXNzLCBvciBuZWdhdGl2ZSBvbiBlcnJv
cnMgICovIGludA0KPiArZHJtX2VsZF9zYWRfc2V0KHU4ICplbGQsIGludCBzYWRfaW5kZXgsIGNv
bnN0IHN0cnVjdCBjZWFfc2FkICpjdGFfc2FkKQ0KPiArew0KPiArCXU4ICpzYWQ7DQo+ICsNCj4g
KwlpZiAoc2FkX2luZGV4ID49IGRybV9lbGRfc2FkX2NvdW50KGVsZCkpDQo+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiArDQo+ICsJc2FkID0gZWxkICsgRFJNX0VMRF9DRUFfU0FEKGRybV9lbGRfbW5s
KGVsZCksIHNhZF9pbmRleCk7DQo+ICsNCj4gKwlkcm1fZWRpZF9jdGFfc2FkX2dldChjdGFfc2Fk
LCBzYWQpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9l
bGRfc2FkX3NldCk7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZWxkLmggYi9pbmNs
dWRlL2RybS9kcm1fZWxkLmggaW5kZXgNCj4gN2I2NzQyNTZiOWFhLi4wYTg4ZDEwYjI4YjAgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9lbGQuaA0KPiArKysgYi9pbmNsdWRlL2RybS9k
cm1fZWxkLmgNCj4gQEAgLTgsNiArOCw4IEBADQo+IA0KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+DQo+IA0KPiArc3RydWN0IGNlYV9zYWQ7DQo+ICsNCj4gIC8qIEVMRCBIZWFkZXIgQmxvY2sg
Ki8NCj4gICNkZWZpbmUgRFJNX0VMRF9IRUFERVJfQkxPQ0tfU0laRQk0DQo+IA0KPiBAQCAtNzUs
NiArNzcsOSBAQCBzdGF0aWMgaW5saW5lIGludCBkcm1fZWxkX21ubChjb25zdCB1OCAqZWxkKQ0K
PiAgCXJldHVybiAoZWxkW0RSTV9FTERfQ0VBX0VESURfVkVSX01OTF0gJg0KPiBEUk1fRUxEX01O
TF9NQVNLKSA+PiBEUk1fRUxEX01OTF9TSElGVDsgIH0NCj4gDQo+ICtpbnQgZHJtX2VsZF9zYWRf
Z2V0KGNvbnN0IHU4ICplbGQsIGludCBzYWRfaW5kZXgsIHN0cnVjdCBjZWFfc2FkDQo+ICsqY3Rh
X3NhZCk7IGludCBkcm1fZWxkX3NhZF9zZXQodTggKmVsZCwgaW50IHNhZF9pbmRleCwgY29uc3Qg
c3RydWN0DQo+ICtjZWFfc2FkICpjdGFfc2FkKTsNCg0KQ2hhbmdlcyBMR1RNLiBUaGFua3MNCg0K
UmV2aWV3ZWQtYnk6IE1pdHVsIEdvbGFuaSA8bWl0dWxrdW1hci5haml0a3VtYXIuZ29sYW5pQGlu
dGVsLmNvbT4NCg0KPiArDQo+ICAvKioNCj4gICAqIGRybV9lbGRfc2FkIC0gR2V0IEVMRCBTQUQg
c3RydWN0dXJlcy4NCj4gICAqIEBlbGQ6IHBvaW50ZXIgdG8gYW4gZWxkIG1lbW9yeSBzdHJ1Y3R1
cmUgd2l0aCBzYWRfY291bnQgc2V0DQo+IC0tDQo+IDIuMzkuMg0KDQo=
