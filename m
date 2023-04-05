Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF06D7E36
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B940710E972;
	Wed,  5 Apr 2023 13:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F86510E970;
 Wed,  5 Apr 2023 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680703072; x=1712239072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8e8mHbmSg4GwX71TxyIKQhodq2ZrvPVRv4TnB0vVMxg=;
 b=GXK9jiHmp6EvTHv9DhOkt0h1qM1F04LaPFUKbBQ7pN5EGVnDTT8TOBxc
 CPnFVrDFdurA2vf53qBCSVLdg0RqbNro1eC8wdf4yMlydnLVJEl/31Ub8
 eHPr+vbwH2xsVYJ9rRZwxW4+DkI6ggosyElLCK0i+z0y+L2BF88mph/Uk
 bTWsba2jTw9zrdc/vWxAUATI946FQwD2Y+48EYnasuoldqBNPSrvK4jrT
 cOIMqn56YQGe1FTZEX7evvAjNmo3M/fH0o3K0FMSuWRyPJm3jnhFJ/r/Z
 iTvSLagHsc51FjxhoBfnGhAzxkxrcgzwD1R5bR3bBR8I2o8blDGcTNJKv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342474309"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="342474309"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 06:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="719331898"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="719331898"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 05 Apr 2023 06:57:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 06:57:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 06:57:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 06:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cG70QySVCZWA4ca7jyFKF9jCbUAHulvAEaztt8qrZIy73h21Nz/pC7yuhVH4cCczAN2jSBxzz2NHrvXgSrbqY2krdkuL90a+MO0VtGj5vMZTTEIFXffXrYz9lohVx6BI5eaUlN6yv7Kyq++o9GwzHgyG8Eo9uvZNRsMHufh+U660eB65JUaSGL/qBlB7F/nO8XTQ5xLzeJQBZg4ILzL413KpXmK5+juCHLhh4gB8wcAkOZh/FTYs4eoMZeV8levqccH+xB1kZz3hWqr+jySfwStIHUygIsgF+gCDpWyzHmNqROrJbWoi/viEQip4dby2WRK4HrBL7BloauEpid0ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSydTq2pAwuYxGO7feTz5qurytcUD8WttS+ZMJL8au8=;
 b=LATJ8Af0gCYfMmypFOGLoNXaVWk7QvydiLHcNH/h8ThC14QgZ4R4b4AuFgIkzLHF4AuYGbex0Vh6n3Xwdnvdny5aavijmg843cJ7WJAQuPXnZDW2D+4YMSBl+1bwH2n+D7RylTrf5jtpLfMLEUkOv0OY8hNSgh31kyWl7IXws7WrQADpnHM5wIv1vs+EoS01vMdqqShzVrhE82RsbZuoRXqTrb1lGGrwWc/PFbQYzT7EM6AhDA1EvYxhEnSLSmb+3SI4qu02/52TcF+kU/EWcg4DJToOQMlU7IRYUyu7ckz+tgBaZmkn2XcZjiU7fmnAlOyA5u9MBkm8UeiiGCN96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 13:57:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 13:57:47 +0000
Date: Wed, 5 Apr 2023 09:57:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] i915/guc/slpc: Provide sysfs for efficient
 freq
Message-ID: <ZC1+Vn+ickyupCBI@intel.com>
References: <20230401020049.3843873-1-vinay.belgaumkar@intel.com>
 <877cuwguu6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <877cuwguu6.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c980b1c-1fdd-4ce2-5037-08db35ddbc5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8ZTlXDjfAmwID4WYFM+jWTzP6lMceQju1sO0w+MlzHcdBi7xt1cGc6Q3A5xS3y4lYg7m/gh66x5nB6p+yr8kHD8ycs89HVCRJrKreDtv/GAcoy1efHViClazQy7JfSh8tz1CVa6xh8VqzbV8hF64H/0r2Ac96oUnnzvO8Ok7iFrg3YS69Tz1Yy+4NPfq/fVnJn93F9BOyd+KeVu4sTj85y8XH8k2FAHD5+EH0IGj2HY3KhIVsAHh4l9VoM6R73K5cRiJBZXRW60HCjr3yA6VRcJ5vqCWHDDJDI8FNi4ZA62UbJIyVNoyQpMTQt9pgzUvhS5aq95CXt0iTA2n9nvftbYQShLfAo6jY3V5h+4ECTZtpwFf8IMl363mv8UZIPTqKPdsucggMj9E9ZCuQdCtOtJR4Z6BQmMUMYTnsEDBtOLaagnCLOuIk/Si6CVV2BSKdakSbIGh9YE1v0ymcvAP8EAEymSIG0dFGjCQ8+vD8jBSk6q9e5I7IGqEYJrofI5ETbpUhpJm5i3u3Z7RRHWD689EWOoH5tyZMgCXYUGFTDu8aLuDI3qn/d1ysOkl0FJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(6506007)(6512007)(86362001)(26005)(186003)(6636002)(5660300002)(478600001)(37006003)(316002)(8936002)(6486002)(450100002)(66476007)(36756003)(6862004)(44832011)(82960400001)(66946007)(8676002)(38100700002)(2906002)(4326008)(66556008)(41300700001)(6666004)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pufcd+cctJUYpAUTstd3cb1U+ktwxJkffRLnicIfhMrXhwDDpOlEObB508Rp?=
 =?us-ascii?Q?jf4x0IMTlUeZG47ySGIK+TN4dUIDYK9YJefEYAIUPJE1V5s1xa9A+flodVnW?=
 =?us-ascii?Q?jw2mwHyxoRXwroe41pnytueicoT7eWxLgN2wV6+VGIoCoF60t708BsOm5pN4?=
 =?us-ascii?Q?KioqDGDxefyshMcVjkAi8kg9A1KONBN7psV2GwRWYiC4irNEZAY8qobKdHrU?=
 =?us-ascii?Q?dDIa1fj3r2JmC1WjzfJ929BdBgfDqHuEPZ/AZVZ+clp+2GH92ZJK9PmCCA1k?=
 =?us-ascii?Q?f0F3e5D6kRkqbkzxbQ5you6uMELgU9deKbCgzmyXQcPsHk5gNzVGqcXg72ZB?=
 =?us-ascii?Q?CqEAMUy+mJzd2j+p06kd9VYxL3eyE0AghPPlFu4xh4vclBl/eN6N3oOcCxRX?=
 =?us-ascii?Q?V/PtLb5XtGbl3dUTPy7iAy+nELLNSDDVQbYOznNRQAXgpTDcOW3NyPM/MB1z?=
 =?us-ascii?Q?QGb31TlgT9a9QCTCBZ3+NFhq+1pVQlpMktNlDOw2bdAiJ411BR1oZfRMaVuD?=
 =?us-ascii?Q?lnTxWYcNxZBkU4NWWuQDxJWBaToevOwvx8Mpzs/UglJgro0BnTsVt7ISOo4m?=
 =?us-ascii?Q?jGF/2fkKd29NLzkikjNCIb0rXeKJLw7ZqOwoFvOXJCOQ0XpKYyL2ZJxPoDgB?=
 =?us-ascii?Q?XZHYs14Afr1o3aVjHe83ECncBfdk0NJqml7VtYx0VpQM8CPS2ljkGcMUGNRP?=
 =?us-ascii?Q?B3xLlYU5obm1hV9I/Gd4/heZytRljaaOSrfU1FWzSwNllBGk6fiv0sxrP+gk?=
 =?us-ascii?Q?mm4johkzHXWtClYPP38qmoitJkUyJT29212fbAR/y8NkPzCxEuNhm23qNvbv?=
 =?us-ascii?Q?WeFVZWQ3FrzW9nlG+4SozPuiINUNo6hJdZIDUZKThfrv5n9luqjSX+1RjChi?=
 =?us-ascii?Q?ew+mg2ZJQ+1mesIibdjx1TiirguxJFPVbmIlWPGEhBkPkdX9nJeVv6DwGHTm?=
 =?us-ascii?Q?jkbv98lfmgiacq3A1TJqj5QXyyQQJZgof3YE4BGpb/tTI5mM/8GuQxm1iZlg?=
 =?us-ascii?Q?gQXO8ept0e1HTN7m0KmbROyzgw9qShuP8X6G59mTGA0Q1Nuj5l/iLKhcpxdE?=
 =?us-ascii?Q?oaFTbo3GLKgeaN3ZBfzMfgw98zD8dqmiTH6BZkXYN67JYpyuZ3e3aUFu5xJz?=
 =?us-ascii?Q?34hKPklNM4DeMHyfF9XYXLRa2zPzvM7BdzzHMTwPBWm8eJTKmVSIOsvjvxeU?=
 =?us-ascii?Q?kIixxvZogcWfApwBlRoNymmB1Tig3/S5BL4JJC4gXMDPGpdzdBQwVuCmNOP4?=
 =?us-ascii?Q?I+x+Koxr+2DJ1EdUGGeCjD3fynHPtkW9UshNpespKMWNziMXEDPSDq531St3?=
 =?us-ascii?Q?qsfSP9aIP5RZOYKlPZZkH9Xn0jDy7E0NCCO9av89erp9j0XBar23fSrUESny?=
 =?us-ascii?Q?Ts+H7SqAf3tuVV+LEe7f9kHfPR1F7ju8zTuRhH7kzhCd7Be8JKYzuS/GamNM?=
 =?us-ascii?Q?fTZCSDnnZlF30/G8l8O9yF81MDEfmmpNXTCQmSK73aJgG12KegZVRmDW00yR?=
 =?us-ascii?Q?HceJSqgMwKlPnQb6bfg/7uyn2f0eUZeEDuCfxxGov/1SZN0/m1O6s6Fzu6Al?=
 =?us-ascii?Q?2SFVetNz9/FiEEogh2LkUBDogDib0GCFF6inHzhZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c980b1c-1fdd-4ce2-5037-08db35ddbc5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 13:57:47.0877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmZy+7OeQMle9tzX3XxmOec7VZ8LUni6lnzKj1Z8bOEQoOS/7SJJiwN3wRkJ1jWrMvfDWQBQ2nbLx8GBrGh2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 08:11:29PM -0700, Dixit, Ashutosh wrote:
> On Fri, 31 Mar 2023 19:00:49 -0700, Vinay Belgaumkar wrote:
> >
> 
> Hi Vinay,
> 
> > @@ -478,20 +507,15 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
> >	    val > slpc->max_freq_softlimit)
> >		return -EINVAL;
> >
> > +	/* Ignore efficient freq if lower min freq is requested */
> > +	ret = intel_guc_slpc_set_ignore_eff_freq(slpc, val < slpc->rp1_freq);
> > +	if (ret)
> > +		goto out;
> > +
> 
> I don't agree with this. If we are now providing an interface explicitly to
> ignore RPe, that should be /only/ way to ignore RPe. There should be no
> other "under the hood" ignoring of RPe. In other words, ignoring RPe should
> be minimized unless explicitly requested.
> 
> I don't clearly understand why this was done previously but it makes even
> less sense to me now after this patch.

well, I had suggested this previously. And just because without this we would
be breaking API expectations.

When user selects a minimal frequency it expect that to stick. But with the
efficient freq enabled in guc if minimal is less than the efficient one,
this request is likely ignored.

Well, even worse is that we are actually caching the request in the soft values.
So we show a minimal, but the hardware without any workload is operating at
efficient.

So, the thought process was: 'if user requested a very low minimal, we give them
the minimal requested, even if that means to disable the efficient freq.'

So, that was introduced to avoid API breakage. Removing it now would mean
breaking API. (Not sure if the IGT tests for the API got merged already,
but think that as the API contract).

But I do agree with you that having something selected from multiple places
also has the potential to cause some miss-expectations. So I was thinking
about multiple even orders where the user select the RP0 as minimal, then
enable the efficient or vice versa, but I couldn't think of a bad case.
Or at least not as bad as the user asking to get RP0 as minimal and only
getting RPe back.

With this in mind, and having checked the code:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

But I won't push this immediately because I'm still open to hear another
side/angle.

> 
> Thanks.
> --
> Ashutosh
> 
> 
> >	/* Need a lock now since waitboost can be modifying min as well */
> >	mutex_lock(&slpc->lock);
> >	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> >
> > -	/* Ignore efficient freq if lower min freq is requested */
> > -	ret = slpc_set_param(slpc,
> > -			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> > -			     val < slpc->rp1_freq);
> > -	if (ret) {
> > -		guc_probe_error(slpc_to_guc(slpc), "Failed to toggle efficient freq: %pe\n",
> > -				ERR_PTR(ret));
> > -		goto out;
> > -	}
> > -
> >	ret = slpc_set_param(slpc,
> >			     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> >			     val);
