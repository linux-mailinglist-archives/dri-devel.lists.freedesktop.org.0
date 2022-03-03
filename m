Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA64CBB20
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DA710ED6C;
	Thu,  3 Mar 2022 10:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329C810ED6C;
 Thu,  3 Mar 2022 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646302804; x=1677838804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7zgTCaH3ciLwq3TYlkZaktogDUf1p/7VQ1akGq/jb8w=;
 b=WiIRAdhDDcIcoiFJ2B9xkdFGJCyPPdq1IftwGT2v/QbjZd0mRB1wfU+i
 GG1SGc9vFx3vkz5VUqha7b3Y9c/Vfd1klDquiZN6mCVgvSf3hgYLW0fUw
 MrVLtTY8wPad+jVD6q+2Nd8T5a13KZd5zzHGmBmQSNl9RiisPXr4SuTw/
 WKS/baq3V5jTN8roZqohVlLUqt6mq566wfDOYUlvQ03hp4EVZVPx4tCie
 C4E+A7RVrh97PVPM93Zp30qkOc8LZMV5xYh1p5mcY3HmWejXkTWaT0fgL
 Es+ZAIQBbzYkEa9NDtOBpAjH6Bk0uJuVeLiUl2mqp5U3bg5LRH5XWCf/f w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251211882"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="251211882"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="642066124"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 03 Mar 2022 02:19:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 02:19:58 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 02:19:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 02:19:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 02:19:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpG27sso4EQ4urPjxlndPcpIJOyAS8aJk4Uz8irMUxrJGTKMlfjfhfzKaZrc4HxHF535nHPMIwjLO+sXp+bMgaibcvYQMX5A5lbIp+Gj5bT1wAVFL9Zuh5Ls7XnKbTkj93i/S/rqC3VAzumj6y5+rax6JPWNqVwt2NxF28pDAkvBb5SavQdv57tGwr63CRq0Df21OXus1EdQl0CIyy33PW6mdOUto3hiaHMoUZgj65aVnLD9dzqAF/XidVvlibzOl/YfhvgRyZz+dA6qKV/ArZO6pmW1wkee5bwoZc287auXj/fTH1rCbOPj6jGoBw/W35yjDK2bheCTX4+p/q0R4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFmKVcKHUOwZ0pRHQo7bQ6iwN/qdaBcwqxAGRNHEVdk=;
 b=NonbiAYZdEiHDDuTFHIUa9bddK+NKQQ1VJt+XjSHaRb8JfNWCjD0CJfwrIh3mozqbcBNti4KVL7GN/kt5FDVftJbdq4hLm6qpCFGw5Ufq8yRJQONs/HzS0UX2v1wCOpX42PhE3oxVgL0IhTZDFHirYQFRfwqOPSMjjkTIu+4Z1TChoQQcfMgB2b4ejVWlrrh0eqGQzDIBpLB669xktCHutAnaXInQoKUq5naK2ZW286YZphb/c0BaIQHUy75M0N6vDkc1OIx4tfdkguZ6VQUFwOeYQqh9NL/2IvySrhgn+hxc55cySuW9ZmyctOVM48zfx5HnuzAeDU9P4AsqbNFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Thu, 3 Mar 2022 10:19:54 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:19:54 +0000
Message-ID: <c9987c7e-8a3e-82e9-c934-093524043850@intel.com>
Date: Thu, 3 Mar 2022 11:19:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6 sysfs interface
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-6-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220217144158.21555-6-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0012.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::30) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc9c610a-39b5-4cd7-2857-08d9fcff5c32
X-MS-TrafficTypeDiagnostic: DM8PR11MB5717:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM8PR11MB5717A9905270BA59539659D1EB049@DM8PR11MB5717.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KQx52vXj2cR1moNbOKOdA3q94pHnkTVJHpUCdbyt/rjl+IKrV7S3X+z2IHPSgBKsAczNkdlFT9q2k/8GeSb6wEG2s5Vo2XPeWaTyMhXqxLB/hDkX6gUG2JOAMhmcVaVtmr8DIq01R2aK1uae6xJ5Xw2BTMMZy7JQTDa0oeC6QdEBtfVj51XLY1XOwvZrqlQC6x7U/1TMYkwihnGLBLYOy5NugLzXPJKkxjUF3JAd3Qp24/RTj5Um6T6ta6XApaxdRDyQIw+8emFs1RyKM0kvKJ4IIGBr660e2QmcqNfdkRI+nbUovGaEnRunF84qEqivm7virVlIZizg/w47Uqysqie+tNsgsFBAqSoQDaSTECjPfExlUOATQDst1y5X+cz3qp56WjWs6DfDt7DEUCImi3TlsYB/YXcEI5Tvv6lqQqS3KZJvt2Dm0cGAaG+IppW2NaSqyppyDenFLZ1O2PC1RpjZpxhv//ti7VD3UHqXO8MbGdOcYu8dhpk0YtzEEwjZMbq4bRSR2TD6GcLyulRvLfRSCK48jvdUOCNfXDkKG/A54cq5+51N0YXyCIRvwYOIfZzfJF43h5IvScpeHWlvOz2PLMjnSmiX6KhEt5OW/BhohNbYs+8ee8mQ7/V0WtjZ9j9YfGtgsWcrp2wcXtsmaeYOr/wIJc8JKiGLo2liGyQ5P93Exrbk7Z5oCt1sfBBHyLsCQ7H5f4n72SyLFsZgGJdNy63OPalZmo8pFYdkavk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(82960400001)(110136005)(38100700002)(31696002)(86362001)(186003)(6506007)(6512007)(36916002)(2616005)(53546011)(26005)(54906003)(6666004)(6486002)(508600001)(30864003)(44832011)(8936002)(316002)(5660300002)(2906002)(4326008)(8676002)(36756003)(31686004)(66476007)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzV0K1FZRWdVY0EzTlExdHJSeTIxd0V3dG80eVVLdklheHo2TlF0NEJEcU1U?=
 =?utf-8?B?U0c1bCtlejE2NXFqNDRucEFRcFg4MitJV20rK0FBZXNvTmxQdDVGVHdBZ0lI?=
 =?utf-8?B?ODBvekd6TjlIQnRmU3BGN1FpUUFGbU5YR05wNUd4S0FBVmszdllLcXBRMHRr?=
 =?utf-8?B?Tk1reWJUeEtTaE01djdTUURUQmwxcG1CSTF6ZFZFVnJXL01UUVdKaW5nQU1O?=
 =?utf-8?B?dEJyOGFMVkdXVVRSTG10NzE3MldEN0JWR1JzUUo4ekM2MXN0YW9XTGt5K3dh?=
 =?utf-8?B?aVBjU3F2Wlp3T2QzODdYMCtuUGk4NE5EeCtIRUU0RU9pZ1JWZi82dDI1c0Va?=
 =?utf-8?B?cGJLdkRZU0RrYTFlanByVjN5VVdRUXQ5L3A1MnQ1ekw2ZEFaRC80WEZpRTd2?=
 =?utf-8?B?VCs1VWl3N0Z4Q3hFS2NVaGYxeGd6bkJSUC9mYWdaU3o1VUwzQm9obTNIRUlC?=
 =?utf-8?B?OFNhUWFjbTR1enNTbWNFMGhQV3JIQWpCOXBQQjBtRXZjc2NnUVBVNE1JMGZj?=
 =?utf-8?B?Tm4xblIzSFVnQjltckxnbGZtbS9uOGI0YkE5LzU1VzI3M3dLSkR4KzJ4R0ZS?=
 =?utf-8?B?YmJjUlNKdmlhZmJSWGN0dnROYWJGMU9yckVDeUtrZ1JiY0xvUElhOG40VjlM?=
 =?utf-8?B?dGlIT1BUZXArblMwNzhicklzNEQ0aUkwd25KM3pQREo2cWpQZXNvVVF1Sjgw?=
 =?utf-8?B?cU5VRmhiWXlDL3BUbjZxNUFzdFE2K2VQamRlMkR6dVBqT1VHbllKM1NnR0Z2?=
 =?utf-8?B?SkJ1d0xoN2RrMXpPZ2N5Skpya05NZ1ZrMHk2cm5Fb25zN1RlS0pwakxJRFJF?=
 =?utf-8?B?V0J0R1VySzhoMmVubjJJSWd4ellIVmx0dzZJWjRwMTNNYWdaUE91RjlGdUll?=
 =?utf-8?B?dXNkRThXYkpwTllyeVpvSEdnMi93SlpxQUZ4UkRTeE5TU0kxV0ZObk5OZy9K?=
 =?utf-8?B?M1V4RWpkZVNnYWZYOTBPV0lublNjYWc3ak1sSER4dERtZXJtVStTbTVadG5Z?=
 =?utf-8?B?WnR5djBhdDhpOHU3K1dBeU9WMzVSVDgrUVpzODlvV1VwMTJlMkVNVTh0SEVo?=
 =?utf-8?B?dHA1SldETlA3RWtmLzFPcXZiKzRKVVJVSDROMG56a0ZlRlZ2bldmMmRHUFFT?=
 =?utf-8?B?Q1FaWk9nVFRhYndoN3R6RzFOVWxucnh0VWJncjdkOFdnaU1zZlczMEIvWlU2?=
 =?utf-8?B?b0FjZmVvL3NwckYzNHBxSlAzQWJoSkhtTTU1T2t0S0Q3WE1wTjlYYzd0QThI?=
 =?utf-8?B?UU11d0hoM01aUmNkdUlpM00vdHlzWGt1cTh2TEpkOWRQUnU4MkVIZ1NZS2Vm?=
 =?utf-8?B?UEgySkdoRHFRSnZheWV1Rno1QWgydVYyUmNIUTl4eTFjZTVPSWlTTVFhYVhH?=
 =?utf-8?B?WU9IRDVyTXVkSzh0MUlZRXBlY2lHa0w1a0krTWtYS2RuVFloZEpGa3g3R1Vm?=
 =?utf-8?B?a3lLYzZra04yWGJZY24rYU9DN0dEcEM1VVNubmRvdHJPaVVheTRhRmlzdDd6?=
 =?utf-8?B?MnhocVEvSlB4RXcyMnJjdDRGZExIdzNwcVpnZHdSVVFueHY1VktudUxOdHRT?=
 =?utf-8?B?a1cyNzBvcmRjY29CeW1ReklvYkZGVjFFVjZXTyt1aU10bW1tcGFNYXBndkds?=
 =?utf-8?B?M3JtQjB2SzI0SGlEN0I0bXhaaEZQK1JPR3ZTdGhITG9xSW1iZHo2dmlDU25S?=
 =?utf-8?B?cTd0UVdpQ01zVTMvRGtDSHN3aU0rY1czeUxCeE9jcjlETlNjSkF6ZFVTMFdw?=
 =?utf-8?B?WDNQc25qbFYvbzVSVVZoWkpzYmJOUHpHU012ZHY0OURhcHJFMHdUNmpIdTZS?=
 =?utf-8?B?Z1JKalY2MXBKZmlYc3Z0NzNrS0VPaGcvcjRoVE5vajc3cHM1dmVSZFhTZW5k?=
 =?utf-8?B?YlJpLzdXeHRMN1NsV2tOYXpxYUs0SVVsQ2h4SW5NOXlweU1xTXJkSUJXakdn?=
 =?utf-8?B?T1Nxc3BRMHk1UGtUdmtXQzlpeWVubmYzY1F3YVNrUkRpQUdmYS9SaThCQW8z?=
 =?utf-8?B?WTdVZ0hlbURiVzJGMFVEbWdpMVM1RmhmdHEwYjYvclYrN1lhWHFXNlVuVnR2?=
 =?utf-8?B?bjJPQXkxL3YxbThFQUt4NXlIczl2WkVFeUxwdnh2Y29HMkROQVBiZzhsQ2pD?=
 =?utf-8?B?eCtWMEJ6VGZvQ2MvN05maHI4OCt1VTNZb1dEQ3Rpa3NvMDBnQmdqbTh6Qkgy?=
 =?utf-8?Q?W7ry4VGcWt1tHMvA9hiS5AA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9c610a-39b5-4cd7-2857-08d9fcff5c32
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:19:54.5630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbXkix8MMA07MWThcD+cXvO76rX2Cvzt26bDYSQu0vDgZPQcDVheqJKWFm8qbGog/sG6vZvLUzowvbjcp4gtIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5717
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
> Now tiles have their own sysfs interfaces under the gt/
> directory. Because RC6 is a property that can be configured on a
> tile basis, then each tile should have its own interface
>
> The new sysfs structure will have a similar layout for the 4 tile
> case:
>
> /sys/.../card0
>           ├── gt
>           │   ├── gt0
>           │   │   ├── id
>           │   │   ├── rc6_enable
>           │   │   ├── rc6_residency_ms
>           .   .   .
>           .   .   .
>           .   .
>           │   └── gtN
>           │       ├── id
>           │       ├── rc6_enable
>           │       ├── rc6_residency_ms
>           │       .
>           │       .
>           │
>           └── power/                -+
>                ├── rc6_enable        |    Original interface
>                ├── rc6_residency_ms  +->  kept as existing ABI;
>                .                     |    it multiplexes over
>                .                     |    the GTs
>                                     -+
>
> The existing interfaces have been kept in their original location
> to preserve the existing ABI. They act on all the GTs: when
> reading they provide the average value from all the GTs.

If ABI should be kept forever, depreciation msg should be removed from 
intel_gt_sysfs_get_drvdata.

>
> This patch is not really adding exposing new interfaces (new
> ABI) other than adapting the existing one to more tiles. In any
> case this new set of interfaces will be a basic tool for system
> managers and administrators when using i915.
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile               |   1 +
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    |  19 ++
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 220 ++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h |  15 ++
>   drivers/gpu/drm/i915/i915_sysfs.c           | 128 ------------
>   5 files changed, 255 insertions(+), 128 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 277064b00afd..7104558b81d5 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -106,6 +106,7 @@ gt-y += \
>   	gt/intel_gt_pm_irq.o \
>   	gt/intel_gt_requests.o \
>   	gt/intel_gt_sysfs.o \
> +	gt/intel_gt_sysfs_pm.o \
>   	gt/intel_gtt.o \
>   	gt/intel_llc.o \
>   	gt/intel_lrc.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
> index 0206e9aa4867..132b90247a41 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
> @@ -13,6 +13,7 @@
>   #include "i915_sysfs.h"
>   #include "intel_gt.h"
>   #include "intel_gt_sysfs.h"
> +#include "intel_gt_sysfs_pm.h"
>   #include "intel_gt_types.h"
>   #include "intel_rc6.h"
>   
> @@ -54,6 +55,11 @@ struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
>   	return kobj_to_gt(kobj);
>   }
>   
> +static struct kobject *gt_get_parent_obj(struct intel_gt *gt)
> +{
> +	return &gt->i915->drm.primary->kdev->kobj;
> +}
> +
>   static ssize_t id_show(struct device *dev,
>   		       struct device_attribute *attr,
>   		       char *buf)
> @@ -107,6 +113,17 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
>   	struct kobject *dir;
>   	char name[80];
>   
> +	/*
> +	 * We need to make things right with the
> +	 * ABI compatibility. The files were originally
> +	 * generated under the parent directory.
> +	 *
> +	 * We generate the files only for gt 0
> +	 * to avoid duplicates.
> +	 */
> +	if (gt_is_root(gt))
> +		intel_gt_sysfs_pm_init(gt, gt_get_parent_obj(gt));
> +
>   	snprintf(name, sizeof(name), "gt%d", gt->info.id);
>   
>   	dir = intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
> @@ -115,4 +132,6 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
>   			 "failed to initialize %s sysfs root\n", name);
>   		return;
>   	}
> +
> +	intel_gt_sysfs_pm_init(gt, dir);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> new file mode 100644
> index 000000000000..27d93a36894a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <drm/drm_device.h>
> +#include <linux/sysfs.h>
> +#include <linux/printk.h>
> +
> +#include "i915_drv.h"
> +#include "i915_sysfs.h"
> +#include "intel_gt.h"
> +#include "intel_gt_regs.h"
> +#include "intel_gt_sysfs.h"
> +#include "intel_gt_sysfs_pm.h"
> +#include "intel_rc6.h"
> +
> +#ifdef CONFIG_PM
> +static s64
> +sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
> +			  s64 (func)(struct intel_gt *gt))
> +{
> +	struct intel_gt *gt;
> +	s64 ret = 0;
> +
> +	if (!is_object_gt(&dev->kobj)) {
> +		int i, num_gt = 0;
> +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> +
> +		for_each_gt(gt, i915, i) {
> +			ret += func(gt);
> +			num_gt++;
> +		}
> +
> +		ret /= num_gt;
> +	} else {
> +		gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +		ret = func(gt);
> +	}
> +
> +	return ret;
> +}

Return value is always converted to u32 or int, maybe we could use just 
int ?

> +
> +static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
> +{
> +	intel_wakeref_t wakeref;
> +	u64 res = 0;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		res = intel_rc6_residency_us(&gt->rc6, reg);
> +
> +	return DIV_ROUND_CLOSEST_ULL(res, 1000);
> +}
> +
> +static ssize_t rc6_enable_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	u8 mask = 0;
> +
> +	if (HAS_RC6(gt->i915))
> +		mask |= BIT(0);
> +	if (HAS_RC6p(gt->i915))
> +		mask |= BIT(1);
> +	if (HAS_RC6pp(gt->i915))
> +		mask |= BIT(2);
> +
> +	return sysfs_emit(buff, "%x\n", mask);
> +}
> +
> +static s64 __rc6_residency_ms_show(struct intel_gt *gt)
> +{
> +	return get_residency(gt, GEN6_GT_GFX_RC6);
> +}
> +
> +static ssize_t rc6_residency_ms_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buff)
> +{
> +	s64 rc6_residency = sysfs_gt_attribute_r_func(dev, attr,
> +						      __rc6_residency_ms_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) rc6_residency);

Here and below (where applicable) variable should be just u32, no need 
to conversion in sysfs_emit.

> +}
> +
> +static s64 __rc6p_residency_ms_show(struct intel_gt *gt)
> +{
> +	return get_residency(gt, GEN6_GT_GFX_RC6p);
> +}
> +
> +static ssize_t rc6p_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buff)
> +{
> +	s64 rc6p_residency = sysfs_gt_attribute_r_func(dev, attr,
> +						__rc6p_residency_ms_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) rc6p_residency);
> +}
> +
> +static s64 __rc6pp_residency_ms_show(struct intel_gt *gt)
> +{
> +	return get_residency(gt, GEN6_GT_GFX_RC6pp);
> +}
> +
> +static ssize_t rc6pp_residency_ms_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buff)
> +{
> +	s64 rc6pp_residency = sysfs_gt_attribute_r_func(dev, attr,
> +						__rc6pp_residency_ms_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) rc6pp_residency);
> +}
> +
> +static s64 __media_rc6_residency_ms_show(struct intel_gt *gt)
> +{
> +	return get_residency(gt, VLV_GT_MEDIA_RC6);
> +}
> +
> +static ssize_t media_rc6_residency_ms_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buff)
> +{
> +	s64 rc6_residency = sysfs_gt_attribute_r_func(dev, attr,
> +						__media_rc6_residency_ms_show);
> +
> +	return sysfs_emit(buff, "%u\n", (u32) rc6_residency);
> +}
> +
> +static DEVICE_ATTR_RO(rc6_enable);
> +static DEVICE_ATTR_RO(rc6_residency_ms);
> +static DEVICE_ATTR_RO(rc6p_residency_ms);
> +static DEVICE_ATTR_RO(rc6pp_residency_ms);
> +static DEVICE_ATTR_RO(media_rc6_residency_ms);
> +
> +static struct attribute *rc6_attrs[] = {
> +	&dev_attr_rc6_enable.attr,
> +	&dev_attr_rc6_residency_ms.attr,
> +	NULL
> +};
> +
> +static struct attribute *rc6p_attrs[] = {
> +	&dev_attr_rc6p_residency_ms.attr,
> +	&dev_attr_rc6pp_residency_ms.attr,
> +	NULL
> +};
> +
> +static struct attribute *media_rc6_attrs[] = {
> +	&dev_attr_media_rc6_residency_ms.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group rc6_attr_group[] = {
> +	{ .attrs = rc6_attrs, },
> +	{ .name = power_group_name, .attrs = rc6_attrs, },
> +};
> +
> +static const struct attribute_group rc6p_attr_group[] = {
> +	{ .attrs = rc6p_attrs, },
> +	{ .name = power_group_name, .attrs = rc6p_attrs, },
> +};
> +
> +static const struct attribute_group media_rc6_attr_group[] = {
> +	{ .attrs = media_rc6_attrs, },
> +	{ .name = power_group_name, .attrs = media_rc6_attrs, },
> +};
> +
> +static int __intel_gt_sysfs_create_group(struct kobject *kobj,
> +					 const struct attribute_group *grp)
> +{
> +	return is_object_gt(kobj) ?
> +	       sysfs_create_group(kobj, &grp[0]) :
> +	       sysfs_merge_group(kobj, &grp[1]);
> +}

Merging handling "gt/gt#/*" and "power/*" attributes into the same 
helpers seems unnatural to me, in many functions we have two branches 
based on value of is_object_gt, with the most hacky 
intel_gt_sysfs_get_drvdata.
Splitting handling these attributes would allow to drop fragile 
is_object_gt helper and make functions more straightforward, probably at 
the cost of few lines more. On the other side I am not sure if it is 
worth to change everything to just address code purity concerns :)

So with variable type adjustement:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


Regards
Andrzej


> +
> +static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
> +{
> +	int ret;
> +
> +	if (!HAS_RC6(gt->i915))
> +		return;
> +
> +	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
> +	if (ret)
> +		drm_warn(&gt->i915->drm,
> +			 "failed to create gt%u RC6 sysfs files\n",
> +			 gt->info.id);
> +
> +	/*
> +	 * cannot use the is_visible() attribute because
> +	 * the upper object inherits from the parent group.
> +	 */
> +	if (HAS_RC6p(gt->i915)) {
> +		ret = __intel_gt_sysfs_create_group(kobj, rc6p_attr_group);
> +		if (ret)
> +			drm_warn(&gt->i915->drm,
> +				 "failed to create gt%u RC6p sysfs files\n",
> +				 gt->info.id);
> +	}
> +
> +	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915)) {
> +		ret = __intel_gt_sysfs_create_group(kobj, media_rc6_attr_group);
> +		if (ret)
> +			drm_warn(&gt->i915->drm,
> +				 "failed to create media %u RC6 sysfs files\n",
> +				 gt->info.id);
> +	}
> +}
> +#else
> +static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
> +{
> +}
> +#endif /* CONFIG_PM */
> +
> +void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
> +{
> +	intel_sysfs_rc6_init(gt, kobj);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
> new file mode 100644
> index 000000000000..f567105a4a89
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __SYSFS_GT_PM_H__
> +#define __SYSFS_GT_PM_H__
> +
> +#include <linux/kobject.h>
> +
> +#include "intel_gt_types.h"
> +
> +void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj);
> +
> +#endif /* SYSFS_RC6_H */
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index 3643efde52ca..b08a959e5ccc 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -45,107 +45,6 @@ struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
>   	return to_i915(minor->dev);
>   }
>   
> -#ifdef CONFIG_PM
> -static u32 calc_residency(struct drm_i915_private *dev_priv,
> -			  i915_reg_t reg)
> -{
> -	intel_wakeref_t wakeref;
> -	u64 res = 0;
> -
> -	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref)
> -		res = intel_rc6_residency_us(&to_gt(dev_priv)->rc6, reg);
> -
> -	return DIV_ROUND_CLOSEST_ULL(res, 1000);
> -}
> -
> -static ssize_t rc6_enable_show(struct device *kdev,
> -			       struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	unsigned int mask;
> -
> -	mask = 0;
> -	if (HAS_RC6(dev_priv))
> -		mask |= BIT(0);
> -	if (HAS_RC6p(dev_priv))
> -		mask |= BIT(1);
> -	if (HAS_RC6pp(dev_priv))
> -		mask |= BIT(2);
> -
> -	return sysfs_emit(buf, "%x\n", mask);
> -}
> -
> -static ssize_t rc6_residency_ms_show(struct device *kdev,
> -				     struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
> -	return sysfs_emit(buf, "%u\n", rc6_residency);
> -}
> -
> -static ssize_t rc6p_residency_ms_show(struct device *kdev,
> -				      struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
> -	return sysfs_emit(buf, "%u\n", rc6p_residency);
> -}
> -
> -static ssize_t rc6pp_residency_ms_show(struct device *kdev,
> -				       struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
> -	return sysfs_emit(buf, "%u\n", rc6pp_residency);
> -}
> -
> -static ssize_t media_rc6_residency_ms_show(struct device *kdev,
> -					   struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
> -	return sysfs_emit(buf, "%u\n", rc6_residency);
> -}
> -
> -static DEVICE_ATTR_RO(rc6_enable);
> -static DEVICE_ATTR_RO(rc6_residency_ms);
> -static DEVICE_ATTR_RO(rc6p_residency_ms);
> -static DEVICE_ATTR_RO(rc6pp_residency_ms);
> -static DEVICE_ATTR_RO(media_rc6_residency_ms);
> -
> -static struct attribute *rc6_attrs[] = {
> -	&dev_attr_rc6_enable.attr,
> -	&dev_attr_rc6_residency_ms.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group rc6_attr_group = {
> -	.name = power_group_name,
> -	.attrs =  rc6_attrs
> -};
> -
> -static struct attribute *rc6p_attrs[] = {
> -	&dev_attr_rc6p_residency_ms.attr,
> -	&dev_attr_rc6pp_residency_ms.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group rc6p_attr_group = {
> -	.name = power_group_name,
> -	.attrs =  rc6p_attrs
> -};
> -
> -static struct attribute *media_rc6_attrs[] = {
> -	&dev_attr_media_rc6_residency_ms.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group media_rc6_attr_group = {
> -	.name = power_group_name,
> -	.attrs =  media_rc6_attrs
> -};
> -#endif
> -
>   static int l3_access_valid(struct drm_i915_private *i915, loff_t offset)
>   {
>   	if (!HAS_L3_DPF(i915))
> @@ -497,29 +396,6 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>   	struct device *kdev = dev_priv->drm.primary->kdev;
>   	int ret;
>   
> -#ifdef CONFIG_PM
> -	if (HAS_RC6(dev_priv)) {
> -		ret = sysfs_merge_group(&kdev->kobj,
> -					&rc6_attr_group);
> -		if (ret)
> -			drm_err(&dev_priv->drm,
> -				"RC6 residency sysfs setup failed\n");
> -	}
> -	if (HAS_RC6p(dev_priv)) {
> -		ret = sysfs_merge_group(&kdev->kobj,
> -					&rc6p_attr_group);
> -		if (ret)
> -			drm_err(&dev_priv->drm,
> -				"RC6p residency sysfs setup failed\n");
> -	}
> -	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
> -		ret = sysfs_merge_group(&kdev->kobj,
> -					&media_rc6_attr_group);
> -		if (ret)
> -			drm_err(&dev_priv->drm,
> -				"Media RC6 residency sysfs setup failed\n");
> -	}
> -#endif
>   	if (HAS_L3_DPF(dev_priv)) {
>   		ret = device_create_bin_file(kdev, &dpf_attrs);
>   		if (ret)
> @@ -565,8 +441,4 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
>   		sysfs_remove_files(&kdev->kobj, gen6_attrs);
>   	device_remove_bin_file(kdev,  &dpf_attrs_1);
>   	device_remove_bin_file(kdev,  &dpf_attrs);
> -#ifdef CONFIG_PM
> -	sysfs_unmerge_group(&kdev->kobj, &rc6_attr_group);
> -	sysfs_unmerge_group(&kdev->kobj, &rc6p_attr_group);
> -#endif
>   }

