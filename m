Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19EB6349A9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 22:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF1510E364;
	Tue, 22 Nov 2022 21:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECECB10E0CB;
 Tue, 22 Nov 2022 21:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669154001; x=1700690001;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h6VodiVowI0k911zhALS6Huol0l9gQVb5sVVJJT8yDI=;
 b=BIw4bXe3/GckeEQH4aXRs8ZV2F/+9yEpKysDQQh0WYSMm3M/RGQyCo+3
 vCeNREtf+BHnTRovmKqhFKVFUB/xrPMUo2x/ajIy8V/9/GIXP+U3yNZLV
 8+5HvXA6d400otaepkDM4WPwYbqgFbEyJtxs17Z93hjNa8mO77bwFs6QD
 W1RHzJu3vaPbJT6k/UfG/7WEFE6mZ2bB6f7IcuSiei7sgH35Kxxh+SfbV
 YGIdnlx2J+TMCmfQkFvBSseri/cWL8ieygsbJHFjQiQxRfkgesxX0ib9P
 TbgwGe6M9LV0cm0L90qPjrVee33QOpFY/gAPigAJN2CcSPkObTtD3Ifsl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="340796668"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="340796668"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 13:53:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="705122660"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="705122660"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 22 Nov 2022 13:53:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 13:53:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 13:53:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 13:53:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk0sB8Us1aS12WkkkesSSbtywdT3aW2gNZuS/kxeuNMGf9UPGkT4Ud5or3s7BHHQrk8gUgT9PgnyNNZQ7OvAY+6DbcltcasTssOYut6OXr6PrZy4ql5dMPkgij/yq06Xx64E/daBH/itTP20Jp6NgRTC1T+91Fhp++8lO9xucjl4ciM3zBQob5CKOyRbtnN35ouG6Yxzl6ql52CgRT+cDiJuuxBLmoF3cIJG+eN3syxv2C74WoouRBPdOfE2y5R2fAuvYTPi5ScYZihJaFux2qjgbFghXOSxxeXPn2Ub+JQURWL+NU9/fsOyK/yN/qyEt3Y6vSGBC8bzY4XJAneZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTasvH5tDOY7yDFHRBB41I8biwpLDsB+MIj/blFjVhg=;
 b=blNaoIaQiSd1z45Y+rW/HLIMEAHafHw0kz6PMqu7i1dzl0ZGbkhwwGmFA+1OBQcFRixZu8+aSuYk2loZqp4X92yW9FURkN4uTiah7cKfWrJylTNhDzAi9F2lQjAyQD3mr5Rmwhhn55F9Tz4f6q4vhvHwJlz0pPtAGeCL2SwIvrublgI4yY5nEqdpjKdY5Hbv4DXUBOFXvgs3lKsvRupeMdB9JTaDnl4jMesO2pZJGgGWAWkNWLq/PbkqNdfgbkw4e+zogrfd7jbGsKvo2BfORf8lsgEQvmSz9+U9F4yft6aGupFjhhSSSGBqVzr0fF7e3REsD6QlI+vEB5+h4SaqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 21:53:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 21:53:10 +0000
Date: Tue, 22 Nov 2022 13:53:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [MAINTAINER TOOLS] docs: updated rules for topic/core-for-CI
 commit management
Message-ID: <20221122215307.o3rg7x3a7r2sajby@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221122131714.3443238-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221122131714.3443238-1-jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f527c26-b909-4e1f-6344-08daccd3f22f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iPk693bHdpnPYF6z/BwifTTrUlzmAOuT5fV3YqiTw1EQ9GIDOA/B3axlYJZQyNqf8h2+g045VSPXTqIJOHp2/gi4TTuGng+ZHtIx/rbJal6+8rG5Rf+pMT23fYBim24oCP4esyGTteXxkMgdj0kW+0N6ZHDHHsyRIAPO2ufRz7nI89IMzjALLfrrnK0kCJq1AOb5HGYPYEVgkkjL00RLhQjOIQFFxqgcgDPzkQ1wxTJAb5hfujvnx8NggOYSwbmhfhmk5H2UVi7QyvSkIqmz7bRk2+ECFVWZgDULO69cgbqUdIhpPfmIeru/OmixBdBpJcnzbG7AUg2bYLqRfm3FlT6qAO7RX5yXPCiL5IqDSh7YtDQBr+Y3y6b1g91kO3ujpkstggujaN5BML9BWjIdmEexOER0pjz+HY3d/xiGwpqN6LIXUYly9SXT5qlfjxjXGpC17whNUQKJiPDEyX1yteQZlaIlsF2rkalf+o/i837PxH/cnink9zu4SctMTTBbCxaR1RVyBH454rf9TOX7VVPl6Vo2vG0U74xGqUaTiBBoVXvGZITuHQZ5ZXNe7cCkZi1rdD/lcpkMDVRipEVhO4l5EyzG1NuqmDhiNAOZZsWTeC5cmmUpxdlrC6yT0sVbU2ANI8DwhNaWBkwFHgQGgmFghc1wWFAEMEOYVPsrhW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(36756003)(86362001)(26005)(15650500001)(5660300002)(2906002)(38100700002)(1076003)(6512007)(9686003)(82960400001)(83380400001)(186003)(66946007)(54906003)(6862004)(66556008)(6486002)(41300700001)(6506007)(8936002)(478600001)(8676002)(316002)(66476007)(6636002)(6666004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3cBy4fdRDE7OS/uphVsef/qD4r/CSluHBWHEeq5yswZ9n72Hv/HqT+1f8dlq?=
 =?us-ascii?Q?/syP5qiiUgs5T4W+JhzANMQV8ThyedG/mzv6PB0213xPGuLolz1PQ4NDaBGb?=
 =?us-ascii?Q?pTvKAXclKIF+IibqA9g/MjPZvN0+Ux8KoMFHdjvNmInZM0P7O5hnFAYwpups?=
 =?us-ascii?Q?5PyOvjkIDvphZpmNQk0KRfnCsbRfdvH+EsuaOf6LokaymBjQRqBhMzepUTBC?=
 =?us-ascii?Q?aHXVpPPU5v61eRQ4f/eVTW+pghDEPX2+0TsJY6EHzy26YLOth0ez38DVGRpJ?=
 =?us-ascii?Q?twtM+SchG3tj2VDUxC5vYka2xzSYXgS3VMM1yAkvC2Owvt4PP4abZXZPMtoY?=
 =?us-ascii?Q?2jkiH/15uMsfIVWzi7FoilHXxAlOymltOkQZ7qo4LA/VebOyg1c7B/ADq3dR?=
 =?us-ascii?Q?JnFnTPBVPHdg9a4GzqSHGrvMraJnX4k5cUMVtH5QuWjbQ1PNclvLtNZRd2bo?=
 =?us-ascii?Q?xNA4PhLxJxhJ0rbByZ7FESA8OtyKqOkrbWVl0PJUAMzMj2nUmxE3rehYE6O5?=
 =?us-ascii?Q?7Dq+wsU1U3VkeWKLk7/nKVNepXFf3Kv1rADNjmEgSUhaG70ZbCqbOpbSfVN6?=
 =?us-ascii?Q?knjjuAjo8GsRe/dAV0hpL2MpSgb8OHEClYmkzBOm559O2uAfiDNivHS4l6hL?=
 =?us-ascii?Q?dtFCO1m2/P5RTysFeOvkXl2u9cMPxCDA0xqsBvs4lJXhubty3bFZpl2Yxj0B?=
 =?us-ascii?Q?txMVJofUd9z2PgGXrAuQJcwtG1Eujk6Hss5EomMymajWohFgb6ka1sC4jNOh?=
 =?us-ascii?Q?5OJqEZj11bDtTT/ZmwYQSLxJWRZ3myUwgrGxY9m5om+cYP/GvgUtxKXl/iBX?=
 =?us-ascii?Q?XsuJfD8JQkR/kQbsoBhZRpB8w7XIsZaABOHkR9z8AARKZZJoQmontpAVrsNE?=
 =?us-ascii?Q?aAt2s1y6GOmhYgSYwyjv3o5YdDAOhiJvqdPGJYoxgV4B4kYlpgwrcpNy56w9?=
 =?us-ascii?Q?IA4RHUxqvUK8DKdyTp2QbYTJ9ykDT9E/KZEmoZf2IIP5UqWvVUd1jZZPRKTH?=
 =?us-ascii?Q?hMKjmMdTF9Hr29vGl7/DjRxU6Lb8ql77We3wYslXwg+RCCR28mmFDt+FeNtT?=
 =?us-ascii?Q?B3JJhfrlm0PreyP0tNteIuiYc8IMzSNLhu1o323bta9BOpiYOLbpkb9rtLFY?=
 =?us-ascii?Q?A/XSvtkh1RazQGvUKA4gj7oNrTh8b2WQ+5iv0CHvNMMK/L9Wu3gkD4IF0fet?=
 =?us-ascii?Q?dtxPotDJ2Xc7VxNmY2WKAMAzHQinXX1RmgvJLxzRQhIC43kXDKH34UOn6C/E?=
 =?us-ascii?Q?9S3o3zY5KjDzFR7ounZcWKbS8qeOa5Mv+FfYh3L9r9zqOqE/qH4oAA32lGOE?=
 =?us-ascii?Q?pLiQgbR71p/Jt9kB2DEdmDklICkxuzBPUccRxX4K+mOe4ZDt7GdHVN7aYHS8?=
 =?us-ascii?Q?OZLWTGlv+0+BUv4yivER+vr5SfSYpTOe3jUK/zW5AQqF+xs56ROt4eCfrX6W?=
 =?us-ascii?Q?/tXjsX9j6NTu6zcAohLk76eW0iDnlVd/GXaVTXJNE13Cf+ptCdvWtQsnt+0h?=
 =?us-ascii?Q?MygZH/4HEH49mSJTrIW5exF6DMueVy7YOeBNiKwwOjRZ9BZhAhZu3IF+rTH6?=
 =?us-ascii?Q?b/ytGBSg6aJN47COGjOPudSAFufApEaMC4zFEhE55y0ezTk7bvab44zoHwU8?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f527c26-b909-4e1f-6344-08daccd3f22f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 21:53:10.1747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZlr8EvoVunQeZ+Mqbrqhx+IRZbUre6+VN2r+8/ydjFd9+HfhiLPqMrsbRXKbj0kPa5H2iZLxnlvo+A45N/92sNC2ru0DiGTfUyNxqLcfKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 03:17:14PM +0200, Jani Nikula wrote:
>Introduce stricter rules for topic/core-for-CI management. Way too many
>commits have been added over the years, with insufficient rationale
>recorded in the commit message, and insufficient follow-up with removing
>the commits from the topic branch.
>
>New rules:

Why not make a list like this the actual text? It's easier to follow a
bullet/numbered list than the free form text.

>
>1. Require maintainer ack for rebase. Have better gating on when rebases
>   happen and on which baselines.

What maintainer? drm-intel-gt-next/drm-intel-next/drm-misc/drm? Any?

I don't want fingers pointed, but just to know the context: was there
any event recently that triggered this? Because the last updates I've
seen on topic/core-for-CI were not from maintainers and
looking at the branch I don't see any issue with the recent commits.
The issue actually seems to be the very old ones.  I'm not sure such
a measure will actually fix the problem.

I myself pushed recently to topic/core-for-CI so I want to know if **I**
caused any issue.

>
>2. Require maintainer/committer ack for adding/removing commits. No
>   single individual should decide.

s@maintainers/committer @@? Or just let it have the same requirement as
the drm-intel-* branches. It seems odd to raise the bar for
topic/core-for-CI above the requirement for drm-intel-* branches (even
though that latter is a r-b). From committer-drm-intel.rst:

	* Reviewed-by/Acked-by/Tested-by must include the name and email of a real
	  person for transparency. Anyone can give these, and therefore you have to
	  value them according to the merits of the person. Quality matters, not
	  quantity. Be suspicious of rubber stamps.

	* Reviewed-by/Acked-by/Tested-by can be asked for and given informally (on the
	  list, IRC, in person, in a meeting) but must be added to the commit.

	* Reviewed-by. All patches must be reviewed, no exceptions. Please see
	  "Reviewer's statement of oversight" in `Documentation/process/submitting-patches
	  <https://01.org/linuxgraphics/gfx-docs/drm/process/submitting-patches.html>`_
	  and `review training
	  <http://blog.ffwll.ch/2014/08/review-training-slides.html>`_.

>
>3. Require gitlab issues for new commits added. Improve tracking for
>   removing the commits.
>
>Also use the stronger "must" for commit message requiring the
>justification for the commit being in topic/core-for-CI.
>
>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>Cc: David Airlie <airlied@gmail.com>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: intel-gfx@lists.freedesktop.org
>Cc: dri-devel@lists.freedesktop.org
>Cc: dim-tools@lists.freedesktop.org
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drm-tip.rst | 27 ++++++++++++++++++++-------
> 1 file changed, 20 insertions(+), 7 deletions(-)
>
>diff --git a/drm-tip.rst b/drm-tip.rst
>index deae95cdd2fe..24036e2ef576 100644
>--- a/drm-tip.rst
>+++ b/drm-tip.rst
>@@ -203,11 +203,13 @@ justified exception. The primary goal is to fix issues originating from Linus'
> tree. Issues that would need drm-next or other DRM subsystem tree as baseline
> should be fixed in the offending DRM subsystem tree.
>
>-Only rebase the branch if you really know what you're doing. When in doubt, ask
>-the maintainers. You'll need to be able to handle any conflicts in non-drm code
>-while rebasing.
>+Only rebase the branch if you really know what you're doing. You'll need to be
>+able to handle any conflicts in non-drm code while rebasing.
>
>-Simply drop fixes that are already available in the new baseline.
>+Always ask for maintainer ack before rebasing. IRC ack is sufficient.
>+
>+Simply drop fixes that are already available in the new baseline. Close the
>+associated gitlab issue when removing commits.
>
> Force pushing a rebased topic/core-for-CI requires passing the ``--force``
> parameter to git::

there is a main issue here that is not being fixed: testing the merged
branch.  I think it would be much better to have the instruction here
to rebuild drm-tip without pushing... This will use the local topic branch:

	dim -d rebuild-tip topic/core-for-CI

It's the only way I ever update it because I don't want to push a branch
and have a small window to potentially solve the merge conflicts (while
leaving others wondering why the tip is broken).

>@@ -225,11 +227,22 @@ judgement call.
> Only add or remove commits if you really know what you're doing. When in doubt,
> ask the maintainers.
>
>-Apply new commits on top with regular push. The commit message needs to explain
>-why the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
>+Always ask for maintainer/committer ack before adding/removing commits. IRC ack
>+is sufficient. Record the ``Acked-by:`` in commits being added.
>+
>+Apply new commits on top with regular push. The commit message must explain why
>+the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
> another subsystem, please reference the commit with ``git cherry-pick -x``
> option. If it's a patch from another subsystem, please reference the patch on
> the mailing list with ``Link:`` tag.
>
>+New commits always need an associated gitlab issue for tracking purposes. The
>+goal is to have as few commits in topic/core-for-CI as possible, and we need to
>+be able to track the progress in making that happen. Reference the issue with
>+``References:`` tag. Add the ``core-for-CI`` label to the issue. (Note: Do not
>+use ``Closes:`` because the logic here is backwards; the issue is having the
>+commit in the branch in the first place.)
>+
> Instead of applying reverts, just remove the commit. This implies ``git rebase
>--i`` on the current baseline; see directions above.
>+-i`` on the current baseline; see directions above. Close the associated gitlab
>+issue when removing commits.

wouldn't it be better to apply the revert and only drop the commit on
next rebase? This way it doesn't require the force push and it's easier
to see what was done in the branch since we don't have to procure the
right CI tag in which things got changed.


... I actually came here to ask: wasn't gitlab supposed to be used for
patches in maintainer-tools?

Lucas De Marchi
