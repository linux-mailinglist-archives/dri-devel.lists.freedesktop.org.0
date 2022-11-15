Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FE62A1B1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 20:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A7610E142;
	Tue, 15 Nov 2022 19:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9DC10E142;
 Tue, 15 Nov 2022 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668539661; x=1700075661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=msM2djREXGxVQpLsJW9eEmwKMt5IYNbWkH2IQWUyIjE=;
 b=KF8aH/zhZ34WR42NiDhRxHl/aeCHS29r+9JAoNUaNumjtQ/OGWbJA43j
 /8BctaJiYUNZzCHr84Og/3JiaGDWlohQY1o2A7AJB9qu3RGFz2upbtfUO
 rEjJVVME3gdxKWFnY+G2usm5WZ1176kyQYZDnqT6SZOj/37BMkG4vurbw
 rvvS/28ceU129b8RF6cA07fcE8cBqn+2gmgP2aI3x5HSYxh3BkpX4K8pn
 6KJdwGR0E/ekE/uh4eRjno9Qgy0/+2gwxDIe+UfB++s80onpQmZaZATWX
 1gSisW29nzmDZRMmHb7v5eW0H/XWYvGdah79SSuH2n2o2V7GWfd7vsYlp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="299870559"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="299870559"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 11:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="764029692"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="764029692"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 15 Nov 2022 11:14:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 11:14:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 11:14:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 11:14:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 11:14:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ+wCHt4FDUqSXjEdL57/snDvTV2jgEu4FDb8NjQLajsxt0gNuywyIy3+X6262P6+r89aqHXTvxNcuB1TvGwpNHd7+AahL65uGhWTXqGtsdDsos7TnV/A3H2lxuq+LDa/9jQq7+ZvFX/QzrlO0AUJPHfbXQa1YklydU9QzWvTjgVIedPXkhJnOmHkK1OWnhySH4qcFQ+VnA21C3mi+jZoHqgFXJBiWV2cIExuqF56lU5HtdTmi8VnmOgbwxOyAnkCe11YGenBya7OEDU308Bhokn9fPw58j6Nnm78O6NnG6jNqDqInolhRO3B+PXZGm4jl/3vOGB/oQU+S8jV2xDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUsRArzeCiQvS/A1qgCauzELsYZEff/YIkM1NkgIl9E=;
 b=YXFfqQe3VSztz8fD88FNlfeqqod1hw3eUlcpS2SuGd6s6CUpsjW/4Ay0W0top4q3q1pN4m3AKKRwmiera7cZ2zm+D6o2TyJkfNeCADNr+RmSa3ALJFJzhmXZKg+gcFzzGJfHX5BybDL3jgfKwKP0YFmchjn8D+5GwhKYMrtyQVxbzdeTMwTB1WECfglGCfUglTrXfawztz0KyJVX7j6H245JTk0L3ua5SnS8Ma6TKft4V2C/k8g0FFxu4IPV0qIoCQsS+Q3jRudkyFQPPePFYOk0gYY/FeJhMd9dvfOEo9fKZgRGeKgo1APY3z5yNvvWruIXXQUtN7fZgA7beU8sYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 19:14:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 19:14:17 +0000
Date: Tue, 15 Nov 2022 11:14:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/i915: Update workaround documentation
Message-ID: <20221115191415.v2wiobptbrolmchu@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221108003028.2350143-1-lucas.demarchi@intel.com>
 <Y3KtXo5YxlXuhPbC@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y3KtXo5YxlXuhPbC@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c97ed3b-be89-43b6-99bc-08dac73d9731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2x1AMOIb0shhNXUUNGbSDM/jEh7ydPdZ/FeCTvPG4E3hMN8GL6xD6pbQlfWn7x6XOB1CHjM0fKkpylwhV72YkDXMmutTQWNn163pCP2YC4pbLw2zWmWoVv9InNCRO4Jib5/vQXN6n9Z2cGOUsPGSsb8d7+pc9tFGfQpuJwK2hIP6pSmdN/mI2H4so9eaVlUKQq3aTxGWbf7O7dBbcyo/1/dT6t7376gbVbEUaaspXwDblI62POD8zSfsqs0zhppBl8GPhBELRaMz8wT7lhAw5i+pEEEoQDxOhQiG/tYIka5W9RF2dKrgaa8AUSMrkA7noSsy1cU5c+ToHFITnEzl4Pr89eNpHn767LCDyoAzO52YZJMBzPtrRpbYM0IKoSvSLWSQjXR9uiFNEFpq6Yc9ztn7yXjUk/sziN6QvmWCGdY/1i7616VO9ynzn1MHSwLGJ/+fC5p/n5UC0spegD+VWrYYvTcmKdj50ci81SxOXNQIdh9ntrRGTMXAZApU7LXhidgI4DmHSkushHeq6PRJToDGFsHbuyFCvNYFKSU9P452jxYx8+5BIC7NmSehqXawILaC3I9A5mwRVVQmEomtdkq5hpccVoIY9y71sfKQgCxtTcdkn2Npc5f4TNV31GFTbPu5UGok+lfM0EqB9GnijmgfoLyhelkPCq3ADzrpP+E4UdSWc0lytn0WWQXi95EoOMwh5zYWceiOsiufT9mq0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199015)(6506007)(26005)(9686003)(6512007)(316002)(6636002)(66556008)(450100002)(66476007)(66946007)(6486002)(478600001)(6862004)(8676002)(4326008)(1076003)(41300700001)(186003)(83380400001)(15650500001)(2906002)(8936002)(82960400001)(38100700002)(36756003)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ulOrAWCAskbmA8fSwF35Y5GkBUnEaYYVm2eJvrEFc+l9SHTeoMJA+2rWG+sR?=
 =?us-ascii?Q?+o37B8lVl/JZo+N3pOxDq8YJbAci/RM0wBx1fdMU821BTl6wJTYGNeH+pK0W?=
 =?us-ascii?Q?7SfyH/m6xSoJRYV51tdJkpLpzGQ71Bl2eQRAnZHnRi6B1GxRFkL6P6WByext?=
 =?us-ascii?Q?vhNoxatirOxCguPMD4twC9DHQ+V93XngpvpcH9r7jhVD/dtBw2d8wcXGDYyK?=
 =?us-ascii?Q?bh12o8qd+Wn3zdphO9e9eNIOXcQjOHGdmihorU85ZMybaOhcw+bSNZrsfSc3?=
 =?us-ascii?Q?QxD3R3LrmwIOjfXJlgsiKoG9bB3Su7gixH0ekPFyRQG02v/rB3Lhki6DaeJo?=
 =?us-ascii?Q?MwwBVoTspZM5vhWjoOws3nDS2war33OM62MlR3gLGsD1VRHI/FnW52vySZJQ?=
 =?us-ascii?Q?StEb+s+oQQATCKd7Ki/tosqGd+bHF6B9uVH7KhPcZIrORrONK4zMSLFjHAD8?=
 =?us-ascii?Q?uzfvExbT3a6z+XAg8F+AHeJa1Mx6/aGzzSa9QGSXaTE7SI2QQcWY5k2QUFjF?=
 =?us-ascii?Q?jGx2iSuX5uooXR0yzR4ZVGULNyLxbxjf54oCu3E9C+NXUMnMJsTrZ4RIYzta?=
 =?us-ascii?Q?dc8yXnYARrUe5ZndvejcMo6NYV8fUY7Oiar8TRrj0NORfDH4g4xmrmbTg7Sa?=
 =?us-ascii?Q?qEEmAkV0tYcp9aLj1FxKeAQOFsn7n+SgFminpXOM4M03fjD19N08FxXA2APc?=
 =?us-ascii?Q?gSqf7GEgZkFY21oQ9eQGzql2SHZtLoK9HwXIumGPrbz1hgn0UYkv8xG0Xvfj?=
 =?us-ascii?Q?URwYcx3zywnuvi3RLcNxdEAsmbo6bGVc5iqlkVXu44Gfw4g7HWnca3feUE0l?=
 =?us-ascii?Q?EW2SDW3wcSANTjLJGyLvKbtuixeZn0W+oZ6i3N613gom360FR9CiMFgMPORH?=
 =?us-ascii?Q?3YpNfOrg5UccoEhEvbTL3ZgqPsd9++lhJgHX9sSDKgeWv1QrzHLrPT4c+FGO?=
 =?us-ascii?Q?L8/BD2Qpq5np1ALL3mXL/ZQiBPFHNRc4+XZjg+7mMLh9yaPAcGUzpk/08hkc?=
 =?us-ascii?Q?RiUoDG6hIjaANC1ADZJtAdWSTiFFmzpwiQGg9WY0pe3lXJT4kyGOeMDyayDP?=
 =?us-ascii?Q?WVaABG+jV59AoYtjv6pq7OyxcnJMwSbrB08zHRWiRGTgu7VYIpntiaFTL9zf?=
 =?us-ascii?Q?yc7qQWgDTPXZ4n4KDfP4REqdDeUs0F+qsBCvLmTcx7qqn8lw+/9I2OiWcaCp?=
 =?us-ascii?Q?Ws9C3X63EnPNw7d10bkA++c4qvWFo5Cr4+SR0mFU4mFJEPG9wX6/A4x4J6Jx?=
 =?us-ascii?Q?5ukBbyKd4M9wW0BFB2RkB98nlkY3KZknRiDxEzJ8Kkz7zZYDXETVPZxVr8yw?=
 =?us-ascii?Q?KfFLmF+08xSPzCg0xwh/aOO8AWKAnTnDdGhzrv24LoCckSlds32ioG4kA8YP?=
 =?us-ascii?Q?Jyacr0fFL1+DC93pKiyotkeIVNSGSKSqx6qNx2ZgHWJS1HKwpvoKQaqNAkti?=
 =?us-ascii?Q?XyQQSPZ0LTSY6IjpkZSEEipFncyESy/pcS5+3o5QcZvb6p477bZfP4vCKbqE?=
 =?us-ascii?Q?hC3YbRCvsMLI5M+qb0M4yVLo3kuH/mey/nlXaZQTklxFkqez8DrptywXKKnx?=
 =?us-ascii?Q?OEav1DfdEe9Av1QjVY3dkQt+c1EV3LYr6fWJVNwfimWfyctVa0LDsHAgWZYY?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c97ed3b-be89-43b6-99bc-08dac73d9731
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 19:14:17.2232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH47uSN9wvOqmoQjyyzcxuJQFPMa72LSiOApxadVbKUty3eC9TAtZ2N8h3GIoNnlG6sVFjUjz7085RB/T7ij/l2RkoYPme/lQ8iNtmE7Khk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
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

On Mon, Nov 14, 2022 at 01:04:30PM -0800, Matt Roper wrote:
>On Mon, Nov 07, 2022 at 04:30:28PM -0800, Lucas De Marchi wrote:
>> There were several updates in the driver on how the workarounds are
>> handled since its documentation was written. Update the documentation to
>> reflect the current reality.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 87 +++++++++++++--------
>>  1 file changed, 56 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index 3cdf5c24dbc5..0db3713c1beb 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -17,43 +17,68 @@
>>  /**
>>   * DOC: Hardware workarounds
>>   *
>> - * This file is intended as a central place to implement most [1]_ of the
>> - * required workarounds for hardware to work as originally intended. They fall
>> - * in five basic categories depending on how/when they are applied:
>> + * This is intended as a central place to implement most [1]_ of the
>
>Your footnotes don't hook up properly anymore.  The original code had
>[1] and [2], but the new code hooks [1] to what used to be [2].

rewording this for next version

>
>Since we moved this file under gt/ a while back, I wonder if we should
>note somehow that sgunit/soc workarounds and display workarounds aren't
>expected to be part of this file?

I'm trying to make this agnostic to "this file" since it doesn't look
correct when reading the html documentation. Next version I'm rewording
some of this to just reference "central place".

>
>> + * required workarounds for hardware to work as originally intended. Hardware
>> + * workarounds are register programming documented to be executed in the driver
>> + * that fall outside of the normal programming sequences for a platform. There
>> + * are some basic categories of workarounds, depending on how/when they are
>> + * applied:
>>   *
>> - * - Workarounds that touch registers that are saved/restored to/from the HW
>> - *   context image. The list is emitted (via Load Register Immediate commands)
>> - *   everytime a new context is created.
>> - * - GT workarounds. The list of these WAs is applied whenever these registers
>> - *   revert to default values (on GPU reset, suspend/resume [2]_, etc..).
>> - * - Display workarounds. The list is applied during display clock-gating
>> - *   initialization.
>> - * - Workarounds that whitelist a privileged register, so that UMDs can manage
>> - *   them directly. This is just a special case of a MMMIO workaround (as we
>> - *   write the list of these to/be-whitelisted registers to some special HW
>> - *   registers).
>> - * - Workaround batchbuffers, that get executed automatically by the hardware
>> - *   on every HW context restore.
>> + * - Context workarounds: workarounds that touch registers that are
>> + *   saved/restored to/from the HW context image. The list is emitted (via Load
>> + *   Register Immediate commands) once when initializing the device and saved in
>> + *   the default context. That default context is then used on every context
>> + *   creation to have a "primed golden context", i.e. a context image that
>> + *   already contains the changes needed to all the registers.
>>   *
>> - * .. [1] Please notice that there are other WAs that, due to their nature,
>> - *    cannot be applied from a central place. Those are peppered around the rest
>> - *    of the code, as needed.
>> + * - Engine workarounds: the list of these WAs is applied whenever the specific
>> + *   engine is reset. It's also possible that a set of engine classes share a
>> + *   common power domain and they are reset together. This happens on some
>> + *   platforms with render and compute engines. In this case (at least) one of
>> + *   them need to keeep the workaround programming: the approach taken in the
>> + *   driver is to tie those workarounds to the first compute/render engine that
>> + *   is registered.  When executing with GuC submission, engine resets are
>> + *   outside of kernel driver control, hence the list of registers involved in
>> + *   written once, on engine initialization, and then passed to GuC, that
>> + *   saves/restores their values before/after the reset takes place. See
>> + *   ``drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c`` for reference.
>>   *
>> - * .. [2] Technically, some registers are powercontext saved & restored, so they
>> - *    survive a suspend/resume. In practice, writing them again is not too
>> - *    costly and simplifies things. We can revisit this in the future.
>> + * - GT workarounds: the list of these WAs is applied whenever these registers
>> + *   revert to their default values: on GPU reset, suspend/resume, etc.
>
>This is where the new [1] used to be referenced from.
>
>>   *
>> - * Layout
>> - * ~~~~~~
>> + * - Register whitelist: some workarounds need to be implemented in userspace,
>> + *   but need to touch privileged registers. The whitelist in the kernel
>> + *   instructs the hardware to allow the access to happen. From the kernel side,
>> + *   this is just a special case of a MMIO workaround (as we write the list of
>> + *   these to/be-whitelisted registers to some special HW registers).
>>   *
>> - * Keep things in this file ordered by WA type, as per the above (context, GT,
>> - * display, register whitelist, batchbuffer). Then, inside each type, keep the
>> - * following order:
>> + * - Workaround batchbuffers: buffers that get executed automatically by the
>> + *   hardware on every HW context restore. These buffers are created and
>> + *   programmed in the default context so the hardware always go through those
>> + *   programming sequences when switching contexts. The support for workaround
>> + *   batchbuffers is enabled these hardware mechanisms:
>>   *
>> - * - Infrastructure functions and macros
>> - * - WAs per platform in standard gen/chrono order
>> - * - Public functions to init or apply the given workaround type.
>> - */
>> + *   #. INDIRECT_CTX: A batchbuffer and an offset are provided in the default
>> + *      context, pointing the hardware to jump to that location when that offset
>> + *      is reached in the context restore. Workaround batchbuffer in the driver
>> + *      currently uses this mechanism for all platforms.
>> + *
>> + *   #. BB_PER_CTX_PTR: A batchbuffer is provided in the default context,
>> + *      pointing the hardware to a buffer to continue executing after the
>> + *      engine registers are restored in a context restore sequence. This is
>> + *      currently not used in the driver.
>> + *
>> + * - Display workarounds. The list is applied during display clock-gating
>> + *   initialization. However most of the display workarounds may be considered
>> + *   to fall under the "Others" category below.
>
>We don't have any such list today.  And if we do add one, I'm not sure
>it would happen here in gt/.  Maybe we should just add this as an extra
>"or" in the "Other" description below for now?

yeah, sounds good. I'm moving display workarounds under "Other" in the
next version.


thanks
Lucas De Marchi
