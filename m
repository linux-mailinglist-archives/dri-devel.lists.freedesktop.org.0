Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E77664B9D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236A710E1B9;
	Tue, 10 Jan 2023 18:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEDC10E1B9;
 Tue, 10 Jan 2023 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673376736; x=1704912736;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eolyXiEMD2oNu+viFznI9rrmydozh6LQWH7rNR4hzz8=;
 b=WeDuYQBpxPum4fo9cxqjy5KdChXGWgbcG7W2A4Ed7hGfrHlhuCCYucql
 Mn1Ovi1XYDng7CaDBar3sakCLIUjah4GGHYxWkhzb0qjgqK6dz9J/q7/6
 Y7XNYYcG3IFzn9EsfHZDA5jior2x/y22lLqPepnIeUTzGvMxy4MC9IqR8
 qaHbdXnTosUifWgMvhOPOxXL/z0+rU+LRV0zhyF0wkidb5bxYM8/PjZ2P
 +54r5u1t/OvXZvPQYA40tY4mSHPMZQOU10h+g96VDiB/jmTCm228dDvOp
 wPejHC7BIOv0LX0r89L+eW858JGIhhIWj4KaaH0yfdAyQXUeVoRRJ3SjJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311034001"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="311034001"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 10:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607082872"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="607082872"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2023 10:52:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 10:52:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 10:52:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 10 Jan 2023 10:52:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTEqTdX6dTMkZFCrmYVv0J2qausM4J9w9iHm1bxfxW4voaVsM0q8yaH0neStOpCLQIdLyIUB2hnFbpg/RKxAdnptDyCWEtUsx53uQN+Hr0GpvS5Q2/U2TYZAReg8yFzBiowN6C7Tjq07B1fL9gy9q50uJFkJ4K+IWfpA3hmQ0GIpIxPHQi4U/9zNnwhQeGPSF8ljb8blbgod+AHHAgYYXxZbhNcskimZRgyjl5UfeCcPS2aXo2dAKAuL3A4cWU1cIm6Te4e1Wpx38yLhywGK+Wy/iMGhoCjPcV/+FPADdmlt/1gNvCfqo8dfzieH3qiKdnsd3cl7iuLIvilyRmtGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfknfw6iOJ7mnkc5drIxNBakFDuQ4Pkg7ER83cUWF68=;
 b=j2d6bVC1eCvYqEWxujuL+zdx1V6xy7tSICUcOrN0Dr5Es22oM3xEecVEdld/14kaZyBPygB1kTRcrZJJl7dfS/dWJhoG0AF4R1WkhHiA/06ui8VV43KuPCrdCz1CNGoomS1QrrzU4gh5LLTlaOVzL+PXdY8s52+x3qnq5lpMmHruVSJ/YuT21/ErcTfzCaw5FqoU3YBnReqAbpxhdnZT/Y8SaP36T0sFTOB9hSHq00nvQFrYmcHxLm8m6XUszF2RADeOYG4it6K4PRc7/v6DNOhRGO/oanGNv3k6FADT7ByAfQbs2zAzMwVPCOctn8s7qTFfAiSZwgg3epdeWd4agQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 18:52:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 18:52:11 +0000
Date: Tue, 10 Jan 2023 13:52:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH v2 2/2] drm/i915/fbc: Avoid full proxy f_ops for FBC
 debug attributes
Message-ID: <Y72z1T1bifo3YpSR@intel.com>
References: <cover.1673343994.git.drv@mailo.com>
 <a4200ae1de7324fcddac201009a43571d0a72104.1673343994.git.drv@mailo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a4200ae1de7324fcddac201009a43571d0a72104.1673343994.git.drv@mailo.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: 314266a1-5419-4200-9a89-08daf33bc7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9VJWwZpiZjlqgCusd0SBx7Cm+L4AEK558NaZPCYb+2xKF/uUxJs+lM08/ZQ5l5CNGNhtcVEBRp67uTJOXhsVYkR8xkiavr9uOrebX1xRxyX7+F5EQDbAUxx+Bo2g4ZdXzDsdEB64N+YZByGIe4oZrcAnr9Q+i4acPyHxK1Zanhl+uHzmJIbucKOImMx5E7YG/KLgbvUkam3yBPLC/ukd8iE8VuJC2Ye/oxW2CkGnGEB859tqZ9Z6YLOzd6HPsBu3dQatBsH6T+sBTN/31YZnGvFd0EfdrUklsrck/bb89I1P7xAirzYOaYjpzF0DB7EyqOvpih4t9jLuegnKxjDUfkaldoy9usHcdmYs1AaH9LaL6opdp4VDFu0zQm4Nyn1H9HiU3UqN2C13nQ81usC6swHfIyaS27aL64qMpHAWhsiFHWqA6rPbEtmBEYYuvwZONGJ0TlT3BJ2ZAVe8gIWFvuRN9idbMcIqqxe6QphuNg49D6XVsR0QBZZ++2hmY2UnV0yoMzw+oKx/wxxmaMaauL8bQau3NB3BJDW8/5A01aegizNji7hbswgHrla7cd/35Y3McWPZlKqOIUQokFCSE4BWxz2kVgWi/fW+fDDCiuqez8ypox3kfWKTjDlRFEazli2Galq/nVwD9hha8dIvxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(36756003)(186003)(26005)(6666004)(8936002)(6512007)(6506007)(2616005)(66946007)(5660300002)(6916009)(66556008)(66476007)(7416002)(316002)(4326008)(86362001)(38100700002)(82960400001)(478600001)(6486002)(54906003)(41300700001)(8676002)(83380400001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AaijdpqfwNPv8SpQC+djmB7Q6X2o6xC4RogecscfSUD9bxBki4GScyIGaeGb?=
 =?us-ascii?Q?XSkb8/DbUVkdbVlRPZqgVWoLCI7M47xs1JTWeGBw/ALTcG9OjRWXgKEvAzyP?=
 =?us-ascii?Q?KZEGkpExwqMDtIKm1tTEzfCPV6/NFo7OrdhhwHXLm/iU3l2ii4KgkhsdF+s0?=
 =?us-ascii?Q?/3RLAWezC9SyuguMEsk1/U8+968BE704cbux/LhmQbxQQQHD+qxwdUTeiTjC?=
 =?us-ascii?Q?QjnPNhCvJhsaz1GfzWpYq69NlKhCikIuEgxyhTa/avX617FkypEjbspfu+Vh?=
 =?us-ascii?Q?w1WHy7I5fW2k1+CsdykLGqZCnprgT2hdE4auP7IYNzriWFEyHPImXX44Uy8b?=
 =?us-ascii?Q?46/9h74tXTM9AV6cxidppkJmMFwmBRWtT6f3Ci/9i0S+r3Bro3W4PKWILuD+?=
 =?us-ascii?Q?qfsLoGd63vUCDrs6TCeg7Lw7+nBBFgFu3aO4/L5+cwi9M6Q1jcyOatkIH9pH?=
 =?us-ascii?Q?dTHwIE1xy+0JbdTnAWWPrO/eUiQNxDnIC0I7WK44akzo9v+99i1e2qMoby0V?=
 =?us-ascii?Q?7EGkwy1Hcq8NvhC3vUOPZepruJ6FvJDZKv6KvsMgEPYwrVuuAN2PaHzqSMeg?=
 =?us-ascii?Q?V4QkX8yg/AhwaX+rrvM60Us92x+eVEp+foLtaKg83KRo8+Ltts/9LZWM6CUc?=
 =?us-ascii?Q?8cwh5pWJatKvcej362CdXkBF2OJMm8OzyIh5czVJ3liNYgkNfnZOga7MZr5h?=
 =?us-ascii?Q?ZWAEx5hNeMk/uc2Iix19jBBwKqEjVlC8VlbjQsLhb+0sgq3EC4lUHxbo0XFu?=
 =?us-ascii?Q?hEJl1CwEk5JJek3pK6En6ILuA+Omc6ZRgS2tzRMA+v3tBkyg0FKHey42UgUJ?=
 =?us-ascii?Q?yu5nWxQ4v7trQLB77rLtGCbo02mGcQ8D1iStjGbplMo8IWDrZZFqwtGnBaqr?=
 =?us-ascii?Q?GS1DAIX/pbh74bN77jpWar+oGnuyERwbh3SAGC/gzJ5IVj3cmOLDb6xRsaLe?=
 =?us-ascii?Q?5FeY+qYIPnrPJkw/agZHhY9cV+T/JK88PLlZAxIK45J6Pt8U1l2ZNuU3rOCM?=
 =?us-ascii?Q?9FKI0Ay91beH8l5WmlW07eo6vfzYiXQcsLIc4u0MSrXxnpXTor7a8n0ljVBQ?=
 =?us-ascii?Q?SuQ1GGTdBf6u4YwhKfvPenngJK3wY1G200czp7kaIzidTibSLIfOuYegJgRg?=
 =?us-ascii?Q?nBCCQdB4+PmBS9qtJSCmVu9t6IjxtERudMfcsiLPM5/rR5hn43t2sr0T7SKp?=
 =?us-ascii?Q?My/WKm8uVhf8N7Htr+BFm5r3kFc9e6d6UPq8d8xwgTG2E1U4l6ROeyjjnLw2?=
 =?us-ascii?Q?GVsxB0Dfp6CFENozGO3CaDA9KLZFodHjhv0IF4WgzKla3ZU1Aapa2Lsmk2wd?=
 =?us-ascii?Q?ul65Sl2G24pMjIiROgwPfcAz1mRHS1qyDYWW1c+nXitxvBQK7+0UgRTImMbQ?=
 =?us-ascii?Q?cv4u1XLirVk/KreuExVZERGgDLIo3imAhBb7RgHVqAUwbavsJvQ5YnScDdFu?=
 =?us-ascii?Q?TQE0zlXNXxtpVnuOEeakvp4HVGu23koPMMCoL6duUNFtE+tJW72lVTqUk9ST?=
 =?us-ascii?Q?edWRvn9mQ7syyxUae1TuFK9EAJuZSMkDwXzzgX33uVBuATpATKsAxKvWBFl/?=
 =?us-ascii?Q?UykcMp6vrBDr9S9sQMqrpHH4tZAouqooVXlP6npaeStCqvfFHF9AciuxMvrS?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 314266a1-5419-4200-9a89-08daf33bc7c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 18:52:11.4785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0JY08ziR5d/PTSP22RuDhdkeFqu5XNd6ROYwH9x73Nm8IRCo34/xHlgm3ezfOG87ZMOSWY0pZFELZIz6uLyQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5341
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
 Saurabh Singh Sengar <ssengar@microsoft.com>, Praveen
 Kumar <kumarpraveen@linux.microsoft.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 11:45:40PM +0530, Deepak R Varma wrote:
> Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> function adds the overhead of introducing a proxy file operation
> functions to wrap the original read/write inside file removal protection
> functions. This adds significant overhead in terms of introducing and
> managing the proxy factory file operations structure and function
> wrapping at runtime.
> As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> with debugfs_create_file_unsafe() is suggested to be used instead.  The
> DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> debugfs_file_put() wrappers to protect the original read and write
> function calls for the debug attributes. There is no need for any
> runtime proxy file operations to be managed by the debugfs core.
> Following coccicheck make command helped identify this change:
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(Are you planning to send the one for pxp file?)

> ---
> Changes in v2:
>    - Include coccicheck make command in the patch log message for clarity.
>      Suggested by Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
>  drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 5e69d3c11d21..c508dcf415b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1807,10 +1807,10 @@ static int intel_fbc_debugfs_false_color_set(void *data, u64 val)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> -			intel_fbc_debugfs_false_color_get,
> -			intel_fbc_debugfs_false_color_set,
> -			"%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> +			 intel_fbc_debugfs_false_color_get,
> +			 intel_fbc_debugfs_false_color_set,
> +			 "%llu\n");
>  
>  static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
>  				  struct dentry *parent)
> @@ -1819,8 +1819,8 @@ static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
>  			    fbc, &intel_fbc_debugfs_status_fops);
>  
>  	if (fbc->funcs->set_false_color)
> -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> -				    fbc, &intel_fbc_debugfs_false_color_fops);
> +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> +					   fbc, &intel_fbc_debugfs_false_color_fops);
>  }
>  
>  void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc)
> -- 
> 2.34.1
> 
> 
> 
