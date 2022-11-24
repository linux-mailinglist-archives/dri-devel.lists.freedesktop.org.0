Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAA636EB8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F04210E662;
	Thu, 24 Nov 2022 00:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68910E662;
 Thu, 24 Nov 2022 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669248514; x=1700784514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i0zHJLSza/NlF/XIMkdlgNvdGYRmSMg+8O5kDcPtzfU=;
 b=mlGCgyo7Saz3y4JADxzoh3PLOB751Yn7T4WaKBMRH494hu+eopRFljWR
 hVLcaS7Z+p7s00Uc0CpuYdNj8Te8tJnyMLLv8SPN+YtVWjGHlfzKNKLwl
 QQcrYUT3yQRitXqn0lTkN91M5DVv/gzJsj2o+DK9gAK+4BNJZ65zKc27T
 cB+efQex3MzdAzaVXXeA+VgLJvrONGCH27FWQ/W6n50J1XhchP8ixmC3s
 207ypy8wn4C6elc8mpc25RM0FR/p93fOY9u1zJZ3tyTEeA2rnXYGijfLq
 e0VPWWCaiS8ejlU+mafMFwu9gelmYGQNc2Zy5rt8EDkqdxL0FsNFwyQoX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="378441336"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="378441336"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 16:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="784429415"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="784429415"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 23 Nov 2022 16:08:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 16:08:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 23 Nov 2022 16:08:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 23 Nov 2022 16:08:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt7MyiXXU0+1eGoVkvkWuSTekt4AeQnuTSs9O9sER8lnTg5FG8RNVLGekI7nuNxxKzF4IHS0Af7VY9xcPbNswBvGRSRR63iz4cFAaM2edgbVi86L0o0RtztUoUMh2PfJkbzlm+gQvX6/Yv796QgmGr7XKKLej13gkhbKG7wLU+jM6/NlbYKZJZQi1ghYHLoytniVpzKNkYXr9ZJZzIfio/T1ijAB1dmPtY6tWm1Gq/Il5k/BzyXrdiaR9eOYo65JZv9QfK3dfYUqfvS+4jvD9OHiPwPWZIHkmHJRPyx2C3uNDuzwpvPprPz8EWPJCO/GECj+iVwU9pei7CJF8lH7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//oXELVOB/cfF5LpCA2FgTRfIIYewwJLHWvj4HPF+JM=;
 b=J7MMJflzVjiwkVjB5EWyHUl4X6VHtMvxcG0D/bqMnhZfxRIm7PLFDVnDImWq9F6o1U5RuXY0+6Zo3RsAIDtp2L/9MOKOgu88V/qMNHZEQExm4/4HN8u8KC2e7/LqCMDAgvzd2fAEvFp2FxffnOPtR2xsGMOZwBrJSyaCrc2ux5HKR9EJ8HzJp7jah7GDjpS53vrN4LRQRKy9ynqcbArMzBQeHaUXXCeS/Tz57DSxIBKsvtyP1wKpB53FfVII1fmoGAKv6CiNbmHsvjKY/aFdh2++9dIrj0oLOdFrVdeQWX/t113LUkQAcM1SsxxemFFiPZrfM8EDDAn6+iGw2hfQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 00:08:31 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475%7]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 00:08:31 +0000
Date: Wed, 23 Nov 2022 16:08:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Manage uncore->lock while
 waiting on MCR register
Message-ID: <Y361+1unX9JoyR7z@mdroper-desk1.amr.corp.intel.com>
References: <20221117173358.1980230-1-matthew.d.roper@intel.com>
 <10d158a9-33b6-f9b1-1661-04da961ed8cd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <10d158a9-33b6-f9b1-1661-04da961ed8cd@intel.com>
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 2631e0a5-9de6-4234-1309-08dacdb00464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxnXdskw6kt2zaka6vhI7lPnUYqdi7FMmBClkzzWjLRYgxSiFcKnj4IMa83U6Xaz+7qO0KSYImFF5/qhJQw7YpxGnGjggizUnVx7wtra+ZKc8kCIxA5Ngoqvqgo59uX1JOfPUPdrgipv6FHz5Rvm/hxPSzDlCth6K/fDe3d2xOqVUEuC1Iu1ayoPRy5U13YMxJV3QoKSjsSNfectMysSfZ+mW9T5jXHDDh0Q9zuLschUwCR/z7BnMpD3234pftFGn0S8bsBFp2F1ID1Tu7oF3NFcIC9bX0t2/eOwsd17urlaleFirYuplZfvLBoAjuSfsXBy438NSn23abb4Q1PaZyWWvc5rt7TJyGCxGLJNX7K3c5RHxrDodXkB4SFosNqrUQuDjaTOdIZUYkzdcxhraarJV1QrXLhqYV0xNiETezgErmEkuPnicQ4IsYYIqXO9EChMPHP9iHjYtcxSldp00UYf/KYrn1yJjWKwGYthB1Icf4DYNCAoBizCZfKx3lGljXjSX0shrhV1S3FLt1YdK0oztJoRojptqJizahl16jDKWTELIjMxxw3woLWnrzy2HEcO9goWoh6ZaqBz4NeH+9E2II1uOuCjHu8Rkphzjp9YUc5rKQaUm4gxWTcwsCQ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(478600001)(6666004)(6486002)(966005)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(450100002)(186003)(6862004)(8936002)(83380400001)(2906002)(5660300002)(6636002)(316002)(6512007)(26005)(53546011)(86362001)(6506007)(82960400001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SS6Ltw7HwdKQeuXhQF17oP2vyKzfiJArmUlfYTEFAnid4ep6TJfBnLrI6yoX?=
 =?us-ascii?Q?YWnlGRYEWsUykRcNrXq0ADz/0A+o6J67HHcp809Fke/Dldp17wXtzkvmONYX?=
 =?us-ascii?Q?HS9kOJ8SR35VtYLMYkmMlVoyrfgLLK1xHuohxy3X8nH9hJAdp2L6dnGmtL7/?=
 =?us-ascii?Q?tRqo/zu35xxcIZSv8cjWxgknh3AZi69KBkPAg5MhV2A29DHegHxHQjZvCwjm?=
 =?us-ascii?Q?VXydQeJoB15jrFWp2KEjPGdP2cwUErMDUsGU4Vs9+DZEJL9pKPX6eF6QRXbF?=
 =?us-ascii?Q?mw1g28ZQ5jRsXV+VYAo6OMJ1Day6FVlvsTbUa5vI+pmGZjx6vtzg4ayEFYFq?=
 =?us-ascii?Q?yDC7+y1Pea+U4dmMSONLNFeJZtxkvAfLn/LxjLGz/3kVJLjb9JY5J/K6Jv8u?=
 =?us-ascii?Q?oYnl06fwXhF+0DwJnJKPWud45AwFUEDcIdnLYJd4EiHP/kJSPoHrQiK6e7m7?=
 =?us-ascii?Q?7Nem8y80ew/DzTM2T+WCWwXRWm5lfgq9O818ZtnGXdlgAYrznF1Hg8C9QJl3?=
 =?us-ascii?Q?rCOyn0ktdvWrZ7nN1jtml2dUHNp0SdLGkIH0lrvbAxQzwI+BIAGSIUUrlpk/?=
 =?us-ascii?Q?vSJpIuexfQVog5Q7WpYooR8/YL1vrYekoD/9pUJ+2Bi149M+TN+KauQfS5HY?=
 =?us-ascii?Q?Ndkm4kzHkoLN+pMA77qUB1bnLLVQv492qtexb1i+egEg5kBdLJmtdrijloZZ?=
 =?us-ascii?Q?X/05F1QV4f8giF6BJpnei5khqcmfoAucTsg2DXEaH9ZhJjs1DxCgyHwrRF1s?=
 =?us-ascii?Q?dI0cpc98kTrmYsMxT1+Cf+UlB6VAaJE/4+avw7DsRU7AtQWwL0MNgnzJGzqh?=
 =?us-ascii?Q?k/y3UqAmjonBvvroxfdI4zTtQNA1q+94Odj4bgATA8f/tr2bjKxkg/qJVT6m?=
 =?us-ascii?Q?ZxR+w70/2R9v4UGaQst0/lKNvofB+kN90B2WzRvWLGmQoA2VsBHH3FgDoO/P?=
 =?us-ascii?Q?9IPiIFlNM7FuU32t8oQhF9BwaKMlMiyOI5QggST0efwyKdmbT5plIYm/InDl?=
 =?us-ascii?Q?0I8ypSueT7us9SShZtoJduq4fanoO+kO/Hjkzdnz3MsG6/fLnnyLYezHvzC4?=
 =?us-ascii?Q?odJcv6CJ+GoLmc0ktF9kTqxhZV/fiYviww7JRU5afQ6Qs0q+bCq5rF7yJM9M?=
 =?us-ascii?Q?WvundEQ8u7m6rPHm/hcW4nTCBhJ1JSXCWqZrJb5V79nQiOj4QIhCGXje6ytb?=
 =?us-ascii?Q?6DynshmxdsLv9PRx4ZzA3B/chak6nv07hqO+AFxMD/YBfbh+gUoNLZ2DLNBo?=
 =?us-ascii?Q?dX08bLfhpcLuJwd86WGymj/rZWqbif8c8Q/f7w5TGr8LevNPhm/KuDQvooOC?=
 =?us-ascii?Q?xhlDuOPIRC1VJH7Ios3dIkV9pWXETTKy0xgeHvqavWDba/R0km1cCWOOcd2G?=
 =?us-ascii?Q?BZK/EYy4sut9Wqv5AQlqZXXMnbTOKEm0GtFcI9ZY77mhoe/mF+8sM2sk4Xsy?=
 =?us-ascii?Q?I5coavuRnss3VuT1zBlPQdC+6lbusw5Ij9lUrgSWAsBMCPeoL80wUk1Grw1J?=
 =?us-ascii?Q?tNWiMg4OtAW49ENuTJymoKYRqPl9mGoCBh/pY0517+ThpcQ+sLXx7WUujmDQ?=
 =?us-ascii?Q?LwEa8UTH9TsO25Z6xBB030vn46218toYk0WvL6EhUQgvMsBRcSH6KlzrHq4I?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2631e0a5-9de6-4234-1309-08dacdb00464
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 00:08:31.0763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCdX3QLc7GfmkgbUhh/h/+EtJOi+Dtu0NxlpKlHhHqaEIr1wmaCvECqFUGbM35osWED/l9f8YKpmPbws1jgzG+HWAaT1tPuE1AMAjgV9FPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 02:46:18PM -0800, John Harrison wrote:
> On 11/17/2022 09:33, Matt Roper wrote:
> > ...
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > index 830edffe88cc..d9a8ff9e5e57 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > @@ -730,17 +730,19 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
> >    *
> >    * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
> >    */
> > -int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
> > -				 i915_mcr_reg_t reg,
> > -				 u32 mask,
> > -				 u32 value,
> > -				 unsigned int fast_timeout_us,
> > -				 unsigned int slow_timeout_ms)
> > +int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
> This change missed the comment above and so is causing errors from the
> documentation build:

Yeah, I already sent a fix for that here:

https://patchwork.freedesktop.org/patch/512602/?series=111220&rev=1


Matt

> 
> Error: make htmldocs had i915 warnings
> ./drivers/gpu/drm/i915/gt/intel_gt_mcr.c:739: warning: expecting prototype for intel_gt_mcr_wait_for_reg_fw(). Prototype was for intel_gt_mcr_wait_for_reg() instead
> ./drivers/gpu/drm/i915/gt/intel_gt_mcr.c:739: warning: expecting prototype for intel_gt_mcr_wait_for_reg_fw(). Prototype was for intel_gt_mcr_wait_for_reg() instead
> 
> John.
> 
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
