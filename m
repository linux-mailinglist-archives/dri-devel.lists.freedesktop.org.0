Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880B6D73C3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 07:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E5F10E33C;
	Wed,  5 Apr 2023 05:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8510E04B;
 Wed,  5 Apr 2023 05:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680672669; x=1712208669;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KsWwPZZ8Ji3HAsJKUDcR+1++bL+zdynQe1aTvdLGiYw=;
 b=niDnmMtAk3ptfAVIIcH2+Mm6PzPEq9Wi93Tq701Fk3GaOqTqiJaV4wKS
 cQITzPeqW2j+hrFn/NAstgC5cRS/Xa9840FUyoqEfvL5fnIAdZZDJCIA1
 iNidmPjqYnu1oAMs8xzqIUo/FYiGsX70CtcILisIetKLv7SJj4MZhYN0q
 I+jUAu3nRBKTsZxBBdBGRm+whaQZ1W1MhQur+YwtTiwVC3MKe+uwxMiSV
 9r8D7jgVGxwpfbcgAn9SGkrAaql5CD723Zn+8IcIIKPHpQmCulWQyTW7C
 XsKiT3IY6I/mKoaynHt04+mxDts5ZWxJR8CYVHk0/ww3RV17uEQB97Ox3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322035718"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="322035718"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 22:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="810515519"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="810515519"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 04 Apr 2023 22:31:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 22:31:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 22:31:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 22:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQjeY2vfyXMqNtclfIalLr0eaL9s11w3qYhCOV6e4/rAyjz1gRr6a1pCezX8odgc43FYKrGGK7XicqobuKaZnxdIPcmmno59QJ9163r+phzCvkmVSxfPF8KpVf54zhwXPl7BC0cdfdTulTzSBMlFQxqiSa8C76C8X7qZ+JuOOaGnrlaJh7DsLlgGcYk2JEDLFOu49BGoXht9KMHkZdxL/Xd8SKRV9BiC38E0TMUtKjfe8BYLo9S+vKCUD3mPvcxZsgdco+jXgSfytCQ2ahIbBPRuvFmV9ScvfwFzIqZl6UGlxRRF9/LJclC4ImtDw22X/C5eSlRLHWI5AH+GdfY2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsWwPZZ8Ji3HAsJKUDcR+1++bL+zdynQe1aTvdLGiYw=;
 b=KxzFLjwsvkn+eM1NCNhQMpOtRp18l4nVns9L4l/Pnr7zpsKHplJchS02FpMLYM5+Uduo0dLGsbPvaWB0ah49lvVI1QukWrkkNuxNg2T5XJCLr7JTn7vbJX2wwgdaXn8l6SBr8XvBC+dY2zgBOJICVPtUyNs5Y0lwRiF7IP/DAN8yE9CeefX5ZsMOuBoomFEEbwPQcvYDuA3KWo5fz1ub9N4UhlklcVcpdtAHjZDF69hp6V120k1lBSZii5Nu291VI2QAUugOuGGhyEZkqIt8uV1xXIqaOn4v1RYzMiI4gh6iyW+kUjpL+SCuq6zzGpGV7X2jL9LW9paOUbW3pS2P2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Wed, 5 Apr 2023 05:31:05 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97%8]) with mapi id 15.20.6254.030; Wed, 5 Apr 2023
 05:31:05 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/mtl: Disable stolen memory backed
 FB for A0
Thread-Topic: [Intel-gfx] [PATCH v3] drm/i915/mtl: Disable stolen memory
 backed FB for A0
Thread-Index: AQHZZyFExVZ/ODyWL0CdB5skvBgwu68bd/EAgAAyEoCAAIdagA==
Date: Wed, 5 Apr 2023 05:31:04 +0000
Message-ID: <eeddf8ec02af3ea611489e65576a56747655e259.camel@intel.com>
References: <20230404181342.23362-1-nirmoy.das@intel.com>
 <ZCxsDA86FrHzL7Rk@intel.com>
 <11c408fd-e9be-5764-a847-defbeec2de9d@linux.intel.com>
In-Reply-To: <11c408fd-e9be-5764-a847-defbeec2de9d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA0PR11MB4735:EE_
x-ms-office365-filtering-correlation-id: 304469be-b281-49d7-8cb4-08db3596f316
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BYLBkucIp25B7ef+271BnWi0ObXxyNWHQeF8U7r+KpxqZPAe6q1cQlkA3mUWK9m1kpnIW1QlK7w4/h1OAqueuX1sjr+/gR2AB9J/AIhrjK6tRrdhMXYB1rKIfM1xXakglNgRsq39gk3iay7nN3XSJ3IidmE+ggc66s7UoB+Hx1dSUaYKMEcg74YqfieB3O/4vwHVhNhnRIQim6ge+m7mPYwW8jpm2dz358xJiJQ21d4G5tbfjjaTelIwtSxikpV++ayvJUcmd1oNpILA7Ku86g1+1E+Y/MUxLu3Hdua6npMfLPrVotQ6app61n6L24hJ1czhRyCX7uCkgVaVTgbpyBn3IanYfDDTbk3XHrU4+PzeP7wR6Hn/WLmWvDpXkwOV/gdI/VOcs6yFuSK1XuXC0F2R4k8WzzJcLGKrvRg6apKc/CsXaL3hvcPm3UqYDeZF6UlCzNoCsZC7JFDzGvEzZD0lT2mXlHq5LXkxEsG9RKqOXuz4iVzlR80hUtSA7RPsYfUo4pGIvvWgZG5gg5UT44yi5xHAOfxLftzgtQi/TMoaAY8BV+jhjgq+EhADHIYSWtPSHUr/9Ugejv69ErJTpx6ww9lTDY73CwcgelbdVeVZi+4svmU83DUjqeY4fVrF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(86362001)(38100700002)(38070700005)(36756003)(6486002)(4326008)(2616005)(6506007)(6512007)(26005)(53546011)(186003)(8676002)(64756008)(5660300002)(76116006)(66946007)(66446008)(91956017)(71200400001)(8936002)(54906003)(2906002)(478600001)(110136005)(316002)(41300700001)(66476007)(66556008)(82960400001)(122000001)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0JFQmJseWdtZU9FRy9pdUIxMWg4RzFjVGNsdjMzU2swNmlKbnhJSnFmUEpq?=
 =?utf-8?B?QlJzM1kvTlVRRXdPTHZXaXdqK1duSzBldFo3MUp0NlRxdkh2Y2lyaWlNYVhC?=
 =?utf-8?B?YUJQbXR3RXB5OEc3SkhGc3NXVWZOU2RYTDRlaFo1c2s4VnZkMmcvMVdFZlB4?=
 =?utf-8?B?SHUrL012cUJNc1p6T2lQVTJSMUhzMGZCQStjZFZHdmd5VU4wbElCazI1eXhr?=
 =?utf-8?B?U3BlNXB0ZjFaN0pFaTYycmVIY0thU3N6WXVSWkxYcnFOdTBnR3BURmVpTHpt?=
 =?utf-8?B?ekV2ZzVBRGU1UGpjVEZtdFEwRHdLQ081cW1kNG1vWFFWWm93S1ZVdm5zREZ2?=
 =?utf-8?B?Yld0RFpQSlBDcHNYU2ZDQ1RXUGFUZDF4bzV3TDd5ZldXWnBxQkg5aHc0NjBS?=
 =?utf-8?B?Vmk0Y3lkLzB3RG9IeVpqZU5BcElHcVJyWUI4MDhxa1Y2bmIzL3hTNHlXSkla?=
 =?utf-8?B?bU9BRTh6dEtqbktseUdhK0NiNFFjSXlTdmFGL0Fjb20xSGVSN2hSZmlkb0sr?=
 =?utf-8?B?Z1E5N1pEeXpEcWxCYjNSWEpJUDgyYmFaV0FlVDJtU3FNL3NDNG1mRkxodytv?=
 =?utf-8?B?WXBkQ0gvMVVRQ2Z6eHR5WGw2cDFsSzZ4Y3hjbVg4ZVU5ak1WZTBndFR4K3RK?=
 =?utf-8?B?RGwyVi9vMDVyRnN3bG0vRHVuMFh4U3d5b3FScnZQTzZJZUpnUlp5N3REbCta?=
 =?utf-8?B?TFMydHRTaDFtT0lvTjUwTlhkaDVHS0pmK2FkeXhLVnE1UUtUOXN1cjlqWkgz?=
 =?utf-8?B?dFI5RklFbXc2eGlNME9aYzFVVEVoUVlQZ1JzQmhWY3NFS1FPSFdaYkZQcXUw?=
 =?utf-8?B?dVRURngyV3hvTGJxTG50VXlBblhCRW9iNjk4YzFZaDJsRzFtQTQwelNrVG54?=
 =?utf-8?B?Q0Q0SUJnSC9XRXo1aG5pUlMwamJkYmljSlZWM1d5K2ErMit4cmRGcHhEbjdr?=
 =?utf-8?B?QkczSUtzVW1jcll2M3cxQ2ZmV0VFb2oxeDBWVGJGdW5TbTJhakdqb3doRFpQ?=
 =?utf-8?B?dW5ES0MrYzNNMkZYNDdoQjBkSUpRRlhBeGhGcWRGeGlOWWllU1dWdnBNaGd0?=
 =?utf-8?B?SlJ6R1ZJbXNmWjl5YVFJb1dFQzZHYkVua3hMZTF6MDRGVjhNeXY3anFXV1FW?=
 =?utf-8?B?U0V1ZUFTMTd6d3k2bGFXRjVpVUJWeDk1VU8ycld2cnhwUy82Kyt6VHlOUncw?=
 =?utf-8?B?QzJZcm9KTUtEWDFaMDluSVh3M1dqNzdIVlNSdDArMjZoR1NONnVOdDlhZUxu?=
 =?utf-8?B?WmR3QmtrZlFWMS90cVhUWU1Ub1dqM2orZ1Y4d3JnMmpwbzlEaU9zR3ZNM2hQ?=
 =?utf-8?B?YzFseXhaSitDbmJRUnc4Mm0wL1M2aWpHZjlYOTZ2bXdOd2sxdlovc3VzY3Vs?=
 =?utf-8?B?VFVoOHVhL2JQbVJDUW9yNjJKR1N1SUxzYW5Manh3T05jd3hHTXB1RCs3bnps?=
 =?utf-8?B?aXJiTzNZa1NCWXAybU5scVZYaDBlQ3FtRm9Ca1JpY2djbWg1YmVNcGFlSFlw?=
 =?utf-8?B?c2YyalkwYTlLRFd2R3BBamNRVks3cTNTSTBXVVRCM0kzNnllYzJ1OU5CSlVX?=
 =?utf-8?B?NDNub1hPWkQ3RVViRlJ1aEM2VmZ2VkVSY0ZnM2dsNHdRMDA0NEFva21GRm5h?=
 =?utf-8?B?UE1GSTVITk8ybjYyYXdPRHIxcitpUDR3WVRXNTdVczRuWkFXL3lyZEl4RGh3?=
 =?utf-8?B?ZDNPQ1ZZYkpUUzVnWktRNDVIMlJCT2xCWjhzOXNzaC9Cc0xaTnJYK1Uwb3RI?=
 =?utf-8?B?MGh3SlhXZzFkVGNOOE4wVTNTdFJXMGQrYTdwcnpkaURSSFJRLzdBa3RiMThm?=
 =?utf-8?B?Mkc4S2FVL3pkOC9EM3N6WkdWQ0l0YXBSZE8xQS9ORW9jcTVxU09RdGNMV3Ja?=
 =?utf-8?B?a2wzL0VGWUpqdjRQNm9RTzZURTN3S2FJUkdNVnM0ak8xZFhsSWsyME5rWGRv?=
 =?utf-8?B?amVqYXo5em9sYkl3UWR5ZlhpK1pROHRoMDRKamFwK0lqa1VMVjl6UjhBMmVu?=
 =?utf-8?B?VnR1anVXa2p2ZFZweEE5eDZCNzNvSXBtWVhuVEFKWHlReU9Oa3RLMkNFR1Rs?=
 =?utf-8?B?VnJZSW9ScnBNUUxYRzgwcHlCRkZOME1MdFBtOSs5c2d5ekFIanBJUmpkRzJi?=
 =?utf-8?B?M2pDei82MTdhRitMa3N3QTFnL1BKYXJaZE5pcVM0Yk1GMmlmQ3RSSTZRWElq?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07F229DBE376CD4BB51E43C8E34B2916@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304469be-b281-49d7-8cb4-08db3596f316
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 05:31:04.2583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jK0e3Li8ZzElZ8wF/hpvd79RIq0wi2M1jEf0Cxyx5u7tHPhV9YRXz3F3bS640TlvoUHTCeDT/VA8S0yxcBA79pkbIqWkoGoM+1BHxCP8Eak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA0LTA0IGF0IDIzOjI2ICswMjAwLCBEYXMsIE5pcm1veSB3cm90ZToNCj4g
DQo+IE9uIDQvNC8yMDIzIDg6MjcgUE0sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToNCj4gPiBPbiBU
dWUsIEFwciAwNCwgMjAyMyBhdCAwODoxMzo0MlBNICswMjAwLCBOaXJtb3kgRGFzIHdyb3RlOg0K
PiA+ID4gU3RvbGVuIG1lbW9yeSBpcyBub3QgdXNhYmxlIGZvciBNVEwgQTAgc3RlcHBpbmcgYmV5
b25kDQo+ID4gPiBjZXJ0YWluIGFjY2VzcyBzaXplIGFuZCB3ZSBoYXZlIG5vIGNvbnRyb2wgb3Zl
ciB1c2Vyc3BhY2UNCj4gPiA+IGFjY2VzcyBzaXplIG9mIC9kZXYvZmIgd2hpY2ggY2FuIGJlIGJh
Y2tlZCBieSBzdG9sZW4gbWVtb3J5Lg0KPiA+ID4gU28gZGlzYWJsZSBzdG9sZW4gbWVtb3J5IGJh
Y2tlZCBmYiBieSBzZXR0aW5nIGk5MTUtDQo+ID4gPiA+ZHNtLnVzYWJsZV9zaXplDQo+ID4gPiB0
byB6ZXJvLg0KPiA+ID4gDQo+ID4gPiB2MjogcmVtb3ZlIGhzZGVzIHJlZmVyZW5jZSBhbmQgZml4
IGNvbW1pdCBtZXNzYWdlKEFuZGkpDQo+ID4gPiB2MzogdXNlIHJldmlkIGFzIHdlIHdhbnQgdG8g
dGFyZ2V0IFNPQyBzdGVwcGluZyhSYWRoYWtyaXNobmEpDQo+ID4gPiANCj4gPiA+IENjOiBNYXR0
aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4gPiBDYzogQW5kaSBTaHl0aSA8
YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNw
dXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gPiA+IENjOiBMdWNhcyBE
ZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiA+IENjOiBSYWRoYWtyaXNo
bmEgU3JpcGFkYSA8cmFkaGFrcmlzaG5hLnNyaXBhZGFAaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVk
LW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+ID4gPiBSZXZpZXdl
ZC1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiAtLS0N
Cj4gPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYyB8IDgg
KysrKysrKysNCj4gPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gPiA+
IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9z
dG9sZW4uYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVu
LmMNCj4gPiA+IGluZGV4IDhhYzM3NmMyNGFhMi4uZWU0OTJkODIzZjFiIDEwMDY0NA0KPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jDQo+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMNCj4gPiA+IEBA
IC01MzUsNiArNTM1LDE0IEBAIHN0YXRpYyBpbnQgaTkxNV9nZW1faW5pdF9zdG9sZW4oc3RydWN0
DQo+ID4gPiBpbnRlbF9tZW1vcnlfcmVnaW9uICptZW0pDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
LyogQmFzaWMgbWVtcmFuZ2UgYWxsb2NhdG9yIGZvciBzdG9sZW4gc3BhY2UuICovDQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgZHJtX21tX2luaXQoJmk5MTUtPm1tLnN0b2xlbiwgMCwgaTkxNS0+ZHNt
LnVzYWJsZV9zaXplKTsNCj4gPiA+IMKgIA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyoNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoCAqIEFjY2VzcyB0byBzdG9sZW4gbG1lbSBiZXlvbmQgY2VydGFpbiBz
aXplIGZvciBNVEwgQTANCj4gPiA+IHN0ZXBwaW5nDQo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiB3
b3VsZCBjcmFzaCB0aGUgbWFjaGluZS4gRGlzYWJsZSBzdG9sZW4gbG1lbSBmb3INCj4gPiA+IHVz
ZXJzcGFjZSBhY2Nlc3MNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIGJ5IHNldHRpbmcgdXNhYmxl
X3NpemUgdG8gemVyby4NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqLw0KPiA+ID4gK8KgwqDCoMKg
wqDCoMKgaWYgKElTX01FVEVPUkxBS0UoaTkxNSkgJiYgSU5URUxfUkVWSUQoaTkxNSkgPT0gMHgw
KQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGk5MTUtPmRzbS51c2FibGVf
c2l6ZSA9IDA7DQo+ID4gVGhhdCBjZXJ0YWlubHkgd29uJ3QgcHJldmVudCBGQkMgZnJvbSB1c2lu
ZyBzdG9sZW4uDQo+ID4gQXJlIHdlIHN1cmUgdGhhdCBGQkMgYWNjZXNzZXMgYXJlIGZpbmU/DQo+
IA0KPiBJIHRoaW5rIHNvLiBJIHJlbWVtYmVyIEpvdW5pIHRlc3RlZCB0aGlzIHBhdGNoIGludGVy
bmFsbHkgdG8gdW5ibG9jaw0KPiBhIA0KPiBGQkMgdGVzdC4NCj4gDQo+IEpvdW5pLCBjb3VsZCB5
b3UgcGxlYXNlIHNoYXJlIHlvdXIgdGhvdWdodHMuIEkgY2FuJ3Qgc2VlbSB0byBmaW5kIHRoZQ0K
PiBpbnRlcm5hbCBKSVJBIHJlZmVyZW5jZSByaWdodCBub3cuDQoNCkkgdGVzdGVkIHRoaXMgcGF0
Y2ggYW5kIGl0IHdhcyBmaXhpbmcgdGhlIHByb2JsZW0gaXQgd2FzIHRhcmdldGVkLiBJDQpkaWRu
J3Qgbm90aWNlZCBhbnkgaXNzdWUgYmFjayB0aGVuLg0KDQo+IA0KPiANCj4gUmVnYXJkcywNCj4g
DQo+IE5pcm1veQ0KPiANCj4gPiANCj4gPiA+ICsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gMDsNCj4gPiA+IMKgIH0NCj4gPiA+IMKgIA0KPiA+ID4gLS0gDQo+ID4gPiAyLjM5LjANCg0K
