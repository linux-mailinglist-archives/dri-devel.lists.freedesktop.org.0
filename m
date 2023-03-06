Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250FE6AD30C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 00:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442E310E279;
	Mon,  6 Mar 2023 23:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883A010E257;
 Mon,  6 Mar 2023 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678146834; x=1709682834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=79ESHkikaUYWDZFl1qQWdlWEP/7VU67xcZDfyhUAaTA=;
 b=mPQJpROugKeKVB7WBvAQsk8Qu2ePD2D5qm2xkiP9pqI0JU8Nlm25lLgv
 rMja5Wl2WHMMVeF2Mgkzu3xaiHeKmmEkCnmN8jf2m0ctfAOKEgPZalTYP
 n6dr1fW52HgSy/4O3ShXF5PyCjiEwbsI3Hj+O4Cf3bY7gg543ApAMXnkK
 bp8z1VPWBemadCR70Ot3upizQ3xEce5hRp2LVt6I7Bt/NkJhp5yixSpIL
 AcLMp2dkS9CqrKKzTfjvS9ekIQY8J3kBFpiBRZbgyJokKu5CQS4rohp4Z
 T3KopHH1OL0vsSGyt0iKLgCweoyNrbH+JON+MRkvYWTDXzCnaDSTxIT5R g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338038269"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="338038269"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 15:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="922136710"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="922136710"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2023 15:53:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 15:53:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 15:53:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 15:53:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLYR7vpje9ldTLYqPjeCw+RAxL8fzzK6i4rwEJD6nAJos00PCSg3abLm2Yg1g29djYM3A0o7lyRGfSAgaUJYlH1Z5z4d4NyNU/6Qd5Fux+Mlq+ryj0TOYOWtyEQPvQKW+bhjUCTlztauaatAvT7JxbTUtZ91d9zjnEOon3Jq7SYk+XVYGaM78oFcf4BKYxAf9/R/7tmXYa3HDPBhojVgOW92P/mJExgNQyKae0J4Nod0+owtEUwyoQ38a8BqRf2SkMGV7DZeloFR7etR2Qi2IUmomn5UZ4c6h6uoH4JtZnI5Le/8CJkz7QLcX4lthMjpxa8OMeLTV9Cfd2BVCuvlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G7T0tQC4GfK8l+lrI0Ejf4OITD3dfc4IvxF4I9zU/s=;
 b=GeysxczlmKRng4rFNNpntgbeSeq+IYPMzKXApyy5/MZD+vZkqgow5Nuce6lejXp1VpnsT26HyDX0AgUGU6phZbUNShd+2yjHMMYsdnVKb2BW/TkT9XRd92sLhPVVW6U9tLGEwpJHhyIIoIf611Ji4TSa3OxTtI3IfavO2MgbxfhJnla32WsZUqHgrwVMqbUd9dYV2omp6NWlFyEsn1Je6iIRPBRJkH00SYyfSGFkwTlhFk1mOsFEEoaB2Ozm155sb6zsdVqf/NTxdefygZOmxDYBYPcwUxBX+hsrI9yrqHygteQEcFtpBxbUyY9c7lQvnhL5rr8EtheMepkPo1aICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7285.namprd11.prod.outlook.com (2603:10b6:8:13d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 23:53:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:53:49 +0000
Date: Mon, 6 Mar 2023 15:53:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/dg1: Move Wa_1806527549 to the
 right function
Message-ID: <20230306235346.imrhwkpvczfoceug@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
 <20230306204954.753739-3-lucas.demarchi@intel.com>
 <20230306231750.GK1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230306231750.GK1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: DM6PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:5:134::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b91496-c7e9-4084-6b98-08db1e9e0793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSZWjHIY1PMWb/mxwI3IrRPMKjno3Ss8THPQ7k/yPmx7+h81QzN0mJ10JgIKTXpjH9nS6YTeVu2o2bmcgDB+d3UGn+gdYD8N1mUewklheUi1Z9XLWM4qp5E1GvlGFUe1nTO4Uslry86xBvkXQXbJIxLtXtNXnRrWSTGYCwtiNEi2PLuZYr4zT59l7NhPIv8KKc53fP8SyT+rUPKippCmpZyluf+M879T9xDIKdSKx17rcoS7ZIk/6xx26vdJ7ceey/DOFuxyInStO8ZQFCeov0KXTdDDNytDgTG/L/G/rzw+sS5ZlkUXz3TdVHHxGTV1d+Bikqe3KRu5713vEc7wcuf2Rc0eVAZhKACFxPGhOSL7q8W2acKkMig5cY5m0QorE6nJ/yRDgbMkSsv1i6x7W076FF83QBH01mfZPQ1A7iRN6rvfnJLaCJzJlM1rZB9Co1naJM3fvs2p3Pgdc/RnleesCOMQ/sOAh2ZvOk77g3lGX2OFozwcp6UhsniTjgIQT7Xpd+F56LvOKsDXCgQ5uqM+WkenHOh2HFYXaKWY3hvIovoDJMLe4QIoY3Om0oLrgtD3FBmNj/21JuNLkpQWPwaq72KHvwTf9kaPMLTf8bH4MmFb7CH5wdxPjg6nz007V8rRun/tHr2ukPGuSDu5TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199018)(38100700002)(86362001)(82960400001)(36756003)(1076003)(5660300002)(2906002)(3716004)(66946007)(66556008)(4326008)(41300700001)(6862004)(66476007)(8676002)(8936002)(186003)(26005)(9686003)(83380400001)(6512007)(6506007)(316002)(6636002)(478600001)(450100002)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iYsutk0js5xWS3c+/tJWJ/WEPR3npaitaG44Rxt56TphDqYyLTujqOTH1b6k?=
 =?us-ascii?Q?1HzPQkscRiAn0KkUQPSf9fyngXMrjQPlWIjpuJm4SYKJc0Ms0UtXrtdfaWc5?=
 =?us-ascii?Q?uJOoynDWvPSdRKafdDrrIynjQqa0Y0dNbM5HsYTUP4GDIQf6Q8L0tsbsPvkZ?=
 =?us-ascii?Q?4PTHTUiHQ6alib5pyK3SOYjJuXOkXSnemHJkiBdIBCuzmO2Y3sJ6WFHGR1Ft?=
 =?us-ascii?Q?egAfDeoA5t3cAewRSbMUp99Kh3G5109F4QtPLFcAwWFR5je2/wlUIFFea0oR?=
 =?us-ascii?Q?fKZgqxeWRtctN+6n5zLnJJHWp1+SR7CTDTTEtVxt+0ODgGyi/Fx4kdDC1z0a?=
 =?us-ascii?Q?NutLuMZl1CTWKT1iA+YqY9bE35iVyQtcaXdPLNEEqvX3I6TF4s2mVl8uWk2r?=
 =?us-ascii?Q?/wL7mGu4hG1WWbKJRhOrrygm5KTkdItYkSQCTxHQCC/SLbT5S0I/JYFbhDKT?=
 =?us-ascii?Q?1sleFFTR3DZZrK+bbwMpxLGNJJNsHfPefX/c5SOTOBU/rJQccMC7E+3rAcrN?=
 =?us-ascii?Q?19MN2jgN6jcY3IOBWgH0lO3ySmLhW6pblr5DnGfqS96+zCY8LVA7a6mwBVoi?=
 =?us-ascii?Q?9Shaz5QNaEk8NpAUiEiSilckrXNN0atRcoR5Zn6P/9ojy8VxbbiLRXguOUE3?=
 =?us-ascii?Q?8Ad0cCdN34GOYPEsVyH3o6Bqovkq2x0HqNYD4UHlU+qVsYgASsGRYgW0RsxK?=
 =?us-ascii?Q?6ppcojs+UiIN1tfF6vfzGN9PvSgAlxnbLQhXggHUYAVb8BUM6I6O0LBYyh9L?=
 =?us-ascii?Q?5Hkd9G5Jwqdnzy9sd3Fjbh2k5Sty/Rahh9Jr42CPp0uPwF/Pd2iAQWsYZFeq?=
 =?us-ascii?Q?bv82/d2AlM4i+WklEEaJbyl4QDfV/srhW3gLfjSlcIW8ULynhnR8jHRhK9Pa?=
 =?us-ascii?Q?US/FilTClyBRu2s581exJJ125u+14pF8Ig9MJLJ/re/pygIwS056a0BD4M2o?=
 =?us-ascii?Q?bS1jqaJf0ZZDRp0qlegc6Urj6xy+daE7SCzzsQjFIHswcqkCvmEUJuXiZ3m5?=
 =?us-ascii?Q?823Rr8OFoiEdYxTUksg+H9ZYLBWZ8uRDKAhKtb9VjP0tpKGHWSeRLxkXM+ea?=
 =?us-ascii?Q?95xLYClzWYpxJuHmlZ2f7v0tvogmYgGG00IfDsNE5lJDdDC1lGqQtx8FtAfl?=
 =?us-ascii?Q?9y3g4WLonidl6ECVl3o64Cf+HqPqp0TrUxdIOVa+hG8ljkwGF6Sr+8Bt7sXH?=
 =?us-ascii?Q?x0PC7RdfPqRrr8ATd1mANbsTHwefVaMFIqN4VekrcyWAGRURQrYOXdr9CJSo?=
 =?us-ascii?Q?g+H2hUPfbAjceO9LwdwG7sDO4oIJcLWvuQmO47Ekvku5cyyicG5DmMgt28tU?=
 =?us-ascii?Q?khYm7y2u4DDZiFB7FnaepCsndCuMhK/Qo5tItuP8AkXBxvb5ejcSghYEO++y?=
 =?us-ascii?Q?dFJN2cRgUYJPg26kH2oEPI9ZsBTdu0CaTX+0Niryyg67yAce45RfcCcqydcU?=
 =?us-ascii?Q?MAXnJbB5+vAhrQ0glVG+x6eKycDUnLNh4eBrrTLtBbNh5hQ1ekEL1uqIu2og?=
 =?us-ascii?Q?YK8OxG+dOfplXdn95kOmomto2YymEi0nQ5aQjjDAFvhv5VFLcjEjLm8hyaW3?=
 =?us-ascii?Q?RsEUlW8bDfgXmrUUDlCRISxxOx9Yn45s42Pa00QFrL4fG5HR2ompiShs7+ED?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b91496-c7e9-4084-6b98-08db1e9e0793
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:53:48.8980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayXiN0glokWQpeaFFxmVP3V3/455nRahdHziwHCyAJOxip2HOsTp5rmGsjwZ3HkreBF1fIpyesxT3J7TLJkNnCF6pHcZB9u5U6FvKhhiUHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7285
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 03:17:50PM -0800, Matt Roper wrote:
>On Mon, Mar 06, 2023 at 12:49:54PM -0800, Lucas De Marchi wrote:
>> dg1_ctx_workarounds_init() is DG1-only, while
>> gen12_ctx_workarounds_init() is shared with other platforms. Move the
>> workaround to the former so there is no additional platform check
>> needed.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index 389bfcd299af..f68fe64f63a6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -707,8 +707,6 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>>  static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>>  				       struct i915_wa_list *wal)
>>  {
>> -	struct drm_i915_private *i915 = engine->i915;
>> -
>>  	gen12_ctx_gt_tuning_init(engine, wal);
>>
>>  	/*
>> @@ -742,10 +740,6 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>>  	       FF_MODE2_GS_TIMER_MASK,
>>  	       FF_MODE2_GS_TIMER_224,
>>  	       0, false);
>> -
>> -	if (!IS_DG1(i915))
>
>I think you missed the "!" here.  I.e., this workaround applies to all
>the "gen12" platforms *except* DG1.

oops, thanks for catching that.  I'll drop this last patch.

Lucas De Marchi

>
>
>Matt
>
>> -		/* Wa_1806527549 */
>> -		wa_masked_en(wal, HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE);
>>  }
>>
>>  static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
>> @@ -760,6 +754,9 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
>>  	/* Wa_22010493298 */
>>  	wa_masked_en(wal, HIZ_CHICKEN,
>>  		     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
>> +
>> +	/* Wa_1806527549 */
>> +	wa_masked_en(wal, HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE);
>>  }
>>
>>  static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
