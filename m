Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C923A5081CC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06A810F1E1;
	Wed, 20 Apr 2022 07:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F7810F1E1;
 Wed, 20 Apr 2022 07:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650438762; x=1681974762;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J2hbAWwfQHwGOxoHf/BEl4ILJ4Ba36KC/BeyA0tiCwY=;
 b=UO5SMd9bHBJ+EirCJj0QuYZkhIZ5rSf7gUCNr6ex4RFe2pYJviaHgbrd
 0DyC0KlvE0zrGT2V+4JT907QoO2rlJJsFsPejsVTJknX1JkhSRydsAKy5
 Zf5hH0BZW+tsQJq2MfKF2A5KdhOtLmCrEeFNA+1qyaBeJjvg/fD1AMn63
 3oBKe2k4VwwaDThpr7pbDDrdYmg6Fp39PGbqOO0qjKilfl48OUktUjQoa
 9e0rA4Z/HjOBxRJHXbghl9so3eLUHGfXp5nuYRJjrA6oIXTY78yhtnwEi
 NCEaVQh2fIM6OQjdydZrU86BBCdW6FiJ3VUdmoYINXr/rhrJoiibSOEQU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="245853045"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="245853045"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 00:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="555073232"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2022 00:12:41 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 00:12:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 00:12:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 20 Apr 2022 00:12:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Apr 2022 00:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTtm4apcAXSBNK0gcxbOfmyVaREi4wiDqcEQiIgwwQvtTvQrSUKJniVlDl6+kMZwdtsXMzW4qn1TaPETYEd9Q7xLdsYgcygralefXnhdMK2OkA7EPIMT3z7cwPKuAt3UJnIJ5QJrfWZ8dF5vykev9GvkU2sBYXiqIcrc7L6yRixT9w/IP3mq+dDoxcpTYFh9BudIMOLAcaBL/UcM1NqhNmQ5brV++K32XPmWvVe3f/p2qvtSNUHwaMdqBXtLuNoKdMrRW/kJegkVy6w0UoihIWG6lkBndj1JgQXW1gDpVj7SsdaWflf9TRoFBfdEd3gPgUJP5evOJ275TKOfrDipIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2hbAWwfQHwGOxoHf/BEl4ILJ4Ba36KC/BeyA0tiCwY=;
 b=RfL/x2Ca+9zDaSlABg12QLEam6dxHzmEGwTgx/y6TQwE99yIW9QqdEDuNo+Ux69UxSxLY6YTACUXd4oCBrQNLDilgbt16YTu01Gs8eAnxvs7IN5qoUCMJvVfJzLyR7EaNAZG6JZ2EJaH5TWosOJrCwj851mh6pwyVXU+2k1KMSUptTBieUEZnuhJw3qesqkkBwNLnKWgiQPlphqYQp1dJ/ecRS0kve5TFdpMmXZkHXzcKZO2DxOF/AvUqQQaMxeke45al3tRCzorRl73n6k5IfDN4OeOvMSAsjuFKyMkIXZ7BBaUAt0HHPVyRtcjRbYQGU/JwBRrv5qyFcZP5htDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 07:12:34 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 07:12:34 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Topic: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Index: AQHYTa50HopuXX46aU+QxtIWwnq/0azt3o0AgAAhbQCAAANggIAAeVIAgAACNICAANnfgIAAFJ2AgAABmoCAAADigIAAC82AgAADvoCACO/9AIAAAUWA
Date: Wed, 20 Apr 2022 07:12:34 +0000
Message-ID: <057c2f27-2940-3a3f-2091-83f6d9ce2162@intel.com>
References: <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com> <87ilrbeqbo.fsf@intel.com>
 <20220414134321.GD2120790@nvidia.com>
 <abc0a953-8527-ba25-9987-d2f1284a7430@intel.com>
 <20220414143859.GE368031@nvidia.com> <20220420070800.GB4417@lst.de>
In-Reply-To: <20220420070800.GB4417@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73414b9e-61b6-42e5-651b-08da229d2471
x-ms-traffictypediagnostic: SA2PR11MB4956:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SA2PR11MB49566CB4B2CE820D1947CCF8CAF59@SA2PR11MB4956.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tvIXRnOPGQ7J68vjlCsn6atAcjN/o8VorkVPWy5EVVwiDbcUYyAhScba3ZsO+7IOHART7hQ9RKqyoiDYgNq2zQQGDCqbW4N8ytZg0UKU3EgpQQbqjqr5ztLB9pLRlhWENcTGGiN7lGf8hce/NGoFwtT/tdKd4Or9bTPaDfyhogauyBIc/13pobx6fnFDNJzIRT7X6aQ9QL32Ivse30dVFOmdSJ7DkDzrhyNU8dmAHK95VflsPLBbUxzGGerW7afKEJ3vO6Uowmwsi4HFJl0RvlgXT4zFUGo/z/wloCjnAlPISjkF5jjLhrIFX/jBcslNki17PB0pZXjTSVhKAzC9ytK7EgE7vB6dgaM0D/D7yNEkqKFwrWtgiN86JXtA4HM7EQxJzLKHosI28+S/9euEugLgrgLelCfr/mHGgQkW22F65QxpxDqKI45QEpN+JlKl6l5u4+sJRDL8pSSH1cbOtULCM8ZGMRKhHlhjIcHCejeg0JOlK7a5a5Yo+axOpbJbK9cZgE9V5K5MHz27T4NNIds8Q3NsCf5s3K6bCuUSfbY4qNIM/wqX5w/APejy7fWwB7fjNTtEsGeNnmVWRYREvB2bUAXPjsREJGzHhrBMDrQQscuE07sQDFyOxqRqUnnRwazQDkwBLwtzNYix8+Q+uiypc2hPP5SE/RwRUbHnJiEDt8yK80d9DgCrF42XxpN0gDUZZrIi5293FrEBSKgGM6QVCCK5AZOhS3QgR1aToQmymdO907WORdgoiiYr9vHchbwtCmaqnZFPCRe5AqQOqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(2616005)(38100700002)(186003)(122000001)(83380400001)(66946007)(110136005)(6486002)(86362001)(66556008)(31696002)(71200400001)(38070700005)(5660300002)(4326008)(8676002)(76116006)(66574015)(66476007)(64756008)(91956017)(31686004)(66446008)(508600001)(316002)(54906003)(6506007)(82960400001)(53546011)(8936002)(36756003)(6512007)(7416002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0paSlhtUzI2R2pMclBtZnM2dEQyVERRdXVhcjJPNlpmNEpxeXh6dHRVTktH?=
 =?utf-8?B?MjA0QWh6QWZPT2htRVdCOGRHZVcxT3JQOU5Ob2UvSjZRMk9DSlcyOGF1MzdY?=
 =?utf-8?B?djBoRHBub0gvNU9UeGVzZFp6dW83QXR3aTY0UE1yanA0ZE1kN3pabjhrOE5T?=
 =?utf-8?B?bUMvb2ROVDlwWnYrbXRnZERIa3lobHh4L2J3OUt3dUdNVWpkcGJzckw4S0JK?=
 =?utf-8?B?c3JHVm5FUGQ4Nkt5S1AwUVpQalRLL3ZvV2dKTUNFNk16RndEdmUzck1rVUpP?=
 =?utf-8?B?Qkd2bmJ5U2kxRG5WL1MwZEJUdjJrSG5ieFNNbE91UEZ3RGFGaG83My9rY3hR?=
 =?utf-8?B?R2s3QmpUL1B4TzFGSjhTaUgzQTB1bml2Y0pWcitIb0dvR0UwclY3V29WS1c3?=
 =?utf-8?B?Yit1Vnd3WUpkS0RiU1c0aUwvMjNOVlRDZU1BdHlxVkFMemVSbXBqbTFMdTZ0?=
 =?utf-8?B?UFVNM2VKSjFJNHVtWnZYQ0VwMWd3RlR3USt3MnRWVUVtL1RxcGNtM3ZkdEdt?=
 =?utf-8?B?WDMwSjYreTY4VVIvMXNWVk5Wc05kNGhGUC9tWEVDTHhtcUdlRWtTSmJ0V2M4?=
 =?utf-8?B?aGx1dFRPaGpobVBJUUpVVTk4VUVnSGxGampUa3RjdXZ0Q25GTVk1dXJmVU41?=
 =?utf-8?B?dUgwdWRtUnZwY09kM1hmL1VjbnhxVUdBSGZydytpTHR3dXRpZWt3eHF0Ukg3?=
 =?utf-8?B?UUxjZnRsZVM1OFJnc1Nlb3VtZldjekNwNkdoQS8xVlhNaUNZZWd1cXpRVVBV?=
 =?utf-8?B?YWZQOUpPK3B5akR4WDBtNitKUGhsOXg1Qi9yVVozc0gzK2MwdzJZNk1zb00w?=
 =?utf-8?B?bTYxVUw0L1RrZkZFU2o2WjE3YlpLNmRnNlBiRjc0VlcxM2NTOWo1LzYxeXFR?=
 =?utf-8?B?ald4ME1ySzd5Uno2VFpBQ29DL3NVd2dPaFpWQlNlM2lycGNnK0hiVlhhbmJk?=
 =?utf-8?B?QjEzbkhCeWZtSnBMcHNETi9lUnpsMlorRzZNUDFRTzc1Tlk0U3pqQXhHbTRh?=
 =?utf-8?B?NWlSMXZXOW10WnlYV0pLMXRoZXpUL1YraW8vR2FpN01mSGpMT3I0QUdFVE95?=
 =?utf-8?B?d0FFcnlkOVQvdVFIcVYwZmpETUJtU2luMjNsT2dEZ1R2cmh5Y2QxMzVEam5F?=
 =?utf-8?B?S0xYM2pxVVUzZVhsTDgzWUZMa2NsdThaY1VvSVNlWTJLK05tMTVqWXVBaFNM?=
 =?utf-8?B?Qk1TNkpORVpxczl1VHl4Y0ZmNUJwY3lCOTB1OGhuZmhhZmpBeGxONnB6Y2R2?=
 =?utf-8?B?TzA3UTlCVUZpRlV0R1dIMFVrbjF3OXFvTW1USDRPNFloYmV5VEFYMnNITFB4?=
 =?utf-8?B?M21pRENaWGFOV2N3RzVqSVQ0d3RiTDF4UkNPcWc4dVM3UTNSS3pZZDJyMzBO?=
 =?utf-8?B?MWluUU1pcVVsajZOQmJIRXBMRTJoTUg1WWk2QkZIcC9uREVGLzF4RStBTVFS?=
 =?utf-8?B?VlNDSDVEdnowWER5aEhhWmliM3JySWNGL0xoU01IUHgvVzBSTy9IVEdLdmFr?=
 =?utf-8?B?RjNjaHd4aVQzc2pBbS9CQU9XQU9OUmNpcmhsajgrSk1oRTFGZ003aUsrN3NZ?=
 =?utf-8?B?dGtSNTIxcUxhTmxLWTFZaHN0NFBWRkh5NmRINWc1aXVoeWtLRzVTeHhQT1ZH?=
 =?utf-8?B?VE9VTERMRG5sMXJNZFhHVmd4SEZYMmlJWkQrUTZKOWlwRDlyOTQ1UEhzWnVP?=
 =?utf-8?B?SWVWTk9pakFGRnYrOHRVdk94OXZReVlQRDdPTjVpeTZnTVNhQnhQVnVoNm1n?=
 =?utf-8?B?Z2k2ODdHNmNqNkFxU0J3cjh1TWpoMXYwT1FQbzV6dGN3S2c3YzVNL0k2dDVv?=
 =?utf-8?B?SDNxT3JKT3hJRG94ODRBdG84MktoNkEvZDFjcG04MHZrTUZSMm1yYVo5UEh1?=
 =?utf-8?B?OFg1NG1kLzVYWnBjQjJPWDVPczZlM2RzMlVWaktQV3RTcVZ3Qi9DNWovTHIy?=
 =?utf-8?B?QVFwa1FsQTYrU3pnbjNFWkJzUE5hMWg4M2dpbXNIN05XZVRnN3NtYXhjY1dq?=
 =?utf-8?B?VDgzN2hkZXJkSU9nbXgzZkNzY1I4NmUrWC9JZEQ4SFRtdDJIWTVHY1hRaEZK?=
 =?utf-8?B?Mml5R1hOcHVDN3hveUlMSThGanRIMkFrN3RacHlTS3ZJc0RWMU5LelAwbStY?=
 =?utf-8?B?Z3QySXg3VmtmYzBIQnIxbm02VTY1NytBZzRHYlQ0amFYN2IzTzNkcjBLcmJC?=
 =?utf-8?B?M1FrbWtSNkVuNHV5NjVFMVRZb3phUmFPRnA4bEp3azh0NDdVdklzNkRGbzlp?=
 =?utf-8?B?M1JHdmtqUjFDK1NlK3d2bUV0eGNEUUxrQWI5QXpvUTNFOXoySExuUk50VnYv?=
 =?utf-8?B?UlViVXgrNDgrbUkrYXJWTnBhY1ZhS2NUeTNQQUIyRjUxZjVhazIrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E8F4EC8DFF7714A8C02A709F7FF1794@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73414b9e-61b6-42e5-651b-08da229d2471
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 07:12:34.2342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9vzOVljYXmdiFFuVQmRWSMtFeeR7ObvauQf9PVfVIbDWKAuicSqy1vcTXAy/ylz8nl5wP/3qAFUm//XsHsoWyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC8yMC8yMiA3OjA4IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gT24gVGh1LCBB
cHIgMTQsIDIwMjIgYXQgMTE6Mzg6NTlBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0K
Pj4gcHVsbCByZXF1ZXN0cyBjYW4gZmxvdyB0aHJvdWdoIG1vcmUgdGhhbiBvbmUgdHJlZSBjb25j
dXJyZW50bHkuIFRoZQ0KPj4gcHVycG9zZSBvZiB0aGUgdG9waWMgYnJhbmNoIGlzIHRvIGFsbG93
IGFsbCB0aGUgY29tbWl0cyB0byBiZSBpbiBhbGwNCj4+IHRoZSB0cmVlcyB0aGV5IG5lZWQgdG8g
YmUgaW4gYXQgb25jZS4NCj4+DQo+PiBTbyB5b3Ugc2hvdWxkIHNlbmQgdGhpcyBicmFuY2ggYXMg
YSBQUiB0byB0aGUgbmV4dCBsb2dpY2FsIHVwc3RyZWFtDQo+PiB0cmVlIGd2dCBwYXRjaGVzIG5v
cm1hbGx5IGdvIHRocm91Z2gsIGluIHRoZSB1c3VhbCB3YXkgdGhhdCB5b3Ugc2VuZA0KPj4gUFJz
LiBFc3BlY2lhbGx5IGluIHRoaXMgY2FzZSB3aGVyZSB0aGVyZSBpcyBhIHNtYWxsIG1lcmdlIGNv
bmZsaWN0DQo+PiBpbnRlcm5hbCB0byBEUk0gdG8gcmVzb2x2ZS4gSSdtIGFzc3VtaW5nIHRoaXMg
aXMgdGhlIGRybS1pbnRlbC1uZXh0DQo+PiB0cmVlPw0KPj4NCj4+IE9uY2UgRFJNIGlzIGludGVy
bmFsbHkgaGFwcHkgdGhlbiBWRklPIGNhbiBtZXJnZSBpdCBhcyB3ZWxsLiBZb3UgY2FuDQo+PiB2
aWV3IFZGSU8gYXMgdGhlIHNlY29uZGFyeSBwYXRoIHRvIExpbnVzLCBEUk0gYXMgcHJpbWFyeS4g
QWxleCB3aWxsDQo+PiBtZW50aW9uIGluIGhpcyBwdWxsIHJlcXVlc3QgdGhhdCBWRklPIGhhcyBh
ICdzaGFyZWQgYnJhbmNoIHdpdGggRFJNDQo+PiBmb3IgZ3Z0Jy4NCj4gDQo+IFdoZXJlIGRvIHdl
IHN0YW5kIGhlcmU/ICBUaGUgKHNvbWV3aGF0IG1pc25hbWVkKSB0b3BpYy9mb3ItY2hyaXN0b3Bo
DQo+IGJyYW5jaCBsb29rcyBmaW5lIHRvIG1lIG5vdyBleGNlcHQgZm9yIHRoZSBt0ZZzc2luZyAi
c3RhdGljIGlubGluZSIgb24NCj4gdGhlIGludGVsX2d2dF9pdGVyYXRlX21taW9fdGFibGUgc3R1
Yi4NCj4gDQo+IFdoZW4gY2FuIHdlIGV4cGVjdCBpdCBpbiB0aGUgaTkxNSB0cmVlIGFuZCBsaW51
eC1uZXh0Pw0KPiANClF1ciBRQSBmaW5pc2hlZCB0aGUgdGVzdCB5ZXN0ZXJkYXkgYW5kIEkganVz
dCBtYWRlIGEgdGFnLiBUaGUgcHVsbA0KcmVxdWVzdCBpcyBnb2luZyB0byBiZSBzZW50IHRvZGF5
LiBZZXMsIEkgd2lsbCBmaXggdGhhdC4NCg0KVGhhbmtzLA0KWmhpLg0K
