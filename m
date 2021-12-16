Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136D0477EBA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 22:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DE410E300;
	Thu, 16 Dec 2021 21:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4C710E300;
 Thu, 16 Dec 2021 21:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639689982; x=1671225982;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5tk0KDgMjJRa5qfnPAdOFLhTDIfQRQQhSZawegaNDl4=;
 b=iH4rD6q/6ymSudoFmpRAJKSaahewqpQr40YmVcDE7C+cpjFrJbJiNXh9
 Dre1T1k6ypeRjPBuHpF17LVnH5VsxKFFxNLYsfPpdwWacfnjK7DSRJSBA
 xpwhgcpDYbdA7JWWO5qDzSJN5GXjcasovARyn8p+zwAoQHY5gnJPnKMTR
 emk3z36dSc/LdSDhAqA4Lu6DxhQAyYIGn1r/OlCD2CzsRcEH6Qnpxqhim
 Ei8dMiezCkdGN4UBW1/SPpeNgUmQ5HddeHu3g0ZwsC56gguT3wl+Hv6kZ
 nilhF3o/vOV4zZAmpGC0STjD/aEh2IZHHmFOLi2Jb6OIdU2cdP8QzF4H2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="237146937"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="237146937"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 13:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="520410371"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2021 13:26:21 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 13:26:21 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 13:26:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 13:26:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 13:26:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKwNqM1oQ7Z4DtD1SCto+SjdA+FsSTuW1zSUhPLBF3FPfwh0Pi/Mna2Fjy2HjRwb3jvG2BpvwnAlBPD4Wnsc2hnwwSG+dJSlG1Fl8B1sQNnTQ0PvDizFjYHd1hgEkmG2igFZrhydLlfmk3nCLoCJ9HBGsPe1zgeFrzULQbHFtCoedQBqRJb99T/SBI5tCOu2nSZmvvTgzr7FdZ4Vvq8rSSh/QYMGIEWzxMmOVfBxrrHmg9JI6n+Nzcoih2aQH7wqYa8F1DjBLv2i13qf7Ejb0d9MnursDjIZ7S21wKTt2WGlhUar4QehFEvsoDWvfJ7MXHQeGZ4SjuzIadeNx3GTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfq0WVomr9UH1TGx/uper3EMh/5gz/oXzTLPvyUgR4s=;
 b=X5UIfWCwurAtPZZHrX96CqcAZCKNrjiJMbfAoA6XRfWokOgsSANdkhW/69bQqDWZ5re8pKR4R57JlF3ISyRJb78S8prHQp3UZ/iVW+mvOcIajV+tgS00aBom5rHMyFIBif0J5cT8mfwZ5/AJ/XKCftQg24GRFVuL+t8PfH7/zOQWssv6AkRpjTkOr2wXTSDhmfCb0uxt6QZT8I9T7FDzEpO6XxvIkpdgJaitUZtqhq4PtoGmDS4cUNdNXZ3omcBHkKlenhtZIV0+ymtoSY1KR5vScs+sZIUmGiB5oRt2sZmaY4j6ieI7jc+31KtGwgMtIzD7oDveTJf3BT6pcbFrIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5671.namprd11.prod.outlook.com (2603:10b6:8:3c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 21:26:06 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4690.026; Thu, 16 Dec 2021
 21:26:06 +0000
Message-ID: <a83eda05-a550-c5ff-1122-2e31a03ee4ac@intel.com>
Date: Thu, 16 Dec 2021 13:26:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v8 16/16] drm/i915: Remove unused i915->ggtt
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-17-andi.shyti@linux.intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20211214193346.21231-17-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0089.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::30) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
Received: from [10.0.0.208] (67.181.129.204) by
 BYAPR11CA0089.namprd11.prod.outlook.com (2603:10b6:a03:f4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 21:26:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a9bee42-8b92-4109-3bb6-08d9c0daab8f
X-MS-TrafficTypeDiagnostic: DM8PR11MB5671:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM8PR11MB5671B3F3CC2A06B5440F28438C779@DM8PR11MB5671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1RdlfI4QFqfPIuTLbiITBwcLnJZrO0ZgP8XNoJfE3Nuch3zVYgAK4XC4DreQvGEib/aeOZ+ADyvMLFYak6d7eaxpsWYgbOzrJWXsU+jxWMNDU5iqPghkan5rzMAKPqVvPaOeQWr5gs0J8Cu/ob0asdkUgUNPzgeBqMabaQ92bohpCxQpdRrG5n6ADMbSFY8rTw0dMqkjta+I83rtPEpVdnGHAE5dCXhsPjiLtmyQfu9dKPmDdVV/k9/TZpog4MGkBrCG5WtAxnYcpfwN5gEae5VkMuA8ToNZ1Dyy4YM4Oj/EdmPTvBT6qft/Tm4FVVpjogUvyy3zXFDj33BC/r68J1+nmvCnfwqCGtdIKRmzYhmTUqINyi1ZLLoOJBiNqm7fNFenLZmEBnQCiLmYEjQXK67+QhMyeLVxWXNsZQYkml4JflJ6h5ezy5vv9t2iZAmBEifSv2elsoraOlutd5kTgQDgBcYeEPh5da3Oh15T4dNKm8ExEO0pTDkIz1o7oFxiWtpHk+XVgqBjfdMGBj5ZT2vUg8zkxtCElo6YDoB0bGU+E7VjKLkh+fez6B180afBN9wQLy/3UdMrcDalU7GlvN6lWoO7CJvWqBXjTSJb7dZGqnb4UycV+grFsLJPccyZhpz1m6U2MQy73MORo/gz5Oo6EbXvUtX9m5iEUUAuH6GSgEcpuSifSBAdBkCXv+Y3omPwEODMiY6tCY10e21zfi9LPFIdHjmfg5iAxIu04yA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(316002)(31686004)(31696002)(26005)(2616005)(86362001)(36756003)(66946007)(66556008)(66476007)(186003)(83380400001)(38100700002)(110136005)(82960400001)(16576012)(5660300002)(956004)(8936002)(8676002)(508600001)(2906002)(4326008)(6486002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk16bUVsM0NuSHRsOFVMZEoyMG45NkRsa1hucGxXcXNlTEVhU1ZobXN5V1gz?=
 =?utf-8?B?QmQwaU1vcUhzTHlkZ0MwRUJzeTc3a0pIRFFzeDNXcUhWTzJqaDdBNUt4ZWFP?=
 =?utf-8?B?d1NjWkhSVnVkWnhPR0Vyb1ZESm1WZDE4RmpZU0JPalRWNlQ3YjNSUVRWV09v?=
 =?utf-8?B?NGNCWmh4VlJLMnpOUlFXamVpQ01FcmEwRkFFakV2YWVTWkh4VGhXcXdSZGl6?=
 =?utf-8?B?cjRoVXB1aFpNNk40bmd4RWE2b29MOVdDUi9xV1JtNjUvNjhxOVNuUkNmZXZl?=
 =?utf-8?B?SnA0RktueTRrdWxPSVdYTHJRdEUxY0NpcG5MRk53VHZMSWgrazZQNXl3NGdB?=
 =?utf-8?B?T2RZZ1dIWUR6bHhSdEVuM1RoZVlzZGxIdlBTbytsNHd2RU9xNUpqUzQ4SXZD?=
 =?utf-8?B?bzRLamdEVUNVSUNqS2tFaXZURksvcm9BeDZyUnM2d3dVcGw2NktENHFKcjJZ?=
 =?utf-8?B?VC9qaFlUUDN6ZTk5cm95OHpwNjFsSCtLK2RVdzhyR1NCM1QyRVB0V3FqNHBx?=
 =?utf-8?B?MWl5ZldjK3VkYjJhTmtURVRQZDRjUlZ2dWNTR3BLWWtOeUcvaFJKSWlHNVNa?=
 =?utf-8?B?SUtpb0NmVHkrOWpwUDRhSllhcHFad0pnWnlXVjNPS2tadTMwZzlwbndEc000?=
 =?utf-8?B?Zk9tUDhET3hZY3Y4Zm94dXU4dUphc1FSQko2RzU2K1krdloxRVA1c0ZybDdn?=
 =?utf-8?B?b3owaEpFRlNOR1A5bUVadGtTeGY4dmt6WWx4MS90ZXpkQnNhVzNFa2hNSEU1?=
 =?utf-8?B?c1hYMW5acnpwZjh0ZktoS2J4aDJrdjl6OW5pYWprUkRzZEc1NXRnb0l6bDhU?=
 =?utf-8?B?YU1PS0s4a21neXBqVmwycHNwbWY0NmVyblhGOW1WU0FzY3AxQWVZRTlXWnBq?=
 =?utf-8?B?K1Mxak92ZGJHQ2lNSkl1RmxNeHJ1YithVExvTzNwRmJkRkdXZ1RBNW9xNUFC?=
 =?utf-8?B?Y2NjMDVGRndwTE5aTjBoZ2N5TGZDZElKQUJScTFUOWNhZWJVR09CeEpGbldR?=
 =?utf-8?B?MEhnQ1UxTHdGc0RzWnhrUXVEY051TkppbkFZbyt2aXRGeUhxbFlWTlR2Zjhu?=
 =?utf-8?B?L3NrQXBKaU81cGJJdUw2OThjVzgwNzZvU0d6aG43TGw2S1lhT29ZM1lBWk9X?=
 =?utf-8?B?dWxTbWVsd2ZxcTJ2ZGgyOE9SZTh6d293ZU43MmhvSExKdllkVHlsam1jbXFM?=
 =?utf-8?B?TXAxaXJPdjY0dWsxMWJUOWdmcThnUHFaRDJOZWdTRzhkRFFDMTd6OTZ4Mm1X?=
 =?utf-8?B?eW41azI4RzN4Q1g3TmovU1Irc3kwcUIwR29SekFuS3U4Z0FNbnJxU2ZIZk5B?=
 =?utf-8?B?bEdlaGNocjU4Uk8vVHk0cVRuUGl5SU1KYzNJQ3NvVTJuMEJuV3VDRUd0Uk5a?=
 =?utf-8?B?eXcxUmR2eWJGUkUwRWsvQTFxUzZpdkQ5RmRZTnJOaWt1VUpmb0NuZk11MWhG?=
 =?utf-8?B?aXY5ZlFBOVdOeDBHWUxQUEhsMjJaOEpYU05seWxvME85ZFpLaG5KcFkrREsx?=
 =?utf-8?B?dTM0bm1XeHNNVjlCb3YyZHdKSndESmNkakMxVEFXZkZGNEZZNlNkajFkUjBS?=
 =?utf-8?B?QmZmdlJOUE9IVXBBZFczZHA0UVpHS292MVgwRnM2NjJUK3ZxeldSUDRqT1Nj?=
 =?utf-8?B?NVdFYTdFSm5zUm9LcnRGc1hySW9PUVlvS0p4azN2L2N2anBXZ1JxWmVvdFJW?=
 =?utf-8?B?NVFiWER4UzFVd1kyb3o0QkNqRm9UdnNvd3dGcmpiRkticW5VUkFRTklmZUFP?=
 =?utf-8?B?MUp3MFJuczdWUFk3dVcveVB4azNnSkZRc1lYNmgyWlFUQUg5TkpGN3NPdzJN?=
 =?utf-8?B?QTduVC8xRGRzTDB4ME9FaXgwOUVacGNzb1hGeFFFeW15cEdHTkZwYk1VTTVB?=
 =?utf-8?B?dXlqbEZ3WTJhRlQweDRXOStMRkd3LytBbnlSbk5KNHpSVnEvMkpXczdOWng0?=
 =?utf-8?B?UmtoMzFNM2JiQXZZNzFrMXYrTnpoMVh3RmdzbUFOa0o2REdhQytocHE1RERh?=
 =?utf-8?B?eU9hbGZ6YzJnT0xsTW5lNmhjcDlBcDQ5allDSTB2RG1BTnVnWHR6SHZKeks3?=
 =?utf-8?B?SDhmQ1daamg2QS82RklSQS9EOTdKRUtGaFZ0SnVjc25sVTZaMkpjNGJ4dEIz?=
 =?utf-8?B?cjZUeGtXeFJPczVQRWxWd0lpNEV2U1Q3YklmeFNRYWlYQWgvaHhLU200cFFX?=
 =?utf-8?B?cUlHam1iMDFHTEIyaDZXRjFxN0ZlQXVCYUUyNjF1bzFQZW5wcDBpQzJGTVc2?=
 =?utf-8?B?dWRIcU13N2huaUN1cDFWb3pWSWVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9bee42-8b92-4109-3bb6-08d9c0daab8f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 21:26:06.7979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1bJ3txhzJKmNKvQGMhh1wxdLVuZml4wgeN2WfxbJBHlam02ren/SS1MYd/FYg81MX/xm14ReYzvJG7nkPX5MedCplKVbFIRfiEcNUyx5EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5671
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/14/2021 11:33 AM, Andi Shyti wrote:
> The reference to the GGTT from the private date is not used
> anymore. Remove it.
-Quick spellcheck for "data".
>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c            |  7 +++++--
>   drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +-
>   drivers/gpu/drm/i915/i915_driver.c            |  4 +++-
>   drivers/gpu/drm/i915/i915_drv.h               |  2 --
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 20 ++++++++++---------
>   drivers/gpu/drm/i915/selftests/i915_vma.c     | 20 ++++++++++---------
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++++++--
>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  9 ++++-----
>   drivers/gpu/drm/i915/selftests/mock_gtt.h     |  3 ++-
>   9 files changed, 44 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index f98f0fb21efb..298ff32c8d0c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2019 Intel Corporation
>    */
>   
> +#include <drm/drm_managed.h>
>   #include <drm/intel-gtt.h>
>   
>   #include "intel_gt_debugfs.h"
> @@ -85,9 +86,11 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
>   	return 0;
>   }
>   
> -void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt)
> +int intel_gt_assign_ggtt(struct intel_gt *gt)
>   {
> -	gt->ggtt = ggtt;
> +	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
> +
> +	return gt->ggtt ? 0 : -ENOMEM;
>   }
>   
>   static const struct intel_mmio_range icl_l3bank_steering_table[] = {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 3ace129eb2af..94e1bac8c0cc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -36,7 +36,7 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
>   
>   void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
>   void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
> -void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt);
> +int intel_gt_assign_ggtt(struct intel_gt *gt);
>   int intel_gt_probe_lmem(struct intel_gt *gt);
>   int intel_gt_init_mmio(struct intel_gt *gt);
>   int __must_check intel_gt_init_hw(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 3c984553d86f..5f2343389b5e 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -571,7 +571,9 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>   
>   	i915_perf_init(dev_priv);
>   
> -	intel_gt_init_hw_early(to_gt(dev_priv), &dev_priv->ggtt);
> +	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
> +	if (ret)
> +		goto err_perf;
>   
>   	ret = i915_ggtt_probe_hw(dev_priv);
>   	if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 65724e4df3bd..8266df3e11ac 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -838,8 +838,6 @@ struct drm_i915_private {
>   	struct drm_atomic_state *modeset_restore_state;
>   	struct drm_modeset_acquire_ctx reset_ctx;
>   
> -	struct i915_ggtt ggtt; /* VM representing the global address space */
> -
>   	struct i915_gem_mm mm;
>   
>   	/* Kernel Modesetting */
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 9afe7cf9d068..f62f7dac57f2 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1737,26 +1737,28 @@ int i915_gem_gtt_mock_selftests(void)
>   		SUBTEST(igt_gtt_insert),
>   	};
>   	struct drm_i915_private *i915;
> -	struct i915_ggtt *ggtt;
> +	struct intel_gt *gt;
>   	int err;
>   
>   	i915 = mock_gem_device();
>   	if (!i915)
>   		return -ENOMEM;
>   
> -	ggtt = kmalloc(sizeof(*ggtt), GFP_KERNEL);
> -	if (!ggtt) {
> -		err = -ENOMEM;
> +	/* allocate the ggtt */
> +	err = intel_gt_assign_ggtt(to_gt(i915));
> +	if (err)
>   		goto out_put;
> -	}
> -	mock_init_ggtt(i915, ggtt);
>   
> -	err = i915_subtests(tests, ggtt);
> +	gt = to_gt(i915);
> +
> +	mock_init_ggtt(gt);
> +
> +	err = i915_subtests(tests, gt->ggtt);
>   
>   	mock_device_flush(i915);
>   	i915_gem_drain_freed_objects(i915);
> -	mock_fini_ggtt(ggtt);
> -	kfree(ggtt);
> +	mock_fini_ggtt(gt->ggtt);
> +
>   out_put:
>   	mock_destroy_device(i915);
>   	return err;
> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> index 6ac15d3bc5bc..a87cba4eb92f 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> @@ -907,26 +907,28 @@ int i915_vma_mock_selftests(void)
>   		SUBTEST(igt_vma_partial),
>   	};
>   	struct drm_i915_private *i915;
> -	struct i915_ggtt *ggtt;
> +	struct intel_gt *gt;
>   	int err;
>   
>   	i915 = mock_gem_device();
>   	if (!i915)
>   		return -ENOMEM;
>   
> -	ggtt = kmalloc(sizeof(*ggtt), GFP_KERNEL);
> -	if (!ggtt) {
> -		err = -ENOMEM;
> +	/* allocate the ggtt */
> +	err = intel_gt_assign_ggtt(to_gt(i915));
> +	if (err)
>   		goto out_put;
> -	}
> -	mock_init_ggtt(i915, ggtt);
>   
> -	err = i915_subtests(tests, ggtt);
> +	gt = to_gt(i915);
> +
> +	mock_init_ggtt(gt);
> +
> +	err = i915_subtests(tests, gt->ggtt);
>   
>   	mock_device_flush(i915);
>   	i915_gem_drain_freed_objects(i915);
> -	mock_fini_ggtt(ggtt);
> -	kfree(ggtt);
> +	mock_fini_ggtt(gt->ggtt);
> +
>   out_put:
>   	mock_destroy_device(i915);
>   	return err;
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 0b469ae0f474..28a0f054009a 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -194,8 +194,13 @@ struct drm_i915_private *mock_gem_device(void)
>   
>   	mock_init_contexts(i915);
>   
> -	mock_init_ggtt(i915, &i915->ggtt);
> -	to_gt(i915)->vm = i915_vm_get(&i915->ggtt.vm);
> +	/* allocate the ggtt */
> +	ret = intel_gt_assign_ggtt(to_gt(i915));
> +	if (ret)
> +		goto err_unlock;
> +
> +	mock_init_ggtt(to_gt(i915));
> +	to_gt(i915)->vm = i915_vm_get(&to_gt(i915)->ggtt->vm);
>   
>   	mkwrite_device_info(i915)->platform_engine_mask = BIT(0);
>   	to_gt(i915)->info.engine_mask = BIT(0);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> index 13bb0c3c3f0d..a36f46d50e83 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> @@ -106,12 +106,12 @@ static void mock_unbind_ggtt(struct i915_address_space *vm,
>   {
>   }
>   
> -void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
> +void mock_init_ggtt(struct intel_gt *gt)
>   {
> -	memset(ggtt, 0, sizeof(*ggtt));
> +	struct i915_ggtt *ggtt = gt->ggtt;
>   
> -	ggtt->vm.gt = to_gt(i915);
> -	ggtt->vm.i915 = i915;
> +	ggtt->vm.gt = gt;
> +	ggtt->vm.i915 = gt->i915;
>   	ggtt->vm.is_ggtt = true;
>   
>   	ggtt->gmadr = (struct resource) DEFINE_RES_MEM(0, 2048 * PAGE_SIZE);
> @@ -132,7 +132,6 @@ void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
>   	ggtt->vm.vma_ops.clear_pages = clear_pages;
>   
>   	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
> -	to_gt(i915)->ggtt = ggtt;
>   }
>   
>   void mock_fini_ggtt(struct i915_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.h b/drivers/gpu/drm/i915/selftests/mock_gtt.h
> index e3f224f43beb..d6eb90bd7f3f 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.h
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.h
> @@ -27,8 +27,9 @@
>   
>   struct drm_i915_private;
>   struct i915_ggtt;
> +struct intel_gt;
>   
> -void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt);
> +void mock_init_ggtt(struct intel_gt *gt);
>   void mock_fini_ggtt(struct i915_ggtt *ggtt);
>   
>   struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name);

Seems like a straightforward change.

Reviewed-by : Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

