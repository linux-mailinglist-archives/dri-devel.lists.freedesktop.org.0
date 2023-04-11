Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5409C6DDE51
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4717F10E575;
	Tue, 11 Apr 2023 14:43:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A199C10E573;
 Tue, 11 Apr 2023 14:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681224179; x=1712760179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gqD22+IeWcZcUbWZdx9lee4Z+DV1Lr5zAwvgijbZbnc=;
 b=TRCRrsjfnE4YeEmx1MMZDWE34lG5RYHcWcJALw4KVk1Yh22QbwrPnk9k
 nMB3k9q6UrpNY8ZHYImSSYw+kLKA1yiQ3LCF/n4cs3CckbhNfvAduiXmf
 F1oB6vHzKu7nbob/f0ewMBPVSg9IGbaqmsI4C4zZ461e8HcHQ1jvMrnYM
 j5uoIbKiJ/skXcv6AUbkyhP3OR9HQnGFce+iH44hg+z+/qvwAQu/sgERd
 UMJbTloYWGeaTbH4IkQLlZ8KYk/jRd0ZptSr7bV4bZFCpw0SQvpX6oVZP
 kwZ923mf562hpz919IW5xhLQpgfVQ7Udc1aj3voWkXr7B/+Ul+3BtSj1S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343637617"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="343637617"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 07:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666001859"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="666001859"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 07:41:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 07:41:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 07:41:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 07:41:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWfTS2J9GfxlTWmr61MyXfu931RFg8/KVNUi64yzEb973OtYDGtiP5rTI/tpr+gT+6vpJbDXch1IXCYg9F7q6AEvXBGIyhSzmgqgsISHR1PeXZev03lMc13m8nw1HQo/FvWS7XWQRxGCnT4yXdItZhQ9MqXn8mKXDFmjO5wkrsogmb+E2RtYJcFzDsE5OO7I2y6wHy0fXOgAA/VR5BlleCIL3MfA8EqzzKIc6z2n5JnSxrrytjOF5y+JcmtGXpdkhMYLGV+tcpl2SI01a4i4Avd/RtPZZ4rjG9JE4L3uYifkDlqGMEKi3NXi56GT+NZ8di6kH4Ep+b/XmuAE0zcN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf32WafpZMeWosISIpv5epI4suIPCMicwh19iUPw6Vs=;
 b=PjTFtu8D+tzmZ+kbwlSrM11P5ufTfb3veoQPv2vVYuHoKmhoAvQxyn+RJxD9+fVB+U/NQ+NyK1fy/P+apYrNQQbTiLHHljC4CeiAGnbKPh5nF9xmtsTDMyJjbRMyZHbeM9hNubHoftqAK9yD8Jf4GS9626LxApoTNOpbnIdlX84KdvjWde27/JT9TBJ5Fh/pWD192tS1RAIPRClIGN8MwC0I8uP14DfbuldpVGOFf47SU6QO2gWDlHcBbwac8JjKuQSEmO3WY3/cQzbw2qED/ov0wEVw5OJl3O09RfENpGDC/d28vARFS06n6k/oPbVJTQz3RTmBw+9KxYPNWBUCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 14:41:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 14:41:41 +0000
Date: Tue, 11 Apr 2023 10:41:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [PATCH 0/2] Add support for dumping error captures via kernel
 logging
Message-ID: <ZDVxocPZR1Ad2QLa@intel.com>
References: <20230410192523.2020049-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230410192523.2020049-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:74::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: ef131669-a7f8-4b91-3a7c-08db3a9adcf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4MmN9CaXSHpOA0lWzk+y2mf6hwDWWk36nFuh6JprQIn8wugQ8OW8tvXtEtal4jvDGWfDY4+mC3HYMG4WXscXov/1C386TVyLjXogycAHF/26NgK6kKIFFbphoGHwMaXPQH1CDEV/mvbYo09vFSDAGpc0CLxHNV+RauCAZEyQIg4Wip/tIINbeV26+EkXQHLBluyDWgK+dF1W+11ctcBCMUYpvBcrGOSupxWjiqFm+Onti59pyH2IVGIl6FM8Zg9V0G3WNIt8ZHf3ED9c6lInWA/uwOA9HHqnYNMKqZo7VmBrQW00nSx6eokgTOlxdrFj38W/q2PPYf9DSc0xqXz3CFL4rCc/GQ+S0mvIw0Ild7OkDPzDlaZ4vyO3pcmH4YFi9Q2HKUe0D3k8o2rmElu9F+4cX2tdJ1dRYop3LU6gU+CrReZB3k2VI8Qi8Be+XQvUWSkckjosf5svPDmDZkeZF5WkUJjWxrqbufcVQG+iivWdjJhDf+UMpmZt5/iky0KQ2T1a+mU0ToAKPY1RZqkgqTpZa3FhFAqSJPKtV1edC63fmxC63tsZLZUs5EbXmPI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(86362001)(41300700001)(83380400001)(316002)(37006003)(450100002)(6636002)(66556008)(66476007)(4326008)(6486002)(478600001)(8676002)(66946007)(82960400001)(5660300002)(8936002)(2906002)(44832011)(38100700002)(34206002)(186003)(6666004)(6512007)(26005)(6506007)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFH8Cm10JV0TFCfVzuZlwZ6DNguadooVE3aoAtWd7IBIzTVqRTUp8vs3eOZ9?=
 =?us-ascii?Q?dgixucK3nhBArXrI/4Exf5C95WsFSRbOWOnYMHHqgvvCmyJtBqPPoEwLa7X5?=
 =?us-ascii?Q?PQv1IvCrE9bSrNeJnXp7xYFADK9zjp0VpO4SuAXyU0mSs/8Hb8UDyXOnrVAE?=
 =?us-ascii?Q?+FkgwjsTOA14TlITV3YNCb4ezBhaEvh87WrcVBfbPcdnBCOKF/3qu74cZ8Zo?=
 =?us-ascii?Q?NyNtAbXSs6WjK2V9ZUFN+syRqtwkE0DzNnxkPPFTGKs1vCACeSTbEJOkJBsf?=
 =?us-ascii?Q?PaFRHKSodIly7iId20diLPRNzJvqdwjGwmGX0KkC27zLZ9S4uYeKSx26Ygkj?=
 =?us-ascii?Q?NQfGl+om3cyXZbg/a95AjhowRiWxMw8ThzWHGIY5OtgvIf9I6QFV3/uQLIc9?=
 =?us-ascii?Q?luk9oZeUWj0NNxzl7pkaSp4QAbVHx990QZrISB61J6ECXwQi8s0CSkGREXrF?=
 =?us-ascii?Q?gLm04u4gV3YKPmhm4WN3vLe0/UUkoB8QOezZ6e+JXRt+KLIrf52z0jBynI3H?=
 =?us-ascii?Q?Jq2xVlKFpmrtWsOBF98ZnNLx3nDOy1MlH/7B82Jjg7ujLliE9DRmapyKwGU2?=
 =?us-ascii?Q?/5bw0+MjALclKxAO9nufBuNZPXUe/E0hC9CqZ0UKQ7xWxhil35vT+BHkfq74?=
 =?us-ascii?Q?JLIUG6+bPzuvUUggRo63BVvpJqa9/cVUciwlifn6nWR+3K1YA/vRzsqLyL55?=
 =?us-ascii?Q?fqc926eyIhKAuSGPatH7UFMI5wcdo7QVAz2JwEZ4w2VfaC8bmans1agYzkJR?=
 =?us-ascii?Q?m92PU43Fdf1HGrHJMELu9NKDD3o7tnLV0sc9L2+kod2rg9MXD7AogLLJm1jE?=
 =?us-ascii?Q?FCs3Pp4tCNX3Ra2ic0QSz2ewd5nFQwuBbjMjMeoFdirUZfniMlbiU7IcwTkf?=
 =?us-ascii?Q?DmJri8BvVC8FKm25b/n/B8tlxNO+QOoIrlP5EvKh9m3587gHdgYfmMhGj0u+?=
 =?us-ascii?Q?t5jUGuVvMa3Ui79Z5Bn8I/Z7GTEjCfanEPMgcwVlR6M9uinnuLCrnovvzpHs?=
 =?us-ascii?Q?wIOuhpaimRGJ56UbdTZ6/GUw9KJpbBwKEoqEQyia8zKSdNKRe61MMZOJ63bj?=
 =?us-ascii?Q?FsadRhFT6CX6tft1MO2pbyFmE35HnzrR7k4ASdVOkLFfPTaNT622p11NtQE4?=
 =?us-ascii?Q?F47Up2FO7b14M4N7eN+RuP+QUOT0TiPRaiPPml/uN2a7lSUzTRR1ny/HaNhi?=
 =?us-ascii?Q?nfClT6D1P2geJAFmmKwbipQneHVhjIkD9nPd4tjnJrPVRq6pHy2PDme2pS/6?=
 =?us-ascii?Q?p9jnZBamHX+QWRbcguyXCJ3a1ptHBaSs/bz89Kd3Aha0ZOj4zb8DgEFJQgD9?=
 =?us-ascii?Q?0fF13+cIF5Tz6S1lAQptlDpOKZU5ahu4DRxkQH3e2le80e8Y8A4ptuQj5zQk?=
 =?us-ascii?Q?vkLFQTPoKERgQggYs5bzpL7rH07rXVpUJOEpkRDT0nnikKPkBfdSEzYoy+wG?=
 =?us-ascii?Q?RdyCmn7+B/cwtXVOcY/5ABK6pJCvBaJcQc8ULuforwSB4eEK4YHh2tj1X0+3?=
 =?us-ascii?Q?s87MC6+O5t2U7mRhGmb0Q7bbNo86yaQuOUszDWNXSLjgBpZA4Al+MloPAEWC?=
 =?us-ascii?Q?uTAFNSDXz+cJK9J/TjV0itangkORnUTHtTldzyVQgNpE6z6nKCXFscwMbo+s?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef131669-a7f8-4b91-3a7c-08db3a9adcf7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 14:41:41.3316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCwD/3JHRjlsMT88ZQo/Q2Rk3oox1w5BvSKz9CjAXx+ZGMHcyHwwgx4TDg5Yagn/SBFXeRY/NJfNIHAHw76KBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 12:25:21PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Sometimes, the only effective way to debug an issue is to dump all the
> interesting information at the point of failure. So add support for
> doing that.

No! Please no!
We have some of this on Xe and I'm hating it. I'm going to try to remove
from there soon. It is horrible when you lost the hability to use dmesg
directly because it goes over the number of lines it saves... or even
with dmesg -w it goes over the number of lines of your terminal...
or the ssh and serial slowness when printing a bunch of information.

We probably want to be able to capture multiple error states and be
able to cross them with a kernel timeline, but definitely not overflood
our log terminals.

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> 
> John Harrison (2):
>   drm/i915: Dump error capture to kernel log
>   drm/i915/guc: Dump error capture to dmesg on CTB error
> 
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  53 +++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |   6 +
>  drivers/gpu/drm/i915/i915_gpu_error.c     | 130 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_gpu_error.h     |   8 ++
>  4 files changed, 197 insertions(+)
> 
> -- 
> 2.39.1
> 
