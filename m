Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B47F58814C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 19:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CA193808;
	Tue,  2 Aug 2022 17:46:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40BE937FE;
 Tue,  2 Aug 2022 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659462374; x=1690998374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s5+oCZ/MXsb9ufKsRxM+efcEN00Uz6AeGo0kQrOPR9c=;
 b=PG4KydIhN8z2LM3Sds8qa9yQFWXqQYCIPMYzNcTYx9es6Ed7tcvRPKm6
 BOwUsry4JiTW6Yv2OKISNbBslLMdSQik4bnb5U6CHfQiYQX6ZRIvn1c4L
 A0vc0Dj5ijddYqNp1/k1vQQMxiE8pM5w4YL0y9E4RHzRtSD4PDWHfMIj0
 KjyLyha2hfZO0opF9vJ/WrNDZfR32+oH4oVgll4+wxIKJ/VsCuOwmjzHw
 qGwI+QGCWf+OzSVjcp6W9xdWSVJUR3nx/J2Zv4LxIp9fRdGwlCYAkuZFO
 AjBjQjchRv8yr0J/IA4cCa/DZO6cGBKsp1zM5ydmzMOI9gl6fAQIm7N/f Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="290252688"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="290252688"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 10:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="728916243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2022 10:46:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 10:46:12 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 10:46:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 10:46:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 10:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cqa3bPRJ/sW+ovT29ZoQ9PEJTBFCZezs6DOvzqJdNrwCVvDyAtUq9fOvpGBmPAghXgibcDdzSaWYsWPzNuR0oTZsI/wl7JP12Fk2Ztm3DnDRtpIaCBFWi1RCE+X3ymdNl3YNLSjAmo1QyV3HrNW4+/GWROVKjmpPtQkA9B6SbdOrBS2vzAhT0AS9HXJItm5jKooF9wq3OqU2t+eoEDyGJXVrmb4ynRkNP5bFgEg93sAEE0OtiqRpKRIQbsrU5vjc7zVM/ahOirwLY4eubGzKJg23rGKqQy0P5emlHupPwni46Q7bTEW2TI7N/qXMlYko/mm5ysj5mxOs/MEZPXxWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5+oCZ/MXsb9ufKsRxM+efcEN00Uz6AeGo0kQrOPR9c=;
 b=HTFdTSXv5E3GMm2eB/iarDaDGy6+RI+8uvrtBHU0hl6GA0vdtNSGJd1U9CxyShJxrcOzlbfkXEpCrV6kiIxvxmYUTota1qXI6JJbJiSP0JpOh4wXCIpP1I0Sy0n0IDuWB74OWEd4dZr+vZXPFrr97IRfU8WgKMcWHqm3qc2xG5/TFoLa36Yevljl4MSIuKdMDk+F1e3FDAGFT1VumVRMUr1ou8f/9VCWUXHAKWtGrJkP6QEaivj/+BRT/61x7Qq5uKdssJSHtm+reLLdGe9TdJRzlyPoM3BM5iJ++qSXb4rbS+1OmnV/IU2ZP+pawac/cGNIOi04VqgSdlT4Bmnk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM6PR11MB3562.namprd11.prod.outlook.com (2603:10b6:5:13f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12; Tue, 2 Aug 2022 17:46:09 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 17:46:09 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915/guc: Fix capture size warning
 and bump the size
Thread-Topic: [Intel-gfx] [PATCH 2/7] drm/i915/guc: Fix capture size warning
 and bump the size
Thread-Index: AQHYoikhk63sW/aTXEyFrIF2gkbWk62b63oA
Date: Tue, 2 Aug 2022 17:46:09 +0000
Message-ID: <b3c7738db6403d951527d9a065ef2ba8c1d4c9f3.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-3-John.C.Harrison@Intel.com>
In-Reply-To: <20220728022028.2190627-3-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41004b88-3193-4bb2-3f70-08da74aee211
x-ms-traffictypediagnostic: DM6PR11MB3562:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jvDmlxgPB8jBwrZWPLIPciBr5XjUgpEQ+dTi0AtbfB0JP/xlSS/lQpQ+hxGGoISLsHvvzKxkp7j+13KTUpuei89o+jXuMZ6EdtZy3A19nNZpZMzHbtPENd0mo3DeIOffEiFnGcUQqGgIbg0lRvZYtLKKksVvHcBEvzbUCIarUQlqMgr147nJtE/GWXSeVSZDXcegR/nebTsyqazmU4P1Y429WCpoqv4oPrVnKPnRF6aJCv/HWwu4qYkdSQx87IMlTIQzVoZ0ALJ+HaHuA/G8zvaXO7wiXfk6uQ00zEfWaH6261IE6D9MARwyTJwAl7hmswQjq3pEz3kpd5gSeCGv4/UV2Kd65q8HwnsHjr00rQf7KtZ1ndhvwSE8Bu1gNcARtywpNtK2XqU0I+GN3co7Lti4eDye/7W+vbx1pBkdVJyk5L4ffcVA18Ww4U6fYWzKNQeFQCTcPtQgLbcGGN8eCJOLSXy7RIZRmDyWFrevjuoAdUk6ysYacQpvZ7+LvI7HzkrabtKI0248lgEzwngywDT8bVzWwzELYMKPN6mesU4VwnCUxuhHoCiCLnLPLqj42rA4B5EwNAxyHWjjEeOzRN5XXQ8LFHgn+ObKanLgq9/z5AhWRQ6M2KEInUOJTTqxdBW89i/cbq8E+CMYgr+Kf50hBVRChbSf8nLUBqscjzrODkAUNSej362RcJZvbw1Ju6dhQnw5TI5Tpi886O5aNChrI2ZpIujrtNWfHe0O5RjhfIQYFBSjgFkyW6hKtRpO4XCpecvtX38G9MUVbh39bR6GMe5nh0V18tgFDLMzAM8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(366004)(346002)(376002)(36756003)(186003)(2616005)(66446008)(26005)(6512007)(6506007)(41300700001)(2906002)(478600001)(122000001)(83380400001)(38100700002)(8676002)(86362001)(5660300002)(71200400001)(316002)(6486002)(64756008)(110136005)(38070700005)(66556008)(4326008)(66476007)(8936002)(91956017)(66946007)(450100002)(76116006)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzVIbFc1bHMvV2h4NUxsQVp6MEpVQlp0OTRITFVhODQya000U1k1WnBpNmV6?=
 =?utf-8?B?R2Y0aVRoZ2d1K3VSZ2l4dlIrNHQ3YTFkemlLTkJ2SWZoMFE4c1I0N21kdW5y?=
 =?utf-8?B?VUlYY2RURnZYYjNzb0xSekJIaUNoVUVGUVhuQkZYQlN1VVFFeW9jNmN3dWN4?=
 =?utf-8?B?M2lnNWNscDd5cWN2SUttZUIxdjhvUnRRdnlsRkhCazVqeEl4WE9DR3o0NkVa?=
 =?utf-8?B?QVZnNHA1TkQxb01la1ZiaU5yUlp1U2UxY0t5UnFkeXJUaGs0WCs4NWtVbE4w?=
 =?utf-8?B?R0xIUEgvaWI5M2NtOE9HWDd4ODhKR1VHWWpCUDlEUnlOY0FvR2xUN2V6NE1W?=
 =?utf-8?B?QjVCWnk5SG5SQTR5S0RGcU1Lb3FVQURiZy9YK2IwTTNQMDV1RExoR3NVQ1Y0?=
 =?utf-8?B?aTJOb2U4QlZ2eG1RTU9HSGEySG9wN3VaU0tmY1lGNFhzL3llUlBMdkxZQ2xp?=
 =?utf-8?B?S1JHNWwyNlB2Y3BQK1pzZ1RpQmYxNXlFeERPaWphTE5NYmlCVFBlaVE4SzU5?=
 =?utf-8?B?ZFdFS0xRUU9xMDBnazJmTHZiZWFGS3FRQ2FkRWwzcDR4YU9OOVN3bXRBbnJV?=
 =?utf-8?B?S3lDV3NoUFF1czQvWXB2MnBacERGVnhsbFRVWTI4QklBSzgreU5oL2RyZjB2?=
 =?utf-8?B?alN1Sm4rNEJVdk9aa2VZWmY2UkJXa29LazFNcVJCbGp6QUNMOGJwL1RhVnhE?=
 =?utf-8?B?cFZaa1VtZnhKWktENmVEbG1MTnhGOGdueHk2L3BrRzRpb2t5WFR0M1lQTjdi?=
 =?utf-8?B?aDlQSEUycTVFM2Y4RkRIMVM3czQwOXEzSkRKSHFuQXljd2wzOUlaUjlRMll1?=
 =?utf-8?B?SFZyVmJ4Q0hDSDlSZFA3K1FlME14ajlhRk1oM2Jhb0daSFNMOHYvQkxoRXdS?=
 =?utf-8?B?bUtFUFRXWHgzT2dPWkd5YytNemxSM0dIakhXN1ZPTzAxc2NoQnR4RWFhbFVJ?=
 =?utf-8?B?L1pEZFlTY3Q3Ri9hYmZrS2VjQm5MTjJJYWdzQ2lzT21nQkUyRDFKeTdOVGtr?=
 =?utf-8?B?TlM1QjBmM0tIZDl0RW5raHBUcE5MdzJDNHZ5NDU5TXgrS2ZsN3FoZG1IQ2Vs?=
 =?utf-8?B?S3JZZUkrS0VHeUowWWRiZmFNQk40aEdUb1hlSVlRODhNemtXemQxNitRRDN2?=
 =?utf-8?B?M25ZZm5KZUxESE1xbGJHSGwvV25RM3lQazRIWEl2UWY1SGdJOEN6UWU3bWRN?=
 =?utf-8?B?TWFnTHhMUnM3Z0tRSkVnUk5TZmxSUjZxemh5RFVYZHRTNGtlRlgwck1HWEIx?=
 =?utf-8?B?R2paZGhSOW8rVHp5NXRuNTJBQzROeDJhV0h4K3lNTi9wN01EK200dFFFVjBE?=
 =?utf-8?B?dEF5TGUzQUxybTA5T2pRWEpsUC9IUU83T2UvdUU1Ymx4LzZEVnMxdHh4dWx3?=
 =?utf-8?B?Z1lydnNleTdrT0tXWlF1QnNucGU4TXk4YysvYVJTbVZLQ3RnK1dZWHBtMmZ2?=
 =?utf-8?B?TzVNUmhERXgvalBqQTZyREZjTmlsck5oa3dkMWVrS1cxMm9UeXEvNDNNVEJ1?=
 =?utf-8?B?Mng5RzhrSC9JWlh2M2lpalJsa0R4QWYrc0FaZ0dyb2J2QTI5SWM5UW1JVGlw?=
 =?utf-8?B?QktoLytvR3VIYU5ZTlRxaU1VWkM4dHN6dEI5QkZrYzg5NXQ3OGFHcTdGajVE?=
 =?utf-8?B?TkJkNXJNT1BXS0xHTWsvdDRaaG1JakZUZHZaWUFpeHJLQXpUTVJkZ1F0TkYw?=
 =?utf-8?B?VTNBTFkraitMM0tnMWFTQzdKaDkyQ2RjS2ZYMVZCNUtvQkhnWDRuT0JBVTMy?=
 =?utf-8?B?OWxpMUtDQitBS2lab2pjUnlPUVRoSUpaY3F4K0kwekNCWmxVR1MzdEkraWdV?=
 =?utf-8?B?allqVkl4c29FRFZtRGlKZERrcXFZU01RT3dBTlkxdHN0emhLK3V4WU8yRm9M?=
 =?utf-8?B?eGZHNVZFR2JyVUl0MVdqK2dDVWdFazczeUdVT2haT2xyUzNLT0swMWNvOThk?=
 =?utf-8?B?VVJ5ZnU0dkhicURUbnVvU0MzK0lrU2ZYR211YjlTelhvV0MyYTcvOFUxVjZz?=
 =?utf-8?B?VVNxcWRxZngvRUJNY0FWNFpudlFibEZ2N0RpVnZneTE4d0JZN1VZdXBYZmRD?=
 =?utf-8?B?V3F2WWZuYlZUZzRvdnF0a2J6bWM3dkh1UXRYOVcrQTI5WGx4NFc2MkZNTS9o?=
 =?utf-8?B?Y0hhdTRoVUNkdHZuOHZJMzM2allBWVV1MTJVU1JLbFl6dWFualRmQi9TbFor?=
 =?utf-8?Q?slRPV92sKtel3W2Xy+kroDA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <841323A23F125F4B84984A3B0CB81C6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41004b88-3193-4bb2-3f70-08da74aee211
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 17:46:09.1946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0s25N6/MeUSBd37gje3SK5l0RlNwHBN8TZeuC2BIzO4StzynE5ITXcglkP5gnCLKk7Ge0onjSH3FN4jSZBEHsFiSwhysjfs9gebpNwAnpDQMdK0KA95Dn/Jv8I098sJ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3562
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpTdHJhaWdodCBmb3J3YXJkIGNoYW5nZSAtIExHVE0uDQoNClJldmlld2VkLWJ5OiBBbGFuIFBy
ZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KDQpPbiBXZWQsIDIw
MjItMDctMjcgYXQgMTk6MjAgLTA3MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20gd3JvdGU6
DQo+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IA0K
PiBUaGVyZSB3YXMgYSBzaXplIGNoZWNrIHRvIHdhcm4gaWYgdGhlIEd1QyBlcnJvciBzdGF0ZSBj
YXB0dXJlIGJ1ZmZlcg0KPiBhbGxvY2F0aW9uIHdvdWxkIGJlIHRvbyBzbWFsbCB0byBmaXQgYSBy
ZWFzb25hYmxlIGFtb3VudCBvZiBjYXB0dXJlDQo+IGRhdGEgZm9yIHRoZSBjdXJyZW50IHBsYXRm
b3JtLiBVbmZvcnR1bmF0ZWx5LCB0aGUgdGVzdCB3YXMgZG9uZSB0b28NCj4gZWFybHkgaW4gdGhl
IGJvb3Qgc2VxdWVuY2UgYW5kIHdhcyBhY3R1YWxseSB0ZXN0aW5nICdpZigtRU5PREVWID4NCj4g
c2l6ZSknLg0KPiANCj4gTW92ZSB0aGUgY2hlY2sgdG8gYmUgbGF0ZXIuIFRoZSBjaGVjayBpcyBv
bmx5IHVzZWQgdG8gcHJpbnQgYSB3YXJuaW5nDQo+IG1lc3NhZ2UsIHNvIGl0IGRvZXNuJ3QgcmVh
bGx5IG1hdHRlciBob3cgZWFybHkgb3IgbGF0ZSBpdCBpcyBkb25lLg0KPiBOb3RlIHRoYXQgaXQg
aXMgbm90IHBvc3NpYmxlIHRvIGR5bmFtaWNhbGx5IHNpemUgdGhlIGJ1ZmZlciBiZWNhdXNlDQo+
IHRoZSBhbGxvY2F0aW9uIG5lZWRzIHRvIGJlIGRvbmUgYmVmb3JlIHRoZSBlbmdpbmUgaW5mb3Jt
YXRpb24gaXMNCj4gYXZhaWxhYmxlIChhdCBsZWFzdCwgaXQgd291bGQgYmUgaW4gdGhlIGludGVu
ZGVkIHR3by1waGFzZSBHdUMgaW5pdA0KPiBwcm9jZXNzKS4NCj4gDQo+IE5vdyB0aGF0IHRoZSBj
aGVjayB3b3JrcywgaXQgaXMgcmVwb3J0aW5nIHNpemUgdG9vIHNtYWxsIGZvciBuZXdlcg0KPiBw
bGF0Zm9ybXMuIFRoZSBjaGVjayBpbmNsdWRlcyBhIDN4IG92ZXJzYW1wbGUgbXVsdGlwbGllciB0
byBhbGxvdyBmb3INCj4gbXVsdGlwbGUgZXJyb3IgY2FwdHVyZXMgdG8gYmUgYnVmZmVyZCBieSBH
dUMgYmVmb3JlIGk5MTUgaGFzIGEgY2hhbmNlDQo+IHRvIHJlYWQgdGhlbSBvdXQuIFRoaXMgaXMg
bGVzcyBpbXBvcnRhbnQgdGhhbiBzaW1wbHkgYmVpbmcgYmlnIGVub3VnaA0KPiB0byBmaXQgdGhl
IGZpcnN0IGNhcHR1cmUuDQo+IA0KPiBTbyBhKSBidW1wIHRoZSBkZWZhdWx0IHNpemUgdG8gYmUg
bGFyZ2UgZW5vdWdoIGZvciBvbmUgY2FwdHVyZSBtaW5pbXVtDQo+IGFuZCBiKSBtYWtlIHRoZSB3
YXJuaW5nIG9ubHkgaWYgb25lIGNhcHR1cmUgd29uJ3QgZml0LCBpbnN0ZWFkIHVzZSBhDQo+IG5v
dGljZSBmb3IgdGhlIDN4IHNpemUuDQo+IA0KPiBOb3RlIHRoYXQgdGhlIHNpemUgZXN0aW1hdGUg
aXMgYSB3b3JzdCBjYXNlIHNjZW5hcmlvLiBBY3R1YWwgY2FwdHVyZXMNCj4gd2lsbCBsaWtlbHkg
YmUgc21hbGxlci4NCj4gDQo+IExhc3RseSwgdXNlIGRybV93YXJuIGlzdGVhZCBvZiBEUk1fV0FS
TiBhcyB0aGUgZm9ybWVyIHByb3ZpZGVzIG1vcmUNCj4gaW5mbXJhdGlvbiBhbmQgdGhlIGxhdHRl
ciBpcyBkZXByZWNhdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9o
bi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX2d1Y19jYXB0dXJlLmMgICAgfCA0MCArKysrKysrKysrKysrKy0tLS0tDQo+ICAuLi4v
Z3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmggICAgfCAgMSAtDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfbG9nLmMgICAgfCAgNCAtLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5oICAgIHwgIDQgKy0NCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMNCj4gaW5k
ZXggNzUyNTdiZDIwZmYwMS4uYjU0Yjc4ODMzMjBiMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jDQo+IEBAIC02MDAsMTAgKzYwMCw4
IEBAIGludGVsX2d1Y19jYXB0dXJlX2dldG51bGxoZWFkZXIoc3RydWN0IGludGVsX2d1YyAqZ3Vj
LA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC0jZGVmaW5lIEdVQ19DQVBUVVJFX09WRVJC
VUZGRVJfTVVMVElQTElFUiAzDQo+IC0NCj4gLWludA0KPiAtaW50ZWxfZ3VjX2NhcHR1cmVfb3V0
cHV0X21pbl9zaXplX2VzdChzdHJ1Y3QgaW50ZWxfZ3VjICpndWMpDQo+ICtzdGF0aWMgaW50DQo+
ICtndWNfY2FwdHVyZV9vdXRwdXRfbWluX3NpemVfZXN0KHN0cnVjdCBpbnRlbF9ndWMgKmd1YykN
Cj4gIHsNCj4gIAlzdHJ1Y3QgaW50ZWxfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7DQo+ICAJc3Ry
dWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lOw0KPiBAQCAtNjIzLDEzICs2MjEsOCBAQCBpbnRl
bF9ndWNfY2FwdHVyZV9vdXRwdXRfbWluX3NpemVfZXN0KHN0cnVjdCBpbnRlbF9ndWMgKmd1YykN
Cj4gIAkgKiBGb3IgZWFjaCBlbmdpbmUgaW5zdGFuY2UsIHRoZXJlIHdvdWxkIGJlIDEgeCBndWNf
c3RhdGVfY2FwdHVyZV9ncm91cF90IG91dHB1dA0KPiAgCSAqIGZvbGxvd2VkIGJ5IDMgeCBndWNf
c3RhdGVfY2FwdHVyZV90IGxpc3RzLiBUaGUgbGF0dGVyIGlzIGhvdyB0aGUgcmVnaXN0ZXINCj4g
IAkgKiBkdW1wcyBhcmUgc3BsaXQgYWNyb3NzIGRpZmZlcmVudCByZWdpc3RlciB0eXBlcyAod2hl
cmUgdGhlICczJyBhcmUgZ2xvYmFsIHZzIGNsYXNzDQo+IC0JICogdnMgaW5zdGFuY2UpLiBGaW5h
bGx5LCBsZXQncyBtdWx0aXBseSB0aGUgd2hvbGUgdGhpbmcgYnkgM3ggKGp1c3Qgc28gd2UgYXJl
DQo+IC0JICogbm90IGxpbWl0ZWQgdG8ganVzdCAxIHJvdW5kIG9mIGRhdGEgaW4gYSB3b3JzdCBj
YXNlIGZ1bGwgcmVnaXN0ZXIgZHVtcCBsb2cpDQo+IC0JICoNCj4gLQkgKiBOT1RFOiBpbnRlbF9n
dWNfbG9nIHRoYXQgYWxsb2NhdGVzIHRoZSBsb2cgYnVmZmVyIHdvdWxkIHJvdW5kIHRoaXMgc2l6
ZSB1cCB0bw0KPiAtCSAqIGEgcG93ZXIgb2YgdHdvLg0KPiArCSAqIHZzIGluc3RhbmNlKS4NCj4g
IAkgKi8NCj4gLQ0KPiAgCWZvcl9lYWNoX2VuZ2luZShlbmdpbmUsIGd0LCBpZCkgew0KPiAgCQl3
b3JzdF9taW5fc2l6ZSArPSBzaXplb2Yoc3RydWN0IGd1Y19zdGF0ZV9jYXB0dXJlX2dyb3VwX2hl
YWRlcl90KSArDQo+ICAJCQkJCSAoMyAqIHNpemVvZihzdHJ1Y3QgZ3VjX3N0YXRlX2NhcHR1cmVf
aGVhZGVyX3QpKTsNCj4gQEAgLTY0OSw3ICs2NDIsMzAgQEAgaW50ZWxfZ3VjX2NhcHR1cmVfb3V0
cHV0X21pbl9zaXplX2VzdChzdHJ1Y3QgaW50ZWxfZ3VjICpndWMpDQo+ICANCj4gIAl3b3JzdF9t
aW5fc2l6ZSArPSAobnVtX3JlZ3MgKiBzaXplb2Yoc3RydWN0IGd1Y19tbWlvX3JlZykpOw0KPiAg
DQo+IC0JcmV0dXJuICh3b3JzdF9taW5fc2l6ZSAqIEdVQ19DQVBUVVJFX09WRVJCVUZGRVJfTVVM
VElQTElFUik7DQo+ICsJcmV0dXJuIHdvcnN0X21pbl9zaXplOw0KPiArfQ0KPiArDQo+ICsvKg0K
PiArICogQWRkIG9uIGEgM3ggbXVsdGlwbGllciB0byBhbGxvdyBmb3IgbXVsdGlwbGUgYmFjay10
by1iYWNrIGNhcHR1cmVzIG9jY3VycmluZw0KPiArICogYmVmb3JlIHRoZSBpOTE1IGNhbiByZWFk
IHRoZSBkYXRhIG91dCBhbmQgcHJvY2VzcyBpdA0KPiArICovDQo+ICsjZGVmaW5lIEdVQ19DQVBU
VVJFX09WRVJCVUZGRVJfTVVMVElQTElFUiAzDQo+ICsNCj4gK3N0YXRpYyB2b2lkIGNoZWNrX2d1
Y19jYXB0dXJlX3NpemUoc3RydWN0IGludGVsX2d1YyAqZ3VjKQ0KPiArew0KPiArCXN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICppOTE1ID0gZ3VjX3RvX2d0KGd1YyktPmk5MTU7DQo+ICsJaW50IG1p
bl9zaXplID0gZ3VjX2NhcHR1cmVfb3V0cHV0X21pbl9zaXplX2VzdChndWMpOw0KPiArCWludCBz
cGFyZV9zaXplID0gbWluX3NpemUgKiBHVUNfQ0FQVFVSRV9PVkVSQlVGRkVSX01VTFRJUExJRVI7
DQo+ICsNCj4gKwlpZiAobWluX3NpemUgPCAwKQ0KPiArCQlkcm1fd2FybigmaTkxNS0+ZHJtLCAi
RmFpbGVkIHRvIGNhbGN1bGF0ZSBHdUMgZXJyb3Igc3RhdGUgY2FwdHVyZSBidWZmZXIgbWluaW11
bSBzaXplOiAlZCFcbiIsDQo+ICsJCQkgbWluX3NpemUpOw0KPiArCWVsc2UgaWYgKG1pbl9zaXpl
ID4gQ0FQVFVSRV9CVUZGRVJfU0laRSkNCj4gKwkJZHJtX3dhcm4oJmk5MTUtPmRybSwgIkd1QyBl
cnJvciBzdGF0ZSBjYXB0dXJlIGJ1ZmZlciBpcyB0b28gc21hbGw6ICVkIDwgJWRcbiIsDQo+ICsJ
CQkgQ0FQVFVSRV9CVUZGRVJfU0laRSwgbWluX3NpemUpOw0KPiArCWVsc2UgaWYgKHNwYXJlX3Np
emUgPiBDQVBUVVJFX0JVRkZFUl9TSVpFKQ0KPiArCQlkcm1fbm90aWNlKCZpOTE1LT5kcm0sICJH
dUMgZXJyb3Igc3RhdGUgY2FwdHVyZSBidWZmZXIgbWF5YmUgdG9vIHNtYWxsOiAlZCA8ICVkICht
aW4gPSAlZClcbiIsDQo+ICsJCQkgICBDQVBUVVJFX0JVRkZFUl9TSVpFLCBzcGFyZV9zaXplLCBt
aW5fc2l6ZSk7DQo+ICB9DQo+ICANCj4gIC8qDQo+IEBAIC0xNTgwLDUgKzE1OTYsNyBAQCBpbnQg
aW50ZWxfZ3VjX2NhcHR1cmVfaW5pdChzdHJ1Y3QgaW50ZWxfZ3VjICpndWMpDQo+ICAJSU5JVF9M
SVNUX0hFQUQoJmd1Yy0+Y2FwdHVyZS0+b3V0bGlzdCk7DQo+ICAJSU5JVF9MSVNUX0hFQUQoJmd1
Yy0+Y2FwdHVyZS0+Y2FjaGVsaXN0KTsNCj4gIA0KPiArCWNoZWNrX2d1Y19jYXB0dXJlX3NpemUo
Z3VjKTsNCj4gKw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmgNCj4gaW5kZXggZDNkN2JkMGI2ZGI2NC4uZmJk
MzcxM2M3ODMyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50
ZWxfZ3VjX2NhcHR1cmUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRl
bF9ndWNfY2FwdHVyZS5oDQo+IEBAIC0yMSw3ICsyMSw2IEBAIGludCBpbnRlbF9ndWNfY2FwdHVy
ZV9wcmludF9lbmdpbmVfbm9kZShzdHJ1Y3QgZHJtX2k5MTVfZXJyb3Jfc3RhdGVfYnVmICptLA0K
PiAgdm9pZCBpbnRlbF9ndWNfY2FwdHVyZV9nZXRfbWF0Y2hpbmdfbm9kZShzdHJ1Y3QgaW50ZWxf
Z3QgKmd0LCBzdHJ1Y3QgaW50ZWxfZW5naW5lX2NvcmVkdW1wICplZSwNCj4gIAkJCQkJIHN0cnVj
dCBpbnRlbF9jb250ZXh0ICpjZSk7DQo+ICB2b2lkIGludGVsX2d1Y19jYXB0dXJlX3Byb2Nlc3Mo
c3RydWN0IGludGVsX2d1YyAqZ3VjKTsNCj4gLWludCBpbnRlbF9ndWNfY2FwdHVyZV9vdXRwdXRf
bWluX3NpemVfZXN0KHN0cnVjdCBpbnRlbF9ndWMgKmd1Yyk7DQo+ICBpbnQgaW50ZWxfZ3VjX2Nh
cHR1cmVfZ2V0bGlzdChzdHJ1Y3QgaW50ZWxfZ3VjICpndWMsIHUzMiBvd25lciwgdTMyIHR5cGUs
IHUzMiBjbGFzc2lkLA0KPiAgCQkJICAgICAgdm9pZCAqKm91dHB0cik7DQo+ICBpbnQgaW50ZWxf
Z3VjX2NhcHR1cmVfZ2V0bGlzdHNpemUoc3RydWN0IGludGVsX2d1YyAqZ3VjLCB1MzIgb3duZXIs
IHUzMiB0eXBlLCB1MzIgY2xhc3NpZCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2lu
dGVsX2d1Y19sb2cuYw0KPiBpbmRleCA0OTJiYmY0MTlkNGRmLi45OTFkNGEwMjI0OGRjIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfbG9nLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jDQo+IEBAIC00
ODcsMTAgKzQ4Nyw2IEBAIGludCBpbnRlbF9ndWNfbG9nX2NyZWF0ZShzdHJ1Y3QgaW50ZWxfZ3Vj
X2xvZyAqbG9nKQ0KPiAgDQo+ICAJR0VNX0JVR19PTihsb2ctPnZtYSk7DQo+ICANCj4gLQlpZiAo
aW50ZWxfZ3VjX2NhcHR1cmVfb3V0cHV0X21pbl9zaXplX2VzdChndWMpID4gQ0FQVFVSRV9CVUZG
RVJfU0laRSkNCj4gLQkJRFJNX1dBUk4oIkd1QyBsb2cgYnVmZmVyIGZvciBzdGF0ZV9jYXB0dXJl
IG1heWJlIHRvbyBzbWFsbC4gJWQgPCAlZFxuIiwNCj4gLQkJCSBDQVBUVVJFX0JVRkZFUl9TSVpF
LCBpbnRlbF9ndWNfY2FwdHVyZV9vdXRwdXRfbWluX3NpemVfZXN0KGd1YykpOw0KPiAtDQo+ICAJ
Z3VjX2xvZ19zaXplID0gaW50ZWxfZ3VjX2xvZ19zaXplKGxvZyk7DQo+ICANCj4gIAl2bWEgPSBp
bnRlbF9ndWNfYWxsb2NhdGVfdm1hKGd1YywgZ3VjX2xvZ19zaXplKTsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuaCBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuaA0KPiBpbmRleCAxODAwN2U2MzliZTk5Li5k
Yzk3MTU0MTFkNjI2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9p
bnRlbF9ndWNfbG9nLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxf
Z3VjX2xvZy5oDQo+IEBAIC0yMiwxMSArMjIsMTEgQEAgc3RydWN0IGludGVsX2d1YzsNCj4gICNl
bGlmIGRlZmluZWQoQ09ORklHX0RSTV9JOTE1X0RFQlVHX0dFTSkNCj4gICNkZWZpbmUgQ1JBU0hf
QlVGRkVSX1NJWkUJU1pfMU0NCj4gICNkZWZpbmUgREVCVUdfQlVGRkVSX1NJWkUJU1pfMk0NCj4g
LSNkZWZpbmUgQ0FQVFVSRV9CVUZGRVJfU0laRQlTWl8xTQ0KPiArI2RlZmluZSBDQVBUVVJFX0JV
RkZFUl9TSVpFCVNaXzRNDQo+ICAjZWxzZQ0KPiAgI2RlZmluZSBDUkFTSF9CVUZGRVJfU0laRQlT
Wl84Sw0KPiAgI2RlZmluZSBERUJVR19CVUZGRVJfU0laRQlTWl82NEsNCj4gLSNkZWZpbmUgQ0FQ
VFVSRV9CVUZGRVJfU0laRQlTWl8xNksNCj4gKyNkZWZpbmUgQ0FQVFVSRV9CVUZGRVJfU0laRQlT
Wl8yTQ0KPiAgI2VuZGlmDQo+ICANCj4gIC8qDQo+IC0tIA0KPiAyLjM3LjENCj4gDQoNCg==
