Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB47CB1B8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 19:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555610E08C;
	Mon, 16 Oct 2023 17:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADC010E08C;
 Mon, 16 Oct 2023 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697479121; x=1729015121;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/CGE9nmrMJuwK6Ghn1NusZsLY7v9Deg3SGSRrSBCtps=;
 b=H59ODCOTjtiQBgt8JMIfvBoZm6wmqMjHuFuBD1cxna5lWXE3X/xUe9Wr
 JCpY93pqIY94ErXhVZ8Vxeq1gfyDWjqCQvzWkMjBCkqtFUGLGcyD34EAR
 n8nV+K3dewaA02ZUXrmQSexx+mTYcTn7f1oD14WnL1uZ+4EtAo1JyjuBv
 KtILNvg7NuUz7I57u62z6TKnhS00MYZFxKQobxA6GExfEznnGrZIONxrK
 DfL1SX+DSvRD6rvsXHQlkLSCGUG/e7gJJXCFloiB+SqTNrvxTyIiOVVMM
 vyfU532pmcYZ/QUzgL0wYuwcI7jtNJMTxGkV2FcKboqSLWmz0GmZUHluT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365863575"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="365863575"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 10:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929446228"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="929446228"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 10:58:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 10:58:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 10:58:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 10:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnLa7Tu8gzA+NdbBEFp5vuS4aFTNyOp+garOwDNaE7ZakjWlM3PQn4IrU41V6kbDNiAwNxDFfIxgQhJTimmaqsab4VBrFRn94lTepxk5gB+zCi5j2SytjPOx0sNpOSUX0s5yCBGhpmosABuuYz7w8/qCj9IAuV6b/iJPkHtrkIcMlD8lJqe9KVqImCWnGefBbdrlh3yjHTacFjWi4055QtMjsoKxU/i95CBL0mAw/3g6ONOgQQY36ae4VI35WsxFIPZRJTRKYpVqWQW5DwiUtfN+QTX1CjXmWbXP5zB76vO3i3KJLeWNSX5VqLsI1bE4WYf1UL3DEUoPchZs+dmALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDfcJVPXIfPj6dx0VPo2Xc+82KckzmSAn1ZEFrjJ2VY=;
 b=CKFFybD4IkNnlndZ2JYN0av3WIz7oqXMRZYIe0FBL7UzBMYVLKsWDFEsUWUtL+8Jf4tUlC9kb6+ruqlKkjOzbWMSz3IKwXoIPdxgAjzafXY/XWPhYoVz3XQ8ao77CQf9vb/ydeDDJUaS43O5rE/qAZQJSrAv7C5FrfPg1b/UrnerjKmMZIyYh37efh45r8hNJRwGxEonJOy1sN8ptQLF7QiXWe8ejAgxgNdHBtWFI9rV3jOgVEcH4+m99LL3+ZgpXBx9Pd3Xv3m/voVsjDb4M8YKcq3ASRD7TI5vv1CkkUY+i9FdruHhEXGHekophrDGycYysdKAUHUzW62uah0G+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6704.namprd11.prod.outlook.com (2603:10b6:806:267::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 17:58:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 17:58:37 +0000
Date: Mon, 16 Oct 2023 13:58:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Allow users to disable waitboost
Message-ID: <ZS15yfr6/gFl+Qny@intel.com>
References: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
 <5f7f3950-bc9b-06cf-611c-46c360bb90e9@linux.intel.com>
 <915a5e08-5daf-153d-cb82-b0f9e5bd3b2a@intel.com>
 <6d8c7fd2-9eca-14fd-6b44-edeb15a6e6ac@linux.intel.com>
 <ZSmt1u9fVNDyMFgz@intel.com>
 <01fbd64b-bb38-0086-9aba-dc04a35d4bf1@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01fbd64b-bb38-0086-9aba-dc04a35d4bf1@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 466220dc-9641-48de-2b86-08dbce718584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggQb7mASsnkrUtiUAYtrnSwTfE7Qc+cK2U2VlMNwManSkkDi/ajSBgNiU8QBvNtanx8C5BDN+qRgyM7iveAFIVt5XyVIcfzZ8O98W+fcP6JtnhDA8L+XYD7RMMbI0SZgrLPT0UhkJ5xLICdBR/w5jWSbvdt3MuYmhzZ1iu/G2SDtCusWsugATqZ9Nnj4k3QpvTmv0dKs6D1hjTFzMB/ID5i8ZsObWThdppd0g0IYBZVu1ts/b3gk2KDBujNRNrkoYE0J/lh9W+XEkHhcvIVMC8JmrqhwoxIpSWQYdQ6KdbXkclKRJ6XKjNC61/1GxGBlGmTBtpsT3zkeCPfnlZgWM2Uer+Yv1Rxy2VROMn5c2Aa1tC2veZLNF6A0rquCrJ2T50yK4xnqQ4Wzio2B/9PSyV0yhZI6Ta4w/EVGNGbCagb1KvE80hV4DCrF+r5zodz2BYQ9T5MSup11QEsiPNUKKhxw3IIYigdZvyF5gSizU7MO/Cx4tCcn8RrOomrkEVvaYjafoCAxDh3BHrVl5AKx/gnErJwsSvV7bFZgDdAokAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6666004)(2616005)(53546011)(6506007)(5660300002)(4326008)(8936002)(8676002)(6512007)(6486002)(966005)(478600001)(83380400001)(26005)(41300700001)(66946007)(66556008)(66476007)(316002)(54906003)(6916009)(82960400001)(38100700002)(86362001)(36756003)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6APjucVDYQR6trYasQWK0z81LXWSzO4oF+36ve0ZTeW622ymG5iaodUf06?=
 =?iso-8859-1?Q?Hgi9wmo/CRHkTkAbNCTTbG0QPZin5AlBwEg5v0ZrInhXvmjtrB+cKZfu6G?=
 =?iso-8859-1?Q?/v/atIcbCKguHdwQaOZNnFUDIwD4/T4P67+fIx3pQLm4zush7ZchpPqafw?=
 =?iso-8859-1?Q?nM9/Qt9eM97tHoZ/Z6DEY15iM8tU36brVUAy1YB5weKEQ75FBlGqbibvq5?=
 =?iso-8859-1?Q?BLW+1nmR6AKTB8diXLKz5WaHWy3vp1CV9rHPys9UAIddPV32W3wwl7SJ8v?=
 =?iso-8859-1?Q?bfc7h0UEj0Jak6qRtmIGXgIF/TmT99wCIy7j8rxn0FJG4BZK0rUuLZNH7t?=
 =?iso-8859-1?Q?mRgCnIvl87jdMMxgXrWqzI0+h+p3DFeNK8o8Aub1VZIc/5zFLtAUQS39UY?=
 =?iso-8859-1?Q?zh8BBKarA77XlwR3gWhhG3duMF49I2cvxBP5NFKHtPGOrMbVQhdCHKARXE?=
 =?iso-8859-1?Q?k8X44YHiDIWkRAwAuWeLiH2XvkVbvq/w6jciGXFvpmc8Hdg5sVU666u2nx?=
 =?iso-8859-1?Q?p2N5V0K4Cxd85Dxo6yXo50b2D7WSa7f3AJ35OOUGpVd4wS9hE9D5HaRRdb?=
 =?iso-8859-1?Q?eCnSvIqDcwNEO3z+LQ/qYlvweNvT9kInh4nQSlz5Pcefe0mP8AgMN+djBU?=
 =?iso-8859-1?Q?QYSJbFlnDgAa6a/cBDhSX9m0oYNElgEx0lPR9MGKpU3EbZKviYnPekZ7g6?=
 =?iso-8859-1?Q?KMy0mUix+xR8ZfZRtExvH23cstr4XOU4tr1zYnCg4O1ZktxFHE9aKCwrJS?=
 =?iso-8859-1?Q?ogNm/zG5CVGQ9Uw597ktmZLYs6IQoCYg50SOOVn44dEAumsDHWE2dEL1G9?=
 =?iso-8859-1?Q?uMi6HUDc6yfdjIw6QUd6cEUpIMn+euz02B8Tob5/iWEU+qY5q+YzpgoXbn?=
 =?iso-8859-1?Q?ghPQP7fDj8qidzH82vozQUZfe//52ypAmRf/rGTHuAajLhnGw+XNnLT2DE?=
 =?iso-8859-1?Q?CDEQ+8UPtbOFXp3nbzrL2ZXaRzCiwP2nlE0pkKq7HZ+7BdUB3Jv/3hVWZf?=
 =?iso-8859-1?Q?t3GNGyEbI0EYeW7XhQ8wXZlDIPmb3fAxcMiewnvuFagoQ9yjYwqgBQ7qGM?=
 =?iso-8859-1?Q?I8mhCSlhSiSaFeW4JenXTAx5Duj4X1sqqHrO6ZZxZmkT5WM7Yoz+QJtXMi?=
 =?iso-8859-1?Q?amXlSzFwt5HM8LUWDGQTmHKd2ViOyIHNVoudV+GNVAUHbT7+89y2d9QFno?=
 =?iso-8859-1?Q?O8es3iR5H4qZaIG1l5W9BNkVg00pQx+M9iE7btRCVqVs07KLmTAf9SNM8C?=
 =?iso-8859-1?Q?FyAFk9vI5wxUt3hE0DNaTNeFKy9wK8Nk4qyH7+M5uTvH1ov6BVSBrTfI98?=
 =?iso-8859-1?Q?++GrZLozLlYa6E9+orVuz/CTqDT899B7Btb0hMiTdunqMjjj8dhrE8ovB2?=
 =?iso-8859-1?Q?a7gJzVfG4ChLelP0GrReA0m7rqH4KES73ozEV/tqRxbF2vTBeqUkc5YEJ0?=
 =?iso-8859-1?Q?R1VMKBew3R30x9p2Vly7D+nPDzJR9kxFsMrNxJxJ6CJMKy7ZTMoVyVAxZ9?=
 =?iso-8859-1?Q?56tIBRLffb4vxLq1DICA8CJnFHmDQAMpKSw1/3CUJlZzj3JohVWR2Ti8sW?=
 =?iso-8859-1?Q?ohRRkQlnpLaeimo4yQ150oY+/XAF+csSqc05DUpqJ8USpWiiP44eRgI6BE?=
 =?iso-8859-1?Q?Ks/TuYjEerkyh6zBvKB7rV0/4emAPWQg4V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 466220dc-9641-48de-2b86-08dbce718584
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 17:58:37.3378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtrAc3fQ3asrV0BrGKtxy1OyrBEJd658Vsm1uoA3QkuCXtTK1BNi7V5us9RHBRFg4EGZwHmA1UoFFc09z6aUYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6704
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

On Mon, Oct 16, 2023 at 09:02:38AM +0100, Tvrtko Ursulin wrote:
> 
> On 13/10/2023 21:51, Rodrigo Vivi wrote:
> > On Thu, Sep 28, 2023 at 01:48:34PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 27/09/2023 20:34, Belgaumkar, Vinay wrote:
> > > > 
> > > > On 9/21/2023 3:41 AM, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 20/09/2023 22:56, Vinay Belgaumkar wrote:
> > > > > > Provide a bit to disable waitboost while waiting on a gem object.
> > > > > > Waitboost results in increased power consumption by requesting RP0
> > > > > > while waiting for the request to complete. Add a bit in the gem_wait()
> > > > > > IOCTL where this can be disabled.
> > > > > > 
> > > > > > This is related to the libva API change here -
> > > > > > Link: https://github.com/XinfengZhang/libva/commit/3d90d18c67609a73121bb71b20ee4776b54b61a7
> > > > > 
> > > > > This link does not appear to lead to userspace code using this uapi?
> > > > We have asked Carl (cc'd) to post a patch for the same.
> > > 
> > > Ack.
> > 
> > I'm glad to see that we will have the end-to-end flow of the high-level API.
> > 
> > > 
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/i915/gem/i915_gem_wait.c | 9 ++++++---
> > > > > >    drivers/gpu/drm/i915/i915_request.c      | 3 ++-
> > > > > >    drivers/gpu/drm/i915/i915_request.h      | 1 +
> > > > > >    include/uapi/drm/i915_drm.h              | 1 +
> > > > > >    4 files changed, 10 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > > > index d4b918fb11ce..955885ec859d 100644
> > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> > > > > > @@ -72,7 +72,8 @@ i915_gem_object_wait_reservation(struct
> > > > > > dma_resv *resv,
> > > > > >        struct dma_fence *fence;
> > > > > >        long ret = timeout ?: 1;
> > > > > >    -    i915_gem_object_boost(resv, flags);
> > > > > > +    if (!(flags & I915_WAITBOOST_DISABLE))
> > > > > > +        i915_gem_object_boost(resv, flags);
> > > > > >          dma_resv_iter_begin(&cursor, resv,
> > > > > >                    dma_resv_usage_rw(flags & I915_WAIT_ALL));
> > > > > > @@ -236,7 +237,7 @@ i915_gem_wait_ioctl(struct drm_device *dev,
> > > > > > void *data, struct drm_file *file)
> > > > > >        ktime_t start;
> > > > > >        long ret;
> > > > > >    -    if (args->flags != 0)
> > > > > > +    if (args->flags != 0 || args->flags != I915_GEM_WAITBOOST_DISABLE)
> > > > > >            return -EINVAL;
> > > > > >          obj = i915_gem_object_lookup(file, args->bo_handle);
> > > > > > @@ -248,7 +249,9 @@ i915_gem_wait_ioctl(struct drm_device *dev,
> > > > > > void *data, struct drm_file *file)
> > > > > >        ret = i915_gem_object_wait(obj,
> > > > > >                       I915_WAIT_INTERRUPTIBLE |
> > > > > >                       I915_WAIT_PRIORITY |
> > > > > > -                   I915_WAIT_ALL,
> > > > > > +                   I915_WAIT_ALL |
> > > > > > +                   (args->flags & I915_GEM_WAITBOOST_DISABLE ?
> > > > > > +                    I915_WAITBOOST_DISABLE : 0),
> > > > > >                       to_wait_timeout(args->timeout_ns));
> > > > > >          if (args->timeout_ns > 0) {
> > > > > > diff --git a/drivers/gpu/drm/i915/i915_request.c
> > > > > > b/drivers/gpu/drm/i915/i915_request.c
> > > > > > index f59081066a19..2957409b4b2a 100644
> > > > > > --- a/drivers/gpu/drm/i915/i915_request.c
> > > > > > +++ b/drivers/gpu/drm/i915/i915_request.c
> > > > > > @@ -2044,7 +2044,8 @@ long i915_request_wait_timeout(struct
> > > > > > i915_request *rq,
> > > > > >         * but at a cost of spending more power processing the workload
> > > > > >         * (bad for battery).
> > > > > >         */
> > > > > > -    if (flags & I915_WAIT_PRIORITY && !i915_request_started(rq))
> > > > > > +    if (!(flags & I915_WAITBOOST_DISABLE) && (flags &
> > > > > > I915_WAIT_PRIORITY) &&
> > > > > > +        !i915_request_started(rq))
> > > > > >            intel_rps_boost(rq);
> > > > > >          wait.tsk = current;
> > > > > > diff --git a/drivers/gpu/drm/i915/i915_request.h
> > > > > > b/drivers/gpu/drm/i915/i915_request.h
> > > > > > index 0ac55b2e4223..3cc00e8254dc 100644
> > > > > > --- a/drivers/gpu/drm/i915/i915_request.h
> > > > > > +++ b/drivers/gpu/drm/i915/i915_request.h
> > > > > > @@ -445,6 +445,7 @@ long i915_request_wait(struct i915_request *rq,
> > > > > >    #define I915_WAIT_INTERRUPTIBLE    BIT(0)
> > > > > >    #define I915_WAIT_PRIORITY    BIT(1) /* small priority bump
> > > > > > for the request */
> > > > > >    #define I915_WAIT_ALL        BIT(2) /* used by
> > > > > > i915_gem_object_wait() */
> > > > > > +#define I915_WAITBOOST_DISABLE    BIT(3) /* used by
> > 
> > maybe name it I915_WAIT_NO_BOOST to align a bit better with the existent ones?
> 
> I thought it would be better to not mention wait boost in the uapi, but
> leave it as implementation detail.
> 
> My suggestion was along the lines of I915_GEM_WAIT_BACKGROUND/IDLE.

good idea!

> 
> In essence saying allowing userspace to say this is not an important wait.
> Yes, it implies that other waits are (more) important, but I think this is
> still better than starting to mention wait boost in the uapi. Since that
> would kind of cement it exists, while we always just viewed it as an "go
> faster" driver internal heuristics and could freely decide not to employ it
> even for default waits.
> 
> Historically even we had a period when waits were getting elevated
> scheduling priority. We removed it, would have to dig through git and email
> history to remember exactly why, but probably along the lines that it is not
> always justified. Same as waitboost is not always justified and can be
> harmful.
> 
> So I think a generic name for the uapi leaves more freedom for the driver.
> Might be a wrong name that I am suggesting and should be something else, not
> sure.
> 
> [Comes back later.]
> 
> eec39e441c29 ("drm/i915: Remove wait priority boosting")
> 
> So it seems we only removed it because corner cases with the current
> scheduler were hard. Unfortunately improved deadline based scheduler never
> got in despite being ready so we can not restore this now.
> 
> > > > > > i915_gem_object_wait() */
> > > > > >      void i915_request_show(struct drm_printer *m,
> > > > > >                   const struct i915_request *rq,
> > > > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > > > index 7000e5910a1d..4adee70e39cf 100644
> > > > > > --- a/include/uapi/drm/i915_drm.h
> > > > > > +++ b/include/uapi/drm/i915_drm.h
> > > > > > @@ -1928,6 +1928,7 @@ struct drm_i915_gem_wait {
> > > > > >        /** Handle of BO we shall wait on */
> > > > > >        __u32 bo_handle;
> > > > > >        __u32 flags;
> > > > > > +#define I915_GEM_WAITBOOST_DISABLE      (1u<<0)
> > > > > 
> > > > > Probably would be good to avoid mentioning waitboost in the uapi
> > > > > since so far it wasn't an explicit feature/contract. Something like
> > > > > I915_GEM_WAIT_BACKGROUND_PRIORITY? Low priority?
> > > > sure.
> > > > > 
> > > > > I also wonder if there could be a possible angle to help Rob (+cc)
> > > > > upstream the syncobj/fence deadline code if our media driver might
> > > > > make use of that somehow.
> > > > > 
> > > > > Like if either we could wire up the deadline into GEM_WAIT (in a
> > > > > backward compatible manner), or if media could use sync fd wait
> > > > > instead. Assuming they have an out fence already, which may not be
> > > > > true.
> > > > 
> > > > Makes sense. We could add a SET_DEADLINE flag or something similar and
> > > > pass in the deadline when appropriate.
> > > 
> > > Rob - do you have time and motivation to think about this angle at all
> > > currently? If not I guess we just proceed with the new flag for our
> > > GEM_WAIT.
> > 
> > Well, this could be the first user for that uapi that Rob was proposing
> > indeed.
> > 
> > The downside is probably because we should implement the deadline in i915
> > and consider all the deadline as 0 (urgent) and boost, unless in this
> > case where before the gem_wait the UMD would use the set_deadline to
> > something higher (max?).
> > 
> > Well, if we have a clarity on how to proceed with the deadline we should
> > probably go there. But for simplicity I would be in favor of this proposed
> > gem_wait flag as is, because this already solves many real important cases.
> 
> Yes I don't think we had consensus on the semantics of when no deadline is
> set, so it does sound better to proceed with i915 specific solution for now.
> The two wouldn't be incompatible if deadlines were later added.
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > Vinay.
> > > > 
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Tvrtko
> > > > > 
> > > > > >        /** Number of nanoseconds to wait, Returns time remaining. */
> > > > > >        __s64 timeout_ns;
> > > > > >    };
