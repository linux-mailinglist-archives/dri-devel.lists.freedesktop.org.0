Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF55B286A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 23:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFD510E70C;
	Thu,  8 Sep 2022 21:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A6A10E6F2;
 Thu,  8 Sep 2022 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662672066; x=1694208066;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PrYwPMz+i6b5BFNsv6TeEFSJcRTsDrynENYwrmO5c5Y=;
 b=c0mCZJUiwDl62I9OmXg2jWwwi0YS8LPbnpDvgU2cSc1QXw6il+LGvLiP
 ed3zvocXd9fV4R9IBdL3cdS+T7aFpbSZo67B99VW5qUeXjdrPnysdp191
 FQknSdzQkZaK4+5A8AiKqhJKUuT3Efy2QHdBbrKeEETWtrOjgkDCZB5MJ
 tfRmiwx5I5RCryRvb5MUYrCogp9toI1Lx8tB3ZUsG00N/Nz6CvPxobPsQ
 6tMYv9IAFyeO2WKMuUUspajmd7nOMkw8scDkG4dwjLMP6ZUE0N38F+Bt1
 5VdxGe72eFQR76Qe9xSHUZ6OYWGiwporcxqgnv5Bx/gE69TXObJ8f0PqB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280354374"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="280354374"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 14:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740825331"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 14:21:04 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 14:21:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 14:21:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 14:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq8BLLX7ulTCr2nBbXqJ3qj76+VRR+fqafojSum1axvEbvh3FTg8PTooBexGorIPPXSZSn8Wkw82GfatW8AwbUIFX6CYYeI3Ta7p0C3Y6S+S/tK1gHnJqzHtS0DUTuDc480QURW2AY35OzxGS2uJQBXCzvtsxTmZhs2JzTjGzVg3bpIDHoducGjMAuVlcywbDgecNkTi8KjV+1Cw78+qo85elAe68jrSNOe9IYZ0d2jst0DOJle1/CT+DhzkHn4iTRvQy39BckyDQbSha4OvZExIal2YFZUKWcjVN3bIQR0kGOBZMrrxvfqOIbpcIU8mOV8M7iaTc6UoKGGamtGeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsbEaF8Tqw4TZgCHB3TyWmxIJu9790oapmvMlKv3TzA=;
 b=Cbni2QSTthuQW6atgaHyeErBT9fn2ub+jTBSfRuhy7I0GuOgypGN9nTGObHy4FRprRg5Ty5YwkyxXhVNNh06FBNtphtAu0Tgi+np5Tdr8E3bulmVIGXAMkF8SgTwz0ky4lolqQCJePl1SQDDOICVCjvnfzJh/wE0/ytqvrQy7WRoTgfXczUAyixGtrhGvmny8XWoQnsDWfLyK3rTulLSZ7MuDPF+kKczqlNlpY2wmBnMBwXQbqUiYGVWxTMNn36m5/uG3C/W9W03u6n2gChjUSAYykQ9NqBXcO2fZRBwrGzer+GMsEZ8TwOukBdhJXIk6Dns2+MkV+CHkw921Bn8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN6PR11MB4004.namprd11.prod.outlook.com (2603:10b6:405:7c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.16; Thu, 8 Sep 2022 21:20:51 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Thu, 8 Sep 2022
 21:20:51 +0000
Message-ID: <a70d854a-76fe-c9b3-f9f3-59609cece566@intel.com>
Date: Thu, 8 Sep 2022 14:20:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 13/14] drm/i915/mtl: Use primary GT's irq lock for
 media GT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-14-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220906234934.3655440-14-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c742737-9a37-429f-ed06-08da91e00171
X-MS-TrafficTypeDiagnostic: BN6PR11MB4004:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dl/QEj0Y1Zv03/yIutNxJkjfihgA/D8ur4XAwM1fykumLRAz+xnwK/5vaIosdo4W/E9dQ0SO6e9bz0eWI6t3AY7VU/tuUvq8fwwnmVUidjDEJPQhjPuFeX0aFxdvW7Jy2SRz/9nOCC1lMsTEt4U0e9rgB3DrtrBQazr/qxvDKHQhUV5joWaOg5x/Yp4oUHjkcyRmv4mPRYXQLy52v5r1d875YUN/m+xLY/6sB9aVgYm6/PjWnp7Ri02K4DtjyeiH5d2YAmuxXtNKoJC5R3Xf9cteqAdHG+/L6ZPusfCOzUkHMvEpCdfsUKcyvaTB4YW6RSEdF34ISpCH4iTiRpj1xNP6SLdTMl8Eh2KoLTsUnQCX9sGB1UADJ3jvpo2MT2xKGfH2CW0RYcyEKHp7IuvpFbQ5IKc8emzfJbz6RcxGxehAOUVXwVzRESGHm/4eAfuMBs/JpRShbKeaVULywRO1mlPZNc6xQuc9iXjJfOHCWC11YEbmxDMJ0BvYlnd1nC2VJLLHe3/GMESU+30S18TMhDYlow9BkU/cdUNmBUHGZoa9DuyNjzg/zPlOBt2EJge9HyIZ67MBNOXn5zcDSztj+MkC2QIhA2paBUApJRETWgssZxKXE39vPJjWRDF5i0BkPgpKOLgUGkMko3Z76fVNHRpTrphFR/3bq1OE2aqmxi6wX8hGWUacVwdVTwBPW0rXJVITFXklQWAKMwXM32tEaV73Aa0HyHCipBVehiGJmanOxLSMINgARVXieVL7Up+gdDYpbUHM6K1+n9qIped3SZQo4YPrWAHEJgtNHlI4Trg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(136003)(366004)(39860400002)(346002)(6506007)(26005)(6512007)(53546011)(86362001)(6666004)(478600001)(6486002)(41300700001)(82960400001)(186003)(2616005)(83380400001)(38100700002)(31686004)(4326008)(450100002)(8676002)(8936002)(5660300002)(30864003)(36756003)(31696002)(66946007)(316002)(66556008)(66476007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1xb3FLaWZ1bmE1RyswY1R1VWlqdkpRQWJxZjJhZ0xzTk9xTEZhYll3Y2tX?=
 =?utf-8?B?SlJuSG81Q0gzTjlxK1pJVjhqRWczdzN1b1FqMkZOVEVuTlcxZW1laVhRSCts?=
 =?utf-8?B?K3NrMjBacUkxVTg2emxITHM3cy9yQ1c4cFB4ZlBHSkVzeS9sTUttL1dLYXZS?=
 =?utf-8?B?RHM5Ty9ycjRDb3lTcitNSkVJM2Fvc2ludnBGcVU2QmNwVDFRdzBqLzMyZDFR?=
 =?utf-8?B?TFUwY093ajNEbkhJUGtKMHB2QWVQZDFpd1pFUCtaR2phSWxERVhYM1lpNlFL?=
 =?utf-8?B?OFBRRHkwTmN2OFJ1cjQyZWNBWFF5OUtPVGdQVUl0K0s4MUJGVU44TjZ1UE9T?=
 =?utf-8?B?T0dXZ3h6UDdlY3drSmdMUk9KSEVWbi9EZmZ0a0VQY0lTN0lJRjU4WkRtR2I1?=
 =?utf-8?B?TVNjaUZEcDljK3grSnM5OUxVWkpiSTk2WGswNWhpVGdIZHFaZ21TdW42TnhP?=
 =?utf-8?B?SXUvNlVyaVJMRGFzSnlmWC9DNW9uU2lReTRrR292cjR2YjU1SWRFaHVSSHd3?=
 =?utf-8?B?ZWdKRmQwc1RJdXJQVlo4RzZSSlJHTDVPenZ6MTFLQ21CQUp4NWF2VmhaYkQ1?=
 =?utf-8?B?eE85ZzJpb1dQVkVveHBRYU1uWjBGMWRIUG9TRnYwcUFzR1d5clhFb1ZBRlJ3?=
 =?utf-8?B?angvU3UrNXpzMml5WUs3cSs5a0trUFBiVmQ5QThnMTdXaGNjUitKak5Qd0JL?=
 =?utf-8?B?akFmRllPT1dIeDdkUW9HekpqUS93N3hSZkhrMlprU2x2NVRsUG1GOEgrZlpk?=
 =?utf-8?B?ZVdpSDFpZXN5Nnh4MjlqQzBXRGRRMXhvQjlVQUx1Rm1pS3RTS2Rwd1ZpNG9h?=
 =?utf-8?B?eVhENUM5NDdmdDg2di95cndTVnlEbUx4Y1NrWXp5VFB4V0cxM0tYTDZSS1NF?=
 =?utf-8?B?bnJoTEtLdHlTRUNFMzRzZU52YklnV3pWeTRBNHFCSGtUenl0eFBtbzVNdEpi?=
 =?utf-8?B?UDRiSGlObXcySy8yYlhFU2YrczNaMnd6R0szWXkvbnRQYk1PbjRsTytmbTRT?=
 =?utf-8?B?T2lEblRBOTM2UTRsQlZaNjJHUm13R3BQMGdUVFNpVW94aDVPQzFrNmVVSXRi?=
 =?utf-8?B?YVczcmJKMElLRWp3RExPNlloTE1pY3VVNG5mS2l1bWlwZjMyRUNxTk1Xb1lL?=
 =?utf-8?B?ZzhSNnNvemxRbGtsejE4Vmk2UkUrb2J5aEN3OGtzdmhuOGFZb0J1TnpNTGk2?=
 =?utf-8?B?b0t5cTJEZ2ZheVhoZXNvaTIrUkhRTjJkSXlESHh5YUhoaWVvSVFXY1JMWDUx?=
 =?utf-8?B?bEZEdGR4bk90c0RlQnN4b3RFd2ZkQm9sK3FkbDdxSm9kdG9EVExyenY0MlVX?=
 =?utf-8?B?Y000cXU0b29KZ3BmSFpHNk01ZWlMeVdMS0JRdHBIYkNPQjE1UGVJOU5BbXBr?=
 =?utf-8?B?SW9Hc01VdEpjNTRyWVVNZnlKQzFYZVRuZkZ2cmlBVXdTWW1CTEZSRGx0MWxk?=
 =?utf-8?B?eWZ6NEE3RjFBM1VQejlLYW1MYnpLODhZSWVGYm84bW9CZ01SSDQ0UnFqMVJu?=
 =?utf-8?B?bk0rQitZVi9ndGdWenBUN3Jiclp6VjJnakpKRHoxZ084OVZZYSs1eGNuVEIr?=
 =?utf-8?B?YzcwTm5WanNqcCtuM2c0YmFjcG1FOFFhWGh0akRxRXZyNUNQUjFxVVh5TTda?=
 =?utf-8?B?MmdmbWtsSEZJSmdCWGdiODI2WnE5K2t2YTlRM1B4Qk1VQUFydHZFb2xRWWkx?=
 =?utf-8?B?NnVjMXJvcUlad2NZWVpNam5VWkRSTXlidjZ3aEtBTjRQRit6VXkvbHlOcXA5?=
 =?utf-8?B?YmM5MHpKWEdKbWRpZXRqNTFVMEhLMVdkUDVPc0hMa2FSaHFEaUUwVXlzaU5S?=
 =?utf-8?B?bTRXRys5UG5lTlR5dXFKK290NjhEcHd4Nm4vOUJLMW5RNG9aQnZPck8vL2l1?=
 =?utf-8?B?blZoR0s3eTBrZTdZbThzc3FtdjZYUm9mRDlCYkFPNHhoUWhxVzVaRDgxWkdu?=
 =?utf-8?B?TERsVk43YkNLUjZxcEEwRllvVXRtSXpNcmF1ZW5XZUJrbFkrZGlSYmF1ZTNZ?=
 =?utf-8?B?bDZ1S2VsdWh0cUswbjhDNHFkRjlZQ0RlRE41WlE3NVkvZkQrcGJmMml6OGls?=
 =?utf-8?B?ZDVMVmd6VDM0Rlk1MktJWEJXMngxYW5ONXNHbk9FWHQ0L0t2Z3ExNmFzbVBv?=
 =?utf-8?B?UW1SakJaNjFtT3dscVJpai8zL0Y4Z0JRRzdCVGlrc1ZsLzVacUdHb1FoQVY1?=
 =?utf-8?Q?Ne8+re3guU5BaZzmno0tNaU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c742737-9a37-429f-ed06-08da91e00171
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 21:20:51.1322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeLQ8gAJiDvGNedP/Wrrh6Jj2/Jq+Qb6p5mhepH5J8BN9h94wD9ycSGO3F7K5MslJr80Z5bbmnfUNfyP9EHIEqajmSXC1FrDpbzAjdegLlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4004
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/6/2022 4:49 PM, Matt Roper wrote:
> When we hook up interrupts (in the next patch), interrupts for the media
> GT are still processed as part of the primary GT's interrupt flow.  As
> such, we should share the same IRQ lock with the primary GT.  Let's
> convert gt->irq_lock into a pointer and just point the media GT's
> instance at the same lock the primary GT is using.
>
> v2:
>   - Point media's gt->irq_lock at the primary GT lock properly.  (Daniele)
>   - Fix jump target for intel_root_gt_init_early errors.  (Daniele)
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  8 +++---
>   drivers/gpu/drm/i915/gt/intel_gt.c            | 15 +++++++++--
>   drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 16 ++++++------
>   drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |  8 +++---
>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |  2 +-
>   drivers/gpu/drm/i915/gt/intel_rps.c           | 26 +++++++++----------
>   drivers/gpu/drm/i915/gt/intel_sa_media.c      |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 24 ++++++++---------
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  4 +--
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  4 +--
>   drivers/gpu/drm/i915/i915_driver.c            |  5 +++-
>   drivers/gpu/drm/i915/i915_irq.c               |  4 +--
>   drivers/gpu/drm/i915/pxp/intel_pxp.c          |  4 +--
>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |  4 +--
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      | 14 +++++-----
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  4 +--
>   17 files changed, 80 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 41acc285e8bf..6e0122b3dca2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1688,9 +1688,9 @@ bool intel_engine_irq_enable(struct intel_engine_cs *engine)
>   		return false;
>   
>   	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> +	spin_lock(engine->gt->irq_lock);
>   	engine->irq_enable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> +	spin_unlock(engine->gt->irq_lock);
>   
>   	return true;
>   }
> @@ -1701,9 +1701,9 @@ void intel_engine_irq_disable(struct intel_engine_cs *engine)
>   		return;
>   
>   	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> +	spin_lock(engine->gt->irq_lock);
>   	engine->irq_disable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> +	spin_unlock(engine->gt->irq_lock);
>   }
>   
>   void intel_engines_reset_default_submission(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 9b9c0ea73b7f..b59fb03ed274 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -38,7 +38,7 @@
>   
>   void intel_gt_common_init_early(struct intel_gt *gt)
>   {
> -	spin_lock_init(&gt->irq_lock);
> +	spin_lock_init(gt->irq_lock);
>   
>   	INIT_LIST_HEAD(&gt->closed_vma);
>   	spin_lock_init(&gt->closed_lock);
> @@ -59,14 +59,19 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>   }
>   
>   /* Preliminary initialization of Tile 0 */
> -void intel_root_gt_init_early(struct drm_i915_private *i915)
> +int intel_root_gt_init_early(struct drm_i915_private *i915)
>   {
>   	struct intel_gt *gt = to_gt(i915);
>   
>   	gt->i915 = i915;
>   	gt->uncore = &i915->uncore;
> +	gt->irq_lock = drmm_kzalloc(&i915->drm, sizeof(*gt->irq_lock), GFP_KERNEL);
> +	if (!gt->irq_lock)
> +		return -ENOMEM;
>   
>   	intel_gt_common_init_early(gt);
> +
> +	return 0;
>   }
>   
>   static int intel_gt_probe_lmem(struct intel_gt *gt)
> @@ -783,12 +788,18 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
>   
>   	if (!gt_is_root(gt)) {
>   		struct intel_uncore *uncore;
> +		spinlock_t *irq_lock;
>   
>   		uncore = drmm_kzalloc(&gt->i915->drm, sizeof(*uncore), GFP_KERNEL);
>   		if (!uncore)
>   			return -ENOMEM;
>   
> +		irq_lock = drmm_kzalloc(&gt->i915->drm, sizeof(*irq_lock), GFP_KERNEL);
> +		if (!irq_lock)
> +			return -ENOMEM;
> +
>   		gt->uncore = uncore;
> +		gt->irq_lock = irq_lock;
>   
>   		intel_gt_common_init_early(gt);
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index c9a359f35d0f..2ee582e287c8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -45,7 +45,7 @@ static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
>   }
>   
>   void intel_gt_common_init_early(struct intel_gt *gt);
> -void intel_root_gt_init_early(struct drm_i915_private *i915);
> +int intel_root_gt_init_early(struct drm_i915_private *i915);
>   int intel_gt_assign_ggtt(struct intel_gt *gt);
>   int intel_gt_init_mmio(struct intel_gt *gt);
>   int __must_check intel_gt_init_hw(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 3a72d4fd0214..0dfd0c42d00d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -29,7 +29,7 @@ gen11_gt_engine_identity(struct intel_gt *gt,
>   	u32 timeout_ts;
>   	u32 ident;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	raw_reg_write(regs, GEN11_IIR_REG_SELECTOR(bank), BIT(bit));
>   
> @@ -120,7 +120,7 @@ gen11_gt_bank_handler(struct intel_gt *gt, const unsigned int bank)
>   	unsigned long intr_dw;
>   	unsigned int bit;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	intr_dw = raw_reg_read(regs, GEN11_GT_INTR_DW(bank));
>   
> @@ -138,14 +138,14 @@ void gen11_gt_irq_handler(struct intel_gt *gt, const u32 master_ctl)
>   {
>   	unsigned int bank;
>   
> -	spin_lock(&gt->irq_lock);
> +	spin_lock(gt->irq_lock);
>   
>   	for (bank = 0; bank < 2; bank++) {
>   		if (master_ctl & GEN11_GT_DW_IRQ(bank))
>   			gen11_gt_bank_handler(gt, bank);
>   	}
>   
> -	spin_unlock(&gt->irq_lock);
> +	spin_unlock(gt->irq_lock);
>   }
>   
>   bool gen11_gt_reset_one_iir(struct intel_gt *gt,
> @@ -154,7 +154,7 @@ bool gen11_gt_reset_one_iir(struct intel_gt *gt,
>   	void __iomem * const regs = gt->uncore->regs;
>   	u32 dw;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	dw = raw_reg_read(regs, GEN11_GT_INTR_DW(bank));
>   	if (dw & BIT(bit)) {
> @@ -310,9 +310,9 @@ static void gen7_parity_error_irq_handler(struct intel_gt *gt, u32 iir)
>   	if (!HAS_L3_DPF(gt->i915))
>   		return;
>   
> -	spin_lock(&gt->irq_lock);
> +	spin_lock(gt->irq_lock);
>   	gen5_gt_disable_irq(gt, GT_PARITY_ERROR(gt->i915));
> -	spin_unlock(&gt->irq_lock);
> +	spin_unlock(gt->irq_lock);
>   
>   	if (iir & GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1)
>   		gt->i915->l3_parity.which_slice |= 1 << 1;
> @@ -434,7 +434,7 @@ static void gen5_gt_update_irq(struct intel_gt *gt,
>   			       u32 interrupt_mask,
>   			       u32 enabled_irq_mask)
>   {
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	GEM_BUG_ON(enabled_irq_mask & ~interrupt_mask);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
> index 11060f5a4c89..52f2a28b2058 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
> @@ -37,7 +37,7 @@ static void gen6_gt_pm_update_irq(struct intel_gt *gt,
>   
>   	WARN_ON(enabled_irq_mask & ~interrupt_mask);
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	new_val = gt->pm_imr;
>   	new_val &= ~interrupt_mask;
> @@ -64,7 +64,7 @@ void gen6_gt_pm_reset_iir(struct intel_gt *gt, u32 reset_mask)
>   	struct intel_uncore *uncore = gt->uncore;
>   	i915_reg_t reg = GRAPHICS_VER(gt->i915) >= 8 ? GEN8_GT_IIR(2) : GEN6_PMIIR;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	intel_uncore_write(uncore, reg, reset_mask);
>   	intel_uncore_write(uncore, reg, reset_mask);
> @@ -92,7 +92,7 @@ static void write_pm_ier(struct intel_gt *gt)
>   
>   void gen6_gt_pm_enable_irq(struct intel_gt *gt, u32 enable_mask)
>   {
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	gt->pm_ier |= enable_mask;
>   	write_pm_ier(gt);
> @@ -101,7 +101,7 @@ void gen6_gt_pm_enable_irq(struct intel_gt *gt, u32 enable_mask)
>   
>   void gen6_gt_pm_disable_irq(struct intel_gt *gt, u32 disable_mask)
>   {
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	gt->pm_ier &= ~disable_mask;
>   	gen6_gt_pm_mask_irq(gt, disable_mask);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 726695936a79..184ee9b11a4d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -163,7 +163,7 @@ struct intel_gt {
>   	struct intel_rc6 rc6;
>   	struct intel_rps rps;
>   
> -	spinlock_t irq_lock;
> +	spinlock_t *irq_lock;
>   	u32 gt_imr;
>   	u32 pm_ier;
>   	u32 pm_imr;
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 6fadde4ee7bf..6b86250c31ab 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -194,9 +194,9 @@ static void rps_enable_interrupts(struct intel_rps *rps)
>   
>   	rps_reset_ei(rps);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_enable_irq(gt, rps->pm_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	intel_uncore_write(gt->uncore,
>   			   GEN6_PMINTRMSK, rps_pm_mask(rps, rps->last_freq));
> @@ -217,14 +217,14 @@ static void rps_reset_interrupts(struct intel_rps *rps)
>   {
>   	struct intel_gt *gt = rps_to_gt(rps);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	if (GRAPHICS_VER(gt->i915) >= 11)
>   		gen11_rps_reset_interrupts(rps);
>   	else
>   		gen6_rps_reset_interrupts(rps);
>   
>   	rps->pm_iir = 0;
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void rps_disable_interrupts(struct intel_rps *rps)
> @@ -234,9 +234,9 @@ static void rps_disable_interrupts(struct intel_rps *rps)
>   	intel_uncore_write(gt->uncore,
>   			   GEN6_PMINTRMSK, rps_pm_sanitize_mask(rps, ~0u));
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	intel_synchronize_irq(gt->i915);
>   
> @@ -1797,10 +1797,10 @@ static void rps_work(struct work_struct *work)
>   	int new_freq, adj, min, max;
>   	u32 pm_iir = 0;
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	pm_iir = fetch_and_zero(&rps->pm_iir) & rps->pm_events;
>   	client_boost = atomic_read(&rps->num_waiters);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	/* Make sure we didn't queue anything we're not going to process. */
>   	if (!pm_iir && !client_boost)
> @@ -1873,9 +1873,9 @@ static void rps_work(struct work_struct *work)
>   	mutex_unlock(&rps->lock);
>   
>   out:
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_unmask_irq(gt, rps->pm_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
> @@ -1883,7 +1883,7 @@ void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
>   	struct intel_gt *gt = rps_to_gt(rps);
>   	const u32 events = rps->pm_events & pm_iir;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	if (unlikely(!events))
>   		return;
> @@ -1903,7 +1903,7 @@ void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
>   
>   	events = pm_iir & rps->pm_events;
>   	if (events) {
> -		spin_lock(&gt->irq_lock);
> +		spin_lock(gt->irq_lock);
>   
>   		GT_TRACE(gt, "irq events:%x\n", events);
>   
> @@ -1911,7 +1911,7 @@ void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
>   		rps->pm_iir |= events;
>   
>   		schedule_work(&rps->work);
> -		spin_unlock(&gt->irq_lock);
> +		spin_unlock(gt->irq_lock);
>   	}
>   
>   	if (GRAPHICS_VER(gt->i915) >= 8)
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> index 8c5c519457cc..5516e9c363a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sa_media.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> @@ -21,6 +21,7 @@ int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
>   
>   	uncore->gsi_offset = gsi_offset;
>   
> +	gt->irq_lock = to_gt(i915)->irq_lock;
>   	intel_gt_common_init_early(gt);
>   	intel_uncore_init_early(uncore, gt);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 24451d000a6a..bac06e3d6f2c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -82,9 +82,9 @@ static void gen9_reset_guc_interrupts(struct intel_guc *guc)
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_reset_iir(gt, gt->pm_guc_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen9_enable_guc_interrupts(struct intel_guc *guc)
> @@ -93,11 +93,11 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
>   		     gt->pm_guc_events);
>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> @@ -106,11 +106,11 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   	intel_synchronize_irq(gt->i915);
>   
>   	gen9_reset_guc_interrupts(guc);
> @@ -120,9 +120,9 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen11_enable_guc_interrupts(struct intel_guc *guc)
> @@ -130,25 +130,25 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
>   	intel_uncore_write(gt->uncore,
>   			   GEN11_GUC_SG_INTR_ENABLE, events);
>   	intel_uncore_write(gt->uncore,
>   			   GEN11_GUC_SG_INTR_MASK, ~events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
>   	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   	intel_synchronize_irq(gt->i915);
>   
>   	gen11_reset_guc_interrupts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0d56b615bf78..58679a1049b7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1532,8 +1532,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   	__reset_guc_busyness_stats(guc);
>   
>   	/* Flush IRQ handler */
> -	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
> -	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
> +	spin_lock_irq(guc_to_gt(guc)->irq_lock);
> +	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
>   
>   	guc_flush_submissions(guc);
>   	guc_flush_destroyed_contexts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index f2e7c82985ef..ac59dffc35b5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -245,9 +245,9 @@ static int guc_enable_communication(struct intel_guc *guc)
>   	intel_guc_enable_interrupts(guc);
>   
>   	/* check for CT messages received before we enabled interrupts */
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	intel_guc_ct_event_handler(&guc->ct);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	drm_dbg(&i915->drm, "GuC communication enabled\n");
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index e5c3cf5045d4..1da52df07788 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -370,7 +370,9 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   
>   	intel_wopcm_init_early(&dev_priv->wopcm);
>   
> -	intel_root_gt_init_early(dev_priv);
> +	ret = intel_root_gt_init_early(dev_priv);
> +	if (ret < 0)
> +		goto err_rootgt;
>   
>   	i915_drm_clients_init(&dev_priv->clients, dev_priv);
>   
> @@ -395,6 +397,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   	i915_gem_cleanup_early(dev_priv);
>   	intel_gt_driver_late_release_all(dev_priv);
>   	i915_drm_clients_fini(&dev_priv->clients);
> +err_rootgt:
>   	intel_region_ttm_device_fini(dev_priv);
>   err_ttm:
>   	vlv_suspend_cleanup(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 515648cd1233..86a42d9e8041 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -1104,9 +1104,9 @@ static void ivb_parity_work(struct work_struct *work)
>   
>   out:
>   	drm_WARN_ON(&dev_priv->drm, dev_priv->l3_parity.which_slice);
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	mutex_unlock(&dev_priv->drm.struct_mutex);
>   }
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 17109c513259..69cdaaddc4a9 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -169,11 +169,11 @@ static void pxp_queue_termination(struct intel_pxp *pxp)
>   	 * We want to get the same effect as if we received a termination
>   	 * interrupt, so just pretend that we did.
>   	 */
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	intel_pxp_mark_termination_in_progress(pxp);
>   	pxp->session_events |= PXP_TERMINATION_REQUEST;
>   	queue_work(system_unbound_wq, &pxp->session_work);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static bool pxp_component_bound(struct intel_pxp *pxp)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> index e888b5124a07..4359e8be4101 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> @@ -47,9 +47,9 @@ static int pxp_terminate_set(void *data, u64 val)
>   		return -ENODEV;
>   
>   	/* simulate a termination interrupt */
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	intel_pxp_irq_handler(pxp, GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	if (!wait_for_completion_timeout(&pxp->termination,
>   					 msecs_to_jiffies(100)))
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> index 04745f914407..c28be430718a 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> @@ -25,7 +25,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>   	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
>   		return;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	if (unlikely(!iir))
>   		return;
> @@ -55,16 +55,16 @@ static inline void __pxp_set_interrupts(struct intel_gt *gt, u32 interrupts)
>   
>   static inline void pxp_irq_reset(struct intel_gt *gt)
>   {
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen11_gt_reset_one_iir(gt, 0, GEN11_KCR);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   {
>   	struct intel_gt *gt = pxp_to_gt(pxp);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	if (!pxp->irq_enabled)
>   		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_KCR));
> @@ -72,7 +72,7 @@ void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   	__pxp_set_interrupts(gt, GEN12_PXP_INTERRUPTS);
>   	pxp->irq_enabled = true;
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   void intel_pxp_irq_disable(struct intel_pxp *pxp)
> @@ -88,12 +88,12 @@ void intel_pxp_irq_disable(struct intel_pxp *pxp)
>   	 */
>   	GEM_WARN_ON(intel_pxp_is_active(pxp));
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	pxp->irq_enabled = false;
>   	__pxp_set_interrupts(gt, 0);
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   	intel_synchronize_irq(gt->i915);
>   
>   	pxp_irq_reset(gt);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 92b00b4de240..1bb5b5249157 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -144,9 +144,9 @@ void intel_pxp_session_work(struct work_struct *work)
>   	intel_wakeref_t wakeref;
>   	u32 events = 0;
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	events = fetch_and_zero(&pxp->session_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	if (!events)
>   		return;

