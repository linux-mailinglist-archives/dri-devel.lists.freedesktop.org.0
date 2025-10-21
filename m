Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7960BF4251
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E813310E2AE;
	Tue, 21 Oct 2025 00:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atzTBFBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAA410E114;
 Tue, 21 Oct 2025 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761006404; x=1792542404;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+IRwKutFaOVKKyEzwBuPpEyrQobXom3I7m/1oFQjIEc=;
 b=atzTBFBimz2w02AIfwYojXN0QIQg1g5DE7Xr4rTtJgtk9nnAVLo6YYt3
 jPB+zzA4RPrAPsWXLoN30vRB2ffa9W9VlmIcgwokJ7/UZ69aKW5lnDF+E
 mCXhteLoaOZizi9ufH9blon2PRlAtNZRUCQK5flDybvdaehGkQg26fBBq
 s+RgPbnZI8aEexyOH0HCvbiVZS8hO16u5Z9t08zrKGVosm6UDXZGF09ch
 lyJAvlu6cLX68bHhfR3N22jvKvGxkNg759KJJSPFtBavA+GMbFwLiFc1z
 1ZI/NdA9fnMtM7XRwdarA3MOuemZ4e2YPYqDHqap8ed1GtvKoJaQfMlEj g==;
X-CSE-ConnectionGUID: U9y8b0T0R8CDEaMwQn4FSQ==
X-CSE-MsgGUID: 3i7D2BbdTRCWMVuWN3jpew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88597610"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="88597610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:25:12 -0700
X-CSE-ConnectionGUID: VC83GEqrR6iTqJbQv0m22Q==
X-CSE-MsgGUID: gnF/wKwJQNG0i9qwx9O65w==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:25:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:25:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:25:11 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWhS5m2lp8bqxIF9tJrhPkpgDJQfpaghs70VZF+3iaRZRuNx0cKTG1+u+KcY8F0DY7OkzA9RQxAc0OqJ7S0w+Oaw05c/DvPYyyyXP9pJF4ILa2rUU2mWmSDruxOR4Rc+yR/Xwc1qiuBmbP999/eLeNK3hAEfDobx6F7YNQc9MeeSj6jxzsXHu38pKRgDGbFeYElDSH6p9UaDVhSBYleFsJ/AnAU+3ZzpewJWrcYNJHOlu9Q6QTFUfOcd1LevoMhEGXVEfjf0LgymcOnH9eGzwd/3usopKXcaWNB/AarTF2pFuKYu8Tj5dNpZ2LrvE3EBKNA5wf7fWTtl4HbXHRwZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuqCXEN8+tzXqgEw1XNG9ka/NtRoGrTK77ud8CVIQjk=;
 b=u0m2EnPdVAslLKOK3QUy9Tcz1JEwhtSM79OMhCXlrYnTMYlBxTEelR755cfvrzahLc3N16tlk5BOWSVpxG6PcaebUCVE37nBbqNzi2M9qBFc7ag4wTu3oLLenMfKXpRFy2rB6rpj/QuGegNUKTKFSmjCeSzTqI9+G4n32fVqVrx2TmtDVugnm9SEq6e7bS3/bN70alOUr6y9VsPkj9n/QJThAQwDxS9kVqCXqTC+pYIMIKFM1g4z7T66RojBU93a9fjDy2EnqJ4HrmL0OMKzJeMSkE/q4AFI7TsWKhzKK9GMTjkZryiP3ifdHTd7dxLd6qTkShJI9yzfTfvGJBosJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 00:25:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:25:09 +0000
Date: Tue, 21 Oct 2025 02:25:05 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 07/26] drm/xe/pf: Add support for encap/decap of
 bitstream to/from packet
Message-ID: <lshheaburks472yprtnu2ifdnp7ycttkaecaxnjabanrtefp3x@i72vekaldlty>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-8-michal.winiarski@intel.com>
 <348503b5-0503-4da1-a93d-e55c81fd910b@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <348503b5-0503-4da1-a93d-e55c81fd910b@intel.com>
X-ClientProxiedBy: BEXP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::11)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcda716-7dd5-4b75-9f66-08de10384a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDByY2N6dlNwQW5aVEw1TGk2T0JzdFlYVnZEa2MvV1ZWY2R1clZweXFnNDNa?=
 =?utf-8?B?ekJ5a2ZaZStHKzB6SkYwUzhmSldWR1hzSnJ0dU0xZnBiU25nS0hveXgvcHZU?=
 =?utf-8?B?UEhBbUJrU0szS29sUkU0MjVpdnpsL0FVaWUwZkdsYlRiQ0ZVUWtWMVdsQWJQ?=
 =?utf-8?B?bzIyVG5wN2oxSEJTMXg1V0tDWTI3VkVkTVQvSTRCcVpkQU1Zek5xcmZCVU0v?=
 =?utf-8?B?eE1uUGZsVDVLYXFiY2dmNno5OGg5c2xYOUtHMnNydXEzZnc3a2lBY2ZBaVU0?=
 =?utf-8?B?UGhmOFRnbEo2aXlYMTF0dWl1TFp3b1FCdHhONzlxL3JGQXNtUVpCR3BhWUgr?=
 =?utf-8?B?T0RFa3BjdVRBZFVXVU1uaS9EV0pLcmZIQzhVNm5ZTUtzYXJncGNIMThDOHlW?=
 =?utf-8?B?djBEaFZiRUZGMTBza1hXUi8rbmhzbm5IRXdUbHZKNGc0UWM1eCtjM2hXZldB?=
 =?utf-8?B?aHJJY3NXMFMrTHZMczVoU1NWcFlzWEJ4c0ZqbnlWWTJxK0hvTmtNaFRlYkll?=
 =?utf-8?B?d09XR3NWYk9ZVVhmQVhoMjhpQWdzSmowVGVxN096Q0JQd0pQU3R2eWd1clll?=
 =?utf-8?B?eVRwdVlXL3NrNWw4aWF2bVZnaVEzY0d3dXp5Wk8vejY1YnFnaXlMN3BPeFNL?=
 =?utf-8?B?QUhaZE83bW5KWVAzY3VVL3NvbGpGb2RLanhJR0tTdUl0bEVqWkFLWXJoK09s?=
 =?utf-8?B?azhhcEhvNkk1Nk1oYjBNQzZTQlJqc09sK1A4cm01VmN2cm53WGh1UjBzdVFi?=
 =?utf-8?B?alJZVVE1VU92RXNIZnBaT0g0MlB0R0NjbFRJalo1WUFmUXUvdFdNUkJFUUR1?=
 =?utf-8?B?SlJUVElOaFFZM3QxMElkM3ZMSlRRbk9pV1creUc0Vzg5SG1vdEw4LzgzM0t2?=
 =?utf-8?B?OW9YNW5oSFNTUFMxVlIvM3JQMlA1WWZyd2ZzK2ZiRlY2MmdjaTVyTTd5S3ZJ?=
 =?utf-8?B?Wmk1bkxvQVRkS2lkbWc5eHJIdTA4b0FMc0ZiWmdUdWZOaG0vQjNVT3kyM0sv?=
 =?utf-8?B?VFpybUpUVFlqcU8vb2ZPdzU2RytrWVYvSEZYdEU2eFQ1TG9HejQ0cDV1YUIz?=
 =?utf-8?B?Yytwb2daYWJBWEhSSVdDUkpiS21aTHhIck5aUzBZeVgzVGNwOFNIekwrenZp?=
 =?utf-8?B?V3BjaS80Mmwyak1SbUppVzB0NVhhdVErbmNQTlJHUi9XWUp1SGpBZWttUjE1?=
 =?utf-8?B?QzEzSUx4N2lQemNWbXVWako0ekh2dk5uNmJpRStLU05HSFBMQk51a20wbk5T?=
 =?utf-8?B?STlmQU1xRkJKVEd6emlwcndXTnRmZEJjWUpwM2w1aUgrVk9qaVRMM2hGdGJm?=
 =?utf-8?B?SFpweEh6a0V0Y1FITnVIcWVTYkxSOWNpaEtFS0p4MHBjU3RnUVBRRisrKzNT?=
 =?utf-8?B?TjBleEpDUEsveXRPbUZiaXhOcFJXUUZnb1VTdXp3UDBndjU2QlFqbWpTNjdB?=
 =?utf-8?B?ZTdKMktzenNCRGRKN2QzUDZKOUJGVkhFMk5maFhobkJDY3kxTEVzdGRZWEc1?=
 =?utf-8?B?bG9YQ0wvaGZveHEzTFlBY1B4ak00RldOQ1k3aUVRdEU5WWJkcGROOVFoL0p1?=
 =?utf-8?B?OUV3Zk9YYSsrZTJ2eEd2ejd5cFZmYUxNSWo1NEVPQXRGQU0vSTZab3RIWVB5?=
 =?utf-8?B?dUg0cjdMdytzQlBXVkFSL2djcFRBUG1rVnpMWlExYjRPdDNhT3ZHWTBqRmhr?=
 =?utf-8?B?NW9xdzVCU1dYanc0WVI5cnR1eGlDOFRZYVhRR2dZL1ZJcFU5eUlYb3hhRGFt?=
 =?utf-8?B?a1I1YjJOWkRVeVJuZmVOT0RrNHprUGkxT3E3TVdEZW1Hc0FaaS9iWXI2eHlU?=
 =?utf-8?B?ck9QL052SDBBRVo4SjRGVnJESlcyc0xFNXVyYzJRdHQ5a2hPZG4wOXNhQkJj?=
 =?utf-8?B?aXdXVHdYcC81bnpmdnZWZ0NybUpSZkdvdkdPVjVaMUhMNVh5Lzh1a0V6MUNQ?=
 =?utf-8?Q?A7dxkcyB2mIpAj23W51aTj+GWNqv0L9P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHVaOUxtc3pvVWV1UytlUk5lN3hMUWFTaUJjdHZyazF2ZDVIU0E1NFptZGlY?=
 =?utf-8?B?UUZiY2NwYjF5L2tCbHVQN1BHMkhCZVc5Z1pieTMrbmdnODh4VDF6WG9oMTBh?=
 =?utf-8?B?Y1RCUXlHaFRFeUVvL0RMOTZ6VTVuZHZ4d3VhWk1pWklzVkpPcFg1R1hoWmI2?=
 =?utf-8?B?SVVsbWczL3FSWmR0SkV1MWo5TG54bFk1Vnh5WXkvUXQyak82T1JRRmd0bGRW?=
 =?utf-8?B?QjRMbVE0OUVzbStKREVPQWpjSXRsbWJjY3NlZldnYjJ2cGRia2J6QmR2anAy?=
 =?utf-8?B?UWFYR0NPbnJweWxuY0Y3eGxoczM5dmNsemFnTmRXbTJVUldRN0ZrV2tIaVZM?=
 =?utf-8?B?RThETXp0bVJmblI1MTFkTVJOakhhVHY5VmlVclpCd2xlaUx0Z25EYk1UQ3Bx?=
 =?utf-8?B?R0ppL3ZweXFsRGEzVUpldDI2QzNPUzZXMFdvOXRCTWNCRlJ2bkdIUGlQOG1L?=
 =?utf-8?B?Zyt5czBVZXFNNmJ2bUM3ZHNCVnRVNktVeWxVclVVWFZkWC94ZnhHOWhRT2N6?=
 =?utf-8?B?TW5nSlEwaDlkb0x0RE9GUG1relZsUksrclM3U1RBeFdJQnMvd3J4cWlvaWFK?=
 =?utf-8?B?aU1kbnlwRG9YSXlUMTV5Z2kzc3FjaHVESGVPTlR3WHd1SE1oZ1M4aGo4dkFB?=
 =?utf-8?B?NEYwWEFBRE1vUVhQVmhJY1UxUmNQdHZOYnJ4YjBaa3ZmR1pqNHRuVXBHQXlB?=
 =?utf-8?B?WVliNEs2VytybXFocDFaaHNodjdacm1TMDljZWJtY0hVbEVLZ0ZLZDBnWkpm?=
 =?utf-8?B?VGt0ckNGL2FTM3VnSUVlWGs5SVB4OVZKL0dhaEpETWdKRTh0SW44T1pLcVht?=
 =?utf-8?B?ZE1ZV0Ixdnd6RmViakVER2kvL3VvL2U1VHNMWGtTZW10bHlzM1FpbEVQOEJt?=
 =?utf-8?B?Rkt5YVQzRlJ0U3ZpQk5kbTI1NXIwY1dxcVBpT0R1bExoQnZBcGtHNnl6cU9W?=
 =?utf-8?B?N21kZlBoR1BxRFVFcWhlRytYT0RqbGZlZlp0VFdLd2UvOFZBSExuTlRybkla?=
 =?utf-8?B?dWY3d1NQZHBpbkMrOHRORkRIK3dEeW9NUTV3eDdaTnQ0YW4xR0p4V2dkNTlZ?=
 =?utf-8?B?MEhJV1B2bVhXRHh5bUgrci9ZWWxhYlVvd2QxOTI3ZVdRVmlScWtjdkZPUXhp?=
 =?utf-8?B?NE1uU2hWZXlwSXBYdHF6eVRmSDE3ZWN0bW52MHVOeVJ3azdpMFN4cjJwNVNo?=
 =?utf-8?B?cWtlS2JwWWlqWWRxbXBlSFUwaS9xckxJbEZFNGJWamxmVzVtSFl2T0FQd3RN?=
 =?utf-8?B?b2pJS2ZJQzRnQU04YytTWGF2aWY5ZU03M3dFS2ZzY1IxYi9KTVNWSHpUOG1K?=
 =?utf-8?B?WGVwRVpqcDVGQXpOMlZvd0UvaTNvSHRISTErZENGVnhiQUR4Q05JU3NzN3Aw?=
 =?utf-8?B?VUJ5Z084bG5XdXhEMCs2aHZTSFIycUlha01ocGd5Z1hjMTFYQlNCaEJpV0pD?=
 =?utf-8?B?RUZYYlhNZktKejVFSG95R2RNeXF3d1ppR3RseFd6RGF0dmRRQmR6dWNITkl1?=
 =?utf-8?B?dFdpR0c0Rmp5MFgvVnVta1lzeW1RdWNqeGpTbHVFcG8yT2U1T3ZYK1ZMVTBj?=
 =?utf-8?B?UlVjY3k2TzZwcXptbWpLTHFNaGY4aE1VdFJ1dmZnWnhqQ05pUWEyemVQMDQ0?=
 =?utf-8?B?WWZvZEJ2L1BEcVUzcU9Db3NCcjR6NnRVWkprQysvMDRnd2FsbUhXQUtwQlhU?=
 =?utf-8?B?blNNYXh5NmRCVHVESGdXOERITFVtUE9wcGt3SkRpYkQwQm5pWXhBQTV5UzEz?=
 =?utf-8?B?YldmdXNrRXJTWDFlcW1iMWxvczI0cTgvU2xmYVV4OUw1b3lab29sZzF6VVdH?=
 =?utf-8?B?K2JURXZKSGlJT0xtcXkwaFdGdVVzYU90K21jN0hvYVpoL1pCUlpqWDU4RWlN?=
 =?utf-8?B?RHNKUUM2R3dXVUluMlJNRGtmMlFjT3ZiZ3JvWkVQUHcybzk3L2xYcEptY3BK?=
 =?utf-8?B?Q3B6RE9Dd01yWGNodUNqQU13MEJVUXY2K09vbjFOVU9rSU4yWkQ3L1FmWEUv?=
 =?utf-8?B?WFM3cmFzNFNtY3VtVWxWcHZZL2hQTUJqQytXN2h5bnFkWWlFYmphNTArTWlM?=
 =?utf-8?B?Vk5iYWZWdHdJanp4czhNNUlMTWpqanF1YzRGY2QrT25yOHgyelZtdk5qQ1Ry?=
 =?utf-8?B?VHZzeDUxTjRqY2s4RDIxRWhnY2lEM1lYSlZvcUM4aVNiKzAyTmV0bjFPbFRF?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcda716-7dd5-4b75-9f66-08de10384a92
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:25:09.2227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grgA9vKzQHmJrT/DMc5sHVLUaNP7+Ev85djdXHZXMXAUre6xlNEaFuQ9XPi4yAUbbWL5QDUiHyCSW55h4wvNh0rj/xdSNP9D74NjTXTOQW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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

On Mon, Oct 13, 2025 at 12:46:18PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Add debugfs handlers for migration state and handle bitstream
> > .read()/.write() to convert from bitstream to/from migration data
> > packets.
> > As descriptor/trailer are handled at this layer - add handling for both
> > save and restore side.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  18 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   1 +
> >  drivers/gpu/drm/xe/xe_sriov_pf.c              |   1 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  45 +++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  56 +++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 353 ++++++++++++++++++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |   5 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
> >  9 files changed, 493 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index 04a4e92133c2e..092d3d710bca1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -814,6 +814,23 @@ bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfi
> >  	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_control_vf_data_eof() - indicate the end of SR-IOV VF migration data production
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + */
> > +void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP))
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +
> > +	wake_up_all(wq);
> > +}
> > +
> >  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> > @@ -840,6 +857,7 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> >  		return false;
> >  
> > +	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
> 
> above call can lead to state_machine_bug but here you just continue as nothing happen and moving to SAVED state
> 
> maybe that logic of that function should moved to a helper that at least returns bool so you can make the right decision?

Won't be relevant after applying changes from previous patches.

> 
> >  	pf_exit_vf_save_wip(gt, vfid);
> >  	pf_enter_vf_saved(gt, vfid);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > index 2e121e8132dcf..caf20dd063b1b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > @@ -15,6 +15,7 @@ int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
> >  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
> >  
> >  bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> > +void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid);
> >  
> >  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > index 95743c7af8050..5d115627f3f2f 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > @@ -16,6 +16,7 @@
> >  #include "xe_sriov_pf.h"
> >  #include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_sriov_printk.h"
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > index e64c7b56172c6..10e1f18aa8b11 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_device.h"
> >  #include "xe_gt_sriov_pf_control.h"
> >  #include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_printk.h"
> >  
> >  /**
> > @@ -165,6 +166,10 @@ int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid)
> >  	unsigned int id;
> >  	int ret;
> >  
> > +	ret = xe_sriov_pf_migration_data_save_init(xe, vfid);
> > +	if (ret)
> > +		return ret;
> > +
> >  	for_each_gt(gt, xe, id) {
> >  		ret = xe_gt_sriov_pf_control_save_vf(gt, vfid);
> >  		if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > index 74eeabef91c57..ce780719760a6 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > @@ -13,6 +13,7 @@
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_debugfs.h"
> >  #include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_sriov_printk.h"
> >  #include "xe_tile_sriov_pf_debugfs.h"
> > @@ -71,6 +72,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
> >   *      /sys/kernel/debug/dri/BDF/
> >   *      ├── sriov
> >   *      │   ├── vf1
> > + *      │   │   ├── migration_data
> >   *      │   │   ├── pause
> >   *      │   │   ├── reset
> >   *      │   │   ├── resume
> > @@ -159,6 +161,48 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
> >  DEFINE_VF_RW_CONTROL_ATTRIBUTE(save_vf);
> >  DEFINE_VF_RW_CONTROL_ATTRIBUTE(restore_vf);
> >  
> > +static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> > +{
> > +	struct dentry *dent = file_dentry(file);
> > +	struct dentry *vfdentry = dent->d_parent;
> > +	struct dentry *migration_dentry = vfdentry->d_parent;
> > +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> > +	struct xe_device *xe = migration_dentry->d_inode->i_private;
> 
> we have extract_xe() / extract_vfid() helpers for that

Ok.

> 
> > +
> > +	xe_assert(xe, vfid);
> > +	xe_sriov_pf_assert_vfid(xe, vfid);
> > +
> > +	if (*pos)
> > +		return -ESPIPE;
> > +
> > +	return xe_sriov_pf_migration_data_write(xe, vfid, buf, count);
> > +}
> > +
> > +static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > +{
> > +	struct dentry *dent = file_dentry(file);
> > +	struct dentry *vfdentry = dent->d_parent;
> > +	struct dentry *migration_dentry = vfdentry->d_parent;
> > +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> > +	struct xe_device *xe = migration_dentry->d_inode->i_private;
> > +
> > +	xe_assert(xe, vfid);
> > +	xe_sriov_pf_assert_vfid(xe, vfid);
> > +
> > +	if (*ppos)
> > +		return -ESPIPE;
> > +
> > +	return xe_sriov_pf_migration_data_read(xe, vfid, buf, count);
> > +}
> > +
> > +static const struct file_operations data_vf_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.open		= simple_open,
> > +	.write		= data_write,
> > +	.read		= data_read,
> > +	.llseek		= default_llseek,
> > +};
> > +
> >  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  {
> >  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> > @@ -167,6 +211,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
> >  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
> >  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> > +	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> >  }
> >  
> >  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index d39cee66589b5..9cc178126cbdc 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -56,6 +56,18 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> >  }
> >  
> > +static void pf_migration_cleanup(struct drm_device *dev, void *arg)
> > +{
> > +	struct xe_sriov_pf_migration *migration = arg;
> > +
> > +	if (!IS_ERR_OR_NULL(migration->pending))
> > +		xe_sriov_pf_migration_data_free(migration->pending);
> > +	if (!IS_ERR_OR_NULL(migration->trailer))
> > +		xe_sriov_pf_migration_data_free(migration->trailer);
> > +	if (!IS_ERR_OR_NULL(migration->descriptor))
> > +		xe_sriov_pf_migration_data_free(migration->descriptor);
> 
> maybe instead of checking IS_ERR_OR_NULL here, move the check to data_free() ?

Ok.

> 
> > +}
> > +
> >  /**
> >   * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
> >   * @xe: the &struct xe_device
> > @@ -65,6 +77,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >  int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> >  	unsigned int n, totalvfs;
> > +	int err;
> >  
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > @@ -76,7 +89,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  	for (n = 1; n <= totalvfs; n++) {
> >  		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> >  
> > +		err = drmm_mutex_init(&xe->drm, &migration->lock);
> > +		if (err)
> > +			return err;
> > +
> >  		init_waitqueue_head(&migration->wq);
> > +
> > +		err = drmm_add_action_or_reset(&xe->drm, pf_migration_cleanup, migration);
> > +		if (err)
> > +			return err;
> >  	}
> >  
> >  	return 0;
> > @@ -162,6 +183,36 @@ xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> >  	return data;
> >  }
> >  
> > +static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> > +				struct xe_sriov_pf_migration_data *data)
> > +{
> > +	if (data->tile != 0 || data->gt != 0)
> > +		return -EINVAL;
> > +
> > +	xe_sriov_pf_migration_data_free(data);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
> > +			     struct xe_sriov_pf_migration_data *data)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	if (data->tile != 0 || data->gt != 0)
> > +		return -EINVAL;
> > +	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
> > +		return -EINVAL;
> 
> who will free the data packet if we return errors here?

The caller is responsible for releasing the packet in case of errors.
For GT-level packetes this goes to the ring and gets processed (and
freed) by the control worker. For descriptor / trailer it's processed
immediately, but we still follow the caller releasing upon failure to
produce pattern.

> 
> > +
> > +	xe_sriov_pf_migration_data_free(data);
> > +
> > +	for_each_gt(gt, xe, gt_id)
> > +		xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_sriov_pf_migration_produce() - Produce a SR-IOV VF migration data packet for device to process
> >   * @xe: the &struct xe_device
> > @@ -180,6 +231,11 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> >  	if (!IS_SRIOV_PF(xe))
> >  		return -ENODEV;
> >  
> > +	if (data->type == XE_SRIOV_MIG_DATA_DESCRIPTOR)
> > +		return pf_handle_descriptor(xe, vfid, data);
> > +	else if (data->type == XE_SRIOV_MIG_DATA_TRAILER)
> > +		return pf_handle_trailer(xe, vfid, data);
> > +
> >  	gt = xe_device_get_gt(xe, data->gt);
> >  	if (!gt || data->tile != gt->tile->id) {
> >  		xe_sriov_err_ratelimited(xe, "VF%d Unknown GT - tile_id:%d, gt_id:%d\n",
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > index cfc6b512c6674..9a2777dcf9a6b 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > @@ -5,7 +5,45 @@
> >  
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_migration_data.h"
> > +#include "xe_sriov_printk.h"
> > +
> > +static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	return &xe->sriov.pf.vfs[vfid].migration.lock;
> > +}
> > +
> > +static struct xe_sriov_pf_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.pending;
> > +}
> > +
> > +static struct xe_sriov_pf_migration_data **
> > +pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
> > +}
> > +
> > +static struct xe_sriov_pf_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.trailer;
> > +}
> >  
> >  static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
> >  {
> > @@ -133,3 +171,318 @@ int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *
> >  
> >  	return mig_data_init(data);
> >  }
> > +
> > +static ssize_t vf_mig_data_hdr_read(struct xe_sriov_pf_migration_data *data,
> > +				    char __user *buf, size_t len)
> > +{
> > +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> > +
> > +	if (!data->hdr_remaining)
> > +		return -EINVAL;
> > +
> > +	if (len > data->hdr_remaining)
> > +		len = data->hdr_remaining;
> > +
> > +	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
> > +		return -EFAULT;
> > +
> > +	data->hdr_remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_read(struct xe_sriov_pf_migration_data *data,
> > +				char __user *buf, size_t len)
> > +{
> > +	if (len > data->remaining)
> > +		len = data->remaining;
> > +
> > +	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
> > +		return -EFAULT;
> > +
> > +	data->remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t __vf_mig_data_read_single(struct xe_sriov_pf_migration_data **data,
> > +					 unsigned int vfid, char __user *buf, size_t len)
> > +{
> > +	ssize_t copied = 0;
> > +
> > +	if ((*data)->hdr_remaining)
> > +		copied = vf_mig_data_hdr_read(*data, buf, len);
> > +	else
> > +		copied = vf_mig_data_read(*data, buf, len);
> > +
> > +	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
> > +		xe_sriov_pf_migration_data_free(*data);
> > +		*data = NULL;
> > +	}
> > +
> > +	return copied;
> > +}
> > +
> > +static struct xe_sriov_pf_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration_data **data;
> > +
> > +	data = pf_pick_descriptor(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	data = pf_pick_pending(xe, vfid);
> > +	if (*data == NULL)
> > +		*data = xe_sriov_pf_migration_consume(xe, vfid);
> > +	if (!IS_ERR_OR_NULL(*data))
> > +		return data;
> > +	else if (IS_ERR(*data) && PTR_ERR(*data) != -ENODATA)
> > +		return data;
> > +
> > +	data = pf_pick_trailer(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	return ERR_PTR(-ENODATA);
> > +}
> > +
> > +static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
> > +				       char __user *buf, size_t len)
> > +{
> > +	struct xe_sriov_pf_migration_data **data = vf_mig_pick_data(xe, vfid);
> > +
> > +	if (IS_ERR_OR_NULL(data))
> > +		return PTR_ERR(data);
> > +
> > +	return __vf_mig_data_read_single(data, vfid, buf, len);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_read() - Read migration data from the device
> > + * @gt: the &struct xe_device
> 
> @xe

Ok.

> 
> > + * @vfid: the VF identifier
> > + * @buf: start address of userspace buffer
> > + * @len: requested read size from userspace
> > + *
> > + * Return: number of bytes that has been successfully read
> > + *	   0 if no more migration data is available
> > + *	   -errno on failure
> 
> you likely need to add some punctuation here to properly render the doc

Ok.

> 
> > + */
> > +ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
> > +					char __user *buf, size_t len)
> > +{
> > +	ssize_t ret, consumed = 0;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
> > +	if (ret)
> > +		return ret;
> > +
> > +	while (consumed < len) {
> > +		ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
> > +		if (ret == -ENODATA)
> > +			goto out;
> > +		if (ret < 0) {
> > +			mutex_unlock(pf_migration_mutex(xe, vfid));
> > +			return ret;
> > +		}
> > +
> > +		consumed += ret;
> > +		buf += ret;
> > +	}
> > +
> > +out:
> > +	mutex_unlock(pf_migration_mutex(xe, vfid));
> > +	return consumed;
> > +}
> > +
> > +static ssize_t vf_mig_hdr_write(struct xe_sriov_pf_migration_data *data,
> > +				const char __user *buf, size_t len)
> > +{
> > +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> > +	int ret;
> > +
> > +	if (WARN_ON(!data->hdr_remaining))
> 
> xe_WARN_ON(xe, ... ) if having full WARN is really important

Removed.

> 
> > +		return -EINVAL;
> > +
> > +	if (len > data->hdr_remaining)
> > +		len = data->hdr_remaining;
> > +
> > +	if (copy_from_user((void *)&data->hdr + offset, buf, len))
> > +		return -EFAULT;
> > +
> > +	data->hdr_remaining -= len;
> > +
> > +	if (!data->hdr_remaining) {
> > +		ret = xe_sriov_pf_migration_data_init_from_hdr(data);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_write(struct xe_sriov_pf_migration_data *data,
> > +				 const char __user *buf, size_t len)
> > +{
> > +	if (len > data->remaining)
> > +		len = data->remaining;
> > +
> > +	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
> > +		return -EFAULT;
> > +
> > +	data->remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
> > +					const char __user *buf, size_t len)
> > +{
> > +	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
> > +	int ret;
> > +	ssize_t copied;
> > +
> > +	if (IS_ERR_OR_NULL(*data)) {
> > +		*data = xe_sriov_pf_migration_data_alloc(xe);
> > +		if (*data == NULL)
> > +			return -ENOMEM;
> > +	}
> > +
> > +	if ((*data)->hdr_remaining)
> > +		copied = vf_mig_hdr_write(*data, buf, len);
> > +	else
> > +		copied = vf_mig_data_write(*data, buf, len);
> > +
> > +	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
> > +		ret = xe_sriov_pf_migration_produce(xe, vfid, *data);
> > +		if (ret) {
> > +			xe_sriov_pf_migration_data_free(*data);
> > +			return ret;
> > +		}
> > +
> > +		*data = NULL;
> > +	}
> > +
> > +	return copied;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_write() - Write migration data to the device
> > + * @gt: the &struct xe_device
> 
> @xe

Ok.

> 
> > + * @vfid: the VF identifier
> > + * @buf: start address of userspace buffer
> > + * @len: requested write size from userspace
> > + *
> > + * Return: number of bytes that has been successfully written
> > + *	   -errno on failure
> > + */
> > +ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
> > +					 const char __user *buf, size_t len)
> > +{
> > +	ssize_t ret, produced = 0;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
> > +	if (ret)
> > +		return ret;
> 
> scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) ?

Ok.

Thanks,
-Michał

> 
> > +
> > +	while (produced < len) {
> > +		ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
> > +		if (ret < 0) {
> > +			mutex_unlock(pf_migration_mutex(xe, vfid));
> > +			return ret;
> > +		}
> > +
> > +		produced += ret;
> > +		buf += ret;
> > +	}
> > +
> > +	mutex_unlock(pf_migration_mutex(xe, vfid));
> > +	return produced;
> > +}
> > +
> > +#define MIGRATION_DESC_SIZE 4
> > +static size_t pf_desc_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration_data **desc = pf_pick_descriptor(xe, vfid);
> > +	struct xe_sriov_pf_migration_data *data;
> > +	int ret;
> > +
> > +	data = xe_sriov_pf_migration_data_alloc(xe);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_DESCRIPTOR,
> > +					      0, MIGRATION_DESC_SIZE);
> > +	if (ret) {
> > +		xe_sriov_pf_migration_data_free(data);
> > +		return ret;
> > +	}
> > +
> > +	*desc = data;
> > +
> > +	return 0;
> > +}
> > +
> > +static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
> > +
> > +	*data = NULL;
> > +}
> > +
> > +#define MIGRATION_TRAILER_SIZE 0
> > +static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration_data **trailer = pf_pick_trailer(xe, vfid);
> > +	struct xe_sriov_pf_migration_data *data;
> > +	int ret;
> > +
> > +	data = xe_sriov_pf_migration_data_alloc(xe);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_TRAILER,
> > +					      0, MIGRATION_TRAILER_SIZE);
> > +	if (ret) {
> > +		xe_sriov_pf_migration_data_free(data);
> > +		return ret;
> > +	}
> > +
> > +	*trailer = data;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_save_init() - Initialize the pending save migration data.
> > + * @gt: the &struct xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Return: 0 on success, -errno on failure
> > + */
> > +int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	int ret;
> > +
> > +	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = pf_desc_init(xe, vfid);
> > +	if (ret)
> > +		goto out;
> > +
> > +	ret = pf_trailer_init(xe, vfid);
> > +	if (ret)
> > +		goto out;
> > +
> > +	pf_pending_init(xe, vfid);
> > +
> > +out:
> > +	mutex_unlock(pf_migration_mutex(xe, vfid));
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > index 1dde4cfcdbc47..5b96c7f224002 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > @@ -28,5 +28,10 @@ void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot
> >  int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> >  				    unsigned int type, loff_t offset, size_t size);
> >  int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
> > +ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
> > +					char __user *buf, size_t len);
> > +ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
> > +					 const char __user *buf, size_t len);
> > +int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index 80fdea32b884a..c5d75bb7f39c0 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/mutex_types.h>
> >  #include <linux/wait.h>
> >  
> >  struct xe_sriov_pf_migration_data {
> > @@ -32,6 +33,14 @@ struct xe_sriov_pf_migration_data {
> >  struct xe_sriov_pf_migration {
> >  	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> >  	wait_queue_head_t wq;
> > +	/** @lock: Mutex protecting the migration data */
> > +	struct mutex lock;
> > +	/** @pending: currently processed data packet of VF resource */
> > +	struct xe_sriov_pf_migration_data *pending;
> > +	/** @trailer: data packet used to indicate the end of stream */
> > +	struct xe_sriov_pf_migration_data *trailer;
> > +	/** @descriptor: data packet containing the metadata describing the device */
> > +	struct xe_sriov_pf_migration_data *descriptor;
> >  };
> >  
> >  #endif
> 
