Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B1AC8C8A
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 13:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC2810E81E;
	Fri, 30 May 2025 11:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h35p9/Dl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD9E10E81E;
 Fri, 30 May 2025 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748602927; x=1780138927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=04sa64FQ1lWGJE6OHDxWe1NbmzKvWTOXsMBYkmhWrog=;
 b=h35p9/DlNLu5lwcR1QKT2K76GRWHqOPrG+hPjoACr5nViImSDoZRTSk9
 WDpwwf4WVE2ICqxESkSalS9uD3lgcqyguEVr+LjsW+SHlwem20w/clnsX
 nJFoyj7wHoscwGBAfYxSFOZLE6+pQ7ee8gQ26NuEgVVVbchjutPC+s+03
 1+UC8JeJX5mtMyGvIH9s5blV+6p107ON+RW18JLY2RWFyQdPZBmqJzQ7U
 AmivuKClt/4Z0TMCo2CGUGDHx6oIn6YwOyrENOksHq+9WPcGSdGsl67sZ
 w5GtenslPA+xItDPEW3wYp5J5vgndVFVS++fFE6jpdMWcqi3gfo8stKPe Q==;
X-CSE-ConnectionGUID: C+/NZNdwTZmu/8bVpLAXkg==
X-CSE-MsgGUID: gMEVt2S6QdSWOGLKgr75bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68243671"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="68243671"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 04:02:05 -0700
X-CSE-ConnectionGUID: qFnHCAp9Qi+7NV0dj2Ocng==
X-CSE-MsgGUID: jwkbhRbYTq6dg4ClMMVuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143761406"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 04:02:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 04:02:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 04:02:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.81)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 04:02:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxWSyE8Js4HFcbuFA4+U2LfAesYC/mhLQPU7oKXboRzknn12+Sbz4aHoXdqmynZVUnTxlJPUFCb+jHC1h67YMTTIhqbnBCE3sCjkQG1Fc+nVA3ZFFBMITruCwEsEp2AMmqhP5mbpanrCInUy97cR+ybyOfcvort+36RNyUzjfL9iiKp8t4gntaEZm64cOaMFq2B/TpD/xgG/WV0uEv2NCZs7hUIbbvYKr3lyid/1VRcyDGFktCFjTx2l8Yg06SDSqOYOc9JJ6r1gF8rrbmy1PRhQHB/fOJFn5+GU0e+dKcAPz6qtJJFI+JAdKAvjCWuWvtRH47dhsHHuA9a2S+12bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90UUMpnIZBtjzBmOcFZi5z7OwEOOmkVhPXe1FQ3qbws=;
 b=SdO2ElnUbTdPr+nt2ND268Aiu1dfH4UZGbqA/E/t823qQZExUamA5RkqjlVcIShoYnqSqgfxG8vDBPVPj2NyDJyd/i2+gYDtwGRraBmgfbGWbO1lzBKrTcnugBuQDSYc3jKJfqy4DetGseRFVk59F6HhKQM0FGQOz6uhzTuMool6FxgIlZe1YXFRrzVhLDlD4K6AS+amm5S+uDfePZYZGUQIoX7wGqr+hS0SreDA9eft2rwOTrQPFwslW5TDP7uVz4D4LGLPIoo4wUaGB6aLofBaI36Zz7LzQOKYyTBBMSVqXTIzwn7In7xGGL0Wd2JR8BU7BLReUOWI6j7QVEqrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 11:01:31 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 11:01:31 +0000
Date: Fri, 30 May 2025 11:01:18 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v12 01/10] i915: only initialize struct ref_tracker_dir
 once
Message-ID: <bcc3aaschdk64nieucfllygsqjvtvpffgxf7mjamabkeofangr@tmbkssauvg2d>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
 <20250529-reftrack-dbgfs-v12-1-11b93c0c0b6e@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250529-reftrack-dbgfs-v12-1-11b93c0c0b6e@kernel.org>
X-ClientProxiedBy: ZR2P278CA0041.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::10) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2803ae-411e-4571-0f36-08dd9f695541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmhmU2ZpRUVnV2pKOXRlcUJmNS9OVVZxVjg0SjcxeHZ1YnhhUGVIY1N2c0x5?=
 =?utf-8?B?TElVSU5tR1p5ckVmMmtUMkpjdzBPR0twVjFHV3V6WjZvUk5ERjF6RkFiWk1G?=
 =?utf-8?B?a2Z2dDVXWVhkZVE3SUdMT2VxR05tVUNPL3lGK29xTEhjSmhtbXc3eHVFcytn?=
 =?utf-8?B?N2ppWFlZT0NnaUY2WFc2Qk85WVpjSGJOVnpPN2ZGTFdQdDNkenl0d2U0L1BM?=
 =?utf-8?B?UFcvQXdudzZFd0w4MytSeEJzaTNRVnUrYjVjclUyV0hDakxma0ZlRktNN05M?=
 =?utf-8?B?a3FTT1RjN0QyUVNJU3N2NWFueDBOYmZnV2ErYWY4dzlJcTNMNGpKeklSS1VC?=
 =?utf-8?B?aHJoQVhQb09oaWhYeDd2d21Uc1BmaXZTZFNKVWpzMG5JV3BwcWJ6SnA3cGE1?=
 =?utf-8?B?ZGZ6eTJRangyYnZmU0thMEVkU05qanEvbmlJMStGUlR3eVpjQTRBN2Nrbllr?=
 =?utf-8?B?QUY4ZkJDQXoyTHVjN0NmSFkwVm1GakhsOFprWXRzbnRNNWJORzBaWnhzdEhV?=
 =?utf-8?B?cUZUUmhOdUkrSnBRL0QxZHBxUVh6dXdab2VYSEg1MVFmSkdZR3VPbmF3U1FC?=
 =?utf-8?B?eUQvRDFTQUhuOThIVE9yMDU0Y1ZKcEtoMkNpcVoweWd2ZktRaVhROVZBcnVW?=
 =?utf-8?B?bUF5Ym0yT0NDK3N5ZTdYYXA0SWlEL1lPWVk2TDhUUFhUYnVMUG43dUVxZzZP?=
 =?utf-8?B?eXVCZ290QktzUzc0bWxJaGVnNU9QcHJNaFAyNFM3QWk4RW55Qk9zZ05OQVkv?=
 =?utf-8?B?RXkwclVnSkw0TnJSV3lhajFGMFNTMXlFTTk3bElkSmxUZCtKcXp6dGk0cHZQ?=
 =?utf-8?B?ZnVBa056YVMrbGg3OXNQZzVWalp1M1BoNUJRRm8rcWk3SFEvQXAweU5MV1hK?=
 =?utf-8?B?aFFINHMxbXBkVHNZcTV3YVU1TmhBeGdqcUh5WEx6M0xRMytZYVpjWkRtaTgz?=
 =?utf-8?B?Q0p5UmFiQXU2UGlLdmNqU2NQZExCUncrZTREZ25lTEdwMTl3aXEyTXJXMkpH?=
 =?utf-8?B?N1JwZWUwRnpNRDYxZ1ZoQ3hrQ20yUTloSE1iRGpYd2lUZXJoYjNBeGxiZWdj?=
 =?utf-8?B?aDJtRWU3NXZQYXA3U1R6R1JyNk5LOW56aDJBWmwvM1YzOFVYSDJnV1dNUXN2?=
 =?utf-8?B?QkRYMUlKcm5CMWZCd0w4eEpSWllwOVdYRnR1MVk1T1NXeUFEZVBOWGhaZVR0?=
 =?utf-8?B?WmhIM2xjVTNyWnJVUzZLME5UR21oaitXZFdSV05RRVF3WjhpZ3JaVEorYUd4?=
 =?utf-8?B?TVFyUGRsanZOMzdaVVVJbHBQN3ozdFlNRFh0czh5V3pHdGRyRXI4eWwvK0w2?=
 =?utf-8?B?OC9ldzJmSkV4alROd2pFWDAxSEo0ZlBXM3dPOUw3U2hiZVpaVi9HOUZsbjRQ?=
 =?utf-8?B?aDQ4bTFVQWN3aXNTK2NON1FQUUZLUmM0NmgxSGovM2RoSjJBMSs2RUkwbG9i?=
 =?utf-8?B?ZGdxTXNxZDREQ0tiWnFyTHoxVlZvV3hkOW9ZR09UNnVna0pCMy9HUHdId2ZR?=
 =?utf-8?B?Vkg4eUZwTktjMkVWUGVncUhZeUNQQWora294NDBhT0J3a3o5M2UvTWxlNWYv?=
 =?utf-8?B?ZHJUWkVqTVFKc2N4TzVnNzdlYjNIR2ltSzZ1WlhOcEFzYmk2c1hiT2NZZ1ND?=
 =?utf-8?B?V1UzNEU5ZGZmbm80dktYV3hyZ0xzd1dGVTJEelVucjd0UDBBdVJpNGZaNWRF?=
 =?utf-8?B?dG9ZbEQ4WjdVZ0wrOHVQeDM0RmJPZHRacEtZSlMreGtXa1ZsaFVIM3QwRzRu?=
 =?utf-8?B?R09iSXoyVW5QUzlVS1gra1lINW00MVFKRkVxTklaRWNUUmlJeXRtdDJ0Zjgr?=
 =?utf-8?B?RVBUS2FYT0p0Y0pJMXBvNGExdVBUd2hCWjZvZ1BuMUxYa2hEcmdOMDh0QkNG?=
 =?utf-8?B?WklkanFTZ3hXeEwxcWxYYm44YVBoZzdFSWdUR1BMTkdrVmNCdkpDYm9HajdJ?=
 =?utf-8?Q?I61ctA/eD8Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZianNzOW9YeU5RVFNaWHRxcVlUYUFIOGw0QlNpR1dYQVB3ZXNIeGlGTk5S?=
 =?utf-8?B?VGc0VUJ0N1ZETktnbFZSUWlmNWV2c09Sd3lhM2ZFWjJocVppNnZaOGs1U0hG?=
 =?utf-8?B?M1pHRWdweVB0cGtPMndQeGs1bVMvOHRvUmVDZlRXZktCUmZtOThRQVRUTWVK?=
 =?utf-8?B?cFN1ODFXN3MreEFDaEtZYis1dzRkRkgvWHUvdXJ3THlxckpONXVCV2N4aFpz?=
 =?utf-8?B?NncraXNUUWtQQnV0WWtZUEJ2YjRBK1dXL3ZVTWhVTldkRGRPbTRZMGtsTmUz?=
 =?utf-8?B?Sjg1cHhZR1BIYVRjWjNOWmhWWUNXblRUZmlheGxSaGN2dWFwczJtRFY3dlZx?=
 =?utf-8?B?SktmOHBpc3V2WUkxek9ObGQyY2Jzcm1NdjFUcU55MWFKaDA2WW1HOHlZN2tW?=
 =?utf-8?B?ZmNYVk0zTHcrNTB1WVRacmUrakJ5U1lUZkkwZVdUL0x4LzBUc1cwV3RTd0sy?=
 =?utf-8?B?dmdKRjJBV0FMSjZtWHhOL0lyVFJzS1lDcTFrbzdYVTRnQmVTQWZnS21mQ0Vm?=
 =?utf-8?B?UHlmNlBheEdENjJUL2JvZVQ3M1pzVDVVZ1JwRjRIODBGUXVaTU0wdVhWTjda?=
 =?utf-8?B?Y0Yya09TZ3NQMDFCeXBoczhaZEs1SjJUTmEvUUIzTHFoVERBWUlWU0hlUzhN?=
 =?utf-8?B?Wk9qWVBITnRWR25FSktLMUlzRE1ENm5BUTVBTnkzdmdaczZIckpkOGkzeFhz?=
 =?utf-8?B?cjg3cFozempGQjZlcVd2SHZWRGlsZVF6MzRDK0VSMmN5VDUvNGVMSm5jR0tW?=
 =?utf-8?B?YlMxbUtyU2FmTVkwbmRsZVRCOGxFSHNRNmNTYW9ZeC9IMStHVUFVdHNaSFYv?=
 =?utf-8?B?Y01wYldBVkdmQUpueVBwTWp0L2NLWUxDRTFoZjVnNWJGZ2hLMXR0MFVSSVRm?=
 =?utf-8?B?NE5wYWFPYWZaSkcyZjQ5UW4xNEI5TVZSaWJxa2FzYUN5N01paGxnK2FPSUVQ?=
 =?utf-8?B?cTNkb3B5MkZZWGNtNzlGZTkza3A5VkxXeUhkeEhEZDR3dURWbjljcUl2ZjQ1?=
 =?utf-8?B?cUhRUUhQbE56cVFQWWtPNGVvV3NaaUxXcnY4RHVGMzU5cVN1MEJ1aU5mNmpt?=
 =?utf-8?B?LzZxbWdsOVZlWXR2OGFrWkVlTFIrenJhS1ZpZjZua1VDV045d3NnVjVYbEhl?=
 =?utf-8?B?dmpQZUQxU3N4OXduWU5WeVZkWFZZZjMvUXVOd09NSjZuUUZIRGVUSVVsTnpH?=
 =?utf-8?B?eXo0VzFlSkJZcktIdTVENk1oWm0rRWw1dGtyZXgyeG1jVE9jUTNIS2d2R2Vk?=
 =?utf-8?B?ZmF3Ny80ZDEvYmJVY1dnWk1vYWw3MmYvYUFNSWdwekhaMWZtS3Z1ajRpMDc0?=
 =?utf-8?B?MUZlb0lYZ1lyR25BSHNIVjM3K1hXenk5UnE5UlZrS3doZlVNS2gvZnZtQXVH?=
 =?utf-8?B?YVM0Q0x1NHVkWFU5Z2h6dEkrVU15T3NjNkhjc0xSWGQzWnBhVmY5SXpIcUR0?=
 =?utf-8?B?WnhtQllMK1h2TnI4SHgvQlE5amRWd1lnZzdheFg3MldleC9KcmhrWHNYVk9j?=
 =?utf-8?B?VGgzYVpqSzE5VXZZbllVaHBST2tMckpOdW8rb1RBbUNOWVBCK3N0dHluQWRM?=
 =?utf-8?B?YWpHcDB3MmZoOGJSRGkraUdWc3dnZ1A3RGxKSHU0V0tRU3VLNmtUQlU4dUVw?=
 =?utf-8?B?SXh5MThEY1R2ZE9TNTZNL0dMUnM1THJ3cldxSVZ4MEphNmlXb20rK2d4WVVy?=
 =?utf-8?B?TjBhdHVpN0NGUEdiYXNkZFkxYjU5UnFvWDBaWitzOWtoV3FWbC96bFcyUVZo?=
 =?utf-8?B?VlVmTHRPeVM2aGs4dDdPR0tyUlQvV3lucGxYSW5kOUZjSlAweW1haUtxN1Bh?=
 =?utf-8?B?bFdTblR3NldvQ0ZwOXJMQWtXcjg1cmtQWDBsUTl0bXVDTHVnYUsxV1UxUHU3?=
 =?utf-8?B?eTlCWnBadmxIZTFhWUg0eUsrSUUvakM3UzNxQU5qN1R6d3RubHpmWGYyQ3d2?=
 =?utf-8?B?WDVPUXhPbzhQSWJVK0ExNXN1S2Q4UGh6NVljVVU2ajlvUU5ISlF4dlJnSWla?=
 =?utf-8?B?MzdhK1JQL1A5MHUyWXFPUW5YYXJwczlSS09lK2t1YitodGNnbnFqRC9GQmd4?=
 =?utf-8?B?YTl0MUtzdHRJMDd3TVNVUHR5RWV0U1pnaGUxVlZRMWI0OUFLTWRqNjJUNlBM?=
 =?utf-8?B?VXRDM25UbE4zSitoY0czUlBENFpPbjlNbkZwdXcxWUMwSy9jRHNPK014Vkdj?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2803ae-411e-4571-0f36-08dd9f695541
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 11:01:31.0482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULJ7J+zPQJqot0hOr1MlDtdjuNJh2MbE+MlF/F0zob+YN8lsbYNVzq4VisruvcKaK2q3X3Waf2+pz16i+WLieFBK1D6Zwck5PkxQU6gZTA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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

Hi Jeff,

> I got some warnings from the i915 CI with the ref_tracker debugfs
> patches applied, that indicated that these ref_tracker_dir_init() calls
> were being called more than once. If references were held on these
> objects between the initializations, then that could lead to leaked ref
> tracking objects.
> 
> Since these objects are zalloc'ed, ensure that they are only initialized
> once by testing whether the first byte of the name field is 0.

Are you referring to these warnings?
<3> [314.043410] debugfs: File 'intel_wakeref@ffff88815111a308' in directory 'ref_tracker' already present!
<4> [314.043427] ref_tracker: ref_tracker: unable to create debugfs file for intel_wakeref@ffff88815111a308: -EEXIST

I think those might be caused by introduction of:
"ref_tracker: automatically register a file in debugfs for a ref_tracker_dir".

Current version of "ref_tracker: add a static classname string
to each ref_tracker_dir" further in this series should prevent
multiple calls to "ref_tracker_dir_init()", so this patch could
be dropped I think.
If my reasoning is wrong however, then please add a note to the
commit message which explains why this is needed in more detail
or/and move this patch right before it is necessary. Otherwise
it looks like a vague workaround.

Best Regards,
Krzysztof
