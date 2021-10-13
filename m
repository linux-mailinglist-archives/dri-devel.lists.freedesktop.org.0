Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E942C8D5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 20:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4D66EA91;
	Wed, 13 Oct 2021 18:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171E6EA91;
 Wed, 13 Oct 2021 18:37:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214446299"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214446299"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 11:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="442394192"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 13 Oct 2021 11:37:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 11:37:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 11:37:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 11:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUvwZlrj/0Doil0aeR+PnHSAAJBzDnmb0T0trTOdA3L48b7T1v5saIJZKqdvcCDePEutoCLZmZLRS67yGo708w9qJbtB7FywZo07wfUzhv9+MF2e5WqdrRcE2MfoaBWGm3Ym64BWpH8sFQBeLAQt7VJQUXUFzUuCfPRtbkobBlAgTNJmAa7EVEmI4z9GkeQ9gOZLS9mUmXwxAoQ22kW7w+Cclc032k08ts1BTlOrISzLEwuZE8tLONR2Fotdql6Zf/gjQxzy6kOSMM5LU5HxtU1EDfVyhGPZXTfgVntPiS3pDppNu+4dp9EogVJNz5UfDQTAvTxQdv/tLx6nQBpZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TVpxX0G8qeT1gysKohARxcETh5plW2A5zNnIGq0cLE=;
 b=FY1rt0nHbmjdy0qEBpsL9ey7Eudd0apJcjvLGPP/HnpsJrZwi6J7rTEzRHBq6cnGuoJlmDPmsase7OEKuMekuLCszvHLNDYCIqOJOIr9PAhFc9DITtUlsPnkVaypy0KHmra6diphQbpK/Q+TvrL7os94UIHaUVfwyho13RSAqyVrEFo7b+iu9Q4mfPYM8Q5INlGfkEzAxRTDnv7+HIrwjOD3KkADsDyiH9gLZQB6Y4NyGWVH4EDHiTkzPk/r31HAlM3H5USDAtX0L+tX8Vvj8dh7i9DJ0b8JW/s9gRVlyFs4AVgEPwHMwodz3sN1psPvRuNoA8Suypo7uSXr75RN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TVpxX0G8qeT1gysKohARxcETh5plW2A5zNnIGq0cLE=;
 b=KLZ0xmbQ1KiC+Nc/cYyca7DWDghKqYTE7S8p5aQOEGVopQ8kZT6yfaAQoEVO4XeHlb0FldsG+GceRR20Wnj66ULD05jqoVlOX4k8+mv8YMd/9vxzy2568b04gblZGhuoLXN00vkHimyVwT6P6ipyvv0eowfnlseHp+k39LLrLoE=
Received: from MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 by BL0PR11MB3202.namprd11.prod.outlook.com (2603:10b6:208:65::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 18:37:38 +0000
Received: from MN2PR11MB4661.namprd11.prod.outlook.com
 ([fe80::49d6:ef3:b83:2379]) by MN2PR11MB4661.namprd11.prod.outlook.com
 ([fe80::49d6:ef3:b83:2379%4]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 18:37:38 +0000
From: "Yokoyama, Caz" <caz.yokoyama@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uapi: Add comment clarifying purpose
 of I915_TILING_* values
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/uapi: Add comment clarifying
 purpose of I915_TILING_* values
Thread-Index: AQHXv7Zg1Q22J7VO0kGNHM8tTNPLrqvRQ1iA
Date: Wed, 13 Oct 2021 18:37:38 +0000
Message-ID: <1121afd36af8be701e0c3a5e8c1329f979d35fdc.camel@intel.com>
References: <20211012221245.2609670-1-matthew.d.roper@intel.com>
In-Reply-To: <20211012221245.2609670-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 791eb128-bc91-43da-612e-08d98e788850
x-ms-traffictypediagnostic: BL0PR11MB3202:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB3202EAB02764184A7729650C9FB79@BL0PR11MB3202.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPzBY0KYms+PgvOrOb4m2tJZMCvC9LmeYm6j+8k1UZ+HO5aJxDYTTIWQ8KOXrFMEW7qQL9HnHrdC+9XkTqGgurJwwThQQ9tPeJlaUDnbZNCggUSBAg161xc/aX+dxP1NgzDizIDiVp0NQBoihlYCWWx5GvvRJjKd0ybdlEHpiGX4iuFqzJAkHVqRCpFI1L0ZbmaG2Sepcm6p+yTcjeMZf2DyCwFwty3LkgqLt8G9oE4UsMOtZm6AUozBUw1lqdUnleV/Lm/GDGjVO0bMCx8F5E2OLLdGKlwUrFILzgRTJKhAWvd0z6lH/0S1LsW5dlwJDndf6iLlMKsO0KcdSj97VH65XBF0VkKPt1PoxWodKPd4C/IdQKPVwNpjqHdGKq3rjjDH2dwLSiHjfLOiRpzATNUIbkpzVJQvTCZyixMhsTIEnharMNi7MvcM0eufVHmSVEiF/5CcN9foGCAqlO8TyLO8izC7zcii7P6D9dla5UjvcwRRyzjwtaVGdHxoI4ru2TTcjzQ4oFpG9s7RRnKrGR6R7LXK8kDhC1HXMna+NGrgcBM4FRN9XZ+cfw8TWdqONTwob77XJhj9TCXQHzIjNdQrtpTt9oQsHD915N9fr0he8lFDGt57sFtWSRJ/gCZq4PxyIWIXJD3jrtVaNozF8WV1llTGgqhmR3RAwmr6vwmZ8Ow8or14fpLz8yfGY0ucjafoeDgFqh8lC5zndwEDRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(36756003)(6486002)(6506007)(91956017)(6512007)(122000001)(71200400001)(38100700002)(66476007)(64756008)(76116006)(66446008)(966005)(66556008)(4326008)(2616005)(4001150100001)(5660300002)(2906002)(8936002)(82960400001)(316002)(38070700005)(26005)(8676002)(110136005)(508600001)(54906003)(86362001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MURjQVlNVmVyR1ZCMy9zZDZ2L1haVmZTN1ZDY3ozcXdHT0h1aUNOT0dEN1JU?=
 =?utf-8?B?SkQzY3NMNVA0UTNyWmlDYUhyRHptc1ZQYjJhZlowaXNLaWFrelB4RWhSOW1X?=
 =?utf-8?B?YWYrWFNQTE94bUJoZDhHcC9qRkZudmROZzU3cXZHMFArbnk3bFF5d3ltbkYr?=
 =?utf-8?B?My9QbGhYMGZCWWlPWFUxeGpRenBhaVJrMlhGNUJVcmVKbUw0MllkY3haSGdm?=
 =?utf-8?B?eWxSSElwZytlMlZFMjlIYjZDREJGUjJmSXI5QmowT1BrWUR2YmQxbFRBQnNW?=
 =?utf-8?B?dVNrK01lbFFvZjdUbTNHQzdvR3RXdndtRGFreFRMc0JPRU9sRVI0UUtjbE9a?=
 =?utf-8?B?b2twdmVuMEJBbWE0UW1TcVRkUVMyL01NbE11TnZFRXg2RHhEdXViYTFpbWY4?=
 =?utf-8?B?WWN6VTg5QjVBSzZRSkZ0dmFvaGZUWTRtTXdHaVM5S1VHRnp6alYybVdyV3V0?=
 =?utf-8?B?d2pUTkxBMTdrMjBSc2IyQUxvVkdqdk45bVArRUplMTIxZ25rV1NCc00vekYx?=
 =?utf-8?B?OUQ3c01KQ2syQ0wzWjFhNkhVd2o3eWhTbDVCT2t0eEdKeUN0a25RczM0V3FT?=
 =?utf-8?B?dGZheXFhMnpYUW5XK2dSZEY4TnRUZVR6OWJsZ2FTMHduZi9sL0xNdmFFSmt2?=
 =?utf-8?B?SDJlQjEySzZPVGh4V3JVcHR0MUJmN3RNRXd3bFlseTVHN21jSTJ5dThiZ3p1?=
 =?utf-8?B?UVBEOGdnVnozRmJkUHE3WlBjWnFhU25ZU0dTWGhJK0ZCamQwTFVFYVU2YlVR?=
 =?utf-8?B?S1IrQXEyMlJjUGI0c3ZGb0lMeWNzRy9vSFJBZ1E0aEh5QVBiSG1JTHVYdUVF?=
 =?utf-8?B?Z0UrWGFDVlBjL1crRmhOSlMyTWFGdHByMVNvdWUyOE5udWtCNmZsYWZiNDlI?=
 =?utf-8?B?d3E4Uk9Wa09vaDhNaHFsVHRoOHRaTEVoZDVhMXFNUFozWUtYQyszVFc0U01x?=
 =?utf-8?B?ZFZaaE5TVk42M1N6d0taWkdZUDNqTktzTnJoM0pOUkdyNnZFZUdmQ0pDejFX?=
 =?utf-8?B?NW1zSUd0UlFmUXJjdmFlTXB4UTBLcHNETFJuQWpjVWY5OWtxRHBYa1ZOdU00?=
 =?utf-8?B?VG1oSElYK1QxQnBaU05aWUFmMk1yUVJQVFQ3Z2pJV2dCMDlGK2hnSjZBRUEy?=
 =?utf-8?B?OHU2dGh6eitpOEhWYmhmeWhjd1d4YXhPZTl1QWhtY21td2VDeHNJSFYycWZZ?=
 =?utf-8?B?L3pCVU9JbU0xSlhKMzRiVWxLWHJMaWFkdEF0SUE0aXFrRUszdTRMYWxQZU1l?=
 =?utf-8?B?aUFtUllTWU53QStmZ1ljM0ZoYUVYV3psWGROVVQ3ZHFHRllHcGNVbWsrc1V6?=
 =?utf-8?B?QVV3L04yeGRMMU1INnI2dUxTbE9neWU3cExnN1ZKYnJsOWJ4VUNrOTlyeFo2?=
 =?utf-8?B?TnZrNWhLUU5UNTgwZTFkdTU3UGxXZ2lLU1padWYyZFRveGtydFViZG05RzJw?=
 =?utf-8?B?VU16eHZWQ0VFR2ptWDRaK3JYUXlKbU94T0JUUTNGdXpER0NEUUZqNUFVVDhs?=
 =?utf-8?B?eUJVdmNYcjhoZTBlNkR3bkJ3T0FaRlpXcVNpNlBwLzFXR09mNElVUlZqaC9k?=
 =?utf-8?B?RWgyVVJua09YNTZQOFFkeUt2MUl4aEhmNWZ1elZGd0l3ckpJSHFDenRhb2ln?=
 =?utf-8?B?UWFXNGxyVWVVMlFpQmYvdHRMZkNBMkNoazhiaWhlYUZIeU5WNHpSM3ljaEZj?=
 =?utf-8?B?b21DU1RUYTB3bEdNRmJ5NnRPMlFCbTJDV013NmxnaUc2blJ5Y2p4eTN6ck8y?=
 =?utf-8?B?NnBCbmE2SkpuVWRiYklxUHNMbkM4V1pVNFUwV01IVlJ4cW1pam96T3FEYzE1?=
 =?utf-8?B?ZVR2eFZkNGs5b0ZtSEY3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51F3E6AA936E9148BF07EBB7188D3991@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791eb128-bc91-43da-612e-08d98e788850
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 18:37:38.2888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/1AVENsn2u/FlCFv1xkfAz62agIELHvnzRKG1n5W7FkIdPxIx1lJxaKa/UOr/vL8TlPCESoL5XW8L7ZzClTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3202
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBDYXogWW9rb3lhbWEgPGNhei55b2tveWFt
YUBpbnRlbC5jb20+DQotY2F6DQoNCk9uIFR1ZSwgMjAyMS0xMC0xMiBhdCAxNToxMiAtMDcwMCwg
TWF0dCBSb3BlciB3cm90ZToNCj4gVGhlIEk5MTVfVElMSU5HXyogdmFsdWVzIGluIG91ciB1YXBp
IGhlYWRlciBhcmUgaW50ZW5kZWQgc29sZWx5IGZvcg0KPiB1c2UNCj4gd2l0aCB0aGUgb2xkIGdl
dF90aWxpbmcvc2V0X3RpbGluZyBpb2N0bHMgdGhhdCBvcGVyYXRlIG9uIGhhcmR3YXJlDQo+IGRl
LXRpbGluZyBmZW5jZXM7IGFsbCBvdGhlciB1YXBpIGNvbW11bmljYXRpb24gYWJvdXQgdGlsaW5n
IHR5cGVzIGlzDQo+IGRvbmUgdmlhIGZyYW1lYnVmZmVyIG1vZGlmaWVycyByYXRoZXIgdGhhbiB3
aXRoIHRoZXNlIG9sZCB2YWx1ZXMuDQo+IA0KPiBPbiBuZXdlciBJbnRlbCBwbGF0Zm9ybXMgZGV0
aWxpbmcgZmVuY2VzIG5vIGxvbmdlciBleGlzdCBzbyB0aGUgb2xkDQo+IGdldF90aWxpbmcvc2V0
X3RpbGluZyBpb2N0bHMgYXJlIG5vIGxvbmdlciB1c2FibGUgYW5kIHdpbGwgYWx3YXlzDQo+IHJl
dHVybg0KPiAtRU9QTk9UU1VQUC4gIFRoaXMgbWVhbnMgdGhlcmUncyBubyByZWFzb24gdG8gYWRk
IG5ldyB0aWxpbmcgdHlwZXMNCj4gKHN1Y2gNCj4gYXMgdGhlIFRpbGU0IGZvcm1hdCBpbnRyb2R1
Y2VkIGJ5IFhlX0hQKSB0byB0aGUgdWFwaSBoZWFkZXINCj4gaGVyZS4gIEFueQ0KPiBrZXJuZWwt
aW50ZXJuYWwgY29kZSB0aGF0IG5lZWRzIHRvIHJlcHJlc2VudCB0aWxpbmcgZm9ybWF0IHNob3Vs
ZA0KPiBlaXRoZXINCj4gcmVseSBvbiBmcmFtZWJ1ZmZlciBtb2RpZmllcnMgKGFzIHRoZSBkaXNw
bGF5IGNvZGUgZG9lcykgb3IgdXNlIHNvbWUNCj4ga2luZCBvZiBub24tdWFwaSBlbnVtIChhcyB0
aGUgR0VNIGJsdCBzZWxmdGVzdCBub3cgZG9lcykuDQo+IA0KPiBSZWZlcmVuY2VzOiANCj4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQ1NjY1Ni8/c2VyaWVzPTk1MzA4
DQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCB8IDYgKysrKysrDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2RybS9pOTE1X2RybS5oDQo+IGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+IGlu
ZGV4IGFhMmE3ZWNjZmI5NC4uOWI4ZTYxMTYzYzM5IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvZHJtL2k5MTVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+
IEBAIC0xNTIyLDYgKzE1MjIsMTIgQEAgc3RydWN0IGRybV9pOTE1X2dlbV9jYWNoaW5nIHsNCj4g
ICNkZWZpbmUgSTkxNV9USUxJTkdfTk9ORQkwDQo+ICAjZGVmaW5lIEk5MTVfVElMSU5HX1gJCTEN
Cj4gICNkZWZpbmUgSTkxNV9USUxJTkdfWQkJMg0KPiArLyoNCj4gKyAqIERvIG5vdCBhZGQgbmV3
IHRpbGluZyB0eXBlcyBoZXJlLiAgVGhlIEk5MTVfVElMSU5HXyogdmFsdWVzIGFyZQ0KPiBmb3IN
Cj4gKyAqIGRlLXRpbGluZyBmZW5jZSByZWdpc3RlcnMgdGhhdCBubyBsb25nZXIgZXhpc3Qgb24g
bW9kZXJuDQo+IHBsYXRmb3Jtcy4gIEFsdGhvdWdoDQo+ICsgKiB0aGUgaGFyZHdhcmUgbWF5IHN1
cHBvcnQgbmV3IHR5cGVzIG9mIHRpbGluZyBpbiBnZW5lcmFsIChlLmcuLA0KPiBUaWxlNCksIHdl
DQo+ICsgKiBkbyBub3QgbmVlZCB0byBhZGQgdGhlbSB0byB0aGUgdWFwaSB0aGF0IGlzIHNwZWNp
ZmljIHRvIG5vdy0NCj4gZGVmdW5jdCBpb2N0bHMuDQo+ICsgKi8NCj4gICNkZWZpbmUgSTkxNV9U
SUxJTkdfTEFTVAlJOTE1X1RJTElOR19ZDQo+ICANCj4gICNkZWZpbmUgSTkxNV9CSVRfNl9TV0la
WkxFX05PTkUJCTANCg==
