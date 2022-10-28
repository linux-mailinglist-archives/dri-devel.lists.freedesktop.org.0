Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5571611DE5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 01:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4B310E8FD;
	Fri, 28 Oct 2022 23:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083C310E8FA;
 Fri, 28 Oct 2022 23:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666998264; x=1698534264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+UnSR9eiK2GiptKkoUP+u7dJ4nTJh8l+O3papCLehB8=;
 b=nDhN5tWmX/Y2QEIPGIlXb6Br3ZouOfy8sm0VgrT1ttKb/mPDqOzEpd5D
 v43/HefeShxmqy+Q5pQfaXlk4qsXqqt6EZzk7h+CoEhcM7vXwDqtbob+L
 YkKfalcyfIECwYFl92W7hT/r/nQP2/IuCqosjlwearelj+tRAqz6ZKGdC
 OXmwpupgAtlUzHZGl64pNdIAQj3vDvT0Ki6sAv7xI7u0qcl8aJo0GLXL/
 dWw+mTDWGljUZm96eHWYx3VtUoOhZN2ef5y9V1YNN97KkTjHEjIPaW/EN
 ObZZDF+wBCa4jLIjSRPlN+Nuurpa6Wm/7WmNAUxqp8ilGpFTXk4K1T9Lz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="370683346"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="370683346"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 16:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="758252938"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="758252938"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Oct 2022 16:04:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 16:04:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 16:04:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 16:04:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 16:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et1ILlA0WVtMfTYvZTCiT7K1lSx5u2I3skfUdegXskEDynL1TcIjnvctB7LuobBFJ52O8Z4t/uMaaMo3h1avXio0UbSy1qeIcu3j8otAywabo74ugUUDKFMPq71u6tKCI5WcBbvZAGdt/3lvrjFAuKkSCE2x0wdyNPH8HAQ5aaaOk/Or5ysgmW0c2m4EL8BQDOgdcvh6FcdaTBjo76esHIOdl20qboEin1eid2tURm9Zn3eRAUIv7pEE2EbT/MfHFAI6OunzYxK9bEx7lNEMwG9s2+jrIqIKJx2QCRziCvtpRodowxZjGqouo2sgSDVnf7N0GuBQsBdaiPe+PKEdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQ2aaw6OsU7XukBmuqL/JB6ykrecsD5c/76cdd1mRiA=;
 b=ajyr7JcVmaUaPvH7PA71PjCCDgo/hsxHhnT9zz/km4QI+hMlsfmdqjzqHJON0TorkI9rhKhYLh6G4SaZSBaL9mGH3M3fsYiBz6kTudMli3EDQIWZ+ANZiAD4OZdSRKdOk+uSlyTMm/i66EK9BxriCmZmR25RPkOcBpWRhrZ4yu+07pVBLKpKeu5SY8pnRaoDh40y71dk7qNpz+45jQkd+ZdxxpPTItsyWk6CUZHmkzTjp0CLUboxdYkik92UVc/VyzphZE17qf0sYOIn9qwcqKpU+td4FxquzsSZ5OJs2uII4Onmz+qCWoqy+km+afaxKQ3UIUrXZ5Ntq8mWyp7Asg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5599.namprd11.prod.outlook.com (2603:10b6:a03:3af::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 23:04:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e419:2f63:eb0c:8ab]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e419:2f63:eb0c:8ab%3]) with mapi id 15.20.5723.040; Fri, 28 Oct 2022
 23:04:20 +0000
Date: Fri, 28 Oct 2022 16:04:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add missing steering table
 terminators
Message-ID: <20221028230418.y4czdjjzxro7gvcd@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221028224022.964997-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221028224022.964997-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bc4708-8774-4d56-3a7e-08dab938bf17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmIz26bcF29G3f1WudQ8WZ3Y3uiMbS+ziTiRvOzYmBvGbtT2iCT/Ql3NrQnrtMzHoubkmisRIgfgzWrERVh20kRQpyqWLNPYhG4DebsnoOxyjM/lsvP09ed9dwfIdF0ZtsKB5mHpBwOAdPYO/kLX95HlTGMTEm6m0LA4ZmbRo6tLzR2asl4S7XefRiU6pSjGssPEoaGnyJjHH7kJ4YTQOfvqXrgCiC4ZVWguwaB9ZWRp+4kweR/onlDF2tTd6oU1FPGuAmBDOJm+8oYvBIXnvfG1tpl5iXnjrA0DRjsS6/BbY388TEYcFQnHu327c7T8/Hqxv1UKv0zo0gX01WZFfn6TeuG82itvnbcXvOzNtkmZg/Sk743cAHL+YybRBsRhlNByFkX59/6xWBnU+Fxrx6KRHpwkc7OPETEDHJGXDnm5zqHDjNMFT5vqyF+mi7TiznQq9N9UJSoCYc0G5uvxAXTteWE3mFuZHYsIOwSGFlsvMBiJa7LCt00BHK9kGBpllcYibvW1m46EeCUQTR5VBTFq+j3tUxLc4rwxe3q335JV7m7wY6sqXVbn6aeeh4KVeUshV8w7JqhuI5GShiA5PB2xHP8jAN8PpfvUgTrTTB3JcVrc8kWBFSj5h42c2HsTfy4KPKI4Y9Ni5f2K7B5ruYeaObrYSpjSIRI8pOhONv5nkhlfkWV3CPdEu6pp2nhe6Kf1FSvp72ggQFARPh7kOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199015)(86362001)(83380400001)(38100700002)(82960400001)(2906002)(5660300002)(6506007)(66476007)(66946007)(4326008)(8676002)(66556008)(6862004)(41300700001)(8936002)(9686003)(1076003)(186003)(6512007)(26005)(450100002)(6636002)(6486002)(478600001)(316002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oUS1xpxABqD9Qe5gb7hvjIAbBL9nu2jGA7mU+QRpp9RTQ4Ak4Jhmhxr1RAiF?=
 =?us-ascii?Q?vgF+9dkTsfTb0C78EpBM8StYG3EuaAjzd3hqYrZrLlZbcqVNBvI55cRi3BqP?=
 =?us-ascii?Q?kRDVoADUBljS3RWih+z2EHxzROtDaawiU27OfjO3AQ2JY+aF3iOZExQKmqkH?=
 =?us-ascii?Q?UJCDKh/3/+3YTtSda0FHlM5dZifZgdBp8IgwLnjIKwXqjnRrs6NDnaUBjMco?=
 =?us-ascii?Q?Szz7vR0WmG8esPnhAdTNNZwiyXVeHRhrepijiqAwQ0PxFBxisRos+q/NnShu?=
 =?us-ascii?Q?f2/R4J8wKqdW6I7GEMYfZ4mQ23M27FSTd/EHIe95A8v/FrNCgVKB2Rwn84po?=
 =?us-ascii?Q?bOT603Uq69ACAvkFQFVhQ7UN8i5M34DV2/V+S6hjf6BLFGnEC0vllSUilw7m?=
 =?us-ascii?Q?JgHM6BpMwYWsHm0KIGD6QDkMUteURc+JAPZZdN4b/ZYoPFQc+/11umxA5eJX?=
 =?us-ascii?Q?ywSovRhs3BcspjPKQD2g1JVYbHmUXT+w/AN9+fcvNhnHVNzoJzj8rZKcQCox?=
 =?us-ascii?Q?aE2kx1/lKJZ1GlvY6vm2dCoqOUyN9/I9yAsocB61h1y3HIcnA3WU4omvP0FQ?=
 =?us-ascii?Q?7nDF78xL6+3y366LXJl1ryJrMS87ifIuBfO1DM7cJOQ8ErM7CqqhBFvRpqYF?=
 =?us-ascii?Q?H7bc03boqsyVrH+qh1mGQiaxdFtVxI8k72EWW4oqpqDlB1Q8ivfiQoZctTQ4?=
 =?us-ascii?Q?3tTAVkig08Vf/ucx8H9wWV7mO0vkWB88mN/2BAzq1Gse7ZgcgRq8eXe/kGo/?=
 =?us-ascii?Q?LL/YNEHhEFhfJqrwMyhkiGhddjs6g8BiOH6DWUtT1k3PZyMCu2GF5mnLbRvq?=
 =?us-ascii?Q?gO5eqC503i4k28kMPXYSeZgprNKUD+dUA9r8g1SLe9QLefkfapXX31AyIwMX?=
 =?us-ascii?Q?xU1KVLcY/OgkMBAkje3UAUDTaM4fUnAmc3uL38NJeOc2JWvGXGSY3accDoFr?=
 =?us-ascii?Q?07XOXU9NAdGYOV+WbJeXSWo040c/7gwjoj/am1eH1KiEke2dClodVt/Oae5B?=
 =?us-ascii?Q?fOdTBcMhxDQZQBrbby1ggn7dYuCbpDmp6Ckg1/aw2/gU9y7bU1LQDNNpmS7t?=
 =?us-ascii?Q?suLPC+GqUnSrJt/DB9WrN9R+YxQnyg+m+eeYtKAx9QmJImad74PZcG8Ehymt?=
 =?us-ascii?Q?IcqQrMQdkdOSCLF8cQ00SsrlAf804Uo/wxM2kOfURWcDNbew67Ot0Upf8Rb0?=
 =?us-ascii?Q?wqiaNASfoXUppt4oh50dy4B4uz+lPBoEvO8tYX1szeL+QALHWCOzFGrGNwbD?=
 =?us-ascii?Q?a8OHcQpSYK4AS6v8Kepj9499ce0PNVFCFZyG3hXls3YZhNHy1mEIsfYrONOf?=
 =?us-ascii?Q?g1GDHxhAR/95r+vY46Y/1ZrdnpIa+LW5J4rNNsIh7lWqtjLZuTPcAGv30qiJ?=
 =?us-ascii?Q?U0eNwhlEwmDah7PUqb0Ds19aEAKXNDYMlqiNqngeOBU46Xccy7wXV1volrC0?=
 =?us-ascii?Q?YK7lONxNj1PT3C3YgBq/FOQxBGJdJ+GwM5xvOe6o+6ugwaW0eHPM0K0MbkQk?=
 =?us-ascii?Q?YDMaH5eDPwdqW7/Qnp91gIbWUIVB7c6ldsZtY2tuOIjuC6xG8jzrwbI02gPN?=
 =?us-ascii?Q?X4ncNuq1HmQ2sjZbxXQxjETxG42CBmANQOMPwSNXZMSeAnGT9L7dpNuDyKrE?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bc4708-8774-4d56-3a7e-08dab938bf17
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 23:04:20.3655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wqa+QtD/O4TkqVbU6xzQNS1tXnmtReiLtJ7IDz/AAHCPIXaq/qoJJfxOuTd9LCmo4ivG4iTOuhTjsTm1eanC13cH4ARHi9G5+7JTLca26w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5599
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 03:40:22PM -0700, Matt Roper wrote:
>The termination entries were missing for a couple of the recently-added
>MTL steering tables.
>
>Fixes: f32898c94a10 ("drm/i915/xelpg: Add multicast steering")
>Fixes: a7ec65fc7e83 ("drm/i915/xelpmp: Add multicast steering for media GT")

I was thinking if we would need separate commits so they can be
backported independently, but no... those commits were very close.

>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>index 46cf2f3d1e8e..830edffe88cc 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>@@ -128,11 +128,13 @@ static const struct intel_mmio_range xelpg_dss_steering_table[] = {
> 	{ 0x00D800, 0x00D87F },		/* SLICE */
> 	{ 0x00DC00, 0x00DCFF },		/* SLICE */
> 	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
>+	{},
> };
>
> static const struct intel_mmio_range xelpmp_oaddrm_steering_table[] = {
> 	{ 0x393200, 0x39323F },
> 	{ 0x393400, 0x3934FF },
>+	{},
> };
>
> void intel_gt_mcr_init(struct intel_gt *gt)
>-- 
>2.37.3
>
