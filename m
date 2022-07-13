Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E95731F9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F1F18B3FC;
	Wed, 13 Jul 2022 09:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401BF18B3FC;
 Wed, 13 Jul 2022 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657702983; x=1689238983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=0OQPcx2YjgGg/um+PprqmoA6v4CvkN6i4qIGnDn6rJg=;
 b=OwHjheOvteKUiE4Yx2EDS1b12GjUXgpZM9dUT0xjLMp4xpy2GPt6tPZX
 88IIuQy4WCglN9c4Ibsjueq/oViuI5Q5JVwSWMFlWoksG2OeYzpyMz2XL
 11oUAiwwHG9xl9Oc8WrnkdDlWTVwT4r8XQ5x4be79NqGHwmygbllzJlTq
 obj9yJqQOO5nJ34EBzA2zoIDM/NcAI8bVUXkJSu6mB6jlzjWKrkDMMEfh
 Q/6Z3kSZBFJ4zLPYNU1vNIRhVRKJ/wUjLInpZlQ22DW9QI3jnh5L6kXnt
 nnyZGRqLrlPQh5cH0v1ojYKuK/CF4V/g4cSRNq2GVas+EkhnGo9haC6Cs w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="310788342"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
 d="scan'208,217";a="310788342"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 02:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
 d="scan'208,217";a="622861490"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 13 Jul 2022 02:03:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 02:03:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 02:03:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 02:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMz9ocEO8LB5iYOpU3gI6kBzuzP9GREhNXLbLKV3rRGjjnqRdA33YyYlL8Q5P3PrBAQsHTVegfzVrB54g4O5YqFOkXx7M/XCJ6CuKpxbBBagFvdoRt92eFTSt6sazuYfcPKrP+tvU1ASBMG4SunoWgT/aRLPWSk38DiFNs2a3tvxwdMdY97jrKvEFNGH11YrurbXbGiONmHl0BmMM7a8h+WPtc38Id7ospbEgAoh0m9G8RVoHUTSktYGHsNDrKBqobCvn/PSlRyTjgJkfzyDDarBESglPYEKGtRmNmI9JptgW9Jgto5eOKDjZCT1Ry0joa5o+h1jvFTQhp3VvpSuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6bdLs80pmqbtut2LJ/wLEGnEoAukpFvK9ZEwMr5Ua4=;
 b=O7QT3wg7M4dS0cLpDXxkdE0N2L8CQADuLLsnqG+D0TXvejCxgtdaZreLYyOpE+tHr9PjmFIJjKGzWzh2cPHMjtYmJ+J45sPWVxT8In8NI8OMzdK5fLqUSiGzEdJtSXCy8fr4V3GcegSell1KFlYY0skVOdfhGtkgo/Vnkv3XpvxLOpCudFLyTsZxpqMNJfieY2XSpR14wnySA5Ju4PPJATkL6ONL+mVFc4yTdjc1CYarWJtezIdoQHIRj/DT9PNrTkhNZ20Og+l05+amQYtAlXnRqE8rPPMe77yy/59EQ7X0acG8nMQWS37mW/M/u36AmZ6GUnMc681OsSVQ2fQSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by DM5PR11MB0012.namprd11.prod.outlook.com (2603:10b6:4:68::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 09:02:59 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::71c4:bbd3:4a5a:ad1f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::71c4:bbd3:4a5a:ad1f%4]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 09:02:59 +0000
Content-Type: multipart/alternative;
 boundary="------------osYDrcAVeXX9u0U0MDnAPe7Q"
Message-ID: <23f85227-6892-e4d3-a908-13436e8fae2b@intel.com>
Date: Wed, 13 Jul 2022 11:02:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/39] drm/i915: i915_gem_ttm: fix a kernel-doc markup
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
 <836c640e6c65cb2b444d4072b93eaae1e9636897.1657699522.git.mchehab@kernel.org>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <836c640e6c65cb2b444d4072b93eaae1e9636897.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: LO4P123CA0546.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::17) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c82615c-51d6-4982-eb86-08da64ae7c1b
X-MS-TrafficTypeDiagnostic: DM5PR11MB0012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wI0w41cbV2D6ISKK80kTVVJhrNyVTQeUS03kPsYSDyegSevKFzmvKi63jvu8tZ6mf8uRWOpEpwym8ywr90eV4qHTpwGiurV2VjggyhWPy+MBLBXkOQ1rHroBHBu3MCT3qivjkG+s6r4cAHiNfdzq1V+dz7bCJA9IGDGwWFAp02e0y6rfU4aZ6yEVBhAJ42Skzz+l4BOCzqY8bqZehOsXYDXuA/lYbsSYeSBiAZoezmd6K5b3k8frlsPPppYUedOQjhCGq5QEBkob6x46A/88366Kp3NmnWzPbUE5WSYlSkdSVKuA5FH9xrbZYz3iYJdratqkLhxLqih7F8El1+QiIrs2cXyO6yZW0PCmSEvoW4XYeiBlhJ1dzdBnzdH1QUbSeSUxfcB8l80hRx201dpu50BbNZGRC12sNHVxePrqPpEsbRb+deQW5TUUuBk28CHpxjWDL0AZZFwugPlSCw25NAc4ZlEnM36ectTBj5F8iWCfoiAU47kWjUDXy8L8tEWLMpLEDF2G4kl19Y8dkO0HE7RHS/D0V/qc2VzGrFl7BXzEj/OFWFp4n1Fhv8Z3jR3zrYduj74ISeBWYwL4s7IAT7sdkUnJxJK0+uZffegznnJR+F5tmZRicYsG/An8UMqxUIZuEx5KdKum9e6hbUzEg2Pfv8QV0OQa7IeMc4UztaR0wBGKFvqx7MiyIMiq5VqZVuS2gOHwW3KbOIO+sV+90e2uJwwMam+8CuHg/KlmrK/vlNP9KxJITUPnpNX9p60Al2tbGvvNhliSYXkyXi6/+X0zPDURlbbB5SJF8QY+nzMB7FVFhOYXu9Y0tAV+n03D81+SH+tQ+ZCPO9P8Ih/QQtmHhBl4s8hOVj3sPV/no8VY2l/01N/bMDAy0p5eCHYs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(39860400002)(346002)(396003)(31696002)(83380400001)(6486002)(66946007)(478600001)(66556008)(966005)(316002)(54906003)(2616005)(82960400001)(8676002)(4326008)(66476007)(186003)(86362001)(166002)(41300700001)(36756003)(53546011)(33964004)(38100700002)(6916009)(6512007)(26005)(8936002)(6666004)(7416002)(5660300002)(6506007)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3VvZ25EZTBZenpaL05ZdU90QlJZM1BJVklma2RIcmVtQjVUN3ArTkpQMzJy?=
 =?utf-8?B?Kzl3MmQ2ais3NGF3S2Zac0pkS3hpbTdKcXFiRVJzZWxLVTByWkpTOXR4OXp3?=
 =?utf-8?B?bCtjRm5yT1VKdE5WNWgwTFozQ1BlR0I5Q0orUVFldzJ5aGZueDhzUzgyUjRM?=
 =?utf-8?B?UDhQZnBkL2JGRVptdWJEUmMzVjU4Q1A5RUtNMnQyZllEQThqdzVoeUViSEhK?=
 =?utf-8?B?QzdJckFrUWp5dmYxSDJRZUJoS2dGTGdiZ3hLK2h3QWdISDMvZkxwNGsyWlc3?=
 =?utf-8?B?alpVeHFjZTRlSmc3T0VwSTB2RE1heHNrL1hYTUR0L0drTFVDNlpPbkNtdmRL?=
 =?utf-8?B?ZlFGNjBTOU80QVo5b093czNiWDMveWp0QTJMUmttRWN0VDlIUm1LSHpxUXQw?=
 =?utf-8?B?V1F5Qjk5di9BYjl4K1BDb0xBak1pc3FKZ1ZTczFjQ2prU3FSRHN6Wkx3emVJ?=
 =?utf-8?B?Q29kYzZNcUdTam4wVldtUk5ibTVNQTN6TUdlYmJXSTUvL2VucWNRNFRRc2Z6?=
 =?utf-8?B?K0Q3elJjaC84dzdwOUhlcXJKYlNsN0JZWlpQajBSaHVqWGx1VzFqM3Y2RmxJ?=
 =?utf-8?B?RWlncHJ2dnNJUjd5Nlk1WUJDR3Z4OUlmazZtVjZjbjJkeDNWZXBzU1pnODh3?=
 =?utf-8?B?ZUpXZjh3NzEyYXJqaXN5Y0ROS0pldUpCazJtaHg2c25rZk83VmMvTVJCWTdh?=
 =?utf-8?B?Skx2WEt3WHRoRHFJV3lXeFFxOFhkejc0YjdoaHlybVhyVkgvZnJISWpjWjBV?=
 =?utf-8?B?UjVvN296cDJTTCszVGRERWhoVTFOc3haa0tvcDl0aXRQNDYwbndlTEJrY1hV?=
 =?utf-8?B?R1QrUVFVSVMrRDY2NGdaVCtHREhCMk9mQUdzTEhNaTdiODhxS0htOGVuc05Y?=
 =?utf-8?B?NlZHcXg4WENZMTY0akE4VVhSSlUrTVVRTkdmM2NJUmFwOHhsR1J2WDEyWGpW?=
 =?utf-8?B?ZW8zZWFrTnZhSzNrL0JxTzJoZlBnYlpEOXJ5WmI5L2NyeTczdDhNWFZRT1dG?=
 =?utf-8?B?VkZ6QWRCODZVc3FhOG43QkFjckp5TlpOMkd3R24rUHJrOVV0KzVVby9zb1hs?=
 =?utf-8?B?U2JaYzFzY2MyNG4xQmFvR2dsTm5CK3VkclRGSS9oVzRWUzNoaEQrRld6TFlW?=
 =?utf-8?B?dVB0dENWOEZKcnNDMitZczNTUVZRQjUvZzNPbGNTZWpQQi9RVmdxSlZuN2Ir?=
 =?utf-8?B?TE9XdVZ4ajZwd1VYZUpCZnlxdDJ6dkx0Tkxaa1NtUHJtMjJIcU9YS25sR3Nz?=
 =?utf-8?B?ek5kYVlBRU5qcGhHYURDS2IxaG1CU1J5blVZSDJIOHFOMlV5VFFUL3dsQk9L?=
 =?utf-8?B?S1plWTEwSklIUmMwa2pnNGF3MWRlY1R3TTdSZTFWVDZ1VkhOcWVEQlB4TDNx?=
 =?utf-8?B?b0V1c3gvemp5b0ljbEdkemh2RlRCaTZ1UXcveG83SWdhUytvVEZXVy9IRkJV?=
 =?utf-8?B?aTBUcEdTcTNDK1AzdFF4WUhDRmkyQVFLV2dFRUo5aDFVU2JnZHNVV0dLZ29a?=
 =?utf-8?B?QlRMdDFzYXpUZko1ZjNpckFSMVVIUjNmSithdDlCSWlVeDFPNkEvb3ZUdkt6?=
 =?utf-8?B?WXJPZ3dFWHJ0Y1RtbktNRzNhdE94WTJEbFhlM1ovUUtrM296cWtDYUFDOVpa?=
 =?utf-8?B?WHozNWVzaTFncGdBSkNRVHZ5SmZiZnlnSHhadk8wb0c5MHFjbDBYN1ZIK0Vt?=
 =?utf-8?B?RXYyRHdib1AvMHAzZjFkc1VaVURubzdTeS83RnNoNVVRSDVpSU5FaGx6ZkFi?=
 =?utf-8?B?cC9ZdEk1UFBXZGlQcWNJVE9mU0EyY1hrK2J1SE1Welp0Q25ZUkk0ai9NZzdz?=
 =?utf-8?B?TEUxZXhIdUMwWHIwckVIT1J1aGdORkNJL1dEVG9SdE9ncm5HQTVSZnJrSzYv?=
 =?utf-8?B?dmQwUTNxbmgzMWhRR21rLzFLSEMvUUFNTHAzWTdrcFoxVFp5OGRieHZrZzI4?=
 =?utf-8?B?V1d0bHRlWjc2MG9HTWtQQUM4eGVBaFo2OE1JN2NsNW5ZSnRObjV2SUs1WVVi?=
 =?utf-8?B?ZjI2SjlFVVpYTHdlRnQvMUtXZnhCMlNsUllnWlk0QmVDR1ptQ3RGVGExd3I1?=
 =?utf-8?B?SjNLNWx4N3MwV0J0aGZoWnVNWnF2YU1tVDBPdzJDTEVGeFYyWUVOdWQ1VU94?=
 =?utf-8?Q?trpcHYc2S8/ModSQ3Ocm2EFzU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c82615c-51d6-4982-eb86-08da64ae7c1b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:02:59.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSTIPOgk1aB2k6/3CRH8L4ajl16Q5LQI4eJAJX8zuvnHoZ2YOZ15lZ5OEhIB6IDzmovMY8+rnEEX6ovCdmf0cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0012
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------osYDrcAVeXX9u0U0MDnAPe7Q
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

fFJldmlld2VkLWJ5OiBOaXJtb3kgRGFzPG5pcm1veS5kYXNAaW50ZWwuY29tPnwKCk9uIDcvMTMv
MjAyMiAxMDoxMSBBTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IFR3byBuZXcgZmll
bGRzIHdlcmUgYWRkZWQgdG8gX19pOTE1X2dlbV90dG1fb2JqZWN0X2luaXQoKSB3aXRob3V0Cj4g
dGhlaXIgY29ycmVzcG9uZGluZyBkb2N1bWVudGF0aW9uLgo+Cj4gRG9jdW1lbnQgdGhlbS4KPgo+
IEZpeGVzOiA5Yjc4YjVkYWRlMmQgKCJkcm0vaTkxNTogYWRkIGk5MTVfZ2VtX29iamVjdF9jcmVh
dGVfcmVnaW9uX2F0KCkiKQo+IFNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYjxt
Y2hlaGFiQGtlcm5lbC5vcmc+Cj4gLS0tCj4KPiBUbyBhdm9pZCBtYWlsYm9tYmluZyBvbiBhIGxh
cmdlIG51bWJlciBvZiBwZW9wbGUsIG9ubHkgbWFpbGluZyBsaXN0cyB3ZXJlIEMvQyBvbiB0aGUg
Y292ZXIuCj4gU2VlIFtQQVRDSCB2MiAwMC8zOV0gYXQ6aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL2NvdmVyLjE2NTc2OTk1MjIuZ2l0Lm1jaGVoYWJAa2VybmVsLm9yZy8KPgo+ICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bS5jIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90
dG0uYwo+IGluZGV4IDA1M2IwMDIyZGRkMC4uZThjZmI0N2I1ZjVhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYwo+IEBAIC0xMTg3LDcgKzExODcsOSBAQCB2b2lk
IGk5MTVfdHRtX2JvX2Rlc3Ryb3koc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgICAq
IF9faTkxNV9nZW1fdHRtX29iamVjdF9pbml0IC0gSW5pdGlhbGl6ZSBhIHR0bS1iYWNrZWQgaTkx
NSBnZW0gb2JqZWN0Cj4gICAgKiBAbWVtOiBUaGUgaW5pdGlhbCBtZW1vcnkgcmVnaW9uIGZvciB0
aGUgb2JqZWN0Lgo+ICAgICogQG9iajogVGhlIGdlbSBvYmplY3QuCj4gKyAqIEBvZmZzZXQ6IFRo
ZSByYW5nZSBzdGFydC4KPiAgICAqIEBzaXplOiBPYmplY3Qgc2l6ZSBpbiBieXRlcy4KPiArICog
QHBhZ2Vfc2l6ZTogVGhlIHJlcXVlc3RlZCBwYWdlIHNpemUgaW4gYnl0ZXMgZm9yIHRoaXMgb2Jq
ZWN0Lgo+ICAgICogQGZsYWdzOiBnZW0gb2JqZWN0IGZsYWdzLgo+ICAgICoKPiAgICAqIFJldHVy
bjogMCBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCkludGVsIERl
dXRzY2hsYW5kIEdtYkgKUmVnaXN0ZXJlZCBBZGRyZXNzOiBBbSBDYW1wZW9uIDEwLCA4NTU3OSBO
ZXViaWJlcmcsIEdlcm1hbnkKVGVsOiArNDkgODkgOTkgODg1My0wLCB3d3cuaW50ZWwuZGUgPGh0
dHA6Ly93d3cuaW50ZWwuZGU+Ck1hbmFnaW5nIERpcmVjdG9yczogQ2hyaXN0aW4gRWlzZW5zY2ht
aWQsIFNoYXJvbiBIZWNrLCBUaWZmYW55IERvb24gU2lsdmEgIApDaGFpcnBlcnNvbiBvZiB0aGUg
U3VwZXJ2aXNvcnkgQm9hcmQ6IE5pY29sZSBMYXUKUmVnaXN0ZXJlZCBPZmZpY2U6IE11bmljaApD
b21tZXJjaWFsIFJlZ2lzdGVyOiBBbXRzZ2VyaWNodCBNdWVuY2hlbiBIUkIgMTg2OTI4Cg==

--------------osYDrcAVeXX9u0U0MDnAPe7Q
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4
dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4KICA8L2hlYWQ+CiAgPGJvZHk+CiAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPjxjb2RlIHN0eWxlPSJwYWRkaW5nOiAwcHg7IHRhYi1z
aXplOiA4OyIgY2xhc3M9ImhsanMgZGlmZiBsYW5ndWFnZS1kaWZmIj5SZXZpZXdlZC1ieTogTmly
bW95IERhczxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpuaXJt
b3kuZGFzQGludGVsLmNvbSI+Jmx0O25pcm1veS5kYXNAaW50ZWwuY29tJmd0OzwvYT48L2NvZGU+
PC9wcmU+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDcvMTMvMjAyMiAxMDox
MSBBTSwgTWF1cm8gQ2FydmFsaG8KICAgICAgQ2hlaGFiIHdyb3RlOjxicj4KICAgIDwvZGl2Pgog
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOjgzNmM2NDBlNmM2NWNiMmI0NDRk
NDA3MmI5M2VhYWUxZTk2MzY4OTcuMTY1NzY5OTUyMi5naXQubWNoZWhhYkBrZXJuZWwub3JnIj4K
ICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5Ud28gbmV3IGZpZWxkcyB3
ZXJlIGFkZGVkIHRvIF9faTkxNV9nZW1fdHRtX29iamVjdF9pbml0KCkgd2l0aG91dAp0aGVpciBj
b3JyZXNwb25kaW5nIGRvY3VtZW50YXRpb24uCgpEb2N1bWVudCB0aGVtLgoKRml4ZXM6IDliNzhi
NWRhZGUyZCAoJnF1b3Q7ZHJtL2k5MTU6IGFkZCBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3JlZ2lv
bl9hdCgpJnF1b3Q7KQpTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOm1jaGVoYWJAa2VybmVsLm9y
ZyI+Jmx0O21jaGVoYWJAa2VybmVsLm9yZyZndDs8L2E+Ci0tLQoKVG8gYXZvaWQgbWFpbGJvbWJp
bmcgb24gYSBsYXJnZSBudW1iZXIgb2YgcGVvcGxlLCBvbmx5IG1haWxpbmcgbGlzdHMgd2VyZSBD
L0Mgb24gdGhlIGNvdmVyLgpTZWUgW1BBVENIIHYyIDAwLzM5XSBhdDogPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVy
LjE2NTc2OTk1MjIuZ2l0Lm1jaGVoYWJAa2VybmVsLm9yZy8iPmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9jb3Zlci4xNjU3Njk5NTIyLmdpdC5tY2hlaGFiQGtlcm5lbC5vcmcvPC9hPgoKIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYyB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRt
LmMKaW5kZXggMDUzYjAwMjJkZGQwLi5lOGNmYjQ3YjVmNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fdHRtLmMKQEAgLTExODcsNyArMTE4Nyw5IEBAIHZvaWQgaTkxNV90dG1f
Ym9fZGVzdHJveShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogICogX19pOTE1X2dlbV90
dG1fb2JqZWN0X2luaXQgLSBJbml0aWFsaXplIGEgdHRtLWJhY2tlZCBpOTE1IGdlbSBvYmplY3QK
ICAqIEBtZW06IFRoZSBpbml0aWFsIG1lbW9yeSByZWdpb24gZm9yIHRoZSBvYmplY3QuCiAgKiBA
b2JqOiBUaGUgZ2VtIG9iamVjdC4KKyAqIEBvZmZzZXQ6IFRoZSByYW5nZSBzdGFydC4KICAqIEBz
aXplOiBPYmplY3Qgc2l6ZSBpbiBieXRlcy4KKyAqIEBwYWdlX3NpemU6IFRoZSByZXF1ZXN0ZWQg
cGFnZSBzaXplIGluIGJ5dGVzIGZvciB0aGlzIG9iamVjdC4KICAqIEBmbGFnczogZ2VtIG9iamVj
dCBmbGFncy4KICAqCiAgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgbmVnYXRpdmUgZXJyb3IgY29k
ZSBvbiBmYWlsdXJlLgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICA8cD5JbnRlbCBEZXV0c2No
bGFuZCBHbWJIPGJyPlJlZ2lzdGVyZWQgQWRkcmVzczogQW0gQ2FtcGVvbiAxMCwgODU1NzkgTmV1
YmliZXJnLCBHZXJtYW55PGJyPlRlbDogKzQ5IDg5IDk5IDg4NTMtMCwgPGEgaHJlZj0iaHR0cDov
L3d3dy5pbnRlbC5kZSI+d3d3LmludGVsLmRlPC9hPjxicj5NYW5hZ2luZyBEaXJlY3RvcnM6IENo
cmlzdGluIEVpc2Vuc2NobWlkLCBTaGFyb24gSGVjaywgVGlmZmFueSBEb29uClNpbHZhJm5ic3A7
Jm5ic3A7IDxicj5DaGFpcnBlcnNvbiBvZiB0aGUgU3VwZXJ2aXNvcnkgQm9hcmQ6IE5pY29sZSBM
YXU8YnI+UmVnaXN0ZXJlZCBPZmZpY2U6IE11bmljaDxicj5Db21tZXJjaWFsIFJlZ2lzdGVyOiBB
bXRzZ2VyaWNodCBNdWVuY2hlbiBIUkIgMTg2OTI4PGJyPgo8L3A+Cgo8L2JvZHk+CjwvaHRtbD4K

--------------osYDrcAVeXX9u0U0MDnAPe7Q--

