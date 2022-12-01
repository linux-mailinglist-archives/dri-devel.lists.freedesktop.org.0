Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DE63FC55
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E9A10E691;
	Thu,  1 Dec 2022 23:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA5B10E691;
 Thu,  1 Dec 2022 23:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669938971; x=1701474971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2DzrBuG3WQFwSvsuJroWtCmJ7PbqVytd7e7FkLBbyE8=;
 b=FkKA5KbROfksKgFM+7l7WomljQLPe8ZI4lzZcslTfoS4tgUEbue1zsnO
 9LeM+z55b6j/ytdCRwNGJVIJ1utP22e7Y/2SENQ+fl6ACA0HF0DDW4ZbQ
 D0FMjXISeILwfl5Nx6DhmubfWMxrp/y5wNg1r9Xtt8pagDhMLMonXLeQT
 Q85RUoG8nf0IR7acnBnHV85wtQ+7l3aoWonaCGfVPlxpqf6I8thEZgWiK
 KTdfmPpNct7o+uKYX3NTtHtvIepNYTrrKEn7b+4F7sH8TcIPtOj3PZbsZ
 +hQtpcCAOOFp3TjazfreJVtzIsEzPHj2qVt84GcogVjlZvWNOHy4Smkjz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="295523454"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="295523454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 15:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="675631466"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="675631466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2022 15:56:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 15:56:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 15:56:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 15:56:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 15:55:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKng352Nb17cJQfKi8O53kcwNHLHWSX+3UNNb2BjUfhInd0YrgZ5Fj3YTTvtcCRh3mPV53xradFltkxaWHjoWRVhKd8nC0mCBWA5U22x7DeUEeLZzmgV4BabMTxpVIW84RlBi2k41WBSdSPg6Jo+NPPJx5eeSDyXu51iNJjD0YMH7n+AMX6bEbYDSjZUBWToXd8fLFdwzZph5wrMw+ivBW/pwLSG7UKr/cvlvR0QyjNfSWtndo34QwfW8N2HKNodWxA+lHy7Fw8/gqmL6ddm04FU/NXAN8dtpYAejw4qGKL3Dd14fEwDHLKJ+Vhmlwv0Yg2nD8+WvHCyjtDIrm2BdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DzrBuG3WQFwSvsuJroWtCmJ7PbqVytd7e7FkLBbyE8=;
 b=FvWhRxYyk26RvdZZph9rggSbO/cGy34pIau5umnMtW+hc+lQLmAsbQl1tKRh1Ln47Ntb9lj5dlLz0cWJajL6ACWnODaKyb1hsDJF3bpqyWRbkNmYLTCJRMjL0nk4OwgRkQ5AQsZl8v2GefSCgxfVzATLB1eSs1rSgZthVX5ldSdOM8XixQduBu+5S+DImp4CSzaTE0xXs102cXdKUP4CBCGtl7hkOeaAIfBMobqJ2gWN3mTP6l7p217NhwVjGdyXTZ0dPN2qlZqvtvYGW4YctofLUVjwNnRDxjuwro9BVh4SOKLjDHyDTTm0Ky8rh53sPdKTwqVH4mXCUUzxjF63JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 23:55:53 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 23:55:53 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Topic: [PATCH v6 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Index: AQHZBF+GpXTTTK3BYE6Y7lb4YlTCSK5ZuNWA
Date: Thu, 1 Dec 2022 23:55:53 +0000
Message-ID: <897d34b8c97fe4f4ffa65d08f88a9582f0ccb822.camel@intel.com>
References: <20221130020245.3909555-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221130020245.3909555-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SN7PR11MB7420:EE_
x-ms-office365-filtering-correlation-id: 2b774e60-a61e-4045-4f98-08dad3f794ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RtEO0eWThTORtJjFNb3lDyIjGrOLlDr9Bxw8O0AlByL0BedzAeyckC9xlK7ZqpRI9O8CZJSTFQRdlTR9lnSN0bkZzm1joHKXvZ8f5xaNF/rWKHnfIQzD7dsbMRQCgvS0xp8NNlYfb38icoS8tLbqWTuD+zCFpT1ElYMBgNF918OPjCru1/YjeR/FxE9GTjNizpwgXKsoMYaLdpBZQLE+PzTCYiyGvt/SqyvdS0F9XJguLXqq1o8Sdw7cBs9OIiXCahOivgakdvwajH/XxL3y+E4OG1Sw4Fu1EnROjDOGIuZXTBeZRMyHCdii+ax65jBaf/U1O2IRKvvxxX3ED4W+RzyEPgq4M2Rz1QLz0DznrvA0oW2S3m/3PVAssK8mJwHWmwqn4NJjWFrLm3xkGiHmDhyB0gdqLVoVo/z3HWU8TQmM2dLnKl4V+Fzxi1YE2G16F0y0f8Ao3wvfvDOMEyXGUIT2ZR0LNJySaIowjELMvUeK9O/hTaDcOdLLAJJqa7PBZJFk7s89J41QzI/DVpHRbPrFYQY+eDsg88YQOtoLCAwMYdInGJ8jxoeEYvFreD79EsSKzRz+No65hSngFdQfRYCU2V7NXKEhiBaClZF36LP50YT90Tyc62mOc8/bpnIx8jiPylIMWb6eAknfgd31+dIC7Y3XmALLjQVVf+NXeZpVGuYrNKwPL4CzdtQF3BSIyEpKqe3K2IClCWhb2i1B6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(26005)(66446008)(66556008)(66476007)(66946007)(64756008)(76116006)(6512007)(8936002)(4326008)(54906003)(186003)(38070700005)(4744005)(316002)(8676002)(86362001)(2906002)(6916009)(83380400001)(5660300002)(91956017)(2616005)(4001150100001)(478600001)(6486002)(6506007)(122000001)(82960400001)(41300700001)(71200400001)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXdVT2d4V0tMNnJ5M3RJQnFrVUhhdFBtRjZpTm83dVFOYjUyRTQ5M0l0c0ZG?=
 =?utf-8?B?eXNyWVZUQnZjRE5JR0J6bVpRdUhyeGs2UEhkZklBWlp0WlNDZ2VSR1IyUWVt?=
 =?utf-8?B?Wmt4L1VSV1pwWUFrYjZlY1pWa051RFEvbm9lQjQzT2Z0R3hLR1pVS29keGdp?=
 =?utf-8?B?ejN5N3FkY25RRHd5K05zbCtDWDhmdDhZTE9hdnphOTE5TDhLZnd3K1pRVDUv?=
 =?utf-8?B?RVdmaWxmZnVwcVg3d3NRdkEram9JQXljUzBvejR2cTlva2VSbkNyVEJXbnJX?=
 =?utf-8?B?Q2JPQmN5TTAwZzVtRFZlRi9ONkYyczY0Mk0yZjJFM3VVU2tndnFKbDg3M0Fw?=
 =?utf-8?B?WGYvTnZqMnZFRURZN3hOV004SXBWYjFjSkFZV1pUVm1xR3VYOXA1bW81YjVw?=
 =?utf-8?B?TFJkWlhBTjBvdVk2ZmhnSVNpVjlYQUYyaE9CS1E0cDNBNkhCTW5OQ0NpdDRF?=
 =?utf-8?B?eUswM1FWdjY2ZHR3WTh3SXltaXBmSXlDVTYxTnRqTitnRjFlVW5GZ2RvUkIy?=
 =?utf-8?B?TTJadlQza3lwVUg2eDc0dzk2QVFCeHk3N25rZ3dOdGt5LzcxZ2ZGVmdqakx3?=
 =?utf-8?B?ZVdRZGdiRWljMkgweHFRaUhRbUtrNHptVW1Wb29Ld01xZDVlRmNXQWw0amlZ?=
 =?utf-8?B?aFY4NjVVM05LckVQeGhqWXJ6K2dYMDQ0T0E1VGpzVk5YOHZ6KzdnQXBVYkJS?=
 =?utf-8?B?b1RCd2o4ZkkwUHp4WEJtajVWc2diQlo3RE1TRko5aXk0MkhHdHJIZkdVSld3?=
 =?utf-8?B?d3pQdlYybFA3Y1N1V0FUU1BGcDlSMzhXL01Bcmhmc3hXU2l2aFY1bmlxY295?=
 =?utf-8?B?bXRreG5iZEIvaHZnMFNKcUt5YmZsTzV6ZjlpN0JJN0I1RG1JMlFzc0pXYitM?=
 =?utf-8?B?VkFkdExhU290SXpyQ3I3eDhmMEpCZ0xlb2JlVjBWRjNOUFVrRmU5U3JmSzNS?=
 =?utf-8?B?MnVhR3MzVlM0SUZCejZ0Y0c3czJwZzl4T1NLOC94OEZiOWlYd3d5OXJuVjFz?=
 =?utf-8?B?dFJTNXRQaVZqVGc2bzMrNXIrS0ZpZGtMWVlSRXRsWlNFZFAyS2I4VWFVbW9x?=
 =?utf-8?B?MWJQYU01aTZoa2xNRFFlYWtFQ3pudUtRZmpaSk8vL0psRGJ3Q09aU01nYXVv?=
 =?utf-8?B?SjlHZC9hc1dDTlVXdWFUZjE1YmkrTTgyMTByaVN6N0xnZ0ptYWRpTWxhNkUw?=
 =?utf-8?B?bnkzc00yRlBQNDhRTGM2WFh5aU1nMWthc2pQa0RSSUswamtKRVBOeUtPS0cz?=
 =?utf-8?B?a0kzMzFuQUswNnIxU0ZwWXR5SG9yNDFwck5EWGNIV2dqaVdaRW40c0txUmpo?=
 =?utf-8?B?ZGpKMGptNnlqRHJ3c2hHYlZKTmt1TGVKM3J3UitpY1J3U1B6TUJ2b2lpdHps?=
 =?utf-8?B?Q1J1TnZweHBvbnRIcGxsdXcrRVd1NFYrclRuZndJVDd5T3RvY2oxWGdBOUlS?=
 =?utf-8?B?WklMV09ud2ZXSUZkTllzcGlXNFpUSEdibUQxbFNDK0NOdVdwSTVwZlFoWS91?=
 =?utf-8?B?VUw2UVhBbm1WUjVKU3dZa0R4akprUTZDTHdPQlF5bU5odHhWcndjbHRFUFhp?=
 =?utf-8?B?V2NrMVZLK0NDZ3R3d01BWjJxZGVVOTErdnpUQ3dMTUZGZWhwc3gyeC9zRGd4?=
 =?utf-8?B?NGtWMVlLWE45dlVUK29PWHROb2FSOWhPY2hPYnF2M1dlR3NKS3NvcFlOTWxp?=
 =?utf-8?B?Q0tlUzhSa2JzQlRyRU11cWd4SmNDeDVZVFpKS1pDWTFBOHhJTnRETlFCd3BC?=
 =?utf-8?B?VzBDZm5hODI4MzUvTkVwbGFpUVhpVDU4S1BpaEs4elBTV2hXck5QTm9uN0JB?=
 =?utf-8?B?L254TEw5bXF6U1A0bnZoNVp1QTFGQ0VsTFI0MkRGQzNPb2NBblc4aFNSYldx?=
 =?utf-8?B?dm04TGttMlFrQk56YW90eGtTalFkT2hZTUpLV0VpQ1B2c21LdnFlRUxadU9M?=
 =?utf-8?B?VU1kY3dLZXlxOEJpOGRYRXhRNTlGZ21BUE96V08xdXN3d2FmNDdueG5IeWs5?=
 =?utf-8?B?M215b3FOTjlXcjljQ1FQK1o5R1dCd0p6VEh6WDI3YXFBUmlaZlZWZVFIVXhZ?=
 =?utf-8?B?OXVqaitjUVBlbzBXSWlNa0U5SHR0NnlqT2NCb0hnL1JqV3c3d2R2SlZyUDVy?=
 =?utf-8?B?THc2Q1M4ZDBSbWhaRXUyWUtHQUprZk5ZZGQxK3V2WXJwOFdzMFdMOEcreXlh?=
 =?utf-8?Q?kfQ2BQad3RibqubTWWnmTtA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <162FB51E35B1DE478B24C8CEBBD71168@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b774e60-a61e-4045-4f98-08dad3f794ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 23:55:53.4684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdykfYlV0PLcPtckfkWUlnZO+IlBM/jMD/rsJQzrwi0PYnOjKjxd9uVroyCKDBaIuPQ90+qd4dT5pC9EhwsKjWcJvAK8k5sfnsz8vZIv9HssGEh9PH1+Sn9lKCHmWNnh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIFR1ZSwgMjAyMi0xMS0yOSBhdCAxODowMiAtMDgwMCwgVGVyZXMgQWxleGlzLCBBbGFu
IFByZXZpbiB3cm90ZToNCkFsYW46IFtzbmlwXQ0KPiArCW5ld3B4cC0+Y3RybF9ndCA9IHB4cF9n
ZXRfY3RybF9ndChuZXdweHAtPmk5MTUpOw0KPiArDQo+ICsJaWYgKCFuZXdweHAtPmN0cmxfZ3Qp
DQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiAgDQo+ICAJLyoNCj4gIAkgKiBJZiBIdUMgaXMgbG9h
ZGVkIGJ5IEdTQyBidXQgUFhQIGlzIGRpc2FibGVkLCB3ZSBjYW4gc2tpcCB0aGUgaW5pdCBvZg0K
PiAgCSAqIHRoZSBmdWxsIFBYUCBzZXNzaW9uL29iamVjdCBtYW5hZ2VtZW50IGFuZCBqdXN0IGlu
aXQgdGhlIHRlZSBjaGFubmVsLg0KPiAgCSAqLw0KPiAtCWlmIChIQVNfUFhQKGd0LT5pOTE1KSkN
Cj4gLQkJcHhwX2luaXRfZnVsbChweHApOw0KPiAtCWVsc2UgaWYgKGludGVsX2h1Y19pc19sb2Fk
ZWRfYnlfZ3NjKCZndC0+dWMuaHVjKSAmJiBpbnRlbF91Y191c2VzX2h1YygmZ3QtPnVjKSkNCj4g
LQkJaW50ZWxfcHhwX3RlZV9jb21wb25lbnRfaW5pdChweHApOw0KPiArCWlmIChIQVNfUFhQKG5l
d3B4cC0+aTkxNSkpDQo+ICsJCXB4cF9pbml0X2Z1bGwobmV3cHhwKTsNCg0KSSByZWFsaXplIHdp
dGggcmV2NiBub3cgaGF2aW5nIHB4cCBhcyB0b3AtbGV2ZWwgYW5kIGRlZmluaW5nIGN0cmxfZ3Qg
cHJvcGVybHkgaW4gdGhlIGhlYWRlciwgaXRzIGFjdHVhbGx5IHRoZSBjb3JyZWN0DQp0aW1lIHRv
IHN3aXRjaCBIQVNfUFhQKGk5MTUpIHRvIEhBU19QWFAocHhwKSBzbyB3ZSBjYW4gY2hlY2sgdGhl
IFZEQk9YIG1hc2sgb24gdGhlIGN0cmxfZ3QgKGluc3RlYWQgb2Ygcm9vdCBndCBhcyBpdCBpcw0K
bm93KS4gVGhpcyBhc3N1cmVzIEhBU19QWFAgY29udGludWVzIHRvIGJlIGEgZ2xvYmFsLW1hY3Jv
IGFzIHdhcyBpdCB3YXMgb3JpZ2luYWxseSBpbnRlbmRlZC4NCg0KLi4uYWxhbg0K
