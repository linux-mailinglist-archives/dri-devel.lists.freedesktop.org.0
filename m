Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1037FFFE9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 01:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8601110E58D;
	Fri,  1 Dec 2023 00:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3477A10E58D;
 Fri,  1 Dec 2023 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701389465; x=1732925465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZrdSjH8Q+1tAXymQ26P3qJsgff/tPM4751L79gPeOmY=;
 b=bZPtoMr1gTnypawYbSkzSmHMguhOVEgxA6DCC5N3kN/aVQq5I2A4l1/9
 L9QvKBWSUoHo63osFTj8qJS/hNlujZWP2k59GAqjK8F52LV31dpMh1FqJ
 OIqQVXTvlGjEiMuo1Zs73zSN+x2B5SMByn7zGajgLY8cI2JzyP+vTsbwB
 L0eK+zGhVrjOEQAuX0ul7SbGtA910SejWM0bgQrmnvGc0AXglhfsStzH3
 ApDiEV/qq1oapSD8/68jLBscUnDLrrJcwOJdWuFtx/VYtPYajKSNX0iud
 bagDNLrXPy9uodJmRI3eECD76tKBl+yqPkb3Nsh1GdJ97pRrKRFHPPWdV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="390575896"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="390575896"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 16:11:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942889637"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="942889637"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 16:11:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 16:11:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 16:11:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 16:11:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0BaPGM9pA/EI5v5pIJCixZBBhVpfRBqRbCgB6YqEkmIyLuir2/LdceZPzUkM9uOAwXu5s+H2/M68UsOrZwTv43RH8f8tuSlbc2Q43WDMNj8njOW9SmrG0F4Te3jmQF/2eYfYTjKPLk/k5UEG0a/qU7itbG+mxgsqwqKEmY7HqJj0GFaR41dBaCIl2fbNsuwAUcOWYRtEmmmEKNOiTxxIUd42fG4G5oFVcm6lwzPw3GCz3PKDOnpce/mXIaYeCMpfd0Im+mhbtHCxKE4//2UcaESwW1yF+Y6t/Hyod0jobGxnc4U4AP0myi746VNd6IDWw6197wV5j80jT143Pz9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrdSjH8Q+1tAXymQ26P3qJsgff/tPM4751L79gPeOmY=;
 b=IzQ0OGTv6o9jyxouBaHcRRuwa3acPwssjgUJCY6kQrJ02prT5mtUto7gWcHVS0Jew7yU/3NHFStdr8UBXbH6BwBlsSW8BkgQid2r2BXo3VEaNDgKuil0VNpiK8UKM7NAbKPK9ujWP2CtmvAwxeRwxIixBen8ViCnJFTzh3RaaWlculmzIdvMxNL6yD6RrxQqfKT2uSPP8jsEEQb6ZszxGQ/Wz0QceDaS35hKdGSL5dLA52hlZglaaA9OyIIf7ZS2HQlGeQoN/sLMWG75BRy/b6ZtKBMq6517zggJPh6FRgp/URYiB6Sr9gMMi0foZbXRSUhnffXgHQldBK+6CEzLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 00:11:01 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 00:10:58 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v7 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v7 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHaIyMGCPwXl+IawE6taRBTjJUlpbCTXz0AgAAvqYCAAACKgA==
Date: Fri, 1 Dec 2023 00:10:58 +0000
Message-ID: <ce76d74bdd99d328eca5689ea5815fbb3a689ee6.camel@intel.com>
References: <20231130002013.282804-1-alan.previn.teres.alexis@intel.com>
 <20231130002013.282804-3-alan.previn.teres.alexis@intel.com>
 <ZWj8Ig7tzXLHZbSv@intel.com>
 <79897b361b09274efff9ee010fe9074d66f56bd8.camel@intel.com>
In-Reply-To: <79897b361b09274efff9ee010fe9074d66f56bd8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH3PR11MB7369:EE_
x-ms-office365-filtering-correlation-id: 3f90abb7-89ea-494d-7615-08dbf201fecb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fEyf706XLK99IOeajGzxthcaeOS9H3Ox09ISnx4+M05SVrtewsKKihxQqMNvx3GRXbPsg++H+wkc2QE2JwxEk6QBW/7y4kVUK0P/k9KzDVi8HeOqHvEXBkwMjRO/gnaFVEympT0o8yfwIlocrZqfQ4j0QA9eDFg1nufTLwWfQMB6kByuJafPNuZ7HVKBMok23pS5ggI2HeSpHdLCBNRI7HaPLgnSmxne5nkVG+i11nTkXfuyn5P2M6llnqqKbcw4NIF0Q/KokVT+r9j5qvbEMG8ywTaJ0LoqCvVFsHId5R4U1K7esWIauBcAYJ0aemgg9nbAXXsfXhn8j4EQ2azo+6aaswzNYidnEQWnABmpTZqigytOsfE+FXtZKSIgK1Vs8A6oMayCQR+mCLMmB9K90VF+RmBTytRjoW/zYziHudimNH2NeDmCZEtUkFgXmGW6XI3f2TZbFJHsZ03QVMhWkeRQrOoMBmJYwXxHDnxApSDySFJrHme64FzCBsqpfDbn6YhLsrCK326y6P5Jm/AbyP2DKUi3BxwUuXKgtryAFbBw8I9A23ZgchGMVtZH20SNTdyNXd63E+YpHLoEYNh7ikA8ffQ1OSs/d7R+8bjGSqHjQiZgJz7SgTkYkn2u9jgT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(66446008)(64756008)(316002)(6636002)(66556008)(66946007)(76116006)(91956017)(110136005)(66476007)(54906003)(6486002)(478600001)(71200400001)(5660300002)(38070700009)(36756003)(41300700001)(558084003)(2906002)(450100002)(4326008)(8936002)(8676002)(86362001)(82960400001)(83380400001)(2616005)(38100700002)(26005)(107886003)(122000001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlV0Q2N3QzQxSlU4VU1pM3pZQngrUzNhc2dFZ3hiaHNJdUpLY2FTeWdEM0lV?=
 =?utf-8?B?Y0FBYkFRdXpWTXZwN3JpOFFZbW5SSmFjRk5neVZvcGpZMzdsRE9lSVVydlJJ?=
 =?utf-8?B?aWMrR2xaQXNLYUxkNXVBKzdmKzBRUnlHSXZoQ0FPaDVpTGJvT0d0OTA5VTR0?=
 =?utf-8?B?NzhhcS8vUllHa1NEQXpnV1NOMW1zcUZ5L05XNG1qQ0pJUndMOUphNTR5Szd3?=
 =?utf-8?B?dUNpQWRwUXdHUHY4K29PUmM3TVAvb0owSEpIRDc2dDAzdzQrMTVLVHd1ZWJB?=
 =?utf-8?B?Q0NueVdtY1hVb3A4U0JsdEo2M2Q0VXg1NTB4Z3AveHE1eGc4RHIvSTcrVzdG?=
 =?utf-8?B?bnNCSXlpSk85dkFXYUsrVWt4VzB3Rm1VK2NLSnltbkdMNjdIQ0VCSEUwQ2Jy?=
 =?utf-8?B?YTNFc1JkRnZFZWI2Y0RQTS9YUUhBUTdibFVqZk9EUVNKU3BiNWtvbXdnSHNu?=
 =?utf-8?B?cjFPd1E5SG5LazFUNCsrUzIxMUxWU0xJbGxaT2x4OGJLeDZoQVFvbHhLWGxl?=
 =?utf-8?B?SVZlb3BxQStoMWZDYjM4OHd5aEFxdm4xaUhTQ0dlaUhueHVXQXlnZGNCVzlW?=
 =?utf-8?B?RDljaXVMNnJ3RlpFZThQazl3aU44dVh3blVhRkhDVzhzQjdpY3FmT3hUOHhW?=
 =?utf-8?B?UTI2Q3FlVVR0aFdvQmszYStPWWo1RkkwR0JsemxFWmVWMnByL0JaejIvWVhk?=
 =?utf-8?B?Q3hpYjlOeGREWUVPbGpoWkxxbTBtWUVJNE5RRDJNSzJWSGlwMm9GQ0RlV0hs?=
 =?utf-8?B?YStUUnl4a3hGWmROaDk1MzZ4N1F6ejNnb0JCaDZDM2pEYm80ZWdEM1lCSkor?=
 =?utf-8?B?MXF0ZkVlbGg1amk2TjRxN21XckZlaS9DTGtJanJLbmFGV1AwWno5ZGszSEhW?=
 =?utf-8?B?WGZsa0dKaHRWZ1dGUVZzVmluOHdPMkt4MFRaNWRldEJDdFFDSVlmVlkvL3B2?=
 =?utf-8?B?Q3RJVXRlT0ducHp1bDhiVXIxR2k0Y2UyemR1SGN4Z0lHWmN2alhhdldFamYx?=
 =?utf-8?B?aU42Mk1NQzBqcHhhdlk3bFFRL2dscm1tSVVGVVNhNnNOVWVleVFodVl2NGs1?=
 =?utf-8?B?WnUxZDJBZ2hKK1VnSWdQeDJITnlwWUY2NWJPbVRYUTFtTnVsSkNnRFpaNnBj?=
 =?utf-8?B?S1RacDZyRThaV3hvajNJT0lBOGljbXNzR09VdEhzbzQ3WU5zNXhCTitlTXpx?=
 =?utf-8?B?VUpQSG0xUFdvWUYzc2x6MFBZKzJDWi9GcnZ4dm5VT0ZONVd2OUJsMUdFU3l5?=
 =?utf-8?B?UVpnU0hyM2xUUzlDRjFaR3N0MkZqRUw2RGpHYVdRbEYyZG5yNUxGck9uWURP?=
 =?utf-8?B?TXowOWRObTdsRGxFOFZ0Y2xEc1BKT2k5ZUJMZjZXMHdiMzRsMmlZWEwranRx?=
 =?utf-8?B?UlJraFFFbmkyQXlHcVZBaTBVamFLV2NmOU1DZFM0bHphSmF5KzZ1VlZQVTEy?=
 =?utf-8?B?K0V2V2NndThnNlIvMFp4dVRZT2tCS2tnckMrZDVLZHFGRG9mWWtOSndHV0Za?=
 =?utf-8?B?c0QyQWJRRlR6S3o1WTZQc2VQU3BRb3ArcXJkRUJ1cUhKdDcrYW1CNG9DWmZm?=
 =?utf-8?B?THc3d0pSUVIxd2RlVDBubTZpd2JXRitpYnNVcGxiMTJnUDhEb3g1VlR4enRT?=
 =?utf-8?B?ckFoYWd5cVNZMDNUMnZwUXZEUlBOc3c1V1V4MWk1anhFSlB5OWhuYURrd3Zn?=
 =?utf-8?B?b0pETncxNnZyMDMrMFpUMUdwZXdSYzJmS3NSeVFVbkVpNG5VYzJkcnRpWFZt?=
 =?utf-8?B?WnAybUFITVZZTWlYTHNOdXpiOStHN040NEhPM2tyU0N2Y2pOSEk4WUdObDZ3?=
 =?utf-8?B?SGxxSXZ5UnBlNEtQSnNMVE9Hbi9kUTNKZVhXVWd6K29FQUlqUitaV2tONWFs?=
 =?utf-8?B?WWZyeEkrQkRROG92UTcxREtjaDd0TFBWV1VjUzRGd0c2V0pkQWg1WitZTDkv?=
 =?utf-8?B?SUNJMkMvNmRac2FRNWJwTWRPck9kRVFIZ3FrOGUzYWhNRU5lN3ZQdStSaXJK?=
 =?utf-8?B?NEtaOG1yT3Aya0UyYzRvZ2JwblVQM3praGllVndNbnhEUXVEbmdFOEpwVDAy?=
 =?utf-8?B?MUNrcHRPRGVZTWp5RkZ5T0hxbzBZejc2NjJBM0ZDbXd5U1VOQWZQUkhHMEtx?=
 =?utf-8?B?TjkrazFJaWp0K2hLbkdXcHYra05KNXB2NWx2RmZ1M0d6M3hVOHJrOVZjNEpj?=
 =?utf-8?Q?ABFWYOqRe9rpcieSpM6kHFI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <463C783849CA20429C549E797FA3C298@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f90abb7-89ea-494d-7615-08dbf201fecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 00:10:58.6077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUmjooaHordx6kYRNT7X5Q41SIiTxPNH7351J36j7lCLnXQFUQixsnkQlddAFr4Y0lEaQswG9HX1F4+FdDaBzcueHBtUpA8lvaWWUESkkr3gOw6rbIo3mcIQkKxUqV/V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jana,
 Mousumi" <mousumi.jana@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBcyBmYXIgYXMgaSBjYW4gdGVsbCwgaXRzIG9ubHkgaWYgd2Ugc3RhcnRlZCByZXNldHRpbmcg
LyB3ZWRnaW5nIHJpZ2h0IGFmdGVyIHRoaXMNCj4gcXVldWVkIHdvcmtlciBnb3Qgc3RhcnRlZC4N
Cg0KYWxhbjogaG9wZSBEYW5pZWxlIGNhbiBwcm9vZiByZWFkIG15IHRyYWNpbmcgYW5kIGNvbmZp
cm0gaWYgZ290IGl0IHJpZ2h0Lg0K
