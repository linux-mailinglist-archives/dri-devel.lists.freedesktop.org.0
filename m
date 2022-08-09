Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01A58D727
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B97ECDF5E;
	Tue,  9 Aug 2022 10:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E60FCDF21;
 Tue,  9 Aug 2022 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039715; x=1691575715;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nUgEsLNt3cEfSfBQwjyF+M8hZD4NfEURHO6IMusb88M=;
 b=ZEtgzq3MK9LXsi0cagWVAeUNMwszpOow2UPA+3PYJ1qK5hFGzEFOAsd6
 UhrSh8EDLPj39t5wG17bNLb5aIGvEz82o8dwwoF2pzG0/Q4MeyyxrPlAb
 BB7oMTskug87JQNeqwJrn3xdXuQA13d3VpZPChs6zlk7GVBaahtPK+n1r
 bDFW1YGwaBCTYhhFmW/Rbk2GGTFWCMwgL4O/CTomAKDFDcqvo5PFgTYOj
 +xyC4LIQH41JOFfAqavbakxv2rNOJRJhauyCS0po41hhtu1XzTcAFjSGw
 WALO3KhocnuhzzZIuH9N1565Trub0HcnNSyDHDy/Ipm92bz9zDIyfUFtA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="292041755"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="292041755"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="604705543"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2022 03:08:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:08:24 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:08:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:08:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ilnt5RJO1XKQ7xPZHGWpO1XJlENiACTCkKsxDS1a/CyQXrHBWxUekopXtRq+fbk8+VoI9yhpWZwqeqFgNcRFrTmWQBTdPIGGhpvF55iI7XMtZS1tJsHka0G9AAeqAxGAUwGDbokzkRMyY7FR8A2IASNBRjEtZhnIHfbpuxF8C4dLoC1hl/lQkw/t0qdIv+vj+Oy3qCkXiLFJRGuesK6sD5jx5xlzmJ0upW/2mhrvn15OCZ4dqigbweBl3jPMOWK8bthtI+TV8dPDaTjLXsHL9vZ6KXS+AAofzeNjmwB5VeHC1PfsSsL0tiNiEYRc4yh1pTEygMlNkJRkrNmMJ+s0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woqRHv7rMWZKBQHc4q5yVzQnqJHxASzHEKI9i7V5k+w=;
 b=j1YOr13eUgWYweF9aGTjPcN8gpRg7IIL5GVmElr6dEjNmUj+QtjJZ8OS2sVS5ruCWfe563wJnGMTXIledI9aH466wO6SKGV81fQ1BYuTd7hH/l1SC3hEgm762XU1tngooSZWvmA4j8VTS/4qtnkFCLRXFZH1aE2/hUFdvT9haLyuB7Lwwftik0y+saCxZXGgRyjGNLPTeYZY8oBtYDBZABM3AyneqcZxElpV4yC7uygQrVaiLHLoCqlOAfOLpF+L0XjUIb4BR17MJ01f56i7aXNbh9A8BTDNNUAgEBHEhCv4zKDbEKOvHFxbA2Fk0Qy+ro8J1daj9exzpULg5SjkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB1393.namprd11.prod.outlook.com (2603:10b6:404:3c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 10:08:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:08:18 +0000
Date: Tue, 9 Aug 2022 06:08:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 37/39] drm/i915: document struct
 drm_i915_gem_object
Message-ID: <YvIyDTLrwxdJHxNt@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <595fc6f7954e07cb8b6ea2e60f6ef2270bd65777.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <595fc6f7954e07cb8b6ea2e60f6ef2270bd65777.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc5e6ac-7a6a-4f96-4194-08da79ef14ec
X-MS-TrafficTypeDiagnostic: BN6PR11MB1393:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qR9IGhYbPZjd8Qz92ZCMKoNzL8tKtoVjQqUcfnraUkgfbtu6yifvH/4C25TlBpCY8EmfeNnG94KRyh3zZlZqgun6QPOoy/uohIm3TsNwHRRGp/YzfXLcldMvHHDzJ4j0tf3t1Gm0SI9Ibk2calG7lBVWa+/6o17f2/qZjnS8lxg4MXQq6Izh3htJWn7ciNCVApq65hVsZO5HyFwhIyd6U0X/Z9mF1QvBLVGdLHGUHmwbD5/iZoczPHKn4UKYhxcDh6x0Afkdxx7VaAqvNlaNt/VR4Xk5xWPleTEaERuXdTzPc1oKzvZZhRqK+n57fnpoXPzQPr9VSKx6cUaODTMBfVcrUID/e7RT0UPRpr7Cxoqc10lAttWsmbxpFMlFRaLZVoXPL/puRQrxduKgmuG4oO8j9jONbiZpKmJ3SuD3J7CQsLGLjY/pTy5o/phYgiH2lk3O5rym/w6YSzhqOPhxmbaCuc5zVGGJQpVE3mOzLTDsoO9AUwMItN6dOo9FOQdcd7vT/6tX57zAGJ4XLSB9zQ6XZlitXDd8V0zz2nT6+FITPnkkAP01fa6G4eS1Xfvc6b1RSWxSvYkDTirFv5ne0e71vDXFqK5vOqqVoRn6TJfiSO0DpUQZp1OTQI5spI2ZCKdz7p4BDOj64rVIKV+5rK1VxtyH+e5NQltjun7j5vl6HBNmwesA47DLH6Fke+9Rllmkis4aGEwiVyQ82YyPOSZA54xNAynswVsWMB9QPn+VNzxn6ALf+8mk5wjPZugn6sj5bZA2H9nSxC27Yoxn2uCDeD0qRcjMSKvbq9vCErakcsmBQQ72IwMPKJVqX6A7859VKlqshdPtkucPctYo7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(366004)(396003)(346002)(136003)(36756003)(8676002)(66476007)(66556008)(66946007)(4326008)(44832011)(5660300002)(8936002)(30864003)(966005)(6486002)(478600001)(316002)(2906002)(6916009)(54906003)(38100700002)(6666004)(41300700001)(26005)(86362001)(6512007)(6506007)(2616005)(82960400001)(186003)(83380400001)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePnAlwh3hz4f/py+5h2zAs9mekKnWVgGDkfSrCUNrx/XiDuU237ieN76GUie?=
 =?us-ascii?Q?riA51Hz0FeQ4Dv1U/+YB74V5Q7tXTZZOWVuHu9d94YE/D1WMoEvBeoyZKY3o?=
 =?us-ascii?Q?mNshZmF2gNcosNC35lWZXqVMqfGiPcAbv0WWlMTpgRYMMU5eXiUKchsFzkYC?=
 =?us-ascii?Q?V+1MBCE87Fz3nQNFd+vasXMXF3FTc1PtGAuOg1rCDPe5cOxBMvOmje+gvUOQ?=
 =?us-ascii?Q?5RggrrTwPJk1OKEcZj3zqT4Pbe9zb4/VBnqOQEOjOO/Nsp89qO2yc/d20WiC?=
 =?us-ascii?Q?m0X820xVJ+mTOwUW/NV1QF5nuGjzHYWMtiX4w5KOkfU10RDJPEBBm3kGYX7c?=
 =?us-ascii?Q?0fo4SX7or6J5Map8uHJT+k0Tiz+WAaACxAxA1wSluSjOsylfgUlglgAcFzb2?=
 =?us-ascii?Q?ETOV3SpQdmrQky0dORaSnXkGK6F7/krPVqS8gJJ9cJB075AYAtbaXqCBRnx9?=
 =?us-ascii?Q?RZgI1Vf1XS6vl+SuDzHQnIkXAsaMRA0bAartT/1cxQQLD9xBmIH2ITBvI3YJ?=
 =?us-ascii?Q?hLEuB39h5FmuKUAz4ntyfUP84jkwQtq+evCj2AWqXaa+vnN/4wdxEzumTq3A?=
 =?us-ascii?Q?0sKjNpzxQv1RLzJF4rFN3kmZ5rquvtPK9hnLNsyqbBhmo1CqsvvJLKNsumB/?=
 =?us-ascii?Q?jawC+3VrfbsLWMP9ZsWPehpxmxB8OjSCTwL/vWMivZgmncqu6WXPpQd5bHNH?=
 =?us-ascii?Q?baCTXPnaFwEUsHOC2Cdo3qkOpiRq8NHyxLyRHDBqLZbKETp0YYdYZ30prvRB?=
 =?us-ascii?Q?/nQQkOTCTrqAl+JwXBENlPbsdrsyW0CChHwjWWVKEIx7zQhZ30ipG9exkp6y?=
 =?us-ascii?Q?IPPGQYkrrDqJ4FVhu6nTUhOVAZ0QnH60zjtd+QUGZIiNS5AmIMW8QUVAK0cm?=
 =?us-ascii?Q?XUHIkKy+IqRTm0nMT64X2Eo/R1iB/XnCUjrpPvUC8OUApWp4nDcTvW5adb7i?=
 =?us-ascii?Q?0jP684ndEdQK47C67rEDCHhD2/T0G7nV4iZPAXHMiTUBA9/tPqv1Cd46GETB?=
 =?us-ascii?Q?Hx7th6RPyO4PSyR0VuX4A5O/Rm+CBp7cRkz6hjja/ePnO7wIO/pm15/flgf9?=
 =?us-ascii?Q?DZahgEu0qQTnNfP76DtvUgsRKp+KGpk1wHKfwTUzbnrWDW8ngQX50a/vLOGq?=
 =?us-ascii?Q?bICB9Hz9bzybVLAE9cU0ZBnfecegVSUsxn4TyU4xskvQQWFlnN+osdStfBiQ?=
 =?us-ascii?Q?pj4bXtNet2P62DceM9+rjD6tRCm8KpN8j0H6y5/Vh2j/0p4zUq64ddBjD0SE?=
 =?us-ascii?Q?+5z22tu6OjtcGgtCwnAqMEB25ybrnT/rCf2jOseMLk/ehSHG1aD5bNEl1v1+?=
 =?us-ascii?Q?I9ENd8WwRM/KYFO8BJEwpQLgfFlkVob0njsH/fW7g64X6qdv0DpDx6yACPgF?=
 =?us-ascii?Q?wL0Wekcyy6+x1s8oLqAVTQ7NJNtVSMFXPMJuXjiBA5hzPzC2HIs2kgUUBSDS?=
 =?us-ascii?Q?PdzovwlPbhLiQmGbDyIcNs+NAQkz438q4oZEZVn/3YmC8LD3NEE6nMI67PaV?=
 =?us-ascii?Q?u33txYP4y7rYQSOoI2TVH9rMq5EUgXegLzpRMJ+d50QofkK3qLL1iYK1kvSP?=
 =?us-ascii?Q?RZ4wHCeX44iqTuGdj8px81gPoi6hz2Bl3x5uAVOVmABozx9hVi2DiZXOPaTA?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc5e6ac-7a6a-4f96-4194-08da79ef14ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:08:18.4487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JDkeSN8RkbdOdJV8hBLbjA0uU1fSWGS/TTZeQFLhR8+SqAHGkHE+J/o/mdsjM/NwnpofvjBrsuVB3vcBE7emA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1393
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:25AM +0100, Mauro Carvalho Chehab wrote:
> This is a large struct used to describe gem objects. It is
> currently partially documented. Finish its documentation, filling
> the gaps from git logs.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 200 ++++++++++++++----
>  1 file changed, 158 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index ceed0d220ce3..8c09e493590d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -233,6 +233,9 @@ struct i915_gem_object_page_iter {
>  	struct mutex lock; /* protects this cache */
>  };
>  
> +/**
> + * struct drm_i915_gem_object - describes an i915 GEM object
> + */
>  struct drm_i915_gem_object {
>  	/*
>  	 * We might have reason to revisit the below since it wastes
> @@ -241,12 +244,16 @@ struct drm_i915_gem_object {
>  	 * when accessing it.
>  	 */
>  	union {
> +		/** @base: GEM base object */
>  		struct drm_gem_object base;
> +		/** @__do_not_access: TTM buffer object */
>  		struct ttm_buffer_object __do_not_access;
>  	};
>  
> +	/** @ops: pointer to GEM object ops */
>  	const struct drm_i915_gem_object_ops *ops;
>  
> +	/** @vma: struct containing VMA list, tree and lock */
>  	struct {
>  		/**
>  		 * @vma.lock: protect the list/tree of vmas
> @@ -280,10 +287,12 @@ struct drm_i915_gem_object {
>  	 *
>  	 * If this object is closed, we need to remove all of its VMA from
>  	 * the fast lookup index in associated contexts; @lut_list provides
> -	 * this translation from object to context->handles_vma.
> +	 * this translation from object to ``context->handles_vma``.
>  	 */
>  	struct list_head lut_list;
> -	spinlock_t lut_lock; /* guards lut_list */
> +
> +	/** @lut_lock: guards @lut_list */
> +	spinlock_t lut_lock;
>  
>  	/**
>  	 * @obj_link: Link into @i915_gem_ww_ctx.obj_list
> @@ -294,42 +303,88 @@ struct drm_i915_gem_object {
>  	 */
>  	struct list_head obj_link;
>  	/**
> -	 * @shared_resv_from: The object shares the resv from this vm.
> +	 * @shares_resv_from: The object shares the resv from this vm.
>  	 */
>  	struct i915_address_space *shares_resv_from;
>  
>  	union {
> +		/** @rcu: head used when freeing objects with RCU */
>  		struct rcu_head rcu;
> +		/** @freed: list of GEM freed objects */
>  		struct llist_node freed;
>  	};
>  
>  	/**
> -	 * Whether the object is currently in the GGTT mmap.
> +	 * @userfault_count: a value bigger than zero means that the object
> +	 * was mmapped into userspace.
> +	 *
> +	 * Used when the object is currently in the GGTT mmap.
>  	 */
>  	unsigned int userfault_count;
> +	/**
> +	 * @userfault_link: list of all objects that were
> +	 * mmapped into userspace.
> +	 *
> +	 * Used when the object is currently in the GGTT mmap.
> +	 */
>  	struct list_head userfault_link;
>  
> +	/** @mmo: struct containing mmo offsets and lock */
>  	struct {
> -		spinlock_t lock; /* Protects access to mmo offsets */
> +		/** @mmo.lock: protects access to @mmo.offsets */
> +		spinlock_t lock;
> +		/** @mmo.offsets: rbtree list of mmo offsets */
>  		struct rb_root offsets;
>  	} mmo;
>  
> +	/* private: used on selftest only */
>  	I915_SELFTEST_DECLARE(struct list_head st_link);
> +	/* public: */
>  
> +	/**
> +	 * @flags: object flags. Current flags are:
> +	 *
> +	 * %I915_BO_ALLOC_CONTIGUOUS:
> +	 *	Object requires to be allocated as a contiguous block
> +	 * %I915_BO_ALLOC_VOLATILE:
> +	 *	Volatile objects are marked as %DONTNEED while pinned, therefore
> +	 *	once unpinned the backing store can be discarded.
> +	 *	This is limited to kernel internal objects.
> +	 * %I915_BO_ALLOC_CPU_CLEAR:
> +	 *	Some internal device local-memory objects may have an option
> +	 *	to CPU clear the pages upon gathering the backing store.
> +	 *	Note that this might be before the blitter is usable, which
> +	 *	is the case for some internal GuC objects.
> +	 * %I915_BO_ALLOC_USER:
> +	 *	Make sure the object is cleared before any user access.
> +	 * %I915_BO_ALLOC_PM_VOLATILE:
> +	 *	Object is allowed to lose its contents on suspend / resume,
> +	 *	even if pinned
> +	 * %I915_BO_ALLOC_PM_EARLY:
> +	 *	Object needs to be restored early using memcpy during resume
> +	 * %I915_BO_ALLOC_GPU_ONLY:
> +	 *	Object is likely never accessed by the CPU. This will
> +	 *	prioritise the BO to be allocated in the non-mappable portion
> +	 *	of lmem. This is merely a hint, and if dealing with userspace
> +	 *	objects the CPU fault handler is free to ignore this.
> +	 * %I915_BO_READONLY:
> +	 *	User has created object as read-only
> +	 * %I915_BO_PROTECTED:
> +	 *	User has created protected. All protected objects and
> +	 *	contexts will be considered invalid when the PXP session
> +	 *	is destroyed and all new submissions using them will be
> +	 *	rejected. All intel contexts within the invalidated gem
> +	 *	contexts will be marked banned. Userspace can detect that
> +	 *	an invalidation has occurred via the %RESET_STATS ioctl,
> +	 *	where we report it the same way as a ban due to a hang.
> +	 */
>  	unsigned long flags;
>  #define I915_BO_ALLOC_CONTIGUOUS  BIT(0)
>  #define I915_BO_ALLOC_VOLATILE    BIT(1)
>  #define I915_BO_ALLOC_CPU_CLEAR   BIT(2)
>  #define I915_BO_ALLOC_USER        BIT(3)
> -/* Object is allowed to lose its contents on suspend / resume, even if pinned */
>  #define I915_BO_ALLOC_PM_VOLATILE BIT(4)
> -/* Object needs to be restored early using memcpy during resume */
>  #define I915_BO_ALLOC_PM_EARLY    BIT(5)
> -/*
> - * Object is likely never accessed by the CPU. This will prioritise the BO to be
> - * allocated in the non-mappable portion of lmem. This is merely a hint, and if
> - * dealing with userspace objects the CPU fault handler is free to ignore this.
> - */
>  #define I915_BO_ALLOC_GPU_ONLY	  BIT(6)
>  #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
>  			     I915_BO_ALLOC_VOLATILE | \
> @@ -343,15 +398,21 @@ struct drm_i915_gem_object {
>  #define I915_BO_PROTECTED         BIT(9)
>  #define I915_BO_WAS_BOUND_BIT     10
>  	/**
> -	 * @mem_flags - Mutable placement-related flags
> +	 * @mem_flags: Mutable placement-related flags
>  	 *
>  	 * These are flags that indicate specifics of the memory region
>  	 * the object is currently in. As such they are only stable
>  	 * either under the object lock or if the object is pinned.
> +	 * There are two flags:
> +	 *
> +	 * %I915_BO_FLAG_STRUCT_PAGE:
> +	 *	 Object backed by struct pages
> +	 * %I915_BO_FLAG_IOMEM:
> +	 *	Object backed by IO memory
>  	 */
>  	unsigned int mem_flags;
> -#define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pages */
> -#define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory */
> +#define I915_BO_FLAG_STRUCT_PAGE BIT(0)
> +#define I915_BO_FLAG_IOMEM       BIT(1)
>  	/**
>  	 * @cache_level: The desired GTT caching level.
>  	 *
> @@ -400,7 +461,7 @@ struct drm_i915_gem_object {
>  	 *
>  	 * Supported values:
>  	 *
> -	 * I915_BO_CACHE_COHERENT_FOR_READ:
> +	 * %I915_BO_CACHE_COHERENT_FOR_READ:
>  	 *
>  	 * On shared LLC platforms, we use this for special scanout surfaces,
>  	 * where the display engine is not coherent with the CPU cache. As such
> @@ -423,7 +484,7 @@ struct drm_i915_gem_object {
>  	 *
>  	 *	cache_coherent = 0
>  	 *
> -	 * I915_BO_CACHE_COHERENT_FOR_WRITE:
> +	 * %I915_BO_CACHE_COHERENT_FOR_WRITE:
>  	 *
>  	 * When writing through the CPU cache, the GPU is still coherent. Note
>  	 * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> @@ -509,23 +570,29 @@ struct drm_i915_gem_object {
>  	 */
>  	u16 write_domain;
>  
> +	/** @frontbuffer: pointer to the object's frontbuffer */
>  	struct intel_frontbuffer __rcu *frontbuffer;
>  
> -	/** Current tiling stride for the object, if it's tiled. */
> +	/**
> +	 * @tiling_and_stride: current tiling stride for the object,
> +	 * if it's tiled.
> +	 */
>  	unsigned int tiling_and_stride;
>  #define FENCE_MINIMUM_STRIDE 128 /* See i915_tiling_ok() */
>  #define TILING_MASK (FENCE_MINIMUM_STRIDE - 1)
>  #define STRIDE_MASK (~TILING_MASK)
>  
> +	/** @mm: struct containing mm-specific fields */
>  	struct {
> -		/*
> -		 * Protects the pages and their use. Do not use directly, but
> -		 * instead go through the pin/unpin interfaces.
> +		/**
> +		 * @mm.pages_pin_count: protects the pages and their use. Do
> +		 * not use directly, but instead go through the pin/unpin
> +		 * interfaces.
>  		 */
>  		atomic_t pages_pin_count;
>  
>  		/**
> -		 * @shrink_pin: Prevents the pages from being made visible to
> +		 * @mm.shrink_pin: Prevents the pages from being made visible to
>  		 * the shrinker, while the shrink_pin is non-zero. Most users
>  		 * should pretty much never have to care about this, outside of
>  		 * some special use cases.
> @@ -536,7 +603,7 @@ struct drm_i915_gem_object {
>  		 * __i915_gem_object_set_pages(). They will then be removed the
>  		 * shrinker list once the pages are released.
>  		 *
> -		 * The @shrink_pin is incremented by calling
> +		 * The @mm.shrink_pin is incremented by calling
>  		 * i915_gem_object_make_unshrinkable(), which will also remove
>  		 * the object from the shrinker list, if the pin count was zero.
>  		 *
> @@ -548,13 +615,13 @@ struct drm_i915_gem_object {
>  		atomic_t shrink_pin;
>  
>  		/**
> -		 * @ttm_shrinkable: True when the object is using shmem pages
> +		 * @mm.ttm_shrinkable: True when the object is using shmem pages
>  		 * underneath. Protected by the object lock.
>  		 */
>  		bool ttm_shrinkable;
>  
>  		/**
> -		 * @unknown_state: Indicate that the object is effectively
> +		 * @mm.unknown_state: Indicate that the object is effectively
>  		 * borked. This is write-once and set if we somehow encounter a
>  		 * fatal error when moving/clearing the pages, and we are not
>  		 * able to fallback to memcpy/memset, like on small-BAR systems.
> @@ -572,94 +639,143 @@ struct drm_i915_gem_object {
>  		bool unknown_state;
>  
>  		/**
> -		 * Priority list of potential placements for this object.
> +		 * @mm.placements: priority list of potential placements for
> +		 * this object.
>  		 */
>  		struct intel_memory_region **placements;
> +		/**
> +		 * @mm.n_placements: Size of @mm.placements.
> +		 */
>  		int n_placements;
>  
>  		/**
> -		 * Memory region for this object.
> +		 * @mm.region: memory region for this object.
>  		 */
>  		struct intel_memory_region *region;
>  
>  		/**
> -		 * Memory manager resource allocated for this object. Only
> -		 * needed for the mock region.
> +		 * @mm.res: Memory manager resource allocated for this object.
> +		 * Only needed for the mock region.
>  		 */
>  		struct ttm_resource *res;
>  
>  		/**
> -		 * Element within memory_region->objects or region->purgeable
> -		 * if the object is marked as DONTNEED. Access is protected by
> -		 * region->obj_lock.
> +		 * @mm.region_link: element within memory_region->objects or
> +		 * ``region->purgeable`` if the object is marked as %DONTNEED.
> +		 * Access is protected by ``region->obj_lock``.
>  		 */
>  		struct list_head region_link;
>  
> +		/** @mm.rsgt: refcounted sg-tables */
>  		struct i915_refct_sgt *rsgt;
> +		/** @mm.pages: pages pointer for GGTT entries */
>  		struct sg_table *pages;
> +		/**
> +		 * @mm.mapping: mapped pages of the object into kernel space.
> +		 * can be %NULL if unmapped.
> +		 */
>  		void *mapping;
>  
> +		/**
> +		 * @mm.page_sizes: Page sizes of the pages.
> +		 */
>  		struct i915_page_sizes page_sizes;
>  
> +		/* private: used on selftest only */
>  		I915_SELFTEST_DECLARE(unsigned int page_mask);
> +		/* public: */
>  
> +		/** @mm.get_page: */
>  		struct i915_gem_object_page_iter get_page;
> +		/** @mm.get_dma_page: */
>  		struct i915_gem_object_page_iter get_dma_page;
>  
>  		/**
> -		 * Element within i915->mm.shrink_list or i915->mm.purge_list,
> -		 * locked by i915->mm.obj_lock.
> +		 * @mm.link: element within ``i915->mm.shrink_list`` or
> +		 * ``i915->mm.purge_list``, locked by ``i915->mm.obj_lock``.
>  		 */
>  		struct list_head link;
>  
>  		/**
> -		 * Advice: are the backing pages purgeable?
> +		 * @mm.madv: Advice: are the backing pages purgeable?
>  		 */
>  		unsigned int madv:2;
>  
>  		/**
> -		 * This is set if the object has been written to since the
> -		 * pages were last acquired.
> +		 * @mm.dirty: this is set if the object has been written to
> +		 * since the pages were last acquired.
>  		 */
>  		bool dirty:1;
>  	} mm;
>  
> +	/** @ttm: struct containing TTM specific fields */
>  	struct {
> +		/** @ttm.cached_io_rsgt: cached refcounted sg-tables */
>  		struct i915_refct_sgt *cached_io_rsgt;
> +		/** @ttm.get_io_page: rbtree iterator to get IO pages */
>  		struct i915_gem_object_page_iter get_io_page;
> +		/** @ttm.backup: list of LMEM objects backed up at suspend */
>  		struct drm_i915_gem_object *backup;
> +		/** @ttm.created: indicate that object as created with TTM */
>  		bool created:1;
>  	} ttm;
>  
> -	/*
> -	 * Record which PXP key instance this object was created against (if
> -	 * any), so we can use it to determine if the encryption is valid by
> -	 * comparing against the current key instance.
> +	/**
> +	 * @pxp_key_instance: rRecord which PXP key instance this object was
> +	 * created against (if any), so we can use it to determine if the
> +	 * encryption is valid by comparing against the current key instance.
>  	 */
>  	u32 pxp_key_instance;
>  
> -	/** Record of address bit 17 of each page at last unbind. */
> +	/** @bit_17: Record of address bit 17 of each page at last unbind. */
>  	unsigned long *bit_17;
>  
>  	union {
>  #ifdef CONFIG_MMU_NOTIFIER
> +		/**
> +		 * @userptr: Struct which supports userptr data
> +		 * Only used when %CONFIG_MMU_NOTIFIER is enabled
> +		 */
>  		struct i915_gem_userptr {
> +			/** @userptr.ptr: pointer to the user-mapped ptr */
>  			uintptr_t ptr;
> +			/** @userptr.notifier_seq: */
>  			unsigned long notifier_seq;
>  
> +			/** @userptr.notifier: data used by MMU notifier */
>  			struct mmu_interval_notifier notifier;
> +			/** @userptr.pvec: S/G pages used by userptr */
>  			struct page **pvec;
> +			/**
> +			 * @userptr.page_ref: number of page references
> +			 * incremented when pages are in usage.
> +			 *
> +			 */
>  			int page_ref;
>  		} userptr;
>  #endif
>  
> +		/**
> +		 * @stolen: Used to identify an object allocated from
> +		 * stolen memory.
> +		 */
>  		struct drm_mm_node *stolen;
>  
> +		/**
> +		 * @bo_offset: The range start.
> +		 * Used only by TTM.
> +		 */
>  		resource_size_t bo_offset;
>  
> +		/** @scratch: physical size of huge gem object */
>  		unsigned long scratch;
> +		/** @encode: gen8 PDE encode address */
>  		u64 encode;
>  
> +		/**
> +		 * @gvt_info: contains a pointer to ``dmabuf_obj->info``
> +		 * Used only by gvt.
> +		 */
>  		void *gvt_info;
>  	};
>  };
> -- 
> 2.36.1
> 
