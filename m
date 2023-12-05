Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67836804DE1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71C610E3DB;
	Tue,  5 Dec 2023 09:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2331B10E235;
 Tue,  5 Dec 2023 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701768599; x=1733304599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Cqf8jXc94uxFCs5NJfA8quJEcs0g/tuBryb62OsTl+8=;
 b=exJbrK4FW5p5L5EyOvxy1k8jwubxE3fKTgYftW3DJ8EdaBgWquQfKMFQ
 hqZVvarQLSXnaDzGeRlB6ULmE+6/0C4cXzIrVTYhiqcI/Ksm9exA6IhES
 0UiEmUU0p5Gct8SpwZq2wCiyNRfrBsQaVfgLsdljac+Qacn2Vu9kzu6jM
 cj1Kh/aGLFybd20CNuCfV9k+I/NeMJOu4uihSgxtx3IS3U/kewI4LjXSL
 RLK6SmrtxEEaoCF5FZ0SvyMFEVdp0LH4HlO9XeY3QbDMJK2XVJfuRM0bZ
 YE0joFHhrlGpN0mDxARjPB2jxxS6UNqOY3eFb4bvagALAjiqvvkU/jBH7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="946977"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="946977"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102393320"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102393320"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 01:29:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 01:29:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 01:29:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 01:29:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 01:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bECRyVoI5jBsqIeWweeF6udd+WWfuO5JgKF35FVjOqmxovVnIeEWc4scgk1S2B6u8m/xhEguZ1PAjZUHtf3QOP2GfQjgvsN7oxDUN5nc9zQKT+9zO6dUPZVxuPZhXuMaK5VDnYXi5RCXARTZQQdbHtGIJAb/VwWFYHBQ3F8yUtN6lpNOZro+cu4xJHK92LThbWrb0DjrQn9AYRtSp0BL+lpJQ21BGhJV8njI76cp5K3JIaP3IgjD1nhsQcVgG+92WmaT8c9bAwXgBj4vINbnkC9Uj7LIwr8v2PotuXaToKKEqAfihw0YR8HiCd9bK42KUgciL0pBfjNWQX8VpFL+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cqf8jXc94uxFCs5NJfA8quJEcs0g/tuBryb62OsTl+8=;
 b=IuzOBAqPul2Hf9VS2ZTKN/77mucykpEcF5jLXPEeSuNSDkr7XabGhtDw8Jk09gkfBBzjZ40fyUuVstC1ht6p2fpgoQXLk0avvXvJnuxAGl37MtfHoz+wvtzIdNUVgu61JpkG0XIDTNLtBLX8xxN0Os84AiFAfqY3mjyeu7IAMYYdCQyC8pT6VKgOYuzLImCDOphfQHXULnrsFnr02/Fk/nWWoMjn3VYw+z1cHEB1CzsZKkXn1TE+s2EAVTyL9ed1huPkCg4BfypYrxXiR7zI2ZSLODBB8PjHk1+D06CmIZNq0JqNbvrFRI3A86bIdZYM6TTOqWbFHLbIdeXITI84dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 5 Dec 2023 09:29:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 09:29:54 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/display: Use i915_gem_object_get_dma_address to
 get dma address
Thread-Topic: [PATCH] drm/i915/display: Use i915_gem_object_get_dma_address to
 get dma address
Thread-Index: AQHaJrjPR9OIUDj6c0uJcQyQbYvfsbCabcKA
Date: Tue, 5 Dec 2023 09:29:54 +0000
Message-ID: <5fb655dac092232bb8b142e2dfbc00c8a84d92a7.camel@intel.com>
References: <20231204134946.16219-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231204134946.16219-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB5593:EE_
x-ms-office365-filtering-correlation-id: 929236e2-9180-4052-ae53-08dbf574bd5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k1cdSa0DOxsHHm0fftSwpaDXYkt2oRipiZYjTkRpPeL/knOTr+jqTBO6M0VetVPKUqHV4w8NcOJTj1D/kqkEYPRFLXU6inocBwlbtLXvMNl4+RqBphKqRkiKtLwP9yE1YzHCb/TIyB0Sq6HoUkbTO7uuqv0oCQGJEEV+0SXYdB2GXq9w/avYKozT72ihF/j8QktOmr1dkmDsLjkpVn5qLaikRENWYtECsvdOv4uLichDHV1/iB8PQTbm7BNptBVSOLtxFzfrPoO7fKn8ql/oKB1UgiL2qCHPttl9QiEq8STpFuuzr1j6Fn55mXmbn1oCfXEvGVrjq9XgiAc8QTxqD9K9glTiQZh7k9d4CtUm8GG0m+zZaPGo3nOO67XVldJxWxJJ2Ur0s85Luq0dZb+BmJL5saDEAHq8mfwfcLyhI6xHUM86tkULNC9fBqArInYZQFLMjMumFNsCNUm35RFs2+lKRGkNNT48HT2VEU61o6JsOuq0tXhHqfMBtcxHmGLaSIfIXaKy1Mc3Dr1ESJcIfYOGyZ5BhiZs1eFdFOdRiqxVg0EeiZo0eeHUyjfXh7NFyM5ST0bOV++tDKcJlZ21e3hUW++kJcshJZq+adEMQIIQzDMf8vh5zN1Ws2nSido+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(110136005)(316002)(91956017)(66446008)(66556008)(64756008)(66476007)(76116006)(38070700009)(86362001)(66946007)(8676002)(41300700001)(36756003)(4326008)(8936002)(5660300002)(38100700002)(122000001)(82960400001)(6486002)(83380400001)(478600001)(26005)(71200400001)(2616005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3N5Q2FVWjNLYlFlc3piWWQ4M1RNSHUrN0hId2dmZ0I3UG5BSkxKb1IzeFgx?=
 =?utf-8?B?V2RDWGxPMnp0dTI2WmdMN1NUUUNZZ0NnZUthNy9RcWdCdUVPYmk0aENoVHRq?=
 =?utf-8?B?bVlSMlgydEp0KzViaU9Zemgwd2M2ZytibVlHaFJmQWVIeXVmWW5VY28vUW5J?=
 =?utf-8?B?TUthZXZhbTVXWXJ6U2FtWGRnRFljb0RIeVdZc3RVRitxeFZnUWJzV2hFMWhL?=
 =?utf-8?B?RWZnNHJSMEwvMzlzckhlTmpIU00zVTBlNG9iK0JFUEZBbWJsNGZINE9DRy9T?=
 =?utf-8?B?Zm5ESzZUalNpN280cldDbGdDbHlJdGYrNGNCTUtsejBzTkg2b1hCaW5PeXIx?=
 =?utf-8?B?NSs0SDVEUW15SkYwUVJWczBCdHNudW9TSWhZZm1vZ2JjRjk5WWdoZUwybnJF?=
 =?utf-8?B?bDdaeWRYQkc2TWdSYUVhUDhDQ2tEMVUramI4SUpPTVhnc2J2aWswUFg5Qlpy?=
 =?utf-8?B?bHNOUE1odlVmTTN2ZE55Z0R0NUZPdGJzd1NWWngyMkpiZWNiWkV3enFDalgz?=
 =?utf-8?B?ME1mUFkyc3l6S1VQbmRzZkFqcVpjVG1FWVVWL3Y1bVVkU2Vva1FCMVhoSHMx?=
 =?utf-8?B?a1NwNW4rdmtMK3VHWGhoUXZwZmRmMlVzeWhVYnZNVGIzZnpHcnZrSlI1Nkla?=
 =?utf-8?B?RzI5Y1lmVzh4Sm1xVEhDdmtIWUd3bGNSMnpYcmRySTRFMXBHRUdXMEZsNmNq?=
 =?utf-8?B?K3lXUUZDVU1xWmg2SWh5elRJdEpQbExwV1V0V2MySk5PbWxQRnNDdnh3WUxB?=
 =?utf-8?B?UGJPcHdsMzQyRXMzSkwvbG9hVmkyTXpxTVpMb0ZiamZjNFR1TzQ2RUVmZUJN?=
 =?utf-8?B?WkJHbGwybmNGVU05SGRZWkQ4emp0S3g3c1JjTnoxSTlNRkluRU8zamVrVm5j?=
 =?utf-8?B?aVV5UjIxSkVRYkxlcjZGZmM0emlaL1BkVWx1YTBuck9nejdRQWRlMmtPclJk?=
 =?utf-8?B?VjdFbWdSQnpiaFVOQk1EZUxSVEZHYW05d1p1YjNId0ZVSmZhcmlRMDE2eVYx?=
 =?utf-8?B?dklKRzRIWmtIYktFRlVGSzRlNWs3NWplMHFsUWtVSXlpZDRoNTdHLythZjVN?=
 =?utf-8?B?clVqQWxTSUVmS3Y5bkw2cEpZSkhTVFg3RlBiK3gvekx4VjM5VFRDTVFqb3l4?=
 =?utf-8?B?U0tIaTAzSm16NnhYM0tiUW5CMnltSjY4NzhSbG52SnBLWUhPMnlGRnQrM21C?=
 =?utf-8?B?YU80OGNZMUY2dHJZZnJrUE5MTU1sNXVTYWx0cVpsbzJFaEN1azdXNjAvWjhU?=
 =?utf-8?B?WklJRWFPcUlSUEdGakQvK0JyZFUvRXBxVExKdzVhMGswTVE2OWxmbjg5bU9j?=
 =?utf-8?B?TkNEdEMvTGFDVXlNb2RSamQvdGlrTTFYbmQ2L05teHFWRmx5UjQvM1hNV0hI?=
 =?utf-8?B?Q1FVNmdUTzBsb1psK004cFdJQzdXRXRtTU5CUnVqZ3dwMS9Kd3A4T3FPeUc1?=
 =?utf-8?B?eUg0ZkpkUVVnaGwxUFBMOEhpMXkrbWJseE9lZmhmOWdRTDFEVkFQYVNQdkE5?=
 =?utf-8?B?WWVRaENiM3FOWlVhSnlSendNbkR1TmlYTkRWbkNLQVlYMWVKS3E3QkwzU1ZD?=
 =?utf-8?B?aXNCUEh0ZHF0WUFwVm5ZZU56NTNxMlBFZHh0SmNpbSt3ZEw1K1dtT0FreUMy?=
 =?utf-8?B?WmduOE1pa0tBSWtsMG1pUTdxTUJ0ZjVISEp2cDA4TnRLYW9jYWFhZzFlQm5U?=
 =?utf-8?B?T3I2MUZGZEFTb3NYZFVRclZIc3lGUlZ1THJIWU9rNjhwbnZSRmtGY1BwaHBy?=
 =?utf-8?B?ZkxrSmREMUN4NlF0TWR1WHBRUUUydUZjYkRDeXE3SHdkdUN5ODEvN1BpWGw4?=
 =?utf-8?B?ZmcwUVJPbWFtem0zaFhubmdYTzliY1lOenhuOEpTZTNvbnpjeFp3L2dvdmsz?=
 =?utf-8?B?cTNHSGxIanVVVGE0VVA5SUtha01YSGZXZVFJWUsvZ1dGa3ptT0NZUFZLd0w3?=
 =?utf-8?B?ZTlxT0pYMmgzU21jYUVpQ0lUSWV5TXhTZ282QUxHcEwyRllyZWRuZlNNMXZr?=
 =?utf-8?B?cE5ySzg5S3c4djRoL2JDVHZyZGNsdkVQdXcvZWF2ZDF2OEFpb3JEMkFieDVF?=
 =?utf-8?B?SXA2Vzh6REJ0VWhwM1ZOLzBVOHp1UEJVWTEzZnYwYXhrMVZiUUlIMGRLSFU5?=
 =?utf-8?B?QjNOZ2hqb1lnZmk1OC9jWFdvYnlnM0Q4cHl5QzBJMmRYQzZEUlhUZE9ZOGkz?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31097B87D06D134DA84B0D68C27F7780@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929236e2-9180-4052-ae53-08dbf574bd5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 09:29:54.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +A8xX8Y2zupOVJOH2GnlHkCglKCQowD5upBQKSK+/8QAi4rQNa7Okw//O0lu40NHjlbp5vBmb5uQZeW3jJzEkh6sI0vkOfIJuuyp/FBwMwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEyLTA0IGF0IDE0OjQ5ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gV29ya3MgYmV0dGVyIGZvciB4ZSBsaWtlIHRoYXQuIG9iaiBpcyBubyBsb25nZXIgY29u
c3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYyB8IDYgKysrKy0tDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYw0KPiBpbmRleCBhNTE1YWUyODMxZjguLjky
NmUyZGUwMGViNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jdXJzb3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2N1cnNvci5jDQo+IEBAIC0yNCw2ICsyNCw4IEBADQo+IMKgI2luY2x1ZGUgImludGVsX3Bzcl9y
ZWdzLmgiDQo+IMKgI2luY2x1ZGUgInNrbF93YXRlcm1hcmsuaCINCj4gwqANCj4gKyNpbmNsdWRl
ICJnZW0vaTkxNV9nZW1fb2JqZWN0LmgiDQo+ICsNCj4gwqAvKiBDdXJzb3IgZm9ybWF0cyAqLw0K
PiDCoHN0YXRpYyBjb25zdCB1MzIgaW50ZWxfY3Vyc29yX2Zvcm1hdHNbXSA9IHsNCj4gwqDCoMKg
wqDCoMKgwqDCoERSTV9GT1JNQVRfQVJHQjg4ODgsDQo+IEBAIC0zNCwxMSArMzYsMTEgQEAgc3Rh
dGljIHUzMiBpbnRlbF9jdXJzb3JfYmFzZShjb25zdCBzdHJ1Y3QNCj4gaW50ZWxfcGxhbmVfc3Rh
dGUgKnBsYW5lX3N0YXRlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmRldl9wcml2ID0NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0b19pOTE1
KHBsYW5lX3N0YXRlLT51YXBpLnBsYW5lLT5kZXYpOw0KPiDCoMKgwqDCoMKgwqDCoMKgY29uc3Qg
c3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0ZS0+aHcuZmI7DQo+IC3CoMKg
wqDCoMKgwqDCoGNvbnN0IHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBpbnRlbF9m
Yl9vYmooZmIpOw0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAq
b2JqID0gaW50ZWxfZmJfb2JqKGZiKTsNCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBiYXNlOw0KPiDC
oA0KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKERJU1BMQVlfSU5GTyhkZXZfcHJpdiktPmN1cnNvcl9u
ZWVkc19waHlzaWNhbCkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJhc2UgPSBz
Z19kbWFfYWRkcmVzcyhvYmotPm1tLnBhZ2VzLT5zZ2wpOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYmFzZSA9IGk5MTVfZ2VtX29iamVjdF9nZXRfZG1hX2FkZHJlc3Mob2JqLCAw
KTsNCj4gwqDCoMKgwqDCoMKgwqDCoGVsc2UNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBiYXNlID0gaW50ZWxfcGxhbmVfZ2d0dF9vZmZzZXQocGxhbmVfc3RhdGUpOw0KPiDCoA0K
DQo=
