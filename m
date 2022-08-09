Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2658D75E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45CCE5D2;
	Tue,  9 Aug 2022 10:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE752CE596;
 Tue,  9 Aug 2022 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660040618; x=1691576618;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lZqDub5fWU1zXYkg0YXlwSI1OvpCUUFrSSfGYw/3a4Q=;
 b=JX0jCmiqEItBs36R814vYLDppucQkJrz+LOU9UnKcWpkBLaZITHLZfU1
 zM2fdBk9OAX0CetqXL0gZdWIt00E3CD8dOLTWOGHzk9EdP1eDq2pJO9hS
 MLEKN8RPYZ/qRS+NB6ldNcqTuV6NLFuIW7zgzhBYD1crJVSewFOiZRSMq
 jAiQt7+lRqr+Q48e5GsRQlOZVtHlpyGT/rBx3XA4OFoNi2vzDSoiG6z/5
 s6WYDZB04KJmPJow4HKBHhPziMCQLHBf8yINPBpa5cYUVVDhSndcO0I4h
 tyXUraWduTlG4zOwUlSPDZL1zI8hvx59PrdkRQqzZWlBZvNJRFIA+0Bg9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="352532768"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="352532768"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="580743821"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 03:23:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:23:35 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:23:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:23:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCwB9KHk0Rf3jg6wkhsnuEXWuwrYCnHXQWxf+FBHKFUSdML06CvBTkk0PYGjug9NQaFyAOnOaBu1/uZiBobxFZm1eVjqcP3SBQGOVcKvrpQOk1aKgQsHicMR7VWr2au6kC98T6BZUC0ZAZCTSU8s1hmQaKamkx9XzSeLHneAzsx4wciGbfecTBHT1WWSIe6xHV7SPD8ZMOPAkimFc8yBgFV3EmP9QNj+VCrjn6IJjZUbJam4qchFOoWZncAeZ6Xm1nodzzaAXwZLLgkcjcAp0EGXTDJhx1sZ3Y5Xw9gOKkaH26UrPM+ox931SFl3qwhSLdxsONdqvHQgZkPJVKx7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeqNylJfRc/sCOX0ah955wYWGw67X5kL0JBtHofz0ao=;
 b=F4SI83JwIfsYHPSZzQPVMilZ615pdEv10AVY/Vl3gzDBJlUjy1AEBpHk5xJLvDCU2ueaElADakMrtweFjcnlvGfXazVEkopr42lqUlK9tk9rc7RXzdYIG7cpPzOQaKUZozxQ9pDzQ5tYII5C+c7nlwrMybnY5CwnTZZ9zVV+jIRV6QDT0U3PEr8cKaWQ9noel8Ujaqb669AFiJ/BszpT2DnFoCt2Ji+DvsSzGpCO+ua8vUPb4mikaWlKf+shgS5m7kakZLan5BK4NKcufkJnNoHSyZjvlxkTpCpvJXXvoi/Uqe9ZhfCV60MORNZLg2oVRSi2mmb1V3GGH6JbqqttUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5477.namprd11.prod.outlook.com (2603:10b6:208:31f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 10:23:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:23:33 +0000
Date: Tue, 9 Aug 2022 06:23:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 11/39] drm/i915: i915_gem_ttm_pm.c: fix kernel-doc
 markups
Message-ID: <YvI1oNQlSd/9AGmZ@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <d3c6c2b3afa1baa8061489d8d4cd358b251fd30e.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d3c6c2b3afa1baa8061489d8d4cd358b251fd30e.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12529411-d10e-48d8-dc7c-08da79f13620
X-MS-TrafficTypeDiagnostic: BL1PR11MB5477:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: keWkeuKAsMAXBITa9uDuqCrGt4Saa2POsGu5KdMj0QQHnjgHCTWOe64o9nYq86ApA/Oen/eaat2BOiAcUAtXXS8UoDEDWuxquYHFbog4MgRQq0yWbVPk93VlEoqoaq4WzcyIKMa2Pgq5rnbGcf0Ljx7XJhW0eqF70lBK+BI0aiBf4IyM9Ri51ePjuM/0IO4HQ5gwFxtoQBLQMuZGiaBSlDiNlscrlkXCgFBecxBkre+uoktQGGrigIxbkdYzPXd7qi0WtTWr2GmwGvd1ndu+WLGzlqOKCoI+kS6e2Tlv8GPV592J1gCINLRZ7tcmfo3cgTqay8Ll6O9/bsXdR8XRllTg8u5N3eUasXuhFVfZYzFg/qftr6vDOD2BLgsLSOGy7R3+UVk77/7D+D67o+ySaMCjgJ2SReRb3f/7sMmQf7lWBH9BW9AWMKZt+hsOgKhcuBAd1Gbl3seZt+EV6vk1d4i7Qs8XpCB9/Pt/C1AxqxsKvG1LydlyxdR3biTTPAo6JuTm/jX4SVi89qocTxtIiR+xk+ajdXyl/GFkjpVYJna6O2Q1KMZEjK1CdHR/gs0JfZ1ZikE9x66W+qWO27KCU9wrkylT3GflrH62RlCbfXIX9Hj/24Hjq3qpMnbWBainPRnESfL0PFCU0AlpJNiwPND0/U2kF7g82kBF7/DMGRGItq77depvRfIKM+KtHnxDSEUQsNcnkiXnbbn+uojiw/FyHPNDRhTEyTpL205ZufGhZxTCAZlGwuds71CLCo7/3Xzs3hcbdyxwzU0gNiPziQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(376002)(39860400002)(366004)(136003)(8676002)(478600001)(66946007)(66476007)(66556008)(36756003)(8936002)(38100700002)(6666004)(316002)(6916009)(41300700001)(5660300002)(2906002)(54906003)(44832011)(4326008)(6486002)(966005)(186003)(6506007)(2616005)(26005)(83380400001)(6512007)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Etww7wnEV64HNLTPuqyAqUGpLUe3Q9Jl4Zfc1wOCTG1kBk+riboAKuAaRrJI?=
 =?us-ascii?Q?ujCwpEexjlkwkyAdadIlhQJiJ5TpOdjtO1gNkhCyRv+Bni5zecU0ktCvEDuG?=
 =?us-ascii?Q?gdq2O4/JsFoSVgiP3AbfQSJVPomrFXljsN2WfA+6rqcxhyWy0J/QUuxJ44Zi?=
 =?us-ascii?Q?4ntbBJsAwkEx0tDjBlqHwSHtdOGHxLgrDKgnPt2f5dglZRxmQ8u3L5qY0WPS?=
 =?us-ascii?Q?Hm4yFGbvOXRzTM/M9iK9u/6EnILD7Nxfo6NWloYPYCtwjMLmLbkiEBHmJl99?=
 =?us-ascii?Q?p9ec6LqolcS1vRXQEx+s/rsdfvMEdKG9vkNZ2AvszuIW2DA4CHAz9xBffgfT?=
 =?us-ascii?Q?M5K7ujFGb7BO8Gw7L2Lt6bp52kfi5BZ8Qyz64zkGMzW7QkvFlF5uIEgYcZFc?=
 =?us-ascii?Q?+KXn6IVGvHHxUi4ZnsBzwOQ+Ek8oEp6HR0hcDVLi48gxbbZCUeVO/BpyX/po?=
 =?us-ascii?Q?jIDXyUom9k+BNWSEYaQmXhlIC+DUrPkw8q56YZhF3hRu2XnC5+0zWYoJpc9w?=
 =?us-ascii?Q?CfhqZhXU78ZNFARiP993ImcehZ9dMCN9KwLlzbw2/FqkdakjSLaLH/HQU72o?=
 =?us-ascii?Q?k1jl7vxhCvP00/fxpRu/pNJi0f3dSItymOamPs8kjC9se4k8HUp8evVgfQzd?=
 =?us-ascii?Q?kcTxXeCkgx/KtN/8M5bF7h/G7ubzeu1TpRGiqN7h8+kOPwUNxrjRgdgL5QKD?=
 =?us-ascii?Q?6mej8X+uvJJHugL3euYlL1nTjRh1ZyDsCa6udkIb8Lx3biWrcJDnl0Dk3fvR?=
 =?us-ascii?Q?MhrG8ISOltAtQBqdS3krsHwAFpyY449zCkj4/rR5TQfj6fGStWn4RiMRuGO5?=
 =?us-ascii?Q?llKf7iPN17tR5Sh1hB31bQtPMwIhECq69cpXJDtv5hwT8f1QkTzEoXI7qU6y?=
 =?us-ascii?Q?rR53tOASDeGHsAJj3lyw1f+mC0cvXHN2hrSlsa3zd8CcgXs80Cz8nnJPdo44?=
 =?us-ascii?Q?l5XhgQ578WaA8RBd0K9xIh+u7wb9c/7k+z4xXdjjDlqHQU9aL/txWLx8aTjD?=
 =?us-ascii?Q?CYT11G/8I6B9sqVycx1iumotAU+8ckgsyB0wzlyBJDkoulX/uMcrTT4xQWVN?=
 =?us-ascii?Q?0R4p3NbcadQOqvA/fahwADN2IckZsm+gNUFQKg0OkdaLWplP++ZuYLktZk+l?=
 =?us-ascii?Q?wIwuYMijjgnbOorJMoz4FPTaRlyW6GkkFudQjonL6unFOuQW48pv9pXYE5Kk?=
 =?us-ascii?Q?+CH4ceaFo8ROiEVnM0YPsNSb5WBC8x2u2jh2qD0Y05BxvtJ/QljSsIowcYQc?=
 =?us-ascii?Q?h4n60Co3beduX3vVf3BW1cjGO4/wwCk+C8B5YPeTQ+VnvG0d25wujjuNfHPM?=
 =?us-ascii?Q?8CUGA8VEKND9C/o7UmSnHExIgDaxSMnGb/LpJ18rX6aGvgonCUsG6hd8Dv+n?=
 =?us-ascii?Q?jvLEUNo9rr0PRXuEUJ0do1dthaO/bnfk1KjayPIcmVruW+y2S5fPWRQ14cAB?=
 =?us-ascii?Q?+lhSDJJkJrYdM9z9xz93vvEC36Ae3xLltkENqmsF2t3WkfWUoS5eZdM9bQCC?=
 =?us-ascii?Q?15t8GY3nunTI3IfJ9bWOMn8TdDb+6rFQYwoGMdlt8A3mpW7xmz0jij8BQoJ6?=
 =?us-ascii?Q?ZD9YKya7iimwKN5pmTnYoT5gaMVMJQ4Bhx8j83baZeeqnLI5WcPNM4hTtqWF?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12529411-d10e-48d8-dc7c-08da79f13620
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:23:33.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TY1Lqn2M615Ms3QAxbA4tpzOWs8vAoIjQEyuzRSxzeFQqoNS9ZWzxcdBaN1daMCed99JAGHtK0tk6TOpMbDQqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5477
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:59AM +0100, Mauro Carvalho Chehab wrote:
> The documentation for the flags field is missing there. It sounds
> that some last-time change converted some bools into flags, but
> the kernel-doc change didn't follow it.
> 
> Fix those warnings:
> 
> 	drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:135: warning: Function parameter or member 'flags' not described in 'i915_ttm_backup_region'
> 	drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:135: warning: Excess function parameter 'allow_gpu' description in 'i915_ttm_backup_region'
> 	drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:135: warning: Excess function parameter 'backup_pinned' description in 'i915_ttm_backup_region'
> 	drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:199: warning: Function parameter or member 'flags' not described in 'i915_ttm_restore_region'
> 	drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c:199: warning: Excess function parameter 'allow_gpu' description in 'i915_ttm_restore_region'
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index 9aad84059d56..9843831c9b37 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -123,8 +123,9 @@ void i915_ttm_recover_region(struct intel_memory_region *mr)
>  /**
>   * i915_ttm_backup_region - Back up all objects of a region to smem.
>   * @mr: The memory region
> - * @allow_gpu: Whether to allow the gpu blitter for this backup.
> - * @backup_pinned: Backup also pinned objects.
> + * @flags: Bitmap field with the following flags:
> + *	%I915_TTM_BACKUP_ALLOW_GPU: allow the gpu blitter for this backup;
> + *	%I915_TTM_BACKUP_PINNED: backup also pinned objects.
>   *
>   * Loops over all objects of a region and either evicts them if they are
>   * evictable or backs them up using a backup object if they are pinned.
> @@ -188,7 +189,8 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
>  /**
>   * i915_ttm_restore_region - Restore backed-up objects of a region from smem.
>   * @mr: The memory region
> - * @allow_gpu: Whether to allow the gpu blitter to recover.
> + * @flags: Bitmap field with the following flags:
> + *	%I915_TTM_BACKUP_ALLOW_GPU: allow the gpu blitter for this backup;
>   *
>   * Loops over all objects of a region and if they are backed-up, restores
>   * them from smem.
> -- 
> 2.36.1
> 
