Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A058B0E5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 22:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EE4B2981;
	Fri,  5 Aug 2022 20:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E502AB417F;
 Fri,  5 Aug 2022 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659731982; x=1691267982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pMckYe5w3qBVlWB8Nn7jiImNdeu6QomJ+5JO65bhiJE=;
 b=Vu6BJWBsU+6Eii8OwH+2+BMt/IIKdv4qJrUemDK6guG17YMxtAsUTOrZ
 qRBaN5Te2E1jYkTBXFJL6z9SIoTSsajClaFfL/BFj6DMPj61Zf/OBtpsv
 xG8fpn5inciOWgwUxR5V9XEmFierP8MUyK1tGDCa6Rh1aqjAbYW00MYUM
 ntnOOalPnl2nfe8DfmJLnpU/8dlN7wENYwiMstju7Ik04RIq5kBN2G1nc
 5aEIeDGI5YGMxNWKUAIAZlgDi+I96hsAI9pkTaQAPR/Z5d7UFMPAfTKJW
 x9yQKSi6vagodNiBM++y022rQ7u0CWMdVAd8LO5qRf+8WbI9QD2LSk3Ww A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="277210091"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="277210091"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 13:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="931356116"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2022 13:39:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 13:39:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 13:39:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 5 Aug 2022 13:39:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 5 Aug 2022 13:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyMA2naQSj60aBPKj+ofp4pcob9MVqETSNvbs+DrkQUilBZdlMlpqt7lS5aumc9BpLnL7g/CIwPjzutJI7s1ty8HfiBbqgsQ9w+yKA7Sb0Qr2dOlJKq0A6ZHhg/lZC49be0Uk4CvP8iTGA33LaYIsyRVqmtDN48FDuahaFrFCit1dqEc2aVoOLaCXHVb9FyVUL+HrqbA2MTFqVVBuLZC3ETKWtfHYa6asQyz7JT5njLvYhkWRDK9m4gIo2BpzV/udB0REcS8mSHzbt2K+g1/VStdTO5cdm8bAIAEktuUITJ9fOUEwWUSs4PdZ7s7mgooDOzRSOGmUwBFCn+TbP42QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1d7JChlt+vXsP9OYlbVaExvFRa8GVLJg+kmhkBs4vg=;
 b=EDy3b9BMu/Uh7/xFbD+keZ0AKNXzoX0p91siofBpuHbUNFrDA+QrXLvnWci8l4Aq7Wezj1xDtFzKvqEax9wOxtu+XSvGFTEJMEPZ6iwOY3eiwPT1Gf2n9i6inH1PgjCLaqJgfZeVXGiEdn3AzME4XpB/C0MbLaFgpyE+MxAww7pEEYplwQOWiWsjN7qaAFNHaB+8edluoqC5JBFTIWjVKTfABdWciRDdGh6KjDmusIlpyKQm/QcMyKUUASFZ/i6oJjLQJ68d3BaT/VR5ZtlzfIavkI7XWvHlDilYRPb1jtkKZGIxoyp2rLnl2yCg1IUSIZ58dbZuTs8kU6q0bFplew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 20:39:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 20:39:34 +0000
Date: Fri, 5 Aug 2022 16:39:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next-fixes
Message-ID: <Yu2AAXhotddopWqE@intel.com>
References: <YuwC0s6khQsun32+@intel.com>
 <20220805104642.0f0e1410@maurocar-mobl2>
 <Yu0rsGnxcFmvzSPi@intel.com>
 <20220805172543.1cdcd58a@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220805172543.1cdcd58a@maurocar-mobl2>
X-ClientProxiedBy: SJ0PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cebdbd58-cf87-409e-57c7-08da77229ad4
X-MS-TrafficTypeDiagnostic: MN0PR11MB6088:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpG0R+TdIcpjTDVkE7PJVl0SW9jIyeG67BINGXoEzdPOa0183lEKGxeLRUleQ0LqHfjPW1ui9ZnUdM+RzOnSsNntdMX8GNrQqb6d+v140qyckq2V60pyUCZu+PFyv2uTATCb4YG2ejfEL9yNA0p3h1GuPLdDbpIhKYL83r8yFwGsWL6WbMDbSLD7+4stveKA/3vgDID4WeSCk+D0SLHhOI4DJGoFNAPyqxmjZWVbQuTD4fDrUHHXAZFMbvaRHR9GbIH6UZTir6dYx4tMRY2ZN4F+ujKHILWrHSffayKbdlPDuTJHVjVBdMX9SqLzNoiga004m9Le5xw5Ra48gtANuVHXK20FANOCyd0zXUI8O51GZaYvUZb4YQOVgPY62smGZS+xvkwWEl1G50Wv+sLcGk99XKYIVPx+GPMr1iNtDwM0lJMeadaN8KM0XOH7X8yeq6kr0B3hdzO1QRc3xfWPULjv8oeVu+YnyRi/E3vXC67oLyj6Dfo4tyB5xjCFgVKTMY8B+j+2aMHGQ5QCPQGDamNu/iuuYxdrBH7NIVQNWa+qWQ19reEsecyk462cMSaG3usr05nSucWqtr3jkNd6gH5+F6wpGHKPEVVZFXqyDi54V3cjUvfM8ehVE3I3Sm03+MDvtBBdC7dElnQ7sDLTmFdY2FRksN98BJP0xYuL4NjkpnvJu6tmlwd5eeOjbfdx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(376002)(39860400002)(396003)(136003)(186003)(83380400001)(2616005)(82960400001)(66946007)(36756003)(44832011)(8676002)(5660300002)(4326008)(66476007)(66556008)(6916009)(316002)(54906003)(8936002)(2906002)(6486002)(41300700001)(86362001)(38100700002)(6666004)(26005)(6512007)(6506007)(478600001)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3XlmC57DNx8EsXKxKPbFMYoiVlwv+NrQ1uz/4LZBqCO/esVth6TUkpO2TrVR?=
 =?us-ascii?Q?5/vFQcuZY/1CfbIicpcyMiE9x2Vai8Am6cBETuIddbltt5mV/xY+gl1OW2ib?=
 =?us-ascii?Q?x6+6i5E5N7PoTMYF1pkQr5pzZnrBz6600M1WmC1FHEIjSYRbf1QOeH8kiE44?=
 =?us-ascii?Q?XKqKk+daYaZ9cx8PuvxIKbPJNUpA2RCRJx7Engz0dgN0iK/KAMFY3YBC6e2q?=
 =?us-ascii?Q?1NAsZOlW+3jHBePVVCr3S2JHk+Qu7JSJIEubuidvz66gd1FluWwU7EGHYRKS?=
 =?us-ascii?Q?AE5pBjRBkcOEB4I14HgWsReZajEoNtdkx3c296buCvbvyoGb+fz0nCClKyDb?=
 =?us-ascii?Q?/mMTabSM9WRPrnBNClPTVINJu2gedTcossOBkDzk8+4RDvvsDw1cwUOPH0i8?=
 =?us-ascii?Q?4dIuHBKn9nHy7oW1UGD6O+ybHxE70BXK5PXjlW0Tg1Fbuw3yK0k3BDalfKJF?=
 =?us-ascii?Q?fz5v7/aki6NNAQt9UzHS8j5k/xM36mDLWLhyAmOqjsTwHHZWOh7uRuWL78mQ?=
 =?us-ascii?Q?UZBN5LQDtVsQNXpmEbczw2dtKsfjp2s2edYE87oqaR2DcjmtCrm3ODgD8WtN?=
 =?us-ascii?Q?CM4oxNBwN+pEWsZWljGLDomPwLO8R9UpecNe4EALfDHS8B8DgoPfxdZlgdVB?=
 =?us-ascii?Q?X8EU84TniEuzSqhICbQse8JcQ+RAtTNR2KFAIIop4Q2/q95M48FMmJDqoSDl?=
 =?us-ascii?Q?Yke/aTD7KY9IfP9m4w8bSF3Aqd7EJ/nXw6YyxrQRrtbndT0qYgUPYLZ086qz?=
 =?us-ascii?Q?7IxhgQKxDJGEnyvA59JesMdtM678RPQq6tDMHfUA/sQyu/pqhJkUOqftajc3?=
 =?us-ascii?Q?pIuYVnvqBM/UAiSH5D/kMqSli8a8e1m2rRhrkrrNMRR4+qU3IIw37ZDOmxRg?=
 =?us-ascii?Q?fkLcjNRMLiXI8hLoUBp7H58yvAbAZE90lKWFGnFFlJ6OGtpFpbocG1Hlhxls?=
 =?us-ascii?Q?PzMA+EboaeyPxWKP8HDlcYiumvtmwoJ+0qT6xxQz4yz+MUcIomeKT7hOY9f7?=
 =?us-ascii?Q?G40NACymL2oFPJgqVk/yMTt2lYTuE+oWYda8ACWoT9IY1AMGEt55G0CkzQUD?=
 =?us-ascii?Q?wR4ESEl/n9KYaJ+nA34TvIpoCx+ON4uw0UyD12j26XMDWdwzJHAUqxJrVOQU?=
 =?us-ascii?Q?9RR5h4/750qse2fF2chQjIpMQQDOEwD3Av5FVcvsHkIQemLhlMpLGmy0vFG9?=
 =?us-ascii?Q?7DO4SVsatwuDaoDsZ5QtSFbVCm+MfyaV0bYjCh1Ho+QmGhiPTNNye3BT4hrL?=
 =?us-ascii?Q?p5n2TB+FcZseeCAiblufk4DdQurgyI+TxWZhmlGVly1lBX8mWpp0iY9hWALS?=
 =?us-ascii?Q?lI0U7/48FRdyEp2sWHmSQWI50ZcH1SdpDdBLMNzsLXajWDueaxcGPaxlYkcy?=
 =?us-ascii?Q?RgmyGprsRoPUojd8jaSMEtps2Hsqtjh7DnI4gt1goMu4rWgP8Zu2jRf5yDk9?=
 =?us-ascii?Q?FzDtn64QaotJXnpeiJmoiin0rEj4lVTBJeoETeuPayVguh+BVGiOMdHv/yBc?=
 =?us-ascii?Q?UzWaIx+Qt6flJvNYeJyq58LGGVymbVJwLhpgSIxYYnfFC80iTWTqAT5VSXTJ?=
 =?us-ascii?Q?uIYvBBN2VjeamcbZA9xTitUlwuqIGGvWoOKpsSFQ3Z5rYnN00gXNzTWOYR9C?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cebdbd58-cf87-409e-57c7-08da77229ad4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 20:39:33.9059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/Kv0orvQSsnk6IvLZbxNCVAutA6qxhCd7uGmbZ41/6XBBj7bmT1gc8YgZ3QRXjlSrRRxQzf9v43kpXGmsUVKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 05, 2022 at 05:25:43PM +0200, Mauro Carvalho Chehab wrote:
> On Fri, 5 Aug 2022 10:39:44 -0400
> Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> 
> > On Fri, Aug 05, 2022 at 10:46:57AM +0200, Mauro Carvalho Chehab wrote:
> > > Hi Rodrigo,
> > > 
> > > On Thu, 4 Aug 2022 13:33:06 -0400
> > > Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > >   
> > > > Hi Dave and Daniel,
> > > > 
> > > > Here goes drm-intel-next-fixes-2022-08-04:
> > > > 
> > > > - disable pci resize on 32-bit systems (Nirmoy)
> > > > - don't leak the ccs state (Matt)
> > > > - TLB invalidation fixes (Chris)
> > > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:
> > > > 
> > > >   Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-08-04
> > > > 
> > > > for you to fetch changes up to e57b9369e0c6f60155027e120fafd4b57e385b71:
> > > > 
> > > >   drm/i915/gt: Batch TLB invalidations (2022-08-01 09:48:06 -0400)
> > > > 
> > > > ----------------------------------------------------------------
> > > > - disable pci resize on 32-bit systems (Nirmoy)
> > > > - don't leak the ccs state (Matt)
> > > > - TLB invalidation fixes (Chris)
> > > > 
> > > > ----------------------------------------------------------------
> > > > Chris Wilson (4):
> > > >       drm/i915/gt: Ignore TLB invalidations on idle engines
> > > >       drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
> > > >       drm/i915/gt: Skip TLB invalidations once wedged  
> > >   
> > > >       drm/i915/gt: Batch TLB invalidations  
> > > This patch actually adds a regression due to a silly mistake. 
> > > The fix is here:
> > > 
> > > 	https://patchwork.freedesktop.org/patch/496249/?series=106805&rev=4
> > >  
> > 
> > Thank you for the heads up.
> > 
> > Since that patch is not merged yet, what are your recommendations here?
> > Should I remove this from drm-intel-next-fixes now?
> 
> Those patches are OK to merge:
> 
>        drm/i915/gt: Ignore TLB invalidations on idle engines
>        drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
>        drm/i915/gt: Skip TLB invalidations once wedged  
> 
> And helps reduce performance regressions due to TLB cache invalidation.
> So, I would keep them.
> 
> With regards to the 4th patch, please don't merge:
> 
> 	drm/i915/gt: Batch TLB invalidations
> 
> or merge it together with:
> 
> 	drm/i915: pass a pointer for tlb seqno at vma_invalidate_tlb()

Since this one has not landed yet I won't rush it in. I'm removing the
Batch TLB invalidations and sending a new pull request without that
patch.

Thank you for the info and great work there.

> 
> > Which regression is worst?
> 
> The regression caused by the batch patch is a lot worse, as it
> effectively disables TLB cache invalidation. The fix was meant to
> be merged at the patch, but somehow between several rebases and 3
> machines involved on tests, internal development and upstream, the
> branch actually sent upstream was not the right one. It got only
> noticed after reviewing a newer patch. Yeah, that sucks.
> 
> > Also dim has trouble with fixes for fixes in the same round.
> > Please ping me when you get that patch merged so I can pull that.
> 
> OK.
> 
> Regards,
> Mauro
