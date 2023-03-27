Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2616CAC22
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 19:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E062710E68C;
	Mon, 27 Mar 2023 17:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C6810E3CA;
 Mon, 27 Mar 2023 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679939278; x=1711475278;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DH+BqDAmKkddAUepc8ukCeT1AwyObhAT7Qw2f+02SEI=;
 b=OXhG3FRN9IWc3pttmUOk0W0iDd7aUoey/KQkxDH5OZF+6KhQUDLKBYKe
 wVoLmYzh6yUOCBGhACRZS6LjxEGXqdOFhqVbVs0eeGajiv9sCyzaQVrC9
 AETYtnDdZCcL2lKDXFlIUbI6uZl5/rSaVkELq6So/HwF5LBZ3IYrOuKoI
 MUP4lYpk1G1p29pr/DnjL9ELfGWcSQSrUYv3z38wOmb3tqfGcpVPnE3Ms
 jm7W7qbtwuEKsuf65321hKP/KLQGf8qThknVg41AbaC7jEJ/xDMnOcUyZ
 RM6IufdDLUSTKnF0PclgjP2U80rN4dW1qjrIU4YU2HhvbVFrJyBFJJtlS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337843292"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="337843292"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 10:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="660910811"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="660910811"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 10:47:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 10:47:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 10:47:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 10:47:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 10:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Flt4kuofSraBOi/OkeHEmNmwDUxrv/3XLBHmTENw3udMhpuhgtxZuihnvH9LiD3dbxvJQFIZz3HRChc/eRFdJnZGFwViA541e2SGqT/s2nwTNIo3PwaUetxOtS5QeRrySukC2LYh4LJEXtJIIz3hIUuyIlcAJJzyaJcp++8Vwxjj9T2nRHKBpX6fB2xLg/H5hk0wd+wcHYkqRDQwZJtNAp2C0MwIzhSAcD7JSAe/JBLU1s05UJ/rgKByXwjNTsxP+cpWFFJyYYImqv10HtGtgJaK3hhY6zsSNEevfr4JPcP9QFkyBpMld5+pTbb/XLdfo0d4PWOb7CW52hh7cLfUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0HUDPUCVG7Fvfjtg6AKRuSA5SF6k9CYw4UacZz0CIc=;
 b=SpCMBJKHSENmIlWhSCgDGrJb0WIc7diZT5ulemGjb/Gb/c+CS/H7epatcd+LrGzQy0yAAvAs7vzNZyBUSrED9tcZf9Lb8IxnhKMbrjGeRwfMNL0og5BS1UvGgn2hR3MT2jxpcTry9Gurxj9OFu2nmTpEIvUqaOtgGZ8FHQmMaWPCGPh4IQWVCTus1eVJyf02yAvn+//mYfjJlO7PNVpssrTRBKmLvCaofyFAvJq0/ry6TdpznaRq0dwaR9h4Fu1LeAq656gfU2/G53o09c7+SXL6OgoEVewi3zvvjFAO4St/syJUx35/iOxRJb58bBXq/NOyu2lahO93lf7p6O02LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 17:47:30 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3b2c:bb0a:17a4:55f]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3b2c:bb0a:17a4:55f%6]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 17:47:30 +0000
Date: Mon, 27 Mar 2023 13:47:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Disable PL1 power limit when
 loading GuC firmware
Message-ID: <ZCHWrf7v51Hu9EK8@intel.com>
References: <20230316035954.2593843-1-ashutosh.dixit@intel.com>
 <4760d41f-c237-9f97-eb32-5d2ab05eea20@intel.com>
 <87sfdtload.wl-ashutosh.dixit@intel.com>
 <ZCAyGzvnu5mwHMJg@intel.com>
 <87mt3yku5v.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mt3yku5v.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|PH8PR11MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ce52d5-22c3-40d6-67a9-08db2eeb5614
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4kEjnieAT6NvV2ATEgb0K3fHVgdg4EQ/CFwGR6BlQjGwgjl3/oTpNsb+Lf+U8lIpbtAQLCqOF2kU6dXS4IXmjIkYvB/e0uw36kWgU4lOhDHXNnVv01MPb/1cBhKRtJviH9kQtO35k8H9KyFUpgNRdTia2eK54D8CXOOI+8S5UZrIJ480uRa9b2DuyQft9qZOAMzH6P4o9cjavu+JrePKjCEd83/yafedmhJ74mBugj65qOC3aStw0sjpq4dFxRtb3p0EMeoJJ1ebuMxvp4X4xBhFP2+VwjGMNkXlf9v7bSKCClKWhquERYFl/87gIQYlPispYZrH4yQIk/pPd8vCihPMW09PN0CNiRy0Birma+jmVZ362vgGnUcgFPF3XVoDQSKfmmi4BS6S2xQgr6Zeset55Lj+VwtzqxDdRrl/1+rJGyhYAx64dgZV4Zp5BymzMroudW7+ext0iSH1C0+pOV1/937Owv2bjanPp1syJCN9n1jGDnc9nq5ENsftiGSvPKiQTM42Pg7xTM0Z+O8LXVXrodTaJuUNUIjRkSh6w+F6xa951Dt4kjVwJf4VYV2P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(66556008)(38100700002)(66899021)(6506007)(6512007)(26005)(186003)(4326008)(53546011)(2616005)(5660300002)(8936002)(6666004)(41300700001)(30864003)(8676002)(36756003)(110136005)(2906002)(44832011)(82960400001)(54906003)(83380400001)(86362001)(66476007)(6486002)(66946007)(478600001)(966005)(316002)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IeBkg/SMdZB+mgdIWcNYO3OfDhCfuSjNsgX2105FR54M6hjvJYdLmuewa4?=
 =?iso-8859-1?Q?MG5ZyyYKI5Nh2pV8k61qxHjWqock1/I2smgWm0o3Vqi/tOf5VSQSEL/uxP?=
 =?iso-8859-1?Q?4XK4fMVKKRbEHaXSGPSHzEJzQCREyiAMVtJyMRyxtkTZ9KETiiwjruEfTq?=
 =?iso-8859-1?Q?MM0t9y9LbTTm0FM+H8MfF/vi90gkJtOmvcirVNw7F9YVx5gZepgKBALbrP?=
 =?iso-8859-1?Q?f4VTyIpyi1LBO3fq8PeFa2gJPqgYtaB/7hOc+y3MNbeaPTYBK74wtczuTI?=
 =?iso-8859-1?Q?HtqIbuiajmr/VCn9L6llVFl5wPJUInuIxB4J9cLCcsVtGc9Td2sNKmwRhI?=
 =?iso-8859-1?Q?HuTnJ7uoZUc41z1HcwivPRdefmiXiQ1Pqdmeiz68B4055GmXwCAYeFrWBu?=
 =?iso-8859-1?Q?RNdHbCFck3kd+UczIIyjAl48XfEJ+iG7AlSXpBMektFpp/4/ZQ2aHdA/qf?=
 =?iso-8859-1?Q?xtG4VOXUZatslZB9Lg7QsmV5vn+VTEcNZrJ8LfwjxiMRxJHqSVQFtTF3t8?=
 =?iso-8859-1?Q?jqwMn0TwDpcfzl9oQI+zaMRXwzSRt5EBFUwp6EramzY+QjdcZpBwItW6Sl?=
 =?iso-8859-1?Q?U7vKZiFGTvN7+IzBwpGogXqePmBZfLN3EBkuteezfEBQNhpcyNlUFp5l4I?=
 =?iso-8859-1?Q?hQRoWWjKdYPe7EnQPKmr0VfBYNob/zxdleZqWkXVlIvuTt8E2DxrN2tBSi?=
 =?iso-8859-1?Q?aSd/dy37iC5QK0xM1iFT+ZZBEdF2XZVwWQt2DY6Einx6FKeNFyauR9Twk5?=
 =?iso-8859-1?Q?SC+1vM8Jy06Mmm44EyKwiwKgTcIOrMdeRMaA7patS0181urHLThUIs+ud0?=
 =?iso-8859-1?Q?dqo0iL3G8NsUDPDZMJqklNkxCh6doV8xDnPikqbg+rzSi4AFmz+5/FRbCq?=
 =?iso-8859-1?Q?zzN0YHsrdzYgHxqfZMUVPSwpej/Io7rUS2glsdSjPDX0XiZn5CPyTj1o1j?=
 =?iso-8859-1?Q?ci3tHiUpII2t7OaDLN9SXv55bttzsyTWBZFWZeRaP2oo2/YjJcD1pzWNSK?=
 =?iso-8859-1?Q?clt4HrSQjWFAhpfNYSm0qWk4aUoOw06ejcNd8aCgr1PvBATrs0BsRaXgvQ?=
 =?iso-8859-1?Q?vmltG6JUuqbfpM5zZ3nynVbJNxfrx19q3IZgmbV9NNnxKyMWwq3fiQSUO7?=
 =?iso-8859-1?Q?qLTG4HR8zEV1QA9HJ3bmroii9AEsgUzpjIt0jRoopUD5i2hwoxGlPJI4T7?=
 =?iso-8859-1?Q?GpT2mHqLvm5mmvb4I9WzmcExlda+wJI4zdkH6yYpdm+9lt5I5PA0lovfWf?=
 =?iso-8859-1?Q?968rAMnZPTUCmYO3/YA5E6ecy3yO3/IzPCGLY3WOJsrhhSMeACaf2yrlh4?=
 =?iso-8859-1?Q?6vccDiGZYOHm7o4GO7j54cIrOFGa+XF9WB4M4ELFeSkQQVRALPPw9yzDBL?=
 =?iso-8859-1?Q?gSefwg+yAuI88OCetdrO9SAbTnQCb+ad1TL743OziFVBZMtMkYlXC4OjGn?=
 =?iso-8859-1?Q?WP6sUMS84dUCZTDo4szn59TXEyFkFQDQ0QLTD/sZLJ5iza9YFvLV/4C1G1?=
 =?iso-8859-1?Q?xfydt2KkAQIIZHpyjHXai78ez5A5HJD6ezhVCxBEoLd5Un6btOyxr2U24T?=
 =?iso-8859-1?Q?gcmjNj5y+f7Uh6TVi9V+Ol73NE6eLCvxAuXwkEb4xTCVjtLMNngYb/dFdI?=
 =?iso-8859-1?Q?3FBXAtmHTYqZE+RQpu9yhLV9y/4hK8rLuv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ce52d5-22c3-40d6-67a9-08db2eeb5614
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 17:47:30.2239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Enl26fkJ5/NO/+UexTq+Xr5rATPQk+6vqyL8GUNTK85qziF9+chcu+ZcsNeDDth4snWVxdJgYHenwUnXbtj7NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


+Daniel

On Mon, Mar 27, 2023 at 09:58:52AM -0700, Dixit, Ashutosh wrote:
> On Sun, 26 Mar 2023 04:52:59 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Fri, Mar 24, 2023 at 04:31:22PM -0700, Dixit, Ashutosh wrote:
> > > On Fri, 24 Mar 2023 11:15:02 -0700, Belgaumkar, Vinay wrote:
> > > >
> > >
> > > Hi Vinay,
> > >
> > > Thanks for the review. Comments inline below.
> > >
> > > > On 3/15/2023 8:59 PM, Ashutosh Dixit wrote:
> > > > > On dGfx, the PL1 power limit being enabled and set to a low value results
> > > > > in a low GPU operating freq. It also negates the freq raise operation which
> > > > > is done before GuC firmware load. As a result GuC firmware load can time
> > > > > out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
> > > > > limit was enabled and set to a low value). Therefore disable the PL1 power
> > > > > limit when allowed by HW when loading GuC firmware.
> > > > v3 label missing in subject.
> > > > >
> > > > > v2:
> > > > >   - Take mutex (to disallow writes to power1_max) across GuC reset/fw load
> > > > >   - Add hwm_power_max_restore to error return code path
> > > > >
> > > > > v3 (Jani N):
> > > > >   - Add/remove explanatory comments
> > > > >   - Function renames
> > > > >   - Type corrections
> > > > >   - Locking annotation
> > > > >
> > > > > Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 +++++++
> > > > >   drivers/gpu/drm/i915/i915_hwmon.c     | 39 +++++++++++++++++++++++++++
> > > > >   drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
> > > > >   3 files changed, 55 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > > > index 4ccb4be4c9cba..aa8e35a5636a0 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > > > @@ -18,6 +18,7 @@
> > > > >   #include "intel_uc.h"
> > > > >     #include "i915_drv.h"
> > > > > +#include "i915_hwmon.h"
> > > > >     static const struct intel_uc_ops uc_ops_off;
> > > > >   static const struct intel_uc_ops uc_ops_on;
> > > > > @@ -461,6 +462,7 @@ static int __uc_init_hw(struct intel_uc *uc)
> > > > >	struct intel_guc *guc = &uc->guc;
> > > > >	struct intel_huc *huc = &uc->huc;
> > > > >	int ret, attempts;
> > > > > +	bool pl1en;
> > > >
> > > > Init to 'false' here
> > >
> > > See next comment.
> > >
> > > >
> > > >
> > > > >		GEM_BUG_ON(!intel_uc_supports_guc(uc));
> > > > >	GEM_BUG_ON(!intel_uc_wants_guc(uc));
> > > > > @@ -491,6 +493,9 @@ static int __uc_init_hw(struct intel_uc *uc)
> > > > >	else
> > > > >		attempts = 1;
> > > > >   +	/* Disable a potentially low PL1 power limit to allow freq to be
> > > > > raised */
> > > > > +	i915_hwmon_power_max_disable(gt->i915, &pl1en);
> > > > > +
> > > > >	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
> > > > >		while (attempts--) {
> > > > > @@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
> > > > >		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
> > > > >	}
> > > > >   +	i915_hwmon_power_max_restore(gt->i915, pl1en);
> > > > > +
> > > > >	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
> > > > >	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
> > > > >   @@ -563,6 +570,8 @@ static int __uc_init_hw(struct intel_uc *uc)
> > > > >	/* Return GT back to RPn */
> > > > >	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
> > > > >   +	i915_hwmon_power_max_restore(gt->i915, pl1en);
> > > >
> > > > if (pl1en)
> > > >
> > > >     i915_hwmon_power_max_enable().
> > >
> > > IMO it's better not to have checks in the main __uc_init_hw() function (if
> > > we do this we'll need to add 2 checks in __uc_init_hw()). If you really
> > > want we could do something like this inside
> > > i915_hwmon_power_max_disable/i915_hwmon_power_max_restore. But for now I
> > > am not making any changes.
> > >
> > > (I can send a patch with the changes if you want to take a look but IMO it
> > > will add more logic/code but without real benefits (it will save a rmw if
> > > the limit was already disabled, but IMO this code is called so infrequently
> > > (only during GuC resets) as to not have any significant impact)).
> > >
> > > >
> > > > > +
> > > > >	__uc_sanitize(uc);
> > > > >		if (!ret) {
> > > > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > > index ee63a8fd88fc1..769b5bda4d53f 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > > @@ -444,6 +444,45 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> > > > >	}
> > > > >   }
> > > > >   +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool
> > > > > *old)
> > > > Shouldn't we call this i915_hwmon_package_pl1_disable()?
> > >
> > > I did think of using "pl1" in the function name but then decided to retain
> > > "power_max" because other hwmon functions for PL1 limit also use
> > > "power_max" (hwm_power_max_read/hwm_power_max_write) and currently
> > > "hwmon_power_max" is mapped to the PL1 limit. So "power_max" is used to
> > > show that all these functions deal with the PL1 power limit.
> > >
> > > There is a comment in __uc_init_hw() explaining "power_max" means the PL1
> > > power limit.
> > >
> > > > > +	__acquires(i915->hwmon->hwmon_lock)
> > > > > +{
> > > > > +	struct i915_hwmon *hwmon = i915->hwmon;
> > > > > +	intel_wakeref_t wakeref;
> > > > > +	u32 r;
> > > > > +
> > > > > +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> > > > > +		return;
> > > > > +
> > > > > +	/* Take mutex to prevent concurrent hwm_power_max_write */
> > > > > +	mutex_lock(&hwmon->hwmon_lock);
> > > > > +
> > > > > +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
> > > > > +		r = intel_uncore_rmw(hwmon->ddat.uncore,
> > > > > +				     hwmon->rg.pkg_rapl_limit,
> > > > > +				     PKG_PWR_LIM_1_EN, 0);
> > > > Most of this code (lock and rmw parts) is already inside static void
> > > > hwm_locked_with_pm_intel_uncore_rmw() , can we reuse that here?
> > >
> > > This was the case in v1 of the patch:
> > >
> > > https://patchwork.freedesktop.org/patch/526393/?series=115003&rev=1
> > >
> > > But now this cannot be done because if you notice we acquire the mutex in
> > > i915_hwmon_power_max_disable() and release the mutex in
> > > i915_hwmon_power_max_restore().
> > >
> > > I explained the reason why this the mutex is handled this way in my reply
> > > to Jani Nikula here:
> > >
> > > https://patchwork.freedesktop.org/patch/526598/?series=115003&rev=2
> > >
> > > Quoting below:
> > >
> > > ```
> > > > > +	/* hwmon_lock mutex is unlocked in hwm_power_max_restore */
> > > >
> > > > Not too happy about that... any better ideas?
> > >
> > > Afais, taking the mutex is the only fully correct solution (when we disable
> > > the power limit, userspace can go re-enable it). Examples of partly
> > > incorrect solutions (which don't take the mutex) include:
> > >
> > > a. Don't take the mutex, don't do anything, ignore any changes to the value
> > >    if it has changed during GuC reset/fw load (just overwrite the changed
> > >    value). Con: changed value is lost.
> > >
> > > b. Detect if the value has changed (the limit has been re-enabled) after we
> > >    have disabled the limit and in that case skip restoring the value. But
> > >    then someone can say why do we allow enabling the PL1 limit since we
> > >    want to disable it.
> > >
> > > Both these are very unlikely scenarios so they might work. But I would
> > > first like to explore if holding a mutex across GuC reset is prolebmatic
> > > since that is /the/ correct solution. But if anyone comes up with a reason
> > > why that cannot be done we can look at these other not completely correct
> > > options.
> >
> > I see what you are doing and it looks indeed a very safe approach to ensure
> > the pl1 won't be toggled by other paths while we need some guaranteed state
> > here, or hw init fails badly.
> >
> > But in the end you are making your lock to protect the code from another path
> > and not protecting the data itself. The data was already protected in the
> > first version with the lock in the rmw.
> 
> Sorry I am not really following. Daniel had mentioned this "protecting code
> vs protecting data" but I am wondering how it is applicable in this
> case. IMO here the data we are protecting is the register which we don't
> want written to by userland while GuC load is in progress. To do that we
> need to block the code path writing to register. So what we have here seems
> to me to be the simplest and cleanest approach for solving this issue.

I believe your cases here is exactly what Daniel had mentioned as protecting
code and not data. Well, in the end we are of course protecting data to be
modified, but in your case you use that mutex to also protect the code path
and avoid other calls while you are in this guc_init_path...

Please Daniel, correct me here if I got it wrong.

What I don't like here is that we lock from one function and keep that for a
while and unlock from the other function. To protect the data itself in general
we just need for a very minimal time while we are modifying the data itself.

> 
> > maybe we need to have some kind of a state check with other state-lock and
> > then if we are in this forced state for init path, the request for the normal path
> > ignores and move one,
> 
> I don't see how this will *not* be racy...

maybe something like this?:

at power_max_disable:
mutex_lock(data_lock);

mutex_lock(state_lock);
state = in_use;
mutex_unlock(state_lock);

mmio_rmw();
mutex_unlock(data_lock);


at power_max_restoration:

at power_max_disable:
mutex_lock(data_lock);

mutex_lock(state_lock);
state = available;
mutex_unlock(state_lock);

mmio_rmw();
mutex_unlock(data_lock);

at sysfs fn:

mutex_lock(data_lock);
mutex_lock(state_lock);
if (state == in_use) {
   ret = -EAGAIN
   goto out;
}
mutex_unlock(state_lock);

....

out:

mutex_unlock(data_lock);

> 
> > or maybe we queue some request...
> 
> Queuing a request will not be enough (even if this is possible), the
> request will need to wait to complete till GuC load completes. So we'll
> have to complete the request when GuC load completes, similar to releasing
> the mutex in the current patch. Looks like a much more complicated way of
> doing what the mutex does very simply.

The wq would sleep/delay while state == in_use, then process the next request...

> 
> So:
> 
> a. What is the real problem with the current implementation?

probably the big lock used to protect the state machinery...

but if other folks believe that we don't have an actual problem here
and this big lock is acceptable as long as it has the annotation for
the static analyzers, I'm okay to just let it go...


> 
> b. What would be the correct solution for it? That is how, specifically,
>    should we implement it?

state handling with separated lock from the data itself is my suggestion.

> 
> Some more guidance will be helpful if you think this patch has issues.

I hope Daniel and/or other i915 maintainers can jump here. Specially if
I'm being to paranoid and the current patch is enough...

> 
> Thanks.
> --
> Ashutosh
> 
> > > ```
> > >
> > > > > +
> > > > > +	*old = !!(r & PKG_PWR_LIM_1_EN);
> > > > > +}
> > > > > +
> > > > > +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
> > > > > +	__releases(i915->hwmon->hwmon_lock)
> > > > We can just call this i915_hwmon_power_max_enable() and call whenever the
> > > > old value was actually enabled. That way, we have proper mirror functions.
> > >
> > > As I explained that would mean adding two checks in the main __uc_init_hw()
> > > function which I am trying to avoid. So we have disable/restore pair.
> > >
> > > > > +{
> > > > > +	struct i915_hwmon *hwmon = i915->hwmon;
> > > > > +	intel_wakeref_t wakeref;
> > > > > +
> > > > > +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> > > > > +		return;
> > > > > +
> > > > > +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
> > > > > +		intel_uncore_rmw(hwmon->ddat.uncore,
> > > > > +				 hwmon->rg.pkg_rapl_limit,
> > > > > +				 PKG_PWR_LIM_1_EN,
> > > > > +				 old ? PKG_PWR_LIM_1_EN : 0);
> > > >
> > > > 3rd param should be 0 here, else we will end up clearing other bits.
> > >
> > > No see intel_uncore_rmw(), it will only clear the PKG_PWR_LIM_1_EN bit, so
> > > the code here is correct. intel_uncore_rmw() does:
> > >
> > >         val = (old & ~clear) | set;
> > >
> > > So for now I am not making any changes, if you feel strongly about
> > > something one way or another let me know. Anyway these comments should help
> > > you understand the patch better so take a look and we can go from there.
> > >
> > > Thanks.
> > > --
> > > Ashutosh
> > >
> > > > > +
> > > > > +	mutex_unlock(&hwmon->hwmon_lock);
> > > > > +}
> > > > > +
> > > > >   static umode_t
> > > > >   hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > > > >   {
> > > > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> > > > > index 7ca9cf2c34c96..0fcb7de844061 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_hwmon.h
> > > > > +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> > > > > @@ -7,14 +7,21 @@
> > > > >   #ifndef __I915_HWMON_H__
> > > > >   #define __I915_HWMON_H__
> > > > >   +#include <linux/types.h>
> > > > > +
> > > > >   struct drm_i915_private;
> > > > > +struct intel_gt;
> > > > >     #if IS_REACHABLE(CONFIG_HWMON)
> > > > >   void i915_hwmon_register(struct drm_i915_private *i915);
> > > > >   void i915_hwmon_unregister(struct drm_i915_private *i915);
> > > > > +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old);
> > > > > +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old);
> > > > >   #else
> > > > >   static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
> > > > >   static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
> > > > > +static inline void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old) { };
> > > > > +static inline void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old) { };
> > > > >   #endif
> > > > >     #endif /* __I915_HWMON_H__ */
