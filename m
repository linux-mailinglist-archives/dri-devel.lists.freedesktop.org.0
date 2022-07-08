Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1CC56BAD4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32A6113C8A;
	Fri,  8 Jul 2022 13:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3F3113C86;
 Fri,  8 Jul 2022 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657287250; x=1688823250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u3EMweNVvnicXBE3W12uS+fN/o+HWEO+ZA3pt2mYZVA=;
 b=kI2e90cWb1FWZtgQ0esYo9wsgX0wnJTc2E1y2QMpqPFoboqfzUUudsSB
 xIZ7oQTYlSV2Z8eIcygLEww8DgLfa1OILNyJsA/76F2wXVwId4eDdllFV
 6MCHA+Crb7vI6ea48Moohfwa1a6Wf5A9kyDQ9y2Xovln0HRIMJEqmQphu
 tjKetQgYAzJDhltI3wMyiDG7uLLKgoUQ9KWmSCICPX5aMqWW7GkgWp/s4
 hoIlztbueJkHCm6ty3HlGVpugfUWA/j/EStkOQhufnISOTsVAxxqDfW0J
 kTbelgHHPaJcWg5iYEgiQmmj5dZa27E+po1GQc/Oc9V8/laMeAZ+b7DOG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="283031176"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="283031176"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="598372450"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jul 2022 06:34:09 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 06:34:09 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 06:34:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 06:34:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 06:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiX9yzZViF7y76LPQq5ySi1mNUCsKbJGP4aaYY+6twWxW0j04BFlzQizkmGelNUcQrZpiTsK+/q2W9KfWuxr9PYTqyinV9F9lYWJvLJynDVJFNm9NSEd+vCP8U3yJpNAp0bl+Nu4MbqBOsDja2Z7q3DouCJzru436KoIm9g5y5br8Boc2ft8HBgsnoaUXZnWnSRXvH1RX8j+wV5i+DMxjpy1mbwRIaUs1FYxdzQYiWrKlkaZK7rj6w64i5mvKtvkQy6c9TGQ7kS8r5PuuZNJdrqfzDTIChePTlNo7He3X3qsfm2ME7SzimYD6eLY1rNoVwMhofuM9AJqN56zcSBqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3EMweNVvnicXBE3W12uS+fN/o+HWEO+ZA3pt2mYZVA=;
 b=AOugk+Q4rFmEZnjWeqLOaDc6knndrSG6tT0VCnXSnDUxP3tWkCy/PueCjgPMdK2uJPtS5UHZNCx8jxqGSYm6AXmCY21a1L8KhR79d2aUnMMJtpw+FBvEGd2WnfiflC6st1DWyRspewdIjjFL0OKZSf9DTZ3t+WOIh2P3rJ3L0l97uW8FlP0v8J0I9yqYYwk0pmXFlxXlhjr0j5Rl8ctB2hccRTeo4aV3/HsDPl8KFAsGTdxppdcC2TAy4BjNUXIASF7G9tsM+n9X+W74w+qPcTbqy6HcNQEOoFrpZDREEPr4cWTxEntZGO1FVpKq9pVU9rtPDG9lSgY0nzg+IRKvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 MW3PR11MB4650.namprd11.prod.outlook.com (2603:10b6:303:54::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.17; Fri, 8 Jul 2022 13:34:06 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9%11]) with mapi id 15.20.5417.021; Fri, 8 Jul 2022
 13:34:06 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 2/6] drm/amdgpu: audit bo->resource usage
Thread-Topic: [Intel-gfx] [PATCH 2/6] drm/amdgpu: audit bo->resource usage
Thread-Index: AQHYkevwVycaDbA6RUmWWa6U4ewXfq10etmA
Date: Fri, 8 Jul 2022 13:34:05 +0000
Message-ID: <DM5PR11MB1324A53FD216A5CEC0FAFE88C1829@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
 <20220707102453.3633-3-christian.koenig@amd.com>
In-Reply-To: <20220707102453.3633-3-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3449a2eb-b508-4ef2-8a3a-08da60e6878f
x-ms-traffictypediagnostic: MW3PR11MB4650:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0HoZGIdO5t2hwd97flzWPSBUMlYVX9CmHRq/7PbJTaZCXxEyflZ6GU5r7fg1sWyd2/E7k94nN47cPNCMlUtx9TMSbEiwNo/KKBFVaivk05mlS+zbGnFZVmu3Nb5o1NLDKcWlGCITcnxLIfORwut4u/GTXIqjE7V7DcR0yGkr64G5s06jkx1FFD2FpDkL+wxbixJp07e/RVDKNB9ROMefPRKayJIi6EfOq9PrBkfAe2fEKuR4u1QGnUIUdlY4O7H2/O7m1e/n2udiKFU1/01R8+Db+uW3EoXMFMcb/1R3jJUbaGgU6j+x9+U3R9FCQOdNSkNJapfe8uAeqbm3bgdAe9NeLmYVPqrBV3i3OdSsUKB0ysh3r9hYdXheFJoXUZVIW4kFvbfuykj1/4O5sbD0I/sChHLQbr7jkSKaIA88PV0FukGz6Bf2qqKt1zbffrUwz6G3KkHmPfZPUKEgyFjq6nbmyGvo5sEQ5fzn4POxTOQQxZ0kEdKTu+aCfLOWjHZRMRkWmQbc3d3DrAJR9rcHm3gDkDmR4ISLoC3Zs5LP2mRd70PA86Zi8rnbwfkvJKBhG1GblF3goJJ9bwhcVogFkINfdDAlfj3QFnxhdy/Ou+GCLBQ/XgeWUcn45Tv8PKUHHw2QHzAKpfZbxZztJynmh/Lutt8FRQTkl1UWfS56VE9P3b+bpIgLTKqmvcPhw+U+G5mqDT4vT/exUw3zZALavt9eDPSpVN9q7aaW9OJCwMPcajLEAy6cPmFEJ+3clxXTiEMM7wyK/xcZr9FcGOWph8voGrqc20+o7DtT8oVJUx8K+7fvoPUmUpLFhV2jZw7G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(39860400002)(376002)(366004)(478600001)(186003)(83380400001)(64756008)(66446008)(55016003)(71200400001)(4326008)(110136005)(8676002)(66556008)(66946007)(76116006)(82960400001)(66574015)(8936002)(26005)(122000001)(38100700002)(9686003)(52536014)(5660300002)(316002)(33656002)(38070700005)(2906002)(6506007)(86362001)(66476007)(41300700001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1ZydGtOc1ZCdlFITVVjVFp2NFhsbEkxeGZQUWk2dTZCN0lFVUVLWjJzUy9R?=
 =?utf-8?B?b1VORzZZZkUwa0VsSDltMElwV3hnbjNaOUtIRFdDUFJGbUx1T2sxMkpqN0pT?=
 =?utf-8?B?enJWa095aW8wVnNXYnI5c0JWdmw4dlNYZ0hSUHMwR2ZSeHdtblVwWnJ0TjAy?=
 =?utf-8?B?SzVNeDhJbHVXZitMaXFvSzZLWUpJRFpRMzJJSExhaHUxZjBkNk9YTEFzTEtF?=
 =?utf-8?B?RFJWek9nOG4zaVRNZHByeDc4ZlNRck5aVDRVV1BqbmlLL0dLN1BicXBFcy9u?=
 =?utf-8?B?NlJtWllycVd0V0hyb2FPcWNhNktpb1A3WlM2TzZ1VXp3SGdQWXBhYlUza0cz?=
 =?utf-8?B?ajZXSjIyTC85QndRcTlSUkF3L1c0OWJMVS9DSmZ2VmM5UndERGtCRkprSlZO?=
 =?utf-8?B?clZHaElCeXg5UUtqTlNKY0tyalYvdktMZTl4ZVVmMWdIdVhTWkZiVzVFY0ov?=
 =?utf-8?B?YzZRY2pEM1ljaDVNSEhJaXY0R2JESy8xZU5pejlWaStyUWlTM3J4Rk9WQW11?=
 =?utf-8?B?dHRNVWt2OUxhNmRrMWdTeGJwcjcyaXhHT0lCTzZRVXlYQ1NCamhXZ2w0YkNK?=
 =?utf-8?B?K0NONzRRQU1xRUxuVnpHQ1BBRHR1VGFzMHJHVzJiUzBCVDVNTFVCc3M5VVRG?=
 =?utf-8?B?M3FJNERwQ1ZsTWF0d2FsbDVKbkZyMGwzZXpFWWkvam51a1Zwckd1c1JPRjJM?=
 =?utf-8?B?RUhIWlVBZ2dFOGtmQ2Q0Z3VySngzV1dLOC9tS01WRm1XMGJMc2pRd0FHRkw5?=
 =?utf-8?B?aTVKSE9hTytXZGV0WTkyb05BcTFvbmZmdGQ2M1QyUVNwZ1J0czJUL0gwbnBV?=
 =?utf-8?B?dW5RSHUzMW5pUmZST0NOVmVubFpib1JRbXhGWnZ2Vk9RM3VVaTcvS3d3aCto?=
 =?utf-8?B?dGg3bFZvNHB3RGRvWkZobHo2VnJ3djBRTlB3YWUrT1pZcW5VMGhkRFdPdWtO?=
 =?utf-8?B?cldQU2M3WUFWRzM1eUxwUks2SFVhVXZBNk5oWjZZUDlZZHU1UFgzYUdEZitv?=
 =?utf-8?B?S3hxWmtSa3lXYjdjWGtxV20yZmhwWlQ5SEtkUXRHVjBXL1JWditZK3VjNFZN?=
 =?utf-8?B?TG5Ucks4K0puWHBmN25acVpURWlnN0J4NjQxamlTSXR2TkN6ekRxa1VYMkdn?=
 =?utf-8?B?STZGOWUxNVgzT2ZXbE51VHVzMVBianhzaW5yNS81cVl0d3g4bjNTQ0YvT0hG?=
 =?utf-8?B?T3FGdTlWR2NyZjRpa2ZibkNJSzRPY2JoWk45MlRuY2hsajJrVTQxbS9IRjJl?=
 =?utf-8?B?Z0g4dTFGd3VYdUMyaDdBbVdzSi9iQVBkcWVTMys1cWZ4ck9kQmFQUU5Pd1Zm?=
 =?utf-8?B?QytwNGhoZFRDK0VEQnF4d0lEcmpzcms0c2lZL0QvK2MvNklzYk1xYU9hMTl0?=
 =?utf-8?B?dGc0L3FmMXdPeDBuRkE0dWhSZXV0Tlo2cUkxWUFGbEdqSDc4WHBHQ2xCRm1S?=
 =?utf-8?B?L2Y5dmM1ZmlvQ0g3YVJJbWtUQ2V1aCtoODFWeGxPUUpscm5BNHRhTGdxR2lF?=
 =?utf-8?B?REFKQkVsd0xPMG1wZ2dyUTVHNFpnekVPU1BSN29DM0VUMTVVSzRlUHNPRUd3?=
 =?utf-8?B?OHhUWm9oV0xDZEZzelVLc1plVS92aDBjZ3JJV2lhYUNsL1g3TlEyT2x6Q1Zx?=
 =?utf-8?B?ZXhnem5neG1zdkNxaHlHT1pYT0F4RWFsV3YrUnhTQVhUa0ZLRDQ1RElObkNQ?=
 =?utf-8?B?T0NvbVVyQzFNd29aUm9sTHFIcjBVMWdaTnM1SGNqMzh1TjNMdFVZcmYxcnpw?=
 =?utf-8?B?M1dvWklYM3Z1eHNVdStMWG00UllDMVU3TmZ0RDdZYkk0R1JxQ2hFMGs3ZjlR?=
 =?utf-8?B?bGJOQXU5d0x5R1JTVkVUZFRibXI5RCt5UkRhaDd5NjF1M3VFb0ZLdkcyMkJn?=
 =?utf-8?B?QlY3RzRvb3RvOG9rYS8wWW9VU1NXLzl3WUlobCsyVmVCWHl4VGFGRTZGSGZK?=
 =?utf-8?B?amEyZVJqdUFOeG1hd3pqMHpqaU90LzhEWGZsV290dFJOTDBLVkdXaTh1a09L?=
 =?utf-8?B?N0o4Unp1RUptYUFTeGdsK3BQOWVsMGMvRHd2VzBjNERUY29UN2F6ZjV6bSt4?=
 =?utf-8?B?cUV5SGlxMkdCeVc1cHRLVi9nZUVMMFo3dXhrMUQ5V3p0eEN4eE1RdmFvbHF0?=
 =?utf-8?Q?ykqU+rWOV+gbtiJLVleyOsQ3t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3449a2eb-b508-4ef2-8a3a-08da60e6878f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 13:34:05.8797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nQeLgBCQkZc9UOct9sxH99Pm6sSMwvImdhT6A5K3ZgY+RY18UTGirjV0IT6A4+1Au57nCNEgmWAgv7a/BMBHN/notbqZS/WkK7yJBxCizQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4650
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1nZngt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgSnVseSA3LCAyMDIyIDY6MjUgQU0NCj5UbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsNCj5ub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj5DYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPlN1YmplY3Q6IFtJbnRlbC1nZnhdIFtQQVRDSCAyLzZdIGRybS9hbWRncHU6IGF1ZGl0IGJv
LT5yZXNvdXJjZSB1c2FnZQ0KPg0KPk1ha2Ugc3VyZSB3ZSBjYW4gYXQgbGVhc3QgbW92ZSBhbmQg
cmVsZWFzZSBCT3Mgd2l0aG91dCBiYWNraW5nIHN0b3JlLg0KPg0KPlNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KDQpNDQoNCj4tLS0N
Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgMiArLQ0KPiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgfCAzICsrLQ0KPiAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+Yi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMNCj5pbmRleCBkOWNmZTI1OWYy
YTkuLjY3N2QxZGZhYjM3ZiAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfb2JqZWN0LmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmMNCj5AQCAtMTMwNSw3ICsxMzA1LDcgQEAgdm9pZCBhbWRncHVfYm9fcmVsZWFz
ZV9ub3RpZnkoc3RydWN0DQo+dHRtX2J1ZmZlcl9vYmplY3QgKmJvKQ0KPiAJaWYgKGJvLT5iYXNl
LnJlc3YgPT0gJmJvLT5iYXNlLl9yZXN2KQ0KPiAJCWFtZGdwdV9hbWRrZmRfcmVtb3ZlX2ZlbmNl
X29uX3B0X3BkX2JvcyhhYm8pOw0KPg0KPi0JaWYgKGJvLT5yZXNvdXJjZS0+bWVtX3R5cGUgIT0g
VFRNX1BMX1ZSQU0gfHwNCj4rCWlmICghYm8tPnJlc291cmNlIHx8IGJvLT5yZXNvdXJjZS0+bWVt
X3R5cGUgIT0gVFRNX1BMX1ZSQU0gfHwNCj4gCSAgICAhKGFiby0+ZmxhZ3MgJg0KPkFNREdQVV9H
RU1fQ1JFQVRFX1ZSQU1fV0lQRV9PTl9SRUxFQVNFKSB8fA0KPiAJICAgIGFkZXYtPmluX3N1c3Bl
bmQgfHwgYWRldi0+c2h1dGRvd24pDQo+IAkJcmV0dXJuOw0KPmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYw0KPmluZGV4IGJlNmY3NmEzMGFjNi4uM2JkZGYyNjZlOGI1IDEw
MDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPkBAIC00NzEsNyAr
NDcxLDggQEAgc3RhdGljIGludCBhbWRncHVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QNCj4qYm8sIGJvb2wgZXZpY3QsDQo+DQo+IAlhZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT5i
ZGV2KTsNCj4NCj4tCWlmIChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYmIGJv
LT50dG0gPT0gTlVMTCkgew0KPisJaWYgKCFvbGRfbWVtIHx8IChvbGRfbWVtLT5tZW1fdHlwZSA9
PSBUVE1fUExfU1lTVEVNICYmDQo+KwkJCSBiby0+dHRtID09IE5VTEwpKSB7DQo+IAkJdHRtX2Jv
X21vdmVfbnVsbChibywgbmV3X21lbSk7DQo+IAkJZ290byBvdXQ7DQo+IAl9DQo+LS0NCj4yLjI1
LjENCg0K
