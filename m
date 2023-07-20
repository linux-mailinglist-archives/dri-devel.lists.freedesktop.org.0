Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327F675B926
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5110E1A7;
	Thu, 20 Jul 2023 21:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBCF10E1A7;
 Thu, 20 Jul 2023 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689886942; x=1721422942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qU6RliKvxPrzLekjpBLcA0WKgbNi1gN6xTnXB/HECbY=;
 b=QbCdg+9MNbDjG1PWpWyiRdeZRlOvol+EMVTEk+so7Ggg95Ry0IPOl9UX
 pH7Gob+NtCIBo/OvXOLn+6h0x5C3Bp62cSvMpBZ7a/ZcS+c4qlERgGFjT
 u4Rb8vs4LVSZ7kbf8Ago0kJQlo0YFgtOQdk+MpwYP2/bS4FivHNib8xQf
 LNKzeo3RtQ8dKmMBG35qM1vL5EcoQbtIXjaj4QEqrmnuxszg9+uIecnBw
 Byrsg3IcKiAfORL+IMdDc7bvhQmVQYybVwh+SLefxzVnm4+5EEvxGxAfO
 y48mu+IWUaTt+RDbVI1pUq1ZNxci1zORDkaGrRRRUVSmkZWJ0diajbmh7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365761295"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="365761295"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="674818864"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="674818864"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 20 Jul 2023 14:02:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 14:02:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 14:02:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 14:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7CYW0ufnMF4zrOuTFE/Gin3xKfnc//EImKgJ9okr/TDvpmPRUDvMP48ceZARmd6ufcCt2Pe1gslMd+c4Ut3cAMAuXtsDKhBe2HLct5+2hP0aWRDWWnHKm9ICdEEciKmdgzlj+QQRGrs9yqW7CnA07+3FfT2LOGdzal1gzpEtLs7uNBtAUmPDGWsNwh9XC01TNjAHyIqh1b3VAP/UjY8p4GSjXKL5xYjn4ZQcGva4enIWoozQEkx3uShYW1rbpTFKLIZZwWszpaTDcbDYS9zo5HfYn/h2tkys7SLC8kM7i4cjp50c+P7Uk7W4VVy07sJ8x4M+6feaaUxGmn3eLa+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJb6lrUHQdSQPqHVwb2yBxJsXIaAsDgoFiQG1kCvsE0=;
 b=KIpX+qupzx0gZrFZTcYGPSLNTmBuHeRYIKa0sHhwH4/BaVFJ8hJQrOnbofafLIWO0XA0oexrWoQXfapnSzuEVOk0b+a55VvPOFNqBL8ZlN9hDyaJwWbmNXlIKzddmGiU8qwMNUwLHKIAAjCf7uU+gFVZ+j5TQcVbq782HL411Z6wQIBhZ1kcQuJugdjFfoPdWThwJSzz21Bz0jZ6ovVW6IM3ffBwv8ze3xVhpmKjTiJF3S0guTS5J01G0FypQzfsqMUxbjMbgxvwUL6X8qSRZB2EjU0ICM1FHJceygJmUKEaFQL9WXRd3bAUJs5A7yMAfJfToe1iE4YXgEBXHe9aIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 21:02:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 21:02:14 +0000
Date: Thu, 20 Jul 2023 14:02:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 7/9] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe
 control
Message-ID: <20230720210210.GX138014@mdroper-desk1.amr.corp.intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
 <20230719110729.618733-8-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719110729.618733-8-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 7504bd54-bd25-4480-98a1-08db896497bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUbS6i0tvIrXsW53SrborAcwaWkMwcWVSz+LjtwjUBmMlP3zLOXLfiXMTuG2iszvzzseDM31dLJCjy+bm7j43cAbX1ua1Kj1PWyX5jrkQzQLhgUfShkR+qQgxhDHq2Qey9n64xuNtJYzy51NMikSYa9DDRM48z7SftHkbXJAXqd0Pstu9QixH4nn/6tcYEtxGlN25JGvsV0iAw3jAhrBRGF8nwqmgDaQRiA3qRViHgI4a/S9FxhYY9ZUuUJyCOni11K7kiSC3HHbMzbDSD3lSF1baBoTIjmhPpkxbhIVUAAeh8aAHcGgfWUao4GLWoW9vOwSatrBxSvS2eVDHupY/3vLofed/RFD3vaMKTbYZ2QEL1IvIGc7AEWb+QW3iJddtOS/2zFvFl6khJqRe4++aNb43e6DyfryhGBfd0x5y/WUuTaKyRyT2KROmDQu3gdX26X3n8KAWzX0Tbju5NrZSHwpGle5ZB8iBVOr/9ObSqQ8Mv2LZOOQeeIKeph4tJHEE07CgYv0SEMKGBQVt8Iy55bJOpzHmxbKxg1QFpxS2z64UqsLb9VyKQoqq70Aw35z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6486002)(6512007)(478600001)(6666004)(6506007)(83380400001)(26005)(1076003)(5660300002)(186003)(66946007)(66476007)(4326008)(6916009)(316002)(54906003)(66556008)(8676002)(8936002)(41300700001)(2906002)(86362001)(33656002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/2UenkOqok+9yaYGsVBV49q8YKrlui8pVG7HOO7+5TMaXMuEzSk8S4xYylf?=
 =?us-ascii?Q?qu5uAIOJ5s5vy6HZFx+Sm/IENYXEjivmrcY0OXh66P6FbRoAREXLxr01fZtL?=
 =?us-ascii?Q?33idf4EsajHQhm1rNzuYWj1L4oIvIxq4RjYnYUL46wueOckBt1N8Sk1c4LDT?=
 =?us-ascii?Q?JzhGT6q8yjH9Zj4su3VXX6yuZOuyTTpZmFH4RH/L28jrYpBApIvJxL+UghXL?=
 =?us-ascii?Q?J+2Pajnt6Io2GPaebc4RQoC/MQoF+sNSN5n3+iyWuQl9ovnvuEswkzjOpqa7?=
 =?us-ascii?Q?Q0wI5IqVWLEXFslFDbxFQX7JPAdJi/vmG+00bP6R/zT+ltAp+MthViAww6ie?=
 =?us-ascii?Q?fTmn8Fwx4C7DdnXB6ELJUXqPWNoBqjvowS/hjgTiSAVauuwYF7HOrvUBJlUI?=
 =?us-ascii?Q?Ql/mzWvuIFwlh+mQZAE4/DEShkYc/d9cPUX7UKof24Kifo9OjXixRo0tSQDF?=
 =?us-ascii?Q?dGkEZTFcb2AR6c3Zz8+pnNEeKmKx2aSAEojGrMpkyy8MwZSlWvaaFXk6JQed?=
 =?us-ascii?Q?iCl9drY+ivuxHTDk+/vzpun7v5NAcBxTTqVwxMpsp0/iaYj06VIbfoZUXWz7?=
 =?us-ascii?Q?zrk9BAA4wUEUVrWisR2L+L0ZJZVm1NWZpyS96oSEgmp1Jh88CsA/mdFAmvTa?=
 =?us-ascii?Q?Goabm7aTMZSxgAXw/mpJ72yZyEEeZ+RbG5M3qoNWmQZW4oYWkuDMwpALAoFZ?=
 =?us-ascii?Q?5r2CHGdbmxcjLM5l+ZXgyq1xgQps6sJxOU7HhJ62dA4O1JCVTJO7ewmK4rhk?=
 =?us-ascii?Q?7xTieHPXygsCCkM3FulDXzR4/Fo0tBHx0UwNlbl2JM3yDyKKXT4dwGP4AY7u?=
 =?us-ascii?Q?tMeTZovSF0k6kocezvcPh4V+FTOGgLLN7Crvzfq5+vmqWHvYHI9Fqnl/eqqg?=
 =?us-ascii?Q?+3KlMJd7NjfaLUk4Bnbf8KZ2+dYy1RijdGd1BriDYUFq1UyhuZ372VBudj74?=
 =?us-ascii?Q?7ECNmB+vSLTYi695Szv1sBodiS0bF2h1UhJqeU2MikwH0PRCVmicothtL8zY?=
 =?us-ascii?Q?W2AvkQhxFjTM0uMQXWg69MKtQ1axIQmgY9cEsSPb/3JMLVyDxP70Naqd1cW9?=
 =?us-ascii?Q?GdonJDi0IPqBHGHA93HSKK1WLUiCRl1pWYcl7e9KZE2gveGg+pBfrzl5JM8d?=
 =?us-ascii?Q?Xukzz9AxdcFDwPG/ok8mEJtdb4OVQfRM8TucqzXyzL6g2MQ6tRxYvUv7zRje?=
 =?us-ascii?Q?YtSQUb0jtzOEK5AW6jm5i50hxL7l1sAPT4oMADJrLhyUySBDjyoXFhSohvZ9?=
 =?us-ascii?Q?WeTJFIEDaFJ+Sfb3rwA45itQ7/JrhMEyFjZu4M2ERUGnAb96RBdN4gaz4bJn?=
 =?us-ascii?Q?6b3HJ/R56C+mhYHaZx1rvTodLC1M0Xfyu9YwvQNaccll2/dOWAnZTAMUgL6+?=
 =?us-ascii?Q?LMI/2x0TcngWqkzV3cW4ACrMWtCz3J72q5/K2GPXyuhhULAdQBa979X7dPv/?=
 =?us-ascii?Q?f1IupV52oj41FHMzsd7tLjLRRjKvWC1piA94at7pS86jenbsePkDtclF1q2h?=
 =?us-ascii?Q?MFJev8kuvPKgoFeo28FxdCopofYI2lXHDhhbLNYPsVOEyeobFU0268b2LOOw?=
 =?us-ascii?Q?6oSjlNcEXND3hrXuoNfk58qMwO1s0785iIggYsh4IVjF5KtXjyXBi3yHzQzd?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7504bd54-bd25-4480-98a1-08db896497bc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 21:02:14.2038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asM3z3el4lFalr87VBgvjW/SUMxTqug1MPeHu+SpkbMlj/zf7uBQ0hmhYO1eP+olXXMi9sgCTepRO34h0fgBceoVVrvsJZVdaFDWSe0DK88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 01:07:27PM +0200, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112). The VE and BCS engines need to add the flush
> part in their command streamer.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 31 ++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 3bedab8d61db1..78bbd55262a2d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -225,6 +225,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>  
> +		/*
> +		 * When required, in MTL+ platforms we need to

Nitpick:  let's avoid using "FOO+" as "FOO and beyond."  We already have
formal IP names that include + signs (Xe_LPM+, Xe_LPD+, etc.), so using
it this way can cause confusion.

> +		 * set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>  		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>  		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>  		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> @@ -309,6 +316,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  {
>  	intel_engine_mask_t aux_inv = 0;
> +	u32 cmd_flush = 0;
>  	u32 cmd = 4;
>  	u32 *cs;
>  
> @@ -339,6 +347,13 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>  			bit_group_1 |= PIPE_CONTROL_CS_STALL;
>  
> +			/*
> +			 * When required, in MTL+ platforms we need to
> +			 * set the CCS_FLUSH bit in the pipe control
> +			 */
> +			if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +				bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>  			intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
>  						   LRC_PPHWSP_SCRATCH_ADDR);
>  
> @@ -346,7 +361,18 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  
>  		case VIDEO_ENHANCEMENT_CLASS:
>  		case COMPUTE_CLASS:
> +			cmd += 2;
> +			cmd_flush = MI_FLUSH_DW;
> +
> +			break;
> +

It looks like some of these changes wound up in the wrong patch?
And as Nirmoy pointed out on the other patch, some of the functions and
engine instructions are mixed around here too.


Matt

>  		case COPY_ENGINE_CLASS:
> +			cmd += 2;
> +			/*
> +			 * When required, in MTL+ platforms we need to
> +			 * set the CCS_FLUSH bit in the pipe control
> +			 */
> +			cmd_flush = MI_FLUSH_DW | MI_FLUSH_DW_CCS;
>  			break;
>  		}
>  	}
> @@ -355,6 +381,11 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  	if (IS_ERR(cs))
>  		return PTR_ERR(cs);
>  
> +	if (cmd_flush) {
> +		*cs++ = cmd_flush;
> +		*cs++ = 0;
> +	}
> +
>  	if (mode & EMIT_INVALIDATE)
>  		*cs++ = preparser_disable(true);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>  #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>  #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>  #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>  #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>  #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
