Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B27C8E87
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 22:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13D10E661;
	Fri, 13 Oct 2023 20:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A4510E641;
 Fri, 13 Oct 2023 20:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697230304; x=1728766304;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WhAj4LKGRSy1Cv1b86cjuIpe6jWbPhrjH4fmLKdlXhk=;
 b=EHCuQLahj4VHfb4bbGoJjLvCks/biTB5PjwUzJ76XTBcOaT+0w3hviu3
 4U6+4BYMHkUBJ5eliEERAlfexZb33VAuco6tMVlmxdIYWRKh3+qZI99sZ
 14SI8lbfdFC06fDtWZrOIymgp+46JIAErBYHyBuqQjO1JZVoiNvs40Esa
 KOzwJBrrmRWUERx531pqX/kjW4UEWj/Gvsjh0fv4xmSJfqCLpa66DL+lF
 GDVpnRJlKTF8hv7JalNPg3RxJw2n1C7C0DGkMMgdG3wmFrro2OfNKCmn7
 Eh+1j43kguUAiYMTcx5GeR5Y53gJ6GI4rpHhgFANe7gegvESlbqketMKe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364627333"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="364627333"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 13:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825191781"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="825191781"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 13:51:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:51:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:51:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 13:51:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 13:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJOWtknidPmxCbn0hU8l6M5jyCj2hufBqB+d+kivjge3ooITSsmyEvRI3+NAdm6Q/YU6W/3utKVe2dqmL4mSoXEsV613Co00nyed8erpeJQMVU8sm1SrTakXuqY4bp37M/F5ik2tOJi/oeD+OIFoNbBp17dZy6xnMuVYZ9IsDXC8i52fx0kbZhQBXm6p6h0GOd1OupoWtKmw3H3bmC4WWvZj93R6eQwtHDbCALRQAm99BBaQmCOI+Y/iDR43uZz8F/QiqHeXPr3PPZ+92XehyD7OAVhi9FNNIAMjPcDpQw+6GW3BQzVOZ/Syt44NtHU8GP/p/13H/pvmmJWC/Cg3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNLKL0FQ9nstZfDAf+7Uhs8vUmarfBcD7zuJ5Mw2h/o=;
 b=l9k3nw0SDr3Hn/VeZGODOsG79hqmUqBhJeZlWsc8LmRCiD4WAIUA7PsJYEnpPv9Rd+w7+ap31gnWwFbfuqie7tq83nsUH4aZSVHamcRtLWoLoEQXpMbBAEjK+NOyRzmCj0gnsRi+RUVvxmWaU1kWR4/j3GwMcZu69vhYSPQwoyleTeyz3DjgYC0QgxEdlqb2XsDH2s/oQa59hF59TTQtQ3564q6TbbF8mfnhJrZTN+ainMwGwrP5zLXxKQ64tzLv4WJXbNUSHxoxtj7VizlAMaXnS9YcaNzcg5mhgI87H9UU+fUVpKleKN/dQeFjMVrSiA+ABR5aRq9SA2eoEN8TEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 20:51:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 13 Oct 2023
 20:51:40 +0000
Date: Fri, 13 Oct 2023 16:51:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Allow users to disable waitboost
Message-ID: <ZSmt1u9fVNDyMFgz@intel.com>
References: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
 <5f7f3950-bc9b-06cf-611c-46c360bb90e9@linux.intel.com>
 <915a5e08-5daf-153d-cb82-b0f9e5bd3b2a@intel.com>
 <6d8c7fd2-9eca-14fd-6b44-edeb15a6e6ac@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d8c7fd2-9eca-14fd-6b44-edeb15a6e6ac@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 295d576d-a879-4a7d-3751-08dbcc2e3338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1TTWbS+KC2b716trjzS7Mjwxj+hLfNi+WyhS+jxl6EIRjuehYasQaeqV6eBns0mLAdRWf15PFWHKRdbKbyJSVLryfcHc3x5VKmTd/cMxK+27kAB2eBwmCIc+bHgLCpLZAmHRM1ha1ciKnCOn2Kf3YHGssckhaBAsn9orFggAcEHYKrbM37nuAjSN16yd7e7nh6I9lhUtjP/TGPHyPkpmPNdHZf6aejmoXtoXppSDULOkv1CcMAQkiOuzTQDAQ57vFX5ih1/CvBXJJjT2TWFfIFfD+4LDw0QAvqrz/VS+kYRP/+IvCjWxF9LdcNY1vk7/ZDdpaGsxmSXw4XuNwZwD9BYLGCy0nlpW67Pcd9z8b49prfUuspH/YXcAvFPlqvqlyb02fGW+h/HASP5dMxtxYTVlurz11Nc+azj5mwDh9bVjZHmcTr+vdigqeZ6DosqjgMhcIPWa8HGO6/QKI2bUxWMF4efmEkUdM3Y7P7sw5az8IaaYnx8BBknaAuhLy0QUUQ7kR2rDhV3V7MUfMRcniVWmyrurWfKYrFTa41IwaY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(2616005)(8676002)(6506007)(41300700001)(6666004)(5660300002)(66556008)(53546011)(26005)(83380400001)(8936002)(44832011)(4326008)(2906002)(966005)(478600001)(6486002)(54906003)(66476007)(6916009)(38100700002)(82960400001)(316002)(66946007)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FFrX0BM1/4vZf3UYNIPTUz860d5YPKG3/Tf6s+SUYr1gLl5hrCrU2eyVcJ?=
 =?iso-8859-1?Q?eqdkMSurwSXNpl1m/9jivgBftSz6DOGthGUXRF6MV0+5rebDx5pO4Q80O1?=
 =?iso-8859-1?Q?lsIo82fL6xzgKS6wDlV4iKkwIzOeB4p6FdiY8R6hHpZPLCaUD081vW5Yp8?=
 =?iso-8859-1?Q?9rdAG0SKwFIV7sIpqcxedqfiP6J0g5QLf2DRkdg9H45HmhGslEzjKGQ5P1?=
 =?iso-8859-1?Q?veEWfM9f2NY1/ooj5UTeoLThVwD5FzmAK6cf3a1J82L6D+LJtmkOi5RKlD?=
 =?iso-8859-1?Q?xF7l49FObeeGGb6nJ8yp6kX8iC0zlot7njrZrRKF+rjKYn56Ed5C3xdPms?=
 =?iso-8859-1?Q?m/GAmX1vtGbi9Goe1Jata7GlNzl2T8cfsjGREwCF5syLzYefCF8FZ1qlcd?=
 =?iso-8859-1?Q?5WFTCkXkit8x0oxxorfXv2Di+J/Bsfh0mI6gYjRR3dTJ5xK88csnD/MBDC?=
 =?iso-8859-1?Q?CZB/bgdgbSEKcWud03B14qnBNWCVTBfPX5qjnCLyVDXf0x1lwAUmU4VNaL?=
 =?iso-8859-1?Q?1uOsqrJQLU3Xzpx2+SUAKLgVmTo7aGGwAHtZSHxN6Bgdvv3NiYIVA5/b/6?=
 =?iso-8859-1?Q?Nr9wKF2EYmNdk8j4JSNDzJ3Vgr4WcRe/alCrgVzm5fpFe9TkWeMWfEHHR6?=
 =?iso-8859-1?Q?i2GcA+Kyp/JNWXvqpm4kW3hwyguZ4Wpo1EyBXdeZTrVJeEiVYEAxyKZZKU?=
 =?iso-8859-1?Q?l1vo+Qz3RuXZrHJhQUAhvglFa5hnmEoYNd7jJuqdM/NUvV19l9lJNQxss+?=
 =?iso-8859-1?Q?ioR9902wm6DV69VQo5SxL12o2+2Aj1fe5NXd5PmXCcvbtKXmcYJz6BGJw6?=
 =?iso-8859-1?Q?BTGuq/D8cy+mIdJz9K4fJb19L9oF0GZZbzQMNjtCb0JZRJkb2/RwoSilub?=
 =?iso-8859-1?Q?PprAiBZjU7Lxcdk1fpoDkMg3+wTaj62AB+jfJgKmUvCVGqfO2NWSBM5vkk?=
 =?iso-8859-1?Q?PFIiR2Jizn6lZ+UOgccLOyvNzo0qzUIN0V5bOB4QZ5dGOOWWCa7Rs/DSAQ?=
 =?iso-8859-1?Q?lGWGjvXXfyyW6zc9FVO10VQF0buyd+UNJQb+NI8XGFFiz8wiIOnxM5rTgP?=
 =?iso-8859-1?Q?z+Yq2995EzYjCQm6ZGKDCeMKimNh+Q6yA+FGSuANAyTzsnqY9lqTrav4zU?=
 =?iso-8859-1?Q?snsxSJzhf0CQjvHgtlSvSL7ngYnajgXbY+MFt08WGl2xdrzrvlx+kGOt3D?=
 =?iso-8859-1?Q?bW9IWbUns2HVxVua+eHeasSggge095peuCMt2eOuCy4iANuHUNq6a12D9E?=
 =?iso-8859-1?Q?nZMVuwLxWkXUvCKKaneFKBSqBI9yucTWe2m6TqXXPJDzeZtornA1/Q5Q0E?=
 =?iso-8859-1?Q?fVLBahKEz1CBYHCexxcnEnuA8XkoA4u+xZrzbmkPdP83nMUIEULCu7bwM7?=
 =?iso-8859-1?Q?smsE/pm/fe3GTUsZ8OkzQUn7Trdi35kOVvRgewnf+gvQipNs2m9gycNHPH?=
 =?iso-8859-1?Q?Lt30L5qVehMEk85O80k5L502rg2vOohoeuT7KCf6jeGdjV+7iO3Wx4+htp?=
 =?iso-8859-1?Q?DxmlE4V1ITKesTbV4p2BDdKHAEPHmZFwbc3QFTJ3Bkk1dHu8sdneXlZgrP?=
 =?iso-8859-1?Q?f2yR0GJ7qQNr32uTJOUrr++i+FY868o7UO37AvT2L9e3/MAW4BwHeNkgcD?=
 =?iso-8859-1?Q?yhBKdHgnL5e0MFjGXHAL7bmC6OUZSBDwDY8eZNmMEqtZGIqI5M4peiGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 295d576d-a879-4a7d-3751-08dbcc2e3338
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 20:51:40.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xnZv+/8YAYq4YDPOEiafxnLtCZHh2VQTN6V845nOEMp68FofMB5W0jPB9gDDv16uHkoUeBTteI/ZXmwL5Sz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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
Cc: Rob Clark <robdclark@chromium.org>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 01:48:34PM +0100, Tvrtko Ursulin wrote:
> 
> On 27/09/2023 20:34, Belgaumkar, Vinay wrote:
> > 
> > On 9/21/2023 3:41 AM, Tvrtko Ursulin wrote:
> > > 
> > > On 20/09/2023 22:56, Vinay Belgaumkar wrote:
> > > > Provide a bit to disable waitboost while waiting on a gem object.
> > > > Waitboost results in increased power consumption by requesting RP0
> > > > while waiting for the request to complete. Add a bit in the gem_wait()
> > > > IOCTL where this can be disabled.
> > > > 
> > > > This is related to the libva API change here -
> > > > Link: https://github.com/XinfengZhang/libva/commit/3d90d18c67609a73121bb71b20ee4776b54b61a7
> > > 
> > > This link does not appear to lead to userspace code using this uapi?
> > We have asked Carl (cc'd) to post a patch for the same.
> 
> Ack.

I'm glad to see that we will have the end-to-end flow of the high-level API.

> 
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 9 ++++++---
> > > >   drivers/gpu/drm/i915/i915_request.c      | 3 ++-
> > > >   drivers/gpu/drm/i915/i915_request.h      | 1 +
> > > >   include/uapi/drm/i915_drm.h              | 1 +
> > > >   4 files changed, 10 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > index d4b918fb11ce..955885ec859d 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > @@ -72,7 +72,8 @@ i915_gem_object_wait_reservation(struct
> > > > dma_resv *resv,
> > > >       struct dma_fence *fence;
> > > >       long ret = timeout ?: 1;
> > > >   -    i915_gem_object_boost(resv, flags);
> > > > +    if (!(flags & I915_WAITBOOST_DISABLE))
> > > > +        i915_gem_object_boost(resv, flags);
> > > >         dma_resv_iter_begin(&cursor, resv,
> > > >                   dma_resv_usage_rw(flags & I915_WAIT_ALL));
> > > > @@ -236,7 +237,7 @@ i915_gem_wait_ioctl(struct drm_device *dev,
> > > > void *data, struct drm_file *file)
> > > >       ktime_t start;
> > > >       long ret;
> > > >   -    if (args->flags != 0)
> > > > +    if (args->flags != 0 || args->flags != I915_GEM_WAITBOOST_DISABLE)
> > > >           return -EINVAL;
> > > >         obj = i915_gem_object_lookup(file, args->bo_handle);
> > > > @@ -248,7 +249,9 @@ i915_gem_wait_ioctl(struct drm_device *dev,
> > > > void *data, struct drm_file *file)
> > > >       ret = i915_gem_object_wait(obj,
> > > >                      I915_WAIT_INTERRUPTIBLE |
> > > >                      I915_WAIT_PRIORITY |
> > > > -                   I915_WAIT_ALL,
> > > > +                   I915_WAIT_ALL |
> > > > +                   (args->flags & I915_GEM_WAITBOOST_DISABLE ?
> > > > +                    I915_WAITBOOST_DISABLE : 0),
> > > >                      to_wait_timeout(args->timeout_ns));
> > > >         if (args->timeout_ns > 0) {
> > > > diff --git a/drivers/gpu/drm/i915/i915_request.c
> > > > b/drivers/gpu/drm/i915/i915_request.c
> > > > index f59081066a19..2957409b4b2a 100644
> > > > --- a/drivers/gpu/drm/i915/i915_request.c
> > > > +++ b/drivers/gpu/drm/i915/i915_request.c
> > > > @@ -2044,7 +2044,8 @@ long i915_request_wait_timeout(struct
> > > > i915_request *rq,
> > > >        * but at a cost of spending more power processing the workload
> > > >        * (bad for battery).
> > > >        */
> > > > -    if (flags & I915_WAIT_PRIORITY && !i915_request_started(rq))
> > > > +    if (!(flags & I915_WAITBOOST_DISABLE) && (flags &
> > > > I915_WAIT_PRIORITY) &&
> > > > +        !i915_request_started(rq))
> > > >           intel_rps_boost(rq);
> > > >         wait.tsk = current;
> > > > diff --git a/drivers/gpu/drm/i915/i915_request.h
> > > > b/drivers/gpu/drm/i915/i915_request.h
> > > > index 0ac55b2e4223..3cc00e8254dc 100644
> > > > --- a/drivers/gpu/drm/i915/i915_request.h
> > > > +++ b/drivers/gpu/drm/i915/i915_request.h
> > > > @@ -445,6 +445,7 @@ long i915_request_wait(struct i915_request *rq,
> > > >   #define I915_WAIT_INTERRUPTIBLE    BIT(0)
> > > >   #define I915_WAIT_PRIORITY    BIT(1) /* small priority bump
> > > > for the request */
> > > >   #define I915_WAIT_ALL        BIT(2) /* used by
> > > > i915_gem_object_wait() */
> > > > +#define I915_WAITBOOST_DISABLE    BIT(3) /* used by

maybe name it I915_WAIT_NO_BOOST to align a bit better with the existent ones?

> > > > i915_gem_object_wait() */
> > > >     void i915_request_show(struct drm_printer *m,
> > > >                  const struct i915_request *rq,
> > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > index 7000e5910a1d..4adee70e39cf 100644
> > > > --- a/include/uapi/drm/i915_drm.h
> > > > +++ b/include/uapi/drm/i915_drm.h
> > > > @@ -1928,6 +1928,7 @@ struct drm_i915_gem_wait {
> > > >       /** Handle of BO we shall wait on */
> > > >       __u32 bo_handle;
> > > >       __u32 flags;
> > > > +#define I915_GEM_WAITBOOST_DISABLE      (1u<<0)
> > > 
> > > Probably would be good to avoid mentioning waitboost in the uapi
> > > since so far it wasn't an explicit feature/contract. Something like
> > > I915_GEM_WAIT_BACKGROUND_PRIORITY? Low priority?
> > sure.
> > > 
> > > I also wonder if there could be a possible angle to help Rob (+cc)
> > > upstream the syncobj/fence deadline code if our media driver might
> > > make use of that somehow.
> > > 
> > > Like if either we could wire up the deadline into GEM_WAIT (in a
> > > backward compatible manner), or if media could use sync fd wait
> > > instead. Assuming they have an out fence already, which may not be
> > > true.
> > 
> > Makes sense. We could add a SET_DEADLINE flag or something similar and
> > pass in the deadline when appropriate.
> 
> Rob - do you have time and motivation to think about this angle at all
> currently? If not I guess we just proceed with the new flag for our
> GEM_WAIT.

Well, this could be the first user for that uapi that Rob was proposing
indeed.

The downside is probably because we should implement the deadline in i915
and consider all the deadline as 0 (urgent) and boost, unless in this
case where before the gem_wait the UMD would use the set_deadline to
something higher (max?).

Well, if we have a clarity on how to proceed with the deadline we should
probably go there. But for simplicity I would be in favor of this proposed
gem_wait flag as is, because this already solves many real important cases.

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Thanks,
> > 
> > Vinay.
> > 
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > >       /** Number of nanoseconds to wait, Returns time remaining. */
> > > >       __s64 timeout_ns;
> > > >   };
