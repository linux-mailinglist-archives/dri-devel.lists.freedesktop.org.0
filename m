Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67C62E7B8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F0110E694;
	Thu, 17 Nov 2022 22:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0510E694;
 Thu, 17 Nov 2022 22:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668722803; x=1700258803;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rozx5n+JQ+EXfFXIeET9PljOS65X2nt6g/p6lim8XY8=;
 b=bE0RunfEH+ThJcKva1LiWSls3BPpTJrB3n9mQ2Iu43wcVqQbMpUVIRpU
 0vbWcKzf4GfmeU9O2AU2zLRS9DpdOZ1USlLXenKzkSv7YZTPSasD8QDsT
 /ES8IAPMJ6jSIm+5HZ7CZEZddJ/xNilLII/iJgNaOQl5t07Sq3YXU6llb
 NuPysX/u2GKRwJwmde+RUu6mBrwkWtNdlqS3ywnsxz3xwxzaWORryxEuE
 /xgEYouO4qkJ/EQS4SMPoYitr0FnIe8xcjdcQFq+Cqp+pShsr4eU0qY/i
 a8g+4CCGrtBRq4M9jh6XJaMfJljyoUiwztVqx1H5WKQ3+MKwwTs5dpg+6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296350031"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296350031"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 14:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="782408390"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="782408390"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2022 14:06:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:06:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:06:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 14:06:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 14:06:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvQYYi9xryx6fk6LY1fnPzuum6c2dYXOKX+PpzU/7u8vEGsTcFMg7Drdmyz1cnQE4SG34hue5GjbZ8meL4KLy3cI29AWzKMmLM7NgqKAEmaevYklbGr4vEw+umNFVF0fn2CGjSLwk882cPpIdJc+QupD6qPS+945Iiiq5VnigyI51A00ROOX8OhvkmBIA8zAhaDyx8Z7gzjY69YK3VkcvaQo69KSShUCs+QYHoQS8wt2zQlpOzpfF7HMCZWg/BhLPbL8/ES0tGy/l8iq3XU0wspLLF5A258Xwn+Lb7g5yd/lUokCcI/Qr6mf5tcYQD461lQzNTW7CGrJvxKmGYcLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H664SDoTqe9eT8RejI+lp6ojOMo5TQ0DhKDsXkNAkQ8=;
 b=RdrH4ZhL7c5/aLWU3YqHJ2e7IgSebSGtRYBAOv3RfkDahYCPvEqcTMA/qVB2B5BdSXcq97XQ7e9Ak4o9OJc7c1eQSoM4A9DWKEQa/CSWS8oa8KAXOdPb7xuBI2KCdJ018Vm4UsrEndJzLUi+/aGuKRUjmlJdFx1foch8tH029/4w6KmwMNBipB2oiMyndK60YL57uWcJV54Iwukd1ncjgV7A7KhELJRjHXA/hhqL+RrylsHBSct/reTqX6/fAOwrPyvfBbp+hpGVNrEzt1nJbS1w6NHmVzr3TXbT43JEqe8X0m4MsDyAsFIs46mRFwfSIwrvMG5fUqo1pQ4EKiANZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 22:06:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 22:06:34 +0000
Date: Thu, 17 Nov 2022 17:06:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/5] i915: CAGF and RC6 changes for MTL
Message-ID: <Y3awZMrS2jMkgfbK@intel.com>
References: <20221114123348.3474216-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221114123348.3474216-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:a03:100::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e208555-8542-40ad-2478-08dac8e7fc4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uhJYOcbk+rY+hGdPeRyxwZilDmoo+jqh5W65K2S+0RsoqqJBRmTkIxi/XRY+1SfqhYyN8NWnQ965MEQX3AvZ95a5pIDi3t09I8Wy3QKSr8gLu2Ocd++LltIyZQt/eQr1Ui6k1DvcXT43w1vXqzmTS0iHXSMp+C40V21nKTQg8tBJYAsgcaK0THPmB13lqbwLWFH3l/II0sDH+fuzll92C4ozV37XUsZcYw0RzW1YCo2FGluTacHvMNHheJ+cJ98NoPhuZheTeda80eB1TDRsfp4fqEQccB6lC5ZX699TxruMAoSVeXALSert6soGbT8+3+LODO03NQo6AVLpT/rgzSFb2mZwzyuSuVDTopOPWAgzi4NBcx3cpL/fSA2GPCa2HqJv+Tgqn7/Fv5NKUbrgzoUctg5JTD9clMtOQm33E4hJJGJ9Ar7FfzbA9Uq272Py8i3EyEJs7Cys+2hL+3mqxJkwzdCqt+cO79tLDWewzw+2fucPSn5/mnvSYaRaeCWGOY2zeMgNUWOG+NvZdiIWShZWE0Rvw1Gs1fP8JslljgEuDn3+4++5zKqrQQyCcce4AJnIK/2aTUsl3eiXCpipeBRVQ57RL7byarL1dgL8kcbXq6N0Tgf+Bmcl8x8tw+6x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199015)(4326008)(8676002)(450100002)(66556008)(66946007)(44832011)(6862004)(5660300002)(8936002)(66476007)(36756003)(41300700001)(86362001)(26005)(6512007)(6506007)(6666004)(37006003)(83380400001)(186003)(2616005)(316002)(6486002)(478600001)(6636002)(38100700002)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qivib20Y04Q1DZf4KLcneX1TfEH7Lx9vEMIgRwhPvSP7hF/iDasKkwOJZAy+?=
 =?us-ascii?Q?oxF1bUhtytNsUFxSmr3n3IEBpCIVKH9ca300IIHWbtO/9vnMnWnvWL85+TWT?=
 =?us-ascii?Q?9cNV62+Jb5yYgYm/qrxI/mKnB/jRl18ckozEK52cVWVmgfQS4ZB5IaspEgIN?=
 =?us-ascii?Q?sgQDo6W09+8tKoIWk8mrSfKb7JXTal8Ceov5v9Jfj/Y+D1oJ+V0uJDMQormg?=
 =?us-ascii?Q?usblzIQcCOnSnlXaNJU7HXu+NyQIlj3fuPFkRo2cc61bBI8p/mwrsgd+6oaL?=
 =?us-ascii?Q?W4QaF49UHlDvya7z/K0ncm/uWUQOIDV0KZRxrSmi7IuW1K7B3JvDoRDgqoql?=
 =?us-ascii?Q?0QJvYk+yijZjgapDLTZoGbBhe8Qe+5OMFBUDSlhDgDcfXY5sp2xMXlv69/E0?=
 =?us-ascii?Q?SjAyT/Ph+kRLPg4/D1cbZmnTux00LrZQ6KbJRv5HcG3T0yo5hq+iZ830Ra8N?=
 =?us-ascii?Q?SaNo7yZJ+xOzeija7373rN8E51iFiyF4XAl0HHP7tK8aCCcwCq916QAotUyf?=
 =?us-ascii?Q?JbqxahHVJkj0uHkGN24SMiH9idk5RcZ2ONuCgXY10Dxb1fDbTTIyOctEBNyf?=
 =?us-ascii?Q?bso7vTBL+D04pj4VmgqXXX6hqpU7Iwcwcj7tmROihUgAaufxLfpHAqAA6GI/?=
 =?us-ascii?Q?jcAOus0m9PtSqyjlNmEpS/h+Oz8BTkgd6wtjrvumewrp9487c9djf27JRsXZ?=
 =?us-ascii?Q?vuKILLIGHiUjxx3M45O1/l312cQfqSeMhyZgwg1taDIj5HlqxJzCSQtG5g4C?=
 =?us-ascii?Q?FJ8jh91Co6ZgyGQaPlYH7/Ea3mk7bbLCIkbbbqq+YOB/Td5mcmg1zS91N3oC?=
 =?us-ascii?Q?2yhuUYejnLnbUc0TjipCmZ5ZhbvocZ7kXddPpi9vWfmYjdhNDMuPowdxBfLp?=
 =?us-ascii?Q?MUryMfCkMqvnSWsw9Bb69ucqtXODaVsE5h44IRLM1ZzXpG4S6zU1A4Zy04b2?=
 =?us-ascii?Q?OomUFDfWX824zJR0REltq4NEc8mBCl6AU6xKc3SY9rHZNVEB1r2ReiLDWZN7?=
 =?us-ascii?Q?/IP+2rsgURjwrTHSCYFCHXuABwWu1WbvWJgi9eafmBeJeF+NW2sCdtA3zs+j?=
 =?us-ascii?Q?uBXJUMA+PELiTjofz8A9Qk9fjJpa7w7e0BoKuYMFL3pnAIbVIth4KIf9PhQF?=
 =?us-ascii?Q?vQrwn0Inl7OZTuWBY0qc42bR+L9Nx+6JHEqRfM/ZKqJdjZkk/sVe3sJKbAAm?=
 =?us-ascii?Q?dZPEASlHicIXiFsCc3x2NgyDDS7Cvv0MjcmS9Ws3vsBbhwdCcoXj/0ikIapB?=
 =?us-ascii?Q?HomknM88C6h98zZnLUbEy4nKtmAu+USf826cIzJKslqJr/0j9gWyrc4JtNRd?=
 =?us-ascii?Q?lzzWPztB4ZXG9PJjecUgw5tuZNg9pxtZo1rvyy204TrzJ+KzULv9DSad3nhJ?=
 =?us-ascii?Q?kKlGN3B5+hNvCJ9SrkyG6GELGUuOO1lrLl+cVktVQCsFMOD4bAb4l9MQrP8t?=
 =?us-ascii?Q?2S6NfhGkVMoZj7D9Ln9pThyhvlgUasepIDmcHa8yVvZojB9Lupq1jvV1noTJ?=
 =?us-ascii?Q?0sMGf2cT2dis3rbBnPY9FKINP9Jj/npucoC7qjHMG1jYPGHEmvbpL6OOQGyO?=
 =?us-ascii?Q?p56iMikP1H4JyfJPfHsHHnhksYeYbAoi+ALNKVVJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e208555-8542-40ad-2478-08dac8e7fc4e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 22:06:34.1242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnVjX9pxjCLD11705aNRv6PXKDT5eNTE5YHQ7m6dJqMcWa/ACcCoSuJASjXJH9w65y3jW2zYmJc2nuu4k9q0HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

On Mon, Nov 14, 2022 at 06:03:43PM +0530, Badal Nilawar wrote:
> This series includes the code changes to get CAGF, RC State and C6
> Residency of MTL.
> 
> v3: Included "Use GEN12 RPSTAT register" patch
> 
> v4:
>   - Rebased
>   - Dropped "Use GEN12 RPSTAT register" patch from this series
>     going to send separate series for it
> 
> v5:
>   - Included "drm/i915/gt: Change RC6 residency functions to accept register
>     ID's" based on code review feedback
> 
> v6:
>   - Addressed Jani N's review comments on "drm/i915/gt: Change RC6 residency
>     functions to accept register ID's"
>   - Re-add "drm/i915: Use GEN12_RPSTAT register for GT freq" to this series
> 
> v7: Rebuild, identical to v6
> 
> v8:
>   - Add "drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf" to the series
>     (based on Rodrigo's review) to consistently use REG_FIELD_GET
>   - Minor changes to other patches, please see individual patches for changelogs
> 
> v9: Rebuild, identical to v8
> 
> v10: Address review comments from Rodrigo on Patch 5
> 
> v11: Change state name for MTL_CC0 to RC0 in Patch 5
> 
> v12: Rebased to latest upstream. Identical to v11.

Thanks for the patches and for addressing all the requests.

Just for the record:
With your authorization, while merging them, I have added your missed
Signed-off-by to the couple patches, as we had discussed offline.

> 
> Ashutosh Dixit (2):
>   drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
>   drm/i915/gt: Use RC6 residency types as arguments to residency
>     functions
> 
> Badal Nilawar (2):
>   drm/i915/mtl: Modify CAGF functions for MTL
>   drm/i915/mtl: C6 residency and C state type for MTL SAMedia
> 
> Don Hiatt (1):
>   drm/i915: Use GEN12_RPSTAT register for GT freq
> 
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 88 ++++++++++++++-----
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 22 +++--
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 +--
>  drivers/gpu/drm/i915/gt/intel_rc6.c           | 64 +++++++++-----
>  drivers/gpu/drm/i915/gt/intel_rc6.h           | 11 ++-
>  drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 15 +++-
>  drivers/gpu/drm/i915/gt/intel_rps.c           | 51 ++++++++---
>  drivers/gpu/drm/i915/gt/intel_rps.h           |  2 +
>  drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
>  drivers/gpu/drm/i915/i915_pmu.c               |  9 +-
>  10 files changed, 198 insertions(+), 82 deletions(-)
> 
> -- 
> 2.25.1
> 
