Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA8F786782
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 08:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104C710E485;
	Thu, 24 Aug 2023 06:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6636710E485
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 06:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692858702; x=1724394702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ys/LmiQHqMPJIYAFWYCaBlO0vG4cuy8LInllgka+W84=;
 b=PyjSZORGG+Pk1/LwgDcJ1KSBW8/rlaq7ssroCxK0Xjo591DY0mk6mE3d
 V5EeG24F+U4zpotxiCmwNcAY91u8LzM/Lc05BZ9IliW2l/EpiuD62Zp0C
 XLfwOlSfzPGaqFhR5X7Q+Lvfw5LZbzYri7pK67En02gANe/CTxz6CL5AC
 MOMMO1GdQABv1tcZ7cnWshYToQJyrJjPsw7er6P/YZtxVXMRK2ZiGt2Hu
 otzgkH3fOQhIIXkdfDuLUJJCAxyS/OyX3/DxjIaphVcGUpnwWVCidKUEY
 9QSrtPRUnkPOpmfHLCrNlFYvH7ICx0GZoOa7rUgXMTUADWPvNg92donfe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364530706"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="364530706"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 23:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="686749686"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="686749686"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 23 Aug 2023 23:31:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 23:31:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 23:31:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 23:31:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 23:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fe07KfUA7yLIy2B/K6zRLcPGnpzuiqqk3pw4myNa8oCXYpcolq5xWz2782N9u9c9veQAfP7Ra5iJV/tG2xb6a2oHZtAX6+03mJxBXlnDHo8Ky4IfPLbAfWbA2siVSR8feSO5LFJzgM+VOOtpyximRhnDzJgj07i0G/b0B+AGDttGIRAlfH/ISDemgSwwl+96ioUDuREGx2DmhOAehKca8iir/QbZdC1kSbdxxuQ3rlQGQh0i7Nitzvj3loSNb2K5Pj6Y1L3cqzi6+tFElRGw4/dsmMDyszPWSmCU1yYr4Px7isH5uLsleFJTWpCNQSpAwJi/T0HkvSGI6B39KszIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys/LmiQHqMPJIYAFWYCaBlO0vG4cuy8LInllgka+W84=;
 b=XW8mvlbRTFQ1N+s84RIW8AbvflwIJdkvVV2E84RJdKK7P4g9XPF7JqfB9hkT3m19CO3AdIlLVdLNui/rNJ4fSH9WwRdQIxUpBc3Is9jDxLLaOQHJKf3yGsq6Kzr6t/3TTdtONZ3tLAx4Z0EyB1S7ojSGhHCpbsdNYL0PItxqG37xTArrWyE5roRZ/mVCrG0F2O5p8Du4DuIteoxJ+r+khQLDaKPY/ID6d7qvmRZVLckQTQ8VpOkYT0vINKK7FaSsIj9y2PF9+1D0clffw1wFWLDsfuXgH2LubS4B1cP0AM8wXRoG54j90N8G5NH6+XBJHQ5HiZAScgq8zR2+JZ8dpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Thu, 24 Aug
 2023 06:31:37 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 06:31:37 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: RE: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Topic: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Index: AQHZ0Nnu32u80K2Na0Cg35Cfz1LQWK/ulcwAgABFA3CAB2qDgIABYwaAgACkLFA=
Date: Thu, 24 Aug 2023 06:31:37 +0000
Message-ID: <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
In-Reply-To: <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB4797:EE_
x-ms-office365-filtering-correlation-id: b6b4d55b-1ea8-47a7-5914-08dba46bc4e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oHEoNSp8TKcmmeD+nhOtk/jdJQuDDSwcrn7hFWL3YL9EJUpm1YFWIoRDQyxNAtgeiBZLbr/G4zLnRcZJuFD+OR6C4as3boAbqMi0eNF/dlFMhGKzvPD/yhJVnw7Ob5RiG5B6oKeU0JlKw1nSyX09hfn0QXGgbygthyLtz18KkB39MoZ91mU+xle3gmtpb/rFLJrwyBW/2BTaANx3Lsw3iHfW8FeGnUdwodf71ykieECtPi/P5rZMsZ4vP30+OS+besMtBKyk7UwLdQVjnOoTFQRt129vLJIAZ5hMSgahH1DjNFGMpP0XTX66prHGk2V9gJLfONla6XWFDXfR1J+2186fVjp7W6qYE5fo8+fmwp3UH7K+PXAlW+j1XJy1Pt1x2DeUKrP/5o7UFLvqqbzbbdcV89xcA1A0XSOo8UEKiDIVfIkztoLfPsR1xzhf0N6Sg4yls33IT/t2eZCgxFbCR0CdbBtb7ZgPoJqODkqHr/n0CEoon+6txjkLhysvFAFY8sKuScHYxblpRAMbceuOU40qBMaYDy9sKi5nJGIrwSNk0P0rBSscJbj8ne2jkmSJDBDhxU/r85eruRMoRNkzhnpsg+cqwPnNc6yTITfvc1QJ6rcNifZRU3rFUCMM/E4D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(1800799009)(451199024)(186009)(55016003)(82960400001)(6916009)(54906003)(41300700001)(66556008)(66946007)(66446008)(64756008)(316002)(6506007)(7696005)(66476007)(76116006)(26005)(122000001)(52536014)(38070700005)(8676002)(107886003)(8936002)(5660300002)(4326008)(4744005)(9686003)(2906002)(38100700002)(86362001)(71200400001)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUl6SWhML0toWXo0ajdvNmhIWDl3MmZ3ZEdldXF2VzlMUjU4SkVKajNXckRL?=
 =?utf-8?B?a1JTUFgvS1VFVXZYc1JpUFcvaWFpRjJXV0EvZytCNExYeURWU2xYc2RFTlFo?=
 =?utf-8?B?bG5NNlFrcHFmazJGQ3Yrb3c1VWhITElYVk50SHNrbC9vK09QdmtTeTlNWTVm?=
 =?utf-8?B?QzRNSUhJa2NISWRnS3NkUDUxcllhcXk1VUk3QW80cFZZS0Y3eHRxVmNwZ2lE?=
 =?utf-8?B?Ny9aTWxHUEVkVTVCTDkrUWxBc0ZQWmhwU1o2bkE1WnE3ZGp1TWt4d2VyU1Ar?=
 =?utf-8?B?TGl2b2FTYW81a01wd21qWnMrbXF1cnlFd3N4dXU3bVhOOWtjQlRhTlpJRzJQ?=
 =?utf-8?B?TG1iZmRwMTRiNEsreTF0T0w1OXVOSlUzNmNDTWZmK0tUYXdVN25nQ3JyUmZ0?=
 =?utf-8?B?dXBBT1NoeEh0Z202S2pMVEVwZndlUHptbUNneXo3N3hEVzRzK1JvL1FiQnFB?=
 =?utf-8?B?UkcyMUNncHo2VUhrSHd5RWhRaXdaVWswcVRYSmZPZkJMaDExLzk1ODJINmxV?=
 =?utf-8?B?VGI4QkpyNkI1Si9FK0dGQ0tJb2h1REsvTzBTNklCZXAzTko3c1o1Uk1rRkxO?=
 =?utf-8?B?TEhKTWZNRnIwZFpKcnZGNlpyaFBBUzA0YTE0ZVVKTk1aU0NpVXBib1Vka2pM?=
 =?utf-8?B?dXZQSVNtbGFsUE1KVktXdjJON2R3amE0SEwrT3lIODFCZkg2S2NLTUdjemlO?=
 =?utf-8?B?cEVBSEFHU2xydmV0K2dtVGY4Q1BvQVBJVHYrdkg1VGo5S1Q4eHhrcHZXMzk0?=
 =?utf-8?B?cjZlcDIweW14dVNhdUtWOVhPQVNVMVNkWWh2WGdtWFFOTzNuVXd3dldhbms4?=
 =?utf-8?B?d1B5dUNBajRESkFGZEJGUCtCdVJob3kxcE1Jb0NiY0oxSUJ1NEtvRW5obk1q?=
 =?utf-8?B?b29KU01XalIrMmdXSWQyWE9nZEVFOExlVnhxRHRaeFBzV1pNS2F4YTk5cExi?=
 =?utf-8?B?R2hRd1JmOTlEQStQZ25FY1VESjNyRXdPcXJtaTZrbzFyUm1kR2hNMUQ3MHpH?=
 =?utf-8?B?a1JOWERSRkdsWWhHcHd0MmdSdkcxVkYyK0tzbnR2TWE4OUJGdFNKUHhWaHhP?=
 =?utf-8?B?ZWJ2a2RzWTFSWTE5WDBsRTF2a0Zpa2l5eDQ5SFB3bjBDZFFBTUM4YllzemNG?=
 =?utf-8?B?YTN5NEJCYzBmc1pSbEFkV3Y5eTYyREdNY3F6Vk4zVlFZNEZNdHZZRHByNmdT?=
 =?utf-8?B?QldENnVZZ0EwelhtSHBiVElLMXBnVjAwTTArK1N2MFFCeXhuQWNaYjRrdFJh?=
 =?utf-8?B?THM5MS9vd0tCV3ZVMW5EeThhUXk2SWZ4OW42VDdCUktHRG51UlJVcHFmWWt3?=
 =?utf-8?B?dTBJdnZsY3ZDRnkxVGx5S3c2TmJZdHl2TVh1b0s4ZE5IM1ozUEtFZC9IaE11?=
 =?utf-8?B?b3JsYkMzanFrWk1GQmxiYm56VDJNcmxKbTJjL0ttWmVhVytrRUF0QjM3RVMz?=
 =?utf-8?B?WDQrM04xQS9IMjV2REFDWitpbnphc3lEVExtaVdqOU1qUG14YVNZTWlyS253?=
 =?utf-8?B?enpOTG5zczU3VnIzTXRGY0FTT1gxTVc5Um0yTEYwVE9hRGRWNzBtd3luVXZq?=
 =?utf-8?B?RHM5VDBvbDBxLzZackdKWjVvMVlSUlVjOS9FdUVSNXVuV0JGM0c5U1poRnJh?=
 =?utf-8?B?VGNSb2F2S1dXOXVyQTFTalhlcGdFWEVmRnBsQjZaYmhNdEpHaStWRkRqQTNM?=
 =?utf-8?B?SGRPakgxbjZDN1h3OTZmRFphZ3N2VnN1NTRkZEF6Vlk5UlJWMHR5QzVYTGtL?=
 =?utf-8?B?a3ZhNVgxaC9KM3RKZFg4cHM2SGtnWHFjcmhkK1hxcVZ4MnB6d0xheklmTG9B?=
 =?utf-8?B?RHB3N0x0d215TitRenJ5K0VyaDJVM20vUHpnWUVidEVzQjE3MnhhZ2ZHZ2NS?=
 =?utf-8?B?UURuUDlsVWhJMk14d29VZDZ0dnFHUDExajNxSDA5WU5YUllYR1hTVStuZElD?=
 =?utf-8?B?NVN2Vno3SEZZQ05QbVVQNmNRVUxPdGp1OGYvL1kvTERjT2hPeWZrL3hTV2Zy?=
 =?utf-8?B?RGtZcVpDTmhCdWpqdzRWV2F6MVM3bFBPeHU4c29ab0VQemZHckhldGx2UFFN?=
 =?utf-8?B?NFI4STNXUHU1b3RmbHhLcVNnQ05SQU9mcCtQU3BFZjRyeXB4QjRHTGljaVp5?=
 =?utf-8?Q?RQIge/vdCel53hn/RDLngWEgq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b4d55b-1ea8-47a7-5914-08dba46bc4e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 06:31:37.4331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdKH4tc33pGGaZ75iiry6ml60figHeIkhyGiosjdwqbiqvmFYARFy1nmlurbUqGbeWaju5Th/qLguLXQRo6xAHw1NuUCXu1HhOs2eFJyyCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gDQo+ID4+IC0gQWRkIGEgbmV3IEFQSSB0byB0aGUgYmFja2luZyBzdG9y
ZS9hbGxvY2F0b3IgdG8gbG9uZ3Rlcm0tcGluIHRoZSBwYWdlLg0KPiA+PiAgICBGb3IgZXhhbXBs
ZSwgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZg0KPiBzaG1lbV9waW5fbWFwcGluZ19wYWdl
X2xvbmd0ZXJtKCkNCj4gPj4gICAgZm9yIHNobWVtIGFzIHN1Z2dlc3RlZCBieSBEYW5pZWwuIEEg
c2ltaWxhciBvbmUgbmVlZHMgdG8gYmUgYWRkZWQgZm9yDQo+ID4+ICAgIGh1Z2V0bGJmcyBhcyB3
ZWxsLg0KPiA+DQo+ID4gVGhpcyBtYXkgYWxzbyBiZSByZWFzb25hYmxlLg0KPiANCj4gU291bmRz
IHJlYXNvbmFibGUgdG8ga2VlcCB0aGUgb2xkIEFQSSAodGhhdCB3ZSB1bmZvcnR1bmF0ZWx5IGhh
dmUpIHdvcmtpbmcuDQpJIGFncmVlOyBJJ2QgbGlrZSB0byBhdm9pZCBhZGRpbmcgbmV3IEFQSXMg
dW5sZXNzIGFic29sdXRlbHkgbmVjZXNzYXJ5LiBHaXZlbiB0aGlzLA0KYW5kIGNvbnNpZGVyaW5n
IHRoZSBvcHRpb25zIEkgaGF2ZSBtZW50aW9uZWQgZWFybGllciwgd2hhdCB3b3VsZCBiZSB5b3Vy
DQpyZWNvbW1lbmRhdGlvbiBmb3IgaG93IHBhZ2UgbWlncmF0aW9uIG5lZWRzIHRvIGJlIGRvbmUg
aW4gdWRtYWJ1ZiBkcml2ZXI/DQoNClRoYW5rcywNClZpdmVrDQoNCj4gDQo+IC0tDQo+IENoZWVy
cywNCj4gDQo+IERhdmlkIC8gZGhpbGRlbmINCg0K
