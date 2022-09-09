Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D155B32E4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FB110EC22;
	Fri,  9 Sep 2022 09:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF20710EC22;
 Fri,  9 Sep 2022 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662714414; x=1694250414;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GQIB7Wz0ukQHXM8EFrVU9mgAGovQqkPwjoPrmwh3jXM=;
 b=SqR08jGN8CpTz64ugSTVvACV+GfzyHEJ0qvMXPJdfyhncQdalzLUUJNe
 cS40GNmuK1PPQcTIijW6+pa5iU2BIKkK9QeSgej3pEcfqdyDBzOVSymvI
 l7vbHs4XX9wJS8pE+SP9LVEFn4vIBp4a8o2qovn/Jy6UEbSYepZMWyBTr
 KqxA8cVo0IqFmNHW3NBbN6HzyYqxesq++ozzMj+EillaCdOlIBtWe0mF0
 fY3DR9nWzqE4nyxgrRzsMtncfRA+IgP/C2CXQXwotk9xLpOaL3yCL2ypN
 D4PcD1N2YxrtO+W2jwC+ypHyx36l4TAVaHqg+RPJLXThianDbJyFXQu1C g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="296169488"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="296169488"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 02:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="566302470"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 09 Sep 2022 02:06:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:06:53 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:06:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 02:06:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 02:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJaFZtluWe+dOG+OjaZhC+sGrLfj6Pap212+0Vm3kSv46ezvdy5uCCdrK3/uKeaHrs6SaPztdWjDjauRgParZhxPYs5AcJla+fLeH/BHBs6IWkD5uNLvr629NeqWBXxXb8eUuUTSEMnLyRjZhykVrmdVPaicNgqMBKYG1FxwE7IseWPn1jQBpmZ5Y+9sfEYl8DoPJ6fLeJQ2CRvWWUeXgV3UKbaru91w9tOdM26689Se6vXiQzY7mo8iboiQ5F85Ea7cS6BHrGi3wyVklyL7GYDP30NkiBUCE+txk08L9x+57US2DYuHBjqe/we1jixJnGxUqdEjuen7jNgIwT9iTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Wbk/mn2Tlk9e8vxdPAm3UdiFhnDb/a3i97O0sj6r0o=;
 b=kyFuZ+b4D34e0XvrpaAIgWWl639caUxiAlpwOntftBAz5NZ5pqJHjlwxMOI5a1vQNGAmxBvrwKPNmxLR8HXMTS+XB0WlRmG8l2aFxBFEf0SZ+Q1SRnqvoThlyCAgeaEAW9gDxzjb5K4nz6TcKrgjc9VKfuhbc3e+kwllvvcKY2e7B12/KdemkcbyQ+d9h8UjZfk4WBNYvBG1BLeS5cX8XlfUSh4+AQy29Rtotkvr3cmaPnQcBzZtrAOlPm7j0eYol5ihuAmejgTe3aAeTNkCu5iGRjzxX1RBfdVTZNa6OK3LTlXNJl9VSpC5bfKci30HmNEDdwdbCx0WDfJNB70IUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 09:06:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.016; Fri, 9 Sep 2022
 09:06:51 +0000
Date: Fri, 9 Sep 2022 05:06:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v3 27/37] docs: gpu: i915.rst: gt: add more
 kernel-doc markups
Message-ID: <YxsCJjdN0eJncD1a@intel.com>
References: <cover.1662708705.git.mchehab@kernel.org>
 <6d31414391976615b5c1818cafba066132c24e85.1662708705.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6d31414391976615b5c1818cafba066132c24e85.1662708705.git.mchehab@kernel.org>
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc9ff8c5-e225-4a31-8d8e-08da9242a1de
X-MS-TrafficTypeDiagnostic: BL1PR11MB5956:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ia6k1N8QTNdJeK83MFf/jll1Tw8DMiHUC2whcUeqo0LI4P5saxA1GCm4k9zpH/eAOGAvkOdBBOuBY7B6zzSgztjlEL8ARG5rXsYuyKtJw+0vwan0Gl4UkE7uTr8alEg2hZnqmgsMx187dpd9xdBrrYdkvsrzG/kj9mekcMO3nByvci/QsQOtYG3ozzQ1oyOaUFfRtYZ2QImn1MQZrM0zNg5VCQ2QDIM5XtabJzZGme2JRWKA+EL28jZnIYGUBbG5KrNmHrNvMJGRPh/A6rJZgrpcUz1bCC3xarkrGoCFwzn+LYJK04mmEzCagKhmir7O3dlq5Xq1sMslR8S2VAGJMVq9TmzETk1iqsU9L0l/Zjf3CTcpTwM59elJPvc7cYaLiA45Qu82f1cr5NS0iXGE5FZzLnDU4E6mKDEy72DjwRCCIas6HKZsyxDS/1OEWrmsUG4j49Dt+MjpGrh/3ZZ+JNCFix+shERuUAyB9nBu6xwPgSMao1KDH/88k/Ji3HegGavWbGygCqCUY3nndn+YBwNGbkWAhditQHKHFk8fYJcI8mP6niQTa+eopilhOsKT3SHc3JVHZTtpPEaeD0ogK6K1A5NwjoCYViZZiVYp3ObOzSGeVjWv6GhcIQcnRF3UUIa9GchMn9+9DN7I2s4SeNX8l6PQBwjOECjdXmuoJ1klhcKBudHgiSYwWvGtQpuLCV/oNUTsanT8sm9o+axGNpUQ110KpaE06/mirpKiu3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(39860400002)(366004)(376002)(26005)(82960400001)(38100700002)(316002)(6916009)(54906003)(4326008)(8676002)(5660300002)(44832011)(8936002)(7416002)(66476007)(2906002)(66946007)(66556008)(2616005)(6486002)(186003)(966005)(41300700001)(83380400001)(6666004)(478600001)(6506007)(86362001)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dlEawvtUSPLsj0Giqp28jv/PLhZAXPo8r8zFj7ZNkAuNlsBT6MJG6kgevbf?=
 =?us-ascii?Q?7LvzMHXgbn7YJVoUVXjnVlxCCBvOMVnfdZ6B45Ner3L9ryCM9dSFf0PE1FQs?=
 =?us-ascii?Q?T+ozOaUwZEdbewjWn/haWDY77tXyY+7xFawNBwJIGzTE8UKsv6BrZKMJnwKI?=
 =?us-ascii?Q?kQnBrsq+NQA6DEw3XlItquDFj7u9IVctVTjfTHJHbIYtyhAjGdnpQP3O7N8M?=
 =?us-ascii?Q?ynH+30iLGqyoZi4P2r4kgUozIrwHo4jm9tRUkd6aoKiRiPxBPHunXKzJ42EJ?=
 =?us-ascii?Q?USHUtoGCn0pr67yqmTeUBUoHUxk1E0HcNRKKkQP+cOG69NZsoii0XgfHd323?=
 =?us-ascii?Q?59HPrH9H4CDO9je+sEGCtGVzwArRAnInZ4kb2+WrYYO7Dp9/jgzkkv/248zF?=
 =?us-ascii?Q?79de1oj0iNAa/085RIvHiLF+TwJlS8eOV20+yF1dsEhEarUosVrpY+qy+6+E?=
 =?us-ascii?Q?sqmG9MegCbkpuaHEdGZlu6sXqVcDzlUjOE7Lu611/H0YLeWGMCHWRndFCFA1?=
 =?us-ascii?Q?RHJLmobiS5XeqX/VRtxwRXCms/2dFAc/ewKKbvwJMSQ2CpkO8byw03Lvt0ds?=
 =?us-ascii?Q?xMXTgWXGKu14S8IPPTKLGyITcLxAyEGWBChNQguERtLlg6ekyT52qWqjSaQ7?=
 =?us-ascii?Q?fE8ux3T69ajHt074Y4VCe4XS+NA+LwP4JS3jqEYiSca5L/dZtafWeRgYGHe9?=
 =?us-ascii?Q?TFAsZGLqI4zr0vjnvp9VoOG6iC7DYinKACw7FWg2M4PoRftoq0d7ougnu7Cs?=
 =?us-ascii?Q?TbypLvUEl7C4yQkyQalVTEmHO3gNoXDHTQAvU9D0F9+XG3wq+hmmidsmBp+u?=
 =?us-ascii?Q?dhg0WM2Zt2FHVvdc9/5NxyDt8MsF2EIgveCDQF9sQzDjacWSY5bn0I+8/qQq?=
 =?us-ascii?Q?j3wfgbrI8gTkvI9kRrPFSeeSDni1vdMW+HubVKRZugkVf3jEsCr65T42cvdR?=
 =?us-ascii?Q?vTiEYW4N8fwoZDBonjBW8LnblJKlmarDv0Q+LnyusFt4/1bpMAbx2v5qlPy7?=
 =?us-ascii?Q?7CGeaHaykSD4y/dgF8wJljS8ZzWm0hewz2l7h/joAslYy6w/MGvVC6WXKCZ2?=
 =?us-ascii?Q?KaAgkT/Y5qM3TXSE7XJL0nQBgYboWN54ls83UUr62lYFhqjStOs5OaMn59ji?=
 =?us-ascii?Q?62tYsvqiidYH4vHHJ045iatV54sEvyNrMWjqWW+v5+vmUJ9MGSjAX55UIg7N?=
 =?us-ascii?Q?jpemDKfSBek/9nWFmLOxpKj1P3I2WDEbsLciAlTrHT1FbmQm+tdH1Sf0Gkkk?=
 =?us-ascii?Q?39FAecVHaCeL/BzfyO/5O61PK33lWz3JgJypyWicvKyRyDK90O/FcKZDmCzD?=
 =?us-ascii?Q?+z4vXrAq/m18Ga0XDGnBEd9cq8EchJYlq0qf2UySmzhu4YuPr+3cp6n5qSJQ?=
 =?us-ascii?Q?JANmf2gD7ImR1zj2lE0UIn6Xyz7ECYwK0Jd4n5QxA2KccH2GajPk9/l95xQO?=
 =?us-ascii?Q?CBIvWVeEvyFpvGhg1JwxU5TKd4D2xrzGPg1wjnTr+d+wuDcojJryvPQKqtvf?=
 =?us-ascii?Q?PZeHXXM2iIwCjWA6oSKuWzLkoIiVAO/w/R7ksUM6px3ji5qw7fwrlTnXD5nv?=
 =?us-ascii?Q?rWleeu+Da/Pklbm/OcFvoPIfN7/y2ZrryxW8FU+u9xr4MXXwUqY+zOkrKr97?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9ff8c5-e225-4a31-8d8e-08da9242a1de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:06:50.9747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsCXCCP0sVJCVfZgsMrFMTYiRpAWTNsQWdCK/P07KmxIWZfZDjtGaCJqelpMnhT5uOhGOXXDfpwRqcve0h6YmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 09:34:34AM +0200, Mauro Carvalho Chehab wrote:
> There are several documented GT kAPI that aren't currently part
> of the docs. Add them, as this allows identifying issues with
> badly-formatted tags.
>

In i915's commits we usually add a version history here
to indicate what changed from the previous submission,
something like

v2: re-organizing the blocks to group gtt stuff.

that helps reviewers to know if their change requested was
addressed or not.

but anyways:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 40 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 2ad7941a79f2..b668f36fb0a3 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -149,7 +149,6 @@ Misc display functions
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/display/skl_scaler.c
>  
> -
>  Plane Configuration
>  -------------------
>  
> @@ -308,6 +307,45 @@ Multicast/Replicated (MCR) Registers
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>     :internal:
>  
> +GT engine
> +---------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_types.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +
> +Graphics Translation Tables
> +---------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_ggtt.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.h
> +
> +Other GT functionality
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_context.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gsc.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_mocs.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rc6.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_reset.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps_types.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_sseu.c
> +
>  Memory Management and Command Submission
>  ========================================
>  
> -- 
> 2.37.3
> 
