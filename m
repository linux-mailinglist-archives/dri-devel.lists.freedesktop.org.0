Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7973629D54
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 16:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F255310E411;
	Tue, 15 Nov 2022 15:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E97A10E411;
 Tue, 15 Nov 2022 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668526049; x=1700062049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6qeofbYDU/XAxZOSOibpwxiUwdrXAqG0HRxNcBHaPFM=;
 b=ESGx2qwNZs2ikiir881cMPsjjk+3oz+PvnQANYLlRpZbtDIix1H0zJhL
 fanMI2YVjjfIQovUoko4u7U0o/HPaqH66X9Yy3Rm6AMdT6DbhpSiWUkpw
 CCaGOjP6aRF0hwlAu/gxXk3mfPCY525FaBLh0DUZAonBbc8d3ptdAsWD7
 XukKWEwfKf2f79KnbgvsSgxYB9mQ58/AerbN0uMHHC3JQhqBYQOx+E2TH
 TBrJLtZr9T8OOWezuGNFhDTbEdD9kojwuuF9FW4tY1tePRgHan/+CvYAf
 +H/xrz98mP1QvG1lX76APlqKcuARCwjkstSkB7SqQdh/5ToZYyXdhKJgb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="376545193"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="376545193"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638979942"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="638979942"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 15 Nov 2022 07:27:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 07:27:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 07:27:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 07:27:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6XIgtlNKgag1m82M9u8+2Voq9gKAAoraF9Xfvu3EDLzYM03E1yYm1CrrY65YG1jvEcmEtff8LjAC+olmJvNxSM/HNt9/g3Ar3+FUm8tf3rwhen6b8UXkue9tk8gvQAZ/m8aoiTheovthyq5Dh9IYh81ISv/FvGHhfrM7FjvSlQlnD1ApGmntNf+gMcpyu8aEezc4HdlF2+ixm8uvASZp19bgbW1mqkNXC76KFYxQPw0DKhA/7uo2Ait0BeLhTFT+xn7TtHq0W4ixGfNlvb67hRHhHlAqWMarMDs2NDDefLJ3taXo+nWz0acbqExZnHvAn4sMzAvkrj7ibcv3LssbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdXL/pBGtoLID1upehhRt7g9//qFKTUbAqxMwQ+ncMw=;
 b=Mq4OkRvjoSErsSG6wwzNaCew49EZnAphFnUvHX7k/VmciEw+8FzU521yejjdPLQQk2Jw3Dx5Y9nZKy5YbFQuxO47lG7Kh8Nyji+AtW3WtUeVBhWfUr+F/s1xczXswGcajMujJdPDp9dTVoAuVD6lIETUqwXh8IEy6tBDsCC8nH+ZiI3fcqu6f43vkHZOpFBW0iZiOMQxFSpDbAu2HGpgAEl5x/Duw3UXwaPQhXIOJ/nSB5BAcFHYNXSy2wHIe8H4K3c1gGG+cJV5Ss/J5wHs1nV3zAaec+1YDvQdNT9IDf97TcVDqY5rmj3TzBkFMOmyFQvgdQXllmoPYsM8vAAD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 15:27:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 15:27:26 +0000
Date: Tue, 15 Nov 2022 10:27:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: Enable Idle Messaging for
 GSC CS
Message-ID: <Y3Ov2jrHAqnIDGUs@intel.com>
References: <20221115134440.3669021-1-badal.nilawar@intel.com>
 <20221115134440.3669021-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221115134440.3669021-2-badal.nilawar@intel.com>
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ca3b55-e4db-49a7-6bbb-08dac71de659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3FAPs/ax3MTl/KVjn94x54ByVqUDdFNEHJ6olFJpEyeCEV9D1wJDcjw9zbtSjw9i0IGh/2hSqbbC9cITQoM4I1mqHxreiff8vB7pFM1n0TmlRD9zUlgSLPW+IfxAiunwDCdZrDxGUFo/DWB1VaNC2EVEjr6O9Q+RPomkwSDdOuDXi9YuVKYlIo2z27ABsk9JfSj87M3pvjYvNX7AG+ZDD+FttyadR6KOaIatG4PsevWQQzMOxwqc+s1bCPpET+VWjGSnz5DOf6IJKsbF573D4Rx+oKnKC4AWVijq9dpakccGtzPRBlODcQvgLO2DuVXGnSJg/SM0Jm7osXAOlIZAmaQBuJU0LRhpJz7n1r7yXLM92/15K6PTFpqNaF7fuyaXidi1BpkopI4atHxYk1UgW9LIg0Tw8CCQxpV4HJ4QSbI28diPJjleOPat1m6ptMzNg8KcYaJ7yXSdueAEkMTQGh18X2pOS+3MjPQnShQ2mtKdE/XToELzmQSKVlokEeMzgdQlEgTRxtFSiVVuoHVhMkyXT/dNKhGUnj0mH6XZyjg1KHQ4w5aQS34Ao+DFCInHZl8cVCDYiExJw2zkmlvmcpw40nRdc1beMBhDrsIvoT5rekfKZZTju528sSw538Cz3xB9JUhRCS+GIbuUCg7276M5wJbrWJqnpAYyPdAw/qII2fWhpcmPPcxV0LyVHNFe8y2DPt8FdF3yXrzw9E3Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199015)(6486002)(478600001)(36756003)(83380400001)(5660300002)(6862004)(41300700001)(4326008)(6636002)(66946007)(37006003)(6512007)(66476007)(8936002)(66556008)(450100002)(8676002)(316002)(82960400001)(38100700002)(6666004)(2906002)(44832011)(86362001)(2616005)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZq6r0mgZQRFaCWxr4gw+PJXatdaoFk6KKLRKcNVDPOeHimPSt6QrUfScUY1?=
 =?us-ascii?Q?5ljKnhsBVs5zxUlrWv3aF5G5zf1wsLOyux5A7h/zwckjYuM2DG1LuohuMci2?=
 =?us-ascii?Q?Cy3BmHyumSGbsR0sthdPo3rSo5V4wkINhksdG5amgWUENDhyBeDGH5Algg2R?=
 =?us-ascii?Q?ibq9LJRBxJ6DHYq66jd8iNyn78z5CyJAZgZo8E7RepINtXvP1a4p2fKA4Vx8?=
 =?us-ascii?Q?iWDFThPz6ld7z2LHrcAzt8jy1pInTqkaI9BAoDr5CzSVHj5OlLp5/907/Dbk?=
 =?us-ascii?Q?aMoKDq+GPl7d2JkNC3MCsxAJQBmPYbfoIC2kD/m052EXA5jlKVUz4Xz3ZC+i?=
 =?us-ascii?Q?My9bZbJ1CgVdCD6iTW2mYUtgpz94XtWR2/87VHlur5CssMzz1bHl5hxkDg/F?=
 =?us-ascii?Q?oqbVgzY3Qvq5rC0Psoznpvc7fwVAYb99fDxcPgeh7J4jzgvHjEHwR96bqdWV?=
 =?us-ascii?Q?ObEzFRGYT0Dazv9BFLjIZrwHfWOKlYiWm1E9zNYKi+EzxDwL1du5nXabt1hp?=
 =?us-ascii?Q?529mpJtREfwAUI1s/L3gaGqnTDDVvxDaeuqVQJZTKoH0HvnSn+gnyLJndKaA?=
 =?us-ascii?Q?jpqzhVsM/uHKJhsdI0pujfk/4phNdqgTKiLV94Ws12vfWpvIf+QmPXliGp/a?=
 =?us-ascii?Q?QQzAtBISus+sLHS3cEXvzAq7Cm5lY0e+MGjsBA+O29YSHv3IGF/I+Oh0We+S?=
 =?us-ascii?Q?qHyeOZIIIOrbqZ0lcaz0RuGm1Telg6LMh4FsMOlTokmiVM56KgmMI214pfn0?=
 =?us-ascii?Q?2wzdHu+CA4wfcWCtb+E1kChJsAdMynnJmEZXAYobGSJ9y04CaPIbkfkJTWNv?=
 =?us-ascii?Q?TIVKjQLW1U6daklwpr4Q7eoBaMDE72mDNf9Ycv7muDO932q6OAVtGUppIPct?=
 =?us-ascii?Q?+XaKGUB04fcE4TOirnpO3qu+xU7OodibUDAvnrbJxS8YDigfWr/92lzVVTun?=
 =?us-ascii?Q?qEoQx0azw68EZRIikNmgIM3M7/GHU23WOdQhj9yPcOt1W84w3e99gSOMIm22?=
 =?us-ascii?Q?5FuRDNuGBkANWB34j/fM5sa3utb7wx8eNan50H3ICGPdais4Maogsrkp92ZA?=
 =?us-ascii?Q?AYjPDoVKrvxlWTgQS4SZQOZ/3/9LXuLcruN72wWggtjkBFUyNhS3c1XL5cv7?=
 =?us-ascii?Q?jKRuRYHHuWF9d/BUkMTZKqzbxysiEe8j8WwrJxCyf+AnycJryCMG8iwnC2Yg?=
 =?us-ascii?Q?W8Kog5g82F1L5G3DT7DkvmXTr7WGV0BYQnFr8GWx8F8p43pAllw/aCcYcNUo?=
 =?us-ascii?Q?y7Vmu9E46ISplJtpLnpc+fcHdbZLbm9R3P6Yn/Or8r4fomsTNTEZsnM0nekv?=
 =?us-ascii?Q?ITjWGjIfH69vTJlLL/JwtO7Ne8WGduE0uL3huQONKpwIY+Qsu7X6rc+pbxXl?=
 =?us-ascii?Q?Swj087EMovFQ/CTfrb3JHdafhXfcuFVUHaotjks2SeHQtPJxDsLyww4chk3Q?=
 =?us-ascii?Q?VX2m6A/SBwyPO1oTiPXtVBRvDyHXDN/ZBZJnAWA3HuUSzzliL/KEb6uFvz4h?=
 =?us-ascii?Q?0scK0OZBoh9Jj03FWTryuLXO7y8XGE02zF4CoZFQdhcwUYkjVUagDh5iEIDz?=
 =?us-ascii?Q?/NmTQ5WaEYBGxc5HXonfPbk+PsOJfLE3qiOmxKSohbdZwAP95UJmAuG69z8g?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ca3b55-e4db-49a7-6bbb-08dac71de659
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 15:27:26.1913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hSHRKj8bPCKl3sU35bgO/h6vl8ntcd4O7CpQpVaPC/ZPnrWbuGTm5Ehf54SoJ3MrvIJxLneMg6LOGoDYN18jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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

On Tue, Nov 15, 2022 at 07:14:40PM +0530, Badal Nilawar wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> By defaut idle mesaging is disabled for GSC CS so to unblock RC6
> entry on media tile idle messaging need to be enabled.
> 
> v2:
>  - Fix review comments (Vinay)
>  - Set GSC idle hysterisis to 5 us (Badal)

btw, no need for the cover letter in single/standalone patches.
This history here is enough.

> 
> Bspec: 71496
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index b0a4a2dbe3ee..5522885b2db0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -15,6 +15,22 @@
>  #include "intel_rc6.h"
>  #include "intel_ring.h"
>  #include "shmem_utils.h"
> +#include "intel_gt_regs.h"
> +
> +static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
> +{
> +	struct drm_i915_private *i915 = engine->i915;
> +
> +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
> +		intel_uncore_write(engine->gt->uncore,
> +				   RC_PSMI_CTRL_GSCCS,
> +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
> +		/* 5 us hysterisis */

typo

> +		intel_uncore_write(engine->gt->uncore,
> +				   PWRCTX_MAXCNT_GSCCS,
> +				   0xA);

you said 5 above, but used 10 here, why?

> +	}
> +}
>  
>  static void dbg_poison_ce(struct intel_context *ce)
>  {
> @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
>  
>  	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
>  	intel_engine_init_heartbeat(engine);
> +
> +	intel_gsc_idle_msg_enable(engine);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 07031e03f80c..20472eb15364 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -913,6 +913,10 @@
>  #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
>  #define  MSG_IDLE_FW_SHIFT	9
>  
> +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
> +#define	  IDLE_MSG_DISABLE	BIT(0)

REG_BIT should be preferred.

> +#define PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
> +
>  #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
>  #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
>  
> -- 
> 2.25.1
> 
