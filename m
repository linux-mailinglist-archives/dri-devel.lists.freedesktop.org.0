Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D1790263
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 21:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E96310E1FE;
	Fri,  1 Sep 2023 19:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EF210E1F9;
 Fri,  1 Sep 2023 19:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693595141; x=1725131141;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=97NXU8N2tMP9Ttgi6rzzDTXMbeM9oqz2E8asnPHvluE=;
 b=hnAu/BVqkCzK4gr9YdEkjW/MfidKxawvbvdMp2r3OzK8/z9wzW45KTPE
 jj0bKIHOKsY7AuLchjw3+ffk60uxoKDOgi83kkZdNK6GUrvjEbXusg27p
 hh6AeJvI2x+z13y4h4rq8DCaM/UeHmO2TU4sxHJDZlasXBKxnK0phzS3b
 6D4MkZZNq1M8zZzGHGmQ/JbvPBa2RcuUuQvD0taCZ0E1BDOhxiTB8McNm
 zxtYLXOKPwuLEPIblQJjyX5Qs+iH7HnV5tLBb/XR2OG7VoWHx4efJ2DHF
 ZQP5evtlciltRIV0EvBbxYZOQv3JB3ex14PNJy+OQJ40IeTlhMjNWI6Z9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407283002"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="407283002"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 12:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="775097555"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="775097555"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 12:05:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 12:05:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 12:05:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 12:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBieZXR11RkbCdvKcIzl59Dnen84ccfHxzwflHsdXd/FocwYq5IaWFEX+WeytO+6weSfgw6GzpPmyfYC0iAFUv/FrZvBERpTbCOvwI72FQ33DVYWiO4Rwm6zsbg5F7c1ItnUyZ4qWifcebn2xjY0MP7SBl5EzhO0tuIUkAG+LpnB/s+NoqcYLzlSug0HNF20dQ4RxUdd2hSm8tqvRbyXyAShYu/Ry7UiJXlnNWzIXCHeWXo+o4BSrgcBN6jTI8vd9FElXvat3m58X2cXgEPNxLUaCUmVTV5oQDIfeIaMsRO3EHbzAo3neuqrGOPQ1WAXrfXa3lVXJoVt08HLpLUftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awKlTcnLql4BdDIJBCPIalx5oXH6JA030ncAhDv5wfw=;
 b=dOi/+k8V6t4VpWKfEMKoZaaPRsp/9WFbHlZhHKkh8Z0hQNSSBVeT1hFlNX9tSvL6fK8Si5krKOCPnSVDQD0LpYYoxfEb5jHWFQaXLJZoDBvF/35hqDraGBoOLU+kvqDvNnny2a0whcc6OF2OZXX6j3cSE3911uD3EwUyLuaNIf++zpEhyFZyobzX6Sbyvs8PfeIg1TDE2mKzXKd45Oo9Is/IrALuwPy7A8eSsntq7LNyLVb6fqMzovrMllS6AtTLeED80NmppdYeurJYn/bKF+oI/9HppEtq3WWPo1Y92ofrQYzcLWq3HkDMZ3+Kk1qNvAhqNaG8scpdkD94JGshaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 19:05:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 19:05:27 +0000
Date: Fri, 1 Sep 2023 15:05:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>, Imre
 <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 0/6] drm/i915/dp_link_training: Define a
 final failure state when link training fails
Message-ID: <ZPI18me/Qxf07UWo@intel.com>
References: <20230824205335.500163-1-gildekel@chromium.org>
 <06b50235b6bb02d0774fe0bdf5186ab999c0940a.camel@redhat.com>
 <ZPIvk08uB4Zg57ED@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPIvk08uB4Zg57ED@intel.com>
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 201371d4-1908-4461-991b-08dbab1e676f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3GieUiP7izq4vBLTzslrTUSoF0pU8OoFSDJ8YmPhYp7YhoA+D0JpdXAXSxv2/xwSXMDhDQi/ki/LUBmLfZG1UooxpXcu6cyJLzy7ynenTnWU7rk6NlF+fvkvQkTkLrKlvWH1/jGMI1jnTx4O2SluTTFE6owzr7Yux6xoaldEXie+gXanv7N9SbHUIBhEbizdR86MTGXWvksVmFh59kPjmbDifl2pL1PA4fPa8uOWQso6CIvmIKkaq2Nd4qNnxfThDctskfZrBSwnikEQ6aeCQpHxLvWis0IBC63vyj+lToWNOBW5RP+mE5WKzjZCtYF19iy5HZtHZEsijKFCs8ftMEqKu3aBlJxRiLwIUL2kBpvo8DN3JxqTNPJRrWDMS9wSC2l9DHkoLtQKaMZ34sZFjK1fC89Z2DF+R4csY5rrPyU1/lVr/VfFcHm0at3we5BMSFMNX2IZtyrVnqi/O3cdOuQuMmRQIwLJg/ITRSLdyCUECcgHPkVkXryq7Cp0B8sCRusZAxkdXavTPTO4qkG9+U1hbfoukIzI9RGaxcrljlgI+IENJI2OU+SmBEH8tWCPqWhXufTPgvanIwhGj4ceww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(186009)(1800799009)(451199024)(6512007)(6506007)(6486002)(6666004)(26005)(83380400001)(966005)(2906002)(478600001)(41300700001)(44832011)(2616005)(316002)(8936002)(8676002)(66476007)(6636002)(5660300002)(66946007)(4326008)(110136005)(36756003)(86362001)(82960400001)(38100700002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ck8azPIcve9Rmk2Wg5SA8VYHpL3/gMCN0zVuzhVBxNatr8Cp15iVY+B93Zot?=
 =?us-ascii?Q?AAdBe7o7rfPTjM4qznsaggwUsfhZ7eY8myDNN8xIl4ARUIuXph712mLl2/NM?=
 =?us-ascii?Q?VUc096pxkL9A7rUh24ciUur5h2ziRRB6bb1faVdi2EAv/jj8q4dt66bqNN+I?=
 =?us-ascii?Q?vpcR7ORnormUKXNXegnPKyfXfLYxPtUM0mBvTL+QQGa47ToETsnw9SetOuaV?=
 =?us-ascii?Q?MWSch6bFwEe2+BbbNa4xbRj07fY8RVveGgpjhsE5WBVRcC+QxPsEnvyXwj9e?=
 =?us-ascii?Q?2tB/1SEXEz4rLijadRZaRzJC0L+a4T6+NZKUHnDyDflC/shwcKcZqxJeTZJk?=
 =?us-ascii?Q?bj6OsbkFur24EYi90XYiJtAughfc1t3aKPrOxRpNhkETT/y/J/wMU2PJkJE7?=
 =?us-ascii?Q?gRgikd3RCjST99e8oZH0HaO9bHmS9aE6+sfkLbpanfWM4pdivbUvno3lUMz1?=
 =?us-ascii?Q?TQbWhIYhJqq4kWT2CtN17Sa9lt3aXPjFi9OiMdMX45NgPzLAlN6iryKjq7HA?=
 =?us-ascii?Q?IMsqy7cAy5ZAxSJ4Z3wAMe4hylu5wfCU8E/sQyA1VSU6MD/n2T+IZiOaNCC3?=
 =?us-ascii?Q?saaWPqlX/+F9h6f8AcH8gTkvTpEac4bj72Xh5agUrIj7x3CWyBFAM0/m/k45?=
 =?us-ascii?Q?eTGWdDcc2fc2slRhYjAKujwQMQJfvIeYkwk+XgvpNena6OAkvOas1AgsWnPx?=
 =?us-ascii?Q?Mp5Z7K32nE0TaFYBRGY2wAtrytSZmoFJUSxbXtcajTHvdnWo2QwEYfs/OY9G?=
 =?us-ascii?Q?19QK/UqIOZD6PwrXAKnZc2LyChig5wO6Pjssd+U9KSTXTdf5fRA1GqmXJzGZ?=
 =?us-ascii?Q?t8RMi3Ebkfo04HgU5QNNoFd+Q8J0JHF5P2ZAny/62GCc0tAtHf0ASWeGnK51?=
 =?us-ascii?Q?aFwy7xT12FytixwrvxzK0CtCLpcuTNAR6W8iJEGgtkNqUfQ2hNTtTBpc32Uo?=
 =?us-ascii?Q?MG5pz6JlwuPrQjSGNWOaUNKSS7tBXFAZAT00tNZXktVN1LxGhRtoZkfkw4Tu?=
 =?us-ascii?Q?CQcSn2BDrOqWI4h9TAJec3pILyMChs9gijQ9GVyBJUjYnYh/AfkJbYWRQ16S?=
 =?us-ascii?Q?lf/j4IpFbemQEpoNGe/dutA46qNX3xK7Ym7NXIYPnVelnYu3mMhLWqnGdUSz?=
 =?us-ascii?Q?NKdmHVsVvKP7nBJTZOJCOhLz7A3MDFuK1Il8RoDOd43d3NYW83BIEYRoRxwz?=
 =?us-ascii?Q?BEAfaOGVuXHYnEs9rXZjdCbXQrd/yiXDrue9w5OJDtlowVN9W49aZ1yjq3Hq?=
 =?us-ascii?Q?PaYB+HcBoo/aePeV3pYu2aFP92Yd+hiXgSqYVxpEqpa1PJHDN7scp3UtLs3O?=
 =?us-ascii?Q?CWYVU0rYwykucswBb1clx5byOuF/8oL3qvFoViZvUWhan1TOmJ89cyehHdX2?=
 =?us-ascii?Q?iMZEo8ojZ3Qn8aq6IH09aFbF/D+M9ZDd5wJDb7mnzZSc+5kprPvzp0aWO84w?=
 =?us-ascii?Q?tv+eNoylzTI+Q4qJeEaC8baAlCK/99yF+bV4FDlPuP8A/Ba/uM95hV0o4gsX?=
 =?us-ascii?Q?RDT9ShWjwKmCnNS2SwGVpaPXZoNDaycAyqpnSg6S9+yhhQ+5/p7TvG/NPz2U?=
 =?us-ascii?Q?EzrVrXQS4m3KvrF/6wwwdIztFTIRbKzU7+2UzgzAxDwsZVPMrLhI8KYbwDH8?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 201371d4-1908-4461-991b-08dbab1e676f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 19:05:27.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZhychHMhUX1ghIh8/ZW15LTuTYhmNI8KLFQIjqjumdMk1Fsx/37XpaOr8N357ZHFBr45vUfBCNnPJcpaoMQuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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
Cc: Gil Dekel <gildekel@chromium.org>, intel-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 02:38:11PM -0400, Rodrigo Vivi wrote:
> On Wed, Aug 30, 2023 at 05:41:37PM -0400, Lyude Paul wrote:
> > Other then the name typo (s/Pual/Paul):
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com> (just since I co-authored
> > things~)
> 
> I believe having the Co-developed-by: in the patches that you helped
> out would be nice.
> 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > I think we definitely want to make sure we get intel's opinions on this
> > though, especially regarding the usage of link-status. I think we're close
> > enough to link-status's intended purpose, but I definitely would like to know
> > what others think about that since userspace will definitely have to handle
> > situations like this a bit differently than with SST.

I'd like to get Jani, or Ville, or Imre's eyes here. I believe this
series has a good potential to solve some bad lingering MST issues,
but I'm indeed concerned with the impact on depending on userspace
behavior here.

(Besides that potential dead-lock...)

> > 
> > Also - definitely make sure you take a look at Imre's patch series that's
> > currently on the list (I just finished reviewing it), since it adds some
> > things to the helpers that might end up being useful here :)
> > 
> > https://patchwork.freedesktop.org/series/122589/
> > 
> > On Thu, 2023-08-24 at 16:50 -0400, Gil Dekel wrote:
> > > Next version of https://patchwork.freedesktop.org/series/122850/
> > > 
> > > v4:
> > >   Another blunder. I uploaded the patches from my ChromeiumOS kernel dev repo
> > >   instead of drm-tip/drm-tip. Apologies for the noise :(
> > > 
> > > v3:
> > >   Still learning the ropes of upstream workflow. Apologies for mucking up v2.
> > >   This is just a re-upload.
> > > 
> > > v2:
> > >   Reorganize into:
> > >   1) Add for final failure state for SST and MST link training fallback.
> > >   2) Add a DRM helper for setting downstream MST ports' link-status state.
> > >   3) Make handling SST and MST connectors simpler via intel_dp.
> > >   4) Update link-status for downstream MST ports.
> > >   5) Emit a uevent with the "link-status" trigger property.
> > > 
> > > v1:
> > > Currently, when link training fails after all fallback values have been
> > > exhausted, the i915 driver seizes to send uevents to userspace. This leave
> > > userspace thinking that the last passing atomic commit was successful, and that
> > > all connectors (displays) are connected and operational, when in fact, the last
> > > link failed to train and the displays remain dark. This manifests as "zombie"
> > > displays in userspace, in which users observe the displays appear in their
> > > display settings page, but they are dark and unresponsive.
> > > 
> > > Since, at the time of writing, MST link training fallback is not implemented,
> > > failing MST link training is a significantly more common case then a complete
> > > SST link training failure. And with users using MST hubs more than ever to
> > > connect multiple displays via their USB-C ports we observe this case often.
> > > 
> > > This patchset series suggest a solution, in which a final failure state is
> > > defined. In this final state, the connector's bit rate capabilities, namely
> > > max_link_rate and max_link_lane_count, are set to 0. This effectively set the
> > > connector's bandwidth to 0Gbps, thus causing all its modes to be pruned in the
> > > following connector probing.
> > > 
> > > Next, with this state defined, we emit a link-status=Bad uevent. The next time
> > > userspace probes the connector, it should recognize that the connector has no
> > > modes and ignore it since it is in a bad state.
> > > 
> > > I am aware that always sending a uevent and never stopping may result in some
> > > userspaces having their expectations broken and enter an infinite loop of
> > > modesets and link-training attempts. However, per DRM link-status spec:
> > > ```
> > >  * link-status:
> > >  *      Connector link-status property to indicate the status of link. The
> > >  *      default value of link-status is "GOOD". If something fails during or
> > >  *      after modeset, the kernel driver may set this to "BAD" and issue a
> > >  *      hotplug uevent. Drivers should update this value using
> > >  *      drm_connector_set_link_status_property().
> > >  *
> > >  *      When user-space receives the hotplug uevent and detects a "BAD"
> > >  *      link-status, the sink doesn't receive pixels anymore (e.g. the screen
> > >  *      becomes completely black). The list of available modes may have
> > >  *      changed. User-space is expected to pick a new mode if the current one
> > >  *      has disappeared and perform a new modeset with link-status set to
> > >  *      "GOOD" to re-enable the connector.
> > > ```
> > > (form drivers/gpu/drm/drm_connector.c - DOC: standard connector properties)
> > > 
> > > it seems reasonable to assume that the suggested state is an extension of the
> > > spec's guidelines, in which the next new mode userspace picks for a connector
> > > with no modes is - none, thus breaking the cycle of failed link-training
> > > attempts.
> > > 
> > > I suspect that, maybe, zeroing out the bit rate capabilities is not the right
> > > way to go, and perhaps marking the connector as disconnected instead may be a
> > > better solution. However, if marking a connector disconnected is the way to go,
> > > We will have to iterate over all MST ports in the MST case and mark the spawned
> > > connectors as disconnected as well.
> > 
> > I -think- this is probably fine, that's likely how I'd 
> > 
> > > 
> > > As a final note I should add that this approach was tested with ChromeOS as
> > > userspace, and we observed that the zombie displays stop showing up once the
> > > connectors are pruned of all their modes and are ignored by userspace.
> > > 
> > > For your consideration and guidance.
> > > Thanks,
> > > 
> > > Gil Dekel (6):
> > >   drm/i915/dp_link_training: Add a final failing state to link training
> > >     fallback
> > >   drm/i915/dp_link_training: Add a final failing state to link training
> > >     fallback for MST
> > >   drm/dp_mst: Add drm_dp_set_mst_topology_link_status()
> > >   drm/i915: Move DP modeset_retry_work into intel_dp
> > >   drm/i915/dp_link_training: Set all downstream MST ports to BAD before
> > >     retrying
> > >   drm/i915/dp_link_training: Emit a link-status=Bad uevent with trigger
> > >     property
> > > 
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++
> > >  drivers/gpu/drm/i915/display/intel_display.c  | 14 +++-
> > >  .../drm/i915/display/intel_display_types.h    |  6 +-
> > >  drivers/gpu/drm/i915/display/intel_dp.c       | 75 ++++++++++++-------
> > >  drivers/gpu/drm/i915/display/intel_dp.h       |  2 +-
> > >  .../drm/i915/display/intel_dp_link_training.c | 11 ++-
> > >  include/drm/display/drm_dp_mst_helper.h       |  3 +
> > >  7 files changed, 110 insertions(+), 40 deletions(-)
> > > 
> > > --
> > > Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
> > > 
> > 
> > -- 
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
