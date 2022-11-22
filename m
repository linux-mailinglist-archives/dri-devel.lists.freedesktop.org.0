Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36B46342FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 18:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161318953E;
	Tue, 22 Nov 2022 17:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6668953E;
 Tue, 22 Nov 2022 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669139436; x=1700675436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gA2BN19HosX0c8si6mEHXDi17OJWKe9xEfwe2rk0xkk=;
 b=B9W18xW9WL9TTQ9s2TkMwSa75RhrQRX9EvNwQVvIHyLAhx9W/ZDQoCy2
 bNLKHKxKnRYlXyBNLWbVYTW0xMbi4cqUu6mJ4zJScW1Gbsl/xJgTJyYGe
 ihyZLXgIZD8BLicsOFmsAqmchl9SJTizK8atPii9y9tAkQhwu+fsJaolO
 /akQs0j0EC+iwKt35BB5mQGfvG7gT/rNsD3H+jhjt+kRRCZJV+jPHxq6j
 Doel31pj0OWtwi7eI/Wcue5gkWfuecvsdvgdf2nqDEW6O+fFsWNNhucya
 kitPSgVFP/TX4gt8zEySJ2+t8ltrvbHI8kqpt/2/gnDqR8uO3oC4TV2gq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="312575565"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="312575565"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 09:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="783922131"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="783922131"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2022 09:50:35 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 09:50:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 09:50:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 09:50:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 09:50:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/aGNYdeYqtUOxnLfHPugxd7+HaNV4/chEGatUqzZ+xT3mgWvZXq3fjBKhGnUZxO6mCjhXf+UQct1R2GAZfk9jXa+RSWVnfcMfArd55znzt5QbQOd+noQL+pt6P3DQBpZupGbQuFh6vSrEdvlpfSadB8c2J3PjGuMztUMENkF3H3vW93TpwdL9CSstmIfV0AWMfK/Tjaq3jh/E9Vn0VdoSSeWPQwiW27bY/reqbvfg80zBhZNwZeXVVdv+R0hqZYD68XJGrt9KjBp3Mk4kmbsLhIzoKUnawFLiOY6dq7FqsboDvkVcXx4K8iFcZ4IAJT1AksZ+a5N5ZI8d2tdpRLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbiXoKB63o1w02dGzbQim58eE03IBZsO7of2QKiX9Ok=;
 b=Q9DcnVqdccAAUDDIa+LxGtpYfC3hu4WG9tqbJuSn9Y2Mlf8xJgGR+sVA/qAe9gP3BIMXjlNpkCDAkcxr1R4rqLU59WJq3MsMHLVGcwLCcVpD0Ugd/MKEvPOraJ+SxZY96aMRq64Vqi2GOhmOcfmK/oSpgxP5CuoNoVwbYqjHnVALZGGyDoXYze+ix/PxfmHMm6voIvGVRVvZ6/Sql6pbwPXAV/F4kHmOrG7Y/fC6FgI7jDENWqmCVM1R9x0kYYDkmqopDg5nPn5rNFBij8lnFiD4hEaGQ4QbVHSwc1gR6jdX0OI3O4yDUjhRFn8dKzQuHlr8z4X4dzO5a1cStaj5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5403.namprd11.prod.outlook.com (2603:10b6:408:11c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 17:50:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 17:50:31 +0000
Date: Tue, 22 Nov 2022 12:50:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [MAINTAINER TOOLS] docs: updated rules for
 topic/core-for-CI commit management
Message-ID: <Y30L4xoF5Zv+dC2M@intel.com>
References: <20221122131714.3443238-1-jani.nikula@intel.com>
 <Y3zjvobswUkJFPV1@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y3zjvobswUkJFPV1@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a135314-be5c-49ee-8775-08daccb20c66
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S39BUDxYNXHVDk8WP6xLhl+RPD/1yOZ0UwUFVtp3JWE3Ya/3DNO9G1oVC72cjvEcMMSUlHDchq0DCJuxfhrn9olmMPbScF21HEvoUTDRDp/14JEqkP3kvfvlstBfD6ibnuzN7B5l6CiUTzfGHuOSmcaUgQdExIghCjx0EtqVaKPghlSaNUJgDDiLVTcKBbVgLuDwnnx4miZjptpBOEE/xKMdct0yVccjQ4oKAM33zQNqS5akL5wWQ3jDYMiAEDn41VF1z6KOkeSw6YiEUlfiyGKfGHt+TUSgbDprP5dov4puMOEDUUiPQZ8VM+WmuV4pAi1dEEhfrTCGrUQ8eTnV9nxpmRDOhhR1qkhoZ7Iv9WwtS+xfEUjrl5hyF4aCvYzeMEdm3QvAGIb0aDJwQTgNqqtqSpicO2HG8aA4IGWbd0FEYQNF8gF+48vIEAqLFYKSSdGqX2Ojwu9yKqRRRBVY7q3OsxGfPTaIAS0/X22EgvaKrrOWwx44vFUUSeqsDEApH0dGaWzLsK2gvhXqoxpEeYOZQqjBAAi78AfdJe8DDcz1tVplEtlSvBf1mMIG01njQpDn+1R/BPuu0RraZuMBaR/SXT1jGaqbjZ0C7P5K160diT7vMEgq4GljnLV7X+6Ir8fSvXJQ76dJvli74WaMldySSC8Xb1Obp9ScMEdnpwik6KsS+XBeU6D9Uvy1hZx+f54+jNnbqk39q767nonWnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199015)(82960400001)(86362001)(36756003)(66476007)(38100700002)(186003)(316002)(54906003)(26005)(2616005)(478600001)(6486002)(966005)(83380400001)(6666004)(6916009)(41300700001)(4326008)(66556008)(66946007)(6506007)(8676002)(2906002)(15650500001)(44832011)(6512007)(5660300002)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XAPM/UIUoucU6z9Y91buyqgoACu64B8pRduAmC3Hjn0gdRW3+UJTa7kiMYD7?=
 =?us-ascii?Q?iFJTCqCR/+6NDeFVJf+cnGPLaIHkPuHF6sHzOL9VUF6pa6VIPrAFYLKpsJEE?=
 =?us-ascii?Q?O06rKTCCW61QhhQNZXOavgnC7FgdHL/+q+ADmVfY1OeAGRSGkUItSsjyhbm/?=
 =?us-ascii?Q?GPkh7xotbkzlj8uW7zx36lQYeZ59QU3rnUI4dpQmvzf5/8wOMAwmTCgzaKA+?=
 =?us-ascii?Q?xHJ7LAkbK3fuGCxGQJ+z+iOwoXZ5trJb4M4DK8dmLNIJsVP5kbcZ7W2QgYnF?=
 =?us-ascii?Q?Rjr0YIrhWC1cYC3HzIU1CnizzGQS0yTRni85ShiCgVfZeHjNmURdhgZ8sLBF?=
 =?us-ascii?Q?sFtqQfejVO7KB/eyXqs64zHPXfXWreiWJENgSwWfOCwOyjX/TTnn2sQM8TTN?=
 =?us-ascii?Q?g71VOFjqsrGHWOQJ41MPtIx6RPRtywfShuiypFOHNUNzQc3ykF3q77sHN2nG?=
 =?us-ascii?Q?gGLLT5uh9zax2xPPeILo784o0cUZlCcRGCvFFV8h7Kof003l1mgF8B4+2muE?=
 =?us-ascii?Q?df/7H6LkW5khKMqpwCJnYYxqqq52e0ihmVI9STEt3APP4kHk83ra/G7IX8zi?=
 =?us-ascii?Q?0mYn6B6uz4TprafxTUH7yxTsKp3lQ8HSReyrJ9ld7ArHaRKjcKaKL2DagOr6?=
 =?us-ascii?Q?P/m9YLCWmFBUvFPrVB6YhSwv1rT2f1ffAWO70JJLDjYyRhUmPJGaaRn2i3Vn?=
 =?us-ascii?Q?N/0/xeFou8MpE+/p84Nu3OiPsTlwwVr/D2s/b9YnAGk+juanqQ6HzgRq2rAQ?=
 =?us-ascii?Q?rJXGqIqisBSyOl2JF9HB0ZhX5FYQCqxIkHXoFCRlsLL/fD+q+WnxDdFUVcN6?=
 =?us-ascii?Q?mr6lR8kUlDkYjKEQtFkICuOFdu1hCBRYz0eGKExW15BC9VqiMfNSj7b+mnmH?=
 =?us-ascii?Q?ISXWCfMBuwth1z2xpDGUf9Q/fLXnwqaLX3TWtRj5K9Jvve3Lr9PcWvup0NMc?=
 =?us-ascii?Q?v8FU4HBs0AQQJ5cjGQS7tnm6ZCvSD1gq+nr3FMm0Jj9MtpI2H1JRQj/HHLM1?=
 =?us-ascii?Q?v205RSPXTyJYSkAciD/swtpDYNFqM05XzvHqdfoqL3C9TeTv7CU8awYQmwwx?=
 =?us-ascii?Q?mjd9URANgjDjSfS9maohB3xQRDJb5XFFubz+HNfKcMwurvIRQ+6b5QcBdzar?=
 =?us-ascii?Q?dfUQypIibLuhqDU3y1PV55YycGgyfE2ZDsQcPcoDh+yNAEYb32q5bZe7GlO7?=
 =?us-ascii?Q?2Vdms4uAxo5+PH+uZthW+poQRC9yan8W+X5REuzRDKShdjWGCv57iB/JJb8P?=
 =?us-ascii?Q?fEuyJEm4m2jdnE4kXJYdwCQYPeCgjeAVciedaDKiQL67+Ka+kjWLp1+5e41E?=
 =?us-ascii?Q?hT1gjYjI1Ls5gSqWGxnrCZb0hvm7zQvPSchCaqToTzy2xEWs/wheYM+bcEwy?=
 =?us-ascii?Q?epXd1PseGSWv8JqOsA9+JG6sJG2CyyQnSu92SyFih8EJtVjyVlH4EAJ7UUbQ?=
 =?us-ascii?Q?1Wi/tzDY3vyfXcnVX8OpmyAWHN5e7mKSdE6U0sWhYvuPbynFJLTa834xmVsc?=
 =?us-ascii?Q?zEnYChyybqZBO5GEkz50b7eSqFhaP9Be+TPZQOi9V3npL1XuJSGVofCwqKEE?=
 =?us-ascii?Q?5RSpN6ruFLLmQK3ooS0vJ5UXiiy2GYoW3v5AQHyG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a135314-be5c-49ee-8775-08daccb20c66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 17:50:31.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzz65iT16V2sKCTUfzJ8Cy12mCYo7MM5UYreC6qwThBi6rSlW/GLHyR3idb3WO1naYaxW6e6o9CrM9w0yXtm4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5403
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 03:59:10PM +0100, Daniel Vetter wrote:
> On Tue, Nov 22, 2022 at 03:17:14PM +0200, Jani Nikula wrote:
> > Introduce stricter rules for topic/core-for-CI management. Way too many
> > commits have been added over the years, with insufficient rationale
> > recorded in the commit message, and insufficient follow-up with removing
> > the commits from the topic branch.
> > 
> > New rules:
> > 
> > 1. Require maintainer ack for rebase. Have better gating on when rebases
> >    happen and on which baselines.
> > 
> > 2. Require maintainer/committer ack for adding/removing commits. No
> >    single individual should decide.
> > 
> > 3. Require gitlab issues for new commits added. Improve tracking for
> >    removing the commits.
> > 
> > Also use the stronger "must" for commit message requiring the
> > justification for the commit being in topic/core-for-CI.
> > 
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: dim-tools@lists.freedesktop.org
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > ---
> >  drm-tip.rst | 27 ++++++++++++++++++++-------
> >  1 file changed, 20 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drm-tip.rst b/drm-tip.rst
> > index deae95cdd2fe..24036e2ef576 100644
> > --- a/drm-tip.rst
> > +++ b/drm-tip.rst
> > @@ -203,11 +203,13 @@ justified exception. The primary goal is to fix issues originating from Linus'
> >  tree. Issues that would need drm-next or other DRM subsystem tree as baseline
> >  should be fixed in the offending DRM subsystem tree.
> >  
> > -Only rebase the branch if you really know what you're doing. When in doubt, ask
> > -the maintainers. You'll need to be able to handle any conflicts in non-drm code
> > -while rebasing.
> > +Only rebase the branch if you really know what you're doing. You'll need to be
> > +able to handle any conflicts in non-drm code while rebasing.
> >  
> > -Simply drop fixes that are already available in the new baseline.
> > +Always ask for maintainer ack before rebasing. IRC ack is sufficient.
> > +
> > +Simply drop fixes that are already available in the new baseline. Close the
> > +associated gitlab issue when removing commits.
> >  
> >  Force pushing a rebased topic/core-for-CI requires passing the ``--force``
> >  parameter to git::
> > @@ -225,11 +227,22 @@ judgement call.
> >  Only add or remove commits if you really know what you're doing. When in doubt,
> >  ask the maintainers.
> >  
> > -Apply new commits on top with regular push. The commit message needs to explain
> > -why the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
> > +Always ask for maintainer/committer ack before adding/removing commits. IRC ack
> > +is sufficient. Record the ``Acked-by:`` in commits being added.
> > +
> > +Apply new commits on top with regular push. The commit message must explain why
> > +the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
> >  another subsystem, please reference the commit with ``git cherry-pick -x``
> >  option. If it's a patch from another subsystem, please reference the patch on
> >  the mailing list with ``Link:`` tag.
> >  
> > +New commits always need an associated gitlab issue for tracking purposes. The
> > +goal is to have as few commits in topic/core-for-CI as possible, and we need to
> > +be able to track the progress in making that happen. Reference the issue with
> > +``References:`` tag. Add the ``core-for-CI`` label to the issue. (Note: Do not
> > +use ``Closes:`` because the logic here is backwards; the issue is having the
> > +commit in the branch in the first place.)
> > +
> >  Instead of applying reverts, just remove the commit. This implies ``git rebase
> > --i`` on the current baseline; see directions above.
> > +-i`` on the current baseline; see directions above. Close the associated gitlab
> > +issue when removing commits.
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
