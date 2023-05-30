Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB2716D1D
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F188710E0CC;
	Tue, 30 May 2023 19:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF14B10E0CC;
 Tue, 30 May 2023 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685473549; x=1717009549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Be6JhW+6mEvhYfcID5jmqlPXVYLI8IZ8GkBmdmi+OU4=;
 b=XoDdgB2vya+LtAmmNNvDqYkqDNU7Cs+4Mpkwr9REAFLgOxxOAIIuzX2j
 m5kR7L/dJzKk7Wkyz54hpdotM4+68TZnsZ+3DAXsU6Qm8nwcRyGbmS4n8
 sICMHI0zYaRdT35LwEFOY2byx1O9jJTHx+2boeyUiQkZJjxk8pO3c1JXf
 tp13bi203HFXgtUI0Lq02WFI7vj8d+zJ7q3bR79EiGFxC+EfGdmjknUj6
 dcjnkZabyRFoD6fWWCL9KU6Y2Cqza1AcJPRgKXlx+QdAHQXyqV6rWpeN8
 qo6KhcoIQGr0VIsO04BSibKCKUw1KNSi1kT3ltB56qSJazvANYO3JJV8Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357401697"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="357401697"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 12:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="953303593"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="953303593"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 30 May 2023 12:05:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 12:05:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 12:05:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 12:05:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 12:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jim+IoCYUpw1bHeC6jLrRG6YtWaDu6cdZHFjor5yXDyaOCShDvz84XDoa3UAZPFBBYQUKCYrzCjFSLZGvyI/HJ+QWmWmcDR7DtKsnCx462dIgx4Olj64EHmPysU9WelsL24IZaRIAvElRpM3twywE5FTG7A0ZNurzn6TCkXhLFLZvQU58ReHDBeNfuOIq+HIJ9H+spTZSMBg3CaaAPpzzaPFQxQesPTqfB9eNbo/n3GVjBgVp7ufuuaTXZsBBhWPnbsIH6ZEAGCYA4ecSFdsIuu04pImE7ZULfLCdDrGHUj5TMkEvSKubhqfNyJtaLyjmB00zR0egk35bCz4DYeIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Be6JhW+6mEvhYfcID5jmqlPXVYLI8IZ8GkBmdmi+OU4=;
 b=jukgEwpo1kkNcXlGanQql/DRFs1K0CLl+xyRDIpzpq9RMi78jBe1gSyzry6UVfmYCVcH47P8d9C1yv2rJInRy8BqfElZzSe4PODp4cyaYsqsh0gK/6ztPLGvYD+Yu175jsqrWTL9Py8KptQizL1bcgwmp9sj5OqWnOIqAmAUpmkROT3/s2ALlhdtK7uDm4q7VJ2m0OsRM6pBhFLGsH2rlYGVXByjuOp2dXbB5tSoXFphQsJCf8t8ZIfDRHfJttL6dpL0ezkGHW/KyFmKQYlOtDnW7B/Ugbw/QCpvEyK/3vco1GHexpzzTitmrGJwNhU3c6/37ZhLuAW9wm7RXGRqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:05:38 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:05:38 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Nathan Chancellor <nathan@kernel.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>
Subject: RE: [PATCH 1/2] drm/i915/gt: Fix second parameter type of pre-gen8
 pte_encode callbacks
Thread-Topic: [PATCH 1/2] drm/i915/gt: Fix second parameter type of pre-gen8
 pte_encode callbacks
Thread-Index: AQHZkyQZtJl1eK3ARk6bfJmeg1mRQK9zK86Q
Date: Tue, 30 May 2023 19:05:38 +0000
Message-ID: <BYAPR11MB2567FC5FE6E9532F858A76819A4B9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
 <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-1-54501d598229@kernel.org>
In-Reply-To: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-1-54501d598229@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DM4PR11MB8158:EE_
x-ms-office365-filtering-correlation-id: 7f933c71-fd07-4110-f193-08db6140db24
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VCdkLoH2koa6ezPfAOmgtx5ezrG2WVqcSceVoRlJBJL5I/SFk5d539O9OSpxODGKuQ2r/fkJI+aDjFgtfCkha7/8H9BnlvJm0ojSAeYqL1vDYhrZ3VeO8EKQSeXVBGvWHQOicAqiDRusUSHUA4ZtGTMOY4RWrq/iPtRTnXr7X5oPWPjURsenNEycSiPjZD6bpx4QXlTqvmWN9dyoCf1TfWxxWVMEdqY9A/Ey5KKcd2sUqaneOF8oh7N+oBi5T1btYIJ5sKOG3TMczoi4t/6MKfUXuCwwMCcwWcrzYU6A68kXGSfaB3fROe5FZNitQeG6LK9FLaxHEh1quB0s9U2mss5gKBo2+Pl08912NbpS4kYtBWmngkH1Kekk9lsS+qGHtqwo6lPlfS8UqplXAHEVr4QiP08lRx4GchoflSS4hzGk0uDTW4yuGkVEyYerFC1POl0l06h7nDnxg3ZWgo0u9/8g2pghnR12vEmJPd+2KlgJZvX41pzaND8XqoijkXV6d6L4F4QmimxbihNV4VMnhKtV1NvJtQkb7xEP6m8h6TV5AzwGf3qWGu6Sgv3b2E+0V93PFN/EBs36m346pAMALFpzqrpXLpqbjZcM7DgsJHk+Emrp/k4LlezyOJ7WZsgF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199021)(82960400001)(122000001)(54906003)(33656002)(38100700002)(110136005)(478600001)(66556008)(71200400001)(64756008)(66446008)(76116006)(66946007)(66476007)(7696005)(41300700001)(52536014)(7416002)(5660300002)(8676002)(8936002)(86362001)(26005)(2906002)(55016003)(9686003)(6506007)(186003)(83380400001)(38070700005)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SC9KT2tzb3VudUZPbEZtYXR1ZWJFRE9OVGxaMXR5SThJWkhQdzg1dUxQcDl6?=
 =?utf-8?B?TzM1cXk3YVh1ZzlEcGE5aGQ4RjJWVlIwZloydXBGQTJSeVhsUEpJTW9vVVQ2?=
 =?utf-8?B?TXdrTmNoVHl1NFl5UUZLSytuc0JTb043b3BkTWRsdzlBZ0YwejgyWUxzekxT?=
 =?utf-8?B?QVkxU2lISWo0YVhkbHhtellXb05EdTN1Yk9WK0FVNkdIb2lkUVdFelRTd3JG?=
 =?utf-8?B?ZVdEQ1lYdGxxRmt2UWN2TXI0dE93eXREQTd6eVhGRVN4RlJQSmwrSVorNTBU?=
 =?utf-8?B?T2xlcmRjUm9jK252WWd5WWRvSGZpWUd4b1NPOTYzRVVXSk9NaUtGc3NJMFA5?=
 =?utf-8?B?Y05XM2t0Z2dkV1U4MXBWSlRURU1KL2dEN3hZR1QxbnNxMUt2S1ZwQk9XWXlL?=
 =?utf-8?B?eEhNRWJTWDROWU9IZTN3N0xweEYvWkwvNkg2MFg2MXVtZndJSEYxQWUrcG0x?=
 =?utf-8?B?R0VaeHgwY2VCdTVIZW5ySCtMdis5NTRaaVhKVDc1bU1mZXJKYklsd2N6ekFI?=
 =?utf-8?B?QVREYTZlSzZWbHg4emRuZmVWeWNXSjdCWFVsd1p2NG84TkFxMWFxSlpsajhi?=
 =?utf-8?B?ZjNHYlZCRlRCaFpNajN0RllIN1RnVkV5Q3dCdFZwbjgyblhkL0RNZEEwUHhs?=
 =?utf-8?B?dkppQis2YlRsRlp2NklKY25rME12NWp6aFlKNEJTRVdBRGM5TDJodGh3QTRV?=
 =?utf-8?B?aW5qdFVEaHNlb0o1T1h2azkxR3hBS1FuR3Zvc20zQUxOckVYRTdoR3hEZlQx?=
 =?utf-8?B?S0pTcUJwOFprQWhYTW9VeVVKQWxRcG44VzBVbjc1V2hqZEVsbG9HS3lJTkRk?=
 =?utf-8?B?ZG1WT3lkSTNRaGRVUzNzNlUzU2d4YnhwTFRncjhPNjd5SzZkcnF3OVN1aERN?=
 =?utf-8?B?aHEzeklCVXIzT3BSTFFXYmsvbDNlQWFuU0hCelZKY0xJOE5kVEF0VXZLV012?=
 =?utf-8?B?YXphOGg4cmltKy8zak1aTklUVjhTNUtyQmxENE13SlFZemozbjkySk45MGo5?=
 =?utf-8?B?Y0JLdlV1eXBkUWJ2T3JoLzRhTmhlV2FScGlmaGtRd1hqZlFqeVRKQkdCRkVX?=
 =?utf-8?B?VXhxTTFoRlNWUm9oV1g5QWZEbndoNXIxdnlUTWpHY3RDeWVWYTUrTHpVRlpr?=
 =?utf-8?B?aEtPejhFcTlnWGdXTENDcFVDelkvc2YyUFMzY2I0RmkrVEQ5UDhHRXJIZlhI?=
 =?utf-8?B?RWdwK0JoUXgyS1lOUGNldk5Lc0FnRWNsSCtSbTg2R3JKL2pvSDlVQVFKM2o4?=
 =?utf-8?B?Z0hUcURGSXpCUk50VjhTbVRYRHRWK0xzNUNxaGJxT3J2d0Y5V1gvYnIvTG9M?=
 =?utf-8?B?aGV2SnN4Ry9LU1QyZGQvNkQwMU15cVc5M2c5NzJDd3V6VmFhbE1LWUQ2eGxu?=
 =?utf-8?B?Y3hzNlViRHJBMVNHWmVpaWFtdmhNN0ZvT3pxQi9FR0NHZkpDUGIwTXR0bldv?=
 =?utf-8?B?Q2hqUG9tbUM1R3ZpbDZ2dGZLcmF1K3RyTTdWWUVXZ2RwWWVTNVpRKzdaTEdB?=
 =?utf-8?B?UDFiaS81elZXdmx6ZjIydG51TEJrRGdQcjliOC9nMUZWZlYwWmpwV0hVYTk3?=
 =?utf-8?B?Y09abG1YTHVJV0RCb1hQSWtOdnllNk9wTE9Zdk5rREVtWERkSWtnMEhodVhy?=
 =?utf-8?B?UFc4NHNNdDVZQnkyeWRWM29QbXBaMDdFcTIvbEY1Q1lQdDlEaHl3SWFNaU1W?=
 =?utf-8?B?UzBKbHo1Wk9SNTlRbVZ0S1FWMjhqVzNmR1NhUjN5VEVCTnlOY0pXWmxVNG1T?=
 =?utf-8?B?ZmN4RHlIcFlPQlVqZWFVL2R2dXdCM0NoVGQwOG0zRzd1QVJncHArMDhzRXRH?=
 =?utf-8?B?MThOSEpFK3JhR0tUTElYRFBjNlhLNkNuOTNGK0lRRlNqS0VNcmlSM0pRcXFl?=
 =?utf-8?B?U2ZiYkR4eUg1M1BicERXck9FRFI4Yk1tVEh0ZWUyN3lVOU9KN1h3aEpyUFFw?=
 =?utf-8?B?dk1oaTI1LzNYR1FzdnM4MGpjRDY1anZHTGt5Q1pPMU1PSmQrUVZVdjNJY01n?=
 =?utf-8?B?YXZwVTFmUm95SWhmTWZDQ3hMcTExRHAvazZoUzZvc040OENCQ1huZ2NPejB6?=
 =?utf-8?B?MUJsYXQ0VGZCY0JIU2dYOHBkVEhVSGxUUzh5Vi9reFkwZkpMTHZ0ZWM4VXY3?=
 =?utf-8?Q?I44w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f933c71-fd07-4110-f193-08db6140db24
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 19:05:38.5487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQ00GtnF2MUQfywzJpulA9FIATUrzZZ5mb530ELjgJwTZaMpS1Drk+E1pNeVlwD/OHIIHA83WNJciKCqgFtAUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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
Cc: "Rix, Tom" <trix@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vaTkxNS9ndDogRml4IHNlY29uZCBwYXJhbWV0ZXIg
dHlwZSBvZiBwcmUtZ2VuOCBwdGVfZW5jb2RlIGNhbGxiYWNrcw0KPg0KPiBXaGVuIGJvb3Rpbmcg
YSBrZXJuZWwgY29tcGlsZWQgd2l0aCBDT05GSUdfQ0ZJX0NMQU5HIChrQ0ZJKSwgdGhlcmUgaXMg
YSBDRkkgZmFpbHVyZSBpbiBnZ3R0X3Byb2JlX2NvbW1vbigpIHdoZW4gdHJ5aW5nIHRvIGNhbGwg
aHN3X3B0ZV9lbmNvZGUoKSB2aWEgYW4gaW5kaXJlY3QgY2FsbDoNCj4NCj4gICBbICAgIDUuMDMw
MDI3XSBDRkkgZmFpbHVyZSBhdCBnZ3R0X3Byb2JlX2NvbW1vbisweGQxLzB4MTMwIFtpOTE1XSAo
dGFyZ2V0OiBoc3dfcHRlX2VuY29kZSsweDAvMHgzMCBbaTkxNV07IGV4cGVjdGVkIHR5cGU6IDB4
ZjVjMWQwZmMpDQo+DQo+IFdpdGgga0NGSSwgaW5kaXJlY3QgY2FsbHMgYXJlIHZhbGlkYXRlZCBh
Z2FpbnN0IHRoZWlyIGV4cGVjdGVkIHR5cGUgdmVyc3VzIGFjdHVhbCB0eXBlIGFuZCBmYWlsdXJl
cyBvY2N1ciB3aGVuIHRoZSB0d28gdHlwZXMgZG8gbm90IG1hdGNoLg0KPg0KPiBjbGFuZydzIC1X
aW5jb21wYXRpYmxlLWZ1bmN0aW9uLXBvaW50ZXItdHlwZXMtc3RyaWN0IGNhbiBjYXRjaCB0aGlz
IGF0IGNvbXBpbGUgdGltZSBidXQgaXQgaXMgbm90IGVuYWJsZWQgZm9yIHRoZSBrZXJuZWwgeWV0
Og0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dndHQuYzoxMTU1OjIzOiBl
cnJvcjogaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHBvaW50ZXIgdHlwZXMgYXNzaWduaW5nIHRvICd1
NjQgKCopKGRtYV9hZGRyX3QsIHVuc2lnbmVkIGludCwgdTMyKScgKGFrYSAndW5zaWduZWQgbG9u
ZyBsb25nICgqKSh1bnNpZ25lZCBpbnQsIHVuc2lnbmVkIGludCwgdW5zaWduZWQgaW50KScpIGZy
b20gJ3U2NCAoZG1hX2FkZHJfdCwNCj4gICBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwsIHUzMiknIChh
a2EgJ3Vuc2lnbmVkIGxvbmcgbG9uZyAodW5zaWduZWQgaW50LCBlbnVtIGk5MTVfY2FjaGVfbGV2
ZWwsIHVuc2lnbmVkIGludCknKSBbLVdlcnJvciwtV2luY29tcGF0aWJsZS1mdW5jdGlvbi1wb2lu
dGVyLXR5cGVzLXN0cmljdF0NCj4gICAgICAgICAgICAgICAgICAgZ2d0dC0+dm0ucHRlX2VuY29k
ZSA9IGlyaXNfcHRlX2VuY29kZTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeIH5+fn5+fn5+fn5+fn5+fg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X2dndHQuYzoxMTU3OjIzOiBlcnJvcjogaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHBvaW50ZXIgdHlw
ZXMgYXNzaWduaW5nIHRvICd1NjQgKCopKGRtYV9hZGRyX3QsIHVuc2lnbmVkIGludCwgdTMyKScg
KGFrYSAndW5zaWduZWQgbG9uZyBsb25nICgqKSh1bnNpZ25lZCBpbnQsIHVuc2lnbmVkIGludCwg
dW5zaWduZWQgaW50KScpIGZyb20gJ3U2NCAoZG1hX2FkZHJfdCwNCj4gICBlbnVtIGk5MTVfY2Fj
aGVfbGV2ZWwsIHUzMiknIChha2EgJ3Vuc2lnbmVkIGxvbmcgbG9uZyAodW5zaWduZWQgaW50LCBl
bnVtIGk5MTVfY2FjaGVfbGV2ZWwsIHVuc2lnbmVkIGludCknKSBbLVdlcnJvciwtV2luY29tcGF0
aWJsZS1mdW5jdGlvbi1wb2ludGVyLXR5cGVzLXN0cmljdF0NCj4gICAgICAgICAgICAgICAgICAg
Z2d0dC0+dm0ucHRlX2VuY29kZSA9IGhzd19wdGVfZW5jb2RlOw0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4gfn5+fn5+fn5+fn5+fn4NCj4gICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9nZ3R0LmM6MTE1OToyMzogZXJyb3I6IGluY29tcGF0aWJsZSBmdW5j
dGlvbiBwb2ludGVyIHR5cGVzIGFzc2lnbmluZyB0byAndTY0ICgqKShkbWFfYWRkcl90LCB1bnNp
Z25lZCBpbnQsIHUzMiknIChha2EgJ3Vuc2lnbmVkIGxvbmcgbG9uZyAoKikodW5zaWduZWQgaW50
LCB1bnNpZ25lZCBpbnQsIHVuc2lnbmVkIGludCknKSBmcm9tICd1NjQgKGRtYV9hZGRyX3QsDQo+
ICAgZW51bSBpOTE1X2NhY2hlX2xldmVsLCB1MzIpJyAoYWthICd1bnNpZ25lZCBsb25nIGxvbmcg
KHVuc2lnbmVkIGludCwgZW51bSBpOTE1X2NhY2hlX2xldmVsLCB1bnNpZ25lZCBpbnQpJykgWy1X
ZXJyb3IsLVdpbmNvbXBhdGlibGUtZnVuY3Rpb24tcG9pbnRlci10eXBlcy1zdHJpY3RdDQo+ICAg
ICAgICAgICAgICAgICAgIGdndHQtPnZtLnB0ZV9lbmNvZGUgPSBieXRfcHRlX2VuY29kZTsNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIH5+fn5+fn5+fn5+fn5+DQo+
ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jOjExNjE6MjM6IGVycm9yOiBp
bmNvbXBhdGlibGUgZnVuY3Rpb24gcG9pbnRlciB0eXBlcyBhc3NpZ25pbmcgdG8gJ3U2NCAoKiko
ZG1hX2FkZHJfdCwgdW5zaWduZWQgaW50LCB1MzIpJyAoYWthICd1bnNpZ25lZCBsb25nIGxvbmcg
KCopKHVuc2lnbmVkIGludCwgdW5zaWduZWQgaW50LCB1bnNpZ25lZCBpbnQpJykgZnJvbSAndTY0
IChkbWFfYWRkcl90LA0KPiAgIGVudW0gaTkxNV9jYWNoZV9sZXZlbCwgdTMyKScgKGFrYSAndW5z
aWduZWQgbG9uZyBsb25nICh1bnNpZ25lZCBpbnQsIGVudW0gaTkxNV9jYWNoZV9sZXZlbCwgdW5z
aWduZWQgaW50KScpIFstV2Vycm9yLC1XaW5jb21wYXRpYmxlLWZ1bmN0aW9uLXBvaW50ZXItdHlw
ZXMtc3RyaWN0XQ0KPiAgICAgICAgICAgICAgICAgICBnZ3R0LT52bS5wdGVfZW5jb2RlID0gaXZi
X3B0ZV9lbmNvZGU7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiB+
fn5+fn5+fn5+fn5+fg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dndHQuYzox
MTYzOjIzOiBlcnJvcjogaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHBvaW50ZXIgdHlwZXMgYXNzaWdu
aW5nIHRvICd1NjQgKCopKGRtYV9hZGRyX3QsIHVuc2lnbmVkIGludCwgdTMyKScgKGFrYSAndW5z
aWduZWQgbG9uZyBsb25nICgqKSh1bnNpZ25lZCBpbnQsIHVuc2lnbmVkIGludCwgdW5zaWduZWQg
aW50KScpIGZyb20gJ3U2NCAoZG1hX2FkZHJfdCwNCj4gICBlbnVtIGk5MTVfY2FjaGVfbGV2ZWws
IHUzMiknIChha2EgJ3Vuc2lnbmVkIGxvbmcgbG9uZyAodW5zaWduZWQgaW50LCBlbnVtIGk5MTVf
Y2FjaGVfbGV2ZWwsIHVuc2lnbmVkIGludCknKSBbLVdlcnJvciwtV2luY29tcGF0aWJsZS1mdW5j
dGlvbi1wb2ludGVyLXR5cGVzLXN0cmljdF0NCj4gICAgICAgICAgICAgICAgICAgZ2d0dC0+dm0u
cHRlX2VuY29kZSA9IHNuYl9wdGVfZW5jb2RlOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4gfn5+fn5+fn5+fn5+fn4NCj4gICA1IGVycm9ycyBnZW5lcmF0ZWQuDQo+
DQo+IEluIHRoaXMgY2FzZSwgdGhlIHByZS1nZW44IHB0ZV9lbmNvZGUgZnVuY3Rpb25zIGhhdmUg
YSBzZWNvbmQgcGFyYW1ldGVyIHR5cGUgb2YgJ2VudW0gaTkxNV9jYWNoZV9sZXZlbCcgd2hlcmVh
cyB0aGUgZnVuY3Rpb24gcG9pbnRlciBwcm90b3R5cGUgaW4gJ3N0cnVjdCBpOTE1X2FkZHJlc3Nf
c3BhY2UnIGV4cGVjdHMgYSBzZWNvbmQgcGFyYW1ldGVyIHR5cGUgb2YgJ3Vuc2lnbmVkIGludCcu
DQo+DQo+IFVwZGF0ZSB0aGUgc2Vjb25kIHBhcmFtZXRlciBvZiB0aGUgY2FsbGJhY2tzIGFuZCB0
aGUgY29tbWVudCBhYm92ZSB0aGVtIG5vdGluZyB0aGF0IHRoZXNlIHN0YXRlbWVudHMgYXJlIHN0
aWxsIHZhbGlkLCB3aGljaCBtYXRjaGVzIG90aGVyIGZ1bmN0aW9ucyBhbmQgZmlsZXMsIHRvIGNs
ZWFyIHVwIHRoZSBrQ0ZJIGZhaWx1cmVzIGF0IHJ1biB0aW1lLg0KPg0KPiBGaXhlczogOTI3NTI3
N2Q1MzI0ICgiZHJtL2k5MTU6IHVzZSBwYXRfaW5kZXggaW5zdGVhZCBvZiBjYWNoZV9sZXZlbCIp
DQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4N
Cg0KUmV2aWV3ZWQtYnk6IEZlaSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQoNCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9nZ3R0LmMgfCAyNiArKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfZ2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jDQo+IGluZGV4
IDJhNzk0MmZhYzc5OC4uMTIyMTk3NzM3ZWYyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9nZ3R0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfZ2d0dC5jDQo+IEBAIC0xMDE1LDE2ICsxMDE1LDE2IEBAIHN0YXRpYyBpbnQgZ2VuOF9n
bWNoX3Byb2JlKHN0cnVjdCBpOTE1X2dndHQgKmdndHQpDQo+DQo+ICAvKg0KPiAgICogRm9yIHBy
ZS1nZW44IHBsYXRmb3JtcyBwYXRfaW5kZXggaXMgdGhlIHNhbWUgYXMgZW51bSBpOTE1X2NhY2hl
X2xldmVsLA0KPiAtICogc28gdGhlc2UgUFRFIGVuY29kZSBmdW5jdGlvbnMgYXJlIGxlZnQgd2l0
aCB1c2luZyBjYWNoZV9sZXZlbC4NCj4gKyAqIHNvIHRoZSBzd2l0Y2gtY2FzZSBzdGF0ZW1lbnRz
IGluIHRoZXNlIFBURSBlbmNvZGUgZnVuY3Rpb25zIGFyZSBzdGlsbCB2YWxpZC4NCj4gICAqIFNl
ZSB0cmFuc2xhdGlvbiB0YWJsZSBMRUdBQ1lfQ0FDSEVMRVZFTC4NCj4gICAqLw0KPiAgc3RhdGlj
IHU2NCBzbmJfcHRlX2VuY29kZShkbWFfYWRkcl90IGFkZHIsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGVudW0gaTkxNV9jYWNoZV9sZXZlbCBsZXZlbCwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IHBhdF9pbmRleCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
dTMyIGZsYWdzKQ0KPiAgew0KPiAgICAgICBnZW42X3B0ZV90IHB0ZSA9IEdFTjZfUFRFX0FERFJf
RU5DT0RFKGFkZHIpIHwgR0VONl9QVEVfVkFMSUQ7DQo+DQo+IC0gICAgIHN3aXRjaCAobGV2ZWwp
IHsNCj4gKyAgICAgc3dpdGNoIChwYXRfaW5kZXgpIHsNCj4gICAgICAgY2FzZSBJOTE1X0NBQ0hF
X0wzX0xMQzoNCj4gICAgICAgY2FzZSBJOTE1X0NBQ0hFX0xMQzoNCj4gICAgICAgICAgICAgICBw
dGUgfD0gR0VONl9QVEVfQ0FDSEVfTExDOw0KPiBAQCAtMTAzMywxOSArMTAzMywxOSBAQCBzdGF0
aWMgdTY0IHNuYl9wdGVfZW5jb2RlKGRtYV9hZGRyX3QgYWRkciwNCj4gICAgICAgICAgICAgICBw
dGUgfD0gR0VONl9QVEVfVU5DQUNIRUQ7DQo+ICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAg
IGRlZmF1bHQ6DQo+IC0gICAgICAgICAgICAgTUlTU0lOR19DQVNFKGxldmVsKTsNCj4gKyAgICAg
ICAgICAgICBNSVNTSU5HX0NBU0UocGF0X2luZGV4KTsNCj4gICAgICAgfQ0KPg0KPiAgICAgICBy
ZXR1cm4gcHRlOw0KPiAgfQ0KPg0KPiAgc3RhdGljIHU2NCBpdmJfcHRlX2VuY29kZShkbWFfYWRk
cl90IGFkZHIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGVudW0gaTkxNV9jYWNoZV9sZXZl
bCBsZXZlbCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHBhdF9pbmRl
eCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGZsYWdzKQ0KPiAgew0KPiAgICAgICBn
ZW42X3B0ZV90IHB0ZSA9IEdFTjZfUFRFX0FERFJfRU5DT0RFKGFkZHIpIHwgR0VONl9QVEVfVkFM
SUQ7DQo+DQo+IC0gICAgIHN3aXRjaCAobGV2ZWwpIHsNCj4gKyAgICAgc3dpdGNoIChwYXRfaW5k
ZXgpIHsNCj4gICAgICAgY2FzZSBJOTE1X0NBQ0hFX0wzX0xMQzoNCj4gICAgICAgICAgICAgICBw
dGUgfD0gR0VON19QVEVfQ0FDSEVfTDNfTExDOw0KPiAgICAgICAgICAgICAgIGJyZWFrOw0KPiBA
QCAtMTA1NiwxNCArMTA1NiwxNCBAQCBzdGF0aWMgdTY0IGl2Yl9wdGVfZW5jb2RlKGRtYV9hZGRy
X3QgYWRkciwNCj4gICAgICAgICAgICAgICBwdGUgfD0gR0VONl9QVEVfVU5DQUNIRUQ7DQo+ICAg
ICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIGRlZmF1bHQ6DQo+IC0gICAgICAgICAgICAgTUlT
U0lOR19DQVNFKGxldmVsKTsNCj4gKyAgICAgICAgICAgICBNSVNTSU5HX0NBU0UocGF0X2luZGV4
KTsNCj4gICAgICAgfQ0KPg0KPiAgICAgICByZXR1cm4gcHRlOw0KPiAgfQ0KPg0KPiAgc3RhdGlj
IHU2NCBieXRfcHRlX2VuY29kZShkbWFfYWRkcl90IGFkZHIsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGVudW0gaTkxNV9jYWNoZV9sZXZlbCBsZXZlbCwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IHBhdF9pbmRleCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
dTMyIGZsYWdzKQ0KPiAgew0KPiAgICAgICBnZW42X3B0ZV90IHB0ZSA9IEdFTjZfUFRFX0FERFJf
RU5DT0RFKGFkZHIpIHwgR0VONl9QVEVfVkFMSUQ7IEBAIC0xMDcxLDMxICsxMDcxLDMxIEBAIHN0
YXRpYyB1NjQgYnl0X3B0ZV9lbmNvZGUoZG1hX2FkZHJfdCBhZGRyLA0KPiAgICAgICBpZiAoIShm
bGFncyAmIFBURV9SRUFEX09OTFkpKQ0KPiAgICAgICAgICAgICAgIHB0ZSB8PSBCWVRfUFRFX1dS
SVRFQUJMRTsNCj4NCj4gLSAgICAgaWYgKGxldmVsICE9IEk5MTVfQ0FDSEVfTk9ORSkNCj4gKyAg
ICAgaWYgKHBhdF9pbmRleCAhPSBJOTE1X0NBQ0hFX05PTkUpDQo+ICAgICAgICAgICAgICAgcHRl
IHw9IEJZVF9QVEVfU05PT1BFRF9CWV9DUFVfQ0FDSEVTOw0KPg0KPiAgICAgICByZXR1cm4gcHRl
Ow0KPiAgfQ0KPg0KPiAgc3RhdGljIHU2NCBoc3dfcHRlX2VuY29kZShkbWFfYWRkcl90IGFkZHIs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGVudW0gaTkxNV9jYWNoZV9sZXZlbCBsZXZlbCwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHBhdF9pbmRleCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgdTMyIGZsYWdzKQ0KPiAgew0KPiAgICAgICBnZW42X3B0ZV90
IHB0ZSA9IEhTV19QVEVfQUREUl9FTkNPREUoYWRkcikgfCBHRU42X1BURV9WQUxJRDsNCj4NCj4g
LSAgICAgaWYgKGxldmVsICE9IEk5MTVfQ0FDSEVfTk9ORSkNCj4gKyAgICAgaWYgKHBhdF9pbmRl
eCAhPSBJOTE1X0NBQ0hFX05PTkUpDQo+ICAgICAgICAgICAgICAgcHRlIHw9IEhTV19XQl9MTENf
QUdFMzsNCj4NCj4gICAgICAgcmV0dXJuIHB0ZTsNCj4gIH0NCj4NCj4gIHN0YXRpYyB1NjQgaXJp
c19wdGVfZW5jb2RlKGRtYV9hZGRyX3QgYWRkciwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
IGVudW0gaTkxNV9jYWNoZV9sZXZlbCBsZXZlbCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBwYXRfaW5kZXgsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIg
ZmxhZ3MpDQo+ICB7DQo+ICAgICAgIGdlbjZfcHRlX3QgcHRlID0gSFNXX1BURV9BRERSX0VOQ09E
RShhZGRyKSB8IEdFTjZfUFRFX1ZBTElEOw0KPg0KPiAtICAgICBzd2l0Y2ggKGxldmVsKSB7DQo+
ICsgICAgIHN3aXRjaCAocGF0X2luZGV4KSB7DQo+ICAgICAgIGNhc2UgSTkxNV9DQUNIRV9OT05F
Og0KPiAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICBjYXNlIEk5MTVfQ0FDSEVfV1Q6DQo+
DQo+IC0tDQo+IDIuNDAuMQ0K
