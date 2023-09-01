Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD279021B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 20:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4CD10E064;
	Fri,  1 Sep 2023 18:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E89288C11;
 Fri,  1 Sep 2023 18:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693593517; x=1725129517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XbY8cx18RMC6NSsYtkXwSiZ3d+dSgwVPOJgxWW8FgJY=;
 b=eqnyk5tVtIQ3BT0sZJKWKXBjb4OtYIlVJl41rkq3Nz2mlwfctpnDQP4i
 /d3yjOym0AVWyo3SOZmy77pgTHbiW5KiDqFgfzuXuq8kcsyzB2iYBdYt9
 5FOEseA9w+Qu1xrkhGPAXwAra+8TXEBV2M9VgIW15JE5w9keLZeab7Nk0
 O5kWYrb9FwSgZqcpaWS/QonW56qy3hjVomNtj9T3P2w3ah/Fu6sA6pM2c
 a+wu3ifLyLEuYYWFnHVniVjO5bqOpCtb+hb9CAYfRvHhPvFeCJtY+vJdc
 +RNroOqpg3/p2aT4PyxK+43KkaEHMPYTQoA/ctYThLNrrLy3JBO2tvk+0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355781553"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="355781553"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 11:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805530676"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="805530676"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 11:38:36 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 11:38:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 11:38:35 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 11:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtdxwO+qHXlK/j9iHj+bmCWO/GZ51OGnLOthwFtlAjY3ozWmKsXwjgoVn9pw8IbqwWj43vNfylYyka6RAog3DUHHxoCnFiaj93rxVSdwEe/X2/hHaDZz97wkizhKWsA9kz3p8Izu0B7I/3dRfW7ecRI/TEk8IEqUBJIB4qZUVdn7fXBV6VMmcWA564VoP99GQpvmV4zkkTJy2PRTg0/WI0YrNmlQ16OHxtxXoFQeG9+jmWVR7F00u2s6bJ/OMlaGCcdHYBLfWQh/yB9aZIZfznmNKedVl+d0yd3nIY7gvPnU2F9kWXlDiGPUzvBDZaWYQDxKFktuqqKWtbwR+kzdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQCKREP+j8YYrfyYrpZbBfdsn7X4y0OClQU7vMCouEI=;
 b=nomXsBpi4delXY0eKWadCYgxwZh/KoWyOqOrZ1RC1kadArmJyWXq7lXTfmrbHQz5jXTNJT6rarwP8fpJmfOwutYL2U5rxli9/kBj/KzNXwkOhpxGjRozStoijNeWNXD6uidSGc5xGhtAZENkWqqpUuJHCc53ULvmVdCmu+iB96biW50MGwq/DiYhe1ujLV4T0NdwVqJ6ncHc1TSunPuhf1w1hHOgTO12hgUMQ3kyK6IzX2hErtMAgy+0zilJO3vKNTWnlhX2HGlquQyNxfDW2mfdWoeBEkkhx/lZh+gJkASVBoHQGnFrP7wSRgjAiLXfZgtA0kMDOkfaxY4nuzGNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 18:38:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 18:38:15 +0000
Date: Fri, 1 Sep 2023 14:38:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v4 0/6] drm/i915/dp_link_training: Define a
 final failure state when link training fails
Message-ID: <ZPIvk08uB4Zg57ED@intel.com>
References: <20230824205335.500163-1-gildekel@chromium.org>
 <06b50235b6bb02d0774fe0bdf5186ab999c0940a.camel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <06b50235b6bb02d0774fe0bdf5186ab999c0940a.camel@redhat.com>
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ce1587-96bd-44bb-32d6-08dbab1a9a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ry7u5PAQhIE1hYUstB1AELOBCoemjSir55OZXsujliY+2FL9otXxNOF+WsW+J1KbTPsjzHiFc8IlTfz2z27Dh8P3vXTUMNyYVW18ET9w8FEA4MUCN0VQG1RRWHOSsr8ESpIlIi62yv2Wj1Q8hRDPhdmLNxX8Mq3NduyRjYBQO8ThtF1D6sRpPxssyESEzzb3qSwYhYlMR4nOP+yfW+dWe80vgYMnzVEM9w5MWy2sRl1OYOBxzDI8pPfIMtTrXiuyLrNlhf9LAFtr5USCl29PPDF3EDiie62PBKyv6zPzrgLHQZu7KbYOVqKhkPtrEQ2F0UV72Tcp3WcQi3n9y3CWs1NuUOY3Sy96kAJadom/cXzGKTgBsN/TFJttjOAd4RCsmGZi4/4PrqqNnNkMQnIK+KdlRWL71n5mNZVL8XSOXJ9mTyZW+nd6+ARjGX9ssCF/BezuMxXvdHy+fYOSTpVaVDDu2R9UsbYq8ph05P6VmMpQHImXfkp0OArI4YfFcZBdIMHWebKjQk/WHd5lFya1F8Ya1KSG4zwB8nm3QgPDorAMQ11/09zr2Pas1aGKm39fFy1bpjl8zuZ5/nb0soItLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199024)(1800799009)(186009)(6486002)(6506007)(6512007)(6666004)(966005)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(44832011)(6916009)(66476007)(316002)(41300700001)(66946007)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sVjXrEq03seTAfeX7+OyBZO6LXpsn3LjRSQdgRLi/CkmDmRpsqi6Be/B1r2L?=
 =?us-ascii?Q?hoKR+2sYUqBSuUBGKjQpGms2egqv/IwmkRJSMeG+XlslHVyB0NdL/fjFUDbI?=
 =?us-ascii?Q?CyrPzlXu9V9Oukk19YNnWmNfyLRV5mFpsPQFIRsw00sR3G0AIeqspUJQaOZs?=
 =?us-ascii?Q?lhLHpTm8JGgSGht8Zj+DEGFYpf6Zg4BvYAEDJVnprYLagcpee7ThymsB4HqT?=
 =?us-ascii?Q?s1B5+f+uiYEwjUn03FMCjXWiMRl7uy8iLk7rhh+ZiDbF2hatLU6IKFg6S8YM?=
 =?us-ascii?Q?WrB1actqeLUPtAKAz5Kim3rFbr/od5f5KRqApIzNThe9Ns9+GTXuA4qO3Na3?=
 =?us-ascii?Q?JpUYRF/uBHBFo6d5bZap//4cmUxYsRheZwCRWxsCOndUEeXq09/I5SIVkwKC?=
 =?us-ascii?Q?M3jehuf77CYu9Oj3DBONiFCcZp+6ielEyk+3vWuuxF98GanDmRoKmNwRmsJO?=
 =?us-ascii?Q?P4G/DNkv2p5855SqrCu4qB5Q2UmNDR2gyu9XllIIEdxYYMOSWryr464ViaS+?=
 =?us-ascii?Q?fI9XV8vJ6pWf6Wz/4PD2R05PFyBo2/LAV3oRTPmLeLkO1RvJEgGhPT3FDTh2?=
 =?us-ascii?Q?8AvSvgM79ahI1mxXM0BFk8LDkPpG551VyhBsbWNpGOu9ELp2YVKRbtmYlvUU?=
 =?us-ascii?Q?BbXKXTJylfNknAoE3osHGlgFgpzET1s4hxJbz4YniHgB1rttO/cW/JiAX4U0?=
 =?us-ascii?Q?wqBdiyfRkdumvp2LQNR4EjAXT5Y1zjhNlJYT+Cf4AGXIL8KYQ9uvqGx1/qlG?=
 =?us-ascii?Q?FF7wM8SRkFwSLprfon9Qf7dqZoB+DSe26TYWiQHEVqJEUA9WknMcIGvLiKwF?=
 =?us-ascii?Q?Ldew7LJcx8iOVRqEe9AmDZnGrWEWTkhiPygrYQhIqCIfkKUAK4aY+YNQzDlq?=
 =?us-ascii?Q?As2KqkPaXyf+9TAFVfy0/ezEJsUqZN4X743K+VOALKEjNSus0sXhyu6GZIsR?=
 =?us-ascii?Q?EujAcpSMcM6Vi4Lwzj1EPn9g2j1gXA5oG9mlJu4CU5K+sI8Hfrksej1GZ6SE?=
 =?us-ascii?Q?aq4CJV73qUl/3ny8v7GG7Q7JmG+WNzgBqjuVG68Wa2NSc4zCBx2qVTlYlz8P?=
 =?us-ascii?Q?blhIKxr2jA1T54BYZQ9pfQ32Jeknlb2Ld8IIB//8nGlIVh9WsnDgvNSObsDq?=
 =?us-ascii?Q?y6Fk7JEgP96Nt0TnCv8ciDn0Ft3U6IYTNGbEDdEkenp3EE7i6goOiIblYx29?=
 =?us-ascii?Q?/Pp3oaigBWpKzqSdtuMDKVnmax65Li31W4bBdp658gBo+I9HKj98GQHQwH7g?=
 =?us-ascii?Q?JoZk0rPm6P3A6RaV5PHk/lclnbxvjxTZSnFKzEo3fjC7IbmsP+Sm7EYPevyL?=
 =?us-ascii?Q?pJJWIy8lY0T2pU2GCm5wibmv6jCG6us+n0yB7GWKtMx75lCog8wAejJhOjJa?=
 =?us-ascii?Q?NkJhLmsBE3N+5IgaK0MywTCXAQ63BgjqAAc4SCSH0P9wusONV/+AqPHDez2c?=
 =?us-ascii?Q?R/IGOGhLR/ENN163d0M2ZNrVxP7eMF0EdfW7NUN+xFHHscxqZxGhhzW6a0as?=
 =?us-ascii?Q?dkYWep5AJrGVRu28xhj6I/pYrUGIh5LccSuVopX2WGjjVYrnBNAK2BfiPMMx?=
 =?us-ascii?Q?7lFRvIVvHr5WVtz+h5cdn62F/RLckvEFfk9Ido0CSraMv5xRQnN7wR+lxseC?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ce1587-96bd-44bb-32d6-08dbab1a9a60
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 18:38:15.7492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RutqmC+aopMPkWaJFpBCeO26qo+xSmUpUs+U8lDKJMVwFsx7ZoQzE/L7SpJ3mLxEe67ezL95rrK76KdczOj72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
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
Cc: seanpaul@chromium.org, intel-gfx@lists.freedesktop.org,
 Gil Dekel <gildekel@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 05:41:37PM -0400, Lyude Paul wrote:
> Other then the name typo (s/Pual/Paul):
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com> (just since I co-authored
> things~)

I believe having the Co-developed-by: in the patches that you helped
out would be nice.

> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> I think we definitely want to make sure we get intel's opinions on this
> though, especially regarding the usage of link-status. I think we're close
> enough to link-status's intended purpose, but I definitely would like to know
> what others think about that since userspace will definitely have to handle
> situations like this a bit differently than with SST.
> 
> Also - definitely make sure you take a look at Imre's patch series that's
> currently on the list (I just finished reviewing it), since it adds some
> things to the helpers that might end up being useful here :)
> 
> https://patchwork.freedesktop.org/series/122589/
> 
> On Thu, 2023-08-24 at 16:50 -0400, Gil Dekel wrote:
> > Next version of https://patchwork.freedesktop.org/series/122850/
> > 
> > v4:
> >   Another blunder. I uploaded the patches from my ChromeiumOS kernel dev repo
> >   instead of drm-tip/drm-tip. Apologies for the noise :(
> > 
> > v3:
> >   Still learning the ropes of upstream workflow. Apologies for mucking up v2.
> >   This is just a re-upload.
> > 
> > v2:
> >   Reorganize into:
> >   1) Add for final failure state for SST and MST link training fallback.
> >   2) Add a DRM helper for setting downstream MST ports' link-status state.
> >   3) Make handling SST and MST connectors simpler via intel_dp.
> >   4) Update link-status for downstream MST ports.
> >   5) Emit a uevent with the "link-status" trigger property.
> > 
> > v1:
> > Currently, when link training fails after all fallback values have been
> > exhausted, the i915 driver seizes to send uevents to userspace. This leave
> > userspace thinking that the last passing atomic commit was successful, and that
> > all connectors (displays) are connected and operational, when in fact, the last
> > link failed to train and the displays remain dark. This manifests as "zombie"
> > displays in userspace, in which users observe the displays appear in their
> > display settings page, but they are dark and unresponsive.
> > 
> > Since, at the time of writing, MST link training fallback is not implemented,
> > failing MST link training is a significantly more common case then a complete
> > SST link training failure. And with users using MST hubs more than ever to
> > connect multiple displays via their USB-C ports we observe this case often.
> > 
> > This patchset series suggest a solution, in which a final failure state is
> > defined. In this final state, the connector's bit rate capabilities, namely
> > max_link_rate and max_link_lane_count, are set to 0. This effectively set the
> > connector's bandwidth to 0Gbps, thus causing all its modes to be pruned in the
> > following connector probing.
> > 
> > Next, with this state defined, we emit a link-status=Bad uevent. The next time
> > userspace probes the connector, it should recognize that the connector has no
> > modes and ignore it since it is in a bad state.
> > 
> > I am aware that always sending a uevent and never stopping may result in some
> > userspaces having their expectations broken and enter an infinite loop of
> > modesets and link-training attempts. However, per DRM link-status spec:
> > ```
> >  * link-status:
> >  *      Connector link-status property to indicate the status of link. The
> >  *      default value of link-status is "GOOD". If something fails during or
> >  *      after modeset, the kernel driver may set this to "BAD" and issue a
> >  *      hotplug uevent. Drivers should update this value using
> >  *      drm_connector_set_link_status_property().
> >  *
> >  *      When user-space receives the hotplug uevent and detects a "BAD"
> >  *      link-status, the sink doesn't receive pixels anymore (e.g. the screen
> >  *      becomes completely black). The list of available modes may have
> >  *      changed. User-space is expected to pick a new mode if the current one
> >  *      has disappeared and perform a new modeset with link-status set to
> >  *      "GOOD" to re-enable the connector.
> > ```
> > (form drivers/gpu/drm/drm_connector.c - DOC: standard connector properties)
> > 
> > it seems reasonable to assume that the suggested state is an extension of the
> > spec's guidelines, in which the next new mode userspace picks for a connector
> > with no modes is - none, thus breaking the cycle of failed link-training
> > attempts.
> > 
> > I suspect that, maybe, zeroing out the bit rate capabilities is not the right
> > way to go, and perhaps marking the connector as disconnected instead may be a
> > better solution. However, if marking a connector disconnected is the way to go,
> > We will have to iterate over all MST ports in the MST case and mark the spawned
> > connectors as disconnected as well.
> 
> I -think- this is probably fine, that's likely how I'd 
> 
> > 
> > As a final note I should add that this approach was tested with ChromeOS as
> > userspace, and we observed that the zombie displays stop showing up once the
> > connectors are pruned of all their modes and are ignored by userspace.
> > 
> > For your consideration and guidance.
> > Thanks,
> > 
> > Gil Dekel (6):
> >   drm/i915/dp_link_training: Add a final failing state to link training
> >     fallback
> >   drm/i915/dp_link_training: Add a final failing state to link training
> >     fallback for MST
> >   drm/dp_mst: Add drm_dp_set_mst_topology_link_status()
> >   drm/i915: Move DP modeset_retry_work into intel_dp
> >   drm/i915/dp_link_training: Set all downstream MST ports to BAD before
> >     retrying
> >   drm/i915/dp_link_training: Emit a link-status=Bad uevent with trigger
> >     property
> > 
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++
> >  drivers/gpu/drm/i915/display/intel_display.c  | 14 +++-
> >  .../drm/i915/display/intel_display_types.h    |  6 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c       | 75 ++++++++++++-------
> >  drivers/gpu/drm/i915/display/intel_dp.h       |  2 +-
> >  .../drm/i915/display/intel_dp_link_training.c | 11 ++-
> >  include/drm/display/drm_dp_mst_helper.h       |  3 +
> >  7 files changed, 110 insertions(+), 40 deletions(-)
> > 
> > --
> > Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
> > 
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 
