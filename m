Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B862FB5E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 18:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE2110E7A0;
	Fri, 18 Nov 2022 17:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518A610E79F;
 Fri, 18 Nov 2022 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668791724; x=1700327724;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a/vFguqZKwKATgnYZ7gyztRY3/7Is1He0OPE7qTfi3c=;
 b=ADj8sQ+g3WCvzUK79W4uMaYbHKmVm40OF24Q3G2Y5orB5/lqTsdwiqUP
 1n/709FDbLWLhlM9doxq93uWaUvyxUnIyxYA7bNPMcz1Zjg2obEs0mLuz
 K3O0rlPXlJcWPCjQAW1fH4ZanVisuNyhTv5m2Ol/++zYQ5puMVN3xPSO7
 j47XS68OYthdxCoE3sMiQ+xCu+DuJbbf2tRzOuAPthoqIJNXaVexUTiW3
 opahvCVrju4eA2C6qkV+Y6CIC6/kRrLWcCjaAp5mEFrNMGX2+sos12REh
 tWfmuvZs7PNtoT3lEpeOymqItyLKt3dQ3dYJjNhu0sFNYFI5itePO2Doo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="399471177"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="399471177"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 09:15:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="671381942"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="671381942"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 18 Nov 2022 09:15:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 09:15:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 09:15:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 09:15:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 09:15:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWuvsX08IdIRShl7wWLgUgMCMiAaivOc3vtJO5Kf8H20mIyonpoiz2hn+Wrn+BRqeNJc/wwSQ9FHORCldz6oQwO2bMZv3zCPRpopsRABSvgNnIpw806byUPG5GS5e6dQcjL2cS0WcmxRxxLf6v85SiZTi4lQ6jnf9M7QwMtKP+cLsqEB7zZDf9lZDCYk5qTltYIvneYIp3AkafDB+vj9H1aPf6X5ACM7ICT3HnzgNl2EQpR1TrMIMtGi5fS5bKeIDUPLLXbe+ghc1vxrM7jLcTK+EoF5j6nq7SRHR0hbf8jbcU3s0yBpbc8Vm6EWXt6kKjw4slr26RHGvX/Q2INWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZHzR8oWNotGly9hg/lTvOQFDKLEX8RutirCmQekpxc=;
 b=dXHnn6usiCaacOi5Lr68XN65KcQY+lhJZSnTgax7YnGUyrHergyXh2qxRhqyNpjU0RgZXGS8bduAyTM4FXJJGhAUA00oG2ohomyW5fZgAKMUeH38Wji2LBQDyft9EGxvksbZ8lH8drFn75FxHe1xic+DceK8lSo0CkyNaEaYnaEKvsgbE8nfQTd2y6oQhjNVt1J0hm2AACpEpLL4UG9CHirvUdsTgGx0tUcdVG9R8r6Hs5AGXEgj9RxoOa8DfPaabECsJdl3+FWw6SzBZnmWSdE0FjlJNsOyASqcVd1KVWel7IKfA0fB7dvDnmYMkeMeetBYitBAb7KcM//sb+fK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 17:14:57 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 17:14:57 +0000
Date: Fri, 18 Nov 2022 09:14:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix workarounds on Gen2-3
Message-ID: <Y3e9j8enFhq7//Bn@mdroper-desk1.amr.corp.intel.com>
References: <20221118115249.2683946-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118115249.2683946-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db6ca45-8f5a-4b17-4a40-08dac9886b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1riFxxKiOlSdI35URKX8HGU0oGZe9coVjFtCChpLeAASRVeHKjIWuLPCnBg4FOTE67qng5396jVUXSECCiO5/1sDyzo0XMTa/YxoDwZ+7T48Jbn5H4MWgH6XE6II3d+iqTEbsU7tSvLh7nTbAISyDjBaWLrpvEF1Pg1FZ/jrw9IviqXF4h/39YhG6oH9pFFnbVa7FGcANUhq5qIb5X15UxNWzabAM9JsNJi3mqpIOHaM5QLvWF9DZPkdNU88qRqY8vfqi2IboTXwJIk/7QaW5i0Zy4dZlUIj9IL7lWIzGLr8i7sf73sVOIsn/HN+Kc6mQhYIUB721miRk7PNzvYDMGCBNIjDUmxTxi+D7V5+ONMXCbmtdnhhuWPlCym6qPV7isRSITUf5F9xtgone4F3vpqjhdO/PoWufKyu1xIi5KvLhMNUEsFZl8CQbfYtpZqZSHQOPzcL5E5R/Sr51SJTWdjFQUd6aK1RdrwE2/qtTB8zbQcrGn1XyC/ERcFgErZAmGU6fYaWmgclvFCnrkopdzi8v2SONZPa2REzAIeMmbUV9ouAWBmI8QTht3Rwbg4KgmV7E0a5X4d8yernObFqKB/X10aYqpOH3M+nsyEd7T++R7S50Y7L63GxmRrCd4A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(6916009)(6506007)(6512007)(26005)(66556008)(316002)(478600001)(8676002)(4326008)(41300700001)(66946007)(186003)(8936002)(2906002)(66476007)(5660300002)(83380400001)(86362001)(6486002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CeQA3NWVOWgSriqR5SOY6foX4l8lBoHA3cdik1vT6S8CnBhRpwUJVmQ6ia?=
 =?iso-8859-1?Q?Xlkbsg+rtuJF+qR2VNQ3BQv9erv8TA3wDCOS/HlDm8Jbnt8fijId0sXHaN?=
 =?iso-8859-1?Q?yH+qVQLOlWsY3rrJlHvVSkwZdSFCbQyQl+DDR31n50nKp9LGMkz0KdubFL?=
 =?iso-8859-1?Q?ILiUCPyUK3h55KCydzxyPNm0VfHPPobgCja7w3O0Zb+OW0cg+u/gSHLkIo?=
 =?iso-8859-1?Q?sKhYDYVbo+23k2R427S6t9E6Io+oadZiOxoOfnElp4FQzXu3IxMrOr0GF9?=
 =?iso-8859-1?Q?9jWVdsUp3HKzLLWyPSIrrNNt+39ctTxxHbvAkAlnRwMYOU32iku9pSNyl2?=
 =?iso-8859-1?Q?8GR4bW3MuAfQY+ZxWr1wGswwvbwuSmsmmNm8RGwxkN5qSdX4KG86TL/H5y?=
 =?iso-8859-1?Q?M66b6lxLpWKuutirp/wOC0g/KvXUV5/afzRNPxAsd+vyjsFmgMcHPfKrgV?=
 =?iso-8859-1?Q?cRP6ggCHAjCZfgWYu+xmMfaeoxVmlE1kC7dD+8qlXE2q49dX5KbKBJWKOn?=
 =?iso-8859-1?Q?9UaoN7YuVP0UxOBqcn79FExsos5EGQPZP8UMDaPAuivsqYigWal+YdhATN?=
 =?iso-8859-1?Q?e9fCKe7ORmCQVrXDCeezW7XNuuYEMK2lvm3whXNDtwUFgqZbsETgJKHyxW?=
 =?iso-8859-1?Q?3U9+C0KefQZuTANHT4SS+vwcWSOxfSGWnF38KRS97167WT5hapNBx5uIt7?=
 =?iso-8859-1?Q?+u36qEcruICfw+lw2SMe85/FE314aXPg7PBl8n8IUtFrqQC5GnE/paU40p?=
 =?iso-8859-1?Q?tG3ywdDEqb3QseqdSZ8ySSCBzzKHELrTvinQsEbEOOuElhaYTxRvL7TJIi?=
 =?iso-8859-1?Q?aAfSvXV+Hm5t7rIVu++rXk+V4fkh2//5CHG2226+V4JaP7RhH19uJJCF8O?=
 =?iso-8859-1?Q?SLntTPhkhZuEGt4UWE6zmiMFpb/7SeITTzbPyQ0eMO963ZwSeewgp/WWSJ?=
 =?iso-8859-1?Q?rFi0LQ0q7h2HkdRlAPUzGXHZQuErw+LJEOsPh/PQrgE4JoGc5tbdRdIsdB?=
 =?iso-8859-1?Q?bHtlmJiWwoFCPq7tgjUp1GDSgqjeDmplYLIH0K8/7d9hPhVdvhBw5/7g0Y?=
 =?iso-8859-1?Q?cMwCsyTW1nB7eLbRzw2gMwHr9KCwOQ0F7yc+khuCiuxcuYh7P6dnOOr+q3?=
 =?iso-8859-1?Q?VHd9m0+AcMVU3jkJusW2pdQGBjAzqVNycps9vAGlgcQS/tgpWzVLFO56eC?=
 =?iso-8859-1?Q?HqDEszyvpiZjqtzfYAezBBasmAynZ7fauFORoO5mjmvl/n+qlxKmhu5Os7?=
 =?iso-8859-1?Q?zMgnK0eK+p9iaDKXU6BokNjhrinZ1GWa10GTopJ2gdVJmEtRfzYo67P4VU?=
 =?iso-8859-1?Q?bY7y7F2DnoQ8UMog8ofG2GrK9AM05WuaxO1ApM+/HHBXQFNcbhUBBXvsmq?=
 =?iso-8859-1?Q?VL5ZXQrh7Nfi6VIkaf4nTY0ZjdbCCXx6+XHNuKuLmX0TFExLl4L1nVxgue?=
 =?iso-8859-1?Q?OsHlNzFKmvRC1Jg6exFAVfUi8xqjFLbU8KSu+aYzmAEFcNhSFnLZMR/T8t?=
 =?iso-8859-1?Q?6AncDK2iw2dNXceXfxRGw/cqbTJ+nfXutZ1MIli8vqbn7WzBfob1ZJUfbg?=
 =?iso-8859-1?Q?BAnNQjy6OvU9t5m5ceoQuPFa62ZKCbaO8wdjgLtFhZdjesZSsk1JTOiY2+?=
 =?iso-8859-1?Q?x8u+pyV1Lr1wLpyz6vYvVU59i3uSAMWZVlChrHEqVxg9ozcE0L6zpsow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db6ca45-8f5a-4b17-4a40-08dac9886b0c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 17:14:57.6455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnzWYUGtwpVRruWF1d6Gi85Ttyk/qYqsYtmeklYMyxGuF5pPOsDSBwbMRLpBqJ/GXgnBX/4qRpXmactihkJc6FbmFuM/ih6j8AkAfjPSZQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:52:49AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In 3653727560d0 ("drm/i915: Simplify internal helper function signature")
> I broke the old platforms by not noticing engine workaround init does not
> initialize the list on old platforms. Fix it by always initializing which
> already does the right thing by mostly not doing anything if there aren't
> any workarounds on the list.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 3653727560d0 ("drm/i915: Simplify internal helper function signature")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 213160f29ec3..4d7a01b45e09 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2991,7 +2991,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  static void
>  engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  {
> -	if (I915_SELFTEST_ONLY(GRAPHICS_VER(engine->i915) < 4))
> +	if (GRAPHICS_VER(engine->i915) < 4)
>  		return;

Do we even need this early return at all?  As far as I can see, letting
this function run its course doesn't wind up having any effect or cause
any problems (you still wind up with an empty list).

Regardless,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  	engine_fake_wa_init(engine, wal);
> @@ -3016,9 +3016,6 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
>  {
>  	struct i915_wa_list *wal = &engine->wa_list;
>  
> -	if (GRAPHICS_VER(engine->i915) < 4)
> -		return;
> -
>  	wa_init_start(wal, engine->gt, "engine", engine->name);
>  	engine_init_workarounds(engine, wal);
>  	wa_init_finish(wal);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
