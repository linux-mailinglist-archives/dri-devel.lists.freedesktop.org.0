Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B7B58D70E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2AACDBDD;
	Tue,  9 Aug 2022 10:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687EDCDBEA;
 Tue,  9 Aug 2022 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039390; x=1691575390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TB40YLkW1P87lJs+jcPux+rc3l9VXeHWwrDDxmF07oM=;
 b=RCkJdnsKGFSAlUntxmp6jgho9nfFpmehmPODNmTThcgRkR///yzih4I9
 pLe13ejaCmk+VxEP/347zZNj1yRhyCtB0HaHeB7E52yh10UPkL3m6tRmN
 EmDvpXLzl6q/DI37pN6XUhA5mqlNeLEo//zXlPxGpbHTPLDKlaVN1L9kU
 t8BL8krb022v2icaYuq2nlZI7WzoSFxedIEb84dS8VCQCWJ7WVDwOzeVR
 C7DBCE/iDuqz7V4YHpnNIEsqtrx34mRTraLlT2OfNGqASQwXN0zxSxcK2
 U7MEi9VivRx7tStg0Rni327gOvHMsFy1VfB2N2wzmcQGTCcT58tm6Fzj/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316728113"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="316728113"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="555281444"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 09 Aug 2022 03:03:08 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:03:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:03:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:03:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:03:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxFe7nmwmphfHlqnzSGdf9EpD7dUXDi5+rickcfi20VWMBOt+Jk+p4gK9FwclpN2YNa7azWjsBge1QpLa1FR8Qjc1415/eA5gMJttQHkpzPfCM9UPv+7+EO/MOQTsRzANWYK6u50z8dlTgyd8peNO8GiHsALRl2v1sLtVyFHdsXi26G2mlYRf0j96hlLTnIriE+WYS2h+c31Be/doMvR9CL3eMr1JLQ0B3xWxp3qpHXhgl4b/Qvq1vTritto6rte3Tv849zP9iLiUiUH5orWWOzl8yDwrb9KEjfKbV2NTmjA5MK8sJOi8O0qxI8TVtxl0H5g9JFf7K3oimDhrpF8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeG5zJOTwV89np27HySFD1WrvFLhE1tgCgCFCj/PR5s=;
 b=GX4giRk8mi+TnkHH+UdFJ6VPHH0oefiwdkoyo99hTiejil4d01D40ANCmCr+2KJVv0QOCrjgyxwbEVHAmukJzgNAKg06j1JVSxNwBl0M8KN+UlkrNhTEM/yAuRp7H8mUbJi8eHfcewUrCBOnGrMAtcJLGAxox+SNfTXxRy5/C5gFILx16LFo21YmcP3FzOzfRB3vcFI57CwD3lct3dAb25Wxzx3aDHENUxhZ/nlZrXuUcZ776OrNRqjG/1Yb6zbVi479J72rqnRbNxgorb9jP+o+yD0WjWR5A94eLtmkyV3gevk8PA3AvB7D+peMzXuoBP9CqaTPszfvBnLnv8JubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 10:02:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:02:56 +0000
Date: Tue, 9 Aug 2022 06:02:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 34/39] docs: gpu: i915.rst: GEM/TTM: add
 more kernel-doc markups
Message-ID: <YvIwyxZwAgYbyP3Y@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <207b2aa899bbe440a61b5fed5f26d9f78bcd38cb.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <207b2aa899bbe440a61b5fed5f26d9f78bcd38cb.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbd7e88a-f8a7-41fd-8b9b-08da79ee54ed
X-MS-TrafficTypeDiagnostic: DM6PR11MB3514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JVMiF0Sjfb4EGCptkSPMjUezXXyCcN+PFpILNyRtbzDYsfJNKEpK5/K7Cm5lznO6FTS3KTTfr+klL95OXY1S5PuQb+R79Ysa1oRTD+uK1MyZM1J/pcpbpiE0W/bj+DHsQY2qNTksAN60fQPtxrxgGZFDt6NuOZZ4reBnwPRf5sSbEvbg9BnUHDkdNveTRF11gayIuVug8L9BXM49Yb0oGjuYBuHz2cdxB6ys1neA+StFPatk2JHlzDYHGM5gIRBc1qkr0Kl+hS8Fak/uJYa93++I5mjwKz0Tk911XP5Q2KPFceFBt2zR/IAw8+krtVj/avu/jDG/30Yzq4VthQ8HcrMG4X5RuHUDBHUqn194IgiNwb8ceM6iO2SsiAXdkIQZKdX2oKEF/Eq5q4K44jOdXtZ5e46ViXj/Zi0ynNfMEkERmIEoAC14xEDsZA1YY+VARR37u+7E/l6XEUCoW+WWFkvZIXX8om/+Eq8Libh1hAo8W9pdyCNUzuw3DbUYLNKGqM/Cm1GGVJqmyYZLStLiRZco5VUx6ip0MRaNSiu7VWVWEOjMEhKO7NvQAsSrXT2BKn1LyfElJJ1aT7g/8NBw1ZQFYJjEVESaq5k93BVrYXPRPGoZHqarsk2bwgAvQvrziXVZll+keqlEK6qJCb1oknO2YR2k3r3H2ScM8JsIjU86Zu+5FfTE/kO98R07Z9PTsnHfIbnSs1qtnOW/8ehUykeeyeXeybKY0LiHOqGMtaS9lJ60t2CqKmpCCxOIOaOMtNpbzsGS5Cm6GAD3ma+dqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(186003)(2616005)(54906003)(316002)(6916009)(41300700001)(26005)(6666004)(6506007)(6512007)(86362001)(6486002)(966005)(478600001)(38100700002)(82960400001)(8676002)(4326008)(5660300002)(66476007)(66556008)(66946007)(2906002)(8936002)(44832011)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FhJdJ8muwpXTel6hYUGoy40ehhyf4UqyeJEgFlo6YNzR55for0lJvoFuqVqg?=
 =?us-ascii?Q?EHLEOdZj9+JL7lEur02KC1+I/C75j8/eb+k7LEMeiubDe0/1FAaPwip57a4I?=
 =?us-ascii?Q?S849By/g1NVpepGMZO45E7p3bbUA7CqOEvdn3kKeXXj37meg0xjwZPx+1PXC?=
 =?us-ascii?Q?No5SmAFN81LCaKCpl0kGYpPeH0pYnHS+HFrpI6D4znXT1bl0l8TAxJ5Qit8V?=
 =?us-ascii?Q?jVZew+qHIcSkRtZBPRIRK75eoHNbIHc3kzRw+xrSciuugDUu+MEIEzsy4WJ9?=
 =?us-ascii?Q?o7jjHjdpdulmUfUasSNHYCpaerPMaZGr9LfRhOT1TeiI9Zk1ytpX9TWCbTXd?=
 =?us-ascii?Q?Uuc4RqluDqOoTygDnvaavUgb49RuqaX7HZuL27eNYwMnQXieS5LEjKH1nZOX?=
 =?us-ascii?Q?IxMx0GWLkIfJe5aPzDUbIURVD5IfHpZWyxc3Y+48QSW+UiFNjXCVNDuoq4ko?=
 =?us-ascii?Q?h+b/EVoHdEYYpGEvo7s4WfuCSjIBi6mxLQV4ZceKONc9LLaJkG6S7jfBIwj5?=
 =?us-ascii?Q?nT0+GPLDedPOeWrajoQk2/gNTVvTwIEjoQFXjit8Yng7Ly8shXeGFAeFvNWD?=
 =?us-ascii?Q?4fSKuIaLWXLNfko8p4FMtpni0X85qBiwyZLLh9rSmMw/5FJ1OcGh8LAUc9dK?=
 =?us-ascii?Q?oB1t2krhLVdJdvrliALXpA2HeRm8kNB7K6o+3p2mfar4V/v0VZis2jLdLzp+?=
 =?us-ascii?Q?DrNe9S+k+jfoZNgUjni5ORxPcxf8zciZKYPIeQ6nFCVoNBF3Se77ma3xlCnv?=
 =?us-ascii?Q?+N2Mz+DiSLklNikfjsy301gx9Gx5HQXl/lVzAMjk40e5eLGitq2i5uVmxA/r?=
 =?us-ascii?Q?0OsA6PP8GXhN/1cVj5IG1wJF3uPiwTGphKR2VcBIOG9s1eKWGGSWFdGwXEld?=
 =?us-ascii?Q?Id5n5mU5RimWveFsVXwj9frZAZgvMFzUcevIsNJ/xt60wmNiDhIYPoBdd9lA?=
 =?us-ascii?Q?jopQVzrS2Cix1Q3EF1vNEJ9OQCgCsz+R1KNUWfOdhSq4SQIjXwaIW8OuHhco?=
 =?us-ascii?Q?2nzLMBUjiwCPw1dxi5iV6OzE3wh2Tvi85Y2MOfnegZdYaiCVSewDtvWg3IZM?=
 =?us-ascii?Q?b3sj24LXzvAtC4ZX5Q2G/ABQ0uix086LZPGIWYu9UhfHqnKgYYa/8uW+JKHP?=
 =?us-ascii?Q?VfT6cSHVqOj0BaD5gmBlLqtj6LLf1j0/eWDnqbYDQtI3svrYpcC0Gg+VAuHm?=
 =?us-ascii?Q?PZJTqrw6Q0MMAuk56CX+kXCx07hZxoMjPbG+DwgWZVPZ8a1qR/OK9vaIf0xr?=
 =?us-ascii?Q?tpUG1MxYM4t3UTDpmMYLBhsEiWpEYv0anqLs3JejGBN6DoZ/CS9RtJhV7rAi?=
 =?us-ascii?Q?TRxo63Mcb1jLDGX9zDLbpHahYhEDqDKTvln6xRUbFT6ePMrnICzmwzaH8vk/?=
 =?us-ascii?Q?VP5QzbVrJE6KeaNZYZjGue5hd1Gihs5lUXea+FwMg0GUoDUJ40+kPVd+OGDP?=
 =?us-ascii?Q?hBut+CKv+DdTUIMkrtLlXxtNUCkAlFSzWWr+vEFEmxq8h8qDKinL6eBqeZ9l?=
 =?us-ascii?Q?GWfP36fgUAqGFtClat+PFIEyydNGkAsv/SkpNOCS+iQiOerchvOsxE5VYCUl?=
 =?us-ascii?Q?nvdnKO48gAILmta2AqtdaDIcDwsQd0Z3dhw3PqgkAclxaMSSv7Nfoh8uY0E9?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd7e88a-f8a7-41fd-8b9b-08da79ee54ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:02:56.2877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQgBKZFs1sj916mh3AzWAnukJyerHkVO0hdKOCAo28gd48Ua5YKKCumNUzv8oYWPIqMUpI6UL8AXm5yiu3ngIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3514
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

On Wed, Jul 13, 2022 at 09:12:22AM +0100, Mauro Carvalho Chehab wrote:
> There are several documented GEM/TTM kAPI that aren't currently part
> of the docs. Add them, as this allows identifying issues with
> badly-formatted tags.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index c32409c03d32..974754586be8 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -615,6 +615,44 @@ Protected Objects
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>  
> +Table Manager (TTM)
> +-------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +
> +Graphics Execution Manager (GEM)
> +--------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_create.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_region.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_region.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +
>  Microcontrollers
>  ================
>  
> -- 
> 2.36.1
> 
