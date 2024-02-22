Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159E860215
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E3610E05B;
	Thu, 22 Feb 2024 19:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5JzAda7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427310E05B;
 Thu, 22 Feb 2024 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708628671; x=1740164671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=73ElRo4lF93A+27Biniw496iyw41keRaf8I5SZVeyjE=;
 b=I5JzAda7BBkSw8NmheAXT1IWc5WH5Z65hS7mt7b7fd7G5T/vJ0GpuQPI
 qbqt87wUSrpdt/vSQLDBp8SP/kYwd7dYToKKWFb6ITunISYWzIGlaG9mO
 7UN6xGTF4obXTBT/kQ+BsM+lL7iLxUx2q+5Sw8KMXECs5zebtpr8tq5xt
 2cXALpQLIThYevN8yjDTiWF7u2jjYleHwZPv1pp8YaGzf0/hBRiwd4bII
 pnUm3FgG+feQLjqPDxervXrAh5EDw6X+VnbmUD0+IsOTExipd+1Gljrzv
 +oHfHPCZKUACx6Q04NF07uFM046EUHmb4o1QEo34EZbFyyHCHyBK3hxM7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20319469"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="20319469"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913571846"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913571846"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 11:04:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 11:04:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 11:04:29 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 11:04:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKRWQhQTATSo8jTRL2KNnfMNhzMku33gzJ4UT4+5AP0aDHXaXv7Pv9ySxZEph8VXNZEAFK7KQAsHozldRbUzmvfNKUzs9J8vkzJq+rKvpoPlwwJbnl7xl+9SYYer0BaJv3ButIgGQxa2dqL0XfXgR5ynJSRtBCyTPeadDofiUkpol9Ej9UpBXz0hbbZt4hbQp3V/TNNhXdSxK1cOdG5hwbko+LbkI0MQDRozi0muJuPaoNAXapj2g1Ah1YPOUb6PER6CNTNvY+xqjcCkyz+kLPB47evmoaZtYQsHNMAnhdWNeBy3U/02/cdiBii2kQE53wwkIF+dXoHBSjDQty8bZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc7vuesb8XOwyXKMk1Sz1+AODY+wMS7GmaoW3cXpe0s=;
 b=KRTaRmjpP6ao9u11zNWDxKNmvXislCslRYUuKa56zSXQWNVi/mBn23b+50B/4o80ZRHpQQ6x3y946y8170qWyIxwGBULKsUXbACuw+7uCPyUTRMnTwSEHX02OW72Wu4nImMkQrF3ghfDmjVNRbyxyZsBMr6kYhX+kurk+FqZI5No4tgC9p5vpdlviEjEXOtw3RnzkDTeAYnn7PX1uK1HR7CZPsHBq+cW2hGAh5xFPBXkz1tThk8i3ehSvMSwy8h7C1oMTe2/aear2Da6me8O1yGapJeLT509tnZGpuUBsgJOULuCXYHDlL7TPmj4oTWNuDtPDIVlFYNc2bDqBZFRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 19:04:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 19:04:26 +0000
Date: Thu, 22 Feb 2024 14:04:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/i915: Add missing ; to __assign_str() macros in
 tracepoint code
Message-ID: <ZdeatNbtahdEWMXV@intel.com>
References: <20240222133057.2af72a19@gandalf.local.home>
 <20240222134349.1e9a155d@gandalf.local.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240222134349.1e9a155d@gandalf.local.home>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d89527-4c65-448e-52dd-08dc33d9168a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mq9XQ20NrPV4jOCDezGXaUglFUqVEzoOxvQrHsAd7vHb2T6Fx4bS0xmMSJancpX9AMPjdmTrym7OkghUT4wua6GF6JUUyQWNbDFv5I3r7fnzvoGoCVgFMC2cJqkQWWsPVO8JtfJzz7FKV184Un/Ayz7P3p1osgjFsF8iyS93aob4GdJ9Ryr3UHhcKg9wUfpSw+P49Nw8xkHWEBcA49EcRKF3JezCITv9orPBVtUJ5cXiEkLBFvJsVDQVcSvUD3BvkV2u6BFq+UpeK/eI7PyJj726iUBEfCYw1erXQ0AXaAG43/OWVZqi27f5HeMf4oiUjAreg+YFfHLdfPRoevEmGmF78DclEWsy6JK22ieFJSnzhXADQIC3bc5/Q+FyVsN8p8yLbkzQIv8TvYlShUrjDvKWOgWfX9HRJwk/fl5uhjs70PH2Z+QEoAgyticHOhL/0Bm6numqFksXe/aAnVN2LkKvizd31L2exKkK3zkRc+RnTIbRBsVMNf8rABL8oklwTbCPjs3fm2GbUY/jwLdYDo3ROCsCbW9bXBhRMP+KUB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//sUaXM2PzJIw57dOYDp3biMvcY17LqdhtanznoKv7LbyPXVyiF4IuGBlsXk?=
 =?us-ascii?Q?k/jtLaBj4m5Q7INQTaCkoVNqw2mmOv+FDHUQYMje0zvrFpgzdDcHeqbeynXZ?=
 =?us-ascii?Q?um281748MEFkCnA5bsAqrynB60My+C17fZ8SvluI55niS6fYcBdx4uvqvfJa?=
 =?us-ascii?Q?23HpRx53war4kMudiK2oCLabJpa/QwvNHW7f3cMA1SlcJN4fRpgsyxmFYwRG?=
 =?us-ascii?Q?wEu25/lg13GrW1wAP1NcJ0OVdQ5qNlDX6BwGikgvPrzaxdgFyj80BGpPH7pn?=
 =?us-ascii?Q?a3oW87zZ3Rl0+dugL4thN5lwCzkf32lJHLP7TbGNvQ/uScoM7sSiklS0xAwV?=
 =?us-ascii?Q?Rh1AefZ+fg3B2VAFC3/sMT9oII5JHBM1zTBVUKVKtCkcCu/XhgVy6lcaGwf7?=
 =?us-ascii?Q?usdPm2xUyLDe1ZElwTeCAPBy8fPf2hVER1aRd+x+dFZWrTbQ5VhF4i6HnX2U?=
 =?us-ascii?Q?DSiJdp+etCPUlKowqFrKtM7pTjacDVv14xonT6kaysrUj4SIWYQLpDhW7lkY?=
 =?us-ascii?Q?E2fN1cr4k4vxBr0pwq9lkgS43yy4KB8bg03t0fF5CWQuOGM+Ogfqo82QE8gv?=
 =?us-ascii?Q?dv7bhLWGsYIW60jiUx5n/3t6JUPtu9nJPFmRvRmueaypi+xqucdOtZxV84Mj?=
 =?us-ascii?Q?51ZAqx4p2Vv/HYoQ6Kqb/QO6NrwN5Ls8mejttpH6Lx3MC5ok0jnS2ddWXFbg?=
 =?us-ascii?Q?puw9kcQ8PWqCErZbjgaXTCuYIZFI0TPZyTJRo5f8iNQQhOXgu2hmaBdqV6e+?=
 =?us-ascii?Q?mtnLNhIp/WSpFC6l8YOPy5yWrwAIvYuTQdLyYjUL7cfibEsCBmJlhbxNYLaf?=
 =?us-ascii?Q?fPt5A8Zzk+Q6etnHUQzVk4H+wImeL574HT95MNUvaToQqxEPNVPS3XMfhtoP?=
 =?us-ascii?Q?bKwqnFJWdE0zsy5RdW+SleFgUyy/xA/wU/DvN/dYm66LuWAOosoPg3M4GrGQ?=
 =?us-ascii?Q?j62PF+BlqvPI2konjl3gRUkeDQqVu1IFhp4u5t0x+mtM5KonFZeVRxyoLnF/?=
 =?us-ascii?Q?WNofPkFFxnQxp5o4nwJqOid61VWtHFqZeKcqq2OSEOLd5CJ7BkrJhEApn3hO?=
 =?us-ascii?Q?q1ew/65MdSp94LXM/KrvQWCZfUJv1Qofci4ygUXQcnY9nEu4H5QB1CzA1y1v?=
 =?us-ascii?Q?ye+yfdvSHYZv9ByJLlSXw9DYdA6jD10c7iJD/oZISGQyszFrSPkYRJsPJQsB?=
 =?us-ascii?Q?QoADIBlPzbKxDxOJrQdvFJpSeApRemfFIWHtAu4mDyBeI3jGoiCzrNtg53DR?=
 =?us-ascii?Q?AYNi8snQfaCfYANZP2ZGDexUEfdGhgBVF0OKTujDAoiaV1YrkH1CFMIyrfFC?=
 =?us-ascii?Q?BFDzZJTPFrdyw/xBzvNMeSbryPbyeJMbMuVgBPge8wwRYfNhW6RtI3f7K9P9?=
 =?us-ascii?Q?yPU8s5PXUU827+htb75vAVKi/UNQHJtHPbwA6K1APpFYOocHorl5IKzL5czK?=
 =?us-ascii?Q?dpQIWQGuz+VmssHB1+01k90LMNX8y23lTVFITjYYaXqlRmwehcKR2/Barb4H?=
 =?us-ascii?Q?ksvmfj0sZe6/PcyxsjAUVxwEOWuPl9W6ne/SwbTMlKlT1K0X+wJqJt7WLv9F?=
 =?us-ascii?Q?rSgSllJTnol6tu46D2QDUH1EOEk5tbElEiDrJ9b9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d89527-4c65-448e-52dd-08dc33d9168a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 19:04:26.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsS0pnmxylcpyvMoTDVDA/8SH3cZZ/OeLiSkZZg9c88/SffknyHe2qnCj+zUFQd8ByCtzcac1K790b7kJCVbhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 22, 2024 at 01:43:49PM -0500, Steven Rostedt wrote:
> On Thu, 22 Feb 2024 13:30:57 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > 
> > I'm working on improving the __assign_str() and __string() macros to be
> > more efficient, and removed some unneeded semicolons. This triggered a bug
> > in the build as some of the __assign_str() macros in intel_display_trace
> > was missing a terminating semicolon.
> > 
> > Fixes: 2ceea5d88048b ("drm/i915: Print plane name in fbc tracepoints")
> > Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > ---
> 
> Note, I have patches that depend on this fix, so if one of the maintainers
> would like to just give me an "Acked-by", I'll take it through my tree. I
> doubt it will have any conflicts, unless you are planning on changing the
> given effected events.

since it is not breaking builds on our side and the conflicts, if any, would
be minimal, feel free to take this trough your tree

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> -- Steve
