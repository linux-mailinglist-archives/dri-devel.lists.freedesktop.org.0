Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C4F77CD93
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 15:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EB510E250;
	Tue, 15 Aug 2023 13:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28310E250;
 Tue, 15 Aug 2023 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692107642; x=1723643642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4EGspwHS+P3azFUQHp8dWg9lNtNPdOlS5xC9kPV/7xE=;
 b=IUD2qdfNytEtMWOyGXgpVx+SNfoD7QvEbEVraznPa5W8ahD1yOfe3siN
 ZVNi6PdIrjYr0Xfa48fz4R84fP2R+GLrc8tptifeIA/iafX39dj/g5gtP
 cwHuBVzBYNDuFOW/GguChCCcbRyWQSDx5zX6b5rtrWGa7qV5m6QZCZphI
 R9RySMe0mhLeZgdIWF7bXK/8TN0kYfSZA9EoXXvM/ISdhKBFlnOgtXGZ8
 lLogoN6unmGjbtKm4yOXqdVKZxK6q8qlwABSo3ZZsvF+W6g6V4a6HCJ+0
 C/vIVL1XerY6TpLGAWnx2FbR9qmBpPiKmYqAahDeS2+EyNiCnluUMNato g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376007455"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="376007455"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799197327"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="799197327"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 15 Aug 2023 06:54:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 06:54:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 06:54:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 06:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijqHCtxEvkK2LEDfobfMMzG4DwPQDpRhPflclA/cyRhUs2lpbciwrsIP7Mvw8ATNWfcBdwd3t5Iug215yoaee+knc9Rof0pjZMo6YEvRKYauhPhqB+6BwiBtmePJHCnCVPg48a8uOpSZukMOpYEmBg06pBRDG56OR5P8e9uwCSfFdIrF7WZPVEbX++F1L/Os+fxjaz0r0CTeP9MVL2WkiZkk+a3u2CnYQFQpBRkAOpaJMgbeSAMednRpwyOAYvKe0HwN4mVMNyto5KH8iMjUSNeJyAKSSPdtk9US3CBdWRTXUkIF4CWUNRwkh+xHmlKJD0IQylWm5yOa+AhTEzQ2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4DxFxAFBzw4AV3pnsbD4pSZYLjm9nszcj6U9tBddoI=;
 b=LdmvV37vJUhNeLNUnq0ex6rXCxVNdYWg475/P6bz9QfSAS5dgfJiMyq3htqwdYkWwnIfsqMNL05VFgQT4h+w+1q/N5q2Mx9A9s9NaCD+0U14Gyphmul/L8Dy7H3evTCr6YE+IBMRD+fW6pm3HWouCUz+B4fa2uKLd1qRIYNLCJNCdecLRL6dTR+DrU+43svJGJE+1UgytX6v4etyLl8VYEJitvlKxo7g4gYsth7Ou9eI7nhriwoYHwSQnECBRfRkW/xnH7MUuJt9x6GhWWeKOEeZr8ZdseWXsmcshSiLnBmIGUeZ3XZb/TSglWosAqPYzRr3GIqgh7bocvC63TWGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 13:53:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6678.022; Tue, 15 Aug 2023
 13:53:57 +0000
Date: Tue, 15 Aug 2023 09:53:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v2 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Message-ID: <ZNuDb5ExA9DkW+Pa@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230815011210.1188379-2-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 315f7ac9-af90-4b9f-52ea-08db9d97121f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53t2loKbwBDHQ9f8ZBgXMTR8LWNecSsbGopWJLIpx00Rk5MDZ0rW5mskoOwalyoLCD6ZrCNb7JEXdsBuJuYxy3UaYeG/5P7vXqXmlWPR5Odt8X0moIKNqgbtM3nbvIOnbCfdeQtpVbXhZlDtEIDcKJ/ZvKyeZuJrNCE5XZjVeptAY4H0He0iPQpJfQW7IwWelm0Xs6iU6pXjlSvEo2pM+kSe1MRNBj66Vq1bf6B36MV4w/oWKEqft5fq3cD4bbkpmm1thuAe7jmZW+vtDGS7uFiNDFv6eMJPI6xRYsmV+vOmURMRiDp3zQqzzC/0AhIez+FTk8umQO/Yf/gpJB0mLbodcXNaaUtVdXciq9l0nmiCuGOtQAC+dMQM8jZZ2OCiNcRgjHdEewtqozWNdALEqOUzYrlp2+b+JJAsLHJ7r4qjlq+6EQm9cfJKNe6N0lQxMkHcAqfXGJHWi6wGqPmpKEjc4UtDMUGIgSn7h1DQUSvAvSihNE/4BOhOAM4XJ5XsRNTS2q3zjCI4/V0dZMb64T1xgcKxJ4WxjgZD1+tsBMtODxeDk2v0Ps4IlnTSjsXeFZEfLmDv4+WdBXvLM645mDvJERZx2fBUxpN6i54Ik2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199024)(1800799009)(186009)(450100002)(6862004)(2616005)(26005)(2906002)(15650500001)(44832011)(37006003)(54906003)(316002)(478600001)(83380400001)(82960400001)(5660300002)(8936002)(8676002)(4326008)(107886003)(6506007)(6666004)(6512007)(6486002)(66556008)(6636002)(66476007)(66946007)(41300700001)(36756003)(38100700002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKcaHpYqWx4pnsoaPafS4RKJ4oIag0aXgKlargwefqP78ibrICcuTHfaz3bi?=
 =?us-ascii?Q?JCjE0tF8BqrUSEhnUCXxqzbiCMVB7cjmgauYX3eqNw1tmoepfdLbx44jDEbm?=
 =?us-ascii?Q?nkub1Tupde8gC+7iHvjYffV1ltFHZ4k48eULEuX5XSshRgOuAtj06AIl4AIH?=
 =?us-ascii?Q?Qq8EutEGcNNVK79wT5BQT+IOyroLyvqC+2qJ4J9Fe98KbeYs5jq5QfEyYLre?=
 =?us-ascii?Q?fwa+0vN6G50TfZQgnT67Fz+WBBmqY+l7H1CkGGWcceiW+5lzpj4Sb8qHxPcs?=
 =?us-ascii?Q?HJjlkP5xG5NfbKxQq6UhEMQjt84ZOxQ6LP6Q5nHSuH12r+gzJYSWnNlUdAlz?=
 =?us-ascii?Q?77ps3gcYdSktmIAY/GSFsGpKEqh+Za1IZhuPjew+jko80MWHIi636t+gDHUW?=
 =?us-ascii?Q?+N3595Ql4DTDsMwr284aGljXsBdfNFldUIN+oC/pd9Dh/YBdPXQ0MPxhutAe?=
 =?us-ascii?Q?921/Rua1ix4/R+VQ/kLdctD4nmRXDKj6dtHaSNa9sldjkhYHtIkkBfIN73l0?=
 =?us-ascii?Q?i3ILY7BFdznaM6pA3yJ4YRtTy+rAUA1c4zdJU/g0mfliUfyF7cu5MKfu306u?=
 =?us-ascii?Q?IaETQaXuJoUM8GBpJPoe3x6StiEVfjf5tjx5DaXyn0SBETXT2r7NVx5V6V1w?=
 =?us-ascii?Q?5JFyTshqnGxCT8v9LAoJQ8ursBoqUx/7q02L6nWPlof5KzR/NKX8kFvdXPIx?=
 =?us-ascii?Q?deZUcOyS4bkKjgaQIfguP0ehGZn+QlHJhK1QMVwZA/hyn7DcjvLl59uWDyNS?=
 =?us-ascii?Q?dXIWe0YALMtkFWxkNxQP1x6GSFmLdK9QBNR3VcsYr+KQYQtVYaJ7GIqbJDih?=
 =?us-ascii?Q?XZs5eeA94J890aGluMnEvaK0ZVlZ1kacxFgOZARG3LRbCgxUXhGL/WIv9PjO?=
 =?us-ascii?Q?7dJTjQrU7di/3kSruAirBqqG0nqBDW7X6CfVI0aicKMnIjqXmxWHYUOZq4Dz?=
 =?us-ascii?Q?QdU+Qi2PySxlVFdN5vARNURvHmNWynHWdLqpd8MEPKakYL8q4uzmo7qj6t8/?=
 =?us-ascii?Q?SZaYy+gssy16fYohtpy3QqZmeScKiQYBfpcSXJzMbzwFDUuqOtws16epiY+d?=
 =?us-ascii?Q?cTUDEDn+fqGA08BZAX7+D3jH8+Ij+REKVFqSBKkPFR+2NPa80VeMwyxLqLyU?=
 =?us-ascii?Q?Uc+o+MYkbYSxmTquBG9fkiWmvAoj+81V+q0iDPsZ84tMisJOG6i9XUZlJDal?=
 =?us-ascii?Q?S6Ka0WvLf9EaSanJXguEvse1RQZ4IuQUkaEuntj95Y+vDJGpDIg3wTLyJOJ4?=
 =?us-ascii?Q?pVwBQ/7G6jl63si65Dn+Iqqd0e2dxVZgxr890o/yhI2CFKseutLfba3f+4G2?=
 =?us-ascii?Q?pFJ8UCq4ojqnPlEhKKaOMDbTI1JvgfnRNUg+PDoH/fDBAddIGj1c85sObdze?=
 =?us-ascii?Q?9VYfXE2bOLicCo9XQ4w1FkfmieGNxVoBAV/O49OjBHR1gGpdrRi5w1FwBC0U?=
 =?us-ascii?Q?FYA99z5kO6hpTmUBDRu/b2VCfEtwBqdzmIvVCR5eLJNoSOkFIlgwz2tqDDdf?=
 =?us-ascii?Q?nTR/hkrIJlGTSqZi+XiqIn722TGd0B32yV5JiWJc2nARxhrpjfR/yDrdMl6d?=
 =?us-ascii?Q?V+nhMI39Lb/r0mmefwsZRbJCkb8zflJ0uDQozToHpIOTw7g28jH3fMaSWC5+?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 315f7ac9-af90-4b9f-52ea-08db9d97121f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 13:53:57.7206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCkO2OYEEBHelQNjW66UCcK3szRyP5GzhYnJCQiFHP5U/fPesvGbmMX0NR+xT6wAk3OhyFGPOHXpktZj3rFZSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 06:12:08PM -0700, Alan Previn wrote:
> When suspending, flush the context-guc-id
> deregistration worker at the final stages of
> intel_gt_suspend_late when we finally call gt_sanitize
> that eventually leads down to __uc_sanitize so that
> the deregistration worker doesn't fire off later as
> we reset the GuC microcontroller.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h | 2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 2 ++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..050572bb8dbe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1578,6 +1578,11 @@ static void guc_flush_submissions(struct intel_guc *guc)
>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
>  }
>  
> +void intel_guc_submission_flush_work(struct intel_guc *guc)
> +{
> +	flush_work(&guc->submission_state.destroyed_worker);
> +}
> +
>  static void guc_flush_destroyed_contexts(struct intel_guc *guc);
>  
>  void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index c57b29cdb1a6..b6df75622d3b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -38,6 +38,8 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>  				   bool interruptible,
>  				   long timeout);
>  
> +void intel_guc_submission_flush_work(struct intel_guc *guc);
> +
>  static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>  {
>  	return guc->submission_supported;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 98b103375b7a..eb3554cb5ea4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -693,6 +693,8 @@ void intel_uc_suspend(struct intel_uc *uc)
>  		return;
>  	}
>  
> +	intel_guc_submission_flush_work(guc);
> +

what happens if a new job comes exactly here?
This still sounds a bit racy, although this already looks
much cleaner than the previous version.

>  	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>  		err = intel_guc_suspend(guc);
>  		if (err)
> -- 
> 2.39.0
> 
