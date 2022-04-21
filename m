Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE92A50A0FB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABF510E4AB;
	Thu, 21 Apr 2022 13:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB8610E49F;
 Thu, 21 Apr 2022 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650548411; x=1682084411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bRoYeEDNJEH4iKkMQBr550xH+vKn3UFP3ueWP60FGD8=;
 b=OMcmWEW70xBQrJuyMNFLO5kTaWJR7IleFIA/gOP+K8d9sb3va8621zTX
 OPm3jVrJYK2716ARVq3E9ysIu1lo8oxj3+uWllJ7XDoOId875JyleF27g
 PKtOTLcDRm+y6Vv8cCuvGSDiW8jDkm4OrkN32JhZFUxp9tMaMV/X1vUud
 jjZSD3yoUH1ZXoLrdD8axxL1/eldhy31cQR+0T9V4c1eY2I/zJ1J231hZ
 IfehW5s7F4kfk8PP47m+bLzgvsUh7Mc+lkzuweIcklhorgeQ7vR/hC+JV
 bhTWuYrDGLMgnoJJNNQG9jhgdLItqPhYkQHZCGU5c49GFtKOC5lJBnISG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263200984"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="263200984"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 06:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="648137017"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2022 06:40:11 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 06:40:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 06:40:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 06:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMM5LgXwl3Zv1q/Scw7wMPYVPQ99GOHTBPPD4mfxLvjAs94FvZyog8w7zhiezF0BbW794Zfiad+IN0YRU2r+SRNumu9+78WVFK7iz1CQ+aohMaSdy7k8WU20uGVG813sQhveW9fKl58amsr1vN97YISNpg6Yu/6D12YrPfxb/sVtsTO31r1Qvsp/E0nQC2Qb357rtz7rPsMpRzWfFTnh4aJ9TEkjx2rg+hUO+KMLH6pqJrJkV0oqbu7BqRU57Kla2xxmXjO5lg21O3LW81dc6b3yvAKvxRomfI82ZBMXsoWHpJSXy/svbpc/DjhgdS4+05Qfq8Y1w2P6J8SsD1ka1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRoYeEDNJEH4iKkMQBr550xH+vKn3UFP3ueWP60FGD8=;
 b=XtS4s6TnnSRAFTgj3vdsZ/S6QHKmyANvhxNaQzhFkCdfHKpHj2ZYeFyy5niwP1m/4+dsd5F4MPvFno0XEpqSuQlxkIQXYI6Ldsf+GTZC5OVoq1/fjmJ7wF8JgwJwxO3JRL8YekJaIWFHAHNzh9Gx4d2gXZ5hGh46U0b7XvBS/ioRO4ywr37AY1/AQlTrGdY+jyd/+PCCw8EyjAqily/s4pVr5H9dKkS+7HSkFYQC90Ml8250YKTRF/SGq+rrsx2mog/e5s7FPmvy7W9m2yP6BV8VcpmTABQmOX8bGo+aOyVwiCFBW5rovyXxbY3ZxIHIUUhGKU6YHNvyzYq/gU5Utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 CY4PR11MB1925.namprd11.prod.outlook.com (2603:10b6:903:128::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:40:09 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::588c:b026:fe27:2553]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::588c:b026:fe27:2553%7]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 13:40:09 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] uapi/drm/i915: Update the placement list impact on
 obj residency
Thread-Topic: [PATCH 4/4] uapi/drm/i915: Update the placement list impact on
 obj residency
Thread-Index: AQHYVXQxRr7VyVPKI0q7pf2wVbspmKz6X7eA
Date: Thu, 21 Apr 2022 13:40:08 +0000
Message-ID: <02e045db12a0887104d24625943dacf2956ed1eb.camel@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
 <20220421113813.30796-5-ramalingam.c@intel.com>
In-Reply-To: <20220421113813.30796-5-ramalingam.c@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-3.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5fe01ff-50b4-454b-e720-08da239c73cb
x-ms-traffictypediagnostic: CY4PR11MB1925:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB192593E6B342703FD3AB76AA97F49@CY4PR11MB1925.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JLtKq+s0LCcFL+jp3QhUyoTGqk/m+cg64O0/sdF5JGExhLXZJ6HovEXZ3QPWmiLSm5CYLY+N1iPe5srtFQAuGNEXK/1mivFX5OLov/5PtUdsTKRxsTgzmyiXEHT5sI88XLkzvA+IJhn503FxCpUbRrzyJ/mYQ9wGP4t1d65Wq3WliBgo5LUDQtsGXx9bZ5pMKVfYyEoPzYo1jYdRicSoIXh5ss4qXT3oQP/iDCMTFLjXM1W4iV+RotRHk++nFdW1bYCPJobHqJuMQJ3GnaN2/wSkx5R+SKueghyso96AtNf6ihwEgoqhPovuxZhqcMC/Fombk1Du1kNABts3agQ3prH9I83KG3rOMZMhK4r0pieodAefKCYje9HLMiVe7NHiddQUwuuDky015FSdu/0yAYcjPC+hqlzHYc3D32jCdfxgT20DnKGjjSqD4qqF70EoHYRSAKInD5LCCdWSDJz/znz6qhFtCZxDPkkae/V1muA6rplZn9osBwk8+41VWmdOPBicefRE3e2sztmGMV0ujkiCyPrwXuf8e9yX8z5RZ5As8MjTSZnhfVOVW2gs8txVsFqjwoVI/Eogxaj7wPq6Tckux+emldva8V9YJ9EGtlodJG+SbpvAj7hACXyw70vzy1fuTsbJvYWC7KkjQYJKuvjNYVGQgiSeAHM94fdh2vGirRSgBO1bcRu0hfMS5Ym9xBjku/P8YwisZl7YnpV6zQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(82960400001)(316002)(5660300002)(66446008)(71200400001)(508600001)(6506007)(64756008)(26005)(6486002)(8676002)(8936002)(15650500001)(36756003)(2906002)(38100700002)(110136005)(38070700005)(122000001)(4326008)(86362001)(186003)(2616005)(66476007)(83380400001)(66556008)(107886003)(450100002)(76116006)(91956017)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk1EZG00azhoSXNaNVhVNFMxNWdnUFF5aU9tb1Y2Q01VTlh1eklaancyWlFi?=
 =?utf-8?B?WU5OZnI4WDM1YU1Gc1doVnY3d2c2c3ozQW85YUY5UWNJK0hpYlFQSEx5R2Yy?=
 =?utf-8?B?SFRjTGErc2FhSnlMOGtoYnM2YXpkRWlyd0EwK3BCMzJKMnp4MjFZOC8zUjVR?=
 =?utf-8?B?Qkw2L0dBN3d3MmsrdkM3bFA4dW9Ua093NGlKSjBzV0tkNlZrQzh2cFN5WitR?=
 =?utf-8?B?bEJYdnlzM2F6MnJpd1NhMlFDWThKTWxxWXJ4RGdXb1ZDNlRSL3ZaQ09QYWty?=
 =?utf-8?B?NzY3QU41UEw0TnhFc1dlcVRlWEFqejlzV3VadWQxc1FaLzY5emg0Vmx3eDNT?=
 =?utf-8?B?d2ZZNWc4YlZpSU16c3graTFQVjRKTkRxYTY5TmlRVFduMkhhRjd2cGduNFY4?=
 =?utf-8?B?OCtQN3d4TVYyY05wSjZzWVRZWmVjbVU3WTN1WTlaTkl6a0JMeCsvNmFxNnlX?=
 =?utf-8?B?d293TW9DRWd6aVJ3UkZTUXQwMGtxNkZLVnR1UWRkbnFiNGZVQVZCMzMrOTRZ?=
 =?utf-8?B?b3VWeDRGYXhvNHQxcUdUa0pFeTVIKzlpeTltTUx1amRwWE8vNzBLTXFIKzZx?=
 =?utf-8?B?MFVDVGQzVXp2RmRuVzQ2RVIzOE56YnRaMFVIa3BRZzdCaGh3QW45SGtUa0dQ?=
 =?utf-8?B?QVhTM0MxMnRJbDBicTdYd0w1Z3cyc2kzRENiNFFSclJyRStJOG5idlk5Z1hE?=
 =?utf-8?B?aGNtdjNGR2ZPbHdtVHNQc2xZbTM4UCtHWkJOaUUydnRva1BTTVhHY0R6alVD?=
 =?utf-8?B?TW1OSXdCTkxVaWtZdG1VUXgvdmM3ajAyb0RJU0pQSWNGQkNoN0xEbGVnZUd2?=
 =?utf-8?B?RDVmOFdsMmVkZjc5ckxUT3l1WmwxbmVkY3pmeE94WVJndWdlSDJWL0xxYmpD?=
 =?utf-8?B?bnZDTitNbXFUMk9DNHVnVzJySjhrNG9xRzJDUkNRdU1Gb051MTNhY2VNanpJ?=
 =?utf-8?B?MWdheHJ1UWpRdm5SbVJjVDRvUmF6cHhNQWs4MVRoczFtT3dZQnVKanpOTkxN?=
 =?utf-8?B?bURvckQ1b1RRbTNpNEtMTmVNaW5DOCtGZFM5TStEdFdDT0NlQ1VvUG5PQUJp?=
 =?utf-8?B?WExrNlMvWG1wS2VqekZCYXkvdHUzNFlSOEdMbDNTckJKSlRvOEx5MXRSck10?=
 =?utf-8?B?K0pkTnRjazdwcG5nSzlBWmFxRmxxa3JjaGtTWk94ZWQ5T2FEZ2hMNVZqekRC?=
 =?utf-8?B?YXJsMXNhQlEwTUMxekRMNUl2WkNncXZiVEhpSjdhL0d5Mm9tQjdSQll2ZjND?=
 =?utf-8?B?Skl0NCsxOHFyTXdsSEZkdHFKanhZelpESmt4S1RsSHp1OU1JN2RYZG41aXlN?=
 =?utf-8?B?c3F5QzFIaWpybWlyTG9HZityaVFtWCs0ZVdOeS9hcTgwZERMTVNyalRzVEhs?=
 =?utf-8?B?Z0JOZ3lmc3ZHQ1RmbkpUSXhvbFdnMndGSjN0bU5TeDlPcmRsdEtRblUxRE92?=
 =?utf-8?B?Njl4R2VvNTRBanBSdXA3WVYybzFxdklUMUEwNlViNlV3TTFtN2JRN0pQR0dq?=
 =?utf-8?B?UFprYmxOMlJoSU1uNGdwVTFmNTg2M3h2T2tXR0p2OXlzOHRTK0F6M3VNY0cx?=
 =?utf-8?B?ZlpKVEgzVXpHYjRaeURnSFRFNXNnV2tFMVBkQkQzd3ZIQ1VrSG5GcGorajFV?=
 =?utf-8?B?clJueTN3SmxHN0N4N0FGVUt0akVBNDEzY1BkdDlwNGFBbTNJUFhUWkZ3QnZl?=
 =?utf-8?B?QzNKSkZGTmhaS0oySnp1WDBWeTVXdEgwanR1RFNrME5XREVmZlRzWGw4dm95?=
 =?utf-8?B?R1lzWkFqdElDbXR4L2R5VGtydHpJUzhidk5mSEZZNDB1ZVJUTnRzWW1XRmlV?=
 =?utf-8?B?bWlSRG5iK0RCSnh1QnFvekxSNndHUmNjVjNtcE0yb3JwYXNVRGtodldqNno1?=
 =?utf-8?B?NVlFSFZ0Z0JLOHVNOTBCT2trNEFNb1R0RXQxN1Rzd0ZzcXZsKzV5RDNYVEJ1?=
 =?utf-8?B?anVPd3VvTXUxNmkycWJUWEZkam1OUlIxZnYvRVppTjN6eXZtWTVsK2RET2dP?=
 =?utf-8?B?ZmFRWlBQOERPU0h3QzJZZkh0aWdjdUdrUHRVVzFWUlRpckdLL1ZQSzBzQnhy?=
 =?utf-8?B?aDFXTmdHTHB5TjlKdW5LUVNoNXZETU83RHdIZWRsVGlGSnFBOTJUOHZ0alRF?=
 =?utf-8?B?a1ZqeVh1Ujl3SHRqZ2hlZTBiY0QzbVltRzdSRmtNRm9QQ1JHdTB3UVArQndT?=
 =?utf-8?B?NFlIKzNHSHRlcUx4a1ZONytrdktGeDVjWWQ4anJ1N3Z0WXUxTGZFOGoxT2Ju?=
 =?utf-8?B?RitBZEFlaG9TRXdOdHYybGcyU3NnYmJ5TWRHcUlkd2psY05ZTWR0REsvTktl?=
 =?utf-8?B?MVRpVTRjLzN5ZDduVHQxbU9ab3p4VkFEZFlBWnArMHdiZjgxa0JLQ3ZsZjhW?=
 =?utf-8?Q?njeQsmfPtV7P52Lg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20918A4910288B46A8384D6A2BEA200D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fe01ff-50b4-454b-e720-08da239c73cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 13:40:09.0022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OnpR9dFqPyg6SCqMKSGuoYCpz+oHHV6JapoBhsL8KemysgUTTSxRwPBZGl9N4qHIPwvxqErr1+xKUFkW5Unovq4QXMM/3RoGRzaUZ9viqy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1925
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA0LTIxIGF0IDE3OjA4ICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6DQo+
IE9iamVjdCBjcmVhdGVkIHdpdGggbGlzdCBvZiBtZW1vcnkgY2xhc3NlcyBhcyBwbGFjZW1lbnQg
cHJlZmVyZW5jZXMsDQo+IGNhbg0KPiBiZSBiYWNrZWQgd2l0aCBhbnkgbWVtb3J5IGNsYXNzIG9m
IHRoZSBsaXN0IGFzIHBlciBrZXJuZWwncyBtaWdyYXRpb24NCj4gcG9saWN5IGZvciB0aGUgbWVt
b3J5IGNvbnRyYWluIHNpdHVhdGlvbi4gVXNlcnNwYWNlIHdvbid0IGJlIG5vdGlmaWVkDQo+IG9m
DQo+IHRoZSBtZW1vcnkgcmVzaWRlbmN5IGNoYW5nZSBhdCB0aGlzIHNjZW5hcmlvLg0KPiANCj4g
QW5kIGFsc28gRmxhdC1DQ1MgY29tcHJlc3Npb24gaXMgc3VwcG9ydGVkIG9ubHkgb24gb2JqZWN0
cyBvZg0KPiBJOTE1X01FTU9SWV9DTEFTU19ERVZJQ0UuIFdoZW4gdGhlIEZsYXQtQ0NTIGNvbXBy
ZXNzZWQgb2JqZWN0cw0KPiBtaWdyYXRlcw0KPiBvdXQgb2YgSTkxNV9NRU1PUllfQ0xBU1NfREVW
SUNFLCBkdWUgdG8gbWVtb3J5IGNvbnN0cmFpbiwgY29udGVudA0KPiB3aWxsDQo+IGJlIGRlY29t
cHJlc3NlZCB3aXRob3V0IG5vdGlmeWluZyB0aGUgdXNlcnBzYWNlLg0KDQp1c2Vyc3BhY2UNCj4g
DQoNCj4gUmVjb3JkIHRoZXNlIGRldGFpbHMgaW4gS2VybmVsIGRvY3VtZW50YXRpb24uDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+DQo+
IC0tLQ0KPiDCoGluY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCB8IDE0ICsrKysrKysrKysrKysr
DQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3VhcGkvZHJtL2k5MTVfZHJtLmgNCj4gYi9pbmNsdWRlL3VhcGkvZHJtL2k5MTVf
ZHJtLmgNCj4gaW5kZXggMzVjYTUyODgwM2ZkLi44YjI1ZGQ2YTE1N2EgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2k5
MTVfZHJtLmgNCj4gQEAgLTMzOTMsNiArMzM5MywyMCBAQCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2Ny
ZWF0ZV9leHQgew0KPiDCoCAqIEF0IHdoaWNoIHBvaW50IHdlIGdldCB0aGUgb2JqZWN0IGhhbmRs
ZSBpbg0KPiAmZHJtX2k5MTVfZ2VtX2NyZWF0ZV9leHQuaGFuZGxlLA0KPiDCoCAqIGFsb25nIHdp
dGggdGhlIGZpbmFsIG9iamVjdCBzaXplIGluDQo+ICZkcm1faTkxNV9nZW1fY3JlYXRlX2V4dC5z
aXplLCB3aGljaA0KPiDCoCAqIHNob3VsZCBhY2NvdW50IGZvciBhbnkgcm91bmRpbmcgdXAsIGlm
IHJlcXVpcmVkLg0KPiArICoNCj4gKyAqIElmIGFuIG9iamVjdCBpcyBjcmVhdGVkIHdpdGggbGlz
dCBvZiBtZW1vcnkgY2xhc3NlcyBhcyB0aGVpcg0KPiBwbGFjZW1lbnQNCj4gKyAqIHByZWZlcmVu
Y2UsIGtlcm5lbCBjb3VsZCB1c2Ugb25lIG9mIHRoZSBtZW1vcnkgY2xhc3MgYXMgdGhlDQo+IGJh
Y2tpbmcgc3RvcmFnZQ0KPiArICogYmFzZWQgb24gdGhlIG1lbW9yeSBhdmFpbGFiaWxpdHkuIEF0
IG1lbW9yeSBwcmVzc3VyZSBrZXJuZWwgY291bGQNCj4gbWlncmF0ZSB0aGUNCj4gKyAqIG9iamVj
dHMgY29udGVudCBmcm9tIG9uZSBtZW1vcnkgY2xhc3MgdG8gYW5vdGhlciwgZ2l2ZW4gaW4gdGhl
DQo+IHBsYWNlbWVudCBsaXN0Lg0KPiArICoNCj4gKyAqIFdpdGggcGxhY2VtZW50IHByZWZlcmVu
Y2UgbGlzdCwgdXNlcnBhY2UgY2FuJ3QgYmUgc3VyZSBhYm91dCB0aGUNCj4gb2JqZWN0J3MgbWVt
b3J5DQo+ICsgKiByZXNpZGVuY2UuDQo+ICsgKg0KPiArICogRmxhdC1DQ1MgY29tcHJlc3Npb24g
aXMgc3VwcG9ydGVkIG9ubHkgZm9yIG9iamVjdHMgb2YNCj4gSTkxNV9NRU1PUllfQ0xBU1NfREVW
SUNFLg0KPiArICogSWYgdGhlIG9iamVjdCBoYXMgb3RoZXIgcGxhY2VtZW50IHByZWZlcmVuY2Vz
LCBhbmQgaWYgdGhlIGNvbnRlbnQNCj4gaXMNCj4gKyAqIG1pZ3JhdGVkIChieSBrZXJuZWwgZHVl
IHRvIG1lbW9yeSBjb25zdHJhaW4pIHRvIGEgbWVtb3J5IGNsYXNzDQo+IHdoaWNoIGlzIG90aGVy
DQo+ICsgKiB0aGFuIEk5MTVfTUVNT1JZX0NMQVNTX0RFVklDRSwgb2JqZWN0IGNvbnRlbnQgd2ls
bCBiZQ0KPiBkZWNvbXByZXNzZWQgYnkga2VybmVsLg0KPiArICogVXNlcnBhY2Ugd2lsbCBiZSBp
Z25vcmFudCBvZiB0aGlzIEZsYXQtQ0NTIHN0YXRlIGNoYW5nZS4NCg0KU2FtZSBxdWVzdGlvbiBo
ZXJlIGFzIGZvciBwcmV2aW91cyBjb21taXQuDQoNCg0KDQo+IMKgICovDQo+IMKgc3RydWN0IGRy
bV9pOTE1X2dlbV9jcmVhdGVfZXh0X21lbW9yeV9yZWdpb25zIHsNCj4gwqDCoMKgwqDCoMKgwqDC
oC8qKiBAYmFzZTogRXh0ZW5zaW9uIGxpbmsuIFNlZSBzdHJ1Y3QgaTkxNV91c2VyX2V4dGVuc2lv
bi4gKi8NCg0K
