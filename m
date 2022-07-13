Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045F573F55
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364FF93296;
	Wed, 13 Jul 2022 22:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CD911B259;
 Wed, 13 Jul 2022 22:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657749784; x=1689285784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5DZ0T+GH+S+Iua4Yd3hVKJGGleI8tlgHshCc9cYBPpY=;
 b=LE/w71d1ZOaj90MxYd0193rKrVZm6M2OW3c5ABLryGAXx1llJVGB+mh1
 /fQiSIPfJDQUS2xbWy6od74wVaMMU4mwzaPQCZzGqTxqnAq8NFcXgZeKy
 pUp9I6y7wXZFjR8xfxKQ+6/ZaUPkrT3fmaTExd3XM+YZwRGl9CgfASCVp
 2BAwMNngrOELQuhl0gMiD48SsksAdZN1JQWOSKErp54TXxwh4jgonZcDH
 LwHAIutrUwk/LcLTnGifPMUEd0mLw91l1kTRZtX/sDDilMNtukE2ZwgH3
 tAEvppUmFy+bMcASMMI5JanLMkw01Q2zhcr/clrunjrQV2JoLLm4D7Uxz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="284111034"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="284111034"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 15:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="653593231"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2022 15:03:03 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:03:02 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:03:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 15:03:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 15:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONUBg/qjpSdESR2q11b9h4/56TGT/C+nRrdHfpqXuYQehx5jNS619t1M6hBnHjMsVJNw0EgRHIVrRSu41/zkIj7GjdNdUMvcANzPfjfu/JeVmSXvGqUPqS6taelNRWuGetLJO9OIU3C452gUgTTtM0JbH13YIwg8eMhFmNnylZ0uMEPJ9DrB11LjTDSxztTUnf5NFRv8wP8oPdvbmwPBXVdzEJQUUxQAnKhS0pM7N848VZIKryt85NBPcsiD/ZlxH+xvqYeXnDU1sVbkvXnvAsIRMpJ1wM4OKtN0pMqjNzzw9gcUQdJR2fCzUJiUA9tE5r1frRbiVVFUxyZlBUL8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDbghXFJbEounZs66IPkjkkt8IIolV+0IcbQ4MO6Qtc=;
 b=FOVGSeo5MCm5eDaoNUOej/VVf66vKJcCO7eDkJv3Gp5fLvVijBeJaBMznCLZ0PzEadPzXfr0/kLTlUIn2IogxM4ZDaPBrSA3Z7baIevWmzcmw5FLnc7jYGvAg7nwYo0+l8wzOgkF+kp1CYA4SmRiJSAGDWeI70GtqflBxx0I09D+SEZtjUXFXgQZAOFmG7ZAQDTXQHHiJ/VVWhw9HD4tsvJ0ZVGRuPdGDzrMwT0rRQB0B31cr8gZUCTWj2c/CSg1SfbPQxeU8mjZHIP7Ut0x+G+8FQNpWtnG3lQGO0RzIAqFw3bpJWHbzLOwX6P3T2CYRjx3bndP92ow8sIHPgNa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR11MB1495.namprd11.prod.outlook.com (2603:10b6:910:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 22:02:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 22:02:55 +0000
Date: Wed, 13 Jul 2022 18:02:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 03/39] drm/i915/gvt: Fix kernel-doc for
 intel_vgpu_*_resource()
Message-ID: <Ys9BCTYV9XMvA/61@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <4801d75e6c43c83fd5bba13bea3885da7b66fa9c.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4801d75e6c43c83fd5bba13bea3885da7b66fa9c.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:a03:100::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbdf536a-2347-49a4-c690-08da651b7030
X-MS-TrafficTypeDiagnostic: CY4PR11MB1495:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZVn4m9IpIcY9WFbZNliD/Hw+fzvX+9k/glf8N1LCXlp/ypUGSBKc/e4suRMnkvkYqB0O/OWHunyrvvsiBS+jwlja55FNLAXAvzMM59li5GefvTkfZJWQhGL321aCPYmon9x8MgT5XSSU6aymqm2iCN4UzD29Hzw1Q2YXiiS/qGksMbT1BCMtXRLdClUhOc9JvUzHL5lBFuuzR+A1pBBNSZBx2lJ7X0R3G/1ya3em/ECWd22QqHDFw++y0CvJriwfs8edOv50RmgXaUiDHdxMx8HsskvhCxwHuQr6wte8glHuWnbL2yeVEU2/zvT9YGBih07P116GvsdPXdRN+zDK3UoRO2+gX6T97q23J8rTBZzP3xF1yXukMI+6Vp/abpvhMSuuIYyAna1rDk6DJPZW99E+EXxASqgvuuoFjWMF0ImiyZ65hfD0uanQl0PFjsLNX50da0otAc6PXv134JnE+kyr/jvOsuSlpKIax8yzX9ZgAZm6R7qimrtcDXqRvT6tKdQH/0zJzQB/9ODVPejeR8tIbciu3tCJgowPmuCbuQI+UknNZUEiqvCDXaeLCIQoA6R7orpeQsvDztZmnqySGWxUNswSVuHSOWpzSJSoxm6RZDeZA/dDFVv/kwIfIaNOjMNozKDgFLRtZsGEQOhMUuoHwuxJoJbOFWchhFkDagHpTHj5ssHrT15qk2yYPp2DjafdQ/uSzSseb3hEY1kIYNc+9E+x9sp4eecEnGx+fcCKQXan9DPReDqdhC+KGFFJ+8jdDEwY0/iTdO1SHqP6qyzDVeXGnZRdPyNYkxEG1bc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(376002)(396003)(346002)(316002)(54906003)(41300700001)(8676002)(4326008)(38100700002)(66946007)(82960400001)(66476007)(66556008)(26005)(83380400001)(6506007)(6512007)(44832011)(478600001)(186003)(6666004)(966005)(86362001)(2616005)(6916009)(6486002)(2906002)(5660300002)(36756003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1h4TqVJL/vAf88o0T2leJOjS0DuGfo3wIQt2nsLuepdIgzvs9PBq+qFI7ZdB?=
 =?us-ascii?Q?mlE1ilNRAHyIFAn7TezhOCdaoL9Kxjx8JzoZjrWVk2/SBoRtwyo4RF600vfA?=
 =?us-ascii?Q?6L11qn9MqGMEKhsQnhZjCZ9ZqU/c20tO0GQdXptOFISynIKnkbKlGcB7f1CQ?=
 =?us-ascii?Q?2RHLQNGWjDUHpS+9DNGaLS2x1IIVZzQIvLN9ez1tUWYsB46myhyzHa4SqcPN?=
 =?us-ascii?Q?FQBGwopJUY24tAhta+yp353Xpz2FYeR+EOJgHWdAcvwIktZM1EByi9kZjH7o?=
 =?us-ascii?Q?nJbClzMAOIAtHsTJmWyEILDS20qJFpDX/RWxHNsF4ob44htKoOLZVO8VYsw8?=
 =?us-ascii?Q?tFWxMSl7u2agPzP+spUfAOUckTOWimkR9U/9H86ljDkTIPLMcWz957pOPHvm?=
 =?us-ascii?Q?O4hVLtcsp2gDGcQkasipKKleJS8rFYL2S2dSbX+BB9iLycW9LXFnGKdK+E/m?=
 =?us-ascii?Q?U9c848MHH+AWxwLIyPnrTP8Ys+73uBBR42NtY7ERHvARddR5azjEOw62C81J?=
 =?us-ascii?Q?iazAJ3qw8I6U1nUOLIN8D99DWBwkDrC9iBhn4scZud3/sTB5zwDjnYRGaHGA?=
 =?us-ascii?Q?Bjgusp2UtB53GLK7HrTtp5KTIsHycsfZJkPi2uENHXfouPNInxga5uLANK9A?=
 =?us-ascii?Q?3ZgivOxav6/bb7YKl9TC4HH9PSFga/tJBQL5wKRn4izQGyaF9qqQHBnj3tDC?=
 =?us-ascii?Q?7UeGXY03awRSbBvRjxQnSoxJoTIR9lRlE0pua21/yDoD35NoB693WbOYGVIa?=
 =?us-ascii?Q?vCL0iOJx6VNeUtCFUbj936kFnMioF+uVEJoU3LE8w4jlRRv8dMHDHHV/w9Jo?=
 =?us-ascii?Q?vwTUEw4BwacG/pRNpfzeWixuJFzHpuoluxh6dJzx8u52g8DNDmGCS14qa4v+?=
 =?us-ascii?Q?qoq1hLIyvB+y0rg13T5TlqmgE+IZYrbrr5u0rH+t+60CpdRugR7IMQ0C5U76?=
 =?us-ascii?Q?U4tRfntAVolagMSfEbUjQNgqFL9/3A/tKBOD6LzGd8gLbdzYoBvpXYgdGWlI?=
 =?us-ascii?Q?YZQ0hQeRJxnUySwk3om+Fy7X6aPDNj246PAUBwQehf3BnD2aJd3fb4XIqIpz?=
 =?us-ascii?Q?abBffogF7ELU/iuECtFaTM1YCz8imlwm9PURZAIjgm8pXWLjYIPmVfbgPfYd?=
 =?us-ascii?Q?triIfcGc1EgHw4zWmsFbkNnHqLTikVFEQo1bXREAD8NxceTB6xsfIbbOzxpM?=
 =?us-ascii?Q?fj8loWqhREEPYSyC7HAtueiIt90b99bAvms05kdufAj89BR0032hs5W4RJ3m?=
 =?us-ascii?Q?HQHKGzuQK9ct0fNwkJcCZU9I7ZWF+79hooiJFwIdwx8uZW8IrzC05FnmmX/s?=
 =?us-ascii?Q?6jWNo1gIyToYcekz0sl2GByHGB8hr4yEk+yvt7jcDKArB/Fwa4iMfCx6VP2s?=
 =?us-ascii?Q?rH1MWLRrNBtkBVJ2yNHTaxW4lTQItvuCn/kFLDF8/sYN5I4uemDHSWIDhLil?=
 =?us-ascii?Q?ffQgoaE0cI1jGSeH/G04Ejs6jJv7Wv0E28B9sGJ2wtWV9/m4GBOZaL8gJ/RJ?=
 =?us-ascii?Q?LvnVV4264hUPD28FozMtHGMeOwaZ3LaZJjTYZCmNgJn8j2AwvAyzlikhP5w9?=
 =?us-ascii?Q?4QubuD55Fot8DRLFtXpFb1AHcQQ3duzQwtz+1Hg6cx3Goo2F4lPjDhZLO0Pm?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdf536a-2347-49a4-c690-08da651b7030
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 22:02:55.1019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plXWXR0SCn0c6yDEJ3m1WGpW/mxpPblUOBA/Y4AufxE3BkKB7wc1hUuQZfNGt/9FoSXhkuGtc6DMrpMs11FkQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1495
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:51AM +0100, Mauro Carvalho Chehab wrote:
> From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> Fix the following W=1 kernel warnings:
> 
> drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype
> for inte_gvt_free_vgpu_resource(). Prototype was for
> intel_vgpu_free_resource() instead.
> 
> drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype
> for intel_alloc_vgpu_resource(). Prototype was for
> intel_vgpu_alloc_resource() instead.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gvt/aperture_gm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> index 557f3314291a..3b81a6d35a7b 100644
> --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> @@ -298,7 +298,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
>  }
>  
>  /**
> - * inte_gvt_free_vgpu_resource - free HW resource owned by a vGPU
> + * intel_vgpu_free_resource() - free HW resource owned by a vGPU

with the consistency in the usage of "()" feel free to use

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



>   * @vgpu: a vGPU
>   *
>   * This function is used to free the HW resource owned by a vGPU.
> @@ -328,7 +328,7 @@ void intel_vgpu_reset_resource(struct intel_vgpu *vgpu)
>  }
>  
>  /**
> - * intel_alloc_vgpu_resource - allocate HW resource for a vGPU
> + * intel_vgpu_alloc_resource() - allocate HW resource for a vGPU
>   * @vgpu: vGPU
>   * @param: vGPU creation params
>   *
> -- 
> 2.36.1
> 
