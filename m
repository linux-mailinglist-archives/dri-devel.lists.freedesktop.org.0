Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007BE84494C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150CB10FCFC;
	Wed, 31 Jan 2024 20:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B5C10FCF6;
 Wed, 31 Jan 2024 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706734784; x=1738270784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1QyU69SnivDX8Kuhd+lX8IHry+FXCQXYYS49c/FNpnc=;
 b=ejSfxru7aMHvPfwrWcRULcFhTQux5LqRNqq6WMrp4fQxAtpNRXzzij0g
 S4ISvvE7G4xPzZTeReFOaFeBjlfJVEXTIVZHzZX3uloVaKOBLkjqVgRRP
 1tLt/8J/1uN4z+zIdkjKNmADjBS1pHZ+DkIqFuUT6w/FMI03RzzRYfY06
 Jxh/2lsGeaXRRLDmvoTcD9sY6AGCrRQozxCq1+SNO5BULrZzFkoqbcFdl
 ARSgJbLble//ZcOg1+1Th6F4PfgNG28MDEm0QIMYhFc0fecLllsNb6jqw
 pZKcVulLWrUDTrAF2JQISGgIMl+/w6ldCx0P8Wp1vjDQjnY26R6DPYHB7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17108169"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="17108169"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 12:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878895542"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="878895542"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 12:59:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:59:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:59:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 12:59:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 12:59:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jspvjmQ8y8AiZSYopJMG9G+XdxXOm/J6uAyg05EyIKGQSBTuVXd5UuHxXfL/NM0tzYpXzAQX2k2zPYeiIknq7YhNh1N8FeTHENaJrvqjCPS9FAMwAXwpESk900tYwpyJG9qbbo2tQADPs6XxaoFK9s8ebVq/0pacY8jly/yQwEXvthfHyf+mRoMoocT22isWt9ALTArtGeaFR/VVJ7kMA9NZZk3ZatC4QxrrsFu7iEKu6YOwQ/aND0ST+X+jQ1BmGitUeNtABFjhJa+ajyIJBxgY7+xeO8GOyHcS0EzP0lHVXzVckrKw+/c8cumaMbChOhGNUR43BSSTrcv3cht8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QyU69SnivDX8Kuhd+lX8IHry+FXCQXYYS49c/FNpnc=;
 b=l02HgzCjKCO6Uki/qsWXjTSWgiiUB/qthhVWlE/G9374+hreVpTIvkEPUELJPVy/Eq/pyuVrzhCJGe0vy8+z+S2RDqDItKZdnBoVndv+Z8wmIUhqQQsLTUUuyl8mXHaezO4zKnVsOsIu4JIrPoMe/7iLiMinzawizuCY7c6sqSf/KNEdUIhvTL1o67SfesT+RCRM+347AmlGWTbGna9ycBeswKRyNvNjG7QbMahyy6Ktw0lYRSz/X+GB8Tu5t5MzH9GXiLvmPT3CixMBfDe1S8WbydgvOhxSLIfx89Nl+eweWUEodtgw6sg6CQbB2sJIyGBWCSRW6svk6bo3qdN3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.36; Wed, 31 Jan
 2024 20:59:33 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 20:59:33 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@redhat.com>
Subject: RE: Making drm_gpuvm work across gpu devices
Thread-Topic: Making drm_gpuvm work across gpu devices
Thread-Index: AQHaTas285rAdrskSkySwbywxZaZP7DnPvcAgAA/1GCAASXNAIACOegAgADnfwCAAEunAIAA341QgAOsxICAANzFcIAAmaUAgADmLLCAAA2/gIAAqE2AgACvtgCAABS3MA==
Date: Wed, 31 Jan 2024 20:59:32 +0000
Message-ID: <SA1PR11MB69915EAFE5D1278FDD3E2760927C2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
 <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
 <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <801c3357-d49b-4505-a1a4-ef2f36ba63e0@amd.com>
 <SA1PR11MB6991E4CF9949916C6290C232927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25pzC4PTFwXLo4304vcbFVvxjDPi7Pd1ASBVQ1t8QqizdQ@mail.gmail.com>
 <ZboPlUgU6A-9rMvP@phenom.ffwll.local>
 <SA1PR11MB69910A237BF3666C8D798AFA927C2@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB69910A237BF3666C8D798AFA927C2@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB7892:EE_
x-ms-office365-filtering-correlation-id: 7fe5c819-e705-40c0-963d-08dc229f866f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2//+IY+scOhuoX9s69WaLl2LOGKZYTniKqLDCe8v1pITVJKZUigYbdYS//2pnKR66Fl0Gaw0YVsU0SlttSW6Ly6GjEHiuSEjB+1tTbsjJpLAm/vaaeEKZH+LYmjjOC+HpsfyYo3xbIvAUU4KzgcZYBY6Kbpsk9y0OHMfcP/O+S2GGr55zWpZMYlJezV8fVkJhG7c0JUW6dWgL/woSfGqFcKSMM3c2kQSw2v91E1TlRsJOeboRpDZAgOY6KicnacenrRwjkrorXuD9COIHLJpotc78taG6NGTPm+uJEyWwWw7p7rB76rfltW93ioTkZpccKI/UJKMwIXsqHWzby47192vUrtBjVV4w2I1w1NGuPrxsUocNMayD38qlaz8mPqewtzPWS6C2IshtDHAiSzqI6AIV0yG82g58O6Yf+rbBAWupv0idAe76n0kzl7T5ZSIys7VDC+HqgmLboSrxU4u+lqcSGK0vvNn3quZZvtrHY6Sdp7aEnyOggntgKvOMZ11t4f10HB/JjMEK2SxDTm2HyO/NM58mwePbMNJkBHruRXNITFgxip4oL1eWE+5W+zMUQzeadtZm4apK6RQvkr3oxzYc3+h7jDUodeKjqv06kU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(64756008)(66446008)(66476007)(76116006)(110136005)(66556008)(2906002)(7416002)(5660300002)(52536014)(316002)(8936002)(2940100002)(66946007)(54906003)(8676002)(4326008)(478600001)(966005)(33656002)(82960400001)(38100700002)(86362001)(41300700001)(66574015)(26005)(9686003)(53546011)(71200400001)(38070700009)(122000001)(6506007)(7696005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmZNRlowdFlWU3dtelBOaDVJOXZjbHBTcy9qRW5rQjAzb1Z5ZWgzS0dYLzM2?=
 =?utf-8?B?TnV4MVRMR1VwYXQvcXdpMUhRbXRwdEM3Q0VTR09kRm9pRVluU0dkdndoTW1x?=
 =?utf-8?B?ZllRQkN3bHJBVFBPcDZLQ2hiQm9pWkg1NUU2R29sRkg4YVBqb3RNS0FSWnNi?=
 =?utf-8?B?MEFROUo1RUtaRGpZVE15WEZ1YWluZWlqY0pTK3RySE5nRklVN21kWE5tVmtm?=
 =?utf-8?B?YjBjK1pWQzV2b0FHU2ViUnVZUnZwV3c0R1ZNVWNac1ZyQkxKM2VuaUNTeHBZ?=
 =?utf-8?B?ZjFkU292MWlaVHNRVk1QenhYcG1OcHJRQTVxSzRKK2R2WDRuTVlXSEZNR1cr?=
 =?utf-8?B?bVd1bStSQUZQSXkyS3ZEV1RKRDJWaFZMNHJROFIyQVNpNDlVcGowbm9zZ0s5?=
 =?utf-8?B?TGtHc0tRcXFNbGMzU0I5NEJoZmNoSGlPUDI0TFV3VGRZQllJcE9Qc0JUNHlW?=
 =?utf-8?B?YnIyMkJwN0JYdzF5TTdDWGhzTWIzb2E0TlQxckJ1WWtRMkdaaEwwWVhTOC9q?=
 =?utf-8?B?MWw1aWdTOCtLK0tJanBFdUJGbGkyQTBOMnRLbnA2UmdBWjdvL0tFL3BST0RK?=
 =?utf-8?B?dGU1Q3VSbzZ2R1NXend5QVFWZG8ybEwrYS9BaG9XUHpudFV6YXk2V1c5WUgw?=
 =?utf-8?B?RE50dERLZFFxaldJeVh3eXFvMVNpT2NtYUZtaHNzT2JzT203Ny84eWw1V3kv?=
 =?utf-8?B?Y3NDTnVjd3F3NktaVDJZaDA3M3U5NFRMeWIwWFdTZTRNcjJLa3J5dHBRZkF0?=
 =?utf-8?B?OFVxVnVIaE9OdkM1UStOK3lQbzVZL1paQXZYNjl6VjNmYzR2bzBmL3Z3Q0w5?=
 =?utf-8?B?OGl0WXBXM2hkVWw1aW94NlhXNnhTd0g3YitMbWM3eGJoRkRDMXF1bkhUV0tN?=
 =?utf-8?B?eVRFQ2F2YWNoZVhpSFQ0WkxrYUxWTzc1WlhpQ3JIb3hTYmk3RG9SSlFrMjVz?=
 =?utf-8?B?RzNTZmFwOVlCc25Bek5KQXZYMmkzQ3pId1lYOGRqRitwQWM4dWVqOU5kdi9H?=
 =?utf-8?B?NHZ4bEdmTm04N3hlTUt2RmVjRDJIMTJreVFoSFl2Q1NQVEg0VVkvcFVCanp4?=
 =?utf-8?B?SDZTajVhSnRwd3liQW9RT0JweHk5R0tjamJOWU1kTWVqd0Q0MVArUW9wQUhw?=
 =?utf-8?B?aDJNeVFFZXBtWGtLbWRBT1FpdVBUTzRGa1ZDbFNaWHYxOC92ZFdOdGJ0bk4v?=
 =?utf-8?B?VDhSNS85aktTNjlWbTM5bGl0WW1RWEpwOXdneG16Qng3WC9GTHR4Ym5UVlNi?=
 =?utf-8?B?YVAzS3ZkYVhjUHpISlkreDNDNWFLY1lhM0dUR0tUQ09RNDlSNU0wYm1nWHR3?=
 =?utf-8?B?cmVFSm1SdGVjenJGeTJmWDFwVGc5MlNOL1gxVlA5OUtKUXdUQjBLMTd5c3or?=
 =?utf-8?B?VHl2N2ZobEEvOWhFQzQ1YmZCTzNoQmh5RW1YRkZaYWkzeUZiVXpOQmNDQ1ZV?=
 =?utf-8?B?NTJHNER2SGNReFRWZnBaNm9IWW9sanBUNENJRjFVT0dCNEFOMEQrVFMvM3Fx?=
 =?utf-8?B?MUlBZ2g5Rm45bU4yVDZHRkxWQmQycVowekVEbnNVbmFSYmpXRkw0OHJIdUo3?=
 =?utf-8?B?ODZoMi9vdmpyS1V6K2NGMHlyTUhsaWJMbFhlR1o3N0VEZnNZaVRVSWVMZEoz?=
 =?utf-8?B?SmxmT1FxN3lodEM4blZURm1ncEpSaXlVbmlHbTdnY0xxb2VFZmphRE5aTzV6?=
 =?utf-8?B?K1NuNm83OWFpMitTZ0cvOG94UG5ZMktjb1k3Nk9kcDBRbmpsRUgzeXZZcVFE?=
 =?utf-8?B?ekM4L3l6RXlsTFRxRFg3OGZqa0h6akE2d3g2YVhyemViNmVRUGpKcGxMK0po?=
 =?utf-8?B?NzJPbUxveStxSG94S2J6eEEvbGJUNmdBU1NUSWtrNzY2QWRpMytMclJpUllI?=
 =?utf-8?B?TEErZU1vRHlhRGNqNHBaS1lpSEJhdTc5MU5XL1IzNXQ0QTFXSHg5MWE0eWc0?=
 =?utf-8?B?V3VFM3ovNjdGK2FTSlI3TEk0cWkrMGx5d2h5QU9XTVAvM1hBS3g5UzJRREFh?=
 =?utf-8?B?N2NoZklyb1VtYS9xZk14ajErdTRJWktacnhHaHB1SDQraEpsZnRtNUF3WEpZ?=
 =?utf-8?B?eTM4azM3anNFOCtvdlg1eTk5M1AwMFR0MkVlbmZwTGxiKzJwVHMzaEFPSHB1?=
 =?utf-8?Q?AeEQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe5c819-e705-40c0-963d-08dc229f866f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 20:59:32.9751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ji8oJHXv7eVjh9R9+zY1rwdaYw2SK2ylAN5hoSt+O4QuF3i5l2EplxfqVntyA5KUPMeenG0cXHjU1/+SCQpjyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu, 
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZWQgb25lIHR5cG86IEdQVSBWQSAhPSBHUFUgVkEgc2hvdWxkIGJlIEdQVSBWQSBjYW4gIT0g
Q1BVIFZBDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmVuZywgT2Fr
DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAzMSwgMjAyNCAzOjE3IFBNDQo+IFRvOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47
IFRob21hcyBIZWxsc3Ryw7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47
IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IEZlbGl4IEt1ZWhs
aW5nIDxmZWxpeC5rdWVobGluZ0BhbWQuY29tPjsgV2VsdHksDQo+IEJyaWFuIDxicmlhbi53ZWx0
eUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHaGltaXJheSwg
SGltYWwNCj4gUHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgQm9tbXUs
IEtyaXNobmFpYWgNCj4gPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPjsgR3VwdGEsIHNhdXJh
YmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+Ow0KPiBWaXNod2FuYXRoYXB1cmEsIE5pcmFu
amFuYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhhdC5jb20+
OyBTaGFoLCBBbmt1ciBODQo+IDxhbmt1ci5uLnNoYWhAaW50ZWwuY29tPjsgamdsaXNzZUByZWRo
YXQuY29tOyByY2FtcGJlbGxAbnZpZGlhLmNvbTsNCj4gYXBvcHBsZUBudmlkaWEuY29tDQo+IFN1
YmplY3Q6IFJFOiBNYWtpbmcgZHJtX2dwdXZtIHdvcmsgYWNyb3NzIGdwdSBkZXZpY2VzDQo+IA0K
PiBIaSBTaW1hLCBEYXZlLA0KPiANCj4gSSBhbSB3ZWxsIGF3YXJlIG5vdXZlYXUgZHJpdmVyIGlz
IG5vdCB3aGF0IE52aWRpYSBkbyB3aXRoIHRoZWlyIGN1c3RvbWVyLiBUaGUNCj4ga2V5IGFyZ3Vt
ZW50IGlzLCBjYW4gd2UgbW92ZSBmb3J3YXJkIHdpdGggdGhlIGNvbmNlcHQgc2hhcmVkIHZpcnR1
YWwgYWRkcmVzcw0KPiBzcGFjZSBiL3QgQ1BVIGFuZCBHUFU/IFRoaXMgaXMgdGhlIGZvdW5kYXRp
b24gb2YgSE1NLiBXZSBhbHJlYWR5IGhhdmUgc3BsaXQNCj4gYWRkcmVzcyBzcGFjZSBzdXBwb3J0
IHdpdGggb3RoZXIgZHJpdmVyIEFQSS4gU1ZNLCBmcm9tIGl0cyBuYW1lLCBpdCBtZWFucw0KPiBz
aGFyZWQgYWRkcmVzcyBzcGFjZS4gQXJlIHdlIGFsbG93ZWQgdG8gaW1wbGVtZW50IGFub3RoZXIg
ZHJpdmVyIG1vZGVsIHRvDQo+IGFsbG93IFNWTSB3b3JrLCBhbG9uZyB3aXRoIG90aGVyIEFQSXMg
c3VwcG9ydGluZyBzcGxpdCBhZGRyZXNzIHNwYWNlPyBUaG9zZSB0d28NCj4gc2NoZW1lIGNhbiBj
by1leGlzdCBpbiBoYXJtb255LiBXZSBhY3R1YWxseSBoYXZlIHJlYWwgdXNlIGNhc2VzIHRvIHVz
ZSBib3RoDQo+IG1vZGVscyBpbiBvbmUgYXBwbGljYXRpb24uDQo+IA0KPiBIaSBDaHJpc3RpYW4s
IFRob21hcywNCj4gDQo+IEluIHlvdXIgc2NoZW1lLCBHUFUgVkEgY2FuICE9IENQVSBWQS4gVGhp
cyBkb2VzIGludHJvZHVjZSBzb21lIGZsZXhpYmlsaXR5LiBCdXQNCj4gdGhpcyBzY2hlbWUgYWxv
bmUgZG9lc24ndCBzb2x2ZSB0aGUgcHJvYmxlbSBvZiB0aGUgcHJveHkgcHJvY2Vzcy9wYXJhLQ0K
PiB2aXJ0dWFsaXphdGlvbi4gWW91IHdpbGwgc3RpbGwgbmVlZCBhIHNlY29uZCBtZWNoYW5pc20g
dG8gcGFydGl0aW9uIEdQVSBWQSBzcGFjZQ0KPiBiL3QgZ3Vlc3QgcHJvY2VzczEgYW5kIGd1ZXN0
IHByb2Nlc3MyIGJlY2F1c2UgcHJveHkgcHJvY2VzcyAob3IgdGhlIGhvc3QNCj4gaHlwZXJ2aXNv
ciB3aGF0ZXZlciB5b3UgY2FsbCBpdCkgdXNlIG9uZSBzaW5nbGUgZ3B1IHBhZ2UgdGFibGUgZm9y
IGFsbCB0aGUNCj4gZ3Vlc3QvY2xpZW50IHByb2Nlc3Nlcy4gR1BVIFZBIGZvciBkaWZmZXJlbnQg
Z3Vlc3QgcHJvY2VzcyBjYW4ndCBvdmVybGFwLiBJZiB0aGlzDQo+IHNlY29uZCBtZWNoYW5pc20g
ZXhpc3QsIHdlIG9mIGNvdXJzZSBjYW4gdXNlIHRoZSBzYW1lIG1lY2hhbmlzbSB0byBwYXJ0aXRp
b24NCj4gQ1BVIFZBIHNwYWNlIGJldHdlZW4gZ3Vlc3QgcHJvY2Vzc2VzIGFzIHdlbGwsIHRoZW4g
d2UgY2FuIHN0aWxsIHVzZSBzaGFyZWQgVkENCj4gYi90IENQVSBhbmQgR1BVIGluc2lkZSBvbmUg
cHJvY2VzcywgYnV0IHByb2Nlc3MxIGFuZCBwcm9jZXNzMidzIGFkZHJlc3Mgc3BhY2UNCj4gKGZv
ciBib3RoIGNwdSBhbmQgZ3B1KSBkb2Vzbid0IG92ZXJsYXAuIFRoaXMgc2Vjb25kIG1lY2hhbmlz
bSBpcyB0aGUga2V5IHRvDQo+IHNvbHZlIHRoZSBwcm94eSBwcm9jZXNzIHByb2JsZW0sIG5vdCB0
aGUgZmxleGliaWxpdHkgeW91IGludHJvZHVjZWQuDQo+IA0KPiBJbiBwcmFjdGljZSwgeW91ciBz
Y2hlbWUgYWxzbyBoYXZlIGEgcmlzayBvZiBydW5uaW5nIG91dCBvZiBwcm9jZXNzIHNwYWNlIGJl
Y2F1c2UNCj4geW91IGhhdmUgdG8gcGFydGl0aW9uIHdob2xlIGFkZHJlc3Mgc3BhY2UgYi90IHBy
b2Nlc3Nlcy4gQXBwYXJlbnRseSBhbGxvd2luZw0KPiBlYWNoIGd1ZXN0IHByb2Nlc3MgdG8gb3du
IHRoZSB3aG9sZSBwcm9jZXNzIHNwYWNlIGFuZCB1c2luZyBzZXBhcmF0ZSBHUFUvQ1BVDQo+IHBh
Z2UgdGFibGUgZm9yIGRpZmZlcmVudCBwcm9jZXNzZXMgaXMgYSBiZXR0ZXIgc29sdXRpb24gdGhh
biB1c2luZyBzaW5nbGUgcGFnZSB0YWJsZQ0KPiBhbmQgcGFydGl0aW9uIHByb2Nlc3Mgc3BhY2Ug
Yi90IHByb2Nlc3Nlcy4NCj4gDQo+IEZvciBJbnRlbCBHUFUsIHBhcmEtdmlydHVhbGl6YXRpb24g
KHhlbkdULCBzZWUgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL1hlbkdULQ0KPiBQcmV2aWV3LWtl
cm5lbC4gSXQgaXMgc2ltaWxhciBpZGVhIG9mIHRoZSBwcm94eSBwcm9jZXNzIGluIEZsZXgncyBl
bWFpbC4gVGhleSBhcmUgYWxsDQo+IFNXLWJhc2VkIEdQVSB2aXJ0dWFsaXphdGlvbiB0ZWNobm9s
b2d5KSBpcyBhbiBvbGQgcHJvamVjdC4gSXQgaXMgbm93IHJlcGxhY2VkIHdpdGgNCj4gSFcgYWNj
ZWxlcmF0ZWQgU1JJT1Yvc3lzdGVtIHZpcnR1YWxpemF0aW9uLiBYZW5HVCBpcyBhYmFuZG9uZWQg
bG9uZyB0aW1lIGFnby4NCj4gU28gYWdyZWVkIHlvdXIgc2NoZW1lIGFkZCBzb21lIGZsZXhpYmls
aXR5LiBUaGUgcXVlc3Rpb24gaXMsIGRvIHdlIGhhdmUgYSB2YWxpZA0KPiB1c2UgY2FzZSB0byB1
c2Ugc3VjaCBmbGV4aWJpbGl0eT8gSSBkb24ndCBzZWUgYSBzaW5nbGUgb25lIEFUTS4NCj4gDQo+
IEkgYWxzbyBwaWN0dXJlZCBpbnRvIGhvdyB0byBpbXBsZW1lbnQgeW91ciBzY2hlbWUuIFlvdSBi
YXNpY2FsbHkgcmVqZWN0ZWQgdGhlDQo+IHZlcnkgZm91bmRhdGlvbiBvZiBobW0gZGVzaWduIHdo
aWNoIGlzIHNoYXJlZCBhZGRyZXNzIHNwYWNlIGIvdCBDUFUgYW5kIEdQVS4NCj4gSW4geW91ciBz
Y2hlbWUsIEdQVSBWQSA9IENQVSBWQSArIG9mZnNldC4gSW4gZXZlcnkgc2luZ2xlIHBsYWNlIHdo
ZXJlIGRyaXZlcg0KPiBuZWVkIHRvIGNhbGwgaG1tIGZhY2lsaXRpZXMgc3VjaCBhcyBobW1fcmFu
Z2VfZmF1bHQsIG1pZ3JhdGVfdm1hX3NldHVwIGFuZCBpbg0KPiBtbXUgbm90aWZpZXIgY2FsbCBi
YWNrLCB5b3UgbmVlZCB0byBvZmZzZXQgdGhlIEdQVSBWQSB0byBnZXQgYSBDUFUgVkEuIEZyb20N
Cj4gYXBwbGljYXRpb24gd3JpdGVyJ3MgcGVyc3BlY3RpdmUsIHdoZW5ldmVyIGhlIHdhbnQgdG8g
dXNlIGEgQ1BVIHBvaW50ZXIgaW4gaGlzDQo+IEdQVSBwcm9ncmFtLCBoZSBhZGQgdG8gYWRkIHRo
YXQgb2Zmc2V0LiBEbyB5b3UgdGhpbmsgdGhpcyBpcyBhd2t3YXJkPw0KPiANCj4gRmluYWxseSwg
dG8gaW1wbGVtZW50IFNWTSwgd2UgbmVlZCB0byBpbXBsZW1lbnQgc29tZSBtZW1vcnkgaGludCBB
UEkgd2hpY2gNCj4gYXBwbGllcyB0byBhIHZpcnR1YWwgYWRkcmVzcyByYW5nZSBhY3Jvc3MgYWxs
IEdQVSBkZXZpY2VzLiBGb3IgZXhhbXBsZSwgdXNlciB3b3VsZA0KPiBzYXksIGZvciB0aGlzIHZp
cnR1YWwgYWRkcmVzcyByYW5nZSwgSSBwcmVmZXIgdGhlIGJhY2tpbmcgc3RvcmUgbWVtb3J5IHRv
IGJlIG9uDQo+IEdQVSBkZXZpY2VYIChiZWNhdXNlIHVzZXIga25vd3MgZGV2aWNlWCB3b3VsZCB1
c2UgdGhpcyBhZGRyZXNzIHJhbmdlIG11Y2gNCj4gbW9yZSB0aGFuIG90aGVyIEdQVSBkZXZpY2Vz
IG9yIENQVSkuIEl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBtZSB0byBtYWtlIHN1Y2gNCj4gQVBJ
IHBlciBkZXZpY2UgYmFzZWQuIEZvciBleGFtcGxlLCBpZiB5b3UgdGVsbCBkZXZpY2UgQSB0aGF0
IHRoZSBwcmVmZXJyZWQNCj4gbWVtb3J5IGxvY2F0aW9uIGlzIGRldmljZSBCIG1lbW9yeSwgdGhp
cyBkb2Vzbid0IHNvdW5kcyBjb3JyZWN0IHRvIG1lIGJlY2F1c2UNCj4gaW4geW91ciBzY2hlbWUs
IGRldmljZSBBIGlzIG5vdCBldmVuIGF3YXJlIG9mIHRoZSBleGlzdGVuY2Ugb2YgZGV2aWNlIEIu
IHJpZ2h0Pw0KPiANCj4gUmVnYXJkcywNCj4gT2FrDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiBGcm9tOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+ID4gU2Vu
dDogV2VkbmVzZGF5LCBKYW51YXJ5IDMxLCAyMDI0IDQ6MTUgQU0NCj4gPiBUbzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+DQo+ID4gQ2M6IFplbmcsIE9hayA8b2FrLnplbmdAaW50
ZWwuY29tPjsgQ2hyaXN0aWFuIEvDtm5pZw0KPiA+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNv
bT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IEJyb3N0LA0KPiA+IE1hdHRoZXcg
PG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgRmVsaXggS3VlaGxpbmcNCj4gPiA8ZmVsaXgua3Vl
aGxpbmdAYW1kLmNvbT47IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPjsgZHJp
LQ0KPiA+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR2hpbWlyYXksIEhpbWFsIFByYXNh
ZA0KPiA+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgQm9tbXUsIEtyaXNobmFp
YWgNCj4gPiA8a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+OyBHdXB0YSwgc2F1cmFiaGcNCj4g
PHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47DQo+ID4gVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmph
bmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsgaW50ZWwtDQo+ID4geGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhhdC5jb20+
OyBTaGFoLCBBbmt1cg0KPiBODQo+ID4gPGFua3VyLm4uc2hhaEBpbnRlbC5jb20+OyBqZ2xpc3Nl
QHJlZGhhdC5jb207IHJjYW1wYmVsbEBudmlkaWEuY29tOw0KPiA+IGFwb3BwbGVAbnZpZGlhLmNv
bQ0KPiA+IFN1YmplY3Q6IFJlOiBNYWtpbmcgZHJtX2dwdXZtIHdvcmsgYWNyb3NzIGdwdSBkZXZp
Y2VzDQo+ID4NCj4gPiBPbiBXZWQsIEphbiAzMSwgMjAyNCBhdCAwOToxMjozOUFNICsxMDAwLCBE
YXZpZCBBaXJsaWUgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEphbiAzMSwgMjAyNCBhdCA4OjI54oCv
QU0gWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4g
PiBIaSBDaHJpc3RpYW4sDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IE52aWRp
YSBOb3V2ZWF1IGRyaXZlciB1c2VzIGV4YWN0bHkgdGhlIHNhbWUgY29uY2VwdCBvZiBTVk0gd2l0
aCBITU0sDQo+ID4gR1BVIGFkZHJlc3MgaW4gdGhlIHNhbWUgcHJvY2VzcyBpcyBleGFjdGx5IHRo
ZSBzYW1lIHdpdGggQ1BVIHZpcnR1YWwgYWRkcmVzcy4NCj4gSXQNCj4gPiBpcyBhbHJlYWR5IGlu
IHVwc3RyZWFtIExpbnV4IGtlcm5lbC4gV2UgSW50ZWwganVzdCBmb2xsb3cgdGhlIHNhbWUgZGly
ZWN0aW9uIGZvcg0KPiA+IG91ciBjdXN0b21lcnMuIFdoeSB3ZSBhcmUgbm90IGFsbG93ZWQ/DQo+
ID4gPg0KPiA+ID4NCj4gPiA+IE9haywgdGhpcyBpc24ndCBob3cgdXBzdHJlYW0gd29ya3MsIHlv
dSBkb24ndCBnZXQgdG8gYXBwZWFsIHRvDQo+ID4gPiBjdXN0b21lciBvciBpbnRlcm5hbCBkZXNp
Z24uIG5vdXZlYXUgaXNuJ3QgIk5WSURJQSIncyBhbmQgaXQgY2VydGFpbmx5DQo+ID4gPiBpc24n
dCBzb21ldGhpbmcgTlZJRElBIHdvdWxkIGV2ZXIgc3VnZ2VzdCBmb3IgdGhlaXIgY3VzdG9tZXJz
LiBXZSBhbHNvDQo+ID4gPiBsaWtlbHkgd291bGRuJ3QganVzdCBhY2NlcHQgTlZJRElBJ3MgY3Vy
cmVudCBzb2x1dGlvbiB1cHN0cmVhbSB3aXRob3V0DQo+ID4gPiBzb21lIHNlcmlvdXMgZGlzY3Vz
c2lvbnMuIFRoZSBpbXBsZW1lbnRhdGlvbiBpbiBub3V2ZWF1IHdhcyBtb3JlIG9mIGENCj4gPiA+
IHNhbXBsZSBITU0gdXNlIGNhc2UgcmF0aGVyIHRoYW4gYSBzZXJpb3VzIGltcGxlbWVudGF0aW9u
LiBJIHN1c3BlY3QgaWYNCj4gPiA+IHdlIGRvIGdldCBkb3duIHRoZSByb2FkIG9mIG1ha2luZyBu
b3V2ZWF1IGFuIGFjdHVhbCBjb21wdXRlIGRyaXZlciBmb3INCj4gPiA+IFNWTSBldGMgdGhlbiBp
dCB3b3VsZCBoYXZlIHRvIHNldmVyZWx5IGNoYW5nZS4NCj4gPg0KPiA+IFllYWggb24gdGhlIG5v
dXZlYXUgaG1tIGNvZGUgc3BlY2lmaWNhbGx5IG15IGd1dCBmZWVsaW5nIGltcHJlc3Npb24gaXMN
Cj4gPiB0aGF0IHdlIGRpZG4ndCByZWFsbHkgbWFrZSBmcmllbmRzIHdpdGggdGhhdCBhbW9uZyBj
b3JlIGtlcm5lbA0KPiA+IG1haW50YWluZXJzLiBJdCdzIGEgYml0IHRvbyBtdWNoIGp1c3QgYSB0
ZWNoIGRlbW8gdG8gYmUgYWJsZSB0byBtZXJnZSB0aGUNCj4gPiBobW0gY29yZSBhcGlzIGZvciBu
dmlkaWEncyBvdXQtb2YtdHJlZSBkcml2ZXIuDQo+ID4NCj4gPiBBbHNvLCBhIGZldyB5ZWFycyBv
ZiBsZWFybmluZyBhbmQgZXhwZXJpZW5jZSBnYWluaW5nIGhhcHBlbmVkIG1lYW53aGlsZSAtDQo+
ID4geW91IGFsd2F5cyBoYXZlIHRvIGxvb2sgYXQgYW4gYXBpIGRlc2lnbiBpbiB0aGUgY29udGV4
dCBvZiB3aGVuIGl0IHdhcw0KPiA+IGRlc2lnbmVkLCBhbmQgdGhhdCBjb250ZXh0IGNoYW5nZXMg
YWxsIHRoZSB0aW1lLg0KPiA+DQo+ID4gQ2hlZXJzLCBTaW1hDQo+ID4gLS0NCj4gPiBEYW5pZWwg
VmV0dGVyDQo+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uDQo+ID4gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gNCg==
