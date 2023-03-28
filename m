Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F66CC9AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E5310E474;
	Tue, 28 Mar 2023 17:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9472710E474;
 Tue, 28 Mar 2023 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680025959; x=1711561959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4iuniJRI6lClb1uYiKB6m/lkR4exc/p3QigSQDjgr/8=;
 b=BPVn6g8VsWNfhasLiElQfoNIeW6aFnRdXTyhPHm/lKpdXi2qkKnFX0jB
 i7HSizBCYmCll1+qwm0hqtvrGot7tR3CVpls6RQd9TaiRCNDKqzKHeOyS
 aiVwMc0TV8EIeWEN8FlpY6TVO/uPWR6TNuFjgXcg6VeBSMKLUsuILk/g2
 7vsKFgI91ZZl0sSNFK99P/sv4xhfYMiIrieC9osN9cIJsl+O407T3o8kR
 sCtLMW7Zznagfi8q6jd/umggFeRhkaaXigP+EKMNVLThL/VSgEE2WhcHg
 D2wixIqupilh69OC0Yd6QRcnyj5Y4dwgR4AZ8FHAj24jwAIYNIloUetIT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="342234726"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="342234726"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 10:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="677458711"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="677458711"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 28 Mar 2023 10:52:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 10:52:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 10:52:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 10:52:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 10:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+D1L6FR+qcTS3vviW4rqHh6p0DAknZYRqKAJWi3zTyppI+rNSvRiGVROpQzM06d1SdHkkVEybdRM/KLWlc0wV6fsrOYePGaSu9asz6UqLky+HTmmBiqKc06H9kfx3zmK6btOJg9MCTkZ3vqPI/i21U4NLDh24kH6nbfycZ24ZKfcjRR8VFnFE4jDipcu+gyBF6y2eNvbinv3yOipgUlpwEv8k0/RN/oDyNGel3y3zZXETIbq+5/W10ljdOBfmLQZ3vq68iN6NKaYpACdcOYRXWGIBDlljuamN/SK7uuZxTDzEm8sRCsi9hQas+PvZhXUGYU6gKLA7M+g0mGkCKXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iuniJRI6lClb1uYiKB6m/lkR4exc/p3QigSQDjgr/8=;
 b=asPkLwpjuqMSGRqYM6Cq1rXtTd6mkj6VwhnucafMnOGGZEwu4jcOQz+/W/yQmqlUWh+Q5A+YBwTb3tn79YZNQDlLZMJLVlG7OW3UAwTBlWzB12abIQE9snaG07ADetXyYzRZcT9LleI4Ef/faiEgv4K+aXBCSLhxjjukYru6EAyJg94R/CjtpNS6olBjBN41X5Hy8ltRu5+fg8IJ5rL8P2omF7UJD8Sx2PSLTbyI95Cg8bLKEd8nh0wzD+65IzSa+aR+y/2B372r3u+D+0gnSM8MLTxaJ3WjKjyIyWiGUJP17d1of96UY3tyfOL53fLhkI4LLjnkSZvHu1VMG8xp8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Tue, 28 Mar
 2023 17:52:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 17:52:33 +0000
Date: Tue, 28 Mar 2023 13:52:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session
 creation and cleanup
Message-ID: <ZCMpXMj7GwDIp6Ll@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com>
 <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
 <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
 <3359c9d371a25710891352061693637b37679734.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3359c9d371a25710891352061693637b37679734.camel@intel.com>
X-ClientProxiedBy: BYAPR08CA0024.namprd08.prod.outlook.com
 (2603:10b6:a03:100::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ba6e08-6221-4ee0-513c-08db2fb53547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FU8D/Xu8PAXs8fmADKAJ2TrM/GbwLOAri51/knomNmZRzKOh9WWLePf7u9D1f64lTJfzsTc7a4PyfRqC/+FKZywwz8vsmpQHz/qygZuJbfJAeVjz94RpM472hMssn667lVHP0L5GBHHKDnPzDkel6xJfWFJmcle9shXQJVXq1e5Dj8dykZN/NEiaOt8EK/0ezD8G0kt+DFmiipvZLHGWiT8xVGF7yftDuemub039GYVUST/TlfMvszw0vFajnlb1N7HXazQXf4aP7Sl8jPe8m0VvPfB3VjgBUQjxJZQRdumFYb8biGkl7cQb+dfk92nBVHRVSLMpRtSi2q3Xb/DvgWi0y8XpMZDJG4ZWvkjJ7AVzyWokEYOnHW110hxJIkjbD+jzFf3BtD1mqLdL85uxqLywwq1gNmXnrNZpbYH001MbA7tYGQb/EeojwoyguknAzTkmIpNk0qQnK7lqTMb1cheMihdp+kSjWAvt9VMXOm4YJau/luJVMThAcNMn0/QwJVhGR3bScxN3+QBEac3Ujo5FCJmoVot2Yf6l0WHVY+BFGkwCjLWjELEcbZdORmmg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(2906002)(86362001)(36756003)(6666004)(478600001)(6486002)(2616005)(83380400001)(37006003)(54906003)(6512007)(38100700002)(66946007)(8676002)(66556008)(66476007)(316002)(4326008)(6506007)(186003)(26005)(82960400001)(44832011)(6636002)(8936002)(41300700001)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P6T9kv0IW/ZPkKW376fShq6MOVsg8tc66IJ/X0Hk3Rt+QQJ8t3oQFQ/Vqext?=
 =?us-ascii?Q?1ir/nbqP9e1E4unonP/Mn6qw/n0WBQ7Fx8z5FEeZkIHfS7RTfMLGfyYi0Trk?=
 =?us-ascii?Q?TMA13ku51GWzeVM/d9T5r7FsQZGOUC13vZot5TtS5BSAPjo7r0kBv+jtflf/?=
 =?us-ascii?Q?9mwn0DVd7ySwwPy5NKociOQUr/yzrdcQwsnIOw537h1Rh2VBCtPMtlH3UIpr?=
 =?us-ascii?Q?INANh6l1XWTnmgtqpvBn8ZIbgv/JCpgJ4DXkukiJ2cl7Qjx0qAooMpJ1cUIB?=
 =?us-ascii?Q?Lv3qCwcqimvuXtsPlVYhswWUjFogIZi19Avbch1QJTdVyfCqqAKz+rkpoP9+?=
 =?us-ascii?Q?GKJV5DiJgPMUlDTUJ4sCHXWVBMNyk5RbnxPTFwD+9hU4c+FBYDaQ9JZzRI5J?=
 =?us-ascii?Q?CP7y9oDskbCiLpFyKtN8amZIhYJ91izPGlj9+YaAUMXEfyxDrkmQ0m7FdRkG?=
 =?us-ascii?Q?RHTOL0oXyOSdMPbn+U16Ji5d6cCv9Vb4H4XytoCSK/uX26EjYXCA2CH01BPA?=
 =?us-ascii?Q?8IFEgtFOdTzZ6W4cKZmTuhkZo96yOitBjzgKLjgl3KM8u6t/2L9huPMgeai2?=
 =?us-ascii?Q?gvS3yu5RbvCJ+lrTktbV8bXg2UdSK468uXjBRa6fgsI6ff8mAhsLH2SZfMJ0?=
 =?us-ascii?Q?Y9IKrasEjYxrtRjnT77QakyRHFv8LvviwRtXknhPYUTAW4M74qgdQdQrEOQC?=
 =?us-ascii?Q?RKkmHWxqoZO51Fg07uf3tl65ooHN0bsSBZuIXTq0DTkDYmvktkzOW3y8ac1b?=
 =?us-ascii?Q?xFINB/zRmHkGzhuKLK9KxlcTl+7gg99OqWm0meGa7M2qkNU8NkoLJe8cK80t?=
 =?us-ascii?Q?+EUUJwcm+aBGAmljcb6vO+uzz1kuEmxifmooMLTTRTyInJUBuGaSPMM8zq+z?=
 =?us-ascii?Q?tMiEoBHkTAmSxGtJw2/YbgGS+YVSP8KCOxyPQAeKFlWIKSocx4yFs++4719r?=
 =?us-ascii?Q?0VIWic+0+oAuCy63g9P8Lf4VZ0Q50HJzhY2SWmN2Xw9Q79gUE4j3tHdC7nVJ?=
 =?us-ascii?Q?QrySwO7Rybbsb9KGw8qMI2ItCcU+M8uJbKZK3+h9rGpFoFZAZituwOSerIYB?=
 =?us-ascii?Q?QF+XDFHFPXyUhCX1PCayrZU9XH9mw/bMY+n1HvO3IkpeP2WP5VGuQwZ08dxN?=
 =?us-ascii?Q?LugmGtPwP0/cBln2Com7/J7uXGFWzEa9GFhpBZTT5jeWUfBEKumqnFHvYqYx?=
 =?us-ascii?Q?pAW/jC9WtpZwZGffmX7+os/1OqUdxfaeANPJGF+Sc/kielY/XdVOT6pUpbI3?=
 =?us-ascii?Q?j+hYBSociB04fwR29ML+SpX7L4vPmFrN3xBVN2V/FXogeusnRkJpPS/IPju1?=
 =?us-ascii?Q?QSkte4RaDKKl5kmlljf1BpmrKXJ7wA2UUFR13M2gY7yJmP2dyMWgLi4uQXey?=
 =?us-ascii?Q?33rlA4df31OJ+W6j4a/ddm5rGmsmLL6l5s9IAFCl75Se1Ki+dln4dZ8HzaM3?=
 =?us-ascii?Q?oikudNipgGadYQtBOJ9H2mozu5xjYD7rtdLmFnoitLHI+M4aI7FF3WcVQAsO?=
 =?us-ascii?Q?mMF9V8o6uSRzAsiFaoIsJ2uNgHH/K5aDJbPseFIf6I0wyj8C2pQB1QdYGqNM?=
 =?us-ascii?Q?nCaZuIMyK5kHIkelpsYfWO/gawoBbwOSj0lR0KF8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ba6e08-6221-4ee0-513c-08db2fb53547
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 17:52:33.6755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDWX0UtgTSiqgjDEPgtz0A/xtBsorwyYpHSRwq+Zea/WRLtdAWZfdm/jGz+0+yjXDaipr/vRPPQDZdzo+UaLxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 05:01:36PM +0000, Teres Alexis, Alan Previn wrote:
> On Mon, 2023-03-27 at 17:15 +0100, Tvrtko Ursulin wrote:
> > These two:
> > e6177ec586d1 ("drm/i915/huc: stall media submission until HuC is loaded")
> > b76c14c8fb2a ("drm/i915/huc: better define HuC status getparam possible return values.")
> > They do not help here? It is not possible to use or extend the refined I915_PARAM_HUC_STATUS return values combined with huc load fence for this all to keep working?
> Checking is-huc-loaded won't reflect is-pxp-available (in case fw/fusing isn't allowing it). But the connection between them is hw-internal so i915 asking PXP-fw to attempt a PXP
> session depends on HuC (and the 3 other things i mentioned). However, Tvrtko's point on using fences-or-equivalent is the same thing John Harrison brought up offline with Daniele
> as the proper kernel way to do this type of dependency checking. However, any form of dependency-checking won't improve UMD's experience. We still need to decide if i915-PXP should
> wait-in-kernel or return some-new-spec-error. A useful data point: we are debugging a related issue on actual customer stack. The compositor using mesa is hitting this code path
> very early.. even before gsc-proxy component is loaded and we are trying to figure out why delaying inside intel_pxp_start is not helping (more delays causes the gsc-proxy
> component to also get delayed) but that is a different conversation. I'm only mentioning this because we have a strict requirement to get the desktop login window up within 1-2
> seconds of bootloader->kernel handoff. That said, if use -EAGAIN, I'm not sure if that would work as it would delay the compositor startup beyond the typical end user experience
> unless MESA has a timeout to give up on a cap-testing when seeing repeated -EAGAIN (doubt mesa folks like this?). Perhaps we could just immediately return with a different error
> (instead of current PXP-UAPI spec of -EINVAL or -ENODEV)... perhaps use -ENXIO which apparently is already part of the original pxp code but was never mentioned in UAPI - but we
> return this immediately and document it in UAPI as "hw/fw insfratructure is not yet ready to create pxp arb session, user space can retry but may need delays of up to x-seconds on
> ADl/TGL or y-seconds on MTL, before getting a SUCCESS or one of the other errors).

fair enough. It looks like we need a new get_param! :)
