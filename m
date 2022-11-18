Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0562F762
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A5810E757;
	Fri, 18 Nov 2022 14:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2DC10E704;
 Fri, 18 Nov 2022 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668781966; x=1700317966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dYDvXRjnFVqCS8Np6Vtq6KMmdgWR/W3Wy3CoOtDuQ9o=;
 b=eewYQn2jKDYEkVYqW2x2pjgikhv8x2gA8v7lcIOUfabXMwvWIl61acxB
 lpRmK/T7Rpp6Ux7qqP/KOMS6mz3rzHnUJqArn0f0/0Gsyv8CcEmPGsgiC
 7b83pTiKp687J34F7CicL3Apv2dg7bUK1/x2DIa5advY1/YBqt722kFSz
 Mrn9hOUk1thsY6/N19DFErKP/1ZAdiiLo/9/+prkv8ppgSkmqGuV4Kimb
 0JNjWNIzHDP+9LF4Fr5LVqYfJ7MNwmAhRizAMlsoUYOU1gd7uzvGY5D9l
 GqPGdwKMO6UTW3+UzOfEwY6nubc62SwXE+YccVJ96v7XMbzJMlo3ohK7e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="311848205"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="311848205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 06:32:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="671331350"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="671331350"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 18 Nov 2022 06:32:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 06:32:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 06:32:45 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 06:32:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1pAK35lkoFSPYla9Vb2ORp6cPXceT40mYRNBlLN33OVnEboK4SuS/XUwPg1qrSjj5YOB+qfscBVED6HmYCQ7Is0ofYMGxCbMO208sYXy2/udnASmu5bFmoFU24946+FgajyYzq7XPfS3G+zFhxkbfKS5PauI8g1Ve/YszfQSRhteEljjDITEampNWB4X6kx8ZFPGWi6IhKihLfXd8ZZ3uJJ3FzW+gF3Q+nkBxisUyZMUp7F1344lWHHjK2fedUAJk5HeyU9F/rXjKSoNl2nIUQ2JgdehWKuEkPvhYiQZ+iIHIv46l4tn2kZxHgnUxtH5HCKXLKKHNHwPBUbCYAdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxMLsbViQxIbHgAWk8NCnGrtdRubwN1OnAf4PP9nZx0=;
 b=lthaVpHn2KUZEFVRHXtdlreOglaMDo2yVn85xLivsrLGusKkdsrNtg1Q7ugMJhRAJnzy3WoNO2uxb9Yi5qAUGkQYQVLBaYUHmoPOQnGQ5JIXAjJxCV/32EwskD0qy93EufttZckUzblCj9ixuyuuGp7RW80ThkT8KZs0t0Kl8X7WUOfqsV2y4g3evX9GRdcSgnNl7hJu4q3AwUFmOS4VhucC/vhrXpKOctx5E4JKzCZ4f/2L1V545kAfzFkUCw8Kl0LxvcKjrFLBtnNeBfGsRU5FXLdb3Pu/h1wb4lPRlYMh5lrbeMV1NAU7pjLAqo+EfvAVJoVXSIicsv8kZpuh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 14:32:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 14:32:42 +0000
Date: Fri, 18 Nov 2022 09:32:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: Enable Idle Messaging for
 GSC CS
Message-ID: <Y3eXheyJqbAuK2Iy@intel.com>
References: <20221115134440.3669021-1-badal.nilawar@intel.com>
 <20221115134440.3669021-2-badal.nilawar@intel.com>
 <Y3ayWbqIZGIX8b5R@intel.com>
 <b20afaa3-9ea2-28f5-b83d-bed0a0fcd394@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b20afaa3-9ea2-28f5-b83d-bed0a0fcd394@intel.com>
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a861ee-d721-46c4-48ad-08dac971c053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HDJ+k7VoRCLd6j5V1uQnW/PxHCRj4YXHA3Zr4sItE0S6RRVZd+L85+ydvEzbAydF7X1tc6+CNxuN6iHqLtREWcJgigeVUFLKAvhfE3txiVfE+7TVScJQxQedEUTR/RGLv2WvXN2qCqAL6X+A5qG2V20LDB3YvzhqSIj/Y+31bqUdY8eU0EnFmKQ5sPG+wS++FqqkXiFt1OXdfZY9U6IX7sXOzukIiLfPR+33ljXoTgqrbLTYVxYWl2CPj6+Pxkaijxc/JjXjj+1mix7OqJTwUG849QdC63hAPMRc16sbftwTwcNuecOZHGU/I3BZ0nn8lhJcmcDF25Dp0s1yhz5MhGzStlviQ59vKbAX1rt9y66xhkwLI7BavEnT17XKN9TmLyz0gIOpPv6doLdedNUGv0D5STD2Gepi8JgtrFFiQe0wrRg7uPQN5ZglSBwtfOE19KK8I5S5u/gLX5SfOCONz245xCAEdzQwVwHJ5ybvZzXFnRoYbyCyK5WMeJUF58jX1fWX6SRatzJ0xx2c8HaJ1C0uwFZg7LlDjYYxkgvkX2wsCZl4VNsPMv7QneYc8yBfISWi80Zvzpf/MnMLCxTsyxUkbeRQGvSuEYUPJkIh2Z15ENtcfGV3OtLtbWBBZpe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199015)(4326008)(6512007)(450100002)(82960400001)(2906002)(8676002)(66556008)(66946007)(186003)(66476007)(316002)(6506007)(6862004)(41300700001)(2616005)(44832011)(8936002)(53546011)(86362001)(36756003)(26005)(5660300002)(38100700002)(83380400001)(6666004)(478600001)(6486002)(6636002)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bDt5c/xDD+wzT9izAqp5npgY/h3VVcL9pQ2vNM4tC71AaxD8xn3PHY8OdKPN?=
 =?us-ascii?Q?hgDexqYnkgoncheML1V9MVnzdMKMeDVK9D09ixhWro0lcHwBm9ZGSyDknU2m?=
 =?us-ascii?Q?SH815+IkRfIVu0XdzvF8pEFYN+tgW/hulLW21Im2TVe7h0euOQRkVbTJu7WS?=
 =?us-ascii?Q?TBrRzrq21BGCsviY10J3HHLPTQE5LVIgMEf96MR66Is0pLQ3ACbk9Yf5v6fb?=
 =?us-ascii?Q?gnZKqrPGTNi+gUR/57AAQbt+nV5Qfn/HkYu2rCLTsqCMtkcE+dNiDts48oVq?=
 =?us-ascii?Q?6lZT88h1MpM3X5zx+dtHzXVshfVcXMRnrqzjUl00zoNnwMN6vEbfBOp0hxDj?=
 =?us-ascii?Q?/3k9QcwgHUVqoNrtd7VMg53kAFljzA6M0c8taATspHAuqz4ciPZmTZ5zlkSD?=
 =?us-ascii?Q?SuyiqsP/KUtbs/kYgn7z8ibYgfXhORTXWmK8YvrWvq38ZYjJT56CIMGhL3wH?=
 =?us-ascii?Q?ZQeX+QRy3nMZJK9HyFctqwNqMfS/t0Tb9Q+xRJR7sREvtCXrVOSusVXCWjbd?=
 =?us-ascii?Q?d4jBz0FG5AIUcG3fHJOeKfiJobMYCOvvZYjTlj8jing+zeZQzlebUzMLZpO7?=
 =?us-ascii?Q?ROvUopBxLjPtSgV0HmpNw1kh8gkknO8ZRsLe9HhRrtykIiw2wtGLEXATtrRz?=
 =?us-ascii?Q?xIFX9gfsSJ1akYoedhXpiRiGFUtiD6nj3SBbbdDpAp27NSJaRQ8d9iMHwVdX?=
 =?us-ascii?Q?YUCk3H8lv5L+agKvrxz2XQqGUuivBY7BobfYOm+IgJLXPNmr1rtGVeerl6Au?=
 =?us-ascii?Q?hE6MMCEqv0W2Mzs6DKupr3NvHkLylImghQIEZl8oIlwYP5UufOveJVjljgDZ?=
 =?us-ascii?Q?8zkZXOFC44d3eYSARgp8mco9bVj9ADYOuGg41RB5HG5ME/8U1YHJRog+1hQ3?=
 =?us-ascii?Q?CqG4lojXr6dBC72knbYE7nGZFSDAvtwBkSHTHY6A5K3bns0ZCi76UeZK6rCX?=
 =?us-ascii?Q?ffMesE4TaYVkUB/BUNuxwK+bP3KUYF/o3v/XvRU9vNEy03F00Uk97b9QbVof?=
 =?us-ascii?Q?apjBtslopROMmkJoFN7kfI0SO5bXzpCE/jBXRCxPl86QgeRCQyEFOf3h2b2y?=
 =?us-ascii?Q?Luug1Uq1oMIU2pqMcbJPTVeV71kL5DW9lqwfZuPYw43V/m6BmsjtF9YeI2GG?=
 =?us-ascii?Q?e9oJT6XRnZ4FsRC/LX9VCZmHDOLQ46MglYx6nmbe/ZSEMZjUJIhPGSPrnDJ6?=
 =?us-ascii?Q?786ONafuKSdQbuuZ378YeHWcdPIiRs5mu4GAeRjWdVFbBYOajK3jsbtpT60K?=
 =?us-ascii?Q?fdjZvSDHkNwozAW+pYBOrsbI3bfL2P9kjCvni1c2J/kBb7dVEHyTnGNRGBoF?=
 =?us-ascii?Q?nUDiMM6xFCMoohqYEKFB0Jkk/R1oMPV5oX6b7Qoil5a/mrnWMpYHTPiqoTym?=
 =?us-ascii?Q?T8zDiuLdpvs1XyOKngwMqjBsoZOz1plmYqtTVRrZE/mC5+U4n6WnhYYJ6gE2?=
 =?us-ascii?Q?JHWkzxJte/Q5NeCmT2OwxU9wGXA8yncVzqnRSGaCm/W8huPrNopFBdau3dne?=
 =?us-ascii?Q?9fU8cbs9zyJT3cyPRcUlekthzSvCRrLZuWug/eQlEpr11ROadSnzn79O5PmL?=
 =?us-ascii?Q?//0v0MTUs95FP96aj5b+8J4r+CP7KpohsTca341T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a861ee-d721-46c4-48ad-08dac971c053
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 14:32:42.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VkYDqxjxW3sRG1MloJgaGzy846+IbS+EyDw2WR0toly/hX3ckwvuMaDkKPl25hyPcwZlHPjTS2T9bDOnpl5iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
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

On Fri, Nov 18, 2022 at 09:35:41AM +0530, Nilawar, Badal wrote:
> 
> 
> On 18-11-2022 03:44, Rodrigo Vivi wrote:
> > On Tue, Nov 15, 2022 at 07:14:40PM +0530, Badal Nilawar wrote:
> > > From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > 
> > > By defaut idle mesaging is disabled for GSC CS so to unblock RC6
> > > entry on media tile idle messaging need to be enabled.
> > > 
> > > v2:
> > >   - Fix review comments (Vinay)
> > >   - Set GSC idle hysterisis to 5 us (Badal)
> > > 
> > > Bspec: 71496
> > > 
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
> > >   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
> > >   2 files changed, 22 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > index b0a4a2dbe3ee..5522885b2db0 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > @@ -15,6 +15,22 @@
> > >   #include "intel_rc6.h"
> > >   #include "intel_ring.h"
> > >   #include "shmem_utils.h"
> > > +#include "intel_gt_regs.h"
> > > +
> > > +static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
> > > +{
> > > +	struct drm_i915_private *i915 = engine->i915;
> > > +
> > > +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
> > > +		intel_uncore_write(engine->gt->uncore,
> > > +				   RC_PSMI_CTRL_GSCCS,
> > > +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
> > 
> > disable the disable? shouldn't be enable the disable?
> > 1 = disable, no?

doh! the function here is enable so the disable of disable is the
right thing for this bit... Sorry for that.


> > 
> > > +		/* 5 us hysterisis */
> > 
> > could you please mention here in the comment that 0xA = 5 us per spec?
> > I got confused again even though you had explained already...
> Sure I will add the comment "0xA=5 us as per spec"

Thank you

> > 
> > BTW, how reliable that spec is? Because according to that same line
> > we should be setting the bit 16, not the bit 0 in the previous reg!
> Bit 16 is mask bit.

Okay, and we need to clear the bit 0. It makes sense. However the spec
seems to ask us to set the mask, but we are not. Should we?

Also from the register page:
"Must be set to modify corresponding bit in Bits 15:0. (All implemented bits)"

So it looks to me that we do need to set the bit16 to ensure that the
clear of the bit 0 is valid, otherwise this is a bogus call.

> Bit 0 need to be cleared to enable Idle messaging.
> Bit[0] = 1 Disable Idle Messaging / 0 Enable Idle Messaging.
> 
> Regards,
> Badal
> > 
> > > +		intel_uncore_write(engine->gt->uncore,
> > > +				   PWRCTX_MAXCNT_GSCCS,
> > > +				   0xA);
> > > +	}
> > > +}
> > >   static void dbg_poison_ce(struct intel_context *ce)
> > >   {
> > > @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
> > >   	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
> > >   	intel_engine_init_heartbeat(engine);
> > > +
> > > +	intel_gsc_idle_msg_enable(engine);
> > >   }
> > >   /**
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > index 07031e03f80c..20472eb15364 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > @@ -913,6 +913,10 @@
> > >   #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
> > >   #define  MSG_IDLE_FW_SHIFT	9
> > > +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
> > > +#define	  IDLE_MSG_DISABLE	BIT(0)
> > > +#define PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
> > > +
> > >   #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
> > >   #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
> > > -- 
> > > 2.25.1
> > > 
