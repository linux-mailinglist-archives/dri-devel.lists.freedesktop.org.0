Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52536776EA6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 05:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662DD10E4B1;
	Thu, 10 Aug 2023 03:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A4A10E4A9;
 Thu, 10 Aug 2023 03:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691638755; x=1723174755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qrybpnunPNygyRu3LzQdP0xUPPN2IslmiOlzXc8Ox8w=;
 b=YbUOFepU5RkRJva+KvswlKR3itGXIk1CP+RzCCixcOT8Mp+LPJ2bZvwI
 jgwrg3aHwzDE7r/9RwtDkTY8NYrcUWcfJu8Wo7n+Hwc5Mtc+wvDg5WTNK
 PIsSH9KapC7PQwZJ3/IOMWufxV89NcEbcIISPsCgfCBP8nIUgagtmxP5L
 XQNVFAk0rVZNwdUjgSL/lzkdPHhkvoucRrGP0dlgow9JRfynWBHz3Ghuk
 dUynQ2DiUBLgqS2eQKOiAYkruBnGooCArJh1xQXUGlgOJFLwiDntHEo9J
 D3ibWYok/ClJ+TyAHnZFDAykm/42s7PyFyuMtS9nBITnKjLF9eZ5P9ntN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374066559"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="374066559"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 20:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="978630966"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="978630966"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2023 20:39:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 20:39:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 20:39:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 20:39:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 20:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZmQ5bLm8wCfpjBCcbJlodfYVGxqMAOHj/7sIzn9n4+VPitmy4xEeTO1JgGln2OA3P8jnYNH90oR/MVEEtHgtVQLJ/+h+1rHCNts+B/IJGe5rQdBf2s3tVmaDB+nj2GZAP32yjxICGPPj3kOuZE0yh7V40t88xhEfXnkFfn+mAW1+vY9oYSaLvsoXIB57FDjCllFNOZ30+EqDCQ8nUS03tLMKEX+0J72HXu6qO+PHuoP7kn7ffXd054VHa/hE02fuAIlaXdUh3L/M+SK6XUw+dbwjQ/NLradQ2xuniJjtv2GnDy6Tj6EmkDpHPSAjBK5Z6W5rz2+8s8O7mMcFHflkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrybpnunPNygyRu3LzQdP0xUPPN2IslmiOlzXc8Ox8w=;
 b=hXwyOpy9ekkn7+oO8irLQS75V7OXsehqlEAi0VlnbFGfMPU+/YO7Bl7hpplw4mrq+84EFsFFZtrlQnThjQk+N0LZxa1peLDKtyIq0dN8pUN39qPaHykVamw19uQVjQTFYS3EimVH+f/iuzXHEvWXYYr1URRU/VLIuox3rp4Q7zPa1k38zaYvYR8h1BSSaYg03eymJa/HzAufd/yyNDOZyD97J8edUAZOeZNdXeeFTqgs+e9otCEtdd8aIwA7dwey7aRbTqm4NOqDfg3J/EaBaS6CqKpFq5tIGg4Lj3sp3wC9qPtICzvG91QWu6nlHsf8G9JyfM/+4m5HF+d7zXRPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 03:39:10 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 03:39:10 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v1 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHZxZn9E8ZfgAx54k+gl5CrVAjKMq/i7TsA
Date: Thu, 10 Aug 2023 03:39:10 +0000
Message-ID: <b258982b068114bb7e333bcd15349c30c956545c.camel@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
 <20230802233501.17074-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230802233501.17074-3-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN0PR11MB6277:EE_
x-ms-office365-filtering-correlation-id: 95d16ed5-c62f-46a7-2052-08db99535bcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vhat7gIzCE6jPsdtoJ608kW19MI7B7R5B0Hr6SXEZKYdwJc1bP+cnEx7LRpbkqfwAk6URSHo6FT0a+uCtTIbOonWRW7ImRwT96M6AGjRO01w5YgfIFimuJGcK8E4ENZfBclEhvkZBZGK4A/FSVdAPFwzQX98ixXBo+9TesUJRyO+zd3ToRpesduKdL4O8tkqX+x4ibyfBxvc/0+YX5/Fph6zcDiwljzKix+1R/E+FoeSaHiJJgKXwu3O5vG5b0jYrUSUVwsK+LxDDDhQnrMhLPQuMCDpSFB8xzZJNvy8Jb7gQmsS5QRlD5A/bBAzW6paXQOesxeuBBnqS3LI49dzJX56K+ebUlrptm+ulwe8bElogdJawxI2zQstS5QVnX3ELQUB8lvsv1UEQ26pddxT0/PgOyHnLZwv6fsFHyh8rDSKx9OvZKBfu+YCcXF+YsUV8KMRztC6BInxb7KMbLB3/8KGC2jD7H+kqdST8noWBosaQXS/VCSEtyMtspTJ05aBzw44EPYfZPc8J+fEBFqXatUdjDjLWThzKS/ZQs44P1RnhFdSjDSi+/781rxA9H6/lI4FGD65PTJk6+T0kprINi6n5UMwp3LaHZ6BdzbXndJU8PApdQqrucFwNE62PW8g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(1800799006)(186006)(36756003)(2906002)(478600001)(26005)(6506007)(6512007)(71200400001)(107886003)(6486002)(86362001)(8936002)(8676002)(316002)(6916009)(64756008)(66476007)(66946007)(66446008)(66556008)(4326008)(91956017)(5660300002)(450100002)(76116006)(41300700001)(38070700005)(82960400001)(122000001)(38100700002)(2616005)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnhsV2tnbS9CUUk0UzA3amtQKzd5SmVPV3lhK1pzeWppdGxLREhIY3Qwb3hR?=
 =?utf-8?B?WVFOSTdoWVBNUStSeWU2OGdMeENTZk1SYW50RjRaRXMwa2JBaVlodWlwQ2lI?=
 =?utf-8?B?QVkySFVPYXRGVHZvb3hHeVV5cnVMLzY1ZWlRQkVWOU1rZTZveENhY1E5VW5P?=
 =?utf-8?B?ZGhUNjZhOTdqTE1NVEdTU0E5UXdPSVhrTi9uNHY0TWdZNXVacnIxQTRlOHpi?=
 =?utf-8?B?L2M5alJKN1k4dUI1OFRpaGgvOVdESThGZG1WQ2ZCckNzcCtBRVZ3K2tPd2xN?=
 =?utf-8?B?RHc4aDhTVEpZek5aamhRZlY4YnIzcmZpUlNrL0dDTFhoQXA0RXArNUs2L3lx?=
 =?utf-8?B?bWN0Q2R6endNVW5Xc3R3ODAyWE5uV282dkFyQ3d3RHdBN0lWODNqaWNOaUJt?=
 =?utf-8?B?WWJXTmhPWGtwVG0yN05STFkxS2l3aVFiNFFsRnN4MkxLamdKMS8zZDZ0R3BG?=
 =?utf-8?B?bXlsOGR6QThaK09vWXlpQkNnT1JScWtmZkVkZTVDQ212cENzTVZSRkQ4aGRz?=
 =?utf-8?B?MkhyQ2FUd09aTXZrWEJOTkxIREFVNXNRVlp6UDJ3THJjUitJZEtORkc4UUV6?=
 =?utf-8?B?VkpxNWpRT0duVmhiMTlSVCtxYXc4Y1dZc1lNWnpXNmdZUWM1QjZiMFMrVks4?=
 =?utf-8?B?ck5vYzIvaGhpZHVEcFdsTjJOSmFRZGVFRTZwd1NPZGptYjZEVGtBd25DZkpv?=
 =?utf-8?B?MVJvVWkyZU5PNkJYcXA2VGZlL1hXSGVDRjNEQm5qaW9qM29nTFpSZlBCUnZF?=
 =?utf-8?B?MlVqMDZvZU9xd0F4Q2pTUmJ0T2NmTncyNFJXWjNkTTFkeGxhUEkyalcrbzdM?=
 =?utf-8?B?NWJndGo4aTFZS081eWhpbzhJWkJ0WmN2bFJmZlhlVllLcFM3akdWSUZjaDJS?=
 =?utf-8?B?YjV5QkltdzlTUGx6czJjc0NFcWtUVjByckRleWxHY3huTDkxR0NQRFRoaHEy?=
 =?utf-8?B?NDU4bzBKTitxaUJ1WDc1Q29iZGNJVjM2SFgzMU0xS2tuN0dHYUhlQlNveExC?=
 =?utf-8?B?V045Q2Y0Q3RLUVgxcUFCbUYxakhrQW1uV2lyeHJDUUJIUFNxSVNUaUxQaTlu?=
 =?utf-8?B?K1l0VlJ4SzlHTnpEMnRhNEdma2hPU3dSYTU3ZHd0My9zdEhnWjRnamk5Z2Rt?=
 =?utf-8?B?enRYT1dRaEdwUVhkREVTZVlaUkliSWtKUzNQNGwydkFYeHFlb3laUmZKSXVl?=
 =?utf-8?B?N09sbVVjT1NzVzNueXlCWEE1YmVkZTVOek5SVDU2SW9qanNpdy9MTkZHZVhT?=
 =?utf-8?B?VGdXU0ZNaElTdmFOOVlWYmphWnF2RGQ4RkU1eXRDU3RNZGhONXhtY1EzckxL?=
 =?utf-8?B?UElkaW95cmd5b1gyUG8rOStIV1J1RHRNcVYvZExINFNNVHl1ZjZkQXdSenl0?=
 =?utf-8?B?eVJ3NXFpTFBzdC9YUjlHVEprL21VdTNxcWdpTnRmdThHaWNHZmJsSHpJOGRR?=
 =?utf-8?B?bk5zT1pUcyt4S3padWtwaEF0YlpwbS8xcUFLaHBFdUJLOEhUdzZxa2dyVXhj?=
 =?utf-8?B?Wk1IaTFCU2xhR0o2TTBLM0hrVkNKN0I3ZHdaYk9ycytSTTRJaTJWdzlrRlpN?=
 =?utf-8?B?Y0JESmtIT29KengzcERIWTVrZjFlak1kRkRlRVhDVkFkQzhCSjROa3h5akhq?=
 =?utf-8?B?ZFE3c3RoQXFadjU3RkJ2eG1LeSs2bkJsd3NBUk9HaFltTVRVeWkybjRjNzYy?=
 =?utf-8?B?UHFPZkdtaDBhQU12blgxci9mbTVzdjg2NDFYdUNPRUQrLzZXMXQ5Vm1tVXg0?=
 =?utf-8?B?NWhvZUtCQjBGTFdGMi93YzVkWGc1T1I1ME1GNkZUbkgvdS9EdUZPMjRlc0Fy?=
 =?utf-8?B?T0FSbzg1NVh4a1BTT2JrWnpKM0VHSWRGSFJ2NGFWWHVzd1JEYWJKMTRYSDZl?=
 =?utf-8?B?M2xGS2lwT3lGYUEyQjE1OFpKMkpJZ2NseGE5M0NwT1BybWhFMWhDMlVGNmtT?=
 =?utf-8?B?WlExcUpncWhyeGMwcnExYmpqNmUzbkVvQjVVUjJyNmZxTmNYdHVDc3l2QW9a?=
 =?utf-8?B?cTAyT0dsRGNVeUYxRHM5aWVqWDJqOTF3c0xtR3QxQjhVTnhnVmhGY3hQbnZO?=
 =?utf-8?B?VXFhRVY3V2pmdlFBZkFnUndnRjZJbnVYbGZieTUwUTVxU1JWRytEelc5azFm?=
 =?utf-8?B?L2xNMUM4OUVlb29rN0s0cEc2TE5IUG9PVTg0YlNBcmlER2JTcFp0TTQ2ZmNS?=
 =?utf-8?Q?EFoM+wiLm/Lo3zv3jPBKWqs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39956F6D2184CF4F9F96850B956354DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d16ed5-c62f-46a7-2052-08db99535bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 03:39:10.4435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7FW9CdhjB7oK2xmptIP2lfYLe5Cw6clg9kTbqAZr07SWjMCenPeTl8R5SLPzRnLzbqTUJCg4DJBYnxn0/KR06AOo5qSoCr5TYIoyO0VRL0TK1+YCQLrmLKO/Pg2jKp+9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDE2OjM1IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBJZiB3ZSBhcmUgYXQgdGhlIGVuZCBvZiBzdXNwZW5kIG9yIHZlcnkgZWFy
bHkgaW4gcmVzdW1lDQo+IGl0cyBwb3NzaWJsZSBhbiBhc3luYyBmZW5jZSBzaWduYWwgY291bGQg
bGVhZCB1cyB0byB0aGUNCj4gZXhlY3V0aW9uIG9mIHRoZSBjb250ZXh0IGRlc3RydWN0aW9uIHdv
cmtlciAoYWZ0ZXIgdGhlDQo+IHByaW9yIHdvcmtlciBmbHVzaCkuDQo+IA0KYWxhbjpzbmlwDQo+
ICANCj4gIHN0YXRpYyB2b2lkIF9fZ3VjX2NvbnRleHRfZGVzdHJveShzdHJ1Y3QgaW50ZWxfY29u
dGV4dCAqY2UpDQo+IEBAIC0zMjcwLDcgKzMyODcsMjAgQEAgc3RhdGljIHZvaWQgZGVyZWdpc3Rl
cl9kZXN0cm95ZWRfY29udGV4dHMoc3RydWN0IGludGVsX2d1YyAqZ3VjKQ0KPiAgCQlpZiAoIWNl
KQ0KPiAgCQkJYnJlYWs7DQo+ICANCj4gLQkJZ3VjX2xyY19kZXNjX3VucGluKGNlKTsNCj4gKwkJ
aWYgKGd1Y19scmNfZGVzY191bnBpbihjZSkpIHsNCj4gKwkJCS8qDQo+ICsJCQkgKiBUaGlzIG1l
YW5zIEd1QydzIENUIGxpbmsgc2V2ZXJlZCBtaWQtd2F5IHdoaWNoIG9ubHkgaGFwcGVucw0KPiAr
CQkJICogaW4gc3VzcGVuZC1yZXN1bWUgY29ybmVyIGNhc2VzLiBJbiB0aGlzIGNhc2UsIHB1dCB0
aGUNCj4gKwkJCSAqIGNvbnRleHQgYmFjayBpbnRvIHRoZSBkZXN0cm95ZWRfY29udGV4dHMgbGlz
dCB3aGljaCB3aWxsDQo+ICsJCQkgKiBnZXQgcGlja2VkIHVwIG9uIHRoZSBuZXh0IGNvbnRleHQg
ZGVyZWdpc3RyYXRpb24gZXZlbnQgb3INCj4gKwkJCSAqIHB1cmdlZCBpbiBhIEd1QyBzYW5pdGl6
YXRpb24gZXZlbnQgKHJlc2V0L3VubG9hZC93ZWRnZWQvLi4uKS4NCj4gKwkJCSAqLw0KPiArCQkJ
c3Bpbl9sb2NrX2lycXNhdmUoJmd1Yy0+c3VibWlzc2lvbl9zdGF0ZS5sb2NrLCBmbGFncyk7DQo+
ICsJCQlsaXN0X2FkZF90YWlsKCZjZS0+ZGVzdHJveWVkX2xpbmssDQo+ICsJCQkJICAgICAgJmd1
Yy0+c3VibWlzc2lvbl9zdGF0ZS5kZXN0cm95ZWRfY29udGV4dHMpOw0KYWxhbjogaSBjb21wbGV0
ZWx5IG1pc3NlZCB0aGUgZmFjdCB0aGlzIG5ldyBjb2RlIGlzIHNpdHRpbmcgd2l0aGluIGEgDQp3
aGlsZSAoIWxpc3RfZW1wdHkoJmd1Yy0+c3VibWlzc2lvbl9zdGF0ZS5zdWJtaXNzaW9uX3N0YXRl
LmRlc3Ryb3llZF9jb250ZXh0cykgYmxvY2sNCnNvIHB1dHRpbmcgaXQgYmFjayB3aWxsIGNhdXNl
IGl0IHRvIHdoaWxlIGxvb3AgZm9yZXZlci4NCg0Kd2lsbCBmaXggYW5kIHJlcmV2Lg0KDQo+ICsJ
CQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZndWMtPnN1Ym1pc3Npb25fc3RhdGUubG9jaywgZmxh
Z3MpOw0KPiArCQl9DQo+ICsNCj4gIAl9DQo+ICB9DQo+ICANCg0K
